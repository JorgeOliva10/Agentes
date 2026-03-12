# 🤖 Agentes

Repositorio de agentes remotos reutilizables para OpenCode/Amazon Q.

## 📦 Agentes disponibles

### mcp-agent
Genera la estructura base de un proyecto MCP (Model Context Protocol) con documentación y directorios.

**Características:**
- Estructura de proyecto organizada
- Documentación automática
- Configuración MCP
- Extensible y limpio

## 🚀 Instalación

### Windows (PowerShell)

**Instalación rápida:**
```powershell
irm https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.ps1 | iex
```

**Instalación manual:**
```powershell
# Descargar el agente
$installDir = "$env:USERPROFILE\.config\opencode\agent"
New-Item -ItemType Directory -Force -Path $installDir | Out-Null
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/agent/mcp-scaffold.md' -OutFile "$installDir\mcp-scaffold.md"

# Descargar las rules
$rulesDir = "$env:USERPROFILE\.config\opencode\rules"
New-Item -ItemType Directory -Force -Path $rulesDir | Out-Null
$rules = @('mcp01_project_structure.md', 'mcp02_docs_markdown.md', 'mcp03_required_files.md', 'mcp04_no_overwrite.md', 'mcp05_agent_placeholders.md', 'mcp06_mcp_config.md')
foreach ($rule in $rules) {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/rules/$rule" -OutFile "$rulesDir\$rule"
}
```

### Linux / macOS (Bash)

**Instalación rápida:**
```bash
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.sh | bash -s mcp-scaffold
```

**Instalación manual:**
```bash
# Descargar el agente
mkdir -p ~/.config/opencode/agent
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/agent/mcp-scaffold.md \
  -o ~/.config/opencode/agent/mcp-scaffold.md

# Descargar las rules
mkdir -p ~/.config/opencode/rules
for rule in mcp01_project_structure.md mcp02_docs_markdown.md mcp03_required_files.md mcp04_no_overwrite.md mcp05_agent_placeholders.md mcp06_mcp_config.md; do
    curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/rules/$rule \
      -o ~/.config/opencode/rules/$rule
done
```

## 📖 Uso

1. Instala el agente usando el comando de instalación
2. Reinicia tu IDE o recarga la configuración
3. Lista los agentes disponibles: `opencode agent list`
4. El agente `mcp-scaffold` estará disponible automáticamente
5. Úsalo con: `opencode --agent mcp-scaffold`

## 🛠️ Estructura del repositorio

```
agentes/
├── agent/
│   └── mcp-scaffold.md
├── rules/
│   ├── mcp01_project_structure.md
│   ├── mcp02_docs_markdown.md
│   ├── mcp03_required_files.md
│   ├── mcp04_no_overwrite.md
│   ├── mcp05_agent_placeholders.md
│   └── mcp06_mcp_config.md
├── install.sh       # Script de instalación
└── README.md
```

## 🤝 Contribuir

¿Tienes un agente útil? ¡Compártelo!

1. Fork este repositorio
2. Añade tu agente en `modes/`
3. Añade las reglas en `rules/`
4. Crea un Pull Request

## 📝 Crear tu propio agente

Estructura básica de un agente:

```markdown
---
description: >-
  Descripción de lo que hace el agente
mode: all
---
Instrucciones para el agente...
```

## 📄 Licencia

MIT
