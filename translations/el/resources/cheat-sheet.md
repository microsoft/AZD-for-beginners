# Command Cheat Sheet - Essential AZD Commands

**Γρήγορη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../README.md)
- **📖 Γρήγορη Εκκίνηση**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Εντολές AI**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Για Προχωρημένους**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτό το ολοκληρωμένο συνοπτικό οδηγό παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές του Azure Developer CLI, οργανωμένες κατά κατηγορία με πρακτικά παραδείγματα. Ιδανικό για γρήγορες αναζητήσεις κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές εργασίες με έργα azd.

## Στόχοι Μάθησης

Χρησιμοποιώντας αυτόν τον οδηγό, θα:
- Έχετε άμεση πρόσβαση σε βασικές εντολές και σύνταξη του Azure Developer CLI
- Κατανοήσετε την οργάνωση των εντολών ανά λειτουργικές κατηγορίες και σενάρια χρήσης
- Ανατρέξετε σε πρακτικά παραδείγματα για κοινά σενάρια ανάπτυξης και παράδοσης
- Έχετε εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση ζητημάτων
- Βρείτε αποτελεσματικά επιλογές προχωρημένης διαμόρφωσης και προσαρμογής
- Εντοπίσετε εντολές διαχείρισης περιβάλλοντος και ροές εργασίας πολλαπλών περιβαλλόντων

## Αποτελέσματα Μάθησης

Με τακτική αναφορά σε αυτόν τον οδηγό, θα μπορείτε να:
- Εκτελείτε εντολές azd με αυτοπεποίθηση χωρίς να συμβουλεύεστε την πλήρη τεκμηρίωση
- Επιδιορθώνετε γρήγορα συνήθη προβλήματα χρησιμοποιώντας κατάλληλες διαγνωστικές εντολές
- Διαχειρίζεστε αποδοτικά πολλαπλά περιβάλλοντα και σενάρια ανάπτυξης
- Εφαρμόζετε προχωρημένα χαρακτηριστικά azd και επιλογές διαμόρφωσης όταν χρειάζεται
- Εντοπίζετε προβλήματα ανάπτυξης με συστηματικές ακολουθίες εντολών
- Βελτιστοποιείτε ροές εργασίας μέσω της αποτελεσματικής χρήσης συντομεύσεων και επιλογών του azd

## Εντολές Έναρξης

### Έλεγχος ταυτότητας
```bash
# Σύνδεση στο Azure μέσω AZD
azd auth login

# Σύνδεση στο Azure CLI (το AZD το χρησιμοποιεί εσωτερικά)
az login

# Ελέγξτε τον τρέχοντα λογαριασμό
az account show

# Ορισμός προεπιλεγμένης συνδρομής
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Αποσύνδεση από το AZD
azd auth logout

# Αποσύνδεση από το Azure CLI
az logout
```

### Αρχικοποίηση Έργου
```bash
# Περιήγηση διαθέσιμων προτύπων
azd template list

# Αρχικοποίηση από πρότυπο
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Αρχικοποίηση στον τρέχοντα κατάλογο
azd init .

# Αρχικοποίηση με προσαρμοσμένο όνομα
azd init --template todo-nodejs-mongo my-awesome-app
```

## Βασικές Εντολές Ανάπτυξης

### Ολοκληρωμένη ροή ανάπτυξης
```bash
# Διάθεση όλων (παροχή πόρων + ανάπτυξη)
azd up

# Διάθεση με απενεργοποιημένες τις προτροπές επιβεβαίωσης
azd up --confirm-with-no-prompt

# Διάθεση σε συγκεκριμένο περιβάλλον
azd up --environment production

# Διάθεση με προσαρμοσμένες παραμέτρους
azd up --parameter location=westus2
```

### Μόνο Υποδομή
```bash
# Παροχή πόρων του Azure
azd provision

# 🧪 Προεπισκόπηση αλλαγών στην υποδομή
azd provision --preview
# Εμφανίζει μια προεπισκόπηση (dry-run) των πόρων που θα δημιουργηθούν/τροποποιηθούν/διαγραφούν
# Παρόμοιο με 'terraform plan' ή 'bicep what-if' - ασφαλές για εκτέλεση, δεν εφαρμόζονται αλλαγές
```

