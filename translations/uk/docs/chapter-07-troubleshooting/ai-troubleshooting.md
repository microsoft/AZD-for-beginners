# Посібник із усунення несправностей, специфічних для ШІ

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Усунення несправностей і налагодження
- **⬅️ Попередній**: [Посібник з налагодження](debugging.md)
- **➡️ Наступний розділ**: [Розділ 8: Виробничі та корпоративні шаблони](../chapter-08-production/production-ai-practices.md)
- **🤖 Пов’язано з**: [Розділ 2: Розробка з орієнтацією на ШІ](../chapter-02-ai-development/microsoft-foundry-integration.md)

Цей комплексний посібник з усунення несправностей охоплює поширені проблеми при розгортанні рішень ШІ з AZD, пропонуючи рішення та методи налагодження, специфічні для сервісів Azure AI.

> **Обсяг:** Команди використовують приклади імен ресурсів; замініть їх і виберіть правильну підписку. Блоки Bicep — це фрагменти для злиття в існуючий шаблон, а не автономні розгортання. Фрагменти Python потребують зазначених SDK і конфігурації додатка. Для цього огляду жодне активне розгортання в Azure не виконувалося.

## Зміст

- [Проблеми сервісу моделей Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [Проблеми з Azure AI Search](#azure-ai-search-problems)
- [Проблеми з розгортанням Container Apps](#container-apps-deployment-issues)
- [Помилки автентифікації та дозволів](#authentication-and-permission-errors)
- [Збої розгортання моделей](#model-deployment-failures)
- [Проблеми з продуктивністю та масштабуванням](#performance-and-scaling-issues)
- [Управління витратами та квотами](#cost-and-quota-management)
- [Інструменти та методи налагодження](#debugging-tools-and-techniques)

## Проблеми сервісу моделей Microsoft Foundry

### Проблема: Сервіс OpenAI недоступний у регіоні

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причини:**
- Моделі Microsoft Foundry недоступні в обраному регіоні
- Вичерпана квота в пріоритетних регіонах
- Регіональні обмеження пропускної здатності

**Рішення:**

1. **Перевірте доступність регіону:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Оновіть конфігурацію AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Використовуйте альтернативні регіони:**
```bicep
// infra/main.bicep - Explicit location selection, NOT automatic fallback
@allowed([
  'eastus2'
  'francecentral'
  'canadaeast'
  'swedencentral'
])
param openAiLocation string = 'eastus2'
```

### Проблема: Перевищена квота розгортання моделей

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Рішення:**

1. **Перевірте поточну квоту:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Запросіть збільшення квоти:**
Використовуйте робочий процес управління квотами в порталі Foundry для відповідної підписки, регіону, моделі та типу розгортання. Дивіться [офіційну інструкцію щодо квот](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Запит на квоту ВМ не збільшує квоту моделі.

3. **Оптимізуйте ємність моделі:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi // Existing account resource declared in your template
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'GlobalStandard' // Verify this model/version/type in the target region
    capacity: 1  // Capacity units are model/deployment-type specific
  }
}
```

### Проблема: Некоректна версія API

**Симптоми:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Рішення:**

1. **Використовуйте підтримувану версію API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Перевірте сумісність версій API:**
Перегляньте [довідку про життєвий цикл API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Версії API провайдера ресурсів ARM **не** включають версії inference/data-plane API. Нові клієнти v1 використовують `/openai/v1/` без датованого `api-version`; не змішуйте дві конфігурації клієнтів.

## Проблеми Azure AI Search

### Проблема: Ціновий рівень сервісу пошуку недостатній

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Рішення:**

1. **Використовуйте підтримуваний ціновий рівень:**

Семантичний ранжирувальник вимагає Basic або вище. Перехід з Free/Basic на інший рівень може вимагати створення нового сервісу пошуку і відновлення індексів; редагування SKU не гарантує оновлення на місці.
```bicep
// infra/main.bicep - Use Basic tier
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
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

### Проблема: Помилки створення індексів

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Рішення:**

1. **Перевірте ключі сервісу пошуку:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Перевірте схему індексу:**
```python
# Validate index schema
from azure.search.documents.indexes import SearchIndexClient
from azure.search.documents.indexes.models import SearchIndex

def validate_index_schema(index_definition):
    """Validate index schema before creation."""
    # These are this application's requirements, not universal Search fields.
    required_fields = ['id', 'content']
    field_names = [field.name for field in index_definition.fields]
    
    for required in required_fields:
        if required not in field_names:
            raise ValueError(f"Missing required field: {required}")
```

3. **Використовуйте керовану ідентичність:**
```bicep
// Grant index-definition management permissions to the managed identity.
// Search Index Data Contributor manages documents, not index definitions.
resource searchContributor 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: searchService
  name: guid(searchService.id, containerApp.id, 'Search Service Contributor')
  properties: {
    principalId: containerApp.identity.principalId
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '7ca78c08-252a-4471-8644-bb5ff32d4ba0')
    principalType: 'ServicePrincipal'
  }
}
```

## Проблеми розгортання Container Apps

### Проблема: Помилки збірки контейнерів

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
# Dependency names for these snippets. Resolve supported versions in your
# project's environment, test together, then commit a lock/pinned requirements file.
fastapi
uvicorn
openai
azure-identity
azure-keyvault-secrets
azure-search-documents
azure-cosmos
```

3. **Додайте перевірку стану (Health Check):**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблема: Помилки запуску Container App

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
              type: 'Startup'
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
# Lazy load models to reduce startup time
# Illustrative skeleton: implement _initialize_client and synchronize concurrent
# initialization before using this pattern in an application.
import asyncio
from contextlib import asynccontextmanager
from fastapi import FastAPI

class ModelManager:
    def __init__(self):
        self._client = None
        
    async def get_client(self):
        if self._client is None:
            self._client = await self._initialize_client()
        return self._client
        
    async def _initialize_client(self):
        # Initialize AI client here
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Startup
    app.state.model_manager = ModelManager()
    yield
    # Shutdown
    pass

app = FastAPI(lifespan=lifespan)
```

## Помилки автентифікації та дозволів

### Проблема: Відмова в доступі Managed Identity

**Симптоми:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Рішення:**

1. **Перевірте призначення ролей:**
```bash
# Check current role assignments
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
# Test managed identity authentication
from azure.identity import DefaultAzureCredential
from azure.core.exceptions import ClientAuthenticationError

def test_authentication():
    try:
        with DefaultAzureCredential() as credential:
            token = credential.get_token("https://cognitiveservices.azure.com/.default")
            print(f"Token acquired; expires at Unix time {token.expires_on}")
    except ClientAuthenticationError as e:
        print(f"Authentication failed: {e}")

test_authentication()
```

Отримання токена підтверджує автентифікацію, а не дозвіл на виклик моделі. Перевірте намічену операцію окремо. Локально `DefaultAzureCredential` може використовувати облікові дані розробника; в Azure переконайтеся, що вибрано потрібну керовану ідентичність.

### Проблема: Відмова в доступі до Key Vault

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Рішення:**

1. **Надайте дозволи для Key Vault:**

Використовуйте наступний фрагмент політики доступу лише для сховища з `enableRbacAuthorization: false`. Для сховища з увімкненим RBAC використовуйте варіант 2; додавання політики доступу не дає доступу до даних у режимі RBAC.
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

Сховище має підтримувати `enableRbacAuthorization: true`; змінити модель дозволів можна лише з планованою міграцією існуючого доступу.
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

## Збої розгортання моделей

### Проблема: Версія моделі недоступна

**Симптоми:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Рішення:**

1. **Перевірте доступні моделі:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Явно оберіть доступну модель:**
```bicep
// Example model selection; verify version and deployment type in the catalog.
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2025-04-14'
}

// Bicep does not catch provisioning failures and retry a fallback model.
resource primaryDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'chat-model'
  properties: {
    model: {
      format: 'OpenAI'
      name: primaryModel.name
      version: primaryModel.version
    }
  }
  sku: {
    name: 'GlobalStandard'
    capacity: 10
  }
}
```

3. **Перевірте модель перед розгортанням:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Проблеми з продуктивністю та масштабуванням

### Проблема: Висока затримка відповідей

**Симптоми:**
- Час відповіді > 30 секунд
- Помилки тайм-ауту
- Поганий користувацький досвід

**Рішення:**

1. **Реалізуйте тайм-аути запитів:**
```python
# Configure proper timeouts
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
# Redis cache for responses
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

### Проблема: Помилки через брак пам’яті

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
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def _process_ai_request(self, request):
        raise NotImplementedError("Supply the application's AI operation")

    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Check memory usage before processing
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Force garbage collection
            
        result = await self._process_ai_request(request)
        
        # Clean up after processing
        gc.collect()
        return result
```

## Управління витратами та квотами

### Проблема: Несподівано високі витрати

**Симптоми:**
- Рахунок за Azure більший за очікуваний
- Використання токенів перевищує оцінки
- Спрацьовують оповіщення бюджету

**Рішення:**

1. **Впровадьте контроль витрат:**
```python
# Token usage tracking
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

Це лічильник у пам’яті є ілюстративним, а не контролем місячних витрат: він скидається при рестарті, не ділиться між репліками та перевіряє використання тільки після виклику. Реальна межа потребує надійного обліку, безпечних резервувань до запитів і політики скидання що місяця. Метрики пам’яті контейнера мають враховувати обмеження cgroup; `psutil.virtual_memory()` не є надійною мірою обмеження контейнера, а збірка сміття не накладає ліміт пам’яті.

2. **Налаштуйте оповіщення про витрати:**
```bicep
resource budgetAlert 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-workload-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate // Parameter: first day of a supported budget period
      endDate: budgetEndDate     // Parameter: a future date
    }
    timeGrain: 'Monthly'
    amount: 500  // Notification threshold in the subscription's billing currency
    category: 'Cost'
    notifications: {
      Actual_GreaterThan_80_Percent: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        thresholdType: 'Actual'
        contactEmails: ['admin@company.com']
        contactRoles: ['Owner']
      }
    }
  }
}
```

Оголосіть `budgetStartDate` і `budgetEndDate` у вашому шаблоні. Бюджети повідомляють, не зупиняють ресурси і не накладають жорстких лімітів витрат.

3. **Оптимізуйте вибір моделі:**
```python
# Cost-aware model selection
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

## Інструменти та методи налагодження

### Команди налагодження AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View application logs (opens monitoring dashboard)
azd monitor --logs

# View live metrics
azd monitor --live

# Check environment variables
azd env get-values
```

### Команди розширення AZD AI для діагностики

Якщо ви розгорнули агенти з `azd ai agent init`, доступні додаткові інструменти:

```bash
# Ensure the agents extension is installed
azd extension install azure.ai.agents

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Порада:** Використовуйте `azd infra generate` для запису IaC на диск, щоб можна було точно побачити, які ресурси були створені. Це безцінно при налагодженні проблем із конфігурацією ресурсів. Повний опис дивіться у [довідці по AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

**Діагностика зі збереженням релізу (2026-11-04):** Агенти `1.0.0-beta.23` вимагають `azd >= 1.37.0`; оновіть ядро CLI перед несумісними розширеннями. Цей реліз агентів зберігає попередження RBAC для розробників у вихідних даних розгортання та ідентифікує версію, пов’язану з помилками активації/тайм-аутами. Тайм-аут не означає, що розгортання не вдалося: перевірте версію, яку намагалися застосувати, перед повторною спробою. Також виправлено виклики A2A 0.3, які показували повідомлення життєвого циклу замість завершених відповідей. Ядро `azd 1.37.1` виправляє поширення скасування між розширеннями; `1.37.2` покращує ключові підтвердження розгортання та обробку скасувань.

Якщо команда оцінки з більш раннього навчання лише виводить рекомендації щодо міграції, встановіть `azure.ai.evaluations` (`1.0.0-beta.2` потребує `azd >= 1.33.0`) і використовуйте `azd ai eval init`, `generate` і `run start`. Оптимізаційний `--config` більше не приймає застарілі файли оцінки. Дивіться [міграцію оцінки](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) і [міграцію оптимізації](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Налагодження застосунків

1. **Структуроване логування:**
```python
import logging
import json

# Configure structured logging for AI applications
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

2. **Кінцеві точки перевірки стану:**
```python
# Integration fragment: add to an existing FastAPI app, protect this diagnostic
# endpoint, and configure AZURE_SEARCH_ENDPOINT. This tests Search index-list
# authorization, not Azure OpenAI inference.
import os
from azure.identity.aio import DefaultAzureCredential
from azure.search.documents.indexes.aio import SearchIndexClient
from fastapi import Response

@app.get("/debug/health")
async def detailed_health_check(response: Response):
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check Search service
    try:
        async with DefaultAzureCredential() as credential:
            async with SearchIndexClient(
                endpoint=os.environ['AZURE_SEARCH_ENDPOINT'],
                credential=credential
            ) as search_client:
                # AsyncItemPaged is iterated asynchronously, not awaited as a list.
                async for _ in search_client.list_index_names():
                    break
        checks['search'] = {'status': 'healthy'}
    except Exception:
        response.status_code = 503
        checks['search'] = {'status': 'unhealthy'}
    
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

## Поширені коди помилок і рішення

| Код помилки | Опис | Рішення |
|------------|-------------|----------|
| 401 | Неавторизовано | Перевірте ключі API та налаштування керованої ідентичності |
| 403 | Заборонено | Перевірте призначені ролі RBAC |
| 429 | Обмеження швидкості | Реалізуйте логіку повторних спроб із експоненціальним збільшенням інтервалу |
| 500 | Внутрішня помилка сервера | Перевірте стан розгортання моделі та журнали |
| 503 | Сервіс недоступний | Перевірте стан сервісу та доступність у регіоні |

## Наступні кроки

1. **Перегляньте [Посібник із розгортання моделей ШІ](../chapter-02-ai-development/ai-model-deployment.md)** для кращих практик розгортання
2. **Завершіть [Виробничі практики ШІ](../chapter-08-production/production-ai-practices.md)** для рішень, готових до корпоративного використання
3. **Приєднуйтесь до [Discord спільноти Microsoft Foundry](https://aka.ms/foundry/discord)** для підтримки від спільноти
4. **Надсилайте проблеми** до [репозиторію AZD на GitHub](https://github.com/Azure/azure-dev) для проблем, специфічних для AZD

## Ресурси

- [Усунення несправностей квот і обмежень Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Усунення несправностей Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Усунення несправностей Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Навик агента діагностики Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Встановіть навички усунення несправностей Azure у вашому редакторі: `npx skills add microsoft/github-copilot-for-azure`

---

**Навігація по розділах:**
- **📚 Головна сторінка курсу**: [AZD для початківців](../../README.md)
- **📖 Поточний розділ**: Розділ 7 - Усунення несправностей і налагодження
- **⬅️ Попередній**: [Посібник з налагодження](debugging.md)
- **➡️ Наступний розділ**: [Розділ 8: Виробничі та корпоративні шаблони](../chapter-08-production/production-ai-practices.md)
- **🤖 Пов’язано з**: [Розділ 2: Розробка з орієнтацією на ШІ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Довідка**: [Усунення несправностей Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Відмова від відповідальності**:
Цей документ було перекладено за допомогою сервісу штучного інтелекту для перекладу [Co-op Translator](https://github.com/Azure/co-op-translator). Хоча ми прагнемо до точності, будь ласка, майте на увазі, що автоматичні переклади можуть містити помилки або неточності. Оригінальний документ рідною мовою слід вважати авторитетним джерелом. Для критично важливої інформації рекомендується професійний людський переклад. Ми не несемо відповідальності за будь-які непорозуміння або неправильні тлумачення, що виникли внаслідок використання цього перекладу.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->