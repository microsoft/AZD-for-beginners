# Changelog - AZD Untuk Pemula

## Pengenalan

Changelog ini mendokumentasikan semua perubahan penting, kemas kini, dan penambahbaikan kepada repositori AZD Untuk Pemula. Kami mengikuti prinsip penomboran versi semantik dan mengekalkan log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan mengkaji changelog ini, anda akan:
- Sentiasa maklum tentang ciri baru dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Mengesan pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas mengkaji entri changelog, anda akan dapat:
- Mengenal pasti kandungan dan sumber baru yang tersedia untuk pembelajaran
- Memahami bahagian yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Memberi maklum balas dan cadangan untuk penambahbaikan masa depan

## Sejarah Versi

### [v3.19.1] - 2026-03-27

#### Penjelasan Penyediaan Pemula, Pengesahan Setup & Pembersihan Perintah AZD Akhir
**Versi ini mengikuti imbasan pengesahan AZD 1.23 dengan laluan dokumentasi berfokuskan pemula: ia memperjelas panduan pengesahan AZD-pertama, menambah skrip pengesahan setup tempatan, mengesahkan perintah utama dengan AZD CLI secara langsung, dan menghapuskan rujukan perintah sumber bahasa Inggeris yang sudah usang di luar changelog.**

#### Ditambah
- **🧪 Skrip pengesahan setup pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` supaya pelajar dapat mengesahkan alat yang diperlukan sebelum memulakan Bab 1
- **✅ Langkah pengesahan setup awal** dalam README akar dan README Bab 1 supaya keperluan yang hilang dapat dikesan sebelum `azd up`

#### Diubah
- **🔐 Panduan pengesahan pemula** kini secara konsisten menganggap `azd auth login` sebagai laluan utama untuk aliran kerja AZD, dengan `az login` disebut sebagai pilihan kecuali perintah Azure CLI digunakan secara langsung
- **📚 Aliran onboarding Bab 1** kini mengarahkan pelajar untuk mengesahkan setup tempatan mereka sebelum pemasangan, pengesahan, dan langkah penyebaran pertama
- **🛠️ Mesej validator** kini membezakan dengan jelas keperluan yang menghalang daripada amaran Azure CLI pilihan untuk laluan pemula AZD sahaja
- **📖 Dokumen konfigurasi, penyelesaian masalah, dan contoh** kini membezakan antara pengesahan AZD yang diperlukan dan log masuk Azure CLI pilihan di mana kedua-duanya sebelum ini dipersembahkan tanpa konteks

#### Diperbaiki
- **📋 Rujukan perintah sumber Bahasa Inggeris yang masih ada** dikemas kini kepada bentuk AZD semasa, termasuk `azd config show` dalam helaian cheat dan `azd monitor --overview` di mana panduan overview Portal Azure dimaksudkan
- **🧭 Tuntutan pemula di Bab 1** dilonggarkan supaya tidak berjanji berlebihan tentang tingkah laku tanpa ralat atau rollback dijamin di semua templat dan sumber Azure
- **🔎 Pengesahan CLI secara langsung** mengesahkan sokongan semasa untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

#### Fail Dikemas Kini
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `examples/container-app/README.md`
- `examples/database-app/README.md`
- `resources/cheat-sheet.md`
- `validate-setup.ps1`
- `validate-setup.sh`

---

### [v3.19.0] - 2026-03-26

#### Pengesahan AZD 1.23.12, Pengembangan Persekitaran Bengkel & Penyegaran Model AI
**Versi ini melakukan imbasan pengesahan dokumentasi terhadap `azd` `1.23.12`, mengemas kini contoh perintah AZD yang usang, menyegarkan panduan model AI kepada lalai semasa, dan memperluas arahan bengkel melebihi GitHub Codespaces untuk menyokong bekas dev dan klon tempatan juga.**

#### Ditambah
- **✅ Nota pengesahan merentas bab teras dan dokumen bengkel** untuk menjadikan garis dasar AZD yang diuji jelas bagi pelajar yang menggunakan binaan CLI yang lebih baru atau lama
- **⏱️ Panduan tamat masa penyebaran** untuk penyebaran aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah pemeriksaan sambungan** dengan `azd extension show azure.ai.agents` dalam dokumen aliran kerja AI
- **🌐 Panduan persekitaran bengkel yang lebih luas** merangkumi GitHub Codespaces, bekas dev, dan klon tempatan dengan MkDocs

#### Diubah
- **📚 README pengenalan bab** kini secara konsisten menyatakan pengesahan terhadap `azd 1.23.12` merentas bahagian asas, konfigurasi, infrastruktur, multi-ejen, pra-penyebaran, penyelesaian masalah, dan produksi
- **🛠️ Rujukan perintah AZD** dikemas kini ke bentuk semasa merentas dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` bergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` di mana overview Application Insights dimaksudkan
- **🧪 Contoh pratunangan penyediaan** dipermudahkan kepada penggunaan disokong semasa seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Aliran bengkel** dikemas kini supaya pelajar dapat menyiapkan makmal di Codespaces, bekas dev, atau klon tempatan dan tidak hanya mengandaikan pelaksanaan Codespaces sahaja
- **🔐 Panduan pengesahan** kini mengutamakan `azd auth login` untuk aliran kerja AZD, dengan `az login` diposisikan sebagai pilihan apabila perintah Azure CLI digunakan secara langsung

#### Diperbaiki
- **🪟 Perintah pemasangan Windows** dinormalisasi kepada huruf kes pakej `winget` semasa dalam panduan pemasangan
- **🐧 Panduan pemasangan Linux** diperbetulkan untuk mengelakkan arahan pengurus pakej `azd` khusus distro yang tidak disokong dan sebaliknya merujuk kepada aset pelepasan jika sesuai
- **📦 Contoh model AI** disegarkan dari lalai lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` kepada contoh semasa seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Petikan penyebaran dan diagnostik** diperbetulkan untuk menggunakan perintah status dan persekitaran semasa dalam log, skrip, dan langkah penyelesaian masalah
- **⚙️ Panduan GitHub Actions** dikemas kini dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** dikemas kini dari `azd mcp consent` ke `azd copilot consent list`

#### Ditingkatkan
- **🧠 Panduan bab AI** kini lebih baik menerangkan tingkah laku `azd ai` yang sensitif pratonton, log masuk khusus penyewa, penggunaan sambungan semasa, dan cadangan penyebaran model yang dikemas kini
- **🧪 Arahan bengkel** kini menggunakan contoh versi lebih realistik dan bahasa penyiapan persekitaran yang lebih jelas untuk makmal praktikal
- **📈 Dokumen produksi dan penyelesaian masalah** kini selaras lebih baik dengan pemantauan semasa, model sandaran, dan contoh tahap kos

