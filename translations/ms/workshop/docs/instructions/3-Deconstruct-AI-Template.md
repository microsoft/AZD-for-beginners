# 3. Huraikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN MAMPU UNTUK"

    - [ ] Aktifkan GitHub Copilot dengan pelayan MCP untuk bantuan Azure
    - [ ] Fahami struktur folder templat AZD dan komponen
    - [ ] Terokai corak organisasi infrastruktur-sebagai-kod (Bicep)
    - [ ] **Makmal 3:** Gunakan GitHub Copilot untuk meneroka dan memahami seni bina repositori 

---


Dengan templat AZD dan Azure Developer CLI (`azd`) kami boleh dengan cepat memulakan perjalanan pembangunan AI kami dengan repositori standar yang menyediakan kod contoh, infrastruktur dan fail konfigurasi - dalam bentuk projek _starter_ yang sedia untuk diterapkan.

**Tetapi sekarang, kita perlu memahami struktur projek dan asas kod - dan mampu mengubah suai templat AZD - tanpa pengalaman atau pemahaman terdahulu tentang AZD!**

---

## 1. Aktifkan GitHub Copilot

### 1.1 Pasang GitHub Copilot Chat

Kini masanya untuk meneroka [GitHub Copilot dengan Mod Agen](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Kini, kita boleh menggunakan bahasa semula jadi untuk menerangkan tugasan pada tahap tinggi, dan mendapat bantuan dalam pelaksanaan. Untuk makmal ini, kita akan menggunakan [pelan Percuma Copilot](https://github.com/github-copilot/signup) yang mempunyai had bulanan untuk penyempurnaan dan interaksi chat.

Sambungan ini boleh dipasang dari marketplace, tetapi sepatutnya sudah tersedia dalam persekitaran Codespaces anda. _Klik `Open Chat` dari ikon Copilot di menu lungsur - dan taip arahan seperti `What can you do?`_ - anda mungkin akan diminta untuk log masuk. **GitHub Copilot Chat sudah bersedia**.

### 1.2. Pasang Pelayan MCP

Untuk mod Agen berkesan, ia memerlukan akses kepada alat yang sesuai untuk membantu mendapatkan pengetahuan atau mengambil tindakan. Di sinilah pelayan MCP boleh membantu. Kita akan konfigurasi pelayan berikut:

1. [Pelayan Azure MCP](../../../../../workshop/docs/instructions)
1. [Pelayan Microsoft Docs MCP](../../../../../workshop/docs/instructions)

Untuk mengaktifkan ini:

1. Cipta fail bernama `.vscode/mcp.json` jika ia belum wujud
1. Salin yang berikut ke dalam fail itu - dan mulakan pelayan!
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

??? warning "Anda mungkin mendapat ralat bahawa `npx` tidak dipasang (klik untuk kembangkan penyelesaian)"

      Untuk membaiki, buka fail `.devcontainer/devcontainer.json` dan tambahkan baris ini ke bahagian features. Kemudian bina semula kontena. Anda kini sepatutnya mempunyai `npx` dipasang.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Uji GitHub Copilot Chat

**Gunakan `az login` dahulu untuk pengesahan dengan Azure dari baris perintah VS Code.**

Anda kini harus dapat bertanya mengenai status langganan Azure anda, dan tanya soalan tentang sumber yang digunakan atau konfigurasi. Cuba arahan berikut:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Anda juga boleh bertanya soalan mengenai dokumentasi Azure dan mendapat respons berdasarkan pelayan Microsoft Docs MCP. Cuba arahan berikut:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Atau anda boleh minta petikan kod untuk melengkapkan tugasan. Cuba arahan ini.

1. `Give me a Python code example that uses AAD for an interactive chat client`

Dalam mod `Ask`, ini akan memberikan kod yang boleh anda salin-tampal dan cuba. Dalam mod `Agent`, ini mungkin pergi lebih jauh dan mencipta sumber yang berkaitan untuk anda - termasuk skrip setup dan dokumentasi - untuk membantu anda melaksanakan tugasan itu.

**Anda kini bersedia untuk mula meneroka repositori templat**

---

## 2. Huraikan Seni Bina

??? prompt "TANYA: Terangkan seni bina aplikasi dalam docs/images/architecture.png dalam 1 perenggan"

      Aplikasi ini adalah aplikasi chat yang dikuasakan AI dibina atas Azure yang menunjukkan seni bina moden berasaskan agen. Penyelesaian ini tertumpu pada Azure Container App yang menempatkan kod aplikasi utama, yang memproses input pengguna dan menghasilkan respons pintar melalui agen AI. 
      
      Seni bina ini menggunakan Microsoft Foundry Project sebagai asas untuk keupayaan AI, menghubungkan kepada Perkhidmatan AI Azure yang menyediakan model bahasa asas (seperti GPT-4o-mini) dan fungsi agen. Interaksi pengguna mengalir melalui frontend berasaskan React ke backend FastAPI yang berkomunikasi dengan perkhidmatan agen AI untuk menghasilkan respons kontekstual. 
      
      Sistem ini menggabungkan keupayaan penerangan pengetahuan melalui sama ada carian fail atau perkhidmatan Azure AI Search, membolehkan agen mengakses dan memetik maklumat dari dokumen yang dimuat naik. Untuk kecemerlangan operasi, seni bina ini termasuk pemantauan menyeluruh melalui Application Insights dan Log Analytics Workspace untuk pengesanan, pencatatan, dan pengoptimuman prestasi. 
      
      Azure Storage menyediakan simpanan blob untuk data aplikasi dan muat naik fail, manakala Managed Identity memastikan akses selamat antara sumber Azure tanpa menyimpan kelayakan. Keseluruhan penyelesaian direka untuk kebolehsuaian dan kebolehpemeliharaan, dengan aplikasi berkontena yang secara automatik menyesuaikan skala berdasarkan permintaan sambil menyediakan keselamatan terbina dalam, pemantauan, dan keupayaan CI/CD melalui ekosistem perkhidmatan terurus Azure.

![Architecture](../../../../../translated_images/ms/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktur Repositori

!!! prompt "TANYA: Terangkan struktur folder templat. Mula dengan diagram hierarki visual."

??? info "JAWAPAN: Diagram Hierarki Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Configuration & Setup
      │   ├── azure.yaml                    # Konfigurasi Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontena pembangunan setempat
      │   ├── pyproject.toml                # Konfigurasi projek Python
      │   ├── requirements-dev.txt          # Kebergantungan pembangunan
      │   └── .devcontainer/                # Persediaan kontena dev VS Code
      │
      ├── 🏗️ Infrastructure (infra/)
      │   ├── main.bicep                    # Templat infrastruktur utama
      │   ├── api.bicep                     # Sumber khusus API
      │   ├── main.parameters.json          # Parameter infrastruktur
      │   └── core/                         # Komponen modular infrastruktur
      │       ├── ai/                       # Konfigurasi perkhidmatan AI
      │       ├── host/                     # Infrastruktur hos
      │       ├── monitor/                  # Pemantauan dan pencatatan
      │       ├── search/                   # Persediaan Azure AI Search
      │       ├── security/                 # Keselamatan dan identiti
      │       └── storage/                  # Konfigurasi akaun storan
      │
      ├── 💻 Application Source (src/)
      │   ├── api/                          # Backend API
      │   │   ├── main.py                   # Entri aplikasi FastAPI
      │   │   ├── routes.py                 # Definisi laluan API
      │   │   ├── search_index_manager.py   # Fungsi carian
      │   │   ├── data/                     # Pengendalian data API
      │   │   ├── static/                   # Aset web statik
      │   │   └── templates/                # Templat HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Kebergantungan Node.js
      │   │   ├── vite.config.ts            # Konfigurasi binaan Vite
      │   │   └── src/                      # Kod sumber frontend
      │   ├── data/                         # Fail data contoh
      │   │   └── embeddings.csv            # Embeddings telah dikira awal
      │   ├── files/                        # Fail pangkalan pengetahuan
      │   │   ├── customer_info_*.json      # Sampel data pelanggan
      │   │   └── product_info_*.md         # Dokumentasi produk
      │   ├── Dockerfile                    # Konfigurasi kontena
      │   └── requirements.txt              # Kebergantungan Python
      │
      ├── 🔧 Automation & Scripts (scripts/)
      │   ├── postdeploy.sh/.ps1           # Persediaan selepas pelaksanaan
      │   ├── setup_credential.sh/.ps1     # Konfigurasi kelayakan
      │   ├── validate_env_vars.sh/.ps1    # Pengesahan pembolehubah persekitaran
      │   └── resolve_model_quota.sh/.ps1  # Pengurusan kuota model
      │
      ├── 🧪 Testing & Evaluation
      │   ├── tests/                        # Ujian unit dan integrasi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Rangka kerja penilaian agen
      │   │   ├── evaluate.py               # Pelari penilaian
      │   │   ├── eval-queries.json         # Pertanyaan ujian
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Tempat percubaan pembangunan
      │   │   ├── 1-quickstart.py           # Contoh bermula pantas
      │   │   └── aad-interactive-chat.py   # Contoh pengesahan
      │   └── airedteaming/                 # Penilaian keselamatan AI
      │       └── ai_redteaming.py          # Ujian pasukan merah
      │
      ├── 📚 Documentation (docs/)
      │   ├── deployment.md                 # Panduan pelaksanaan
      │   ├── local_development.md          # Arahan penyediaan setempat
      │   ├── troubleshooting.md            # Isu biasa & penyelesaian
      │   ├── azure_account_setup.md        # Prasyarat Azure
      │   └── images/                       # Aset dokumentasi
      │
      └── 📄 Project Metadata
         ├── README.md                     # Gambaran projek
         ├── CODE_OF_CONDUCT.md           # Garis panduan komuniti
         ├── CONTRIBUTING.md              # Panduan sumbangan
         ├── LICENSE                      # Terma lesen
         └── next-steps.md                # Panduan selepas pelaksanaan
      ```

### 3.1. Seni Bina Aplikasi Teras

Templat ini mengikuti corak **aplikasi web pelengkap penuh** dengan:

- **Backend**: Python FastAPI dengan integrasi AI Azure
- **Frontend**: TypeScript/React dengan sistem binaan Vite
- **Infrastruktur**: templat Azure Bicep untuk sumber awan
- **Kontena**: Docker untuk pelaksanaan konsisten

### 3.2 Infra Sebagai Kod (bicep)

Lapisan infrastruktur menggunakan templat **Azure Bicep** yang disusun secara modular:

   - **`main.bicep`**: Mengatur semua sumber Azure
   - **modul `core/`**: Komponen guna semula untuk perkhidmatan berbeza
      - Perkhidmatan AI (Azure OpenAI, AI Search)
      - Penghosan kontena (Azure Container Apps)
      - Pemantauan (Application Insights, Log Analytics)
      - Keselamatan (Key Vault, Managed Identity)

### 3.3 Sumber Aplikasi (`src/`)

**Backend API (`src/api/`)**:

- API REST berasaskan FastAPI
- Integrasi Foundry Agents
- Pengurusan indeks carian untuk penerangan pengetahuan
- Keupayaan muat naik dan pemprosesan fail

**Frontend (`src/frontend/`)**:

- SPA moden React/TypeScript
- Vite untuk pembangunan pantas dan binaan dioptimumkan
- Antara muka chat untuk interaksi agen

**Pangkalan Pengetahuan (`src/files/`)**:

- Sampel data pelanggan dan produk
- Menunjukkan penerangan pengetahuan berasaskan fail
- Contoh format JSON dan Markdown


### 3.4 DevOps & Automasi

**Skrip (`scripts/`)**:

- Skrip PowerShell dan Bash rentas platform
- Pengesahan dan penyediaan persekitaran
- Konfigurasi selepas pelaksanaan
- Pengurusan kuota model

**Integrasi Azure Developer CLI**:

- Konfigurasi `azure.yaml` untuk aliran kerja `azd`
- Penyediaan dan pelaksanaan terautomasi
- Pengurusan pembolehubah persekitaran

### 3.5 Ujian & Jaminan Kualiti

**Rangka kerja Penilaian (`evals/`)**:

- Penilaian prestasi agen
- Ujian kualiti pertanyaan-respons
- Saluran penilaian automatik

**Keselamatan AI (`airedteaming/`)**:

- Ujian pasukan merah untuk keselamatan AI
- Imbasan kerentanan keselamatan
- Amalan AI bertanggungjawab

---

## 4. Tahniah 🏆

Anda berjaya menggunakan GitHub Copilot Chat dengan pelayan MCP untuk meneroka repositori.

- [X] Mengaktifkan GitHub Copilot untuk Azure
- [X] Memahami Seni Bina Aplikasi
- [X] Meneroka struktur templat AZD

Ini memberi anda gambaran tentang aset _infrastruktur sebagai kod_ untuk templat ini. Seterusnya, kita akan lihat fail konfigurasi untuk AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk mencapai ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->