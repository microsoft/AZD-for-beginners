# Azure Developer CLI सँग AI मोडेल परिनियोजन

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD - आरम्भिकहरूको लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md)
- **➡️ अर्को**: [AI कार्यशाला ल्याब](ai-workshop-lab.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

यो मार्गदर्शकले AZD टेम्प्लेटहरू प्रयोग गरेर AI मोडेलहरू तैनाथ गर्ने व्यापक निर्देशनहरू प्रदान गर्छ, मोडेल छनोटदेखि उत्पादन तैनाथी ढाँचाहरू सम्म सबै कुरा समेट्छ।

## सामग्री सूची

- [मोडेल छनौट रणनीति](../../../../docs/chapter-02-ai-development)
- [AZD कन्फिगरेशन AI मोडेलहरूको लागि](../../../../docs/chapter-02-ai-development)
- [तैनाथी ढाँचाहरू](../../../../docs/chapter-02-ai-development)
- [मोडेल व्यवस्थापन](../../../../docs/chapter-02-ai-development)
- [उत्पादन विचारहरू](../../../../docs/chapter-02-ai-development)
- [अनुगमन र अवलोकनीयता](../../../../docs/chapter-02-ai-development)

## मोडेल छनौट रणनीति

### Microsoft Foundry मोडेलहरू

तपाईंको प्रयोग केसको लागि सही मोडेल छान्नुहोस्:

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

### मोडेल क्षमता योजना

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | च्याट, प्रश्नोत्तर | 10-50 TPM | धेरै कार्यभारका लागि लागत-प्रभावी |
| gpt-4.1 | जटिल तर्क | 20-100 TPM | उच्च लागत, प्रिमियम सुविधाहरूको लागि प्रयोग गर्नुहोस् |
| Text-embedding-ada-002 | सर्च, RAG | 30-120 TPM | सिमेन्टिक सर्चका लागि आवश्यक |
| Whisper | भाषण-देखि-पाठ | 10-50 TPM | अडियो प्रशोधन कार्यभार |

## AZD कन्फिगरेशन AI मोडेलहरूको लागि

### Bicep टेम्प्लेट कन्फिगरेशन

Bicep टेम्प्लेटहरू मार्फत मोडेल तैनाथीहरू सिर्जना गर्नुहोस्:

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

### वातावरण भेरिएबलहरू

आफ्नो एप्लिकेशन वातावरण कन्फिगर गर्नुहोस्:

```bash
# .env विन्यास
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## तैनाथी ढाँचाहरू

### ढाँचा 1: एकल-क्षेत्र तैनाथी

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

लागि उपयुक्त:
- विकास र परीक्षण
- एकल-बजार अनुप्रयोगहरू
- लागत अनुकूलन

### ढाँचा 2: बहु-क्षेत्र तैनाथी

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

लागि उपयुक्त:
- वैश्विक अनुप्रयोगहरू
- उच्च उपलब्धता आवश्यकताहरू
- लोड विभाजन

### ढाँचा 3: हाइब्रिड तैनाथी

Microsoft Foundry मोडेलहरूलाई अन्य AI सेवाहरू सँग संयोजन गर्नुहोस्:

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

## मोडेल व्यवस्थापन

### भर्सन नियन्त्रण

आफ्नो AZD कन्फिगरेसनमा मोडेल भर्सनहरू ट्र्याक गर्नुहोस्:

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

### मोडेल अपडेटहरू

मोডेल अपडेटहरूको लागि AZD हुकहरू प्रयोग गर्नुहोस्:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B परीक्षण

धेरै मोडेल भर्सनहरू तैनाथ गर्नुहोस्:

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

## उत्पादन विचारहरू

### क्षमता योजना

प्रयोग ढाँचाहरूको आधारमा आवश्यक क्षमता गणना गर्नुहोस्:

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

# उदाहरण प्रयोग
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### अटो-स्केलिङ कन्फिगरेशन

Container Apps का लागि अटो-स्केलिङ कन्फिगर गर्नुहोस्:

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

लागत नियन्त्रणहरू लागू गर्नुहोस्:

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

## अनुगमन र अवलोकनीयता

### Application Insights एकीकरण

AI कार्यभारका लागि अनुगमन कन्फिगर गर्नुहोस्:

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

### अनुकूलित मेट्रिक्स

AI-विशिष्ट मेट्रिक्स ट्र्याक गर्नुहोस्:

```python
# एआई मोडेलहरूको लागि अनुकूलित टेलीमेट्री
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

### हेल्थ चेकहरू

AI सेवा स्वास्थ्य अनुगमन लागू गर्नुहोस्:

```python
# स्वास्थ्य जाँच एन्डपोइन्टहरू
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI कनेक्शन जाँच
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

## अर्को कदमहरू

1. **सेवा एकीकरण ढाँचाहरूको लागि [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md) समीक्षा गर्नुहोस्**
2. **हातेमालो अनुभवका लागि [AI कार्यशाला ल्याब](ai-workshop-lab.md) पूरा गर्नुहोस्**
3. **उद्यम परिनियोजनहरूका लागि [उत्पादन AI अभ्यासहरू](production-ai-practices.md) कार्यान्वयन गर्नुहोस्**
4. **साधारण समस्याहरूको लागि [AI समस्यासमाधान मार्गदर्शिका](../chapter-07-troubleshooting/ai-troubleshooting.md) अन्वेषण गर्नुहोस्**

## स्रोतहरू

- [Microsoft Foundry मोडेल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI प्रलेखन](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps स्केलिङ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मोडेल लागत अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD - आरम्भिकहरूको लागि](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय 2 - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md)
- **➡️ अर्को**: [AI कार्यशाला ल्याब](ai-workshop-lab.md)
- **🚀 अर्को अध्याय**: [अध्याय 3: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
यस दस्तावेजलाई AI अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी शुद्धताका लागि प्रयासरत छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादमा त्रुटि वा अशुद्धता हुन सक्छ। मूल भाषामा रहेको दस्तावेजलाई अधिकारिक स्रोत मानिनु पर्छ। महत्त्वपूर्ण जानकारीका लागि पेशेवर मानव अनुवाद सिफारिश गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याका लागि हामी उत्तरदायी छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->