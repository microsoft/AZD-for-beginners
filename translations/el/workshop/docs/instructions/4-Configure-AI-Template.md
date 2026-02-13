# 4. Διαμόρφωση ενός Προτύπου

!!! tip "ΜΕ ΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΜΟΝΤΟΥΛΟΥ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Να κατανοήσετε τον σκοπό του `azure.yaml`
    - [ ] Να κατανοήσετε τη δομή του `azure.yaml`
    - [ ] Να κατανοήσετε την αξία των `hooks` του κύκλου ζωής του azd
    - [ ] **Lab 4:** Εξερευνήστε και τροποποιήστε τις μεταβλητές περιβάλλοντος

---

!!! prompt "Τι κάνει το αρχείο `azure.yaml`; Χρησιμοποιήστε ένα μπλοκ κώδικα και εξηγήστε το γραμμή προς γραμμή"

      Το αρχείο `azure.yaml` είναι το **αρχείο διαμόρφωσης για το Azure Developer CLI (azd)**. Ορίζει πώς θα αναπτυχθεί η εφαρμογή σας στο Azure, συμπεριλαμβανομένης της υποδομής, των υπηρεσιών, των hooks ανάπτυξης και των μεταβλητών περιβάλλοντος.

---

## 1. Σκοπός και Λειτουργικότητα

Αυτό το αρχείο `azure.yaml` λειτουργεί ως το **σχέδιο ανάπτυξης** για μια εφαρμογή AI agent που:

1. **Επικυρώνει το περιβάλλον** πριν την ανάπτυξη
2. **Παρέχει υπηρεσίες Azure AI** (AI Hub, AI Project, Search, κ.λπ.)
3. **Αναπτύσσει μια εφαρμογή Python** σε Azure Container Apps
4. **Διαμορφώνει μοντέλα AI** για λειτουργίες συνομιλίας και ενσωμάτωσης (embedding)
5. **Ρυθμίζει παρακολούθηση και εντοπισμό (tracing)** για την εφαρμογή AI
6. **Χειρίζεται σενάρια νέου και υφιστάμενου** Azure AI έργου

Το αρχείο επιτρέπει **αυτόματη ανάπτυξη με μία εντολή** (`azd up`) μιας πλήρους λύσης AI agent με την κατάλληλη επικύρωση, παροχή πόρων και μετα-αναπτυξιακή διαμόρφωση.

??? info "Αναπτύξτε για προβολή: `azure.yaml`"

      Το αρχείο `azure.yaml` καθορίζει πώς το Azure Developer CLI θα πρέπει να αναπτύσσει και να διαχειρίζεται αυτήν την εφαρμογή AI Agent στο Azure. Ας το αναλύσουμε γραμμή-γραμμή.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: do we need hooks? 
      # TODO: do we need all of the variables?

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

## 2. Αποδόμηση του Αρχείου

Ας περάσουμε το αρχείο τμήμα-τμήμα, για να κατανοήσουμε τι κάνει - και γιατί.

### 2.1 **Επικεφαλίδα και Σχήμα (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Παρέχει επικύρωση σχήματος για το YAML language server για υποστήριξη IDE και IntelliSense

### 2.2 Μεταδεδομένα Έργου (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Ορίζει το όνομα του έργου που χρησιμοποιείται από το Azure Developer CLI
- **Lines 6-7**: Δηλώνει ότι βασίζεται σε πρότυπο έκδοσης 1.0.2
- **Lines 8-9**: Απαιτεί έκδοση Azure Developer CLI 1.14.0 ή νεότερη

### 2.3 Hooks ανάπτυξης (11-40)

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

