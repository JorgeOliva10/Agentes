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
# Descargar el mode
$installDir = "$env:USERPROFILE\.config\opencode\modes"
New-Item -ItemType Directory -Force -Path $installDir | Out-Null
Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/modes/mcp-agent.yaml' -OutFile "$installDir\mcp-agent.yaml"

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
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.sh | bash -s mcp-agent
```

**Instalación manual:**
```bash
# Descargar el mode
mkdir -p ~/.config/opencode/modes
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/modes/mcp-agent.yaml \
  -o ~/.config/opencode/modes/mcp-agent.yaml

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
3. Activa el agente `mcp-scaffold` en tu IDE
4. Comienza a crear proyectos MCP

## 🛠️ Estructura del repositorio

```
agentes/
├── modes/           # Configuraciones de agentes
│   └── mcp-agent.yaml
├── rules/           # Reglas y comportamientos
│   └── mcp-server-skeleton.md
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

```yaml
name: mi-agente
description: Descripción de lo que hace

model: devstrall-small

instructions: |
  Instrucciones para el agente...

tools:
  - create_file
  - read_file
```

## 📄 Licencia

MIT
