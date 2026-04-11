# Συνοπτικός Οδηγός Εντολών - Βασικές Εντολές AZD

**Γρήγορη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Course Home**: [AZD για Αρχάριους](../README.md)
- **📖 Quick Start**: [Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI Commands**: [Κεφάλαιο 2: Ανάπτυξη με Έμφαση στην Τεχνητή Νοημοσύνη](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Advanced**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτός ο ολοκληρωμένος συνοπτικός οδηγός παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές του Azure Developer CLI, οργανωμένες κατά κατηγορία με πρακτικά παραδείγματα. Ιδανικό για γρήγορη αναζήτηση κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές ενέργειες με έργα azd.

## Στόχοι Μάθησης

Με τη χρήση αυτού του συνοπτικού οδηγού, θα:
- Έχετε άμεση πρόσβαση σε βασικές εντολές και σύνταξη του Azure Developer CLI
- Κατανοήσετε την οργάνωση των εντολών κατά λειτουργικές κατηγορίες και σενάρια χρήσης
- Ανατρέχετε σε πρακτικά παραδείγματα για κοινά σενάρια ανάπτυξης και εγκατάστασης
- Έχετε πρόσβαση σε εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση θεμάτων
- Εντοπίζετε αποτελεσματικά προχωρημένες επιλογές ρυθμίσεων και εξατομίκευσης
- Εντοπίζετε εντολές διαχείρισης περιβάλλοντος και ροής εργασίας με πολλαπλά περιβάλλοντα

## Μαθησιακά Αποτελέσματα

Με τακτική αναφορά σε αυτόν τον συνοπτικό οδηγό, θα μπορείτε να:
- Εκτελείτε εντολές azd με αυτοπεποίθηση χωρίς να χρειάζεται να ανατρέχετε στην πλήρη τεκμηρίωση
- Επιλύετε γρήγορα κοινά προβλήματα χρησιμοποιώντας τις κατάλληλες διαγνωστικές εντολές
- Διαχειρίζεστε αποδοτικά πολλαπλά περιβάλλοντα και σενάρια ανάπτυξης
- Εφαρμόζετε προχωρημένες λειτουργίες και επιλογές ρύθμισης του azd όταν χρειάζεται
- Αντιμετωπίζετε προβλήματα ανάπτυξης χρησιμοποιώντας συστηματικές ακολουθίες εντολών
- Βελτιστοποιείτε ροές εργασίας μέσω της αποτελεσματικής χρήσης συντομεύσεων και επιλογών του azd

## Εντολές Έναρξης

### Αυθεντικοποίηση
```bash
# Σύνδεση στο Azure μέσω AZD
azd auth login

# Σύνδεση στο Azure CLI (το AZD το χρησιμοποιεί στο παρασκήνιο)
az login

# Έλεγχος τρέχοντος λογαριασμού
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

### Πλήρης Ροή Εργασίας Ανάπτυξης
```bash
# Ανάπτυξη όλων (παροχή + ανάπτυξη)
azd up

# Ανάπτυξη με τις προτροπές επιβεβαίωσης απενεργοποιημένες
azd up --confirm-with-no-prompt

# Ανάπτυξη σε συγκεκριμένο περιβάλλον
azd up --environment production

# Ανάπτυξη με προσαρμοσμένες παραμέτρους
azd up --parameter location=westus2
```

### Μόνο Υποδομή
```bash
# Δημιουργία πόρων Azure
azd provision

# 🧪 Προεπισκόπηση αλλαγών στην υποδομή
azd provision --preview
# Εμφανίζει μια προσομοιωμένη (dry-run) προβολή των πόρων που θα δημιουργηθούν/τροποποιηθούν/διαγραφούν
# Παρόμοιο με το 'terraform plan' ή το 'bicep what-if' - ασφαλές για εκτέλεση, δεν εφαρμόζονται αλλαγές
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

# Εμφάνιση διαθέσιμων περιβαλλόντων
azd env list

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

## ⚙️ Εντολές Ρύθμισης

### Παγκόσμια Ρύθμιση
```bash
# Εμφάνιση όλων των ρυθμίσεων
azd config show

# Ορισμός παγκόσμιων προεπιλογών
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Κατάργηση ρύθμισης
azd config unset defaults.location

# Επαναφορά όλων των ρυθμίσεων
azd config reset
```

### Ρύθμιση Έργου
```bash
# Επικύρωση azure.yaml
azd config validate

# Εμφάνιση πληροφοριών έργου
azd show

# Λήψη τελικών σημείων υπηρεσίας
azd show --output json
```

## 📊 Παρακολούθηση και Διαγνωστικά

### Πίνακας Παρακολούθησης
```bash
# Άνοιγμα του πίνακα ελέγχου παρακολούθησης στο Azure Portal
azd monitor

# Άνοιγμα των ζωντανών μετρήσεων του Application Insights
azd monitor --live

# Άνοιγμα του blade καταγραφών του Application Insights
azd monitor --logs

# Άνοιγμα της επισκόπησης του Application Insights
azd monitor --overview
```

### Προβολή Καταγραφών Κοντέινερ
```bash
# Προβολή καταγραφών μέσω του Azure CLI (για Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Παρακολούθηση καταγραφών σε πραγματικό χρόνο
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Προβολή καταγραφών από το Azure Portal
azd monitor --logs
```

### Ερωτήματα Log Analytics
```bash
# Πρόσβαση στο Log Analytics μέσω της Πύλης του Azure
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

# Εξαναγκαστική διαγραφή χωρίς επιβεβαίωση
azd down --force

# Μόνιμη διαγραφή των μαλακά διαγραμμένων πόρων
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
azd config show
```

## 🔧 Προχωρημένες Εντολές

### Pipeline και CI/CD
```bash
# Ρυθμίστε το GitHub Actions
azd pipeline config

# Ρυθμίστε το Azure DevOps
azd pipeline config --provider azdo

# Εμφάνιση διαμόρφωσης του pipeline
azd pipeline show
```

### Διαχείριση Υποδομής
```bash
# Δημιουργία προτύπων υποδομής
azd infra generate

# 🧪 Προεπισκόπηση και Σχεδιασμός Υποδομής
azd provision --preview
# Προσομοιώνει την παροχή υποδομής χωρίς ανάπτυξη
# Αναλύει τα πρότυπα Bicep/Terraform και εμφανίζει:
# - Πόροι που θα προστεθούν (πράσινο +)
# - Πόροι που θα τροποποιηθούν (κίτρινο ~)
# - Πόροι που θα διαγραφούν (κόκκινο -)
# Ασφαλές για εκτέλεση - δεν γίνονται πραγματικές αλλαγές στο περιβάλλον Azure

# Σύνθεση υποδομής από το azure.yaml
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

## 🤖 Εντολές AI & Επεκτάσεων

### Επεκτάσεις AZD
```bash
# Εμφάνισε όλες τις διαθέσιμες επεκτάσεις (συμπεριλαμβανομένης της τεχνητής νοημοσύνης)
azd extension list

# Εγκατάστησε την επέκταση Foundry agents
azd extension install azure.ai.agents

# Εγκατάστησε την επέκταση fine-tuning
azd extension install azure.ai.finetune

# Εγκατάστησε την επέκταση custom models
azd extension install azure.ai.models

# Αναβάθμισε όλες τις εγκατεστημένες επεκτάσεις
azd extension upgrade --all
```

### Εντολές Πράκτορα AI
```bash
# Αρχικοποιήστε ένα έργο πράκτορα από ένα αρχείο manifest
azd ai agent init -m <manifest-path-or-uri>

# Στοχεύστε ένα συγκεκριμένο έργο Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Καθορίστε τον κατάλογο πηγαίου κώδικα του πράκτορα
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Επιλέξτε έναν στόχο φιλοξενίας
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Εκκινήστε τον διακομιστή MCP για το έργο σας
azd mcp start

# Διαχειριστείτε τη συναίνεση του εργαλείου για τις λειτουργίες MCP
azd copilot consent list
```

### Δημιουργία Υποδομής
```bash
# Δημιουργήστε αρχεία IaC από τον ορισμό του έργου σας
azd infra generate

# Συνθέστε την υποδομή από το azure.yaml
azd infra synth
```

---

## 🎯 Γρήγορες Ροές Εργασίας

### Ροή Εργασίας Ανάπτυξης
```bash
# Ξεκινήστε νέο έργο
azd init --template todo-nodejs-mongo
cd my-project

# Αναπτύξτε στο περιβάλλον ανάπτυξης
azd env new dev
azd up

# Κάντε αλλαγές και επαναναπτύξτε
azd deploy

# Ανοίξτε το ταμπλό παρακολούθησης
azd monitor --live
```

### Ροή Εργασίας με Πολλαπλά Περιβάλλοντα
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

### Ροή Εργασίας για Αντιμετώπιση Προβλημάτων
```bash
# Ενεργοποίηση λειτουργίας εντοπισμού σφαλμάτων
export AZD_DEBUG=true

# Έλεγχος κατάστασης ανάπτυξης
azd show

# Επικύρωση διαμόρφωσης
azd config show

# Άνοιγμα πίνακα ελέγχου παρακολούθησης για αρχεία καταγραφής
azd monitor --logs

# Έλεγχος κατάστασης πόρων
azd show --output json
```

## 🔍 Εντολές Αποσφαλμάτωσης

### Πληροφορίες Αποσφαλμάτωσης
```bash
# Ενεργοποιήστε την έξοδο αποσφαλμάτωσης
export AZD_DEBUG=true
azd <command> --debug

# Απενεργοποιήστε την τηλεμετρία για πιο καθαρή έξοδο
export AZD_DISABLE_TELEMETRY=true

# Ελέγξτε την τρέχουσα διαμόρφωση
azd config show

# Ελέγξτε την κατάσταση πιστοποίησης
az account show
```

### Αποσφαλμάτωση Προτύπων
```bash
# Εμφάνιση διαθέσιμων προτύπων με λεπτομέρειες
azd template list --output json

# Εμφάνιση πληροφοριών προτύπου
azd template show <template-name>

# Επαλήθευση προτύπου πριν την αρχικοποίηση
azd template validate <template-name>
```

## 📁 Εντολές Αρχείων και Καταλόγων

### Δομή Έργου
```bash
# Εμφάνιση της τρέχουσας δομής καταλόγων
tree /f  # Windows
find . -type f  # Linux/macOS

# Μεταβείτε στον ριζικό φάκελο του έργου azd
cd $(azd root)

# Εμφάνιση του καταλόγου διαμόρφωσης του azd
echo $AZD_CONFIG_DIR  # Συνήθως ~/.azd
```

## 🎨 Μορφοποίηση Εξόδου

### Έξοδος JSON
```bash
# Λάβετε έξοδο JSON για αυτοματοποίηση με σενάρια
azd show --output json
azd env list --output json
azd config show --output json

# Αναλύστε με το jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Έξοδος Πίνακα
```bash
# Μορφοποίηση ως πίνακας
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
azd env get-values
azd monitor --logs
```

### Επικύρωση Ανάπτυξης
```bash
#!/bin/bash
# Επικύρωση πριν από την ανάπτυξη
azd show
azd provision --preview  # Προεπισκόπηση αλλαγών πριν από την ανάπτυξη
az account show
```

### Σύγκριση Περιβάλλοντων
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

### Συνηθισμένες Μεταβλητές Περιβάλλοντος
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
# Επαναφέρετε την αυθεντικοποίηση
az account clear
az login

# Αναγκάστε την ανανέωση του περιβάλλοντος
azd env refresh

# Αναπτύξτε ξανά όλες τις υπηρεσίες
azd deploy

# Ελέγξτε την κατάσταση ανάπτυξης
azd show --output json
```

### Εντολές Ανάκτησης
```bash
# Ανάκτηση από αποτυχημένη ανάπτυξη - καθαρισμός και επανανάπτυξη
azd down --force --purge
azd up

# Επαναπαροχή μόνο της υποδομής
azd provision

# Επανανάπτυξη μόνο της εφαρμογής
azd deploy
```

## 💡 Συμβουλές για Προχωρημένους

### Ψευδώνυμα για Γρηγορότερη Ροή Εργασίας
```bash
# Προσθέστε το στο .bashrc ή στο .zshrc σας
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Συντομεύσεις Συναρτήσεων
```bash
# Γρήγορη εναλλαγή περιβάλλοντος
azd-env() {
    azd env select $1 && azd show
}

# Γρήγορη ανάπτυξη με παρακολούθηση
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Κατάσταση περιβάλλοντος
azd-status() {
    echo "Current environment:"
    azd env get-values
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

# Βοήθεια για συγκεκριμένες εντολές
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

**Συμβουλή**: Αποθηκεύστε στους σελιδοδείκτες αυτόν τον συνοπτικό οδηγό και χρησιμοποιήστε `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Previous Lesson**: [Έλεγχοι Προετοιμασίας](../docs/pre-deployment/preflight-checks.md)
- **Next Lesson**: [Γλωσσάριο](glossary.md)

---

> **💡 Θέλετε βοήθεια με εντολές Azure στον επεξεργαστή σας;** Install [Δεξιότητες Microsoft Azure Agent](https://skills.sh/microsoft/github-copilot-for-azure) with `npx skills add microsoft/github-copilot-for-azure` — 37 δεξιότητες για AI, Foundry, ανάπτυξη, διαγνωστικά, και άλλα.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, παρακαλούμε να γνωρίζετε ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η επίσημη πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από επαγγελματία μεταφραστή. Δεν ευθυνόμαστε για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->