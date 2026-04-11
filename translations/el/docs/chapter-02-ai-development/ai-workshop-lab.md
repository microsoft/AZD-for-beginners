# Εργαστήριο AI: Κάνοντας τις AI λύσεις σας αναπτύξιμες με AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλων AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Καλές Πρακτικές για Παραγωγικό AI](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το πρακτικό εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και στην ανάπτυξή του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά πρότυπα για παραγωγικές αναπτύξεις AI χρησιμοποιώντας τις υπηρεσίες Microsoft Foundry.

> **Σημείωση επαλήθευσης (2026-03-25):** Αυτό το εργαστήριο ελέγχθηκε με `azd` `1.23.12`. Εάν η τοπική εγκατάστασή σας είναι παλαιότερη, ενημερώστε το AZD πριν ξεκινήσετε ώστε η διαδικασία auth, template και ανάπτυξης να αντιστοιχεί στα βήματα παρακάτω.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Ενδιάμεσο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Στο τέλος αυτού του εργαστηρίου, θα είστε σε θέση να:
- ✅ Μετατρέψετε μια υπάρχουσα εφαρμογή AI ώστε να χρησιμοποιεί πρότυπα AZD
- ✅ Διαμορφώσετε υπηρεσίες Microsoft Foundry με AZD
- ✅ Υλοποιήσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Αναπτύξετε παραγωγικές εφαρμογές AI με παρακολούθηση
- ✅ Εντοπίζετε και επιλύετε κοινά ζητήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται VS Code)

### Πόροι Azure
- Συνδρομή Azure με δικαιώματα contributor
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models (ή δυνατότητα να ζητήσετε πρόσβαση)
- Δικαιώματα δημιουργίας resource group

### Γνώσεις - Προαπαιτούμενα
- Βασική κατανόηση υπηρεσιών Azure
- Εξοικείωση με διεπαφές γραμμής εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, prompts)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επαλήθευση εγκατάστασης εργαλείων:**
```bash
# Ελέγξτε την εγκατάσταση του AZD
azd version

# Ελέγξτε το Azure CLI
az --version

# Συνδεθείτε στο Azure για ροές εργασίας AZD
azd auth login

# Συνδεθείτε στο Azure CLI μόνο αν σκοπεύετε να εκτελέσετε εντολές az κατά τη διάρκεια των διαγνωστικών
az login
```

Εάν εργάζεστε σε πολλούς tenants ή η συνδρομή σας δεν ανιχνεύεται αυτόματα, επαναλάβετε με `azd auth login --tenant-id <tenant-id>`.

2. **Κλωνοποιήστε το αποθετήριο εργαστηρίου:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Ενότητα 1: Κατανόηση της Δομής AZD για Εφαρμογές AI

### Ανατομία ενός AZD Προτύπου για AI

Εξερευνήστε τα βασικά αρχεία σε ένα AZD πρότυπο έτοιμο για AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
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

**Τι να αναζητήσετε:**
- Ορισμοί υπηρεσιών για τα συστατικά AI
- Χάρτες μεταβλητών περιβάλλοντος
- Διαμορφώσεις host

2. **Ανασκόπηση της υποδομής main.bicep:**
```bash
cat infra/main.bicep
```

**Κύρια πρότυπα AI προς αναγνώριση:**
- Παροχή υπηρεσίας Microsoft Foundry Models
- Ενσωμάτωση Cognitive Search
- Ασφαλής διαχείριση κλειδιών
- Διαμορφώσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί Αυτά τα Πρότυπα Έχουν Σημασία για το AI

- **Εξαρτήσεις Υπηρεσιών**: Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια**: Κλειδιά API και endpoints απαιτούν ασφαλή διαχείριση
- **Κλιμάκωση**: Τα AI φορτία έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση Κόστους**: Οι υπηρεσίες AI μπορούν να γίνουν δαπανηρές αν δεν ρυθμιστούν σωστά

## Ενότητα 2: Αναπτύξτε την Πρώτη σας Εφαρμογή AI

### Βήμα 2.1: Αρχικοποίηση του Περιβάλλοντος

1. **Δημιουργήστε ένα νέο περιβάλλον AZD:**
```bash
azd env new myai-workshop
```

