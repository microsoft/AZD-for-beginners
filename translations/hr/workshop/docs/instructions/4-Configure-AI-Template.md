<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-25T02:05:10+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "hr"
}
-->
# 4. Konfiguriranje predloška

!!! tip "NA KRAJU OVOG MODULA MOĆI ĆETE"

    - [ ] Razumjeti svrhu `azure.yaml`
    - [ ] Razumjeti strukturu `azure.yaml`
    - [ ] Razumjeti vrijednost azd životnog ciklusa `hooks`
    - [ ] **Laboratorij 3:** 

---

!!! prompt "Što radi datoteka `azure.yaml`? Koristite codefence i objasnite liniju po liniju"

      Datoteka `azure.yaml` je **konfiguracijska datoteka za Azure Developer CLI (azd)**. Definira kako vaša aplikacija treba biti implementirana na Azure, uključujući infrastrukturu, usluge, hooks za implementaciju i varijable okruženja.

---

## 1. Svrha i funkcionalnost

Datoteka `azure.yaml` služi kao **plan implementacije** za aplikaciju AI agenta koja:

1. **Provjerava okruženje** prije implementacije
2. **Omogućuje Azure AI usluge** (AI Hub, AI Project, Search, itd.)
3. **Implementira Python aplikaciju** na Azure Container Apps
4. **Konfigurira AI modele** za funkcionalnost chata i ugradnje
5. **Postavlja praćenje i nadzor** za AI aplikaciju
6. **Rukuje novim i postojećim** scenarijima Azure AI projekata

Datoteka omogućuje **implementaciju jednim naredbom** (`azd up`) za cjelovito AI agent rješenje s pravilnom validacijom, omogućavanjem i post-implementacijskom konfiguracijom.

??? info "Proširi za pregled: `azure.yaml`"

      Datoteka `azure.yaml` definira kako Azure Developer CLI treba implementirati i upravljati ovom AI Agent aplikacijom na Azure. Razmotrimo je liniju po liniju.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: trebamo li hooks? 
      # TODO: trebamo li sve varijable?

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

## 2. Razlaganje datoteke

Prođimo kroz datoteku dio po dio kako bismo razumjeli što radi - i zašto.

### 2.1 **Zaglavlje i shema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linija 1**: Pruža shemu za validaciju YAML jezika za podršku IDE-u i IntelliSense

### 2.2 Metadata projekta (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linija 5**: Definira ime projekta koje koristi Azure Developer CLI
- **Linije 6-7**: Navodi da se temelji na verziji predloška 1.0.2
- **Linije 8-9**: Zahtijeva verziju Azure Developer CLI 1.14.0 ili noviju

### 2.3 Hooks za implementaciju (11-40)

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

- **Linije 11-20**: **Hook prije implementacije** - pokreće se prije `azd up`

      - Na Unix/Linux: Čini skriptu za validaciju izvršivom i pokreće je
      - Na Windows: Pokreće PowerShell skriptu za validaciju
      - Oba su interaktivna i zaustavit će implementaciju ako ne uspiju

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
- **Linije 21-30**: **Hook nakon omogućavanja** - pokreće se nakon što su Azure resursi stvoreni

  - Izvršava skripte za pisanje varijabli okruženja
  - Nastavlja implementaciju čak i ako ove skripte ne uspiju (`continueOnError: true`)

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
- **Linije 31-40**: **Hook nakon implementacije** - pokreće se nakon implementacije aplikacije

  - Izvršava završne skripte za postavljanje
  - Nastavlja čak i ako skripte ne uspiju

### 2.4 Konfiguracija usluge (41-48)

Ovo konfigurira uslugu aplikacije koju implementirate.

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

- **Linija 42**: Definira uslugu nazvanu "api_and_frontend"
- **Linija 43**: Ukazuje na direktorij `./src` za izvorni kod
- **Linija 44**: Navodi Python kao programski jezik
- **Linija 45**: Koristi Azure Container Apps kao platformu za hosting
- **Linije 46-48**: Konfiguracija Dockera

      - Koristi "api_and_frontend" kao ime slike
      - Daljinski gradi Docker sliku u Azureu (ne lokalno)

### 2.5 Varijable za pipeline (49-76)

Ove varijable pomažu u pokretanju `azd` u CI/CD pipeline-ovima za automatizaciju

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

Ovaj odjeljak definira varijable okruženja koje se koriste **tijekom implementacije**, organizirane po kategorijama:

- **Imena Azure resursa (Linije 51-60)**:
      - Ključna imena resursa Azure usluga, npr. Resource Group, AI Hub, AI Project, itd.- 
- **Zastavice značajki (Linije 61-63)**:
      - Booleanske varijable za omogućavanje/onemogućavanje određenih Azure usluga
- **Konfiguracija AI agenta (Linije 64-71)**:
      - Konfiguracija za glavnog AI agenta uključujući ime, ID, postavke implementacije, detalje modela- 
- **Konfiguracija AI ugradnje (Linije 72-79)**:
      - Konfiguracija za model ugradnje koji se koristi za pretraživanje vektora
- **Pretraživanje i nadzor (Linije 80-84)**:
      - Ime indeksa pretraživanja, postojeći ID resursa i postavke praćenja/nadzora

---

## 3. Poznavanje varijabli okruženja
Sljedeće varijable okruženja kontroliraju konfiguraciju i ponašanje vaše implementacije, organizirane prema njihovoj primarnoj svrsi. Većina varijabli ima razumne zadane vrijednosti, ali ih možete prilagoditi kako bi odgovarale vašim specifičnim zahtjevima ili postojećim Azure resursima.

### 3.1 Obavezne varijable 

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

### 3.3 Zastavice značajki
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

### 3.5 Provjera vaših varijabli

Koristite Azure Developer CLI za pregled i upravljanje vašim varijablama okruženja:

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

