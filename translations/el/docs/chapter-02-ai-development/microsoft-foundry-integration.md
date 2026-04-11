# Ενσωμάτωση Microsoft Foundry με AZD

**Chapter Navigation:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το πρώτο σας έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

## Επισκόπηση

Αυτός ο οδηγός δείχνει πώς να ενσωματώσετε τις υπηρεσίες Microsoft Foundry με το Azure Developer CLI (AZD) για απλοποιημένες αναπτύξεις εφαρμογών AI. Το Microsoft Foundry παρέχει μια ολοκληρωμένη πλατφόρμα για την κατασκευή, ανάπτυξη και διαχείριση εφαρμογών AI, ενώ το AZD απλοποιεί τη διαδικασία υποδομής και ανάπτυξης.

## Τι είναι το Microsoft Foundry;

Το Microsoft Foundry είναι η ενοποιημένη πλατφόρμα της Microsoft για ανάπτυξη AI που περιλαμβάνει:

- **Κατάλογος Μοντέλων**: Πρόσβαση σε σύγχρονα μοντέλα AI
- **Prompt Flow**: Οπτικός σχεδιαστής για ροές εργασίας AI
- **Πύλη Microsoft Foundry**: Ενοποιημένο περιβάλλον ανάπτυξης για εφαρμογές AI
- **Επιλογές Ανάπτυξης**: Πολλαπλές επιλογές φιλοξενίας και κλιμάκωσης
- **Ασφάλεια και Προστασία**: Ενσωματωμένα χαρακτηριστικά υπεύθυνου AI

## AZD + Microsoft Foundry: Καλύτερα Μαζί

| Χαρακτηριστικό | Microsoft Foundry | Όφελος Ενσωμάτωσης με AZD |
|---------|-----------------|------------------------|
| **Ανάπτυξη Μοντέλου** | Χειροκίνητη ανάπτυξη μέσω πύλης | Αυτοματοποιημένες, επαναλήψιμες αναπτύξεις |
| **Υποδομή** | Προμήθεια με κλικ | Υποδομή ως Κώδικας (Bicep) |
| **Διαχείριση Περιβάλλοντος** | Εστίαση σε ένα περιβάλλον | Πολλαπλά περιβάλλοντα (dev/staging/prod) |
| **Ενσωμάτωση CI/CD** | Περιορισμένη | Ενσωματωμένη υποστήριξη GitHub Actions |
| **Διαχείριση Κόστους** | Βασική παρακολούθηση | Βελτιστοποίηση κόστους ανά περιβάλλον |

## Προαπαιτούμενα

- Συνδρομή Azure με τα κατάλληλα δικαιώματα
- Εγκατεστημένο το Azure Developer CLI
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models
- Βασική εξοικείωση με το Microsoft Foundry

> **Τρέχουσα βάση AZD:** Αυτά τα παραδείγματα εξετάστηκαν σε σχέση με `azd` `1.23.12`. Για τη ροή εργασίας του agent AI, χρησιμοποιήστε την τρέχουσα έκδοση προεπισκόπησης της επέκτασης και ελέγξτε την εγκατεστημένη έκδοση πριν ξεκινήσετε.

## Βασικά Πρότυπα Ενσωμάτωσης

### Πρότυπο 1: Ενσωμάτωση Μοντέλων Microsoft Foundry

**Σενάριο Χρήσης**: Αναπτύξτε εφαρμογές συνομιλίας με μοντέλα Microsoft Foundry

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
// Microsoft Foundry Models Account
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
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
      version: '2024-07-18'
    }
    scaleSettings: {
      scaleType: 'Standard'
      capacity: 30
    }
  }
}
```

### Πρότυπο 2: Ενσωμάτωση AI Search + RAG

**Σενάριο Χρήσης**: Αναπτύξτε εφαρμογές ανάκτησης-ενισχυμένης παραγωγής (RAG)

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

### Πρότυπο 3: Ενσωμάτωση Document Intelligence

**Σενάριο Χρήσης**: Ροές εργασίας επεξεργασίας και ανάλυσης εγγράφων

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

## 🔧 Πρότυπα Διαμόρφωσης

### Ρύθμιση Μεταβλητών Περιβάλλοντος

**Διαμόρφωση Παραγωγής:**
```bash
# Βασικές υπηρεσίες τεχνητής νοημοσύνης
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Ρυθμίσεις μοντέλου
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

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

