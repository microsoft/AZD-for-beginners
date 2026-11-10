# Integración de Microsoft Foundry con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo con enfoque en IA
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Resumen

Esta guía demuestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para implementaciones simplificadas de aplicaciones de IA. Microsoft Foundry ofrece una plataforma integral para construir, desplegar y administrar aplicaciones de IA, mientras que AZD simplifica el proceso de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de Modelos**: Acceso a modelos de IA de última generación
- **Flujo de Prompts**: Diseñador visual para flujos de trabajo de IA
- **Portal de Microsoft Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de Despliegue**: Múltiples opciones de hospedaje y escalamiento
- **Seguridad y Protección**: Funciones integradas de IA responsable

## AZD + Microsoft Foundry: Mejor Juntos

| Característica | Microsoft Foundry | Beneficio de Integración con AZD |
|---------|-----------------|------------------------|
| **Despliegue de Modelos** | Despliegue manual desde portal | Despliegues automatizados y repetibles |
| **Infraestructura** | Aprovisionamiento por clic | Infraestructura como Código (Bicep) |
| **Gestión de Entornos** | Enfoque en un único entorno | Entornos múltiples (dev/staging/prod) |
| **Integración CI/CD** | Limitada | Soporte nativo para GitHub Actions |
| **Gestión de Costos** | Monitoreo básico | Optimización de costos específica por entorno |

## Prerrequisitos

- Suscripción de Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a los servicios de Modelos de Microsoft Foundry
- Conocimiento básico de Microsoft Foundry

> **Revisión de lanzamiento (2026-11-04):** La guía AI CLI fue revisada contra la documentación/fuente de `azd` `1.37.2`, agentes `1.0.0-beta.23` y evaluaciones `1.0.0-beta.2`. Use `azd >= 1.37.0` para el flujo combinado. Véase [cambios y correcciones del lanzamiento](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); esta revisión no certifica cada plantilla o ejemplo de SDK contra un despliegue en vivo.

## Patrones de Integración Básicos

**Alcance de los ejemplos:** El Bicep a continuación contiene fragmentos ilustrativos de recursos, no una plantilla completa desplegable. La plantilla contenedora debe definir nombres, `location`, recursos referenciados, identidades, salidas y hosting de aplicaciones. Use un ejemplo vinculado como punto de partida ejecutable. Los ejemplos en Bash requieren autenticación con Azure CLI separada de `azd auth login`.

### Patrón 1: Integración de Modelos Microsoft Foundry

**Caso de Uso**: Implementar aplicaciones de chat con modelos Azure OpenAI en Microsoft Foundry

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

El invocador necesita una identidad administrada adjunta y `Cognitive Services OpenAI User` a nivel de cuenta; deshabilitar claves no otorga acceso. Verifique disponibilidad de región/modelo/SKU y cuota antes de desplegar.

### Patrón 2: Integración AI Search + RAG

**Caso de Uso**: Implementar aplicaciones de generación aumentada con recuperación (RAG)

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

