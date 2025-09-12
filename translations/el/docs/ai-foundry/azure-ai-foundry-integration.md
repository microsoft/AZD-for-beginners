<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a284fb7fdbdf2f5d737de7d08f0ade9",
  "translation_date": "2025-09-12T21:42:45+00:00",
  "source_file": "docs/ai-foundry/azure-ai-foundry-integration.md",
  "language_code": "el"
}
-->
# Ενσωμάτωση του Azure AI Foundry με το AZD

**Προηγούμενο:** [Πρώτο Έργο](../getting-started/first-project.md) | **Επόμενο:** [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)

## Επισκόπηση

Αυτός ο οδηγός δείχνει πώς να ενσωματώσετε τις υπηρεσίες του Azure AI Foundry με το Azure Developer CLI (AZD) για απλοποιημένες αναπτύξεις εφαρμογών AI. Το Azure AI Foundry παρέχει μια ολοκληρωμένη πλατφόρμα για τη δημιουργία, την ανάπτυξη και τη διαχείριση εφαρμογών AI, ενώ το AZD απλοποιεί τη διαδικασία υποδομής και ανάπτυξης.

## Τι είναι το Azure AI Foundry;

Το Azure AI Foundry είναι η ενοποιημένη πλατφόρμα της Microsoft για την ανάπτυξη AI που περιλαμβάνει:

- **Κατάλογος Μοντέλων**: Πρόσβαση σε κορυφαία μοντέλα AI
- **Prompt Flow**: Οπτικός σχεδιαστής για ροές εργασίας AI
- **Πύλη AI Foundry**: Ενσωματωμένο περιβάλλον ανάπτυξης για εφαρμογές AI
- **Επιλογές Ανάπτυξης**: Πολλαπλές επιλογές φιλοξενίας και κλιμάκωσης
- **Ασφάλεια και Προστασία**: Ενσωματωμένα χαρακτηριστικά υπεύθυνου AI

## AZD + Azure AI Foundry: Καλύτερα Μαζί

| Χαρακτηριστικό | Azure AI Foundry | Πλεονέκτημα Ενσωμάτωσης με AZD |
|----------------|------------------|-------------------------------|
| **Ανάπτυξη Μοντέλου** | Χειροκίνητη ανάπτυξη μέσω πύλης | Αυτοματοποιημένες, επαναλαμβανόμενες αναπτύξεις |
| **Υποδομή** | Παροχή μέσω κλικ | Υποδομή ως Κώδικας (Bicep) |
| **Διαχείριση Περιβάλλοντος** | Εστίαση σε ένα περιβάλλον | Πολλαπλά περιβάλλοντα (dev/staging/prod) |
| **Ενσωμάτωση CI/CD** | Περιορισμένη | Ενσωματωμένη υποστήριξη GitHub Actions |
| **Διαχείριση Κόστους** | Βασική παρακολούθηση | Βελτιστοποίηση κόστους ανά περιβάλλον |

## Προαπαιτούμενα

- Συνδρομή Azure με κατάλληλες άδειες
- Εγκατεστημένο Azure Developer CLI
- Πρόσβαση στις υπηρεσίες Azure OpenAI
- Βασική εξοικείωση με το Azure AI Foundry

## Βασικά Μοτίβα Ενσωμάτωσης

### Μοτίβο 1: Ενσωμάτωση Azure OpenAI

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών συνομιλίας με μοντέλα Azure OpenAI

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      - AZURE_OPENAI_ENDPOINT
      - AZURE_OPENAI_API_KEY
```

**Υποδομή (main.bicep):**
```bicep
// Azure OpenAI Account
resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: openAIAccountName
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: openAIAccountName
    disableLocalAuth: false
  }
}

// Deploy GPT model
resource gptDeployment 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAIAccount
  name: 'gpt-35-turbo'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-35-turbo'
      version: '0613'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Μοτίβο 2: Ενσωμάτωση AI Search + RAG

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών με ενίσχυση ανάκτησης (RAG)

