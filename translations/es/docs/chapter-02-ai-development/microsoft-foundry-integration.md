# Integración de Microsoft Foundry con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de Modelos AI](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Descripción general

Esta guía demuestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para despliegues simplificados de aplicaciones AI. Microsoft Foundry proporciona una plataforma integral para construir, desplegar y gestionar aplicaciones de IA, mientras que AZD simplifica el proceso de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de Modelos**: Acceso a modelos de IA de última generación
- **Prompt Flow**: Diseñador visual para flujos de trabajo de IA
- **Portal Microsoft Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de Despliegue**: Múltiples opciones de alojamiento y escalado
- **Seguridad y Protección**: Funciones de IA responsable integradas

## AZD + Microsoft Foundry: Mejor Juntos

| Característica | Microsoft Foundry | Beneficio de la Integración con AZD |
|---------|-----------------|------------------------|
| **Despliegue de Modelos** | Despliegue manual en portal | Despliegues automatizados y repetibles |
| **Infraestructura** | Aprovisionamiento por clic | Infraestructura como Código (Bicep) |
| **Gestión de Entornos** | Enfoque en un solo entorno | Multi-entorno (dev/staging/prod) |
| **Integración CI/CD** | Limitada | Soporte nativo en GitHub Actions |
| **Gestión de Costos** | Monitoreo básico | Optimización de costos específica por entorno |

## Requisitos Previos

- Suscripción de Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a servicios de Microsoft Foundry Models
- Familiaridad básica con Microsoft Foundry

> **Versión base actual de AZD:** Estos ejemplos fueron revisados con `azd` `1.27.1`. Para el flujo de trabajo del agente AI, use la versión de vista previa actual de la extensión y verifique su versión instalada antes de comenzar.

## Patrones de Integración Principales

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

### Patrón 3: Integración de Document Intelligence

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

**Configuración para Producción:**
```bash
# Servicios principales de IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configuraciones del modelo
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Configuraciones de rendimiento
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuración para Desarrollo:**
```bash
# Configuraciones optimizadas para costos en desarrollo
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

AZD proporciona extensiones que agregan capacidades específicas de IA para trabajar con servicios de Microsoft Foundry:

```bash
# Instalar la extensión de agentes Foundry
azd extension install azure.ai.agents

# Instalar la extensión de ajuste fino
azd extension install azure.ai.finetune

# Instalar la extensión de modelos personalizados
azd extension install azure.ai.models

# Listar extensiones instaladas
azd extension list --installed

# Inspeccionar la versión de la extensión de agente actualmente instalada
azd extension show azure.ai.agents
```

Las extensiones de IA aún están avanzando rápidamente en vista previa. Si un comando se comporta de manera diferente a como se muestra aquí, actualice la extensión relevante antes de solucionar problemas en el proyecto mismo.

### Despliegue Agent-First con `azd ai`

Si tiene un manifiesto de agente, use `azd ai agent init` para generar un proyecto vinculado al Servicio de Agentes Foundry:

```bash
# Inicializar desde un manifiesto de agente
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Desplegar en Azure
azd up
```

Las versiones recientes en vista previa de `azure.ai.agents` también añadieron soporte de inicialización basada en plantillas para `azd ai agent init`. Si está siguiendo muestras de agentes más recientes, revise la ayuda de la extensión para conocer las banderas exactas disponibles en su versión instalada.

