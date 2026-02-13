# Εργαστήριο AI: Κάντε τις λύσεις AI σας αναπτύξιμες με AZD

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-First Development
- **⬅️ Προηγούμενο**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Επόμενο**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το πρακτικό εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και στην ανάπτυξή του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά μοτίβα για ανάπτυξη παραγωγής AI χρησιμοποιώντας τις υπηρεσίες της Microsoft Foundry.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Ενδιάμεσο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Στο τέλος αυτού του εργαστηρίου, θα μπορείτε να:
- ✅ Μετατρέψετε μια υπάρχουσα εφαρμογή AI ώστε να χρησιμοποιεί πρότυπα AZD
- ✅ Διαμορφώσετε υπηρεσίες Microsoft Foundry με AZD
- ✅ Υλοποιήσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Αναπτύξετε εφαρμογές AI έτοιμες για παραγωγή με παρακολούθηση
- ✅ Εντοπίσετε και επιλύσετε κοινά προβλήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαραίτητα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται VS Code)

### Πόροι Azure
- Συνδρομή Azure με πρόσβαση Contributor
- Πρόσβαση στις υπηρεσίες Azure OpenAI (ή δυνατότητα να ζητήσετε πρόσβαση)
- Δικαιώματα δημιουργίας ομάδας πόρων

### Απαιτούμενες Γνώσεις
- Βασική κατανόηση υπηρεσιών Azure
- Εξοικείωση με γραμμή εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, prompts)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επαληθεύστε τις εγκαταστάσεις εργαλείων:**
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

## Μονάδα 1: Κατανόηση της Δομής AZD για Εφαρμογές AI

### Ανατομία ενός προτύπου AZD για AI

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

### **Άσκηση Εργαστηρίου 1.1: Εξερευνήστε τη Διαμόρφωση**

1. **Εξετάστε το αρχείο azure.yaml:**
```bash
cat azure.yaml
```

**Τι να αναζητήσετε:**
- Ορισμοί υπηρεσιών για συστατικά AI
- Χαρτογραφήσεις μεταβλητών περιβάλλοντος
- Ρυθμίσεις host

2. **Αναθεωρήστε την υποδομή main.bicep:**
```bash
cat infra/main.bicep
```

**Κύρια μοτίβα AI για αναγνώριση:**
- Προμήθεια υπηρεσίας Azure OpenAI
- Ενσωμάτωση Cognitive Search
- Ασφαλής διαχείριση κλειδιών
- Διαμορφώσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί έχουν σημασία αυτά τα μοτίβα για το AI

- **Εξαρτήσεις Υπηρεσιών**: Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια**: Τα API keys και τα endpoints χρειάζονται ασφαλή διαχείριση
- **Κλιμάκωση**: Τα φορτία AI έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση Κόστους**: Οι υπηρεσίες AI μπορεί να είναι δαπανηρές αν δεν ρυθμιστούν σωστά

## Μονάδα 2: Αναπτύξτε την Πρώτη σας Εφαρμογή AI

### Βήμα 2.1: Αρχικοποίηση Περιβάλλοντος

1. **Δημιουργήστε ένα νέο περιβάλλον AZD:**
```bash
azd env new myai-workshop
```

2. **Ορίστε τις απαιτούμενες παραμέτρους:**
```bash
# Ορίστε την προτιμώμενη περιοχή Azure
azd env set AZURE_LOCATION eastus

# Προαιρετικό: Ορίστε συγκεκριμένο μοντέλο OpenAI
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Βήμα 2.2: Αναπτύξτε την Υποδομή και την Εφαρμογή

1. **Αναπτύξτε με AZD:**
```bash
azd up
```

**Τι συμβαίνει κατά το `azd up`:**
- ✅ Προετοιμάζει την υπηρεσία Azure OpenAI
- ✅ Δημιουργεί την υπηρεσία Cognitive Search
- ✅ Ρυθμίζει το App Service για την web εφαρμογή
- ✅ Διαμορφώνει δικτύωση και ασφάλεια
- ✅ Αναπτύσσει τον κώδικα της εφαρμογής
- ✅ Ρυθμίζει παρακολούθηση και καταγραφές

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
   - Μεταβείτε στην web εφαρμογή
   - Δοκιμάστε δείγματα ερωτήματα
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Πρακτική Επίλυσης Προβλημάτων**

**Σενάριο**: Η ανάπτυξη ολοκληρώθηκε με επιτυχία αλλά το AI δεν ανταποκρίνεται.

**Συνήθη προβλήματα για έλεγχο:**
1. **Κλειδιά OpenAI API**: Επαληθεύστε ότι έχουν οριστεί σωστά
2. **Διαθεσιμότητα μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Δικτυακή συνδεσιμότητα**: Βεβαιωθείτε ότι οι υπηρεσίες μπορούν να επικοινωνήσουν
4. **Δικαιώματα RBAC**: Επαληθεύστε ότι η εφαρμογή μπορεί να προσπελάσει το OpenAI

**Εντολές αποσφαλμάτωσης:**
```bash
# Ελέγξτε τις μεταβλητές περιβάλλοντος
azd env get-values

