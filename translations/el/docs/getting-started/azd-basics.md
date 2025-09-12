<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "32a717e79e5363b775f9bdac58002a80",
  "translation_date": "2025-09-12T20:55:15+00:00",
  "source_file": "docs/getting-started/azd-basics.md",
  "language_code": "el"
}
-->
# AZD Βασικά - Κατανόηση του Azure Developer CLI

**Προηγούμενο:** [Εγκατάσταση & Ρύθμιση](installation.md) | **Επόμενο:** [Παραμετροποίηση](configuration.md)

## Εισαγωγή

Αυτό το μάθημα σας εισάγει στο Azure Developer CLI (azd), ένα ισχυρό εργαλείο γραμμής εντολών που επιταχύνει τη μετάβασή σας από την τοπική ανάπτυξη στην ανάπτυξη στο Azure. Θα μάθετε τις βασικές έννοιες, τα κύρια χαρακτηριστικά και πώς το azd απλοποιεί την ανάπτυξη εφαρμογών cloud-native.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Κατανοήσετε τι είναι το Azure Developer CLI και τον κύριο σκοπό του
- Μάθετε τις βασικές έννοιες των προτύπων, περιβαλλόντων και υπηρεσιών
- Εξερευνήσετε βασικά χαρακτηριστικά όπως η ανάπτυξη με βάση πρότυπα και το Infrastructure as Code
- Κατανοήσετε τη δομή και τη ροή εργασίας ενός έργου azd
- Είστε έτοιμοι να εγκαταστήσετε και να παραμετροποιήσετε το azd για το περιβάλλον ανάπτυξής σας

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Εξηγήσετε τον ρόλο του azd στις σύγχρονες ροές εργασίας ανάπτυξης cloud
- Αναγνωρίσετε τα στοιχεία της δομής ενός έργου azd
- Περιγράψετε πώς τα πρότυπα, τα περιβάλλοντα και οι υπηρεσίες συνεργάζονται
- Κατανοήσετε τα οφέλη του Infrastructure as Code με το azd
- Αναγνωρίσετε διαφορετικές εντολές του azd και τους σκοπούς τους

## Τι είναι το Azure Developer CLI (azd);

Το Azure Developer CLI (azd) είναι ένα εργαλείο γραμμής εντολών σχεδιασμένο να επιταχύνει τη μετάβασή σας από την τοπική ανάπτυξη στην ανάπτυξη στο Azure. Απλοποιεί τη διαδικασία δημιουργίας, ανάπτυξης και διαχείρισης εφαρμογών cloud-native στο Azure.

## Βασικές Έννοιες

### Πρότυπα
Τα πρότυπα αποτελούν τη βάση του azd. Περιλαμβάνουν:
- **Κώδικα εφαρμογής** - Τον πηγαίο κώδικα και τις εξαρτήσεις σας
- **Ορισμούς υποδομής** - Πόρους Azure που ορίζονται σε Bicep ή Terraform
- **Αρχεία παραμετροποίησης** - Ρυθμίσεις και μεταβλητές περιβάλλοντος
- **Σενάρια ανάπτυξης** - Αυτοματοποιημένες ροές εργασίας ανάπτυξης

### Περιβάλλοντα
Τα περιβάλλοντα αντιπροσωπεύουν διαφορετικούς στόχους ανάπτυξης:
- **Ανάπτυξη** - Για δοκιμές και ανάπτυξη
- **Προετοιμασία** - Περιβάλλον προπαραγωγής
- **Παραγωγή** - Ζωντανό περιβάλλον παραγωγής

Κάθε περιβάλλον διατηρεί τα δικά του:
- Ομάδα πόρων Azure
- Ρυθμίσεις παραμετροποίησης
- Κατάσταση ανάπτυξης

### Υπηρεσίες
Οι υπηρεσίες είναι τα δομικά στοιχεία της εφαρμογής σας:
- **Frontend** - Εφαρμογές ιστού, SPAs
- **Backend** - APIs, μικροϋπηρεσίες
- **Βάση δεδομένων** - Λύσεις αποθήκευσης δεδομένων
- **Αποθήκευση** - Αποθήκευση αρχείων και blob

## Βασικά Χαρακτηριστικά

### 1. Ανάπτυξη με βάση Πρότυπα
```bash
# Browse available templates
azd template list

# Initialize from a template
azd init --template <template-name>
```

