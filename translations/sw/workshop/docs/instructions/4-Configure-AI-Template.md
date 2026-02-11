# 4. Sanidi Kiolezo

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Kuelewa kusudi la `azure.yaml`
    - [ ] Kuelewa muundo wa `azure.yaml`
    - [ ] Kuelewa thamani ya azd lifecycle `hooks`
    - [ ] **Lab 4:** Chunguza na ubadilishe vigezo vya mazingira

---

!!! prompt "What is the `azure.yaml` file do? Use a codefence and explain it line by line"

      The `azure.yaml` file is the **configuration file for Azure Developer CLI (azd)**. It defines how your application should be deployed to Azure, including infrastructure, services, deployment hooks, and environment variables.

---

## 1. Purpose and Functionality

This `azure.yaml` file serves as the **deployment blueprint** for an AI agent application that:

1. **Huthibitisha mazingira** kabla ya utoaji
2. **Inatayarisha huduma za AI za Azure** (AI Hub, AI Project, Search, n.k.)
3. **Inapeleka programu ya Python** kwenye Azure Container Apps
4. **Inasanidi modeli za AI** kwa ajili ya mazungumzo na embedding
5. **Inaanzisha ufuatiliaji na tracing** kwa ajili ya programu ya AI
6. **Inashughulikia kesi za miradi ya Azure AI mpya na iliyopo**

The file enables **one-command deployment** (`azd up`) of a complete AI agent solution with proper validation, provisioning, and post-deployment configuration.

??? info "Expand To View: `azure.yaml`"

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

### 2.1 **Kichwa na Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Mstari 1**: Hutoa uthibitishaji wa schema wa language server wa YAML kwa msaada wa IDE na IntelliSense

### 2.2 Metadata ya Mradi (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Mstari 5**: Inaeleza jina la mradi linalotumika na Azure Developer CLI
- **Mistari 6-7**: Inaonyesha kuwa hii inategemea kiolezo toleo 1.0.2
- **Mistari 8-9**: Inahitaji Azure Developer CLI toleo 1.14.0 au juu zaidi

### 2.3 Hooks za Utoaji (11-40)

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

- **Mistari 11-20**: **Pre-deployment hook** - hufanya kazi kabla ya `azd up`

      - Kwa Unix/Linux: Inafanya script ya uthibitisho iwe na ruhusa za utekelezaji na kuikimbia
      - Kwa Windows: Inakimbia script ya uthibitisho ya PowerShell
      - Zote zina mwingiliano na zitasimamisha utoaji ikiwa zitatokomeza makosa

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
- **Mistari 21-30**: **Post-provision hook** - hufanya kazi baada ya rasilimali za Azure kuundwa

  - Inatekeleza script za kuandika vigezo vya mazingira
  - Inaendelea na utoaji hata kama script hizi zitashindwa (`continueOnError: true`)

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
- **Mistari 31-40**: **Post-deploy hook** - hufanya kazi baada ya utoaji wa programu

  - Inatekeleza script za usanidi wa mwisho
  - Inaendelea hata kama script zitashindwa

### 2.4 Mipangilio ya Huduma (41-48)

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

- **Mstari 42**: Inaeleza huduma yenye jina "api_and_frontend"
- **Mstari 43**: Inaelekeza kwenye saraka `./src` kwa ajili ya msimbo wa chanzo
- **Mstari 44**: Inaonyesha Python kama lugha ya programu
- **Mstari 45**: Inatumia Azure Container Apps kama jukwaa la kuhudumia
- **Mistari 46-48**: Mipangilio ya Docker

      - Inatumia "api_and_frontend" kama jina la picha
      - Inajenga picha ya Docker kwa mbali kwenye Azure (si kwa kompyuta ya mahali)

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
      - Majina ya rasilimali za msingi za Azure, kwa mfano Group ya Rasilimali, AI Hub, AI Project, n.k.
- **Feature Flags (Lines 61-63)**:
      - Vigezo vya boolean vya kuwasha/kuzima huduma maalum za Azure
- **AI Agent Configuration (Lines 64-71)**:
      - Usanidi kwa ajili ya wakala mkuu wa AI ikijumuisha jina, ID, mipangilio ya utoaji, maelezo ya modeli
- **AI Embedding Configuration (Lines 72-79)**:
      - Usanidi wa modeli ya embedding inayotumika kwa ajili ya utaftaji wa vector
- **Search and Monitoring (Lines 80-84)**:
      - Jina la index ya utafutaji, IDs za rasilimali zilizopo, na vigezo vya ufuatiliaji/tracing

---

