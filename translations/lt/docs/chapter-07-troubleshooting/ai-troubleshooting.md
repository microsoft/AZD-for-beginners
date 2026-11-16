# AI Specifinis trikčių šalinimo vadovas

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Derinimo vadovas](debugging.md)
- **➡️ Kitas skyrius**: [8 skyrius: Gamybiniai ir įmonių šablonai](../chapter-08-production/production-ai-practices.md)
- **🤖 Susiję**: [2 skyrius: AI-pirmas vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)

Šis išsamus trikčių šalinimo vadovas sprendžia dažnas problemas diegiant AI sprendimus naudojant AZD, teikdamas sprendimus ir derinimo technikas, būdingas Azure AI paslaugoms.

> **Aprėptis:** Komandos naudoja pavyzdinius išteklių pavadinimus; pakeiskite juos ir pasirinkite tinkamą prenumeratą. Bicep blokai yra fragmentai, kuriuos reikia įtraukti į esamą šabloną, o ne atskiras diegimas. Python fragmentai reikalauja nurodytų SDK ir aplikacijos konfigūracijos. Ši apžvalga nebuvo atliekama tiesioginiu Azure diegimu.

## Turinys

- [Microsoft Foundry modeliavimo paslaugų problemos](#microsoft-foundry-models-service-issues)
- [Azure AI paieškos problemos](#azure-ai-search-problems)
- [Container Apps diegimo problemos](#container-apps-deployment-issues)
- [Autentifikacijos ir leidimų klaidos](#authentication-and-permission-errors)
- [Modelių diegimo klaidos](#model-deployment-failures)
- [Veikimo ir mastelio problemos](#performance-and-scaling-issues)
- [Išliukdymo ir kvotų valdymas](#cost-and-quota-management)
- [Derinimo įrankiai ir metodai](#debugging-tools-and-techniques)

## Microsoft Foundry modeliavimo paslaugų problemos

### Problema: OpenAI paslauga neprieinama regione

**Simptomai:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Priežastys:**
- Microsoft Foundry modeliai neprieinami pasirinktoje regione
- Kvota išeikvota pageidaujamuose regionuose
- Regioniniai pajėgumo apribojimai

**Sprendimai:**

1. **Patikrinkite regiono prieinamumą:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Atnaujinkite AZD konfigūraciją:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Naudokite alternatyvius regionus:**
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

### Problema: Modelio diegimo kvota viršyta

**Simptomai:**
```
Error: Deployment failed due to insufficient quota
```

**Sprendimai:**

1. **Patikrinkite dabartinę kvotą:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Prašykite kvotos padidinimo:**
Naudokite Foundry portalo kvotų valdymo srautą atitinkamai prenumeratai, regionui, modeliui ir diegimo tipui. Žr. [oficialias kvotų gaires](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). VM kvotos prašymas nepadidina modelio kvotos.

3. **Optimizuokite modelio pajėgumus:**
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

### Problema: Neteisinga API versija

**Simptomai:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Sprendimai:**

1. **Naudokite palaikomą API versiją:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Patikrinkite API versijų suderinamumą:**
Patikrinkite [Azure OpenAI API gyvavimo ciklo nuorodą](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM resursų teikėjo API versijos **ne** nurodo inferencijos/duomenų plokštumos API versijas. Nauji v1 klientai naudoja `/openai/v1/` be datuoto `api-version`; nekombinuokite šių dviejų kliento konfigūracijų.

## Azure AI paieškos problemos

### Problema: Nepakankamas paieškos paslaugos kainodaros lygis

**Simptomai:**
```
Error: Semantic search requires Basic tier or higher
```

**Sprendimai:**

1. **Naudokite palaikomą kainodaros lygį:**

Semantinis rūšiavimas reikalauja Basic arba aukštesnės versijos. Pereinant nuo Free/Basic prie kito lygio gali prireikti sukurti naują paieškos paslaugą ir iš naujo sukurti indeksus; SKU redagavimas nėra garantuotas vietinis atnaujinimas.
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

2. **Išjungti semantinę paiešką (vystymui):**
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
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Patikrinkite indekso schemą:**
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

3. **Naudokite valdomą tapatybę:**
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

## Container Apps diegimo problemos

### Problema: Konteinerio kūrimo klaidos

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

2. **Patvirtinkite priklausomybes:**
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

3. **Pridėkite sveikatos patikrinimą:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Konteinerio aplikacijos paleidimo klaidos

**Simptomai:**
```
Error: Container failed to start within timeout period
```

**Sprendimai:**

1. **Padidinkite paleidimo laukimo laiką:**
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

2. **Optimizuokite modelio įkėlimą:**
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

## Autentifikacijos ir leidimų klaidos

### Problema: Valdomos tapatybės leidimas atmestas

**Simptomai:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Sprendimai:**

1. **Patikrinkite vaidmenų priskyrimus:**
```bash
# Check current role assignments
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

3. **Išbandykite autentifikaciją:**
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

Žetonų gavimas įrodo autentifikaciją, bet ne leidimą iškviesti modelį. Išbandykite numatomą operaciją atskirai. Vietoje `DefaultAzureCredential` gali naudoti kūrėjo kredencialus; Azure patikrinkite, ar pasirinkta numatytoji valdyta tapatybė.

### Problema: Key Vault prieiga atmesta

**Simptomai:**
```
Error: The user, group or application does not have secrets get permission
```

**Sprendimai:**

1. **Suteikite Key Vault leidimus:**

Naudokite šį prieigos politikos fragmentą tik su seifu, turinčiu `enableRbacAuthorization: false`. RBAC įjungto seifo atveju naudokite 2 variantą; prieigos politika RBAC režimu neduoda duomenų plokštumos prieigos.
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

Seife turi būti `enableRbacAuthorization: true`; leidimų modelio keitimas reikalauja suplanuotos esamų prieigos migracijos.
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

## Modelių diegimo klaidos

### Problema: Modelio versija neprieinama

**Simptomai:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Sprendimai:**

1. **Patikrinkite prieinamus modelius:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Pasirinkite galimą modelį tiesiogiai:**
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

3. **Patikrinkite modelį prieš diegimą:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Veikimo ir mastelio problemos

### Problema: Didelis atsako delsimas

**Simptomai:**
- Atsako laikas > 30 sekundžių
- Laukimo klaidos
- Prasta vartotojo patirtis

**Sprendimai:**

1. **Įgyvendinkite užklausos laiko ribas:**
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

2. **Pridėkite atsako talpyklą:**
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

3. **Konfigūruokite automatinį mastelio keitimą:**
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

### Problema: Atminties trūkumas

**Simptomai:**
```
Error: Container killed due to memory limit exceeded
```

**Sprendimai:**

1. **Padidinkite atminties paskirstymą:**
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

## Sąnaudų ir kvotų valdymas

### Problema: Netikėtai didelės sąnaudos

**Simptomai:**
- Azure sąskaita didesnė nei tikėtasi
- Žetonų naudojimas viršija apskaičiavimus
- Biudžeto įspėjimai suveikia

**Sprendimai:**

1. **Įgyvendinkite sąnaudų kontrolę:**
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

Šis skaitiklis atmintyje yra iliustratyvus, o ne mėnesinių išlaidų kontrolė: jis atsinaujina perkrovus, nėra dalijamas tarp replikų ir tikrina naudojimą po kvietimo. Tikras limitas reikalauja patikimos apskaitos, konkurencijos saugių rezervacijų prieš užklausas ir mėnesinio nullinimo politikos. Konteinerių atminties metrikos taip pat turi atsižvelgti į cgroup ribas; `psutil.virtual_memory()` nėra patikimas konteinerio limito matavimas, o šiukšlių surinkimas neįgyvendina atminties ribos.

2. **Nustatykite sąnaudų įspėjimus:**
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

Deklaruokite `budgetStartDate` ir `budgetEndDate` savo šablone. Biudžetai informuoja; jie nestabdo išteklių ar neįveda kietos išlaidų ribos.

3. **Optimizuokite modelio pasirinkimą:**
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

## Derinimo įrankiai ir metodai

### AZD derinimo komandos

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

### AZD AI plėtinių diagnostikos komandos

Jei įdiegėte agentus naudodami `azd ai agent init`, pridėtiniai įrankiai yra prieinami:

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

> **Patarimas:** Naudokite `azd infra generate` rašyti IaC į diską, kad galėtumėte tiksliai patikrinti, kokie ištekliai buvo sukurti. Tai neįkainojama, kai derinami išteklių konfigūracijos klausimai. Žr. [AZD AI CLI nuorodą](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pilnai informacijai.

**Išleidimo žinomas diagnostikos (2026-11-04):** Agentams `1.0.0-beta.23` reikalingas `azd >= 1.37.0`; atnaujinkite pagrindinį CLI prieš nesuderinamus plėtinius. Ši agentų versija išlaiko kūrėjų RBAC įspėjimus galutiniame diegimo išvestyje ir identifikuoja versiją, susijusią su aktyvavimo klaidomis/laiko viršijimais. Laiko viršijimas neįrodo, kad diegimas nepavyko: peržiūrėkite mėgintą versiją prieš bandydami vėl. Taip pat taiso A2A 0.3 kvietimus, rodančius gyvavimo ciklo žinutes vietoje baigtų atsakymų. Branduolio `azd 1.37.1` taiso atšaukimo propagavimą per plėtinius; `1.37.2` pagerina kritinius patvirtinimus ir atšaukimo valdymą.

Jei senesnio pamokos vertinimo komanda tik spausdina migracijos gaires, įdiekite `azure.ai.evaluations` (`1.0.0-beta.2` reikalauja `azd >= 1.33.0`) ir naudokite `azd ai eval init`, `generate`, ir `run start`. Optimizavimo `--config` nebepriima senų vertinimo failų. Žr. [vertinimo migraciją](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ir [optimizavimo migraciją](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Programos derinimas

1. **Struktūruota registracija:**
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

2. **Sveikatos patikrinimo galiniai taškai:**
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

3. **Veikimo stebėjimas:**
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

## Dažnos klaidų kodų reikšmės ir sprendimai

| Klaidos kodas | Aprašymas | Sprendimas |
|------------|-------------|----------|
| 401 | Nepilnateisiška prieiga | Patikrinkite API raktus ir valdomos tapatybės konfigūraciją |
| 403 | Draudžiama | Patikrinkite RBAC vaidmenų priskyrimus |
| 429 | Ribotas dažnis | Įgyvendinkite pakartotinio bandymo logiką su eksponentine vėlinimo trajektorija |
| 500 | Vidinė serverio klaida | Patikrinkite modelio diegimo būseną ir žurnalus |
| 503 | Paslauga neprieinama | Patikrinkite paslaugos būklę ir regioninį prieinamumą |

## Tolimesni žingsniai

1. **Peržiūrėkite [AI modelio diegimo vadovą](../chapter-02-ai-development/ai-model-deployment.md)** dėl diegimo gerosios praktikos
2. **Užbaikite [Gamybinius AI įgūdžius](../chapter-08-production/production-ai-practices.md)** dėl įmonėms parengtų sprendimų
3. **Prisijunkite prie [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** dėl bendruomenės palaikymo
4. **Pateikite klaidas** į [AZD GitHub saugyklą](https://github.com/Azure/azure-dev) dėl AZD specifinių problemų

## Ištekliai

- [Azure OpenAI kvotų ir sulėtinimo trikčių šalinimas](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps trikčių šalinimas](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI paieškos trikčių šalinimas](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure diagnostikos agento įgūdžiai**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Įdiekite Azure trikčių šalinimo įgūdžius savo redaktoriuje: `npx skills add microsoft/github-copilot-for-azure`

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Derinimo vadovas](debugging.md)
- **➡️ Kitas skyrius**: [8 skyrius: Gamybiniai ir įmonių šablonai](../chapter-08-production/production-ai-practices.md)
- **🤖 Susiję**: [2 skyrius: AI-pirmas vystymas](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Nuoroda**: [Azure Developer CLI trikčių šalinimas](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->