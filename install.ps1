# Agentes Loader - Install remote agents (Windows PowerShell)
# Usage: irm https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.ps1 | iex

param(
    [string]$AgentName = "mcp-agent"
)

$RepoUrl = "https://raw.githubusercontent.com/JorgeOliva10/Agentes/main"
$InstallDir = "$env:USERPROFILE\.config\opencode"

Write-Host "🚀 Installing agent: $AgentName" -ForegroundColor Green

# Create directories if they don't exist
New-Item -ItemType Directory -Force -Path "$InstallDir\modes" | Out-Null
New-Item -ItemType Directory -Force -Path "$InstallDir\rules" | Out-Null

# Download mode file
Write-Host "📥 Downloading mode configuration..." -ForegroundColor Cyan
Invoke-WebRequest -Uri "$RepoUrl/modes/$AgentName.yaml" -OutFile "$InstallDir\modes\$AgentName.yaml"

# Download rules
Write-Host "📥 Downloading rules..." -ForegroundColor Cyan
$Rules = @(
    "mcp01_project_structure.md",
    "mcp02_docs_markdown.md",
    "mcp03_required_files.md",
    "mcp04_no_overwrite.md",
    "mcp05_agent_placeholders.md",
    "mcp06_mcp_config.md"
)

foreach ($rule in $Rules) {
    Invoke-WebRequest -Uri "$RepoUrl/rules/$rule" -OutFile "$InstallDir\rules\$rule"
}

Write-Host "✅ Agent '$AgentName' installed successfully!" -ForegroundColor Green
Write-Host "📍 Location: $InstallDir\modes\$AgentName.yaml" -ForegroundColor Yellow
Write-Host ""
Write-Host "🎯 Usage: Activate the agent in your IDE" -ForegroundColor Cyan
