# Catatan Perubahan - AZD For Beginners

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan peningkatan penting pada repositori AZD For Beginners. Kami mengikuti prinsip penomoran versi semantik dan memelihara log ini untuk membantu pengguna memahami apa yang berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapat informasi tentang fitur baru dan penambahan konten
- Memahami perbaikan yang dibuat pada dokumentasi yang ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran dari waktu ke waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan mampu:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi yang paling mutakhir
- Memberikan umpan balik dan saran untuk perbaikan di masa depan

## Riwayat Versi

### [v3.19.1] - 2026-03-27

#### Klarifikasi Onboarding Pemula, Validasi Pengaturan & Pembersihan Perintah AZD Akhir
**Versi ini menindaklanjuti pemeriksaan validasi AZD 1.23 dengan peninjauan dokumentasi yang berfokus pada pemula: ini menjelaskan panduan otentikasi yang mengutamakan AZD, menambahkan skrip validasi pengaturan lokal, memverifikasi perintah kunci terhadap AZD CLI yang aktif, dan menghapus referensi perintah sumber bahasa Inggris usang terakhir di luar catatan perubahan.**

#### Ditambahkan
- **🧪 Skrip validasi pengaturan pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` sehingga pembelajar dapat memastikan alat yang diperlukan sebelum memulai Bab 1
- **✅ Langkah validasi pengaturan di muka** di README root dan README Bab 1 sehingga prasyarat yang hilang tertangkap sebelum `azd up`

#### Diubah
- **🔐 Panduan otentikasi pemula** kini secara konsisten menganggap `azd auth login` sebagai jalur utama untuk alur kerja AZD, dengan `az login` disebut sebagai opsional kecuali perintah Azure CLI digunakan langsung
- **📚 Alur onboarding Bab 1** kini mengarahkan pembelajar untuk memvalidasi pengaturan lokal mereka sebelum instalasi, otentikasi, dan langkah penyebaran pertama
- **🛠️ Pesan validator** kini secara jelas memisahkan persyaratan pemblokiran dari peringatan Azure CLI opsional untuk jalur pemula yang hanya menggunakan AZD
- **📖 Dokumen konfigurasi, pemecahan masalah, dan contoh** kini membedakan antara otentikasi AZD yang diwajibkan dan masuk Azure CLI opsional di tempat keduanya sebelumnya disajikan tanpa konteks

#### Diperbaiki
- **📋 Referensi perintah sumber bahasa Inggris yang tersisa** diperbarui ke bentuk AZD saat ini, termasuk `azd config show` di cheat sheet dan `azd monitor --overview` di tempat panduan overview Portal Azure dimaksudkan
- **🧭 Klaim pemula di Bab 1** dilunakkan untuk menghindari janji yang berlebihan tentang perilaku bebas galat atau rollback yang dijamin di semua templat dan sumber daya Azure
- **🔎 Validasi CLI langsung** mengonfirmasi dukungan saat ini untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

#### File yang Diperbarui
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

#### Validasi AZD 1.23.12, Perluasan Lingkungan Workshop & Penyegaran Model AI
**Versi ini melakukan pemeriksaan validasi dokumentasi terhadap `azd` `1.23.12`, memperbarui contoh perintah AZD yang usang, menyegarkan panduan model AI ke default saat ini, dan memperluas instruksi workshop di luar GitHub Codespaces untuk juga mendukung dev container dan klon lokal.**

#### Ditambahkan
- **✅ Catatan validasi di seluruh bab inti dan dokumen workshop** untuk membuat baseline AZD yang diuji menjadi jelas bagi pembelajar yang menggunakan build CLI yang lebih baru atau lebih lama
- **⏱️ Panduan timeout penyebaran** untuk penyebaran aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah inspeksi ekstensi** dengan `azd extension show azure.ai.agents` di dokumen alur kerja AI
- **🌐 Panduan lingkungan workshop yang lebih luas** mencakup GitHub Codespaces, dev container, dan klon lokal dengan MkDocs

#### Diubah
- **📚 README pengantar bab** kini secara konsisten mencatat validasi terhadap `azd 1.23.12` di seluruh bagian foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, dan production
- **🛠️ Referensi perintah AZD** diperbarui ke bentuk saat ini di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` tergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ketika overview Application Insights dimaksudkan
- **🧪 Contoh preview penyediaan** disederhanakan ke penggunaan yang didukung saat ini seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Alur workshop** diperbarui sehingga pembelajar dapat menyelesaikan lab di Codespaces, dev container, atau klon lokal alih-alih mengasumsikan eksekusi hanya di Codespaces
- **🔐 Panduan otentikasi** sekarang memfavoritkan `azd auth login` untuk alur kerja AZD, dengan `az login` diposisikan sebagai opsional ketika perintah Azure CLI digunakan langsung

