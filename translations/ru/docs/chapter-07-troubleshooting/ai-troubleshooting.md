# Руководство по устранению проблем, специфичных для ИИ

**Навигация по главам:**
- **📚 Главная курсa**: [AZD Для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Решение проблем и отладка
- **⬅️ Предыдущая**: [Руководство по отладке](debugging.md)
- **➡️ Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../chapter-08-production/production-ai-practices.md)
- **🤖 Связанные темы**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

Это комплексное руководство по устранению неполадок рассматривает распространённые проблемы при развертывании ИИ-решений с помощью AZD, предоставляя решения и методы отладки, специфичные для сервисов Azure AI.

## Оглавление

- [Проблемы с сервисом Microsoft Foundry Models](../../../../docs/chapter-07-troubleshooting)
- [Проблемы с Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Проблемы развертывания Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Ошибки аутентификации и разрешений](../../../../docs/chapter-07-troubleshooting)
- [Неудачи при развертывании модели](../../../../docs/chapter-07-troubleshooting)
- [Проблемы с производительностью и масштабированием](../../../../docs/chapter-07-troubleshooting)
- [Управление затратами и квотами](../../../../docs/chapter-07-troubleshooting)
- [Инструменты и методы отладки](../../../../docs/chapter-07-troubleshooting)

## Проблемы с сервисом Microsoft Foundry Models

### Проблема: Сервис OpenAI недоступен в регионе

**Симптомы:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причины:**
- Microsoft Foundry Models недоступен в выбранном регионе
- Квота исчерпана в предпочтительных регионах
- Региональные ограничения по мощности

**Решения:**

1. **Проверить доступность региона:**
```bash
# Список доступных регионов для OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Обновить конфигурацию AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Использовать альтернативные регионы:**
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

### Проблема: Превышена квота развертывания модели

**Симптомы:**
```
Error: Deployment failed due to insufficient quota
```

**Решения:**

1. **Проверить текущую квоту:**
```bash
# Проверить использование квоты
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Запросить увеличение квоты:**
```bash
# Отправить запрос на увеличение квоты
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Оптимизировать использование модели:**
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

### Проблема: Некорректная версия API

**Симптомы:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Решения:**

1. **Использовать поддерживаемую версию API:**
```python
# Используйте последнюю поддерживаемую версию
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Проверить совместимость версии API:**
```bash
# Список поддерживаемых версий API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Проблемы с Azure AI Search

### Проблема: Недостаточный ценовой уровень сервиса поиска

**Симптомы:**
```
Error: Semantic search requires Basic tier or higher
```

**Решения:**

1. **Повысить ценовой уровень:**
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

2. **Отключить семантический поиск (для разработки):**
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

### Проблема: Ошибки при создании индекса

**Симптомы:**
```
Error: Cannot create index, insufficient permissions
```

**Решения:**

1. **Проверить ключи сервиса поиска:**
```bash
# Получить ключ администратора службы поиска
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверить схему индекса:**
```python
# Проверить схему индекса
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

3. **Использовать управляемую идентичность:**
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

## Проблемы развертывания Container Apps

### Проблема: Ошибки при сборке контейнера

**Симптомы:**
```
Error: Failed to build container image
```

**Решения:**

1. **Проверить синтаксис Dockerfile:**
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

2. **Проверить зависимости:**
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

3. **Добавить проверку состояния:**
```python
# main.py - Добавить конечную точку проверки состояния здоровья
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблема: Ошибки при запуске Container App

**Симптомы:**
```
Error: Container failed to start within timeout period
```

**Решения:**

1. **Увеличить таймаут запуска:**
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

2. **Оптимизировать загрузку модели:**
```python
# Ленивое загрузка моделей для сокращения времени запуска
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
        # Инициализировать AI клиента здесь
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Запуск
    app.state.model_manager = ModelManager()
    yield
    # Завершение работы
    pass

app = FastAPI(lifespan=lifespan)
```

## Ошибки аутентификации и разрешений

### Проблема: Отказ в разрешении для управляемой идентичности

**Симптомы:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Решения:**

1. **Проверить назначения ролей:**
```bash
# Проверить текущие назначения ролей
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Назначить необходимые роли:**
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

3. **Проверить аутентификацию:**
```python
# Тестирование аутентификации управляемой идентичности
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

### Проблема: Отказ доступа к Key Vault

**Симптомы:**
```
Error: The user, group or application does not have secrets get permission
```

**Решения:**

1. **Выдать разрешения для Key Vault:**
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

2. **Использовать RBAC вместо политик доступа:**
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

## Неудачи при развертывании модели

### Проблема: Версия модели недоступна

**Симптомы:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Решения:**

1. **Проверить доступные модели:**
```bash
# Список доступных моделей
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Использовать резервы моделей:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
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

3. **Проверить модель перед развертыванием:**
```python
# Предварительная проверка модели перед развертыванием
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

## Проблемы с производительностью и масштабированием

### Проблема: Высокая задержка ответов

**Симптомы:**
- Время отклика > 30 секунд
- Ошибки таймаута
- Плохой пользовательский опыт

