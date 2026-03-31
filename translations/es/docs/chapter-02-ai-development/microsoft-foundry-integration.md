# Integración de Microsoft Foundry con AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Resumen

Esta guía demuestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para despliegues simplificados de aplicaciones de IA. Microsoft Foundry proporciona una plataforma integral para crear, desplegar y gestionar aplicaciones de IA, mientras que AZD simplifica el proceso de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de modelos**: Acceso a modelos de IA de vanguardia
- **Prompt Flow**: Diseñador visual para flujos de trabajo de IA
- **Portal de Microsoft Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de implementación**: Múltiples opciones de alojamiento y escalado
- **Seguridad y protección**: Funciones integradas de IA responsable

## AZD + Microsoft Foundry: Mejor juntos

| Funcionalidad | Microsoft Foundry | Beneficio de la integración con AZD |
|---------|-----------------|------------------------|
| **Despliegue de modelos** | Despliegue manual desde el portal | Despliegues automatizados y repetibles |
| **Infraestructura** | Aprovisionamiento por clic | Infraestructura como Código (Bicep) |
| **Gestión de entornos** | Enfoque en un solo entorno | Multientorno (dev/staging/prod) |
| **Integración CI/CD** | Limitada | Compatibilidad nativa con GitHub Actions |
| **Gestión de costos** | Monitoreo básico | Optimización de costos por entorno |

## Requisitos previos

- Suscripción de Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a los servicios de Microsoft Foundry Models
- Familiaridad básica con Microsoft Foundry

> **Línea base actual de AZD:** Estos ejemplos se revisaron con `azd` `1.23.12`. Para el flujo de trabajo del agente de IA, use la versión de vista previa de la extensión actual y verifique la versión instalada antes de comenzar.

## Patrones de integración principales

### Patrón 1: Integración de Microsoft Foundry Models

**Caso de uso**: Desplegar aplicaciones de chat con modelos de Microsoft Foundry Models

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
```

### Patrón 2: Integración de AI Search + RAG

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

**Configuración de producción:**
```bash
# Servicios centrales de IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configuraciones de modelos
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Ajustes de rendimiento
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuración de desarrollo:**
```bash
# Ajustes optimizados para costes en desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Nivel gratuito
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

### Extensiones de AZD para Foundry

AZD proporciona extensiones que añaden capacidades específicas de IA para trabajar con los servicios de Microsoft Foundry:

```bash
# Instalar la extensión de agentes de Foundry
azd extension install azure.ai.agents

# Instalar la extensión de ajuste fino
azd extension install azure.ai.finetune

# Instalar la extensión de modelos personalizados
azd extension install azure.ai.models

# Listar las extensiones instaladas
azd extension list --installed

# Inspeccionar la versión actualmente instalada de la extensión de agentes
azd extension show azure.ai.agents
```

Las extensiones de IA aún evolucionan rápidamente en vista previa. Si un comando se comporta de manera diferente a lo mostrado aquí, actualice la extensión correspondiente antes de solucionar problemas del proyecto.

### Despliegue orientado a agentes con `azd ai`

Si tiene un manifiesto de agente, use `azd ai agent init` para generar la estructura de un proyecto conectado al Foundry Agent Service:

```bash
# Inicializar desde un manifiesto de agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Desplegar en Azure
azd up
```

Las recientes versiones de vista previa de `azure.ai.agents` también añadieron soporte de inicialización basado en plantillas para `azd ai agent init`. Si sigue muestras de agentes más recientes, consulte la ayuda de la extensión para conocer las banderas exactas disponibles en su versión instalada.

Consulte [Comandos CLI de AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para la referencia completa de comandos y banderas.

### Despliegue con comando único

```bash
# Despliega todo con un solo comando
azd up

# O despliega de forma incremental
azd provision  # Solo infraestructura
azd deploy     # Solo aplicación

# Para despliegues de aplicaciones de IA de larga duración en azd 1.23.11+
azd deploy --timeout 1800
```

### Despliegues por entorno

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

## Monitorización y observabilidad

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

### Monitorización de costos

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
# Comprobar el uso actual de la cuota
az cognitiveservices usage list --location eastus

# Probar otra región
azd env set AZURE_LOCATION westus2
azd up

# Reducir la capacidad temporalmente
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Problema 2: Fallos de autenticación

**Síntomas:**
- Errores 401/403 al llamar a los servicios de IA
- Mensajes de "Access denied"

**Soluciones:**
```bash
# Verificar las asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Comprobar la configuración de la identidad administrada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar el acceso al Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas de despliegue de modelos

