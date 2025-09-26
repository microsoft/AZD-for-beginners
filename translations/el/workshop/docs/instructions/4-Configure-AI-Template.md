<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T21:37:59+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "el"
}
-->
# 4. Ρύθμιση Προτύπου

!!! tip "ΜΕΧΡΙ ΤΟ ΤΕΛΟΣ ΑΥΤΗΣ ΤΗΣ ΕΝΟΤΗΤΑΣ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Κατανοήσετε τον σκοπό του `azure.yaml`
    - [ ] Κατανοήσετε τη δομή του `azure.yaml`
    - [ ] Κατανοήσετε την αξία των `hooks` στον κύκλο ζωής του azd
    - [ ] **Εργαστήριο 3:** 

---

!!! prompt "Τι κάνει το αρχείο `azure.yaml`; Χρησιμοποιήστε ένα codefence και εξηγήστε το γραμμή προς γραμμή"

      Το αρχείο `azure.yaml` είναι το **αρχείο ρυθμίσεων για το Azure Developer CLI (azd)**. Ορίζει πώς η εφαρμογή σας πρέπει να αναπτυχθεί στο Azure, συμπεριλαμβανομένων της υποδομής, των υπηρεσιών, των hooks ανάπτυξης και των μεταβλητών περιβάλλοντος.

---

## 1. Σκοπός και Λειτουργικότητα

Το αρχείο `azure.yaml` λειτουργεί ως **οδηγός ανάπτυξης** για μια εφαρμογή AI agent που:

1. **Επαληθεύει το περιβάλλον** πριν την ανάπτυξη
2. **Παρέχει υπηρεσίες Azure AI** (AI Hub, AI Project, Search, κ.λπ.)
3. **Αναπτύσσει μια εφαρμογή Python** σε Azure Container Apps
4. **Ρυθμίζει μοντέλα AI** για συνομιλία και λειτουργικότητα ενσωμάτωσης
5. **Εγκαθιστά παρακολούθηση και ανίχνευση** για την εφαρμογή AI
6. **Διαχειρίζεται τόσο νέα όσο και υπάρχοντα** σενάρια έργων Azure AI

Το αρχείο επιτρέπει **ανάπτυξη με μία εντολή** (`azd up`) μιας ολοκληρωμένης λύσης AI agent με σωστή επαλήθευση, παροχή και ρύθμιση μετά την ανάπτυξη.

