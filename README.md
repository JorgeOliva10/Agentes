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

### Instalación rápida

```bash
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.sh | bash -s mcp-agent
```

### Instalación manual

1. Descarga el mode:
```bash
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/modes/mcp-agent.yaml \
  -o ~/.config/opencode/modes/mcp-agent.yaml
```

2. Descarga las rules:
```bash
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/rules/mcp01_project_structure.md \
  -o ~/.config/opencode/rules/mcp01_project_structure.md
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
