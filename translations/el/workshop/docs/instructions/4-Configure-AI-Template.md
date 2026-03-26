# 4. Διαμόρφωση ενός Προτύπου

!!! tip "ΜΕΧΡΙ ΤΟ ΤΕΛΟΣ ΑΥΤΟΥ ΤΟΥ ΜΑΘΗΜΑΤΟΣ ΘΑ ΜΠΟΡΕΙΤΕ ΝΑ"

    - [ ] Κατανοήσετε τον σκοπό του `azure.yaml`
    - [ ] Κατανοήσετε τη δομή του `azure.yaml`
    - [ ] Κατανοήσετε τη σημασία των `hooks` του κύκλου ζωής του azd
    - [ ] **Εργαστήριο 4:** Εξερευνήστε και τροποποιήστε τις μεταβλητές περιβάλλοντος

---

!!! prompt "Τι κάνει το αρχείο `azure.yaml`; Χρησιμοποιήστε ένα μπλοκ κώδικα και εξηγήστε το γραμμή προς γραμμή"

      Το αρχείο `azure.yaml` είναι το **αρχείο ρυθμίσεων για το Azure Developer CLI (azd)**. Ορίζει πώς θα αναπτυχθεί η εφαρμογή σας στο Azure, συμπεριλαμβανομένης της υποδομής, των υπηρεσιών, των hooks ανάπτυξης και των μεταβλητών περιβάλλοντος.

---

## 1. Σκοπός και Λειτουργικότητα

Αυτό το αρχείο `azure.yaml` λειτουργεί ως το **σχέδιο ανάπτυξης** για μια εφαρμογή AI agent που:

1. **Επαληθεύει το περιβάλλον** πριν την ανάπτυξη
2. **Δημιουργεί υπηρεσίες Azure AI** (AI Hub, AI Project, Search κ.λπ.)
3. **Αναπτύσσει μια εφαρμογή Python** σε Azure Container Apps
4. **Διαμορφώνει μοντέλα AI** για λειτουργίες συνομιλίας και ενσωμάτωσης
5. **Ρυθμίζει παρακολούθηση και εντοπισμό** για την εφαρμογή AI
6. **Διαχειρίζεται τόσο νέα όσο και υπάρχοντα** σενάρια έργων Azure AI

Το αρχείο επιτρέπει **ανάπτυξη με μία εντολή** (`azd up`) μιας πλήρους λύσης AI agent με κατάλληλη επαλήθευση, παροχή πόρων και μετα-αναπτυξιακή διαμόρφωση.

??? info "Ανοίξτε για προβολή: `azure.yaml`"

      Το αρχείο `azure.yaml` ορίζει πώς το Azure Developer CLI θα πρέπει να αναπτύξει και να διαχειριστεί αυτήν την εφαρμογή AI Agent στο Azure. Ας το αναλύσουμε γραμμή προς γραμμή.

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

## 2. Ανάλυση του Αρχείου

Ας περάσουμε το αρχείο τμήμα προς τμήμα, για να κατανοήσουμε τι κάνει - και γιατί.

### 2.1 **Κεφαλίδα και Σχήμα (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Γραμμή 1**: Παρέχει έλεγχο σχήματος για τον YAML language server, για υποστήριξη IDE και IntelliSense

### 2.2 Μεταδεδομένα Έργου (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Γραμμή 5**: Ορίζει το όνομα του έργου που χρησιμοποιείται από το Azure Developer CLI
- **Γραμμές 6-7**: Καθορίζει ότι βασίζεται σε ένα πρότυπο έκδοσης 1.0.2
- **Γραμμές 8-9**: Απαιτεί την έκδοση του Azure Developer CLI 1.14.0 ή νεότερη

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

- **Γραμμές 11-20**: **Προ-αναπτυξιακό hook** - εκτελείται πριν το `azd up`

      - Σε Unix/Linux: Κάνει το script επαλήθευσης εκτελέσιμο και το τρέχει
      - Σε Windows: Εκτελεί το PowerShell script επαλήθευσης
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
- **Γραμμές 21-30**: **Hook μετά την παροχή πόρων** - εκτελείται μετά τη δημιουργία των πόρων Azure

  - Εκτελεί σενάρια εγγραφής μεταβλητών περιβάλλοντος
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
- **Γραμμές 31-40**: **Hook μετά την ανάπτυξη** - εκτελείται μετά την ανάπτυξη της εφαρμογής

  - Εκτελεί τελικά σενάρια ρύθμισης
  - Συνεχίζει ακόμα και αν τα scripts αποτύχουν

