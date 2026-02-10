# AI-specifik felsökningsguide

**Kapitelnavigering:**
- **📚 Kursens Startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt Kapitel**: Kapitel 7 - Felsökning och debugging
- **⬅️ Föregående**: [Felsökningsguide](debugging.md)
- **➡️ Nästa kapitel**: [Kapitel 8: Produktions- och företagsmönster](../chapter-08-production/production-ai-practices.md)
- **🤖 Relaterat**: [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Föregående:** [Produktions-AI-praktiker](../chapter-08-production/production-ai-practices.md) | **Nästa:** [AZD-grunderna](../chapter-01-foundation/azd-basics.md)

Denna omfattande felsökningsguide tar upp vanliga problem vid distribution av AI-lösningar med AZD och erbjuder lösningar och felsökningstekniker specifika för Azure AI-tjänster.

## Innehållsförteckning

- [Problem med Azure OpenAI-tjänsten](../../../../docs/chapter-07-troubleshooting)
- [Problem med Azure AI Search](../../../../docs/chapter-07-troubleshooting)
- [Distribueringsproblem för Container Apps](../../../../docs/chapter-07-troubleshooting)
- [Autentiserings- och behörighetsfel](../../../../docs/chapter-07-troubleshooting)
- [Misslyckanden vid modellimplementering](../../../../docs/chapter-07-troubleshooting)
- [Prestanda- och skalningsproblem](../../../../docs/chapter-07-troubleshooting)
- [Kostnads- och kvothantering](../../../../docs/chapter-07-troubleshooting)
- [Felsökningsverktyg och tekniker](../../../../docs/chapter-07-troubleshooting)

## Problem med Azure OpenAI-tjänsten

### Problem: OpenAI-tjänsten inte tillgänglig i regionen

**Symptom:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Orsaker:**
- Azure OpenAI inte tillgängligt i vald region
- Kvoten uttömd i föredragna regioner
- Regionala kapacitetsbegränsningar

**Lösningar:**

1. **Kontrollera regiontillgänglighet:**
```bash
# Lista tillgängliga regioner för OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Uppdatera AZD-konfigurationen:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Använd alternativa regioner:**
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

### Problem: Kvot för modelldistribution överskriden

**Symptom:**
```
Error: Deployment failed due to insufficient quota
```

**Lösningar:**

1. **Kontrollera aktuell kvot:**
```bash
# Kontrollera kvotanvändningen
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Begär ökning av kvot:**
```bash
# Skicka begäran om kvotökning
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimera modellkapacitet:**
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

### Problem: Ogiltig API-version

**Symptom:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Lösningar:**

1. **Använd en stödd API-version:**
```python
# Använd senaste stödda versionen
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Kontrollera kompatibilitet för API-versionen:**
```bash
# Lista över stödda API-versioner
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problem med Azure AI Search

### Problem: Prissättningsnivå för söktjänsten otillräcklig

**Symptom:**
```
Error: Semantic search requires Basic tier or higher
```

**Lösningar:**

1. **Uppgradera prissättningsnivå:**
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

2. **Inaktivera semantisk sökning (utveckling):**
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

### Problem: Indexskapande misslyckades

**Symptom:**
```
Error: Cannot create index, insufficient permissions
```

**Lösningar:**

1. **Verifiera nycklar för söktjänsten:**
```bash
# Hämta söktjänstens administratörsnyckel
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kontrollera indexschema:**
```python
# Validera indexschema
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

3. **Använd hanterad identitet:**
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

## Distribueringsproblem för Container Apps

### Problem: Containerbyggfel

**Symptom:**
```
Error: Failed to build container image
```

**Lösningar:**

1. **Kontrollera Dockerfile-syntax:**
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

2. **Validera beroenden:**
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

3. **Lägg till hälsokontroll:**
```python
# main.py - Lägg till hälsokontrollendpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Container App startfel

**Symptom:**
```
Error: Container failed to start within timeout period
```

**Lösningar:**

1. **Öka starttimeout:**
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

2. **Optimera modellinladdning:**
```python
# Ladda modeller vid behov för att minska uppstartstiden
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
        # Initiera AI-klienten här
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Uppstart
    app.state.model_manager = ModelManager()
    yield
    # Avstängning
    pass

app = FastAPI(lifespan=lifespan)
```

## Autentiserings- och behörighetsfel

### Problem: Behörighet nekad för hanterad identitet

**Symptom:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Lösningar:**

1. **Verifiera rolltilldelningar:**
```bash
# Kontrollera aktuella rolltilldelningar
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tilldela nödvändiga roller:**
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

3. **Testa autentisering:**
```python
# Testa autentisering med hanterad identitet
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

### Problem: Åtkomst till Key Vault nekad

**Symptom:**
```
Error: The user, group or application does not have secrets get permission
```

**Lösningar:**

1. **Bevilja behörigheter för Key Vault:**
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

2. **Använd RBAC istället för åtkomstpolicyer:**
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

## Misslyckanden vid modellimplementering

### Problem: Modellversion ej tillgänglig

**Symptom:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lösningar:**

1. **Kontrollera tillgängliga modeller:**
```bash
# Lista tillgängliga modeller
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Använd reservmodeller:**
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

3. **Validera modell innan distribution:**
```python
# Modellvalidering före driftsättning
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

## Prestanda- och skalningsproblem

### Problem: Höga svarstider

**Symptom:**
- Svarstider > 30 sekunder
- Timeout-fel
- Dålig användarupplevelse

**Lösningar:**

1. **Inför förfrågnings-timeouter:**
```python
# Konfigurera lämpliga tidsgränser
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

2. **Lägg till svarscachning:**
```python
# Redis-cache för svar
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

3. **Konfigurera autoskalning:**
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

### Problem: Out of memory-fel

**Symptom:**
```
Error: Container killed due to memory limit exceeded
```

**Lösningar:**

1. **Öka minnesallokering:**
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

2. **Optimera minnesanvändning:**
```python
# Minneseffektiv modellhantering
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Kontrollera minnesanvändningen innan bearbetning
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Tvinga skräpsamling
            
        result = await self._process_ai_request(request)
        
        # Rensa upp efter bearbetning
        gc.collect()
        return result
```

## Kostnads- och kvothantering

### Problem: Oväntat höga kostnader

**Symptom:**
- Azure-faktura högre än förväntat
- Tokenanvändning överstiger uppskattningarna
- Budgetvarningar utlöst

**Lösningar:**

1. **Inför kostnadskontroller:**
```python
# Spårning av tokenanvändning
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

2. **Ställ in kostnadsvarningar:**
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

3. **Optimera modellval:**
```python
# Kostnadsmedvetet modellval
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K token
    'gpt-4': 0.03,          # per 1K token
    'gpt-35-turbo': 0.0015  # per 1K token
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

## Felsökningsverktyg och tekniker

### AZD felsökningskommandon

```bash
# Aktivera utförlig loggning
azd up --debug

# Kontrollera distributionsstatus
azd show

# Visa applikationsloggar (öppnar övervakningspanelen)
azd monitor --logs

# Visa realtidsmätvärden
azd monitor --live

# Kontrollera miljövariabler
azd env get-values
```

### Applikationsfelsökning

1. **Strukturerad loggning:**
```python
import logging
import json

# Konfigurera strukturerad loggning för AI-applikationer
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

2. **Hälsokontrollendpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Kontrollera OpenAI-anslutningen
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Kontrollera söktjänsten
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

3. **Prestandaövervakning:**
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

## Vanliga felkoder och lösningar

| Felkod | Beskrivning | Lösning |
|------------|-------------|----------|
| 401 | Obehörig | Kontrollera API-nycklar och konfiguration för hanterad identitet |
| 403 | Åtkomst nekad | Verifiera RBAC-rolltilldelningar |
| 429 | Begränsad | Implementera återförsök med exponentiell backoff |
| 500 | Internt serverfel | Kontrollera modellimplementeringsstatus och loggar |
| 503 | Tjänst otillgänglig | Verifiera tjänstens hälsa och regional tillgänglighet |

## Nästa steg

1. **Granska [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** för bästa praxis vid distribution
2. **Slutför [Produktions-AI-praktiker](../chapter-08-production/production-ai-practices.md)** för företagsklara lösningar
3. **Gå med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** för communitystöd
4. **Skicka in ärenden** till [AZD GitHub-förvaret](https://github.com/Azure/azure-dev) för AZD-specifika problem

## Resurser

- [Felsökning för Azure OpenAI-tjänsten](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Felsökning för Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Felsökning för Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Kapitelnavigering:**
- **📚 Kursens Startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt Kapitel**: Kapitel 7 - Felsökning och debugging
- **⬅️ Föregående**: [Felsökningsguide](debugging.md)
- **➡️ Nästa kapitel**: [Kapitel 8: Produktions- och företagsmönster](../chapter-08-production/production-ai-practices.md)
- **🤖 Relaterat**: [Kapitel 2: AI-först utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Felsökning för Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet i dess originalspråk bör betraktas som den auktoritativa källan. För viktig eller kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->