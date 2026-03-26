# 4. Configure a Template

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Comprendere lo scopo di `azure.yaml`
    - [ ] Comprendere la struttura di `azure.yaml`
    - [ ] Comprendere l'importanza dei `hooks` del ciclo di vita di azd
    - [ ] **Lab 4:** Esplora e modifica le variabili d'ambiente

---

!!! prompt "A cosa serve il file `azure.yaml`? Usa un blocco di codice ed esponilo riga per riga"

      Il file `azure.yaml` è il **file di configurazione per Azure Developer CLI (azd)**. Definisce come la tua applicazione deve essere distribuita su Azure, inclusi infrastruttura, servizi, hook di distribuzione e variabili d'ambiente.

---

## 1. Purpose and Functionality

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Valida l'ambiente** prima della distribuzione
2. **Esegue il provisioning dei servizi AI di Azure** (AI Hub, AI Project, Search, ecc.)
3. **Distribuisce un'applicazione Python** su Azure Container Apps
4. **Configura i modelli AI** sia per la chat sia per la funzionalità di embedding
5. **Configura monitoraggio e tracing** per l'applicazione AI
6. **Gestisce sia scenari di progetto AI Azure nuovi che esistenti**

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "Espandi per visualizzare: `azure.yaml`"

      The `azure.yaml` file defines how Azure Developer CLI should deploy and manage this AI Agent application in Azure. Let's break it down line-by-line.

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

## 2. Deconstructing The File

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **Intestazione e schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Riga 1**: Fornisce la validazione dello schema per il language server YAML a supporto di IDE e IntelliSense

### 2.2 Metadati del progetto (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Riga 5**: Definisce il nome del progetto usato da Azure Developer CLI
- **Righe 6-7**: Specifica che è basato su un template versione 1.0.2
- **Righe 8-9**: Richiede Azure Developer CLI versione 1.14.0 o superiore

### 2.3 Hook di distribuzione (11-40)

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

- **Righe 11-20**: **Hook pre-distribuzione** - eseguito prima di `azd up`

      - Su Unix/Linux: rende eseguibile lo script di validazione ed esegue lo script
      - Su Windows: esegue lo script di validazione PowerShell
      - Entrambi sono interattivi e interromperanno la distribuzione se falliscono

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
- **Righe 21-30**: **Hook post-provisioning** - eseguito dopo che le risorse Azure sono state create

  - Esegue gli script che scrivono le variabili d'ambiente
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
- **Righe 31-40**: **Hook post-distribuzione** - eseguito dopo la distribuzione dell'applicazione

  - Esegue gli script di configurazione finale
  - Continua anche se gli script falliscono

### 2.4 Configurazione del servizio (41-48)

Questo configura il servizio dell'applicazione che stai distribuendo.

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

- **Riga 42**: Definisce un servizio chiamato "api_and_frontend"
- **Riga 43**: Indica la directory `./src` per il codice sorgente
- **Riga 44**: Specifica Python come linguaggio di programmazione
- **Riga 45**: Usa Azure Container Apps come piattaforma di hosting
- **Righe 46-48**: Configurazione Docker

      - Usa "api_and_frontend" come nome dell'immagine
      - Costruisce l'immagine Docker in remoto su Azure (non localmente)

### 2.5 Variabili della pipeline (49-76)

Queste sono variabili per aiutarti a eseguire `azd` nelle pipeline CI/CD per l'automazione

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

- **Nomi delle risorse Azure (Righe 51-60)**:
      - Nomi delle risorse dei servizi Azure principali, ad es., Resource Group, AI Hub, AI Project, ecc.
- **Flag delle funzionalità (Righe 61-63)**:
      - Variabili booleane per abilitare/disabilitare servizi Azure specifici
- **Configurazione dell'agente AI (Righe 64-71)**:
      - Configurazione per l'agente AI principale inclusi nome, ID, impostazioni di distribuzione, dettagli del modello
