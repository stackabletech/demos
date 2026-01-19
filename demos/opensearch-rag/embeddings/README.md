# OpenSearch RAG Demo - Embeddings Generation

This directory contains the script to regenerate embeddings for the Stackable documentation.

## Prerequisites

**Ollama with nomic-embed-text:v1.5 model** - Choose one of the following options:

### Option 1: Run Ollama locally

```bash
# Install Ollama
curl -fsSL https://ollama.com/install.sh | sh

# Pull the embedding model
ollama pull nomic-embed-text:v1.5
```

### Option 2: Port-forward from the demo

```bash
# Deploy the demo if not already running
stackablectl demo install opensearch-rag

# Port-forward Ollama (keep running in a separate terminal)
kubectl port-forward deployment/ollama 11434:11434
```

## Regenerate Embeddings

Run the script using uv to automatically handle Python dependencies:

```bash
uv run --with requests --with beautifulsoup4 python generate-embeddings-local.py
```

This will:

- Crawl docs.stackable.tech (defaults to `stable` release)
- Extract and chunk documentation
- Generate embeddings using nomic-embed-text
- Save to `stackable-docs-embeddings.json` (~89 MB, ~4200 chunks)

The process can take more than 1 hour mainly depending on your CPU.

### Configuration

You can customize the crawling behavior with environment variables:

```bash
# Crawl a specific Stackable release (default: stable)
RELEASE=24.11 uv run --with requests --with beautifulsoup4 python generate-embeddings-local.py

# Crawl nightly documentation
RELEASE=nightly uv run --with requests --with beautifulsoup4 python generate-embeddings-local.py
```
