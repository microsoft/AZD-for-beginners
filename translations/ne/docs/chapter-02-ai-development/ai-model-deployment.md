# Azure Developer CLI सँग AI मोडेल परिनियोजन

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [शुरुआतीहरूको लागि AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md)
- **➡️ अर्को**: [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

यस मार्गनिर्देशनले AI मोडेलहरू AZD टेम्प्लेटहरू प्रयोग गरी परिनियोजन गर्ने विस्तृत निर्देशनहरू प्रदान गर्दछ, मोडेल छनोटदेखि उत्पादन परिनियोजन ढाँचा सम्म सबै कुरा समेटिएको छ।

> **मान्यता नोट (२०२६-०३-२५):** यो मार्गनिर्देशनमा AZD वर्कफ्लो `azd` `1.23.12` विरुद्ध जाँच गरिएको थियो। डिफल्ट सेवा परिनियोजन विन्डो भन्दा लामो समय लग्ने AI परिनियोजनहरूको लागि, हालका AZD रिलिजहरूले `azd deploy --timeout <सेकेन्ड>` समर्थन गर्दछन्।

## सामग्री तालिका

- [मोडेल छनोट रणनीति](#मोडेल-छनोट-रणनीति)
- [AI मोडेलहरूको लागि AZD कन्फिगरेसन](#ai-मोडेलहरूको-लागि-azd-कन्फिगरेसन)
- [परिनियोजन ढाँचाहरू](#परिनियोजन-ढाँचाहरू)
- [मोडेल व्यवस्थापन](#मोडेल-व्यवस्थापन)
- [उत्पादन विचारहरू](#उत्पादन-विचारहरू)
- [अनुगमन र अवलोकन](#अनुगमन-र-अवलोकन)

## मोडेल छनोट रणनीति

### Microsoft Foundry मोडेलहरू

तपाईंको प्रयोग केसका लागि उपयुक्त मोडेल छनोट गर्नुहोस्:

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

### मोडेल क्षमता योजना

| मोडेल प्रकार | प्रयोग केस | सिफारिश गरिएको क्षमता | लागत विचारहरू |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | कुराकानी, प्रश्नोत्तर | १०-५० TPM | अधिकांश कार्यभारका लागि लागत-प्रभावकारी |
| gpt-4.1 | जटिल तर्क | २०-१०० TPM | उच्च लागत, प्रिमियम सुविधाहरूका लागि प्रयोग गर्नुहोस् |
| text-embedding-3-large | खोज, RAG | ३०-१२० TPM | सिमेन्टिक खोज र पुनःप्राप्तिको लागि बलियो पूर्वनिर्धारित विकल्प |
| Whisper | वक्तव्य-देखि-पाठ | १०-५० TPM | अडियो प्रशोधन कार्यभारहरूका लागि |

## AI मोडेलहरूको लागि AZD कन्फिगरेसन

### बाइसेप टेम्प्लेट कन्फिगरेसन

बाइसेप टेम्प्लेटमार्फत मोडेल परिनियोजनहरू सिर्जना गर्नुहोस्:

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

### वातावरण चर

आफ्नो आवेदन वातावरण कन्फिगर गर्नुहोस्:

```bash
# .env कन्फिगरेसन
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## परिनियोजन ढाँचाहरू

### ढाँचा १: एकल-क्षेत्र परिनियोजन

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

उत्तम लागि:
- विकास र परीक्षण
- एकल बजार अनुप्रयोगहरू
- लागत अनुकूलन

### ढाँचा २: बहु-क्षेत्र परिनियोजन

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

उत्तम लागि:
- विश्वव्यापी अनुप्रयोगहरू
- उच्च उपलब्धता आवश्यकताहरू
- लोड वितरण

### ढाँचा ३: हाइब्रिड परिनियोजन

Microsoft Foundry मोडेलहरूलाई अन्य AI सेवाहरूसँग संयोजन गर्नुहोस्:

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

### संस्करण नियन्त्रण

तपाईंको AZD कन्फिगरेसनमा मोडेल संस्करणहरू ट्र्याक गर्नुहोस्:

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

### मोडेल अपडेटहरू

मोडेल अपडेटका लागि AZD हुकहरू प्रयोग गर्नुहोस्:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# यदि डिप्लोयमेन्टले पूर्वनिर्धारित समय मिटर भन्दा बढी समय लिन्छ भने
azd deploy --timeout 1800
```

### A/B परीक्षण

धेरै मोडेल संस्करणहरू परिनियोजन गर्नुहोस्:

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

### अटो-स्केलिङ कन्फिगरेसन

कन्टेनर एप्सको लागि अटो-स्केलिङ कन्फिगर गर्नुहोस्:

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

लागत नियन्त्रणहरू कार्यान्वयन गर्नुहोस्:

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

## अनुगमन र अवलोकन

### एप्लिकेशन इन्साइट्स एकीकरण

AI कार्यभारहरूको लागि अनुगमन कन्फिगर गर्नुहोस्:

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

AI-विशिष्ट मेट्रिक्स ट्र्याक गर्नुहोस्:

```python
# एआई मोडेलहरूको लागि अनुकूल टेलिमेट्री
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

### स्वास्थ्य जाँचहरू

AI सेवा स्वास्थ्य अनुगमन कार्यान्वयन गर्नुहोस्:

```python
# स्वास्थ्य जाँच अन्तबिन्दुहरू
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI जडान परीक्षण गर्नुहोस्
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

## आगामी कदमहरू

1. **[Microsoft Foundry एकीकरण गाइड](microsoft-foundry-integration.md)** सेवा एकीकरण ढाँचाहरूका लागि समीक्षा गर्नुहोस्
2. **[AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md)** बाट व्यावहारिक अनुभव प्राप्त गर्नुहोस्
3. **[उत्पादन AI अभ्यासहरू](production-ai-practices.md)** कार्यान्वयन गर्नुहोस् उद्यम परिनियोजनहरूको लागि
4. **[AI समस्या समाधान गाइड](../chapter-07-troubleshooting/ai-troubleshooting.md)** मा सामान्य समस्याहरूको लागि अन्वेषण गर्नुहोस्

## स्रोतहरू

- [Microsoft Foundry मोडेल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तावेज़](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [कन्टेनर एप्स स्केलिङ](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI मोडेल लागत अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स गृहपृष्ठ**: [शुरुआतीहरूको लागि AZD](../../README.md)
- **📖 वर्तमान अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [Microsoft Foundry एकीकरण](microsoft-foundry-integration.md)
- **➡️ अर्को**: [AI कार्यशाला प्रयोगशाला](ai-workshop-lab.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरी अनुवाद गरिएको हो। हामी शुद्धताको लागि प्रयासरत छौं, तर कृपया जानकार हुनुहोस् कि स्वचालित अनुवादमा त्रुटिहरू वा असत्यताहरू हुन सक्छन्। मूल दस्तावेज़ आफ्नो मातृ भाषामा आधिकारिक स्रोतको रूपमा मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलतफहमी वा गलत व्याख्याहरूका लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->