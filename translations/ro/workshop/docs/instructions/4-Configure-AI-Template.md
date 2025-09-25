<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-25T02:03:53+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "ro"
}
-->
# 4. Configurarea unui Șablon

!!! tip "LA SFÂRȘITUL ACESTUI MODUL VEI FI CAPABIL SĂ"

    - [ ] Înțelegi scopul fișierului `azure.yaml`
    - [ ] Înțelegi structura fișierului `azure.yaml`
    - [ ] Înțelegi valoarea `hooks` din ciclul de viață azd
    - [ ] **Laborator 3:** 

---

!!! prompt "Ce face fișierul `azure.yaml`? Folosește un bloc de cod și explică-l linie cu linie"

      Fișierul `azure.yaml` este **fișierul de configurare pentru Azure Developer CLI (azd)**. Acesta definește modul în care aplicația ta ar trebui să fie implementată în Azure, incluzând infrastructura, serviciile, hook-urile de implementare și variabilele de mediu.

---

## 1. Scop și Funcționalitate

Fișierul `azure.yaml` servește drept **plan de implementare** pentru o aplicație agent AI care:

1. **Validează mediul** înainte de implementare
2. **Provoacă servicii Azure AI** (AI Hub, AI Project, Search etc.)
3. **Implementează o aplicație Python** în Azure Container Apps
4. **Configurează modele AI** pentru funcționalități de chat și embedding
5. **Setează monitorizarea și trasabilitatea** pentru aplicația AI
6. **Gestionează atât scenarii noi cât și existente** pentru proiectele Azure AI

Fișierul permite **implementarea cu o singură comandă** (`azd up`) a unei soluții complete de agent AI, cu validare corespunzătoare, provizionare și configurare post-implementare.

??? info "Extinde pentru a vizualiza: `azure.yaml`"

      Fișierul `azure.yaml` definește modul în care Azure Developer CLI ar trebui să implementeze și să gestioneze această aplicație agent AI în Azure. Să-l analizăm linie cu linie.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: avem nevoie de hooks? 
      # TODO: avem nevoie de toate variabilele?

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

## 2. Deconstruirea Fișierului

Să parcurgem fișierul secțiune cu secțiune, pentru a înțelege ce face - și de ce.

### 2.1 **Header și Schema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Linia 1**: Oferă validare schema YAML pentru suport IDE și IntelliSense

### 2.2 Metadata Proiectului (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Linia 5**: Definește numele proiectului utilizat de Azure Developer CLI
- **Liniile 6-7**: Specifică faptul că se bazează pe o versiune de șablon 1.0.2
- **Liniile 8-9**: Necesită versiunea 1.14.0 sau mai mare a Azure Developer CLI

### 2.3 Hook-uri de Implementare (11-40)

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

- **Liniile 11-20**: **Hook pre-implementare** - rulează înainte de `azd up`

      - Pe Unix/Linux: Face scriptul de validare executabil și îl rulează
      - Pe Windows: Rulează scriptul de validare PowerShell
      - Ambele sunt interactive și vor opri implementarea dacă eșuează

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
- **Liniile 21-30**: **Hook post-provizionare** - rulează după ce resursele Azure sunt create

  - Rulează scripturi pentru scrierea variabilelor de mediu
  - Continuă implementarea chiar dacă aceste scripturi eșuează (`continueOnError: true`)

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
- **Liniile 31-40**: **Hook post-implementare** - rulează după implementarea aplicației

  - Rulează scripturi finale de configurare
  - Continuă chiar dacă scripturile eșuează

### 2.4 Configurarea Serviciului (41-48)

Aceasta configurează serviciul aplicației pe care îl implementezi.

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

- **Linia 42**: Definește un serviciu numit "api_and_frontend"
- **Linia 43**: Indică directorul `./src` pentru codul sursă
- **Linia 44**: Specifică Python ca limbaj de programare
- **Linia 45**: Utilizează Azure Container Apps ca platformă de găzduire
- **Liniile 46-48**: Configurare Docker

      - Utilizează "api_and_frontend" ca nume al imaginii
      - Construiește imaginea Docker de la distanță în Azure (nu local)

### 2.5 Variabile Pipeline (49-76)

Acestea sunt variabile care te ajută să rulezi `azd` în pipeline-uri CI/CD pentru automatizare

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

Această secțiune definește variabilele de mediu utilizate **în timpul implementării**, organizate pe categorii:

- **Nume Resurse Azure (Liniile 51-60)**:
      - Nume ale serviciilor de bază Azure, ex. Resource Group, AI Hub, AI Project etc.- 
- **Flag-uri Funcționalitate (Liniile 61-63)**:
      - Variabile booleene pentru activarea/dezactivarea anumitor servicii Azure
- **Configurație Agent AI (Liniile 64-71)**:
      - Configurație pentru agentul AI principal, incluzând nume, ID, setări de implementare, detalii model- 
- **Configurație Embedding AI (Liniile 72-79)**:
      - Configurație pentru modelul de embedding utilizat pentru căutarea vectorială
- **Căutare și Monitorizare (Liniile 80-84)**:
      - Nume index de căutare, ID-uri resurse existente și setări de monitorizare/trasabilitate

---

## 3. Cunoaște Variabilele de Mediu
Următoarele variabile de mediu controlează configurația și comportamentul implementării tale, organizate după scopul lor principal. Majoritatea variabilelor au valori implicite rezonabile, dar le poți personaliza pentru a se potrivi cerințelor tale specifice sau resurselor Azure existente.

### 3.1 Variabile Necesare 

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

### 3.2 Configurație Model 
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

### 3.3 Activare Funcționalități
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

### 3.4 Configurație Proiect AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Verifică Variabilele Tale

Folosește Azure Developer CLI pentru a vizualiza și gestiona variabilele de mediu:

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

