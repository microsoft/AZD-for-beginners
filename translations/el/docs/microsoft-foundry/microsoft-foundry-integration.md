<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2e61bc7db9c28647211ab64e03045882",
  "translation_date": "2025-11-21T11:18:32+00:00",
  "source_file": "docs/microsoft-foundry/microsoft-foundry-integration.md",
  "language_code": "el"
}
-->
# Ενσωμάτωση του Microsoft Foundry με το AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο σας Έργο](../getting-started/first-project.md)
- **➡️ Επόμενο**: [Ανάπτυξη Μοντέλου Τεχνητής Νοημοσύνης](ai-model-deployment.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρυθμίσεις](../getting-started/configuration.md)

## Επισκόπηση

Αυτός ο οδηγός δείχνει πώς να ενσωματώσετε τις υπηρεσίες του Microsoft Foundry με το Azure Developer CLI (AZD) για απλοποιημένες αναπτύξεις εφαρμογών τεχνητής νοημοσύνης. Το Microsoft Foundry παρέχει μια ολοκληρωμένη πλατφόρμα για τη δημιουργία, την ανάπτυξη και τη διαχείριση εφαρμογών τεχνητής νοημοσύνης, ενώ το AZD απλοποιεί τη διαδικασία υποδομής και ανάπτυξης.

## Τι είναι το Microsoft Foundry;

Το Microsoft Foundry είναι η ενοποιημένη πλατφόρμα της Microsoft για την ανάπτυξη τεχνητής νοημοσύνης που περιλαμβάνει:

- **Κατάλογος Μοντέλων**: Πρόσβαση σε κορυφαία μοντέλα τεχνητής νοημοσύνης
- **Prompt Flow**: Οπτικός σχεδιαστής για ροές εργασίας τεχνητής νοημοσύνης
- **Πύλη AI Foundry**: Ενσωματωμένο περιβάλλον ανάπτυξης για εφαρμογές τεχνητής νοημοσύνης
- **Επιλογές Ανάπτυξης**: Πολλαπλές επιλογές φιλοξενίας και κλιμάκωσης
- **Ασφάλεια και Προστασία**: Ενσωματωμένα χαρακτηριστικά υπεύθυνης τεχνητής νοημοσύνης

## AZD + Microsoft Foundry: Καλύτερα Μαζί

| Χαρακτηριστικό | Microsoft Foundry | Όφελος Ενσωμάτωσης AZD |
|----------------|-------------------|------------------------|
| **Ανάπτυξη Μοντέλων** | Χειροκίνητη ανάπτυξη μέσω πύλης | Αυτοματοποιημένες, επαναλαμβανόμενες αναπτύξεις |
| **Υποδομή** | Παροχή μέσω κλικ | Υποδομή ως Κώδικας (Bicep) |
| **Διαχείριση Περιβάλλοντος** | Εστίαση σε ένα περιβάλλον | Πολλαπλά περιβάλλοντα (dev/staging/prod) |
| **Ενσωμάτωση CI/CD** | Περιορισμένη | Εγγενής υποστήριξη GitHub Actions |
| **Διαχείριση Κόστους** | Βασική παρακολούθηση | Βελτιστοποίηση κόστους ανά περιβάλλον |

## Προαπαιτούμενα

- Συνδρομή Azure με κατάλληλες άδειες
- Εγκατεστημένο Azure Developer CLI
- Πρόσβαση στις υπηρεσίες Azure OpenAI
- Βασική εξοικείωση με το Microsoft Foundry

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

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών δημιουργίας με ενισχυμένη ανάκτηση (RAG)

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

**Περίπτωση Χρήσης**: Ροές εργασίας επεξεργασίας και ανάλυσης εγγράφων

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
# Βασικές υπηρεσίες AI
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Ρυθμίσεις μοντέλου
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Ρυθμίσεις απόδοσης
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Ρύθμιση Ανάπτυξης:**
```bash
# Ρυθμίσεις βελτιστοποιημένες για κόστος κατά την ανάπτυξη
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Δωρεάν επίπεδο
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
# Αναπτύξτε τα πάντα με μία εντολή
azd up

# Ή αναπτύξτε σταδιακά
azd provision  # Μόνο υποδομή
azd deploy     # Μόνο εφαρμογή
```

### Αναπτύξεις Ανά Περιβάλλον

```bash
# Περιβάλλον ανάπτυξης
azd env new development
azd env set AZURE_LOCATION eastus
azd env set ENVIRONMENT_TYPE dev
azd up

# Περιβάλλον παραγωγής
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

## 🔐 Βέλτιστες Πρακτικές Ασφαλείας

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

### Στρατηγικές Cache

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

### Πρόβλημα 1: Υπέρβαση Ποσόστωσης OpenAI

**Συμπτώματα:**
- Η ανάπτυξη αποτυγχάνει με σφάλματα ποσόστωσης
- Σφάλματα 429 στα αρχεία καταγραφής εφαρμογών

**Λύσεις:**
```bash
# Ελέγξτε την τρέχουσα χρήση ποσοστώσεων
az cognitiveservices usage list --location eastus

# Δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up

# Μειώστε προσωρινά την χωρητικότητα
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Πρόβλημα 2: Αποτυχίες Επαλήθευσης Ταυτότητας

**Συμπτώματα:**
- Σφάλματα 401/403 κατά την κλήση υπηρεσιών AI
- Μηνύματα "Πρόσβαση απορρίφθηκε"

**Λύσεις:**
```bash
# Επαληθεύστε τις αναθέσεις ρόλων
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Ελέγξτε τη διαμόρφωση της διαχειριζόμενης ταυτότητας
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Επικυρώστε την πρόσβαση στο Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Πρόβλημα 3: Προβλήματα Ανάπτυξης Μοντέλων

**Συμπτώματα:**
- Τα μοντέλα δεν είναι διαθέσιμα στην ανάπτυξη
- Αποτυχία συγκεκριμένων εκδόσεων μοντέλων

**Λύσεις:**
```bash
# Λίστα διαθέσιμων μοντέλων ανά περιοχή
az cognitiveservices model list --location eastus

# Ενημέρωση έκδοσης μοντέλου στο πρότυπο bicep
# Έλεγχος απαιτήσεων χωρητικότητας μοντέλου
```

## Παραδείγματα Προτύπων

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

**Υπηρεσίες**: Document Intelligence + Storage + Functions

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
2. **Προσαρμόστε στις Ανάγκες σας**: Τροποποιήστε την υποδομή και τον κώδικα εφαρμογής
3. **Προσθέστε Παρακολούθηση**: Εφαρμόστε ολοκληρωμένη παρατηρησιμότητα
4. **Βελτιστοποιήστε το Κόστος**: Ρυθμίστε τις παραμέτρους για τον προϋπολογισμό σας
5. **Ασφαλίστε την Ανάπτυξή σας**: Εφαρμόστε πρότυπα ασφάλειας για επιχειρήσεις
6. **Κλιμακώστε στην Παραγωγή**: Προσθέστε δυνατότητες πολλαπλών περιοχών και υψηλής διαθεσιμότητας

## 🎯 Ασκήσεις Πρακτικής

### Άσκηση 1: Ανάπτυξη Εφαρμογής Συνομιλίας Azure OpenAI (30 λεπτά)
**Στόχος**: Ανάπτυξη και δοκιμή μιας έτοιμης για παραγωγή εφαρμογής συνομιλίας AI

```bash
# Αρχικοποίηση προτύπου
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ορισμός μεταβλητών περιβάλλοντος
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Ανάπτυξη
azd up

# Δοκιμή της εφαρμογής
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Παρακολούθηση λειτουργιών AI
azd monitor

# Εκκαθάριση
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η ανάπτυξη ολοκληρώνεται χωρίς σφάλματα ποσόστωσης
- [ ] Πρόσβαση στη διεπαφή συνομιλίας μέσω προγράμματος περιήγησης
- [ ] Υποβολή ερωτήσεων και λήψη απαντήσεων με AI
- [ ] Τα Application Insights εμφανίζουν δεδομένα τηλεμετρίας
- [ ] Επιτυχής καθαρισμός πόρων

**Εκτιμώμενο Κόστος**: $5-10 για 30 λεπτά δοκιμών

### Άσκηση 2: Ρύθμιση Ανάπτυξης Πολλαπλών Μοντέλων (45 λεπτά)
**Στόχος**: Ανάπτυξη πολλαπλών μοντέλων AI με διαφορετικές ρυθμίσεις

```bash
# Δημιουργήστε προσαρμοσμένη διαμόρφωση Bicep
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// GPT-4o-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4o-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4o-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}

// Text embedding for search
resource embedding 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'text-embedding-ada-002'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-ada-002'
      version: '2'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 50
    }
  }
  dependsOn: [gpt4omini]
}
EOF

# Αναπτύξτε και επαληθεύστε
azd provision
azd show
```

**Κριτήρια Επιτυχίας:**
- [ ] Επιτυχής ανάπτυξη πολλαπλών μοντέλων
- [ ] Εφαρμογή διαφορετικών ρυθμίσεων χωρητικότητας
- [ ] Πρόσβαση στα μοντέλα μέσω API
- [ ] Κλήση και των δύο μοντέλων από την εφαρμογή

### Άσκηση 3: Εφαρμογή Παρακολούθησης Κόστους (20 λεπτά)
**Στόχος**: Ρύθμιση ειδοποιήσεων προϋπολογισμού και παρακολούθησης κόστους