#### Diperbaiki
- **🪟 Perintah instal Windows** dinormalisasi ke penulisan paket `winget` yang benar dalam panduan instalasi
- **🐧 Panduan instal Linux** dikoreksi untuk menghindari instruksi manajer paket `azd` spesifik distro yang tidak didukung dan sebagai gantinya menunjuk ke release assets bila sesuai
- **📦 Contoh model AI** disegarkan dari default lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` ke contoh saat ini seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Cuplikan penyebaran dan diagnostik** dikoreksi untuk menggunakan perintah environment dan status yang saat ini berlaku dalam log, skrip, dan langkah pemecahan masalah
- **⚙️ Panduan GitHub Actions** diperbarui dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** diperbarui dari `azd mcp consent` ke `azd copilot consent list`

#### Ditingkatkan
- **🧠 Panduan bab AI** kini lebih baik menjelaskan perilaku `azd ai` yang sensitif preview, login khusus tenant, penggunaan ekstensi saat ini, dan rekomendasi penyebaran model yang diperbarui
- **🧪 Instruksi workshop** sekarang menggunakan contoh versi yang lebih realistis dan bahasa pengaturan lingkungan yang lebih jelas untuk lab praktis
- **📈 Dokumen produksi dan pemecahan masalah** kini lebih selaras dengan monitoring saat ini, model fallback, dan contoh tingkat biaya

#### File yang Diperbarui
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

#### Perintah CLI AZD AI, Validasi Konten & Perluasan Templat
**Versi ini menambahkan cakupan perintah `azd ai`, `azd extension`, dan `azd mcp` di semua bab terkait AI, memperbaiki tautan yang rusak dan kode usang di agents.md, memperbarui cheat sheet, dan merombak bagian Templat Contoh dengan deskripsi yang tervalidasi dan templat Azure AI AZD baru.**

#### Ditambahkan
- **🤖 Cakupan CLI AZD AI** di 7 file (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagian baru "Extensions and AI Commands" yang memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsi 4: `azd ai agent init` dengan tabel perbandingan (pendekatan template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subbagian "AZD Extensions for Foundry" dan "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start sekarang menunjukkan jalur penyebaran berbasis template dan berbasis manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bagian Deploy sekarang menyertakan opsi `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subbagian "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bagian baru "AI & Extensions Commands" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** di `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — chat RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan dukungan obrolan suara
  - **azure-search-openai-demo-java** — chat RAG Java menggunakan Langchain4J dengan opsi penyebaran ACA/AKS
  - **contoso-creative-writer** — aplikasi penulisan kreatif multi-agen menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG serverless menggunakan Azure Functions + LangChain.js + Cosmos DB dengan dukungan pengembangan lokal Ollama
  - **chat-with-your-data-solution-accelerator** — akselerator RAG perusahaan dengan portal admin, integrasi Teams, dan opsi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — aplikasi referensi orkestrasi MCP multi-agen dengan server dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — templat starter Bicep infrastruktur Azure AI minimal
  - **🔗 Tautan Galeri Awesome AZD AI** — Referensi ke [galeri awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Diperbaiki
- **🔗 Navigasi agents.md**: link Previous/Next sekarang cocok dengan urutan pelajaran README Bab 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Tautan agents.md yang rusak**: `production-ai-practices.md` dikoreksi menjadi `../chapter-08-production/production-ai-practices.md` (3 kemunculan)
- **📦 Kode usang di agents.md**: Mengganti `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak valid di agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Penghitungan token di agents.md**: Mengganti perkiraan kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Mengoreksi layanan dari "Cognitive Search + App Service" menjadi "Azure AI Search + Azure Container Apps" (host default berubah Okt 2024)
- **contoso-chat**: Memperbarui deskripsi untuk merujuk Azure AI Foundry + Prompty, sesuai judul dan tumpukan teknologi repositori yang sebenarnya

#### Dihapus
- **ai-document-processing**: Menghapus referensi templat yang tidak berfungsi (repo tidak dapat diakses publik sebagai templat AZD)

#### Ditingkatkan
- **📝 agents.md latihan**: Latihan 1 sekarang menampilkan keluaran yang diharapkan dan langkah `azd monitor`; Latihan 2 menyertakan kode pendaftaran lengkap `FunctionTool`; Latihan 3 mengganti panduan yang samar dengan perintah konkret `prepdocs.py`
- **📚 agents.md sumber daya**: Memperbarui tautan dokumentasi ke dokumen Azure AI Agent Service dan quickstart terkini
- **📋 agents.md tabel Langkah Selanjutnya**: Menambahkan tautan AI Workshop Lab untuk cakupan bab yang lengkap

#### Files Updated
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
**Versi ini meningkatkan navigasi bab di README.md dengan format tabel yang ditingkatkan.**

#### Diubah
- **Course Map Table**: Ditingkatkan dengan tautan pelajaran langsung, perkiraan durasi, dan peringkat kompleksitas
- **Pembersihan Folder**: Menghapus folder lama yang redundan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validasi Tautan**: Semua 21+ tautan internal di tabel Course Map diverifikasi

### [v3.16.0] - 2026-02-05

#### Pembaruan Nama Produk
**Versi ini memperbarui referensi produk sesuai merek Microsoft saat ini.**

#### Diubah
- **Microsoft Foundry → Microsoft Foundry**: Semua referensi diperbarui di file non-terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama layanan diperbarui untuk mencerminkan merek saat ini

#### File yang Diperbarui
- `README.md` - Halaman utama kursus
- `changelog.md` - Riwayat versi
- `course-outline.md` - Struktur kursus
- `docs/chapter-02-ai-development/agents.md` - Panduan agen AI
- `examples/README.md` - Dokumentasi contoh
- `workshop/README.md` - Halaman landasan workshop
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
- Added new: `docs/chapter-05-multi-agent/`

#### Migrasi File
File | Dari | Ke
------|------|---
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
- **🗺️ Main README.md**: Memperbarui Peta Kursus dengan struktur bab baru
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
  - Apa itu agen AI dan bagaimana bedanya dengan chatbot
  - Tiga template agen quick-start (Foundry Agents, Prompty, RAG)
  - Pola arsitektur agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan kustomisasi alat
  - Pemantauan dan pelacakan metrik
  - Pertimbangan biaya dan optimisasi
  - Skenario pemecahan masalah umum
  - Tiga latihan praktik dengan kriteria keberhasilan

#### Struktur Konten
- Pendahuluan: Konsep agen untuk pemula
- Quick Start: Terapkan agen dengan `azd init --template get-started-with-ai-agents`
- Pola Arsitektur: Diagram visual pola agen
- Konfigurasi: Pengaturan alat dan variabel lingkungan
- Pemantauan: Integrasi Application Insights
- Latihan: Pembelajaran praktik progresif (20-45 menit masing-masing)

---

### [v3.12.0] - 2026-02-05

#### Pembaruan Lingkungan DevContainer
**Versi ini memperbarui konfigurasi container pengembangan dengan alat modern dan default yang lebih baik untuk pengalaman belajar AZD.**

#### Diubah
- **🐳 Base Image**: Diperbarui dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terbaru)
- **📛 Container Name**: Diubah nama dari "Python 3" menjadi "AZD for Beginners" untuk kejelasan

#### Ditambahkan
- **🔧 New Dev Container Features**:
  - `azure-cli` dengan dukungan Bicep diaktifkan
  - `node:20` (versi LTS untuk template AZD)
  - `github-cli` untuk pengelolaan template
  - `docker-in-docker` untuk penyebaran container app

- **🔌 Port Forwarding**: Port pra-konfigurasi untuk pengembangan umum:
  - 8000 (Pratinjau MkDocs)
  - 3000 (Web apps)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 New VS Code Extensions**:
  - `ms-python.vscode-pylance` - Peningkatan IntelliSense Python
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

- **⚙️ VS Code Settings**: Menambahkan pengaturan default untuk interpreter Python, format saat simpan, dan penghapusan spasi ekstra

- **📦 Updated requirements-dev.txt**:
  - Menambahkan plugin MkDocs minify
  - Menambahkan pre-commit untuk kualitas kode
  - Menambahkan paket Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Pasca-Buat**: Sekarang memverifikasi instalasi AZD dan Azure CLI saat container dimulai

---

### [v3.11.0] - 2026-02-05

#### Perombakan README Ramah Pemula
**Versi ini secara signifikan meningkatkan README.md agar lebih mudah diakses oleh pemula dan menambahkan sumber daya penting untuk pengembang AI.**

#### Ditambahkan
- **🆚 Azure CLI vs AZD Comparison**: Penjelasan jelas tentang kapan menggunakan masing-masing alat dengan contoh praktis
- **🌟 Tautan Awesome AZD**: Tautan langsung ke galeri template komunitas dan sumber kontribusi:
  - [Galeri Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ template siap dideploy
  - [Kirim Template](https://github.com/Azure/awesome-azd/issues) - Kontribusi komunitas
- **🎯 Panduan Quick Start**: Bagian mulai yang disederhanakan dalam 3 langkah (Install → Login → Deploy)
- **📊 Tabel Navigasi Berdasarkan Pengalaman**: Panduan jelas untuk menentukan tempat mulai berdasarkan pengalaman pengembang

#### Diubah
- **README Structure**: Disusun ulang untuk pengungkapan progresif - informasi kunci terlebih dahulu
- **Introduction Section**: Ditulis ulang untuk menjelaskan "The Magic of `azd up`" bagi pemula sepenuhnya
- **Removed Duplicate Content**: Menghilangkan bagian pemecahan masalah yang duplikat
- **Troubleshooting Commands**: Memperbaiki referensi `azd logs` menjadi penggunaan yang valid `azd monitor --logs`

#### Diperbaiki
- **🔐 Authentication Commands**: Menambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Invalid Command References**: Menghapus sisa `azd logs` dari bagian pemecahan masalah README

#### Catatan
- **Scope**: Perubahan diterapkan pada main README.md dan resources/cheat-sheet.md
- **Target Audience**: Peningkatan ditujukan khusus untuk pengembang yang baru mengenal AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Keakuratan Perintah Azure Developer CLI
**Versi ini memperbaiki perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD yang Tidak Ada Dihapus**: Audit komprehensif dan koreksi perintah tidak valid:
  - `azd logs` (tidak ada) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - `azd service` subcommands (tidak ada) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau diganti dengan alternatif yang valid
  - `azd deploy --rollback/--incremental/--parallel/--detect-changes` flags (tidak ada) → dihapus
  - `azd provision --what-if/--rollback` flags (tidak ada) → diperbarui untuk menggunakan `--preview`
  - `azd config validate` (tidak ada) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus
- **📚 File yang Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Overhaul besar pada referensi perintah
  - `docs/deployment/deployment-guide.md`: Memperbaiki strategi rollback dan deployment
  - `docs/troubleshooting/debugging.md`: Mengoreksi bagian analisis log
  - `docs/troubleshooting/common-issues.md`: Memperbarui perintah pemecahan masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Memperbaiki perintah pemantauan
  - `docs/getting-started/first-project.md`: Memperbarui contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Memperbaiki contoh help dan versi
  - `docs/pre-deployment/application-insights.md`: Mengoreksi perintah melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki perintah debugging agen

#### Diubah
- **Rollback Strategies**: Dokumentasi diperbarui untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback native)
- **Log Viewing**: Mengganti referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Performance Section**: Menghapus flag deployment paralel/incremental yang tidak ada, memberikan alternatif yang valid

#### Rincian Teknis
- **Perintah AZD yang Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor yang Valid**: `--live`, `--logs`, `--overview`
- **Fitur yang Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Catatan
- **Verifikasi**: Perintah divalidasi terhadap Azure Developer CLI v1.23.x

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
- **🎯 Modul Workshop 7 (Penutupan)**: Modul penutupan yang sepenuhnya diselesaikan dengan:
  - Ringkasan komprehensif dari pencapaian workshop
  - Bagian konsep kunci yang dikuasai mencakup AZD, template, dan Microsoft Foundry
  - Rekomendasi untuk melanjutkan perjalanan pembelajaran
  - Latihan tantangan workshop dengan peringkat kesulitan
  - Umpan balik komunitas dan tautan dukungan

- **📚 Modul Workshop 3 (Deconstruct)**: Tujuan pembelajaran yang diperbarui dengan:
  - Panduan aktivasi GitHub Copilot dengan server MCP
  - Pemahaman struktur folder template AZD
  - Pola organisasi Infrastructure-as-code (Bicep)
  - Instruksi lab praktik langsung

- **🔧 Modul Workshop 6 (Teardown)**: Diselesaikan dengan:
  - Tujuan pembersihan sumber daya dan pengelolaan biaya
  - Penggunaan `azd down` untuk pencabutan penyediaan infrastruktur secara aman
  - Panduan pemulihan layanan kognitif yang dihapus secara soft
  - Prompt eksplorasi bonus untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Perbaikan Tautan Rusak**: Menyelesaikan 15+ tautan internal dokumentasi yang rusak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki jalur ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Mengoreksi jalur ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki jalur FAQ dan panduan pemecahan masalah
  - `examples/container-app/microservices/README.md`: Memperbaiki jalur halaman utama kursus dan panduan deployment
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI
  - `course-outline.md`: Memperbaiki referensi panduan instruktur dan lab workshop AI

- **📅 Spanduk Status Workshop**: Diperbarui dari "Under Construction" menjadi status workshop aktif dengan tanggal Februari 2026

- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi yang rusak di workshop README.md yang mengarah ke folder lab-1-azd-basics yang tidak ada

#### Diubah
- **Presentasi Workshop**: Menghapus peringatan "under construction", workshop sekarang selesai dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar-modul yang tepat
- **Referensi Jalur Pembelajaran**: Memperbarui silang-referensi bab untuk menggunakan jalur microsoft-foundry yang benar

#### Divalidasi
- ✅ Semua file markdown bahasa Inggris memiliki tautan internal yang valid
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran
- ✅ Navigasi antar bab dan modul berfungsi dengan benar
- ✅ Konten cocok untuk pengembang AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur ramah-pemula dipertahankan di seluruh dokumen
- ✅ CONTRIBUTING.md memberikan panduan jelas untuk kontributor komunitas

#### Implementasi Teknis
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md
- **Audit Konten**: Tinjauan manual terhadap kelengkapan workshop dan kesesuaian untuk pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul yang konsisten diterapkan

#### Catatan
- **Cakupan**: Perubahan diterapkan hanya pada dokumentasi berbahasa Inggris
- **Terjemahan**: Folder terjemahan tidak diperbarui dalam versi ini (terjemahan otomatis akan disinkronkan nanti)
- **Durasi Workshop**: Workshop lengkap sekarang menyediakan 3-4 jam pembelajaran praktik langsung

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agen
**Versi ini menambahkan pelajaran lengkap kelas-A tentang integrasi Application Insights, pola otentikasi, dan koordinasi multi-agen untuk deployment produksi.**

#### Ditambahkan
- **📊 Application Insights Integration Lesson**: in `docs/pre-deployment/application-insights.md`:
  - Deployment berfokus AZD dengan penyediaan otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang berfungsi dengan telemetri kustom (1,200+ lines)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Microsoft Foundry Models)
  - 6 diagram Mermaid (arsitektur, pelacakan terdistribusi, aliran telemetri)
  - 3 latihan praktik langsung (peringatan, dasbor, pemantauan AI)
  - Contoh query Kusto dan strategi optimisasi biaya
  - Streaming metrik langsung dan debugging waktu-nyata
  - Waktu belajar 40-50 menit dengan pola siap-produksi

- **🔐 Authentication & Security Patterns Lesson**: in `docs/getting-started/authsecurity.md`:
  - 3 pola otentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk deployment yang aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (mengaktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik terbaik keamanan dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola otentikasi tanpa kata sandi siap-produksi

- **🤖 Multi-Agent Coordination Patterns Lesson**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sequential, parallel, hierarchical, event-driven, consensus)
  - Implementasi layanan orchestrator lengkap (Python/Flask, 1,500+ lines)
  - 3 implementasi agen khusus (Research, Writer, Editor)
  - Integrasi Service Bus untuk antrian pesan
  - Manajemen status Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid yang menunjukkan interaksi agen
  - 3 latihan tingkat lanjut (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/month) dengan strategi optimisasi
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-penerapan**: Sekarang mencakup pola pemantauan dan koordinasi yang komprehensif
- **Bab Memulai**: Ditingkatkan dengan pola otentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observabilitas
- **Rangka Kursus**: Diperbarui untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progres Pembelajaran**: Integrasi yang lebih baik dari keamanan dan pemantauan di seluruh kursus
- **Kualitas Dokumentasi**: Standar A-grade konsisten (95-97%) di seluruh pelajaran baru
- **Pola Produksi**: Cakupan end-to-end lengkap untuk deployment perusahaan

#### Ditingkatkan
- **Pengalaman Pengembang**: Jalur yang jelas dari pengembangan ke pemantauan produksi
- **Standar Keamanan**: Pola profesional untuk otentikasi dan pengelolaan rahasia
- **Observabilitas**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Microsoft Foundry Models dan sistem multi-agen

#### Divalidasi
- ✅ Semua pelajaran menyertakan kode kerja lengkap (bukan cuplikan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total di 3 pelajaran)
- ✅ Latihan praktik langsung dengan langkah verifikasi (9 total)
- ✅ Template Bicep siap-produksi dapat dideploy melalui `azd up`
- ✅ Analisis biaya dan strategi optimisasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- docs/pre-deployment/application-insights.md: - Panduan pemantauan yang komprehensif
- docs/getting-started/authsecurity.md: - Pola keamanan profesional
- docs/pre-deployment/coordination-patterns.md: - Arsitektur multi-agen tingkat lanjut
- Konten Baru Secara Keseluruhan: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri kustom + pelacakan terdistribusi
- **Otentikasi**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + query Kusto + alerts + dashboards
- **Manajemen Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Microsoft Foundry Models Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh deployment Microsoft Foundry Models lengkap dengan antarmuka chat gpt-4.1.**

#### Ditambahkan
- **🤖 Microsoft Foundry Models Chat Example**: Complete gpt-4.1 deployment with working implementation in `examples/azure-openai-chat/`:
  - Infrastruktur Microsoft Foundry Models lengkap (deployment model gpt-4.1)
  - Antarmuka chat baris perintah Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan kunci API yang aman
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan laju dan penanganan kesalahan
  - README komprehensif dengan panduan deployment 35-45 menit
  - 11 file siap-produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik langsung ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-environment (15 menit)
  - Latihan 2: Latihan pengelolaan rahasia (10 menit)
  - Kriteria keberhasilan yang jelas dan langkah verifikasi
- **✅ Verifikasi Deployment**: Menambahkan bagian verifikasi ke panduan deployment:
  - Prosedur pemeriksaan kesehatan
  - Checklist kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah deployment
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui menjadi kualitas A-grade (93%):
  - Menambahkan azure-openai-chat ke semua bagian terkait
  - Memperbarui jumlah contoh lokal dari 3 menjadi 4
  - Ditambahkan ke tabel Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Menengah
  - Ditambahkan ke bagian Template Microsoft Foundry
  - Memperbarui Matriks Perbandingan dan bagian penemuan teknologi
- **Kualitas Dokumentasi**: Meningkat dari B+ (87%) → A- (92%) di seluruh folder docs:
  - Menambahkan output yang diharapkan ke contoh perintah kritis
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran praktik langsung dengan latihan praktis

#### Diubah
- **Progres Pembelajaran**: Integrasi contoh AI yang lebih baik untuk pembelajar menengah
- **Struktur Dokumentasi**: Latihan yang lebih dapat ditindaklanjuti dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja utama

#### Ditingkatkan
- **Pengalaman Pengembang**: Deployment Microsoft Foundry Models kini memakan waktu 35-45 menit (vs 60-90 untuk alternatif kompleks)
- **Transparansi Biaya**: Estimasi biaya yang jelas ($50-200/month) untuk contoh Microsoft Foundry Models
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi yang konsisten

#### Divalidasi
- ✅ Contoh Microsoft Foundry Models sepenuhnya berfungsi dengan `azd up`
- ✅ Semua 11 file implementasi sintaksnya benar
- ✅ Instruksi README sesuai dengan pengalaman deployment sebenarnya
- ✅ Tautan dokumentasi diperbarui di lebih dari 8 lokasi
- ✅ Indeks contoh mencerminkan secara akurat 4 contoh lokal
- ✅ Tidak ada tautan eksternal duplikat dalam tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Microsoft Foundry Models**: gpt-4.1 + Key Vault + pola Container Apps
- **Keamanan**: Managed Identity siap, rahasia di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimisasi penggunaan
- **Deployment**: Satu perintah `azd up` untuk pengaturan lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Besar: Contoh Deployment Aplikasi Kontainer
**Versi ini memperkenalkan contoh deployment aplikasi kontainer yang komprehensif dan siap-produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Aplikasi Kontainer**: Contoh lokal baru di `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Ringkasan lengkap tentang deployment terkontainer, panduan mulai cepat, produksi, dan pola lanjutan
  - [API Flask Sederhana](../../examples/container-app/simple-flask-api): REST API ramah-pemula dengan scale-to-zero, probe kesehatan, pemantauan, dan pemecahan masalah
  - [Arsitektur Microservices](../../examples/container-app/microservices): Deployment multi-layanan siap-produksi (API Gateway, Product, Order, User, Notification), messaging asinkron, Service Bus, Cosmos DB, Azure SQL, pelacakan terdistribusi, deployment blue-green/canary
- **Praktik Terbaik**: Keamanan, pemantauan, optimisasi biaya, dan panduan CI/CD untuk beban kerja terkontainer
- **Contoh Kode**: `azure.yaml` lengkap, template Bicep, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario pengujian end-to-end, perintah pemantauan, panduan pemecahan masalah

#### Diubah
- **
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh aplikasi container baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Diperbarui untuk menyoroti contoh aplikasi container, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Course Outline & Study Guide**: Diperbarui untuk merujuk contoh aplikasi container baru dan pola penerapan di bab terkait

#### Tervalidasi
- ✅ Semua contoh baru dapat dideploy dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario dari pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Ruang Lingkup**: Dokumentasi dan contoh berbahasa Inggris saja
- **Langkah Selanjutnya**: Perluasan dengan pola container lanjutan tambahan dan otomatisasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Product Rebranding: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk yang komprehensif dari "Microsoft Foundry" menjadi "Microsoft Foundry" di seluruh dokumentasi berbahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" menjadi "Microsoft Foundry"
  - Memperbarui semua referensi di seluruh dokumentasi berbahasa Inggris di folder `docs/`
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
  - `course-outline.md` - 14 referensi diperbarui (ikhtisar, tujuan pembelajaran, sumber daya bab)

#### Tervalidasi
- ✅ Tidak ada lagi referensi jalur folder "ai-foundry" yang tersisa di dokumen berbahasa Inggris
- ✅ Tidak ada lagi referensi nama produk "Microsoft Foundry" yang tersisa di dokumen berbahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama file dan folder berhasil diselesaikan
- ✅ Referensi silang antar bab divalidasi

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan hanya pada dokumentasi berbahasa Inggris di folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui dalam versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui dalam versi ini
- **Contoh**: File contoh mungkin masih merujuk penamaan warisan (akan ditangani di pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repositori GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki branch lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Validasi semua tautan internal di dokumentasi masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau Infrastruktur dan Validasi
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau Azure Developer CLI yang baru dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi Fitur azd provision --preview**: Cakupan komprehensif kemampuan pratinjau infrastruktur yang baru
  - Referensi perintah dan contoh penggunaan di cheat sheet
  - Integrasi terperinci dalam panduan provisioning dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk validasi deployment yang lebih aman
  - Pembaruan panduan memulai dengan praktik penerapan yang berfokus pada keselamatan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradien dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Cap waktu pembaruan terakhir untuk transparansi
  - Desain responsif seluler untuk semua jenis perangkat

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsionalitas pratinjau diintegrasikan ke seluruh dokumentasi penerapan
- **Validasi Pra-Penerapan**: Skrip otomatis sekarang menyertakan pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk menyertakan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Ekspektasi bagi pengguna tentang status pengembangan konten menjadi lebih jelas

#### Diubah
- **Praktik Terbaik Penerapan**: Alur kerja berbasis pratinjau kini direkomendasikan sebagai pendekatan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Diperbaiki
- **Pendekatan Utama Keselamatan**: Perubahan infrastruktur kini dapat divalidasi sebelum penerapan
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk ditinjau dan disetujui
- **Kesadaran Biaya**: Pemahaman biaya sumber daya sebelum provisioning menjadi lebih baik
- **Mitigasi Risiko**: Mengurangi kegagalan penerapan melalui validasi sebelumnya

#### Implementasi Teknis
- **Integrasi Multi-dokumen**: Fitur pratinjau didokumentasikan di 4 file kunci
- **Pola Perintah**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau disertakan dalam alur kerja validasi dan skrip
- **Indikator Visual**: Penandaan fitur BARU yang jelas untuk memudahkan penemuan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradien
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Presentasi Profesional**: Menjaga kredibilitas repositori sambil menetapkan ekspektasi
- **Transparansi Garis Waktu**: Cap waktu pembaruan terakhir Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Materi Workshop yang Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran berpandu 7 langkah dari penemuan hingga penyesuaian
  - 0-Introduction: Ikhtisar workshop dan pengaturan
  - 1-Select-AI-Template: Proses penemuan dan pemilihan template
  - 2-Validate-AI-Template: Prosedur penerapan dan validasi
  - 3-Deconstruct-AI-Template: Memahami arsitektur template
  - 4-Configure-AI-Template: Konfigurasi dan kustomisasi
  - 5-Customize-AI-Template: Modifikasi lanjutan dan iterasi
  - 6-Teardown-Infrastructure: Pembersihan dan manajemen sumber daya
  - 7-Wrap-up: Ringkasan dan langkah berikutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman belajar yang ditingkatkan
- **🎯 Jalur Pembelajaran Praktis**: Metodologi 3 langkah (Discovery → Deployment → Customization)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **AI Workshop Lab**: Diperluas dengan pengalaman pembelajaran terstruktur 2-3 jam yang komprehensif
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga penerapan produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang lebih lancar

#### Diperbaiki
- **Aksesibilitas**: Antarmuka berbasis browser dengan fungsi pencarian, salin, dan toggle tema
- **Pembelajaran Mandiri**: Struktur workshop yang fleksibel mengakomodasi berbagai kecepatan belajar
- **Aplikasi Praktis**: Skenario penerapan template AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan kata kunci dan pelajaran yang cepat
- **Salin Blok Kode**: Fungsionalitas hover-to-copy untuk semua contoh kode
- **Toggle Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Tangkapan layar dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Utama dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Menyusun ulang seluruh kursus menjadi 8 bab pembelajaran progresif
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 mins)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 hours)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 mins)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 hours)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 hours)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 hour)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 hours)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 hours)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi konsisten di seluruh dokumentasi
- **🎯 Pelacakan Kemajuan**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik awal yang jelas untuk berbagai tingkat pengalaman dan tujuan
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat terhubung dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini menyertakan konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan studi terhubung ke bab terkait
- **Integrasi Workshop**: Lab langsung dipetakan ke beberapa tujuan pembelajaran bab

