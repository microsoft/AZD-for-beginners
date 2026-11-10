# ការ​ដាក់​បង្ហាញម៉ូដែល AI ជាមួយ Azure Developer CLI

**ការស្វែងរកជាប់បំណង៖**
- **📚 ផ្ទះមុខវិជ្ជា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 បទយកការបច្ចុប្បន្ន**: បទ ២ - ការ​អភិវឌ្ឍន៍ផ្ដើមដោយ AI
- **⬅️ មុន**: [ភ្នាក់ងារ AI](agents.md)
- **➡️ បន្ទាប់**: [ហ្វេនយ៍មុខងារ AI](ai-workshop-lab.md)
- **🚀 បទបន្ទាប់**: [បទ ៣: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

មគ្គុទ្ទេសក៏នេះផ្ដល់នូវកម្មវិធីដាំបង្ហាញម៉ូដែល AI ដោយប្រើសំព័ន្ធ AZD ដែលគ្របដណ្តប់ពីការជ្រើសរើសម៉ូដែលទៅវិធីសាស្រ្តដាក់បង្ហាញសម្រាប់ផលិតកម្ម។

> **ការត្រួតពិនិត្យការចេញផ្សាយ (2026-11-04):** ការផ្លាស់ប្តូរយោងទៅ CLI ត្រូវបានពិនិត្យប្រៀបធៀបនឹង `azd` `1.37.2`; ការចូលដំណើរការម៉ូដែល, ប្រភាជីវភាព, និងគណនេយ្យ តែងតែមានឥទ្ធិពលផ្អែកលើតំបន់ និងការជាវសាវបំណង។ `azd deploy --timeout <seconds>` គ្រប់គ្រងវដ្តដាក់បង្ហាញសេវាកម្ម មិនមែនធានាបានថាភ្នាក់ងារនឹងដំណើរការ។ សូមមើល [ចំណាំចេញផ្សាយបច្ចុប្បន្ន និងការណែនាំអំពីការផ្លាស់ប្តូរ AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes)។

## តារាង​ចំណងជើង

- [យុទ្ធសាស្រ្តជ្រើសរើសម៉ូដែល](#model-selection-strategy)
- [ការកំណត់ AZD សម្រាប់ម៉ូដែល AI](#azd-configuration-for-ai-models)
- [គំរូដាក់បង្ហាញ](#deployment-patterns)
- [ការគ្រប់គ្រងម៉ូដែល](#model-management)
- [ការត្រួតពិនិត្យផលិតកម្ម](#production-considerations)
- [ការតាមដាន និងការយល់ដឹង](#monitoring-and-observability)

## យុទ្ធសាស្រ្តជ្រើសរើសម៉ូដែល

### ម៉ូដែល Azure OpenAI ក្នុង Microsoft Foundry

ជ្រើសរើសម៉ូដែលឲ្យសមរម្យសម្រាប់ករណីប្រើរបស់អ្នក៖

ជម្រាបម៉ូដែលដាក់បង្ហាញនៅក្នុង Bicep (ខាងក្រោម), មិនមែនក្នុងកំណត់ `services.*.config.AZURE_OPENAI_MODELS` ដែលមានភាពចៃដន្យទេ។ AZD មិនពិចារណាកំណត់ភាគនេះជាបញ្ជីធនធានម៉ូដែលទេ។ `project` នៃសេវាកម្មបង្ហាញទៅកាន់ប្រភពកម្មវិធី មិនមែនថត `infra/` របស់វាទេ។

ឧទាហរណ៍ប្រើ `gpt-4.1-mini` ដែលបានផ្សាយចេញជាសមាសភាគ **`2025-04-14`** និងសមាសភាគបញ្ចូល **`1`**។ សូមបញ្ជាក់ថា ម៉ូដែល និង SKU ដាក់បង្ហាញ គាំទ្រនៅតំបន់/គណនីគោលដៅរបស់អ្នក មុនពេលផ្គត់ផ្គង់។

### ការរៀបចំសមត្ថភាពម៉ូដែល

| ប្រភេទម៉ូដែល | ករណីប្រើ | តម្រូវការតូកិនឧទាហរណ៍ | ការពិចារណាគិតថ្លៃ |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | ការជជែក, សំណួរ-ចម្លើយ | 10,000-50,000 TPM | វាយតម្លៃថ្លៃ និងគុណភាពសម្រាប់ការងាររបស់អ្នក |
| gpt-4.1 | ធ្វើបញ្ហាពិបាក | 20,000-100,000 TPM | ប៉ាន់ប្រមាណផលវិនិយោគគុណភាពទៅប្រឆាំងតម្លៃតូកិន |
| text-embedding-3-large | ស្វែងរក, RAG | 30,000-120,000 TPM | គណនារួមចំណូលនិងចរាចរលេខសំណើ |
| Whisper | ពីសំឡេងទៅអត្ថបទ | រៀបចំដោយអផ្ទាំងរយៈពេលសំឡេង និងកំណត់សំណើ | កុំអនុវត្តរូបមន្តសមត្ថភាព TPM របស់ម៉ូដែលអត្ថបទ |

TPM មានន័យថាតូកិនក្នុងមួយនាទី។ សម្រាប់ការដាក់បង្ហាញអត្ថបទស្តង់ដារ ARM `sku.capacity` គឺក្នុង​ឯកតា **1,000 TPM** មិនមែនជា TPM រាយនាក់ឡើយ (សមត្ថភាព `10` បង្ហាញថា 10,000 TPM)។ អត្រា RPM ទៅ TPM នឹងខុសគ្នាតាមប្រភេទម៉ូដែល/ដាក់បង្ហាញ; សូមបញ្ជាក់ពីដែនកំណត់ទាំងពីរនៅតាមទីតាំង [ឯកសារគណនេយ្យ](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic)។ កម្រិតទាំងនេះគឺជាឧទាហរណ៍ មិនមែនជាការផ្ដល់អនុសាសន៍ទំហំឡើយ។

## ការកំណត់ AZD សម្រាប់ម៉ូដែល AI

### ការកំណត់សំព័ន្ធ Bicep

បង្កើតដាក់បង្ហាញម៉ូដែលតាមរយៈសំព័ន្ធ Bicep៖

```bicep
// infra/main.bicep
param openAiAccountName string
param location string = resourceGroup().location

@description('OpenAI model deployments')
param openAiModelDeployments array = [
  {
    name: 'gpt-4.1-mini'
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
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
    disableLocalAuth: true
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

នេះគឺជាគំរូ **ហេដ្ឋារចនាសម្ព័ន្ធអភិវឌ្ឍន៍ដែលមានជំនាន់កម្រិតក្រុមធនធាន**, មិនមែនជាគំរូកម្មវិធី AZD ទាំងមូលទេ។ គណនីនេះអនុញ្ញាតការចូលប្រើបណ្តាញសាធារណៈ និងតម្រូវឱ្យមានការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ Entra ID/RBAC (`Cognitive Services OpenAI User` សម្រាប់អ្នកហៅ)។ ការផលិតតម្រូវឲ្យមានចំណុចបញ្ចប់ឯកជន, DNS, និងការតភ្ជាប់កម្មវិធីដូចបានពិពណ៌នានៅជំពូក 8។ AZD ក៏ត្រូវការគំរូដ៏សំខាន់/ផែនទីប៉ារ៉ាម៉ែត្រ និងធនធានម៉ាស៊ីនបម្រើកម្មវិធី; ប្រើគំរូដែលមានស្រាប់សម្រាប់ការតំឡើងពេញលេញ។

### បរិយាកាសអថេរ

កំណត់បរិយាកាសកម្មវិធីរបស់អ្នក៖

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

នេះគឺជាឈ្មោះដែលកំណត់ដោយកម្មវិធី; បញ្ចូលវាចូលក្នុងការកំណត់រចនាសម្ព័ន្ធម៉ាស៊ីនបម្រើរបស់អ្នក។ ចំណុចបញ្ចប់ Azure OpenAI v1 ដែលប្រើសម្រាប់ត្រួតពិនិត្យសុខភាពខាងក្រោម មិនទៅប្រើប៉ារ៉ាម៉ែត្រ `api-version` ដែលចាស់ទេ; អតិថិជន `AzureOpenAI` ចាស់ៗកម្រិតត្រូវការតាមដង ហើយដូច្នេះណែនាំអោយធ្វើតាមការបង្កើត API ដែលកម្មវិធីរបស់អ្នកប្រើ។

## រៀបចំការតំឡើង

### លំនាំ 1: ការតំឡើងតំបន់តែមួយ

```yaml
# azure.yaml - Single region
services:
  ai-app:
    project: ./src
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

ហើយសន្សំសំចៃសម្រាប់៖
- ការអភិវឌ្ឍន៍ និងការធ្វើតេស្ត
- កម្មវិធីទីផ្សារតែមួយ
- ការបន្ថយថ្លៃចំណាយ

### លំនាំ 2: ការតំឡើងច្រើនតំបន់

```bicep
// Illustrative fragment: extend the complete account declaration above.
// Each region must support the selected model/SKU and have quota.
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

គុណលក្ខណៈគណនី/SKU ដែលខ្វះត្រូវត្រូវបញ្ចូល; រង្វង់នេះមិនអាចតំឡើងបានតាមដែលបានសរសេរទេ។ តំឡើងម៉ូឌែលនៅក្នុងគណនីនីមួយៗ ហើយអនុវត្តការចែកចាយ/ការបរាជ័យ និងការគ្រប់គ្រងទីតាំងទិន្នន័យដាច់ដោយឡែក។

ហើយសម្រាប់៖
- កម្មវិធីសកល
- តម្រូវការស្រោចស្រង់ខ្ពស់
- ការបែងចែក​ដំណើរការ

### លំនាំ 3: ការតំឡើងផ្សំ

បញ្ចូលម៉ូឌែលក្រុមហ៊ុន Microsoft Foundry ជាមួយសេវ AI ផ្សេងៗ៖

រង្វង់ខាងក្រោមសន្មតឈ្មោះ និង `location` ត្រូវបានផ្គត់ផ្គង់ដោយគំរូដែលជារង្វង់។

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

## ការគ្រប់គ្រងម៉ូឌែល

### ការត្រួតពិនិត្យជំនួស

តាមដានជំនាន់ម៉ូឌែលនៅក្នុងការកំណត់រចនាសម្ព័ន្ធកម្មវិធីរបស់អ្នក ឬ IaC។ JSON នេះគឺជាគំរូដែលកំណត់ដោយកម្មវិធីមិនមែនជាស្កីម៉ាទិន្នន័យម៉ូឌែល AZD built-in ទេ; ត្រូវអនុវត្តន៍ និងតំឡើង fallback ដោយច្បាស់សូវ៉ែៈ

```json
{
  "models": {
    "chat": {
      "name": "gpt-4.1-mini",
      "version": "2025-04-14",
      "fallback": "gpt-4.1"
    },
    "embedding": {
      "name": "text-embedding-3-large",
      "version": "1"
    }
  }
}
```

### ការអាប់ដេតម៉ូឌែល

ប្រើ AZD hook សម្រាប់ត្រួតពិនិត្យភាពមានរដ្ឋបាលដែលអាចអានតែតែម្តងបន្ទាប់មកធ្វើអាប់ដេត IaC ហើយ provision វា៖

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

ប្រតិបត្តិ `azd up` **ក្រៅ** នៃ hook ដើម្បីអនុវត្តការផ្លាស់ប្ដូរហេដ្ឋារចនាសម្ព័ន្ធម៉ូឌែល និងតំឡើងកូដ។ មិនធ្វើការហៅ `azd deploy` ពី hook `predeploy` ទេ៖ វាអាចធ្វើឲ្យហៅ hook ម្តងទៀត។ `azd deploy --timeout 1800` ពង្រីកពេលវេលាកំណត់សម្រាប់ការតំឡើងកម្មវិធី; វាមិនធ្វើអាប់ដេតធនធាន Bicep ទេ។

### ការធ្វើតេស្ត A/B

ឧបករណ៍ធនធានបង្ហាញខាងក្រោមជ្រើសរើសឈ្មោះ និងសមត្ថភាពតំឡើង; វាបង្កើត **តែមួយ** ការតំឡើង មិនមែនជាការធ្វើតេស្ត A/B ទេ។ សម្រាប់ការជំពាក់ការពិត provision ទ្រទ្រង់តំឡើងពីរដែលដាច់ជិតគ្នា បែបផែនផ្លូវការសំណើបញ្ជាការទៅកាន់រៀងៗខ្លួន ហើយប្រៀបធៀបគុណភាព, ពេលពិត, និងថ្លៃដើម។ វាសន្មតជាមួយ `openAi` ពីគំរូគណនី៖

```bicep
param enableABTesting bool = false

resource chatDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini-${enableABTesting ? 'v1' : 'prod'}'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: enableABTesting ? 5 : 10
  }
}
```

## ការពិចារណាសម្រាប់ការផលិត

### ការធ្វើផែនការការសមត្ថភាព

គណនាសមត្ថភាពត្រូវការតាមបែបបទប្រើប្រាស់៖

```python
# Capacity calculation example
import math
def calculate_required_capacity(
    requests_per_minute: int,
    avg_prompt_tokens: int,
    avg_completion_tokens: int,
    safety_margin: float = 0.2
) -> int:
    """Calculate required TPM capacity."""
    total_tokens_per_request = avg_prompt_tokens + avg_completion_tokens
    total_tpm = requests_per_minute * total_tokens_per_request
    return math.ceil(total_tpm * (1 + safety_margin))

# Example usage
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

លទ្ធផលរំពឹងទុក៖ `Required capacity: 9100 TPM`។ ជាមួយសមត្ថភាព 1,000-TPM សូមបត់ពងទៅយ៉ាងហោចណាស់បន្ទាប់ពី `10` ហើយបន្ទាប់មកពិនិត្យការប៉ាន់ស្មាន RPM និងកម្រិតសេវាកម្មជាក់លាក់ (រួមបញ្ចូលថវិការចេញផលលទ្ធផលដែលបានស្នើសុំ)។ ការប៉ាន់ស្មានតម្រូវការ token នេះមិនមែនជាការធានាថាមិនរងការកាត់កំលាំងទេ។

### ការកំណត់តម្លៃ Auto-scaling

កំណត់ Auto-scaling សម្រាប់ Container Apps៖

**ធនធានអំបិល៖** បញ្ចូលការកំណត់ `template.scale` ទៅក្នុង Container App ពេញលេញជាមួយទីតាំង, បរិយាកាសគ្រប់គ្រង, រូបភាព container, ធនធាន និង ingress ។ កំណើនរូបភាពមិនបន្ថែមកំណត់ត្រាម៉ូឌែលឡើយ។

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

### ការបន្ថយថ្លៃ

អនុវត្តការគ្រប់គ្រងថ្លៃ៖

**ធនធានថវិកាបង្ហាញ៖** កំណត់ `budgetStartDate` ជាថ្ងៃទីមួយនៃខែបច្ចុប្បន្នក្នុង UTC (ឧទាហរណ៍ `2026-11-01T00:00:00Z` សម្រាប់ការពិនិត្យនេះ), ហើយជំនួសអាសយដ្ឋានទំនាក់ទំនង។ ការចាប់ផ្តើមត្រូវបំពេញលក្ខខណ្ឌកាលបរិច្ឆេទបច្ចុប្បន្នរបស់សេវា។ ថវិកាធ្វើការជូនដំណឹងពីទិន្នន័យចំណាយយឺត; វាមិនដើម្បីបញ្ឈប់ការចំណាយទេ។

```bicep
param budgetStartDate string

@description('Enable cost management alerts')
param enableCostAlerts bool = true

resource budgetAlert 'Microsoft.Consumption/budgets@2024-08-01' = if (enableCostAlerts) {
  name: 'ai-budget-alert'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

## ការត្រួតពិនិត្យ និងចុះមើល

### ចូលរួម Application Insights

កំណត់ការត្រួតពិនិត្យសម្រាប់ការងារ AI៖

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

```

រង្វង់ធនធាននោះសន្មត `applicationInsightsName`, `location`, និង `logAnalyticsWorkspace` ដែលមានស្រាប់។ វាបង្កើតការត្រួតពិនិត្យប៉ុន្តាមិនចាក់បញ្ចូលកម្មវិធីឬបង្កើតម៉េត្រិកផ្ទាល់ខ្លួនទេ។

### ម៉េត្រិកផ្ទាល់ខ្លួន

តាមដានម៉េត្រិកជាក់លាក់សម្រាប់ AI៖

ប្រើ [ការចែកចាយ Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python) ដែលគាំទ្រ, មិនប្រើ SDK Python `applicationinsights` ចាស់។ តំឡើង `azure-monitor-opentelemetry`, កំណត់ `APPLICATIONINSIGHTS_CONNECTION_STRING`, ហើយចាប់ផ្តើមម្តងនៅពេលចាប់ផ្តើមកម្មវិធី៖

```python
from azure.monitor.opentelemetry import configure_azure_monitor
from opentelemetry import trace

configure_azure_monitor()
tracer = trace.get_tracer(__name__)

def record_request(model: str, tokens: int, latency_ms: int, success: bool):
    with tracer.start_as_current_span("AI_Model_Request") as span:
        span.set_attribute("ai.model", model)
        span.set_attribute("ai.tokens", tokens)
        span.set_attribute("ai.latency_ms", latency_ms)
        span.set_attribute("ai.success", success)
```

នេះបង្ហាញការបញ្ចេញ Attribute មិនមែនជាការចាក់បញ្ចូលពេលហៅម៉ូឌែលពិតទេ។ រមួសសំណើពិតជាមួយ span ដើម្បីវាស់រយៈពេលរបស់វា; ពិនិត្យ `dependencies`/`traces` នៅក្នុង Application Insights។ កុំផ្ញើ prompt, ប្រតិកម្ម, key, ឬសារ exception ដើមដែលមានទិន្នន័យទន់ភ្លន់។

### ការត្រួតពិនិត្យសុខភាព

អនុវត្តការត្រួតពិនិត្យសុខភាពសេវ AI៖

តំឡើង `fastapi`, `uvicorn`, `httpx`, និង `azure-identity`។ កំណត់អថេរចំណុចបញ្ចប់/ការតំឡើងខាងលើនិងផ្តល់សិទ្ធិ `Cognitive Services OpenAI User` សម្រាប់អ្នកហៅ។ នេះគឺជា **probe readiness** ប្រើ Azure OpenAI v1 data plane ជាមួយ Entra ID; វាធ្វើឲ្យហៅម៉ូឌែលដែលគិតថ្លៃបាន។ ប្រតិបត្តិដោយ `uvicorn health:app` បន្ទាប់ពីរក្សាទុកជា `health.py`។ ប្រើការត្រួតពិនិត្យ liveness ស្រាលៗផ្សេងទៀត កំណត់ rate-limit/cache លទ្ធផល readiness ហើយកុំបង្ហាញផ្លូវនេះសាធារណៈដោយគ្មានការត្រួតពិនិត្យចូល។

```python
# health.py
import os
from fastapi import FastAPI, HTTPException
import httpx
from azure.identity.aio import DefaultAzureCredential

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        async with DefaultAzureCredential() as credential:
            token = await credential.get_token("https://ai.azure.com/.default")
        endpoint = os.environ["AZURE_OPENAI_ENDPOINT"].rstrip("/")
        async with httpx.AsyncClient(timeout=20.0) as client:
            response = await client.post(
                f"{endpoint}/openai/v1/chat/completions",
                headers={"Authorization": f"Bearer {token.token}"},
                json={
                    "model": os.environ["AZURE_OPENAI_CHAT_DEPLOYMENT"],
                    "messages": [{"role": "user", "content": "Reply OK."}],
                    "max_completion_tokens": 8,
                },
            )
        response.raise_for_status()
        return {"status": "healthy"}
    except Exception:
        # Record sanitized internal diagnostics, not service responses/tokens.
        raise HTTPException(status_code=503, detail="AI readiness check failed") from None
```

រំពឹងថា: `GET /health/ai-models` ត្រឡប់ `200 {"status":"healthy"}` នៅពេលតំឡើង chat ត្រូវបានកំណត់អាចប្រើបាន, ឬ `503` ដោយមិនបង្ហាញព័ត៌មាន upstream។ ការបញ្ជីការតំឡើងគឺជាសកម្មភាពការគ្រប់គ្រង ហើយមិនមែនជា probe សុខភាព data-plane ត្រឹមត្រូវទេ។

## ជំហានបន្ទាប់

1. **ពិនិត្យមើល [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** សម្រាប់លំនាំបញ្ចូលសេវា
2. **បញ្ចប់ [AI Workshop Lab](ai-workshop-lab.md)** សម្រាប់បទពិសោធន៍អនុវត្តន៍
3. **អនុវត្ត [Production AI Practices](../chapter-08-production/production-ai-practices.md)** សម្រាប់ការតំឡើងសហគ្រាស
4. **ស្វែងយល់ [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** សម្រាប់បញ្ហានិងដំណោះស្រាយទូទៅ

## ធនធាន

- [Microsoft Foundry Models Model Availability](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Container Apps Scaling](https://learn.microsoft.com/azure/container-apps/scale-app)
- [AI Model Cost Optimization](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**ការរុករកជំពូក:**
- **📚 ទំព័រដើមវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 2 - ការអភិវឌ្ឍ AI ជាមុន
- **⬅️ មុន**: [AI Agents](agents.md)
- **➡️ បន្ទាប់**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 3: ការកំណត់រចនាសម្ព័ន្ធ](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->