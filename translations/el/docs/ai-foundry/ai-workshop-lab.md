<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-21T06:51:20+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "el"
}
-->
# Εργαστήριο AI: Κάνοντας τις λύσεις AI σας έτοιμες για ανάπτυξη με AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα το AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές Παραγωγής AI](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../getting-started/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το πρακτικό εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και ανάπτυξής του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά πρότυπα για αναπτύξεις AI σε παραγωγή χρησιμοποιώντας τις υπηρεσίες Microsoft Foundry.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Μεσαίο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Μέχρι το τέλος αυτού του εργαστηρίου, θα μπορείτε:
- ✅ Να μετατρέψετε μια υπάρχουσα εφαρμογή AI για χρήση με πρότυπα AZD
- ✅ Να ρυθμίσετε τις υπηρεσίες Microsoft Foundry με AZD
- ✅ Να εφαρμόσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Να αναπτύξετε εφαρμογές AI έτοιμες για παραγωγή με παρακολούθηση
- ✅ Να αντιμετωπίσετε κοινά προβλήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται το VS Code)

### Πόροι Azure
- Συνδρομή Azure με δικαιώματα συνεισφοράς
- Πρόσβαση στις υπηρεσίες Azure OpenAI (ή δυνατότητα αίτησης πρόσβασης)
- Δικαιώματα δημιουργίας ομάδας πόρων

### Γνώσεις Προαπαιτούμενες
- Βασική κατανόηση των υπηρεσιών Azure
- Εξοικείωση με διεπαφές γραμμής εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, προτροπές)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επαληθεύστε τις εγκαταστάσεις εργαλείων:**
```bash
# Ελέγξτε την εγκατάσταση AZD
azd version

# Ελέγξτε το Azure CLI
az --version

# Συνδεθείτε στο Azure
az login
azd auth login
```

2. **Κλωνοποιήστε το αποθετήριο του εργαστηρίου:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Ενότητα 1: Κατανόηση της Δομής AZD για Εφαρμογές AI

### Ανατομία ενός Προτύπου AZD για AI

Εξερευνήστε τα βασικά αρχεία σε ένα πρότυπο AZD έτοιμο για AI:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Άσκηση Εργαστηρίου 1.1: Εξερεύνηση της Ρύθμισης**

1. **Εξετάστε το αρχείο azure.yaml:**
```bash
cat azure.yaml
```

**Τι να αναζητήσετε:**
- Ορισμοί υπηρεσιών για στοιχεία AI
- Αντιστοιχίσεις μεταβλητών περιβάλλοντος
- Ρυθμίσεις φιλοξενίας

2. **Ανασκόπηση της κύριας υποδομής bicep:**
```bash
cat infra/main.bicep
```

**Βασικά πρότυπα AI για αναγνώριση:**
- Παροχή υπηρεσίας Azure OpenAI
- Ενσωμάτωση Cognitive Search
- Ασφαλής διαχείριση κλειδιών
- Ρυθμίσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί Αυτά τα Πρότυπα Είναι Σημαντικά για το AI

- **Εξαρτήσεις Υπηρεσιών**: Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια**: Τα κλειδιά API και τα τελικά σημεία χρειάζονται ασφαλή διαχείριση
- **Κλιμάκωση**: Οι φόρτοι εργασίας AI έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση Κόστους**: Οι υπηρεσίες AI μπορεί να είναι ακριβές αν δεν ρυθμιστούν σωστά

## Ενότητα 2: Αναπτύξτε την Πρώτη σας Εφαρμογή AI

### Βήμα 2.1: Αρχικοποίηση Περιβάλλοντος

1. **Δημιουργήστε ένα νέο περιβάλλον AZD:**
```bash
azd env new myai-workshop
```

