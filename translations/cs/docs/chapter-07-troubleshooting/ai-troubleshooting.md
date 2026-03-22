# Příručka řešení problémů specifických pro AI

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Průvodce laděním](debugging.md)
- **➡️ Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Souvisí**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Tato komplexní příručka řešení problémů se zabývá běžnými problémy při nasazování AI řešení s AZD a poskytuje řešení a techniky ladění specifické pro služby Azure AI.

## Obsah

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-problems)
- [Container Apps Deployment Issues](#container-apps-deployment-issues)
- [Authentication and Permission Errors](#authentication-and-permission-errors)
- [Model Deployment Failures](#model-deployment-failures)
- [Performance and Scaling Issues](#performance-and-scaling-issues)
- [Cost and Quota Management](#cost-and-quota-management)
- [Debugging Tools and Techniques](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Issues

### Problém: Služba OpenAI nedostupná v regionu

**Příznaky:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Příčiny:**
- Microsoft Foundry Models není dostupná ve vybraném regionu
- Kvóta ve preferovaných regionech vyčerpána
- Regionální omezení kapacity

**Řešení:**

1. **Zkontrolujte dostupnost v regionu:**
```bash
# Vypsat dostupné regiony pro OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Aktualizujte konfiguraci AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Použijte alternativní regiony:**
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

### Problém: Překročena kvóta nasazení modelu

**Příznaky:**
```
Error: Deployment failed due to insufficient quota
```

**Řešení:**

1. **Zkontrolujte aktuální kvótu:**
```bash
# Zkontrolujte využití kvóty
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Požádejte o zvýšení kvóty:**
```bash
# Odeslat žádost o zvýšení kvóty
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Optimalizujte kapacitu modelu:**
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

### Problém: Neplatná verze API

**Příznaky:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Řešení:**

1. **Použijte podporovanou verzi API:**
```python
# Použijte nejnovější podporovanou verzi
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Zkontrolujte kompatibilitu verze API:**
```bash
# Seznam podporovaných verzí API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Problém: Cenová úroveň služby Search nedostatečná

**Příznaky:**
```
Error: Semantic search requires Basic tier or higher
```

**Řešení:**

1. **Upgradujte cenovou úroveň:**
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

2. **Vypněte sémantické vyhledávání (vývoj):**
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

### Problém: Chyby při vytváření indexu

**Příznaky:**
```
Error: Cannot create index, insufficient permissions
```

**Řešení:**

1. **Ověřte klíče služby Search:**
```bash
# Získat administrační klíč služby vyhledávání
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Zkontrolujte schéma indexu:**
```python
# Ověřit schéma indexu
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

3. **Použijte spravovanou identitu:**
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

### Problém: Selhání sestavení kontejneru

**Příznaky:**
```
Error: Failed to build container image
```

**Řešení:**

1. **Zkontrolujte syntaxi Dockerfile:**
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

2. **Ověřte závislosti:**
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

3. **Přidejte kontrolu zdraví:**
```python
# main.py - Přidat endpoint pro kontrolu stavu
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problém: Chyby při spuštění Container App

**Příznaky:**
```
Error: Container failed to start within timeout period
```

**Řešení:**

1. **Zvyšte časový limit spuštění:**
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

2. **Optimalizujte načítání modelu:**
```python
# Lenivé načítání modelů ke zkrácení doby spuštění
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
        # Inicializujte zde AI klienta
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Spuštění
    app.state.model_manager = ModelManager()
    yield
    # Ukončení
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Problém: Povolení spravované identity zamítnuto

**Příznaky:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Řešení:**

1. **Ověřte přiřazení rolí:**
```bash
# Zkontrolujte aktuální přiřazení rolí
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Přiřaďte požadované role:**
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

3. **Otestujte ověřování:**
```python
# Test ověřování spravované identity
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

### Problém: Přístup do Key Vaultu zamítnut

**Příznaky:**
```
Error: The user, group or application does not have secrets get permission
```

**Řešení:**

1. **Udělte oprávnění k Key Vaultu:**
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

2. **Použijte RBAC místo přístupových politik:**
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

### Problém: Verze modelu není k dispozici

**Příznaky:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Řešení:**

1. **Zkontrolujte dostupné modely:**
```bash
# Vypsat dostupné modely
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Použijte náhradní modely (fallbacks):**
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

3. **Ověřte model před nasazením:**
```python
# Validace modelu před nasazením
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

### Problém: Vysoká latence odpovědí

**Příznaky:**
- Doba odezvy > 30 sekund
- Chyby vypršení časového limitu
- Špatná uživatelská zkušenost

**Řešení:**

1. **Implementujte časové limity požadavků:**
```python
# Nastavte správné časové limity
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

2. **Přidejte cachování odpovědí:**
```python
# Redis mezipaměť pro odpovědi
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

3. **Nakonfigurujte automatické škálování:**
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

### Problém: Chyby vyčerpání paměti

**Příznaky:**
```
Error: Container killed due to memory limit exceeded
```

**Řešení:**

1. **Zvyšte přidělení paměti:**
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

2. **Optimalizujte využití paměti:**
```python
# Paměťově efektivní zacházení s modelem
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Zkontrolujte využití paměti před zpracováním
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Vynutit sběr paměti
            
        result = await self._process_ai_request(request)
        
        # Uklidit po zpracování
        gc.collect()
        return result
```

## Cost and Quota Management

### Problém: Neočekávaně vysoké náklady

**Příznaky:**
- Faktura Azure vyšší než očekávaná
- Využití tokenů překračuje odhady
- Spuštěné upozornění rozpočtu

**Řešení:**

1. **Implementujte kontroly nákladů:**
```python
# Sledování využití tokenů
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

2. **Nastavte upozornění na náklady:**
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

3. **Optimalizujte výběr modelu:**
```python
# Výběr modelu zohledňující náklady
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # na 1K tokenů
    'gpt-4.1': 0.03,          # na 1K tokenů
    'gpt-35-turbo': 0.0015  # na 1K tokenů
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

## Debugging Tools and Techniques

### Příkazy pro ladění AZD

```bash
# Povolit podrobné protokolování
azd up --debug

# Zkontrolovat stav nasazení
azd show

# Zobrazit protokoly aplikace (otevře monitorovací panel)
azd monitor --logs

# Zobrazit metriky v reálném čase
azd monitor --live

# Zkontrolovat proměnné prostředí
azd env get-values
```

### Příkazy rozšíření AZD AI pro diagnostiku

Pokud jste nasadili agenty pomocí `azd ai agent init`, jsou k dispozici tyto další nástroje:

```bash
# Ujistěte se, že je nainstalováno rozšíření agentů
azd extension install azure.ai.agents

# Znovu inicializujte nebo aktualizujte agenta z manifestu
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Použijte MCP server, aby nástroje AI mohly dotazovat stav projektu
azd mcp start

# Vygenerujte soubory infrastruktury pro revizi a audit
azd infra generate
```

> **Tip:** Použijte `azd infra generate` k zápisu IaC na disk, abyste mohli přesně zkontrolovat, jaké prostředky byly vytvořeny. To je neocenitelné při ladění problémů s konfigurací prostředků. Podrobnosti najdete v [referenci AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions).

### Ladění aplikace

1. **Strukturované logování:**
```python
import logging
import json

# Nakonfigurujte strukturované logování pro AI aplikace
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

2. **Kontrolní koncové body:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Zkontrolovat připojení k OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Zkontrolovat službu vyhledávání
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

3. **Monitorování výkonu:**
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

## Běžné kódy chyb a řešení

| Kód chyby | Popis | Řešení |
|------------|-------------|----------|
| 401 | Neautorizováno | Zkontrolujte API klíče a konfiguraci spravované identity |
| 403 | Zakázáno | Ověřte přiřazení rolí RBAC |
| 429 | Omezeno rychlostí | Implementujte logiku opakování s exponenciálním backoffem |
| 500 | Interní chyba serveru | Zkontrolujte stav nasazení modelu a logy |
| 503 | Služba nedostupná | Ověřte stav služby a regionální dostupnost |

## Další kroky

1. **Přečtěte si [AI Model Deployment Guide](../chapter-02-ai-development/ai-model-deployment.md)** pro osvědčené postupy nasazení
2. **Projděte [Production AI Practices](../chapter-08-production/production-ai-practices.md)** pro podniková řešení připravená do produkce
3. **Připojte se k [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pro podporu komunity
4. **Zasílejte problémy** do [repozitáře AZD na GitHubu](https://github.com/Azure/azure-dev) pro problémy specifické pro AZD

## Zdroje

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Dovednost Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Nainstalujte si Azure diagnostické dovednosti ve svém editoru: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigace kapitolami:**
- **📚 Domov kurzu**: [AZD pro začátečníky](../../README.md)
- **📖 Aktuální kapitola**: Kapitola 7 - Řešení problémů a ladění
- **⬅️ Předchozí**: [Průvodce laděním](debugging.md)
- **➡️ Další kapitola**: [Kapitola 8: Produkční a podnikové vzory](../chapter-08-production/production-ai-practices.md)
- **🤖 Souvisí**: [Kapitola 2: Vývoj orientovaný na AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Reference**: [Řešení problémů s Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Upozornění**:
Tento dokument byl přeložen pomocí služby pro překlad využívající umělou inteligenci [Co-op Translator](https://github.com/Azure/co-op-translator). Snažíme se o přesnost, nicméně mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za závazný zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nezodpovídáme za žádná nedorozumění nebo chybné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->