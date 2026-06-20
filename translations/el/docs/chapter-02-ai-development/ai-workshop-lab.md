# Εργαστήριο AI: Κάντε τις λύσεις AI σας αναπτύξιμες με AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Κεντρική σελίδα μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-First Development
- **⬅️ Προηγούμενο**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Επόμενο**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το πρακτικό εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και την ανάπτυξή του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά πρότυπα για παραγωγικές αναπτύξεις AI χρησιμοποιώντας τις υπηρεσίες Microsoft Foundry.

> **Σημείωση επικύρωσης (2026-03-25):** Αυτό το εργαστήριο ελέγχθηκε με την έκδοση `azd` `1.23.12`. Εάν η τοπική σας εγκατάσταση είναι παλαιότερη, ενημερώστε το AZD πριν ξεκινήσετε ώστε η διαδικασία αυθεντικοποίησης, το πρότυπο και η ροή ανάπτυξης να ταιριάζουν με τα βήματα παρακάτω.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Ενδιάμεσο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Στο τέλος αυτού του εργαστηρίου, θα είστε σε θέση να:
- ✅ Μετατρέψετε μια υπάρχουσα εφαρμογή AI ώστε να χρησιμοποιεί πρότυπα AZD
- ✅ Διαμορφώσετε τις υπηρεσίες Microsoft Foundry με AZD
- ✅ Υλοποιήσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Αναπτύξετε παραγωγικές εφαρμογές AI με παρακολούθηση
- ✅ Εντοπίσετε και επιλύσετε κοινά προβλήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται VS Code)

### Πόροι Azure
- Συνδρομή Azure με δικαιώματα contributor
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models (ή δυνατότητα να αιτηθείτε πρόσβαση)
- Δικαιώματα δημιουργίας resource group

### Γνώσεις Προαπαιτούμενες
- Βασική κατανόηση υπηρεσιών Azure
- Εξοικείωση με διεπαφές γραμμής εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, prompts)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επαληθεύστε τις εγκαταστάσεις εργαλείων:**
```bash
# Ελέγξτε την εγκατάσταση του AZD
azd version

# Ελέγξτε το Azure CLI
az --version

# Συνδεθείτε στο Azure για τις ροές εργασίας του AZD
azd auth login

# Συνδεθείτε στο Azure CLI μόνο αν σκοπεύετε να εκτελέσετε εντολές az κατά τη διάρκεια της διάγνωσης
az login
```

Αν εργάζεστε σε πολλαπλά tenants ή η συνδρομή σας δεν εντοπίζεται αυτόματα, ξαναπροσπαθήστε με `azd auth login --tenant-id <tenant-id>`.

2. **Κλωνοποιήστε το αποθετήριο του εργαστηρίου:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Ενότητα 1: Κατανόηση της Δομής AZD για Εφαρμογές AI

### Ανατομία ενός προτύπου AZD για AI

Εξερευνήστε τα βασικά αρχεία σε ένα πρότυπο AZD έτοιμο για AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Άσκηση Εργαστηρίου 1.1: Εξερευνήστε τη Διαμόρφωση**

1. **Εξετάστε το αρχείο azure.yaml:**
```bash
cat azure.yaml
```

**Τι να προσέξετε:**
- Ορισμοί υπηρεσιών για συνιστώσες AI
- Χαρτογραφήσεις μεταβλητών περιβάλλοντος
- Διαμορφώσεις host

2. **Επανεξετάστε το main.bicep υποδομής:**
```bash
cat infra/main.bicep
```

**Κύρια πρότυπα AI για αναγνώριση:**
- Παροχή υπηρεσίας Microsoft Foundry Models
- Ενσωμάτωση Azure AI Search
- Ασφαλής διαχείριση κλειδιών
- Διαμορφώσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί αυτά τα πρότυπα έχουν σημασία για το AI

- **Εξαρτήσεις υπηρεσιών**: Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια**: Τα API keys και τα endpoints χρειάζονται ασφαλή διαχείριση
- **Κλιμάκωση**: Τα φορτία AI έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση κόστους**: Οι υπηρεσίες AI μπορούν να κοστίσουν πολύ αν δεν διαμορφωθούν σωστά

## Ενότητα 2: Αναπτύξτε την Πρώτη σας Εφαρμογή AI

### Βήμα 2.1: Αρχικοποίηση Περιβάλλοντος

1. **Δημιουργήστε ένα νέο AZD περιβάλλον:**
```bash
azd env new myai-workshop
```

