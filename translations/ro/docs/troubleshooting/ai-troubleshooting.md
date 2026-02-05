# Ghid de depanare specific AI

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Anterior**: [Ghid de Debugging](debugging.md)
- **➡️ Capitolul următor**: [Capitolul 8: Modele de producție și întreprindere](../microsoft-foundry/production-ai-practices.md)
- **🤖 Conex**: [Capitolul 2: Dezvoltare AI-First](../microsoft-foundry/microsoft-foundry-integration.md)

**Anterior:** [Practici AI de Producție](../microsoft-foundry/production-ai-practices.md) | **Următor:** [Introducere în AZD](../getting-started/README.md)

Acest ghid cuprinzător de depanare abordează problemele comune întâlnite la implementarea soluțiilor AI cu AZD, oferind soluții și tehnici de debugging specifice serviciilor Azure AI.

## Cuprins

- [Probleme cu Serviciul Azure OpenAI](../../../../docs/troubleshooting)
- [Probleme cu Azure AI Search](../../../../docs/troubleshooting)
- [Probleme de implementare a Container Apps](../../../../docs/troubleshooting)
- [Erori de autentificare și permisiuni](../../../../docs/troubleshooting)
- [Eșecuri în implementarea modelelor](../../../../docs/troubleshooting)
- [Probleme de performanță și scalare](../../../../docs/troubleshooting)
- [Gestionarea costurilor și cotelor](../../../../docs/troubleshooting)
- [Instrumente și tehnici de debugging](../../../../docs/troubleshooting)

## Probleme cu Serviciul Azure OpenAI

### Problemă: Serviciul OpenAI nu este disponibil în regiune

**Simptome:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Cauze:**
- Serviciul Azure OpenAI nu este disponibil în regiunea selectată
- Cota epuizată în regiunile preferate
- Constrângeri de capacitate regională

**Soluții:**

1. **Verificați disponibilitatea regiunii:**
```bash
# Listează regiunile disponibile pentru OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Actualizați configurația AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Utilizați regiuni alternative:**
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

### Problemă: Cota de implementare a modelului depășită

**Simptome:**
```
Error: Deployment failed due to insufficient quota
```

**Soluții:**

1. **Verificați cota curentă:**
```bash
# Verifica utilizarea cotei
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Solicitați o creștere a cotei:**
```bash
# Trimite cererea de creștere a cotei
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimizați capacitatea modelului:**
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

### Problemă: Versiune API invalidă

**Simptome:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluții:**

1. **Utilizați o versiune API suportată:**
```python
# Utilizați cea mai recentă versiune acceptată
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verificați compatibilitatea versiunii API:**
```bash
# Listează versiunile API suportate
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Probleme cu Azure AI Search

### Problemă: Nivelul de preț al serviciului de căutare este insuficient

**Simptome:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluții:**

1. **Actualizați nivelul de preț:**
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

2. **Dezactivați căutarea semantică (pentru dezvoltare):**
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
# Obține cheia de administrator pentru serviciul de căutare
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Verificați schema indexului:**
```python
# Validați schema indexului
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

3. **Utilizați identitatea gestionată:**
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

## Probleme de implementare a Container Apps

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Adăugați un Health Check:**
```python
# main.py - Adăugați punctul final de verificare a stării
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

1. **Creșteți timpul de așteptare la pornire:**
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

2. **Optimizați încărcarea modelului:**
```python
# Încărcați modele în mod leneș pentru a reduce timpul de pornire
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
        # Inițializați clientul AI aici
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Pornire
    app.state.model_manager = ModelManager()
    yield
    # Oprire
    pass

app = FastAPI(lifespan=lifespan)
```

## Erori de autentificare și permisiuni

### Problemă: Permisiune refuzată pentru identitatea gestionată

**Simptome:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Soluții:**

1. **Verificați atribuirea rolurilor:**
```bash
# Verificați atribuțiile de rol curente
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
# Testați autentificarea identității gestionate
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

### Problemă: Acces refuzat la Key Vault

**Simptome:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluții:**

1. **Acordați permisiuni pentru Key Vault:**
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

2. **Utilizați RBAC în loc de politici de acces:**
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

