# Špecifický sprievodca riešením problémov s umelou inteligenciou

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca**: [Sprievodca ladením](debugging.md)
- **➡️ Ďalšia kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Súvisiace**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Tento komplexný sprievodca riešením problémov rieši bežné problémy pri nasadzovaní AI riešení s AZD, poskytuje riešenia a techniky ladenia špecifické pre služby Azure AI.

> **Rozsah:** Príkazy používajú príkladové názvy zdrojov; nahraďte ich a vyberte správne predplatné. Bicep bloky sú fragmenty na zlúčenie do existujúcej šablóny, nie samostatné nasadenia. Python ukážky vyžadujú uvedené SDK a konfiguráciu aplikácie. Pre túto kontrolu sa nenasadzovalo priamo do Azure.

## Obsah

- [Problémy so službou Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problémy s Azure AI Search](#azure-ai-search-problems)
- [Problémy s nasadením Container Apps](#container-apps-deployment-issues)
- [Chyby autentifikácie a oprávnení](#authentication-and-permission-errors)
- [Zlyhania nasadenia modelu](#model-deployment-failures)
- [Problémy s výkonom a škálovaním](#performance-and-scaling-issues)
- [Správa nákladov a kvót](#cost-and-quota-management)
- [Nástroje a techniky ladenia](#debugging-tools-and-techniques)

## Problémy so službou Microsoft Foundry Models

### Problém: Služba OpenAI nie je dostupná v regióne

**Príznaky:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Príčiny:**
- Microsoft Foundry Models nie sú dostupné v zvolenom regióne
- Kvóta vyčerpaná v preferovaných regiónoch
- Regionálne kapacitné obmedzenia

**Riešenia:**

1. **Skontrolujte dostupnosť regiónu:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Aktualizujte konfiguráciu AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Použite alternatívne regióny:**
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

### Problém: Vyčerpaná kvóta nasadenia modelu

**Príznaky:**
```
Error: Deployment failed due to insufficient quota
```

**Riešenia:**

1. **Skontrolujte aktuálnu kvótu:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Požiadajte o zvýšenie kvóty:**
Použite workflow správy kvót v portáli Foundry pre dotknuté predplatné, región, model a typ nasadenia. Pozrite si [oficiálne usmernenia ku kvótam](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Žiadosť o kvótu VM nezvyšuje kvótu modelu.

3. **Optimalizujte kapacitu modelu:**
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

### Problém: Neplatná verzia API

**Príznaky:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Riešenia:**

1. **Použite podporovanú verziu API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Skontrolujte kompatibilitu verzie API:**
Skontrolujte [referenciu životného cyklu Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Verzie API poskytovateľov zdrojov ARM **nezahŕňajú** verzie API pre inference/data-plane. Noví klienti v1 používajú `/openai/v1/` bez datovanej `api-version`; nemiešajte obe konfigurácie klientov.

## Problémy s Azure AI Search

### Problém: Nedostatočná cenová úroveň služby Search

**Príznaky:**
```
Error: Semantic search requires Basic tier or higher
```

**Riešenia:**

1. **Použite podporovanú cenovú úroveň:**

Sémantický ranker vyžaduje Basic alebo vyššie. Prechod z Free/Basic na inú úroveň môže vyžadovať vytvorenie novej služby Search a rekonštrukciu indexov; úprava SKU nie je garantovaný upgrade na mieste.
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

2. **Zakážte sémantické vyhľadávanie (vývoj):**
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

### Problém: Zlyhania vytvárania indexu

**Príznaky:**
```
Error: Cannot create index, insufficient permissions
```

**Riešenia:**

1. **Overte kľúče služby Search:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Skontrolujte schému indexu:**
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

3. **Použite spravovanú identitu:**
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

## Problémy s nasadením Container Apps

### Problém: Zlyhania buildovania kontajnera

**Príznaky:**
```
Error: Failed to build container image
```

**Riešenia:**

1. **Skontrolujte syntax Dockerfile:**
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

2. **Validujte závislosti:**
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

3. **Pridajte health check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problém: Zlyhania spustenia Container app

**Príznaky:**
```
Error: Container failed to start within timeout period
```

**Riešenia:**

1. **Zvýšte časový limit spustenia:**
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

2. **Optimalizujte načítavanie modelu:**
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

## Chyby autentifikácie a oprávnení

### Problém: Odmietnutý prístup spravovanej identity

**Príznaky:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Riešenia:**

1. **Overte priradenia rolí:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Priraďte potrebné role:**
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

3. **Otestujte autentifikáciu:**
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

Získanie tokenu preukazuje autentifikáciu, nie povolenie vyvolať model. Otestujte zamýšľanú operáciu samostatne. Lokálne môže `DefaultAzureCredential` používať vývojárske poverenia; v Azure overte vybranú spravovanú identitu.

### Problém: Odmietnutý prístup ku Key Vault

**Príznaky:**
```
Error: The user, group or application does not have secrets get permission
```

**Riešenia:**

1. **Udeľte oprávnenia pre Key Vault:**

Použite nasledujúci fragment politiky prístupu iba pre vault s `enableRbacAuthorization: false`. Pre vault s RBAC povoleným režimom použite možnosť 2; pridanie politiky prístupu neudelia prístup v dátovej rovine v RBAC režime.
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

2. **Použite RBAC namiesto politík prístupu:**

Vault musí mať `enableRbacAuthorization: true`; zmena modelov oprávnení vyžaduje plánovanú migráciu existujúcich prístupov.
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

## Zlyhania nasadenia modelu

### Problém: Verzia modelu nie je dostupná

**Príznaky:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Riešenia:**

1. **Skontrolujte dostupné modely:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Explicitne vyberte dostupný model:**
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

3. **Overte model pred nasadením:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problémy s výkonom a škálovaním

### Problém: Vysoká latencia odpovedí

**Príznaky:**
- Časy odozvy > 30 sekúnd
- Chyby časového limitu
- Zlá používateľská skúsenosť

**Riešenia:**

1. **Implementujte časové limity požiadaviek:**
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

2. **Pridajte cachovanie odpovedí:**
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

3. **Nakonfigurujte automatické škálovanie:**
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

### Problém: Chyby nedostatku pamäte

**Príznaky:**
```
Error: Container killed due to memory limit exceeded
```

**Riešenia:**

1. **Zvýšte alokáciu pamäte:**
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

2. **Optimalizujte používanie pamäte:**
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

## Správa nákladov a kvót

### Problém: Neočakávane vysoké náklady

**Príznaky:**
- Azure faktúra vyššia, než sa očakávalo
- Spotreba tokenov presahuje odhady
- Spustené upozornenia rozpočtu

**Riešenia:**

1. **Implementujte kontroly nákladov:**
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

Tento čítač v pamäti je ilustratívny, nie nástroj na mesačné obmedzovanie výdavkov: resetuje sa po reštarte, nesdielajú sa medzi replikami a kontroluje spotrebu len po zavolaní. Skutočné limity vyžadujú trvalé účtovanie, bezpečné rezervácie pri súbežnosti a mesačnú reset politiku. Metričky pamäte kontajnera musia brať do úvahy aj limity cgroup; `psutil.virtual_memory()` nie je spoľahlivým ukazovateľom limitu kontajnera, a garbage collection nezavádza pamäťový strop.

2. **Nastavte upozornenia na náklady:**
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

Deklarujte `budgetStartDate` a `budgetEndDate` vo vašej šablóne. Rozpočty upozorňujú; nezastavujú zdroje ani nenaťahujú tvrdé výdavkové limity.

3. **Optimalizujte výber modelu:**
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

## Nástroje a techniky ladenia

### Príkazy na ladenie AZD

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

### Príkazy rozšírenia AZD AI pre diagnostiku

Ak ste nasadili agenty pomocou `azd ai agent init`, sú k dispozícii tieto doplnkové nástroje:

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

> **Tip:** Použite `azd infra generate` na zapísanie IaC na disk, aby ste mohli presne skontrolovať, aké zdroje boli provisionované. Je to neoceniteľné pri ladení problémov s konfiguráciou zdrojov. Viac detailov nájdete v [referencii AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

**Diagnostika GA workflow (2026-11-09):** Overte, či je `azd version` aspoň verzia 1.37.0 a prezrite `azd ext list --installed`. Najskôr aktualizujte samotný CLI príkazom `azd update` alebo jeho inštalátorom, potom aktualizujte bundle cez `azd ext upgrade microsoft.foundry`. Pri lokálnych chybách skontrolujte aktuálny uv, Python 3.13+ pre základný príklad, `PYTHONNOUSERSITE: "1"` v konfgurácii služby a prihlasovacie údaje Azure používané `DefaultAzureCredential`. Nechajte `azd ai agent run` bežať počas spúšťania `--local` z druhého terminálu v adresári projektu.

Úspešné provisionovanie ešte neznamená, že vývojár má prístup do dátovej roviny. Prezrite si varovania RBAC a [maticu oprávnení hostovaných agentov](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Vypršanie časového limitu neznamená zlyhanie nasadenia: skontrolujte verziu, ktorú sa snažíte použiť, a logy pred opätovným pokusom. Skoršie bety agentov beta.23 vylepšili tieto varovania a výstup A2A; historické opravy nájdete v [poznámkach k vydaniu](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), nie je nutné inštalovať túto betu.

Ak nie je dostupný `azd ai eval`, nainštalujte `azure.ai.evaluations` samostatne; GA bundle ho neobsahuje. Ak staršia príručka obsahuje len výpis pokynov pre migráciu v agent-evaluation príkaze, použite samostatný workflow `azd ai eval`. Optimalizačný nástroj `--config` už neprijíma staré evaluačné súbory. Pozrite [migráciu evaluácie](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) a [migráciu optimalizácie](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Ladenie aplikácie

1. **Štruktúrované logovanie:**
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

2. **Endpointy pre kontrolu stavu:**
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

3. **Monitorovanie výkonu:**
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

## Bežné chybové kódy a riešenia

| Kód chyby | Popis | Riešenie |
|------------|-------------|----------|
| 401 | Neautorizovaný prístup | Skontrolujte API kľúče a nastavenie spravovanej identity |
| 403 | Zakázaný prístup | Overte priradenie rolí RBAC |
| 429 | Limit požiadaviek prekročený | Implementujte logiku opätovného pokusu s exponenciálnym spätným odkladaním |
| 500 | Interná chyba servera | Skontrolujte stav nasadenia modelu a logy |
| 503 | Služba nedostupná | Overte zdravotný stav služby a dostupnosť regiónu |

## Ďalšie kroky

1. **Preštudujte si [Sprievodcu nasadením AI modelov](../chapter-02-ai-development/ai-model-deployment.md)** pre najlepšie praktiky nasadenia
2. **Dokončite [Produkčné AI postupy](../chapter-08-production/production-ai-practices.md)** pre riešenia pripravené do podnikového prostredia
3. **Pripojte sa k [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pre komunitnú podporu
4. **Nahláste problémy** v [GitHub repozitári AZD](https://github.com/Azure/azure-dev) pre špecifické problémy s AZD

## Zdrojové materiály

- [Riešenie problémov s kvótami a obmedzeniami Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Riešenie problémov s Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Riešenie problémov s Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Zručnosť Azure Diagnostického agenta**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Inštalujte diagnostické zručnosti Azure vo svojom editore: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca**: [Sprievodca ladením](debugging.md)
- **➡️ Ďalšia kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Súvisiace**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referencia**: [Riešenie problémov Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->