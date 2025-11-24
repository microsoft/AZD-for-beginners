<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-24T13:04:30+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "et"
}
-->
# AI-spetsiifiline tõrkeotsingu juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine**: [Silumise juhend](debugging.md)
- **➡️ Järgmine peatükk**: [Peatükk 8: Tootmine ja ettevõtte mustrid](../microsoft-foundry/production-ai-practices.md)
- **🤖 Seotud**: [Peatükk 2: AI-First arendus](../microsoft-foundry/microsoft-foundry-integration.md)

**Eelmine:** [Tootmise AI praktikad](../microsoft-foundry/production-ai-practices.md) | **Järgmine:** [AZD-ga alustamine](../getting-started/README.md)

See põhjalik tõrkeotsingu juhend käsitleb levinud probleeme AI lahenduste juurutamisel AZD-ga, pakkudes lahendusi ja silumistehnikaid, mis on spetsiifilised Azure AI teenustele.

## Sisukord

- [Azure OpenAI teenuse probleemid](../../../../docs/troubleshooting)
- [Azure AI otsingu probleemid](../../../../docs/troubleshooting)
- [Konteinerirakenduste juurutamise probleemid](../../../../docs/troubleshooting)
- [Autentimise ja õiguste vead](../../../../docs/troubleshooting)
- [Mudelijuurutuse tõrked](../../../../docs/troubleshooting)
- [Jõudluse ja skaleerimise probleemid](../../../../docs/troubleshooting)
- [Kulude ja kvootide haldamine](../../../../docs/troubleshooting)
- [Silumisvahendid ja -tehnikad](../../../../docs/troubleshooting)

## Azure OpenAI teenuse probleemid

### Probleem: OpenAI teenus pole piirkonnas saadaval

**Sümptomid:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Põhjused:**
- Azure OpenAI pole valitud piirkonnas saadaval
- Eelistatud piirkondades on kvoot ammendunud
- Piirkondlikud mahupiirangud

**Lahendused:**

1. **Kontrolli piirkonna saadavust:**
```bash
# Loetle saadaval olevad piirkonnad OpenAI jaoks
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

3. **Kasuta alternatiivseid piirkondi:**
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

### Probleem: Mudelijuurutuse kvoot ületatud

**Sümptomid:**
```
Error: Deployment failed due to insufficient quota
```

**Lahendused:**

1. **Kontrolli praegust kvooti:**
```bash
# Kontrolli kvoodi kasutust
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Taotle kvoodi suurendamist:**
```bash
# Esita kvoodi suurendamise taotlus
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimeeri mudeli mahtuvust:**
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

### Probleem: Vigane API versioon

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
# Loetle toetatud API versioonid
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI otsingu probleemid

### Probleem: Otsinguteenuse hinnaklass pole piisav

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

### Probleem: Indeksi loomise tõrked

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
# Kinnita indeksi skeem
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

3. **Kasuta hallatud identiteeti:**
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

## Konteinerirakenduste juurutamise probleemid

### Probleem: Konteineri ehituse tõrked

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

2. **Valideeri sõltuvused:**
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

### Probleem: Konteinerirakenduse käivitamise tõrked

**Sümptomid:**
```
Error: Container failed to start within timeout period
```

**Lahendused:**

1. **Suurenda käivitamise ajalõppu:**
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
# Laadi mudelid laisalt, et vähendada käivitusaega
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
        # Initsialiseeri AI klient siin
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Käivitamine
    app.state.model_manager = ModelManager()
    yield
    # Seiskamine
    pass

app = FastAPI(lifespan=lifespan)
```

## Autentimise ja õiguste vead

### Probleem: Hallatud identiteedi õigused keelatud

**Sümptomid:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Lahendused:**

1. **Kontrolli rollide määramisi:**
```bash
# Kontrolli praeguseid rolli määramisi
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

## Mudelijuurutuse tõrked

### Probleem: Mudeli versioon pole saadaval

**Sümptomid:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lahendused:**

1. **Kontrolli saadaolevaid mudeleid:**
```bash
# Loetle saadaval olevad mudelid
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Kasuta mudeli varuvariante:**
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

