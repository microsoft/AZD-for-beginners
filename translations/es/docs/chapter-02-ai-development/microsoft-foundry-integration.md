# Integración de Microsoft Foundry con AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Agentes de IA](agents.md)
- **🚀 Siguiente capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Descripción general

Esta guía demuestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para despliegues simplificados de aplicaciones de IA. Microsoft Foundry ofrece una plataforma integral para construir, desplegar y gestionar aplicaciones de IA, mientras que AZD facilita el proceso de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para desarrollo de IA que incluye:

- **Catálogo de modelos**: Acceso a modelos de IA de última generación
- **Flujo de indicaciones**: Diseñador visual para flujos de trabajo de IA
- **Portal Microsoft Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de despliegue**: Múltiples opciones de alojamiento y escalado
- **Seguridad y protección**: Funciones integradas de IA responsable

## AZD + Microsoft Foundry: Mejor juntos

| Funcionalidad | Microsoft Foundry | Beneficio de la integración con AZD |
|---------|-----------------|------------------------|
| **Despliegue de modelos** | Despliegue manual en portal | Despliegues automáticos y repetibles |
| **Infraestructura** | Configuración de proyectos y recursos | Comienza con `azure.yaml`; exporta Bicep o Terraform cuando sea necesario |
| **Gestión de entornos** | Enfoque en un solo entorno | Multi-ambiente (dev/staging/prod) |
| **Integración CI/CD** | Servicios de despliegue y evaluación | Reutiliza configuración en GitHub Actions o Azure DevOps |
| **Control de costos** | Monitorización básica | Optimización de costos específica por entorno |

## Requisitos previos

- Suscripción de Azure con permisos apropiados
- Azure Developer CLI 1.37.0 o posterior para el flujo de trabajo GA de Foundry
- Acceso a los servicios de Microsoft Foundry Models
- Familiaridad básica con Microsoft Foundry

> **Actualización GA de Foundry (2026-11-09):** El bundle de extensión `microsoft.foundry` alcanzó la versión 1.0 y disponibilidad general el [5 de noviembre de 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). El recorrido a continuación sigue ese anuncio y la guía rápida de Microsoft Learn enlazada. Esta es una revisión de documentación, no una validación de despliegue en vivo. Las funciones previas opcionales y las extensiones publicadas independientemente mantienen su propio estado de lanzamiento.

