# Εργαστήριο AI: Κάνοντας τις λύσεις AI σας αναπτύξιμες με AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με έμφαση στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Καλές Πρακτικές Παραγωγικού AI](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το πρακτικό εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και στην ανάπτυξή του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά μοτίβα για παραγωγικές αναπτύξεις AI χρησιμοποιώντας υπηρεσίες Microsoft Foundry.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Ενδιάμεσο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Στο τέλος αυτού του εργαστηρίου, θα μπορείτε να:
- ✅ Μετατρέψετε μια υπάρχουσα εφαρμογή AI ώστε να χρησιμοποιεί πρότυπα AZD
- ✅ Διαμορφώσετε υπηρεσίες Microsoft Foundry με AZD
- ✅ Υλοποιήσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Αναπτύξετε παραγωγικές εφαρμογές AI με παρακολούθηση
- ✅ Αντιμετωπίσετε συνήθη προβλήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται το VS Code)

### Πόροι Azure
- Συνδρομή Azure με δικαιώματα συνεισφοράς
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models (ή δυνατότητα να ζητήσετε πρόσβαση)
- Δικαιώματα δημιουργίας ομάδας πόρων

### Απαιτούμενες Γνώσεις
- Βασική κατανόηση των υπηρεσιών Azure
- Εξοικείωση με διεπαφές γραμμής εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, prompts)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επαληθεύστε τις εγκαταστάσεις των εργαλείων:**
```bash
# Ελέγξτε την εγκατάσταση του AZD
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

**Τι να προσέξετε:**
- Ορισμοί υπηρεσιών για στοιχεία AI
- Χαρτογραφήσεις μεταβλητών περιβάλλοντος
- Διαμορφώσεις οικοδεσπότη

2. **Επανεξετάστε την υποδομή main.bicep:**
```bash
cat infra/main.bicep
```

**Βασικά πρότυπα AI προς αναγνώριση:**
- Παροχή υπηρεσίας Microsoft Foundry Models
- Ενσωμάτωση Cognitive Search
- Ασφαλής διαχείριση κλειδιών
- Διαμορφώσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί αυτά τα πρότυπα έχουν σημασία για το AI

- **Εξαρτήσεις Υπηρεσιών**: Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια**: Τα API keys και τα endpoints χρειάζονται ασφαλή διαχείριση
- **Κλιμάκωση**: Τα φορτία εργασίας AI έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση Κόστους**: Οι υπηρεσίες AI μπορεί να είναι δαπανηρές αν δεν διαμορφωθούν σωστά

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

# Προαιρετικά: Ορίστε συγκεκριμένο μοντέλο OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Βήμα 2.2: Αναπτύξτε την Υποδομή και την Εφαρμογή

1. **Αναπτύξτε με το AZD:**
```bash
azd up
```

**Τι συμβαίνει κατά το `azd up`:**
- ✅ Provisioning της υπηρεσίας Microsoft Foundry Models
- ✅ Δημιουργία υπηρεσίας Cognitive Search
- ✅ Ρύθμιση App Service για την web εφαρμογή
- ✅ Διαμόρφωση δικτύωσης και ασφάλειας
- ✅ Ανάπτυξη κώδικα εφαρμογής
- ✅ Ρύθμιση παρακολούθησης και καταγραφής

2. **Παρακολουθήστε την πρόοδο της ανάπτυξης** και σημειώστε τους πόρους που δημιουργούνται.

### Βήμα 2.3: Επαληθεύστε την Ανάπτυξή σας

1. **Ελέγξτε τους αναπτυγμένους πόρους:**
```bash
azd show
```

2. **Ανοίξτε την αναπτυγμένη εφαρμογή:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Δοκιμάστε τη λειτουργικότητα AI:**
   - Πλοηγηθείτε στην web εφαρμογή
   - Δοκιμάστε δείγματα ερωτημάτων
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Εξάσκηση Επίλυσης Προβλημάτων**

**Σενάριο**: Η ανάπτυξή σας ήταν επιτυχής αλλά το AI δεν αποκρίνεται.

**Συνηθισμένα προβλήματα που πρέπει να ελέγξετε:**
1. **Κλειδιά OpenAI API**: Επαληθεύστε ότι έχουν οριστεί σωστά
2. **Διαθεσιμότητα μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Συνδεσιμότητα δικτύου**: Εξασφαλίστε ότι οι υπηρεσίες μπορούν να επικοινωνήσουν
4. **Δικαιώματα RBAC**: Επαληθεύστε ότι η εφαρμογή μπορεί να έχει πρόσβαση στο OpenAI

**Εντολές εντοπισμού σφαλμάτων:**
```bash
# Ελέγξτε τις μεταβλητές περιβάλλοντος
azd env get-values