2. **Ορίστε τις απαιτούμενες παραμέτρους:**
```bash
# Ορίστε την προτιμώμενη περιοχή Azure σας
azd env set AZURE_LOCATION eastus

# Προαιρετικό: Ορίστε συγκεκριμένο μοντέλο OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Βήμα 2.2: Ανάπτυξη Υποδομής και Εφαρμογής

1. **Αναπτύξτε με AZD:**
```bash
azd up
```

**Τι συμβαίνει κατά τη διάρκεια του `azd up`:**
- ✅ Παρέχει την υπηρεσία Azure OpenAI
- ✅ Δημιουργεί την υπηρεσία Cognitive Search
- ✅ Ρυθμίζει την App Service για την εφαρμογή ιστού
- ✅ Διαμορφώνει το δίκτυο και την ασφάλεια
- ✅ Αναπτύσσει τον κώδικα της εφαρμογής
- ✅ Ρυθμίζει την παρακολούθηση και την καταγραφή

2. **Παρακολουθήστε την πρόοδο της ανάπτυξης** και σημειώστε τους πόρους που δημιουργούνται.

### Βήμα 2.3: Επαλήθευση της Ανάπτυξης

1. **Ελέγξτε τους αναπτυγμένους πόρους:**
```bash
azd show
```

2. **Ανοίξτε την αναπτυγμένη εφαρμογή:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Δοκιμάστε τη λειτουργικότητα AI:**
   - Πλοηγηθείτε στην εφαρμογή ιστού
   - Δοκιμάστε δείγματα ερωτημάτων
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Πρακτική Αντιμετώπισης Προβλημάτων**

**Σενάριο**: Η ανάπτυξή σας πέτυχε αλλά το AI δεν αποκρίνεται.

**Κοινά προβλήματα για έλεγχο:**
1. **Κλειδιά API OpenAI**: Επαληθεύστε ότι έχουν ρυθμιστεί σωστά
2. **Διαθεσιμότητα μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Συνδεσιμότητα δικτύου**: Βεβαιωθείτε ότι οι υπηρεσίες μπορούν να επικοινωνούν
4. **Δικαιώματα RBAC**: Επαληθεύστε ότι η εφαρμογή μπορεί να έχει πρόσβαση στο OpenAI

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

### Βήμα 3.1: Τροποποίηση της Ρύθμισης AI

1. **Ενημερώστε το μοντέλο OpenAI:**
```bash
# Αλλαγή σε διαφορετικό μοντέλο (αν είναι διαθέσιμο στην περιοχή σας)
azd env set AZURE_OPENAI_MODEL gpt-4

# Επαναδιάταξη με τη νέα διαμόρφωση
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

### Βήμα 3.2: Ρυθμίσεις Ειδικές για Περιβάλλοντα

**Βέλτιστη Πρακτική**: Διαφορετικές ρυθμίσεις για ανάπτυξη και παραγωγή.

1. **Δημιουργήστε ένα περιβάλλον παραγωγής:**
```bash
azd env new myai-production
```

2. **Ορίστε παραμέτρους ειδικές για παραγωγή:**
```bash
# Η παραγωγή συνήθως χρησιμοποιεί υψηλότερα SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ενεργοποίηση πρόσθετων χαρακτηριστικών ασφαλείας
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Άσκηση Εργαστηρίου 3.1: Βελτιστοποίηση Κόστους**

**Πρόκληση**: Ρυθμίστε το πρότυπο για οικονομική ανάπτυξη.

**Εργασίες:**
1. Εντοπίστε ποια SKUs μπορούν να οριστούν σε δωρεάν/βασικά επίπεδα
2. Ρυθμίστε μεταβλητές περιβάλλοντος για ελάχιστο κόστος
3. Αναπτύξτε και συγκρίνετε το κόστος με τη ρύθμιση παραγωγής

**Υποδείξεις λύσης:**
- Χρησιμοποιήστε το επίπεδο F0 (δωρεάν) για Cognitive Services όπου είναι δυνατόν
- Χρησιμοποιήστε το βασικό επίπεδο για την υπηρεσία αναζήτησης στην ανάπτυξη
- Σκεφτείτε τη χρήση του Consumption plan για Functions

## Ενότητα 4: Ασφάλεια και Βέλτιστες Πρακτικές Παραγωγής

### Βήμα 4.1: Ασφαλής Διαχείριση Διαπιστευτηρίων

**Τρέχουσα πρόκληση**: Πολλές εφαρμογές AI ενσωματώνουν κλειδιά API ή χρησιμοποιούν μη ασφαλή αποθήκευση.

**Λύση AZD**: Ενσωμάτωση Managed Identity + Key Vault.

1. **Ανασκόπηση της ρύθμισης ασφάλειας στο πρότυπό σας:**
```bash
# Αναζητήστε τη διαμόρφωση του Key Vault και της Διαχειριζόμενης Ταυτότητας
grep -r "keyVault\|managedIdentity" infra/
```

2. **Επαληθεύστε ότι το Managed Identity λειτουργεί:**
```bash
# Ελέγξτε αν η διαδικτυακή εφαρμογή έχει τη σωστή διαμόρφωση ταυτότητας
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Βήμα 4.2: Ασφάλεια Δικτύου