??? info "Επέκταση για προβολή: `azure.yaml`"

      Το αρχείο `azure.yaml` ορίζει πώς το Azure Developer CLI πρέπει να αναπτύξει και να διαχειριστεί αυτήν την εφαρμογή AI Agent στο Azure. Ας το αναλύσουμε γραμμή προς γραμμή.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: χρειαζόμαστε hooks; 
      # TODO: χρειαζόμαστε όλες τις μεταβλητές;

      name: azd-get-started-with-ai-agents
      metadata:
      template: azd-get-started-with-ai-agents@1.0.2
      requiredVersions:
      azd: ">=1.14.0"

      hooks:
      preup:
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
            interactive: true
            continueOnError: false
      windows:
            shell: pwsh
            run: ./scripts/validate_env_vars.ps1
            interactive: true
            continueOnError: false      
      postprovision:
      windows:
            shell: pwsh
            run: ./scripts/write_env.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
            continueOnError: true
            interactive: true
      postdeploy:
      windows:
            shell: pwsh
            run: ./scripts/postdeploy.ps1
            continueOnError: true
            interactive: true
      posix:
            shell: sh
            run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
            continueOnError: true
            interactive: true
      services:
      api_and_frontend:
      project: ./src
      language: py
      host: containerapp
      docker:
            image: api_and_frontend
            remoteBuild: true
      pipeline:
      variables:
      - AZURE_RESOURCE_GROUP
      - AZURE_AIHUB_NAME
      - AZURE_AIPROJECT_NAME
      - AZURE_AISERVICES_NAME
      - AZURE_SEARCH_SERVICE_NAME
      - AZURE_APPLICATION_INSIGHTS_NAME
      - AZURE_CONTAINER_REGISTRY_NAME
      - AZURE_KEYVAULT_NAME
      - AZURE_STORAGE_ACCOUNT_NAME
      - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
      - USE_CONTAINER_REGISTRY
      - USE_APPLICATION_INSIGHTS
      - USE_AZURE_AI_SEARCH_SERVICE
      - AZURE_AI_AGENT_NAME
      - AZURE_AI_AGENT_ID
      - AZURE_AI_AGENT_DEPLOYMENT_NAME
      - AZURE_AI_AGENT_DEPLOYMENT_SKU
      - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
      - AZURE_AI_AGENT_MODEL_NAME
      - AZURE_AI_AGENT_MODEL_FORMAT
      - AZURE_AI_AGENT_MODEL_VERSION
      - AZURE_AI_EMBED_DEPLOYMENT_NAME
      - AZURE_AI_EMBED_DEPLOYMENT_SKU
      - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
      - AZURE_AI_EMBED_MODEL_NAME
      - AZURE_AI_EMBED_MODEL_FORMAT
      - AZURE_AI_EMBED_MODEL_VERSION
      - AZURE_AI_EMBED_DIMENSIONS
      - AZURE_AI_SEARCH_INDEX_NAME
      - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
      - AZURE_EXISTING_AIPROJECT_ENDPOINT
      - AZURE_EXISTING_AGENT_ID
      - ENABLE_AZURE_MONITOR_TRACING
      - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
      ```

---

## 2. Ανάλυση του Αρχείου

Ας εξετάσουμε το αρχείο τμήμα προς τμήμα, για να κατανοήσουμε τι κάνει - και γιατί.

### 2.1 **Επικεφαλίδα και Σχήμα (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Γραμμή 1**: Παρέχει επικύρωση σχήματος YAML για υποστήριξη IDE και IntelliSense

### 2.2 Μεταδεδομένα Έργου (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Γραμμή 5**: Ορίζει το όνομα του έργου που χρησιμοποιείται από το Azure Developer CLI
- **Γραμμές 6-7**: Καθορίζει ότι βασίζεται σε πρότυπο έκδοσης 1.0.2
- **Γραμμές 8-9**: Απαιτεί έκδοση 1.14.0 ή νεότερη του Azure Developer CLI

### 2.3 Hooks Ανάπτυξης (11-40)

```yaml title="" linenums="0"
hooks:
  preup:
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/validate_env_vars.sh; ./scripts/validate_env_vars.sh
      interactive: true
      continueOnError: false
    windows:
      shell: pwsh
      run: ./scripts/validate_env_vars.ps1
      interactive: true
      continueOnError: false      
```

- **Γραμμές 11-20**: **Hook πριν την ανάπτυξη** - εκτελείται πριν το `azd up`

      - Σε Unix/Linux: Κάνει το script επαλήθευσης εκτελέσιμο και το εκτελεί
      - Σε Windows: Εκτελεί script επαλήθευσης PowerShell
      - Και τα δύο είναι διαδραστικά και θα σταματήσουν την ανάπτυξη αν αποτύχουν

```yaml  title="" linenums="0"
  postprovision:
    windows:
      shell: pwsh
      run: ./scripts/write_env.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/write_env.sh; ./scripts/write_env.sh;
      continueOnError: true
      interactive: true
```
- **Γραμμές 21-30**: **Hook μετά την παροχή** - εκτελείται αφού δημιουργηθούν οι πόροι Azure

  - Εκτελεί scripts για εγγραφή μεταβλητών περιβάλλοντος
  - Συνεχίζει την ανάπτυξη ακόμα κι αν αυτά τα scripts αποτύχουν (`continueOnError: true`)

```yaml title="" linenums="0"
  postdeploy:
    windows:
      shell: pwsh
      run: ./scripts/postdeploy.ps1
      continueOnError: true
      interactive: true
    posix:
      shell: sh
      run: chmod u+r+x ./scripts/postdeploy.sh; ./scripts/postdeploy.sh;
      continueOnError: true
      interactive: true
