<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-19T22:08:25+00:00",
  "source_file": "docs/microsoft-foundry/ai-model-deployment.md",
  "language_code": "es"
}
-->
# Despliegue de Modelos de IA con Azure Developer CLI

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo con Enfoque en IA
- **⬅️ Anterior**: [Integración con Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Siguiente**: [Laboratorio de Taller de IA](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

Esta guía proporciona instrucciones completas para desplegar modelos de IA utilizando plantillas de AZD, cubriendo desde la selección del modelo hasta patrones de despliegue en producción.

## Tabla de Contenidos

- [Estrategia de Selección de Modelos](../../../../docs/microsoft-foundry)
- [Configuración de AZD para Modelos de IA](../../../../docs/microsoft-foundry)
- [Patrones de Despliegue](../../../../docs/microsoft-foundry)
- [Gestión de Modelos](../../../../docs/microsoft-foundry)
- [Consideraciones para Producción](../../../../docs/microsoft-foundry)
- [Monitoreo y Observabilidad](../../../../docs/microsoft-foundry)

## Estrategia de Selección de Modelos

### Modelos de Azure OpenAI

Elige el modelo adecuado para tu caso de uso:

```yaml
# azure.yaml - Model configuration
services:
  ai-service:
    project: ./infra
    host: containerapp
    config:
      AZURE_OPENAI_MODELS: |
        [
          {
            "name": "gpt-4o-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4o-mini",
            "capacity": 10,
            "format": "OpenAI"
          },
          {
            "name": "text-embedding-ada-002",
            "version": "2",
            "deployment": "text-embedding-ada-002", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Planificación de Capacidad del Modelo

| Tipo de Modelo | Caso de Uso | Capacidad Recomendada | Consideraciones de Costo |
|----------------|-------------|-----------------------|--------------------------|
| GPT-4o-mini | Chat, Preguntas y Respuestas | 10-50 TPM | Rentable para la mayoría de las cargas de trabajo |
| GPT-4 | Razonamiento complejo | 20-100 TPM | Mayor costo, usar para funciones premium |
| Text-embedding-ada-002 | Búsqueda, RAG | 30-120 TPM | Esencial para búsqueda semántica |
| Whisper | Voz a texto | 10-50 TPM | Cargas de trabajo de procesamiento de audio |

## Configuración de AZD para Modelos de IA

### Configuración de Plantillas Bicep

Crea despliegues de modelos a través de plantillas Bicep:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4o-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-ada-002'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    sku: {
      name: 'Standard'
      capacity: 30
    }
  }
]

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAiAccountName
  location: location
  kind: 'OpenAI'
  properties: {
    customSubDomainName: openAiAccountName
    networkAcls: {
      defaultAction: 'Allow'
    }
    publicNetworkAccess: 'Enabled'
  }
  sku: {
    name: 'S0'
  }
}

@batchSize(1)
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = [for deployment in openAiModelDeployments: {
  parent: openAi
  name: deployment.name
  properties: {
    model: deployment.model
  }
  sku: deployment.sku
}]
```

### Variables de Entorno

Configura el entorno de tu aplicación:

```bash
# Configuración de .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Patrones de Despliegue

### Patrón 1: Despliegue en una Sola Región

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

Ideal para:
- Desarrollo y pruebas
- Aplicaciones para un solo mercado
- Optimización de costos

### Patrón 2: Despliegue en Múltiples Regiones

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Ideal para:
- Aplicaciones globales
- Requisitos de alta disponibilidad
- Distribución de carga

### Patrón 3: Despliegue Híbrido

Combina Azure OpenAI con otros servicios de IA:

```bicep
// Hybrid AI services
resource cognitiveServices 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: cognitiveServicesName
  location: location
  kind: 'CognitiveServices'
  properties: {
    customSubDomainName: cognitiveServicesName
  }
  sku: {
    name: 'S0'
  }
}

resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  properties: {
    customSubDomainName: documentIntelligenceName
  }
  sku: {
    name: 'S0'
  }
}
```

## Gestión de Modelos

### Control de Versiones

Realiza un seguimiento de las versiones de los modelos en tu configuración de AZD:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4o-mini",
      "version": "2024-07-18",
      "fallback": "gpt-35-turbo"
    },
    "embedding": {
      "name": "text-embedding-ada-002",
      "version": "2"
    }
  }
}
```

