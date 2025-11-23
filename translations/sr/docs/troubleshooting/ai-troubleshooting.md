<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-23T18:21:35+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "sr"
}
-->
# Водич за решавање проблема специфичних за AI

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 7 - Решавање проблема и отклањање грешака
- **⬅️ Претходно**: [Водич за отклањање грешака](debugging.md)
- **➡️ Следеће поглавље**: [Поглавље 8: Производни и корпоративни обрасци](../microsoft-foundry/production-ai-practices.md)
- **🤖 Повезано**: [Поглавље 2: Развој заснован на AI](../microsoft-foundry/microsoft-foundry-integration.md)

**Претходно:** [Практике производног AI](../microsoft-foundry/production-ai-practices.md) | **Следеће:** [Почетак рада са AZD](../getting-started/README.md)

Овај свеобухватни водич за решавање проблема обрађује уобичајене изазове приликом примене AI решења са AZD, пружајући решења и технике отклањања грешака специфичне за Azure AI услуге.

## Садржај

- [Проблеми са Azure OpenAI услугом](../../../../docs/troubleshooting)
- [Проблеми са Azure AI претрагом](../../../../docs/troubleshooting)
- [Проблеми са применом апликација у контејнерима](../../../../docs/troubleshooting)
- [Грешке у аутентификацији и дозволама](../../../../docs/troubleshooting)
- [Неуспеси у примени модела](../../../../docs/troubleshooting)
- [Проблеми са перформансама и скалирањем](../../../../docs/troubleshooting)
- [Управљање трошковима и квотама](../../../../docs/troubleshooting)
- [Алатке и технике за отклањање грешака](../../../../docs/troubleshooting)

## Проблеми са Azure OpenAI услугом

### Проблем: OpenAI услуга није доступна у региону

**Симптоми:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Узроци:**
- Azure OpenAI није доступан у изабраном региону
- Потрошена квота у преферираним регионима
- Ограничења капацитета региона

**Решења:**

1. **Проверите доступност региона:**
```bash
# Листа доступних региона за OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Ажурирајте AZD конфигурацију:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Користите алтернативне регионе:**
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

### Проблем: Прекорачење квоте за примену модела

**Симптоми:**
```
Error: Deployment failed due to insufficient quota
```

**Решења:**

1. **Проверите тренутну квоту:**
```bash
# Проверите употребу квоте
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Затражите повећање квоте:**
```bash
# Поднесите захтев за повећање квоте
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Оптимизујте капацитет модела:**
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

### Проблем: Неважећа верзија API-ја

**Симптоми:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Решења:**

1. **Користите подржану верзију API-ја:**
```python
# Користите најновију подржану верзију
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Проверите компатибилност верзије API-ја:**
```bash
# Списак подржаних верзија API-ja
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Проблеми са Azure AI претрагом

### Проблем: Недовољан ниво цене услуге претраге

**Симптоми:**
```
Error: Semantic search requires Basic tier or higher
```

**Решења:**

1. **Надоградите ниво цене:**
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

2. **Онемогућите семантичку претрагу (за развој):**
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

### Проблем: Неуспеси у креирању индекса

**Симптоми:**
```
Error: Cannot create index, insufficient permissions
```

**Решења:**

1. **Проверите кључеве услуге претраге:**
```bash
# Узмите администраторски кључ за претраживачку услугу
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Проверите шему индекса:**
```python
# Потврдите шему индекса
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

3. **Користите управљани идентитет:**
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

## Проблеми са применом апликација у контејнерима

### Проблем: Неуспеси у изградњи контејнера

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

2. **Потврдите зависности:**
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

3. **Додајте проверу здравља:**
```python
# main.py - Додај крајњу тачку за проверу здравља
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Проблем: Неуспеси при покретању апликације у контејнеру

**Симптоми:**
```
Error: Container failed to start within timeout period
```

**Решења:**

1. **Повећајте време за покретање:**
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

2. **Оптимизујте учитавање модела:**
```python
# Лењо учитавање модела ради смањења времена покретања
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
        # Иницијализујте AI клијента овде
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Покретање
    app.state.model_manager = ModelManager()
    yield
    # Гашење
    pass

app = FastAPI(lifespan=lifespan)
```

## Грешке у аутентификацији и дозволама

### Проблем: Одбијена дозвола за управљани идентитет

**Симптоми:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Решења:**

