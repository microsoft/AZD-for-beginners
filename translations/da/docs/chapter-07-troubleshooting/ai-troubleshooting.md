# AI-specifik fejlfindingsguide

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Næste kapitel**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relateret**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

Denne omfattende fejlfindingguide adresserer almindelige problemer ved udrulning af AI-løsninger med AZD og giver løsninger og debugging-teknikker specifikt til Azure AI-tjenester.

## Indholdsfortegnelse

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#problemer-med-azure-ai-search)
- [Container Apps Deployment Issues](#container-apps-udrulningsproblemer)
- [Authentication and Permission Errors](#godkendelses-og-tilladelsesfejl)
- [Model Deployment Failures](#modeludrulningsfejl)
- [Performance and Scaling Issues](#ydeevne-og-skalaproblemer)
- [Cost and Quota Management](#omkostnings-og-kvotestyring)
- [Debugging Tools and Techniques](#fejlsøgningsværktøjer-og-teknikker)

## Problemer med Microsoft Foundry Models-tjenesten

### Problem: OpenAI-tjeneste utilgængelig i regionen

**Symptomer:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Årsager:**
- Microsoft Foundry Models ikke tilgængelig i den valgte region
- Kvoter udtømte i foretrukne regioner
- Regionale kapacitetsbegrænsninger

**Løsninger:**

1. **Tjek regions tilgængelighed:**
```bash
# Vis tilgængelige regioner for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Opdater AZD-konfigurationen:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Brug alternative regioner:**
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

### Problem: Kvoten for modeludrulning overskredet

**Symptomer:**
```
Error: Deployment failed due to insufficient quota
```

**Løsninger:**

1. **Kontroller nuværende kvote:**
```bash
# Kontroller kvoteforbruget
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Anmod om kvoteforhøjelse:**
```bash
# Send anmodning om øget kvote
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimer modelkapacitet:**
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

### Problem: Ugyldig API-version

**Symptomer:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Løsninger:**

1. **Brug en understøttet API-version:**
```python
# Brug den nyeste understøttede version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Kontroller API-versionens kompatibilitet:**
```bash
# Liste over understøttede API-versioner
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problemer med Azure AI Search

### Problem: Søgetjenestens prisniveau utilstrækkeligt

**Symptomer:**
```
Error: Semantic search requires Basic tier or higher
```

**Løsninger:**

1. **Opgrader prisniveau:**
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

2. **Deaktiver semantisk søgning (udvikling):**
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

### Problem: Fejl ved oprettelse af indeks

**Symptomer:**
```
Error: Cannot create index, insufficient permissions
```

**Løsninger:**

1. **Bekræft søgetjenestens nøgler:**
```bash
# Hent administrationsnøgle til søgetjenesten
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Tjek indeksens skema:**
```python
# Valider indeks-skema
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

3. **Brug administreret identitet:**
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

## Container Apps-udrulningsproblemer

### Problem: Fejl ved containerbygning

**Symptomer:**
```
Error: Failed to build container image
```

**Løsninger:**

1. **Kontroller Dockerfile-syntaks:**
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

2. **Valider afhængigheder:**
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

3. **Tilføj helbredstjek:**
```python
# main.py - Tilføj endpoint til sundhedstjek
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Fejl ved opstart af Container App

**Symptomer:**
```
Error: Container failed to start within timeout period
```

**Løsninger:**

1. **Forøg opstartstimeout:**
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

2. **Optimer modelloading:**
```python
# Forsinket indlæsning af modeller for at reducere opstartstiden
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
        # Initialiser AI-klienten her
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Opstart
    app.state.model_manager = ModelManager()
    yield
    # Nedlukning
    pass

app = FastAPI(lifespan=lifespan)
```

## Godkendelses- og tilladelsesfejl

### Problem: Adgang nægtet for administreret identitet

**Symptomer:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Løsninger:**

1. **Bekræft rolletilknytninger:**
```bash
# Kontroller de aktuelle rollefordelinger
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Tildel nødvendige roller:**
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

3. **Test godkendelse:**
```python
# Test af administreret identitetsgodkendelse
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

### Problem: Adgang til Key Vault nægtet

**Symptomer:**
```
Error: The user, group or application does not have secrets get permission
```

**Løsninger:**

1. **Giv Key Vault-tilladelser:**
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

2. **Brug RBAC i stedet for adgangspolitikker:**
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

## Modeludrulningsfejl

### Problem: Modelversion ikke tilgængelig

**Symptomer:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Løsninger:**

1. **Kontroller tilgængelige modeller:**
```bash
# Vis tilgængelige modeller
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Brug modelfallbacks:**
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

3. **Valider model før udrulning:**
```python
# Modelvalidering før implementering
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

## Ydeevne- og skalaproblemer

### Problem: Høj latenstid i svar

**Symptomer:**
- Responstider > 30 sekunder
- Timeout-fejl
- Dårlig brugeroplevelse

**Løsninger:**

1. **Implementer anmodnings-timeouts:**
```python
# Konfigurer passende timeouts
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

2. **Tilføj caches til svar:**
```python
# Redis-cache til svar
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

3. **Konfigurer autoskalering:**
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

### Problem: Out-of-memory-fejl

**Symptomer:**
```
Error: Container killed due to memory limit exceeded
```

**Løsninger:**

1. **Forøg hukommelsesallokering:**
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

2. **Optimer hukommelsesforbrug:**
```python
# Hukommelseseffektiv modelhåndtering
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Kontroller hukommelsesforbruget før behandling
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Tving oprydning af hukommelsen
            
        result = await self._process_ai_request(request)
        
        # Ryd op efter behandling
        gc.collect()
        return result
```

## Omkostnings- og kvotestyring

### Problem: Uventet høje omkostninger

**Symptomer:**
- Azure-regning højere end forventet
- Tokenforbrug overstiger estimater
- Budgetalarmer udløst

**Løsninger:**

1. **Implementer omkostningskontroller:**
```python
# Overvågning af tokenforbrug
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

2. **Opsæt omkostningsalarmer:**
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

3. **Optimer valg af model:**
```python
# Omkostningsbevidst modelvalg
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

## Fejlsøgningsværktøjer og -teknikker

### AZD-fejlsøgningskommandoer

```bash
# Aktivér detaljeret logning
azd up --debug

# Kontrollér udrulningsstatus
azd show

# Vis applikationslogfiler (åbner overvågningsdashboard)
azd monitor --logs

# Vis live-metrikker
azd monitor --live

# Kontrollér miljøvariabler
azd env get-values
```

### AZD AI-udvidelseskommandoer til diagnostik

Hvis du udrullede agenter ved hjælp af `azd ai agent init`, er disse yderligere værktøjer tilgængelige:

```bash
# Sørg for, at agents-udvidelsen er installeret
azd extension install azure.ai.agents

# Geninitialiser eller opdater en agent ud fra et manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Brug MCP-serveren til at lade AI-værktøjer forespørge projektets tilstand
azd mcp start

# Generer infrastrukturfiler til gennemgang og revision
azd infra generate
```

> **Tip:** Brug `azd infra generate` til at skrive IaC til disk, så du kan inspicere præcis hvilke ressourcer der blev provisioneret. Dette er uvurderligt ved fejlfinding af ressourcekonfigurationsproblemer. Se [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fulde detaljer.

### Applikationsfejlsøgning

1. **Struktureret logning:**
```python
import logging
import json

# Konfigurer struktureret logning for AI-applikationer
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

2. **Sundhedstjek-endpoints:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Kontroller forbindelsen til OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Kontroller søgetjenesten
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

3. **Ydelsesovervågning:**
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

## Almindelige fejlkoder og løsninger

| Fejlkode | Beskrivelse | Løsning |
|------------|-------------|----------|
| 401 | Uautoriseret | Kontroller API-nøgler og konfiguration af administreret identitet |
| 403 | Adgang nægtet | Bekræft RBAC-rolle-tildelinger |
| 429 | Begrænset (rate-limited) | Implementer retry-logik med eksponentiel backoff |
| 500 | Intern serverfejl | Tjek modeludrulningsstatus og logs |
| 503 | Tjeneste utilgængelig | Kontroller tjenestens helbred og regional tilgængelighed |

## Næste skridt

1. **Gennemgå [AI-modeludrulningsvejledning](../chapter-02-ai-development/ai-model-deployment.md)** for bedste praksis ved udrulning
2. **Gennemfør [Produktions-AI-praksis](../chapter-08-production/production-ai-practices.md)** for enterprise-klarne løsninger
3. **Deltag i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for fællesskabsstøtte
4. **Indsend issues** til [AZD GitHub-arkivet](https://github.com/Azure/azure-dev) for AZD-specifikke problemer

## Ressourcer

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installer Azure-fejlfindingsevner i din editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Beginners](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 7 - Fejlfinding & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Næste kapitel**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Relateret**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Fejlfinding for Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets originalsprog bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->