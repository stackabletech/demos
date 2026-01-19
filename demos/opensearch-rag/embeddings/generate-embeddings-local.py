#!/usr/bin/env python3
"""
Local script to generate embeddings for Stackable documentation.
This script crawls docs.stackable.tech, generates embeddings, and saves to JSON.

Prerequisites:
- pip install requests beautifulsoup4
- Ollama running locally or port-forwarded from the demo with nomic-embed-text:v1.5 model:
  - ollama pull nomic-embed-text:v1.5

Output:
  stackable-docs-embeddings.json - File containing all documents with embeddings
"""
import json
import os
import time
import requests
from dataclasses import dataclass, asdict
from urllib.parse import urljoin, urlparse
from typing import List, Dict, Set
from concurrent.futures import ThreadPoolExecutor, as_completed
from bs4 import BeautifulSoup

# Configuration
OLLAMA_HOST = 'localhost'
OLLAMA_PORT = 11434
EMBEDDING_MODEL = 'nomic-embed-text:v1.5'  # Pinned version for reproducibility
OUTPUT_FILE = 'stackable-docs-embeddings.json'

# Crawler configuration
RELEASE = os.getenv('RELEASE', 'stable')  # Stackable release to crawl (stable, nightly, 24.11, etc)
BASE_URL = "https://docs.stackable.tech/"
START_URL = f"https://docs.stackable.tech/home/{RELEASE}/"
MAX_PAGES = 10000  # High limit to crawl all pages (safety check for infinite loops)
TARGET_CHUNK_SIZE = 1200
MAX_CHUNK_SIZE = 3000
MIN_CHUNK_SIZE = 400

# Filtering configuration
TARGET_CHUNK_COUNT = 5000
PRIORITY_KEYWORDS = ['first steps', 'getting started', 'installation', 'quick start', 'quickstart',
                     'deploy', 'deployment', 'setup', 'configure', 'configuration', 'usage', 'security', 'example', 'tutorial']
FOUNDATIONAL_KEYWORDS = ['first steps', 'getting started', 'quick start', 'quickstart', 'minimal', 'simple example', 'basic example']


@dataclass
class DocumentChunk:
    """Represents a documentation chunk with metadata and embedding."""
    title: str
    content: str
    embedding: List[float]
    category: str
    section: str
    operator: str
    url: str
    hierarchy: List[str]
    timestamp: str
    char_count: int
    has_code_block: bool

    def to_dict(self) -> dict:
        """Convert to dictionary for JSON serialization."""
        return asdict(self)


def check_ollama():
    """Check if Ollama is running and has the required model."""
    print("Checking Ollama...")
    try:
        response = requests.get(f'http://{OLLAMA_HOST}:{OLLAMA_PORT}/api/tags', timeout=5)
        response.raise_for_status()
        models = response.json().get('models', [])
        model_names = [m['name'] for m in models]

        print(f"[OK] Ollama is running with {len(models)} models")

        if not any(EMBEDDING_MODEL in name for name in model_names):
            print(f"\n[ERROR] {EMBEDDING_MODEL} model not found!")
            print(f"Please run: ollama pull {EMBEDDING_MODEL}")
            return False

        print(f"[OK] {EMBEDDING_MODEL} model is available")
        return True
    except Exception as e:
        print(f"\n[ERROR] Cannot connect to Ollama at {OLLAMA_HOST}:{OLLAMA_PORT}")
        print(f"Error: {e}")
        print("\nPlease ensure Ollama is running:")
        print("  - Download from: https://ollama.ai/")
        print(f"  - Pull model: ollama pull {EMBEDDING_MODEL}")
        return False


def get_embedding(text, retries=10, initial_backoff=2, max_backoff=120):
    """Generate embedding for text using Ollama with exponential backoff retry logic."""
    for attempt in range(retries):
        try:
            response = requests.post(
                f'http://{OLLAMA_HOST}:{OLLAMA_PORT}/api/embeddings',
                json={'model': EMBEDDING_MODEL, 'prompt': text},
                timeout=60
            )
            response.raise_for_status()
            return response.json()['embedding']
        except requests.exceptions.RequestException as e:
            if attempt < retries - 1:
                # Exponential backoff with cap: 2s, 4s, 8s, 16s, 32s, 64s, 120s, 120s, 120s
                wait_time = min(initial_backoff * (2 ** attempt), max_backoff)
                print(f"  Retry {attempt + 1}/{retries - 1} after {wait_time}s: {e}")
                time.sleep(wait_time)
            else:
                raise


