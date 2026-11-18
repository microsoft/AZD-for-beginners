# Vodič za specifično rješavanje problema s AI-jem

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Rješavanje problema i ispravljanje pogrešaka
- **⬅️ Prethodno**: [Vodič za ispravljanje pogrešaka](debugging.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 8: Obrasci za proizvodnju i razinu poduzeća](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavlje 2: AI-prvo razvijanje](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ovaj opsežni vodič za rješavanje problema obrađuje uobičajene poteškoće pri implementaciji AI rješenja pomoću AZD-a, pružajući rješenja i tehnike ispravljanja pogrešaka specifične za Azure AI usluge.

> **Opseg:** Naredbe koriste primjere imena resursa; zamijenite ih i odaberite ispravan pretplatu. Bicep blokovi su fragmenti za spajanje u postojeći predložak, ne samostalne implementacije. Python primjeri zahtijevaju navedene SDK-ove i konfiguraciju aplikacije. Nije izvršena stvarna Azure implementacija za ovu recenziju.

## Sadržaj

- [Problemi s Microsoft Foundry Models Service](#microsoft-foundry-models-service-issues)
- [Problemi sa Azure AI Search](#azure-ai-search-problems)
- [Problemi s implementacijom Container Apps](#container-apps-deployment-issues)
- [Pogreške autentikacije i dopuštenja](#authentication-and-permission-errors)
- [Neuspjesi implementacije modela](#model-deployment-failures)
- [Problemi s izvedbom i skaliranjem](#performance-and-scaling-issues)
- [Upravljanje troškovima i kvotama](#cost-and-quota-management)
- [Alati i tehnike za ispravljanje pogrešaka](#debugging-tools-and-techniques)

## Problemi s Microsoft Foundry Models Service

### Problem: OpenAI usluga nije dostupna u regiji

**Simptomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Uzroci:**
- Microsoft Foundry modeli nisu dostupni u odabranoj regiji
- Kvota je iscrpljena u preferiranim regijama
- Regionalna ograničenja kapaciteta

**Rješenja:**

1. **Provjerite dostupnost regije:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Ažurirajte AZD konfiguraciju:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Koristite alternativne regije:**
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

### Problem: Kvota za implementaciju modela premašena

**Simptomi:**
```
Error: Deployment failed due to insufficient quota
```

**Rješenja:**

1. **Provjerite trenutnu kvotu:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Zatražite povećanje kvote:**
Koristite tijek upravljanja kvotama u Foundry portalu za pogođenu pretplatu, regiju, model i vrstu implementacije. Pogledajte [službene upute za kvote](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Zahtjev za VM kvotom ne povećava kvotu modela.

3. **Optimizirajte kapacitet modela:**
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

### Problem: Nevažeća API verzija

**Simptomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rješenja:**

1. **Koristite podržanu API verziju:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Provjerite kompatibilnost API verzije:**
Provjerite [referencu životnog ciklusa Azure OpenAI API-ja](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM verzije API-ja za pružatelja resursa **ne** navode verzije inference/data-plane API-ja. Novi v1 klijenti koriste `/openai/v1/` bez datirane `api-version`; nemojte miješati ove dvije konfiguracije klijenata.

## Problemi sa Azure AI Search-om

### Problem: Neodgovarajuća razina cijene za Search uslugu

**Simptomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Rješenja:**

1. **Koristite podržanu razinu cijene:**

Semantički rangirator zahtijeva Basic ili višu razinu. Prelazak s Free/Basic na drugu razinu može zahtijevati stvaranje nove pretraživačke usluge i ponovno izgradnju indeksa; uređivanje SKU-a nije zajamčeni nadogradnja na licu mjesta.
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

2. **Onemogućite Semantičko pretraživanje (razvoj):**
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

### Problem: Neuspjesi pri stvaranju indeksa

**Simptomi:**
```
Error: Cannot create index, insufficient permissions
```

**Rješenja:**

1. **Provjerite ključeve Search usluge:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Provjerite shemu indeksa:**
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

3. **Koristite Managed Identity:**
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

## Problemi s implementacijom Container Apps

### Problem: Neuspjesi pri izgradnji kontejnera

**Simptomi:**
```
Error: Failed to build container image
```

**Rješenja:**

1. **Provjerite sintaksu Dockerfile:**
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

2. **Provjerite zavisnosti:**
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

3. **Dodajte provjeru zdravlja:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Neuspjesi pri pokretanju Container App-a

**Simptomi:**
```
Error: Container failed to start within timeout period
```

**Rješenja:**

1. **Povećajte vrijeme čekanja za pokretanje:**
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

2. **Optimizirajte učitavanje modela:**
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

## Pogreške autentikacije i dopuštenja

### Problem: Managed identity odbijena

**Simptomi:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Rješenja:**

1. **Provjerite dodjele uloga:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Dodijelite potrebne uloge:**
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

3. **Testirajte autentikaciju:**
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

Pribavljanje tokena dokazuje autentikaciju, ne i dopuštenje za pozivanje modela. Testirajte željenu operaciju zasebno. Lokalno, `DefaultAzureCredential` može koristiti vjerodajnice razvojnog inženjera; u Azure-u provjerite da je odabrana namjeravana managed identitet.

### Problem: Pristup Key Vault-u odbijen

**Simptomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Rješenja:**

1. **Dodijelite dopuštenja za Key Vault:**

Koristite sljedeći fragment pristupne politike samo za trezor s `enableRbacAuthorization: false`. Za trezor s omogućenim RBAC-om, koristite opciju 2; dodavanje pristupne politike ne daje pristup na razini podataka u RBAC načinu rada.
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

2. **Koristite RBAC umjesto pristupnih politika:**

Trezor mora imati `enableRbacAuthorization: true`; promjena modela dopuštenja zahtijeva plansku migraciju postojeće pristupne kontrole.
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

## Neuspjesi implementacije modela

### Problem: Verzija modela nije dostupna

**Simptomi:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Rješenja:**

1. **Provjerite dostupne modele:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Izričito odaberite dostupan model:**
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

3. **Validirajte model prije implementacije:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problemi izvedbe i skaliranja

### Problem: Visoka latencija odgovora

**Simptomi:**
- Vrijeme odgovora > 30 sekundi
- Pogreške zbog isteka vremena
- Loše korisničko iskustvo

**Rješenja:**

1. **Implementirajte ograničenja vremena zahtjeva:**
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

2. **Dodajte keširanje odgovora:**
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

3. **Konfigurirajte automatsko skaliranje:**
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

### Problem: Pogreške zbog nedostatka memorije

**Simptomi:**
```
Error: Container killed due to memory limit exceeded
```

**Rješenja:**

1. **Povećajte dodjelu memorije:**
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

2. **Optimizirajte korištenje memorije:**
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

## Upravljanje troškovima i kvotama

### Problem: Neočekivano visoki troškovi

**Simptomi:**
- Račun za Azure viši od očekivanog
- Korištenje tokena premašuje procjene
- Aktivirane obavijesti o proračunu

**Rješenja:**

1. **Provedite kontrole troškova:**
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

Ovaj brojač u memoriji je ilustrativan, nije kontrola mjesečne potrošnje: resetira se pri ponovnom pokretanju, nije zajednički među replikama i provjerava korištenje tek nakon poziva. Prava granica zahtijeva trajni računovodstveni sustav, rezervacije sigurnosne za konkurentnost prije zahtjeva i mjesečnu politiku resetiranja. Metrike memorije kontejnera moraju također uzeti u obzir cgroup ograničenja; `psutil.virtual_memory()` nije pouzdana mjera ograničenja kontejnera i prikupljanje smeća ne nameće maksimalnu memoriju.

2. **Postavite obavijesti o troškovima:**
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

Deklarirajte `budgetStartDate` i `budgetEndDate` u vašem predlošku. Proračuni šalju obavijesti; ne zaustavljaju resurse niti nameću strogi limit potrošnje.

3. **Optimizirajte odabir modela:**
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

## Alati i tehnike za ispravljanje pogrešaka

### AZD naredbe za ispravljanje pogrešaka

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

### AZD AI ekstenzijske naredbe za dijagnostiku

Ako ste implementirali agente koristeći `azd ai agent init`, dostupni su ovi dodatni alati:

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

> **Savjet:** Koristite `azd infra generate` za zapisivanje IaC-a na disk kako biste točno mogli pregledati koji su resursi implementirani. Ovo je neprocjenjivo pri ispravljanju problema konfiguracije resursa. Pogledajte [AZD AI CLI referencu](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za sve detalje.

**GA dijagnostika tijeka rada (2026-11-09):** Provjerite je li `azd version` barem verzije 1.37.0 i pregledajte `azd ext list --installed`. Najprije ažurirajte osnovni CLI s `azd update` ili njegovim instalaterom, zatim ažurirajte paket s `azd ext upgrade microsoft.foundry`. Za lokalne greške provjerite trenutni uv, Python 3.13+ za osnovni uzorak, `PYTHONNOUSERSITE: "1"` u konfiguraciji usluge i Azure vjerodajnice koje koristi `DefaultAzureCredential`. Držite `azd ai agent run` pokrenutim dok iz drugog terminala u direktoriju projekta pozivate `--local`.

Uspješna implementacija ne dokazuje da programer ima pristup na razini podataka. Pregledajte RBAC upozorenja i [matricu dopuštenja hostiranog agenta](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Isteći nije dokaz za neuspjeh implementacije: pregledajte pokušanu verziju i zapisnike prije ponovnog pokušaja. Raniji agenti beta.23 su poboljšali ta upozorenja i A2A izlaz; popravci su opisani u [bilješkama o izdanju](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), nisu uvjet za instalaciju te bete.

Ako `azd ai eval` nije dostupan, instalirajte `azure.ai.evaluations` zasebno; GA paket ga ne uključuje. Ako starija naredba za evaluaciju agenta uputama samo ispisuje smjernice za migraciju, koristite zasebni tijek rada `azd ai eval`. Optimizacijski `--config` više ne prihvaća stare evaluacijske datoteke. Pogledajte [migraciju evaluacije](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) i [migraciju optimizacije](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Ispravljanje pogrešaka aplikacije

1. **Strukturirano zapisivanje:**
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

2. **Završne točke za provjeru zdravlja:**
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

3. **Praćenje izvedbe:**
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

## Uobičajeni kodovi pogrešaka i rješenja

| Kod pogreške | Opis | Rješenje |
|------------|-------------|----------|
| 401 | Neautorizirano | Provjerite API ključeve i konfiguraciju managed identity |
| 403 | Zabranjeno | Provjerite dodjele uloga u okviru RBAC |
| 429 | Ograničeno broj zahtjeva | Implementirajte logiku ponovnog pokušaja s eksponencijalnim odgađanjem |
| 500 | Interna greška servera | Provjerite status i zapisnike implementacije modela |
| 503 | Usluga nije dostupna | Provjerite zdravlje usluge i dostupnost regije |

## Sljedeći koraci

1. **Pregledajte [Vodič za implementaciju AI modela](../chapter-02-ai-development/ai-model-deployment.md)** za najbolje prakse implementacije
2. **Dovršite [Prakse AI za proizvodnju](../chapter-08-production/production-ai-practices.md)** za spremna rješenja na razini poduzeća
3. **Pridružite se [Microsoft Foundry Discord zajednici](https://aka.ms/foundry/discord)** za zajedničku podršku
4. **Prijavite probleme** u [AZD GitHub spremište](https://github.com/Azure/azure-dev) za probleme specifične za AZD

## Resursi

- [Rješavanje problema s kvotama i ograničenjima Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Rješavanje problema s Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Rješavanje problema s Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instalirajte Azure vještine rješavanja problema u svoj uređivač: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Rješavanje problema i ispravljanje pogrešaka
- **⬅️ Prethodno**: [Vodič za ispravljanje pogrešaka](debugging.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 8: Obrasci za proizvodnju i razinu poduzeća](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavlje 2: AI-prvo razvijanje](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referenca**: [Rješavanje problema s Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->