2. **Ορίστε τα απαιτούμενα παραμέτρους:**
```bash
# Ορίστε την προτιμώμενη περιοχή Azure
azd env set AZURE_LOCATION eastus

# Προαιρετικό: Ορίστε συγκεκριμένο μοντέλο OpenAI
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Βήμα 2.2: Αναπτύξτε την Υποδομή και την Εφαρμογή

1. **Αναπτύξτε με AZD:**
```bash
azd up
```

**Τι συμβαίνει κατά το `azd up`:**
- ✅ Προμηθεύει υπηρεσία Microsoft Foundry Models
- ✅ Δημιουργεί υπηρεσία Azure AI Search
- ✅ Ρυθμίζει App Service για την web εφαρμογή
- ✅ Διαμορφώνει δικτύωση και ασφάλεια
- ✅ Αναπτύσσει τον κώδικα της εφαρμογής
- ✅ Ρυθμίζει παρακολούθηση και logging

2. **Παρακολουθήστε την πρόοδο ανάπτυξης** και σημειώστε τους πόρους που δημιουργούνται.

### Βήμα 2.3: Επαληθεύστε την Ανάπτυξή σας

1. **Ελέγξτε τους αναπτυγμένους πόρους:**
```bash
azd show
```

2. **Ανοίξτε την αναπτυγμένη εφαρμογή:**
```bash
azd show
```

Ανοίξτε το web endpoint που εμφανίζεται στην έξοδο του `azd show`.

3. **Δοκιμάστε τη λειτουργικότητα AI:**
   - Πλοηγηθείτε στην web εφαρμογή
   - Δοκιμάστε δείγματα ερωτημάτων
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Πρακτική Αντιμετώπισης Προβλημάτων**

**Σενάριο**: Η ανάπτυξη ήταν επιτυχής αλλά το AI δεν ανταποκρίνεται.

**Συνήθη ζητήματα προς έλεγχο:**
1. **OpenAI API keys**: Επαληθεύστε ότι έχουν οριστεί σωστά
2. **Διαθεσιμότητα μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Συνδεσιμότητα δικτύου**: Βεβαιωθείτε ότι οι υπηρεσίες μπορούν να επικοινωνήσουν
4. **Δικαιώματα RBAC**: Επαληθεύστε ότι η εφαρμογή μπορεί να έχει πρόσβαση στο OpenAI

**Εντολές εντοπισμού σφαλμάτων:**
```bash
# Ελέγξτε τις μεταβλητές περιβάλλοντος
azd env get-values

# Δείτε τα αρχεία καταγραφής ανάπτυξης
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Ελέγξτε την κατάσταση ανάπτυξης του OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Ενότητα 3: Προσαρμογή Εφαρμογών AI στις Ανάγκες σας

### Βήμα 3.1: Τροποποίηση της Διαμόρφωσης AI

1. **Ενημερώστε το μοντέλο OpenAI:**
```bash
# Αλλάξτε σε διαφορετικό μοντέλο (αν είναι διαθέσιμο στην περιοχή σας)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Αναπτύξτε ξανά με τη νέα διαμόρφωση
azd deploy
```

2. **Προσθέστε επιπλέον υπηρεσίες AI:**

Επεξεργαστείτε το `infra/main.bicep` για να προσθέσετε Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Βήμα 3.2: Διαμορφώσεις ανά Περιβάλλον

**Καλύτερη Πρακτική**: Διαφορετικές διαμορφώσεις για ανάπτυξη και παραγωγή.

1. **Δημιουργήστε ένα production περιβάλλον:**
```bash
azd env new myai-production
```

