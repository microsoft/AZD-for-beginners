# Configuration Guide

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Κεφάλαιο 3 - Ρύθμιση & Πιστοποίηση
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστες ροές ανάπτυξης και ανάπτυξης. Θα μάθετε για την ιεραρχία ρυθμίσεων, τη διαχείριση περιβαλλόντων, μεθόδους πιστοποίησης και προηγμένα μοτίβα διαμόρφωσης που επιτρέπουν αποδοτικές και ασφαλείς αναπτύξεις στο Azure.

## Learning Goals

Στο τέλος αυτού του μαθήματος, θα:
- Κατακτήσετε την ιεραρχία διαμόρφωσης του azd και θα καταλάβετε πώς προτεραιοποιούνται οι ρυθμίσεις
- Διαμορφώσετε παγκόσμιες και ειδικές για το έργο ρυθμίσεις αποτελεσματικά
- Διαχειριστείτε πολλαπλά περιβάλλοντα με διαφορετικές ρυθμίσεις
- Εφαρμόσετε ασφαλή μοτίβα πιστοποίησης και εξουσιοδότησης
- Κατανοήσετε προηγμένα μοτίβα διαμόρφωσης για σύνθετα σενάρια

## Learning Outcomes

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Διαμορφώσετε το azd για βέλτιστες ροές εργασίας ανάπτυξης
- Ρυθμίσετε και διαχειριστείτε πολλαπλά περιβάλλοντα ανάπτυξης
- Εφαρμόσετε πρακτικές ασφαλούς διαχείρισης ρυθμίσεων
- Αντιμετωπίσετε προβλήματα σχετιζόμενα με τη διαμόρφωση
- Προσαρμόσετε τη συμπεριφορά του azd για συγκεκριμένες οργανωτικές απαιτήσεις

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστες ροές ανάπτυξης και ανάπτυξης.

## Understanding AI Agents in an azd Project

Αν είστε νέοι στους πράκτορες AI, εδώ είναι ένας απλός τρόπος να τους σκεφτείτε μέσα στον κόσμο του azd.

### What Is an Agent?

Ένας πράκτορας είναι ένα κομμάτι λογισμικού που μπορεί να λάβει ένα αίτημα, να συλλογιστεί πάνω σε αυτό και να λάβει δράσεις—συχνά καλώντας ένα μοντέλο AI, αναζητώντας δεδομένα, ή επικαλούμενο άλλες υπηρεσίες. Σε ένα έργο azd, ένας πράκτορας είναι απλώς μια άλλη **υπηρεσία** δίπλα στο frontend του ιστού ή στο backend του API σας.

### How Agents Fit Into the azd Project Structure

Ένα έργο azd αποτελείται από τρία επίπεδα: **infrastructure**, **code**, και **configuration**. Οι πράκτορες εντάσσονται σε αυτά τα επίπεδα με τον ίδιο τρόπο που το κάνει οποιαδήποτε άλλη υπηρεσία:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Παρέχει μια web εφαρμογή και βάση δεδομένων | Παρέχει ένα endpoint μοντέλου AI, έναν δείκτη αναζήτησης, ή έναν host για τον πράκτορα |
| **Code** (`src/`) | Περιέχει τον κώδικα του frontend και του API σας | Περιέχει τη λογική του πράκτορα και τους ορισμούς προτροπών (prompts) |
| **Configuration** (`azure.yaml`) | Καταχωρεί τις υπηρεσίες σας και τους στόχους φιλοξενίας τους | Καταχωρεί τον πράκτορα ως υπηρεσία, δείχνοντας στον κώδικά του και τον host του |

### The Role of `azure.yaml`

Δεν χρειάζεται να απομνημονεύσετε τη σύνταξη αυτή τη στιγμή. Εννοιολογικά, το `azure.yaml` είναι το αρχείο όπου λέτε στο azd: *"Εδώ είναι οι υπηρεσίες που αποτελούν την εφαρμογή μου, και εδώ είναι που θα βρείτε τον κώδικά τους."*

