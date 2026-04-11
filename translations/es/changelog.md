# Registro de cambios - AZD For Beginners

## Introducción

Este registro de cambios documenta todos los cambios, actualizaciones y mejoras notables del repositorio AZD For Beginners. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de Aprendizaje

Al revisar este registro de cambios, usted:
- Mantendrá informado sobre nuevas características y adiciones de contenido
- Comprenderá las mejoras realizadas en la documentación existente
- Hará seguimiento de correcciones de errores y rectificaciones para asegurar la precisión
- Seguirá la evolución de los materiales de aprendizaje a lo largo del tiempo

## Resultados de Aprendizaje

Después de revisar las entradas del registro de cambios, usted podrá:
- Identificar contenido y recursos nuevos disponibles para el aprendizaje
- Entender qué secciones han sido actualizadas o mejoradas
- Planificar su ruta de aprendizaje basándose en los materiales más actuales
- Contribuir con comentarios y sugerencias para mejoras futuras

## Historial de Versiones

### [v3.19.1] - 2026-03-27

#### Aclaración en la incorporación para principiantes, validación de configuración y limpieza final de comandos AZD
**Esta versión da seguimiento a la barrida de validación de AZD 1.23 con una pasada de documentación enfocada en principiantes: clarifica la orientación de autenticación priorizando AZD, añade scripts de validación de configuración local, verifica comandos clave contra el CLI AZD en vivo y elimina las últimas referencias obsoletas a comandos en inglés fuera del registro de cambios.**

#### Añadido
- **🧪 Scripts de validación de configuración para principiantes** con `validate-setup.ps1` y `validate-setup.sh` para que los estudiantes puedan confirmar las herramientas requeridas antes de comenzar el Capítulo 1
- **✅ Pasos iniciales de validación de configuración** en el README raíz y en el README del Capítulo 1 para que se detecten los prerrequisitos faltantes antes de `azd up`

#### Cambiado
- **🔐 Orientación de autenticación para principiantes** ahora trata consistentemente `azd auth login` como la ruta primaria para flujos de trabajo con AZD, con `az login` señalado como opcional a menos que se usen comandos del Azure CLI directamente
- **📚 Flujo de incorporación del Capítulo 1** ahora dirige a los estudiantes a validar su configuración local antes de la instalación, autenticación y los primeros pasos de despliegue
- **🛠️ Mensajería del validador** ahora separa claramente los requisitos bloqueantes de las advertencias opcionales del Azure CLI para la ruta de principiantes solo con AZD
- **📖 Documentos de configuración, resolución de problemas y ejemplos** ahora distinguen entre la autenticación requerida por AZD y el inicio de sesión opcional de Azure CLI donde previamente se presentaban sin contexto

#### Corregido
- **📋 Referencias restantes a comandos en fuente inglesa** actualizadas a las formas actuales de AZD, incluyendo `azd config show` en la hoja de referencia y `azd monitor --overview` donde se pretendía orientación sobre la vista general del Portal de Azure
- **🧭 Afirmaciones para principiantes en el Capítulo 1** suavizadas para evitar prometer en exceso comportamientos garantizados de cero errores o rollback en todos los templates y recursos de Azure
- **🔎 Validación del CLI en vivo** confirmó soporte actual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, y `azd down --force --purge`

#### Archivos Actualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Validación AZD 1.23.12, expansión del entorno del taller y actualización de modelos de IA
**Esta versión realiza una barrida de validación de la documentación contra `azd` `1.23.12`, actualiza ejemplos de comandos AZD obsoletos, refresca la orientación sobre modelos de IA a los valores predeterminados actuales y amplía las instrucciones del taller más allá de GitHub Codespaces para también soportar contenedores de desarrollo y clones locales.**

#### Añadido
- **✅ Notas de validación en los capítulos principales y documentos del taller** para hacer explícita la línea base de AZD probada para estudiantes que usen builds del CLI más nuevos o antiguos
- **⏱️ Orientación sobre tiempo de espera de despliegue** para despliegues de aplicaciones de IA de larga duración usando `azd deploy --timeout 1800`
- **🔎 Pasos de inspección de extensiones** con `azd extension show azure.ai.agents` en los documentos del flujo de trabajo de IA
- **🌐 Orientación más amplia sobre entornos del taller** que cubre GitHub Codespaces, contenedores de desarrollo y clones locales con MkDocs

#### Cambiado
- **📚 READMEs introductorios de capítulo** ahora indican de forma consistente la validación contra `azd 1.23.12` en las secciones de foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting y production
- **🛠️ Referencias a comandos AZD** actualizadas a las formas actuales en los documentos:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` dependiendo del contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` cuando se pretende la vista general de Application Insights
- **🧪 Ejemplos de provision preview** simplificados al uso soportado actual como `azd provision --preview` y `azd provision --preview -e production`
- **🧭 Flujo del taller** actualizado para que los estudiantes puedan completar los laboratorios en Codespaces, en un contenedor de desarrollo o en un clon local en lugar de asumir ejecución solo en Codespaces
- **🔐 Orientación de autenticación** ahora prefiere `azd auth login` para flujos de trabajo con AZD, posicionando `az login` como opcional cuando se usan comandos del Azure CLI directamente

