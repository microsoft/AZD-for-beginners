# Развертывание моделей ИИ с помощью Azure Developer CLI

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом ИИ
- **⬅️ Предыдущая**: [Интеграция с Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следующая**: [Лабораторная работа по ИИ](ai-workshop-lab.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

Это руководство содержит подробные инструкции по развертыванию моделей ИИ с использованием шаблонов AZD, охватывая все этапы от выбора модели до паттернов развертывания в производстве.

> **Примечание по валидации (2026-03-25):** Рабочий процесс AZD в данном руководстве был проверен с `azd` версии `1.23.12`. Для развертываний ИИ, которые занимают больше времени, чем стандартное окно развертывания сервиса, текущие версии AZD поддерживают команду `azd deploy --timeout <seconds>`.

## Содержание

- [Стратегия выбора модели](#стратегия-выбора-модели)
- [Конфигурация AZD для моделей ИИ](#конфигурация-azd-для-моделей-ии)
- [Паттерны развертывания](#паттерны-развертывания)
- [Управление моделями](#управление-моделями)
- [Особенности производства](#особенности-производства)
- [Мониторинг и наблюдаемость](#мониторинг-и-наблюдаемость)

## Стратегия выбора модели

### Модели Microsoft Foundry

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

### Планирование ёмкости модели

| Тип модели | Сценарий использования | Рекомендуемая ёмкость | Стоимостные соображения |
|------------|-----------------------|----------------------|------------------------|
| gpt-4.1-mini | Чат, Вопрос-Ответ | 10-50 TPM | Экономично для большинства нагрузок |
| gpt-4.1 | Сложное рассуждение | 20-100 TPM | Более высокая стоимость, использовать для премиальных функций |
| text-embedding-3-large | Поиск, RAG | 30-120 TPM | Надёжный выбор по умолчанию для семантического поиска и извлечения |
| Whisper | Распознавание речи | 10-50 TPM | Для аудиообработки |

## Конфигурация AZD для моделей ИИ

### Конфигурация шаблона Bicep

Создавайте развертывания моделей через шаблоны Bicep:

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

### Переменные окружения

Настройте окружение вашего приложения:

```bash
# Конфигурация .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Паттерны развертывания

### Паттерн 1: Развертывание в одном регионе

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

Лучше всего подходит для:
- Разработки и тестирования
- Приложений для одного рынка
- Оптимизации затрат

### Паттерн 2: Развертывание в нескольких регионах

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
- Глобальных приложений
- Требований высокой доступности
- Распределения нагрузки

### Паттерн 3: Гибридное развертывание

Комбинируйте модели Microsoft Foundry с другими ИИ-сервисами:

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

### Обновления моделей

Используйте хуки AZD для обновления моделей:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Если развертывание занимает больше времени, чем установленное по умолчанию время ожидания
azd deploy --timeout 1800
```

### A/B тестирование

Развертывайте несколько версий моделей:

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

## Особенности производства

### Планирование ёмкости

Рассчитывайте требуемую ёмкость на основе шаблонов использования:

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

### Конфигурация автоподстройки масштабирования

Настройте автоподстройку масштабирования для Container Apps:

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

Внедрите управление затратами:

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

### Интеграция Application Insights

Настройте мониторинг для ИИ-нагрузок:

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

Отслеживайте специфичные для ИИ метрики:

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

### Проверки состояния

Реализуйте мониторинг состояния ИИ-сервисов:

```python
# Конечные точки проверки состояния здоровья
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Тест подключения к OpenAI
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

## Следующие шаги

1. **Изучите [Руководство по интеграции Microsoft Foundry](microsoft-foundry-integration.md)** для паттернов интеграции сервисов
2. **Выполните [Лабораторную работу по ИИ](ai-workshop-lab.md)** для практического опыта
3. **Реализуйте [Практики производства ИИ](production-ai-practices.md)** для корпоративных развертываний
4. **Изучите [Руководство по устранению неполадок ИИ](../chapter-07-troubleshooting/ai-troubleshooting.md)** для решения распространённых проблем

## Ресурсы

- [Доступность моделей Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Масштабирование Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизация затрат на модели ИИ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигация по главам:**
- **📚 Домашняя страница курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с приоритетом ИИ
- **⬅️ Предыдущая**: [Интеграция с Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следующая**: [Лабораторная работа по ИИ](ai-workshop-lab.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критически важной информации рекомендуется профессиональный перевод, выполненный человеком. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->