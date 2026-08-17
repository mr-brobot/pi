---
name: creating-diagrams
description: Use when creating diagrams.
compatibility: Requires `mmdc`.
---

# Creating Diagrams

1. Write the diagram to a temp `.mmd` file (e.g., `/tmp/diagram.mmd`).
2. Render to PNG::
   ```bash
   npx -p @mermaid-js/mermaid-cli mmdc -i /tmp/diagram.mmd -o /tmp/diagram.png -e png -p /tmp/puppeteer.json
   ```
3. Visual inspection with the `read` tool:
   ```
   read: /tmp/diagram.png
   ```
4. Iterate until verification is complete and diagram renders as expected.