3. **Valideeri mudel enne juurutamist:**
```python
# Mudeli valideerimine enne kasutuselevõttu
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

### Probleem: Kõrge latentsusega vastused

**Sümptomid:**
- Vastuse ajad > 30 sekundit
- Ajalõpu vead
- Kehv kasutajakogemus

**Lahendused:**

1. **Rakenda päringu ajalõppe:**
```python
# Konfigureeri sobivad ajavahemikud
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

2. **Lisa vastuste vahemällu salvestamine:**
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

### Probleem: Mälu ületamise vead

**Sümptomid:**
```
Error: Container killed due to memory limit exceeded
```

**Lahendused:**

1. **Suurenda mälumahtu:**
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

2. **Optimeeri mälukasutust:**
```python
# Mälu säästlik mudeli käsitsemine
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Kontrolli mälukasutust enne töötlemist
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Sundida prügikoristust
            
        result = await self._process_ai_request(request)
        
        # Puhasta pärast töötlemist
        gc.collect()
        return result
```

## Kulude ja kvootide haldamine

### Probleem: Ootamatult kõrged kulud

**Sümptomid:**
- Azure'i arve on oodatust suurem
- Märkimisväärne tokenite kasutus
- Eelarvehäired aktiveeritud

**Lahendused:**

1. **Rakenda kulude kontrolli:**
```python
# Märgistus kasutamise jälgimine
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

2. **Seadista kulude häired:**
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
# Kuluteadlik mudeli valik
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # iga 1K tokeni kohta
    'gpt-4': 0.03,          # iga 1K tokeni kohta
    'gpt-35-turbo': 0.0015  # iga 1K tokeni kohta
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

## Silumisvahendid ja -tehnikad

### AZD silumiskäsud

```bash
# Luba üksikasjalik logimine
azd up --debug

# Kontrolli juurutamise olekut
azd show

# Vaata juurutamise logisid
azd logs --follow

# Kontrolli keskkonnamuutujaid
azd env get-values
```

### Rakenduse silumine

1. **Struktureeritud logimine:**
```python
import logging
import json

# Konfigureeri struktureeritud logimine AI rakenduste jaoks
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

2. **Tervisekontrolli lõpp-punktid:**
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

3. **Jõudluse jälgimine:**
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

## Levinud veakoodid ja lahendused

| Veakood | Kirjeldus | Lahendus |
|---------|-----------|----------|
| 401 | Autoriseerimata | Kontrolli API võtmeid ja hallatud identiteedi konfiguratsiooni |
| 403 | Keelatud | Kontrolli RBAC rollide määramisi |
| 429 | Liiga palju päringuid | Rakenda uuesti proovimise loogika eksponentsiaalse viivitusega |
| 500 | Sisemine serveri viga | Kontrolli mudelijuurutuse olekut ja logisid |
| 503 | Teenus pole saadaval | Kontrolli teenuse tervist ja piirkondlikku saadavust |

## Järgmised sammud

1. **Vaata üle [AI mudelijuurutuse juhend](ai-model-deployment.md)** parimateks juurutustavaks
2. **Lõpeta [Tootmise AI praktikad](production-ai-practices.md)** ettevõttevalmidusega lahenduste jaoks
3. **Liitu [Microsoft Foundry Discordiga](https://aka.ms/foundry/discord)**, et saada kogukonna tuge
4. **Esita probleemid** [AZD GitHubi repositooriumis](https://github.com/Azure/azure-dev) AZD-spetsiifiliste probleemide jaoks

## Ressursid

- [Azure OpenAI teenuse tõrkeotsing](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Konteinerirakenduste tõrkeotsing](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI otsingu tõrkeotsing](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 7 - Tõrkeotsing ja silumine
- **⬅️ Eelmine**: [Silumise juhend](debugging.md)
- **➡️ Järgmine peatükk**: [Peatükk 8: Tootmine ja ettevõtte mustrid](../microsoft-foundry/production-ai-practices.md)
- **🤖 Seotud**: [Peatükk 2: AI-First arendus](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI tõrkeotsing](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->