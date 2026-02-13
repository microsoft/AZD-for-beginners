# AI-spesifikk feilsøkingsguide

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 7 - Feilsøking og debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Neste kapittel**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relatert**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Forrige:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Neste:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

Denne omfattende feilsøkingsguiden tar for seg vanlige problemer ved utrulling av AI-løsninger med AZD, og gir løsninger og feilsøkingsmetoder spesifikke for Azure AI-tjenester.

## Innholdsfortegnelse

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### Issue: OpenAI Service Unavailable in Region

**Symptomer:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Årsaker:**
- Azure OpenAI ikke tilgjengelig i valgt region
- Kvote oppbrukt i foretrukne regioner
- Regionale kapasitetsbegrensninger

**Løsninger:**

1. **Sjekk regiontilgjengelighet:**
```bash
# List opp tilgjengelige regioner for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Oppdater AZD-konfigurasjon:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Bruk alternative regioner:**
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

### Issue: Model Deployment Quota Exceeded

**Symptomer:**
```
Error: Deployment failed due to insufficient quota
```

**Løsninger:**

1. **Sjekk gjeldende kvote:**
```bash
# Sjekk kvoteforbruk
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Be om kvoteøkning:**
```bash
# Send forespørsel om økning av kvote
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimaliser modellkapasitet:**
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

### Issue: Invalid API Version

**Symptomer:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Løsninger:**

1. **Bruk støttet API-versjon:**
```python
# Bruk den nyeste støttede versjonen
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Sjekk API-versjonskompatibilitet:**
```bash
# Liste over støttede API-versjoner
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Symptomer:**
```
Error: Semantic search requires Basic tier or higher
```

**Løsninger:**

1. **Oppgrader prisnivå:**
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

2. **Deaktiver semantisk søk (utvikling):**
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

### Issue: Index Creation Failures

**Symptomer:**
```
Error: Cannot create index, insufficient permissions
```

**Løsninger:**

1. **Bekreft Search Service-nøkler:**
```bash
# Hent administrasjonsnøkkel for søketjenesten
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Sjekk indeks-skjema:**
```python
# Valider indeksskjema
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

3. **Bruk administrert identitet:**
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

## Container Apps Deployment Issues

### Issue: Container Build Failures

**Symptomer:**
```
Error: Failed to build container image
```

**Løsninger:**

1. **Sjekk Dockerfile-syntaks:**
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

2. **Valider avhengigheter:**
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

3. **Legg til helsesjekk:**
```python
# main.py - Legg til endepunkt for helsesjekk
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**Symptomer:**
```
Error: Container failed to start within timeout period
```

**Løsninger:**

1. **Øk oppstartstimeout:**
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

2. **Optimaliser modellinnlasting:**
```python
# Last inn modeller ved behov for å redusere oppstartstiden
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
        # Initialiser AI-klienten her
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Oppstart
    app.state.model_manager = ModelManager()
    yield
    # Nedstengning
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Symptomer:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Løsninger:**

1. **Bekreft rolletilordninger:**
```bash
# Sjekk nåværende rollefordelinger
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tildel nødvendige roller:**
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

3. **Test autentisering:**
```python
# Test av autentisering med administrert identitet
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

### Issue: Key Vault Access Denied

**Symptomer:**
```
Error: The user, group or application does not have secrets get permission
```

**Løsninger:**

1. **Gi Key Vault-tillatelser:**
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

2. **Bruk RBAC i stedet for tilgangspolicyer:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**Symptomer:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Løsninger:**

1. **Sjekk tilgjengelige modeller:**
```bash
# List tilgjengelige modeller
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Bruk modell-fallbacks:**
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

3. **Valider modell før utrulling:**
```python
# Validering av modellen før utrulling
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

## Performance and Scaling Issues

### Issue: High Latency Responses

**Symptomer:**
- Responstider > 30 sekunder
- Timeout-feil
- Dårlig brukeropplevelse

**Løsninger:**

1. **Implementer forespørselstimeouts:**
```python
# Konfigurer riktige tidsavbrudd
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

2. **Legg til responscaching:**
```python
# Redis-cache for svar
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

3. **Konfigurer autoskalering:**
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

### Issue: Memory Out of Errors

**Symptomer:**
```
Error: Container killed due to memory limit exceeded
```

**Løsninger:**

1. **Øk minnetildeling:**
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

2. **Optimaliser minnebruk:**
```python
# Minneeffektiv modellhåndtering
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Sjekk minnebruk før behandling
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Tving fram søppeloppsamling
            
        result = await self._process_ai_request(request)
        
        # Rydd opp etter behandling
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**Symptomer:**
- Azure-regning høyere enn forventet
- Tokenbruk overstiger estimater
- Budsjettvarsler utløst

**Løsninger:**

1. **Implementer kostnadskontroller:**
```python
# Sporing av tokenbruk
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

2. **Sett opp kostnadsvarsler:**
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

3. **Optimaliser modellvalg:**
```python
# Kostnadsbevisst modellvalg
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1 000 tokens
    'gpt-4': 0.03,          # per 1 000 tokens
    'gpt-35-turbo': 0.0015  # per 1 000 tokens
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# Aktiver detaljert logging
azd up --debug

# Sjekk utrullingsstatus
azd show

# Vis applikasjonslogger (åpner overvåkingsdashbord)
azd monitor --logs

# Vis sanntidsmetrikker
azd monitor --live

# Sjekk miljøvariabler
azd env get-values
```

### Application Debugging

1. **Strukturert logging:**
```python
import logging
import json

# Konfigurer strukturert logging for AI-applikasjoner
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

2. **Helsesjekk-endepunkter:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Sjekk tilkoblingen til OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Sjekk søketjenesten
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

3. **Ytelsesovervåking:**
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

## Common Error Codes and Solutions

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Uautorisert | Sjekk API-nøkler og konfigurasjon av administrert identitet |
| 403 | Forbudt | Verifiser RBAC-rolletilordninger |
| 429 | Begrenset av rate | Implementer retry-logikk med eksponentiell backoff |
| 500 | Intern serverfeil | Sjekk modellutrullingsstatus og logger |
| 503 | Tjenesten utilgjengelig | Verifiser tjenestehelse og regional tilgjengelighet |

## Neste steg

1. **Gå gjennom [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** for beste praksis ved utrulling
2. **Fullfør [Production AI Practices](../chapter-08-production/production-ai-practices.md)** for enterprise-klare løsninger
3. **Bli med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for fellesskapsstøtte
4. **Rapporter problemer** til [AZD GitHub-repositoriet](https://github.com/Azure/azure-dev) for AZD-spesifikke problemer

## Ressurser

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Kapittelnavigasjon:**
- **📚 Kursoversikt**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 7 - Feilsøking og debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Neste kapittel**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relatert**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selv om vi arbeider for å være nøyaktige, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket bør betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->