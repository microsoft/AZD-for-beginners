# Mwongozo wa Kutatua Matatizo Maalum kwa AI

**Menyuko ya Mkuu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waandishi wa Msingi](../../README.md)
- **📖 Sura ya Hivi Sasa**: Sura ya 7 - Kutatua Matatizo & Kurekebisha Makosa
- **⬅️ Iliyopita**: [Mwongozo wa Kurekebisha Makosa](debugging.md)
- **➡️ Sura Ifuatayo**: [Sura ya 8: Mifumo ya Uzalishaji & Biashara](../chapter-08-production/production-ai-practices.md)
- **🤖 Kuhusiana**: [Sura ya 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)

Mwongozo huu wa kina wa kutatua matatizo unashughulikia matatizo ya kawaida wakati wa kupeleka suluhisho za AI kwa AZD, ukitoa suluhisho na mbinu za kurekebisha makosa maalum kwa huduma za Azure AI.

> **Eneo:** Amri zinatumia majina ya rasilimali kama mifano; zibadilishe na kuchagua usajili sahihi. Sehemu za Bicep ni vipande vya kuunganishwa kwenye kiolezo kilichopo, si utekelezaji wa pekee. Vipande vya Python vinahitaji SDK na usanidi wa programu ulioainishwa. Hakuna utekelezaji wa moja kwa moja wa Azure uliofanyika kwa ukaguzi huu.

## Jedwali la Yaliyomo

