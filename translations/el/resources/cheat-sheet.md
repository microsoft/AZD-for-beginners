# Συντομεύσεις Εντολών - Βασικές Εντολές AZD

**Γρήγορη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Γρήγορη Εκκίνηση**: [Κεφάλαιο 1: Θεμέλια & Γρήγορη Εκκίνηση](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Εντολές ΤΝ**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην ΤΝ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Προχωρημένα**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτό το ολοκληρωμένο φύλλο αναφοράς παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές του Azure Developer CLI, οργανωμένες κατά κατηγορία με πρακτικά παραδείγματα. Ιδανικό για γρήγορες αναζητήσεις κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές εργασίες με έργα azd.

## Στόχοι Μάθησης

Χρησιμοποιώντας αυτό το φύλλο αναφοράς, θα:
- Έχετε άμεση πρόσβαση στις βασικές εντολές και τη σύνταξη του Azure Developer CLI
- Κατανοήσετε την οργάνωση εντολών κατά λειτουργικές κατηγορίες και περιπτώσεις χρήσης
- Ανατρέξετε σε πρακτικά παραδείγματα για κοινά σενάρια ανάπτυξης και διάθεσης
- Πρόσβαση σε εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση θεμάτων
- Εντοπίσετε επιλογές για προηγμένη διαμόρφωση και προσαρμογή αποδοτικά
- Βρείτε εντολές διαχείρισης περιβαλλόντων και ροών εργασίας πολλαπλών περιβαλλόντων

## Αποτελέσματα Μάθησης

Με τακτική αναφορά σε αυτό το φύλλο αναφοράς, θα είστε σε θέση να:
- Εκτελέσετε εντολές azd με αυτοπεποίθηση χωρίς να ανατρέχετε στην πλήρη τεκμηρίωση
- Επιδιορθώσετε γρήγορα κοινά προβλήματα χρησιμοποιώντας τις κατάλληλες διαγνωστικές εντολές
- Διαχειριστείτε αποτελεσματικά πολλαπλά περιβάλλοντα και σενάρια διάθεσης
- Εφαρμόσετε προηγμένες δυνατότητες azd και επιλογές διαμόρφωσης καθώς χρειάζεται
- Αντιμετωπίσετε προβλήματα διάθεσης χρησιμοποιώντας συστηματικές ακολουθίες εντολών
- Βελτιστοποιήσετε ροές εργασίας μέσω της αποτελεσματικής χρήσης συντομεύσεων και επιλογών του azd

## Εντολές Έναρξης

### Πιστοποίηση
```bash
# Συνδεθείτε στο Azure μέσω AZD
azd auth login

# Συνδεθείτε στο Azure CLI (το AZD το χρησιμοποιεί στο παρασκήνιο)
az login

# Ελέγξτε τον τρέχοντα λογαριασμό
az account show

# Ορίστε την προεπιλεγμένη συνδρομή
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Αποσυνδεθείτε από το AZD
azd auth logout

# Αποσυνδεθείτε από το Azure CLI
az logout
```

### Αρχικοποίηση Έργου
```bash
# Περιήγηση στα διαθέσιμα πρότυπα
azd template list

# Αρχικοποίηση από πρότυπο
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Αρχικοποίηση στον τρέχοντα κατάλογο
azd init .

# Αρχικοποίηση με προσαρμοσμένο όνομα
azd init --template todo-nodejs-mongo my-awesome-app
```

## Κύριες Εντολές Διάθεσης

### Πλήρης Ροή Εργασίας Διάθεσης
```bash
# Ανάπτυξη όλων (παροχή + ανάπτυξη)
azd up

# Ανάπτυξη με απενεργοποιημένες τις προτροπές επιβεβαίωσης
azd up --confirm-with-no-prompt

# Ανάπτυξη σε συγκεκριμένο περιβάλλον
azd up --environment production

# Ανάπτυξη με προσαρμοσμένες παραμέτρους
azd up --parameter location=westus2
```

### Μόνο Υποδομή
```bash
# Παροχή πόρων στο Azure
azd provision

# 🧪 Προεπισκόπηση αλλαγών υποδομής
azd provision --preview
# Εμφανίζει μια προβολή dry-run των πόρων που θα δημιουργηθούν/τροποποιηθούν/διαγραφούν
# Παρόμοιο με 'terraform plan' ή 'bicep what-if' - ασφαλές για εκτέλεση, δεν εφαρμόζονται αλλαγές
```

### Μόνο Εφαρμογή
```bash
# Αναπτύξτε τον κώδικα της εφαρμογής
azd deploy

# Αναπτύξτε συγκεκριμένη υπηρεσία
azd deploy --service web
azd deploy --service api

# Αναπτύξτε όλες τις υπηρεσίες
azd deploy --all
```

### Κατασκευή και Συσκευασία
```bash
# Δημιουργία εφαρμογών
azd package

# Δημιουργία συγκεκριμένης υπηρεσίας
azd package --service api
```

## 🌍 Διαχείριση Περιβαλλόντων

### Ενέργειες Περιβάλλοντος
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

# Κατάργηση μεταβλητής περιβάλλοντος
azd env unset DEBUG
```

## ⚙️ Εντολές Διαμόρφωσης

### Παγκόσμια Διαμόρφωση
```bash
# Κατάλογος όλων των ρυθμίσεων
azd config list

# Ορισμός παγκόσμιων προεπιλογών
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Αφαίρεση ρύθμισης
azd config unset defaults.location

# Επαναφορά όλων των ρυθμίσεων
azd config reset
```

### Διαμόρφωση Έργου
```bash
# Επαλήθευση του azure.yaml
azd config validate

# Εμφάνιση πληροφοριών έργου
azd show

# Λήψη τελικών σημείων υπηρεσιών
azd show --output json
```

## 📊 Παρακολούθηση και Διαγνωστικά

### Πίνακας Παρακολούθησης
```bash
# Άνοιγμα του πίνακα ελέγχου παρακολούθησης στο Azure portal
azd monitor

# Άνοιγμα ζωντανών μετρικών του Application Insights
azd monitor --live

# Άνοιγμα του παραθύρου καταγραφών του Application Insights
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

# Αναγκαστική διαγραφή χωρίς επιβεβαίωση
azd down --force

# Μόνιμη διαγραφή προσωρινά διαγραμμένων πόρων
azd down --purge

# Πλήρης εκκαθάριση
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

## 🔧 Προηγμένες Εντολές

### Pipeline και CI/CD
```bash
# Ρύθμιση του GitHub Actions
azd pipeline config

# Ρύθμιση του Azure DevOps
azd pipeline config --provider azdo

# Εμφάνιση της διαμόρφωσης του pipeline
azd pipeline show
```

### Διαχείριση Υποδομής
```bash
# Δημιουργήστε προτύπα υποδομής
azd infra generate

# 🧪 Προεπισκόπηση & Σχεδιασμός υποδομής
azd provision --preview
# Προσομοιώνει την παροχή υποδομής χωρίς ανάπτυξη
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

# Εμφάνιση λεπτομερών πληροφοριών έργου σε μορφή JSON
azd show --output json

# Λήψη σημείων τερματισμού υπηρεσίας
azd show --output json | jq '.services'
```

## 🤖 Εντολές ΤΝ & Επεκτάσεις

### Επεκτάσεις AZD
```bash
# Καταγράψτε όλες τις διαθέσιμες επεκτάσεις (συμπεριλαμβανομένης της τεχνητής νοημοσύνης)
azd extension list

# Εγκαταστήστε την επέκταση Foundry agents
azd extension install azure.ai.agents

# Εγκαταστήστε την επέκταση fine-tuning
azd extension install azure.ai.finetune

# Εγκαταστήστε την επέκταση προσαρμοσμένων μοντέλων
azd extension install azure.ai.models

# Αναβαθμίστε όλες τις εγκατεστημένες επεκτάσεις
azd extension upgrade --all
```

### Εντολές Πρακτόρων ΤΝ
```bash
# Αρχικοποιήστε ένα έργο πράκτορα από ένα μανιφέστο
azd ai agent init -m <manifest-path-or-uri>

# Στοχεύστε σε ένα συγκεκριμένο έργο Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Καθορίστε τον φάκελο πηγής του πράκτορα
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Επιλέξτε έναν στόχο φιλοξενίας
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP Server (Alpha)
```bash
# Ξεκινήστε τον διακομιστή MCP για το έργο σας
azd mcp start

# Διαχειριστείτε τη συγκατάθεση εργαλείου για τις λειτουργίες MCP
azd mcp consent
```

### Δημιουργία Υποδομής
```bash
# Δημιουργήστε αρχεία IaC από τον ορισμό του έργου σας
azd infra generate

# Συνθέστε υποδομή από το αρχείο azure.yaml
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

# Κάντε αλλαγές και αναπτύξτε ξανά
azd deploy

# Ανοίξτε τον πίνακα ελέγχου παρακολούθησης
azd monitor --live
```

### Ροή Εργασίας Πολλαπλών Περιβαλλόντων
```bash
# Ρύθμιση περιβαλλόντων
azd env new dev
azd env new staging  
azd env new production

# Ανάπτυξη στο dev
azd env select dev
azd up

# Δοκιμή και προώθηση στο περιβάλλον staging
azd env select staging
azd up

# Ανάπτυξη στην παραγωγή
azd env select production
azd up
```

### Ροή Εργασίας Αντιμετώπισης Προβλημάτων
```bash
# Ενεργοποίηση λειτουργίας αποσφαλμάτωσης
export AZD_DEBUG=true

# Έλεγχος κατάστασης ανάπτυξης
azd show

# Επικύρωση διαμόρφωσης
azd config list

# Άνοιγμα πίνακα παρακολούθησης για αρχεία καταγραφής
azd monitor --logs

# Έλεγχος κατάστασης πόρων
azd show --output json
```

## 🔍 Εντολές Αποσφαλμάτωσης

### Πληροφορίες Αποσφαλμάτωσης
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

### Αποσφαλμάτωση Προτύπου
```bash
# Εμφάνιση διαθέσιμων προτύπων με λεπτομέρειες
azd template list --output json

# Εμφάνιση πληροφοριών προτύπου
azd template show <template-name>

# Επικύρωση προτύπου πριν την αρχικοποίηση
azd template validate <template-name>
```

## 📁 Εντολές Αρχείων και Καταλόγων

### Δομή Έργου
```bash
# Εμφάνιση της τρέχουσας δομής καταλόγων
tree /f  # Windows
find . -type f  # Linux/macOS

# Μεταβείτε στη ρίζα του έργου azd
cd $(azd root)

# Εμφάνιση του καταλόγου διαμόρφωσης του azd
echo $AZD_CONFIG_DIR  # Συνήθως ~/.azd
```

## 🎨 Μορφοποίηση Έξοδου

### Έξοδος JSON
```bash
# Λάβετε έξοδο JSON για χρήση σε σενάρια
azd show --output json
azd env list --output json
azd config list --output json

# Αναλύστε με jq
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

## 🔧 Συνηθισμένοι Συνδυασμοί Εντολών

### Σενάριο Έλεγχου Κατάστασης
```bash
#!/bin/bash
# Γρήγορος έλεγχος υγείας
azd show
azd env show
azd monitor --logs
```

### Επικύρωση Διάθεσης
```bash
#!/bin/bash
# Επικύρωση πριν την ανάπτυξη
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
# Καθαρίστε τα παλιά περιβάλλοντα
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

# Αναγκαστική ανανέωση περιβάλλοντος
azd env refresh

# Επαναπτύξτε όλες τις υπηρεσίες
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

## 💡 Συμβουλές Επαγγελματιών

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

# Ειδική βοήθεια για εντολές
azd up --help
azd env --help
azd config --help

# Εμφάνιση πληροφοριών έκδοσης και κατασκευής
azd version
azd version --output json
```

### Σύνδεσμοι Τεκμηρίωσης
```bash
# Άνοιγμα τεκμηρίωσης στον περιηγητή
azd docs

# Εμφάνιση τεκμηρίωσης προτύπου
azd template show <template-name> --docs
```

---

**Συμβουλή**: Αποθηκεύστε σε σελιδοδείκτη αυτό το φύλλο αναφοράς και χρησιμοποιήστε `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Έλεγχοι Προετοιμασίας](../docs/pre-deployment/preflight-checks.md)
- **Επόμενο Μάθημα**: [Γλωσσάρι](glossary.md)

---

> **💡 Θέλετε βοήθεια με εντολές Azure στον επεξεργαστή σας;** Εγκαταστήστε [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) με `npx skills add microsoft/github-copilot-for-azure` — 37 δεξιότητες για ΤΝ, Foundry, διάθεση, διαγνωστικά και άλλα.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρόλο που επιδιώκουμε την ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στην πρωτότυπη γλώσσα του πρέπει να θεωρείται ως η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική, ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->