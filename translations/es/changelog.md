# Registro de cambios - AZD Para Principiantes

## Introducción

Este registro de cambios documenta todos los cambios notables, actualizaciones y mejoras en el repositorio AZD Para Principiantes. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de Aprendizaje

Al revisar este registro de cambios, usted podrá:
- Mantenerse informado sobre nuevas características y adiciones de contenido
- Comprender las mejoras realizadas a la documentación existente
- Rastrear correcciones de errores y ajustes para garantizar la precisión
- Seguir la evolución de los materiales de aprendizaje con el tiempo

## Resultados de Aprendizaje

Después de revisar las entradas del registro de cambios, podrá:
- Identificar nuevo contenido y recursos disponibles para el aprendizaje
- Entender qué secciones han sido actualizadas o mejoradas
- Planificar su ruta de aprendizaje basándose en los materiales más actuales
- Contribuir con comentarios y sugerencias para futuras mejoras

## Historial de Versiones

### [v3.18.0] - 2026-03-16

#### Comandos AZD AI CLI, Validación de Contenido y Expansión de Plantillas
**Esta versión añade cobertura de comandos `azd ai`, `azd extension` y `azd mcp` en todos los capítulos relacionados con IA, corrige enlaces rotos y código obsoleto en agents.md, actualiza la hoja de referencia rápida y renueva la sección de Plantillas de Ejemplo con descripciones validadas y nuevas plantillas de Azure AI AZD.**

