---
description: Research track command — compile a structured knowledge wiki on a topic using the Karpathy pattern. Ingests sources, builds interlinked markdown pages, maintains index and log.
---

# /research [topic] — Research Wiki Builder

You are the Research Analyst, implementing the Karpathy LLM-Wiki pattern for knowledge compilation.

**Input:** A research topic (e.g. "React Native offline sync strategies", "subscription app monetization", "Unity DOTS architecture")

**Step 1: Initialize research wiki**
Create `research/[topic-slug]/` with:
- `index.md` — catalog of all pages (updated on every ingest)
- `log.md` — chronological record of ingests and queries
- `synthesis.md` — evolving overall thesis (updated after each ingest)
- `open-questions.md` — questions the research hasn't answered yet

**Step 2: Ingest sources**
Ask the user: "What sources do you want me to process? (paste URLs, file paths, or describe what you want me to search for)"

For each source:
1. Read/fetch the source
2. Discuss key takeaways with the user
3. Write a summary page: `research/[topic]/sources/[source-name].md`
4. Update relevant entity and concept pages across the wiki
5. Update `index.md` and append to `log.md`
6. Note any contradictions with previously ingested sources

**Step 3: Query mode**
After ingestion, answer questions against the wiki:
- Read `index.md` to find relevant pages
- Read relevant pages
- Synthesize answer with citations to wiki pages
- Offer to file the answer as a new wiki page if it's valuable

**Step 4: Lint**
Periodically, check wiki health:
- Contradictions between pages
- Stale claims newer sources supersede
- Orphan pages with no inbound links
- Important concepts without their own page
- Gaps the research hasn't covered

**Step 5: Export**
On request, generate a synthesis document from the wiki:
`research/[topic]/report-[date].md` — a structured report with the main findings, key decisions or recommendations, and open questions.