2. **Ορίστε τις απαιτούμενες παραμέτρους:**
```bash
# Ορίστε την προτιμώμενη περιοχή Azure σας
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
- ✅ Δημιουργεί υπηρεσία Microsoft Foundry Models
- ✅ Δημιουργεί υπηρεσία Cognitive Search
- ✅ Ρυθμίζει App Service για την εφαρμογή ιστού
- ✅ Διαμορφώνει δίκτυο και ασφάλεια
- ✅ Αναπτύσσει τον κώδικα της εφαρμογής
- ✅ Ρυθμίζει παρακολούθηση και καταγραφές

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

Ανοίξτε το endpoint ιστού που εμφανίζεται στην έξοδο του `azd show`.

3. **Δοκιμάστε τη λειτουργικότητα AI:**
   - Πλοηγηθείτε στην εφαρμογή ιστού
   - Δοκιμάστε δείγματα ερωτημάτων
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Άσκηση Επίλυσης Προβλημάτων**

**Σενάριο**: Η ανάπτυξή σας πέτυχε αλλά το AI δεν ανταποκρίνεται.

**Συνηθισμένα ζητήματα προς έλεγχο:**
1. **Κλειδιά OpenAI API**: Επαληθεύστε ότι έχουν οριστεί σωστά
2. **Διαθεσιμότητα μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Συνδεσιμότητα δικτύου**: Βεβαιωθείτε ότι οι υπηρεσίες μπορούν να επικοινωνήσουν
4. **Δικαιώματα RBAC**: Επαληθεύστε ότι η εφαρμογή μπορεί να αποκτήσει πρόσβαση στο OpenAI

**Εντολές αποσφαλμάτωσης:**
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
# Αλλάξτε σε διαφορετικό μοντέλο (εάν είναι διαθέσιμο στην περιοχή σας)
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

### Βήμα 3.2: Διαμορφώσεις Ειδικές για Περιβάλλον

**Καλύτερη Πρακτική**: Διαφορετικές διαμορφώσεις για ανάπτυξη και παραγωγή.

1. **Δημιουργήστε περιβάλλον παραγωγής:**
```bash
azd env new myai-production
```

2. **Ορίστε παραμέτρους ειδικές για παραγωγή:**
```bash
# Στην παραγωγή συνήθως χρησιμοποιούνται υψηλότερα SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ενεργοποιήστε επιπλέον χαρακτηριστικά ασφαλείας
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Άσκηση Εργαστηρίου 3.1: Βελτιστοποίηση Κόστους**

**Πρόκληση**: Διαμορφώστε το πρότυπο για οικονομικά αποδοτική ανάπτυξη.

**Εργασίες:**
1. Προσδιορίστε ποιες SKU μπορούν να οριστούν σε free/basic επίπεδα
2. Διαμορφώστε μεταβλητές περιβάλλοντος για ελάχιστο κόστος
3. Αναπτύξτε και συγκρίνετε τα κόστη με τη διαμόρφωση παραγωγής

**Συμβουλές λύσης:**
- Χρησιμοποιήστε το επίπεδο F0 (δωρεάν) για Cognitive Services όπου είναι δυνατό
- Χρησιμοποιήστε το Basic επίπεδο για την Search Service στην ανάπτυξη
- Σκεφτείτε τη χρήση του Consumption πλάνου για Functions

## Ενότητα 4: Ασφάλεια και Καλύτερες Πρακτικές για Παραγωγή

### Βήμα 4.1: Ασφαλής Διαχείριση Διαπιστευτηρίων

**Τρέχουσα πρόκληση**: Πολλές εφαρμογές AI ενσωματώνουν κλειδιά API στον κώδικα ή χρησιμοποιούν ανασφαλή αποθήκευση.

**Λύση AZD**: Ενσωμάτωση Managed Identity + Key Vault.

1. **Επανεξετάστε τη ρύθμιση ασφαλείας στο πρότυπό σας:**
```bash
# Αναζητήστε τη διαμόρφωση του Key Vault και της Managed Identity
grep -r "keyVault\|managedIdentity" infra/
```

