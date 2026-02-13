# 4. Configure a Template

!!! tip "MODULIO PABAIGOJE GALĖSITE"

    - [ ] Suprasti `azure.yaml` paskirtį
    - [ ] Suprasti `azure.yaml` struktūrą
    - [ ] Suprasti azd gyvenimo ciklo `hooks` reikšmę
    - [ ] **Laboratorija 4:** Išnagrinėti ir pakeisti aplinkos kintamuosius

---

!!! prompt "Ką daro `azure.yaml` failas? Naudokite kodo bloką ir paaiškinkite eilutė po eilutės"

      `azure.yaml` failas yra **konfigūracijos failas Azure Developer CLI (azd)**. Jame apibrėžiama, kaip jūsų programa turėtų būti diegiama į Azure, įskaitant infrastruktūrą, paslaugas, diegimo hooks ir aplinkos kintamuosius.

---

## 1. Purpose and Functionality

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Validates environment** before deployment
2. **Provisions Azure AI services** (AI Hub, AI Project, Search, etc.)
3. **Deploys a Python application** to Azure Container Apps
4. **Configures AI models** for both chat and embedding functionality
5. **Sets up monitoring and tracing** for the AI application
6. **Handles both new and existing** Azure AI project scenarios

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "Išplėsti, kad pamatytumėte: `azure.yaml`"

      `azure.yaml` failas apibrėžia, kaip Azure Developer CLI turėtų diegti ir valdyti šią AI agento programą Azure. Paaiškinkime ją eilutė po eilutės.

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

## 2. Deconstructing The File

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **Header and Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Suteikia YAML language server schemos validaciją IDE palaikymui ir IntelliSense

### 2.2 Project Metadata (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Nustato projekto vardą, kurį naudoja Azure Developer CLI
- **Lines 6-7**: Nurodo, kad tai remiasi šablonu versijos 1.0.2
- **Lines 8-9**: Reikalauja Azure Developer CLI versijos 1.14.0 arba naujesnės

### 2.3 Deploy Hooks (11-40)

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

