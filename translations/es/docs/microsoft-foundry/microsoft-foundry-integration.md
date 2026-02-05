# Integración de Microsoft Foundry con AZD

**Navegación del capítulo:**
- **📚 Inicio del curso**: [AZD para principiantes](../../README.md)
- **📖 Capítulo actual**: Capítulo 2 - Desarrollo centrado en IA
- **⬅️ Capítulo anterior**: [Capítulo 1: Tu primer proyecto](../getting-started/first-project.md)
- **➡️ Siguiente**: [Despliegue de modelos de IA](ai-model-deployment.md)
- **🚀 Próximo capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

## Descripción general

Esta guía muestra cómo integrar los servicios de Microsoft Foundry con Azure Developer CLI (AZD) para facilitar el despliegue de aplicaciones de IA. Microsoft Foundry ofrece una plataforma integral para construir, desplegar y gestionar aplicaciones de IA, mientras que AZD simplifica los procesos de infraestructura y despliegue.

## ¿Qué es Microsoft Foundry?

Microsoft Foundry es la plataforma unificada de Microsoft para el desarrollo de IA que incluye:

- **Catálogo de modelos**: Acceso a modelos de IA de última generación
- **Prompt Flow**: Diseñador visual para flujos de trabajo de IA
- **Portal de AI Foundry**: Entorno de desarrollo integrado para aplicaciones de IA
- **Opciones de despliegue**: Múltiples opciones de alojamiento y escalado
- **Seguridad y protección**: Funciones integradas de IA responsable

## AZD + Microsoft Foundry: Mejor juntos

| Característica | Microsoft Foundry | Beneficio de la integración con AZD |
|----------------|-------------------|-------------------------------------|
| **Despliegue de modelos** | Despliegue manual en el portal | Despliegues automatizados y repetibles |
| **Infraestructura** | Aprovisionamiento manual | Infraestructura como código (Bicep) |
| **Gestión de entornos** | Enfoque en un solo entorno | Multi-entorno (desarrollo/staging/producción) |
| **Integración CI/CD** | Limitada | Soporte nativo para GitHub Actions |
| **Gestión de costos** | Monitoreo básico | Optimización de costos por entorno |

## Requisitos previos

- Suscripción a Azure con permisos adecuados
- Azure Developer CLI instalado
- Acceso a los servicios de Azure OpenAI
- Familiaridad básica con Microsoft Foundry

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

**Configuración de desarrollo:**
```bash
# Configuraciones optimizadas para el costo en desarrollo
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

### Despliegue con un solo comando

```bash
# Despliega todo con un solo comando
azd up

# O despliega de forma incremental
azd provision  # Solo infraestructura
azd deploy     # Solo aplicación
```

### Despliegues específicos por entorno

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

### Estrategias de almacenamiento en caché

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

## Solución de problemas comunes

### Problema 1: Cuota de OpenAI excedida

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

### Problema 2: Fallos de autenticación

**Síntomas:**
- Errores 401/403 al llamar a servicios de IA
- Mensajes de "Acceso denegado"

**Soluciones:**
```bash
# Verificar asignaciones de roles
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Comprobar configuración de identidad administrada
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validar acceso a Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Problema 3: Problemas de despliegue de modelos

**Síntomas:**
- Modelos no disponibles en el despliegue
- Fallos en versiones específicas de modelos

**Soluciones:**
```bash
# Listar modelos disponibles por región
az cognitiveservices model list --location eastus

# Actualizar la versión del modelo en la plantilla bicep
# Verificar los requisitos de capacidad del modelo
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
4. **Optimiza costos**: Ajusta configuraciones según tu presupuesto
5. **Asegura tu despliegue**: Implementa patrones de seguridad empresarial
6. **Escala a producción**: Añade características de alta disponibilidad y multi-región

## 🎯 Ejercicios prácticos

### Ejercicio 1: Desplegar aplicación de chat con Azure OpenAI (30 minutos)
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

**Criterios de éxito:**
- [ ] El despliegue se completa sin errores de cuota
- [ ] Se puede acceder a la interfaz de chat en el navegador
- [ ] Se pueden hacer preguntas y obtener respuestas impulsadas por IA
- [ ] Application Insights muestra datos de telemetría
- [ ] Recursos limpiados exitosamente

**Costo estimado**: $5-10 por 30 minutos de prueba

### Ejercicio 2: Configurar despliegue multi-modelo (45 minutos)
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

# Implementar y verificar
azd provision
azd show
```

**Criterios de éxito:**
- [ ] Múltiples modelos desplegados exitosamente
- [ ] Configuraciones de capacidad diferentes aplicadas
- [ ] Modelos accesibles vía API
- [ ] Se pueden llamar ambos modelos desde la aplicación

### Ejercicio 3: Implementar monitoreo de costos (20 minutos)
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

# Implementar alerta de presupuesto
azd provision

# Verificar costos actuales
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Criterios de éxito:**
- [ ] Alerta de presupuesto creada en Azure
- [ ] Notificaciones por correo configuradas
- [ ] Se pueden ver datos de costos en el portal de Azure
- [ ] Umbrales de presupuesto configurados adecuadamente

## 💡 Preguntas frecuentes

<details>
<summary><strong>¿Cómo reduzco los costos de Azure OpenAI durante el desarrollo?</strong></summary>

1. **Usa el nivel gratuito**: Azure OpenAI ofrece 50,000 tokens/mes gratis
2. **Reduce la capacidad**: Configura la capacidad a 10 TPM en lugar de 30+ para desarrollo
3. **Usa azd down**: Desasigna recursos cuando no estés desarrollando activamente
4. **Caché de respuestas**: Implementa un caché Redis para consultas repetidas
5. **Usa ingeniería de prompts**: Reduce el uso de tokens con prompts eficientes

```bash
# Configuración de desarrollo
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>¿Cuál es la diferencia entre Azure OpenAI y OpenAI API?</strong></summary>

**Azure OpenAI**:
- Seguridad y cumplimiento empresarial
- Integración con redes privadas
- Garantías de SLA
- Autenticación con identidad administrada
- Cuotas más altas disponibles

**OpenAI API**:
- Acceso más rápido a nuevos modelos
- Configuración más sencilla
- Menor barrera de entrada
- Solo internet público

Para aplicaciones de producción, se recomienda **Azure OpenAI**.
</details>

<details>
<summary><strong>¿Cómo manejo errores de cuota excedida en Azure OpenAI?</strong></summary>

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
<summary><strong>¿Cómo aseguro los endpoints de modelos de IA?</strong></summary>

**Mejores prácticas**:
1. Usa identidad administrada (sin claves API)
2. Habilita endpoints privados
3. Configura grupos de seguridad de red
4. Implementa limitación de tasas
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

## Comunidad y soporte

- **Discord de Microsoft Foundry**: [Canal #Azure](https://discord.gg/microsoft-azure)
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

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->