# AI Model Deployment with Azure Developer CLI

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Forrige**: [Microsoft Foundry-integration](microsoft-foundry-integration.md)
- **➡️ Næste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Næste kapitel**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

Denne vejledning giver omfattende instruktioner til udrulning af AI-modeller ved hjælp af AZD-skabeloner og dækker alt fra modelvalg til produktionsudrulningsmønstre.

> **Valideringsnote (2026-03-25):** AZD-arbejdsgangen i denne vejledning blev kontrolleret mod `azd` `1.23.12`. For AI-udrulninger, der tager længere tid end det normale service-udrulningsvindue, understøtter nuværende AZD-udgivelser `azd deploy --timeout <seconds>`.

## Indholdsfortegnelse

- [Modelvalgstrategi](#modelvalgstrategi)
- [AZD-konfiguration for AI-modeller](#azd-konfiguration-for-ai-modeller)
- [Udrulningsmønstre](#udrulningsmønstre)
- [Modelstyring](#modelstyring)
- [Produktionshensyn](#produktionshensyn)
- [Overvågning og observabilitet](#overvågning-og-observabilitet)

## Modelvalgstrategi

### Microsoft Foundry-modeller

Vælg den rigtige model til dit brugstilfælde:

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
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### Kapacitetsplanlægning for modeller

| Model Type | Brugstilfælde | Anbefalet kapacitet | Omkostningshensyn |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Chat og Q&A | 10-50 TPM | Omkostningseffektiv for de fleste arbejdsbelastninger |
| gpt-4.1 | Kompleks ræsonnering | 20-100 TPM | Højere omkostninger, brug til premium-funktioner |
| text-embedding-3-large | Søgning, RAG | 30-120 TPM | Stærkt standardvalg til semantisk søgning og hentning |
| Whisper | Tale-til-tekst | 10-50 TPM | Arbejdsbelastninger til lydbehandling |

## AZD-konfiguration for AI-modeller

### Bicep-skabelonkonfiguration

Opret modeludrulninger via Bicep-skabeloner:

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

### Miljøvariabler

Konfigurer dit applikationsmiljø:

```bash
# Konfiguration af .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Udrulningsmønstre

### Mønster 1: Enkeltregions-udrulning

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

Bedst til:
- Udvikling og test
- Applikationer til enkeltmarked
- Omkostningsoptimering

### Mønster 2: Flerregions-udrulning

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Bedst til:
- Globale applikationer
- Krav om høj tilgængelighed
- Belastningsfordeling

### Mønster 3: Hybridudrulning

Kombiner Microsoft Foundry-modeller med andre AI-tjenester:

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

## Modelstyring

### Versionsstyring

Spor modelversioner i din AZD-konfiguration:

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2024-07-18",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### Modelopdateringer

Brug AZD-hooks til modelopdateringer:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Hvis udrulningen tager længere end standard timeout
azd deploy --timeout 1800
```

### A/B-test

Udrul flere modelversioner:

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

## Produktionshensyn

### Kapacitetsplanlægning

Beregn nødvendig kapacitet baseret på brugsmønstre:

```python
# Eksempel på kapacitetsberegning
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

# Eksempel på brug
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Autoskalering-konfiguration

Konfigurer autoskalering for Container Apps:

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

### Omkostningsoptimering

Implementer omkostningskontroller:

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

## Overvågning og observabilitet

### Application Insights-integration

Konfigurer overvågning for AI-arbejdsbelastninger:

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

### Brugerdefinerede metrics

Spor AI-specifikke metrics:

```python
# Brugerdefineret telemetri til AI-modeller
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

### Sundhedstjek

Implementer overvågning af AI-tjenesters sundhed:

```python
# Sundhedstjek-endepunkter
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test forbindelse til OpenAI
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

## Næste skridt

1. **Gennemgå [Microsoft Foundry-integrationsvejledning](microsoft-foundry-integration.md)** for mønstre til serviceintegrationer  
2. **Fuldfør [AI Workshop-lab](ai-workshop-lab.md)** for praktisk erfaring  
3. **Implementer [Produktions-AI-praksis](production-ai-practices.md)** for enterprise-udrulninger  
4. **Undersøg [AI-fejlfindingvejledning](../chapter-07-troubleshooting/ai-troubleshooting.md)** for almindelige problemer

## Ressourcer

- [Microsoft Foundry Models - Modeltilgængelighed](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps-skalering](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Omkostningsoptimering for AI-modeller](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 2 - AI-First Development
- **⬅️ Forrige**: [Microsoft Foundry-integration](microsoft-foundry-integration.md)
- **➡️ Næste**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Næste kapitel**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->