#### Diubah
- **Progres Pembelajaran**: Beralih dari dokumentasi linier ke pembelajaran fleksibel berbasis bab
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan sebagai Chapter 3 untuk alur belajar yang lebih baik
- **Integrasi Konten AI**: Integrasi konten AI yang lebih baik sepanjang perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Chapter 8 untuk pelajar enterprise

#### Diperbaiki
- **Pengalaman Pengguna**: Breadcrumb navigasi dan indikator progresi bab yang jelas
- **Aksesibilitas**: Pola navigasi konsisten untuk mempermudah penelusuran kursus
- **Presentasi Profesional**: Struktur ala universitas yang cocok untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu yang dikurangi untuk menemukan konten relevan melalui organisasi yang ditingkatkan

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab standar di lebih dari 40 file dokumentasi
- **Footer Navigasi**: Panduan progresi dan indikator penyelesaian bab yang konsisten
- **Referensi Silang**: Sistem penautan internal komprehensif yang menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh jelas dikaitkan dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi disusun ulang untuk selaras dengan sistem 8-bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran tertentu dan latihan praktis
- **📋 Pelacakan Kemajuan**: Jadwal pembelajaran mingguan dengan hasil terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas langsung dengan skenario penerapan nyata dan pemecahan masalah
- **📊 Kemajuan Keterampilan**: Kemajuan yang jelas dari konsep dasar ke pola enterprise dengan fokus pengembangan karier
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran 10 minggu terstruktur dengan validasi pencapaian

