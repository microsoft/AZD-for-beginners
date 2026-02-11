# Průvodce řešením problémů specifických pro AI

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Průvodce laděním](debugging.md)
- **➡️ Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Související**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Předchozí:** [Produkční praktiky AI](../chapter-08-production/production-ai-practices.md) | **Další:** [Základy AZD](../chapter-01-foundation/azd-basics.md)

Tento komplexní průvodce řešením problémů se zabývá běžnými problémy při nasazování AI řešení pomocí AZD a poskytuje řešení a techniky ladění specifické pro služby Azure AI.

## Table of Contents

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Problémy se službou Azure OpenAI

### Problém: Služba OpenAI není v regionu dostupná

**Příznaky:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Příčiny:**
- Azure OpenAI není dostupný ve vybraném regionu
- Kvóta vyčerpána v preferovaných regionech
- Regionální omezení kapacity

**Řešení:**

1. **Zkontrolujte dostupnost regionu:**
```bash
# Seznam dostupných regionů pro OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Aktualizujte konfiguraci AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Použijte alternativní regiony:**
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

### Problém: Překročená kvóta pro nasazení modelu

**Příznaky:**
```
Error: Deployment failed due to insufficient quota
```

**Řešení:**

1. **Zkontrolujte aktuální kvótu:**
```bash
# Zkontrolovat využití kvóty
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Požádejte o navýšení kvóty:**
```bash
# Odeslat žádost o zvýšení kvóty
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimalizujte kapacitu modelu:**
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

### Problém: Neplatná verze API

**Příznaky:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Řešení:**

1. **Použijte podporovanou verzi API:**
```python
# Použijte nejnovější podporovanou verzi
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Zkontrolujte kompatibilitu verze API:**
```bash
# Seznam podporovaných verzí API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problémy služby Azure AI Search

### Problém: Cenová úroveň vyhledávací služby je nedostatečná

**Příznaky:**
```
Error: Semantic search requires Basic tier or higher
```

**Řešení:**

1. **Upgradujte cenovou úroveň:**
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

2. **Zakázat sémantické vyhledávání (vývoj):**
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

### Problém: Selhání při vytváření indexu

**Příznaky:**
```
Error: Cannot create index, insufficient permissions
```

**Řešení:**

1. **Ověřte klíče vyhledávací služby:**
```bash
# Získat administrační klíč služby vyhledávání
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Zkontrolujte schéma indexu:**
```python
# Ověřit schéma indexu
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

3. **Použijte spravovanou identitu:**
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

## Problémy s nasazením Container Apps

### Problém: Selhání sestavení kontejneru

**Příznaky:**
```
Error: Failed to build container image
```

**Řešení:**

1. **Zkontrolujte syntaxi Dockerfile:**
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

2. **Ověřte závislosti:**
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

3. **Přidejte kontrolu stavu (health check):**
```python
# main.py - Přidat endpoint pro kontrolu stavu
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problém: Selhání spuštění aplikace v kontejneru

**Příznaky:**
```
Error: Container failed to start within timeout period
```

**Řešení:**

1. **Zvyšte časový limit spuštění:**
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

2. **Optimalizujte načítání modelu:**
```python
# Lenivé načítání modelů ke zkrácení doby spuštění
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
        # Inicializovat AI klienta zde
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Spuštění
    app.state.model_manager = ModelManager()
    yield
    # Ukončení
    pass

app = FastAPI(lifespan=lifespan)
```

## Chyby autentizace a oprávnění

### Problém: Spravované identitě bylo odepřeno oprávnění

**Příznaky:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Řešení:**

1. **Ověřte přiřazení rolí:**
```bash
# Zkontrolujte aktuální přiřazení rolí
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Přiřaďte požadované role:**
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

3. **Otestujte autentizaci:**
```python
# Test ověřování spravované identity
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

### Problém: Přístup k Key Vault odepřen

**Příznaky:**
```
Error: The user, group or application does not have secrets get permission
```

**Řešení:**

1. **Udělte oprávnění k Key Vault:**
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

2. **Použijte RBAC místo přístupových politik:**
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

