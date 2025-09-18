<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "eb84941706983946ae03bfa0433c0bb6",
  "translation_date": "2025-09-17T23:40:33+00:00",
  "source_file": "examples/retail-multiagent-arm-template/README.md",
  "language_code": "el"
}
-->
# Λύση Λιανικής Πολλαπλών Πρακτόρων - Ανάπτυξη ARM Template

**Κεφάλαιο 5: Πακέτο Ανάπτυξης Παραγωγής**
- **📚 Αρχική Σελίδα Μαθήματος**: [AZD Για Αρχάριους](../../README.md)
- **📖 Σχετικό Κεφάλαιο**: [Κεφάλαιο 5: Λύσεις AI Πολλαπλών Πρακτόρων](../../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **📝 Οδηγός Σεναρίου**: [Πλήρης Υλοποίηση](../retail-scenario.md)
- **🎯 Γρήγορη Ανάπτυξη**: [Ανάπτυξη με Ένα Κλικ](../../../../examples/retail-multiagent-arm-template)

Αυτός ο φάκελος περιέχει ένα πλήρες Azure Resource Manager (ARM) template για την ανάπτυξη της λύσης λιανικής Πολλαπλών Πρακτόρων Υποστήριξης Πελατών, παρέχοντας υποδομή ως κώδικα για ολόκληρη την αρχιτεκτονική.

## 🎯 Τι Αναπτύσσεται

### Βασική Υποδομή
- **Υπηρεσίες Azure OpenAI** (Πολλαπλές περιοχές για υψηλή διαθεσιμότητα)
  - Κύρια περιοχή: GPT-4o για τον πράκτορα πελατών
  - Δευτερεύουσα περιοχή: GPT-4o-mini για τον πράκτορα αποθεμάτων  
  - Τριτογενής περιοχή: Μοντέλο ενσωμάτωσης κειμένου
  - Περιοχή αξιολόγησης: Μοντέλο αξιολόγησης GPT-4o
- **Azure AI Search** με δυνατότητες αναζήτησης μέσω διανυσμάτων
- **Azure Storage Account** με blob containers για έγγραφα και μεταφορτώσεις
- **Azure Container Apps Environment** με αυτόματη κλιμάκωση
- **Container Apps** για δρομολογητή πρακτόρων και frontend
- **Azure Cosmos DB** για αποθήκευση ιστορικού συνομιλιών
- **Azure Key Vault** για διαχείριση μυστικών (προαιρετικό)
- **Application Insights** και Log Analytics για παρακολούθηση (προαιρετικό)
- **Document Intelligence** για επεξεργασία εγγράφων
- **Bing Search API** για πληροφορίες σε πραγματικό χρόνο

### Τρόποι Ανάπτυξης

| Τρόπος | Περιγραφή | Χρήση | Πόροι |
|-------|-----------|-------|-------|
| **Ελάχιστος** | Βασική ανάπτυξη με χαμηλό κόστος | Ανάπτυξη, δοκιμές | Βασικά SKUs, μία περιοχή, μειωμένη χωρητικότητα |
| **Κανονικός** | Ισορροπημένη ανάπτυξη για παραγωγικά φορτία | Παραγωγή, μέτρια κλίμακα | Κανονικά SKUs, πολλαπλές περιοχές, κανονική χωρητικότητα |
| **Premium** | Υψηλή απόδοση, ανάπτυξη για επιχειρήσεις | Επιχειρήσεις, μεγάλη κλίμακα | Premium SKUs, πολλαπλές περιοχές, υψηλή χωρητικότητα |

## 📋 Προαπαιτούμενα

1. **Εγκατεστημένο και ρυθμισμένο Azure CLI**
2. **Ενεργή συνδρομή Azure** με επαρκείς ποσοστώσεις
3. **Κατάλληλες άδειες** για δημιουργία πόρων στη συνδρομή στόχου
4. **Ποσοστώσεις πόρων** για:
   - Azure OpenAI (ελέγξτε τη διαθεσιμότητα ανά περιοχή)
   - Container Apps (διαφέρει ανά περιοχή)
   - AI Search (συνιστάται το standard tier ή υψηλότερο)

## 🚀 Γρήγορη Ανάπτυξη

### Επιλογή 1: Χρήση Azure CLI

```bash
# Clone or download the template files
git clone <repository-url>
cd examples/retail-multiagent-arm-template

# Make the deployment script executable
chmod +x deploy.sh

# Deploy with default settings
./deploy.sh -g myResourceGroup

# Deploy for production with premium features
./deploy.sh -g myProdRG -e prod -m premium -l eastus2
```

### Επιλογή 2: Χρήση Azure Portal

[![Deploy to Azure](https://aka.ms/deploytoazurebutton)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fmicrosoft%2Fazd-for-beginners%2Fmain%2Fexamples%2Fretail-multiagent-arm-template%2Fazuredeploy.json)

### Επιλογή 3: Χρήση Azure CLI απευθείας

```bash
# Create resource group
az group create --name myResourceGroup --location eastus2

# Deploy template
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json
```

## ⚙️ Επιλογές Παραμετροποίησης

### Παράμετροι Template

| Παράμετρος | Τύπος | Προεπιλογή | Περιγραφή |
|------------|-------|------------|-----------|
| `projectName` | string | "retail" | Πρόθεμα για όλα τα ονόματα πόρων |
| `location` | string | Τοποθεσία ομάδας πόρων | Κύρια περιοχή ανάπτυξης |
| `secondaryLocation` | string | "westus2" | Δευτερεύουσα περιοχή για ανάπτυξη πολλαπλών περιοχών |
| `tertiaryLocation` | string | "francecentral" | Περιοχή για το μοντέλο ενσωμάτωσης |
| `environmentName` | string | "dev" | Ορισμός περιβάλλοντος (dev/staging/prod) |
| `deploymentMode` | string | "standard" | Ρύθμιση ανάπτυξης (minimal/standard/premium) |
| `enableMultiRegion` | bool | true | Ενεργοποίηση ανάπτυξης πολλαπλών περιοχών |
| `enableMonitoring` | bool | true | Ενεργοποίηση Application Insights και καταγραφής |
| `enableSecurity` | bool | true | Ενεργοποίηση Key Vault και αυξημένης ασφάλειας |

### Προσαρμογή Παραμέτρων

Επεξεργαστείτε το `azuredeploy.parameters.json`:

```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "projectName": {
      "value": "mycompany"
    },
    "environmentName": {
      "value": "prod"
    },
    "deploymentMode": {
      "value": "premium"
    },
    "location": {
      "value": "eastus2"
    }
  }
}
```

## 🏗️ Επισκόπηση Αρχιτεκτονικής

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Frontend      │    │  Agent Router   │    │     Agents      │
│ (Container App) │───▶│ (Container App) │───▶│ Customer + Inv  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   AI Search     │    │  Azure OpenAI   │    │    Storage      │
│   (Vector DB)   │    │ (Multi-region)  │    │   (Documents)   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                        │
                                ▼                        ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Cosmos DB      │    │ App Insights    │    │   Key Vault     │
│ (Chat History)  │    │  (Monitoring)   │    │   (Secrets)     │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

## 📖 Χρήση Εντολών Ανάπτυξης

Το script `deploy.sh` παρέχει μια διαδραστική εμπειρία ανάπτυξης:

```bash
# Show help
./deploy.sh --help

# Basic deployment
./deploy.sh -g myResourceGroup

# Advanced deployment with custom settings
./deploy.sh \
  -g myProductionRG \
  -p companyname \
  -e prod \
  -m premium \
  -l eastus2

# Development deployment without multi-region
./deploy.sh \
  -g myDevRG \
  -e dev \
  -m minimal \
  --no-multi-region \
  --no-security
```

### Δυνατότητες Script

- ✅ **Επαλήθευση προαπαιτούμενων** (Azure CLI, κατάσταση σύνδεσης, αρχεία template)
- ✅ **Διαχείριση ομάδας πόρων** (δημιουργεί αν δεν υπάρχει)
- ✅ **Επαλήθευση template** πριν την ανάπτυξη
- ✅ **Παρακολούθηση προόδου** με έγχρωμη έξοδο
- ✅ **Εμφάνιση αποτελεσμάτων ανάπτυξης**
- ✅ **Οδηγίες μετά την ανάπτυξη**

## 📊 Παρακολούθηση Ανάπτυξης

### Έλεγχος Κατάστασης Ανάπτυξης

```bash
# List deployments
az deployment group list --resource-group myResourceGroup --output table

# Get deployment details
az deployment group show \
  --resource-group myResourceGroup \
  --name retail-deployment-YYYYMMDD-HHMMSS

# Watch deployment progress
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --verbose
```

### Αποτελέσματα Ανάπτυξης

Μετά από επιτυχή ανάπτυξη, είναι διαθέσιμα τα εξής αποτελέσματα:

- **Frontend URL**: Δημόσιο endpoint για το web interface
- **Router URL**: API endpoint για τον δρομολογητή πρακτόρων
- **OpenAI Endpoints**: Κύρια και δευτερεύουσα endpoints υπηρεσιών OpenAI
- **Search Service**: Endpoint υπηρεσίας Azure AI Search
- **Storage Account**: Όνομα του λογαριασμού αποθήκευσης για έγγραφα
- **Key Vault**: Όνομα του Key Vault (αν είναι ενεργοποιημένο)
- **Application Insights**: Όνομα της υπηρεσίας παρακολούθησης (αν είναι ενεργοποιημένο)

## 🔧 Ρυθμίσεις Μετά την Ανάπτυξη

### 1. Ρύθμιση Δείκτη Αναζήτησης

```bash
# Set environment variables from deployment outputs
export SEARCH_SERVICE_NAME="<search-service-name>"
export SEARCH_ADMIN_KEY="<search-admin-key>"

# Create search index (customize schema as needed)
curl -X POST "https://${SEARCH_SERVICE_NAME}.search.windows.net/indexes?api-version=2023-11-01" \
  -H "Content-Type: application/json" \
  -H "api-key: ${SEARCH_ADMIN_KEY}" \
  -d @../data/search-schema.json
```

### 2. Μεταφόρτωση Αρχικών Δεδομένων

```bash
# Upload documents to storage
az storage blob upload-batch \
  --destination documents \
  --source ../data/initial-docs \
  --account-name <storage-account-name>
```

### 3. Δοκιμή Endpoints Πρακτόρων

```bash
# Test router endpoint
curl -X POST "<router-url>/chat" \
  -H "Content-Type: application/json" \
  -d '{
    "message": "Hello, I need help with my order",
    "agent": "customer"
  }'
```

### 4. Ρύθμιση Container Apps

Το ARM template αναπτύσσει placeholder container images. Για να αναπτύξετε πραγματικό κώδικα πρακτόρων:

```bash
# Build and push agent images
docker build -t myregistry.azurecr.io/agent-router:latest ./src/router
docker build -t myregistry.azurecr.io/frontend:latest ./src/frontend

# Update container apps
az containerapp update \
  --name retail-router \
  --resource-group myResourceGroup \
  --image myregistry.azurecr.io/agent-router:latest
```

## 🛠️ Επίλυση Προβλημάτων

### Συνηθισμένα Θέματα

#### 1. Υπέρβαση Ποσοστώσεων Azure OpenAI

```bash
# Check current quota usage
az cognitiveservices usage list --location eastus2

# Request quota increase
az support tickets create \
  --ticket-name "OpenAI-Quota-Increase" \
  --severity "minimal" \
  --description "Request quota increase for Azure OpenAI in region X"
```

#### 2. Αποτυχία Ανάπτυξης Container Apps

```bash
# Check container app logs
az containerapp logs show \
  --name retail-router \
  --resource-group myResourceGroup \
  --follow

# Restart container app
az containerapp revision restart \
  --name retail-router \
  --resource-group myResourceGroup
```

#### 3. Αρχικοποίηση Υπηρεσίας Αναζήτησης

```bash
# Verify search service status
az search service show \
  --name <search-service-name> \
  --resource-group myResourceGroup

# Test search service connectivity
curl -X GET "https://<search-service-name>.search.windows.net/indexes?api-version=2023-11-01" \
  -H "api-key: <search-admin-key>"
```

### Επαλήθευση Ανάπτυξης

```bash
# Validate all resources are created
az resource list \
  --resource-group myResourceGroup \
  --output table

# Check resource health
az resource list \
  --resource-group myResourceGroup \
  --query "[?provisioningState!='Succeeded'].{Name:name, Status:provisioningState, Type:type}" \
  --output table
```

## 🔐 Σκέψεις Ασφαλείας

### Διαχείριση Κλειδιών
- Όλα τα μυστικά αποθηκεύονται στο Azure Key Vault (όταν είναι ενεργοποιημένο)
- Τα container apps χρησιμοποιούν διαχειριζόμενη ταυτότητα για αυθεντικοποίηση
- Οι λογαριασμοί αποθήκευσης έχουν ασφαλείς προεπιλογές (μόνο HTTPS, χωρίς δημόσια πρόσβαση blob)

### Ασφάλεια Δικτύου
- Τα container apps χρησιμοποιούν εσωτερική δικτύωση όπου είναι δυνατόν
- Η υπηρεσία αναζήτησης έχει ρυθμιστεί με επιλογή ιδιωτικών endpoints
- Το Cosmos DB έχει ρυθμιστεί με ελάχιστα απαραίτητα δικαιώματα

### Ρύθμιση RBAC
```bash
# Assign necessary roles for managed identity
az role assignment create \
  --assignee <container-app-managed-identity> \
  --role "Cognitive Services OpenAI User" \
  --scope <openai-resource-id>
```

## 💰 Βελτιστοποίηση Κόστους

### Εκτιμήσεις Κόστους (Μηνιαία, USD)

| Τρόπος | OpenAI | Container Apps | Αναζήτηση | Αποθήκευση | Σύνολο Εκτίμησης |
|-------|--------|----------------|-----------|------------|------------------|
| Ελάχιστος | $50-200 | $20-50 | $25-100 | $5-20 | $100-370 |
| Κανονικός | $200-800 | $100-300 | $100-300 | $20-50 | $420-1450 |
| Premium | $500-2000 | $300-800 | $300-600 | $50-100 | $1150-3500 |

### Παρακολούθηση Κόστους

```bash
# Set up budget alerts
az consumption budget create \
  --account-name <subscription-id> \
  --budget-name "retail-budget" \
  --amount 500 \
  --time-grain Monthly \
  --start-date 2024-01-01 \
  --end-date 2024-12-31
```

## 🔄 Ενημερώσεις και Συντήρηση

### Ενημερώσεις Template
- Χρησιμοποιήστε έλεγχο εκδόσεων για τα αρχεία ARM template
- Δοκιμάστε αλλαγές πρώτα σε περιβάλλον ανάπτυξης
- Χρησιμοποιήστε λειτουργία ανάπτυξης incremental για ενημερώσεις

### Ενημερώσεις Πόρων
```bash
# Update with new parameters
az deployment group create \
  --resource-group myResourceGroup \
  --template-file azuredeploy.json \
  --parameters azuredeploy.parameters.json \
  --mode Incremental
```

### Αντίγραφα Ασφαλείας και Ανάκτηση
- Ενεργοποιημένο αυτόματο αντίγραφο ασφαλείας για Cosmos DB
- Ενεργοποιημένη μαλακή διαγραφή για Key Vault
- Διατηρούνται αναθεωρήσεις container app για επαναφορά

## 📞 Υποστήριξη

- **Θέματα Template**: [GitHub Issues](https://github.com/microsoft/azd-for-beginners/issues)
- **Υποστήριξη Azure**: [Azure Support Portal](https://portal.azure.com/#blade/Microsoft_Azure_Support/HelpAndSupportBlade)
- **Κοινότητα**: [Azure AI Discord](https://discord.gg/microsoft-azure)

---

**⚡ Έτοιμοι να αναπτύξετε τη λύση πολλαπλών πρακτόρων σας;**

Ξεκινήστε με: `./deploy.sh -g myResourceGroup`

---

**Αποποίηση ευθύνης**:  
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία αυτόματης μετάφρασης [Co-op Translator](https://github.com/Azure/co-op-translator). Παρόλο που καταβάλλουμε προσπάθειες για ακρίβεια, παρακαλούμε να έχετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν λάθη ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα θα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες, συνιστάται επαγγελματική ανθρώπινη μετάφραση. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή εσφαλμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.