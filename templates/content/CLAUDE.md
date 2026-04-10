# Content Product

> Template for: content products — prompt libraries, courses, newsletters, curated databases.

## Project Context
```
Project Name:     [name]
Type:             content
Track:            content
Content Format:   [daily prompts | course lessons | newsletter issues | resource library]
Volume:           [total item count — e.g. 52 weekly prompts, 10 course modules]
Storage:          [static JSON bundle | Supabase table | headless CMS]
Target Platform:  [mobile app | web app | email | standalone]
Current Phase:    [planning | production | published]
```

## Content Structure
```
assets/content/
  schema.json         ← JSON schema — define before writing anything
  EDITORIAL.md        ← voice, tone, quality bar, sensitive topic guidance
  [content-type].json ← the actual content
  validate.sh         ← validation script

docs/
  content-strategy.md ← what gets built and why
  chapter-map.md      ← structure map for long-form content
```

## Content-Specific Session Rules
- Schema must be defined and approved before any content is written
- Every content item is validated against the schema before committing
- Editorial standards document is the source of truth for quality
- Read aloud check before finalizing any batch — catches awkward phrasing
- Sensitive topics (illness, death, loss, trauma) require explicit editorial review

## Active Agents
`content-lead`, `content-writer`, `documentation-writer`

## Active Skills
`content-production`, `tdd-workflow` (for content validation)

## Key Commands
- `/spec` — design the content schema and chapter structure
- `/wiki-update` — track editorial decisions and discoveries
