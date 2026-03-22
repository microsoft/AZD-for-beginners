# AI-spetsiifiline veaotsingu juhend

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Veaotsing ja silumine
- **⬅️ Eelmine**: [Silumise juhend](debugging.md)
- **➡️ Järgmine peatükk**: [Peatükk 8: Tootmise ja ettevõtluse mustrid](../chapter-08-production/production-ai-practices.md)
- **🤖 Seotud**: [Peatükk 2: AI-esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

See põhjalik veaotsingu juhend käsitleb levinumaid probleeme AI-lahenduste juurutamisel AZD-ga, pakkudes lahendusi ja silumistehnikaid, mis on spetsiifilised Azure AI teenustele.

## Sisukord

- [Microsoft Foundry mudelite teenuse probleemid](../../../../docs/chapter-07-troubleshooting)
- [Azure AI otsingu probleemid](../../../../docs/chapter-07-troubleshooting)
- [Container Apps juurutamisprobleemid](../../../../docs/chapter-07-troubleshooting)
- [Autentimis- ja juurdepääsuloadega seotud vead](../../../../docs/chapter-07-troubleshooting)
- [Mudeli juurutamise vead](../../../../docs/chapter-07-troubleshooting)
- [Jõudluse ja skaleerimise probleemid](../../../../docs/chapter-07-troubleshooting)
- [Kulu ja kvota haldamine](../../../../docs/chapter-07-troubleshooting)
- [Silumise tööriistad ja tehnikad](../../../../docs/chapter-07-troubleshooting)

## Microsoft Foundry mudelite teenuse probleemid

### Probleem: OpenAI teenus pole regioonis saadaval

**Sümptomid:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Põhjused:**
- Microsoft Foundry mudelid pole valitud regioonis saadaval
- Kvota on eelistatud regioonides ammendunud
- Regionaalsed võimsusepiirangud

**Lahendused:**

1. **Kontrolli regiooni saadavust:**
```bash
# Loetle OpenAI saadaolevad regioonid
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Uuenda AZD konfiguratsiooni:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Kasuta alternatiivseid regioone:**
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

### Probleem: Mudeli juurutamise kvota ületatud

**Sümptomid:**
```
Error: Deployment failed due to insufficient quota
```

**Lahendused:**

1. **Kontrolli praegust kvotat:**
```bash
# Kontrolli kvota kasutust
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Taotle kvota suurendamist:**
```bash
# Esita taotlus kvoodi suurendamiseks
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimeeri mudeli mahtu:**
```bicep
// Reduce initial capacity
resource deployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 1  // Start with minimal capacity
  }
}
```

### Probleem: Kehtetu API versioon

**Sümptomid:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Lahendused:**

1. **Kasuta toetatud API versiooni:**
```python
# Kasuta uusimat toetatud versiooni
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Kontrolli API versiooni ühilduvust:**
```bash
# Loendi toetatud API versioonid
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI otsingu probleemid

### Probleem: Otsinguteenuse hinnaklass ei ole piisav

**Sümptomid:**
```
Error: Semantic search requires Basic tier or higher
```

**Lahendused:**

1. **Uuenda hinnaklassi:**
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

2. **Keela semantiline otsing (arenduses):**
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

### Probleem: Indeksi loomise ebaõnnestumine

**Sümptomid:**
```
Error: Cannot create index, insufficient permissions
```

**Lahendused:**

1. **Kontrolli otsinguteenuse võtmeid:**
```bash
# Hangi otsinguteenuse administraatori võti
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kontrolli indeksi skeemi:**
```python
# Kontrolli indeksi skeemi
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

3. **Kasuta hallatavat identiteeti:**
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

## Container Apps juurutamisprobleemid

### Probleem: Konteineri ehitamise ebaõnnestumine

**Sümptomid:**
```
Error: Failed to build container image
```

**Lahendused:**

1. **Kontrolli Dockerfile süntaksit:**
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

2. **Kontrolli sõltuvusi:**
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

3. **Lisa tervisekontroll:**
```python
# main.py - Lisa tervisekontrolli lõpp-punkt
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Probleem: Container App käivitamise ebaõnnestumine

**Sümptomid:**
```
Error: Container failed to start within timeout period
```

**Lahendused:**

1. **Suurenda käivitusaega:**
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

2. **Optimeeri mudeli laadimist:**
```python
# Mudelite laisk laadimine käivitamisaja lühendamiseks
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
        # Algata siin tehisintellekti klient
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Käivitamine
    app.state.model_manager = ModelManager()
    yield
    # Sulgemine
    pass

app = FastAPI(lifespan=lifespan)
```

## Autentimis- ja juurdepääsuloadega seotud vead

### Probleem: Hallatava identiteedi juurdepääs keelatud

**Sümptomid:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Lahendused:**

1. **Kontrolli rolli määranguid:**
```bash
# Kontrolli praeguseid rollide määramisi
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Määra vajalikud rollid:**
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

3. **Testi autentimist:**
```python
# Testi hallatud identiteedi autentimist
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

### Probleem: Key Vaulti juurdepääs keelatud

**Sümptomid:**
```
Error: The user, group or application does not have secrets get permission
```

**Lahendused:**

1. **Anna Key Vaulti õigused:**
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

2. **Kasuta RBAC-i juurdepääsupoliitikate asemel:**
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

## Mudeli juurutamise vead

### Probleem: Mudeli versioon pole saadaval

**Sümptomid:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lahendused:**

1. **Kontrolli saadaolevaid mudeleid:**
```bash
# Loetle saadaolevad mudelid
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Kasuta mudeli tagasilanget:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
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

3. **Kontrolli mudelit enne juurutamist:**
```python
# Mudeli valideerimine enne juurutamist
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

