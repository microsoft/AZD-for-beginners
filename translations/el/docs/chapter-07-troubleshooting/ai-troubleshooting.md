# Οδηγός Επίλυσης Προβλημάτων για Τεχνητή Νοημοσύνη

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Επίλυση Προβλημάτων & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Οδηγός Αποσφαλμάτωσης](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Παραγωγικά & Επιχειρησιακά Μοντέλα](../chapter-08-production/production-ai-practices.md)
- **🤖 Σχετικά**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην ΤΝ](../chapter-02-ai-development/microsoft-foundry-integration.md)

Αυτός ο ολοκληρωμένος οδηγός επίλυσης προβλημάτων αντιμετωπίζει συνηθισμένα ζητήματα κατά την ανάπτυξη λύσεων ΤΝ με AZD, παρέχοντας λύσεις και τεχνικές αποσφαλμάτωσης ειδικές για τις υπηρεσίες Azure AI.

> **Εύρος:** Οι εντολές χρησιμοποιούν παραδείγματα ονομάτων πόρων· αντικαταστήστε τα και επιλέξτε τη σωστή συνδρομή. Τα μπλοκ Bicep είναι αποσπάσματα για συγχώνευση σε υπάρχον πρότυπο, όχι αυτόνομες αναπτύξεις. Τα αποσπάσματα Python απαιτούν τα δηλωμένα SDK και ρύθμιση εφαρμογής. Δεν εκτελέστηκε ζωντανή ανάπτυξη στο Azure για αυτή την ανασκόπηση.

## Πίνακας Περιεχομένων

