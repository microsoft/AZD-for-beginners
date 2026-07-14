# Azure Developer CLI உடன் AI மாதிரி வெளியீடு

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநூல் முதன்மை**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

இந்த வழிகாட்டி AZD வடிவமைப்புகளைப் பயன்படுத்தி AI மாதிரிகளை வெளியீடு செய்வதற்கான முழுமையான வழிமுறைகளை வழங்குகிறது, மாதிரி தேர்வு முதல் செயலாக்க வெளியீடு படிமுறைகள் வரை அனைத்தையும் உள்ளடக்கியது.

> **சரிபார்ப்புச் குறிப்பு (2026-07-13):** இந்த வழிகாட்டியில் உள்ள AZD பணி ஓட்டம் `azd` `1.27.1` ன் எதிரொட்டியில் பரிசோதிக்கப்பட்டது. இயல்புநிலை சேவை வெளியீட்டு நேரத்துக்கு மேலாக AI வெளியீடுகளுக்கு, தற்போதைய AZD வெளியீடுகள் `azd deploy --timeout <seconds>` ஐ ஆதரிக்கின்றன.

## உள்ளடக்க அட்டவணை

- [மாதிரி தேர்வு முறை](#மாதிரி-தேர்வு-முறை)
- [AI மாதிரிகளுக்கான AZD கட்டமைப்பு](#ai-மாதிரிகளுக்கான-azd-கட்டமைப்பு)
- [வெளியீடு படிமுறைகள்](#வெளியீடு-படிமுறைகள்)
- [மாதிரி மேலாண்மை](#மாதிரி-மேலாண்மை)
- [தயாரிப்பு பரிசீலனைகள்](#தயாரிப்பு-பரிசீலனைகள்)
- [கண்காணிப்பு மற்றும் பார்வையிடல்](#கண்காணிப்பு-மற்றும்-பார்வையிடல்)

## மாதிரி தேர்வு முறை

### Microsoft Foundry மாதிரிகள்

உங்கள் பயன்பாட்டு தேவைக்கேற்ற மாதிரியை தேர்ந்தெடுங்கள்:

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

| மாதிரி வகை | பயன்பாடு | பரிந்துரைக்கப்பட்ட திறன் | செலவு பரிசீலனைகள் |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | உரையாடல், கேள்வி & பதில் | 10-50 TPM | பெரும்பாலான பணிகளுக்கு செலவு-திறமையானது |
| gpt-4.1 | சிக்கலான தீர்மானம் | 20-100 TPM | அதிக செலவு, பிரீமியம் அம்சங்களுக்கு பயன்படுத்தவும் |
| text-embedding-3-large | தேடல், RAG | 30-120 TPM | கருத்துரைக்கும் தேடல் மற்றும் மீட்டெடுதலுக்கு வலுவான இயல்பு |
| Whisper | பேச்சு-உரை மாற்றம் | 10-50 TPM | ஆடியோ செயலாக்க பணிகள் |

## AI மாதிரிகளுக்கான AZD கட்டமைப்பு

### Bicep டெம்ப்ளேட் கட்டமைப்பு

Bicep டெம்ப்ளேட்டுகளை பயன்படுத்தி மாதிரி வெளியீடுகளை உருவாக்குங்கள்:

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

### சுற்றுச்சூழல் மாறிகள்

உங்கள் பயன்பாட்டின் சுற்றுச்சூழலை கட்டமைக்க:

```bash
# .env கட்டமைப்பு
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## வெளியீடு படிமுறைகள்

### படிமுறை 1: தனி-பிராந்திய வெளியீடு

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

சிறந்தவை:
- மேம்பாடு மற்றும் சோதனை
- தனி சந்தை பயன்பாடுகள்
- செலவு முன்னேற்றம்

### படிமுறை 2: பன்முக பிராந்திய வெளியீடு

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
- உயர் கிடைக்கும் நிலை தேவைகள்
- பாரம் பகிர்வு

### படிமுறை 3: கலவையான வெளியீடு

Microsoft Foundry மாதிரிகளை மற்ற AI சேவைகளுடன் இணைக்கவும்:

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

உங்கள் AZD கட்டமைப்பில் மாதிரி பதிப்புகளை கண்காணிக்கவும்:

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

மாதிரி புதுப்பிப்புகளுக்காக AZD ஹுக்குகளை பயன்படுத்தவும்:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# பொருத்தத்தின் ஆற்றல் இயல்புநிலை நேரத்துக்கும் அதிகமாக எடுத்துக்கொண்டால்
azd deploy --timeout 1800
```

### A/B சோதனை

பல மாதிரி பதிப்புகளை வெளியிடவும்:

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

## தயாரிப்பு பரிசீலனைகள்

### திறன் திட்டமிடல்

பயன்பாட்டு மாதிரிகள் அடிப்படையில் தேவையான திறனைக் கணக்கிடுக:

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

# உதாரணப் பயன்படுத்தல்
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### தானாக விரிவாக்கம் கட்டமைப்பு

கூண்டான செயலிகள் (Container Apps) க்கான தானாக விரிவாக்கத்தை அமைக்கவும்:

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

### செலவு முன்னேற்றம்

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

## கண்காணிப்பு மற்றும் பார்வையிடல்

### பயன்பாட்டு அறிவு ஒருங்கிணைப்பு

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

### தனிப்பயன் அளவுருக்கள்

AI-கேளிக்கை அளவுருக்களை கண்காணிக்கவும்:

```python
# செயற்கை நுண்ணறிவு மாதிரிகளுக்கான தனிப்பயன் தொலைநோக்கு
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

### ஆரோக்கிய சரிபார்ப்புகள்

AI சேவை ஆரோக்கிய கண்காணிப்பை செயல்படுத்தவும்:

```python
# உடல் நலம் பரிசோதனை முடிக்கைகள்
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI இணைப்பை சோதனை செய்யுங்கள்
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

1. **சேவை ஒருங்கிணைப்பு படிமுறைகளுக்காக [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** ஐ ஆய்வு செய்யவும்
2. **நடவடிக்கை அனுபவத்திற்கு [AI Workshop Lab](ai-workshop-lab.md)** ஐ முடிக்கவும்
3. **தொழில் வெளியீடுகளுக்கான [Production AI Practices](production-ai-practices.md)** ஐ செயல்படுத்தவும்
4. **வழமையான பிரச்சினைகளுக்கான [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** ஐ ஆராயவும்

## வளங்கள்

- [Microsoft Foundry Models மாதிரி கிடைக்கும் நிலை](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI ஆவணம்](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps தானாக விரிவாக்கம்](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI மாதிரி செலவு முன்மை](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநூல் முதன்மை**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: அத்தியாயம் 2 - AI முதன்மை மேம்பாடு
- **⬅️ முந்தையது**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ அடுத்தது**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 அடுத்த அத்தியாயம்**: [அத்தியாயம் 3: கட்டமைப்பு](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->