# Δείτε τα αρχεία καταγραφής ανάπτυξης
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Ελέγξτε την κατάσταση ανάπτυξης του OpenAI
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Μονάδα 3: Προσαρμογή των Εφαρμογών AI στις Ανάγκες σας

### Βήμα 3.1: Τροποποιήστε τη Διαμόρφωση AI

1. **Ενημερώστε το μοντέλο OpenAI:**
```bash
# Αλλάξτε σε διαφορετικό μοντέλο (αν είναι διαθέσιμο στην περιοχή σας)
azd env set AZURE_OPENAI_MODEL gpt-4

# Αναπτύξτε ξανά με τη νέα διαμόρφωση
azd deploy
```

2. **Προσθέστε επιπλέον υπηρεσίες AI:**

Edit `infra/main.bicep` to add Document Intelligence:

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
# Η παραγωγή συνήθως χρησιμοποιεί υψηλότερα SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ενεργοποιήστε επιπλέον δυνατότητες ασφαλείας
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Άσκηση Εργαστηρίου 3.1: Βελτιστοποίηση Κόστους**

**Πρόκληση**: Διαμορφώστε το πρότυπο για οικονομική ανάπτυξη.

**Εργασίες:**
1. Αναγνωρίστε ποια SKUs μπορούν να οριστούν σε free/basic επίπεδα
2. Διαμορφώστε μεταβλητές περιβάλλοντος για ελάχιστο κόστος
3. Αναπτύξτε και συγκρίνετε τα κόστη με τη διαμόρφωση παραγωγής

**Υπόδειξεις λύσης:**
- Χρησιμοποιήστε το επίπεδο F0 (δωρεάν) για Cognitive Services όταν είναι δυνατό
- Χρησιμοποιήστε Basic tier για το Search Service στην ανάπτυξη
- Σκεφτείτε τη χρήση Consumption plan για Functions

## Μονάδα 4: Ασφάλεια και Βέλτιστες Πρακτικές Παραγωγής

### Βήμα 4.1: Ασφαλής Διαχείριση Διαπιστευτηρίων

**Τρέχουσα πρόκληση**: Πολλές εφαρμογές AI ενσωματώνουν σκληρά κωδικοποιημένα API keys ή χρησιμοποιούν μη ασφαλή αποθήκευση.

**Λύση AZD**: Managed Identity + ενσωμάτωση Key Vault.

1. **Αναθεωρήστε τη ρύθμιση ασφάλειας στο πρότυπό σας:**
```bash
# Αναζητήστε τη διαμόρφωση του Key Vault και της Διαχειριζόμενης Ταυτότητας
grep -r "keyVault\|managedIdentity" infra/
```