Όταν το έργο σας περιλαμβάνει έναν πράκτορα AI, το `azure.yaml` απλώς καταχωρεί αυτόν τον πράκτορα ως μία από τις υπηρεσίες. Το azd στη συνέχεια γνωρίζει να προμηθεύσει την κατάλληλη υποδομή (όπως ένα Microsoft Foundry Models endpoint ή ένα Container App για τη φιλοξενία του πράκτορα) και να αναπτύξει τον κώδικα του πράκτορα—όπως θα έκανε για μια web εφαρμογή ή API.

Αυτό σημαίνει ότι δεν υπάρχει κάτι ριζικά νέο να μάθετε. Αν καταλαβαίνετε πώς το azd διαχειρίζεται μια web υπηρεσία, ήδη καταλαβαίνετε πώς διαχειρίζεται έναν πράκτορα.

## Configuration Hierarchy

Το azd χρησιμοποιεί ένα ιεραρχικό σύστημα διαμόρφωσης:
1. **Command-line flags** (υψηλότερη προτεραιότητα)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (χαμηλότερη προτεραιότητα)

## Global Configuration

### Setting Global Defaults
```bash
# Ορισμός προεπιλεγμένης συνδρομής
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ορισμός προεπιλεγμένης τοποθεσίας
azd config set defaults.location "eastus2"

# Ορισμός προεπιλεγμένης σύμβασης ονοματοδοσίας ομάδας πόρων
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Προβολή όλων των παγκόσμιων ρυθμίσεων
azd config list

# Κατάργηση μιας διαμόρφωσης
azd config unset defaults.location
```

### Common Global Settings
```bash
# Προτιμήσεις ανάπτυξης
azd config set alpha.enable true                    # Ενεργοποίηση alpha λειτουργιών
azd config set telemetry.enabled false             # Απενεργοποίηση τηλεμετρίας
azd config set output.format json                  # Ορισμός μορφής εξόδου

# Ρυθμίσεις ασφάλειας
azd config set auth.useAzureCliCredential true     # Χρήση Azure CLI για έλεγχο ταυτότητας
azd config set tls.insecure false                  # Επιβολή επαλήθευσης TLS

# Βελτιστοποίηση απόδοσης
azd config set provision.parallelism 5             # Παράλληλη δημιουργία πόρων
azd config set deploy.timeout 30m                  # Χρονικό όριο ανάπτυξης
```

## 🏗️ Project Configuration

### azure.yaml Structure
Το αρχείο `azure.yaml` είναι η καρδιά του έργου azd:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

### Service Configuration Options

#### Host Types
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Language-Specific Settings
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Environment Management

### Creating Environments
```bash
# Δημιουργήστε ένα νέο περιβάλλον
azd env new development

# Δημιουργήστε με συγκεκριμένη τοποθεσία
azd env new staging --location "westus2"

# Δημιουργήστε από πρότυπο
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
Κάθε περιβάλλον έχει τη δική του διαμόρφωση σε `.azure/<env-name>/config.json`:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Environment Variables
```bash
# Ορισμός μεταβλητών ανά περιβάλλον
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Προβολή μεταβλητών περιβάλλοντος
azd env get-values

# Αναμενόμενη έξοδος:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Αφαίρεση μεταβλητής περιβάλλοντος
azd env unset DEBUG

# Επαλήθευση αφαίρεσης
azd env get-values | grep DEBUG
# (δεν θα πρέπει να επιστρέφει τίποτα)
```

### Environment Templates
Δημιουργήστε `.azure/env.template` για συνεπή ρύθμιση περιβάλλοντος:
```bash
# Απαιτούμενες μεταβλητές
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Ρυθμίσεις εφαρμογής
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Προαιρετικές ρυθμίσεις ανάπτυξης
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Χρήση διαπιστευτηρίων Azure CLI (προεπιλεγμένα)
azd config set auth.useAzureCliCredential true

# Σύνδεση με συγκεκριμένο tenant
az login --tenant <tenant-id>