### [v3.1.0] - 2025-09-17

#### Peningkatan Solusi Multi-Agent AI
**Versi ini meningkatkan solusi ritel multi-agent dengan penamaan agen yang lebih baik dan dokumentasi yang ditingkatkan.**

#### Diubah
- **Terminologi Multi-Agent**: Mengganti "Cora agent" dengan "Customer agent" di seluruh solusi multi-agent ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "Customer agent" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **ARM Template Package**: Memperbarui retail-multiagent-arm-template dengan referensi agen Customer
- **Architecture Diagrams**: Memperbarui diagram Mermaid dengan penamaan agen yang diperbarui
- **Code Examples**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Environment Variables**: Memperbarui semua skrip deployment untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Ditingkatkan
- **Developer Experience**: Peran dan tanggung jawab agen yang lebih jelas dalam dokumentasi
- **Production Readiness**: Penyesuaian yang lebih baik dengan konvensi penamaan perusahaan
- **Learning Materials**: Penamaan agen yang lebih intuitif untuk keperluan pendidikan
- **Template Usability**: Pemahaman yang disederhanakan tentang fungsi agen dan pola deployment

#### Detail Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM untuk menggunakan tipe agen "customer"
- Memperbarui variabel lingkungan dari CORA_AGENT_* ke pola CUSTOMER_AGENT_*
- Menyegarkan semua perintah deployment dan konfigurasi kontainer

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran berfokus AI yang komprehensif dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 AI-First Learning Path**: Struktur ulang lengkap yang memprioritaskan pengembang dan insinyur AI
- **Microsoft Foundry Integration Guide**: Dokumentasi komprehensif untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **AI Model Deployment Patterns**: Panduan terperinci yang mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **AI Workshop Lab**: Lokakarya praktik 2-3 jam untuk mengubah aplikasi AI menjadi solusi yang dapat dideploy dengan AZD
- **Production AI Best Practices**: Pola siap-enterprise untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **AI-Specific Troubleshooting Guide**: Panduan pemecahan masalah komprehensif untuk Microsoft Foundry Models, Cognitive Services, dan isu penyebaran AI
- **AI Template Gallery**: Kumpulan template Microsoft Foundry unggulan dengan peringkat kompleksitas
- **Workshop Materials**: Struktur lokakarya lengkap dengan lab praktik dan materi referensi

