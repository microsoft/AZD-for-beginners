# Συντομευμένος Οδηγός Εντολών - Απαραίτητες Εντολές AZD

**Γρήγορη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Γρήγορη Εκκίνηση**: [Κεφάλαιο 1: Βάση & Γρήγορη Εκκίνηση](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Εντολές Τεχνητής Νοημοσύνης**: [Κεφάλαιο 2: Ανάπτυξη AI-First](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Προχωρημένα**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές Azure Developer CLI, οργανωμένες κατά κατηγορία με πρακτικά παραδείγματα. Ιδανικός για γρήγορη αναζήτηση κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές λειτουργίες με έργα azd.

## Στόχοι Μάθησης

Χρησιμοποιώντας αυτόν τον οδηγό, θα:
- Έχετε άμεση πρόσβαση σε ουσιώδεις εντολές και σύνταξη του Azure Developer CLI
- Κατανοήσετε την οργάνωση εντολών κατά λειτουργικές κατηγορίες και περιπτώσεις χρήσης
- Ανατρέξετε σε πρακτικά παραδείγματα για συνήθη σενάρια ανάπτυξης και εγκατάστασης
- Έχετε πρόσβαση σε εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση ζητημάτων
- Βρείτε αποδοτικά προχωρημένες επιλογές ρύθμισης και προσαρμογής
- Εντοπίσετε εντολές διαχείρισης περιβάλλοντος και ροής εργασίας πολλαπλών περιβαλλόντων

## Αποτελέσματα Μάθησης

Με τακτική αναφορά σε αυτόν τον οδηγό, θα είστε σε θέση να:
- Εκτελείτε εντολές azd με σιγουριά χωρίς να ανατρέχετε σε ολόκληρη την τεκμηρίωση
- Επίλυση γρήγορων συνηθισμένων προβλημάτων με κατάλληλες διαγνωστικές εντολές
- Διαχειρίζεστε αποτελεσματικά πολλαπλά περιβάλλοντα και σενάρια ανάπτυξης
- Εφαρμόζετε προχωρημένες λειτουργίες azd και επιλογές ρύθμισης κατά περίπτωση
- Αντιμετωπίζετε προβλήματα εγκατάστασης με συστηματικές ακολουθίες εντολών
- Βελτιστοποιείτε ροές εργασίας με αποτελεσματική χρήση συντομεύσεων και επιλογών azd

## Εντολές Ξεκινήματος

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

### Κατασκευή και Πακετάρισμα
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

> **`azd restore`** κατεβάζει τις εξαρτήσεις της εφαρμογής σας (npm, pip, NuGet, Maven, κ.ά.). Εκτελείται αυτόματα κατά τη διάρκεια `azd package` και `azd deploy`, οπότε σπάνια το καλείτε απευθείας—τρέξτε το χειροκίνητα για προφόρτωση εξαρτήσεων (π.χ. για ζέσταμα cache CI ή για εργασία εκτός σύνδεσης αργότερα).

> **`azd package`** προετοιμάζει ένα αναπτυξιμο αρτίφακτ χωρίς να αναπτύσσει την υπηρεσία εφαρμογής. Η συμπεριφορά εξαρτάται από τη γλώσσα και τον οικοδεσπότη: το πακετάρισμα container μπορεί να χρησιμοποιεί απομακρυσμένες κατασκευές Azure και να δημοσιεύει εικόνες σε registry, οπότε δεν είναι αναγκαστικά offline ή χωρίς εγγραφές στο Azure. Το `azd deploy` μπορεί να πακετάρει αυτόματα· χρησιμοποιήστε ξεχωριστό βήμα πακεταρίσματος όταν χρειάζεστε αρτίφακτ ή έλεγχο κατασκευής.


## 🌍 Διαχείριση Περιβάλλοντος

### Ενέργειες Περιβάλλοντος
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

Τα αρχεία περιβάλλοντος είναι απλό κείμενο. Μην αντιμετωπίζετε το `azd env set` ως αποθήκη μυστικών· χρησιμοποιήστε αναφορές Key Vault ή managed identity όπου απαιτείται.

## ⚙️ Εντολές Ρύθμισης

### Παγκόσμια Ρύθμιση
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

### Ρύθμιση Έργου
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Παρακολούθηση και Διάγνωση

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

Το Application Insights πρέπει να έχει ρυθμιστεί από το πρότυπο. Η επιλογή Live Metrics του AZD δεν υποστηρίζεται προς το παρόν για εφαρμογές Python· χρησιμοποιήστε την επισκόπηση, τα logs, ή την τεκμηριωμένη ροή εργασίας ιχνών του δείγματος αντ' αυτού.

### Προβολή Καταγραφών Container
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

### Καθαρισμός
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

## 🤖 Εντολές AI & Επεκτάσεις

### Επεκτάσεις AZD

Αναφορά Foundry GA ενημερώθηκε 2026-11-09: `microsoft.foundry` bundle 1.0, ανακοινώθηκε [5 Νοεμβρίου 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Χρησιμοποιήστε `azd >= 1.37.0`· τα συστατικά έχουν ανεξάρτητη έκδοση και οι προαιρετικές λειτουργίες preview διατηρούν τη δική τους κατάσταση.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Το bundle δεν περιλαμβάνει αξιολογήσεις, σύνολα δεδομένων, fine-tuning ή προσαρμοσμένα μοντέλα. Η εγκατάσταση μεμονωμένων βασικών επεκτάσεων εξακολουθεί να υποστηρίζεται. Ακολουθήστε το [GA hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) για ένα εκτελέσιμο παράδειγμα με Python 3.13+, τρέχον uv, δικαιώματα και όριο μοντέλου.

### Εντολές AI Agent
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` αντικαθιστά την παρωχημένη ορθογραφία `--manifest`/`-m`· οι παλιοί manifests χρειάζονται μετανάστευση. Δεν υπάρχει τρέχουσα επιλογή agent-init `--host containerapp`. Οι managed-harness, voice και long-running previews χρειάζονται ανεξάρτητη επιλογή shell/CI περιβάλλοντος· δείτε την [αναφορά AI CLI](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Οι τοπικές δοκιμές εξακολουθούν να χρησιμοποιούν αναπτύξεις μοντέλων Azure και επιφέρουν χρεώσεις. Για καθαρισμό, `azd down` διαγράφει το νεοδημιουργημένο Foundry project resource group, αλλά αφήνει πόρους επαναχρησιμοποιούμενων έργων ανέπαφους· αφαιρέστε μόνο ανεπιθύμητους πόρους που σας ανήκουν ξεχωριστά.

### Αξιολογήσεις και Βελτιστοποίηση AI
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Οι Agents beta.22 αντικατέστησαν τις παλιές εντολές αξιολόγησης με `azd ai eval` από `azure.ai.evaluations`. Η νέα ρύθμιση αξιολόγησης χρησιμοποιεί camelCase κλειδιά. Η βελτιστοποίηση `--config` παίρνει ανεξάρτητο αίτημα optimization API, **όχι** τις παλιές `eval.yaml` ή νέες `azure.eval.yaml`· χρησιμοποιήστε `--eval`/`--eval-config` για επαναχρησιμοποίηση αξιολόγησης. Δείτε [ρύθμιση αξιολόγησης](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) και [μετανάστευση βελτιστοποίησης](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

Το κομμάτι runner δεν αποτελεί ολοκληρωμένη ροή εργασίας. Κάντε commit την αξιολόγηση ρύθμισης που έχει ελεγχθεί και μη μυστικά στοιχεία, παραχωρήστε πρόσβαση σε dataset/evaluator/model και χρησιμοποιήστε ένα περιβάλλον ανά στάδιο. Δείτε το [παράδειγμα authenticated CI/CD](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

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

### Ροή Ανάπτυξης
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

### Ροή Πολλαπλών Περιβαλλόντων
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

### Ροή Αντιμετώπισης Προβλημάτων
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

## 🔧 Συνδυασμοί Συνηθισμένων Εντολών

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

### Σενάριο Καθαρισμού Πόρων
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Μεταβλητές Περιβάλλοντος

### Συνήθεις Μεταβλητές Περιβάλλοντος
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

### Ψευδώνυμα για Γρηγορότερη Ροή Εργασίας
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

**Συμβουλή**: Αγαπημένο αυτόν τον οδηγό και χρησιμοποιήστε `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Preflight Checks](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Επόμενο Μάθημα**: [Γλωσσάριο](glossary.md)

---

> **💡 Θέλετε βοήθεια εντολών Azure στον επεξεργαστή σας;** Εγκαταστήστε [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) με `npx skills add microsoft/github-copilot-for-azure` — 37 δεξιότητες για AI, Foundry, ανάπτυξη, διαγνωστικά και άλλα.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->