- **Lines 11-20**: **Hook πριν την ανάπτυξη** - εκτελείται πριν το `azd up`

      - Στο Unix/Linux: Κάνει το script επικύρωσης εκτελέσιμο και το τρέχει
      - Στα Windows: Εκτελεί το PowerShell script επικύρωσης
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
- **Lines 21-30**: **Hook μετά την παροχή πόρων** - εκτελείται μετά τη δημιουργία των πόρων Azure

  - Εκτελεί scripts που γράφουν μεταβλητές περιβάλλοντος
  - Συνεχίζει την ανάπτυξη ακόμα και αν αυτά τα scripts αποτύχουν (`continueOnError: true`)

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
- **Lines 31-40**: **Hook μετά την ανάπτυξη** - εκτελείται μετά την ανάπτυξη της εφαρμογής

  - Εκτελεί τα τελικά scripts ρύθμισης
  - Συνεχίζει ακόμη κι αν τα scripts αποτύχουν

### 2.4 Διαμόρφωση Υπηρεσίας (41-48)

This configures the application service you are deploying.

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

- **Line 42**: Ορίζει μια υπηρεσία με όνομα "api_and_frontend"
- **Line 43**: Δείχνει στον κατάλογο `./src` για τον πηγαίο κώδικα
- **Line 44**: Καθορίζει την Python ως γλώσσα προγραμματισμού
- **Line 45**: Χρησιμοποιεί τα Azure Container Apps ως πλατφόρμα φιλοξενίας
- **Lines 46-48**: Διαμόρφωση Docker

      - Χρησιμοποιεί "api_and_frontend" ως όνομα εικόνας
      - Δημιουργεί την εικόνα Docker απομακρυσμένα στο Azure (όχι τοπικά)

### 2.5 Μεταβλητές Pipeline (49-76)

These are variables to help you run `azd` in CI/CD pipelines for automation

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

This section defines environment variables used **during deployment**, organized by category:

- **Azure Resource Names (Lines 51-60)**:
      - Βασικά ονόματα πόρων υπηρεσιών Azure π.χ. Resource Group, AI Hub, AI Project, κ.λπ.
- **Feature Flags (Lines 61-63)**:
      - Μεταβλητές boolean για ενεργοποίηση/απενεργοποίηση συγκεκριμένων υπηρεσιών Azure
- **AI Agent Configuration (Lines 64-71)**:
      - Διαμόρφωση για τον κύριο AI agent συμπεριλαμβανομένου ονόματος, ID, ρυθμίσεων ανάπτυξης, λεπτομερειών μοντέλου
- **AI Embedding Configuration (Lines 72-79)**:
      - Διαμόρφωση για το μοντέλο ενσωμάτωσης που χρησιμοποιείται για αναζήτηση διανυσμάτων
- **Search and Monitoring (Lines 80-84)**:
      - Όνομα ευρετηρίου αναζήτησης, υπάρχοντα IDs πόρων και ρυθμίσεις παρακολούθησης/εντοπισμού (tracing)

---

## 3. Γνωρίστε τις Μεταβλητές Περιβάλλοντος
Οι παρακάτω μεταβλητές περιβάλλοντος ελέγχουν τη διαμόρφωση και τη συμπεριφορά της ανάπτυξής σας, οργανωμένες ανά τον κύριο σκοπό τους. Οι περισσότερες μεταβλητές έχουν λογικές προεπιλογές, αλλά μπορείτε να τις προσαρμόσετε ώστε να ταιριάζουν στις συγκεκριμένες απαιτήσεις ή τα υπάρχοντα Azure resources σας.

### 3.1 Απαιτούμενες Μεταβλητές 

```bash title="" linenums="0"
# Βασική διαμόρφωση Azure
AZURE_ENV_NAME                    # Όνομα περιβάλλοντος (χρησιμοποιείται στην ονομασία πόρων)
AZURE_LOCATION                    # Περιοχή ανάπτυξης
AZURE_SUBSCRIPTION_ID             # Στοχευμένη συνδρομή
AZURE_RESOURCE_GROUP              # Όνομα ομάδας πόρων
AZURE_PRINCIPAL_ID                # Κύριος χρήστη για RBAC

# Ονόματα πόρων (Δημιουργούνται αυτόματα αν δεν καθοριστούν)
AZURE_AIHUB_NAME                  # Όνομα κόμβου Microsoft Foundry
AZURE_AIPROJECT_NAME              # Όνομα έργου AI
AZURE_AISERVICES_NAME             # Όνομα λογαριασμού υπηρεσιών AI
AZURE_STORAGE_ACCOUNT_NAME        # Όνομα λογαριασμού αποθήκευσης
AZURE_CONTAINER_REGISTRY_NAME     # Όνομα μητρώου κοντέινερ
AZURE_KEYVAULT_NAME               # Όνομα Key Vault (εάν χρησιμοποιείται)
```

