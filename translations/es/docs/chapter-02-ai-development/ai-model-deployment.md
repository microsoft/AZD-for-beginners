# Despliegue de Modelos de IA con Azure Developer CLI

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo AI-Primero
- **⬅️ Anterior**: [Agentes de IA](agents.md)
- **➡️ Siguiente**: [Laboratorio de Taller de IA](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

Esta guía proporciona instrucciones completas para desplegar modelos de IA usando plantillas AZD, cubriendo todo desde la selección del modelo hasta los patrones de despliegue en producción.

> **Revisión de versión (2026-11-04):** Los cambios relacionados con la CLI fueron revisados contra `azd` `1.37.2`; la disponibilidad de modelos, versiones y cuotas sigue dependiendo de la región y suscripción. `azd deploy --timeout <seconds>` controla la ventana de despliegue del servicio, no garantiza la activación del agente. Consulte [notas de la versión actual y guía de migración IA](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Tabla de Contenidos

- [Estrategia de Selección de Modelos](#model-selection-strategy)
- [Configuración AZD para Modelos de IA](#azd-configuration-for-ai-models)
- [Patrones de Despliegue](#deployment-patterns)
- [Gestión de Modelos](#model-management)
- [Consideraciones para Producción](#production-considerations)
- [Monitoreo y Observabilidad](#monitoring-and-observability)

## Estrategia de Selección de Modelos

### Modelos Azure OpenAI en Microsoft Foundry

Elija el modelo adecuado para su caso de uso:

Declare los despliegues de modelos en Bicep (más abajo), no en configuraciones arbitrarias `services.*.config.AZURE_OPENAI_MODELS`. AZD no interpreta tal configuración como una lista de recursos de modelo. El `project` de un servicio apunta al código fuente de la aplicación, no a su directorio `infra/`.

Los ejemplos usan la versión publicada `gpt-4.1-mini` versión **`2025-04-14`** y la versión de incrustación **`1`**. Confirme que la versión del modelo y el SKU de implementación sean compatibles en su región/cuenta objetivo antes de aprovisionar.

### Planificación de la Capacidad del Modelo

| Tipo de Modelo | Caso de Uso | Demanda Ilustrativa de Tokens | Consideraciones de Costos |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Preguntas y Respuestas | 10,000-50,000 TPM | Costo y calidad de referencia para su carga de trabajo |
| gpt-4.1 | Tareas complejas | 20,000-100,000 TPM | Evaluar mejoras de calidad en relación con el costo por token |
| text-embedding-3-large | Búsqueda, RAG | 30,000-120,000 TPM | Tener en cuenta la ingesta así como el tráfico de consultas |
| Whisper | De voz a texto | Planear usando la duración del audio y límites de solicitudes | No aplicar una fórmula de capacidad TPM de modelo de texto |

TPM significa tokens por minuto. Para estos despliegues de texto estándar, ARM `sku.capacity` está en unidades de **1,000 TPM**, no TPM individuales (la capacidad `10` significa 10,000 TPM). Las proporciones de RPM a TPM varían según el modelo/tipo de despliegue; verifique ambos límites contra la [documentación de cuotas](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Estos rangos son ejemplos, no recomendaciones de dimensionamiento.

## Configuración de AZD para Modelos de IA

### Configuración de plantilla Bicep

Cree implementaciones de modelos mediante plantillas Bicep:

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
    sku: {
      name: 'Standard'
      capacity: 10
    }
  }
  {
    name: 'text-embedding-3-large'
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
    disableLocalAuth: true
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

Este es un **ejemplo de infraestructura de desarrollo** limitado al grupo de recursos, no una plantilla completa de aplicación AZD. La cuenta permite acceso a la red pública y requiere autenticación Entra ID/RBAC (`Cognitive Services OpenAI User` para llamadores). Para producción se necesitan el endpoint privado, DNS y conectividad de aplicación descritos en el Capítulo 8. AZD también necesita una plantilla principal/mapa de parámetros y recursos de anfitrión de aplicación; use un ejemplo funcional para un despliegue completo.

### Variables de Entorno

Configure el entorno de su aplicación:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Estos son nombres definidos por la aplicación; conéctelos en su configuración de anfitrión. El endpoint Azure OpenAI v1 usado por la verificación de salud a continuación no requiere el parámetro de consulta `api-version` anticuado; los clientes `AzureOpenAI` más antiguos sí, así que siga la generación de API usada por su aplicación.

## Patrones de Despliegue

### Patrón 1: Despliegue en Región Única

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Lo mejor para:
- Desarrollo y pruebas
- Aplicaciones en un solo mercado
- Optimización de costos

### Patrón 2: Despliegue Multi-Región

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Las propiedades/SKU omitidas de la cuenta deben ser suministradas; este fragmento no es desplegable tal cual. Despliegue modelos en cada cuenta e implemente el enrutamiento/conmutación por error y controles de residencia de datos por separado.

Lo mejor para:
- Aplicaciones globales
- Requisitos de alta disponibilidad
- Distribución de carga

### Patrón 3: Despliegue Híbrido

Combine Microsoft Foundry Models con otros servicios de IA:

Los siguientes fragmentos suponen que los nombres y `location` son suministrados por la plantilla contenedora.

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

Realice un seguimiento de las versiones de modelos en la configuración de su aplicación o IaC. Este JSON es un **ejemplo definido por la aplicación**, no un esquema de modelo incorporado de AZD; se debe implementar y desplegar explícitamente una solución alternativa:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Actualizaciones del modelo

Use un hook AZD para una verificación de disponibilidad de solo lectura, luego actualice IaC y provisione:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Ejecute `azd up` **fuera** del hook para aplicar la infraestructura del modelo modificada y desplegar el código. Nunca llame a `azd deploy` desde un hook `predeploy`: invoca recursivamente el mismo hook. `azd deploy --timeout 1800` extiende un tiempo de espera para despliegue de aplicación; no actualiza los recursos Bicep.

### Pruebas A/B

El recurso ilustrativo a continuación selecciona un nombre de despliegue y capacidad; crea **un** despliegue, no una prueba A/B. Para un experimento real, aprovisione dos recursos de despliegue distintos, dirija una fracción controlada de solicitudes a cada uno y compare calidad, latencia y costo. Asume `openAi` del ejemplo de cuenta:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## Consideraciones de Producción

### Planificación de Capacidad

Calcule la capacidad requerida basado en patrones de uso:

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

Salida esperada: `Required capacity: 9100 TPM`. Con 1000 unidades de capacidad TPM, redondee hacia arriba al menos a `10`, luego verifique la estimación específica del modelo RPM y límite de servicio (incluyendo presupuesto de salida solicitado). Esta estimación de demanda de tokens no garantiza contra limitación.

### Configuración de Autoescalado

Configure autoescalado para Container Apps:

**Recurso parcial:** combine las configuraciones `template.scale` en un Container App completo con ubicación, entorno gestionado, imagen de contenedor, recursos e ingreso. Escalar réplicas no incrementa cuota del modelo.

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

Implemente controles de costos:

**Recurso de presupuesto ilustrativo:** defina `budgetStartDate` como el primer día del mes actual en UTC (por ejemplo `2026-11-01T00:00:00Z` para esta revisión), y reemplace la dirección de contacto. El inicio debe cumplir las restricciones de fecha actuales del servicio. Los presupuestos alertan sobre datos de facturación retrasados; no detienen el gasto.

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Configure monitoreo para cargas de trabajo AI:

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

```

El fragmento de recurso asume `applicationInsightsName`, `location` y un `logAnalyticsWorkspace` existente. Proporciona monitoreo, pero no instrumenta la aplicación ni crea métricas personalizadas.

### Métricas Personalizadas

Rastree métricas específicas de AI:

Use la [distribución Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) compatible, no el SDK Python heredado `applicationinsights`. Instale `azure-monitor-opentelemetry`, configure `APPLICATIONINSIGHTS_CONNECTION_STRING` e inicialícelo una vez al iniciar:

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

Esto ilustra emisión de atributos, no instrumentación real de llamada al modelo. Envuelva la solicitud real en un span para medir su duración; inspeccione `dependencies`/`traces` en Application Insights. No envíe prompts, respuestas, claves o mensajes de excepción crudos que contengan datos sensibles.

### Revisiones de Salud

Implemente monitoreo de salud del servicio AI:

Instale `fastapi`, `uvicorn`, `httpx` y `azure-identity`. Configure las variables de endpoint/implementación mencionadas arriba y conceda al llamador `Cognitive Services OpenAI User`. Esta **sonda de disponibilidad** utiliza el plano de datos Azure OpenAI v1 con Entra ID; realiza una llamada de modelo que genera costo. Ejecute con `uvicorn health:app` después de guardar como `health.py`. Use una verificación de vida independiente ligera, limite/almacene en caché los resultados de disponibilidad y no exponga esta ruta públicamente sin controles de acceso.

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

Esperado: `GET /health/ai-models` devuelve `200 {"status":"healthy"}` cuando la implementación de chat configurada es usable, o `503` sin divulgar detalles del origen. Listar implementaciones es una operación de plano de administración y no es una sonda de salud válida para el plano de datos.

## Próximos Pasos

1. **Revise la [Guía de Integración Microsoft Foundry](microsoft-foundry-integration.md)** para patrones de integración de servicios
2. **Complete el [Laboratorio del Taller de IA](ai-workshop-lab.md)** para experiencia práctica
3. **Implemente las [Prácticas de IA para Producción](../chapter-08-production/production-ai-practices.md)** para implementaciones empresariales
4. **Explore la [Guía de Solución de Problemas de IA](../chapter-07-troubleshooting/ai-troubleshooting.md)** para problemas comunes

## Recursos

- [Disponibilidad de Modelos Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Documentación de Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Escalado de Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Optimización de Costos de Modelos de IA](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Navegación del Capítulo:**
- **📚 Inicio del Curso**: [AZD Para Principiantes](../../README.md)
- **📖 Capítulo Actual**: Capítulo 2 - Desarrollo con IA como Prioridad
- **⬅️ Anterior**: [Agentes de IA](agents.md)
- **➡️ Siguiente**: [Laboratorio del Taller de IA](ai-workshop-lab.md)
- **🚀 Próximo Capítulo**: [Capítulo 3: Configuración](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->