```bicep
// Azure AI Search
resource searchService 'Microsoft.Search/searchServices@2023-11-01' = {
  name: searchServiceName
  location: location
  sku: {
    name: 'basic'
  }
  properties: {
    replicaCount: 1
    partitionCount: 1
    hostingMode: 'default'
  }
}

// Connect Search with OpenAI
resource searchConnection 'Microsoft.Search/searchServices/dataConnections@2023-11-01' = {
  parent: searchService
  name: 'openai-connection'
  properties: {
    targetResourceId: openAIAccount.id
    authenticationMethod: 'managedIdentity'
  }
}
```

### Μοτίβο 3: Ενσωμάτωση Ευφυΐας Εγγράφων

**Περίπτωση Χρήσης**: Επεξεργασία και ανάλυση εγγράφων

```bicep
// Document Intelligence service
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: documentIntelligenceName
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: documentIntelligenceName
  }
}

// Storage for document processing
resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    allowBlobPublicAccess: false
  }
}
```

## 🔧 Μοτίβα Ρύθμισης

### Ρύθμιση Μεταβλητών Περιβάλλοντος

**Ρύθμιση Παραγωγής:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Ρύθμιση Ανάπτυξης:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Ασφαλής Ρύθμιση με Key Vault

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    sku: {
      family: 'A'
      name: 'standard'
    }
    accessPolicies: [
      {
        tenantId: tenant().tenantId
        objectId: webAppIdentity.properties.principalId
        permissions: {
          secrets: ['get']
        }
      }
    ]
  }
}

// Store OpenAI key securely
resource openAIKeySecret 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: keyVault
  name: 'openai-api-key'
  properties: {
    value: openAIAccount.listKeys().key1
  }
}
```

## Ροές Εργασίας Ανάπτυξης

### Ανάπτυξη με Μία Εντολή

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only
```

### Αναπτύξεις Ανά Περιβάλλον

```bash
# Development environment
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Production environment
azd env new production
azd env set AZURE_LOCATION westus2
azd env set ENVIRONMENT_TYPE prod
azd env set AZURE_OPENAI_CAPACITY 100
azd up
```

## Παρακολούθηση και Παρατηρησιμότητα

### Ενσωμάτωση Application Insights

```bicep
// Application Insights for AI application monitoring
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  name: applicationInsightsName
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    WorkspaceResourceId: logAnalyticsWorkspace.id
  }
}

// Custom metrics for AI operations
resource customMetrics 'Microsoft.Insights/components/analyticsItems@2015-05-01' = {
  parent: applicationInsights
  name: 'AI-Metrics'
  properties: {
    name: 'AI Operations Metrics'
    content: '''
      requests
      | where name contains "openai"
      | summarize 
          RequestCount = count(),
          AvgDuration = avg(duration),
          SuccessRate = countif(success == true) * 100.0 / count()
      by bin(timestamp, 5m)
    '''
  }
}
```

### Παρακολούθηση Κόστους

```bicep
// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2024-12-31'
    }
    timeGrain: 'Monthly'
    amount: 500
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: [
          'admin@company.com'
        ]
      }
    }
  }
}
```

## 🔐 Βέλτιστες Πρακτικές Ασφάλειας

### Ρύθμιση Διαχειριζόμενης Ταυτότητας

```bicep
// Managed identity for the web application
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: '${appName}-identity'
  location: location
}

// Assign OpenAI User role
resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id, 'Cognitive Services OpenAI User')
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
    principalType: 'ServicePrincipal'
  }
}
```

### Ασφάλεια Δικτύου

```bicep
// Private endpoints for AI services
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: '${openAIAccountName}-pe'
  location: location
  properties: {
    subnet: {
      id: virtualNetwork.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

## Βελτιστοποίηση Απόδοσης

### Στρατηγικές Caching

```yaml
# azure.yaml - Redis cache integration
services:
  api:
    project: ./api
    host: containerapp
    env:
      - REDIS_CONNECTION_STRING
      - CACHE_TTL=3600
