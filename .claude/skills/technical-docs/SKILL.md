---
name: technical-docs
description: README files, API documentation, CLI reference, changelogs, and runbooks for software projects. Technical writing that developers trust because it's accurate and scannable.
globs: "README*,CHANGELOG*,docs/**/*.md,**/*.mdx"
---

# Technical Documentation

Technical documentation is trusted when it's accurate and scannable. Every developer reads docs with one question: "does this answer what I need to know right now?" If the answer takes more than 30 seconds to find, the docs have failed.

## README Structure

The README is the product's front door. A developer should be able to:
1. Understand what the project does in 15 seconds (the top)
2. Get it running in under 10 minutes (the Quick Start)
3. Know where to find more (the links)

**Required sections in order:**
```markdown
# Project Name
One sentence: what this does and who it's for.

## Quick Start
The minimum to go from nothing to working. Under 5 commands.

## Installation
Full installation with all prerequisites.

## Usage
The most common use case, complete and copy-pasteable.

## Configuration
Key configuration options with defaults shown.

## API Reference / Commands
Comprehensive reference (can link to separate doc).

## Contributing
How to contribute (or link to CONTRIBUTING.md).

## License
```

**Quick Start discipline**: If the Quick Start requires more than 5 commands, something is wrong with either the Quick Start or the product's setup experience. Simplify.

**Code blocks**: Every code block that can be copy-pasted should be copy-pasteable. No placeholders that look like real values. No commands that require context the reader doesn't have.

```bash
# ❌ Requires the reader to know what THEIR_API_KEY means
export API_KEY=THEIR_API_KEY

# ✅ Clear placeholder convention
export API_KEY=your_api_key_here  # Get this from your dashboard
```

## API Documentation

**Every endpoint needs:**
- Method and URL
- Authentication requirement (required/optional/none)
- Request body schema with field descriptions and types
- Response schema for success
- Error responses with specific codes and meanings
- A complete example (request + response, copy-pasteable)

**Error documentation**: Document the errors the developer will actually hit, not the theoretical ones. If a 422 means "email already exists," say that — don't document it as "Unprocessable Entity."

**OpenAPI/Swagger**: Generate from code where possible. Hand-maintained API docs drift from the implementation within weeks.

## CLI Reference

**Command format:**
```
command-name [required-arg] [--option VALUE] [--flag]

Description of what this command does.

Arguments:
  required-arg    Description. No default.

Options:
  --option VALUE  Description. Default: [default value].
  --flag          Description of what enabling this flag does.

Examples:
  command-name input.txt --output results.json
  command-name input.txt --flag
```

**Examples are not optional.** The example is what developers actually read. The description is what they read when the example doesn't answer their question.

## Changelog

Format: [Keep a Changelog](https://keepachangelog.com) standard.

```markdown
# Changelog

## [1.2.0] - 2026-04-08

### Added
- Feature description (user-facing, not internal implementation)

### Changed
- What changed and why (include migration note if breaking)

### Fixed
- Bug description: what the wrong behavior was, what the right behavior is

### Deprecated
- What is deprecated and what to use instead

### Removed
- What was removed and the migration path

### Security
- Vulnerability description (CVE if applicable)
```

**Changelog discipline:**
- Write from the user's perspective, not the developer's
- "Fixed crash when file path contains spaces" not "Fixed null pointer dereference in PathParser"
- Breaking changes get a migration note in the same entry, not a separate document
- Every release has a date

## Runbooks

Runbooks are operational documents for production incidents. They are read under stress. Design for that.

**Runbook structure:**
```markdown
# [Operation Name] Runbook

**When to use this**: [Specific trigger condition]
**Time to complete**: [Realistic estimate]
**Risk level**: Low / Medium / High

## Prerequisites
- [ ] Access to [specific system]
- [ ] [Tool] installed

## Steps
1. [Specific command or action]
   Expected output: [what you should see]
   If you see [error]: go to step 7 (Error Handling)

2. [Next step]

## Verification
[How to confirm the operation succeeded]

## Rollback
[Exact steps to undo this if something went wrong]

## Error Handling
**[Error message]**: [What it means and what to do]
```

**The "expected output" discipline**: Every step that produces output should document what success looks like. A developer following a runbook at 2am should never have to guess whether a step worked.
