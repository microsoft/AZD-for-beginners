# AI-Specifik Felsökningsguide

**Kapitelnavigation:**
- **📚 Kurshemsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 7 - Felsökning & Debugging
- **⬅️ Föregående**: [Debugging Guide](debugging.md)
- **➡️ Nästa Kapitel**: [Kapitel 8: Produktions- & Enterprise-mönster](../chapter-08-production/production-ai-practices.md)
- **🤖 Relaterat**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

Denna omfattande felsökningsguide behandlar vanliga problem vid implementering av AI-lösningar med AZD, och erbjuder lösningar och felsökningstekniker specifika för Azure AI-tjänster.

> **Omfattning:** Kommandon använder exempelresursnamn; ersätt dem och välj rätt prenumeration. Bicep-block är fragment att slå ihop i en befintlig mall, inte fristående implementationer. Python-exempel kräver angivna SDK:er och applikationskonfiguration. Ingen live-implementation i Azure har genomförts för denna granskning.

## Innehållsförteckning

- [Microsoft Foundry Models Service-problem](#microsoft-foundry-models-service-issues)
- [Azure AI Search-problem](#azure-ai-search-problems)
- [Container Apps-implementeringsproblem](#container-apps-deployment-issues)
- [Autentiserings- och behörighetsfel](#authentication-and-permission-errors)
- [Misslyckanden vid modellimplementering](#model-deployment-failures)
- [Prestanda- och skalningsproblem](#performance-and-scaling-issues)
- [Kostnads- och kvotstyrning](#cost-and-quota-management)
- [Felsökningsverktyg och tekniker](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service-problem

### Problem: OpenAI-tjänst otillgänglig i regionen

**Symptom:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Orsaker:**
- Microsoft Foundry Models saknas i vald region
- Kvoten uttömd i prioriterade regioner
- Regionala kapacitetsbegränsningar

**Lösningar:**

1. **Kontrollera Regions Tillgänglighet:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Uppdatera AZD-konfiguration:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Använd Alternativa Regioner:**
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

### Problem: Modellimplementeringskvot överskriden

**Symptom:**
```
Error: Deployment failed due to insufficient quota
```

**Lösningar:**

1. **Kontrollera Aktuell Kvot:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Begär Kvothöjning:**
Använd Foundry-portalen för kvotförvaltningsflödet för berörd prenumeration, region, modell och deploymenttyp. Se den [officiella kvotguiden](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). En VM-kvotförfrågan ökar inte modellkvoten.

3. **Optimera Modellkapacitet:**
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

### Problem: Ogiltig API-version

**Symptom:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Lösningar:**

1. **Använd Stödd API-version:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Kontrollera API-versionens Kompatibilitet:**
Kontrollera [Azure OpenAI API lifecycle referens](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM-resource-provider API-versioner listar **inte** inferens/data-plane API-versioner. Nya v1-klienter använder `/openai/v1/` utan en daterad `api-version`; blanda inte dessa klientkonfigurationer.

## Azure AI Search-problem

### Problem: Otillräcklig prisnivå för söktjänsten

**Symptom:**
```
Error: Semantic search requires Basic tier or higher
```

**Lösningar:**

1. **Använd en Stödd Prisnivå:**

Semantisk ranker kräver Basic eller högre. Att byta från Free/Basic till en annan nivå kan kräva att skapa en ny söktjänst och återskapa index; att redigera en SKU är inte en garanterad uppgradering på plats.
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

2. **Inaktivera Semantisk Sökning (Utveckling):**
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

### Problem: Misslyckanden vid indexskapande

**Symptom:**
```
Error: Cannot create index, insufficient permissions
```

**Lösningar:**

1. **Verifiera Sökservice-nycklar:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kontrollera Index-schema:**
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

3. **Använd Hanterad Identitet:**
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

## Container Apps-implementeringsproblem

### Problem: Container Build-misslyckanden

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

2. **Validera Beroenden:**
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

3. **Lägg till Hälsokontroll:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Container App-startmisslyckanden

**Symptom:**
```
Error: Container failed to start within timeout period
```

**Lösningar:**

1. **Öka Starttidsgräns:**
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

2. **Optimera Modellinläsning:**
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

## Autentiserings- och Behörighetsfel

### Problem: Permission nekad för Managed Identity

**Symptom:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Lösningar:**

1. **Verifiera Rolltilldelningar:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tilldela Nödvändiga Roller:**
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

3. **Testa Autentisering:**
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

Tokenförvärv bevisar autentisering, inte behörighet att anropa en modell. Testa den avsedda operationen separat. Lokalt kan `DefaultAzureCredential` använda utvecklarinloggning; i Azure, verifiera att rätt managed identity är vald.

### Problem: Nyckelvalvåtkomst nekad

**Symptom:**
```
Error: The user, group or application does not have secrets get permission
```

**Lösningar:**

1. **Ge Nyckelvalvstillstånd:**

Använd endast följande åtkomstpolicyutdrag för en valv med `enableRbacAuthorization: false`. För ett RBAC-aktiverat valv, använd alternativ 2; att lägga till en åtkomstpolicy ger inte data-plane-åtkomst i RBAC-läge.
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

2. **Använd RBAC Istället för Åtkomstpolicyer:**

Valvet måste ha `enableRbacAuthorization: true`; att byta behörighetsmodell kräver planerad migrering av befintliga åtkomster.
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

## Modellimplementeringsmisslyckanden

### Problem: Modellversion tillgänglig

**Symptom:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lösningar:**

1. **Kontrollera Tillgängliga Modeller:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Välj en Tillgänglig Modell Explicit:**
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

3. **Validera Modell Före Implementering:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Prestanda- och Skalningsproblem

### Problem: Höga Fördröjningar i Svar

**Symptom:**
- Svarstider över 30 sekunder
- Timeout-fel
- Dålig användarupplevelse

**Lösningar:**

1. **Implementera Timeout för Förfrågningar:**
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

2. **Lägg till Svarscachning:**
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

3. **Konfigurera Autoskalning:**
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

### Problem: Minnesuteblåsningar

**Symptom:**
```
Error: Container killed due to memory limit exceeded
```

**Lösningar:**

1. **Öka Minnestilldelning:**
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

2. **Optimera Minnesanvändning:**
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

## Kostnads- och Kvotstyrning

### Problem: Ov väntade Höga Kostnader

**Symptom:**
- Azure-faktura högre än förväntat
- Tokenanvändning överstiger uppskattningar
- Budgetvarningar utlöstes

**Lösningar:**

1. **Implementera Kostnadskontroller:**
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

Denna räknare i minnet är illustrativ, inte en månatlig utgiftskontroll: den återställs vid omstart, delas inte mellan repliker och kontrollerar användningen först efter ett anrop. En verklig gräns kräver hållbar bokföring, samtidighetssäkra reserveringar innan förfrågningar och en policy för månatlig återställning. Containerminnesmått måste också ta hänsyn till cgroup-gränser; `psutil.virtual_memory()` är inget pålitligt containergränsmått och skräpsamling genomdriver inte minnesgräns.

2. **Konfigurera Kostnadsvarningar:**
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

Deklarera `budgetStartDate` och `budgetEndDate` i din mall. Budgetar notifierar; de stoppar inte resurser eller inför hård utgiftsgräns.

3. **Optimera Modellval:**
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

## Felsökningsverktyg och tekniker

### AZD-felsökningskommandon

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

### AZD AI Extensions-kommandon för Diagnostik

Om du distribuerade agenter med `azd ai agent init` finns dessa ytterligare verktyg tillgängliga:

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

> **Tips:** Använd `azd infra generate` för att skriva IaC till disk så att du kan inspektera exakt vilka resurser som provisionerades. Detta är ovärderligt vid felsökning av resurskonfigurationsproblem. Se [AZD AI CLI-referensen](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) för fullständiga detaljer.

**Versionsmedveten diagnostik (2026-11-04):** Agenter `1.0.0-beta.23` kräver `azd >= 1.37.0`; uppgradera kärn-CLI innan inkompatibla tillägg. Denna agentversion behåller utvecklar-RBAC-varningar i slutgiltig deploymentsutdata och identifierar vilken version som var inblandad vid aktiveringsfel/tidsgränser. Ett timeout innebär inte att distributionen misslyckades: inspektera den försöka versionen innan omförsök. Den rättar också A2A 0.3 anrop som visar livscykelmeddelanden istället för avslutade svar. Kärn-`azd 1.37.1` rättar avbokningspropagering mellan tillägg; `1.37.2` förbättrar kritiska provisioneringsbekräftelser och hantering av avbokningar.

Om ett äldre handledningsvärderingskommando bara skriver ut migreringsvägledning, installera `azure.ai.evaluations` (`1.0.0-beta.2` kräver `azd >= 1.33.0`) och använd `azd ai eval init`, `generate`, och `run start`. Optimerings `--config` accepterar inte längre legacy värderingsfiler. Se [värderingsmigrering](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) och [optimeringsmigrering](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Applikationsfelsökning

1. **Strukturerad loggning:**
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

2. **Hälsokontrollendpoints:**
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
| 401 | Obefogad | Kontrollera API-nycklar och managed identity-konfiguration |
| 403 | Nekad tillgång | Verifiera RBAC-rolltilldelningar |
| 429 | Begränsad | Implementera omförsökslogik med exponentiell backoff |
| 500 | Intern serverfel | Kontrollera modellimplementeringsstatus och loggar |
| 503 | Tjänst otillgänglig | Verifiera tjänstehälsa och regional tillgänglighet |

## Nästa steg

1. **Granska [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** för bästa praxis vid implementation
2. **Genomför [Production AI Practices](../chapter-08-production/production-ai-practices.md)** för företagsklara lösningar
3. **Gå med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** för community-stöd
4. **Rapportera problem** till [AZD GitHub-repository](https://github.com/Azure/azure-dev) för AZD-specifika problem

## Resurser

- [Felsökning av Azure OpenAI-kvot och hämtningsbegränsning](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps Felsökning](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Felsökning](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installera Azure-felsökningsfärdigheter i din editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kurshemsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 7 - Felsökning & Debugging
- **⬅️ Föregående**: [Debugging Guide](debugging.md)
- **➡️ Nästa Kapitel**: [Kapitel 8: Produktions- & Enterprise-mönster](../chapter-08-production/production-ai-practices.md)
- **🤖 Relaterat**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referens**: [Azure Developer CLI Felsökning](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->