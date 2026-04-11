# AI मॉडेल तैनाती Azure Developer CLI सह

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 सध्याचे प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील**: [Microsoft Foundry एकत्रीकरण](microsoft-foundry-integration.md)
- **➡️ पुढे**: [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

हे मार्गदर्शक AZD टेम्पलेट्सचा वापर करून AI मॉडेल तैनात करण्यासाठी सविस्तर सूचनांचे पालन करते, जे मॉडेल निवडीपासून उत्पादन तैनाती पॅटर्नपर्यंत सर्वकाही समाविष्ट करते.

> **वैधता नोट (2026-03-25):** या मार्गदर्शकातील AZD वर्कफ्लोची तपासणी `azd` `1.23.12` विरुद्ध केली गेली. ज्या AI तैनातींसाठी डीफॉल्ट सर्व्हिस तैनाती विंडोपेक्षा जास्त वेळ लागतो, सध्याच्या AZD प्रकाशनांमध्ये `azd deploy --timeout <seconds>` समर्थन आहे.

## विषयसूची

- [मॉडेल निवड धोरण](#मॉडेल-निवड-धोरण)
- [AI मॉडेलसाठी AZD कॉन्फिगरेशन](#ai-मॉडेलसाठी-azd-कॉन्फिगरेशन)
- [तैनाती नमुने](#तैनाती-नमुने)
- [मॉडेल व्यवस्थापन](#मॉडेल-व्यवस्थापन)
- [उत्पादन विचार](#उत्पादन-विचार)
- [मॉनिटरिंग आणि निरीक्षण](#मॉनिटरिंग-आणि-निरीक्षण)

## मॉडेल निवड धोरण

### Microsoft Foundry मॉडेल्स मॉडेल्स

आपल्या वापरासाठी योग्य मॉडेल निवडा:

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

### मॉडेल क्षमता नियोजन

| मॉडेल प्रकार | उपयोग प्रकरण | शिफारस केलेली क्षमता | खर्चाचे विचार |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | चॅट, प्रश्नोत्तरे | 10-50 TPM | अधिकांश वर्कलोडसाठी खर्च-कुशल |
| gpt-4.1 | सखोल तर्क | 20-100 TPM | जास्त खर्च, प्रीमियम वैशिष्ट्यांसाठी वापरा |
| text-embedding-3-large | शोध, RAG | 30-120 TPM | सामांतिक शोध व पुनर्प्राप्तीसाठी मजबूत डीफॉल्ट निवड |
| Whisper | स्पीच-टू-टेक्स्ट | 10-50 TPM | ऑडिओ प्रक्रिया वर्कलोडसाठी |

## AI मॉडेलसाठी AZD कॉन्फिगरेशन

### Bicep टेम्पलेट कॉन्फिगरेशन

Bicep टेम्पलेट्सद्वारे मॉडेल तैनाती तयार करा:

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

### पर्यावरण व्हेरिएबल्स

आपल्या अनुप्रयोगाचे पर्यावरण कॉन्फिगर करा:

```bash
# .env कॉन्फिगरेशन
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## तैनाती नमुने

### नमुना 1: सिंगल-रीजन तैनाती

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

साठी उत्तम:
- विकास व चाचणी
- एकल-बाजार अनुप्रयोग
- खर्च अनुकूलन

### नमुना 2: बहु-रीजन तैनाती

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

साठी उत्तम:
- जागतिक अनुप्रयोग
- उच्च उपलब्धता आवश्यकता
- लोड वितरण

### नमुना 3: हायब्रिड तैनाती

Microsoft Foundry मॉडेल्स इतर AI सेवांसह एकत्र करा:

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

## मॉडेल व्यवस्थापन

### आवृत्ती नियंत्रण

आपल्या AZD कॉन्फिगरेशनमध्ये मॉडेल आवृत्त्या ट्रॅक करा:

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

### मॉडेल अद्यतने

मॉडेल अद्यतनांसाठी AZD हुक्स वापरा:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# जर तैनाती डीफॉल्ट टाइमआउटपेक्षा जास्त वेळ घेत असेल
azd deploy --timeout 1800
```

### A/B चाचणी

एकाधिक मॉडेल आवृत्त्या तैनात करा:

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

## उत्पादन विचार

### क्षमता नियोजन

वापर नमुन्यांवर आधारित आवश्यक क्षमता काढा:

```python
# क्षमता गणनेचे उदाहरण
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

# वापराचे उदाहरण
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ऑटो-स्केलिंग कॉन्फिगरेशन

Container Apps साठी ऑटो-स्केलिंग कॉन्फिगर करा:

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

### खर्च अनुकूलन

खर्च नियंत्रण लागू करा:

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

## मॉनिटरिंग आणि निरीक्षण

### Application Insights एकत्रीकरण

AI वर्कलोडसाठी मॉनिटरिंग कॉन्फिगर करा:

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

### सानुकूल मेट्रिक्स

AI-विशिष्ट मेट्रिक्स ट्रॅक करा:

```python
# एआय मॉडेल्ससाठी सानुकूल टेलिमेट्री
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

### हेल्थ चेक्स

AI सेवेचे आरोग्य मॉनिटरिंग लागू करा:

```python
# आरोग्य तपासणी एंडपॉइंट्स
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI कनेक्शनची चाचणी
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

## पुढील पावले

1. **समीक्षा करा [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** सेवा एकत्रीकरण नमुन्यांसाठी
2. **पूर्ण करा [AI Workshop Lab](ai-workshop-lab.md)** प्रत्यक्ष अनुभवासाठी
3. **अंमलात आणा [Production AI Practices](production-ai-practices.md)** एंटरप्राइझ तैनातींसाठी
4. **शोधा [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** सामान्य समस्यांसाठी

## संसाधने

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तऐवजीकरण](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मॉडेल खर्च अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स मुख्यपृष्ठ**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 सध्याचे प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील**: [Microsoft Foundry एकत्रीकरण](microsoft-foundry-integration.md)
- **➡️ पुढे**: [AI वर्कशॉप लॅब](ai-workshop-lab.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
हा दस्तऐवज AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून अनुवादित केला गेला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया लक्षात ठेवा की स्वयंचलित अनुवादांमध्ये त्रुटी किंवा चुका असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेतच अधिकारप्राप्त स्रोत मानला जावा. महत्त्वाच्या माहितीच्या बाबतीत व्यावसायिक मानवी अनुवाद करण्याची शिफारस केली जाते. या अनुवादाच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमजुतींसाठी किंवा चुकीच्या अर्थनिर्णयासाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->