### 2. Infrastructure as Code
- **Bicep** - Ειδική γλώσσα του Azure
- **Terraform** - Εργαλείο υποδομής πολλαπλών cloud
- **ARM Templates** - Πρότυπα Azure Resource Manager

### 3. Ενσωματωμένες Ροές Εργασίας
```bash
# Complete deployment workflow
azd up            # Provision + Deploy this is hands off for first time setup
azd provision     # Create Azure resources if you update the infrastructure use this
azd deploy        # Deploy application code or redeploy application code once update
azd down          # Clean up resources
```

### 4. Διαχείριση Περιβαλλόντων
```bash
# Create and manage environments
azd env new <environment-name>
azd env select <environment-name>
azd env list
```

## 📁 Δομή Έργου

Μια τυπική δομή έργου azd:
```
my-app/
├── .azd/                    # azd configuration
│   └── config.json
├── .azure/                  # Azure deployment artifacts
├── .devcontainer/          # Development container config
├── .github/workflows/      # GitHub Actions
├── .vscode/               # VS Code settings
├── infra/                 # Infrastructure code
│   ├── main.bicep        # Main infrastructure template
│   ├── main.parameters.json
│   └── modules/          # Reusable modules
├── src/                  # Application source code
│   ├── api/             # Backend services
│   └── web/             # Frontend application
├── azure.yaml           # azd project configuration
└── README.md
```

## 🔧 Αρχεία Παραμετροποίησης

### azure.yaml
Το κύριο αρχείο παραμετροποίησης του έργου:
```yaml
name: my-awesome-app
metadata:
  template: my-template@1.0.0

services:
  web:
    project: ./src/web
    language: js
    host: appservice
  api:
    project: ./src/api
    language: js
    host: appservice

hooks:
  preprovision:
    shell: pwsh
    run: echo "Preparing to provision..."
```

### .azure/config.json
Παραμετροποίηση συγκεκριμένη για το περιβάλλον:
```json
{
  "version": 1,
  "defaultEnvironment": "dev",
  "environments": {
    "dev": {
      "subscriptionId": "your-subscription-id",
      "location": "eastus"
    }
  }
}
```

## 🎪 Συνήθεις Ροές Εργασίας

### Ξεκινώντας ένα Νέο Έργο
```bash
# Method 1: Use existing template
azd init --template todo-nodejs-mongo

# Method 2: Start from scratch
azd init

# Method 3: Use current directory
azd init .
```

### Κύκλος Ανάπτυξης
```bash
# Set up development environment
azd auth login
azd env new dev
azd env select dev

# Deploy everything
azd up

# Make changes and redeploy
azd deploy

# Clean up when done
azd down --force --purge # command in the Azure Developer CLI is a **hard reset** for your environment—especially useful when you're troubleshooting failed deployments, cleaning up orphaned resources, or prepping for a fresh redeploy.
```

## Κατανόηση `azd down --force --purge`
Η εντολή `azd down --force --purge` είναι ένας ισχυρός τρόπος για να καταργήσετε πλήρως το περιβάλλον azd και όλους τους σχετικούς πόρους. Ακολουθεί μια ανάλυση του τι κάνει κάθε σημαία:
```
--force
```
- Παρακάμπτει τις προτροπές επιβεβαίωσης.
- Χρήσιμο για αυτοματοποίηση ή σενάρια όπου η χειροκίνητη εισαγωγή δεν είναι εφικτή.
- Εξασφαλίζει ότι η κατάργηση προχωρά χωρίς διακοπή, ακόμα κι αν η CLI εντοπίσει ασυνέπειες.

```
--purge
```
Διαγράφει **όλα τα σχετικά μεταδεδομένα**, συμπεριλαμβανομένων:
Κατάσταση περιβάλλοντος
Τοπικός φάκελος `.azure`
Πληροφορίες προσωρινής αποθήκευσης ανάπτυξης
Αποτρέπει το azd από το να "θυμάται" προηγούμενες αναπτύξεις, κάτι που μπορεί να προκαλέσει προβλήματα όπως ασυμφωνίες ομάδων πόρων ή παλιές αναφορές μητρώου.

