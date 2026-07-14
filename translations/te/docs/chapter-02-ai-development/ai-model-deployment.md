# Azure Developer CLIతో AI మోడల్ అమలు

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ఫస్ట్ అభివృద్ధి
- **⬅️ ముందు**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ తర్వాత**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

ఈ మార్గదర్శకం AZD టెంప్లేట్‌లను ఉపయోగించి AI మోడల్‌లను అమలు చేయడానికి సమగ్ర సూచనలను అందిస్తుంది, మోడల్ ఎంపిక నుండి ఉత్పత్తి అమలు నమూనాల వరకు అన్ని అంశాలను కవర్ చేస్తుంది.

> **చెల్లింపు నోటు (2026-07-13):** ఈ మార్గదర్శకంలో AZD వర్క్‌ఫ్లో `azd` `1.27.1` తో తనిఖీ చేయబడింది. డిఫాల్ట్ సర్వీస్ అమలు విండో కంటే ఎక్కువ సమయం తీసుకునే AI అమలుల్లో, ప్రస్తుత AZD విడుదలలు `azd deploy --timeout <seconds>` ను మద్దతు ఇస్తాయి.

## విషయం పట్టిక

- [మోడల్ ఎంపిక వ్యూహం](#మోడల్-ఎంపిక-వ్యూహం)
- [AI మోడల్‌లకు AZD కాన్ఫిగరేషన్](#ai-మోడల్‌లకు-azd-కాన్ఫిగరేషన్)
- [అమలు నమూనాలు](#అమలు-నమూనాలు)
- [మోడల్ నిర్వహణ](#మోడల్-నిర్వహణ)
- [ఉత్పత్తి పరిగణనలు](#ఉత్పత్తి-పరిగణనలు)
- [నిరీక్షణ మరియు పరిశీలన](#నిరీక్షణ-మరియు-పరిశీలన)

## మోడల్ ఎంపిక వ్యూహం

### Microsoft Foundry మోడల్స్

మీ వినియోగానికి సరైన మోడల్ ఎంచుకోండి:

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

| మోడల్ రకం | వినియోగం | సిఫార్సు చేసిన సామర్థ్యం | ఖర్చు పరిగణనలు |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | చాట్, ప్రశ్నోత్తరాలు | 10-50 TPM | అత్యధిక సామర్ధ్యాల కోసం ఖర్చు-సమర్థవంతం |
| gpt-4.1 | సంక్లిష్ట తర్కం | 20-100 TPM | అధిక ఖర్చు, ప్రీమియం ఫీచర్ల కోసం ఉపయోగించండి |
| text-embedding-3-large | శోధన, RAG | 30-120 TPM | సారాంశ శోధన మరియు తిరిగి పొందడానికీ బలమైన ప్రామాణిక ఎంపిక |
| Whisper | స్పీచ్-टెక్స్ట్ | 10-50 TPM | ఆడియో ప్రాసెసింగ్ పనులు |

## AI మోడల్‌లకు AZD కాన్ఫిగరేషన్

### బైసిప్ టెంప్లేట్ కాన్ఫిగరేషన్

బైసిప్ టెంప్లేట్లు ద్వారా మోడల్ అమలులు సృష్టించండి:

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

### వాతావరణ వేరియబుల్స్

మీ అనువర్తన వాతావరణాన్ని కాన్ఫిగర్ చేయండి:

```bash
# .env కాన్ఫిగరేషన్
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## అమలు నమూనాలు

### నమూనా 1: ఏక-ప్రాంత అమలు

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

ఉత్తమం:
- అభివృద్ధి మరియు పరీక్ష
- ఏక-మార్కెట్ అప్లికేషన్లు
- ఖర్చు ఆప్టిమైజేషన్

### నమూనా 2: బహు-ప్రాంత అమలు

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
- ఉన్నత లభ్యత అవసరాలు
- లోడ్ పంపకం

### నమూనా 3: హైబ్రిడ్ అమలు

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

### వెర్షన్ నియంత్రణ

AZD కాన్ఫిగరేషన్‌లో మోడల్ వెర్షన్ల ట్రాకింగ్:

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

మోడల్ నవీకరణల కోసం AZD హుక్స్ ఉపయోగించండి:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ఉపయోగించే డిప్లోయ్‌మెంట్ టైమౌట్ కంటే ఎక్కువ సమయం తీసుకుంటే
azd deploy --timeout 1800
```

### A/B పరీక్ష

బహు మోడల్ వెర్షన్లను అమలు చేయండి:

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

## ఉత్పత్తి పరిగణనలు

### సామర్థ్య ప్రణాళిక

వినియోగ నమూనాల ఆధారంగా అవసరమైన సామర్థ్యాన్ని లెక్కించండి:

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

కంటెయినర్ అప్లికేషన్ల కోసం ఆటో-స్కేలింగ్‌ని కాన్ఫిగర్ చేయండి:

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

## నిరీక్షణ మరియు పరిశీలన

### అనువర్తన ఇంటెలిజెన్స్ సమగ్రత

AI పనులను గమనించడానికి కాన్ఫిగర్ చేయండి:

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

### కస్టమ్ మ్యాట్రిక్స్

AI-స్పెసిఫిక్ మ్యాట్రిక్స్ ట్రాక్ చేయండి:

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

### ఆరోగ్య తనిఖీలు

AI సేవ ఆరోగ్య గమనికను అమలు చేయండి:

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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** సేవ సమీకరణ నమూనాల కోసం సమీక్షించండి
2. **[AI Workshop Lab](ai-workshop-lab.md)** ద్వారా ప్రత్యక్ష అనుభవం పొందండి
3. **[Production AI Practices](production-ai-practices.md)** ను సంస్థ అమలులకు అమలు చేయండి
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** ద్వారా సాధారణ సమస్యలను అన్వేషించండి

## వనరులు

- [Microsoft Foundry మోడల్స్ మోడల్ లభ్యత](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI డాక్యుమెంటేషన్](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [కంటెయినర్ అప్స్ స్కేలింగ్](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI మోడల్ ఖర్చు ఆప్టిమైజేషన్](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్స్ హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 2 - AI-ఫస్ట్ అభివృద్ధి
- **⬅️ ముందు**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ తర్వాత**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 తదుపరి అధ్యాయం**: [అధ్యాయం 3: కాన్ఫిగరేషన్](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->