---
description: Testing standards that apply across all stacks and test frameworks.
---

# Testing Standards

## Coverage Requirements (defaults — override per project)
- Unit tests: 80% coverage minimum
- Integration tests: all critical paths covered
- E2E tests: all primary user journeys

## Test Quality Rules
- Test names describe behavior: `returns 404 when user not found`
- One concept per test — don't assert 10 things in one test
- Tests are independent — no shared mutable state between tests
- Tests are deterministic — same code, same result, every time
- No production data in tests — use factories or fixtures

## AAA Structure
```
// Arrange — set up data and state
// Act     — execute the code under test
// Assert  — verify the outcome
```

## Mocking Rules
- Mock at the boundary: external APIs, databases, file system, time, randomness
- Don't mock your own domain logic — if you need to, the design may need rethinking
- Keep mocks simple — complex mocks are a smell

## What Must Be Tested
- Business logic functions with any branching
- API endpoints (happy path + error cases)
- Authentication and authorization checks
- Data validation
- Any code that handles money, security, or user data

## CI Requirement
All tests must pass in CI before any merge. Flaky tests are fixed or removed — never skipped.
