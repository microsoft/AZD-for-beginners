<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4e403f041411361140d6beb88ab2a181",
  "translation_date": "2025-09-24T23:35:35+00:00",
  "source_file": "workshop/docs/instructions/3-Deconstruct-AI-Template.md",
  "language_code": "id"
}
-->
# 3. Membongkar Template

!!! tip "SETELAH SELESAI MODUL INI, ANDA AKAN MAMPU"

    - [ ] Item
    - [ ] Item
    - [ ] Item
    - [ ] **Lab 3:** 

---

Dengan template AZD dan Azure Developer CLI (`azd`), kita dapat dengan cepat memulai perjalanan pengembangan AI dengan repositori standar yang menyediakan kode contoh, infrastruktur, dan file konfigurasi - dalam bentuk proyek _starter_ yang siap untuk diterapkan.

**Namun sekarang, kita perlu memahami struktur proyek dan kode dasar - serta mampu menyesuaikan template AZD - tanpa pengalaman atau pemahaman sebelumnya tentang AZD!**

---

## 1. Aktifkan GitHub Copilot

### 1.1 Instal GitHub Copilot Chat

Saatnya menjelajahi [GitHub Copilot dengan Mode Agen](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sekarang, kita dapat menggunakan bahasa alami untuk mendeskripsikan tugas kita secara umum, dan mendapatkan bantuan dalam pelaksanaannya. Untuk lab ini, kita akan menggunakan [Copilot Free plan](https://github.com/github-copilot/signup) yang memiliki batas bulanan untuk penyelesaian dan interaksi chat.

Ekstensi ini dapat diinstal dari marketplace, tetapi seharusnya sudah tersedia di lingkungan Codespaces Anda. _Klik `Open Chat` dari menu drop-down ikon Copilot - dan ketikkan prompt seperti `What can you do?`_ - Anda mungkin diminta untuk masuk. **GitHub Copilot Chat siap digunakan**.

### 1.2. Instal Server MCP

Agar Mode Agen efektif, ia memerlukan akses ke alat yang tepat untuk membantu mengambil pengetahuan atau melakukan tindakan. Di sinilah server MCP dapat membantu. Kita akan mengonfigurasi server berikut:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Untuk mengaktifkannya:

1. Buat file bernama `.vscode/mcp.json` jika belum ada
1. Salin berikut ini ke dalam file tersebut - dan mulai server!
   ```json title=".vscode/mcp.json"
   {
      "servers": {
         "Azure MCP Server": {
            "command": "npx",
            "args": [
            "-y",
            "@azure/mcp@latest",
            "server",
            "start"
            ]
         },
         "microsoft.docs.mcp": {
            "type": "http",
            "url": "https://learn.microsoft.com/api/mcp"
         }
      }
   }
   ```

??? warning "Anda mungkin mendapatkan error bahwa `npx` tidak terinstal (klik untuk melihat perbaikan)"

      Untuk memperbaikinya, buka file `.devcontainer/devcontainer.json` dan tambahkan baris ini ke bagian fitur. Kemudian bangun ulang container. Sekarang Anda seharusnya memiliki `npx` terinstal.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Uji GitHub Copilot Chat

**Pertama gunakan `az login` untuk mengautentikasi dengan Azure dari command line VS Code.**

Sekarang Anda seharusnya dapat memeriksa status langganan Azure Anda, dan mengajukan pertanyaan tentang sumber daya atau konfigurasi yang telah diterapkan. Coba prompt berikut:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Anda juga dapat mengajukan pertanyaan tentang dokumentasi Azure dan mendapatkan respons yang didasarkan pada server Microsoft Docs MCP. Coba prompt berikut:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Atau Anda dapat meminta cuplikan kode untuk menyelesaikan tugas. Coba prompt ini.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Dalam mode `Ask`, ini akan memberikan kode yang dapat Anda salin-tempel dan coba. Dalam mode `Agent`, ini mungkin melangkah lebih jauh dan membuat sumber daya yang relevan untuk Anda - termasuk skrip pengaturan dan dokumentasi - untuk membantu Anda melaksanakan tugas tersebut.

**Sekarang Anda siap untuk mulai menjelajahi repositori template**

---

## 2. Membongkar Arsitektur

??? prompt "ASK: Jelaskan arsitektur aplikasi dalam docs/images/architecture.png dalam 1 paragraf"

      Aplikasi ini adalah aplikasi chat berbasis AI yang dibangun di Azure yang menunjukkan arsitektur modern berbasis agen. Solusi ini berpusat pada Azure Container App yang menjadi host kode aplikasi utama, yang memproses input pengguna dan menghasilkan respons cerdas melalui agen AI. 
      
      Arsitektur ini memanfaatkan Proyek Azure AI Foundry sebagai dasar untuk kemampuan AI, terhubung ke Layanan AI Azure yang menyediakan model bahasa dasar (seperti GPT-4o-mini) dan fungsi agen. Interaksi pengguna mengalir melalui frontend berbasis React ke backend FastAPI yang berkomunikasi dengan layanan agen AI untuk menghasilkan respons kontekstual. 
      
      Sistem ini mengintegrasikan kemampuan pengambilan pengetahuan melalui pencarian file atau layanan Azure AI Search, memungkinkan agen untuk mengakses dan mengutip informasi dari dokumen yang diunggah. Untuk keunggulan operasional, arsitektur ini mencakup pemantauan komprehensif melalui Application Insights dan Log Analytics Workspace untuk pelacakan, logging, dan optimasi kinerja. 
      
      Azure Storage menyediakan penyimpanan blob untuk data aplikasi dan file yang diunggah, sementara Managed Identity memastikan akses aman antar sumber daya Azure tanpa menyimpan kredensial. Seluruh solusi dirancang untuk skalabilitas dan pemeliharaan, dengan aplikasi yang dikontainerisasi secara otomatis menskalakan berdasarkan permintaan sambil menyediakan keamanan, pemantauan, dan kemampuan CI/CD bawaan melalui ekosistem layanan terkelola Azure.

![Architecture](../../../../../translated_images/architecture.48d94861e6e6cdc000edd4d7e2a5020cf2e97a97dbe353789ae9da48c946ccd0.id.png)

---

## 3. Struktur Repositori

!!! prompt "ASK: Jelaskan struktur folder template. Mulai dengan diagram hierarki visual."

??? info "ANSWER: Diagram Hierarki Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurasi & Pengaturan
      │   ├── azure.yaml                    # Konfigurasi Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontainer pengembangan lokal
      │   ├── pyproject.toml                # Konfigurasi proyek Python
      │   ├── requirements-dev.txt          # Dependensi pengembangan
      │   └── .devcontainer/                # Pengaturan kontainer dev VS Code
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Template infrastruktur utama
      │   ├── api.bicep                     # Sumber daya spesifik API
      │   ├── main.parameters.json          # Parameter infrastruktur
      │   └── core/                         # Komponen infrastruktur modular
      │       ├── ai/                       # Konfigurasi layanan AI
      │       ├── host/                     # Infrastruktur hosting
      │       ├── monitor/                  # Pemantauan dan logging
      │       ├── search/                   # Pengaturan Azure AI Search
      │       ├── security/                 # Keamanan dan identitas
      │       └── storage/                  # Konfigurasi akun penyimpanan
      │
      ├── 💻 Sumber Aplikasi (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entry aplikasi FastAPI
      │   │   ├── routes.py                 # Definisi rute API
      │   │   ├── search_index_manager.py   # Fungsi pencarian
      │   │   ├── data/                     # Penanganan data API
      │   │   ├── static/                   # Aset web statis
      │   │   └── templates/                # Template HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependensi Node.js
      │   │   ├── vite.config.ts            # Konfigurasi build Vite
      │   │   └── src/                      # Kode sumber frontend
      │   ├── data/                         # File data contoh
      │   │   └── embeddings.csv            # Embedding yang telah dihitung
      │   ├── files/                        # File basis pengetahuan
      │   │   ├── customer_info_*.json      # Contoh data pelanggan
      │   │   └── product_info_*.md         # Dokumentasi produk
      │   ├── Dockerfile                    # Konfigurasi kontainer
      │   └── requirements.txt              # Dependensi Python
      │
      ├── 🔧 Otomasi & Skrip (scripts/)
      │   ├── postdeploy.sh/.ps1           # Pengaturan pasca-deploy
      │   ├── setup_credential.sh/.ps1     # Konfigurasi kredensial
      │   ├── validate_env_vars.sh/.ps1    # Validasi lingkungan
      │   └── resolve_model_quota.sh/.ps1  # Manajemen kuota model
      │
      ├── 🧪 Pengujian & Evaluasi
      │   ├── tests/                        # Unit dan pengujian integrasi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Kerangka evaluasi agen
      │   │   ├── evaluate.py               # Runner evaluasi
      │   │   ├── eval-queries.json         # Query pengujian
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Playground pengembangan
      │   │   ├── 1-quickstart.py           # Contoh memulai cepat
      │   │   └── aad-interactive-chat.py   # Contoh autentikasi
      │   └── airedteaming/                 # Evaluasi keamanan AI
      │       └── ai_redteaming.py          # Pengujian red team
      │
      ├── 📚 Dokumentasi (docs/)
      │   ├── deployment.md                 # Panduan penerapan
      │   ├── local_development.md          # Instruksi pengaturan lokal
      │   ├── troubleshooting.md            # Masalah umum & perbaikan
      │   ├── azure_account_setup.md        # Prasyarat Azure
      │   └── images/                       # Aset dokumentasi
      │
      └── 📄 Metadata Proyek
         ├── README.md                     # Ikhtisar proyek
         ├── CODE_OF_CONDUCT.md           # Panduan komunitas
         ├── CONTRIBUTING.md              # Panduan kontribusi
         ├── LICENSE                      # Ketentuan lisensi
         └── next-steps.md                # Panduan pasca-penerapan
      ```

### 3.1. Arsitektur Aplikasi Inti

Template ini mengikuti pola **aplikasi web full-stack** dengan:

- **Backend**: Python FastAPI dengan integrasi Azure AI
- **Frontend**: TypeScript/React dengan sistem build Vite
- **Infrastruktur**: Template Azure Bicep untuk sumber daya cloud
- **Kontainerisasi**: Docker untuk penerapan yang konsisten

### 3.2 Infrastruktur Sebagai Kode (bicep)

Lapisan infrastruktur menggunakan template **Azure Bicep** yang diorganisasi secara modular:

   - **`main.bicep`**: Mengorkestrasi semua sumber daya Azure
   - **`core/` modul**: Komponen yang dapat digunakan kembali untuk berbagai layanan
      - Layanan AI (Azure OpenAI, AI Search)
      - Hosting kontainer (Azure Container Apps)
      - Pemantauan (Application Insights, Log Analytics)
      - Keamanan (Key Vault, Managed Identity)

### 3.3 Sumber Aplikasi (`src/`)

**Backend API (`src/api/`)**:

- REST API berbasis FastAPI
- Integrasi layanan agen AI Azure
- Manajemen indeks pencarian untuk pengambilan pengetahuan
- Kemampuan unggah dan pemrosesan file

**Frontend (`src/frontend/`)**:

- SPA React/TypeScript modern
- Vite untuk pengembangan cepat dan build yang dioptimalkan
- Antarmuka chat untuk interaksi agen

**Basis Pengetahuan (`src/files/`)**:

- Contoh data pelanggan dan produk
- Menunjukkan pengambilan pengetahuan berbasis file
- Contoh format JSON dan Markdown

### 3.4 DevOps & Otomasi

**Skrip (`scripts/`)**:

- Skrip PowerShell dan Bash lintas platform
- Validasi dan pengaturan lingkungan
- Konfigurasi pasca-penerapan
- Manajemen kuota model

**Integrasi Azure Developer CLI**:

- Konfigurasi `azure.yaml` untuk alur kerja `azd`
- Penyediaan dan penerapan otomatis
- Manajemen variabel lingkungan

### 3.5 Pengujian & Jaminan Kualitas

**Kerangka Evaluasi (`evals/`)**:

- Evaluasi kinerja agen
- Pengujian kualitas query-respons
- Pipeline penilaian otomatis

**Keamanan AI (`airedteaming/`)**:

- Pengujian red team untuk keamanan AI
- Pemindaian kerentanan keamanan
- Praktik AI yang bertanggung jawab

---

## 4. Selamat 🏆

Anda berhasil menggunakan GitHub Copilot Chat dengan server MCP, untuk menjelajahi repositori.

- [X] Mengaktifkan GitHub Copilot untuk Azure
- [X] Memahami Arsitektur Aplikasi
- [X] Menjelajahi struktur template AZD

Ini memberi Anda gambaran tentang aset _infrastruktur sebagai kode_ untuk template ini. Selanjutnya, kita akan melihat file konfigurasi untuk AZD.

---

