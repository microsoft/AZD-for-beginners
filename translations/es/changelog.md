# Registro de cambios - AZD For Beginners

## Introducción

Este registro de cambios documenta todos los cambios, actualizaciones y mejoras notables del repositorio AZD For Beginners. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de aprendizaje

Al revisar este registro de cambios, usted:
- Mantenerse informado sobre nuevas características y adiciones de contenido
- Entender las mejoras realizadas en la documentación existente
- Rastrear correcciones de errores y ajustes para asegurar la exactitud
- Seguir la evolución de los materiales de aprendizaje a lo largo del tiempo

## Resultados de aprendizaje

Después de revisar las entradas del registro de cambios, usted podrá:
- Identificar contenido y recursos nuevos disponibles para el aprendizaje
- Entender qué secciones han sido actualizadas o mejoradas
- Planear su ruta de aprendizaje basándose en los materiales más actuales
- Contribuir con comentarios y sugerencias para mejoras futuras

## Historial de versiones

### [v3.22.0] - 2026-06-16

#### Beginner Gap-Fill #2: Template Authoring, Dev Containers, Pulumi, Azure DevOps, Service Principals, and More
**Esta versión cierra las brechas intermedias restantes identificadas por el análisis azd-coverage: cómo crear y publicar tu propia plantilla, entornos reproducibles de dev-container/Codespaces, el proveedor de infraestructura Pulumi, un recorrido de Azure DevOps CI/CD, autenticación con service principals, orientación para la selección de host (AKS/Spring Apps), explicaciones de `azd restore`/`azd package`, manejo de errores en hooks y prácticas para equipos/entornos compartidos.**

#### Añadido
- **🧱 New Chapter 4 lesson** `docs/chapter-04-infrastructure/custom-templates.md` — creación de tu propia plantilla azd: estructura requerida (`azure.yaml`, `infra/`, `src/`), el campo `metadata.template`, parametrizar la infraestructura con el token de recurso `uniqueString()` y la etiqueta `azd-env-name`, pruebas locales con `azd init --template <local-path>`, publicar en GitHub y enviar al catálogo Awesome AZD
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/dev-containers.md` — entornos azd reproducibles con Dev Containers y GitHub Codespaces: un `.devcontainer/devcontainer.json` mínimo usando la feature oficial `ghcr.io/azure/azure-dev/azd`, características específicas por lenguaje, `docker-in-docker` para hosts de contenedores, y `azd auth login --use-device-code` para inicio de sesión remoto
- **🧩 Pulumi with azd** section in `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, estructura de carpetas de Pulumi, stacks mapeados a entornos azd, salidas/etiquetado requeridos, y el idéntico flujo de trabajo `azd up` / `azd down`
- **🎯 Host-selection guidance** in `docs/chapter-04-infrastructure/provisioning.md` — una comparación amigable para principiantes de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, y `springapp`, con orientación sobre cuándo elegir AKS o Azure Spring Apps
- **🛠️ Azure DevOps CI/CD walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexión de servicio con federación de identidad de carga de trabajo (OIDC), el `azure-dev.yml` generado, y configuración de variable-group
- **🔑 Service Principals (Pattern 4)** added to `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` no interactivo con client secret vs. credenciales federadas/OIDC, cuándo usarlo y almacenamiento seguro de credenciales
- **🪝 Hook error-handling** subsection in `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de salida y `set -e`, `continueOnError`, probar hooks en aislamiento con `azd hooks run`, shells específicos del SO, y `--debug`
- **👥 Team / shared environments** section in `docs/chapter-03-configuration/configuration.md` — qué vive en `.azure/`, qué ignorar en git, entornos por desarrollador, `azd env list`/`select`, y proveer valores de entorno en CI/CD
- **🧰 `azd restore` and expanded `azd package`** explanations in `resources/cheat-sheet.md` — restaurar dependencias y construir un artefacto desplegable sin desplegar

#### Cambiado
- **🧭 Chapter 4 lessons table** updated to include the new "Authoring Your Own Template" lesson (Lesson 3)
- **🧭 Chapter 1 lessons table** updated to include the new "Dev Containers & Codespaces" lesson (Lesson 5); navigation footers wired between `bring-your-own-app.md` and `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Beginner Gap-Fill: Hands-On Multi-Agent Lesson, "Bring Your Own App," Terraform, and CI/CD Walkthrough
**Esta versión cierra las mayores brechas para una guía completa para principiantes añadiendo dos nuevas lecciones prácticas (un recorrido desplegable multi-agente y cómo añadir azd a una app existente), una introducción amigable a hooks, una sección de Terraform con azd, un recorrido paso a paso del pipeline de GitHub Actions, un explicador de las nuevas extensiones en preview, y una lista de verificación explícita para la verificación del despliegue.**

#### Añadido
- **🤝 New Chapter 5 lesson** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un recorrido totalmente práctico y desplegable de dos agentes (orquestador + especialistas) usando una plantilla real (`contoso-creative-writer`), cubriendo cuándo usar multi-agent, el flujo `azd up`, entender los recursos desplegados, trazado entre agentes, personalización y limpieza
- **📦 New Chapter 1 lesson** `docs/chapter-01-foundation/bring-your-own-app.md` — cómo añadir azd a un proyecto existente con `azd init` ("use code in the current directory"), entender `azure.yaml` y `infra/`, `azd infra generate`, detección de host y desplegar con `azd up`
- **🌐 Terraform with azd** section added to `docs/chapter-04-infrastructure/provisioning.md` — configuración `infra.provider: terraform`, estructura de carpetas `.tf`, salidas `AZURE_*` requeridas y etiquetado `azd-env-name`, y el idéntico flujo de trabajo `azd up` / `azd down` (cierra la brecha donde se afirmaba soporte de Terraform pero solo se mostró Bicep)
- **⚙️ Step-by-step GitHub Actions walkthrough** in `docs/chapter-08-production/production-ai-practices.md` — desde el repositorio de GitHub hasta despliegues automatizados: `azd pipeline config`, credenciales federadas OIDC (sin secretos almacenados), el `azure-dev.yml` generado, y orientación sobre secretos vs variables
- **🪝 Beginner "New to hooks?" introduction** in `docs/chapter-04-infrastructure/deployment-guide.md` — qué es un hook, una tabla de etapas de hooks, un hook mínimo inicial, y ejecutar hooks manualmente con `azd hooks run`
- **✅ "Verify Your Deployment" checklist** added to Step 5 of `docs/chapter-01-foundation/first-project.md` — prueba básica, comprobación del endpoint de salud y criterios de éxito explícitos
- **🧩 Explainer for new preview extensions** `azure.ai.skills` and `azure.ai.connections` (qué son y cuándo recurrir a ellas) in `docs/chapter-08-production/production-ai-practices.md`

#### Cambiado
- **🧭 Chapter 5 lessons table** corrected: `multi-agent-basics.md` is now Lesson 1 (the only fully hands-on lesson), with honest labeling that Lesson 2 lives in Chapter 6 and the Retail scenario is an architecture blueprint, not a one-command template
- **🧭 Chapter 1 lessons table** now includes the new "Bring Your Own App" lesson (Lesson 4)
- **🔗 Navigation footers** updated: `first-project.md` now links forward to `bring-your-own-app.md`

#### Corregido
- **🧱 Closed the "claimed but missing" Terraform gap** — the course previously referenced Terraform support without showing it
- **🔀 Corrected misleading Chapter 5 cross-links** that implied a full multi-agent implementation existed when only an architecture blueprint did

#### Archivos actualizados
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(new)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(new)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### AZD 1.25.6 Refresh, Full Agent Lifecycle Commands & Aspire Rebrand
**Esta versión revalida el curso contra `azd` `1.25.6` (junio 2026) y la extensión `azure.ai.agents` `0.1.40-preview`, expande la orientación de IA de "esqueletizar un agente" al ciclo de vida completo del agente (test → evaluate → optimize → inspect → delete), da visibilidad a las nuevas extensiones en preview `azure.ai.skills` y `azure.ai.connections`, y anota el rebranding del producto ".NET Aspire" → "Aspire".**

