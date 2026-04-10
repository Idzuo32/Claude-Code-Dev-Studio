# Fullstack Project

> This template is for: full-stack applications with both frontend and backend in the same repo (monorepo or single framework).

## Project Context
```
Project Name:     [name]
Type:             fullstack
Target Platform:  web (+ mobile if applicable)
Current Phase:    [planning | active | pre-launch | maintenance]
Frontend Stack:   [fill in]
Backend Stack:    [fill in]
Database:         [fill in]
Auth:             [fill in]
Payments:         [fill in, or N/A]
Deployment:       [fill in]
```

## Monorepo Structure (example — adapt to your actual layout)
```
packages/
  web/          Frontend application
    .claude/    Frontend-specific skills and rules
  api/          Backend service
    .claude/    Backend-specific skills and rules
  shared/       Shared types, utilities
    .claude/    Shared skills

.claude/        Root-level studio config (this file, agents, commands)
```

## Fullstack-Specific Session Rules
- API contracts must be agreed before frontend and backend build in parallel
- Shared types live in `packages/shared/` — never duplicate
- Frontend never calls the database directly (even in SSR) — always through API layer
- Integration tests cover the full stack (frontend → API → DB)

## Active Skills
All skills active — see individual template CLAUDEs for frontend and backend specifics.

## Key Commands for This Project Type
- All commands available
- Start with `/spec` + `/plan` to align frontend and backend work before splitting