```
- **Γραμμές 31-40**: **Hook μετά την ανάπτυξη** - εκτελείται μετά την ανάπτυξη της εφαρμογής

  - Εκτελεί τελικά scripts ρύθμισης
  - Συνεχίζει ακόμα κι αν τα scripts αποτύχουν

### 2.4 Ρύθμιση Υπηρεσίας (41-48)

Αυτή η ενότητα ρυθμίζει την υπηρεσία εφαρμογής που αναπτύσσετε.

```yaml title="" linenums="0"
services:
  api_and_frontend:
    project: ./src
    language: py
    host: containerapp
    docker:
      image: api_and_frontend
      remoteBuild: true
```

- **Γραμμή 42**: Ορίζει μια υπηρεσία με όνομα "api_and_frontend"
- **Γραμμή 43**: Δείχνει στον φάκελο `./src` για τον πηγαίο κώδικα
- **Γραμμή 44**: Καθορίζει την Python ως γλώσσα προγραμματισμού
- **Γραμμή 45**: Χρησιμοποιεί το Azure Container Apps ως πλατφόρμα φιλοξενίας
- **Γραμμές 46-48**: Ρύθμιση Docker

      - Χρησιμοποιεί το "api_and_frontend" ως όνομα εικόνας
      - Δημιουργεί την εικόνα Docker απομακρυσμένα στο Azure (όχι τοπικά)

### 2.5 Μεταβλητές Pipeline (49-76)

Αυτές είναι μεταβλητές για να βοηθήσουν στην εκτέλεση του `azd` σε CI/CD pipelines για αυτοματοποίηση

```yaml title="" linenums="0"
pipeline:
  variables:
    - AZURE_RESOURCE_GROUP
    - AZURE_AIHUB_NAME
    - AZURE_AIPROJECT_NAME
    - AZURE_AISERVICES_NAME
    - AZURE_SEARCH_SERVICE_NAME
    - AZURE_APPLICATION_INSIGHTS_NAME
    - AZURE_CONTAINER_REGISTRY_NAME
    - AZURE_KEYVAULT_NAME
    - AZURE_STORAGE_ACCOUNT_NAME
    - AZURE_LOG_ANALYTICS_WORKSPACE_NAME
    - USE_CONTAINER_REGISTRY
    - USE_APPLICATION_INSIGHTS
    - USE_AZURE_AI_SEARCH_SERVICE
    - AZURE_AI_AGENT_NAME
    - AZURE_AI_AGENT_ID
    - AZURE_AI_AGENT_DEPLOYMENT_NAME
    - AZURE_AI_AGENT_DEPLOYMENT_SKU
    - AZURE_AI_AGENT_DEPLOYMENT_CAPACITY
    - AZURE_AI_AGENT_MODEL_NAME
    - AZURE_AI_AGENT_MODEL_FORMAT
    - AZURE_AI_AGENT_MODEL_VERSION
    - AZURE_AI_EMBED_DEPLOYMENT_NAME
    - AZURE_AI_EMBED_DEPLOYMENT_SKU
    - AZURE_AI_EMBED_DEPLOYMENT_CAPACITY
    - AZURE_AI_EMBED_MODEL_NAME
    - AZURE_AI_EMBED_MODEL_FORMAT
    - AZURE_AI_EMBED_MODEL_VERSION
    - AZURE_AI_EMBED_DIMENSIONS
    - AZURE_AI_SEARCH_INDEX_NAME
    - AZURE_EXISTING_AIPROJECT_RESOURCE_ID
    - AZURE_EXISTING_AIPROJECT_ENDPOINT
    - AZURE_EXISTING_AGENT_ID
    - ENABLE_AZURE_MONITOR_TRACING
    - AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED
