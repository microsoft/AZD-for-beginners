# Changelog - AZD Untuk Pemula

## Pengenalan

Changelog ini mendokumentasikan semua perubahan, kemas kini, dan penambahbaikan yang ketara kepada repositori AZD Untuk Pemula. Kami mengikuti prinsip penomboran semantik dan menyelenggara log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan meneliti changelog ini, anda akan:
- Sentiasa maklum mengenai ciri baru dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Menjejak pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas meneliti entri changelog, anda akan dapat:
- Mengenal pasti kandungan dan sumber baru yang tersedia untuk pembelajaran
- Memahami bahagian mana yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Menyumbang maklum balas dan cadangan untuk penambahbaikan masa hadapan

## Sejarah Versi

### [v3.18.0] - 2026-03-16

#### Perintah AZD AI CLI, Pengesahan Kandungan & Pengembangan Templat
**Versi ini menambah liputan arahan `azd ai`, `azd extension`, dan `azd mcp` merentasi semua bab berkaitan AI, membaiki pautan rosak dan kod lapuk dalam agents.md, mengemas kini helaian cheat, dan memperbaharui bahagian Templat Contoh dengan penerangan yang disahkan dan templat Azure AI AZD baru.**

#### Ditambah
- **🤖 Liputan AZD AI CLI** merentasi 7 fail (sebelumnya hanya dalam Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bahagian baru "Extensions and AI Commands" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pilihan 4: `azd ai agent init` dengan jadual perbandingan (templat vs pendekatan fail manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subbahagian "AZD Extensions for Foundry" dan "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Permulaan Pantas kini menunjukkan kedua-dua laluan penyebaran berasaskan templat dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bahagian Deploy kini memasukkan pilihan `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subbahagian "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bahagian baru "AI & Extensions Commands" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Perbualan RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan sokongan sembang suara
  - **azure-search-openai-demo-java** — Perbualan RAG Java menggunakan Langchain4J dengan pilihan penyebaran ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif multi-ejen menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa pelayan menggunakan Azure Functions + LangChain.js + Cosmos DB dengan sokongan pembangunan tempatan Ollama
  - **chat-with-your-data-solution-accelerator** — Pecutan RAG perusahaan dengan portal pentadbir, integrasi Teams, dan pilihan PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi rujukan orkestras MCP multi-ejen dengan pelayan dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat permulaan Bicep infrastruktur Azure AI minimal
  - **🔗 Pautan Galeri AZD AI Hebat** — Rujukan ke [galeri awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Dibaiki
- **🔗 navigasi agents.md**: Pautan Sebelumnya/Seterusnya kini selari dengan susunan pelajaran README Bab 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 pautan rosak agents.md**: `production-ai-practices.md` diperbetulkan kepada `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 kod lapuk agents.md**: Gantikan `opencensus` dengan `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API tidak sah agents.md**: Alih `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 pengiraan token agents.md**: Gantikan anggaran kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Betulkan perkhidmatan daripada "Cognitive Search + App Service" kepada "Azure AI Search + Azure Container Apps" (hos lalai diubah Oktober 2024)
- **contoso-chat**: Kemas kini penerangan untuk merujuk Azure AI Foundry + Prompty, selaras dengan tajuk repo dan teknologi sebenar

#### Dibuang
- **ai-document-processing**: Buang rujukan templat tidak berfungsi (repo tidak boleh diakses secara umum sebagai templat AZD)

#### Ditingkatkan
- **📝 latihan agents.md**: Latihan 1 kini menunjukkan output jangkaan dan langkah `azd monitor`; Latihan 2 termasuk kod pendaftaran penuh `FunctionTool`; Latihan 3 menggantikan panduan kabur dengan arahan `prepdocs.py` konkrit
- **📚 sumber agents.md**: Kemas kini pautan dokumentasi kepada dokumen Azure AI Agent Service dan permulaan pantas terkini
- **📋 Jadual Langkah Seterusnya agents.md**: Tambah pautan Bengkel AI untuk liputan bab lengkap

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
- **Jadual Peta Kursus**: Dipertingkatkan dengan pautan pelajaran langsung, anggaran tempoh, dan penarafan kerumitan
- **Pembersihan Folder**: Buang folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pengesahan Pautan**: Semak semua 21+ pautan dalaman dalam Jadual Peta Kursus

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk
**Versi ini mengemas kini rujukan produk kepada penjenamaan semasa Microsoft.**

#### Diubah
- **Microsoft Foundry → Microsoft Foundry**: Semua rujukan dikemas kini merentasi fail bukan terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama perkhidmatan dikemas kini untuk mencerminkan penjenamaan semasa

#### Fail Dikemaskini
- `README.md` - Halaman utama kursus
- `changelog.md` - Sejarah versi
- `course-outline.md` - Struktur kursus
- `docs/chapter-02-ai-development/agents.md` - Panduan ejen AI
- `examples/README.md` - Dokumentasi contoh
- `workshop/README.md` - Halaman utama bengkel
- `workshop/docs/index.md` - Indeks bengkel
- `workshop/docs/instructions/*.md` - Semua fail arahan bengkel

---

### [v3.15.0] - 2026-02-05

#### Penstrukturan Semula Repositori Utama: Nama Folder Berdasarkan Bab
**Versi ini menstrukturkan semula dokumentasi ke dalam folder bab khusus untuk navigasi lebih jelas.**

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
- **📚 Fail README Bab**: Cipta README.md dalam setiap folder bab dengan:
  - Objektif pembelajaran dan tempoh
  - Jadual pelajaran dengan penerangan
  - Arahan mula cepat
  - Navigasi ke bab lain

#### Diubah
- **🔗 Kemas kini semua pautan dalaman**: Lebih 78 laluan dikemas kini merentasi semua fail dokumentasi
- **🗺️ README.md utama**: Kemas kini Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Kemas kini rujukan silang kepada folder bab

#### Dibuang
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Penstrukturan Semula Repositori: Navigasi Bab
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Ejen AI Baru
**Versi ini menambahkan panduan komprehensif untuk penyebaran ejen AI dengan Azure Developer CLI.**

#### Ditambah
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap meliputi:
  - Apa itu ejen AI dan bagaimana ia berbeza dengan chatbot
  - Tiga templat ejen mula cepat (Foundry Agents, Prompty, RAG)
  - Corak seni bina ejen (ejen tunggal, RAG, multi-ejen)
  - Konfigurasi alat dan pengubahsuaian
  - Pemantauan dan penjejakan metrik
  - Pertimbangan kos dan pengoptimuman
  - Situasi penyelesaian masalah biasa
  - Tiga latihan praktikal dengan kriteria kejayaan

#### Struktur Kandungan
- **Pengenalan**: Konsep ejen untuk pemula
- **Mula Cepat**: Sebar ejen dengan `azd init --template get-started-with-ai-agents`
- **Corak Seni Bina**: Rajah visual corak ejen
- **Konfigurasi**: Persediaan alat dan pembolehubah persekitaran
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktikal progresif (20-45 minit setiap satu)

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer
**Versi ini mengemas kini konfigurasi kontena pembangunan dengan alat moden dan tetapan lalai lebih baik untuk pengalaman pembelajaran AZD.**

#### Diubah
- **🐳 Imej Asas**: Dikemas kini dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terkini)
- **📛 Nama Kontena**: Ditukar dari "Python 3" kepada "AZD for Beginners" untuk kejelasan

#### Ditambah
- **🔧 Ciri Baru Dev Container**:
  - `azure-cli` dengan sokongan Bicep diaktifkan
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk pengurusan templat
  - `docker-in-docker` untuk pengedaran aplikasi kontena

- **🔌 Penalaan Port**: Port pra-konfigurasi untuk pembangunan biasa:
  - 8000 (pratonton MkDocs)
  - 3000 (aplikasi Web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Sambungan VS Code Baru**:
  - `ms-python.vscode-pylance` - IntelliSense Python dipertingkatkan
  - `ms-azuretools.vscode-azurefunctions` - sokongan Azure Functions
  - `ms-azuretools.vscode-docker` - sokongan Docker
  - `ms-azuretools.vscode-bicep` - sokongan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - pengurusan sumber Azure
  - `yzhang.markdown-all-in-one` - penyuntingan Markdown
  - `DavidAnson.vscode-markdownlint` - pengauditan Markdown
  - `bierner.markdown-mermaid` - sokongan diagram Mermaid
  - `redhat.vscode-yaml` - sokongan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - visualisasi Git
  - `mhutchie.git-graph` - sejarah Git

- **⚙️ Tetapan VS Code**: Ditambah tetapan lalai untuk interpreter Python, format semasa simpan, dan pembuangan ruang kosong

- **📦 Kemaskini requirements-dev.txt**:
  - Ditambah plugin MkDocs minify
  - Ditambah pre-commit untuk kualiti kod
  - Ditambah pakej Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Arahan Post-Create**: Kini mengesahkan pemasangan AZD dan Azure CLI semasa permulaan kontena

---

### [v3.11.0] - 2026-02-05

#### Pembaharuan README Mesra Pemula
**Versi ini meningkatkan README.md dengan ketara untuk lebih mudah diakses oleh pemula dan menambah sumber penting untuk pembangun AI.**

#### Ditambah
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas bila menggunakan setiap alat dengan contoh praktikal
- **🌟 Pautan Hebat AZD**: Pautan langsung ke galeri templat komuniti dan sumber penyumbang:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templat sedia digunakan
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti
- **🎯 Panduan Mula Pantas**: Seksiyen dimulakan ringkas 3 langkah (Pasang → Log masuk → Sebarkan)
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas tentang dimana hendak mula berdasarkan pengalaman pembangun

#### Diubah
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat utama dahulu
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" untuk pemula sepenuhnya
- **Membuang Kandungan Pendua**: Menghapus seksyen penyelesaian masalah pendua
- **Arahan Penyelesaian Masalah**: Memperbaiki rujukan `azd logs` kepada `azd monitor --logs` yang sah

#### Diperbaiki
- **🔐 Arahan Pengesahan**: Ditambah `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Rujukan Arahan Tidak Sah**: Menghapus baki `azd logs` dari seksyen penyelesaian masalah README

#### Nota
- **Skop**: Perubahan diaplikasikan ke README.md utama dan resources/cheat-sheet.md
- **Sasaran**: Penambahbaikan khusus untuk pembangun yang baru menggunakan AZD

---

### [v3.10.0] - 2026-02-05

#### Kemaskini Ketepatan Arahan Azure Developer CLI
**Versi ini membetulkan arahan AZD yang tidak wujud dalam dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Diperbaiki
- **🔧 Arahan AZD Tidak Wujud Dibuang**: Audit menyeluruh dan pembetulan arahan tidak sah:
  - `azd logs` (tidak wujud) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI
  - Sub-arahan `azd service` (tidak wujud) → digantikan dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak wujud) → dibuang atau digantikan dengan alternatif sah
  - Bendera `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dibuang
  - Bendera `azd provision --what-if/--rollback` (tidak wujud) → dikemaskini menggunakan `--preview`
  - `azd config validate` (tidak wujud) → digantikan dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dibuang

- **📚 Fail Dikemaskini dengan Pembetulan Arahan**:
  - `resources/cheat-sheet.md`: Penstrukturan semula rujukan arahan besar-besaran
  - `docs/deployment/deployment-guide.md`: Memperbaiki rollback dan strategi pengedaran
  - `docs/troubleshooting/debugging.md`: Membetulkan seksyen analisis log
  - `docs/troubleshooting/common-issues.md`: Mengemaskini arahan penyelesaian masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bahagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Membetulkan arahan pemantauan
  - `docs/getting-started/first-project.md`: Mengemas kini contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Membetulkan arahan paparan log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki arahan debugging agen

- **📝 Rujukan Versi Dikemaskini**: 
  - `docs/getting-started/installation.md`: Menukar versi terhardcode `1.5.0` ke `1.x.x` generik dengan pautan ke releas

#### Diubah
- **Strategi Rollback**: Dokumen dikemas kini menggunakan rollback berasaskan Git (AZD tidak mempunyai rollback asli)
- **Paparan Log**: Menggantikan rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan arahan Azure CLI
- **Bahagian Prestasi**: Menghapuskan bendera pengedaran selari/incremental yang tidak wujud, menyediakan alternatif sah

#### Perincian Teknikal
- **Arahan AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera sah azd monitor**: `--live`, `--logs`, `--overview`
- **Ciri Dibuang**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Arahan disahkan mengikut Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyempurnaan Bengkel dan Kualiti Dokumentasi
**Versi ini menyiapkan sepenuhnya modul bengkel interaktif, membaiki pautan dokumentasi patah, dan memperbaiki kualiti kandungan untuk pembangun AI menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen panduan sumbangan baru dengan:
  - Arahan jelas untuk laporan isu dan cadangan perubahan
  - Standard dokumentasi bagi kandungan baru
  - Panduan contoh kod dan konvensyen mesej komit
  - Maklumat penglibatan komuniti

#### Disiapkan
- **🎯 Modul Bengkel 7 (Penamat)**: Modul penamat lengkap dengan:
  - Ringkasan lengkap pencapaian bengkel
  - Bahagian konsep utama yang dikuasai meliputi AZD, templat, dan Microsoft Foundry
  - Cadangan penerusan pembelajaran
  - Latihan cabaran bengkel dengan penarafan kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Pembongkaran)**: Matlamat pembelajaran dikemas kini dengan:
  - Panduan pengaktifan GitHub Copilot dengan pelayan MCP
  - Memahami struktur folder templat AZD
  - Corak infrastruktur-sebagai-kod (Bicep)
  - Arahan makmal praktikal

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Lengkap dengan:
  - Matlamat pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk penyingkiran infrastruktur selamat
  - Panduan pemulihan perkhidmatan kognitif yang dihapuskan secara lembut
  - Cadangan explorasi bonus untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Pembaikan Pautan Patah**: Menyelesaikan 15+ pautan dokumen dalaman patah:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki laluan ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Meluruskan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Menggantikan cicd-integration.md yang tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki laluan faq dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Memperbetulkan laluan rumah kursus dan panduan penyebaran
  - `resources/faq.md` dan `resources/glossary.md`: Mengemas kini rujukan bab AI
  - `course-outline.md`: Memperbaiki panduan pengajar dan rujukan makmal bengkel AI

- **📅 Sepanduk Status Bengkel**: Dikemas kini dari "Sedang Dibina" ke status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Memperbaiki pautan navigasi patah dalam README.md bengkel menunjuk ke folder lab-1-azd-basics yang tidak wujud

#### Diubah
- **Pembentangan Bengkel**: Menghapus amaran "sedang dibina", bengkel kini lengkap dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul bengkel mempunyai navigasi antara modul yang betul
- **Rujukan Laluan Pembelajaran**: Mengemas kini rujukan silang bab untuk menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown Bahasa Inggeris mempunyai pautan dalaman sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan baik
- ✅ Kandungan sesuai untuk pembangun AI menggunakan Microsoft AZD
- ✅ Bahasa dan struktur mesra pemula dikekalkan sepanjang masa
- ✅ CONTRIBUTING.md memberikan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan dalaman .md
- **Audit Kandungan**: Semakan manual terhadap kesempurnaan bengkel dan kesesuaian pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul konsisten digunakan

#### Nota
- **Skop**: Perubahan diaplikasikan kepada dokumentasi Bahasa Inggeris sahaja
- **Terjemahan**: Folder terjemahan tidak dikemas kini dalam versi ini (terjemahan automatik akan diselaraskan kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan 3-4 jam pembelajaran praktikal

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Koordinasi Multi-Agen
**Versi ini menambah pelajaran tahap A komprehensif mengenai integrasi Application Insights, corak pengesahan, dan koordinasi multi-agen untuk pengedaran produksi.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Pengedaran fokus AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri tersuai (1,200+ baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Model Microsoft Foundry)
  - 6 diagram Mermaid (arsitektur, penjejakan teragih, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh kueri Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan debugging masa nyata
  - Masa pembelajaran 40-50 minit dengan corak sedia produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, identiti terurus)
  - Templat infrastruktur Bicep lengkap untuk pengedaran selamat
  - Kod aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (aktifkan identiti terurus, identiti ditugaskan pengguna, putaran Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan sedia produksi

- **🤖 Pelajaran Corak Koordinasi Multi-Agen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (berturutan, selari, hierarki, berasaskan acara, konsensus)
  - Pelaksanaan servis pengaturcara lengkap (Python/Flask, 1,500+ baris)
  - 3 pelaksanaan agen khusus (Penyelidikan, Penulis, Editor)
  - Integrasi Service Bus untuk antrian mesej
  - Pengurusan keadaan Cosmos DB untuk sistem teragih
  - 6 diagram Mermaid menunjukkan interaksi agen
  - 3 latihan lanjutan (pengurusan masa tamat, logik cuba semula, pemutus litar)
  - Perincian kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Diperhebat
- **Bab Pra-pengedaran**: Kini termasuk pelbagai corak pemantauan dan koordinasi
- **Bab Permulaan**: Dipertingkatkan dengan corak pengesahan profesional
- **Kesiapsiagaan Produksi**: Liputan lengkap dari keselamatan ke ketelusan
- **Rangka Kursus**: Dikemas kini untuk merujuk pelajaran baru dalam Bab 3 dan 6

#### Diubah
- **Progresi Pembelajaran**: Integrasi lebih baik corak keselamatan dan pemantauan sepanjang kursus
- **Kualiti Dokumentasi**: Standard B gred konsisten (95-97%) merentasi pelajaran baru
- **Corak Produksi**: Liputan lengkap hujung-ke-hujung untuk pengedaran perusahaan

#### Dipertingkatkan
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan pengeluaran
- **Standard Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Observabiliti**: Integrasi lengkap Application Insights dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Model Microsoft Foundry dan sistem multi-ejen

#### Disahkan
- ✅ Semua pelajaran termasuk kod kerja lengkap (bukan sekadar petikan)
- ✅ Rajah Mermaid untuk pembelajaran visual (19 jumlah keseluruhan merentas 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 jumlah)
- ✅ Templat Bicep sedia pengeluaran boleh dilancarkan melalui `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Titik pemeriksaan pengetahuan dengan arahan pengesahan

#### Keputusan Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan menyeluruh
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Seni bina multi-ejen lanjutan
- **Keseluruhan Kandungan Baharu**: - Standard kualiti tinggi yang konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + penjejakan diedarkan
- **Pengesahan**: Identiti Terurus + Key Vault + corak RBAC
- **Multi-Ejen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik masa nyata + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi persampelan, polisi penyimpanan, kawalan belanjawan

### [v3.7.0] - 2025-11-19

#### Penambahbaikan Kualiti Dokumentasi dan Contoh Model Microsoft Foundry Baharu
**Versi ini meningkatkan kualiti dokumentasi di seluruh repositori dan menambah contoh penerapan Model Microsoft Foundry lengkap dengan antara muka perbualan gpt-4.1.**

#### Ditambah
- **🤖 Contoh Perbualan Model Microsoft Foundry**: Penerapan lengkap gpt-4.1 dengan pelaksanaan berfungsi di `examples/azure-openai-chat/`:
  - Infrastruktur Model Microsoft Foundry lengkap (penerapan model gpt-4.1)
  - Antara muka perbualan baris arahan Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API yang selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Had kadar dan pengendalian ralat
  - README komprehensif dengan panduan penerapan 35-45 minit
  - 11 fail sedia pengeluaran (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Ditambah latihan praktikal dalam panduan konfigurasi:
  - Latihan 1: Konfigurasi berbilang persekitaran (15 minit)
  - Latihan 2: Latihan pengurusan rahsia (10 minit)
  - Kriteria kejayaan jelas dan langkah pengesahan
- **✅ Pengesahan Penerapan**: Ditambah seksyen pengesahan dalam panduan penerapan:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output dijangka untuk semua arahan penerapan
  - Rujukan pantas penyelesaian masalah

#### Ditingkatkan
- **examples/README.md**: Dikemas kini ke kualiti Gred A (93%):
  - Ditambah azure-openai-chat dalam semua seksyen berkaitan
  - Kiraan contoh tempatan dikemas kini daripada 3 ke 4
  - Ditambah dalam jadual Contoh Aplikasi AI
  - Disepadukan ke dalam Permulaan Pantas untuk Pengguna Pertengahan
  - Ditambah ke seksyen Templat Microsoft Foundry
  - Dikemas kini Matriks Perbandingan dan bahagian penemuan teknologi
- **Kualiti Dokumentasi**: Ditingkatkan daripada B+ (87%) → A- (92%) merentas folder docs:
  - Ditambah output dijangka pada contoh arahan kritikal
  - Disertakan langkah pengesahan untuk perubahan konfigurasi
  - Pembelajaran praktikal dipertingkat dengan latihan praktikal

#### Diubah
- **Kemajuan Pembelajaran**: Integrasi lebih baik contoh AI untuk pelajar peringkat pertengahan
- **Struktur Dokumentasi**: Latihan lebih boleh diambil tindakan dengan hasil jelas
- **Proses Pengesahan**: Kriteria kejayaan eksplisit ditambah dalam aliran kerja utama

#### Dipertingkatkan
- **Pengalaman Pembangun**: Penerapan Model Microsoft Foundry kini mengambil masa 35-45 minit (berbanding 60-90 untuk alternatif kompleks)
- **Ketelusan Kos**: Anggaran kos jelas ($50-200/bulan) untuk contoh Model Microsoft Foundry
- **Laluan Pembelajaran**: Pembangun AI mempunyai titik masuk jelas dengan azure-openai-chat
- **Standard Dokumentasi**: Output dijangka dan langkah pengesahan yang konsisten

#### Disahkan
- ✅ Contoh Model Microsoft Foundry berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan sintaksis betul
- ✅ Arahan README sepadan dengan pengalaman penerapan sebenar
- ✅ Pautan dokumentasi dikemas kini merentas lebih 8 lokasi
- ✅ Indeks contoh tepat menggambarkan 4 contoh tempatan
- ✅ Tiada pautan luaran pendua dalam jadual
- ✅ Semua rujukan navigasi tepat

#### Pelaksanaan Teknikal
- **Seni Bina Model Microsoft Foundry**: gpt-4.1 + Key Vault + corak Container Apps
- **Keselamatan**: Identiti Terurus sedia, rahsia di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Penerapan**: Satu arahan `azd up` untuk persediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemas Kini Utama: Contoh Penerapan Container App
**Versi ini memperkenalkan contoh penerapan aplikasi container komprehensif dan sedia pengeluaran menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke laluan pembelajaran.**

#### Ditambah
- **🚀 Contoh Container App**: Contoh tempatan baharu dalam `examples/container-app/`:
  - [Panduan Induk](examples/container-app/README.md): Gambaran menyeluruh penerapan bercontainer, permulaan cepat, pengeluaran, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala ke sifar, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Seni Bina Mikroservis](../../examples/container-app/microservices): Penerapan multi-perkhidmatan sedia pengeluaran (API Gateway, Produk, Pesanan, Pengguna, Notifikasi), pemesejan async, Service Bus, Cosmos DB, Azure SQL, penjejakan diedarkan, penerapan biru-hijau/canary
- **Amalan Terbaik**: Keselamatan, pemantauan, pengoptimuman kos, dan panduan CI/CD untuk beban kerja bercontainer
- **Contoh Kod**: `azure.yaml` lengkap, templat Bicep, dan pelaksanaan perkhidmatan berbilang bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung-ke-hujung, arahan pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemas kini untuk menampilkan dan memaut contoh container app baharu di bawah "Contoh Tempatan - Aplikasi Container"
- **examples/README.md**: Dikemas kini untuk menyerlahkan contoh container app, tambah entri matriks perbandingan, dan kemas kini rujukan teknologi/seni bina
- **Garis Panduan Kursus & Panduan Belajar**: Dikemas kini untuk merujuk contoh container app baharu dan corak penerapan dalam bab berkaitan

#### Disahkan
- ✅ Semua contoh baharu boleh dilancarkan dengan `azd up` dan mengikut amalan terbaik
- ✅ Pautan silang dokumentasi dan navigasi dikemas kini
- ✅ Contoh meliputi senario pemula hingga lanjutan, termasuk mikroservis pengeluaran

#### Nota
- **Skop**: Dokumentasi dan contoh dalam Bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak container lanjutan tambahan dan automasi CI/CD dalam keluaran masa depan

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk menyeluruh daripada "Microsoft Foundry" ke "Microsoft Foundry" merentas semua dokumentasi Bahasa Inggeris, mencerminkan penjenamaan rasmi Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula lengkap daripada "Microsoft Foundry" ke "Microsoft Foundry"
  - Kemas kini semua rujukan merentas dokumentasi bahasa Inggeris dalam folder `docs/`
  - Penamaan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Penamaan semula fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini merentas 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula ke `docs/microsoft-foundry/`
  - Semua rujukan silang dikemas kini untuk mencerminkan struktur folder baharu
  - Pautan navigasi disahkan merentas semua dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini untuk merujuk nama fail baharu

#### Fail Dikemas Kini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari kemas kini sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan silang dikemas kini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemas kini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemas kini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemas kini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemas kini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran kursus, tajuk bab, seksyen templat, wawasan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran keseluruhan, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada baki rujukan laluan folder "ai-foundry" di dokumentasi Inggeris
- ✅ Tiada baki rujukan nama produk "Microsoft Foundry" di dokumentasi Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baharu
- ✅ Penamaan semula fail dan folder selesai dengan jayanya
- ✅ Rujukan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan hanya digunakan pada dokumentasi Bahasa Inggeris dalam folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk nama lama (akan ditangani dalam kemas kini akan datang)
- **Pautan Luaran**: URL luaran dan rujukan repositori GitHub tidak diubah

#### Panduan Migrasi untuk Kontributor
Jika anda mempunyai cabang tempatan atau dokumentasi yang merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dokumentasi dalaman masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratonton Infrastruktur dan Penambahbaikan Pengesahan
**Versi ini memperkenalkan sokongan komprehensif untuk ciri pratonton Azure Developer CLI baharu dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan komprehensif keupayaan pratonton infrastruktur baharu
  - Rujukan arahan dan contoh penggunaan dalam helaian cheat
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk pengesahan penerapan yang lebih selamat
  - Kemas kini panduan permulaan dengan amalan penerapan berasaskan keselamatan
- **🚧 Sepanduk Status Bengkel**: Sepanduk HTML profesional yang menunjukkan status pembangunan bengkel
  - Reka bentuk gradien dengan indikator pembinaan untuk komunikasi pengguna yang jelas
  - Cap masa kemas kini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Ditingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton disepadukan dalam dokumentasi penerapan
- **Pengesahan Pra-Penerapan**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan arahan dikemas kini untuk memasukkan pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Harapan jelas ditetapkan untuk pengguna mengenai status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Penerapan**: Aliran kerja pratonton-dulu kini pendekatan yang disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Pembentangan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan jelas

#### Dipertingkatkan
- **Pendekatan Keselamatan-Dulu**: Perubahan infrastruktur kini boleh disahkan sebelum penerapan
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Pemahaman lebih baik mengenai kos sumber sebelum penyediaan
- **Pengurangan Risiko**: Kegagalan penerapan dikurangkan melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-Dokumen**: Ciri pratonton didokumentasi dalam 4 fail utama
- **Corak Arahan**: Sintaks dan contoh konsisten merentas dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton disertakan dalam aliran kerja dan skrip pengesahan
- **Penunjuk Visual**: Penandaan ciri BARU yang jelas untuk kebolehcarian

#### Infrastruktur Bengkel
- **Komunikasi Status**: Sepanduk HTML profesional dengan gaya gradien
- **Pengalaman Pengguna**: Status pembangunan jelas mengelakkan kekeliruan
- **Pembentangan Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap masa kemas kini Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel Dipertingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel komprehensif dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs  
- **📝 Arahan Bengkel Berstruktur**: Laluan pembelajaran berpandukan 7 langkah dari penemuan hingga penyesuaian  
  - 0-Pengenalan: Gambaran keseluruhan bengkel dan persediaan  
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat  
  - 2-Sahkan-Templat-AI: Prosedur penerapan dan pengesahan  
  - 3-Bedah-Templat-AI: Memahami seni bina templat  
  - 4-Konfigurasikan-Templat-AI: Konfigurasi dan penyesuaian  
  - 5-Kustom-Templat-AI: Pengubahsuaian lanjutan dan iterasi  
  - 6-Bongkar-Infrastruktur: Pembersihan dan pengurusan sumber  
  - 7-Ringkasan: Rumusan dan langkah seterusnya  
- **🛠️ Alat Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran dipertingkat  
- **🎯 Laluan Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Penyebaran → Penyesuaian)  
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan tanpa gangguan  

#### Dipertingkatkan  
- **Makmal Bengkel AI**: Diperluas dengan pengalaman pembelajaran berstruktur selama 2-3 jam yang menyeluruh  
- **Dokumentasi Bengkel**: Persembahan profesional dengan navigasi dan bantuan visual  
- **Perkembangan Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan templat hingga penyebaran produksi  
- **Pengalaman Pembangun**: Alat bersepadu untuk aliran kerja pembangunan yang lancar  

#### Dibaiki  
- **Kebolehcapaian**: Antara muka berasaskan pelayar dengan fungsi carian, salin, dan toggle tema  
- **Pembelajaran Kendiri**: Struktur bengkel fleksibel yang menyesuaikan dengan kelajuan pembelajaran berbeza  
- **Aplikasi Praktikal**: Senario penerapan templat AI dunia sebenar  
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan bengkel dan kerjasama  

#### Ciri-ciri Bengkel  
- **Carian Terbina Dalam**: Penemuan pantas kata kunci dan pelajaran  
- **Salin Blok Kod**: Fungsi hover-untuk-salin bagi semua contoh kod  
- **Tukar Tema**: Sokongan mod gelap/terang untuk keutamaan berbeza  
- **Aset Visual**: Tangkapan skrin dan rajah untuk pemahaman lebih baik  
- **Integrasi Bantuan**: Akses Discord terus untuk sokongan komuniti  

### [v3.2.0] - 2025-09-17  

#### Penstrukturan Semula Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab  
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab yang komprehensif dengan navigasi dipertingkat sepanjang seluruh repositori.**  

#### Ditambah  
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menstruktur semula keseluruhan kursus kepada 8 bab pembelajaran progresif  
  - Bab 1: Asas & Permulaan Pantas (⭐ - 30-45 minit)  
  - Bab 2: Pembangunan AI-Pertama (⭐⭐ - 1-2 jam)  
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)  
  - Bab 4: Infrastruktur sebagai Kod & Penyebaran (⭐⭐⭐ - 1-1.5 jam)  
  - Bab 5: Penyelesaian AI Multi-Ejen (⭐⭐⭐⭐ - 2-3 jam)  
  - Bab 6: Pengesahan & Perancangan Pra-Penyebaran (⭐⭐ - 1 jam)  
  - Bab 7: Penyelesaian Masalah & Debugging (⭐⭐ - 1-1.5 jam)  
  - Bab 8: Corak Pengeluaran & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)  
- **📚 Sistem Navigasi Komprehensif**: Tajuk navigasi dan footer konsisten merangkumi semua dokumentasi  
- **🎯 Jejak Kemajuan**: Senarai semak penyelesaian kursus dan sistem pengesahan pembelajaran  
- **🗺️ Panduan Laluan Pembelajaran**: Titik masuk yang jelas untuk tahap pengalaman dan matlamat berbeza  
- **🔗 Navigasi Merentas Rujukan**: Bab berkaitan dan prasyarat dipautkan dengan jelas  

#### Dipertingkatkan  
- **Struktur README**: Ditukar kepada platform pembelajaran berstruktur dengan organisasi berasaskan bab  
- **Navigasi Dokumentasi**: Setiap halaman kini memuatkan konteks bab dan panduan kemajuan  
- **Pengaturan Templat**: Contoh dan templat dipetakan kepada bab pembelajaran yang sesuai  
- **Integrasi Sumber**: Lembaran bantuan, FAQ, dan panduan belajar disambungkan dengan bab yang relevan  
- **Integrasi Bengkel**: Makmal praktikal dipetakan kepada beberapa objektif pembelajaran bab  

#### Diubah  
- **Perkembangan Pembelajaran**: Berpindah dari dokumentasi linear ke pembelajaran berasaskan bab yang fleksibel  
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk aliran pembelajaran lebih baik  
- **Integrasi Kandungan AI**: Kandungan khusus AI digabungkan dengan lebih baik sepanjang perjalanan pembelajaran  
- **Kandungan Pengeluaran**: Corak lanjutan disatukan dalam Bab 8 untuk pelajar perusahaan  

#### Dibaiki  
- **Pengalaman Pengguna**: Breadcrumb navigasi jelas dan penunjuk kemajuan bab  
- **Kebolehcapaian**: Corak navigasi konsisten untuk memudahkan penelusuran kursus  
- **Persembahan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat  
- **Kecekapan Pembelajaran**: Masa pendek untuk mencari kandungan berkaitan melalui organisasi yang dipertingkatkan  

#### Pelaksanaan Teknikal  
- **Tajuk Navigasi**: Standardisasi navigasi bab merentas lebih 40 fail dokumentasi  
- **Navigasi Footer**: Panduan kemajuan konsisten dan penunjuk penyelesaian bab  
- **Pautan Merentas**: Sistem pautan dalaman komprehensif menghubungkan konsep berkaitan  
- **Pemetaan Bab**: Templat dan contoh jelas dipautkan dengan objektif pembelajaran  

#### Penambahbaikan Panduan Kajian  
- **📚 Objektif Pembelajaran Komprehensif**: Panduan kajian disusun semula sejajar dengan sistem 8 bab  
- **🎯 Penilaian Berasaskan Bab**: Setiap bab mengandungi objektif pembelajaran dan latihan praktikal tertentu  
- **📋 Jejak Kemajuan**: Jadual pembelajaran mingguan dengan hasil boleh diukur dan senarai semak penyelesaian  
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional  
- **🛠️ Latihan Praktikal**: Aktiviti langsung dengan senario penyebaran sebenar dan penyelesaian masalah  
- **📊 Perkembangan Kemahiran**: Peningkatan jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya  
- **🎓 Rangka Sijil**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti  
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran 10-minggu berstruktur dengan pengesahan penanda aras  

### [v3.1.0] - 2025-09-17  

#### Penambahbaikan Penyelesaian AI Multi-Ejen  
**Versi ini memperbaiki penyelesaian runcit multi-ejen dengan penamaan ejen lebih baik dan dokumentasi dipertingkatkan.**  

#### Diubah  
- **Terminologi Multi-Ejen**: Gantikan "ejen Cora" dengan "ejen Pelanggan" dalam keseluruhan penyelesaian runcit multi-ejen bagi kefahaman lebih jelas  
- **Seni Bina Ejen**: Dikemaskini semua dokumentasi, templat ARM, dan contoh kod untuk menggunakan nama "ejen Pelanggan" yang konsisten  
- **Contoh Konfigurasi**: Corak konfigurasi ejen dimodenkan dengan konvensyen penamaan terkini  
- **Konsistensi Dokumentasi**: Pastikan semua rujukan menggunakan nama ejen yang profesional dan deskriptif  

#### Dipertingkatkan  
- **Pakej Templat ARM**: Dikemaskini retail-multiagent-arm-template dengan rujukan ejen Pelanggan  
- **Rajah Seni Bina**: Diagram Mermaid disegar semula dengan nama ejen dikemaskini  
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan nama CustomerAgent  
- **Pembolehubah Persekitaran**: Dikemaskini semua skrip penyebaran menggunakan konvensyen CUSTOMER_AGENT_NAME  

#### Dibaiki  
- **Pengalaman Pembangun**: Peranan dan tanggungjawab ejen lebih jelas dalam dokumentasi  
- **Kesediaan Pengeluaran**: Penyesuaian lebih baik dengan konvensyen penamaan perusahaan  
- **Bahan Pembelajaran**: Penamaan ejen lebih intuitif untuk tujuan pendidikan  
- **Kebolehgunaan Templat**: Kefahaman lebih mudah tentang fungsi ejen dan corak penyebaran  

#### Butiran Teknikal  
- Dikemaskini rajah seni bina Mermaid dengan rujukan CustomerAgent  
- Gantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python  
- Ubah konfigurasi templat ARM JSON kepada jenis ejen "customer"  
- Dikemaskini pembolehubah persekitaran dari CORA_AGENT_* kepada CUSTOMER_AGENT_*  
- Segar semula semua arahan penyebaran dan konfigurasi kontena  

### [v3.0.0] - 2025-09-12  

#### Perubahan Besar - Fokus Pembangun AI dan Integrasi Microsoft Foundry  
**Versi ini mengubah repositori menjadi sumber pembelajaran komprehensif berfokus AI dengan integrasi Microsoft Foundry.**  

#### Ditambah  
- **🤖 Laluan Pembelajaran AI-Pertama**: Penyusunan semula lengkap mengutamakan pembangun dan jurutera AI  
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi komprehensif untuk menyambungkan AZD dengan perkhidmatan Microsoft Foundry  
- **Corak Penyebaran Model AI**: Panduan terperinci merangkumi pemilihan model, konfigurasi, dan strategi penyebaran produksi  
- **Makmal Bengkel AI**: Bengkel praktikal 2-3 jam untuk menukar aplikasi AI menjadi penyelesaian yang boleh diterapkan oleh AZD  
- **Amalan Terbaik AI Produksi**: Corak sedia perusahaan untuk penskalaan, pemantauan, dan keselamatan beban kerja AI  
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah komprehensif untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan isu penerapan AI  
- **Galeri Templat AI**: Koleksi terpilih templat Microsoft Foundry dengan penarafan kerumitan  
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan  

#### Dipertingkatkan  
- **Struktur README**: Fokus pada pembangun AI dengan 45% data minat komuniti dari Microsoft Foundry Discord  
- **Laluan Pembelajaran**: Perjalanan pembangun AI berdedikasi bersama laluan tradisional untuk pelajar dan jurutera DevOps  
- **Cadangan Templat**: Templat AI terpilih termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart  
- **Integrasi Komuniti**: Sokongan komuniti Discord dipertingkatkan dengan saluran dan perbincangan khusus AI  

#### Fokus Keselamatan & Produksi  
- **Corak Identiti Terurus**: Konfigurasi pengesahan dan keselamatan khusus AI  
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI  
- **Penyebaran Multi-Wilayah**: Strategi untuk penyebaran aplikasi AI global  
- **Pemantauan Prestasi**: Metik khusus AI dan integrasi Application Insights  

#### Kualiti Dokumentasi  
- **Struktur Kursus Linear**: Perkembangan logik dari asas kepada corak penyebaran AI lanjutan  
- **URL Sahih**: Semua pautan repositori luar disahkan dan boleh diakses  
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi  
- **Sedia Produksi**: Corak penyebaran perusahaan dengan contoh dunia sebenar  

### [v2.0.0] - 2025-09-09  

#### Perubahan Besar - Penstrukturan Semula Repositori dan Peningkatan Profesional  
**Versi ini merupakan pengubahsuaian besar struktur repositori dan penyampaian kandungan.**  

#### Ditambah  
- **Rangka Kerja Pembelajaran Berstruktur**: Semua halaman dokumentasi kini mengandungi bahagian Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran  
- **Sistem Navigasi**: Tambah pautan Pelajaran Sebelumnya/Seterusnya di seluruh dokumentasi untuk panduan pembelajaran progresif  
- **Panduan Kajian**: study-guide.md komprehensif dengan objektif pembelajaran, latihan amali, dan bahan penilaian  
- **Persembahan Profesional**: Keluarkan semua ikon emoji untuk kebolehcapaian dan penampilan profesional yang lebih baik  
- **Struktur Kandungan Dipertingkatkan**: Pengorganisasian dan aliran bahan pembelajaran dipertingkatkan  

#### Diubah  
- **Format Dokumentasi**: Penyeragaman semua dokumentasi dengan struktur fokus pembelajaran yang konsisten  
- **Aliran Navigasi**: Laksanakan perkembangan logik melalui semua bahan pembelajaran  
- **Persembahan Kandungan**: Keluarkan elemen hiasan demi pemformatan jelas dan profesional  
- **Struktur Pautan**: Dikemaskini semua pautan dalaman untuk menyokong sistem navigasi baru  

#### Dibaiki  
- **Kebolehcapaian**: Keluarkan kebergantungan emoji untuk keserasian pembaca skrin lebih baik  
- **Penampilan Profesional**: Persembahan gaya akademik bersih sesuai untuk pembelajaran perusahaan  
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil jelas bagi setiap pelajaran  
- **Pengorganisasian Kandungan**: Aliran logik dan sambungan lebih baik antara topik berkaitan  

### [v1.0.0] - 2025-09-09  

#### Siaran Awal - Repositori Pembelajaran AZD Komprehensif  

#### Ditambah  
- **Struktur Dokumentasi Teras**  
  - Siri panduan memulakan lengkap  
  - Dokumentasi penerapan dan penyediaan menyeluruh  
  - Sumber penyelesaian masalah dan panduan debugging terperinci  
  - Alat dan prosedur pengesahan pra-penyebaran  

- **Modul Memulakan**  
  - Asas AZD: Konsep teras dan terminologi  
  - Panduan Pemasangan: Arahan persediaan khusus platform  
  - Panduan Konfigurasi: Persediaan persekitaran dan pengesahan  
  - Tutorial Projek Pertama: Pembelajaran amali langkah demi langkah  

- **Modul Penyebaran dan Penyediaan**  
  - Panduan Penyebaran: Dokumentasi aliran kerja lengkap  
  - Panduan Penyediaan: Infrastruktur sebagai Kod dengan Bicep  
  - Amalan terbaik untuk penyebaran produksi  
  - Corak seni bina pelbagai perkhidmatan  

- **Modul Pengesahan Pra-Penyebaran**  
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure  
  - Pemilihan SKU: Panduan tier perkhidmatan komprehensif  
  - Pemeriksaan Awal: Skrip pengesahan automatik (PowerShell dan Bash)  
  - Anggaran kos dan alat perancangan bajet  

- **Modul Penyelesaian Masalah**  
  - Isu Lazim: Masalah dan penyelesaian kerap ditemui  
  - Panduan Debugging: Metodologi penyelesaian masalah sistematik  
  - Teknik dan alat diagnostik lanjutan  
  - Pemantauan dan pengoptimuman prestasi  

- **Sumber dan Rujukan**  
  - Lembaran Cheat Perintah: Rujukan pantas untuk arahan penting  
  - Glosari: Definisi terma dan akronim komprehensif  
  - FAQ: Jawapan terperinci kepada soalan lazim  
  - Pautan sumber luar dan sambungan komuniti  

- **Contoh dan Templat**  
  - Contoh Aplikasi Web Mudah  
  - Templat penyebaran Laman Web Statik  
  - Konfigurasi Aplikasi Kontena  
  - Corak integrasi pangkalan data  
  - Contoh seni bina Mikroservis  
  - Pelaksanaan fungsi tanpa server  

#### Ciri-ciri  
- **Sokongan Pelbagai Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux  
- **Tahap Kemahiran Pelbagai**: Kandungan direka untuk pelajar hingga pembangun profesional  
- **Fokus Praktikal**: Contoh amali dan senario dunia sebenar  
- **Liputan Komprehensif**: Dari konsep asas hingga corak perusahaan lanjutan  
- **Pendekatan Utama Keselamatan**: Amalan terbaik keselamatan disepadukan sepanjang masa  
- **Pengoptimuman Kos**: Panduan penyebaran kos efektif dan pengurusan sumber  

#### Kualiti Dokumentasi  
- **Contoh Kod Terperinci**: Sampel kod praktikal dan teruji  
- **Arahan Langkah demi Langkah**: Panduan jelas dan boleh diambil tindakan  
- **Pengendalian Ralat Komprehensif**: Penyelesaian masalah isu biasa  
- **Integrasi Amalan Terbaik**: Standard industri dan cadangan  
- **Keserasian Versi**: Dikemas kini dengan perkhidmatan Azure terkini dan ciri azd  

## Penambahbaikan Masa Depan Dirancang  

### Versi 3.1.0 (Dirancang)  
#### Pengembangan Platform AI  
- **Sokongan Pelbagai Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model tersuai  
- **Rangka Kerja Ejen AI**: Templat untuk penyebaran LangChain, Semantic Kernel, dan AutoGen  
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor selain Azure AI Search (Pinecone, Weaviate, dan lain-lain)  
- **Pengawasan AI**: Pemantauan dipertingkatkan untuk prestasi model, penggunaan token, dan kualiti respons  

#### Pengalaman Pembangun  
- **Sambungan VS Code**: Pengalaman pembangunan gabungan AZD + Microsoft Foundry  
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dengan bantuan AI  
- **Tutorial Interaktif**: Latihan pengaturcaraan praktikal dengan pengesahan automatik untuk senario AI  
- **Kandungan Video**: Tutorial video tambahan untuk pembelajar visual yang memfokuskan pada penyebaran AI  

### Versi 4.0.0 (Dirancang)  
#### Corak AI Perusahaan  
- **Rangka Kerja Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit  
- **AI Multi-Penyewa**: Corak untuk melayani pelbagai pelanggan dengan perkhidmatan AI yang terasing  
- **Penyebaran AI Edge**: Integrasi dengan Azure IoT Edge dan instans kontena  
- **AI Awan Hibrid**: Corak penyebaran pelbagai awan dan hibrid untuk beban kerja AI  

#### Ciri Lanjutan  
- **Automasi Jalur AI**: Integrasi MLOps dengan jalur Azure Machine Learning  
- **Keselamatan Lanjutan**: Corak zero-trust, titik akhir peribadi, dan perlindungan ancaman lanjutan  
- **Pengoptimuman Prestasi**: Strategi penalaan dan penskalaan lanjutan untuk aplikasi AI berkapasiti tinggi  
- **Pengedaran Global**: Corak penghantaran kandungan dan caching edge untuk aplikasi AI  

### Versi 3.0.0 (Dirancang) - Digantikan oleh Pelepasan Semasa  
#### Penambahan Dicadangkan - Kini Dilaksanakan dalam v3.0.0  
- ✅ **Kandungan Berfokus AI**: Integrasi menyeluruh Microsoft Foundry (Selesai)  
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Selesai)  
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Selesai)  
- ✅ **Pengoptimuman Prestasi**: Strategi penalaan beban kerja AI (Selesai)  

### Versi 2.1.0 (Dirancang) - Sebahagiannya Dilaksanakan dalam v3.0.0  
#### Peningkatan Kecil - Sesetengah Selesai dalam Pelepasan Semasa  
- ✅ **Contoh Tambahan**: Senario penyebaran berfokus AI (Selesai)  
- ✅ **FAQ Diperluas**: Soalan dan penyelesaian masalah khusus AI (Selesai)  
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang dipertingkatkan  
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan pemberitahuan khusus AI (Selesai)  

#### Masih Dirancang untuk Pelepasan Masa Depan  
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih  
- **Akses Luar Talian**: Pek dokumentasi boleh dimuat turun  
- **Integrasi IDE Dipertingkatkan**: Sambungan VS Code untuk aliran kerja AZD + AI  
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan  

## Menyumbang kepada Changelog  

### Melaporkan Perubahan  
Apabila menyumbang kepada repositori ini, pastikan entri changelog merangkumi:  

1. **Nombor Versi**: Mengikut versi semantik (utama.kecil.tambal)  
2. **Tarikh**: Tarikh pelepasan atau kemas kini dalam format YYYY-MM-DD  
3. **Kategori**: Ditambah, Diubah, Tidak Dilaksanakan, Dibuang, Dibaiki, Keselamatan  
4. **Deskripsi Jelas**: Huraian ringkas tentang perubahan  
5. **Penilaian Impak**: Bagaimana perubahan mempengaruhi pengguna sedia ada  

### Kategori Perubahan  

#### Ditambah  
- Ciri baru, bahagian dokumentasi, atau keupayaan  
- Contoh, templat, atau sumber pembelajaran baru  
- Alat, skrip, atau utiliti tambahan  

#### Diubah  
- Pengubahsuaian fungsi atau dokumentasi sedia ada  
- Kemas kini untuk memperbaik kejelasan atau ketepatan  
- Penyusunan semula kandungan atau organisasi  

#### Tidak Dilaksanakan  
- Ciri atau pendekatan yang akan dihentikan  
- Bahagian dokumentasi yang dijadual dikeluarkan  
- Kaedah dengan alternatif yang lebih baik  

#### Dibuang  
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan  
- Maklumat usang atau pendekatan yang tidak digunakan lagi  
- Kandungan berlebihan atau yang telah digabungkan  

#### Dibaiki  
- Pembetulan ralat dalam dokumentasi atau kod  
- Penyelesaian isu atau masalah yang dilaporkan  
- Penambahbaikan ketepatan atau fungsi  

#### Keselamatan  
- Penambahbaikan atau pembaikan berkaitan keselamatan  
- Kemas kini amalan terbaik keselamatan  
- Penyelesaian kelemahan keselamatan  

### Garis Panduan Versi Semantik  

#### Versi Utama (X.0.0)  
- Perubahan besar yang memerlukan tindakan pengguna  
- Penyusunan semula kandungan atau organisasi yang signifikan  
- Perubahan yang mengubah pendekatan atau metodologi asas  

#### Versi Kecil (X.Y.0)  
- Penambahan ciri atau kandungan baru  
- Penambahbaikan yang mengekalkan keserasian ke belakang  
- Contoh, alat, atau sumber tambahan  

#### Versi Tambal (X.Y.Z)  
- Pembetulan pepijat dan pembaikan  
- Penambahbaikan kecil pada kandungan sedia ada  
- Penjelasan dan peningkatan kecil  

## Maklum Balas dan Cadangan Komuniti  

Kami menggalakkan maklum balas komuniti untuk memperbaiki sumber pembelajaran ini:  

### Cara Memberi Maklum Balas  
- **Isu GitHub**: Laporkan masalah atau cadangan penambahbaikan (Isu khusus AI dialu-alukan)  
- **Perbincangan Discord**: Kongsi idea dan berinteraksi dengan komuniti Microsoft Foundry  
- **Permintaan Tarik**: Sumbangkan penambahbaikan langsung untuk kandungan, terutama templat dan panduan AI  
- **Microsoft Foundry Discord**: Sertai saluran #Azure untuk perbincangan AZD + AI  
- **Forum Komuniti**: Sertai diskusi pembangun Azure yang lebih luas  

### Kategori Maklum Balas  
- **Ketepatan Kandungan AI**: Pembetulan maklumat integrasi dan penyebaran perkhidmatan AI  
- **Pengalaman Pembelajaran**: Cadangan untuk aliran pembelajaran pembangun AI yang lebih baik  
- **Kandungan AI Hilang**: Permintaan untuk templat, corak, atau contoh AI tambahan  
- **Kebolehcapaian**: Penambahbaikan untuk keperluan pembelajaran yang pelbagai  
- **Integrasi Alat AI**: Cadangan untuk integrasi aliran kerja pembangunan AI yang lebih baik  
- **Corak AI Produksi**: Permintaan corak penyebaran AI perusahaan  

### Komitmen Respons  
- **Respons Isu**: Dalam 48 jam untuk masalah yang dilaporkan  
- **Permintaan Ciri**: Penilaian dalam masa satu minggu  
- **Sumbangan Komuniti**: Semakan dalam masa satu minggu  
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan  

## Jadual Penyelenggaraan  

### Kemas Kini Berkala  
- **Ulasan Bulanan**: Ketepatan kandungan dan pengesahan pautan  
- **Kemas Kini Suku Tahunan**: Penambahan dan penambahbaikan kandungan utama  
- **Ulasan Separuh Tahunan**: Penyusunan semula dan penambahbaikan menyeluruh  
- **Pelepasan Tahunan**: Kemas kini versi utama dengan peningkatan besar  

### Pemantauan dan Jaminan Kualiti  
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan  
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala  
- **Kemas Kini Teknologi**: Penyesuaian dengan perkhidmatan Azure terkini dan pelepasan azd  
- **Audit Kebolehcapaian**: Semakan berkala prinsip rekabentuk inklusif  

## Polisi Sokongan Versi  

### Sokongan Versi Semasa  
- **Versi Utama Terkini**: Sokongan penuh dengan kemas kini berkala  
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembaikan kritikal selama 12 bulan  
- **Versi Warisan**: Sokongan komuniti sahaja, tiada kemas kini rasmi  

### Panduan Migrasi  
Apabila versi utama dikeluarkan, kami menyediakan:  
- **Panduan Migrasi**: Arahan berperingkat perpindahan  
- **Nota Keserasian**: Butiran mengenai perubahan yang memecahkan keserasian  
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi  
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)  
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)  

**Sentiasa Dikemaskini**: Ikuti repositori ini untuk pemberitahuan tentang pelepasan baru dan kemas kini penting kepada bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->