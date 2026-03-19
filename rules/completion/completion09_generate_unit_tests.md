# Rule: Generate Unit Tests

When the project is missing unit tests:

1. Create a `tests/` directory at the project root if it does not exist
2. Create test files following the pattern `test_<module>.py` (or equivalent for the project language)
3. Each test function must be named `test_<tool_name>`
4. Each test must call the tool with valid sample inputs and assert at least one key field
5. Never overwrite existing test files — only add missing test functions

Example structure:
```
tests/
└── test_tools.py
```
