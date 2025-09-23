<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:26:29+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "el"
}
-->
# Εργαστήριο AI: Κάνοντας τις Λύσεις AI σας Συμβατές με AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές Παραγωγής AI](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../getting-started/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το πρακτικό εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και ανάπτυξής του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά μοτίβα για αναπτύξεις AI σε περιβάλλον παραγωγής χρησιμοποιώντας τις υπηρεσίες Azure AI Foundry.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Μεσαίο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Μέχρι το τέλος αυτού του εργαστηρίου, θα μπορείτε να:
- ✅ Μετατρέψετε μια υπάρχουσα εφαρμογή AI ώστε να χρησιμοποιεί πρότυπα AZD
- ✅ Ρυθμίσετε τις υπηρεσίες Azure AI Foundry με AZD
- ✅ Εφαρμόσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Αναπτύξετε εφαρμογές AI έτοιμες για παραγωγή με παρακολούθηση
- ✅ Εντοπίσετε και διορθώσετε κοινά προβλήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται το VS Code)

### Πόροι Azure
- Συνδρομή Azure με πρόσβαση συνεισφέροντα
- Πρόσβαση στις υπηρεσίες Azure OpenAI (ή δυνατότητα αίτησης πρόσβασης)
- Δικαιώματα δημιουργίας ομάδων πόρων

### Γνώσεις
- Βασική κατανόηση των υπηρεσιών Azure
- Εξοικείωση με περιβάλλοντα γραμμής εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, προτροπές)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επαληθεύστε τις εγκαταστάσεις εργαλείων:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
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


### **Άσκηση Εργαστηρίου 1.1: Εξερεύνηση της Διαμόρφωσης**

1. **Εξετάστε το αρχείο azure.yaml:**
```bash
cat azure.yaml
```

**Τι να αναζητήσετε:**
- Ορισμοί υπηρεσιών για τα στοιχεία AI
- Αντιστοιχίσεις μεταβλητών περιβάλλοντος
- Ρυθμίσεις φιλοξενίας

2. **Ανασκόπηση του κύριου αρχείου main.bicep:**
```bash
cat infra/main.bicep
```

**Βασικά μοτίβα AI που πρέπει να εντοπίσετε:**
- Παροχή υπηρεσίας Azure OpenAI
- Ενσωμάτωση Cognitive Search
- Ασφαλής διαχείριση κλειδιών
- Ρυθμίσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί Αυτά τα Μοτίβα Είναι Σημαντικά για το AI

- **Εξαρτήσεις Υπηρεσιών**: Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια**: Τα API κλειδιά και τα endpoints χρειάζονται ασφαλή διαχείριση
- **Κλιμάκωση**: Οι φόρτοι AI έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση Κόστους**: Οι υπηρεσίες AI μπορεί να είναι δαπανηρές αν δεν διαμορφωθούν σωστά

## Ενότητα 2: Ανάπτυξη της Πρώτης σας Εφαρμογής AI

### Βήμα 2.1: Αρχικοποίηση Περιβάλλοντος

1. **Δημιουργήστε ένα νέο περιβάλλον AZD:**
```bash
azd env new myai-workshop
```

2. **Ορίστε τις απαιτούμενες παραμέτρους:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
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
   - Μεταβείτε στην εφαρμογή ιστού
   - Δοκιμάστε δείγματα ερωτημάτων
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Πρακτική Εντοπισμού Σφαλμάτων**

**Σενάριο**: Η ανάπτυξη ολοκληρώθηκε, αλλά το AI δεν αποκρίνεται.

**Συνηθισμένα προβλήματα που πρέπει να ελέγξετε:**
1. **Κλειδιά API OpenAI**: Επαληθεύστε ότι έχουν οριστεί σωστά
2. **Διαθεσιμότητα Μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Συνδεσιμότητα Δικτύου**: Βεβαιωθείτε ότι οι υπηρεσίες μπορούν να επικοινωνούν
4. **Δικαιώματα RBAC**: Επαληθεύστε ότι η εφαρμογή μπορεί να έχει πρόσβαση στο OpenAI

**Εντολές αποσφαλμάτωσης:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## Ενότητα 3: Προσαρμογή Εφαρμογών AI στις Ανάγκες σας

### Βήμα 3.1: Τροποποίηση της Διαμόρφωσης AI

1. **Ενημερώστε το μοντέλο OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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


### Βήμα 3.2: Διαμορφώσεις Ειδικές για Περιβάλλοντα

**Βέλτιστη Πρακτική**: Διαφορετικές διαμορφώσεις για ανάπτυξη και παραγωγή.

1. **Δημιουργήστε ένα περιβάλλον παραγωγής:**
```bash
azd env new myai-production
```

2. **Ορίστε παραμέτρους ειδικές για παραγωγή:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Άσκηση Εργαστηρίου 3.1: Βελτιστοποίηση Κόστους**

**Πρόκληση**: Διαμορφώστε το πρότυπο για οικονομική ανάπτυξη.

**Εργασίες:**
1. Εντοπίστε ποια SKUs μπορούν να οριστούν σε δωρεάν/βασικά επίπεδα
2. Διαμορφώστε μεταβλητές περιβάλλοντος για ελάχιστο κόστος
3. Αναπτύξτε και συγκρίνετε το κόστος με τη διαμόρφωση παραγωγής

**Υποδείξεις λύσης:**
- Χρησιμοποιήστε το επίπεδο F0 (δωρεάν) για τις Cognitive Services όπου είναι δυνατόν
- Χρησιμοποιήστε το βασικό επίπεδο για την υπηρεσία αναζήτησης στην ανάπτυξη
- Εξετάστε τη χρήση του Consumption plan για τις Functions

...
Συγχαρητήρια! Ολοκληρώσατε το Εργαστήριο AI. Τώρα θα πρέπει να μπορείτε να:

- ✅ Μετατρέπετε υπάρχουσες εφαρμογές AI σε πρότυπα AZD
- ✅ Αναπτύσσετε εφαρμογές AI έτοιμες για παραγωγή
- ✅ Εφαρμόζετε βέλτιστες πρακτικές ασφαλείας για φόρτους εργασίας AI
- ✅ Παρακολουθείτε και βελτιστοποιείτε την απόδοση των εφαρμογών AI
- ✅ Εντοπίζετε και επιλύετε κοινά προβλήματα ανάπτυξης

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα μοτίβα στα δικά σας έργα AI
2. Συνεισφέρετε πρότυπα πίσω στην κοινότητα
3. Εγγραφείτε στο Discord του Azure AI Foundry για συνεχή υποστήριξη
4. Εξερευνήστε προχωρημένα θέματα όπως οι αναπτύξεις πολλαπλών περιοχών

---

**Ανατροφοδότηση Εργαστηρίου**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [Azure AI Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη με Προτεραιότητα στο AI
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Βέλτιστες Πρακτικές AI για Παραγωγή](production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../getting-started/configuration.md)

**Χρειάζεστε Βοήθεια;** Εγγραφείτε στην κοινότητά μας για υποστήριξη και συζητήσεις σχετικά με το AZD και τις αναπτύξεις AI.

---

