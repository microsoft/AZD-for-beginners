# 4. Konfigurasikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Memahami tujuan `azure.yaml`
    - [ ] Memahami struktur `azure.yaml`
    - [ ] Memahami nilai `hooks` kitar hayat azd
    - [ ] **Makmal 4:** Terokai dan ubah suai pembolehubah persekitaran

---

!!! prompt "Apakah fungsi fail `azure.yaml`? Gunakan codefence dan terangkan baris demi baris"

      Fail `azure.yaml` ialah **fail konfigurasi untuk Azure Developer CLI (azd)**. Ia mentakrifkan bagaimana aplikasi anda harus dideploy ke Azure, termasuk infrastruktur, perkhidmatan, hook deployment, dan pembolehubah persekitaran.

---

## 1. Tujuan dan Fungsi

Fail `azure.yaml` ini berfungsi sebagai **cetak biru deployment** untuk aplikasi ejen AI yang:

1. **Memastikan persekitaran** sebelum deployment
2. **Menyediakan perkhidmatan Azure AI** (AI Hub, AI Project, Search, dll.)
3. **Mendeploy aplikasi Python** ke Azure Container Apps
4. **Mengkonfigurasi model AI** untuk fungsi chat dan embedding
5. **Menyediakan pemantauan dan penjejakan** untuk aplikasi AI
6. **Mengendalikan situasi projek Azure AI baru dan sedia ada**

Fail ini membolehkan **deployment satu arahan** (`azd up`) bagi penyelesaian ejen AI lengkap dengan pengesahan, penyediaan, dan konfigurasi selepas deployment yang betul.

??? info "Kembangkan Untuk Lihat: `azure.yaml`"

      Fail `azure.yaml` mentakrifkan bagaimana Azure Developer CLI harus mendeploy dan mengurus aplikasi Ejen AI ini dalam Azure. Mari kita huraikan baris demi baris.

      ```yaml title="" linenums="0"

      # yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
      # TODO: adakah kita perlukan hooks? 
      # TODO: adakah kita perlukan semua pembolehubah ini?

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

Mari kita lalui bahagian fail ini satu persatu, untuk memahami fungsinya - dan sebabnya.

### 2.1 **Header dan Skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Baris 1**: Menyediakan skema pengesahan YAML language server untuk sokongan IDE dan IntelliSense

### 2.2 Metadata Projek (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Baris 5**: Mentakrifkan nama projek yang digunakan oleh Azure Developer CLI
- **Baris 6-7**: Menyatakan ini berdasarkan template versi 1.0.2
- **Baris 8-9**: Memerlukan versi Azure Developer CLI 1.14.0 atau lebih tinggi

### 2.3 Hooks Deploy (11-40)

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

- **Baris 11-20**: **Hook pra-deployment** - dijalankan sebelum `azd up`

      - Pada Unix/Linux: Jadikan skrip pengesahan boleh dijalankan dan jalankan ia
      - Pada Windows: Jalankan skrip PowerShell pengesahan
      - Kedua-duanya interaktif dan akan menghentikan deployment jika gagal

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

  - Melaksanakan skrip menulis pembolehubah persekitaran
  - Teruskan deployment walaupun skrip ini gagal (`continueOnError: true`)

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
- **Baris 31-40**: **Hook selepas deployment** - dijalankan selepas aplikasi ditempatkan

  - Melaksanakan skrip penyediaan akhir
  - Teruskan walaupun skrip gagal

### 2.4 Konfigurasi Perkhidmatan (41-48)

Ini mengkonfigurasi perkhidmatan aplikasi yang anda deploy.

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

- **Baris 42**: Mentakrifkan perkhidmatan bernama "api_and_frontend"
- **Baris 43**: Menunjuk ke direktori `./src` untuk kod sumber
- **Baris 44**: Menyatakan Python sebagai bahasa pengaturcaraan
- **Baris 45**: Menggunakan Azure Container Apps sebagai platform hosting
- **Baris 46-48**: Konfigurasi Docker

      - Menggunakan "api_and_frontend" sebagai nama imej
      - Membina imej Docker secara jauh dalam Azure (bukan secara lokal)

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

Bahagian ini mentakrifkan pembolehubah persekitaran yang digunakan **semasa deployment**, disusun mengikut kategori:

- **Nama Sumber Azure (Baris 51-60)**:
      - Nama sumber perkhidmatan Azure teras seperti Kumpulan Sumber, AI Hub, AI Project, dll.- 
- **Bendera Ciri (Baris 61-63)**:
      - Pembolehubah boolean untuk menghidupkan/mematikan perkhidmatan Azure tertentu
- **Konfigurasi Ejen AI (Baris 64-71)**:
      - Konfigurasi untuk ejen AI utama termasuk nama, ID, tetapan deployment, butiran model- 
- **Konfigurasi Embedding AI (Baris 72-79)**:
      - Konfigurasi untuk model embedding yang digunakan untuk carian vektor
- **Carian dan Pemantauan (Baris 80-84)**:
      - Nama indeks carian, ID sumber sedia ada, dan tetapan pemantauan/penjejakan

---

## 3. Mengenal Pembolehubah Persekitaran
Pembolehubah persekitaran berikut mengawal konfigurasi dan tingkah laku deployment anda, disusun mengikut tujuan utamanya. Kebanyakan pembolehubah mempunyai nilai lalai yang munasabah, tetapi anda boleh menyesuaikannya mengikut keperluan khusus anda atau sumber Azure sedia ada.

### 3.1 Pembolehubah Diperlukan 

```bash title="" linenums="0"
# Konfigurasi Teras Azure
AZURE_ENV_NAME                    # Nama persekitaran (digunakan dalam penamaan sumber)
AZURE_LOCATION                    # Wilayah penyebaran
AZURE_SUBSCRIPTION_ID             # Langganan sasaran
AZURE_RESOURCE_GROUP              # Nama kumpulan sumber
AZURE_PRINCIPAL_ID                # Prinsipal pengguna untuk RBAC

