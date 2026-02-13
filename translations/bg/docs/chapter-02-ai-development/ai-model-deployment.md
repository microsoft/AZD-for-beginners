# Разгръщане на AI модели с Azure Developer CLI

**Навигация на главата:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка, ориентирана към AI
- **⬅️ Предишна**: [Интеграция с Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следваща**: [AI работилница](ai-workshop-lab.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

Това ръководство предоставя изчерпателни инструкции за разгръщане на AI модели с помощта на AZD шаблони, обхващайки всичко от избора на модел до модели за разгръщане в продукция.

## Съдържание

- [Стратегия за избор на модел](../../../../docs/chapter-02-ai-development)
- [Конфигурация на AZD за AI модели](../../../../docs/chapter-02-ai-development)
- [Шаблони за разгръщане](../../../../docs/chapter-02-ai-development)
- [Управление на моделите](../../../../docs/chapter-02-ai-development)
- [Производствени съображения](../../../../docs/chapter-02-ai-development)
- [Наблюдение и наблюдаемост](../../../../docs/chapter-02-ai-development)

## Стратегия за избор на модел

### Модели на Azure OpenAI

Изберете правилния модел за вашия случай на използване:

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

### Планиране на капацитета на модела

| Тип модел | Случай на използване | Препоръчителен капацитет | Съображения относно разходите |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Чат, въпроси и отговори | 10-50 TPM | Икономичен за повечето натоварвания |
| GPT-4 | Сложно разсъждение | 20-100 TPM | По-високи разходи, използвайте за премиум функции |
| Text-embedding-ada-002 | Търсене, RAG | 30-120 TPM | От съществено значение за семантично търсене |
| Whisper | Реч в текст | 10-50 TPM | Работни натоварвания за аудио обработка |

## Конфигурация на AZD за AI модели

### Конфигурация на Bicep шаблон

Създайте разгръщания на модели чрез Bicep шаблони:

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

### Променливи на средата

Конфигурирайте средата на вашето приложение:

```bash
# .env конфигурация
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Шаблони за разгръщане

### Шаблон 1: Разгръщане в един регион

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

Подходящо за:
- Разработка и тестване
- Приложения за един пазар
- Оптимизация на разходите

### Шаблон 2: Разгръщане в много региони

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Подходящо за:
- Глобални приложения
- Изисквания за висока наличност
- Разпределение на натоварването

### Шаблон 3: Хибридно разгръщане

Комбинирайте Azure OpenAI с други AI услуги:

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

## Управление на моделите

### Контрол на версиите

Проследявайте версиите на моделите в конфигурацията на AZD:

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

### Актуализации на модела

Използвайте AZD hook-ове за актуализации на модела:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B тестване

Разгръщайте множество версии на модела:

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

## Производствени съображения

### Планиране на капацитета

Изчислете необходимия капацитет въз основа на модели на използване:

```python
# Пример за изчисление на капацитета
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

# Пример за използване
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Конфигурация на автоматичното мащабиране

Конфигурирайте автоматично мащабиране за Container Apps:

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

### Оптимизация на разходите

Прилагане на контрол на разходите:

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

## Наблюдение и наблюдаемост

### Интеграция с Application Insights

Конфигурирайте мониторинг за AI натоварвания:

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

### Персонализирани метрики

Проследявайте AI-специфични метрики:

```python
# Персонализирана телеметрия за модели на ИИ
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

### Проверки на здравето

Изпълнете мониторинг на здравето на AI услугите:

```python
# Крайни точки за проверка на състоянието
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Проверка на връзката с OpenAI
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

## Следващи стъпки

1. **Прегледайте [Ръководството за интеграция с Microsoft Foundry](microsoft-foundry-integration.md)** за модели на интеграция на услуги
2. **Завършете [AI работилница](ai-workshop-lab.md)** за практически опит
3. **Внедрете [Производствени AI практики](production-ai-practices.md)** за корпоративни разгръщания
4. **Разгледайте [Ръководството за отстраняване на проблеми с AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** за често срещани проблеми

## Ресурси

- [Наличност на моделите на Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документация на Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Мащабиране на Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизация на разходите за AI модели](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигация на главата:**
- **📚 Начало на курса**: [AZD For Beginners](../../README.md)
- **📖 Текуща глава**: Глава 2 - Разработка, ориентирана към AI
- **⬅️ Предишна**: [Интеграция с Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следваща**: [AI работилница](ai-workshop-lab.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на услуга за превод с изкуствен интелект Co-op Translator (https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод от квалифициран преводач. Не носим отговорност за каквито и да е недоразумения или погрешни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->