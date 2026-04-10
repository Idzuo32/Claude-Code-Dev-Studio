# Research Project

> Template for: research projects, competitive analyses, knowledge compilation.

## Project Context
```
Project Name:     [name]
Type:             research
Track:            research
Topic:            [what is being researched]
Purpose:          [decision this research informs]
Output format:    [wiki | report | slide deck | all]
```

## Research Structure
```
research/[topic]/
  index.md            ← catalog of all wiki pages
  log.md              ← chronological ingestion record
  synthesis.md        ← evolving thesis (most valuable output)
  open-questions.md   ← what we don't know yet

  sources/            ← one summary page per ingested source
  entities/           ← people, companies, products
  concepts/           ← ideas, patterns, frameworks
```

## Research-Specific Session Rules
- Read synthesis.md and open-questions.md at the start of every session
- Every source is fully read before writing anything about it
- Contradictions between sources are flagged explicitly in synthesis.md
- Good query answers are filed back into the wiki as new pages
- Lint the wiki after every 5+ ingests

## Active Agents
`research-analyst`, `product-director` (for market research framing)

## Active Skills
`research-methodology`, `concept-validation`

## Key Commands
- `/research [topic]` — primary research command
- `/wiki-query [topic]` — query the compiled wiki
- `/wiki-update` — maintenance and lint