#### Fail Dikemas Kini
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-01-foundation/installation.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-03-configuration/configuration.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-06-pre-deployment/preflight-checks.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `docs/chapter-07-troubleshooting/common-issues.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `workshop/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/1-Select-AI-Template.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`
- `workshop/docs/instructions/3-Deconstruct-AI-Template.md`
- `workshop/docs/instructions/5-Customize-AI-Template.md`

---

### [v3.18.0] - 2026-03-16

#### Perintah AZD AI CLI, Pengesahan Kandungan & Pengembangan Templat
**Versi ini menambah liputan perintah `azd ai`, `azd extension`, dan `azd mcp` merentas semua bab berkaitan AI, memperbaiki pautan rosak dan kod lapuk dalam agents.md, mengemas kini helaian cheat, dan merombak bahagian Templat Contoh dengan penerangan yang telah disahkan serta templat Azure AI AZD baru.**

#### Ditambah
- **🤖 Liputan AZD AI CLI** merentas 7 fail (sebelum ini hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Seksyen baru "Extensions and AI Commands" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pilihan 4: `azd ai agent init` dengan jadual perbandingan (templat vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseksyen "AZD Extensions for Foundry" dan "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Permulaan Pantas kini memaparkan laluan penyebaran berasaskan templat dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bahagian penyebaran kini termasuk pilihan `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseksyen "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Seksyen baru "AI & Extensions Commands" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Sembang RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan sokongan sembang suara
  - **azure-search-openai-demo-java** — Sembang RAG Java menggunakan Langchain4J dengan pilihan penyebaran ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif multi-ejen menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa pelayan menggunakan Azure Functions + LangChain.js + Cosmos DB dengan sokongan pembangunan tempatan Ollama
  - **chat-with-your-data-solution-accelerator** — Pecutan RAG perusahaan dengan portal pentadbiran, integrasi Teams, dan pilihan PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi rujukan orkestra MCP multi-ejen dengan pelayan dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat permulaan Bicep infrastruktur Azure AI minimal
  - **🔗 Pautan Galeri AZD AI Hebat** — Rujukan kepada galeri [awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Diperbaiki
- **🔗 Navigasi agents.md**: Pautan Sebelumnya/Seterusnya kini sepadan dengan susunan pelajaran README Bab 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Pautan rosak agents.md**: `production-ai-practices.md` diperbetulkan kepada `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 Kod lapuk agents.md**: Digantikan `opencensus` dengan `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API tidak sah agents.md**: `max_tokens` dipindahkan dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Pengiraan token agents.md**: Gantikan anggaran kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Perkhidmatan diperbetulkan dari "Cognitive Search + App Service" ke "Azure AI Search + Azure Container Apps" (host lalai ditukar Okt 2024)
- **contoso-chat**: Keterangan dikemas kini untuk merujuk Azure AI Foundry + Prompty, sepadan dengan tajuk dan teknologi repositori sebenar

#### Dikeluarkan
- **ai-document-processing**: Rujukan templat tidak berfungsi dikeluarkan (repo tidak dapat diakses secara awam sebagai templat AZD)

#### Ditingkatkan
- **📝 exercises agents.md**: Latihan 1 kini menunjukkan output yang dijangkakan dan langkah `azd monitor`; Latihan 2 termasuk kod pendaftaran penuh `FunctionTool`; Latihan 3 menggantikan panduan samar dengan arahan `prepdocs.py` yang konkrit  
- **📚 sumber agents.md**: Pautan dokumentasi dikemas kini kepada dokumen Azure AI Agent Service dan panduan pantas terkini  
- **📋 Jadual Langkah Seterusnya agents.md**: Ditambah pautan Makmal Bengkel AI untuk liputan bab lengkap  

#### Fail Dikemaskini  
- `docs/chapter-01-foundation/azd-basics.md`  
- `docs/chapter-02-ai-development/agents.md`  
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`  
- `docs/chapter-05-multi-agent/README.md`  
- `docs/chapter-06-pre-deployment/coordination-patterns.md`  
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`  
- `resources/cheat-sheet.md`  

---

### [v3.17.0] - 2026-02-05

#### Penambahbaikan Navigasi Kursus  
**Versi ini memperbaiki navigasi bab README.md dengan format jadual yang dipertingkatkan.**

#### Diubah  
- **Jadual Peta Kursus**: Diperbaiki dengan pautan pelajaran langsung, anggaran tempoh, dan penarafan kerumitan  
- **Pembersihan Folder**: Mengalih keluar folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)  
- **Pengesahan Pautan**: Semua 21+ pautan dalaman dalam jadual Peta Kursus telah disahkan  

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk  
**Versi ini mengemas kini rujukan produk kepada penjenamaan Microsoft terkini.**

#### Diubah  
- **Microsoft Foundry → Microsoft Foundry**: Semua rujukan dikemas kini merentas fail bukan terjemahan  
- **Azure AI Agent Service → Foundry Agents**: Nama perkhidmatan dikemas kini untuk mencerminkan penjenamaan semasa  

#### Fail Dikemaskini  
- `README.md` - Laman penempatan kursus utama  
- `changelog.md` - Sejarah versi  
- `course-outline.md` - Struktur kursus  
- `docs/chapter-02-ai-development/agents.md` - Panduan agen AI  
- `examples/README.md` - Dokumentasi contoh  
- `workshop/README.md` - Laman bengkel  
- `workshop/docs/index.md` - Indeks bengkel  
- `workshop/docs/instructions/*.md` - Semua fail arahan bengkel  

---

### [v3.15.0] - 2026-02-05

#### Penstrukturan Semula Repositori Utama: Nama Folder Berdasarkan Bab  
**Versi ini menyusun semula dokumentasi ke dalam folder bab khusus untuk navigasi yang lebih jelas.**

#### Penamaan Semula Folder  
Folder lama telah digantikan dengan folder bernombor bab:  
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`  
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`  
- `docs/deployment/` → `docs/chapter-04-infrastructure/`  
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`  
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`  
- Ditambah baru: `docs/chapter-05-multi-agent/`  

#### Migrasi Fail  
| Fail | Dari | Ke |  
|------|------|---|  
| azd-basics.md | getting-started/ | chapter-01-foundation/ |  
| installation.md | getting-started/ | chapter-01-foundation/ |  
| first-project.md | getting-started/ | chapter-01-foundation/ |  
| configuration.md | getting-started/ | chapter-03-configuration/ |  
| authsecurity.md | getting-started/ | chapter-03-configuration/ |  
| microsoft-foundry-integration.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| agents.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| ai-model-deployment.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| ai-workshop-lab.md | microsoft-foundry/ | chapter-02-ai-development/ |  
| production-ai-practices.md | microsoft-foundry/ | chapter-08-production/ |  
| deployment-guide.md | deployment/ | chapter-04-infrastructure/ |  
| provisioning.md | deployment/ | chapter-04-infrastructure/ |  
| Semua fail pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |  
| Semua fail troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |  

#### Ditambah  
- **📚 Fail README Bab**: Dibuat README.md dalam setiap folder bab dengan:  
  - Objektif pembelajaran dan tempoh  
  - Jadual pelajaran dengan penerangan  
  - Arahan mula cepat  
  - Navigasi ke bab lain  

#### Diubah  
- **🔗 Dikemaskini semua pautan dalaman**: 78+ laluan dikemas kini merentas semua fail dokumentasi  
- **🗺️ README.md Utama**: Dikemaskini Peta Kursus dengan struktur bab baharu  
- **📝 examples/README.md**: Dikemaskini rujukan silang kepada folder bab  

#### Dibuang  
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)  

---

### [v3.14.0] - 2026-02-05

#### Penstrukturan Semula Repositori: Navigasi Bab  
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Agen AI Baharu  
**Versi ini menambah panduan menyeluruh untuk mengendalikan agen AI dengan Azure Developer CLI.**

#### Ditambah  
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap merangkumi:  
  - Apa itu agen AI dan perbezaannya dengan chatbot  
  - Tiga templat agen mula cepat (Foundry Agents, Prompty, RAG)  
  - Corak seni bina agen (agen tunggal, RAG, multi-agen)  
  - Konfigurasi dan pengubahsuaian alat  
  - Pemantauan dan penjejakan metrik  
  - Pertimbangan kos dan pengoptimuman  
  - Senario troubleshooting biasa  
  - Tiga latihan praktikal dengan kriteria kejayaan  

