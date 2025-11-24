<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2432e08775264e481d86a2e0e512a347",
  "translation_date": "2025-11-24T15:35:39+00:00",
  "source_file": "docs/microsoft-foundry/ai-model-deployment.md",
  "language_code": "ta"
}
-->
# AZD மூலம் AI மாடல் வெளியீடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [Microsoft Foundry ஒருங்கிணைப்பு](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI பணிக்கூடம் ஆய்வகம்](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)

AZD டெம்ப்ளேட்களைப் பயன்படுத்தி AI மாடல்களை வெளியிடுவதற்கான முழுமையான வழிகாட்டுதலை இது வழங்குகிறது, மாடல் தேர்வு முதல் உற்பத்தி வெளியீட்டு முறை வரை.

## உள்ளடக்க அட்டவணை

- [மாடல் தேர்வு உத்தி](../../../../docs/microsoft-foundry)
- [AI மாடல்களுக்கு AZD கட்டமைப்பு](../../../../docs/microsoft-foundry)
- [வெளியீட்டு முறைகள்](../../../../docs/microsoft-foundry)
- [மாடல் மேலாண்மை](../../../../docs/microsoft-foundry)
- [உற்பத்தி கருத்துக்கள்](../../../../docs/microsoft-foundry)
- [கண்காணிப்பு மற்றும் பார்வையிடுதல்](../../../../docs/microsoft-foundry)

## மாடல் தேர்வு உத்தி

### Azure OpenAI மாடல்கள்

உங்கள் பயன்பாட்டிற்கான சரியான மாடலைத் தேர்ந்தெடுக்கவும்:

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

### மாடல் திறன் திட்டமிடல்

| மாடல் வகை | பயன்பாட்டு வழக்கு | பரிந்துரைக்கப்பட்ட திறன் | செலவுக் கருத்துக்கள் |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | உரையாடல், கேள்வி & பதில் | 10-50 TPM | பெரும்பாலான பணிகளுக்கு செலவுச்செலுத்தல் |
| GPT-4 | சிக்கலான காரணம் | 20-100 TPM | அதிக செலவு, பிரீமியம் அம்சங்களுக்கு பயன்படுத்தவும் |
| Text-embedding-ada-002 | தேடல், RAG | 30-120 TPM | அர்த்தமுள்ள தேடலுக்கு அவசியம் |
| Whisper | உரை-உரையாடல் | 10-50 TPM | ஆடியோ செயலாக்க பணிகள் |

## AI மாடல்களுக்கு AZD கட்டமைப்பு

### Bicep டெம்ப்ளேட் கட்டமைப்பு

Bicep டெம்ப்ளேட்கள் மூலம் மாடல் வெளியீடுகளை உருவாக்கவும்:

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

### சூழல் மாறிகள்

உங்கள் பயன்பாட்டு சூழலை அமைக்கவும்:

```bash
# .env கட்டமைப்பு
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## வெளியீட்டு முறைகள்

### முறை 1: ஒற்றை-பிராந்திய வெளியீடு

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

சிறந்தது:
- மேம்பாடு மற்றும் சோதனை
- ஒற்றை-சந்தை பயன்பாடுகள்
- செலவுக் குறைப்பு

### முறை 2: பல-பிராந்திய வெளியீடு

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

சிறந்தது:
- உலகளாவிய பயன்பாடுகள்
- அதிக கிடைப்புத் தேவைகள்
- சுமை பகிர்வு

### முறை 3: கலப்பு வெளியீடு

Azure OpenAI ஐ மற்ற AI சேவைகளுடன் இணைக்கவும்:

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

## மாடல் மேலாண்மை

### பதிப்பு கட்டுப்பாடு

AZD கட்டமைப்பில் மாடல் பதிப்புகளை கண்காணிக்கவும்:

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

### மாடல் புதுப்பிப்புகள்

மாடல் புதுப்பிப்புகளுக்கு AZD hooks ஐப் பயன்படுத்தவும்:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B சோதனை

பல மாடல் பதிப்புகளை வெளியிடவும்:

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

## உற்பத்தி கருத்துக்கள்

### திறன் திட்டமிடல்

பயன்பாட்டு முறைப்படி தேவையான திறனை கணக்கிடவும்:

```python
# திறன் கணக்கீடு உதாரணம்
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

# பயன்பாட்டு உதாரணம்
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### தானியக்க-அளவீட்டு கட்டமைப்பு

Container Apps க்கான தானியக்க-அளவீட்டினை அமைக்கவும்:

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

### செலவுக் குறைப்பு

செலவுக் கட்டுப்பாடுகளை செயல்படுத்தவும்:

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

## கண்காணிப்பு மற்றும் பார்வையிடுதல்

### Application Insights ஒருங்கிணைப்பு

AI பணிகளுக்கான கண்காணிப்பை அமைக்கவும்:

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

### தனிப்பயன் அளவீடுகள்

AI-சிறப்பு அளவீடுகளை கண்காணிக்கவும்:

```python
# AI மாதிரிகளுக்கான தனிப்பட்ட தொலைநிலையியல்
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

### ஆரோக்கிய சோதனைகள்

AI சேவையின் ஆரோக்கிய கண்காணிப்பை செயல்படுத்தவும்:

```python
# சுகாதார சரிபார்ப்பு இறுதிப்புள்ளிகள்
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI இணைப்பை சோதிக்கவும்
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

## அடுத்த படிகள்

1. **[Microsoft Foundry ஒருங்கிணைப்பு வழிகாட்டியை](microsoft-foundry-integration.md)** சேவை ஒருங்கிணைப்பு முறைகளுக்கு மதிப்பாய்வு செய்யவும்
2. **[AI பணிக்கூடம் ஆய்வகத்தை](ai-workshop-lab.md)** முழுமையான அனுபவத்திற்காக முடிக்கவும்
3. **[உற்பத்தி AI நடைமுறைகளை](production-ai-practices.md)** நிறுவன வெளியீடுகளுக்கு செயல்படுத்தவும்
4. **[AI சிக்கல் தீர்வு வழிகாட்டியை](../troubleshooting/ai-troubleshooting.md)** பொதுவான சிக்கல்களுக்கு ஆராயவும்

## வளங்கள்

- [Azure OpenAI மாடல் கிடைப்புகள்](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps அளவீடு](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI மாடல் செலவுக் குறைப்பு](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD ஆரம்பக்கட்டம்](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [Microsoft Foundry ஒருங்கிணைப்பு](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI பணிக்கூடம் ஆய்வகம்](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**குறிப்பு**:  
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சிக்கிறோம், ஆனால் தானியங்கி மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கக்கூடும் என்பதை கவனத்தில் கொள்ளவும். அதன் தாய்மொழியில் உள்ள மூல ஆவணம் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கங்களுக்கு நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->