#### Ditingkatkan
- **README Structure**: Berfokus pada pengembang AI dengan data minat komunitas 45% dari Microsoft Foundry Discord
- **Learning Paths**: Perjalanan pengembang AI khusus berdampingan dengan jalur tradisional untuk pelajar dan insinyur DevOps
- **Template Recommendations**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Community Integration**: Dukungan komunitas Discord yang diperkuat dengan saluran dan diskusi khusus AI

#### Keamanan & Fokus Produksi
- **Managed Identity Patterns**: Konfigurasi otentikasi dan keamanan khusus AI
- **Cost Optimization**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Multi-Region Deployment**: Strategi untuk penyebaran aplikasi AI global
- **Performance Monitoring**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Linear Course Structure**: Progresi logis dari pemula hingga pola penyebaran AI lanjutan
- **Validated URLs**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Complete Reference**: Semua tautan dokumentasi internal tervalidasi dan berfungsi
- **Production Ready**: Pola penyebaran enterprise dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini merupakan perombakan signifikan terhadap struktur repositori dan penyajian konten.**

#### Ditambahkan
- **Structured Learning Framework**: Semua halaman dokumentasi kini menyertakan bagian Introduction, Learning Goals, dan Learning Outcomes
- **Navigation System**: Menambahkan tautan Previous/Next lesson di seluruh dokumentasi untuk alur pembelajaran terpandu
- **Study Guide**: study-guide.md komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi penilaian
- **Professional Presentation**: Menghapus semua ikon emoji untuk meningkatkan aksesibilitas dan tampilan profesional
- **Enhanced Content Structure**: Peningkatan organisasi dan alur materi pembelajaran

