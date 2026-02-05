# 4. Sanidi Kiolezo

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Kuelewa madhumuni ya `azure.yaml`
    - [ ] Kuelewa muundo wa `azure.yaml`
    - [ ] Kuelewa thamani ya `hooks` za azd lifecyle
    - [ ] **Maabara ya 3:** 

---

!!! prompt "Faili ya `azure.yaml` inafanya nini? Tumia codefence na eleza mstari kwa mstari"

      Faili ya `azure.yaml` ni **faili la usanidi kwa Azure Developer CLI (azd)**. Inafafanua jinsi programu yako inavyopaswa kupelekwa kwenye Azure, ikijumuisha miundombinu, huduma, hooks za upelekaji, na vigezo vya mazingira.

---

## 1. Madhumuni na Utendaji

Faili hii ya `azure.yaml` inatumika kama **ramani ya upelekaji** kwa programu ya wakala wa AI ambayo:

1. **Inathibitisha mazingira** kabla ya upelekaji
2. **Inatoa huduma za Azure AI** (AI Hub, AI Project, Search, nk.)
3. **Inapeleka programu ya Python** kwenye Azure Container Apps
4. **Inasanidi mifano ya AI** kwa mazungumzo na utendaji wa embedding
5. **Inasanidi ufuatiliaji na uchunguzi** wa programu ya AI
6. **Inashughulikia hali zote mbili za mradi mpya na uliopo** wa Azure AI

Faili hii inawezesha **upelekaji kwa amri moja** (`azd up`) wa suluhisho kamili la wakala wa AI na uthibitishaji sahihi, utoaji, na usanidi baada ya upelekaji.

??? info "Panua Ili Kuona: `azure.yaml`"

      Faili ya `azure.yaml` inafafanua jinsi Azure Developer CLI inavyopaswa kupeleka na kudhibiti programu hii ya AI Agent kwenye Azure. Hebu tuichambue mstari kwa mstari.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: tunahitaji hooks?
      # TODO: tunahitaji vigezo vyote?

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

## 2. Kuchambua Faili

Hebu tuipitie faili sehemu kwa sehemu, ili kuelewa inachofanya - na kwa nini.

### 2.1 **Kichwa na Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Mstari wa 1**: Hutoa uthibitishaji wa schema ya YAML language server kwa msaada wa IDE na IntelliSense

### 2.2 Metadata ya Mradi (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Mstari wa 5**: Inafafanua jina la mradi linalotumiwa na Azure Developer CLI
- **Mistari ya 6-7**: Inaonyesha kuwa hii inategemea toleo la kiolezo 1.0.2
- **Mistari ya 8-9**: Inahitaji toleo la Azure Developer CLI 1.14.0 au zaidi

### 2.3 Hooks za Upelekaji (11-40)

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

- **Mistari ya 11-20**: **Hook ya kabla ya upelekaji** - inaendeshwa kabla ya `azd up`

      - Kwenye Unix/Linux: Inafanya script ya uthibitishaji iweze kutekelezwa na kuiendesha
      - Kwenye Windows: Inaendesha script ya uthibitishaji ya PowerShell
      - Zote ni za maingiliano na zitasimamisha upelekaji ikiwa zitashindwa

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
- **Mistari ya 21-30**: **Hook ya baada ya utoaji** - inaendeshwa baada ya rasilimali za Azure kuundwa

  - Inaendesha script za kuandika vigezo vya mazingira
  - Inaendelea na upelekaji hata kama script hizi zitashindwa (`continueOnError: true`)

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
- **Mistari ya 31-40**: **Hook ya baada ya upelekaji** - inaendeshwa baada ya upelekaji wa programu

  - Inaendesha script za usanidi wa mwisho
  - Inaendelea hata kama script zitashindwa

### 2.4 Usanidi wa Huduma (41-48)

Hii inasanidi huduma ya programu unayoipeleka.

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

- **Mstari wa 42**: Inafafanua huduma inayoitwa "api_and_frontend"
- **Mstari wa 43**: Inaelekeza kwenye saraka ya `./src` kwa msimbo wa chanzo
- **Mstari wa 44**: Inataja Python kama lugha ya programu
- **Mstari wa 45**: Inatumia Azure Container Apps kama jukwaa la mwenyeji
- **Mistari ya 46-48**: Usanidi wa Docker

      - Inatumia "api_and_frontend" kama jina la picha
      - Inajenga picha ya Docker kwa mbali kwenye Azure (sio kwa ndani)

### 2.5 Vigezo vya Pipeline (49-76)

Hivi ni vigezo vya kukusaidia kuendesha `azd` katika pipeline za CI/CD kwa ajili ya otomatiki

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

Sehemu hii inafafanua vigezo vya mazingira vinavyotumiwa **wakati wa upelekaji**, vilivyopangwa kwa kategoria:

- **Majina ya Rasilimali za Azure (Mistari ya 51-60)**:
      - Majina ya huduma kuu za Azure kama Resource Group, AI Hub, AI Project, nk.- 
- **Bendera za Kipengele (Mistari ya 61-63)**:
      - Vigezo vya Boolean vya kuwezesha/kuzima huduma maalum za Azure
- **Usanidi wa Wakala wa AI (Mistari ya 64-71)**:
      - Usanidi wa wakala mkuu wa AI ikijumuisha jina, ID, mipangilio ya upelekaji, maelezo ya modeli- 
- **Usanidi wa Embedding ya AI (Mistari ya 72-79)**:
      - Usanidi wa modeli ya embedding inayotumika kwa utafutaji wa vector
- **Utafutaji na Ufuatiliaji (Mistari ya 80-84)**:
      - Jina la index ya utafutaji, ID za rasilimali zilizopo, na mipangilio ya ufuatiliaji/uchunguzi

---

## 3. Fahamu Vigezo vya Mazingira
Vigezo vifuatavyo vya mazingira vinadhibiti usanidi na tabia ya upelekaji wako, vilivyopangwa kulingana na madhumuni yao ya msingi. Vigezo vingi vina chaguo-msingi nzuri, lakini unaweza kuviweka kulingana na mahitaji yako maalum au rasilimali zilizopo za Azure.

### 3.1 Vigezo Vinavyohitajika 

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

### 3.2 Usanidi wa Modeli 
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

### 3.3 Toggle ya Kipengele
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

### 3.4 Usanidi wa Mradi wa AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Angalia Vigezo Vyako

Tumia Azure Developer CLI kuona na kudhibiti vigezo vyako vya mazingira:

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

