# AI-specifieke Probleemoplossingsgids

**Hoofdstuk Navigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 7 - Probleemoplossing & Debugging
- **⬅️ Vorige**: [Debugging Gids](debugging.md)
- **➡️ Volgend Hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprisepatronen](../chapter-08-production/production-ai-practices.md)
- **🤖 Gerelateerd**: [Hoofdstuk 2: AI-Eerst Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

Deze uitgebreide probleemoplossingsgids behandelt veelvoorkomende problemen bij het implementeren van AI-oplossingen met AZD en biedt oplossingen en debuggingtechnieken specifiek voor Azure AI-diensten.

> **Reikwijdte:** Commando's gebruiken voorbeeld resource-namen; vervang deze en selecteer de juiste abonnement. Bicep-blokken zijn fragmenten om in een bestaande template te integreren, geen zelfstandige implementaties. Python-fragmenten vereisen de vermelde SDK's en applicatieconfiguratie. Er is geen live Azure-implementatie uitgevoerd voor deze review.

## Inhoudsopgave

- [Microsoft Foundry Models Serviceproblemen](#microsoft-foundry-models-service-issues)
- [Azure AI Search Problemen](#azure-ai-search-problems)
- [Container Apps Implementatieproblemen](#container-apps-deployment-issues)
- [Authenticatie- en Machtigingsfouten](#authentication-and-permission-errors)
- [Modelimplementatiefouten](#model-deployment-failures)
- [Prestaties en Schaalproblemen](#performance-and-scaling-issues)
- [Kosten- en Quotabeheer](#cost-and-quota-management)
- [Debugging Tools en Technieken](#debugging-tools-and-techniques)

## Microsoft Foundry Models Serviceproblemen

### Probleem: OpenAI Service Niet Beschikbaar in Regio

**Symptomen:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Oorzaken:**
- Microsoft Foundry Models niet beschikbaar in geselecteerde regio
- Quota uitgeput in de voorkeursregio's
- Capaciteitsbeperkingen per regio

**Oplossingen:**

1. **Controleer Regio-beschikbaarheid:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Werk AZD-configuratie bij:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Gebruik Alternatieve Regio's:**
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

### Probleem: Modelimplementatie Quota Overschreden

**Symptomen:**
```
Error: Deployment failed due to insufficient quota
```

**Oplossingen:**

1. **Controleer Huidige Quota:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Vraag Quota-verhoging aan:**
Gebruik de quota-beheerstroom van de Foundry-portal voor het betreffende abonnement, regio, model en implementatietype. Zie de [officiële quotarichtlijnen](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Een VM-quota-aanvraag verhoogt niet de modelquota.

3. **Optimaliseer Modelcapaciteit:**
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

### Probleem: Ongeldige API-versie

**Symptomen:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Oplossingen:**

1. **Gebruik Ondersteunde API-versie:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Controleer API-versiecompatibiliteit:**
Controleer de [Azure OpenAI API lifecycle referentie](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM resource-provider API-versies vermelden **niet** de inferentie/data-plane API-versies. Nieuwe v1-clients gebruiken `/openai/v1/` zonder een gedateerde `api-version`; meng deze twee clientconfiguraties niet.

## Azure AI Search Problemen

### Probleem: Onvoldoende Pricing Tier voor Search Service

**Symptomen:**
```
Error: Semantic search requires Basic tier or higher
```

**Oplossingen:**

1. **Gebruik een Ondersteunde Pricing Tier:**

Semantic ranker vereist Basic of hoger. Overschakelen van Free/Basic naar een andere tier kan vereisen dat je een nieuwe zoekservice maakt en indexen opnieuw opbouwt; het bewerken van een SKU is geen gegarandeerde upgrade op locatie.
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

2. **Schakel Semantisch Zoeken uit (Ontwikkeling):**
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

### Probleem: Mislukkingen bij het Maken van Indexen

**Symptomen:**
```
Error: Cannot create index, insufficient permissions
```

**Oplossingen:**

1. **Verifieer Search Service Sleutels:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Controleer Index Schema:**
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

3. **Gebruik Managed Identity:**
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

## Container Apps Implementatieproblemen

### Probleem: Container Build Fouten

**Symptomen:**
```
Error: Failed to build container image
```

**Oplossingen:**

1. **Controleer Dockerfile-syntaxis:**
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

2. **Valideer Afhankelijkheden:**
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

3. **Voeg Gezondheidscontrole toe:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Probleem: Fouten bij het Opstarten van Container Apps

**Symptomen:**
```
Error: Container failed to start within timeout period
```

**Oplossingen:**

1. **Verhoog Opstart-timeout:**
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

2. **Optimaliseer Modelladen:**
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

## Authenticatie- en Machtigingsfouten

### Probleem: Managed Identity Machtiging Geweigerd

**Symptomen:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Oplossingen:**

1. **Verifieer Roltoewijzingen:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Wijs Vereiste Rollen Toe:**
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

3. **Test Authenticatie:**
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

Tokenverwerving bewijst authenticatie, niet toestemming om een model aan te roepen. Test de bedoelde operatie afzonderlijk. Lokaal kan `DefaultAzureCredential` ontwikkelaarsreferenties gebruiken; controleer in Azure of de bedoelde managed identity is geselecteerd.

### Probleem: Key Vault Toegang Geweigerd

**Symptomen:**
```
Error: The user, group or application does not have secrets get permission
```

**Oplossingen:**

1. **Verleen Key Vault-machtigingen:**

Gebruik het volgende access-policy-fragment alleen voor een vault met `enableRbacAuthorization: false`. Voor een RBAC-ingeschakelde vault, gebruik optie 2; het toevoegen van een toegangsbeleid verleent geen data-plane toegang in RBAC-modus.
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

2. **Gebruik RBAC in Plaats van Toegangsbeleidsregels:**

De vault moet `enableRbacAuthorization: true` hebben; het wijzigen van machtigingsmodellen vereist een geplande migratie van bestaande toegang.
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

## Modelimplementatiefouten

### Probleem: Modelversie Niet Beschikbaar

**Symptomen:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Oplossingen:**

1. **Controleer Beschikbare Modellen:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Selecteer Expliciet een Beschikbaar Model:**
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

3. **Valideer Model Voor Implementatie:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Prestaties en Schaalproblemen

### Probleem: Hoge Latentie Reacties

**Symptomen:**
- Reactietijden > 30 seconden
- Timeout fouten
- Slechte gebruikerservaring

**Oplossingen:**

1. **Implementeer Request Timeouts:**
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

2. **Voeg Response Caching Toe:**
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

3. **Configureer Auto-scaling:**
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

### Probleem: Out-of-Memory Errors

**Symptomen:**
```
Error: Container killed due to memory limit exceeded
```

**Oplossingen:**

1. **Verhoog Geheugenallocatie:**
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

2. **Optimaliseer Geheugengebruik:**
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

## Kosten- en Quotabeheer

### Probleem: Onverwacht Hoge Kosten

**Symptomen:**
- Azure-factuur hoger dan verwacht
- Tokengebruik dat de schattingen overschrijdt
- Budgetwaarschuwingen geactiveerd

**Oplossingen:**

1. **Implementeer Kostenbeheersing:**
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

Deze in-memory teller is illustratief, geen maandelijkse uitgavencontrole: hij reset bij herstart, wordt niet gedeeld tussen replicas, en controleert gebruik pas na een oproep. Een echte limiet vereist duurzame verantwoording, concurrerende reserveringen vóór verzoeken, en een maandelijks resetbeleid. Container-metrics moeten ook rekening houden met cgroup-limieten; `psutil.virtual_memory()` is geen betrouwbare containerlimietmeting en garbage collection dwingt geen geheugenlimiet af.

2. **Stel Kostenwaarschuwingen in:**
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

Declareer `budgetStartDate` en `budgetEndDate` in je template. Budgetten waarschuwen; ze stoppen bronnen niet of stellen geen harde uitgavenlimiet in.

3. **Optimaliseer Modelselectie:**
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

## Debugging Tools en Technieken

### AZD Debugging Commando's

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

### AZD AI Extension Commando's voor Diagnostiek

Als je agents hebt ingezet met `azd ai agent init`, zijn deze extra tools beschikbaar:

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

> **Tip:** Gebruik `azd infra generate` om IaC naar schijf te schrijven zodat je precies kunt bekijken welke resources zijn ingericht. Dit is onmisbaar bij het debuggen van resourceconfiguratieproblemen. Zie de [AZD AI CLI referentie](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor volledige details.

**Release-aware diagnostiek (2026-11-04):** Agents `1.0.0-beta.23` vereist `azd >= 1.37.0`; upgrade de core CLI vóór incompatibele extensies. Deze agent-release behoudt ontwikkelaar RBAC-waarschuwingen in de uiteindelijke implementatie-output en identificeert de versie die betrokken is bij activatiefouten/time-outs. Een time-out betekent niet dat de implementatie is mislukt: bekijk de pogingde versie vóór herhaling. Het repareert ook A2A 0.3-aanroepen die lifecycle-berichten tonen in plaats van voltooide antwoorden. Core `azd 1.37.1` verbetert afbrekingspropagatie over extensies; `1.37.2` verbetert kritieke provisioneringsbevestigingen en afbrekingsafhandeling.

Als een ouder tutorial-evaluatiecommando alleen migratierichtlijnen print, installeer `azure.ai.evaluations` (`1.0.0-beta.2` vereist `azd >= 1.33.0`) en gebruik `azd ai eval init`, `generate` en `run start`. Optimalisatie's `--config` accepteert geen legacy evaluatiebestanden meer. Zie [evaluatiemigratie](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) en [optimalisatiemigratie](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Applicatie Debugging

1. **Gestructureerde Logging:**
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

2. **Health Check Endpoints:**
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

3. **Performance Monitoring:**
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

## Veelvoorkomende Foutcodes en Oplossingen

| Foutcode | Beschrijving | Oplossing |
|------------|-------------|----------|
| 401 | Niet Geautoriseerd | Controleer API-sleutels en managed identity-configuratie |
| 403 | Verboden | Verifieer RBAC roltoewijzingen |
| 429 | Rate Limiet | Implementeer retry-logica met exponentiële backoff |
| 500 | Interne Serverfout | Controleer modelimplementatiestatus en logs |
| 503 | Service Niet Beschikbaar | Verifieer servicegezondheid en regionale beschikbaarheid |

## Volgende Stappen

1. **Bekijk de [AI Modelimplementatie Gids](../chapter-02-ai-development/ai-model-deployment.md)** voor implementatiebest practices
2. **Voltooi [Productie AI Praktijken](../chapter-08-production/production-ai-practices.md)** voor bedrijfsrijpe oplossingen
3. **Word lid van de [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** voor gemeenschapssteun
4. **Meld problemen** bij de [AZD GitHub-repository](https://github.com/Azure/azure-dev) voor AZD-specifieke problemen

## Bronnen

- [Azure OpenAI quota en throttling probleemoplossing](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps Probleemoplossing](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Probleemoplossing](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installeer Azure probleemoplossingsskills in je editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 7 - Probleemoplossing & Debugging
- **⬅️ Vorige**: [Debugging Gids](debugging.md)
- **➡️ Volgend Hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprisepatronen](../chapter-08-production/production-ai-practices.md)
- **🤖 Gerelateerd**: [Hoofdstuk 2: AI-Eerst Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referentie**: [Azure Developer CLI Probleemoplossing](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->