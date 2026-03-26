# 4. Mengonfigurasi Template

!!! tip "DI AKHIR MODUL INI ANDA AKAN MAMPU"

    - [ ] Memahami tujuan `azure.yaml`
    - [ ] Memahami struktur `azure.yaml`
    - [ ] Memahami nilai azd lifecycle `hooks`
    - [ ] **Lab 4:** Jelajahi dan ubah variabel lingkungan

---

!!! prompt "Apa yang dilakukan file `azure.yaml`? Gunakan codefence dan jelaskan baris demi baris"

      File `azure.yaml` adalah **file konfigurasi untuk Azure Developer CLI (azd)**. Ia menentukan bagaimana aplikasi Anda harus dideploy ke Azure, termasuk infrastruktur, layanan, hook penyebaran, dan variabel lingkungan.

---

## 1. Tujuan dan Fungsionalitas

File `azure.yaml` ini berfungsi sebagai **cetakan penyebaran** untuk aplikasi agen AI yang:

1. **Memvalidasi lingkungan** sebelum penyebaran
2. **Menyediakan layanan Azure AI** (AI Hub, AI Project, Search, dll.)
3. **Menyebarkan aplikasi Python** ke Azure Container Apps
4. **Mengonfigurasi model AI** untuk fungsi obrolan dan embedding
5. **Menyiapkan pemantauan dan pelacakan** untuk aplikasi AI
6. **Menangani skenario proyek Azure AI yang baru maupun yang sudah ada**

File ini memungkinkan **penyebaran dengan satu perintah** (`azd up`) untuk solusi agen AI lengkap dengan pemvalidasian, penyediaan, dan konfigurasi pasca-penyebaran yang tepat.

??? info "Perluas untuk Melihat: `azure.yaml`"

      File `azure.yaml` mendefinisikan bagaimana Azure Developer CLI harus mendeploy dan mengelola aplikasi Agen AI ini di Azure. Mari kita uraikan baris demi baris.

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

## 2. Menguraikan Berkas

Mari kita telaah berkas bagian demi bagian, untuk memahami apa yang dilakukannya - dan mengapa.

### 2.1 **Header dan Skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Baris 1**: Menyediakan validasi skema untuk YAML language server agar mendukung IDE dan IntelliSense

### 2.2 Metadata Proyek (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Baris 5**: Menentukan nama proyek yang digunakan oleh Azure Developer CLI
- **Baris 6-7**: Menyatakan bahwa ini didasarkan pada template versi 1.0.2
- **Baris 8-9**: Memerlukan Azure Developer CLI versi 1.14.0 atau lebih tinggi

### 2.3 Hook Deploy (11-40)

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

- **Baris 11-20**: **Hook pra-penyebaran** - dijalankan sebelum `azd up`

      - Pada Unix/Linux: Membuat skrip validasi dapat dieksekusi dan menjalankannya
      - Pada Windows: Menjalankan skrip validasi PowerShell
      - Keduanya bersifat interaktif dan akan menghentikan penyebaran jika gagal

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
- **Baris 21-30**: **Hook pasca-provisi** - dijalankan setelah sumber daya Azure dibuat

  - Menjalankan skrip penulisan variabel lingkungan
  - Meneruskan penyebaran bahkan jika skrip ini gagal (`continueOnError: true`)

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
- **Baris 31-40**: **Hook pasca-penyebaran** - dijalankan setelah penyebaran aplikasi

  - Menjalankan skrip pengaturan akhir
  - Tetap melanjutkan meskipun skrip gagal

### 2.4 Konfigurasi Layanan (41-48)

Ini mengonfigurasi layanan aplikasi yang Anda sebarkan.

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

      - Menggunakan "api_and_frontend" sebagai nama image
      - Membangun image Docker secara remote di Azure (bukan secara lokal)

### 2.5 Variabel Pipeline (49-76)

Ini adalah variabel untuk membantu Anda menjalankan `azd` di pipeline CI/CD untuk otomatisasi

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

Bagian ini mendefinisikan variabel lingkungan yang digunakan **selama penyebaran**, diatur berdasarkan kategori:

- **Nama Sumber Daya Azure (Baris 51-60)**:
      - Nama sumber daya layanan Azure inti, misalnya Resource Group, AI Hub, AI Project, dll.- 
