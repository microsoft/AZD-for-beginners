# AI Model Deployment with Azure Developer CLI

**Chapter Navigation:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [Microsoft Foundry-integration](microsoft-foundry-integration.md)
- **➡️ Nästa**: [AI-workshoplabb](ai-workshop-lab.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

Denna guide innehåller omfattande instruktioner för att distribuera AI-modeller med hjälp av AZD-mallar, och täcker allt från modellval till produktionsdistributionsmönster.

## Innehållsförteckning

- [Modellvalstrategi](../../../../docs/chapter-02-ai-development)
- [AZD-konfiguration för AI-modeller](../../../../docs/chapter-02-ai-development)
- [Distributionsmönster](../../../../docs/chapter-02-ai-development)
- [Modellhantering](../../../../docs/chapter-02-ai-development)
- [Produktionsöverväganden](../../../../docs/chapter-02-ai-development)
- [Övervakning och observerbarhet](../../../../docs/chapter-02-ai-development)

## Modellvalstrategi

### Azure OpenAI-modeller

Välj rätt modell för ditt användningsfall:

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

### Kapacitetsplanering för modeller

| Modelltyp | Användningsfall | Rekommenderad kapacitet | Kostnadsöverväganden |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Chatt, Q&A | 10-50 TPM | Kostnadseffektivt för de flesta arbetsbelastningar |
| GPT-4 | Komplexa resonemang | 20-100 TPM | Högre kostnad, använd för premiumfunktioner |
| Text-embedding-ada-002 | Sökning, RAG | 30-120 TPM | Avgörande för semantisk sökning |
| Whisper | Tal till text | 10-50 TPM | Arbetsbelastningar för ljudbearbetning |

## AZD-konfiguration för AI-modeller

### Konfiguration av Bicep-mallar

Skapa modelldistributioner genom Bicep-mallar:

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

### Miljövariabler

Konfigurera din applikationsmiljö:

```bash
# .env-konfiguration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Distributionsmönster

### Mönster 1: Distribution i en region

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

Bäst för:
- Utveckling och testning
- Applikationer för en enda marknad
- Kostnadsoptimering

### Mönster 2: Distribution i flera regioner

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Bäst för:
- Globala applikationer
- Hög tillgänglighet
- Lastfördelning

### Mönster 3: Hybriddistribution

Kombinera Azure OpenAI med andra AI-tjänster:

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

## Modellhantering

### Versionshantering

Spåra modellversioner i din AZD-konfiguration:

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

### Modelluppdateringar

Använd AZD hooks för modelluppdateringar:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B-testning

Distribuera flera modellversioner:

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

## Produktionsöverväganden

### Kapacitetsplanering

Beräkna erforderlig kapacitet baserat på användningsmönster:

```python
# Exempel på kapacitetsberäkning
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

# Exempel på användning
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Autoskalningskonfiguration

Konfigurera autoskalning för Container Apps:

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

### Kostnadsoptimering

Implementera kostnadskontroller:

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

## Övervakning och observerbarhet

### Integration med Application Insights

Konfigurera övervakning för AI-arbetsbelastningar:

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

### Anpassade mätvärden

Spåra AI-specifika mätvärden:

```python
# Anpassad telemetri för AI-modeller
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

### Hälsokontroller

Implementera hälsomonitorering för AI-tjänster:

```python
# Ändpunkter för hälsokontroll
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Testa anslutning till OpenAI
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

## Nästa steg

1. **Granska [Microsoft Foundry-integrationguiden](microsoft-foundry-integration.md)** för serviceintegrationsmönster
2. **Genomför [AI-workshoplabb](ai-workshop-lab.md)** för praktisk erfarenhet
3. **Implementera [Produktions-AI-praktiker](production-ai-practices.md)** för företagsdistributioner
4. **Utforska [AI-felsökningsguiden](../chapter-07-troubleshooting/ai-troubleshooting.md)** för vanliga problem

## Resurser

- [Tillgänglighet för Azure OpenAI-modeller](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Dokumentation för Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Skalning av Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Kostnadsoptimering för AI-modeller](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapter Navigation:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 2 - AI-först utveckling
- **⬅️ Föregående**: [Microsoft Foundry-integration](microsoft-foundry-integration.md)
- **➡️ Nästa**: [AI-workshoplabb](ai-workshop-lab.md)
- **🚀 Nästa kapitel**: [Kapitel 3: Konfiguration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, observera att automatiska översättningar kan innehålla fel eller felaktigheter. Originaldokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->