# Azure Developer CLI सह AI मॉडेल डिप्लॉयमेंट

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-फर्स्ट डेव्हलपमेंट
- **⬅️ मागील**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ पुढील**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

हा मार्गदर्शक AZD टेम्प्लेट्स वापरून AI मॉडेल्स डिप्लॉय करण्यासाठी संपूर्ण सूचना प्रदान करतो, ज्यात मॉडेल निवडण्यापासून उत्पादन डिप्लॉयमेंट पॅटर्न्सपर्यंत सर्वकाही समाविष्ट आहे.

> **वैधता नोंद (2026-07-13):** या मार्गदर्शकातील AZD कार्यप्रवाह `azd` `1.27.1` विरुद्ध तपासण्यात आला आहे. जे AI डिप्लॉयमेंट्स डीफॉल्ट सेवा डिप्लॉयमेंट विंडोपेक्षा जास्त वेळ घेतात, त्यासाठी सध्याच्या AZD आवृत्त्या `azd deploy --timeout <seconds>` ला समर्थन करतात.

## अनुक्रमणिका

- [मॉडेल निवड धोरण](#मॉडेल-निवड-धोरण)
- [AI मॉडेलसाठी AZD कॉन्फिगरेशन](#ai-मॉडेलसाठी-azd-कॉन्फिगरेशन)
- [डिप्लॉयमेंट पॅटर्न्स](#डिप्लॉयमेंट-पॅटर्न्स)
- [मॉडेल व्यवस्थापन](#मॉडेल-व्यवस्थापन)
- [उत्पादन विचार](#उत्पादन-विचार)
- [मॉनिटरिंग आणि निरीक्षणीयता](#मॉनिटरिंग-आणि-निरीक्षणीयता)

## मॉडेल निवड धोरण

### Microsoft Foundry मॉडेल्स

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

| मॉडेल प्रकार | वापर प्रकरण | शिफारस केलेली क्षमता | खर्च विचार |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | चॅट, प्रश्नोत्तर | 10-50 TPM | बहुतेक कार्यभारांसाठी किफायतशीर |
| gpt-4.1 | जटिल विचार | 20-100 TPM | उच्च खर्च, प्रीमियम फिचर्ससाठी वापरा |
| text-embedding-3-large | शोध, RAG | 30-120 TPM | सैमॅंटिक शोध आणि पुनर्प्राप्तीसाठी मजबूत डीफॉल्ट निवड |
| Whisper | स्पीच-टू-टेक्स्ट | 10-50 TPM | ऑडिओ प्रक्रिया कार्यभारांसाठी |

## AI मॉडेलसाठी AZD कॉन्फिगरेशन

### बाइसप टेम्प्लेट कॉन्फिगरेशन

बाइसप टेम्प्लेट्सद्वारे मॉडेल डिप्लॉयमेंट तयार करा:

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

### पर्यावरण चल (Environment Variables)

आपल्या अनुप्रयोगाचे पर्यावरण कॉन्फिगर करा:

```bash
# .env कॉन्फिगरेशन
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## डिप्लॉयमेंट पॅटर्न्स

### पॅटर्न 1: सिंगल-रीजन डिप्लॉयमेंट

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

यासाठी उत्तम:
- विकास आणि चाचणीसाठी
- सिंगल-मार्केट अनुप्रयोगांसाठी
- खर्च ऑप्टिमायझेशनसाठी

### पॅटर्न 2: मल्टी-रीजन डिप्लॉयमेंट

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

यासाठी उत्तम:
- जागतिक अनुप्रयोगांसाठी
- उच्च उपलब्धतेच्या गरजांसाठी
- लोड वितरणासाठी

### पॅटर्न 3: हायब्रिड डिप्लॉयमेंट

Microsoft Foundry मॉडेल्स इतर AI सेवा सह एकत्र करा:

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

### मॉडेल अपडेट्स

मॉडेल अपडेट्ससाठी AZD हुक्स वापरा:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# डिप्लॉयमेंट डिफॉल्ट टाइमआउटनंतर जास्त वेळ घेत असल्यास
azd deploy --timeout 1800
```

### A/B टेस्टिंग

अनेक मॉडेल आवृत्त्या डिप्लॉय करा:

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

वापर पॅटर्न्सवर आधारित आवश्यक क्षमता गणना करा:

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

# उदाहरण वापर
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ऑटो-स्केलिंग कॉन्फिगरेशन

कंटेनर ॲप्ससाठी ऑटो-स्केलिंग कॉन्फिगर करा:

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

### खर्च ऑप्टिमायझेशन

खर्च नियंत्रण अमलात आणा:

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

## मॉनिटरिंग आणि निरीक्षणीयता

### अनुप्रयोग अंतर्दृष्टी एकत्रीकरण

AI कार्यभारांसाठी मॉनिटरिंग कॉन्फिगर करा:

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

AI-विशिष्ट मेट्रिक्स ट्रॅक करा:

```python
# AI मॉडेलसाठी सानुकूल टेलिमेट्री
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

AI सेवा आरोग्य मॉनिटरिंग अमलात आणा:

```python
# आरोग्य तपासणी समाप्ती बिंदू
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI कनेक्शन चाचणी करा
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

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** सेवा एकत्रीकरण नमुन्यांसाठी पुनरावलोकन करा
2. **[AI Workshop Lab](ai-workshop-lab.md)** पूर्ण करा प्रत्यक्ष अनुभवासाठी
3. **[Production AI Practices](production-ai-practices.md)** उद्यम डिप्लॉयमेंटसाठी अमलात आणा
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** सामान्य समस्या साठी तपासा

## संसाधने

- [Microsoft Foundry मॉडेल्स मॉडेल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [कंटेनर ॲप्स स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मॉडेल खर्च ऑप्टिमायझेशन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-फर्स्ट डेव्हलपमेंट
- **⬅️ मागील**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ पुढील**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 पुढील अध्याय**: [अध्याय 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) चा वापर करून अनुवादित केला आहे. जरी आम्ही अचूकतेसाठी प्रयत्न करतो, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकतेची कमतरता असू शकते. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला पाहिजे. महत्त्वाची माहिती असल्यास, व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराच्या वापरामुळे उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावणीसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->