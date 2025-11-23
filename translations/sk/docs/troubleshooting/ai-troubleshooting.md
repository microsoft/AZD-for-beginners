<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-23T11:48:11+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "sk"
}
-->
# Špecifický sprievodca riešením problémov s AI

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca**: [Sprievodca ladením](debugging.md)
- **➡️ Nasledujúca kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../microsoft-foundry/production-ai-practices.md)
- **🤖 Súvisiace**: [Kapitola 2: Vývoj orientovaný na AI](../microsoft-foundry/microsoft-foundry-integration.md)

**Predchádzajúca:** [Produkčné AI praktiky](../microsoft-foundry/production-ai-practices.md) | **Nasledujúca:** [Začíname s AZD](../getting-started/README.md)

Tento komplexný sprievodca riešením problémov sa zaoberá bežnými problémami pri nasadzovaní AI riešení s AZD, poskytuje riešenia a techniky ladenia špecifické pre Azure AI služby.

## Obsah

- [Problémy s Azure OpenAI službou](../../../../docs/troubleshooting)
- [Problémy s Azure AI vyhľadávaním](../../../../docs/troubleshooting)
- [Problémy s nasadzovaním aplikácií v kontajneroch](../../../../docs/troubleshooting)
- [Chyby autentifikácie a oprávnení](../../../../docs/troubleshooting)
- [Zlyhania nasadzovania modelov](../../../../docs/troubleshooting)
- [Problémy s výkonom a škálovaním](../../../../docs/troubleshooting)
- [Správa nákladov a kvót](../../../../docs/troubleshooting)
- [Nástroje a techniky ladenia](../../../../docs/troubleshooting)

## Problémy s Azure OpenAI službou

### Problém: OpenAI služba nie je dostupná v regióne

**Príznaky:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Príčiny:**
- Azure OpenAI nie je dostupná vo vybranom regióne
- Vyčerpaná kvóta v preferovaných regiónoch
- Obmedzenia kapacity regiónu

**Riešenia:**

1. **Skontrolujte dostupnosť regiónu:**
```bash
# Zoznam dostupných regiónov pre OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Aktualizujte konfiguráciu AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Použite alternatívne regióny:**
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

### Problém: Prekročená kvóta nasadzovania modelu

**Príznaky:**
```
Error: Deployment failed due to insufficient quota
```

**Riešenia:**

1. **Skontrolujte aktuálnu kvótu:**
```bash
# Skontrolujte využitie kvóty
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Požiadajte o zvýšenie kvóty:**
```bash
# Odoslať žiadosť o zvýšenie kvóty
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

### Problém: Neplatná verzia API

**Príznaky:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Riešenia:**

1. **Použite podporovanú verziu API:**
```python
# Použite najnovšiu podporovanú verziu
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Skontrolujte kompatibilitu verzie API:**
```bash
# Zoznam podporovaných verzií API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Problémy s Azure AI vyhľadávaním

### Problém: Nedostatočná cenová úroveň vyhľadávacej služby

**Príznaky:**
```
Error: Semantic search requires Basic tier or higher
```

**Riešenia:**

1. **Aktualizujte cenovú úroveň:**
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

2. **Zakážte semantické vyhľadávanie (pre vývoj):**
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

### Problém: Zlyhania pri vytváraní indexu

**Príznaky:**
```
Error: Cannot create index, insufficient permissions
```

**Riešenia:**

1. **Overte kľúče vyhľadávacej služby:**
```bash
# Získajte administrátorský kľúč služby vyhľadávania
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Skontrolujte schému indexu:**
```python
# Overiť schému indexu
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

3. **Použite spravovanú identitu:**
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

## Problémy s nasadzovaním aplikácií v kontajneroch

### Problém: Zlyhania pri zostavovaní kontajnera

**Príznaky:**
```
Error: Failed to build container image
```

**Riešenia:**

1. **Skontrolujte syntax Dockerfile:**
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

2. **Overte závislosti:**
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

3. **Pridajte kontrolu stavu:**
```python
# main.py - Pridajte koncový bod kontroly zdravia
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problém: Zlyhania pri spúšťaní aplikácie v kontajneri

**Príznaky:**
```
Error: Container failed to start within timeout period
```

**Riešenia:**

1. **Zvýšte časový limit spustenia:**
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

2. **Optimalizujte načítanie modelu:**
```python
# Lenivé načítanie modelov na zníženie času spustenia
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
        # Inicializovať AI klienta tu
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Spustenie
    app.state.model_manager = ModelManager()
    yield
    # Vypnutie
    pass

app = FastAPI(lifespan=lifespan)
```

## Chyby autentifikácie a oprávnení

### Problém: Odmietnuté oprávnenie spravovanej identity

**Príznaky:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Riešenia:**

1. **Overte priradenie rolí:**
```bash
# Skontrolujte aktuálne priradenia rolí
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Priraďte požadované roly:**
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

3. **Otestujte autentifikáciu:**
```python
# Testovanie autentifikácie spravovanej identity
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

