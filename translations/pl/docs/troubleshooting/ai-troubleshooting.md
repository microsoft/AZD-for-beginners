# Przewodnik rozwiązywania problemów związanych z AI

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni**: [Przewodnik debugowania](debugging.md)
- **➡️ Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../microsoft-foundry/production-ai-practices.md)
- **🤖 Powiązane**: [Rozdział 2: Rozwój z AI na pierwszym miejscu](../microsoft-foundry/microsoft-foundry-integration.md)

**Poprzedni:** [Praktyki AI w produkcji](../microsoft-foundry/production-ai-practices.md) | **Następny:** [Pierwsze kroki z AZD](../getting-started/README.md)

Ten kompleksowy przewodnik rozwiązywania problemów omawia typowe trudności związane z wdrażaniem rozwiązań AI za pomocą AZD, oferując rozwiązania i techniki debugowania specyficzne dla usług Azure AI.

## Spis treści

- [Problemy z usługą Azure OpenAI](../../../../docs/troubleshooting)
- [Problemy z wyszukiwaniem Azure AI](../../../../docs/troubleshooting)
- [Problemy z wdrażaniem aplikacji kontenerowych](../../../../docs/troubleshooting)
- [Błędy uwierzytelniania i uprawnień](../../../../docs/troubleshooting)
- [Niepowodzenia wdrażania modeli](../../../../docs/troubleshooting)
- [Problemy z wydajnością i skalowaniem](../../../../docs/troubleshooting)
- [Zarządzanie kosztami i limitami](../../../../docs/troubleshooting)
- [Narzędzia i techniki debugowania](../../../../docs/troubleshooting)

## Problemy z usługą Azure OpenAI

### Problem: Usługa OpenAI niedostępna w regionie

**Objawy:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Przyczyny:**
- Azure OpenAI niedostępne w wybranym regionie
- Wyczerpany limit w preferowanych regionach
- Ograniczenia regionalnej pojemności

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

### Problem: Przekroczony limit wdrażania modelu

**Objawy:**
```
Error: Deployment failed due to insufficient quota
```

**Rozwiązania:**

1. **Sprawdź obecny limit:**
```bash
# Sprawdź użycie kwoty
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Złóż wniosek o zwiększenie limitu:**
```bash
# Prześlij wniosek o zwiększenie limitu
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

### Problem: Nieprawidłowa wersja API

**Objawy:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Rozwiązania:**

1. **Użyj obsługiwanej wersji API:**
```python
# Użyj najnowszej obsługiwanej wersji
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Sprawdź kompatybilność wersji API:**
```bash
# Wymień obsługiwane wersje API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problemy z wyszukiwaniem Azure AI

### Problem: Niewystarczający poziom cenowy usługi wyszukiwania

**Objawy:**
```
Error: Semantic search requires Basic tier or higher
```

**Rozwiązania:**

1. **Zaktualizuj poziom cenowy:**
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

2. **Wyłącz wyszukiwanie semantyczne (na potrzeby rozwoju):**
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

### Problem: Niepowodzenia w tworzeniu indeksu

**Objawy:**
```
Error: Cannot create index, insufficient permissions
```

**Rozwiązania:**

1. **Zweryfikuj klucze usługi wyszukiwania:**
```bash
# Pobierz klucz administratora usługi wyszukiwania
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Sprawdź schemat indeksu:**
```python
# Sprawdź schemat indeksu
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

3. **Użyj zarządzanej tożsamości:**
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

## Problemy z wdrażaniem aplikacji kontenerowych

### Problem: Niepowodzenia w budowaniu kontenera

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
# requirements.txt - Pin versions for stability
fastapi==0.104.1
uvicorn==0.24.0
openai==1.3.7
azure-identity==1.14.1
azure-keyvault-secrets==4.7.0
azure-search-documents==11.4.0
azure-cosmos==4.5.1
```

3. **Dodaj kontrolę stanu:**
```python
# main.py - Dodaj punkt końcowy sprawdzania stanu zdrowia
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Niepowodzenia w uruchamianiu aplikacji kontenerowej

**Objawy:**
```
Error: Container failed to start within timeout period
```

**Rozwiązania:**

1. **Zwiększ czas oczekiwania na uruchomienie:**
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
# Lenie ładowanie modeli, aby skrócić czas uruchamiania
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
        # Zainicjalizuj klienta AI tutaj
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Uruchomienie
    app.state.model_manager = ModelManager()
    yield
    # Zamknięcie
    pass

app = FastAPI(lifespan=lifespan)
```

## Błędy uwierzytelniania i uprawnień

### Problem: Odmowa uprawnień zarządzanej tożsamości

**Objawy:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Rozwiązania:**

1. **Zweryfikuj przypisania ról:**
```bash
# Sprawdź bieżące przypisania ról
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
# Przetestuj uwierzytelnianie za pomocą zarządzanej tożsamości
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

### Problem: Odmowa dostępu do Key Vault

