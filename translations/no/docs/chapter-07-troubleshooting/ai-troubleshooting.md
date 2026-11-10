# Feilsøkingsveiledning spesifikk for AI

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 7 - Feilsøking & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Neste kapittel**: [Kapittel 8: Produksjons- & Enterprise-mønstre](../chapter-08-production/production-ai-practices.md)
- **🤖 Relatert**: [Kapittel 2: AI-først utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

Denne omfattende feilsøkingsveiledningen tar for seg vanlige problemer ved distribusjon av AI-løsninger med AZD, og tilbyr løsninger og debuggingsteknikker spesifikke for Azure AI-tjenester.

> **Omfang:** Kommandoer bruker eksempler på ressursnavn; bytt dem ut og velg riktig abonnement. Bicep-blokker er fragmenter som skal flettes inn i en eksisterende mal, ikke frittstående distribusjoner. Python-snippt koder krever de angitte SDK-ene og applikasjonskonfigurasjonen. Ingen live Azure-distribusjon ble utført for denne gjennomgangen.

## Innholdsfortegnelse

- [Problemer med Microsoft Foundry Models-tjenesten](#microsoft-foundry-models-service-issues)
- [Problemer med Azure AI Search](#azure-ai-search-problems)
- [Distribusjonsproblemer med Container Apps](#container-apps-deployment-issues)
- [Autentisering og tillatelsesfeil](#authentication-and-permission-errors)
- [Modell-distribusjonsfeil](#model-deployment-failures)
- [Ytelses- og skaleringsproblemer](#performance-and-scaling-issues)
- [Kostnads- og kvotastyring](#cost-and-quota-management)
- [Feilsøkingsverktøy og teknikker](#debugging-tools-and-techniques)

## Problemer med Microsoft Foundry Models-tjenesten

### Problem: OpenAI-tjeneste utilgjengelig i region

**Symptomer:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Årsaker:**
- Microsoft Foundry Models er ikke tilgjengelig i valgt region
- Kvote oppbrukt i foretrukne regioner
- Regionale kapasitetsbegrensninger

**Løsninger:**

1. **Sjekk regions tilgjengelighet:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Oppdater AZD-konfigurasjonen:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Bruk alternative regioner:**
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

### Problem: Modell-distribusjonskvote overskredet

**Symptomer:**
```
Error: Deployment failed due to insufficient quota
```

**Løsninger:**

1. **Sjekk gjeldende kvote:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Be om kvoteøkning:**
Bruk Foundry-portalens kvotestyringsarbeidsflyt for det berørte abonnementet, regionen, modellen og distribusjonstypen. Se den [offisielle kvoterveiledningen](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). En VM-kvoteforespørsel øker ikke modellkvoten.

3. **Optimaliser modellkapasitet:**
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

### Problem: Ugyldig API-versjon

**Symptomer:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Løsninger:**

1. **Bruk støttet API-versjon:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Sjekk API-versjonskompatibilitet:**
Sjekk [referansen for Azure OpenAI API livssyklus](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM resource-provider API-versjoner viser **ikke** inferens-/dataplan-API-versjoner. Nye v1-klienter bruker `/openai/v1/` uten en datert `api-version`; ikke bland de to klientkonfigurasjonene.

## Problemer med Azure AI Search

### Problem: Utilstrekkelig prisnivå for søketjeneste

**Symptomer:**
```
Error: Semantic search requires Basic tier or higher
```

**Løsninger:**

1. **Bruk et støttet prisnivå:**

Semantisk rangering krever Basic eller høyere. Å gå fra Free/Basic til et annet nivå kan kreve at du oppretter en ny søketjeneste og bygger indeksene på nytt; endring av SKU er ikke en garantert oppgradering på stedet.
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

2. **Deaktiver semantisk søk (utvikling):**
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

### Problem: Feil ved oppretting av indekser

**Symptomer:**
```
Error: Cannot create index, insufficient permissions
```

**Løsninger:**

1. **Verifiser søketjenestens nøkler:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Sjekk indeks-skjema:**
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

3. **Bruk administrert identitet:**
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

## Problemer med distribusjon av Container Apps

### Problem: Feil ved bygging av container

**Symptomer:**
```
Error: Failed to build container image
```

**Løsninger:**

1. **Sjekk Dockerfile-syntaks:**
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

2. **Valider avhengigheter:**
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

3. **Legg til helsesjekk:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Feil ved oppstart av container app

**Symptomer:**
```
Error: Container failed to start within timeout period
```

**Løsninger:**

1. **Øk oppstartstid:**
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

2. **Optimaliser modelllasting:**
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

## Autentisering og tillatelsesfeil

### Problem: Tillatelse nektet for administrert identitet

**Symptomer:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Løsninger:**

1. **Verifiser rolleoppgaver:**
```bash
# Check current role assignments
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

3. **Test autentisering:**
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

Tokenoppnåelse beviser autentisering, ikke tillatelse til å kalle en modell. Test den tiltenkte operasjonen separat. Lokalt kan `DefaultAzureCredential` bruke utviklerlegitimasjon; i Azure, verifiser at riktig administrert identitet er valgt.

### Problem: Nektet tilgang til Key Vault

**Symptomer:**
```
Error: The user, group or application does not have secrets get permission
```

**Løsninger:**

1. **Gi Key Vault-tillatelser:**

Bruk følgende access-policy-fragment kun for en hvelv med `enableRbacAuthorization: false`. For en RBAC-aktivert hvelv, bruk alternativ 2; det å legge til en tilgangspolicy gir ikke data-plan tilgang i RBAC-modus.
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

2. **Bruk RBAC i stedet for tilgangspolicyer:**

Hvelvet må ha `enableRbacAuthorization: true`; endring av tillatelsesmodeller krever planlagt migrasjon av eksisterende tilgang.
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

## Modell-distribusjonsfeil

### Problem: Modellversjon ikke tilgjengelig

**Symptomer:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Løsninger:**

1. **Sjekk tilgjengelige modeller:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Velg en tilgjengelig modell eksplisitt:**
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

3. **Valider modellen før distribusjon:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Ytelses- og skaleringsproblemer

### Problem: Høy ventetid på svar

**Symptomer:**
- Responstid > 30 sekunder
- Timeout-feil
- Dårlig brukeropplevelse

**Løsninger:**

1. **Implementer tidsavbrudd for forespørsler:**
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

2. **Legg til responslagring:**
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

3. **Konfigurer auto-skalerin:**
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

### Problem: Minnemangelfeil

**Symptomer:**
```
Error: Container killed due to memory limit exceeded
```

**Løsninger:**

1. **Øk minnetildeling:**
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

2. **Optimaliser minnebruk:**
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

## Kostnads- og kvotastyring

### Problem: Uventet høye kostnader

**Symptomer:**
- Azure-regning høyere enn forventet
- Tokenbruk overskrider estimater
- Budsjettvarsler utløst

**Løsninger:**

1. **Implementer kostnadskontroller:**
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

Denne telleren i minnet er illustrativ, ikke en månedlig utgiftskontroll: Den nullstilles ved omstart, deles ikke mellom replikaer, og sjekker bruk kun etter et kall. En reell grense krever varig bokføring, samtidighets-sikre reservasjoner før forespørsler og en policy for månedlig nullstilling. Container minnemetrikker må også ta hensyn til cgroup-begrensninger; `psutil.virtual_memory()` er ikke en pålitelig måling av containerbegrensning, og garbage collection håndhever ikke et minne-tak.

2. **Sett opp kostnadsvarsler:**
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

Deklarer `budgetStartDate` og `budgetEndDate` i malen din. Budsjetter gir varsler; de stopper ikke ressurser eller pålegger en hard utgiftsgrense.

3. **Optimaliser modellvalg:**
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

## Feilsøkingsverktøy og teknikker

### AZD feilsøkingskommandoer

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

### AZD AI Extension-kommandoer for diagnostikk

Hvis du distribuerte agenter med `azd ai agent init`, er disse tilleggverktøyene tilgjengelige:

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

> **Tips:** Bruk `azd infra generate` for å skrive IaC til disk slik at du kan inspisere nøyaktig hvilke ressurser som ble opprettet. Dette er uvurderlig ved feilsøking av ressurskonfigurasjonsproblemer. Se [AZD AI CLI referanse](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) for fullstendige detaljer.

**Utgivelsesbevisst diagnostikk (2026-11-04):** Agenter `1.0.0-beta.23` krever `azd >= 1.37.0`; oppgrader kjernen i CLI før inkompatible utvidelser. Denne agentutgivelsen beholder utvikler-RBAC-varsler i sluttutdata fra distribusjonen og identifiserer versjonen involvert i aktiveringsfeil/tidsavbrudd. Et tidsavbrudd fastslår ikke at distribusjonen feilet: inspiser forsøkt versjon før ny forsøk. Den fikser også A2A 0.3-kall som viser livssyklusmeldinger i stedet for fullførte svar. Kjernen `azd 1.37.1` fikser kanselleringsprogresjon på tvers av utvidelser; `1.37.2` forbedrer kritiske bekreftelser ved tildeling og håndtering av kansellering.

Hvis en eldre opplæringskommandos evalueringskommando kun skriver ut migrasjonsveiledning, installer `azure.ai.evaluations` (`1.0.0-beta.2` krever `azd >= 1.33.0`) og bruk `azd ai eval init`, `generate` og `run start`. Optimaliseringens `--config` godtar ikke lenger gamle evalueringsfiler. Se [evalueringsmigrasjon](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) og [optimaliseringsmigrasjon](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Applikasjonsfeilsøking

1. **Strukturert logging:**
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

2. **Helsetest endepunkter:**
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

3. **Ytelsesovervåking:**
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

## Vanlige feilkoder og løsninger

| Feilkode | Beskrivelse | Løsning |
|------------|-------------|----------|
| 401 | Uautorisert | Sjekk API-nøkler og konfigurering av administrert identitet |
| 403 | Forbudt | Verifiser RBAC-rolleoppgaver |
| 429 | Ratebegrenset | Implementer retry-logikk med eksponentiell backoff |
| 500 | Intern serverfeil | Sjekk status for modell-distribusjon og logger |
| 503 | Tjeneste utilgjengelig | Verifiser tjenestens helsetilstand og regional tilgjengelighet |

## Neste steg

1. **Se gjennom [AI-modell distribusjonsveiledning](../chapter-02-ai-development/ai-model-deployment.md)** for beste praksis ved distribusjon
2. **Fullfør [Produksjons AI-praksiser](../chapter-08-production/production-ai-practices.md)** for virksomhetsklare løsninger
3. **Bli med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** for samfunnsstøtte
4. **Rapporter problemer** til [AZD GitHub-repositoriet](https://github.com/Azure/azure-dev) for AZD-spesifikke problemer

## Ressurser

- [Feilsøking av Azure OpenAI kvote og hastighetsbegrensning](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Feilsøking for Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Feilsøking for Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installer Azure feilsøkingsferdigheter i din editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 7 - Feilsøking & Debugging
- **⬅️ Forrige**: [Debugging Guide](debugging.md)
- **➡️ Neste kapittel**: [Kapittel 8: Produksjons- & Enterprise-mønstre](../chapter-08-production/production-ai-practices.md)
- **🤖 Relatert**: [Kapittel 2: AI-først utvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referanse**: [Azure Developer CLI Feilsøking](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->