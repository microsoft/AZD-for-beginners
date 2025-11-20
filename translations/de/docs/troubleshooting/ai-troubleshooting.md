<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b5ae13b6a245ab3a2e6dae923aab65bd",
  "translation_date": "2025-11-19T22:59:37+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "de"
}
-->
# AI-spezifischer Leitfaden zur Fehlerbehebung

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges Kapitel**: [Debugging-Leitfaden](debugging.md)
- **➡️ Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../microsoft-foundry/production-ai-practices.md)
- **🤖 Verwandtes Kapitel**: [Kapitel 2: AI-First Entwicklung](../microsoft-foundry/microsoft-foundry-integration.md)

**Vorheriges Kapitel:** [Produktions-AI-Praktiken](../microsoft-foundry/production-ai-practices.md) | **Nächstes Kapitel:** [Erste Schritte mit AZD](../getting-started/README.md)

Dieser umfassende Leitfaden zur Fehlerbehebung behandelt häufige Probleme bei der Bereitstellung von KI-Lösungen mit AZD und bietet spezifische Lösungen und Debugging-Techniken für Azure AI-Dienste.

## Inhaltsverzeichnis

- [Probleme mit Azure OpenAI Service](../../../../docs/troubleshooting)
- [Probleme mit Azure AI Search](../../../../docs/troubleshooting)
- [Probleme bei der Bereitstellung von Container-Apps](../../../../docs/troubleshooting)
- [Authentifizierungs- und Berechtigungsfehler](../../../../docs/troubleshooting)
- [Fehler bei der Modellbereitstellung](../../../../docs/troubleshooting)
- [Leistungs- und Skalierungsprobleme](../../../../docs/troubleshooting)
- [Kosten- und Kontingentmanagement](../../../../docs/troubleshooting)
- [Debugging-Tools und -Techniken](../../../../docs/troubleshooting)

## Probleme mit Azure OpenAI Service

### Problem: OpenAI Service in Region nicht verfügbar

**Symptome:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Ursachen:**
- Azure OpenAI ist in der ausgewählten Region nicht verfügbar
- Kontingent in bevorzugten Regionen erschöpft
- Regionale Kapazitätsbeschränkungen

**Lösungen:**

1. **Verfügbarkeit der Region prüfen:**
```bash
# Verfügbare Regionen für OpenAI auflisten
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **AZD-Konfiguration aktualisieren:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Alternative Regionen nutzen:**
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

### Problem: Modellbereitstellungs-Kontingent überschritten

**Symptome:**
```
Error: Deployment failed due to insufficient quota
```

**Lösungen:**

1. **Aktuelles Kontingent prüfen:**
```bash
# Überprüfen Sie die Quota-Nutzung
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Kontingenterhöhung beantragen:**
```bash
# Anfrage zur Erhöhung des Kontingents einreichen
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Modellkapazität optimieren:**
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

### Problem: Ungültige API-Version

**Symptome:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Lösungen:**

1. **Unterstützte API-Version verwenden:**
```python
# Verwenden Sie die neueste unterstützte Version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **API-Version-Kompatibilität prüfen:**
```bash
# Unterstützte API-Versionen auflisten
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Probleme mit Azure AI Search

### Problem: Preisstufe des Suchdienstes unzureichend

**Symptome:**
```
Error: Semantic search requires Basic tier or higher
```

**Lösungen:**

1. **Preisstufe upgraden:**
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

### Problem: Fehler bei der Indexerstellung

**Symptome:**
```
Error: Cannot create index, insufficient permissions
```

**Lösungen:**

1. **Suchdienst-Schlüssel überprüfen:**
```bash
# Abrufen des Administratorschlüssels für den Suchdienst
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Indexschema prüfen:**
```python
# Indexschema validieren
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

3. **Verwaltete Identität verwenden:**
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

## Probleme bei der Bereitstellung von Container-Apps

### Problem: Fehler beim Container-Build

**Symptome:**
```
Error: Failed to build container image
```

**Lösungen:**

1. **Dockerfile-Syntax überprüfen:**
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

2. **Abhängigkeiten validieren:**
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

3. **Health-Check hinzufügen:**
```python
# main.py - Fügen Sie einen Health-Check-Endpunkt hinzu
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Problem: Fehler beim Starten der Container-App

**Symptome:**
```
Error: Container failed to start within timeout period
```

**Lösungen:**

1. **Startzeitlimit erhöhen:**
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

2. **Modell-Ladevorgang optimieren:**
```python
# Modelle verzögert laden, um die Startzeit zu verkürzen
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
        # KI-Client hier initialisieren
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Start
    app.state.model_manager = ModelManager()
    yield
    # Herunterfahren
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentifizierungs- und Berechtigungsfehler

### Problem: Berechtigung für verwaltete Identität verweigert

**Symptome:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Lösungen:**

1. **Rollen-Zuweisungen überprüfen:**
```bash
# Überprüfen Sie die aktuellen Rollen zuweisungen
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
# Testen Sie die Authentifizierung der verwalteten Identität
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

