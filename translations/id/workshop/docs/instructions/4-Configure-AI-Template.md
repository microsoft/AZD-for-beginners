# 4. Konfigurasi Template

!!! tip "SETELAH SELESAI MODUL INI, ANDA AKAN MAMPU"

    - [ ] Memahami tujuan dari `azure.yaml`
    - [ ] Memahami struktur dari `azure.yaml`
    - [ ] Memahami nilai dari `hooks` dalam siklus hidup azd
    - [ ] **Lab 3:** 

---

!!! prompt "Apa fungsi file `azure.yaml`? Gunakan codefence dan jelaskan baris demi baris"

      File `azure.yaml` adalah **file konfigurasi untuk Azure Developer CLI (azd)**. File ini mendefinisikan bagaimana aplikasi Anda harus diterapkan ke Azure, termasuk infrastruktur, layanan, hooks untuk deployment, dan variabel lingkungan.

---

## 1. Tujuan dan Fungsionalitas

File `azure.yaml` ini berfungsi sebagai **panduan penerapan** untuk aplikasi agen AI yang:

1. **Memvalidasi lingkungan** sebelum penerapan
2. **Menyediakan layanan Azure AI** (AI Hub, AI Project, Search, dll.)
3. **Menerapkan aplikasi Python** ke Azure Container Apps
4. **Mengonfigurasi model AI** untuk fungsi chat dan embedding
5. **Menyiapkan pemantauan dan pelacakan** untuk aplikasi AI
6. **Menangani skenario proyek Azure AI** baik yang baru maupun yang sudah ada

File ini memungkinkan **penerapan dengan satu perintah** (`azd up`) untuk solusi agen AI lengkap dengan validasi yang tepat, penyediaan, dan konfigurasi pasca-penerapan.

??? info "Klik untuk Melihat: `azure.yaml`"

      File `azure.yaml` mendefinisikan bagaimana Azure Developer CLI harus menerapkan dan mengelola aplikasi Agen AI ini di Azure. Mari kita uraikan baris demi baris.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: apakah kita membutuhkan hooks? 
      # TODO: apakah kita membutuhkan semua variabel?

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

## 2. Menguraikan File

Mari kita bahas file ini bagian demi bagian untuk memahami apa yang dilakukan - dan mengapa.

### 2.1 **Header dan Skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Baris 1**: Memberikan validasi skema server bahasa YAML untuk dukungan IDE dan IntelliSense

### 2.2 Metadata Proyek (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Baris 5**: Mendefinisikan nama proyek yang digunakan oleh Azure Developer CLI
- **Baris 6-7**: Menentukan bahwa ini berdasarkan template versi 1.0.2
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

      - Di Unix/Linux: Membuat skrip validasi dapat dieksekusi dan menjalankannya
      - Di Windows: Menjalankan skrip validasi PowerShell
      - Keduanya bersifat interaktif dan akan menghentikan penerapan jika gagal

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
- **Baris 21-30**: **Hook pasca-penyediaan** - dijalankan setelah sumber daya Azure dibuat

  - Menjalankan skrip penulisan variabel lingkungan
  - Melanjutkan penerapan meskipun skrip ini gagal (`continueOnError: true`)

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
- **Baris 31-40**: **Hook pasca-penerapan** - dijalankan setelah aplikasi diterapkan

  - Menjalankan skrip pengaturan akhir
  - Tetap melanjutkan meskipun skrip gagal

### 2.4 Konfigurasi Layanan (41-48)

Bagian ini mengonfigurasi layanan aplikasi yang Anda terapkan.

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

- **Baris 42**: Mendefinisikan layanan bernama "api_and_frontend"
- **Baris 43**: Mengarah ke direktori `./src` untuk kode sumber
- **Baris 44**: Menentukan Python sebagai bahasa pemrograman
- **Baris 45**: Menggunakan Azure Container Apps sebagai platform hosting
- **Baris 46-48**: Konfigurasi Docker

      - Menggunakan "api_and_frontend" sebagai nama gambar
      - Membangun gambar Docker secara remote di Azure (bukan lokal)

### 2.5 Variabel Pipeline (49-76)

Ini adalah variabel untuk membantu Anda menjalankan `azd` dalam pipeline CI/CD untuk otomatisasi

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

Bagian ini mendefinisikan variabel lingkungan yang digunakan **selama penerapan**, diorganisasikan berdasarkan kategori:

- **Nama Sumber Daya Azure (Baris 51-60)**:
      - Nama sumber daya layanan inti Azure seperti Resource Group, AI Hub, AI Project, dll.- 
- **Feature Flags (Baris 61-63)**:
      - Variabel boolean untuk mengaktifkan/menonaktifkan layanan Azure tertentu
- **Konfigurasi Agen AI (Baris 64-71)**:
      - Konfigurasi untuk agen AI utama termasuk nama, ID, pengaturan penerapan, detail model- 
- **Konfigurasi Embedding AI (Baris 72-79)**:
      - Konfigurasi untuk model embedding yang digunakan untuk pencarian vektor
- **Pencarian dan Pemantauan (Baris 80-84)**:
      - Nama indeks pencarian, ID sumber daya yang ada, dan pengaturan pemantauan/pelacakan

---

## 3. Mengenal Variabel Lingkungan
Variabel lingkungan berikut mengontrol konfigurasi dan perilaku penerapan Anda, diorganisasikan berdasarkan tujuan utamanya. Sebagian besar variabel memiliki nilai default yang masuk akal, tetapi Anda dapat menyesuaikannya agar sesuai dengan kebutuhan spesifik Anda atau sumber daya Azure yang ada.

### 3.1 Variabel yang Diperlukan 

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

### 3.3 Pengaturan Fitur
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

### 3.4 Konfigurasi Proyek AI 
```bash title="" linenums="0"
# Use Existing Resources
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # Full resource ID of existing AI project
AZURE_EXISTING_AIPROJECT_ENDPOINT       # Endpoint URL of existing project
```

### 3.5 Periksa Variabel Anda

Gunakan Azure Developer CLI untuk melihat dan mengelola variabel lingkungan Anda:

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