Vea [Comandos y Extensiones AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para la referencia completa de comandos y banderas.

### Despliegue con Un Solo Comando

```bash
# Despliega todo con un solo comando
azd up

# O despliega de forma incremental
azd provision  # Solo infraestructura
azd deploy     # Solo aplicación

# Para despliegues de aplicaciones de IA de larga duración en azd 1.23.11+
azd deploy --timeout 1800
```

### Despliegues Específicos por Entorno

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

### Configuración de Auto-escalado

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
- Errores 429 en los logs de la aplicación

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
- Errores 401/403 al llamar a servicios AI
- Mensajes de "Acceso denegado"

**Soluciones:**
```bash
# Verificar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Comprobar configuración de identidad gestionada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acceso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas en el Despliegue de Modelos

**Síntomas:**
- Modelos no disponibles en el despliegue
- Fallos en versiones específicas del modelo

**Soluciones:**
```bash
# Listar modelos disponibles por región
az cognitiveservices model list --location eastus

# Actualizar la versión del modelo en la plantilla de bicep
# Verificar los requisitos de capacidad del modelo
```

## Plantillas de Ejemplo

### Aplicación de Chat RAG (Python)

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Descripción**: La muestra de Azure AI más popular — una aplicación de chat RAG lista para producción que te permite hacer preguntas sobre tus propios documentos. Usa GPT-4.1-mini para chat, text-embedding-3-large para embeddings y Azure AI Search para recuperación. Soporta documentos multimodales, entrada/salida de voz, autenticación Microsoft Entra y trazado con Application Insights.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Aplicación de Chat RAG (.NET)

**Repositorio**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Descripción**: El equivalente en .NET/C# de la muestra de chat RAG en Python. Construido con ASP.NET Core Minimal API y frontend en Blazor WebAssembly. Incluye chat por voz, soporte GPT-4o-mini visión y un cliente híbrido de escritorio/móvil en .NET MAUI Blazor.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### Aplicación de Chat RAG (Java)

**Repositorio**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Servicios**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Descripción**: Versión en Java de la muestra de chat RAG usando Langchain4J para orquestación de IA. Soporta arquitectura de microservicios orientada a eventos, múltiples estrategias de búsqueda (texto, vector, híbrida), carga de documentos con Azure Document Intelligence y despliegue en Azure Container Apps o Azure Kubernetes Service.

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copiloto Minorista Empresarial con Microsoft Foundry

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Descripción**: Copiloto RAG minorista de extremo a extremo usando Microsoft Foundry y Prompty. Un chatbot para Contoso Outdoor que fundamenta respuestas en el catálogo de productos y datos de pedidos de clientes. Demuestra todo el flujo GenAIOps — prototipo con Prompty, evaluación con evaluadores asistidos por IA y despliegue vía AZD a Container Apps.

**Inicio Rápido**:
```bash
azd init --template contoso-chat
azd up
```

### Aplicación Multi-Agente para Escritura Creativa

**Repositorio**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Servicios**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Descripción**: Muestra multi-agente que demuestra la orquestación con agentes IA y Prompty. Usa un agente de investigación (Bing Grounding en Azure AI Agent Service), un agente de producto (Azure AI Search), un agente escritor y un agente editor para producir colaborativamente artículos bien investigados. Incluye CI/CD con evaluación en GitHub Actions.

**Inicio Rápido**:
```bash
azd init --template contoso-creative-writer
azd up
```

### Chat RAG Serverless (JavaScript/TypeScript)

**Repositorio**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Servicios**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB para NoSQL + LangChain.js

**Descripción**: Chatbot RAG completamente serverless usando LangChain.js con Azure Functions para la API y Azure Static Web Apps para el hosting. Usa Azure Cosmos DB como almacenamiento vectorial y base de datos de historial de chat. Soporta desarrollo local con Ollama para pruebas sin costo.

**Inicio Rápido**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Acelerador de Solución Chat con Tus Datos

**Repositorio**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Servicios**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Descripción**: Acelerador de solución RAG empresarial con portal admin para carga/gestión de documentos, múltiples opciones de orquestadores (Semantic Kernel, LangChain, Prompt Flow), voz a texto, integración Microsoft Teams y elección entre PostgreSQL o Cosmos DB como backend. Diseñado como punto de partida personalizable para escenarios RAG en producción.

**Inicio Rápido**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### Agentes de Viaje AI — Orquestación MCP Multi-Agente

**Repositorio**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Servicios**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + Servidores MCP (.NET, Python, Java, TypeScript)

**Descripción**: Aplicación de referencia para orquestación de IA multi-agente usando tres frameworks (LangChain.js, LlamaIndex.TS y Microsoft Agent Framework). Incluye servidores MCP (Model Context Protocol) en cuatro lenguajes desplegados como Azure Container Apps serverless con monitoreo OpenTelemetry.

**Inicio Rápido**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Repositorio**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Servicios**: Azure AI Services + Azure OpenAI

**Descripción**: Plantilla Bicep mínima que despliega servicios Azure AI con modelos de aprendizaje automático configurados. Un punto de partida ligero cuando solo se necesita aprovisionar la infraestructura Azure AI sin toda la pila de aplicación.

**Inicio Rápido**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Navega más plantillas**: Visita la [Galería de Plantillas Awesome AZD AI](https://azure.github.io/awesome-azd/?tags=ai) para más de 80 plantillas específicas de IA en AZD, en varios lenguajes y escenarios.

## Próximos Pasos

1. **Prueba los Ejemplos**: Comienza con una plantilla preconstruida que coincida con tu caso de uso
2. **Personaliza para tus Necesidades**: Modifica la infraestructura y el código de la aplicación
3. **Agrega Monitoreo**: Implementa observabilidad completa
4. **Optimiza Costos**: Ajusta configuraciones según tu presupuesto
5. **Asegura tu Despliegue**: Implementa patrones de seguridad empresarial
6. **Escala a Producción**: Añade características multi-región y alta disponibilidad

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Desplegar Aplicación de Chat con Microsoft Foundry Models (30 minutos)
**Objetivo**: Desplegar y probar una aplicación de chat AI lista para producción

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

# Limpiar
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] Despliegue completado sin errores de cuota
- [ ] Acceso a la interfaz de chat en el navegador
- [ ] Capacidad para hacer preguntas y recibir respuestas impulsadas por IA
- [ ] Application Insights muestra datos de telemetría
- [ ] Limpieza exitosa de recursos

**Costo Estimado**: $5-10 por 30 minutos de prueba

### Ejercicio 2: Configurar Despliegue Multi-Modelo (45 minutos)
**Objetivo**: Desplegar múltiples modelos AI con configuraciones diferentes

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

**Criterios de Éxito:**
- [ ] Múltiples modelos desplegados con éxito
- [ ] Configuraciones de capacidad diferentes aplicadas
- [ ] Modelos accesibles vía API
- [ ] Capacidad para llamar a ambos modelos desde la aplicación

### Ejercicio 3: Implementar Monitoreo de Costos (20 minutos)
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

# Verificar costos actuales
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterios de Éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo electrónico configuradas
- [ ] Puede ver datos de costos en el Portal de Azure
- [ ] Umbrales de presupuesto establecidos adecuadamente

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Microsoft Foundry Models durante el desarrollo?</strong></summary>

1. **Usa el Nivel Gratuito**: Microsoft Foundry Models ofrece 50,000 tokens/mes gratis
2. **Reduce la Capacidad**: Configura la capacidad a 10 TPM en lugar de 30+ para desarrollo
3. **Usa azd down**: Libera recursos cuando no estás desarrollando activamente
4. **Cachea Respuestas**: Implementa caché Redis para consultas repetidas
5. **Usa Ingeniería de Prompts**: Reduce uso de tokens con prompts eficientes


```bash
# Configuración de desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre Microsoft Foundry Models y OpenAI API?</strong></summary>

**Microsoft Foundry Models**:
- Seguridad empresarial y cumplimiento
- Integración con red privada
- Garantías SLA
- Autenticación de identidad administrada
- Cuotas más altas disponibles

**OpenAI API**:
- Acceso más rápido a nuevos modelos
- Configuración más sencilla
- Menor barrera de entrada
- Solo internet público

Para aplicaciones en producción, **se recomienda Microsoft Foundry Models**.
</details>

<details>
<summary><strong>¿Cómo manejo los errores de cuota excedida en Microsoft Foundry Models?</strong></summary>

```bash
# Verificar la cuota actual
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
<summary><strong>¿Cómo aseguro los endpoints de modelos de IA?</strong></summary>

**Buenas prácticas**:
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
- **AZD GitHub**: [Problemas y discusiones](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Documentación oficial](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Microsoft Foundry skill en skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Instala habilidades del agente Azure + Foundry en tu editor con `npx skills add microsoft/github-copilot-for-azure`

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-First
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de Modelo de IA](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un problema en el repositorio. ¡La comunidad Azure AI + AZD está aquí para ayudarte a tener éxito!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->