**Решения:**

1. **Внедрить таймауты запросов:**
```python
# Настройте правильные тайм-ауты
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

2. **Добавить кэширование ответов:**
```python
# Кэш Redis для ответов
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

3. **Настроить автоскейлинг:**
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

### Проблема: Ошибки из-за нехватки памяти

**Симптомы:**
```
Error: Container killed due to memory limit exceeded
```

**Решения:**

1. **Увеличить выделение памяти:**
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

2. **Оптимизировать использование памяти:**
```python
# Эффективная работа с памятью модели
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Проверить использование памяти перед обработкой
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Принудительный сбор мусора
            
        result = await self._process_ai_request(request)
        
        # Очистка после обработки
        gc.collect()
        return result
```

## Управление затратами и квотами

### Проблема: Неожиданно высокие расходы

**Симптомы:**
- Счёт за Azure выше ожидаемого
- Использование токенов превышает оценки
- Срабатывание оповещений о бюджете

**Решения:**

1. **Внедрить контроль затрат:**
```python
# Отслеживание использования токенов
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

2. **Настроить оповещения о расходах:**
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

3. **Оптимизировать выбор модели:**
```python
# Выбор модели с учетом стоимости
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # за 1 тысячу токенов
    'gpt-4.1': 0.03,          # за 1 тысячу токенов
    'gpt-35-turbo': 0.0015  # за 1 тысячу токенов
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4.1'
```

## Инструменты и методы отладки

### Команды отладки AZD

```bash
# Включить подробное ведение журналов
azd up --debug

# Проверить статус развертывания
azd show

# Просмотреть журналы приложения (открывает панель мониторинга)
azd monitor --logs

# Просмотреть текущие метрики
azd monitor --live

# Проверить переменные окружения
azd env get-values
```

### Команды расширения AZD AI для диагностики

Если вы развернули агентов с помощью `azd ai agent init`, доступны дополнительные инструменты:

```bash
# Убедитесь, что расширение агентов установлено
azd extension install azure.ai.agents

# Переинициализировать или обновить агента из манифеста
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Используйте сервер MCP, чтобы позволить инструментам ИИ запрашивать состояние проекта
azd mcp start

# Создайте инфраструктурные файлы для проверки и аудита
azd infra generate
```

> **Совет:** Используйте `azd infra generate` для записи IaC на диск, чтобы можно было точно проверить, какие ресурсы были развернуты. Это незаменимо при отладке проблем с конфигурацией ресурсов. Полные подробности смотрите в [справочнике AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Отладка приложения

1. **Структурированное логирование:**
```python
import logging
import json

# Настройка структурированного логирования для AI-приложений
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

2. **Проверочные точки состояния:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Проверить соединение с OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Проверить поисковый сервис
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

## Распространённые коды ошибок и решения

| Код ошибки | Описание | Решение |
|------------|----------|---------|
| 401 | Неавторизован | Проверьте API-ключи и конфигурацию управляемой идентичности |
| 403 | Запрещено | Проверьте назначения ролей RBAC |
| 429 | Ограничение по скорости | Внедрите логику повторных запросов с экспоненциальной задержкой |
| 500 | Внутренняя ошибка сервера | Проверьте статус и логи развертывания модели |
| 503 | Сервис недоступен | Проверьте здоровье сервиса и доступность региона |

## Следующие шаги

1. **Изучить [Руководство по развертыванию моделей ИИ](../chapter-02-ai-development/ai-model-deployment.md)** для рекомендаций по развертыванию
2. **Пройти [Практики производственного ИИ](../chapter-08-production/production-ai-practices.md)** для корпоративных решений
3. **Присоединиться к [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** для поддержки сообщества
4. **Отправлять проблемы** в [репозиторий AZD на GitHub](https://github.com/Azure/azure-dev) по вопросам, связанным с AZD

## Ресурсы

- [Решение проблем сервиса Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Устранение неполадок Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Устранение неполадок Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Навык Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Установите навыки Azure для устранения неполадок в вашем редакторе: `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация по главам:**
- **📚 Главная курсa**: [AZD Для начинающих](../../README.md)
- **📖 Текущая глава**: Глава 7 - Решение проблем и отладка
- **⬅️ Предыдущая**: [Руководство по отладке](debugging.md)
- **➡️ Следующая глава**: [Глава 8: Производственные и корпоративные шаблоны](../chapter-08-production/production-ai-practices.md)
- **🤖 Связанные темы**: [Глава 2: Разработка с приоритетом ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Справка**: [Устранение неполадок Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от ответственности**:  
Этот документ был переведен с помощью сервиса автоматического перевода [Co-op Translator](https://github.com/Azure/co-op-translator). Несмотря на то, что мы стремимся к точности, просим учитывать, что автоматический перевод может содержать ошибки или неточности. Оригинальный документ на его исходном языке следует считать авторитетным источником. Для критической информации рекомендуется использовать профессиональный перевод, выполненный человеком. Мы не несем ответственности за любые недоразумения или неверные толкования, возникшие в результате использования данного перевода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->