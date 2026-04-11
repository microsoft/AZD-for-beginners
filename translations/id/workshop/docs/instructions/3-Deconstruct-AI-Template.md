# 3. Membongkar Template

!!! tip "DI AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Mengaktifkan GitHub Copilot dengan MCP servers untuk bantuan Azure
    - [ ] Memahami struktur folder dan komponen template AZD
    - [ ] Menjelajahi pola organisasi infrastructure-as-code (Bicep)
    - [ ] **Lab 3:** Gunakan GitHub Copilot untuk menjelajahi dan memahami arsitektur repositori 

---


Dengan template AZD dan Azure Developer CLI (`azd`) kita dapat dengan cepat memulai perjalanan pengembangan AI kita dengan repositori standar yang menyediakan contoh kode, infrastruktur dan file konfigurasi - dalam bentuk proyek _starter_ yang siap untuk dideploy.

**Tetapi sekarang, kita perlu memahami struktur proyek dan basis kode - serta mampu menyesuaikan template AZD - tanpa pengalaman atau pemahaman sebelumnya tentang AZD!**

---

## 1. Mengaktifkan GitHub Copilot

### 1.1 Pasang GitHub Copilot Chat

Saatnya menjelajahi [GitHub Copilot dengan Mode Agen](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Sekarang, kita dapat menggunakan bahasa alami untuk mendeskripsikan tugas pada tingkat tinggi, dan mendapatkan bantuan dalam pelaksanaannya. Untuk lab ini, kita akan menggunakan [Copilot Free plan](https://github.com/github-copilot/signup) yang memiliki batasan bulanan untuk penyelesaian dan interaksi obrolan.

Ekstensi dapat diinstal dari marketplace, dan seringkali sudah tersedia di Codespaces atau lingkungan dev container. _Klik `Open Chat` dari drop-down ikon Copilot - dan ketik prompt seperti `What can you do?`_ - Anda mungkin akan diminta untuk masuk. **GitHub Copilot Chat siap digunakan**.

### 1.2. Pasang MCP Servers

Agar mode Agen efektif, ia membutuhkan akses ke alat yang tepat untuk membantu mengambil pengetahuan atau melakukan tindakan. Di sinilah server MCP dapat membantu. Kita akan mengonfigurasi server berikut:

1. [Azure MCP Server](../../../../../workshop/docs/instructions)
1. [Microsoft Docs MCP Server](../../../../../workshop/docs/instructions)

Untuk mengaktifkannya:

1. Buat file bernama `.vscode/mcp.json` jika belum ada
1. Salin yang berikut ke dalam file itu - dan mulai servernya!
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

??? warning "Anda mungkin mendapatkan kesalahan bahwa `npx` tidak terpasang (klik untuk membuka perbaikan)"

      Untuk memperbaiki ini, buka file `.devcontainer/devcontainer.json` dan tambahkan baris ini ke bagian features. Lalu rebuild container. Anda seharusnya sekarang memiliki `npx` terpasang.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Uji GitHub Copilot Chat

**Pertama gunakan `azd auth login` untuk mengautentikasi dengan Azure dari command line VS Code. Gunakan `az login` juga hanya jika Anda berencana menjalankan perintah Azure CLI secara langsung.**

Anda sekarang seharusnya dapat memeriksa status langganan Azure Anda, dan menanyakan pertanyaan tentang sumber daya atau konfigurasi yang telah diterapkan. Coba prompt berikut:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Anda juga dapat menanyakan pertanyaan tentang dokumentasi Azure dan mendapatkan respons yang didasarkan pada server MCP Microsoft Docs. Coba prompt berikut:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Atau Anda dapat meminta potongan kode untuk menyelesaikan suatu tugas. Coba prompt ini.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Dalam mode `Ask`, ini akan menyediakan kode yang dapat Anda salin-tempel dan coba. Dalam mode `Agent`, ini mungkin melangkah lebih jauh dan membuat sumber daya terkait untuk Anda - termasuk skrip setup dan dokumentasi - untuk membantu Anda mengeksekusi tugas itu.

**Anda sekarang dilengkapi untuk mulai menjelajahi repositori template**

---

## 2. Membongkar Arsitektur

??? prompt "TANYA: Jelaskan arsitektur aplikasi di docs/images/architecture.png dalam 1 paragraf"

      Aplikasi ini adalah aplikasi chat bertenaga AI yang dibangun di Azure yang memperlihatkan arsitektur modern berbasis agen. Solusinya berpusat pada Azure Container App yang menjadi host kode aplikasi utama, yang memproses masukan pengguna dan menghasilkan respons cerdas melalui agen AI.
      
      Arsitektur ini memanfaatkan Microsoft Foundry Project sebagai fondasi kemampuan AI, terhubung ke Layanan Azure AI yang menyediakan model bahasa dasar (seperti gpt-4.1-mini) dan fungsionalitas agen. Interaksi pengguna mengalir melalui frontend berbasis React ke backend FastAPI yang berkomunikasi dengan layanan agen AI untuk menghasilkan respons kontekstual.
      
      Sistem ini menggabungkan kemampuan pengambilan pengetahuan melalui pencarian berkas atau layanan Azure AI Search, memungkinkan agen mengakses dan mengutip informasi dari dokumen yang diunggah. Untuk keunggulan operasional, arsitektur ini menyertakan pemantauan komprehensif melalui Application Insights dan Log Analytics Workspace untuk pelacakan, pencatatan, dan optimisasi performa.
      
      Azure Storage menyediakan blob storage untuk data aplikasi dan unggahan file, sementara Managed Identity memastikan akses aman antar sumber daya Azure tanpa menyimpan kredensial. Seluruh solusi dirancang untuk skalabilitas dan dapat dipelihara, dengan aplikasi yang dikontainerisasi yang menskalakan secara otomatis berdasarkan permintaan sambil menyediakan keamanan, pemantauan, dan kemampuan CI/CD bawaan melalui ekosistem layanan terkelola Azure.

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
      │       ├── monitor/                  # Pemantauan dan pencatatan
      │       ├── search/                   # Pengaturan Azure AI Search
      │       ├── security/                 # Keamanan dan identitas
      │       └── storage/                  # Konfigurasi storage account
      │
      ├── 💻 Sumber Aplikasi (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entri aplikasi FastAPI
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
      │   │   └── embeddings.csv            # Embedding yang telah dihitung sebelumnya
      │   ├── files/                        # File basis pengetahuan
      │   │   ├── customer_info_*.json      # Contoh data pelanggan
      │   │   └── product_info_*.md         # Dokumentasi produk
      │   ├── Dockerfile                    # Konfigurasi kontainer
      │   └── requirements.txt              # Dependensi Python
      │
      ├── 🔧 Otomatisasi & Skrip (scripts/)
      │   ├── postdeploy.sh/.ps1           # Pengaturan pasca-penyebaran
      │   ├── setup_credential.sh/.ps1     # Konfigurasi kredensial
      │   ├── validate_env_vars.sh/.ps1    # Validasi variabel lingkungan
      │   └── resolve_model_quota.sh/.ps1  # Manajemen kuota model
      │
      ├── 🧪 Pengujian & Evaluasi
      │   ├── tests/                        # Tes unit dan integrasi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Kerangka evaluasi agen
      │   │   ├── evaluate.py               # Runner evaluasi
      │   │   ├── eval-queries.json         # Kuiri uji
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Tempat bermain pengembangan
      │   │   ├── 1-quickstart.py           # Contoh memulai cepat
      │   │   └── aad-interactive-chat.py   # Contoh otentikasi
      │   └── airedteaming/                 # Evaluasi keselamatan AI
      │       └── ai_redteaming.py          # Pengujian red team
      │
      ├── 📚 Dokumentasi (docs/)
      │   ├── deployment.md                 # Panduan penyebaran
      │   ├── local_development.md          # Instruksi pengaturan lokal
      │   ├── troubleshooting.md            # Masalah umum & perbaikan
      │   ├── azure_account_setup.md        # Prasyarat Azure
      │   └── images/                       # Aset dokumentasi
      │
      └── 📄 Metadata Proyek
         ├── README.md                     # Ikhtisar proyek
         ├── CODE_OF_CONDUCT.md           # Pedoman komunitas
         ├── CONTRIBUTING.md              # Panduan kontribusi
         ├── LICENSE                      # Ketentuan lisensi
         └── next-steps.md                # Panduan pasca-penyebaran
      ```

### 3.1. Arsitektur Inti Aplikasi

Template ini mengikuti pola **aplikasi web full-stack** dengan:

- **Backend**: Python FastAPI dengan integrasi Azure AI
- **Frontend**: TypeScript/React dengan sistem build Vite
- **Infrastruktur**: Template Azure Bicep untuk sumber daya cloud
- **Kontainerisasi**: Docker untuk penyebaran yang konsisten

### 3.2 Infrastruktur sebagai Kode (Bicep)

Lapisan infrastruktur menggunakan template **Azure Bicep** yang diorganisir secara modular:

   - **`main.bicep`**: Mengorkestrasi semua sumber daya Azure
   - **`core/` modules**: Komponen yang dapat digunakan kembali untuk layanan yang berbeda
      - Layanan AI (Microsoft Foundry Models, AI Search)
      - Hosting kontainer (Azure Container Apps)
      - Pemantauan (Application Insights, Log Analytics)
      - Keamanan (Key Vault, Managed Identity)

### 3.3 Sumber Aplikasi (`src/`)

**Backend API (`src/api/`)**:

- REST API berbasis FastAPI
- Integrasi Foundry Agents
- Manajemen indeks pencarian untuk pengambilan pengetahuan
- Kemampuan unggah dan pemrosesan berkas

**Frontend (`src/frontend/`)**:

- SPA modern React/TypeScript
- Vite untuk pengembangan cepat dan build yang dioptimalkan
- Antarmuka chat untuk interaksi agen

**Basis Pengetahuan (`src/files/`)**:

- Contoh data pelanggan dan produk
- Menunjukkan pengambilan pengetahuan berbasis berkas
- Contoh format JSON dan Markdown


### 3.4 DevOps & Otomatisasi

**Skrip (`scripts/`)**:

- Skrip lintas-platform PowerShell dan Bash
- Validasi dan setup lingkungan
- Konfigurasi pasca-penyebaran
- Manajemen kuota model

**Integrasi Azure Developer CLI**:

- Konfigurasi `azure.yaml` untuk alur kerja `azd`
- Provisioning dan penyebaran otomatis
- Manajemen variabel lingkungan

### 3.5 Pengujian & Jaminan Kualitas

**Kerangka Evaluasi (`evals/`)**:

- Evaluasi kinerja agen
- Pengujian kualitas kueri-respons
- Pipeline penilaian otomatis

**Keselamatan AI (`airedteaming/`)**:

- Pengujian red team untuk keselamatan AI
- Pemindaian kerentanan keamanan
- Praktik AI yang bertanggung jawab

---

## 4. Selamat 🏆

Anda berhasil menggunakan GitHub Copilot Chat dengan server MCP, untuk menjelajahi repositori.

- [X] Mengaktifkan GitHub Copilot untuk Azure
- [X] Memahami Arsitektur Aplikasi
- [X] Menjelajahi struktur template AZD

Ini memberi Anda gambaran tentang aset _infrastructure as code_ untuk template ini. Selanjutnya, kita akan melihat file konfigurasi untuk AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang kritis, disarankan menggunakan jasa terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->