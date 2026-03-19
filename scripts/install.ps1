# Agentes Loader - Install remote agents (Windows PowerShell)
# Usage: irm https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.ps1 | iex

$RepoUrl = "https://raw.githubusercontent.com/JorgeOliva10/Agentes/main"
$InstallDir = "$env:USERPROFILE\.config\kilo"

Write-Host "🚀 Installing all agents, subagents and rules..." -ForegroundColor Green

# Create directories
New-Item -ItemType Directory -Force -Path "$InstallDir\agent\subagent" | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\rules\scaffold" | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\rules\completion" | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\rules\review" | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\rules\validator" | Out-Null

# Agents
Write-Host "📥 Downloading agents..." -ForegroundColor Cyan
$Agents = @("mcp-scaffold", "mcp-completion-agent")
foreach ($agent in $Agents) {
    Invoke-WebRequest -Uri "$RepoUrl/agent/$agent.md" -OutFile "$InstallDir\agent\$agent.md"
}

# Subagents
Write-Host "📥 Downloading subagents..." -ForegroundColor Cyan
$Subagents = @(
    "orchestrator_agent",
    "repository_review_agent",
    "response_validator_agent",
    "docs_agent",
    "tools_agent",
    "tests_agent",
    "bruno_agent",
    "endpoints_doc_agent",
    "mcp_completion_subagent"
)
foreach ($subagent in $Subagents) {
    Invoke-WebRequest -Uri "$RepoUrl/agent/subagent/$subagent.md" -OutFile "$InstallDir\agent\subagent\$subagent.md"
}

# Rules - scaffold
Write-Host "📥 Downloading rules..." -ForegroundColor Cyan
$ScaffoldRules = @(
    "mcp01_project_structure.md",
    "mcp02_docs_markdown.md",
    "mcp03_required_files.md",
    "mcp04_no_overwrite.md",
    "mcp05_agent_placeholders.md",
    "mcp06_mcp_config.md"
)
foreach ($rule in $ScaffoldRules) {
    Invoke-WebRequest -Uri "$RepoUrl/rules/scaffold/$rule" -OutFile "$InstallDir\rules\scaffold\$rule"
}

# Rules - completion
$CompletionRules = @(
    "completion01_generate_missing_files.md",
    "completion02_generate_missing_directories.md",
    "completion03_generate_base_content.md",
    "completion04_extend_existing_docs.md",
    "completion05_extend_existing_code.md",
    "completion06_detect_missing_logic.md",
    "completion07_infer_tools_from_docs.md",
    "completion08_enforce_tool_consistency.md",
    "completion09_generate_unit_tests.md",
    "completion10_generate_bruno_scripts.md"
)
foreach ($rule in $CompletionRules) {
    Invoke-WebRequest -Uri "$RepoUrl/rules/completion/$rule" -OutFile "$InstallDir\rules\completion\$rule"
}

# Rules - review
$ReviewRules = @(
    "review01_structure_check.md",
    "review02_missing_files.md",
    "review03_config_validation.md",
    "review04_documentation_quality.md"
)
foreach ($rule in $ReviewRules) {
    Invoke-WebRequest -Uri "$RepoUrl/rules/review/$rule" -OutFile "$InstallDir\rules\review\$rule"
}

# Rules - validator
$ValidatorRules = @(
    "validation01_structure_validation.md",
    "validation02_required_files_validation.md",
    "validation03_markdown_validation.md",
    "validation04_mcp_config_validation.md"
)
foreach ($rule in $ValidatorRules) {
    Invoke-WebRequest -Uri "$RepoUrl/rules/validator/$rule" -OutFile "$InstallDir\rules\validator\$rule"
}

Write-Host ""
Write-Host "✅ All agents, subagents and rules installed successfully!" -ForegroundColor Green
Write-Host "📍 Location: $InstallDir" -ForegroundColor Yellow
