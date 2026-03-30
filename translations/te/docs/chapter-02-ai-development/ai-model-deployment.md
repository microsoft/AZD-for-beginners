# AI మోడల్ డిప్లాయ్‌మెంట్ Azure Developer CLI తో

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ముఖ్య అభివృద్ధి
- **⬅️ మునుపటి**: [Microsoft Foundry ఇంటిగ్రేషన్](microsoft-foundry-integration.md)
- **➡️ తదుపరి**: [AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

ఈ గైడ్ AZD టెంప్లేట్లు ఉపయోగించి AI మోడల్స్‌ను డిప్లాయ్ చేయడానికి సమగ్ర సూచనలను అందిస్తుంది, మోడల్ ఎంపిక నుండి ప్రొడక్షన్ డిప్లాయ్‌మెంట్ నమూనాలంతా కవర్ చేస్తుంది.

## టేబుల్ ఆఫ్ కంటెంట్స్

- [మోడల్ ఎంపిక వ్యూహం](#మోడల్-ఎంపిక-వ్యూహం)
- [AI మోడల్స్ కోసం AZD కాన్ఫిగరేషన్](#ai-మోడల్స్-కోసం-azd-కాన్ఫిగరేషన్)
- [డిప్లాయ్‌మెంట్ నమూనాలు](#డిప్లాయ్‌మెంట్-నమూనాలు)
- [మోడల్ నిర్వహణ](#మోడల్-నిర్వహణ)
- [ప్రొడక్షన్ పరిగణనలు](#ప్రొడక్షన్-పరిగణనలు)
- [మానిటరింగ్ మరియు ఆబ్సర్వబిలిటీ](#మానిటరింగ్-మరియు-ఆబ్సర్వబిలిటీ)

## మోడల్ ఎంపిక వ్యూహం

### Microsoft Foundry Models Models

మీ వినియోగ కేసు కోసం సరైన మోడల్‌ను ఎంచుకోండి:

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

### మోడల్ సామర్థ్య ప్లానింగ్

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | చాట్, ప్రశ్న-జవాబు | 10-50 TPM | ఎక్కువ భాగమైన వర్క్‌లోడ్స్ కోసం ఖర్చులో సమర్థవంతం |
| gpt-4.1 | సంక్లిష్ట తర్కం | 20-100 TPM | ఎక్కువ ఖర్చు, ప్రీమియం ఫీచర్ల కోసం ఉపయోగించడం మంచిది |
| Text-embedding-ada-002 | శోధన, RAG | 30-120 TPM | సెమాంటిక్ శోధన కోసం అవసరమైనది |
| Whisper | స్పీచ్-టు-టెక్స్ట్ | 10-50 TPM | ఆడియో ప్రాసెసింగ్ వర్క్ లోడ్స్ కోసం |

## AI మోడల్స్ కోసం AZD కాన్ఫిగరేషన్

### Bicep టెంప్లేట్ కాన్ఫిగరేషన్

Bicep టెంప్లేట్ల ద్వారా మోడల్ డిప్లాయ్‌మెంట్స్ సృష్టించండి:

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

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్

మీ అప్లికేషన్ ఎన్విరాన్‌మెంట్‌ను కాన్ఫిగర్ చేయండి:

```bash
# .env కాన్ఫిగరేషన్
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## డిప్లాయ్‌మెంట్ నమూనాలు

### Pattern 1: Single-Region Deployment

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

ఉత్తమంగా:
- డెవలప్‌మెంట్ మరియు టెస్టింగ్
- ఒకే మార్కెట్ అప్లికేషన్లు
- ఖర్చు ఆప్టిమైజేషన్

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

ఉత్తమంగా:
- గ్లోబల్ అప్లికేషన్లు
- ఉన్నత అందుబాటుకావలసిన అవసరాలు
- లోడ్ పంపిణీ

### Pattern 3: Hybrid Deployment

Microsoft Foundry మోడల్స్‌ను ఇతర AI సర్వీసులతో కలిపి ఉపయోగించండి:

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

## మోడల్ నిర్వహణ

### వెర్షన్ కంట్రోల్

మీ AZD కాన్ఫిగరేషన్‌లో మోడల్ వెర్షన్‌లను ట్రాక్ చేయండి:

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

### మోడల్ అప్‌డేట్స్

మోడల్ అప్డేట్స్ కోసం AZD hooks ఉపయోగించండి:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B టెస్టింగ్

అన్ని మోడల్ వెర్షన్‌లను డిప్లాయ్ చేయండి:

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

## ప్రొడక్షన్ పరిగణనలు

### సామర్థ్య ప్లానింగ్

ఉపయోగ నమూనాల ఆధారంగా అవసరమైన సామర్థ్యాన్ని లెక్కించండి:

```python
# సామర్థ్య లెక్కింపు ఉదాహరణ
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

# ఉపయోగానికి ఉదాహరణ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ఆటో-స్కేలింగ్ కాన్ఫిగరేషన్

Container Apps కోసం ఆటో-స్కేలింగ్‌ను కాన్ఫిగర్ చేయండి:

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

### ఖర్చు ఆప్టిమైజేషన్

ఖర్చుల నియంత్రణలను అమలు చేయండి:

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

## మానిటరింగ్ మరియు ఆబ్సర్వబిలిటీ

### Application Insights ఇంటిగ్రేషన్

AI వర్క్‌లోడ్స్ కోసం మానిటరింగ్‌ను కాన్ఫిగర్ చేయండి:

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

### కస్టమ్ మెట్రిక్స్

AI-ఐస్పెసిఫిక్ మెట్రిక్స్‌ను ట్రాక్ చేయండి:

```python
# కృత్రిమ మేధస్సు మోడల్స్ కోసం అనుకూల టెలిమెట్రీ
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

### హెల్త్ చెక్లు

AI సర్వీస్ ఆరోగ్య మానిటరింగ్‌ను అమలు చేయండి:

```python
# ఆరోగ్య తనిఖీ ఎండ్పాయింట్లు
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI కనెక్షన్‌ను పరీక్షించండి
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

## తదుపరి దశలు

1. **[Microsoft Foundry ఇంటిగ్రేషన్ గైడ్](microsoft-foundry-integration.md)** ను సేవా ఇంటిగ్రేషన్ నమూనాల కోసం సమీక్షించండి
2. **[AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)** ను హ్యాండ్స్-ఆన్ అనుభవం కోసం పూర్తిచేయండి
3. **[ప్రొడక్షన్ AI పద్ధతులు](production-ai-practices.md)** ను సంస్థల డిప్లాయ్‌మెంట్స్ కోసం అమలు చేయండి
4. **సాధారణ సమస్యల కోసం [AI ట్రబుల్ష్యూటింగ్ గైడ్](../chapter-07-troubleshooting/ai-troubleshooting.md)** ను అన్వేషించండి

## రిసోర్సెస్

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ముఖ్య అభివృద్ధి
- **⬅️ మునుపటి**: [Microsoft Foundry ఇంటిగ్రేషన్](microsoft-foundry-integration.md)
- **➡️ తదుపరి**: [AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి శ్రమించగా కూడా, ఆటోమేటెడ్ అనువాదాల్లో తప్పులు లేదా లోపాలు ఉండవచ్చు. మూల భాషలో ఉన్న అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. ముఖ్యమైన సమాచారానికి ప్రొఫెషనల్ మానవ అనువాదం చేయించుకోవాలని సిఫార్సు చేయబడును. ఈ అనువాదాన్ని ఉపయోగించడతొ కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదోషాల కోసం మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->