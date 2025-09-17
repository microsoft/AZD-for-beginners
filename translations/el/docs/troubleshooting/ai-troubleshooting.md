<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c8ab8fd8ed338b3ec17484b453dcda68",
  "translation_date": "2025-09-17T22:42:04+00:00",
  "source_file": "docs/troubleshooting/ai-troubleshooting.md",
  "language_code": "el"
}
-->
# Οδηγός Αντιμετώπισης Προβλημάτων για AI

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Αντιμετώπιση Προβλημάτων & Εντοπισμός Σφαλμάτων
- **⬅️ Προηγούμενο**: [Οδηγός Εντοπισμού Σφαλμάτων](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Πρότυπα Παραγωγής & Επιχειρηματικής Κλίμακας](../ai-foundry/production-ai-practices.md)
- **🤖 Σχετικό**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI](../ai-foundry/azure-ai-foundry-integration.md)

**Προηγούμενο:** [Πρακτικές Παραγωγής AI](../ai-foundry/production-ai-practices.md) | **Επόμενο:** [Ξεκινώντας με το AZD](../getting-started/README.md)

Αυτός ο ολοκληρωμένος οδηγός αντιμετώπισης προβλημάτων καλύπτει κοινά ζητήματα κατά την ανάπτυξη λύσεων AI με το AZD, παρέχοντας λύσεις και τεχνικές εντοπισμού σφαλμάτων ειδικά για τις υπηρεσίες Azure AI.

## Πίνακας Περιεχομένων

- [Προβλήματα Υπηρεσίας Azure OpenAI](../../../../docs/troubleshooting)
- [Προβλήματα Αναζήτησης Azure AI](../../../../docs/troubleshooting)
- [Προβλήματα Ανάπτυξης Εφαρμογών Container](../../../../docs/troubleshooting)
- [Σφάλματα Αυθεντικοποίησης και Δικαιωμάτων](../../../../docs/troubleshooting)
- [Αποτυχίες Ανάπτυξης Μοντέλων](../../../../docs/troubleshooting)
- [Προβλήματα Απόδοσης και Κλιμάκωσης](../../../../docs/troubleshooting)
- [Διαχείριση Κόστους και Ποσοστώσεων](../../../../docs/troubleshooting)
- [Εργαλεία και Τεχνικές Εντοπισμού Σφαλμάτων](../../../../docs/troubleshooting)

## Προβλήματα Υπηρεσίας Azure OpenAI

### Ζήτημα: Η Υπηρεσία OpenAI Δεν Είναι Διαθέσιμη στην Περιοχή

**Συμπτώματα:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Αιτίες:**
- Η υπηρεσία Azure OpenAI δεν είναι διαθέσιμη στην επιλεγμένη περιοχή
- Εξαντλήθηκε η ποσόστωση στις προτιμώμενες περιοχές
- Περιορισμοί χωρητικότητας περιοχής

**Λύσεις:**

1. **Ελέγξτε τη Διαθεσιμότητα Περιοχής:**
```bash
# List available regions for OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Ενημερώστε τη Διαμόρφωση AZD:**
```yaml
# azure.yaml - Force specific region
infra:
  provider: bicep
  path: infra
  module: main
parameters:
  location: "eastus2"  # Known working region
```

3. **Χρησιμοποιήστε Εναλλακτικές Περιοχές:**
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

### Ζήτημα: Υπέρβαση Ποσόστωσης Ανάπτυξης Μοντέλου

**Συμπτώματα:**
```
Error: Deployment failed due to insufficient quota
```

**Λύσεις:**

1. **Ελέγξτε την Τρέχουσα Ποσόστωση:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Αιτηθείτε Αύξηση Ποσόστωσης:**
```bash
# Submit quota increase request
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Βελτιστοποιήστε τη Χωρητικότητα Μοντέλου:**
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

### Ζήτημα: Μη Έγκυρη Έκδοση API

**Συμπτώματα:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Λύσεις:**

1. **Χρησιμοποιήστε Υποστηριζόμενη Έκδοση API:**
```python
# Use latest supported version
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Ελέγξτε τη Συμβατότητα Έκδοσης API:**
```bash
# List supported API versions
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Προβλήματα Αναζήτησης Azure AI

### Ζήτημα: Ανεπαρκής Τιμολογιακή Κατηγορία Υπηρεσίας Αναζήτησης

