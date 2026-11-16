# Руководство по устранению неполадок, специфичных для ИИ

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Устранение неполадок и отладка
- **⬅️ Предыдущая**: [Руководство по отладке](debugging.md)
- **➡️ Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../chapter-08-production/production-ai-practices.md)
- **🤖 Связанные материалы**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

Это исчерпывающее руководство по устранению неполадок рассматривает распространённые проблемы при развертывании решений на базе ИИ с использованием AZD, предоставляя решения и методы отладки, специфичные для сервисов Azure AI.

> **Область применения:** Команды используют примерные имена ресурсов; заменяйте их и выбирайте правильную подписку. Блоки Bicep — это фрагменты для интеграции в существующий шаблон, а не самостоятельные развертывания. Примеры на Python требуют указанных SDK и настройки приложения. Для этого обзора живого развертывания в Azure не выполнялось.

## Содержание

- [Проблемы сервиса Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Проблемы Azure AI Search](#azure-ai-search-problems)
- [Проблемы развертывания Container Apps](#container-apps-deployment-issues)
- [Ошибки аутентификации и разрешений](#authentication-and-permission-errors)
- [Сбой развертывания модели](#model-deployment-failures)
- [Проблемы производительности и масштабирования](#performance-and-scaling-issues)
- [Управление расходами и квотами](#cost-and-quota-management)
- [Инструменты и методы отладки](#debugging-tools-and-techniques)

## Проблемы сервиса Microsoft Foundry Models

### Проблема: Сервис OpenAI недоступен в регионе

**Симптомы:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причины:**
- Сервис Microsoft Foundry Models недоступен в выбранном регионе
- Квота исчерпана в предпочитаемых регионах
- Региональные ограничения по ёмкости

**Решения:**

1. **Проверьте доступность региона:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Обновите конфигурацию AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Используйте альтернативные регионы:**
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

### Проблема: Превышена квота на развертывание модели

**Симптомы:**
```
Error: Deployment failed due to insufficient quota
```

**Решения:**

1. **Проверьте текущую квоту:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Запросите увеличение квоты:**
Используйте рабочий процесс управления квотами в портале Foundry для соответствующей подписки, региона, модели и типа развертывания. См. [официальное руководство по квотам](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Запрос квоты на виртуальную машину не увеличивает квоту модели.

3. **Оптимизируйте ёмкость модели:**
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

### Проблема: Неверная версия API

**Симптомы:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Решения:**

1. **Используйте поддерживаемую версию API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Проверьте совместимость версии API:**
Проверьте [справочник по жизненному циклу API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Версии API поставщиков ресурсов ARM **не** содержат версии API inference/data-plane. Новые клиенты v1 используют `/openai/v1/` без датированной `api-version`; не смешивайте обе конфигурации клиента.

## Проблемы Azure AI Search

### Проблема: Недостаточный уровень тарифа в поисковом сервисе

**Симптомы:**
```
Error: Semantic search requires Basic tier or higher
```

**Решения:**

1. **Используйте поддерживаемый тарифный уровень:**

Семантический ранжировщик требует уровня Basic или выше. Переход с Free/Basic на другой уровень может потребовать создания нового поискового сервиса и пересоздания индексов; редактирование SKU не гарантирует обновление без прерывания.
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

2. **Отключите семантический поиск (для разработки):**
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

### Проблема: Сбой создания индекса

**Симптомы:**
```
Error: Cannot create index, insufficient permissions
```

**Решения:**

1. **Проверьте ключи поискового сервиса:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверьте схему индекса:**
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

3. **Используйте управляемую идентичность:**
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

## Проблемы развертывания Container Apps

### Проблема: Ошибки сборки контейнера

**Симптомы:**
```
Error: Failed to build container image
```

**Решения:**

1. **Проверьте синтаксис Dockerfile:**
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

2. **Проверьте зависимости:**
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

3. **Добавьте проверку состояния (Health Check):**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблема: Сбой запуска контейнерного приложения

**Симптомы:**
```
Error: Container failed to start within timeout period
```

**Решения:**

1. **Увеличьте тайм-аут запуска:**
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

2. **Оптимизируйте загрузку модели:**
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

## Ошибки аутентификации и разрешений

### Проблема: Отказ в разрешении управляемой идентичности

**Симптомы:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Решения:**

1. **Проверьте назначение ролей:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Назначьте необходимые роли:**
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

3. **Проверьте аутентификацию:**
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

Получение токена подтверждает аутентификацию, но не разрешение на вызов модели. Тестируйте предполагаемую операцию отдельно. Локально `DefaultAzureCredential` может использовать учетные данные разработчика; в Azure убедитесь, что выбрана правильная управляемая идентичность.

### Проблема: Отказ доступа к Key Vault

**Симптомы:**
```
Error: The user, group or application does not have secrets get permission
```

**Решения:**

1. **Предоставьте разрешения для Key Vault:**

Используйте следующий фрагмент политики доступа только для хранилища с `enableRbacAuthorization: false`. Для хранилища с RBAC используйте вариант 2; добавление политики доступа не предоставляет доступ к data-plane в режиме RBAC.
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

2. **Используйте RBAC вместо политик доступа:**

Хранилище должно иметь `enableRbacAuthorization: true`; смена модели разрешений требует плановой миграции существующего доступа.
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

## Сбой развертывания модели

### Проблема: Версия модели недоступна

**Симптомы:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Решения:**

1. **Проверьте доступные модели:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Явно выберите доступную модель:**
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

3. **Проверьте модель перед развертыванием:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Проблемы производительности и масштабирования

### Проблема: Высокая задержка ответов

**Симптомы:**
- Время отклика > 30 секунд
- Ошибки тайм-аута
- Плохое восприятие пользователем

**Решения:**

1. **Реализуйте тайм-ауты запросов:**
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

2. **Добавьте кеширование ответов:**
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

3. **Настройте автоскейлинг:**
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

### Проблема: Ошибки Out of Memory

**Симптомы:**
```
Error: Container killed due to memory limit exceeded
```

**Решения:**

1. **Увеличьте выделение памяти:**
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

2. **Оптимизируйте использование памяти:**
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

## Управление расходами и квотами

### Проблема: Неожиданно высокие расходы

**Симптомы:**
- Счёт Azure выше ожидаемого
- Использование токенов превышает оценки
- Сработали оповещения по бюджету

**Решения:**

1. **Внедрите контроль расходов:**
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

Этот счётчик в памяти — иллюстративный, а не контроль ежемесячных расходов: он сбрасывается при перезапуске, не разделяется между репликами и проверяет расход только после вызова. Реальный лимит требует надёжного учёта, безопасного бронирования конкурентных запросов и политики сброса раз в месяц. Метрики памяти контейнера также должны учитывать ограничения cgroup; `psutil.virtual_memory()` не является надёжным измерением лимита контейнера, а сборка мусора не накладывает ограничение памяти.

2. **Настройте оповещения о расходах:**
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

Объявите `budgetStartDate` и `budgetEndDate` в вашем шаблоне. Бюджеты уведомляют; они не останавливают ресурсы и не накладывают жёсткий лимит расходов.

3. **Оптимизируйте выбор модели:**
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

## Инструменты и методы отладки

### Команды отладки AZD

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

### Команды расширения AZD AI для диагностики

Если вы развернули агентов с помощью `azd ai agent init`, доступны следующие дополнительные инструменты:

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

> **Совет:** Используйте `azd infra generate` для записи инфраструктуры как кода на диск, чтобы точно проверить, какие ресурсы были созданы. Это незаменимо при отладке проблем с конфигурацией ресурсов. См. [справочник AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) для подробностей.

**Диагностика с учётом версий (2026-11-04):** Агент `1.0.0-beta.23` требует `azd >= 1.37.0`; обновите основной CLI перед несовместимыми расширениями. Эта версия агента сохраняет предупреждения RBAC для разработчиков в итоговом выводе развертывания и идентифицирует версию, вызвавшую сбои и тайм-ауты активации. Тайм-аут не означает провал развертывания: изучите версию попытки перед повтором. Также исправлена проблема, когда вызовы A2A 0.3 показывали сообщения жизненного цикла вместо завершённых ответов. Ядро `azd 1.37.1` исправляет распространение отмены между расширениями; `1.37.2` улучшает критические подтверждения развертывания и обработку отмен.

Если команда оценки из старого учебника выводит только рекомендации по миграции, установите `azure.ai.evaluations` (`1.0.0-beta.2` требует `azd >= 1.33.0`) и используйте `azd ai eval init`, `generate` и `run start`. Оптимизация `--config` больше не поддерживает файлы оценки старого формата. См. [миграция оценки](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [миграция оптимизации](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Отладка приложения

1. **Структурированное логирование:**
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

2. **Проверочные эндпоинты здоровья:**
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

3. **Мониторинг производительности:**
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

## Часто встречающиеся коды ошибок и их решения

| Код ошибки | Описание | Решение |
|------------|-------------|----------|
| 401 | Неавторизовано | Проверьте API-ключи и конфигурацию управляемой идентичности |
| 403 | Запрещено | Проверьте назначения ролей RBAC |
| 429 | Ограничение по скорости | Реализуйте логику повторных попыток с экспоненциальным увеличением задержки |
| 500 | Внутренняя ошибка сервера | Проверьте статус развертывания модели и журналы |
| 503 | Сервис недоступен | Проверьте состояние сервиса и доступность в регионе |

## Следующие шаги

1. **Изучите [Руководство по развертыванию моделей ИИ](../chapter-02-ai-development/ai-model-deployment.md)** для лучших практик развертывания
2. **Пройдите курс [Практики ИИ в производстве](../chapter-08-production/production-ai-practices.md)** для корпоративных решений
3. **Присоединяйтесь к [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** для поддержки сообщества
4. **Отправляйте проблемы** в [репозиторий AZD на GitHub](https://github.com/Azure/azure-dev) по вопросам, специфичным для AZD

## Ресурсы

- [Устранение неполадок Azure OpenAI с квотами и ограничениями](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Устранение неполадок Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Устранение неполадок Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Навык диагностики агента Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Установите навыки устранения неполадок Azure в вашем редакторе: `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курса**: [AZD для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Устранение неполадок и отладка
- **⬅️ Предыдущая**: [Руководство по отладке](debugging.md)
- **➡️ Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../chapter-08-production/production-ai-practices.md)
- **🤖 Связанные материалы**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Справочник**: [Устранение неполадок Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:
Этот документ был переведен с использованием сервиса машинного перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на наши усилия по обеспечению точности, имейте в виду, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для получения критически важной информации рекомендуется обратиться к профессиональному человеческому переводу. Мы не несем ответственности за любые недоразумения или неправильные толкования, возникшие в результате использования этого перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->