# AI-Специфично Ръководство за Отстраняване на Проблеми

**Навигация в главите:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгване
- **⬅️ Предишна**: [Ръководство за дебъгване](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Практики за продукция и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързано**: [Глава 2: Разработка с AI-първи подход](../chapter-02-ai-development/microsoft-foundry-integration.md)

Това цялостно ръководство за отстраняване на проблеми разглежда често срещани въпроси при внедряване на AI решения с AZD, предоставяйки решения и техники за дебъгване, специфични за Azure AI услуги.

## Съдържание

- [Проблеми с Microsoft Foundry Models Service](#azure-openai-service-issues)
- [Проблеми с Azure AI Search](#проблеми-с-azure-ai-search)
- [Проблеми с внедряване на Container Apps](#проблеми-с-внедряване-на-container-apps)
- [Грешки при удостоверяване и разрешения](#грешки-при-удостоверяване-и-разрешения)
- [Провали при внедряване на модели](#провали-при-внедряване-на-модели)
- [Проблеми с производителността и скалирането](#проблеми-с-производителността-и-скалирането)
- [Управление на разходи и квоти](#управление-на-разходи-и-квоти)
- [Инструменти и техники за дебъгване](#инструменти-и-техники-за-дебъгване)

## Проблеми с Microsoft Foundry Models Service

### Проблем: OpenAI услуга не е налична в регион

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причини:**
- Microsoft Foundry Models не е наличен в избрания регион
- Квота изчерпана в предпочитаните региони
- Регионални капацитетни ограничения

**Решения:**

1. **Проверете наличието на регион:**
```bash
# Избройте наличните региони за OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Актуализирайте конфигурацията на AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Използвайте алтернативни региони:**
```bicep
// infra/main.bicep - Multi-region fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Проблем: Превишена квота за внедряване на модел

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Решения:**

1. **Проверете текущата квота:**
```bash
# Провери използването на квота
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Заявете увеличение на квотата:**
```bash
# Подайте заявка за увеличаване на квотата
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Оптимизирайте капацитета на модела:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Проблем: Невалидна версия на API

**Симптоми:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Решения:**

1. **Използвайте поддържана версия на API:**
```python
# Използвайте последната поддържана версия
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Проверете съвместимостта на версията на API:**
```bash
# Списък с поддържани версии на API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Проблеми с Azure AI Search

### Проблем: Недостатъчен ценови план за Search услуга

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Решения:**

1. **Актуализирайте ценовия план:**
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'  // Minimum for semantic search
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
    semanticSearch: 'standard'
  }
}
```

2. **Деактивирайте семантичното търсене (при разработка):**
```bicep
// For development environments
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  sku: {
    name: 'free'
  }
  properties: {
    semanticSearch: 'disabled'
  }
}
```

### Проблем: Провали при създаване на индекс

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Решения:**

1. **Проверете ключовете на Search услугата:**
```bash
# Получете администраторски ключ за търсещата услуга
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверете схемата на индекса:**
```python
# Валидиране на индексна схема
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Използвайте управлявана идентичност:**
```bicep
// Grant search permissions to managed identity
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, searchIndexDataContributorRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')
    principalType: 'ServicePrincipal'
  }
}
```

## Проблеми с внедряване на Container Apps

### Проблем: Провали при построяване на контейнер

**Симптоми:**
```
Error: Failed to build container image
```

**Решения:**

1. **Проверете синтаксиса на Dockerfile:**
```dockerfile
# Dockerfile - Python AI app example
FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements first for better caching
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

2. **Потвърдете зависимостите:**
```txt
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Добавете проверка на здравето:**
```python
# main.py - Добавяне на крайна точка за проверка на здравето
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблем: Провали при стартиране на Container App

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Решения:**

1. **Увеличете изчакването при стартиране:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          image: containerImage
          resources: {
            cpu: json('0.5')
            memory: '1Gi'
          }
          probes: [
            {
              type: 'startup'
              httpGet: {
                path: '/health'
                port: 8000
              }
              initialDelaySeconds: 30
              periodSeconds: 10
              timeoutSeconds: 5
              failureThreshold: 10  // Allow more time for AI models to load
            }
          ]
        }
      ]
    }
  }
}
```

2. **Оптимизирайте зареждането на модела:**
```python
# Зареждане на модели при необходимост за намаляване на времето за стартиране
import asyncio
from contextlib import asynccontextmanager

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Инициализирайте AI клиента тук
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Стартиране
    app.state.model_manager = ModelManager()
    yield
    # Изключване
    pass

app = FastAPI(lifespan=lifespan)
```

## Грешки при удостоверяване и разрешения

### Проблем: Отказан достъп на управлявана идентичност

**Симптоми:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Решения:**

1. **Проверете назначените роли:**
```bash
# Проверете текущите роли и назначения
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Назначете необходимите роли:**
```bicep
// Required role assignments for AI services
var cognitiveServicesOpenAIUserRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
var searchIndexDataContributorRole = subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '8ebe5a00-799e-43f5-93ac-243d3dce84a7')

resource openAiRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAi
  name: guid(openAi.id, containerApp.id, cognitiveServicesOpenAIUserRole)
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: cognitiveServicesOpenAIUserRole
    principalType: 'ServicePrincipal'
  }
}
```