#### Struktur Kandungan  
- **Pengenalan**: Konsep agen untuk pemula  
- **Mula Cepat**: Mengendalikan agen dengan `azd init --template get-started-with-ai-agents`  
- **Corak Seni Bina**: Diagram visual corak agen  
- **Konfigurasi**: Persediaan alat dan pembolehubah persekitaran  
- **Pemantauan**: Integrasi Application Insights  
- **Latihan**: Pembelajaran praktikal berperingkat (20-45 minit setiap satu)  

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer  
**Versi ini mengemas kini konfigurasi kontena pembangunan dengan alat moden dan tetapan lalai lebih baik untuk pengalaman pembelajaran AZD.**

#### Diubah  
- **🐳 Imej Asas**: Dikemas kini dari `python:3.12-bullseye` kepada `python:3.12-bookworm` (Debian stabil terkini)  
- **📛 Nama Kontena**: Ditukar dari "Python 3" kepada "AZD for Beginners" untuk kejelasan  

#### Ditambah  
- **🔧 Ciri Dev Container Baru**:  
  - `azure-cli` dengan sokongan Bicep diaktifkan  
  - `node:20` (versi LTS untuk templat AZD)  
  - `github-cli` untuk pengurusan templat  
  - `docker-in-docker` untuk pengendalian penghantaran aplikasi kontena  

- **🔌 Penghalaan Port**: Port pra-konfigurasi untuk pembangunan biasa:  
  - 8000 (pratonton MkDocs)  
  - 3000 (aplikasi web)  
  - 5000 (Python Flask)  
  - 8080 (API)  

- **🧩 Sambungan VS Code Baru**:  
  - `ms-python.vscode-pylance` - IntelliSense Python dipertingkat  
  - `ms-azuretools.vscode-azurefunctions` - Sokongan Azure Functions  
  - `ms-azuretools.vscode-docker` - Sokongan Docker  
  - `ms-azuretools.vscode-bicep` - Sokongan bahasa Bicep  
  - `ms-azure-devtools.azure-resource-groups` - Pengurusan sumber Azure  
  - `yzhang.markdown-all-in-one` - Penyuntingan Markdown  
  - `DavidAnson.vscode-markdownlint` - Pemeriksa lint Markdown  
  - `bierner.markdown-mermaid` - Sokongan diagram Mermaid  
  - `redhat.vscode-yaml` - Sokongan YAML (untuk azure.yaml)  
  - `eamodio.gitlens` - Visualisasi Git  
  - `mhutchie.git-graph` - Sejarah Git  

- **⚙️ Tetapan VS Code**: Ditambah tetapan lalai untuk pengantara Python, format semasa simpan, dan pemotongan ruang kosong  

- **📦 Dikemaskini requirements-dev.txt**:  
  - Ditambah plugin minify MkDocs  
  - Ditambah pre-commit untuk kualiti kod  
  - Ditambah pakej Azure SDK (azure-identity, azure-mgmt-resource)  

#### Dibaiki  
- **Arahan Pasca-Cipta**: Kini mengesahkan pemasangan AZD dan Azure CLI pada permulaan kontena  

---

### [v3.11.0] - 2026-02-05

#### Penambahbaikan README Mesra Pemula  
**Versi ini memperbaiki README.md dengan ketara untuk akses mudah kepada pemula dan menambah sumber penting bagi pembangun AI.**

#### Ditambah  
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas bila guna setiap alat dengan contoh praktikal  
- **🌟 Pautan AZD Hebat**: Pautan terus ke galeri templat komuniti dan sumber sumbangan:  
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templat sedia guna  
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti  
- **🎯 Panduan Mula Cepat**: Bahagian tiga langkah mudah (Pasang → Log masuk → Hantar)  
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas untuk mula mengikut pengalaman pembangun  

#### Diubah  
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat utama dahulu  
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" untuk pemula lengkap  
- **Dibuang Kandungan Berganda**: Menghapuskan bahagian penyelesaian masalah berganda  
- **Arahan Penyelesaian Masalah**: Memperbaiki rujukan `azd logs` kepada `azd monitor --logs` yang sah  

#### Dibaiki  
- **🔐 Arahan Pengesahan**: Ditambah `azd auth login` dan `azd auth logout` ke cheat-sheet.md  
- **Rujukan Arahan Tidak Sah**: Menghapuskan baki `azd logs` dalam bahagian penyelesaian masalah README  

#### Nota  
- **Skop**: Perubahan digunakan pada README.md utama dan resources/cheat-sheet.md  
- **Sasaran Audiens**: Penambahbaikan khusus untuk pembangun yang baru dengan AZD  

---

### [v3.10.0] - 2026-02-05

#### Kemas Kini Ketepatan Arahan Azure Developer CLI  
**Versi ini membetulkan arahan AZD yang tidak wujud di seluruh dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Dibaiki  
- **🔧 Arahan AZD Tidak Wujud Dibuang**: Audit menyeluruh dan pembetulan arahan tidak sah:  
  - `azd logs` (tidak wujud) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI  
  - Subarahan `azd service` (tidak wujud) → digantikan dengan `azd show` dan Azure CLI  
  - `azd infra import/export/validate` (tidak wujud) → dibuang atau digantikan dengan alternatif sah  
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dibuang  
  - Flag `azd provision --what-if/--rollback` (tidak wujud) → dikemas kini menggunakan `--preview`  
  - `azd config validate` (tidak wujud) → digantikan dengan `azd config list`  
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dibuang  

- **📚 Fail Dikemaskini dengan Pembetulan Arahan**:  
  - `resources/cheat-sheet.md`: Pengubahsuaian rujukan arahan besar-besaran  
  - `docs/deployment/deployment-guide.md`: Pembetulan strategi rollback dan penyebaran  
  - `docs/troubleshooting/debugging.md`: Betulkan bahagian analisa log  
  - `docs/troubleshooting/common-issues.md`: Kemas kini arahan penyelesaian masalah  
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan bahagian penyahpepijatan AZD  
  - `docs/getting-started/azd-basics.md`: Betulkan arahan pemantauan  
  - `docs/getting-started/first-project.md`: Kemas kini contoh pemantauan dan penyahpepijatan  
  - `docs/getting-started/installation.md`: Betulkan contoh bantuan dan versi  
  - `docs/pre-deployment/application-insights.md`: Betulkan arahan paparan log  
  - `docs/pre-deployment/coordination-patterns.md`: Betulkan arahan penyahpepijatan agen  

- **📝 Rujukan Versi Dikemaskini**:  
  - `docs/getting-started/installation.md`: Tukar versi statik `1.5.0` kepada generik `1.x.x` dengan pautan ke pelepasan  

#### Diubah  
- **Strategi Rollback**: Kemas kini dokumentasi menggunakan rollback berasaskan Git (AZD tiada rollback asli)  
- **Paparan Log**: Gantikan rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan arahan Azure CLI  
- **Bahagian Prestasi**: Buang flag penyebaran selari/incremental yang tidak wujud, berikan alternatif sah  

#### Butiran Teknikal
- **Perintah AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag sah azd monitor**: `--live`, `--logs`, `--overview`
- **Ciri-ciri Dikeluarkan**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Perintah disahkan mengikut Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyempurnaan Bengkel dan Kemaskini Kualiti Dokumentasi
**Versi ini melengkapkan modul bengkel interaktif, membaiki semua pautan dokumentasi yang rosak, dan memperbaiki kualiti kandungan keseluruhan untuk pembangun AI yang menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen panduan sumbangan baru dengan:
  - Arahan jelas untuk melaporkan isu dan mencadangkan perubahan
  - Standard dokumentasi untuk kandungan baru
  - Garis panduan contoh kod dan konvensyen mesej komit
  - Maklumat penglibatan komuniti

