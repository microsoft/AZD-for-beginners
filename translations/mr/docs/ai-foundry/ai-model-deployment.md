<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d1b97c6d936e9b4f71fc2972306dfb7f",
  "translation_date": "2025-09-12T19:37:16+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "mr"
}
-->
# Azure Developer CLI सह AI मॉडेल डिप्लॉयमेंट

**मागील:** [Azure AI Foundry Integration](azure-ai-foundry-integration.md) | **पुढील:** [AI Workshop Lab](ai-workshop-lab.md)

ही मार्गदर्शिका AZD टेम्पलेट्स वापरून AI मॉडेल्स डिप्लॉय करण्यासाठी सविस्तर सूचना प्रदान करते, ज्यामध्ये मॉडेल निवडण्यापासून उत्पादन डिप्लॉयमेंट पॅटर्नपर्यंत सर्व काही समाविष्ट आहे.

## विषय सूची

- [मॉडेल निवडण्याची रणनीती](../../../../docs/ai-foundry)
- [AI मॉडेल्ससाठी AZD कॉन्फिगरेशन](../../../../docs/ai-foundry)
- [डिप्लॉयमेंट पॅटर्न्स](../../../../docs/ai-foundry)
- [मॉडेल व्यवस्थापन](../../../../docs/ai-foundry)
- [उत्पादन विचार](../../../../docs/ai-foundry)
- [मॉनिटरिंग आणि निरीक्षण](../../../../docs/ai-foundry)

## मॉडेल निवडण्याची रणनीती

### Azure OpenAI मॉडेल्स

तुमच्या उपयोगासाठी योग्य मॉडेल निवडा:

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

### मॉडेल क्षमता नियोजन

| मॉडेल प्रकार | उपयोग | शिफारस केलेली क्षमता | खर्च विचार |
|--------------|-------|---------------------|-----------|
| GPT-4o-mini | चॅट, प्रश्नोत्तर | 10-50 TPM | बहुतेक वर्कलोडसाठी खर्च-प्रभावी |
| GPT-4 | जटिल विचार | 20-100 TPM | उच्च खर्च, प्रीमियम वैशिष्ट्यांसाठी वापरा |
| Text-embedding-ada-002 | शोध, RAG | 30-120 TPM | सिमॅंटिक शोधासाठी आवश्यक |
| Whisper | स्पीच-टू-टेक्स्ट | 10-50 TPM | ऑडिओ प्रक्रिया वर्कलोडसाठी |

## AI मॉडेल्ससाठी AZD कॉन्फिगरेशन

### Bicep टेम्पलेट कॉन्फिगरेशन

Bicep टेम्पलेट्सद्वारे मॉडेल डिप्लॉयमेंट तयार करा:

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

### पर्यावरणीय व्हेरिएबल्स

तुमच्या अॅप्लिकेशनचे पर्यावरण कॉन्फिगर करा:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

योग्य आहे:
- विकास आणि चाचणीसाठी
- सिंगल-मार्केट अॅप्लिकेशन्ससाठी
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

योग्य आहे:
- जागतिक अॅप्लिकेशन्ससाठी
- उच्च उपलब्धता आवश्यकता
- लोड वितरण

### पॅटर्न 3: हायब्रिड डिप्लॉयमेंट

Azure OpenAI इतर AI सेवांसह एकत्र करा:

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

### व्हर्जन कंट्रोल

तुमच्या AZD कॉन्फिगरेशनमध्ये मॉडेल व्हर्जन्स ट्रॅक करा:

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

### मॉडेल अपडेट्स

AZD हुक्स वापरून मॉडेल अपडेट्स करा:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B टेस्टिंग

एकाधिक मॉडेल व्हर्जन्स डिप्लॉय करा:

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

## उत्पादन विचार

### क्षमता नियोजन

वापर पॅटर्नवर आधारित आवश्यक क्षमता मोजा:

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

### ऑटो-स्केलिंग कॉन्फिगरेशन

कंटेनर अॅप्ससाठी ऑटो-स्केलिंग कॉन्फिगर करा:

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

खर्च नियंत्रण अंमलात आणा:

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

### अॅप्लिकेशन इनसाइट्स इंटिग्रेशन

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

### कस्टम मेट्रिक्स

AI-विशिष्ट मेट्रिक्स ट्रॅक करा:

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

AI सेवा आरोग्य मॉनिटरिंग अंमलात आणा:

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

## पुढील पायऱ्या

1. **[Azure AI Foundry Integration Guide](azure-ai-foundry-integration.md)** पुनरावलोकन करा सेवा इंटिग्रेशन पॅटर्नसाठी
2. **[AI Workshop Lab](ai-workshop-lab.md)** पूर्ण करा व्यावहारिक अनुभवासाठी
3. **[Production AI Practices](production-ai-practices.md)** अंमलात आणा एंटरप्राइझ डिप्लॉयमेंटसाठी
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)** एक्सप्लोर करा सामान्य समस्यांसाठी

## संसाधने

- [Azure OpenAI मॉडेल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [कंटेनर अॅप्स स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मॉडेल खर्च ऑप्टिमायझेशन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**मागील:** [Azure AI Foundry Integration](azure-ai-foundry-integration.md) | **पुढील:** [AI Workshop Lab](ai-workshop-lab.md)

---

**अस्वीकृती**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित करण्यात आला आहे. आम्ही अचूकतेसाठी प्रयत्नशील असलो तरी कृपया लक्षात ठेवा की स्वयंचलित भाषांतरे त्रुटी किंवा अचूकतेच्या अभावाने ग्रस्त असू शकतात. मूळ भाषेतील दस्तऐवज हा अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीसाठी व्यावसायिक मानवी भाषांतराची शिफारस केली जाते. या भाषांतराचा वापर करून उद्भवलेल्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थासाठी आम्ही जबाबदार राहणार नाही.