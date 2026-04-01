# Tehisintellektile Spetsiifiline Tõrkeotsingu Juhend

**Peatüki Navigeerimine:**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../../README.md)
- **📖 Käesolev Peatükk**: Peatükk 7 - Tõrkeotsing ja Silumine
- **⬅️ Eelmine**: [Silumise Juhend](debugging.md)
- **➡️ Järgmine Peatükk**: [Peatükk 8: Tootmine ja Ettevõtte Musterid](../chapter-08-production/production-ai-practices.md)
- **🤖 Seotud**: [Peatükk 2: AI-esimene Arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

See põhjalik tõrkeotsingu juhend käsitleb levinud probleeme AI lahenduste juurutamisel AZD-ga, pakkudes lahendusi ja silumistehnikaid, mis on spetsiifilised Azure AI teenustele.

## Sisukord

- [Microsoft Foundry Mudelite Teenuse Tõrked](#azure-openai-service-issues)
- [Azure AI Otsingu Probleemid](#azure-ai-otsingu-probleemid)
- [Konteinerirakenduste Juurutamise Tõrked](#konteinerirakenduste-juurutamise-tõrked)
- [Autentimise ja Lubade Vead](#autentimise-ja-lubade-vead)
- [Mudeli Juurutamise Ebaõnnestumised](#mudeli-juurutamise-ebaõnnestumised)
- [Jõudluse ja Skalaarimise Probleemid](#jõudluse-ja-skalaarimise-probleemid)
- [Kulu ja Kvoodi Haldus](#kulu-ja-kvoodi-haldus)
- [Silumise Tööriistad ja Tehnikad](#silumise-tööriistad-ja-tehnikad)

## Microsoft Foundry Mudelite Teenuse Tõrked

### Tõrge: OpenAI Teenus Regioonis Pole Saadaval

**Sümptomid:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Põhjused:**
- Microsoft Foundry Mudelid pole valitud regioonis saadaval
- Eelistatud regioonides on kvoot ammendunud
- Regionaalsed mahtupiirangud

**Lahendused:**

1. **Kontrolli Regiooni Saadavust:**
```bash
# Loetle OpenAI jaoks saadaval olevad piirkonnad
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Uuenda AZD Konfiguratsiooni:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Kasuta Alternatiivseid Regioone:**
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

### Tõrge: Mudeli Juurutamise Kvoot Ületatud

**Sümptomid:**
```
Error: Deployment failed due to insufficient quota
```

**Lahendused:**

1. **Kontrolli Praegust Kvooti:**
```bash
# Kontrolli piirmäära kasutust
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Taotle Kvoodi Suurendamist:**
```bash
# Esita taotlus mahu suurendamiseks
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimeeri Mudeli Mahutavust:**
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

### Tõrge: Kehtetu API Versioon

**Sümptomid:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Lahendused:**

1. **Kasuta Toetatud API Versiooni:**
```python
# Kasutage uusimat toetatud versiooni
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Kontrolli API Versiooni Ühilduvust:**
```bash
# Loetle toetatud API versioonid
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Otsingu Probleemid

### Tõrge: Otsinguteenuse Hinnataseme Ebapiisavus

**Sümptomid:**
```
Error: Semantic search requires Basic tier or higher
```

**Lahendused:**

1. **Tõsta Hinnatase:**
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

2. **Keela Sõnaline Otsing (Arendus):**
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

### Tõrge: Indeksi Loomise Ebaõnnestumine

**Sümptomid:**
```
Error: Cannot create index, insufficient permissions
```

**Lahendused:**

1. **Kontrolli Otsinguteenuse Võtmeid:**
```bash
# Hangi otsinguteenuse administraatori võti
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kontrolli Indeksi Skeemi:**
```python
# Kontrolli indeksi skeemi kehtivust
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

3. **Kasuta Juhtitud Identiteeti:**
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

## Konteinerirakenduste Juurutamise Tõrked

### Tõrge: Konteineri Ehitus Ebaõnnestub

**Sümptomid:**
```
Error: Failed to build container image
```

**Lahendused:**

1. **Kontrolli Dockerfile Süntaksit:**
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

2. **Kinnita Sõltuvused:**
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

3. **Lisa Tervisekontroll:**
```python
# main.py - Lisa tervisekontrolli lõpp-punkt
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Tõrge: Konteinerirakenduse Käivitamine Ebaõnnestub

**Sümptomid:**
```
Error: Container failed to start within timeout period
```

**Lahendused:**

1. **Suurenda Käivitusaega:**
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

2. **Optimeeri Mudeli Laadimist:**
```python
# Mudelite laisk laadimine käivitusaega vähendamiseks
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
        # Siin initsializeeri tehisintellekti klient
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Käivitus
    app.state.model_manager = ModelManager()
    yield
    # Sulgemine
    pass

app = FastAPI(lifespan=lifespan)
```

## Autentimise ja Lubade Vead

### Tõrge: Juhtitud Identiteedi Lube Keelatud

**Sümptomid:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Lahendused:**

1. **Kontrolli Rollide Määranguid:**
```bash
# Kontrolli praeguseid rolli määramisi
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Määra Vajalikud Rollid:**
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

3. **Testi Autentimist:**
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

### Tõrge: Key Vault Ligipääs Keelatud

**Sümptomid:**
```
Error: The user, group or application does not have secrets get permission
```

**Lahendused:**

1. **Anna Key Vault Lube:**
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

2. **Kasuta RBAC-i Asendades Ligipääsupoliitikad:**
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

## Mudeli Juurutamise Ebaõnnestumised

### Tõrge: Mudeli Versioon Pole Saadaval

**Sümptomid:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lahendused:**

1. **Kontrolli Saadaval Olevaid Mudeleid:**
```bash
# Loetle saadaolevad mudelid
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Kasuta Mudeli Varuvalikuid:**
```bicep
// Model deployment with fallback
@description('Primary model configuration')
param primaryModel object = {
  name: 'gpt-4.1-mini'
  version: '2024-07-18'
}

@description('Fallback model configuration')
param fallbackModel object = {
  name: 'gpt-4.1'
  version: '2024-08-06'
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

3. **Kontrolli Mudelit Enne Juurutamist:**
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

## Jõudluse ja Skalaarimise Probleemid

### Tõrge: Kõrged Latentsi Vastused

**Sümptomid:**
- Vastuste aeg > 30 sekundit
- Aja ületamise vead
- Halva kasutajakogemuse

**Lahendused:**

1. **Rakenda Päringu Aja Ületuse Kontroll:**
```python
# Seadistage õiged ajalõpud
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

2. **Lisa Vastuste Vahemällu Salvestamine:**
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

3. **Konfigureeri Automaatne Skalaarimine:**
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

### Tõrge: Mälu Lõppemise Vead

**Sümptomid:**
```
Error: Container killed due to memory limit exceeded
```

**Lahendused:**

1. **Suurenda Mälu Eelarvet:**
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

2. **Optimeeri Mälu Kasutust:**
```python
# Mälu tõhus mudelite haldamine
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
            gc.collect()  # Sundida prügikogu käivitamist
            
        result = await self._process_ai_request(request)
        
        # Korista pärast töötlemist
        gc.collect()
        return result
```

## Kulu ja Kvoodi Haldus

### Tõrge: Ootamatult Kõrged Kulud

**Sümptomid:**
- Azure arve suurem kui eeldatud
- Märkimisväärselt ületatud tokeni kasutus
- Eelarvehoiatused käivitatud

**Lahendused:**

1. **Rakenda Kulude Kontrollid:**
```python
# Siltide kasutamise jälgimine
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

2. **Seadista Kuluhüüded:**
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

3. **Optimeeri Mudeli Valik:**
```python
# Kulutundlik mudeli valik
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

## Silumise Tööriistad ja Tehnikad

### AZD Silumise Käsud

```bash
# Luba detailsed logid
azd up --debug

# Kontrolli juurutuse olekut
azd show

# Vaata rakenduse logisid (avab monitooringu armatuurlaua)
azd monitor --logs

# Vaata reaalajas mõõdikuid
azd monitor --live

# Kontrolli keskkonnamuutujaid
azd env get-values
```

### AZD AI Laienduse Käsud Diagnostikaks

Kui sa juurutasid agente kasutades `azd ai agent init`, on need lisatööriistad saadaval:

```bash
# Veendu, et agendi laiendus oleks installitud
azd extension install azure.ai.agents

# Algata agent uuesti või uuenda seda manifestist
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Kasuta MCP serverit, et lasta AI tööriistadel projektiseisundit pärida
azd mcp start

# Genereeri infrastruktuurifailid ülevaatamiseks ja auditeerimiseks
azd infra generate
```

> **Nõuanne:** Kasuta `azd infra generate` IaC kirjutamiseks kettale, et saaksid täpselt kontrollida, millised ressursid on loodud. See on hindamatu ressurss ressursikonfiguratsiooni tõrkeotsingul. Vaata täpsemalt [AZD AI CLI viidet](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Rakenduse Silumine

1. **Struktureeritud Logimine:**
```python
import logging
import json

# Konfigureeri struktuurset logimist tehisintellekti rakenduste jaoks
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

2. **Tervisekontrolli Lõpp-punktid:**
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

3. **Jõudluse Jälgimine:**
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

## Levinumad Veakoodid ja Lahendused

| Veakood | Kirjeldus | Lahendus |
|---------|-----------|----------|
| 401 | Volitamata | Kontrolli API võtmeid ja juhtitud identiteedi konfiguratsiooni |
| 403 | Keelatud | Kontrolli RBAC rollimäärajate määranguid |
| 429 | Liiga Palju Päringuid | Rakenda korduva proovimise loogikat eksponentsiaalse tagasilöögiga |
| 500 | Sisemine Serveri Viga | Kontrolli mudeli juurutamise olekut ja logisid |
| 503 | Teenus Pole Saadaval | Kontrolli teenuse tervist ja regioonide saadavust |

## Järgmised Sammud

1. **Vaata üle [AI Mudeli Juurutamise Juhend](../chapter-02-ai-development/ai-model-deployment.md)** parimate tavade jaoks
2. **Lõpeta [Tootmise AI Praktikad](../chapter-08-production/production-ai-practices.md)** ettevõttevalmid lahendused
3. **Liitu [Microsoft Foundry Discordiga](https://aka.ms/foundry/discord)** kogukonna toe saamiseks
4. **Esita probleeme** [AZD GitHubi hoidlas](https://github.com/Azure/azure-dev) AZD spetsiifiliste probleemide jaoks

## Ressursid

- [Microsoft Foundry Mudelite Teenuse Tõrkeotsing](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Konteinerirakenduste Tõrkeotsing](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Otsingu Tõrkeotsing](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostika Agendi Oskus**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Paigalda Azure tõrkeotsingu oskused oma editorisse: `npx skills add microsoft/github-copilot-for-azure`

---

**Peatüki Navigeerimine:**
- **📚 Kursuse Avaleht**: [AZD Algajatele](../../README.md)
- **📖 Käesolev Peatükk**: Peatükk 7 - Tõrkeotsing ja Silumine
- **⬅️ Eelmine**: [Silumise Juhend](debugging.md)
- **➡️ Järgmine Peatükk**: [Peatükk 8: Tootmine ja Ettevõtte Musterid](../chapter-08-production/production-ai-practices.md)
- **🤖 Seotud**: [Peatükk 2: AI-esimene Arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Viide**: [Azure Arendaja CLI Tõrkeotsing](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame täpsust, teadke, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument oma emakeeles tuleks pidada autoriteetseks allikaks. Tähtsa info puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tekkivate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->