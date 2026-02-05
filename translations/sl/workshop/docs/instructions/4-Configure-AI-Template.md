# 4. Konfiguracija predloge

!!! tip "OB KONCU TEGA MODULA BOSTE ZMOGLI"

    - [ ] Razumeti namen datoteke `azure.yaml`
    - [ ] Razumeti strukturo datoteke `azure.yaml`
    - [ ] Razumeti vrednost življenjskih ciklov `hooks` v azd
    - [ ] **Laboratorij 3:** 

---

!!! prompt "Kaj počne datoteka `azure.yaml`? Uporabite kodo in jo razložite vrstico po vrstico"

      Datoteka `azure.yaml` je **konfiguracijska datoteka za Azure Developer CLI (azd)**. Določa, kako naj se vaša aplikacija namesti v Azure, vključno z infrastrukturo, storitvami, namestitvenimi kljukami in okoljskimi spremenljivkami.

---

## 1. Namen in funkcionalnost

Datoteka `azure.yaml` služi kot **načrt za namestitev** aplikacije AI agenta, ki:

1. **Preveri okolje** pred namestitvijo
2. **Vzpostavi Azure AI storitve** (AI Hub, AI Project, Search itd.)
3. **Namesti Python aplikacijo** v Azure Container Apps
4. **Konfigurira AI modele** za funkcionalnosti klepeta in vdelave
5. **Vzpostavi nadzor in sledenje** za AI aplikacijo
6. **Obravnava tako nove kot obstoječe** scenarije Azure AI projektov

Datoteka omogoča **namestitev z enim ukazom** (`azd up`) celotne rešitve AI agenta z ustreznim preverjanjem, vzpostavitvijo in konfiguracijo po namestitvi.

??? info "Razširi za ogled: `azure.yaml`"

      Datoteka `azure.yaml` določa, kako naj Azure Developer CLI namesti in upravlja to aplikacijo AI agenta v Azure. Poglejmo jo vrstico po vrstico.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: ali potrebujemo kljuke? 
      # TODO: ali potrebujemo vse spremenljivke?

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

## 2. Razčlenitev datoteke

Pojdimo skozi datoteko po odsekih, da razumemo, kaj počne - in zakaj.

### 2.1 **Glava in shema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Vrstica 1**: Omogoča validacijo sheme YAML jezikovnega strežnika za podporo IDE in IntelliSense

### 2.2 Metapodatki projekta (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Vrstica 5**: Določa ime projekta, ki ga uporablja Azure Developer CLI
- **Vrstici 6-7**: Navedeno je, da temelji na predlogi različice 1.0.2
- **Vrstici 8-9**: Zahteva različico Azure Developer CLI 1.14.0 ali novejšo

### 2.3 Namestitvene kljuke (11-40)

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

- **Vrstice 11-20**: **Kljuka pred namestitvijo** - se zažene pred `azd up`

      - Na Unix/Linux: Naredi validacijski skript izvedljiv in ga zažene
      - Na Windows: Zažene PowerShell validacijski skript
      - Obe sta interaktivni in ustavita namestitev, če spodletita

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
- **Vrstice 21-30**: **Kljuka po vzpostavitvi** - se zažene po ustvarjanju Azure virov

  - Izvede skripte za zapisovanje okoljskih spremenljivk
  - Nadaljuje namestitev, tudi če ti skripti spodletijo (`continueOnError: true`)

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
- **Vrstice 31-40**: **Kljuka po namestitvi** - se zažene po namestitvi aplikacije

  - Izvede končne nastavitvene skripte
  - Nadaljuje, tudi če skripti spodletijo

### 2.4 Konfiguracija storitve (41-48)

To konfigurira storitev aplikacije, ki jo nameščate.

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

- **Vrstica 42**: Določa storitev z imenom "api_and_frontend"
- **Vrstica 43**: Kaže na mapo `./src` za izvorno kodo
- **Vrstica 44**: Določa Python kot programski jezik
- **Vrstica 45**: Uporablja Azure Container Apps kot platformo za gostovanje
- **Vrstice 46-48**: Konfiguracija Dockerja

      - Uporablja "api_and_frontend" kot ime slike
      - Slika Dockerja se gradi na daljavo v Azure (ne lokalno)

### 2.5 Spremenljivke za pipeline (49-76)

To so spremenljivke, ki vam pomagajo zagnati `azd` v CI/CD pipeline za avtomatizacijo

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

Ta odsek določa okoljske spremenljivke, uporabljene **med namestitvijo**, organizirane po kategorijah:

- **Imena Azure virov (vrstice 51-60)**:
      - Imena osnovnih storitev Azure, npr. Resource Group, AI Hub, AI Project itd.- 
- **Zastavice funkcij (vrstice 61-63)**:
      - Logične spremenljivke za omogočanje/onemogočanje določenih storitev Azure
- **Konfiguracija AI agenta (vrstice 64-71)**:
      - Konfiguracija glavnega AI agenta, vključno z imenom, ID-jem, nastavitvami namestitve, podrobnostmi modela- 
- **Konfiguracija vdelave AI (vrstice 72-79)**:
      - Konfiguracija modela vdelave, uporabljenega za iskanje vektorjev
- **Iskanje in nadzor (vrstice 80-84)**:
      - Ime indeksa iskanja, obstoječi ID-ji virov in nastavitve nadzora/sledenja

---

## 3. Poznavanje okoljskih spremenljivk
Naslednje okoljske spremenljivke nadzorujejo konfiguracijo in vedenje vaše namestitve, organizirane glede na njihov glavni namen. Večina spremenljivk ima smiselne privzete vrednosti, vendar jih lahko prilagodite, da ustrezajo vašim specifičnim zahtevam ali obstoječim Azure virom.

### 3.1 Zahtevane spremenljivke 

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

### 3.2 Konfiguracija modela 
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

### 3.3 Preklop funkcij
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

### 3.4 Konfiguracija AI projekta 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Preverite svoje spremenljivke

Uporabite Azure Developer CLI za ogled in upravljanje svojih okoljskih spremenljivk:

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