2. **Ορίστε παραμέτρους ειδικές για παραγωγή:**
```bash
# Στην παραγωγή συνήθως χρησιμοποιούνται υψηλότερα SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ενεργοποιήστε πρόσθετες λειτουργίες ασφαλείας
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Άσκηση Εργαστηρίου 3.1: Βελτιστοποίηση Κόστους**

**Πρόκληση**: Διαμορφώστε το πρότυπο για οικονομική ανάπτυξη.

**Εργασίες:**
1. Εντοπίστε ποια SKUs μπορούν να οριστούν σε free/basic επίπεδα
2. Διαμορφώστε μεταβλητές περιβάλλοντος για ελάχιστο κόστος
3. Αναπτύξτε και συγκρίνετε κόστη με τη διαμόρφωση παραγωγής

**Υποδείξεις λύσης:**
- Χρησιμοποιήστε το επίπεδο F0 (free) για τις Azure AI Services όταν είναι δυνατό
- Χρησιμοποιήστε Basic tier για την Search Service σε ανάπτυξη
- Εξετάστε τη χρήση Consumption plan για Functions

## Ενότητα 4: Ασφάλεια και Καλύτερες Πρακτικές για Παραγωγή

### Βήμα 4.1: Ασφαλής Διαχείριση Διαπιστευτηρίων

**Τρέχουσα πρόκληση**: Πολλές εφαρμογές AI ενσωματώνουν API keys στο κώδικα ή χρησιμοποιούν ανασφαλή αποθήκευση.

**Λύση AZD**: Managed Identity + ενσωμάτωση Key Vault.

1. **Επανεξετάστε τη ρύθμιση ασφαλείας στο πρότυπό σας:**
```bash
# Αναζητήστε τη διαμόρφωση του Key Vault και της Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Επαληθεύστε ότι η Managed Identity λειτουργεί:**
```bash
# Ελέγξτε εάν η εφαρμογή web έχει τη σωστή διαμόρφωση ταυτότητας
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Βήμα 4.2: Ασφάλεια Δικτύου

1. **Ενεργοποιήστε private endpoints** (αν δεν έχουν ήδη διαμορφωθεί):

Προσθέστε στο bicep πρότυπό σας:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
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

### Βήμα 4.3: Παρακολούθηση και Παρατηρησιμότητα

1. **Διαμορφώστε Application Insights:**
```bash
# Το Application Insights θα πρέπει να ρυθμιστεί αυτόματα
# Ελέγξτε τη διαμόρφωση:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ορίστε παρακολούθηση ειδική για AI:**

Προσθέστε προσαρμοσμένες μετρήσεις για λειτουργίες AI:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Άσκηση Εργαστηρίου 4.1: Έλεγχος Ασφαλείας**

**Εργασία**: Επανεξετάστε την ανάπτυξή σας για βέλτιστες πρακτικές ασφαλείας.

**Λίστα ελέγχου:**
- [ ] Να μην υπάρχουν σκληροκωδικοποιημένα μυστικά στον κώδικα ή τη διαμόρφωση
- [ ] Χρήση Managed Identity για authentication υπηρεσίας προς υπηρεσία
- [ ] Key Vault αποθηκεύει ευαίσθητες ρυθμίσεις
- [ ] Η πρόσβαση στο δίκτυο είναι σωστά περιορισμένη
- [ ] Η παρακολούθηση και το logging είναι ενεργοποιημένα

## Ενότητα 5: Μετατροπή της Δικής σας Εφαρμογής AI

### Βήμα 5.1: Φύλλο Αξιολόγησης

**Πριν μετατρέψετε την εφαρμογή σας**, απαντήστε σε αυτές τις ερωτήσεις:

1. **Αρχιτεκτονική Εφαρμογής:**
   - Ποιες υπηρεσίες AI χρησιμοποιεί η εφαρμογή σας;
   - Ποιοι πόροι υπολογισμού χρειάζονται;
   - Απαιτείται βάση δεδομένων;
   - Ποιες είναι οι εξαρτήσεις μεταξύ των υπηρεσιών;

2. **Απαιτήσεις Ασφάλειας:**
   - Ποια ευαίσθητα δεδομένα χειρίζεται η εφαρμογή σας;
   - Ποιες απαιτήσεις συμμόρφωσης έχετε;
   - Χρειάζεστε ιδιωτικό δίκτυο;

3. **Απαιτήσεις Κλιμάκωσης:**
   - Ποιο είναι το αναμενόμενο φορτίο σας;
   - Χρειάζεστε αυτόματη κλιμάκωση;
   - Υπάρχουν περιφερειακές απαιτήσεις;

### Βήμα 5.2: Δημιουργήστε το πρότυπο AZD σας

**Ακολουθήστε αυτό το πρότυπο για να μετατρέψετε την εφαρμογή σας:**