### Actualizaciones de Modelos

Usa hooks de AZD para actualizaciones de modelos:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### Pruebas A/B

Despliega múltiples versiones de modelos:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Consideraciones para Producción

### Planificación de Capacidad

Calcula la capacidad requerida según los patrones de uso:

```python
# Ejemplo de cálculo de capacidad
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return int(total_tpm * (1 + safety_margin))

# Ejemplo de uso
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Configuración de Autoescalado

Configura el autoescalado para Container Apps:

```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  name: containerAppName
  properties: {
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-rule'
            http: {
              metadata: {
                concurrentRequests: '10'
              }
            }
          }
          {
            name: 'cpu-rule'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '70'
              }
            }
          }
        ]
      }
    }
  }
}
```

### Optimización de Costos

Implementa controles de costos:

```bicep
@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 1000
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@yourcompany.com'
        ]
      }
    }
  }
}
```

## Monitoreo y Observabilidad

### Integración con Application Insights

Configura el monitoreo para cargas de trabajo de IA:

```bicep
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI models
resource aiMetrics 'Microsoft.Insights/components/analyticsItems@2020-02-02' = {
  parent: applicationInsights
  name: 'ai-model-metrics'
  properties: {
    content: '''
      customEvents
      | where name == "AI_Model_Request"
      | extend model = tostring(customDimensions.model)
      | extend tokens = toint(customDimensions.tokens)
      | extend latency = toint(customDimensions.latency_ms)
      | summarize 
          requests = count(),
          avg_tokens = avg(tokens),
          avg_latency = avg(latency)
        by model, bin(timestamp, 5m)
    '''
    type: 'query'
    scope: 'shared'
  }
}
```

### Métricas Personalizadas

Realiza un seguimiento de métricas específicas de IA:

```python
# Telemetría personalizada para modelos de IA
import logging
from applicationinsights import TelemetryClient

class AITelemetry:
    def __init__(self, instrumentation_key: str):
        self.client = TelemetryClient(instrumentation_key)
    
    def track_model_request(self, model: str, tokens: int, latency_ms: int, success: bool):
        """Track AI model request metrics."""
        self.client.track_event(
            'AI_Model_Request',
            {
                'model': model,
                'tokens': str(tokens),
                'latency_ms': str(latency_ms),
                'success': str(success)
            }
        )
        
    def track_model_error(self, model: str, error_type: str, error_message: str):
        """Track AI model errors."""
        self.client.track_exception(
            type=error_type,
            value=error_message,
            properties={
                'model': model,
                'component': 'ai_model'
            }
        )
```

### Verificaciones de Salud

Implementa monitoreo de salud para servicios de IA:

```python
# Puntos de control de salud
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Probar la conexión de OpenAI
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/deployments",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            
        if response.status_code == 200:
            return {"status": "healthy", "models": response.json()}
        else:
            raise HTTPException(status_code=503, detail="AI models unavailable")
            
    except Exception as e:
        raise HTTPException(status_code=503, detail=f"Health check failed: {str(e)}")
```

## Próximos Pasos

1. **Revisa la [Guía de Integración con Microsoft Foundry](microsoft-foundry-integration.md)** para patrones de integración de servicios
2. **Completa el [Laboratorio de Taller de IA](ai-workshop-lab.md)** para experiencia práctica
3. **Implementa [Prácticas de IA en Producción](production-ai-practices.md)** para despliegues empresariales
4. **Explora la [Guía de Solución de Problemas de IA](../troubleshooting/ai-troubleshooting.md)** para problemas comunes

## Recursos

- [Disponibilidad de Modelos de Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Escalado de Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimización de Costos de Modelos de IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo con Enfoque en IA
- **⬅️ Anterior**: [Integración con Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Siguiente**: [Laboratorio de Taller de IA](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Si bien nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->