**Συμπτώματα:**
```
Error: Semantic search requires Basic tier or higher
```

**Λύσεις:**

1. **Αναβαθμίστε την Τιμολογιακή Κατηγορία:**
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

2. **Απενεργοποιήστε την Εννοιολογική Αναζήτηση (Ανάπτυξη):**
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

### Ζήτημα: Αποτυχίες Δημιουργίας Δεικτών

**Συμπτώματα:**
```
Error: Cannot create index, insufficient permissions
```

**Λύσεις:**

1. **Επαληθεύστε τα Κλειδιά Υπηρεσίας Αναζήτησης:**
```bash
# Get search service admin key
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Ελέγξτε το Σχήμα Δείκτη:**
```python
# Validate index schema
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

## Προβλήματα Ανάπτυξης Εφαρμογών Container

### Ζήτημα: Αποτυχίες Δημιουργίας Container

**Συμπτώματα:**
```
Error: Failed to build container image
```

**Λύσεις:**

1. **Ελέγξτε τη Σύνταξη Dockerfile:**
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

2. **Επαληθεύστε τις Εξαρτήσεις:**
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

3. **Προσθέστε Έλεγχο Υγείας:**
```python
# main.py - Add health check endpoint
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Ζήτημα: Αποτυχίες Εκκίνησης Εφαρμογής Container

**Συμπτώματα:**
```
Error: Container failed to start within timeout period
```

**Λύσεις:**

1. **Αυξήστε το Χρονικό Όριο Εκκίνησης:**
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

2. **Βελτιστοποιήστε τη Φόρτωση Μοντέλου:**
```python
# Lazy load models to reduce startup time
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

## Σφάλματα Αυθεντικοποίησης και Δικαιωμάτων

### Ζήτημα: Άρνηση Δικαιωμάτων Διαχειριζόμενης Ταυτότητας

**Συμπτώματα:**
```
Error: Authentication failed for Azure OpenAI Service
```

**Λύσεις:**

1. **Επαληθεύστε τις Αναθέσεις Ρόλων:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Αναθέστε Απαιτούμενους Ρόλους:**
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

3. **Δοκιμάστε την Αυθεντικοποίηση:**
```python
# Test managed identity authentication
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

### Ζήτημα: Άρνηση Πρόσβασης στο Key Vault

**Συμπτώματα:**
```
Error: The user, group or application does not have secrets get permission
```

**Λύσεις:**

1. **Παραχωρήστε Δικαιώματα στο Key Vault:**
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

2. **Χρησιμοποιήστε RBAC Αντί για Πολιτικές Πρόσβασης:**
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

## Αποτυχίες Ανάπτυξης Μοντέλων

### Ζήτημα: Η Έκδοση Μοντέλου Δεν Είναι Διαθέσιμη

**Συμπτώματα:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Λύσεις:**

1. **Ελέγξτε τα Διαθέσιμα Μοντέλα:**
```bash
# List available models
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Χρησιμοποιήστε Εναλλακτικά Μοντέλα:**
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

3. **Επαληθεύστε το Μοντέλο Πριν την Ανάπτυξη:**
```python
# Pre-deployment model validation
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

## Προβλήματα Απόδοσης και Κλιμάκωσης

### Ζήτημα: Υψηλή Καθυστέρηση Απαντήσεων

**Συμπτώματα:**
- Χρόνοι απόκρισης > 30 δευτερόλεπτα
- Σφάλματα χρονικού ορίου
- Κακή εμπειρία χρήστη

**Λύσεις:**

1. **Εφαρμόστε Χρονικά Όρια Αιτημάτων:**
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

2. **Προσθέστε Κρυφή Μνήμη Απαντήσεων:**
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

3. **Ρυθμίστε Αυτόματη Κλιμάκωση:**
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

### Ζήτημα: Σφάλματα Μνήμης

**Συμπτώματα:**
```
Error: Container killed due to memory limit exceeded
```

**Λύσεις:**

1. **Αυξήστε την Κατανομή Μνήμης:**
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

2. **Βελτιστοποιήστε τη Χρήση Μνήμης:**
```python
# Memory-efficient model handling
import gc
import psutil

class MemoryOptimizedAI:
    def __init__(self):
        self.max_memory_percent = 80
        
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

## Διαχείριση Κόστους και Ποσοστώσεων

### Ζήτημα: Απροσδόκητα Υψηλό Κόστος