#### Corregido
- **🪟 Comandos de instalación en Windows** normalizados al uso actual de mayúsculas/minúsculas de `winget` en la guía de instalación
- **🐧 Orientación de instalación en Linux** corregida para evitar instrucciones específicas de gestores de paquetes de distribuciones no soportadas para `azd` y en su lugar apuntar a los assets de la release cuando corresponda
- **📦 Ejemplos de modelos de IA** actualizados desde valores predeterminados antiguos como `gpt-35-turbo` y `text-embedding-ada-002` a ejemplos actuales como `gpt-4.1-mini`, `gpt-4.1`, y `text-embedding-3-large`
- **📋 Fragmentos de despliegue y diagnósticos** corregidos para usar los comandos de entorno y estado actuales en logs, scripts y pasos de resolución de problemas
- **⚙️ Orientación de GitHub Actions** actualizada de `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Orientación de consentimiento MCP/Copilot** actualizada de `azd mcp consent` a `azd copilot consent list`

#### Mejorado
- **🧠 La guía del capítulo de IA** ahora explica mejor el comportamiento sensible a preview de `azd ai`, el inicio de sesión específico de tenants, el uso actual de extensiones y las recomendaciones actualizadas para despliegue de modelos
- **🧪 Las instrucciones del taller** ahora usan ejemplos de versiones más realistas y un lenguaje de configuración de entorno más claro para laboratorios prácticos
- **📈 Documentos de producción y resolución de problemas** ahora se alinean mejor con ejemplos actuales de monitorización, modelos de fallback y niveles de coste

#### Archivos Actualizados
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Comandos CLI de AZD para IA, validación de contenido y expansión de plantillas
**Esta versión añade cobertura de comandos `azd ai`, `azd extension` y `azd mcp` en todos los capítulos relacionados con IA, corrige enlaces rotos y código obsoleto en agents.md, actualiza la hoja de referencia y renueva la sección de Plantillas de Ejemplo con descripciones validadas y nuevas plantillas AZD para Azure IA.**

#### Añadido
- **🤖 Cobertura de CLI AZD AI** en 7 archivos (anteriormente solo en el Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nueva sección "Extensions and AI Commands" que introduce `azd extension`, `azd ai agent init`, y `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opción 4: `azd ai agent init` con tabla comparativa (enfoque por template vs manifiesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecciones "AZD Extensions for Foundry" y "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ahora muestra rutas de despliegue basadas en template y en manifiesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sección de Deploy ahora incluye la opción `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsección "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nueva sección "AI & Extensions Commands" con `azd extension`, `azd ai agent init`, `azd mcp`, y `azd infra generate`
- **📦 Nuevas plantillas de ejemplo AZD AI** en `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG en .NET con Blazor WebAssembly, Semantic Kernel y soporte de chat por voz
  - **azure-search-openai-demo-java** — Chat RAG en Java usando Langchain4J con opciones de despliegue en ACA/AKS
  - **contoso-creative-writer** — Aplicación multi-agente de escritura creativa usando Azure AI Agent Service, Bing Grounding y Prompty
  - **serverless-chat-langchainjs** — RAG serverless usando Azure Functions + LangChain.js + Cosmos DB con soporte de desarrollo local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador RAG empresarial con portal de administración, integración con Teams y opciones PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicación de referencia de orquestación MCP multi-agente con servidores en .NET, Python, Java y TypeScript
  - **azd-ai-starter** — Plantilla inicial Bicep mínima para infraestructura Azure AI
  - **🔗 Enlace a la galería awesome-azd AI** — Referencia a la [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corregido
- **🔗 Navegación en agents.md**: Los enlaces Anterior/Siguiente ahora coinciden con el orden de lecciones del README del Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Enlaces rotos en agents.md**: `production-ai-practices.md` corregido a `../chapter-08-production/production-ai-practices.md` (3 ocurrencias)
- **📦 Código obsoleto en agents.md**: Reemplazado `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida en agents.md**: `max_tokens` movido de `create_agent()` a `create_run()` como `max_completion_tokens`
- **🔢 Cálculo de tokens en agents.md**: Reemplazada la estimación aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Servicios corregidos de "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predeterminado cambiado en Oct 2024)
- **contoso-chat**: Descripción actualizada para referenciar Azure AI Foundry + Prompty, coincidiendo con el título real del repo y la pila tecnológica

#### Eliminado
- **ai-document-processing**: Eliminada la referencia a plantilla no funcional (repo no accesible públicamente como template AZD)

#### Mejorado
- **📝 agents.md exercises**: El ejercicio 1 ahora muestra la salida esperada y el paso `azd monitor`; el ejercicio 2 incluye el código completo de registro de `FunctionTool`; el ejercicio 3 reemplaza la orientación vaga con comandos concretos `prepdocs.py`
- **📚 agents.md resources**: Actualizados los enlaces de documentación a la documentación actual de Azure AI Agent Service y a la guía de inicio rápido
- **📋 agents.md Next Steps table**: Se añadió el enlace AI Workshop Lab para la cobertura completa del capítulo

#### Archivos actualizados
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Mejora de la navegación del curso
**Esta versión mejora la navegación de capítulos en README.md con un formato de tabla mejorado.**

#### Cambios
- **Tabla del Mapa del Curso**: Mejorada con enlaces directos a las lecciones, estimaciones de duración y calificaciones de complejidad
- **Limpieza de carpetas**: Eliminadas carpetas antiguas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validación de enlaces**: Se verificaron más de 21 enlaces internos en la tabla del Mapa del Curso

### [v3.16.0] - 2026-02-05

#### Actualizaciones de nombres de producto
**Esta versión actualiza las referencias de productos para la marca actual de Microsoft.**

#### Cambios
- **Microsoft Foundry → Microsoft Foundry**: Todas las referencias actualizadas en archivos no destinados a traducción
- **Azure AI Agent Service → Foundry Agents**: Nombre del servicio actualizado para reflejar la marca actual

#### Archivos actualizados
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Reestructuración mayor del repositorio: nombres de carpetas basados en capítulos
**Esta versión reestructura la documentación en carpetas dedicadas por capítulo para una navegación más clara.**

#### Cambios de nombre de carpetas
Las carpetas antiguas han sido reemplazadas por carpetas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migración de archivos
| Archivo | Desde | Hasta |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Añadido
- **📚 Archivos README de capítulo**: Creado README.md en cada carpeta de capítulo con:
  - Objetivos de aprendizaje y duración
  - Tabla de lecciones con descripciones
  - Comandos de inicio rápido
  - Navegación a otros capítulos

#### Cambios
- **🔗 Actualizados todos los enlaces internos**: 78+ rutas actualizadas en todos los archivos de documentación
- **🗺️ README.md principal**: Actualizado el Mapa del Curso con la nueva estructura de capítulos
- **📝 examples/README.md**: Actualizadas las referencias cruzadas a las carpetas de capítulos

#### Eliminado
- Estructura de carpetas antigua (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestructuración del repositorio: navegación por capítulos
**Esta versión añadió archivos README de navegación por capítulos (reemplazados por la v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nueva guía de agentes de IA
**Esta versión añade una guía completa para desplegar agentes de IA con Azure Developer CLI.**

#### Añadido
- **🤖 docs/microsoft-foundry/agents.md**: Guía completa que cubre:
  - Qué son los agentes de IA y cómo se diferencian de los chatbots
  - Tres plantillas de inicio rápido para agentes (Foundry Agents, Prompty, RAG)
  - Patrones de arquitectura de agentes (agente único, RAG, multiagente)
  - Configuración y personalización de herramientas
  - Monitorización y seguimiento de métricas
  - Consideraciones de costos y optimización
  - Escenarios comunes de resolución de problemas
  - Tres ejercicios prácticos con criterios de éxito

#### Estructura del contenido
- Introducción: conceptos de agentes para principiantes
- Inicio rápido: Desplegar agentes con `azd init --template get-started-with-ai-agents`
- Patrones de arquitectura: diagramas visuales de patrones de agentes
- Configuración: configuración de herramientas y variables de entorno
- Monitorización: integración con Application Insights
- Ejercicios: aprendizaje práctico progresivo (20-45 minutos cada uno)

---

### [v3.12.0] - 2026-02-05

#### Actualización del entorno DevContainer
**Esta versión actualiza la configuración del contenedor de desarrollo con herramientas modernas y valores predeterminados mejorados para la experiencia de aprendizaje de AZD.**

#### Cambios
- **🐳 Imagen base**: Actualizada de `python:3.12-bullseye` a `python:3.12-bookworm` (última versión estable de Debian)
- **📛 Nombre del contenedor**: Renombrado de "Python 3" a "AZD for Beginners" para mayor claridad

#### Añadido
- **🔧 Nuevas características del Dev Container**:
  - `azure-cli` con soporte de Bicep habilitado
  - `node:20` (versión LTS para plantillas AZD)
  - `github-cli` para la gestión de plantillas
  - `docker-in-docker` para despliegues de aplicaciones en contenedores

- **🔌 Redirección de puertos**: Puertos preconfigurados para desarrollo común:
  - 8000 (vista previa de MkDocs)
  - 3000 (aplicaciones web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nuevas extensiones de VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense de Python mejorado
  - `ms-azuretools.vscode-azurefunctions` - Soporte para Azure Functions
  - `ms-azuretools.vscode-docker` - Soporte para Docker
  - `ms-azuretools.vscode-bicep` - Soporte para el lenguaje Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestión de recursos de Azure
  - `yzhang.markdown-all-in-one` - Edición de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Soporte para diagramas Mermaid
  - `redhat.vscode-yaml` - Soporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualización de Git
  - `mhutchie.git-graph` - Historial de Git

- **⚙️ Configuración de VS Code**: Añadida configuración predeterminada para el intérprete de Python, formato al guardar y recorte de espacios en blanco

- **📦 requirements-dev.txt actualizado**:
  - Añadido el plugin MkDocs minify
  - Añadido pre-commit para calidad de código
  - Añadidos paquetes del Azure SDK (azure-identity, azure-mgmt-resource)

#### Correcciones
- **Comando post-create**: Ahora verifica la instalación de AZD y Azure CLI al iniciar el contenedor

---

### [v3.11.0] - 2026-02-05

#### Revisión del README orientada a principiantes
**Esta versión mejora significativamente el README.md para que sea más accesible para principiantes y añade recursos esenciales para desarrolladores de IA.**

#### Añadido
- **🆚 Comparación Azure CLI vs AZD**: Explicación clara de cuándo usar cada herramienta con ejemplos prácticos
- **🌟 Enlaces Awesome AZD**: Enlaces directos a la galería de plantillas de la comunidad y recursos de contribución:
  - [Galería Awesome AZD](https://azure.github.io/awesome-azd/) - más de 200 plantillas listas para desplegar
  - [Enviar una plantilla](https://github.com/Azure/awesome-azd/issues) - Contribución de la comunidad
- **🎯 Guía de inicio rápido**: Sección de inicio simplificada de 3 pasos (Instalar → Iniciar sesión → Desplegar)
- **📊 Tabla de navegación basada en la experiencia**: Guía clara sobre dónde comenzar según la experiencia del desarrollador

#### Cambios
- **Estructura del README**: Reorganizado para divulgación progresiva: información clave primero
- **Sección de introducción**: Reescrita para explicar "The Magic of `azd up`" para principiantes completos
- **Eliminado contenido duplicado**: Se eliminó la sección de solución de problemas duplicada
- **Comandos de solución de problemas**: Corregida la referencia `azd logs` para usar el comando válido `azd monitor --logs`

#### Corregido
- **🔐 Comandos de autenticación**: Añadidos `azd auth login` y `azd auth logout` a cheat-sheet.md
- **Referencias a comandos inválidos**: Eliminado el resto de `azd logs` de la sección de solución de problemas del README

#### Notas
- **Alcance**: Cambios aplicados al README.md principal y a resources/cheat-sheet.md
- **Público objetivo**: Mejoras dirigidas específicamente a desarrolladores nuevos en AZD

---

### [v3.10.0] - 2026-02-05

#### Actualización de precisión de comandos de Azure Developer CLI
**Esta versión corrige comandos AZD inexistentes en toda la documentación, asegurando que todos los ejemplos de código usen la sintaxis válida de Azure Developer CLI.**

#### Corregido
- **🔧 Eliminación de comandos AZD inexistentes**: Auditoría exhaustiva y corrección de comandos inválidos:
  - `azd logs` (no existe) → reemplazado por `azd monitor --logs` o alternativas de Azure CLI
  - subcomandos `azd service` (no existen) → reemplazados por `azd show` y Azure CLI
  - `azd infra import/export/validate` (no existen) → eliminados o reemplazados por alternativas válidas
  - flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (no existen) → eliminados
  - flags `azd provision --what-if/--rollback` (no existen) → actualizados para usar `--preview`
  - `azd config validate` (no existe) → reemplazado por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no existen) → eliminados

- **📚 Archivos actualizados con correcciones de comandos**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Version Reference Updated**: 
  - `docs/getting-started/installation.md`: Changed hardcoded `1.5.0` version to generic `1.x.x` with link to releases

#### Cambios
- **Estrategias de rollback**: Documentación actualizada para usar rollback basado en Git (AZD no tiene rollback nativo)
- **Visualización de registros**: Reemplazadas las referencias `azd logs` por `azd monitor --logs`, `azd monitor --live` y comandos de Azure CLI
- **Sección de rendimiento**: Eliminados flags de despliegue paralelos/incrementales inexistentes, proporcionadas alternativas válidas

#### Detalles técnicos
- **Comandos AZD válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Opciones válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Características eliminadas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificación**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalización del taller y actualización de la calidad de la documentación
**Esta versión completa los módulos interactivos del taller, corrige todos los enlaces rotos de la documentación y mejora la calidad general del contenido para desarrolladores de IA que usan Microsoft AZD.**

#### Añadido
- **📝 CONTRIBUTING.md**: Nuevo documento de directrices de contribución con:
  - Instrucciones claras para reportar problemas y proponer cambios
  - Estándares de documentación para contenido nuevo
  - Directrices para ejemplos de código y convenciones de mensajes de commit
  - Información sobre participación de la comunidad

#### Completado
- **🎯 Módulo 7 del taller (Cierre)**: Módulo de cierre completamente completado con:
  - Resumen exhaustivo de los logros del taller
  - Sección de conceptos clave dominados que abarca AZD, plantillas y Microsoft Foundry
  - Recomendaciones para la continuación del recorrido de aprendizaje
  - Ejercicios de desafío del taller con calificaciones de dificultad
  - Enlaces de retroalimentación y soporte comunitario

- **📚 Módulo 3 del taller (Descomponer)**: Objetivos de aprendizaje actualizados con:
  - Guía para la activación de GitHub Copilot con servidores MCP
  - Comprensión de la estructura de carpetas de plantillas AZD
  - Patrones de organización de infraestructura como código (Bicep)
  - Instrucciones del laboratorio práctico

- **🔧 Módulo 6 del taller (Desmantelamiento)**: Completado con:
  - Objetivos de limpieza de recursos y gestión de costos
  - Uso de `azd down` para el desaprovisionamiento seguro de la infraestructura
  - Guía de recuperación de servicios cognitivos eliminados de forma suave
  - Sugerencias de exploración adicionales para GitHub Copilot y Azure Portal

#### Corregido
- **🔗 Corrección de enlaces rotos**: Se resolvieron más de 15 enlaces internos rotos en la documentación:
  - `docs/ai-foundry/ai-model-deployment.md`: Se corrigieron las rutas a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Se corrigieron las rutas a ai-model-deployment.md y production-ai-practices.md
  - `docs/getting-started/first-project.md`: Se reemplazó el inexistente cicd-integration.md por deployment-guide.md
  - `examples/retail-scenario.md`: Se corrigieron las rutas de la sección de preguntas frecuentes (FAQ) y de la guía de solución de problemas
  - `examples/container-app/microservices/README.md`: Se corrigieron las rutas de la página principal del curso y de la guía de despliegue
  - `resources/faq.md` y `resources/glossary.md`: Se actualizaron las referencias al capítulo de IA
  - `course-outline.md`: Se corrigieron las referencias a la guía del instructor y al laboratorio del taller de IA

- **📅 Banner de estado del taller**: Actualizado de "Under Construction" a estado activo del taller con fecha febrero de 2026

- **🔗 Navegación del taller**: Se corrigieron enlaces de navegación rotos en workshop README.md que apuntaban a la carpeta lab-1-azd-basics inexistente

#### Cambiado
- **Presentación del taller**: Se eliminó la advertencia de "under construction", el taller ahora está completo y listo para su uso
- **Consistencia de navegación**: Se aseguró que todos los módulos del taller tengan una navegación adecuada entre módulos
- **Referencias de la ruta de aprendizaje**: Se actualizaron las referencias cruzadas de capítulos para usar las rutas correctas de microsoft-foundry

#### Validado
- ✅ Todos los archivos markdown en inglés tienen enlaces internos válidos
- ✅ Los módulos del taller 0-7 están completos con objetivos de aprendizaje
- ✅ La navegación entre capítulos y módulos funciona correctamente
- ✅ El contenido es adecuado para desarrolladores de IA que usan Microsoft AZD
- ✅ Se mantuvo un lenguaje y estructura amigables para principiantes en todo el contenido
- ✅ CONTRIBUTING.md proporciona orientación clara para los contribuyentes de la comunidad

#### Implementación técnica
- **Validación de enlaces**: Un script automatizado de PowerShell verificó todos los enlaces internos en .md
- **Auditoría de contenido**: Revisión manual de la integridad del taller y la idoneidad para principiantes
- **Sistema de navegación**: Se aplicaron patrones consistentes de navegación por capítulos y módulos

#### Notas
- **Alcance**: Cambios aplicados solo a la documentación en inglés
- **Traducciones**: Las carpetas de traducción no se actualizaron en esta versión (la traducción automatizada se sincronizará más tarde)
- **Duración del taller**: El taller completo ahora ofrece 3-4 horas de aprendizaje práctico

---

### [v3.8.0] - 2025-11-19

#### Documentación avanzada: Monitoreo, Seguridad y Patrones multiagente
**Esta versión agrega lecciones integrales de grado A sobre integración con Application Insights, patrones de autenticación y coordinación multiagente para despliegues en producción.**

#### Añadido
- **📊 Lección de integración con Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Despliegue centrado en AZD con aprovisionamiento automático
  - Plantillas Bicep completas para Application Insights + Log Analytics
  - Aplicaciones Python funcionales con telemetría personalizada (más de 1,200 líneas)
  - Patrones de monitoreo para IA/LLM (seguimiento de tokens/costos de Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitectura, trazado distribuido, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, paneles, monitoreo de IA)
  - Ejemplos de consultas Kusto y estrategias de optimización de costos
  - Transmisión de métricas en vivo y depuración en tiempo real
  - Tiempo de aprendizaje de 40-50 minutos con patrones listos para producción

- **🔐 Lección de patrones de autenticación y seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (connection strings, Key Vault, managed identity)
  - Plantillas de infraestructura Bicep completas para despliegues seguros
  - Código de aplicación Node.js con integración de Azure SDK
  - 3 ejercicios completos (habilitar managed identity, identity asignada por usuario, rotación de Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de resolución de problemas y análisis de costos
  - Patrones de autenticación sin contraseña listos para producción

- **🤖 Lección de patrones de coordinación multiagente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, orientado a eventos, consenso)
  - Implementación completa del servicio orquestador (Python/Flask, más de 1,500 líneas)
  - 3 implementaciones de agentes especializadas (Investigación, Redactor, Editor)
  - Integración con Service Bus para colas de mensajería
  - Gestión de estado en Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid que muestran interacciones entre agentes
  - 3 ejercicios avanzados (gestión de timeouts, lógica de reintentos, circuito breaker)
  - Desglose de costos ($240-565/mes) con estrategias de optimización
  - Integración con Application Insights para monitoreo

#### Mejorado
- **Capítulo de predespliegue**: Ahora incluye patrones completos de monitoreo y coordinación
- **Capítulo de inicio**: Mejorado con patrones profesionales de autenticación
- **Preparación para producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del curso**: Actualizado para referenciar las nuevas lecciones en los Capítulos 3 y 6

#### Cambiado
- **Progresión de aprendizaje**: Mejor integración de seguridad y monitoreo en todo el curso
- **Calidad de la documentación**: Estándares consistentes de grado A (95-97%) en las nuevas lecciones
- **Patrones de producción**: Cobertura completa de extremo a extremo para despliegues empresariales

#### Mejorado
- **Experiencia del desarrollador**: Camino claro desde el desarrollo hasta el monitoreo en producción
- **Estándares de seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de trabajo de IA**: Monitoreo especializado para Microsoft Foundry Models y sistemas multiagente

#### Validado
- ✅ Todas las lecciones incluyen código funcional completo (no fragmentos)
- ✅ Diagramas Mermaid para aprendizaje visual (19 en total en las 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 en total)
- ✅ Plantillas Bicep listas para producción desplegables vía `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de resolución de problemas y mejores prácticas
- ✅ Puntos de verificación de conocimiento con comandos de verificación

#### Resultados de la evaluación de la documentación
- **docs/pre-deployment/application-insights.md**: - Guía de monitoreo completa
- **docs/getting-started/authsecurity.md**: - Patrones de seguridad profesionales
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas multiagente avanzadas
- **Contenido nuevo en general**: - Estándares de alta calidad consistentes

#### Implementación técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazabilidad distribuida
- **Autenticación**: Managed Identity + Key Vault + patrones RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Monitoreo**: Métricas en vivo + consultas Kusto + alertas + paneles
- **Gestión de costos**: Estrategias de muestreo, políticas de retención, controles de presupuesto

### [v3.7.0] - 2025-11-19

#### Mejoras en la calidad de la documentación y nuevo ejemplo de Microsoft Foundry Models
**Esta versión mejora la calidad de la documentación en todo el repositorio y añade un ejemplo completo de despliegue de Microsoft Foundry Models con interfaz de chat gpt-4.1.**

#### Añadido
- **🤖 Ejemplo de chat con Microsoft Foundry Models**: Despliegue completo gpt-4.1 con implementación funcional en `examples/azure-openai-chat/`:
  - Infraestructura completa de Microsoft Foundry Models (despliegue del modelo gpt-4.1)
  - Interfaz de chat en línea de comandos en Python con historial de conversaciones
  - Integración con Key Vault para almacenamiento seguro de claves API
  - Seguimiento de uso de tokens y estimación de costos
  - Limitación de tasa y manejo de errores
  - README completo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, app Python, configuración)
- **📚 Ejercicios de documentación**: Se añadieron ejercicios prácticos a la guía de configuración:
  - Ejercicio 1: Configuración multi-entorno (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios claros de éxito y pasos de verificación
- **✅ Verificación de despliegue**: Se añadió sección de verificación a la guía de despliegue:
  - Procedimientos de comprobación de estado
  - Lista de verificación de criterios de éxito
  - Salidas esperadas para todos los comandos de despliegue
  - Referencia rápida de resolución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad A (93%):
  - Añadido azure-openai-chat a todas las secciones relevantes
  - Actualizado el conteo de ejemplos locales de 3 a 4
  - Añadido a la tabla de Ejemplos de Aplicaciones de IA
  - Integrado en el Inicio Rápido para Usuarios Intermedios
  - Añadido a la sección de Plantillas de Microsoft Foundry
  - Actualizada la Matriz de Comparación y las secciones de hallazgos tecnológicos
- **Calidad de la documentación**: Mejorada de B+ (87%) → A- (92%) en la carpeta docs:
  - Añadidas salidas esperadas a ejemplos críticos de comandos
  - Incluidos pasos de verificación para cambios de configuración
  - Mejorada la experiencia práctica con ejercicios accionables

#### Cambiado
- **Progresión de aprendizaje**: Mejor integración de ejemplos de IA para aprendices intermedios
- **Estructura de la documentación**: Ejercicios más accionables con resultados claros
- **Proceso de verificación**: Criterios de éxito explícitos añadidos a flujos de trabajo clave

#### Mejorado
- **Experiencia del desarrollador**: El despliegue de Microsoft Foundry Models ahora toma 35-45 minutos (vs 60-90 para alternativas complejas)
- **Transparencia de costos**: Estimaciones de costos claras ($50-200/mes) para el ejemplo de Microsoft Foundry Models
- **Ruta de aprendizaje**: Los desarrolladores de IA tienen un punto de entrada claro con azure-openai-chat
- **Estándares de documentación**: Salidas esperadas y pasos de verificación coherentes

#### Validado
- ✅ El ejemplo de Microsoft Foundry Models funciona completamente con `azd up`
- ✅ Los 11 archivos de implementación son sintácticamente correctos
- ✅ Las instrucciones del README coinciden con la experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ El índice de ejemplos refleja con precisión 4 ejemplos locales
- ✅ No hay enlaces externos duplicados en tablas
- ✅ Todas las referencias de navegación son correctas

#### Implementación técnica
- **Arquitectura de Microsoft Foundry Models**: gpt-4.1 + Key Vault + patrón Container Apps
- **Seguridad**: Managed Identity listo, secretos en Key Vault
- **Monitoreo**: Integración con Application Insights
- **Gestión de costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Comando único `azd up` para configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización importante: ejemplos de despliegue de Container App
**Esta versión introduce ejemplos completos y listos para producción de despliegues de aplicaciones en contenedores usando Azure Developer CLI (AZD), con documentación completa e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos de Container App**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Guía maestra](examples/container-app/README.md): Descripción completa de despliegues en contenedores, inicio rápido, producción y patrones avanzados
  - [API Flask simple](../../examples/container-app/simple-flask-api): API REST amigable para principiantes con scale-to-zero, sondas de estado, monitoreo y resolución de problemas
  - [Arquitectura de microservicios](../../examples/container-app/microservices): Despliegue multi-servicio listo para producción (API Gateway, Product, Order, User, Notification), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazado distribuido, despliegue blue-green/canary
- **Mejores prácticas**: Seguridad, monitoreo, optimización de costos y guía de CI/CD para cargas de trabajo en contenedores
- **Ejemplos de código**: `azure.yaml` completo, plantillas Bicep y implementaciones de servicios en múltiples lenguajes (Python, Node.js, C#, Go)
- **Pruebas y resolución de problemas**: Escenarios de prueba de extremo a extremo, comandos de monitoreo, guía de resolución de problemas

#### Cambiado
- **README.md**: Actualizado para incluir y enlazar nuevos ejemplos de aplicaciones en contenedores bajo "Ejemplos locales - Aplicaciones en contenedores"
- **examples/README.md**: Actualizado para resaltar ejemplos de aplicaciones en contenedores, agregar entradas a la matriz de comparación y actualizar referencias de tecnología/arquitectura
- **Course Outline & Study Guide**: Actualizado para referenciar nuevos ejemplos de aplicaciones en contenedores y patrones de despliegue en los capítulos relevantes

#### Validated
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y siguen las mejores prácticas
- ✅ Enlaces cruzados de documentación y navegación actualizados
- ✅ Los ejemplos cubren escenarios de nivel principiante a avanzado, incluidos microservicios de producción

#### Notes
- **Scope**: Documentación y ejemplos en inglés únicamente
- **Next Steps**: Ampliar con patrones de contenedores avanzados adicionales y automatización CI/CD en futuras versiones

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Esta versión implementa un cambio de nombre integral del producto de "Microsoft Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando el rebranding oficial de Microsoft.**

#### Changed
- **🔄 Product Name Update**: Rebranding completo de "Microsoft Foundry" a "Microsoft Foundry"
  - Referencias actualizadas en toda la documentación en inglés en la carpeta `docs/`
  - Carpeta renombrada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Archivo renombrado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referencias de contenido actualizadas en 7 archivos de documentación

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renombrada a `docs/microsoft-foundry/`
  - Todas las referencias cruzadas actualizadas para reflejar la nueva estructura de carpetas
  - Enlaces de navegación validados en toda la documentación

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos los enlaces internos actualizados para referenciar el nuevo nombre de archivo

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias al nombre del producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ya utiliza Microsoft Foundry (desde actualizaciones previas)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (visión general, comentarios de la comunidad, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces de referencia cruzada actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulo actualizados
  - `docs/getting-started/installation.md` - 2 enlaces al siguiente capítulo actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad de Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Course Structure Files** (2 files):
  - `README.md` - 17 referencias actualizadas (visión general del curso, títulos de capítulos, sección de plantillas, perspectivas de la comunidad)
  - `course-outline.md` - 14 referencias actualizadas (visión general, objetivos de aprendizaje, recursos de capítulo)

#### Validated
- ✅ Cero referencias restantes a la ruta de carpeta "ai-foundry" en la documentación en inglés
- ✅ Cero referencias restantes al nombre de producto "Microsoft Foundry" en la documentación en inglés
- ✅ Todos los enlaces de navegación funcionales con la nueva estructura de carpetas
- ✅ Renombres de archivos y carpetas completados con éxito
- ✅ Referencias cruzadas entre capítulos validadas

#### Notes
- **Scope**: Cambios aplicados únicamente a la documentación en inglés en la carpeta `docs/`
- **Translations**: Las carpetas de traducción (`translations/`) no se actualizaron en esta versión
- **Workshop**: Los materiales del taller (`workshop/`) no se actualizaron en esta versión
- **Examples**: Los archivos de ejemplo pueden seguir haciendo referencia a nombres heredados (se abordará en una futura actualización)
- **External Links**: Las URL externas y referencias al repositorio de GitHub permanecen sin cambios

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**Esta versión introduce soporte integral para la nueva funcionalidad preview del Azure Developer CLI y mejora la experiencia del usuario del taller.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Cobertura completa de la nueva capacidad de vista previa de infraestructura
  - Referencia de comando y ejemplos de uso en la hoja de trucos
  - Integración detallada en la guía de aprovisionamiento con casos de uso y beneficios
  - Integración de comprobaciones previas al vuelo para una validación de despliegue más segura
  - Actualizaciones en la guía de inicio rápido con prácticas de despliegue enfocadas en la seguridad
- **🚧 Workshop Status Banner**: Banner HTML profesional indicando el estado de desarrollo del taller
  - Diseño en degradado con indicadores de construcción para una comunicación clara al usuario
  - Marca de tiempo de última actualización para transparencia
  - Diseño responsive para todo tipo de dispositivos

#### Enhanced
- **Infrastructure Safety**: Funcionalidad preview integrada a lo largo de la documentación de despliegue
- **Pre-deployment Validation**: Los scripts automatizados ahora incluyen pruebas de vista previa de infraestructura
- **Developer Workflow**: Secuencias de comandos actualizadas para incluir preview como práctica recomendada
- **Workshop Experience**: Expectativas claras establecidas para los usuarios sobre el estado de desarrollo del contenido

#### Changed
- **Deployment Best Practices**: Flujo de trabajo con preview como enfoque recomendado
- **Documentation Flow**: La validación de infraestructura se mueve más temprano en el proceso de aprendizaje
- **Workshop Presentation**: Comunicación profesional del estado con una línea de tiempo de desarrollo clara

#### Improved
- **Safety-First Approach**: Los cambios de infraestructura ahora pueden validarse antes del despliegue
- **Team Collaboration**: Los resultados de preview pueden compartirse para revisión y aprobación
- **Cost Awareness**: Mejor comprensión de los costos de recursos antes del aprovisionamiento
- **Risk Mitigation**: Reducción de fallos de despliegue mediante validación previa

#### Technical Implementation
- **Multi-document Integration**: Función preview documentada en 4 archivos clave
- **Command Patterns**: Sintaxis y ejemplos consistentes en toda la documentación
- **Best Practice Integration**: Preview incluido en flujos de trabajo de validación y scripts
- **Visual Indicators**: Marcados claros de la nueva característica para facilitar su descubrimiento

#### Workshop Infrastructure
- **Status Communication**: Banner HTML profesional con estilo en degradado
- **User Experience**: Estado de desarrollo claro que previene confusiones
- **Professional Presentation**: Mantiene la credibilidad del repositorio mientras establece expectativas
- **Timeline Transparency**: Marca de tiempo de última actualización octubre de 2025 para responsabilidad

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**Esta versión introduce materiales de taller completos con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Added
- **🎥 Interactive Workshop Guide**: Experiencia de taller basada en navegador con capacidad de vista previa de MkDocs
- **📝 Structured Workshop Instructions**: Ruta de aprendizaje guiada de 7 pasos desde el descubrimiento hasta la personalización
  - 0-Introduction: Visión general del taller y configuración
  - 1-Select-AI-Template: Descubrimiento y proceso de selección de plantillas
  - 2-Validate-AI-Template: Procedimientos de despliegue y validación
  - 3-Deconstruct-AI-Template: Comprensión de la arquitectura de la plantilla
  - 4-Configure-AI-Template: Configuración y personalización
  - 5-Customize-AI-Template: Modificaciones avanzadas e iteraciones
  - 6-Teardown-Infrastructure: Limpieza y gestión de recursos
  - 7-Wrap-up: Resumen y siguientes pasos
- **🛠️ Workshop Tooling**: Configuración de MkDocs con el tema Material para una mejor experiencia de aprendizaje
- **🎯 Hands-On Learning Path**: Metodología de 3 pasos (Descubrimiento → Despliegue → Personalización)
- **📱 GitHub Codespaces Integration**: Configuración fluida del entorno de desarrollo

#### Enhanced
- **AI Workshop Lab**: Ampliado con una experiencia de aprendizaje estructurada de 2-3 horas
- **Workshop Documentation**: Presentación profesional con navegación y ayudas visuales
- **Learning Progression**: Guía paso a paso clara desde la selección de la plantilla hasta el despliegue en producción
- **Developer Experience**: Herramientas integradas para flujos de trabajo de desarrollo más ágiles

#### Improved
- **Accessibility**: Interfaz basada en navegador con búsqueda, funcionalidad de copiar y conmutador de tema
- **Self-Paced Learning**: Estructura de taller flexible que se adapta a diferentes ritmos de aprendizaje
- **Practical Application**: Escenarios de despliegue de plantillas de IA en entornos reales
- **Community Integration**: Integración con Discord para soporte y colaboración del taller

#### Workshop Features
- **Built-in Search**: Descubrimiento rápido de palabras clave y lecciones
- **Copy Code Blocks**: Funcionalidad de copiar al pasar el cursor para todos los ejemplos de código
- **Theme Toggle**: Soporte de modo oscuro/claro según preferencias
- **Visual Assets**: Capturas de pantalla y diagramas para una mejor comprensión
- **Help Integration**: Acceso directo a Discord para soporte de la comunidad

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**Esta versión introduce una estructura de aprendizaje basada en capítulos integral con navegación mejorada en todo el repositorio.**

#### Added
- **📚 Chapter-Based Learning System**: Reestructuración de todo el curso en 8 capítulos de aprendizaje progresivo
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Encabezados y pies de página de navegación consistentes en toda la documentación
- **🎯 Progress Tracking**: Lista de verificación de finalización del curso y sistema de verificación de aprendizaje
- **🗺️ Learning Path Guidance**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos
- **🔗 Cross-Reference Navigation**: Capítulos relacionados y prerequisitos claramente enlazados

#### Enhanced
- **README Structure**: Transformado en una plataforma de aprendizaje estructurada con organización por capítulos
- **Documentation Navigation**: Cada página ahora incluye contexto de capítulo y guía de progresión
- **Template Organization**: Ejemplos y plantillas asignados a los capítulos de aprendizaje correspondientes
- **Resource Integration**: Hojas de trucos, FAQs y guías de estudio conectadas a los capítulos relevantes
- **Workshop Integration**: Laboratorios prácticos asignados a múltiples objetivos de aprendizaje de capítulos

#### Changed
- **Learning Progression**: Migración de documentación lineal a aprendizaje flexible por capítulos
- **Configuration Placement**: Guía de configuración reposicionada como Capítulo 3 para un mejor flujo de aprendizaje
- **AI Content Integration**: Mejor integración de contenido específico de IA a lo largo del recorrido de aprendizaje
- **Production Content**: Patrones avanzados consolidados en el Capítulo 8 para aprendices empresariales

#### Improved
- **User Experience**: Migas de pan de navegación claras e indicadores de progresión por capítulo
- **Accessibility**: Patrones de navegación consistentes para facilitar el recorrido del curso
- **Professional Presentation**: Estructura tipo universidad adecuada para formación académica y corporativa
- **Learning Efficiency**: Menor tiempo para encontrar contenido relevante gracias a la mejor organización

#### Technical Implementation
- **Navigation Headers**: Navegación de capítulos estandarizada en más de 40 archivos de documentación
- **Footer Navigation**: Orientación de progresión consistente e indicadores de finalización de capítulo
- **Cross-Linking**: Sistema de enlaces internos completo que conecta conceptos relacionados
- **Chapter Mapping**: Plantillas y ejemplos claramente asociados con objetivos de aprendizaje

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Guía de estudio reestructurada para alinearse con el sistema de 8 capítulos
- **🎯 Chapter-Based Assessment**: Cada capítulo incluye objetivos de aprendizaje específicos y ejercicios prácticos
- **📋 Progress Tracking**: Calendario semanal de aprendizaje con resultados medibles y listas de verificación de finalización
- **❓ Assessment Questions**: Preguntas de validación de conocimiento para cada capítulo con resultados profesionales
- **🛠️ Practical Exercises**: Actividades prácticas con escenarios reales de despliegue y resolución de problemas
- **📊 Skill Progression**: Avance claro desde conceptos básicos hasta patrones empresariales con enfoque en desarrollo profesional
- **🎓 Certification Framework**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario
- **⏱️ Timeline Management**: Plan de aprendizaje estructurado de 10 semanas con validación de hitos

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**Esta versión mejora la solución minorista multiagente con un mejor nombrado de agentes y documentación ampliada.**

#### Changed
- **Multi-Agent Terminology**: Se reemplazó "Cora agent" por "Customer agent" en toda la solución minorista multiagente para una comprensión más clara
- **Agent Architecture**: Toda la documentación, plantillas ARM y ejemplos de código actualizados para usar la denominación consistente "Customer agent"
- **Configuration Examples**: Modernización de patrones de configuración de agentes con convenciones de nombres actualizadas
- **Documentation Consistency**: Se aseguró que todas las referencias utilicen nombres de agentes profesionales y descriptivos

#### Enhanced
- **ARM Template Package**: Actualizado retail-multiagent-arm-template con referencias al agente Customer
- **Architecture Diagrams**: Diagramas Mermaid actualizados con la nomenclatura de agentes actualizada
- **Code Examples**: Las clases de Python y los ejemplos de implementación ahora usan la denominación CustomerAgent
- **Environment Variables**: Actualizados todos los scripts de despliegue para usar las convenciones CUSTOMER_AGENT_NAME

#### Improved
- **Developer Experience**: Roles y responsabilidades de los agentes más claros en la documentación
- **Production Readiness**: Mejor alineación con las convenciones de nombres empresariales
- **Learning Materials**: Nombres de agentes más intuitivos para fines educativos
- **Template Usability**: Comprensión simplificada de las funciones de los agentes y los patrones de despliegue

#### Technical Details
- Diagramas de arquitectura Mermaid actualizados con referencias a CustomerAgent
- Reemplazados los nombres de clase CoraAgent por CustomerAgent en ejemplos de Python
- Modificadas las configuraciones JSON de la plantilla ARM para usar el tipo de agente "customer"
- Actualizadas las variables de entorno de CORA_AGENT_* a CUSTOMER_AGENT_* 
- Actualizados todos los comandos de despliegue y las configuraciones de contenedores

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**Esta versión transforma el repositorio en un recurso de aprendizaje integral centrado en IA con integración de Microsoft Foundry.**

#### Added
- **🤖 AI-First Learning Path**: Reestructura completa priorizando a desarrolladores e ingenieros de IA
- **Microsoft Foundry Integration Guide**: Documentación completa para conectar AZD con los servicios de Microsoft Foundry
- **AI Model Deployment Patterns**: Guía detallada que cubre selección de modelos, configuración y estrategias de despliegue en producción
- **AI Workshop Lab**: Taller práctico de 2-3 horas para convertir aplicaciones de IA en soluciones desplegables con AZD
- **Production AI Best Practices**: Patrones listos para empresa para escalar, supervisar y asegurar cargas de trabajo de IA
- **AI-Specific Troubleshooting Guide**: Guía exhaustiva de resolución de problemas para Microsoft Foundry Models, Cognitive Services y problemas de despliegue de IA
- **AI Template Gallery**: Colección destacada de plantillas de Microsoft Foundry con calificaciones de complejidad
- **Workshop Materials**: Estructura completa del taller con laboratorios prácticos y materiales de referencia

#### Enhanced
- **README Structure**: Enfocado en desarrolladores de IA con datos de interés comunitario del 45% provenientes de Microsoft Foundry Discord
- **Learning Paths**: Trayectoria dedicada para desarrolladores de IA junto con rutas tradicionales para estudiantes e ingenieros DevOps
- **Template Recommendations**: Plantillas destacadas para IA incluyendo azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart
- **Community Integration**: Soporte comunitario de Discord mejorado con canales y discusiones específicas de IA

#### Security & Production Focus
- **Managed Identity Patterns**: Autenticación y configuraciones de seguridad específicas para IA
- **Cost Optimization**: Seguimiento de uso de tokens y controles presupuestarios para cargas de trabajo de IA
- **Multi-Region Deployment**: Estrategias para despliegue global de aplicaciones de IA
- **Performance Monitoring**: Métricas específicas para IA e integración con Application Insights

#### Documentation Quality
- **Linear Course Structure**: Progresión lógica desde patrones de despliegue de IA para principiantes hasta avanzados
- **Validated URLs**: Todos los enlaces a repositorios externos verificados y accesibles
- **Complete Reference**: Todos los enlaces de la documentación interna validados y funcionales
- **Production Ready**: Patrones de despliegue empresariales con ejemplos del mundo real

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**Esta versión representa una revisión significativa de la estructura del repositorio y de la presentación del contenido.**

#### Added
- **Structured Learning Framework**: Todas las páginas de documentación ahora incluyen secciones de Introducción, Objetivos de Aprendizaje y Resultados de Aprendizaje
- **Navigation System**: Añadidos enlaces Anterior/Siguiente en todas las lecciones para una progresión guiada del aprendizaje
- **Study Guide**: study-guide.md completo con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación
- **Professional Presentation**: Eliminados todos los iconos emoji para mejorar la accesibilidad y la apariencia profesional
- **Enhanced Content Structure**: Mejor organización y flujo de los materiales de aprendizaje

#### Changed
- **Documentation Format**: Estandarizada toda la documentación con una estructura coherente orientada al aprendizaje
- **Navigation Flow**: Implementada una progresión lógica en todos los materiales de aprendizaje
- **Content Presentation**: Eliminados elementos decorativos en favor de un formato claro y profesional
- **Link Structure**: Actualizados todos los enlaces internos para soportar el nuevo sistema de navegación

#### Improved
- **Accessibility**: Eliminadas dependencias de emoji para mejorar la compatibilidad con lectores de pantalla
- **Professional Appearance**: Presentación limpia, estilo académico adecuada para aprendizaje empresarial
- **Learning Experience**: Enfoque estructurado con objetivos y resultados claros para cada lección
- **Content Organization**: Mejor flujo lógico y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Complete getting-started guide series
  - Comprehensive deployment and provisioning documentation
  - Detailed troubleshooting resources and debugging guides
  - Pre-deployment validation tools and procedures

- **Getting Started Module**
  - AZD Basics: Core concepts and terminology
  - Installation Guide: Platform-specific setup instructions
  - Configuration Guide: Environment setup and authentication
  - First Project Tutorial: Step-by-step hands-on learning

- **Deployment and Provisioning Module**
  - Deployment Guide: Complete workflow documentation
  - Provisioning Guide: Infrastructure as Code with Bicep
  - Best practices for production deployments
  - Multi-service architecture patterns

- **Pre-deployment Validation Module**
  - Capacity Planning: Azure resource availability validation
  - SKU Selection: Comprehensive service tier guidance
  - Pre-flight Checks: Automated validation scripts (PowerShell and Bash)
  - Cost estimation and budget planning tools

- **Troubleshooting Module**
  - Common Issues: Frequently encountered problems and solutions
  - Debugging Guide: Systematic troubleshooting methodologies
  - Advanced diagnostic techniques and tools
  - Performance monitoring and optimization

- **Resources and References**
  - Command Cheat Sheet: Quick reference for essential commands
  - Glossary: Comprehensive terminology and acronym definitions
  - FAQ: Detailed answers to common questions
  - External resource links and community connections

- **Examples and Templates**
  - Simple Web Application example
  - Static Website deployment template
  - Container Application configuration
  - Database integration patterns
  - Microservices architecture examples
  - Serverless function implementations

#### Features
- **Multi-Platform Support**: Guías de instalación y configuración para Windows, macOS y Linux
- **Multiple Skill Levels**: Contenido diseñado para estudiantes hasta desarrolladores profesionales
- **Practical Focus**: Ejemplos prácticos y escenarios del mundo real
- **Comprehensive Coverage**: Desde conceptos básicos hasta patrones empresariales avanzados
- **Security-First Approach**: Mejores prácticas de seguridad integradas en todo el contenido
- **Cost Optimization**: Orientación para despliegues rentables y gestión de recursos

#### Documentation Quality
- **Detailed Code Examples**: Ejemplos de código prácticos y probados
- **Step-by-Step Instructions**: Guía clara y accionable
- **Comprehensive Error Handling**: Resolución de problemas para problemas comunes
- **Best Practices Integration**: Estándares y recomendaciones de la industria
- **Version Compatibility**: Actualizado con los últimos servicios de Azure y características de azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **AI Agent Frameworks**: Plantillas para despliegues con LangChain, Semantic Kernel y AutoGen
- **Advanced RAG Patterns**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Supervisión mejorada para rendimiento de modelos, uso de tokens y calidad de respuesta

#### Developer Experience
- **VS Code Extension**: Experiencia de desarrollo integrada AZD + Microsoft Foundry en VS Code
- **GitHub Copilot Integration**: Generación asistida por IA de plantillas AZD
- **Interactive Tutorials**: Ejercicios prácticos de codificación con validación automatizada para escenarios de IA
- **Video Content**: Tutoriales en vídeo complementarios para aprendices visuales centrados en despliegues de IA

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Gobernanza de modelos de IA, cumplimiento y registros de auditoría
- **Multi-Tenant AI**: Patrones para servir a múltiples clientes con servicios de IA aislados
- **Edge AI Deployment**: Integración con Azure IoT Edge e instancias de contenedores
- **Hybrid Cloud AI**: Patrones de despliegue multi-nube e híbridos para cargas de trabajo de IA

#### Advanced Features
- **AI Pipeline Automation**: Integración de MLOps con pipelines de Azure Machine Learning
- **Advanced Security**: Patrones de confianza cero, endpoints privados y protección avanzada contra amenazas
- **Performance Optimization**: Ajustes avanzados y estrategias de escalado para aplicaciones de IA de alto rendimiento
- **Global Distribution**: Patrones de entrega de contenido y cache en el borde para aplicaciones de IA

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Integración integral con Microsoft Foundry (Completado)
- ✅ **Interactive Tutorials**: Taller práctico de IA (Completado)
- ✅ **Advanced Security Module**: Patrones de seguridad específicos para IA (Completado)
- ✅ **Performance Optimization**: Estrategias de ajuste para cargas de trabajo de IA (Completado)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Escenarios de despliegue centrados en IA (Completado)
- ✅ **Extended FAQ**: Preguntas frecuentes específicas de IA y resolución de problemas (Completado)
- **Tool Integration**: Guías mejoradas de integración con IDEs y editores
- ✅ **Monitoring Expansion**: Patrones de monitorización y alertas específicos para IA (Completado)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Diseño responsivo para aprendizaje móvil
- **Offline Access**: Paquetes de documentación descargables
- **Enhanced IDE Integration**: Extensión de VS Code para flujos de trabajo AZD + IA
- **Community Dashboard**: Métricas comunitarias en tiempo real y seguimiento de contribuciones

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Correcciones a la integración y la información de despliegue de servicios de IA
- **Learning Experience**: Sugerencias para mejorar el flujo de aprendizaje de desarrolladores de IA
- **Missing AI Content**: Solicitudes de plantillas, patrones o ejemplos adicionales para IA
- **Accessibility**: Mejoras para necesidades de aprendizaje diversas
- **AI Tool Integration**: Sugerencias para una mejor integración de flujos de trabajo de desarrollo de IA
- **Production AI Patterns**: Solicitudes de patrones de despliegue de IA empresariales

### Response Commitment
- **Issue Response**: Dentro de 48 horas para problemas reportados
- **Feature Requests**: Evaluación dentro de una semana
- **Community Contributions**: Revisión dentro de una semana
- **Security Issues**: Prioridad inmediata con respuesta acelerada

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Exactitud del contenido y validación de enlaces
- **Quarterly Updates**: Adiciones e mejoras de contenido importantes
- **Semi-Annual Reviews**: Reestructuración y mejora integral
- **Annual Releases**: Actualizaciones de versión mayor con mejoras significativas

### Monitoring and Quality Assurance
- **Automated Testing**: Validación regular de ejemplos de código y enlaces
- **Community Feedback Integration**: Incorporación regular de sugerencias de usuarios
- **Technology Updates**: Alineación con los últimos servicios de Azure y lanzamientos de azd
- **Accessibility Audits**: Revisión periódica para principios de diseño inclusivo

## Version Support Policy

### Current Version Support
- **Última versión mayor**: Soporte completo con actualizaciones periódicas
- **Versión mayor anterior**: Actualizaciones de seguridad y correcciones críticas durante 12 meses
- **Versiones heredadas**: Solo soporte comunitario, sin actualizaciones oficiales

### Guía de migración
Cuando se lanzan versiones mayores, proporcionamos:
- **Guías de migración**: Instrucciones de transición paso a paso
- **Notas de compatibilidad**: Detalles sobre cambios que rompen la compatibilidad
- **Soporte de herramientas**: Scripts o utilidades para ayudar con la migración
- **Soporte comunitario**: Foros dedicados para preguntas sobre migración

---

**Navegación**
- **Lección anterior**: [Guía de estudio](resources/study-guide.md)
- **Siguiente lección**: Volver a [README principal](README.md)

**Mantente actualizado**: Sigue este repositorio para recibir notificaciones sobre nuevas versiones y actualizaciones importantes de los materiales de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda traducción profesional humana. No nos hacemos responsables de ningún malentendido o mala interpretación que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->