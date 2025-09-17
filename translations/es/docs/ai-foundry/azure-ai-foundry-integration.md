<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "894be87a84e7f669a164d4f67545c8ac",
  "translation_date": "2025-09-17T15:02:10+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "es"
}
-->
# Integración de Azure AI Foundry con AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../getting-started/first-project.md)
- **➡️ Siguiente**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

## Descripción general

Esta guía muestra cómo integrar los servicios de Azure AI Foundry con Azure Developer CLI (AZD) para facilitar el despliegue de aplicaciones de IA. Azure AI Foundry ofrece una plataforma integral para crear, desplegar y gestionar aplicaciones de IA, mientras que AZD simplifica el proceso de infraestructura y despliegue.

## ¿Qué es Azure AI Foundry?

Azure AI Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de modelos**: Acceso a modelos de IA de última generación
- **Prompt Flow**: Diseñador visual para flujos de trabajo de IA
- **Portal de AI Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de despliegue**: Múltiples opciones de alojamiento y escalado
- **Seguridad y protección**: Funciones integradas de IA responsable

## AZD + Azure AI Foundry: Mejor juntos

| Característica | Azure AI Foundry | Beneficio de la integración con AZD |
|----------------|------------------|-------------------------------------|
| **Despliegue de modelos** | Despliegue manual en el portal | Despliegues automatizados y repetibles |
| **Infraestructura** | Aprovisionamiento mediante clics | Infraestructura como código (Bicep) |
| **Gestión de entornos** | Enfoque en un solo entorno | Multi-entorno (desarrollo/staging/producción) |
| **Integración CI/CD** | Limitada | Soporte nativo para GitHub Actions |
| **Gestión de costos** | Monitoreo básico | Optimización de costos específica por entorno |

## Requisitos previos

- Suscripción a Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a los servicios de Azure OpenAI
- Familiaridad básica con Azure AI Foundry

## Patrones principales de integración

### Patrón 1: Integración con Azure OpenAI

**Caso de uso**: Desplegar aplicaciones de chat con modelos de Azure OpenAI

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Infraestructura (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Patrón 2: Integración de búsqueda de IA + RAG

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

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Patrón 3: Integración de inteligencia documental

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

**Configuración de producción:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

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

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
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

## Flujos de trabajo de despliegue

### Despliegue con un solo comando

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
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

## Monitoreo y observabilidad

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
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Monitoreo de costos

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
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

## 🔐 Mejores prácticas de seguridad

### Configuración de identidad administrada

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

### Seguridad de red

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

## Optimización del rendimiento

### Estrategias de caché

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
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

### Configuración de autoescalado

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

## Resolución de problemas comunes

### Problema 1: Cuota de OpenAI excedida

**Síntomas:**
- El despliegue falla con errores de cuota
- Errores 429 en los registros de la aplicación

**Soluciones:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Fallos de autenticación

**Síntomas:**
- Errores 401/403 al llamar a servicios de IA
- Mensajes de "Acceso denegado"

**Soluciones:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas de despliegue de modelos

**Síntomas:**
- Los modelos no están disponibles en el despliegue
- Fallos en versiones específicas de modelos

**Soluciones:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Plantillas de ejemplo

### Aplicación básica de chat

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Cognitive Search + App Service

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Pipeline de procesamiento de documentos

**Repositorio**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Servicios**: Document Intelligence + Storage + Functions

**Inicio rápido**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat empresarial con RAG

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Inicio rápido**:
```bash
azd init --template contoso-chat
azd up
```

## Próximos pasos

1. **Prueba los ejemplos**: Comienza con una plantilla preconstruida que se ajuste a tu caso de uso
2. **Personaliza según tus necesidades**: Modifica la infraestructura y el código de la aplicación
3. **Añade monitoreo**: Implementa observabilidad completa
4. **Optimiza costos**: Ajusta configuraciones para tu presupuesto
5. **Asegura tu despliegue**: Implementa patrones de seguridad empresarial
6. **Escala a producción**: Añade características de alta disponibilidad y multi-región

## Comunidad y soporte

- **Discord de Azure AI Foundry**: [Canal #Azure](https://discord.gg/microsoft-azure)
- **GitHub de AZD**: [Problemas y discusiones](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentación oficial](https://learn.microsoft.com/azure/ai-studio/)

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../getting-started/first-project.md)
- **➡️ Siguiente**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un problema en el repositorio. ¡La comunidad de Azure AI + AZD está aquí para ayudarte a tener éxito!

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por garantizar la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse como la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.