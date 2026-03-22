# Οδηγός Αντιμετώπισης Προβλημάτων για AI

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Αντιμετώπιση & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Debugging Guide](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Σχετικό**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

Αυτός ο ολοκληρωμένος οδηγός αντιμετώπισης προβλημάτων καλύπτει κοινά ζητήματα κατά την ανάπτυξη λύσεων AI με AZD, παρέχοντας λύσεις και τεχνικές αποσφαλμάτωσης ειδικές για τις υπηρεσίες Azure AI.

## Πίνακας Περιεχομένων

- [Microsoft Foundry Models Service Issues](../../../../docs/chapter-07-troubleshooting)
- [Azure AI Search Problems](../../../../docs/chapter-07-troubleshooting)
- [Container Apps Deployment Issues](../../../../docs/chapter-07-troubleshooting)
- [Authentication and Permission Errors](../../../../docs/chapter-07-troubleshooting)
- [Model Deployment Failures](../../../../docs/chapter-07-troubleshooting)
- [Performance and Scaling Issues](../../../../docs/chapter-07-troubleshooting)
- [Cost and Quota Management](../../../../docs/chapter-07-troubleshooting)
- [Debugging Tools and Techniques](../../../../docs/chapter-07-troubleshooting)

## Microsoft Foundry Models Service Issues

### Issue: OpenAI Service Unavailable in Region

**Συμπτώματα:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Αιτίες:**
- Microsoft Foundry Models δεν είναι διαθέσιμο στην επιλεγμένη περιοχή
- Εξαντλήθηκε το όριο στις προτιμώμενες περιοχές
- Περιφερειακοί περιορισμοί χωρητικότητας

**Λύσεις:**

1. **Ελέγξτε τη διαθεσιμότητα της περιοχής:**
```bash
# Λίστα διαθέσιμων περιοχών για το OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Ενημερώστε τη ρύθμιση AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Χρησιμοποιήστε εναλλακτικές περιοχές:**
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

**Συμπτώματα:**
```
Error: Deployment failed due to insufficient quota
```

**Λύσεις:**

1. **Ελέγξτε το τρέχον όριο:**
```bash
# Ελέγξτε τη χρήση του ορίου
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Ζητήστε αύξηση ορίου:**
```bash
# Υποβάλετε αίτημα αύξησης ορίου
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Βελτιστοποιήστε τη χωρητικότητα του μοντέλου:**
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

### Issue: Invalid API Version

**Συμπτώματα:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Λύσεις:**

1. **Χρησιμοποιήστε υποστηριζόμενη έκδοση API:**
```python
# Χρησιμοποιήστε την πιο πρόσφατη υποστηριζόμενη έκδοση
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Ελέγξτε τη συμβατότητα της έκδοσης API:**
```bash
# Λίστα των υποστηριζόμενων εκδόσεων του API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Azure AI Search Problems

### Issue: Search Service Pricing Tier Insufficient

**Συμπτώματα:**
```
Error: Semantic search requires Basic tier or higher
```

**Λύσεις:**

1. **Αναβαθμίστε το επίπεδο τιμολόγησης:**
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

2. **Απενεργοποιήστε τη Σημασιολογική Αναζήτηση (Ανάπτυξη):**
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

**Συμπτώματα:**
```
Error: Cannot create index, insufficient permissions
```

**Λύσεις:**

1. **Επαληθεύστε τα κλειδιά υπηρεσίας αναζήτησης:**
```bash
# Λήψη κλειδιού διαχειριστή υπηρεσίας αναζήτησης
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Ελέγξτε το σχήμα ευρετηρίου:**
```python
# Επαλήθευση σχήματος δείκτη
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

3. **Χρησιμοποιήστε Διαχειριζόμενη Ταυτότητα:**
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

**Συμπτώματα:**
```
Error: Failed to build container image
```

**Λύσεις:**

1. **Ελέγξτε τη σύνταξη του Dockerfile:**
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

2. **Επικυρώστε τις εξαρτήσεις:**
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

3. **Προσθέστε έλεγχο υγείας:**
```python
# main.py - Προσθήκη endpoint για έλεγχο υγείας
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Issue: Container App Startup Failures

**Συμπτώματα:**
```
Error: Container failed to start within timeout period
```

**Λύσεις:**

1. **Αυξήστε το χρονικό όριο εκκίνησης:**
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

2. **Βελτιστοποιήστε τη φόρτωση μοντέλου:**
```python
# Φόρτωση μοντέλων κατά απαίτηση για μείωση του χρόνου εκκίνησης
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
        # Αρχικοποίηση του πελάτη AI εδώ
        pass

@asynccontextmanager
async def lifespan(app: FastAPI):
    # Εκκίνηση
    app.state.model_manager = ModelManager()
    yield
    # Τερματισμός
    pass

app = FastAPI(lifespan=lifespan)
```

## Authentication and Permission Errors

### Issue: Managed Identity Permission Denied

**Συμπτώματα:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Λύσεις:**

1. **Επαληθεύστε τις αναθέσεις ρόλων:**
```bash
# Ελέγξτε τις τρέχουσες αναθέσεις ρόλων
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Αναθέστε τους απαιτούμενους ρόλους:**
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

3. **Δοκιμάστε την αυθεντικοποίηση:**
```python
# Δοκιμή πιστοποίησης με διαχειριζόμενη ταυτότητα
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

**Συμπτώματα:**
```
Error: The user, group or application does not have secrets get permission
```

**Λύσεις:**

1. **Παραχωρήστε δικαιώματα Key Vault:**
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

2. **Χρησιμοποιήστε RBAC αντί για πολιτικές πρόσβασης:**
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

**Συμπτώματα:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Λύσεις:**

1. **Ελέγξτε τα διαθέσιμα μοντέλα:**
```bash
# Λίστα διαθέσιμων μοντέλων
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Χρησιμοποιήστε εναλλακτικά μοντέλα:**
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

3. **Επικυρώστε το μοντέλο πριν την ανάπτυξη:**
```python
# Επικύρωση μοντέλου πριν από την ανάπτυξη
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

**Συμπτώματα:**
- Χρόνοι απόκρισης > 30 δευτερόλεπτα
- Σφάλματα χρονικού ορίου
- Κακή εμπειρία χρήστη

**Λύσεις:**

1. **Υλοποιήστε χρονικά όρια αιτήσεων:**
```python
# Ρυθμίστε κατάλληλα χρονικά όρια
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

2. **Προσθέστε caching απαντήσεων:**
```python
# Κρυφή μνήμη Redis για απαντήσεις
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

3. **Διαμορφώστε αυτόματη κλιμάκωση:**
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

**Συμπτώματα:**
```
Error: Container killed due to memory limit exceeded
```

**Λύσεις:**

1. **Αυξήστε την κατανομή μνήμης:**
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

2. **Βελτιστοποιήστε τη χρήση μνήμης:**
```python
# Αποδοτική διαχείριση μνήμης μοντέλου
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
    async def process_request(self, request):
        """Process request with memory monitoring."""
        # Ελέγξτε τη χρήση μνήμης πριν από την επεξεργασία
        memory_percent = psutil.virtual_memory().percent
        if memory_percent > self.max_memory_percent:
            gc.collect()  # Αναγκαστική συλλογή απορριμμάτων
            
        result = await self._process_ai_request(request)
        
        # Καθαρισμός μετά την επεξεργασία
        gc.collect()
        return result
```

## Cost and Quota Management

### Issue: Unexpected High Costs

**Συμπτώματα:**
- Ο λογαριασμός Azure υψηλότερος από το αναμενόμενο
- Χρήση token που υπερβαίνει τις εκτιμήσεις
- Ενεργοποιήθηκαν ειδοποιήσεις προϋπολογισμού

**Λύσεις:**

1. **Εφαρμόστε περιορισμούς κόστους:**
```python
# Παρακολούθηση χρήσης tokens
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

2. **Ρυθμίστε ειδοποιήσεις κόστους:**
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

3. **Βελτιστοποιήστε την επιλογή μοντέλου:**
```python
# Επιλογή μοντέλου με επίγνωση κόστους
MODEL_COSTS = {
    'gpt-4.1-mini': 0.00015,  # ανά 1K tokens
    'gpt-4.1': 0.03,          # ανά 1K tokens
    'gpt-35-turbo': 0.0015  # ανά 1K tokens
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

### AZD Debugging Commands

```bash
# Ενεργοποιήστε λεπτομερή καταγραφή
azd up --debug

# Ελέγξτε την κατάσταση ανάπτυξης
azd show

# Δείτε τα αρχεία καταγραφής της εφαρμογής (ανοίγει τον πίνακα παρακολούθησης)
azd monitor --logs

# Δείτε ζωντανές μετρήσεις
azd monitor --live

# Ελέγξτε τις μεταβλητές περιβάλλοντος
azd env get-values
```

### AZD AI Extension Commands for Diagnostics

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# Βεβαιωθείτε ότι η επέκταση για τους πράκτορες είναι εγκατεστημένη
azd extension install azure.ai.agents

# Επαναρυθμίστε ή ενημερώστε έναν πράκτορα από ένα αρχείο manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Χρησιμοποιήστε τον διακομιστή MCP για να επιτρέψετε στα εργαλεία AI να ερωτούν την κατάσταση του έργου
azd mcp start

# Δημιουργήστε αρχεία υποδομής για ανασκόπηση και έλεγχο
azd infra generate
```

> **Συμβουλή:** Χρησιμοποιήστε `azd infra generate` για να γράψετε IaC στο δίσκο ώστε να μπορείτε να ελέγξετε ακριβώς ποιους πόρους προμήθευσε. Αυτό είναι ανεκτίμητο όταν αποσφαλματώνετε ζητήματα διαμόρφωσης πόρων. Δείτε την [AZD AI CLI reference](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) για πλήρεις λεπτομέρειες.

### Application Debugging

1. **Δομημένη καταγραφή:**
```python
import logging
import json

# Ρυθμίστε δομημένη καταγραφή για εφαρμογές τεχνητής νοημοσύνης
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

2. **Endpoints ελέγχου υγείας:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Έλεγχος σύνδεσης με το OpenAI
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Έλεγχος υπηρεσίας Αναζήτησης
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

3. **Παρακολούθηση απόδοσης:**
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

## Common Error Codes and Solutions

| Κωδικός Σφάλματος | Περιγραφή | Λύση |
|------------|-------------|----------|
| 401 | Μη εξουσιοδοτημένο | Ελέγξτε τα κλειδιά API και τη ρύθμιση διαχειριζόμενης ταυτότητας |
| 403 | Απαγορευμένο | Επαληθεύστε τις αναθέσεις ρόλων RBAC |
| 429 | Περιορισμένο ρυθμό | Υλοποιήστε λογική επαναδοκιμής με εκθετική απόσβεση |
| 500 | Εσωτερικό σφάλμα διακομιστή | Ελέγξτε την κατάσταση ανάπτυξης μοντέλου και τα αρχεία καταγραφής |
| 503 | Υπηρεσία μη διαθέσιμη | Επαληθεύστε την υγεία της υπηρεσίας και τη διαθεσιμότητα ανά περιοχή |

## Επόμενα Βήματα

1. **Ανασκόπηση του [Οδηγού Ανάπτυξης Μοντέλων AI](../chapter-02-ai-development/ai-model-deployment.md)** για βέλτιστες πρακτικές ανάπτυξης
2. **Ολοκλήρωση των [Production AI Practices](../chapter-08-production/production-ai-practices.md)** για λύσεις έτοιμες για επιχειρήσεις
3. **Εγγραφή στο [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** για υποστήριξη κοινότητας
4. **Υποβολή ζητημάτων** στο [AZD GitHub repository](https://github.com/Azure/azure-dev) για προβλήματα ειδικά του AZD

## Πόροι

- [Microsoft Foundry Models Service Troubleshooting](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Container Apps Troubleshooting](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Azure AI Search Troubleshooting](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Δεξιότητα Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Εγκαταστήστε δεξιότητες αντιμετώπισης προβλημάτων Azure στον επεξεργαστή σας: `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Αντιμετώπιση & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Debugging Guide](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Σχετικό**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Αναφορά**: [Azure Developer CLI Troubleshooting](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά το ότι επιδιώκουμε την ακρίβεια, παρακαλούμε λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα στην οποία συντάχθηκε πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->