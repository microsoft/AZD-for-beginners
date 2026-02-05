# Посібник з усунення несправностей, пов'язаних з AI

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Усунення несправностей та налагодження
- **⬅️ Попередній**: [Посібник з налагодження](debugging.md)
- **➡️ Наступний розділ**: [Розділ 8: Виробничі та корпоративні шаблони](../microsoft-foundry/production-ai-practices.md)
- **🤖 Пов’язане**: [Розділ 2: Розробка з пріоритетом AI](../microsoft-foundry/microsoft-foundry-integration.md)

**Попередній:** [Практики виробничого AI](../microsoft-foundry/production-ai-practices.md) | **Наступний:** [Початок роботи з AZD](../getting-started/README.md)

Цей детальний посібник з усунення несправностей охоплює поширені проблеми при розгортанні AI-рішень за допомогою AZD, пропонуючи рішення та техніки налагодження, специфічні для сервісів Azure AI.

## Зміст

- [Проблеми з Azure OpenAI Service](../../../../docs/troubleshooting)
- [Проблеми з Azure AI Search](../../../../docs/troubleshooting)
- [Проблеми з розгортанням Container Apps](../../../../docs/troubleshooting)
- [Помилки автентифікації та дозволів](../../../../docs/troubleshooting)
- [Збої при розгортанні моделей](../../../../docs/troubleshooting)
- [Проблеми продуктивності та масштабування](../../../../docs/troubleshooting)
- [Управління витратами та квотами](../../../../docs/troubleshooting)
- [Інструменти та техніки налагодження](../../../../docs/troubleshooting)

## Проблеми з Azure OpenAI Service

### Проблема: OpenAI Service недоступний у регіоні

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причини:**
- Azure OpenAI недоступний у вибраному регіоні
- Вичерпана квота у пріоритетних регіонах
- Обмеження регіональної потужності

**Рішення:**

1. **Перевірте доступність регіону:**
```bash
# Список доступних регіонів для OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Оновіть конфігурацію AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Використовуйте альтернативні регіони:**
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

### Проблема: Перевищена квота на розгортання моделі

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Рішення:**

1. **Перевірте поточну квоту:**
```bash
# Перевірка використання квоти
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Запитайте збільшення квоти:**
```bash
# Надіслати запит на збільшення квоти
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Оптимізуйте використання ресурсів моделі:**
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

### Проблема: Неправильна версія API

**Симптоми:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Рішення:**

1. **Використовуйте підтримувану версію API:**
```python
# Використовуйте останню підтримувану версію
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Перевірте сумісність версії API:**
```bash
# Перелічити підтримувані версії API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Проблеми з Azure AI Search

### Проблема: Недостатній рівень цінового плану Search Service

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Рішення:**

1. **Оновіть ціновий план:**
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

2. **Вимкніть семантичний пошук (для розробки):**
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

### Проблема: Збої при створенні індексу

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Рішення:**

1. **Перевірте ключі Search Service:**
```bash
# Отримати ключ адміністратора служби пошуку
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Перевірте схему індексу:**
```python
# Перевірити схему індексу
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

3. **Використовуйте керовану ідентичність:**
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

## Проблеми з розгортанням Container Apps

### Проблема: Збої при створенні контейнера

**Симптоми:**
```
Error: Failed to build container image
```

**Рішення:**

1. **Перевірте синтаксис Dockerfile:**
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

2. **Перевірте залежності:**
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

3. **Додайте перевірку стану:**
```python
# main.py - Додати кінцеву точку перевірки стану
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблема: Збої при запуску Container App

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Рішення:**

1. **Збільшіть час очікування запуску:**
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

2. **Оптимізуйте завантаження моделі:**
```python
# Ліниве завантаження моделей для зменшення часу запуску
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
        # Ініціалізуйте AI клієнт тут
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Запуск
    app.state.model_manager = ModelManager()
    yield
    # Завершення роботи
    pass

app = FastAPI(lifespan=lifespan)
```

## Помилки автентифікації та дозволів

### Проблема: Відмовлено в дозволі керованій ідентичності

**Симптоми:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Рішення:**

1. **Перевірте призначення ролей:**
```bash
# Перевірте поточні призначення ролей
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Призначте необхідні ролі:**
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

3. **Перевірте автентифікацію:**
```python
# Перевірка автентифікації керованої ідентичності
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

### Проблема: Відмовлено в доступі до Key Vault

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Рішення:**