# Nama Sumber (Dihasilkan secara automatik jika tidak dinyatakan)
AZURE_AIHUB_NAME                  # Nama hub Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nama projek AI
AZURE_AISERVICES_NAME             # Nama akaun perkhidmatan AI
AZURE_STORAGE_ACCOUNT_NAME        # Nama akaun storan
AZURE_CONTAINER_REGISTRY_NAME     # Nama registry bekas
AZURE_KEYVAULT_NAME               # Nama Key Vault (jika digunakan)
```

### 3.2 Konfigurasi Model 
```bash title="" linenums="0"
# Konfigurasi Model Sembang
AZURE_AI_AGENT_MODEL_NAME         # Lalai: gpt-4o-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Lalai: OpenAI (atau Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Lalai: terkini tersedia
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nama penempatan untuk model sembang
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Lalai: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Lalai: 80 (ribu TPM)

# Konfigurasi Model Penanaman
AZURE_AI_EMBED_MODEL_NAME         # Lalai: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Lalai: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Lalai: terkini tersedia
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nama penempatan untuk penanaman
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Lalai: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Lalai: 50 (ribu TPM)

# Konfigurasi Ejen
AZURE_AI_AGENT_NAME               # Nama paparan ejen
AZURE_EXISTING_AGENT_ID           # Gunakan ejen sedia ada (pilihan)
```

### 3.3 Togol Ciri
```bash title="" linenums="0"
# Perkhidmatan Pilihan
USE_APPLICATION_INSIGHTS         # Lalai: benar
USE_AZURE_AI_SEARCH_SERVICE      # Lalai: salah
USE_CONTAINER_REGISTRY           # Lalai: benar

# Pemantauan dan Penjejakan
ENABLE_AZURE_MONITOR_TRACING     # Lalai: salah
AZURE_TRACING_GEN_AI_CONTENT_RECORDING_ENABLED # Lalai: salah

# Konfigurasi Carian
AZURE_AI_SEARCH_INDEX_NAME       # Nama indeks carian
AZURE_SEARCH_SERVICE_NAME        # Nama perkhidmatan carian
```

### 3.4 Konfigurasi Projek AI 
```bash title="" linenums="0"
# Gunakan Sumber Sedia Ada
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID sumber penuh bagi projek AI sedia ada
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL titik akhir bagi projek sedia ada
```

### 3.5 Semak Pembolehubah Anda

Gunakan Azure Developer CLI untuk melihat dan mengurus pembolehubah persekitaran anda:

```bash title="" linenums="0"
# Lihat semua pemboleh ubah persekitaran untuk persekitaran semasa
azd env get-values

# Dapatkan pemboleh ubah persekitaran tertentu
azd env get-value AZURE_ENV_NAME

# Tetapkan pemboleh ubah persekitaran
azd env set AZURE_LOCATION eastus

# Tetapkan beberapa pemboleh ubah dari fail .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->