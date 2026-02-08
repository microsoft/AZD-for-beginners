# Развертывание моделей ИИ с помощью Azure Developer CLI

**Навигация по главам:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Chapter 2 - AI-First Development
- **⬅️ Предыдущая**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Следующая**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Следующая глава**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

Этот гид предоставляет подробные инструкции по развертыванию моделей ИИ с использованием шаблонов AZD, охватывая всё — от выбора модели до шаблонов развертывания в продакшене.

## Содержание

- [Стратегия выбора модели](../../../../docs/chapter-02-ai-development)
- [Конфигурация AZD для моделей ИИ](../../../../docs/chapter-02-ai-development)
- [Шаблоны развертывания](../../../../docs/chapter-02-ai-development)
- [Управление моделями](../../../../docs/chapter-02-ai-development)
- [Соображения для эксплуатации в продакшене](../../../../docs/chapter-02-ai-development)
- [Мониторинг и наблюдаемость](../../../../docs/chapter-02-ai-development)

## Стратегия выбора модели

### Модели Azure OpenAI

Выберите подходящую модель для вашего сценария использования:

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

### Планирование пропускной способности модели

| Model Type | Use Case | Recommended Capacity | Cost Considerations |
|------------|----------|---------------------|-------------------|
| GPT-4o-mini | Чат, вопросы и ответы | 10-50 TPM | Экономично для большинства нагрузок |
| GPT-4 | Сложные рассуждения | 20-100 TPM | Более высокая стоимость, использовать для премиальных функций |
| Text-embedding-ada-002 | Поиск, RAG | 30-120 TPM | Важна для семантического поиска |
| Whisper | Речь в текст | 10-50 TPM | Нагрузки по обработке аудио |

## Конфигурация AZD для моделей ИИ

### Конфигурация шаблона Bicep

Создавайте развертывания моделей с помощью шаблонов Bicep:

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

### Переменные окружения

Настройте окружение вашего приложения:

```bash
# Конфигурация .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4o-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-ada-002
```

## Шаблоны развертывания

### Шаблон 1: Развертывание в одном регионе

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

Лучше всего подходит для:
- Разработка и тестирование
- Приложения для одного рынка
- Оптимизация затрат

### Шаблон 2: Развертывание в нескольких регионах

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Лучше всего подходит для:
- Глобальные приложения
- Требования к высокой доступности
- Распределение нагрузки

### Шаблон 3: Гибридное развертывание

Комбинируйте Azure OpenAI с другими сервисами ИИ:

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

## Управление моделями

### Контроль версий

Отслеживайте версии моделей в вашей конфигурации AZD:

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

### Обновления моделей

Используйте хуки AZD для обновлений моделей:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4o-mini']"
```

### A/B-тестирование

Разверните несколько версий модели:

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

## Соображения для эксплуатации в продакшене

### Планирование пропускной способности

Рассчитайте необходимую пропускную способность на основе шаблонов использования:

```python
# Пример расчёта ёмкости
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

# Пример использования
required_capacity = calculate_required_capacity(
    requests_per_minute=10,
    avg_prompt_tokens=500,
    avg_completion_tokens=200,
    safety_margin=0.3
)
print(f"Required capacity: {required_capacity} TPM")
```

### Настройка авто-масштабирования

Настройте авто-масштабирование для Container Apps:

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

### Оптимизация затрат

Реализуйте механизмы контроля затрат:

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

## Мониторинг и наблюдаемость

### Интеграция с Application Insights

Настройте мониторинг для нагрузок ИИ:

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

### Пользовательские метрики

Отслеживайте специфические метрики ИИ:

```python
# Пользовательская телеметрия для моделей ИИ
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

### Проверки работоспособности

Реализуйте мониторинг состояния сервисов ИИ:

```python
# Эндпоинты проверки состояния
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Тест соединения с OpenAI
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

## Дальнейшие шаги

1. **Просмотрите [Руководство по интеграции Microsoft Foundry](microsoft-foundry-integration.md)** для шаблонов интеграции сервисов
2. **Завершите [Практическую лабораторию AI](ai-workshop-lab.md)** для практического опыта
3. **Реализуйте [Практики AI для продакшена](production-ai-practices.md)** для корпоративных развертываний
4. **Изучите [Руководство по устранению неполадок AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** для распространенных проблем

## Ресурсы

- [Доступность моделей Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Масштабирование Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизация стоимости моделей ИИ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигация по главам:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Текущая глава**: Chapter 2 - AI-First Development
- **⬅️ Предыдущая**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Следующая**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Следующая глава**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности:**
Этот документ был переведён с помощью сервиса машинного перевода на основе ИИ [Co-op Translator](https://github.com/Azure/co-op-translator). Хотя мы стремимся к точности, просим учитывать, что автоматические переводы могут содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется обращаться к профессиональному переводу, выполненному человеком. Мы не несем ответственности за любые недопонимания или неверные толкования, возникающие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->