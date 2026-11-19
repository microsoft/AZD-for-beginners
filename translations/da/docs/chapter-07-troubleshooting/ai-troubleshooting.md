# AI-specifik fejlfinding

**Kapitelnavigation:**
- **📚 Kursus Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Næste Kapitel**: [Kapitel 8: Produktion & Enterprise-mønstre](../chapter-08-production/production-ai-practices.md)
- **🤖 Relateret**: [Kapitel 2: AI-Første Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

Denne omfattende fejlfinding guide adresserer almindelige problemer ved implementering af AI-løsninger med AZD og tilbyder løsninger og debugging-teknikker specifikt for Azure AI-tjenester.

> **Omfang:** Kommandoer bruger eksempelressourcenavne; udskift disse og vælg det korrekte abonnement. Bicep-blokke er fragmenter til at flette ind i en eksisterende skabelon, ikke selvstændige implementeringer. Python-scripts kræver de angivne SDK'er og applikationskonfiguration. Der er ikke foretaget en live Azure-implementering for denne gennemgang.

## Indholdsfortegnelse

- [Microsoft Foundry Models Service-problemer](#microsoft-foundry-models-service-issues)
- [Azure AI Search-problemer](#azure-ai-search-problems)
- [Container Apps-implementeringsproblemer](#container-apps-deployment-issues)
- [Autentificering og tilladelsesfejl](#authentication-and-permission-errors)
- [Modelimplementeringsfejl](#model-deployment-failures)
- [Ydelse og skalering problemer](#performance-and-scaling-issues)
- [Omkostnings- og kvotestyring](#cost-and-quota-management)
- [Debuggingværktøjer og teknikker](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service-problemer

### Problem: OpenAI-tjeneste utilgængelig i region

**Symptomer:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Årsager:**
- Microsoft Foundry Models er ikke tilgængelig i den valgte region
- Kvota opbrugt i foretrukne regioner
- Regionale kapacitetsbegrænsninger

**Løsninger:**

1. **Tjek regions tilgængelighed:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Opdater AZD-konfiguration:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Brug alternative regioner:**
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

### Problem: Modelimplementeringskvota overskredet

**Symptomer:**
```
Error: Deployment failed due to insufficient quota
```

**Løsninger:**

1. **Kontroller nuværende kvota:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Anmod om kvotaforhøjelse:**
Brug Foundry-portals kvotastyringsworkflow for det berørte abonnement, region, model og implementeringstype. Se den [officielle kvotavejledning](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). En VM-kvotaanmodning øger ikke modelkvota.

3. **Optimer modelkapacitet:**
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

### Problem: Ugyldig API-version

**Symptomer:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Løsninger:**

1. **Brug understøttet API-version:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Tjek API versionskompatibilitet:**
Tjek [Azure OpenAI API lifecycle reference](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM resource-provider API versioner inkluderer **ikke** inference/data-plane API versioner. Nye v1-klienter bruger `/openai/v1/` uden en dateret `api-version`; bland ikke de to klientkonfigurationer.

## Azure AI Search-problemer

### Problem: Søgetjenestens prismodel er utilstrækkelig

**Symptomer:**
```
Error: Semantic search requires Basic tier or higher
```

**Løsninger:**

1. **Brug en understøttet prismodel:**

Semantisk rangering kræver Basic eller højere. Overgang fra Free/Basic til en anden tier kan kræve oprettelse af en ny søgetjeneste og genopbygning af indeks; redigering af en SKU garanterer ikke en opgradering på stedet.
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

2. **Deaktiver semantisk søgning (udvikling):**
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

### Problem: Fejl ved oprettelse af indeks

**Symptomer:**
```
Error: Cannot create index, insufficient permissions
```

**Løsninger:**

1. **Bekræft søgetjenestens nøgler:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Tjek indksskema:**
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

3. **Brug Managed Identity:**
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

## Container Apps-implementeringsproblemer

### Problem: Fejl ved containerbygning

**Symptomer:**
```
Error: Failed to build container image
```

**Løsninger:**

1. **Tjek Dockerfile-syntaks:**
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

2. **Valider afhængigheder:**
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

3. **Tilføj helbredstjek:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Container App opstart fejler

**Symptomer:**
```
Error: Container failed to start within timeout period
```

**Løsninger:**

1. **Forøg opstartstimeout:**
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

2. **Optimer modelloading:**
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

## Autentificerings- og tilladelsesfejl

### Problem: Managed Identity tilladelse nægtet

**Symptomer:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Løsninger:**

1. **Bekræft rollefordelinger:**
```bash
# Check current role assignments
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

3. **Test autentificering:**
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

Token-anskaffelse beviser autentificering, ikke tilladelse til at kalde en model. Test den tilsigtede operation separat. Lokalt kan `DefaultAzureCredential` bruge udvikler legitimationsoplysninger; i Azure skal du bekræfte den tilsigtede managed identity er valgt.

### Problem: Nægtet adgang til Key Vault

**Symptomer:**
```
Error: The user, group or application does not have secrets get permission
```

**Løsninger:**

1. **Giv Key Vault tilladelser:**

Brug følgende access-policy fragment kun til en vault med `enableRbacAuthorization: false`. For en RBAC-aktiveret vault, brug mulighed 2; tilføjelse af en adgangspolitik giver ikke data-plane adgang i RBAC-tilstand.
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

2. **Brug RBAC i stedet for adgangspolitikker:**

Vault skal have `enableRbacAuthorization: true`; ændring af tilladelsesmodeller kræver en planlagt migration af eksisterende adgang.
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

## Modelimplementeringsfejl

### Problem: Modelversion ikke tilgængelig

**Symptomer:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Løsninger:**

1. **Kontroller tilgængelige modeller:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Vælg eksplicit en tilgængelig model:**
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

3. **Valider model før implementering:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Ydelses- og skaleringsproblemer

### Problem: Høj latenstid i svar

**Symptomer:**
- Responstider > 30 sekunder
- Timeout-fejl
- Dårlig brugeroplevelse

**Løsninger:**

1. **Implementer forespørgsels-timeouts:**
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

2. **Tilføj svar-caching:**
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

### Problem: Hukommelsesfejl

**Symptomer:**
```
Error: Container killed due to memory limit exceeded
```

**Løsninger:**

1. **Forøg hukommelsestildeling:**
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

2. **Optimer hukommelsesbrug:**
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

## Omkostnings- og kvotestyring

### Problem: Uventet høje omkostninger

**Symptomer:**
- Azure regning højere end forventet
- Token- brug overskrider estimater
- Budgetalarmer udløst

**Løsninger:**

1. **Implementer omkostningskontrol:**
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

Denne in-memory tæller er illustrativ, ikke en månedlig udgiftskontrol: den nulstiller ved genstart, deles ikke på tværs af replikaer, og tjekker brug kun efter et kald. En reel grænse kræver holdbar regnskab, samtidighedssikre reservationer før forespørgsler, og en månedlig nulstillingspolitik. Containerhukommelses-målinger skal også tage højde for cgroup-grænser; `psutil.virtual_memory()` er ikke en pålidelig containergrænsemåling, og garbage collection håndhæver ikke en hukommelsesgrænse.

2. **Opsæt omkostningsalarmer:**
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

Deklarer `budgetStartDate` og `budgetEndDate` i din skabelon. Budgetter giver besked; de stopper ikke ressourcer eller pålægger en hård forbrugsgrænse.

3. **Optimer modelvalg:**
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

## Debuggingværktøjer og teknikker

### AZD-debuggingkommandoer

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

### AZD AI-udvidelseskommandoer til diagnostik

Hvis du implementerede agenter ved hjælp af `azd ai agent init`, er disse ekstra værktøjer tilgængelige:

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

> **Tip:** Brug `azd infra generate` til at skrive IaC til disk, så du kan inspicere præcis, hvilke ressourcer der blev oprettet. Dette er uvurderligt ved fejlfinding af ressourcekonfigurationsproblemer. Se [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fulde detaljer.

**GA-workflowdiagnostik (2026-11-09):** Bekræft at `azd version` mindst er version 1.37.0 og inspicer `azd ext list --installed`. Opdater først kerne-CLI med `azd update` eller dens installer, og opdater derefter bundtet med `azd ext upgrade microsoft.foundry`. Ved lokale fejl, tjek nuværende uv, Python 3.13+ for det grundlæggende eksempel, `PYTHONNOUSERSITE: "1"` i dets tjenestekonfiguration, og de Azure-legitimationsoplysninger, som `DefaultAzureCredential` bruger. Hold `azd ai agent run` kørende, mens du kalder `--local` fra et andet terminalvindue i projektmappen.

En succesfuld implementering beviser ikke, at udvikleren har data-plane adgang. Gennemgå RBAC-advarsler og [hosted-agent tilladelsesmatrice](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). En timeout betyder ikke implementeringsfejl: inspicer den forsøgte version og logs før genforsøg. Tidligere agenter beta.23 forbedrede disse advarsler og A2A-output; disse historiske rettelser er beskrevet i [udgivelsesnoterne](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), ikke et krav for installation af den beta.

Hvis `azd ai eval` ikke er tilgængelig, installer `azure.ai.evaluations` separat; GA-bundtet inkluderer det ikke. Hvis en ældre tutorials agent-evalueringskommando kun viser migrationsvejledning, brug den separate `azd ai eval` workflow. Optimeringens `--config` accepterer ikke længere ældre evalueringsfiler. Se [evalueringsmigration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) og [optimeringsmigration](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Applikations-debugging

1. **Struktureret logging:**
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

2. **Helbredstjek-endpoints:**
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

3. **Ydelsesovervågning:**
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

## Almindelige fejlkoder og løsninger

| Fejlkode | Beskrivelse | Løsning |
|------------|-------------|----------|
| 401 | Uautoriseret | Tjek API-nøgler og managed identity-konfiguration |
| 403 | Forbudt | Verificer RBAC-rollefordelinger |
| 429 | Ratebegrænset | Implementer genforsøgslogik med eksponentiel backoff |
| 500 | Intern serverfejl | Tjek modelimplementeringsstatus og logs |
| 503 | Tjeneste utilgængelig | Verificer tjenestens helbred og regional tilgængelighed |

## Næste Skridt

1. **Gennemgå [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** for bedste implementeringspraksis
2. **Fuldfør [Production AI Practices](../chapter-08-production/production-ai-practices.md)** for enterprise-klare løsninger
3. **Deltag i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for fællesskabsstøtte
4. **Indsend problemer** til [AZD GitHub repository](https://github.com/Azure/azure-dev) for AZD-specifikke problemer

## Ressourcer

- [Azure OpenAI kvote og trinvise fejlfinding](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps fejlfinding](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search fejlfinding](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installer Azure fejlfindingsevner i din editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursus Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Næste Kapitel**: [Kapitel 8: Produktion & Enterprise-mønstre](../chapter-08-production/production-ai-practices.md)
- **🤖 Relateret**: [Kapitel 2: AI-Første Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Azure Developer CLI Fejlfinding](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->