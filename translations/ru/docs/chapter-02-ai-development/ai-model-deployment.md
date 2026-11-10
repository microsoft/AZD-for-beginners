# Развертывание ИИ-моделей с помощью Azure Developer CLI

**Навигация по главе:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с упором на ИИ
- **⬅️ Предыдущая**: [ИИ агенты](agents.md)
- **➡️ Следующая**: [Лаборатория ИИ](ai-workshop-lab.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

В этом руководстве приведены подробные инструкции по развертыванию ИИ-моделей с использованием шаблонов AZD, охватывающие всё от выбора модели до шаблонов развертывания в производстве.

> **Обзор релиза (2026-11-04):** Связанные изменения CLI были проверены относительно `azd` `1.37.2`; доступность моделей, версии и квоты остаются зависимыми от региона и подписки. `azd deploy --timeout <seconds>` управляет окном развертывания сервиса, а не гарантией активации агента. См. [текущие примечания к релизу и руководство по миграции ИИ](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Содержание

- [Стратегия выбора модели](#model-selection-strategy)
- [Конфигурация AZD для ИИ-моделей](#azd-configuration-for-ai-models)
- [Шаблоны развертывания](#deployment-patterns)
- [Управление моделями](#model-management)
- [Аспекты производства](#production-considerations)
- [Мониторинг и наблюдаемость](#monitoring-and-observability)

## Стратегия выбора модели

### Модели Azure OpenAI в Microsoft Foundry

Выберите подходящую модель для вашего сценария использования:

Объявляйте развертывания моделей в Bicep (ниже), а не в произвольных настройках `services.*.config.AZURE_OPENAI_MODELS`. AZD не интерпретирует такую настройку как список ресурсов моделей. `project` сервиса указывает на исходный код приложения, а не на его каталог `infra/`.

В примерах используется опубликованная версия `gpt-4.1-mini` **`2025-04-14`** и версия встраивания **`1`**. Подтвердите поддержку версии модели и SKU развертывания в вашем целевом регионе/учетной записи до провижининга.

### Планирование мощностей модели

| Тип модели | Сценарий использования | Иллюстративная потребность в токенах | Особенности стоимости |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Чат, вопросы и ответы | 10,000-50,000 TPM | Оцените стоимость и качество для вашей нагрузки |
| gpt-4.1 | Сложные задачи | 20,000-100,000 TPM | Оцените улучшение качества относительно стоимости токенов |
| text-embedding-3-large | Поиск, RAG | 30,000-120,000 TPM | Учитывайте как загрузку, так и трафик запросов |
| Whisper | Речь в текст | Планируйте, исходя из длительности аудио и лимитов запросов | Не применяйте формулу мощности TPM для текстовой модели |

TPM означает токены в минуту. Для этих стандартных текстовых развертываний ARM `sku.capacity` представлен в единицах **1,000 TPM**, а не отдельных TPM (ёмкость `10` означает 10,000 TPM). Соотношения RPM к TPM различаются в зависимости от типа модели/развертывания; проверьте оба лимита в соответствии с [документацией по квотам](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Эти диапазоны являются примерами, а не рекомендациями по размеру.

## Конфигурация AZD для ИИ-моделей

### Конфигурация шаблона Bicep

Создавайте развертывания моделей через шаблоны Bicep:

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

Это пример **разработческой инфраструктуры** с областью действия на группу ресурсов, а не полный шаблон приложения AZD. Аккаунт допускает доступ через публичную сеть и требует аутентификацию Entra ID/RBAC (`Cognitive Services OpenAI User` для вызовов). Для производства необходимы приватный endpoint, DNS и подключение приложения, описанные в главе 8. AZD также нуждается в основном шаблоне/сопоставлении параметров и ресурсах хоста приложения; используйте рабочий пример для полного развертывания.

### Переменные среды

Настройте окружение вашего приложения:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Это имена, определяемые приложением; свяжите их с конфигурацией хоста. Эндпоинт Azure OpenAI v1, используемый ниже для проверки состояния, не требует устаревшего параметра запроса `api-version`; старые клиенты `AzureOpenAI` требуют его, поэтому следуйте API, использованному вашим приложением.

## Шаблоны развертывания

### Шаблон 1: Развертывание в одном регионе

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

Лучше всего подходит для:
- Разработки и тестирования
- Приложений для одного рынка
- Оптимизации стоимости

### Шаблон 2: Много региональное развертывание

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

Пропущенные свойства учетной записи/SKU должны быть добавлены; этот фрагмент не может быть развернут как есть. Разверните модели в каждой учетной записи и реализуйте маршрутизацию/аварийное переключение и контроль местоположения данных отдельно.

Лучше всего подходит для:
- Глобальных приложений
- Требований высокой доступности
- Распределения нагрузки

### Шаблон 3: Гибридное развертывание

Сочетайте модели Microsoft Foundry с другими AI-сервисами:

Следующие фрагменты предполагают, что имена и `location` предоставлены в вызывающем шаблоне.

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

Отслеживайте версии моделей в конфигурации вашего приложения или IaC. Этот JSON — **пример, определённый приложением**, а не встроенная схема модели AZD; резервный механизм должен быть реализован и развернут явно:

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

### Обновления моделей

Используйте крючок AZD для проверки доступности только для чтения, затем обновите IaC и произведете провижининг:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Запускайте `azd up` **вне** крючка для применения изменений в инфраструктуре модели и развертывания кода. Никогда не вызывайте `azd deploy` из `predeploy` крючка: это рекурсивно вызовет тот же крючок. `azd deploy --timeout 1800` расширяет тайм-аут развертывания приложения; оно не обновляет ресурсы Bicep.

### A/B тестирование

Иллюстративный ресурс ниже выбирает имя развертывания и ёмкость; он создаёт **одно** развертывание, а не A/B тест. Для реального эксперимента создайте два разных ресурса развертывания, направьте контролируемую часть запросов на каждый и сравните качество, задержку и стоимость. Он предполагает `openAi` из примера аккаунта:

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

## Аспекты производства

### Планирование мощности

Рассчитайте необходимую ёмкость на основе паттернов использования:

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

Ожидаемый результат: `Required capacity: 9100 TPM`. При ёмкости в 1,000-TPM округлите вверх как минимум до `10`, затем проверьте модельные RPM и оценку сервисного лимита скорости (включая бюджет на вывод). Эта оценка потребности в токенах не гарантирует отсутствие ограничения по трафику.

### Конфигурация автмасштабирования

Настройте автмасштабирование для Container Apps:

**Частичный ресурс:** интегрируйте настройки `template.scale` с полным Container App с указанием локации, управляемой среды, образа контейнера, ресурсов и доступа. Увеличение количества реплик не увеличивает квоту модели.

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

Внедрите контроль затрат:

**Иллюстративный ресурс бюджета:** определите `budgetStartDate` как первый день текущего месяца в UTC (например, `2026-11-01T00:00:00Z` для этого обзора), и замените контактный адрес. Начало должно соответствовать текущим требованиям сервиса по дате. Бюджеты предупреждают о задержках в выставлении счетов; они не останавливают траты.

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

## Мониторинг и наблюдаемость

### Интеграция с Application Insights

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

```

Фрагмент ресурса предполагает `applicationInsightsName`, `location` и существующий `logAnalyticsWorkspace`. Он создаёт мониторинг, но не инструментирует приложение и не создаёт пользовательские метрики.

### Пользовательские метрики

Отслеживайте метрики, специфичные для ИИ:

Используйте поддерживаемое [распределение Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), а не устаревший `applicationinsights` Python SDK. Установите `azure-monitor-opentelemetry`, настройте `APPLICATIONINSIGHTS_CONNECTION_STRING` и инициализируйте один раз при старте:

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

Это демонстрирует эмиссию атрибутов, а не фактическое инструментирование вызова модели. Оберните реальный запрос в спан для измерения его длительности; изучите `dependencies`/`traces` в Application Insights. Не отправляйте подсказки, ответы, ключи или необработанные сообщения об исключениях, содержащих конфиденциальные данные.

### Проверки состояния

Реализуйте мониторинг состояния ИИ-сервиса:

Установите `fastapi`, `uvicorn`, `httpx` и `azure-identity`. Установите переменные эндпоинта/развертывания выше и предоставьте вызывающему `Cognitive Services OpenAI User`. Эта **проба готовности** использует плоскость данных Azure OpenAI v1 с Entra ID; она делает тарифицируемый вызов модели. Запустите с `uvicorn health:app` после сохранения как `health.py`. Используйте отдельную лёгкую проверку живучести, ограничьте скорость/кэшируйте результаты готовности, и не открывайте этот маршрут публично без контроля доступа.

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

Ожидается: `GET /health/ai-models` возвращает `200 {"status":"healthy"}`, когда настроенное чат-развертывание доступно, или `503` без раскрытия деталей сверху. Список развертываний — это операция плоскости управления и не является допустимой пробой здоровья плоскости данных.

## Следующие шаги

1. **Изучите [Руководство по интеграции Microsoft Foundry](microsoft-foundry-integration.md)** для паттернов интеграции сервиса
2. **Завершите [Лабораторию ИИ](ai-workshop-lab.md)** для практического опыта
3. **Внедрите [Практики производства ИИ](../chapter-08-production/production-ai-practices.md)** для корпоративных развертываний
4. **Изучите [Руководство по устранению неполадок ИИ](../chapter-07-troubleshooting/ai-troubleshooting.md)** для типичных проблем

## Ресурсы

- [Доступность моделей Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документация Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Масштабирование Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизация стоимости ИИ-моделей](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигация по главе:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 2 - Разработка с упором на ИИ
- **⬅️ Предыдущая**: [ИИ агенты](agents.md)
- **➡️ Следующая**: [Лаборатория ИИ](ai-workshop-lab.md)
- **🚀 Следующая глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->