# Προβολή αρχείων καταγραφής ανάπτυξης
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Ελέγξτε την κατάσταση ανάπτυξης του OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Ενότητα 3: Προσαρμογή Εφαρμογών AI στις Ανάγκες σας

### Βήμα 3.1: Τροποποίηση της Διαμόρφωσης AI

1. **Ενημερώστε το μοντέλο OpenAI:**
```bash
# Μεταβείτε σε διαφορετικό μοντέλο (εάν είναι διαθέσιμο στην περιοχή σας)
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

**Καλύτερη Πρακτική**: Διαφορετικές διαμορφώσεις για ανάπτυξη έναντι παραγωγής.

1. **Δημιουργήστε ένα περιβάλλον παραγωγής:**
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
1. Προσδιορίστε ποιες SKUs μπορούν να οριστούν σε δωρεάν/βασικά επίπεδα
2. Διαμορφώστε μεταβλητές περιβάλλοντος για ελάχιστο κόστος
3. Αναπτύξτε και συγκρίνετε τα κόστη με τη διαμόρφωση παραγωγής

**Υποδείξεις λύσεων:**
- Χρησιμοποιήστε το επίπεδο F0 (δωρεάν) για τις Cognitive Services όταν είναι εφικτό
- Χρησιμοποιήστε το επίπεδο Basic για την υπηρεσία Search σε ανάπτυξη
- Εξετάστε τη χρήση του Consumption plan για Functions

## Ενότητα 4: Ασφάλεια και Καλύτερες Πρακτικές για Παραγωγή

### Βήμα 4.1: Ασφαλής Διαχείριση Διαπιστευτηρίων

**Τρέχουσα πρόκληση**: Πολλές εφαρμογές AI ενσωματώνουν API keys ή χρησιμοποιούν μη ασφαλή αποθήκευση.

**Λύση AZD**: Managed Identity + ενσωμάτωση Key Vault.

1. **Επανεξετάστε τη διαμόρφωση ασφάλειας στο πρότυπό σας:**
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

1. **Ενεργοποιήστε ιδιωτικά endpoints** (αν δεν έχουν ήδη διαμορφωθεί):

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

1. **Διαμορφώστε το Application Insights:**
```bash
# Το Application Insights θα πρέπει να διαμορφώνεται αυτόματα
# Ελέγξτε τη διαμόρφωση:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ορίστε παρακολούθηση ειδική για AI:**

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

### **Άσκηση Εργαστηρίου 4.1: Έλεγχος Ασφάλειας**

**Εργασία**: Επανεξετάστε την ανάπτυξή σας για βέλτιστες πρακτικές ασφάλειας.

**Checklist:**
- [ ] Χωρίς hardcoded μυστικά στον κώδικα ή τη διαμόρφωση
- [ ] Χρησιμοποιείται Managed Identity για authentication υπηρεσίας προς υπηρεσία
- [ ] Το Key Vault αποθηκεύει ευαίσθητες διαμορφώσεις
- [ ] Η πρόσβαση δικτύου είναι σωστά περιορισμένη
- [ ] Ενεργοποιημένη παρακολούθηση και καταγραφή

## Ενότητα 5: Μετατροπή της Δικής σας Εφαρμογής AI

### Βήμα 5.1: Φύλλο Αξιολόγησης

**Πριν μετατρέψετε την εφαρμογή σας**, απαντήστε στις εξής ερωτήσεις:

1. **Αρχιτεκτονική Εφαρμογής:**
   - Ποιες υπηρεσίες AI χρησιμοποιεί η εφαρμογή σας;
   - Ποιους πόρους υπολογισμού χρειάζεται;
   - Απαιτεί βάση δεδομένων;
   - Ποιες είναι οι εξαρτήσεις μεταξύ των υπηρεσιών;

2. **Απαιτήσεις Ασφάλειας:**
   - Ποια ευαίσθητα δεδομένα διαχειρίζεται η εφαρμογή σας;
   - Ποιες απαιτήσεις συμμόρφωσης έχετε;
   - Χρειάζεστε ιδιωτικό δίκτυο;

