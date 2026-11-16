# Εργαστήριο AI: Κάντε τις λύσεις AI σας αναπτύξιμες με AZD

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - AI-First Ανάπτυξη
- **⬅️ Προηγούμενο**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Επόμενο**: [Production AI Best Practices](../chapter-08-production/production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Διαμόρφωση](../chapter-03-configuration/configuration.md)

## Επισκόπηση Εργαστηρίου

Αυτό το εργαστήριο καθοδηγεί τους προγραμματιστές στη διαδικασία λήψης ενός υπάρχοντος προτύπου AI και την ανάπτυξή του χρησιμοποιώντας το Azure Developer CLI (AZD). Θα μάθετε βασικά πρότυπα για παραγωγικές αναπτύξεις AI χρησιμοποιώντας τις υπηρεσίες Microsoft Foundry.

> **Αναθεώρηση έκδοσης (2026-11-04):** Οδηγίες εντολών AZD και ονόματα παραδειγματικών ρυθμίσεων ελέγχθηκαν με την έκδοση `azd` `1.37.2` και τις τρέχουσες ρυθμίσεις του συνδεδεμένου δείγματος. Αυτή είναι ανασκόπηση τεκμηρίωσης, όχι επικύρωση ζωντανής ανάπτυξης. Το εργαστήριο RAG δεν απαιτεί την επέκταση agent· για αξιολογήσεις agent, χρησιμοποιήστε ξεχωριστή επέκταση `azure.ai.evaluations` και [τρέχουσα ροή αξιολόγησης](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), όχι εντολές αξιολόγησης agent κληρονομιάς.

**Διάρκεια:** 2-3 ώρες  
**Επίπεδο:** Ενδιάμεσο  
**Προαπαιτούμενα:** Βασικές γνώσεις Azure, εξοικείωση με έννοιες AI/ML

## 🎓 Στόχοι Μάθησης

Στο τέλος αυτού του εργαστηρίου, θα μπορείτε να:
- ✅ Εξερευνήσετε ένα υπάρχον AI πρότυπο AZD και να σχεδιάσετε τη μετατροπή της δικής σας εφαρμογής
- ✅ Διαμορφώσετε τις υπηρεσίες Microsoft Foundry με AZD
- ✅ Υλοποιήσετε ασφαλή διαχείριση διαπιστευτηρίων για υπηρεσίες AI
- ✅ Αναπτύξετε μια εφαρμογή αναφοράς AI με παρακολούθηση
- ✅ Αντιμετωπίσετε συνήθη προβλήματα ανάπτυξης AI

## Προαπαιτούμενα

