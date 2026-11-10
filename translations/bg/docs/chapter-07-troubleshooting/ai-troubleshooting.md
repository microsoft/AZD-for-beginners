# Ръководство за Отстраняване на Проблеми, Специфични за AI

**Навигация в Главата:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и отчитане на грешки
- **⬅️ Предишна**: [Ръководство за отстраняване на грешки](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Производствени и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързани**: [Глава 2: AI-първостепенно разработване](../chapter-02-ai-development/microsoft-foundry-integration.md)

Това изчерпателно ръководство за отстраняване на проблеми разглежда чести проблеми при внедряване на AI решения с AZD, като предоставя решения и техники за отстраняване на грешки, специфични за услугите на Azure AI.

> **Обхват:** Командите използват примерни имена на ресурси; заменете ги и изберете правилния абонамент. Блоковете Bicep са фрагменти за сливане в съществуващ шаблон, а не самостоятелни внедрявания. Python кодовите фрагменти изискват посочените SDK и конфигурация на приложението. За този преглед не е извършено живо внедряване в Azure.

## Съдържание

- [Проблеми с услугата Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Проблеми с Azure AI Search](#azure-ai-search-problems)
- [Проблеми с внедряване на Container Apps](#container-apps-deployment-issues)
- [Грешки с удостоверяване и разрешения](#authentication-and-permission-errors)
- [Неуспешно внедряване на модел](#model-deployment-failures)
- [Проблеми с производителност и мащабиране](#performance-and-scaling-issues)
- [Управление на разходи и квоти](#cost-and-quota-management)
- [Инструменти и техники за отстраняване на грешки](#debugging-tools-and-techniques)

## Проблеми с услугата Microsoft Foundry Models

### Проблем: Услугата OpenAI не е налична в региона

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причини:**
- Microsoft Foundry Models не са налични в избрания регион
- Квотата в предпочитаните региони е изчерпана
- Регионални ограничения на капацитета

**Решения:**

1. **Проверете наличността в региона:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Актуализирайте конфигурацията на AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Използвайте алтернативни региони:**
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

### Проблем: Превишена квота за внедряване на модел

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Решения:**

1. **Проверете текущата квота:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Заявете увеличение на квотата:**
Използвайте работния процес за управление на квотата в портала Foundry за засегнатия абонамент, регион, модел и тип внедряване. Вижте [официалното ръководство за квоти](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Заявката за квота за VM не увеличава квотата за модел.

3. **Оптимизирайте капацитета на модела:**
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

### Проблем: Невалидна версия на API

**Симптоми:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Решения:**

1. **Използвайте поддържана версия на API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Проверете съвместимостта на версията на API:**
Прегледайте [референтния живот на API-то на Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Версиите на API за ARM доставчиците на ресурси **не** включват версии на API за inferface/data-plane. Новите клиенти v1 използват `/openai/v1/` без датиран `api-version`; не смесвайте двете клиентски конфигурации.

## Проблеми с Azure AI Search

### Проблем: Недостатъчен ценови слой на услугата за търсене

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Решения:**

1. **Използвайте поддържан ценови слой:**

Семантичният ранкър изисква Basic или по-висок. Превключването от Free/Basic към друг слой може да изисква създаване на нова услуга за търсене и възстановяване на индексите; редактирането на SKU не гарантира директен ъпгрейд.
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

2. **Деактивирайте семантичното търсене (за разработка):**
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

### Проблем: Неуспешно създаване на индекс

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Решения:**

1. **Потвърдете ключовете на услугата за търсене:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверете схемата на индекса:**
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

3. **Използвайте управлявана идентичност:**
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

2. **Проверете зависимостите:**
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

3. **Добавете здравна проверка:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблем: Грешки при стартиране на контейнерното приложение

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Решения:**

1. **Увеличете времето за стартиране:**
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

2. **Оптимизирайте зареждането на модел:**
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

## Грешки с удостоверяване и разрешения

### Проблем: Отказан достъп на управлявана идентичност

**Симптоми:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Решения:**

1. **Потвърдете назначените роли:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Назначете необходими роли:**
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

Получаването на токен доказва удостоверяване, но не и разрешение за извикване на модел. Тествайте предвидената операция отделно. Локално `DefaultAzureCredential` може да използва идентификационни данни на разработчика; в Azure, проверете избраната управлявана идентичност.

### Проблем: Отказан достъп до Key Vault

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Решения:**

1. **Разрешете права в Key Vault:**

Използвайте следния фрагмент за достъп само за хранилище с `enableRbacAuthorization: false`. За хранилище с включен RBAC използвайте опция 2; добавянето на политика за достъп не предоставя достъп на ниво данни в режим RBAC.
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

Хранилището трябва да има `enableRbacAuthorization: true`; смяната на моделите на разрешения изисква планирана миграция на съществуващ достъп.
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

## Неуспехи при внедряване на модел

### Проблем: Версията на модела не е налична

**Симптоми:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Решения:**

1. **Проверете наличните модели:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Изберете наличен модел явни:**
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

3. **Потвърдете модела преди внедряване:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Проблеми с производителност и мащабиране

### Проблем: Висока латентност при отговори

**Симптоми:**
- Времена за отговор > 30 секунди
- Грешки с таймаут
- Лошо потребителско изживяване

**Решения:**

1. **Реализирайте таймаути за заявки:**
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

2. **Добавете кеширане на отговорите:**
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

### Проблем: Грешки за изчерпване на памет

**Симптоми:**
```
Error: Container killed due to memory limit exceeded
```

**Решения:**

1. **Увеличете разпределената памет:**
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

## Управление на разходи и квоти

### Проблем: Неочаквано високи разходи

**Симптоми:**
- Сметката за Azure е по-висока от очакваното
- Използване на токени, надвишаващо прогнозите
- Активирани аларми за бюджет

**Решения:**

1. **Внедрете контрол на разходите:**
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

Този брояч в паметта е илюстративен, не месечен контрол на разходите: нулира се при рестарт, не се споделя между реплики и проверява използването само след повикване. Реалният лимит изисква трайно счетоводство, резервации, защитени от конкурентно използване, преди заявките, и политика за месечно нулиране. Метриките на паметта на контейнера трябва също да отчитат ограниченията на cgroup; `psutil.virtual_memory()` не е надежден измерител на лимитите на контейнера, а garbage collection не налага капацитет на паметта.

2. **Настройте аларми за разходи:**
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

Декларирайте `budgetStartDate` и `budgetEndDate` във вашия шаблон. Бюджетите уведомяват; те не спират ресурси или не налагат твърд лимит на разходите.

3. **Оптимизирайте избора на модел:**
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

## Инструменти и техники за отстраняване на грешки

### Команди за отстраняване на грешки на AZD

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

### Команди на AZD AI разширението за диагностика

Ако сте внедрили агенти чрез `azd ai agent init`, тези допълнителни инструменти са налични:

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

> **Съвет:** Използвайте `azd infra generate`, за да запишете IaC на диск, за да прегледате точно какви ресурси са били осигурени. Това е безценно при отстраняване на проблеми с конфигурацията на ресурсите. Вижте [референтното ръководство за AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълни подробности.

**Диагностика, осъзнаваща версии (2026-11-04):** За агентите `1.0.0-beta.23` изисква `azd >= 1.37.0`; ъпгрейднете основното CLI преди несъвместими разширения. Тази версия на агента запазва предупреждения RBAC на разработчици във финалния отчет за внедряване и идентифицира версията, свързана с неуспехи при активиране/таймаути. Таймаутът не доказва, че внедряването се е провалило: прегледайте опитваната версия преди повторен опит. Също така поправя A2A 0.3 извиквания, които показват съобщения от жизнения цикъл вместо завършени отговори. Основният `azd 1.37.1` поправя разпространението на анулиране през разширенията; `1.37.2` подобрява критичните потвърждения на осигуряването и обработка на анулиране.

Ако командата за оценка на по-стар урок само показва указания за миграция, инсталирайте `azure.ai.evaluations` (`1.0.0-beta.2` изисква `azd >= 1.33.0`) и използвайте `azd ai eval init`, `generate`, и `run start`. `--config` на оптимизацията вече не приема стари файлове за оценка. Вижте [миграция на оценка](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [миграция на оптимизация](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Отстраняване на грешки в приложението

1. **Структурирано логване:**
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

2. **Крайни точки за здравна проверка:**
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
|------------|-------------|----------|
| 401 | Неоторизиран | Проверете API ключовете и конфигурацията на управляваната идентичност |
| 403 | Забранено | Потвърдете роли по RBAC |
| 429 | Ограничение по честота | Внедрете логика за повторен опит с експоненциално обратно изчакване |
| 500 | Вътрешна грешка на сървъра | Проверете статуса на внедряване на модела и логовете |
| 503 | Услугата не е налична | Проверете здравето на услугата и регионалната наличност |

## Следващи стъпки

1. **Прегледайте [Ръководството за внедряване на AI модели](../chapter-02-ai-development/ai-model-deployment.md)** за добри практики при внедряване
2. **Завършете [Практики за продукционно AI](../chapter-08-production/production-ai-practices.md)** за корпоративно готови решения
3. **Присъединете се към [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** за подкрепа от общността
4. **Докладвайте проблеми** в [GitHub хранилището на AZD](https://github.com/Azure/azure-dev) за специфични проблеми с AZD

## Ресурси

- [Отстраняване на проблеми с квоти и ограничаване в Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Отстраняване на проблеми с Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Отстраняване на проблеми с Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Инсталирайте умения за отстраняване на проблеми в редактора: `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в Главата:**
- **📚 Начална страница на курса**: [AZD за начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и отчитане на грешки
- **⬅️ Предишна**: [Ръководство за отстраняване на грешки](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Производствени и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързани**: [Глава 2: AI-първостепенно разработване](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Референция**: [Отстраняване на проблеми с Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->