1. **Проверите додељене улоге:**
```bash
# Проверите тренутна додељивања улога
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
# Тестирајте аутентификацију управљаног идентитета
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

### Проблем: Одбијен приступ Key Vault-у

**Симптоми:**
```
Error: The user, group or application does not have secrets get permission
```

**Решења:**

1. **Доделите дозволе за Key Vault:**
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

2. **Користите RBAC уместо политика приступа:**
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

## Неуспеси у примени модела

### Проблем: Верзија модела није доступна

**Симптоми:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Решења:**

1. **Проверите доступне моделе:**
```bash
# Списак доступних модела
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Користите резервне моделе:**
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

3. **Потврдите модел пре примене:**
```python
# Валидација модела пре распоређивања
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

## Проблеми са перформансама и скалирањем

### Проблем: Висока латенција одговора

**Симптоми:**
- Време одговора > 30 секунди
- Грешке због истека времена
- Лоше корисничко искуство

**Решења:**

1. **Примените временска ограничења за захтеве:**
```python
# Подесите одговарајуће временске ограничења
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
# Редис кеш за одговоре
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

3. **Конфигуришите аутоматско скалирање:**
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

### Проблем: Грешке због недостатка меморије

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
# Руковање моделом који штеди меморију
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Провери употребу меморије пре обраде
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Присилно сакупљање смећа
            
        result = await self._process_ai_request(request)
        
        # Очисти након обраде
        gc.collect()
        return result
```

## Управљање трошковима и квотама

### Проблем: Неочекивано високи трошкови

**Симптоми:**
- Рачун за Azure већи од очекиваног
- Потрошња токена премашује процене
- Активирани аларми за буџет

**Решења:**

1. **Примените контролу трошкова:**
```python
# Праћење употребе токена
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

2. **Поставите аларме за трошкове:**
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

3. **Оптимизујте избор модела:**
```python
# Избор модела узимајући у обзир трошкове
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # по 1К токена
    'gpt-4': 0.03,          # по 1К токена
    'gpt-35-turbo': 0.0015  # по 1К токена
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

## Алатке и технике за отклањање грешака

### AZD команде за отклањање грешака

```bash
# Омогући детаљно логовање
azd up --debug

# Провери статус распоређивања
azd show

# Погледај логове распоређивања
azd logs --follow

# Провери променљиве окружења
azd env get-values
```

### Отклањање грешака у апликацији

1. **Структурисано логовање:**
```python
import logging
import json

# Конфигуришите структурно логовање за AI апликације
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

2. **Ендпоинти за проверу здравља:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Проверите повезаност са OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Проверите услугу претраге
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

3. **Праћење перформанси:**
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

## Уобичајени кодови грешака и решења

| Код грешке | Опис | Решење |
|------------|-------------|----------|
| 401 | Неауторизовано | Проверите API кључеве и конфигурацију управљаног идентитета |
| 403 | Забрањено | Проверите додељивање улога у RBAC-у |
| 429 | Ограничење брзине | Примените логику поновног покушаја са експоненцијалним одлагањем |
| 500 | Интерна грешка сервера | Проверите статус примене модела и логове |
| 503 | Услуга недоступна | Проверите здравље услуге и доступност региона |

## Следећи кораци

1. **Прегледајте [Водич за примену AI модела](ai-model-deployment.md)** за најбоље праксе примене
2. **Завршите [Практике производног AI](production-ai-practices.md)** за решења спремна за предузећа
3. **Придружите се [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** за подршку заједнице
4. **Пријавите проблеме** на [AZD GitHub репозиторијум](https://github.com/Azure/azure-dev) за проблеме специфичне за AZD

## Ресурси

- [Решавање проблема са Azure OpenAI услугом](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Решавање проблема са апликацијама у контејнерима](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Решавање проблема са Azure AI претрагом](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Навигација кроз поглавља:**
- **📚 Почетна страна курса**: [AZD за почетнике](../../README.md)
- **📖 Текуће поглавље**: Поглавље 7 - Решавање проблема и отклањање грешака
- **⬅️ Претходно**: [Водич за отклањање грешака](debugging.md)
- **➡️ Следеће поглавље**: [Поглавље 8: Производни и корпоративни обрасци](../microsoft-foundry/production-ai-practices.md)
- **🤖 Повезано**: [Поглавље 2: Развој заснован на AI](../microsoft-foundry/microsoft-foundry-integration.md)
- [Решавање проблема са Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Одрицање од одговорности**:  
Овај документ је преведен помоћу услуге за превођење уз помоћ вештачке интелигенције [Co-op Translator](https://github.com/Azure/co-op-translator). Иако настојимо да обезбедимо тачност, молимо вас да имате у виду да аутоматизовани преводи могу садржати грешке или нетачности. Оригинални документ на изворном језику треба сматрати меродавним извором. За критичне информације препоручује се професионални превод од стране људи. Не преузимамо одговорност за било каква погрешна тумачења или неспоразуме који могу настати услед коришћења овог превода.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->