1. **Δημιουργήστε τη βασική δομή:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Αρχικοποίηση προτύπου AZD
azd init --template minimal
```

2. **Δημιουργήστε το azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Δημιουργήστε πρότυπα υποδομής:**

**infra/main.bicep** - Κύριο πρότυπο:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - Μονάδα OpenAI:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Άσκηση Εργαστηρίου 5.1: Πρόκληση Δημιουργίας Προτύπου**

**Πρόκληση**: Δημιουργήστε ένα πρότυπο AZD για μια εφαρμογή επεξεργασίας εγγράφων με AI.

**Απαιτήσεις:**
- Microsoft Foundry Models για ανάλυση περιεχομένου
- Document Intelligence για OCR
- Storage Account για ανέβασμα εγγράφων
- Function App για λογική επεξεργασίας
- Web app για διεπαφή χρήστη

**Μπόνους:**
- Προσθέστε σωστό χειρισμό σφαλμάτων
- Συμπεριλάβετε εκτίμηση κόστους
- Ρυθμίστε dashboards παρακολούθησης

## Ενότητα 6: Αντιμετώπιση Συνήθων Προβλημάτων

### Συνήθη Προβλήματα Ανάπτυξης

#### Ζήτημα 1: Υπερβλήθηκε το όριο υπηρεσίας OpenAI
**Συμπτώματα:** Η ανάπτυξη αποτυγχάνει με σφάλμα ορίου
**Λύσεις:**
```bash
# Ελέγξτε τα τρέχοντα όρια
az cognitiveservices usage list --location eastus

# Ζητήστε αύξηση των ορίων ή δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up
```

#### Ζήτημα 2: Το μοντέλο δεν είναι διαθέσιμο στην περιοχή
**Συμπτώματα:** Οι απαντήσεις AI αποτυγχάνουν ή εμφανίζονται σφάλματα ανάπτυξης μοντέλου
**Λύσεις:**
```bash
# Ελέγξτε τη διαθεσιμότητα του μοντέλου ανά περιοχή
az cognitiveservices model list --location eastus

# Ενημερώστε σε διαθέσιμο μοντέλο
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Ζήτημα 3: Προβλήματα Δικαιωμάτων
**Συμπτώματα:** Σφάλματα 403 Forbidden κατά την κλήση υπηρεσιών AI
**Λύσεις:**
```bash
# Ελέγξτε τις αναθέσεις ρόλων
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Προσθέστε τους ελλείποντες ρόλους
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Ζητήματα Απόδοσης

#### Ζήτημα 4: Αργές απαντήσεις AI
**Βήματα διερεύνησης:**
1. Ελέγξτε το Application Insights για μετρήσεις απόδοσης
2. Αναθεωρήστε τις μετρήσεις υπηρεσίας OpenAI στο Azure portal
3. Επαληθεύστε τη συνδεσιμότητα δικτύου και την καθυστέρηση

**Λύσεις:**
- Εφαρμόστε caching για συνηθισμένα ερωτήματα
- Χρησιμοποιήστε κατάλληλο μοντέλο OpenAI για την περίπτωσή σας
- Σκεφτείτε αναγνώστες (read replicas) για σενάρια υψηλού φορτίου

### **Άσκηση Εργαστηρίου 6.1: Πρόκληση Εντοπισμού Σφαλμάτων**

**Σενάριο**: Η ανάπτυξη ήταν επιτυχής, αλλά η εφαρμογή επιστρέφει σφάλματα 500.

**Εργασίες εντοπισμού σφαλμάτων:**
1. Ελέγξτε τα logs της εφαρμογής
2. Επαληθεύστε τη συνδεσιμότητα υπηρεσιών
3. Δοκιμάστε την authentication
4. Αναθεωρήστε τη διαμόρφωση

**Εργαλεία προς χρήση:**
- `azd show` για επισκόπηση ανάπτυξης
- Azure portal για λεπτομερή logs υπηρεσιών
- Application Insights για τηλεμετρία εφαρμογής

## Ενότητα 7: Παρακολούθηση και Βελτιστοποίηση

### Βήμα 7.1: Ρύθμιση Ολοκληρωμένης Παρακολούθησης

1. **Δημιουργήστε προσαρμοσμένα dashboards:**

Πλοηγηθείτε στο Azure portal και δημιουργήστε ένα dashboard με:
- Πλήθος αιτήσεων και καθυστέρηση OpenAI
- Ποσοστά σφαλμάτων εφαρμογής
- Χρήση πόρων
- Παρακολούθηση κόστους

2. **Ρυθμίστε alerts:**
```bash
# Ειδοποίηση για υψηλό ποσοστό σφαλμάτων
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Βήμα 7.2: Βελτιστοποίηση Κόστους

