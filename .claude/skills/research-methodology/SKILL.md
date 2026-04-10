---
name: research-methodology
description: Research compilation using the Karpathy LLM-Wiki pattern — source ingestion, wiki maintenance, query patterns, and knowledge synthesis.
---

# Research Methodology (Karpathy LLM-Wiki)

## The Key Distinction
**RAG**: Re-derive answers from raw sources every query. Nothing accumulates.
**LLM-Wiki**: Compile knowledge once into structured pages. Knowledge compounds.

## Three Layers
- **Raw sources**: immutable, LLM reads only
- **Wiki**: LLM-maintained structured pages — source summaries, entity pages, concept pages, synthesis
- **Schema** (CLAUDE.md): how the wiki is organized, what conventions to follow

## Ingest Protocol
For each source:
1. Read fully
2. Discuss key takeaways with user before writing
3. Write source summary page
4. Update entity and concept pages touched by this source
5. Check for contradictions with existing synthesis
6. Update synthesis.md
7. Append to log.md

One source may touch 5-15 wiki pages. Expected.

## Query Protocol
1. Read index.md to find relevant pages
2. Read those pages
3. Synthesize answer with citations to wiki pages (not raw sources)
4. File valuable answers back into wiki as new pages

## Wiki Health (lint after every 5+ ingests)
- Contradictions between pages? Flag and resolve.
- Orphan pages? Connect or remove.
- Stale claims? Update.
- Concepts without pages? Create.

## Log Format
```markdown
## [YYYY-MM-DD] ingest | [Source Title]
Key takeaways: [2-3 sentences]
Pages created: [list]
Pages updated: [list]
Contradictions: [any noted]
```