- [Matatizo ya Huduma ya Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Matatizo ya Utafutaji wa Azure AI](#azure-ai-search-problems)
- [Matatizo ya Utekelezaji wa Container Apps](#container-apps-deployment-issues)
- [Makosa ya Uthibitishaji na Ruhusa](#authentication-and-permission-errors)
- [Kushindwa kwa Utekelezaji wa Modeli](#model-deployment-failures)
- [Matatizo ya Utendaji na Upanuzi](#performance-and-scaling-issues)
- [Usimamizi wa Gharama na Kiwango](#cost-and-quota-management)
- [Zana na Mbinu za Kurekebisha Makosa](#debugging-tools-and-techniques)

## Matatizo ya Huduma ya Microsoft Foundry Models

### Tatizo: Huduma ya OpenAI Haipatikani Kanda Hiyo

**Dalili:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Sababu:**
- Microsoft Foundry Models haipatikani katika kanda iliyochaguliwa
- Kiwango kilichotumika katika kanda zinazopendekezwa kimekamilika
- Mipaka ya uwezo wa kanda

**Suluhisho:**

1. **Kagua Upatikanaji wa Kanda:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Sasisha Usanidi wa AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Tumia Kanda Mbali Mbali:**
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

### Tatizo: Kiwango cha Utekelezaji cha Modeli Kimezidiwa

**Dalili:**
```
Error: Deployment failed due to insufficient quota
```

**Suluhisho:**

1. **Kagua Kiwango Cha Sasa:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Ombi la Kuongeza Kiwango:**
Tumia mchakato wa usimamizi wa kiwango katika lango la Foundry kwa usajili, kanda, modeli, na aina ya utekelezaji iliyoathirika. Angalia [mwongozo rasmi wa kiwango](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Ombi la kiwango cha VM haliongezi kiwango cha modeli.

3. **Boresha Uwezo wa Modeli:**
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

### Tatizo: Toleo la API Halili

**Dalili:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Suluhisho:**

1. **Tumia Toleo la API Linaloungwa Mkono:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Kagua Ulinganifu wa Toleo la API:**
Angalia [marejeo ya mzunguko wa maisha wa Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Toleo la API za mtoaji rasilimali za ARM **halisitishi** orodha ya toleo za API za inference/data-plane. Wateja wapya wa v1 hutumia `/openai/v1/` bila tarehe ya `api-version`; usichanganye usanidi wa wateja wawili.

## Matatizo ya Utafutaji wa Azure AI

### Tatizo: Kiwango cha Bei cha Huduma ya Utafutaji Hakitoshi

**Dalili:**
```
Error: Semantic search requires Basic tier or higher
```

**Suluhisho:**

1. **Tumia Kiwango cha Bei Kinachoungwa Mkono:**

Kiwigo cha semantiki kinahitaji Basic au kikubwa zaidi. Kuondoka kutoka Free/Basic kwenda kiwango kingine kunaweza kuhitaji kuunda huduma mpya ya utafutaji na kujenga upya viwango; kuhariri SKU si kuboresha moja kwa moja.
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

2. **Zima Utafutaji wa Semantiki (Maendeleo):**
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

### Tatizo: Kushindwa kwa Uundaji wa Kiwango

**Dalili:**
```
Error: Cannot create index, insufficient permissions
```

**Suluhisho:**

1. **Thibitisha Funguo za Huduma ya Utafutaji:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Kagua Mchoro wa Kiwango:**
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

3. **Tumia Kitambulisho Kilichosimamiwa:**
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

## Matatizo ya Utekelezaji wa Container Apps

### Tatizo: Kushindwa kwa Ujenzi wa Container

**Dalili:**
```
Error: Failed to build container image
```

**Suluhisho:**

1. **Kagua Sarufi ya Dockerfile:**
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

2. **Thibitisha Kutegemea:**
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

3. **Ongeza Ukaguzi wa Afya:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Tatizo: Kushindwa kwa Kuanzisha Container App

**Dalili:**
```
Error: Container failed to start within timeout period
```

**Suluhisho:**

1. **Ongeza Muda wa Kusubiri Kuanzishwa:**
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

2. **Boresha Uingizaji wa Modeli:**
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

## Makosa ya Uthibitishaji na Ruhusa

### Tatizo: Ruhusa ya Kitambulisho Kilichosimamiwa Imekataliwa

**Dalili:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Suluhisho:**

1. **Thibitisha Miaridhi ya Roli:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Weka Roli Zinazohitajika:**
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

3. **Jaribu Uthibitishaji:**
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

Upatikanaji wa tokeni unaonyesha uthibitishaji, si ruhusa ya kuitisha modeli. Jaribu operesheni inayokusudiwa kando. Kwenye eneo la nyumba, `DefaultAzureCredential` inaweza kutumia vibali vya msanidi; Azure, hakikisha kitambulisho kilichosimamiwa kinachokusudiwa kimechaguliwa.

### Tatizo: Upatikanaji wa Key Vault Umekataliwa

**Dalili:**
```
Error: The user, group or application does not have secrets get permission
```

**Suluhisho:**

1. **Toa Ruhusa za Key Vault:**

Tumia kipande cha sera ya ufikiaji ifuatayo kwa kundi lenye `enableRbacAuthorization: false` pekee. Kwa Ghuba yenye RBAC, tumia chaguo la 2; kuongeza sera ya ufikiaji hakuiti ufikiaji wa data-plane kwa hali ya RBAC.
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

2. **Tumia RBAC Badala ya Sera za Ufikiaji:**

Ghuba lazima iwe na `enableRbacAuthorization: true`; kubadilisha mifano ya ruhusa kunahitaji mpito uliopangwa wa ufikiaji uliopo.
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

## Kushindwa kwa Utekelezaji wa Modeli

### Tatizo: Toleo la Modeli Halipatikani

**Dalili:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Suluhisho:**

1. **Angalia Modeli Zilizopo:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Chagua Modeli Iliyo Patikana Ibukishwe Sawa:**
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

3. **Thibitisha Modeli Kabla ya Utekelezaji:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Matatizo ya Utendaji na Upanuzi

### Tatizo: Majibu Yenye uchelewe Mkubwa

**Dalili:**
- Muda wa majibu > sekunde 30
- Makosa ya muda wa kusubiri
- Uzoefu mbaya wa mtumiaji

**Suluhisho:**

1. **Tekeleza Muda wa Kusubiri Maombi:**
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

2. **Ongeza Uhifadhi wa Majibu:**
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

3. **Sanidi Usanidi wa Kujipandisha Kiwango Kiotomatiki:**
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

### Tatizo: Makosa ya Ukosefu wa Kumbukumbu

**Dalili:**
```
Error: Container killed due to memory limit exceeded
```

**Suluhisho:**

1. **Ongeza Ugawaji wa Kumbukumbu:**
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

2. **Boresha Matumizi ya Kumbukumbu:**
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

## Usimamizi wa Gharama na Kiwango

### Tatizo: Gharama Zinazozidi Kutarajiwa

**Dalili:**
- Bili ya Azure zaidi ya ilivyotarajiwa
- Matumizi ya tokeni yamezidi makadirio
- Tahadhari za bajeti zimetokea

**Suluhisho:**

1. **Tekeleza Udhibiti wa Gharama:**
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

Hii ni counter ya kumbukumbu inayoonyesha mfano, si udhibiti wa matumizi ya kila mwezi: huanzishwa upya baada ya kuanzisha, haishiriki kati ya nakala, na huangalia matumizi baada ya simu pekee. Kikomo halisi kinahitaji uhasibu sugu, uhifadhi salama wa mi concurrent kabla ya maombi, na sera ya upya kila mwezi. Vipimo vya kumbukumbu za container pia lazima viangalie vikwazo vya cgroup; `psutil.virtual_memory()` si kipimo cha uhakika cha kikomo cha container, na ukusanyaji wa takataka hauzimishi kikomo cha kumbukumbu.

2. **Sanidi Tahadhari za Gharama:**
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

Taja `budgetStartDate` na `budgetEndDate` kwenye kiolezo chako. Bajeti hutangaza; hazizui rasilimali wala kuweka kikomo kadi cha matumizi.

3. **Boresha Uteuzi wa Modeli:**
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

## Zana na Mbinu za Kurekebisha Makosa

### Amri za Kurekebisha Makosa za AZD

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

### Amri za Ongezeko la AZD AI kwa Uchunguzi

Ikiwa uliweka mawakala kwa kutumia `azd ai agent init`, zana za ziada zipo:

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

> **Kipengele:** Tumia `azd infra generate` kuandika IaC kwenye disk ili uchunguze hasa rasilimali gani ziliwekwa. Hii ni muhimu sana wakati wa kurekebisha matatizo ya usanidi wa rasilimali. Angalia [marejeo ya AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) kwa maelezo kamili.

**Uchunguzi unajua toleo (2026-11-04):** Mawakala wa `1.0.0-beta.23` yanahitaji `azd >= 1.37.0`; sasisha CLI kuu kabla ya ongezeko lisiloendana. Toa la wakala huu linaleta onyo la RBAC za msanidi katika matokeo ya mwisho ya utekelezaji na linaonyesha toleo lilohusika katika kushindwa kwa uanzilishi/muda uliopitwa. Muda uliopita hauonyeshi kuwa utekelezaji umefeli: chunguza toleo lilijaribiwa kabla ya kujaribu tena. Pia linaondoa wito wa A2A 0.3 unaonyesha ujumbe wa mzunguko wa maisha badala ya majibu yaliyokamilika. Core `azd 1.37.1` inarekebisha usambazaji wa kufuta kati ya ongezeko; `1.37.2` inaboresha uthibitisho muhimu wa utoaji na uendeshaji wa kufuta.

Ikiwa amri ya tathmini ya funzo la zamani inayochapisha tu mwongozo wa mpito, weka `azure.ai.evaluations` (`1.0.0-beta.2` inahitaji `azd >= 1.33.0`) na tumia `azd ai eval init`, `generate`, na `run start`. Kipengele cha optimization `--config` hakikubali tena faili za tathmini za zamani. Angalia [mpito wa tathmini](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) na [mpito wa optimization](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Kurekebisha Makosa ya Programu

1. **Kuingiza Logi kwa Muundo:**
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

2. **Vituo vya Ukaguzi wa Afya:**
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

3. **Ufuatiliaji wa Utendaji:**
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

## Msimbo wa Makosa Yanayojirudia na Suluhisho

| Msimbo wa Kosa | Maelezo | Suluhisho |
|------------|-------------|----------|
| 401 | Hauruhusiwi | Kagua funguo za API na usanidi wa kitambulisho kilichosimamiwa |
| 403 | Imekwama | Thibitisha miaridhi ya majukumu ya RBAC |
| 429 | Kiwango Kimezuiwa | Tekeleza mantiki ya kurudia na kuongezeka kwa muda wa kusubiri |
| 500 | Kosa la Seva ya Ndani | Kagua hali ya utekelezaji wa modeli na vikumbusahisho |
| 503 | Huduma Haipatikani | Thibitisha afya ya huduma na upatikanaji wa kanda |

## Hatua Ifuatayo

1. **Pitisha [Mwongozo wa Utekelezaji wa AI Modeli](../chapter-02-ai-development/ai-model-deployment.md)** kwa mbinu bora za utekelezaji
2. **Kamilisha [Mawazo ya Uzalishaji ya AI](../chapter-08-production/production-ai-practices.md)** kwa suluhisho tayari kwa biashara
3. **Jiunge na [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** kwa msaada wa jamii
4. **Wasilisha matatizo** kwenye [hifadhi ya AZD GitHub](https://github.com/Azure/azure-dev) kwa matatizo maalum ya AZD

## Rasilimali

- [Utaratibu wa kutatua matatizo ya ukomo na utendaji wa Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Kutatua Matatizo ya Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Kutatua Matatizo ya Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Ujuzi wa Mwakala wa Azure Diagnostics**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Sakinisha ujuzi wa kutatua matatizo wa Azure katika mhariri wako: `npx skills add microsoft/github-copilot-for-azure`

---

**Menyuko ya Mkuu:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Waandishi wa Msingi](../../README.md)
- **📖 Sura ya Hivi Sasa**: Sura ya 7 - Kutatua Matatizo & Kurekebisha Makosa
- **⬅️ Iliyopita**: [Mwongozo wa Kurekebisha Makosa](debugging.md)
- **➡️ Sura Ifuatayo**: [Sura ya 8: Mifumo ya Uzalishaji & Biashara](../chapter-08-production/production-ai-practices.md)
- **🤖 Kuhusiana**: [Sura ya 2: Maendeleo ya AI-Kwanza](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Marejeleo**: [Kutatua Matatizo za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Kionyozo**:
Hati hii imetafsiriwa kwa kutumia huduma ya tafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kupata usahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au upungufu wa usahihi. Hati ya asili katika lugha yake halisi inapaswa kuchukuliwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu inayofanywa na binadamu inapendekezwa. Hatutojibu kwa kuelewa vibaya au tafsiri potofu zinazotokea kutokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->