# 3. Membongkar Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Aktifkan GitHub Copilot dengan pelayan MCP untuk bantuan Azure
    - [ ] Memahami struktur folder dan komponen template AZD
    - [ ] Terokai corak organisasi infrastruktur-sbagai-kod (Bicep)
    - [ ] **Lab 3:** Gunakan GitHub Copilot untuk meneroka dan memahami seni bina repositori 

---


Dengan template AZD dan Azure Developer CLI (`azd`) kita boleh memulakan perjalanan pembangunan AI dengan pantas menggunakan repositori piawai yang menyediakan contoh kod, infrastruktur dan fail konfigurasi - dalam bentuk projek _starter_ siap untuk dideploy.

**Tetapi sekarang, kita perlu memahami struktur projek dan kod - dan dapat mengubah suai template AZD - tanpa sebarang pengalaman atau pemahaman terdahulu tentang AZD!**

---

## 1. Aktifkan GitHub Copilot

### 1.1 Pasang GitHub Copilot Chat

Masa untuk meneroka [GitHub Copilot dengan Mode Agen](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode). Kini, kita boleh menggunakan bahasa semula jadi untuk menerangkan tugasan pada tahap tinggi, dan mendapatkan bantuan dalam pelaksanaan. Untuk makmal ini, kita akan menggunakan [pelan Percuma Copilot](https://github.com/github-copilot/signup) yang mempunyai had bulanan untuk lengkapan dan interaksi sembang.

Sambungan ini boleh dipasang dari marketplace, tetapi sepatutnya sudah tersedia dalam persekitaran Codespaces anda. _Klik `Open Chat` dari ikon Copilot drop-down - dan taip arahan seperti `What can you do?`_ - anda mungkin diminta untuk log masuk. **GitHub Copilot Chat sudah bersedia**.

### 1.2. Pasang Pelayan MCP

Untuk Mode Agen berfungsi dengan berkesan, ia memerlukan akses kepada alat yang betul untuk membantu mendapatkan pengetahuan atau mengambil tindakan. Di sinilah pelayan MCP boleh membantu. Kita akan konfigurasikan pelayan berikut:

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

??? warning "Anda mungkin mendapat ralat bahawa `npx` tidak dipasang (klik untuk perluasan cara membaiki)"

      Untuk membaiki, buka fail `.devcontainer/devcontainer.json` dan tambah baris ini ke bahagian features. Kemudian bina semula kontena. Anda sekarang sepatutnya mempunyai `npx` dipasang.

      ```title="" linenums="0"
         "features": {
            "ghcr.io/devcontainers/features/node:1": {},
            ...
         },
      ```

---

### 1.3. Uji GitHub Copilot Chat

**Gunakan `az login` terlebih dahulu untuk mengautentikasi dengan Azure dari baris perintah VS Code.**

Anda kini sepatutnya boleh bertanya status langganan Azure anda, dan bertanya soalan tentang sumber atau konfigurasi yang telah dideploy. Cuba arahan ini:

1. `List my Azure resource groups`
1. `#foundry list my current deployments`

Anda juga boleh bertanya soalan tentang dokumentasi Azure dan mendapat jawapan berpandukan pelayan Microsoft Docs MCP. Cuba arahan ini:

1. `#microsoft_docs_search What is Azure Developer CLI?`
1. `#microsoft_docs_search Show me a Python tutorial to chat with deployed model`

Atau anda boleh minta potongan kod untuk melengkapkan tugasan. Cuba arahan ini:

1. `Give me a Python code example that uses AAD for an interactive chat client`

Dalam mod `Ask`, ini akan memberi kod yang boleh anda salin dan cuba. Dalam mod `Agent`, ia mungkin mengambil langkah lebih jauh dan mencipta sumber berkaitan untuk anda - termasuk skrip persediaan dan dokumentasi - untuk membantu anda melaksanakan tugasan itu.

**Anda kini bersedia untuk mula meneroka repositori template**

---

## 2. Membongkar Seni Bina

??? prompt "TANYA: Terangkan seni bina aplikasi dalam docs/images/architecture.png dalam 1 perenggan"

      Aplikasi ini adalah aplikasi sembang berkuasa AI dibina di Azure yang menunjukkan seni bina moden berasaskan agen. Penyelesaian ini tertumpu pada Azure Container App yang menghoskan kod aplikasi utama, yang memproses input pengguna dan menghasilkan respons pintar melalui agen AI.
      
      Seni bina ini menggunakan Projek Microsoft Foundry sebagai asas bagi kebolehan AI, menyambung ke Perkhidmatan Azure AI yang menyediakan model bahasa asas (seperti gpt-4.1-mini) dan fungsi agen.
      
      Interaksi pengguna mengalir melalui frontend berasaskan React ke backend FastAPI yang berkomunikasi dengan perkhidmatan agen AI untuk menjana respons kontekstual.
      
      Sistem ini menggabungkan keupayaan pengambilan pengetahuan melalui carian fail atau perkhidmatan Azure AI Search, membolehkan agen mengakses dan memetik maklumat dari dokumen yang dimuat naik.
      
      Untuk kecemerlangan operasi, seni bina merangkumi pemantauan komprehensif melalui Application Insights dan Log Analytics Workspace untuk penjejakan, perekodan dan pengoptimuman prestasi.
      
      Azure Storage menyediakan storan blob untuk data aplikasi dan muat naik fail, manakala Managed Identity memastikan akses selamat antara sumber Azure tanpa menyimpan kelayakan.
      
      Keseluruhan penyelesaian direka untuk skala dan penyelenggaraan, dengan aplikasi berkontena yang secara automatik diskalakan berdasarkan permintaan sambil menyediakan keselamatan terbina dalam, pemantauan, dan kebolehan CI/CD melalui ekosistem perkhidmatan pengurusan Azure.

![Architecture](../../../../../translated_images/ms/architecture.48d94861e6e6cdc0.webp)

---

## 3. Struktur Repositori

!!! prompt "TANYA: Terangkan struktur folder template. Mula dengan diagram hierarki visual."

??? info "JAWAPAN: Diagram Hierarki Visual"

      ```bash title="" 
      get-started-with-ai-agents/
      ├── 📋 Konfigurasi & Persediaan
      │   ├── azure.yaml                    # Konfigurasi Azure Developer CLI
      │   ├── docker-compose.yaml           # Kontena pembangunan tempatan
      │   ├── pyproject.toml                # Konfigurasi projek Python
      │   ├── requirements-dev.txt          # Kebergantungan pembangunan
      │   └── .devcontainer/                # Persediaan kontena dev VS Code
      │
      ├── 🏗️ Infrastruktur (infra/)
      │   ├── main.bicep                    # Template infrastruktur utama
      │   ├── api.bicep                     # Sumber khusus API
      │   ├── main.parameters.json          # Parameter infrastruktur
      │   └── core/                         # Komponen modular infrastruktur
      │       ├── ai/                       # Konfigurasi perkhidmatan AI
      │       ├── host/                     # Infrastruktur hosting
      │       ├── monitor/                  # Pemantauan dan perekodan
      │       ├── search/                   # Persediaan Azure AI Search
      │       ├── security/                 # Keselamatan dan identiti
      │       └── storage/                  # Konfigurasi akaun storan
      │
      ├── 💻 Sumber Aplikasi (src/)
      │   ├── api/                          # API backend
      │   │   ├── main.py                   # Entiti aplikasi FastAPI
      │   │   ├── routes.py                 # Definisi laluan API
      │   │   ├── search_index_manager.py   # Fungsi carian
      │   │   ├── data/                     # Pengendalian data API
      │   │   ├── static/                   # Aset web statik
      │   │   └── templates/                # Template HTML
      │   ├── frontend/                     # Frontend React/TypeScript
      │   │   ├── package.json              # Kebergantungan Node.js
      │   │   ├── vite.config.ts            # Konfigurasi binaan Vite
      │   │   └── src/                      # Kod sumber frontend
      │   ├── data/                         # Fail data contoh
      │   │   └── embeddings.csv            # Embedding yang telah dikira
      │   ├── files/                        # Fail pangkalan pengetahuan
      │   │   ├── customer_info_*.json      # Sampel data pelanggan
      │   │   └── product_info_*.md         # Dokumentasi produk
      │   ├── Dockerfile                    # Konfigurasi kontena
      │   └── requirements.txt              # Kebergantungan Python
      │
      ├── 🔧 Automasi & Skrip (scripts/)
      │   ├── postdeploy.sh/.ps1           # Persediaan selepas pelaksanaan
      │   ├── setup_credential.sh/.ps1     # Konfigurasi kelayakan
      │   ├── validate_env_vars.sh/.ps1    # Pengesahan persekitaran
      │   └── resolve_model_quota.sh/.ps1  # Pengurusan kuota model
      │
      ├── 🧪 Pengujian & Penilaian
      │   ├── tests/                        # Ujian unit dan integrasi
      │   │   └── test_search_index_manager.py
      │   ├── evals/                        # Rangka kerja penilaian agen
      │   │   ├── evaluate.py               # Pelari penilaian
      │   │   ├── eval-queries.json         # Pertanyaan ujian
      │   │   └── eval-action-data-path.json
      │   ├── sandbox/                      # Tapak main pembangunan
      │   │   ├── 1-quickstart.py           # Contoh mula cepat
      │   │   └── aad-interactive-chat.py   # Contoh pengesahan
      │   └── airedteaming/                 # Penilaian keselamatan AI
      │       └── ai_redteaming.py          # Ujian pasukan merah
      │
      ├── 📚 Dokumentasi (docs/)
      │   ├── deployment.md                 # Panduan pelaksanaan
      │   ├── local_development.md          # Arahan persediaan tempatan
      │   ├── troubleshooting.md            # Isu biasa & pembaikan
      │   ├── azure_account_setup.md        # Prasyarat Azure
      │   └── images/                       # Aset dokumentasi
      │
      └── 📄 Metadata Projek
         ├── README.md                     # Gambaran projek
         ├── CODE_OF_CONDUCT.md           # Garis panduan komuniti
         ├── CONTRIBUTING.md              # Panduan sumbangan
         ├── LICENSE                      # Terma lesen
         └── next-steps.md                # Panduan selepas pelaksanaan
      ```

### 3.1. Seni Bina Teras Aplikasi

Template ini mengikuti corak **aplikasi web full-stack** dengan:

- **Backend**: Python FastAPI dengan integrasi Azure AI
- **Frontend**: TypeScript/React dengan sistem binaan Vite
- **Infrastruktur**: Template Azure Bicep untuk sumber awan
- **Kontena**: Docker untuk pengeluaran konsisten

### 3.2 Infra Sebagai Kod (bicep)

Lapisan infrastruktur menggunakan template **Azure Bicep** yang diatur secara modular:

   - **`main.bicep`**: Mengorkestrasi semua sumber Azure
   - **Modul `core/`**: Komponen boleh guna semula untuk perkhidmatan berbeza
      - Perkhidmatan AI (Model Microsoft Foundry, AI Search)
      - Hosting kontena (Azure Container Apps)
      - Pemantauan (Application Insights, Log Analytics)
      - Keselamatan (Key Vault, Managed Identity)

### 3.3 Sumber Aplikasi (`src/`)

**API Backend (`src/api/`)**:

- REST API berasaskan FastAPI
- Integrasi Foundry Agents
- Pengurusan indeks carian untuk pengambilan pengetahuan
- Keupayaan muat naik dan pemprosesan fail

**Frontend (`src/frontend/`)**:

- SPA moden React/TypeScript
- Vite untuk pembangunan pantas dan binaan dioptimumkan
- Antaramuka sembang untuk interaksi agen

**Pangkalan Pengetahuan (`src/files/`)**:

- Data contoh pelanggan dan produk
- Memperagakan pengambilan pengetahuan berasaskan fail
- Contoh format JSON dan Markdown


### 3.4 DevOps & Automasi

**Skrip (`scripts/`)**:

- Skrip PowerShell dan Bash rentas platform
- Pengesahan dan persediaan persekitaran
- Konfigurasi selepas pelaksanaan
- Pengurusan kuota model

**Integrasi Azure Developer CLI**:

- Konfigurasi `azure.yaml` untuk aliran kerja `azd`
- Peruntukan dan pelaksanaan automatik
- Pengurusan pembolehubah persekitaran

### 3.5 Pengujian & Jaminan Kualiti

**Rangka Kerja Penilaian (`evals/`)**:

- Penilaian prestasi agen
- Ujian kualiti tindak balas pertanyaan
- Saluran penilaian automatik

**Keselamatan AI (`airedteaming/`)**:

- Ujian pasukan merah untuk keselamatan AI
- Imbasan kerentanan keselamatan
- Amalan AI bertanggungjawab

---

## 4. Tahniah 🏆

Anda telah berjaya menggunakan GitHub Copilot Chat dengan pelayan MCP, untuk meneroka repositori.

- [X] Mengaktifkan GitHub Copilot untuk Azure
- [X] Memahami Seni Bina Aplikasi
- [X] Menerokai struktur template AZD

Ini memberi anda gambaran aset _infrastruktur sebagai kod_ untuk template ini. Seterusnya, kita akan lihat fail konfigurasi untuk AZD.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->