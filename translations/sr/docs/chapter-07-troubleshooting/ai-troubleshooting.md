# Водич за решавање проблема специфичних за вештачку интелигенцију

**Навигација кроз поглавље:**
- **📚 Почетна страница курса**: [AZD за почетнике](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 7 - Решавање проблема и отклањање грешака
- **⬅️ Претходно**: [Водич за отклањање грешака](debugging.md)
- **➡️ Следеће поглавље**: [Поглавље 8: Процесуирање и пословни обрасци](../chapter-08-production/production-ai-practices.md)
- **🤖 Повезано**: [Поглавље 2: Развој првенствено за вештачку интелигенцију](../chapter-02-ai-development/microsoft-foundry-integration.md)

Овај свеобухватни водич за решавање проблема покрива уобичајене проблеме приликом постављања AI решења са AZD-ом, пружајући решења и технике отклањања грешака специфичне за Azure AI услуге.

> **Опсег:** Команде користе пример имена ресурса; замените их и изаберите одговарајућу претплату. Bicep блокови су фрагменти за убацивање у постојећи шаблон, а не самосталне распоређивања. Python исечци захтевају наведене SDK-ове и конфигурацију апликације. Нема живог Azure распоређивања извршеног за овај преглед.

## Садржај

- [Проблеми са Microsoft Foundry Models Service](#microsoft-foundry-models-service-issues)
- [Проблеми са Azure AI Search](#azure-ai-search-problems)
- [Проблеми са постављањем Container Apps](#container-apps-deployment-issues)
- [Грешке аутентификације и дозвола](#authentication-and-permission-errors)
- [Неуспеси распоређивања модела](#model-deployment-failures)
- [Проблеми са перформансама и скалирањем](#performance-and-scaling-issues)
- [Управљање трошковима и квотама](#cost-and-quota-management)
- [Алати и технике за отклањање грешака](#debugging-tools-and-techniques)

## Проблеми са Microsoft Foundry Models Service

### Проблем: OpenAI услуга недоступна у региону

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Узроци:**
- Microsoft Foundry Models нису доступни у изабраном региону
- Квота исцрпљена у одабраним регионима
- Регионална ограничења капацитета

**Решења:**

1. **Проверите доступност региона:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Ажурирајте AZD конфигурацију:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Користите алтернативне регионе:**
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

### Проблем: Прекорачење квоте за распоређивање модела

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Решења:**

1. **Проверите тренутну квоту:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Захтевајте повећање квоте:**
Користите управљачки ток квота у Foundry порталу за погођену претплату, регион, модел и тип распоређивања. Погледајте [званичне смернице о квотама](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Захтев за VM квоту не повећава квоту за модел.

3. **Оптимизујте капацитет модела:**
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

### Проблем: Неважећа верзија API-ja

**Симптоми:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Решења:**

1. **Користите подржану верзију API-ja:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Проверите компатибилност верзије API-ja:**
Проверите [Azure OpenAI API lifecycle reference](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM resource-provider верзије API-ја **не** приказују верзије inference/data-plane API-ја. Нови в1 клијенти користе `/openai/v1/` без датумске `api-version`; не мешајте два конфигурације клијената.

## Проблеми са Azure AI претрагом

### Проблем: Недовољан ниво претплате на претраживачки сервис

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Решења:**

1. **Користите подржани ниво претплате:**

Семантички ранкер захтева Basic или виши ниво. Прелазак са Free/Basic на други ниво може захтевати креирање новог претраживачког сервиса и поновно грађење индекса; измена SKU није загарантовано надоградња на месту.
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

2. **Искључите семантичку претрагу (за развој):**
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

### Проблем: Неуспеси при креирању индекса

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Решења:**

1. **Проверите кључеве претраживачког сервиса:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверите схему индекса:**
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

3. **Користите Managed Identity:**
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

## Проблеми са деплојем Container апликација

### Проблем: Неуспеси при градњи контејнера

**Симптоми:**
```
Error: Failed to build container image
```

**Решења:**

1. **Проверите синтаксу Dockerfile-а:**
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

2. **Валидирајте зависности:**
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

3. **Додајте Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблем: Неуспеси при старту Container апликације

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Решења:**

1. **Повећајте време за старт:**
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

2. **Оптимизујте учитавање модела:**
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

## Грешке при аутентификацији и дозволама

### Проблем: Одбијене дозволе Managed Identity

**Симптоми:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Решења:**

1. **Проверите додељене улоге:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Доделите потребне улоге:**
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

3. **Тестирајте аутентификацију:**
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

Добијање токена доказује аутентификацију, а не дозволу за позивање модела. Тестирајте намењену операцију посебно. Локално, `DefaultAzureCredential` може користити креатвене акредитиве; у Azure, проверите да ли је изабрана намењена managed identity.

### Проблем: Одбијен приступ Key Vault-у

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Решења:**

1. **Доделите дозволе за Key Vault:**

Користите следећи access-policy фрагмент само за vault са `enableRbacAuthorization: false`. За vault са RBAC укљученим, користите опцију 2; додавање access policy не даје приступ data-plane у RBAC моду.
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

2. **Користите RBAC уместо Access Policies:**

Vault мора имати `enableRbacAuthorization: true`; промена модела дозвола захтева планирану миграцију постојећег приступа.
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

## Неуспеси при имплементацији модела

### Проблем: Верзија модела није доступна

**Симптоми:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Решења:**

1. **Проверите доступне моделе:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Јасно одаберите доступан модел:**
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

3. **Валидирајте модел пре имплементације:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Проблеми са перформансама и скалирањем

### Проблем: Високо кашњење одговора

**Симптоми:**
- Времена одговора > 30 секунди
- Грешке због истека времена (timeout)
- Лоше корисничко искуство

**Решења:**

1. **Имплементирајте ограничења времена захтева:**
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

2. **Додајте кеширање одговора:**
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

3. **Подесите аутоматско скалирање:**
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

### Проблем: Грешке због недовољне меморије

**Симптоми:**
```
Error: Container killed due to memory limit exceeded
```

**Решења:**

1. **Повећајте доделу меморије:**
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

2. **Оптимизујте коришћење меморије:**
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

## Управљање трошковима и квотама

### Проблем: Неочекивано високи трошкови

**Симптоми:**
- Рачун за Azure већи од очекиваног
- Потрошња токена премашује процене
- Активиране аларме за буџет

**Решења:**

1. **Имплементирајте контролу трошкова:**
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

Овај бројач у меморији је илустративан, а не контрола месечне потрошње: ресетује се при рестарту, није заједнички међу репликама и проверава потрошњу само након позива. Право ограничење захтева трајно рачуноводство, резервације без конфликата пре захтева и месечну политику ресета. Метрике меморије контејнера такође морају узети у обзир цгрупа лимите; `psutil.virtual_memory()` није поуздана мера контејнерских ограничења, а скупљање смећа не примењује капу за меморију.

2. **Подесите аларме за трошкове:**
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

Декларишите `budgetStartDate` и `budgetEndDate` у свом шаблону. Буџети обавештавају; они не заустављају ресурсе нити наметају јасан лимит потрошње.

3. **Оптимизујте избор модела:**
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

## Алатке и технике за дебаговање

### AZD команде за дебаговање

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

### AZD AI екстензије за дијагностику

Ако сте распоредили агенте користећи `azd ai agent init`, ове додатне алатке су доступне:

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

> **Савет:** Користите `azd infra generate` да бисте записали IaC на диск како бисте могли прецизно проверити који су ресурси конфигурисани. Ово је непроцењиво приликом дебаговања проблема са конфигурацијом ресурса. Погледајте [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) за детаљна упутства.

**Дијагностика уз свест о издању (2026-11-04):** Агенти `1.0.0-beta.23` захтевају `azd >= 1.37.0`; надоградите основни CLI пре некомпатибилних екстензија. Ово издање агента задржава предупредења за развојне RBAC у коначном излазу распоређивања и идентификује верзију укључену у грешке активирања/прекомерног чекања. Прекомерно чекање не значи да је деплој неуспешан: прегледајте покушану верзију пре поновног покушаја. Исправља и A2A 0.3 позиве који приказују животни циклус поруке уместо комплетних одговора. Основни `azd 1.37.1` исправља пропагацију отказивања преко екстензија; `1.37.2` побољшава кључне потврде о обезбеђивању и руковање отказивањем.

Ако команда за процену из старијег туторијала само исписује смернице о миграцији, инсталирајте `azure.ai.evaluations` (`1.0.0-beta.2` захтева `azd >= 1.33.0`) и користите `azd ai eval init`, `generate`, и `run start`. Оптимизација `--config` више не прихвата старе датотеке евалуације. Погледајте [evaluation migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) и [optimization migration](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Дебаговање апликација

1. **Структурирано логовање:**
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

2. **Health Check крајње тачке:**
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

3. **Мониторинг перформанси:**
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

## Чести кодови грешака и решења

| Код грешке | Опис | Решење |
|------------|-------------|----------|
| 401 | Неовлашћено | Проверите API кључеве и конфигурацију managed identity |
| 403 | Забрањено | Проверите додељене улоге у RBAC |
| 429 | Ограничено учесталошћу | Имплементирајте логики ретрај са експоненцијалним порастом времена |
| 500 | Унутрашња грешка сервера | Проверите статус и логове имплементације модела |
| 503 | Сервис није доступан | Проверите здравље сервиса и регионалну доступност |

## Следећи кораци

1. **Погледајте [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** за најбоље праксе распоређивања
2. **Завршите [Production AI Practices](../chapter-08-production/production-ai-practices.md)** за решења спремна за предузећа
3. **Придружите се [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** за подршку заједнице
4. **Подајте проблеме** у [AZD GitHub репозиторијум](https://github.com/Azure/azure-dev) за AZD специфичне проблеме

## Ресурси

- [Azure OpenAI quota and throttling troubleshooting](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Инсталирајте Azure алатке за дијагностику у вашем едитору: `npx skills add microsoft/github-copilot-for-azure`

---

**Навигација кроз поглавља:**
- **📚 Почетак курса**: [AZD For Beginners](../../README.md)
- **📖 Тренутно поглавље**: Поглавље 7 - Решавање проблема и дебаговање
- **⬅️ Претходно**: [Debugging Guide](debugging.md)
- **➡️ Следеће поглавље**: [Поглавље 8: Производни и корпоративни обрасци](../chapter-08-production/production-ai-practices.md)
- **🤖 Повезано**: [Поглавље 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Референца**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Изјава о одрицању одговорности**:
Овај документ је преведен коришћењем услуге за аутоматски превод [Co-op Translator](https://github.com/Azure/co-op-translator). Иако тежимо тачности, имајте у виду да аутоматски преводи могу садржати грешке или нетачности. Оригинални документ на његовом изворном језику треба сматрати ауторитативним извором. За критичне информације препоручује се професионални људски превод. Нисмо одговорни за било каква неспоразума или погрешна тумачења која произилазе из коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->