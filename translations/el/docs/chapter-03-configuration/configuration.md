# Οδηγός Διαμόρφωσης

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Διαμόρφωση & Αυθεντικοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **➡️ Επόμενο**: [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../chapter-04-infrastructure/deployment-guide.md)

## Εισαγωγή

Αυτός ο περιεκτικός οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστες ροές εργασίας ανάπτυξης και διάθεσης. Θα μάθετε για την ιεραρχία διαμόρφωσης, τη διαχείριση περιβαλλόντων, τις μεθόδους αυθεντικοποίησης και προχωρημένα πρότυπα διαμόρφωσης που επιτρέπουν αποδοτικές και ασφαλείς αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Κατακτήσετε την ιεραρχία διαμόρφωσης του azd και κατανοήσετε πώς προτεραιοποιούνται οι ρυθμίσεις
- Διαμορφώσετε παγκόσμιες και ειδικές για το έργο ρυθμίσεις αποτελεσματικά
- Διαχειριστείτε πολλαπλά περιβάλλοντα με διαφορετικές ρυθμίσεις
- Εφαρμόσετε ασφαλή πρότυπα αυθεντικοποίησης και εξουσιοδότησης
- Κατανοήσετε προχωρημένα πρότυπα διαμόρφωσης για σύνθετα σενάρια

## Μαθησιακά Αποτελέσματα

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε:
- Να διαμορφώσετε το azd για βέλτιστες ροές εργασίας ανάπτυξης
- Να ρυθμίσετε και να διαχειριστείτε πολλαπλά περιβάλλοντα ανάπτυξης
- Να εφαρμόσετε ασφαλείς πρακτικές διαχείρισης ρυθμίσεων
- Να αντιμετωπίζετε προβλήματα που σχετίζονται με τη διαμόρφωση
- Να προσαρμόσετε τη συμπεριφορά του azd για συγκεκριμένες οργανωτικές απαιτήσεις

Αυτός ο περιεκτικός οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστες ροές εργασίας ανάπτυξης και διάθεσης.

## Ιεραρχία Διαμόρφωσης

azd χρησιμοποιεί ένα ιεραρχικό σύστημα διαμόρφωσης:
1. **Παράμετροι γραμμής εντολών** (υψηλότερη προτεραιότητα)
2. **Μεταβλητές περιβάλλοντος**
3. **Τοπική διαμόρφωση έργου** (`.azd/config.json`)
4. **Παγκόσμια διαμόρφωση χρήστη** (`~/.azd/config.json`)
5. **Προεπιλεγμένες τιμές** (χαμηλότερη προτεραιότητα)

## Παγκόσμια Διαμόρφωση

### Ορισμός Παγκόσμιων Προεπιλογών
```bash
# Ορισμός προεπιλεγμένης συνδρομής
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ορισμός προεπιλεγμένης τοποθεσίας
azd config set defaults.location "eastus2"

# Ορισμός προεπιλεγμένου κανόνα ονοματοδοσίας ομάδας πόρων
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Προβολή όλων των παγκόσμιων ρυθμίσεων
azd config list

# Κατάργηση μιας ρύθμισης
azd config unset defaults.location
```

### Συνηθισμένες Παγκόσμιες Ρυθμίσεις
```bash
# Προτιμήσεις ανάπτυξης
azd config set alpha.enable true                    # Ενεργοποίηση χαρακτηριστικών alpha
azd config set telemetry.enabled false             # Απενεργοποίηση τηλεμετρίας
azd config set output.format json                  # Ορισμός μορφής εξόδου

# Ρυθμίσεις ασφαλείας
azd config set auth.useAzureCliCredential true     # Χρήση Azure CLI για έλεγχο ταυτότητας
azd config set tls.insecure false                  # Επιβολή επαλήθευσης TLS

# Βελτιστοποίηση απόδοσης
azd config set provision.parallelism 5             # Παράλληλη δημιουργία πόρων
azd config set deploy.timeout 30m                  # Χρονικό όριο ανάπτυξης
```

## 🏗️ Διαμόρφωση Έργου

### Δομή azure.yaml
Το αρχείο `azure.yaml` είναι η καρδιά του έργου azd σας:

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

### Επιλογές Διαμόρφωσης Υπηρεσίας

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

#### Ρυθμίσεις κατά Γλώσσα
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

## 🌟 Διαχείριση Περιβαλλόντων

### Δημιουργία Περιβαλλόντων
```bash
# Δημιουργία νέου περιβάλλοντος
azd env new development

# Δημιουργία με συγκεκριμένη τοποθεσία
azd env new staging --location "westus2"

# Δημιουργία από πρότυπο
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Διαμόρφωση Περιβάλλοντος
Κάθε περιβάλλον έχει τη δική του διαμόρφωση στο `.azure/<env-name>/config.json`:

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
# Ορισμός μεταβλητών ειδικών ανά περιβάλλον
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
# (δεν πρέπει να επιστρέφει τίποτα)
```

### Πρότυπα Περιβάλλοντος
Δημιουργήστε το `.azure/env.template` για συνεπή ρύθμιση περιβάλλοντος:
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

## 🔐 Διαμόρφωση Αυθεντικοποίησης