```

```bicep
// Redis cache for AI responses
resource redisCache 'Microsoft.Cache/redis@2023-04-01' = {
  name: redisCacheName
  location: location
  properties: {
    sku: {
      name: 'Basic'
      family: 'C'
      capacity: 1
    }
    enableNonSslPort: false
    minimumTlsVersion: '1.2'
  }
}
```

### Ρύθμιση Αυτόματης Κλιμάκωσης

```bicep
// Container App with auto-scaling
resource containerApp 'Microsoft.App/containerApps@2023-05-01' = {
  name: containerAppName
  location: location
  properties: {
    configuration: {
      ingress: {
        external: true
        targetPort: 8000
      }
    }
    template: {
      scale: {
        minReplicas: 1
        maxReplicas: 10
        rules: [
          {
            name: 'http-scaling'
            http: {
              metadata: {
                concurrentRequests: '30'
              }
            }
          }
        ]
      }
    }
  }
}
```

## Επίλυση Συνηθισμένων Προβλημάτων

### Πρόβλημα 1: Υπέρβαση Ποσοστώσεων OpenAI

**Συμπτώματα:**
- Αποτυχία ανάπτυξης λόγω σφαλμάτων ποσοστώσεων
- Σφάλματα 429 στα αρχεία καταγραφής εφαρμογών

**Λύσεις:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try different region
azd env set AZURE_LOCATION westus2
azd up

# Reduce capacity temporarily
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Πρόβλημα 2: Αποτυχίες Επαλήθευσης Ταυτότητας

**Συμπτώματα:**
- Σφάλματα 401/403 κατά την κλήση υπηρεσιών AI
- Μηνύματα "Άρνηση πρόσβασης"

**Λύσεις:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Πρόβλημα 3: Προβλήματα Ανάπτυξης Μοντέλων

**Συμπτώματα:**
- Μοντέλα μη διαθέσιμα στην ανάπτυξη
- Αποτυχία συγκεκριμένων εκδόσεων μοντέλων

**Λύσεις:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Πρότυπα Παραδείγματα

### Βασική Εφαρμογή Συνομιλίας

**Αποθετήριο**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Υπηρεσίες**: Azure OpenAI + Cognitive Search + App Service

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Αγωγός Επεξεργασίας Εγγράφων

**Αποθετήριο**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Υπηρεσίες**: Ευφυΐα Εγγράφων + Αποθήκευση + Functions

**Γρήγορη Εκκίνηση**:
```bash
azd init --template ai-document-processing
azd up
```

### Εταιρική Συνομιλία με RAG

**Αποθετήριο**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Υπηρεσίες**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Γρήγορη Εκκίνηση**:
```bash
azd init --template contoso-chat
azd up
```

## Επόμενα Βήματα

1. **Δοκιμάστε τα Παραδείγματα**: Ξεκινήστε με ένα έτοιμο πρότυπο που ταιριάζει στην περίπτωσή σας
2. **Προσαρμόστε στις Ανάγκες Σας**: Τροποποιήστε την υποδομή και τον κώδικα εφαρμογής
3. **Προσθέστε Παρακολούθηση**: Εφαρμόστε ολοκληρωμένη παρατηρησιμότητα
4. **Βελτιστοποιήστε το Κόστος**: Ρυθμίστε τις παραμέτρους για τον προϋπολογισμό σας
5. **Ασφαλίστε την Ανάπτυξή Σας**: Εφαρμόστε πρότυπα ασφάλειας για επιχειρήσεις
6. **Κλιμακώστε στην Παραγωγή**: Προσθέστε δυνατότητες πολλαπλών περιοχών και υψηλής διαθεσιμότητας

## Κοινότητα και Υποστήριξη

- **Azure AI Foundry Discord**: [#Azure κανάλι](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Θέματα και συζητήσεις](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Επίσημη τεκμηρίωση](https://learn.microsoft.com/azure/ai-studio/)

---

**Προηγούμενο:** [Πρώτο Έργο](../getting-started/first-project.md) | **Επόμενο:** [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)

**Χρειάζεστε Βοήθεια;** Συμμετάσχετε στις συζητήσεις της κοινότητας ή ανοίξτε ένα θέμα στο αποθετήριο. Η κοινότητα Azure AI + AZD είναι εδώ για να σας βοηθήσει να πετύχετε!

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.