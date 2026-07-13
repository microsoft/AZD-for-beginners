# Registro de cambios - AZD Para Principiantes

## Introducción

Este registro de cambios documenta todos los cambios, actualizaciones y mejoras notables en el repositorio AZD Para Principiantes. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de aprendizaje

Al revisar este registro de cambios, usted:
- Se mantendrá informado sobre nuevas características y adiciones de contenido
- Entenderá las mejoras realizadas en la documentación existente
- Podrá rastrear correcciones de errores para garantizar la precisión
- Seguirá la evolución de los materiales de aprendizaje a lo largo del tiempo

## Resultados del aprendizaje

Después de revisar las entradas del registro de cambios, podrá:
- Identificar nuevos contenidos y recursos disponibles para el aprendizaje
- Entender qué secciones han sido actualizadas o mejoradas
- Planear su ruta de aprendizaje basada en los materiales más actuales
- Contribuir con comentarios y sugerencias para futuras mejoras

## Historia de versiones

### [v3.23.0] - 2026-07-13

#### Actualización AZD 1.27.1: Actualización de versión vigente
**Esta versión revalida el curso contra `azd` `1.27.1` (julio 2026, última versión estable) y la extensión preview actual del agente AI `azure.ai.agents` `1.0.0-beta.5`, actualizando cada banner "validado contra" después de los lanzamientos 1.26.0, 1.27.0 y 1.27.1.**

#### Cambiado
- **✅ Línea base de validación actualizada** de `azd 1.25.6` (junio 2026) a `azd 1.27.1` (julio 2026) en el README raíz, todos los README de capítulos, la lección de dev-container del Capítulo 1 (incluidos ejemplos con versión fijada), la lección de plantillas personalizadas del Capítulo 4, la lección de multi-agentes del Capítulo 5 y la documentación del taller
- **🤖 Línea base del Capítulo 2 actualizada** de `azd 1.23.12` (marzo 2026) a `azd 1.27.1` en `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` y `microsoft-foundry-integration.md`; fechas en notas de validación actualizadas al 2026-07-13
- **🧩 Extensión de agentes AI actualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` a la versión actual `1.0.0-beta.5` en el README y `agents.md` del Capítulo 2
- **🧪 Ejemplo de validación en taller** (salida de `azd version`) actualizado a `1.27.1`

#### Notas sobre lanzamientos relevantes de azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Soporte Go para Azure Functions sobre Flex Consumption, filtros de suscripción por inquilino en `azd config sub-filter`, paquetes de extensiones autocontenidos (`azd x pack --bundle`) y `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modelado directo de proyectos/agentes Azure AI Foundry en `azure.yaml` (inicialización sin Bicep/Terraform), soporte de despliegue en contenedor para App Service (`host: appservice` + `language: docker`), opción directa `-s/--source` para comandos `azd extension` y `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` para `azd extension install`, modelos desaprobados excluidos por defecto de mensajes de catálogo/cuota y varias correcciones de errores

#### Archivos actualizados
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Completar huecos para principiantes #2: Creación de plantillas, dev containers, Pulumi, Azure DevOps, Principales de servicio y más
**Esta versión cierra los huecos intermedios restantes detectados por el análisis de cobertura azd: cómo crear y publicar su propia plantilla, entornos reproducibles con dev containers/Codespaces, el proveedor de infraestructura Pulumi, un recorrido por Azure DevOps CI/CD, autenticación con principal de servicio, guía de selección de host (AKS/Spring Apps), explicaciones de `azd restore` / `azd package`, manejo de errores en hooks y prácticas de equipo/entorno compartido.**

#### Añadido
- **🧱 Nueva lección del Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — creación de su propia plantilla azd: estructura requerida (`azure.yaml`, `infra/`, `src/`), el campo `metadata.template`, parametrización de la infraestructura con el token de recurso `uniqueString()` y la etiqueta `azd-env-name`, pruebas locales con `azd init --template <local-path>`, publicación en GitHub y envío a la galería Awesome AZD
- **📦 Nueva lección del Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — entornos azd reproducibles con Dev Containers y GitHub Codespaces: un `.devcontainer/devcontainer.json` mínimo que utiliza la característica oficial `ghcr.io/azure/azure-dev/azd`, características específicas para lenguajes, `docker-in-docker` para hosts de contenedor y `azd auth login --use-device-code` para inicio de sesión remoto
- **🧩 Pulumi con azd** sección en `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, organización de carpetas Pulumi, stacks mapeados a entornos azd, salidas/re-etiquetado requeridos y el mismo flujo de trabajo `azd up` / `azd down`
- **🎯 Guía de selección de host** en `docs/chapter-04-infrastructure/provisioning.md` — comparación amigable para principiantes de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` y `springapp`, con orientación sobre cuándo elegir AKS o Azure Spring Apps
- **🛠️ Recorrido por Azure DevOps CI/CD** en `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexión de servicio con federación de identidad de carga de trabajo (OIDC), el `azure-dev.yml` generado y configuración del grupo de variables
- **🔑 Principales de servicio (Patrón 4)** añadido a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` no interactivo con secreto de cliente vs. credenciales federadas/OIDC, cuándo usar y almacenamiento seguro de credenciales
- **🪝 Manejo de errores en hooks** subsección en `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de salida y `set -e`, `continueOnError`, prueba de hooks de forma aislada con `azd hooks run`, shells específicos del SO y `--debug`
- **👥 Equipo / entornos compartidos** sección en `docs/chapter-03-configuration/configuration.md` — qué vive en `.azure/`, qué ignorar en git, entornos por desarrollador, `azd env list`/`select` y suministro de valores para entornos en CI/CD
- **🧰 Explicaciones de `azd restore` y ampliación de `azd package`** en `resources/cheat-sheet.md` — restauración de dependencias y creación de artefacto desplegable sin desplegar

#### Cambiado
- **🧭 Tabla de lecciones del Capítulo 4** actualizada para incluir la nueva lección "Creación de tu propia plantilla" (Lección 3)
- **🧭 Tabla de lecciones del Capítulo 1** actualizada para incluir la nueva lección "Dev Containers y Codespaces" (Lección 5); pies de navegación enlazados entre `bring-your-own-app.md` y `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Completar huecos para principiantes: Lección práctica de multi-agentes, "Trae tu propia app", Terraform y recorrido de CI/CD
**Esta versión cierra las mayores brechas para una guía completa para principiantes añadiendo dos nuevas lecciones prácticas (un recorrido desplegable multi-agente y la incorporación de azd a una app existente), una introducción amigable a hooks, una sección Terraform con azd, un recorrido paso a paso por pipeline de GitHub Actions, una explicación para las nuevas extensiones preview y una lista explícita de verificación para la validación del despliegue.**

#### Añadido
- **🤝 Nueva lección Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un recorrido completamente práctico y desplegable con dos agentes (orquestador + especialistas) usando una plantilla real (`contoso-creative-writer`), cubriendo cuándo usar multi-agente, el flujo de trabajo `azd up`, comprensión de recursos desplegados, trazabilidad entre agentes, personalización y limpieza
- **📦 Nueva lección Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cómo agregar azd a un proyecto existente con `azd init` ("usar código en el directorio actual"), comprensión de `azure.yaml` e `infra/`, `azd infra generate`, detección de host y despliegue con `azd up`
- **🌐 Sección Terraform con azd** añadida a `docs/chapter-04-infrastructure/provisioning.md` — configuración `infra.provider: terraform`, organización de carpetas `.tf`, salidas `AZURE_*` y etiquetado `azd-env-name` necesarios, y flujo de trabajo idéntico `azd up` / `azd down` (cierra la brecha donde se afirmaba soporte Terraform pero solo se mostraba Bicep)
- **⚙️ Recorrido paso a paso GitHub Actions** en `docs/chapter-08-production/production-ai-practices.md` — desde repositorio GitHub a despliegues automatizados: `azd pipeline config`, credenciales federadas OIDC (sin secretos almacenados), el `azure-dev.yml` generado y guía sobre secretos vs variables
- **🪝 Introducción para principiantes "¿Nuevo en hooks?"** en `docs/chapter-04-infrastructure/deployment-guide.md` — qué es un hook, tabla de etapas de hook, un primer hook mínimo y ejecución manual de hooks con `azd hooks run`
- **✅ Lista de verificación "Verifica tu despliegue"** añadida al Paso 5 de `docs/chapter-01-foundation/first-project.md` — prueba rápida, comprobación del endpoint de salud y criterios explícitos de éxito
- **🧩 Explicación de nuevas extensiones preview** `azure.ai.skills` y `azure.ai.connections` (qué son y cuándo usarlas) en `docs/chapter-08-production/production-ai-practices.md`

#### Cambiado
- **🧭 Tabla de lecciones del Capítulo 5** corregida: `multi-agent-basics.md` es ahora la Lección 1 (la única lección completamente práctica), con etiquetado claro que la Lección 2 está en el Capítulo 6 y el escenario Retail es un plano arquitectónico, no una plantilla de un solo comando
- **🧭 Tabla de lecciones del Capítulo 1** ahora incluye la nueva lección "Trae tu propia app" (Lección 4)
- **🔗 Pies de navegación** actualizados: `first-project.md` ahora enlaza adelante a `bring-your-own-app.md`

#### Corregido
- **🧱 Cerrada la brecha de Terraform "anunciada pero ausente"** — el curso antes mencionaba soporte Terraform sin mostrarlo
- **🔀 Corrección de enlaces cruzados engañosos en Capítulo 5** que sugerían que existía una implementación multi-agente completa cuando solo había un plano arquitectónico