### Ενσωμάτωση Azure CLI
```bash
# Χρησιμοποιήστε τα διαπιστευτήρια του Azure CLI (προεπιλογή)
azd config set auth.useAzureCliCredential true

# Συνδεθείτε με συγκεκριμένο tenant
az login --tenant <tenant-id>

# Ορίστε την προεπιλεγμένη συνδρομή
az account set --subscription <subscription-id>
```

### Αυθεντικοποίηση με Service Principal
Για pipelines CI/CD:
```bash
# Ορίστε μεταβλητές περιβάλλοντος
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Ή ρυθμίστε απευθείας
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Διαχειριζόμενη Ταυτότητα
Για περιβάλλοντα που φιλοξενούνται στο Azure:
```bash
# Ενεργοποιήστε την πιστοποίηση μέσω διαχειριζόμενης ταυτότητας
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Διαμόρφωση Υποδομής

### Παράμετροι Bicep
Διαμορφώστε τις παραμέτρους υποδομής στο `infra/main.parameters.json`:
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

### Διαμόρφωση Terraform
Για έργα Terraform, διαμορφώστε στο `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Διαμόρφωση Ανάπτυξης

### Διαμόρφωση Κατασκευής
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

### Διαμόρφωση Docker
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

## 🔧 Σύνθετη Διαμόρφωση

### Προσαρμοσμένη Ονοματοδοσία Πόρων
```bash
# Ορίστε τις συμβάσεις ονομασίας
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Διαμόρφωση Δικτύου
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Διαμόρφωση Επιτήρησης
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

## 🎯 Διαμορφώσεις ανά Περιβάλλον

### Περιβάλλον Ανάπτυξης
```bash
# .azure/ανάπτυξη/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Περιβάλλον Staging
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

## 🔍 Επικύρωση Διαμόρφωσης

### Επικύρωση Διαμόρφωσης
```bash
# Έλεγχος σύνταξης διαμόρφωσης
azd config validate

# Δοκιμή μεταβλητών περιβάλλοντος
azd env get-values

# Επαλήθευση υποδομής
azd provision --dry-run
```

### Σενάρια Διαμόρφωσης
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

## 🎓 Καλές Πρακτικές

### 1. Χρήση Μεταβλητών Περιβάλλοντος
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Οργάνωση Αρχείων Διαμόρφωσης
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

### 3. Θεωρήσεις Ελέγχου Εκδόσεων
```bash
# .gitignore
.azure/*/config.json         # Ρυθμίσεις περιβάλλοντος (περιέχουν αναγνωριστικά πόρων)
.azure/*/.env               # Μεταβλητές περιβάλλοντος (ενδέχεται να περιέχουν μυστικά)
.env                        # Τοπικό αρχείο περιβάλλοντος
```

### 4. Τεκμηρίωση Διαμόρφωσης
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

## 🎯 Πρακτικές Ασκήσεις

### Άσκηση 1: Διαμόρφωση Πολλαπλών Περιβαλλόντων (15 λεπτά)

**Στόχος**: Δημιουργήστε και διαμορφώστε τρία περιβάλλοντα με διαφορετικές ρυθμίσεις

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

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκαν επιτυχώς τρία περιβάλλοντα
- [ ] Κάθε περιβάλλον έχει μοναδική διαμόρφωση
- [ ] Μπορείτε να αλλάζετε μεταξύ περιβαλλόντων χωρίς σφάλματα
- [ ] Το `azd env list` εμφανίζει και τα τρία περιβάλλοντα

### Άσκηση 2: Διαχείριση Μυστικών (10 λεπτά)

**Στόχος**: Εξασκηθείτε στην ασφαλή διαμόρφωση με ευαίσθητα δεδομένα

```bash
# Ορίστε μυστικά (δεν εμφανίζονται στην έξοδο)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ορίστε μη απόρρητη διαμόρφωση
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Προβολή περιβάλλοντος (τα μυστικά πρέπει να αποκρύπτονται)
azd env get-values

# Επαληθεύστε ότι τα μυστικά έχουν αποθηκευτεί
azd env get DB_PASSWORD  # Πρέπει να εμφανίζει την πραγματική τιμή
```

**Κριτήρια Επιτυχίας:**
- [ ] Τα μυστικά αποθηκεύονται χωρίς εμφάνιση στο τερματικό
- [ ] Το `azd env get-values` εμφανίζει αποκρυμμένα μυστικά
- [ ] Το μεμονωμένο `azd env get <SECRET_NAME>` ανακτά την πραγματική τιμή

## Επόμενα Βήματα

- [Το Πρώτο Σας Έργο](first-project.md) - Εφαρμόστε τη διαμόρφωση στην πράξη
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Χρησιμοποιήστε τη διαμόρφωση για ανάπτυξη
- [Παροχή Πόρων](../chapter-04-infrastructure/provisioning.md) - Διαμορφώσεις έτοιμες για παραγωγή

## Αναφορές

- [Αναφορά Διαμόρφωσης azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Σχήμα azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Μεταβλητές Περιβάλλοντος](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Πλοήγηση Κεφαλαίων:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Διαμόρφωση & Αυθεντικοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο Σας Έργο](first-project.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../chapter-04-infrastructure/deployment-guide.md)
- **Επόμενο Μάθημα**: [Το Πρώτο Σας Έργο](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co‑op Translator (https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το αρχικό έγγραφο στην πρωτότυπη γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από ανθρώπινο μεταφραστή. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->