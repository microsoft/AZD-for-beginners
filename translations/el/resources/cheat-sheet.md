# Κατάλογος Εντολών - Βασικές Εντολές AZD

**Σύντομη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Γρήγορη Εκκίνηση**: [Κεφάλαιο 1: Βάσεις & Γρήγορη Εκκίνηση](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Εντολές AI**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στο AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Για Προχωρημένους**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτός ο ολοκληρωμένος κατάλογος εντολών παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές του Azure Developer CLI, οργανωμένες ανά κατηγορία με πρακτικά παραδείγματα. Ιδανικό για γρήγορες αναζητήσεις κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές εργασίες με έργα azd.

## Στόχοι Μάθησης

Χρησιμοποιώντας αυτόν τον οδηγό, θα:
- Έχετε άμεση πρόσβαση σε βασικές εντολές και σύνταξη του Azure Developer CLI
- Κατανοείτε την οργάνωση εντολών κατά λειτουργικές κατηγορίες και σενάρια χρήσης
- Ανατρέχετε σε πρακτικά παραδείγματα για κοινά σενάρια ανάπτυξης και διάθεσης
- Έχετε στη διάθεσή σας εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση ζητημάτων
- Εντοπίζετε επιλογές προχωρημένης διαμόρφωσης και προσαρμογής με αποδοτικό τρόπο
- Βρίσκετε εντολές διαχείρισης περιβάλλοντος και ροής εργασίας για πολλαπλά περιβάλλοντα

## Μαθησιακά Αποτελέσματα

Με τακτική αναφορά σε αυτόν τον οδηγό, θα μπορείτε να:
- Εκτελείτε εντολές azd με αυτοπεποίθηση χωρίς να συμβουλεύεστε την πλήρη τεκμηρίωση
- Επιλύετε γρήγορα κοινά προβλήματα χρησιμοποιώντας τις κατάλληλες διαγνωστικές εντολές
- Διαχειρίζεστε αποτελεσματικά πολλαπλά περιβάλλοντα και σενάρια ανάπτυξης
- Εφαρμόζετε προχωρημένα χαρακτηριστικά και επιλογές διαμόρφωσης του azd όποτε χρειάζεται
- Αντιμετωπίζετε ζητήματα ανάπτυξης χρησιμοποιώντας συστηματικές ακολουθίες εντολών
- Βελτιστοποιείτε ροές εργασίας μέσω της αποτελεσματικής χρήσης συντομεύσεων και επιλογών του azd

## Εντολές Ξεκινήματος

### Πιστοποίηση
```bash
# Σύνδεση στο Azure μέσω AZD
azd auth login

# Σύνδεση στο Azure CLI (το AZD το χρησιμοποιεί εσωτερικά)
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
# Περιηγηθείτε στα διαθέσιμα πρότυπα
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

### Ολοκληρωμένη Ροή Ανάπτυξης
```bash
# Ανάπτυξη όλων (παροχή πόρων + ανάπτυξη)
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
# Παροχή πόρων του Azure
azd provision

# 🧪 Προεπισκόπηση αλλαγών στην υποδομή
azd provision --preview
# Εμφανίζει μια προσομοιωμένη προεπισκόπηση των πόρων που θα δημιουργηθούν/τροποποιηθούν/διαγραφούν
# Παρόμοιο με το 'terraform plan' ή 'bicep what-if' - ασφαλές για εκτέλεση, δεν εφαρμόζονται αλλαγές
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

### Κατασκευή και Πακετάρισμα
```bash
# Επαναφορά (λήψη) των εξαρτήσεων της εφαρμογής
azd restore

# Επαναφορά συγκεκριμένης υπηρεσίας
azd restore --service api

# Δημιουργία ενός αναπτύξιμου αντικειμένου χωρίς ανάπτυξη
azd package

# Δημιουργία συγκεκριμένης υπηρεσίας
azd package --service api
```

> **`azd restore`** κατεβάζει τις εξαρτήσεις της εφαρμογής σας (npm, pip, NuGet, Maven, κ.λπ.). Εκτελείται αυτόματα κατά τη διάρκεια του `azd package` και του `azd deploy`, οπότε σπάνια το καλείτε απευθείας—τρέξτε το χειροκίνητα για να προ-κατεβάσετε εξαρτήσεις (π.χ. για να ζεστάνετε την cache ενός CI ή να εργαστείτε εκτός σύνδεσης στη συνέχεια).

> **`azd package`** δημιουργεί το αναπτύξιμο αντικείμενο (εικόνα container ή zip) **χωρίς** να το στείλει στο Azure. Χρησιμοποιήστε το μόνο του για να επαληθεύσετε ότι η κατασκευή πετυχαίνει, να εξετάσετε την έξοδο ή να παράγετε ένα αντικείμενο που μια ξεχωριστή διαδικασία θα αναπτύξει αργότερα. Το `azd deploy` πακετάρει αυτόματα, οπότε χρειάζεστε `azd package` μόνο όταν θέλετε το αντικείμενο χωρίς την ανάπτυξη.


## 🌍 Διαχείριση Περιβάλλοντος

### Ενέργειες Περιβάλλοντος
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

# Ανάκτηση μεταβλητής περιβάλλοντος
azd env get API_KEY

# Λίστα όλων των μεταβλητών περιβάλλοντος
azd env get-values

# Κατάργηση μεταβλητής περιβάλλοντος
azd env unset DEBUG
```

## ⚙️ Εντολές Διαμόρφωσης

### Παγκόσμια Διαμόρφωση
```bash
# Εμφάνιση όλων των ρυθμίσεων
azd config show

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
# Επικύρωση azure.yaml
azd config validate

# Εμφάνιση πληροφοριών έργου
azd show

# Λήψη σημείων τερματισμού υπηρεσίας
azd show --output json
```

## 📊 Παρακολούθηση και Διάγνωση

### Πίνακας Παρακολούθησης
```bash
# Άνοιγμα του πίνακα ελέγχου παρακολούθησης της πύλης Azure
azd monitor

# Άνοιγμα των ζωντανών μετρικών του Application Insights
azd monitor --live

# Άνοιγμα της καρτέλας καταγραφών του Application Insights
azd monitor --logs

# Άνοιγμα της επισκόπησης του Application Insights
azd monitor --overview
```

### Προβολή Καταγραφών Container
```bash
# Προβολή αρχείων καταγραφής μέσω Azure CLI (για Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Παρακολούθηση αρχείων καταγραφής σε πραγματικό χρόνο
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Προβολή αρχείων καταγραφής από το Azure Portal
azd monitor --logs
```

### Ερωτήματα Log Analytics
```bash
# Πρόσβαση στο Log Analytics μέσω της πύλης Azure
azd monitor --logs

# Ερωτήματα στα αρχεία καταγραφής χρησιμοποιώντας το Azure CLI
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

# Οριστική διαγραφή των προσωρινά διαγραμμένων πόρων
azd down --purge

# Πλήρης καθαρισμός
azd down --force --purge
```

### Ενημερώσεις
```bash
# Έλεγχος για ενημερώσεις azd
azd version

# Λήψη τρέχουσας έκδοσης
azd version

# Προβολή τρέχουσας διαμόρφωσης
azd config show
```

## 🔧 Προχωρημένες Εντολές

### Pipeline και CI/CD
```bash
# Ρύθμιση των GitHub Actions
azd pipeline config

# Ρύθμιση του Azure DevOps
azd pipeline config --provider azdo

# Εμφάνιση της διαμόρφωσης του pipeline
azd pipeline show
```

### Διαχείριση Υποδομής
```bash
# Δημιουργία προτύπων υποδομής
azd infra generate

# 🧪 Προεπισκόπηση και Σχεδιασμός Υποδομής
azd provision --preview
# Προσομοιώνει την παροχή υποδομής χωρίς πραγματική ανάπτυξη
# Αναλύει πρότυπα Bicep/Terraform και εμφανίζει:
# - Πόροι προς προσθήκη (πράσινο +)
# - Πόροι προς τροποποίηση (κίτρινο ~)
# - Πόροι προς διαγραφή (κόκκινο -)
# Ασφαλές για εκτέλεση - δεν γίνονται πραγματικές αλλαγές στο περιβάλλον Azure

# Συνθέτει υποδομή από azure.yaml
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

## 🤖 Εντολές AI & Επεκτάσεων

### Επεκτάσεις AZD
```bash
# Καταγράψτε όλες τις διαθέσιμες επεκτάσεις (συμπεριλαμβανομένης της Τεχνητής Νοημοσύνης)
azd extension list

# Εγκαταστήστε την επέκταση Foundry Agents
azd extension install azure.ai.agents

# Εγκαταστήστε την επέκταση Agent Skills (προεπισκόπηση)
azd extension install azure.ai.skills

# Εγκαταστήστε την επέκταση Foundry Connections (προεπισκόπηση)
azd extension install azure.ai.connections

# Εγκαταστήστε την επέκταση fine-tuning
azd extension install azure.ai.finetune

# Εγκαταστήστε την επέκταση Custom Models
azd extension install azure.ai.models

# Αναβαθμίστε όλες τις εγκατεστημένες επεκτάσεις
azd extension upgrade --all
```

### Εντολές Πράκτορα AI
```bash
# Αρχικοποιήστε ένα έργο agent από ένα manifest
azd ai agent init -m <manifest-path-or-uri>

# Στοχεύστε ένα συγκεκριμένο έργο Foundry
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Καθορίστε τον κατάλογο πηγαίου κώδικα του agent
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Επιλέξτε στόχο φιλοξενίας
azd ai agent init -m agent-manifest.yaml --host containerapp

# Δοκιμάστε έναν αναπτυγμένο agent (εκτυπώνει καθυστέρηση + χρόνο έως το πρώτο byte)
azd ai agent invoke

# Εμφανίστε τη διαμόρφωση του ζωντανού endpoint
azd ai agent endpoint show

# Δημιουργήστε ένα σύνολο δεδομένων αξιολόγησης, στη συνέχεια βελτιστοποιήστε τον agent
azd ai agent eval generate
azd ai agent optimize

# Κατεβάστε τον αναπτυγμένο πηγαίο κώδικα ενός φιλοξενούμενου agent που είναι βασισμένος σε κώδικα
azd ai agent code download

# Διαγράψτε έναν φιλοξενούμενο agent και όλες τις εκδόσεις του (--force τερματίζει τις ενεργές συνεδρίες)
azd ai agent delete --force
```

### Διακομιστής MCP (Alpha)
```bash
# Εκκινήστε τον διακομιστή MCP για το έργο σας
azd mcp start

# Διαχειριστείτε τη συναίνεση εργαλείου για τις λειτουργίες MCP
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

### Ροή Ανάπτυξης
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

### Ροή για Πολλαπλά Περιβάλλοντα
```bash
# Ρύθμιση περιβαλλόντων
azd env new dev
azd env new staging  
azd env new production

# Ανάπτυξη στο περιβάλλον ανάπτυξης
azd env select dev
azd up

# Δοκιμή και προώθηση στο περιβάλλον staging
azd env select staging
azd up

# Ανάπτυξη στο περιβάλλον παραγωγής
azd env select production
azd up
```

### Ροή Αντιμετώπισης Προβλημάτων
```bash
# Ενεργοποίηση λειτουργίας εντοπισμού σφαλμάτων
export AZD_DEBUG=true

# Έλεγχος κατάστασης ανάπτυξης
azd show

# Επικύρωση διαμόρφωσης
azd config show

# Άνοιγμα πίνακα ελέγχου παρακολούθησης για τα αρχεία καταγραφής
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
azd config show

# Έλεγχος κατάστασης αυθεντικοποίησης
az account show
```

### Αποσφαλμάτωση Προτύπων
```bash
# Εμφάνιση διαθέσιμων προτύπων με λεπτομέρειες
azd template list --output json

# Εμφάνιση πληροφοριών προτύπου
azd template show <template-name>

# Επικύρωση προτύπου πριν από την αρχικοποίηση
azd template validate <template-name>
```

## 📁 Εντολές Αρχείων και Καταλόγων

### Δομή Έργου
```bash
# Εμφάνιση τρέχουσας δομής καταλόγου
tree /f  # Windows
find . -type f  # Linux/macOS

# Μεταβείτε στη ρίζα του έργου azd
cd $(azd root)

# Εμφάνιση καταλόγου διαμόρφωσης του azd
echo $AZD_CONFIG_DIR  # Συνήθως ~/.azd
```

## 🎨 Μορφοποίηση Εξόδου

### Έξοδος JSON
```bash
# Λάβετε έξοδο JSON για χρήση σε σενάρια
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

### Επαλήθευση Ανάπτυξης
```bash
#!/bin/bash
# Επαλήθευση πριν από την ανάπτυξη
azd show
azd provision --preview  # Προεπισκόπηση αλλαγών πριν από την ανάπτυξη
az account show
```

### Σύγκριση Περιβάλλοντος
```bash
#!/bin/bash
# Σύγκριση περιβαλλόντων
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Σενάριο Εκκαθάρισης Πόρων
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

## 🚨 Εντολές Έκτακτης Ανάγκης

### Γρήγορες Διορθώσεις
```bash
# Επαναφορά αυθεντικοποίησης
az account clear
az login

# Αναγκαστική ανανέωση περιβάλλοντος
azd env refresh

# Επαναανάπτυξη όλων των υπηρεσιών
azd deploy

# Έλεγχος κατάστασης ανάπτυξης
azd show --output json
```

### Εντολές Αποκατάστασης
```bash
# Ανάκτηση από αποτυχημένη ανάπτυξη - καθαρισμός και επανανάπτυξη
azd down --force --purge
azd up

# Μόνο επαναπαροχή της υποδομής
azd provision

# Μόνο επανανάπτυξη της εφαρμογής
azd deploy
```

## 💡 Συμβουλές Επαγγελματιών

### Συντομεύσεις (aliases) για Γρηγορότερη Ροή Εργασίας
```bash
# Προσθέστε το στο .bashrc ή .zshrc σας
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Συντομεύσεις Συναρτήσεων
```bash
# Γρήγορη εναλλαγή περιβαλλόντων
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

**Συμβουλή**: Αποθηκεύστε σε σελιδοδείκτη αυτόν τον κατάλογο εντολών και χρησιμοποιήστε `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Έλεγχοι Προ-ανάπτυξης](../docs/pre-deployment/preflight-checks.md)
- **Επόμενο Μάθημα**: [Γλωσσάριο](glossary.md)

---

> **💡 Θέλετε βοήθεια με εντολές Azure στο επεξεργαστή σας;** Εγκαταστήστε [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) με `npx skills add microsoft/github-copilot-for-azure` — 37 δεξιότητες για AI, Foundry, ανάπτυξη, διαγνωστικά και άλλα.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->