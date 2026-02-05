# এআই মডেল ডিপ্লয়মেন্ট উইথ অ্যাজুর ডেভেলপার CLI

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - এআই-প্রথম ডেভেলপমেন্ট
- **⬅️ পূর্ববর্তী**: [মাইক্রোসফট ফাউন্ড্রি ইন্টিগ্রেশন](microsoft-foundry-integration.md)
- **➡️ পরবর্তী**: [এআই ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../getting-started/configuration.md)

এই গাইডটি AZD টেমপ্লেট ব্যবহার করে এআই মডেল ডিপ্লয়মেন্টের জন্য বিস্তারিত নির্দেশনা প্রদান করে, যা মডেল নির্বাচন থেকে প্রোডাকশন ডিপ্লয়মেন্ট প্যাটার্ন পর্যন্ত সবকিছু কভার করে।

## বিষয়বস্তু সূচি

- [মডেল নির্বাচন কৌশল](../../../../docs/ai-foundry)
- [এআই মডেলের জন্য AZD কনফিগারেশন](../../../../docs/ai-foundry)
- [ডিপ্লয়মেন্ট প্যাটার্ন](../../../../docs/ai-foundry)
- [মডেল ম্যানেজমেন্ট](../../../../docs/ai-foundry)
- [প্রোডাকশন বিবেচনা](../../../../docs/ai-foundry)
- [মনিটরিং এবং পর্যবেক্ষণ](../../../../docs/ai-foundry)

## মডেল নির্বাচন কৌশল

### অ্যাজুর ওপেনএআই মডেল

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

### মডেল ক্যাপাসিটি পরিকল্পনা

| মডেল টাইপ | ব্যবহারের ক্ষেত্র | প্রস্তাবিত ক্যাপাসিটি | খরচ বিবেচনা |
|------------|----------------|---------------------|-------------------|
| GPT-4o-mini | চ্যাট, প্রশ্নোত্তর | ১০-৫০ TPM | বেশিরভাগ কাজের জন্য খরচ-সাশ্রয়ী |
| GPT-4 | জটিল যুক্তি | ২০-১০০ TPM | উচ্চ খরচ, প্রিমিয়াম ফিচারের জন্য ব্যবহার করুন |
| Text-embedding-ada-002 | সার্চ, RAG | ৩০-১২০ TPM | সেমান্টিক সার্চের জন্য অপরিহার্য |
| Whisper | স্পিচ-টু-টেক্সট | ১০-৫০ TPM | অডিও প্রসেসিং কাজের জন্য |

## এআই মডেলের জন্য AZD কনফিগারেশন

### Bicep টেমপ্লেট কনফিগারেশন

Bicep টেমপ্লেটের মাধ্যমে মডেল ডিপ্লয়মেন্ট তৈরি করুন:

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

### এনভায়রনমেন্ট ভেরিয়েবল

আপনার অ্যাপ্লিকেশনের পরিবেশ কনফিগার করুন:

```bash
# .env কনফিগারেশন
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## ডিপ্লয়মেন্ট প্যাটার্ন

### প্যাটার্ন ১: সিঙ্গেল-রিজিয়ন ডিপ্লয়মেন্ট

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

উপযুক্ত:
- ডেভেলপমেন্ট এবং টেস্টিং
- সিঙ্গেল-মার্কেট অ্যাপ্লিকেশন
- খরচ অপ্টিমাইজেশন

### প্যাটার্ন ২: মাল্টি-রিজিয়ন ডিপ্লয়মেন্ট

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

উপযুক্ত:
- গ্লোবাল অ্যাপ্লিকেশন
- উচ্চ অ্যাভেইলেবিলিটি প্রয়োজনীয়তা
- লোড ডিস্ট্রিবিউশন

### প্যাটার্ন ৩: হাইব্রিড ডিপ্লয়মেন্ট

অ্যাজুর ওপেনএআই এবং অন্যান্য এআই সার্ভিস একত্রিত করুন:

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

## মডেল ম্যানেজমেন্ট

### ভার্সন কন্ট্রোল

আপনার AZD কনফিগারেশনে মডেল ভার্সন ট্র্যাক করুন:

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

### মডেল আপডেট

মডেল আপডেটের জন্য AZD হুক ব্যবহার করুন:

```bash
#!/bin/bash
# হুকস/প্রিডিপ্লয়.শ

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B টেস্টিং