### Problemă: Versiunea modelului nu este disponibilă

**Simptome:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluții:**

1. **Verificați modelele disponibile:**
```bash
# Listează modelele disponibile
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Utilizați fallback-uri pentru model:**
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

3. **Validați modelul înainte de implementare:**
```python
# Validarea modelului înainte de implementare
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

## Probleme de performanță și scalare

### Problemă: Răspunsuri cu latență ridicată

**Simptome:**
- Timp de răspuns > 30 secunde
- Erori de timeout
- Experiență slabă pentru utilizator

**Soluții:**

1. **Implementați timeout-uri pentru cereri:**
```python
# Configurați intervale de timp corespunzătoare
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
# Cache Redis pentru răspunsuri
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

3. **Configurați auto-scalarea:**
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

1. **Creșteți alocarea memoriei:**
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
# Gestionarea modelului eficientă din punct de vedere al memoriei
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Verificați utilizarea memoriei înainte de procesare
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forțați colectarea deșeurilor
            
        result = await self._process_ai_request(request)
        
        # Curățați după procesare
        gc.collect()
        return result
```

## Gestionarea costurilor și cotelor

### Problemă: Costuri neașteptat de mari

**Simptome:**
- Factura Azure mai mare decât așteptările
- Utilizarea token-urilor depășește estimările
- Alerte de buget declanșate

**Soluții:**

1. **Implementați controale de cost:**
```python
# Urmărirea utilizării token-urilor
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

2. **Configurați alerte de cost:**
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

3. **Optimizați selecția modelului:**
```python
# Selectarea modelului în funcție de cost
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # pe 1K de tokeni
    'gpt-4': 0.03,          # pe 1K de tokeni
    'gpt-35-turbo': 0.0015  # pe 1K de tokeni
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

## Instrumente și tehnici de debugging

### Comenzi de debugging AZD

```bash
# Activează jurnalizarea detaliată
azd up --debug

# Verifică starea implementării
azd show

# Vizualizează jurnalele implementării
azd logs --follow

# Verifică variabilele de mediu
azd env get-values
```

### Debugging aplicații

1. **Logging structurat:**
```python
import logging
import json

# Configurați jurnalizarea structurată pentru aplicațiile AI
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

2. **Endpoint-uri de Health Check:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Verificați conectivitatea OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Verificați serviciul de căutare
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

## Coduri de eroare comune și soluții

| Cod eroare | Descriere | Soluție |
|------------|-------------|----------|
| 401 | Neautorizat | Verificați cheile API și configurația identității gestionate |
| 403 | Interzis | Verificați atribuirea rolurilor RBAC |
| 429 | Limită de rată | Implementați logica de retry cu backoff exponențial |
| 500 | Eroare internă a serverului | Verificați starea implementării modelului și jurnalele |
| 503 | Serviciu indisponibil | Verificați sănătatea serviciului și disponibilitatea regională |

## Pași următori

1. **Revizuiți [Ghidul de implementare a modelelor AI](ai-model-deployment.md)** pentru cele mai bune practici de implementare
2. **Finalizați [Practici AI de Producție](production-ai-practices.md)** pentru soluții pregătite pentru întreprinderi
3. **Alăturați-vă [Discord-ului Microsoft Foundry](https://aka.ms/foundry/discord)** pentru suport comunitar
4. **Trimiteți probleme** în [repositorul GitHub AZD](https://github.com/Azure/azure-dev) pentru probleme specifice AZD

## Resurse

- [Depanare Serviciu Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Depanare Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Depanare Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navigare capitol:**
- **📚 Acasă Curs**: [AZD pentru Începători](../../README.md)
- **📖 Capitol curent**: Capitolul 7 - Depanare și Debugging
- **⬅️ Anterior**: [Ghid de Debugging](debugging.md)
- **➡️ Capitolul următor**: [Capitolul 8: Modele de producție și întreprindere](../microsoft-foundry/production-ai-practices.md)
- **🤖 Conex**: [Capitolul 2: Dezvoltare AI-First](../microsoft-foundry/microsoft-foundry-integration.md)
- [Depanare Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de oameni. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->