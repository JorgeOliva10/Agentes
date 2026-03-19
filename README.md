# 🤖 Agentes

Este repositorio es un ejemplo de cómo organizar y reutilizar agentes de IA para proyectos MCP (Model Context Protocol). Contiene dos agentes principales, sus subagentes especializados y las reglas que los gobiernan.

Compatible con **Kilo** y **OpenCode**.

---

## 📦 Agentes disponibles

### 1. `mcp-scaffold`
Genera la estructura base de un proyecto MCP desde cero. Crea los directorios, archivos de configuración, documentación inicial y placeholders para futuras implementaciones. Es el punto de partida limpio y organizado para cualquier servidor MCP.

### 2. `mcp-completion-agent`
Analiza un proyecto MCP existente y lo completa. Es más estricto y exhaustivo: detecta qué falta, delega tareas a subagentes especializados y valida el resultado final. Ejecuta un pipeline completo:

```
repository_review_agent → orchestrator_agent → response_validator_agent
```

El `orchestrator_agent` delega a su vez en subagentes especializados según lo que falte:

| Subagente | Responsabilidad |
|---|---|
| `docs_agent` | README.md, DEV.md, docs/*.md |
| `tools_agent` | Implementaciones de herramientas MCP |
| `tests_agent` | Tests unitarios en tests/ |
| `bruno_agent` | Scripts de prueba de API en bruno/ |
| `endpoints_doc_agent` | Documentación de endpoints de cada tool |

---

## 📁 Estructura del repositorio

```
agentes/
├── agent/
│   ├── mcp-scaffold.md
│   ├── mcp-completion-agent.md
│   └── subagent/
│       ├── orchestrator_agent.md
│       ├── repository_review_agent.md
│       ├── response_validator_agent.md
│       ├── docs_agent.md
│       ├── tools_agent.md
│       ├── tests_agent.md
│       ├── bruno_agent.md
│       ├── endpoints_doc_agent.md
│       └── mcp_completion_subagent.md
├── rules/
│   ├── scaffold/        ← reglas para mcp-scaffold
│   ├── completion/      ← reglas para generación y extensión de contenido
│   ├── review/          ← reglas para análisis y revisión de proyectos
│   └── validator/       ← reglas para validación final
├── install.ps1
├── install.sh
└── README.md
```

---

## 🚀 Instalación

### Windows (PowerShell)

```powershell
irm https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.ps1 | iex
```

### Linux / macOS (Bash)

```bash
curl -sSL https://raw.githubusercontent.com/JorgeOliva10/Agentes/main/install.sh | bash
```

Los agentes se instalan en `~/.config/kilo/agent/` y las reglas en `~/.config/kilo/rules/`.

---

## 💬 Ejemplo de uso

Una vez instalados los agentes, puedes usarlos directamente desde el chat de Kilo o OpenCode:

```
Usa el agente mcp-completion-agent con sus respectivos subagentes y las reglas
definidas en cada uno de ellos para completar el mcp server ubicado en
C:\Users\JorgeOlivadelaCruz\Downloads\mcp-formatos
```

```
Usa el agente mcp-completion-agent con sus respectivos subagentes y las reglas
definidas en cada uno de ellos para completar el mcp server ubicado en
C:\Users\JorgeOlivadelaCruz\Downloads\mcp-weather-server
```

---

## ✍️ Cómo añadir un agente

1. Crea un archivo `.md` en `agent/` con el siguiente frontmatter:

```markdown
---
description: >-
  Descripción de lo que hace el agente
mode: all
---
Instrucciones del agente...
```

2. En el cuerpo del agente, referencia las reglas que debe seguir indicando la ruta:

```markdown
Follow the rules defined at:
"~/.config/kilo/rules/<carpeta-de-reglas>"
```

3. Si el agente usa subagentes, indícalo explícitamente en el cuerpo y especifica su ruta:

```markdown
Subagents are located at:
"~/.config/kilo/agent/subagent"
```

---

## ✍️ Cómo añadir un subagente

1. Crea un archivo `.md` en `agent/subagent/` con `mode: subagent`:

```markdown
---
description: >-
  Descripción de lo que hace el subagente
mode: subagent
---
Instrucciones del subagente...
```

2. Referencia las reglas que debe seguir:

```markdown
Follow the rules defined at:
"~/.config/kilo/rules/<carpeta-de-reglas>"
```

3. Registra el subagente en el agente principal o en el `orchestrator_agent` para que pueda ser invocado.

---

## ✍️ Cómo añadir una regla

Las reglas están organizadas por carpetas según su propósito:

| Carpeta | Cuándo se usa |
|---|---|
| `rules/scaffold/` | Durante la generación de estructura base |
| `rules/completion/` | Durante la generación o extensión de contenido |
| `rules/review/` | Durante el análisis y revisión de proyectos |
| `rules/validator/` | Durante la validación final |

Para añadir una regla:

1. Crea un archivo `.md` en la carpeta correspondiente siguiendo la nomenclatura existente (ej. `completion11_nueva_regla.md`)
2. Escribe la regla en lenguaje natural claro y directo
3. Referencía la carpeta de reglas en el agente o subagente que deba seguirla

---

## 📄 Licencia

MIT
