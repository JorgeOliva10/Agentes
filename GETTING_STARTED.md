# 🚀 Getting Started

Esta guía explica cómo usar los agentes de este repositorio para crear un servidor MCP desde cero.

---

## El flujo

```
Tú describes qué quieres → el agente construye el proyecto
```

Los agentes analizan el proyecto, detectan qué falta y lo generan. Cuanto más contexto les des, mejor será el resultado. El punto de entrada más importante es el `README.md` del proyecto.

---

## Paso 1 — Crea la carpeta del proyecto

Crea una carpeta con el nombre de tu servidor MCP:

```
mi-mcp-server/
```

---

## Paso 2 — Crea el README.md del proyecto

Este es el paso más importante. El agente lee el `README.md` para entender qué debe construir. Cuanto más detallado sea, mejor será el resultado.

Crea un `README.md` dentro de la carpeta del proyecto con al menos esta información:

```markdown
# mi-mcp-server

Descripción de qué hace este servidor MCP.

## Tools

- **tool_name** — descripción de lo que hace, qué parámetros recibe y qué devuelve
- **otra_tool** — descripción...

## Notas adicionales

Cualquier detalle relevante sobre el comportamiento esperado, restricciones, etc.
```

### Ejemplo real

```markdown
# mcp-weather-server

Servidor MCP que proporciona información meteorológica en tiempo real.

## Tools

- **get_current_weather** — obtiene el tiempo actual para una ciudad. Recibe `city` (string) y devuelve temperatura, descripción y humedad.
- **get_forecast** — obtiene la previsión para los próximos días. Recibe `city` (string) y `days` (int).

## Notas adicionales

Usa la API de OpenWeatherMap. La API key se configura como variable de entorno.
```

---

## Paso 3 — Lanza el agente

Con el proyecto creado y el `README.md` escrito, lanza el agente desde el chat de Kilo o OpenCode:

**Para completar un proyecto existente:**
```
Usa el agente mcp-completion-agent con sus respectivos subagentes y las reglas
definidas en cada uno de ellos para completar el mcp server mi-mcp-server
```

**Para generar la estructura base desde cero:**
```
Usa el agente mcp-scaffold para generar la estructura base del mcp server mi-mcp-server
```

---

## ¿Qué genera el agente?

A partir del `README.md` el agente construye:

| Qué | Dónde |
|---|---|
| Estructura de directorios | `src/`, `docs/`, `tests/`, `bruno/` |
| Implementación de las tools | `src/` |
| Documentación de endpoints | `docs/endpoints.md` |
| Tests unitarios | `tests/` |
| Scripts de prueba de API | `bruno/` |
| Documentación completa | `README.md`, `DEV.md` |
| Configuración MCP | `mcp.json` o equivalente |

---

## Consejos

- Cuantas más tools describas en el `README.md`, más completo será el resultado
- Si ya tienes código parcial, el agente lo respeta y solo añade lo que falta
- Puedes relanzar el agente tantas veces como quieras, nunca sobreescribe lo que ya existe