**Objawy:**
```
Error: The user, group or application does not have secrets get permission
```

**Rozwiązania:**

1. **Przyznaj uprawnienia do Key Vault:**
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

## Niepowodzenia wdrażania modeli

### Problem: Wersja modelu niedostępna

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

2. **Użyj alternatywnych modeli:**
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

3. **Zweryfikuj model przed wdrożeniem:**
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

## Problemy z wydajnością i skalowaniem

### Problem: Wysoka latencja odpowiedzi

**Objawy:**
- Czas odpowiedzi > 30 sekund
- Błędy timeout
- Słabe doświadczenie użytkownika

**Rozwiązania:**

1. **Wprowadź limity czasowe dla żądań:**
```python
# Skonfiguruj odpowiednie limity czasowe
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

3. **Skonfiguruj automatyczne skalowanie:**
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

### Problem: Błędy związane z brakiem pamięci

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
        # Sprawdź użycie pamięci przed przetwarzaniem
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Wymuś zbieranie śmieci
            
        result = await self._process_ai_request(request)
        
        # Posprzątaj po przetwarzaniu
        gc.collect()
        return result
```

## Zarządzanie kosztami i limitami

### Problem: Nieoczekiwane wysokie koszty

**Objawy:**
- Wyższy niż oczekiwano rachunek za Azure
- Zużycie tokenów przekraczające szacunki
- Wyzwolone alerty budżetowe

**Rozwiązania:**

1. **Wprowadź kontrolę kosztów:**
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

2. **Skonfiguruj alerty kosztowe:**
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
# Wybór modelu uwzględniający koszty
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # za 1K tokenów
    'gpt-4': 0.03,          # za 1K tokenów
    'gpt-35-turbo': 0.0015  # za 1K tokenów
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

## Narzędzia i techniki debugowania

### Polecenia debugowania AZD

```bash
# Włącz szczegółowe logowanie
azd up --debug

# Sprawdź status wdrożenia
azd show

# Wyświetl logi wdrożenia
azd logs --follow

# Sprawdź zmienne środowiskowe
azd env get-values
```

### Debugowanie aplikacji

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

2. **Punkty kontrolne stanu:**
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
|-----------|------|-------------|
| 401 | Nieautoryzowany | Sprawdź klucze API i konfigurację zarządzanej tożsamości |
| 403 | Zabronione | Zweryfikuj przypisania ról RBAC |
| 429 | Limit żądań | Wprowadź logikę ponawiania z wykładniczym opóźnieniem |
| 500 | Błąd wewnętrzny serwera | Sprawdź status wdrożenia modelu i logi |
| 503 | Usługa niedostępna | Zweryfikuj stan usługi i dostępność regionalną |

## Kolejne kroki

1. **Przejrzyj [Przewodnik wdrażania modeli AI](ai-model-deployment.md)**, aby poznać najlepsze praktyki wdrażania
2. **Ukończ [Praktyki AI w produkcji](production-ai-practices.md)**, aby uzyskać rozwiązania gotowe dla przedsiębiorstw
3. **Dołącz do [Discorda Microsoft Foundry](https://aka.ms/foundry/discord)**, aby uzyskać wsparcie społeczności
4. **Zgłaszaj problemy** do [repozytorium AZD na GitHubie](https://github.com/Azure/azure-dev) w przypadku problemów specyficznych dla AZD

## Zasoby

- [Rozwiązywanie problemów z usługą Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Rozwiązywanie problemów z aplikacjami kontenerowymi](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Rozwiązywanie problemów z wyszukiwaniem Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Nawigacja po rozdziałach:**
- **📚 Strona główna kursu**: [AZD dla początkujących](../../README.md)
- **📖 Obecny rozdział**: Rozdział 7 - Rozwiązywanie problemów i debugowanie
- **⬅️ Poprzedni**: [Przewodnik debugowania](debugging.md)
- **➡️ Następny rozdział**: [Rozdział 8: Wzorce produkcyjne i korporacyjne](../microsoft-foundry/production-ai-practices.md)
- **🤖 Powiązane**: [Rozwój z AI na pierwszym miejscu](../microsoft-foundry/microsoft-foundry-integration.md)
- [Rozwiązywanie problemów z Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zastrzeżenie**:  
Ten dokument został przetłumaczony za pomocą usługi tłumaczenia AI [Co-op Translator](https://github.com/Azure/co-op-translator). Chociaż staramy się zapewnić dokładność, prosimy mieć na uwadze, że automatyczne tłumaczenia mogą zawierać błędy lub nieścisłości. Oryginalny dokument w jego rodzimym języku powinien być uznawany za wiarygodne źródło. W przypadku informacji krytycznych zaleca się skorzystanie z profesjonalnego tłumaczenia przez człowieka. Nie ponosimy odpowiedzialności za jakiekolwiek nieporozumienia lub błędne interpretacje wynikające z użycia tego tłumaczenia.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->