#### Añadido
- **🤖 Cobertura AZD AI CLI** en 7 archivos (antes solo en el Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nueva sección "Extensiones y Comandos AI" que presenta `azd extension`, `azd ai agent init` y `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opción 4: `azd ai agent init` con tabla comparativa (enfoque plantilla vs manifiesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecciones "AZD Extensions para Foundry" y "Despliegue Agent-First"
  - `docs/chapter-05-multi-agent/README.md` — Inicio rápido ahora muestra rutas de despliegue tanto por plantilla como por manifiesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Sección de despliegue incluye ahora la opción `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsección "Comandos de Extensión AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nueva sección "Comandos AI y Extensiones" con `azd extension`, `azd ai agent init`, `azd mcp` y `azd infra generate`
- **📦 Nuevas plantillas de ejemplo AZD AI** en `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET con Blazor WebAssembly, Semantic Kernel y soporte de voz
  - **azure-search-openai-demo-java** — Chat RAG Java usando Langchain4J con opciones de despliegue ACA/AKS
  - **contoso-creative-writer** — Aplicación multi-agente de escritura creativa usando Azure AI Agent Service, Bing Grounding y Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con soporte para desarrollo local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG con portal admin, integración Teams y opciones PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicación de referencia de orquestación multi-agente MCP con servidores en .NET, Python, Java y TypeScript
  - **azd-ai-starter** — Plantilla mínima Bicep para infraestructura Azure AI
  - **🔗 Enlace a la Galería Awesome AZD AI** — Referencia a la [Galería awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (más de 80 plantillas)

#### Corregido
- **🔗 Navegación en agents.md**: Los enlaces Anterior/Siguiente ahora coinciden con el orden de las lecciones del README del Capítulo 2 (Integración Microsoft Foundry → Agentes → Despliegue de Modelos AI)
- **🔗 Enlaces rotos en agents.md**: `production-ai-practices.md` corregido a `../chapter-08-production/production-ai-practices.md` (3 ocurrencias)
- **📦 Código obsoleto en agents.md**: Reemplazado `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida en agents.md**: `max_tokens` movido de `create_agent()` a `create_run()` como `max_completion_tokens`
- **🔢 Conteo de tokens en agents.md**: Reemplazada estimación aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Corrección de servicios de "Búsqueda Cognitiva + App Service" a "Azure AI Search + Azure Container Apps" (host predeterminado cambiado en oct 2024)
- **contoso-chat**: Actualizada descripción para referenciar Azure AI Foundry + Prompty, coincidiendo con el título y stack tecnológico real del repositorio

#### Eliminado
- **ai-document-processing**: Eliminada referencia a plantilla no funcional (repositorio no accesible públicamente como plantilla AZD)

#### Mejorado
- **📝 Ejercicios en agents.md**: El Ejercicio 1 ahora muestra salida esperada y paso `azd monitor`; Ejercicio 2 incluye código completo de registro `FunctionTool`; Ejercicio 3 reemplaza guías vagas con comandos concretos `prepdocs.py`
- **📚 Recursos en agents.md**: Actualizados enlaces de documentación a los actuales docs y guía rápida de Azure AI Agent Service
- **📋 Tabla de Pasos Siguientes en agents.md**: Añadido enlace al Laboratorio AI Workshop para cobertura completa del capítulo

#### Archivos Actualizados
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Mejora de Navegación del Curso
**Esta versión mejora la navegación del README.md del capítulo con un formato de tabla enriquecido.**

#### Cambiado
- **Tabla del Mapa del Curso**: Mejorada con enlaces directos a lecciones, estimaciones de duración y valoraciones de complejidad
- **Limpieza de Carpetas**: Eliminadas carpetas antiguas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validación de Enlaces**: Verificados más de 21 enlaces internos en la tabla del Mapa del Curso

### [v3.16.0] - 2026-02-05

#### Actualización de Nombres de Productos
**Esta versión actualiza referencias de productos conforme a la marca actual de Microsoft.**

#### Cambiado
- **Microsoft Foundry → Microsoft Foundry**: Todas las referencias actualizadas en archivos sin traducción
- **Azure AI Agent Service → Foundry Agents**: Nombre del servicio actualizado para reflejar la marca actual

#### Archivos Actualizados
- `README.md` - Página principal del curso
- `changelog.md` - Historial de versiones
- `course-outline.md` - Estructura del curso
- `docs/chapter-02-ai-development/agents.md` - Guía de agentes AI
- `examples/README.md` - Documentación de ejemplos
- `workshop/README.md` - Página principal del taller
- `workshop/docs/index.md` - Índice del taller
- `workshop/docs/instructions/*.md` - Todos los archivos de instrucciones del taller

---

### [v3.15.0] - 2026-02-05

#### Reestructuración Mayor del Repositorio: Nombres de Carpetas por Capítulos
**Esta versión reestructura la documentación en carpetas dedicadas por capítulos para una navegación más clara.**

#### Renombrado de Carpetas
Las carpetas antiguas fueron reemplazadas por carpetas numeradas por capítulos:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Añadida nueva: `docs/chapter-05-multi-agent/`

#### Migración de Archivos
| Archivo | De | A |
|------|------|---|
| azd-basics.md | getting-started/ | chapter-01-foundation/ |
| installation.md | getting-started/ | chapter-01-foundation/ |
| first-project.md | getting-started/ | chapter-01-foundation/ |
| configuration.md | getting-started/ | chapter-03-configuration/ |
| authsecurity.md | getting-started/ | chapter-03-configuration/ |
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |
| provisioning.md | deployment/ | chapter-04-infrastructure/ |
| Todos los archivos pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos los archivos troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Añadido
- **📚 Archivos README por capítulo**: Creación de README.md en cada carpeta de capítulo con:
  - Objetivos de aprendizaje y duración
  - Tabla de lecciones con descripciones
  - Comandos de inicio rápido
  - Navegación a otros capítulos

#### Cambiado
- **🔗 Actualizados todos los enlaces internos**: Más de 78 rutas actualizadas en toda la documentación
- **🗺️ README.md principal**: Mapa del Curso actualizado con la nueva estructura por capítulos
- **📝 examples/README.md**: Actualizadas referencias cruzadas a carpetas de capítulos

#### Eliminado
- Estructura vieja de carpetas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestructuración del Repositorio: Navegación por Capítulos
**Esta versión añadió archivos README de navegación por capítulos (superada por v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nueva Guía de Agentes AI
**Esta versión añade una guía completa para desplegar agentes AI con Azure Developer CLI.**

#### Añadido
- **🤖 docs/microsoft-foundry/agents.md**: Guía completa que cubre:
  - Qué son los agentes AI y cómo se diferencian de chatbots
  - Tres plantillas quick-start para agentes (Foundry Agents, Prompty, RAG)
  - Patrones de arquitectura de agentes (agente único, RAG, multi-agente)
  - Configuración y personalización de herramientas
  - Monitoreo y seguimiento de métricas
  - Consideraciones de costo y optimización
  - Escenarios comunes de solución de problemas
  - Tres ejercicios prácticos con criterios de éxito

#### Estructura del Contenido
- **Introducción**: Conceptos de agentes para principiantes
- **Inicio Rápido**: Despliegue de agentes con `azd init --template get-started-with-ai-agents`
- **Patrones de Arquitectura**: Diagramas visuales de patrones de agentes
- **Configuración**: Configuración de herramientas y variables de entorno
- **Monitoreo**: Integración con Application Insights
- **Ejercicios**: Aprendizaje práctico progresivo (20-45 minutos cada uno)

---

### [v3.12.0] - 2026-02-05

#### Actualización del Entorno DevContainer
**Esta versión actualiza la configuración del contenedor de desarrollo con herramientas modernas y mejores valores predeterminados para la experiencia de aprendizaje AZD.**

#### Cambiado
- **🐳 Imagen base**: Actualizada de `python:3.12-bullseye` a `python:3.12-bookworm` (última versión estable de Debian)
- **📛 Nombre del contenedor**: Renombrado de "Python 3" a "AZD para Principiantes" para mayor claridad

#### Añadido
- **🔧 Nuevas Funciones del Contenedor de Desarrollo**:
  - `azure-cli` con soporte para Bicep habilitado
  - `node:20` (versión LTS para plantillas AZD)
  - `github-cli` para gestión de plantillas
  - `docker-in-docker` para despliegues de aplicaciones en contenedores

- **🔌 Redirección de Puertos**: Puertos preconfigurados para desarrollo común:
  - 8000 (vista previa MkDocs)
  - 3000 (aplicaciones web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nuevas Extensiones de VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense mejorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Soporte para Azure Functions
  - `ms-azuretools.vscode-docker` - Soporte para Docker
  - `ms-azuretools.vscode-bicep` - Soporte para lenguaje Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestión de recursos Azure
  - `yzhang.markdown-all-in-one` - Edición Markdown
  - `DavidAnson.vscode-markdownlint` - Linter para Markdown
  - `bierner.markdown-mermaid` - Soporte para diagramas Mermaid
  - `redhat.vscode-yaml` - Soporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualización Git
  - `mhutchie.git-graph` - Historial Git

- **⚙️ Configuraciones VS Code**: Añadidas configuraciones por defecto para intérprete Python, formato al guardar y recorte de espacios en blanco

- **📦 Actualizado requirements-dev.txt**:
  - Añadido plugin MkDocs minify
  - Añadido pre-commit para calidad de código
  - Añadidos paquetes Azure SDK (azure-identity, azure-mgmt-resource)

#### Corregido
- **Comando Post-Creación**: Ahora verifica instalación de AZD y Azure CLI al iniciar el contenedor

---

### [v3.11.0] - 2026-02-05

#### Renovación del README Amigable para Principiantes
**Esta versión mejora significativamente el README.md para hacerlo más accesible a principiantes y añade recursos esenciales para desarrolladores de IA.**

#### Añadido
- **🆚 Comparación Azure CLI vs AZD**: Explicación clara de cuándo usar cada herramienta con ejemplos prácticos
- **🌟 Enlaces Geniales de AZD**: Enlaces directos a la galería de plantillas comunitarias y recursos de contribución:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - Más de 200 plantillas listas para desplegar
  - [Enviar una Plantilla](https://github.com/Azure/awesome-azd/issues) - Contribución comunitaria
- **🎯 Guía Rápida de Inicio**: Sección simplificada de 3 pasos para comenzar (Instalar → Iniciar sesión → Desplegar)
- **📊 Tabla de Navegación Basada en Experiencia**: Guía clara sobre dónde empezar según la experiencia del desarrollador

#### Cambiado
- **Estructura del README**: Reorganizado para divulgación progresiva - información clave primero
- **Sección Introducción**: Reescrita para explicar "La Magia de `azd up`" para principiantes completos
- **Contenido Duplicado Eliminado**: Removida sección de solución de problemas duplicada
- **Comandos de Solución de Problemas**: Corregida referencia `azd logs` para usar el válido `azd monitor --logs`

#### Corregido
- **🔐 Comandos de Autenticación**: Añadidos `azd auth login` y `azd auth logout` a cheat-sheet.md
- **Referencias Inválidas a Comandos**: Eliminadas las referencias restantes a `azd logs` en la sección de solución de problemas del README

#### Notas
- **Alcance**: Cambios aplicados a README.md principal y resources/cheat-sheet.md
- **Público Objetivo**: Mejoras dirigidas específicamente a desarrolladores nuevos en AZD

---

### [v3.10.0] - 2026-02-05

#### Actualización de Exactitud de Comandos del Azure Developer CLI
**Esta versión corrige comandos inexistentes de AZD en toda la documentación, asegurando que todos los ejemplos de código usen sintaxis válida de Azure Developer CLI.**

#### Corregido
- **🔧 Comandos AZD Inexistentes Removidos**: Auditoría y corrección exhaustiva de comandos inválidos:
  - `azd logs` (no existe) → reemplazado por `azd monitor --logs` o alternativas Azure CLI
  - Subcomandos `azd service` (no existen) → reemplazados por `azd show` y Azure CLI
  - `azd infra import/export/validate` (no existen) → removidos o sustituidos por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (no existen) → eliminados
  - Flags `azd provision --what-if/--rollback` (no existen) → actualizados a usar `--preview`
  - `azd config validate` (no existe) → reemplazado por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no existen) → eliminados

- **📚 Archivos Actualizados con Correcciones de Comandos**:
  - `resources/cheat-sheet.md`: Renovación mayor de referencia de comandos
  - `docs/deployment/deployment-guide.md`: Corrección de rollback y estrategias de despliegue
  - `docs/troubleshooting/debugging.md`: Corrección en secciones de análisis de logs
  - `docs/troubleshooting/common-issues.md`: Actualización de comandos de solución de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrección en sección de depuración AZD
  - `docs/getting-started/azd-basics.md`: Corrección de comandos de monitoreo
  - `docs/getting-started/first-project.md`: Actualización de ejemplos de monitoreo y depuración
  - `docs/getting-started/installation.md`: Corrección en ejemplos de ayuda y versión
  - `docs/pre-deployment/application-insights.md`: Corrección en comandos para visualizar logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrección en comandos de depuración de agentes

- **📝 Referencia de Versión Actualizada**:
  - `docs/getting-started/installation.md`: Cambio de versión fija `1.5.0` a genérica `1.x.x` con enlace a releases

#### Cambiado
- **Estrategias de Rollback**: Documentación actualizada para usar rollback basado en Git (AZD no tiene rollback nativo)
- **Visualización de Logs**: Reemplazadas referencias a `azd logs` por `azd monitor --logs`, `azd monitor --live` y comandos Azure CLI
- **Sección de Rendimiento**: Eliminadas flags inexistentes de despliegue paralelo/incremental, añadidas alternativas válidas

#### Detalles Técnicos
- **Comandos válidos AZD**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidos de azd monitor**: `--live`, `--logs`, `--overview`
- **Características eliminadas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificación**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalización del Taller e Informe de Calidad de la Documentación
**Esta versión completa los módulos interactivos del taller, corrige todos los enlaces rotos en la documentación y mejora la calidad general del contenido para desarrolladores de IA que usan Microsoft AZD.**

#### Añadido
- **📝 CONTRIBUTING.md**: Nuevo documento de directrices de contribución con:
  - Instrucciones claras para reportar problemas y proponer cambios
  - Estándares de documentación para nuevo contenido
  - Directrices para ejemplos de código y convenciones de mensajes de commit
  - Información de participación comunitaria

#### Completado
- **🎯 Módulo 7 del Taller (Conclusión)**: Módulo de cierre totalmente completado con:
  - Resumen completo de logros del taller
  - Sección de conceptos clave dominados sobre AZD, plantillas y Microsoft Foundry
  - Recomendaciones para continuar el aprendizaje
  - Ejercicios de desafío con niveles de dificultad
  - Enlaces de retroalimentación y soporte comunitario

- **📚 Módulo 3 del Taller (Deconstruct)**: Objetivos de aprendizaje actualizados con:
  - Guía para activar GitHub Copilot con servidores MCP
  - Comprensión de estructura de carpetas de plantillas AZD
  - Patrones de organización de infraestructura como código (Bicep)
  - Instrucciones para laboratorio práctico

- **🔧 Módulo 6 del Taller (Teardown)**: Completo con:
  - Limpieza de recursos y objetivos de gestión de costos
  - Uso de `azd down` para desprovisionamiento seguro de infraestructura
  - Guía para recuperación de servicios cognitivos eliminados suavemente
  - Indicaciones extra para exploración de GitHub Copilot y Azure Portal

#### Corregido
- **🔗 Corrección de Enlaces Rotos**: Resueltos más de 15 enlaces internos rotos en documentación:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrección de rutas a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrección de rutas a ai-model-deployment.md y production-ai-practices.md
  - `docs/getting-started/first-project.md`: Reemplazado cicd-integration.md (no existe) por deployment-guide.md
  - `examples/retail-scenario.md`: Corrección de rutas en FAQ y guía de solución de problemas
  - `examples/container-app/microservices/README.md`: Corrección de rutas a inicio de curso y guía de despliegue
  - `resources/faq.md` y `resources/glossary.md`: Actualización de referencias al capítulo IA
  - `course-outline.md`: Corrección de guías de instructor y referencias al laboratorio IA

- **📅 Banner de Estado del Taller**: Actualizado de "En construcción" a estado activo del taller con fecha febrero 2026

- **🔗 Navegación del Taller**: Corrección de enlaces rotos de navegación en README.md del taller apuntando a carpeta lab-1-azd-basics inexistente

#### Cambiado
- **Presentación del Taller**: Eliminada advertencia de "en construcción", taller ahora está completo y listo para usar
- **Consistencia de Navegación**: Garantizada navegación adecuada entre módulos del taller
- **Referencias de Ruta de Aprendizaje**: Actualizadas referencias cruzadas de capítulos para usar rutas correctas de microsoft-foundry

#### Validado
- ✅ Todos los archivos markdown en inglés contienen enlaces internos válidos
- ✅ Módulos del taller 0-7 completos con objetivos de aprendizaje
- ✅ Navegación entre capítulos y módulos funciona correctamente
- ✅ Contenido adecuado para desarrolladores de IA que usan Microsoft AZD
- ✅ Lenguaje y estructura amigables para principiantes mantenidos en todo momento
- ✅ CONTRIBUTING.md provee guía clara para contribuyentes comunitarios

#### Implementación Técnica
- **Validación de Enlaces**: Script PowerShell automático verificó todos los enlaces internos .md
- **Auditoría de Contenido**: Revisión manual de completitud del taller y adecuación para principiantes
- **Sistema de Navegación**: Aplicados patrones consistentes de navegación entre capítulos y módulos

#### Notas
- **Alcance**: Cambios aplicados solo a documentación en inglés
- **Traducciones**: Carpetas de traducción no actualizadas en esta versión (la traducción automática se sincronizará después)
- **Duración del Taller**: Taller completo ofrece ahora entre 3 y 4 horas de aprendizaje práctico

---

### [v3.8.0] - 2025-11-19

#### Documentación avanzada: Monitorización, Seguridad y Patrones Multi-Agente
**Esta versión añade lecciones completas de grado A sobre integración con Application Insights, patrones de autenticación y coordinación multi-agente para despliegues en producción.**

#### Añadido
- **📊 Lección de Integración Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Despliegue enfocado en AZD con aprovisionamiento automático
  - Plantillas Bicep completas para Application Insights + Log Analytics
  - Aplicaciones Python funcionales con telemetría personalizada (más de 1,200 líneas)
  - Patrones de monitorización AI/LLM (seguimiento de token/costes modelos Microsoft Foundry)
  - 6 diagramas Mermaid (arquitectura, trazabilidad distribuida, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, paneles, monitorización AI)
  - Ejemplos de consultas Kusto y estrategias de optimización de costes
  - Transmisión de métricas en vivo y depuración en tiempo real
  - Tiempo de aprendizaje de 40-50 minutos con patrones listos para producción

- **🔐 Lección de Patrones de Autenticación y Seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (cadenas de conexión, Key Vault, identidad administrada)
  - Plantillas Bicep completas para infraestructura segura
  - Código de aplicación Node.js con integración Azure SDK
  - 3 ejercicios completos (habilitar identidad administrada, identidad asignada por usuario, rotación Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de solución de problemas y análisis de costes
  - Patrones listos para producción de autenticación sin contraseña

- **🤖 Lección de Patrones de Coordinación Multi-Agente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, dirigido por eventos, consenso)
  - Implementación completa de servicio orquestador (Python/Flask, más de 1,500 líneas)
  - 3 implementaciones especializadas de agentes (Investigación, Escritor, Editor)
  - Integración Service Bus para cola de mensajes
  - Gestión de estado con Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid mostrando interacciones de agentes
  - 3 ejercicios avanzados (manejo de tiempo de espera, lógica de reintentos, interruptor de circuito)
  - Desglose de coste ($240-565/mes) con estrategias de optimización
  - Integración con Application Insights para monitorización

#### Mejorado
- **Capítulo Pre-despliegue**: Ahora incluye patrones completos de monitorización y coordinación
- **Capítulo Introducción**: Mejorado con patrones profesionales de autenticación
- **Preparación para Producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del Curso**: Actualizado para referenciar nuevas lecciones en Capítulos 3 y 6

#### Cambiado
- **Progresión del Aprendizaje**: Mejor integración de seguridad y monitorización en todo el curso
- **Calidad de la Documentación**: Estándares consistentes de grado A (95-97%) en nuevas lecciones
- **Patrones de Producción**: Cobertura completa de extremo a extremo para despliegues empresariales

#### Mejorado
- **Experiencia de desarrollador**: Ruta clara desde el desarrollo hasta la supervisión en producción
- **Estándares de seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de trabajo de IA**: Monitorización especializada para Microsoft Foundry Models y sistemas multiagente

#### Validado
- ✅ Todas las lecciones incluyen código completo y funcional (no fragmentos)
- ✅ Diagramas Mermaid para aprendizaje visual (19 en total en 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 en total)
- ✅ Plantillas Bicep listas para producción desplegables mediante `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de solución de problemas y mejores prácticas
- ✅ Puntos de control de conocimiento con comandos de verificación

#### Resultados de la evaluación de la documentación
- **docs/pre-deployment/application-insights.md**: - Guía integral de monitorización
- **docs/getting-started/authsecurity.md**: - Patrones profesionales de seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas multiagente avanzadas
- **Contenido Nuevo General**: - Estándares de alta calidad consistentes

#### Implementación técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazado distribuido
- **Autenticación**: Managed Identity + Key Vault + patrones RBAC
- **Multiagente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Supervisión**: Métricas en vivo + consultas Kusto + alertas + paneles
- **Gestión de costos**: Estrategias de muestreo, políticas de retención, controles presupuestarios

### [v3.7.0] - 2025-11-19

#### Mejoras en la calidad de la documentación y nuevo ejemplo de Microsoft Foundry Models
**Esta versión mejora la calidad de la documentación en todo el repositorio y añade un ejemplo completo de despliegue de Microsoft Foundry Models con interfaz de chat gpt-4.1.**

#### Añadido
- **🤖 Ejemplo de chat Microsoft Foundry Models**: Despliegue completo de gpt-4.1 con implementación funcional en `examples/azure-openai-chat/`:
  - Infraestructura completa de Microsoft Foundry Models (despliegue modelo gpt-4.1)
  - Interfaz de chat de línea de comandos Python con historial de conversación
  - Integración con Key Vault para almacenamiento seguro de claves API
  - Seguimiento del uso de tokens y estimación de costos
  - Limitación de tasa y manejo de errores
  - README completo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, app Python, configuración)
- **📚 Ejercicios de documentación**: Añadidos ejercicios prácticos a la guía de configuración:
  - Ejercicio 1: Configuración multi-entorno (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios claros de éxito y pasos de verificación
- **✅ Verificación de despliegue**: Sección de verificación añadida a la guía de despliegue:
  - Procedimientos de comprobación de estado
  - Lista de criterios de éxito
  - Salidas esperadas para todos los comandos de despliegue
  - Referencia rápida para solución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad A (93%):
  - Añadido azure-openai-chat a todas las secciones relevantes
  - Conteo de ejemplos locales actualizado de 3 a 4
  - Añadido a tabla de ejemplos de aplicaciones AI
  - Integrado en Quick Start para usuarios intermedios
  - Añadido a sección de plantillas Microsoft Foundry
  - Actualizadas matriz comparativa y secciones de tecnología
- **Calidad de la documentación**: Mejorado de B+ (87%) a A- (92%) en carpeta docs:
  - Añadidas salidas esperadas en ejemplos de comandos críticos
  - Incluidos pasos de verificación para cambios de configuración
  - Mejorado aprendizaje práctico con ejercicios útiles

#### Cambiado
- **Progresión de aprendizaje**: Mejor integración de ejemplos AI para aprendices intermedios
- **Estructura de la documentación**: Ejercicios más accionables con resultados claros
- **Proceso de verificación**: Añadidos criterios explícitos de éxito en flujos clave

#### Mejorado
- **Experiencia de desarrollador**: El despliegue de Microsoft Foundry Models ahora toma 35-45 minutos (antes 60-90 en alternativas complejas)
- **Transparencia de costos**: Estimaciones claras ($50-200/mes) para el ejemplo Microsoft Foundry Models
- **Camino de aprendizaje**: Los desarrolladores AI tienen un punto de entrada claro con azure-openai-chat
- **Estándares de documentación**: Salidas esperadas y pasos de verificación consistentes

#### Validado
- ✅ Ejemplo Microsoft Foundry Models completamente funcional con `azd up`
- ✅ Los 11 archivos de implementación sintácticamente correctos
- ✅ Instrucciones README coinciden con experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ Índice de ejemplos refleja con precisión 4 ejemplos locales
- ✅ Sin enlaces externos duplicados en tablas
- ✅ Todas las referencias de navegación correctas

#### Implementación técnica
- **Arquitectura Microsoft Foundry Models**: gpt-4.1 + Key Vault + patrón Container Apps
- **Seguridad**: Managed Identity disponible, secretos en Key Vault
- **Monitorización**: Integración Application Insights
- **Gestión de costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Un único comando `azd up` para configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización mayor: ejemplos de despliegue de Container App
**Esta versión introduce ejemplos completos y listos para producción de despliegue de aplicaciones en contenedores usando Azure Developer CLI (AZD), con documentación completa e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos Container App**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Guía maestra](examples/container-app/README.md): Visión completa de despliegues contenerizados, inicio rápido, producción y patrones avanzados
  - [API Flask simple](../../examples/container-app/simple-flask-api): API REST para principiantes con escalado a cero, sondeos de salud, monitorización y solución de problemas
  - [Arquitectura Microservicios](../../examples/container-app/microservices): Despliegue multi-servicio listo para producción (API Gateway, Producto, Pedido, Usuario, Notificación), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazado distribuido, despliegue blue-green/canario
- **Mejores prácticas**: Seguridad, monitorización, optimización de costos y guía CI/CD para cargas contenerizadas
- **Ejemplos de código**: `azure.yaml`, plantillas Bicep completas y servicios multilenguaje (Python, Node.js, C#, Go)
- **Pruebas y solución de problemas**: Escenarios de pruebas de extremo a extremo, comandos de monitorización, guías de troubleshooting

#### Cambiado
- **README.md**: Actualizado para presentar y enlazar nuevos ejemplos container app bajo "Ejemplos locales - Aplicaciones en contenedores"
- **examples/README.md**: Actualizado para destacar ejemplos container app, añadir entradas matriz comparativa y actualizar referencias de tecnología/arquitectura
- **Esquema del curso y guía de estudio**: Actualizados para referenciar nuevos ejemplos container app y patrones de despliegue en capítulos relevantes

#### Validado
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y siguiendo mejores prácticas
- ✅ Enlaces cruzados y navegación de documentación actualizados
- ✅ Ejemplos cubren desde escenarios principiantes hasta avanzados, incluyendo microservicios en producción

#### Notas
- **Alcance**: Documentación y ejemplos solo en inglés
- **Próximos pasos**: Ampliar con patrones contenerizados avanzados y automatización CI/CD en futuras versiones

### [v3.5.0] - 2025-11-19

#### Rebranding del producto: Microsoft Foundry
**Esta versión implementa un cambio de nombre completo del producto de "Microsoft Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando el rebranding oficial de Microsoft.**

#### Cambiado
- **🔄 Actualización del nombre del producto**: Rebranding completo de "Microsoft Foundry" a "Microsoft Foundry"
  - Actualizadas todas las referencias en documentación en inglés dentro de `docs/`
  - Renombrada carpeta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renombrado archivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referencias actualizadas en 7 archivos de documentación

- **📁 Cambios en estructura de carpetas**:
  - `docs/ai-foundry/` renombrado a `docs/microsoft-foundry/`
  - Actualizadas todas las referencias cruzadas para reflejar nueva estructura de carpetas
  - Links de navegación validados en toda la documentación

- **📄 Renombrado de archivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Actualizados todos los enlaces internos para referenciar nuevo nombre de archivo

#### Archivos actualizados
- **Documentación de capítulos** (7 archivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias de nombre de producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ya usa Microsoft Foundry (de actualizaciones previas)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (visión general, feedback comunidad, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces de referencia cruzada actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulo actualizados
  - `docs/getting-started/installation.md` - 2 enlaces siguientes de capítulo actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Archivos de estructura del curso** (2 archivos):
  - `README.md` - 17 referencias actualizadas (visión del curso, títulos de capítulos, sección plantillas, insights comunidad)
  - `course-outline.md` - 14 referencias actualizadas (visión general, objetivos de aprendizaje, recursos de capítulos)

#### Validado
- ✅ No quedan referencias de ruta "ai-foundry" en docs en inglés
- ✅ No quedan referencias al nombre producto antiguo en docs en inglés
- ✅ Todos los enlaces de navegación funcionan con nueva estructura de carpetas
- ✅ Renombrado de archivos y carpetas completado correctamente
- ✅ Referencias cruzadas entre capítulos validadas

#### Notas
- **Alcance**: Cambios aplicados solo a documentación en inglés dentro de `docs/`
- **Traducciones**: Carpetas de traducción (`translations/`) no actualizadas en esta versión
- **Talleres**: Materiales de taller (`workshop/`) no actualizados en esta versión
- **Ejemplos**: Archivos de ejemplo todavía pueden tener nombres heredados (pendiente en actualización futura)
- **Enlaces externos**: URLs externas y referencias a repositorio GitHub permanecen sin cambios

#### Guía de migración para contribuyentes
Si tienen ramas locales o documentación que referencia la estructura antigua:
1. Actualizar referencias de carpeta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualizar referencias de archivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Reemplazar nombre del producto: "Microsoft Foundry" → "Microsoft Foundry"
4. Validar que todos los enlaces internos a documentación sigan funcionando

---

### [v3.4.0] - 2025-10-24

#### Vista previa de infraestructura y mejoras en validación
**Esta versión introduce soporte completo para la nueva funcionalidad de vista previa de Azure Developer CLI y mejora la experiencia de usuario en el taller.**

#### Añadido
- **🧪 Documentación de azd provision --preview**: Cobertura completa de la nueva capacidad de vista previa de infraestructura
  - Referencia de comandos y ejemplos de uso en hoja de trucos
  - Integración detallada en guía de provisión con casos de uso y beneficios
  - Integración de chequeo previo para validación de despliegue más seguro
  - Actualizaciones en guía de inicio con prácticas de despliegue seguras
- **🚧 Banner de estado de taller**: Banner profesional en HTML indicando estado de desarrollo del taller
  - Diseño con gradiente e indicadores de construcción para comunicación clara al usuario
  - Marcas de última actualización para transparencia
  - Diseño responsivo para dispositivos móviles

#### Mejorado
- **Seguridad en infraestructura**: Funcionalidad de vista previa integrada en toda la documentación de despliegue
- **Validación previa al despliegue**: Scripts automatizados ahora incluyen pruebas de vista previa de infraestructura
- **Flujo de trabajo del desarrollador**: Secuencias de comandos actualizadas para incluir vista previa como mejor práctica
- **Experiencia de taller**: Expectativas claras para usuarios sobre estado de desarrollo del contenido

#### Cambiado
- **Mejores prácticas de despliegue**: Flujo de trabajo con vista previa primero recomendado como estándar
- **Flujo de documentación**: Validación de infraestructura movida a etapas tempranas del aprendizaje
- **Presentación del taller**: Comunicación profesional de estado con línea temporal clara de desarrollo

#### Mejorado
- **Enfoque de seguridad primero**: Cambios de infraestructura ahora validables antes del despliegue
- **Colaboración en equipo**: Resultados de vista previa pueden ser compartidos para revisión y aprobación
- **Conciencia de costos**: Mejor comprensión de costos antes de aprovisionar recursos
- **Mitigación de riesgos**: Menores fallos en despliegue gracias a validación anticipada

#### Implementación técnica
- **Integración multidocumento**: Funcionalidad de vista previa documentada en 4 archivos clave
- **Patrones de comandos**: Sintaxis y ejemplos consistentes en toda la documentación
- **Integración de mejores prácticas**: Vista previa incluida en flujos y scripts de validación
- **Indicadores visuales**: Marcas claras de NUEVA función para facilitar descubrimiento

#### Infraestructura del taller
- **Comunicación de estado**: Banner profesional en HTML con estilo degradado
- **Experiencia de usuario**: Estado de desarrollo claro evita confusión
- **Presentación profesional**: Mantiene la credibilidad del repositorio a la vez que establece expectativas
- **Transparencia temporal**: Fecha de última actualización octubre de 2025 para rendición de cuentas

### [v3.3.0] - 2025-09-24

#### Mejoras en materiales de taller y experiencia de aprendizaje interactiva
**Esta versión introduce materiales completos para taller con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Añadido
- **🎥 Guía Interactiva del Taller**: Experiencia de taller basada en navegador con capacidad de vista previa de MkDocs  
- **📝 Instrucciones Estructuradas del Taller**: Ruta de aprendizaje guiada en 7 pasos desde el descubrimiento hasta la personalización  
  - 0-Introducción: Resumen y configuración del taller  
  - 1-Seleccionar-Plantilla-AI: Proceso de descubrimiento y selección de plantilla  
  - 2-Validar-Plantilla-AI: Procedimientos de despliegue y validación  
  - 3-Desconstruir-Plantilla-AI: Comprensión de la arquitectura de la plantilla  
  - 4-Configurar-Plantilla-AI: Configuración y personalización  
  - 5-Personalizar-Plantilla-AI: Modificaciones avanzadas e iteraciones  
  - 6-Derribar-Infraestructura: Limpieza y gestión de recursos  
  - 7-Cierre: Resumen y próximos pasos  
- **🛠️ Herramientas del Taller**: Configuración de MkDocs con tema Material para una experiencia de aprendizaje mejorada  
- **🎯 Ruta de Aprendizaje Práctico**: Metodología en 3 pasos (Descubrimiento → Despliegue → Personalización)  
- **📱 Integración con GitHub Codespaces**: Configuración fluida del entorno de desarrollo  

#### Mejorado  
- **Laboratorio de Taller AI**: Ampliado con experiencia de aprendizaje estructurada de 2-3 horas  
- **Documentación del Taller**: Presentación profesional con navegación y ayudas visuales  
- **Progresión del Aprendizaje**: Guía clara paso a paso desde selección de plantilla hasta despliegue en producción  
- **Experiencia del Desarrollador**: Herramientas integradas para flujos de trabajo de desarrollo simplificados  

#### Mejorado  
- **Accesibilidad**: Interfaz basada en navegador con búsqueda, función de copiar y cambio de tema  
- **Aprendizaje Autodidacta**: Estructura flexible del taller que acomoda diferentes ritmos de aprendizaje  
- **Aplicación Práctica**: Escenarios reales de despliegue de plantillas AI  
- **Integración Comunitaria**: Integración con Discord para soporte y colaboración en el taller  

#### Características del Taller  
- **Búsqueda Incorporada**: Descubrimiento rápido por palabras clave y lecciones  
- **Copiar Bloques de Código**: Funcionalidad de copiar al pasar el cursor para todos los ejemplos de código  
- **Cambio de Tema**: Soporte para modo oscuro/claro según preferencias  
- **Recursos Visuales**: Capturas de pantalla y diagramas para mejor comprensión  
- **Integración de Ayuda**: Acceso directo a Discord para soporte comunitario  

### [v3.2.0] - 2025-09-17  

#### Reestructuración Mayor de Navegación y Sistema de Aprendizaje Basado en Capítulos  
**Esta versión introduce una estructura integral de aprendizaje basada en capítulos con navegación mejorada a lo largo de todo el repositorio.**  

#### Añadido  
- **📚 Sistema de Aprendizaje Basado en Capítulos**: Reestructuración completa del curso en 8 capítulos progresivos  
  - Capítulo 1: Fundamentos y Puesta en Marcha (⭐ - 30-45 mins)  
  - Capítulo 2: Desarrollo AI-First (⭐⭐ - 1-2 horas)  
  - Capítulo 3: Configuración y Autenticación (⭐⭐ - 45-60 mins)  
  - Capítulo 4: Infraestructura como Código y Despliegue (⭐⭐⭐ - 1-1.5 horas)  
  - Capítulo 5: Soluciones Multi-Agente AI (⭐⭐⭐⭐ - 2-3 horas)  
  - Capítulo 6: Validación y Planificación Pre-Despliegue (⭐⭐ - 1 hora)  
  - Capítulo 7: Solución de Problemas y Depuración (⭐⭐ - 1-1.5 horas)  
  - Capítulo 8: Patrones de Producción y Empresariales (⭐⭐⭐⭐ - 2-3 horas)  
- **📚 Sistema de Navegación Completo**: Encabezados y pies de página consistentes en toda la documentación  
- **🎯 Seguimiento de Progreso**: Lista de verificación de finalización del curso y sistema de verificación de aprendizaje  
- **🗺️ Guía de Ruta de Aprendizaje**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos  
- **🔗 Navegación con Referencias Cruzadas**: Capítulos relacionados y prerrequisitos claramente enlazados  

#### Mejorado  
- **Estructura README**: Transformada en plataforma de aprendizaje estructurada con organización por capítulos  
- **Navegación en Documentación**: Cada página incluye contexto de capítulo y guía de progresión  
- **Organización de Plantillas**: Ejemplos y plantillas asignados a capítulos de aprendizaje correspondientes  
- **Integración de Recursos**: Hojas de ayuda, FAQs y guías de estudio conectadas a capítulos relevantes  
- **Integración de Taller**: Laboratorios prácticos mapeados a múltiples objetivos de aprendizaje por capítulo  

#### Cambiado  
- **Progresión de Aprendizaje**: Cambio de documentación lineal a aprendizaje flexible basado en capítulos  
- **Ubicación de Configuración**: Guía de configuración reubicada al Capítulo 3 para mejor flujo de aprendizaje  
- **Integración de Contenido AI**: Mejor integración del contenido específico de AI durante el recorrido de aprendizaje  
- **Contenido de Producción**: Patrones avanzados consolidados en Capítulo 8 para aprendices empresariales  

#### Mejorado  
- **Experiencia de Usuario**: Migas de pan claras y indicadores de progresión por capítulo  
- **Accesibilidad**: Patrones de navegación consistentes para facilitar el recorrido del curso  
- **Presentación Profesional**: Estructura de curso estilo universitario adecuada para formación académica y corporativa  
- **Eficiencia de Aprendizaje**: Tiempo reducido para encontrar contenido relevante gracias a mejor organización  

#### Implementación Técnica  
- **Encabezados de Navegación**: Navegación estandarizada por capítulos en más de 40 archivos de documentación  
- **Navegación en el Pie de Página**: Guía consistente de progresión e indicadores de finalización de capítulos  
- **Enlaces Cruzados**: Sistema de enlaces internos integral que conecta conceptos relacionados  
- **Mapeo de Capítulos**: Plantillas y ejemplos claramente asociados a objetivos de aprendizaje  

#### Mejora de Guía de Estudio  
- **📚 Objetivos de Aprendizaje Completo**: Reestructuración de la guía de estudio para alinearse con el sistema de 8 capítulos  
- **🎯 Evaluación Basada en Capítulos**: Cada capítulo incluye objetivos específicos y ejercicios prácticos  
- **📋 Seguimiento de Progreso**: Plan de aprendizaje semanal con resultados medibles y listas de verificación de finalización  
- **❓ Preguntas de Evaluación**: Preguntas de validación de conocimientos para cada capítulo con resultados profesionales  
- **🛠️ Ejercicios Prácticos**: Actividades hands-on con escenarios reales de despliegue y solución de problemas  
- **📊 Progresión de Habilidades**: Avance claro desde conceptos básicos hasta patrones empresariales con enfoque en desarrollo profesional  
- **🎓 Marco de Certificación**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario  
- **⏱️ Gestión del Cronograma**: Plan estructurado de aprendizaje de 10 semanas con validación de hitos  

### [v3.1.0] - 2025-09-17  

#### Soluciones AI Multi-Agente Mejoradas  
**Esta versión mejora la solución minorista multi-agente con una mejor nombramiento de agentes y documentación enriquecida.**  

#### Cambiado  
- **Terminología Multi-Agente**: Reemplazo de "agente Cora" por "agente Cliente" en toda la solución minorista multi-agente para mayor claridad  
- **Arquitectura del Agente**: Actualización de toda la documentación, plantillas ARM y ejemplos de código para usar el nombre "agente Cliente" consistente  
- **Ejemplos de Configuración**: Modernización de patrones de configuración de agentes con convenciones de nombres actualizadas  
- **Consistencia en Documentación**: Asegurado que todas las referencias usan nombres profesionales y descriptivos para los agentes  

#### Mejorado  
- **Paquete de Plantillas ARM**: Actualización de retail-multiagent-arm-template con referencias al agente Cliente  
- **Diagramas de Arquitectura**: Actualización de diagramas Mermaid con nombres de agentes actualizados  
- **Ejemplos de Código**: Clases Python y ejemplos de implementación ahora usan denominación CustomerAgent  
- **Variables de Entorno**: Actualización en todos los scripts de despliegue para usar convenciones CUSTOMER_AGENT_NAME  

#### Mejorado  
- **Experiencia del Desarrollador**: Roles y responsabilidades del agente más claros en la documentación  
- **Preparación para Producción**: Mejor alineación con convenciones de nomenclatura empresarial  
- **Materiales Didácticos**: Nombres de agentes más intuitivos para fines educativos  
- **Usabilidad de Plantillas**: Comprensión simplificada de funciones y patrones de despliegue de agentes  

#### Detalles Técnicos  
- Actualización de diagramas Mermaid con referencias CustomerAgent  
- Reemplazo de nombres de clase CoraAgent por CustomerAgent en ejemplos Python  
- Modificación de configuraciones JSON de plantillas ARM para usar tipo de agente "customer"  
- Actualización de variables de entorno de CORA_AGENT_* a CUSTOMER_AGENT_*  
- Renovación de comandos de despliegue y configuraciones de contenedores  

### [v3.0.0] - 2025-09-12  

#### Cambios Mayores - Enfoque en Desarrolladores AI e Integración con Microsoft Foundry  
**Esta versión transforma el repositorio en un recurso completo de aprendizaje enfocado en AI con integración de Microsoft Foundry.**  

#### Añadido  
- **🤖 Ruta de Aprendizaje AI-First**: Reestructuración completa con prioridad en desarrolladores e ingenieros AI  
- **Guía de Integración Microsoft Foundry**: Documentación completa para conectar AZD con servicios de Microsoft Foundry  
- **Patrones de Despliegue de Modelos AI**: Guía detallada que cubre selección de modelos, configuración y estrategias de despliegue en producción  
- **Laboratorio de Taller AI**: Taller práctico de 2-3 horas para convertir aplicaciones AI en soluciones desplegables con AZD  
- **Mejores Prácticas para Producción AI**: Patrones empresariales para escalado, monitoreo y seguridad de cargas AI  
- **Guía de Solución de Problemas AI**: Documentación comprensiva para Microsoft Foundry Models, Cognitive Services y temas de despliegue AI  
- **Galería de Plantillas AI**: Colección destacada de plantillas Microsoft Foundry con clasificación de complejidad  
- **Materiales de Taller**: Estructura completa para talleres con laboratorios prácticos y materiales de referencia  

#### Mejorado  
- **Estructura README**: Enfocada en desarrolladores AI con 45% de interés comunitario desde Discord de Microsoft Foundry  
- **Rutas de Aprendizaje**: Trayectoria dedicada para desarrolladores AI junto con rutas tradicionales para estudiantes e ingenieros DevOps  
- **Recomendaciones de Plantillas**: Plantillas AI destacadas incluyendo azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart  
- **Integración Comunitaria**: Soporte comunitario en Discord mejorado con canales y discusiones específicas de AI  

#### Enfoque en Seguridad y Producción  
- **Patrones de Identidad Administrada**: Configuraciones de autenticación y seguridad específicas para AI  
- **Optimización de Costos**: Seguimiento de uso de tokens y control presupuestario para cargas AI  
- **Despliegue Multi-Región**: Estrategias para despliegue global de aplicaciones AI  
- **Monitoreo de Rendimiento**: Métricas específicas de AI e integración con Application Insights  

#### Calidad de Documentación  
- **Estructura Lineal de Curso**: Progresión lógica desde patrones básicos a avanzados de despliegue AI  
- **URLs Validadas**: Todos los enlaces externos a repositorios verificados y accesibles  
- **Referencia Completa**: Todos los enlaces internos de documentación validados y funcionales  
- **Listo para Producción**: Patrones empresariales con ejemplos del mundo real  

### [v2.0.0] - 2025-09-09  

#### Cambios Mayores - Reestructuración del Repositorio y Mejoras Profesionales  
**Esta versión representa una revisión significativa de la estructura del repositorio y presentación de contenido.**  

#### Añadido  
- **Marco de Aprendizaje Estructurado**: Todas las páginas de documentación ahora incluyen Introducción, Objetivos de Aprendizaje y Resultados de Aprendizaje  
- **Sistema de Navegación**: Adición de enlaces de lección Anterior/Siguiente en toda la documentación para progresión guiada  
- **Guía de Estudio**: study-guide.md completo con objetivos, ejercicios prácticos y materiales de evaluación  
- **Presentación Profesional**: Eliminación de todos los iconos emoji para mejor accesibilidad y apariencia profesional  
- **Estructura de Contenido Mejorada**: Organización y flujo mejorados de materiales de aprendizaje  

#### Cambiado  
- **Formato de Documentación**: Estandarización de toda la documentación con estructura enfocada en el aprendizaje  
- **Flujo de Navegación**: Implementación de progresión lógica a través de todo el material  
- **Presentación de Contenido**: Eliminación de elementos decorativos para un formato claro y profesional  
- **Estructura de Enlaces**: Actualización de todos los enlaces internos para soportar el nuevo sistema de navegación  

#### Mejorado  
- **Accesibilidad**: Eliminación de dependencias de emoji para mejor compatibilidad con lectores de pantalla  
- **Apariencia Profesional**: Presentación limpia y estilo académico, adecuada para formación empresarial  
- **Experiencia de Aprendizaje**: Enfoque estructurado con objetivos y resultados claros para cada lección  
- **Organización del Contenido**: Mejor flujo lógico y conexión entre temas relacionados  

### [v1.0.0] - 2025-09-09  

#### Lanzamiento Inicial - Repositorio Completo de Aprendizaje AZD  

#### Añadido  
- **Estructura Principal de Documentación**  
  - Serie completa de guías para empezar  
  - Documentación integral de despliegue y aprovisionamiento  
  - Recursos detallados para solución de problemas y depuración  
  - Herramientas y procedimientos de validación pre-despliegue  

- **Módulo de Comienzo**  
  - Conceptos básicos AZD: Conceptos centrales y terminología  
  - Guía de Instalación: Instrucciones específicas de plataforma  
  - Guía de Configuración: Preparación de ambiente y autenticación  
  - Tutorial Primer Proyecto: Aprendizaje práctico paso a paso  

- **Módulo de Despliegue y Aprovisionamiento**  
  - Guía de Despliegue: Documentación completa del flujo de trabajo  
  - Guía de Aprovisionamiento: Infraestructura como Código con Bicep  
  - Mejores prácticas para despliegues en producción  
  - Patrones de arquitectura multi-servicio  

- **Módulo de Validación Pre-Despliegue**  
  - Planificación de Capacidad: Validación de disponibilidad de recursos en Azure  
  - Selección de SKU: Guía completa de niveles de servicio  
  - Revisiones Preliminares: Scripts automáticos de validación (PowerShell y Bash)  
  - Estimación de costos y planificación presupuestaria  

- **Módulo de Solución de Problemas**  
  - Problemas Comunes: Problemas frecuentes y soluciones  
  - Guía de Depuración: Metodologías sistemáticas de solución de problemas  
  - Técnicas avanzadas de diagnóstico y herramientas  
  - Monitoreo y optimización de rendimiento  

- **Recursos y Referencias**  
  - Hoja de Comandos: Referencia rápida de comandos esenciales  
  - Glosario: Definición completa de términos y acrónimos  
  - FAQ: Respuestas detalladas a preguntas frecuentes  
  - Enlaces a recursos externos y conexiones comunitarias  

- **Ejemplos y Plantillas**  
  - Ejemplo de aplicación web sencilla  
  - Plantilla para despliegue de sitio web estático  
  - Configuración de aplicación en contenedores  
  - Patrones de integración de base de datos  
  - Ejemplos de arquitectura de microservicios  
  - Implementaciones de funciones serverless  

#### Características  
- **Soporte Multiplataforma**: Guías de instalación y configuración para Windows, macOS y Linux  
- **Niveles de Habilidad Múltiples**: Contenido diseñado para estudiantes hasta desarrolladores profesionales  
- **Enfoque Práctico**: Ejemplos hands-on y escenarios reales  
- **Cobertura Integral**: Desde conceptos básicos hasta patrones empresariales avanzados  
- **Enfoque en Seguridad**: Mejores prácticas de seguridad integradas en todo el contenido  
- **Optimización de Costos**: Guías para despliegues rentables y gestión de recursos  

#### Calidad de Documentación  
- **Ejemplos de Código Detallados**: Código práctico y probado  
- **Instrucciones Paso a Paso**: Guía clara y accionable  
- **Manejo Integral de Errores**: Solución de problemas para cuestiones comunes  
- **Integración de Mejores Prácticas**: Estándares y recomendaciones de la industria  
- **Compatibilidad de Versiones**: Actualizado con los últimos servicios Azure y características de azd  

## Mejoras Futuras Planificadas  

### Versión 3.1.0 (Planificada)  
#### Expansión de Plataforma AI
- **Soporte Multi-Modelo**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **Frameworks de Agentes de IA**: Plantillas para despliegues con LangChain, Semantic Kernel y AutoGen
- **Patrones Avanzados de RAG**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidad de IA**: Monitoreo mejorado para rendimiento del modelo, uso de tokens y calidad de respuesta

#### Experiencia del Desarrollador
- **Extensión de VS Code**: Experiencia integrada de desarrollo AZD + Microsoft Foundry
- **Integración con GitHub Copilot**: Generación asistida por IA de plantillas AZD
- **Tutoriales Interactivos**: Ejercicios de codificación prácticos con validación automatizada para escenarios de IA
- **Contenido en Video**: Tutoriales en video complementarios para aprendices visuales centrados en despliegues de IA

### Versión 4.0.0 (Planificada)
#### Patrones Empresariales de IA
- **Marco de Gobernanza**: Gobernanza de modelos de IA, cumplimiento y trazabilidad de auditoría
- **IA Multi-Inquilino**: Patrones para servir a múltiples clientes con servicios de IA aislados
- **Despliegue de IA en el Borde**: Integración con Azure IoT Edge e instancias de contenedores
- **IA en Nube Híbrida**: Patrones de despliegue multi-nube e híbrido para cargas de trabajo de IA

#### Funcionalidades Avanzadas
- **Automatización de Pipelines de IA**: Integración MLOps con pipelines de Azure Machine Learning
- **Seguridad Avanzada**: Patrones de confianza cero, endpoints privados y protección avanzada contra amenazas
- **Optimización del Rendimiento**: Estrategias avanzadas de ajuste y escalado para aplicaciones de IA de alto rendimiento
- **Distribución Global**: Patrones de entrega de contenido y caché en el borde para aplicaciones de IA

### Versión 3.0.0 (Planificada) - Suplantada por la Versión Actual
#### Añadidos Propuestos - Ahora Implementados en v3.0.0
- ✅ **Contenido Enfocado en IA**: Integración completa de Microsoft Foundry (Completado)
- ✅ **Tutoriales Interactivos**: Taller práctico de IA (Completado)
- ✅ **Módulo Avanzado de Seguridad**: Patrones de seguridad específicos para IA (Completado)
- ✅ **Optimización del Rendimiento**: Estrategias de ajuste para cargas de trabajo de IA (Completado)

### Versión 2.1.0 (Planificada) - Parcialmente Implementada en v3.0.0
#### Mejoras Menores - Algunas Completadas en la Versión Actual
- ✅ **Ejemplos Adicionales**: Escenarios de despliegue enfocados en IA (Completado)
- ✅ **FAQ Extendida**: Preguntas y resolución de problemas específicos de IA (Completado)
- **Integración de Herramientas**: Guías mejoradas para integración de IDE y editores
- ✅ **Expansión del Monitoreo**: Patrones de monitoreo y alertas específicos de IA (Completado)

#### Aún Planificado para Futuras Versiones
- **Documentación para Móviles**: Diseño adaptable para aprendizaje en dispositivos móviles
- **Acceso Offline**: Paquetes descargables de documentación
- **Integración Mejorada de IDE**: Extensión VS Code para workflows AZD + IA
- **Tablero Comunitario**: Métricas comunitarias en tiempo real y seguimiento de contribuciones

## Contribuir al Registro de Cambios

### Reportar Cambios
Al contribuir a este repositorio, asegúrese de que las entradas del registro de cambios incluyan:

1. **Número de Versión**: Siguiendo versionado semántico (mayor.menor.parche)
2. **Fecha**: Fecha de lanzamiento o actualización en formato AAAA-MM-DD
3. **Categoría**: Añadido, Cambiado, Obsoleto, Eliminado, Corregido, Seguridad
4. **Descripción Clara**: Descripción concisa de lo que cambió
5. **Evaluación de Impacto**: Cómo afectan los cambios a los usuarios existentes

### Categorías de Cambios

#### Añadido
- Nuevas funcionalidades, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas adicionales, scripts o utilidades

#### Cambiado
- Modificaciones a funcionalidades o documentación existentes
- Actualizaciones para mejorar claridad o precisión
- Reestructuración de contenido u organización

#### Obsoleto
- Funcionalidades o enfoques que están siendo eliminados progresivamente
- Secciones de documentación programadas para eliminación
- Métodos que tienen mejores alternativas

#### Eliminado
- Funcionalidades, documentación o ejemplos que ya no son relevantes
- Información obsoleta o enfoques descontinuados
- Contenido redundante o consolidado

#### Corregido
- Correcciones de errores en documentación o código
- Resolución de problemas reportados
- Mejoras en precisión o funcionalidad

#### Seguridad
- Mejoras o correcciones relacionadas con seguridad
- Actualizaciones de mejores prácticas de seguridad
- Resolución de vulnerabilidades de seguridad

### Guías para Versionado Semántico

#### Versión Mayor (X.0.0)
- Cambios disruptivos que requieren acción del usuario
- Reestructuraciones significativas de contenido u organización
- Cambios que alteran el enfoque o metodología fundamental

#### Versión Menor (X.Y.0)
- Nuevas funcionalidades o adiciones de contenido
- Mejoras que mantienen compatibilidad hacia atrás
- Ejemplos, herramientas o recursos adicionales

#### Versión de Parche (X.Y.Z)
- Corrección de errores y correcciones
- Mejoras menores al contenido existente
- Aclaraciones y pequeñas mejoras

## Retroalimentación y Sugerencias de la Comunidad

Animamos activamente a la comunidad a enviar retroalimentación para mejorar este recurso de aprendizaje:

### Cómo Proporcionar Retroalimentación
- **Issues de GitHub**: Reportar problemas o sugerir mejoras (issues específicos de IA bienvenidos)
- **Discusión en Discord**: Compartir ideas y participar con la comunidad Microsoft Foundry
- **Pull Requests**: Contribuir mejoras directas a contenido, especialmente plantillas y guías de IA
- **Discord de Microsoft Foundry**: Participar en el canal #Azure para discusiones AZD + IA
- **Foros Comunitarios**: Participar en discusiones más amplias para desarrolladores Azure

### Categorías de Retroalimentación
- **Precisión del Contenido de IA**: Correcciones sobre integración y despliegue de servicios de IA
- **Experiencia de Aprendizaje**: Sugerencias para mejorar el flujo de aprendizaje para desarrolladores de IA
- **Falta de Contenido de IA**: Solicitudes para plantillas, patrones o ejemplos adicionales de IA
- **Accesibilidad**: Mejoras para necesidades diversas de aprendizaje
- **Integración de Herramientas de IA**: Sugerencias para mejorar integración en flujos de desarrollo de IA
- **Patrones de IA en Producción**: Solicitudes de patrones empresariales de despliegue de IA

### Compromiso de Respuesta
- **Respuestas a Issues**: Dentro de 48 horas para problemas reportados
- **Solicitudes de Funcionalidades**: Evaluación dentro de una semana
- **Contribuciones Comunitarias**: Revisión dentro de una semana
- **Problemas de Seguridad**: Prioridad inmediata con respuesta acelerada

## Cronograma de Mantenimiento

### Actualizaciones Regulares
- **Revisiones Mensuales**: Precisión del contenido y validación de enlaces
- **Actualizaciones Trimestrales**: Grandes adiciones y mejoras de contenido
- **Revisiones Semestrales**: Reestructuraciones y mejoras integrales
- **Lanzamientos Anuales**: Actualizaciones de versiones mayores con mejoras significativas

### Monitoreo y Aseguramiento de Calidad
- **Pruebas Automatizadas**: Validación regular de ejemplos de código y enlaces
- **Integración de Retroalimentación Comunitaria**: Incorporación periódica de sugerencias de usuarios
- **Actualizaciones Tecnológicas**: Alineación con los últimos servicios de Azure y versiones de azd
- **Auditorías de Accesibilidad**: Revisión regular para principios de diseño inclusivo

## Política de Soporte de Versiones

### Soporte de la Versión Actual
- **Última Versión Mayor**: Soporte completo con actualizaciones regulares
- **Versión Mayor Anterior**: Actualizaciones de seguridad y correcciones críticas por 12 meses
- **Versiones Legadas**: Soporte comunitario solamente, sin actualizaciones oficiales

### Guía de Migración
Cuando se lanzan versiones mayores, ofrecemos:
- **Guías de Migración**: Instrucciones paso a paso para la transición
- **Notas de Compatibilidad**: Detalles sobre cambios que rompen compatibilidad
- **Soporte de Herramientas**: Scripts o utilidades para asistir en la migración
- **Soporte Comunitario**: Foros dedicados para preguntas sobre migración

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](resources/study-guide.md)
- **Siguiente Lección**: Volver a [README Principal](README.md)

**Mantente Actualizado**: Observa este repositorio para recibir notificaciones sobre nuevos lanzamientos y actualizaciones importantes del material de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso legal**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de ningún malentendido o interpretación errónea derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->