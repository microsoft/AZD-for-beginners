<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6af361e2339c27aa56a9196e11b32cb7",
  "translation_date": "2025-09-17T16:57:51+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "hi"
}
-->
# एआई मॉडल को Azure Developer CLI के साथ डिप्लॉय करना

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - एआई-फर्स्ट डेवलपमेंट
- **⬅️ पिछला**: [Azure AI Foundry इंटीग्रेशन](azure-ai-foundry-integration.md)
- **➡️ अगला**: [AI वर्कशॉप लैब](ai-workshop-lab.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../getting-started/configuration.md)

यह गाइड AZD टेम्पलेट्स का उपयोग करके एआई मॉडल को डिप्लॉय करने के लिए विस्तृत निर्देश प्रदान करता है, जिसमें मॉडल चयन से लेकर प्रोडक्शन डिप्लॉयमेंट पैटर्न तक सब कुछ शामिल है।

## सामग्री तालिका

- [मॉडल चयन रणनीति](../../../../docs/ai-foundry)
- [एआई मॉडल के लिए AZD कॉन्फ़िगरेशन](../../../../docs/ai-foundry)
- [डिप्लॉयमेंट पैटर्न](../../../../docs/ai-foundry)
- [मॉडल प्रबंधन](../../../../docs/ai-foundry)
- [प्रोडक्शन विचार](../../../../docs/ai-foundry)
- [मॉनिटरिंग और ऑब्ज़र्वेबिलिटी](../../../../docs/ai-foundry)

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

| मॉडल प्रकार | उपयोग का मामला | अनुशंसित क्षमता | लागत विचार |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | चैट, प्रश्नोत्तर | 10-50 TPM | अधिकांश वर्कलोड के लिए लागत प्रभावी |
| GPT-4 | जटिल तर्क | 20-100 TPM | उच्च लागत, प्रीमियम फीचर्स के लिए उपयोग करें |
| Text-embedding-ada-002 | खोज, RAG | 30-120 TPM | सिमेंटिक सर्च के लिए आवश्यक |
| Whisper | स्पीच-टू-टेक्स्ट | 10-50 TPM | ऑडियो प्रोसेसिंग वर्कलोड |

## एआई मॉडल के लिए AZD कॉन्फ़िगरेशन

### Bicep टेम्पलेट कॉन्फ़िगरेशन

Bicep टेम्पलेट्स के माध्यम से मॉडल डिप्लॉयमेंट बनाएं:

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

### एनवायरनमेंट वेरिएबल्स

अपने एप्लिकेशन एनवायरनमेंट को कॉन्फ़िगर करें:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## डिप्लॉयमेंट पैटर्न

### पैटर्न 1: सिंगल-रीजन डिप्लॉयमेंट

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

उपयुक्त है:
- विकास और परीक्षण के लिए
- सिंगल-मार्केट एप्लिकेशन के लिए
- लागत अनुकूलन के लिए

### पैटर्न 2: मल्टी-रीजन डिप्लॉयमेंट

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

उपयुक्त है:
- वैश्विक एप्लिकेशन के लिए
- उच्च उपलब्धता आवश्यकताओं के लिए
- लोड वितरण के लिए

### पैटर्न 3: हाइब्रिड डिप्लॉयमेंट

Azure OpenAI को अन्य एआई सेवाओं के साथ मिलाएं:

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

### मॉडल अपडेट्स

मॉडल अपडेट्स के लिए AZD हुक्स का उपयोग करें:

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

एक साथ कई मॉडल संस्करण डिप्लॉय करें:

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
# Capacity calculation example
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

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ऑटो-स्केलिंग कॉन्फ़िगरेशन

कंटेनर ऐप्स के लिए ऑटो-स्केलिंग कॉन्फ़िगर करें:

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

## मॉनिटरिंग और ऑब्ज़र्वेबिलिटी

### एप्लिकेशन इनसाइट्स इंटीग्रेशन

एआई वर्कलोड्स के लिए मॉनिटरिंग कॉन्फ़िगर करें:

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

### कस्टम मेट्रिक्स

एआई-विशिष्ट मेट्रिक्स को ट्रैक करें:

```python
# Custom telemetry for AI models
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

एआई सेवा स्वास्थ्य मॉनिटरिंग लागू करें:

```python
# Health check endpoints
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Test OpenAI connection
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

1. **[Azure AI Foundry इंटीग्रेशन गाइड](azure-ai-foundry-integration.md)** की समीक्षा करें ताकि सेवा इंटीग्रेशन पैटर्न को समझा जा सके।
2. **[AI वर्कशॉप लैब](ai-workshop-lab.md)** पूरा करें ताकि व्यावहारिक अनुभव प्राप्त हो।
3. **[प्रोडक्शन एआई प्रैक्टिसेस](production-ai-practices.md)** लागू करें ताकि एंटरप्राइज़ डिप्लॉयमेंट्स के लिए तैयार हो सकें।
4. **[AI ट्रबलशूटिंग गाइड](../troubleshooting/ai-troubleshooting.md)** का अन्वेषण करें ताकि सामान्य समस्याओं का समाधान किया जा सके।

## संसाधन

- [Azure OpenAI मॉडल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [कंटेनर ऐप्स स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [एआई मॉडल लागत अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD फॉर बिगिनर्स](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - एआई-फर्स्ट डेवलपमेंट
- **⬅️ पिछला**: [Azure AI Foundry इंटीग्रेशन](azure-ai-foundry-integration.md)
- **➡️ अगला**: [AI वर्कशॉप लैब](ai-workshop-lab.md)
- **🚀 अगला अध्याय**: [अध्याय 3: कॉन्फ़िगरेशन](../getting-started/configuration.md)

---

**अस्वीकरण**:  
यह दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके अनुवादित किया गया है। जबकि हम सटीकता सुनिश्चित करने का प्रयास करते हैं, कृपया ध्यान दें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल भाषा में उपलब्ध मूल दस्तावेज़ को प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम उत्तरदायी नहीं हैं।