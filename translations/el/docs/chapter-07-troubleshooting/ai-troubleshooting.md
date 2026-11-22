# Οδηγός Επίλυσης Προβλημάτων για Τεχνητή Νοημοσύνη

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Επίλυση Προβλημάτων & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Οδηγός Αποσφαλμάτωσης](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Προτύπα Παραγωγής & Επιχειρήσεων](../chapter-08-production/production-ai-practices.md)
- **🤖 Σχετικό**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην AI](../chapter-02-ai-development/microsoft-foundry-integration.md)

Αυτός ο ολοκληρωμένος οδηγός επίλυσης προβλημάτων καλύπτει κοινά ζητήματα κατά την ανάπτυξη λύσεων AI με AZD, παρέχοντας λύσεις και τεχνικές αποσφαλμάτωσης ειδικές για τις υπηρεσίες Azure AI.

> **Πεδίο Εφαρμογής:** Οι εντολές χρησιμοποιούν παραδείγματα ονομάτων πόρων· αντικαταστήστε τα και επιλέξτε τη σωστή συνδρομή. Τα μπλοκ Bicep είναι αποσπάσματα για συγχώνευση σε υπάρχον πρότυπο, όχι ανεξάρτητες αναπτύξεις. Τα αποσπάσματα Python απαιτούν τα αναφερόμενα SDK και παραμετροποίηση της εφαρμογής. Δεν έγινε ζωντανή ανάπτυξη Azure για αυτή την ανασκόπηση.

## Περιεχόμενα