#### Disempurnakan
- **🎯 Modul Bengkel 7 (Penutup)**: Modul penutup yang lengkap dengan:
  - Rumusan menyeluruh tentang pencapaian bengkel
  - Bahagian konsep utama yang dikuasai termasuk AZD, templat, dan Microsoft Foundry
  - Cadangan sambungan perjalanan pembelajaran
  - Latihan cabaran bengkel dengan penarafan kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Menguraikan)**: Objektif pembelajaran dikemaskini dengan:
  - Panduan pengaktifan GitHub Copilot dengan pelayan MCP
  - Pemahaman struktur folder templat AZD
  - Corak organisasi infrastruktur sebagai kod (Bicep)
  - Arahan makmal praktikal

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Disempurnakan dengan:
  - Objektif pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk penyahprovisi infrastruktur secara selamat
  - Panduan pemulihan perkhidmatan kognitif yang dipadam secara lembut
  - Cadangan penerokaan bonus untuk GitHub Copilot dan Portal Azure

#### Dibaiki
- **🔗 Pembaikan Pautan Rosak**: Memperbaiki 15+ pautan dalaman dokumentasi yang rosak:
  - `docs/ai-foundry/ai-model-deployment.md`: Membetulkan laluan ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Membetulkan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Menggantikan cicd-integration.md yang tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Membetulkan laluan FAQ dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Membetulkan laluan kursus utama dan panduan penghantaran
  - `resources/faq.md` dan `resources/glossary.md`: Mengemas kini rujukan bab AI
  - `course-outline.md`: Membetulkan rujukan panduan pengajar dan makmal bengkel AI

- **📅 Sepanduk Status Bengkel**: Dikemaskini daripada "Dalam Pembinaan" kepada status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Membetulkan pautan navigasi yang rosak dalam README.md bengkel yang menunjuk ke folder lab-1-azd-basics yang tidak wujud

#### Diubah
- **Pembentangan Bengkel**: Membuang amaran "dalam pembinaan", bengkel kini lengkap dan sedia digunakan
- **Konsistensi Navigasi**: Memastikan semua modul bengkel mempunyai navigasi antara modul yang betul
- **Rujukan Laluan Pembelajaran**: Dikemaskini dengan rujukan silang bab yang menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown Bahasa Inggeris mempunyai pautan dalaman yang sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan betul
- ✅ Kandungan sesuai untuk pembangun AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur mesra pemula dikekalkan sepanjang masa
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan dalaman .md
- **Audit Kandungan**: Semakan manual kesempurnaan bengkel dan kesesuaian pemula
- **Sistem Navigasi**: Corak navigasi bab dan modul yang konsisten digunakan

