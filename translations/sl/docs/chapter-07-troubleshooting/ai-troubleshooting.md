# Vodnik za odpravljanje težav, specifičnih za AI

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje**: [Vodnik za razhroščevanje](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Produkcijski in podjetniški vzorci](../chapter-08-production/production-ai-practices.md)
- **🤖 Sorodno**: [Poglavje 2: Razvoj, usmerjen v AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Previous:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Next:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

Ta obsežni vodnik za odpravljanje težav obravnava pogoste težave pri nameščanju AI rešitev z AZD in ponuja rešitve ter tehnike za razhroščevanje, specifične za storitve Azure AI.

## Kazalo vsebine

- [Težave s storitvijo Azure OpenAI](../../../../docs/chapter-07-troubleshooting)
- [Težave z Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Težave pri nameščanju Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Avtentikacija in napake dovoljenj](../../../../docs/chapter-07-troubleshooting)
- [Neuspehi pri nameščanju modelov](../../../../docs/chapter-07-troubleshooting)
- [Težave z zmogljivostjo in skaliranjem](../../../../docs/chapter-07-troubleshooting)
- [Upravljanje stroškov in kvot](../../../../docs/chapter-07-troubleshooting)
- [Orodja in tehnike za razhroščevanje](../../../../docs/chapter-07-troubleshooting)

## Težave s storitvijo Azure OpenAI

### Težava: Storitve OpenAI ni na voljo v regiji

**Simptomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Vzroki:**
- Azure OpenAI ni na voljo v izbrani regiji
- Kvota porabljena v prednostnih regijah
- Omejitve zmogljivosti v regiji

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

### Težava: Kvota za nameščanje modela presežena

**Simptomi:**
```
Error: Deployment failed due to insufficient quota
```

**Rešitve:**

1. **Preverite trenutno kvoto:**
```bash
# Preveri uporabo kvote
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Zahtevajte povečanje kvote:**
```bash
# Oddajte zahtevo za povečanje kvote
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizirajte zmogljivost modela:**
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
# Seznam podprtih različic API-ja
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Težave z Azure AI Search

### Težava: Izbrana cenovna stopnja storitve Search ni zadostna

**Simptomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Rešitve:**

1. **Nadgradite cenovno stopnjo:**
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

### Težava: Neuspehi pri ustvarjanju indeksa

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

### Težava: Neuspehi pri gradnji kontejnerja

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Dodajte preverjanje stanja (health check):**
```python
# main.py - Dodaj končno točko za preverjanje stanja
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Težava: Neuspehi pri zagonu Container App

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
# Nalaganje modelov na zahtevo za zmanjšanje časa zagona
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

## Napake pri avtentikaciji in dovoljenjih

### Težava: Upravljenemu identiteti zavrnjena dovoljenja

**Simptomi:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Rešitve:**

1. **Preverite dodelitve vlog:**
```bash
# Preveri trenutne dodelitve vlog
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
# Preizkus preverjanja pristnosti upravljane identitete
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

2. **Uporabite RBAC namesto dostopnih pravil (Access Policies):**
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

## Neuspehi pri nameščanju modelov

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

3. **Preverite model pred nameščanjem:**
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

### Težava: Visoka zakasnitev odzivov

**Simptomi:**
- Časi odziva > 30 sekund
- Napake prekoračitve časa (timeout)
- Slaba uporabniška izkušnja

**Rešitve:**

1. **Uvedite omejitve časa za zahteve (request timeouts):**
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

1. **Povečajte dodelitev pomnilnika:**
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

2. **Optimizirajte porabo pomnilnika:**
```python
# Pomnilniško učinkovito upravljanje modelov
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Preverite uporabo pomnilnika pred obdelavo
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Prisili zbiranje smeti
            
        result = await self._process_ai_request(request)
        
        # Po obdelavi očistite
        gc.collect()
        return result
```

## Upravljanje stroškov in kvot

### Težava: Nepričakovano visoki stroški

**Simptomi:**
- Račun za Azure je višji od pričakovanega
- Poraba tokenov presega ocene
- Sprožena so bila opozorila o proračunu

**Rešitve:**

1. **Uvedite kontrole stroškov:**
```python
# Sledenje uporabi žetonov
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
# Izbira modela, ki upošteva stroške
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # na 1K tokenov
    'gpt-4': 0.03,          # na 1K tokenov
    'gpt-35-turbo': 0.0015  # na 1K tokenov
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

## Orodja in tehnike za razhroščevanje

### Ukazi za razhroščevanje AZD

```bash
# Omogoči podrobno beleženje
azd up --debug

# Preveri stanje nameščanja
azd show

# Prikaži dnevnike aplikacije (odpre nadzorno ploščo za spremljanje)
azd monitor --logs

# Prikaži meritve v živo
azd monitor --live

# Preveri spremenljivke okolja
azd env get-values
```

### Razhroščevanje aplikacij

1. **Strukturirano beleženje (structured logging):**
```python
import logging
import json

# Konfigurirajte strukturirano beleženje za aplikacije umetne inteligence
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

2. **Končne točke za preverjanje stanja (health check endpoints):**
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
    
    # Preveri iskalno storitev
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

3. **Spremljanje zmogljivosti:**
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
| 403 | Prepovedano | Preverite dodelitve vlog v RBAC |
| 429 | Omejeno s stopnjo zahtev (rate limited) | Uvedite logiko ponavljanja z eksponentnim povratnim odmikanjem |
| 500 | Notranja napaka strežnika | Preverite stanje nameščanja modela in dnevnike |
| 503 | Storitev ni na voljo | Preverite stanje storitve in razpoložljivost v regiji |

## Naslednji koraki

1. **Preglejte [Vodnik za nameščanje AI modelov](../chapter-02-ai-development/ai-model-deployment.md)** za najboljše prakse nameščanja
2. **Dokončajte [Produkcijske prakse AI](../chapter-08-production/production-ai-practices.md)** za rešitve pripravljene za podjetja
3. **Pridružite se [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** za podporo skupnosti
4. **Pošljite težave** v [GitHub repozitorij AZD](https://github.com/Azure/azure-dev) za težave, specifične za AZD

## Viri

- [Odpravljanje težav s storitvijo Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Odpravljanje težav Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Odpravljanje težav z Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navigacija po poglavjih:**
- **📚 Domov tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 7 - Odpravljanje težav in razhroščevanje
- **⬅️ Prejšnje**: [Vodnik za razhroščevanje](debugging.md)
- **➡️ Naslednje poglavje**: [Poglavje 8: Produkcijski in podjetniški vzorci](../chapter-08-production/production-ai-practices.md)
- **🤖 Sorodno**: [Poglavje 2: Razvoj, usmerjen v AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Odpravljanje težav z Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zavrnitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatski prevodi vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku naj velja za avtoritativni vir. Za ključne informacije priporočamo strokovni, človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->