1. **Ενεργοποιήστε ιδιωτικά τελικά σημεία** (αν δεν έχουν ήδη ρυθμιστεί):

Προσθέστε στο πρότυπο bicep:
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

1. **Ρυθμίστε το Application Insights:**
```bash
# Οι Application Insights πρέπει να διαμορφωθούν αυτόματα
# Ελέγξτε τη διαμόρφωση:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ρυθμίστε παρακολούθηση ειδική για AI:**

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

### **Άσκηση Εργαστηρίου 4.1: Έλεγχος Ασφάλειας**

**Εργασία**: Ανασκόπηση της ανάπτυξής σας για βέλτιστες πρακτικές ασφάλειας.

**Λίστα Ελέγχου:**
- [ ] Δεν υπάρχουν ενσωματωμένα μυστικά στον κώδικα ή τη ρύθμιση
- [ ] Χρησιμοποιείται Managed Identity για αυθεντικοποίηση υπηρεσίας προς υπηρεσία
- [ ] Το Key Vault αποθηκεύει ευαίσθητες ρυθμίσεις
- [ ] Η πρόσβαση στο δίκτυο είναι σωστά περιορισμένη
- [ ] Η παρακολούθηση και η καταγραφή είναι ενεργοποιημένες

## Ενότητα 5: Μετατροπή της Δικής σας Εφαρμογής AI

### Βήμα 5.1: Φύλλο Εργασίας Αξιολόγησης

**Πριν μετατρέψετε την εφαρμογή σας**, απαντήστε στις εξής ερωτήσεις:

1. **Αρχιτεκτονική Εφαρμογής:**
   - Ποιες υπηρεσίες AI χρησιμοποιεί η εφαρμογή σας;
   - Ποιοι πόροι υπολογισμού χρειάζονται;
   - Απαιτεί βάση δεδομένων;
   - Ποιες είναι οι εξαρτήσεις μεταξύ των υπηρεσιών;

2. **Απαιτήσεις Ασφάλειας:**
   - Ποια ευαίσθητα δεδομένα χειρίζεται η εφαρμογή σας;
   - Ποιες απαιτήσεις συμμόρφωσης έχετε;
   - Χρειάζεστε ιδιωτικό δίκτυο;

3. **Απαιτήσεις Κλιμάκωσης:**
   - Ποιο είναι το αναμενόμενο φορτίο σας;
   - Χρειάζεστε αυτόματη κλιμάκωση;
   - Υπάρχουν περιφερειακές απαιτήσεις;

### Βήμα 5.2: Δημιουργία του Προτύπου AZD σας

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

**Πρόκληση**: Δημιουργήστε ένα πρότυπο AZD για μια εφαρμογή AI επεξεργασίας εγγράφων.

**Απαιτήσεις:**
- Azure OpenAI για ανάλυση περιεχομένου
- Document Intelligence για OCR
- Λογαριασμός αποθήκευσης για μεταφορτώσεις εγγράφων
- Function App για λογική επεξεργασίας
- Εφαρμογή ιστού για διεπαφή χρήστη

**Επιπλέον πόντοι:**
- Προσθέστε σωστή διαχείριση σφαλμάτων
- Συμπεριλάβετε εκτίμηση κόστους
- Ρυθμίστε πίνακες παρακολούθησης

## Ενότητα 6: Αντιμετώπιση Κοινών Προβλημάτων

### Κοινά Προβλήματα Ανάπτυξης

#### Πρόβλημα 1: Υπέρβαση Ποσοστώσεων Υπηρεσίας OpenAI
**Συμπτώματα:** Η ανάπτυξη αποτυγχάνει με σφάλμα ποσοστώσεων
**Λύσεις:**
```bash
# Ελέγξτε τις τρέχουσες ποσοστώσεις
az cognitiveservices usage list --location eastus