3. **Тествайте удостоверяването:**
```python
# Тествайте удостоверяване с управлявана идентичност
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

async def test_authentication():
    try:
        credential = DefaultAzureCredential()
        token = await credential.get_token("https://cognitiveservices.azure.com/.default")
        print(f"Authentication successful: {token.token[:10]}...")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")
```

### Проблем: Отказан достъп до Key Vault

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Решения:**

1. **Дайте разрешения за Key Vault:**
```bicep
resource keyVaultAccessPolicy 'Microsoft.KeyVault/vaults/accessPolicies@2023-07-01' = {
  parent: keyVault
  name: 'add'
  properties: {
    accessPolicies: [
      {
        tenantId: subscription().tenantId
        objectId: containerApp.identity.principalId
        permissions: {
          secrets: ['get', 'list']
        }
      }
    ]
  }
}
```

2. **Използвайте RBAC вместо политики за достъп:**
```bicep
resource keyVaultSecretsUserRole 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: keyVault
  name: guid(keyVault.id, containerApp.id, 'Key Vault Secrets User')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '4633458b-17de-408a-b874-0445c86b69e6')
    principalType: 'ServicePrincipal'
  }
}
```

## Провали при внедряване на модели

### Проблем: Наличието на версията на модел не е достъпно

**Симптоми:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Решения:**

1. **Проверете наличните модели:**
```bash
# Изброяване на наличните модели
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Използвайте резервни варианти на модел:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
}

// Try primary model first, fallback if unavailable
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: primaryModel
  }
  sku: {
    name: 'Standard'
    capacity: 10
  }
}
```

3. **Потвърдете модела преди внедряване:**
```python
# Валидация на модела преди внедряване
import httpx

async def validate_model_availability(model_name: str, version: str) -> bool:
    """Check if model is available before deployment."""
    try:
        async with httpx.AsyncClient() as client:
            response = await client.get(
                f"{AZURE_OPENAI_ENDPOINT}/openai/models",
                headers={"api-key": AZURE_OPENAI_API_KEY}
            )
            models = response.json()
            return any(
                model["id"] == f"{model_name}-{version}"
                for model in models.get("data", [])
            )
    except Exception:
        return False
```

## Проблеми с производителността и скалирането

### Проблем: Висока латентност на отговорите

**Симптоми:**
- Време за отговор > 30 секунди
- Грешки за изтичане на времето
- Лош потребителски опит

**Решения:**

1. **Внедрете изчакване при заявки:**
```python
# Конфигурирайте подходящи таймаути
import httpx

client = httpx.AsyncClient(
    timeout=httpx.Timeout(
        connect=5.0,
        read=30.0,
        write=10.0,
        pool=10.0
    )
)
```

2. **Добавете кеширане на отговорите:**
```python
# Redis кеш за отговори
import redis.asyncio as redis
import json

class ResponseCache:
    def __init__(self, redis_url: str):
        self.redis = redis.from_url(redis_url)
        
    async def get_cached_response(self, query_hash: str) -> str | None:
        """Get cached response if available."""
        cached = await self.redis.get(f"ai_response:{query_hash}")
        return cached.decode() if cached else None
        
    async def cache_response(self, query_hash: str, response: str, ttl: int = 3600):
        """Cache AI response with TTL."""
        await self.redis.setex(f"ai_response:{query_hash}", ttl, response)
```

3. **Конфигурирайте авто-скалиране:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      scale: {
        minReplicas: 2
        maxReplicas: 20
        rules: [
          {
            name: 'http-requests'
            http: {
              metadata: {
                concurrentRequests: '5'  // Scale aggressively for AI workloads
              }
            }
          }
          {
            name: 'cpu-utilization'
            custom: {
              type: 'cpu'
              metadata: {
                type: 'Utilization'
                value: '60'  // Lower threshold for AI apps
              }
            }
          }
        ]
      }
    }
  }
}
```

### Проблем: Изчерпване на паметта

**Симптоми:**
```
Error: Container killed due to memory limit exceeded
```

**Решения:**

1. **Увеличете паметта:**
```bicep
resource containerApp 'Microsoft.App/containerApps@2024-03-01' = {
  properties: {
    template: {
      containers: [
        {
          name: 'main'
          resources: {
            cpu: json('1.0')
            memory: '2Gi'  // Increase for AI workloads
          }
        }
      ]
    }
  }
}
```

2. **Оптимизирайте използването на памет:**
```python
# Ефективно управление на модела с памет
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Проверете използването на паметта преди обработка
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Принудително събиране на боклук
            
        result = await self._process_ai_request(request)
        
        # Изчистване след обработка
        gc.collect()
        return result