#### Añadido
- **🔁 Full agent lifecycle coverage** for beginners and AI engineers across the docs:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabla de ciclo de vida (scaffold → test → measure → improve → inspect → clean up) añadida a la sección Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Nueva sección "Managing the Agent Lifecycle" cubriendo `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, y `delete --force`
  - `resources/cheat-sheet.md` — Comandos ampliados de AI Agent con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, y `delete --force`
- **🧩 New preview extensions** documented: `azure.ai.skills` (reusable agent skills) and `azure.ai.connections` (Foundry connections) added to the extensions table and cheat sheet
- **⏱️ Response-timing guidance** — los ejemplos de `azd ai agent invoke` ahora indican que imprime latencia total y time-to-first-byte
- **📌 Version banner** in the root README pointing learners at `azd version` and `azd upgrade`

#### Cambiado
- **✅ Validation baseline updated** from `azd 1.23.12` (March 2026) to `azd 1.25.6` (June 2026) across all chapter READMEs and the workshop docs
- **🤖 Chapter 2 extension note** updated from `azure.ai.agents` `0.1.18-preview` to `0.1.40-preview`
- **🧪 Workshop validation example** (`azd version` output) updated to `1.25.6`
- **🧭 README "What's New in azd Today"** refreshed to highlight the end-to-end agent lifecycle, new AI extensions, and recent quality-of-life fixes (`azd init` idempotency, `azd auth login` stale-token clearing, `azd tool` first-run prompt)
- **📖 Chapter 2 agents.md (Option 4)** now points learners to the post-deploy lifecycle commands rather than stopping at `azd up`

#### Corregido
- **🏷️ Product naming** — added an Aspire rebrand note (".NET Aspire" is now simply "Aspire"); azd's Aspire support is unchanged
- **🔎 Live release validation** confirmed against the Azure Developer CLI release feed: stable CLI `1.25.6` (2026-06-12) and `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Archivos actualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Aclaración de incorporación para principiantes, validación de configuración y limpieza final de comandos AZD
**Esta versión da seguimiento a la inspección de validación de AZD 1.23 con una pasada de documentación enfocada en principiantes: aclara la guía de autenticación centrada en AZD, agrega scripts de validación de configuración local, verifica comandos clave contra el CLI AZD en vivo y elimina las últimas referencias a comandos en inglés obsoletos fuera del registro de cambios.**

#### Añadido
- **🧪 Scripts de validación de configuración para principiantes** con `validate-setup.ps1` y `validate-setup.sh` para que los alumnos puedan confirmar las herramientas requeridas antes de comenzar el Capítulo 1
- **✅ Pasos de validación de configuración inicial** en el README raíz y en el README del Capítulo 1 para que los prerrequisitos faltantes se detecten antes de `azd up`

#### Cambiado
- **🔐 Guía de autenticación para principiantes** ahora trata de forma consistente a `azd auth login` como la ruta principal para los flujos de trabajo de AZD, con `az login` señalado como opcional a menos que se utilicen comandos de Azure CLI directamente
- **📚 Flujo de incorporación del Capítulo 1** ahora dirige a los alumnos a validar su configuración local antes de la instalación, autenticación y los primeros pasos de despliegue
- **🛠️ Mensajería del validador** ahora separa claramente los requisitos bloqueantes de las advertencias opcionales de Azure CLI para la ruta de principiante solo con AZD
- **📖 Documentos de configuración, solución de problemas y ejemplos** ahora distinguen entre la autenticación requerida de AZD y el inicio de sesión opcional de Azure CLI cuando ambos se presentaban previamente sin contexto

#### Corregido
- **📋 Referencias restantes a comandos en fuente inglesa** actualizadas a las formas actuales de AZD, incluyendo `azd config show` en la hoja de referencia y `azd monitor --overview` donde se pretendía la guía de vista general del Portal de Azure
- **🧭 Afirmaciones para principiantes en el Capítulo 1** atenuadas para evitar prometer en exceso comportamiento garantizado de cero errores o reversión en todos los templates y recursos de Azure
- **🔎 Validación del CLI en vivo** confirmó soporte actual para `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, y `azd down --force --purge`

#### Archivos actualizados
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
**Esta versión realiza una pasada de validación documental contra `azd` `1.23.12`, actualiza ejemplos de comandos AZD desactualizados, refresca la orientación sobre modelos de IA a los valores predeterminados actuales y amplía las instrucciones del taller más allá de GitHub Codespaces para también soportar dev containers y clones locales.**

#### Añadido
- **✅ Notas de validación en capítulos centrales y documentación del taller** para hacer explícita la base AZD probada para los alumnos que usen builds del CLI más nuevos o más antiguos
- **⏱️ Orientación sobre tiempos de espera de despliegue** para despliegues de aplicaciones de IA de larga duración usando `azd deploy --timeout 1800`
- **🔎 Pasos de inspección de extensiones** con `azd extension show azure.ai.agents` en la documentación de flujos de trabajo de IA
- **🌐 Orientación más amplia del entorno del taller** que cubre GitHub Codespaces, dev containers y clones locales con MkDocs

#### Cambiado
- **📚 READMEs de introducción de capítulos** ahora indican de forma consistente la validación contra `azd 1.23.12` en foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting y production
- **🛠️ Referencias de comandos AZD** actualizadas a las formas actuales en los docs:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` dependiendo del contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` cuando se pretende una vista general de Application Insights
- **🧪 Ejemplos de vista previa de aprovisionamiento** simplificados al uso compatible actual, como `azd provision --preview` y `azd provision --preview -e production`
- **🧭 Flujo del taller** actualizado para que los alumnos puedan completar los laboratorios en Codespaces, un dev container o un clone local en lugar de asumir ejecución solo en Codespaces
- **🔐 Guía de autenticación** ahora prefiere `azd auth login` para flujos de trabajo AZD, con `az login` posicionado como opcional cuando se usan comandos de Azure CLI directamente

#### Corregido
- **🪟 Comandos de instalación en Windows** normalizados a la capitalización actual del paquete `winget` en la guía de instalación
- **🐧 Guía de instalación en Linux** corregida para evitar instrucciones de gestores de paquetes `azd` específicas de distro no soportadas y en su lugar apuntar a los assets de release cuando corresponda
- **📦 Ejemplos de modelos de IA** actualizados desde valores antiguos como `gpt-35-turbo` y `text-embedding-ada-002` a ejemplos actuales como `gpt-4.1-mini`, `gpt-4.1` y `text-embedding-3-large`
- **📋 Fragmentos de despliegue y diagnóstico** corregidos para usar comandos actuales de entorno y estado en logs, scripts y pasos de solución de problemas
- **⚙️ Orientación de GitHub Actions** actualizada de `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Guía de consentimiento MCP/Copilot** actualizada de `azd mcp consent` a `azd copilot consent list`

#### Mejorado
- **🧠 Orientación del capítulo de IA** ahora explica mejor el comportamiento sensible a preview de `azd ai`, el inicio de sesión específico de tenant, el uso actual de extensiones y recomendaciones actualizadas de despliegue de modelos
- **🧪 Instrucciones del taller** ahora usan ejemplos de versiones más realistas y un lenguaje de configuración de entorno más claro para laboratorios prácticos
- **📈 Documentos de producción y solución de problemas** ahora se alinean mejor con monitoreo actual, modelos de respaldo y ejemplos de niveles de coste

#### Archivos actualizados
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

#### Comandos AZD AI CLI, validación de contenido y expansión de templates
**Esta versión agrega cobertura de `azd ai`, `azd extension` y `azd mcp` en todos los capítulos relacionados con IA, corrige enlaces rotos y código obsoleto en agents.md, actualiza la hoja de referencia y renueva la sección de Plantillas de Ejemplo con descripciones validadas y nuevos templates de Azure AI AZD.**

