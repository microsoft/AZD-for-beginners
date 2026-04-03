# Οδηγός Επίλυσης Προβλημάτων Ειδικά για AI

**Πλοήγηση Κεφαλαίων:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [Debugging Guide](debugging.md)
- **➡️ Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

Αυτός ο ολοκληρωμένος οδηγός αντιμετώπισης προβλημάτων καλύπτει συνήθη ζητήματα κατά την ανάπτυξη λύσεων AI με AZD, παρέχοντας λύσεις και τεχνικές αποσφαλμάτωσης ειδικές για τις υπηρεσίες Azure AI.

## Πίνακας Περιεχομένων

- [Microsoft Foundry Models Service Issues](#azure-openai-service-issues)
- [Azure AI Search Problems](#προβλήματα-του-azure-ai-search)
- [Container Apps Deployment Issues](#προβλήματα-ανάπτυξης-container-apps)
- [Authentication and Permission Errors](#σφάλματα-πιστοποίησης-και-δικαιωμάτων)
- [Model Deployment Failures](#σφάλματα-ανάπτυξης-μοντέλου)
- [Performance and Scaling Issues](#ζητήματα-απόδοσης-και-κλιμάκωσης)
- [Cost and Quota Management](#διαχείριση-κόστους-και-ποσοστώσεων)
- [Debugging Tools and Techniques](#εργαλεία-και-τεχνικές-αποσφαλμάτωσης)

## Προβλήματα Υπηρεσίας Microsoft Foundry Models

### Πρόβλημα: Υπηρεσία OpenAI Μη Διαθέσιμη στην Περιοχή

**Συμπτώματα:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Αιτίες:**
- Microsoft Foundry Models δεν είναι διαθέσιμο στο επιλεγμένο region
- Η ποσόστωση εξαντλήθηκε στις προτιμώμενες περιοχές
- Περιορισμοί χωρητικότητας σε επίπεδο περιοχής

**Λύσεις:**

1. **Ελέγξτε τη Διαθεσιμότητα της Περιοχής:**
```bash
# Λίστα διαθέσιμων περιοχών για το OpenAI
az cognitiveservices account list-skus \
  --kind OpenAI \
  --query "[].locations[]" \
  --output table
```

2. **Ενημερώστε τη διαμόρφωση του AZD:**
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

### Πρόβλημα: Υπέρβαση Ποσόστωσης Ανάπτυξης Μοντέλου

**Συμπτώματα:**
```
Error: Deployment failed due to insufficient quota
```

**Λύσεις:**

1. **Ελέγξτε την τρέχουσα ποσόστωση:**
```bash
# Ελέγξτε τη χρήση του ορίου
az cognitiveservices usage list \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG
```

2. **Ζητήστε αύξηση ποσόστωσης:**
```bash
# Υποβάλετε αίτημα αύξησης ορίου
az support tickets create \
  --ticket-name "OpenAI Quota Increase" \
  --description "Need increased quota for production deployment" \
  --severity "minimal" \
  --problem-classification "/providers/Microsoft.Support/services/quota_service_guid/problemClassifications/quota_service_problemClassification_guid"
```

3. **Βελτιστοποιήστε την χωρητικότητα του μοντέλου:**
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

### Πρόβλημα: Μη Έγκυρη Έκδοση API

**Συμπτώματα:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Λύσεις:**

1. **Χρησιμοποιήστε Υποστηριζόμενη Έκδοση API:**
```python
# Χρησιμοποιήστε την πιο πρόσφατη υποστηριζόμενη έκδοση
AZURE_OPENAI_API_VERSION = "2024-02-15-preview"
```

2. **Ελέγξτε τη συμβατότητα της έκδοσης API:**
```bash
# Λίστα υποστηριζόμενων εκδόσεων API
az rest --method get \
  --url "https://management.azure.com/providers/Microsoft.CognitiveServices/operations?api-version=2023-05-01" \
  --query "value[?name.value=='Microsoft.CognitiveServices/accounts/read'].properties.serviceSpecification.metricSpecifications[].supportedApiVersions[]"
```

## Προβλήματα του Azure AI Search

### Πρόβλημα: Επίπεδο Τιμολόγησης της Υπηρεσίας Αναζήτησης Ανεπαρκές

**Συμπτώματα:**
```
Error: Semantic search requires Basic tier or higher
```

**Λύσεις:**

1. **Αναβαθμίστε το Επίπεδο Τιμολόγησης:**
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

2. **Απενεργοποιήστε την Σημασιολογική Αναζήτηση (Ανάπτυξη):**
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

### Πρόβλημα: Σφάλματα Δημιουργίας Ευρετηρίου

**Συμπτώματα:**
```
Error: Cannot create index, insufficient permissions
```

**Λύσεις:**

1. **Επαληθεύστε τα κλειδιά της υπηρεσίας αναζήτησης:**
```bash
# Λήψη κλειδιού διαχειριστή της υπηρεσίας αναζήτησης
az search admin-key show \
  --service-name YOUR_SEARCH_SERVICE \
  --resource-group YOUR_RG
```

2. **Ελέγξτε το σχήμα του ευρετηρίου:**
```python
# Επικύρωση σχήματος ευρετηρίου
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

## Προβλήματα Ανάπτυξης Container Apps

### Πρόβλημα: Σφάλματα Κατασκευής Container

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

3. **Προσθέστε Έλεγχο Υγείας:**
```python
# main.py - Προσθήκη endpoint ελέγχου υγείας
from fastapi import FastAPI

app = FastAPI()

@app.get("/health")
async def health_check():
    return {"status": "healthy"}
```

### Πρόβλημα: Σφάλματα Εκκίνησης Container App

**Συμπτώματα:**
```
Error: Container failed to start within timeout period
```

**Λύσεις:**

1. **Αυξήστε τον χρόνο εκκίνησης (timeout):**
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

2. **Βελτιστοποιήστε τη φόρτωση του μοντέλου:**
```python
# Καθυστερημένη φόρτωση μοντέλων για μείωση του χρόνου εκκίνησης
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
        # Αρχικοποιήστε τον πελάτη AI εδώ
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

## Σφάλματα Πιστοποίησης και Δικαιωμάτων

### Πρόβλημα: Άρνηση Δικαιώματος Διαχειριζόμενης Ταυτότητας

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

3. **Δοκιμάστε την πιστοποίηση:**
```python
# Δοκιμή αυθεντικοποίησης διαχειριζόμενης ταυτότητας
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

### Πρόβλημα: Άρνηση Πρόσβασης στο Key Vault

**Συμπτώματα:**
```
Error: The user, group or application does not have secrets get permission
```

**Λύσεις:**

1. **Χορηγήστε δικαιώματα στο Key Vault:**
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

## Σφάλματα Ανάπτυξης Μοντέλου

### Πρόβλημα: Έκδοση Μοντέλου Μη Διαθέσιμη

**Συμπτώματα:**
```
Error: Model version 'gpt-4-32k' is not available
```

**Λύσεις:**

1. **Ελέγξτε τα διαθέσιμα μοντέλα:**
```bash
# Εμφάνιση διαθέσιμων μοντέλων
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE \
  --resource-group YOUR_RG \
  --query "[].{name:model.name, version:model.version}" \
  --output table
```

2. **Χρησιμοποιήστε εναλλακτικά μοντέλα (fallbacks):**
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

## Ζητήματα Απόδοσης και Κλιμάκωσης

### Πρόβλημα: Υψηλές Καθυστερήσεις Απαντήσεων

**Συμπτώματα:**
- Χρόνοι απόκρισης > 30 δευτερόλεπτα
- Σφάλματα timeout
- Κακή εμπειρία χρήστη

**Λύσεις:**

1. **Υλοποιήστε όρια χρόνου για αιτήματα:**
```python
# Ρυθμίστε κατάλληλα τα χρονικά όρια
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

2. **Προσθέστε προσωρινή αποθήκευση (caching) απαντήσεων:**
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

### Πρόβλημα: Σφάλματα Εξάντλησης Μνήμης

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
# Αποδοτική στη χρήση μνήμης διαχείριση του μοντέλου
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
            gc.collect()  # Εξαναγκάστε τη συλλογή απορριμμάτων
            
        result = await self._process_ai_request(request)
        
        # Καθαρίστε μετά την επεξεργασία
        gc.collect()
        return result
```

## Διαχείριση Κόστους και Ποσοστώσεων

### Πρόβλημα: Απρόσμενα Υψηλά Κόστη

**Συμπτώματα:**
- Λογαριασμός Azure υψηλότερος από το αναμενόμενο
- Χρήση token υπερβαίνει τις εκτιμήσεις
- Ειδοποιήσεις προϋπολογισμού ενεργοποιήθηκαν

**Λύσεις:**

1. **Εφαρμόστε ελέγχους κόστους:**
```python
# Παρακολούθηση χρήσης διακριτικών
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

## Εργαλεία και Τεχνικές Αποσφαλμάτωσης

### Εντολές Αποσφαλμάτωσης AZD

```bash
# Ενεργοποιήστε την εκτενή καταγραφή
azd up --debug

# Ελέγξτε την κατάσταση ανάπτυξης
azd show

# Δείτε τα αρχεία καταγραφής της εφαρμογής (ανοίγει τον πίνακα ελέγχου παρακολούθησης)
azd monitor --logs

# Δείτε τις ζωντανές μετρικές
azd monitor --live

# Ελέγξτε τις μεταβλητές περιβάλλοντος
azd env get-values
```

### Εντολές Επέκτασης AZD AI για Διαγνωστικά

If you deployed agents using `azd ai agent init`, these additional tools are available:

```bash
# Βεβαιωθείτε ότι η επέκταση agents είναι εγκατεστημένη
azd extension install azure.ai.agents

# Αρχικοποιήστε εκ νέου ή ενημερώστε έναν agent από ένα manifest
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Χρησιμοποιήστε τον διακομιστή MCP για να επιτρέψετε στα εργαλεία AI να ερωτούν την κατάσταση του έργου
azd mcp start

# Δημιουργήστε αρχεία υποδομής για αναθεώρηση και έλεγχο
azd infra generate
```

> **Συμβουλή:** Χρησιμοποιήστε `azd infra generate` για να γράψετε IaC στο δίσκο ώστε να μπορείτε να επιθεωρήσετε ακριβώς ποιους πόρους παρείχε. Αυτό είναι ανεκτίμητο κατά την αποσφαλμάτωση προβλημάτων διαμόρφωσης πόρων. Δείτε την [Αναφορά CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) για πλήρεις λεπτομέρειες.

### Αποσφαλμάτωση Εφαρμογής

1. **Δομημένη Καταγραφή:**
```python
import logging
import json

# Διαμόρφωση δομημένης καταγραφής για εφαρμογές τεχνητής νοημοσύνης
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

2. **Endpoints Ελέγχου Υγείας:**
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
    
    # Έλεγχος υπηρεσίας αναζήτησης
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

## Συνηθισμένοι Κωδικοί Σφάλματος και Λύσεις

| Κωδικός Σφάλματος | Περιγραφή | Λύση |
|------------|-------------|----------|
| 401 | Μη εξουσιοδοτημένος | Ελέγξτε τα κλειδιά API και τη διαμόρφωση της διαχειριζόμενης ταυτότητας |
| 403 | Απαγορευμένο | Επαληθεύστε τις αναθέσεις ρόλων RBAC |
| 429 | Περιορισμός Ρυθμού | Υλοποιήστε λογική επαναπροσπάθειας με εκθετική υποχώρηση |
| 500 | Εσωτερικό σφάλμα διακομιστή | Ελέγξτε την κατάσταση ανάπτυξης του μοντέλου και τα αρχεία καταγραφής (logs) |
| 503 | Υπηρεσία Μη Διαθέσιμη | Επαληθεύστε την υγεία της υπηρεσίας και τη διαθεσιμότητα ανά περιοχή |

## Επόμενα Βήματα

1. **Αναθεωρήστε τον [Οδηγό Ανάπτυξης Μοντέλων AI](../chapter-02-ai-development/ai-model-deployment.md)** για βέλτιστες πρακτικές ανάπτυξης
2. **Ολοκληρώστε τις [Πρακτικές Παραγωγής AI](../chapter-08-production/production-ai-practices.md)** για λύσεις έτοιμες για επιχειρήσεις
3. **Εγγραφείτε στο [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** για υποστήριξη από την κοινότητα
4. **Υποβάλετε ζητήματα** στο [αποθετήριο GitHub του AZD](https://github.com/Azure/azure-dev) για προβλήματα ειδικά στο AZD

## Πόροι

- [Αντιμετώπιση προβλημάτων Υπηρεσίας Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/troubleshooting)
- [Αντιμετώπιση προβλημάτων Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Αντιμετώπιση προβλημάτων Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Δεξιότητα Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Εγκαταστήστε δεξιότητες αντιμετώπισης προβλημάτων Azure στον επεξεργαστή σας: `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 7 - Troubleshooting & Debugging
- **⬅️ Previous**: [Debugging Guide](debugging.md)
- **➡️ Next Chapter**: [Chapter 8: Production & Enterprise Patterns](../chapter-08-production/production-ai-practices.md)
- **🤖 Related**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Αναφορά**: [Αντιμετώπιση προβλημάτων Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά το ότι καταβάλλουμε κάθε προσπάθεια για ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα στην οποία συντάχθηκε πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή παρανοήσεις που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->