#### Nota
- **Skop**: Perubahan digunakan hanya pada dokumentasi Bahasa Inggeris
- **Terjemahan**: Folder terjemahan tidak dikemaskini dalam versi ini (terjemahan automatik akan diselaraskan kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan 3-4 jam pembelajaran praktikal

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Multi-Ejen
**Versi ini menambah pelajaran gred A menyeluruh mengenai integrasi Application Insights, corak pengesahan, dan koordinasi multi-ejen untuk pengeluaran.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Penghantaran berfokus AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri tersuai (1,200+ baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Model Microsoft Foundry)
  - 6 diagram Mermaid (senibina, penjejakan diedarkan, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh pertanyaan Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan debug masa nyata
  - Masa pembelajaran 40-50 minit dengan corak siap produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (string sambungan, Key Vault, identiti dikendalikan)
  - Templat infrastruktur Bicep lengkap untuk penghantaran selamat
  - Kod aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (aktifkan identiti dikendalikan, identiti ditugaskan pengguna, putaran Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisa kos
  - Corak pengesahan tanpa kata laluan sedia produksi

- **🤖 Pelajaran Corak Koordinasi Multi-Ejen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (berurutan, selari, hierarki, dipacu acara, konsensus)
  - Pelaksanaan perkhidmatan pengendali lengkap (Python/Flask, 1,500+ baris)
  - 3 pelaksanaan ejen khusus (Penyelidikan, Penulis, Editor)
  - Integrasi Service Bus untuk antrian mesej
  - Pengurusan keadaan Cosmos DB untuk sistem diedarkan
  - 6 diagram Mermaid menunjukkan interaksi ejen
  - 3 latihan lanjutan (pengendalian tamat masa, logik cuba semula, pemutus litar)
  - Pecahan kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-penghantaran**: Kini termasuk corak pemantauan dan koordinasi yang menyeluruh
- **Bab Permulaan**: Ditingkatkan dengan corak pengesahan profesional
- **Kesiapan Pengeluaran**: Liputan lengkap dari keselamatan ke keterlihatan
- **Garis Kursus**: Dikemaskini merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Perkembangan Pembelajaran**: Pengintegrasian keselamatan dan pemantauan lebih baik sepanjang kursus
- **Kualiti Dokumentasi**: Standard gred A yang konsisten (95-97%) merentas pelajaran baru
- **Corak Pengeluaran**: Liputan lengkap hujung ke hujung untuk penghantaran perniagaan

#### Diperbaiki
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan pengeluaran
- **Standard Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Keterlihatan**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Model Microsoft Foundry dan sistem multi-ejen

#### Disahkan
- ✅ Semua pelajaran termasuk kod berfungsi lengkap (bukan serpihan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 jumlah merentas 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 jumlah)
- ✅ Templat Bicep sedia penghantaran boleh dihantar dengan `azd up`
- ✅ Analisa kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah pengesahan

#### Keputusan Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan menyeluruh
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Senibina multi-ejen canggih
- **Kandungan Baru Keseluruhan**: - Standard berkualiti tinggi yang konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + penjejakan diedarkan
- **Pengesahan**: Identiti Dikendalikan + Key Vault + corak RBAC
- **Multi-Ejen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, polisi penyimpanan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Penambahbaikan Kualiti Dokumentasi dan Contoh Microsoft Foundry Models Baru
**Versi ini meningkatkan kualiti dokumentasi merentasi repositori dan menambah contoh penghantaran Microsoft Foundry Models lengkap dengan antara muka chat gpt-4.1.**

#### Ditambah
- **🤖 Contoh Chat Microsoft Foundry Models**: Penghantaran gpt-4.1 lengkap dengan pelaksanaan berfungsi di `examples/azure-openai-chat/`:
  - Infrastruktur lengkap Microsoft Foundry Models (penghantaran model gpt-4.1)
  - Antaramuka chat arahan Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Sekatan kadar dan pengendalian ralat
  - README menyeluruh dengan panduan penghantaran 35-45 minit
  - 11 fail siap produksi (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambah latihan praktikal panduan konfigurasi:
  - Latihan 1: Konfigurasi pelbagai persekitaran (15 minit)
  - Latihan 2: Amalan pengurusan rahsia (10 minit)
  - Kriteria kejayaan dan langkah pengesahan yang jelas
- **✅ Pengesahan Penghantaran**: Menambah seksyen pengesahan pada panduan penghantaran:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Keluaran dijangka untuk semua perintah penghantaran
  - Rujukan pantas penyelesaian masalah

#### Ditingkatkan
- **examples/README.md**: Dikemaskini ke kualiti gred A (93%):
  - Menambah azure-openai-chat ke semua bahagian berkaitan
  - Dikemaskini bilangan contoh tempatan dari 3 ke 4
  - Ditambah ke Jadual Contoh Aplikasi AI
  - Disepadukan ke Mula Cepat untuk Pengguna Tahap Pertengahan
  - Ditambah ke bahagian Templat Microsoft Foundry
  - Dikemaskini Matriks Perbandingan dan bahagian pencarian teknologi
- **Kualiti Dokumentasi**: Diperbaiki dari B+ (87%) → A- (92%) merentasi folder dokumen:
  - Ditambah keluaran dijangka pada contoh perintah kritikal
  - Termasuk langkah pengesahan untuk perubahan konfigurasi
  - Dipertingkatkan pembelajaran praktikal dengan latihan boleh guna

#### Diubah
- **Perkembangan Pembelajaran**: Pengintegrasian contoh AI lebih baik untuk pelajar peringkat pertengahan
- **Struktur Dokumentasi**: Latihan lebih bertindak dengan hasil jelas
- **Proses Pengesahan**: Kriteria kejayaan yang nyata ditambah kepada aliran kerja utama

#### Diperbaiki
- **Pengalaman Pembangun**: Penghantaran Microsoft Foundry Models kini mengambil 35-45 minit (berbanding 60-90 untuk alternatif kompleks)
- **Ketelusan Kos**: Anggaran kos jelas ($50-200/bulan) untuk contoh Microsoft Foundry Models
- **Laluan Pembelajaran**: Pembangun AI mempunyai titik masuk jelas dengan azure-openai-chat
- **Standard Dokumentasi**: Keluaran dijangka konsisten dan langkah pengesahan

#### Disahkan
- ✅ Contoh Microsoft Foundry Models berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan betul dari segi sintaks
- ✅ Arahan README sepadan dengan pengalaman penghantaran sebenar
- ✅ Pautan dokumentasi dikemas kini di 8+ lokasi
- ✅ Indeks contoh mencerminkan 4 contoh tempatan dengan tepat
- ✅ Tiada pautan luaran pendua dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Senibina Microsoft Foundry Models**: gpt-4.1 + Key Vault + corak Container Apps
- **Keselamatan**: Sedia Identiti Dikendalikan, rahsia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Penghantaran**: Satu perintah `azd up` untuk set lengkap

### [v3.6.0] - 2025-11-19

#### Kemaskini Utama: Contoh Penghantaran Aplikasi Container
**Versi ini memperkenalkan contoh penghantaran aplikasi container siap produksi yang menyeluruh menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke dalam laluan pembelajaran.**

#### Ditambah
- **🚀 Contoh Aplikasi Container**: Contoh tempatan baru di `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Tinjauan lengkap penghantaran container, mula cepat, produksi, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): API REST mesra pemula dengan skala-ke-nol, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Senibina Mikroservis](../../examples/container-app/microservices): Penghantaran pelbagai perkhidmatan siap produksi (API Gateway, Produk, Pesanan, Pengguna, Notifikasi), pemesejan tak segerak, Service Bus, Cosmos DB, Azure SQL, penjejakan diedarkan, penghantaran biru-hijau/canary
- **Amalan Terbaik**: Panduan keselamatan, pemantauan, pengoptimuman kos, dan CI/CD untuk beban kerja containerized
- **Contoh Kod**: `azure.yaml` lengkap, templat Bicep, dan pelaksanaan perkhidmatan pelbagai bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung ke hujung, perintah pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemas kini untuk memaparkan dan memaut contoh aplikasi bekas baru di bawah "Contoh Tempatan - Aplikasi Bekas"
- **examples/README.md**: Dikemas kini untuk menyerlahkan contoh aplikasi bekas, menambah entri matriks perbandingan, dan mengemas kini rujukan teknologi/arsitektur
- **Garis Panduan Kursus & Panduan Pengajian**: Dikemas kini untuk merujuk contoh aplikasi bekas baru dan corak penyebaran dalam bab berkaitan

#### Disahkan
- ✅ Semua contoh baru boleh disebarkan dengan `azd up` dan mengikuti amalan terbaik
- ✅ Pautan silang dokumentasi dan navigasi dikemas kini
- ✅ Contoh meliputi senario pemula hingga lanjutan, termasuk mikroservis pengeluaran

#### Nota
- **Skop**: Dokumentasi dan contoh Bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak bekas lanjutan tambahan dan automasi CI/CD dalam keluaran akan datang

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk secara menyeluruh dari "Microsoft Foundry" ke "Microsoft Foundry" di seluruh dokumentasi Bahasa Inggeris, mencerminkan penjenamaan rasmi Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula lengkap dari "Microsoft Foundry" ke "Microsoft Foundry"
  - Dikemas kini semua rujukan seluruh dokumentasi Bahasa Inggeris dalam folder `docs/`
  - Penamaan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Penamaan semula fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini dalam 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula kepada `docs/microsoft-foundry/`
  - Semua pautan silang dikemas kini untuk mencerminkan struktur folder baru
  - Pautan navigasi disahkan dalam semua dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini untuk rujuk nama fail baru

#### Fail Dikemas Kini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari kemas kini terdahulu)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan silang dikemas kini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemas kini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemas kini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemas kini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemas kini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran kursus, tajuk bab, seksyen templat, pandangan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran keseluruhan, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen Bahasa Inggeris
- ✅ Tiada lagi rujukan nama produk "Microsoft Foundry" dalam dokumen Bahasa Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baru
- ✅ Penamaan semula fail dan folder berjaya diselesaikan
- ✅ Pautan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan hanya digunakan pada dokumentasi Bahasa Inggeris dalam folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk penamaan lama (akan diatasi dalam kemas kini akan datang)
- **Pautan Luaran**: URL luaran dan rujukan repositori GitHub kekal tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cabang tempatan atau dokumentasi merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dokumentasi dalaman masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratonton Infrastruktur dan Penambahbaikan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton Azure Developer CLI baru dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan menyeluruh keupayaan pratonton infrastruktur baru
  - Rujukan perintah dan contoh penggunaan dalam helaian cheat
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan awal untuk pengesahan penyebaran lebih selamat
  - Kemas kini panduan permulaan dengan amalan penyebaran keselamatan terlebih dahulu
- **🚧 Sepanduk Status Bengkel**: Sepanduk HTML profesional yang menunjukkan status pembangunan bengkel
  - Reka bentuk gradien dengan penunjuk pembinaan untuk komunikasi pengguna jelas
  - Cap waktu kemas kini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Diperbaiki
- **Keselamatan Infrastruktur**: Fungsi pratonton diintegrasikan seluruh dokumentasi penyebaran
- **Pengesahan Pra-penyebaran**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan arahan dikemas kini untuk memasukkan pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan jelas ditetapkan untuk pengguna mengenai status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Penyebaran**: Aliran kerja pratonton-dulu kini pendekatan disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Pembentangan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan jelas

#### Diperbaiki
- **Pendekatan Keselamatan Terlebih Dahulu**: Perubahan infrastruktur kini boleh disahkan sebelum penyebaran
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Pemahaman lebih baik kos sumber sebelum penyediaan
- **Mitigasi Risiko**: Pengurangan kegagalan penyebaran melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-dokumen**: Ciri pratonton didokumenkan dalam 4 fail utama
- **Corak Perintah**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton disertakan dalam aliran kerja dan skrip pengesahan
- **Penunjuk Visual**: Tanda ciri BARU jelas untuk penemuan mudah

#### Infrastruktur Bengkel
- **Komunikasi Status**: Sepanduk HTML profesional dengan stilasi gradien
- **Pengalaman Pengguna**: Status pembangunan jelas mengelakkan kekeliruan
- **Pembentangan Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap waktu kemas kini terakhir Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel Diperbaiki dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel menyeluruh dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs
- **📝 Arahan Bengkel Berstruktur**: Laluan pembelajaran berpandukan 7 langkah dari penemuan hingga pengubahsuaian
  - 0-Pengenalan: Gambaran keseluruhan bengkel dan penyediaan
  - 1-Pilih-Templat-AI: Penemuan dan proses pemilihan templat
  - 2-Sahkan-Templat-AI: Prosedur penyebaran dan pengesahan
  - 3-Bongkar-Templat-AI: Memahami seni bina templat
  - 4-Konfigurasikan-Templat-AI: Konfigurasi dan pengubahsuaian
  - 5-Kustom-Templat-AI: Pengubahsuaian dan iterasi lanjutan
  - 6-Bongkar-Infrastruktur: Pembersihan dan pengurusan sumber
  - 7-Ringkasan: Rumusan dan langkah seterusnya
- **🛠️ Alat Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran dipertingkatkan
- **🎯 Laluan Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Penyebaran → Pengubahsuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan lancar

#### Diperbaiki
- **Makmal Bengkel AI**: Diperluas dengan pengalaman pembelajaran berstruktur 2-3 jam menyeluruh
- **Dokumentasi Bengkel**: Pembentangan profesional dengan navigasi dan bantuan visual
- **Progresi Pembelajaran**: Panduan langkah demi langkah jelas dari pemilihan templat hingga penyebaran pengeluaran
- **Pengalaman Pembangun**: Alat terintegrasi untuk aliran kerja pembangunan lancar

#### Diperbaiki
- **Kebolehcapaian**: Antara muka berasaskan pelayar dengan carian, fungsi salin dan togol tema
- **Pembelajaran Kendiri**: Struktur bengkel fleksibel sesuai untuk kelajuan pembelajaran berbeza
- **Aplikasi Praktikal**: Senario penyebaran templat AI dunia sebenar
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan dan kerjasama bengkel

#### Ciri Bengkel
- **Carian Terbina Dalam**: Penemuan kata kunci dan pelajaran pantas
- **Salin Blok Kod**: Fungsi salin semasa melayang untuk semua contoh kod
- **Togol Tema**: Sokongan mod gelap/terang mengikut pilihan pengguna
- **Aset Visual**: Tangkapan skrin dan rajah untuk pemahaman dipertingkatkan
- **Integrasi Bantuan**: Akses terus Discord untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penstrukturan Semula Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab menyeluruh dengan navigasi dipertingkatkan di seluruh repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Penyusunan semula keseluruhan kursus kepada 8 bab pembelajaran progresif
  - Bab 1: Asas & Permulaan Pantas (⭐ - 30-45 minit)
  - Bab 2: Pembangunan AI-Pertama (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Multi-Ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan & Perancangan Pra-Penyebaran (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Penyahpepijatan (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Pengeluaran & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Menyeluruh**: Header dan footer navigasi konsisten di seluruh dokumentasi
- **🎯 Penjejakan Progres**: Senarai semak penyelesaian kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Laluan Pembelajaran**: Titik masuk jelas untuk tahap pengalaman dan matlamat berbeza
- **🔗 Navigasi Pautan Silang**: Bab berkaitan dan prasyarat dipautkan dengan jelas

#### Diperbaiki
- **Struktur README**: Ditukar menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap halaman kini termasuk konteks bab dan panduan progresi
- **Organisasi Templat**: Contoh dan templat dipadankan dengan bab pembelajaran yang sesuai
- **Integrasi Sumber**: Helaian cheat, Soalan Lazim, dan panduan pengajian dihubungkan dengan bab berkaitan
- **Integrasi Bengkel**: Makmal praktikal dipadankan dengan objektif pembelajaran pelbagai bab

#### Diubah
- **Progresi Pembelajaran**: Berpindah dari dokumentasi linear ke pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi diposiskan sebagai Bab 3 untuk aliran pembelajaran lebih baik
- **Integrasi Kandungan AI**: Kandungan khusus AI lebih baik diintegrasikan sepanjang perjalanan pembelajaran
- **Kandungan Pengeluaran**: Corak lanjutan dikonsolidasi dalam Bab 8 untuk pelajar perusahaan

#### Diperbaiki
- **Pengalaman Pengguna**: Breadcrumb navigasi jelas dan penunjuk progres bab
- **Kebolehcapaian**: Corak navigasi konsisten memudahkan perjalanan kursus
- **Pembentangan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa untuk mencari kandungan berkaitan dikurangkan melalui organisasi dipertingkatkan

#### Pelaksanaan Teknikal
- **Header Navigasi**: Navigasi bab standard dalam 40+ fail dokumentasi
- **Footer Navigasi**: Panduan progresi konsisten dan penunjuk siap bab
- **Pautan Silang**: Sistem pautan dalaman menyeluruh menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh dikaitkan dengan objektif pembelajaran dengan jelas

#### Penambahbaikan Panduan Pengajian
- **📚 Objektif Pembelajaran Menyeluruh**: Panduan pengajian disusun semula sejajar dengan sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab mengandungi objektif pembelajaran khusus dan latihan praktikal
- **📋 Penjejakan Progres**: Jadual pembelajaran mingguan dengan hasil yang boleh diukur dan senarai semak siap
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti praktikal dengan senario penyebaran sebenar dan penyelesaian masalah
- **📊 Progresi Kemahiran**: Kemajuan jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya
- **🎓 Rangka Pensijilan**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran 10 minggu berstruktur dengan pengesahan mileston

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Multi-Ejen Diperbaiki
**Versi ini memperbaiki penyelesaian runcit multi-ejen dengan penamaan ejen lebih baik dan dokumentasi dipertingkatkan.**

#### Diubah
- **Terminologi Multi-Ejen**: Menggantikan "ejen Cora" dengan "ejen Pelanggan" di seluruh penyelesaian runcit multi-ejen untuk kefahaman lebih jelas
- **Seni Bina Ejen**: Dikemaskini semua dokumentasi, templat ARM, dan contoh kod untuk menggunakan penamaan "ejen Pelanggan" konsisten
- **Contoh Konfigurasi**: Corak konfigurasi ejen dimodenkan dengan konvensyen penamaan dikemas kini
- **Konsistensi Dokumentasi**: Memastikan semua rujukan menggunakan nama ejen yang profesional dan deskriptif

#### Diperbaiki
- **Pakej Templat ARM**: Dikemaskini retail-multiagent-arm-template dengan rujukan ejen Pelanggan
- **Rajah Seni Bina**: Rajah Mermaid diperkemas dengan penamaan ejen yang dikemas kini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pembolehubah Persekitaran**: Dikemaskini semua skrip penyebaran untuk menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Penambahbaikan
- **Pengalaman Pembangun**: Peranan dan tanggungjawab ejen yang lebih jelas dalam dokumentasi
- **Kesediaan Pengeluaran**: Penjajaran lebih baik dengan konvensyen penamaan perusahaan
- **Bahan Pembelajaran**: Penamaan ejen yang lebih intuitif untuk tujuan pendidikan
- **Kebolehgunaan Templat**: Memudahkan pemahaman fungsi ejen dan corak penyebaran

#### Butiran Teknikal
- Dikemaskini rajah seni bina Mermaid dengan rujukan CustomerAgent
- Digantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Diubah suai konfigurasi JSON templat ARM untuk menggunakan jenis ejen "customer"
- Dikemaskini pembolehubah persekitaran dari CORA_AGENT_* kepada corak CUSTOMER_AGENT_*
- Penyegar semula semua arahan penyebaran dan konfigurasi bekas

### [v3.0.0] - 2025-09-12

#### Perubahan Utama - Fokus Pembangun AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran berfokus AI yang komprehensif dengan integrasi Microsoft Foundry.**

#### Ditambah
- **🤖 Laluan Pembelajaran AI-Pertama**: Penstrukturan semula lengkap mengutamakan pembangun dan jurutera AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi komprehensif untuk menghubungkan AZD dengan perkhidmatan Microsoft Foundry
- **Corak Penyebaran Model AI**: Panduan terperinci merangkumi pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **Makmal Bengkel AI**: Bengkel praktikal 2-3 jam untuk menukar aplikasi AI kepada penyelesaian boleh disebar AZD
- **Amalan Terbaik AI Produksi**: Corak bersedia perusahaan untuk penalaan skala, pemantauan, dan keselamatan beban kerja AI
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah komprehensif untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan isu penyebaran AI
- **Galeri Templat AI**: Koleksi templat Microsoft Foundry terpilih dengan penarafan kerumitan
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan

#### Diperkukuh
- **Struktur README**: Fokus pembangun AI dengan 45% data minat komuniti dari Microsoft Foundry Discord
- **Laluan Pembelajaran**: Perjalanan pembangun AI khusus bersama laluan tradisional untuk pelajar dan jurutera DevOps
- **Cadangan Templat**: Templat AI terpilih termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komuniti**: Sokongan komuniti Discord diperkasa dengan saluran dan perbincangan khusus AI

#### Fokus Keselamatan & Produksi
- **Corak Identiti Terurus**: Konfigurasi pengesahan dan keselamatan khusus AI
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI
- **Penyebaran Pelbagai Wilayah**: Strategi penyebaran aplikasi AI global
- **Pemantauan Prestasi**: Metik khusus AI dan integrasi Application Insights

#### Kualiti Dokumentasi
- **Struktur Kursus Linear**: Progresi logik dari pemula hingga corak penyebaran AI maju
- **URL Yang Disahkan**: Semua pautan repositori luar diperiksa dan boleh diakses
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi
- **Sedia Produksi**: Corak penyebaran perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Utama - Penstrukturan Semula Repositori dan Penambahbaikan Profesional
**Versi ini mewakili pembaharuan besar dalam struktur repositori dan penyampaian kandungan.**

#### Ditambah
- **Kerangka Pembelajaran Berstruktur**: Semua halaman dokumentasi kini termasuk pendahuluan, matlamat pembelajaran, dan hasil pembelajaran
- **Sistem Navigasi**: Tambah pautan Pelajaran Sebelumnya/Seterusnya sepanjang dokumentasi untuk kemajuan pembelajaran terpandu
- **Panduan Kajian**: study-guide.md komprehensif dengan objektif pembelajaran, latihan praktikal, dan bahan penilaian
- **Penampilan Profesional**: Semua ikon emoji dibuang untuk aksesibiliti dan penampilan profesional yang lebih baik
- **Struktur Kandungan Dipertingkat**: Penataan dan aliran bahan pembelajaran yang diperbaiki

#### Ditukar
- **Format Dokumentasi**: Standardisasi semua dokumentasi dengan struktur fokus pembelajaran yang konsisten
- **Aliran Navigasi**: Pelaksanaan progresi logik melalui semua bahan pembelajaran
- **Penyampaian Kandungan**: Pembuangan elemen hiasan demi format profesional dan jelas
- **Struktur Pautan**: Dikemaskini semua pautan dalaman untuk menyokong sistem navigasi baru

#### Penambahbaikan
- **Aksesibiliti**: Buang kebergantungan emoji bagi keserasian pembaca skrin yang lebih baik
- **Penampilan Profesional**: Penyampaian bergaya akademik bersih sesuai untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil jelas bagi setiap pelajaran
- **Organisasi Kandungan**: Aliran dan hubungan logik yang lebih baik antara topik berkaitan

### [v1.0.0] - 2025-09-09

#### Pelancaran Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambah
- **Struktur Dokumentasi Teras**
  - Siri panduan bermula lengkap
  - Dokumentasi penyebaran dan penyediaan komprehensif
  - Sumber penyelesaian masalah terperinci dan panduan debug
  - Alat dan prosedur pengesahan pra-penyebaran

- **Modul Bermula**
  - AZD Asas: Konsep dan istilah teras
  - Panduan Pemasangan: Arahan persediaan spesifik platform
  - Panduan Konfigurasi: Persediaan persekitaran dan pengesahan
  - Tutorial Projek Pertama: Pembelajaran praktikal langkah demi langkah

- **Modul Penyebaran dan Penyediaan**
  - Panduan Penyebaran: Dokumentasi aliran kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kod dengan Bicep
  - Amalan terbaik untuk penyebaran produksi
  - Corak seni bina berbilang perkhidmatan

- **Modul Validasi Pra-penyebaran**
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure
  - Pemilihan SKU: Panduan terperinci tahap perkhidmatan
  - Pemeriksaan Pra-Penerbangan: Skrip pengesahan automatik (PowerShell dan Bash)
  - Anggaran kos dan alat perancangan bajet

- **Modul Penyelesaian Masalah**
  - Isu Lazim: Masalah dan penyelesaian kerap ditemui
  - Panduan Debugging: Kaedah penyelesaian masalah sistematik
  - Teknik dan alat diagnostik lanjutan
  - Pemantauan prestasi dan pengoptimuman

- **Sumber dan Rujukan**
  - Lembaran Pasca Arahan: Rujukan cepat arahan penting
  - Glosari: Definisi lengkap istilah dan akronim
  - Soalan Lazim: Jawapan terperinci kepada soalan biasa
  - Pautan sumber luar dan sambungan komuniti

- **Contoh dan Templat**
  - Contoh Aplikasi Web Mudah
  - Templat penyebaran Laman Web Statik
  - Konfigurasi Aplikasi Kontena
  - Corak integrasi Pangkalan Data
  - Contoh seni bina Mikroskhala
  - Pelaksanaan fungsi tanpa pelayan

#### Ciri-ciri
- **Sokongan Pelbagai Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux
- **Tahap Kemahiran Pelbagai**: Kandungan direka untuk pelajar hingga pembangun profesional
- **Fokus Praktikal**: Contoh praktikal dan senario dunia nyata
- **Liputan Komprehensif**: Dari konsep asas hingga corak perusahaan maju
- **Pendekatan Keselamatan Utama**: Amalan keselamatan terbaik disepadukan sepanjang masa
- **Pengoptimuman Kos**: Panduan untuk penyebaran kos efektif dan pengurusan sumber

#### Kualiti Dokumentasi
- **Contoh Kod Terperinci**: Sampel kod praktikal dan diuji
- **Arahan Langkah demi Langkah**: Panduan jelas dan boleh diambil tindakan
- **Pengendalian Ralat Komprehensif**: Penyelesaian masalah isu umum
- **Integrasi Amalan Terbaik**: Standard industri dan cadangan
- **Keserasian Versi**: Dikemaskini dengan perkhidmatan Azure dan ciri azd terkini

## Penambahbaikan Masa Depan Dirancang

### Versi 3.1.0 (Dirancang)
#### Pengembangan Platform AI
- **Sokongan Multi-Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model tersuai
- **Rangka Kerja Ejen AI**: Templat untuk LangChain, Semantic Kernel, dan penyebaran AutoGen
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor selain Azure AI Search (Pinecone, Weaviate, dll.)
- **Kebolehlihatan AI**: Pemantauan ditingkatkan untuk prestasi model, penggunaan token, dan kualiti respons

#### Pengalaman Pembangun
- **Sambungan VS Code**: Pengalaman pembangunan integrasi AZD + Microsoft Foundry
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengkodan praktikal dengan pengesahan automatik untuk senario AI
- **Kandungan Video**: Tutorial video tambahan untuk pelajar visual fokus pada penyebaran AI

### Versi 4.0.0 (Dirancang)
#### Corak AI Perusahaan
- **Rangka Kerja Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit
- **AI Pelbagai Penyewa**: Corak untuk melayani pelbagai pelanggan dengan perkhidmatan AI berasingan
- **Penyebaran AI Tepi**: Integrasi dengan Azure IoT Edge dan instans kontena
- **AI Hibrid Awan**: Corak penyebaran multi-awan dan hibrid untuk beban kerja AI

#### Ciri Lanjutan
- **Automasi Paip AI**: Integrasi MLOps dengan paip Azure Machine Learning
- **Keselamatan Lanjutan**: Corak zero-trust, titik akhir peribadi, dan perlindungan ancaman lanjutan
- **Pengoptimuman Prestasi**: Penalaan dan strategi penskalaan lanjutan untuk aplikasi AI berkapasiti tinggi
- **Pengedaran Global**: Corak penyampaian kandungan dan cache tepi untuk aplikasi AI

### Versi 3.0.0 (Dirancang) - Digantikan oleh Pelepasan Semasa
#### Tambahan Dicadangkan - Kini Dilaksanakan dalam v3.0.0
- ✅ **Kandungan Berfokus AI**: Integrasi Microsoft Foundry komprehensif (Selesai)
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Selesai)
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Selesai)
- ✅ **Pengoptimuman Prestasi**: Strategi penalaan beban kerja AI (Selesai)

### Versi 2.1.0 (Dirancang) - Sebahagian Dilaksanakan dalam v3.0.0
#### Penambahbaikan Minor - Beberapa Selesai dalam Pelepasan Semasa
- ✅ **Contoh Tambahan**: Senario penyebaran berfokus AI (Selesai)
- ✅ **FAQ Diperluas**: Soalan dan penyelesaian masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan penyunting dipertingkat
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan amaran khusus AI (Selesai)

#### Masih Dirancang untuk Pelepasan Akan Datang
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih
- **Akses Luar Talian**: Pek dokumentasi boleh dimuat turun
- **Integrasi IDE Dipertingkat**: Sambungan VS Code untuk aliran kerja AZD + AI
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan

## Menyumbang kepada Log Perubahan

### Melaporkan Perubahan
Apabila menyumbang kepada repositori ini, pastikan entri log perubahan termasuk:

1. **Nombor Versi**: Mengikut penomboran versi semantik (major.minor.patch)
2. **Tarikh**: Tarikh pelepasan atau kemaskini dalam format YYYY-MM-DD
3. **Kategori**: Ditambah, Ditukar, Dihentikan, Dikeluarkan, Diperbaiki, Keselamatan
4. **Deskripsi Jelas**: Penerangan ringkas tentang apa yang berubah
5. **Penilaian Impak**: Bagaimana perubahan menjejaskan pengguna sedia ada

### Kategori Perubahan

#### Ditambah
- Ciri baru, bahagian dokumentasi, atau keupayaan
- Contoh, templat, atau sumber pembelajaran baru
- Alat tambahan, skrip, atau utiliti

#### Ditukar
- Pengubahsuaian fungsi atau dokumentasi sedia ada
- Kemaskini untuk meningkatkan kejelasan atau ketepatan
- Penstrukturan semula kandungan atau organisasi

#### Dihentikan
- Ciri atau pendekatan yang akan dihentikan
- Bahagian dokumentasi yang dijadual disingkirkan
- Kaedah yang mempunyai alternatif lebih baik

#### Dikeluarkan
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan
- Maklumat usang atau pendekatan dihapuskan
- Kandungan berlebihan atau digabungkan

#### Diperbaiki
- Pembetulan ralat dalam dokumentasi atau kod
- Penyelesaian isu atau masalah yang dilaporkan
- Penambahbaikan ketepatan atau fungsi

#### Keselamatan
- Penambahbaikan atau pembaikan berkaitan keselamatan
- Kemaskini amalan terbaik keselamatan
- Penyelesaian kelemahan keselamatan

### Panduan Penomboran Versi Semantik

#### Versi Major (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Penstrukturan semula kandungan atau organisasi yang signifikan
- Perubahan yang menukar pendekatan atau metodologi asas

#### Versi Minor (X.Y.0)
- Ciri baru atau tambahan kandungan
- Penambahbaikan yang mengekalkan keserasian ke belakang
- Contoh, alat, atau sumber tambahan

#### Versi Patch (X.Y.Z)
- Pembetulan pepijat dan kesalahan
- Penambahbaikan minor pada kandungan sedia ada
- Penjelasan dan peningkatan kecil

## Maklum Balas dan Cadangan Komuniti

Kami menggalakkan maklum balas komuniti untuk memperbaiki sumber pembelajaran ini:

### Cara Memberi Maklum Balas
- **Isu GitHub**: Laporkan masalah atau cadangkan penambahbaikan (isu khusus AI dialu-alukan)
- **Perbincangan Discord**: Kongsi idea dan terlibat dengan komuniti Microsoft Foundry
- **Permintaan Tarik**: Sumbang penambahbaikan langsung ke kandungan, terutamanya templat dan panduan AI
- **Discord Microsoft Foundry**: Sertai saluran #Azure untuk perbincangan AZD + AI
- **Forum Komuniti**: Terlibat dalam perbincangan pembangun Azure yang lebih luas

### Kategori Maklum Balas
- **Ketepatan Kandungan AI**: Pembetulan maklumat integrasi dan penyebaran perkhidmatan AI
- **Pengalaman Pembelajaran**: Cadangan untuk memperbaiki aliran pembelajaran pembangun AI
- **Kandungan AI Hilang**: Permintaan templat, corak, atau contoh AI tambahan
- **Aksesibiliti**: Penambahbaikan untuk keperluan pembelajaran pelbagai
- **Integrasi Alat AI**: Cadangan peningkatan aliran kerja pembangunan AI
- **Corak AI Produksi**: Permintaan corak penyebaran AI perusahaan

### Komitmen Respons
- **Respons Isu**: Dalam masa 48 jam untuk masalah yang dilaporkan
- **Permintaan Ciri**: Penilaian dalam masa seminggu
- **Sumbangan Komuniti**: Semakan dalam masa seminggu
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan

## Jadual Penyelenggaraan

### Kemas Kini Berkala
- **Ulasan Bulanan**: Ketepatan kandungan dan pengesahan pautan
- **Kemas Kini Suku Tahunan**: Penambahan dan penambahbaikan kandungan besar
- **Ulasan Setengah Tahunan**: Penstrukturan semula dan penambahbaikan komprehensif
- **Pelepasan Tahunan**: Kemas kini versi major dengan penambahbaikan ketara

### Pemantauan dan Jaminan Kualiti
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan
- **Integrasi Maklum Balas Komuniti**: Penggabungan berkala cadangan pengguna
- **Kemas Kini Teknologi**: Penyelarasan dengan perkhidmatan Azure dan ciri azd terkini
- **Audit Aksesibiliti**: Semakan berkala prinsip reka bentuk inklusif

## Polisi Sokongan Versi Semasa
- **Versi Utama Terkini**: Sokongan penuh dengan kemas kini berkala  
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembetulan kritikal selama 12 bulan  
- **Versi Warisan**: Sokongan komuniti sahaja, tiada kemas kini rasmi  

### Panduan Migrasi  
Apabila versi utama dikeluarkan, kami menyediakan:  
- **Panduan Migrasi**: Arahan peralihan langkah demi langkah  
- **Nota Keserasian**: Butiran tentang perubahan yang memecahkan  
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi  
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Panduan Kajian](resources/study-guide.md)  
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)  

**Sentiasa Dikemas Kini**: Pantau repositori ini untuk pemberitahuan mengenai pelepasan baru dan kemas kini penting kepada bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, harap maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidakakuratan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->