### 3.2 Διαμόρφωση Μοντέλου 
```bash title="" linenums="0"
# Διαμόρφωση μοντέλου συνομιλίας
AZURE_AI_AGENT_MODEL_NAME         # Προεπιλογή: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Προεπιλογή: OpenAI (ή Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Προεπιλογή: πιο πρόσφατο διαθέσιμο
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Όνομα ανάπτυξης για το μοντέλο συνομιλίας
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Προεπιλογή: Τυπικό
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Προεπιλογή: 80 (χιλιάδες TPM)

# Διαμόρφωση μοντέλου ενσωμάτωσης
AZURE_AI_EMBED_MODEL_NAME         # Προεπιλογή: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Προεπιλογή: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Προεπιλογή: πιο πρόσφατο διαθέσιμο
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Όνομα ανάπτυξης για τις ενσωματώσεις
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Προεπιλογή: Τυπικό
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Προεπιλογή: 50 (χιλιάδες TPM)

# Διαμόρφωση πράκτορα
AZURE_AI_AGENT_NAME               # Όνομα εμφάνισης πράκτορα
AZURE_EXISTING_AGENT_ID           # Χρήση υπάρχοντος πράκτορα (προαιρετικό)
```

### 3.3 Εναλλαγή Χαρακτηριστικών
```bash title="" linenums="0"
# Προαιρετικές Υπηρεσίες
USE_APPLICATION_INSIGHTS         # Προεπιλογή: αληθές
USE_AZURE_AI_SEARCH_SERVICE      # Προεπιλογή: ψευδές
USE_CONTAINER_REGISTRY           # Προεπιλογή: αληθές

# Παρακολούθηση και Ιχνηλάτηση
ENABLE_AZURE_MONITOR_TRACING     # Προεπιλογή: ψευδές
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Προεπιλογή: ψευδές

# Διαμόρφωση Αναζήτησης
AZURE_AI_SEARCH_INDEX_NAME       # Όνομα ευρετηρίου αναζήτησης
AZURE_SEARCH_SERVICE_NAME        # Όνομα υπηρεσίας αναζήτησης
```

### 3.4 Διαμόρφωση Έργου AI 
```bash title="" linenums="0"
# Χρησιμοποιήστε υπάρχοντες πόρους
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Πλήρες αναγνωριστικό πόρου του υπάρχοντος έργου τεχνητής νοημοσύνης
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Διεύθυνση URL του σημείου τερματισμού του υπάρχοντος έργου
```

### 3.5 Ελέγξτε τις Μεταβλητές σας

Χρησιμοποιήστε το Azure Developer CLI για να δείτε και να διαχειριστείτε τις μεταβλητές περιβάλλοντος σας:

```bash title="" linenums="0"
# Προβολή όλων των μεταβλητών περιβάλλοντος για το τρέχον περιβάλλον
azd env get-values

# Λήψη μιας συγκεκριμένης μεταβλητής περιβάλλοντος
azd env get-value AZURE_ENV_NAME

# Ορισμός μιας μεταβλητής περιβάλλοντος
azd env set AZURE_LOCATION eastus

# Ορισμός πολλαπλών μεταβλητών από αρχείο .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθυνών:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη [Co-op Translator](https://github.com/Azure/co-op-translator). Αν και καταβάλλουμε κάθε δυνατή προσπάθεια για ακρίβεια, παρακαλούμε να λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στην αρχική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από επαγγελματία μεταφραστή. Δεν φέρουμε ευθύνη για οποιεσδήποτε παρανοήσεις ή λανθασμένες ερμηνείες που προκύψουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->