# AI-specifikus Hibakeresési Útmutató

**Fejezet navigáció:**
- **📚 Tanfolyam kezdőlapja**: [AZD Kezdőknek](../../README.md)
- **📖 Jelenlegi fejezet**: 7. fejezet - Hibakeresés és Hibajavítás
- **⬅️ Előző**: [Hibajavítási Útmutató](debugging.md)
- **➡️ Következő fejezet**: [8. fejezet: Gyártás és Vállalati Minták](../chapter-08-production/production-ai-practices.md)
- **🤖 Kapcsolódó**: [2. fejezet: AI-első Fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ez az átfogó hibakeresési útmutató a leggyakoribb problémákat tárgyalja az AZD-vel történő AI-megoldások telepítésekor, megoldásokat és hibakeresési technikákat biztosítva, amelyek az Azure AI szolgáltatásokra szabottak.

> **Hatály:** A parancsok példa erőforrásneveket használnak; cserélje ki ezeket, és válassza ki a megfelelő előfizetést. A Bicep blokkok töredékek, melyeket egy meglévő sablonhoz kell illeszteni, nem önálló telepítések. A Python példakódokhoz szükségesek a megadott SDK-k és az alkalmazás konfigurációja. Ehhez a áttekintéshez nem történt élő Azure telepítés.

## Tartalomjegyzék

- [Microsoft Foundry Modellek Szolgáltatás Problémái](#microsoft-foundry-models-service-issues)
- [Azure AI Keresési Problémák](#azure-ai-search-problems)
- [Konténeres Alkalmazások Telepítési Problémái](#container-apps-deployment-issues)
- [Hitelesítési és Engedélyezési Hibák](#authentication-and-permission-errors)
- [Modell Telepítési Sikertelenségek](#model-deployment-failures)
- [Teljesítmény és Skálázási Problémák](#performance-and-scaling-issues)
- [Költség- és Kvóta Kezelés](#cost-and-quota-management)
- [Hibakeresési Eszközök és Technikák](#debugging-tools-and-techniques)

## Microsoft Foundry Modellek Szolgáltatás Problémái

### Probléma: OpenAI Szolgáltatás Nem Elérhető a Régióban

**Tünetek:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Okok:**
- A Microsoft Foundry Modellek nem elérhetők a kiválasztott régióban
- Kvóta kimerült a preferált régiókban
- Regionális kapacitáskorlátozások

**Megoldások:**

1. **Ellenőrizze a Régió Elérhetőségét:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Frissítse az AZD Konfigurációt:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Használjon Alternatív Régiókat:**
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

### Probléma: Modell Telepítési Kvóta Túllépve

**Tünetek:**
```
Error: Deployment failed due to insufficient quota
```

**Megoldások:**

1. **Ellenőrizze az Aktuális Kvótát:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Kérjen Kvóta Növelést:**
Használja a Foundry portál kvóta-kezelési folyamatát az érintett előfizetésre, régióra, modellre és telepítési típusra. Lásd a [hivatalos kvóta útmutatót](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Egy VM kvóta-kérelem nem növeli a modell kvótát.

3. **Optimalizálja a Modell Kapacitását:**
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

### Probléma: Érvénytelen API Verzió

**Tünetek:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Megoldások:**

1. **Használjon Támogatott API Verziót:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Ellenőrizze az API Verzió Kompatibilitását:**
Ellenőrizze az [Azure OpenAI API életciklus hivatkozását](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Az ARM erőforrás-szolgáltató API verziók **nem** sorolják fel az inferencia/adat-sík API verziókat. Az új v1 kliens `/openai/v1/` használatával dolgozik, dátum nélküli `api-version` nélkül; ne keverje a két kliens konfigurációt.

## Azure AI Keresési problémák

### Probléma: Keresési Szolgáltatás Árazási Szintje Nem Megfelelő

**Tünetek:**
```
Error: Semantic search requires Basic tier or higher
```

**Megoldások:**

1. **Használjon Támogatott Árazási Szintet:**

A szemantikus rangsorolóhoz Basic vagy magasabb szükséges. Az ingyenes/basic szintről másik szintre váltás új keresési szolgáltatás készítését és indexek újraépítését igényelheti; egy SKU szerkesztése nem garantálja a helyben történő frissítést.
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

2. **A Szemantikus Keresés Letiltása (fejlesztéshez):**
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

### Probléma: Index Készítési Hibák

**Tünetek:**
```
Error: Cannot create index, insufficient permissions
```

**Megoldások:**

1. **Ellenőrizze a Keresési Szolgáltatás Kulcsait:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Ellenőrizze az Index Sémáját:**
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

3. **Használjon Felügyelt Identitást:**
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

## Konténeralkalmazások Telepítési Problémái

### Probléma: Konténer Build Hibák

**Tünetek:**
```
Error: Failed to build container image
```

**Megoldások:**

1. **Ellenőrizze a Dockerfile Szintaxisát:**
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

2. **Érvényesítse a Függőségeket:**
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

3. **Adjon Hálózati Ellenőrzést:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Probléma: Konténeralkalmazás Indulási Hibái

**Tünetek:**
```
Error: Container failed to start within timeout period
```

**Megoldások:**

1. **Növelje az Indulási Timeoutot:**
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

2. **Optimalizálja a Modell Betöltést:**
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

## Hitelesítési és Engedélyezési Hibák

### Probléma: Felügyelt Identitás Jogosultság Elutasítva

**Tünetek:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Megoldások:**

1. **Ellenőrizze a Szerepkör Hozzárendeléseket:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Rendelje Hozzá a Szükséges Szerepköröket:**
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

3. **Tesztelje a Hitelesítést:**
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

A token megszerzése hitelesítést igazol, nem pedig modellikíválasztási jogosultságot. Tesztelje külön a tervezett műveletet. Helyileg a `DefaultAzureCredential` fejlesztői hitelesítő adatait használhatja; az Azure-ban ellenőrizze a kiválasztott felügyelt identitást.

### Probléma: Key Vault Hozzáférés Elutasítva

**Tünetek:**
```
Error: The user, group or application does not have secrets get permission
```

**Megoldások:**

1. **Adjon Key Vault Engedélyeket:**

Az alábbi hozzáférési szabályzat részletet csak olyan kulcsszéfhez használja, amely rendelkezik `enableRbacAuthorization: false`-val. RBAC engedélyezett széf esetén használja a 2. opciót; a hozzáférési szabályzat hozzáadása nem biztosít adat-sík hozzáférést RBAC módban.
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

2. **RBAC Használata Hozzáférési Szabályzatok Helyett:**

A széfnek rendelkeznie kell `enableRbacAuthorization: true`-val; az engedélyezési modellek váltása tervszerű migrációt igényel a meglévő hozzáférésekről.
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

## Modell Telepítési Hibák

### Probléma: Modell Verzió Nem Elérhető

**Tünetek:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Megoldások:**

1. **Ellenőrizze az Elérhető Modelleket:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Explicit Válasszon Elérhető Modellt:**
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

3. **Validálja a Modellt Telepítés Előtt:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Teljesítmény és Méretezési Problémák

### Probléma: Magas Késleltetésű Válaszok

**Tünetek:**
- Válaszidők > 30 másodperc
- Timeout hibák
- Gyenge felhasználói élmény

**Megoldások:**

1. **Kérelmi Timeoutok Bevezetése:**
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

2. **Válasz Gyorsítótár Hozzáadása:**
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

3. **Automatikus Méretezés Konfigurálása:**
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

### Probléma: Memória Kimerülési Hibák

**Tünetek:**
```
Error: Container killed due to memory limit exceeded
```

**Megoldások:**

1. **Növelje a Memória Kiosztást:**
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

2. **Optimalizálja a Memória Használatot:**
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

## Költség- és Kvóta Kezelés

### Probléma: Váratlanul Magas Költségek

**Tünetek:**
- Az Azure számla magasabb a vártnál
- Token használat meghaladja a becsléseket
- Költségvetési riasztások aktiválva

**Megoldások:**

1. **Költségkontrollok Bevezetése:**
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

Ez az in-memory számláló szemléltető jellegű, nem havi költési kontroll: újraindításkor törlődik, nem oszlik meg replikák között, és csak hívás után ellenőrzi a használatot. Egy valódi korlát tartós elszámolást, párhuzamos foglalás biztonságos előzetes beállítását, és havi alapú nullázási szabályt igényel. A konténer memória metrikáknak is figyelembe kell venniük a cgroup korlátokat; `psutil.virtual_memory()` nem megbízható konténerkorlát mérő, és a szemétgyűjtés nem korlátozza a memóriahasználatot.

2. **Állítson be Költségi Figyelmeztetéseket:**
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

Deklarálja a `budgetStartDate` és `budgetEndDate` az sablonjában. A költségvetések értesítést küldenek; nem állítják le az erőforrásokat, és nem szabnak kemény költési plafont.

3. **Optimalizálja a Modellválasztást:**
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

## Hibakeresési Eszközök és Technikák

### AZD Hibakeresési Parancsok

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

### AZD AI Kiterjesztés Diagnosztikai Parancsok

Ha `azd ai agent init` segítségével telepített ügynököket, ezek az további eszközök elérhetők:

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

> **Tipp:** Használja a `azd infra generate`-t, hogy IaC-t írjon lemezre, így pontosan megvizsgálhatja, milyen erőforrásokat hoztak létre. Ez felbecsülhetetlen értékű erőforráskonfigurációs hibák hibakeresésekor. Lásd a [AZD AI CLI hivatkozást](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) a részletes információkért.

**GA munkafolyamat diagnosztika (2026-11-09):** Ellenőrizze, hogy `azd version` legalább 1.37.0 verziójú, és vizsgálja meg `azd ext list --installed`. Frissítse először a core CLI-t `azd update` vagy annak telepítőjével, majd frissítse a csomagot `azd ext upgrade microsoft.foundry` segítségével. Helyi hibák esetén ellenőrizze az aktuális uv-t, Python 3.13+-t az alapminta esetén, `PYTHONNOUSERSITE: "1"`-et a szolgáltatás konfigurációjában, és az Azure hitelesítő adatokat, amelyeket a `DefaultAzureCredential` használ. Tartsa `azd ai agent run` futásban, miközben a `--local`-t egy második terminálról hívja meg a projekt könyvtárban.

A sikeres előkészítés nem bizonyítja, hogy a fejlesztő rendelkezik adat-sík hozzáféréssel. Tekintse át az RBAC figyelmeztetéseket és a [hosztolt ügynök jogosultság mátrixot](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Egy timeout nem jelenti a telepítés sikertelenségét: ellenőrizze a próbált verziót és a naplókat ismétlés előtt. Korábbi ügynökök beta.23 verziójában javították ezeket a figyelmeztetéseket és az A2A kimenetet; ezek történeti javítások a [kiadási megjegyzésekben](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) vannak, és nem kötelező telepíteni azt a beta verziót.

Ha `azd ai eval` nem elérhető, telepítse külön `azure.ai.evaluations`-t; a GA csomag nem tartalmazza. Ha egy régebbi oktatóanyag ügynök-értékelési parancsa csak migrációs útmutatót jelenít meg, használja a külön `azd ai eval` munkafolyamatot. Az optimalizációs `--config` már nem fogadja el a régi értékelő fájlokat. Lásd [értékelési migrációt](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) és [optimalizációs migrációt](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Alkalmazás Hibakeresés

1. **Strukturált Naplózás:**
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

2. **Egészségügyi Ellenőrző Végpontok:**
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

3. **Teljesítmény Monitorozás:**
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

## Gyakori Hibakódok és Megoldások

| Hibakód | Leírás | Megoldás |
|------------|-------------|----------|
| 401 | Jogosulatlan | Ellenőrizze az API kulcsokat és a felügyelt identitás konfigurációját |
| 403 | Tiltott | Ellenőrizze az RBAC szerepkör hozzárendeléseket |
| 429 | Korlátozott sebesség | Vigye be az újrapróbálkozási logikát exponenciális visszalépéssel |
| 500 | Belső szerverhiba | Ellenőrizze a modell telepítési állapotot és naplókat |
| 503 | Szolgáltatás nem elérhető | Ellenőrizze a szolgáltatás egészségét és régiós elérhetőségét |

## Következő lépések

1. **Tekintse át az [AI Modell Telepítési Útmutatót](../chapter-02-ai-development/ai-model-deployment.md)** a telepítési bevált gyakorlatokért
2. **Teljesítse a [Produktionális AI Gyakorlatokat](../chapter-08-production/production-ai-practices.md)** vállalati szintű megoldásokért
3. **Csatlakozzon a [Microsoft Foundry Discordhoz](https://aka.ms/foundry/discord)** közösségi támogatásért
4. **Jelentsen problémákat** az [AZD GitHub tárolójában](https://github.com/Azure/azure-dev) AZD-specifikus gondok esetén

## Erőforrások

- [Azure OpenAI kvóta és korlátozás hibakeresés](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Konténeralkalmazások hibakeresése](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Keresés hibakeresése](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnosztikai Ügynök Képesség**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Telepítse az Azure hibakeresési képességeket szerkesztőjébe: `npx skills add microsoft/github-copilot-for-azure`

---

**Fejezet Navigáció:**
- **📚 Tanfolyam kezdőlap**: [AZD Kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és Hibaelhárítás
- **⬅️ Előző**: [Hibakeresési útmutató](debugging.md)
- **➡️ Következő fejezet**: [8. fejezet: Termelési és Vállalati Minták](../chapter-08-production/production-ai-practices.md)
- **🤖 Kapcsolódó**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Hivatkozás**: [Azure Fejlesztői CLI hibakeresés](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:
Ez a dokumentum az AI fordítási szolgáltatás, a [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével készült. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítások hibákat vagy pontatlanságokat tartalmazhatnak. Az eredeti dokumentum az anyanyelvén tekintendő hiteles forrásnak. Fontos információk esetén professzionális emberi fordítást javasolunk. Nem vállalunk felelősséget semmilyen félreértésért vagy téves értelmezésért, amely ebből a fordításból ered.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->