- **Lines 11-20**: **Hook prieš diegimą (pre-deployment)** - vyksta prieš `azd up`

      - Unix/Linux: padaro patikros skriptą vykdomu ir jį paleidžia
      - Windows: paleidžia PowerShell patikros skriptą
      - Abu yra interaktyvūs ir nutrauks diegimą, jei nepavyks

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
- **Lines 21-30**: **Post-provision hook** - vyksta po Azure išteklių sukūrimo

  - Vykdo aplinkos kintamųjų rašymo skriptus
  - Tęsiama diegimas net jei šie skriptai nepavyksta (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - vyksta po programos diegimo

  - Vykdo galutinius sąrankos skriptus
  - Tęsiama, net jei skriptai nepavyksta

### 2.4 Service Config (41-48)

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

- **Line 42**: Apibrėžia paslaugą pavadinimu "api_and_frontend"
- **Line 43**: Nurodo `./src` katalogą su šaltinio kodu
- **Line 44**: Nurodo Python kaip programavimo kalbą
- **Line 45**: Naudoja Azure Container Apps kaip talpinimo platformą
- **Lines 46-48**: Docker konfigūracija

      - Naudoja "api_and_frontend" kaip atvaizdo (image) pavadinimą
      - Docker atvaizdas yra kuriamas nuotoliniu būdu Azure (ne lokaliai)

### 2.5 Pipeline Variables (49-76)

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
      - Pagrindiniai Azure paslaugų išteklių pavadinimai pvz., Resource Group, AI Hub, AI Project ir kt.
- **Feature Flags (Lines 61-63)**:
      - Boolean tipo kintamieji, skirtūs įjungti/išjungti tam tikras Azure paslaugas
- **AI Agent Configuration (Lines 64-71)**:
      - Pagrindinio AI agente konfigūracijos, įskaitant pavadinimą, ID, diegimo nustatymus, modelio detales
- **AI Embedding Configuration (Lines 72-79)**:
      - Įterpimo modelio, naudojamo vektoriniam paieškai, konfigūracija
- **Search and Monitoring (Lines 80-84)**:
      - Paieškos indekso pavadinimas, esamų išteklių ID ir stebėjimo / tracing nustatymai

---

## 3. Know Env Variables
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 Required Variables 

```bash title="" linenums="0"
# Pagrindinė Azure konfigūracija
AZURE_ENV_NAME                    # Aplinkos pavadinimas (naudojamas resursų pavadinimuose)
AZURE_LOCATION                    # Diegimo regionas
AZURE_SUBSCRIPTION_ID             # Tikslinė prenumerata
AZURE_RESOURCE_GROUP              # Resursų grupės pavadinimas
AZURE_PRINCIPAL_ID                # Vartotojo principalas RBAC

# Resursų pavadinimai (jei nenurodyta, sugeneruojami automatiškai)
AZURE_AIHUB_NAME                  # Microsoft Foundry hub pavadinimas
AZURE_AIPROJECT_NAME              # DI projekto pavadinimas
AZURE_AISERVICES_NAME             # DI paslaugų paskyros pavadinimas
AZURE_STORAGE_ACCOUNT_NAME        # Saugojimo paskyros pavadinimas
AZURE_CONTAINER_REGISTRY_NAME     # Konteinerių registro pavadinimas
AZURE_KEYVAULT_NAME               # Raktų saugyklos pavadinimas (jei naudojama)
```

### 3.2 Model Configuration 
```bash title="" linenums="0"
# Pokalbių modelio konfigūracija
AZURE_AI_AGENT_MODEL_NAME         # Numatytoji: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Numatytoji: OpenAI (arba Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Numatytoji: naujausia prieinama
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Diegimo pavadinimas pokalbių modeliui
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Numatytoji: Standartinis
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Numatytoji: 80 (tūkstančių TPM)

# Įterpimų modelio konfigūracija
AZURE_AI_EMBED_MODEL_NAME         # Numatytoji: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Numatytoji: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Numatytoji: naujausia prieinama
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Diegimo pavadinimas įterpimams
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Numatytoji: Standartinis
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Numatytoji: 50 (tūkstančių TPM)

# Agento konfigūracija
AZURE_AI_AGENT_NAME               # Agento rodomas pavadinimas
AZURE_EXISTING_AGENT_ID           # Naudoti esamą agentą (pasirinktinai)
```

### 3.3 Feature Toggle
```bash title="" linenums="0"
# Pasirenkamos paslaugos
USE_APPLICATION_INSIGHTS         # Numatytasis: true
USE_AZURE_AI_SEARCH_SERVICE      # Numatytasis: false
USE_CONTAINER_REGISTRY           # Numatytasis: true

# Monitoravimas ir sekimas
ENABLE_AZURE_MONITOR_TRACING     # Numatytasis: false
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Numatytasis: false

# Paieškos konfigūracija
AZURE_AI_SEARCH_INDEX_NAME       # Paieškos indekso pavadinimas
AZURE_SEARCH_SERVICE_NAME        # Paieškos paslaugos pavadinimas
```

### 3.4 AI Project Configuration 
```bash title="" linenums="0"
# Naudoti esamus išteklius
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Esamo dirbtinio intelekto projekto pilnas resurso ID
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Esamo projekto galinio taško URL
```

### 3.5 Check Your Variables

Use the Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# Rodyti visus dabartinės aplinkos kintamuosius
azd env get-values

# Gauti konkretų aplinkos kintamąjį
azd env get-value AZURE_ENV_NAME

# Nustatyti aplinkos kintamąjį
azd env set AZURE_LOCATION eastus

# Nustatyti kelis kintamuosius iš .env failo
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas pagrindiniu šaltiniu. Svarbios informacijos atveju rekomenduojamas profesionalus vertimas, atliktas žmogaus vertėjo. Mes neatsakome už bet kokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->