- **Configurazione dell'embedding AI (Righe 72-79)**:
      - Configurazione per il modello di embedding usato per la ricerca vettoriale
- **Ricerca e monitoraggio (Righe 80-84)**:
      - Nome dell'indice di ricerca, ID delle risorse esistenti e impostazioni di monitoraggio/tracing

---

## 3. Conoscere le variabili d'ambiente
Le seguenti variabili d'ambiente controllano la configurazione e il comportamento della tua distribuzione, organizzate in base al loro scopo principale. La maggior parte delle variabili ha valori predefiniti sensati, ma puoi personalizzarle per adattarle ai tuoi requisiti specifici o a risorse Azure esistenti.

### 3.1 Variabili richieste 

```bash title="" linenums="0"
# Configurazione principale di Azure
AZURE_ENV_NAME                    # Nome dell'ambiente (usato nella denominazione delle risorse)
AZURE_LOCATION                    # Regione di distribuzione
AZURE_SUBSCRIPTION_ID             # Sottoscrizione di destinazione
AZURE_RESOURCE_GROUP              # Nome del gruppo di risorse
AZURE_PRINCIPAL_ID                # Utente principale per RBAC

# Nomi delle risorse (generati automaticamente se non specificati)
AZURE_AIHUB_NAME                  # Nome dell'hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nome del progetto AI
AZURE_AISERVICES_NAME             # Nome dell'account dei servizi AI
AZURE_STORAGE_ACCOUNT_NAME        # Nome dell'account di archiviazione
AZURE_CONTAINER_REGISTRY_NAME     # Nome del registro dei container
AZURE_KEYVAULT_NAME               # Nome del Key Vault (se usato)
```

### 3.2 Configurazione del modello 
```bash title="" linenums="0"
# Configurazione del modello di chat
AZURE_AI_AGENT_MODEL_NAME         # Predefinito: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Predefinito: OpenAI (o Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Predefinito: ultima disponibile
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nome di distribuzione per il modello di chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Predefinito: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Predefinito: 80 (migliaia di TPM)

# Configurazione del modello di embedding
AZURE_AI_EMBED_MODEL_NAME         # Predefinito: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Predefinito: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Predefinito: ultima disponibile
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nome di distribuzione per gli embedding
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Predefinito: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Predefinito: 50 (migliaia di TPM)

# Configurazione dell'agente
AZURE_AI_AGENT_NAME               # Nome visualizzato dell'agente
AZURE_EXISTING_AGENT_ID           # Usa agente esistente (opzionale)
```

### 3.3 Attivazione delle funzionalità
```bash title="" linenums="0"
# Servizi opzionali
USE_APPLICATION_INSIGHTS         # Predefinito: true
USE_AZURE_AI_SEARCH_SERVICE      # Predefinito: false
USE_CONTAINER_REGISTRY           # Predefinito: true

# Monitoraggio e tracciamento
ENABLE_AZURE_MONITOR_TRACING     # Predefinito: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Predefinito: false

# Configurazione di ricerca
AZURE_AI_SEARCH_INDEX_NAME       # Nome indice di ricerca
AZURE_SEARCH_SERVICE_NAME        # Nome del servizio di ricerca
```

### 3.4 Configurazione del progetto AI 
```bash title="" linenums="0"
# Usa risorse esistenti
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID completo della risorsa del progetto IA esistente
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL dell'endpoint del progetto esistente
```

### 3.5 Controlla le tue variabili

Usa Azure Developer CLI per visualizzare e gestire le tue variabili d'ambiente:

```bash title="" linenums="0"
# Visualizza tutte le variabili d'ambiente per l'ambiente corrente
azd env get-values

# Ottieni una variabile d'ambiente specifica
azd env get-value AZURE_ENV_NAME

# Imposta una variabile d'ambiente
azd env set AZURE_LOCATION eastus

# Imposta più variabili da un file .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Esclusione di responsabilità**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua di origine dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale eseguita da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->