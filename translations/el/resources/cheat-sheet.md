# Φύλλο Απάτης Εντολών - Βασικές Εντολές AZD

**Γρήγορη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Γρήγορη Εκκίνηση**: [Κεφάλαιο 1: Θεμέλια & Γρήγορη Εκκίνηση](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Εντολές Τεχνητής Νοημοσύνης**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα στην ΤΝ](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Προχωρημένα**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτό το ολοκληρωμένο φύλλο απάτης παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές Azure Developer CLI, οργανωμένες κατά κατηγορία με πρακτικά παραδείγματα. Ιδανικό για γρήγορη αναζήτηση κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές λειτουργίες με έργα azd.

## Στόχοι Μάθησης

Χρησιμοποιώντας αυτό το φύλλο απάτης, θα:
- Έχετε άμεση πρόσβαση σε βασικές εντολές και σύνταξη Azure Developer CLI
- Κατανοείτε την οργάνωση εντολών κατά λειτουργικές κατηγορίες και περιπτώσεις χρήσης
- Ανατρέχετε σε πρακτικά παραδείγματα για κοινά σενάρια ανάπτυξης και παράδοσης
- Έχετε πρόσβαση σε εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση ζητημάτων
- Βρίσκετε αποδοτικά προχωρημένες επιλογές διαμόρφωσης και προσαρμογής
- Εντοπίζετε εντολές διαχείρισης περιβάλλοντος και ροές εργασίας πολλαπλών περιβαλλόντων

## Αποτελέσματα Μάθησης

Με τακτική αναφορά σε αυτό το φύλλο απάτης, θα μπορείτε:
- Να εκτελείτε εντολές azd με σιγουριά χωρίς να ανατρέχετε στην πλήρη τεκμηρίωση
- Να επιλύετε γρήγορα κοινά προβλήματα χρησιμοποιώντας κατάλληλες διαγνωστικές εντολές
- Να διαχειρίζεστε αποδοτικά πολλαπλά περιβάλλοντα και σενάρια ανάπτυξης
- Να εφαρμόζετε προχωρημένες λειτουργίες και επιλογές διαμόρφωσης azd ανάλογα με τις ανάγκες
- Να αντιμετωπίζετε προβλήματα ανάπτυξης χρησιμοποιώντας συστηματικές αλληλουχίες εντολών
- Να βελτιστοποιείτε ροές εργασίας μέσω αποτελεσματικής χρήσης συντομεύσεων και επιλογών azd

## Εντολές Έναρξης

### Πιστοποίηση
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Αρχικοποίηση Έργου
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Κύριες Εντολές Ανάπτυξης

### Πλήρης Ροή Ανάπτυξης
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Μόνο Υποδομή
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Μόνο Εφαρμογή
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Κατασκευή και Συσκευασία
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** κατεβάζει τις εξαρτήσεις της εφαρμογής σας (npm, pip, NuGet, Maven, κ.ά.). Εκτελείται αυτόματα κατά τη `azd package` και `azd deploy`, οπότε σπάνια την καλείτε απευθείας — εκτελέστε την χειροκίνητα για να προ-φορτώσετε τις εξαρτήσεις (για παράδειγμα, για να ζεστάνετε μια cache CI ή να εργαστείτε εκτός σύνδεσης μετά).

> **`azd package`** προετοιμάζει ένα αναπτυσσόμενο αρχείο χωρίς να προωθεί την υπηρεσία εφαρμογής. Η συμπεριφορά εξαρτάται από τη γλώσσα και τον κεντρικό υπολογιστή: η συσκευασία container μπορεί να χρησιμοποιεί απομακρυσμένες κατασκευές Azure και να δημοσιεύει εικόνες σε ρετζίστρι, οπότε δεν είναι απαραίτητα εκτός σύνδεσης ή χωρίς εγγραφές στο Azure. Η `azd deploy` μπορεί να συσκευάζει αυτόματα· χρησιμοποιήστε ξεχωριστό βήμα συσκευασίας όταν χρειάζεστε αρχείο ή έλεγχο κατασκευής.


## 🌍 Διαχείριση Περιβάλλοντος

### Λειτουργίες Περιβάλλοντος
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Μεταβλητές Περιβάλλοντος
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

Τα αρχεία περιβάλλοντος είναι απλό κείμενο. Μην θεωρείτε την `azd env set` αποθήκη μυστικών· χρησιμοποιήστε αναφορές Key Vault ή διαχειριζόμενη ταυτότητα όπου απαιτείται.

## ⚙️ Εντολές Διαμόρφωσης

### Παγκόσμια Διαμόρφωση
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Διαμόρφωση Έργου
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Παρακολούθηση και Διαγνωστικά

### Πίνακας Ελέγχου Παρακολούθησης
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

Το Application Insights πρέπει να διαμορφωθεί από το πρότυπο. Η επιλογή Live Metrics της AZD δεν υποστηρίζεται προς το παρόν για εφαρμογές Python· χρησιμοποιήστε την επισκόπηση, τα αρχεία καταγραφής ή την τεκμηριωμένη ροή εργασίας ιχνηλάτησης του δείγματος αντ’ αυτού.

### Προβολή Αρχείων Καταγραφής Container
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Ερωτήματα Log Analytics
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Εντολές Συντήρησης

### Εκκαθάριση
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Ενημερώσεις
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Προχωρημένες Εντολές

### Pipeline και CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Διαχείριση Υποδομής
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Πληροφορίες Έργου
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 Εντολές ΤΝ & Επεκτάσεις

### Επεκτάσεις AZD

Αναφορά CLI ΤΝ ελέγχθηκε 2026-11-04: `azd 1.37.2`, agents `1.0.0-beta.23`, αξιολογήσεις `1.0.0-beta.2`. Χρησιμοποιήστε `azd >= 1.37.0` για την ενιαία ροή εργασίας· αναβαθμίστε τον πυρήνα CLI πριν από μη συμβατές επεκτάσεις.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### Εντολές Agent ΤΝ
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` αντικαθιστά την αποσυρμένη ορθογραφία `--manifest`/`-m`· τα παλιά manifests χρειάζονται μετανάστευση. Δεν υπάρχει τωρινή επιλογή agent-init `--host containerapp`. Οι managed-harness, voice, και μακροχρόνιες προεπισκοπήσεις απαιτούν ανεξάρτητα αποδοχή στο shell/περιβάλλον CI· δείτε την [αναφορά AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### Αξιολογήσεις και Βελτιστοποίηση ΤΝ
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agents beta.22 αντικατέστησε τις παλιές εντολές αξιολόγησης με `azd ai eval` από `azure.ai.evaluations`. Η νέα διαμόρφωση αξιολόγησης χρησιμοποιεί κλειδιά camelCase. Η βελτιστοποίηση `--config` απαιτεί ανεξάρτητο αίτημα API βελτιστοποίησης, **όχι** παλιό `eval.yaml` ή νέο `azure.eval.yaml`· χρησιμοποιήστε `--eval`/`--eval-config` για επανάχρηση αξιολόγησης. Δείτε [ρύθμιση αξιολόγησης](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) και [μετανάστευση βελτιστοποίησης](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP Server (Άλφα)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Δημιουργία Υποδομής
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Γρήγορες Ροές Εργασίας

### Ροή Εργασίας Ανάπτυξης
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### Ροή Εργασίας Πολλαπλών Περιβαλλόντων
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Ροή Εργασίας Αντιμετώπισης Προβλημάτων
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Εντολές Αποσφαλμάτωσης

### Πληροφορίες Αποσφαλμάτωσης
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Αποσφαλμάτωση Προτύπου
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Εντολές Αρχείων και Καταλόγων

### Δομή Έργου
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Μορφοποίηση Εξόδου

### Έξοδος JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Έξοδος Πίνακα
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Κοινά Συνδυασμοί Εντολών

### Σενάριο Έλεγχου Υγείας
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Επικύρωση Ανάπτυξης
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Σύγκριση Περιβάλλοντος
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Σενάριο Εκκαθάρισης Πόρων
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Μεταβλητές Περιβάλλοντος

### Κοινές Μεταβλητές Περιβάλλοντος
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Εντολές Έκτακτης Ανάγκης

### Γρήγορες Διορθώσεις
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Εντολές Ανάκτησης
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Επαγγελματικές Συμβουλές

### Συντομεύσεις για Ταχύτερη Ροή Εργασίας
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Συντομεύσεις Λειτουργιών
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
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
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Σύνδεσμοι Τεκμηρίωσης
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Συμβουλή**: Σελιδοδείκτης αυτό το φύλλο απάτης και χρησιμοποιήστε `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Προέλεγχοι](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Επόμενο Μάθημα**: [Γλωσσάριο](glossary.md)

---

> **💡 Θέλετε βοήθεια εντολών Azure στον επεξεργαστή σας;** Εγκαταστήστε τα [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) με `npx skills add microsoft/github-copilot-for-azure` — 37 δεξιότητες για ΤΝ, Foundry, ανάπτυξη, διαγνωστικά, και άλλα.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->