### Επεκτάσεις AZD για το Foundry

Το AZD παρέχει επεκτάσεις που προσθέτουν δυνατότητες ειδικές για AI για εργασία με τις υπηρεσίες Microsoft Foundry:

```bash
# Εγκαταστήστε την επέκταση Foundry agents
azd extension install azure.ai.agents

# Εγκαταστήστε την επέκταση λεπτής ρύθμισης
azd extension install azure.ai.finetune

# Εγκαταστήστε την επέκταση προσαρμοσμένων μοντέλων
azd extension install azure.ai.models

# Εμφάνιση εγκατεστημένων επεκτάσεων
azd extension list --installed

# Ελέγξτε την τρέχουσα εγκατεστημένη έκδοση της επέκτασης agent
azd extension show azure.ai.agents
```

Οι επεκτάσεις AI εξακολουθούν να εξελίσσονται γρήγορα σε προεπισκόπηση. Εάν μια εντολή συμπεριφέρεται διαφορετικά από ό,τι εμφανίζεται εδώ, αναβαθμίστε την αντίστοιχη επέκταση πριν την αντιμετώπιση προβλημάτων στο ίδιο το έργο.

### Ανάπτυξη με Προτεραιότητα στον Agent με `azd ai`

Εάν έχετε ένα agent manifest, χρησιμοποιήστε `azd ai agent init` για να δημιουργήσετε τη δομή ενός έργου συνδεδεμένου με το Foundry Agent Service:

```bash
# Αρχικοποίηση από το μανιφέστο του πράκτορα
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ανάπτυξη στο Azure
azd up
```

Οι πρόσφατες εκδόσεις προεπισκόπησης του `azure.ai.agents` πρόσθεσαν επίσης υποστήριξη αρχικοποίησης βασισμένη σε πρότυπα για το `azd ai agent init`. Εάν ακολουθείτε νεότερα δείγματα agent, ελέγξτε τη βοήθεια της επέκτασης για τις ακριβείς επιλογές (flags) που είναι διαθέσιμες στην εγκατεστημένη έκδοσή σας.

Δείτε [Εντολές CLI AZD AI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) για την πλήρη αναφορά εντολών και επιλογών.

### Ανάπτυξη με Μία Εντολή

```bash
# Αναπτύξτε τα πάντα με μία εντολή
azd up

# Ή αναπτύξτε σταδιακά
azd provision  # Μόνο υποδομή
azd deploy     # Μόνο εφαρμογή

# Για αναπτύξεις εφαρμογών AI μεγάλης διάρκειας στο azd 1.23.11+
azd deploy --timeout 1800
```

### Αναπτύξεις ειδικές ανά περιβάλλον

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

### Στρατηγικές caching

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

### Πρόβλημα 1: Υπέρβαση Ποσόστωσης OpenAI

**Συμπτώματα:**
- Η ανάπτυξη αποτυγχάνει λόγω σφαλμάτων ποσοστώσεων
- Σφάλματα 429 στα αρχεία καταγραφής εφαρμογής

**Λύσεις:**
```bash
# Ελέγξτε την τρέχουσα χρήση του ορίου
az cognitiveservices usage list --location eastus

# Δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up

# Μειώστε προσωρινά τη χωρητικότητα
azd env set AZURE_OPENAI_CAPACITY 10
azd deploy
```

### Πρόβλημα 2: Αποτυχίες Αυθεντικοποίησης

