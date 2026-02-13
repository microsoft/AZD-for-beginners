# 4. Configurar una plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Entender el propósito de `azure.yaml`
    - [ ] Entender la estructura de `azure.yaml`
    - [ ] Entender el valor de los `hooks` del ciclo de vida de azd
    - [ ] **Laboratorio 4:** Explorar y modificar variables de entorno

---

!!! prompt "¿Qué hace el archivo `azure.yaml`? Usa un bloque de código y explícalo línea por línea"

      El archivo `azure.yaml` es el **archivo de configuración para Azure Developer CLI (azd)**. Define cómo debe desplegarse su aplicación en Azure, incluyendo infraestructura, servicios, hooks de implementación y variables de entorno.

---

## 1. Propósito y funcionalidad

Este archivo `azure.yaml` sirve como el **plan de despliegue** para una aplicación de agentes de IA que:

1. **Valida el entorno** antes del despliegue
2. **Provisiona servicios de Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Despliega una aplicación Python** en Azure Container Apps
4. **Configura modelos de IA** tanto para chat como para funcionalidad de embeddings
5. **Configura monitoreo y trazabilidad** para la aplicación de IA
6. **Maneja escenarios tanto nuevos como existentes** de Azure AI Project

El archivo permite un **despliegue con un solo comando** (`azd up`) de una solución completa de agente de IA con validación adecuada, aprovisionamiento y configuración posterior al despliegue.

??? info "Expandir para ver: `azure.yaml`"

      El archivo `azure.yaml` define cómo Azure Developer CLI debe desplegar y gestionar esta aplicación de agente de IA en Azure. Desglosemoslo línea por línea.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

## 2. Desglosando el archivo

Recorramos el archivo sección por sección, para entender qué hace y por qué.

### 2.1 **Encabezado y esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Línea 1**: Proporciona validación del esquema del servidor de lenguaje YAML para soporte en el IDE e IntelliSense

### 2.2 Metadatos del proyecto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Línea 5**: Define el nombre del proyecto usado por Azure Developer CLI
- **Líneas 6-7**: Especifica que esto se basa en una plantilla versión 1.0.2
- **Líneas 8-9**: Requiere la versión 1.14.0 o superior de Azure Developer CLI

### 2.3 Hooks de despliegue (11-40)

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
      - En Windows: Ejecuta el script de validación de PowerShell
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
- **Líneas 21-30**: **Hook post-provisionamiento** - se ejecuta después de que los recursos de Azure sean creados

  - Ejecuta scripts para escribir las variables de entorno
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
- **Líneas 31-40**: **Hook post-despliegue** - se ejecuta después del despliegue de la aplicación

  - Ejecuta scripts de configuración final
  - Continúa incluso si los scripts fallan

### 2.4 Configuración del servicio (41-48)

Esto configura el servicio de la aplicación que está desplegando.

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
- **Línea 45**: Usa Azure Container Apps como la plataforma de alojamiento
- **Líneas 46-48**: Configuración de Docker

      - Usa "api_and_frontend" como el nombre de la imagen
      - Construye la imagen Docker de forma remota en Azure (no localmente)

### 2.5 Variables de la pipeline (49-76)

Estas son variables para ayudar a ejecutar `azd` en pipelines de CI/CD para automatización

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

Esta sección define variables de entorno usadas **durante el despliegue**, organizadas por categoría:

- **Nombres de recursos de Azure (Líneas 51-60)**:
      - Nombres de recursos principales de servicios de Azure, p. ej., Resource Group, AI Hub, AI Project, etc.- 
- **Flags de funciones (Líneas 61-63)**:
      - Variables booleanas para habilitar/deshabilitar servicios específicos de Azure
- **Configuración del agente de IA (Líneas 64-71)**:
      - Configuración para el agente de IA principal incluyendo nombre, ID, ajustes de despliegue, detalles del modelo- 
- **Configuración de embeddings de IA (Líneas 72-79)**:
      - Configuración para el modelo de embeddings usado para búsqueda vectorial
- **Búsqueda y monitoreo (Líneas 80-84)**:
      - Nombre del índice de búsqueda, IDs de recursos existentes y ajustes de monitoreo/trazabilidad

---

## 3. Conocer las variables de entorno
Las siguientes variables de entorno controlan la configuración y el comportamiento de su despliegue, organizadas por su propósito principal. La mayoría de las variables tienen valores predeterminados sensatos, pero puede personalizarlas para que coincidan con sus requisitos específicos o recursos existentes de Azure.

### 3.1 Variables requeridas 

```bash title="" linenums="0"
# Configuración principal de Azure
AZURE_ENV_NAME                    # Nombre del entorno (utilizado en el nombrado de recursos)
AZURE_LOCATION                    # Región de implementación
AZURE_SUBSCRIPTION_ID             # Suscripción objetivo
AZURE_RESOURCE_GROUP              # Nombre del grupo de recursos
AZURE_PRINCIPAL_ID                # Principal de usuario para RBAC

# Nombres de recursos (Generados automáticamente si no se especifican)
AZURE_AIHUB_NAME                  # Nombre del hub de Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nombre del proyecto de IA
AZURE_AISERVICES_NAME             # Nombre de la cuenta de servicios de IA
AZURE_STORAGE_ACCOUNT_NAME        # Nombre de la cuenta de almacenamiento
AZURE_CONTAINER_REGISTRY_NAME     # Nombre del registro de contenedores
AZURE_KEYVAULT_NAME               # Nombre del Key Vault (si se utiliza)
```

### 3.2 Configuración del modelo 
```bash title="" linenums="0"
# Configuración del modelo de chat
AZURE_AI_AGENT_MODEL_NAME         # Predeterminado: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Predeterminado: OpenAI (o Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Predeterminado: la última disponible
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nombre de despliegue para el modelo de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Predeterminado: Estándar
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Predeterminado: 80 (miles de TPM)

# Configuración del modelo de embeddings
AZURE_AI_EMBED_MODEL_NAME         # Predeterminado: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Predeterminado: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Predeterminado: la última disponible
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nombre de despliegue para embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Predeterminado: Estándar
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Predeterminado: 50 (miles de TPM)

# Configuración del agente
AZURE_AI_AGENT_NAME               # Nombre para mostrar del agente
AZURE_EXISTING_AGENT_ID           # Usar agente existente (opcional)
```

### 3.3 Alternar funciones
```bash title="" linenums="0"
# Servicios opcionales
USE_APPLICATION_INSIGHTS         # Predeterminado: verdadero
USE_AZURE_AI_SEARCH_SERVICE      # Predeterminado: falso
USE_CONTAINER_REGISTRY           # Predeterminado: verdadero

# Monitoreo y rastreo
ENABLE_AZURE_MONITOR_TRACING     # Predeterminado: falso
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Predeterminado: falso

# Configuración de búsqueda
AZURE_AI_SEARCH_INDEX_NAME       # Nombre del índice de búsqueda
AZURE_SEARCH_SERVICE_NAME        # Nombre del servicio de búsqueda
```

### 3.4 Configuración del AI Project 
```bash title="" linenums="0"
# Usar recursos existentes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo del recurso del proyecto de IA existente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL del endpoint del proyecto existente
```

### 3.5 Verifique sus variables

Use Azure Developer CLI para ver y administrar sus variables de entorno:

```bash title="" linenums="0"
# Ver todas las variables de entorno del entorno actual
azd env get-values

# Obtener una variable de entorno específica
azd env get-value AZURE_ENV_NAME

# Establecer una variable de entorno
azd env set AZURE_LOCATION eastus

# Establecer múltiples variables desde un archivo .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->