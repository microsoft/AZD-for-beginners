# AI specifinis trikčių šalinimo vadovas

**Skyriaus naršymas:**
- **📚 Course Home**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Derinimo vadovas](debugging.md)
- **➡️ Kitas skyrius**: [8 skyrius: Produkcijos ir įmonės modeliai](../chapter-08-production/production-ai-practices.md)
- **🤖 Susiję**: [2 skyrius: DI pirmumo kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Ankstesnis:** [Produkcinio DI praktikos](../chapter-08-production/production-ai-practices.md) | **Kitas:** [AZD pagrindai](../chapter-01-foundation/azd-basics.md)

Šis išsamus trikčių šalinimo vadovas nagrinėja dažnas problemas diegiant DI sprendimus su AZD ir pateikia sprendimus bei derinimo metodikas, specifines Azure DI paslaugoms.

## Turinys

- [Azure OpenAI paslaugos problemos](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search problemos](../../../../docs/chapter-07-troubleshooting)
- [Container Apps diegimo problemos](../../../../docs/chapter-07-troubleshooting)
- [Autentifikavimo ir leidimų klaidos](../../../../docs/chapter-07-troubleshooting)
- [Modelio diegimo klaidos](../../../../docs/chapter-07-troubleshooting)
- [Veikimo ir skalavimo problemos](../../../../docs/chapter-07-troubleshooting)
- [Sąnaudų ir kvotų valdymas](../../../../docs/chapter-07-troubleshooting)
- [Derinimo įrankiai ir metodai](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI paslaugos problemos

### Problema: OpenAI paslauga neprieinama regione

**Simptomai:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Priežastys:**
- Azure OpenAI neprieinamas pasirinktoje regione
- Kvota išnaudota pageidaujamose regionuose
- Regioniniai pajėgumų apribojimai

**Sprendimai:**

1. **Patikrinkite regiono prieinamumą:**
```bash
# Išvardinti prieinamus OpenAI regionus
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Atnaujinkite AZD konfigūraciją:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Naudokite alternatyvius regionus:**
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

### Problema: Modelio diegimo kvota viršyta

**Simptomai:**
```
Error: Deployment failed due to insufficient quota
```

**Sprendimai:**

1. **Patikrinkite esamą kvotą:**
```bash
# Patikrinti kvotos naudojimą
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Prašykite kvotos padidinimo:**
```bash
# Pateikti prašymą padidinti kvotą
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizuokite modelio pajėgumus:**
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

### Problema: Neteisinga API versija

**Simptomai:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Sprendimai:**

1. **Naudokite palaikomą API versiją:**
```python
# Naudokite naujausią palaikomą versiją
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Patikrinkite API versijų suderinamumą:**
```bash
# Išvardinti palaikomas API versijas
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search problemos

### Problema: Paieškos paslaugos kainodaros lygis nepakankamas

**Simptomai:**
```
Error: Semantic search requires Basic tier or higher
```

**Sprendimai:**

1. **Pakelkite kainodaros lygį:**
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

2. **Išjunkite semantinę paiešką (kūrimo metu):**
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

### Problema: Indekso kūrimo klaidos

**Simptomai:**
```
Error: Cannot create index, insufficient permissions
```

**Sprendimai:**

1. **Patikrinkite paieškos paslaugos raktus:**
```bash
# Gauti paieškos paslaugos administratoriaus raktą
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Patikrinkite indekso schemą:**
```python
# Patikrinti indekso schemą
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

3. **Naudokite valdomą identitetą:**
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

## Container Apps diegimo problemos

### Problema: konteinerio kūrimo klaidos

**Simptomai:**
```
Error: Failed to build container image
```

**Sprendimai:**

1. **Patikrinkite Dockerfile sintaksę:**
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

2. **Patikrinkite priklausomybes:**
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

3. **Pridėkite sveikatos patikrą:**
```python
# main.py - pridėti sveikatos patikros galinį tašką
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: konteinerio programos paleidimo klaidos

**Simptomai:**
```
Error: Container failed to start within timeout period
```

**Sprendimai:**

1. **Padidinkite paleidimo laiko limitą:**
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

2. **Optimizuokite modelio užkrovimą:**
```python
# Kraukite modelius tingiai, kad sumažintumėte paleidimo laiką
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
        # Inicializuokite AI klientą čia
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Paleidimas
    app.state.model_manager = ModelManager()
    yield
    # Išjungimas
    pass

app = FastAPI(lifespan=lifespan)
```

## Autentifikavimo ir leidimų klaidos

### Problema: valdomo identiteto leidimas atmestas

**Simptomai:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Sprendimai:**

1. **Patikrinkite vaidmenų priskyrimus:**
```bash
# Patikrinti dabartinius vaidmenų priskyrimus
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Priskirkite reikiamus vaidmenis:**
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

3. **Patikrinkite autentifikavimą:**
```python
# Išbandyti valdomos tapatybės autentifikavimą
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

### Problema: Key Vault prieiga atmesta

**Simptomai:**
```
Error: The user, group or application does not have secrets get permission
```

**Sprendimai:**

1. **Suteikite Key Vault teises:**
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

2. **Naudokite RBAC vietoje prieigos politikų:**
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

## Modelio diegimo klaidos

### Problema: modelio versija neprieinama

**Simptomai:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Sprendimai:**

1. **Patikrinkite turimus modelius:**
```bash
# Išvardinti prieinamus modelius
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Naudokite modelių atsarginius variantus:**
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

3. **Patikrinkite modelį prieš diegiant:**
```python
# Modelio validacija prieš diegimą
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

## Veikimo ir skalavimo problemos

### Problema: didelis atsakymo vėlavimas

**Simptomai:**
- Atsakymo laikas > 30 sekundžių
- Laiko pasibaigimo klaidos
- Prasta naudotojo patirtis

**Sprendimai:**

1. **Įdiekite užklausos laiko limitus:**
```python
# Konfigūruokite tinkamus laiko limitus
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

2. **Pridėkite atsakymų talpyklą:**
```python
# Redis talpykla atsakymams
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

3. **Konfigūruokite automatinį skalavimą:**
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

### Problema: Neužtenka atminties klaidos

**Simptomai:**
```
Error: Container killed due to memory limit exceeded
```

**Sprendimai:**

1. **Padidinkite atminties paskyrimą:**
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

2. **Optimizuokite atminties naudojimą:**
```python
# Atmintį taupantis modelio tvarkymas
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Atminties naudojimo tikrinimas prieš apdorojimą
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Priverstinis šiukšlių surinkimas
            
        result = await self._process_ai_request(request)
        
        # Išvalymas po apdorojimo
        gc.collect()
        return result
```

## Sąnaudų ir kvotų valdymas

### Problema: netikėtai didelės sąnaudos

**Simptomai:**
- Azure sąskaita didesnė nei tikėtasi
- Žetonų naudojimas viršija prognozes
- Suveikė biudžeto įspėjimai

**Sprendimai:**

1. **Įgyvendinkite sąnaudų kontrolės priemones:**
```python
# Žetonų naudojimo stebėjimas
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

2. **Sukonfigūruokite sąnaudų įspėjimus:**
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

3. **Optimizuokite modelių pasirinkimą:**
```python
# Modelio pasirinkimas atsižvelgiant į kainą
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # už 1K tokenų
    'gpt-4': 0.03,          # už 1K tokenų
    'gpt-35-turbo': 0.0015  # už 1K tokenų
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

## Derinimo įrankiai ir metodai

### AZD derinimo komandos

```bash
# Įjungti išsamų žurnalavimą
azd up --debug

# Patikrinti diegimo būseną
azd show

# Peržiūrėti programos žurnalus (atidaro stebėjimo skydelį)
azd monitor --logs

# Peržiūrėti tiesioginius rodiklius
azd monitor --live

# Patikrinti aplinkos kintamuosius
azd env get-values
```

### Programos derinimas

1. **Struktūruotas žurnalavimas:**
```python
import logging
import json

# Konfigūruokite struktūruotą registravimą dirbtinio intelekto programoms
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

2. **Sveikatos patikros galiniai taškai:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Patikrinti ryšį su OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Patikrinti paieškos paslaugą
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

3. **Veiklos stebėjimas:**
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

## Dažni klaidų kodai ir sprendimai

| Klaidos kodas | Aprašymas | Sprendimas |
|------------|-------------|----------|
| 401 | Neautorizuota | Patikrinkite API raktus ir valdomo identiteto konfigūraciją |
| 403 | Draudžiama | Patikrinkite RBAC vaidmenų priskyrimus |
| 429 | Apribotas užklausų skaičius | Įgyvendinkite pakartojimų logiką su eksponentiniu atidėjimu |
| 500 | Vidinė serverio klaida | Patikrinkite modelio diegimo būseną ir žurnalus |
| 503 | Paslauga neprieinama | Patikrinkite paslaugos sveikatą ir regioninį prieinamumą |

## Tolimesni veiksmai

1. **Peržiūrėkite [DI modelio diegimo vadovą](../chapter-02-ai-development/ai-model-deployment.md)** dėl diegimo geriausių praktikų
2. **Atlikite [Produkcinio DI praktikas](../chapter-08-production/production-ai-practices.md)** dėl įmonėms tinkamų sprendimų
3. **Prisijunkite prie [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** dėl bendruomenės palaikymo
4. **Pateikite problemas** į [AZD GitHub repository](https://github.com/Azure/azure-dev) dėl AZD specifinių problemų

## Ištekliai

- [Azure OpenAI paslaugos trikčių šalinimas](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps trikčių šalinimas](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search trikčių šalinimas](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Skyriaus naršymas:**
- **📚 Course Home**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Derinimo vadovas](debugging.md)
- **➡️ Kitas skyrius**: [8 skyrius: Produkcijos ir įmonės modeliai](../chapter-08-production/production-ai-practices.md)
- **🤖 Susiję**: [2 skyrius: DI pirmumo kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI trikčių šalinimas](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą Co-op Translator (https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalų dokumentą jo gimtąja (originalia) kalba reikėtų laikyti autoritetingu šaltiniu. Kritinei informacijai rekomenduojamas profesionalus, žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar klaidingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->