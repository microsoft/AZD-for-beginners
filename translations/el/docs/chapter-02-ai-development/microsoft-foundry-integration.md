# Microsoft Foundry Ενσωμάτωση με AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-First Development
- **⬅️ Προηγούμενο Κεφάλαιο**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Επισκόπηση

Αυτός ο οδηγός δείχνει πώς να ενσωματώσετε τις υπηρεσίες Microsoft Foundry με το Azure Developer CLI (AZD) για απλοποιημένες αναπτύξεις εφαρμογών AI. Το Microsoft Foundry παρέχει μια ολοκληρωμένη πλατφόρμα για τη δημιουργία, ανάπτυξη και διαχείριση εφαρμογών AI, ενώ το AZD απλοποιεί τη διαδικασία υποδομής και ανάπτυξης.

## Τι είναι το Microsoft Foundry;

Το Microsoft Foundry είναι η ενοποιημένη πλατφόρμα της Microsoft για ανάπτυξη AI που περιλαμβάνει:

- **Κατάλογος Μοντέλων**: Πρόσβαση σε σύγχρονα μοντέλα AI
- **Prompt Flow**: Οπτικός σχεδιαστής για ροές εργασίας AI
- **AI Foundry Portal**: Ενοποιημένο περιβάλλον ανάπτυξης για εφαρμογές AI
- **Επιλογές Ανάπτυξης**: Πολλαπλές επιλογές φιλοξενίας και κλιμάκωσης
- **Ασφάλεια και Προστασία**: Ενσωματωμένες δυνατότητες υπεύθυνης AI

## AZD + Microsoft Foundry: Καλύτερα Μαζί

| Feature | Microsoft Foundry | AZD Integration Benefit |
|---------|-----------------|------------------------|
| **Model Deployment** | Manual portal deployment | Automated, repeatable deployments |
| **Infrastructure** | Click-through provisioning | Infrastructure as Code (Bicep) |
| **Environment Management** | Single environment focus | Multi-environment (dev/staging/prod) |
| **CI/CD Integration** | Limited | Native GitHub Actions support |
| **Cost Management** | Basic monitoring | Environment-specific cost optimization |

## Απαιτούμενα

- Συνδρομή Azure με τις κατάλληλες άδειες
- Εγκατεστημένο Azure Developer CLI
- Πρόσβαση στις υπηρεσίες Azure OpenAI
- Βασική εξοικείωση με το Microsoft Foundry

## Βασικά Μοτίβα Ενσωμάτωσης

### Μοτίβο 1: Ενσωμάτωση Azure OpenAI

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών chat με μοντέλα Azure OpenAI

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

### Μοτίβο 2: AI Search + RAG Ενσωμάτωση

**Περίπτωση Χρήσης**: Ανάπτυξη εφαρμογών retrieval-augmented generation (RAG)

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

### Μοτίβο 3: Ενσωμάτωση Document Intelligence

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

## 🔧 Μοτίβα Διαμόρφωσης

### Ρύθμιση Μεταβλητών Περιβάλλοντος

**Διαμόρφωση Παραγωγής:**
```bash
# Κύριες υπηρεσίες τεχνητής νοημοσύνης
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Διαμορφώσεις μοντέλου
azd env set AZURE_OPENAI_MODEL "gpt-35-turbo"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-ada-002"

# Ρυθμίσεις απόδοσης
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Διαμόρφωση Ανάπτυξης:**
```bash
# Ρυθμίσεις βελτιστοποιημένες ως προς το κόστος για ανάπτυξη
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Δωρεάν επίπεδο
```

### Ασφαλής Διαμόρφωση με Key Vault

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

### Ανάπτυξη με Ενιαία Εντολή

```bash
# Αναπτύξτε τα πάντα με μία εντολή
azd up

# Ή αναπτύξτε σταδιακά
azd provision  # Μόνο υποδομή
azd deploy     # Μόνο εφαρμογή
```

### Αναπτύξεις ανά Περιβάλλον

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

## 🔐 Καλύτερες Πρακτικές Ασφαλείας

### Διαμόρφωση Διαχειριζόμενης Ταυτότητας

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

### Διαμόρφωση Αυτόματης Κλιμάκωσης

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

## Αντιμετώπιση Συνηθισμένων Προβλημάτων

### Πρόβλημα 1: Υπέρβαση Ορίου OpenAI

**Συμπτώματα:**
- Η ανάπτυξη αποτυγχάνει με σφάλματα ορίου
- Σφάλματα 429 στα logs της εφαρμογής

**Λύσεις:**
```bash
# Ελέγξτε τη χρήση του τρέχοντος ορίου
az cognitiveservices usage list --location eastus