- [Προβλήματα Υπηρεσιών Microsoft Foundry Models](#microsoft-foundry-models-service-issues)
- [Προβλήματα Azure AI Search](#azure-ai-search-problems)
- [Προβλήματα Ανάπτυξης Container Apps](#container-apps-deployment-issues)
- [Σφάλματα Πιστοποίησης και Δικαιωμάτων](#authentication-and-permission-errors)
- [Αποτυχίες Ανάπτυξης Μοντέλων](#model-deployment-failures)
- [Προβλήματα Απόδοσης και Κλιμάκωσης](#performance-and-scaling-issues)
- [Διαχείριση Κόστους και Ποσοστώσεων](#cost-and-quota-management)
- [Εργαλεία και Τεχνικές Αποσφαλμάτωσης](#debugging-tools-and-techniques)

## Προβλήματα Υπηρεσίας Microsoft Foundry Models

### Ζήτημα: Η Υπηρεσία OpenAI Δεν Είναι Διαθέσιμη στην Περιοχή

**Συμπτώματα:**
```
Error: The requested resource type is not available in the location 'westus'
```

**Αιτίες:**
- Η υπηρεσία Microsoft Foundry Models δεν είναι διαθέσιμη στην επιλεγμένη περιοχή
- Η ποσόστωση έχει εξαντληθεί στις προτιμώμενες περιοχές
- Περιορισμοί χωρητικότητας στην περιοχή

**Λύσεις:**

1. **Ελέγξτε τη Διαθεσιμότητα Περιοχής:**
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
  --location eastus2 --output table
```

2. **Ζητήστε Αύξηση Ποσόστωσης:**
Χρησιμοποιήστε τη ροή εργασίας διαχείρισης ποσόστωσης στην πύλη Foundry για τη συνδρομή, περιοχή, μοντέλο και τύπο ανάπτυξης που επηρεάζεται. Δείτε τις [επίσημες οδηγίες ποσόστωσης](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota). Αίτημα ποσόστωσης VM δεν αυξάνει την ποσόστωση μοντέλου.

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
Ελέγξτε την [αναφορά κύκλου ζωής API Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/api-version-lifecycle). Οι εκδόσεις API παρόχου πόρων ARM **δεν** περιλαμβάνουν τις εκδόσεις API inference/data-plane. Οι νέοι v1 πελάτες χρησιμοποιούν `/openai/v1/` χωρίς μια χρονολογημένη `api-version`· μην αναμειγνύετε τις δύο ρυθμίσεις πελάτη.

## Προβλήματα Azure AI Search

### Ζήτημα: Ανεπαρκές Επίπεδο Τιμολόγησης Υπηρεσίας Αναζήτησης

**Συμπτώματα:**
```
Error: Semantic search requires Basic tier or higher
```

**Λύσεις:**

1. **Χρησιμοποιήστε Υποστηριζόμενο Επίπεδο Τιμολόγησης:**

Ο σημασιολογικός κατάταξης απαιτεί Basic ή υψηλότερο επίπεδο. Η μετάβαση από Free/Basic σε διαφορετικό επίπεδο μπορεί να απαιτεί τη δημιουργία νέας υπηρεσίας αναζήτησης και την αναδόμηση δεικτών· η επεξεργασία SKU δεν εγγυάται αναβάθμιση επιτόπου.
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

### Ζήτημα: Αποτυχίες Δημιουργίας Δείκτη

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

## Προβλήματα Ανάπτυξης Container Apps

### Ζήτημα: Αποτυχίες Κατασκευής Container

**Συμπτώματα:**
```
Error: Failed to build container image
```

**Λύσεις:**

1. **Ελέγξτε τη Σύνταξη του Dockerfile:**
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

2. **Επικυρώστε τις Εξαρτήσεις:**
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

### Ζήτημα: Αποτυχίες Εκκίνησης Container App

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

2. **Βελτιστοποιήστε τη Φόρτωση Μοντέλου:**
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

### Ζήτημα: Άρνηση Δικαιώματος Διαχειριζόμενης Ταυτότητας

**Συμπτώματα:**
```
Error: Authentication failed for Microsoft Foundry Models Service
```

**Λύσεις:**

1. **Επαληθεύστε τις Αντιστοιχίσεις Ρόλων:**
```bash
# Check current role assignments
az role assignment list \
  --assignee YOUR_MANAGED_IDENTITY_ID \
  --scope /subscriptions/YOUR_SUBSCRIPTION/resourceGroups/YOUR_RG
```

2. **Αναθέστε τους Απαιτούμενους Ρόλους:**
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

Η απόκτηση token αποδεικνύει πιστοποίηση, όχι δικαίωμα για κλήση μοντέλου. Δοκιμάστε την επιθυμητή λειτουργία ξεχωριστά. Τοπικά, `DefaultAzureCredential` μπορεί να χρησιμοποιεί διαπιστευτήρια προγραμματιστή· στο Azure, ελέγξτε ότι η επιλεγμένη διαχειριζόμενη ταυτότητα είναι η επιθυμητή.

### Ζήτημα: Άρνηση Πρόσβασης σε Key Vault

**Συμπτώματα:**
```
Error: The user, group or application does not have secrets get permission
```

**Λύσεις:**

1. **Παρέχετε Δικαιώματα Key Vault:**

Χρησιμοποιήστε μόνο το ακόλουθο απόσπασμα πολιτικής πρόσβασης για δοχείο με `enableRbacAuthorization: false`. Για δοχείο με ενεργοποιημένο RBAC, χρησιμοποιήστε την επιλογή 2· η προσθήκη πολιτικής πρόσβασης δεν παρέχει πρόσβαση στη διεπαφή δεδομένων σε λειτουργία RBAC.
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

2. **Χρησιμοποιήστε RBAC Αντί Πολιτικών Πρόσβασης:**

Το δοχείο πρέπει να έχει `enableRbacAuthorization: true`· η αλλαγή μοντέλου δικαιωμάτων απαιτεί προγραμματισμένη μετανάστευση της υπάρχουσας πρόσβασης.
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

### Ζήτημα: Έκδοση Μοντέλου Μη Διαθέσιμη

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

### Ζήτημα: Μεγάλη Καθυστέρηση Απαντήσεων

**Συμπτώματα:**
- Χρόνοι απόκρισης > 30 δευτερόλεπτα
- Σφάλματα χρονικού ορίου
- Κακή εμπειρία χρήστη

**Λύσεις:**

1. **Εφαρμόστε Χρονικούς Περιορισμούς Αιτήσεων:**
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

2. **Προσθέστε Αποθήκευση Αποτελεσμάτων (Caching):**
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

3. **Διαμορφώστε Αυτόματο Κλιμάκωση:**
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

1. **Αύξηση Κατανομής Μνήμης:**
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

2. **Βελτιστοποίηση Χρήσης Μνήμης:**
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

## Διαχείριση Κόστους και Ποσοστώσεων

### Πρόβλημα: Απρόσμενα Υψηλά Κόστη

**Συμπτώματα:**
- Λογαριασμός Azure υψηλότερος από τον αναμενόμενο
- Χρήση token που υπερβαίνει τις εκτιμήσεις
- Ενεργοποίηση ειδοποιήσεων προϋπολογισμού

**Λύσεις:**

1. **Εφαρμογή Ελέγχων Κόστους:**
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

Αυτό το μετρητή μνήμης εντός μνήμης είναι ενδεικτικό, όχι έλεγχος μηνιαίας δαπάνης: επαναρυθμίζεται κατά την επανεκκίνηση, δεν μοιράζεται ανάμεσα σε αντίγραφα και ελέγχει τη χρήση μόνο μετά από κλήση. Ένα πραγματικό όριο χρειάζεται ανθεκτική απογραφή, ασφαλείς κρατήσεις πριν από αιτήσεις και πολιτική μηνιαίας επαναφοράς. Τα μετρικά μνήμης κοντέινερ πρέπει επίσης να λαμβάνουν υπόψη τα όρια cgroup· `psutil.virtual_memory()` δεν είναι αξιόπιστο μέτρο ορίου κοντέινερ και η συλλογή απορριμμάτων δεν επιβάλλει όριο μνήμης.

2. **Ορισμός Ειδοποιήσεων Κόστους:**
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

Δηλώστε `budgetStartDate` και `budgetEndDate` στο πρότυπό σας. Οι προϋπολογισμοί ειδοποιούν· δεν σταματούν πόρους ή δεν επιβάλλουν αυστηρό όριο δαπανών.

3. **Βελτιστοποίηση Επιλογής Μοντέλου:**
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

Εάν αναπτύξατε agents χρησιμοποιώντας `azd ai agent init`, αυτά τα επιπλέον εργαλεία είναι διαθέσιμα:

```bash
# Ensure the agents extension is installed
azd extension install azure.ai.agents

# Check project storage permissions and agent configuration
azd ai agent doctor

# Inspect the deployed endpoint
azd ai agent endpoint show

# Use the MCP server to let AI tools query project state
azd mcp start

# Generate infrastructure files for review and audit
azd infra generate
```

> **Συμβουλή:** Χρησιμοποιήστε `azd infra generate` για να γράψετε IaC στο δίσκο ώστε να μπορείτε να ελέγξετε ακριβώς ποιους πόρους προμήθευσατε. Αυτό είναι ανεκτίμητο όταν αποσφαλματώνετε ζητήματα διαμόρφωσης πόρων. Δείτε την [αναφορά AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) για πλήρεις λεπτομέρειες.

**Διαγνωστικά με επίγνωση έκδοσης (2026-11-04):** Οι agents `1.0.0-beta.23` απαιτούν `azd >= 1.37.0`· αναβαθμίστε το βασικό CLI πριν από ασύμβατες επεκτάσεις. Αυτή η έκδοση agent διατηρεί προειδοποιήσεις RBAC προγραμματιστή στην τελική έξοδο ανάπτυξης και εντοπίζει την έκδοση που εμπλέκεται σε αποτυχημένες ενεργοποιήσεις/χρόνους αναμονής. Μια καθυστέρηση δεν αποδεικνύει αποτυχία ανάπτυξης: ελέγξτε την εκδοχή που επιχειρήθηκε πριν από επανάληψη. Διορθώνει επίσης τις κλήσεις A2A 0.3 που εμφάνιζαν μηνύματα κύκλου ζωής αντί για ολοκληρωμένες απαντήσεις. Η βασική `azd 1.37.1` διορθώνει τη μετάδοση ακύρωσης μεταξύ επεκτάσεων· η `1.37.2` βελτιώνει τις κρίσιμες επιβεβαιώσεις παροχής και τη διαχείριση ακυρώσεων.

Εάν η εντολή αξιολόγησης παλαιότερου οδηγού τυπώνει μόνο οδηγίες μετανάστευσης, εγκαταστήστε `azure.ai.evaluations` (`1.0.0-beta.2` απαιτεί `azd >= 1.33.0`) και χρησιμοποιήστε `azd ai eval init`, `generate`, και `run start`. Το εργαλείο βελτιστοποίησης `--config` δεν δέχεται πλέον αρχεία αξιολόγησης παλαιάς μορφής. Δείτε [μετανάστευση αξιολόγησης](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) και [μετανάστευση βελτιστοποίησης](../chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

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

2. **Σημεία Έλεγχου Υγείας:**
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
| 403 | Απαγόρευση | Επαληθεύστε τις αναθέσεις ρόλων RBAC |
| 429 | Περιορισμός Ροής | Εφαρμόστε λογική επανάληψης με εκθετική αύξηση καθυστέρησης |
| 500 | Εσωτερικό Σφάλμα Διακομιστή | Ελέγξτε την κατάσταση ανάπτυξης μοντέλου και τα αρχεία καταγραφής |
| 503 | Υπηρεσία Μη Διαθέσιμη | Επαληθεύστε την υγεία της υπηρεσίας και τη διαθεσιμότητα στην περιοχή |

## Επόμενα Βήματα

1. **Επανεξέταση του [Οδηγού Ανάπτυξης AI Μοντέλων](../chapter-02-ai-development/ai-model-deployment.md)** για βέλτιστες πρακτικές ανάπτυξης
2. **Ολοκλήρωση των [Βέλτιστων Πρακτικών AI Παραγωγής](../chapter-08-production/production-ai-practices.md)** για λύσεις έτοιμες για επιχειρήσεις
3. **Συμμετοχή στο [Microsoft Foundry Discord](https://aka.ms/foundry/discord)** για υποστήριξη κοινότητας
4. **Υποβολή ζητημάτων** στο [αποθετήριο AZD στο GitHub](https://github.com/Azure/azure-dev) για προβλήματα ειδικά στο AZD

## Πόροι

- [Αντιμετώπιση προβλημάτων ποσοστώσεων και ρύθμισης του Azure OpenAI](https://learn.microsoft.com/azure/ai-foundry/openai/how-to/quota)
- [Αντιμετώπιση προβλημάτων Container Apps](https://learn.microsoft.com/azure/container-apps/troubleshooting)
- [Αντιμετώπιση προβλημάτων Azure AI Search](https://learn.microsoft.com/azure/search/search-monitor-logs)
- [**Δεξιότητα εργαλείων διάγνωσης Azure**](https://skills.sh/microsoft/github-copilot-for-azure/azure-diagnostics) - Εγκαταστήστε δεξιότητες αντιμετώπισης προβλημάτων Azure στον επεξεργαστή σας: `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 7 - Αντιμετώπιση Προβλημάτων & Αποσφαλμάτωση
- **⬅️ Προηγούμενο**: [Οδηγός Αποσφαλμάτωσης](debugging.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 8: Παραγωγικά & Επιχειρησιακά Πρότυπα](../chapter-08-production/production-ai-practices.md)
- **🤖 Σχετικό**: [Κεφάλαιο 2: Ανάπτυξη με AI Πρώτο](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **📖 Αναφορά**: [Azure Developer CLI Αντιμετώπιση Προβλημάτων](https://learn.microsoft.com/azure/developer/azure-developer-cli/troubleshoot)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->