# Ορισμός προεπιλεγμένης συνδρομής
az account set --subscription <subscription-id>
```

### Service Principal Authentication
Για CI/CD pipelines:
```bash
# Ορίστε μεταβλητές περιβάλλοντος
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ή ρυθμίστε απευθείας
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Για περιβάλλοντα που φιλοξενούνται στο Azure:
```bash
# Ενεργοποίηση ελέγχου ταυτότητας με διαχειριζόμενη ταυτότητα
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
Ρυθμίστε παραμέτρους υποδομής στο `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform Configuration
Για έργα Terraform, ρυθμίστε στο `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker Configuration
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# Ορισμός συμβάσεων ονομασίας
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/ανάπτυξη/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/παραγωγή/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# Ελέγξτε τη σύνταξη διαμόρφωσης
azd config validate

# Δοκιμάστε τις μεταβλητές περιβάλλοντος
azd env get-values

# Επαληθεύστε την υποδομή
azd provision --dry-run
```

### Configuration Scripts
Δημιουργήστε σενάρια επικύρωσης στο `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Ελέγξτε τις απαιτούμενες μεταβλητές περιβάλλοντος
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Επαληθεύστε τη σύνταξη του azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Use Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Version Control Considerations
```bash
# .gitignore
.azure/*/config.json         # Ρυθμίσεις περιβάλλοντος (περιέχουν αναγνωριστικά πόρων)
.azure/*/.env               # Μεταβλητές περιβάλλοντος (μπορεί να περιέχουν μυστικά)
.env                        # Τοπικό αρχείο περιβάλλοντος
```

### 4. Configuration Documentation
Τεκμηριώστε τη διαμόρφωσή σας στο `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Hands-On Practice Exercises

### Exercise 1: Multi-Environment Configuration (15 minutes)

**Goal**: Create and configure three environments with different settings

```bash
# Δημιουργήστε περιβάλλον ανάπτυξης
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Δημιουργήστε περιβάλλον προπαραγωγής
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Δημιουργήστε περιβάλλον παραγωγής
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Επαληθεύστε κάθε περιβάλλον
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Δημιουργήθηκαν επιτυχώς τρία περιβάλλοντα
- [ ] Κάθε περιβάλλον έχει μοναδική διαμόρφωση
- [ ] Μπορείτε να αλλάζετε μεταξύ περιβαλλόντων χωρίς σφάλματα
- [ ] `azd env list` εμφανίζει και τα τρία περιβάλλοντα

### Exercise 2: Secret Management (10 minutes)

**Goal**: Practice secure configuration with sensitive data

```bash
# Ορίστε τα μυστικά (δεν εμφανίζονται στην έξοδο)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ορίστε μη μυστική διαμόρφωση
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Προβολή περιβάλλοντος (τα μυστικά θα πρέπει να αποκρύπτονται)
azd env get-values

# Επαληθεύστε ότι τα μυστικά αποθηκεύονται
azd env get DB_PASSWORD  # Πρέπει να εμφανίζει την πραγματική τιμή
```

**Success Criteria:**
- [ ] Τα μυστικά αποθηκεύτηκαν χωρίς εμφάνιση στο τερματικό
- [ ] `azd env get-values` εμφανίζει αποκρυπτογραφημένα μυστικά
- [ ] Μεμονωμένο `azd env get <SECRET_NAME>` επιστρέφει την πραγματική τιμή

## Next Steps

- [Your First Project](first-project.md) - Εφαρμόστε τη διαμόρφωση στην πράξη
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Χρησιμοποιήστε τη διαμόρφωση για ανάπτυξη
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Διαμορφώσεις παραγωγής έτοιμες

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Κεφάλαιο 3 - Ρύθμιση & Πιστοποίηση
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Το παρόν έγγραφο έχει μεταφραστεί με τη χρήση της υπηρεσίας μετάφρασης τεχνητής νοημοσύνης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρότι καταβάλλουμε προσπάθειες για την ακρίβεια, παρακαλείστε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη γλώσσα του πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται η ανάθεση της μετάφρασης σε επαγγελματία μεταφραστή. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->