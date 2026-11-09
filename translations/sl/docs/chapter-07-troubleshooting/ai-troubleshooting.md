# Vodnik za odpravljanje težav specifičnih za AI

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in odpravljanje napak
- **⬅️ Prejšnje**: [Vodnik za odpravljanje napak](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Produkcijski in poslovni vzorci](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavje 2: Razvoj z AI na prvem mestu](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ta obsežen vodnik za odpravljanje težav obravnava pogoste težave pri uvajanju AI rešitev z AZD, z rešitvami in tehnikami odpravljanja napak, ki so specifične za Azure AI storitve.

> **Obseg:** Ukazi uporabljajo primerne imena sredstev; zamenjajte jih in izberite pravilno naročnino. Bicep bloki so fragmenti za združitev v obstoječi predlog, ne samostojne uvedbe. Python izrezki zahtevajo navedene SDK-je in konfiguracijo aplikacije. Za to oceno ni bilo izvedene žive Azure uvedbe.

## Kazalo

- [Težave s storitvijo Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Težave z Azure AI Search](#azure-ai-search-problems)
- [Težave z uvajanjem Container Apps](#container-apps-deployment-issues)
- [Težave z avtentikacijo in dovoljenji](#authentication-and-permission-errors)
- [Neuspehi uvajanja modelov](#model-deployment-failures)
- [Težave z zmogljivostjo in skaliranjem](#performance-and-scaling-issues)
- [Upravljanje stroškov in kvot](#cost-and-quota-management)
- [Orodja in tehnike za odpravljanje napak](#debugging-tools-and-techniques)

## Težave s storitvijo Microsoft Foundry Models

### Težava: Storitev OpenAI ni na voljo v regiji

**Simptomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Vzroki:**
- Microsoft Foundry Models ni na voljo v izbrani regiji
- Kvota porabljena v prednostnih regijah
- Regionalne omejitve zmogljivosti

**Rešitve:**

1. **Preverite razpoložljivost regije:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Posodobite konfiguracijo AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Uporabite alternativne regije:**
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

### Težava: Kvota za uvajanje modela presežena

**Simptomi:**
```
Error: Deployment failed due to insufficient quota
```

**Rešitve:**

1. **Preverite trenutno kvoto:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Zahtevajte povečanje kvote:**
Uporabite potek upravljanja kvot na portalu Foundry za prizadeto naročnino, regijo, model in vrsto uvajanja. Oglejte si [uradne smernice za kvote](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Zahteva za kvoto VM ne povečuje kvote modela.

3. **Optimizirajte zmogljivost modela:**
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

### Težava: Neveljavna različica API-ja

**Simptomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rešitve:**

1. **Uporabite podprto različico API-ja:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Preverite združljivost različice API-ja:**
Preverite [referenco življenjskega cikla Azure OpenAI API-ja](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM različice API-ja za ponudnike virov **ne** vključujejo različic inference/data-plane API-jev. Novi v1 odjemalci uporabljajo `/openai/v1/` brez datiranega `api-version`; ne mešajte obeh konfiguracij odjemalcev.

## Težave z Azure AI Search

### Težava: Nezadosten cenovni razred storitve iskanja

**Simptomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Rešitve:**

1. **Uporabite podprt cenovni razred:**

Semantični razvrščevalnik zahteva Basic ali višji razred. Prehod z brezplačnega/basic na drug razred morda zahteva ustvarjanje nove storitve iskanja in ponovno ustvarjanje indeksov; urejanje SKU-ja ni zagotovljena nadgradnja na mestu.
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

2. **Onemogočite semantično iskanje (za razvoj):**
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

### Težava: Napake pri ustvarjanju indeksov

**Simptomi:**
```
Error: Cannot create index, insufficient permissions
```

**Rešitve:**

1. **Preverite ključe storitve iskanja:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Preverite shemo indeksa:**
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

3. **Uporabite upravljano identiteto:**
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

## Težave z uvajanjem Container Apps

### Težava: Napake pri gradnji kontejnerja

**Simptomi:**
```
Error: Failed to build container image
```

**Rešitve:**

1. **Preverite sintakso Dockerfile:**
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

2. **Preverite odvisnosti:**
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

3. **Dodajte preverjanje zdravja:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Težava: Neuspehi zagona Container App

**Simptomi:**
```
Error: Container failed to start within timeout period
```

**Rešitve:**

1. **Povečajte čas za zagon:**
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

2. **Optimizirajte nalaganje modela:**
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

## Napake avtentikacije in dovoljenj

### Težava: Zavrnjen dostop upravljane identitete

**Simptomi:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Rešitve:**

1. **Preverite dodelitve vlog:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Dodelite zahtevane vloge:**
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

3. **Preizkusite avtentikacijo:**
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

Pridobitev žetona dokazuje avtentikacijo, ne pa dovoljenja za klic modela. Operacijo preizkusite posebej. Lokalno lahko `DefaultAzureCredential` uporablja razvijalske poverilnice; v Azure preverite, da je izbrana prava upravljana identiteta.

### Težava: Dostop do Key Vaulta zavrnjen

**Simptomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Rešitve:**

1. **Dodelite dovoljenja za Key Vault:**

Uporabite naslednji fragment dostopne politike samo za hranilnik z `enableRbacAuthorization: false`. Za hranilnik z omogočenim RBAC uporabite možnost 2; dodajanje dostopne politike ne omogoča dostopa do podatkovne ravni v načinu RBAC.
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

2. **Uporabite RBAC namesto dostopnih politik:**

Hranilnik mora imeti `enableRbacAuthorization: true`; sprememba modela dovoljenj zahteva načrtovano migracijo obstoječega dostopa.
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

## Neuspehi uvajanja modelov

### Težava: Različica modela ni na voljo

**Simptomi:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Rešitve:**

1. **Preverite razpoložljive modele:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Explicitno izberite razpoložljiv model:**
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

3. **Preverite model pred uvajanjem:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Težave z zmogljivostjo in skaliranjem

### Težava: Visoke zakasnitve odzivov

**Simptomi:**
- Čas odziva > 30 sekund
- Napake zaradi časovne omejitve
- Slaba uporabniška izkušnja

**Rešitve:**

1. **Implementirajte časovne omejitve zahtev:**
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

2. **Dodajte predpomnjenje odzivov:**
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

3. **Konfigurirajte samodejno skaliranje:**
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

### Težava: Napake zaradi pomnilniške omejitve

**Simptomi:**
```
Error: Container killed due to memory limit exceeded
```

**Rešitve:**

1. **Povečajte dodeljeni pomnilnik:**
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

2. **Optimizirajte uporabo pomnilnika:**
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

## Upravljanje stroškov in kvot

### Težava: Nepričakovano visoki stroški

**Simptomi:**
- Višji račun Azure od pričakovanega
- Poraba žetonov presega ocene
- Aktivirane so proračunske opozorila

**Rešitve:**

1. **Implementirajte kontrole stroškov:**
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

Ta števec v pomnilniku je ilustrativen, ne mesečni nadzor porabe: ponastavi se ob ponovnem zagonu, ni deljen med kopijami in preverja porabo le po klicu. Prava omejitev zahteva trajno računovodstvo, varne rezervacije pred zahtevami in mesečno politiko ponastavitve. Meritve pomnilnika kontejnerja morajo upoštevati tudi omejitve cgroup; `psutil.virtual_memory()` ni zanesljiva meritve omejitve kontejnerja, zbiranje smeti pa ne uveljavlja omejitve pomnilnika.

2. **Nastavite opozorila o stroških:**
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

Določite `budgetStartDate` in `budgetEndDate` v svojem predlogu. Proračuni obveščajo; ne zaustavijo virov ali ne postavljajo strogega proračunskega limita.

3. **Optimizirajte izbiro modela:**
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

## Orodja in tehnike za odpravljanje napak

### Ukazi za odpravljanje napak AZD

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

### Ukazi razširitve AZD AI za diagnostiko

Če ste uvedli agente z uporabo `azd ai agent init`, so na voljo dodatna orodja:

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

> **Namig:** Uporabite `azd infra generate` za zapis IaC na disk, da lahko natančno pregledate, kateri viri so bili vzpostavljeni. To je neprecenljivo pri odpravljanju težav s konfiguracijo virov. Oglejte si [referenco AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za podrobnosti.

**Diagnostika, ki pozna izdajo (2026-11-04):** Agenti `1.0.0-beta.23` zahtevajo `azd >= 1.37.0`; nadgradite jedrni CLI pred nezdružljivimi razširitvami. Ta izdaja agentov ohranja opozorila RBAC razvijalcev v končnem poročilu uvedbe in identificira različico, vključeno v neuspehe aktivacije/čase poteka. Časovna omejitev ne pomeni, da je uvedba spodletela: pred ponovnim poskusom preverite različico poskusa. Prav tako popravlja prikazovanje življenjskih sporočil namesto dokončanih odgovorov pri klicih A2A 0.3. Jedro `azd 1.37.1` odpravlja preklic propagacije med razširitvami; `1.37.2` izboljšuje ključna potrjevanja uvedbe in obravnavo preklicev.

Če ukaz ocenjevanja starega vodnika le izpiše navodila za migracijo, namestite `azure.ai.evaluations` (`1.0.0-beta.2` zahteva `azd >= 1.33.0`) in uporabite `azd ai eval init`, `generate` in `run start`. Optimizacija `--config` ne sprejema več starih datotek za ocenjevanje. Oglejte si [migracijo ocenjevanja](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) in [migracijo optimizacije](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Odpravljanje napak v aplikaciji

1. **Strukturirano beleženje:**
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

2. **Končne točke za preverjanje zdravja:**
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

3. **Nadzor zmogljivosti:**
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

## Pogoste kode napak in rešitve

| Koda napake | Opis | Rešitev |
|------------|-------------|----------|
| 401 | Neavtoriziran | Preverite ključe API in konfiguracijo upravljane identitete |
| 403 | Prepovedano | Preverite dodelitve RBAC vlog |
| 429 | Omejena hitrost | Uvedite logiko ponovnega poskusa z eksponentno zakasnitvijo |
| 500 | Notranja napaka strežnika | Preverite stanje uvajanja modela in dnevniške zapise |
| 503 | Storitev ni na voljo | Preverite zdravje storitve in regionalno razpoložljivost |

## Naslednji koraki

1. **Preglejte [Vodnik za uvajanje AI modelov](../chapter-02-ai-development/ai-model-deployment.md)** za najboljše prakse uvajanja
2. **Zaključite [Prakse proizvodnje AI](../chapter-08-production/production-ai-practices.md)** za rešitve pripravljene na podjetja
3. **Pridružite se [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** za podporo skupnosti
4. **Pošljite težave** v [AZD GitHub repozitorij](https://github.com/Azure/azure-dev) za težave specifične za AZD

## Viri

- [Odpravljanje težav s kvotami in omejevanjem Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Odpravljanje težav Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Odpravljanje težav Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Skill za Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Namestite veščine za odpravljanje težav v urejevalnik: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD Za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in odpravljanje napak
- **⬅️ Prejšnje**: [Vodnik za odpravljanje napak](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Produkcijski in poslovni vzorci](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavje 2: Razvoj z AI na prvem mestu](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referenca**: [Odpravljanje težav Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->