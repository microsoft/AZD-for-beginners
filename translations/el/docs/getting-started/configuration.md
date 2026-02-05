# Οδηγός Ρύθμισης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Ρύθμιση & Αυθεντικοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **➡️ Επόμενο**: [Οδηγός Ανάπτυξης](../deployment/deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../deployment/deployment-guide.md)

## Εισαγωγή

Αυτός ο αναλυτικός οδηγός καλύπτει όλες τις πτυχές της ρύθμισης του Azure Developer CLI για βέλτιστες ροές εργασίας ανάπτυξης και υλοποίησης. Θα μάθετε για την ιεραρχία ρυθμίσεων, τη διαχείριση περιβάλλοντος, τις μεθόδους αυθεντικοποίησης και προηγμένα μοτίβα ρύθμισης που επιτρέπουν αποτελεσματικές και ασφαλείς υλοποιήσεις στο Azure.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Κατανοήσετε την ιεραρχία ρυθμίσεων του azd και πώς προτεραιοποιούνται οι ρυθμίσεις
- Ρυθμίσετε αποτελεσματικά παγκόσμιες και ειδικές για έργα ρυθμίσεις
- Διαχειριστείτε πολλαπλά περιβάλλοντα με διαφορετικές ρυθμίσεις
- Εφαρμόσετε ασφαλή μοτίβα αυθεντικοποίησης και εξουσιοδότησης
- Κατανοήσετε προηγμένα μοτίβα ρύθμισης για σύνθετα σενάρια

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Ρυθμίσετε το azd για βέλτιστες ροές εργασίας ανάπτυξης
- Δημιουργήσετε και διαχειριστείτε πολλαπλά περιβάλλοντα υλοποίησης
- Εφαρμόσετε ασφαλείς πρακτικές διαχείρισης ρυθμίσεων
- Εντοπίσετε και διορθώσετε προβλήματα που σχετίζονται με τις ρυθμίσεις
- Προσαρμόσετε τη συμπεριφορά του azd για συγκεκριμένες οργανωτικές απαιτήσεις

Αυτός ο αναλυτικός οδηγός καλύπτει όλες τις πτυχές της ρύθμισης του Azure Developer CLI για βέλτιστες ροές εργασίας ανάπτυξης και υλοποίησης.

## Ιεραρχία Ρύθμισης

Το azd χρησιμοποιεί ένα σύστημα ιεραρχικής ρύθμισης:
1. **Επιλογές γραμμής εντολών** (υψηλότερη προτεραιότητα)
2. **Μεταβλητές περιβάλλοντος**
3. **Τοπική ρύθμιση έργου** (`.azd/config.json`)
4. **Παγκόσμια ρύθμιση χρήστη** (`~/.azd/config.json`)
5. **Προεπιλεγμένες τιμές** (χαμηλότερη προτεραιότητα)

## Παγκόσμια Ρύθμιση

### Ορισμός Παγκόσμιων Προεπιλογών
```bash
# Ορίστε την προεπιλεγμένη συνδρομή
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ορίστε την προεπιλεγμένη τοποθεσία
azd config set defaults.location "eastus2"

# Ορίστε την προεπιλεγμένη σύμβαση ονομασίας ομάδας πόρων
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Προβολή όλων των παγκόσμιων ρυθμίσεων
azd config list

# Κατάργηση μιας ρύθμισης
azd config unset defaults.location
```

### Κοινές Παγκόσμιες Ρυθμίσεις
```bash
# Προτιμήσεις ανάπτυξης
azd config set alpha.enable true                    # Ενεργοποίηση χαρακτηριστικών alpha
azd config set telemetry.enabled false             # Απενεργοποίηση τηλεμετρίας
azd config set output.format json                  # Ορισμός μορφής εξόδου

# Ρυθμίσεις ασφαλείας
azd config set auth.useAzureCliCredential true     # Χρήση Azure CLI για έλεγχο ταυτότητας
azd config set tls.insecure false                  # Εφαρμογή επαλήθευσης TLS

# Βελτιστοποίηση απόδοσης
azd config set provision.parallelism 5             # Παράλληλη δημιουργία πόρων
azd config set deploy.timeout 30m                  # Χρονικό όριο ανάπτυξης
```

## 🏗️ Ρύθμιση Έργου

### Δομή του azure.yaml
Το αρχείο `azure.yaml` είναι η καρδιά του έργου σας στο azd:

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

### Επιλογές Ρύθμισης Υπηρεσιών

#### Τύποι Φιλοξενίας
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

#### Ρυθμίσεις Ειδικές για Γλώσσες
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

## 🌟 Διαχείριση Περιβάλλοντος

### Δημιουργία Περιβαλλόντων
```bash
# Δημιουργήστε ένα νέο περιβάλλον
azd env new development

# Δημιουργήστε με συγκεκριμένη τοποθεσία
azd env new staging --location "westus2"

# Δημιουργήστε από πρότυπο
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Ρύθμιση Περιβάλλοντος
Κάθε περιβάλλον έχει τη δική του ρύθμιση στο `.azure/<env-name>/config.json`:

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

### Μεταβλητές Περιβάλλοντος
```bash
# Ορίστε μεταβλητές συγκεκριμένες για το περιβάλλον
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Προβολή μεταβλητών περιβάλλοντος
azd env get-values

# Αναμενόμενο αποτέλεσμα:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Αφαιρέστε τη μεταβλητή περιβάλλοντος
azd env unset DEBUG

