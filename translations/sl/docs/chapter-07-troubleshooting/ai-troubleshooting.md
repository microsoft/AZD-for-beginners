# Vodnik za odpravljanje težav specifičnih za AI

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje**: [Vodnik za razhroščevanje](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Produkcijski in poslovni vzorci](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ta obsežen vodnik za odpravljanje težav obravnava pogoste težave pri nameščanju AI rešitev z AZD in ponuja rešitve ter tehnike razhroščevanja, specifične za storitve Azure AI.

## Kazalo vsebine

- [Težave storitve Microsoft Foundry Models](#azure-openai-service-issues)
- [Težave z Azure AI Search](#težave-z-azure-ai-search)
- [Težave pri nameščanju Container Apps](#težave-pri-nameščanju-container-apps)
- [Napake pri overjanju in dovoljenjih](#napake-pri-overjanju-in-dovoljenjih)
- [Neuspehi pri nameščanju modela](#neuspehi-pri-nameščanju-modela)
- [Težave z zmogljivostjo in skaliranjem](#težave-z-zmogljivostjo-in-skaliranjem)
- [Upravljanje stroškov in kvot](#upravljanje-stroškov-in-kvot)
- [Orodja in tehnike za razhroščevanje](#orodja-in-tehnike-za-razhroščevanje)

## Težave storitve Microsoft Foundry Models

### Težava: Storitev OpenAI ni na voljo v regiji

**Simptomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Vzroki:**
- Microsoft Foundry Models ni na voljo v izbrani regiji
- Kvota v prednostnih regijah je porabljena
- Regionalne omejitve zmogljivosti

**Rešitve:**

1. **Preverite razpoložljivost regije:**
```bash
# Prikaži razpoložljive regije za OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Posodobite konfiguracijo AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Uporabite alternativne regije:**
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

### Težava: Kvota za nameščanje modelov je presežena

**Simptomi:**
```
Error: Deployment failed due to insufficient quota
```

**Rešitve:**

1. **Preverite trenutno kvoto:**
```bash
# Preveri porabo kvote
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Zahtevajte povečanje kvote:**
```bash
# Oddaj zahtevo za povečanje kvote
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizirajte kapaciteto modela:**
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

### Težava: Neveljavna različica API-ja

**Simptomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rešitve:**

1. **Uporabite podprto različico API-ja:**
```python
# Uporabite najnovejšo podprto različico
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Preverite združljivost različice API-ja:**
```bash
# Naštej podprte različice API-ja
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Težave z Azure AI Search

### Težava: Cena storitve Search ni zadostna

**Simptomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Rešitve:**

1. **Nadgradite cenovni razred:**
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

2. **Onemogočite semantično iskanje (v razvoju):**
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

1. **Preverite ključe storitve Search:**
```bash
# Pridobi administratorski ključ iskalne storitve
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Preverite shemo indeksa:**
```python
# Preveri shemo indeksa
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

3. **Uporabite upravljano identiteto:**
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

## Težave pri nameščanju Container Apps

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Dodajte preverjanje zdravja:**
```python
# main.py - Dodaj končno točko za preverjanje stanja
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Težava: Zagon Container App ni uspel

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

2. **Optimizirajte nalaganje modela:**
```python
# Odloženo nalaganje modelov za zmanjšanje časa zagona
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
        # Tukaj inicializirajte AI odjemalca
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Zagon
    app.state.model_manager = ModelManager()
    yield
    # Zaustavitev
    pass

app = FastAPI(lifespan=lifespan)
```

## Napake pri overjanju in dovoljenjih

### Težava: Upravljana identiteta - dovoljenje zavrnjeno

**Simptomi:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Rešitve:**

1. **Preverite dodelitve vlog:**
```bash
# Preverite trenutne dodelitve vlog
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

3. **Preizkusite overjanje:**
```python
# Preizkus avtentikacije upravljane identitete
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

### Težava: Dostop do Key Vault zavrnjen

**Simptomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Rešitve:**

1. **Dodelite dovoljenja za Key Vault:**
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

2. **Uporabite RBAC namesto Access Policies:**
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

## Neuspehi pri nameščanju modela

### Težava: Različica modela ni na voljo

**Simptomi:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Rešitve:**

1. **Preverite razpoložljive modele:**
```bash
# Prikaži razpoložljive modele
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Uporabite nadomestne modele:**
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

3. **Validirajte model pred nameščanjem:**
```python
# Validacija modela pred uvajanjem
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

## Težave z zmogljivostjo in skaliranjem

### Težava: Visoka zakasnitev odgovorov

**Simptomi:**
- Časi odziva > 30 sekund
- Napake preteka časa
- Slaba uporabniška izkušnja

**Rešitve:**

1. **Uvedite časovne omejitve zahtev:**
```python
# Nastavite ustrezne časovne omejitve
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
# Redis predpomnilnik za odgovore
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

3. **Konfigurirajte avtoskaliranje:**
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

### Težava: Napake zaradi izpada pomnilnika

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
# Pomnilniško učinkovito upravljanje modela
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Preverite porabo pomnilnika pred obdelavo
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Prisili zbiranje smeti
            
        result = await self._process_ai_request(request)
        
        # Po obdelavi počisti
        gc.collect()
        return result
```

## Upravljanje stroškov in kvot

### Težava: Nepričakovano visoki stroški

**Simptomi:**
- Azure račun višji kot pričakovano
- Poraba tokenov presega ocene
- Sproženi opozorili o proračunu

**Rešitve:**

1. **Uvedite kontrole stroškov:**
```python
# Spremljanje uporabe tokenov
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

2. **Nastavite opozorila o stroških:**
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

3. **Optimizirajte izbiro modela:**
```python
# Izbira modela ob upoštevanju stroškov
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

### AZD ukazi za razhroščevanje

```bash
# Omogoči podrobno beleženje
azd up --debug

# Preveri stanje uvajanja
azd show

# Ogled dnevnikov aplikacije (odpre nadzorno ploščo za spremljanje)
azd monitor --logs

# Ogled meritev v živo
azd monitor --live

# Preveri spremenljivke okolja
azd env get-values
```

### Ukazi razširitve AZD AI za diagnostiko

Če ste namestili agente z `azd ai agent init`, so na voljo ta dodatna orodja:

```bash
# Prepričajte se, da je razširitev agents nameščena
azd extension install azure.ai.agents

# Ponovno inicializirajte ali posodobite agenta iz manifesta
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Uporabite strežnik MCP, da AI orodjem omogočite poizvedovanje o stanju projekta
azd mcp start

# Ustvarite datoteke infrastrukture za pregled in revizijo
azd infra generate
```

> **Namig:** Uporabite `azd infra generate` za zapis IaC na disk, da lahko natančno pregledate, kateri viri so bili provisionani. To je neprecenljivo pri razhroščevanju težav s konfiguracijo virov. Oglejte si [referenco AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) za polne podrobnosti.

### Razhroščevanje aplikacije

1. **Strukturirano beleženje:**
```python
import logging
import json

# Konfigurirajte strukturirano beleženje za aplikacije z umetno inteligenco
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

2. **Končne točke za preverjanje stanja:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Preveri povezavo z OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Preveri storitev iskanja
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
| 401 | Neavtorizirano | Preverite API ključe in konfiguracijo upravljane identitete |
| 403 | Prepovedano | Preverite dodelitve vlog RBAC |
| 429 | Omejitev zahtevkov | Implementirajte logiko ponovnega poizkusa z eksponentnim upočasnjevanjem |
| 500 | Notranja napaka strežnika | Preverite stanje nameščanja modela in dnevnike |
| 503 | Storitev ni na voljo | Preverite stanje storitve in regionalno razpoložljivost |

## Naslednji koraki

1. **Preglejte [Vodič za nameščanje AI modelov](../chapter-02-ai-development/ai-model-deployment.md)** za najboljše prakse nameščanja
2. **Dokončajte [Prakse produkcijskega AI](../chapter-08-production/production-ai-practices.md)** za rešitve primerne za podjetja
3. **Pridružite se [Discord skupnosti Microsoft Foundry](https://aka.ms/foundry/discord)** za podporo skupnosti
4. **Pošljite težave** v [AZD GitHub repozitorij](https://github.com/Azure/azure-dev) za težave, specifične za AZD

## Viri

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Namestite Azure orodja za odpravljanje težav v vašem urejevalniku: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD For Beginners](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje**: [Vodnik za razhroščevanje](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Produkcijski in poslovni vzorci](../chapter-08-production/production-ai-practices.md)
- **🤖 Povezano**: [Poglavje 2: Razvoj, osredotočen na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referenca**: [Razhroščevanje Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku naj velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->