### Problém: Odmietnutý prístup k Key Vault

**Príznaky:**
```
Error: The user, group or application does not have secrets get permission
```

**Riešenia:**

1. **Udeľte oprávnenia k Key Vault:**
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

2. **Použite RBAC namiesto politík prístupu:**
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

## Zlyhania nasadzovania modelov

### Problém: Verzia modelu nie je dostupná

**Príznaky:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Riešenia:**

1. **Skontrolujte dostupné modely:**
```bash
# Zoznam dostupných modelov
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Použite záložné modely:**
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

3. **Overte model pred nasadením:**
```python
# Validácia modelu pred nasadením
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

## Problémy s výkonom a škálovaním

### Problém: Vysoká latencia odpovedí

**Príznaky:**
- Časy odpovedí > 30 sekúnd
- Chyby časového limitu
- Slabá používateľská skúsenosť

**Riešenia:**

1. **Implementujte časové limity požiadaviek:**
```python
# Nastavte správne časové limity
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

2. **Pridajte cache odpovedí:**
```python
# Redis cache pre odpovede
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

3. **Konfigurujte automatické škálovanie:**
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

### Problém: Chyby nedostatku pamäte

**Príznaky:**
```
Error: Container killed due to memory limit exceeded
```

**Riešenia:**

1. **Zvýšte alokáciu pamäte:**
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

2. **Optimalizujte využitie pamäte:**
```python
# Pamäťovo efektívne spracovanie modelu
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Skontrolujte využitie pamäte pred spracovaním
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Vynútiť zber odpadu
            
        result = await self._process_ai_request(request)
        
        # Vyčistiť po spracovaní
        gc.collect()
        return result
```

## Správa nákladov a kvót

### Problém: Neočakávane vysoké náklady

**Príznaky:**
- Vyšší účet za Azure, než sa očakávalo
- Použitie tokenov presahujúce odhady
- Spustené upozornenia na rozpočet

**Riešenia:**

1. **Implementujte kontrolu nákladov:**
```python
# Sledovanie používania tokenov
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

2. **Nastavte upozornenia na náklady:**
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

3. **Optimalizujte výber modelu:**
```python
# Výber modelu s ohľadom na náklady
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # na 1K tokenov
    'gpt-4': 0.03,          # na 1K tokenov
    'gpt-35-turbo': 0.0015  # na 1K tokenov
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

## Nástroje a techniky ladenia

### AZD príkazy na ladenie

```bash
# Povoliť podrobné protokolovanie
azd up --debug

# Skontrolovať stav nasadenia
azd show

# Zobraziť protokoly nasadenia
azd logs --follow

# Skontrolovať environmentálne premenné
azd env get-values
```

### Ladenie aplikácií

1. **Štruktúrované logovanie:**
```python
import logging
import json

# Konfigurujte štruktúrované logovanie pre AI aplikácie
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

2. **End-pointy kontroly stavu:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Skontrolujte pripojenie k OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Skontrolujte službu vyhľadávania
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

3. **Monitorovanie výkonu:**
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

## Bežné chybové kódy a riešenia

| Chybový kód | Popis | Riešenie |
|-------------|-------|----------|
| 401 | Neautorizované | Skontrolujte API kľúče a konfiguráciu spravovanej identity |
| 403 | Zakázané | Overte priradenie rolí RBAC |
| 429 | Obmedzené rýchlosťou | Implementujte logiku opakovania s exponenciálnym oneskorením |
| 500 | Interná chyba servera | Skontrolujte stav nasadzovania modelu a logy |
| 503 | Služba nedostupná | Overte stav služby a dostupnosť regiónu |

## Ďalšie kroky

1. **Preštudujte si [Sprievodcu nasadzovaním AI modelov](ai-model-deployment.md)** pre najlepšie praktiky nasadzovania
2. **Dokončite [Produkčné AI praktiky](production-ai-practices.md)** pre riešenia pripravené na podnikové prostredie
3. **Pripojte sa k [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** pre podporu komunity
4. **Odosielajte problémy** do [AZD GitHub repozitára](https://github.com/Azure/azure-dev) pre problémy špecifické pre AZD

## Zdroje

- [Riešenie problémov s Azure OpenAI službou](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Riešenie problémov s aplikáciami v kontajneroch](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Riešenie problémov s Azure AI vyhľadávaním](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Navigácia kapitolami:**
- **📚 Domov kurzu**: [AZD Pre začiatočníkov](../../README.md)
- **📖 Aktuálna kapitola**: Kapitola 7 - Riešenie problémov a ladenie
- **⬅️ Predchádzajúca**: [Sprievodca ladením](debugging.md)
- **➡️ Nasledujúca kapitola**: [Kapitola 8: Produkčné a podnikové vzory](../microsoft-foundry/production-ai-practices.md)
- **🤖 Súvisiace**: [Kapitola 2: Vývoj orientovaný na AI](../microsoft-foundry/microsoft-foundry-integration.md)
- [Riešenie problémov s Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->