#### Añadido
- **🤖 Cobertura del CLI AZD AI** en 7 archivos (anteriormente solo en el Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nueva sección "Extensions and AI Commands" que introduce `azd extension`, `azd ai agent init`, y `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opción 4: `azd ai agent init` con tabla comparativa (enfoque por template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecciones "AZD Extensions for Foundry" y "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start ahora muestra rutas de despliegue basadas en template y en manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sección de Deploy ahora incluye la opción `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsección "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Nueva sección "AI & Extensions Commands" con `azd extension`, `azd ai agent init`, `azd mcp`, y `azd infra generate`
- **📦 Nuevas plantillas de ejemplo AZD AI** en `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET con Blazor WebAssembly, Semantic Kernel y soporte de chat por voz
  - **azure-search-openai-demo-java** — chat RAG en Java usando Langchain4J con opciones de despliegue en ACA/AKS
  - **contoso-creative-writer** — aplicación multi-agente de escritura creativa usando Azure AI Agent Service, Bing Grounding y Prompty
  - **serverless-chat-langchainjs** — RAG sin servidor usando Azure Functions + LangChain.js + Cosmos DB con soporte de desarrollo local Ollama
  - **chat-with-your-data-solution-accelerator** — acelerador empresarial RAG con portal de administración, integración con Teams y opciones PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — app de referencia de orquestación MCP multi-agente con servidores en .NET, Python, Java y TypeScript
  - **azd-ai-starter** — plantilla inicial Bicep mínima de infraestructura Azure AI
  - **🔗 Enlace a la Awesome AZD AI Gallery** — referencia a la [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templates)

#### Corregido
- **🔗 Navegación de agents.md**: los enlaces Anterior/Siguiente ahora coinciden con el orden de lecciones del README del Capítulo 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Enlaces rotos en agents.md**: `production-ai-practices.md` corregido a `../chapter-08-production/production-ai-practices.md` (3 ocurrencias)
- **📦 Código obsoleto en agents.md**: `opencensus` reemplazado por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida en agents.md**: `max_tokens` movido de `create_agent()` a `create_run()` como `max_completion_tokens`
- **🔢 Conteo de tokens en agents.md**: sustitución de la estimación aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: servicios corregidos de "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predeterminado cambiado en oct 2024)
- **contoso-chat**: descripción actualizada para referenciar Azure AI Foundry + Prompty, coincidiendo con el título y stack tecnológico real del repo

#### Eliminado
- **ai-document-processing**: eliminado el template no funcional (repo no accesible públicamente como template AZD)

#### Mejorado
- **📝 Ejercicios en agents.md**: El Ejercicio 1 ahora muestra la salida esperada y el paso `azd monitor`; el Ejercicio 2 incluye el código completo de registro de `FunctionTool`; el Ejercicio 3 reemplaza la guía vaga con comandos `prepdocs.py` concretos
- **📚 Recursos en agents.md**: enlaces de documentación actualizados a los docs actuales de Azure AI Agent Service y quickstart
- **📋 Tabla de Next Steps en agents.md**: añadida vinculación al AI Workshop Lab para cobertura completa del capítulo

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
**Esta versión mejora la navegación por capítulos de README.md con un formato de tabla mejorado.**

#### Cambios
- **Course Map Table**: Mejorada con enlaces directos a las lecciones, estimaciones de duración y calificaciones de complejidad
- **Folder Cleanup**: Eliminadas carpetas antiguas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Se verificaron todos los 21+ enlaces internos en la tabla del mapa del curso

### [v3.16.0] - 2026-02-05

#### Actualizaciones de nombres de producto
**Esta versión actualiza las referencias de producto al branding actual de Microsoft.**

#### Cambios
- **Microsoft Foundry → Microsoft Foundry**: Todas las referencias actualizadas en archivos que no son de traducción
- **Azure AI Agent Service → Foundry Agents**: Nombre del servicio actualizado para reflejar el branding actual

#### Archivos actualizados
- `README.md` - Página principal del curso
- `changelog.md` - Historial de versiones
- `course-outline.md` - Estructura del curso
- `docs/chapter-02-ai-development/agents.md` - Guía de agentes de IA
- `examples/README.md` - Documentación de ejemplos
- `workshop/README.md` - Página principal del taller
- `workshop/docs/index.md` - Índice del taller
- `workshop/docs/instructions/*.md` - Todos los archivos de instrucciones del taller

---

### [v3.15.0] - 2026-02-05

#### Reestructuración mayor del repositorio: Nombres de carpetas por capítulo
**Esta versión reestructura la documentación en carpetas por capítulos dedicadas para una navegación más clara.**

#### Renombrado de carpetas
Las carpetas antiguas han sido reemplazadas por carpetas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

#### Migraciones de archivos
| Archivo | Origen | Destino |
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
- **🗺️ README.md principal**: Mapa del curso actualizado con la nueva estructura de capítulos
- **📝 examples/README.md**: Actualizadas las referencias cruzadas a las carpetas de capítulo

#### Eliminados
- Estructura de carpetas antigua (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestructuración del repositorio: Navegación por capítulos
**Esta versión añadió archivos README de navegación por capítulos (reemplazados por la v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nueva guía de agentes de IA
**Esta versión añade una guía completa para desplegar agentes de IA con Azure Developer CLI.**

#### Añadido
- **🤖 docs/microsoft-foundry/agents.md**: Guía completa que cubre:
  - Qué son los agentes de IA y cómo se diferencian de los chatbots
  - Tres plantillas de agente de inicio rápido (Foundry Agents, Prompty, RAG)
  - Patrones de arquitectura de agentes (agente único, RAG, multi-agent)
  - Configuración y personalización de herramientas
  - Monitorización y seguimiento de métricas
  - Consideraciones de coste y optimización
  - Escenarios comunes de resolución de problemas
  - Tres ejercicios prácticos con criterios de éxito

#### Estructura del contenido
- **Introducción**: Conceptos de agentes para principiantes
- **Inicio rápido**: Despliega agentes con `azd init --template get-started-with-ai-agents`
- **Patrones de arquitectura**: Diagramas visuales de patrones de agentes
- **Configuración**: Configuración de herramientas y variables de entorno
- **Monitorización**: Integración con Application Insights
- **Ejercicios**: Aprendizaje práctico progresivo (20-45 minutos cada uno)

---

### [v3.12.0] - 2026-02-05

#### Actualización del entorno DevContainer
**Esta versión actualiza la configuración del contenedor de desarrollo con herramientas modernas y valores predeterminados mejorados para la experiencia de aprendizaje de AZD.**

#### Cambios
- **🐳 Imagen base**: Actualizada de `python:3.12-bullseye` a `python:3.12-bookworm` (última Debian estable)
- **📛 Nombre del contenedor**: Renombrado de "Python 3" a "AZD for Beginners" para mayor claridad

#### Añadido
- **🔧 Nuevas características del Dev Container**:
  - `azure-cli` con soporte Bicep habilitado
  - `node:20` (versión LTS para plantillas AZD)
  - `github-cli` para gestión de plantillas
  - `docker-in-docker` para despliegues de aplicaciones en contenedores

- **🔌 Reenvío de puertos**: Puertos preconfigurados para desarrollo común:
  - 8000 (vista previa de MkDocs)
  - 3000 (aplicaciones web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nuevas extensiones de VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense mejorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Soporte para Azure Functions
  - `ms-azuretools.vscode-docker` - Soporte de Docker
  - `ms-azuretools.vscode-bicep` - Soporte para el lenguaje Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestión de recursos de Azure
  - `yzhang.markdown-all-in-one` - Edición de Markdown
  - `DavidAnson.vscode-markdownlint` - Linting de Markdown
  - `bierner.markdown-mermaid` - Soporte para diagramas Mermaid
  - `redhat.vscode-yaml` - Soporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualización de Git
  - `mhutchie.git-graph` - Historial de Git

- **⚙️ Configuración de VS Code**: Añadida configuración predeterminada para el intérprete de Python, formateo al guardar y recorte de espacios en blanco

- **📦 requirements-dev.txt actualizado**:
  - Se añadió el plugin de minificación para MkDocs
  - Se añadió pre-commit para calidad de código
  - Se añadieron paquetes del SDK de Azure (azure-identity, azure-mgmt-resource)

#### Corregido
- **Comando Post-Create**: Ahora verifica la instalación de AZD y Azure CLI al iniciar el contenedor

---

### [v3.11.0] - 2026-02-05

#### Revisión del README orientada a principiantes
**Esta versión mejora significativamente el README.md para que sea más accesible para principiantes y agrega recursos esenciales para desarrolladores de IA.**

#### Añadido
- **🆚 Comparación Azure CLI vs AZD**: Explicación clara de cuándo usar cada herramienta con ejemplos prácticos
- **🌟 Enlaces Awesome AZD**: Enlaces directos a la galería de plantillas de la comunidad y recursos para contribuir:
  - [Galería Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ plantillas listas para desplegar
  - [Enviar una plantilla](https://github.com/Azure/awesome-azd/issues) - Contribución de la comunidad
- **🎯 Guía de inicio rápido**: Sección de 3 pasos simplificada para comenzar (Instalar → Iniciar sesión → Desplegar)
- **📊 Tabla de navegación basada en la experiencia**: Guía clara sobre dónde comenzar según la experiencia del desarrollador

#### Cambios
- **Estructura del README**: Reorganizada para divulgación progresiva: información clave primero
- **Sección de introducción**: Reescrita para explicar "La magia de `azd up`" para principiantes completos
- **Eliminado contenido duplicado**: Se eliminó la sección duplicada de resolución de problemas
- **Comandos de resolución de problemas**: Se corrigió la referencia `azd logs` para usar el válido `azd monitor --logs`

#### Corregido
- **🔐 Comandos de autenticación**: Se añadieron `azd auth login` y `azd auth logout` a cheat-sheet.md
- **Referencias a comandos inválidos**: Se eliminó el resto de `azd logs` de la sección de resolución de problemas del README

#### Notas
- **Alcance**: Cambios aplicados al README.md principal y a resources/cheat-sheet.md
- **Público objetivo**: Mejoras dirigidas específicamente a desarrolladores nuevos en AZD

---

### [v3.10.0] - 2026-02-05

#### Actualización de la precisión de comandos del Azure Developer CLI
**Esta versión corrige comandos AZD inexistentes en la documentación, asegurando que todos los ejemplos de código usen la sintaxis válida del Azure Developer CLI.**

#### Corregido
- **🔧 Eliminación de comandos AZD inexistentes**: Auditoría y corrección exhaustiva de comandos inválidos:
  - `azd logs` (no existe) → reemplazado por `azd monitor --logs` o alternativas de Azure CLI
  - Subcomandos `azd service` (no existen) → reemplazados por `azd show` y Azure CLI
  - `azd infra import/export/validate` (no existen) → eliminados o reemplazados por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (no existen) → eliminados
  - Flags `azd provision --what-if/--rollback` (no existen) → actualizados para usar `--preview`
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

#### Cambios
- **Estrategias de rollback**: Documentación actualizada para usar rollback basado en Git (AZD no tiene rollback nativo)
- **Visualización de logs**: Se reemplazaron referencias a `azd logs` por `azd monitor --logs`, `azd monitor --live` y comandos de Azure CLI
- **Sección de rendimiento**: Se eliminaron flags de despliegue paralelos/incrementales inexistentes y se proporcionaron alternativas válidas

#### Detalles técnicos
- **Comandos AZD válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidos de azd monitor**: `--live`, `--logs`, `--overview`
- **Características eliminadas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificación**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalización del taller y mejora de la calidad de la documentación
**Esta versión completa los módulos interactivos del taller, corrige todos los enlaces rotos de la documentación y mejora la calidad general del contenido para desarrolladores de IA que usan Microsoft AZD.**

#### Añadido
- **📝 CONTRIBUTING.md**: Nuevo documento de directrices para contribuciones con:
  - Directrices de ejemplos de código y convenciones de mensajes de commit
  - Información sobre participación de la comunidad

#### Completado
- **🎯 Workshop Module 7 (Resumen)**: Módulo de cierre completamente completado con:
  - Resumen integral de los logros del taller
  - Sección de conceptos clave dominados que cubre AZD, plantillas y Microsoft Foundry
  - Recomendaciones para la continuación del aprendizaje
  - Ejercicios de desafío del taller con calificaciones de dificultad
  - Enlaces de retroalimentación de la comunidad y soporte

- **📚 Workshop Module 3 (Deconstruct)**: Objetivos de aprendizaje actualizados con:
  - Guía para activar GitHub Copilot con servidores MCP
  - Comprensión de la estructura de carpetas de plantillas AZD
  - Patrones de organización de Infrastructure-as-Code (Bicep)
  - Instrucciones para laboratorios prácticos

- **🔧 Workshop Module 6 (Desmontaje)**: Completado con:
  - Objetivos de limpieza de recursos y gestión de costos
  - Uso de `azd down` para el desaprovisionamiento seguro de infraestructura
  - Guía para la recuperación de servicios cognitivos eliminados de forma suave
  - Sugerencias de exploración adicionales para GitHub Copilot y Azure Portal

#### Corregido
- **🔗 Corrección de enlaces rotos**: Se resolvieron más de 15 enlaces internos rotos:
  - `docs/ai-foundry/ai-model-deployment.md`: Corregidos los caminos a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corregidos los caminos ai-model-deployment.md y production-ai-practices.md
  - `docs/getting-started/first-project.md`: Reemplazado el inexistente cicd-integration.md por deployment-guide.md
  - `examples/retail-scenario.md`: Corregidos los caminos de FAQ y la guía de resolución de problemas
  - `examples/container-app/microservices/README.md`: Corregidos los caminos del inicio del curso y de la guía de despliegue
  - `resources/faq.md` y `resources/glossary.md`: Actualizadas las referencias del capítulo de IA
  - `course-outline.md`: Corregidas las referencias de la guía del instructor y del laboratorio del taller de IA

- **📅 Banner de estado del taller**: Actualizado de "Under Construction" a estado activo del taller con fecha febrero de 2026

- **🔗 Navegación del taller**: Corregidos los enlaces de navegación rotos en workshop README.md que apuntaban a la carpeta inexistente lab-1-azd-basics

#### Cambiado
- **Presentación del taller**: Eliminada la advertencia "under construction", el taller ahora está completo y listo para usarse
- **Consistencia de navegación**: Asegurado que todos los módulos del taller tengan navegación inter-modular adecuada
- **Referencias de la ruta de aprendizaje**: Actualizadas las referencias cruzadas de capítulos para usar las rutas correctas de microsoft-foundry

#### Validado
- ✅ Todos los archivos markdown en inglés tienen enlaces internos válidos
- ✅ Los módulos del taller 0-7 están completos con objetivos de aprendizaje
- ✅ La navegación entre capítulos y módulos funciona correctamente
- ✅ El contenido es adecuado para desarrolladores de IA que usan Microsoft AZD
- ✅ Se mantuvo un lenguaje y estructura amigables para principiantes en todo el contenido
- ✅ CONTRIBUTING.md proporciona orientación clara para colaboradores de la comunidad

#### Implementación técnica
- **Validación de enlaces**: Script de PowerShell automatizado verificó todos los enlaces internos .md
- **Auditoría de contenido**: Revisión manual de la integridad del taller y la idoneidad para principiantes
- **Sistema de navegación**: Se aplicaron patrones consistentes de navegación entre capítulos y módulos

#### Notas
- **Alcance**: Cambios aplicados solo a la documentación en inglés
- **Traducciones**: Las carpetas de traducción no se actualizaron en esta versión (la traducción automatizada se sincronizará más tarde)
- **Duración del taller**: El taller completo ahora ofrece 3-4 horas de aprendizaje práctico

---

### [v3.8.0] - 2025-11-19

#### Documentación avanzada: Monitoreo, seguridad y patrones multi-agente
**Esta versión añade lecciones integrales de calidad A sobre la integración con Application Insights, patrones de autenticación y coordinación multi-agente para despliegues de producción.**

#### Añadido
- **📊 Lección de integración de Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Despliegue enfocado en AZD con aprovisionamiento automático
  - Plantillas Bicep completas para Application Insights + Log Analytics
  - Aplicaciones Python funcionales con telemetría personalizada (1,200+ líneas)
  - Patrones de monitoreo para IA/LLM (seguimiento de tokens/costes de Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitectura, trazado distribuido, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, paneles, monitoreo de IA)
  - Ejemplos de consultas Kusto y estrategias de optimización de costes
  - Transmisión de métricas en vivo y depuración en tiempo real
  - 40-50 minutos de tiempo de aprendizaje con patrones listos para producción

- **🔐 Lección de patrones de autenticación y seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (cadenas de conexión, Key Vault, identidad administrada)
  - Plantillas Bicep completas de infraestructura para despliegues seguros
  - Código de aplicación Node.js con integración del Azure SDK
  - 3 ejercicios completos (habilitar identidad administrada, identidad asignada por el usuario, rotación de Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de resolución de problemas y análisis de costes
  - Patrones de autenticación sin contraseña listos para producción

- **🤖 Lección de patrones de coordinación multi-agente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, dirigido por eventos, consenso)
  - Implementación completa de servicio orquestador (Python/Flask, 1,500+ líneas)
  - 3 implementaciones de agentes especializados (Research, Writer, Editor)
  - Integración con Service Bus para encolado de mensajes
  - Gestión de estado en Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid que muestran interacciones entre agentes
  - 3 ejercicios avanzados (manejo de timeouts, lógica de reintento, circuit breaker)
  - Desglose de costos ($240-565/month) con estrategias de optimización
  - Integración con Application Insights para monitoreo

#### Mejorado
- **Capítulo de pre-despliegue**: Ahora incluye patrones integrales de monitoreo y coordinación
- **Capítulo de inicio**: Mejorado con patrones de autenticación profesionales
- **Preparación para producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del curso**: Actualizado para referenciar las nuevas lecciones en los Capítulos 3 y 6

#### Cambiado
- **Progresión de aprendizaje**: Mejor integración de seguridad y monitoreo a lo largo del curso
- **Calidad de la documentación**: Estándares consistentes de grado A (95-97%) en las nuevas lecciones
- **Patrones de producción**: Cobertura completa de extremo a extremo para despliegues empresariales

#### Mejorado
- **Experiencia del desarrollador**: Ruta clara desde el desarrollo hasta el monitoreo en producción
- **Estándares de seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de trabajo de IA**: Monitoreo especializado para Microsoft Foundry Models y sistemas multi-agente

#### Validado
- ✅ Todas las lecciones incluyen código completo y funcional (no fragmentos)
- ✅ Diagramas Mermaid para aprendizaje visual (19 en total en 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 en total)
- ✅ Plantillas Bicep listas para producción desplegables mediante `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de resolución de problemas y mejores prácticas
- ✅ Puntos de control de conocimiento con comandos de verificación

#### Resultados de la calificación de la documentación
- **docs/pre-deployment/application-insights.md**: - Guía de monitoreo integral
- **docs/getting-started/authsecurity.md**: - Patrones de seguridad profesionales
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas multi-agente avanzadas
- **Contenido nuevo en general**: - Estándares de alta calidad consistentes

#### Implementación técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazado distribuido
- **Autenticación**: Identidad administrada + Key Vault + patrones RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Monitoreo**: Métricas en vivo + consultas Kusto + alertas + paneles
- **Gestión de costos**: Estrategias de muestreo, políticas de retención, controles de presupuesto

### [v3.7.0] - 2025-11-19

#### Mejoras de calidad documental y nuevo ejemplo de Microsoft Foundry Models
**Esta versión mejora la calidad de la documentación en todo el repositorio y añade un ejemplo completo de despliegue de Microsoft Foundry Models con interfaz de chat gpt-4.1.**

#### Añadido
- **🤖 Ejemplo de chat con Microsoft Foundry Models**: Despliegue completo de gpt-4.1 con implementación funcional en `examples/azure-openai-chat/`:
  - Infraestructura completa de Microsoft Foundry Models (despliegue del modelo gpt-4.1)
  - Interfaz de chat de línea de comandos en Python con historial de conversaciones
  - Integración con Key Vault para almacenamiento seguro de claves de API
  - Seguimiento del uso de tokens y estimación de costes
  - Limitación de tasa y manejo de errores
  - README completo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, app Python, configuración)
- **📚 Ejercicios de documentación**: Se añadieron ejercicios prácticos a la guía de configuración:
  - Ejercicio 1: Configuración multi-entorno (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios de éxito claros y pasos de verificación
- **✅ Verificación de despliegue**: Se añadió sección de verificación a la guía de despliegue:
  - Procedimientos de comprobación de estado
  - Lista de verificación de criterios de éxito
  - Salidas esperadas para todos los comandos de despliegue
  - Referencia rápida de resolución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad de grado A (93%):
  - Agregado azure-openai-chat a todas las secciones relevantes
  - Actualizado el conteo de ejemplos locales de 3 a 4
  - Añadido a la tabla de ejemplos de aplicaciones de IA
  - Integrado en el Inicio Rápido para usuarios intermedios
  - Añadido a la sección de plantillas de Microsoft Foundry
  - Actualizadas la Matriz de Comparación y las secciones de hallazgos tecnológicos
- **Calidad de la documentación**: Mejorada B+ (87%) → A- (92%) en la carpeta docs:
  - Añadidas salidas esperadas a ejemplos de comandos críticos
  - Incluidos pasos de verificación para cambios de configuración
  - Aprendizaje práctico mejorado con ejercicios prácticos

#### Cambiado
- **Progresión del aprendizaje**: Mejor integración de ejemplos de IA para estudiantes intermedios
- **Estructura de la documentación**: Ejercicios más accionables con resultados claros
- **Proceso de verificación**: Criterios de éxito explícitos añadidos a flujos de trabajo clave

#### Mejorado
- **Experiencia del desarrollador**: El despliegue de Microsoft Foundry Models ahora toma 35-45 minutos (vs 60-90 para alternativas complejas)
- **Transparencia de costos**: Estimaciones de costos claras ($50-200/month) para el ejemplo de Microsoft Foundry Models
- **Ruta de aprendizaje**: Los desarrolladores de IA tienen un punto de entrada claro con azure-openai-chat
- **Estándares de documentación**: Salidas esperadas y pasos de verificación consistentes

#### Validado
- ✅ El ejemplo de Microsoft Foundry Models es completamente funcional con `azd up`
- ✅ Los 11 archivos de implementación son sintácticamente correctos
- ✅ Las instrucciones del README coinciden con la experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ El índice de ejemplos refleja con precisión 4 ejemplos locales
- ✅ No hay enlaces externos duplicados en las tablas
- ✅ Todas las referencias de navegación son correctas

#### Implementación técnica
- **Arquitectura de Microsoft Foundry Models**: gpt-4.1 + Key Vault + patrón Container Apps
- **Seguridad**: Preparado para Managed Identity, secretos en Key Vault
- **Monitoreo**: Integración con Application Insights
- **Gestión de costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Un solo comando `azd up` para la configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización mayor: Ejemplos de despliegue de Container App
**Esta versión introduce ejemplos completos de despliegue de aplicaciones en contenedores listos para producción usando Azure Developer CLI (AZD), con documentación completa e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos de Container App**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Descripción completa de despliegues en contenedores, inicio rápido, producción y patrones avanzados
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST amigable para principiantes con scale-to-zero, sondas de estado, monitoreo y resolución de problemas
  - [Microservices Architecture](../../examples/container-app/microservices): Despliegue multi-servicio listo para producción (API Gateway, Product, Order, User, Notification), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazado distribuido, despliegue blue-green/canary
- **Buenas prácticas**: Seguridad, monitoreo, optimización de costos y orientación de CI/CD para cargas en contenedores
- **Muestras de código**: `azure.yaml` completo, plantillas Bicep e implementaciones de servicios en varios lenguajes (Python, Node.js, C#, Go)
- **Pruebas y resolución de problemas**: Escenarios de prueba de extremo a extremo, comandos de monitoreo, guía de resolución de problemas

#### Cambiado
- **README.md**: Actualizado para presentar y enlazar los nuevos ejemplos de Container App bajo "Local Examples - Container Applications"
- **examples/README.md**: Actualizado para resaltar los ejemplos de Container App, añadir entradas en la matriz de comparación y actualizar referencias de tecnología/arquitectura
- **Esquema del curso y guía de estudio**: Actualizados para referenciar nuevos ejemplos de Container App y patrones de despliegue en los capítulos relevantes

#### Validado
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y que siguen las mejores prácticas
- ✅ Enlaces cruzados de documentación y navegación actualizados
- ✅ Los ejemplos cubren escenarios de principiante a avanzado, incluidos microservicios de producción

#### Notas
- **Alcance**: Documentación y ejemplos en inglés solamente
- **Próximos pasos**: Ampliar con patrones avanzados adicionales de contenedores y automatización CI/CD en futuras versiones

### [v3.5.0] - 2025-11-19

#### Rebranding de producto: Microsoft Foundry
**Esta versión implementa un cambio de nombre de producto integral de "Microsoft Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando el rebranding oficial de Microsoft.**

#### Cambiado
- **🔄 Actualización del nombre del producto**: Rebranding completo de "Microsoft Foundry" a "Microsoft Foundry"
  - Actualizadas todas las referencias en la documentación en inglés en la carpeta `docs/`
  - Renombrada la carpeta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Folder Structure Changes**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - All cross-references updated to reflect new folder structure
  - Navigation links validated across all documentation

- **📄 File Renames**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - All internal links updated to reference new filename

#### Updated Files
- **Chapter Documentation** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias de nombre de producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Already using Microsoft Foundry (from previous updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (resumen, comentarios de la comunidad, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces de referencia cruzada actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulo actualizados
  - `docs/getting-started/installation.md` - 2 enlaces del siguiente capítulo actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad de Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Course Structure Files** (2 files):
  - `README.md` - 17 referencias actualizadas (resumen del curso, títulos de capítulos, sección de plantillas, perspectivas de la comunidad)
  - `course-outline.md` - 14 referencias actualizadas (visión general, objetivos de aprendizaje, recursos del capítulo)

#### Validated
- ✅ Cero referencias restantes a la ruta de la carpeta "ai-foundry" en la documentación en inglés
- ✅ Cero referencias restantes del nombre de producto "Microsoft Foundry" en la documentación en inglés
- ✅ Todos los enlaces de navegación funcionales con la nueva estructura de carpetas
- ✅ Renombrado de archivos y carpetas completado con éxito
- ✅ Referencias cruzadas entre capítulos validadas

#### Notes
- **Scope**: Changes applied to English documentation in `docs/` folder only
- **Translations**: Translation folders (`translations/`) not updated in this version
- **Workshop**: Workshop materials (`workshop/`) not updated in this version
- **Examples**: Example files may still reference legacy naming (to be addressed in future update)
- **External Links**: External URLs and GitHub repository references remain unchanged

#### Migration Guide for Contributors
If you have local branches or documentation referencing the old structure:
1. Update folder references: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Update file references: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Replace product name: "Microsoft Foundry" → "Microsoft Foundry"
4. Validate all internal documentation links still work

---

### [v3.4.0] - 2025-10-24

#### Infrastructure Preview and Validation Enhancements
**This version introduces comprehensive support for the new Azure Developer CLI preview feature and enhances workshop user experience.**

#### Added
- **🧪 azd provision --preview Feature Documentation**: Comprehensive coverage of the new infrastructure preview capability
  - Command reference and usage examples in cheat sheet
  - Detailed integration in provisioning guide with use cases and benefits
  - Pre-flight check integration for safer deployment validation
  - Getting started guide updates with safety-first deployment practices
- **🚧 Workshop Status Banner**: Professional HTML banner indicating workshop development status
  - Gradient design with construction indicators for clear user communication
  - Last updated timestamp for transparency
  - Mobile-responsive design for all device types

#### Enhanced
- **Infrastructure Safety**: Preview functionality integrated throughout deployment documentation
- **Pre-deployment Validation**: Automated scripts now include infrastructure preview testing
- **Developer Workflow**: Updated command sequences to include preview as best practice
- **Workshop Experience**: Clear expectations set for users about content development status

#### Changed
- **Deployment Best Practices**: Preview-first workflow now recommended approach
- **Documentation Flow**: Infrastructure validation moved earlier in learning process
- **Workshop Presentation**: Professional status communication with clear development timeline

#### Improved
- **Safety-First Approach**: Infrastructure changes can now be validated before deployment
- **Team Collaboration**: Preview results can be shared for review and approval
- **Cost Awareness**: Better understanding of resource costs before provisioning
- **Risk Mitigation**: Reduced deployment failures through advance validation

#### Technical Implementation
- **Multi-document Integration**: Preview feature documented across 4 key files
- **Command Patterns**: Consistent syntax and examples throughout documentation
- **Best Practice Integration**: Preview included in validation workflows and scripts
- **Visual Indicators**: Clear NEW feature markings for discoverability

#### Workshop Infrastructure
- **Status Communication**: Professional HTML banner with gradient styling
- **User Experience**: Clear development status prevents confusion
- **Professional Presentation**: Maintains repository credibility while setting expectations
- **Timeline Transparency**: October 2025 last updated timestamp for accountability

### [v3.3.0] - 2025-09-24

#### Enhanced Workshop Materials and Interactive Learning Experience
**This version introduces comprehensive workshop materials with browser-based interactive guides and structured learning paths.**

#### Added
- **🎥 Interactive Workshop Guide**: Browser-based workshop experience with MkDocs preview capability
- **📝 Structured Workshop Instructions**: 7-step guided learning path from discovery to customization
  - 0-Introduction: Workshop overview and setup
  - 1-Select-AI-Template: Template discovery and selection process
  - 2-Validate-AI-Template: Deployment and validation procedures
  - 3-Deconstruct-AI-Template: Understanding template architecture
  - 4-Configure-AI-Template: Configuration and customization
  - 5-Customize-AI-Template: Advanced modifications and iterations
  - 6-Teardown-Infrastructure: Cleanup and resource management
  - 7-Wrap-up: Summary and next steps
- **🛠️ Workshop Tooling**: MkDocs configuration with Material theme for enhanced learning experience
- **🎯 Hands-On Learning Path**: 3-step methodology (Discovery → Deployment → Customization)
- **📱 GitHub Codespaces Integration**: Seamless development environment setup

#### Enhanced
- **AI Workshop Lab**: Extended with comprehensive 2-3 hour structured learning experience
- **Workshop Documentation**: Professional presentation with navigation and visual aids
- **Learning Progression**: Clear step-by-step guidance from template selection to production deployment
- **Developer Experience**: Integrated tooling for streamlined development workflows

#### Improved
- **Accessibility**: Browser-based interface with search, copy functionality, and theme toggle
- **Self-Paced Learning**: Flexible workshop structure accommodating different learning speeds
- **Practical Application**: Real-world AI template deployment scenarios
- **Community Integration**: Discord integration for workshop support and collaboration

#### Workshop Features
- **Built-in Search**: Quick keyword and lesson discovery
- **Copy Code Blocks**: Hover-to-copy functionality for all code examples
- **Theme Toggle**: Dark/light mode support for different preferences
- **Visual Assets**: Screenshots and diagrams for enhanced understanding
- **Help Integration**: Direct Discord access for community support

### [v3.2.0] - 2025-09-17

#### Major Navigation Restructuring and Chapter-Based Learning System
**This version introduces a comprehensive chapter-based learning structure with enhanced navigation throughout the entire repository.**

#### Added
- **📚 Chapter-Based Learning System**: Restructured entire course into 8 progressive learning chapters
  - Capítulo 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Capítulo 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Capítulo 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Capítulo 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Capítulo 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Capítulo 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Capítulo 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Comprehensive Navigation System**: Consistent navigation headers and footers across all documentation
- **🎯 Progress Tracking**: Course completion checklist and learning verification system
- **🗺️ Learning Path Guidance**: Clear entry points for different experience levels and goals
- **🔗 Cross-Reference Navigation**: Related chapters and prerequisites clearly linked

#### Enhanced
- **README Structure**: Transformed into a structured learning platform with chapter-based organization
- **Documentation Navigation**: Every page now includes chapter context and progression guidance
- **Template Organization**: Examples and templates mapped to appropriate learning chapters
- **Resource Integration**: Cheat sheets, FAQs, and study guides connected to relevant chapters
- **Workshop Integration**: Hands-on labs mapped to multiple chapter learning objectives

#### Changed
- **Learning Progression**: Moved from linear documentation to flexible chapter-based learning
- **Configuration Placement**: Repositioned configuration guide as Chapter 3 for better learning flow
- **AI Content Integration**: Better integration of AI-specific content throughout the learning journey
- **Production Content**: Advanced patterns consolidated in Chapter 8 for enterprise learners

#### Improved
- **User Experience**: Clear navigation breadcrumbs and chapter progression indicators
- **Accessibility**: Consistent navigation patterns for easier course traversal
- **Professional Presentation**: University-style course structure suitable for academic and corporate training
- **Learning Efficiency**: Reduced time to find relevant content through improved organization

#### Technical Implementation
- **Navigation Headers**: Standardized chapter navigation across 40+ documentation files
- **Footer Navigation**: Consistent progression guidance and chapter completion indicators
- **Cross-Linking**: Comprehensive internal linking system connecting related concepts
- **Chapter Mapping**: Templates and examples clearly associated with learning objectives

#### Study Guide Enhancement
- **📚 Comprehensive Learning Objectives**: Restructured study guide to align with 8-chapter system
- **🎯 Chapter-Based Assessment**: Each chapter includes specific learning objectives and practical exercises
- **📋 Progress Tracking**: Weekly learning schedule with measurable outcomes and completion checklists
- **❓ Assessment Questions**: Knowledge validation questions for each chapter with professional outcomes
- **🛠️ Practical Exercises**: Hands-on activities with real deployment scenarios and troubleshooting
- **📊 Skill Progression**: Clear advancement from basic concepts to enterprise patterns with career development focus
- **🎓 Certification Framework**: Professional development outcomes and community recognition system
- **⏱️ Timeline Management**: Structured 10-week learning plan with milestone validation

### [v3.1.0] - 2025-09-17

#### Enhanced Multi-Agent AI Solutions
**This version improves the multi-agent retail solution with better agent naming and enhanced documentation.**

#### Changed
- **Multi-Agent Terminology**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Agent Architecture**: Updated all documentation, ARM templates, and code examples to use consistent "Customer agent" naming
- **Configuration Examples**: Modernized agent configuration patterns with updated naming conventions
- **Documentation Consistency**: Ensured all references use professional, descriptive agent names

#### Enhanced
- **ARM Template Package**: Updated retail-multiagent-arm-template with Customer agent references
- **Architecture Diagrams**: Refreshed Mermaid diagrams with updated agent naming
- **Code Examples**: Python classes and implementation examples now use CustomerAgent naming
- **Environment Variables**: Updated all deployment scripts to use CUSTOMER_AGENT_NAME conventions

#### Improved
- **Developer Experience**: Clearer agent roles and responsibilities in documentation
- **Production Readiness**: Better alignment with enterprise naming conventions
- **Learning Materials**: More intuitive agent naming for educational purposes
- **Template Usability**: Simplified understanding of agent functions and deployment patterns

#### Technical Details
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Major Changes - AI Developer Focus and Microsoft Foundry Integration
**This version transforms the repository into a comprehensive AI-focused learning resource with Microsoft Foundry integration.**

#### Added
- **🤖 AI-First Learning Path**: Complete restructure prioritizing AI developers and engineers
- **Microsoft Foundry Integration Guide**: Comprehensive documentation for connecting AZD with Microsoft Foundry services
- **AI Model Deployment Patterns**: Detailed guide covering model selection, configuration, and production deployment strategies
- **AI Workshop Lab**: Taller práctico de 2-3 horas para convertir aplicaciones de IA en soluciones desplegables con AZD
- **Production AI Best Practices**: Patrones listos para la empresa para escalar, supervisar y asegurar cargas de trabajo de IA
- **AI-Specific Troubleshooting Guide**: Guía integral de resolución de problemas específica para IA: modelos de Microsoft Foundry, Cognitive Services y problemas de despliegue de IA
- **AI Template Gallery**: Colección destacada de plantillas de Microsoft Foundry con valoraciones de complejidad
- **Workshop Materials**: Estructura completa del taller con laboratorios prácticos y materiales de referencia

#### Enhanced
- **README Structure**: Enfocado en desarrolladores de IA con datos de interés comunitario del 45% del Discord de Microsoft Foundry
- **Learning Paths**: Trayectoria dedicada para desarrolladores de IA junto a caminos tradicionales para estudiantes e ingenieros DevOps
- **Template Recommendations**: Plantillas de IA destacadas que incluyen azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart
- **Community Integration**: Soporte mejorado de la comunidad en Discord con canales y discusiones específicas para IA

#### Security & Production Focus
- **Managed Identity Patterns**: Patrones de identidad administrada: configuraciones de autenticación y seguridad específicas para IA
- **Cost Optimization**: Seguimiento del uso de tokens y controles de presupuesto para cargas de trabajo de IA
- **Multi-Region Deployment**: Estrategias para el despliegue global de aplicaciones de IA
- **Performance Monitoring**: Métricas específicas de IA e integración con Application Insights

#### Documentation Quality
- **Linear Course Structure**: Progresión lógica desde patrones de despliegue de IA para principiantes hasta avanzados
- **Validated URLs**: Todos los enlaces externos a repositorios verificados y accesibles
- **Complete Reference**: Todos los enlaces de la documentación interna validados y funcionales
- **Production Ready**: Patrones de despliegue empresariales con ejemplos del mundo real

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: Todas las páginas de documentación ahora incluyen secciones de Introducción, Objetivos de aprendizaje y Resultados de aprendizaje
- **Navigation System**: Se añadieron enlaces de Lección anterior/Siguiente en toda la documentación para una progresión de aprendizaje guiada
- **Study Guide**: study-guide.md completo con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación
- **Professional Presentation**: Se eliminaron todos los iconos emoji para mejorar la accesibilidad y la apariencia profesional
- **Enhanced Content Structure**: Mejora en la organización y el flujo de los materiales de aprendizaje

#### Changed
- **Documentation Format**: Estandarizada toda la documentación con una estructura consistente centrada en el aprendizaje
- **Navigation Flow**: Implementada una progresión lógica a través de todos los materiales de aprendizaje
- **Content Presentation**: Eliminados elementos decorativos en favor de un formato claro y profesional
- **Link Structure**: Actualizados todos los enlaces internos para soportar el nuevo sistema de navegación

#### Improved
- **Accessibility**: Eliminadas las dependencias de emoji para una mejor compatibilidad con lectores de pantalla
- **Professional Appearance**: Presentación limpia, de estilo académico, adecuada para el aprendizaje empresarial
- **Learning Experience**: Enfoque estructurado con objetivos y resultados claros para cada lección
- **Content Organization**: Mejor flujo lógico y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Serie completa de guías para empezar
  - Documentación completa de despliegue y aprovisionamiento
  - Recursos detallados de resolución de problemas y guías de depuración
  - Herramientas y procedimientos de validación previos al despliegue

- **Getting Started Module**
  - AZD Basics: Conceptos y terminología fundamentales
  - Installation Guide: Instrucciones de configuración específicas por plataforma
  - Configuration Guide: Configuración del entorno y autenticación
  - First Project Tutorial: Aprendizaje práctico paso a paso

- **Deployment and Provisioning Module**
  - Deployment Guide: Documentación completa del flujo de trabajo
  - Provisioning Guide: Infraestructura como Código con Bicep
  - Mejores prácticas para despliegues en producción
  - Patrones de arquitectura multi-servicio

- **Pre-deployment Validation Module**
  - Capacity Planning: Validación de disponibilidad de recursos de Azure
  - SKU Selection: Guía completa de niveles de servicio
  - Pre-flight Checks: Scripts de validación automatizada (PowerShell y Bash)
  - Herramientas de estimación de costes y planificación presupuestaria

- **Troubleshooting Module**
  - Common Issues: Problemas frecuentes y soluciones
  - Debugging Guide: Metodologías sistemáticas de resolución de problemas
  - Técnicas y herramientas de diagnóstico avanzadas
  - Monitorización y optimización del rendimiento

- **Resources and References**
  - Command Cheat Sheet: Hoja de referencia rápida para comandos esenciales
  - Glossary: Glosario completo de terminología y definiciones de siglas
  - FAQ: Respuestas detalladas a preguntas frecuentes
  - Enlaces a recursos externos y conexiones comunitarias

- **Examples and Templates**
  - Ejemplo de aplicación web simple
  - Plantilla de despliegue para sitio web estático
  - Configuración de aplicación en contenedor
  - Patrones de integración de bases de datos
  - Ejemplos de arquitectura de microservicios
  - Implementaciones de funciones serverless

#### Features
- **Multi-Platform Support**: Guías de instalación y configuración para Windows, macOS y Linux
- **Multiple Skill Levels**: Contenido diseñado para desde estudiantes hasta desarrolladores profesionales
- **Practical Focus**: Ejemplos prácticos y escenarios del mundo real
- **Comprehensive Coverage**: Desde conceptos básicos hasta patrones empresariales avanzados
- **Security-First Approach**: Mejores prácticas de seguridad integradas en todo el contenido
- **Cost Optimization**: Orientación para despliegues rentables y gestión de recursos

#### Documentation Quality
- **Detailed Code Examples**: Ejemplos de código detallados, prácticos y probados
- **Step-by-Step Instructions**: Instrucciones claras y accionables
- **Comprehensive Error Handling**: Manejo integral de errores: resolución de problemas comunes
- **Best Practices Integration**: Integración de mejores prácticas: estándares y recomendaciones de la industria
- **Version Compatibility**: Actualizado con los últimos servicios de Azure y las funciones de azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **AI Agent Frameworks**: Plantillas para despliegues con LangChain, Semantic Kernel y AutoGen
- **Advanced RAG Patterns**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **AI Observability**: Monitorización mejorada del rendimiento de modelos, uso de tokens y calidad de las respuestas

#### Developer Experience
- **VS Code Extension**: Experiencia de desarrollo integrada AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Generación de plantillas AZD asistida por IA
- **Interactive Tutorials**: Ejercicios prácticos de codificación con validación automatizada para escenarios de IA
- **Video Content**: Tutoriales en vídeo complementarios para aprendices visuales centrados en despliegues de IA

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Gobernanza de modelos de IA, cumplimiento y registros de auditoría
- **Multi-Tenant AI**: Patrones para atender múltiples clientes con servicios de IA aislados
- **Edge AI Deployment**: Integración con Azure IoT Edge e instancias de contenedores
- **Hybrid Cloud AI**: Patrones de despliegue multi-cloud e híbrido para cargas de trabajo de IA

#### Advanced Features
- **AI Pipeline Automation**: Integración MLOps con pipelines de Azure Machine Learning
- **Advanced Security**: Patrones de confianza cero, endpoints privados y protección avanzada contra amenazas
- **Performance Optimization**: Ajustes avanzados y estrategias de escalado para aplicaciones de IA de alto rendimiento
- **Global Distribution**: Patrones de distribución de contenido y caché en el edge para aplicaciones de IA

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Contenido centrado en IA: integración completa con Microsoft Foundry (Completado)
- ✅ **Interactive Tutorials**: Tutoriales interactivos: laboratorio práctico de IA (Completado)
- ✅ **Advanced Security Module**: Módulo de seguridad avanzada: patrones de seguridad específicos para IA (Completado)
- ✅ **Performance Optimization**: Optimización de rendimiento: estrategias de afinamiento para cargas de trabajo de IA (Completado)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Ejemplos adicionales: escenarios de despliegue centrados en IA (Completado)
- ✅ **Extended FAQ**: FAQ ampliada: preguntas específicas de IA y resolución de problemas (Completado)
- **Tool Integration**: Integración de herramientas: guías mejoradas de integración con IDE y editores
- ✅ **Monitoring Expansion**: Expansión de monitorización: patrones de monitorización y alertas específicos para IA (Completado)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Documentación optimizada para móviles: diseño responsive para aprendizaje en móvil
- **Offline Access**: Acceso sin conexión: paquetes de documentación descargables
- **Enhanced IDE Integration**: Integración mejorada del IDE: extensión de VS Code para flujos de trabajo AZD + IA
- **Community Dashboard**: Panel comunitario: métricas en tiempo real y seguimiento de contribuciones

## Contributing to the Changelog

### Reporting Changes
Al contribuir a este repositorio, asegúrese de que las entradas del registro de cambios incluyan:

1. **Version Number**: Siguiendo el versionado semántico (major.minor.patch)
2. **Date**: Fecha de lanzamiento o actualización en formato YYYY-MM-DD
3. **Category**: Añadido, Cambiado, Deprecado, Eliminado, Corregido, Seguridad
4. **Clear Description**: Descripción concisa de lo que cambió
5. **Impact Assessment**: Cómo afectan los cambios a los usuarios existentes

### Change Categories

#### Added
- Nuevas características, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas, scripts o utilidades adicionales

#### Changed
- Modificaciones a la funcionalidad existente o la documentación
- Actualizaciones para mejorar la claridad o la precisión
- Reestructuración del contenido u organización

#### Deprecated
- Funcionalidades o enfoques que están siendo eliminados progresivamente
- Secciones de documentación programadas para eliminación
- Métodos que tienen mejores alternativas

#### Removed
- Funcionalidades, documentación o ejemplos que ya no son relevantes
- Información desactualizada o enfoques obsoletos
- Contenido redundante o consolidado

#### Fixed
- Correcciones de errores en la documentación o el código
- Resolución de problemas o incidencias reportadas
- Mejoras en la precisión o funcionalidad

#### Security
- Mejoras o correcciones relacionadas con la seguridad
- Actualizaciones de las mejores prácticas de seguridad
- Resolución de vulnerabilidades de seguridad

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Cambios incompatibles que requieren acción por parte del usuario
- Reestructuración significativa del contenido u organización
- Cambios que alteran el enfoque o la metodología fundamental

#### Minor Version (X.Y.0)
- Nuevas características o adiciones de contenido
- Mejoras que mantienen la compatibilidad hacia atrás
- Ejemplos, herramientas o recursos adicionales

#### Patch Version (X.Y.Z)
- Correcciones de errores y ajustes
- Mejoras menores en el contenido existente
- Aclaraciones y pequeñas mejoras

## Community Feedback and Suggestions

Alentamos activamente los comentarios de la comunidad para mejorar este recurso de aprendizaje:

### How to Provide Feedback
- **GitHub Issues**: Informar problemas o sugerir mejoras (se aceptan problemas específicos de IA)
- **Discord Discussions**: Compartir ideas y participar con la comunidad de Microsoft Foundry
- **Pull Requests**: Contribuir mejoras directas al contenido, especialmente plantillas y guías de IA
- **Microsoft Foundry Discord**: Participar en el canal #Azure para discusiones sobre AZD + IA
- **Community Forums**: Participar en discusiones más amplias de desarrolladores de Azure

### Feedback Categories
- **AI Content Accuracy**: Correcciones a la integración de servicios de IA e información de despliegue
- **Learning Experience**: Sugerencias para mejorar el flujo de aprendizaje para desarrolladores de IA
- **Missing AI Content**: Solicitudes de plantillas, patrones o ejemplos adicionales de IA
- **Accessibility**: Mejoras para necesidades de aprendizaje diversas
- **AI Tool Integration**: Sugerencias para una mejor integración de flujos de trabajo de desarrollo de IA
- **Production AI Patterns**: Solicitudes de patrones de despliegue de IA empresariales

### Response Commitment
- **Issue Response**: Dentro de las 48 horas para problemas reportados
- **Feature Requests**: Evaluación dentro de una semana
- **Community Contributions**: Revisión dentro de una semana
- **Security Issues**: Prioridad inmediata con respuesta acelerada

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Revisiones mensuales: exactitud del contenido y validación de enlaces
- **Quarterly Updates**: Adiciones e mejoras de contenido importantes
- **Semi-Annual Reviews**: Reestructuración y mejoras completas
- **Annual Releases**: Versiones mayores con mejoras significativas

### Monitoring and Quality Assurance
- **Automated Testing**: Validación regular de ejemplos de código y enlaces
- **Community Feedback Integration**: Incorporación regular de sugerencias de usuarios
- **Technology Updates**: Alineación con los últimos servicios de Azure y las versiones de azd
- **Accessibility Audits**: Revisión regular de principios de diseño inclusivo

## Version Support Policy

### Current Version Support
- **Latest Major Version**: Soporte completo con actualizaciones regulares
- **Previous Major Version**: Actualizaciones de seguridad y correcciones críticas durante 12 meses
- **Legacy Versions**: Solo soporte comunitario, sin actualizaciones oficiales

### Migration Guidance
Cuando se publican versiones principales, proporcionamos:
- **Migration Guides**: Guías de migración paso a paso
- **Compatibility Notes**: Detalles sobre cambios incompatibles
- **Tool Support**: Scripts o utilidades para ayudar con la migración
- **Community Support**: Foros dedicados para preguntas sobre migración

---

**Navigation**
- **Previous Lesson**: [Guía de estudio](resources/study-guide.md)
- **Next Lesson**: Volver a [README principal](README.md)

**Stay Updated**: Vigila este repositorio para recibir notificaciones sobre nuevas versiones y actualizaciones importantes de los materiales de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->