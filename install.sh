#!/bin/bash

# Agentes Loader - Install remote agents
# Usage: curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.sh | bash

set -e

REPO_URL="https://raw.githubusercontent.com/JorgeOliva10/Agentes/main"
INSTALL_DIR="${HOME}/.config/kilo"

echo "🚀 Installing all agents, subagents and rules..."

# Create directories
mkdir -p "$INSTALL_DIR/agent/subagent"
mkdir -p "$INSTALL_DIR/rules/scaffold"
mkdir -p "$INSTALL_DIR/rules/completion"
mkdir -p "$INSTALL_DIR/rules/review"
mkdir -p "$INSTALL_DIR/rules/validator"

# Agents
echo "📥 Downloading agents..."
for agent in mcp-scaffold mcp-completion-agent; do
    curl -sSL "$REPO_URL/agent/$agent.md" -o "$INSTALL_DIR/agent/$agent.md"
done

# Subagents
echo "📥 Downloading subagents..."
for subagent in orchestrator_agent repository_review_agent response_validator_agent docs_agent tools_agent tests_agent bruno_agent endpoints_doc_agent mcp_completion_subagent; do
    curl -sSL "$REPO_URL/agent/subagent/$subagent.md" -o "$INSTALL_DIR/agent/subagent/$subagent.md"
done

# Rules - scaffold
echo "📥 Downloading rules..."
for rule in mcp01_project_structure.md mcp02_docs_markdown.md mcp03_required_files.md mcp04_no_overwrite.md mcp05_agent_placeholders.md mcp06_mcp_config.md; do
    curl -sSL "$REPO_URL/rules/scaffold/$rule" -o "$INSTALL_DIR/rules/scaffold/$rule"
done

# Rules - completion
for rule in completion01_generate_missing_files.md completion02_generate_missing_directories.md completion03_generate_base_content.md completion04_extend_existing_docs.md completion05_extend_existing_code.md completion06_detect_missing_logic.md completion07_infer_tools_from_docs.md completion08_enforce_tool_consistency.md completion09_generate_unit_tests.md completion10_generate_bruno_scripts.md; do
    curl -sSL "$REPO_URL/rules/completion/$rule" -o "$INSTALL_DIR/rules/completion/$rule"
done

# Rules - review
for rule in review01_structure_check.md review02_missing_files.md review03_config_validation.md review04_documentation_quality.md; do
    curl -sSL "$REPO_URL/rules/review/$rule" -o "$INSTALL_DIR/rules/review/$rule"
done

# Rules - validator
for rule in validation01_structure_validation.md validation02_required_files_validation.md validation03_markdown_validation.md validation04_mcp_config_validation.md; do
    curl -sSL "$REPO_URL/rules/validator/$rule" -o "$INSTALL_DIR/rules/validator/$rule"
done

echo ""
echo "✅ All agents, subagents and rules installed successfully!"
echo "📍 Location: $INSTALL_DIR"