## 3. Fahamu Vigezo vya Mazingira
The following environment variables control your deployment's configuration and behavior, organized by their primary purpose. Most variables have sensible defaults, but you can customize them to match your specific requirements or existing Azure resources.

### 3.1 Vigezo Zinazohitajika 

```bash title="" linenums="0"
# Usanidi wa Msingi wa Azure
AZURE_ENV_NAME                    # Jina la mazingira (linotumika katika kuunda majina ya rasilimali)
AZURE_LOCATION                    # Eneo la utekelezaji
AZURE_SUBSCRIPTION_ID             # Usajili lengwa
AZURE_RESOURCE_GROUP              # Jina la kundi la rasilimali
AZURE_PRINCIPAL_ID                # Mwenye sifa wa mtumiaji kwa RBAC

# Majina ya rasilimali (Yataundwa kwa otomatiki ikiwa hayataelezwi)
AZURE_AIHUB_NAME                  # Jina la kituo cha Microsoft Foundry
AZURE_AIPROJECT_NAME              # Jina la mradi wa AI
AZURE_AISERVICES_NAME             # Jina la akaunti ya huduma za AI
AZURE_STORAGE_ACCOUNT_NAME        # Jina la akaunti ya uhifadhi
AZURE_CONTAINER_REGISTRY_NAME     # Jina la rejista ya kontena
AZURE_KEYVAULT_NAME               # Jina la Key Vault (ikiwa linatumika)
```

### 3.2 Usanidi wa Modeli 
```bash title="" linenums="0"
# Mpangilio wa Mfano wa Mazungumzo
AZURE_AI_AGENT_MODEL_NAME         # Chaguo-msingi: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Chaguo-msingi: OpenAI (au Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Chaguo-msingi: toleo la hivi karibuni linalopatikana
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Jina la utekelezaji kwa mfano wa mazungumzo
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Chaguo-msingi: Kawaida
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Chaguo-msingi: 80 (maelfu ya TPM)

# Mpangilio wa Mfano wa Embedding
AZURE_AI_EMBED_MODEL_NAME         # Chaguo-msingi: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Chaguo-msingi: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Chaguo-msingi: toleo la hivi karibuni linalopatikana
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Jina la utekelezaji kwa modeli za embedding
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Chaguo-msingi: Kawaida
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Chaguo-msingi: 50 (maelfu ya TPM)

# Mpangilio wa Wakala
AZURE_AI_AGENT_NAME               # Jina la kuonyesha la wakala
AZURE_EXISTING_AGENT_ID           # Tumia wakala uliopo (hiari)
```

### 3.3 Mswichi wa Kipengele
```bash title="" linenums="0"
# Huduma za Hiari
USE_APPLICATION_INSIGHTS         # Chaguo-msingi: kweli
USE_AZURE_AI_SEARCH_SERVICE      # Chaguo-msingi: uongo
USE_CONTAINER_REGISTRY           # Chaguo-msingi: kweli

# Ufuatiliaji na Upelelezi
ENABLE_AZURE_MONITOR_TRACING     # Chaguo-msingi: uongo
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Chaguo-msingi: uongo

# Usanidi wa Utafutaji
AZURE_AI_SEARCH_INDEX_NAME       # Jina la fahirisi ya utafutaji
AZURE_SEARCH_SERVICE_NAME        # Jina la huduma ya utafutaji
```

### 3.4 Usanidi wa Mradi wa AI 
```bash title="" linenums="0"
# Tumia rasilimali zilizopo
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Kitambulisho kamili cha rasilimali cha mradi wa AI uliopo
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL ya endpoint ya mradi uliopo
```

### 3.5 Kagua Vigezo Vyako

Tumia Azure Developer CLI kuangalia na kusimamia vigezo vyako vya mazingira:

```bash title="" linenums="0"
# Tazama vigezo vya mazingira vyote kwa mazingira ya sasa
azd env get-values

# Pata kigezo maalum cha mazingira
azd env get-value AZURE_ENV_NAME

# Weka kigezo cha mazingira
azd env set AZURE_LOCATION eastus

# Weka vigezo vingi kutoka kwenye faili .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Taarifa ya kutolea dhamana:
Dokumenti hii imetafsiriwa kwa kutumia huduma ya utafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuwa sahihi, tafadhali fahamu kwamba tafsiri za kiotomatiki zinaweza kuwa na makosa au ukosefu wa usahihi. Nakala ya awali ya dokumenti kwa lugha yake ya asili inapaswa kuchukuliwa kama chanzo chenye mamlaka. Kwa taarifa za muhimu, inashauriwa kutafuta utafsiri wa kitaalamu unaofanywa na mtafsiri wa kibinadamu. Hatuwajibiki kwa uelewa mbaya au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->