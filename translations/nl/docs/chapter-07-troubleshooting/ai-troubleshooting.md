# AI-specifieke probleemoplossingsgids

**Hoofdstuknavigatie:**
- **📚 Cursusstart**: [AZD voor beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 7 - Foutopsporing & Debugging
- **⬅️ Vorige**: [Foutopsporingsgids](debugging.md)
- **➡️ Volgend hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprise-patronen](../chapter-08-production/production-ai-practices.md)
- **🤖 Gerelateerd**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

Deze uitgebreide probleemoplossingsgids behandelt veelvoorkomende problemen bij het uitrollen van AI-oplossingen met AZD en biedt oplossingen en foutopsporingsmethoden specifiek voor Azure AI-services.

## Inhoudsopgave

- [Microsoft Foundry Models Service-problemen](#azure-openai-service-issues)
- [Azure AI Search-problemen](#problemen-met-azure-ai-search)
- [Container Apps implementatieproblemen](#container-apps-implementatieproblemen)
- [Authenticatie- en machtigingsfouten](#authenticatie-en-machtigingsfouten)
- [Fouten bij modelimplementatie](#fouten-bij-modelimplementatie)
- [Prestatie- en schaalproblemen](#prestatie-en-schaalproblemen)
- [Kosten- en quotabeheer](#kosten-en-quotabeheer)
- [Foutopsporingshulpmiddelen en technieken](#foutopsporingshulpmiddelen-en-technieken)

## Problemen met Microsoft Foundry Models Service

### Probleem: OpenAI-service niet beschikbaar in regio

**Symptomen:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Oorzaken:**
- Microsoft Foundry Models niet beschikbaar in geselecteerde regio
- Quota uitgeput in voorkeursregio's
- Regionale capaciteitsbeperkingen

**Oplossingen:**

1. **Controleer regio-beschikbaarheid:**
```bash
# Lijst met beschikbare regio's voor OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Werk AZD-configuratie bij:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Gebruik alternatieve regio's:**
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

### Probleem: Modelimplementatiequota overschreden

**Symptomen:**
```
Error: Deployment failed due to insufficient quota
```

**Oplossingen:**

1. **Controleer huidige quota:**
```bash
# Controleer quotagebruik
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Vraag om verhoging van quota:**
```bash
# Dien verzoek tot verhoging van de quota in
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimaliseer modelcapaciteit:**
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

### Probleem: Ongeldige API-versie

**Symptomen:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Oplossingen:**

1. **Gebruik een ondersteunde API-versie:**
```python
# Gebruik de meest recente ondersteunde versie
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Controleer API-versiecompatibiliteit:**
```bash
# Lijst met ondersteunde API-versies
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problemen met Azure AI Search

### Probleem: Prijstier van zoekservice onvoldoende

**Symptomen:**
```
Error: Semantic search requires Basic tier or higher
```

**Oplossingen:**

1. **Verhoog het prijstarief:**
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

2. **Schakel semantisch zoeken uit (ontwikkeling):**
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

### Probleem: Indexcreatie mislukt

**Symptomen:**
```
Error: Cannot create index, insufficient permissions
```

**Oplossingen:**

1. **Controleer zoekservice-sleutels:**
```bash
# Haal de beheerderssleutel van de zoekservice op
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Controleer indexschema:**
```python
# Valideer indexschema
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

3. **Gebruik Managed Identity:**
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

## Container Apps implementatieproblemen

### Probleem: Container-build mislukt

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

2. **Valideer afhankelijkheden:**
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

3. **Voeg health check toe:**
```python
# main.py - Voeg een healthcheck-endpoint toe
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Probleem: Container App startfouten

**Symptomen:**
```
Error: Container failed to start within timeout period
```

**Oplossingen:**

1. **Verhoog de opstart-timeout:**
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

2. **Optimaliseer het laden van modellen:**
```python
# Laad modellen lui om de opstarttijd te verkorten
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
        # Initialiseer hier de AI-client
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Opstart
    app.state.model_manager = ModelManager()
    yield
    # Afsluiten
    pass

app = FastAPI(lifespan=lifespan)
```

## Authenticatie- en machtigingsfouten

### Probleem: Machtiging voor Managed Identity geweigerd

**Symptomen:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Oplossingen:**

1. **Controleer roltoewijzingen:**
```bash
# Controleer de huidige roltoewijzingen
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Wijs vereiste rollen toe:**
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

3. **Test authenticatie:**
```python
# Test authenticatie met beheerde identiteit
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

### Probleem: Toegang tot Key Vault geweigerd

**Symptomen:**
```
Error: The user, group or application does not have secrets get permission
```

**Oplossingen:**

1. **Verleen Key Vault-permissies:**
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

2. **Gebruik RBAC in plaats van toegangspolicies:**
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

## Fouten bij modelimplementatie

### Probleem: Modelversie niet beschikbaar

**Symptomen:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Oplossingen:**

1. **Controleer beschikbare modellen:**
```bash
# Lijst met beschikbare modellen
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Gebruik modelfallbacks:**
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

3. **Valideer model vóór implementatie:**
```python
# Modelvalidatie vóór uitrol
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

## Prestatie- en schaalproblemen

### Probleem: Hoge latentie van reacties

**Symptomen:**
- Responstijden > 30 seconden
- Time-outfouten
- Slechte gebruikerservaring

**Oplossingen:**

1. **Implementeer request-timeouts:**
```python
# Stel juiste time-outs in
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

2. **Voeg response-caching toe:**
```python
# Redis-cache voor antwoorden
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

3. **Configureer autoscaling:**
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

### Probleem: Out-of-memory-fouten

**Symptomen:**
```
Error: Container killed due to memory limit exceeded
```

**Oplossingen:**

1. **Verhoog geheugentoewijzing:**
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

2. **Optimaliseer geheugenverbruik:**
```python
# Geheugenefficiënte modelverwerking
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Controleer het geheugengebruik vóór verwerking
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forceer garbage collection
            
        result = await self._process_ai_request(request)
        
        # Opruimen na verwerking
        gc.collect()
        return result
```

## Kosten- en quotabeheer

### Probleem: Onverwacht hoge kosten

**Symptomen:**
- Azure-factuur hoger dan verwacht
- Tokengebruik overschrijdt schattingen
- Budgetwaarschuwingen geactiveerd

**Oplossingen:**

1. **Implementeer kostenbeheersing:**
```python
# Tokengebruik bijhouden
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

2. **Stel kostenwaarschuwingen in:**
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

3. **Optimaliseer modelkeuze:**
```python
# Kostenbewuste modelselectie
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # per 1K tokens
    'gpt-4.1': 0.03,          # per 1K tokens
    'gpt-35-turbo': 0.0015  # per 1K tokens
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

## Foutopsporingshulpmiddelen en technieken

### AZD-debugcommando's

```bash
# Schakel gedetailleerde logging in
azd up --debug

# Controleer de uitrolstatus
azd show

# Bekijk applicatielogs (opent het monitoringdashboard)
azd monitor --logs

# Bekijk live statistieken
azd monitor --live

# Controleer omgevingsvariabelen
azd env get-values
```

### AZD AI-extensiecommando's voor diagnostiek

Als je agents hebt ingezet met `azd ai agent init`, zijn de volgende aanvullende tools beschikbaar:

```bash
# Zorg ervoor dat de agents-extensie is geïnstalleerd
azd extension install azure.ai.agents

# Initialiseer een agent opnieuw of werk deze bij vanaf een manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Gebruik de MCP-server zodat AI-tools de projectstatus kunnen opvragen
azd mcp start

# Genereer infrastructuurbestanden voor beoordeling en audit
azd infra generate
```

> **Tip:** Gebruik `azd infra generate` om IaC naar schijf te schrijven zodat je precies kunt inspecteren welke resources zijn geprovisioneerd. Dit is van onschatbare waarde bij het debuggen van resourceconfiguratieproblemen. Zie de [AZD AI CLI-referentie](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) voor volledige details.

### Applicatie-debugging

1. **Gestructureerde logging:**
```python
import logging
import json

# Configureer gestructureerde logging voor AI-toepassingen
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

2. **Health check-endpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Controleer de OpenAI-verbinding
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Controleer de zoekservice
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

3. **Prestatiemonitoring:**
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

## Veelvoorkomende foutcodes en oplossingen

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Niet geautoriseerd | Controleer API-sleutels en de configuratie van Managed Identity |
| 403 | Verboden | Controleer RBAC-roltoewijzingen |
| 429 | Rate-limiet overschreden | Implementeer retry-logica met exponentiële backoff |
| 500 | Interne serverfout | Controleer status van modelimplementatie en logs |
| 503 | Service niet beschikbaar | Controleer servicegezondheid en regionale beschikbaarheid |

## Volgende stappen

1. **Bekijk [Gids voor AI-modelimplementatie](../chapter-02-ai-development/ai-model-deployment.md)** voor best practices bij implementatie
2. **Voltooi [Productie AI-praktijken](../chapter-08-production/production-ai-practices.md)** voor enterprise-klare oplossingen
3. **Sluit je aan bij de [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** voor communityondersteuning
4. **Dien issues in** bij de [AZD GitHub repository](https://github.com/Azure/azure-dev) voor AZD-specifieke problemen

## Bronnen

- [Probleemoplossing voor Microsoft Foundry Models Service](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps probleemoplossing](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Probleemoplossing voor Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installeer Azure-troubleshootingskills in je editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Hoofdstuknavigatie:**
- **📚 Cursusstart**: [AZD voor beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 7 - Foutopsporing & Debugging
- **⬅️ Vorige**: [Foutopsporingsgids](debugging.md)
- **➡️ Volgend hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprise-patronen](../chapter-08-production/production-ai-practices.md)
- **🤖 Gerelateerd**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referentie**: [Azure Developer CLI probleemoplossing](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal dient als gezaghebbende bron te worden beschouwd. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->