3. **Απαιτήσεις Κλιμάκωσης:**
   - Ποιο είναι το αναμενόμενο φόρτο εργασίας;
   - Χρειάζεστε αυτόματη κλιμάκωση;
   - Υπάρχουν απαιτήσεις ανά περιοχή;

### Βήμα 5.2: Δημιουργήστε το Πρότυπο AZD σας

**Ακολουθήστε αυτό το πρότυπο για να μετατρέψετε την εφαρμογή σας:**

1. **Δημιουργήστε τη βασική δομή:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Αρχικοποιήστε το πρότυπο AZD
azd init --template minimal
```

2. **Δημιουργήστε azure.yaml:**
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

**Πρόκληση**: Δημιουργήστε ένα πρότυπο AZD για εφαρμογή επεξεργασίας εγγράφων AI.

**Απαιτήσεις:**
- Microsoft Foundry Models για ανάλυση περιεχομένου
- Document Intelligence για OCR
- Storage Account για ανέβασμα εγγράφων
- Function App για λογική επεξεργασίας
- Web app για διεπαφή χρήστη

**Μπόνους πόντοι:**
- Προσθέστε σωστό χειρισμό σφαλμάτων
- Συμπεριλάβετε εκτίμηση κόστους
- Ρυθμίστε πίνακες ελέγχου παρακολούθησης

## Ενότητα 6: Αντιμετώπιση Συνηθισμένων Προβλημάτων

### Συνηθισμένα Προβλήματα Ανάπτυξης

#### Πρόβλημα 1: Υπέρβαση Ορίου Πόρων Υπηρεσίας OpenAI
**Συμπτώματα:** Η ανάπτυξη αποτυγχάνει με σφάλμα ορίου
**Λύσεις:**
```bash
# Ελέγξτε τα τρέχοντα όρια
az cognitiveservices usage list --location eastus

# Ζητήστε αύξηση των ορίων ή δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up
```

#### Πρόβλημα 2: Το Μοντέλο δεν είναι Διαθέσιμο στην Περιοχή
**Συμπτώματα:** Οι απαντήσεις AI αποτυγχάνουν ή εμφανίζονται σφάλματα ανάπτυξης μοντέλου
**Λύσεις:**
```bash
# Ελέγξτε τη διαθεσιμότητα του μοντέλου ανά περιοχή
az cognitiveservices model list --location eastus