No existe un recurso ARM `Microsoft.Search/searchServices/dataConnections` para esta integración. Configure un índice de Search, fuente de datos, indexador/conjunto de habilidades o vectorizador mediante las APIs de plano de datos de Search soportadas. Si Search llama a un modelo de embeddings, habilite su identidad administrada, otorgue el rol relevante del modelo y configure su habilidad/vectorizador de embeddings. Véase [vectorización integrada](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Patrón 3: Integración Document Intelligence

**Caso de Uso**: Flujos de trabajo de procesamiento y análisis de documentos

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

## 🔧 Patrones de Configuración

### Configuración de Variables de Entorno

Excepto por las configuraciones documentadas de AZD como `AZURE_LOCATION`, estos son **nombres de entrada de plantilla personalizada**. No tienen efecto a menos que la plantilla/aplicación los consuma mediante mapeos de parámetros y entorno de host. Para `azure-search-openai-demo`, use sus nombres reales como `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` y `AZURE_SEARCH_SERVICE_SKU` en su lugar. La capacidad del modelo no es SKU de cuenta.

**Configuración de Producción:**
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

**Configuración de Desarrollo:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Configuración Segura con Key Vault

Prefiera Entra ID con autenticación local de claves deshabilitada. Lo siguiente es sólo una **alternativa heredada de autenticación por clave** para aplicaciones que requieren claves: requiere una cuenta con autenticación por clave habilitada, la identidad de la aplicación adjunta a su host y acceso/red funcionando con Key Vault. No combine la recuperación de claves con `disableLocalAuth: true` esperando que las llamadas basadas en clave funcionen.

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

## Flujos de Trabajo de Despliegue

### Extensiones AZD para Foundry

AZD proporciona extensiones que añaden capacidades específicas de IA para trabajar con los servicios de Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Las extensiones de IA aún evolucionan rápido en vista previa. Si un comando se comporta diferente a lo mostrado aquí, actualice la extensión relevante antes de solucionar problemas en el proyecto.

### Despliegue con enfoque en Agentes usando `azd ai`

Use `azd ai agent init` interactivamente, o adopte una plantilla actual de proyecto `azure.yaml` para agentes conectada a Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` reemplaza la escritura obsoleta `--manifest`/`-m`; el manifiesto legado y configuración anidada de agentes todavía necesitan migración. Evalúe agentes con `azd ai eval` de `azure.ai.evaluations`, no con el flujo legado eliminado. Consulte [migración de evaluación](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) para configuración, ejecución y resultados.

Consulte [Comandos AI CLI de AZD](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para la referencia completa de comandos y opciones.

### Despliegue con Comando Único

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Despliegues Específicos por Entorno

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

## Monitoreo y Observabilidad

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

Esto aprovisiona un recurso de Insights, no instrumentación de telemetría. Una vez que su aplicación emita spans de llamadas a modelos externas, ejecute esta consulta ilustrativa en Application Insights Logs (adapte el filtro a los nombres reales de spans):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Monitoreo de Costos

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

Use un destinatario real y verifique permisos en el ámbito de facturación. Un presupuesto envía alertas; no es un límite de gasto.

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

Este fragmento de endpoint también necesita una zona/grupo DNS privado, enlaces VNet, conectividad VNet de aplicación y una política explícita de acceso público. Crear sólo un endpoint privado no deshabilita el acceso público.

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

Azure Cache para Redis Basic/Standard/Premium está en un [camino de retiro](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); use Azure Managed Redis para nuevos despliegues y siga su guía actual de plantilla/autenticación. Delimite las respuestas cacheadas de IA por autorización, modelo/instrucciones y versión de datos, con expiración; nunca comparta respuestas privadas sólo con texto de consulta.

### Configuración de Autoescalado

**Recurso parcial:** integre estas configuraciones de escala/ingreso en una aplicación de contenedor completa con entorno administrado, imagen de contenedor y límites de recursos. Más réplicas no aumentan la cuota del modelo.

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

## Solución de Problemas Comunes

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

La variable capacity arriba aplica sólo a una plantilla personalizada configurada para consumirla. Para el ejemplo RAG, use `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. No cambie `AZURE_LOCATION` para mover recursos existentes en su lugar; cree un entorno separado para una nueva región y planifique migración/limpieza.

### Problema 2: Fallas de Autenticación

**Síntomas:**
- Errores 401/403 al llamar servicios de IA
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

### Problema 3: Problemas con Despliegue de Modelos

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

Estas son alternativas, no comandos secuenciales. Inicie cada una en un directorio vacío separado. El destino explícito `.` mantiene la inicialización en su directorio actual; de lo contrario, AZD puede crear un directorio hijo con el nombre de la plantilla sin cambiar el directorio de trabajo del shell.

### Aplicación de Chat RAG (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descripción**: Aplicación de referencia RAG chat para preguntas sobre sus documentos, con recuperación de Azure AI Search. Revise modelos soportados actuales, características opcionales, guía de costos y endurecimiento para producción antes de usar; desplegar un ejemplo no hace una aplicación lista para producción.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Aplicación de Chat RAG (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descripción**: Equivalente en .NET/C# del ejemplo RAG chat en Python. Construido con ASP.NET Core Minimal API y frontend Blazor WebAssembly. Incluye chat por voz, soporte de visión GPT-4o-mini y cliente de escritorio/móvil híbrido .NET MAUI Blazor complementario.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Aplicación de Chat RAG (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descripción**: Versión Java del ejemplo RAG chat usando Langchain4J para orquestación de IA. Soporta arquitectura microservicios orientada a eventos, múltiples estrategias de búsqueda (texto, vector, híbrida), carga de documentos con Azure Document Intelligence y despliegue en Azure Container Apps o Azure Kubernetes Service.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Copiloto Retail Empresarial con Microsoft Foundry

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descripción**: Copiloto retail RAG completo usando Microsoft Foundry y Prompty. Chatbot Contoso Outdoor que fundamenta respuestas en catálogo de productos y datos de órdenes de cliente. Demuestra el flujo completo GenAIOps — prototipo con Prompty, evaluación con evaluadores asistidos por IA y despliegue vía AZD a Container Apps.

**Inicio Rápido**:
```bash
azd init --template contoso-chat .
azd up
```

### Aplicación Multi-Agente de Escritura Creativa

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicios**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descripción**: Ejemplo multi-agente demostrando orquestación con agentes IA usando Prompty. Usa agente de investigación (Bing Grounding en Azure AI Agent Service), agente de producto (Azure AI Search), agente escritor y agente editor para producir artículos bien investigados en colaboración. Incluye CI/CD con evaluación en GitHub Actions.

**Inicio Rápido**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicios**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descripción**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions para la API y Azure Static Web Apps para hospedaje. Usa Azure Cosmos DB como vector store y base de datos de historial de chat. Soporta desarrollo local con Ollama para pruebas sin costo.

**Inicio Rápido**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Acelerador de Solución Chat con Sus Datos

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicios**: Microsoft Foundry + Azure Container Apps (web/API/ingestión) + Azure AI Search con Cosmos DB, o PostgreSQL con pgvector

**Descripción**: Acelerador de chat fundamentado en documentos con citas. El ejemplo actual hospeda frontend React, backend FastAPI y trabajador de ingestión Functions en Container Apps; las opciones de orquestación son Agent Framework y LangGraph. Las opciones de base de datos/recuperación se seleccionan al desplegar. Es un punto de partida, no un sistema llave en mano para producción; no asuma que variantes antiguas de App Service, Semantic Kernel o Prompt Flow describen el valor predeterminado actual.

**Inicio Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Agentes de Viaje AI — Orquestación MCP Multi-Agente

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicios**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descripción**: Aplicación de referencia para la orquestación de IA multi-agente usando tres frameworks (LangChain.js, LlamaIndex.TS y Microsoft Agent Framework). Incluye servidores MCP (Model Context Protocol) en cuatro lenguajes desplegados como Azure Container Apps sin servidor con supervisión OpenTelemetry.

**Inicio Rápido**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Explora más plantillas**: Visita la [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) para ver plantillas disponibles en varios lenguajes y escenarios. Cada ejemplo enlazado es un repositorio externo, no un ejemplo local suministrado por este curso; revisa sus prerrequisitos y recomendaciones de producción actuales antes del despliegue.

## Próximos Pasos

1. **Prueba los Ejemplos**: Comienza con una plantilla preconstruida que coincida con tu caso de uso
2. **Personaliza según tus Necesidades**: Modifica la infraestructura y el código de la aplicación
3. **Agrega Supervisión**: Implementa una observabilidad completa
4. **Optimiza Costos**: Ajusta configuraciones para tu presupuesto
5. **Asegura tu Despliegue**: Implementa patrones de seguridad empresarial
6. **Escala a Producción**: Agrega características multi-región y de alta disponibilidad

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Despliega la App de Chat de Microsoft Foundry Models (30 minutos)
**Objetivo**: Desplegar y probar una aplicación de referencia para chat de IA

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

# Clean up
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] El despliegue termina sin errores de cuota
- [ ] Se puede acceder a la interfaz de chat en el navegador
- [ ] Se pueden hacer preguntas y obtener respuestas impulsadas por IA
- [ ] Application Insights muestra datos de telemetría
- [ ] Recursos limpiados correctamente

