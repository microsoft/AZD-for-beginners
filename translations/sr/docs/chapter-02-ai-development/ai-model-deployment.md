# Распоређивање AI модела уз Azure Developer CLI

**Навигација поглављем:**
- **📚 Course Home**: [AZD за почетнике](../../README.md)
- **📖 Current Chapter**: Поглавље 2 - AI-први развој
- **⬅️ Previous**: [Интеграција Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Next**: [AI лабораторија](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

Ово упутство пружа комплетне инструкције за распоређивање AI модела користећи AZD шаблоне, обухватајући све од избора модела до образаца распоређивања у продукцији.

> **Напомена о валидацији (2026-03-25):** Радни ток AZD у овом водичу је проверен са `azd` `1.23.12`. За AI распореде који трају дуже од подразумеваног прозора за распоређивање сервиса, актуелна издања AZD-а подржавају `azd deploy --timeout <seconds>`.

## Садржај

- [Стратегија избора модела](#стратегија-избора-модела)
- [AZD конфигурација за AI моделе](#azd-конфигурација-за-ai-моделе)
- [Образци распоређивања](#образци-распоређивања)
- [Управљање моделима](#управљање-моделима)
- [Разматрања за продукцију](#разматрања-за-продукцију)
- [Надгледање и опсервабилност](#надгледање-и-опсервабилност)

## Стратегија избора модела

### Microsoft Foundry Models модели

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
|------------|-----------------|----------------------|---------------------|
| gpt-4.1-mini | Разговор, питања и одговори | 10-50 TPM | Економично за већину оптерећења |
| gpt-4.1 | Сложено резоновање | 20-100 TPM | Виши трошкови, користити за премиум функције |
| text-embedding-3-large | Претрага, RAG | 30-120 TPM | Снажан подразумевани избор за семантичку претрагу и преузимање |
| Whisper | Претварање говора у текст | 10-50 TPM | За аудио обраду |

## AZD конфигурација за AI моделе

### Конфигурација Bicep шаблона

Креирајте распореде модела преко Bicep шаблона:

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

## Образци распоређивања

### Образац 1: Распоређивање у једној регији

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

### Образац 2: Распоређивање у више регија

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

### Образац 3: Хибридно распоређивање

Комбинујте Microsoft Foundry Models са другим AI сервисима:

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

Користите AZD hooks за ажурирања модела:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Ако распоређивање траје дуже од подразумеваног временског ограничења
azd deploy --timeout 1800
```

### A/B тестирање

Распоредите више верзија модела:

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

Израчунате потребни капацитет на основу образаца коришћења:

```python
# Пример израчунавања капацитета
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

Имплементирајте контроле трошкова:

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

## Надгледање и опсервабилност

### Интеграција Application Insights

Конфигуришите мониторинг за AI оптерећења:

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
# Прилагођена телеметрија за моделе вештачке интелигенције
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

Имплементирајте надгледање статуса здравља AI сервиса:

```python
# Крајње тачке за проверу статуса
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Тестирање везе са OpenAI
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

1. **Прегледајте [Водич за интеграцију Microsoft Foundry](microsoft-foundry-integration.md)** за шаблоне интеграције сервиса
2. **Завршите [AI лабораторију](ai-workshop-lab.md)** за практично искуство
3. **Имплементирајте [Практике за продукцију AI](production-ai-practices.md)** за распоређивања у предузећима
4. **Истражите [Водич за решавање проблема са AI](../chapter-07-troubleshooting/ai-troubleshooting.md)** за уобичајене проблеме

## Ресурси

- [Доступност Microsoft Foundry Models модела](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документација за Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Скалирање Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимизација трошкова AI модела](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навигација поглављем:**
- **📚 Course Home**: [AZD за почетнике](../../README.md)
- **📖 Current Chapter**: Поглавље 2 - AI-први развој
- **⬅️ Previous**: [Интеграција Microsoft Foundry](microsoft-foundry-integration.md)
- **➡️ Next**: [AI лабораторија](ai-workshop-lab.md)
- **🚀 Next Chapter**: [Поглавље 3: Конфигурација](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање одговорности**:
Овај документ је преведен помоћу сервиса за превођење вештачком интелигенцијом [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Изворни документ на његовом оригиналном језику треба сматрати ауторитетним извором. За критичне информације препоручује се професионални људски превод. Не сносимо одговорност за било какве неспоразуме или погрешне тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->