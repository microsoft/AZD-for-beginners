# Розгортання моделей штучного інтелекту за допомогою Azure Developer CLI

**Навігація по розділу:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з акцентом на AI
- **⬅️ Попередній**: [Інтеграція Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Наступний**: [Лабораторія AI Workshop](ai-workshop-lab.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../getting-started/configuration.md)

Цей посібник містить детальні інструкції щодо розгортання моделей штучного інтелекту за допомогою шаблонів AZD, охоплюючи все від вибору моделі до шаблонів розгортання у виробництві.

## Зміст

- [Стратегія вибору моделі](../../../../docs/ai-foundry)
- [Конфігурація AZD для моделей AI](../../../../docs/ai-foundry)
- [Шаблони розгортання](../../../../docs/ai-foundry)
- [Управління моделями](../../../../docs/ai-foundry)
- [Виробничі аспекти](../../../../docs/ai-foundry)
- [Моніторинг та спостереження](../../../../docs/ai-foundry)

## Стратегія вибору моделі

### Моделі Azure OpenAI

Виберіть відповідну модель для вашого випадку використання:

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

### Планування потужності моделі

| Тип моделі | Випадок використання | Рекомендована потужність | Вартість |
|------------|----------------------|--------------------------|----------|
| GPT-4o-mini | Чат, Q&A | 10-50 TPM | Економічно вигідно для більшості завдань |
| GPT-4 | Складне мислення | 20-100 TPM | Вища вартість, використовується для преміум-функцій |
| Text-embedding-ada-002 | Пошук, RAG | 30-120 TPM | Необхідно для семантичного пошуку |
| Whisper | Перетворення мови в текст | 10-50 TPM | Завдання обробки аудіо |

## Конфігурація AZD для моделей AI

### Конфігурація шаблону Bicep

Створіть розгортання моделей за допомогою шаблонів Bicep:

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

### Змінні середовища

Налаштуйте середовище вашого додатка:

```bash
# Конфігурація .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Шаблони розгортання

### Шаблон 1: Розгортання в одному регіоні

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

Найкраще підходить для:
- Розробки та тестування
- Додатків для одного ринку
- Оптимізації витрат

### Шаблон 2: Розгортання в кількох регіонах

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Найкраще підходить для:
- Глобальних додатків
- Вимог високої доступності
- Розподілу навантаження

### Шаблон 3: Гібридне розгортання

Поєднуйте Azure OpenAI з іншими AI-сервісами:

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

## Управління моделями

### Контроль версій

Відстежуйте версії моделей у вашій конфігурації AZD:

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

### Оновлення моделей

Використовуйте AZD hooks для оновлення моделей:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B тестування

Розгортайте кілька версій моделей:

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

## Виробничі аспекти

### Планування потужності

Розрахуйте необхідну потужність на основі шаблонів використання:

```python
# Приклад розрахунку ємності
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

# Приклад використання
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Конфігурація авто-масштабування

Налаштуйте авто-масштабування для Container Apps:

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

### Оптимізація витрат

Реалізуйте контроль витрат:

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

## Моніторинг та спостереження

### Інтеграція Application Insights

Налаштуйте моніторинг для завдань AI:

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

### Користувацькі метрики

Відстежуйте специфічні метрики AI:

```python
# Спеціальна телеметрія для моделей штучного інтелекту
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

### Перевірка стану

Реалізуйте моніторинг стану AI-сервісів:

```python
# Точки перевірки стану здоров'я
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Тестування з'єднання OpenAI
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

## Наступні кроки

1. **Перегляньте [Посібник з інтеграції Microsoft Foundry](microsoft-foundry-integration.md)** для шаблонів інтеграції сервісів
2. **Завершіть [Лабораторію AI Workshop](ai-workshop-lab.md)** для практичного досвіду
3. **Реалізуйте [Практики AI у виробництві](production-ai-practices.md)** для корпоративних розгортань
4. **Ознайомтеся з [Посібником з усунення несправностей AI](../troubleshooting/ai-troubleshooting.md)** для вирішення поширених проблем

## Ресурси

- [Доступність моделей Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Масштабування Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимізація витрат на моделі AI](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навігація по розділу:**
- **📚 Домашня сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з акцентом на AI
- **⬅️ Попередній**: [Інтеграція Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Наступний**: [Лабораторія AI Workshop](ai-workshop-lab.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../getting-started/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->