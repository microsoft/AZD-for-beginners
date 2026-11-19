# Ръководство за прецизиране на проблеми, свързани със специфични за ИИ ситуации

**Навигация в главите:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгинг
- **⬅️ Предишна**: [Ръководство за дебъгинг](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Производствени и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързано**: [Глава 2: Разработка, ориентирана първо към ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)

Това изчерпателно ръководство за прецизиране на проблеми разглежда често срещани проблеми при внедряване на ИИ решения с AZD, предоставяйки решения и техники за дебъгинг, специфични за Azure AI услуги.

> **Обхват:** Командите използват примерни имена на ресурси; заместете ги и изберете правилната абонаментна услуга. Блоковете Bicep са фрагменти за вграждане в съществуващ шаблон, не самостоятелни внедрения. Python фрагментите изискват посочените SDK и конфигурация на приложението. Не са изпълнявани живи внедрения в Azure за това ревю.

## Съдържание

- [Проблеми с услугата Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Проблеми с търсенето в Azure AI](#azure-ai-search-problems)
- [Проблеми при внедряване на контейнери](#container-apps-deployment-issues)
- [Грешки с удостоверяване и разрешения](#authentication-and-permission-errors)
- [Неуспешни внедрения на модели](#model-deployment-failures)
- [Проблеми с производителността и мащабирането](#performance-and-scaling-issues)
- [Управление на разходи и квоти](#cost-and-quota-management)
- [Инструменти и техники за дебъгинг](#debugging-tools-and-techniques)

## Проблеми с услугата Microsoft Foundry Models

### Проблем: Услугата OpenAI не е налична в региона

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Причини:**
- Microsoft Foundry Models не са налични в избрания регион
- Квотата е изчерпана в предпочитаните региони
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

### Проблем: Прекрачване на квотата за внедряване на модел

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

2. **Заявка за увеличение на квотата:**
Използвайте работния поток за управление на квотите в портала Foundry за засегнатия абонамент, регион, модел и тип внедряване. Вижте [официалните указания за квоти](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Заявката за квота ВМ не увеличава квотата на модела.

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
Проверете [справочника за жизнения цикъл на Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Версиите на API на ARM доставчик на ресурси **не** изброяват версиите на API за извод/данни. Новите v1 клиенти използват `/openai/v1/` без датирана `api-version`; не смесвайте двата клиента.

## Проблеми с търсенето в Azure AI

### Проблем: Недостатъчен ценови план за търсенето

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Решения:**

1. **Използвайте поддържан ценови план:**

Семантичният ранкър изисква Basic или по-висок. Преминаването от Free/Basic към друг план може да изисква създаване на нова услуга за търсене и презаписване на индекси; редактирането на SKU не гарантира ъпгрейд на място.
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

2. **Деактивирайте семантичното търсене (в разработка):**
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

### Проблем: Неуспехи при създаване на индекс

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Решения:**

1. **Проверете ключовете на услугата за търсене:**
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

## Проблеми при внедряване на контейнерни приложения

### Проблем: Грешки при компилиране на контейнер

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

2. **Валидирайте зависимости:**
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

3. **Добавете проверка на здравето:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблем: Грешки при стартиране на контейнерно приложение

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Решения:**

1. **Увеличете времето за таймаут при стартиране:**
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

2. **Оптимизирайте зареждането на модела:**
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

### Проблем: Отказан достъп за управлявана идентичност

**Симптоми:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Решения:**

1. **Проверете разпределението на роли:**
```bash
# Check current role assignments
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

Придобиването на токен доказва удостоверяване, а не разрешение за повикване на модел. Тествайте директно желаната операция. Локално, `DefaultAzureCredential` може да използва идентификационни данни на разработчика; в Azure, проверете дали е избрана съответната управлявана идентичност.

### Проблем: Отказан достъп до Key Vault

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Решения:**

1. **Дайте разрешения за Key Vault:**

Използвайте следния фрагмент от политика за достъп само за хранилище с `enableRbacAuthorization: false`. За хранилище с активиран RBAC, използвайте опция 2; добавянето на политика за достъп не предоставя достъп на ниво данни в RBAC режим.
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

Хранилището трябва да има `enableRbacAuthorization: true`; смяната на модела на разрешения изисква планирана миграция на съществуващия достъп.
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

## Неуспешни внедрения на модели

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

2. **Изберете наличен модел изрично:**
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

3. **Валидирайте модела преди внедряване:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Проблеми с производителността и мащабирането

### Проблем: Високи закъснения при отговорите

**Симптоми:**
- Време за отговор > 30 секунди
- Грешки за изтичане на времето
- Лошо потребителско изживяване

**Решения:**

1. **Внедрете таймаути за заявки:**
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

3. **Конфигурирайте автоскалиране:**
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

### Проблем: Грешки поради изчерпване на паметта

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

2. **Оптимизирайте използването на паметта:**
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

### Проблем: Неочаквани високи разходи

**Симптоми:**
- Сметка за Azure по-висока от очакваното
- Използване на токени над прогнозираната стойност
- Стартиране на аларми за бюджета

**Решения:**

1. **Внедряване на контрол на разходите:**
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

Този брояч в паметта е илюстративен, а не контрол на месечните разходи: той се нулира при рестарт, не се споделя между копия и проверява използването само след повикване. Реалният лимит изисква устойчиво счетоводство, резервации, безопасни при конкурентен достъп преди заявки, и политика за нулиране месечно. Метриките на паметта на контейнера трябва също да отчитат ограниченията на cgroup; `psutil.virtual_memory()` не е надежден измерител за лимит на контейнер, а garbage collection не налага капацитет на паметта.

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

Обявете `budgetStartDate` и `budgetEndDate` в шаблона си. Бюджетите предупреждават, но не спират ресурси или налагат твърд лимит на разходите.

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

## Инструменти и техники за дебъгинг

### Команди за дебъгинг на AZD

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

### Команди на AZD AI разширение за диагностика

Ако сте внедрили агенти с `azd ai agent init`, тези допълнителни инструменти са налични:

```bash
# Install the GA Foundry bundle (requires azd >= 1.37.0)
azd ext install microsoft.foundry

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Stream hosted-agent logs
azd ai agent monitor --follow

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Съвет:** Използвайте `azd infra generate`, за да запишете IaC на диск, така че да можете да инспектирате точно какви ресурси са били осигурени. Това е безценно при дебъгване на проблеми с конфигурирането на ресурси. Вижте [справката за AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за пълни подробности.

**Диагностика на GA работен поток (2026-11-09):** Проверете дали `azd version` е поне 1.37.0 и инспектирайте `azd ext list --installed`. Обновете първо основния CLI с `azd update` или инсталатора му, след това обновете пакета с `azd ext upgrade microsoft.foundry`. При локални грешки проверете текущата uv, Python 3.13+ за основния пример, `PYTHONNOUSERSITE: "1"` в конфигурацията на услугата и Azure креденциалите, използвани от `DefaultAzureCredential`. Дръжте `azd ai agent run` работещ, докато извиквате `--local` от втори терминал в директорията на проекта.

Успешното осигуряване не доказва, че разработчикът има достъп на ниво данни. Прегледайте предупрежденията за RBAC и [матрицата с разрешения на хостван агент](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Таймаут не означава непременно неуспех при внедряване: инспектирайте се опитваната версия и логовете преди повторен опит. По-ранните агенти beta.23 подобриха тези предупреждения и A2A резултатите; тези исторически поправки са описани в [бележките към изданието](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), но не е задължително да инсталирате тази бета.

Ако `azd ai eval` липсва, инсталирайте отделно `azure.ai.evaluations`; GA пакетът не го включва. Ако командата agent-evaluation от по-стар урок само извежда указания за миграция, използвайте отделния работен поток `azd ai eval`. Оптимизацията с `--config` вече не приема наследени файлове за оценка. Вижте [миграция на оценяване](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [миграция на оптимизация](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Отстраняване на проблеми с приложенията

1. **Структурирано регистриране:**
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

2. **Крайни точки за проверка на здравето:**
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

3. **Наблюдение на производителността:**
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

## Често срещани кодове на грешки и решения

| Код на грешка | Описание | Решение |
|------------|-------------|----------|
| 401 | Неоторизиран | Проверете API ключовете и конфигурацията на управляваната идентичност |
| 403 | Забранено | Проверете назначаването на роли в RBAC |
| 429 | Ограничение на заявките | Внедрете логика за повторни опити с експоненциално забавяне |
| 500 | Вътрешна грешка на сървъра | Проверете статуса на внедряване на модела и логовете |
| 503 | Услугата не е налична | Проверете здравето на услугата и регионалната наличност |

## Следващи стъпки

1. **Прегледайте [Ръководство за внедряване на ИИ модел](../chapter-02-ai-development/ai-model-deployment.md)** за добри практики при внедряване
2. **Завършете [Практики за производствен ИИ](../chapter-08-production/production-ai-practices.md)** за решения готови за предприятия
3. **Присъединете се към [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** за общностна подкрепа
4. **Подайте проблеми** в [репозиторито на AZD в GitHub](https://github.com/Azure/azure-dev) за специфични за AZD проблеми

## Ресурси

- [Отстраняване на проблеми с квоти и ограничаване в Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Отстраняване на проблеми с контейнерни приложения](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Отстраняване на проблеми с Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Умения за диагностичен агент на Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Инсталирайте умения за отстраняване на проблеми в редактора си: `npx skills add microsoft/github-copilot-for-azure`

---

**Навигация в главите:**
- **📚 Начало на курса**: [AZD За начинаещи](../../README.md)
- **📖 Текуща глава**: Глава 7 - Отстраняване на проблеми и дебъгинг
- **⬅️ Предишна**: [Ръководство за дебъгинг](debugging.md)
- **➡️ Следваща глава**: [Глава 8: Производствени и корпоративни модели](../chapter-08-production/production-ai-practices.md)
- **🤖 Свързано**: [Глава 2: Разработка, ориентирана първо към ИИ](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Справка**: [Отстраняване на проблеми с Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Отказ от отговорност**:
Този документ е преведен с помощта на AI преводачески услуга [Co-op Translator](https://github.com/Azure/co-op-translator). Въпреки че се стремим към точност, моля имайте предвид, че автоматизираните преводи могат да съдържат грешки или неточности. Оригиналният документ на неговия роден език трябва да се счита за авторитетен източник. За критична информация се препоръчва професионален човешки превод. Ние не носим отговорност за каквито и да е недоразумения или неправилни тълкувания, произтичащи от използването на този превод.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->