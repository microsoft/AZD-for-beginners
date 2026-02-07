# Integración de Microsoft Foundry con AZD

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de Modelos de IA](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

## Visión general

Esta guía demuestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para despliegues de aplicaciones de IA más fluidos. Microsoft Foundry proporciona una plataforma integral para construir, desplegar y gestionar aplicaciones de IA, mientras que AZD simplifica el proceso de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de Modelos**: Acceso a modelos de IA de vanguardia
- **Prompt Flow**: Diseñador visual para flujos de trabajo de IA
- **Portal AI Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de Despliegue**: Varias opciones de hospedaje y escalado
- **Seguridad y Protección**: Funciones integradas de IA responsable

## AZD + Microsoft Foundry: Mejor Juntos

| Funcionalidad | Microsoft Foundry | Beneficio de la Integración con AZD |
|---------|-----------------|------------------------|
| **Despliegue de Modelos** | Despliegue manual desde el portal | Despliegues automáticos y repetibles |
| **Infraestructura** | Provisionamiento mediante clics | Infraestructura como Código (Bicep) |
| **Gestión de Entornos** | Enfoque en un solo entorno | Múltiples entornos (dev/staging/prod) |
| **Integración CI/CD** | Limitada | Soporte nativo para GitHub Actions |
| **Gestión de Costos** | Monitoreo básico | Optimización de costos por entorno |

## Requisitos Previos

- Suscripción de Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a los servicios Azure OpenAI
- Familiaridad básica con Microsoft Foundry

## Patrones de Integración Principales

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

### Patrón 3: Integración con Document Intelligence

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

## 🔧 Patrones de Configuración

### Configuración de Variables de Entorno

**Configuración de Producción:**
```bash
# Servicios centrales de IA
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Configuraciones del modelo
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Ajustes de rendimiento
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Configuración de Desarrollo:**
```bash
# Ajustes optimizados en costos para desarrollo
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

### Despliegue con Comando Único

```bash
# Despliega todo con un solo comando
azd up

# Despliega de forma incremental
azd provision  # Solo infraestructura
azd deploy     # Solo la aplicación
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

### Configuración de Managed Identity

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

## Optimización de Rendimiento

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

## Resolución de Problemas Comunes

### Problema 1: Cuota de OpenAI Excedida

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

### Problema 2: Fallos de Autenticación

**Síntomas:**
- Errores 401/403 al llamar a los servicios de IA
- Mensajes de "Acceso denegado"

**Soluciones:**
```bash
# Verificar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Verificar la configuración de la identidad administrada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar el acceso a la bóveda de claves
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas en el Despliegue de Modelos

**Síntomas:**
- Modelos no disponibles en el despliegue
- Versiones específicas de modelos fallando

**Soluciones:**
```bash
# Listar modelos disponibles por región
az cognitiveservices model list --location eastus

# Actualizar la versión del modelo en la plantilla Bicep
# Comprobar los requisitos de capacidad del modelo
```

## Plantillas de Ejemplo

### Aplicación de Chat Básica

**Repositorio**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Servicios**: Azure OpenAI + Cognitive Search + App Service

**Inicio Rápido**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Canalización de Procesamiento de Documentos

**Repositorio**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Servicios**: Document Intelligence + Storage + Functions

**Inicio Rápido**:
```bash
azd init --template ai-document-processing
azd up
```

### Chat Empresarial con RAG

**Repositorio**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Servicios**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Inicio Rápido**:
```bash
azd init --template contoso-chat
azd up
```

## Próximos Pasos

1. **Prueba los Ejemplos**: Comienza con una plantilla preconstruida que coincida con tu caso de uso
2. **Personaliza según tus Necesidades**: Modifica la infraestructura y el código de la aplicación
3. **Agrega Monitoreo**: Implementa observabilidad integral
4. **Optimiza Costos**: Ajusta las configuraciones según tu presupuesto
5. **Asegura tu Despliegue**: Implementa patrones de seguridad empresariales
6. **Escala a Producción**: Añade características multirregión y de alta disponibilidad

## 🎯 Ejercicios Prácticos

### Ejercicio 1: Desplegar la App de Chat de Azure OpenAI (30 minutos)
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

# Monitorear operaciones de IA
azd monitor

# Limpiar
azd down --force --purge
```

**Criterios de Éxito:**
- [ ] El despliegue se completa sin errores de cuota
- [ ] Se puede acceder a la interfaz de chat en el navegador
- [ ] Se pueden hacer preguntas y obtener respuestas generadas por IA
- [ ] Application Insights muestra datos de telemetría
- [ ] Recursos limpiados con éxito

**Costo Estimado**: $5-10 por 30 minutos de pruebas

### Ejercicio 2: Configurar Despliegue Multi-Modelo (45 minutos)
**Objetivo**: Desplegar múltiples modelos de IA con diferentes configuraciones

```bash
# Crear configuración personalizada de Bicep
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
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
- [ ] Varios modelos desplegados exitosamente
- [ ] Aplicadas diferentes configuraciones de capacidad
- [ ] Modelos accesibles vía API
- [ ] Se pueden invocar ambos modelos desde la aplicación

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

# Comprobar costos actuales
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterios de Éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo electrónico configuradas
- [ ] Se puede ver la información de costos en el Portal de Azure
- [ ] Umbrales de presupuesto configurados apropiadamente

## 💡 Preguntas Frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Azure OpenAI durante el desarrollo?</strong></summary>

1. **Usa la Capa Gratis**: Azure OpenAI ofrece 50,000 tokens/mes gratis
2. **Reduce la Capacidad**: Establece la capacidad a 10 TPM en lugar de 30+ para desarrollo
3. **Usa azd down**: Desasigna recursos cuando no estés desarrollando activamente
4. **Cachea Respuestas**: Implementa caché Redis para consultas repetidas
5. **Usa Ingeniería de Prompts**: Reduce el uso de tokens con prompts eficientes

```bash
# Configuración de desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre Azure OpenAI y la API de OpenAI?</strong></summary>

**Azure OpenAI**:
- Seguridad y cumplimiento empresarial
- Integración con red privada
- Garantías de SLA
- Autenticación con managed identity
- Cuotas más altas disponibles

**OpenAI API**:
- Acceso más rápido a nuevos modelos
- Configuración más sencilla
- Menor barrera de entrada
- Solo internet público

Para aplicaciones de producción, **se recomienda Azure OpenAI**.
</details>

<details>
<summary><strong>¿Cómo manejo los errores de cuota excedida de Azure OpenAI?</strong></summary>

```bash
# Verificar cuota actual
az cognitiveservices usage list --location eastus2

# Probar otra región
azd env set AZURE_LOCATION westus2
azd up

# Reducir capacidad temporalmente
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Solicitar aumento de cuota
# Ir al Portal de Azure > Cuotas > Solicitar aumento
```
</details>

<details>
<summary><strong>¿Puedo usar mis propios datos con Azure OpenAI?</strong></summary>

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

**Mejores Prácticas**:
1. Usa Managed Identity (sin claves API)
2. Habilita Private Endpoints
3. Configura grupos de seguridad de red
4. Implementa limitación de tasa
5. Utiliza Azure Key Vault para secretos

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

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo Anterior**: [Capítulo 1: Tu Primer Proyecto](../chapter-01-foundation/first-project.md)
- **➡️ Siguiente**: [Despliegue de Modelos de IA](ai-model-deployment.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

**¿Necesitas ayuda?** Únete a nuestras discusiones comunitarias o abre un issue en el repositorio. ¡La comunidad Azure AI + AZD está aquí para ayudarte a tener éxito!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de malentendidos o interpretaciones erróneas que puedan surgir del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->