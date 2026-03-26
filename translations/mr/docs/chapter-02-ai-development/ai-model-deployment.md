# Azure Developer CLI सह AI मॉडेल तैनाती

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ पुढील**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

हा मार्गदर्शक AZD टेंप्लेट्स वापरून AI मॉडेल तैनात करण्यासाठी संपूर्ण सूचना प्रदान करतो, जेथे मॉडेल निवडण्यापासून ते उत्पादन तैनातीच्या पॅटर्न्स पर्यंत सर्व काही समाविष्ट आहे.

## आशय सूची

- [मॉडेल निवड धोरण](../../../../docs/chapter-02-ai-development)
- [AI मॉडेलसाठी AZD कॉन्फिगरेशन](../../../../docs/chapter-02-ai-development)
- [तैनातीचे पॅटर्न्स](../../../../docs/chapter-02-ai-development)
- [मॉडेल व्यवस्थापन](../../../../docs/chapter-02-ai-development)
- [उत्पादन विचारधारा](../../../../docs/chapter-02-ai-development)
- [निरीक्षण आणि परीक्षण](../../../../docs/chapter-02-ai-development)

## मॉडेल निवड धोरण

### Microsoft Foundry मॉडेल्स

आपल्या वापर प्रकरणासाठी योग्य मॉडेल निवडा:

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

### मॉडेल क्षमतेची योजना

| मॉडेल प्रकार | वापर प्रकरण | शिफारस केलेली क्षमता | खर्च विचारधारा |
|--------------|-------------|----------------------|----------------|
| gpt-4.1-mini | चॅट, प्रश्नोत्तरे | 10-50 TPM | बहुतेक कार्यभारांसाठी खर्च-प्रभावी |
| gpt-4.1 | जटिल विचार | 20-100 TPM | उच्च खर्च, प्रीमियम वैशिष्ट्यांसाठी वापर |
| Text-embedding-ada-002 | शोध, RAG | 30-120 TPM | अर्थपूर्ण शोधासाठी आवश्यक |
| Whisper | स्पीच-टू-टेक्स्ट | 10-50 TPM | ऑडिओ प्रक्रिया कार्यभारांसाठी |

## AI मॉडेलसाठी AZD कॉन्फिगरेशन

### बिसेप टेंप्लेट कॉन्फिगरेशन

बिसेप टेंप्लेट्सद्वारे मॉडेल तैनाती तयार करा:

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

### पर्यावरण चल

आपल्या अनुप्रयोगाच्या पर्यावरणाची रचना करा:

```bash
# .env संरचना
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## तैनातीचे पॅटर्न्स

### पॅटर्न 1: सिंगल-प्रदेश तैनात

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

सर्वोत्तम आहे:
- विकास आणि चाचणीसाठी
- एकल बाजार अनुप्रयोगांसाठी
- खर्च अनुकूलनासाठी

### पॅटर्न 2: बहु-प्रदेश तैनात

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

सर्वोत्तम आहे:
- जागतिक अनुप्रयोगांसाठी
- उच्च उपलब्धता आवश्यकतांसाठी
- लोड वितरणासाठी

### पॅटर्न 3: हायब्रिड तैनात

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

मॉडेल अपडेट्ससाठी AZD हुक्स वापरा:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B चाचणी

अनेक मॉडेल आवृत्त्या तैनात करा:

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

## उत्पादन विचारधारा

### क्षमता योजना

वापर पॅटर्न्सवर आधारित आवश्यक क्षमता गणना करा:

```python
# क्षमता गणनेचा उदाहरण
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

कंटेनर अ‍ॅप्ससाठी ऑटो-स्केलिंग कॉन्फिगर करा:

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

## निरीक्षण आणि परीक्षण

### अनुप्रयोग अंतर्दृष्टी एकत्रीकरण

AI कार्यभारांसाठी निरीक्षण कॉन्फिगर करा:

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
# AI मॉडेल्ससाठी सानुकूल टेलिमेट्री
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

### हेल्थ तपासण्या

AI सेवा आरोग्य निरीक्षण लागू करा:

```python
# आरोग्य तपासणी एंडपॉइंट्स
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI कनेक्शन तपासा
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

## पुढील टप्पे

1. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** वाचा सेवा एकत्रीकरण पॅटर्नसाठी
2. **[AI Workshop Lab](ai-workshop-lab.md)** पूर्ण करा प्रत्यक्ष अनुभवासाठी
3. **[Production AI Practices](production-ai-practices.md)** अंमलात आणा एंटरप्राइझ तैनातीसाठी
4. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** तपासा सामान्य समस्या

## साधने

- [Microsoft Foundry Models मॉडेल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तऐवज](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [कंटेनर अ‍ॅप्स स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मॉडेल खर्च अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**प्रकरण नेव्हिगेशन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 वर्तमान प्रकरण**: प्रकरण 2 - AI-प्रथम विकास
- **⬅️ मागील**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ पुढील**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 पुढील प्रकरण**: [प्रकरण 3: कॉन्फिगरेशन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
हा दस्तऐवज AI भाषांतर सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) वापरून भाषांतरित केला आहे. आम्ही अचूकतेसाठी प्रयत्नशील आहोत, तरी कृपया लक्षात घ्या की स्वयंचलित भाषांतरांमध्ये त्रुटी किंवा अचूकता नसणे शक्य आहे. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानले जावे. महत्त्वाच्या माहितीकरिता व्यावसायिक मानवी भाषांतर शिफारसीय आहे. या भाषांतराच्या वापरातून झालेल्या कोणत्याही गैरसमजुतीं किंवा चुकीच्या अर्थव्यवस्थेसाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->