# Azure Developer CLI உடன் AI மாதிரி அமர்த்தல்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை ανάπτυவு
- **⬅️ முந்தையது**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

இந்த வழிகாட்டி AZD டெம்ப்ளேட்டுகளைப் பயன்படுத்தி AI மாதிரிகளை அமர்த்துவதற்கான முழுமையான கையேடுகளை வழங்குகிறது, மாதிரி தேர்வு முதல் உற்பத்தி அமர்த்தல் வரை உள்ள எல்லா அம்சங்களையும் வடிவமைப்புகளை உள்ளடக்கியது.

## உள்ளடக்கம்

- [மாதிரி தேர்வு மூலோபாயம்](../../../../docs/chapter-02-ai-development)
- [AI மாதிரிகளுக்கான AZD கட்டமைப்பு](../../../../docs/chapter-02-ai-development)
- [அமர்த்தல் வடிவமைப்புகள்](../../../../docs/chapter-02-ai-development)
- [மாதிரி மேலாண்மை](../../../../docs/chapter-02-ai-development)
- [தயாரிப்பு கருத்துகள்](../../../../docs/chapter-02-ai-development)
- [கண்காணிப்பு மற்றும் பார்வை திறன்](../../../../docs/chapter-02-ai-development)

## மாதிரி தேர்வு மூலோபாயம்

### Azure OpenAI மாதிரிகள்

உங்கள் பயன்பாட்டிற்கு சரியான மாதிரியை தேர்ந்தெடுக்கவும்:

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

### மாதிரி திறன் திட்டமிடல்

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | அரட்டை, கேள்வி மற்றும் பதில் | 10-50 TPM | பெரும்பாலான பணிகளுக்கு செலவழங்கக்கூடியது |
| GPT-4 | சிக்கலான தர்க்கம் | 20-100 TPM | அதிக செலவு, பிரீமியம் அம்சங்களுக்கு பயன்படுகிறது |
| Text-embedding-ada-002 | தேடுதல், RAG | 30-120 TPM | அர்த்த சார்ந்த தேடலுக்கு தேவை |
| Whisper | ஒலி-உரை மாற்றம் | 10-50 TPM | ஒலி செயலாக்கப் பணிகளுக்கானது |

## AI மாதிரிகளுக்கான AZD கட்டமைப்பு

### Bicep Template Configuration

Bicep டெம்ப்ளேட்டுகள் மூலம் மாதிரி அமர்த்தல்களை உருவாக்கவும்:

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

### சுற்றுச்சூழல் மாறிகள்

உங்கள் செயலியின் சூழலை அமைக்கவும்:

```bash
# .env கட்டமைப்பு
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## அமர்த்தல் வடிவமைப்புகள்

### வடிவம் 1: ஒரே பிராந்திய அமர்த்தல்

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

சிறந்தவை:
- வளர்ச்சி மற்றும் சோதனை
- ஒரே-சந்தை பயன்பாடுகள்
- செலவு சரிசெய்தல்

### வடிவம் 2: பலப் பிராந்திய அமர்த்தல்

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

சிறந்தவை:
- உலகளாவிய பயன்பாடுகள்
- உயர் கிடைக்கத்தன்மை தேவைகள்
- சுமை பகிர்வு

### வடிவம் 3: கலப்பு அமர்த்தல்

Azure OpenAI ஐ மற்ற AI சேவைகளுடன் கூட்டியமைக்கவும்:

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

AZD கட்டமைப்பில் மாதிரி பதிப்புகளைத் தொடரவும்:

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

### மாதிரி புதுப்பிப்புகள்

மாதிரி புதுப்பிப்புகளுக்காக AZD ஹுக்க்களைப் பயன்படுத்தவும்:

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

பல மாதிரி பதிப்புகளை அமர்த்தவும்:

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

## தயாரிப்பு கருத்துகள்

### திறன் திட்டமிடல்

பயன்பாட்டு முறைபாடுகளின் அடிப்படையில் தேவையான திறனைக் கணக்கிடவும்:

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

### தானியங்கி அளவீட்டு கட்டமைப்பு

Container Apps க்கான தானியங்கி அளவீட்டு கட்டமைப்பை அமைக்கவும்:

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

### செலவு மேம்பாடு

செலவுக் கட்டுப்பாடுகளை அமல்படுத்தவும்:

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

## கண்காணிப்பு மற்றும் பார்வை திறன்

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

### தனிப்பயன் அளவுகோல்கள்

AI-க்கு தனிச்செய்த அளவுகோல்களை கண்காணிக்கவும்:

```python
# செயற்கை நுண்ணறிவு மாடல்களுக்கான தனிப்பயன் தகவல் சேகரிப்பு
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

### சேவை நலச் சோதனைகள்

AI சேவையின் நலக் கண்காணிப்பை அமல்படுத்தவும்:

```python
# சேவை நிலை சோதனை எண்ட்பாயின்டுகள்
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI இணைப்பை சோதிக்க
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

1. **சேவை ஒருங்கிணைப்பு வடிவமைப்புகளுக்காக [Microsoft Foundry ஒருங்கிணைப்பு வழிகாட்டியை](microsoft-foundry-integration.md) பரிசீலிக்கவும்**
2. **கைபிடிப்புப் பயிற்சிக்காக [AI Workshop Lab](ai-workshop-lab.md) ஐ முடிக்கவும்**
3. **உற்பத்தி அமைப்புகளுக்காக [தயாரிப்பு AI நடைமுறைಗಳನ್ನು](production-ai-practices.md) நடைமுறைப்படுத்தவும்**
4. **பொதுவான பிரச்சனைகளுக்கு [AI பிரச்சனை தீர்க்கும் வழிகாட்டியை](../chapter-07-troubleshooting/ai-troubleshooting.md) ஆராயவும்**

## வளங்கள்

- [Azure OpenAI Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை ανάπτυவு
- **⬅️ முந்தையது**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
பொறுப்பு விலக்கு:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவையான Co-op Translator (https://github.com/Azure/co-op-translator) மூலம் மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்தின்படி முயற்சித்தாலும், தானாக இயங்கும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மைகள் இருக்கலாம் என்பதை தயவுசெய்து கவனிக்கவும். அசல் ஆவணம் அதன் தாய்மொழியில் கிடைக்கும் வடிவத்தையே அதிகாரப்பூர்வ ஆதாரமாக கருதவேண்டும். முக்கியமான தகவல்களுக்கு, ஒரு தொழில்முறை மனித மொழிபெயர்ப்பை பயன்படுத்த பரிந்துரைக்கப்படுகின்றது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் உருவாகக்கூடிய எந்தவொரு தவறான புரிதல்களுக்கும் அல்லது தவறான விளக்கங்களுக்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->