### Μόνο Εφαρμογή
```bash
# Ανάπτυξη κώδικα εφαρμογής
azd deploy

# Ανάπτυξη συγκεκριμένης υπηρεσίας
azd deploy --service web
azd deploy --service api

# Ανάπτυξη όλων των υπηρεσιών
azd deploy --all
```

### Δημιουργία και Πακετάρισμα
```bash
# Δημιουργήστε εφαρμογές
azd package

# Δημιουργήστε συγκεκριμένη υπηρεσία
azd package --service api
```

## 🌍 Διαχείριση Περιβάλλοντος

### Λειτουργίες Περιβάλλοντος
```bash
# Εμφάνιση όλων των περιβαλλόντων
azd env list

# Δημιουργία νέου περιβάλλοντος
azd env new development
azd env new staging --location westus2

# Επιλογή περιβάλλοντος
azd env select production

# Εμφάνιση τρέχοντος περιβάλλοντος
azd env show

# Ανανέωση κατάστασης περιβάλλοντος
azd env refresh
```

### Μεταβλητές Περιβάλλοντος
```bash
# Ορισμός μεταβλητής περιβάλλοντος
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Λήψη μεταβλητής περιβάλλοντος
azd env get API_KEY

# Εμφάνιση όλων των μεταβλητών περιβάλλοντος
azd env get-values

# Αφαίρεση μεταβλητής περιβάλλοντος
azd env unset DEBUG
```

## ⚙️ Εντολές Διαμόρφωσης

### Παγκόσμια Διαμόρφωση
```bash
# Εμφάνιση όλων των ρυθμίσεων
azd config list

# Ορισμός παγκόσμιων προεπιλογών
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Κατάργηση ρύθμισης
azd config unset defaults.location

# Επαναφορά όλων των ρυθμίσεων
azd config reset
```

### Διαμόρφωση Έργου
```bash
# Επικύρωση αρχείου azure.yaml
azd config validate

# Εμφάνιση πληροφοριών έργου
azd show

# Λήψη σημείων τερματισμού υπηρεσίας
azd show --output json
```

## 📊 Παρακολούθηση και Διαγνωστικά

### Πίνακας Παρακολούθησης
```bash
# Άνοιγμα του πίνακα παρακολούθησης στο Azure portal
azd monitor

# Άνοιγμα των ζωντανών μετρικών του Application Insights
azd monitor --live

# Άνοιγμα του blade καταγραφών του Application Insights
azd monitor --logs

# Άνοιγμα της επισκόπησης του Application Insights
azd monitor --overview
```

### Προβολή Καταγραφών Κοντέινερ
```bash
# Προβολή αρχείων καταγραφής μέσω του Azure CLI (για Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Παρακολούθηση αρχείων καταγραφής σε πραγματικό χρόνο
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Προβολή αρχείων καταγραφής από το Azure Portal
azd monitor --logs
```

### Ερωτήματα ανάλυσης καταγραφών
```bash
# Πρόσβαση στο Log Analytics μέσω του Azure Portal
azd monitor --logs

# Εκτέλεση ερωτημάτων στα αρχεία καταγραφής χρησιμοποιώντας το Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Εντολές Συντήρησης

### Καθαρισμός
```bash
# Κατάργηση όλων των πόρων του Azure
azd down

# Καταναγκαστική διαγραφή χωρίς επιβεβαίωση
azd down --force

# Μόνιμη διαγραφή πόρων που έχουν διαγραφεί προσωρινά
azd down --purge

# Πλήρης καθαρισμός
azd down --force --purge
```

### Ενημερώσεις
```bash
# Έλεγχος για ενημερώσεις του azd
azd version

# Λήψη τρέχουσας έκδοσης
azd version

