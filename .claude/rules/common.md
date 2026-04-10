---
description: Universal standards that apply to every file in every project, regardless of language or framework.
---

# Common Standards

## Naming (language-agnostic concepts)
- Variables and functions: use the idiomatic convention for the language
- Constants: clearly distinguished from variables (SCREAMING_SNAKE, or language-appropriate)
- Files and directories: consistent with the framework/ecosystem convention
- Database tables/columns: `snake_case` always

## Secrets
- **NEVER** hardcode secrets, API keys, passwords, or connection strings
- All secrets live in `.env` files (never committed)
- `.env.example` documents every required variable with description
- Different secrets per environment (dev / staging / prod)

## Error Handling
- Never silently swallow errors: `catch (e) {}` is never acceptable
- Log errors with context: what operation failed, relevant IDs, the error itself
- User-facing messages must not expose internal implementation details, stack traces, or database errors

## Functions / Methods
- Single responsibility: one function does one thing
- Explicit error handling at every level — no invisible failure paths
- No magic numbers: named constants explain what values mean

## Comments
- Comment **why**, not **what** — the code says what; comments explain intent
- Remove commented-out code — that's what version control is for
- TODO format: `TODO(author): description of what needs to be done`

## Git Discipline
- **Conventional Commits:** `feat:`, `fix:`, `chore:`, `docs:`, `refactor:`, `test:`, `perf:`
- One concern per commit — never bundle unrelated changes
- Commit messages in imperative mood: "Add user auth" not "Added user auth"
- No `.env` files, build artifacts, or generated files in git

## Dependencies
- Justify every new dependency before adding it
- Prefer the smallest solution that works
- Check license compatibility before adding open-source packages
- Pin or constrain versions to avoid surprise breakage
