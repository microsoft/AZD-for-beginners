# Bereitstellung von KI-Modellen mit Azure Developer CLI

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges**: [Microsoft Foundry-Integration](microsoft-foundry-integration.md)
- **➡️ Nächstes**: [AI-Workshop-Lab](ai-workshop-lab.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

Diese Anleitung bietet umfassende Anweisungen zur Bereitstellung von KI-Modellen mit AZD-Vorlagen und deckt alles von der Modellauswahl bis hin zu Produktionsbereitstellungs‑Mustern ab.

## Inhaltsverzeichnis

- [Strategie zur Modellauswahl](../../../../docs/chapter-02-ai-development)
- [AZD-Konfiguration für KI-Modelle](../../../../docs/chapter-02-ai-development)
- [Bereitstellungsmuster](../../../../docs/chapter-02-ai-development)
- [Modellverwaltung](../../../../docs/chapter-02-ai-development)
- [Produktionsüberlegungen](../../../../docs/chapter-02-ai-development)
- [Überwachung und Beobachtbarkeit](../../../../docs/chapter-02-ai-development)

## Strategie zur Modellauswahl

### Azure OpenAI-Modelle

Wählen Sie das richtige Modell für Ihren Anwendungsfall:

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

### Kapazitätsplanung für Modelle

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Chat, Q&A | 10-50 TPM | Kostengünstig für die meisten Workloads |
| GPT-4 | Complex reasoning | 20-100 TPM | Höhere Kosten, für Premium‑Funktionen verwenden |
| Text-embedding-ada-002 | Search, RAG | 30-120 TPM | Wesentlich für semantische Suche |
| Whisper | Speech-to-text | 10-50 TPM | Audioverarbeitungs-Workloads |

## AZD-Konfiguration für KI-Modelle

### Bicep Template Configuration

Create model deployments through Bicep templates:

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

### Umgebungsvariablen

Konfigurieren Sie Ihre Anwendungsumgebung:

```bash
# .env-Konfiguration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Bereitstellungsmuster

### Pattern 1: Single-Region Deployment

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

Am besten für:
- Entwicklung und Testing
- Anwendungen für einen einzelnen Markt
- Kostenoptimierung

### Pattern 2: Multi-Region Deployment

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Am besten für:
- Globale Anwendungen
- Anforderungen an hohe Verfügbarkeit
- Lastverteilung

### Pattern 3: Hybrid Deployment

Combine Azure OpenAI with other AI services:

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

## Modellverwaltung

### Versionskontrolle

Track model versions in your AZD configuration:

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

### Modellaktualisierungen

Verwenden Sie AZD-Hooks für Modellaktualisierungen:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B-Tests

Deploy multiple model versions:

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

## Produktionsüberlegungen

### Kapazitätsplanung

Berechnen Sie die erforderliche Kapazität basierend auf Nutzungsmustern:

```python
# Beispiel zur Kapazitätsberechnung
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

# Beispielverwendung
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-Scaling-Konfiguration

Konfigurieren Sie die automatische Skalierung für Container Apps:

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

### Kostenoptimierung

Implementieren Sie Kostenkontrollen:

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

## Überwachung und Beobachtbarkeit

### Integration von Application Insights

Konfigurieren Sie die Überwachung für KI-Workloads:

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

### Benutzerdefinierte Metriken

Verfolgen Sie KI-spezifische Metriken:

```python
# Benutzerdefinierte Telemetrie für KI-Modelle
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

### Health-Checks

Implementieren Sie die Überwachung der Dienstgesundheit von KI-Services:

```python
# Endpunkte für Health-Checks
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI-Verbindung testen
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

## Nächste Schritte

1. **Lesen Sie die [Microsoft Foundry-Integrationsanleitung](microsoft-foundry-integration.md)** für Service‑Integrationsmuster
2. **Absolvieren Sie das [AI-Workshop-Lab](ai-workshop-lab.md)** für praktische Erfahrungen
3. **Implementieren Sie die [Produktions-KI-Praktiken](production-ai-practices.md)** für Unternehmenseinsätze
4. **Lesen Sie die [KI-Fehlerbehebungsanleitung](../chapter-07-troubleshooting/ai-troubleshooting.md)** für gängige Probleme

## Ressourcen

- [Verfügbarkeit von Azure OpenAI-Modellen](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Skalierung](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kostenoptimierung für KI-Modelle](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges**: [Microsoft Foundry-Integration](microsoft-foundry-integration.md)
- **➡️ Nächstes**: [AI-Workshop-Lab](ai-workshop-lab.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI‑Übersetzungsdienst Co‑op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als verbindliche Quelle zu betrachten. Für kritische Informationen empfehlen wir eine professionelle Übersetzung durch einen menschlichen Übersetzer. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->