**Συμπτώματα:**
- Σφάλματα 401/403 κατά την κλήση υπηρεσιών AI
- "Πρόσβαση απορρίφθηκε" μηνύματα

**Λύσεις:**
```bash
# Επαλήθευση εκχωρήσεων ρόλων
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Έλεγχος της διαμόρφωσης της διαχειριζόμενης ταυτότητας
az webapp identity show --name YOUR_APP --resource-group YOUR_RG

# Επαλήθευση πρόσβασης στο Key Vault
az keyvault secret show --vault-name YOUR_KV --name openai-api-key
```

### Πρόβλημα 3: Ζητήματα Ανάπτυξης Μοντέλου

**Συμπτώματα:**
- Μοντέλα μη διαθέσιμα στην ανάπτυξη
- Συγκεκριμένες εκδόσεις μοντέλου που αποτυγχάνουν

**Λύσεις:**
```bash
# Καταγραφή διαθέσιμων μοντέλων ανά περιοχή
az cognitiveservices model list --location eastus

# Ενημέρωση της έκδοσης του μοντέλου στο πρότυπο Bicep
# Ελέγξτε τις απαιτήσεις χωρητικότητας του μοντέλου
```

## Παραδείγματα Προτύπων

### RAG Chat Application (Python)

**Αποθετήριο**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Περιγραφή**: Το πιο δημοφιλές δείγμα Azure AI — μια παραγωγική εφαρμογή RAG chat που σας επιτρέπει να κάνετε ερωτήσεις πάνω στα δικά σας έγγραφα. Χρησιμοποιεί GPT-4.1-mini για συνομιλία, text-embedding-3-large για embeddings και Azure AI Search για ανάκτηση. Υποστηρίζει πολυμορφικά έγγραφα, είσοδο/έξοδο ομιλίας, αυθεντικοποίηση Microsoft Entra και παρακολούθηση με Application Insights.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo
azd up
```

### RAG Chat Application (.NET)

**Αποθετήριο**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Περιγραφή**: Η ισοδύναμη έκδοση .NET/C# του παραδείγματος RAG chat σε Python. Χτισμένη με ASP.NET Core Minimal API και frontend Blazor WebAssembly. Περιλαμβάνει φωνητική συνομιλία, υποστήριξη GPT-4o-mini vision και συνοδευτικό πελάτη .NET MAUI Blazor Hybrid για desktop/mobile.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo-csharp
azd up
```

### RAG Chat Application (Java)

**Αποθετήριο**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Περιγραφή**: Έκδοση Java του δείγματος RAG chat που χρησιμοποιεί Langchain4J για ορχήστρωση AI. Υποστηρίζει μικροϋπηρεσιακή αρχιτεκτονική με γεγονότα, πολλαπλές στρατηγικές αναζήτησης (κείμενο, διάνυσμα, υβριδική), μεταφόρτωση εγγράφων με Azure Document Intelligence και ανάπτυξη είτε σε Azure Container Apps είτε σε Azure Kubernetes Service.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo-java
azd up
```

### Copilot Λιανικής Επιχείρησης με Azure AI Foundry

**Αποθετήριο**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Υπηρεσίες**: Azure OpenAI + Azure AI Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Περιγραφή**: Τελική λύση RAG για λιανική με χρήση Azure AI Foundry και Prompty. Ένα chatbot για τον λιανοπωλητή Contoso Outdoor που στηρίζει τις απαντήσεις του σε δεδομένα καταλόγου προϊόντων και παραγγελιών πελατών. Δείχνει ολόκληρη τη ροή GenAIOps — πρωτότυπο με Prompty, αξιολόγηση με βοηθούμενους από AI αξιολογητές και ανάπτυξη μέσω AZD σε Container Apps.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template contoso-chat
azd up
```

### Creative Writing Multi-Agent Application

