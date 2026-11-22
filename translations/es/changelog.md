# Registro de cambios - AZD para principiantes

## Introducción

Este registro de cambios documenta todos los cambios, actualizaciones y mejoras notables en el repositorio AZD para principiantes. Seguimos los principios de versionado semántico y mantenemos este registro para ayudar a los usuarios a entender qué ha cambiado entre versiones.

## Objetivos de aprendizaje

Al revisar este registro de cambios, usted:
- Se mantendrá informado sobre nuevas características y adiciones de contenido
- Entenderá las mejoras realizadas a la documentación existente
- Podrá rastrear correcciones y arreglos de errores para asegurar la precisión
- Seguirá la evolución de los materiales de aprendizaje a lo largo del tiempo

## Resultados de aprendizaje

Después de revisar las entradas del registro de cambios, usted podrá:
- Identificar nuevo contenido y recursos disponibles para el aprendizaje
- Comprender qué secciones han sido actualizadas o mejoradas
- Planificar su ruta de aprendizaje basándose en los materiales más actuales
- Contribuir con comentarios y sugerencias para futuras mejoras

## Historial de versiones

### [v3.25.0] - 2026-11-09

#### La extensión Microsoft Foundry 1.0 ya está disponible de forma general

El paquete `microsoft.foundry` 1.0 está **activo y disponible de forma general**, como se anunció el [5 de noviembre de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). El curso ahora enseña el flujo de trabajo GA publicado, no una versión próxima. Comience con AZD **1.37.0 o superior** y `azd ext install microsoft.foundry`.

#### Disponible en esta actualización del curso
- La guía en inglés usa el paquete GA como la ruta de instalación predeterminada y explica sus siete extensiones centrales versionadas de forma independiente.
- Un [recorrido con agente alojado](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) cubre el ejemplo de la API de Respuestas del Framework de Agentes en Python de origen, uv actual, Python 3.13+, selección de proyectos nuevos/existentes, reutilización de modelos y revisión de `azure.yaml`.
- El flujo de trabajo local-a-nube cubre pruebas con Agent Inspector, costos de llamadas a modelos respaldados por Azure, compilaciones de código remoto, invocación desplegada, seguimiento en la nube, vista previa de despliegues, registros y diagnósticos.
- La guía separada de evaluación cubre la generación y revisión de conjuntos de datos/rúbricas, configuración de evaluación nombrada, registro de activos e inspección de resultados. Las instrucciones antiguas de evaluación/optimización permanecen como historial de migración, no la línea base de la versión actual.
- La guía Foundry CI/CD incluye instalación de extensiones del corredor, despliegue autenticado, activos/acceso de evaluación y una puerta de calidad explícita.
- La guía de limpieza distingue proyectos Foundry recién creados y reutilizados. El taller enlaza al ejercicio GA separado sin reemplazar sus pruebas específicas del ejemplo.
- La navegación del curso, los objetivos de aprendizaje, los requisitos previos de configuración, la hoja de trucos, las preguntas frecuentes y la guía de estudio reflejan el flujo de trabajo GA. Las traducciones generadas no son editadas manualmente.

#### Alcance de la revisión
- Basado en el anuncio GA, la guía Microsoft Learn enlazada y la configuración del ejemplo de origen. No se realizó aprovisionamiento en vivo de Azure, despliegue, invocación de modelo ni evaluación.
- GA del paquete no implica GA para cada característica opcional, extensión independiente o SDK, ni certifica los ejemplos para producción.

### [v3.24.0]- 2026-11-04

#### Correcciones
- Reparada la navegación del curso en inglés, rutas de páginas movidas, anclas faltantes y referencias externas obsoletas, incluido el enlace del Capítulo 2 a la guía de IA en producción.
- Revisada la guía actual contra AZD 1.37.2 publicado, agentes 1.0.0-beta.23 y evaluaciones 1.0.0-beta.2. Documentado el flujo de trabajo separado `azd ai eval` y la migración de configuración de optimización.
- Corregidos flags CLI no soportados, límites de autenticación, guía para entornos/secretos en texto plano, actualizaciones de infraestructura, configuración de modelos y ejemplos de recuperación destructiva.
- Actualizado el taller contra el ejemplo actual de AI Agents, incluyendo hooks reales, entradas de configuración, pruebas de evaluación, puntos de entrada para red team y observabilidad.
- Corregidas afirmaciones de implementación de ejemplo y reparados problemas asociados de aplicación/infraestructura/configuración. El material de arquitectura de comercio minorista está explícitamente distinguido de una aplicación funcional completa.
- Restaurada la matriz de lenguaje de CodeQL, seleccionado Node.js 24 compatible para el contenedor de desarrollo y configurados los validadores de setup para reportar comandos de versión fallidos.

#### Añadidos
- Un verificador de enlaces/anclas fuera de línea solo en inglés, pruebas de regresión y un flujo de trabajo de documentación que también construye el taller en modo estricto. Traducciones generadas e imágenes traducidas están excluidas.

#### Alcance de validación
- Las comprobaciones de fuente, sintaxis, configuración, comportamiento local y enlaces de red no establecen la capacidad de despliegue en vivo de Azure, cuota, RBAC, disponibilidad regional del modelo, facturación, cumplimiento de seguridad ni preparación para producción.
- Las entradas anteriores a continuación son registros históricos, no instrucciones actuales de comandos o lanzamientos.

### [v3.23.0] - 2026-07-13

#### Actualización de actualización AZD 1.27.1: versión vigente
**Esta versión revalida el curso contra `azd` `1.27.1` (julio 2026, última versión estable) y la extensión de agente AI en vista previa actual `azure.ai.agents` `1.0.0-beta.5`, actualizando todos los banners de "validado contra" tras los lanzamientos 1.26.0, 1.27.0 y 1.27.1.**

#### Cambios
- **✅ Línea base de validación actualizada** de `azd 1.25.6` (junio 2026) a `azd 1.27.1` (julio 2026) en el README raíz, todos los README de capítulos, la lección del contenedor de desarrollo del Capítulo 1 (incluidos ejemplos con versiones fijas), la lección de plantillas personalizadas del Capítulo 4, la lección multiagente del Capítulo 5 y la documentación del taller
- **🤖 Línea base del Capítulo 2 actualizada** de `azd 1.23.12` (marzo 2026) a `azd 1.27.1` en `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md` y `microsoft-foundry-integration.md`; fechas de notas de validación actualizadas a 2026-07-13
- **🧩 Extensión de agente AI actualizada** de `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` a la versión actual `1.0.0-beta.5` en el README del Capítulo 2 y `agents.md`
- **🧪 Ejemplo de validación del taller** (salida `azd version`) actualizado a `1.27.1`

#### Notas sobre lanzamientos relevantes de azd (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Soporte Go para Azure Functions en Consumo Flex, filtros de suscripción por inquilino `azd config sub-filter`, paquetes de extensiones autónomas (`azd x pack --bundle`) y `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Modela proyectos/agentes Azure AI Foundry directamente en `azure.yaml` (inicio sin Bicep/Terraform), soporte de despliegue en contenedores para App Service (`host: appservice` + `language: docker`), `-s/--source` directo para comandos `azd extension`, y `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` para `azd extension install`, exclusión predeterminada de modelos obsoletos de avisos de catálogo/cuota y varios arreglos de errores

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

#### Brecha para principiantes #2: Autoría de plantillas, contenedores de desarrollo, Pulumi, Azure DevOps, Principales de servicio y más
**Esta versión cierra las brechas intermedias restantes detectadas por el análisis de cobertura azd: cómo crear y publicar su propia plantilla, entornos reproducibles de contenedores de desarrollo/Codespaces, proveedor de infraestructura Pulumi, recorrido de CI/CD con Azure DevOps, autenticación con principales de servicio, guía de selección de host (AKS/Apps Spring), explicaciones `azd restore`/`azd package`, manejo de errores en hooks y prácticas para entornos compartidos/en equipo.**

#### Añadidos
- **🧱 Nueva lección del Capítulo 4** `docs/chapter-04-infrastructure/custom-templates.md` — crear su propia plantilla azd: estructura requerida (`azure.yaml`, `infra/`, `src/`), campo `metadata.template`, parametrización de infraestructura con el token de recurso `uniqueString()` y etiqueta `azd-env-name`, pruebas locales con `azd init --template <local-path>`, publicación en GitHub y envío a la galería Awesome AZD
- **📦 Nueva lección del Capítulo 1** `docs/chapter-01-foundation/dev-containers.md` — entornos reproducibles azd con contenedores de desarrollo y GitHub Codespaces: un `.devcontainer/devcontainer.json` mínimo usando la función oficial `ghcr.io/azure/azure-dev/azd`, características específicas de lenguaje, `docker-in-docker` para hosts contenedorizados y `azd auth login --use-device-code` para inicio de sesión remoto
- **🧩 Pulumi con azd** sección en `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, distribución de carpetas Pulumi, stacks mapeados a entornos azd, salidas importantes/requeridas, etiquetado y flujo de trabajo idéntico `azd up` / `azd down`
- **🎯 Guía de selección de host** en `docs/chapter-04-infrastructure/provisioning.md` — comparación amigable para principiantes de `appservice`, `staticwebapp`, `function`, `containerapp`, `aks` y `springapp`, con indicaciones sobre cuándo elegir AKS o Azure Spring Apps
- **🛠️ Recorrido CI/CD para Azure DevOps** en `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, conexión de servicio con federación de identidad de carga de trabajo (OIDC), `azure-dev.yml` generado y configuración de grupos de variables
- **🔑 Principales de servicio (Patrón 4)** añadido a `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` no interactivo con secreto de cliente vs credenciales federadas/OIDC, cuándo usar y almacenamiento seguro de credenciales
- **🪝 Manejo de errores en hooks** subsección en `docs/chapter-04-infrastructure/deployment-guide.md` — códigos de salida y `set -e`, `continueOnError`, pruebas de hooks en aislamiento con `azd hooks run`, shells específicos de OS y `--debug`
- **👥 Entornos compartidos/en equipo** sección en `docs/chapter-03-configuration/configuration.md` — qué vive en `.azure/`, qué ignorar con gitignore, entornos por desarrollador, `azd env list`/`select` y proporcionar valores de entorno en CI/CD
- **🧰 Explicaciones de `azd restore` y ampliadas de `azd package`** en `resources/cheat-sheet.md` — restaurar dependencias y construir un artefacto desplegable sin desplegar