**Συμπτώματα:**
- Ο λογαριασμός Azure είναι υψηλότερος από το αναμενόμενο
- Η χρήση token υπερβαίνει τις εκτιμήσεις
- Ενεργοποιήθηκαν ειδοποιήσεις προϋπολογισμού

**Λύσεις:**

1. **Εφαρμόστε Ελέγχους Κόστους:**
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

2. **Ρυθμίστε Ειδοποιήσεις Κόστους:**
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

3. **Βελτιστοποιήστε την Επιλογή Μοντέλου:**
```python
# Cost-aware model selection
MODEL_COSTS = {
    'gpt-4o-mini': 0.00015,  # per 1K tokens
    'gpt-4': 0.03,          # per 1K tokens
    'gpt-35-turbo': 0.0015  # per 1K tokens
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

## Εργαλεία και Τεχνικές Εντοπισμού Σφαλμάτων

### Εντολές Εντοπισμού Σφαλμάτων AZD

```bash
# Enable verbose logging
azd up --debug

# Check deployment status
azd show

# View deployment logs
azd logs --follow

# Check environment variables
azd env get-values
```

### Εντοπισμός Σφαλμάτων Εφαρμογής

1. **Δομημένη Καταγραφή:**
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

2. **Σημεία Ελέγχου Υγείας:**
```python
@app.get("/debug/health")
async def detailed_health_check():
    """Comprehensive health check for debugging."""
    checks = {}
    
    # Check OpenAI connectivity
    try:
        client = AsyncOpenAI(azure_endpoint=AZURE_OPENAI_ENDPOINT)
        await client.models.list()
        checks['openai'] = {'status': 'healthy'}
    except Exception as e:
        checks['openai'] = {'status': 'unhealthy', 'error': str(e)}
    
    # Check Search service
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

3. **Παρακολούθηση Απόδοσης:**
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

## Κωδικοί Σφαλμάτων και Λύσεις

| Κωδικός Σφάλματος | Περιγραφή | Λύση |
|-------------------|-----------|------|
| 401 | Μη Εξουσιοδοτημένο | Ελέγξτε τα κλειδιά API και τη διαμόρφωση διαχειριζόμενης ταυτότητας |
| 403 | Απαγορευμένο | Επαληθεύστε τις αναθέσεις ρόλων RBAC |
| 429 | Περιορισμός Ρυθμού | Εφαρμόστε λογική επαναπροσπάθειας με εκθετική καθυστέρηση |
| 500 | Εσωτερικό Σφάλμα Διακομιστή | Ελέγξτε την κατάσταση ανάπτυξης μοντέλου και τα αρχεία καταγραφής |
| 503 | Υπηρεσία Μη Διαθέσιμη | Επαληθεύστε την υγεία της υπηρεσίας και τη διαθεσιμότητα περιοχής |

## Επόμενα Βήματα

1. **Ανασκόπηση [Οδηγού Ανάπτυξης Μοντέλων AI](ai-model-deployment.md)** για βέλτιστες πρακτικές ανάπτυξης
2. **Ολοκλήρωση [Πρακτικών Παραγωγής AI](production-ai-practices.md)** για λύσεις έτοιμες για επιχειρήσεις
3. **Συμμετοχή στο [Discord του Azure AI Foundry](https://aka.ms/foundry/discord)** για υποστήριξη από την κοινότητα
4. **Υποβολή ζητημάτων** στο [GitHub αποθετήριο AZD](https://github.com/Azure/azure-dev) για προβλήματα που σχετίζονται με το AZD

## Πόροι

- [Αντιμετώπιση Προβλημάτων Υπηρεσίας Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Αντιμετώπιση Προβλημάτων Εφαρμογών Container](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Αντιμετώπιση Προβλημάτων Αναζήτησης Azure AI](https://learn.microsoft.com/azure/search/search-monitor-logs)

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Αντιμετώπιση Προβλημάτων & Εντοπισμός Σφαλμάτων
- **⬅️ Προηγούμενο**: [Οδηγός Εντοπισμού Σφαλμάτων](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Πρότυπα Παραγωγής & Επιχειρηματικής Κλίμακας](../ai-foundry/production-ai-practices.md)
- **🤖 Σχετικό**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI](../ai-foundry/azure-ai-foundry-integration.md)
- [Αντιμετώπιση Προβλημάτων CLI Azure Developer](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.