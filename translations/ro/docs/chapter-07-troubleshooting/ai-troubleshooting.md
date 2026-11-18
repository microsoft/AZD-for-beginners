# Ghid de depanare specific AI

**Navigarea capitolului:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Anterior**: [Ghid de debugging](debugging.md)
- **➡️ Capitol următor**: [Capitolul 8: Modele de producție & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Relaționat**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Acest ghid cuprinzător de depanare abordează probleme comune la implementarea soluțiilor AI cu AZD, oferind soluții și tehnici de debugging specifice serviciilor Azure AI.

> **Domeniu de aplicare:** Comenzile folosesc exemple de nume de resurse; înlocuiți-le și selectați abonamentul corect. Blocurile Bicep sunt fragmente pentru a fi integrate într-un șablon existent, nu implementări standalone. Fragmentele Python necesită SDK-urile și configurația aplicației menționate. Nicio implementare Azure live nu a fost executată pentru această revizuire.

## Cuprins

- [Probleme cu serviciul Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Probleme Azure AI Search](#azure-ai-search-problems)
- [Probleme implementare Container Apps](#container-apps-deployment-issues)
- [Erori de autentificare și permisiuni](#authentication-and-permission-errors)
- [Eșecuri la implementarea modelului](#model-deployment-failures)
- [Probleme de performanță și scalare](#performance-and-scaling-issues)
- [Gestionarea costurilor și cotelor](#cost-and-quota-management)
- [Instrumente și tehnici de depanare](#debugging-tools-and-techniques)

## Probleme cu serviciul Microsoft Foundry Models

### Problemă: Serviciul OpenAI indisponibil în regiune

**Simptome:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Cauze:**
- Microsoft Foundry Models nu este disponibil în regiunea selectată
- Cota epuizată în regiunile preferate
- Constrângeri de capacitate regionale

**Soluții:**

1. **Verificați disponibilitatea regiunii:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Actualizați configurația AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Folosiți regiuni alternative:**
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

### Problemă: Cota de implementare model depășită

**Simptome:**
```
Error: Deployment failed due to insufficient quota
```

**Soluții:**

1. **Verificați cota curentă:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Solicitați creșterea cotei:**
Folosiți fluxul de gestionare a cotelor din portalul Foundry pentru abonamentul, regiunea, modelul și tipul de implementare afectate. Consultați [ghidul oficial al cotelor](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). O solicitare de cotă VM nu crește cota pentru modele.

3. **Optimizați capacitatea modelului:**
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

### Problemă: Versiune API invalidă

**Simptome:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluții:**

1. **Folosiți versiunea API suportată:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Verificați compatibilitatea versiunii API:**
Consultați [referința ciclului de viață API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Versiunile API ale furnizorului de resurse ARM **nu** listează versiunile API pentru planul de inferență/date. Noii clienți v1 folosesc `/openai/v1/` fără un `api-version` datat; nu combinați cele două configurații de client.

## Probleme Azure AI Search

### Problemă: Nivel de preț insuficient pentru serviciul de căutare

**Simptome:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluții:**

1. **Folosiți un nivel de preț acceptat:**

Rankerul semantic necesită Basic sau mai sus. Trecerea de la Free/Basic la un alt nivel poate necesita crearea unui nou serviciu de căutare și reconstruirea indexurilor; editarea unui SKU nu este o actualizare garantată în loc.
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

2. **Dezactivați Căutarea Semantică (dezvoltare):**
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

### Problemă: Eșecuri la crearea indexului

**Simptome:**
```
Error: Cannot create index, insufficient permissions
```

**Soluții:**

1. **Verificați cheile serviciului de căutare:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Verificați schema indexului:**
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

3. **Folosiți identitatea gestionată:**
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

## Probleme la implementarea Container Apps

### Problemă: Eșecuri la construirea containerului

**Simptome:**
```
Error: Failed to build container image
```

**Soluții:**

1. **Verificați sintaxa Dockerfile:**
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

2. **Validați dependențele:**
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

3. **Adăugați verificarea stării de sănătate:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problemă: Eșecuri la pornirea aplicației container

**Simptome:**
```
Error: Container failed to start within timeout period
```

**Soluții:**

1. **Măriți timpul de așteptare la pornire:**
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

2. **Optimizarea încărcării modelului:**
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

## Erori de autentificare și permisiuni

### Problemă: Permisiune refuzată pentru identitate gestionată

**Simptome:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluții:**

1. **Verificați asignările rolurilor:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Atribuiți rolurile necesare:**
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

3. **Testați autentificarea:**
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

Obținerea tokenului dovedește autentificarea, nu permisiunea de a invoca un model. Testați operațiunea intenționată separat. Local, `DefaultAzureCredential` poate folosi acreditările dezvoltatorului; în Azure, verificați că identitatea gestionată selectată este cea intenționată.

### Problemă: Acces refuzat Key Vault

**Simptome:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluții:**

1. **Acordați permisiuni pentru Key Vault:**

Folosiți fragmentul politicii de acces următor doar pentru un vault cu `enableRbacAuthorization: false`. Pentru un vault activat RBAC, folosiți opțiunea a 2-a; adăugarea unei politici de acces nu acordă acces la planul de date în modul RBAC.
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

2. **Folosiți RBAC în loc de politicile de acces:**

Vault-ul trebuie să aibă `enableRbacAuthorization: true`; schimbarea modelelor de permisiuni necesită o migrare planificată a accesului existent.
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

## Eșecuri la implementarea modelului

### Problemă: Versiunea modelului indisponibilă

**Simptome:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluții:**

1. **Verificați modelele disponibile:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Selectați explicit un model disponibil:**
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

3. **Validați modelul înainte de implementare:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Probleme de performanță și scalare

### Problemă: Răspunsuri cu latență mare

**Simptome:**
- Timpuri de răspuns > 30 secunde
- Erori de timeout
- Experiență slabă pentru utilizator

**Soluții:**

1. **Implementați timeouts pentru cereri:**
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

2. **Adăugați caching pentru răspunsuri:**
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

3. **Configurați scalarea automată:**
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

### Problemă: Erori de memorie insuficientă

**Simptome:**
```
Error: Container killed due to memory limit exceeded
```

**Soluții:**

1. **Măriți alocarea memoriei:**
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

2. **Optimizați utilizarea memoriei:**
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

## Gestionarea costurilor și a cotelor

### Problemă: Costuri neașteptat de mari

**Simptome:**
- Factură Azure mai mare decât se aștepta
- Utilizare a tokenurilor ce depășește estimările
- Alerte de buget declanșate

**Soluții:**

1. **Implementați controale de cost:**
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

Acest contor în memorie este ilustrativ, nu un control lunar al cheltuielilor: se resetează la repornire, nu este împărtășit între replici și verifică utilizarea doar după un apel. O limită reală necesită contabilizare durabilă, rezervări sigure pentru concurență înainte de cereri și o politică lunară de resetare. Metodele de măsurare a memoriei containerului trebuie să țină cont de limitele cgroup; `psutil.virtual_memory()` nu este o măsurare fiabilă a limitei containerului, iar colectarea gunoiului nu impune o plafonare a memoriei.

2. **Setați alerte de cost:**
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

Declarați `budgetStartDate` și `budgetEndDate` în șablonul dvs. Bugetele notifică; nu opresc resursele sau impun un plafon de cheltuieli strict.

3. **Optimizați selecția modelului:**
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

## Instrumente și tehnici de depanare

### Comenzi AZD pentru depanare

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

### Comenzi AZD AI Extension pentru diagnosticare

Dacă ați implementat agenți folosind `azd ai agent init`, aceste instrumente suplimentare sunt disponibile:

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

> **Sfat:** Folosiți `azd infra generate` pentru a scrie IaC pe disc astfel încât să puteți inspecta exact ce resurse au fost provisionate. Aceasta este de neprețuit atunci când depanați probleme de configurare a resurselor. Consultați [referința AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru detalii complete.

**Diagnosticare flux GA (2026-11-09):** Verificați că `azd version` este cel puțin 1.37.0 și inspectați `azd ext list --installed`. Actualizați mai întâi CLI-ul de bază cu `azd update` sau instalatorul său, apoi actualizați pachetul cu `azd ext upgrade microsoft.foundry`. Pentru eșecuri locale, verificați versiunea curentă uv, Python 3.13+ pentru exemplul de bază, `PYTHONNOUSERSITE: "1"` în configurația serviciului său și acreditările Azure folosite de `DefaultAzureCredential`. Țineți `azd ai agent run` rulând în timp ce invocați `--local` dintr-un al doilea terminal în directorul proiectului.

Succesul la provisionare nu dovedește că dezvoltatorul are acces la planul de date. Revizuiți avertismentele RBAC și [matricea permisiunilor agenților găzduiți](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Un timeout nu stabilește un eșec de implementare: inspectați versiunea încercată și jurnalele înainte de a încerca din nou. Agenții anteriori beta.23 au îmbunătățit aceste avertismente și ieșirea A2A; acele remedieri istorice sunt descrise în [notițele de lansare](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), nu sunt o cerință pentru a instala acel beta.

Dacă `azd ai eval` nu este disponibil, instalați `azure.ai.evaluations` separat; pachetul GA nu îl include. Dacă comanda agent-evaluation dintr-un tutorial mai vechi doar afișează ghid de migrare, folosiți fluxul separat `azd ai eval`. `--config` pentru optimizare nu mai acceptă fișiere vechi de evaluare. Consultați [migrarea evaluării](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) și [migrarea optimizării](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Depanarea aplicației

1. **Jurnalizare structurată:**
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

2. **Puncte finale pentru verificarea stării de sănătate:**
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

3. **Monitorizarea performanței:**
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

## Coduri comune de eroare și soluții

| Cod Eroare | Descriere | Soluție |
|------------|-------------|----------|
| 401 | Neautorizat | Verificați cheile API și configurația identității gestionate |
| 403 | Interzis | Verificați asignările rolurilor RBAC |
| 429 | Limitare de rată | Implementați logica de retry cu backoff exponențial |
| 500 | Eroare internă a serverului | Verificați starea implementării modelului și jurnalele |
| 503 | Serviciu Indisponibil | Verificați sănătatea serviciului și disponibilitatea regională |

## Pașii următori

1. **Revizuiți [Ghidul de implementare AI Model](../chapter-02-ai-development/ai-model-deployment.md)** pentru cele mai bune practici de implementare
2. **Finalizați [Practici AI de producție](../chapter-08-production/production-ai-practices.md)** pentru soluții pregătite pentru întreprinderi
3. **Alăturați-vă [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pentru suport comunitar
4. **Trimiteți probleme** către [repository-ul GitHub AZD](https://github.com/Azure/azure-dev) pentru probleme specifice AZD

## Resurse

- [Depanarea cotelor și limitărilor Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Depanarea Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Depanarea Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Agent de diagnostic Azure Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instalați abilitățile de depanare Azure în editorul dvs.: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigarea capitolului:**
- **📚 Pagina principală a cursului**: [AZD Pentru începători](../../README.md)
- **📖 Capitolul curent**: Capitolul 7 - Depanare și Diagnosticare
- **⬅️ Capitol anterior**: [Ghid de depanare](debugging.md)
- **➡️ Capitol următor**: [Capitolul 8: Modele de producție și întreprindere](../chapter-08-production/production-ai-practices.md)
- **🤖 Relatate**: [Capitolul 2: Dezvoltare AI-Primară](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referință**: [Depanarea Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->