### Problem: Zugriff auf Key Vault verweigert

**Symptome:**
```
Error: The user, group or application does not have secrets get permission
```

**Lösungen:**

1. **Key Vault-Berechtigungen gewähren:**
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

2. **RBAC anstelle von Zugriffsrichtlinien verwenden:**
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

## Fehler bei der Modellbereitstellung

### Problem: Modellversion nicht verfügbar

**Symptome:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Lösungen:**

1. **Verfügbare Modelle prüfen:**
```bash
# Verfügbare Modelle auflisten
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Modell-Fallbacks verwenden:**
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

3. **Modell vor der Bereitstellung validieren:**
```python
# Validierung des Modells vor der Bereitstellung
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

## Leistungs- und Skalierungsprobleme

### Problem: Hohe Antwortlatenz

**Symptome:**
- Antwortzeiten > 30 Sekunden
- Timeout-Fehler
- Schlechte Benutzererfahrung

**Lösungen:**

1. **Anfrage-Timeouts implementieren:**
```python
# Konfigurieren Sie die richtigen Zeitüberschreitungen
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
# Redis-Cache für Antworten
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

### Problem: Speicherfehler

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
# Speicher-effiziente Modellverwaltung
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Speicherverbrauch vor der Verarbeitung überprüfen
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Garbage Collection erzwingen
            
        result = await self._process_ai_request(request)
        
        # Nach der Verarbeitung aufräumen
        gc.collect()
        return result
```

## Kosten- und Kontingentmanagement

### Problem: Unerwartet hohe Kosten

**Symptome:**
- Azure-Rechnung höher als erwartet
- Token-Nutzung übersteigt Schätzungen
- Budgetwarnungen ausgelöst

**Lösungen:**

1. **Kostenkontrollen implementieren:**
```python
# Verfolgung der Token-Nutzung
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

2. **Kostenwarnungen einrichten:**
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

3. **Modellauswahl optimieren:**
```python
# Kostenbewusste Modellauswahl
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # pro 1K Tokens
    'gpt-4': 0.03,          # pro 1K Tokens
    'gpt-35-turbo': 0.0015  # pro 1K Tokens
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

## Debugging-Tools und -Techniken

### AZD-Debugging-Befehle

```bash
# Aktivieren Sie ausführliches Logging
azd up --debug

# Überprüfen Sie den Bereitstellungsstatus
azd show

# Bereitstellungsprotokolle anzeigen
azd logs --follow

# Überprüfen Sie Umgebungsvariablen
azd env get-values
```

### Anwendung-Debugging

1. **Strukturiertes Logging:**
```python
import logging
import json

# Konfigurieren Sie strukturiertes Logging für KI-Anwendungen
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

2. **Health-Check-Endpunkte:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Überprüfen Sie die OpenAI-Konnektivität
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Überprüfen Sie den Suchdienst
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
| 401 | Nicht autorisiert | API-Schlüssel und Konfiguration der verwalteten Identität überprüfen |
| 403 | Verboten | RBAC-Rollen-Zuweisungen überprüfen |
| 429 | Ratenbegrenzung | Retry-Logik mit exponentiellem Backoff implementieren |
| 500 | Interner Serverfehler | Status der Modellbereitstellung und Logs überprüfen |
| 503 | Dienst nicht verfügbar | Dienststatus und regionale Verfügbarkeit prüfen |

## Nächste Schritte

1. **Überprüfen Sie den [Leitfaden zur Modellbereitstellung](ai-model-deployment.md)** für Best Practices zur Bereitstellung
2. **Abschließen der [Produktions-AI-Praktiken](production-ai-practices.md)** für unternehmensgerechte Lösungen
3. **Treten Sie dem [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** für Community-Support bei
4. **Probleme melden** im [AZD GitHub-Repository](https://github.com/Azure/azure-dev) für AZD-spezifische Probleme

## Ressourcen

- [Azure OpenAI Service Fehlerbehebung](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Fehlerbehebung](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Fehlerbehebung](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Kapitelübersicht:**
- **📚 Kursübersicht**: [AZD für Anfänger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 7 - Fehlerbehebung & Debugging
- **⬅️ Vorheriges Kapitel**: [Debugging-Leitfaden](debugging.md)
- **➡️ Nächstes Kapitel**: [Kapitel 8: Produktions- & Unternehmensmuster](../microsoft-foundry/production-ai-practices.md)
- **🤖 Verwandtes Kapitel**: [Kapitel 2: AI-First Entwicklung](../microsoft-foundry/microsoft-foundry-integration.md)
- [Azure Developer CLI Fehlerbehebung](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->