1. **Надайте дозволи на Key Vault:**
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

2. **Використовуйте RBAC замість політик доступу:**
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

## Збої при розгортанні моделей

### Проблема: Версія моделі недоступна

**Симптоми:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Рішення:**

1. **Перевірте доступні моделі:**
```bash
# Перелік доступних моделей
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Використовуйте резервні моделі:**
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

3. **Перевірте модель перед розгортанням:**
```python
# Перевірка моделі перед розгортанням
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

## Проблеми продуктивності та масштабування

### Проблема: Висока затримка відповідей

**Симптоми:**
- Час відповіді > 30 секунд
- Помилки тайм-ауту
- Низька якість користувацького досвіду

**Рішення:**

1. **Реалізуйте тайм-аут запитів:**
```python
# Налаштуйте відповідні тайм-аути
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

2. **Додайте кешування відповідей:**
```python
# Кеш Redis для відповідей
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

3. **Налаштуйте автоматичне масштабування:**
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

### Проблема: Помилки через недостатню пам’ять

**Симптоми:**
```
Error: Container killed due to memory limit exceeded
```

**Рішення:**

1. **Збільшіть виділення пам’яті:**
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

2. **Оптимізуйте використання пам’яті:**
```python
# Ефективне використання пам'яті для обробки моделі
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Перевірте використання пам'яті перед обробкою
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Примусове збирання сміття
            
        result = await self._process_ai_request(request)
        
        # Очистіть після обробки
        gc.collect()
        return result
```

## Управління витратами та квотами

### Проблема: Неочікувано високі витрати

**Симптоми:**
- Рахунок Azure вищий за очікуваний
- Використання токенів перевищує оцінки
- Спрацьовують бюджетні сповіщення

**Рішення:**

1. **Реалізуйте контроль витрат:**
```python
# Відстеження використання токенів
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

2. **Налаштуйте сповіщення про витрати:**
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

3. **Оптимізуйте вибір моделі:**
```python
# Вибір моделі з урахуванням вартості
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # за 1K токенів
    'gpt-4': 0.03,          # за 1K токенів
    'gpt-35-turbo': 0.0015  # за 1K токенів
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

## Інструменти та техніки налагодження

### Команди налагодження AZD

```bash
# Увімкнути детальне ведення журналу
azd up --debug

# Перевірити статус розгортання
azd show

# Переглянути журнали розгортання
azd logs --follow

# Перевірити змінні середовища
azd env get-values
```

### Налагодження додатків

1. **Структуроване логування:**
```python
import logging
import json

# Налаштуйте структуроване ведення журналу для AI-додатків
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

2. **Точки перевірки стану:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Перевірте підключення до OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Перевірте службу пошуку
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

3. **Моніторинг продуктивності:**
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

## Поширені коди помилок та рішення

| Код помилки | Опис | Рішення |
|-------------|------|---------|
| 401 | Неавторизовано | Перевірте API-ключі та конфігурацію керованої ідентичності |
| 403 | Заборонено | Перевірте призначення ролей RBAC |
| 429 | Перевищено ліміт запитів | Реалізуйте логіку повторних спроб із експоненціальним збільшенням інтервалу |
| 500 | Внутрішня помилка сервера | Перевірте статус розгортання моделі та журнали |
| 503 | Сервіс недоступний | Перевірте стан сервісу та доступність у регіоні |

## Наступні кроки

1. **Перегляньте [Посібник з розгортання моделей AI](ai-model-deployment.md)** для найкращих практик розгортання
2. **Завершіть [Практики виробничого AI](production-ai-practices.md)** для рішень, готових до корпоративного використання
3. **Приєднуйтесь до [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** для підтримки спільноти
4. **Надсилайте проблеми** до [репозиторію AZD на GitHub](https://github.com/Azure/azure-dev) для специфічних проблем AZD

## Ресурси

- [Усунення несправностей Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Усунення несправностей Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Усунення несправностей Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Усунення несправностей та налагодження
- **⬅️ Попередній**: [Посібник з налагодження](debugging.md)
- **➡️ Наступний розділ**: [Розділ 8: Виробничі та корпоративні шаблони](../microsoft-foundry/production-ai-practices.md)
- [Усунення несправностей Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:  
Цей документ був перекладений за допомогою сервісу автоматичного перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ на його рідній мові слід вважати авторитетним джерелом. Для критичної інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникають внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->