#!/usr/bin/env bash
#
# Extract embedded text from a PDF via pypdfium2.
# Usage: extract-text.sh <pdf> [output.txt]

set -euo pipefail

pdf="${1:?usage: extract-text.sh <pdf> [output.txt]}"
out="${2:-${pdf%.*}.txt}"

uvx --from pypdfium2 pypdfium2 extract-text "$pdf" | tr -d '\r' > "$out"

chars=$(wc -c < "$out")
lines=$(wc -l < "$out")
pages=$(grep -c '^# Page ' "$out" || true)
per_page=0
[ "$pages" -gt 0 ] && per_page=$((chars / pages))

echo "wrote $out ($lines lines, $chars chars, $pages pages, ~$per_page chars/page)"

