#!/bin/bash

# Agentes Loader - Install remote agents
# Usage: curl -sSL https://raw.githubusercontent.com/YOUR_USER/agentes/main/install.sh | bash -s mcp-agent

set -e

AGENT_NAME="${1:-mcp-scaffold}"
REPO_URL="https://raw.githubusercontent.com/JorgeOliva10/Agentes/main"
INSTALL_DIR="${HOME}/.config/opencode"

echo "🚀 Installing agent: $AGENT_NAME"

# Create directories if they don't exist
mkdir -p "$INSTALL_DIR/agent"
mkdir -p "$INSTALL_DIR/rules"

# Download agent file
echo "📥 Downloading agent configuration..."
curl -sSL "$REPO_URL/agent/$AGENT_NAME.md" -o "$INSTALL_DIR/agent/$AGENT_NAME.md"

# Download rules
echo "📥 Downloading rules..."
RULES=(
    "mcp01_project_structure.md"
    "mcp02_docs_markdown.md"
    "mcp03_required_files.md"
    "mcp04_no_overwrite.md"
    "mcp05_agent_placeholders.md"
    "mcp06_mcp_config.md"
)

for rule in "${RULES[@]}"; do
    curl -sSL "$REPO_URL/rules/$rule" -o "$INSTALL_DIR/rules/$rule"
done

echo "✅ Agent '$AGENT_NAME' installed successfully!"
echo "📍 Location: $INSTALL_DIR/modes/$AGENT_NAME.yaml"
echo ""
echo "🎯 Usage: Activate the agent in your IDE"
