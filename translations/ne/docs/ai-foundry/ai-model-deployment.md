<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d1b97c6d936e9b4f71fc2972306dfb7f",
  "translation_date": "2025-09-12T19:37:32+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "ne"
}
-->
# एआई मोडेल परिनियोजन Azure Developer CLI को प्रयोग गरेर

**अघिल्लो:** [Azure AI Foundry Integration](azure-ai-foundry-integration.md) | **अर्को:** [AI Workshop Lab](ai-workshop-lab.md)

यो मार्गदर्शनले AZD टेम्प्लेट प्रयोग गरेर एआई मोडेलहरू परिनियोजन गर्ने विस्तृत निर्देशनहरू प्रदान गर्दछ, मोडेल चयनदेखि उत्पादन परिनियोजन ढाँचासम्म सबै कुरा समेट्छ।

## सामग्री सूची

- [मोडेल चयन रणनीति](../../../../docs/ai-foundry)
- [एआई मोडेलहरूको लागि AZD कन्फिगरेसन](../../../../docs/ai-foundry)
- [परिनियोजन ढाँचाहरू](../../../../docs/ai-foundry)
- [मोडेल व्यवस्थापन](../../../../docs/ai-foundry)
- [उत्पादन विचारहरू](../../../../docs/ai-foundry)
- [अनुगमन र अवलोकनीयता](../../../../docs/ai-foundry)

## मोडेल चयन रणनीति

### Azure OpenAI मोडेलहरू

तपाईंको प्रयोग केसको लागि सही मोडेल चयन गर्नुहोस्:

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

### मोडेल क्षमता योजना

| मोडेल प्रकार | प्रयोग केस | सिफारिस गरिएको क्षमता | लागत विचारहरू |
|--------------|------------|-----------------------|---------------|
| GPT-4o-mini | च्याट, प्रश्नोत्तर | १०-५० TPM | अधिकांश कार्यभारहरूको लागि लागत-प्रभावकारी |
| GPT-4 | जटिल तर्क | २०-१०० TPM | उच्च लागत, प्रिमियम सुविधाहरूको लागि प्रयोग गर्नुहोस् |
| Text-embedding-ada-002 | खोज, RAG | ३०-१२० TPM | अर्थपूर्ण खोजको लागि आवश्यक |
| Whisper | स्पीच-टु-टेक्स्ट | १०-५० TPM | अडियो प्रशोधन कार्यभारहरू |

## एआई मोडेलहरूको लागि AZD कन्फिगरेसन

### Bicep टेम्प्लेट कन्फिगरेसन

Bicep टेम्प्लेटहरू मार्फत मोडेल परिनियोजनहरू सिर्जना गर्नुहोस्:

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

### वातावरण चरहरू

तपाईंको एप्लिकेसन वातावरण कन्फिगर गर्नुहोस्:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4o-mini
```

उपयुक्त छ:
- विकास र परीक्षणको लागि
- एकल-बजार एप्लिकेसनहरूको लागि
- लागत अनुकूलनको लागि

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

उपयुक्त छ:
- विश्वव्यापी एप्लिकेसनहरूको लागि
- उच्च उपलब्धता आवश्यकताहरूको लागि
- लोड वितरणको लागि

### ढाँचा ३: हाइब्रिड परिनियोजन

Azure OpenAI अन्य एआई सेवाहरूको साथ संयोजन गर्नुहोस्:

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

### मोडेल अपडेटहरू

मोडेल अपडेटहरूको लागि AZD हुकहरू प्रयोग गर्नुहोस्:

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

एकै समयमा धेरै मोडेल संस्करणहरू परिनियोजन गर्नुहोस्:

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

## उत्पादन विचारहरू

### क्षमता योजना

प्रयोग ढाँचाहरूको आधारमा आवश्यक क्षमता गणना गर्नुहोस्:

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

### स्वतः-स्केलिंग कन्फिगरेसन

Container Apps को लागि स्वतः-स्केलिंग कन्फिगर गर्नुहोस्:

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

### एप्लिकेसन इनसाइट्स एकीकरण

एआई कार्यभारहरूको लागि अनुगमन कन्फिगर गर्नुहोस्:

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

एआई-विशेष मेट्रिक्स ट्र्याक गर्नुहोस्:

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

### स्वास्थ्य जाँचहरू

एआई सेवाको स्वास्थ्य अनुगमन लागू गर्नुहोस्:

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

## अगाडि के गर्ने

1. **[Azure AI Foundry Integration Guide](azure-ai-foundry-integration.md)** को सेवा एकीकरण ढाँचाहरू समीक्षा गर्नुहोस्
2. **[AI Workshop Lab](ai-workshop-lab.md)** पूरा गर्नुहोस् व्यावहारिक अनुभवको लागि
3. **[Production AI Practices](production-ai-practices.md)** लागू गर्नुहोस् उद्यम परिनियोजनहरूको लागि
4. **[AI Troubleshooting Guide](../troubleshooting/ai-troubleshooting.md)** अन्वेषण गर्नुहोस् सामान्य समस्याहरूको लागि

## स्रोतहरू

- [Azure OpenAI मोडेल उपलब्धता](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI दस्तावेज](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps स्केलिंग](https://learn.microsoft.com/azure/container-apps/scale-app)
- [एआई मोडेल लागत अनुकूलन](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**अघिल्लो:** [Azure AI Foundry Integration](azure-ai-foundry-integration.md) | **अर्को:** [AI Workshop Lab](ai-workshop-lab.md)

---

**अस्वीकरण**:  
यो दस्तावेज़ AI अनुवाद सेवा [Co-op Translator](https://github.com/Azure/co-op-translator) प्रयोग गरेर अनुवाद गरिएको छ। हामी शुद्धताको लागि प्रयास गर्छौं, तर कृपया ध्यान दिनुहोस् कि स्वचालित अनुवादहरूमा त्रुटि वा अशुद्धता हुन सक्छ। यसको मूल भाषामा रहेको मूल दस्तावेज़लाई आधिकारिक स्रोत मानिनुपर्छ। महत्वपूर्ण जानकारीको लागि, व्यावसायिक मानव अनुवाद सिफारिस गरिन्छ। यस अनुवादको प्रयोगबाट उत्पन्न हुने कुनै पनि गलतफहमी वा गलत व्याख्याको लागि हामी जिम्मेवार हुने छैनौं।