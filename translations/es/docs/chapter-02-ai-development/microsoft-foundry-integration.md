# Integración de Microsoft Foundry con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-Primero
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de Modelo AI](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Visión General

Esta guía demuestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para facilitar los despliegues de aplicaciones de IA. Microsoft Foundry proporciona una plataforma integral para construir, desplegar y administrar aplicaciones de IA, mientras que AZD simplifica el proceso de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de Modelos**: Acceso a modelos de IA de última generación
- **Prompt Flow**: Diseñador visual para flujos de trabajo de IA
- **Portal Microsoft Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de Despliegue**: Múltiples opciones de alojamiento y escalado
- **Seguridad y Protección**: Funciones integradas de IA responsable

## AZD + Microsoft Foundry: Mejor Juntos

| Característica | Microsoft Foundry | Beneficio de la Integración con AZD |
|---------------|-------------------|------------------------------------|
| **Despliegue de Modelos** | Despliegue manual vía portal | Despliegues automatizados y repetibles |
| **Infraestructura** | Aprovisionamiento mediante clics | Infraestructura como Código (Bicep) |
| **Gestión de Entornos** | Enfoque en un solo entorno | Múltiples entornos (dev/pruebas/producción) |
| **Integración CI/CD** | Limitada | Soporte nativo para GitHub Actions |
| **Gestión de Costos** | Monitorización básica | Optimización de costos por entorno |

## Requisitos Previos

- Suscripción de Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a servicios de Microsoft Foundry Models
- Conocimiento básico de Microsoft Foundry

## Patrones Clave de Integración

### Patrón 1: Integración con Microsoft Foundry Models

**Caso de Uso**: Desplegar aplicaciones de chat con modelos de Microsoft Foundry Models

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

### Patrón 2: Integración AI Search + RAG

**Caso de Uso**: Desplegar aplicaciones de generación aumentada por recuperación (RAG)

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

**Configuración de Producción:**
```bash
# Servicios principales de IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configuraciones del modelo
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Configuraciones de rendimiento
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuración de Desarrollo:**
```bash
# Configuraciones optimizadas para costos para desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nivel gratuito
```

### Configuración Segura con Key Vault

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

## Flujos de Trabajo de Despliegue

### Extensiones AZD para Foundry

AZD ofrece extensiones que añaden capacidades específicas de IA para trabajar con servicios Microsoft Foundry:

```bash
# Instalar la extensión de agentes Foundry
azd extension install azure.ai.agents

# Instalar la extensión de ajuste fino
azd extension install azure.ai.finetune

# Instalar la extensión de modelos personalizados
azd extension install azure.ai.models

# Listar extensiones instaladas
azd extension list
```

### Despliegue Agent-First con `azd ai`

Si tienes un manifiesto de agente, usa `azd ai agent init` para generar un proyecto conectado al Servicio de Agentes Foundry:

```bash
# Inicializar desde un manifiesto de agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Desplegar en Azure
azd up
```

Consulta [Comandos AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para la referencia completa de comandos y flags.

### Despliegue con Comando Único

```bash
# Desplegar todo con un solo comando
azd up

# O desplegar incrementalmente
azd provision  # Solo infraestructura
azd deploy     # Solo aplicación
```

### Despliegues Específicos de Entorno

```bash
# Entorno de desarrollo
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Entorno de producción
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

### Monitoreo de Costos

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

## Optimización del Rendimiento

### Estrategias de Caché

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

### Configuración de Autoescalado

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

### Problema 1: Cuota Superada en OpenAI

**Síntomas:**
- El despliegue falla con errores de cuota
- Errores 429 en los registros de la aplicación

**Soluciones:**
```bash
# Verificar el uso actual de la cuota
az cognitiveservices usage list --location eastus

# Probar una región diferente
azd env set AZURE_LOCATION westus2
azd up

# Reducir la capacidad temporalmente
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Fallos de Autenticación

**Síntomas:**
- Errores 401/403 al llamar a servicios de IA
- Mensajes de "Acceso denegado"

**Soluciones:**
```bash
# Verificar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Comprobar configuración de identidad administrada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acceso al Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas de Despliegue de Modelos

**Síntomas:**
- Modelos no disponibles en el despliegue
- Versiones específicas de modelos con fallas

**Soluciones:**
```bash
# Lista de modelos disponibles por región
az cognitiveservices model list --location eastus

# Actualizar la versión del modelo en la plantilla bicep
# Verificar los requisitos de capacidad del modelo
```

## Plantillas de Ejemplo

### Aplicación de Chat RAG (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descripción**: La muestra más popular de Azure AI — una aplicación de chat RAG lista para producción que permite hacer preguntas sobre tus propios documentos. Usa GPT-4.1-mini para chat, text-embedding-ada-002 para embeddings y Azure AI Search para búsqueda. Soporta documentos multimodales, entrada/salida de voz, autenticación Microsoft Entra y seguimiento con Application Insights.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicación de Chat RAG (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descripción**: Equivalente en .NET/C# de la muestra Python RAG chat. Construido con ASP.NET Core Minimal API y frontend Blazor WebAssembly. Incluye chat por voz, soporte GPT-4o-mini visión y cliente híbrido .NET MAUI Blazor para escritorio/móvil.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicación de Chat RAG (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descripción**: Versión Java de la muestra RAG chat usando Langchain4J para orquestación IA. Soporta arquitectura basada en microservicios orientados por eventos, múltiples estrategias de búsqueda (texto, vectorial, híbrida), carga de documentos con Azure Document Intelligence y despliegue en Azure Container Apps o Azure Kubernetes Service.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copiloto Retail Empresarial con Azure AI Foundry

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descripción**: Copiloto RAG integral para retail usando Azure AI Foundry y Prompty. Chatbot para Contoso Outdoor que basa respuestas en catálogo de productos y datos de pedidos de clientes. Demuestra flujo completo GenAIOps — prototipo con Prompty, evaluación con evaluadores asistidos por IA y despliegue vía AZD a Container Apps.

**Inicio Rápido**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicación Multi-Agente para Escritura Creativa

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicios**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descripción**: Muestra multi-agente demostrando orquestación de agentes IA con Prompty. Usa agente de investigación (Bing Grounding en Azure AI Agent Service), agente de producto (Azure AI Search), agente escritor y agente editor para producir colaborativamente artículos bien investigados. Incluye CI/CD con evaluación en GitHub Actions.

**Inicio Rápido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicios**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descripción**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions para API y Azure Static Web Apps para hosting. Usa Azure Cosmos DB como almacén vectorial y base de datos del historial de chat. Soporta desarrollo local con Ollama para pruebas sin costo.

**Inicio Rápido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Acelerador de Soluciones Chat con Tus Datos

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicios**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descripción**: Acelerador de soluciones RAG empresarial con portal administrativo para carga/gestión de documentos, múltiples opciones de orquestador (Semantic Kernel, LangChain, Prompt Flow), reconocimiento de voz, integración con Microsoft Teams y opción de backend en PostgreSQL o Cosmos DB. Diseñado como punto de partida personalizable para escenarios RAG en producción.

**Inicio Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agentes de Viaje IA — Orquestación Multi-Agente MCP

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicios**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descripción**: Aplicación de referencia para orquestación multi-agente IA usando tres frameworks (LangChain.js, LlamaIndex.TS y Microsoft Agent Framework). Cuenta con servidores MCP (Model Context Protocol) en cuatro lenguajes desplegados como Azure Container Apps serverless con monitoreo OpenTelemetry.

**Inicio Rápido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositorio**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicios**: Servicios Azure AI + Azure OpenAI

**Descripción**: Plantilla Bicep mínima que despliega servicios Azure AI con modelos de machine learning configurados. Punto de partida ligero cuando sólo necesitas aprovisionar infraestructura Azure AI sin pila de aplicación completa.

**Inicio Rápido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Descubre más plantillas**: Visita la [Galería Awesome AZD AI Templates](https://azure.github.io/awesome-azd/?tags=ai) para más de 80 plantillas AZD específicas de IA para diferentes lenguajes y escenarios.

## Próximos Pasos

1. **Prueba los Ejemplos**: Comienza con una plantilla preconstruida que se ajuste a tu caso de uso
2. **Personaliza Según Tus Necesidades**: Modifica infraestructura y código de aplicación
3. **Agrega Monitoreo**: Implementa observabilidad completa
4. **Optimiza Costos**: Ajusta configuraciones para tu presupuesto
5. **Asegura Tu Despliegue**: Aplica patrones de seguridad empresariales
6. **Escala a Producción**: Añade características de multi-región y alta disponibilidad

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Desplegar Aplicación de Chat Microsoft Foundry Models (30 minutos)
**Objetivo**: Desplegar y probar una aplicación de chat IA lista para producción

```bash
# Inicializar plantilla
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Configurar variables de entorno
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Desplegar
azd up

# Probar la aplicación
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Monitorear operaciones de IA
azd monitor

# Limpieza
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] El despliegue se completa sin errores de cuota
- [ ] Se puede acceder a la interfaz de chat en el navegador
- [ ] Se pueden hacer preguntas y obtener respuestas potentes con IA
- [ ] Application Insights muestra datos de telemetría
- [ ] Se limpiaron exitosamente los recursos

**Costo Estimado**: $5-10 por 30 minutos de prueba

### Ejercicio 2: Configurar Despliegue Multi-Modelo (45 minutos)
**Objetivo**: Desplegar múltiples modelos IA con configuraciones diferentes

```bash
# Crear configuración personalizada de Bicep
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

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
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Desplegar y verificar
azd provision
azd show
```

**Criterios de Éxito:**
- [ ] Múltiples modelos desplegados con éxito
- [ ] Se aplicaron distintas configuraciones de capacidad
- [ ] Modelos accesibles vía API
- [ ] Se pueden llamar ambos modelos desde la aplicación

### Ejercicio 3: Implementar Monitoreo de Costos (20 minutos)
**Objetivo**: Configurar alertas presupuestarias y seguimiento de costos

```bash
# Agregar alerta de presupuesto a Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
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
EOF

# Implementar alerta de presupuesto
azd provision

# Verificar costos actuales
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterios de Éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo configuradas
- [ ] Se pueden visualizar datos de costos en Azure Portal
- [ ] Umbrales de presupuesto establecidos apropiadamente

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Microsoft Foundry Models durante el desarrollo?</strong></summary>

1. **Usa el nivel gratuito**: Microsoft Foundry Models ofrece 50,000 tokens gratis al mes
2. **Reduce la capacidad**: Configura capacidad a 10 TPM en vez de 30+ para desarrollo
3. **Usa azd down**: Desasigna recursos cuando no estés desarrollando activamente
4. **Cachea las respuestas**: Implementa caché Redis para consultas repetidas
5. **Usa ingeniería de prompts**: Reduce uso de tokens con prompts eficientes

```bash
# Configuración de desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre Microsoft Foundry Models y la API de OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad y cumplimiento empresarial
- Integración con red privada
- Garantías SLA
- Autenticación con identidad administrada
- Cuotas más altas disponibles

**API de OpenAI**:
- Acceso más rápido a modelos nuevos
- Configuración más sencilla
- Menor barrera de entrada
- Solo Internet pública

Para aplicaciones en producción, **se recomienda Microsoft Foundry Models**.
</details>

<details>
<summary><strong>¿Cómo manejo los errores de cuota excedida en Microsoft Foundry Models?</strong></summary>

```bash
# Comprobar la cuota actual
az cognitiveservices usage list --location eastus2

# Probar una región diferente
azd env set AZURE_LOCATION westus2
azd up

# Reducir la capacidad temporalmente
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitar aumento de cuota
# Ir al Portal de Azure > Cuotas > Solicitar aumento
```
</details>

<details>
<summary><strong>¿Puedo usar mis propios datos con Microsoft Foundry Models?</strong></summary>

¡Sí! Usa **Azure AI Search** para RAG (Generación Aumentada por Recuperación):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Consulta la plantilla [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>¿Cómo aseguro los puntos de conexión de los modelos de IA?</strong></summary>

**Mejores Prácticas**:
1. Usa Managed Identity (sin claves API)
2. Habilita Endpoints Privados
3. Configura grupos de seguridad de red
4. Implementa limitación de velocidad
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
- **AZD GitHub**: [Incidencias y discusiones](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentación oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Habilidad Microsoft Foundry en skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instala las habilidades de agente Azure + Foundry en tu editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de Modelo de IA](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un issue en el repositorio. ¡La comunidad Azure AI + AZD está aquí para ayudarte a tener éxito!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por mantener la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda la traducción profesional humana. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->