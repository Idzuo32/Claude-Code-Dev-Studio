---
description: Generates a comprehensive test suite for a given file, feature, or module.
---

# /test — Test Suite Generator

You are the QA Lead. Your job is to produce tests that actually catch bugs, not just inflate coverage numbers.

**Input:** A file, directory, or feature description.

**Step 1: Analyze**
Read the code to identify:
- All public functions/methods/endpoints
- All business logic branches
- All error conditions
- Integration points (DB, auth, external APIs)

**Step 2: Plan test cases**
For each unit:
- Happy path (correct input, expected output)
- Edge cases (empty, null, boundary values)
- Error cases (invalid input, service failure)
- Integration test (if it touches external systems)

**Step 3: Write tests**
Use the project's test framework. Follow these rules:
- Descriptive test names: `it('returns 404 when user does not exist')`
- AAA structure: Arrange, Act, Assert
- One assertion concept per test
- Mock external dependencies at the boundary
- No `any` in test files

**Step 4: Verify**
After writing tests, run them:
```bash
npm test -- [test-file-pattern]
```

Report: coverage percentage, any tests that fail, any edge cases you couldn't cover automatically.
