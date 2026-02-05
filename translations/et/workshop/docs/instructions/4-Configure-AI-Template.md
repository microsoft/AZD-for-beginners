# 4. Malli seadistamine

!!! tip "PÄRAST SELLE MODULI LÄBIMIST SAAD"

    - [ ] Mõistnud `azure.yaml` faili eesmärki
    - [ ] Mõistnud `azure.yaml` faili struktuuri
    - [ ] Mõistnud azd elutsükli `hooks` väärtust
    - [ ] **Lab 3:** 

---

!!! prompt "Mida teeb `azure.yaml` fail? Kasuta koodiplokki ja selgita rida-realt"

      `azure.yaml` fail on **Azure Developer CLI (azd)** konfiguratsioonifail. See määratleb, kuidas sinu rakendus peaks Azure'is juurutatama, sealhulgas infrastruktuuri, teenused, juurutamise hooks ja keskkonnamuutujad.

---

## 1. Eesmärk ja funktsionaalsus

See `azure.yaml` fail toimib **juurutamise plaanina** AI agendi rakenduse jaoks, mis:

1. **Kontrollib keskkonda** enne juurutamist
2. **Haldab Azure AI teenuseid** (AI Hub, AI Project, Search jne)
3. **Juurutab Python rakenduse** Azure Container Apps platvormile
4. **Konfigureerib AI mudelid** vestluse ja sisseehitamise funktsionaalsuse jaoks
5. **Seadistab monitooringu ja jälgimise** AI rakenduse jaoks
6. **Toetab nii uusi kui ka olemasolevaid** Azure AI projekti stsenaariume

Fail võimaldab **ühe käsuga juurutamist** (`azd up`) täieliku AI agendi lahenduse jaoks koos korrektse valideerimise, haldamise ja järelkonfiguratsiooniga.

??? info "Laienda, et näha: `azure.yaml`"

      `azure.yaml` fail määratleb, kuidas Azure Developer CLI peaks juurutama ja haldama seda AI agendi rakendust Azure'is. Vaatame seda rida-realt.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: kas me vajame hooks? 
      # TODO: kas me vajame kõiki muutujaid?

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

## 2. Faili lahtivõtmine

Vaatame faili sektsioonide kaupa, et mõista, mida see teeb ja miks.

### 2.1 **Päis ja skeem (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Rida 1**: Pakub YAML keeleserveri skeemi valideerimist IDE toe ja IntelliSense jaoks

### 2.2 Projekti metaandmed (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Rida 5**: Määratleb projekti nime, mida Azure Developer CLI kasutab
- **Rida 6-7**: Näitab, et see põhineb malliversioonil 1.0.2
- **Rida 8-9**: Nõuab Azure Developer CLI versiooni 1.14.0 või uuemat

### 2.3 Juurutamise hooks (11-40)

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

- **Rida 11-20**: **Eeljuurutamise hook** - käivitatakse enne `azd up`

      - Unix/Linux: Muudab valideerimisskripti käivitatavaks ja käivitab selle
      - Windows: Käivitab PowerShelli valideerimisskripti
      - Mõlemad on interaktiivsed ja peatavad juurutamise, kui need ebaõnnestuvad

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
- **Rida 21-30**: **Järgneva haldamise hook** - käivitatakse pärast Azure'i ressursside loomist

  - Käivitab keskkonnamuutujate kirjutamise skriptid
  - Jätkab juurutamist isegi siis, kui need skriptid ebaõnnestuvad (`continueOnError: true`)

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
- **Rida 31-40**: **Järgneva juurutamise hook** - käivitatakse pärast rakenduse juurutamist

  - Käivitab lõplikud seadistusskriptid
  - Jätkab isegi siis, kui skriptid ebaõnnestuvad

### 2.4 Teenuse konfiguratsioon (41-48)

See konfigureerib rakenduse teenuse, mida juurutatakse.

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

- **Rida 42**: Määratleb teenuse nimega "api_and_frontend"
- **Rida 43**: Viitab `./src` kataloogile lähtekoodi jaoks
- **Rida 44**: Määratleb Python programmeerimiskeelena
- **Rida 45**: Kasutab Azure Container Apps platvormi hostimiseks
- **Rida 46-48**: Docker konfiguratsioon

      - Kasutab "api_and_frontend" pildinime
      - Ehitab Docker pildi Azure'is kaugjuhtimisega (mitte kohapeal)

### 2.5 Torujuhtme muutujad (49-76)

Need on muutujad, mis aitavad `azd` käivitada CI/CD torujuhtmetes automatiseerimiseks.

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

See sektsioon määratleb keskkonnamuutujad, mida kasutatakse **juurutamise ajal**, organiseeritud kategooriate kaupa:

- **Azure'i ressursside nimed (Rida 51-60)**:
      - Põhilised Azure'i teenuste ressursside nimed, nt Resource Group, AI Hub, AI Project jne
- **Funktsiooni lülitid (Rida 61-63)**:
      - Boolean muutujad konkreetsete Azure'i teenuste lubamiseks/keelamiseks
- **AI agendi konfiguratsioon (Rida 64-71)**:
      - Põhiagendi konfiguratsioon, sealhulgas nimi, ID, juurutamise seaded, mudeli detailid
- **AI sisseehitamise konfiguratsioon (Rida 72-79)**:
      - Sisseehitamise mudeli konfiguratsioon vektoriotsingu jaoks
- **Otsing ja monitooring (Rida 80-84)**:
      - Otsinguindeksi nimi, olemasolevate ressursside ID-d ja monitooringu/jälgimise seaded

---

## 3. Keskkonnamuutujate tundmine
Järgnevad keskkonnamuutujad kontrollivad sinu juurutamise konfiguratsiooni ja käitumist, organiseeritud nende peamise eesmärgi järgi. Enamikul muutujatel on mõistlikud vaikeseaded, kuid sa saad neid kohandada vastavalt oma konkreetsetele nõuetele või olemasolevatele Azure'i ressurssidele.

### 3.1 Nõutavad muutujad 

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

### 3.2 Mudeli konfiguratsioon 
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

### 3.3 Funktsiooni lüliti
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

### 3.4 AI projekti konfiguratsioon 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Kontrolli oma muutujaid

Kasuta Azure Developer CLI-d, et vaadata ja hallata oma keskkonnamuutujaid:

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

**Lahtiütlus**:  
See dokument on tõlgitud, kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks lugeda autoriteetseks allikaks. Olulise teabe puhul on soovitatav kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valede tõlgenduste eest.