def fetch_page(url: str):
    """Fetch and parse HTML page."""
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return BeautifulSoup(response.text, 'html.parser')
    except Exception as e:
        print(f"Error fetching {url}: {e}")
        return None


def extract_main_content(soup):
    """Extract main article content, excluding navigation and chrome."""
    content = soup.find('article') or soup.find('main') or soup.find('div', class_='doc')
    if not content:
        content = soup.find('body')
    for element in content.find_all(['nav', 'footer', 'aside']):
        element.decompose()
    return content


def categorize_url(url: str) -> Dict[str, str]:
    """Categorize URL into section and category."""
    parsed = urlparse(url)
    path_parts = [p for p in parsed.path.split('/') if p]

    category = 'general'
    section = 'documentation'
    operator = None

    if len(path_parts) >= 3:
        if path_parts[2] in ['airflow', 'druid', 'hbase', 'hdfs', 'hive', 'kafka',
                              'nifi', 'opensearch', 'spark-k8s', 'superset', 'trino',
                              'zookeeper', 'commons', 'listener', 'opa', 'secret']:
            category = 'operator'
            section = path_parts[2]
            operator = f"{path_parts[2]}-operator"
        elif path_parts[2] == 'management':
            category = 'management'
            section = path_parts[3] if len(path_parts) > 3 else 'management'
        elif path_parts[2] == 'platform':
            category = 'platform'
            section = path_parts[3] if len(path_parts) > 3 else 'platform'
        elif path_parts[2] == 'concepts':
            category = 'concepts'
            section = path_parts[3] if len(path_parts) > 3 else 'concepts'

    return {'category': category, 'section': section, 'operator': operator or section}


