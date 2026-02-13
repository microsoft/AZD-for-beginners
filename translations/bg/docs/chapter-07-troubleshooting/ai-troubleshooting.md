# Ръководство за отстраняване на проблеми, специфични за AI

**Навигация на глава:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгване
- **⬅️ Предишна**: [Ръководство за отстраняване на грешки](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Практики за продукция и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързано**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Предишна:** [Практики за продукция на AI](../chapter-08-production/production-ai-practices.md) | **Следваща:** [Основи на AZD](../chapter-01-foundation/azd-basics.md)

Това изчерпателно ръководство за отстраняване на проблеми разглежда често срещани проблеми при внедряване на AI решения с AZD, предоставяйки решения и техники за дебъгване, специфични за услугите на Azure AI.

## Съдържание

- [Проблеми с услугата Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [Проблеми с Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Проблеми при внедряване на Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Грешки за удостоверяване и разрешения](../../../../docs/chapter-07-troubleshooting)
- [Грешки при внедряване на модел](../../../../docs/chapter-07-troubleshooting)
- [Проблеми с производителността и мащабирането](../../../../docs/chapter-07-troubleshooting)
- [Управление на разходите и квотите](../../../../docs/chapter-07-troubleshooting)
- [Инструменти и техники за дебъгване](../../../../docs/chapter-07-troubleshooting)

## Проблеми с услугата Azure OpenAI

### Проблем: Услугата OpenAI не е налична в региона

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причини:**
- Azure OpenAI не е наличен в избрания регион
- Квотата е изчерпана в предпочитаните региони
- Регионални ограничения на капацитета

**Решения:**

1. **Проверете наличността в региона:**
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

### Проблем: Квотата за внедряване на модела е превишена

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Решения:**

1. **Проверете текущата квота:**
```bash
# Проверете използването на квотата
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
      name: 'gpt-4o-mini'
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
# Използвайте най-новата поддържана версия
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Проверете съвместимостта на версията на API:**
```bash
# Изброяване на поддържаните версии на API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Проблеми с Azure AI Search

### Проблем: Ценовият план на услугата за търсене е недостатъчен

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

2. **Деактивирайте семантичното търсене (в развитие):**
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

### Проблем: Грешки при създаване на индекс

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Решения:**

1. **Проверете ключовете на услугата за търсене:**
```bash
# Вземете администраторски ключ за услугата за търсене
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверете схемата на индекса:**
```python
# Проверка на схемата на индекса
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

## Проблеми при внедряване на Container Apps

### Проблем: Грешки при изграждане на контейнер

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

2. **Валидирайте зависимостите:**
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

3. **Добавете проверка за здраве:**
```python
# main.py - Добавяне на крайна точка за проверка на състоянието
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблем: Грешки при стартиране на Container App

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Решения:**

1. **Увеличете таймаута за стартиране:**
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
# Лениво зареждане на модели, за да се намали времето за стартиране
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

## Грешки за удостоверяване и разрешения

### Проблем: Отказан достъп на управлявана идентичност

**Симптоми:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Решения:**

1. **Проверете присвояванията на роли:**
```bash
# Проверете текущите назначения на роли
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Присвоете необходимите роли:**
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
# Тестване на удостоверяване чрез управлявана идентичност
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

## Грешки при внедряване на модел

### Проблем: Версията на модела не е налична

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

2. **Използвайте резервни модели:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4o-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-35-turbo'
  version: '0125'
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

3. **Валидирайте модела преди внедряване:**
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

## Проблеми с производителността и мащабирането

### Проблем: Висока латентност на отговорите

**Симптоми:**
- Време за отговор > 30 секунди
- Грешки за изтичане на времето
- Лошо потребителско изживяване

**Решения:**

1. **Въведете таймаути за заявки:**
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

2. **Добавете кеширане на отговори:**
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

3. **Конфигурирайте автоматично мащабиране:**
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

### Проблем: Грешки за изчерпана памет

**Симптоми:**
```
Error: Container killed due to memory limit exceeded
```

**Решения:**

1. **Увеличете разпределението на паметта:**
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

2. **Оптимизирайте използването на паметта:**
```python
# Ефективно използване на паметта при работа с модела
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
            gc.collect()  # Принудително стартиране на събирача на боклука
            
        result = await self._process_ai_request(request)
        
        # Почистете след обработка
        gc.collect()
        return result
```

## Управление на разходите и квотите

### Проблем: Неочаквано високи разходи

**Симптоми:**
- Сметката в Azure е по-висока от очакваното
- Използването на токени превишава оценките
- Задействани известия за бюджета

**Решения:**

1. **Въведете контрол на разходите:**
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

2. **Настройте известия за разходи:**
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
# Избор на модел, съобразен с разходите
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # на 1K токена
    'gpt-4': 0.03,          # на 1K токена
    'gpt-35-turbo': 0.0015  # на 1K токена
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4o-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4'
```

## Инструменти и техники за дебъгване

### Команди за отстраняване на грешки в AZD

```bash
# Активирай подробен запис на логове
azd up --debug

# Провери състоянието на разгръщането
azd show

# Прегледай логовете на приложението (отваря таблото за мониторинг)
azd monitor --logs

# Прегледай метриките в реално време
azd monitor --live

# Провери променливите на средата
azd env get-values
```

### Отстраняване на грешки в приложението

1. **Структурирано регистриране:**
```python
import logging
import json

# Конфигурирайте структурирано логване за приложения за изкуствен интелект
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

2. **Ендпойнти за проверка на здравето:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Проверете връзката с OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Проверете услугата за търсене
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

## Чести кодове за грешки и решения

| Код на грешка | Описание | Решение |
|------------|-------------|----------|
| 401 | Неоторизиран | Проверете API ключовете и конфигурацията на управляваната идентичност |
| 403 | Забранено | Проверете присвояванията на RBAC роли |
| 429 | Ограничен по честота | Реализирайте логика за повторни опити с експоненциално забавяне |
| 500 | Вътрешна грешка на сървъра | Проверете състоянието на внедряването на модела и логовете |
| 503 | Услугата не е налична | Проверете здравето на услугата и регионалната наличност |

## Следващи стъпки

1. **Прегледайте [Ръководство за внедряване на AI модели](../chapter-02-ai-development/ai-model-deployment.md)** за добри практики при внедряване
2. **Завършете [Практики за продукция на AI](../chapter-08-production/production-ai-practices.md)** за решения, готови за предприятия
3. **Присъединете се към [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** за помощ от общността
4. **Подайте проблеми** в [репозитория на AZD в GitHub](https://github.com/Azure/azure-dev) за проблеми, специфични за AZD

## Ресурси

- [Отстраняване на проблеми с Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Отстраняване на проблеми с Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Отстраняване на проблеми с Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Навигация на глава:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгване
- **⬅️ Предишна**: [Ръководство за отстраняване на грешки](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Практики за продукция и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързано**: [Глава 2: Разработка, ориентирана към AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Отстраняване на проблеми с Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Отказ от отговорност:
Този документ е преведен с помощта на AI преводаческа услуга Co-op Translator (https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, имайте предвид, че автоматичните преводи могат да съдържат грешки или неточности. Оригиналният документ на оригиналния му език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален превод, извършен от човек. Не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->