### Γιατί να χρησιμοποιήσετε και τα δύο;
Όταν αντιμετωπίζετε προβλήματα με το `azd up` λόγω υπολειπόμενης κατάστασης ή μερικών αναπτύξεων, αυτός ο συνδυασμός εξασφαλίζει ένα **καθαρό ξεκίνημα**.

Είναι ιδιαίτερα χρήσιμο μετά από χειροκίνητες διαγραφές πόρων στο Azure portal ή όταν αλλάζετε πρότυπα, περιβάλλοντα ή συμβάσεις ονοματοδοσίας ομάδων πόρων.

### Διαχείριση Πολλαπλών Περιβαλλόντων
```bash
# Create staging environment
azd env new staging
azd env select staging
azd up

# Switch back to dev
azd env select dev

# Compare environments
azd env list
```

## 🧭 Εντολές Πλοήγησης

### Ανακάλυψη
```bash
azd template list              # Browse templates
azd template show <template>   # Template details
azd init --help               # Initialization options
```

### Διαχείριση Έργου
```bash
azd show                     # Project overview
azd env show                 # Current environment
azd config list             # Configuration settings
```

### Παρακολούθηση
```bash
azd monitor                  # Open Azure portal
azd pipeline config          # Set up CI/CD
azd logs                     # View application logs
```

## Βέλτιστες Πρακτικές

### 1. Χρησιμοποιήστε Σημαντικά Ονόματα
```bash
# Good
azd env new production-east
azd init --template web-app-secure

# Avoid
azd env new env1
azd init --template template1
```

### 2. Αξιοποιήστε τα Πρότυπα
- Ξεκινήστε με υπάρχοντα πρότυπα
- Προσαρμόστε τα στις ανάγκες σας
- Δημιουργήστε επαναχρησιμοποιήσιμα πρότυπα για τον οργανισμό σας

### 3. Απομόνωση Περιβαλλόντων
- Χρησιμοποιήστε ξεχωριστά περιβάλλοντα για ανάπτυξη/προετοιμασία/παραγωγή
- Μην αναπτύσσετε απευθείας στην παραγωγή από τοπικό μηχάνημα
- Χρησιμοποιήστε pipelines CI/CD για αναπτύξεις παραγωγής

### 4. Διαχείριση Παραμετροποίησης
- Χρησιμοποιήστε μεταβλητές περιβάλλοντος για ευαίσθητα δεδομένα
- Διατηρήστε την παραμετροποίηση υπό έλεγχο έκδοσης
- Τεκμηριώστε τις ρυθμίσεις που είναι συγκεκριμένες για κάθε περιβάλλον

## Πρόοδος Μάθησης

### Αρχάριος (Εβδομάδα 1-2)
1. Εγκαταστήστε το azd και πιστοποιηθείτε
2. Αναπτύξτε ένα απλό πρότυπο
3. Κατανοήστε τη δομή του έργου
4. Μάθετε βασικές εντολές (up, down, deploy)

### Ενδιάμεσος (Εβδομάδα 3-4)
1. Προσαρμόστε πρότυπα
2. Διαχειριστείτε πολλαπλά περιβάλλοντα
3. Κατανοήστε τον κώδικα υποδομής
4. Ρυθμίστε pipelines CI/CD

### Προχωρημένος (Εβδομάδα 5+)
1. Δημιουργήστε προσαρμοσμένα πρότυπα
2. Προηγμένα μοτίβα υποδομής
3. Αναπτύξεις πολλαπλών περιοχών
4. Ρυθμίσεις επιπέδου επιχείρησης

## Επόμενα Βήματα

- [Εγκατάσταση & Ρύθμιση](installation.md) - Εγκαταστήστε και παραμετροποιήστε το azd
- [Το Πρώτο σας Έργο](first-project.md) - Πρακτικό σεμινάριο
- [Οδηγός Παραμετροποίησης](configuration.md) - Προχωρημένες επιλογές παραμετροποίησης

## Πρόσθετοι Πόροι

- [Επισκόπηση Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Γκαλερί Προτύπων](https://azure.github.io/awesome-azd/)
- [Δείγματα Κοινότητας](https://github.com/Azure-Samples)

---

**Προηγούμενο:** [Εγκατάσταση & Ρύθμιση](installation.md) | **Επόμενο:** [Παραμετροποίηση](configuration.md)
- **Επόμενο Μάθημα**: [Εγκατάσταση & Ρύθμιση](installation.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.