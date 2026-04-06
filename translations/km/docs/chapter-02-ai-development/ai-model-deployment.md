# ការដាក់បង្ហោះម៉ូដែល AI ជាមួយ Azure Developer CLI

**ចំណាត់ថ្នាក់ជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកទើបចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍន៍អាគី-ហ្វឺស
- **⬅️ មុនពេលនេះ**: [ការរួមបញ្ចូល Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ បន្ទាប់**: [មហោស្រពសិក្សា AI](ai-workshop-lab.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3៖ ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

មគ្គុទេសក៍នេះផ្តល់នូវសេចក្តីណែនាំពេញលេញសម្រាប់ការដាក់បង្ហោះម៉ូដែល AI ដោយប្រើតំណាង AZD បង្ហាញពីពីរបៀបគ្រប់យ៉ាងចាប់ពីការជ្រើសរើសម៉ូដែល ដល់គំរូការដាក់បង្ហោះទៅផលិតកម្ម។

> **កំណត់សម្គាល់ផ្ទៀងផ្ទាត់ (2026-03-25):** ខ្សែដំណើរការរបស់ AZD ក្នុងមគ្គុទេសក៍នេះ ត្រូវបានពិនិត្យប្រឆាំងនឹង `azd` `1.23.12`។ សម្រាប់ការដាក់បង្ហោះ AI ដែលប្រើពេលវេលាយូរជាងពេលប្រើសេវាកម្មដាក់បង្ហោះលំនាំដើម កំណំណ AZD បច្ចុប្បន្នគាំទ្រ `azd deploy --timeout <seconds>`។

## តារាងមាតិকা

- [យុទ្ធសាស្ត្រជ្រើសរើសម៉ូដែល](#យុទ្ធសាស្ត្រជ្រើសរើសម៉ូដែល)
- [ការកំណត់រចនាសម្ព័ន្ធ AZD សម្រាប់ម៉ូដែល AI](#ការកំណត់រចនាសម្ព័ន្ធ-azd-សម្រាប់ម៉ូដែល-ai)
- [គំរូការដាក់បង្ហោះ](#គំរូការដាក់បង្ហោះ)
- [ការគ្រប់គ្រងម៉ូដែល](#ការគ្រប់គ្រងម៉ូដែល)
- [ការគិតគូរផលិតកម្ម](#ការគិតគូរផលិតកម្ម)
- [ការត្រួតពិនិត្យ និងការតាមដាន](#ការត្រួតពិនិត្យ-និងការតាមដាន)

## យុទ្ធសាស្ត្រជ្រើសរើសម៉ូដែល

### ម៉ូដែល Microsoft Foundry Models

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

| ប្រភេទម៉ូដែល | ករណីប្រើ | សមត្ថភាពដែលបានណែនាំ | ការពិចារណាតម្លៃ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ហាក់ជារឿងសន្ទនា, សំណួរ-ចម្លើយ | 10-50 TPM | មានតំលៃសមរម្យសម្រាប់ភារកិច្ចភាគច្រើន |
| gpt-4.1 | ការគិតលំអិតស្មុគស្មាញ | 20-100 TPM | តំលៃខ្ពស់ ប្រេសវេសសម្រាប់មុខងារប្រណិត |
| text-embedding-3-large | ស្វែងរក, RAG | 30-120 TPM | ជាជម្រើសល្អលំដាប់ដើមសម្រាប់ការស្វែងរកនិងយកតាមអត្ថន័យ |
| Whisper | ពីសម្លេងទៅអត្ថបទ | 10-50 TPM | ភារកិច្ចដំណើរការសំឡេង |

## ការកំណត់រចនាសម្ព័ន្ធ AZD សម្រាប់ម៉ូដែល AI

### ការកំណត់រចនាសម្ព័ន្ធពុម្ព Bicep

បង្កើតការដាក់បង្ហោះម៉ូដែលតាមរយៈពុម្ព Bicep៖

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

### បរិស្ថានអថេរ

កំណត់បរិស្ថានកម្មវិធីរបស់អ្នក៖

```bash
# ការកំណត់រចនាសម្ព័ន្ធ .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## គំរូការដាក់បង្ហោះ

### គំរូទី 1៖ ការដាក់បង្ហោះតែមួយតំបន់

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

ល្អបំផុតសម្រាប់៖
- ការអភិវឌ្ឍន៍ និងសាកល្បង
- កម្មវិធីទីផ្សារតែមួយ
- បម្លែងតម្លៃឲ្យប្រសើរ

### គំរូទី 2៖ ការដាក់បង្ហោះច្រើនតំបន់

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

ល្អបំផុតសម្រាប់៖
- កម្មវិធីលំដាប់ពិភពលោក
- តម្រូវការភាពមានភាពតុល្យភាពខ្ពស់
- ការចែកចាយបន្ទុក

### គំរូទី 3៖ ការដាក់បង្ហោះបែបម៉ិចស៍

ផ្សំនូវម៉ូដែល Microsoft Foundry Models ជាមួយសេវាកម្ម AI ផ្សេងទៀត៖

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

### ការគ្រប់គ្រងកំណែ

តាមដានកំណែម៉ូដែលក្នុងការកំណត់រចនាសម្ព័ន្ធ AZD របស់អ្នក៖

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

# ប្រសិនបើការចុះបញ្ជីយូរជាងពេលកំណត់លំនាំដើម
azd deploy --timeout 1800
```

### ការធ្វើតេស A/B

ដាក់បង្ហោះកំណែម៉ូដែលជាច្រើន៖

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

## ការគិតគូរផលិតកម្ម

### ការធ្វើផែនការសមត្ថភាព

គណនាសមត្ថភាពដែលត្រូវការ ដើមលើគំរូប្រើប្រាស់៖

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

# ឧទាហរណ៍នៃការប្រើប្រាស់
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### ការកំណត់រចនាសម្ព័ន្ធចុះស្ដើងដោយស្វ័យប្រវត្តិ

កំណត់រចនាសម្ព័ន្ធសម្រាប់ការចុះស្ដើងដោយស្វ័យប្រវត្តិក្នុង Container Apps៖

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

### ការបម្លែងតម្លៃឲ្យប្រសើរ

អនុវត្តការត្រួតគ្រប់ការចំណាយ៖

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

## ការត្រួតពិនិត្យ និងការតាមដាន

### ការរួមបញ្ចូល Application Insights

កំណត់រចនាសម្ព័ន្ធការត្រួតពិនិត្យសម្រាប់ភារកិច្ច AI៖

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

### វិមាត្រពិសេស

តាមដានវិមាត្រយោងក្នុង AI៖

```python
# តែឡូមេត្រីផ្ទាល់ខ្លួនសម្រាប់ម៉ូឌែល AI
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

អនុវត្តការត្រួតពិនិត្យសុខភាពសេវាកម្ម AI៖

```python
# ចំណុចត្រួតពិនិត្យសុខភាព
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

1. **ពិនិត្យមើល [មគ្គុទេសក៍រួមបញ្ចូល Microsoft Foundry](microsoft-foundry-integration.md)** សម្រាប់គំរូរួមបញ្ចូលសេវាកម្ម
2. **បញ្ចប់ [មហោស្រពសិក្សា AI](ai-workshop-lab.md)** សម្រាប់បទពិសោធន៍ដៃគូ
3. **អនុវត្ត [អនុវត្តតំបន់ AI ផលិតកម្ម](production-ai-practices.md)** សម្រាប់ការដាក់បង្ហោះសហគ្រាស
4. **ស្វែងយល់ពី [មគ្គុទេសក៍ដោះស្រាយបញ្ហា AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** សម្រាប់បញ្ហា​ធម្មតា

## ឯកសារ

- [ការចូលប្រើម៉ូដែល Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [ឯកសារប្រើប្រាស់ Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [ការបន្ថយទំហំ Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [ការបម្លែងតម្លៃម៉ូដែល AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ចំណាត់ថ្នាក់ជំពូក៖**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកទើបចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍន៍អាគី-ហ្វឺស
- **⬅️ មុនពេលនេះ**: [ការរួមបញ្ចូល Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ បន្ទាប់**: [មហោស្រពសិក្សា AI](ai-workshop-lab.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3៖ ការកំណត់រចនា](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈពេលដែលយើងខិតខំប្រឹងប្រែងសម្រាប់ភាពត្រឹមត្រូវ សូមដឹងថាការបកប្រែដោយស្វ័យប្រវត្តិក្នុងខ្លះអាចមានកំហុស ឬភាពមិនត្រឺមត្រូវ។ ឯកសារដើមក្នុងភាសាមូលដ្ឋានគួរត្រូវបានគេយកជាអ្នកផ្តល់ព័ត៌មានដែលមានសម្បទាន។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមប្រើការបកប្រែដោយអ្នកជំនាញមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបកប្រែនេះឡើយ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->