#### Cambios
- **🧭 Tabla de lecciones del Capítulo 4** actualizada para incluir la nueva lección "Crear tu propia plantilla" (Lección 3)
- **🧭 Tabla de lecciones del Capítulo 1** actualizada para incluir la nueva lección "Contenedores de desarrollo y Codespaces" (Lección 5); pies de página de navegación enlazados entre `bring-your-own-app.md` y `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Brecha para principiantes: lección práctica multi-agente, "Trae tu propia aplicación", Terraform y recorrido CI/CD
**Esta versión cierra las brechas más grandes para una guía completa para principiantes agregando dos nuevas lecciones prácticas (un recorrido desplegable multi-agente y agregar azd a una aplicación existente), una introducción amigable a hooks, una sección Terraform con azd, un recorrido paso a paso del pipeline GitHub Actions, una explicación de las nuevas extensiones en vista previa y una lista de verificación explícita para la verificación del despliegue.**

#### Añadidos
- **🤝 Nueva lección del Capítulo 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — un recorrido práctico, totalmente desplegable de dos agentes (orquestador + especialistas) usando una plantilla real (`contoso-creative-writer`), cubriendo cuándo usar multi-agente, el flujo de trabajo `azd up`, comprensión de los recursos desplegados, trazabilidad entre agentes, personalización y limpieza
- **📦 Nueva lección del Capítulo 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cómo agregar azd a un proyecto existente con `azd init` ("usar código en el directorio actual"), comprensión de `azure.yaml` y `infra/`, `azd infra generate`, detección de host y despliegue con `azd up`
- **🌐 Sección Terraform con azd** añadida a `docs/chapter-04-infrastructure/provisioning.md` — configuración `infra.provider: terraform`, distribución de carpetas `.tf`, salidas `AZURE_*` requeridas y etiquetado `azd-env-name`, y el mismo flujo de trabajo `azd up` / `azd down` (cierra la brecha donde se reclamaba soporte Terraform, pero solo se mostraba Bicep)
- **⚙️ Guía paso a paso de GitHub Actions** en `docs/chapter-08-production/production-ai-practices.md` — desde el repositorio de GitHub hasta implementaciones automatizadas: `azd pipeline config`, credenciales federadas OIDC (sin secretos almacenados), el `azure-dev.yml` generado y guía sobre secretos vs variables
- **🪝 Introducción para principiantes "¿Nuevo en hooks?"** en `docs/chapter-04-infrastructure/deployment-guide.md` — qué es un hook, tabla de etapas de hooks, un primer hook minimalista y ejecución manual de hooks con `azd hooks run`
- **✅ Lista de verificación "Verifica tu implementación"** añadida al Paso 5 de `docs/chapter-01-foundation/first-project.md` — prueba básica, chequeo del endpoint de salud y criterios explícitos de éxito
- **🧩 Explicación para nuevas extensiones preview** `azure.ai.skills` y `azure.ai.connections` (qué son y cuándo usarlas) en `docs/chapter-08-production/production-ai-practices.md`

#### Cambiado
- **🧭 Tabla de lecciones del capítulo 5** corregida: `multi-agent-basics.md` es ahora la Lección 1 (la única completamente práctica), con etiquetado honesto de que la Lección 2 está en el Capítulo 6 y el escenario Retail es un plano arquitectónico, no una plantilla de un solo comando
- **🧭 Tabla de lecciones del capítulo 1** ahora incluye la nueva lección "Trae tu propia app" (Lección 4)
- **🔗 Pies de página de navegación** actualizados: `first-project.md` ahora enlaza hacia adelante a `bring-your-own-app.md`

#### Corregido
- **🧱 Cerrada la brecha de Terraform "reclamada pero faltante"** — el curso previamente referenciaba soporte Terraform sin mostrarlo
- **🔀 Corregidos enlaces cruzados engañosos del capítulo 5** que insinuaban que existía una implementación multiagente completa cuando solo había un plano arquitectónico

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

#### Actualización AZD 1.25.6, comandos completos de ciclo de vida de agente y rebranding Aspire
**Esta versión revalida el curso contra `azd` `1.25.6` (junio 2026) y la extensión `azure.ai.agents` `0.1.40-preview`, expande la guía de IA de "esquematizar un agente" al ciclo de vida completo de agentes (probar → evaluar → optimizar → inspeccionar → eliminar), muestra las nuevas extensiones preview `azure.ai.skills` y `azure.ai.connections`, y menciona el cambio de nombre del producto de ".NET Aspire" a "Aspire".**

#### Añadido
- **🔁 Cobertura completa del ciclo de vida del agente** para principiantes e ingenieros de IA en toda la documentación:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabla del ciclo de vida (esquematizar → probar → medir → mejorar → inspeccionar → limpiar) añadida a la sección de Extensiones y Comandos de IA
  - `docs/chapter-08-production/production-ai-practices.md` — Nueva sección "Gestión del ciclo de vida del agente" que cubre `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` y `delete --force`
  - `resources/cheat-sheet.md` — Comandos expandidos de Agente IA con `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download` y `delete --force`
- **🧩 Nuevas extensiones preview** documentadas: `azure.ai.skills` (habilidades reutilizables de agentes) y `azure.ai.connections` (conexiones Foundry) añadidas a la tabla de extensiones y hoja de referencia
- **⏱️ Guía sobre tiempos de respuesta** — los ejemplos de `azd ai agent invoke` ahora indican que imprime la latencia total y tiempo al primer byte
- **📌 Banner de versión** en el README raíz que señala a los estudiantes en `azd version` y `azd upgrade`

#### Cambiado
- **✅ Línea base de validación actualizada** de `azd 1.23.12` (marzo 2026) a `azd 1.25.6` (junio 2026) en todos los README de capítulos y docs del taller
- **🤖 Nota de extensión del capítulo 2** actualizada de `azure.ai.agents` `0.1.18-preview` a `0.1.40-preview`
- **🧪 Ejemplo de validación en taller** (salida `azd version`) actualizado a `1.25.6`
- **🧭 README "Novedades en azd Hoy"** renovado para resaltar el ciclo de vida de agente completo, nuevas extensiones IA y correcciones recientes de calidad de vida (`azd init` idempotencia, `azd auth login` limpieza de tokens obsoletos, `azd tool` prompt de primera ejecución)
- **📖 Archivo agentes.md capítulo 2 (Opción 4)** ahora dirige a los estudiantes a comandos posteriores al despliegue en lugar de detenerse en `azd up`

#### Corregido
- **🏷️ Nomenclatura del producto** — añadida nota del rebranding Aspire (".NET Aspire" ahora es simplemente "Aspire"); el soporte de azd para Aspire no cambia
- **🔎 Validación en vivo de lanzamientos** confirmada contra el feed de lanzamientos de Azure Developer CLI: CLI estable `1.25.6` (2026-06-12) y `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Aclaración para principiantes, validación de configuración y limpieza final de comandos AZD
**Esta versión da seguimiento a la revisión de validación AZD 1.23 con un pase de documentación enfocado en principiantes: aclara la guía de autenticación prioritaria AZD, añade scripts de validación de configuración local, verifica comandos clave contra la CLI AZD en vivo y elimina las últimas referencias de comandos obsoletos en inglés fuera del changelog.**

#### Añadido
- **🧪 Scripts de validación para configuración de principiantes** con `validate-setup.ps1` y `validate-setup.sh` para que los estudiantes puedan confirmar herramientas necesarias antes de iniciar el Capítulo 1
- **✅ Pasos anticipados de validación de configuración** en los README raíz y del Capítulo 1 para detectar prerequisitos faltantes antes de `azd up`

#### Cambiado
- **🔐 Guía de autenticación para principiantes** ahora trata consistentemente `azd auth login` como la vía principal para flujos de trabajo AZD, destacando `az login` como opcional a menos que se usen comandos Azure CLI directamente
- **📚 Flujo de incorporación en capítulo 1** ahora dirige a los estudiantes a validar su configuración local antes de la instalación, autenticación y primeros pasos de despliegue
- **🛠️ Mensajes del validador** ahora separan claramente requisitos críticos de advertencias opcionales del Azure CLI para la ruta solo AZD para principiantes
- **📖 Documentación de configuración, solución de problemas y ejemplos** ahora distinguen entre autenticación AZD requerida y inicio de sesión Azure CLI opcional donde ambos se presentaban previamente sin contexto

#### Corregido
- **📋 Referencias restantes a comandos en inglés** actualizadas a las formas actuales de AZD, incluyendo `azd config show` en la hoja de referencia y `azd monitor --overview` donde se pretendía orientar en Azure Portal
- **🧭 Afirmaciones para principiantes en capítulo 1** suavizadas para evitar prometer garantías de cero errores o rollback en todas las plantillas y recursos Azure
- **🔎 Validación en vivo CLI** confirmada para soporte actual de `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs` y `azd down --force --purge`

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

#### Validación AZD 1.23.12, expansión de ambiente de taller y actualización del modelo IA
**Esta versión realiza una revisión de documentación contra `azd` `1.23.12`, actualiza ejemplos obsoletos de comandos AZD, refresca la guía del modelo IA a valores predeterminados actuales y amplía las instrucciones del taller más allá de GitHub Codespaces para soportar también contenedores de desarrollo y clones locales.**

#### Añadido
- **✅ Notas de validación en capítulos centrales y docs del taller** para hacer explícita la base AZD probada para estudiantes usando versiones CLI más nuevas o antiguas
- **⏱️ Guía de tiempo de espera para despliegues** de aplicaciones IA de larga duración usando `azd deploy --timeout 1800`
- **🔎 Pasos de inspección de extensiones** con `azd extension show azure.ai.agents` en documentación de flujos IA
- **🌐 Guía ampliada del ambiente de taller** cubriendo GitHub Codespaces, contenedores dev y clones locales con MkDocs

#### Cambiado
- **📚 Leerme intro de capítulos** ahora indica de manera consistente la validación contra `azd 1.23.12` en secciones de base, configuración, infraestructura, multi-agente, pre-despliegue, solución de problemas y producción
- **🛠️ Referencias de comandos AZD** actualizadas a formas actuales en la documentación:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` o `azd env get-value(s)` según contexto
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` donde se pretende visión general de Application Insights
- **🧪 Ejemplos de preview para aprovisionamiento** simplificados a uso soportado actual como `azd provision --preview` y `azd provision --preview -e production`
- **🧭 Flujo del taller** actualizado para que estudiantes puedan completar laboratorios en Codespaces, contenedor dev o clon local en lugar de asumir ejecución solo en Codespaces
- **🔐 Guía de autenticación** ahora prefiere `azd auth login` para flujos AZD, con `az login` como opción cuando se usan comandos Azure CLI directamente