### 2.4 Ρύθμιση Υπηρεσίας (41-48)

Αυτό διαμορφώνει την υπηρεσία εφαρμογής που αναπτύσσετε.

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

- **Γραμμή 42**: Ορίζει μια υπηρεσία με το όνομα "api_and_frontend"
- **Γραμμή 43**: Δείχνει στον κατάλογο `./src` για τον πηγαίο κώδικα
- **Γραμμή 44**: Καθορίζει τη Python ως γλώσσα προγραμματισμού
- **Γραμμή 45**: Χρησιμοποιεί τα Azure Container Apps ως πλατφόρμα φιλοξενίας
- **Γραμμές 46-48**: Ρυθμίσεις Docker

      - Χρησιμοποιεί "api_and_frontend" ως όνομα εικόνας
      - Δημιουργεί την εικόνα Docker απομακρυσμένα στο Azure (όχι τοπικά)

### 2.5 Μεταβλητές Pipeline (49-76)

Αυτές είναι μεταβλητές που βοηθούν στο να τρέξετε το `azd` σε CI/CD pipelines για αυτοματοποίηση

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

Αυτή η ενότητα ορίζει μεταβλητές περιβάλλοντος που χρησιμοποιούνται **κατά τη διάρκεια της ανάπτυξης**, οργανωμένες κατά κατηγορία:

- **Ονόματα Πόρων Azure (Γραμμές 51-60)**:
      - Κύρια ονόματα πόρων υπηρεσιών Azure, π.χ., Resource Group, AI Hub, AI Project κ.λπ.
- **Σημαίες Χαρακτηριστικών (Γραμμές 61-63)**:
      - Δυαδικές μεταβλητές για ενεργοποίηση/απενεργοποίηση συγκεκριμένων υπηρεσιών Azure
- **Διαμόρφωση AI Agent (Γραμμές 64-71)**:
      - Ρυθμίσεις για τον κύριο AI agent, συμπεριλαμβανομένου ονόματος, ID, ρυθμίσεων ανάπτυξης και λεπτομερειών μοντέλου
- **Διαμόρφωση Ενσωμάτωσης AI (Γραμμές 72-79)**:
      - Ρυθμίσεις για το μοντέλο ενσωμάτωσης που χρησιμοποιείται για διανυσματική αναζήτηση
- **Αναζήτηση και Παρακολούθηση (Γραμμές 80-84)**:
      - Όνομα ευρετηρίου αναζήτησης, υπάρχοντα IDs πόρων και ρυθμίσεις παρακολούθησης/εντοπισμού

---

## 3. Γνωρίστε τις μεταβλητές περιβάλλοντος
Οι παρακάτω μεταβλητές περιβάλλοντος ελέγχουν τη ρύθμιση και τη συμπεριφορά της ανάπτυξής σας, οργανωμένες κατά τον κύριο σκοπό τους. Οι περισσότερες μεταβλητές έχουν λογικές προεπιλογές, αλλά μπορείτε να τις προσαρμόσετε ώστε να ταιριάζουν με τις ειδικές απαιτήσεις σας ή υπάρχοντες πόρους του Azure.

### 3.1 Απαιτούμενες Μεταβλητές 

```bash title="" linenums="0"
# Βασική διαμόρφωση Azure
AZURE_ENV_NAME                    # Όνομα περιβάλλοντος (χρησιμοποιείται στην ονοματοδοσία πόρων)
AZURE_LOCATION                    # Περιοχή ανάπτυξης
AZURE_SUBSCRIPTION_ID             # Στοχευμένη συνδρομή
AZURE_RESOURCE_GROUP              # Όνομα ομάδας πόρων
AZURE_PRINCIPAL_ID                # Κύριος χρήστη για RBAC

# Ονόματα πόρων (Δημιουργούνται αυτόματα αν δεν οριστούν)
AZURE_AIHUB_NAME                  # Όνομα hub του Microsoft Foundry
AZURE_AIPROJECT_NAME              # Όνομα έργου τεχνητής νοημοσύνης
AZURE_AISERVICES_NAME             # Όνομα λογαριασμού υπηρεσιών AI
AZURE_STORAGE_ACCOUNT_NAME        # Όνομα λογαριασμού αποθήκευσης
AZURE_CONTAINER_REGISTRY_NAME     # Όνομα μητρώου κοντέινερ
AZURE_KEYVAULT_NAME               # Όνομα Key Vault (εάν χρησιμοποιείται)
```

