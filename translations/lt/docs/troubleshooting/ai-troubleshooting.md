<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-24T09:32:53+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "lt"
}
-->
# AI-Specifinis Trikčių Šalinimo Vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Derinimo vadovas](debugging.md)
- **➡️ Kitas skyrius**: [8 skyrius: Gamybos ir įmonių modeliai](../microsoft-foundry/production-ai-practices.md)
- **🤖 Susiję**: [2 skyrius: AI-pirmasis kūrimas](../microsoft-foundry/microsoft-foundry-integration.md)

**Ankstesnis:** [Gamybos AI praktikos](../microsoft-foundry/production-ai-practices.md) | **Kitas:** [Pradžia su AZD](../getting-started/README.md)

Šis išsamus trikčių šalinimo vadovas aptaria dažniausiai pasitaikančias problemas diegiant AI sprendimus su AZD, pateikdamas sprendimus ir derinimo metodus, skirtus „Azure AI“ paslaugoms.

## Turinys

- [Azure OpenAI paslaugos problemos](../../../../docs/troubleshooting)
- [Azure AI paieškos problemos](../../../../docs/troubleshooting)
- [Konteinerių programų diegimo problemos](../../../../docs/troubleshooting)
- [Autentifikavimo ir leidimų klaidos](../../../../docs/troubleshooting)
- [Modelio diegimo nesėkmės](../../../../docs/troubleshooting)
- [Našumo ir mastelio problemos](../../../../docs/troubleshooting)
- [Kainų ir kvotų valdymas](../../../../docs/troubleshooting)
- [Derinimo įrankiai ir metodai](../../../../docs/troubleshooting)

## Azure OpenAI paslaugos problemos

### Problema: OpenAI paslauga nepasiekiama regione

**Simptomai:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Priežastys:**
- Azure OpenAI nepasiekiama pasirinktoje srityje
- Išnaudota kvota pageidaujamose srityse
- Regioniniai pajėgumų apribojimai

**Sprendimai:**

1. **Patikrinkite regiono pasiekiamumą:**
```bash
# Išvardykite galimas OpenAI regionus
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

### Problema: Viršyta modelio diegimo kvota

**Simptomai:**
```
Error: Deployment failed due to insufficient quota
```

**Sprendimai:**

1. **Patikrinkite dabartinę kvotą:**
```bash
# Patikrinkite kvotos naudojimą
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Prašykite kvotos padidinimo:**
```bash
# Pateikti kvotos padidinimo užklausą
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

2. **Patikrinkite API versijos suderinamumą:**
```bash
# Išvardykite palaikomas API versijas
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI paieškos problemos

### Problema: Nepakankamas paieškos paslaugos kainodaros lygis

**Simptomai:**
```
Error: Semantic search requires Basic tier or higher
```

**Sprendimai:**

1. **Atnaujinkite kainodaros lygį:**
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
# Patvirtinti indekso schemą
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

3. **Naudokite valdomą tapatybę:**
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

## Konteinerių programų diegimo problemos

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

3. **Pridėkite sveikatos patikrinimą:**
```python
# main.py - Pridėti sveikatos patikrinimo galinį tašką
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Konteinerio programos paleidimo klaidos

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

2. **Optimizuokite modelio įkėlimą:**
```python
# Tingiai įkelkite modelius, kad sumažintumėte paleidimo laiką
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
        # Čia inicijuokite AI klientą
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

### Problema: Valdomos tapatybės leidimas atmestas

**Simptomai:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Sprendimai:**

1. **Patikrinkite vaidmenų priskyrimus:**
```bash
# Patikrinkite dabartinius vaidmenų priskyrimus
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

3. **Išbandykite autentifikavimą:**
```python
# Išbandykite valdomos tapatybės autentifikavimą
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

### Problema: Prieiga prie Key Vault atmesta

**Simptomai:**
```
Error: The user, group or application does not have secrets get permission
```

**Sprendimai:**

1. **Suteikite Key Vault leidimus:**
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

2. **Naudokite RBAC vietoj prieigos politikų:**
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

## Modelio diegimo nesėkmės

### Problema: Modelio versija nepasiekiama

**Simptomai:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Sprendimai:**

