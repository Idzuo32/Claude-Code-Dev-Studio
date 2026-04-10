# API / Backend Service Project

> This template is for: standalone APIs, microservices, data pipelines, or CLI tools.

## Project Context
```
Project Name:     [name]
Type:             api
Target Platform:  server
Current Phase:    [planning | active | pre-launch | maintenance]
Stack:            [fill in: e.g. Node.js/Fastify | Python/FastAPI | Go/Gin | Rust/Axum]
Database:         [fill in: PostgreSQL | MySQL | MongoDB | Redis | SQLite | none]
Auth Strategy:    [fill in: JWT | sessions | API key | OAuth | none]
Deployment:       [fill in: Fly.io | Railway | AWS ECS | GCP Cloud Run | other]
```

## Key Directories
```
src/
  routes/       or handlers/ or controllers/
  services/     Business logic
  models/       Data models / ORM schemas
  middleware/   Auth, validation, logging middleware
  lib/          Utilities, DB client
  types/        TypeScript/type stubs
tests/
  unit/
  integration/
db/
  migrations/   Database migrations
  seeds/        Development seed data
```

## Backend-Specific Session Rules
- Every route validates all input before touching business logic
- Every protected route authenticates before anything else
- Database migrations are always reversible
- No endpoint returns unbounded result sets — always paginate

## Active Skills
- `api-design` — URL conventions, response shapes, error codes
- `database-patterns` — schema, migrations, indexing
- `auth-patterns` — JWT, sessions, API keys
- `security-review` — on route handlers and auth code
- `tdd-workflow` — integration and unit tests

## Key Commands for This Project Type
- `/spec` — API endpoint design before implementation
- `/test` — generate integration tests for endpoints
- `/audit` — security review before going public