# Δοκιμάστε άλλη περιοχή
azd env set AZURE_LOCATION westus2
azd up

# Μειώστε προσωρινά τη χωρητικότητα
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Πρόβλημα 2: Σφάλματα Πιστοποίησης

**Συμπτώματα:**
- Σφάλματα 401/403 όταν καλείτε υπηρεσίες AI
- Μηνύματα "Access denied"

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
- Συγκεκριμένες εκδόσεις μοντέλων αποτυγχάνουν

**Λύσεις:**
```bash
# Λίστα διαθέσιμων μοντέλων ανά περιοχή
az cognitiveservices model list --location eastus

# Ενημέρωση έκδοσης μοντέλου στο πρότυπο Bicep
# Ελέγξτε τις απαιτήσεις χωρητικότητας του μοντέλου
```

## Πρότυπα Παραδειγμάτων

### Βασική Εφαρμογή Chat

**Αποθετήριο**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Υπηρεσίες**: Azure OpenAI + Cognitive Search + App Service

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### Ροή Επεξεργασίας Εγγράφων

**Αποθετήριο**: [ai-document-processing](https://github.com/Azure-Samples/ai-document-processing)

**Υπηρεσίες**: Document Intelligence + Storage + Functions

**Γρήγορη Εκκίνηση**:
```bash
azd init --template ai-document-processing
azd up
```

### Επιχειρηματικό Chat με RAG

**Αποθετήριο**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Υπηρεσίες**: Azure OpenAI + Search + Container Apps + Cosmos DB

**Γρήγορη Εκκίνηση**:
```bash
azd init --template contoso-chat
azd up
```

## Επόμενα Βήματα

1. **Δοκιμάστε τα Παραδείγματα**: Ξεκινήστε με ένα προεγκατεστημένο πρότυπο που ταιριάζει στην περίπτωσή σας
2. **Προσαρμόστε στις Ανάγκες Σας**: Τροποποιήστε την υποδομή και τον κώδικα εφαρμογής
3. **Προσθέστε Παρακολούθηση**: Υλοποιήστε ολοκληρωμένη παρατηρησιμότητα
4. **Βελτιστοποιήστε Κόστη**: Ρυθμίστε παραμέτρους για τον προϋπολογισμό σας
5. **Ασφαλίστε την Ανάπτυξή Σας**: Εφαρμόστε πρότυπα ασφάλειας επιχείρησης
6. **Κλιμακώστε σε Παραγωγή**: Προσθέστε πολυπεριοχική και υψηλής διαθεσιμότητας αρχιτεκτονική

## 🎯 Πρακτικές Ασκήσεις

### Άσκηση 1: Ανάπτυξη Azure OpenAI Chat App (30 λεπτά)
**Στόχος**: Αναπτύξτε και δοκιμάστε μια έτοιμη για παραγωγή εφαρμογή chat AI

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

# Παρακολούθηση λειτουργιών τεχνητής νοημοσύνης
azd monitor

# Καθαρισμός
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η ανάπτυξη ολοκληρώνεται χωρίς σφάλματα ορίου
- [ ] Μπορείτε να έχετε πρόσβαση στη διεπαφή chat στον browser
- [ ] Μπορείτε να κάνετε ερωτήσεις και να λαμβάνετε απαντήσεις με AI
- [ ] Το Application Insights εμφανίζει telemetry δεδομένα
- [ ] Οι πόροι καθαρίστηκαν επιτυχώς

**Εκτιμώμενο Κόστος**: $5-10 για 30 λεπτά δοκιμής

### Άσκηση 2: Διαμόρφωση Πολλαπλής Ανάπτυξης Μοντέλων (45 λεπτά)
**Στόχος**: Αναπτύξτε πολλαπλά μοντέλα AI με διαφορετικές διαμορφώσεις

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
- [ ] Πολλαπλά μοντέλα αναπτύχθηκαν επιτυχώς
- [ ] Εφαρμόστηκαν διαφορετικές ρυθμίσεις χωρητικότητας
- [ ] Τα μοντέλα είναι προσβάσιμα μέσω API
- [ ] Μπορείτε να καλείτε και τα δύο μοντέλα από την εφαρμογή

### Άσκηση 3: Υλοποίηση Παρακολούθησης Κόστους (20 λεπτά)
**Στόχος**: Ρύθμιση ειδοποιήσεων προϋπολογισμού και παρακολούθησης κόστους

```bash
# Προσθέστε ειδοποίηση προϋπολογισμού στο Bicep
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

# Αναπτύξτε ειδοποίηση προϋπολογισμού
azd provision

# Ελέγξτε τα τρέχοντα κόστη
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκε ειδοποίηση προϋπολογισμού στο Azure
- [ ] Διαμορφώθηκαν ειδοποιήσεις μέσω email
- [ ] Μπορείτε να δείτε δεδομένα κόστους στο Azure Portal
- [ ] Οι κατώφλια προϋπολογισμού ορίστηκαν κατάλληλα

## 💡 Συχνές Ερωτήσεις

<details>
<summary><strong>Πώς μειώνω τα κόστη Azure OpenAI κατά την ανάπτυξη;</strong></summary>

1. **Χρησιμοποιήστε Δωρεάν Επίπεδο**: Το Azure OpenAI προσφέρει 50.000 tokens/μήνα δωρεάν
2. **Μειώστε τη Χωρητικότητα**: Ορίστε χωρητικότητα σε 10 TPM αντί για 30+ για ανάπτυξη
3. **Χρησιμοποιήστε azd down**: Αποδεσμεύστε πόρους όταν δεν αναπτύσσετε ενεργά
4. **Cache Απαντήσεις**: Υλοποιήστε Redis cache για επαναλαμβανόμενα ερωτήματα
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
- Ασφάλεια και συμμόρφωση επιπέδου επιχείρησης
- Ενσωμάτωση σε ιδιωτικό δίκτυο
- Εγγυήσεις SLA
- Πιστοποίηση με managed identity
- Διαθέσιμα υψηλότερα όρια

**OpenAI API**:
- Πιο γρήγορη πρόσβαση σε νέα μοντέλα
- Απλούστερη ρύθμιση
- Χαμηλότερο εμπόδιο εισόδου
- Μόνο δημόσιο διαδίκτυο

Για εφαρμογές παραγωγής, **συνιστάται το Azure OpenAI**.
</details>

<details>
<summary><strong>Πώς χειρίζομαι σφάλματα υπέρβασης ορίων Azure OpenAI;</strong></summary>

```bash
# Ελέγξτε το τρέχον όριο
az cognitiveservices usage list --location eastus2

# Δοκιμάστε άλλη περιοχή
azd env set AZURE_LOCATION westus2
azd up

# Μειώστε τη χωρητικότητα προσωρινά
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Ζητήστε αύξηση ορίου
# Μεταβείτε στο Azure Portal > Όρια > Αίτηση αύξησης
```
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω τα δικά μου δεδομένα με το Azure OpenAI;</strong></summary>

Ναι! Χρησιμοποιήστε **Azure AI Search** για RAG (Retrieval Augmented Generation):

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
<summary><strong>Πώς ασφαλίζω τα endpoints των μοντέλων AI;</strong></summary>

**Καλύτερες Πρακτικές**:
1. Χρησιμοποιήστε Managed Identity (χωρίς API keys)
2. Ενεργοποιήστε Private Endpoints
3. Διαμορφώστε network security groups
4. Υλοποιήστε rate limiting
5. Χρησιμοποιήστε Azure Key Vault για μυστικά

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

- **Microsoft Foundry Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Issues and discussions](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Official documentation](https://learn.microsoft.com/azure/ai-studio/)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-First Development
- **⬅️ Προηγούμενο Κεφάλαιο**: [Chapter 1: Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

**Χρειάζεστε βοήθεια;** Συμμετάσχετε στις συζητήσεις της κοινότητας ή ανοίξτε ένα issue στο αποθετήριο. Η κοινότητα Azure AI + AZD είναι εδώ για να σας βοηθήσει να πετύχετε!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για την ακρίβεια, παρακαλούμε σημειώστε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στην πρωτότυπη γλώσσα του πρέπει να θεωρείται ως η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρανοήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->