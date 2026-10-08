#!/usr/bin/env python
"""Re-render the *.drawio.png overview diagrams, keeping them editable.

draw.io shapes can reference logos either by URL (image=https://...) or by
embedded data URI (image=data:image/png,<base64>). Remote URLs are not fetched
by the renderer when exporting to PNG, so those logos come out blank. For each
diagram this script reads the source out of the PNG's mxfile textual chunk,
rewrites every remote reference into a data URI, and re-exports the PNG with
the source embedded again.

Requires the draw.io desktop CLI, which nixpkgs marks as unfree. On NixOS:
    NIXPKGS_ALLOW_UNFREE=1 nix-shell -p drawio-headless \
      --run .scripts/render_drawio_images.py

Usage:
    render_drawio_images.py [FILE...]      re-render (default: all of docs/)
    render_drawio_images.py --check [FILE...]   report remote references only
"""

import argparse
import base64
import os
import re
import shutil
import struct
import subprocess
import sys
import tempfile
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET
import zlib
from pathlib import Path

USER_AGENT = "stackable-demos-drawio-inliner/1.0 (+https://github.com/stackabletech/demos)"
TIMEOUT = 30

# draw.io writes data URIs without the ";base64" marker, e.g.
# "data:image/png,iVBORw0...". Match that convention so round-tripping through
# the draw.io editor produces no spurious diffs.
EXTENSION_MIME = {
    ".png": "image/png",
    ".jpg": "image/jpeg",
    ".jpeg": "image/jpeg",
    ".gif": "image/gif",
    ".svg": "image/svg+xml",
    ".webp": "image/webp",
}

IMAGE_URL_RE = re.compile(r"(?<=\bimage=)(https?://[^;]+)")


def decompress(data: bytes) -> bytes:
    """Inflate a PNG textual chunk payload.

    The spec says this is a zlib datastream, but draw.io writes a bare deflate
    stream with no zlib header, so fall back to that.
    """
    try:
        return zlib.decompress(data)
    except zlib.error:
        return zlib.decompress(data, -zlib.MAX_WBITS)


def read_png_diagram(path: Path) -> str:
    """Return the diagram XML from a draw.io PNG's mxfile textual chunk.

    The VS Code extension stores the diagram uncompressed in a tEXt chunk,
    while the desktop CLI's --embed-diagram compresses it into a zTXt, so both
    have to be understood for a re-render to be repeatable.
    """
    data = path.read_bytes()
    if data[:8] != b"\x89PNG\r\n\x1a\n":
        raise ValueError(f"{path} is not a PNG")
    offset = 8
    while offset < len(data):
        (length,) = struct.unpack(">I", data[offset : offset + 4])
        chunk_type = data[offset + 4 : offset + 8]
        payload = data[offset + 8 : offset + 8 + length]
        if chunk_type in (b"tEXt", b"zTXt", b"iTXt"):
            keyword, rest = payload.split(b"\x00", 1)
            if keyword in (b"mxfile", b"mxGraphModel"):
                if chunk_type == b"zTXt":
                    # Skip the compression-method byte.
                    rest = decompress(rest[1:])
                elif chunk_type == b"iTXt":
                    # Compression flag, method, then null-terminated language
                    # and translated-keyword fields before the text itself.
                    compressed = rest[0]
                    rest = rest[2:].split(b"\x00", 2)[2]
                    if compressed:
                        rest = decompress(rest)
                return urllib.parse.unquote(rest.decode("latin1"))
        offset += 12 + length
    raise ValueError(f"{path} has no embedded draw.io diagram")


def read_diagram(path: Path) -> str:
    if path.suffix.lower() == ".png":
        return read_png_diagram(path)
    return path.read_text(encoding="utf-8")


def inflate_diagram(text: str) -> str:
    """Decompress a draw.io <diagram> body, if it is compressed."""
    raw = base64.b64decode(text)
    return urllib.parse.unquote(zlib.decompress(raw, -zlib.MAX_WBITS).decode("utf-8"))


def normalise(xml: str) -> str:
    """Return the diagram XML with any compressed <diagram> bodies expanded."""
    root = ET.fromstring(xml)
    changed = False
    for diagram in root.iter("diagram"):
        # An uncompressed diagram holds an <mxGraphModel> child element, and
        # its text is just the whitespace in front of it. A compressed one has
        # no children and carries a deflated, base64 payload as its text.
        if len(diagram) == 0 and diagram.text and diagram.text.strip():
            model = ET.fromstring(inflate_diagram(diagram.text.strip()))
            diagram.text = None
            diagram.append(model)
            changed = True
    return ET.tostring(root, encoding="unicode") if changed else xml


