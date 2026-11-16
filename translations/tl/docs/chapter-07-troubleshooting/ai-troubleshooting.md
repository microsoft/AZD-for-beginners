# Gabay sa Pagsasaayos ng Mga Problema ng AI

**Pag-navigate sa Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Pagsasaayos ng Problema at Pag-debug
- **⬅️ Nakaraang Kabanata**: [Gabay sa Pag-debug](debugging.md)
- **➡️ Susunod na Kabanata**: [Kabanata 8: Mga Pattern sa Produksyon at Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Kaugnay**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ang komprehensibong gabay na ito sa pagsasaayos ng problema ay tumutugon sa mga karaniwang isyu sa pag-deploy ng mga AI na solusyon gamit ang AZD, na nagbibigay ng mga solusyon at mga teknik sa pag-debug na partikular sa mga serbisyo ng Azure AI.

> **Saklaw:** Ang mga utos ay gumagamit ng mga halimbawa ng pangalan ng resource; palitan ang mga iyon at piliin ang tamang subscription. Ang mga bloke ng Bicep ay mga fragment na pagsasamahin sa isang umiiral na template, hindi standalone na mga deployment. Ang mga snippet ng Python ay nangangailangan ng tinukoy na mga SDK at konfigurasyon ng aplikasyon. Walang live na deployment sa Azure ang naisagawa para sa pagsusuring ito.

## Talaan ng mga Nilalaman

- [Mga Isyu sa Microsoft Foundry Models Service](#microsoft-foundry-models-service-issues)
- [Mga Problema sa Azure AI Search](#azure-ai-search-problems)
- [Mga Isyu sa Pag-deploy ng Container Apps](#container-apps-deployment-issues)
- [Mga Error sa Pagpapatotoo at Permiso](#authentication-and-permission-errors)
- [Pagkabigo sa Pag-deploy ng Modelo](#model-deployment-failures)
- [Mga Isyu sa Pagganap at Pag-scale](#performance-and-scaling-issues)
- [Pamamahala ng Gastos at Quota](#cost-and-quota-management)
- [Mga Kasangkapan at Teknik sa Pag-debug](#debugging-tools-and-techniques)

## Mga Isyu sa Microsoft Foundry Models Service

### Isyu: Hindi Magagamit ang OpenAI Service sa Rehiyon

**Sintomas:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Mga Sanhi:**
- Hindi magagamit ang Microsoft Foundry Models sa napiling rehiyon
- Uubos na quota sa mga paboritong rehiyon
- Mga limitasyon sa kapasidad ng rehiyon

**Mga Solusyon:**

1. **Suriin ang Availability ng Rehiyon:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **I-update ang Konfigurasyon ng AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Gumamit ng Ibang Rehiyon:**
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

### Isyu: Lumabis ang Quota sa Pag-deploy ng Modelo

**Sintomas:**
```
Error: Deployment failed due to insufficient quota
```

**Mga Solusyon:**

1. **Suriin ang Kasalukuyang Quota:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Humiling ng Pagsasaayos ng Quota:**
Gamitin ang workflow ng pamamahala ng quota ng portal ng Foundry para sa apektadong subscription, rehiyon, modelo, at uri ng deployment. Tingnan ang [opisyal na patnubay sa quota](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Ang hiling para sa VM quota ay hindi nagpapataas ng quota ng modelo.

3. **I-optimize ang Kapasidad ng Modelo:**
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

### Isyu: Hindi Wasto ang Bersyon ng API

**Sintomas:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Mga Solusyon:**

1. **Gumamit ng Sinusuportahang Bersyon ng API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Suriin ang Kompatibilidad ng Bersyon ng API:**
Suriin ang [sanggunian sa lifecycle ng Azure OpenAI API](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Ang mga bersyon ng API ng ARM resource-provider ay **hindi** naglilista ng mga bersyon ng inference/data-plane API. Ang mga bagong kliyenteng v1 ay gumagamit ng `/openai/v1/` nang walang naka-detalye na `api-version`; huwag paghaluin ang dalawang konfigurasyon ng kliyente.

## Mga Problema sa Azure AI Search

### Isyu: Hindi Sapat ang Pricing Tier ng Search Service

**Sintomas:**
```
Error: Semantic search requires Basic tier or higher
```

**Mga Solusyon:**

1. **Gumamit ng Sinusuportahang Pricing Tier:**

Nangangailangan ang Semantic ranker ng Basic o mas mataas pa. Ang paglipat mula Free/Basic patungo sa ibang tier ay maaaring mangailangan na gumawa ng bagong search service at muling buuin ang mga index; ang pag-edit ng SKU ay hindi garantisadong in-place upgrade.
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

2. **Patayin ang Semantic Search (Para sa Pag-develop):**
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

### Isyu: Pagkabigo sa Paglikha ng Index

**Sintomas:**
```
Error: Cannot create index, insufficient permissions
```

**Mga Solusyon:**

1. **Tiyakin ang Mga Key ng Search Service:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Suriin ang Index Schema:**
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

3. **Gumamit ng Managed Identity:**
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

## Mga Isyu sa Pag-deploy ng Container Apps

### Isyu: Pagkabigo sa Pagbuo ng Container

**Sintomas:**
```
Error: Failed to build container image
```

**Mga Solusyon:**

1. **Suriin ang Syntax ng Dockerfile:**
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

2. **I-validate ang Mga Dependency:**
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

3. **Magdagdag ng Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Isyu: Pagkabigo sa Pagsisimula ng Container App

**Sintomas:**
```
Error: Container failed to start within timeout period
```

**Mga Solusyon:**

1. **Palawigin ang Startup Timeout:**
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

2. **I-optimize ang Pag-load ng Modelo:**
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

## Mga Error sa Pagpapatotoo at Pahintulot

### Isyu: Managed Identity Permission Denied

**Sintomas:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Mga Solusyon:**

1. **Suriin ang Mga Assignment ng Papel:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Italaga ang Mga Kinakailangang Papel:**
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

3. **Subukan ang Pagpapatotoo:**
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

Pinapatunayang pagpapatotoo ang pagkuha ng token, hindi ang pahintulot na patakbuhin ang isang modelo. Subukan ang nilalayong operasyon nang hiwalay. Sa lokal, maaaring gamitin ng `DefaultAzureCredential` ang mga kredensyal ng developer; sa Azure, tiyaking ang nilalayong managed identity ang napili.

### Isyu: Access Denied sa Key Vault

**Sintomas:**
```
Error: The user, group or application does not have secrets get permission
```

**Mga Solusyon:**

1. **Bigyan ng Pahintulot ang Key Vault:**

Gamitin ang sumusunod na fragment ng access-policy para lamang sa vault na may `enableRbacAuthorization: false`. Para sa vault na may RBAC na pinagana, gamitin ang opsyon 2; ang pagdaragdag ng access policy ay hindi nagbibigay ng data-plane access sa RBAC mode.
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

2. **Gumamit ng RBAC Imbes na Access Policies:**

Ang vault ay dapat magkaroon ng `enableRbacAuthorization: true`; ang pagpapalit ng mga modelo ng pahintulot ay nangangailangan ng planadong pag-migrate ng umiiral na access.
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

## Pagkabigo sa Pag-deploy ng Modelo

### Isyu: Hindi Magagamit ang Bersyon ng Modelo

**Sintomas:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Mga Solusyon:**

1. **Suriin ang Mga Available na Modelo:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Pumili ng Isang Available na Modelo nang Eksakto:**
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

3. **Suriin ang Modelo Bago ang Deployment:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Mga Isyu sa Pagganap at Pag-scale

### Isyu: Mataas na Latency ng mga Tugon

**Sintomas:**
- Mga oras ng tugon > 30 segundo
- Mga error sa timeout
- Mahinang karanasan para sa gumagamit

**Mga Solusyon:**

1. **Ipatupad ang Request Timeouts:**
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

2. **Magdagdag ng Response Caching:**
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

3. **I-configure ang Auto-scaling:**
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

### Isyu: Mga Error sa Out of Memory

**Sintomas:**
```
Error: Container killed due to memory limit exceeded
```

**Mga Solusyon:**

1. **Dagdagan ang Alokasyon ng Memorya:**
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

2. **I-optimize ang Paggamit ng Memorya:**
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

## Pamamahala ng Gastos at Quota

### Isyu: Hindi Inaasahang Mataas na Gastos

**Sintomas:**
- Mas mataas ang bill sa Azure kaysa inaasahan
- Paggamit ng token na lumalampas sa tantya
- Na-trigger na mga alerto sa budget

**Mga Solusyon:**

1. **Ipatupad ang Mga Kontrol sa Gastos:**
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

Ang in-memory counter na ito ay ilustratibo lamang, hindi kontrol ng buwanang paggastos: nagre-reset ito sa restart, hindi ito shared sa mga replica, at sinusuri ang paggamit lamang pagkatapos ng tawag. Ang totoong limitasyon ay nangangailangan ng matibay na accounting, concurrency-safe na reservations bago ang mga request, at patakaran ng buwanang reset. Ang mga metric ng memorya ng container ay dapat ding isaalang-alang ang mga limitasyon ng cgroup; ang `psutil.virtual_memory()` ay hindi maaasahang sukat ng limitasyon ng container, at ang garbage collection ay hindi nagpapatupad ng memory cap.

2. **Mag-set up ng Mga Alerto sa Gastos:**
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

Ideklara ang `budgetStartDate` at `budgetEndDate` sa iyong template. Ang mga budget ay nagtutukoy ng paalala; hindi nito pinapatigil ang mga resource o nagpapataw ng hard cap sa paggastos.

3. **I-optimize ang Pagpili ng Modelo:**
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

## Mga Kasangkapan at Teknik sa Pag-debug

### Mga Utos sa Pag-debug ng AZD

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

### Mga Utos ng AZD AI Extension para sa Diagnostiko

Kung nag-deploy ka ng mga ahente gamit ang `azd ai agent init`, ang mga karagdagang kasangkapang ito ay magagamit:

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

> **Tip:** Gamitin ang `azd infra generate` upang isulat ang IaC sa disk para masuri mo nang eksakto kung anong mga resource ang na-provision. Napakahalaga nito sa pag-debug ng mga isyu sa konfigurasyon ng resource. Tingnan ang [sanggunian ng AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) para sa buong detalye.

**Release-aware diagnostics (2026-11-04):** Ang mga ahente `1.0.0-beta.23` ay nangangailangan ng `azd >= 1.37.0`; i-upgrade ang core CLI bago ang mga hindi compatible na extension. Itinatago ng release ng ahenteng ito ang mga warning ng developer RBAC sa huling output ng deployment at tinutukoy ang bersyon na sangkot sa mga pagkabigo sa activation/timeouts. Ang timeout ay hindi nagpapatunay na nabigo ang deployment: suriin ang sinusubukang bersyon bago subukang muli. Nag-aayos din ito ng A2A 0.3 na invocations na nagpapakita ng mga lifecycle message sa halip na mga kumpletong sagot. Ang core na `azd 1.37.1` ay nag-aayos ng cancellation propagation sa mga extension; pinapabuti ng `1.37.2` ang mahahalagang kumpirmasyon ng provisioning at ang pamamahala ng pagkakansela.

Kung ang utos sa pagsusuri ng mas lumang tutorial ay nagpi-print lamang ng gabay sa paglipat, i-install ang `azure.ai.evaluations` (`1.0.0-beta.2` ay nangangailangan ng `azd >= 1.33.0`) at gamitin ang `azd ai eval init`, `generate`, at `run start`. Hindi na tinatanggap ng `--config` ng Optimization ang mga lumang evaluation file. Tingnan ang [evaluation migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) at [optimization migration](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Pag-debug ng Aplikasyon

1. **Nakabalangkas na Pag-log:**
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

2. **Mga Endpoint para sa Health Check:**
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

3. **Pagmo-monitor ng Performance:**
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

## Mga Karaniwang Error Code at Solusyon

| Error Code | Paglalarawan | Solusyon |
|------------|-------------|----------|
| 401 | Hindi Awtorisado | Suriin ang mga API key at konfigurasyon ng managed identity |
| 403 | Ipinagbabawal | Tiyakin ang mga RBAC role assignment |
| 429 | Na-rate Limit | Magpatupad ng retry logic na may exponential backoff |
| 500 | Internal Server Error | Suriin ang kalagayan ng deployment ng modelo at mga log |
| 503 | Hindi Available ang Serbisyo | Tiyakin ang kalusugan ng serbisyo at availability sa rehiyon |

## Mga Susunod na Hakbang

1. **Suriin ang [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** para sa pinakamahusay na kasanayan sa deployment
2. **Kumpletuhin ang [Production AI Practices](../chapter-08-production/production-ai-practices.md)** para sa mga solusyong handa para sa enterprise
3. **Sumali sa [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** para sa suporta ng komunidad
4. **Mag-submit ng mga isyu** sa [AZD GitHub repository](https://github.com/Azure/azure-dev) para sa mga partikular na problema ng AZD

## Mga Mapagkukunan

- [Pag-troubleshoot sa Azure OpenAI quota at throttling](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Pag-troubleshoot sa Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Pag-troubleshoot sa Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Mag-install ng mga kasanayan sa pag-troubleshoot ng Azure sa iyong editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Pag-navigate ng Kabanata:**
- **📚 Tahanan ng Kurso**: [AZD Para sa Mga Baguhan](../../README.md)
- **📖 Kasalukuyang Kabanata**: Kabanata 7 - Troubleshooting at Pag-debug
- **⬅️ Nakaraan**: [Gabayan sa Pag-debug](debugging.md)
- **➡️ Susunod na Kabanata**: [Kabanata 8: Mga Pattern para sa Produksyon at Enterprise](../chapter-08-production/production-ai-practices.md)
- **🤖 Nauugnay**: [Kabanata 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Sanggunian**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->