#### Archivos actualizados
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(nuevo)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(nuevo)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Actualización AZD 1.25.6, comandos completos de ciclo de vida de agentes y rebranding Aspire

**Esta versión revalida el curso con `azd` `1.25.6` (junio de 2026) y la extensión `azure.ai.agents` `0.1.40-preview`, amplía la guía de IA de "desarrollar un agente" a todo el ciclo de vida del agente (probar → evaluar → optimizar → inspeccionar → eliminar), muestra las nuevas extensiones de vista previa `azure.ai.skills` y `azure.ai.connections`, y señala el cambio de marca del producto ".NET Aspire" a "Aspire".**

#### Añadido
- **🔁 Cobertura completa del ciclo de vida del agente** para principiantes e ingenieros de IA en toda la documentación:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabla del ciclo de vida (desarrollar → probar → medir → mejorar → inspeccionar → limpiar) añadida a la sección de Extensiones y comandos de IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nueva sección "Gestión del ciclo de vida del agente" que cubre `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, y `delete --force`
  - `resources/cheat-sheet.md` — Comandos de agente de IA ampliados con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, y `delete --force`
- **🧩 Nuevas extensiones en vista previa** documentadas: `azure.ai.skills` (habilidades reutilizables de agente) y `azure.ai.connections` (conexiones Foundry) añadidas a la tabla de extensiones y la hoja de trucos
- **⏱️ Guía de tiempos de respuesta** — Los ejemplos de `azd ai agent invoke` ahora indican que imprime la latencia total y el tiempo hasta el primer byte
- **📌 Banner de versión** en el README raíz que dirige a los estudiantes a `azd version` y `azd upgrade`

#### Cambiado
- **✅ Línea base de validación actualizada** de `azd 1.23.12` (marzo de 2026) a `azd 1.25.6` (junio de 2026) en todos los README de capítulos y documentación del taller
- **🤖 Nota de extensión en el capítulo 2** actualizada de `azure.ai.agents` `0.1.18-preview` a `0.1.40-preview`
- **🧪 Ejemplo de validación del taller** (salida de `azd version`) actualizado a `1.25.6`
- **🧭 README "Qué hay de nuevo en azd hoy"** actualizado para destacar el ciclo de vida completo del agente, nuevas extensiones de IA y recientes mejoras de calidad de vida (`azd init` idempotencia, limpieza de token obsoleto en `azd auth login`, aviso de primera ejecución en `azd tool`)
- **📖 agents.md del capítulo 2 (Opción 4)** ahora dirige a los estudiantes a los comandos posteriores al despliegue en lugar de detenerse en `azd up`

#### Corregido
- **🏷️ Nomenclatura de producto** — se agregó una nota de cambio de marca para Aspire (".NET Aspire" ahora es simplemente "Aspire"); el soporte de azd para Aspire no ha cambiado
- **🔎 Validación de lanzamiento en vivo** confirmada contra el feed de versiones de Azure Developer CLI: CLI estable `1.25.6` (2026-06-12) y `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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
**Esta versión da seguimiento a la barrida de validación AZD 1.23 con una pasada de documentación enfocada en principiantes: aclara la guía de autenticación primero con AZD, añade scripts de validación de configuración local, verifica comandos clave contra la CLI AZD en vivo y elimina las últimas referencias obsoletas a comandos en inglés fuera del registro de cambios.**

#### Añadido
- **🧪 Scripts de validación de configuración para principiantes** con `validate-setup.ps1` y `validate-setup.sh` para que los estudiantes puedan confirmar las herramientas requeridas antes de comenzar el Capítulo 1
- **✅ Pasos de validación previa de configuración** en el README raíz y README del Capítulo 1 para que los prerequisitos faltantes se detecten antes de `azd up`

#### Cambiado
- **🔐 Guía de autenticación para principiantes** que ahora trata consistentemente `azd auth login` como la vía principal para los flujos de trabajo con AZD, mencionando que `az login` es opcional a menos que se usen comandos de Azure CLI directamente
- **📚 Flujo de incorporación del Capítulo 1** que ahora indica a los estudiantes validar su configuración local antes de la instalación, autenticación y primeros pasos de despliegue
- **🛠️ Mensajes del validador** que ahora separan claramente los requisitos bloqueantes de las advertencias opcionales de Azure CLI para el camino de principiantes solo con AZD
- **📖 Documentos de configuración, resolución de problemas y ejemplos** que ahora distinguen entre la autenticación requerida con AZD y el inicio de sesión opcional con Azure CLI cuando ambos se presentaban previamente sin contexto

#### Corregido
- **📋 Referencias restantes a comandos en fuente inglesa** actualizadas a las formas actuales de AZD, incluyendo `azd config show` en la hoja de trucos y `azd monitor --overview` donde se pretendía guía de visión general en Portal de Azure
- **🧭 Declaraciones para principiantes en Capítulo 1** suavizadas para evitar prometer comportamiento garantizado de cero errores o reversión en todas las plantillas y recursos de Azure
- **🔎 Validación en vivo de CLI** confirmada para soporte actual de `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` y `azd down --force --purge`

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

#### Validación AZD 1.23.12, expansión del entorno del taller y actualización del modelo de IA
**Esta versión realiza una barrida de validación de documentación contra `azd` `1.23.12`, actualiza ejemplos de comandos AZD desactualizados, refresca la guía del modelo de IA a los valores predeterminados actuales y amplía las instrucciones del taller más allá de GitHub Codespaces para soportar también contenedores de desarrollo y clones locales.**

#### Añadido
- **✅ Notas de validación en capítulos clave y documentos del taller** para hacer explícita la línea base de AZD probada para estudiantes que usan versiones más nuevas o más antiguas del CLI
- **⏱️ Guía de tiempo de espera de despliegue** para despliegues prolongados de aplicaciones de IA con `azd deploy --timeout 1800`
- **🔎 Pasos de inspección de extensiones** con `azd extension show azure.ai.agents` en documentación de flujos de trabajo de IA
- **🌐 Guía ampliada del entorno del taller** que cubre GitHub Codespaces, contenedores de desarrollo y clones locales con MkDocs

#### Cambiado
- **📚 README intro de capítulos** que ahora indica consistentemente validación contra `azd 1.23.12` en secciones de fundación, configuración, infraestructura, multi-agente, pre-despliegue, solución de problemas y producción
- **🛠️ Referencias a comandos AZD** actualizadas a formas actuales en toda la documentación:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` según el contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` donde se pretende visión general de Application Insights
- **🧪 Ejemplos de provisión en vista previa** simplificados a usos soportados actuales como `azd provision --preview` y `azd provision --preview -e production`
- **🧭 Flujo del taller** actualizado para que los estudiantes puedan completar los laboratorios en Codespaces, un contenedor dev o un clon local en lugar de asumir ejecución solo en Codespaces
- **🔐 Guía de autenticación** que ahora prefiere `azd auth login` para flujos AZD, con `az login` como opcional cuando se usan comandos Azure CLI directamente