- [Προβλήματα στην Υπηρεσία Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Προβλήματα Αναζήτησης Azure AI](#azure-ai-search-problems)
- [Προβλήματα Ανάπτυξης Εφαρμογών Container](#container-apps-deployment-issues)
- [Σφάλματα Πιστοποίησης και Δικαιωμάτων](#authentication-and-permission-errors)
- [Αποτυχίες Ανάπτυξης Μοντέλου](#model-deployment-failures)
- [Προβλήματα Απόδοσης και Κλιμάκωσης](#performance-and-scaling-issues)
- [Διαχείριση Κόστους και Ορίων](#cost-and-quota-management)
- [Εργαλεία και Τεχνικές Αποσφαλμάτωσης](#debugging-tools-and-techniques)

## Προβλήματα στην Υπηρεσία Microsoft Foundry Models

### Ζήτημα: Υπηρεσία OpenAI Μη Διαθέσιμη στην Περιοχή

**Συμπτώματα:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Αιτίες:**
- Τα Microsoft Foundry Models δεν είναι διαθέσιμα στην επιλεγμένη περιοχή
- Οι πόροι εξαντλήθηκαν στις προτιμώμενες περιοχές
- Περιφερειακοί περιορισμοί χωρητικότητας

**Λύσεις:**

1. **Ελέγξτε τη Διαθεσιμότητα της Περιοχής:**
```bash
# Inspect model/deployment-type offerings in a candidate region
az cognitiveservices model list --location eastus2 --output json
# Availability in the catalog does not guarantee quota or physical capacity.
```

2. **Ενημερώστε τη Διαμόρφωση AZD:**
```bash
# For a new environment: choose a supported region with available quota
azd env set AZURE_LOCATION eastus2
# Templates with a separate model-location parameter must wire that value
# through infra/main.parameters.json as documented by the template.
```

3. **Χρησιμοποιήστε Εναλλακτικές Περιοχές:**
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

### Ζήτημα: Υπέρβαση Ορίου Ανάπτυξης Μοντέλου

**Συμπτώματα:**
```
Error: Deployment failed due to insufficient quota
```

**Λύσεις:**

1. **Ελέγξτε το Τρέχον Όριο:**
```bash
# Check quota usage
az cognitiveservices usage list \
  --location eastus2 --output table
```

2. **Αιτηθείτε Αύξηση Ορίου:**
Χρησιμοποιήστε τη ροή διαχείρισης ορίων στο portal Foundry για τη συνδρομή, την περιοχή, το μοντέλο και τον τύπο ανάπτυξης που επηρεάζεται. Δείτε τις [επίσημες οδηγίες για όρια](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Ένα αίτημα ορίου VM δεν αυξάνει το όριο μοντέλων.

3. **Βελτιστοποιήστε τη Χωρητικότητα Μοντέλου:**
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

### Ζήτημα: Μη Έγκυρη Έκδοση API

**Συμπτώματα:**
```
Error: The API version '2023-05-15' is not available for OpenAI
```

**Λύσεις:**

1. **Χρησιμοποιήστε Υποστηριζόμενη Έκδοση API:**
```python
# Stable dated Azure OpenAI data-plane API, where supported by your feature
AZURE_OPENAI_API_VERSION = "2024-10-21"
```

2. **Ελέγξτε τη Συμβατότητα Έκδοσης API:**
Ελέγξτε την [αναφορά ζωής API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Οι εκδόσεις API παρόχου πόρων ARM **δεν** περιλαμβάνουν τις εκδόσεις API για τη διεπαφή inference/data-plane. Οι νέοι πελάτες v1 χρησιμοποιούν `/openai/v1/` χωρίς ημερ. `api-version`· μην αναμειγνύετε τις δύο ρυθμίσεις πελάτη.

## Προβλήματα Αναζήτησης Azure AI

### Ζήτημα: Ανεπαρκές Επίπεδο Τιμολόγησης Υπηρεσίας Αναζήτησης

**Συμπτώματα:**
```
Error: Semantic search requires Basic tier or higher
```

**Λύσεις:**

1. **Χρησιμοποιήστε Υποστηριζόμενο Επίπεδο Τιμολόγησης:**

Ο σημασιολογικός ταξινομητής απαιτεί Basic ή ανώτερο. Η μετάβαση από Free/Basic σε διαφορετικό επίπεδο μπορεί να απαιτήσει τη δημιουργία νέας υπηρεσίας αναζήτησης και επανακατασκευή ευρετηρίων· η επεξεργασία SKU δεν εγγυάται αναβάθμιση in-place.
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

2. **Απενεργοποιήστε τη Σημασιολογική Αναζήτηση (Κατά Ανάπτυξη):**
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

### Ζήτημα: Αποτυχίες Δημιουργίας Ευρετηρίων

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

2. **Ελέγξτε το Σχήμα Ευρετηρίου:**
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

3. **Χρησιμοποιήστε Διαχειριζόμενη Ταυτότητα:**
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

## Προβλήματα Ανάπτυξης Εφαρμογών Container

### Ζήτημα: Αποτυχίες Κατασκευής Container

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

2. **Επικυρώστε Εξαρτήσεις:**
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

1. **Αυξήστε τον Χρόνο Εκκίνησης:**
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

2. **Βελτιστοποιήστε το Φόρτωμα του Μοντέλου:**
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

## Σφάλματα Πιστοποίησης και Δικαιωμάτων

### Ζήτημα: Απόρριψη Δικαιωμάτων Διαχειριζόμενης Ταυτότητας

**Συμπτώματα:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Λύσεις:**

1. **Επαληθεύστε τις Αναθέσεις Ρόλων:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Αναθέστε τους Απαραίτητους Ρόλους:**
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

3. **Δοκιμάστε την Πιστοποίηση:**
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

Η απόκτηση διακριτικού αποδεικνύει πιστοποίηση, όχι δικαίωμα κλήσης μοντέλου. Δοκιμάστε τη συγκεκριμένη λειτουργία ξεχωριστά. Τοπικά, `DefaultAzureCredential` μπορεί να χρησιμοποιεί διαπιστευτήρια προγραμματιστή· στο Azure, επιβεβαιώστε ότι η ορθή διαχειριζόμενη ταυτότητα έχει επιλεγεί.

### Ζήτημα: Άρνηση Πρόσβασης σε Key Vault

**Συμπτώματα:**
```
Error: The user, group or application does not have secrets get permission
```

**Λύσεις:**

1. **Παρέχετε Δικαιώματα στο Key Vault:**

Χρησιμοποιήστε το παρακάτω απόσπασμα πολιτικής πρόσβασης μόνο για vault με `enableRbacAuthorization: false`. Για vault με RBAC ενεργοποιημένο, χρησιμοποιήστε την επιλογή 2· η προσθήκη πολιτικής πρόσβασης δεν παρέχει πρόσβαση data-plane σε λειτουργία RBAC.
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

Το vault πρέπει να έχει `enableRbacAuthorization: true`· η αλλαγή μοντέλων αδειών απαιτεί προγραμματισμένη μετανάστευση της υπάρχουσας πρόσβασης.
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

## Αποτυχίες Ανάπτυξης Μοντέλου

### Ζήτημα: Μη Διαθέσιμη Έκδοση Μοντέλου

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
  --query "[].{name:name, version:version}" \
  --output table
```

2. **Επιλέξτε Ρητά Διαθέσιμο Μοντέλο:**
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

3. **Επικυρώστε το Μοντέλο Πριν την Ανάπτυξη:**
```bash
# Management-plane catalog for the actual account
az cognitiveservices account list-models \
  --name YOUR_OPENAI_RESOURCE --resource-group YOUR_RG --output json
# Inspect model/version and supported SKUs; check regional quota separately.
```

## Προβλήματα Απόδοσης και Κλιμάκωσης

### Ζήτημα: Υψηλή Καθυστέρηση Απαντήσεων

**Συμπτώματα:**
- Χρόνοι απόκρισης > 30 δευτερόλεπτα
- Σφάλματα χρονικού ορίου
- Κακή εμπειρία χρήστη

**Λύσεις:**

1. **Υλοποιήστε Χρονικά Όρια Αιτημάτων:**
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

3. **Διαμορφώστε Αυτόματη Κλιμάκωση:**
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

### Ζήτημα: Σφάλματα Memory Out of

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

## Διαχείριση Κόστους και Ορίων

### Ζήτημα: Απροσδόκητα Υψηλά Κόστη

**Συμπτώματα:**
- Τιμολόγιο Azure υψηλότερο από το αναμενόμενο
- Χρήση διακριτικών πέρα από τις εκτιμήσεις
- Ειδοποιήσεις προϋπολογισμού ενεργοποιήθηκαν

**Λύσεις:**

1. **Υλοποιήστε Ελέγχους Κόστους:**
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

Αυτό το μετρητή μνήμης δείχνει παράδειγμα, δεν είναι έλεγχος μηνιαίων εξόδων: επανεκκινείται και δεν μοιράζεται μεταξύ αντιγράφων, ελέγχει τη χρήση μόνο μετά από κλήση. Ένα πραγματικό όριο απαιτεί ανθεκτική λογιστική, ασφαλείς ταυτόχρονες κρατήσεις πριν από αιτήματα και μηνιαία πολιτική επαναφοράς. Τα μετρικά μνήμης container πρέπει να λαμβάνουν υπόψη τα όρια cgroup· `psutil.virtual_memory()` δεν είναι αξιόπιστο μέτρο ορίου container, και ο καθαρισμός σκουπιδιών δεν επιβάλλει όριο μνήμης.

2. **Ρυθμίστε Ειδοποιήσεις Κόστους:**
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

Δηλώστε `budgetStartDate` και `budgetEndDate` στο πρότυπό σας. Οι προϋπολογισμοί ειδοποιούν· δεν σταματούν πόρους ή επιβάλλουν σκληρό ανώτατο όριο δαπανών.

3. **Βελτιστοποιήστε την Επιλογή Μοντέλου:**
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

## Εργαλεία και Τεχνικές Αποσφαλμάτωσης

### Εντολές Αποσφαλμάτωσης AZD

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

### Εντολές Επέκτασης AZD AI για Διαγνωστικά

Εάν αναπτύξατε agents με `azd ai agent init`, διαθέσιμα είναι επιπλέον αυτά τα εργαλεία:

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

> **Συμβουλή:** Χρησιμοποιήστε `azd infra generate` για να γράψετε IaC σε δίσκο ώστε να ελέγξετε ακριβώς τους πόρους που δημιουργήθηκαν. Αυτό είναι ανεκτίμητο κατά την αποσφαλμάτωση προβλημάτων διαμόρφωσης πόρων. Δείτε την [αναφορά AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) για πλήρεις λεπτομέρειες.

**Διαγνωστικά ροής εργασίας GA (2026-11-09):** Επιβεβαιώστε ότι `azd version` είναι τουλάχιστον 1.37.0 και ελέγξτε `azd ext list --installed`. Ενημερώστε πρώτα το κύριο CLI με `azd update` ή τον εγκαταστάτη του και μετά ενημερώστε το bundle με `azd ext upgrade microsoft.foundry`. Για τοπικά σφάλματα, ελέγξτε τον τρέχοντα uv, Python 3.13+ για το βασικό δείγμα, `PYTHONNOUSERSITE: "1"` στη διαμόρφωση υπηρεσίας του, και τα διαπιστευτήρια Azure που χρησιμοποιούνται από `DefaultAzureCredential`. Κρατήστε `azd ai agent run` σε λειτουργία ενώ καλείτε `--local` από δεύτερο τερματικό στον κατάλογο έργου.

Η επιτυχής παροχή δεν αποδεικνύει ότι ο προγραμματιστής έχει πρόσβαση data-plane. Ελέγξτε προειδοποιήσεις RBAC και τον [πίνακα δικαιωμάτων hosted-agent](https://learn.microsoft.com/azure/foundry/agents/concepts/hosted-agent-permissions). Ένα timeout δεν καθορίζει αποτυχία ανάπτυξης: επιθεωρήστε την έκδοση και τα αρχεία καταγραφής πριν δοκιμάσετε ξανά. Προηγούμενοι agents beta.23 βελτίωσαν αυτές τις προειδοποιήσεις και την έξοδο A2A· αυτές οι ιστορικές διορθώσεις περιγράφονται στις [σημειώσεις έκδοσης](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes), όχι ως απαίτηση εγκατάστασης της beta.

Αν `azd ai eval` δεν είναι διαθέσιμο, εγκαταστήστε `azure.ai.evaluations` ξεχωριστά· το GA bundle δεν το περιλαμβάνει. Εάν η εντολή agent-evaluation παλαιότερου tutorial εκτυπώνει μόνο κατευθύνσεις μετανάστευσης, χρησιμοποιήστε τη διακριτή ροή `azd ai eval`. Το `--config` της βελτιστοποίησης δεν δέχεται πλέον αρχεία πεπαλαιωμένης αξιολόγησης. Δείτε [μετανάστευση αξιολόγησης](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) και [μετανάστευση βελτιστοποίησης](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Αποσφαλμάτωση Εφαρμογής

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

## Κοινά Κωδικοί Σφαλμάτων και Λύσεις

| Κωδικός Σφάλματος | Περιγραφή | Λύση |
|------------|-------------|----------|
| 401 | Μη Εξουσιοδοτημένο | Ελέγξτε τα κλειδιά API και τη διαμόρφωση διαχειριζόμενης ταυτότητας |
| 403 | Απαγορευμένο | Επαληθεύστε τις αναθέσεις ρόλων RBAC |
| 429 | Περιορισμός Ρυθμού | Υλοποιήστε λογική επανάληψης με εκθετική απόσβεση |
| 500 | Εσωτερικό Σφάλμα Διακομιστή | Ελέγξτε την κατάσταση και τα αρχεία καταγραφής ανάπτυξης μοντέλου |
| 503 | Υπηρεσία Μη Διαθέσιμη | Επαληθεύστε την υγεία υπηρεσίας και τη διαθεσιμότητα περιοχής |

## Επόμενα Βήματα

1. **Ανασκοπήστε τον [Οδηγό Ανάπτυξης Μοντέλων AI](../chapter-02-ai-development/ai-model-deployment.md)** για βέλτιστες πρακτικές ανάπτυξης
2. **Ολοκληρώστε τις [Πρακτικές Παραγωγής AI](../chapter-08-production/production-ai-practices.md)** για λύσεις έτοιμες για επιχειρήσεις
3. **Εγγραφείτε στο [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** για υποστήριξη κοινότητας
4. **Υποβάλετε θέματα** στο [αποθετήριο AZD GitHub](https://github.com/Azure/azure-dev) για προβλήματα ειδικά του AZD

## Πόροι

- [Επίλυση προβλημάτων εξαντλήσεων και ορίων Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Επίλυση προβλημάτων Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Επίλυση προβλημάτων Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Δεξιότητα Διάγνωσης Azure Diagnostics Agent**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Εγκαταστήστε δεξιότητες διάγνωσης Azure στον επεξεργαστή σας: `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Επίλυση Προβλημάτων & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Οδηγός Αποσφαλμάτωσης](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Προτύπα Παραγωγής & Επιχειρήσεων](../chapter-08-production/production-ai-practices.md)
- **🤖 Σχετικό**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην AI](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Αναφορά**: [Επίλυση Προβλημάτων Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->