```

Αυτή η ενότητα ορίζει μεταβλητές περιβάλλοντος που χρησιμοποιούνται **κατά την ανάπτυξη**, οργανωμένες ανά κατηγορία:

- **Ονόματα Πόρων Azure (Γραμμές 51-60)**:
      - Ονόματα βασικών πόρων υπηρεσιών Azure, π.χ., Resource Group, AI Hub, AI Project, κ.λπ.- 
- **Flags Λειτουργιών (Γραμμές 61-63)**:
      - Μεταβλητές Boolean για ενεργοποίηση/απενεργοποίηση συγκεκριμένων υπηρεσιών Azure
- **Ρύθμιση AI Agent (Γραμμές 64-71)**:
      - Ρύθμιση για τον κύριο AI agent, συμπεριλαμβανομένου του ονόματος, ID, ρυθμίσεων ανάπτυξης, λεπτομερειών μοντέλου- 
- **Ρύθμιση Ενσωμάτωσης AI (Γραμμές 72-79)**:
      - Ρύθμιση για το μοντέλο ενσωμάτωσης που χρησιμοποιείται για αναζήτηση vector
- **Αναζήτηση και Παρακολούθηση (Γραμμές 80-84)**:
      - Όνομα ευρετηρίου αναζήτησης, υπάρχοντα IDs πόρων και ρυθμίσεις παρακολούθησης/ανίχνευσης

---

## 3. Γνωρίστε τις Μεταβλητές Περιβάλλοντος
Οι παρακάτω μεταβλητές περιβάλλοντος ελέγχουν τη ρύθμιση και τη συμπεριφορά της ανάπτυξής σας, οργανωμένες ανά κύριο σκοπό. Οι περισσότερες μεταβλητές έχουν λογικές προεπιλογές, αλλά μπορείτε να τις προσαρμόσετε ώστε να ταιριάζουν στις συγκεκριμένες απαιτήσεις σας ή στους υπάρχοντες πόρους Azure.

### 3.1 Απαιτούμενες Μεταβλητές 

```bash title="" linenums="0"
# Core Azure Configuration
AZURE_ENV_NAME                    # Environment name (used in resource naming)
AZURE_LOCATION                    # Deployment region
AZURE_SUBSCRIPTION_ID             # Target subscription
AZURE_RESOURCE_GROUP              # Resource group name
AZURE_PRINCIPAL_ID                # User principal for RBAC

# Resource Names (Auto-generated if not specified)
AZURE_AIHUB_NAME                  # AI Foundry hub name
AZURE_AIPROJECT_NAME              # AI project name
AZURE_AISERVICES_NAME             # AI services account name
AZURE_STORAGE_ACCOUNT_NAME        # Storage account name
AZURE_CONTAINER_REGISTRY_NAME     # Container registry name
AZURE_KEYVAULT_NAME               # Key Vault name (if used)
```

### 3.2 Ρύθμιση Μοντέλου 
```bash title="" linenums="0"
# Chat Model Configuration
AZURE_AI_AGENT_MODEL_NAME         # Default: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Default: OpenAI (or Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Default: latest available
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Deployment name for chat model
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Default: 80 (thousands of TPM)

# Embedding Model Configuration  
AZURE_AI_EMBED_MODEL_NAME         # Default: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Default: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Default: latest available
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Deployment name for embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Default: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Default: 50 (thousands of TPM)

# Agent Configuration
AZURE_AI_AGENT_NAME               # Agent display name
AZURE_EXISTING_AGENT_ID           # Use existing agent (optional)
```

### 3.3 Εναλλαγή Λειτουργιών
```bash title="" linenums="0"
# Optional Services
USE_APPLICATION_INSIGHTS         # Default: true
USE_AZURE_AI_SEARCH_SERVICE      # Default: false
USE_CONTAINER_REGISTRY           # Default: true

# Monitoring and Tracing
ENABLE_AZURE_MONITOR_TRACING     # Default: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Default: false

# Search Configuration
AZURE_AI_SEARCH_INDEX_NAME       # Search index name
AZURE_SEARCH_SERVICE_NAME        # Search service name
```

### 3.4 Ρύθμιση Έργου AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Ελέγξτε τις Μεταβλητές σας

Χρησιμοποιήστε το Azure Developer CLI για να δείτε και να διαχειριστείτε τις μεταβλητές περιβάλλοντος:

```bash title="" linenums="0"
# View all environment variables for current environment
azd env get-values

# Get a specific environment variable
azd env get-value AZURE_ENV_NAME

# Set an environment variable
azd env set AZURE_LOCATION eastus

# Set multiple variables from a .env file
azd env set --from-file .env
```

---

