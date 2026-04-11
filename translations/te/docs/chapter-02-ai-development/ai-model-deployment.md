# Azure Developer CLI తో AI మోడల్ డిప్లాయ్‌మెంట్

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ముఖ్య అభివృద్ధి
- **⬅️ మునుపటి**: [Microsoft Foundry ఇంటిగ్రేషన్](microsoft-foundry-integration.md)
- **➡️ తరువాతి**: [AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

ఈ గైడ్ AZD టెంప్లేట్స్ ఉపయోగించి AI మోడల్స్ డిప్లాయ్ చేయడానికి సమగ్ర సూచనలను అందిస్తుంది, మోడల్ ఎంపిక నుండి ప్రొడక్షన్ డిప్లాయ్‌మెంట్ ప్యాటర్న్లు వరకు అన్నిటినీ కవర్ చేస్తుంది.

> **పరిశీలన గమనిక (2026-03-25):** ఈ గైడ్‌లోని AZD వర్క్‌ఫ్లోను `azd` `1.23.12` కు సరిపోల్చి తనిఖీ చేశారు. డిఫాల్ట్ సర్వీస్ డిప్లాయ్‌మెంట్ విండో కంటే ఎక్కువ సమయం తీసుకునే AI డిప్లాయ్‌మెంట్స్ కోసం, ప్రస్తుత AZD విడుదలలు `azd deploy --timeout <seconds>` ను మద్దతు ఇస్తాయి.

## విషయ సూచిక

- [మోడల్ ఎంపిక వ్యూహం](#మోడల్-ఎంపిక-వ్యూహం)
- [AI మోడల్స్ కోసం AZD కాన్ఫిగరేషన్](#ai-మోడల్స్-కోసం-azd-కాన్ఫిగరేషన్)
- [డిప్లాయ్‌మెంట్ ప్యాటర్న్లు](#డిప్లాయ్‌మెంట్-ప్యాటర్న్లు)
- [మోడల్ నిర్వహణ](#మోడల్-నిర్వహణ)
- [ప్రొడక్షన్ పరిగణనలు](#ప్రొడక్షన్-పరిగణనలు)
- [మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ](#మానిటరింగ్-మరియు-ఆబ్జర్వబిలిటీ)

## మోడల్ ఎంపిక వ్యూహం

### Microsoft Foundry మోడల్స్

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
            "name": "text-embedding-3-large",
            "version": "1",
            "deployment": "text-embedding-3-large", 
            "capacity": 30,
            "format": "OpenAI"
          }
        ]
```

### మోడల్ సామర్థ్య ప్రణాళిక

| మోడల్ రకం | ఉపయోగ సందర్భం | శిఫార్సు సామర్థ్యం | ఖర్చు పరిగణనలు |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | చాట్, Q&A | 10-50 TPM | చాలా వర్క్‌లోడ్స్‌కు ఖర్చు-ప్రభావవంతం |
| gpt-4.1 | సంక్లిష్ట తర్కాత్మక పనులు | 20-100 TPM | ఎక్కువ ఖర్చు, ప్రీమియం లక్షణాలకు ఉపయోగించండి |
| text-embedding-3-large | శోధన, RAG | 30-120 TPM | సెమాంటిక్ శోధన మరియు రిట్రీవల్ కోసం బలమైన డిఫాల్ట్ ఎంపిక |
| Whisper | స్పీచ్-టు-టెక్స్ట్ | 10-50 TPM | ఆడియో ప్రాసెసింగ్ వర్క్‌లోడ్స్ కోసం |

## AI మోడల్స్ కోసం AZD కాన్ఫిగరేషన్

### Bicep Template Configuration

Bicep టెంప్లేట్స్ ద్వారా మోడల్ డిప్లాయ్‌మెంట్స్ సృష్టించండి:

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

### పర్యావరణ వేరియబుల్స్

మీ అప్లికేషన్ పర్యావరణాన్ని కాన్ఫిగర్ చేయండి:

```bash
# .env కాన్ఫిగరేషన్
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## డిప్లాయ్‌మెంట్ ప్యాటర్న్లు

### ప్యాటర్న్ 1: ఒకే-రీజియన్ డిప్లాయ్‌మెంట్

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

అందుకు ఉత్తమం:
- డెవలప్‌మెంట్ మరియు పరీక్షలు
- ఒకే-మార్కెట్ అప్లికేషన్లు
- ఖర్చు ఆప్టిమైజేషన్

### ప్యాటర్న్ 2: బహు-రీజియన్ డిప్లాయ్‌మెంట్

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

అందుకు ఉత్తమం:
- గ్లోబల్ అప్లికేషన్లు
- ఎక్కువ అందుబాటుదల అవసరాలు
- లోడ్ పంపిణీ

### ప్యాటర్న్ 3: హైబ్రిడ్ డిప్లాయ్‌మెంట్

Microsoft Foundry మోడల్స్‌ను ఇతర AI సేవలతో కలపండి:

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

మీ AZD కాన్ఫిగరేషన్‌లో మోడల్ వెర్షన్లను ట్రాక్ చేయండి:

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

### మోడల్ నవీకరణలు

మోడల్ నవీకరణలకు AZD hooks ను ఉపయోగించండి:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# డిప్లాయ్‌మెంట్ డిఫాల్ట్ టైమౌట్ కన్నా ఎక్కువ సమయం తీసుకుంటే
azd deploy --timeout 1800
```

### A/B టెస్టింగ్

బహు మోడల్ వెర్షన్లను డిప్లాయ్ చేయండి:

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

### సామర్థ్య ప్రణాళిక

వినియోగ ప్యాటర్న్ల ఆధారంగా అవసరమైన సామర్థ్యాన్ని లెక్కించండి:

```python
# ధార్యత గణన ఉదాహరణ
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

# ఉదాహరణ వినియోగం
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

ఖర్చు నియంత్రణలను అమలు చేయండి:

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

## మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ

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

AI-స్పెసిఫిక్ మెట్రిక్స్‌ను ట్రాక్ చేయండి:

```python
# AI మోడళ్ల కోసం అనుకూలమైన టెలిమెట్రీ
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

### ఆరోగ్య తనిఖీలు

AI సర్వీస్ ఆరోగ్య మానిటరింగ్‌ను అమలు చేయండి:

```python
# ఆరోగ్య తనిఖీ ఎండ్‌పాయింట్లు
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

1. **[Microsoft Foundry ఇంటిగ్రేషన్ గైడ్](microsoft-foundry-integration.md)ని సమీక్షించండి** సర్వీస్ ఇంటిగ్రేషన్ ప్యాటర్న్ల కోసం
2. **[AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)ను పూర్తి చేయండి** హ్యాండ్స్-ఆన్ అనుభవం కోసం
3. **[ప్రొడక్షన్ AI ప్రాక్టీసెస్](production-ai-practices.md)ను అమలు చేయండి** ఎంటర్ప్రైజ్ డిప్లాయ్‌మెంట్స్ కోసం
4. **[AI ట్రబుల్షూటింగ్ గైడ్](../chapter-07-troubleshooting/ai-troubleshooting.md)ని ఇన్వెస్టిగేట్ చేయండి** సాధారణ సమస్యల కోసం

## వనరులు

- [Microsoft Foundry మోడల్స్ - మోడల్ అందుబాటుదనం](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps స్కేలింగ్](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI మోడల్ ఖర్చు ఆప్టిమైజేషన్](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**అధ్యాయం నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభకులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ముఖ్య అభివృద్ధి
- **⬅️ మునుపటి**: [Microsoft Foundry ఇంటిగ్రేషన్](microsoft-foundry-integration.md)
- **➡️ తరువాతి**: [AI వర్క్‌షాప్ ల్యాబ్](ai-workshop-lab.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ పత్రాన్ని [Co-op Translator](https://github.com/Azure/co-op-translator) అనే AI అనువాద సేవ ద్వారా అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాల్లో పొరపాట్లు లేదా అసమర్థతలు ఉండవచ్చు. మూల భాషలో ఉన్న ఒరిజినల్ పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి, నిపుణులైన మానవ అనువాదాన్ని సిఫార్సు చేయబడుతుంది. ఈ అనువాదం వాడకంతో ఏర్పడిన ఏవైనా అవగాహనా లోపాలు లేదా తప్పుల కోసం మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->