# Προβολή τρέχουσας διαμόρφωσης
azd config list
```

## 🔧 Σύνθετες Εντολές

### Pipeline και CI/CD
```bash
# Διαμόρφωση GitHub Actions
azd pipeline config

# Διαμόρφωση Azure DevOps
azd pipeline config --provider azdo

# Εμφάνιση διαμόρφωσης pipeline
azd pipeline show
```

### Διαχείριση Υποδομής
```bash
# Δημιουργεί πρότυπα υποδομής
azd infra generate

# 🧪 Προεπισκόπηση και σχεδιασμός υποδομής
azd provision --preview
# Προσομοιώνει την παροχή υποδομής χωρίς πραγματική ανάπτυξη
# Αναλύει πρότυπα Bicep/Terraform και εμφανίζει:
# - Πόροι που θα προστεθούν (πράσινο +)
# - Πόροι που θα τροποποιηθούν (κίτρινο ~)
# - Πόροι που θα διαγραφούν (κόκκινο -)
# Ασφαλές για εκτέλεση - δεν γίνονται πραγματικές αλλαγές στο περιβάλλον Azure

# Συνθέτει υποδομή από το azure.yaml
azd infra synth
```

### Πληροφορίες Έργου
```bash
# Εμφάνιση κατάστασης έργου και σημείων τερματισμού
azd show

# Εμφάνιση λεπτομερών πληροφοριών έργου ως JSON
azd show --output json

# Λήψη σημείων τερματισμού υπηρεσίας
azd show --output json | jq '.services'
```

## 🎯 Γρήγορες Ροές Εργασίας

### Ροή εργασίας ανάπτυξης
```bash
# Ξεκινήστε νέο έργο
azd init --template todo-nodejs-mongo
cd my-project

# Αναπτύξτε στο περιβάλλον ανάπτυξης
azd env new dev
azd up

# Κάντε αλλαγές και αναπτύξτε ξανά
azd deploy

# Ανοίξτε τον πίνακα ελέγχου παρακολούθησης
azd monitor --live
```

### Ροή εργασίας πολλαπλών περιβαλλόντων
```bash
# Ρύθμιση περιβαλλόντων
azd env new dev
azd env new staging  
azd env new production

# Ανάπτυξη στο dev
azd env select dev
azd up

# Δοκιμή και προώθηση στο staging
azd env select staging
azd up

# Ανάπτυξη στην παραγωγή
azd env select production
azd up
```

### Ροή εργασίας επίλυσης προβλημάτων
```bash
# Ενεργοποίηση λειτουργίας αποσφαλμάτωσης
export AZD_DEBUG=true

# Έλεγχος κατάστασης ανάπτυξης
azd show

# Επικύρωση διαμόρφωσης
azd config list

# Άνοιγμα πίνακα ελέγχου παρακολούθησης για αρχεία καταγραφής
azd monitor --logs

# Έλεγχος κατάστασης πόρων
azd show --output json
```

## 🔍 Εντολές Αποσφαλμάτωσης

### Πληροφορίες αποσφαλμάτωσης
```bash
# Ενεργοποίηση εξόδου εντοπισμού σφαλμάτων
export AZD_DEBUG=true
azd <command> --debug

# Απενεργοποίηση τηλεμετρίας για καθαρότερη έξοδο
export AZD_DISABLE_TELEMETRY=true

# Έλεγχος τρέχουσας διαμόρφωσης
azd config list

# Έλεγχος κατάστασης αυθεντικοποίησης
az account show
```

### Αποσφαλμάτωση προτύπου
```bash
# Λίστα διαθέσιμων προτύπων με λεπτομέρειες
azd template list --output json

# Εμφάνιση πληροφοριών προτύπου
azd template show <template-name>

# Επικύρωση προτύπου πριν την αρχικοποίηση
azd template validate <template-name>
```

## 📁 Εντολές Αρχείων και Καταλόγων

### Δομή Έργου
```bash
# Εμφάνιση της τρέχουσας δομής καταλόγου
tree /f  # Windows
find . -type f  # Linux/macOS

