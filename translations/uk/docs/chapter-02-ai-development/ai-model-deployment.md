# Розгортання моделей ШІ з Azure Developer CLI

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з орієнтацією на ШІ
- **⬅️ Попередній**: [AI-агенти](agents.md)
- **➡️ Наступний**: [Лабораторія AI Workshop](ai-workshop-lab.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

Цей посібник містить докладні інструкції з розгортання моделей ШІ за допомогою шаблонів AZD, охоплюючи все — від вибору моделі до схем розгортання у виробництві.

> **Огляд версії (2026-11-04):** Пов’язані зміни CLI були перевірені щодо `azd` `1.37.2`; доступність моделей, версії та квоти залишаються залежними від регіону та підписки. `azd deploy --timeout <seconds>` контролює вікно розгортання сервісу, а не гарантію активації агента. Див. [поточні нотатки про реліз і настанови з міграції ШІ](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Зміст

- [Стратегія вибору моделей](#model-selection-strategy)
- [Конфігурація AZD для моделей ШІ](#azd-configuration-for-ai-models)
- [Шаблони розгортання](#deployment-patterns)
- [Управління моделями](#model-management)
- [Виробничі міркування](#production-considerations)
- [Моніторинг і спостережність](#monitoring-and-observability)

## Стратегія вибору моделей

### Моделі Azure OpenAI у Microsoft Foundry

Оберіть правильну модель для вашого сценарію:

Оголошуйте розгортання моделей у Bicep (нижче), а не у довільних налаштуваннях `services.*.config.AZURE_OPENAI_MODELS`. AZD не інтерпретує таке налаштування як список ресурсів моделі. `project` сервісу вказує на джерело застосунку, а не на каталог `infra/`.

У прикладах використовується опублікована версія `gpt-4.1-mini` **`2025-04-14`** і версія embedding **`1`**. Перед наданням підтвердіть, що версія моделі та SKU розгортання підтримуються у вашому цільовому регіоні/аккаунті.

### Планування пропускної здатності моделі

| Тип моделі | Сценарій використання | Ілюстративний попит у токенах | Вартісні міркування |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Чат, питання-відповіді | 10 000-50 000 TPM | Бенчмарк вартості та якості для вашого навантаження |
| gpt-4.1 | Складні завдання | 20 000-100 000 TPM | Оцініть приріст якості порівняно з вартістю токенів |
| text-embedding-3-large | Пошук, RAG | 30 000-120 000 TPM | Враховуйте як індексацію, так і трафік запитів |
| Whisper | Перетворення мови в текст | Плануйте за тривалістю аудіо та лімітами запитів | Не застосовуйте формулу потужності TPM для текстової моделі |

TPM означає токенів за хвилину. Для цих стандартних текстових розгортань ARM `sku.capacity` оцінюється в одиницях **1 000 TPM**, а не окремих TPM (потужність `10` означає 10 000 TPM). Відношення RPM до TPM варіюється за моделлю/типом розгортання; перевірте обидва ліміти відповідно до [документації з квот](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ці діапазони наведені як приклади, а не як рекомендації щодо розмірів.

## Конфігурація AZD для моделей ШІ

### Конфігурація шаблону Bicep

Створюйте розгортання моделей через шаблони Bicep:

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

Це приклад інфраструктури **розробки в межах групи ресурсів**, а не повний шаблон застосунку AZD. Аккаунт дозволяє публічний доступ через мережу та вимагає автентифікації Entra ID/RBAC (`Cognitive Services OpenAI User` для викликачів). Для виробництва потрібні приватна кінцева точка, DNS і підключення застосунку, описані в Розділі 8. AZD також потребує основний шаблон/відповідність параметрів і ресурси для розміщення застосунку; використовуйте робочий приклад для повного розгортання.

### Змінні середовища

Налаштуйте середовище вашого застосунку:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Це імена, визначені застосунком; підключіть їх до конфігурації хоста. Вузол Azure OpenAI v1, використаний для перевірки стану нижче, не потребує застарілого параметра запиту `api-version`; старі клієнти `AzureOpenAI` потребують його, тож дотримуйтесь версії API, що використовується вашим застосунком.

## Шаблони розгортання

### Шаблон 1: Розгортання в одному регіоні

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

Найкраще для:
- Розробки та тестування
- Застосунків для одного ринку
- Оптимізації витрат

### Шаблон 2: Розгортання у кількох регіонах

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

Пропущені властивості акаунта/SKU мають бути надані; цей фрагмент не можна розгорнути в такому вигляді. Розгорніть моделі у кожному акаунті та окремо реалізуйте маршрутизацію/перемикання і контроль розміщення даних.

Найкраще для:
- Глобальних застосунків
- Високих вимог до доступності
- Розподілу навантаження

### Шаблон 3: Гібридне розгортання

Комбінуйте моделі Microsoft Foundry з іншими сервісами ШІ:

Наступні фрагменти припускають, що імена та `location` надаються батьківським шаблоном.

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

Відстежуйте версії моделей у конфігурації вашого застосунку або IaC. Цей JSON є **прикладом, визначеним застосунком**, а не вбудованою схемою моделей AZD; потрібно реалізувати резервне рішення та розгорнути його явно:

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

### Оновлення моделей

Використовуйте хуки AZD для перевірки доступності тільки для читання, потім оновіть IaC і провізуйте її:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Запускайте `azd up` **позаду** хуків для застосування змін у інфраструктурі моделей і розгортання коду. Ніколи не викликайте `azd deploy` з хуку `predeploy`: це рекурсивно активує той самий хук. `azd deploy --timeout 1800` розширює час очікування розгортання застосунку; не оновлює ресурси Bicep.

### A/B тестування

Наведений ілюстративний ресурс нижче вибирає ім'я розгортання і потужність; він створює **одне** розгортання, а не A/B тест. Для реального експерименту створюйте два різні ресурси розгортання, направляйте контрольовану частину запитів до кожного та порівнюйте якість, затримки і вартість. Припускається `openAi` з прикладу акаунта:

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

## Виробничі міркування

### Планування пропускної здатності

Обчисліть необхідну потужність на основі шаблонів використання:

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

Очікуваний вихід: `Required capacity: 9100 TPM`. При потужності в 1 000 TPM округліть вгору принаймні до `10`, потім перевірте оцінку обмежень RPM і швидкості сервісу (включаючи бюджет запитуваного виводу). Ця оцінка попиту на токени не гарантує відсутність обмежень.

### Конфігурація автмасштабування

Налаштуйте автмасштабування для Container Apps:

**Частковий ресурс:** об'єднайте налаштування `template.scale` у повний Container App із локацією, керованим середовищем, образом контейнера, ресурсами та ingress. Збільшення числа реплік не збільшує квоту моделі.

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

### Оптимізація вартості

Впровадьте контроль витрат:

**Ілюстративний ресурс бюджету:** встановіть `budgetStartDate` першим днем поточного місяця за UTC (наприклад, `2026-11-01T00:00:00Z` для цього огляду), замініть контактну адресу. Початок має відповідати поточним обмеженням дати сервісу. Бюджети повідомляють про затримки у звітах по білінгу; вони не призупиняють витрати.

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

## Моніторинг і спостережність

### Інтеграція Application Insights

Налаштуйте моніторинг для робочих навантажень зі ШІ:

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

Фрагмент ресурсу припускає `applicationInsightsName`, `location` та наявність `logAnalyticsWorkspace`. Він проваджує моніторинг, але не інструментує застосунок або створює власні метрики.

### Власні метрики

Відстежуйте метрики, специфічні для ШІ:

Використовуйте підтримуваний [розподіл Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), а не застарілий Python SDK `applicationinsights`. Встановіть `azure-monitor-opentelemetry`, налаштуйте `APPLICATIONINSIGHTS_CONNECTION_STRING` і ініціалізуйте один раз при запуску:

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

Це ілюструє випуск атрибутів, а не реальну інструментацію виклику моделей. Огорніть реальний запит у спан для заміру його тривалості; перевірте `dependencies`/`traces` в Application Insights. Не надсилайте підказки, відповіді, ключі або сирі повідомлення про виключення, що містять конфіденційні дані.

### Перевірка стану

Реалізуйте моніторинг стану сервісу ШІ:

Встановіть `fastapi`, `uvicorn`, `httpx` і `azure-identity`. Налаштуйте змінні для кінцевої точки/розгортання вище та надайте викликачеві `Cognitive Services OpenAI User`. Ця **проба готовності** використовує Azure OpenAI v1 data plane з Entra ID; вона робить платний виклик моделі. Запустіть з `uvicorn health:app` після збереження як `health.py`. Використовуйте окрему легку перевірку живучості, обмежуйте/кешуйте результати проби готовності, не робіть цей шлях публічно доступним без контролю доступу.

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

Очікувано: `GET /health/ai-models` повертає `200 {"status":"healthy"}`, коли налаштоване чат-розгортання доступне, або `503` без розкриття деталей зверху. Перелік розгортань — операція на керувальній площині, вона не є дійсною перевіркою стану на площині даних.

## Наступні кроки

1. **Ознайомтеся з [керівництвом інтеграції Microsoft Foundry](microsoft-foundry-integration.md)** для шаблонів інтеграції сервісів
2. **Завершіть [Лабораторію AI Workshop](ai-workshop-lab.md)** для практичних навичок
3. **Реалізуйте [виробничі практики ШІ](../chapter-08-production/production-ai-practices.md)** для корпоративних розгортань
4. **Ознайомтеся з [керівництвом із усунення несправностей ШІ](../chapter-07-troubleshooting/ai-troubleshooting.md)** для типових проблем

## Ресурси

- [Доступність моделей Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Масштабування Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимізація вартості моделей ШІ](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - Розробка з орієнтацією на ШІ
- **⬅️ Попередній**: [AI-агенти](agents.md)
- **➡️ Наступний**: [Лабораторія AI Workshop](ai-workshop-lab.md)
- **🚀 Наступний розділ**: [Розділ 3: Конфігурація](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->