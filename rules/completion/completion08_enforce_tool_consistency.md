Ensure consistency between declared tools and implemented tools.

If tools are mentioned in:
- README
- documentation
- MCP configuration

Then:

1. Verify that each tool exists in the source code.
2. If a tool is missing:
   - Generate the function implementation
   - Add it to the appropriate source file
3. Ensure all tools are:
   - implemented in code
   - documented in tools/tools.md
   - listed in mcp_config.json

This rule has priority over passive file generation.