# Распоређивање AI модела са Azure Developer CLI

**Навигација по поглављу:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој AI-прво
- **⬅️ Претходно**: [Интеграција Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следеће**: [AI радионица лабораторија](ai-workshop-lab.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

Овај водич пружа свеобухватна упутства за распоређивање AI модела користећи AZD шаблоне, покривајући све од избора модела до шема распоређивања у продукцију.

> **Напомена о валидацији (2026-07-13):** AZD радни ток у овом водичу проверен је против `azd` `1.27.1`. За AI распоређивања која трају дуже од подразумеваног временског окна сервиса, тренутна AZD издања подржавају `azd deploy --timeout <секунди>`.

## Садржај

- [Стратегија избора модела](#стратегија-избора-модела)
- [AZD конфигурација за AI моделе](#azd-конфигурација-за-ai-моделе)
- [Шеме распоређивања](#шеме-распоређивања)
- [Управљање моделом](#управљање-моделом)
- [Разматрања за продукцију](#разматрања-за-продукцију)
- [Мониторинг и посматрање](#мониторинг-и-посматрање)

## Стратегија избора модела

### Microsoft Foundry модели

Изаберите прави модел за ваш случај употребе:

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

### Планирање капацитета модела

| Тип модела | Случај употребе | Препоручени капацитет | Разматрања трошкова |
|------------|----------|---------------------|-------------------|
| gpt-4.1-mini | Чет, Питања и одговори | 10-50 TPM | Исплатива опција за већину задатака |
| gpt-4.1 | Комплексно расуђивање | 20-100 TPM | Виши трошак, користити за премијум функције |
| text-embedding-3-large | Претрага, RAG | 30-120 TPM | Јак подразумевани избор за семантичку претрагу и преузимање |
| Whisper | Претварање говора у текст | 10-50 TPM | Радна оптерећења обраде звука |

## AZD конфигурација за AI моделе

### Конфигурација Bicep шаблона

Креирајте распоређивања модела кроз Bicep шаблоне:

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

### Променљиве окружења

Конфигуришите окружење ваше апликације:

```bash
# .env конфигурација
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
```

## Шеме распоређивања

### Шема 1: Распоређивање у једном региону

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

Најпогодније за:
- Развој и тестирање
- Апликације за једно тржиште
- Оптимизацију трошкова

### Шема 2: Распоређивање у више регија

```bicep
// Multi-region deployment
param regions array = ['eastus2', 'westus2', 'francecentral']

resource openAiMultiRegion 'Microsoft.CognitiveServices/accounts@2023-05-01' = [for region in regions: {
  name: '${openAiAccountName}-${region}'
  location: region
  // ... configuration
}]
```

Најпогодније за:
- Глобалне апликације
- Захтеве за високу доступност
- Расподелу оптерећења

### Шема 3: Хибридно распоређивање

Комбинујте Microsoft Foundry моделе са другим AI услугама:

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

Пратите верзије модела у вашој AZD конфигурацији:

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

### Ажурирања модела

Користите AZD хукове за ажурирања модела:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Уколико процес постављања траје дуже од подразумеваног истека времена
azd deploy --timeout 1800
```

### A/B тестирање

Распоређујте више верзија модела:

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

## Разматрања за продукцију

### Планирање капацитета

Израчунајте потребан капацитет на основу шаблона коришћења:

```python
# Пример прорачуна капацитета
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

# Пример употребе
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

Имплементирајте контролу трошкова:

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

Конфигуришите мониторинг AI радних оптерећења:

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

### Прилагођене мерне јединице

Пратите AI-специфичне метрике:

```python
# Прилагођена телеметрија за AI моделе
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

Имплементирајте праћење здравља AI услуге:

```python
# Ендпоинти за проверу здравља
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Тестирање OpenAI везе
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

1. **Прегледајте [Водич за интеграцију Microsoft Foundry](microsoft-foundry-integration.md)** за шеме интеграције услуга
2. **Завршите [AI радионицу лабораторију](ai-workshop-lab.md)** за практично искуство
3. **Имплементирајте [Производне AI праксе](production-ai-practices.md)** за корпоративна распоређивања
4. **Истражите [Водич за решавање проблема AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** за честе проблеме

## Ресурси

- [Доступност Microsoft Foundry модела](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документација Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Скалирање Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизација трошкова AI модела](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигација по поглављу:**
- **📚 Почетак курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 2 - Развој AI-прво
- **⬅️ Претходно**: [Интеграција Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Следеће**: [AI радионица лабораторија](ai-workshop-lab.md)
- **🚀 Следеће поглавље**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->