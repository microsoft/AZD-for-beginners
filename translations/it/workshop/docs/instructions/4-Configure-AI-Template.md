<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T15:05:27+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "it"
}
-->
# 4. Configurare un Template

!!! tip "ALLA FINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Comprendere lo scopo di `azure.yaml`
    - [ ] Comprendere la struttura di `azure.yaml`
    - [ ] Comprendere il valore dei `hooks` nel ciclo di vita di azd
    - [ ] **Lab 3:** 

---

!!! prompt "A cosa serve il file `azure.yaml`? Usa un blocco di codice e spiegalo riga per riga"

      Il file `azure.yaml` è il **file di configurazione per Azure Developer CLI (azd)**. Definisce come la tua applicazione deve essere distribuita su Azure, inclusa l'infrastruttura, i servizi, gli hooks di distribuzione e le variabili di ambiente.

---

## 1. Scopo e Funzionalità

Questo file `azure.yaml` funge da **progetto di distribuzione** per un'applicazione di agente AI che:

1. **Valida l'ambiente** prima della distribuzione
2. **Provisiona i servizi Azure AI** (AI Hub, AI Project, Search, ecc.)
3. **Distribuisce un'applicazione Python** su Azure Container Apps
4. **Configura i modelli AI** per funzionalità di chat e embedding
5. **Imposta il monitoraggio e il tracciamento** per l'applicazione AI
6. **Gestisce sia scenari nuovi che esistenti** per progetti Azure AI

Il file consente una **distribuzione con un solo comando** (`azd up`) di una soluzione completa di agente AI con validazione, provisioning e configurazione post-distribuzione adeguati.

??? info "Espandi per visualizzare: `azure.yaml`"

      Il file `azure.yaml` definisce come Azure Developer CLI dovrebbe distribuire e gestire questa applicazione di agente AI su Azure. Analizziamolo riga per riga.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: abbiamo bisogno degli hooks? 
      # TODO: abbiamo bisogno di tutte le variabili?

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

## 2. Analisi del File

Esaminiamo il file sezione per sezione, per capire cosa fa e perché.

### 2.1 **Header e Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linea 1**: Fornisce la validazione dello schema del server YAML per il supporto IDE e IntelliSense

### 2.2 Metadati del Progetto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linea 5**: Definisce il nome del progetto utilizzato da Azure Developer CLI
- **Linee 6-7**: Specifica che si basa su una versione del template 1.0.2
- **Linee 8-9**: Richiede la versione 1.14.0 o superiore di Azure Developer CLI

### 2.3 Hooks di Distribuzione (11-40)

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

- **Linee 11-20**: **Hook pre-distribuzione** - eseguito prima di `azd up`

      - Su Unix/Linux: Rende eseguibile lo script di validazione e lo esegue
      - Su Windows: Esegue lo script di validazione PowerShell
      - Entrambi sono interattivi e interrompono la distribuzione se falliscono

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
- **Linee 21-30**: **Hook post-provisioning** - eseguito dopo la creazione delle risorse Azure

  - Esegue script per scrivere variabili di ambiente
  - Continua la distribuzione anche se questi script falliscono (`continueOnError: true`)

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
- **Linee 31-40**: **Hook post-distribuzione** - eseguito dopo la distribuzione dell'applicazione

  - Esegue script di configurazione finale
  - Continua anche se gli script falliscono

### 2.4 Configurazione del Servizio (41-48)

Questa sezione configura il servizio applicativo che stai distribuendo.

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

- **Linea 42**: Definisce un servizio chiamato "api_and_frontend"
- **Linea 43**: Punta alla directory `./src` per il codice sorgente
- **Linea 44**: Specifica Python come linguaggio di programmazione
- **Linea 45**: Utilizza Azure Container Apps come piattaforma di hosting
- **Linee 46-48**: Configurazione Docker

      - Utilizza "api_and_frontend" come nome dell'immagine
      - Costruisce l'immagine Docker in remoto su Azure (non localmente)

### 2.5 Variabili della Pipeline (49-76)

Queste sono variabili per eseguire `azd` in pipeline CI/CD per l'automazione

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

Questa sezione definisce variabili di ambiente utilizzate **durante la distribuzione**, organizzate per categoria:

- **Nomi delle Risorse Azure (Linee 51-60)**:
      - Nomi delle risorse principali di Azure, ad esempio Resource Group, AI Hub, AI Project, ecc.
- **Flag delle Funzionalità (Linee 61-63)**:
      - Variabili booleane per abilitare/disabilitare specifici servizi Azure
- **Configurazione dell'Agente AI (Linee 64-71)**:
      - Configurazione per l'agente AI principale, inclusi nome, ID, impostazioni di distribuzione, dettagli del modello
- **Configurazione dell'Embedding AI (Linee 72-79)**:
      - Configurazione per il modello di embedding utilizzato per la ricerca vettoriale
- **Ricerca e Monitoraggio (Linee 80-84)**:
      - Nome dell'indice di ricerca, ID delle risorse esistenti e impostazioni di monitoraggio/tracciamento

---

## 3. Conoscere le Variabili di Ambiente
Le seguenti variabili di ambiente controllano la configurazione e il comportamento della tua distribuzione, organizzate in base al loro scopo principale. La maggior parte delle variabili ha valori predefiniti sensati, ma puoi personalizzarle per adattarle ai tuoi requisiti specifici o alle risorse Azure esistenti.

### 3.1 Variabili Necessarie 

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

### 3.2 Configurazione del Modello 
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

### 3.3 Attivazione delle Funzionalità
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

### 3.4 Configurazione del Progetto AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Controlla le Tue Variabili

Usa Azure Developer CLI per visualizzare e gestire le tue variabili di ambiente:

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

