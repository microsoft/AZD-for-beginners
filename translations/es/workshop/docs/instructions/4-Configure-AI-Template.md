<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T10:08:39+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "es"
}
-->
# 4. Configurar una Plantilla

!!! tip "AL FINAL DE ESTE MÓDULO SERÁS CAPAZ DE"

    - [ ] Comprender el propósito de `azure.yaml`
    - [ ] Comprender la estructura de `azure.yaml`
    - [ ] Comprender el valor de los `hooks` del ciclo de vida de azd
    - [ ] **Laboratorio 3:** 

---

!!! prompt "¿Qué hace el archivo `azure.yaml`? Usa un bloque de código y explícalo línea por línea"

      El archivo `azure.yaml` es el **archivo de configuración para Azure Developer CLI (azd)**. Define cómo tu aplicación debe ser desplegada en Azure, incluyendo infraestructura, servicios, hooks de despliegue y variables de entorno.

---

## 1. Propósito y Funcionalidad

Este archivo `azure.yaml` sirve como el **plano de despliegue** para una aplicación de agente de inteligencia artificial que:

1. **Valida el entorno** antes del despliegue
2. **Provisiona servicios de Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Despliega una aplicación en Python** en Azure Container Apps
4. **Configura modelos de IA** para funcionalidad de chat y embeddings
5. **Establece monitoreo y rastreo** para la aplicación de IA
6. **Maneja escenarios tanto nuevos como existentes** de proyectos de Azure AI

El archivo permite un **despliegue con un solo comando** (`azd up`) de una solución completa de agente de IA con validación adecuada, aprovisionamiento y configuración posterior al despliegue.

??? info "Expandir para ver: `azure.yaml`"

      El archivo `azure.yaml` define cómo Azure Developer CLI debe desplegar y gestionar esta aplicación de agente de IA en Azure. Vamos a desglosarlo línea por línea.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: ¿necesitamos hooks? 
      # TODO: ¿necesitamos todas las variables?

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Desglosando el Archivo

Vamos a analizar el archivo sección por sección, para entender qué hace y por qué.

### 2.1 **Encabezado y Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Línea 1**: Proporciona validación de esquema del servidor de lenguaje YAML para soporte en IDE e IntelliSense

### 2.2 Metadatos del Proyecto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Línea 5**: Define el nombre del proyecto utilizado por Azure Developer CLI
- **Líneas 6-7**: Especifica que está basado en una versión de plantilla 1.0.2
- **Líneas 8-9**: Requiere la versión 1.14.0 o superior de Azure Developer CLI

### 2.3 Hooks de Despliegue (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Líneas 11-20**: **Hook previo al despliegue** - se ejecuta antes de `azd up`

      - En Unix/Linux: Hace ejecutable el script de validación y lo ejecuta
      - En Windows: Ejecuta el script de validación en PowerShell
      - Ambos son interactivos y detendrán el despliegue si fallan

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Líneas 21-30**: **Hook posterior al aprovisionamiento** - se ejecuta después de que se crean los recursos de Azure

  - Ejecuta scripts para escribir variables de entorno
  - Continúa el despliegue incluso si estos scripts fallan (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Líneas 31-40**: **Hook posterior al despliegue** - se ejecuta después del despliegue de la aplicación

  - Ejecuta scripts de configuración final
  - Continúa incluso si los scripts fallan

### 2.4 Configuración del Servicio (41-48)

Esta sección configura el servicio de la aplicación que estás desplegando.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Línea 42**: Define un servicio llamado "api_and_frontend"
- **Línea 43**: Apunta al directorio `./src` para el código fuente
- **Línea 44**: Especifica Python como el lenguaje de programación
- **Línea 45**: Utiliza Azure Container Apps como la plataforma de alojamiento
- **Líneas 46-48**: Configuración de Docker

      - Usa "api_and_frontend" como el nombre de la imagen
      - Construye la imagen de Docker remotamente en Azure (no localmente)

### 2.5 Variables del Pipeline (49-76)

Estas son variables para ayudarte a ejecutar `azd` en pipelines de CI/CD para automatización

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Esta sección define las variables de entorno utilizadas **durante el despliegue**, organizadas por categoría:

- **Nombres de Recursos de Azure (Líneas 51-60)**:
      - Nombres de recursos principales de servicios de Azure, por ejemplo, Resource Group, AI Hub, AI Project, etc.- 
- **Flags de Funcionalidad (Líneas 61-63)**:
      - Variables booleanas para habilitar/deshabilitar servicios específicos de Azure
- **Configuración del Agente de IA (Líneas 64-71)**:
      - Configuración para el agente de IA principal, incluyendo nombre, ID, ajustes de despliegue, detalles del modelo- 
- **Configuración de Embeddings de IA (Líneas 72-79)**:
      - Configuración para el modelo de embeddings utilizado para búsqueda vectorial
- **Búsqueda y Monitoreo (Líneas 80-84)**:
      - Nombre del índice de búsqueda, IDs de recursos existentes y configuraciones de monitoreo/rastreo

---

## 3. Conoce las Variables de Entorno
Las siguientes variables de entorno controlan la configuración y el comportamiento de tu despliegue, organizadas por su propósito principal. La mayoría de las variables tienen valores predeterminados razonables, pero puedes personalizarlas para que coincidan con tus requisitos específicos o recursos existentes de Azure.

### 3.1 Variables Requeridas 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Configuración del Modelo 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Activación de Funcionalidades
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Configuración del Proyecto de IA 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Verifica tus Variables

Usa Azure Developer CLI para ver y gestionar tus variables de entorno:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

