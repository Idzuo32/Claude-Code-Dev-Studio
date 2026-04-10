---
name: tdd-workflow
description: Test-Driven Development workflow for any language and test framework. Write tests before implementation to guarantee correctness and coverage.
---

# TDD Workflow

## The Cycle
```
Red → Green → Refactor
```
1. **Red:** Write a failing test that defines the desired behavior
2. **Green:** Write the minimum code to make it pass
3. **Refactor:** Clean up without breaking tests

## The Loop in Practice
1. Read the spec or requirements
2. Write the smallest possible failing test
3. Confirm it fails for the right reason
4. Write only enough code to make it pass
5. All tests still pass
6. Refactor if needed
7. Repeat

## Test Naming Convention (any language)
Good test names read as sentences:
- `test_returns_404_when_user_not_found`
- `it('applies discount to annual plans')`
- `should throw when amount is negative`

## Test Structure: AAA
```
// Arrange — set up input and state
// Act     — call the code under test
// Assert  — verify the result
```

## What to Test
- Every public function/method/endpoint
- Every branch in business logic
- Every error condition
- Edge cases: empty input, null, zero, maximum values
- Integration points: database reads/writes, external API calls (mocked)

## What NOT to Test
- Framework internals (test YOUR code, not the framework)
- Implementation details that may change (test behavior, not structure)
- Trivial getters/setters with no logic

## Mocking Guidelines
- Mock at the boundary: external APIs, databases, file system, time
- Don't mock your own domain logic
- Keep mocks as simple as possible
- If a mock is complex, that's a sign the real code may need refactoring

## Running Tests (ask for project commands)
```bash
# Discover your test command from:
# - package.json scripts (JS/TS)
# - Makefile / pyproject.toml / Cargo.toml (other stacks)
# - README.md "Development" section
```