**Αποθετήριο**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Υπηρεσίες**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Περιγραφή**: Δείγμα πολλαπλών πρακτόρων που επιδεικνύει ορχήστρωση πρακτόρων με Prompty. Χρησιμοποιεί έναν ερευνητικό agent (Bing Grounding στο Azure AI Agent Service), έναν product agent (Azure AI Search), έναν writer agent και έναν editor agent για συνεργατική παραγωγή καλά ερευνημένων άρθρων. Περιλαμβάνει CI/CD με αξιολόγηση σε GitHub Actions.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template contoso-creative-writer
azd up
```

### RAG Chat χωρίς Διακομιστές (JavaScript/TypeScript)

**Αποθετήριο**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Υπηρεσίες**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB για NoSQL + LangChain.js

**Περιγραφή**: Πλήρως serverless RAG chatbot που χρησιμοποιεί LangChain.js με Azure Functions για το API και Azure Static Web Apps για φιλοξενία. Χρησιμοποιεί Azure Cosmos DB ως vector store και βάση ιστορικού συνομιλιών. Υποστηρίζει τοπική ανάπτυξη με Ollama για δοκιμές χωρίς κόστος.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template serverless-chat-langchainjs
azd up
```

### Επιταχυντής Λύσης Chat με τα Δεδομένα σας

**Αποθετήριο**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure App Service + Azure Document Intelligence + Azure Functions + Azure Cosmos DB / PostgreSQL

**Περιγραφή**: Επιχειρηματικής κλάσης λύση RAG με portal διαχείρισης για μεταφόρτωση/διαχείριση εγγράφων, πολλαπλές επιλογές ορχηστρωτή (Semantic Kernel, LangChain, Prompt Flow), μετατροπή ομιλίας σε κείμενο, ενσωμάτωση με Microsoft Teams και επιλογή μεταξύ PostgreSQL ή Cosmos DB ως backend. Σχεδιασμένο ως προσαρμόσιμο σημείο εκκίνησης για παραγωγτικά σενάρια RAG.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template chat-with-your-data-solution-accelerator
azd up
```

### AI Travel Agents — Ορχήστρωση Πολλαπλών Πρακτόρων MCP

**Αποθετήριο**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Υπηρεσίες**: Azure OpenAI + Azure AI Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Περιγραφή**: Αναφορά εφαρμογής για ορχήστρωση πολλαπλών πρακτόρων AI χρησιμοποιώντας τρία πλαίσια (LangChain.js, LlamaIndex.TS και Microsoft Agent Framework). Περιλαμβάνει MCP (Model Context Protocol) servers σε τέσσερις γλώσσες αναπτυγμένους ως serverless Azure Container Apps με παρακολούθηση OpenTelemetry.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-ai-travel-agents
azd up
```

### Azure AI Starter

