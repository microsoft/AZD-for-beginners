<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d1b97c6d936e9b4f71fc2972306dfb7f",
  "translation_date": "2025-09-12T23:22:07+00:00",
  "source_file": "docs/ai-foundry/ai-model-deployment.md",
  "language_code": "sr"
}
-->
# Деплојмент AI модела уз Azure Developer CLI

**Претходно:** [Интеграција Azure AI Foundry](azure-ai-foundry-integration.md) | **Следеће:** [AI радионица](ai-workshop-lab.md)

Овај водич пружа детаљна упутства за деплојмент AI модела користећи AZD шаблоне, покривајући све од избора модела до шаблона за продукцијски деплојмент.

## Садржај

- [Стратегија избора модела](../../../../docs/ai-foundry)
- [AZD конфигурација за AI моделе](../../../../docs/ai-foundry)
- [Шаблони деплојмента](../../../../docs/ai-foundry)
- [Управљање моделима](../../../../docs/ai-foundry)
- [Продукцијски аспекти](../../../../docs/ai-foundry)
- [Мониторинг и посматрање](../../../../docs/ai-foundry)

## Стратегија избора модела

### Azure OpenAI модели

Изаберите прави модел за вашу употребу:

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

### Планирање капацитета модела

| Тип модела | Употреба | Препоручени капацитет | Трошкови |
|------------|----------|---------------------|----------|
| GPT-4o-mini | Ћаскање, Q&A | 10-50 TPM | Исплативо за већину радних оптерећења |
| GPT-4 | Комплексно резоновање | 20-100 TPM | Виши трошкови, користити за премијум функције |
| Text-embedding-ada-002 | Претрага, RAG | 30-120 TPM | Неопходно за семантичку претрагу |
| Whisper | Претварање говора у текст | 10-50 TPM | Радна оптерећења за аудио обраду |

## AZD конфигурација за AI моделе

### Конфигурација Bicep шаблона

Креирајте деплојмент модела кроз Bicep шаблоне:

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

### Енвиронмент променљиве

Конфигуришите окружење ваше апликације:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Шаблони деплојмента

### Шаблон 1: Деплојмент у једном региону

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

Најбоље за:
- Развој и тестирање
- Апликације за једно тржиште
- Оптимизацију трошкова

### Шаблон 2: Деплојмент у више региона

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Најбоље за:
- Глобалне апликације
- Захтеве за високу доступност
- Расподелу оптерећења

### Шаблон 3: Хибридни деплојмент

Комбинујте Azure OpenAI са другим AI сервисима:

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

## Управљање моделима

### Контрола верзија

Пратите верзије модела у вашој AZD конфигурацији:

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

### Ажурирање модела

Користите AZD hooks за ажурирање модела:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B тестирање

Деплојтујте више верзија модела:

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

## Продукцијски аспекти

### Планирање капацитета

Израчунајте потребан капацитет на основу образаца употребе:

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

### Конфигурација аутоматског скалирања

Конфигуришите аутоматско скалирање за Container Apps:

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

### Оптимизација трошкова

Примените контроле трошкова:

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

## Мониторинг и посматрање

### Интеграција са Application Insights

Конфигуришите мониторинг за AI радна оптерећења:

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

### Прилагођене метрике

Пратите метрике специфичне за AI:

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

### Провере здравља

Имплементирајте мониторинг здравља AI сервиса:

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

## Следећи кораци

1. **Прегледајте [Водич за интеграцију Azure AI Foundry](azure-ai-foundry-integration.md)** за шаблоне интеграције сервиса
2. **Завршите [AI радионицу](ai-workshop-lab.md)** за практично искуство
3. **Примените [Практике за продукцијски AI](production-ai-practices.md)** за корпоративне деплојменте
4. **Истражите [Водич за решавање проблема са AI](../troubleshooting/ai-troubleshooting.md)** за уобичајене проблеме

## Ресурси

- [Доступност Azure OpenAI модела](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документација Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Скалирање Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизација трошкова AI модела](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Претходно:** [Интеграција Azure AI Foundry](azure-ai-foundry-integration.md) | **Следеће:** [AI радионица](ai-workshop-lab.md)

---

**Одрицање од одговорности**:  
Овај документ је преведен коришћењем услуге за превођење помоћу вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако се трудимо да обезбедимо тачност, молимо вас да имате у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.