# Οδηγός Διαμόρφωσης

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Διαμόρφωση & Πιστοποίηση
- **⬅️ Προηγούμενο**: [Το Πρώτο Σου Έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο**: [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομή ως Κώδικας](../chapter-04-infrastructure/deployment-guide.md)

## Εισαγωγή

> Ανασκόπηση σύμφωνα με `azd 1.37.2` (Νοέμβριος 2026). Οι εντολές bash υποθέτουν προετοιμασμένο έργο azd. Εκτός αν περιγράφεται ρητά ως πλήρες αρχείο, τα αποσπάσματα YAML/Bicep είναι θραύσματα για συγχώνευση σε αντίστοιχα αρχεία έργου, όχι ανεξάρτητα εκτελέσιμα έργα.

Αυτός ο πλήρης οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστες ροές εργασίας ανάπτυξης και ανάπτυξης. Θα μάθετε για την ιεραρχία διαμόρφωσης, τη διαχείριση περιβαλλόντων, τις μεθόδους πιστοποίησης και τα προηγμένα πρότυπα διαμόρφωσης που επιτρέπουν αποδοτικές και ασφαλείς αναπτύξεις στο Azure.

## Στόχοι Μάθησης

Μέχρι το τέλος αυτού του μαθήματος, θα:
- Εξειδικεύσετε την ιεραρχία διαμόρφωσης του azd και κατανοήσετε πώς δίνεται προτεραιότητα στις ρυθμίσεις
- Διαμορφώσετε αποτελεσματικά τις παγκόσμιες και έργου-ειδικές ρυθμίσεις
- Διαχειρίζεστε πολλαπλά περιβάλλοντα με διαφορές στις ρυθμίσεις
- Υλοποιήσετε ασφαλή πρότυπα πιστοποίησης και εξουσιοδότησης
- Κατανοήσετε προχωρημένα πρότυπα διαμόρφωσης για πολύπλοκα σενάρια

## Αποτελέσματα Μάθησης

Μετά την ολοκλήρωση αυτού του μαθήματος, θα μπορείτε να:
- Διαμορφώσετε το azd για βέλτιστες ροές εργασίας ανάπτυξης
- Ρυθμίσετε και διαχειριστείτε πολλαπλά περιβάλλοντα ανάπτυξης
- Υλοποιήσετε ασφαλείς πρακτικές διαχείρισης διαμόρφωσης
- Αντιμετωπίσετε προβλήματα που σχετίζονται με τη διαμόρφωση
- Προσαρμόσετε τη συμπεριφορά του azd για συγκεκριμένες οργανωτικές απαιτήσεις

Αυτός ο πλήρης οδηγός καλύπτει όλες τις πτυχές της διαμόρφωσης του Azure Developer CLI για βέλτιστες ροές εργασίας ανάπτυξης και ανάπτυξης.

## Κατανόηση των Πρακτόρων Τεχνητής Νοημοσύνης σε ένα έργο azd

Αν είστε νέος στους πράκτορες AI, εδώ είναι ένας απλός τρόπος να τους σκεφτείτε μέσα στον κόσμο του azd.

### Τι Είναι ένας Πράκτορας;

Ένας πράκτορας είναι ένα λογισμικό που μπορεί να λάβει μια αίτηση, να την αναλύσει και να κάνει ενέργειες—συχνά καλώντας ένα μοντέλο AI, αναζητώντας δεδομένα ή ενεργοποιώντας άλλες υπηρεσίες. Σε ένα έργο azd, ένας πράκτορας είναι απλώς μια άλλη **υπηρεσία** δίπλα στο frontend ιστού ή το backend API σας.

### Πώς Εντάσσονται οι Πράκτορες στη Δομή του έργου azd

Ένα έργο azd αποτελείται από τρία επίπεδα: **υποδομή**, **κώδικας** και **διαμόρφωση**. Οι πράκτορες συνδέονται σε αυτά τα επίπεδα όπως κάθε άλλη υπηρεσία:

| Επίπεδο | Τι Κάνει για μια Παραδοσιακή Εφαρμογή | Τι Κάνει για έναν Πράκτορα |
|-------|-------------------------------------|---------------------------|
| **Υποδομή** (`infra/`) | Παρέχει μια εφαρμογή ιστού και βάση δεδομένων | Παρέχει ένα endpoint μοντέλου AI, ευρετήριο αναζήτησης ή ξενιστή πράκτορα |
| **Κώδικας** (`src/`) | Περιλαμβάνει τον frontend και τον πηγαίο κώδικα API | Περιλαμβάνει τη λογική του πράκτορα και τους ορισμούς prompt |
| **Διαμόρφωση** (`azure.yaml`) | Καταγράφει τις υπηρεσίες σας και τους ξενιστές τους | Καταγράφει τον πράκτορα ως υπηρεσία, δείχνοντας στον κώδικα και τον ξενιστή του |

### Ο Ρόλος του `azure.yaml`

Δεν χρειάζεται να απομνημονεύσετε τη σύνταξη αυτή τη στιγμή. Εννοιολογικά, `azure.yaml` είναι το αρχείο όπου λέτε στο azd: *"Εδώ είναι οι υπηρεσίες που αποτελούν την εφαρμογή μου, και εδώ βρίσκονται οι κώδικάς τους."*

Όταν το έργο σας περιλαμβάνει έναν πράκτορα AI, το `azure.yaml` απλώς καταγράφει αυτόν τον πράκτορα ως μία από τις υπηρεσίες. Το azd γνωρίζει τότε να παρέχει τη σωστή υποδομή (όπως ένα endpoint Microsoft Foundry Models ή μια Container App για να φιλοξενήσει τον πράκτορα) και να αναπτύσσει τον κώδικα του πράκτορα—όπως ακριβώς θα έκανε για μια εφαρμογή ιστού ή API.

Αυτό σημαίνει πως δεν υπάρχει τίποτα θεμελιωδώς νέο να μάθετε. Αν καταλαβαίνετε πώς διαχειρίζεται το azd μια υπηρεσία ιστού, ήδη καταλαβαίνετε πώς διαχειρίζεται έναν πράκτορα.

## Ιεραρχία Διαμόρφωσης

Το azd έχει διακριτές επιφάνειες διαμόρφωσης, όχι ένα καθολικό επικάλυμμα:
- **Παγκόσμιες προτιμήσεις χρήστη**: `~/.azd/config.json`, διαχειρίζεται από `azd config`.
- **Ορισμός έργου**: `azure.yaml` ορίζει υπηρεσίες, υποδομή και hooks.
- **Επιλογή τοπικού περιβάλλοντος**: `.azure/config.json`.
- **Τιμές ανά περιβάλλον**: `.azure/<name>/.env`, διαχειρίζεται από `azd env`; επιπλέον ρυθμίσεις βρίσκονται στο `config.json` του περιβάλλοντος.
- **Σημαίες και μεταβλητές διεργασιών**: παρακάμπτουν μόνο ρυθμίσεις που υποστηρίζονται από μια συγκεκριμένη εντολή/πάροχο.

Μια αυθαίρετη τιμή `azd env set` δεν γίνεται αυτόματα παράμετρος υποδομής ή ρυθμιζόμενη ρύθμιση εφαρμογής που αναπτύσσεται. Αναφέρετέ την ρητά στο αρχείο παραμέτρων, την υποστηριζόμενη διαμόρφωση υπηρεσίας ή σε ένα hook.

## Παγκόσμια Διαμόρφωση

### Ορισμός Παγκόσμιων Προεπιλογών
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Κοινοί Παγκόσμιοι Ρυθμίσεις
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Διαμόρφωση Έργου

### Δομή azure.yaml
Το αρχείο `azure.yaml` είναι η καρδιά του έργου azd σας:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

Αυτό είναι ένα **παράδειγμα ορισμού έργου**, όχι ένα παρεχόμενο ξεκίνημα. Δημιουργήστε τους αναφερόμενους φακέλους πηγής, scripts hooks, scripts πακέτου και αντίστοιχα `infra/main.bicep`/`main.parameters.json` πριν το εκτελέσετε. Οι βάσεις δεδομένων ανήκουν στην υποδομή· το `postgres` δεν είναι built-in ξενιστής υπηρεσίας. Οι παράμετροι υποδομής τοποθετούνται στο αρχείο παραμέτρων του παρόχου, όχι στο `infra.parameters`.

### Επιλογές Διαμόρφωσης Υπηρεσίας

#### Τύποι Ξενιστών
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

#### Hooks Κατασκευής ανά Γλώσσα

Τα ακόλουθα θραύσματα υπηρεσιών απεικονίζουν hooks· συγχωνεύστε τα με τον πραγματικό `project` και `host` κάθε υπηρεσίας. `buildCommand` και `startCommand` δεν είναι γενικά χαρακτηριστικά υπηρεσίας azd. Διαμορφώστε το ξεκίνημα στην εφαρμογή, Dockerfile ή υποδομή ξενιστή.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Διαχείριση Περιβαλλόντων

### Δημιουργία Περιβαλλόντων
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Διαμόρφωση Περιβάλλοντος
Οι βασικές τιμές περιβάλλοντος ζουν στο `.azure/<env-name>/.env`, μεταξύ αυτών `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, και `AZURE_LOCATION`. Χρησιμοποιήστε `azd env config get/set` για επιπλέον JSON ρυθμίσεις περιβάλλοντος. Το ακόλουθο JSON είναι **εννοιολογική κατάσταση εφαρμογής**, όχι σχήμα διαμόρφωσης azd· μην το αντιγράφετε στα αρχεία azd:

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

**Επίδειξη απλού κειμένου μόνο.** Οι συνηθισμένες τιμές `azd env set` γράφονται στο `.azure/<name>/.env` και μπορούν να εμφανιστούν με εντολές ανάγνωσης. Μην χρησιμοποιείτε το παράδειγμα κλειδιού API ως πραγματική πιστοποίηση. Για μυστικά, χρησιμοποιήστε `azd env set-secret` και ρητή σύνδεση εκτέλεσης.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Πρότυπα Περιβάλλοντος
Δημιουργήστε ένα **μη μυστικό, χειροκίνητα διαχειριζόμενο** `.env.example` στη ρίζα του έργου για συνεπή εγκατάσταση. Το azd δεν φορτώνει αυτόματα αρχείο με όνομα `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Κοινή Χρήση Περιβαλλόντων στην Ομάδα

Όταν περισσότεροι από ένας εργάζονται σε ένα έργο, πρέπει να συμφωνήσετε **τι ταξιδεύει με το αποθετήριο και τι παραμένει τοπικό**. Το azd κρατά κάθε περιβάλλον υπό φάκελο `.azure/`, και δεν πρέπει να δεσμεύονται όλα.

**Τι περιέχεται στον `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Τι να αγνοείται από το git.** Η προεπιλεγμένη `.gitignore` του azd αποκλείει ήδη το `.azure/`. Διατηρήστε το έτσι—τα αρχεία `.env` μπορούν να περιέχουν μυστικά, και τα IDs πόρων είναι συγκεκριμένα στον προμηθευτή τους. Κάθε μέλος της ομάδας δημιουργεί το **δικό του** περιβάλλον τοπικά:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Εναλλαγή μεταξύ περιβαλλόντων.** Ένας προγραμματιστής που διαχειρίζεται πολλά περιβάλλοντα επιλέγει το ενεργό πριν από την εκτέλεση εντολών:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Παροχή μη μυστικών προεπιλογών στην ομάδα.** Δεσμεύστε το `.env.example` έξω από τον αγνοούμενο φάκελο `.azure/`. Νέα μέλη της ομάδας το αντιγράφουν σε τοπικό αγνοούμενο αρχείο, συμπληρώνουν τιμές και το εισάγουν ρητά με `azd env set --file <local-file>`. Μην εισάγετε ποτέ κενά σημεία κράτησης πάνω σε ένα λειτουργικό περιβάλλον.

**Περιβάλλοντα σε CI/CD.** Οι σωληνώσεις δεν διαβάζουν το τοπικό σας `.azure/` φάκελο. Αντ’ αυτού, παρέχετε τις τιμές περιβάλλοντος ως μεταβλητές/μυστικά στις σωληνώσεις, και το azd τα διαβάζει από το περιβάλλον διεργασίας:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Κανόνας του αντίχειρα:** ο κώδικας υποδομής (`infra/`, `azure.yaml`) μοιράζεται στο Git· η *κατάσταση και τα μυστικά* (`.azure/`) του περιβάλλοντος είναι ανά-προγραμματιστή και ανά-αγωγό. Το `azd pipeline config` ρυθμίζει αυτόματα τις μεταβλητές του αγωγού για εσάς.

## 🔐 Διαμόρφωση Αυθεντικοποίησης

### Ενσωμάτωση Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Αυθεντικοποίηση με Service Principal
Για αγωγούς CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Διαχειριζόμενη Ταυτότητα
Για περιβάλλοντα φιλοξενούμενα στην Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
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
Για έργα Terraform, το azd αντικαθιστά τους κρατήρες στο `infra/main.tfvars.json`. Αυτά τα ονόματα πρέπει να ταιριάζουν με τις δηλωμένες εισερχόμενες μεταβλητές του Terraform:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Διαμόρφωση Ανάπτυξης

### Διαμόρφωση Κατασκευής
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Διαμόρφωση Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Οι διαδρομές είναι σχετικές με το έργο υπηρεσίας. Το Dockerfile πρέπει να δηλώνει κάθε `ARG` τιμή που χρησιμοποιεί. Για μια πολυ-στάδιο κατασκευή, βάλτε το στάδιο ανάπτυξης στο τέλος ή χρησιμοποιήστε μια προσαρμοσμένη ροή εργασίας συσκευασίας· το `docker.target` δεν είναι υποστηριζόμενο χαρακτηριστικό στο εξεταζόμενο σχήμα.

## 🔧 Προχωρημένη Διαμόρφωση

### Προσαρμοσμένη Ονομασία Πόρων
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Ορίστε τα πραγματικά ονόματα πόρων σε Bicep/Terraform και κρατήστε τη δημιουργία ομάδας πόρων συνεπή με αυτή τη ρύθμιση. Δεν υπάρχουν γενικές ρυθμίσεις `naming.storageAccount` ή `naming.keyVault`.

### Διαμόρφωση Δικτύου
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Συγχωνεύστε αυτές τις **εικονικές εγγραφές παραμέτρων** στο `infra/main.parameters.json` κάτω από `parameters`, και δηλώστε και χρησιμοποιήστε τις αντίστοιχες παραμέτρους σε Bicep. Δεν κάνουν τίποτα από μόνες τους.

### Διαμόρφωση Παρακολούθησης
Παρέχετε το Application Insights και το Log Analytics σε Bicep/Terraform και ρυθμίστε την τηλεμετρία εφαρμογής στο SDK σας. Δεν υπάρχει γενικό ανώτερο `monitoring` μπλοκ στο `azure.yaml` που δημιουργεί αυτούς τους πόρους. Δείτε [υποδομή παρακολούθησης](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Διαμορφώσεις Ειδικές για Περιβάλλον

### Περιβάλλον Ανάπτυξης
```bash
# .azure/development/.env
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
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Επικύρωση Διαμόρφωσης

### Επικυρώστε τη Διαμόρφωση
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Σενάρια Διαμόρφωσης
Δημιουργήστε σενάρια επικύρωσης στο `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Καλές πρακτικές

### 1. Χρησιμοποιήστε Περιβαλλοντικές Μεταβλητές
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Αποφύγετε την ενσωμάτωση ευαίσθητων τιμών άμεσα στον κώδικα (ξεχωριστή εικονική διαμόρφωση, όχι δεύτερο `database` κλειδί στο ίδιο αρχείο):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Οργανώστε Τα Αρχεία Διαμόρφωσης
```
.azure/
├── config.json              # Global project config
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

### 3. Σκέψεις για τον Έλεγχο Εκδόσεων
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
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

**Στόχος**: Δημιουργήστε και διαμορφώστε τρία τοπικά περιβάλλοντα με διαφορετικές τιμές. Ξεκινήστε σε ένα αρχικοποιημένο έργο· χρησιμοποιήστε μη χρησιμοποιημένα ονόματα αν αυτά ήδη υπάρχουν. Αυτές οι τιμές συγκεκριμένες εφαρμογής δεν αλλάζουν τις ρυθμίσεις τηλεμετρίας/εκτέλεσης μέχρι να τις καταναλώσει το πρότυπό σας.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Κριτήρια Επιτυχίας:**
- [ ] Δημιουργήθηκαν επιτυχώς τρία περιβάλλοντα
- [ ] Κάθε περιβάλλον έχει μοναδική διαμόρφωση
- [ ] Μπορεί να γίνει εναλλαγή μεταξύ περιβαλλόντων χωρίς σφάλματα
- [ ] `azd env list` εμφανίζει και τα τρία περιβάλλοντα

### Άσκηση 2: Απαντήσεις Μυστικών Key Vault (10-20 λεπτά)

**Στόχος**: Αποθηκεύστε μια αναφορά Key Vault αντί για απλό κείμενο. **Σημείο εκκίνησης:** ένα αρχικοποιημένο περιβάλλον, σύνδεση Azure και πρόσβαση σε ένα Key Vault με δικαιώματα για δημιουργία/ανάγνωση ενός δοκιμαστικού μυστικού. Οι λειτουργίες του Vault μπορεί να χρεώνονται.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Κριτήρια Επιτυχίας:**
- [ ] Η διαδραστική εντολή αναφέρει το επιλεγμένο vault και την αναφορά μυστικού
- [ ] Το τοπικό `.env` περιέχει αναφορά αντί για το δοκιμαστικό μυστικό
- [ ] Μπορεί να εξηγήσει ότι η ταυτότητα χρόνου εκτέλεσης/RBAC και η κατανάλωση πρέπει ακόμα να διαμορφωθούν

**Συνηθισμένα προβλήματα:** ένα 403 απαιτεί το σωστό ρόλο data-plane στο vault και χρόνο διάδοσης· το `azd env set ... --secret` δεν είναι έγκυρη εντολή. Τα συνηθισμένα `get-values`/`get-value` δεν πρέπει να θεωρούνται εξορισμού λογοκριμένα. Αφαιρέστε την αναφορά εκπαίδευσης με `azd env unset TRAINING_API_KEY`· αυτό δεν διαγράφει το μυστικό vault, το οποίο πρέπει να καθαρίσετε ξεχωριστά αν το δημιουργήσατε.

## Επόμενα Βήματα

- [Το Πρώτο σας Έργο](../chapter-01-foundation/first-project.md) - Εφαρμόστε διαμόρφωση στην πράξη
- [Οδηγός Ανάπτυξης](../chapter-04-infrastructure/deployment-guide.md) - Χρησιμοποιήστε διαμόρφωση για ανάπτυξη
- [Προμήθεια Πόρων](../chapter-04-infrastructure/provisioning.md) - Διαμορφώσεις έτοιμες για παραγωγή

## Αναφορές

- [Αναφορά Διαμόρφωσης azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Διάγραμμα azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Μεταβλητές Περιβάλλοντος](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Πλοήγηση Κεφαλαίου:**
- **📚 Αρχική Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Τρέχον Κεφάλαιο**: Κεφάλαιο 3 - Διαμόρφωση & Επαλήθευση
- **⬅️ Προηγούμενο**: [Το Πρώτο Σου Έργο](../chapter-01-foundation/first-project.md)
- **➡️ Επόμενο Κεφάλαιο**: [Κεφάλαιο 4: Υποδομές ως Κώδικας](../chapter-04-infrastructure/deployment-guide.md)
- **Επόμενο Μάθημα**: [Επαλήθευση & Ασφάλεια](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Αποποίηση ευθυνών**:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Ενώ επιδιώκουμε την ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->