## Jõudluse ja skaleerimise probleemid

### Probleem: Kõrge latentsus vastustes

**Sümptomid:**
- Vastuseajad > 30 sekundit
- Ajakulu vead
- Kehv kasutajakogemus

**Lahendused:**

1. **Rakenda päringute ajapiirangud:**
```python
# Seadistage õiged ajalõppud
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

2. **Lisa vastuse vahemälu:**
```python
# Redis vahemälu vastuste jaoks
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

3. **Konfigureeri automaatne skaleerimine:**
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

### Probleem: Mälu lõppemise vead

**Sümptomid:**
```
Error: Container killed due to memory limit exceeded
```

**Lahendused:**

1. **Suurenda mälu eraldust:**
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

2. **Optimeeri mälu kasutust:**
```python
# Mälu säästlik mudeli käsitlemine
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Kontrolli mälu kasutust enne töötlemist
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Sundkäivita prügikogu
            
        result = await self._process_ai_request(request)
        
        # Puhasta pärast töötlemist
        gc.collect()
        return result
```

## Kulu ja kvota haldamine

### Probleem: Ootamatult kõrged kulud

**Sümptomid:**
- Azure arve on oodatust kõrgem
- Tokeni kasutus ületab prognoose
- Eelarve hoiatused aktiveerunud

**Lahendused:**

1. **Rakenda kulude kontrolli:**
```python
# Märgise kasutamise jälgimine
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

2. **Sea üles kulude hoiatused:**
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

3. **Optimeeri mudeli valikut:**
```python
# Kulu-teadlik mudeli valik
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # iga 1K tokeni kohta
    'gpt-4.1': 0.03,          # iga 1K tokeni kohta
    'gpt-35-turbo': 0.0015  # iga 1K tokeni kohta
}

def select_model_by_cost(complexity: str, budget_remaining: float) -> str:
    """Select model based on complexity and budget."""
    if complexity == 'simple' or budget_remaining < 10:
        return 'gpt-4.1-mini'
    elif complexity == 'medium':
        return 'gpt-35-turbo'
    else:
        return 'gpt-4.1'
```

## Silumise tööriistad ja tehnikad

### AZD silumiskäsud

```bash
# Luba üksikasjalik logimine
azd up --debug

# Kontrolli juurutamise olekut
azd show

# Vaata rakenduse logisid (avatakse jälgimisliides)
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live

# Kontrolli keskkonnamuutujaid
azd env get-values
```

### AZD AI laienduse käsud diagnostika jaoks

Kui oled agendid juurutanud käsklusega `azd ai agent init`, on saadaval need lisatööriistad:

```bash
# Veenduge, et agendi laiendus on installitud
azd extension install azure.ai.agents

# Algseadista või uuenda agenti manifestist
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Kasuta MCP serverit, et lasta tehisintellekti tööriistadel projektiseisundit pärida
azd mcp start

# Genereeri infrastruktuuri failid ülevaatamiseks ja auditeerimiseks
azd infra generate
```

> **Vihje:** Kasuta käsku `azd infra generate`, et kirjutada IaC kettale, et saaksid täpselt kontrollida, millised ressursid juurutati. See on hindamatu ressurss juurutamise konfiguratsiooni probleemide silumisel. Täpsemad juhised leiad [AZD AI CLI viidetest](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Rakenduse silumine

1. **Struktureeritud logimine:**
```python
import logging
import json

# Konfigureeri struktureeritud logimine tehisintellekti rakendustele
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

2. **Tervisekontrolli otspunktid:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Kontrolli OpenAI ühenduvust
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Kontrolli otsinguteenust
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

3. **Jõudluse monitooring:**
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

## Levinumad veakoodid ja lahendused

| Veakood | Kirjeldus | Lahendus |
|------------|-------------|----------|
| 401 | Lubamatu | Kontrolli API võtmeid ja hallatava identiteedi konfiguratsiooni |
| 403 | Keelatud | Kontrolli RBAC rollide määranguid |
| 429 | Liiga palju päringuid | Rakenda korduskatse loogikat eksponentsiaalse tagasilöögiga |
| 500 | Sisemine serveri viga | Kontrolli mudeli juurutamise olekut ja logisid |
| 503 | Teenus pole saadaval | Kontrolli teenuse olekut ja regiooni saadavust |

## Järgmised sammud

1. **Vaata üle [AI mudeli juurutamise juhend](../chapter-02-ai-development/ai-model-deployment.md)** parimate tavade jaoks
2. **Lõpeta [Tootmis- ja ettevõtluse AI praktikad](../chapter-08-production/production-ai-practices.md)**
3. **Liitu [Microsoft Foundry Discordiga](https://aka.ms/foundry/discord) kogukonna toe saamiseks**
4. **Esita probleemid** [AZD GitHubi hoidlas](https://github.com/Azure/azure-dev), mis on seotud AZD spetsiifiliste probleemidega

## Ressursid

- [Microsoft Foundry mudelite teenuse veaotsing](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps veaotsing](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI otsingu veaotsing](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Paigalda Azure veaotsingu oskused oma redaktorisse: `npx skills add microsoft/github-copilot-for-azure`

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Veaotsing ja silumine
- **⬅️ Eelmine**: [Silumise juhend](debugging.md)
- **➡️ Järgmine peatükk**: [Peatükk 8: Tootmise ja ettevõtluse mustrid](../chapter-08-production/production-ai-practices.md)
- **🤖 Seotud**: [Peatükk 2: AI-esimene arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Viide**: [Azure Developer CLI veaotsing](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi me püüame täpsust, palun arvestage, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks pidada autoriteetseks allikaks. Tähtsa informatsiooni puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tingitud väärarusaamade või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->