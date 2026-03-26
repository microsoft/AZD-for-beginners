# 4. Konfigurasikan Templet

!!! tip "PADA AKHIR MODUL INI ANDA AKAN MAMPU"

    - [ ] Fahami tujuan `azure.yaml`
    - [ ] Fahami struktur `azure.yaml`
    - [ ] Fahami nilai azd lifecycle `hooks`
    - [ ] **Lab 4:** Terokai dan ubah suai pemboleh ubah persekitaran

---

!!! prompt "Apakah fungsi fail `azure.yaml`? Gunakan pagar kod dan terangkan baris demi baris"

      Fail `azure.yaml` adalah **fail konfigurasi untuk Azure Developer CLI (azd)**. Ia menentukan bagaimana aplikasi anda harus diterapkan ke Azure, termasuk infrastruktur, perkhidmatan, hook penerapan, dan pemboleh ubah persekitaran.

---

## 1. Tujuan dan Fungsi

Fail `azure.yaml` ini berfungsi sebagai **cetakan biru penerapan** untuk aplikasi agen AI yang:

1. **Mengesahkan persekitaran** sebelum penerapan
2. **Menyediakan perkhidmatan AI Azure** (AI Hub, AI Project, Search, dan lain-lain)
3. **Menerapkan aplikasi Python** ke Azure Container Apps
4. **Mengkonfigurasi model AI** untuk fungsi chat dan embedding
5. **Menyiapkan pemantauan dan penjejakan** untuk aplikasi AI
6. **Mengendalikan senario projek AI Azure baru dan sedia ada**

Fail ini membolehkan **penerapan dengan satu arahan** (`azd up`) untuk penyelesaian agen AI lengkap dengan pengesahan, penyediaan, dan konfigurasi selepas penerapan yang betul.

??? info "Kembangkan Untuk Lihat: `azure.yaml`"

      Fail `azure.yaml` mentakrifkan bagaimana Azure Developer CLI harus menerapkan dan mengurus aplikasi Agen AI ini di Azure. Mari kita huraikan baris demi baris.

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

## 2. Memecah Fail

Mari kita telusuri bahagian demi bahagian fail ini, untuk memahami apa yang ia lakukan - dan mengapa.

### 2.1 **Header dan Skema (1-3)**

```yaml title="" linenums="0"
# yaml-language-server: $schema=https://raw.githubusercontent.com/Azure/azure-dev/main/schemas/v1.0/azure.yaml.json
```

- **Baris 1**: Memberikan validasi skema server bahasa YAML untuk sokongan IDE dan IntelliSense

### 2.2 Metadata Projek (5-10)

```yaml title="" linenums="0"
name: azd-get-started-with-ai-agents
metadata:
  template: azd-get-started-with-ai-agents@1.0.2
requiredVersions:
  azd: ">=1.14.0"
```

- **Baris 5**: Menentukan nama projek yang digunakan oleh Azure Developer CLI
- **Baris 6-7**: Menyatakan ini berdasarkan templat versi 1.0.2
- **Baris 8-9**: Memerlukan versi Azure Developer CLI 1.14.0 atau lebih tinggi

### 2.3 Hook Penerapan (11-40)

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

      - Pada Unix/Linux: Membuat skrip pengesahan boleh dijalankan dan menjalankannya
      - Pada Windows: Menjalankan skrip PowerShell pengesahan
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
- **Baris 21-30**: **Hook pasca-penyediaan** - dijalankan selepas sumber Azure dicipta

  - Melaksanakan skrip penulisan pemboleh ubah persekitaran
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
- **Baris 31-40**: **Hook pasca-penerapan** - dijalankan selepas penerapan aplikasi

  - Melaksanakan skrip penyediaan akhir
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
- **Baris 43**: Merujuk kepada direktori `./src` untuk kod sumber
- **Baris 44**: Menentukan Python sebagai bahasa pengaturcaraan
- **Baris 45**: Menggunakan Azure Container Apps sebagai platform hos
- **Baris 46-48**: Konfigurasi Docker

      - Menggunakan "api_and_frontend" sebagai nama imej
      - Membina imej Docker secara jauh di Azure (bukan secara tempatan)

### 2.5 Pemboleh Ubah Pipeline (49-76)

Ini adalah pemboleh ubah untuk membantu anda menjalankan `azd` dalam pipeline CI/CD untuk automasi

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

Bahagian ini mentakrifkan pemboleh ubah persekitaran yang digunakan **semasa penerapan**, disusun mengikut kategori:

