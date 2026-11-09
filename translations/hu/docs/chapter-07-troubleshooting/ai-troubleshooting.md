# MI-specifikus hibaelhárítási útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibaelhárítás és hibakeresés
- **⬅️ Előző**: [Hibakeresési útmutató](debugging.md)
- **➡️ Következő fejezet**: [8. fejezet: Termelési és vállalati minták](../chapter-08-production/production-ai-practices.md)
- **🤖 Kapcsolódó**: [2. fejezet: MI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ez az átfogó hibaelhárítási útmutató a gyakori problémákat tárgyalja az AZD-vel történő MI-megoldás telepítése során, megoldásokat és hibakeresési technikákat kínálva, amelyek kifejezetten az Azure MI szolgáltatásokra vonatkoznak.

> **Hatály:** A parancsok példa erőforrásneveket használnak; cserélje ki azokat és válassza ki a megfelelő előfizetést. A Bicep blokkok töredékek, amelyeket egy meglévő sablonba kell illeszteni, nem önálló telepítések. A Python kódrészletekhez a megadott SDK-k és alkalmazáskonfiguráció szükséges. Ebben az értékelésben nem történt élő Azure telepítés.

## Tartalomjegyzék

- [Microsoft Foundry modellek szolgáltatási problémái](#microsoft-foundry-models-service-issues)
- [Azure AI Keresési problémák](#azure-ai-search-problems)
- [Konténeralkalmazás telepítési problémák](#container-apps-deployment-issues)
- [Hitelesítési és jogosultsági hibák](#authentication-and-permission-errors)
- [Modell telepítési hibák](#model-deployment-failures)
- [Teljesítmény- és skálázási problémák](#performance-and-scaling-issues)
- [Költség- és kvótagazdálkodás](#cost-and-quota-management)
- [Hibakereső eszközök és technikák](#debugging-tools-and-techniques)

## Microsoft Foundry modellek szolgáltatási problémái

### Probléma: OpenAI szolgáltatás nem elérhető régióban

**Tünetek:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Okozók:**
- Microsoft Foundry modellek nem elérhetők a kiválasztott régióban
- Kvóta kimerült a preferált régiókban
- Régiós kapacitáskorlátok

**Megoldások:**

1. **Ellenőrizze a régió elérhetőségét:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Frissítse az AZD-konfigurációt:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Használjon alternatív régiókat:**
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

### Probléma: Modell telepítési kvóta túllépve

**Tünetek:**
```
Error: Deployment failed due to insufficient quota
```

**Megoldások:**

1. **Ellenőrizze az aktuális kvótát:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Kérjen kvótaemelést:**
Használja a Foundry portál kvóta-menedzsment munkafolyamatát az érintett előfizetéshez, régióhoz, modellhez és telepítési típushoz. Lásd a [hivatalos kvóta útmutatót](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). VM kvóta kérelem nem növeli a modell kvótát.

3. **Optimalizálja a modell kapacitását:**
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

### Probléma: Érvénytelen API verzió

**Tünetek:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Megoldások:**

1. **Használja a támogatott API verziót:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Ellenőrizze az API verzió kompatibilitását:**
Nézze meg az [Azure OpenAI API életciklus referencia](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle) dokumentációt. Az ARM erőforrás-szolgáltató API verziók **nem** listázzák az inference/adatplane API verziókat. Új v1 kliens `/openai/v1/` használ dátum nélküli `api-version` helyett; ne keverje a két kliens konfigurációt.

## Azure AI Keresési problémák

### Probléma: Keresési szolgáltatás árazási szintje nem megfelelő

**Tünetek:**
```
Error: Semantic search requires Basic tier or higher
```

**Megoldások:**

1. **Használjon támogatott árazási szintet:**

A szemantikus rangsorolóhoz Basic vagy magasabb szint szükséges. A Free/Basic szintről magasabbra váltás esetén új keresési szolgáltatást kell létrehozni és újraépíteni az indexeket; a SKU szerkesztése nem garantálja a helyben történő frissítést.
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

2. **Kapcsolja ki a szemantikus keresést (fejlesztés alatt):**
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

### Probléma: Index létrehozás sikertelen

**Tünetek:**
```
Error: Cannot create index, insufficient permissions
```

**Megoldások:**

1. **Ellenőrizze a keresési szolgáltatás kulcsait:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Ellenőrizze az index sémáját:**
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

3. **Használjon kezelt identitást:**
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

## Konténeralkalmazás telepítési problémák

### Probléma: Konténer build sikertelen

**Tünetek:**
```
Error: Failed to build container image
```

**Megoldások:**

1. **Ellenőrizze a Dockerfile szintaxisát:**
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

2. **Ellenőrizze a függőségeket:**
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

3. **Adjon hozzá egészségügyi ellenőrzést:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Probléma: Konténeralkalmazás indítási hibák

**Tünetek:**
```
Error: Container failed to start within timeout period
```

**Megoldások:**

1. **Növelje az indítási időkorlátot:**
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

2. **Optimalizálja a modell betöltését:**
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

## Hitelesítési és jogosultsági hibák

### Probléma: Kezelt identitás jogosultság megtagadva

**Tünetek:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Megoldások:**

1. **Ellenőrizze a szerepkiosztásokat:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Rendeljen hozzá szükséges szerepköröket:**
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

3. **Tesztelje a hitelesítést:**
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

A token beszerzése bizonyítja a hitelesítést, nem pedig a modell meghívásának jogosultságát. Tesztelje külön a kívánt műveletet. Lokálisan a `DefaultAzureCredential` fejlesztői hitelesítést használhat; Azure-ban ellenőrizze, hogy a megfelelő kezelt identitás van-e kiválasztva.

### Probléma: Key Vault hozzáférés megtagadva

**Tünetek:**
```
Error: The user, group or application does not have secrets get permission
```

**Megoldások:**

1. **Adjon meg Key Vault jogosultságokat:**

Az alábbi hozzáférési szabály részt csak olyan tárolóhoz használja, amely `enableRbacAuthorization: false`. RBAC engedélyezett tároló esetén használja a 2. opciót; az hozzáférési szabály hozzáadása nem biztosít adat-plane hozzáférést RBAC módban.
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

2. **Használjon RBAC-ot hozzáférési szabályok helyett:**

A tárolónak `enableRbacAuthorization: true` kell, hogy legyen; a jogosultságmodell változtatása meglévő hozzáférési migrációt igényel.
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

## Modell telepítési hibák

### Probléma: Modell verzió nem elérhető

**Tünetek:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Megoldások:**

1. **Ellenőrizze az elérhető modelleket:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Válasszon kifejezetten egy elérhető modellt:**
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

3. **Érvényesítse a modellt telepítés előtt:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Teljesítmény- és skálázási problémák

### Probléma: Magas késleltetésű válaszok

**Tünetek:**
- Válaszidők > 30 másodperc
- Időtúllépés hibák
- Rossz felhasználói élmény

**Megoldások:**

1. **Valósítson meg lekérdezési időkorlátokat:**
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

2. **Adjon hozzá válasz gyorsítótárazást:**
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

3. **Állítson be automatikus skálázást:**
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

### Probléma: Memória kifogyott hibák

**Tünetek:**
```
Error: Container killed due to memory limit exceeded
```

**Megoldások:**

1. **Növelje a memória allokációt:**
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

2. **Optimalizálja a memóriahasználatot:**
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

## Költség- és kvótagazdálkodás

### Probléma: Váratlan magas költségek

**Tünetek:**
- Azure számla a vártnál magasabb
- Token felhasználás meghaladja az előrejelzéseket
- Költségvetési riasztások aktiválódtak

**Megoldások:**

1. **Valósítson meg költségkontrollokat:**
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

Ez a memóriabeli számláló szemléltető jellegű, nem havi kiadási kontroll: újraindításkor nullázódik, nem osztott replikák között, és lekérések után ellenőrzi a használatot. Egy valódi limitnek tartós elszámolásra, egyidejűleg biztonságos foglalásokra és havi reset szabályra van szüksége. A konténer memória metrikákra figyelni kell az cgroup limitet is; `psutil.virtual_memory()` nem megbízható konténer-limit mérés, és a szemétgyűjtés nem kényszerít memóriakorlátot.

2. **Állítson be költségriasztásokat:**
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

Deklarálja `budgetStartDate` és `budgetEndDate` a sablonban. A költségvetések riasztanak; nem állítanak le erőforrásokat vagy nem szabnak kemény kiadási plafont.

3. **Optimalizálja a modell választást:**
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

## Hibakereső eszközök és technikák

### AZD hibakereső parancsok

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

### AZD AI bővítmény parancsai diagnosztikához

Ha `azd ai agent init` segítségével telepített ügynököket, ezek a további eszközök rendelkezésre állnak:

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

> **Tipp:** Használja `azd infra generate`, hogy az IaC-t lemezre írja, így pontosan megtekintheti, milyen erőforrásokat hoztak létre. Ez felbecsülhetetlen értékű a konfigurációs hibák hibakeresésekor. Lásd a [AZD AI CLI referencia](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) teljes részleteiért.

**Verziótól függő diagnosztika (2026-11-04):** A `1.0.0-beta.23` ügynök `azd >= 1.37.0`-t követel meg; frissítse az alap CLI-t az inkompatibilis bővítmények előtt. Ez az ügynök verzió megőrzi a fejlesztői RBAC figyelmeztetéseket a végső telepítési kimenetben, és azonosítja az aktiválási hibák/időtúllépések során érintett verziót. Az időtúllépés nem jelenti a telepítés sikertelenségét: ellenőrizze a kipróbált verziót újrapróbálás előtt. Javítja továbbá az A2A 0.3 hívásoknál az életciklus üzenetek megjelenítését a befejezett válaszok helyett. Az alap `azd 1.37.1` javítja a megszakítás terjedését bővítmények között; `1.37.2` jobb kritikus telepítési visszaigazolást és megszakítás kezelést biztosít.

Ha egy régebbi oktatóanyag értékelési parancsa csak migrációs útmutatót nyomtat ki, telepítse a `azure.ai.evaluations` (`1.0.0-beta.2`-hoz szükséges a `azd >= 1.33.0`) és használja a `azd ai eval init`, `generate` és `run start`-et. Az optimalizálás `--config` már nem fogad el régi értékelési fájlokat. Lásd a [értékelési migráció](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) és az [optimalizálási migráció](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration) útmutatókat.

### Alkalmazás hibakeresése

1. **Strukturált naplózás:**
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

2. **Egészségügyi ellenőrző végpontok:**
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

3. **Teljesítményfigyelés:**
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

## Gyakori hibakódok és megoldások

| Hibakód | Leírás | Megoldás |
|------------|-------------|----------|
| 401 | Jogosulatlan | Ellenőrizze az API kulcsokat és a kezelt identitás beállításait |
| 403 | Tiltott | Ellenőrizze az RBAC szerep-hozzárendeléseket |
| 429 | Korlátozott lekérések száma | Valósítson meg újrapróbálkozási logikát exponenciális visszaállással |
| 500 | Belső szerverhiba | Ellenőrizze a modell telepítésének állapotát és a naplókat |
| 503 | Szolgáltatás nem elérhető | Ellenőrizze a szolgáltatás állapotát és a régiós elérhetőséget |

## Következő lépések

1. **Tekintse át az [AI modell telepítési útmutatót](../chapter-02-ai-development/ai-model-deployment.md)** a legjobb gyakorlatokért a telepítéshez
2. **Fejezze be a [Production AI Practices](../chapter-08-production/production-ai-practices.md)** tananyagot az vállalati szintű megoldásokhoz
3. **Csatlakozzon a [Microsoft Foundry Discord közösséghez](https://aka.ms/foundry/discord)** közösségi támogatásért
4. **Jelentsen problémákat** az [AZD GitHub tárolóban](https://github.com/Azure/azure-dev) az AZD-specifikus kérdésekhez

## Források

- [Azure OpenAI kvóta és korlátozás hibakeresése](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps hibakeresése](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search hibakeresése](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Telepítse az Azure hibakeresési képességeket a szerkesztőjébe: `npx skills add microsoft/github-copilot-for-azure`

---

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibák elhárítása
- **⬅️ Előző**: [Hibakeresési útmutató](debugging.md)
- **➡️ Következő fejezet**: [8. fejezet: Gyártási és vállalati minták](../chapter-08-production/production-ai-practices.md)
- **🤖 Kapcsolódó**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referencia**: [Azure Developer CLI hibakeresés](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->