# Разгръщане на AI модел с Azure Developer CLI

**Навигация в главата:**
- **📚 Основен курс**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна**: [AI агенти](agents.md)
- **➡️ Следваща**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

Това ръководство предоставя изчерпателни инструкции за разгръщане на AI модели с помощта на шаблони на AZD, обхващайки всичко от избора на модел до модели на производство.

> **Преглед на изданието (2026-11-04):** Свързаните промени в CLI бяха прегледани спрямо `azd` `1.37.2`; наличността на моделите, версиите и квотата остават зависими от региона и абонамента. `azd deploy --timeout <seconds>` контролира прозореца за разгръщане на услугата, не гарантира активирането на агент. Вижте [текущите бележки към изданието и насоките за миграция на AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Съдържание

- [Стратегия за избор на модел](#model-selection-strategy)
- [Конфигурация на AZD за AI модели](#azd-configuration-for-ai-models)
- [Модели на разгръщане](#deployment-patterns)
- [Управление на модели](#model-management)
- [Съображения за производство](#production-considerations)
- [Мониторинг и наблюдаемост](#monitoring-and-observability)

## Стратегия за избор на модел

### Azure OpenAI модели в Microsoft Foundry

Изберете правилния модел за вашия случай на употреба:

Декларирайте разгръщанията на моделите в Bicep (по-долу), а не в произволни `services.*.config.AZURE_OPENAI_MODELS` настройки. AZD не тълкува такава настройка като списък с ресурси на модел. `project` на услуга сочи към изходния код на приложението, а не неговата `infra/` директория.

Примерите използват публикуваната версия `gpt-4.1-mini` **`2025-04-14`** и версията за вграждане **`1`**. Потвърдете, че версията на модела и SKU за разгръщане се поддържат в съответния регион/акаунт преди внедряване.

### Планиране на капацитета на модела

| Тип модел | Случай на употреба | Илюстративно търсене на токени | Съображения за разходи |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Чат, Въпроси и отговори | 10,000-50,000 TPM | Бенчмаркови разходи и качество за вашата работна натовареност |
| gpt-4.1 | Сложни задачи | 20,000-100,000 TPM | Оценяване на качествените печалби спрямо разхода за токени |
| text-embedding-3-large | Търсене, RAG | 30,000-120,000 TPM | Вземете предвид както въвеждането, така и трафика по заявки |
| Whisper | Реч в текст | Планирайте използвайки продължителността на аудиото и лимитите за заявки | Не използвайте формула за капацитет TPM на текстов модел |

TPM означава токени в минута. За тези стандартни текстови разгръщания ARM `sku.capacity` е в **единици по 1,000 TPM**, а не индивидуални TPM (капацитет `10` означава 10,000 TPM). Съотношенията RPM към TPM варират според модела/типа разгръщане; проверете и двете ограничения в [документацията за квоти](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Тези диапазони са примери, а не препоръки за размер.

## Конфигурация на AZD за AI модели

### Конфигурация на Bicep шаблон

Създайте разгръщания на модели чрез Bicep шаблони:

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

Това е пример за **инфраструктура за разработка**, обхващаща ресурсна група, не пълен AZD шаблон на приложение. Акаунтът позволява публичен достъп до мрежата и изисква удостоверяване чрез Entra ID/RBAC (`Cognitive Services OpenAI User` за извикващите). Продукцията изисква частна крайна точка, DNS и свързаност на приложението, описани в Глава 8. AZD се нуждае и от главен шаблон/съотнасяне на параметри и ресурси за хостинг на приложение; ползвайте работещ пример за пълно разгръщане.

### Променливи на средата

Конфигурирайте средата на вашето приложение:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Това са имена, дефинирани от приложението; включете ги във вашата хост конфигурация. Използваната по-долу крайна точка Azure OpenAI v1 за проверка на състоянието не изисква старата параметърна заявка `api-version`; по-старите клиенти `AzureOpenAI` я изискват, затова следвайте API-то, използвано от вашето приложение.

## Модели на разгръщане

### Модел 1: Разгръщане в един регион

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

Най-подходящ за:
- Разработка и тестване
- Приложения за един пазар
- Оптимизация на разходи

### Модел 2: Мултирегионално разгръщане

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

Пропуснатите свойства на акаунта/SKU трябва да се подадат; този фрагмент не може да се разгърне в настоящия вид. Разгръщайте модели във всеки акаунт и реализирайте отделно маршрутизиране/аварийно пренасочване и контрол на обитаването на данни.

Най-подходящ за:
- Глобални приложения
- Изисквания за висока наличност
- Разпределение на натоварването

### Модел 3: Хибридно разгръщане

Комбинирайте Microsoft Foundry модели с други AI услуги:

Следващите фрагменти предполагат, че имената и `location` са подадени от съдържащия шаблон.

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

## Управление на модели

### Контрол на версиите

Проследявайте версиите на моделите в конфигурацията на приложението си или в IaC. Този JSON е **пример, дефиниран от приложението**, не вграден AZD модел; трябва да се имплементира и разположи резервно решение:

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

### Актуализации на модела

Използвайте AZD hook за проверка на наличността само за четене, след което актуализирайте IaC и го разположете:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Изпълнете `azd up` **извън** hook-а, за да приложите промените в инфраструктурата на модела и да разположите кода. Никога не извиквайте `azd deploy` от `predeploy` hook: това рекурсивно задейства същия hook. `azd deploy --timeout 1800` удължава времето за разгръщане на приложението; не променя ресурсите на Bicep.

### A/B тестване

Илюстративният ресурс по-долу избира име за разгръщане и капацитет; той създава **едно** разгръщане, а не A/B тест. За реален експеримент разположете два отделни ресурса за разгръщане, насочвайте контролирана част от заявките към всеки и сравнете качество, латентност и разходи. Предполага се `openAi` от акаунтния пример:

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

## Съображения за производство

### Планиране на капацитета

Изчислете необходимия капацитет въз основа на моделите на използване:

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

Очакван изход: `Required capacity: 9100 TPM`. С единици капацитет от 1,000 TPM се закръгля нагоре поне до `10`, след което проверете RPM и оценка на лимита на услугата (включително бюджета за искан изход) за конкретния модел. Тази оценка на търсенето на токени не гарантира липса на ограничаване.

### Конфигурация за авто-мащабиране

Конфигурирайте авто-мащабиране за Контейнер приложения:

**Частичен ресурс:** интегрирайте настройките `template.scale` в пълно Контейнер приложение с локация, управлявана среда, контейнерно изображение, ресурси и входящ трафик. Мащабирането на репликите не увеличава квотата на модела.

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

Реализирайте контрол на разходите:

**Илюстративен бюджетен ресурс:** дефинирайте `budgetStartDate` като първия ден от текущия месец в UTC (например `2026-11-01T00:00:00Z` за този преглед), и заменете адреса за контакт. Началото трябва да отговаря на текущите ограничения на датата на услугата. Бюджетите предупреждават за забавени данни за фактуриране; те не спират разходите.

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

## Мониторинг и наблюдаемост

### Интеграция с Application Insights

Конфигурирайте мониторинг за AI работни натоварвания:

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

Ресурсният фрагмент предполага `applicationInsightsName`, `location` и съществуващ `logAnalyticsWorkspace`. Той разполага мониторинг, но не инструктира приложението или създава потребителски метрики.

### Потребителски метрики

Следете AI-специфични метрики:

Използвайте поддържаното [разпределение Azure Monitor OpenTelemetry](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), а не наследствения Python SDK `applicationinsights`. Инсталирайте `azure-monitor-opentelemetry`, конфигурирайте `APPLICATIONINSIGHTS_CONNECTION_STRING` и инициализирайте веднъж при стартиране:

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

Това илюстрира излъчване на атрибути, а не реална инструментализация на повикване на модел. Обвийте реалната заявка в span, за да измерите продължителността ѝ; инспектирайте `dependencies`/`traces` в Application Insights. Не изпращайте подканящи текстове, отговори, ключове или съобщения за изключения с чувствителна информация.

### Проверки на състоянието

Реализирайте мониторинг на здравето на AI услугата:

Инсталирайте `fastapi`, `uvicorn`, `httpx` и `azure-identity`. Задайте горните променливи за крайна точка/разгръщане и предоставете `Cognitive Services OpenAI User` на извикващия. Тази **проверка за готовност** използва Azure OpenAI v1 слой за данни с Entra ID; тя прави платено повикване към модел. Стартирайте с `uvicorn health:app` след запис като `health.py`. Използвайте отделна лека проверка за жизненост, кеширайте/ограничете резултатите от готовността и не излагайте този маршрут публично без контрол на достъп.

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

Очаквано: `GET /health/ai-models` връща `200 {"status":"healthy"}`, когато конфигурираното чат разгръщане е използваемо, или `503` без да разкрива подробности нагоре по веригата. Изброяването на разгръщания е операция на управленската равнина и не е валидна проверка за здраве на слоя за данни.

## Следващи стъпки

1. **Прегледайте [Ръководството за интеграция с Microsoft Foundry](microsoft-foundry-integration.md)** за модели на интеграция на услуги
2. **Завършете [AI Workshop Lab](ai-workshop-lab.md)** за практически опит
3. **Прилагайте [Практики за AI в производство](../chapter-08-production/production-ai-practices.md)** за корпоративни внедрявания
4. **Разгледайте [Ръководството за отстраняване на проблеми с AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** за често срещани проблеми

## Ресурси

- [Наличност на модели Microsoft Foundry](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документация за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Мащабиране на Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизация на разходите за AI модели](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигация в главата:**
- **📚 Основен курс**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 2 - AI-първо разработване
- **⬅️ Предишна**: [AI агенти](agents.md)
- **➡️ Следваща**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Следваща глава**: [Глава 3: Конфигурация](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->