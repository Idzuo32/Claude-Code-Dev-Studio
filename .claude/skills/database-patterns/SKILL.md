---
name: database-patterns
description: Database design patterns — schema conventions, migrations, indexing, query optimization, and caching. Stack and engine agnostic.
---

# Database Patterns

## Schema Design Principles

### Naming
- Tables: plural, snake_case (`users`, `blog_posts`, `organization_members`)
- Columns: snake_case (`user_id`, `created_at`, `is_active`)
- Foreign keys: `<table_singular>_id` (`user_id`, `organization_id`)
- Boolean columns: `is_*` or `has_*` prefix (`is_active`, `has_verified_email`)
- Timestamps: `created_at`, `updated_at`, `deleted_at`

### Mandatory Columns (every table)
```sql
id         — primary key (UUID recommended for public-facing, serial for internal)
created_at — when the record was created (NOT NULL DEFAULT NOW())
updated_at — when the record was last modified (auto-update via trigger or ORM)
deleted_at — NULL means active; timestamp means soft-deleted
```

### Soft Deletes
Never hard-DELETE user data. Use `deleted_at`:
```sql
-- All queries should filter: WHERE deleted_at IS NULL
-- Delete: UPDATE table SET deleted_at = NOW() WHERE id = $1
```

## Migration Conventions
```
Naming:  YYYYMMDDHHMMSS_verb_noun_description.sql
Example: 20240315120000_add_stripe_customer_id_to_users.sql

Rules:
- Every migration has an UP and a DOWN
- Never modify a migration that has run in production
- Migrations are idempotent (safe to run twice)
- Test against a copy of production data before running on prod
```

## Indexing Strategy

Index:
- All foreign key columns
- Columns used in WHERE clauses on large tables
- Columns used in ORDER BY with pagination
- Columns used in JOIN conditions

Do NOT index:
- Low-cardinality columns on small tables (gender on a 100-row table)
- Columns never queried in isolation

Partial index (index a subset):
```sql
-- Only index active records (smaller index, faster queries)
CREATE INDEX idx_posts_active ON posts(created_at DESC) WHERE deleted_at IS NULL;
```

## Query Optimization
```sql
-- 1. Identify slow queries
-- PostgreSQL:
SELECT query, mean_exec_time, calls FROM pg_stat_statements ORDER BY mean_exec_time DESC LIMIT 10;
-- MySQL: SHOW PROCESSLIST; or slow query log

-- 2. Explain the query
EXPLAIN ANALYZE SELECT ...;
-- Look for: Seq Scan on large table (add index), high rows estimate, nested loops on large sets

-- 3. Common fixes
-- N+1: add JOIN or use eager loading in ORM
-- Missing index: add index on WHERE/ORDER BY column
-- SELECT *: select only needed columns
-- Large offset: switch to cursor pagination
```

## Caching Strategy

### What to cache
- Expensive queries that don't change often (config, feature flags, user profiles)
- Computed aggregates (counts, totals)
- External API responses

### What NOT to cache
- User-specific financial/payment data
- Security-sensitive permissions (or cache very briefly with invalidation)

### Cache invalidation
```
Write-through: update cache when DB is written (consistent, more complex)
Cache-aside:   read from cache; on miss, read DB and populate cache (simpler)
TTL:           always set a TTL; never cache forever
```