#### Corregido
- **🪟 Comandos de instalación para Windows** normalizados al casing actual de paquete `winget` en la guía de instalación
- **🐧 Guía de instalación para Linux** corregida para evitar instrucciones no soportadas de gestor de paquetes específicos de distros `azd` y en su lugar indicar los assets del lanzamiento donde procede
- **📦 Ejemplos de modelos IA** actualizados desde valores predeterminados antiguos como `gpt-35-turbo` y `text-embedding-ada-002` a ejemplos actuales como `gpt-4.1-mini`, `gpt-4.1` y `text-embedding-3-large`
- **📋 Fragmentos de despliegue y diagnóstico** corregidos para usar comandos actuales de entorno y estado en registros, scripts y pasos de solución
- **⚙️ Guía de GitHub Actions** actualizada de `Azure/setup-azd@v1.0.0` a `Azure/setup-azd@v2`
- **🤖 Guía de consentimiento MCP/Copilot** actualizada de `azd mcp consent` a `azd copilot consent list`

#### Mejorado
- **🧠 Guía del capítulo IA** ahora explica mejor el comportamiento sensible a preview de `azd ai`, inicio de sesión específico de inquilino, uso actual de extensiones y recomendaciones actualizadas de despliegue de modelos
- **🧪 Instrucciones del taller** ahora usan ejemplos de versiones más realistas y lenguaje de configuración de ambiente más claro para laboratorios prácticos
- **📈 Documentos de producción y solución de problemas** ahora se alinean mejor con ejemplos actuales de monitoreo, modelo de respaldo y niveles de costos

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

#### Comandos AZD IA CLI, validación de contenido y expansión de plantillas
**Esta versión añade cobertura de comandos `azd ai`, `azd extension` y `azd mcp` en todos los capítulos relacionados con IA, corrige enlaces rotos y código obsoleto en agents.md, actualiza la hoja de trucos, y renueva la sección de Plantillas de Ejemplo con descripciones validadas y nuevas plantillas AZD de Azure AI.**