```

## Управление на разходи и квоти

### Проблем: Неочаквано високи разходи

**Симптоми:**
- Сметка в Azure по-висока от очакваното
- Използване на токени над прогнозите
- Активирани бюджетни предупреждения

**Решения:**

1. **Внедрете контрол на разходите:**
```python
# Проследяване на използването на токени
class TokenTracker:
    def __init__(self, monthly_limit: int = 100000):
        self.monthly_limit = monthly_limit
        self.current_usage = 0
        
    async def track_usage(self, prompt_tokens: int, completion_tokens: int):
        """Track token usage with limits."""
        total_tokens = prompt_tokens + completion_tokens
        self.current_usage += total_tokens
        
        if self.current_usage > self.monthly_limit:
            raise Exception("Monthly token limit exceeded")
            
        return total_tokens
```

2. **Настройте предупреждения за разходи:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500  // $500 monthly limit
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

3. **Оптимизирайте избора на модел:**
```python
# Избор на модел с оглед на разходите
MODEL_COST_TIERS = {
  'gpt-4.1-mini': 'low',
  'gpt-4.1': 'high'
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    else:
        return 'gpt-4.1'
```

## Инструменти и техники за дебъгване

### Команди за дебъгване с AZD

```bash
# Активиране на подробен запис
azd up --debug

# Проверка на статуса на внедряване
azd show

# Преглед на логовете на приложението (отваря таблото за мониторинг)
azd monitor --logs

# Преглед на живи метрики
azd monitor --live

# Проверка на променливите на средата
azd env get-values
```

### Команди за диагностика с AZD AI разширение

Ако сте внедрили агенти чрез `azd ai agent init`, следните допълнителни инструменти са налични:

```bash
# Уверете се, че разширението за агенти е инсталирано
azd extension install azure.ai.agents

# Преинциализирайте или обновете агент от манифест
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Използвайте MCP сървъра, за да позволите на AI инструментите да запитват състоянието на проекта
azd mcp start

# Генерирайте инфраструктурни файлове за преглед и одит
azd infra generate
```

> **Съвет:** Използвайте `azd infra generate`, за да запишете IaC на диск, за да може да инспектирате точно кои ресурси са били създадени. Това е безценно при отстраняване на проблеми с конфигурацията на ресурсите. Вижте пълното описание в [AZD AI CLI справочник](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Отстраняване на проблеми с приложение

1. **Структурирано логване:**
```python
import logging
import json

# Конфигурирайте структурирано логване за AI приложения
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def log_ai_request(model: str, tokens: int, latency: float, success: bool):
    """Log AI request details."""
    logger.info(json.dumps({
        'event': 'ai_request',
        'model': model,
        'tokens': tokens,
        'latency_ms': latency,
        'success': success
    }))
```

2. **Крайни точки за проверка на здравето:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Проверка на връзката с OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Проверка на Search услугата
    try:
        search_client = SearchIndexClient(
            endpoint=AZURE_SEARCH_ENDPOINT,
            credential=DefaultAzureCredential()
        )
        indexes = await search_client.list_index_names()
        checks['search'] = {'status': 'healthy', 'indexes': list(indexes)}
    except Exception as e:
        checks['search'] = {'status': 'unhealthy', 'error': str(e)}
    
    return checks
```

3. **Мониторинг на производителността:**
```python
import time
from functools import wraps

def monitor_performance(func):
    """Decorator to monitor function performance."""
    @wraps(func)
    async def wrapper(*args, **kwargs):
        start_time = time.time()
        try:
            result = await func(*args, **kwargs)
            success = True
        except Exception as e:
            result = None
            success = False
            raise
        finally:
            end_time = time.time()
            latency = (end_time - start_time) * 1000
            
            logger.info(json.dumps({
                'function': func.__name__,
                'latency_ms': latency,
                'success': success
            }))
        
        return result
    return wrapper
```

## Често срещани кодове за грешки и решения

| Код на грешка | Описание | Решение |
|--------------|----------|----------|
| 401 | Неоторизиран | Проверете API ключовете и конфигурацията на управляваната идентичност |
| 403 | Забранено | Потвърдете назначените роли в RBAC |
| 429 | Ограничение на скоростта | Внедрете логика за повторен опит с експоненциално увеличаване на закъснението |
| 500 | Вътрешна сървърна грешка | Проверете състоянието и логовете на внедрения модел |
| 503 | Услугата не е налична | Проверете здравословното състояние на услугата и регионалната наличност |

## Следващи стъпки

1. **Прегледайте [Ръководството за внедряване на AI модели](../chapter-02-ai-development/ai-model-deployment.md)** за добри практики при внедряване
2. **Завършете [Практики за AI продукция](../chapter-08-production/production-ai-practices.md)** за готови за предприятия решения
3. **Присъединете се към [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** за общностна подкрепа
4. **Подайте проблеми** в [AZD GitHub репозиторито](https://github.com/Azure/azure-dev) за специфични проблеми с AZD

## Ресурси

- [Отстраняване на проблеми с Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Отстраняване на проблеми с Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Отстраняване на проблеми с Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Инсталирайте Azure умения за отстраняване на проблеми във вашия редактор: `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгване
- **⬅️ Предишна**: [Ръководство за дебъгване](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Практики за продукция и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързано**: [Глава 2: Разработка с AI-първи подход](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Референция**: [Отстраняване на проблеми с Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводаческа услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за никакви недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->