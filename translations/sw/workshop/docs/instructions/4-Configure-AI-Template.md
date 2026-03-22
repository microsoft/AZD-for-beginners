# 4. Sanidi Template

!!! tip "MWISHO WA MODULI HII UTAWEZA"

    - [ ] Elewa kusudi la `azure.yaml`
    - [ ] Elewa muundo wa `azure.yaml`
    - [ ] Elewa thamani ya azd lifecycle `hooks`
    - [ ] **Maabara 4:** Chunguza na badilisha vigezo vya mazingira

---

!!! prompt "Je, faili ya `azure.yaml` inafanya nini? Tumia fremu ya msimbo na ifafanue mstari kwa mstari"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Kusudi na Utendaji

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Validates environment** before deployment
2. **Provisions Azure AI services** (AI Hub, AI Project, Search, etc.)
3. **Deploys a Python application** to Azure Container Apps
4. **Configures AI models** for both chat and embedding functionality
5. **Sets up monitoring and tracing** for the AI application
6. **Handles both new and existing** Azure AI project scenarios

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "Panua Ili Kuona: `azure.yaml`"

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

## 2. Kuchambua Faili

Let's go through the file section by section, to understand what it does - and why.

### 2.1 **Kichwa na Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Line 1**: Inatoa uthibitishaji wa schema wa mhudumu wa lugha ya YAML kwa msaada wa IDE na IntelliSense

### 2.2 Metadata ya Mradi (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Line 5**: Inaeleza jina la mradi linalotumika na Azure Developer CLI
- **Lines 6-7**: Inaonyesha kuwa hii inategemea template toleo 1.0.2
- **Lines 8-9**: Inahitaji toleo la Azure Developer CLI 1.14.0 au juu zaidi

### 2.3 Hooks za Utekelezaji (11-40)

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

- **Lines 11-20**: **Hook ya kabla ya uenezaji** - inafanya kazi kabla ya `azd up`

      - Kwa Unix/Linux: Inafanya script ya uthibitisho iwetekelezekane na kuitekeleza
      - Kwa Windows: Inaendesha script ya uthibitisho ya PowerShell
      - Zote mbili ni za maingiliano na zitasitisha uenezaji ikiwa zitashindwa

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
- **Lines 21-30**: **Post-provision hook** - runs after Azure resources are created

  - Inaendesha script za kuandika vigezo vya mazingira
  - Inaendelea na uenezaji hata kama script hizi zitashindwa (`continueOnError: true`)

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
- **Lines 31-40**: **Post-deploy hook** - runs after application deployment

  - Inaendesha script za usanidi wa mwisho
  - Inaendelea hata kama script zitashindwa

### 2.4 Usanidi wa Huduma (41-48)

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

- **Line 42**: Inaeleza huduma iitwayo "api_and_frontend"
- **Line 43**: Inaonyesha saraka `./src` kwa msimbo wa chanzo
- **Line 44**: Inabainisha Python kama lugha ya programu
- **Line 45**: Inatumia Azure Container Apps kama jukwaa la kuwahudumia
- **Lines 46-48**: Usanidi wa Docker

      - Inatumia "api_and_frontend" kama jina la image
      - Inajenga image ya Docker kwa mbali ndani ya Azure (si mahali hapa)

### 2.5 Vigezo vya Pipeline (49-76)

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
      - Majina ya rasilimali kuu za huduma za Azure, kwa mfano, Resource Group, AI Hub, AI Project, n.k.- 
- **Feature Flags (Lines 61-63)**:
      - Vigezo vya boolean ili kuwezesha/kuwasha huduma maalum za Azure
- **AI Agent Configuration (Lines 64-71)**:
      - Usanidi kwa wakala mkuu wa AI ikijumuisha jina, ID, mipangilio ya uenezaji, maelezo ya modeli- 
- **AI Embedding Configuration (Lines 72-79)**:
      - Usanidi kwa modeli ya embedding inayotumika kwa utafutaji wa vekta
- **Search and Monitoring (Lines 80-84)**:
      - Jina la index ya utafutaji, vitambulisho vya rasilimali zilizopo, na mipangilio ya ufuatiliaji/uorodheshaji

---

## 3. Fahamu Vigezo vya Mazingira
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 Vigezo Vinavyohitajika 

