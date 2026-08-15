#!/usr/bin/env bash
# Render PDF pages to images via pypdfium2.
# Usage: render-pages.sh <pdf> <pages> [scale] [outdir]
#   pages:  page numbers/ranges, e.g. "5", "5-8", "1,3,7-9" (1-indexed)
#   scale:  render scale, 1 = 72 DPI (default: 3 ≈ 216 DPI; use 2 for faster/smaller output)
#   outdir: output directory (default: ./pages); created if missing

set -euo pipefail

pdf="${1:?usage: render-pages.sh <pdf> <pages> [scale] [outdir]}"
pages="${2:?usage: render-pages.sh <pdf> <pages> [scale] [outdir]}"
scale="${3:-3}"
outdir="${4:-./pages}"

mkdir -p "$outdir"
uvx --from pypdfium2 --with pillow pypdfium2 render "$pdf" --output "$outdir" --pages "$pages" --scale "$scale"

ls -la "$outdir"
