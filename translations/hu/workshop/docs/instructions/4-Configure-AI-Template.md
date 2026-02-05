# 4. Sablon konfigurálása

!!! tip "A MODUL VÉGÉRE KÉPES LESZEL"

    - [ ] Megérteni az `azure.yaml` célját
    - [ ] Megérteni az `azure.yaml` felépítését
    - [ ] Megérteni az azd életciklus `hooks` értékét
    - [ ] **3. gyakorlat:** 

---

!!! prompt "Mit csinál az `azure.yaml` fájl? Használj kódfedést, és magyarázd el soronként!"

      Az `azure.yaml` fájl az **Azure Developer CLI (azd)** konfigurációs fájlja. Meghatározza, hogyan kell az alkalmazást telepíteni az Azure-ra, beleértve az infrastruktúrát, szolgáltatásokat, telepítési horgokat és környezeti változókat.

---

## 1. Cél és funkció

Az `azure.yaml` fájl az AI ügynök alkalmazás **telepítési tervrajzaként** szolgál, amely:

1. **Érvényesíti a környezetet** a telepítés előtt
2. **Azure AI szolgáltatásokat biztosít** (AI Hub, AI Project, Search stb.)
3. **Python alkalmazást telepít** az Azure Container Apps-re
4. **AI modelleket konfigurál** csevegési és beágyazási funkciókhoz
5. **Felügyeletet és nyomkövetést állít be** az AI alkalmazáshoz
6. **Új és meglévő** Azure AI projekt forgatókönyveket kezel

A fájl lehetővé teszi az **egyparancsos telepítést** (`azd up`) egy teljes AI ügynök megoldás megfelelő érvényesítésével, biztosításával és utólagos konfigurációjával.

??? info "Kibontás megtekintéshez: `azure.yaml`"

      Az `azure.yaml` fájl meghatározza, hogyan kell az Azure Developer CLI-nek telepíteni és kezelni ezt az AI ügynök alkalmazást az Azure-ban. Nézzük meg soronként.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: szükségünk van horgokra? 
      # TODO: szükségünk van az összes változóra?

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

## 2. A fájl elemzése

Nézzük át a fájlt szakaszonként, hogy megértsük, mit csinál - és miért.

### 2.1 **Fejléc és séma (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **1. sor**: YAML nyelvi szerver séma érvényesítést biztosít IDE támogatáshoz és IntelliSense-hez

### 2.2 Projekt metaadatok (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **5. sor**: Meghatározza a projekt nevét, amelyet az Azure Developer CLI használ
- **6-7. sor**: Megadja, hogy ez egy 1.0.2 verziójú sablonon alapul
- **8-9. sor**: Az Azure Developer CLI 1.14.0 vagy újabb verzióját igényli

### 2.3 Telepítési horgok (11-40)

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

- **11-20. sor**: **Előtelepítési horog** - a `azd up` előtt fut

      - Unix/Linux rendszeren: Végrehajthatóvá teszi az érvényesítési szkriptet, majd futtatja
      - Windows rendszeren: PowerShell érvényesítési szkriptet futtat
      - Mindkettő interaktív, és megállítja a telepítést, ha hibát talál

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
- **21-30. sor**: **Utólagos biztosítási horog** - az Azure erőforrások létrehozása után fut

  - Környezeti változókat író szkripteket hajt végre
  - Folytatja a telepítést, még akkor is, ha ezek a szkriptek hibát találnak (`continueOnError: true`)

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
- **31-40. sor**: **Utólagos telepítési horog** - az alkalmazás telepítése után fut

  - Végrehajtja a végső beállítási szkripteket
  - Folytatja, még akkor is, ha a szkriptek hibát találnak

### 2.4 Szolgáltatás konfiguráció (41-48)

Ez konfigurálja az alkalmazás szolgáltatást, amelyet telepíteni szeretnél.

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

- **42. sor**: Meghatároz egy "api_and_frontend" nevű szolgáltatást
- **43. sor**: A `./src` könyvtárra mutat a forráskódhoz
- **44. sor**: Python-t ad meg programozási nyelvként
- **45. sor**: Az Azure Container Apps-t használja hosztolási platformként
- **46-48. sor**: Docker konfiguráció

      - Az "api_and_frontend" nevet használja képként
      - Távolról építi a Docker képet az Azure-ban (nem helyben)

### 2.5 Pipeline változók (49-76)

Ezek a változók segítenek az `azd` futtatásában CI/CD pipeline-okban automatizálás céljából.

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

Ez a szakasz meghatározza a telepítés során használt környezeti változókat, kategóriák szerint csoportosítva:

- **Azure erőforrás nevek (51-60. sor)**:
      - Alapvető Azure szolgáltatás erőforrásnevek, pl. Resource Group, AI Hub, AI Project stb.- 
- **Funkciókapcsolók (61-63. sor)**:
      - Logikai változók bizonyos Azure szolgáltatások engedélyezéséhez/letiltásához
- **AI ügynök konfiguráció (64-71. sor)**:
      - Fő AI ügynök konfigurációja, beleértve a nevet, azonosítót, telepítési beállításokat, modell részleteket- 
- **AI beágyazási konfiguráció (72-79. sor)**:
      - A vektorkereséshez használt beágyazási modell konfigurációja
- **Keresés és felügyelet (80-84. sor)**:
      - Keresési index neve, meglévő erőforrás azonosítók és felügyeleti/nyomkövetési beállítások

---

## 3. Környezeti változók ismerete
Az alábbi környezeti változók szabályozzák a telepítés konfigurációját és működését, elsődleges céljuk szerint csoportosítva. A legtöbb változónak van ésszerű alapértelmezett értéke, de testre szabhatod őket, hogy megfeleljenek az egyedi igényeidnek vagy meglévő Azure erőforrásaidnak.

### 3.1 Kötelező változók 

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

### 3.2 Modell konfiguráció 
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

### 3.3 Funkciókapcsolók
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

### 3.4 AI projekt konfiguráció 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Ellenőrizd a változóidat

Használd az Azure Developer CLI-t a környezeti változók megtekintéséhez és kezeléséhez:

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