**Costo:** Revisa la guía actual de costos y SKUs seleccionados antes de desplegar. La facturación continúa hasta que se eliminen los recursos; no existe una estimación fija de 30 minutos para todas las configuraciones.

### Ejercicio 2: Configura un Despliegue Multi-Modelo (45 minutos)
**Objetivo**: Desplegar múltiples modelos de IA con diferentes configuraciones

**Punto de partida:** Una cuenta de Azure OpenAI existente y un módulo de grupo de recursos AZD que pueda llamar a este archivo. Crea `infra/ai-models.bicep` con el siguiente contenido usando tu editor. No se despliega automáticamente solo porque esté bajo `infra/`.

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

Desde el módulo con ámbito de grupo de recursos que posee la cuenta, añade una invocación de módulo (adapta el nombre del símbolo a tu cuenta real):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

No declares los mismos despliegues en ambos módulos. Si el punto de entrada de AZD tiene ámbito de suscripción, invoca esto desde su módulo hijo con ámbito de grupo de recursos y ajusta la ruta relativa. Construye ese módulo contenedor con `az bicep build --file <path-to-containing-module>`, luego:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Criterios de Éxito:**
- [ ] Múltiples modelos desplegados con éxito
- [ ] Se aplicaron diferentes configuraciones de capacidad
- [ ] Modelos accesibles vía API
- [ ] Se puede llamar a ambos modelos desde la aplicación

