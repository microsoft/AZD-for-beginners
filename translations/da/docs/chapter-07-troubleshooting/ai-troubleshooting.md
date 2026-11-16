# Fejlfinding Guide Specifik for AI

**Kapitel Navigation:**
- **📚 Kursus Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Næste Kapitel**: [Kapitel 8: Produktion & Enterprise Mønstre](../chapter-08-production/production-ai-practices.md)
- **🤖 Relateret**: [Kapitel 2: AI-First Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

Denne omfattende fejlfinding guide adresserer almindelige problemer ved implementering af AI-løsninger med AZD, og giver løsninger og debugging teknikker specifikt til Azure AI-tjenester.

> **Omfang:** Kommandoer bruger eksempler på ressourcenavne; udskift dem og vælg den korrekte abonnement. Bicep blokke er fragmenter til sammenfletning i en eksisterende skabelon, ikke selvstændige implementeringer. Python-snit kræver de angivne SDK'er og applikationskonfiguration. Der blev ikke udført en live Azure-implementering for denne gennemgang.

## Indholdsfortegnelse

- [Microsoft Foundry Models Service Problemer](#microsoft-foundry-models-service-issues)
- [Azure AI Search Problemer](#azure-ai-search-problems)
- [Container Apps Implementeringsproblemer](#container-apps-deployment-issues)
- [Autentificering og Tilladelsesfejl](#authentication-and-permission-errors)
- [Model Implementeringsfejl](#model-deployment-failures)
- [Ydeevne og Skalering Problemer](#performance-and-scaling-issues)
- [Omkostninger og Kvotestyring](#cost-and-quota-management)
- [Debugging Værktøjer og Teknikker](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Problemer

### Problem: OpenAI Service Utilgængelig i Region

**Symptomer:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Årsager:**
- Microsoft Foundry Models ikke tilgængelig i valgt region
- Kvota opbrugt i foretrukne regioner
- Regionale kapacitetsbegrænsninger

**Løsninger:**

1. **Kontroller Regions Tilgængelighed:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Opdater AZD Konfiguration:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Brug Alternative Regioner:**
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

### Problem: Kvote for Model Implementering Overskredet

**Symptomer:**
```
Error: Deployment failed due to insufficient quota
```

**Løsninger:**

1. **Kontroller Nuværende Kvote:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Anmod om Kvoteforhøjelse:**
Brug Foundry portalens kvotestyringsworkflow for det pågældende abonnement, region, model og implementeringstype. Se den [officielle kvoteretningslinje](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). En VM kvoteanmodning øger ikke modelkvoten.

3. **Optimer Modelkapacitet:**
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

1. **Brug Understøttet API-version:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Kontroller API Versionskompatibilitet:**
Tjek [Azure OpenAI API lifecycle reference](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM ressourceudbyder API-versioner viser **ikke** inferens/data-plane API-versioner. Nye v1 klienter bruger `/openai/v1/` uden en dateret `api-version`; bland ikke de to klientkonfigurationer.

## Azure AI Search Problemer

### Problem: Søgningstjenestens Prisniveau Utilstrækkeligt

**Symptomer:**
```
Error: Semantic search requires Basic tier or higher
```

**Løsninger:**

1. **Brug et Understøttet Prisniveau:**

Semantisk ranker kræver Basic eller højere. Overgang fra Free/Basic til et andet niveau kan kræve oprettelse af en ny søgningstjeneste og genopbygning af indeks; redigering af en SKU garanterer ikke en opgradering på stedet.
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

2. **Deaktiver Semantisk Søgning (Udvikling):**
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

### Problem: Indeks Oprettelsesfejl

**Symptomer:**
```
Error: Cannot create index, insufficient permissions
```

**Løsninger:**

1. **Bekræft Søgetjenestens Nøgler:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kontroller Indeks Skema:**
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

## Container Apps Implementeringsproblemer

### Problem: Container Build Fejl

**Symptomer:**
```
Error: Failed to build container image
```

**Løsninger:**

1. **Kontroller Dockerfile Syntax:**
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

2. **Validér Afhængigheder:**
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

3. **Tilføj Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Container App Opstartsfejl

**Symptomer:**
```
Error: Container failed to start within timeout period
```

**Løsninger:**

1. **Forøg Opstart Timeout:**
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

2. **Optimer Modellastning:**
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

## Autentificering og Tilladelsesfejl

### Problem: Managed Identity Tilladelse Afvist

**Symptomer:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Løsninger:**

1. **Kontroller Rolle Tildelinger:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tildel Nødvendige Roller:**
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

3. **Test Autentificering:**
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

Token erhvervelse beviser autentificering, ikke tilladelse til at påkalde en model. Test den tiltænkte handling separat. Lokalt kan `DefaultAzureCredential` bruge udvikler-legitimationsdata; i Azure, bekræft at den tiltænkte managed identity er valgt.

### Problem: Key Vault Adgang Afvist

**Symptomer:**
```
Error: The user, group or application does not have secrets get permission
```

**Løsninger:**

1. **Giv Key Vault Tilladelser:**

Brug følgende adgangspolitik-fragment kun for en vault med `enableRbacAuthorization: false`. For en RBAC-aktiveret vault, brug mulighed 2; tilføjelse af en adgangspolitik giver ikke datapladsadgang i RBAC-tilstand.
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

2. **Brug RBAC I Stedet for Adgangspolitikker:**

Vaulten skal have `enableRbacAuthorization: true`; ændring af tilladelsesmodeller kræver en planlagt migration af eksisterende adgang.
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

## Model Implementeringsfejl

### Problem: Modelversion Ikke Tilgængelig

**Symptomer:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Løsninger:**

1. **Kontrollér Tilgængelige Modeller:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Vælg En Tilgængelig Model Eksplicit:**
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

3. **Validér Model Før Implementering:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Ydeevne og Skalering Problemer

### Problem: Høj Forsinkelse i Svar

**Symptomer:**
- svartider > 30 sekunder
- timeout fejl
- Dårlig brugeroplevelse

**Løsninger:**

1. **Implementer Anmodnings-Timeouts:**
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

2. **Tilføj Respons Caching:**
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

3. **Konfigurér Auto-skalering:**
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

### Problem: Hukommelsesfejl – Out of Memory

**Symptomer:**
```
Error: Container killed due to memory limit exceeded
```

**Løsninger:**

1. **Forøg Hukommelsestildeling:**
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

2. **Optimer Hukommelsesforbrug:**
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

## Omkostninger og Kvotestyring

### Problem: Uventet Høje Omkostninger

**Symptomer:**
- Azure regning højere end forventet
- Tokenforbrug overstiger estimater
- Budgetadvarsler udløst

**Løsninger:**

1. **Implementér Omkostningskontrol:**
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

Denne hukommelsesladede tæller er illustrativ, ikke en månedlig udgiftskontrol: den nulstilles ved genstart, deles ikke på tværs af replikaer og kontrollerer kun forbrug efter et kald. En reel grænse kræver holdbar regnskabsføring, samtidighedssikre reservationer før forespørgsler, og en månedlig nulstillingspolitik. Container hukommelsesmetrikker skal også tage højde for cgroup begrænsninger; `psutil.virtual_memory()` er ikke et pålideligt container-grænsemål, og garbage collection håndhæver ikke en hukommelsesgrænse.

2. **Opsæt Omkostningsalarmer:**
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

Deklarér `budgetStartDate` og `budgetEndDate` i din skabelon. Budgetter giver notifikationer; de stopper ikke ressourcer eller pålægger en hård udgiftsgrænse.

3. **Optimer Modelvalg:**
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

## Debugging Værktøjer og Teknikker

### AZD Debugging Kommandoer

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

### AZD AI Extension Kommandoer til Diagnostik

Hvis du implementerede agenter ved hjælp af `azd ai agent init`, er disse ekstra værktøjer tilgængelige:

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

> **Tip:** Brug `azd infra generate` til at skrive IaC til disk, så du kan inspicere præcist hvilke ressourcer der blev udrullet. Dette er uvurderligt, når du fejlfinder ressourcer konfigurationsproblemer. Se [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fulde detaljer.

**Versionsbevidst diagnostik (2026-11-04):** Agenter `1.0.0-beta.23` kræver `azd >= 1.37.0`; opgradér core CLI før inkompatible udvidelser. Denne agentudgivelse bevarer udvikler RBAC advarsler i endelig implementeringsoutput og identificerer den version, der var involveret i aktiveringsfejl/timeout. En timeout beviser ikke at implementering fejlede: inspicér den forsøgte version før genprøvning. Den retter også A2A 0.3 kald, der viste livscyklusbeskeder i stedet for færdige svar. Core `azd 1.37.1` retter annulleringspropagering på tværs af udvidelser; `1.37.2` forbedrer kritiske provisioningbekræftelser og annulleringshåndtering.

Hvis en ældre tutorials evalueringskommando kun printer migrationsvejledning, installer `azure.ai.evaluations` (`1.0.0-beta.2` kræver `azd >= 1.33.0`) og brug `azd ai eval init`, `generate`, og `run start`. Optimerings `--config` accepterer ikke længere ældre evalueringsfiler. Se [evalueringsmigration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) og [optimeringsmigration](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Applikations Debugging

1. **Struktureret Logging:**
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

2. **Health Check Endepunkter:**
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

## Almindelige Fejlkoder og Løsninger

| Fejlkode | Beskrivelse | Løsning |
|------------|-------------|----------|
| 401 | Uautoriseret | Kontroller API-nøgler og managed identity konfiguration |
| 403 | Forbudt | Bekræft RBAC rolle tildelinger |
| 429 | Begrænset Rate | Implementér genforsøgslogik med eksponentiel backoff |
| 500 | Intern Serverfejl | Kontroller modelimplementeringsstatus og logfiler |
| 503 | Tjeneste Utilgængelig | Bekræft tjenestesundhed og regional tilgængelighed |

## Næste Skridt

1. **Gennemgå [AI Model Implementeringsguide](../chapter-02-ai-development/ai-model-deployment.md)** for bedste praksis ved implementering
2. **Færdiggør [Produktions AI Praksisser](../chapter-08-production/production-ai-practices.md)** for enterprise-klar løsninger
3. **Deltag i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for fællesskabsstøtte
4. **Indsend problemer** til [AZD GitHub repository](https://github.com/Azure/azure-dev) for AZD-specifikke problemer

## Ressourcer

- [Azure OpenAI kvote og throttling fejlfinding](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps Fejlfinding](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Fejlfinding](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installer Azure fejlfinding færdigheder i din editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitel Navigation:**
- **📚 Kursus Hjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Næste Kapitel**: [Kapitel 8: Produktion & Enterprise Mønstre](../chapter-08-production/production-ai-practices.md)
- **🤖 Relateret**: [Kapitel 2: AI-First Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Azure Developer CLI Fejlfinding](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->