```bash title="" linenums="0"
# Usanidi Msingi wa Azure
AZURE_ENV_NAME                    # Jina la mazingira (linotumika katika utoaji majina wa rasilimali)
AZURE_LOCATION                    # Eneo la uenezaji
AZURE_SUBSCRIPTION_ID             # Usajili lengwa
AZURE_RESOURCE_GROUP              # Jina la kundi la rasilimali
AZURE_PRINCIPAL_ID                # Mtumiaji mwenye mamlaka kwa RBAC

# Majina ya rasilimali (Yataundwa kiotomatiki ikiwa hayataainishwa)
AZURE_AIHUB_NAME                  # Jina la kituo la Microsoft Foundry
AZURE_AIPROJECT_NAME              # Jina la mradi wa AI
AZURE_AISERVICES_NAME             # Jina la akaunti ya huduma za AI
AZURE_STORAGE_ACCOUNT_NAME        # Jina la akaunti ya uhifadhi
AZURE_CONTAINER_REGISTRY_NAME     # Jina la rejista ya kontena
AZURE_KEYVAULT_NAME               # Jina la Hazina ya Vifunguo (ikiwa inatumiwa)
```

### 3.2 Usanidi wa Mfano 
```bash title="" linenums="0"
# Usanidi wa Mfano wa Mazungumzo
AZURE_AI_AGENT_MODEL_NAME         # Chaguo-msingi: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Chaguo-msingi: OpenAI (au Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Chaguo-msingi: toleo la hivi karibuni linalopatikana
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Jina la uanzishaji kwa mfano wa mazungumzo
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Chaguo-msingi: Kawaida
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Chaguo-msingi: 80 (elfu za TPM)

# Usanidi wa Mfano wa Embedding
AZURE_AI_EMBED_MODEL_NAME         # Chaguo-msingi: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Chaguo-msingi: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Chaguo-msingi: toleo la hivi karibuni linalopatikana
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Jina la uanzishaji kwa embeddings
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Chaguo-msingi: Kawaida
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Chaguo-msingi: 50 (elfu za TPM)

# Usanidi wa Wakala
AZURE_AI_AGENT_NAME               # Jina la kuonyesha la wakala
AZURE_EXISTING_AGENT_ID           # Tumia wakala aliye tayari (hiari)
```

### 3.3 Kifungo cha Kipengele
```bash title="" linenums="0"
# Huduma za hiari
USE_APPLICATION_INSIGHTS         # Chaguo-msingi: kweli
USE_AZURE_AI_SEARCH_SERVICE      # Chaguo-msingi: uongo
USE_CONTAINER_REGISTRY           # Chaguo-msingi: kweli

# Ufuatiliaji na Kufuatilia
ENABLE_AZURE_MONITOR_TRACING     # Chaguo-msingi: uongo
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Chaguo-msingi: uongo

# Usanidi wa Utafutaji
AZURE_AI_SEARCH_INDEX_NAME       # Jina la faharisi ya utafutaji
AZURE_SEARCH_SERVICE_NAME        # Jina la huduma ya utafutaji
```

### 3.4 Usanidi wa Mradi wa AI 
```bash title="" linenums="0"
# Tumia Rasilimali Zilizopo
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Kitambulisho kamili cha rasilimali cha mradi wa AI uliopo
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL ya mwisho (endpoint) ya mradi uliopo
```

### 3.5 Angalia Vigezo Vyako

Use the Azure Developer CLI to view and manage your environment variables:

```bash title="" linenums="0"
# Angalia vigezo vyote vya mazingira vya sasa
azd env get-values

# Pata kigezo maalum cha mazingira
azd env get-value AZURE_ENV_NAME

# Weka kigezo cha mazingira
azd env set AZURE_LOCATION eastus

# Weka vigezo vingi kutoka kwa faili .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Tamko la kukataa uwajibikaji**:
Nyaraka hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au zisizokuwa sahihi. Waraka asili kwa lugha yake ya asili unapaswa kuchukuliwa kama chanzo cha kuaminika. Kwa taarifa muhimu, tafsiri ya kitaalamu iliyofanywa na mtafsiri wa kibinadamu inashauriwa. Hatutoa dhamana kwa kutoelewana au tafsiri potofu zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->