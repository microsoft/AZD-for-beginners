# Azure Developer CLI संग AI मोडेल डिप्लोयमेन्ट

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ अर्को**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

यस गाइडले AZD टेम्प्लेटहरू प्रयोग गरी AI मोडेलहरू डिप्लोय गर्ने पूर्ण निर्देशनहरू प्रदान गर्छ, मोडेल छनौटदेखि उत्पाद डिप्लोयमेन्ट ढाँचाहरू सम्म सबै कुरा समेट्छ।

> **प्रमाणीकरण नोट (२०२६-०७-१३):** यस गाइडको AZD वर्कफ्लो `azd` `1.27.1` विरुद्ध जाँच गरिएको थियो। डिफल्ट सेवा डिप्लोयमेन्ट विन्डो भन्दा लामो समय लाग्ने AI डिप्लोयमेन्टहरूका लागि, हालका AZD रिलिजहरूले `azd deploy --timeout <seconds>` समर्थन गर्छन्।

## सामग्री तालिका

- [मोडेल छनौट रणनीति](#मोडेल-छनौट-रणनीति)
- [AI मोडेलहरूको लागि AZD कन्फिगरेसन](#ai-मोडेलहरूको-लागि-azd-कन्फिगरेसन)
- [डिप्लोयमेन्ट ढाँचाहरू](#डिप्लोयमेन्ट-ढाँचाहरू)
- [मोडेल व्यवस्थापन](#मोडेल-व्यवस्थापन)
- [उत्पादन विचारहरू](#उत्पादन-विचारहरू)
- [अनुगमन र अवलोकन क्षमता](#अनुगमन-र-अवलोकन-क्षमता)

## मोडेल छनौट रणनीति

### Microsoft Foundry मोडेलहरू

तपाईंको प्रयोगको केसका लागि सही मोडेल छान्नुहोस्:

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

| मोडेल प्रकार | प्रयोग केस | सिफारिस गरिएको क्षमता | लागत विचारहरू |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | च्याट, प्रश्नोत्तर | १०-५० TPM | धेरै कार्यभारका लागि लागत-प्रभावकारी |
| gpt-4.1 | जटिल तर्क | २०-१०० TPM | उच्च लागत, प्रिमियम सुविधाहरूका लागि प्रयोग गर्नुहोस् |
| text-embedding-3-large | खोज, RAG | ३०-१२० TPM | सेम्यान्टिक खोज र पुनःप्राप्तिका लागि बलियो डिफल्ट विकल्प |
| Whisper | भाषण-बाट-पाठ | १०-५० TPM | अडियो प्रशोधन कार्यभारहरूका लागि |

## AI मोडेलहरूको लागि AZD कन्फिगरेसन

### Bicep टेम्प्लेट कन्फिगरेसन

Bicep टेम्प्लेटमार्फत मोडेल डिप्लोयमेन्टहरू सिर्जना गर्नुहोस्:

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

### वातावरण भेरिएबलहरू

आफ्नो अनुप्रयोग वातावरण कन्फिगर गर्नुहोस्:

```bash
# .env कन्फिगरेसन
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## डिप्लोयमेन्ट ढाँचाहरू

### ढाँचा १: एकल-प्रदेश डिप्लोयमेन्ट

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

सबैभन्दा उपयुक्त:
- विकास र परीक्षणका लागि
- एकल बजार अनुप्रयोगहरू
- लागत अनुकूलन

### ढाँचा २: बहु-प्रदेश डिप्लोयमेन्ट

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

सबैभन्दा उपयुक्त:
- विश्वव्यापी अनुप्रयोगहरू
- उच्च उपलब्धता आवश्यकताहरू
- लोड वितरण

### ढाँचा ३: हाइब्रिड डिप्लोयमेन्ट

Microsoft Foundry मोडेलहरूलाई अन्य AI सेवाहरूसँग मिलाउनुहोस्:

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

आफ्नो AZD कन्फिगरेसनमा मोडेल संस्करणहरू ट्र्याक गर्नुहोस्:

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

मोडेल अपडेटहरूका लागि AZD हुकहरू प्रयोग गर्नुहोस्:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# यदि मेसिनस्थापनले पूर्वनिर्धारित समयसीमा भन्दा बढी समय लिन्छ भने
azd deploy --timeout 1800
```

### A/B परीक्षण

धेरै मोडेल संस्करणहरू डिप्लोय गर्नुहोस्:

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

लागत नियन्त्रण लागू गर्नुहोस्:

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

## अनुगमन र अवलोकन क्षमता

### अनुप्रयोग इनसाइट्स एकीकरण

AI कार्यभारहरूको अनुगमन कन्फिगर गर्नुहोस्:

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
# एआई मोडेलहरूको लागि अनुकूलन टेलिमेट्री
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

AI सेवा स्वास्थ्य अनुगमन लागू गर्नुहोस्:

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

## अर्को कदमहरू

१. **[Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** मा सेवा एकीकरण ढाँचाहरू समीक्षा गर्नुहोस्
२. **[AI Workshop Lab](ai-workshop-lab.md)** पूरा गरी व्यावहारिक अनुभव प्राप्त गर्नुहोस्
३. **[Production AI Practices](production-ai-practices.md)** कार्यान्वयन गरी एन्तरप्राइज डिप्लोयमेन्टहरूका लागि
४. **[AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** मा सामान्य समस्याहरू अन्वेषण गर्नुहोस्

## स्रोतहरू

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अध्याय नेभिगेसन:**
- **📚 कोर्स होम**: [AZD For Beginners](../../README.md)
- **📖 हालको अध्याय**: अध्याय २ - AI-प्रथम विकास
- **⬅️ अघिल्लो**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ अर्को**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 अर्को अध्याय**: [अध्याय ३: कन्फिगरेसन](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**अस्वीकरण**:
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको हो। हामी सही हुन प्रयास गर्छौं, तर कृपया जानकार हुनुस् कि स्वचालित अनुवादमा त्रुटिहरू वा अशुद्धताहरू हुन सक्छन्। मूल दस्तावेज़ यसको मूल भाषामा आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीका लागि व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न कुनै पनि गलत बुझाइ वा त्रुटिको लागि हामी जिम्मेवार छैनौं।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->