def extract_sections(content, url: str) -> List[Dict]:
    """Extract sections with hierarchy from content."""
    url_info = categorize_url(url)
    sections = []
    current_section = {
        'hierarchy': [],
        'content': [],
        'code_blocks': [],
        'url': url,
        'category': url_info['category'],
        'section': url_info['section'],
        'operator': url_info['operator']
    }

    for element in content.find_all(['h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'p', 'pre', 'div', 'ul', 'ol', 'table', 'dl']):
        if element.name in ['h1', 'h2', 'h3', 'h4', 'h5', 'h6']:
            if current_section['content']:
                sections.append(current_section.copy())
            level = int(element.name[1])
            title = element.get_text(strip=True)

            # Extract heading ID for URL anchor
            heading_id = element.get('id', '')
            section_url = url
            if heading_id:
                section_url = f"{url}#{heading_id}"

            current_section['hierarchy'] = current_section['hierarchy'][:level-1] + [title]
            current_section['content'] = [title]
            current_section['code_blocks'] = []
            current_section['url'] = section_url
        elif element.name == 'pre' or (element.name == 'div' and 'listingblock' in element.get('class', [])):
            code = element.get_text(strip=False)
            if code and len(code) > 10:
                current_section['code_blocks'].append(code)
                current_section['content'].append(f"\n[CODE BLOCK]\n{code}\n[/CODE BLOCK]\n")
        elif element.name == 'div' and 'admonitionblock' in element.get('class', []):
            # Extract admonition blocks (NOTE, TIP, WARNING, etc.)
            admonition_type = None
            for cls in element.get('class', []):
                if cls in ['note', 'tip', 'warning', 'important', 'caution']:
                    admonition_type = cls.upper()
                    break

            # Get the content from the admonition
            content_td = element.find('td', class_='content')
            if content_td:
                admonition_text = content_td.get_text(strip=True)
                if admonition_text:
                    prefix = f"[{admonition_type}] " if admonition_type else "[NOTE] "
                    current_section['content'].append(f"{prefix}{admonition_text}")
        elif element.name in ['ul', 'ol']:
            # Extract list items
            list_items = element.find_all('li', recursive=False)
            if list_items:
                list_text = '\n'.join([f"- {li.get_text(strip=True)}" for li in list_items if li.get_text(strip=True)])
                if list_text:
                    current_section['content'].append(list_text)
        elif element.name == 'dl':
            # Extract definition lists
            definitions = []
            dt_elements = element.find_all('dt', recursive=False)
            for dt in dt_elements:
                term = dt.get_text(strip=True)
                # Find the associated dd element
                dd = dt.find_next_sibling('dd')
                if dd:
                    definition = dd.get_text(strip=True)
                    if term and definition:
                        definitions.append(f"{term}: {definition}")
            if definitions:
                current_section['content'].append('\n'.join(definitions))
        elif element.name == 'table':
            # Extract table content (skip admonition tables)
            if not element.find_parent('div', class_='admonitionblock'):
                table_text = []
                rows = element.find_all('tr')
                for row in rows:
                    cells = row.find_all(['th', 'td'])
                    if cells:
                        row_text = ' | '.join([cell.get_text(strip=True) for cell in cells])
                        if row_text:
                            table_text.append(row_text)
                if table_text:
                    current_section['content'].append('\n'.join(table_text))
        elif element.name == 'p':
            text = element.get_text(strip=True)
            if text and len(text) > 20:
                current_section['content'].append(text)

    if current_section['content']:
        sections.append(current_section)
    return sections


def chunk_section(section: Dict) -> List[Dict]:
    """Chunk a section into smaller pieces if needed."""
    full_text = '\n\n'.join(section['content'])

    if len(full_text) <= MAX_CHUNK_SIZE:
        return [{
            'text': full_text,
            'hierarchy': section['hierarchy'],
            'url': section['url'],
            'category': section['category'],
            'section': section['section'],
            'operator': section['operator'],
            'has_code_block': len(section['code_blocks']) > 0,
            'char_count': len(full_text)
        }]

    chunks = []
    current_chunk = []
    current_size = 0
    hierarchy_text = ' > '.join(section['hierarchy'])
    breadcrumb = f"# {section['section'].title()} > {hierarchy_text}\n\n"

    for paragraph in section['content']:
        para_size = len(paragraph)
        if current_size > 0 and (current_size + para_size) > TARGET_CHUNK_SIZE:
            if current_size >= MIN_CHUNK_SIZE:
                chunk_text = breadcrumb + '\n\n'.join(current_chunk)
                chunks.append({
                    'text': chunk_text,
                    'hierarchy': section['hierarchy'],
                    'url': section['url'],
                    'category': section['category'],
                    'section': section['section'],
                    'operator': section['operator'],
                    'has_code_block': any('[CODE BLOCK]' in p for p in current_chunk),
                    'char_count': len(chunk_text)
                })
                current_chunk = []
                current_size = 0
        current_chunk.append(paragraph)
        current_size += para_size

    if current_chunk:
        chunk_text = breadcrumb + '\n\n'.join(current_chunk)
        chunks.append({
            'text': chunk_text,
            'hierarchy': section['hierarchy'],
            'url': section['url'],
            'category': section['category'],
            'section': section['section'],
            'operator': section['operator'],
            'has_code_block': any('[CODE BLOCK]' in p for p in current_chunk),
            'char_count': len(chunk_text)
        })

    return chunks if chunks else [{
        'text': full_text,
        'hierarchy': section['hierarchy'],
        'url': section['url'],
        'category': section['category'],
        'section': section['section'],
        'operator': section['operator'],
        'has_code_block': len(section['code_blocks']) > 0,
        'char_count': len(full_text)
    }]


def discover_all_pages() -> Set[str]:
    """Discover all pages on docs.stackable.tech by crawling."""
    visited = set()
    to_visit = {START_URL}
    discovered = set()

    print(f"\nStarting site-wide crawl from {START_URL}")
    print(f"Max pages: {MAX_PAGES}")

    while to_visit and len(discovered) < MAX_PAGES:
        url = to_visit.pop()
        if url in visited:
            continue
        visited.add(url)

        if len(discovered) % 10 == 0:
            print(f"  Progress: {len(discovered)}/{MAX_PAGES} pages discovered")

        soup = fetch_page(url)
        if not soup:
            continue
        discovered.add(url)

        for link in soup.find_all('a', href=True):
            href = link['href']
            full_url = urljoin(url, href)
            if full_url.startswith(BASE_URL) and full_url not in visited:
                # Only crawl URLs for the specified release
                if f'/home/{RELEASE}/' in full_url or full_url == START_URL:
                    if not any(x in full_url for x in ['#', '.css', '.js', '.png', '.jpg', '.svg', 'mailto:', 'github.com', 'discord.com']):
                        if full_url.endswith('.html') or '.' not in full_url.split('/')[-1]:
                            to_visit.add(full_url)

    print(f"\nDiscovery complete: {len(discovered)} pages found")
    return discovered


def crawl_all_pages() -> List[Dict]:
    """Crawl all discovered pages and return chunks."""
    print(f"\n{'='*60}")
    print("Crawling docs.stackable.tech pages")
    print(f"{'='*60}")

    pages = discover_all_pages()
    all_chunks = []
    processed = 0

    for url in sorted(pages):
        processed += 1
        if processed % 10 == 0:
            print(f"Processing: {processed}/{len(pages)} pages ({len(all_chunks)} chunks so far)")

        soup = fetch_page(url)
        if not soup:
            continue

        content = extract_main_content(soup)
        sections = extract_sections(content, url)

        for section in sections:
            chunks = chunk_section(section)
            all_chunks.extend(chunks)

    print(f"\nGenerated {len(all_chunks)} total chunks")
    return all_chunks


def score_chunk(chunk):
    """Score chunk by importance for RAG demo."""
    score = 0
    text_lower = chunk.get('text', '').lower()
    hierarchy = [h.lower() for h in chunk.get('hierarchy', [])]
    hierarchy_str = ' '.join(hierarchy)
    char_count = chunk.get('char_count', 0)

    # Penalize useless navigation/TOC chunks
    navigation_keywords = ["what's next", 'next steps', 'table of contents', 'overview', 'introduction']
    is_navigation = any(kw in text_lower for kw in navigation_keywords)
    if is_navigation and char_count < 500:
        score -= 20

    # Penalize very short chunks
    if char_count < 400:
        score -= 15

    # Boost operator content
    if chunk.get('category') == 'operator':
        score += 10

    # Heavily boost foundational getting-started content
    if char_count >= 500:
        for keyword in FOUNDATIONAL_KEYWORDS:
            if keyword in hierarchy_str or keyword in text_lower:
                score += 25
                break

    # Boost priority sections
    priority_in_hierarchy = any(keyword in hierarchy_str for keyword in PRIORITY_KEYWORDS)
    priority_in_content = any(keyword in text_lower for keyword in PRIORITY_KEYWORDS)

    if priority_in_hierarchy and char_count >= 600:
        score += 15
    elif priority_in_content:
        score += 6

    # Detect and boost complete CRD examples
    has_apiversion = 'apiversion:' in text_lower
    has_kind = 'kind:' in text_lower
    has_metadata = 'metadata:' in text_lower
    has_spec = 'spec:' in text_lower

    if has_apiversion and has_kind and has_metadata and has_spec:
        score += 30
        if 'catalog' not in text_lower and 'authentication' not in text_lower:
            score += 15

    # Boost chunks with code blocks
    if chunk.get('has_code_block', False) and char_count >= 600:
        score += 12

    # Boost deployment-related chunks
    if any(word in text_lower for word in ['cluster', 'deployment', 'deploy a', 'create a', 'kubectl apply']):
        score += 5

    # Prefer substantive chunks
    if 800 <= char_count <= 2500:
        score += 12
    elif 600 <= char_count < 800:
        score += 6
    elif char_count >= 2500:
        score += 8

    # Boost concepts
    if chunk.get('category') == 'concepts':
        score += 7

    return score


def filter_chunks(chunks, target_count=TARGET_CHUNK_COUNT):
    """Filter chunks to keep most valuable ones."""
    scored_chunks = [(score_chunk(chunk), chunk) for chunk in chunks]
    scored_chunks.sort(reverse=True, key=lambda x: x[0])
    filtered = [chunk for score, chunk in scored_chunks[:target_count]]

    print(f"\n{'='*60}")
    print("Chunk Filtering")
    print(f"{'='*60}")
    print(f"Original chunks: {len(chunks)}")
    print(f"Filtered to: {len(filtered)} chunks")

    by_section = {}
    with_code = sum(1 for c in filtered if c.get('has_code_block', False))
    for chunk in filtered:
        sec = chunk.get('section', 'unknown')
        by_section[sec] = by_section.get(sec, 0) + 1

    print("\nFiltered chunks by section:")
    for sec, count in sorted(by_section.items(), key=lambda x: x[1], reverse=True)[:15]:
        print(f"  {sec:20} {count:4} chunks")
    print(f"\nChunks with code blocks: {with_code}/{len(filtered)}")

    return filtered


def process_document_embedding(doc, i, total):
    """Process a single document - generate embedding."""
    try:
        hierarchy_str = ' > '.join(doc.get('hierarchy', []))
        title = f"{doc.get('section', 'Unknown')}: {hierarchy_str}" if hierarchy_str else doc.get('section', 'Unknown')

        embedding = get_embedding(doc['text'])

        return DocumentChunk(
            title=title,
            content=doc['text'],
            category=doc.get('category', ''),
            operator=doc.get('operator', ''),
            section=doc.get('section', ''),
            url=doc.get('url', ''),
            hierarchy=doc.get('hierarchy', []),
            embedding=embedding,
            timestamp=time.strftime('%Y-%m-%dT%H:%M:%S'),
            char_count=doc.get('char_count', 0),
            has_code_block=doc.get('has_code_block', False)
        )
    except Exception as e:
        print(f"  Error processing document {i+1}/{total}: {e}")
        return None


def generate_embeddings(documents):
    """Generate embeddings for all documents using parallel workers."""
    print(f"\nStarting parallel embedding generation for {len(documents)} chunks...")
    print("Using 12 concurrent workers\n")

    results = []
    completed = 0

    with ThreadPoolExecutor(max_workers=12) as executor:
        future_to_doc = {
            executor.submit(process_document_embedding, doc, i, len(documents)): i
            for i, doc in enumerate(documents)
        }

        for future in as_completed(future_to_doc):
            completed += 1
            if completed % 50 == 0:
                print(f"  Progress: {completed}/{len(documents)} chunks processed ({completed*100//len(documents)}%)")

            result = future.result()
            if result:
                results.append(result)

    print(f"\nSuccessfully processed {len(results)} documents!")
    return results


def main():
    """Main workflow."""
    print("="*60)
    print("Stackable Documentation Embeddings Generator")
    print("="*60)
    print(f"\nOutput file: {OUTPUT_FILE}")
    print(f"Target chunks: ~{TARGET_CHUNK_COUNT}")

    # Check prerequisites
    if not check_ollama():
        return 1

    # Crawl and chunk documentation
    print("\n" + "="*60)
    print("Phase 1: Crawling and Chunking")
    print("="*60)
    all_chunks = crawl_all_pages()

    if not all_chunks:
        print("[ERROR] No chunks generated!")
        return 1

    # Filter to most valuable chunks
    filtered_chunks = filter_chunks(all_chunks)

    # Generate embeddings
    print("\n" + "="*60)
    print("Phase 2: Generating Embeddings")
    print("="*60)
    documents_with_embeddings = generate_embeddings(filtered_chunks)

    # Save to JSON
    print(f"\nSaving to {OUTPUT_FILE}...")
    # Convert DocumentChunk instances to dictionaries for JSON serialization
    documents_as_dicts = [doc.to_dict() for doc in documents_with_embeddings]
    with open(OUTPUT_FILE, 'w') as f:
        json.dump(documents_as_dicts, f, indent=2)
        f.write('\n')

    file_size_mb = len(json.dumps(documents_as_dicts)) / (1024 * 1024)

    print(f"\n{'='*60}")
    print("Summary")
    print(f"{'='*60}")
    print(f"[OK] Total documents: {len(documents_with_embeddings)}")
    print(f"[OK] Output file: {OUTPUT_FILE}")
    print(f"[OK] File size: {file_size_mb:.1f} MB")

    by_operator = {}
    for doc in documents_with_embeddings:
        operator = doc.operator if hasattr(doc, 'operator') else 'unknown'
        by_operator[operator] = by_operator.get(operator, 0) + 1

    print("\nDocuments by operator:")
    for operator, count in sorted(by_operator.items(), key=lambda x: x[1], reverse=True)[:10]:
        print(f"  {operator:30} {count:4} chunks")

    print(f"\n{'='*60}")
    print("[OK] Complete! You can now commit this file to git.")
    print(f"{'='*60}")

    return 0


if __name__ == '__main__':
    exit(main())
