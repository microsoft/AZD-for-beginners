# Bereitstellung von KI-Modellen mit Azure Developer CLI

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Zurück**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Weiter**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

Dieser Leitfaden bietet umfassende Anleitungen zur Bereitstellung von KI-Modellen mit AZD-Templates und deckt alles ab, von der Modellauswahl bis hin zu Produktionsbereitstellungsmustern.

## Inhaltsverzeichnis

- [Strategie zur Modellauswahl](../../../../docs/chapter-02-ai-development)
- [AZD-Konfiguration für KI-Modelle](../../../../docs/chapter-02-ai-development)
- [Bereitstellungsmuster](../../../../docs/chapter-02-ai-development)
- [Modellverwaltung](../../../../docs/chapter-02-ai-development)
- [Produktionsüberlegungen](../../../../docs/chapter-02-ai-development)
- [Überwachung und Beobachtbarkeit](../../../../docs/chapter-02-ai-development)

## Strategie zur Modellauswahl

### Microsoft Foundry-Modelle

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
            "name": "gpt-4.1-mini",
            "version": "2024-07-18",
            "deployment": "gpt-4.1-mini",
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

| Modelltyp | Anwendungsfall | Empfohlene Kapazität | Kostenüberlegungen |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat, Fragen & Antworten | 10-50 TPM | Kosteneffizient für die meisten Workloads |
| gpt-4.1 | Komplexe Schlussfolgerungen | 20-100 TPM | Höhere Kosten, für Premium-Funktionen verwenden |
| Text-embedding-ada-002 | Suche, RAG | 30-120 TPM | Wesentlich für semantische Suche |
| Whisper | Sprache-zu-Text | 10-50 TPM | Audioverarbeitungs-Workloads |

## AZD-Konfiguration für KI-Modelle

### Bicep-Template-Konfiguration

Erstellen Sie Modellbereitstellungen mittels Bicep-Templates:

```bicep
// infra/main.bicep
@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Bereitstellungsmuster

### Muster 1: Einzelregion-Bereitstellung

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    config:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Am besten geeignet für:
- Entwicklung und Tests
- Anwendungen für einen Markt
- Kostenoptimierung

### Muster 2: Mehrregionen-Bereitstellung

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Am besten geeignet für:
- Globale Anwendungen
- Anforderungen an hohe Verfügbarkeit
- Lastverteilung

### Muster 3: Hybride Bereitstellung

Kombinieren Sie Microsoft Foundry-Modelle mit anderen KI-Diensten:

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

Verfolgen Sie Modellversionen in Ihrer AZD-Konfiguration:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
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
  --query "[?name=='gpt-4.1-mini']"
```

### A/B-Tests

Stellen Sie mehrere Modellversionen bereit:

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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

Berechnen Sie die benötigte Kapazität basierend auf Nutzungsmustern:

```python
# Beispiel für die Kapazitätsberechnung
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

# Anwendungsbeispiel
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-Scaling-Konfiguration

Konfigurieren Sie Auto-Scaling für Container Apps:

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

### Application Insights-Integration

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

Implementieren Sie die Gesundheitsüberwachung für KI-Dienste:

```python
# Endpunkte für Gesundheitsprüfungen
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

1. **Überprüfen Sie die [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** für Integrationsmuster von Diensten
2. **Schließen Sie das [AI Workshop Lab](ai-workshop-lab.md)** für praktische Erfahrungen ab
3. **Implementieren Sie [Production AI Practices](production-ai-practices.md)** für Unternehmensbereitstellungen
4. **Erkunden Sie den [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** für häufige Probleme

## Ressourcen

- [Verfügbarkeit der Microsoft Foundry-Modelle](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Skalierung von Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kostenoptimierung für KI-Modelle](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD Für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Zurück**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Weiter**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Nächstes Kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->