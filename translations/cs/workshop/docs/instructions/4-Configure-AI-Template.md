<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-25T02:02:58+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "cs"
}
-->
# 4. Konfigurace šablony

!!! tip "NA KONCI TOHOTO MODULU BUDETE SCHOPNI"

    - [ ] Porozumět účelu souboru `azure.yaml`
    - [ ] Porozumět struktuře souboru `azure.yaml`
    - [ ] Porozumět hodnotě životního cyklu `hooks` v azd
    - [ ] **Lab 3:** 

---

!!! prompt "Co dělá soubor `azure.yaml`? Použijte codefence a vysvětlete ho řádek po řádku"

      Soubor `azure.yaml` je **konfigurační soubor pro Azure Developer CLI (azd)**. Definuje, jak by měla být vaše aplikace nasazena do Azure, včetně infrastruktury, služeb, nasazovacích hooků a environmentálních proměnných.

---

## 1. Účel a funkčnost

Soubor `azure.yaml` slouží jako **plán nasazení** pro aplikaci AI agenta, která:

1. **Ověřuje prostředí** před nasazením
2. **Zajišťuje Azure AI služby** (AI Hub, AI Project, Search, atd.)
3. **Nasazuje Python aplikaci** do Azure Container Apps
4. **Konfiguruje AI modely** pro chat a funkci embedování
5. **Nastavuje monitoring a sledování** pro AI aplikaci
6. **Řeší nové i existující** scénáře Azure AI projektů

Soubor umožňuje **nasazení jedním příkazem** (`azd up`) kompletního řešení AI agenta s řádnou validací, zajištěním a konfigurací po nasazení.

??? info "Rozbalit pro zobrazení: `azure.yaml`"

      Soubor `azure.yaml` definuje, jak by měl Azure Developer CLI nasadit a spravovat tuto aplikaci AI agenta v Azure. Pojďme si ho rozebrat řádek po řádku.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: potřebujeme hooky? 
      # TODO: potřebujeme všechny proměnné?

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

## 2. Rozbor souboru

Pojďme projít soubor sekci po sekci, abychom pochopili, co dělá - a proč.

### 2.1 **Hlavička a schéma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Řádek 1**: Poskytuje validaci schématu YAML language serveru pro podporu IDE a IntelliSense

### 2.2 Metadata projektu (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Řádek 5**: Definuje název projektu používaný Azure Developer CLI
- **Řádky 6-7**: Určuje, že je založen na šabloně verze 1.0.2
- **Řádky 8-9**: Vyžaduje verzi Azure Developer CLI 1.14.0 nebo vyšší

### 2.3 Nasazovací hooky (11-40)

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

- **Řádky 11-20**: **Hook před nasazením** - spouští se před `azd up`

      - Na Unix/Linux: Zpřístupní validační skript a spustí ho
      - Na Windows: Spustí validační skript v PowerShellu
      - Oba jsou interaktivní a zastaví nasazení, pokud selžou

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
- **Řádky 21-30**: **Hook po zajištění** - spouští se po vytvoření Azure zdrojů

  - Spouští skripty pro zápis environmentálních proměnných
  - Pokračuje v nasazení, i když tyto skripty selžou (`continueOnError: true`)

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
- **Řádky 31-40**: **Hook po nasazení** - spouští se po nasazení aplikace

  - Spouští finální nastavovací skripty
  - Pokračuje, i když skripty selžou

### 2.4 Konfigurace služby (41-48)

Tato sekce konfiguruje službu aplikace, kterou nasazujete.

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

- **Řádek 42**: Definuje službu nazvanou "api_and_frontend"
- **Řádek 43**: Ukazuje na adresář `./src` pro zdrojový kód
- **Řádek 44**: Určuje Python jako programovací jazyk
- **Řádek 45**: Používá Azure Container Apps jako platformu pro hosting
- **Řádky 46-48**: Konfigurace Dockeru

      - Používá "api_and_frontend" jako název image
      - Vytváří Docker image vzdáleně v Azure (ne lokálně)

### 2.5 Proměnné pipeline (49-76)

Tyto proměnné pomáhají při automatizaci `azd` v CI/CD pipelinech.

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

Tato sekce definuje environmentální proměnné používané **během nasazení**, organizované podle kategorií:

- **Názvy Azure zdrojů (Řádky 51-60)**:
      - Názvy klíčových Azure služeb, např. Resource Group, AI Hub, AI Project, atd.- 
- **Přepínače funkcí (Řádky 61-63)**:
      - Boolean proměnné pro povolení/zakázání specifických Azure služeb
- **Konfigurace AI agenta (Řádky 64-71)**:
      - Konfigurace hlavního AI agenta včetně názvu, ID, nastavení nasazení, detailů modelu- 
- **Konfigurace embedování AI (Řádky 72-79)**:
      - Konfigurace embedovacího modelu používaného pro vektorové vyhledávání
- **Vyhledávání a monitoring (Řádky 80-84)**:
      - Název indexu vyhledávání, existující ID zdrojů a nastavení monitoringu/sledování

---

## 3. Znalost environmentálních proměnných
Následující environmentální proměnné ovládají konfiguraci a chování vašeho nasazení, organizované podle jejich hlavního účelu. Většina proměnných má rozumné výchozí hodnoty, ale můžete je přizpůsobit tak, aby odpovídaly vašim specifickým požadavkům nebo existujícím Azure zdrojům.

### 3.1 Povinné proměnné 

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

### 3.2 Konfigurace modelu 
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

### 3.3 Přepínače funkcí
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

### 3.4 Konfigurace AI projektu 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Kontrola vašich proměnných

Použijte Azure Developer CLI k zobrazení a správě vašich environmentálních proměnných:

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

