# Azure Developer CLI के साथ AI मॉडल तैनाती

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md)
- **➡️ अगला**: [AI वर्कशॉप लैब](ai-workshop-lab.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

यह गाइड AZD टेम्पलेट्स का उपयोग करके AI मॉडलों को तैनात करने के लिए व्यापक निर्देश प्रदान करता है, जो मॉडल चयन से लेकर प्रोडक्शन तैनाती पैटर्न तक सब कुछ कवर करता है।

## विषय सूची

- [मॉडल चयन रणनीति](../../../../docs/chapter-02-ai-development)
- [AI मॉडलों के लिए AZD कॉन्फ़िगरेशन](../../../../docs/chapter-02-ai-development)
- [तैनाती पैटर्न](../../../../docs/chapter-02-ai-development)
- [मॉडल प्रबंधन](../../../../docs/chapter-02-ai-development)
- [प्रोडक्शन विचार](../../../../docs/chapter-02-ai-development)
- [निगरानी और अवलोकनीयता](../../../../docs/chapter-02-ai-development)

## मॉडल चयन रणनीति

### Azure OpenAI मॉडल

अपने उपयोग के मामले के लिए सही मॉडल चुनें:

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

### मॉडल क्षमता योजना

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | चैट, प्रश्नोत्तर | 10-50 TPM | अधिकांश वर्कलोड्स के लिए लागत-कुशल |
| GPT-4 | जटिल तर्क | 20-100 TPM | उच्च लागत, प्रीमियम सुविधाओं के लिए उपयोग करें |
| Text-embedding-ada-002 | सर्च, RAG | 30-120 TPM | सिमैंटिक सर्च के लिए आवश्यक |
| Whisper | स्पीच-टू-टेक्स्ट | 10-50 TPM | ऑडियो प्रोसेसिंग वर्कलोड्स |

## AI मॉडलों के लिए AZD कॉन्फ़िगरेशन

### Bicep टेम्पलेट कॉन्फ़िगरेशन

Bicep टेम्पलेट के माध्यम से मॉडल डिप्लॉयमेंट बनाएं:

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

### पर्यावरण चर

अपने एप्लिकेशन का पर्यावरण कॉन्फ़िगर करें:

```bash
# .env कॉन्फ़िगरेशन
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## तैनाती पैटर्न

### पैटर्न 1: एकल-क्षेत्र तैनाती

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

इसके लिए उपयुक्त:
- विकास और परीक्षण
- एकल-मार्केट अनुप्रयोग
- लागत अनुकूलन

### पैटर्न 2: बहु-क्षेत्र तैनाती

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

इसके लिए उपयुक्त:
- वैश्विक अनुप्रयोग
- उच्च उपलब्धता आवश्यकताएँ
- लोड वितरण

### पैटर्न 3: हाइब्रिड तैनाती

Azure OpenAI को अन्य AI सेवाओं के साथ संयोजित करें:

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

## मॉडल प्रबंधन

### संस्करण नियंत्रण

अपने AZD कॉन्फ़िगरेशन में मॉडल संस्करणों को ट्रैक करें:

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

### मॉडल अपडेट

मॉडल अपडेट के लिए AZD hooks का उपयोग करें:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B परीक्षण

कई मॉडल संस्करण तैनात करें:

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

## प्रोडक्शन विचार

### क्षमता योजना

उपयोग पैटर्न के आधार पर आवश्यक क्षमता की गणना करें:

```python
# क्षमता गणना का उदाहरण
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

# उपयोग का उदाहरण
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ऑटो-स्केलिंग कॉन्फ़िगरेशन

Container Apps के लिए ऑटो-स्केलिंग कॉन्फ़िगर करें:

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

### लागत अनुकूलन

लागत नियंत्रण लागू करें:

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

## निगरानी और अवलोकनीयता

### Application Insights एकीकरण

AI वर्कलोड्स के लिए निगरानी कॉन्फ़िगर करें:

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

### कस्टम मीट्रिक्स

AI-विशिष्ट मीट्रिक्स ट्रैक करें:

```python
# कृत्रिम बुद्धिमत्ता मॉडलों के लिए कस्टम टेलीमेट्री
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

### स्वास्थ्य जाँच

AI सेवा की स्वास्थ्य निगरानी लागू करें:

```python
# स्वास्थ्य जांच के अंतबिंदु
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI कनेक्शन का परीक्षण
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

## अगले कदम

1. **[Microsoft Foundry एकीकरण गाइड](microsoft-foundry-integration.md) की समीक्षा करें** सेवा एकीकरण पैटर्न के लिए
2. **[AI वर्कशॉप लैब](ai-workshop-lab.md) पूरा करें** व्यावहारिक अनुभव के लिए
3. **[प्रोडक्शन AI प्रथाएँ](production-ai-practices.md) लागू करें** उद्यम तैनाती के लिए
4. **[AI समस्या निवारण गाइड](../chapter-07-troubleshooting/ai-troubleshooting.md) का अन्वेषण करें** सामान्य समस्याओं के लिए

## संसाधन

- [Azure OpenAI मॉडल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मॉडल लागत अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD शुरुआती के लिए](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md)
- **➡️ अगला**: [AI वर्कशॉप लैब](ai-workshop-lab.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यह दस्तावेज़ AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान दें कि स्वचालित अनुवादों में त्रुटियाँ या असंगतियाँ हो सकती हैं। मूल दस्तावेज़ उसकी मूल भाषा में प्राधिकृत स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->