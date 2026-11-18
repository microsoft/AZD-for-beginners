# KI-spezifischer Leitfaden zur Fehlerbehebung

**Kapitel-Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges**: [Debugging-Leitfaden](debugging.md)
- **➡️ Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../chapter-08-production/production-ai-practices.md)
- **🤖 Verwandt**: [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)

Dieser umfassende Leitfaden zur Fehlerbehebung behandelt häufige Probleme bei der Bereitstellung von KI-Lösungen mit AZD und bietet Lösungen sowie Debugging-Techniken, die speziell für Azure KI-Dienste gelten.

> **Anwendungsbereich:** Befehle verwenden beispielhafte Ressourcennamen; ersetzen Sie diese und wählen Sie das korrekte Abonnement aus. Bicep-Blöcke sind Fragmente zum Einfügen in eine vorhandene Vorlage, keine eigenständigen Deployments. Python-Snippets benötigen die angegebenen SDKs und Anwendungskonfiguration. Für diese Überprüfung wurde keine Live-Bereitstellung in Azure durchgeführt.

## Inhaltsverzeichnis

- [Microsoft Foundry Models Service-Probleme](#microsoft-foundry-models-service-issues)
- [Azure AI Search Probleme](#azure-ai-search-problems)
- [Container Apps Bereitstellungsprobleme](#container-apps-deployment-issues)
- [Authentifizierungs- und Berechtigungsfehler](#authentication-and-permission-errors)
- [Model-Bereitstellungsfehler](#model-deployment-failures)
- [Leistungs- und Skalierungsprobleme](#performance-and-scaling-issues)
- [Kosten- und Kontingentverwaltung](#cost-and-quota-management)
- [Debugging-Werkzeuge und Techniken](#debugging-tools-and-techniques)

## Microsoft Foundry Models Service-Probleme

### Problem: OpenAI-Dienst in Region nicht verfügbar

**Symptome:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Ursachen:**
- Microsoft Foundry Models in der ausgewählten Region nicht verfügbar
- Kontingent in bevorzugten Regionen erschöpft
- Regionale Kapazitätsbeschränkungen

**Lösungen:**

1. **Verfügbarkeit der Region prüfen:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **AZD-Konfiguration aktualisieren:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Alternative Regionen verwenden:**
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

### Problem: Model-Bereitstellungskontingent überschritten

**Symptome:**
```
Error: Deployment failed due to insufficient quota
```

**Lösungen:**

1. **Aktuelles Kontingent prüfen:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Kontingenterhöhung anfordern:**
Verwenden Sie den Kontingentverwaltungs-Workflow im Foundry-Portal für das betroffene Abonnement, die Region, das Modell und den Bereitstellungstyp. Siehe die [offizielle Kontingentanleitung](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Eine VM-Kontingentanfrage erhöht nicht das Modellkontingent.

3. **Modellkapazität optimieren:**
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

### Problem: Ungültige API-Version

**Symptome:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Lösungen:**

1. **Unterstützte API-Version verwenden:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **API-Versionskompatibilität prüfen:**
Prüfen Sie die [Azure OpenAI API Lifecycle Referenz](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). ARM Resource-Provider API-Versionen listen **nicht** die Inference-/Datenebenen-API-Versionen auf. Neue v1-Clients verwenden `/openai/v1/` ohne datierte `api-version`; mischen Sie nicht beide Clientkonfigurationen.

## Azure AI Search Probleme

### Problem: Unzureichendes Preismodell für Suchdienst

**Symptome:**
```
Error: Semantic search requires Basic tier or higher
```

**Lösungen:**

1. **Verwenden Sie ein unterstütztes Preismodell:**

Der semantische Ranker benötigt Basic oder höher. Der Wechsel von Free/Basic zu einem anderen Tarif erfordert möglicherweise die Erstellung eines neuen Suchdienstes und den Neuaufbau von Indizes; die Bearbeitung eines SKUs garantiert kein Upgrade vor Ort.
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

2. **Semantische Suche deaktivieren (Entwicklung):**
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

### Problem: Fehler bei Indexerstellung

**Symptome:**
```
Error: Cannot create index, insufficient permissions
```

**Lösungen:**

1. **Überprüfen Sie die Schlüssel des Suchdienstes:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Überprüfen Sie das Indexschema:**
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

3. **Verwenden Sie eine Managed Identity:**
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

## Container Apps Bereitstellungsprobleme

### Problem: Fehler beim Container-Build

**Symptome:**
```
Error: Failed to build container image
```

**Lösungen:**

1. **Prüfen Sie die Dockerfile-Syntax:**
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

2. **Validieren Sie Abhängigkeiten:**
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

3. **Fügen Sie einen Health Check hinzu:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Startfehler bei Container Apps

**Symptome:**
```
Error: Container failed to start within timeout period
```

**Lösungen:**

1. **Start-Timeout erhöhen:**
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

2. **Modell-Ladung optimieren:**
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

## Authentifizierungs- und Berechtigungsfehler

### Problem: Managed Identity Berechtigung verweigert

**Symptome:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Lösungen:**

1. **Rollenzuweisungen überprüfen:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Erforderliche Rollen zuweisen:**
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

3. **Authentifizierung testen:**
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

Tokenerwerb beweist Authentifizierung, nicht die Berechtigung, ein Modell aufzurufen. Testen Sie den vorgesehenen Vorgang separat. Lokal kann `DefaultAzureCredential` Entwickleranmeldedaten verwenden; in Azure überprüfen Sie, ob die richtige Managed Identity ausgewählt ist.

### Problem: Zugriff auf Key Vault verweigert

**Symptome:**
```
Error: The user, group or application does not have secrets get permission
```

**Lösungen:**

1. **Key Vault-Berechtigungen erteilen:**

Verwenden Sie das folgende Access-Policy-Fragment nur für ein Vault mit `enableRbacAuthorization: false`. Für ein RBAC-aktiviertes Vault verwenden Sie Option 2; eine Access Policy hinzuzufügen gewährt im RBAC-Modus keinen Datenzugriff.
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

2. **Verwenden Sie RBAC statt Access Policies:**

Das Vault muss `enableRbacAuthorization: true` haben; ein Wechsel des Berechtigungsmodells erfordert eine geplante Migration der bestehenden Zugriffe.
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

## Model-Bereitstellungsfehler

### Problem: Modellversion nicht verfügbar

**Symptome:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lösungen:**

1. **Verfügbare Modelle prüfen:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Explizit ein verfügbares Modell wählen:**
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

3. **Modell vor Bereitstellung validieren:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Leistungs- und Skalierungsprobleme

### Problem: Hohe Latenz bei Antworten

**Symptome:**
- Antwortzeiten > 30 Sekunden
- Timeout-Fehler
- Schlechte Benutzererfahrung

**Lösungen:**

1. **Request-Timeouts implementieren:**
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

2. **Antwort-Caching hinzufügen:**
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

3. **Auto-Skalierung konfigurieren:**
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

### Problem: Speicherfehler (Out of Memory)

**Symptome:**
```
Error: Container killed due to memory limit exceeded
```

**Lösungen:**

1. **Speicherzuweisung erhöhen:**
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

2. **Speichernutzung optimieren:**
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

## Kosten- und Kontingentverwaltung

### Problem: Unerwartet hohe Kosten

**Symptome:**
- Azure-Rechnung höher als erwartet
- Tokenverbrauch übersteigt Schätzungen
- Budgetwarnungen ausgelöst

**Lösungen:**

1. **Kostenkontrollen implementieren:**
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

Dieser In-Memory-Zähler ist illustrativ, keine monatliche Kostenkontrolle: er setzt sich bei Neustart zurück, wird nicht über Replikate geteilt und prüft Nutzung nur nach einem Aufruf. Ein echtes Limit benötigt dauerhafte Buchhaltung, nebenläufigkeits-sichere Reservierungen vor Anfragen und eine monatliche Rücksetzpolitik. Container-Speichermetriken müssen auch cgroup-Limits berücksichtigen; `psutil.virtual_memory()` ist kein verlässliches Container-Limit-Maß, und Garbage Collection erzwingt keine Speicherobergrenze.

2. **Kostenwarnungen einrichten:**
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

Deklarieren Sie `budgetStartDate` und `budgetEndDate` in Ihrer Vorlage. Budgets benachrichtigen, stoppen keine Ressourcen und setzen keine harte Ausgabengrenze durch.

3. **Modellauswahl optimieren:**
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

## Debugging-Werkzeuge und -Techniken

### AZD-Debugging-Befehle

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

### AZD KI-Erweiterungsbefehle für Diagnosen

Wenn Sie Agents mit `azd ai agent init` bereitgestellt haben, stehen diese zusätzlichen Werkzeuge zur Verfügung:

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

> **Tipp:** Verwenden Sie `azd infra generate`, um IaC auf Datenträger zu schreiben, damit Sie genau prüfen können, welche Ressourcen bereitgestellt wurden. Dies ist bei der Fehlerbehebung von Ressourcenkonfigurationen unbezahlbar. Siehe die [AZD KI CLI Referenz](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) für vollständige Details.

**GA-Workflow-Diagnosen (2026-11-09):** Vergewissern Sie sich, dass `azd version` mindestens 1.37.0 ist, und prüfen Sie `azd ext list --installed`. Aktualisieren Sie zuerst die Core-CLI mit `azd update` oder dem Installer, dann das Bundle mit `azd ext upgrade microsoft.foundry`. Bei lokalen Fehlern prüfen Sie aktuelle uv, Python 3.13+ für das Basissample, `PYTHONNOUSERSITE: "1"` in der Dienstkonfiguration und die Azure-Anmeldeinformationen, die von `DefaultAzureCredential` genutzt werden. Halten Sie `azd ai agent run` aktiv, während Sie `--local` aus einem zweiten Terminal im Projektverzeichnis aufrufen.

Erfogreiche Bereitstellung beweist nicht, dass der Entwickler Datenebenenzugriff hat. Überprüfen Sie RBAC-Warnungen und die [Host-Agent-Berechtigungsmatrix](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Ein Timeout bedeutet nicht unbedingt einen Bereitstellungsfehler: Prüfen Sie die versuchte Version und Logs vor einem erneuten Versuch. Frühere Agents beta.23 verbesserten diese Warnungen und A2A-Ausgabe; diese historischen Fixes sind in den [Release Notes](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes) beschrieben, nicht als Voraussetzung zur Installation dieser Beta.

Ist `azd ai eval` nicht vorhanden, installieren Sie `azure.ai.evaluations` separat; das GA-Bundle enthält es nicht. Wenn der Agent-Evaluierungsbefehl eines älteren Tutorials nur Migrationshinweise ausgibt, verwenden Sie den separaten `azd ai eval`-Workflow. Die Optimierungs-`--config` akzeptiert keine Legacy-Evaluierungsdateien mehr. Siehe [Evaluation Migration](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) und [Optimization Migration](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Anwendung Debugging

1. **Strukturiertes Logging:**
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

2. **Health Check Endpunkte:**
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

3. **Leistungsüberwachung:**
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

## Häufige Fehlercodes und Lösungen

| Fehlercode | Beschreibung | Lösung |
|------------|-------------|----------|
| 401 | Nicht autorisiert | Überprüfen Sie API-Schlüssel und Managed Identity-Konfiguration |
| 403 | Verboten | Überprüfen Sie RBAC-Rollenzuweisungen |
| 429 | Drosselung | Implementieren Sie Wiederholungslogik mit exponentiellem Backoff |
| 500 | Interner Serverfehler | Überprüfen Sie Status und Logs der Modelbereitstellung |
| 503 | Dienst nicht verfügbar | Prüfen Sie Dienststatus und regionale Verfügbarkeit |

## Nächste Schritte

1. **Überprüfen Sie den [Leitfaden zur KI-Modellbereitstellung](../chapter-02-ai-development/ai-model-deployment.md)** für bewährte Deployment-Praktiken
2. **Absolvieren Sie die [Produktions-KI-Praktiken](../chapter-08-production/production-ai-practices.md)** für unternehmensfertige Lösungen
3. **Treten Sie dem [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** für Community-Support bei
4. **Melden Sie Probleme** im [AZD GitHub-Repository](https://github.com/Azure/azure-dev) für AZD-spezifische Probleme

## Ressourcen

- [Azure OpenAI Kontingent- und Drosselungs-Fehlerbehebung](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Container Apps Fehlerbehebung](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Fehlerbehebung](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Azure Diagnostics Agent Skill**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Installieren Sie Azure-Fehlerbehebungsfunktionen in Ihrem Editor: `npx skills add microsoft/github-copilot-for-azure`

---

**Kapitel-Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges**: [Debugging-Leitfaden](debugging.md)
- **➡️ Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../chapter-08-production/production-ai-practices.md)
- **🤖 Verwandt**: [Kapitel 2: KI-zentrierte Entwicklung](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Referenz**: [Azure Developer CLI Fehlerbehebung](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->