**Αποθετήριο**: [azd-ai-starter](https://github.com/Azure/azd-ai-starter)

**Υπηρεσίες**: Azure AI Services + Azure OpenAI

**Περιγραφή**: Ελαφρύ πρότυπο Bicep που αναπτύσσει υπηρεσίες Azure AI με διαμορφωμένα μοντέλα μηχανικής μάθησης. Ένα ελαφρύ σημείο εκκίνησης όταν χρειάζεστε μόνο την παροχή της υποδομής Azure AI χωρίς πλήρες στοίβα εφαρμογής.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azd-ai-starter
azd up
```

> **Περιηγηθείτε σε περισσότερα πρότυπα**: Επισκεφτείτε την [Awesome AZD AI Template Gallery](https://azure.github.io/awesome-azd/?tags=ai) για 80+ προσαρμοσμένα πρότυπα AZD ειδικά για AI σε διάφορες γλώσσες και σενάρια.

## Επόμενα Βήματα

1. **Δοκιμάστε τα Παραδείγματα**: Ξεκινήστε με ένα προ-κατασκευασμένο πρότυπο που ταιριάζει στο σενάριό σας
2. **Προσαρμόστε στις Ανάγκες σας**: Τροποποιήστε την υποδομή και τον κώδικα της εφαρμογής
3. **Προσθέστε Παρακολούθηση**: Υλοποιήστε ολοκληρωμένη παρατηρησιμότητα
4. **Βελτιστοποιήστε τα Έξοδα**: Ρυθμίστε τις παραμέτρους για τον προϋπολογισμό σας
5. **Ασφαλίστε την Ανάπτυξή σας**: Εφαρμόστε πρότυπα ασφάλειας επιπέδου επιχείρησης
6. **Κλιμακώστε σε Παραγωγή**: Προσθέστε πολλαπλές περιοχές και δυνατότητες υψηλής διαθεσιμότητας

## 🎯 Πρακτικές Ασκήσεις

### Άσκηση 1: Ανάπτυξη Εφαρμογής Συνομιλίας με Μοντέλα Microsoft Foundry (30 λεπτά)
**Στόχος**: Αναπτύξτε και δοκιμάστε μια εφαρμογή συνομιλίας AI έτοιμη για παραγωγή

```bash
# Αρχικοποίηση προτύπου
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo

# Ορισμός μεταβλητών περιβάλλοντος
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CAPACITY 30

# Ανάπτυξη
azd up

# Δοκιμή εφαρμογής
WEB_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Chat app: $WEB_URL"

# Παρακολούθηση λειτουργιών τεχνητής νοημοσύνης
azd monitor

# Καθαρισμός
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η ανάπτυξη ολοκληρώνεται χωρίς σφάλματα ποσόστωσης
- [ ] Μπορείτε να αποκτήσετε πρόσβαση στη διεπαφή συνομιλίας μέσω προγράμματος περιήγησης
- [ ] Μπορείτε να κάνετε ερωτήσεις και να λαμβάνετε απαντήσεις με υποστήριξη AI
- [ ] Το Application Insights εμφανίζει δεδομένα τηλεμετρίας
- [ ] Οι πόροι καθαρίστηκαν με επιτυχία

**Εκτιμώμενο Κόστος**: $5-10 για 30 λεπτά δοκιμής

### Άσκηση 2: Διαμόρφωση Ανάπτυξης Πολλαπλών Μοντέλων (45 λεπτά)
**Στόχος**: Αναπτύξτε πολλαπλά μοντέλα AI με διαφορετικές διαμορφώσεις

```bash
# Δημιουργήστε προσαρμοσμένη διαμόρφωση Bicep
cat > infra/ai-models.bicep << 'EOF'
param openAiAccountName string
param location string

resource openAi 'Microsoft.CognitiveServices/accounts@2023-05-01' existing = {
  name: openAiAccountName
}

// gpt-4.1-mini for general chat
resource gpt4omini 'Microsoft.CognitiveServices/accounts/deployments@2023-05-01' = {
  parent: openAi
  name: 'gpt-4.1-mini'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'gpt-4.1-mini'
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
  name: 'text-embedding-3-large'
  properties: {
    model: {
      format: 'OpenAI'
      name: 'text-embedding-3-large'
      version: '1'
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
- [ ] Πολλαπλά μοντέλα αναπτύχθηκαν με επιτυχία
- [ ] Εφαρμόστηκαν διαφορετικές ρυθμίσεις χωρητικότητας
- [ ] Τα μοντέλα είναι προσβάσιμα μέσω API
- [ ] Μπορεί να καλεί και τα δύο μοντέλα από την εφαρμογή

### Άσκηση 3: Υλοποίηση Παρακολούθησης Κόστους (20 λεπτά)
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

# Έλεγχος τρεχουσών εξόδων
az consumption usage list --start-date $(date -d '7 days ago' +%Y-%m-%d) --end-date $(date +%Y-%m-%d)
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκε ειδοποίηση προϋπολογισμού στο Azure
- [ ] Οι ειδοποιήσεις email έχουν ρυθμιστεί
- [ ] Μπορείτε να δείτε τα δεδομένα κόστους στο Azure Portal
- [ ] Τα όρια προϋπολογισμού έχουν οριστεί κατάλληλα

## 💡 Συχνές Ερωτήσεις

<details>
<summary><strong>Πώς μπορώ να μειώσω τα έξοδα των Microsoft Foundry Models κατά την ανάπτυξη;</strong></summary>

1. **Χρησιμοποιήστε το Free Tier**: Τα Microsoft Foundry Models προσφέρουν 50.000 tokens/μήνα δωρεάν
2. **Μειώστε τη Χωρητικότητα**: Ορίστε χωρητικότητα στα 10 TPM αντί για 30+ για ανάπτυξη
3. **Χρησιμοποιήστε azd down**: Αποεπιβάλλετε πόρους όταν δεν αναπτύσσετε ενεργά
4. **Κάντε Cache τις Απαντήσεις**: Εφαρμόστε Redis cache για επαναλαμβανόμενα ερωτήματα
5. **Χρησιμοποιήστε Prompt Engineering**: Μειώστε τη χρήση tokens με αποδοτικούς prompts

</details>
```bash
# Διαμόρφωση ανάπτυξης
azd env set AZURE_OPENAI_CAPACITY 10
azd env set ENABLE_RESPONSE_CACHE true
```
</details>

<details>
<summary><strong>Ποια είναι η διαφορά μεταξύ των Microsoft Foundry Models και του OpenAI API;</strong></summary>

**Microsoft Foundry Models**:
- Enterprise security and compliance
- Private network integration
- SLA guarantees
- Managed identity authentication
- Higher quotas available

**OpenAI API**:
- Faster access to new models
- Simpler setup
- Lower barrier to entry
- Public internet only

Για εφαρμογές παραγωγής, **συνιστάται το Microsoft Foundry Models**.
</details>

<details>
<summary><strong>Πώς χειρίζομαι σφάλματα υπέρβασης ορίου (quota exceeded) στο Microsoft Foundry Models;</strong></summary>

```bash
# Ελέγξτε το τρέχον όριο
az cognitiveservices usage list --location eastus2

# Δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up

# Μειώστε προσωρινά τη χωρητικότητα
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Ζητήστε αύξηση ορίου
# Μεταβείτε στο Azure Portal > Όρια > Αίτηση αύξησης
```
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω τα δικά μου δεδομένα με τα Microsoft Foundry Models;</strong></summary>

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

Δείτε το [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) πρότυπο.
</details>

<details>
<summary><strong>Πώς ασφαλίζω τα endpoints των μοντέλων AI;</strong></summary>

**Καλύτερες Πρακτικές**:
1. Χρησιμοποιήστε Managed Identity (χωρίς κλειδιά API)
2. Ενεργοποιήστε Private Endpoints
3. Διαμορφώστε network security groups
4. Εφαρμόστε rate limiting
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

- **Microsoft Foundry στο Discord**: [#Azure channel](https://discord.gg/microsoft-azure)
- **AZD στο GitHub**: [Θέματα και συζητήσεις](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Επίσημη τεκμηρίωση](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Δεξιότητα Microsoft Foundry στο skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Εγκαταστήστε τις δεξιότητες agent Azure + Foundry στον επεξεργαστή σας με `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική του Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με προτεραιότητα στην Τεχνητή Νοημοσύνη
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο σας Έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [AI Model Deployment](ai-model-deployment.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Συμμετάσχετε στις συζητήσεις της κοινότητας ή ανοίξτε ένα θέμα στο αποθετήριο. Η κοινότητα Azure AI + AZD είναι εδώ για να σας βοηθήσει να πετύχετε!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Το παρόν έγγραφο έχει μεταφραστεί με χρήση υπηρεσίας μετάφρασης τεχνητής νοημοσύνης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι επιδιώκουμε ακρίβεια, παρακαλούμε λάβετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική μετάφραση από επαγγελματία μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->