- **Flag Fitur (Baris 61-63)**:
      - Variabel boolean untuk mengaktifkan/mematikan layanan Azure tertentu
- **Konfigurasi Agen AI (Baris 64-71)**:
      - Konfigurasi untuk agen AI utama termasuk nama, ID, pengaturan penyebaran, detail model- 
- **Konfigurasi Embedding AI (Baris 72-79)**:
      - Konfigurasi untuk model embedding yang digunakan untuk pencarian vektor
- **Pencarian dan Pemantauan (Baris 80-84)**:
      - Nama index pencarian, ID sumber daya yang sudah ada, dan pengaturan pemantauan/pelacakan

---

## 3. Kenali Variabel Lingkungan
Variabel lingkungan berikut mengontrol konfigurasi dan perilaku penyebaran Anda, diatur berdasarkan tujuan utamanya. Sebagian besar variabel memiliki nilai default yang masuk akal, tetapi Anda dapat menyesuaikannya agar sesuai dengan kebutuhan spesifik atau sumber daya Azure yang sudah ada.

### 3.1 Variabel Wajib 

```bash title="" linenums="0"
# Konfigurasi Inti Azure
AZURE_ENV_NAME                    # Nama lingkungan (digunakan dalam penamaan sumber daya)
AZURE_LOCATION                    # Wilayah penyebaran
AZURE_SUBSCRIPTION_ID             # Langganan target
AZURE_RESOURCE_GROUP              # Nama grup sumber daya
AZURE_PRINCIPAL_ID                # Prinsipal pengguna untuk RBAC

# Nama sumber daya (dibuat otomatis jika tidak ditentukan)
AZURE_AIHUB_NAME                  # Nama hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nama proyek AI
AZURE_AISERVICES_NAME             # Nama akun layanan AI
AZURE_STORAGE_ACCOUNT_NAME        # Nama akun penyimpanan
AZURE_CONTAINER_REGISTRY_NAME     # Nama registri container
AZURE_KEYVAULT_NAME               # Nama Key Vault (jika digunakan)
```

### 3.2 Konfigurasi Model 
```bash title="" linenums="0"
# Konfigurasi Model Chat
AZURE_AI_AGENT_MODEL_NAME         # Bawaan: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Bawaan: OpenAI (atau Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Bawaan: terbaru yang tersedia
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nama penyebaran untuk model chat
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Bawaan: Standar
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Bawaan: 80 (ribuan TPM)

# Konfigurasi Model Embedding
AZURE_AI_EMBED_MODEL_NAME         # Bawaan: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Bawaan: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Bawaan: terbaru yang tersedia
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nama penyebaran untuk embedding
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Bawaan: Standar
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Bawaan: 50 (ribuan TPM)

# Konfigurasi Agen
AZURE_AI_AGENT_NAME               # Nama tampilan agen
AZURE_EXISTING_AGENT_ID           # Gunakan agen yang ada (opsional)
```

### 3.3 Toggle Fitur
```bash title="" linenums="0"
# Layanan Opsional
USE_APPLICATION_INSIGHTS         # Bawaan: benar
USE_AZURE_AI_SEARCH_SERVICE      # Bawaan: salah
USE_CONTAINER_REGISTRY           # Bawaan: benar

# Pemantauan dan Pelacakan
ENABLE_AZURE_MONITOR_TRACING     # Bawaan: salah
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Bawaan: salah

# Konfigurasi Pencarian
AZURE_AI_SEARCH_INDEX_NAME       # Nama indeks pencarian
AZURE_SEARCH_SERVICE_NAME        # Nama layanan pencarian
```

### 3.4 Konfigurasi Proyek AI 
```bash title="" linenums="0"
# Gunakan Sumber Daya yang Ada
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID sumber daya lengkap dari proyek AI yang ada
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL endpoint dari proyek yang ada
```

### 3.5 Periksa Variabel Anda

Gunakan Azure Developer CLI untuk melihat dan mengelola variabel lingkungan Anda:

```bash title="" linenums="0"
# Lihat semua variabel lingkungan untuk lingkungan saat ini
azd env get-values

# Dapatkan variabel lingkungan tertentu
azd env get-value AZURE_ENV_NAME

# Setel variabel lingkungan
azd env set AZURE_LOCATION eastus

# Setel beberapa variabel dari file .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha keras agar hasil terjemahan akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->