**Síntomas:**
- Modelos no disponibles en el despliegue
- Versiones específicas de modelos que fallan

**Soluciones:**
```bash
# Listar modelos disponibles por región
az cognitiveservices model list --location eastus

# Actualizar la versión del modelo en la plantilla bicep
# Comprobar los requisitos de capacidad del modelo
```

## Plantillas de ejemplo

### Aplicación de chat RAG (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descripción**: La muestra de Azure AI más popular — una aplicación de chat RAG lista para producción que permite hacer preguntas sobre sus propios documentos. Utiliza GPT-4.1-mini para chat, text-embedding-3-large para embeddings y Azure AI Search para la recuperación. Soporta documentos multimodales, entrada/salida de voz, autenticación de Microsoft Entra y trazado con Application Insights.

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicación de chat RAG (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descripción**: El equivalente en .NET/C# de la muestra de chat RAG en Python. Construido con ASP.NET Core Minimal API y frontend Blazor WebAssembly. Incluye chat por voz, soporte para GPT-4o-mini vision y un cliente complementario .NET MAUI Blazor Hybrid para escritorio/móvil.

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicación de chat RAG (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descripción**: Versión en Java de la muestra de chat RAG usando Langchain4J para la orquestación de IA. Soporta arquitectura de microservicios orientada a eventos, múltiples estrategias de búsqueda (texto, vectorial, híbrida), carga de documentos con Azure Document Intelligence y despliegue en Azure Container Apps o Azure Kubernetes Service.

**Inicio rápido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot minorista empresarial con Azure AI Foundry

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descripción**: Copilot RAG de extremo a extremo para retail que utiliza Azure AI Foundry y Prompty. Un chatbot para el minorista Contoso Outdoor que fundamenta las respuestas en el catálogo de productos y datos de pedidos de clientes. Demuestra el flujo completo de GenAIOps — prototipar con Prompty, evaluar con evaluadores asistidos por IA y desplegar vía AZD a Container Apps.

**Inicio rápido**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicación multagente para escritura creativa

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicios**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descripción**: Muestra multagente que demuestra la orquestación de agentes de IA con Prompty. Utiliza un agente de investigación (Bing Grounding en Azure AI Agent Service), un agente de producto (Azure AI Search), un agente escritor y un agente editor para producir colaborativamente artículos bien documentados. Incluye CI/CD con evaluación en GitHub Actions.

**Inicio rápido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG sin servidor (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicios**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Descripción**: Chatbot RAG completamente sin servidor usando LangChain.js con Azure Functions para la API y Azure Static Web Apps para el hosting. Usa Azure Cosmos DB como almacén vectorial y base de datos de historial de chat. Soporta desarrollo local con Ollama para pruebas sin costo.

**Inicio rápido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Acelerador de solución Chat con tus datos

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicios**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descripción**: Acelerador de solución RAG de grado empresarial con portal de administración para carga/gestión de documentos, múltiples opciones de orquestador (Semantic Kernel, LangChain, Prompt Flow), conversión de voz a texto, integración con Microsoft Teams y opción de backend en PostgreSQL o Cosmos DB. Diseñado como punto de partida personalizable para escenarios RAG de producción.

**Inicio rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agentes de viaje con IA — Orquestación multagente MCP

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicios**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Descripción**: Aplicación de referencia para la orquestación multagente de IA usando tres frameworks (LangChain.js, LlamaIndex.TS y Microsoft Agent Framework). Incluye servidores MCP (Model Context Protocol) en cuatro lenguajes desplegados como Azure Container Apps sin servidor con monitorización OpenTelemetry.

**Inicio rápido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositorio**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicios**: Azure AI Services + Azure OpenAI

**Descripción**: Plantilla Bicep mínima que despliega servicios Azure AI con modelos de aprendizaje automático configurados. Un punto de partida ligero cuando solo necesita la infraestructura de Azure AI provisionada sin una pila de aplicación completa.

**Inicio rápido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Explora más plantillas**: Visite la [Galería de plantillas Awesome AZD AI](https://azure.github.io/awesome-azd/?tags=ai) para más de 80 plantillas AZD específicas de IA en distintos lenguajes y escenarios.

## Próximos pasos

1. **Pruebe los ejemplos**: Comience con una plantilla preconstruida que coincida con su caso de uso
2. **Personalice según sus necesidades**: Modifique la infraestructura y el código de la aplicación
3. **Agregue monitorización**: Implemente observabilidad integral
4. **Optimice costos**: Ajuste las configuraciones según su presupuesto
5. **Asegure su despliegue**: Implemente patrones de seguridad empresariales
6. **Escale a producción**: Añada características de multirregión y alta disponibilidad

## 🎯 Ejercicios prácticos

### Ejercicio 1: Desplegar aplicación de chat con Microsoft Foundry Models (30 minutos)
**Objetivo**: Desplegar y probar una aplicación de chat de IA lista para producción

```bash
# Inicializar plantilla
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Establecer variables de entorno
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Desplegar
azd up

# Probar la aplicación
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Supervisar operaciones de IA
azd monitor

# Limpiar
azd down --force --purge
```

**Criterios de éxito:**
- [ ] El despliegue se completa sin errores de cuota
- [ ] Se puede acceder a la interfaz de chat en el navegador
- [ ] Se pueden hacer preguntas y obtener respuestas impulsadas por IA
- [ ] Application Insights muestra datos de telemetría
- [ ] Recursos eliminados correctamente

**Costo estimado**: $5-10 por 30 minutos de prueba

### Ejercicio 2: Configurar despliegue multmodelo (45 minutos)
**Objetivo**: Desplegar múltiples modelos de IA con diferentes configuraciones

```bash
# Crear configuración Bicep personalizada
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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Implementar y verificar
azd provision
azd show
```

**Criterios de éxito:**
- [ ] Múltiples modelos desplegados correctamente
- [ ] Diferentes configuraciones de capacidad aplicadas
- [ ] Modelos accesibles vía API
- [ ] Se pueden llamar ambos modelos desde la aplicación

### Ejercicio 3: Implementar monitorización de costos (20 minutos)
**Objetivo**: Configurar alertas de presupuesto y seguimiento de costos

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

# Desplegar alerta de presupuesto
azd provision

# Comprobar costos actuales
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterios de éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo electrónico configuradas
- [ ] Se pueden ver los datos de costos en el Azure Portal
- [ ] Umbrales de presupuesto establecidos adecuadamente

## 💡 Preguntas frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Microsoft Foundry Models durante el desarrollo?</strong></summary>

1. **Usar nivel gratuito**: Microsoft Foundry Models ofrece 50,000 tokens/mes gratis
2. **Reducir la capacidad**: Establezca la capacidad en 10 TPM en lugar de 30+ para desarrollo
3. **Use azd down**: Desasignar recursos cuando no se esté desarrollando activamente
4. **Cache Responses**: Implementar caché Redis para consultas repetidas
5. **Usar ingeniería de prompts**: Reducir el uso de tokens con prompts eficientes

</details>
```bash
# Configuración de desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre los modelos Microsoft Foundry y la API de OpenAI?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad empresarial y cumplimiento
- Integración con redes privadas
- Garantías de SLA
- Autenticación con Managed Identity
- Cuotas más altas disponibles

**OpenAI API**:
- Acceso más rápido a nuevos modelos
- Configuración más sencilla
- Menor barrera de entrada
- Solo Internet público

Para aplicaciones de producción, **Microsoft Foundry Models es recomendado**.
</details>

<details>
<summary><strong>¿Cómo manejo los errores de cuota excedida de Microsoft Foundry Models?</strong></summary>

```bash
# Comprobar la cuota actual
az cognitiveservices usage list --location eastus2

# Probar otra región
azd env set AZURE_LOCATION westus2
azd up

# Reducir temporalmente la capacidad
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
<summary><strong>¿Cómo aseguro los endpoints de los modelos de IA?</strong></summary>

**Mejores prácticas**:
1. Usar Managed Identity (sin claves API)
2. Habilitar Private Endpoints
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

- **Microsoft Foundry Discord**: [#canal Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues y discusiones](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentación oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Skill de Microsoft Foundry en skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instala las agent skills de Azure + Foundry en tu editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD For Beginners](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un issue en el repositorio. ¡La comunidad Azure AI + AZD está aquí para ayudarte a tener éxito!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->