# Ζητήστε αύξηση ποσοστώσεων ή δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up
```

#### Πρόβλημα 2: Μοντέλο Μη Διαθέσιμο στην Περιοχή
**Συμπτώματα:** Οι απαντήσεις AI αποτυγχάνουν ή σφάλματα ανάπτυξης μοντέλου
**Λύσεις:**
```bash
# Ελέγξτε τη διαθεσιμότητα του μοντέλου ανά περιοχή
az cognitiveservices model list --location eastus

# Ενημέρωση στο διαθέσιμο μοντέλο
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Πρόβλημα 3: Προβλήματα Δικαιωμάτων
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

### Προβλήματα Απόδοσης

#### Πρόβλημα 4: Αργές Απαντήσεις AI
**Βήματα διερεύνησης:**
1. Ελέγξτε τις μετρήσεις απόδοσης στο Application Insights
2. Ανασκόπηση μετρήσεων υπηρεσίας OpenAI στην πύλη Azure
3. Επαληθεύστε τη συνδεσιμότητα δικτύου και την καθυστέρηση

**Λύσεις:**
- Εφαρμόστε προσωρινή αποθήκευση για κοινά ερωτήματα
- Χρησιμοποιήστε κατάλληλο μοντέλο OpenAI για την περίπτωση χρήσης σας
- Σκεφτείτε αναγνώσεις αντιγράφων για σενάρια υψηλού φορτίου

### **Άσκηση Εργαστηρίου 6.1: Πρόκληση Αποσφαλμάτωσης**

**Σενάριο**: Η ανάπτυξή σας πέτυχε, αλλά η εφαρμογή επιστρέφει σφάλματα 500.

**Εργασίες αποσφαλμάτωσης:**
1. Ελέγξτε τα αρχεία καταγραφής εφαρμογής
2. Επαληθεύστε τη συνδεσιμότητα υπηρεσιών
3. Δοκιμάστε την αυθεντικοποίηση
4. Ανασκόπηση ρυθμίσεων

**Εργαλεία για χρήση:**
- `azd show` για επισκόπηση ανάπτυξης
- Πύλη Azure για λεπτομερή αρχεία καταγραφής υπηρεσιών
- Application Insights για τηλεμετρία εφαρμογής

## Ενότητα 7: Παρακολούθηση και Βελτιστοποίηση

### Βήμα 7.1: Ρύθμιση Ολοκληρωμένης Παρακολούθησης

1. **Δημιουργήστε προσαρμοσμένους πίνακες:**

Πλοηγηθείτε στην πύλη Azure και δημιουργήστε έναν πίνακα με:
- Αριθμό αιτημάτων και καθυστέρηση OpenAI
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

1. **Αναλύστε το τρέχον κόστος:**
```bash
# Χρησιμοποιήστε το Azure CLI για να λάβετε δεδομένα κόστους
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Εφαρμόστε ελέγχους κόστους:**
- Ρυθμίστε ειδοποιήσεις προϋπολογισμού

Συγχαρητήρια! Ολοκληρώσατε το Εργαστήριο AI Workshop. Τώρα θα πρέπει να μπορείτε να:

- ✅ Μετατρέπετε υπάρχουσες εφαρμογές AI σε πρότυπα AZD
- ✅ Αναπτύσσετε εφαρμογές AI έτοιμες για παραγωγή
- ✅ Εφαρμόζετε βέλτιστες πρακτικές ασφαλείας για φόρτους εργασίας AI
- ✅ Παρακολουθείτε και βελτιστοποιείτε την απόδοση των εφαρμογών AI
- ✅ Αντιμετωπίζετε κοινά προβλήματα ανάπτυξης

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα πρότυπα στα δικά σας έργα AI
2. Συνεισφέρετε πρότυπα πίσω στην κοινότητα
3. Εγγραφείτε στο Microsoft Foundry Discord για συνεχή υποστήριξη
4. Εξερευνήστε προχωρημένα θέματα όπως αναπτύξεις σε πολλαπλές περιοχές

---

**Ανατροφοδότηση Εργαστηρίου**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές AI για Παραγωγή](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../getting-started/configuration.md)

**Χρειάζεστε Βοήθεια;** Εγγραφείτε στην κοινότητά μας για υποστήριξη και συζητήσεις σχετικά με AZD και αναπτύξεις AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->