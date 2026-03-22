# AI-specifikus hibakeresési útmutató

**Fejezet navigáció:**
- **📚 Kurzus főoldal**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibaelhárítás
- **⬅️ Előző**: [Hibakeresési útmutató](debugging.md)
- **➡️ Következő fejezet**: [8. fejezet: Termelési és vállalati minták](../chapter-08-production/production-ai-practices.md)
- **🤖 Kapcsolódó**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ez az átfogó hibakeresési útmutató a leggyakoribb problémákat kezeli az AI-megoldások AZD-vel történő telepítésekor, az Azure AI szolgáltatásokra szabott megoldásokat és hibakeresési technikákat kínálva.

## Tartalomjegyzék

- [Microsoft Foundry Models szolgáltatás problémák](#azure-openai-service-issues)
- [Azure AI Search problémák](#azure-ai-search-problémák)
- [Container Apps telepítési problémák](#container-apps-telepítési-problémák)
- [Hitelesítési és jogosultsági hibák](#hitelesítési-és-jogosultsági-hibák)
- [Modell telepítési hibák](#modell-telepítési-hibák)
- [Teljesítmény és skálázási problémák](#teljesítmény-és-skálázási-problémák)
- [Költség- és kvóta kezelés](#költség-és-kvóta-kezelés)
- [Hibakeresési eszközök és technikák](#hibakeresési-eszközök-és-technikák)

## Microsoft Foundry Models szolgáltatás problémák

### Probléma: OpenAI szolgáltatás nem elérhető a régióban

**Tünetek:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Oka:**
- Microsoft Foundry Models nem elérhető a kiválasztott régióban
- Kvóta kimerült a preferált régiókban
- Regionális kapacitáskorlátok

**Megoldások:**

1. **Ellenőrizze a régió elérhetőségét:**
```bash
# Elérhető régiók listázása az OpenAI számára
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Frissítse az AZD konfigurációt:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Használjon alternatív régiókat:**
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

### Probléma: Modell telepítési kvóta túllépve

**Tünetek:**
```
Error: Deployment failed due to insufficient quota
```

**Megoldások:**

1. **Ellenőrizze az aktuális kvótát:**
```bash
# Ellenőrizze a kvóta használatát
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Kérjen kvótaemelést:**
```bash
# Küldje be a kvóta növelési kérelmet
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimalizálja a modell kapacitását:**
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

### Probléma: Érvénytelen API verzió

**Tünetek:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Megoldások:**

1. **Használjon támogatott API verziót:**
```python
# Használja a legfrissebb támogatott verziót
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Ellenőrizze az API verzió kompatibilitását:**
```bash
# Felsorolja a támogatott API verziókat
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search problémák

### Probléma: Keresési szolgáltatás árképzési szintje nem elegendő

**Tünetek:**
```
Error: Semantic search requires Basic tier or higher
```

**Megoldások:**

1. **Frissítse az árképzési szintet:**
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

### Probléma: Index létrehozási hibák

**Tünetek:**
```
Error: Cannot create index, insufficient permissions
```

**Megoldások:**

1. **Ellenőrizze a keresési szolgáltatás kulcsait:**
```bash
# Keresési szolgáltatás adminisztrátori kulcsának lekérése
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Ellenőrizze az index sémát:**
```python
# Érvényesítse az index sémát
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

3. **Használjon kezelhető identitást:**
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

## Container Apps telepítési problémák

### Probléma: Konténer build hibák

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Adjon hozzá egészségügyi ellenőrzést:**
```python
# main.py - Egészségügyi ellenőrző végpont hozzáadása
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Probléma: Container App indítási hibák

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

2. **Optimalizálja a modell betöltését:**
```python
# Modelleket lustán töltsünk be az indítási idő csökkentése érdekében
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
        # Itt inicializáljuk az MI klienset
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Indítás
    app.state.model_manager = ModelManager()
    yield
    # Leállítás
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

1. **Ellenőrizze a szerepkör-hozzárendeléseket:**
```bash
# Ellenőrizze az aktuális szerepkiosztásokat
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Rendelje hozzá a szükséges szerepköröket:**
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
# Kezelt azonosító hitelesítés tesztelése
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

### Probléma: Key Vault hozzáférés megtagadva

**Tünetek:**
```
Error: The user, group or application does not have secrets get permission
```

**Megoldások:**

1. **Adjon Key Vault jogosultságokat:**
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
# Elérhető modellek listázása
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Használjon modell fallbackeket:**
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

3. **Érvényesítse a modellt telepítés előtt:**
```python
# A modell élesítés előtti ellenőrzése
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

## Teljesítmény és skálázási problémák

### Probléma: Magas késleltetésű válaszok

**Tünetek:**
- Válaszidők > 30 másodperc
- Időtúllépési hibák
- Rossz felhasználói élmény

**Megoldások:**

1. **Valósítson meg kérés időkorlátokat:**
```python
# Állítsa be a megfelelő időkorlátokat
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
# Redis gyorsítótár a válaszokhoz
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

3. **Állítsa be az automatikus skálázást:**
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

### Probléma: Memória kifogyási hibák

**Tünetek:**
```
Error: Container killed due to memory limit exceeded
```

**Megoldások:**

1. **Növelje a memória kiosztást:**
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
# Memóriahatékony modellkezelés
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Ellenőrizze a memóriahasználatot feldolgozás előtt
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Erőltetett szemétgyűjtés
            
        result = await self._process_ai_request(request)
        
        # Feldolgozás utáni takarítás
        gc.collect()
        return result
```

## Költség- és kvóta kezelés

### Probléma: Váratlan magas költségek

**Tünetek:**
- Az Azure számla a vártnál magasabb
- Tokenhasználat meghaladja az előrejelzéseket
- Költségkeret figyelmeztetések aktiválódtak

**Megoldások:**

1. **Valósítson meg költségkontrollokat:**
```python
# Tokenhasználat nyomon követése
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

2. **Állítson be költségfigyelmeztetéseket:**
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

3. **Optimalizálja a modell kiválasztását:**
```python
# Költségtudatos modellválasztás
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # 1K tokenenként
    'gpt-4.1': 0.03,          # 1K tokenenként
    'gpt-35-turbo': 0.0015  # 1K tokenenként
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

## Hibakeresési eszközök és technikák

### AZD hibakeresési parancsok

```bash
# Verbózus naplózás engedélyezése
azd up --debug

# Telepítési állapot ellenőrzése
azd show

# Alkalmazás naplóinak megtekintése (megnyitja a megfigyelő műszerfalat)
azd monitor --logs

# Élő metrikák megtekintése
azd monitor --live

# Környezeti változók ellenőrzése
azd env get-values
```

### AZD AI kiterjesztés parancsok diagnosztikához

Ha az `azd ai agent init` használatával telepített ügynököket, további eszközök érhetők el:

```bash
# Győződjön meg róla, hogy az ügynök bővítmény telepítve van
azd extension install azure.ai.agents

# Egy ügynök újrainicializálása vagy frissítése egy manifestből
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Használja az MCP szervert, hogy az AI eszközök lekérdezhessék a projekt állapotát
azd mcp start

# Infrastrukturális fájlok generálása átvizsgálás és audit céljából
azd infra generate
```

> **Tipp:** Használja az `azd infra generate` parancsot IaC leírás mentésére, így pontosan megvizsgálhatja, milyen erőforrásokat hoztak létre. Ez felbecsülhetetlen értékű hibakereséskor erőforrás-konfigurációs problémák esetén. Részletekért lásd az [AZD AI CLI referencia](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) fejezetet.

### Alkalmazás hibakeresése

1. **Strukturált naplózás:**
```python
import logging
import json

# Strukturált naplózás beállítása AI alkalmazásokhoz
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
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Ellenőrizze az OpenAI kapcsolatot
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Ellenőrizze a kereső szolgáltatást
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
| 401 | Nem jogosult | Ellenőrizze az API kulcsokat és a kezelt identitás konfigurációját |
| 403 | Tiltva | Ellenőrizze az RBAC szerepkör-hozzárendeléseket |
| 429 | Korlátozott kérési sebesség | Valósítson meg újrapróbálkozási logikát exponenciális visszalépéssel |
| 500 | Belső szerverhiba | Ellenőrizze a modell telepítés állapotát és a naplókat |
| 503 | Szolgáltatás nem elérhető | Ellenőrizze a szolgáltatás egészségét és a régiós elérhetőséget |

## Következő lépések

1. **Tekintse át az [AI Modell Telepítési Útmutatót](../chapter-02-ai-development/ai-model-deployment.md)** a telepítési legjobb gyakorlatokért
2. **Teljesítse a [Termelési AI Gyakorlatokat](../chapter-08-production/production-ai-practices.md)** vállalati szintű megoldásokért
3. **Csatlakozzon a [Microsoft Foundry Discord közösséghez](https://aka.ms/foundry/discord)** támogatásért
4. **Jelentse a problémákat** az [AZD GitHub tárolóban](https://github.com/Azure/azure-dev) AZD-specifikus kérdések esetén

## Források

- [Microsoft Foundry Models Szolgáltatás Hibakeresés](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Hibakeresés](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Hibakeresés](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) – Telepítse az Azure hibakeresési készségeket a szerkesztőjébe: `npx skills add microsoft/github-copilot-for-azure`

---

**Fejezet navigáció:**
- **📚 Kurzus főoldal**: [AZD kezdőknek](../../README.md)
- **📖 Aktuális fejezet**: 7. fejezet - Hibakeresés és hibaelhárítás
- **⬅️ Előző**: [Hibakeresési útmutató](debugging.md)
- **➡️ Következő fejezet**: [8. fejezet: Termelési és vállalati minták](../chapter-08-production/production-ai-practices.md)
- **🤖 Kapcsolódó**: [2. fejezet: AI-első fejlesztés](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referencia**: [Azure Developer CLI hibakeresés](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Jogi nyilatkozat**:  
Ezt a dokumentumot az AI fordító szolgáltatás [Co-op Translator](https://github.com/Azure/co-op-translator) segítségével fordítottuk. Bár az pontosságra törekszünk, kérjük, vegye figyelembe, hogy az automatikus fordítás hibákat vagy pontatlanságokat tartalmazhat. Az eredeti dokumentum az anyanyelvén tekintendő hivatalos forrásnak. Kritikus információk esetén szakmai emberi fordítást javaslunk. Nem vállalunk felelősséget a fordítás használatából eredő félreértésekért vagy félreértelmezésekért.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->