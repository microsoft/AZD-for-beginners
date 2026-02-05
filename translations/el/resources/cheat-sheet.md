# Φυλλάδιο Εντολών - Βασικές Εντολές AZD

**Γρήγορη Αναφορά για Όλα τα Κεφάλαια**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../README.md)
- **📖 Γρήγορη Εκκίνηση**: [Κεφάλαιο 1: Βάση & Γρήγορη Εκκίνηση](../README.md#-chapter-1-foundation--quick-start)
- **🤖 Εντολές AI**: [Κεφάλαιο 2: Ανάπτυξη με Προτεραιότητα AI](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Προχωρημένο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Εισαγωγή

Αυτό το ολοκληρωμένο φυλλάδιο παρέχει γρήγορη αναφορά για τις πιο συχνά χρησιμοποιούμενες εντολές του Azure Developer CLI, οργανωμένες ανά κατηγορία με πρακτικά παραδείγματα. Ιδανικό για γρήγορες αναζητήσεις κατά την ανάπτυξη, την αντιμετώπιση προβλημάτων και τις καθημερινές λειτουργίες με έργα azd.

## Στόχοι Μάθησης

Χρησιμοποιώντας αυτό το φυλλάδιο, θα:
- Έχετε άμεση πρόσβαση στις βασικές εντολές και τη σύνταξη του Azure Developer CLI
- Κατανοήσετε την οργάνωση των εντολών ανά λειτουργικές κατηγορίες και περιπτώσεις χρήσης
- Ανατρέξετε σε πρακτικά παραδείγματα για κοινά σενάρια ανάπτυξης και υλοποίησης
- Βρείτε εντολές αντιμετώπισης προβλημάτων για γρήγορη επίλυση ζητημάτων
- Εντοπίσετε επιλογές προηγμένης διαμόρφωσης και προσαρμογής αποτελεσματικά
- Εντοπίσετε εντολές διαχείρισης περιβάλλοντος και ροές εργασίας πολλαπλών περιβαλλόντων

## Αποτελέσματα Μάθησης

Με τακτική αναφορά σε αυτό το φυλλάδιο, θα μπορείτε να:
- Εκτελείτε εντολές azd με αυτοπεποίθηση χωρίς να χρειάζεται να ανατρέχετε στην πλήρη τεκμηρίωση
- Επιλύετε γρήγορα κοινά ζητήματα χρησιμοποιώντας κατάλληλες διαγνωστικές εντολές
- Διαχειρίζεστε αποτελεσματικά πολλαπλά περιβάλλοντα και σενάρια υλοποίησης
- Εφαρμόζετε προηγμένες δυνατότητες και επιλογές διαμόρφωσης του azd όπως απαιτείται
- Αντιμετωπίζετε προβλήματα υλοποίησης χρησιμοποιώντας συστηματικές ακολουθίες εντολών
- Βελτιστοποιείτε τις ροές εργασίας μέσω αποτελεσματικής χρήσης συντομεύσεων και επιλογών του azd

## Εντολές Ξεκινήματος

### Αυθεντικοποίηση
```bash
# Login to Azure (uses Azure CLI)
az login

# Check current account
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Αρχικοποίηση Έργου
```bash
# Browse available templates
azd template list

# Initialize from template
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
```

## Βασικές Εντολές Υλοποίησης

### Πλήρης Ροή Υλοποίησης
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --confirm-with-no-prompt

# Deploy to specific environment
azd up --environment production

# Deploy with custom parameters
azd up --parameter location=westus2
```

### Μόνο Υποδομή
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes (NEW)
azd provision --preview
# Shows a dry-run view of what resources would be created/modified/deleted
# Similar to 'terraform plan' or 'bicep what-if' - safe to run, no changes applied

# Provision with what-if analysis
azd provision --what-if
```

### Μόνο Εφαρμογή
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy --service web
azd deploy --service api

# Deploy all services
azd deploy --all
```

### Δημιουργία και Πακετάρισμα
```bash
# Build applications
azd package

# Build specific service
azd package --service api
```

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

# Show current environment
azd env show

# Refresh environment state
azd env refresh
```

### Μεταβλητές Περιβάλλοντος
```bash
# Set environment variable
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Get environment variable
azd env get API_KEY

# List all environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

## ⚙️ Εντολές Διαμόρφωσης

### Παγκόσμια Διαμόρφωση
```bash
# List all configuration
azd config list

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
# Validate azure.yaml
azd config validate

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Παρακολούθηση και Καταγραφές

### Καταγραφές Εφαρμογής
```bash
# View logs from all services
azd logs

# View logs from specific service
azd logs --service api

# Follow logs in real-time
azd logs --follow

# View logs since specific time
azd logs --since 1h
azd logs --since "2024-01-01 10:00:00"

# Filter logs by level
azd logs --level error
```

### Παρακολούθηση
```bash
# Open Azure portal for monitoring
azd monitor

# Open Application Insights
azd monitor --insights
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
azd version --check-for-updates

# Get current version
azd version

# Show system information
azd info
```

## 🔧 Προχωρημένες Εντολές

### Ροές CI/CD και Pipeline
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Show pipeline configuration
azd pipeline show
```

### Διαχείριση Υποδομής
```bash
# Import existing resources
azd infra import

# Export infrastructure template
azd infra export

# Validate infrastructure
azd infra validate

# 🧪 Infrastructure Preview & Planning (NEW)
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Safe to run - no actual changes made to Azure environment
```

### Διαχείριση Υπηρεσιών
```bash
# List all services
azd service list

# Show service details
azd service show --service web

# Restart service
azd service restart --service api
```

## 🎯 Γρήγορες Ροές Εργασίας

### Ροή Εργασίας Ανάπτυξης
```bash
# Start new project
azd init --template todo-nodejs-mongo
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# View logs
azd logs --follow
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
# Enable debug mode
export AZD_DEBUG=true

# Check system info
azd info

# Validate configuration
azd config validate

# View detailed logs
azd logs --level debug --since 1h

# Check resource status
azd show --output json
```

## 🔍 Εντολές Εντοπισμού Σφαλμάτων

### Πληροφορίες Εντοπισμού Σφαλμάτων
```bash
# Enable debug output
export AZD_DEBUG=true
azd <command> --debug

# Disable telemetry for cleaner output
export AZD_DISABLE_TELEMETRY=true

# Get system information
azd info

# Check authentication status
az account show
```

### Εντοπισμός Σφαλμάτων Προτύπων
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Validate template before init
azd template validate <template-name>
```

## 📁 Εντολές Αρχείων και Καταλόγων

### Δομή Έργου
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to azd project root
cd $(azd root)

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Μορφοποίηση Εξόδου

### Έξοδος JSON
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parse with jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Έξοδος Πίνακα
```bash
# Format as table
azd env list --output table
azd service list --output table
```

## 🔧 Συνδυασμοί Κοινών Εντολών

### Σενάριο Ελέγχου Υγείας
```bash
#!/bin/bash
# Quick health check
azd show
azd env show
azd logs --level error --since 10m
```

### Επικύρωση Υλοποίησης
```bash
#!/bin/bash
# Pre-deployment validation
azd config validate
azd provision --preview  # 🧪 NEW: Preview changes before deploying
az account show
```

### Σύγκριση Περιβάλλοντος
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Σενάριο Καθαρισμού Πόρων
```bash
#!/bin/bash
# Clean up old environments
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Μεταβλητές Περιβάλλοντος

### Κοινές Μεταβλητές Περιβάλλοντος
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Εντολές Έκτακτης Ανάγκης

### Γρήγορες Επιδιορθώσεις
```bash
# Reset authentication
az account clear
az login

# Force refresh environment
azd env refresh --force

# Restart all services
azd service restart --all

# Quick rollback
azd deploy --rollback
```

### Εντολές Ανάκτησης
```bash
# Recover from failed deployment
azd provision --continue-on-error
azd deploy --ignore-errors

# Clean slate recovery
azd down --force
azd up --confirm-with-no-prompt
```

## 💡 Συμβουλές Επαγγελματιών

### Ψευδώνυμα για Γρηγορότερη Ροή Εργασίας
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up --confirm-with-no-prompt'
alias azdl='azd logs --follow'
alias azds='azd show --output json'
alias azde='azd env'
```

### Συντομεύσεις Λειτουργιών
```bash
# Quick environment switching
azd-env() {
    azd env select $1 && azd show
}

# Quick deployment with logs
azd-deploy-watch() {
    azd deploy --service $1 && azd logs --service $1 --follow
}

# Environment status
azd-status() {
    echo "Current environment: $(azd env show --output json | jq -r '.name')"
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

**Συμβουλή**: Προσθέστε σελιδοδείκτη σε αυτό το φυλλάδιο και χρησιμοποιήστε `Ctrl+F` για να βρείτε γρήγορα τις εντολές που χρειάζεστε!

---

**Πλοήγηση**
- **Προηγούμενο Μάθημα**: [Έλεγχοι Προετοιμασίας](../docs/pre-deployment/preflight-checks.md)
- **Επόμενο Μάθημα**: [Γλωσσάριο](glossary.md)

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.