2. **Επαληθεύστε ότι η Managed Identity λειτουργεί:**
```bash
# Ελέγξτε αν η εφαρμογή ιστού έχει τη σωστή διαμόρφωση ταυτότητας
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Βήμα 4.2: Ασφάλεια Δικτύου

1. **Ενεργοποιήστε private endpoints** (εάν δεν έχουν ήδη διαμορφωθεί):

Add to your bicep template:
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

2. **Ρυθμίστε παρακολούθηση ειδική για AI:**

Προσθέστε προσαρμοσμένες μετρικές για λειτουργίες AI:
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

**Εργασία**: Αναθεωρήστε την ανάπτυξή σας για βέλτιστες πρακτικές ασφάλειας.

**Checklist:**
- [ ] Να μην υπάρχουν σκληρά κωδικοποιημένα μυστικά σε κώδικα ή διαμόρφωση
- [ ] Χρησιμοποιείται Managed Identity για αυθεντικοποίηση υπηρεσίας προς υπηρεσία
- [ ] Το Key Vault αποθηκεύει ευαίσθητες ρυθμίσεις
- [ ] Η πρόσβαση δικτύου είναι σωστά περιορισμένη
- [ ] Η παρακολούθηση και η καταγραφή είναι ενεργοποιημένες

## Μονάδα 5: Μετατροπή της Δικής σας Εφαρμογής AI

### Βήμα 5.1: Φύλλο Αξιολόγησης

**Πριν μετατρέψετε την εφαρμογή σας**, απαντήστε σε αυτές τις ερωτήσεις:

1. **Αρχιτεκτονική Εφαρμογής:**
   - Ποιες υπηρεσίες AI χρησιμοποιεί η εφαρμογή σας;
   - Τι πόρους υπολογιστικής ισχύος χρειάζεται;
   - Χρειάζεται βάση δεδομένων;
   - Ποιες είναι οι εξαρτήσεις μεταξύ των υπηρεσιών;

2. **Απαιτήσεις Ασφαλείας:**
   - Ποια ευαίσθητα δεδομένα χειρίζεται η εφαρμογή σας;
   - Ποιες απαιτήσεις συμμόρφωσης έχετε;
   - Χρειάζεστε ιδιωτικό δίκτυο;

3. **Απαιτήσεις Κλιμάκωσης:**
   - Ποιο είναι το αναμενόμενο φορτίο;
   - Χρειάζεστε αυτόματη κλιμάκωση;
   - Υπάρχουν απαιτήσεις ανά περιοχή;

### Βήμα 5.2: Δημιουργήστε το Πρότυπο AZD σας

**Ακολουθήστε αυτό το μοτίβο για να μετατρέψετε την εφαρμογή σας:**

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

**infra/main.bicep** - Βασικό πρότυπο:
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

**infra/modules/openai.bicep** - module OpenAI:
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
- Storage Account για ανεβάσματα εγγράφων
- Function App για τη λογική επεξεργασίας
- Web app για το user interface

**Μπόνους:**
- Προσθέστε σωστή διαχείριση σφαλμάτων
- Περιλάβετε εκτίμηση κόστους
- Ρυθμίστε dashboards παρακολούθησης

## Μονάδα 6: Επίλυση Συνήθων Προβλημάτων

### Συνήθη Προβλήματα Ανάπτυξης

#### Πρόβλημα 1: Υπέρβαση Ποσόστωσης Υπηρεσίας OpenAI
**Συμπτώματα:** Η ανάπτυξη αποτυγχάνει με σφάλμα ποσοστώσεων  
**Λύσεις:**
```bash
# Ελέγξτε τα τρέχοντα όρια
az cognitiveservices usage list --location eastus

# Ζητήστε αύξηση ορίων ή δοκιμάστε διαφορετική περιοχή
azd env set AZURE_LOCATION westus2
azd up
```

#### Πρόβλημα 2: Μοντέλο Μη Διαθέσιμο στην Περιοχή
**Συμπτώματα:** Οι απαντήσεις AI αποτυγχάνουν ή υπάρχουν σφάλματα ανάπτυξης μοντέλου  
**Λύσεις:**
```bash
# Ελέγξτε τη διαθεσιμότητα του μοντέλου ανά περιοχή
az cognitiveservices model list --location eastus

# Ενημερώστε σε διαθέσιμο μοντέλο
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Πρόβλημα 3: Θέματα Δικαιωμάτων
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
1. Ελέγξτε το Application Insights για μετρικές απόδοσης
2. Αναθεωρήστε μετρικές της υπηρεσίας OpenAI στο Azure portal
3. Επαληθεύστε τη δικτυακή συνδεσιμότητα και την καθυστέρηση

**Λύσεις:**
- Υλοποιήστε caching για κοινές ερωτήσεις
- Χρησιμοποιήστε κατάλληλο μοντέλο OpenAI για την περίπτωσή σας
- Σκεφτείτε replica ανάγνωσης για σενάρια υψηλού φορτίου

### **Άσκηση Εργαστηρίου 6.1: Πρόκληση Αποσφαλμάτωσης**

**Σενάριο**: Η ανάπτυξη ολοκληρώθηκε επιτυχώς, αλλά η εφαρμογή επιστρέφει σφάλματα 500.

**Εργασίες αποσφαλμάτωσης:**
1. Ελέγξτε τα logs της εφαρμογής
2. Επαληθεύστε τη συνδεσιμότητα υπηρεσιών
3. Δοκιμάστε την αυθεντικοποίηση
4. Αναθεωρήστε τη διαμόρφωση

**Εργαλεία προς χρήση:**
- `azd show` για επισκόπηση ανάπτυξης
- Azure portal για λεπτομερή logs υπηρεσιών
- Application Insights για τηλεμετρία εφαρμογής

## Μονάδα 7: Παρακολούθηση και Βελτιστοποίηση

### Βήμα 7.1: Ολοκληρωμένη Παρακολούθηση

1. **Δημιουργήστε προσαρμοσμένους πίνακες ελέγχου:**

Μεταβείτε στο Azure portal και δημιουργήστε έναν πίνακα ελέγχου με:
- Αριθμό αιτήσεων και λανθάνουσα κατάσταση OpenAI
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
- Ρυθμίστε ειδοποιήσεις προϋπολογισμού
- Χρησιμοποιήστε πολιτικές αυτόματης κλιμάκωσης
- Υλοποιήστε caching αιτήσεων
- Παρακολουθήστε χρήση token για OpenAI

