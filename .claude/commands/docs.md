---
description: Generate or update project documentation — READMEs, API docs, runbooks, and changelogs.
---

# /docs — Documentation Generator

**Input:** What to document (specify a file, module, API, or "the whole project").

**Step 1: Assess what exists**
Read existing docs in `docs/`, `README.md`, and inline code comments. Identify gaps.

**Step 2: Choose doc type**

| Type | Output location | Audience |
|------|----------------|---------|
| README | `README.md` | Any developer |
| API reference | `docs/api.md` or OpenAPI spec | API consumers |
| Architecture | `docs/architecture.md` | Backend/senior devs |
| Runbook | `docs/runbooks/[topic].md` | On-call engineers |
| Changelog | `CHANGELOG.md` | Users + devs |
| Contributing | `CONTRIBUTING.md` | Open source contributors |

**Step 3: Write the document**

### README structure
```markdown
# Project Name
One sentence: what is this and who is it for?

## Quick Start
The absolute minimum to get running locally (< 5 commands)

## Features
What it does

## Tech Stack
What it's built with

## Development
Setup, running tests, building

## Deployment
How it ships

## Contributing
How to contribute (or link to CONTRIBUTING.md)

## License
```

### API doc structure
For each endpoint:
- Method + URL
- Authentication required?
- Request body schema
- Response schema (success + errors)
- Example request/response

**Step 4: Verify accuracy**
Docs that are wrong are worse than no docs. Check every command, every code snippet, every URL against the actual code.

**Ask before writing:** "Shall I write this to `[filepath]`?"