def fetch_data_uri(url: str) -> str:
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=TIMEOUT) as response:
        payload = response.read()
        mime = (response.headers.get_content_type() or "").lower()
    if not mime.startswith("image/"):
        mime = EXTENSION_MIME.get(Path(urllib.parse.urlparse(url).path).suffix.lower(), "")
    if not mime:
        raise ValueError(f"could not determine an image type for {url}")
    return f"data:{mime},{base64.b64encode(payload).decode('ascii')}"


def remote_urls(xml: str) -> list[str]:
    root = ET.fromstring(xml)
    found = []
    for cell in root.iter():
        for url in IMAGE_URL_RE.findall(cell.get("style", "")):
            if url not in found:
                found.append(url)
    return found


def inline(xml: str) -> tuple[str, list[str]]:
    """Replace every remote image reference with a data URI.

    Returns the rewritten XML and the list of URLs that could not be fetched.
    """
    root = ET.fromstring(xml)
    cache: dict[str, str] = {}
    failed: list[str] = []

    def replace(match: re.Match[str]) -> str:
        url = match.group(0)
        if url in cache:
            return cache[url]
        if url in failed:
            return url
        try:
            cache[url] = fetch_data_uri(url)
        except Exception as error:  # noqa: BLE001 - reported, not swallowed
            print(f"  FAILED {url}: {error}", file=sys.stderr)
            failed.append(url)
            return url
        print(f"  inlined {url} ({len(cache[url]) // 1024} KiB)", file=sys.stderr)
        return cache[url]

    for cell in root.iter():
        style = cell.get("style")
        if style:
            updated = IMAGE_URL_RE.sub(replace, style)
            if updated != style:
                cell.set("style", updated)

    return ET.tostring(root, encoding="unicode"), failed


def export(drawio: str, source: Path, target: Path, scale: str, border: str) -> None:
    """Render diagram XML to PNG, keeping the source embedded in the PNG."""
    # --embed-diagram writes the XML back into the PNG's mxfile tEXt chunk, so
    # the exported file can still be opened and edited as a diagram.
    subprocess.run(
        [
            drawio, "--export", "--format", "png", "--embed-diagram",
            "--scale", scale, "--border", border,
            "--output", str(target), str(source),
        ],
        check=True,
    )


def default_inputs() -> list[Path]:
    docs = Path(__file__).resolve().parent.parent / "docs"
    return sorted(docs.rglob("*.drawio.png"))


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "inputs",
        nargs="*",
        type=Path,
        help="diagrams to process (default: every *.drawio.png under docs/)",
    )
    parser.add_argument(
        "--check",
        action="store_true",
        help="only report remote image references, do not fetch or re-render",
    )
    parser.add_argument(
        "--drawio",
        default=os.environ.get("DRAWIO", "drawio"),
        help="draw.io desktop CLI to render with (default: drawio)",
    )
    # Match the scale/border draw.io recorded on the existing exports.
    parser.add_argument("--scale", default="1")
    parser.add_argument("--border", default="20")
    args = parser.parse_args()

    inputs = args.inputs or default_inputs()
    if not inputs:
        print("no diagrams found", file=sys.stderr)
        return 1

    if args.check:
        remaining = 0
        for path in inputs:
            urls = remote_urls(normalise(read_diagram(path)))
            remaining += len(urls)
            print(f"{path}: {len(urls)} remote image(s)")
            for url in urls:
                print(f"  {url}")
        return 1 if remaining else 0

    if shutil.which(args.drawio) is None:
        print(
            f"error: '{args.drawio}' not found. On NixOS, run inside 'nix-shell'.",
            file=sys.stderr,
        )
        return 1

    failures = 0
    with tempfile.TemporaryDirectory() as workdir:
        for index, path in enumerate(inputs):
            print(f"==> {path}")
            xml, failed = inline(normalise(read_diagram(path)))
            failures += len(failed)

            # The diagrams are all called overview.drawio.png, so number the
            # intermediate files to keep them apart.
            source = Path(workdir) / f"{index}-{path.name.removesuffix('.png')}"
            source.write_text(xml, encoding="utf-8")
            export(args.drawio, source, path, args.scale, args.border)

    return 1 if failures else 0


if __name__ == "__main__":
    sys.exit(main())