### Ejercicio 3: Implementa Supervisión de Costos (20 minutos)
**Objetivo**: Configurar alertas de presupuesto y seguimiento de costos

**Punto de partida:** El patrón de presupuesto anterior y un módulo de infraestructura con ámbito de grupo de recursos. Añade este recurso usando tu editor; pasa `budgetStartDate` desde tu mapeo de parámetros (no dupliques el parámetro si ya está declarado). Reemplaza el destinatario y confirma que tienes permisos de escritura en el presupuesto.

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

Esperado: la respuesta contiene `amount: 200`, ambos umbrales y tu destinatario. Revisa Cost Management en el portal para cargos reales; los datos de costo se retrasan y no es obligatorio que una alerta se dispare durante un ejercicio corto.

**Criterios de Éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo configuradas
- [ ] Se pueden ver los datos de costos en el portal de Azure
- [ ] Umbrales de presupuesto ajustados apropiadamente

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Microsoft Foundry Models durante el desarrollo?</strong></summary>

1. **Verifica precios**: No existe una asignación gratuita universal de 50,000 tokens mensuales para modelos Azure OpenAI
2. **Ajusta la capacidad a lo necesario**: La capacidad `10` normalmente representa 10,000 TPM para estos modelos Standard de texto, no 10 TPM. Reducir este límite no reduce el precio por token
3. **Usa azd down**: Elimina recursos desechables cuando no estés desarrollando activamente (esto no es desasignación)
4. **Cachea respuestas**: Implementa caché Redis para consultas repetidas
5. **Usa ingeniería de prompts**: Reduce el uso de tokens con prompts eficientes

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre Microsoft Foundry Models y OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad y cumplimiento empresarial
- Integración con red privada
- Garantías SLA
- Autenticación con identidad administrada
- Cuotas más altas disponibles

**OpenAI API**: Proveedor/API separado con disponibilidad, precios, autenticación y opciones de conectividad empresarial propias. Compara ofertas actuales en vez de asumir que sólo es público o siempre lanza modelos primero.

Elige según los requisitos de tu organización; los ejemplos específicos de Azure con identidad administrada y enlace privado que presenta este curso aplican a servicios hospedados en Azure, no a todos los modelos/proveedores en el catálogo Foundry.
</details>

<details>
<summary><strong>¿Cómo manejo errores por superar cuota en Microsoft Foundry Models?</strong></summary>

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

¡Sí! Usa **Azure AI Search** para RAG (Generación Aumentada por Recuperación):

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

Consulta la plantilla [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>¿Cómo aseguro los endpoints de modelos de IA?</strong></summary>

**Mejores Prácticas**:
1. Usa Identidad Administrada (sin claves API)
2. Habilita Endpoints Privados
3. Configura grupos de seguridad de red
4. Implementa limitación de tasa
5. Usa Azure Key Vault para secretos

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
- **AZD GitHub**: [Issues y discusiones](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentación oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Habilidades de Agente**: [Habilidad Microsoft Foundry en skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instala habilidades de agente Azure + Foundry en tu editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Agentes de IA](agents.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un issue en el repositorio. ¡La comunidad Azure AI + AZD está aquí para ayudarte a tener éxito!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->