#### Corregido
- **🪟 Comandos de instalación en Windows** normalizados al uso actual del paquete `winget` en la guía de instalación
- **🐧 Guía de instalación en Linux** corregida para evitar indicaciones disfrazadas de gestión de paquetes de `azd` específicas de distro no soportadas y en su lugar apuntar a los activos de lanzamiento donde corresponda
- **📦 Ejemplos de modelos de IA** actualizados de valores predeterminados antiguos como `gpt-35-turbo` y `text-embedding-ada-002` a ejemplos actuales como `gpt-4.1-mini`, `gpt-4.1` y `text-embedding-3-large`
- **📋 Fragmentos de despliegue y diagnóstico** corregidos para usar comandos actuales de entorno y estado en registros, scripts y pasos de solución de problemas
- **⚙️ Guía de GitHub Actions** actualizada de `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Guía de consentimiento MCP/Copilot** actualizada de `azd mcp consent` a `azd copilot consent list`

#### Mejorado
- **🧠 Guía de capítulos de IA** que ahora explica mejor el comportamiento sensible al modo de vista previa de `azd ai`, inicio de sesión específico de inquilino, uso actual de extensiones y recomendaciones actualizadas para despliegue de modelos
- **🧪 Instrucciones del taller** que ahora usan ejemplos de versiones más realistas y lenguaje de configuración de entorno más claro para laboratorios prácticos
- **📈 Documentos de producción y solución de problemas** que ahora se alinean mejor con monitoreo actual, modelo de reserva y ejemplos de niveles de costo

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

#### Comandos CLI AZD AI, validación de contenido y expansión de plantilla
**Esta versión añade cobertura de comandos `azd ai`, `azd extension` y `azd mcp` en todos los capítulos relacionados con IA, corrige enlaces rotos y código obsoleto en agents.md, actualiza la hoja de trucos y revisa la sección de Plantillas de ejemplo con descripciones validadas y nuevas plantillas AZD de Azure AI.**

#### Añadido
- **🤖 Cobertura de CLI AZD AI** en 7 archivos (anteriormente solo en el Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nueva sección "Extensiones y comandos de IA" que introduce `azd extension`, `azd ai agent init` y `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opción 4: `azd ai agent init` con tabla comparativa (enfoque plantilla vs manifiesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecciones "Extensiones AZD para Foundry" y "Despliegue primero con agente"

  - `docs/chapter-05-multi-agent/README.md` — Inicio rápido ahora muestra rutas de despliegue basadas en plantillas y manifiestos
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sección de despliegue ahora incluye opción `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsección "Comandos de Extensión AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nueva sección "Comandos de AI y Extensiones" con `azd extension`, `azd ai agent init`, `azd mcp` y `azd infra generate`
- **📦 Nuevas plantillas de ejemplo AZD AI** en `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET con Blazor WebAssembly, Semantic Kernel y soporte de chat de voz
  - **azure-search-openai-demo-java** — Chat RAG en Java usando Langchain4J con opciones de despliegue ACA/AKS
  - **contoso-creative-writer** — Aplicación de escritura creativa multiagente usando Azure AI Agent Service, Bing Grounding y Prompty
  - **serverless-chat-langchainjs** — RAG sin servidor usando Azure Functions + LangChain.js + Cosmos DB con soporte de desarrollo local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador RAG empresarial con portal de administración, integración con Teams y opciones PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicación de referencia para orquestación MCP multiagente con servidores en .NET, Python, Java y TypeScript
  - **azd-ai-starter** — Plantilla inicial mínima para infraestructura Azure AI con Bicep
  - **🔗 Enlace a la increíble galería AZD AI** — Referencia a la [galería increíble awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (más de 80 plantillas)

#### Corregido
- **🔗 Navegación en agents.md**: Enlaces Anterior/Siguiente ahora coinciden con el orden de la lección en el README del Capítulo 2 (Integración Microsoft Foundry → Agentes → Despliegue de modelo AI)
- **🔗 Enlaces rotos en agents.md**: `production-ai-practices.md` corregido a `../chapter-08-production/production-ai-practices.md` (3 ocurrencias)
- **📦 Código obsoleto en agents.md**: Reemplazado `opencensus` por `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API inválida en agents.md**: `max_tokens` movido de `create_agent()` a `create_run()` como `max_completion_tokens`
- **🔢 Conteo de tokens en agents.md**: Reemplazada la estimación aproximada `len//4` por `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Servicios corregidos de "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host predeterminado cambiado en oct 2024)
- **contoso-chat**: Actualizada descripción para hacer referencia a Azure AI Foundry + Prompty, coincidiendo con título y stack tecnológico real del repositorio

#### Eliminado
- **ai-document-processing**: Eliminada referencia a plantilla no funcional (repositorio no accesible públicamente como plantilla AZD)

#### Mejorado
- **📝 Ejercicios en agents.md**: El ejercicio 1 ahora muestra la salida esperada y el paso `azd monitor`; El ejercicio 2 incluye código completo de registro de `FunctionTool`; El ejercicio 3 reemplaza las indicaciones vagas por comandos concretos `prepdocs.py`
- **📚 Recursos en agents.md**: Actualizados enlaces de documentación a los documentos actuales del Azure AI Agent Service y guía rápida
- **📋 Tabla de pasos siguientes en agents.md**: Se agregó enlace al laboratorio del taller AI para cubrir el capítulo completo

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

#### Mejora en la navegación del curso
**Esta versión mejora la navegación del README.md de capítulos con un formato de tabla mejorado.**

#### Cambiado
- **Tabla de mapa del curso**: Mejorada con enlaces directos a lecciones, estimaciones de duración y valoraciones de complejidad
- **Limpieza de carpetas**: Eliminadas carpetas antiguas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validación de enlaces**: Verificados todos los más de 21 enlaces internos en la tabla del mapa del curso

### [v3.16.0] - 2026-02-05

#### Actualizaciones en nombres de productos
**Esta versión actualiza las referencias a productos con la marca actual de Microsoft.**

#### Cambiado
- **Microsoft Foundry → Microsoft Foundry**: Todas las referencias actualizadas en archivos que no son de traducción
- **Azure AI Agent Service → Foundry Agents**: Nombre de servicio actualizado para reflejar la marca actual

#### Archivos actualizados
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

#### Reestructuración mayor del repositorio: nombres de carpetas basados en capítulos
**Esta versión reestructura la documentación en carpetas de capítulos dedicados para una navegación más clara.**

#### Cambios en nombres de carpetas
Las carpetas antiguas han sido reemplazadas por carpetas numeradas por capítulos:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Se agregó nueva carpeta: `docs/chapter-05-multi-agent/`

#### Migración de archivos
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
| Todos los archivos de pre-despliegue | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos los archivos de resolución de problemas | troubleshooting/ | chapter-07-troubleshooting/ |

#### Añadido
- **📚 Archivos README de capítulo**: Creación de README.md en cada carpeta de capítulo con:
  - Objetivos de aprendizaje y duración
  - Tabla de lecciones con descripciones
  - Comandos de inicio rápido
  - Navegación a otros capítulos

#### Cambiado
- **🔗 Actualizados todos los enlaces internos**: Más de 78 rutas actualizadas en todos los archivos de documentación
- **🗺️ README.md principal**: Mapa del curso actualizado con nueva estructura de capítulos
- **📝 examples/README.md**: Referencias cruzadas actualizadas a carpetas de capítulos

#### Eliminado
- Estructura antigua de carpetas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestructuración del repositorio: Navegación por capítulos
**Esta versión añadió archivos README para navegación por capítulos (sucedido por v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nueva guía de agentes AI
**Esta versión añade una guía integral para desplegar agentes AI con Azure Developer CLI.**

#### Añadido
- **🤖 docs/microsoft-foundry/agents.md**: Guía completa que cubre:
  - Qué son los agentes AI y cómo se diferencian de los chatbots
  - Tres plantillas rápidas para empezar con agentes (Foundry Agents, Prompty, RAG)
  - Patrones arquitectónicos para agentes (agente único, RAG, multiagente)
  - Configuración y personalización de herramientas
  - Monitoreo y seguimiento de métricas
  - Consideraciones de costos y optimización
  - Escenarios comunes de resolución de problemas
  - Tres ejercicios prácticos con criterios de éxito

#### Estructura del contenido
- **Introducción**: Conceptos de agentes para principiantes
- **Inicio rápido**: Desplegar agentes con `azd init --template get-started-with-ai-agents`
- **Patrones arquitectónicos**: Diagramas visuales de patrones de agentes
- **Configuración**: Configuración de herramientas y variables de entorno
- **Monitoreo**: Integración con Application Insights
- **Ejercicios**: Aprendizaje práctico progresivo (20-45 minutos cada uno)

---

### [v3.12.0] - 2026-02-05

#### Actualización de entorno DevContainer
**Esta versión actualiza la configuración del contenedor de desarrollo con herramientas modernas y mejores valores predeterminados para la experiencia de aprendizaje AZD.**

#### Cambiado
- **🐳 Imagen base**: Actualizada de `python:3.12-bullseye` a `python:3.12-bookworm` (última estable de Debian)
- **📛 Nombre del contenedor**: Renombrado de "Python 3" a "AZD para principiantes" para mayor claridad

#### Añadido
- **🔧 Nuevas características del contenedor Dev**:
  - `azure-cli` con soporte para Bicep habilitado
  - `node:20` (versión LTS para plantillas AZD)
  - `github-cli` para gestión de plantillas
  - `docker-in-docker` para despliegues de aplicaciones en contenedores

- **🔌 Reenvío de puertos**: Puertos preconfigurados para desarrollo común:
  - 8000 (vista previa MkDocs)
  - 3000 (aplicaciones web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nuevas extensiones de VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense mejorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Soporte para Azure Functions
  - `ms-azuretools.vscode-docker` - Soporte Docker
  - `ms-azuretools.vscode-bicep` - Soporte para lenguaje Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestión de recursos Azure
  - `yzhang.markdown-all-in-one` - Edición Markdown
  - `DavidAnson.vscode-markdownlint` - Linter para Markdown
  - `bierner.markdown-mermaid` - Soporte para diagramas Mermaid
  - `redhat.vscode-yaml` - Soporte YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualización de Git
  - `mhutchie.git-graph` - Historial de Git

- **⚙️ Configuración en VS Code**: Añadidas configuraciones predeterminadas para intérprete Python, formateo al guardar y recorte de espacios en blanco

- **📦 requirements-dev.txt actualizado**:
  - Añadido plugin para minificar MkDocs
  - Añadido pre-commit para calidad de código
  - Añadidos paquetes SDK de Azure (azure-identity, azure-mgmt-resource)

#### Corregido
- **Comando post-creación**: Ahora verifica la instalación de AZD y Azure CLI al iniciar el contenedor

---

### [v3.11.0] - 2026-02-05

#### Revisión del README para principiantes
**Esta versión mejora significativamente el README.md para ser más accesible para principiantes y añade recursos esenciales para desarrolladores AI.**

#### Añadido
- **🆚 Comparación Azure CLI vs AZD**: Explicación clara de cuándo usar cada herramienta con ejemplos prácticos
- **🌟 Increíbles enlaces de AZD**: Enlaces directos a la galería comunitaria de plantillas y recursos para contribuir:
  - [Galería increíble AZD](https://azure.github.io/awesome-azd/) - Más de 200 plantillas listas para desplegar
  - [Enviar una plantilla](https://github.com/Azure/awesome-azd/issues) - Contribución de la comunidad
- **🎯 Guía de inicio rápido**: Sección simplificada de 3 pasos para comenzar (Instalar → Iniciar sesión → Desplegar)
- **📊 Tabla de navegación basada en experiencia**: Guía clara sobre dónde comenzar según la experiencia del desarrollador

#### Cambiado
- **Estructura del README**: Reorganizada para divulgación progresiva: primero la información clave
- **Sección de introducción**: Reescrita para explicar "La magia de `azd up`" para principiantes completos
- **Eliminado contenido duplicado**: Eliminada sección duplicada de solución de problemas
- **Comandos de solución de problemas**: Corregido el uso de `azd logs` para usar el válido `azd monitor --logs`

#### Corregido

- **🔐 Comandos de Autenticación**: Se agregaron `azd auth login` y `azd auth logout` a cheat-sheet.md
- **Referencias a Comandos Inválidos**: Se eliminaron los restos de `azd logs` en la sección de solución de problemas del README

#### Notas
- **Alcance**: Cambios aplicados al README.md principal y a resources/cheat-sheet.md
- **Público Objetivo**: Mejoras dirigidas específicamente a desarrolladores nuevos en AZD

---

### [v3.10.0] - 2026-02-05

#### Actualización de Exactitud de Comandos de Azure Developer CLI
**Esta versión corrige comandos AZD inexistentes en toda la documentación, asegurando que todos los ejemplos de código usen una sintaxis válida de Azure Developer CLI.**

#### Corregido
- **🔧 Comandos AZD Inexistentes Eliminados**: Auditoría exhaustiva y corrección de comandos inválidos:
  - `azd logs` (no existe) → reemplazado con `azd monitor --logs` o alternativas de Azure CLI
  - Subcomandos de `azd service` (no existen) → reemplazados con `azd show` y Azure CLI
  - `azd infra import/export/validate` (no existen) → eliminados o reemplazados por alternativas válidas
  - Flags `azd deploy --rollback/--incremental/--parallel/--detect-changes` (no existen) → eliminados
  - Flags `azd provision --what-if/--rollback` (no existen) → actualizados para usar `--preview`
  - `azd config validate` (no existe) → reemplazado con `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no existen) → eliminados

- **📚 Archivos Actualizados con Correcciones de Comandos**:
  - `resources/cheat-sheet.md`: Renovación mayor de referencia de comandos
  - `docs/deployment/deployment-guide.md`: Corrección de estrategias de rollback y despliegue
  - `docs/troubleshooting/debugging.md`: Corrección de secciones de análisis de logs
  - `docs/troubleshooting/common-issues.md`: Actualización de comandos para solución de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrección de sección de depuración AZD
  - `docs/getting-started/azd-basics.md`: Corrección de comandos de monitoreo
  - `docs/getting-started/first-project.md`: Actualización de ejemplos de monitoreo y depuración
  - `docs/getting-started/installation.md`: Corrección de ejemplos de ayuda y versión
  - `docs/pre-deployment/application-insights.md`: Corrección de comandos para visualizar logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrección de comandos de depuración de agentes

- **📝 Referencia de Versión Actualizada**: 
  - `docs/getting-started/installation.md`: Cambiada la versión fija `1.5.0` a genérica `1.x.x` con enlace a releases

#### Cambiado
- **Estrategias de Rollback**: Documentación actualizada para usar rollback basado en Git (AZD no tiene rollback nativo)
- **Visualización de Logs**: Reemplazadas referencias de `azd logs` con `azd monitor --logs`, `azd monitor --live`, y comandos de Azure CLI
- **Sección de Rendimiento**: Eliminadas flags de despliegue paralelo/incremental inexistentes, con alternativas válidas propuestas

#### Detalles Técnicos
- **Comandos AZD Válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flags válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Características Eliminadas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificación**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalización de Taller y Actualización de Calidad Documental
**Esta versión completa los módulos interactivos del taller, corrige todos los enlaces rotos en la documentación y mejora la calidad general del contenido para desarrolladores de IA que usan Microsoft AZD.**

#### Añadido
- **📝 CONTRIBUTING.md**: Nuevo documento con directrices de contribución:
  - Instrucciones claras para reportar problemas y proponer cambios
  - Estándares de documentación para contenido nuevo
  - Guías para ejemplos de código y convenciones en mensajes de commit
  - Información para participación comunitaria

#### Completado
- **🎯 Módulo 7 del Taller (Conclusión)**: Módulo de cierre completamente finalizado con:
  - Resumen completo de los logros del taller
  - Sección de conceptos clave dominados sobre AZD, plantillas y Microsoft Foundry
  - Recomendaciones para continuar el viaje de aprendizaje
  - Ejercicios de desafío del taller con calificación de dificultad
  - Enlaces para retroalimentación y apoyo comunitario

- **📚 Módulo 3 del Taller (Desconstrucción)**: Objetivos de aprendizaje actualizados con:
  - Guía para activar GitHub Copilot con servidores MCP
  - Comprensión de la estructura de carpetas de plantillas AZD
  - Patrones de organización de infraestructura como código (Bicep)
  - Instrucciones para laboratorio práctico

- **🔧 Módulo 6 del Taller (Desmontaje)**: Completado con:
  - Objetivos de limpieza de recursos y gestión de costos
  - Uso de `azd down` para desprovisionamiento seguro de infraestructura
  - Guía para recuperación de servicios cognitivos borrados suavemente
  - Pistas adicionales para exploración con GitHub Copilot y Azure Portal

#### Corregido
- **🔗 Corrección de Enlaces Rotos**: Resueltos más de 15 enlaces rotos internos en la documentación:
  - `docs/ai-foundry/ai-model-deployment.md`: Corrección de rutas a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrección de rutas en ai-model-deployment.md y production-ai-practices.md
  - `docs/getting-started/first-project.md`: Reemplazada cicd-integration.md no existente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrección de rutas en FAQ y guía de solución de problemas
  - `examples/container-app/microservices/README.md`: Corrección de rutas en curso home y guía de despliegue
  - `resources/faq.md` y `resources/glossary.md`: Actualización de referencias en capítulo de IA
  - `course-outline.md`: Corrección de referencias de guía del instructor y laboratorio del taller de IA

- **📅 Banner de Estado del Taller**: Actualización de "En Construcción" a estado activo con fecha febrero de 2026

- **🔗 Navegación del Taller**: Corrección de enlaces rotos en README.md del taller que apuntaban al carpeta lab-1-azd-basics inexistente

#### Cambiado
- **Presentación del Taller**: Eliminada advertencia de "en construcción", el taller ahora está completo y listo para usar
- **Consistencia en Navegación**: Asegurado que todos los módulos del taller tengan navegación adecuada entre módulos
- **Referencias de Ruta de Aprendizaje**: Actualización de referencias cruzadas de capítulos para usar rutas correctas de microsoft-foundry

#### Validado
- ✅ Todos los archivos markdown en inglés tienen enlaces internos válidos
- ✅ Módulos del taller 0-7 completos con objetivos de aprendizaje
- ✅ Navegación entre capítulos y módulos funcionando correctamente
- ✅ Contenido adecuado para desarrolladores de IA que usan Microsoft AZD
- ✅ Lenguaje y estructura amigables para principiantes mantenidos en todo el contenido
- ✅ CONTRIBUTING.md proporciona instrucciones claras para colaboradores comunitarios

#### Implementación Técnica
- **Validación de Enlaces**: Script automatizado PowerShell verificó todos los enlaces internos .md
- **Auditoría de Contenido**: Revisión manual de completitud del taller y adecuación para principiantes
- **Sistema de Navegación**: Aplicados patrones consistentes de navegación entre capítulos y módulos

#### Notas
- **Alcance**: Cambios aplicados solo a documentación en inglés
- **Traducciones**: Las carpetas de traducción no se actualizaron en esta versión (sincronización automática después)
- **Duración del Taller**: Taller completo ahora provee 3-4 horas de aprendizaje práctico

---

### [v3.8.0] - 2025-11-19

#### Documentación Avanzada: Monitoreo, Seguridad y Patrones Multi-Agente
**Esta versión añade lecciones completas de grado A sobre integración con Application Insights, patrones de autenticación y coordinación multi-agente para despliegues en producción.**

#### Añadido
- **📊 Lección de Integración de Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Despliegue enfocado en AZD con aprovisionamiento automático
  - Plantillas Bicep completas para Application Insights + Log Analytics
  - Aplicaciones Python funcionales con telemetría personalizada (más de 1,200 líneas)
  - Patrones de monitoreo AI/LLM (seguimiento de tokens/costos de Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitectura, trazado distribuido, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, dashboards, monitoreo AI)
  - Ejemplos de consultas Kusto y estrategias de optimización de costos
  - Streaming de métricas en vivo y depuración en tiempo real
  - Tiempo de aprendizaje de 40-50 minutos con patrones listos para producción

- **🔐 Lección de Patrones de Autenticación y Seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (cadenas de conexión, Key Vault, identidad administrada)
  - Plantillas completas de infraestructura Bicep para despliegues seguros
  - Código de aplicación Node.js con integración Azure SDK
  - 3 ejercicios completos (habilitar identidad administrada, identidad asignada por usuario, rotación de Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de solución de problemas y análisis de costos
  - Patrones de autenticación sin contraseña listos para producción

- **🤖 Lección de Patrones de Coordinación Multi-Agente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, basado en eventos, consenso)
  - Implementación completa de servicio orquestador (Python/Flask, más de 1,500 líneas)
  - 3 implementaciones especializadas de agentes (Investigador, Escritor, Editor)
  - Integración con Service Bus para colas de mensajes
  - Gestión de estado con Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid mostrando interacciones de agentes
  - 3 ejercicios avanzados (manejo de tiempo de espera, lógica de reintentos, disyuntor)
  - Desglose de costos ($240-565/mes) con estrategias de optimización
  - Integración con Application Insights para monitoreo

#### Mejorado
- **Capítulo de Pre-despliegue**: Ahora incluye patrones completos de monitoreo y coordinación
- **Capítulo de Primeros Pasos**: Mejorado con patrones profesionales de autenticación
- **Preparación para Producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del Curso**: Actualizado para referenciar nuevas lecciones en los Capítulos 3 y 6

#### Cambiado
- **Progresión de Aprendizaje**: Mejor integración de seguridad y monitoreo a lo largo del curso
- **Calidad de Documentación**: Estándares consistentes de grado A (95-97%) en nuevas lecciones
- **Patrones de Producción**: Cobertura completa de punta a punta para despliegues empresariales

#### Mejorado
- **Experiencia de Desarrollador**: Ruta clara de desarrollo a monitoreo en producción
- **Estándares de Seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de Trabajo AI**: Monitoreo especializado para Microsoft Foundry Models y sistemas multi-agente

#### Validado
- ✅ Todas las lecciones incluyen código completo funcional (no fragmentos)
- ✅ Diagramas Mermaid para aprendizaje visual (19 totales en 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 totales)
- ✅ Plantillas Bicep listas para producción desplegables con `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de solución de problemas y mejores prácticas
- ✅ Puntos de control de conocimiento con comandos de verificación

#### Resultados de Calificación de la Documentación
- **docs/pre-deployment/application-insights.md**: - Guía completa de monitoreo
- **docs/getting-started/authsecurity.md**: - Patrones profesionales de seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas avanzadas multi-agente
- **Contenido Nuevo General**: - Estándares de alta calidad consistentes

#### Implementación Técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazado distribuido
- **Autenticación**: Identidad Administrada + Key Vault + patrones RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Monitoreo**: Métricas en vivo + consultas Kusto + alertas + dashboards
- **Gestión de Costos**: Estrategias de muestreo, políticas de retención, controles presupuestarios

### [v3.7.0] - 2025-11-19

#### Mejoras en Calidad Documental y Nuevo Ejemplo de Microsoft Foundry Models
**Esta versión mejora la calidad documental en todo el repositorio y añade un ejemplo completo de despliegue de Microsoft Foundry Models con interfaz de chat gpt-4.1.**

#### Añadido
- **🤖 Ejemplo de Chat Microsoft Foundry Models**: Despliegue completo gpt-4.1 con implementación funcional en `examples/azure-openai-chat/`:
  - Infraestructura completa Microsoft Foundry Models (despliegue modelo gpt-4.1)
  - Interfaz chat línea de comandos en Python con historial de conversación
  - Integración Key Vault para almacenamiento seguro de claves API
  - Seguimiento de uso de tokens y estimación de costos
  - Limitación de tasa y manejo de errores
  - README completo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, app Python, configuración)
- **📚 Ejercicios Documentales**: Añadidos ejercicios prácticos en guía de configuración:
  - Ejercicio 1: Configuración multi-entorno (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios claros de éxito y pasos de verificación
- **✅ Verificación de Despliegue**: Añadida sección de verificación en guía de despliegue:
  - Procedimientos de chequeo de salud
  - Lista de criterios de éxito
  - Resultados esperados para todos los comandos de despliegue
  - Referencia rápida para solución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad de grado A (93%):
  - Añadido azure-openai-chat en todas las secciones relevantes
  - Actualizado el conteo de ejemplos locales de 3 a 4
  - Añadido a tabla de Ejemplos de Aplicaciones AI
  - Integrado en Inicio Rápido para Usuarios Intermedios
  - Añadido a sección de Plantillas Microsoft Foundry
  - Actualizadas matriz comparativa y secciones de detección tecnológica
- **Calidad Documental**: Mejorada de B+ (87%) a A- (92%) en carpeta docs:

  - Se añadieron resultados esperados a ejemplos de comandos críticos
  - Se incluyeron pasos de verificación para cambios de configuración
  - Se mejoró el aprendizaje práctico con ejercicios prácticos

#### Cambiado
- **Progresión de Aprendizaje**: Mejor integración de ejemplos de IA para aprendices intermedios
- **Estructura de la Documentación**: Más ejercicios accionables con resultados claros
- **Proceso de Verificación**: Criterios de éxito explícitos añadidos a flujos de trabajo clave

#### Mejorado
- **Experiencia del Desarrollador**: Despliegue de Microsoft Foundry Models ahora toma 35-45 minutos (vs 60-90 para alternativas complejas)
- **Transparencia de Costos**: Estimaciones claras de costos ($50-200/mes) para ejemplo Microsoft Foundry Models
- **Ruta de Aprendizaje**: Los desarrolladores de IA tienen un punto de entrada claro con azure-openai-chat
- **Estándares de Documentación**: Resultados esperados y pasos de verificación consistentes

#### Validado
- ✅ Ejemplo Microsoft Foundry Models completamente funcional con `azd up`
- ✅ Los 11 archivos de implementación son sintácticamente correctos
- ✅ Instrucciones del README coinciden con la experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ Índice de ejemplos refleja con precisión 4 ejemplos locales
- ✅ No hay enlaces externos duplicados en tablas
- ✅ Todas las referencias de navegación son correctas

#### Implementación Técnica
- **Arquitectura Microsoft Foundry Models**: patrón gpt-4.1 + Key Vault + Container Apps
- **Seguridad**: Identidad Administrada lista, secretos en Key Vault
- **Monitoreo**: Integración con Application Insights
- **Gestión de Costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Comando único `azd up` para configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización mayor: Ejemplos de despliegue de Container App
**Esta versión presenta ejemplos completos de despliegue de aplicaciones contenedorizadas listas para producción utilizando Azure Developer CLI (AZD), con documentación completa e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos de Container App**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Guía Maestra](examples/container-app/README.md): Visión completa de despliegues contenedorizados, inicio rápido, producción y patrones avanzados
  - [API Flask Simple](../../examples/container-app/simple-flask-api): API REST amigable para principiantes con escalado a cero, sondas de salud, monitoreo y solución de problemas
  - [Arquitectura Microservicios](../../examples/container-app/microservices): Despliegue multi-servicio listo para producción (API Gateway, Producto, Pedido, Usuario, Notificación), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazabilidad distribuida, despliegue blue-green/canario
- **Mejores Prácticas**: Orientación sobre seguridad, monitoreo, optimización de costos y CI/CD para cargas contenedorizadas
- **Ejemplos de Código**: `azure.yaml` completo, plantillas Bicep e implementaciones de servicios en varios lenguajes (Python, Node.js, C#, Go)
- **Pruebas y Solución de Problemas**: Escenarios de pruebas end-to-end, comandos de monitoreo, orientación para resolución de fallas

#### Cambiado
- **README.md**: Actualizado para presentar y enlazar los nuevos ejemplos de container app bajo "Ejemplos Locales - Aplicaciones Contenedorizadas"
- **examples/README.md**: Actualizado para destacar ejemplos de container app, añadir entradas en matriz comparativa y actualizar referencias de tecnología/arquitectura
- **Índice del Curso y Guía de Estudio**: Actualizado para referenciar nuevos ejemplos de container app y patrones de despliegue en capítulos relevantes

#### Validado
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y siguen las mejores prácticas
- ✅ Enlaces cruzados y navegación de documentación actualizados
- ✅ Ejemplos cubren escenarios desde principiantes hasta avanzados, incluyendo microservicios en producción

#### Notas
- **Alcance**: Documentación y ejemplos solo en inglés
- **Próximos Pasos**: Expandir con patrones avanzados de contenedores y automatización CI/CD en futuras versiones

### [v3.5.0] - 2025-11-19

#### Rebranding de Producto: Microsoft Foundry
**Esta versión implementa un cambio integral del nombre del producto de "Microsoft Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando la reorganización oficial de Microsoft.**

#### Cambiado
- **🔄 Actualización de Nombre de Producto**: Rebranding completo de "Microsoft Foundry" a "Microsoft Foundry"
  - Se actualizaron todas las referencias en la documentación en inglés dentro de la carpeta `docs/`
  - Carpeta renombrada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Archivo renombrado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referencias de contenido actualizadas en 7 archivos de documentación

- **📁 Cambios en Estructura de Carpetas**:
  - `docs/ai-foundry/` renombrada a `docs/microsoft-foundry/`
  - Se actualizaron todas las referencias cruzadas para reflejar la nueva estructura de carpetas
  - Enlaces de navegación validados en toda la documentación

- **📄 Renombramiento de Archivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos los enlaces internos actualizados para referenciar el nuevo nombre de archivo

#### Archivos Actualizados
- **Documentación de Capítulos** (7 archivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias al nombre del producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ya usa Microsoft Foundry (de actualizaciones previas)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (visión general, retroalimentación comunitaria, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces de referencia cruzada actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulos actualizados
  - `docs/getting-started/installation.md` - 2 enlaces a capítulos siguientes actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Archivos de Estructura del Curso** (2 archivos):
  - `README.md` - 17 referencias actualizadas (resumen del curso, títulos de capítulos, sección de plantillas, insights comunitarios)
  - `course-outline.md` - 14 referencias actualizadas (visión general, objetivos de aprendizaje, recursos del capítulo)

#### Validado
- ✅ No quedan referencias al camino de carpeta "ai-foundry" en documentos en inglés
- ✅ No quedan referencias al nombre del producto "Microsoft Foundry" en documentos en inglés
- ✅ Todos los enlaces de navegación funcionan con la nueva estructura de carpetas
- ✅ Renombramientos de archivos y carpetas completados exitosamente
- ✅ Referencias cruzadas entre capítulos validadas

#### Notas
- **Alcance**: Cambios aplicados solo en documentación en inglés dentro de la carpeta `docs/`
- **Traducciones**: Carpetas de traducción (`translations/`) no actualizadas en esta versión
- **Talleres**: Materiales de taller (`workshop/`) no actualizados en esta versión
- **Ejemplos**: Archivos de ejemplo pueden aún referenciar nombres legados (será abordado en futuras actualizaciones)
- **Enlaces Externos**: URLs externas y referencias al repositorio GitHub permanecen sin cambios

#### Guía de Migración para Colaboradores
Si tienes ramas locales o documentación que hacen referencia a la estructura antigua:
1. Actualiza las referencias de carpeta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualiza las referencias de archivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Sustituye el nombre del producto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valida que todos los enlaces internos de documentación funcionen correctamente

---

### [v3.4.0] - 2025-10-24

#### Mejoras en Vista Previa e Infraestructura y Validación
**Esta versión introduce soporte completo para la nueva función de vista previa Azure Developer CLI y mejora la experiencia del usuario en el taller.**

#### Añadido
- **🧪 Documentación de la función azd provision --preview**: Cobertura completa de la nueva capacidad de vista previa de infraestructura
  - Referencia de comando y ejemplos de uso en hoja de trucos
  - Integración detallada en guía de aprovisionamiento con casos de uso y beneficios
  - Integración de chequeo previo para despliegue más seguro
  - Actualizaciones en guía de inicio con prácticas de despliegue seguro
- **🚧 Banner de Estado del Taller**: Banner HTML profesional indicando estado de desarrollo del taller
  - Diseño en gradiente con indicadores de construcción para comunicación clara al usuario
  - Fecha de última actualización para transparencia
  - Diseño adaptativo a móviles para todo tipo de dispositivos

#### Mejorado
- **Seguridad de Infraestructura**: Funcionalidad de vista previa integrada en toda la documentación de despliegue
- **Validación Pre-despliegue**: Scripts automatizados ahora incluyen pruebas de vista previa de infraestructura
- **Flujo de trabajo para desarrolladores**: Secuencias de comandos actualizadas para incluir vista previa como mejor práctica
- **Experiencia en Taller**: Expectativas claras establecidas para usuarios sobre estado de contenido y desarrollo

#### Cambiado
- **Mejores Prácticas de Despliegue**: Flujo de trabajo con vista previa como enfoque recomendado
- **Flujo de Documentación**: Validación de infraestructura movida a etapa más temprana del proceso de aprendizaje
- **Presentación del Taller**: Comunicación profesional del estado con línea de tiempo clara de desarrollo

#### Mejorado
- **Enfoque de Seguridad Primero**: Cambios en infraestructura ahora validables antes del despliegue
- **Colaboración en Equipo**: Resultados de vista previa pueden compartirse para revisión y aprobación
- **Conciencia de Costos**: Mejor comprensión de costos de recursos antes del aprovisionamiento
- **Mitigación de Riesgos**: Reducción de fallas en despliegues mediante validación anticipada

#### Implementación Técnica
- **Integración Multidocumental**: Función vista previa documentada en 4 archivos clave
- **Patrones de Comandos**: Sintaxis y ejemplos consistentes en toda la documentación
- **Integración de Mejores Prácticas**: Vista previa incluida en flujos de validación y scripts
- **Indicadores Visuales**: Marcadores claros de NUEVA función para mejor descubribilidad

#### Infraestructura del Taller
- **Comunicación de Estado**: Banner HTML profesional con estilo en gradiente
- **Experiencia de Usuario**: Estado de desarrollo claro para evitar confusiones
- **Presentación Profesional**: Mantiene credibilidad del repositorio mientras establece expectativas
- **Transparencia en la Línea de Tiempo**: Fecha de última actualización octubre 2025 para responsabilidad

### [v3.3.0] - 2025-09-24

#### Material de Taller Mejorado y Experiencia de Aprendizaje Interactiva
**Esta versión presenta materiales de taller completos con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Añadido
- **🎥 Guía Interactiva para Taller**: Experiencia en navegador con capacidad de vista previa MkDocs
- **📝 Instrucciones Estructuradas para Taller**: Ruta de aprendizaje guiada en 7 pasos desde descubrimiento hasta personalización
  - 0-Introducción: Visión general del taller y configuración
  - 1-Seleccionar Plantilla IA: Descubrimiento y proceso de selección de plantilla
  - 2-Validar Plantilla IA: Procedimientos de despliegue y validación
  - 3-Deconstruir Plantilla IA: Comprensión de la arquitectura de la plantilla
  - 4-Configurar Plantilla IA: Configuración y personalización
  - 5-Personalizar Plantilla IA: Modificaciones avanzadas e iteraciones
  - 6-Demoler Infraestructura: Limpieza y gestión de recursos
  - 7-Cierre: Resumen y próximos pasos
- **🛠️ Herramientas para Taller**: Configuración de MkDocs con tema Material para mejorar experiencia de aprendizaje
- **🎯 Ruta de Aprendizaje Práctica**: Metodología en 3 pasos (Descubrimiento → Despliegue → Personalización)
- **📱 Integración con GitHub Codespaces**: Configuración fluida del entorno de desarrollo

#### Mejorado
- **Laboratorio de Taller IA**: Ampliado con experiencia estructurada completa de 2-3 horas
- **Documentación del Taller**: Presentación profesional con navegación y ayudas visuales
- **Progresión de Aprendizaje**: Guía clara paso a paso desde selección de plantilla hasta despliegue en producción
- **Experiencia del Desarrollador**: Herramientas integradas para flujos de trabajo de desarrollo más eficientes

#### Mejorado
- **Accesibilidad**: Interfaz basada en navegador con búsqueda, función de copiar y cambio de tema
- **Aprendizaje Autodidacta**: Estructura flexible que acomoda diferentes ritmos de aprendizaje
- **Aplicación Práctica**: Escenarios reales de despliegue de plantillas IA
- **Integración Comunitaria**: Integración con Discord para soporte y colaboración en el taller

#### Características del Taller
- **Búsqueda Incorporada**: Descubrimiento rápido de palabras clave y lecciones
- **Copiar Bloques de Código**: Función de copiar al pasar el cursor para todos los ejemplos de código
- **Cambio de Tema**: Soporte modo oscuro/claro para diferentes preferencias
- **Recursos Visuales**: Capturas de pantalla y diagramas para mejor comprensión
- **Integración de Ayuda**: Acceso directo a Discord para soporte comunitario

### [v3.2.0] - 2025-09-17

#### Reestructuración mayor de navegación y sistema de aprendizaje basado en capítulos
**Esta versión introduce una estructura de aprendizaje integral basada en capítulos con navegación mejorada en todo el repositorio.**

#### Añadido
- **📚 Sistema de Aprendizaje por Capítulos**: Estructuración completa del curso en 8 capítulos progresivos
  - Capítulo 1: Fundamentos y Inicio Rápido (⭐ - 30-45 minutos)
  - Capítulo 2: Desarrollo con IA como Prioridad (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuración y Autenticación (⭐⭐ - 45-60 minutos)
  - Capítulo 4: Infraestructura como Código y Despliegue (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluciones IA Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validación y Planificación Pre-Despliegue (⭐⭐ - 1 hora)
  - Capítulo 7: Resolución de Problemas y Depuración (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Patrones de Producción y Empresa (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegación Completo**: Encabezados y pies de página consistentes en toda la documentación
- **🎯 Seguimiento de Progreso**: Lista de verificación de finalización de curso y sistema de verificación de aprendizaje
- **🗺️ Guía de Ruta de Aprendizaje**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos
- **🔗 Navegación Cruzada**: Capítulos relacionados y prerrequisitos enlazados claramente

#### Mejorado
- **Estructura del README**: Transformado en plataforma de aprendizaje estructurada con organización basada en capítulos
- **Navegación de Documentación**: Cada página ahora incluye contexto de capítulo y guía de progresión
- **Organización de Plantillas**: Ejemplos y plantillas mapeados a capítulos de aprendizaje apropiados

- **Integración de Recursos**: Hojas de referencia, preguntas frecuentes y guías de estudio vinculadas a los capítulos relevantes
- **Integración de Talleres**: Laboratorios prácticos mapeados a múltiples objetivos de aprendizaje de capítulos

#### Cambios
- **Progresión de Aprendizaje**: Pasó de documentación lineal a aprendizaje flexible basado en capítulos
- **Ubicación de Configuración**: Reposicionada la guía de configuración como Capítulo 3 para un mejor flujo de aprendizaje
- **Integración de Contenido AI**: Mejor integración de contenido específico de IA a lo largo del recorrido de aprendizaje
- **Contenido de Producción**: Patrones avanzados consolidados en el Capítulo 8 para aprendices empresariales

#### Mejoras
- **Experiencia de Usuario**: Migas de pan claras y indicadores de progresión de capítulos
- **Accesibilidad**: Patrones de navegación consistentes para facilitar el recorrido del curso
- **Presentación Profesional**: Estructura de curso al estilo universitario adecuada para formación académica y corporativa
- **Eficiencia de Aprendizaje**: Reducción del tiempo para encontrar contenido relevante gracias a mejor organización

#### Implementación Técnica
- **Encabezados de Navegación**: Navegación estándar de capítulos en más de 40 archivos de documentación
- **Navegación en el Pie de Página**: Guía de progresión consistente e indicadores de finalización de capítulo
- **Enlaces Cruzados**: Sistema integral de enlaces internos conectando conceptos relacionados
- **Mapeo de Capítulos**: Plantillas y ejemplos claramente asociados con objetivos de aprendizaje

#### Mejora de la Guía de Estudio
- **📚 Objetivos de Aprendizaje Integrales**: Guía de estudio reestructurada para alinearse con sistema de 8 capítulos
- **🎯 Evaluación Basada en Capítulos**: Cada capítulo incluye objetivos específicos de aprendizaje y ejercicios prácticos
- **📋 Seguimiento de Progreso**: Calendario de aprendizaje semanal con resultados medibles y listas de verificación de finalización
- **❓ Preguntas de Evaluación**: Preguntas de validación de conocimiento para cada capítulo con resultados profesionales
- **🛠️ Ejercicios Prácticos**: Actividades prácticas con escenarios reales de despliegue y solución de problemas
- **📊 Progresión de Habilidades**: Avance claro desde conceptos básicos hasta patrones empresariales con enfoque en desarrollo profesional
- **🎓 Marco de Certificación**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario
- **⏱️ Gestión de Cronograma**: Plan de aprendizaje estructurado de 10 semanas con validación de hitos

### [v3.1.0] - 2025-09-17

#### Soluciones Avanzadas de IA Multi-Agente
**Esta versión mejora la solución multi-agente para retail con mejor denominación de agentes y documentación mejorada.**

#### Cambios
- **Terminología Multi-Agente**: Se reemplazó "agente Cora" por "agente Cliente" en toda la solución multi-agente retail para mayor claridad
- **Arquitectura de Agentes**: Actualización de toda la documentación, plantillas ARM y ejemplos de código para usar denominación consistente "agente Cliente"
- **Ejemplos de Configuración**: Modernización de patrones de configuración de agente con convenciones de nombre actualizadas
- **Consistencia en la Documentación**: Asegurado que todas las referencias usen nombres profesionales y descriptivos para agentes

#### Mejoras
- **Paquete de Plantillas ARM**: Actualizado retail-multiagent-arm-template con referencias a agente Cliente
- **Diagramas de Arquitectura**: Diagramas Mermaid actualizados con denominación de agentes
- **Ejemplos de Código**: Clases Python y ejemplos de implementación ahora usan nombres CustomerAgent
- **Variables de Entorno**: Actualizados todos los scripts de despliegue para usar convenciones CUSTOMER_AGENT_NAME

#### Mejoras
- **Experiencia del Desarrollador**: Claridad en roles y responsabilidades de agentes en la documentación
- **Preparación para Producción**: Mejor alineación con convenciones de nombres empresariales
- **Materiales de Aprendizaje**: Nombres de agentes más intuitivos para fines educativos
- **Usabilidad de Plantillas**: Comprensión simplificada de funciones de agentes y patrones de despliegue

#### Detalles Técnicos
- Diagramas Mermaid de arquitectura actualizados con referencias CustomerAgent
- Reemplazo de nombres de clase CoraAgent por CustomerAgent en ejemplos Python
- Modificaciones en configuraciones JSON de plantillas ARM para usar tipo de agente "customer"
- Actualización de variables de entorno de CORA_AGENT_* a CUSTOMER_AGENT_*
- Actualización de todos los comandos de despliegue y configuraciones de contenedores

### [v3.0.0] - 2025-09-12

#### Cambios Importantes - Enfoque en Desarrolladores de IA e Integración con Microsoft Foundry
**Esta versión transforma el repositorio en un recurso integral enfocado en IA con integración de Microsoft Foundry.**

#### Añadidos
- **🤖 Ruta de Aprendizaje AI-First**: Reestructuración completa priorizando desarrolladores e ingenieros de IA
- **Guía de Integración Microsoft Foundry**: Documentación completa para conectar AZD con servicios Microsoft Foundry
- **Patrones de Despliegue de Modelos AI**: Guía detallada cubriendo selección, configuración y estrategias de despliegue en producción
- **Taller AI**: Taller práctico de 2-3 horas para convertir aplicaciones AI en soluciones desplegables con AZD
- **Buenas Prácticas de Producción AI**: Patrones listos para empresa para escalar, monitorear y asegurar cargas de trabajo AI
- **Guía de Solución de Problemas Específica de AI**: Solución integral para modelos Microsoft Foundry, Cognitive Services y despliegues AI
- **Galería de Plantillas AI**: Colección destacada de plantillas Microsoft Foundry con calificaciones de complejidad
- **Materiales de Taller**: Estructura completa de taller con laboratorios prácticos y materiales de referencia

#### Mejoras
- **Estructura del README**: Enfocada en desarrolladores AI con 45% de interés comunitario desde Microsoft Foundry Discord
- **Rutas de Aprendizaje**: Trayectoria dedicada para desarrolladores AI junto a caminos tradicionales para estudiantes e ingenieros DevOps
- **Recomendaciones de Plantillas**: Plantillas AI destacadas incluyendo azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart
- **Integración Comunitaria**: Soporte mejorado para comunidad Discord con canales y discusiones específicas de AI

#### Seguridad y Enfoque en Producción
- **Patrones de Identidad Administrada**: Autenticación y configuraciones de seguridad específicas de AI
- **Optimización de Costos**: Seguimiento de tokens y controles presupuestarios para cargas de trabajo AI
- **Despliegue Multi-Región**: Estrategias para despliegue global de aplicaciones AI
- **Monitoreo de Rendimiento**: Métricas específicas de AI e integración con Application Insights

#### Calidad de la Documentación
- **Estructura Lineal de Curso**: Progresión lógica desde principiantes hasta patrones avanzados de despliegue AI
- **URLs Validadas**: Todos los enlaces externos a repositorios verificados y accesibles
- **Referencia Completa**: Todos los enlaces internos de documentación validados y funcionales
- **Listo para Producción**: Patrones empresariales con ejemplos reales

### [v2.0.0] - 2025-09-09

#### Cambios Importantes - Reestructuración del Repositorio y Mejora Profesional
**Esta versión representa una revisión significativa de la estructura y presentación de contenido del repositorio.**

#### Añadidos
- **Marco de Aprendizaje Estructurado**: Todas las páginas de documentación incluyen secciones de Introducción, Metas de Aprendizaje y Resultados de Aprendizaje
- **Sistema de Navegación**: Añadidos enlaces de Lección Anterior/Siguiente en toda la documentación para progresión guiada
- **Guía de Estudio**: study-guide.md completo con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación
- **Presentación Profesional**: Eliminados todos los iconos emoji para mejor accesibilidad y apariencia profesional
- **Estructura Mejorada de Contenido**: Organización y flujo de materiales de aprendizaje mejorados

#### Cambios
- **Formato de Documentación**: Estandarización de toda la documentación con estructura consistente enfocada en aprendizaje
- **Flujo de Navegación**: Implementación de progresión lógica en todo el material de aprendizaje
- **Presentación de Contenido**: Eliminados elementos decorativos en favor de formato claro y profesional
- **Estructura de Enlaces**: Actualizados todos los enlaces internos para soportar nuevo sistema de navegación

#### Mejoras
- **Accesibilidad**: Eliminadas dependencias de emoji para mejor compatibilidad con lectores de pantalla
- **Apariencia Profesional**: Presentación limpia al estilo académico, adecuada para aprendizaje empresarial
- **Experiencia de Aprendizaje**: Enfoque estructurado con objetivos y resultados claros para cada lección
- **Organización del Contenido**: Mejor flujo lógico y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Lanzamiento Inicial - Repositorio Completo para Aprendizaje de AZD

#### Añadidos
- **Estructura Central de Documentación**
  - Serie completa de guías para empezar
  - Documentación completa de despliegue y aprovisionamiento
  - Recursos detallados para solución de problemas y depuración
  - Herramientas y procedimientos de validación pre-despliegue

- **Módulo de Introducción**
  - Conceptos básicos de AZD: Conceptos clave y terminología
  - Guía de Instalación: Instrucciones de configuración por plataforma
  - Guía de Configuración: Configuración de entorno y autenticación
  - Tutorial del Primer Proyecto: Aprendizaje práctico paso a paso

- **Módulo de Despliegue y Aprovisionamiento**
  - Guía de Despliegue: Documentación integral del flujo de trabajo
  - Guía de Aprovisionamiento: Infraestructura como Código con Bicep
  - Mejores prácticas para despliegues en producción
  - Patrones de arquitectura multi-servicio

- **Módulo de Validación Pre-Despliegue**
  - Planificación de Capacidad: Validación de disponibilidad de recursos Azure
  - Selección de SKU: Guía completa de niveles de servicio
  - Chequeos Previo al Vuelo: Scripts de validación automatizados (PowerShell y Bash)
  - Herramientas de estimación de costos y planificación presupuestal

- **Módulo de Solución de Problemas**
  - Problemas Comunes: Problemas frecuentes y soluciones
  - Guía de Depuración: Metodologías sistemáticas para solución de problemas
  - Técnicas y herramientas avanzadas de diagnóstico
  - Monitorización y optimización del rendimiento

- **Recursos y Referencias**
  - Hoja de Comandos: Referencia rápida para comandos esenciales
  - Glosario: Definiciones integrales de términos y acrónimos
  - Preguntas Frecuentes: Respuestas detalladas a dudas comunes
  - Enlaces a recursos externos y conexiones comunitarias

- **Ejemplos y Plantillas**
  - Ejemplo de Aplicación Web Simple
  - Plantilla de despliegue de Sitio Web Estático
  - Configuración de Aplicación en contenedor
  - Patrones de integración de bases de datos
  - Ejemplos de arquitectura de microservicios
  - Implementaciones de funciones serverless

#### Características
- **Soporte Multiplataforma**: Guías de instalación y configuración para Windows, macOS y Linux
- **Niveles Múltiples de Habilidad**: Contenido diseñado desde estudiantes hasta desarrolladores profesionales
- **Enfoque Práctico**: Ejemplos prácticos y escenarios reales
- **Cobertura Completa**: Desde conceptos básicos hasta patrones avanzados empresariales
- **Enfoque de Seguridad Primero**: Mejores prácticas de seguridad integradas en todo el contenido
- **Optimización de Costos**: Guía para despliegues rentables y gestión de recursos

#### Calidad de la Documentación
- **Ejemplos Detallados de Código**: Muestras de código prácticas y testeadas
- **Instrucciones Paso a Paso**: Guía clara y accionable
- **Manejo Completo de Errores**: Solución de problemas para afecciones comunes
- **Integración de Mejores Prácticas**: Estándares y recomendaciones de la industria
- **Compatibilidad de Versiones**: Actualizado con los últimos servicios de Azure y características de azd

## Mejoras Futuras Planeadas

### Versión 3.1.0 (Planeada)
#### Expansión de Plataforma AI
- **Soporte Multi-Modelo**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **Marcos de Agentes AI**: Plantillas para implementaciones LangChain, Semantic Kernel y AutoGen
- **Patrones Avanzados RAG**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidad AI**: Monitoreo mejorado para rendimiento de modelos, uso de tokens y calidad de respuesta

#### Experiencia del Desarrollador
- **Extensión VS Code**: Experiencia integrada de desarrollo AZD + Microsoft Foundry
- **Integración GitHub Copilot**: Generación asistida por IA de plantillas AZD
- **Tutoriales Interactivos**: Ejercicios de codificación prácticos con validación automatizada para escenarios AI
- **Contenido en Video**: Tutoriales suplementarios en video para aprendices visuales enfocados en despliegues AI

### Versión 4.0.0 (Planeada)
#### Patrones Empresariales AI
- **Marco de Gobernanza**: Gobernanza, cumplimiento y auditoría de modelos AI
- **AI Multiinquilino**: Patrones para servicios AI aislados para múltiples clientes
- **Despliegue AI en el Borde**: Integración con Azure IoT Edge e instancias de contenedores
- **IA en Nube Híbrida**: Patrones de despliegue multi-nube e híbridos para cargas AI

#### Funciones Avanzadas
- **Automatización de Pipelines AI**: Integración MLOps con pipelines de Azure Machine Learning
- **Seguridad Avanzada**: Patrones de confianza cero, endpoints privados y protección avanzada contra amenazas
- **Optimización de Rendimiento**: Ajuste y escalamiento avanzado para aplicaciones AI de alto rendimiento
- **Distribución Global**: Patrones de entrega de contenido y caché en el borde para aplicaciones AI

### Versión 3.0.0 (Planeada) - Suplantada por la Versión Actual
#### Adiciones Propuestas - Ahora Implementadas en v3.0.0
- ✅ **Contenido Enfocado en AI**: Integración completa con Microsoft Foundry (Completado)
- ✅ **Tutoriales Interactivos**: Taller práctico de AI (Completado)
- ✅ **Módulo Avanzado de Seguridad**: Patrones de seguridad específicos AI (Completado)
- ✅ **Optimización de Rendimiento**: Estrategias de ajuste para cargas AI (Completado)

### Versión 2.1.0 (Planeada) - Parcialmente Implementada en v3.0.0
#### Mejoras Menores - Algunas Completadas en Versión Actual
- ✅ **Ejemplos Adicionales**: Escenarios de despliegue enfocados en AI (Completado)
- ✅ **FAQ Extendida**: Preguntas y solución de problemas específicos AI (Completado)
- **Integración de Herramientas**: Guías mejoradas de integración IDE y editores
- ✅ **Expansión de Monitoreo**: Patrones de monitoreo y alertas específicos de AI (Completado)

#### Aún Planeado para Lanzamiento Futuro
- **Documentación Amigable con Móviles**: Diseño responsivo para aprendizaje móvil
- **Acceso Offline**: Paquetes de documentación descargables
- **Mejor Integración IDE**: Extensión VS Code para flujos de trabajo AZD + AI
- **Panel Comunitario**: Métricas comunitarias en tiempo real y seguimiento de contribuciones

## Contribuir al Registro de Cambios

### Reporte de Cambios
Al contribuir a este repositorio, asegúrese que las entradas del registro de cambios incluyan:

1. **Número de Versión**: Siguiendo versionado semántico (mayor.menor.parche)
2. **Fecha**: Fecha de lanzamiento o actualización en formato AAAA-MM-DD
3. **Categoría**: Añadido, Cambiado, Obsoleto, Removido, Corregido, Seguridad
4. **Descripción Clara**: Descripción concisa de lo que cambió
5. **Evaluación de Impacto**: Cómo afectarán los cambios a los usuarios existentes

### Categorías de Cambio

#### Añadido
- Nuevas características, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas adicionales, scripts o utilidades

#### Cambiado
- Modificaciones en funcionalidad o documentación existente
- Actualizaciones para mejorar claridad o precisión
- Reestructuración de contenido u organización

#### Obsoleto
- Características o enfoques que están siendo eliminados progresivamente
- Secciones de documentación programadas para removerse
- Métodos que tienen mejores alternativas

#### Removido
- Características, documentación o ejemplos que ya no son relevantes
- Información desactualizada o enfoques obsoletos
- Contenido redundante o consolidado

#### Corregido
- Correcciones de errores en documentación o código
- Resolución de problemas reportados o fallas
- Mejoras en precisión o funcionalidad


#### Seguridad
- Mejoras o correcciones relacionadas con la seguridad
- Actualizaciones de las mejores prácticas de seguridad
- Resolución de vulnerabilidades de seguridad

### Directrices de Versionado Semántico

#### Versión Mayor (X.0.0)
- Cambios importantes que requieren acción del usuario
- Reestructuración significativa del contenido u organización
- Cambios que alteran el enfoque o la metodología fundamental

#### Versión Menor (X.Y.0)
- Nuevas funcionalidades o adiciones de contenido
- Mejoras que mantienen compatibilidad hacia atrás
- Ejemplos, herramientas o recursos adicionales

#### Versión de Parche (X.Y.Z)
- Corrección de errores y rectificaciones
- Mejoras menores en contenido existente
- Aclaraciones y pequeñas mejoras

## Retroalimentación y Sugerencias de la Comunidad

Animamos activamente a la comunidad a proporcionar retroalimentación para mejorar este recurso de aprendizaje:

### Cómo Proporcionar Retroalimentación
- **GitHub Issues**: Reporta problemas o sugiere mejoras (problemas específicos de IA son bienvenidos)
- **Discord Discussions**: Comparte ideas y participa con la comunidad de Microsoft Foundry
- **Pull Requests**: Contribuye mejoras directas al contenido, especialmente plantillas y guías de IA
- **Microsoft Foundry Discord**: Participa en el canal #Azure para discusiones de AZD + IA
- **Community Forums**: Participa en discusiones más amplias de desarrolladores de Azure

### Categorías de Retroalimentación
- **Precisión de Contenido de IA**: Correcciones en la integración y despliegue de servicios IA
- **Experiencia de Aprendizaje**: Sugerencias para mejorar el flujo de aprendizaje para desarrolladores de IA
- **Contenido de IA faltante**: Solicitudes de plantillas, patrones o ejemplos adicionales de IA
- **Accesibilidad**: Mejoras para necesidades de aprendizaje diversas
- **Integración de Herramientas de IA**: Sugerencias para mejor integración del flujo de desarrollo de IA
- **Patrones de IA para Producción**: Solicitudes de patrones empresariales para despliegue de IA

### Compromiso de Respuesta
- **Respuesta a Incidencias**: Dentro de 48 horas para problemas reportados
- **Solicitudes de Funcionalidad**: Evaluación en una semana
- **Contribuciones Comunitarias**: Revisión en una semana
- **Asuntos de Seguridad**: Prioridad inmediata con respuesta acelerada

## Calendario de Mantenimiento

### Actualizaciones Regulares
- **Revisiones Mensuales**: Precisión del contenido y validación de enlaces
- **Actualizaciones Trimestrales**: Adiciones e mejoras importantes de contenido
- **Revisiones Semestrales**: Reestructuración y mejoras comprensivas
- **Versiones Anuales**: Actualizaciones de versión mayor con mejoras significativas

### Monitoreo y Aseguramiento de Calidad
- **Pruebas Automatizadas**: Validación regular de ejemplos de código y enlaces
- **Integración de Retroalimentación Comunitaria**: Incorporación regular de sugerencias de usuarios
- **Actualizaciones Tecnológicas**: Alineación con los últimos servicios de Azure y lanzamientos de azd
- **Auditorías de Accesibilidad**: Revisión regular para principios de diseño inclusivo

## Política de Soporte de Versiones

### Soporte de Versión Actual
- **Última Versión Mayor**: Soporte completo con actualizaciones regulares
- **Versión Mayor Anterior**: Actualizaciones de seguridad y correcciones críticas por 12 meses
- **Versiones Legadas**: Solo soporte comunitario, sin actualizaciones oficiales

### Guía de Migración
Cuando se lanzan versiones principales, proporcionamos:
- **Guías de Migración**: Instrucciones paso a paso para la transición
- **Notas de Compatibilidad**: Detalles sobre cambios incompatibles
- **Soporte de Herramientas**: Scripts o utilidades para facilitar la migración
- **Soporte Comunitario**: Foros dedicados a preguntas sobre migración

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](resources/study-guide.md)
- **Próxima Lección**: Regresa al [README Principal](README.md)

**Mantente Actualizado**: Sigue este repositorio para recibir notificaciones sobre nuevas versiones y actualizaciones importantes del material de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->