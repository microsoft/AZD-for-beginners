# Azure Developer CLI மூலம் AI மாடல் அமைக்குதல்

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தைய**: [Microsoft Foundry ஒருங்கிணைப்பு](microsoft-foundry-integration.md)
- **➡️ அடுத்த**: [AI பணிமனை ஆய்வகம்](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

இந்த வழிகாட்டி AZD டெம்ப்ளேட்‌களைப் பயன்படுத்தி AI மாடல்களை பதிவேற்றுவதற்கான விரிவான வழிமுறைகளை வழங்குகிறது, மாடல் தேர்வு முதல் உற்பத்தி பதிவேற்ற மாதிரிகள் வரை அனைத்தையும் உள்ளடக்கியது.

## உள்ளடக்க பட்டியல்

- [மாடல் தேர்வு திட்டம்](../../../../docs/chapter-02-ai-development)
- [AI மாடல்களுக்கு AZD கட்டமைப்பு](../../../../docs/chapter-02-ai-development)
- [பதிவேற்ற முறைமைகள்](../../../../docs/chapter-02-ai-development)
- [மாடல் மேலாண்மை](../../../../docs/chapter-02-ai-development)
- [உற்பத்தி பரிசீலனைகள்](../../../../docs/chapter-02-ai-development)
- [மேற்பார்வை மற்றும் கவனிப்பு](../../../../docs/chapter-02-ai-development)

## மாடல் தேர்வு திட்டம்

### Microsoft Foundry மாதிரிகள் மாதிரிகள்

உங்கள் பயன்பாட்டிற்கான சரியான மாடலை தேர்ந்தெடுக்கவும்:

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

### மாடல் திறன் திட்டமிடல்

| மாடல் வகை | பயன்பாடு | பரிந்துரைக்கப்பட்ட திறன் | செலவு தொடர்பான கருத்துகள் |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | அரட்டை, கேள்வி மற்றும் பதில் | 10-50 TPM | பல வேலைப்பாட்டுகளுக்கு செலவு-தக்கம் |
| gpt-4.1 | சிக்கலான தர்க்கம் | 20-100 TPM | அதிக செலவு, பிரீமியம் அம்சங்களுக்கு பயன்படுத்தவும் |
| Text-embedding-ada-002 | தேடல், RAG | 30-120 TPM | வார்த்தை சார்ந்த தேடலுக்கு அவசியம் |
| Whisper | பேச்சை உரையாக்கம் | 10-50 TPM | ஆடியோ செயலாக்க பணிகள் |

## AI மாடல்களுக்கு AZD கட்டமைப்பு

### Bicep டெம்ப்ளேட் கட்டமைமை

Bicep டெம்ப்ளேட்டுகளின் மூலம் மாடல் பதிவேற்றங்களை உருவாக்கவும்:

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

### சூழல் மாறிலிகள்

உங்கள் பயன்பாட்டு சூழலை கட்டமைக்கவும்:

```bash
# .env கட்டமைப்பு
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## பதிவேற்ற முறைமைகள்

### முறை 1: ஒற்றை-மண்டல பதிவேற்றம்

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

சிறந்த பயன்பாடுகள்:
- மென்பொருள் வளர்ச்சி மற்றும் சோதனை
- ஒரே சந்தைக்கான செயலிகள்
- செலவு பொருத்துதல்

### முறை 2: பல-மண்டல பதிவேற்றம்

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

சிறந்த பயன்பாடுகள்:
- உலகளாவிய செயலிகள்
- மிக உயர்ந்த கிடைப்புத் தேவைகள்
- சுமை விநியோகம்

### முறை 3: கலப்பு பதிவேற்றம்

Microsoft Foundry மாதிரிகள் மற்றும் மற்ற AI சேவைகள் ஒன்றாக இணைத்து பயன்படுத்தவும்:

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

### மாடல் புதுப்பிப்புகள்

மாடல் புதுப்பிப்புகளுக்காக AZD ஹுக்குகளை பயன்படுத்தவும்:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B சோதனை

பல மாடல் பதிப்புகளை பதிவேற்றவும்:

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

## உற்பத்தி பரிசீலனைகள்

### திறன் திட்டமிடல்

பயன்பாட்டு முறைவரிசைகளின் அடிப்படையில் தேவையான திறனைக் கணக்கிடவும்:

```python
# திறன் கணக்கீட்டின் உதாரணம்
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

### தானியங்கி-அளவீடு கட்டமைப்பு

Container Apps க்கான தானியங்கி அளவீட்டினை கட்டமைக்கவும்:

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

### செலவு சிறப்பாக்கம்

செலவு கட்டுப்பாடுகளை அமல்படுத்தவும்:

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

## மேற்பார்வை மற்றும் கவனிப்பு

### Application Insights ஒருங்கிணைப்பு

AI பணப்பிரிவுகளுக்கான கண்காணிப்பை கட்டமைக்கவும்:

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

AI-குறிப்பிட்ட அளவுகோல்களை கண்காணிக்கவும்:

```python
# ஏஐ மாதிரிகளுக்கான தனிப்பயன் டெலிமெட்ரி
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

AI சேவையின் ஆரோக்கியக் கண்காணிப்பை அமல்படுத்தவும்:

```python
# ஆரோக்கியச் சரிபார்ப்பு எண்ட்பாயின்டுகள்
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

1. **பரிசீலிக்கவும் [Microsoft Foundry ஒருங்கிணைப்பு வழிகாட்டி](microsoft-foundry-integration.md)** சேவை ஒருங்கிணைப்பு மாதிரிகளுக்காக
2. **[AI பணிமனை ஆய்வகம்](ai-workshop-lab.md) ஐ முடிக்கவும்** கைநடை அனுபவத்திற்காக
3. **[உற்பத்தி AI நடைமுறைகள்](production-ai-practices.md) ஐ செயல்படுத்தவும்** நிறுவன பதிவேற்றங்களுக்காக
4. **[AI குறிச்சோதனை வழிகாட்டி](../chapter-07-troubleshooting/ai-troubleshooting.md) ஐ ஆராயவும்** பொதுவான பிரச்சனைகளுக்காக

## வளங்கள்

- [Microsoft Foundry மாதிரிகள் மாடல் கிடைக்கும் நிலை](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ஆவணங்கள்](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps அளவீடு](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI மாடல் செலவு சிறப்பாக்கம்](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [ஆரம்பகளுக்கான AZD](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI-முதன்மை மேம்பாடு
- **⬅️ முந்தைய**: [Microsoft Foundry ஒருங்கிணைப்பு](microsoft-foundry-integration.md)
- **➡️ அடுத்த**: [AI பணிமனை ஆய்வகம்](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
மறுப்பு:
இது [Co-op Translator](https://github.com/Azure/co-op-translator) எனயும் அழைப்பப்படும் AI மொழிபெயர்ப்பு சேவையை பயன்படுத்தி மொழிபெயர்க்கப்பட்ட ஆவணம் ஆகும். நாங்கள் துல்லியத்திற்காக முயல்வினும், தானாக செய்யப்பட்ட மொழிபெயர்ப்புகளில் பிழைகள் அல்லது துல்லியமின்மை இருக்கக்கூடும் என்பதை தயவுசெய்து கவனிக்கவும். அசல் ஆவணம் அதன் சொந்த மொழியில் இருக்கும் பதிப்பே அதிகாரப்பூர்வ மூலமாகக் கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு தொழில்முறை மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பின் பயன்பாட்டால் ஏற்படும் எந்தவொரு தவறான புரிதலுக்கும் அல்லது தவறான விளக்கங்களிற்கும் நாங்கள் பொறுப்பேற்கமாட்டோம்.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->