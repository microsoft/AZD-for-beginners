<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-25T08:17:11+00:00",
  "source_file": "docs/microsoft-foundry/ai-model-deployment.md",
  "language_code": "te"
}
-->
# AZD తో AI మోడల్ డిప్లాయ్‌మెంట్

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 2 - AI-First Development
- **⬅️ గతం**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ తదుపరి**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 తదుపరి చాప్టర్**: [Chapter 3: Configuration](../getting-started/configuration.md)

ఈ గైడ్ AZD టెంప్లేట్లను ఉపయోగించి AI మోడళ్లను డిప్లాయ్ చేయడానికి సమగ్ర సూచనలను అందిస్తుంది, మోడల్ ఎంపిక నుండి ప్రొడక్షన్ డిప్లాయ్‌మెంట్ ప్యాటర్న్స్ వరకు.

## విషయ సూచిక

- [మోడల్ ఎంపిక వ్యూహం](../../../../docs/microsoft-foundry)
- [AI మోడళ్ల కోసం AZD కాన్ఫిగరేషన్](../../../../docs/microsoft-foundry)
- [డిప్లాయ్‌మెంట్ ప్యాటర్న్స్](../../../../docs/microsoft-foundry)
- [మోడల్ మేనేజ్‌మెంట్](../../../../docs/microsoft-foundry)
- [ప్రొడక్షన్ పరిశీలనలు](../../../../docs/microsoft-foundry)
- [మానిటరింగ్ మరియు ఆబ్జర్వబిలిటీ](../../../../docs/microsoft-foundry)

## మోడల్ ఎంపిక వ్యూహం

### Azure OpenAI మోడల్స్

మీ వినియోగానికి సరైన మోడల్‌ను ఎంచుకోండి:

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

### మోడల్ సామర్థ్య ప్లానింగ్

| మోడల్ రకం | వినియోగం | సిఫార్సు చేసిన సామర్థ్యం | ఖర్చు పరిశీలనలు |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | చాట్, Q&A | 10-50 TPM | ఎక్కువ workloadలకు ఖర్చు తగ్గింపు |
| GPT-4 | క్లిష్టమైన reasoning | 20-100 TPM | అధిక ఖర్చు, ప్రీమియం ఫీచర్లకు ఉపయోగించండి |
| Text-embedding-ada-002 | సెర్చ్, RAG | 30-120 TPM | సెమాంటిక్ సెర్చ్‌కు అవసరం |
| Whisper | స్పీచ్-టు-టెక్స్ట్ | 10-50 TPM | ఆడియో ప్రాసెసింగ్ workloadలు |

## AI మోడళ్ల కోసం AZD కాన్ఫిగరేషన్

### Bicep టెంప్లేట్ కాన్ఫిగరేషన్

Bicep టెంప్లేట్ల ద్వారా మోడల్ డిప్లాయ్‌మెంట్‌లను సృష్టించండి:

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

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్

మీ అప్లికేషన్ ఎన్విరాన్‌మెంట్‌ను కాన్ఫిగర్ చేయండి:

```bash
# .env కాన్ఫిగరేషన్
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## డిప్లాయ్‌మెంట్ ప్యాటర్న్స్

### ప్యాటర్న్ 1: సింగిల్-రీజియన్ డిప్లాయ్‌మెంట్

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

ఉత్తమం:
- డెవలప్‌మెంట్ మరియు టెస్టింగ్
- సింగిల్-మార్కెట్ అప్లికేషన్లు
- ఖర్చు ఆప్టిమైజేషన్

### ప్యాటర్న్ 2: మల్టీ-రీజియన్ డిప్లాయ్‌మెంట్

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ఉత్తమం:
- గ్లోబల్ అప్లికేషన్లు
- అధిక అందుబాటు అవసరాలు
- లోడ్ డిస్ట్రిబ్యూషన్

### ప్యాటర్న్ 3: హైబ్రిడ్ డిప్లాయ్‌మెంట్

Azure OpenAIని ఇతర AI సేవలతో కలపండి:

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

## మోడల్ మేనేజ్‌మెంట్

### వెర్షన్ కంట్రోల్

మీ AZD కాన్ఫిగరేషన్‌లో మోడల్ వెర్షన్‌లను ట్రాక్ చేయండి:

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

### మోడల్ అప్‌డేట్స్

మోడల్ అప్‌డేట్స్ కోసం AZD హుక్స్ ఉపయోగించండి:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B టెస్టింగ్

బహుళ మోడల్ వెర్షన్‌లను డిప్లాయ్ చేయండి:

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

## ప్రొడక్షన్ పరిశీలనలు

### సామర్థ్య ప్లానింగ్

వినియోగ నమూనాల ఆధారంగా అవసరమైన సామర్థ్యాన్ని లెక్కించండి:

```python
# సామర్థ్య గణన ఉదాహరణ
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

# ఉపయోగం ఉదాహరణ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ఆటో-స్కేలింగ్ కాన్ఫిగరేషన్

కంటైనర్ అప్లికేషన్ల కోసం ఆటో-స్కేలింగ్‌ను కాన్ఫిగర్ చేయండి:

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

### అప్లికేషన్ ఇన్‌సైట్స్ ఇంటిగ్రేషన్

AI workloadల కోసం మానిటరింగ్‌ను కాన్ఫిగర్ చేయండి:

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
# AI మోడల్స్ కోసం కస్టమ్ టెలిమెట్రీ
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

### హెల్త్ చెక్స్

AI సేవల హెల్త్ మానిటరింగ్‌ను అమలు చేయండి:

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

## తదుపరి చర్యలు

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)**ను సమీక్షించండి, సేవల ఇంటిగ్రేషన్ ప్యాటర్న్స్ కోసం
2. **[AI Workshop Lab](ai-workshop-lab.md)**ను పూర్తి చేయండి, ప్రాక్టికల్ అనుభవం కోసం
3. **[Production AI Practices](production-ai-practices.md)**ను అమలు చేయండి, ఎంటర్‌ప్రైజ్ డిప్లాయ్‌మెంట్‌ల కోసం
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)**ను అన్వేషించండి, సాధారణ సమస్యల పరిష్కారం కోసం

## వనరులు

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**చాప్టర్ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత చాప్టర్**: చాప్టర్ 2 - AI-First Development
- **⬅️ గతం**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ తదుపరి**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 తదుపరి చాప్టర్**: [Chapter 3: Configuration](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:  
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేయబడుతుంది. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->