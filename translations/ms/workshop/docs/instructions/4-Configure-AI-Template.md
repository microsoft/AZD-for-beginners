<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b4a16f82d68f5820d574acd8946843e4",
  "translation_date": "2025-09-24T23:40:42+00:00",
  "source_file": "workshop/docs/instructions/4-Configure-AI-Template.md",
  "language_code": "ms"
}
-->
# 4. Konfigurasi Template

!!! tip "MENJELANG AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Memahami tujuan `azure.yaml`
    - [ ] Memahami struktur `azure.yaml`
    - [ ] Memahami nilai `hooks` dalam kitaran hayat azd
    - [ ] **Lab 3:** 

---

!!! prompt "Apakah fungsi fail `azure.yaml`? Gunakan codefence dan terangkan baris demi baris"

      Fail `azure.yaml` adalah **fail konfigurasi untuk Azure Developer CLI (azd)**. Ia menentukan bagaimana aplikasi anda harus diterapkan ke Azure, termasuk infrastruktur, perkhidmatan, hooks penerapan, dan pembolehubah persekitaran.

---

## 1. Tujuan dan Fungsi

Fail `azure.yaml` ini berfungsi sebagai **pelan penerapan** untuk aplikasi ejen AI yang:

1. **Mengesahkan persekitaran** sebelum penerapan
2. **Menyediakan perkhidmatan Azure AI** (AI Hub, AI Project, Search, dll.)
3. **Menerapkan aplikasi Python** ke Azure Container Apps
4. **Mengkonfigurasi model AI** untuk fungsi chat dan embedding
5. **Menetapkan pemantauan dan penjejakan** untuk aplikasi AI
6. **Menguruskan senario projek AI Azure** yang baru dan sedia ada

Fail ini membolehkan **penerapan satu perintah** (`azd up`) untuk penyelesaian ejen AI lengkap dengan pengesahan, penyediaan, dan konfigurasi selepas penerapan yang betul.

??? info "Klik Untuk Lihat: `azure.yaml`"

      Fail `azure.yaml` menentukan bagaimana Azure Developer CLI harus menerapkan dan menguruskan aplikasi Ejen AI ini di Azure. Mari kita pecahkan baris demi baris.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: adakah kita memerlukan hooks? 
      # TODO: adakah kita memerlukan semua pembolehubah?

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

## 2. Memecahkan Fail

Mari kita lalui fail ini bahagian demi bahagian, untuk memahami apa yang ia lakukan - dan mengapa.

### 2.1 **Header dan Skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Baris 1**: Memberikan validasi skema pelayan bahasa YAML untuk sokongan IDE dan IntelliSense

### 2.2 Metadata Projek (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Baris 5**: Menentukan nama projek yang digunakan oleh Azure Developer CLI
- **Baris 6-7**: Menyatakan bahawa ini berdasarkan versi template 1.0.2
- **Baris 8-9**: Memerlukan versi Azure Developer CLI 1.14.0 atau lebih tinggi

### 2.3 Hooks Penerapan (11-40)

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

- **Baris 11-20**: **Hook pra-penerapan** - dijalankan sebelum `azd up`

      - Pada Unix/Linux: Menjadikan skrip validasi boleh dilaksanakan dan menjalankannya
      - Pada Windows: Menjalankan skrip validasi PowerShell
      - Kedua-duanya interaktif dan akan menghentikan penerapan jika gagal

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
- **Baris 21-30**: **Hook selepas penyediaan** - dijalankan selepas sumber Azure dibuat

  - Menjalankan skrip penulisan pembolehubah persekitaran
  - Meneruskan penerapan walaupun skrip ini gagal (`continueOnError: true`)

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
- **Baris 31-40**: **Hook selepas penerapan** - dijalankan selepas penerapan aplikasi

  - Menjalankan skrip penyediaan akhir
  - Meneruskan walaupun skrip gagal

### 2.4 Konfigurasi Perkhidmatan (41-48)

Ini mengkonfigurasi perkhidmatan aplikasi yang anda terapkan.

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

- **Baris 42**: Menentukan perkhidmatan bernama "api_and_frontend"
- **Baris 43**: Menunjuk ke direktori `./src` untuk kod sumber
- **Baris 44**: Menentukan Python sebagai bahasa pengaturcaraan
- **Baris 45**: Menggunakan Azure Container Apps sebagai platform hosting
- **Baris 46-48**: Konfigurasi Docker

      - Menggunakan "api_and_frontend" sebagai nama imej
      - Membina imej Docker secara jauh di Azure (bukan secara tempatan)

### 2.5 Pembolehubah Pipeline (49-76)

Ini adalah pembolehubah untuk membantu anda menjalankan `azd` dalam pipeline CI/CD untuk automasi

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

Bahagian ini menentukan pembolehubah persekitaran yang digunakan **semasa penerapan**, disusun mengikut kategori:

- **Nama Sumber Azure (Baris 51-60)**:
      - Nama sumber perkhidmatan Azure teras seperti Resource Group, AI Hub, AI Project, dll.- 
- **Feature Flags (Baris 61-63)**:
      - Pembolehubah boolean untuk mengaktifkan/mematikan perkhidmatan Azure tertentu
- **Konfigurasi Ejen AI (Baris 64-71)**:
      - Konfigurasi untuk ejen AI utama termasuk nama, ID, tetapan penerapan, butiran model- 
- **Konfigurasi Embedding AI (Baris 72-79)**:
      - Konfigurasi untuk model embedding yang digunakan untuk carian vektor
- **Carian dan Pemantauan (Baris 80-84)**:
      - Nama indeks carian, ID sumber sedia ada, dan tetapan pemantauan/penjejakan

---

## 3. Ketahui Pembolehubah Persekitaran
Pembolehubah persekitaran berikut mengawal konfigurasi dan tingkah laku penerapan anda, disusun mengikut tujuan utama mereka. Kebanyakan pembolehubah mempunyai nilai lalai yang munasabah, tetapi anda boleh menyesuaikannya untuk memenuhi keperluan khusus anda atau sumber Azure sedia ada.

### 3.1 Pembolehubah Diperlukan 

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

### 3.2 Konfigurasi Model 
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

### 3.3 Togol Ciri
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

### 3.4 Konfigurasi Projek AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Semak Pembolehubah Anda

Gunakan Azure Developer CLI untuk melihat dan menguruskan pembolehubah persekitaran anda:

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

