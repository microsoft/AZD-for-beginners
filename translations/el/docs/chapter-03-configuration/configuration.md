# Οδηγός Διαμόρφωσης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Διαμόρφωση & Αυθεντικοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο σας Έργο](first-project.md)
- **➡️ Επόμενο**: [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../chapter-04-infrastructure/deployment-guide.md)

## Εισαγωγή

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστα ροή εργασίας ανάπτυξης και ανάπτυξης. Θα μάθετε για την ιεραρχία διαμόρφωσης, τη διαχείριση περιβαλλόντων, τις μεθόδους αυθεντικοποίησης και πρότυπα προχωρημένης διαμόρφωσης που επιτρέπουν αποδοτικές και ασφαλείς αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Στο τέλος αυτού του μαθήματος, θα:
- Κατακτήσετε την ιεραρχία ρυθμίσεων του azd και θα κατανοήσετε πώς προτεραιοποιούνται οι ρυθμίσεις
- Διαμορφώσετε αποτελεσματικά παγκόσμιες και ειδικές για έργο ρυθμίσεις
- Διαχειριστείτε πολλαπλά περιβάλλοντα με διαφορετικές ρυθμίσεις
- Εφαρμόσετε ασφαλή πρότυπα αυθεντικοποίησης και εξουσιοδότησης
- Κατανοήσετε προχωρημένα πρότυπα διαμόρφωσης για πολύπλοκα σενάρια

## Μαθησιακά Αποτελέσματα

Αφού ολοκληρώσετε αυτό το μάθημα, θα μπορείτε να:
- Διαμορφώσετε το azd για βέλτιστες ροές εργασίας ανάπτυξης
- Ρυθμίσετε και διαχειριστείτε πολλαπλά περιβάλλοντα ανάπτυξης
- Εφαρμόσετε ασφαλείς πρακτικές διαχείρισης διαμόρφωσης
- Εντοπίσετε και επιλύσετε προβλήματα σχετιζόμενα με τη διαμόρφωση
- Προσαρμόσετε τη συμπεριφορά του azd σε συγκεκριμένες οργανωτικές απαιτήσεις

Αυτός ο ολοκληρωμένος οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστα ροή εργασίας ανάπτυξης και ανάπτυξης.

## Κατανόηση των Πρακτόρων AI σε ένα έργο azd

Αν είστε νέοι στους πράκτορες AI, εδώ είναι ένας απλός τρόπος να σκεφτείτε για αυτούς μέσα στον κόσμο του azd.

### Τι είναι ένας πράκτορας;

Ένας πράκτορας είναι ένα κομμάτι λογισμικού που μπορεί να λάβει ένα αίτημα, να σκεφτεί πάνω σε αυτό και να αναλάβει ενέργειες—συχνά καλώντας ένα μοντέλο AI, αναζητώντας δεδομένα ή επικαλούμενο άλλες υπηρεσίες. Σε ένα έργο azd, ένας πράκτορας είναι απλώς άλλη μια **υπηρεσία** παράλληλα με το web frontend ή το API backend σας.

### Πώς εντάσσονται οι πράκτορες στη δομή έργου azd

Ένα έργο azd αποτελείται από τρία επίπεδα: **υποδομή**, **κώδικας** και **διαμόρφωση**. Οι πράκτορες ενσωματώνονται σε αυτά τα επίπεδα με τον ίδιο τρόπο που οποιαδήποτε άλλη υπηρεσία το κάνει:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Παρέχει μια web εφαρμογή και βάση δεδομένων | Παρέχει ένα endpoint μοντέλου AI, ευρετήριο αναζήτησης ή περιβάλλον φιλοξενίας πράκτορα |
| **Code** (`src/`) | Περιέχει τον κώδικα πηγής του frontend και του API | Περιέχει τη λογική του πράκτορα και τους ορισμούς προτροπών |
| **Configuration** (`azure.yaml`) | Καταγράφει τις υπηρεσίες σας και τους στόχους φιλοξενίας τους | Καταγράφει τον πράκτορα ως υπηρεσία, δείχνοντας στον κώδικα και στο περιβάλλον φιλοξενίας του |

### Ο ρόλος του `azure.yaml`

Δεν χρειάζεται να αποστηθίσετε τη σύνταξη τώρα. Εννοιολογικά, το `azure.yaml` είναι το αρχείο όπου λέτε στο azd: *"Εδώ είναι οι υπηρεσίες που αποτελούν την εφαρμογή μου, και εδώ θα βρείτε πού βρίσκεται ο κώδικάς τους."*

Όταν το έργο σας περιλαμβάνει έναν πράκτορα AI, το `azure.yaml` απλώς καταγράφει αυτόν τον πράκτορα ως μία από τις υπηρεσίες. Το azd γνωρίζει τότε να προμηθεύσει τη σωστή υποδομή (όπως ένα Microsoft Foundry Models endpoint ή ένα Container App για να φιλοξενήσει τον πράκτορα) και να αναπτύξει τον κώδικα του πράκτορα—όπως θα έκανε και για μια web εφαρμογή ή ένα API.

Αυτό σημαίνει ότι δεν υπάρχει κάτι θεμελιωδώς καινούργιο να μάθετε. Αν κατανοείτε πώς το azd διαχειρίζεται μια web υπηρεσία, ήδη καταλαβαίνετε πώς διαχειρίζεται έναν πράκτορα.

## Ιεραρχία Διαμόρφωσης

Το azd χρησιμοποιεί ένα ιεραρχικό σύστημα διαμόρφωσης:
1. **Σημαίες γραμμής εντολών** (υψηλότερη προτεραιότητα)
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