#### Diubah
- **Documentation Format**: Menstandarisasi semua dokumentasi dengan struktur berfokus pembelajaran yang konsisten
- **Navigation Flow**: Menerapkan progresi logis pada semua materi pembelajaran
- **Content Presentation**: Menghapus elemen dekoratif demi format yang jelas dan profesional
- **Link Structure**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Ditingkatkan
- **Accessibility**: Menghapus ketergantungan emoji untuk kompatibilitas pembaca layar yang lebih baik
- **Professional Appearance**: Penyajian bergaya akademik yang bersih cocok untuk pembelajaran perusahaan
- **Learning Experience**: Pendekatan terstruktur dengan tujuan dan hasil pembelajaran yang jelas untuk setiap pelajaran
- **Content Organization**: Alur logis dan keterkaitan topik yang lebih baik

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambahkan
- **Core Documentation Structure**
  - Seri panduan getting-started lengkap
  - Dokumentasi deployment dan provisioning yang komprehensif
  - Sumber daya pemecahan masalah dan panduan debugging terperinci
  - Alat dan prosedur validasi pra-deployment

- **Getting Started Module**
  - AZD Basics: Konsep inti dan terminologi
  - Installation Guide: Instruksi pengaturan spesifik platform
  - Configuration Guide: Pengaturan lingkungan dan autentikasi
  - First Project Tutorial: Tutorial langkah demi langkah untuk praktek langsung

