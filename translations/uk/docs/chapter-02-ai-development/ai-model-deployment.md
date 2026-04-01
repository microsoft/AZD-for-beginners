# Розгортання AI-моделей за допомогою Azure Developer CLI

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-First Development
- **⬅️ Попередній**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Наступний**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Наступний розділ**: [Розділ 3: Configuration](../chapter-03-configuration/configuration.md)

Цей посібник містить докладні інструкції з розгортання AI-моделей за допомогою шаблонів AZD, охоплюючи все від вибору моделі до шаблонів розгортання в продакшн.

> **Примітка щодо перевірки (2026-03-25):** Робочий процес AZD у цьому посібнику було перевірено на версії `azd` `1.23.12`. Для розгортань AI, які тривають довше стандартного вікна сервісного розгортання, поточні релізи AZD підтримують `azd deploy --timeout <seconds>`.

## Зміст

- [Стратегія вибору моделей](#стратегія-вибору-моделей)
- [Налаштування AZD для AI-моделей](#налаштування-azd-для-ai-моделей)
- [Шаблони розгортання](#шаблони-розгортання)
- [Управління моделями](#управління-моделями)
- [Виробничі аспекти](#виробничі-аспекти)
- [Моніторинг та спостереження](#моніторинг-та-спостереження)

## Стратегія вибору моделей

### Microsoft Foundry Models Models

Обирайте відповідну модель для вашого сценарію:

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

### Планування потужності моделі

| Тип моделі | Сценарій використання | Рекомендована потужність | Врахування вартості |
|------------|----------------------|--------------------------|---------------------|
| gpt-4.1-mini | Чат, запитання-відповіді | 10-50 TPM | Вартість ефективна для більшості навантажень |
| gpt-4.1 | Складне логічне мислення | 20-100 TPM | Вища вартість, для преміальних функцій |
| text-embedding-3-large | Пошук, RAG | 30-120 TPM | Надійний вибір за замовчуванням для семантичного пошуку та вилучення |
| Whisper | Розпізнавання мови | 10-50 TPM | Для обробки аудіо |

## Налаштування AZD для AI-моделей

### Налаштування Bicep шаблону

Створюйте розгортання моделей через Bicep шаблони:

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

### Змінні середовища

Налаштуйте середовище вашого застосунку:

```bash
# конфігурація .env
AZURE_OPENAI_ENDPOINT=https://your-openai-resource.openai.azure.com/
AZURE_OPENAI_API_VERSION=2024-02-15-preview
AZURE_OPENAI_CHAT_DEPLOYMENT=gpt-4.1-mini
AZURE_OPENAI_EMBED_DEPLOYMENT=text-embedding-3-large
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
      AZURE_OPENAI_CHAT_DEPLOYMENT: gpt-4.1-mini
```

Оптимально для:
- Розробки та тестування
- Одноринкового застосування
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

Оптимально для:
- Глобальних застосунків
- Високої доступності
- Розподілу навантаження

### Шаблон 3: Гібридне розгортання

Поєднуйте Microsoft Foundry Models з іншими AI-сервісами:

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

Відстежуйте версії моделей у конфігурації AZD:

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

### Оновлення моделей

Використовуйте хуки AZD для оновлень моделей:

```bash
#!/bin/bash
# hooks/predeploy.sh

echo "Checking model availability..."
az cognitiveservices account list-models \
  --name $AZURE_OPENAI_ACCOUNT_NAME \
  --resource-group $AZURE_RESOURCE_GROUP \
  --query "[?name=='gpt-4.1-mini']"

# Якщо розгортання триває довше за час очікування за замовчуванням
azd deploy --timeout 1800
```

### A/B тестування

Розгортайте кілька версій моделей:

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

## Виробничі аспекти

### Планування потужності

Розраховуйте необхідну потужність на основі шаблонів використання:

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

### Налаштування автоматичного масштабування

Налаштуйте автоскейл для Container Apps:

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

### Інтеграція з Application Insights

Налаштуйте моніторинг AI-навантажень:

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

Відслідковуйте специфічні для AI метрики:

```python
# Спеціальна телеметрія для AI моделей
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

Реалізуйте моніторинг здоров’я AI-сервісів:

```python
# Контрольні точки стану здоров'я
from fastapi import FastAPI, HTTPException
import httpx

app = FastAPI()

@app.get("/health/ai-models")
async def check_ai_models():
    """Check AI model availability."""
    try:
        # Тестувати з'єднання з OpenAI
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

1. **Ознайомтесь з [Microsoft Foundry Integration Guide](microsoft-foundry-integration.md)** про шаблони інтеграції сервісів
2. **Виконайте [AI Workshop Lab](ai-workshop-lab.md)** для практичного досвіду
3. **Впровадьте [Production AI Practices](production-ai-practices.md)** для корпоративних розгортань
4. **Дослідіть [AI Troubleshooting Guide](../chapter-07-troubleshooting/ai-troubleshooting.md)** для типових проблем

## Ресурси

- [Доступність моделей Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)
- [Документація Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Масштабування Container Apps](https://learn.microsoft.com/azure/container-apps/scale-app)
- [Оптимізація витрат AI-моделей](https://learn.microsoft.com/azure/ai-services/openai/how-to/manage-costs)

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD For Beginners](../../README.md)
- **📖 Поточний розділ**: Розділ 2 - AI-First Development
- **⬅️ Попередній**: [Microsoft Foundry Integration](microsoft-foundry-integration.md)
- **➡️ Наступний**: [AI Workshop Lab](ai-workshop-lab.md)
- **🚀 Наступний розділ**: [Розділ 3: Configuration](../chapter-03-configuration/configuration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будьте уважні, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний переклад людиною. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->