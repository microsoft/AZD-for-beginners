# Guida Specifica alla Risoluzione dei Problemi AI

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 7 - Risoluzione dei Problemi e Debug
- **⬅️ Precedente**: [Guida al Debug](debugging.md)
- **➡️ Capitolo Successivo**: [Capitolo 8: Modelli di Produzione e Aziendali](../chapter-08-production/production-ai-practices.md)
- **🤖 Correlati**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)

Questa guida completa alla risoluzione dei problemi affronta problemi comuni nel distribuire soluzioni AI con AZD, fornendo soluzioni e tecniche di debug specifiche per i servizi Azure AI.

> **Ambito:** I comandi usano nomi di risorse d'esempio; sostituiscili e seleziona la sottoscrizione corretta. I blocchi Bicep sono frammenti da unire a un modello esistente, non deployment standalone. I frammenti Python richiedono gli SDK indicati e la configurazione dell'applicazione. Non è stata eseguita nessuna distribuzione live di Azure per questa revisione.

## Indice

- [Problemi con il Servizio Modelli Microsoft Foundry](#microsoft-foundry-models-service-issues)
- [Problemi con Azure AI Search](#azure-ai-search-problems)
- [Problemi di Distribuzione con Container Apps](#container-apps-deployment-issues)
- [Errori di Autenticazione e Permessi](#authentication-and-permission-errors)
- [Fallimenti nella Distribuzione del Modello](#model-deployment-failures)
- [Problemi di Prestazioni e Scalabilità](#performance-and-scaling-issues)
- [Gestione dei Costi e Quota](#cost-and-quota-management)
- [Strumenti e Tecniche di Debug](#debugging-tools-and-techniques)

## Problemi con il Servizio Modelli Microsoft Foundry

### Problema: Servizio OpenAI Non Disponibile nella Regione

**Sintomi:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Cause:**
- I modelli Microsoft Foundry non sono disponibili nella regione selezionata
- Quota esaurita nelle regioni preferite
- Vincoli di capacità regionale

**Soluzioni:**

1. **Controlla la Disponibilità della Regione:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Aggiorna la Configurazione AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Usa Regioni Alternative:**
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

### Problema: Quota di Distribuzione del Modello Superata

**Sintomi:**
```
Error: Deployment failed due to insufficient quota
```

**Soluzioni:**

1. **Controlla la Quota Attuale:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Richiedi Aumento della Quota:**
Usa il flusso di gestione quota del portale Foundry per la sottoscrizione, regione, modello e tipo di distribuzione interessati. Consulta la [guida ufficiale alle quote](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Una richiesta di quota VM non incrementa la quota del modello.

3. **Ottimizza la Capacità del Modello:**
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

### Problema: Versione API Non Valida

**Sintomi:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Soluzioni:**

1. **Usa una Versione API Supportata:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Controlla la Compatibilità della Versione API:**
Consulta la [riferimento sul ciclo di vita API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Le versioni API del provider risorse ARM **non** elencano le versioni API del piano dati/inferenza. I nuovi client v1 usano `/openai/v1/` senza un `api-version` datato; non mescolare le due configurazioni client.

## Problemi con Azure AI Search

### Problema: Piano Tariffario del Servizio Search Insufficiente

**Sintomi:**
```
Error: Semantic search requires Basic tier or higher
```

**Soluzioni:**

1. **Usa un Piano Tariffario Supportato:**

Il ranker semantico richiede Basic o superiore. Passare da Free/Basic a un piano differente può richiedere la creazione di un nuovo servizio search e la ricostruzione degli indici; modificare uno SKU non garantisce un aggiornamento in loco.
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

2. **Disabilita Semantic Search (Sviluppo):**
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

### Problema: Fallimenti nella Creazione dell'Indice

**Sintomi:**
```
Error: Cannot create index, insufficient permissions
```

**Soluzioni:**

1. **Verifica le Chiavi del Servizio Search:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Controlla lo Schema dell'Indice:**
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

3. **Usa Identità Gestita:**
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

## Problemi di Distribuzione delle Container Apps

### Problema: Fallimenti nella Build del Container

**Sintomi:**
```
Error: Failed to build container image
```

**Soluzioni:**

1. **Controlla la Sintassi del Dockerfile:**
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

2. **Valida le Dipendenze:**
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

3. **Aggiungi un Health Check:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problema: Fallimenti nell'Avvio della Container App

**Sintomi:**
```
Error: Container failed to start within timeout period
```

**Soluzioni:**

1. **Aumenta il Timeout di Avvio:**
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

2. **Ottimizza il Caricamento del Modello:**
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

## Errori di Autenticazione e Permessi

### Problema: Permesso Negato a Identità Gestita

**Sintomi:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Soluzioni:**

1. **Verifica le Assegnazioni di Ruolo:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Assegna i Ruoli Necessari:**
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

3. **Testa l'Autenticazione:**
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

L'acquisizione del token dimostra l'autenticazione, non il permesso di invocare un modello. Testa l'operazione prevista separatamente. Localmente, `DefaultAzureCredential` può usare le credenziali dello sviluppatore; in Azure, verifica che l'identità gestita prevista sia selezionata.

### Problema: Accesso Negato a Key Vault

**Sintomi:**
```
Error: The user, group or application does not have secrets get permission
```

**Soluzioni:**

1. **Concedi Permessi al Key Vault:**

Usa il frammento della policy di accesso seguente solo per un vault con `enableRbacAuthorization: false`. Per un vault abilitato a RBAC, usa l'opzione 2; aggiungere una policy di accesso non garantisce l'accesso al piano dati in modalità RBAC.
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

2. **Usa RBAC invece delle Policy di Accesso:**

Il vault deve avere `enableRbacAuthorization: true`; cambiare modelli di permessi richiede una migrazione pianificata degli accessi esistenti.
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

## Fallimenti nella Distribuzione del Modello

### Problema: Versione del Modello Non Disponibile

**Sintomi:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Soluzioni:**

1. **Controlla i Modelli Disponibili:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Seleziona Esplicitamente un Modello Disponibile:**
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

3. **Valida il Modello Prima della Distribuzione:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Problemi di Prestazioni e Scalabilità

### Problema: Risposte ad Alta Latenza

**Sintomi:**
- Tempi di risposta > 30 secondi
- Errori di timeout
- Esperienza utente scadente

**Soluzioni:**

1. **Implementa Timeout per le Richieste:**
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

2. **Aggiungi Cache delle Risposte:**
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

3. **Configura l'Auto-scaling:**
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

### Problema: Errori di Memoria Esaurita

**Sintomi:**
```
Error: Container killed due to memory limit exceeded
```

**Soluzioni:**

1. **Aumenta l'Allocazione di Memoria:**
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

2. **Ottimizza l'Uso della Memoria:**
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

## Gestione di Costi e Quota

### Problema: Costi Inaspettatamente Elevati

**Sintomi:**
- Fattura Azure più alta del previsto
- Uso di token superiore alle stime
- Avvisi di budget attivati

**Soluzioni:**

1. **Implementa Controlli di Costo:**
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

Questo contatore in memoria è illustrativo, non un controllo di spesa mensile: si resetta al riavvio, non è condiviso tra repliche, e controlla l'uso solo dopo una chiamata. Un vero limite richiede contabilità duratura, prenotazioni a prova di concorrenza prima delle richieste, e una politica di reset mensile. Le metriche di memoria del container devono anche considerare i limiti cgroup; `psutil.virtual_memory()` non è una misura affidabile del limite container, e la garbage collection non applica un tetto alla memoria.

2. **Imposta Avvisi di Costo:**
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

Dichiara `budgetStartDate` e `budgetEndDate` nel tuo modello. I budget notificano; non bloccano risorse né impongono un limite di spesa rigido.

3. **Ottimizza la Selezione del Modello:**
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

## Strumenti e Tecniche di Debug

### Comandi AZD di Debug

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

### Comandi Estensione AI AZD per la Diagnostica

Se hai distribuito agenti usando `azd ai agent init`, sono disponibili questi strumenti aggiuntivi:

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

> **Suggerimento:** Usa `azd infra generate` per scrivere IaC su disco così puoi ispezionare esattamente quali risorse sono state provisionate. Questo è inestimabile quando si effettua il debug di problemi di configurazione delle risorse. Consulta la [riferimento AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) per i dettagli completi.

**Diagnostica del flusso di lavoro GA (2026-11-09):** Verifica che `azd version` sia almeno 1.37.0 e ispeziona `azd ext list --installed`. Aggiorna prima la CLI core con `azd update` o il suo installer, poi aggiorna il bundle con `azd ext upgrade microsoft.foundry`. Per fallimenti locali, controlla l'uv corrente, Python 3.13+ per il campione base, `PYTHONNOUSERSITE: "1"` nella sua configurazione di servizio, e le credenziali Azure usate da `DefaultAzureCredential`. Tieni `azd ai agent run` in esecuzione durante l'invocazione di `--local` da un secondo terminale nella directory del progetto.

Il successo del provisioning non prova che lo sviluppatore abbia accesso al piano dati. Rivedi gli avvisi RBAC e la [matrice dei permessi degli agenti ospitati](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Un timeout non stabilisce la mancata distribuzione: ispeziona la versione tentata e i log prima di ritentare. Gli agenti precedenti beta.23 hanno migliorato questi avvisi e l'output A2A; queste correzioni storiche sono descritte nelle [note di rilascio](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), non è necessario installare quella beta.

Se `azd ai eval` non è disponibile, installa `azure.ai.evaluations` separatamente; il bundle GA non lo include. Se il comando agent-evaluation di un tutorial più vecchio stampa solo la guida alla migrazione, usa il flusso di lavoro separato `azd ai eval`. La funzionalità di ottimizzazione `--config` non accetta più file di valutazione legacy. Consulta [migrazione della valutazione](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) e [migrazione dell'ottimizzazione](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Debug dell'Applicazione

1. **Logging Strutturato:**
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

2. **Endpoint di Health Check:**
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

3. **Monitoraggio delle Prestazioni:**
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

## Codici di Errore Comuni e Soluzioni

| Codice Errore | Descrizione | Soluzione |
|------------|-------------|----------|
| 401 | Non Autorizzato | Controlla le chiavi API e la configurazione dell'identità gestita |
| 403 | Vietato | Verifica le assegnazioni di ruolo RBAC |
| 429 | Limitazione Rate | Implementa logica di ritentativo con backoff esponenziale |
| 500 | Errore Interno del Server | Controlla stato e log della distribuzione del modello |
| 503 | Servizio Non Disponibile | Verifica lo stato di salute del servizio e la disponibilità regionale |

## Passi Successivi

1. **Rivedi la [Guida al Deployment di Modelli AI](../chapter-02-ai-development/ai-model-deployment.md)** per le best practice di distribuzione
2. **Completa le [Pratiche AI di Produzione](../chapter-08-production/production-ai-practices.md)** per soluzioni pronte per l'azienda
3. **Unisciti al [Discord Microsoft Foundry](https://aka.ms/foundry/discord)** per supporto dalla comunità
4. **Invia issue** al [repository AZD GitHub](https://github.com/Azure/azure-dev) per problemi specifici di AZD

## Risorse

- [Risoluzione problemi quota e throttling Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Risoluzione problemi Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Risoluzione problemi Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Skill Diagnostiche Agente Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installa skill di risoluzione problemi Azure nel tuo editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Navigazione del Capitolo:**
- **📚 Home del Corso**: [AZD Per Principianti](../../README.md)
- **📖 Capitolo Corrente**: Capitolo 7 - Risoluzione dei Problemi e Debug
- **⬅️ Precedente**: [Guida al Debug](debugging.md)
- **➡️ Capitolo Successivo**: [Capitolo 8: Modelli di Produzione e Aziendali](../chapter-08-production/production-ai-practices.md)
- **🤖 Correlati**: [Capitolo 2: Sviluppo AI-First](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Riferimento**: [Risoluzione Problemi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->