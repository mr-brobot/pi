---
name: reading-documents
description: Use when reading PDF files.
compatibility: Requires uv (for uvx).
---

# PDF Reading

Read PDFs with a text+vision pipeline.

Script paths below are relative to this skill's directory — resolve them to absolute paths when invoking.

## Tools

- `scripts/extract-text.sh` — text extraction + quality check (step 3)
- `scripts/render-pages.sh` — page rendering (step 5)
- `pypdfium2` CLI for one-liners, run via uvx: `uvx --from pypdfium2 pypdfium2 <subcommand> ...`

## Workflow

### 1. Acquire

If the paper is hosted remotely, download it with `curl`.

```bash
curl -sL -o paper.pdf "<url>"
```

### 2. Inspect

```bash
uvx --from pypdfium2 pypdfium2 pdfinfo paper.pdf        # page count, metadata
uvx --from pypdfium2 pypdfium2 toc paper.pdf            # outline/sections, if present
```

### 3. Extract text

```bash
scripts/extract-text.sh paper.pdf /tmp/paper.txt
```

Use the `read` tool on `paper.txt`. It truncates at 50 KB / 2000 lines, so page through with `offset`/`limit`.
Skim structure first (headings, abstract, intro, conclusion), then deep-read the sections relevant to the discussion , as needed.

### 4. Render images

Render when you need figures, tables, diagrams, complex equations, or when the text layer is absent/broken:

```bash
scripts/render-pages.sh paper.pdf 5-8 3 /tmp/pages   # <pdf> <pages> [scale] [outdir]
```

Output files are named by page number (e.g. `paper_05.jpg`).
Read rendered page images with the `read` tool.
Render selectively (a few pages at a time), not whole documents.

## Tips

- Don't render entire large documents to images up front; extract text first, render only what you need.
- When summarizing for the user, cite page numbers so they can verify.

