# AI Model Deployment with Azure Developer CLI

**Chapter Navigation:**
- **📚 Course Home**: [AZD নবীনদের জন্য](../../README.md)
- **📖 Current Chapter**: অধ্যায় 2 - এআই-প্রথম উন্নয়ন
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)

এই নির্দেশিকা AZD টেমপ্লেট ব্যবহার করে এআই মডেল ডেপ্লয়মেন্টের জন্য বিস্তৃত নির্দেশাবলি প্রদান করে, মডেল নির্বাচন থেকে প্রোডাকশনে ডেপ্লয়মেন্ট প্যাটার্ন পর্যন্ত সর্বাধিক বিষয় কভার করে।

## Table of Contents

- [মডেল নির্বাচন কৌশল](../../../../docs/chapter-02-ai-development)
- [AZD কনফিগারেশন ফর এআই মডেল](../../../../docs/chapter-02-ai-development)
- [ডেপ্লয়মেন্ট প্যাটার্নস](../../../../docs/chapter-02-ai-development)
- [মডেল ম্যানেজমেন্ট](../../../../docs/chapter-02-ai-development)
- [প্রোডাকশন বিবেচনাগুলি](../../../../docs/chapter-02-ai-development)
- [মনিটরিং এবং অবজার্ভাবিলিটি](../../../../docs/chapter-02-ai-development)

## Model Selection Strategy

### Microsoft Foundry মডেলসমূহ

আপনার ব্যবহারের ক্ষেত্রে সঠিক মডেল নির্বাচন করুন:

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

### Model Capacity Planning

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | চ্যাট, প্রশ্নোত্তর | 10-50 TPM | অধিকাংশ ওয়ার্কলোডের জন্য খরচ-কার্যকর |
| gpt-4.1 | জটিল বিশ্লেষণ | 20-100 TPM | উচ্চ খরচ, প্রিমিয়াম ফিচারের জন্য ব্যবহার করুন |
| Text-embedding-ada-002 | সার্চ, RAG | 30-120 TPM | সেমান্টিক সার্চের জন্য অপরিহার্য |
| Whisper | স্পিচ-টু-টেক্সট | 10-50 TPM | অডিও প্রসেসিং ওয়ার্কলোড |

## AZD Configuration for AI Models

### Bicep Template Configuration

Bicep টেমপ্লেটের মাধ্যমে মডেল ডেপ্লয়মেন্ট তৈরি করুন:

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

### Environment Variables

আপনার অ্যাপ্লিকেশনের পরিবেশ কনফিগার করুন:

```bash
# .env কনফিগারেশন
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Deployment Patterns

### Pattern 1: Single-Region Deployment

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

উপযোগী:
- ডেভেলপমেন্ট এবং টেস্টিং
- একক-বাজার অ্যাপ্লিকেশন
- খরচ অপ্টিমাইজেশন

### Pattern 2: Multi-Region Deployment

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

উপযোগী:
- গ্লোবাল অ্যাপ্লিকেশন
- উচ্চ উপলব্ধতার চাহিদা
- লোড বিতরণ

### Pattern 3: Hybrid Deployment

Microsoft Foundry মডেলগুলোকে অন্যান্য এআই সার্ভিসের সাথে মিলিয়ে ব্যবহার করুন:

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

## Model Management

### Version Control

আপনার AZD কনফিগারেশনেই মডেল সংস্করণ ট্র্যাক করুন:

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

### Model Updates

মডেল আপডেটের জন্য AZD হুক ব্যবহার করুন:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"
```

### A/B Testing

একাধিক মডেল সংস্করণ ডেপ্লয় করুন:

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

## Production Considerations

### Capacity Planning

ব্যবহার প্যাটার্নের উপর ভিত্তি করে প্রয়োজনীয় ক্ষমতা হিসাব করুন:

```python
# ধারণক্ষমতা গণনার উদাহরণ
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

# ব্যবহারের উদাহরণ
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Auto-scaling Configuration

Container Apps এর জন্য অটো-স্কেলিং কনফিগার করুন:

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

### Cost Optimization

খরচ নিয়ন্ত্রণ বাস্তবায়ন করুন:

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

## Monitoring and Observability

### Application Insights Integration

এআই ওয়ার্কলোডের জন্য মনিটরিং কনফিগার করুন:

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

### Custom Metrics

এআই-নির্দিষ্ট মেট্রিক্স ট্র্যাক করুন:

```python
# কৃত্রিম বুদ্ধিমত্তা (AI) মডেলগুলোর জন্য কাস্টম টেলিমেট্রি
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

### Health Checks

এআই সার্ভিসের স্বাস্থ্য পর্যবেক্ষণ বাস্তবায়ন করুন:

```python
# স্বাস্থ্য পরীক্ষা এন্ডপয়েন্টসমূহ
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # OpenAI সংযোগ পরীক্ষা
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

## Next Steps

1. **Review the [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** সার্ভিস ইন্টিগ্রেশন প্যাটার্নগুলির জন্য
2. **Complete the [AI Workshop Lab](ai-workshop-lab.md)** হাতে-কলমে অভিজ্ঞতার জন্য
3. **Implement [Production AI Practices](production-ai-practices.md)** এন্টারপ্রাইজ ডেপ্লয়মেন্টের জন্য
4. **Explore the [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** সাধারণ সমস্যা সমাধানের জন্য

## Resources

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD নবীনদের জন্য](../../README.md)
- **📖 Current Chapter**: অধ্যায় 2 - এআই-প্রথম উন্নয়ন
- **⬅️ Previous**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Next**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Next Chapter**: [অধ্যায় 3: কনফিগারেশন](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
দায়-অস্বীকৃতি:
এই নথিটি AI অনুবাদ সেবা Co-op Translator (https://github.com/Azure/co-op-translator) ব্যবহার করে অনূদিত। আমরা যথাসাধ্য সঠিকতার চেষ্টা করি, তবু স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল নথিটিকেই প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের ক্ষেত্রে পেশাদার মানব অনুবাদ গ্রহণ করার পরামর্শ দেওয়া হয়। এই অনুবাদ ব্যবহারের ফলে যেকোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়ী নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->