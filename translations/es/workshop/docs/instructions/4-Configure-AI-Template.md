# 4. Configurar una plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Entender el propósito de `azure.yaml`
    - [ ] Entender la estructura de `azure.yaml`
    - [ ] Entender el valor de los `hooks` del ciclo de vida de azd
    - [ ] **Laboratorio 4:** Explorar y modificar variables de entorno

---

!!! prompt "¿Qué hace el archivo `azure.yaml`? Usa un bloque de código y explícalo línea por línea"

      El archivo `azure.yaml` es el **archivo de configuración para Azure Developer CLI (azd)**. Define cómo debe desplegarse tu aplicación en Azure, incluyendo la infraestructura, servicios, hooks de despliegue y variables de entorno.

---

## 1. Propósito y funcionalidad

Este archivo `azure.yaml` sirve como el **blueprint de despliegue** para una aplicación de agente de IA que:

1. **Valida el entorno** antes del despliegue
2. **Proporciona servicios de Azure AI** (AI Hub, AI Project, Search, etc.)
3. **Despliega una aplicación Python** en Azure Container Apps
4. **Configura modelos de IA** tanto para chat como para funcionalidad de embeddings
5. **Configura monitoreo y trazabilidad** para la aplicación de IA
6. **Maneja escenarios de un proyecto de IA de Azure** nuevo y existentes

El archivo permite un **despliegue con un solo comando** (`azd up`) de una solución completa de agente de IA con validación adecuada, provisión y configuración post-despliegue.

??? info "Expandir para ver: `azure.yaml`"

      El archivo `azure.yaml` define cómo Azure Developer CLI debe desplegar y administrar esta aplicación de Agente de IA en Azure. Vamos a desglosarlo línea por línea.

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

## 2. Desglosando el archivo

Vamos a repasar el archivo sección por sección para entender qué hace - y por qué.

### 2.1 **Encabezado y Esquema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Línea 1**: Proporciona la validación del esquema para el lenguaje YAML para soporte en el IDE e IntelliSense

### 2.2 Metadatos del proyecto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Línea 5**: Define el nombre del proyecto usado por Azure Developer CLI
- **Líneas 6-7**: Especifica que está basado en una plantilla versión 1.0.2
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

- **Líneas 11-20**: **Hook pre-despliegue** - se ejecuta antes de `azd up`

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
- **Líneas 21-30**: **Hook post-provisión** - se ejecuta después de crear los recursos de Azure

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
- **Líneas 31-40**: **Hook post-despliegue** - se ejecuta después del despliegue de la aplicación

  - Ejecuta scripts finales de configuración
  - Continúa incluso si los scripts fallan

### 2.4 Configuración del servicio (41-48)

Esto configura el servicio de la aplicación que despliegas.

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
- **Línea 44**: Especifica Python como lenguaje de programación
- **Línea 45**: Usa Azure Container Apps como plataforma de alojamiento
- **Líneas 46-48**: Configuración de Docker

      - Usa "api_and_frontend" como nombre de la imagen
      - Construye la imagen Docker remotamente en Azure (no localmente)

### 2.5 Variables del pipeline (49-76)

Son variables para ayudarte a ejecutar `azd` en pipelines de CI/CD para automatización

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
      - Nombres principales de recursos de servicios Azure p.ej., grupo de recursos, AI Hub, AI Project, etc.- 
- **Flags de características (Líneas 61-63)**:
      - Variables booleanas para habilitar/deshabilitar servicios específicos de Azure
- **Configuración del agente de IA (Líneas 64-71)**:
      - Configuración para el agente de IA principal incluyendo nombre, ID, configuración de despliegue, detalles del modelo- 
- **Configuración del embedding de IA (Líneas 72-79)**:
      - Configuración para el modelo de embedding usado para búsqueda vectorial
- **Búsqueda y monitoreo (Líneas 80-84)**:
      - Nombre del índice de búsqueda, IDs de recursos existentes y configuración de monitoreo/trazabilidad

---

## 3. Conoce las variables de entorno
Las siguientes variables de entorno controlan la configuración y comportamiento de tu despliegue, organizadas por su propósito principal. La mayoría de variables tienen valores por defecto sensatos, pero puedes personalizarlas para que coincidan con tus requerimientos específicos o recursos existentes en Azure.

### 3.1 Variables requeridas 

```bash title="" linenums="0"
# Configuración central de Azure
AZURE_ENV_NAME                    # Nombre del entorno (usado en la denominación de recursos)
AZURE_LOCATION                    # Región de despliegue
AZURE_SUBSCRIPTION_ID             # Suscripción objetivo
AZURE_RESOURCE_GROUP              # Nombre del grupo de recursos
AZURE_PRINCIPAL_ID                # Principal del usuario para RBAC

# Nombres de recursos (generados automáticamente si no se especifican)
AZURE_AIHUB_NAME                  # Nombre del hub de Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nombre del proyecto de IA
AZURE_AISERVICES_NAME             # Nombre de la cuenta de servicios de IA
AZURE_STORAGE_ACCOUNT_NAME        # Nombre de la cuenta de almacenamiento
AZURE_CONTAINER_REGISTRY_NAME     # Nombre del registro de contenedores
AZURE_KEYVAULT_NAME               # Nombre del Key Vault (si se usa)
```

### 3.2 Configuración del modelo 
```bash title="" linenums="0"
# Configuración del modelo de chat
AZURE_AI_AGENT_MODEL_NAME         # Predeterminado: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Predeterminado: OpenAI (o Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Predeterminado: último disponible
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nombre de implementación para el modelo de chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Predeterminado: Estándar
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Predeterminado: 80 (miles de TPM)

# Configuración del modelo de incrustación
AZURE_AI_EMBED_MODEL_NAME         # Predeterminado: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Predeterminado: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Predeterminado: último disponible
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nombre de implementación para las incrustaciones
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Predeterminado: Estándar
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Predeterminado: 50 (miles de TPM)

# Configuración del agente
AZURE_AI_AGENT_NAME               # Nombre para mostrar del agente
AZURE_EXISTING_AGENT_ID           # Usar agente existente (opcional)
```

### 3.3 Alternar características
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

### 3.4 Configuración del proyecto de IA 
```bash title="" linenums="0"
# Usar recursos existentes
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo del recurso del proyecto de IA existente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL del punto final del proyecto existente
```

### 3.5 Comprueba tus variables

Usa Azure Developer CLI para ver y gestionar tus variables de entorno:

```bash title="" linenums="0"
# Ver todas las variables de entorno para el entorno actual
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
**Aviso Legal**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No somos responsables de malentendidos o interpretaciones incorrectas derivadas del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->