- **Deployment and Provisioning Module**
  - Deployment Guide: Dokumentasi alur kerja lengkap
  - Provisioning Guide: Infrastructure as Code dengan Bicep
  - Praktik terbaik untuk penyebaran produksi
  - Pola arsitektur multi-service

- **Pre-deployment Validation Module**
  - Capacity Planning: Validasi ketersediaan sumber daya Azure
  - SKU Selection: Panduan lengkap tingkat layanan
  - Pre-flight Checks: Skrip validasi otomatis (PowerShell dan Bash)
  - Estimasi biaya dan alat perencanaan anggaran

- **Troubleshooting Module**
  - Common Issues: Masalah yang sering ditemui dan solusinya
  - Debugging Guide: Metodologi pemecahan masalah yang sistematis
  - Teknik dan alat diagnostik lanjutan
  - Pemantauan kinerja dan optimisasi

- **Resources and References**
  - Command Cheat Sheet: Referensi cepat untuk perintah esensial
  - Glossary: Definisi terminologi dan akronim yang komprehensif
  - FAQ: Jawaban terperinci untuk pertanyaan umum
  - Tautan sumber eksternal dan koneksi komunitas

- **Examples and Templates**
  - Contoh Aplikasi Web Sederhana
  - Template penyebaran Static Website
  - Konfigurasi Aplikasi Container
  - Pola integrasi Database
  - Contoh arsitektur Microservices
  - Implementasi fungsi Serverless

#### Fitur
- **Multi-Platform Support**: Panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Multiple Skill Levels**: Konten dirancang untuk pelajar hingga pengembang profesional
- **Practical Focus**: Contoh praktik dan skenario dunia nyata
- **Comprehensive Coverage**: Dari konsep dasar hingga pola enterprise lanjutan
- **Security-First Approach**: Praktik keamanan terbaik terintegrasi di seluruh materi
- **Cost Optimization**: Panduan untuk penyebaran yang hemat biaya dan manajemen sumber daya

#### Kualitas Dokumentasi
- **Detailed Code Examples**: Contoh kode praktis dan teruji
- **Step-by-Step Instructions**: Panduan yang jelas dan dapat ditindaklanjuti
- **Comprehensive Error Handling**: Pemecahan masalah untuk isu umum
- **Best Practices Integration**: Standar industri dan rekomendasi
- **Version Compatibility**: Terbaru dengan layanan Azure dan fitur azd terkini

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **AI Agent Frameworks**: Template untuk LangChain, Semantic Kernel, dan AutoGen deployment
- **Advanced RAG Patterns**: Opsi basis data vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **AI Observability**: Pemantauan yang ditingkatkan untuk kinerja model, penggunaan token, dan kualitas respons