একাধিক মডেল ভার্সন ডিপ্লয় করুন:

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

## প্রোডাকশন বিবেচনা

### ক্যাপাসিটি পরিকল্পনা

ব্যবহারের প্যাটার্ন অনুযায়ী প্রয়োজনীয় ক্যাপাসিটি হিসাব করুন:

```python
# ক্ষমতা গণনার উদাহরণ
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

# উদাহরণ ব্যবহার
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### অটো-স্কেলিং কনফিগারেশন

কন্টেইনার অ্যাপের জন্য অটো-স্কেলিং কনফিগার করুন:

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

### খরচ অপ্টিমাইজেশন

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

## মনিটরিং এবং পর্যবেক্ষণ

### অ্যাপ্লিকেশন ইনসাইটস ইন্টিগ্রেশন

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

### কাস্টম মেট্রিক্স

এআই-নির্দিষ্ট মেট্রিক্স ট্র্যাক করুন:

```python
# এআই মডেলের জন্য কাস্টম টেলিমেট্রি
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

### হেলথ চেক

এআই সার্ভিসের স্বাস্থ্য পর্যবেক্ষণ বাস্তবায়ন করুন:

```python
# স্বাস্থ্য পরীক্ষা এন্ডপয়েন্ট
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # ওপেনএআই সংযোগ পরীক্ষা করুন
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

## পরবর্তী ধাপ

1. **[মাইক্রোসফট ফাউন্ড্রি ইন্টিগ্রেশন গাইড](microsoft-foundry-integration.md)** পর্যালোচনা করুন সার্ভিস ইন্টিগ্রেশন প্যাটার্নের জন্য
2. **[এআই ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)** সম্পন্ন করুন হাতে-কলমে অভিজ্ঞতার জন্য
3. **[প্রোডাকশন এআই প্র্যাকটিস](production-ai-practices.md)** বাস্তবায়ন করুন এন্টারপ্রাইজ ডিপ্লয়মেন্টের জন্য
4. **[এআই ট্রাবলশুটিং গাইড](../troubleshooting/ai-troubleshooting.md)** অন্বেষণ করুন সাধারণ সমস্যার জন্য

## রিসোর্স

- [অ্যাজুর ওপেনএআই মডেল অ্যাভেইলেবিলিটি](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [অ্যাজুর ডেভেলপার CLI ডকুমেন্টেশন](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [কন্টেইনার অ্যাপ স্কেলিং](https://learn.microsoft.com/azure/container-apps/scale-app)
- [এআই মডেল খরচ অপ্টিমাইজেশন](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**অধ্যায় নেভিগেশন:**
- **📚 কোর্স হোম**: [AZD ফর বিগিনারস](../../README.md)
- **📖 বর্তমান অধ্যায়**: অধ্যায় ২ - এআই-প্রথম ডেভেলপমেন্ট
- **⬅️ পূর্ববর্তী**: [মাইক্রোসফট ফাউন্ড্রি ইন্টিগ্রেশন](microsoft-foundry-integration.md)
- **➡️ পরবর্তী**: [এআই ওয়ার্কশপ ল্যাব](ai-workshop-lab.md)
- **🚀 পরবর্তী অধ্যায়**: [অধ্যায় ৩: কনফিগারেশন](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**অস্বীকৃতি**:  
এই নথিটি AI অনুবাদ পরিষেবা [Co-op Translator](https://github.com/Azure/co-op-translator) ব্যবহার করে অনুবাদ করা হয়েছে। আমরা যথাসাধ্য সঠিকতার জন্য চেষ্টা করি, তবে অনুগ্রহ করে মনে রাখবেন যে স্বয়ংক্রিয় অনুবাদে ত্রুটি বা অসঙ্গতি থাকতে পারে। মূল ভাষায় থাকা নথিটিকে প্রামাণিক উৎস হিসেবে বিবেচনা করা উচিত। গুরুত্বপূর্ণ তথ্যের জন্য, পেশাদার মানব অনুবাদ সুপারিশ করা হয়। এই অনুবাদ ব্যবহারের ফলে কোনো ভুল বোঝাবুঝি বা ভুল ব্যাখ্যার জন্য আমরা দায়বদ্ধ নই।
<!-- CO-OP TRANSLATOR DISCLAIMER END -->