### 3.2 Διαμόρφωση Μοντέλου 
```bash title="" linenums="0"
# Διαμόρφωση Μοντέλου Συνομιλίας
AZURE_AI_AGENT_MODEL_NAME         # Προεπιλογή: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Προεπιλογή: OpenAI (ή Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Προεπιλογή: η πιο πρόσφατη διαθέσιμη
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Όνομα ανάπτυξης για το μοντέλο συνομιλίας
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Προεπιλογή: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Προεπιλογή: 80 (χιλιάδες TPM)

# Διαμόρφωση Μοντέλου Ενσωμάτωσης
AZURE_AI_EMBED_MODEL_NAME         # Προεπιλογή: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Προεπιλογή: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Προεπιλογή: η πιο πρόσφατη διαθέσιμη
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Όνομα ανάπτυξης για τις ενσωματώσεις
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Προεπιλογή: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Προεπιλογή: 50 (χιλιάδες TPM)

# Διαμόρφωση Πράκτορα
AZURE_AI_AGENT_NAME               # Όνομα εμφάνισης πράκτορα
AZURE_EXISTING_AGENT_ID           # Χρήση υπάρχοντος πράκτορα (προαιρετικό)
```

### 3.3 Εναλλαγή Χαρακτηριστικών
```bash title="" linenums="0"
# Προαιρετικές υπηρεσίες
USE_APPLICATION_INSIGHTS         # Προεπιλογή: αληθές
USE_AZURE_AI_SEARCH_SERVICE      # Προεπιλογή: ψευδές
USE_CONTAINER_REGISTRY           # Προεπιλογή: αληθές

# Παρακολούθηση και ιχνηλάτηση
ENABLE_AZURE_MONITOR_TRACING     # Προεπιλογή: ψευδές
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Προεπιλογή: ψευδές

# Διαμόρφωση αναζήτησης
AZURE_AI_SEARCH_INDEX_NAME       # Όνομα ευρετηρίου αναζήτησης
AZURE_SEARCH_SERVICE_NAME        # Όνομα υπηρεσίας αναζήτησης
```

### 3.4 Διαμόρφωση Έργου AI 
```bash title="" linenums="0"
# Χρήση Υφιστάμενων Πόρων
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Πλήρες αναγνωριστικό πόρου του υπάρχοντος έργου AI
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Διεύθυνση URL του τελικού σημείου του υπάρχοντος έργου
```

### 3.5 Ελέγξτε τις Μεταβλητές σας

Χρησιμοποιήστε το Azure Developer CLI για να προβάλετε και να διαχειριστείτε τις μεταβλητές περιβάλλοντος:

```bash title="" linenums="0"
# Προβολή όλων των μεταβλητών περιβάλλοντος για το τρέχον περιβάλλον
azd env get-values

# Λήψη συγκεκριμένης μεταβλητής περιβάλλοντος
azd env get-value AZURE_ENV_NAME

# Ορισμός μεταβλητής περιβάλλοντος
azd env set AZURE_LOCATION eastus

# Ορισμός πολλαπλών μεταβλητών από αρχείο .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Αποποίηση ευθύνης:
Αυτό το έγγραφο έχει μεταφραστεί χρησιμοποιώντας την υπηρεσία μετάφρασης με τεχνητή νοημοσύνη Co-op Translator (https://github.com/Azure/co-op-translator). Παρά τις προσπάθειές μας για ακρίβεια, λάβετε υπόψη ότι οι αυτοματοποιημένες μεταφράσεις ενδέχεται να περιέχουν σφάλματα ή ανακρίβειες. Το πρωτότυπο έγγραφο στη μητρική του γλώσσα πρέπει να θεωρείται η αυθεντική πηγή. Για κρίσιμες πληροφορίες συνιστάται επαγγελματική μετάφραση από άνθρωπο. Δεν φέρουμε ευθύνη για τυχόν παρεξηγήσεις ή λανθασμένες ερμηνείες που προκύπτουν από τη χρήση αυτής της μετάφρασης.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->