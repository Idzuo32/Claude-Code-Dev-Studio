---
description: Scaffold a new project from a template. Creates directory structure, installs dependencies, and configures Claude Code settings.
---

# /new-project — Project Scaffolding Wizard

**Step 1: Identify the template**
Ask which template to use:
- `web-saas` — Next.js 15 + Supabase + Stripe + TypeScript
- `mobile-app` — Expo SDK 52 + Supabase + RevenueCat + TypeScript
- `api-backend` — Fastify + PostgreSQL + Prisma + TypeScript
- `fullstack` — Next.js 15 + Fastify API + Supabase + TypeScript
- `custom` — Choose your own stack (Architecture Director guides)

**Step 2: Confirm project details**
Ask:
- Project name (used for directory and package.json name)
- Primary domain/deployment target
- Will you need: Auth? (y/n), Payments? (y/n), Analytics? (y/n)

**Step 3: Scaffold**
Based on template choice, provide:
1. Exact shell commands to create the project
2. The recommended directory structure
3. The `package.json` with all required dependencies
4. `.env.example` with all required variables
5. A project-specific `CLAUDE.md` to place at the project root
6. Initial `README.md`
7. GitHub Actions CI workflow

**Step 4: First steps checklist**
After scaffolding, print:
```
✅ Project scaffolded
Next steps:
1. cd [project-name]
2. cp .env.example .env  (then fill in your values)
3. npm install
4. [stack-specific setup steps]
5. Run /plan to create your first development plan
```
