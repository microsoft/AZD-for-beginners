# Ενσωμάτωση Microsoft Foundry με AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη AI-Πρώτα
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο Σας Project](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [Πράκτορες AI](agents.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

## Επισκόπηση

Αυτός ο οδηγός παρουσιάζει πώς να ενσωματώσετε τις υπηρεσίες Microsoft Foundry με το Azure Developer CLI (AZD) για απλοποιημένες αναπτύξεις εφαρμογών AI. Το Microsoft Foundry παρέχει μια ολοκληρωμένη πλατφόρμα για την κατασκευή, ανάπτυξη και διαχείριση εφαρμογών AI, ενώ το AZD απλοποιεί τη διαδικασία υποδομής και ανάπτυξης.

## Τι είναι το Microsoft Foundry;

Το Microsoft Foundry είναι η ενοποιημένη πλατφόρμα της Microsoft για ανάπτυξη AI που περιλαμβάνει:

- **Κατάλογος Μοντέλων**: Πρόσβαση σε μοντέλα AI αιχμής
- **Prompt Flow**: Οπτικός σχεδιαστής ροών εργασίας AI
- **Microsoft Foundry Portal**: Ενοποιημένο περιβάλλον ανάπτυξης για εφαρμογές AI
- **Επιλογές Ανάπτυξης**: Πολλαπλές επιλογές φιλοξενίας και κλιμάκωσης
- **Ασφάλεια και Προστασία**: Ενσωματωμένες χαρακτηριστικά υπεύθυνης AI

## AZD + Microsoft Foundry: Καλύτερα μαζί

| Χαρακτηριστικό | Microsoft Foundry | Όφελος Ενσωμάτωσης AZD |
|---------|-----------------|------------------------|
| **Ανάπτυξη Μοντέλου** | Χειροκίνητη ανάπτυξη μέσω πύλης | Αυτοματοποιημένες, επαναλήψιμες αναπτύξεις |
| **Υποδομή** | Provisioning με κλικ | Υποδομή ως Κώδικας (Bicep) |
| **Διαχείριση Περιβάλλοντος** | Εστίαση σε ένα περιβάλλον | Πολλαπλά περιβάλλοντα (dev/staging/prod) |
| **Ενσωμάτωση CI/CD** | Περιορισμένη | Γηγενής υποστήριξη GitHub Actions |
| **Διαχείριση Κόστους** | Βασική παρακολούθηση | Βελτιστοποίηση κόστους ανά περιβάλλον |

## Προαπαιτούμενα

- Συνδρομή Azure με τις κατάλληλες άδειες
- Εγκατεστημένο Azure Developer CLI
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models
- Βασική εξοικείωση με το Microsoft Foundry

> **Ανασκόπηση Έκδοσης (2026-11-04):** Η καθοδήγηση AI CLI ελέγχθηκε έναντι των `azd` `1.37.2`, πρακτόρων `1.0.0-beta.23`, και τεκμηρίωσης/πηγής αξιολογήσεων `1.0.0-beta.2`. Χρησιμοποιήστε `azd >= 1.37.0` για τη συνδυασμένη ροή εργασίας. Δείτε [αλλαγές και διορθώσεις έκδοσης](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes); αυτή η ανασκόπηση δεν πιστοποιεί κάθε πρότυπο ή παράδειγμα SDK για μια ζωντανή ανάπτυξη.

## Βασικά Πρότυπα Ενσωμάτωσης

**Εύρος παραδειγμάτων:** Η παρακάτω Bicep περιέχει δείγματα πόρων, όχι ένα πλήρες πρότυπο για ανάπτυξη. Το περιεχόμενο πρότυπο πρέπει να ορίζει ονόματα, `location`, αναφερόμενους πόρους, ταυτότητες, outputs και φιλοξενία εφαρμογής. Χρησιμοποιήστε ένα συνδεδεμένο δείγμα ως σημείο εκκίνησης. Τα παραδείγματα Bash απαιτούν ξεχωριστή πιστοποίηση Azure CLI από `azd auth login`.

### Πρότυπο 1: Ενσωμάτωση Microsoft Foundry Models

**Χρήση**: Ανάπτυξη εφαρμογών συνομιλίας με μοντέλα Azure OpenAI στο Microsoft Foundry

```yaml
# azure.yaml
name: ai-chat-app
services:
  api:
    project: ./api
    host: containerapp
    env:
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
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
    disableLocalAuth: true
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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30 // 30,000 TPM for this text-model deployment type
  }
}
```

Ο καλών χρήστης χρειάζεται προσαρτημένη managed identity και `Cognitive Services OpenAI User` σε επίπεδο λογαριασμού· η απενεργοποίηση κλειδιών δεν παρέχει πρόσβαση. Επαληθεύστε διαθεσιμότητα περιοχής/μοντέλου/SKU και quota πριν την ανάπτυξη.

### Πρότυπο 2: Ενσωμάτωση AI Search + RAG

**Χρήση**: Ανάπτυξη εφαρμογών ανάκτησης με ενισχυμένη παραγωγή (RAG)

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

```

Δεν υπάρχει `Microsoft.Search/searchServices/dataConnections` ARM πόρος για αυτήν την ενσωμάτωση. Ρυθμίστε έναν δείκτη Search, πηγή δεδομένων, indexer/skillset ή vectorizer μέσω των υποστηριζόμενων Search data-plane APIs. Αν το Search καλεί μοντέλο embedding, ενεργοποιήστε την managed identity του, δώστε το σχετικό ρόλο μοντέλου και διαμορφώστε το embedding skill/vectorizer του. Δείτε [ενσωματωμένη διανυσματοποίηση](https://learn.microsoft.com/azure/search/vector-search-integrated-vectorization).

### Πρότυπο 3: Ενσωμάτωση Ευφυΐας Εγγράφων

**Χρήση**: Ροές εργασίας επεξεργασίας και ανάλυσης εγγράφων

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

Εκτός από τεκμηριωμένες ρυθμίσεις AZD όπως `AZURE_LOCATION`, αυτά είναι **ονόματα εισόδου προτύπου προσαρμογής**. Δεν έχουν επίδραση εκτός αν το πρότυπο/η εφαρμογή τα χρησιμοποιεί μέσω παραμέτρων και αντιστοιχιών περιβάλλοντος υποδοχής. Για `azure-search-openai-demo`, χρησιμοποιήστε τα πραγματικά ονόματα όπως `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY` και `AZURE_SEARCH_SERVICE_SKU` αντ' αυτού. Η χωρητικότητα μοντέλου δεν είναι SKU λογαριασμού.

**Διαμόρφωση Παραγωγής:**
```bash
# Core AI services
azd env set AZURE_OPENAI_ENDPOINT "https://your-openai.openai.azure.com/"
azd env set AZURE_SEARCH_ENDPOINT "https://your-search.search.windows.net"
azd env set AZURE_DOCUMENT_INTELLIGENCE_ENDPOINT "https://your-formrec.cognitiveservices.azure.com/"

# Model configurations
azd env set AZURE_OPENAI_MODEL "gpt-4.1-mini"
azd env set AZURE_OPENAI_EMBEDDING_MODEL "text-embedding-3-large"

# Performance settings
azd env set AZURE_OPENAI_CAPACITY 30
azd env set AZURE_SEARCH_SKU "standard"
```

**Διαμόρφωση Ανάπτυξης:**
```bash
# Cost-optimized settings for development
azd env set AZURE_OPENAI_CAPACITY 10
azd env set AZURE_SEARCH_SKU "basic"
azd env set AZURE_DOCUMENT_INTELLIGENCE_SKU "F0"  # Free tier
```

### Ασφαλής Διαμόρφωση με Key Vault

Προτιμήστε Entra ID με απενεργοποιημένη τοπική πιστοποίηση κλειδιού. Τα ακόλουθα είναι μόνο μια **παλιά εναλλακτική πιστοποίησης με κλειδί** για εφαρμογές που απαιτούν κλειδιά: απαιτείται λογαριασμός με ενεργοποιημένη πιστοποίηση κλειδιού, προσαρτημένη ταυτότητα εφαρμογής στον κεντρικό του υπολογιστή και πλήρης πρόσβαση/δικτύωση Key Vault. Μην συνδυάζετε ανάκτηση κλειδιού με `disableLocalAuth: true` και αναμένετε ότι οι κλήσεις με χρήση κλειδιού θα λειτουργούν.

```bicep
// Key Vault for secrets
resource keyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    tenantId: tenant().tenantId
    enableRbacAuthorization: false // This fragment deliberately uses access policies
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

### Επεκτάσεις AZD για Foundry

Το AZD παρέχει επεκτάσεις που προσθέτουν δυνατότητες ειδικές για AI για εργασία με τις υπηρεσίες Microsoft Foundry:

```bash
# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# List installed extensions
azd extension list --installed

# Inspect the currently installed agent extension version
azd extension show azure.ai.agents
```

Οι επεκτάσεις AI εξελίσσονται γρήγορα σε προεπισκόπηση. Αν μια εντολή λειτουργεί διαφορετικά από ότι παρουσιάζεται εδώ, αναβαθμίστε την αντίστοιχη επέκταση πριν ξεκινήσετε την αντιμετώπιση προβλημάτων του project.

### Ανάπτυξη Πρώτα με Πράκτορα με `azd ai`

Χρησιμοποιήστε `azd ai agent init` διαδραστικά, ή υιοθετήστε ένα τρέχον πρότυπο έργου `azure.yaml` πράκτορα συνδεδεμένο με Foundry Agent Service:

```bash
# Initialize from a current project template (supply your template path)
azd ai agent init --template ./templates/support-agent/azure.yaml --project-id <foundry-project-id>

# Deploy to Azure
azd up
```

`--template`/`-t` αντικαθιστά τον παρωχημένο `--manifest`/`-m` ορθογραφικό τύπο· το παλιό manifest και η κυκλική διαμόρφωση πράκτορα χρειάζονται ακόμα μετανάστευση. Αξιολογήστε πράκτορες με `azd ai eval` από `azure.ai.evaluations`, όχι την αφαιρεθείσα παλιά ροή εργασίας. Δείτε [μετανάστευση αξιολόγησης](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) για ρυθμίσεις, εκτέλεση και αποτελέσματα.

Δείτε [Εντολές AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) για πλήρη αναφορά εντολών και σημαίες.

### Ανάπτυξη με Μία Εντολή

```bash
# Deploy everything with one command
azd up

# Or deploy incrementally
azd provision  # Infrastructure only
azd deploy     # Application only

# For long-running AI app deployments in azd 1.23.11+
azd deploy --timeout 1800
```

### Αναπτύξεις ανά Περιβάλλον

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
```

Αυτό δημιουργεί έναν πόρο Insights, όχι τηλεμετρική οργάνωση. Μόλις η εφαρμογή σας εκπέμψει εξόδους κλήσεων μοντέλου, εκτελέστε αυτό το δειγματικό ερώτημα στα Application Insights Logs (προσαρμόστε το φίλτρο στα πραγματικά ονόματα εύρους):

```kusto
dependencies
| where target contains "openai"
| summarize RequestCount = count(), AvgDuration = avg(duration),
    SuccessRate = countif(success == true) * 100.0 / count()
  by bin(timestamp, 5m)
```

### Παρακολούθηση Κόστους

```bicep
// Supply the first day of the current UTC month, e.g. 2026-11-01T00:00:00Z.
param budgetStartDate string

// Budget alert for AI services
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-services-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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

Χρησιμοποιήστε πραγματικό παραλήπτη και επαληθεύστε δικαιώματα διαχείρισης χρεώσεων. Ο προϋπολογισμός στέλνει ειδοποιήσεις· δεν αποτελεί όριο δαπανών.

## 🔐 Βέλτιστες Πρακτικές Ασφαλείας

### Ρύθμιση Managed Identity

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

Αυτό το τμήμα endpoint χρειάζεται επίσης ιδιωτική ζώνη/ομάδα DNS, συνδέσεις VNet, σύνδεση εφαρμογής με VNet και ρητή πολιτική δημόσιας πρόσβασης. Η δημιουργία ιδιωτικού endpoint μόνο δεν απενεργοποιεί τη δημόσια πρόσβαση.

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
      REDIS_CONNECTION_STRING: ${REDIS_CONNECTION_STRING}
      CACHE_TTL: "3600"
```

```bicep
// Existing Azure Cache for Redis example; use Azure Managed Redis for new designs.
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

Το Azure Cache for Redis Basic/Standard/Premium είναι σε [πορεία ξεπερασμού](https://learn.microsoft.com/azure/azure-cache-for-redis/retirement-faq); χρησιμοποιήστε Azure Managed Redis για νέες αναπτύξεις και ακολουθήστε την τρέχουσα καθοδήγηση για προτύπο/πιστοποίηση. Κλιμακώστε τις αποθηκευμένες απαντήσεις AI κατά εξουσιοδότηση, μοντέλο/οδηγίες και έκδοση δεδομένων, με λήξη· μην μοιράζεστε ποτέ ιδιωτικές απαντήσεις μόνο με βάση το κείμενο ερωτήματος.

### Διαμόρφωση Αυτόματης Κλιμάκωσης

**Μερικός πόρος:** συγχωνεύστε αυτές τις ρυθμίσεις κλίμακας/εισόδου σε πλήρη Container App με managed environment, εικόνα κοντέινερ, και όρια πόρων. Περισσότερα αντίγραφα δεν αυξάνουν το quota μοντέλου.

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

### Πρόβλημα 1: Υπέρβαση Quota OpenAI

**Συμπτώματα:**
- Αποτυχίες ανάπτυξης με σφάλματα quota
- Σφάλματα 429 στα αρχεία καταγραφής εφαρμογής

**Λύσεις:**
```bash
# Check current quota usage
az cognitiveservices usage list --location eastus

# Try a different region in a NEW disposable environment, not by moving resources
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the ORIGINAL environment before reducing its capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision
```

Η μεταβλητή χωρητικότητας παραπάνω εφαρμόζεται μόνο σε προσαρμοσμένο πρότυπο που τη χρησιμοποιεί. Για το δείγμα RAG, χρησιμοποιήστε `AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY`. Μην αλλάζετε `AZURE_LOCATION` για να μετακινήσετε υπάρχοντες πόρους στη θέση τους· δημιουργήστε ξεχωριστό περιβάλλον για νέα περιοχή και σχεδιάστε μετανάστευση/καθαρισμό.

### Πρόβλημα 2: Αποτυχίες Πιστοποίησης

**Συμπτώματα:**
- Σφάλματα 401/403 κατά κλήσεις υπηρεσιών AI
- Μηνύματα "Πρόσβαση απορρίφθηκε"

**Λύσεις:**
```bash
# Verify role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Check managed identity configuration
az containerapp identity show --name YOUR_APP --resource-group YOUR_RG

# Validate Key Vault access
az keyvault secret show --vault-name YOUR_KV --name openai-api-key --query id -o tsv
```

### Πρόβλημα 3: Προβλήματα Ανάπτυξης Μοντέλου

**Συμπτώματα:**
- Μοντέλα μη διαθέσιμα στην ανάπτυξη
- Αποτυχίες συγκεκριμένων εκδόσεων μοντέλων

**Λύσεις:**
```bash
# List available models by region
az cognitiveservices model list --location eastus

# Update model version in bicep template
# Check model capacity requirements
```

## Παραδείγματα Προτύπων

Αυτά είναι εναλλακτικές, όχι διαδοχικές εντολές. Ξεκινήστε κάθε ένα σε ξεχωριστό κενό φάκελο. Η ρητή προορισμός `.` κρατά την αρχικοποίηση στον τρέχοντα φάκελο· αλλιώς το AZD μπορεί να δημιουργήσει έναν υποφάκελο με όνομα προτύπου χωρίς να αλλάξει τον τρέχοντα φάκελο εργασίας.

### Εφαρμογή RAG Chat (Python)

**Αποθετήριο**: [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps + Azure Blob Storage

**Περιγραφή**: Αναφορά εφαρμογής RAG chat για ερωτήσεις πάνω στα έγγραφά σας, με ανάκτηση Azure AI Search. Ελέγξτε μοντέλα, προαιρετικά χαρακτηριστικά, καθοδήγηση κόστους και σκληροποίηση παραγωγής πριν τη χρήση· η ανάπτυξη δείγματος δεν καθιστά αυτομάτως εφαρμογή κατάλληλη για παραγωγή.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo .
azd up
```

### Εφαρμογή RAG Chat (.NET)

**Αποθετήριο**: [azure-search-openai-demo-csharp](https://github.com/Azure-Samples/azure-search-openai-demo-csharp)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps + Semantic Kernel

**Περιγραφή**: .NET/C# αντίστοιχο δείγμα RAG chat Python. Κατασκευασμένο με ASP.NET Core Minimal API και Blazor WebAssembly frontend. Περιλαμβάνει φωνητική συνομιλία, υποστήριξη οράματος GPT-4o-mini, και συνοδευτικό .NET MAUI Blazor Hybrid desktop/mobile client.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo-csharp .
azd up
```

### Εφαρμογή RAG Chat (Java)

**Αποθετήριο**: [azure-search-openai-demo-java](https://github.com/Azure-Samples/azure-search-openai-demo-java)

**Υπηρεσίες**: Azure OpenAI + Azure AI Search + Azure Container Apps / AKS + Langchain4J + Azure Cosmos DB

**Περιγραφή**: Έκδοση Java του δείγματος RAG chat με χρήση Langchain4J για ορχήστρωση AI. Υποστηρίζει μικροϋπηρεσίες με event-driven αρχιτεκτονική, πολλαπλές στρατηγικές αναζήτησης (κείμενο, διάνυσμα, υβριδική), μεταφόρτωση εγγράφων με Azure Document Intelligence, και ανάπτυξη είτε σε Azure Container Apps είτε σε Azure Kubernetes Service.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template azure-search-openai-demo-java .
azd up
```

### Enterprise Retail Copilot με Microsoft Foundry

**Αποθετήριο**: [contoso-chat](https://github.com/Azure-Samples/contoso-chat)

**Υπηρεσίες**: Azure OpenAI + Microsoft Foundry + Prompty + Azure AI Search + Azure Container Apps + Azure Cosmos DB

**Περιγραφή**: Ολοκληρωμένος λιανικός βοηθός RAG με Microsoft Foundry και Prompty. Chatbot καταστημα Contoso Outdoor που βασίζει απαντήσεις σε δεδομένα καταλόγου προϊόντων και παραγγελιών πελατών. Δείχνει ολόκληρη τη ροή εργασίας GenAIOps — πρωτότυπο με Prompty, αξιολόγηση με AI-βοηθούμενους αξιολογητές, και ανάπτυξη μέσω AZD σε Container Apps.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template contoso-chat .
azd up
```

### Εφαρμογή Πολλαπλών Πρακτόρων Δημιουργικής Γραφής

**Αποθετήριο**: [contoso-creative-writer](https://github.com/Azure-Samples/contoso-creative-writer)

**Υπηρεσίες**: Azure OpenAI + Azure AI Agent Service + Bing Grounding + Azure AI Search + Azure Container Apps

**Περιγραφή**: Δείγμα πολλαπλών πρακτόρων που επιδεικνύει ορχήστρωση AI πρακτόρων με Prompty. Χρησιμοποιεί έναν πράκτορα έρευνας (Bing Grounding στο Azure AI Agent Service), έναν πράκτορα προϊόντος (Azure AI Search), έναν πράκτορα συγγραφέα, και έναν πράκτορα επιμελητή για συνεργατική παραγωγή καλοερευνών άρθρων. Περιλαμβάνει CI/CD με αξιολόγηση στο GitHub Actions.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template contoso-creative-writer .
azd up
```

### Serverless RAG Chat (JavaScript/TypeScript)

**Αποθετήριο**: [serverless-chat-langchainjs](https://github.com/Azure-Samples/serverless-chat-langchainjs)

**Υπηρεσίες**: Azure OpenAI + Azure Functions + Azure Static Web Apps + Azure Cosmos DB for NoSQL + LangChain.js

**Περιγραφή**: Πλήρως serverless RAG chatbot με LangChain.js με Azure Functions για το API και Azure Static Web Apps για φιλοξενία. Χρησιμοποιεί Azure Cosmos DB ως αποθήκη διανυσμάτων και βάση ιστορικού συνομιλιών. Υποστηρίζει τοπική ανάπτυξη με Ollama για δοκιμές χωρίς κόστος.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template serverless-chat-langchainjs .
azd up
```

### Επιταχυντής Λύσης Chat με τα Δεδομένα Σας

**Αποθετήριο**: [chat-with-your-data-solution-accelerator](https://github.com/Azure-Samples/chat-with-your-data-solution-accelerator)

**Υπηρεσίες**: Microsoft Foundry + Azure Container Apps (web/API/ingestion) + Azure AI Search με Cosmos DB, ή PostgreSQL με pgvector

**Περιγραφή**: Επιταχυντής συνομιλίας εδραιωμένη σε έγγραφα με αναφορές. Το τρέχον δείγμα φιλοξενεί frontend React, backend FastAPI, και ingestion worker Functions σε Container Apps; οι επιλογές orchestrator είναι Agent Framework και LangGraph. Επιλογές βάσης δεδομένων/ανάκτησης επιλέγονται κατά την ανάπτυξη. Αποτελεί σημείο εκκίνησης, όχι πλήρες παραγωγικό σύστημα· μην υποθέτετε ότι παλιότερες παραλλαγές App Service, Semantic Kernel ή Prompt Flow περιγράφουν την τρέχουσα προεπιλογή.

**Γρήγορη Εκκίνηση**:
```bash
azd init --template chat-with-your-data-solution-accelerator .
azd up
```

### Πράκτορες Ταξιδιών AI — Πολλαπλή Ορχήστρωση MCP

**Αποθετήριο**: [azure-ai-travel-agents](https://github.com/Azure-Samples/azure-ai-travel-agents)

**Υπηρεσίες**: Azure OpenAI + Microsoft Foundry + Azure Container Apps + MCP Servers (.NET, Python, Java, TypeScript)

**Περιγραφή**: Εφαρμογή αναφοράς για πολυ-παράγοντα ορχήστρωση AI χρησιμοποιώντας τρία πλαίσια (LangChain.js, LlamaIndex.TS, και Microsoft Agent Framework). Διαθέτει MCP (Model Context Protocol) servers σε τέσσερις γλώσσες, αναπτυγμένους ως serverless Azure Container Apps με παρακολούθηση OpenTelemetry.

**Γρήγορη Έναρξη**:
```bash
azd init --template azure-ai-travel-agents .
azd up
```

> **Περιηγηθείτε σε περισσότερα πρότυπα**: Επισκεφθείτε τη [Μεγάλη Συλλογή Προτύπων AZD AI](https://azure.github.io/awesome-azd/?tags=ai) για τα διαθέσιμα πρότυπα σε διάφορες γλώσσες και σενάρια. Κάθε συνδεδεμένο παράδειγμα είναι εξωτερικό αποθετήριο, όχι τοπικό παράδειγμα που παρέχεται από αυτό το μάθημα· ελέγξτε τις τρέχουσες προϋποθέσεις και οδηγίες παραγωγής πριν από την ανάπτυξη.

## Επόμενα Βήματα

1. **Δοκιμάστε τα Παραδείγματα**: Ξεκινήστε με ένα προ-κατασκευασμένο πρότυπο που ταιριάζει στη χρήση σας
2. **Προσαρμόστε για τις Ανάγκες σας**: Τροποποιήστε την υποδομή και τον κώδικα εφαρμογής
3. **Προσθέστε Παρακολούθηση**: Υλοποιήστε πλήρη παρατηρησιμότητα
4. **Βελτιστοποιήστε το Κόστος**: Ρυθμίστε τις παραμέτρους σύμφωνα με τον προϋπολογισμό σας
5. **Ασφαλίστε την Ανάπτυξη**: Εφαρμόστε πρότυπα ασφαλείας επιχειρήσεων
6. **Κλιμακώστε για Παραγωγή**: Προσθέστε δυνατότητες πολλαπλών περιοχών και υψηλής διαθεσιμότητας

## 🎯 Πρακτικές Ασκήσεις

### Άσκηση 1: Ανάπτυξη Εφαρμογής Chat Microsoft Foundry Models (30 λεπτά)
**Στόχος**: Αναπτύξτε και δοκιμάστε μια εφαρμογή αναφοράς συνομιλίας AI

```bash
# Initialize template
mkdir ai-chat-demo && cd ai-chat-demo
azd init --template azure-search-openai-demo .

# Set environment variables
azd env set AZURE_LOCATION eastus2
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 30

# Deploy
azd up

# Test the application
azd show
# Open the web endpoint shown; do not assume a service name/JSON shape.

# Monitor AI operations
azd monitor

# Clean up
azd down --force --purge
```

**Κριτήρια Επιτυχίας:**
- [ ] Η ανάπτυξη ολοκληρώνεται χωρίς σφάλματα ποσόστωσης
- [ ] Πρόσβαση στο περιβάλλον συνομιλίας μέσω browser
- [ ] Ερωτήσεις και απαντήσεις από AI
- [ ] Το Application Insights εμφανίζει δεδομένα τηλεμετρίας
- [ ] Καθαρισμός πόρων επιτυχής

**Κόστος:** Εξετάστε τον τρέχοντα οδηγό κόστους και τις επιλεγμένες SKU πριν από την ανάπτυξη. Η χρέωση συνεχίζεται έως ότου διαγραφούν οι πόροι· δεν υπάρχει σταθερή εκτίμηση 30 λεπτών για κάθε διαμόρφωση.

### Άσκηση 2: Διαμόρφωση Πολλαπλής Ανάπτυξης Μοντέλων (45 λεπτά)
**Στόχος**: Αναπτύξτε πολλαπλά μοντέλα AI με διαφορετικές ρυθμίσεις

**Σημείο εκκίνησης:** Υπάρχον λογαριασμός Azure OpenAI και ένα μονάδα resource-group AZD που μπορεί να καλέσει αυτό το αρχείο. Δημιουργήστε `infra/ai-models.bicep` με το παρακάτω περιεχόμενο στον επεξεργαστή σας. Δεν αναπτύσσεται αυτόματα επειδή βρίσκεται κάτω από `infra/`.

```bicep
param openAiAccountName string

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
      version: '2025-04-14'
    }
  }
  sku: {
    name: 'Standard'
    capacity: 30
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
  }
  sku: {
    name: 'Standard'
    capacity: 50
  }
  dependsOn: [gpt4omini]
}
```

Από τη μονάδα που έχει εύρος στο resource-group και κατέχει τον λογαριασμό, προσθέστε κλήση μονάδας (προσαρμόστε το όνομα συμβόλου στον πραγματικό λογαριασμό σας):

```bicep
module additionalModels 'ai-models.bicep' = {
  name: 'additional-models'
  params: {
    openAiAccountName: openAIAccount.name
  }
}
```

Μην δηλώνετε τις ίδιες αναπτύξεις και στα δύο module. Αν το σημείο εισόδου AZD έχει εύρος συνδρομής, καλέστε από τη μονάδα παιδιού με εύρος resource-group και προσαρμόστε τη σχετική διαδρομή. Δημιουργήστε εκείνη τη μονάδα με `az bicep build --file <path-to-containing-module>`, έπειτα:

```bash
azd provision
az cognitiveservices account deployment list \
  --name YOUR_OPENAI_ACCOUNT --resource-group YOUR_RG \
  --query "[].{deployment:name,model:properties.model.name,version:properties.model.version,capacity:sku.capacity}" -o table
```

**Κριτήρια Επιτυχίας:**
- [ ] Πολλαπλά μοντέλα αναπτύχθηκαν επιτυχώς
- [ ] Εφαρμόστηκαν διαφορετικές ρυθμίσεις χωρητικότητας
- [ ] Πρόσβαση σε μοντέλα μέσω API
- [ ] Μπορεί να καλέσει και τα δύο μοντέλα από την εφαρμογή

### Άσκηση 3: Υλοποίηση Παρακολούθησης Κόστους (20 λεπτά)
**Στόχος**: Ρύθμιση ειδοποιήσεων προϋπολογισμού και παρακολούθησης κόστους

**Σημείο εκκίνησης:** Το παραπάνω πρότυπο προϋπολογισμού και μονάδα υποδομής με εύρος resource-group. Προσθέστε αυτόν τον πόρο χρησιμοποιώντας τον επεξεργαστή σας· περάστε `budgetStartDate` από το mapping παραμέτρων σας (μην διπλοεγγράφετε αν έχει ήδη δηλωθεί η παράμετρος). Αντικαταστήστε τον παραλήπτη και βεβαιωθείτε ότι έχετε δικαίωμα εγγραφής προϋπολογισμού.

```bicep
param budgetStartDate string
resource budget 'Microsoft.Consumption/budgets@2024-08-01' = {
  name: 'ai-monthly-budget'
  properties: {
    timePeriod: {
      startDate: budgetStartDate
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
```

```bash
# Deploy budget alert
azd provision

# Verify the budget at its resource-group scope
az rest --method get \
  --url "https://management.azure.com/subscriptions/YOUR_SUB/resourceGroups/YOUR_RG/providers/Microsoft.Consumption/budgets/ai-monthly-budget?api-version=2024-08-01"
```

Αναμενόμενο: η απόκριση περιέχει `amount: 200`, και τα δύο όρια, και τον παραλήπτη σας. Ελέγξτε το Cost Management στο portal για τις πραγματικές χρεώσεις· τα δεδομένα κόστους καθυστερούν και η ειδοποίηση μπορεί να μην ενεργοποιηθεί κατά τη διάρκεια σύντομης άσκησης.

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκε ειδοποίηση προϋπολογισμού στο Azure
- [ ] Ρυθμίσεις ειδοποίησης μέσω email
- [ ] Δυνατότητα προβολής δεδομένων κόστους στο Azure Portal
- [ ] Ρυθμίσεις ορίων προϋπολογισμού κατάλληλα ορισμένες

## 💡 Συχνές Ερωτήσεις

<details>
<summary><strong>Πώς μειώνω το κόστος των μοντέλων Microsoft Foundry κατά την ανάπτυξη;</strong></summary>

1. **Ελέγξτε την τιμολόγηση**: Δεν υπάρχει καθολικό δωρεάν όριο 50.000 tokens μηνιαίως για τα μοντέλα Azure OpenAI
2. **Καθορίστε σωστά τη χωρητικότητα**: Η χωρητικότητα `10` συνήθως αντιπροσωπεύει 10.000 TPM για αυτά τα Standard text μοντέλα, όχι 10 TPM. Μείωση αυτού του ορίου δεν μειώνει τις τιμές ανά token
3. **Χρησιμοποιήστε το azd down**: Διαγράψτε τους πόρους που δεν χρησιμοποιούνται όταν δεν αναπτύσσετε ενεργά (δεν είναι deallocation)
4. **Αποθηκεύστε Απαντήσεις στην Cache**: Υλοποιήστε Redis cache για επαναλαμβανόμενα ερωτήματα
5. **Χρησιμοποιήστε Prompt Engineering**: Μειώστε τη χρήση token με αποδοτικά prompts

```bash
# Development configuration
azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
azd provision
# Caching requires application code and infrastructure; no universal AZD toggle.
```
</details>

<details>
<summary><strong>Ποια είναι η διαφορά μεταξύ Microsoft Foundry Models και OpenAI API;</strong></summary>

**Microsoft Foundry Models**:
- Ασφάλεια και συμμόρφωση επιχειρήσεων
- Ενσωμάτωση ιδιωτικού δικτύου
- Εγγυήσεις SLA
- Πιστοποίηση μέσω managed identity
- Διαθέσιμα υψηλότερα όρια

**OpenAI API**: Ξεχωριστός πάροχος/API με τη δική του διαθεσιμότητα μοντέλων, τιμολόγηση, πιστοποίηση και επιλογές σύνδεσης για επιχειρήσεις. Συγκρίνετε τις τρέχουσες προσφορές αντί να υποθέσετε ότι είναι μόνο δημόσιο διαδίκτυο ή πάντα φέρνει πρώτα μοντέλα.

Επιλέξτε βάσει των αναγκών της οργάνωσής σας· τα παραδείγματα managed identity και private-link ειδικά του Azure σε αυτό το μάθημα αφορούν υπηρεσίες που φιλοξενούνται στο Azure, όχι κάθε μοντέλο/πάροχο στον κατάλογο Foundry.
</details>

<details>
<summary><strong>Πώς αντιμετωπίζω σφάλματα υπέρβασης ποσόστωσης Microsoft Foundry Models;</strong></summary>

```bash
# Check current quota
az cognitiveservices usage list --location eastus2

# Try different region
azd env new quota-region-test
azd env set AZURE_LOCATION westus2
azd up

# Alternative: select the original environment before reducing capacity
# azd env select <original-environment>
azd env set AZURE_OPENAI_CAPACITY 10
azd provision

# Request quota increase
# Go to Azure Portal > Quotas > Request increase
```
</details>

<details>
<summary><strong>Μπορώ να χρησιμοποιήσω τα δικά μου δεδομένα με τα Microsoft Foundry Models;</strong></summary>

Ναι! Χρησιμοποιήστε **Azure AI Search** για RAG (Retrieval Augmented Generation):

```yaml
# azure.yaml
services:
  ai:
    project: ./api
    host: containerapp
    env:
      AZURE_SEARCH_ENDPOINT: ${AZURE_SEARCH_ENDPOINT}
      AZURE_SEARCH_INDEX: ${AZURE_SEARCH_INDEX}
      AZURE_OPENAI_ENDPOINT: ${AZURE_OPENAI_ENDPOINT}
```

Δείτε το πρότυπο [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo).
</details>

<details>
<summary><strong>Πώς ασφαλίζω τα τελικά σημεία μοντέλων AI;</strong></summary>

**Καλές Πρακτικές**:
1. Χρησιμοποιήστε Managed Identity (χωρίς κλειδιά API)
2. Ενεργοποιήστε Private Endpoints
3. Διαμορφώστε ομάδες ασφαλείας δικτύου
4. Εφαρμόστε περιορισμό ρυθμού
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

- **Microsoft Foundry Discord**: [κανάλι #Azure](https://discord.gg/microsoft-azure)
- **AZD GitHub**: [Θέματα και συζητήσεις](https://github.com/Azure/azure-dev)
- **Microsoft Learn**: [Επίσημη τεκμηρίωση](https://learn.microsoft.com/azure/ai-studio/)
- **Agent Skills**: [Δεξιότητες Microsoft Foundry στο skills.sh](https://skills.sh/microsoft/github-copilot-for-azure/microsoft-foundry) - Εγκαταστήστε τις δεξιότητες Azure + Foundry agent στον επεξεργαστή σας με `npx skills add microsoft/github-copilot-for-azure`

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-First Development
- **⬅️ Προηγούμενο Κεφάλαιο**: [Κεφάλαιο 1: Το Πρώτο Σας Έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [AI Agents](agents.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Συμμετέχετε στις συζητήσεις της κοινότητας ή ανοίξτε θέμα στο αποθετήριο. Η κοινότητα Azure AI + AZD είναι εδώ για να σας βοηθήσει να πετύχετε!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->