## Selhání nasazení modelu

### Problém: Verze modelu není dostupná

**Příznaky:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Řešení:**

1. **Zkontrolujte dostupné modely:**
```bash
# Vypsat dostupné modely
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Použijte náhradní modely (fallbacky):**
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

3. **Ověřte model před nasazením:**
```python
# Validace modelu před nasazením
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

## Problémy s výkonem a škálováním

### Problém: Vysoká latence odpovědí

**Příznaky:**
- Časy odezvy > 30 sekund
- Chyby vypršení časového limitu
- Špatná uživatelská zkušenost

**Řešení:**

1. **Zavést časové limity pro požadavky:**
```python
# Nakonfigurujte správné časové limity
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

2. **Přidat cache odpovědí:**
```python
# Redis mezipaměť pro odpovědi
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

3. **Nakonfigurujte automatické škálování:**
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

### Problém: Chyby z nedostatku paměti

**Příznaky:**
```
Error: Container killed due to memory limit exceeded
```

**Řešení:**

1. **Zvyšte alokaci paměti:**
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

2. **Optimalizujte využití paměti:**
```python
# Paměťově úsporné zpracování modelu
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Zkontrolujte využití paměti před zpracováním
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Vynutit sběr odpadu
            
        result = await self._process_ai_request(request)
        
        # Vyčistit po zpracování
        gc.collect()
        return result
```

## Řízení nákladů a kvót

### Problém: Neočekávaně vysoké náklady

**Příznaky:**
- Faktura Azure vyšší než očekávaná
- Spotřeba tokenů překračuje odhady
- Spuštěné upozornění na rozpočet

**Řešení:**

1. **Zaveďte kontroly nákladů:**
```python
# Sledování využití tokenů
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

2. **Nastavte upozornění na náklady:**
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

3. **Optimalizujte výběr modelu:**
```python
# Výběr modelu s ohledem na náklady
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # za 1K tokenů
    'gpt-4': 0.03,          # za 1K tokenů
    'gpt-35-turbo': 0.0015  # za 1K tokenů
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

## Nástroje a techniky pro ladění

### AZD Debugging Commands

```bash
# Povolit podrobné protokolování
azd up --debug

# Zkontrolovat stav nasazení
azd show

# Zobrazit protokoly aplikace (otevře panel monitorování)
azd monitor --logs

# Zobrazit živé metriky
azd monitor --live

# Zkontrolovat proměnné prostředí
azd env get-values
```

### Ladění aplikace

1. **Strukturované logování:**
```python
import logging
import json

# Konfigurujte strukturované logování pro AI aplikace
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

2. **Endpointy pro kontrolu stavu (health check):**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Zkontrolujte připojení k OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Zkontrolujte službu vyhledávání
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

3. **Sledování výkonu:**
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

## Běžné kódy chyb a řešení

| Kód chyby | Popis | Řešení |
|------------|-------------|----------|
| 401 | Neautorizováno | Zkontrolujte API klíče a konfiguraci spravované identity |
| 403 | Zakázáno | Ověřte přiřazení RBAC rolí |
| 429 | Omezeno rychlostí | Implementujte logiku opakování s exponenciálním zpožděním mezi pokusy |
| 500 | Interní chyba serveru | Zkontrolujte stav nasazení modelu a logy |
| 503 | Služba nedostupná | Ověřte stav služby a dostupnost v regionu |

## Další kroky

1. **Projděte si [Průvodce nasazením AI modelů](../chapter-02-ai-development/ai-model-deployment.md)** pro osvědčené postupy nasazení
2. **Dokončete [Produkční praktiky AI](../chapter-08-production/production-ai-practices.md)** pro podniková řešení
3. **Připojte se k [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pro podporu komunity
4. **Nahlaste problémy** do [úložiště AZD na GitHubu](https://github.com/Azure/azure-dev) pro problémy specifické pro AZD

## Zdroje

- [Řešení problémů služby Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Řešení problémů Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Řešení problémů Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navigace kapitolou:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Průvodce laděním](debugging.md)
- **➡️ Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Související**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Řešení problémů Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby AI překladu [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo chybné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->