- **Nama Sumber Azure (Baris 51-60)**:
      - Nama sumber perkhidmatan Azure teras contohnya, Resource Group, AI Hub, AI Project, dan lain-lain.- 
- **Bendera Ciri (Baris 61-63)**:
      - Pemboleh ubah boolean untuk mengaktifkan/mematikan perkhidmatan Azure tertentu
- **Konfigurasi Agen AI (Baris 64-71)**:
      - Konfigurasi untuk agen AI utama termasuk nama, ID, tetapan penerapan, butiran model- 
- **Konfigurasi Embedding AI (Baris 72-79)**:
      - Konfigurasi untuk model embedding yang digunakan untuk carian vektor
- **Carian dan Pemantauan (Baris 80-84)**:
      - Nama indeks carian, ID sumber sedia ada, dan tetapan pemantauan/penjejakan

---

## 3. Ketahui Pemboleh Ubah Persekitaran
Pemboleh ubah persekitaran berikut mengawal konfigurasi dan tingkah laku penerapan anda, disusun mengikut tujuan utama mereka. Kebanyakan pemboleh ubah mempunyai nilai lalai yang munasabah, tetapi anda boleh menyesuaikannya untuk memenuhi keperluan khusus atau sumber Azure sedia ada anda.

### 3.1 Pemboleh Ubah Wajib 

```bash title="" linenums="0"
# Konfigurasi Teras Azure
AZURE_ENV_NAME                    # Nama persekitaran (digunakan dalam penamaan sumber)
AZURE_LOCATION                    # Wilayah penyebaran
AZURE_SUBSCRIPTION_ID             # Langganan sasaran
AZURE_RESOURCE_GROUP              # Nama kumpulan sumber
AZURE_PRINCIPAL_ID                # Prinsipal pengguna untuk RBAC

# Nama Sumber (Dijana automatik jika tidak dinyatakan)
AZURE_AIHUB_NAME                  # Nama hab Microsoft Foundry
AZURE_AIPROJECT_NAME              # Nama projek AI
AZURE_AISERVICES_NAME             # Nama akaun perkhidmatan AI
AZURE_STORAGE_ACCOUNT_NAME        # Nama akaun storan
AZURE_CONTAINER_REGISTRY_NAME     # Nama registri kontena
AZURE_KEYVAULT_NAME               # Nama Key Vault (jika digunakan)
```

### 3.2 Konfigurasi Model 
```bash title="" linenums="0"
# Konfigurasi Model Sembang
AZURE_AI_AGENT_MODEL_NAME         # Lalai: gpt-4.1-mini
AZURE_AI_AGENT_MODEL_FORMAT       # Lalai: OpenAI (atau Microsoft)
AZURE_AI_AGENT_MODEL_VERSION      # Lalai: terkini tersedia
AZURE_AI_AGENT_DEPLOYMENT_NAME    # Nama pengedaran untuk model sembang
AZURE_AI_AGENT_DEPLOYMENT_SKU     # Lalai: Standard
AZURE_AI_AGENT_DEPLOYMENT_CAPACITY # Lalai: 80 (ribuan TPM)

# Konfigurasi Model Penyematan
AZURE_AI_EMBED_MODEL_NAME         # Lalai: text-embedding-3-small
AZURE_AI_EMBED_MODEL_FORMAT       # Lalai: OpenAI
AZURE_AI_EMBED_MODEL_VERSION      # Lalai: terkini tersedia
AZURE_AI_EMBED_DEPLOYMENT_NAME    # Nama pengedaran untuk penyematan
AZURE_AI_EMBED_DEPLOYMENT_SKU     # Lalai: Standard
AZURE_AI_EMBED_DEPLOYMENT_CAPACITY # Lalai: 50 (ribuan TPM)

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
AZURE_EXISTING_AIPROJECT_RESOURCE_ID    # ID sumber penuh projek AI sedia ada
AZURE_EXISTING_AIPROJECT_ENDPOINT       # URL titik akhir projek sedia ada
```

### 3.5 Semak Pemboleh Ubah Anda

Gunakan Azure Developer CLI untuk melihat dan mengurus pemboleh ubah persekitaran anda:

```bash title="" linenums="0"
# Lihat semua pembolehubah persekitaran untuk persekitaran semasa
azd env get-values

# Dapatkan pembolehubah persekitaran tertentu
azd env get-value AZURE_ENV_NAME

# Tetapkan pembolehubah persekitaran
azd env set AZURE_LOCATION eastus

# Tetapkan pelbagai pembolehubah dari fail .env
azd env set --from-file .env
```

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh profesional manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->