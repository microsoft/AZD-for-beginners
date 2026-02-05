# 4. Konfigurácia šablóny

!!! tip "NA KONCI TOHTO MODULU BUDETE SCHOPNÍ"

    - [ ] Pochopiť účel súboru `azure.yaml`
    - [ ] Pochopiť štruktúru súboru `azure.yaml`
    - [ ] Pochopiť hodnotu životného cyklu `hooks` v azd
    - [ ] **Lab 3:** 

---

!!! prompt "Čo robí súbor `azure.yaml`? Použite kódový blok a vysvetlite ho riadok po riadku"

      Súbor `azure.yaml` je **konfiguračný súbor pre Azure Developer CLI (azd)**. Definuje, ako by mala byť vaša aplikácia nasadená do Azure, vrátane infraštruktúry, služieb, nasadzovacích hookov a environmentálnych premenných.

---

## 1. Účel a funkčnosť

Súbor `azure.yaml` slúži ako **plán nasadenia** pre aplikáciu AI agenta, ktorá:

1. **Validuje prostredie** pred nasadením
2. **Zabezpečuje Azure AI služby** (AI Hub, AI Project, Search, atď.)
3. **Nasadzuje Python aplikáciu** do Azure Container Apps
4. **Konfiguruje AI modely** pre chat a embedding funkcie
5. **Nastavuje monitoring a sledovanie** pre AI aplikáciu
6. **Rieši nové aj existujúce** scenáre Azure AI projektov

Súbor umožňuje **nasadenie jedným príkazom** (`azd up`) kompletnej AI agentovej aplikácie s riadnou validáciou, zabezpečením a konfiguráciou po nasadení.

??? info "Rozbaliť na zobrazenie: `azure.yaml`"

      Súbor `azure.yaml` definuje, ako by mal Azure Developer CLI nasadiť a spravovať túto AI agentovú aplikáciu v Azure. Poďme si ho rozobrať riadok po riadku.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: potrebujeme hooky? 
      # TODO: potrebujeme všetky premenné?

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

## 2. Rozbor súboru

Poďme si prejsť súbor sekciu po sekcii, aby sme pochopili, čo robí - a prečo.

### 2.1 **Hlavička a schéma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Riadok 1**: Poskytuje validáciu schémy YAML language serveru pre podporu IDE a IntelliSense

### 2.2 Metadata projektu (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Riadok 5**: Definuje názov projektu používaný Azure Developer CLI
- **Riadky 6-7**: Špecifikuje, že ide o šablónu verzie 1.0.2
- **Riadky 8-9**: Vyžaduje verziu Azure Developer CLI 1.14.0 alebo vyššiu

### 2.3 Hooky nasadenia (11-40)

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

- **Riadky 11-20**: **Hook pred nasadením** - spúšťa sa pred `azd up`

      - Na Unix/Linux: Robí validačný skript spustiteľným a spúšťa ho
      - Na Windows: Spúšťa PowerShell validačný skript
      - Obe sú interaktívne a zastavia nasadenie, ak zlyhajú

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
- **Riadky 21-30**: **Hook po zabezpečení** - spúšťa sa po vytvorení Azure zdrojov

  - Spúšťa skripty na zapisovanie environmentálnych premenných
  - Pokračuje v nasadení, aj keď tieto skripty zlyhajú (`continueOnError: true`)

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
- **Riadky 31-40**: **Hook po nasadení** - spúšťa sa po nasadení aplikácie

  - Spúšťa finálne nastavovacie skripty
  - Pokračuje, aj keď skripty zlyhajú

### 2.4 Konfigurácia služby (41-48)

Táto sekcia konfiguruje službu aplikácie, ktorú nasadzujete.

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

- **Riadok 42**: Definuje službu s názvom "api_and_frontend"
- **Riadok 43**: Ukazuje na adresár `./src` pre zdrojový kód
- **Riadok 44**: Špecifikuje Python ako programovací jazyk
- **Riadok 45**: Používa Azure Container Apps ako hostingovú platformu
- **Riadky 46-48**: Konfigurácia Dockeru

      - Používa "api_and_frontend" ako názov obrazu
      - Vzdialene vytvára Docker obraz v Azure (nie lokálne)

### 2.5 Premenné pre pipeline (49-76)

Tieto premenné pomáhajú pri spúšťaní `azd` v CI/CD pipeline pre automatizáciu

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

Táto sekcia definuje environmentálne premenné používané **počas nasadenia**, organizované podľa kategórií:

- **Názvy Azure zdrojov (Riadky 51-60)**:
      - Názvy hlavných Azure služieb, napr. Resource Group, AI Hub, AI Project, atď.- 
- **Prepínače funkcií (Riadky 61-63)**:
      - Boolean premenné na povolenie/zakázanie konkrétnych Azure služieb
- **Konfigurácia AI agenta (Riadky 64-71)**:
      - Konfigurácia hlavného AI agenta vrátane názvu, ID, nastavení nasadenia, detailov modelu- 
- **Konfigurácia embeddingu AI (Riadky 72-79)**:
      - Konfigurácia embedding modelu používaného pre vektorové vyhľadávanie
- **Vyhľadávanie a monitoring (Riadky 80-84)**:
      - Názov indexu vyhľadávania, existujúce ID zdrojov a nastavenia monitorovania/sledovania

---

## 3. Poznajte environmentálne premenné
Nasledujúce environmentálne premenné kontrolujú konfiguráciu a správanie vášho nasadenia, organizované podľa ich hlavného účelu. Väčšina premenných má rozumné predvolené hodnoty, ale môžete ich prispôsobiť tak, aby zodpovedali vašim konkrétnym požiadavkám alebo existujúcim Azure zdrojom.

### 3.1 Povinné premenné 

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

### 3.2 Konfigurácia modelu 
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

### 3.3 Prepínače funkcií
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

### 3.4 Konfigurácia AI projektu 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Skontrolujte svoje premenné

Použite Azure Developer CLI na zobrazenie a správu vašich environmentálnych premenných:

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