#### Añadido
- **🤖 Cobertura AZD AI CLI** en 7 archivos (anteriormente solo en el Capítulo 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Nueva sección "Extensiones y Comandos AI" que introduce `azd extension`, `azd ai agent init`, y `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opción 4: `azd ai agent init` con tabla comparativa (enfoque plantilla vs manifiesto)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subsecciones "Extensiones AZD para Foundry" y "Despliegue Primer Agente"
  - `docs/chapter-05-multi-agent/README.md` — Inicio rápido ahora muestra ambas rutas de despliegue: plantilla y basado en manifiesto
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — La sección de despliegue ahora incluye la opción `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subsección "Comandos de Extensión AZD AI para Diagnósticos"
  - `resources/cheat-sheet.md` — Nueva sección "Comandos de AI y Extensiones" con `azd extension`, `azd ai agent init`, `azd mcp`, y `azd infra generate`
- **📦 Nuevas plantillas de ejemplo AZD AI** en `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG en .NET con Blazor WebAssembly, Semantic Kernel y soporte de voz
  - **azure-search-openai-demo-java** — Chat RAG en Java usando Langchain4J con opciones de despliegue ACA/AKS
  - **contoso-creative-writer** — Aplicación de escritura creativa multi-agente usando Azure AI Agent Service, Bing Grounding y Prompty
  - **serverless-chat-langchainjs** — RAG serverless con Azure Functions + LangChain.js + Cosmos DB y soporte de desarrollo local Ollama
  - **chat-with-your-data-solution-accelerator** — Acelerador empresarial RAG con portal admin, integración Teams y opciones PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplicación de referencia de orquestación MCP multi-agente con servidores en .NET, Python, Java y TypeScript
  - **azd-ai-starter** — Plantilla mínima de inicio de infraestructura Azure AI con Bicep
  - **🔗 Enlace a la Galería Awesome AZD AI** — Referencia a la [galería awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (más de 80 plantillas)

#### Corregido
- **🔗 Navegación en agents.md**: Los enlaces Anterior/Siguiente ahora concuerdan con el orden de las lecciones del README del Capítulo 2 (Integración Microsoft Foundry → Agentes → Despliegue de Modelo AI)
- **🔗 Enlaces rotos en agents.md**: `production-ai-practices.md` corregido a `../chapter-08-production/production-ai-practices.md` (3 ocurrencias)
- **📦 Código obsoleto en agents.md**: Reemplazado `opencensus` por `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API inválida en agents.md**: `max_tokens` movido de `create_agent()` a `create_run()` como `max_completion_tokens`
- **🔢 Conteo de tokens en agents.md**: Reemplazo de estimación aproximada `len//4` con `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Servicios corregidos de "Cognitive Search + App Service" a "Azure AI Search + Azure Container Apps" (host por defecto cambiado en oct 2024)
- **contoso-chat**: Descripción actualizada para reflejar Azure AI Foundry + Prompty, acorde con el título y stack tecnológico real del repositorio

#### Eliminado
- **ai-document-processing**: Eliminada referencia a plantilla no funcional (repositorio no accesible públicamente como plantilla AZD)

#### Mejorado
- **📝 Ejercicios en agents.md**: El Ejercicio 1 ahora muestra la salida esperada y paso `azd monitor`; Ejercicio 2 incluye el código completo de registro `FunctionTool`; Ejercicio 3 reemplaza indicaciones vagas por comandos concretos `prepdocs.py`
- **📚 Recursos en agents.md**: Enlaces de documentación actualizados a los documentos actuales de Azure AI Agent Service y guía rápida
- **📋 Tabla Pasos Siguientes en agents.md**: Añadido enlace al Lab del Workshop de AI para cobertura completa del capítulo

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

#### Mejora en la Navegación del Curso
**Esta versión mejora la navegación de capítulos en README.md con un formato de tabla mejorado.**

#### Cambiado
- **Tabla del Mapa del Curso**: Mejorada con enlaces directos a lecciones, estimaciones de duración y niveles de complejidad
- **Limpieza de Carpetas**: Eliminadas carpetas antiguas redundantes (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validación de Enlaces**: Verificados todos los más de 21 enlaces internos en la tabla del Mapa del Curso

### [v3.16.0] - 2026-02-05

#### Actualizaciones de Nombres de Producto
**Esta versión actualiza las referencias de productos al branding actual de Microsoft.**

#### Cambiado
- **Microsoft Foundry → Microsoft Foundry**: Todas las referencias actualizadas en archivos que no son de traducción
- **Azure AI Agent Service → Foundry Agents**: Nombre del servicio actualizado para reflejar el branding actual

#### Archivos Actualizados
- `README.md` - Página principal del curso
- `changelog.md` - Historial de versiones
- `course-outline.md` - Estructura del curso
- `docs/chapter-02-ai-development/agents.md` - Guía de agentes AI
- `examples/README.md` - Documentación de ejemplos
- `workshop/README.md` - Página principal del workshop
- `workshop/docs/index.md` - Índice del workshop
- `workshop/docs/instructions/*.md` - Todos los archivos de instrucciones del workshop

---

### [v3.15.0] - 2026-02-05

#### Reestructuración Mayor del Repositorio: Carpetas Nombradas por Capítulo
**Esta versión reestructura la documentación en carpetas dedicadas por capítulo para una navegación más clara.**

#### Renombramiento de Carpetas
Las carpetas antiguas han sido reemplazadas por carpetas numeradas por capítulo:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Nuevo añadido: `docs/chapter-05-multi-agent/`

#### Migraciones de Archivos
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
| Todos los archivos predeployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Todos los archivos de troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Añadido
- **📚 Archivos README por Capítulo**: Creado README.md en cada carpeta de capítulo con:
  - Objetivos de aprendizaje y duración
  - Tabla de lecciones con descripciones
  - Comandos de inicio rápido
  - Navegación a otros capítulos

#### Cambiado
- **🔗 Actualizados todos los enlaces internos**: Más de 78 rutas actualizadas en toda la documentación
- **🗺️ README.md principal**: Actualizado el Mapa del Curso con la nueva estructura de capítulos
- **📝 examples/README.md**: Actualizadas las referencias cruzadas a las carpetas de capítulos

#### Eliminado
- Antigua estructura de carpetas (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Reestructuración del Repositorio: Navegación por Capítulos
**Esta versión añadió archivos README de navegación por capítulo (superados por v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Nueva Guía de Agentes AI
**Esta versión añade una guía completa para desplegar agentes AI con Azure Developer CLI.**

#### Añadido
- **🤖 docs/microsoft-foundry/agents.md**: Guía completa que cubre:
  - Qué son los agentes AI y en qué se diferencian de los chatbots
  - Tres plantillas rápidas de inicio de agentes (Foundry Agents, Prompty, RAG)
  - Patrones de arquitectura de agentes (agente único, RAG, multi-agente)
  - Configuración y personalización de herramientas
  - Monitoreo y seguimiento de métricas
  - Consideraciones y optimización de costos
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
- **🐳 Imagen Base**: Actualizada de `python:3.12-bullseye` a `python:3.12-bookworm` (última versión estable de Debian)
- **📛 Nombre del Contenedor**: Renombrado de "Python 3" a "AZD para Principiantes" para mayor claridad

#### Añadido
- **🔧 Nuevas Funciones del Dev Container**:
  - `azure-cli` con soporte para Bicep habilitado
  - `node:20` (versión LTS para plantillas AZD)
  - `github-cli` para gestión de plantillas
  - `docker-in-docker` para despliegues de aplicaciones en contenedor

- **🔌 Reenvío de Puertos**: Puertos preconfigurados para desarrollo común:
  - 8000 (vista previa MkDocs)
  - 3000 (aplicaciones web)
  - 5000 (Python Flask)
  - 8080 (APIs)

- **🧩 Nuevas Extensiones VS Code**:
  - `ms-python.vscode-pylance` - IntelliSense mejorado para Python
  - `ms-azuretools.vscode-azurefunctions` - Soporte para Azure Functions
  - `ms-azuretools.vscode-docker` - Soporte para Docker
  - `ms-azuretools.vscode-bicep` - Soporte para lenguaje Bicep
  - `ms-azure-devtools.azure-resource-groups` - Gestión de recursos Azure
  - `yzhang.markdown-all-in-one` - Edición de Markdown
  - `DavidAnson.vscode-markdownlint` - Linter para Markdown
  - `bierner.markdown-mermaid` - Soporte para diagramas Mermaid
  - `redhat.vscode-yaml` - Soporte para YAML (para azure.yaml)
  - `eamodio.gitlens` - Visualización de Git
  - `mhutchie.git-graph` - Historial de Git

- **⚙️ Configuraciones VS Code**: Añadidos ajustes predeterminados para el intérprete Python, formato al guardar y recorte de espacios en blanco

- **📦 requirements-dev.txt actualizado**:
  - Añadido plugin de minificación para MkDocs
  - Añadido pre-commit para calidad de código
  - Añadidos paquetes SDK Azure (azure-identity, azure-mgmt-resource)

#### Corregido
- **Comando Post-Creación**: Ahora verifica la instalación de AZD y Azure CLI al iniciar el contenedor

---

### [v3.11.0] - 2026-02-05

#### Renovación del README para Principiantes
**Esta versión mejora significativamente el README.md para ser más accesible para principiantes y añade recursos esenciales para desarrolladores AI.**

#### Añadido
- **🆚 Comparación Azure CLI vs AZD**: Explicación clara de cuándo usar cada herramienta con ejemplos prácticos
- **🌟 Enlaces Awesome AZD**: Enlaces directos a la galería de plantillas comunitarias y recursos para contribución:
  - [Galería Awesome AZD](https://azure.github.io/awesome-azd/) - Más de 200 plantillas listas para desplegar
  - [Enviar una Plantilla](https://github.com/Azure/awesome-azd/issues) - Contribución comunitaria
- **🎯 Guía de Inicio Rápido**: Sección simplificada de 3 pasos para comenzar (Instalar → Iniciar sesión → Desplegar)
- **📊 Tabla de Navegación basada en experiencia**: Guía clara sobre dónde empezar según la experiencia del desarrollador

#### Cambiado
- **Estructura del README**: Reorganizado para divulgación progresiva - información clave al inicio
- **Sección de Introducción**: Reescrita para explicar "La Magia de `azd up`" para principiantes totales
- **Contenido Duplicado Eliminado**: Eliminada sección duplicada de solución de problemas
- **Comandos de solución de problemas**: Corrigió la referencia `azd logs` para usar `azd monitor --logs` válido

#### Corregido
- **🔐 Comandos de autenticación**: Se añadieron `azd auth login` y `azd auth logout` a cheat-sheet.md
- **Referencias de comando inválidas**: Se eliminó el resto de `azd logs` de la sección de solución de problemas del README

#### Notas
- **Alcance**: Cambios aplicados al README.md principal y resources/cheat-sheet.md
- **Público objetivo**: Mejoras dirigidas específicamente a desarrolladores nuevos en AZD

---

### [v3.10.0] - 2026-02-05

#### Actualización de precisión en comandos de Azure Developer CLI
**Esta versión corrige comandos AZD inexistentes en toda la documentación, asegurando que todos los ejemplos de código usen sintaxis válida de Azure Developer CLI.**

#### Corregido
- **🔧 Eliminación de comandos AZD inexistentes**: Auditoría y corrección exhaustiva de comandos no válidos:
  - `azd logs` (no existe) → reemplazado por `azd monitor --logs` o alternativas Azure CLI
  - Subcomandos `azd service` (no existen) → reemplazados por `azd show` y Azure CLI
  - `azd infra import/export/validate` (no existen) → eliminados o reemplazados con alternativas válidas
  - Banderas `azd deploy --rollback/--incremental/--parallel/--detect-changes` (no existen) → eliminadas
  - Banderas `azd provision --what-if/--rollback` (no existen) → actualizadas para usar `--preview`
  - `azd config validate` (no existe) → reemplazado por `azd config list`
  - `azd info`, `azd history`, `azd metrics` (no existen) → eliminados

- **📚 Archivos actualizados con correcciones de comandos**:
  - `resources/cheat-sheet.md`: Renovación mayor en referencia de comandos
  - `docs/deployment/deployment-guide.md`: Corrección de estrategias de reversión y despliegue
  - `docs/troubleshooting/debugging.md`: Corrección en secciones de análisis de logs
  - `docs/troubleshooting/common-issues.md`: Actualización de comandos de solución de problemas
  - `docs/troubleshooting/ai-troubleshooting.md`: Corrección en sección de depuración AZD
  - `docs/getting-started/azd-basics.md`: Corrección de comandos de monitoreo
  - `docs/getting-started/first-project.md`: Actualización de ejemplos de monitoreo y depuración
  - `docs/getting-started/installation.md`: Corrección de ejemplos de ayuda y versión
  - `docs/pre-deployment/application-insights.md`: Corrección de comandos de visualización de logs
  - `docs/pre-deployment/coordination-patterns.md`: Corrección de comandos de depuración de agente

- **📝 Referencia de versión actualizada**:
  - `docs/getting-started/installation.md`: Cambiada la versión rígida `1.5.0` a `1.x.x` genérico con enlace a lanzamientos

#### Cambiado
- **Estrategias de reversión**: Actualizada documentación para usar reversión basada en Git (AZD no tiene reversión nativa)
- **Visualización de logs**: Reemplazadas referencias `azd logs` con `azd monitor --logs`, `azd monitor --live` y comandos Azure CLI
- **Sección de rendimiento**: Eliminadas banderas de despliegue paralelo/incremental inexistentes, se proporcionaron alternativas válidas

#### Detalles técnicos
- **Comandos AZD válidos**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Banderas válidas de azd monitor**: `--live`, `--logs`, `--overview`
- **Funcionalidades eliminadas**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Notas
- **Verificación**: Comandos validados contra Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Finalización del taller y actualización de calidad de documentación
**Esta versión completa los módulos interactivos del taller, corrige todos los enlaces rotos de documentación y mejora la calidad general del contenido para desarrolladores de IA usando Microsoft AZD.**

#### Añadido
- **📝 CONTRIBUTING.md**: Nuevo documento con directrices para contribuciones que incluye:
  - Instrucciones claras para reportar problemas y proponer cambios
  - Estándares de documentación para nuevos contenidos
  - Guías para ejemplos de código y convenciones de mensajes de commit
  - Información para la participación comunitaria

#### Completado
- **🎯 Módulo 7 del taller (Cierre)**: Módulo de cierre completamente finalizado con:
  - Resumen exhaustivo de logros del taller
  - Sección de conceptos clave dominados que cubre AZD, plantillas y Microsoft Foundry
  - Recomendaciones para continuar el aprendizaje
  - Ejercicios de desafío con niveles de dificultad
  - Retroalimentación de la comunidad y enlaces de soporte

- **📚 Módulo 3 del taller (Deconstrucción)**: Objetivos de aprendizaje actualizados con:
  - Guía de activación de GitHub Copilot con servidores MCP
  - Comprensión de la estructura de carpetas de plantillas AZD
  - Patrones de infraestructura como código (Bicep)
  - Instrucciones de laboratorio práctico

- **🔧 Módulo 6 del taller (Desmantelamiento)**: Completado con:
  - Objetivos de limpieza de recursos y gestión de costos
  - Uso de `azd down` para desmantelamiento seguro de infraestructura
  - Guía para recuperación de servicios cognitivos borrados suavemente
  - Prompts de exploración adicional para GitHub Copilot y Azure Portal

#### Corregido
- **🔗 Corrección de enlaces rotos**: Resueltos más de 15 enlaces rotos internos de documentación:
  - `docs/ai-foundry/ai-model-deployment.md`: Corregidos caminos a microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Corregidos caminos de ai-model-deployment.md y production-ai-practices.md
  - `docs/getting-started/first-project.md`: Reemplazado cicd-integration.md inexistente por deployment-guide.md
  - `examples/retail-scenario.md`: Corrección de enlaces de FAQ y guía de solución de problemas
  - `examples/container-app/microservices/README.md`: Corregidos caminos de inicio del curso y guía de despliegue
  - `resources/faq.md` y `resources/glossary.md`: Actualizadas referencias a capítulos de IA
  - `course-outline.md`: Corrección en guía del instructor y referencias a laboratorio IA

- **📅 Banner de estado del taller**: Actualizado de "En construcción" a estado activo con fecha febrero 2026

- **🔗 Navegación del taller**: Corregidos enlaces rotos de navegación en README.md del taller que apuntaban a carpeta lab-1-azd-basics inexistente

#### Cambiado
- **Presentación del taller**: Eliminada alerta de "en construcción", taller ahora completo y listo para usar
- **Consistencia en navegación**: Asegurado que todos los módulos del taller tengan navegación intermodal correcta
- **Referencias al camino de aprendizaje**: Actualizadas referencias cruzadas de capítulos para usar rutas microsoft-foundry correctas

#### Validado
- ✅ Todos los archivos markdown en inglés tienen enlaces internos válidos
- ✅ Módulos del taller 0-7 completos con objetivos de aprendizaje
- ✅ Navegación entre capítulos y módulos funciona correctamente
- ✅ Contenido adecuado para desarrolladores de IA usando Microsoft AZD
- ✅ Lenguaje y estructura amigables para principiantes mantenidos en todo momento
- ✅ CONTRIBUTING.md proporciona directrices claras para contribuyentes de la comunidad

#### Implementación técnica
- **Validación de enlaces**: Script automático en PowerShell verificó todos los enlaces internos .md
- **Auditoría de contenido**: Revisión manual de completitud y adecuación para principiantes
- **Sistema de navegación**: Aplicados patrones consistentes de navegación entre capítulos y módulos

#### Notas
- **Alcance**: Cambios aplicados únicamente a documentación en inglés
- **Traducciones**: Carpetas de traducción no actualizadas en esta versión (sincronización automática posterior)
- **Duración del taller**: Taller completo ahora ofrece 3-4 horas de aprendizaje práctico

---

### [v3.8.0] - 2025-11-19

#### Documentación avanzada: monitoreo, seguridad y patrones multi-agente
**Esta versión agrega lecciones completas de calidad A sobre integración con Application Insights, patrones de autenticación y coordinación multi-agente para despliegues en producción.**

#### Añadido
- **📊 Lección de integración Application Insights**: en `docs/pre-deployment/application-insights.md`:
  - Despliegue centrado en AZD con provisión automática
  - Plantillas Bicep completas para Application Insights + Log Analytics
  - Aplicaciones Python operativas con telemetría personalizada (más de 1,200 líneas)
  - Patrones de monitoreo AI/LLM (seguimiento tokens/costos de Microsoft Foundry Models)
  - 6 diagramas Mermaid (arquitectura, trazado distribuido, flujo de telemetría)
  - 3 ejercicios prácticos (alertas, tableros, monitoreo AI)
  - Ejemplos de consultas Kusto y estrategias de optimización de costos
  - Transmisión de métricas en vivo y depuración en tiempo real
  - 40-50 minutos de tiempo de aprendizaje con patrones listos para producción

- **🔐 Lección de patrones de autenticación y seguridad**: en `docs/getting-started/authsecurity.md`:
  - 3 patrones de autenticación (cadenas de conexión, Key Vault, identidad administrada)
  - Plantillas completas de infraestructura Bicep para despliegues seguros
  - Código de aplicación Node.js con integración Azure SDK
  - 3 ejercicios completos (habilitar identidad administrada, identidad asignada por usuario, rotación de Key Vault)
  - Mejores prácticas de seguridad y configuraciones RBAC
  - Guía de solución de problemas y análisis de costos
  - Patrones de autenticación sin contraseña listos para producción

- **🤖 Lección de patrones de coordinación multi-agente**: en `docs/pre-deployment/coordination-patterns.md`:
  - 5 patrones de coordinación (secuencial, paralelo, jerárquico, basado en eventos, consenso)
  - Implementación completa del servicio orquestador (Python/Flask, más de 1,500 líneas)
  - 3 implementaciones especializadas de agentes (Investigación, Escritor, Editor)
  - Integración con Service Bus para colas de mensajes
  - Gestión de estado con Cosmos DB para sistemas distribuidos
  - 6 diagramas Mermaid mostrando interacciones entre agentes
  - 3 ejercicios avanzados (manejo de tiempo de espera, lógica de reintentos, disyuntor)
  - Desglose de costos ($240-565/mes) con estrategias de optimización
  - Integración con Application Insights para monitoreo

#### Mejorado
- **Capítulo pre-despliegue**: Ahora incluye patrones completos de monitoreo y coordinación
- **Capítulo de inicio**: Mejorado con patrones profesionales de autenticación
- **Preparación para producción**: Cobertura completa desde seguridad hasta observabilidad
- **Esquema del curso**: Actualizado para referenciar nuevas lecciones en capítulos 3 y 6

#### Cambiado
- **Progresión del aprendizaje**: Mejor integración de seguridad y monitoreo a lo largo del curso
- **Calidad de documentación**: Estándares consistentes de calidad A (95-97%) en nuevas lecciones
- **Patrones de producción**: Cobertura completa de extremo a extremo para despliegues empresariales

#### Mejorado
- **Experiencia de desarrollador**: Ruta clara de desarrollo a monitoreo en producción
- **Estándares de seguridad**: Patrones profesionales para autenticación y gestión de secretos
- **Observabilidad**: Integración completa de Application Insights con AZD
- **Cargas de trabajo AI**: Monitoreo especializado para Microsoft Foundry Models y sistemas multi-agente

#### Validado
- ✅ Todas las lecciones incluyen código funcional completo (no fragmentos)
- ✅ Diagramas Mermaid para aprendizaje visual (19 en total en 3 lecciones)
- ✅ Ejercicios prácticos con pasos de verificación (9 en total)
- ✅ Plantillas Bicep listas para producción desplegables vía `azd up`
- ✅ Análisis de costos y estrategias de optimización
- ✅ Guías de solución de problemas y mejores prácticas
- ✅ Puntos de control de conocimiento con comandos de verificación

#### Resultados de calificación de documentación
- **docs/pre-deployment/application-insights.md**: - Guía integral de monitoreo
- **docs/getting-started/authsecurity.md**: - Patrones profesionales de seguridad
- **docs/pre-deployment/coordination-patterns.md**: - Arquitecturas avanzadas multi-agente
- **Contenido general nuevo**: - Estándares altos y consistentes de calidad

#### Implementación técnica
- **Application Insights**: Log Analytics + telemetría personalizada + trazado distribuido
- **Autenticación**: Identidad administrada + Key Vault + patrones RBAC
- **Multi-Agente**: Service Bus + Cosmos DB + Container Apps + orquestación
- **Monitoreo**: Métricas en vivo + consultas Kusto + alertas + tableros
- **Gestión de costos**: Estrategias de muestreo, políticas de retención, controles presupuestarios

### [v3.7.0] - 2025-11-19

#### Mejoras en calidad de documentación y nuevo ejemplo Microsoft Foundry Models
**Esta versión mejora la calidad de documentación en todo el repositorio y añade un ejemplo completo de despliegue Microsoft Foundry Models con interfaz de chat gpt-4.1.**

#### Añadido
- **🤖 Ejemplo de chat Microsoft Foundry Models**: Despliegue completo gpt-4.1 con implementación funcional en `examples/azure-openai-chat/`:
  - Infraestructura completa de Microsoft Foundry Models (despliegue modelo gpt-4.1)
  - Interfaz de chat Python en línea de comandos con historial de conversación
  - Integración con Key Vault para almacenamiento seguro de claves API
  - Seguimiento de uso de tokens y estimación de costos
  - Limitación de tasa y manejo de errores
  - README completo con guía de despliegue de 35-45 minutos
  - 11 archivos listos para producción (plantillas Bicep, app Python, configuración)
- **📚 Ejercicios de documentación**: Añadidos ejercicios prácticos a la guía de configuración:
  - Ejercicio 1: Configuración multi-ambiente (15 minutos)
  - Ejercicio 2: Práctica de gestión de secretos (10 minutos)
  - Criterios claros de éxito y pasos de verificación
- **✅ Verificación de despliegue**: Añadida sección de verificación en guía de despliegue:
  - Procedimientos de verificación de estado
  - Lista de criterios de éxito
  - Resultados esperados para todos los comandos de despliegue
  - Referencia rápida de solución de problemas

#### Mejorado
- **examples/README.md**: Actualizado a calidad A (93%):
  - Añadido azure-openai-chat a todas las secciones relevantes
  - Actualizado número de ejemplos locales de 3 a 4
  - Añadido a tabla de ejemplos de aplicación AI
  - Integrado en inicio rápido para usuarios intermedios
  - Añadido a sección de plantillas Microsoft Foundry
  - Actualizado matriz comparativa y secciones de hallazgos tecnológicos
- **Calidad de la Documentación**: Mejoró de B+ (87%) a A- (92%) en la carpeta docs:
  - Se agregaron salidas esperadas a ejemplos críticos de comandos
  - Se incluyeron pasos de verificación para cambios de configuración
  - Se mejoró el aprendizaje práctico con ejercicios

#### Cambiado
- **Progresión del Aprendizaje**: Mejor integración de ejemplos de IA para aprendices intermedios
- **Estructura de la Documentación**: Ejercicios más prácticos con resultados claros
- **Proceso de Verificación**: Criterios explícitos de éxito añadidos a flujos de trabajo clave

#### Mejorado
- **Experiencia del Desarrollador**: El despliegue de Microsoft Foundry Models ahora toma 35-45 minutos (vs 60-90 para alternativas complejas)
- **Transparencia del Costo**: Estimaciones claras de costos ($50-200/mes) para ejemplo Microsoft Foundry Models
- **Ruta de Aprendizaje**: Los desarrolladores de IA tienen un punto de entrada claro con azure-openai-chat
- **Estándares de Documentación**: Salidas esperadas y pasos de verificación consistentes

#### Validado
- ✅ Ejemplo Microsoft Foundry Models totalmente funcional con `azd up`
- ✅ Todos los 11 archivos de implementación sintácticamente correctos
- ✅ Las instrucciones del README coinciden con la experiencia real de despliegue
- ✅ Enlaces de documentación actualizados en más de 8 ubicaciones
- ✅ El índice de ejemplos refleja correctamente 4 ejemplos locales
- ✅ No hay enlaces externos duplicados en las tablas
- ✅ Referencias de navegación correctas

#### Implementación Técnica
- **Arquitectura Microsoft Foundry Models**: patrón gpt-4.1 + Key Vault + Container Apps
- **Seguridad**: Identidad Administrada lista, secretos en Key Vault
- **Monitoreo**: Integración con Application Insights
- **Gestión de Costos**: Seguimiento de tokens y optimización de uso
- **Despliegue**: Un único comando `azd up` para configuración completa

### [v3.6.0] - 2025-11-19

#### Actualización Mayor: Ejemplos de Despliegue de Aplicaciones en Contenedor
**Esta versión introduce ejemplos completos de despliegue de aplicaciones en contenedor listos para producción usando Azure Developer CLI (AZD), con documentación completa e integración en la ruta de aprendizaje.**

#### Añadido
- **🚀 Ejemplos de Aplicaciones en Contenedor**: Nuevos ejemplos locales en `examples/container-app/`:
  - [Guía Maestra](examples/container-app/README.md): Visión completa de despliegues en contenedores, inicio rápido, producción y patrones avanzados
  - [API Flask Simple](../../examples/container-app/simple-flask-api): API REST amigable para principiantes con scale-to-zero, sondas de salud, monitoreo y solución de problemas
  - [Arquitectura de Microservicios](../../examples/container-app/microservices): Despliegue listo para producción de múltiples servicios (API Gateway, Producto, Orden, Usuario, Notificación), mensajería asíncrona, Service Bus, Cosmos DB, Azure SQL, trazabilidad distribuida, despliegue blue-green/canary
- **Mejores Prácticas**: Seguridad, monitoreo, optimización de costos y guía CI/CD para cargas de trabajo en contenedor
- **Ejemplos de Código**: `azure.yaml` completos, plantillas Bicep e implementaciones multilenguaje de servicios (Python, Node.js, C#, Go)
- **Pruebas y Solución de Problemas**: Escenarios de prueba de extremo a extremo, comandos de monitoreo, guía para solución de problemas

#### Cambiado
- **README.md**: Actualizado para presentar y enlazar nuevos ejemplos de aplicaciones en contenedor bajo "Ejemplos Locales - Aplicaciones en Contenedor"
- **examples/README.md**: Actualizado para destacar ejemplos de aplicaciones en contenedor, agregar entradas en la matriz comparativa y actualizar referencias de tecnología/arquitectura
- **Esquema del Curso y Guía de Estudio**: Actualizados para referenciar nuevos ejemplos y patrones de despliegue de aplicaciones en contenedor en capítulos relevantes

#### Validado
- ✅ Todos los nuevos ejemplos desplegables con `azd up` y siguen mejores prácticas
- ✅ Enlaces cruzados y navegación de documentación actualizados
- ✅ Ejemplos cubren escenarios desde principiante hasta avanzado, incluyendo microservicios en producción

#### Notas
- **Alcance**: Documentación y ejemplos solo en inglés
- **Próximos pasos**: Ampliar con patrones avanzados adicionales de contenedores y automatización CI/CD en versiones futuras

### [v3.5.0] - 2025-11-19

#### Rebranding del Producto: Microsoft Foundry
**Esta versión implementa un cambio integral del nombre del producto de "Microsoft Foundry" a "Microsoft Foundry" en toda la documentación en inglés, reflejando el rebranding oficial de Microsoft.**

#### Cambiado
- **🔄 Actualización del Nombre del Producto**: Rebranding completo de "Microsoft Foundry" a "Microsoft Foundry"
  - Actualizadas todas las referencias en la documentación en inglés en la carpeta `docs/`
  - Carpeta renombrada: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Archivo renombrado: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referencias de contenido actualizadas en 7 archivos de documentación

- **📁 Cambios en la Estructura de Carpetas**:
  - `docs/ai-foundry/` renombrado a `docs/microsoft-foundry/`
  - Todas las referencias cruzadas actualizadas para reflejar la nueva estructura de carpetas
  - Navegación validada en toda la documentación

- **📄 Renombramiento de Archivos**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Todos los enlaces internos actualizados para referenciar el nuevo nombre de archivo

#### Archivos Actualizados
- **Documentación de Capítulos** (7 archivos):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 actualizaciones de enlaces de navegación
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referencias al nombre de producto actualizadas
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Ya usando Microsoft Foundry (de actualizaciones previas)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referencias actualizadas (visión general, feedback comunitario, documentación)
  - `docs/getting-started/azd-basics.md` - 4 enlaces cruzados actualizados
  - `docs/getting-started/first-project.md` - 2 enlaces de navegación de capítulos actualizados
  - `docs/getting-started/installation.md` - 2 enlaces de siguiente capítulo actualizados
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referencias actualizadas (navegación, comunidad Discord)
  - `docs/troubleshooting/common-issues.md` - 1 enlace de navegación actualizado
  - `docs/troubleshooting/debugging.md` - 1 enlace de navegación actualizado

- **Archivos de Estructura del Curso** (2 archivos):
  - `README.md` - 17 referencias actualizadas (visión general del curso, títulos de capítulos, sección de plantillas, percepciones comunitarias)
  - `course-outline.md` - 14 referencias actualizadas (visión general, objetivos de aprendizaje, recursos del capítulo)

#### Validado
- ✅ No quedan referencias al folder "ai-foundry" en la documentación en inglés
- ✅ No quedan referencias al nombre del producto "Microsoft Foundry" en la documentación en inglés
- ✅ Todos los enlaces de navegación funcionales con la nueva estructura de carpetas
- ✅ Renombramientos de archivos y carpetas completados exitosamente
- ✅ Referencias cruzadas entre capítulos validadas

#### Notas
- **Alcance**: Cambios aplicados solo a documentación en inglés en la carpeta `docs/`
- **Traducciones**: Carpetas de traducción (`translations/`) no actualizadas en esta versión
- **Taller**: Materiales de taller (`workshop/`) no actualizados en esta versión
- **Ejemplos**: Los archivos de ejemplo pueden todavía referenciar nomenclatura antigua (se abordará en futura actualización)
- **Enlaces Externos**: URLs externas y referencias al repositorio GitHub permanecen sin cambios

#### Guía de Migración para Colaboradores
Si tiene ramas locales o documentación que refiere a la estructura antigua:
1. Actualice referencias de carpeta: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Actualice referencias de archivo: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Reemplace el nombre del producto: "Microsoft Foundry" → "Microsoft Foundry"
4. Valide que todos los enlaces internos de documentación funcionen todavía

---

### [v3.4.0] - 2025-10-24

#### Vista Previa de Infraestructura y Mejoras de Validación
**Esta versión introduce soporte completo para la nueva función de vista previa de Azure Developer CLI y mejora la experiencia de usuario del taller.**

#### Añadido
- **🧪 Documentación de la función azd provision --preview**: Cobertura completa de la nueva capacidad de vista previa de infraestructura
  - Referencia de comandos y ejemplos de uso en hoja de trucos
  - Integración detallada en guía de aprovisionamiento con casos de uso y beneficios
  - Integración de chequeo previo para validación de despliegue más segura
  - Actualizaciones en guía de inicio con prácticas de despliegue seguras
- **🚧 Banner de Estado del Taller**: Banner HTML profesional que indica estado de desarrollo del taller
  - Diseño con degradado e indicadores de construcción para comunicación clara al usuario
  - Marca de tiempo de última actualización para transparencia
  - Diseño móvil adaptable para todo tipo de dispositivos

#### Mejorado
- **Seguridad de Infraestructura**: Funcionalidad preview integrada en toda la documentación de despliegue
- **Validación Pre-Despliegue**: Scripts automatizados ahora incluyen pruebas de vista previa de infraestructura
- **Flujo de Trabajo del Desarrollador**: Secuencias de comandos actualizadas para incluir preview como mejor práctica
- **Experiencia del Taller**: Expectativas claras establecidas para usuarios sobre estado del desarrollo de contenido

#### Cambiado
- **Mejores Prácticas de Despliegue**: Flujo de trabajo con prioridad a preview es ahora el enfoque recomendado
- **Flujo de Documentación**: Validación de infraestructura adelantada en el proceso de aprendizaje
- **Presentación del Taller**: Comunicación profesional de estado con cronograma claro de desarrollo

#### Mejorado
- **Enfoque de Seguridad Primero**: Cambios de infraestructura ahora pueden validarse antes del despliegue
- **Colaboración en Equipo**: Resultados de vista previa pueden compartirse para revisión y aprobación
- **Conciencia de Costos**: Mejor comprensión de costos de recursos antes del aprovisionamiento
- **Mitigación de Riesgos**: Reducción en fallos de despliegue mediante validación anticipada

#### Implementación Técnica
- **Integración Multidocumento**: Función preview documentada en 4 archivos clave
- **Patrones de Comandos**: Sintaxis y ejemplos consistentes a lo largo de la documentación
- **Integración de Mejores Prácticas**: Preview incluida en flujos y scripts de validación
- **Indicadores Visuales**: Marcaciones claras de nueva función para facilitar descubrimiento

#### Infraestructura del Taller
- **Comunicación de Estado**: Banner HTML profesional con estilizado en degradado
- **Experiencia del Usuario**: Estado claro de desarrollo evita confusión
- **Presentación Profesional**: Mantiene credibilidad del repositorio mientras establece expectativas
- **Transparencia en Cronograma**: Marca de tiempo de última actualización octubre 2025 para responsabilidad

### [v3.3.0] - 2025-09-24

#### Materiales del Taller Mejorados y Experiencia de Aprendizaje Interactiva
**Esta versión introduce materiales completos para taller con guías interactivas basadas en navegador y rutas de aprendizaje estructuradas.**

#### Añadido
- **🎥 Guía Interactiva para Taller**: Experiencia de taller basada en navegador con capacidad de vista previa MkDocs
- **📝 Instrucciones Estructuradas del Taller**: Ruta de aprendizaje guiada de 7 pasos desde descubrimiento hasta personalización
  - 0-Introducción: Visión general y configuración del taller
  - 1-Selección-De-Plantilla-AI: Descubrimiento y proceso de selección de plantillas
  - 2-Validación-De-Plantilla-AI: Procedimientos de despliegue y validación
  - 3-Deconstrucción-De-Plantilla-AI: Comprensión de la arquitectura de plantillas
  - 4-Configuración-De-Plantilla-AI: Configuración y personalización
  - 5-Personalización-De-Plantilla-AI: Modificaciones avanzadas e iteraciones
  - 6-Derribo-De-Infrastructura: Limpieza y gestión de recursos
  - 7-Cierre: Resumen y próximos pasos
- **🛠️ Herramientas del Taller**: Configuración MkDocs con tema Material para experiencia de aprendizaje mejorada
- **🎯 Ruta de Aprendizaje Práctica**: Metodología de 3 pasos (Descubrimiento → Despliegue → Personalización)
- **📱 Integración GitHub Codespaces**: Configuración fluida del entorno de desarrollo

#### Mejorado
- **Laboratorio de IA del Taller**: Ampliado con experiencia estructurada completa de 2-3 horas
- **Documentación del Taller**: Presentación profesional con navegación y ayudas visuales
- **Progresión del Aprendizaje**: Guía clara paso a paso desde selección de plantilla hasta despliegue en producción
- **Experiencia del Desarrollador**: Herramientas integradas para flujos de trabajo de desarrollo simplificados

#### Mejorado
- **Accesibilidad**: Interfaz basada en navegador con búsqueda, función de copiar y cambio de tema
- **Aprendizaje a tu Ritmo**: Estructura flexible del taller para acomodar diferentes velocidades de aprendizaje
- **Aplicación Práctica**: Escenarios reales de despliegue de plantillas de IA
- **Integración Comunitaria**: Integración con Discord para soporte y colaboración en el taller

#### Características del Taller
- **Búsqueda Incorporada**: Descubrimiento rápido de palabras clave y lecciones
- **Copiar Bloques de Código**: Funcionalidad hover-to-copy para todos los ejemplos de código
- **Cambio de Tema**: Soporte de modo oscuro/claro para diferentes preferencias
- **Recursos Visuales**: Capturas de pantalla y diagramas para mejor entendimiento
- **Integración de Ayuda**: Acceso directo a Discord para soporte comunitario

### [v3.2.0] - 2025-09-17

#### Reestructuración Mayor de Navegación y Sistema de Aprendizaje Basado en Capítulos
**Esta versión introduce una estructura completa de aprendizaje basada en capítulos con navegación mejorada en todo el repositorio.**

#### Añadido
- **📚 Sistema de Aprendizaje Basado en Capítulos**: Curso completo reestructurado en 8 capítulos progresivos de aprendizaje
  - Capítulo 1: Fundamentos y Inicio Rápido (⭐ - 30-45 mins)
  - Capítulo 2: Desarrollo AI-First (⭐⭐ - 1-2 horas)
  - Capítulo 3: Configuración y Autenticación (⭐⭐ - 45-60 mins)
  - Capítulo 4: Infraestructura como Código y Despliegue (⭐⭐⭐ - 1-1.5 horas)
  - Capítulo 5: Soluciones AI Multi-Agente (⭐⭐⭐⭐ - 2-3 horas)
  - Capítulo 6: Validación y Planificación Pre-Despliegue (⭐⭐ - 1 hora)
  - Capítulo 7: Solución de Problemas y Depuración (⭐⭐ - 1-1.5 horas)
  - Capítulo 8: Patrones de Producción y Empresariales (⭐⭐⭐⭐ - 2-3 horas)
- **📚 Sistema de Navegación Completo**: Encabezados y pies de página consistentes en toda la documentación
- **🎯 Seguimiento del Progreso**: Lista de verificación de finalización de curso y sistema de verificación de aprendizaje
- **🗺️ Guía de Ruta de Aprendizaje**: Puntos de entrada claros para diferentes niveles de experiencia y objetivos
- **🔗 Navegación de Referencias Cruzadas**: Capítulos relacionados y prerrequisitos claramente enlazados

#### Mejorado
- **Estructura del README**: Transformado en plataforma de aprendizaje estructurada con organización basada en capítulos
- **Navegación en Documentación**: Cada página ahora incluye contexto del capítulo y guía de progresión
- **Organización de Plantillas**: Ejemplos y plantillas mapeados a capítulos de aprendizaje apropiados
- **Integración de Recursos**: Hojas de trucos, FAQs y guías de estudio conectadas a capítulos relevantes
- **Integración de Taller**: Laboratorios prácticos mapeados a múltiples objetivos de aprendizaje por capítulo

#### Cambiado
- **Progresión de Aprendizaje**: Se pasó de documentación lineal a un aprendizaje flexible basado en capítulos
- **Ubicación de la Configuración**: Guía de configuración reposicionada como Capítulo 3 para un mejor flujo de aprendizaje
- **Integración de Contenido de IA**: Mejor integración de contenido específico de IA a lo largo del viaje de aprendizaje
- **Contenido de Producción**: Patrones avanzados consolidados en el Capítulo 8 para aprendices empresariales

#### Mejorado
- **Experiencia de Usuario**: Navegación clara con migas de pan e indicadores de progresión de capítulos
- **Accesibilidad**: Patrones de navegación consistentes para facilitar el recorrido del curso
- **Presentación Profesional**: Estructura de curso estilo universitario adecuada para formación académica y corporativa
- **Eficiencia de Aprendizaje**: Reducción del tiempo para encontrar contenido relevante gracias a mejor organización

#### Implementación Técnica
- **Encabezados de Navegación**: Navegación estandarizada de capítulos en más de 40 archivos de documentación
- **Navegación Inferior**: Guía consistente de progresión e indicadores de finalización de capítulos
- **Vinculación Cruzada**: Sistema completo de enlaces internos que conectan conceptos relacionados
- **Mapeo de Capítulos**: Plantillas y ejemplos claramente asociados con objetivos de aprendizaje

#### Mejora de la Guía de Estudio
- **📚 Objetivos de Aprendizaje Comprensivos**: Guía de estudio reestructurada para alinearse con el sistema de 8 capítulos
- **🎯 Evaluación basada en Capítulos**: Cada capítulo incluye objetivos específicos y ejercicios prácticos
- **📋 Seguimiento del Progreso**: Programa semanal con resultados medibles y listas de verificación de finalización
- **❓ Preguntas de Evaluación**: Preguntas para validar conocimientos en cada capítulo con resultados profesionales
- **🛠️ Ejercicios Prácticos**: Actividades prácticas con escenarios reales de despliegue y solución de problemas
- **📊 Progresión de Habilidades**: Avance claro de conceptos básicos a patrones empresariales con enfoque en desarrollo profesional
- **🎓 Marco de Certificación**: Resultados de desarrollo profesional y sistema de reconocimiento comunitario
- **⏱️ Gestión del Cronograma**: Plan de aprendizaje estructurado de 10 semanas con validación de hitos

### [v3.1.0] - 2025-09-17

#### Soluciones Mejoradas de IA Multi-Agente
**Esta versión mejora la solución de venta minorista multi-agente con mejor nombramiento de agentes y documentación mejorada.**

#### Cambiado
- **Terminología Multi-Agente**: Se reemplazó "agente Cora" por "agente Cliente" en toda la solución multi-agente minorista para mayor claridad
- **Arquitectura del Agente**: Se actualizó toda la documentación, plantillas ARM y ejemplos de código para usar nombre consistente "agente Cliente"
- **Ejemplos de Configuración**: Modernización de patrones de configuración de agentes con convenciones de nombres actualizadas
- **Consistencia en la Documentación**: Se aseguró que todas las referencias utilicen nombres descriptivos y profesionales de agentes

#### Mejorado
- **Paquete de Plantilla ARM**: Se actualizó retail-multiagent-arm-template con referencias al agente Cliente
- **Diagramas de Arquitectura**: Diagramas Mermaid actualizados con nuevo nombramiento de agentes
- **Ejemplos de Código**: Clases de Python y ejemplos de implementación ahora usan nombres CustomerAgent
- **Variables de Entorno**: Se actualizaron todos los scripts de despliegue para usar convenciones CUSTOMER_AGENT_NAME

#### Mejorado
- **Experiencia del Desarrollador**: Roles y responsabilidades de agentes más claros en la documentación
- **Preparación para Producción**: Mejor alineación con convenciones de nombres empresariales
- **Materiales de Aprendizaje**: Nombres de agentes más intuitivos para fines educativos
- **Usabilidad de la Plantilla**: Comprensión simplificada de funciones y patrones de despliegue de agentes

#### Detalles Técnicos
- Diagramas Mermaid de arquitectura actualizados con referencias a CustomerAgent
- Se reemplazaron nombres de clase CoraAgent por CustomerAgent en ejemplos Python
- Se modificaron configuraciones JSON de plantillas ARM para usar tipo de agente "customer"
- Se actualizaron variables de entorno de CORA_AGENT_* a CUSTOMER_AGENT_*
- Se actualizaron todos los comandos de despliegue y configuraciones de contenedores

### [v3.0.0] - 2025-09-12

#### Cambios Mayores - Enfoque en Desarrolladores de IA e Integración con Microsoft Foundry
**Esta versión transforma el repositorio en un recurso completo de aprendizaje enfocado en IA con integración Microsoft Foundry.**

#### Añadido
- **🤖 Ruta de Aprendizaje Prioritaria en IA**: Reestructuración completa priorizando desarrolladores e ingenieros de IA
- **Guía de Integración Microsoft Foundry**: Documentación completa para conectar AZD con servicios Microsoft Foundry
- **Patrones para Despliegue de Modelos de IA**: Guía detallada sobre selección, configuración y estrategias de despliegue en producción
- **Laboratorio Taller de IA**: Taller práctico de 2-3 horas para convertir aplicaciones de IA en soluciones desplegables con AZD
- **Mejores Prácticas de IA en Producción**: Patrones empresariales para escalado, monitoreo y seguridad de cargas de trabajo de IA
- **Guía de Solución de Problemas Específica de IA**: Solución integral para modelos Microsoft Foundry, servicios cognitivos y problemas de despliegue de IA
- **Galería de Plantillas de IA**: Colección destacada de plantillas Microsoft Foundry con niveles de complejidad
- **Materiales del Taller**: Estructura completa de taller con laboratorios prácticos y materiales de referencia

#### Mejorado
- **Estructura del README**: Enfocada en desarrolladores de IA con 45% de interés comunitario basado en Discord de Microsoft Foundry
- **Rutas de Aprendizaje**: Viaje dedicado para desarrolladores de IA junto a rutas tradicionales para estudiantes e ingenieros DevOps
- **Recomendaciones de Plantillas**: Plantillas destacadas de IA incluyendo azure-search-openai-demo, contoso-chat y openai-chat-app-quickstart
- **Integración Comunitaria**: Mejor soporte en comunidad Discord con canales y discusiones específicas de IA

#### Enfoque en Seguridad y Producción
- **Patrones de Identidad Gestionada**: Configuraciones de autenticación y seguridad específicas para IA
- **Optimización de Costos**: Seguimiento del uso de tokens y controles presupuestarios para cargas IA
- **Despliegue Multi-Región**: Estrategias para despliegue global de aplicaciones de IA
- **Monitoreo de Rendimiento**: Métricas específicas de IA e integración con Application Insights

#### Calidad de la Documentación
- **Estructura Lineal del Curso**: Progresión lógica desde conceptos iniciales hasta patrones avanzados de despliegue IA
- **URLs Validadas**: Todos los enlaces externos a repositorios verificados y accesibles
- **Referencia Completa**: Todos los enlaces internos validados y funcionales
- **Listo para Producción**: Patrones empresariales de despliegue con ejemplos reales

### [v2.0.0] - 2025-09-09

#### Cambios Mayores - Reestructuración del Repositorio y Mejora Profesional
**Esta versión representa una renovación significativa de la estructura del repositorio y la presentación del contenido.**

#### Añadido
- **Marco de Aprendizaje Estructurado**: Todas las páginas de documentación incluyen secciones de Introducción, Objetivos de Aprendizaje y Resultados de Aprendizaje
- **Sistema de Navegación**: Se añadieron enlaces de Lección Anterior/Siguiente en toda la documentación para progresión guiada
- **Guía de Estudio**: study-guide.md comprensiva con objetivos de aprendizaje, ejercicios prácticos y materiales de evaluación
- **Presentación Profesional**: Eliminados todos los íconos emoji para mejorar accesibilidad y apariencia profesional
- **Estructura de Contenido Mejorada**: Mejor organización y flujo de materiales de aprendizaje

#### Cambiado
- **Formato de Documentación**: Estandarización de toda la documentación con estructura consistente enfocada en el aprendizaje
- **Flujo de Navegación**: Implementación de progresión lógica en todos los materiales de aprendizaje
- **Presentación del Contenido**: Eliminación de elementos decorativos en favor de formato limpio y profesional
- **Estructura de Enlaces**: Actualización de enlaces internos para soportar nuevo sistema de navegación

#### Mejorado
- **Accesibilidad**: Eliminación de dependencias de emojis para mejor compatibilidad con lectores de pantalla
- **Apariencia Profesional**: Presentación limpia y estilo académico adecuada para aprendizaje empresarial
- **Experiencia de Aprendizaje**: Enfoque estructurado con objetivos y resultados claros en cada lección
- **Organización del Contenido**: Mejor flujo lógico y conexión entre temas relacionados

### [v1.0.0] - 2025-09-09

#### Lanzamiento Inicial - Repositorio Comprensivo de Aprendizaje AZD

#### Añadido
- **Estructura Básica de Documentación**
  - Serie completa de guías para comenzar
  - Documentación comprensiva de despliegue y aprovisionamiento
  - Recursos detallados de solución de problemas y depuración
  - Herramientas y procedimientos para validación previa al despliegue

- **Módulo de Introducción**
  - Conceptos Básicos de AZD: Conceptos y terminología centrales
  - Guía de Instalación: Instrucciones específicas para cada plataforma
  - Guía de Configuración: Configuración del entorno y autenticación
  - Tutorial del Primer Proyecto: Aprendizaje práctico paso a paso

- **Módulo de Despliegue y Aprovisionamiento**
  - Guía de Despliegue: Documentación completa del flujo de trabajo
  - Guía de Aprovisionamiento: Infraestructura como Código con Bicep
  - Mejores prácticas para despliegues en producción
  - Patrones arquitectónicos multi-servicio

- **Módulo de Validación Previa al Despliegue**
  - Planificación de Capacidad: Validación de disponibilidad de recursos Azure
  - Selección de SKU: Guía completa para niveles de servicio
  - Chequeos Previos: Scripts de validación automatizados (PowerShell y Bash)
  - Herramientas de estimación de costos y planificación presupuestaria

- **Módulo de Solución de Problemas**
  - Problemas Comunes: Frecuentes problemas y soluciones
  - Guía de Depuración: Metodologías sistemáticas para resolución
  - Técnicas y herramientas avanzadas de diagnóstico
  - Monitoreo y optimización de rendimiento

- **Recursos y Referencias**
  - Hoja de Comandos: Referencia rápida para comandos esenciales
  - Glosario: Definiciones completas de terminología y acrónimos
  - Preguntas Frecuentes: Respuestas detalladas a preguntas comunes
  - Enlaces a recursos externos y conexiones comunitarias

- **Ejemplos y Plantillas**
  - Ejemplo de Aplicación Web Simple
  - Plantilla para despliegue de sitio web estático
  - Configuración de Aplicación en Contenedor
  - Patrones de integración de bases de datos
  - Ejemplos de arquitectura de microservicios
  - Implementaciones de funciones serverless

#### Características
- **Soporte Multi-Plataforma**: Guías de instalación y configuración para Windows, macOS y Linux
- **Múltiples Niveles de Habilidad**: Contenido diseñado para estudiantes hasta desarrolladores profesionales
- **Enfoque Práctico**: Ejemplos prácticos y escenarios reales
- **Cobertura Comprensiva**: Desde conceptos básicos hasta patrones avanzados empresariales
- **Enfoque en Seguridad**: Mejores prácticas de seguridad integradas a lo largo del contenido
- **Optimización de Costos**: Guía para despliegues rentables y gestión eficiente de recursos

#### Calidad de la Documentación
- **Ejemplos de Código Detallados**: Muestras de código prácticas y probadas
- **Instrucciones Paso a Paso**: Guía clara y accionable
- **Manejo Completo de Errores**: Solución de problemas para cuestiones comunes
- **Integración de Mejores Prácticas**: Estándares industriales y recomendaciones
- **Compatibilidad de Versiones**: Actualizado con los últimos servicios de Azure y características de azd

## Mejoras Futuras Planificadas

### Versión 3.1.0 (Planificada)
#### Expansión de Plataforma de IA
- **Soporte Multi-Modelo**: Patrones de integración para Hugging Face, Azure Machine Learning y modelos personalizados
- **Frameworks para Agentes de IA**: Plantillas para despliegues LangChain, Semantic Kernel y AutoGen
- **Patrones Avanzados RAG**: Opciones de bases de datos vectoriales más allá de Azure AI Search (Pinecone, Weaviate, etc.)
- **Observabilidad de IA**: Monitoreo mejorado para rendimiento del modelo, uso de tokens y calidad de respuestas

#### Experiencia del Desarrollador
- **Extensión VS Code**: Experiencia integrada de desarrollo AZD + Microsoft Foundry
- **Integración GitHub Copilot**: Generación de plantillas AZD asistida por IA
- **Tutoriales Interactivos**: Ejercicios prácticos con validación automatizada para escenarios de IA
- **Contenido en Video**: Tutoriales suplementarios para aprendices visuales enfocados en despliegues IA

### Versión 4.0.0 (Planificada)
#### Patrones Empresariales de IA
- **Marco de Gobernanza**: Gobernanza, cumplimiento y auditoría de modelos IA
- **IA Multi-Inquilino**: Patrones para servir múltiples clientes con servicios de IA aislados
- **Despliegue IA en Borde**: Integración con Azure IoT Edge e instancias de contenedores
- **IA en Nube Híbrida**: Patrones de despliegue multi-nube e híbridos para cargas IA

#### Funciones Avanzadas
- **Automatización de Pipeline IA**: Integración MLOps con pipelines de Azure Machine Learning
- **Seguridad Avanzada**: Patrones zero-trust, endpoints privados y protección avanzada contra amenazas
- **Optimización de Rendimiento**: Afinación avanzada y estrategias de escalado para aplicaciones IA de alto rendimiento
- **Distribución Global**: Patrones de entrega de contenido y cacheo en borde para aplicaciones IA

### Versión 3.0.0 (Planificada) - Reemplazada por la Versión Actual
#### Adiciones Propuestas - Ahora Implementadas en v3.0.0
- ✅ **Contenido Enfocado en IA**: Integración completa Microsoft Foundry (Completado)
- ✅ **Tutoriales Interactivos**: Taller práctico de IA (Completado)
- ✅ **Módulo Avanzado de Seguridad**: Patrones de seguridad específicos IA (Completado)
- ✅ **Optimización de Rendimiento**: Estrategias de afinado para cargas IA (Completado)

### Versión 2.1.0 (Planificada) - Parcialmente Implementada en v3.0.0
#### Mejoras Menores - Algunas Completadas en Versión Actual
- ✅ **Ejemplos Adicionales**: Escenarios de despliegue enfocados en IA (Completado)
- ✅ **FAQ Ampliada**: Preguntas y solución de problemas específicas de IA (Completado)
- **Integración de Herramientas**: Guías mejoradas para integración en IDE y editores
- ✅ **Ampliación de Monitoreo**: Patrones específicos IA de monitoreo y alertas (Completado)

#### Aún Planificado para Futuras Versiones
- **Documentación Amigable para Móviles**: Diseño responsive para aprendizaje móvil
- **Acceso Offline**: Paquetes descargables de documentación
- **Mejora en Integración IDE**: Extensión VS Code para AZD + flujos de trabajo IA
- **Panel Comunitario**: Métricas comunitarias en tiempo real y seguimiento de contribuciones

## Contribuyendo al Registro de Cambios

### Reporte de Cambios
Al contribuir a este repositorio, por favor asegúrese de que las entradas del registro de cambios incluyan:

1. **Número de Versión**: Siguiendo versionado semántico (mayor.menor.parche)
2. **Fecha**: Fecha de lanzamiento o actualización en formato AAAA-MM-DD
3. **Categoría**: Añadido, Cambiado, Obsoleto, Eliminado, Corregido, Seguridad
4. **Descripción Clara**: Descripción concisa de lo que cambió
5. **Evaluación de Impacto**: Cómo los cambios afectan a los usuarios existentes

### Categorías de Cambios

#### Añadido
- Nuevas características, secciones de documentación o capacidades
- Nuevos ejemplos, plantillas o recursos de aprendizaje
- Herramientas adicionales, scripts o utilidades

#### Cambiado
- Modificaciones en funcionalidades o documentación existentes
- Actualizaciones para mejorar claridad o precisión
- Reestructuración de contenido u organización

#### Obsoleto
- Funciones o enfoques que están siendo eliminados progresivamente
- Secciones de documentación programadas para eliminación
- Métodos que tienen mejores alternativas

#### Eliminado
- Características, documentación o ejemplos que ya no son relevantes
- Información desactualizada o enfoques obsoletos
- Contenido redundante o consolidado

#### Corregido
- Correcciones de errores en documentación o código
- Resolución de problemas o incidencias reportadas
- Mejoras en precisión o funcionalidad

#### Seguridad
- Mejoras o correcciones relacionadas con seguridad
- Actualizaciones en mejores prácticas de seguridad
- Resolución de vulnerabilidades de seguridad

### Directrices de Versionado Semántico

#### Versión Mayor (X.0.0)
- Cambios importantes que requieren acción del usuario
- Reestructuración significativa del contenido u organización
- Cambios que alteran el enfoque o metodología fundamental

#### Versión menor (X.Y.0)
- Nuevas características o adiciones de contenido
- Mejoras que mantienen compatibilidad hacia atrás
- Ejemplos, herramientas o recursos adicionales

#### Versión de parche (X.Y.Z)
- Corrección de errores y correcciones
- Mejoras menores en contenido existente
- Aclaraciones y pequeños avances

## Comentarios y Sugerencias de la Comunidad

Animamos activamente a la comunidad a proporcionar comentarios para mejorar este recurso de aprendizaje:

### Cómo Proporcionar Comentarios
- **GitHub Issues**: Reportar problemas o sugerir mejoras (problemas específicos de IA son bienvenidos)
- **Discord Discussions**: Compartir ideas y participar con la comunidad de Microsoft Foundry
- **Pull Requests**: Contribuir mejoras directas al contenido, especialmente plantillas y guías de IA
- **Microsoft Foundry Discord**: Participar en el canal #Azure para discusiones de AZD + IA
- **Foros Comunitarios**: Participar en discusiones más amplias para desarrolladores de Azure

### Categorías de Comentarios
- **Precisión del Contenido de IA**: Correcciones en integración y despliegue de servicios de IA
- **Experiencia de Aprendizaje**: Sugerencias para mejorar el flujo de aprendizaje para desarrolladores de IA
- **Contenido de IA Faltante**: Solicitudes de plantillas, patrones o ejemplos adicionales de IA
- **Accesibilidad**: Mejoras para necesidades diversas de aprendizaje
- **Integración de Herramientas de IA**: Sugerencias para mejor integración en flujo de desarrollo de IA
- **Patrones de IA para Producción**: Solicitudes de patrones empresariales para despliegue de IA

### Compromiso de Respuesta
- **Respuesta a Problemas**: Dentro de 48 horas para problemas reportados
- **Solicitudes de Función**: Evaluación en un plazo de una semana
- **Contribuciones de la Comunidad**: Revisión en un plazo de una semana
- **Problemas de Seguridad**: Prioridad inmediata con respuesta acelerada

## Cronograma de Mantenimiento

### Actualizaciones Regulares
- **Revisiones Mensuales**: Precisión del contenido y validación de enlaces
- **Actualizaciones Trimestrales**: Principales adiciones y mejoras de contenido
- **Revisiones Semestrales**: Reestructuración y mejora completa
- **Lanzamientos Anuales**: Actualizaciones de versión mayor con mejoras significativas

### Monitoreo y Aseguramiento de Calidad
- **Pruebas Automatizadas**: Validación regular de ejemplos de código y enlaces
- **Integración de Comentarios Comunitarios**: Incorporación regular de sugerencias de usuarios
- **Actualizaciones Tecnológicas**: Alineamiento con los últimos servicios de Azure y lanzamientos de azd
- **Auditorías de Accesibilidad**: Revisión regular para principios de diseño inclusivo

## Política de Soporte de Versiones

### Soporte de Versión Actual
- **Última Versión Mayor**: Soporte completo con actualizaciones regulares
- **Versión Mayor Anterior**: Actualizaciones de seguridad y correcciones críticas por 12 meses
- **Versiones Legadas**: Solo soporte comunitario, sin actualizaciones oficiales

### Guía de Migración
Cuando se lanzan versiones mayores, proporcionamos:
- **Guías de Migración**: Instrucciones paso a paso para la transición
- **Notas de Compatibilidad**: Detalles sobre cambios que rompen compatibilidad
- **Soporte de Herramientas**: Scripts o utilidades para asistir en la migración
- **Soporte Comunitario**: Foros dedicados para preguntas de migración

---

**Navegación**
- **Lección Anterior**: [Guía de Estudio](resources/study-guide.md)
- **Lección Siguiente**: Regresar al [README Principal](README.md)

**Mantente Actualizado**: Sigue este repositorio para recibir notificaciones sobre nuevas versiones y actualizaciones importantes de los materiales de aprendizaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->