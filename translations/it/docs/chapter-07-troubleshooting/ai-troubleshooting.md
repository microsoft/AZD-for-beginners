# Guida alla Risoluzione dei Problemi Specifica per l'AI

**Navigazione Capitolo:**
- **📚 Course Home**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 7 - Risoluzione dei problemi e debug
- **⬅️ Precedente**: [Debugging Guide](debugging.md)
- **➡️ Capitolo successivo**: [Capitolo 8: Modelli di produzione e aziendali](../chapter-08-production/production-ai-practices.md)
- **🤖 Correlato**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Questa guida completa alla risoluzione dei problemi affronta problemi comuni durante il deployment di soluzioni AI con AZD, fornendo soluzioni e tecniche di debug specifiche per i servizi Azure AI.

## Indice

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#azure-ai-search-problems)
- [Container Apps Deployment Issues](#container-apps-deployment-issues)
- [Authentication and Permission Errors](#authentication-and-permission-errors)
- [Model Deployment Failures](#model-deployment-failures)
- [Performance and Scaling Issues](#performance-and-scaling-issues)
- [Cost and Quota Management](#cost-and-quota-management)
- [Debugging Tools and Techniques](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service Issues

### Problema: Servizio OpenAI non disponibile nella regione

**Sintomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Cause:**
- Microsoft Foundry Models non disponibile nella regione selezionata
- Quota esaurita nelle regioni preferite
- Vincoli di capacità regionali

**Soluzioni:**

1. **Verifica disponibilità della regione:**
```bash
# Elenca le regioni disponibili per OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Aggiorna la configurazione AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Usa regioni alternative:**
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

### Problema: Quota di distribuzione del modello superata

**Sintomi:**
```
Error: Deployment failed due to insufficient quota
```

**Soluzioni:**

1. **Controlla la quota corrente:**
```bash
# Controlla l'utilizzo della quota
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Richiedi aumento della quota:**
```bash
# Invia richiesta di aumento della quota
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Ottimizza la capacità del modello:**
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

### Problema: Versione API non valida

**Sintomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluzioni:**

1. **Usa una versione API supportata:**
```python
# Usa l'ultima versione supportata
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Verifica la compatibilità della versione API:**
```bash
# Elenca le versioni API supportate
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Problema: Livello di prezzo del servizio di ricerca insufficiente

**Sintomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluzioni:**

1. **Aggiorna il livello di prezzo:**
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

2. **Disabilita Semantic Search (sviluppo):**
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

### Problema: Creazione dell'indice fallita

**Sintomi:**
```
Error: Cannot create index, insufficient permissions
```

**Soluzioni:**

1. **Verifica le chiavi del servizio di ricerca:**
```bash
# Ottieni la chiave di amministrazione del servizio di ricerca
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Controlla lo schema dell'indice:**
```python
# Valida lo schema dell'indice
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

3. **Usa l'identità gestita:**
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

### Problema: Fallimenti nella build del container

**Sintomi:**
```
Error: Failed to build container image
```

**Soluzioni:**

1. **Controlla la sintassi del Dockerfile:**
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

2. **Valida le dipendenze:**
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

3. **Aggiungi un controllo di integrità:**
```python
# Aggiungi endpoint per il controllo dello stato
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Errori all'avvio dell'app Container

**Sintomi:**
```
Error: Container failed to start within timeout period
```

**Soluzioni:**

1. **Aumenta il timeout di avvio:**
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

2. **Ottimizza il caricamento del modello:**
```python
# Caricare i modelli su richiesta per ridurre il tempo di avvio
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
        # Inizializzare il client AI qui
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Avvio
    app.state.model_manager = ModelManager()
    yield
    # Arresto
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Problema: Permesso negato all'identità gestita

**Sintomi:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluzioni:**

1. **Verifica le assegnazioni di ruolo:**
```bash
# Verifica le assegnazioni di ruolo correnti
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Assegna i ruoli richiesti:**
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

3. **Testa l'autenticazione:**
```python
# Test dell'autenticazione con identità gestita
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

### Problema: Accesso a Key Vault negato

**Sintomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluzioni:**

1. **Concedi autorizzazioni a Key Vault:**
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

2. **Usa RBAC invece delle politiche di accesso:**
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

### Problema: Versione del modello non disponibile

**Sintomi:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluzioni:**

1. **Controlla i modelli disponibili:**
```bash
# Elenca i modelli disponibili
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Usa modelli di fallback:**
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

3. **Valida il modello prima della distribuzione:**
```python
# Validazione del modello prima della messa in produzione
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

### Problema: Risposte ad alta latenza

**Sintomi:**
- Tempi di risposta > 30 secondi
- Errori di timeout
- Scarsa esperienza utente

**Soluzioni:**

1. **Implementa timeout per le richieste:**
```python
# Configura timeout appropriati
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

2. **Aggiungi caching delle risposte:**
```python
# Cache Redis per le risposte
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

3. **Configura l'auto-scaling:**
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

### Problema: Errori di esaurimento della memoria

**Sintomi:**
```
Error: Container killed due to memory limit exceeded
```

**Soluzioni:**

1. **Aumenta l'allocazione della memoria:**
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

2. **Ottimizza l'uso della memoria:**
```python
# Gestione del modello efficiente in termini di memoria
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Controllare l'utilizzo della memoria prima dell'elaborazione
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Forzare la raccolta della memoria
            
        result = await self._process_ai_request(request)
        
        # Ripulire dopo l'elaborazione
        gc.collect()
        return result
```

## Cost and Quota Management

### Problema: Costi elevati imprevisti

**Sintomi:**
- Fattura Azure più alta del previsto
- Utilizzo dei token superiore alle stime
- Avvisi di budget attivati

**Soluzioni:**

1. **Implementa controlli dei costi:**
```python
# Tracciamento dell'utilizzo dei token
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

2. **Configura avvisi sui costi:**
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

3. **Ottimizza la selezione del modello:**
```python
# Selezione del modello consapevole dei costi
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

## Debugging Tools and Techniques

### Comandi AZD per il debug

```bash
# Abilita la registrazione dettagliata
azd up --debug

# Controlla lo stato della distribuzione
azd show

# Visualizza i log dell'applicazione (apre la dashboard di monitoraggio)
azd monitor --logs

# Visualizza le metriche in tempo reale
azd monitor --live

# Controlla le variabili d'ambiente
azd env get-values
```

### Comandi dell'estensione AZD AI per la diagnostica

Se hai distribuito agenti usando `azd ai agent init`, questi strumenti aggiuntivi sono disponibili:

```bash
# Assicurati che l'estensione degli agenti sia installata
azd extension install azure.ai.agents

# Reinizializza o aggiorna un agente da un manifesto
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Usa il server MCP per consentire agli strumenti di IA di interrogare lo stato del progetto
azd mcp start

# Genera i file di infrastruttura per revisione e verifica
azd infra generate
```

> **Suggerimento:** Usa `azd infra generate` per scrivere l'IaC su disco in modo da poter ispezionare esattamente quali risorse sono state provisioning. Questo è prezioso quando si eseguono debug sui problemi di configurazione delle risorse. Consulta il [Riferimento CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per i dettagli completi.

### Debug dell'applicazione

1. **Logging strutturato:**
```python
import logging
import json

# Configura la registrazione strutturata per applicazioni di IA.
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

2. **Endpoint di controllo dello stato:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Verificare la connettività con OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Verificare il servizio di ricerca
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

3. **Monitoraggio delle prestazioni:**
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

## Codici di errore comuni e soluzioni

| Error Code | Description | Solution |
|------------|-------------|----------|
| 401 | Non autorizzato | Controlla le chiavi API e la configurazione dell'identità gestita |
| 403 | Forbidden | Verifica le assegnazioni RBAC di ruolo |
| 429 | Rate Limited | Implementa logica di ritentativo con backoff esponenziale |
| 500 | Internal Server Error | Controlla lo stato della distribuzione del modello e i log |
| 503 | Service Unavailable | Verifica lo stato del servizio e la disponibilità regionale |

## Prossimi passi

1. **Rivedi la [Guida alla distribuzione dei modelli AI](../chapter-02-ai-development/ai-model-deployment.md)** per le best practice di deployment
2. **Completa [Pratiche AI per la produzione](../chapter-08-production/production-ai-practices.md)** per soluzioni pronte per l'azienda
3. **Unisciti al [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** per supporto dalla community
4. **Invia issue** al [repository AZD su GitHub](https://github.com/Azure/azure-dev) per problemi specifici di AZD

## Risorse

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installa competenze di risoluzione problemi Azure nel tuo editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione Capitolo:**
- **📚 Course Home**: [AZD per principianti](../../README.md)
- **📖 Capitolo corrente**: Capitolo 7 - Risoluzione dei problemi e debug
- **⬅️ Precedente**: [Debugging Guide](debugging.md)
- **➡️ Capitolo successivo**: [Capitolo 8: Modelli di produzione e aziendali](../chapter-08-production/production-ai-practices.md)
- **🤖 Correlato**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Riferimento**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione basato su IA [Co-op Translator](https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua originale deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->