#### Developer Experience
- **VS Code Extension**: Pengalaman pengembangan terintegrasi AZD + Microsoft Foundry
- **GitHub Copilot Integration**: Pembuatan template AZD yang dibantu AI
- **Interactive Tutorials**: Latihan pengkodean praktik dengan validasi otomatis untuk skenario AI
- **Video Content**: Tutorial video pendukung untuk pembelajar visual yang berfokus pada penyebaran AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: Tata kelola model AI, kepatuhan, dan jejak audit
- **Multi-Tenant AI**: Pola untuk melayani banyak pelanggan dengan layanan AI terisolasi
- **Edge AI Deployment**: Integrasi dengan Azure IoT Edge dan instance container
- **Hybrid Cloud AI**: Pola penyebaran multi-cloud dan hybrid untuk beban kerja AI

#### Advanced Features
- **AI Pipeline Automation**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Advanced Security**: Pola zero-trust, private endpoints, dan perlindungan ancaman lanjutan
- **Performance Optimization**: Penyetelan lanjutan dan strategi penskalaan untuk aplikasi AI throughput tinggi
- **Global Distribution**: Pola pengiriman konten dan caching edge untuk aplikasi AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: Integrasi Microsoft Foundry yang komprehensif (Selesai)
- ✅ **Interactive Tutorials**: Lab lokakarya AI praktik (Selesai)
- ✅ **Advanced Security Module**: Pola keamanan khusus AI (Selesai)
- ✅ **Performance Optimization**: Strategi penyetelan beban kerja AI (Selesai)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: Skenario penyebaran berfokus AI (Selesai)
- ✅ **Extended FAQ**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Tool Integration**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Monitoring Expansion**: Pola pemantauan dan peringatan khusus AI (Selesai)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: Desain responsif untuk pembelajaran di perangkat seluler
- **Offline Access**: Paket dokumentasi yang dapat diunduh
- **Enhanced IDE Integration**: Ekstensi VS Code untuk alur kerja AZD + AI
- **Community Dashboard**: Metrik komunitas real-time dan pelacakan kontribusi

## Contributing to the Changelog

### Reporting Changes
When contributing to this repository, please ensure changelog entries include:

1. **Version Number**: Following semantic versioning (major.minor.patch)
2. **Date**: Release or update date in YYYY-MM-DD format
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: Concise description of what changed
5. **Impact Assessment**: How changes affect existing users

### Change Categories

#### Added
- New features, documentation sections, or capabilities
- New examples, templates, or learning resources
- Additional tools, scripts, or utilities

#### Changed
- Modifications to existing functionality or documentation
- Updates to improve clarity or accuracy
- Restructuring of content or organization

#### Deprecated
- Features or approaches that are being phased out
- Documentation sections scheduled for removal
- Methods that have better alternatives

#### Removed
- Features, documentation, or examples that are no longer relevant
- Outdated information or deprecated approaches
- Redundant or consolidated content

#### Fixed
- Corrections to errors in documentation or code
- Resolution of reported issues or problems
- Improvements to accuracy or functionality

#### Security
- Security-related improvements or fixes
- Updates to security best practices
- Resolution of security vulnerabilities

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Breaking changes that require user action
- Significant restructuring of content or organization
- Changes that alter the fundamental approach or methodology

#### Minor Version (X.Y.0)
- New features or content additions
- Enhancements that maintain backward compatibility
- Additional examples, tools, or resources

#### Patch Version (X.Y.Z)
- Bug fixes and corrections
- Minor improvements to existing content
- Clarifications and small enhancements

## Community Feedback and Suggestions

We actively encourage community feedback to improve this learning resource:

### How to Provide Feedback
- **GitHub Issues**: Report problems or suggest improvements (AI-specific issues welcome)
- **Discord Discussions**: Share ideas and engage with the Microsoft Foundry community
- **Pull Requests**: Contribute direct improvements to content, especially AI templates and guides
- **Microsoft Foundry Discord**: Participate in #Azure channel for AZD + AI discussions
- **Community Forums**: Participate in broader Azure developer discussions

### Feedback Categories
- **AI Content Accuracy**: Correksi terhadap integrasi layanan AI dan informasi penyebaran
- **Learning Experience**: Saran untuk alur pembelajaran pengembang AI yang lebih baik
- **Missing AI Content**: Permintaan untuk template, pola, atau contoh AI tambahan
- **Accessibility**: Peningkatan untuk kebutuhan pembelajaran yang beragam
- **AI Tool Integration**: Saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Production AI Patterns**: Permintaan pola penyebaran AI tingkat enterprise

### Response Commitment
- **Issue Response**: Within 48 hours for reported problems
- **Feature Requests**: Evaluation within one week
- **Community Contributions**: Review within one week
- **Security Issues**: Immediate priority with expedited response

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: Content accuracy and link validation
- **Quarterly Updates**: Major content additions and improvements
- **Semi-Annual Reviews**: Comprehensive restructuring and enhancement
- **Annual Releases**: Major version updates with significant improvements

### Monitoring and Quality Assurance
- **Automated Testing**: Regular validation of code examples and links
- **Community Feedback Integration**: Regular incorporation of user suggestions
- **Technology Updates**: Alignment with latest Azure services and azd releases
- **Accessibility Audits**: Regular review for inclusive design principles

## Version Support Policy

### Dukungan Versi Saat Ini
- **Versi Mayor Terbaru**: Dukungan penuh dengan pembaruan rutin
- **Versi Mayor Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Lama**: Hanya dukungan komunitas, tanpa pembaruan resmi

### Panduan Migrasi
Saat versi mayor dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Rincian tentang perubahan yang tidak kompatibel
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Berikutnya**: Kembali ke [README Utama](README.md)

**Tetap Diperbarui**: Pantau repositori ini untuk notifikasi tentang rilis baru dan pembaruan penting pada materi pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai ketepatan, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->