1. **Αναλύστε τα τρέχοντα κόστη:**
```bash
# Χρησιμοποιήστε το Azure CLI για να λάβετε δεδομένα κόστους
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Υλοποιήστε μέτρα ελέγχου κόστους:**
- Ορίστε alerts προϋπολογισμού
- Χρησιμοποιήστε πολιτικές autoscaling
- Υλοποιήστε caching αιτήσεων
- Παρακολουθήστε τη χρήση token για OpenAI

### **Άσκηση Εργαστηρίου 7.1: Βελτιστοποίηση Απόδοσης**

**Εργασία**: Βελτιστοποιήστε την εφαρμογή AI σας για απόδοση και κόστος.

**Μετρήσεις προς βελτίωση:**
- Μειώστε τον μέσο χρόνο απόκρισης κατά 20%
- Μειώστε τα μηνιαία κόστη κατά 15%
- Διατηρήστε 99.9% uptime

**Στρατηγικές προς δοκιμή:**
- Εφαρμόστε caching απαντήσεων
- Βελτιστοποιήστε τα prompts για αποδοτικότητα token
- Χρησιμοποιήστε κατάλληλα compute SKUs
- Ρυθμίστε σωστή αυτόματη κλιμάκωση

## Τελική Πρόκληση: Υλοποίηση από Άκρο σε Άκρο

### Σενάριο Πρόκλησης

Σας ανατίθεται να δημιουργήσετε ένα παραγωγικό chatbot εξυπηρέτησης πελατών με AI που να πληροί τις παρακάτω απαιτήσεις:

**Λειτουργικές Απαιτήσεις:**
- Web διεπαφή για αλληλεπιδράσεις με πελάτες
- Ενσωμάτωση με Microsoft Foundry Models για απαντήσεις
- Δυνατότητα αναζήτησης εγγράφων με Azure AI Search
- Ενσωμάτωση με υπάρχουσα βάση πελατών
- Υποστήριξη πολλαπλών γλωσσών

**Μη Λειτουργικές Απαιτήσεις:**
- Διαχείριση 1000 ταυτόχρονων χρηστών
- 99.9% SLA uptime
- Συμμόρφωση SOC 2
- Κόστος κάτω από $500/μήνα
- Ανάπτυξη σε πολλαπλά περιβάλλοντα (dev, staging, prod)

### Βήματα Υλοποίησης

1. **Σχεδιάστε την αρχιτεκτονική**
2. **Δημιουργήστε το πρότυπο AZD**
3. **Υλοποιήστε μέτρα ασφαλείας**
4. **Ρυθμίστε παρακολούθηση και alerting**
5. **Δημιουργήστε pipelines ανάπτυξης**
6. **Τεκμηριώστε τη λύση**

### Κριτήρια Αξιολόγησης

- ✅ **Λειτουργικότητα**: Καλύπτει όλες τις απαιτήσεις;
- ✅ **Ασφάλεια**: Έχουν υλοποιηθεί οι βέλτιστες πρακτικές;
- ✅ **Κλιμάκωση**: Μπορεί να διαχειριστεί το φορτίο;
- ✅ **Συντηρησιμότητα**: Είναι ο κώδικας και η υποδομή καλά οργανωμένα;
- ✅ **Κόστος**: Παραμένει εντός προϋπολογισμού;

## Επιπλέον Πόροι

### Τεκμηρίωση Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Δείγματα Προτύπων
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Πόροι της Κοινότητας
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Πιστοποιητικό Ολοκλήρωσης

Συγχαρητήρια! Έχετε ολοκληρώσει το Εργαστήριο AI. Τώρα θα πρέπει να μπορείτε να:

- ✅ Να μετατρέψετε υπάρχουσες εφαρμογές AI σε πρότυπα AZD
- ✅ Να αναπτύξετε εφαρμογές AI έτοιμες για παραγωγή
- ✅ Να εφαρμόσετε βέλτιστες πρακτικές ασφαλείας για φορτία εργασίας AI
- ✅ Να παρακολουθείτε και να βελτιστοποιείτε την απόδοση εφαρμογών AI
- ✅ Να εντοπίζετε και να επιλύετε συνήθη προβλήματα ανάπτυξης

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα πρότυπα στα δικά σας έργα AI
2. Συνεισφέρετε τα πρότυπα πίσω στην κοινότητα
3. Εγγραφείτε στο Microsoft Foundry Discord για συνεχή υποστήριξη
4. Εξερευνήστε προηγμένα θέματα όπως αναπτύξεις σε πολλές περιοχές

---

**Σχόλια για το Εργαστήριο**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με έμφαση στο AI
- **⬅️ Προηγούμενο**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Επόμενο**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Εγγραφείτε στην κοινότητά μας για υποστήριξη και συζητήσεις σχετικά με τις αναπτύξεις AZD και AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->