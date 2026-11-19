# Specjalny Podręcznik Rozwiązywania Problemów AI

**Nawigacja po Rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni**: [Przewodnik po debugowaniu](debugging.md)
- **➡️ Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../chapter-08-production/production-ai-practices.md)
- **🤖 Powiązane**: [Rozdział 2: Rozwój AI jako pierwszy](../chapter-02-ai-development/microsoft-foundry-integration.md)

Ten kompleksowy przewodnik rozwiązywania problemów porusza typowe zagadnienia podczas wdrażania rozwiązań AI z AZD, oferując rozwiązania i techniki debugowania specyficzne dla usług Azure AI.

> **Zakres:** Polecenia używają przykładowych nazw zasobów; zastąp je prawidłowymi i wybierz właściwą subskrypcję. Bloki Bicep są fragmentami do scalania z istniejącym szablonem, nie samodzielnymi wdrożeniami. Fragmenty Pythona wymagają podanych SDK i konfiguracji aplikacji. Nie wykonano rzeczywistego wdrożenia Azure w tej recenzji.

## Spis Treści

- [Problemy z usługą Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Problemy z Azure AI Search](#azure-ai-search-problems)
- [Problemy z wdrożeniem Container Apps](#container-apps-deployment-issues)
- [Błędy uwierzytelniania i uprawnień](#authentication-and-permission-errors)
- [Niepowodzenia wdrożenia modeli](#model-deployment-failures)
- [Problemy z wydajnością i skalowaniem](#performance-and-scaling-issues)
- [Zarządzanie kosztami i limitami](#cost-and-quota-management)
- [Narzędzia i techniki debugowania](#debugging-tools-and-techniques)

## Problemy z usługą Microsoft Foundry Models

### Problem: Usługa OpenAI niedostępna w regionie

**Objawy:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Przyczyny:**
- Usługi Microsoft Foundry Models niedostępne w wybranym regionie
- Limit (quota) wyczerpany w preferowanych regionach
- Ograniczenia regionalnej dostępności

**Rozwiązania:**

1. **Sprawdź dostępność regionu:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Zaktualizuj konfigurację AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Użyj alternatywnych regionów:**
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

### Problem: Przekroczony limit wdrożeń modeli

**Objawy:**
```
Error: Deployment failed due to insufficient quota
```

**Rozwiązania:**

1. **Sprawdź aktualny limit:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Poproś o zwiększenie limitu:**
Skorzystaj z panelu Foundry do zarządzania limitami dla danej subskrypcji, regionu, modelu i typu wdrożenia. Zobacz [oficjalne wytyczne dotyczące limitów](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Żądanie zwiększenia limitu VM nie zwiększa limitu modelu.

3. **Optymalizuj wykorzystanie mocy modeli:**
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

### Problem: Nieprawidłowa wersja API

**Objawy:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rozwiązania:**

1. **Użyj wersji API obsługiwanej:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Sprawdź kompatybilność wersji API:**
Sprawdź [cykl życia API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Wersje API dostawcy zasobów ARM **nie** obejmują wersji API inferencyjnej/warstwy danych. Nowi klienci v1 używają `/openai/v1/` bez oznaczonej datą wersji `api-version`; nie mieszaj tych dwóch konfiguracji klienta.

## Problemy z Azure AI Search

### Problem: Niedostateczny poziom ceny usługi wyszukiwania

**Objawy:**
```
Error: Semantic search requires Basic tier or higher
```

**Rozwiązania:**

1. **Użyj obsługiwanego poziomu cenowego:**

Semantyczny ranker wymaga Basic lub wyższego poziomu. Przejście z Free/Basic na inny poziom może wymagać utworzenia nowej usługi wyszukiwania i odbudowy indeksów; edycja SKU nie gwarantuje aktualizacji na miejscu.
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

2. **Wyłącz wyszukiwanie semantyczne (w fazie rozwoju):**
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

### Problem: Niepowodzenia tworzenia indeksu

**Objawy:**
```
Error: Cannot create index, insufficient permissions
```

**Rozwiązania:**

1. **Zweryfikuj klucze usługi wyszukiwania:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Sprawdź schemat indeksu:**
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

3. **Użyj tożsamości zarządzanej:**
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

## Problemy z wdrażaniem Container Apps

### Problem: Niepowodzenia budowania kontenera

**Objawy:**
```
Error: Failed to build container image
```

**Rozwiązania:**

1. **Sprawdź składnię Dockerfile:**
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

2. **Zweryfikuj zależności:**
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

3. **Dodaj kontrolę stanu (Health Check):**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Niepowodzenia uruchamiania aplikacji kontenera

**Objawy:**
```
Error: Container failed to start within timeout period
```

**Rozwiązania:**

1. **Zwiększ czas oczekiwania na start:**
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

2. **Optymalizuj ładowanie modelu:**
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

## Błędy uwierzytelniania i uprawnień

### Problem: Odmowa uprawnienia tożsamości zarządzanej

**Objawy:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Rozwiązania:**

1. **Zweryfikuj przypisania ról:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Przypisz wymagane role:**
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

3. **Przetestuj uwierzytelnianie:**
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

Pozyskanie tokenu potwierdza uwierzytelnianie, nie prawo do wywołania modelu. Przetestuj zamierzaną operację osobno. Lokalnie `DefaultAzureCredential` może używać poświadczeń dewelopera; w Azure zweryfikuj wybraną właściwą tożsamość zarządzaną.

### Problem: Odmowa dostępu do Key Vault

**Objawy:**
```
Error: The user, group or application does not have secrets get permission
```

**Rozwiązania:**

1. **Nadaj uprawnienia do Key Vault:**

Użyj następującego fragmentu polityki dostępu tylko dla sejfu z `enableRbacAuthorization: false`. Dla sejfu z włączonym RBAC użyj opcji 2; dodanie polityki dostępu nie zapewnia dostępu do warstwy danych w trybie RBAC.
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

2. **Użyj RBAC zamiast polityk dostępu:**

Sejf musi mieć `enableRbacAuthorization: true`; zmiana modelu uprawnień wymaga zaplanowanej migracji istniejącego dostępu.
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

## Niepowodzenia wdrożenia modelu

### Problem: Niedostępna wersja modelu

**Objawy:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Rozwiązania:**

1. **Sprawdź dostępne modele:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Wybierz jawnie dostępny model:**
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

3. **Zwaliduj model przed wdrożeniem:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problemy z wydajnością i skalowaniem

### Problem: Wysokie opóźnienia odpowiedzi

**Objawy:**
- Czasy odpowiedzi > 30 sekund
- Błędy przekroczenia limitu czasu
- Słabe doświadczenia użytkownika

**Rozwiązania:**

1. **Wprowadź limity czasu żądań:**
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

2. **Dodaj buforowanie odpowiedzi:**
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

3. **Skonfiguruj autoskalowanie:**
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

### Problem: Błędy z powodu braku pamięci

**Objawy:**
```
Error: Container killed due to memory limit exceeded
```

**Rozwiązania:**

1. **Zwiększ przydział pamięci:**
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

2. **Optymalizuj wykorzystanie pamięci:**
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

## Zarządzanie kosztami i limitami

### Problem: Niespodziewanie wysokie koszty

**Objawy:**
- Rachunek Azure wyższy niż oczekiwano
- Użycie tokenów przekraczające szacunki
- Powiadomienia budżetowe włączone

**Rozwiązania:**

1. **Wprowadź kontrolę kosztów:**
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

Ten licznik w pamięci jest przykładowy, a nie miesięcznym kontrolerem wydatków: resetuje się przy restarcie, nie jest współdzielony między replikami i sprawdza wykorzystanie dopiero po wywołaniu. Prawdziwy limit wymaga trwałego rozliczania, bezpiecznej rezerwacji współbieżnej przed żądaniami i miesięcznego resetu. Metryki pamięci kontenera muszą również uwzględniać limity cgroup; `psutil.virtual_memory()` nie jest wiarygodnym pomiarem limitu kontenera, a zbieranie śmieci nie wymusza limitu pamięci.

2. **Ustaw powiadomienia kosztowe:**
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

Zadeklaruj `budgetStartDate` i `budgetEndDate` w Twoim szablonie. Budżety powiadamiają; nie zatrzymują zasobów ani nie nakładają twardego ograniczenia wydatków.

3. **Optymalizuj wybór modelu:**
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

## Narzędzia i techniki debugowania

### Polecenia debugowania AZD

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

### Polecenia rozszerzenia AZD AI do diagnostyki

Jeśli wdrożyłeś agentów za pomocą `azd ai agent init`, dostępne są dodatkowe narzędzia:

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

> **Wskazówka:** Użyj `azd infra generate`, aby zapisać IaC na dysku i móc dokładnie zbadać, jakie zasoby zostały dostarczone. To nieocenione przy debugowaniu konfiguracji zasobów. Zobacz [referencję AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) po szczegóły.

**Diagnostyka workflow GA (2026-11-09):** Sprawdź, czy `azd version` jest przynajmniej w wersji 1.37.0 i zbadaj `azd ext list --installed`. Najpierw aktualizuj główne CLI poleceniem `azd update` lub instalatorem, potem aktualizuj pakiet poleceniem `azd ext upgrade microsoft.foundry`. W przypadku lokalnych błędów sprawdź bieżące uv, Pythona 3.13+ dla podstawowego przykładu, `PYTHONNOUSERSITE: "1"` w jego konfiguracji usługi oraz poświadczenia Azure używane przez `DefaultAzureCredential`. Trzymaj `azd ai agent run` uruchomione podczas wywoływania `--local` z drugiego terminala w katalogu projektu.

Sukces provisioningowy nie oznacza, że deweloper ma dostęp do warstwy danych. Sprawdź ostrzeżenia RBAC i [macierz uprawnień hostowanego agenta](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Przekroczenie limitu czasu nie oznacza porażki wdrożenia: zbadaj wersję i logi przed ponowną próbą. Starsze agenty beta.23 poprawiły te ostrzeżenia i wyniki A2A; te historyczne poprawki opisano w [notatkach o wersjach](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), instalacja bety nie jest obowiązkowa.

Jeśli `azd ai eval` jest niedostępne, zainstaluj osobno `azure.ai.evaluations`; pakiet GA go nie zawiera. Jeśli polecenie agent-evaluation w starszym tutorialu jedynie wyświetla wskazówki migracyjne, użyj osobnego workflow `azd ai eval`. `--config` w optymalizacji nie akceptuje już starych plików ewaluacji. Zobacz [migrację ewaluacji](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) i [migrację optymalizacji](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Debugowanie aplikacji

1. **Strukturalne logowanie:**
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

2. **Punkty kontrolne stanu zdrowia:**
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

3. **Monitorowanie wydajności:**
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

## Typowe kody błędów i rozwiązania

| Kod błędu | Opis | Rozwiązanie |
|------------|-------------|----------|
| 401 | Nieautoryzowany | Sprawdź klucze API i konfigurację tożsamości zarządzanej |
| 403 | Zabronione | Zweryfikuj przypisania ról RBAC |
| 429 | Limit szybkości | Wprowadź logikę ponownej próby z wykładniczym opóźnieniem |
| 500 | Błąd wewnętrzny serwera | Sprawdź status wdrożenia modelu i logi |
| 503 | Usługa niedostępna | Sprawdź stan usługi i dostępność regionalną |

## Następne kroki

1. **Przejrzyj [Przewodnik wdrażania modeli AI](../chapter-02-ai-development/ai-model-deployment.md)** dla najlepszych praktyk wdrożeniowych
2. **Ukończ [Praktyki produkcyjne AI](../chapter-08-production/production-ai-practices.md)** dla rozwiązań gotowych na korporacje
3. **Dołącz do [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** dla wsparcia społeczności
4. **Zgłaszaj problemy** w [repozytorium AZD na GitHubie](https://github.com/Azure/azure-dev) dla problemów specyficznych dla AZD

## Zasoby

- [Rozwiązywanie problemów z limitem i throttlingiem Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Rozwiązywanie problemów z Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Rozwiązywanie problemów z Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Umiejętność agenta diagnostycznego Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Zainstaluj umiejętności rozwiązywania problemów Azure w edytorze: `npx skills add microsoft/github-copilot-for-azure`

---

**Nawigacja po Rozdziale:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Bieżący rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni**: [Przewodnik po debugowaniu](debugging.md)
- **➡️ Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../chapter-08-production/production-ai-practices.md)
- **🤖 Powiązane**: [Rozdział 2: Rozwój AI jako pierwszy](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referencje**: [Rozwiązywanie problemów Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Choć dążymy do dokładności, prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub niedokładności. Oryginalny dokument w jego języku źródłowym należy uznawać za autorytatywne źródło. W przypadku informacji krytycznych zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->