### Απαιτούμενα Εργαλεία
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) εγκατεστημένο
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) εγκατεστημένο
- [Git](https://git-scm.com/) εγκατεστημένο
- Επεξεργαστής κώδικα (συνιστάται VS Code)

Αυτά τα μπλοκ εντολών χρησιμοποιούν σύνταξη Bash (συμπεριλαμβανομένων συνεχειών γραμμών και `grep`). Σε Windows, χρησιμοποιήστε Git Bash/WSL ή μεταφράστε τις σε PowerShell. Επίσης, εγκαταστήστε τα εργαλεία γλώσσας, διαχείρισης πακέτων και κοντέινερ που αναφέρονται στην [τοπική ρύθμιση περιβάλλοντος του δείγματος](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Πόροι Azure
- Συνδρομή Azure με δικαιώματα παροχής πόρων και αντιστοιχίσεων ρόλων (μόνο το Contributor δεν μπορεί να δημιουργήσει αναθέσεις RBAC· χρησιμοποιήστε εξουσιοδοτημένο διαχειριστή ρόλου ή την τεκμηριωμένη ισοδύναμη του δείγματος)
- Πρόσβαση στις υπηρεσίες Microsoft Foundry Models (ή δυνατότητα αιτήματος πρόσβασης)
- Δικαιώματα δημιουργίας ομάδας πόρων

### Προαπαιτούμενες Γνώσεις
- Βασική κατανόηση υπηρεσιών Azure
- Εξοικείωση με διεπαφές γραμμής εντολών
- Βασικές έννοιες AI/ML (APIs, μοντέλα, prompts)

## Ρύθμιση Εργαστηρίου

### Βήμα 1: Προετοιμασία Περιβάλλοντος

1. **Επιβεβαιώστε τις εγκαταστάσεις εργαλείων:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Αν εργάζεστε με πολλαπλούς tenants ή η συνδρομή σας δεν ανιχνεύεται αυτόματα, δοκιμάστε ξανά με `azd auth login --tenant-id <tenant-id>`.

2. **Αντιγράψτε το αποθετήριο εργαστηρίου:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Ενότητα 1: Κατανόηση Δομής AZD για Εφαρμογές AI

### Ανατομία ενός Προτύπου AI AZD

Εξερευνήστε τα βασικά αρχεία ενός έτοιμου προτύπου AI AZD:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Το ελεγχόμενο δείγμα μπορεί να αλλάξει· το `.azure/` εμφανίζεται μετά την αρχικοποίηση περιβάλλοντος, όχι απαραίτητα σε φρέσκο clone. Εξετάστε το πραγματικό checkout αντί να δημιουργείτε χαμένα directories για να ταιριάξετε αυτό το σχήμα.

### **Άσκηση Εργαστηρίου 1.1: Εξερευνήστε τη Διαμόρφωση**

1. **Εξετάστε το αρχείο azure.yaml:**
```bash
cat azure.yaml
```

**Τι να αναζητήσετε:**
- Ορισμοί υπηρεσιών για στοιχεία AI
- Χαρτογραφήσεις μεταβλητών περιβάλλοντος
- Ρυθμίσεις υποδοχής

2. **Επανεξετάστε την βασική υποδομή main.bicep:**
```bash
cat infra/main.bicep
```

**Κύρια πρότυπα AI προς αναγνώριση:**
- Παροχή υπηρεσίας Microsoft Foundry Models
- Ενσωμάτωση Azure AI Search
- Ασφαλής διαχείριση κλειδιών
- Ρυθμίσεις ασφάλειας δικτύου

### **Σημείο Συζήτησης:** Γιατί αυτά τα Πρότυπα έχουν Σημασία για το AI

- **Εξαρτήσεις Υπηρεσιών:** Οι εφαρμογές AI συχνά απαιτούν πολλαπλές συντονισμένες υπηρεσίες
- **Ασφάλεια:** Τα κλειδιά API και τα endpoints χρειάζονται ασφαλή διαχείριση
- **Επεκτασιμότητα:** Τα φορτία AI έχουν μοναδικές απαιτήσεις κλιμάκωσης
- **Διαχείριση Κόστους:** Οι υπηρεσίες AI μπορεί να είναι ακριβές αν δεν διαμορφωθούν σωστά

## Ενότητα 2: Αναπτύξτε την Πρώτη σας Εφαρμογή AI

### Βήμα 2.1: Αρχικοποιήστε το Περιβάλλον

1. **Δημιουργήστε νέο περιβάλλον AZD:**
```bash
azd env new myai-workshop
```

2. **Ορίστε τις απαιτούμενες παραμέτρους:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Βήμα 2.2: Αναπτύξτε την Υποδομή και την Εφαρμογή

1. **Αναπτύξτε με AZD:**
```bash
azd up
```

**Τι συμβαίνει κατά το `azd up`:**
- ✅ Παρέχει υπηρεσία Microsoft Foundry Models
- ✅ Δημιουργεί υπηρεσία Azure AI Search
- ✅ Ρυθμίζει Azure Container Apps για το backend και το ενσωματωμένο frontend (το τρέχον δείγμα προεπιλογής)
- ✅ Διαμορφώνει δίκτυο και ασφάλεια
- ✅ Αναπτύσσει κώδικα εφαρμογής
- ✅ Εγκαθιστά παρακολούθηση και καταγραφή

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

Ανοίξτε το web endpoint που εμφανίζεται στην έξοδο `azd show`.

3. **Δοκιμάστε τη λειτουργικότητα AI:**
   - Πλοηγηθείτε στην web εφαρμογή
   - Δοκιμάστε παραδείγματα ερωτημάτων
   - Επαληθεύστε ότι οι απαντήσεις AI λειτουργούν

### **Άσκηση Εργαστηρίου 2.1: Πρακτική Αντιμετώπισης Προβλημάτων**

**Σενάριο**: Η ανάπτυξή σας πέτυχε αλλά το AI δεν ανταποκρίνεται.

**Συνήθη προβλήματα που πρέπει να ελέγξετε:**
1. **Πιστοποίηση**: Επιβεβαιώστε τη διαχειριζόμενη ταυτότητα και τις εκχωρήσεις ρόλων· ελέγξτε μόνο κλειδιά API αν ενεργοποιήσατε σκόπιμα την πιστοποίηση με κλειδί
2. **Διαθεσιμότητα μοντέλου**: Ελέγξτε αν η περιοχή σας υποστηρίζει το μοντέλο
3. **Συνδεσιμότητα δικτύου**: Βεβαιωθείτε ότι οι υπηρεσίες μπορούν να επικοινωνούν
4. **Δικαιώματα RBAC**: Επιβεβαιώστε ότι η εφαρμογή έχει πρόσβαση στο OpenAI

**Εντολές αποσφαλμάτωσης:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Ενότητα 3: Προσαρμογή Εφαρμογών AI στις Ανάγκες σας

### Βήμα 3.1: Τροποποίηση της Διαμόρφωσης AI

1. **Ενημερώστε το μοντέλο OpenAI:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Προσθέστε επιπλέον υπηρεσίες AI:**

Επεξεργαστείτε το `infra/main.bicep` για να προσθέσετε Document Intelligence:

Το ακόλουθο είναι ένα ενδεικτικό απόσπασμα, όχι πλήρες πρότυπο. Το δείγμα μπορεί ήδη να παρέχει υπηρεσίες επεξεργασίας εγγράφων: ελέγξτε την τρέχουσα υποδομή πριν προσθέσετε διπλούς πόρους. Οι προσαρμογές απαιτούν καλωδιώσεις εξόδων, ταυτοτήτων και διαμόρφωσης εφαρμογής.

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

**Καλύτερη Πρακτική**: Διάφορες διαμορφώσεις για ανάπτυξη και παραγωγή.

1. **Δημιουργήστε περιβάλλον παραγωγής:**
```bash
azd env new myai-production
```

2. **Ορίστε παραμέτρους ειδικές για παραγωγή:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Αυτά τα ονόματα προέρχονται από το [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json) του δείγματος. Το `azd env set` αποθηκεύει μια τιμή, αλλά δεν κάνει κάποιο αυθαίρετο μεταβλητό αποτελεσματικό: το πρότυπο πρέπει να το καταναλώνει. Επανεξετάστε τον [οδηγό απομόνωσης δικτύου](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) πριν απενεργοποιήσετε την δημόσια πρόσβαση, και χρησιμοποιήστε το `azd up` για να εφαρμόσετε αλλαγές υποδομής. Το SKU OpenAI `S0` μόνο δεν καθορίζει τη διαπερατότητα μοντέλου· μετρά και ο τύπος και η χωρητικότητα της ανάπτυξης μοντέλου.

### **Άσκηση Εργαστηρίου 3.1: Βελτιστοποίηση Κόστους**

**Πρόκληση**: Διαμορφώστε το πρότυπο για αποδοτική ανάπτυξη ως προς το κόστος.

**Εργασίες:**
1. Επιλέξτε το περιβάλλον εργαστηρίου που μπορεί να απορριφθεί: `azd env select myai-workshop`.
2. Καταγράψτε το τρέχον Search SKU και τη χωρητικότητα μοντέλου από `infra/main.parameters.json` και το επιλεγμένο περιβάλλον.
3. Χρησιμοποιήστε τις υποστηριζόμενες εισόδους παρακάτω, αφού επιβεβαιώσετε την ποσόστωση μοντέλου/περιοχής:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Επαληθεύστε το Search SKU και τη χωρητικότητα ανάπτυξης στο portal και εκτιμήστε τη διαφορά με το εργαλείο υπολογισμού τιμών. Μην αναμένετε άμεση ενημέρωση των δεδομένων τιμολόγησης.

**Κριτήρια επιτυχίας:** Το Search χρησιμοποιεί Basic, η ανάπτυξη chat έχει την αιτούμενη υποστηριζόμενη χωρητικότητα, και η εφαρμογή εξακολουθεί να απαντά σε παράδειγμα ερώτησης. Η χωρητικότητα `10` είναι κατανομή ορίου ρυθμού, όχι έκπτωση τιμής ανά token. Οι αλλαγές επιπέδου Search μπορούν να περιοριστούν ή να απαιτούν επανεγκατάσταση· μην πειραματίζεστε σε παραγωγικούς πόρους. Το F0 είναι συγκεκριμένο υπηρεσίας και δεν είναι SKU μοντέλου Azure OpenAI.

## Ενότητα 4: Ασφάλεια και Καλύτερες Πρακτικές Παραγωγής

### Βήμα 4.1: Ασφαλής Διαχείριση Διαπιστευτηρίων

**Τρέχουσα πρόκληση**: Πολλές εφαρμογές AI ενσωματώνουν σκληρώς κωδικοποιημένα κλειδιά API ή χρησιμοποιούν μη ασφαλή αποθήκευση.

**Λύση AZD**: Συνδυασμός Managed Identity + ενσωμάτωση Key Vault.

1. **Επανεξετάστε τη ρύθμιση ασφαλείας στο πρότυπό σας:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Επιβεβαιώστε ότι η Managed Identity λειτουργεί:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Βήμα 4.2: Ασφάλεια Δικτύου

1. **Ενεργοποιήστε private endpoints** χρησιμοποιώντας την υποστηριζόμενη ρύθμιση δικτύου του δείγματος (αν δεν έχει ήδη ρυθμιστεί).

Για το δικό σας πρότυπο, το ενδεικτικό αυτό απόσπασμα δείχνει τη σύνδεση endpoint OpenAI. Χρειάζεται επίσης VNet, ιδιωτική διαμόρφωση DNS και συνδεσιμότητα εφαρμογής· μην το αντιγράψετε αυτούσιο στο δείγμα που ήδη διαθέτει modules private-endpoint:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Ενεργοποιήστε την ενσωμάτωση Application Insights του δείγματος:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Η μέτρηση του δείγματος εκπέμπει τηλεμετρία· μια αυθαίρετη ρύθμιση `OPENAI_MONITOR_ENABLED` δεν ενεργοποιεί μετρήσεις AI. Επανεξετάστε traces για κλήσεις μοντέλου, καθυστερήσεις, αποτυχίες και χρήση tokens, και αποφύγετε την καταγραφή ευαίσθητων prompts ή απαντήσεων.

### **Άσκηση Εργαστηρίου 4.1: Έλεγχος Ασφαλείας**

**Εργασία**: Επανεξετάστε την ανάπτυξή σας για καλύτερες πρακτικές ασφαλείας.

**Λίστα ελέγχου:**
- [ ] Κανένα σκληροκωδικοποιημένο μυστικό στον κώδικα ή τη διαμόρφωση
- [ ] Χρήση Managed Identity για πιστοποίηση υπηρεσίας-προς-υπηρεσία
- [ ] Το Key Vault αποθηκεύει ευαίσθητη διαμόρφωση
- [ ] Η πρόσβαση δικτύου περιορίζεται σωστά
- [ ] Ενεργοποιημένη παρακολούθηση και καταγραφή

## Ενότητα 5: Μετατροπή της Δικής σας Εφαρμογής AI

### Βήμα 5.1: Φύλλο Αξιολόγησης

**Πριν μετατρέψετε την εφαρμογή σας**, απαντήστε αυτές τις ερωτήσεις:

1. **Αρχιτεκτονική Εφαρμογής:**
   - Ποιες υπηρεσίες AI χρησιμοποιεί η εφαρμογή σας;
   - Τι πόρους υπολογισμού χρειάζεται;
   - Χρειάζεται βάση δεδομένων;
   - Ποιες είναι οι εξαρτήσεις μεταξύ των υπηρεσιών;

2. **Απαιτήσεις Ασφαλείας:**
   - Τι ευαίσθητα δεδομένα διαχειρίζεται η εφαρμογή σας;
   - Ποιες απαιτήσεις συμμόρφωσης έχετε;
   - Χρειάζεστε ιδιωτικό δίκτυο;

3. **Απαιτήσεις Κλιμάκωσης:**
   - Ποιο είναι το αναμενόμενο φορτίο σας;
   - Χρειάζεστε αυτόματη κλιμάκωση;
   - Υπάρχουν περιφερειακές απαιτήσεις;

### Βήμα 5.2: Δημιουργήστε το Πρότυπο AZD

**Ακολουθήστε αυτό το πρότυπο για τη μετατροπή της εφαρμογής σας:**

**Μόνο σκελετός:** Αυτή η ενότητα δεν παρέχει πηγαίο κώδικα API/web εφαρμογής, υποδομή υποδοχής, αναπτύξεις μοντέλων, ταυτότητα/RBAC ή ολοκληρωμένο `main.parameters.json`. Το Bicep πεδίου πόρων απεικονίζει σύνθεση modules· ένα τυπικό σημείο εισόδου AZD πεδίου συνδρομής πρέπει να δημιουργεί ομάδα πόρων και να το καλεί σε αυτό το πεδίο. Μην περιμένετε το `azd up` να αναπτύξει πλήρη εφαρμογή αντιγράφοντας μόνο αυτά τα αποσπάσματα. Για βασική λειτουργία, συνεχίστε να χρησιμοποιείτε το RAG πρότυπο από την Ενότητα 1.

1. **Δημιουργήστε τη βασική δομή:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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

**infra/modules/openai.bicep** - Module OpenAI:
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Άσκηση Εργαστηρίου 5.1: Πρόκληση Δημιουργίας Προτύπου**

**Πρόκληση:** Δημιουργήστε ένα πρότυπο AZD για εφαρμογή AI επεξεργασίας εγγράφων.

**Απαιτήσεις:**
- Microsoft Foundry Models για ανάλυση περιεχομένου
- Document Intelligence για OCR
- Storage Account για ανέβασμα εγγράφων
- Function App για λογική επεξεργασίας
- Web app για διεπαφή χρήστη

**Μπόνους πόντοι:**
- Προσθέστε σωστή διαχείριση σφαλμάτων
- Συμπεριλάβετε εκτίμηση κόστους
- Δημιουργήστε dashboards παρακολούθησης

## Ενότητα 6: Αντιμετώπιση Συνηθισμένων Προβλημάτων

### Συνήθη Προβλήματα Ανάπτυξης

#### Ζήτημα 1: Υπέρβαση Ορίου Υπηρεσίας OpenAI
**Συμπτώματα:** Η ανάπτυξη αποτυγχάνει με σφάλμα ορίου
**Λύσεις:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Ζήτημα 2: Μοντέλο μη διαθεσιμό στο Περιφερειακό Κέντρο
**Συμπτώματα:** Αποτυχίες απαντήσεων AI ή σφάλματα ανάπτυξης μοντέλου
**Λύσεις:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Ζήτημα 3: Προβλήματα Δικαιωμάτων
**Συμπτώματα:** Σφάλματα 403 Forbidden κατά την κλήση υπηρεσιών AI
**Λύσεις:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Προβλήματα Απόδοσης

#### Ζήτημα 4: Αργές Απαντήσεις AI
**Βήματα διερεύνησης:**
1. Ελέγξτε το Application Insights για μετρικές απόδοσης
2. Επανεξετάστε μετρικές υπηρεσίας OpenAI στο portal Azure
3. Επιβεβαιώστε τη συνδεσιμότητα και καθυστέρηση δικτύου

**Λύσεις:**
- Υλοποιήστε caching για κοινά ερωτήματα
- Χρησιμοποιήστε κατάλληλο μοντέλο OpenAI για την περίπτωση χρήσης σας
- Κλιμακώστε αντίγραφα εφαρμογής μόνο αφού ελέγξετε τα όρια RPM/TPM του μοντέλου· οι αναπτύξεις Azure OpenAI δεν αποκαλύπτουν γενική ρύθμιση "read replica" βάσης δεδομένων

### **Άσκηση Εργαστηρίου 6.1: Πρόκληση Αποσφαλμάτωσης**

**Σενάριο:** Η ανάπτυξή σας πέτυχε, αλλά η εφαρμογή επιστρέφει σφάλματα 500.

**Εργασίες αποσφαλμάτωσης:**
1. Ελέγξτε τα logs της εφαρμογής
2. Επιβεβαιώστε τη συνδεσιμότητα υπηρεσίας
3. Δοκιμή αυθεντικοποίησης
4. Ανασκόπηση ρύθμισης

**Εργαλεία προς χρήση:**
- `azd show` για επισκόπηση ανάπτυξης
- Πύλη Azure για λεπτομερή αρχεία υπηρεσίας
- Application Insights για τηλεμετρία εφαρμογής

## Ενότητα 7: Παρακολούθηση και Βελτιστοποίηση

### Βήμα 7.1: Ρύθμιση Ολοκληρωμένης Παρακολούθησης

1. **Δημιουργία προσαρμοσμένων ταμπλό:**

Μεταβείτε στην πύλη Azure και δημιουργήστε ένα ταμπλό με:
- Αριθμό αιτημάτων και καθυστέρηση OpenAI
- Ποσοστά σφαλμάτων εφαρμογής
- Χρήση πόρων
- Παρακολούθηση κόστους

2. **Ρύθμιση ειδοποιήσεων:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Επαληθεύστε ότι το συστατικό εκπέμπει τηλεμετρία αιτημάτων και προσθέστε ομάδα ενεργειών αν απαιτούνται ειδοποιήσεις. Το μέτρο είναι αριθμός, όχι ποσοστό αποτυχίας· μια ειδοποίηση ρυθμού χρειάζεται κατάλληλο ερώτημα και παρονομαστή.

### Βήμα 7.2: Βελτιστοποίηση Κόστους

1. **Ανάλυση τρεχόντων κόστους:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Αντικαταστήστε τους δείκτες ημερομηνιών. Η υποστήριξη API κατανάλωσης διαφέρει ανάλογα με τη συμφωνία χρέωσης· χρησιμοποιήστε το Cost Management στην πύλη αν δεν υπάρχουν λεπτομέρειες χρήσης. Τα κόστη καθυστερούν, δεν είναι ένας πραγματικός ακριβής έλεγχος σε πραγματικό χρόνο.

2. **Εφαρμογή ελέγχων κόστους:**
- Ρύθμιση ειδοποιήσεων προϋπολογισμού
- Χρήση πολιτικών αυτόματης κλιμάκωσης
- Εφαρμογή προσωρινής αποθήκευσης αιτημάτων
- Παρακολούθηση χρήσης token για OpenAI

### **Άσκηση Εργαστηρίου 7.1: Βελτιστοποίηση Απόδοσης**

**Εργασία**: Βελτιστοποιήστε την εφαρμογή AI σας και ως προς την απόδοση και ως προς το κόστος.

**Μετρικές προς βελτίωση:**
- Μείωση του μέσου χρόνου απόκρισης κατά 20%
- Μείωση μηνιαίων κόστους κατά 15%
- Ορίστε SLA διαθεσιμότητας 99,9% και παράθυρο μέτρησης (ένα σύντομο εργαστήριο δεν μπορεί να επιδείξει μηνιαία διαθεσιμότητα)

**Στρατηγικές για δοκιμή:**
- Εφαρμογή προσωρινής αποθήκευσης απόκρισης
- Βελτιστοποίηση ερωτημάτων για αποδοτικότητα token
- Χρήση κατάλληλων υπολογιστικών SKU
- Ρύθμιση ορθής αυτόματης κλιμάκωσης

## Τελική Πρόκληση: Ολοκληρωμένη Υλοποίηση

### Σενάριο Πρόκλησης

Πρόκειται για μια **προαιρετική πρόκληση αρχιτεκτονικής / σχεδιασμού**, όχι για παρεχόμενη άσκηση που τρέχει ή πιστοποίηση παραγωγής. Προτείνετε ένα chatbot εξυπηρέτησης πελατών με τεχνητή νοημοσύνη και τεκμηριώστε ποιες απαιτήσεις χρειάζονται περαιτέρω εφαρμογή και αποδεικτικά στοιχεία:

**Λειτουργικές Απαιτήσεις:**
- Διαδικτυακό περιβάλλον για αλληλεπιδράσεις πελατών
- Ενσωμάτωση με Microsoft Foundry Models για απαντήσεις
- Δυνατότητα αναζήτησης εγγράφων με χρήση Azure AI Search
- Ενσωμάτωση με υπάρχουσα βάση πελατών
- Υποστήριξη πολλαπλών γλωσσών

**Μη Λειτουργικές Απαιτήσεις:**
- Διαχείριση 1000 ταυτόχρονων χρηστών
- SLA 99,9% διαθεσιμότητα
- Συμμόρφωση SOC 2
- Κόστος κάτω από $500/μήνα
- Ανάπτυξη σε πολλαπλά περιβάλλοντα (dev, staging, prod)

Αυτοί είναι υποθετικοί περιορισμοί ενδιαφερομένων, όχι εξασφαλισμένα ταυτόχρονα αποτελέσματα. Καθορίστε το ρυθμό αιτήσεων, το μέγεθος ερωτημάτων/αποτελεσμάτων και τη διάρκεια συνεδρίας προτού εκτιμήσετε κόστη· 1.000 ταυτόχρονοι χρήστες δεν καθορίζουν φόρτο εργασίας ούτε αποδεικνύουν ότι ένας προϋπολογισμός $500 είναι εφικτός. Το SOC 2 είναι αποτέλεσμα οργανωτικού ελέγχου, όχι διακόπτης που ενεργοποιείται με ένα πρότυπο AZD. Ανιχνεύστε ανταλλαγές και απορρίψτε ανέφικτους περιορισμούς με αποδείξεις.

### Βήματα Υλοποίησης

1. **Σχεδιασμός αρχιτεκτονικής**
2. **Δημιουργία προτύπου AZD**
3. **Εφαρμογή μέτρων ασφάλειας**
4. **Ρύθμιση παρακολούθησης και ειδοποιήσεων**
5. **Δημιουργία pipelines ανάπτυξης**
6. **Τεκμηρίωση της λύσης**

### Κριτήρια Αξιολόγησης

- ✅ **Λειτουργικότητα**: Επιδεικνύονται οι εφαρμοσμένες δυνατότητες και είναι σαφή τα εναπομείναντα κενά;
- ✅ **Ασφάλεια**: Εφαρμόζονται βέλτιστες πρακτικές;
- ✅ **Κλιμακωσιμότητα**: Μπορεί να διαχειριστεί το φόρτο;
- ✅ **Διαχειρισιμότητα**: Είναι ο κώδικας και η υποδομή οργανωμένα καλά;
- ✅ **Κόστος**: Παραμένει εντός προϋπολογισμού;

## Επιπλέον Πόροι

### Τεκμηρίωση Microsoft
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Πρότυπα Δείγματος
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Πόροι Κοινότητας
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Σημείο Επαλήθευσης Ολοκλήρωσης

Συγχαρητήρια! Ολοκληρώσατε το εργαστήριο AI. Τώρα θα πρέπει να μπορείτε να:

- ✅ Εξηγήσετε πώς να προσαρμόσετε μια υπάρχουσα εφαρμογή AI σε πρότυπο AZD
- ✅ Αναπτύξετε και δοκιμάσετε μια εφαρμογή AI αναφοράς
- ✅ Εφαρμόσετε τις βέλτιστες πρακτικές ασφάλειας για φόρτο εργασίας AI
- ✅ Παρακολουθείτε και βελτιστοποιείτε την απόδοση της εφαρμογής AI
- ✅ Αντιμετωπίσετε κοινά ζητήματα ανάπτυξης

**Καθαρισμός:** Εκτελέστε `azd env list`, επιλέξτε κάθε προσωρινό περιβάλλον που δημιουργήθηκε σε αυτό το εργαστήριο (`myai-workshop`, και αν αναπτύχθηκε `myai-production`/`myai-quota-test`), και εκτελέστε `azd down` σε καθένα. Εξετάστε το σχέδιο διαγραφής· η διαγραφή μόνο της τοπικής ρύθμισης ενός περιβάλλοντος δεν διαγράφει πόρους Azure. Αποφύγετε `--purge` εκτός αν κατανοείτε την μη αναστρέψιμη αφαίρεση πόρων με μαλακή διαγραφή.

### Επόμενα Βήματα
1. Εφαρμόστε αυτά τα πρότυπα στα δικά σας έργα AI
2. Συνεισφέρετε πρότυπα πίσω στην κοινότητα
3. Ενταχθείτε στο Microsoft Foundry Discord για συνεχή υποστήριξη
4. Εξερευνήστε προχωρημένα θέματα όπως οι αναπτύξεις σε πολλαπλές περιοχές

---

**Ανατροφοδότηση Εργαστηρίου**: Βοηθήστε μας να βελτιώσουμε αυτό το εργαστήριο μοιράζοντας την εμπειρία σας στο [κανάλι #Azure στο Microsoft Foundry Discord](https://discord.gg/microsoft-azure).

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 2 - Ανάπτυξη AI-First
- **⬅️ Προηγούμενο**: [Ανάπτυξη Μοντέλου AI](ai-model-deployment.md)
- **➡️ Επόμενο**: [Καλές Πρακτικές Παραγωγής AI](../chapter-08-production/production-ai-practices.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 3: Ρύθμιση](../chapter-03-configuration/configuration.md)

**Χρειάζεστε Βοήθεια;** Ενταχθείτε στην κοινότητά μας για υποστήριξη και συζητήσεις σχετικά με ανάπτυξη AZD και AI.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->