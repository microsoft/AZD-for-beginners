# Průvodce řešením problémů specifických pro AI

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Průvodce laděním](debugging.md)
- **➡️ Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Související**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Tento komplexní průvodce řešením problémů pokrývá časté potíže při nasazování AI řešení s AZD a poskytuje řešení a techniky ladění specifické pro služby Azure AI.

> **Rozsah:** Příkazy používají příklady názvů zdrojů; nahraďte je a vyberte správné předplatné. Bicep bloky jsou fragmenty k začlenění do existující šablony, ne samostatné nasazení. Pythonové úryvky vyžadují uvedené SDK a konfiguraci aplikace. Pro tuto recenzi nebylo provedeno žádné živé nasazení do Azure.

## Obsah

- [Problémy se službou Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problémy s Azure AI Search](#azure-ai-search-problems)
- [Problémy s nasazením Container Apps](#container-apps-deployment-issues)
- [Autentizace a chyby oprávnění](#authentication-and-permission-errors)
- [Selhání nasazení modelu](#model-deployment-failures)
- [Výkon a škálování](#performance-and-scaling-issues)
- [Správa nákladů a kvót](#cost-and-quota-management)
- [Nástroje a techniky ladění](#debugging-tools-and-techniques)

## Problémy se službou Microsoft Foundry Models

### Problém: Služba OpenAI není dostupná v daném regionu

**Příznaky:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Příčiny:**
- Služba Microsoft Foundry Models není dostupná ve zvoleném regionu
- Kvóta ve preferovaných regionech je vyčerpána
- Regionální kapacitní omezení

**Řešení:**

1. **Zkontrolujte dostupnost regionu:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Aktualizujte konfiguraci AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Použijte alternativní regiony:**
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

### Problém: Překročena kvóta nasazení modelu

**Příznaky:**
```
Error: Deployment failed due to insufficient quota
```

**Řešení:**

1. **Zkontrolujte aktuální kvótu:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Požádejte o zvýšení kvóty:**
Využijte workflow správy kvót v portálu Foundry pro dané předplatné, region, model a typ nasazení. Viz [oficiální pokyny ke kvótám](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Požadavek na kvótu pro VM nezvyšuje kvótu modelu.

3. **Optimalizujte kapacitu modelu:**
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

### Problém: Neplatná verze API

**Příznaky:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Řešení:**

1. **Použijte podporovanou verzi API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Zkontrolujte kompatibilitu verze API:**
Zkontrolujte [referenci životního cyklu Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Verze API poskytovatele zdrojů ARM **neobsahují** verze inference/data-plane API. Noví klienti v1 používají `/openai/v1/` bez datované `api-version`; nekombinujte tyto dvě konfigurace klienta.

## Problémy s Azure AI Search

### Problém: Nedostatečná cenová úroveň služby Search

**Příznaky:**
```
Error: Semantic search requires Basic tier or higher
```

**Řešení:**

1. **Použijte podporovanou cenovou úroveň:**

Sémantický ranker vyžaduje Basic nebo vyšší. Přechod z Free/Basic na jinou úroveň může vyžadovat vytvoření nové vyhledávací služby a přestavění indexů; úprava SKU není zárukou upgrade na místě.
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

2. **Zakázat sémantické vyhledávání (v vývoji):**
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

### Problém: Selhání při vytváření indexů

**Příznaky:**
```
Error: Cannot create index, insufficient permissions
```

**Řešení:**

1. **Ověřte klíče pro vyhledávací službu:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Zkontrolujte schéma indexu:**
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

3. **Použijte spravovanou identitu:**
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

3. **Přidejte kontrolu stavu:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problém: Selhání spuštění Container App

**Příznaky:**
```
Error: Container failed to start within timeout period
```

**Řešení:**

1. **Zvyšte timeout spuštění:**
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

2. **Optimalizujte načítání modelu:**
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

## Chyby autentizace a oprávnění

### Problém: Odepřený přístup spravované identity

**Příznaky:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Řešení:**

1. **Ověřte přiřazení rolí:**
```bash
# Check current role assignments
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

3. **Testujte autentizaci:**
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

Získání tokenu potvrzuje autentizaci, nikoli oprávnění k vyvolání modelu. Otestujte zamýšlenou operaci samostatně. Lokálně může `DefaultAzureCredential` používat přihlašovací údaje vývojáře; v Azure ověřte, že je vybrána správná spravovaná identita.

### Problém: Odepřený přístup k Key Vault

**Příznaky:**
```
Error: The user, group or application does not have secrets get permission
```

**Řešení:**

1. **Udělte oprávnění k Key Vault:**

Použijte následující fragment politiky přístupu pouze pro trezor s `enableRbacAuthorization: false`. Pro trezor povolený RBAC použijte možnost 2; přidání přístupové politiky neuděluje přístup do datové roviny v režimu RBAC.
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

Trezor musí mít `enableRbacAuthorization: true`; změna modelu oprávnění vyžaduje plánovanou migraci existujícího přístupu.
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
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Explicitně vyberte dostupný model:**
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

3. **Ověřte model před nasazením:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problémy s výkonem a škálováním

### Problém: Vysoká latence odpovědí

**Příznaky:**
- Časy odezvy > 30 sekund
- Časové limity (timeouty)
- Špatná uživatelská zkušenost

**Řešení:**

1. **Implementujte timeouty požadavků:**
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

2. **Přidejte cachování odpovědí:**
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

### Problém: Chyby vyčerpání paměti

**Příznaky:**
```
Error: Container killed due to memory limit exceeded
```

**Řešení:**

1. **Zvyšte přidělení paměti:**
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

## Správa nákladů a kvót

### Problém: Neočekávaně vysoké náklady

**Příznaky:**
- Azure faktura vyšší než očekávaná
- Spotřeba tokenů přesahující odhady
- Aktivace upozornění rozpočtu

**Řešení:**

1. **Implementujte kontrolu nákladů:**
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

Tento počítadlo v paměti je jen ilustrativní, nikoli měsíční kontrola výdajů: resetuje se při restartu, nesdílí se napříč replikami a kontroluje využití až po volání. Skutečný limit vyžaduje trvalé účetnictví, při rezervacích bezpečných proti souběžnosti před požadavky a měsíční resetovací politiku. Metriky paměti kontejneru musí také zohledňovat limity cgroup; `psutil.virtual_memory()` není spolehlivým měřítkem limitu kontejneru a garbage collection nepřinucuje limit paměti.

2. **Nastavte upozornění na náklady:**
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

V deklaraci šablony uvádějte `budgetStartDate` a `budgetEndDate`. Rozpočty upozorňují; nezastavují zdroje ani neukládají tvrdý limit výdajů.

3. **Optimalizujte výběr modelu:**
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

## Nástroje a techniky ladění

### Příkazy ladění AZD

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

### Příkazy rozšíření AZD AI pro diagnostiku

Pokud jste nasadili agenty pomocí `azd ai agent init`, jsou k dispozici tyto další nástroje:

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

> **Tip:** Použijte `azd infra generate` k zápisu IaC na disk, abyste mohli přesně zkontrolovat, jaké zdroje byly vytvořeny. To je neocenitelné při ladění konfigurace zdrojů. Viz [referenci AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pro podrobnosti.

**Diagnostika citlivá na verze (2026-11-04):** Agent `1.0.0-beta.23` vyžaduje `azd >= 1.37.0`; aktualizujte jádro CLI před nekompatibilními rozšířeními. Toto vydání agenta zachovává výstrahy RBAC vývojářů ve výstupu finálního nasazení a identifikuje verzi zapojenou při selháních aktivace/timeoutů. Timeout neznamená, že nasazení selhalo: zkontrolujte pokus o verzi před opakováním. Také opravuje zobrazení zpráv životního cyklu u volání A2A 0.3 místo dokončených odpovědí. Jádro `azd 1.37.1` opravuje propagaci zrušení mezi rozšířeními; `1.37.2` zlepšuje kritická potvrzení provisioning a zpracování zrušení.

Pokud starší příkaz evaluace tutoriálu tiskne pouze pokyny k migraci, nainstalujte `azure.ai.evaluations` (`1.0.0-beta.2` vyžaduje `azd >= 1.33.0`) a použijte `azd ai eval init`, `generate` a `run start`. Optimalizace `--config` již nepřijímá starší evaluační soubory. Viz [migraci evaluace](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) a [migraci optimalizace](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Ladění aplikace

1. **Strukturované logování:**
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

2. **Zdravotní kontrolní koncové body:**
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

3. **Monitorování výkonu:**
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

## Běžné chybové kódy a řešení

| Chybový kód | Popis | Řešení |
|------------|-------------|----------|
| 401 | Neautorizováno | Zkontrolujte API klíče a konfiguraci spravované identity |
| 403 | Zakázáno | Ověřte přiřazení rolí v RBAC |
| 429 | Omezená rychlost | Implementujte logiku opakování s exponenciálním zpomalením |
| 500 | Interní chyba serveru | Zkontrolujte stav nasazení modelu a logy |
| 503 | Služba nedostupná | Ověřte zdraví služby a dostupnost regionu |

## Další kroky

1. **Prohlédněte si [Průvodce nasazením AI modelu](../chapter-02-ai-development/ai-model-deployment.md)** pro osvědčené postupy nasazení
2. **Dokončete [Produkční AI postupy](../chapter-08-production/production-ai-practices.md)** pro řešení připravená na podnikové nasazení
3. **Přidejte se k [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pro komunitní podporu
4. **Podávejte problémy** do [repozitáře AZD na GitHubu](https://github.com/Azure/azure-dev) pro problémy specifické pro AZD

## Zdroje

- [Řešení problémů s kvótami a omezováním Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Řešení problémů s Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Řešení problémů s Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Dovednost agenta Azure Diagnostiky**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Nainstalujte si dovednosti pro řešení problémů Azure ve vašem editoru: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Průvodce laděním](debugging.md)
- **➡️ Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Související**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Řešení problémů Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->