# Επαληθεύστε την αφαίρεση
azd env get-values | grep DEBUG
# (θα πρέπει να μην επιστρέφει τίποτα)
```

### Πρότυπα Περιβάλλοντος
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

## 🔐 Ρύθμιση Αυθεντικοποίησης

### Ενσωμάτωση Azure CLI
```bash
# Χρησιμοποιήστε διαπιστευτήρια Azure CLI (προεπιλογή)
azd config set auth.useAzureCliCredential true

# Συνδεθείτε με συγκεκριμένο μισθωτή
az login --tenant <tenant-id>

# Ορίστε προεπιλεγμένη συνδρομή
az account set --subscription <subscription-id>
```

### Αυθεντικοποίηση με Service Principal
Για CI/CD pipelines:
```bash
# Ορίστε μεταβλητές περιβάλλοντος
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ή διαμορφώστε απευθείας
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Διαχειριζόμενη Ταυτότητα
Για περιβάλλοντα φιλοξενούμενα στο Azure:
```bash
# Ενεργοποίηση ελέγχου ταυτότητας με διαχειριζόμενη ταυτότητα
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Ρύθμιση Υποδομής

### Παράμετροι Bicep
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

### Ρύθμιση Terraform
Για έργα Terraform, ρυθμίστε στο `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Ρύθμιση Ανάπτυξης

### Ρύθμιση Build
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

### Ρύθμιση Docker
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
Παράδειγμα `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Προηγμένη Ρύθμιση

### Προσαρμοσμένη Ονομασία Πόρων
```bash
# Ορίστε συμβάσεις ονοματοδοσίας
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Ρύθμιση Δικτύου
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Ρύθμιση Παρακολούθησης
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

## 🎯 Ρυθμίσεις Ειδικές για Περιβάλλοντα

### Περιβάλλον Ανάπτυξης
```bash
# .azure/ανάπτυξη/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Περιβάλλον Δοκιμών
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Περιβάλλον Παραγωγής
```bash
# .azure/παραγωγή/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Επικύρωση Ρύθμισης

### Επικύρωση Ρύθμισης
```bash
# Ελέγξτε τη σύνταξη της διαμόρφωσης
azd config validate

# Δοκιμάστε τις μεταβλητές περιβάλλοντος
azd env get-values

# Επικυρώστε την υποδομή
azd provision --dry-run
```

### Σενάρια Ρύθμισης
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

# Επικυρώστε τη σύνταξη του azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Βέλτιστες Πρακτικές

### 1. Χρησιμοποιήστε Μεταβλητές Περιβάλλοντος
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Οργανώστε Αρχεία Ρύθμισης
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

### 3. Σκέψεις για Έλεγχο Έκδοσης
```bash
# .gitignore
.azure/*/config.json         # Ρυθμίσεις περιβάλλοντος (περιέχουν αναγνωριστικά πόρων)
.azure/*/.env               # Μεταβλητές περιβάλλοντος (ενδέχεται να περιέχουν μυστικά)
.env                        # Τοπικό αρχείο περιβάλλοντος
```

### 4. Τεκμηρίωση Ρύθμισης
Τεκμηριώστε τη ρύθμιση σας στο `CONFIG.md`:
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

## 🎯 Ασκήσεις Πρακτικής

### Άσκηση 1: Ρύθμιση Πολλαπλών Περιβαλλόντων (15 λεπτά)

**Στόχος**: Δημιουργήστε και ρυθμίστε τρία περιβάλλοντα με διαφορετικές ρυθμίσεις

```bash
# Δημιουργία περιβάλλοντος ανάπτυξης
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Δημιουργία περιβάλλοντος δοκιμών
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Δημιουργία περιβάλλοντος παραγωγής
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Επαλήθευση κάθε περιβάλλοντος
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκαν επιτυχώς τρία περιβάλλοντα
- [ ] Κάθε περιβάλλον έχει μοναδική ρύθμιση
- [ ] Μπορείτε να εναλλάσσετε περιβάλλοντα χωρίς σφάλματα
- [ ] Το `azd env list` εμφανίζει και τα τρία περιβάλλοντα

### Άσκηση 2: Διαχείριση Μυστικών (10 λεπτά)

**Στόχος**: Εξασκηθείτε σε ασφαλή ρύθμιση με ευαίσθητα δεδομένα

```bash
# Ορίστε μυστικά (δεν εμφανίζονται στην έξοδο)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ορίστε μη-μυστική διαμόρφωση
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Προβολή περιβάλλοντος (τα μυστικά πρέπει να είναι κρυμμένα)
azd env get-values

# Επαληθεύστε ότι τα μυστικά αποθηκεύονται
azd env get DB_PASSWORD  # Πρέπει να δείχνει την πραγματική τιμή
```

**Κριτήρια Επιτυχίας:**
- [ ] Τα μυστικά αποθηκεύονται χωρίς να εμφανίζονται στο τερματικό
- [ ] Το `azd env get-values` εμφανίζει τα μυστικά ως κρυμμένα
- [ ] Το `azd env get <SECRET_NAME>` ανακτά την πραγματική τιμή

## Επόμενα Βήματα

- [Το Πρώτο Σας Έργο](first-project.md) - Εφαρμόστε τη ρύθμιση στην πράξη
- [Οδηγός Ανάπτυξης](../deployment/deployment-guide.md) - Χρησιμοποιήστε τη ρύθμιση για ανάπτυξη
- [Προμήθεια Πόρων](../deployment/provisioning.md) - Ρυθμίσεις έτοιμες για παραγωγή

## Αναφορές

- [Αναφορά Ρύθμισης azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Σχήμα azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Μεταβλητές Περιβάλλοντος](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Ρύθμιση & Αυθεντικοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../deployment/deployment-guide.md)
- **Επόμενο Μάθημα**: [Το Πρώτο Σας Έργο](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτόματες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->