### **Άσκηση Εργαστηρίου 7.1: Βελτιστοποίηση Απόδοσης**

**Εργασία**: Βελτιστοποιήστε την εφαρμογή AI σας τόσο για απόδοση όσο και για κόστος.

**Μετρικές προς βελτίωση:**
- Μειώστε τον μέσο χρόνο απόκρισης κατά 20%
- Μειώστε τα μηνιαία κόστη κατά 15%
- Διατηρήστε 99.9% χρόνο λειτουργίας

**Στρατηγικές προς δοκιμή:**
- Υλοποιήστε caching απαντήσεων
- Βελτιστοποιήστε τα prompts για αποδοτικότητα token
- Χρησιμοποιήστε κατάλληλα compute SKUs
- Ρυθμίστε σωστή αυτόματη κλιμάκωση

## Τελική Πρόκληση: Υλοποίηση από Άκρο σε Άκρο

### Σενάριο Πρόκλησης

Σας ανατίθεται η δημιουργία ενός παραγωγικού chatbot εξυπηρέτησης πελατών με ισχύ AI που πληροί αυτές τις απαιτήσεις:

**Λειτουργικές Απαιτήσεις:**
- Web interface για αλληλεπίδραση με πελάτες
- Ενσωμάτωση με Azure OpenAI για απαντήσεις
- Δυνατότητα αναζήτησης εγγράφων με Cognitive Search
- Ενσωμάτωση με υπάρχουσα βάση πελατών
- Υποστήριξη πολλαπλών γλωσσών

**Μη Λειτουργικές Απαιτήσεις:**
- Χειρισμός 1000 ταυτόχρονων χρηστών
- 99.9% SLA χρόνου λειτουργίας
- Συμμόρφωση SOC 2
- Κόστος κάτω από $500/μήνα
- Ανάπτυξη σε πολλαπλά περιβάλλοντα (dev, staging, prod)

### Βήματα Υλοποίησης

1. **Σχεδιάστε την αρχιτεκτονική**
2. **Δημιουργήστε το πρότυπο AZD**
3. **Υλοποιήστε μέτρα ασφάλειας**
4. **Ρυθμίστε παρακολούθηση και ειδοποιήσεις**
5. **Δημιουργήστε pipelines ανάπτυξης**
6. **Τεκμηριώστε τη λύση**

### Κριτήρια Αξιολόγησης

- ✅ **Λειτουργικότητα**: Καλύπτει όλες τις απαιτήσεις;
- ✅ **Ασφάλεια**: Εφαρμόζονται οι βέλτιστες πρακτικές;
- ✅ **Κλιμάκωση**: Μπορεί να χειριστεί τον φόρτο;
- ✅ **Συντηρησιμότητα**: Είναι ο κώδικας και η υποδομή οργανωμένα;
- ✅ **Κόστος**: Παραμένει εντός προϋπολογισμού;

## Επιπλέον Πόροι

### Τεκμηρίωση Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Δείγματα Προτύπων
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Πόροι Κοινότητας
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Πιστοποιητικό Ολοκλήρωσης
Συγχαρητήρια! Έχετε ολοκληρώσει το εργαστήριο AI Workshop. Πλέον θα πρέπει να μπορείτε να:

- ✅ Μετατρέψετε υπάρχουσες εφαρμογές AI σε πρότυπα AZD
- ✅ Αναπτύξετε εφαρμογές AI έτοιμες για παραγωγή
- ✅ Εφαρμόσετε βέλτιστες πρακτικές ασφαλείας για τα φορτία εργασίας AI
- ✅ Παρακολουθήσετε και βελτιστοποιήσετε την απόδοση των εφαρμογών AI
- ✅ Επιλύσετε συνήθη προβλήματα ανάπτυξης

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα πρότυπα στα δικά σας έργα AI
2. Συνεισφέρετε τα πρότυπα στην κοινότητα
3. Εγγραφείτε στο Microsoft Foundry Discord για συνεχή υποστήριξη
4. Εξερευνήστε προηγμένα θέματα όπως αναπτύξεις σε πολλαπλές περιοχές

---

**Ανατροφοδότηση Εργαστηρίου**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [κανάλι Microsoft Foundry Discord #Azure](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές για Παραγωγικό AI](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Γίνετε μέλος της κοινότητάς μας για υποστήριξη και συζητήσεις σχετικά με το AZD και τις αναπτύξεις AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθύνης:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co‑op Translator (https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από επαγγελματία μεταφραστή. Δεν ευθυνόμαστε για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->