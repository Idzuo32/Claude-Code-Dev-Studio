---
name: content-production
description: Content-as-code production workflow — schema design, editorial standards, batch production, validation, and version control for content that ships inside a product.
---

# Content Production

## Content-as-Code
Content that ships in your product is a software artifact:
- Version controlled in git
- Schema validated
- Reviewed before merge
- Tested via validation scripts

## Schema First
Before writing any content, define the schema:
```json
{
  "required": ["id", "type", "content"],
  "properties": {
    "id": { "type": "string", "pattern": "^[a-z0-9-]+$" },
    "type": { "enum": ["prompt", "lesson", "story"] },
    "content": { "type": "string", "minLength": 10 }
  }
}
```

## Editorial Standards Document
`assets/content/EDITORIAL.md` before any writing:
- Voice: formal / conversational / warm
- Length: word count range per type
- Vocabulary to avoid
- Quality bar
- Sensitive topic guidance

## Batch Production Workflow
1. Read EDITORIAL.md + 10 existing examples
2. Write 5-item sample batch
3. Review for voice consistency
4. Adjust guidelines if needed
5. Produce remaining batch
6. Run validation script
7. Human review before commit

## 52-Week Prompt Library
1. Design chapter structure (e.g. 9 chapters × 5-6 prompts)
2. Write chapter overviews — emotional territory per chapter
3. Write 3 sample prompts per chapter for review
4. Produce full chapter after review approval
5. Read each chapter aloud — catch awkward phrasing
6. Final schema validation

## Storage Decision
- **Static bundle**: ship in app, update via OTA. Simpler, fully offline. Right for v1.
- **Remote CMS**: update without app release. More infrastructure.
- For most solo v1 products: static bundle.
