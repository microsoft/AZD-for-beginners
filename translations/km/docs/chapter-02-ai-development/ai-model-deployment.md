# ការដាក់បង្ហាញម៉ូដែល AI ជាមួយ Azure Developer CLI

**ការរុករកជាមេរៀន៖**
- **📚 ទំព័រដើមមេរៀន**: [AZD សម្រាប់អ្នកដំបូង](../../README.md)
- **📖 មេរៀនបច្ចុប្បន្ន**: មេរៀន 2 - ការអភិវឌ្ឍន៍ផ្តាច់មុខ AI
- **⬅️ មុន**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ បន្ទាប់**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 មេរៀនបន្ទាប់**: [មេរៀន 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

សៀវភៅណែនាំនេះផ្តល់នូវការណែនាំលម្អិតសម្រាប់ការដាក់បង្ហាញម៉ូដែល AI ដោយប្រើទំព័រ AZD គ្របដណ្តប់ពីការជ្រើសរើសម៉ូដែល ដល់គំរូការដាក់បង្ហាញក្នុងការផលិត។

> **សម្គាល់បញ្ជាក់ (2026-07-13):** បច្ចេកវិទ្យា AZD ក្នុងសៀវភៅណែនាំនេះត្រូវបានត្រួតពិនិត្យជាមួយ `azd` `1.27.1`។ សម្រាប់ការដាក់បង្ហាញ AI ដែលយូរជាងរយៈពេលតំឡើងសេវាកម្មលំនាំដើម កំណែ AZD បច្ចុប្បន្នគាំទ្រ `azd deploy --timeout <seconds>`។

## តារាងមាតិកា

- [យុទ្ធសាស្ត្រជ្រើសរើសម៉ូដែល](#យុទ្ធសាស្ត្រជ្រើសរើសម៉ូដែល)
- [ការកំណត់ AZD សម្រាប់ម៉ូដែល AI](#ការកំណត់-azd-សម្រាប់ម៉ូដែល-ai)
- [គំរូការដាក់បង្ហាញ](#គំរូការដាក់បង្ហាញ)
- [ការគ្រប់គ្រងម៉ូដែល](#ការគ្រប់គ្រងម៉ូដែល)
- [ការពិចារណាប្រកបដោយផលិតកម្ម](#ការពិចារណាផលិតកម្ម)
- [ការត្រួតពិនិត្យ និងការអាចមើលឃើញ](#ការត្រួតពិនិត្យ-និងការអាចមើលឃើញ)

## យុទ្ធសាស្ត្រជ្រើសរើសម៉ូដែល

### ម៉ូដែល Microsoft Foundry

ជ្រើសរើសម៉ូដែលត្រឹមត្រូវសម្រាប់ករណីប្រើប្រាស់របស់អ្នក៖

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

### ការធ្វើផែនការសមត្ថភាពម៉ូដែល

| ប្រភេទម៉ូដែល | ករណីប្រើប្រាស់ | សមត្ថភាពដែលបានណែនាំ | ការពិចារណាតម្លៃ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ជជែក, សំណួរ-ចម្លើយ | 10-50 TPM | ថ្លៃប្រសើរសម្រាប់បំណងធ្វើការ​ទូទៅ |
| gpt-4.1 | ការត្រួតការណ៍ស្មុគស្មាញ | 20-100 TPM | តម្លៃខ្ពស់ជាង, ប្រើសម្រាប់លក្ខណៈពិសេសអប្បបរមា |
| text-embedding-3-large | ស្វែងរក, RAG | 30-120 TPM | ជាជម្រើសលំដាប់ដើមសម្រាប់ស្វែងរកនិងទាញយកខ្លឹមសារ |
| Whisper | ថ្លែងចេញដំណើរការ | 10-50 TPM | ការចម្លងសំឡេងក្នុងកម្មវិធី |

## ការកំណត់ AZD សម្រាប់ម៉ូដែល AI

### ការកំណត់ទំព័រ Bicep

បង្កើតការដាក់បង្ហាញម៉ូដែលតាមរយៈទំព័រ Bicep:

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

### របៀបបង្ហាញបរិស្ថាន

កំណត់បរិស្ថានកម្មវិធីរបស់អ្នក៖

```bash
# ការកំណត់រចនាសម្ព័ន្ធ .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## គំរូការដាក់បង្ហាញ

### គំរូ ១: ការដាក់បង្ហាញតែមួយតំបន់

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

ល្អបំផុតសម្រាប់:
- ការអភិវឌ្ឍន៍និងការធ្វើតេស្ត
- កម្មវិធីទីផ្សារតែមួយ
- ការបង្កើតថ្លៃដើមប្រសើរ

### គំរូ ២: ការដាក់បង្ហាញច្រើនតំបន់

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ល្អបំផុតសម្រាប់:
- កម្មវិធីសកល
- តម្រូវការស្រេចស្រួលខ្ពស់
- ការចែកចាយផ្ទុក

### គំរូ ៣: ការដាក់បង្ហាញផ្សំ

បញ្ចូលម៉ូដែល Microsoft Foundry ជាមួយសេវា AI ផ្សេងទៀត:

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

## ការគ្រប់គ្រងម៉ូដែល

### ការត្រួតពិនិត្យកំណែ

តាមដានកំណែម៉ូដែលក្នុងការកំណត់ AZD របស់អ្នក៖

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

### ការអាប់ដេតម៉ូដែល

ប្រើ AZD hooks សម្រាប់ការអាប់ដេតម៉ូដែល៖

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# ប្រសិនបើការដាក់ឱ្យប្រើប្រាស់យូរជាងពេលកំណត់លំនាំដើម
azd deploy --timeout 1800
```

### ការធ្វើតេស្ត A/B

ដាក់បង្ហាញកំណែម៉ូដែលច្រើនកំណែ៖

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

## ការពិចារណាផលិតកម្ម

### ការធ្វើផែនការសមត្ថភាព

គណនាសមត្ថភាពត្រូវការដោយផ្អែកលើលំនាំប្រើប្រាស់៖

```python
# ឧទាហរណ៍គណនាសមត្ថភាព
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

# ការប្រើប្រាស់ឧទាហរណ៍
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ការកំណត់កម្រិតអូតូ

កំណត់ការកំណត់កម្រិតស្វ័យប្រវត្តិសម្រាប់ Container Apps:

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

### ការបង្កើតថ្លៃប្រសើរ

អនុវត្តន៍ការត្រួតពិនិត្យថ្លៃ៖

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

## ការត្រួតពិនិត្យ និងការអាចមើលឃើញ

### ការចងក្រង Application Insights

កំណត់ត្រួតពិនិត្យសម្រាប់ការបំពេញ AI៖

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

### តារាងវាស់វែងផ្ទាល់ខ្លួន

តាមដានតារាងវាស់វែងដែលពាក់ព័ន្ធ AI៖

```python
# ទិន្នន័យទេសចរណ៍ផ្ទាល់ខ្លួនសម្រាប់គំរូ AI
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

### ការត្រួតពិនិត្យសុខភាព

អនុវត្តការត្រួតពិនិត្យសុខភាពសេវា AI៖

```python
# ចំណុចផ្នែកពិនិត្យសុខភាព
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # សាកល្បងការតភ្ជាប់ OpenAI
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

## ជំហានបន្ទាប់

1. **ពិនិត្យមើល [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** សម្រាប់គំរូការរួមបញ្ចូលសេវា
2. **បញ្ចប់ [AI Workshop Lab](ai-workshop-lab.md)** សម្រាប់បទពិសោធន៍អនុវត្ត
3. **អនុវត្ត [ការអនុវត្ត AI ផលិតកម្ម](production-ai-practices.md)** សម្រាប់ការដាក់បង្ហាញសហគ្រាស
4. **ស្វែងយល់ [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** សម្រាប់បញ្ហាទូទៅ

## រដ្ឋប្បវេណ

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ការរុករកជាមេរៀន៖**
- **📚 ទំព័រដើមមេរៀន**: [AZD សម្រាប់អ្នកដំបូង](../../README.md)
- **📖 មេរៀនបច្ចុប្បន្ន**: មេរៀន 2 - ការអភិវឌ្ឍន៍ផ្តាច់មុខ AI
- **⬅️ មុន**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ បន្ទាប់**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 មេរៀនបន្ទាប់**: [មេរៀន 3: ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->