2. **Επαληθεύστε ότι το Managed Identity λειτουργεί:**
```bash
# Ελέγξτε αν η web εφαρμογή έχει τη σωστή διαμόρφωση ταυτότητας
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Βήμα 4.2: Ασφάλεια Δικτύου

1. **Ενεργοποιήστε ιδιωτικά endpoints** (αν δεν έχουν ήδη διαμορφωθεί):

Προσθέστε στο template bicep σας:
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
# Το Application Insights πρέπει να διαμορφωθεί αυτόματα
# Ελέγξτε τη διαμόρφωση:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ρυθμίστε παρακολούθηση ειδική για AI:**

Προσθέστε προσαρμοσμένα metrics για λειτουργίες AI:
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

**Εργασία**: Επανεξετάστε την ανάπτυξή σας για τις καλύτερες πρακτικές ασφαλείας.

**Λίστα ελέγχου:**
- [ ] Καμία κωδικοποιημένη (hardcoded) μυστική πληροφορία σε κώδικα ή διαμόρφωση
- [ ] Χρήση Managed Identity για αυθεντικοποίηση υπηρεσίας προς υπηρεσία
- [ ] Το Key Vault αποθηκεύει ευαίσθητες ρυθμίσεις
- [ ] Η πρόσβαση στο δίκτυο είναι σωστά περιορισμένη
- [ ] Η παρακολούθηση και η καταγραφή είναι ενεργοποιημένες

## Ενότητα 5: Μετατροπή της Δικής σας Εφαρμογής AI

### Βήμα 5.1: Φύλλο Αξιολόγησης

**Πριν μετατρέψετε την εφαρμογή σας**, απαντήστε σε αυτές τις ερωτήσεις:

1. **Αρχιτεκτονική Εφαρμογής:**
   - Ποιες υπηρεσίες AI χρησιμοποιεί η εφαρμογή σας;
   - Ποιους πόρους υπολογιστικής ισχύος χρειάζεται;
   - Απαιτεί βάση δεδομένων;
   - Ποιες είναι οι εξαρτήσεις μεταξύ των υπηρεσιών;

2. **Απαιτήσεις Ασφαλείας:**
   - Ποια ευαίσθητα δεδομένα χειρίζεται η εφαρμογή σας;
   - Ποιες απαιτήσεις συμμόρφωσης έχετε;
   - Χρειάζεστε ιδιωτικό δίκτυο;

3. **Απαιτήσεις Κλιμάκωσης:**
   - Ποιο είναι το αναμενόμενο φορτίο σας;
   - Χρειάζεστε αυτόματη κλιμάκωση;
   - Υπάρχουν απαιτήσεις περιοχών;

### Βήμα 5.2: Δημιουργήστε το Πρότυπο AZD σας

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
- Προσθέστε σωστή διαχείριση σφαλμάτων
- Συμπεριλάβετε εκτίμηση κόστους
- Ρυθμίστε dashboards παρακολούθησης

## Ενότητα 6: Επίλυση Συνήθων Προβλημάτων

### Συνήθη Ζητήματα Ανάπτυξης

#### Ζήτημα 1: Υπέρβαση ορίου υπηρεσίας OpenAI
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

# Αναβαθμίστε σε διαθέσιμο μοντέλο
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Ζήτημα 3: Ζητήματα Δικαιωμάτων
**Συμπτώματα:** Σφάλματα 403 Forbidden όταν καλείτε υπηρεσίες AI  
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

#### Ζήτημα 4: Αργές Απαντήσεις AI
**Βήματα διερεύνησης:**
1. Ελέγξτε το Application Insights για μετρήσεις απόδοσης
2. Ανασκοπήστε τις μετρήσεις υπηρεσίας OpenAI στο Azure portal
3. Επαληθεύστε τη συνδεσιμότητα δικτύου και την καθυστέρηση

**Λύσεις:**
- Υλοποιήστε caching για συχνές ερωτήσεις
- Χρησιμοποιήστε κατάλληλο μοντέλο OpenAI για την περίπτωσή σας
- Σκεφτείτε read replicas για σενάρια υψηλού φορτίου

### **Άσκηση Εργαστηρίου 6.1: Πρόκληση Αποσφαλμάτωσης**

**Σενάριο**: Η ανάπτυξή σας πέτυχε, αλλά η εφαρμογή επιστρέφει σφάλματα 500.

**Εργασίες αποσφαλμάτωσης:**
1. Ελέγξτε τα logs της εφαρμογής
2. Επαληθεύστε τη συνδεσιμότητα υπηρεσιών
3. Δοκιμάστε την αυθεντικοποίηση
4. Ανασκοπήστε τη διαμόρφωση

**Εργαλεία για χρήση:**
- `azd show` για επισκόπηση ανάπτυξης
- Azure portal για λεπτομερή logs υπηρεσιών
- Application Insights για τηλεμετρία εφαρμογής

## Ενότητα 7: Παρακολούθηση και Βελτιστοποίηση

### Βήμα 7.1: Ρύθμιση Ολοκληρωμένης Παρακολούθησης

1. **Δημιουργήστε προσαρμοσμένα dashboards:**

Πλοηγηθείτε στο Azure portal και δημιουργήστε ένα dashboard με:
- Αριθμό αιτήσεων και καθυστέρηση OpenAI
- Ποσοστά σφαλμάτων εφαρμογής
- Χρήση πόρων
- Παρακολούθηση κόστους

2. **Ρυθμίστε ειδοποιήσεις:**
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

2. **Εφαρμόστε ελέγχους κόστους:**
- Ορίστε ειδοποιήσεις προϋπολογισμού
- Χρησιμοποιήστε πολιτικές autoscaling
- Υλοποιήστε caching αιτήσεων
- Παρακολουθήστε τη χρήση token για OpenAI

### **Άσκηση Εργαστηρίου 7.1: Βελτιστοποίηση Απόδοσης**

**Εργασία**: Βελτιστοποιήστε την εφαρμογή AI για απόδοση και κόστος.

**Μετρικές προς βελτίωση:**
- Μείωση μέσου χρόνου απόκρισης κατά 20%
- Μείωση μηνιαίου κόστους κατά 15%
- Διατήρηση 99.9% χρόνου λειτουργίας

**Στρατηγικές προς δοκιμή:**
- Υλοποίηση caching απαντήσεων
- Βελτιστοποίηση prompts για αποδοτικότητα token
- Επιλογή κατάλληλων compute SKU
- Ρύθμιση σωστού autoscaling

## Τελική Πρόκληση: Υλοποίηση Από Άκρο σε Άκρο

### Σενάριο Πρόκλησης

Σας ανατίθεται η δημιουργία ενός παραγωγικού chatbot εξυπηρέτησης πελατών με παρακάτω απαιτήσεις:

Λειτουργικές Απαιτήσεις:
- Web διεπαφή για αλληλεπίδραση με πελάτες
- Ενσωμάτωση με Microsoft Foundry Models για απαντήσεις
- Δυνατότητα αναζήτησης εγγράφων με Cognitive Search
- Ενσωμάτωση με υπάρχουσα βάση πελατών
- Υποστήριξη πολλαπλών γλωσσών

Μη λειτουργικές Απαιτήσεις:
- Διαχείριση 1000 ταυτόχρονων χρηστών
- SLA 99.9% χρόνο λειτουργίας
- Συμμόρφωση SOC 2
- Κόστος κάτω από $500/μήνα
- Ανάπτυξη σε πολλαπλά περιβάλλοντα (dev, staging, prod)

### Βήματα Υλοποίησης

1. **Σχεδιάστε την αρχιτεκτονική**
2. **Δημιουργήστε το πρότυπο AZD**
3. **Υλοποιήστε μέτρα ασφαλείας**
4. **Ρυθμίστε παρακολούθηση και ειδοποιήσεις**
5. **Δημιουργήστε pipelines ανάπτυξης**
6. **Τεκμηριώστε τη λύση**

### Κριτήρια Αξιολόγησης

- ✅ **Λειτουργικότητα**: Καλύπτει όλες τις απαιτήσεις;
- ✅ **Ασφάλεια**: Εφαρμόζονται οι καλύτερες πρακτικές;
- ✅ **Κλιμάκωση**: Μπορεί να αντέξει το φορτίο;
- ✅ **Συντηρησιμότητα**: Είναι οργανωμένος ο κώδικας και η υποδομή;
- ✅ **Κόστος**: Μένει εντός του προϋπολογισμού;

## Επιπλέον Πόροι

### Τεκμηρίωση Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Δείγματα Προτύπων
- [Εφαρμογή Συνομιλίας Microsoft Foundry Models](https://github.com/Azure-Samples/azure-search-openai-demo)
- [Quickstart Εφαρμογής Συνομιλίας OpenAI](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Πόροι Κοινότητας
- [Discord του Microsoft Foundry](https://discord.gg/microsoft-azure)
- [Azure Developer CLI στο GitHub](https://github.com/Azure/azure-dev)
- [Εξαιρετικά Πρότυπα AZD](https://azure.github.io/awesome-azd/)

## 🎓 Πιστοποιητικό Ολοκλήρωσης

Συγχαρητήρια! Έχετε ολοκληρώσει το Εργαστήριο Τεχνητής Νοημοσύνης. Πλέον θα πρέπει να μπορείτε να:

- ✅ Μετατρέψετε υπάρχουσες εφαρμογές AI σε πρότυπα AZD
- ✅ Αναπτύξετε έτοιμες για παραγωγή εφαρμογές AI
- ✅ Εφαρμόσετε βέλτιστες πρακτικές ασφάλειας για φόρτους εργασίας AI
- ✅ Παρακολουθείτε και βελτιστοποιείτε την απόδοση εφαρμογών AI
- ✅ Εντοπίζετε και επιλύετε συνηθισμένα προβλήματα ανάπτυξης

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα πρότυπα στα δικά σας έργα AI
2. Συνεισφέρετε τα πρότυπα πίσω στην κοινότητα
3. Εγγραφείτε στο Discord του Microsoft Foundry για συνεχή υποστήριξη
4. Εξερευνήστε προχωρημένα θέματα όπως αναπτύξεις σε πολλαπλές περιοχές

---

**Ανατροφοδότηση Εργαστηρίου**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [κανάλι Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στην Τεχνητή Νοημοσύνη
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές AI για Παραγωγή](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε βοήθεια;** Ενταχθείτε στην κοινότητά μας για υποστήριξη και συζητήσεις σχετικά με τις αναπτύξεις AZD και AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->