# Μεταβείτε στη ρίζα του έργου azd
cd $(azd root)

# Εμφάνιση του καταλόγου ρυθμίσεων του azd
echo $AZD_CONFIG_DIR  # Συνήθως ~/.azd
```

## 🎨 Μορφοποίηση Εξόδου

### Έξοδος JSON
```bash
# Λάβετε έξοδο JSON για scripting
azd show --output json
azd env list --output json
azd config list --output json

# Αναλύστε με το jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Έξοδος Πίνακα
```bash
# Μορφοποίηση σε πίνακα
azd env list --output table

# Προβολή αναπτυγμένων υπηρεσιών
azd show --output json | jq '.services | keys'
```

## 🔧 Συνήθεις Συνδυασμοί Εντολών

### Σενάριο Έλεγχου Υγείας
```bash
#!/bin/bash
# Γρήγορος έλεγχος υγείας
azd show
azd env show
azd monitor --logs
```

### Επικύρωση Ανάπτυξης
```bash
#!/bin/bash
# Επαλήθευση πριν την ανάπτυξη
azd show
azd provision --preview  # Προεπισκόπηση αλλαγών πριν την ανάπτυξη
az account show
```

### Σύγκριση Περιβαλλόντων
```bash
#!/bin/bash
# Σύγκριση περιβαλλόντων
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Σενάριο Καθαρισμού Πόρων
```bash
#!/bin/bash
# Καθαρισμός παλαιών περιβαλλόντων
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Μεταβλητές Περιβάλλοντος

### Συνήθεις Μεταβλητές Περιβάλλοντος
```bash
# Διαμόρφωση Azure
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# Διαμόρφωση AZD
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Διαμόρφωση εφαρμογής
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Επείγουσες Εντολές

### Γρήγορες Διορθώσεις
```bash
# Επαναφορά πιστοποίησης
az account clear
az login

# Αναγκαστική ανανέωση περιβάλλοντος
azd env refresh

# Επαναπτύξτε όλες τις υπηρεσίες
azd deploy

# Έλεγχος κατάστασης ανάπτυξης
azd show --output json
```

### Εντολές Ανάκτησης
```bash
# Ανάκτηση από αποτυχημένη ανάπτυξη - καθαρισμός και επανανάπτυξη
azd down --force --purge
azd up

# Μόνο επαναπαροχή της υποδομής
azd provision

# Επανανάπτυξη μόνο της εφαρμογής
azd deploy
```

## 💡 Χρήσιμες Συμβουλές

### Ψευδώνυμα για Γρηγορότερη Ροή Εργασίας
```bash
# Προσθέστε στο .bashrc ή .zshrc σας
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Συντομεύσεις Συναρτήσεων
```bash
# Γρήγορη εναλλαγή μεταξύ περιβαλλόντων
azd-env() {
    azd env select $1 && azd show
}

# Γρήγορη διάθεση με παρακολούθηση
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Κατάσταση περιβάλλοντος
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Βοήθεια και Τεκμηρίωση

### Λήψη Βοήθειας
```bash
# Γενική βοήθεια
azd --help
azd help

# Βοήθεια για συγκεκριμένη εντολή
azd up --help
azd env --help
azd config --help

# Εμφάνιση πληροφοριών έκδοσης και κατασκευής
azd version
azd version --output json
```

### Σύνδεσμοι Τεκμηρίωσης
```bash
# Άνοιγμα τεκμηρίωσης στο πρόγραμμα περιήγησης
azd docs

# Εμφάνιση τεκμηρίωσης προτύπου
azd template show <template-name> --docs
```

---

**Συμβουλή**: Αποθηκεύστε σε σελιδοδείκτη αυτόν τον συνοπτικό οδηγό και χρησιμοποιήστε το `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Έλεγχοι προ-ανάπτυξης](../docs/pre-deployment/preflight-checks.md)
- **Επόμενο Μάθημα**: [Γλωσσάρι](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί με χρήση της υπηρεσίας μετάφρασης τεχνητής νοημοσύνης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική/επίσημη πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρανοήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->