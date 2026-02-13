# Przewodnik rozwiązywania problemów specyficznych dla AI

**Nawigacja po rozdziale:**
- **📚 Course Home**: [AZD dla początkujących](../../README.md)
- **📖 Current Chapter**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Previous**: [Debugging Guide](debugging.md)
- **➡️ Next Chapter**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [Rozdział 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

**Poprzedni:** [Production AI Practices](../chapter-08-production/production-ai-practices.md) | **Następny:** [AZD Basics](../chapter-01-foundation/azd-basics.md)

Ten obszerny przewodnik rozwiązywania problemów porusza typowe problemy pojawiające się podczas wdrażania rozwiązań AI z użyciem AZD, dostarczając rozwiązań i technik debugowania specyficznych dla usług Azure AI.

## Spis treści

- [Azure OpenAI Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Azure OpenAI Service Issues

### Issue: OpenAI Service Unavailable in Region

**Objawy:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Przyczyny:**
- Azure OpenAI niedostępny w wybranym regionie
- Limit przydziału wyczerpany w preferowanych regionach
- Ograniczenia pojemności regionalnej

**Rozwiązania:**

1. **Sprawdź dostępność regionu:**
```bash
# Wymień dostępne regiony dla OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Zaktualizuj konfigurację AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Użyj alternatywnych regionów:**
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

### Issue: Model Deployment Quota Exceeded

**Objawy:**
```
Error: Deployment failed due to insufficient quota
```

**Rozwiązania:**

1. **Sprawdź bieżący limit:**
```bash
# Sprawdź wykorzystanie limitu
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Złóż wniosek o zwiększenie limitu:**
```bash
# Złóż wniosek o zwiększenie limitu
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optymalizuj pojemność modelu:**
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

### Issue: Invalid API Version

**Objawy:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rozwiązania:**

1. **Użyj wspieranej wersji API:**
```python
# Użyj najnowszej obsługiwanej wersji
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Sprawdź zgodność wersji API:**
```bash
# Wymień obsługiwane wersje API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Objawy:**
```
Error: Semantic search requires Basic tier or higher
```

**Rozwiązania:**

1. **Zwiększ poziom cenowy (Pricing Tier):**
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

2. **Wyłącz wyszukiwanie semantyczne (środowisko deweloperskie):**
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

### Issue: Index Creation Failures

**Objawy:**
```
Error: Cannot create index, insufficient permissions
```

**Rozwiązania:**

1. **Zweryfikuj klucze usługi Search:**
```bash
# Pobierz klucz administratora usługi wyszukiwania
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Sprawdź schemat indeksu:**
```python
# Zweryfikuj schemat indeksu
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

3. **Użyj Managed Identity:**
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

## Container Apps Deployment Issues

### Issue: Container Build Failures

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

2. **Zwaliduj zależności:**
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

3. **Dodaj health check:**
```python
# main.py - Dodaj punkt końcowy sprawdzania stanu
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**Objawy:**
```
Error: Container failed to start within timeout period
```

**Rozwiązania:**

1. **Zwiększ limit czasu uruchamiania:**
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

2. **Optymalizuj ładowanie modelu:**
```python
# Wczytuj modele leniwie, aby skrócić czas uruchamiania
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
        # Zainicjalizuj tutaj klienta AI
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Uruchamianie
    app.state.model_manager = ModelManager()
    yield
    # Zamykanie
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Objawy:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Rozwiązania:**

1. **Zweryfikuj przypisania ról:**
```bash
# Sprawdź aktualne przypisania ról
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
# Test uwierzytelniania tożsamości zarządzanej
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

### Issue: Key Vault Access Denied

**Objawy:**
```
Error: The user, group or application does not have secrets get permission
```

**Rozwiązania:**

1. **Nadaj uprawnienia do Key Vault:**
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

2. **Użyj RBAC zamiast Access Policies:**
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

## Model Deployment Failures

### Issue: Model Version Not Available

**Objawy:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Rozwiązania:**

1. **Sprawdź dostępne modele:**
```bash
# Wyświetl dostępne modele
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Użyj zapasowych modeli (fallbacks):**
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

3. **Zwaliduj model przed wdrożeniem:**
```python
# Walidacja modelu przed wdrożeniem
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

## Performance and Scaling Issues

### Issue: High Latency Responses

**Objawy:**
- Czasy odpowiedzi > 30 sekund
- Błędy przekroczenia czasu (timeout)
- Zła jakość doświadczenia użytkownika

**Rozwiązania:**

1. **Wdróż limity czasu żądań:**
```python
# Skonfiguruj odpowiednie limity czasu
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
# Pamięć podręczna Redis dla odpowiedzi
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

### Issue: Memory Out of Errors

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
# Obsługa modelu oszczędzająca pamięć
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Sprawdź zużycie pamięci przed przetwarzaniem
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Wymuś zbieranie śmieci
            
        result = await self._process_ai_request(request)
        
        # Posprzątaj po przetwarzaniu
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**Objawy:**
- Rachunek Azure wyższy niż oczekiwano
- Zużycie tokenów przekracza szacunki
- Wywołane alerty budżetowe

**Rozwiązania:**

1. **Wprowadź mechanizmy kontroli kosztów:**
```python
# Śledzenie użycia tokenów
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

2. **Skonfiguruj alerty kosztów:**
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

3. **Optymalizuj wybór modelu:**
```python
# Wybór modelu z uwzględnieniem kosztów
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # na 1K tokenów
    'gpt-4': 0.03,          # na 1K tokenów
    'gpt-35-turbo': 0.0015  # na 1K tokenów
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

## Debugging Tools and Techniques

### AZD Debugging Commands

```bash
# Włącz szczegółowe logowanie
azd up --debug

# Sprawdź status wdrożenia
azd show

# Wyświetl logi aplikacji (otwiera panel monitoringu)
azd monitor --logs

# Wyświetl metryki na żywo
azd monitor --live

# Sprawdź zmienne środowiskowe
azd env get-values
```

### Application Debugging

1. **Strukturalne logowanie:**
```python
import logging
import json

# Skonfiguruj strukturalne logowanie dla aplikacji AI
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

2. **Punkty końcowe health check:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Sprawdź łączność z OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Sprawdź usługę wyszukiwania
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
| 401 | Nieautoryzowany | Sprawdź klucze API i konfigurację managed identity |
| 403 | Brak dostępu | Zweryfikuj przypisania ról RBAC |
| 429 | Ograniczenie liczby żądań | Zaimplementuj logikę ponawiania z wykładniczym opóźnieniem |
| 500 | Błąd wewnętrzny serwera | Sprawdź status wdrożenia modelu i logi |
| 503 | Usługa niedostępna | Sprawdź stan usługi i dostępność regionalną |

## Kolejne kroki

1. **Przejrzyj [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** w celu najlepszych praktyk wdrożeniowych
2. **Ukończ [Production AI Practices](../chapter-08-production/production-ai-practices.md)**, aby uzyskać rozwiązania gotowe do zastosowań korporacyjnych
3. **Dołącz do [Microsoft Foundry Discord](https://aka.ms/foundry/discord)**, aby otrzymać wsparcie społeczności
4. **Zgłaszaj problemy** do [repozytorium AZD na GitHubie](https://github.com/Azure/azure-dev) dla problemów specyficznych dla AZD

## Zasoby

- [Azure OpenAI Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Nawigacja po rozdziale:**
- **📚 Course Home**: [AZD dla początkujących](../../README.md)
- **📖 Current Chapter**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Previous**: [Debugging Guide](debugging.md)
- **➡️ Next Chapter**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [Rozdział 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:
Niniejszy dokument został przetłumaczony przy użyciu usługi tłumaczeń AI [Co-op Translator](https://github.com/Azure/co-op-translator). Dokładamy starań o jak największą dokładność, jednak prosimy pamiętać, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w języku źródłowym należy uważać za źródło autorytatywne. W przypadku informacji mających znaczenie krytyczne zalecane jest skorzystanie z profesjonalnego tłumaczenia wykonanego przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z korzystania z tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->