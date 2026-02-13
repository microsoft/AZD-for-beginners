# 3. Mengurai Template

!!! tip "DI AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Mengaktifkan GitHub Copilot dengan server MCP untuk bantuan Azure
    - [ ] Memahami struktur folder dan komponen template AZD
    - [ ] Mengeksplor pola organisasi infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Menggunakan GitHub Copilot untuk mengeksplorasi dan memahami arsitektur repositori 

---


Dengan template AZD dan Azure Developer CLI (`azd`) kita dapat dengan cepat memulai perjalanan pengembangan AI kita dengan repositori terstandarisasi yang menyediakan contoh kode, infrastruktur dan file konfigurasi - dalam bentuk proyek _starter_ siap-deploy.

**Tetapi sekarang, kita perlu memahami struktur proyek dan basis kode - dan dapat menyesuaikan template AZD - tanpa pengalaman atau pemahaman AZD sebelumnya!**

---

## 1. Mengaktifkan GitHub Copilot

### 1.1 Pasang GitHub Copilot Chat

Saatnya mengeksplor [GitHub Copilot with Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sekarang, kita bisa menggunakan bahasa alami untuk menggambarkan tugas pada tingkat tinggi, dan mendapatkan bantuan dalam pelaksanaannya. Untuk lab ini, kita akan menggunakan [Copilot Free plan](https://github.com/github-copilot/signup) yang memiliki batas bulanan untuk completions dan interaksi obrolan.

Ekstensi dapat diinstal dari marketplace, tetapi seharusnya sudah tersedia di lingkungan Codespaces Anda. _Klik `Open Chat` dari menu drop-down ikon Copilot - dan ketikkan prompt seperti `What can you do?`_ - Anda mungkin akan diminta untuk masuk. **GitHub Copilot Chat siap digunakan**.

### 1.2. Pasang Server MCP

Untuk Agent mode agar efektif, ia membutuhkan akses ke alat yang tepat untuk membantu mengambil pengetahuan atau melakukan tindakan. Di sinilah server MCP dapat membantu. Kita akan mengonfigurasi server berikut:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Untuk mengaktifkan ini:

1. Buat file bernama `.vscode/mcp.json` jika belum ada
1. Salin yang berikut ke dalam file tersebut - dan mulai servernya!
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

??? warning "Anda mungkin mendapatkan kesalahan bahwa `npx` tidak terpasang (klik untuk memperluas perbaikan)"

      Untuk memperbaiki ini, buka file `.devcontainer/devcontainer.json` dan tambahkan baris ini ke bagian features. Kemudian rebuild container. Anda sekarang seharusnya memiliki `npx` terpasang.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Uji GitHub Copilot Chat

**Pertama gunakan `az login` untuk mengautentikasi ke Azure dari baris perintah VS Code.**

Sekarang Anda seharusnya dapat menanyakan status langganan Azure Anda, dan mengajukan pertanyaan tentang sumber daya yang dideploy atau konfigurasi. Coba prompt ini:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Anda juga dapat menanyakan dokumentasi Azure dan mendapatkan respons yang didasarkan pada server Microsoft Docs MCP. Coba prompt ini:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Atau Anda bisa meminta snippet kode untuk menyelesaikan tugas. Coba prompt ini.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Dalam mode `Ask`, ini akan memberikan kode yang bisa Anda salin-tempel dan coba. Dalam mode `Agent`, ini bisa melangkah lebih jauh dan membuat sumber daya terkait untuk Anda - termasuk skrip setup dan dokumentasi - untuk membantu Anda mengeksekusi tugas tersebut.

**Anda sekarang siap untuk mulai mengeksplor repositori template**

---

## 2. Mengurai Arsitektur

??? prompt "TANYA: Jelaskan arsitektur aplikasi di docs/images/architecture.png dalam 1 paragraf"

      Aplikasi ini adalah aplikasi chat bertenaga AI yang dibangun di Azure yang menunjukkan arsitektur berbasis agen modern. Solusi berpusat pada Azure Container App yang menampung kode aplikasi utama, yang memproses input pengguna dan menghasilkan respons cerdas melalui agen AI.
      
      Arsitektur memanfaatkan Microsoft Foundry Project sebagai dasar kemampuan AI, menghubungkan ke Azure AI Services yang menyediakan model bahasa dasar (seperti GPT-4o-mini) dan fungsionalitas agen. Interaksi pengguna mengalir melalui frontend berbasis React ke backend FastAPI yang berkomunikasi dengan layanan agen AI untuk menghasilkan respons kontekstual.
      
      Sistem ini menggabungkan kemampuan pengambilan pengetahuan melalui pencarian file atau layanan Azure AI Search, memungkinkan agen mengakses dan mengutip informasi dari dokumen yang diunggah. Untuk keunggulan operasional, arsitektur mencakup pemantauan komprehensif melalui Application Insights dan Log Analytics Workspace untuk tracing, logging, dan optimisasi performa.
      
      Azure Storage menyediakan blob storage untuk data aplikasi dan unggahan file, sementara Managed Identity memastikan akses aman antar sumber daya Azure tanpa menyimpan kredensial. Seluruh solusi dirancang untuk skalabilitas dan pemeliharaan, dengan aplikasi ter-container yang otomatis menyesuaikan skala berdasarkan permintaan sambil menyediakan keamanan bawaan, pemantauan, dan kemampuan CI/CD melalui ekosistem layanan terkelola Azure.

![Arsitektur](../../../../../translated_images/id/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktur Repositori

!!! prompt "TANYA: Jelaskan struktur folder template. Mulai dengan diagram hierarki visual."

??? info "JAWABAN: Diagram Hierarki Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurasi & Pengaturan
      │   ├── azure.yaml                    # Konfigurasi Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontainer pengembangan lokal
      │   ├── pyproject.toml                # Konfigurasi proyek Python
      │   ├── requirements-dev.txt          # Dependensi pengembangan
      │   └── .devcontainer/                # Pengaturan dev container VS Code
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Template infrastruktur utama
      │   ├── api.bicep                     # Sumber daya khusus API
      │   ├── main.parameters.json          # Parameter infrastruktur
      │   └── core/                         # Komponen infrastruktur modular
      │       ├── ai/                       # Konfigurasi layanan AI
      │       ├── host/                     # Infrastruktur hosting
      │       ├── monitor/                  # Monitoring dan logging
      │       ├── search/                   # Pengaturan Azure AI Search
      │       ├── security/                 # Keamanan dan identitas
      │       └── storage/                  # Konfigurasi akun penyimpanan
      │
      ├── 💻 Sumber Aplikasi (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entry aplikasi FastAPI
      │   │   ├── routes.py                 # Definisi rute API
      │   │   ├── search_index_manager.py   # Fungsionalitas pencarian
      │   │   ├── data/                     # Penanganan data API
      │   │   ├── static/                   # Aset web statis
      │   │   └── templates/                # Template HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Dependensi Node.js
      │   │   ├── vite.config.ts            # Konfigurasi build Vite
      │   │   └── src/                      # Kode sumber frontend
      │   ├── data/                         # File data contoh
      │   │   └── embeddings.csv            # Embedding yang sudah dihitung sebelumnya
      │   ├── files/                        # File basis pengetahuan
      │   │   ├── customer_info_*.json      # Contoh data pelanggan
      │   │   └── product_info_*.md         # Dokumentasi produk
      │   ├── Dockerfile                    # Konfigurasi container
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
      │   ├── sandbox/                      # Tempat bermain pengembangan
      │   │   ├── 1-quickstart.py           # Contoh memulai cepat
      │   │   └── aad-interactive-chat.py   # Contoh autentikasi
      │   └── airedteaming/                 # Evaluasi keamanan AI
      │       └── ai_redteaming.py          # Pengujian tim merah
      │
      ├── 📚 Dokumentasi (docs/)
      │   ├── deployment.md                 # Panduan deployment
      │   ├── local_development.md          # Instruksi pengaturan lokal
      │   ├── troubleshooting.md            # Masalah umum & perbaikan
      │   ├── azure_account_setup.md        # Prasyarat Azure
      │   └── images/                       # Aset dokumentasi
      │
      └── 📄 Metadata Proyek
         ├── README.md                     # Ringkasan proyek
         ├── CODE_OF_CONDUCT.md           # Pedoman komunitas
         ├── CONTRIBUTING.md              # Panduan kontribusi
         ├── LICENSE                      # Ketentuan lisensi
         └── next-steps.md                # Panduan pasca-deploy
      ```

### 3.1. Arsitektur Aplikasi Inti

Template ini mengikuti pola **aplikasi web full-stack** dengan:

- **Backend**: Python FastAPI dengan integrasi Azure AI
- **Frontend**: TypeScript/React dengan sistem build Vite
- **Infrastructure**: Template Azure Bicep untuk sumber daya cloud
- **Containerization**: Docker untuk deployment yang konsisten

### 3.2 Infrastruktur sebagai Kode (Bicep)

Lapisan infrastruktur menggunakan template **Azure Bicep** yang diorganisir secara modular:

   - **`main.bicep`**: Mengorkestrasi semua sumber daya Azure
   - **`core/` modules**: Komponen yang dapat digunakan ulang untuk layanan yang berbeda
      - Layanan AI (Azure OpenAI, AI Search)
      - Hosting kontainer (Azure Container Apps)
      - Monitoring (Application Insights, Log Analytics)
      - Keamanan (Key Vault, Managed Identity)

### 3.3 Sumber Aplikasi (`src/`)

**Backend API (`src/api/`)**:

- REST API berbasis FastAPI
- Integrasi Foundry Agents
- Manajemen indeks pencarian untuk pengambilan pengetahuan
- Kemampuan unggah dan pemrosesan file

**Frontend (`src/frontend/`)**:

- SPA modern React/TypeScript
- Vite untuk pengembangan cepat dan build yang optimal
- Antarmuka chat untuk interaksi agen

**Basis Pengetahuan (`src/files/`)**:

- Contoh data pelanggan dan produk
- Menunjukkan pengambilan pengetahuan berbasis file
- Contoh format JSON dan Markdown


### 3.4 DevOps & Otomasi

**Skrip (`scripts/`)**:

- Skrip PowerShell dan Bash lintas platform
- Validasi dan pengaturan lingkungan
- Konfigurasi pasca-deploy
- Manajemen kuota model

**Integrasi Azure Developer CLI**:

- Konfigurasi `azure.yaml` untuk alur kerja `azd`
- Provisioning dan deployment otomatis
- Manajemen variabel lingkungan

### 3.5 Pengujian & Jaminan Kualitas

**Kerangka Evaluasi (`evals/`)**:

- Evaluasi performa agen
- Pengujian kualitas respons query
- Pipeline penilaian otomatis

**Keamanan AI (`airedteaming/`)**:

- Pengujian tim merah untuk keamanan AI
- Pemindaian kerentanan keamanan
- Praktik AI yang bertanggung jawab

---

## 4. Selamat 🏆

Anda berhasil menggunakan GitHub Copilot Chat dengan server MCP untuk mengeksplor repositori.

- [X] Mengaktifkan GitHub Copilot untuk Azure
- [X] Memahami Arsitektur Aplikasi
- [X] Mengeksplor struktur template AZD

Ini memberi Anda gambaran tentang aset _infrastructure as code_ untuk template ini. Selanjutnya, kita akan melihat file konfigurasi untuk AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->