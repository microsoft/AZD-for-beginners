# Catatan Perubahan - AZD Untuk Pemula

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan peningkatan penting pada repositori AZD For Beginners. Kami mengikuti prinsip penomoran versi semantik dan memelihara log ini untuk membantu pengguna memahami apa yang telah berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap diberi informasi tentang fitur baru dan penambahan konten
- Memahami peningkatan yang dibuat pada dokumentasi yang ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran dari waktu ke waktu

## Hasil Pembelajaran

Setelah meninjau entri changelog, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk belajar
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi terbaru
- Memberikan umpan balik dan saran untuk perbaikan di masa depan

## Riwayat Versi

### [v3.18.0] - 2026-03-16

#### Perintah AZD AI CLI, Validasi Konten & Perluasan Template
**Versi ini menambahkan cakupan perintah `azd ai`, `azd extension`, dan `azd mcp` di semua bab terkait AI, memperbaiki tautan rusak dan kode yang usang di agents.md, memperbarui lembar contekan, dan merombak Bagian Contoh Template dengan deskripsi yang tervalidasi serta template Azure AI AZD baru.**

#### Ditambahkan
- **🤖 Cakupan AZD AI CLI** di 7 file (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagian baru "Extensions and AI Commands" yang memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsi 4: `azd ai agent init` dengan tabel perbandingan (pendekatan template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sub-bagian "AZD Extensions for Foundry" dan "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start sekarang menunjukkan jalur deployment berbasis template dan berbasis manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bagian Deploy sekarang mencakup opsi `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sub-bagian "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bagian baru "AI & Extensions Commands" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Template contoh AZD AI baru** di `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat dengan Blazor WebAssembly, Semantic Kernel, dan dukungan obrolan suara
  - **azure-search-openai-demo-java** — Java RAG chat menggunakan Langchain4J dengan opsi deployment ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif multi-agen menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG serverless menggunakan Azure Functions + LangChain.js + Cosmos DB dengan dukungan dev lokal Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG perusahaan dengan portal admin, integrasi Teams, dan opsi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi referensi orkestrasi MCP multi-agen dengan server dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Template starter Bicep infrastruktur Azure AI minimal
  - **🔗 Tautan Galeri AZD AI Awesome** — Referensi ke [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Diperbaiki
- **🔗 navigasi agents.md**: Tautan Sebelumnya/Berikutnya sekarang cocok dengan urutan pelajaran README Bab 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 tautan rusak di agents.md**: `production-ai-practices.md` dikoreksi menjadi `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 kode usang di agents.md**: Mengganti `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak valid di agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 penghitungan token di agents.md**: Mengganti perkiraan kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Mengoreksi layanan dari "Cognitive Search + App Service" menjadi "Azure AI Search + Azure Container Apps" (host default berubah Okt 2024)
- **contoso-chat**: Memperbarui deskripsi untuk merujuk Azure AI Foundry + Prompty, sesuai dengan judul repo dan tumpukan teknologi yang sebenarnya

#### Dihapus
- **ai-document-processing**: Menghapus referensi template yang tidak berfungsi (repo tidak dapat diakses publik sebagai template AZD)

#### Ditingkatkan
- **📝 latihan di agents.md**: Latihan 1 sekarang menunjukkan output yang diharapkan dan langkah `azd monitor`; Latihan 2 mencakup kode pendaftaran `FunctionTool` lengkap; Latihan 3 mengganti panduan samar dengan perintah `prepdocs.py` yang konkret
- **📚 sumber daya di agents.md**: Memperbarui tautan dokumentasi ke dokumentasi dan quickstart Azure AI Agent Service yang terbaru
- **📋 tabel Langkah Selanjutnya di agents.md**: Menambahkan tautan AI Workshop Lab untuk cakupan bab yang lengkap

#### File yang Diperbarui
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/coordination-patterns.md`
- `docs/chapter-07-troubleshooting/ai-troubleshooting.md`
- `resources/cheat-sheet.md`

---

### [v3.17.0] - 2026-02-05

#### Peningkatan Navigasi Kursus
**Versi ini meningkatkan navigasi README.md bab dengan format tabel yang ditingkatkan.**

#### Diubah
- **Tabel Peta Kursus**: Ditingkatkan dengan tautan pelajaran langsung, estimasi durasi, dan peringkat kompleksitas
- **Pembersihan Folder**: Menghapus folder lama yang redundan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validasi Tautan**: Semua 21+ tautan internal di tabel Peta Kursus diverifikasi

### [v3.16.0] - 2026-02-05

#### Pembaruan Nama Produk
**Versi ini memperbarui referensi produk ke merek Microsoft saat ini.**

#### Diubah
- **Microsoft Foundry → Microsoft Foundry**: Semua referensi diperbarui di seluruh file non-terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama layanan diperbarui untuk mencerminkan merek saat ini

#### File yang Diperbarui
- `README.md` - Halaman utama kursus
- `changelog.md` - Riwayat versi
- `course-outline.md` - Struktur kursus
- `docs/chapter-02-ai-development/agents.md` - Panduan agen AI
- `examples/README.md` - Dokumentasi contoh
- `workshop/README.md` - Halaman utama workshop
- `workshop/docs/index.md` - Indeks workshop
- `workshop/docs/instructions/*.md` - Semua file instruksi workshop

---

### [v3.15.0] - 2026-02-05

#### Restrukturisasi Besar Repositori: Nama Folder Berbasis Bab
**Versi ini merestrukturisasi dokumentasi ke folder bab khusus untuk navigasi yang lebih jelas.**

#### Penggantian Nama Folder
Folder lama telah digantikan dengan folder bernomor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ditambahkan baru: `docs/chapter-05-multi-agent/`

#### Migrasi File
| File | Dari | Ke |
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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambahkan
- **📚 File README Bab**: Membuat README.md di setiap folder bab dengan:
  - Tujuan pembelajaran dan durasi
  - Tabel pelajaran dengan deskripsi
  - Perintah quick start
  - Navigasi ke bab lain

#### Diubah
- **🔗 Memperbarui semua tautan internal**: 78+ jalur diperbarui di seluruh file dokumentasi
- **🗺️ README.md utama**: Memperbarui Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Memperbarui referensi silang ke folder bab

#### Dihapus
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturisasi Repositori: Navigasi Bab
**Versi ini menambahkan file README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Agen AI Baru
**Versi ini menambahkan panduan komprehensif untuk menerapkan agen AI dengan Azure Developer CLI.**

#### Ditambahkan
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap yang mencakup:
  - Apa itu agen AI dan bagaimana mereka berbeda dari chatbot
  - Tiga template agent quick-start (Foundry Agents, Prompty, RAG)
  - Pola arsitektur agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan kustomisasi tool
  - Pemantauan dan pelacakan metrik
  - Pertimbangan biaya dan optimisasi
  - Skenario pemecahan masalah umum
  - Tiga latihan praktis dengan kriteria keberhasilan

#### Struktur Konten
- **Pendahuluan**: Konsep agen untuk pemula
- **Quick Start**: Menerapkan agen dengan `azd init --template get-started-with-ai-agents`
- **Pola Arsitektur**: Diagram visual pola agen
- **Konfigurasi**: Pengaturan tool dan variabel lingkungan
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktis bertahap (20-45 menit masing-masing)

---

### [v3.12.0] - 2026-02-05

#### Pembaruan Lingkungan DevContainer
**Versi ini memperbarui konfigurasi kontainer pengembangan dengan alat modern dan default yang lebih baik untuk pengalaman belajar AZD.**

#### Diubah
- **🐳 Gambar Basis**: Diperbarui dari `python:3.12-bullseye` menjadi `python:3.12-bookworm` (Debian stabil terbaru)
- **📛 Nama Kontainer**: Diganti dari "Python 3" menjadi "AZD for Beginners" untuk kejelasan

#### Ditambahkan
- **🔧 Fitur Dev Container Baru**:
  - `azure-cli` dengan dukungan Bicep diaktifkan
  - `node:20` (versi LTS untuk template AZD)
  - `github-cli` untuk manajemen template
  - `docker-in-docker` untuk penyebaran aplikasi kontainer

- **🔌 Penerusan Port**: Port yang telah dikonfigurasi sebelumnya untuk pengembangan umum:
  - 8000 (pratinjau MkDocs)
  - 3000 (aplikasi web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Ekstensi VS Code Baru**:
  - `ms-python.vscode-pylance` - IntelliSense Python yang ditingkatkan
  - `ms-azuretools.vscode-azurefunctions` - Dukungan Azure Functions
  - `ms-azuretools.vscode-docker` - Dukungan Docker
  - `ms-azuretools.vscode-bicep` - Dukungan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - Manajemen sumber daya Azure
  - `yzhang.markdown-all-in-one` - Pengeditan Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Dukungan diagram Mermaid
  - `redhat.vscode-yaml` - Dukungan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Riwayat Git

- **⚙️ Pengaturan VS Code**: Menambahkan pengaturan default untuk interpreter Python, format saat menyimpan, dan pemangkasan spasi putih

- **📦 Pembaruan requirements-dev.txt**:
  - Menambahkan plugin MkDocs minify
  - Menambahkan pre-commit untuk kualitas kode
  - Menambahkan paket Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Post-Create**: Sekarang memverifikasi pemasangan AZD dan Azure CLI saat kontainer dimulai

---

### [v3.11.0] - 2026-02-05

#### Perombakan README yang Ramah Pemula
**Versi ini secara signifikan meningkatkan README.md agar lebih mudah diakses oleh pemula dan menambahkan sumber daya penting untuk pengembang AI.**

#### Ditambahkan
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas tentang kapan menggunakan masing-masing alat dengan contoh praktis
- **🌟 Tautan Awesome AZD**: Tautan langsung ke galeri template komunitas dan sumber daya kontribusi:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ ready-to-deploy templates
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Community contribution
- **🎯 Panduan Mulai Cepat**: Bagian memulai yang disederhanakan dalam 3 langkah (Install → Login → Deploy)
- **📊 Tabel Navigasi Berdasarkan Pengalaman**: Panduan jelas tentang di mana mulai berdasarkan pengalaman pengembang

#### Diubah
- **Struktur README**: Disusun ulang untuk pengungkapan bertahap - informasi kunci diutamakan
- **Bagian Pendahuluan**: Ditulis ulang untuk menjelaskan "Keajaiban `azd up`" bagi pemula total
- **Menghapus Konten Duplikat**: Menghilangkan bagian pemecahan masalah yang duplikat
- **Perintah Pemecahan Masalah**: Memperbaiki referensi `azd logs` untuk menggunakan `azd monitor --logs` yang valid

#### Diperbaiki
- **🔐 Perintah Otentikasi**: Menambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Referensi Perintah Tidak Valid**: Menghapus sisa `azd logs` dari bagian pemecahan masalah README

#### Catatan
- **Scope**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Target Audience**: Perbaikan secara khusus ditujukan untuk pengembang yang baru dengan AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Ketepatan Perintah Azure Developer CLI
**Versi ini memperbaiki perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD yang Tidak Ada Dihapus**: Audit menyeluruh dan perbaikan perintah tidak valid:
  - `azd logs` (tidak ada) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - Sub-perintah `azd service` (tidak ada) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau diganti dengan alternatif yang valid
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak ada) → dihapus
  - Flag `azd provision --what-if/--rollback` (tidak ada) → diperbarui untuk menggunakan `--preview`
  - `azd config validate` (tidak ada) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus

- **📚 Berkas Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Perombakan besar referensi perintah
  - `docs/deployment/deployment-guide.md`: Memperbaiki strategi rollback dan penyebaran
  - `docs/troubleshooting/debugging.md`: Memperbaiki bagian analisis log
  - `docs/troubleshooting/common-issues.md`: Memperbarui perintah pemecahan masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Memperbaiki perintah pemantauan
  - `docs/getting-started/first-project.md`: Memperbarui contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Memperbaiki perintah penayangan log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki perintah debugging agen

#### Diubah
- **Strategi Rollback**: Memperbarui dokumentasi untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback bawaan)
- **Penayangan Log**: Mengganti referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bagian Performa**: Menghapus flag penyebaran paralel/incremental yang tidak ada, menyediakan alternatif yang valid

#### Rincian Teknis
- **Perintah AZD yang Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor yang Valid**: `--live`, `--logs`, `--overview`
- **Fitur yang Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Catatan
- **Verifikasi**: Perintah diverifikasi terhadap Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyelesaian Workshop dan Pembaruan Kualitas Dokumentasi
**Versi ini menyelesaikan modul workshop interaktif, memperbaiki semua tautan dokumentasi yang rusak, dan meningkatkan kualitas konten secara keseluruhan untuk pengembang AI yang menggunakan Microsoft AZD.**

#### Ditambahkan
- **📝 CONTRIBUTING.md**: Dokumen pedoman kontribusi baru dengan:
  - Instruksi jelas untuk melaporkan masalah dan mengusulkan perubahan
  - Standar dokumentasi untuk konten baru
  - Pedoman contoh kode dan konvensi pesan commit
  - Informasi keterlibatan komunitas

#### Selesai
- **🎯 Modul Workshop 7 (Penutup)**: Modul penutup yang selesai sepenuhnya dengan:
  - Ringkasan komprehensif pencapaian workshop
  - Bagian konsep kunci yang dikuasai meliputi AZD, template, dan Microsoft Foundry
  - Rekomendasi kelanjutan perjalanan pembelajaran
  - Latihan tantangan workshop dengan tingkat kesulitan
  - Tautan umpan balik komunitas dan dukungan

- **📚 Modul Workshop 3 (Deconstruct)**: Memperbarui tujuan pembelajaran dengan:
  - Panduan aktivasi GitHub Copilot dengan server MCP
  - Pemahaman struktur folder template AZD
  - Pola organisasi Infrastruktur-sebagai-kode (Bicep)
  - Instruksi lab praktik

- **🔧 Modul Workshop 6 (Teardown)**: Selesai dengan:
  - Tujuan pembersihan sumber daya dan manajemen biaya
  - Penggunaan `azd down` untuk deprovisioning infrastruktur yang aman
  - Panduan pemulihan layanan kognitif yang soft-deleted
  - Petunjuk eksplorasi tambahan untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Perbaikan Tautan Rusak**: Menyelesaikan 15+ tautan internal dokumentasi yang rusak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki jalur ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki jalur ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki jalur FAQ dan panduan pemecahan masalah
  - `examples/container-app/microservices/README.md`: Memperbaiki jalur home course dan panduan penyebaran
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI
  - `course-outline.md`: Memperbaiki referensi panduan instruktur dan lab workshop AI

- **📅 Banner Status Workshop**: Diperbarui dari "Under Construction" menjadi status workshop aktif dengan tanggal Februari 2026
- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi yang rusak di README.md workshop yang mengarah ke folder lab-1-azd-basics yang tidak ada

#### Diubah
- **Presentasi Workshop**: Menghapus peringatan "under construction", workshop kini lengkap dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar-modul yang tepat
- **Referensi Jalur Pembelajaran**: Memperbarui referensi bab silang untuk menggunakan jalur microsoft-foundry yang benar

#### Divalidasi
- ✅ Semua berkas markdown bahasa Inggris memiliki tautan internal yang valid
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran
- ✅ Navigasi antar bab dan modul berfungsi dengan benar
- ✅ Konten sesuai untuk pengembang AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur ramah pemula dipertahankan di seluruh
- ✅ CONTRIBUTING.md memberikan panduan yang jelas untuk kontributor komunitas

#### Implementasi Teknis
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md
- **Audit Konten**: Tinjauan manual terhadap kelengkapan workshop dan kesesuaian untuk pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul yang konsisten diterapkan

#### Catatan
- **Scope**: Perubahan diterapkan hanya pada dokumentasi berbahasa Inggris
- **Translations**: Folder terjemahan tidak diperbarui di versi ini (terjemahan otomatis akan disinkronkan nanti)
- **Durasi Workshop**: Workshop lengkap kini menyediakan 3-4 jam pembelajaran praktis

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agen
**Versi ini menambahkan pelajaran komprehensif tingkat A tentang integrasi Application Insights, pola otentikasi, dan koordinasi multi-agen untuk penyebaran produksi.**

#### Ditambahkan
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:
  - Penyebaran berfokus AZD dengan provisi otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang berfungsi dengan telemetri kustom (1,200+ lines)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Model Microsoft Foundry)
  - 6 diagram Mermaid (arsitektur, distributed tracing, alur telemetri)
  - 3 latihan praktik (alert, dashboard, pemantauan AI)
  - Contoh kueri Kusto dan strategi optimasi biaya
  - Streaming metrik langsung dan debugging waktu-nyata
  - Waktu pembelajaran 40-50 menit dengan pola siap-produksi

