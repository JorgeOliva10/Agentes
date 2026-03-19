# Rule: Generate Bruno API Scripts

When the project is missing Bruno API testing scripts:

1. Create a `bruno/` directory at the project root if it does not exist
2. Create one `.bru` file per tool following the pattern `<tool_name>.bru`
3. Each script must include: meta block, POST request to the tool endpoint, and a JSON body with sample arguments
4. Infer sample arguments from tool documentation or source code
5. Never overwrite existing `.bru` files — only create missing ones

Example structure:
```
bruno/
└── get_current_weather.bru
```