# Μεταβείτε σε διαθέσιμο μοντέλο
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Πρόβλημα 3: Θέματα Δικαιωμάτων
**Συμπτώματα:** Σφάλματα 403 Forbidden κατά την κλήση υπηρεσιών AI
**Λύσεις:**
```bash
# Ελέγξτε τις αναθέσεις ρόλων
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Προσθέστε τους ρόλους που λείπουν
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Προβλήματα Απόδοσης

#### Πρόβλημα 4: Αργές Απαντήσεις AI
**Βήματα διερεύνησης:**
1. Ελέγξτε το Application Insights για μετρικές απόδοσης
2. Επανεξετάστε τις μετρικές της υπηρεσίας OpenAI στο Azure portal
3. Επαληθεύστε τη συνδεσιμότητα δικτύου και την καθυστέρηση

**Λύσεις:**
- Υλοποιήστε caching για κοινά ερωτήματα
- Χρησιμοποιήστε το κατάλληλο μοντέλο OpenAI για τη χρήση σας
- Σκεφτείτε τη χρήση read replicas για σενάρια υψηλού φόρτου

### **Άσκηση Εργαστηρίου 6.1: Πρόκληση Εντοπισμού Σφαλμάτων**

**Σενάριο**: Η ανάπτυξή σας ήταν επιτυχής, αλλά η εφαρμογή επιστρέφει σφάλματα 500.

**Εργασίες εντοπισμού σφαλμάτων:**
1. Ελέγξτε τα logs της εφαρμογής
2. Επαληθεύστε τη συνδεσιμότητα υπηρεσιών
3. Δοκιμάστε τον μηχανισμό authentication
4. Επανεξετάστε τη διαμόρφωση

**Εργαλεία προς χρήση:**
- `azd show` για επισκόπηση ανάπτυξης
- Azure portal για αναλυτικά logs υπηρεσιών
- Application Insights για τηλεμετρία εφαρμογής

## Ενότητα 7: Παρακολούθηση και Βελτιστοποίηση

### Βήμα 7.1: Ρύθμιση Ολοκληρωμένης Παρακολούθησης

1. **Δημιουργήστε προσαρμοσμένα dashboards:**

Πλοηγηθείτε στο Azure portal και δημιουργήστε ένα dashboard με:
- Πλήθος αιτημάτων και καθυστέρηση OpenAI
- Ποσοστά σφαλμάτων εφαρμογής
- Χρήση πόρων
- Παρακολούθηση κόστους

2. **Ορίστε ειδοποιήσεις:**
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
- Υλοποιήστε caching αιτημάτων
- Παρακολουθήστε τη χρήση token για OpenAI

### **Άσκηση Εργαστηρίου 7.1: Βελτιστοποίηση Απόδοσης**

**Εργασία**: Βελτιστοποιήστε την εφαρμογή AI σας για απόδοση και κόστος.

**Μετρικές προς βελτίωση:**
- Μείωση του μέσου χρόνου απόκρισης κατά 20%
- Μείωση μηνιαίων κόστους κατά 15%
- Διατήρηση 99.9% uptime

**Στρατηγικές προς δοκιμή:**
- Υλοποιήστε caching απαντήσεων
- Βελτιστοποιήστε τα prompts για αποδοτικότητα tokens
- Χρησιμοποιήστε κατάλληλα compute SKUs
- Ρυθμίστε σωστή αυτόματη κλιμάκωση

## Τελική Πρόκληση: Ενσωμάτωση από άκρη σε άκρη

### Σενάριο Πρόκλησης

Σας ανατίθεται η δημιουργία ενός παραγωγικού chatbot εξυπηρέτησης πελατών με τεχνητή νοημοσύνη με τις εξής απαιτήσεις:

**Λειτουργικές Απαιτήσεις:**
- Web διεπαφή για αλληλεπίδραση με πελάτες
- Ενσωμάτωση με Microsoft Foundry Models για απαντήσεις
- Δυνατότητα αναζήτησης εγγράφων με Cognitive Search
- Ενσωμάτωση με υπάρχουσα βάση δεδομένων πελατών
- Υποστήριξη πολλαπλών γλωσσών

**Μη Λειτουργικές Απαιτήσεις:**
- Διαχείριση 1000 ταυτόχρονων χρηστών
- SLA 99.9% uptime
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

- ✅ **Λειτουργικότητα**: Καλύπτονται όλες οι απαιτήσεις;
- ✅ **Ασφάλεια**: Εφαρμόζονται οι βέλτιστες πρακτικές;
- ✅ **Κλιμάκωση**: Μπορεί να διαχειριστεί το φόρτο;
- ✅ **Διατηρησιμότητα**: Είναι ο κώδικας και η υποδομή καλά οργανωμένα;
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

### Κοινοτικές Πηγές
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Πιστοποιητικό Ολοκλήρωσης

Συγχαρητήρια! Έχετε ολοκληρώσει το Εργαστήριο AI. Τώρα θα πρέπει να μπορείτε να:
- ✅ Μετατρέψτε υπάρχουσες εφαρμογές AI σε πρότυπα AZD
- ✅ Αναπτύξτε εφαρμογές AI έτοιμες για παραγωγή
- ✅ Εφαρμόστε βέλτιστες πρακτικές ασφάλειας για το φόρτο εργασίας AI
- ✅ Παρακολουθήστε και βελτιστοποιήστε την απόδοση των εφαρμογών AI
- ✅ Επιλύστε κοινά προβλήματα ανάπτυξης

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα πρότυπα στα δικά σας έργα AI
2. Συνεισφέρετε πρότυπα στην κοινότητα
3. Εγγραφείτε στο Discord του Microsoft Foundry για συνεχή υποστήριξη
4. Εξερευνήστε προχωρημένα θέματα όπως αναπτύξεις σε πολλαπλές περιοχές

---

**Σχόλια Εργαστηρίου**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [κανάλι #Azure του Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη προσανατολισμένη στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές για Παραγωγικό AI](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Ελάτε στην κοινότητά μας για υποστήριξη και συζητήσεις σχετικά με το AZD και τις αναπτύξεις AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης με τεχνητή νοημοσύνη Co‑op Translator (https://github.com/Azure/co-op-translator). Παρότι καταβάλλουμε προσπάθειες για ακρίβεια, λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συστήνεται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->