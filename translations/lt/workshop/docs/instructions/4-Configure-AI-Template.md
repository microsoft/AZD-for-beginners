<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-25T02:07:09+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "lt"
}
-->
# 4. Konfigūruokite šabloną

!!! tip "BAIGĘ ŠĮ MODULĮ GALĖSITE"

    - [ ] Suprasti `azure.yaml` paskirtį
    - [ ] Suprasti `azure.yaml` struktūrą
    - [ ] Suprasti azd gyvavimo ciklo `hooks` vertę
    - [ ] **Laboratorinis darbas 3:** 

---

!!! prompt "Ką daro `azure.yaml` failas? Naudokite kodų bloką ir paaiškinkite eilutė po eilutės"

      `azure.yaml` failas yra **konfigūracijos failas Azure Developer CLI (azd)**. Jame apibrėžiama, kaip jūsų aplikacija turėtų būti diegiama Azure, įskaitant infrastruktūrą, paslaugas, diegimo hooks ir aplinkos kintamuosius.

---

## 1. Paskirtis ir funkcionalumas

Šis `azure.yaml` failas veikia kaip **diegimo planas** AI agento aplikacijai, kuri:

1. **Patikrina aplinką** prieš diegimą
2. **Sukuria Azure AI paslaugas** (AI Hub, AI Project, Search ir kt.)
3. **Diegia Python aplikaciją** Azure Container Apps
4. **Konfigūruoja AI modelius** pokalbių ir įterpimo funkcionalumui
5. **Nustato stebėjimą ir sekimą** AI aplikacijai
6. **Tvarko tiek naujus, tiek esamus** Azure AI projektų scenarijus

Failas leidžia **vieno komandos diegimą** (`azd up`) pilnam AI agento sprendimui su tinkamu patikrinimu, sukūrimu ir po diegimo konfigūracija.

??? info "Išplėskite, kad pamatytumėte: `azure.yaml`"

      `azure.yaml` failas apibrėžia, kaip Azure Developer CLI turėtų diegti ir valdyti šią AI agento aplikaciją Azure. Pažvelkime į jį eilutė po eilutės.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: ar mums reikia hooks? 
      # TODO: ar mums reikia visų kintamųjų?

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

## 2. Failo analizė

Pažvelkime į failą skyrius po skyriaus, kad suprastume, ką jis daro ir kodėl.

### 2.1 **Antraštė ir schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1 eilutė**: Pateikia YAML kalbos serverio schemos validaciją IDE palaikymui ir IntelliSense

### 2.2 Projekto metaduomenys (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5 eilutė**: Apibrėžia projekto pavadinimą, naudojamą Azure Developer CLI
- **6-7 eilutės**: Nurodo, kad tai pagrįsta šablono versija 1.0.2
- **8-9 eilutės**: Reikalauja Azure Developer CLI versijos 1.14.0 ar naujesnės

### 2.3 Diegimo hooks (11-40)

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

- **11-20 eilutės**: **Prieš diegimą hook** - vykdomas prieš `azd up`

      - Unix/Linux: Padaro validacijos skriptą vykdomą ir paleidžia jį
      - Windows: Paleidžia PowerShell validacijos skriptą
      - Abu yra interaktyvūs ir sustabdys diegimą, jei nepavyks

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
- **21-30 eilutės**: **Po resursų sukūrimo hook** - vykdomas po Azure resursų sukūrimo

  - Vykdo aplinkos kintamųjų rašymo skriptus
  - Tęsia diegimą, net jei šie skriptai nepavyksta (`continueOnError: true`)

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
- **31-40 eilutės**: **Po diegimo hook** - vykdomas po aplikacijos diegimo

  - Vykdo galutinius nustatymo skriptus
  - Tęsia, net jei skriptai nepavyksta

### 2.4 Paslaugų konfigūracija (41-48)

Ši konfigūracija apibrėžia aplikacijos paslaugą, kurią diegiate.

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

- **42 eilutė**: Apibrėžia paslaugą pavadinimu "api_and_frontend"
- **43 eilutė**: Nurodo `./src` katalogą kaip šaltinio kodą
- **44 eilutė**: Nurodo Python kaip programavimo kalbą
- **45 eilutė**: Naudoja Azure Container Apps kaip talpinimo platformą
- **46-48 eilutės**: Docker konfigūracija

      - Naudoja "api_and_frontend" kaip vaizdo pavadinimą
      - Nuotoliniu būdu Azure sukuria Docker vaizdą (ne lokaliai)

### 2.5 Vamzdyno kintamieji (49-76)

Tai kintamieji, padedantys paleisti `azd` CI/CD vamzdynuose automatizavimui

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

Šiame skyriuje apibrėžiami aplinkos kintamieji, naudojami **diegimo metu**, suskirstyti pagal kategorijas:

- **Azure resursų pavadinimai (51-60 eilutės)**:
      - Pagrindinių Azure paslaugų resursų pavadinimai, pvz., Resource Group, AI Hub, AI Project ir kt.- 
- **Funkcijų vėliavėlės (61-63 eilutės)**:
      - Loginiai kintamieji, skirti įjungti/išjungti tam tikras Azure paslaugas
- **AI agento konfigūracija (64-71 eilutės)**:
      - Pagrindinio AI agento konfigūracija, įskaitant pavadinimą, ID, diegimo nustatymus, modelio detales- 
- **AI įterpimo konfigūracija (72-79 eilutės)**:
      - Konfigūracija įterpimo modeliui, naudojamam vektorinėje paieškoje
- **Paieška ir stebėjimas (80-84 eilutės)**:
      - Paieškos indekso pavadinimas, esamų resursų ID ir stebėjimo/sekimo nustatymai

---

## 3. Žinokite aplinkos kintamuosius
Šie aplinkos kintamieji kontroliuoja jūsų diegimo konfigūraciją ir elgesį, suskirstyti pagal jų pagrindinę paskirtį. Dauguma kintamųjų turi logiškus numatytuosius nustatymus, tačiau galite juos pritaikyti pagal savo specifinius reikalavimus ar esamus Azure resursus.

### 3.1 Privalomi kintamieji 

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

### 3.2 Modelio konfigūracija 
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

### 3.3 Funkcijų perjungimas
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

### 3.4 AI projekto konfigūracija 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Patikrinkite savo kintamuosius

Naudokite Azure Developer CLI, kad peržiūrėtumėte ir valdytumėte savo aplinkos kintamuosius:

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

