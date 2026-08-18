---
name: creating-diagrams
description: Use when creating diagrams.
compatibility: Requires npm (for npx).
---

# Creating Diagrams

Prefer using [Mermaid](https://mermaid.ai/open-source/intro/).
Iterate until the diagram renders successfully and as expected.

1. Write the diagram to a temp `.mmd` file (e.g., `/tmp/diagram.mmd`).
2. Render to PNG:
   ```bash
   npx -p @mermaid-js/mermaid-cli mmdc -i /tmp/diagram.mmd -o /tmp/diagram.png -e png -p /tmp/puppeteer.json
   ```
3. Visual inspection with the `read` tool.