**Resultados de aprendizaje:** Instalar el bundle GA, revisar el `azure.yaml` de un agente, comparar respuestas locales y desplegadas, y explicar límites de evaluación, CI/CD y limpieza. Para un despliegue paso a paso del agente, visita el [recorrido de agente alojado](#hosted-agent-walkthrough-ga). Los fragmentos de recursos a continuación cubren otros patrones de integración.

## Patrones principales de integración

**Alcance de los ejemplos:** El Bicep abajo contiene fragmentos ilustrativos de recursos, no una plantilla completa desplegable. La plantilla contenedora debe definir nombres, `location`, recursos referenciados, identidades, salidas y hospedaje de aplicaciones. Usa una muestra vinculada para un punto de partida ejecutable. Los ejemplos Bash requieren autenticación con Azure CLI separada de `azd auth login`.

### Patrón 1: Integración de Microsoft Foundry Models

**Caso de uso**: Desplegar aplicaciones de chat con modelos Azure OpenAI en Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

**Infraestructura (main.bicep):**
```bicep
// Microsoft Foundry Models Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: true
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

El llamador necesita una identidad administrada adjunta y `Cognitive Services OpenAI User` a nivel de cuenta; deshabilitar claves no otorga acceso. Verifica disponibilidad de región/modelo/SKU y cuota antes del despliegue.

### Patrón 2: Integración AI Search + RAG

**Caso de uso**: Desplegar aplicaciones de generación aumentada por recuperación (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

```

No existe un recurso ARM `Microsoft.Search/searchServices/dataConnections` para esta integración. Configura un índice Search, fuente de datos, indexador/conjunto de habilidades o vectorizador mediante las APIs de plano de datos de Search soportadas. Si Search llama a un modelo de embeddings, habilita su identidad administrada, concede el rol relevante y configura su habilidad/vectorizador de embeddings. Consulta [vectorización integrada](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Patrón 3: Integración de Document Intelligence

**Caso de uso**: Flujos de trabajo de procesamiento y análisis de documentos

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Patrones de configuración

### Configuración de variables de entorno

Excepto las configuraciones AZD documentadas como `AZURE_LOCATION`, estos son **nombres de entrada de plantillas personalizadas**. No tienen efecto a menos que la plantilla/aplicación los consuma mediante parámetros y mapeos de entorno anfitrión. Para `azure-search-openai-demo`, usa sus nombres reales como `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` y `AZURE_SEARCH_SERVICE_SKU` en su lugar. La capacidad del modelo no es SKU de cuenta.

**Configuración de producción:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuración de desarrollo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configuración segura con Key Vault

Prefiere Entra ID con autenticación local de claves deshabilitada. Lo siguiente es solo una **alternativa heredada de autenticación por clave** para aplicaciones que requieren claves: necesita una cuenta con autenticación por clave habilitada, identidad de aplicación adjunta a su host y acceso/red funcional a Key Vault. No combines recuperación de clave con `disableLocalAuth: true` esperando que llamadas basadas en clave funcionen.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Flujos de despliegue

### Extensiones AZD para Foundry

Para el flujo de trabajo GA, instala el bundle `microsoft.foundry` en lugar de armar las extensiones principales una por una:

```bash
# Check the core CLI, then sign in and install the GA bundle
azd version
azd auth login
azd ext install microsoft.foundry

# Verify installation and update the bundle when needed
azd ext list --installed
azd ext upgrade microsoft.foundry
```

El bundle instala agentes, conexiones, inspector, proyectos, rutinas, habilidades y cajas de herramientas. No añade un grupo de comandos `microsoft.foundry`. Evaluaciones, conjuntos de datos, ajuste fino y modelos personalizados se instalan aparte cuando se necesitan. Consulta la [referencia de empaquetado de extensiones](https://learn.microsoft.com/azure/foundry/agents/how-to/install-cli-foundry-extensions).

### Recorrido del agente alojado (GA)

Un **agente alojado** ejecuta el código de tu agente en cómputo gestionado por Foundry. Este ejercicio usa la muestra oficial de API básica Python Agent Framework Responses, no los fragmentos clásicos del Agent Service SDK en otras lecciones.

#### 1. Preparar e inicializar

Usa un directorio vacío fuera de esta revisión del curso. Instala Python 3.13 o posterior y una versión reciente de [uv release](https://docs.astral.sh/uv/getting-started/installation/). Las instalaciones uv independientes pueden usar `uv self update`. Revisa [permisos de agente alojado](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions), disponibilidad de modelo y cuota en tu suscripción y región antes de aprovisionar. Los recursos Azure y llamadas de modelo local generan costos.

Completa la instalación de `azd auth login` y el bundle arriba. El código muestra local usa `DefaultAzureCredential`; si usas credenciales Azure CLI, inicia sesión con `az login` usando la misma cuenta y inquilino que AZD. El inicio de sesión de AZD solo no es un inicio de sesión Azure CLI.

Ejecuta este comando de una línea en Bash o PowerShell:

```text
azd ai agent init --template https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml --deploy-mode code --src .
```

Elige un proyecto Foundry nuevo o existente y la suscripción y región deseadas. Para reutilizar un despliegue de modelo, añade `--model-deployment <existing-deployment-name>` al comando de inicialización **antes de ejecutarlo**, y selecciona el proyecto existente. Mantente en el directorio que contiene `azure.yaml` generado para los comandos restantes.

#### 2. Revisión de la definición de despliegue

Abre `azure.yaml` y ubica estas configuraciones en la [muestra oficial](https://github.com/microsoft-foundry/foundry-samples/blob/main/samples/python/hosted-agents/agent-framework/responses/01-basic/azure.yaml):

| Configuración | Qué verificar |
|---------|---------------|
| `host: azure.ai.project` y `deployments` | Proyecto Foundry previsto y nombre del modelo, versión, SKU de despliegue y capacidad |
| `host: azure.ai.agent` y `project` | Agente alojado y directorio que contiene su código fuente |
| `codeConfiguration` | Runtime Python y punto de entrada; la muestra revisada usa `python_3_13` y `main.py` |
| `uses` | Dependencia del servicio del proyecto Foundry |
| `container.resources` | Asignación de CPU y memoria, aunque el código se construye remotamente |
| `env` | Mapeo de despliegue del modelo y `PYTHONNOUSERSITE: "1"` para deshabilitar la carga de paquetes del sitio del usuario |
| `infra.provider` | `microsoft.foundry`, que sintetiza la infraestructura requerida |

Confirma la revisión de `azure.yaml` y el código del agente juntos. No se requiere infraestructura escrita a mano para comenzar; cuando necesites archivos de aprovisionamiento editables, sigue la [extracción de infraestructura](https://learn.microsoft.com/azure/foundry/agents/concepts/cli-infrastructure) para Bicep o Terraform y continúa usando `azd provision`. No comprometas credenciales ni estado de entorno `.azure/`.

#### 3. Aprovisionar y probar localmente

```bash
azd provision
azd ai agent run
```

El aprovisionamiento puede crear despliegues de modelo faltantes **incluso en un proyecto reutilizado**. Revisa los prompts del modelo y selecciona un tipo de despliegue en línea disponible como Global Standard o Data Zone Standard; la cuota y soporte regional varían.

La ejecución local prepara dependencias y abre **Agent Inspector**, donde puedes inspeccionar solicitudes, respuestas y actividad de herramientas/modelos. Déjalo corriendo y abre una segunda terminal en el mismo directorio del proyecto:

```bash
azd ai agent invoke --local "Explain one benefit of keeping agent deployment settings with application code."
```

**Punto de control:** Confirma que recibes una respuesta relevante y puedes inspeccionar la actividad local asociada. La ejecución local aún llama a tu despliegue de modelo Azure; no es una prueba offline ni gratuita. Usa indicaciones sintéticas y evita exponer secretos o datos sensibles en la salida del inspector.

#### 4. Desplegar y comparar

Detén la ejecución local con Ctrl+C cuando termines. Antes de la invocación remota, configura o verifica la [conexión y acceso a lectura de trazas de Application Insights](https://learn.microsoft.com/azure/foundry/tutorials/quickstart-create-foundry-resources#connect-application-insights-for-agent-tracing) del proyecto.

```bash
azd deploy
azd ai agent invoke "Explain one benefit of keeping agent deployment settings with application code."
```

En modo de despliegue por código, AZD carga el código fuente para una construcción Foundry remota; no necesitas construir un contenedor local para esta ruta. La salida del despliegue provee enlaces al playground y endpoint. Verifica una respuesta del agente desplegado y su traza en la nube; solo eventos del inspector local no prueban que el rastreo en la nube funciona.

Para cambios posteriores, revisa la configuración soportada para agente alojado con `azd deploy --preview`. Transmite logs con `azd ai agent monitor --follow`, o diagnostica problemas de configuración y acceso con `azd ai agent doctor`. Una vista previa de despliegue no es una revisión completa de infraestructura o seguridad.

#### 5. Añadir una verificación de calidad repetible

Instala la extensión de evaluaciones publicada independientemente, luego genera activos de prueba borrador:

```bash
azd ext install azure.ai.evaluations
azd ai eval generate
```

Describe el comportamiento previsto del agente y selecciona **Dataset y evaluador**, luego **Turn**. Revisa y edita los casos generados y la rúbrica de calificación, incluido un caso de pregunta no soportada, antes de configurar la evaluación:

```bash
azd ai eval init --name quality
```

Selecciona el dataset y la rúbrica revisados y confirma el despliegue del modelo juez. Inspecciona `evals/azure.eval.yaml` y su referencia de servicio de evaluación en `azure.yaml`, luego registra los activos y ejecuta:

```bash
azd up
azd ai eval run start --eval quality
```

Inspecciona puntuaciones y casos fallidos o con errores; una evaluación completada no es automáticamente una aprobación de calidad. La generación y puntuación también generan costos de modelo. Compromete configuración no secreta, datasets y rúbricas para que el equipo pueda comparar cambios. `azd ai agent optimize` puede reutilizar una evaluación compatible como línea base, pero revisa candidatos antes de desplegar uno explícitamente. Consulta [puertas de calidad y migración](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para proyectos antiguos y CI.

#### 6. Reutilizar el flujo de trabajo en CI/CD

Después de un exitoso `azd up`, ejecuta `azd pipeline config` y revisa el flujo de trabajo GitHub Actions o Azure DevOps generado. Instala `microsoft.foundry` en el runner, además de `azure.ai.evaluations` si ejecutas evaluaciones. Conserva la configuración de checkout, inicio de sesión y entorno generadas; solo la instalación no autentica la pipeline.

Usa un entorno AZD separado por etapa, concede a la identidad de la pipeline los permisos requeridos de recursos y Foundry, y mantén credenciales en secretos de pipeline o usa identidad federada. Compromete activos de evaluación y verifica que la identidad pueda acceder a datasets/evaluadores referenciados. Consulta el [ejemplo de pipeline del curso](../chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration) y la [guía Foundry CI/CD](https://learn.microsoft.com/azure/foundry/agents/how-to/set-up-ci-cd-cli).

#### 7. Limpiar deliberadamente

Para un **proyecto nuevo creado por este entorno**, revisa los recursos listados por `azd down` antes de confirmar: elimina el grupo de recursos y todo lo que contiene.

Para un **proyecto reutilizado**, `azd down` deja el proyecto, agente alojado y otros recursos en su lugar. Elimina solo recursos no deseados que poseas usando la [guía rápida de limpieza](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources); no elimines un grupo de recursos compartido para limpiar un ejercicio.

**Verificación final:** Explica qué configuraciones controlan el comportamiento local y en la nube, muestra respuestas locales y desplegadas, revisa un resultado de evaluación e identifica qué recursos permanecen tras la limpieza.

### Opcional: Crear andamiaje con la Skill Microsoft Foundry

Instala la [Skill Microsoft Foundry](https://learn.microsoft.com/azure/foundry/how-to/develop/use-microsoft-foundry-skill) para tu host de agente de codificación, luego abre una carpeta vacía separada. Pídele que genere el ejemplo básico Python Agent Framework Responses API en modo despliegue de código, explique el `azure.yaml` generado y proponga suscripción, región, proyecto y despliegue de modelo. Requiere aprobación **antes de crear recursos Azure**, solicita una prueba local, y detente antes del despliegue. Revisa su salida y continúa con los pasos de despliegue arriba solo cuando estés listo.

Para proyectos existentes, `--template`/`-t` reemplaza la ortografía obsoleta `--manifest`/`-m`; cambiar la bandera no migra manifiestos antiguos ni configuraciones anidadas de agentes. Consulte la [referencia de AI CLI](../chapter-08-production/production-ai-practices.md#initializing-agent-projects-with-azd-ai-agent-init).

### Despliegue con un solo comando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Despliegues específicos por entorno

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Supervisión y Observabilidad

### Integración con Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
```

Esto aprovisiona un recurso de Insights, no instrumentación de telemetría. Cuando su aplicación emita spans de llamadas salientes a modelos, ejecute esta consulta ilustrativa en Application Insights Logs (adapte el filtro a los nombres reales de sus spans):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitorización de Costos

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

Use un destinatario real y verifique los permisos del ámbito de facturación. Un presupuesto envía alertas; no es un límite de gasto.

## 🔐 Mejores Prácticas de Seguridad

### Configuración de Identidad Administrada

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Seguridad de Red

Este fragmento de endpoint también requiere una zona/grupo DNS privado, enlaces VNet, conectividad VNet de la aplicación, y una política explícita de acceso público. Crear un endpoint privado por sí solo no deshabilita el acceso público.

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Optimización de Rendimiento

### Estrategias de Caché

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

Azure Cache para Redis Basic/Standard/Premium está en un [camino de retiro](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis para nuevos despliegues y siga su guía actual de plantillas/autenticación. Encamine las respuestas AI en caché por autorización, modelo/instrucciones, y versión de datos, con expiración; nunca comparta respuestas privadas usando sólo el texto de consulta.

### Configuración de Autoescalado

**Recurso parcial:** integre estas configuraciones de escala/ingreso en una aplicación de contenedor completa con un entorno administrado, imagen de contenedor, y límites de recursos. Más réplicas no incrementan la cuota del modelo.

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Resolución de Problemas Comunes

### Problema 1: Cuota de OpenAI Excedida

**Síntomas:**
- El despliegue falla con errores de cuota
- Errores 429 en los registros de la aplicación

**Soluciones:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

La variable capacidad anterior aplica sólo a una plantilla personalizada configurada para usarla. Para el ejemplo RAG, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. No cambie `AZURE_LOCATION` para mover recursos existentes; cree un entorno separado para una nueva región y planifique migración/limpieza.

### Problema 2: Fallos de Autenticación

**Síntomas:**
- Errores 401/403 al llamar a servicios AI
- Mensajes de "Acceso denegado"

**Soluciones:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Problema 3: Problemas de Despliegue de Modelos

**Síntomas:**
- Modelos no disponibles en el despliegue
- Versiones específicas de modelos fallando

**Soluciones:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Plantillas de Ejemplo

Son alternativas, no comandos secuenciales. Inicie cada una en un directorio vacío separado. El destino `.` explícito mantiene la inicialización en su directorio actual; de lo contrario AZD actual puede crear un subdirectorio nombrado como la plantilla sin cambiar el directorio de trabajo del shell.

### Aplicación de Chat RAG (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descripción**: Aplicación de referencia de chat RAG para preguntas sobre sus documentos, con recuperación Azure AI Search. Revise los modelos soportados actuales, características opcionales, guía de costos y endurecimiento para producción antes de usar; desplegar un ejemplo no hace la aplicación lista para producción.

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicación de Chat RAG (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descripción**: Equivalente .NET/C# del ejemplo Python RAG chat. Construido con ASP.NET Core Minimal API y frontend Blazor WebAssembly. Incluye chat por voz, soporte GPT-4o-mini visión, y cliente híbrido .NET MAUI Blazor para escritorio/móvil.

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicación de Chat RAG (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descripción**: Versión Java del ejemplo RAG chat usando Langchain4J para orquestación AI. Soporta arquitectura orientada a microservicios por eventos, múltiples estrategias de búsqueda (texto, vector, híbrida), carga de documentos con Azure Document Intelligence, y despliegue en Azure Container Apps o Azure Kubernetes Service.

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copiloto Empresarial para Retail con Microsoft Foundry

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descripción**: Copiloto retail RAG de extremo a extremo usando Microsoft Foundry y Prompty. Un chatbot para Contoso Outdoor que fundamenta respuestas en catálogo de productos y datos de pedidos de clientes. Demuestra el flujo completo GenAIOps — prototipo con Prompty, evalúe con evaluadores asistidos por AI, y despliegue vía AZD a Container Apps.

**Inicio rápido**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicación Multi-Agente de Escritura Creativa

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicios**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descripción**: Ejemplo multi-agente que muestra orquestación AI con Prompty. Usa un agente investigador (Bing Grounding en Azure AI Agent Service), un agente de producto (Azure AI Search), un agente escritor, y un agente editor para producir colaborativamente artículos bien investigados. Incluye CI/CD con evaluación en GitHub Actions.

**Inicio rápido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicios**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descripción**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions para la API y Azure Static Web Apps para hosting. Usa Azure Cosmos DB tanto como base de vectores como base de historial de chat. Soporta desarrollo local con Ollama para pruebas sin costo.

**Inicio rápido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acelerador de Solución Chat con Tus Datos

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicios**: Microsoft Foundry + Azure Container Apps (web/API/ingestión) + Azure AI Search con Cosmos DB, o PostgreSQL con pgvector

**Descripción**: Acelerador de chat basado en documentos con citaciones. El ejemplo actual aloja un frontend React, backend FastAPI, y worker de ingestión Functions en Container Apps; opciones de orquestador son Agent Framework y LangGraph. Bases de datos/opciones de recuperación se seleccionan en despliegue. Es un punto de partida, no un sistema de producción llave en mano; no asuma que variantes antiguas de App Service, Semantic Kernel, o Prompt Flow describen el predeterminado actual.

**Inicio rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agentes de Viaje AI — Orquestación Multi-Agente MCP

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicios**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descripción**: Aplicación de referencia para orquestación AI multi-agente usando tres frameworks (LangChain.js, LlamaIndex.TS, y Microsoft Agent Framework). Incluye servidores MCP (Model Context Protocol) en cuatro lenguajes desplegados como Azure Container Apps serverless con monitoreo OpenTelemetry.

**Inicio rápido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Ver más plantillas**: Visite la [Galería Increíble de Plantillas AZD AI](https://azure.github.io/awesome-azd/?tags=ai) para plantillas disponibles por lenguajes y escenarios. Cada ejemplo enlazado es un repositorio externo, no un ejemplo local provisto por este curso; inspeccione sus prerrequisitos y guías de producción antes del despliegue.

## Próximos Pasos

1. **Pruebe los Ejemplos**: Comience con una plantilla pre-construida que coincida con su caso de uso
2. **Personalice para sus Necesidades**: Modifique la infraestructura y el código de la aplicación
3. **Agregue Monitorización**: Implemente observabilidad completa
4. **Optimice Costos**: Ajuste la configuración para su presupuesto
5. **Asegure su Despliegue**: Implemente patrones de seguridad empresarial
6. **Escale a Producción**: Agregue características multi-región y alta disponibilidad

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Desplegar Aplicación de Chat de Microsoft Foundry Models (30 minutos)
**Objetivo**: Desplegar y probar una aplicación de chat AI de referencia

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Review the listed resources and confirm cleanup
azd down
```

**Criterios de Éxito:**
- [ ] El despliegue se completa sin errores de cuota
- [ ] Se puede acceder a la interfaz de chat en el navegador
- [ ] Se pueden hacer preguntas y obtener respuestas con AI
- [ ] Application Insights muestra datos de telemetría
- [ ] Se limpiaron los recursos correctamente

**Costo:** Revise la guía de costos actual y los SKU seleccionados antes de desplegar. La facturación continúa hasta que se eliminan los recursos; no hay un tiempo fijo de 30 minutos para todas las configuraciones.

### Ejercicio 2: Configurar Despliegue Multi-Modelo (45 minutos)
**Objetivo**: Desplegar múltiples modelos AI con diferentes configuraciones

**Punto de partida:** Una cuenta Azure OpenAI existente y un módulo AZD con ámbito de grupo de recursos que pueda llamar este archivo. Cree `infra/ai-models.bicep` con el siguiente contenido usando su editor. No se despliega automáticamente sólo por estar bajo `infra/`.

```bicep
param openAiAccountName string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Desde el módulo con ámbito de grupo de recursos propietario de la cuenta, agregue una invocación de módulo (adapte el nombre simbólico a su cuenta real):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

No declare los mismos despliegues en ambos módulos. Si el punto de entrada AZD tiene ámbito de suscripción, invoque esto desde su módulo hijo con ámbito de grupo de recursos y ajuste la ruta relativa. Construya ese módulo contenedor con `az bicep build --file <path-to-containing-module>`, luego:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Criterios de Éxito:**
- [ ] Múltiples modelos desplegados con éxito
- [ ] Diferentes configuraciones de capacidad aplicadas
- [ ] Modelos accesibles vía API
- [ ] Se puede llamar a ambos modelos desde la aplicación

### Ejercicio 3: Implementar Monitorización de Costos (20 minutos)
**Objetivo**: Configurar alertas de presupuesto y seguimiento de costos

**Punto de partida:** El patrón de presupuesto anterior y un módulo de infraestructura con ámbito de grupo de recursos. Agregue este recurso usando su editor; pase `budgetStartDate` desde su mapeo de parámetros (no duplique el parámetro si ya está declarado). Reemplace el destinatario y confirme acceso de escritura al presupuesto.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Se espera: la respuesta contiene `amount: 200`, ambos umbrales, y su destinatario. Inspeccione Cost Management en el portal para cargos reales; los datos de costos tienen demora y una alerta puede no activarse durante un ejercicio corto.

**Criterios de Éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo configuradas
- [ ] Se pueden ver datos de costos en Azure Portal
- [ ] Umbrales de presupuesto configurados adecuadamente

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Microsoft Foundry Models durante el desarrollo?</strong></summary>

1. **Verifique precios**: No hay una asignación mensual gratuita universal de 50,000 tokens para modelos Azure OpenAI
2. **Dimensione correctamente la capacidad**: La capacidad `10` típicamente representa 10,000 TPM para estos modelos Standard de texto, no 10 TPM. Reducir este límite de tasa no reduce el precio por token
3. **Use azd down**: Elimine recursos temporales cuando no esté desarrollando activamente (esto no es desasignación)
4. **Cachear Respuestas**: Implemente caché Redis para consultas repetidas
5. **Use Ingeniería de Prompts**: Reduzca uso de tokens con prompts eficientes

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre Microsoft Foundry Models y la API OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad empresarial y cumplimiento
- Integración en red privada
- Garantías SLA
- Autenticación con identidad administrada
- Cuotas más altas disponibles

**API OpenAI**: Un proveedor/API separado con su propia disponibilidad de modelos, precios, autenticación, y opciones de conectividad empresarial. Compare las ofertas actuales en vez de asumir que sólo es pública o siempre lanza modelos primero.

Elija según los requerimientos de su organización; ejemplos específicos de Azure con identidad administrada y enlace privado en este curso aplican a servicios hospedados en Azure, no a todos los modelos/proveedores del catálogo Foundry.
</details>

<details>
<summary><strong>¿Cómo manejo errores de cuota excedida en Microsoft Foundry Models?</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>¿Puedo usar mis propios datos con Microsoft Foundry Models?</strong></summary>

¡Sí! Use **Azure AI Search** para RAG (Generación Aumentada por Recuperación):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Consulte la plantilla [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>¿Cómo aseguro los puntos finales de modelos de IA?</strong></summary>

**Mejores prácticas**:
1. Usar Identidad Administrada (sin claves API)
2. Habilitar puntos finales privados
3. Configurar grupos de seguridad de red
4. Implementar limitación de tasa
5. Usar Azure Key Vault para secretos

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Comunidad y Soporte

- **Microsoft Foundry Discord**: [canal #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Problemas y discusiones](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentación oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Habilidades del agente**: [Habilidad Microsoft Foundry en skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instala habilidades de agentes de Azure + Foundry en tu editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación por el capítulo:**
- **📚 Inicio del curso**: [AZD Para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo orientado a IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Agentes de IA](agents.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un problema en el repositorio. La comunidad Azure AI + AZD está aquí para ayudarte a tener éxito.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->