# 3. Deconstruir una Plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Activar GitHub Copilot con servidores MCP para asistencia en Azure
    - [ ] Entender la estructura de carpetas y componentes de la plantilla AZD
    - [ ] Explorar patrones de organización de infraestructura como código (Bicep)
    - [ ] **Laboratorio 3:** Usar GitHub Copilot para explorar y entender la arquitectura del repositorio

---


Con plantillas AZD y la CLI de desarrollador de Azure (`azd`), podemos iniciar rápidamente nuestro viaje de desarrollo de IA con repositorios estandarizados que proporcionan código de ejemplo, infraestructura y archivos de configuración - en forma de un proyecto _starter_ listo para desplegar.

**Pero ahora, necesitamos comprender la estructura del proyecto y la base de código - y ser capaces de personalizar la plantilla AZD - ¡sin ninguna experiencia previa o comprensión de AZD!**

---

## 1. Activar GitHub Copilot

### 1.1 Instalar GitHub Copilot Chat

Es momento de explorar [GitHub Copilot con Modo Agente](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Ahora, podemos usar lenguaje natural para describir nuestra tarea a un alto nivel y obtener ayuda en la ejecución. Para este laboratorio, usaremos el [plan gratuito de Copilot](https://github.com/github-copilot/signup) que tiene un límite mensual para completaciones e interacciones de chat.

La extensión puede instalarse desde el marketplace, pero ya debería estar disponible en tu entorno de Codespaces. _Haz clic en `Open Chat` desde el menú desplegable del ícono de Copilot - y escribe un prompt como `What can you do?`_ - es posible que se te solicite iniciar sesión. **GitHub Copilot Chat está listo**.

### 1.2. Instalar Servidores MCP

Para que el modo Agente sea efectivo, necesita acceso a las herramientas adecuadas para recuperar conocimiento o realizar acciones. Aquí es donde los servidores MCP pueden ayudar. Configuraremos los siguientes servidores:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Para activarlos:

1. Crea un archivo llamado `.vscode/mcp.json` si no existe
1. Copia lo siguiente en ese archivo - ¡y arranca los servidores!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Puede que obtengas un error que indica que `npx` no está instalado (haz clic para expandir la solución)"

      Para arreglarlo, abre el archivo `.devcontainer/devcontainer.json` y agrega esta línea en la sección de features. Luego reconstruye el contenedor. Deberías tener `npx` instalado.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Probar GitHub Copilot Chat

**Primero usa `az login` para autenticarte con Azure desde la línea de comandos de VS Code.**

Ahora deberías poder consultar el estado de tu suscripción de Azure y hacer preguntas sobre recursos desplegados o configuración. Prueba estos prompts:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

También puedes hacer preguntas sobre la documentación de Azure y recibir respuestas basadas en el servidor MCP de Microsoft Docs. Prueba estos prompts:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

O puedes pedir fragmentos de código para completar una tarea. Prueba este prompt:

1. `Give me a Python code example that uses AAD for an interactive chat client`

En modo `Ask`, esto proporcionará código que puedes copiar y pegar para probar. En modo `Agent`, puede ir un paso más allá y crear los recursos relevantes para ti, incluyendo scripts de configuración y documentación, para ayudarte a ejecutar esa tarea.

**Ahora estás equipado para comenzar a explorar el repositorio de la plantilla**

---

## 2. Deconstruir la Arquitectura

??? prompt "PREGUNTA: Explica la arquitectura de la aplicación en docs/images/architecture.png en 1 párrafo"

      Esta aplicación es una aplicación de chat impulsada por IA construida sobre Azure que demuestra una arquitectura moderna basada en agentes. La solución gira en torno a una Azure Container App que alberga el código principal de la aplicación, la cual procesa la entrada del usuario y genera respuestas inteligentes a través de un agente de IA. 
      
      La arquitectura aprovecha Microsoft Foundry Project como base para las capacidades de IA, conectándose a Azure AI Services que proveen los modelos de lenguaje subyacentes (como gpt-4.1-mini) y la funcionalidad del agente. Las interacciones del usuario fluyen a través de un frontend basado en React hacia un backend FastAPI que se comunica con el servicio del agente de IA para generar respuestas contextuales. 
      
      El sistema incorpora capacidades de recuperación de conocimiento mediante búsqueda en archivos o el servicio Azure AI Search, permitiendo que el agente acceda y cite información de documentos cargados. Para la excelencia operativa, la arquitectura incluye monitoreo exhaustivo mediante Application Insights y Log Analytics Workspace para trazabilidad, registro y optimización del rendimiento. 
      
      Azure Storage provee almacenamiento de blobs para datos de la aplicación y carga de archivos, mientras que Managed Identity asegura acceso seguro entre recursos de Azure sin almacenar credenciales. Toda la solución está diseñada para escalabilidad y mantenibilidad, con la aplicación contenerizada que escala automáticamente según la demanda y proporciona seguridad incorporada, monitoreo y capacidades de CI/CD mediante el ecosistema de servicios gestionados de Azure.

![Architecture](../../../../../translated_images/es/architecture.48d94861e6e6cdc0.webp)

---

## 3. Estructura del Repositorio

!!! prompt "PREGUNTA: Explica la estructura de carpetas de la plantilla. Comienza con un diagrama jerárquico visual."

??? info "RESPUESTA: Diagrama Jerárquico Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuración y Preparación
      │   ├── azure.yaml                    # Configuración de Azure Developer CLI
      │   ├── docker-compose.yaml           # Contenedores para desarrollo local
      │   ├── pyproject.toml                # Configuración del proyecto Python
      │   ├── requirements-dev.txt          # Dependencias para desarrollo
      │   └── .devcontainer/                # Configuración del contenedor de desarrollo VS Code
      │
      ├── 🏗️ Infraestructura (infra/)
      │   ├── main.bicep                    # Plantilla principal de infraestructura
      │   ├── api.bicep                     # Recursos específicos de la API
      │   ├── main.parameters.json          # Parámetros de infraestructura
      │   └── core/                         # Componentes modulares de infraestructura
      │       ├── ai/                       # Configuraciones de servicios de IA
      │       ├── host/                     # Infraestructura de hosting
      │       ├── monitor/                  # Monitoreo y registros
      │       ├── search/                   # Configuración de Azure AI Search
      │       ├── security/                 # Seguridad e identidad
      │       └── storage/                  # Configuraciones de cuentas de almacenamiento
      │
      ├── 💻 Código Fuente de la Aplicación (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entrada de la aplicación FastAPI
      │   │   ├── routes.py                 # Definiciones de rutas API
      │   │   ├── search_index_manager.py   # Funcionalidad de búsqueda
      │   │   ├── data/                     # Manejo de datos en la API
      │   │   ├── static/                   # Recursos web estáticos
      │   │   └── templates/                # Plantillas HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependencias Node.js
      │   │   ├── vite.config.ts            # Configuración de compilación Vite
      │   │   └── src/                      # Código fuente del frontend
      │   ├── data/                         # Archivos de datos de ejemplo
      │   │   └── embeddings.csv            # Embeddings precalculados
      │   ├── files/                        # Archivos de base de conocimiento
      │   │   ├── customer_info_*.json      # Muestras de datos de clientes
      │   │   └── product_info_*.md         # Documentación de productos
      │   ├── Dockerfile                    # Configuración de contenedor
      │   └── requirements.txt              # Dependencias de Python
      │
      ├── 🔧 Automatización y Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Configuración post-despliegue
      │   ├── setup_credential.sh/.ps1     # Configuración de credenciales
      │   ├── validate_env_vars.sh/.ps1    # Validación de variables de entorno
      │   └── resolve_model_quota.sh/.ps1  # Gestión de cuota de modelos
      │
      ├── 🧪 Pruebas y Evaluación
      │   ├── tests/                        # Pruebas unitarias e integración
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Framework de evaluación de agentes
      │   │   ├── evaluate.py               # Ejecutador de evaluaciones
      │   │   ├── eval-queries.json         # Consultas de prueba
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Entorno de desarrollo
      │   │   ├── 1-quickstart.py           # Ejemplos para empezar
      │   │   └── aad-interactive-chat.py   # Ejemplos de autenticación
      │   └── airedteaming/                 # Evaluación de seguridad en IA
      │       └── ai_redteaming.py          # Pruebas de Red Team
      │
      ├── 📚 Documentación (docs/)
      │   ├── deployment.md                 # Guía de despliegue
      │   ├── local_development.md          # Instrucciones para desarrollo local
      │   ├── troubleshooting.md            # Problemas comunes y soluciones
      │   ├── azure_account_setup.md        # Prerrequisitos de Azure
      │   └── images/                       # Recursos para documentación
      │
      └── 📄 Metadatos del Proyecto
         ├── README.md                     # Resumen del proyecto
         ├── CODE_OF_CONDUCT.md           # Normas comunitarias
         ├── CONTRIBUTING.md              # Guía de contribución
         ├── LICENSE                      # Términos de licencia
         └── next-steps.md                # Guía post-despliegue
      ```

### 3.1. Arquitectura Principal de la Aplicación

Esta plantilla sigue un patrón de **aplicación web full-stack** con:

- **Backend**: Python FastAPI con integración Azure AI
- **Frontend**: TypeScript/React con sistema de compilación Vite
- **Infraestructura**: Plantillas Azure Bicep para recursos en la nube
- **Contenerización**: Docker para despliegues consistentes

### 3.2 Infraestructura como Código (bicep)

La capa de infraestructura usa plantillas **Azure Bicep** organizadas modularmente:

   - **`main.bicep`**: Orquesta todos los recursos Azure
   - **módulos `core/`**: Componentes reutilizables para diferentes servicios
      - Servicios AI (Modelos Microsoft Foundry, AI Search)
      - Hosting de contenedores (Azure Container Apps)
      - Monitoreo (Application Insights, Log Analytics)
      - Seguridad (Key Vault, Managed Identity)

### 3.3 Código Fuente de la Aplicación (`src/`)

**API Backend (`src/api/`)**:

- API REST basada en FastAPI
- Integración con Foundry Agents
- Gestión de índices de búsqueda para recuperación de conocimiento
- Capacidades de carga y procesamiento de archivos

**Frontend (`src/frontend/`)**:

- SPA moderna en React/TypeScript
- Vite para desarrollo rápido y compilaciones optimizadas
- Interfaz de chat para interacciones con agentes

**Base de Conocimiento (`src/files/`)**:

- Datos de ejemplo de clientes y productos
- Demuestra recuperación de conocimiento basada en archivos
- Ejemplos en formato JSON y Markdown


### 3.4 DevOps y Automatización

**Scripts (`scripts/`)**:

- Scripts multiplataforma PowerShell y Bash
- Validación y configuración de ambiente
- Configuración post-despliegue
- Gestión de cuota de modelos

**Integración con Azure Developer CLI**:

- Configuración `azure.yaml` para flujos de trabajo `azd`
- Provisionamiento y despliegue automático
- Gestión de variables de entorno

### 3.5 Pruebas y Aseguramiento de Calidad

**Framework de Evaluación (`evals/`)**:

- Evaluación del desempeño de agentes
- Pruebas de calidad de consulta-respuesta
- Pipeline de evaluación automatizada

**Seguridad en IA (`airedteaming/`)**:

- Pruebas de Red Team para seguridad en IA
- Escaneo de vulnerabilidades de seguridad
- Prácticas de IA responsable

---

## 4. Felicitaciones 🏆

Has usado con éxito GitHub Copilot Chat con servidores MCP para explorar el repositorio.

- [X] Activaste GitHub Copilot para Azure
- [X] Entendiste la arquitectura de la aplicación
- [X] Exploraste la estructura de la plantilla AZD

Esto te da una idea de los activos de _infraestructura como código_ para esta plantilla. A continuación, veremos el archivo de configuración para AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Aviso**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No nos hacemos responsables de malentendidos o interpretaciones erróneas derivados del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->