# Ορισμός προεπιλεγμένου κανόνα ονομασίας για ομάδες πόρων
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Προβολή όλων των παγκόσμιων ρυθμίσεων
azd config show

# Κατάργηση ρύθμισης
azd config unset defaults.location
```

### Συνηθισμένες Παγκόσμιες Ρυθμίσεις
```bash
# Προτιμήσεις ανάπτυξης
azd config set alpha.enable true                    # Ενεργοποίηση λειτουργιών alpha
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

### Δομή του `azure.yaml`
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

#### Ρυθμίσεις ανά Γλώσσα
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

# Δημιουργήστε σε συγκεκριμένη τοποθεσία
azd env new staging --location "westus2"

# Δημιουργήστε από πρότυπο
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
# Ορισμός μεταβλητών ειδικών για το περιβάλλον
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Προβολή μεταβλητών περιβάλλοντος
azd env get-values

# Αναμενόμενη έξοδος:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Κατάργηση μεταβλητής περιβάλλοντος
azd env unset DEBUG

# Επαλήθευση αφαίρεσης
azd env get-values | grep DEBUG
# (δεν θα πρέπει να επιστρέψει τίποτα)
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
# Χρησιμοποιήστε τα διαπιστευτήρια του Azure CLI (προεπιλεγμένα)
azd config set auth.useAzureCliCredential true

# Συνδεθείτε με συγκεκριμένο tenant
az login --tenant <tenant-id>

# Ορίστε την προεπιλεγμένη συνδρομή
az account set --subscription <subscription-id>
```

### Αυθεντικοποίηση μέσω Service Principal
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

### Διαμόρφωση Build
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

## 🔧 Προχωρημένη Διαμόρφωση

### Προσαρμοσμένη Ονοματοδοσία Πόρων
```bash
# Ορίστε τις συμβάσεις ονοματοδοσίας
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

### Διαμόρφωση Παρακολούθησης
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

## 🎯 Διαμορφώσεις Ειδικές για Περιβάλλον

### Περιβάλλον Ανάπτυξης
```bash
# .azure/development/.env
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
# Ελέγξτε τη σύνταξη της διαμόρφωσης
azd config validate

# Δοκιμάστε τις μεταβλητές περιβάλλοντος
azd env get-values

# Επαληθεύστε την υποδομή
azd provision --dry-run
```

### Σενάρια Διαμόρφωσης
Δημιουργήστε σκριπτά επικύρωσης στο `scripts/`:

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

## 🎓 Καλές Πρακτικές

### 1. Χρησιμοποιήστε Μεταβλητές Περιβάλλοντος
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Οργανώστε τα Αρχεία Διαμόρφωσης
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

### 3. Θέματα για τον Έλεγχο Εκδόσεων
```bash
# .gitignore
.azure/*/config.json         # Ρυθμίσεις περιβάλλοντος (περιέχουν αναγνωριστικά πόρων)
.azure/*/.env               # Μεταβλητές περιβάλλοντος (μπορεί να περιέχουν μυστικά)
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

### Άσκηση 1: Διαμόρφωση Πολυ-Περιβάλλοντος (15 λεπτά)

**Στόχος**: Δημιουργήστε και διαμορφώστε τρία περιβάλλοντα με διαφορετικές ρυθμίσεις

```bash
# Δημιουργήστε περιβάλλον ανάπτυξης
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Δημιουργήστε περιβάλλον δοκιμών
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
- [ ] Μπορείτε να εναλλάσσετε μεταξύ των περιβαλλόντων χωρίς σφάλματα
- [ ] Η εντολή `azd env list` εμφανίζει και τα τρία περιβάλλοντα

### Άσκηση 2: Διαχείριση Μυστικών (10 λεπτά)

**Στόχος**: Εξασκηθείτε σε ασφαλή διαμόρφωση με ευαίσθητα δεδομένα

```bash
# Ορίστε μυστικά (δεν εμφανίζονται στην έξοδο)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ορίστε μη μυστική διαμόρφωση
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Δείτε το περιβάλλον (τα μυστικά πρέπει να αποκρύπτονται)
azd env get-values

# Επαληθεύστε ότι τα μυστικά αποθηκεύονται
azd env get DB_PASSWORD  # Πρέπει να εμφανίζει την πραγματική τιμή
```

**Κριτήρια Επιτυχίας:**
- [ ] Τα μυστικά αποθηκεύτηκαν χωρίς εμφάνιση στο τερματικό
- [ ] Η εντολή `azd env get-values` εμφανίζει τα μυστικά με απόκρυψη
- [ ] Η εντολή `azd env get <SECRET_NAME>` ανακτά την πραγματική τιμή

## Επόμενα Βήματα

- [Το Πρώτο σας Έργο](first-project.md) - Εφαρμόστε τη διαμόρφωση στην πράξη
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Χρησιμοποιήστε τη διαμόρφωση για ανάπτυξη
- [Προμήθεια Πόρων](../chapter-04-infrastructure/provisioning.md) - Διαμορφώσεις έτοιμες για παραγωγή

## Αναφορές

- [Αναφορά Διαμόρφωσης azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Σχήμα azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Μεταβλητές Περιβάλλοντος](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD For Beginners](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Διαμόρφωση & Αυθεντικοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο σας Έργο](first-project.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../chapter-04-infrastructure/deployment-guide.md)
- **Επόμενο Μάθημα**: [Το Πρώτο σας Έργο](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθύνης**:
Το παρόν έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, παρακαλείστε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->