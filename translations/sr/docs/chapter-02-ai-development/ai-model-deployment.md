# Деплојмент AI модела уз Azure Developer CLI

**Навигација кроз поглавље:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-прва развој
- **⬅️ Претходно**: [AI агенти](agents.md)
- **➡️ Следеће**: [AI радионица лаб](ai-workshop-lab.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

Ово упутство пружа обимне инструкције за деплојмент AI модела коришћењем AZD шаблона, покривајући све од избора модела до обрасца деплојмента у продукцији.

> **Преглед издања (2026-11-04):** Повезане промене у CLI су прегледане у односу на `azd` `1.37.2`; доступност модела, верзије и квота зависе од региона и претплате. `azd deploy --timeout <seconds>` контролише прозор за деплојмент сервиса, није гаранција активирања агента. Погледајте [тренутне белешке о издању и смернице за миграцију AI](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes).

## Садржај

- [Стратегија избора модела](#model-selection-strategy)
- [AZD конфигурација за AI моделе](#azd-configuration-for-ai-models)
- [Обрасци деплојмента](#deployment-patterns)
- [Управљање моделом](#model-management)
- [Производне разматрања](#production-considerations)
- [Мониторинг и посматрање](#monitoring-and-observability)

## Стратегија избора модела

### Azure OpenAI модели у Microsoft Foundry

Одаберите прави модел за ваш случај коришћења:

Декларишите деплојменте модела у Bicep-у (испод), а не у произвољним `services.*.config.AZURE_OPENAI_MODELS` подешавањима. AZD не тумачи такво подешавање као листу ресурсa модела. `project` сервиса показује на извор апликације, а не његов `infra/` директоријум.

Примери користе објављену верзију `gpt-4.1-mini` **`2025-04-14`** и верзију угњежђивања **`1`**. Потврдите да су верзија модела и деплојмент SKU подржани у вашем циљном региону/налогу пре постављања.

### Планирање капацитета модела

| Тип модела | Случај коришћења | Илустративна тражња токена | Разматрања трошкова |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Ћаскање, питања и одговори | 10,000-50,000 TPM | Процените трошкове и квалитет за ваш радни оптерећење |
| gpt-4.1 | Комплексни задаци | 20,000-100,000 TPM | Процените добитке у квалитету у односу на трошкове по токену |
| text-embedding-3-large | Претрага, RAG | 30,000-120,000 TPM | Рачунајте унос као и саобраћај упита |
| Whisper | Пренос говора у текст | Планирајте коришћење на основу трајања аудио записа и ограничења захтева | Не примењујте формулу капацитета TPM за текстуални модел |

TPM значи токена у минути. За ове Стандардне текстуалне деплојменте, ARM `sku.capacity` је у јединицама од **1,000 TPM**, а не појединачним TPM (капацитет `10` значи 10,000 TPM). Односи RPM према TPM варирају по типу модела/деплојмента; проверите обе границе у складу са [документацијом о квотама](https://learn.microsoft.com/azure/ai-foundry/openai/quotas-limits?view=foundry-classic). Ове вредности су примери, а не препоруке за димензионисање.

## AZD конфигурација за AI моделе

### Конфигурација Bicep шаблона

Креирајте деплојменте модела кроз Bicep шаблоне:

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

Ово је пример инфраструктуре у оквиру групе ресурса за **развој**, а не комплетан AZD шаблон апликације. Налог дозвољава јавни приступ мрежи и захтева Entra ID/RBAC аутентификацију (`Cognitive Services OpenAI User` за позиваоце). Производња захтева приватну крајњу тачку, DNS и повезаност апликације описане у Поглављу 8. AZD такође треба главни шаблон/мапу параметара и ресурсе домаћина апликације; користите радни пример за пун деплојмент.

### Променљиве окружења

Конфигуришите окружење своје апликације:

```bash
# .env configuration
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

Ово су имена дефинисана апликацијом; повежите их у конфигурацију свог домаћина. Azure OpenAI v1 крајња тачка коришћена у провери здравља испод не захтева застарели `api-version` параметар у упиту; старији `AzureOpenAI` клијенти га захтевају, па пратите генерацију API коју користи ваша апликација.

## Обрасци деплојмента

### Образац 1: Деплојмент у једном региону

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

Најпогоднији за:
- Развој и тестирање
- Апликације за једно тржиште
- Оптимизацију трошкова

### Образац 2: Мултирегионални деплојмент

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

Изостављена својства налога/SKU морају бити обезбеђена; овај фрагмент није могуће деплојтовати како је написан. Деплојтујте моделе у сваком налогу и имплементирајте рутирање/феиловер и контроле резиденције података посебно.

Најпогоднији за:
- Глобалне апликације
- Захтеве за високу доступност
- Расподелу оптерећења

### Образац 3: Хибридни деплојмент

Комбинујте Microsoft Foundry моделе са другим AI сервисима:

Следећи фрагменти претпостављају да имена и `location` обезбеђује обухватајући шаблон.

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

## Управљање моделом

### Контрола верзија

Пратите верзије модела у конфигурацији ваше апликације или IaC. Овај JSON је **пример дефинисан апликацијом**, а не уграђена AZD шема модела; резервни механизам мора бити имплементиран и експлицитно деплојтован:

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

### Ажурирања модела

Користите AZD hook за проверу доступности само за читање, потом ажурирајте IaC и деплојтујте:

```bash
#!/bin/bash
# Illustrative hooks/check-model.sh (requires Azure CLI login and these variables)

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name "$AZURE_OPENAI_ACCOUNT_NAME" \
  --resource-group "$AZURE_RESOURCE_GROUP" \
  --query "[?name=='gpt-4.1-mini']"

```

Покрените `azd up` **изван** hook-а да примените промене у инфраструктури модела и код деплојмент. Никада не позивајте `azd deploy` из `predeploy` hook-а: то рекурзивно покреће исти hook. `azd deploy --timeout 1800` продужава тајм-аут деплојмента апликације; не ажурира Bicep ресурсе.

### А/B тестирање

Илустративни ресурс испод бира име деплојмента и капацитет; он креира **један** деплојмент, не А/B тест. За стварни експеримент, поставите два различита ресурса деплојмента, усмерите контролисани део захтева на сваки и упоредите квалитет, латенцију и цену. Претпоставља `openAi` из примерка налога:

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

## Производна разматрања

### Планирање капацитета

Израчунајте потребни капацитет на основу шаблона коришћења:

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

Очекујани излаз: `Required capacity: 9100 TPM`. Са 1,000-ТПМ јединица капацитета, заокружите на најмање `10`, затим проверите специфичне RPM и процену ограничења сервиса модела (укључујући захтевани буџет излаза). Ова процена тражње токена није гаранција против успоравања.

### Конфигурација аутоматског скалирања

Конфигуришите аутоматско скалирање за Container Apps:

**Делимични ресурс:** спојите `template.scale` поставке у комплетну Container App са локацијом, управљаним окружењем, сликом контејнера, ресурсима и улазом. Скалирање реплика не повећава квоту модела.

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

Имплементирајте контроле трошкова:

**Илустративни буџетски ресурс:** дефинишите `budgetStartDate` као први дан текућег месеца у UTC (на пример `2026-11-01T00:00:00Z` за овај преглед), и замените контакт адресу. Почетак мора задовољити тренутна временска ограничења сервиса. Буџети упозоравају на одложене податке о наплати; не заустављају трошење.

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

## Мониторинг и посматрање

### Интеграција Application Insights

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

```

Ресурс фрагмент претпоставља `applicationInsightsName`, `location` и постојећи `logAnalyticsWorkspace`. Он обезбеђује мониторинг, али не инструменталише апликацију или креира прилагођене метрике.

### Прилагођене метрике

Пратите AI-специфичне метрике:

Користите подржану [Azure Monitor OpenTelemetry дистрибуцију](https://learn.microsoft.com/azure/azure-monitor/app/opentelemetry-enable?tabs=python), а не застарели `applicationinsights` Python SDK. Инсталирајте `azure-monitor-opentelemetry`, конфигуришите `APPLICATIONINSIGHTS_CONNECTION_STRING` и иницијализујте једном при покретању:

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

Ово илуструје емисију атрибута, не стварну инструментацију позива модела. Укључите стварни захтев у span да измерите његово трајање; прегледајте `dependencies`/`traces` у Application Insights. Не шаљите упите, одговоре, кључеве или необрађене поруке о изузецима које садрже поверљиве податке.

### Провере здравља

Имплементирајте мониторинг здравља AI сервиса:

Инсталирајте `fastapi`, `uvicorn`, `httpx` и `azure-identity`. Подесите горе крајње тачке/променљиве деплојмента и омогућите позиваоцу `Cognitive Services OpenAI User`. Ова **провера спремности** користи Azure OpenAI v1 data plane са Entra ID; врши наплаћени позив модела. Покрените са `uvicorn health:app` након што сачувате као `health.py`. Користите посебну једноставну проверу живости, ограничите брзину/кеуирајте резултате спремности и не изложите овај пут јавно без контроле приступа.

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

Очекује се: `GET /health/ai-models` враћа `200 {"status":"healthy"}` када је конфигурисани чат деплојмент употребљив, или `503` без откривања детаља узводно. Листање деплојмената је операција управљачке равни и није важећа здравствена провера data plane.

## Следећи кораци

1. **Прегледајте [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** за обрасце интеграције сервиса
2. **Завршите [AI Workshop Lab](ai-workshop-lab.md)** за практично искуство
3. **Имплементирајте [Производне AI праксе](../chapter-08-production/production-ai-practices.md)** за ентерпрајз деплојменте
4. **Истражите [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** за уобичајене проблеме

## Ресурси

- [Доступност Microsoft Foundry модела](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документација за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Скалирање Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизација трошкова AI модела](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигација кроз поглавље:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - AI-прва развој
- **⬅️ Претходно**: [AI агенти](agents.md)
- **➡️ Следеће**: [AI радионица лаб](ai-workshop-lab.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->