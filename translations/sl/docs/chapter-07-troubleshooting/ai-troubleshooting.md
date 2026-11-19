# Vodnik za odpravljanje težav specifičnih za AI

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje**: [Vodnik po razhroščevanju](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Vzorce proizvodnje in podjetij](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavje 2: AI-prvi razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ta obsežen vodnik za odpravljanje težav obravnava pogoste težave pri uvajanju AI rešitev z AZD in nudi rešitve ter tehnike za razhroščevanje, specifične za Azure AI storitve.

> **Obseg:** Ukazi uporabljajo primerne imenske oznake virov; zamenjajte jih in izberite pravi naročniški račun. Bicep bloki so odlomki, ki jih je treba vključiti v obstoječo predlogo, niso samostojni nasveti za uvajanje. Python odseki zahtevajo navedene SDK-je in konfiguracijo aplikacije. Za to pregledovanje ni bilo izvedeno dejansko uvajanje v Azure.

## Kazalo

- [Težave s storitvijo Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Težave z iskanjem Azure AI](#azure-ai-search-problems)
- [Težave z uvajanjem Container Apps](#container-apps-deployment-issues)
- [Napake pri avtentikaciji in dovoljenjih](#authentication-and-permission-errors)
- [Napake pri uvajanju modela](#model-deployment-failures)
- [Težave z zmogljivostjo in skaliranjem](#performance-and-scaling-issues)
- [Upravljanje stroškov in kvot](#cost-and-quota-management)
- [Orodja in tehnike za razhroščevanje](#debugging-tools-and-techniques)

## Težave s storitvijo Microsoft Foundry Models

### Težava: Storitev OpenAI ni na voljo v regiji

**Simptomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Vzroki:**
- Microsoft Foundry Models ni na voljo v izbrani regiji
- Kvota je v priljubljenih regijah porabljena
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
Uporabite delovni tok upravljanja kvote v portalu Foundry za prizadeti naročniški račun, regijo, model in tip uvajanja. Glejte [uradna navodila za kvote](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Zahteva za VM kvoto ne poveča kvote modela.

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

### Težava: Neveljavna verzija API-ja

**Simptomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rešitve:**

1. **Uporabite podprto verzijo API-ja:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Preverite združljivost različice API-ja:**
Preverite [referenco življenjskega cikla Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM različice API-ja ponudnikov virov **ne** vključujejo različic API-ja za inferenčni/podatkovni sloj. Novi odjemalci v1 uporabljajo `/openai/v1/` brez datiranega `api-version`; ne mešajte dveh konfiguracij odjemalcev.

## Težave z iskanjem Azure AI

### Težava: Nezadostna raven cenovni storitve iskanja

**Simptomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Rešitve:**

1. **Uporabite podprto cenovno raven:**

Semantični rangirnik zahteva Basic ali višjo raven. Prehod iz Free/Basic na drugo raven lahko zahteva ustvarjanje nove storitve iskanja in ponovno izgradnjo indeksov; urejanje SKU ni zagotovljena nadgradnja na mestu.
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

2. **Onemogočite semantično iskanje (razvoj):**
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

### Težava: Napake pri ustvarjanju indeksa

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

2. **Validirajte odvisnosti:**
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

### Težava: Napake pri zagonu Container App

**Simptomi:**
```
Error: Container failed to start within timeout period
```

**Rešitve:**

1. **Podaljšajte čas za zagon:**
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

## Napake pri avtentikaciji in dovoljenjih

### Težava: Dostop zavrnjen za upravljano identiteto

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

2. **Dodelite potrebne vloge:**
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

Pridobitev žetona dokazuje avtentikacijo, ne pa dovoljenja za klic modela. Ločeno preizkusite nameravano operacijo. Lokalno lahko `DefaultAzureCredential` uporablja razvijalske poverilnice; v Azure preverite, ali je izbrana pravilna upravljana identiteta.

### Težava: Zavrnjen dostop do Key Vault

**Simptomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Rešitve:**

1. **Dodelite dovoljenja za Key Vault:**

Uporabite spodnji fragment dostopne politike samo za zakladnico z `enableRbacAuthorization: false`. Za zakladnico z omogočenim RBAC uporabite možnost 2; dodajanje dostopne politike ne omogoča dostopa do podatkovnega sloja v načinu RBAC.
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

Zakladnica mora imeti `enableRbacAuthorization: true`; sprememba modelov dovoljenj zahteva načrtovano migracijo obstoječih dostopov.
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

## Napake pri uvajanju modela

### Težava: Verzija modela ni na voljo

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

2. **Izberite model, ki je na voljo, izrecno:**
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

3. **Validirajte model pred uvajanjem:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Težave z zmogljivostjo in skaliranjem

### Težava: Visoka zakasnitev odgovorov

**Simptomi:**
- Časi odziva > 30 sekund
- Napake zaradi časovne omejitve
- Slaba uporabniška izkušnja

**Rešitve:**

1. **Implementirajte časovne omejitve zahtevkov:**
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

2. **Dodajte predpomnjenje odgovorov:**
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

### Težava: Napake zaradi pomanjkanja pomnilnika

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
- Račun za Azure višji od pričakovanega
- Uporaba žetonov presega ocene
- Aktivirani proračunski opozorilniki

**Rešitve:**

1. **Implementirajte kontrolnike stroškov:**
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

Ta števec v pomnilniku je ilustrativen, ni mesečni nadzor porabe: ponastavi se ob ponovnem zagonu, ni deljen med replike in preverja uporabo šele po klicu. Resnična omejitev zahteva trajno računovodstvo, rezervacije, varne za večopravilnost pred zahtevki ter politiko mesečne ponastavitve. Meritve pomnilnika kontejnerja morajo upoštevati tudi cgroup omejitve; `psutil.virtual_memory()` ni zanesljiva mera omejitve kontejnerja in zbiranje smeti ne uveljavlja omejitve pomnilnika.

2. **Nastavite opozorila glede stroškov:**
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

Določite `budgetStartDate` in `budgetEndDate` v vaši predlogi. Proračuni obveščajo; ne ustavijo virov ali ne uvedejo stroge omejitve porabe.

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

## Orodja in tehnike za razhroščevanje

### Ukazi za razhroščevanje AZD

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

Če ste namestili agente z `azd ai agent init`, so na voljo naslednja dodatna orodja:

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

> **Namig:** Uporabite `azd infra generate`, da zapišete IaC na disk in si natančno ogledate, kateri viri so bili ustvarjeni. To je neprecenljivo pri odpravljanju težav z nastavitvijo virov. Glejte [referenco AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za popolne podrobnosti.

**Diagnosticiranje delovnega toka GA (2026-11-09):** Preverite, da je `azd version` vsaj različice 1.37.0 in pregledajte `azd ext list --installed`. Najprej posodobite jedrni CLI z `azd update` ali njegovim namestitvenim programom, nato posodobite paket z `azd ext upgrade microsoft.foundry`. Pri lokalnih napakah preverite trenutno verzijo uv, Python 3.13+ za osnovni vzorec, `PYTHONNOUSERSITE: "1"` v konfiguraciji storitve in poverilnice Azure, ki jih uporablja `DefaultAzureCredential`. Pustite `azd ai agent run` zagnan med klicanjem `--local` iz drugega terminala v imeniku projekta.

Uspešno uvajanje ne dokazuje, da ima razvijalec dostop do podatkovnega sloja. Preverite opozorila RBAC in [matrico dovoljenj gostitelj-agentov](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Časovna omejitev ne pomeni neuspeha uvajanja: najprej preglejte poskušano različico in dnevnike pred ponovnim poskusom. Prejšnji agenti beta.23 so izboljšali ta opozorila in izhod A2A; te zgodovinske popravke so opisane v [opombah k izdaji](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), niso pa pogoj za namestitev te bete.

Če `azd ai eval` ni na voljo, namestite `azure.ai.evaluations` ločeno; paket GA ga ne vključuje. Če starejši vodnik uporablja ukaz agent-evaluation, ki samo izpiše navodila za migracijo, uporabite ločen delovni tok `azd ai eval`. Optimizacijski `--config` ne sprejema več starih evalvacijskih datotek. Glejte [migracijo evalvacije](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) in [migracijo optimizacije](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Razhroščevanje aplikacij

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
| 401 | Neavtoriziran | Preverite API ključe in konfiguracijo upravljane identitete |
| 403 | Prepovedano | Preverite dodelitve vlog RBAC |
| 429 | Omejitev hitrosti | Implementirajte logiko ponovnih poskusov z eksponentno povratno zanko |
| 500 | Notranja napaka strežnika | Preverite stanje uvajanja modela in dnevnike |
| 503 | Storitev ni na voljo | Preverite zdravje storitve in regionalno razpoložljivost |

## Naslednji koraki

1. **Preglejte [Vodnik za uvajanje AI modelov](../chapter-02-ai-development/ai-model-deployment.md)** za najboljše prakse uvajanja
2. **Dokončajte [Prakse za proizvodni AI](../chapter-08-production/production-ai-practices.md)** za rešitve pripravljenih za podjetja
3. **Pridružite se [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** za podporo skupnosti
4. **Pošljite težave** v [repozitorij AZD na GitHubu](https://github.com/Azure/azure-dev) za specifične težave z AZD

## Viri

- [Odpravljanje težav kvote in omejitev Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Odpravljanje težav Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Odpravljanje težav Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Namestite veščine za odpravljanje težav Azure v vaš urejevalnik: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje**: [Vodnik po razhroščevanju](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Vzorce proizvodnje in podjetij](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavje 2: AI-prvi razvoj](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Odpravljanje težav Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->