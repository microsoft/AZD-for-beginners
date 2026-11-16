# Ghid de depanare specific AI

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Capitol anterior**: [Ghid de Debugging](debugging.md)
- **➡️ Capitol următor**: [Capitolul 8: Modele de Producție & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Corelat**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Acest ghid complet de depanare abordează problemele comune în implementarea soluțiilor AI cu AZD, oferind soluții și tehnici de debugging specifice serviciilor Azure AI.

> **Domeniu:** Comenzile folosesc nume de resurse exemplu; înlocuiți-le și selectați abonamentul corect. Blocurile Bicep sunt fragmente de integrat într-un șablon existent, nu implementări standalone. Fragmentele Python necesită SDK-urile specificate și configurarea aplicației. Nu s-a executat nicio implementare live pe Azure pentru această revizuire.

## Cuprins

- [Probleme serviciu modele Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [Probleme Azure AI Search](#azure-ai-search-problems)
- [Probleme implementare Container Apps](#container-apps-deployment-issues)
- [Erori de autentificare și permisiune](#authentication-and-permission-errors)
- [Eșecuri în implementarea modelelor](#model-deployment-failures)
- [Probleme de performanță și scalare](#performance-and-scaling-issues)
- [Gestionarea costurilor și cotelor](#cost-and-quota-management)
- [Instrumente și tehnici de debugging](#debugging-tools-and-techniques)

## Probleme serviciu modele Microsoft Foundry

### Problemă: Serviciul OpenAI indisponibil în regiune

**Simptome:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Cauze:**
- Modelele Microsoft Foundry nu sunt disponibile în regiunea selectată
- Chota epuizată în regiunile preferate
- Constrângeri de capacitate regională

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

### Problemă: Cota de implementare a modelului depășită

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
Folosiți fluxul de lucru pentru gestionarea cotelor din portalul Foundry pentru abonamentul, regiunea, modelul și tipul de implementare afectate. Consultați [ghidul oficial despre cote](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Solicitarea cotei pentru VM nu mărește cota de model.

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

1. **Utilizați versiunea API suportată:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Verificați compatibilitatea versiunii API:**
Consultați [referința ciclului de viață al API-ului Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Versiunile API ale furnizorului de resurse ARM **nu** listează versiunile API pentru planul de inferență/date. Clienții noi v1 utilizează `/openai/v1/` fără un `api-version` datat; nu combinați cele două configurații de client.

## Probleme Azure AI Search

### Problemă: Nivelul tarifar al serviciului de căutare insuficient

**Simptome:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluții:**

1. **Folosiți un nivel tarifar suportat:**

Clasatorul semantic necesită Basic sau mai sus. Trecerea de la Free/Basic la un nivel diferit poate necesita crearea unui serviciu de căutare nou și reconstruirea indexurilor; modificarea unui SKU nu garantează o actualizare pe loc.
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

2. **Dezactivați căutarea semantică (dezvoltare):**
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

3. **Folosiți identitate administrată:**
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

## Probleme de implementare Container Apps

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

1. **Măriți timpul de pornire:**
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

2. **Optimizați încărcarea modelului:**
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

## Erori de autentificare și permisiune

### Problemă: Permisiune refuzată pentru identitatea administrată

**Simptome:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluții:**

1. **Verificați atribuirea rolurilor:**
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

Obținerea tokenului dovedește autentificarea, nu și permisiunea de a invoca un model. Testați operațiunea dorită separat. Local, `DefaultAzureCredential` poate folosi credențiale de dezvoltator; pe Azure, verificați că identitatea administrată dorită este selectată.

### Problemă: Acces la Key Vault refuzat

**Simptome:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluții:**

1. **Acordați permisiuni pentru Key Vault:**

Folosiți fragmentul de politică de acces de mai jos doar pentru un vault cu `enableRbacAuthorization: false`. Pentru un vault activat RBAC, folosiți opțiunea 2; adăugarea unei politici de acces nu acordă acces la nivel de date în modul RBAC.
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

2. **Folosiți RBAC în loc de politici de acces:**

Vault-ul trebuie să aibă `enableRbacAuthorization: true`; schimbarea modelului de permisiuni necesită o migrare planificată a accesului existent.
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

## Eșecuri în implementarea modelelor

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

3. **Validarea modelului înainte de implementare:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Probleme de performanță și scalare

### Problemă: Răspunsuri cu latență mare

**Simptome:**
- Timp de răspuns > 30 secunde
- Erori de timeout
- Experiență slabă pentru utilizator

**Soluții:**

1. **Implementați timeout-uri pentru solicitări:**
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

2. **Adăugați cache pentru răspunsuri:**
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

3. **Configurați autoscalare:**
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

### Problemă: Erori din cauza lipsei de memorie

**Simptome:**
```
Error: Container killed due to memory limit exceeded
```

**Soluții:**

1. **Creșteți alocarea de memorie:**
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

## Gestionarea costurilor și cotelor

### Problemă: Costuri neașteptat de mari

**Simptome:**
- Factură Azure mai mare decât se estima
- Utilizarea tokenilor depășind estimările
- Alarme buget declanșate

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

Acest contor în memorie este ilustrativ, nu un control de cheltuieli lunar: se resetează la repornire, nu este partajat între replici și verifică utilizarea doar după un apel. O limită reală necesită contabilitate durabilă, rezervări sigure la concurență înaintea cererilor și o politică de resetare lunară. Metricile de memorie container trebuie să țină cont și de limitele cgroup; `psutil.virtual_memory()` nu este o măsurare fiabilă a limitei containerului, iar colectarea gunoiului nu impune o limită de memorie.

2. **Configurați alerte de cost:**
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

Declarați `budgetStartDate` și `budgetEndDate` în șablonul dvs. Bugetele notifică; nu opresc resursele sau impun o limită dură de cheltuială.

3. **Optimizați selecția modelelor:**
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

## Instrumente și tehnici de debugging

### Comenzi AZD pentru debugging

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

### Comenzi extensie AZD AI pentru diagnosticare

Dacă ați implementat agenți folosind `azd ai agent init`, aceste unelte suplimentare sunt disponibile:

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

> **Sfat:** Folosiți `azd infra generate` pentru a scrie IaC pe disc astfel încât să puteți inspecta exact ce resurse au fost provisionate. Acest lucru este neprețuit pentru depanarea problemelor de configurare a resurselor. Consultați [referința CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) pentru detalii complete.

**Diagnosticare conștientă de versiune (2026-11-04):** Agenții `1.0.0-beta.23` necesită `azd >= 1.37.0`; actualizați CLI core înaintea extensiilor incompatibile. Această versiune a agentului păstrează avertismentele RBAC pentru dezvoltatori în ieșirea finală a implementării și identifică versiunea implicată în eșecurile/de adăugările de timeout. Un timeout nu stabilește că implementarea a eșuat: inspectați versiunea încercată înainte de a repeta. Fixează și afișarea mesajelor de ciclu de viață în locul răspunsurilor finalizate la apelurile A2A 0.3. Core-ul `azd 1.37.1` repară propagarea anulării între extensii; `1.37.2` îmbunătățește confirmările critice privind provisioning-ul și tratarea anulării.

Dacă comanda de evaluare dintr-un tutorial mai vechi afișează doar ghid pentru migrare, instalați `azure.ai.evaluations` (`1.0.0-beta.2` necesită `azd >= 1.33.0`) și folosiți `azd ai eval init`, `generate`, și `run start`. Optimizarea `--config` nu mai acceptă fișiere de evaluare vechi. Consultați [migrarea evaluării](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) și [migrarea optimizării](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Debugging aplicație

1. **Logare structurată:**
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

2. **Endpoint-uri de verificare a stării de sănătate:**
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

3. **Monitorizare performanță:**
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
| 401 | Neautorizat | Verificați cheile API și configurația identității administrate |
| 403 | Interzis | Verificați atribuirea rolurilor RBAC |
| 429 | Limită Rate | Implementați logică de retry cu backoff exponențial |
| 500 | Eroare internă server | Verificați statusul implementării modelului și jurnalele |
| 503 | Serviciu indisponibil | Verificați starea serviciului și disponibilitatea regională |

## Pașii următori

1. **Consultați [Ghidul de implementare AI Model](../chapter-02-ai-development/ai-model-deployment.md)** pentru bune practici de implementare
2. **Finalizați [Practici AI de producție](../chapter-08-production/production-ai-practices.md)** pentru soluții pregătite pentru enterprise
3. **Alăturați-vă [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** pentru suport comunitar
4. **Trimiteți probleme** în [repository-ul AZD GitHub](https://github.com/Azure/azure-dev) pentru probleme specifice AZD

## Resurse

- [Depanare cotă și throttling Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Depanare Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Depanare Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Skill Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Instalați skill-uri de depanare Azure în editorul dvs.: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigare capitole:**
- **📚 Acasă curs**: [AZD Pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Capitol anterior**: [Ghid de Debugging](debugging.md)
- **➡️ Capitol următor**: [Capitolul 8: Modele de Producție & Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Corelat**: [Capitolul 2: Dezvoltare AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referință**: [Depanare Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->