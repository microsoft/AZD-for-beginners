# Azure Developer CLI के साथ AI मॉडल तैनाती

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ अगला**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 अगला अध्याय**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

यह गाइड AZD टेम्पलेट्स का उपयोग करके AI मॉडल की तैनाती के लिए व्यापक निर्देश प्रदान करता है, जो मॉडल चयन से लेकर उत्पादन तैनाती पैटर्न तक सब कुछ शामिल करता है।

> **मान्यता नोट (2026-03-25):** इस गाइड में AZD वर्कफ़्लो को `azd` `1.23.12` के खिलाफ जाँचा गया था। उन AI तैनातियों के लिए जो डिफ़ॉल्ट सेवा तैनाती विंडो से अधिक समय लेते हैं, वर्तमान AZD संस्करण `azd deploy --timeout <seconds>` का समर्थन करते हैं।

## सामग्री सारणी

- [मॉडल चयन रणनीति](#मॉडल-चयन-रणनीति)
- [AI मॉडल के लिए AZD कॉन्फ़िगरेशन](#ai-मॉडल-के-लिए-azd-कॉन्फ़िगरेशन)
- [तैनाती पैटर्न](#तैनाती-पैटर्न)
- [मॉडल प्रबंधन](#मॉडल-प्रबंधन)
- [उत्पादन विचार](#उत्पादन-विचार)
- [निगरानी और अवलोकन](#निगरानी-और-अवलोकन)

## मॉडल चयन रणनीति

### Microsoft Foundry मॉडल

अपने उपयोग मामले के लिए सही मॉडल चुनें:

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

### मॉडल क्षमता योजना

| मॉडल प्रकार | उपयोग मामला | अनुशंसित क्षमता | लागत विचार |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | चैट, प्रश्नोत्तर | 10-50 TPM | अधिकांश वर्कलोड के लिए लागत प्रभावी |
| gpt-4.1 | जटिल तर्क | 20-100 TPM | उच्च लागत, प्रीमियम सुविधाओं के लिए उपयोग करें |
| text-embedding-3-large | खोज, RAG | 30-120 TPM | सेमांटिक खोज और पुनर्प्राप्ति के लिए मजबूत डिफ़ॉल्ट विकल्प |
| Whisper | भाषण से पाठ | 10-50 TPM | ऑडियो प्रसंस्करण कार्यभार |

## AI मॉडल के लिए AZD कॉन्फ़िगरेशन

### Bicep टेम्पलेट कॉन्फ़िगरेशन

Bicep टेम्पलेट्स के जरिए मॉडल तैनाती बनाएं:

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

### पर्यावरण चर

अपने आवेदन पर्यावरण को कॉन्फ़िगर करें:

```bash
# .env कॉन्फ़िगरेशन
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## तैनाती पैटर्न

### पैटर्न 1: सिंगल-क्षेत्र तैनाती

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

उत्तम के लिए:
- विकास और परीक्षण
- एकल-बाजार अनुप्रयोग
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

उत्तम के लिए:
- वैश्विक अनुप्रयोग
- उच्च उपलब्धता आवश्यकताएँ
- लोड वितरण

### पैटर्न 3: संकर तैनाती

Microsoft Foundry मॉडल्स को अन्य AI सेवाओं के साथ मिलाएं:

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

अपने AZD कॉन्फ़िगरेशन में मॉडल संस्करण ट्रैक करें:

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

### मॉडल अपडेट्स

मॉडल अपडेट के लिए AZD हुक्स का उपयोग करें:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# यदि डिप्लॉयमेंट डिफ़ॉल्ट टाइमआउट से अधिक समय लेता है
azd deploy --timeout 1800
```

### A/B परीक्षण

एक से अधिक मॉडल संस्करण तैनात करें:

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

### क्षमता योजना

उपयोग पैटर्न के आधार पर आवश्यक क्षमता की गणना करें:

```python
# क्षमता गणना उदाहरण
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

# उदाहरण उपयोग
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

## निगरानी और अवलोकन

### एप्लिकेशन इनसाइट्स इंटीग्रेशन

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

### कस्टम मेट्रिक्स

AI-विशिष्ट मेट्रिक्स ट्रैक करें:

```python
# एआई मॉडल के लिए कस्टम टेलीमेट्री
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

### स्वास्थ्य जांच

AI सेवा स्वास्थ्य निगरानी लागू करें:

```python
# स्वास्थ्य जांच एंडपॉइंट्स
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI कनेक्शन का परीक्षण करें
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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** में सेवा एकीकरण पैटर्न की समीक्षा करें
2. **[AI Workshop Lab](ai-workshop-lab.md)** पूरा करें ताकि आपको व्यावहारिक अनुभव मिले
3. **[Production AI Practices](production-ai-practices.md)** लागू करें एंटरप्राइज तैनाती के लिए
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** देखें सामान्य समस्याओं के लिए

## संसाधन

- [Microsoft Foundry Models मॉडल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI डाक्यूमेंटेशन](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मॉडल लागत अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेविगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ पिछला**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ अगला**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 अगला अध्याय**: [अध्याय 3: विन्यास](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
इस दस्तावेज़ का अनुवाद AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) का उपयोग करके किया गया है। जबकि हम सटीकता के लिए प्रयासरत हैं, कृपया ध्यान रखें कि स्वचालित अनुवाद में त्रुटियां या अशुद्धियां हो सकती हैं। मूल दस्तावेज़ अपनी मूल भाषा में प्रामाणिक स्रोत माना जाना चाहिए। महत्वपूर्ण जानकारी के लिए, पेशेवर मानव अनुवाद की सिफारिश की जाती है। इस अनुवाद के उपयोग से उत्पन्न किसी भी गलतफहमी या गलत व्याख्या के लिए हम जिम्मेदार नहीं हैं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->