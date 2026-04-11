# Vodič za Rješavanje Problema Specifičnih za AI

**Navigacija Poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Rješavanje problema i ispravljanje pogrešaka
- **⬅️ Prethodno**: [Vodič za ispravljanje pogrešaka](debugging.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 8: Proizvodni i poslovni obrasci](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavlje 2: AI-prvo programiranje](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ovaj sveobuhvatni vodič za rješavanje problema bavi se uobičajenim problemima pri implementaciji AI rješenja s AZD-om, pružajući rješenja i tehnike ispravljanja pogrešaka specifične za Azure AI usluge.

## Sadržaj

- [Problemi s Microsoft Foundry Models uslugom](#azure-openai-service-issues)
- [Problemi s Azure AI pretraživanjem](#problemi-s-azure-ai-pretraživanjem)
- [Problemi s implementacijom Container aplikacija](#problemi-s-implementacijom-container-aplikacija)
- [Pogreške kod autentikacije i dozvola](#pogreške-kod-autentikacije-i-dozvola)
- [Neuspjesi pri implementaciji modela](#neuspjesi-pri-implementaciji-modela)
- [Problemi s performansama i skaliranjem](#problemi-s-performansama-i-skaliranjem)
- [Upravljanje troškovima i kvotama](#upravljanje-troškovima-i-kvotama)
- [Alati i tehnike za ispravljanje pogrešaka](#alati-i-tehnike-za-ispravljanje-pogrešaka)

## Problemi s Microsoft Foundry Models uslugom

### Problem: OpenAI usluga nije dostupna u regiji

**Simptomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Uzroci:**
- Microsoft Foundry Models nisu dostupni u odabranoj regiji
- Kvota iscrpljena u odabranim regijama
- Regionalna ograničenja kapaciteta

**Rješenja:**

1. **Provjerite dostupnost regije:**
```bash
# Nabrojite dostupne regije za OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Ažurirajte AZD konfiguraciju:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Koristite alternativne regije:**
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

### Problem: Prekoračenje kvote za implementaciju modela

**Simptomi:**
```
Error: Deployment failed due to insufficient quota
```

**Rješenja:**

1. **Provjerite trenutnu kvotu:**
```bash
# Provjeri korištenje kvote
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Zatražite povećanje kvote:**
```bash
# Pošalji zahtjev za povećanje kvote
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizirajte kapacitet modela:**
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

### Problem: Nevažeća verzija API-ja

**Simptomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rješenja:**

1. **Koristite podržanu verziju API-ja:**
```python
# Koristite najnoviju podržanu verziju
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Provjerite kompatibilnost verzije API-ja:**
```bash
# Nabroj dostupne verzije API-ja
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problemi s Azure AI pretraživanjem

### Problem: Nedovoljna razina cijene usluge pretraživanja

**Simptomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Rješenja:**

1. **Nadogradite razinu cijene:**
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

2. **Isključite semantičko pretraživanje (razvojni mod):**
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

### Problem: Neuspjesi pri kreiranju indeksa

**Simptomi:**
```
Error: Cannot create index, insufficient permissions
```

**Rješenja:**

1. **Provjerite ključeve usluge pretraživanja:**
```bash
# Dohvati administratorski ključ usluge pretraživanja
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Provjerite shemu indeksa:**
```python
# Provjerite shemu indeksa
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

3. **Koristite upravljani identitet:**
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

## Problemi s implementacijom Container aplikacija

### Problem: Neuspjesi pri izgradnji containera

**Simptomi:**
```
Error: Failed to build container image
```

**Rješenja:**

1. **Provjerite sintaksu Dockerfile datoteke:**
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

2. **Provjerite ovisnosti:**
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

3. **Dodajte Health Check:**
```python
# main.py - Dodaj endpoint za provjeru zdravlja
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Neuspjesi pri pokretanju Container aplikacije

**Simptomi:**
```
Error: Container failed to start within timeout period
```

**Rješenja:**

1. **Povećajte timeout za pokretanje:**
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

2. **Optimizirajte učitavanje modela:**
```python
# Lenjo učitavanje modela za smanjenje vremena pokretanja
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
        # Inicijaliziraj AI klijenta ovdje
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Pokretanje
    app.state.model_manager = ModelManager()
    yield
    # Gašenje
    pass

app = FastAPI(lifespan=lifespan)
```

## Pogreške kod autentikacije i dozvola

### Problem: Odbijena dozvola upravljanog identiteta

**Simptomi:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Rješenja:**

1. **Provjerite dodjele uloga:**
```bash
# Provjerite trenutne dodjele uloga
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
# Testiranje provjere autentičnosti upravljanog identiteta
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

### Problem: Odbijen pristup Key Vaultu

**Simptomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Rješenja:**

1. **Dodajte dozvole za Key Vault:**
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

2. **Koristite RBAC umjesto pravila pristupa:**
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

## Neuspjesi pri implementaciji modela

### Problem: Verzija modela nije dostupna

**Simptomi:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Rješenja:**

1. **Provjerite dostupne modele:**
```bash
# Popis dostupnih modela
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Koristite zamjenske modele:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
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

3. **Validirajte model prije implementacije:**
```python
# Validacija modela prije implementacije
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

## Problemi s performansama i skaliranjem

### Problem: Visoka latencija odgovora

**Simptomi:**
- Vrijeme odgovora > 30 sekundi
- Pogreške timeouta
- Loše korisničko iskustvo

**Rješenja:**

1. **Implementirajte timeout zahtjeva:**
```python
# Konfigurirajte odgovarajuće vremenske limite
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

2. **Dodajte predmemoriranje odgovora:**
```python
# Redis predmemorija za odgovore
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

### Problem: Izmene memorije (Out of memory) pogreške

**Simptomi:**
```
Error: Container killed due to memory limit exceeded
```

**Rješenja:**

1. **Povećajte dodijeljenu memoriju:**
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
# Upravljanje modelom uz učinkovito korištenje memorije
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Provjerite korištenje memorije prije obrade
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Primorajte prikupljanje smeća
            
        result = await self._process_ai_request(request)
        
        # Očistite nakon obrade
        gc.collect()
        return result
```

## Upravljanje troškovima i kvotama

### Problem: Neočekivano visoki troškovi

**Simptomi:**
- Račun za Azure veći nego što se očekivalo
- Korištenje tokena prelazi procjene
- Aktivirani su alerti budžeta

**Rješenja:**

1. **Implementirajte kontrole troškova:**
```python
# Praćenje korištenja tokena
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

2. **Postavite alarme za troškove:**
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

3. **Optimizirajte odabir modela:**
```python
# Odabir modela svjestan troškova
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
# Omogući detaljno zapisivanje
azd up --debug

# Provjeri status implementacije
azd show

# Pogledaj dnevnike aplikacije (otvara nadzornu ploču)
azd monitor --logs

# Pogledaj žive metrike
azd monitor --live

# Provjeri varijable okoline
azd env get-values
```

### AZD AI proširenja za dijagnostiku

Ako ste implementirali agente koristeći `azd ai agent init`, dostupni su ovi dodatni alati:

```bash
# Osigurajte da je proširenje agenata instalirano
azd extension install azure.ai.agents

# Ponovno inicijalizirajte ili ažurirajte agenta iz manifesta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Koristite MCP poslužitelj kako bi AI alati mogli upitivati stanje projekta
azd mcp start

# Generirajte infrastrukturne datoteke za pregled i reviziju
azd infra generate
```

> **Savjet:** Koristite `azd infra generate` za generiranje IaC na disku kako biste mogli detaljno pregledati koje su resurse provisionirane. Ovo je neprocjenjivo prilikom otklanjanja problema s konfiguracijom resursa. Pogledajte [AZD AI CLI referencu](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za detalje.

### Ispravljanje pogrešaka aplikacije

1. **Strukturirano logiranje:**
```python
import logging
import json

# Konfigurirajte strukturirano zapisivanje za AI aplikacije
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

2. **Završne točke za health check:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Provjerite povezanost s OpenAI-jem
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Provjerite servis pretraživanja
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

3. **Praćenje performansi:**
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
|--------------|-------|----------|
| 401 | Nije autorizirano | Provjerite API ključeve i konfiguraciju upravljanog identiteta |
| 403 | Zabranjeno | Provjerite dodjele uloga RBAC-a |
| 429 | Ograničenje zahtjeva | Implementirajte ponovne pokušaje s eksponencijalnim povratom |
| 500 | Interna pogreška servera | Provjerite status implementacije modela i logove |
| 503 | Usluga nije dostupna | Provjerite zdravlje usluge i regionalnu dostupnost |

## Sljedeći koraci

1. **Pregledajte [Vodič za implementaciju AI modela](../chapter-02-ai-development/ai-model-deployment.md)** za najbolje prakse implementacije
2. **Dovršite [Prakse proizvodnog AI-a](../chapter-08-production/production-ai-practices.md)** za rješenja spremna za poduzeća
3. **Pridružite se [Microsoft Foundry Discordu](https://aka.ms/foundry/discord)** za podršku zajednice
4. **Prijavite probleme** u [AZD GitHub repozitorij](https://github.com/Azure/azure-dev) za AZD specifične probleme

## Resursi

- [Rješavanje problema Microsoft Foundry Models usluge](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Rješavanje problema Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Rješavanje problema Azure AI pretraživanja](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent vještina**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instalirajte Azure vještine za rješavanje problema u vašem editoru: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija Poglavljima:**
- **📚 Početna stranica tečaja**: [AZD za početnike](../../README.md)
- **📖 Trenutno poglavlje**: Poglavlje 7 - Rješavanje problema i ispravljanje pogrešaka
- **⬅️ Prethodno**: [Vodič za ispravljanje pogrešaka](debugging.md)
- **➡️ Sljedeće poglavlje**: [Poglavlje 8: Proizvodni i poslovni obrasci](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavlje 2: AI-prvo programiranje](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referenca**: [Azure Developer CLI Rješavanje problema](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden korištenjem AI usluge za prijevod [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, molimo imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku smatra se autentičnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazumevanja ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->