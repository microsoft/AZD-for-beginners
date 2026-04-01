# Azure Developer CLI உடன் AI மாதிரி வெளியீடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

இந்த கையேடு AZD வார்ப்புருக்களைப் பயன்படுத்தி AI மாதிரிகளை வெளியிடுவதற்கான முழுமையான வழிமுறைகளை வழங்குகிறது, மாதிரி தேர்வு முதல் தயாரிப்பு டெப்ளாய்மென்ட் பாணிகளுக்கு வரை உள்ள அனைத்தையும் உள்ளடக்கியது.

> **சோதனை குறிப்பு (2026-03-25):** இந்த வழிகாட்டியிலுள்ள AZD பணிச்சுற்று `azd` `1.23.12` உடன் சரிபார்க்கப்பட்டது. இயல்புநிலை சர்வீஸ் டெப்ளாய்மெண்ட் விண்டோ விட நீண்ட நேரம் எடுத்துக்கொள்ளும் AI டெப்ளாய்மெண்டுகளுக்கான, தற்போதைய AZD வெளியீடுகள் `azd deploy --timeout <seconds>` ஐ ஆதரிக்கின்றன.

## உள்ளடக்கப் பட்டியல்

- [மாதிரி தேர்வு கொள்](#மாதிரி-தேர்வு-கொள்)
- [AI மாதிரிகளுக்கான AZD கட்டமைப்பு](#ai-மாதிரிகளுக்கான-azd-கட்டமைப்பு)
- [டெப்ளாய்மெண்ட் மாதிரிகள்](#டெப்ளாய்மெண்ட்-மாதிரிகள்)
- [மாதிரி மேலாண்மை](#மாதிரி-மேலாண்மை)
- [தயாரிப்பு கவனிக்கத் திரும்புதல்](#தயாரிப்பு-கவனிக்க-வேண்டியவை)
- [கண்காணிப்பு மற்றும் பார்வைத்திறன்](#கண்காணிப்பு-மற்றும்-பார்வைத்திறன்)

## மாதிரி தேர்வு கொள்

### Microsoft Foundry மாதிரிகள்

உங்கள் பயன்பாட்டுக்கு சரியான மாதிரியை தேர்ந்தெடுக்கவும்:

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

### மாதிரி திறன் திட்டமிடல்

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | உரையாடல், கேள்வி & பதில் | 10-50 TPM | பெரும்பாலான வேலைபாடுகளுக்கு செலவினத்தில் திறமையானது |
| gpt-4.1 | சிக்கலான அறிவிறுக்கல் | 20-100 TPM | அதிக செலவு, முன்னணி அம்சங்களுக்கு பயன்படுத்தவும் |
| text-embedding-3-large | தேடு, RAG | 30-120 TPM | செமாண்டிக் தேடல் மற்றும் பிடிப்புக்கு பலவீனமிக்க இயல்புநிலை தேர்வு |
| Whisper | பேச்சு-க்கு-உரை | 10-50 TPM | ஒலி செயலாக்க வேலைப்பாடுகளுக்கு பொருத்தமானது |

## AI மாதிரிகளுக்கான AZD கட்டமைப்பு

### Bicep வார்ப்புரை கட்டமைப்பு

Bicep வார்ப்புறைகள் மூலம் மாதிரி டெப்ளாய்மென்ட்கள் உருவாக்கவும்:

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

### சூழல் மாறில்கள்

உங்கள் பயன்பாட்டு சூழலை கட்டமைக்கவும்:

```bash
# .env கட்டமைப்பு
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## டெப்ளாய்மெண்ட் மாதிரிகள்

### வடிவம் 1: ஒரே மண்டல டெப்ளாய்மெண்ட்

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

சிறந்தது:
- மேம்பாடு மற்றும் சோதனை
- ஒரே சந்தை பயன்பாடுகள்
- செலவு பொருத்தப்படுத்துதல்

### வடிவம் 2: பன்மண்டல டெப்ளாய்மெண்ட்

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
- உயர் கிடைக்கும் தன்மை தேவைகள்
- பாரம் பகிர்வு

### வடிவம் 3: இணைமையாக்கப்பட்ட டெப்ளாய்மெண்ட்

Microsoft Foundry மாதிரிகளை மற்ற AI சேவைகளுடன் ஒருங்கிணைக்கவும்:

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

## மாதிரி மேலாண்மை

### பதிப்பு கட்டுப்பாடு

உங்கள் AZD கட்டமைப்பில் மாதிரி பதிப்புகளை தடம்(trace) பதியுங்கள்:

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

### மாதிரி புதுப்பிப்புகள்

மாதிரி புதுப்பிப்புகளுக்கு AZD ஹூக்களை பயன்படுத்தவும்:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# நிறுவல் இயல்புநேர காலக்கெடுவை விட அதிக நேரம் எடுத்தால்
azd deploy --timeout 1800
```

### A/B சோதனை

பல்வேறு மாதிரி பதிப்புகளை டெப்ளாய் செய்க:

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

## தயாரிப்பு கவனிக்க வேண்டியவை

### திறன் திட்டமிடல்

பயன்பாட்டு நடைமுறைகளின் அடிப்படையில் தேவையான திறனை கணக்கிடுக:

```python
# திறன் கணக்கீட்டு உதாரணம்
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

### ஆட்டோ-ஸ்கேலிங் கட்டமைப்பு

Container Apps க்கான ஆட்டோ-ஸ்க்கேலிங் கட்டமைப்பை அமைக்கவும்:

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

### செலவு ஒழுங்குபடுத்தல்

செலவுக் கட்டுப்பாடுகளை நடைமுறைப்படுத்தவும்:

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

## கண்காணிப்பு மற்றும் பார்வைத்திறன்

### Application Insights ஒருங்கிணைப்பு

AI வேலைப்பாடுகளுக்கான கண்காணிப்பை அமைக்கவும்:

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

### தனிப்பயன் அளவுருக்கள்

AI-சார்ந்த குறிப்பிட்ட அளவுருக்களை கண்காணிக்கவும்:

```python
# செயற்கை நுண்ணறிவு (AI) மாதிரிகளுக்கான தனிப்பயன் டெலிமெட்ரி
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

### சேவை செயல்திறன் சோதனைகள்

AI சேவையின் ஆரோக்கியக் கண்காணிப்புகளை செயல்படுத்தவும்:

```python
# நலச் சோதனை எண்ட்பாயிண்டுகள்
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

1. **சேவை ஒருங்கிணைப்பு மாதிரிகளுக்காக [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md) ஐ மதிப்பாய்வு செய்யவும்**
2. **கையால் செய்யும் அனுபவத்துக்காக [AI Workshop Lab](ai-workshop-lab.md) ஐ முடிக்கவும்**
3. **என்டர்ப்ரைஸ் டெப்ளாய்மென்ட்களுக்கு [Production AI Practices](production-ai-practices.md) ஐ செயல்படுத்தவும்**
4. **பொதுவான பிரச்சனைகளுக்காக [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md) ஐ ஆராயவும்**

## வளங்கள்

- [Microsoft Foundry மாதிரி கிடைப்புத்தன்மை](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps அளவிடல்](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI மாதிரி செலவு சரிசெய்தல்](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
இந்த ஆவணம் செயற்கை நுண்ணறிவு மொழிபெயர்ப்பு சேவையாகும் [Co-op Translator](https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சித்தாலும், தன்னியக்க மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறான தகவல்கள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். மூல ஆவணம் அதன் அசல் (native) மொழியிலேயே அதிகாரபூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்தியதனால் ஏற்பட்ட எந்த தவறான புரிதல்களுக்கோ அல்லது தவறான விளக்கங்களுக்கோ நாங்கள் பொறுப்பல்ல.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->