- **🔐 Pelajaran Pola Otentikasi & Keamanan**: di `docs/getting-started/authsecurity.md`:
  - 3 pola otentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk penyebaran aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (mengaktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik terbaik keamanan dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola otentikasi tanpa kata sandi siap-produksi

- **🤖 Pelajaran Pola Koordinasi Multi-Agen**: di `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sequential, parallel, hierarchical, event-driven, consensus)
  - Implementasi layanan orchestrator lengkap (Python/Flask, 1,500+ lines)
  - 3 implementasi agen spesialis (Research, Writer, Editor)
  - Integrasi Service Bus untuk antrean pesan
  - Manajemen state di Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid yang menunjukkan interaksi agen
  - 3 latihan lanjutan (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/month) dengan strategi optimasi
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pre-deployment**: Kini mencakup pemantauan dan pola koordinasi yang komprehensif
- **Bab Getting Started**: Ditingkatkan dengan pola otentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observabilitas
- **Garis Besar Kursus**: Diperbarui untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progresi Pembelajaran**: Integrasi yang lebih baik dari keamanan dan pemantauan di seluruh kursus
- **Kualitas Dokumentasi**: Standar tingkat A yang konsisten (95-97%) di seluruh pelajaran baru
- **Pola Produksi**: Cakupan end-to-end lengkap untuk penyebaran tingkat perusahaan

#### Ditingkatkan
- **Developer Experience**: Jalur yang jelas dari pengembangan ke pemantauan produksi
- **Security Standards**: Pola profesional untuk otentikasi dan manajemen rahasia
- **Observability**: Integrasi lengkap Application Insights dengan AZD
- **AI Workloads**: Pemantauan khusus untuk Microsoft Foundry Models dan sistem multi-agen

#### Divalidasi
- ✅ Semua pelajaran menyertakan kode kerja lengkap (bukan cuplikan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total di 3 pelajaran)
- ✅ Latihan praktik dengan langkah verifikasi (9 total)
- ✅ Template Bicep siap produksi yang dapat dideploy melalui `azd up`
- ✅ Analisis biaya dan strategi optimisasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agen tingkat lanjut
- **Overall New Content**: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri kustom + distributed tracing
- **Authentication**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Monitoring**: Live metrics + kueri Kusto + alert + dashboard
- **Cost Management**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Microsoft Foundry Models Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh penyebaran Microsoft Foundry Models lengkap dengan antarmuka chat gpt-4.1.**

#### Ditambahkan
- **🤖 Microsoft Foundry Models Chat Example**: Penyebaran gpt-4.1 lengkap dengan implementasi kerja di `examples/azure-openai-chat/`:
  - Infrastruktur Microsoft Foundry Models lengkap (penyebaran model gpt-4.1)
  - Antarmuka chat baris-perintah Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan kunci API yang aman
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan laju dan penanganan kesalahan
  - README komprehensif dengan panduan penyebaran 35-45 menit
  - 11 file siap produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-lingkungan (15 menit)
  - Latihan 2: Latihan manajemen rahasia (10 menit)
  - Kriteria keberhasilan dan langkah verifikasi yang jelas
- **✅ Verifikasi Penyebaran**: Menambahkan bagian verifikasi ke panduan penyebaran:
  - Prosedur pemeriksaan kesehatan
  - Daftar periksa kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah penyebaran
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui menjadi kualitas A-grade (93%):
  - Menambahkan azure-openai-chat ke semua bagian relevan
  - Mengupdate jumlah contoh lokal dari 3 menjadi 4
  - Menambahkan ke tabel Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Menengah
  - Ditambahkan ke bagian Template Microsoft Foundry
  - Memperbarui Matriks Perbandingan dan bagian temuan teknologi
- **Kualitas Dokumentasi**: Meningkat dari B+ (87%) → A- (92%) di folder docs:
  - Menambahkan output yang diharapkan ke contoh perintah kritis
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran praktis dengan latihan yang aplikatif

#### Diubah
- **Progres Pembelajaran**: Integrasi yang lebih baik dari contoh AI untuk pelajar menengah
- **Struktur Dokumentasi**: Latihan yang lebih terarah dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja penting

#### Diperbaiki
- **Developer Experience**: Penyebaran Microsoft Foundry Models kini memakan waktu 35-45 menit (vs 60-90 untuk alternatif kompleks)
- **Transparansi Biaya**: Estimasi biaya yang jelas ($50-200/month) untuk contoh Microsoft Foundry Models
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi yang konsisten

#### Divalidasi
- ✅ Contoh Microsoft Foundry Models berfungsi penuh dengan `azd up`
- ✅ Semua 11 file implementasi secara sintaksis benar
- ✅ Instruksi README cocok dengan pengalaman penyebaran aktual
- ✅ Tautan dokumentasi diperbarui di lebih dari 8 lokasi
- ✅ Indeks contoh mencerminkan 4 contoh lokal secara akurat
- ✅ Tidak ada duplikat tautan eksternal di tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Microsoft Foundry Models**: gpt-4.1 + Key Vault + pola Container Apps
- **Keamanan**: Siap Managed Identity, rahasia di Key Vault
- **Monitoring**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimisasi penggunaan
- **Penyebaran**: Perintah tunggal `azd up` untuk pengaturan lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Besar: Contoh Penyebaran Container App
**Versi ini memperkenalkan contoh penyebaran aplikasi kontainer yang komprehensif dan siap produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi lengkap dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Container App**: Contoh lokal baru di `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Ikhtisar lengkap tentang penyebaran terkontainer, quick start, produksi, dan pola lanjutan
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST ramah-pemula dengan scale-to-zero, health probes, pemantauan, dan pemecahan masalah
  - [Microservices Architecture](../../examples/container-app/microservices): Penyebaran multi-layanan siap produksi (API Gateway, Product, Order, User, Notification), messaging asinkron, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Praktik Terbaik**: Keamanan, pemantauan, optimisasi biaya, dan panduan CI/CD untuk beban kerja terkontainer
- **Contoh Kode**: `azure.yaml`, template Bicep, dan implementasi layanan multi-bahasa lengkap (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario uji end-to-end, perintah pemantauan, panduan pemecahan masalah

#### Diubah
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh container app baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Diperbarui untuk menyoroti contoh container app, menambah entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Outline Kursus & Panduan Studi**: Diperbarui untuk merujuk contoh container app baru dan pola penyebaran di bab terkait

#### Divalidasi
- ✅ Semua contoh baru dapat dideploy dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario dari pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Ruang Lingkup**: Dokumentasi dan contoh berbahasa Inggris saja
- **Langkah Selanjutnya**: Perluasan dengan pola container lanjutan tambahan dan otomasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Rebranding Produk: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk secara komprehensif dari "Microsoft Foundry" ke "Microsoft Foundry" di seluruh dokumentasi bahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" ke "Microsoft Foundry"
  - Memperbarui semua referensi di dokumentasi bahasa Inggris di folder `docs/`
  - Mengganti nama folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Mengganti nama file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referensi konten diperbarui di 7 file dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` diganti nama menjadi `docs/microsoft-foundry/`
  - Semua referensi silang diperbarui untuk mencerminkan struktur folder baru
  - Tautan navigasi divalidasi di seluruh dokumentasi

- **📄 Penggantian Nama File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua tautan internal diperbarui untuk merujuk nama file baru

#### File yang Diperbarui
- **Dokumentasi Bab** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 pembaruan tautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referensi nama produk diperbarui
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari pembaruan sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referensi diperbarui (ikhtisar, umpan balik komunitas, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 tautan referensi silang diperbarui
  - `docs/getting-started/first-project.md` - 2 tautan navigasi bab diperbarui
  - `docs/getting-started/installation.md` - 2 tautan bab berikutnya diperbarui
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referensi diperbarui (navigasi, komunitas Discord)
  - `docs/troubleshooting/common-issues.md` - 1 tautan navigasi diperbarui
  - `docs/troubleshooting/debugging.md` - 1 tautan navigasi diperbarui

- **File Struktur Kursus** (2 file):
  - `README.md` - 17 referensi diperbarui (ikhtisar kursus, judul bab, bagian template, wawasan komunitas)
  - `course-outline.md` - 14 referensi diperbarui (ikhtisar, tujuan pembelajaran, sumber bab)

#### Divalidasi
- ✅ Tidak ada sisa path folder "ai-foundry" di dokumentasi bahasa Inggris
- ✅ Tidak ada sisa referensi nama produk "Microsoft Foundry" di dokumentasi bahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama file dan folder berhasil diselesaikan
- ✅ Referensi silang antar bab divalidasi

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan pada dokumentasi bahasa Inggris di folder `docs/` saja
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui pada versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui pada versi ini
- **Contoh**: File contoh mungkin masih merujuk penamaan lama (akan ditangani di pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repositori GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Validasi semua tautan internal di dokumentasi masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Preview Infrastruktur dan Validasi
**Versi ini memperkenalkan dukungan komprehensif untuk fitur preview baru Azure Developer CLI dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi fitur azd provision --preview**: Cakupan lengkap dari kemampuan preview infrastruktur baru
  - Referensi perintah dan contoh penggunaan di cheat sheet
  - Integrasi rinci di panduan provisioning dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keselamatan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradien dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Stempel waktu terakhir diperbarui untuk transparansi
  - Desain responsif untuk perangkat seluler

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsionalitas preview diintegrasikan ke seluruh dokumentasi penyebaran
- **Validasi Pra-penerapan**: Skrip otomatis sekarang menyertakan pengujian preview infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk menyertakan preview sebagai praktik terbaik
- **Pengalaman Workshop**: Ekspektasi yang jelas untuk pengguna tentang status pengembangan konten

#### Diubah
- **Praktik Terbaik Penyebaran**: Alur kerja dengan preview-first kini direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Diperbaiki
- **Pendekatan Utamakan Keselamatan**: Perubahan infrastruktur kini dapat divalidasi sebelum penyebaran
- **Kolaborasi Tim**: Hasil preview dapat dibagikan untuk ditinjau dan disetujui
- **Kepedulian Biaya**: Pemahaman biaya sumber daya yang lebih baik sebelum provisioning
- **Mitigasi Risiko**: Mengurangi kegagalan penyebaran melalui validasi sebelumnya

#### Implementasi Teknis
- **Integrasi Multi-dokumen**: Fitur preview didokumentasikan di 4 file kunci
- **Pola Perintah**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Preview disertakan dalam alur kerja validasi dan skrip
- **Indikator Visual**: Penandaan fitur BARU yang jelas untuk kemudahan penemuan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan styling gradien
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Presentasi Profesional**: Menjaga kredibilitas repositori sambil menetapkan ekspektasi
- **Transparansi Garis Waktu**: Stempel waktu terakhir diperbarui Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Materi Workshop yang Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran berpemandu 7 langkah dari penemuan hingga kustomisasi
  - 0-Introduction: Ikhtisar workshop dan pengaturan
  - 1-Select-AI-Template: Proses penemuan dan pemilihan template
  - 2-Validate-AI-Template: Prosedur penyebaran dan validasi
  - 3-Deconstruct-AI-Template: Memahami arsitektur template
  - 4-Configure-AI-Template: Konfigurasi dan kustomisasi
  - 5-Customize-AI-Template: Modifikasi lanjutan dan iterasi
  - 6-Teardown-Infrastructure: Pembersihan dan pengelolaan sumber daya
  - 7-Wrap-up: Ringkasan dan langkah selanjutnya
- **🛠️ Peralatan Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman belajar yang lebih baik
- **🎯 Jalur Pembelajaran Praktik**: Metodologi 3 langkah (Penemuan → Penyebaran → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **AI Workshop Lab**: Diperluas dengan pengalaman pembelajaran terstruktur 2-3 jam yang komprehensif
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga penyebaran produksi
- **Pengalaman Pengembang**: Peralatan terintegrasi untuk alur kerja pengembangan yang lebih lancar

#### Diperbaiki
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan pengalihan tema
- **Pembelajaran Mandiri**: Struktur workshop fleksibel yang mengakomodasi kecepatan belajar yang berbeda
- **Aplikasi Praktis**: Skenario penyebaran template AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan cepat kata kunci dan pelajaran
- **Salin Blok Kode**: Fitur hover-to-copy untuk semua contoh kode
- **Pengalihan Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Tangkapan layar dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Utama dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Menyusun ulang seluruh kursus menjadi 8 bab pembelajaran progresif
  - Bab 1: Dasar & Mulai Cepat (⭐ - 30-45 menit)
  - Bab 2: Pengembangan Berfokus AI (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Otentikasi (⭐⭐ - 45-60 menit)
  - Bab 4: Infrastructure as Code & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Solusi AI Multi-Agen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Validasi & Perencanaan Pra-Penyebaran (⭐⭐ - 1 jam)
  - Bab 7: Pemecahan Masalah & Debugging (⭐⭐ - 1-1.5 jam)
  - Bab 8: Pola Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi yang konsisten di seluruh dokumentasi
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk tingkat pengalaman dan tujuan berbeda
- **🔗 Navigasi Silang**: Bab terkait dan prasyarat yang terhubung dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman sekarang menyertakan konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan studi terhubung ke bab relevan
- **Integrasi Workshop**: Lab praktis dipetakan ke banyak tujuan pembelajaran bab

#### Diubah
- **Progres Pembelajaran**: Beralih dari dokumentasi linear ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi konten khusus AI yang lebih baik di seluruh perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Bab 8 untuk pembelajar perusahaan

#### Diperbaiki
- **Pengalaman Pengguna**: Breadcrumb navigasi yang jelas dan indikator progresi bab
- **Aksesibilitas**: Pola navigasi konsisten untuk mempermudah penelusuran kursus
- **Presentasi Profesional**: Struktur kursus bergaya universitas yang cocok untuk pelatihan akademis dan korporat
- **Efisiensi Pembelajaran**: Waktu untuk menemukan konten relevan berkurang melalui organisasi yang lebih baik

#### Implementasi Teknis
- **Navigation Headers**: Navigasi bab standar di lebih dari 40+ file dokumentasi
- **Footer Navigation**: Panduan progresi dan indikator penyelesaian bab yang konsisten
- **Cross-Linking**: Sistem tautan internal komprehensif yang menghubungkan konsep terkait
- **Chapter Mapping**: Template dan contoh jelas diasosiasikan dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi diubah untuk selaras dengan sistem 8-bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal pembelajaran mingguan dengan hasil yang terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas hands-on dengan skenario penyebaran nyata dan pemecahan masalah
- **📊 Progres Keterampilan**: Kemajuan yang jelas dari konsep dasar ke pola perusahaan dengan fokus pengembangan karier
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran 10 minggu terstruktur dengan validasi tonggak

### [v3.1.0] - 2025-09-17

#### Solusi AI Multi-Agen yang Ditingkatkan
**Versi ini meningkatkan solusi ritel multi-agen dengan penamaan agen yang lebih baik dan dokumentasi yang disempurnakan.**

#### Diubah
- **Terminologi Multi-Agen**: Replaced "Cora agent" with "Customer agent" throughout retail multi-agent solution for clearer understanding
- **Arsitektur Agen**: Memperbarui seluruh dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "Customer agent" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi Customer agent
- **Diagram Arsitektur**: Menyegarkan diagram Mermaid dengan penamaan agen yang diperbarui
- **Contoh Kode**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penyebaran untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyelarasan yang lebih baik dengan konvensi penamaan perusahaan
- **Materi Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan
- **Kegunaan Template**: Pemahaman fungsi agen dan pola penyebaran menjadi lebih sederhana

#### Rincian Teknis
- Updated Mermaid architecture diagrams with CustomerAgent references
- Replaced CoraAgent class names with CustomerAgent in Python examples
- Modified ARM template JSON configurations to use "customer" agent type
- Updated environment variables from CORA_AGENT_* to CUSTOMER_AGENT_* patterns
- Refreshed all deployment commands and container configurations

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber belajar berfokus AI yang komprehensif dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran AI-First**: Restrukturisasi lengkap yang memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi komprehensif untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **Pola Penyebaran Model AI**: Panduan terperinci mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **AI Workshop Lab**: Workshop hands-on 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat dideploy oleh AZD
- **Praktik Terbaik AI untuk Produksi**: Pola siap-enterprise untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **Panduan Pemecahan Masalah Khusus AI**: Pemecahan masalah komprehensif untuk Microsoft Foundry Models, Cognitive Services, dan isu penyebaran AI
- **Galeri Template AI**: Koleksi template Microsoft Foundry unggulan dengan peringkat kompleksitas
- **Materi Workshop**: Struktur workshop lengkap dengan lab praktis dan materi referensi

#### Ditingkatkan
- **Struktur README**: Berfokus pada pengembang AI dengan data minat komunitas 45% dari Microsoft Foundry Discord
- **Jalur Pembelajaran**: Perjalanan khusus pengembang AI berdampingan dengan jalur tradisional untuk pelajar dan insinyur DevOps
- **Rekomendasi Template**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komunitas**: Dukungan komunitas Discord yang ditingkatkan dengan saluran khusus AI dan diskusi

#### Fokus Keamanan & Produksi
- **Polapola Managed Identity**: Otentikasi dan konfigurasi keamanan khusus AI
- **Optimasi Biaya**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Penyebaran Multi-Region**: Strategi untuk penyebaran aplikasi AI secara global
- **Pemantauan Kinerja**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Struktur Kursus Linear**: Progres logis dari pemula ke pola penyebaran AI tingkat lanjut
- **URL Tervalidasi**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Referensi Lengkap**: Semua tautan dokumentasi internal tervalidasi dan fungsional
- **Siap Produksi**: Pola penyebaran enterprise dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini merepresentasikan perombakan signifikan pada struktur repositori dan penyajian konten.**

#### Ditambahkan
- **Kerangka Pembelajaran Terstruktur**: Semua halaman dokumentasi kini menyertakan bagian Introduction, Learning Goals, dan Learning Outcomes
- **Sistem Navigasi**: Menambahkan tautan pelajaran Sebelumnya/Berikutnya di seluruh dokumentasi untuk panduan progresi pembelajaran
- **Panduan Studi**: study-guide.md yang komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi penilaian
- **Penyajian Profesional**: Menghapus semua ikon emoji untuk meningkatkan aksesibilitas dan penampilan profesional
- **Struktur Konten yang Ditingkatkan**: Organisasi dan alur materi pembelajaran yang lebih baik

#### Diubah
- **Format Dokumentasi**: Menstandarisasi semua dokumentasi dengan struktur berfokus pembelajaran yang konsisten
- **Alur Navigasi**: Mengimplementasikan progresi logis melalui semua materi pembelajaran
- **Penyajian Konten**: Menghapus elemen dekoratif demi formatting yang jelas dan profesional
- **Struktur Tautan**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Diperbaiki
- **Aksesibilitas**: Menghapus ketergantungan emoji untuk kompatibilitas pembaca layar yang lebih baik
- **Penampilan Profesional**: Penyajian gaya akademis yang bersih cocok untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan terstruktur dengan tujuan dan hasil yang jelas untuk setiap pelajaran
- **Organisasi Konten**: Alur logis yang lebih baik dan koneksi antar topik terkait

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan getting-started lengkap
  - Dokumentasi penyebaran dan provisioning yang komprehensif
  - Sumber daya pemecahan masalah dan panduan debugging yang mendetail
  - Alat dan prosedur validasi pra-penyebaran

- **Modul Memulai**
  - AZD Basics: Konsep inti dan terminologi
  - Installation Guide: Instruksi pemasangan spesifik platform
  - Configuration Guide: Pengaturan lingkungan dan otentikasi
  - First Project Tutorial: Pembelajaran hands-on langkah demi langkah

- **Modul Penyebaran dan Provisioning**
  - Deployment Guide: Dokumentasi alur kerja lengkap
  - Provisioning Guide: Infrastructure as Code dengan Bicep
  - Praktik terbaik untuk penyebaran produksi
  - Pola arsitektur multi-layanan

- **Modul Validasi Pra-Penyebaran**
  - Capacity Planning: Validasi ketersediaan sumber daya Azure
  - SKU Selection: Panduan tingkat layanan yang komprehensif
  - Pre-flight Checks: Skrip validasi otomatis (PowerShell dan Bash)
  - Alat estimasi biaya dan perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Common Issues: Masalah yang sering ditemui dan solusinya
  - Debugging Guide: Metodologi pemecahan masalah sistematis
  - Teknik diagnostik lanjutan dan alat
  - Pemantauan kinerja dan optimasi

- **Sumber Daya dan Referensi**
  - Command Cheat Sheet: Referensi cepat untuk perintah esensial
  - Glossary: Definisi terminologi dan akronim yang komprehensif
  - FAQ: Jawaban mendetail untuk pertanyaan umum
  - Tautan sumber eksternal dan koneksi komunitas

- **Contoh dan Template**
  - Contoh Aplikasi Web Sederhana
  - Template penyebaran Situs Statis
  - Konfigurasi Aplikasi Kontainer
  - Pola integrasi database
  - Contoh arsitektur microservices
  - Implementasi fungsi serverless

#### Fitur
- **Dukungan Multi-Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux
- **Berbagai Tingkat Keahlian**: Konten dirancang untuk pelajar hingga pengembang profesional
- **Fokus Praktis**: Contoh hands-on dan skenario dunia nyata
- **Cakupan Komprehensif**: Dari konsep dasar hingga pola enterprise tingkat lanjut
- **Pendekatan Keamanan-Utama**: Praktik terbaik keamanan terintegrasi di seluruh materi
- **Optimasi Biaya**: Panduan untuk penyebaran yang hemat biaya dan pengelolaan sumber daya

#### Kualitas Dokumentasi
- **Contoh Kode yang Mendetail**: Contoh kode praktis dan teruji
- **Instruksi Langkah-demi-Langkah**: Panduan yang jelas dan dapat ditindaklanjuti
- **Penanganan Error Komprehensif**: Pemecahan masalah untuk masalah umum
- **Integrasi Praktik Terbaik**: Standar industri dan rekomendasi
- **Kompatibilitas Versi**: Terbaru dengan layanan Azure dan fitur azd terkini

## Rencana Peningkatan Mendatang

### Version 3.1.0 (Planned)
#### Perluasan Platform AI
- **Dukungan Multi-Model**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **Kerangka Agen AI**: Template untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Pola RAG Lanjutan**: Opsi database vektor selain Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabilitas AI**: Pemantauan yang ditingkatkan untuk performa model, penggunaan token, dan kualitas respons

#### Developer Experience
- **Ekstensi VS Code**: Pengalaman pengembangan AZD + Microsoft Foundry yang terintegrasi
- **Integrasi GitHub Copilot**: Pembuatan template AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengkodean langsung dengan validasi otomatis untuk skenario AI
- **Konten Video**: Tutorial video pelengkap untuk pembelajar visual yang fokus pada penyebaran AI

### Versi 4.0.0 (Direncanakan)
#### Pola AI Perusahaan
- **Kerangka Tata Kelola**: Tata kelola model AI, kepatuhan, dan jejak audit
- **AI Multi-Tenant**: Pola untuk melayani banyak pelanggan dengan layanan AI terisolasi
- **Penyebaran Edge AI**: Integrasi dengan Azure IoT Edge dan instance kontainer
- **AI Hybrid Cloud**: Pola penyebaran multi-cloud dan hybrid untuk beban kerja AI

#### Fitur Lanjutan
- **Otomatisasi Pipeline AI**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Keamanan Lanjutan**: Pola zero-trust, private endpoints, dan perlindungan ancaman lanjutan
- **Optimisasi Performa**: Penalaan dan strategi skala lanjutan untuk aplikasi AI throughput tinggi
- **Distribusi Global**: Pola pengiriman konten dan caching edge untuk aplikasi AI

### Versi 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Usulan Penambahan - Sekarang Diimplementasikan di v3.0.0
- ✅ **Konten Berfokus AI**: Integrasi Microsoft Foundry yang komprehensif (Selesai)
- ✅ **Tutorial Interaktif**: Lab workshop AI praktis (Selesai)
- ✅ **Modul Keamanan Lanjutan**: Pola keamanan khusus AI (Selesai)
- ✅ **Optimisasi Performa**: Strategi penalaan beban kerja AI (Selesai)

### Versi 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Peningkatan Minor - Beberapa Selesai di Rilis Saat Ini
- ✅ **Contoh Tambahan**: Skenario penyebaran berfokus AI (Selesai)
- ✅ **FAQ Diperluas**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Perluasan Pemantauan**: Pola pemantauan dan pemberian peringatan khusus AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Dokumentasi Ramah Mobile**: Desain responsif untuk pembelajaran mobile
- **Akses Offline**: Paket dokumentasi yang dapat diunduh
- **Integrasi IDE yang Ditingkatkan**: Ekstensi VS Code untuk alur kerja AZD + AI
- **Dasbor Komunitas**: Metrik komunitas real-time dan pelacakan kontribusi

## Berkontribusi pada Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti penomoran versi semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Ditambahkan, Diubah, Tidak Direkomendasikan, Dihapus, Diperbaiki, Keamanan
4. **Deskripsi Jelas**: Deskripsi singkat tentang apa yang diubah
5. **Penilaian Dampak**: Bagaimana perubahan memengaruhi pengguna yang sudah ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kapabilitas
- Contoh baru, template, atau sumber belajar
- Alat tambahan, skrip, atau utilitas

#### Diubah
- Modifikasi pada fungsi atau dokumentasi yang sudah ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Tidak Direkomendasikan
- Fitur atau pendekatan yang sedang dihentikan bertahap
- Bagian dokumentasi yang dijadwalkan untuk dihapus
- Metode yang memiliki alternatif yang lebih baik

#### Dihapus
- Fitur, dokumentasi, atau contoh yang tidak lagi relevan
- Informasi usang atau pendekatan yang tidak lagi direkomendasikan
- Konten yang berlebihan atau digabungkan

#### Diperbaiki
- Koreksi terhadap kesalahan dalam dokumentasi atau kode
- Penyelesaian isu atau masalah yang dilaporkan
- Peningkatan akurasi atau fungsionalitas

#### Keamanan
- Peningkatan atau perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Pedoman Penomoran Versi Semantik

#### Versi Mayor (X.0.0)
- Perubahan besar yang membutuhkan tindakan pengguna
- Restrukturisasi signifikan dari konten atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi dasar

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Peningkatan yang mempertahankan kompatibilitas mundur
- Contoh, alat, atau sumber daya tambahan

#### Versi Patch (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Umpan Balik dan Saran Komunitas

Kami mendorong umpan balik komunitas secara aktif untuk meningkatkan sumber belajar ini:

### Cara Memberikan Umpan Balik
- **GitHub Issues**: Laporkan masalah atau sarankan perbaikan (isu spesifik AI disambut)
- **Diskusi Discord**: Bagikan ide dan berinteraksi dengan komunitas Microsoft Foundry
- **Pull Requests**: Kontribusikan perbaikan langsung pada konten, terutama template dan panduan AI
- **Microsoft Foundry Discord**: Berpartisipasi di saluran #Azure untuk diskusi AZD + AI
- **Forum Komunitas**: Berpartisipasi dalam diskusi pengembang Azure yang lebih luas

### Kategori Umpan Balik
- **Akurasi Konten AI**: Koreksi pada integrasi layanan AI dan informasi penyebaran
- **Pengalaman Belajar**: Saran untuk alur pembelajaran pengembang AI yang lebih baik
- **Konten AI yang Hilang**: Permintaan untuk template, pola, atau contoh AI tambahan
- **Aksesibilitas**: Peningkatan untuk kebutuhan belajar yang beragam
- **Integrasi Alat AI**: Saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Pola AI Produksi**: Permintaan pola penyebaran AI tingkat perusahaan

### Komitmen Tanggapan
- **Tanggapan Isu**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Fitur**: Evaluasi dalam waktu satu minggu
- **Kontribusi Komunitas**: Ditinjau dalam waktu satu minggu
- **Isu Keamanan**: Prioritas segera dengan respons dipercepat

## Jadwal Pemeliharaan

### Pembaruan Rutin
- **Tinjauan Bulanan**: Akurasi konten dan validasi tautan
- **Pembaruan Kuartalan**: Penambahan dan peningkatan konten utama
- **Tinjauan Semi-Tahunan**: Restrukturisasi dan peningkatan komprehensif
- **Rilis Tahunan**: Pembaruan versi mayor dengan peningkatan signifikan

### Pemantauan dan Jaminan Kualitas
- **Pengujian Otomatis**: Validasi rutin contoh kode dan tautan
- **Integrasi Umpan Balik Komunitas**: Penggabungan rutin saran pengguna
- **Pembaruan Teknologi**: Penyelarasan dengan layanan Azure terbaru dan rilis azd
- **Audit Aksesibilitas**: Tinjauan rutin untuk prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Versi Mayor Terbaru**: Dukungan penuh dengan pembaruan rutin
- **Versi Mayor Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Legasi**: Hanya dukungan komunitas, tidak ada pembaruan resmi

### Panduan Migrasi
Saat versi mayor dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Detail tentang perubahan yang bersifat breaking
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Studi](resources/study-guide.md)
- **Pelajaran Selanjutnya**: Kembali ke [README Utama](README.md)

**Tetap Terbarui**: Pantau repositori ini untuk notifikasi tentang rilis baru dan pembaruan penting pada materi pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas segala kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->