```bash
# Προσθήκη ειδοποίησης προϋπολογισμού στο Bicep
cat >> infra/main.bicep << 'EOF'

resource budget 'Microsoft.Consumption/budgets@2023-05-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: '2024-01-01'
      endDate: '2025-12-31'
    }
    timeGrain: 'Monthly'
    amount: 200
    category: 'Cost'
    notifications: {
      notification1: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 80
        contactEmails: ['your-email@example.com']
      }
      notification2: {
        enabled: true
        operator: 'GreaterThan'
        threshold: 100
        contactEmails: ['your-email@example.com']
      }
    }
  }
}
EOF

# Ανάπτυξη ειδοποίησης προϋπολογισμού
azd provision

# Έλεγχος τρεχόντων εξόδων
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργία ειδοποίησης προϋπολογισμού στο Azure
- [ ] Ρύθμιση ειδοποιήσεων μέσω email
- [ ] Προβολή δεδομένων κόστους στο Azure Portal
- [ ] Κατάλληλη ρύθμιση ορίων προϋπολογισμού

## 💡 Συχνές Ερωτήσεις

<details>
<summary><strong>Πώς μπορώ να μειώσω το κόστος Azure OpenAI κατά την ανάπτυξη;</strong></summary>

1. **Χρησιμοποιήστε το Δωρεάν Πακέτο**: Το Azure OpenAI προσφέρει 50,000 tokens/μήνα δωρεάν
2. **Μειώστε τη Χωρητικότητα**: Ρυθμίστε τη χωρητικότητα σε 10 TPM αντί για 30+ για ανάπτυξη
3. **Χρησιμοποιήστε το azd down**: Απενεργοποιήστε πόρους όταν δεν αναπτύσσετε ενεργά
4. **Cache Απαντήσεων**: Εφαρμόστε Redis cache για επαναλαμβανόμενα ερωτήματα
5. **Χρησιμοποιήστε Prompt Engineering**: Μειώστε τη χρήση tokens με αποδοτικά prompts

```bash
# Διαμόρφωση ανάπτυξης
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Ποια είναι η διαφορά μεταξύ Azure OpenAI και OpenAI API;</strong></summary>

**Azure OpenAI**:
- Ασφάλεια και συμμόρφωση για επιχειρήσεις
- Ενσωμάτωση σε ιδιωτικά δίκτυα
- Εγγυήσεις SLA
- Επαλήθευση ταυτότητας με διαχειριζόμενη ταυτότητα
- Διαθέσιμες υψηλότερες ποσότητες

**OpenAI API**:
- Ταχύτερη πρόσβαση σε νέα μοντέλα
- Απλούστερη ρύθμιση
- Χαμηλότερο εμπόδιο εισόδου
- Μόνο δημόσιο διαδίκτυο

Για εφαρμογές παραγωγής, **συνιστάται το Azure OpenAI**.
</details>

<details>
<summary><strong>Πώς μπορώ να διαχειριστώ σφάλματα υπέρβασης ποσόστωσης Azure OpenAI;</strong></summary>

```bash
# Ελέγξτε την τρέχουσα ποσόστωση
az cognitiveservices usage list --location eastus2

# Δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up

# Μειώστε προσωρινά την χωρητικότητα
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Ζητήστε αύξηση ποσόστωσης
# Μεταβείτε στο Azure Portal > Ποσόστωση > Ζητήστε αύξηση
```
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω τα δικά μου δεδομένα με το Azure OpenAI;</strong></summary>

Ναι! Χρησιμοποιήστε το **Azure AI Search** για RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    env:
      - AZURE_SEARCH_ENDPOINT
      - AZURE_SEARCH_INDEX
      - AZURE_OPENAI_ENDPOINT
```

Δείτε το πρότυπο [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Πώς μπορώ να ασφαλίσω τα endpoints μοντέλων AI;</strong></summary>

**Βέλτιστες Πρακτικές**:
1. Χρησιμοποιήστε Διαχειριζόμενη Ταυτότητα (χωρίς API keys)
2. Ενεργοποιήστε Ιδιωτικά Endpoints
3. Ρυθμίστε ομάδες ασφαλείας δικτύου
4. Εφαρμόστε περιορισμό ρυθμού
5. Χρησιμοποιήστε το Azure Key Vault για μυστικά

```bicep
// Managed Identity authentication
resource webAppIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: 'web-identity'
  location: location
}

resource openAIRoleAssignment 'Microsoft.Authorization/roleAssignments@2022-04-01' = {
  scope: openAIAccount
  name: guid(openAIAccount.id, webAppIdentity.id)
  properties: {
    roleDefinitionId: subscriptionResourceId('Microsoft.Authorization/roleDefinitions', '5e0bd9bd-7b93-4f28-af87-19fc36ad61bd')
    principalId: webAppIdentity.properties.principalId
  }
}
```
</details>

## Κοινότητα και Υποστήριξη

- **Microsoft Foundry Discord**: [#Azure κανάλι](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Θέματα και συζητήσεις](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Επίσημη τεκμηρίωση](https://learn.microsoft.com/azure/ai-studio/)

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο σας Έργο](../getting-started/first-project.md)
- **➡️ Επόμενο**: [Ανάπτυξη Μοντέλου Τεχνητής Νοημοσύνης](ai-model-deployment.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρυθμίσεις](../getting-started/configuration.md)

**Χρειάζεστε Βοήθεια;** Συμμετάσχετε στις συζητήσεις της κοινότητας ή ανοίξτε ένα θέμα στο αποθετήριο. Η κοινότητα Azure AI + AZD είναι εδώ για να σας βοηθήσει να πετύχετε!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης AI [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->