1. **Patikrinkite galimus modelius:**
```bash
# Sąrašo galimi modeliai
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Naudokite modelio atsarginius variantus:**
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

3. **Patikrinkite modelį prieš diegimą:**
```python
# Modelio patvirtinimas prieš diegimą
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

## Našumo ir mastelio problemos

### Problema: Didelė atsako delsimo trukmė

**Simptomai:**
- Atsako laikas > 30 sekundžių
- Laiko limitų klaidos
- Prasta naudotojo patirtis

**Sprendimai:**

1. **Įgyvendinkite užklausų laiko limitus:**
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

2. **Pridėkite atsako talpyklą:**
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

3. **Konfigūruokite automatinį mastelį:**
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

### Problema: Atminties trūkumo klaidos

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
# Atminties efektyvus modelio tvarkymas
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Patikrinkite atminties naudojimą prieš apdorojimą
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Priverstinis šiukšlių surinkimas
            
        result = await self._process_ai_request(request)
        
        # Išvalykite po apdorojimo
        gc.collect()
        return result
```

## Kainų ir kvotų valdymas

### Problema: Netikėtai didelės išlaidos

**Simptomai:**
- Azure sąskaita didesnė nei tikėtasi
- Tokenų naudojimas viršija prognozes
- Suaktyvinti biudžeto įspėjimai

**Sprendimai:**

1. **Įgyvendinkite išlaidų kontrolę:**
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

2. **Nustatykite išlaidų įspėjimus:**
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

3. **Optimizuokite modelio pasirinkimą:**
```python
# Modelio pasirinkimas pagal sąnaudas
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # už 1K žetonų
    'gpt-4': 0.03,          # už 1K žetonų
    'gpt-35-turbo': 0.0015  # už 1K žetonų
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
# Įjungti išsamų registravimą
azd up --debug

# Patikrinti diegimo būseną
azd show

# Peržiūrėti diegimo žurnalus
azd logs --follow

# Patikrinti aplinkos kintamuosius
azd env get-values
```

### Programos derinimas

1. **Struktūrizuotas žurnalas:**
```python
import logging
import json

# Konfigūruokite struktūrizuotą registravimą AI programoms
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
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Patikrinkite OpenAI ryšį
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Patikrinkite paieškos paslaugą
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

3. **Našumo stebėjimas:**
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

## Dažniausi klaidų kodai ir sprendimai

| Klaidos kodas | Aprašymas | Sprendimas |
|---------------|-----------|-----------|
| 401 | Neautorizuota | Patikrinkite API raktus ir valdomos tapatybės konfigūraciją |
| 403 | Draudžiama | Patikrinkite RBAC vaidmenų priskyrimus |
| 429 | Per didelis užklausų skaičius | Įgyvendinkite pakartojimo logiką su eksponentiniu atidėjimu |
| 500 | Vidinė serverio klaida | Patikrinkite modelio diegimo būseną ir žurnalus |
| 503 | Paslauga nepasiekiama | Patikrinkite paslaugos būklę ir regiono pasiekiamumą |

## Kiti žingsniai

1. **Peržiūrėkite [AI modelio diegimo vadovą](ai-model-deployment.md)**, kad sužinotumėte geriausias diegimo praktikas
2. **Užbaikite [Gamybos AI praktikas](production-ai-practices.md)**, kad pasiruoštumėte įmonės sprendimams
3. **Prisijunkite prie [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** bendruomenės palaikymui
4. **Pateikite problemas** [AZD GitHub saugykloje](https://github.com/Azure/azure-dev) dėl AZD specifinių problemų

## Ištekliai

- [Azure OpenAI paslaugos trikčių šalinimas](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Konteinerių programų trikčių šalinimas](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI paieškos trikčių šalinimas](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 7 skyrius - Trikčių šalinimas ir derinimas
- **⬅️ Ankstesnis**: [Derinimo vadovas](debugging.md)
- **➡️ Kitas skyrius**: [8 skyrius: Gamybos ir įmonių modeliai](../microsoft-foundry/production-ai-practices.md)
- **🤖 Susiję**: [2 skyrius: AI-pirmasis kūrimas](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI trikčių šalinimas](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Dėl svarbios informacijos rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar neteisingus aiškinimus, atsiradusius naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->