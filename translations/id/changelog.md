# Catatan Perubahan - AZD For Beginners

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan peningkatan yang penting pada repositori AZD For Beginners. Kami mengikuti prinsip penomoran versi semantik dan memelihara log ini untuk membantu pengguna memahami apa yang telah berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapat informasi tentang fitur baru dan penambahan konten
- Memahami perbaikan yang dilakukan pada dokumentasi yang ada
- Melacak perbaikan bug dan koreksi untuk memastikan ketepatan
- Mengikuti evolusi materi pembelajaran dari waktu ke waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi yang paling terkini
- Memberi umpan balik dan saran untuk perbaikan di masa depan

## Riwayat Versi

### [v3.22.0] - 2026-06-16

#### Pengisian Kekosongan untuk Pemula #2: Pembuatan Template, Dev Containers, Pulumi, Azure DevOps, Service Principals, dan Lainnya
**Versi ini menutup celah menengah yang tersisa yang ditemukan oleh analisis azd-coverage: cara menulis dan menerbitkan template Anda sendiri, lingkungan dev-container/Codespaces yang dapat direproduksi, penyedia infrastruktur Pulumi, walkthrough CI/CD Azure DevOps, autentikasi service-principal, panduan pemilihan host (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, penanganan kesalahan hook, dan praktik tim/lingkungan bersama.**

#### Ditambahkan
- **🧱 Pelajaran Bab 4 Baru** `docs/chapter-04-infrastructure/custom-templates.md` — menulis template azd Anda sendiri: struktur yang diperlukan (`azure.yaml`, `infra/`, `src/`), field `metadata.template`, memparameterisasi infrastruktur dengan token resource `uniqueString()` dan tag `azd-env-name`, pengujian lokal dengan `azd init --template <local-path>`, menerbitkan ke GitHub, dan mengirimkan ke galeri Awesome AZD
- **📦 Pelajaran Bab 1 Baru** `docs/chapter-01-foundation/dev-containers.md` — lingkungan azd yang dapat direproduksi dengan Dev Containers dan GitHub Codespaces: `.devcontainer/devcontainer.json` minimal menggunakan fitur resmi `ghcr.io/azure/azure-dev/azd`, fitur khusus bahasa, `docker-in-docker` untuk host kontainer, dan `azd auth login --use-device-code` untuk masuk jarak jauh
- **🧩 Pulumi dengan azd** bagian di `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, tata letak folder Pulumi, stacks yang dipetakan ke environment azd, output/tagging yang diperlukan, dan workflow `azd up` / `azd down` yang identik
- **🎯 Panduan pemilihan host** di `docs/chapter-04-infrastructure/provisioning.md` — perbandingan ramah-pemula antara `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan kapan memilih AKS atau Azure Spring Apps
- **🛠️ Walkthrough CI/CD Azure DevOps** di `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, koneksi layanan dengan federasi identitas workload (OIDC), `azure-dev.yml` yang dihasilkan, dan pengaturan variable-group
- **🔑 Service Principals (Pattern 4)** ditambahkan ke `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non-interaktif dengan client secret vs. kredensial federated/OIDC, kapan digunakan, dan penyimpanan kredensial yang aman
- **🪝 Penanganan kesalahan Hook** subbagian di `docs/chapter-04-infrastructure/deployment-guide.md` — kode keluar dan `set -e`, `continueOnError`, pengujian hooks secara terpisah dengan `azd hooks run`, shell spesifik OS, dan `--debug`
- **👥 Tim / lingkungan bersama** bagian di `docs/chapter-03-configuration/configuration.md` — apa yang berada di `.azure/`, apa yang harus di-gitignore, environment per-developer, `azd env list`/`select`, dan menyediakan nilai environment di CI/CD
- **🧰 Penjelasan `azd restore` dan perluasan `azd package`** di `resources/cheat-sheet.md` — mengembalikan dependensi dan membangun artefak yang dapat dideploy tanpa melakukan deploy

#### Diubah
- **🧭 Tabel pelajaran Bab 4** diperbarui untuk memasukkan pelajaran baru "Menulis Template Anda Sendiri" (Pelajaran 3)
- **🧭 Tabel pelajaran Bab 1** diperbarui untuk memasukkan pelajaran baru "Dev Containers & Codespaces" (Pelajaran 5); footer navigasi dihubungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pengisian Kekosongan untuk Pemula: Pelajaran Multi-Agent Praktis, "Bring Your Own App," Terraform, dan Walkthrough CI/CD
**Versi ini menutup celah terbesar untuk panduan lengkap bagi pemula dengan menambahkan dua pelajaran praktis baru (walkthrough multi-agent yang dapat dideploy dan menambahkan azd ke aplikasi yang sudah ada), pengantar hooks yang ramah pemula, bagian Terraform-with-azd, walkthrough pipeline GitHub Actions langkah demi langkah, penjelasan untuk ekstensi preview baru, dan daftar periksa verifikasi deployment yang eksplisit.**

#### Ditambahkan
- **🤝 Pelajaran Bab 5 Baru** `docs/chapter-05-multi-agent/multi-agent-basics.md` — walkthrough dua-agent yang sepenuhnya praktis dan dapat dideploy (orchestrator + specialist) menggunakan template nyata (`contoso-creative-writer`), mencakup kapan menggunakan multi-agent, workflow `azd up`, memahami resource yang dideploy, pelacakan lintas-agent, kustomisasi, dan pembersihan
- **📦 Pelajaran Bab 1 Baru** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambahkan azd ke proyek yang sudah ada dengan `azd init` ("use code in the current directory"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, deteksi host, dan mendeploy dengan `azd up`
- **🌐 Terraform dengan azd** bagian ditambahkan ke `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, tata letak folder `.tf`, output `AZURE_*` yang diperlukan dan penandaan `azd-env-name`, dan workflow `azd up` / `azd down` yang identik (menutup celah di mana dukungan Terraform diklaim tetapi hanya Bicep yang ditunjukkan)
- **⚙️ Walkthrough GitHub Actions langkah demi langkah** di `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke deploy otomatis: `azd pipeline config`, kredensial federated OIDC (tanpa secret tersimpan), `azure-dev.yml` yang dihasilkan, dan panduan secrets-vs-variables
- **🪝 Pengantar "Baru dengan hooks?" untuk pemula** di `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, tabel stage hook, hook minimal pertama, dan menjalankan hooks secara manual dengan `azd hooks run`
- **✅ Daftar Periksa "Verifikasi Deployment Anda"** ditambahkan ke Langkah 5 pada `docs/chapter-01-foundation/first-project.md` — smoke test, pemeriksaan endpoint kesehatan, dan kriteria keberhasilan yang eksplisit
- **🧩 Penjelasan untuk ekstensi preview baru** `azure.ai.skills` dan `azure.ai.connections` (apa mereka dan kapan menggunakannya) di `docs/chapter-08-production/production-ai-practices.md`

#### Diubah
- **🧭 Tabel pelajaran Bab 5** dikoreksi: `multi-agent-basics.md` sekarang adalah Pelajaran 1 (satu-satunya pelajaran yang sepenuhnya praktis), dengan pelabelan yang jujur bahwa Pelajaran 2 berada di Bab 6 dan skenario Retail adalah blueprint arsitektur, bukan template satu-perintah
- **🧭 Tabel pelajaran Bab 1** sekarang memasukkan pelajaran baru "Bring Your Own App" (Pelajaran 4)
- **🔗 Footer navigasi** diperbarui: `first-project.md` sekarang menautkan maju ke `bring-your-own-app.md`

#### Diperbaiki
- **🧱 Menutup celah Terraform yang "diklaim tetapi hilang"** — kursus sebelumnya merujuk dukungan Terraform tanpa menunjukkannya
- **🔀 Mengoreksi tautan silang Bab 5 yang menyesatkan** yang memberi kesan bahwa implementasi multi-agent penuh ada padahal hanya blueprint arsitektur

#### Berkas yang Diperbarui
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(baru)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(baru)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Penyegaran AZD 1.25.6, Perintah Siklus Hidup Agen Lengkap & Rebrand Aspire
**Versi ini memvalidasi ulang kursus terhadap `azd` `1.25.6` (Juni 2026) dan ekstensi `azure.ai.agents` `0.1.40-preview`, memperluas panduan AI dari "membuat kerangka agen" ke siklus hidup agen lengkap (test → evaluate → optimize → inspect → delete), menonjolkan ekstensi preview baru `azure.ai.skills` dan `azure.ai.connections`, dan mencatat rebrand produk ".NET Aspire" → "Aspire".**

#### Ditambahkan
- **🔁 Cakupan siklus hidup agen penuh** untuk pemula dan insinyur AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabel Siklus Hidup (scaffold → test → measure → improve → inspect → clean up) ditambahkan ke bagian Extensions and AI Commands
  - `docs/chapter-08-production/production-ai-practices.md` — Bagian baru "Managing the Agent Lifecycle" yang mencakup `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perintah Agen AI yang diperluas dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Ekstensi preview baru** yang didokumentasikan: `azure.ai.skills` (keterampilan agen yang dapat digunakan ulang) dan `azure.ai.connections` (Foundry connections) ditambahkan ke tabel ekstensi dan cheat sheet
- **⏱️ Panduan waktu respons** — contoh `azd ai agent invoke` sekarang mencatat total latency dan time-to-first-byte
- **📌 Banner versi** di README root yang mengarahkan pembelajar ke `azd version` dan `azd upgrade`

#### Diubah
- **✅ Baseline validasi diperbarui** dari `azd 1.23.12` (Maret 2026) ke `azd 1.25.6` (Juni 2026) di seluruh README bab dan dokumen workshop
- **🤖 Catatan ekstensi Bab 2** diperbarui dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh validasi workshop** (output `azd version`) diperbarui ke `1.25.6`
- **🧭 README "What's New in azd Today"** disegarkan untuk menyoroti siklus hidup agen end-to-end, ekstensi AI baru, dan perbaikan kualitas hidup terbaru (`azd init` idempotency, pembersihan token kadaluwarsa `azd auth login`, prompt first-run `azd tool`)
- **📖 Chapter 2 agents.md (Option 4)** sekarang mengarahkan pembelajar ke perintah siklus hidup pasca-deploy daripada berhenti di `azd up`

#### Diperbaiki
- **🏷️ Penamaan produk** — menambahkan catatan rebrand Aspire (".NET Aspire" sekarang cukup "Aspire"); dukungan azd untuk Aspire tidak berubah
- **🔎 Validasi rilis langsung** dikonfirmasi terhadap feed rilis Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) dan `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Berkas yang Diperbarui
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/azd-basics.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `docs/chapter-08-production/production-ai-practices.md`
- `resources/cheat-sheet.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

---

### [v3.19.1] - 2026-03-27
#### Klarifikasi Onboarding Pemula, Validasi Pengaturan & Pembersihan Perintah AZD Akhir
**Versi ini menindaklanjuti pemeriksaan validasi AZD 1.23 dengan peninjauan dokumentasi berfokus pada pemula: menjelaskan panduan otentikasi AZD-first, menambahkan skrip validasi pengaturan lokal, memverifikasi perintah kunci terhadap AZD CLI langsung, dan menghapus referensi perintah sumber Inggris yang sudah usang di luar changelog.**

#### Ditambahkan
- **🧪 Skrip validasi pengaturan pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` agar pembelajar dapat memastikan alat yang diperlukan sebelum memulai Bab 1
- **✅ Langkah validasi pengaturan di muka** di README root dan README Bab 1 sehingga prasyarat yang hilang terdeteksi sebelum `azd up`

#### Diubah
- **🔐 Panduan otentikasi pemula** kini secara konsisten memperlakukan `azd auth login` sebagai jalur utama untuk alur kerja AZD, dengan `az login` disebut sebagai opsional kecuali perintah Azure CLI digunakan langsung
- **📚 Alur onboarding Bab 1** kini mengarahkan pembelajar untuk memvalidasi pengaturan lokal mereka sebelum instalasi, otentikasi, dan langkah deployment pertama
- **🛠️ Pesan validator** kini jelas memisahkan persyaratan yang menghalangi dari peringatan Azure CLI opsional untuk jalur pemula yang hanya menggunakan AZD
- **📖 Dokumen konfigurasi, pemecahan masalah, dan contoh** kini membedakan antara otentikasi AZD yang diperlukan dan masuk Azure CLI opsional di mana sebelumnya keduanya disajikan tanpa konteks

#### Diperbaiki
- **📋 Referensi perintah sumber Inggris yang tersisa** diperbarui ke bentuk AZD saat ini, termasuk `azd config show` di cheat sheet dan `azd monitor --overview` di mana panduan overview Portal Azure dimaksudkan
- **🧭 Klaim pemula di Bab 1** dibuat lebih lunak untuk menghindari janji berlebihan mengenai perilaku tanpa kesalahan atau rollback yang dijamin di semua template dan sumber daya Azure
- **🔎 Validasi CLI langsung** mengonfirmasi dukungan saat ini untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

#### File Diperbarui
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
- **✅ Catatan validasi di seluruh bab inti dan dokumen workshop** untuk membuat baseline AZD yang diuji menjadi eksplisit bagi pembelajar yang menggunakan build CLI yang lebih baru atau lebih lama
- **⏱️ Panduan timeout deployment** untuk deployment aplikasi AI yang memakan waktu lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah inspeksi ekstensi** dengan `azd extension show azure.ai.agents` di dokumen alur kerja AI
- **🌐 Panduan lingkungan workshop yang lebih luas** mencakup GitHub Codespaces, dev container, dan klon lokal dengan MkDocs

#### Diubah
- **📚 README intro bab** kini secara konsisten mencatat validasi terhadap `azd 1.23.12` di seluruh bagian foundation, configuration, infrastructure, multi-agent, pre-deployment, troubleshooting, dan production
- **🛠️ Referensi perintah AZD** diperbarui ke bentuk saat ini di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` tergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` ketika dimaksudkan overview Application Insights
- **🧪 Contoh preview provisioning** disederhanakan ke penggunaan yang didukung saat ini seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Alur workshop** diperbarui sehingga pembelajar dapat menyelesaikan lab di Codespaces, dev container, atau klon lokal alih-alih mengasumsikan eksekusi hanya di Codespaces
- **🔐 Panduan otentikasi** kini lebih memilih `azd auth login` untuk alur kerja AZD, dengan `az login` ditempatkan sebagai opsional ketika perintah Azure CLI digunakan langsung

#### Diperbaiki
- **🪟 Perintah instal Windows** dinormalisasi ke casing paket `winget` saat ini di panduan instalasi
- **🐧 Panduan instal Linux** dikoreksi untuk menghindari instruksi manajer paket `azd` yang distro-spesifik dan tidak didukung dan sebagai gantinya menunjuk ke release assets bila sesuai
- **📦 Contoh model AI** disegarkan dari default lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` ke contoh saat ini seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Cuplikan deployment dan diagnostik** dikoreksi untuk menggunakan perintah environment dan status saat ini dalam log, skrip, dan langkah pemecahan masalah
- **⚙️ Panduan GitHub Actions** diperbarui dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** diperbarui dari `azd mcp consent` ke `azd copilot consent list`

#### Ditingkatkan
- **🧠 Panduan bab AI** kini lebih menjelaskan perilaku `azd ai` yang sensitif preview, login tenant-spesifik, penggunaan ekstensi saat ini, dan rekomendasi deployment model yang diperbarui
- **🧪 Instruksi workshop** kini menggunakan contoh versi yang lebih realistis dan bahasa pengaturan lingkungan yang lebih jelas untuk lab praktis
- **📈 Dokumentasi produksi dan pemecahan masalah** kini lebih selaras dengan monitoring saat ini, model fallback, dan contoh tier biaya

#### File Diperbarui
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

#### Perintah AZD AI CLI, Validasi Konten & Perluasan Template
**Versi ini menambahkan cakupan perintah `azd ai`, `azd extension`, dan `azd mcp` di semua bab terkait AI, memperbaiki tautan yang rusak dan kode yang usang di agents.md, memperbarui cheat sheet, dan merombak bagian Example Templates dengan deskripsi yang tervalidasi serta template Azure AI AZD baru.**

#### Ditambahkan
- **🤖 Cakupan AZD AI CLI** di 7 file (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagian baru "Extensions and AI Commands" yang memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsi 4: `azd ai agent init` dengan tabel perbandingan (pendekatan template vs manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Sub-bagian "AZD Extensions for Foundry" dan "Agent-First Deployment"
  - `docs/chapter-05-multi-agent/README.md` — Quick Start sekarang menunjukkan jalur deployment berbasis template dan berbasis manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bagian Deploy kini memasukkan opsi `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Sub-bagian "AZD AI Extension Commands for Diagnostics"
  - `resources/cheat-sheet.md` — Bagian baru "AI & Extensions Commands" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Template contoh AZD AI baru** di `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — .NET RAG chat dengan Blazor WebAssembly, Semantic Kernel, dan dukungan obrolan suara
  - **azure-search-openai-demo-java** — Java RAG chat menggunakan Langchain4J dengan opsi deployment ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif multi-agent menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG serverless menggunakan Azure Functions + LangChain.js + Cosmos DB dengan dukungan dev lokal Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG enterprise dengan portal admin, integrasi Teams, dan opsi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi referensi orkestrasi MCP multi-agent dengan server dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Template starter Bicep infrastruktur Azure AI minimal
  - **🔗 Tautan Galeri Awesome AZD AI** — Referensi ke [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Diperbaiki
- **🔗 Navigasi agents.md**: tautan Previous/Next kini cocok dengan urutan pelajaran README Bab 2 (Microsoft Foundry Integration → Agents → AI Model Deployment)
- **🔗 Tautan rusak di agents.md**: `production-ai-practices.md` dikoreksi menjadi `../chapter-08-production/production-ai-practices.md` (3 kemunculan)
- **📦 Kode usang di agents.md**: Mengganti `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak valid di agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Penghitungan token di agents.md**: Mengganti perkiraan kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Mengoreksi layanan dari "Cognitive Search + App Service" menjadi "Azure AI Search + Azure Container Apps" (host default berubah Okt 2024)
- **contoso-chat**: Memperbarui deskripsi untuk merujuk Azure AI Foundry + Prompty, sesuai dengan judul repo dan tumpukan teknologi yang sebenarnya

#### Dihapus
- **ai-document-processing**: Menghapus referensi template yang tidak berfungsi (repo tidak dapat diakses publik sebagai template AZD)

#### Ditingkatkan
- **📝 Latihan di agents.md**: Latihan 1 kini menunjukkan keluaran yang diharapkan dan langkah `azd monitor`; Latihan 2 memasukkan kode pendaftaran `FunctionTool` lengkap; Latihan 3 mengganti panduan samar dengan perintah `prepdocs.py` yang konkret
- **📚 Sumber daya agents.md**: Memperbarui tautan dokumentasi ke dokumen dan quickstart Azure AI Agent Service yang terkini
- **📋 Tabel Next Steps di agents.md**: Menambahkan tautan AI Workshop Lab untuk cakupan bab yang lengkap

#### File Diperbarui
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
**Versi ini meningkatkan navigasi bab README.md dengan format tabel yang ditingkatkan.**

#### Diubah
- **Course Map Table**: Ditingkatkan dengan tautan pelajaran langsung, perkiraan durasi, dan peringkat kompleksitas
- **Folder Cleanup**: Menghapus folder lama yang redundan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Link Validation**: Semua 21+ tautan internal dalam tabel Course Map diverifikasi

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
- `workshop/README.md` - Halaman awal workshop
- `workshop/docs/index.md` - Indeks workshop
- `workshop/docs/instructions/*.md` - Semua file instruksi workshop

---

### [v3.15.0] - 2026-02-05

#### Restrukturisasi Besar Repositori: Nama Folder Berbasis Bab
**Versi ini merestrukturisasi dokumentasi ke dalam folder khusus per bab untuk navigasi yang lebih jelas.**

#### Penggantian Nama Folder
Folder lama telah diganti dengan folder bernomor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
  - Perintah mulai cepat
  - Navigasi ke bab lain

#### Diubah
- **🔗 Memperbarui semua tautan internal**: 78+ jalur diperbarui di seluruh file dokumentasi
- **🗺️ README.md Utama**: Memperbarui Peta Kursus dengan struktur bab baru
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
  - Apa itu agen AI dan bagaimana perbedaannya dengan chatbot
  - Tiga template agen mulai cepat (Foundry Agents, Prompty, RAG)
  - Pola arsitektur agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan kustomisasi alat
  - Pemantauan dan pelacakan metrik
  - Pertimbangan biaya dan optimisasi
  - Skenario pemecahan masalah umum
  - Tiga latihan praktik dengan kriteria keberhasilan

#### Struktur Konten
- **Pengenalan**: Konsep agen untuk pemula
- **Mulai Cepat**: Terapkan agen dengan `azd init --template get-started-with-ai-agents`
- **Pola Arsitektur**: Diagram visual pola agen
- **Konfigurasi**: Pengaturan alat dan variabel lingkungan
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktik bertahap (20-45 menit masing-masing)

---

### [v3.12.0] - 2026-02-05

#### Pembaruan Lingkungan DevContainer
**Versi ini memperbarui konfigurasi container pengembangan dengan alat modern dan default yang lebih baik untuk pengalaman belajar AZD.**

#### Diubah
- **🐳 Base Image**: Diperbarui dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terbaru)
- **📛 Container Name**: Diganti namanya dari "Python 3" menjadi "AZD for Beginners" untuk kejelasan

#### Ditambahkan
- **🔧 Fitur Dev Container Baru**:
  - `azure-cli` dengan dukungan Bicep diaktifkan
  - `node:20` (versi LTS untuk template AZD)
  - `github-cli` untuk manajemen template
  - `docker-in-docker` untuk penyebaran aplikasi container

- **🔌 Penerusan Port**: Port yang telah dikonfigurasi sebelumnya untuk pengembangan umum:
  - 8000 (pratayang MkDocs)
  - 3000 (aplikasi web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Ekstensi VS Code Baru**:
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

- **⚙️ Pengaturan VS Code**: Menambahkan pengaturan default untuk interpreter Python, format saat menyimpan, dan pemangkasan spasi

- **📦 requirements-dev.txt Diperbarui**:
  - Menambahkan plugin MkDocs minify
  - Menambahkan pre-commit untuk kualitas kode
  - Menambahkan paket Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Pasca-Buat**: Sekarang memverifikasi instalasi AZD dan Azure CLI saat container dimulai

---

### [v3.11.0] - 2026-02-05

#### Perombakan README untuk Pemula
**Versi ini secara signifikan meningkatkan README.md agar lebih mudah diakses bagi pemula dan menambahkan sumber daya penting untuk pengembang AI.**

#### Ditambahkan
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas kapan menggunakan masing-masing alat dengan contoh praktis
- **🌟 Tautan Awesome AZD**: Tautan langsung ke galeri template komunitas dan sumber daya kontribusi:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ template siap-disebarkan
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kontribusi komunitas
- **🎯 Panduan Mulai Cepat**: Bagian memulai yang disederhanakan 3 langkah (Install → Login → Deploy)
- **📊 Tabel Navigasi Berbasis Pengalaman**: Panduan jelas tentang dari mana memulai berdasarkan pengalaman pengembang

#### Diubah
- **Struktur README**: Disusun ulang untuk pengungkapan bertahap - informasi kunci terlebih dahulu
- **Bagian Pengenalan**: Ditulis ulang untuk menjelaskan "The Magic of `azd up`" bagi pemula lengkap
- **Menghapus Konten Duplikat**: Menghilangkan bagian pemecahan masalah yang duplikat
- **Perintah Pemecahan Masalah**: Memperbaiki referensi `azd logs` untuk menggunakan `azd monitor --logs` yang valid

#### Diperbaiki
- **🔐 Perintah Autentikasi**: Menambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Referensi Perintah Tidak Valid**: Menghapus sisa `azd logs` dari bagian pemecahan masalah README

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan ke README.md utama dan resources/cheat-sheet.md
- **Audiens Target**: Perbaikan secara khusus ditujukan untuk pengembang yang baru menggunakan AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Akurasi Perintah Azure Developer CLI
**Versi ini mengoreksi perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD yang Tidak Ada Dihapus**: Audit komprehensif dan koreksi perintah tidak valid:
  - `azd logs` (tidak ada) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI
  - `azd service` subcommands (tidak ada) → digantikan dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau digantikan dengan alternatif yang valid
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak ada) → dihapus
  - Flag `azd provision --what-if/--rollback` (tidak ada) → diperbarui untuk menggunakan `--preview`
  - `azd config validate` (tidak ada) → digantikan dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus

- **📚 File yang Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Perombakan besar referensi perintah
  - `docs/deployment/deployment-guide.md`: Memperbaiki strategi rollback dan penyebaran
  - `docs/troubleshooting/debugging.md`: Memperbaiki bagian analisis log
  - `docs/troubleshooting/common-issues.md`: Memperbarui perintah pemecahan masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Memperbaiki perintah pemantauan
  - `docs/getting-started/first-project.md`: Memperbarui contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Memperbaiki perintah melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki perintah debugging agen

#### Diubah
- **Strategi Rollback**: Memperbarui dokumentasi untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback bawaan)
- **Melihat Log**: Menggantikan referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bagian Performa**: Menghapus flag penyebaran paralel/incremental yang tidak ada, memberikan alternatif yang valid

#### Rincian Teknis
- **Perintah AZD yang Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor yang Valid**: `--live`, `--logs`, `--overview`
- **Fitur yang Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Catatan
- **Verifikasi**: Perintah tervalidasi terhadap Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyelesaian Workshop dan Pembaruan Kualitas Dokumentasi
**Versi ini menyelesaikan modul workshop interaktif, memperbaiki semua tautan dokumentasi yang rusak, dan meningkatkan kualitas konten secara keseluruhan untuk pengembang AI yang menggunakan Microsoft AZD.**

#### Ditambahkan
- **📝 CONTRIBUTING.md**: Dokumen pedoman kontribusi baru dengan:
  - Pedoman contoh kode dan konvensi pesan commit
  - Informasi keterlibatan komunitas

#### Selesai
- **🎯 Workshop Module 7 (Wrap-up)**: Modul wrap-up selesai penuh dengan:
  - Ringkasan komprehensif pencapaian workshop
  - Bagian konsep kunci yang dikuasai mencakup AZD, template, dan Microsoft Foundry
  - Rekomendasi lanjutan untuk perjalanan pembelajaran
  - Latihan tantangan workshop dengan peringkat kesulitan
  - Umpan balik komunitas dan tautan dukungan

- **📚 Workshop Module 3 (Deconstruct)**: Tujuan pembelajaran diperbarui dengan:
  - Panduan aktivasi GitHub Copilot dengan server MCP
  - Pemahaman struktur folder template AZD
  - Pola organisasi Infrastructure-as-code (Bicep)
  - Instruksi lab praktikum

- **🔧 Workshop Module 6 (Teardown)**: Selesai dengan:
  - Tujuan pembersihan sumber daya dan manajemen biaya
  - Penggunaan `azd down` untuk deprovisioning infrastruktur yang aman
  - Panduan pemulihan layanan kognitif yang dihapus secara soft
  - Dorongan eksplorasi tambahan untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Perbaikan Tautan Rusak**: Memperbaiki 15+ tautan dokumentasi internal yang rusak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki jalur ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Mengoreksi jalur ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki jalur FAQ dan panduan pemecahan masalah
  - `examples/container-app/microservices/README.md`: Mengoreksi jalur course home dan panduan deployment
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI
  - `course-outline.md`: Memperbaiki referensi panduan instruktur dan lab workshop AI

- **📅 Spanduk Status Workshop**: Diperbarui dari "Under Construction" menjadi status workshop aktif dengan tanggal Februari 2026

- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi yang rusak di README.md workshop yang mengarah ke folder lab-1-azd-basics yang tidak ada

#### Diubah
- **Presentasi Workshop**: Menghapus peringatan "under construction", workshop sekarang lengkap dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar-modul yang tepat
- **Referensi Jalur Pembelajaran**: Memperbarui silang-referensi bab untuk menggunakan jalur microsoft-foundry yang benar

#### Divalidasi
- ✅ Semua file markdown bahasa Inggris memiliki tautan internal yang valid
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran
- ✅ Navigasi antar bab dan modul berfungsi dengan benar
- ✅ Konten cocok untuk pengembang AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur ramah-pemula dipertahankan
- ✅ CONTRIBUTING.md memberikan panduan yang jelas bagi kontributor komunitas

#### Implementasi Teknis
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md
- **Audit Konten**: Tinjauan manual atas kelengkapan workshop dan kesesuaian untuk pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul yang konsisten diterapkan

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggris
- **Terjemahan**: Folder terjemahan tidak diperbarui dalam versi ini (terjemahan otomatis akan disinkronkan nanti)
- **Durasi Workshop**: Workshop lengkap sekarang menyediakan 3-4 jam pembelajaran praktis

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agen
**Versi ini menambahkan pelajaran komprehensif kelas-A tentang integrasi Application Insights, pola autentikasi, dan koordinasi multi-agen untuk penyebaran produksi.**

#### Ditambahkan
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:
  - Penyebaran berfokus AZD dengan provisioning otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang berfungsi dengan telemetri kustom (1,200+ baris)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Microsoft Foundry Models)
  - 6 diagram Mermaid (arsitektur, distributed tracing, alur telemetri)
  - 3 latihan praktis (peringatan, dashboard, pemantauan AI)
  - Contoh kueri Kusto dan strategi optimisasi biaya
  - Streaming metrik langsung dan debugging waktu-nyata
  - Waktu pembelajaran 40-50 menit dengan pola siap-produksi

- **🔐 Pelajaran Pola Autentikasi & Keamanan**: di `docs/getting-started/authsecurity.md`:
  - 3 pola autentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk penyebaran yang aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (mengaktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik terbaik keamanan dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola autentikasi tanpa kata sandi siap-produksi

- **🤖 Pelajaran Pola Koordinasi Multi-Agen**: di `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sekuensial, paralel, hierarkis, event-driven, konsensus)
  - Implementasi layanan orchestrator lengkap (Python/Flask, 1,500+ baris)
  - 3 implementasi agen khusus (Research, Writer, Editor)
  - Integrasi Service Bus untuk antrian pesan
  - Manajemen status Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid yang menunjukkan interaksi agen
  - 3 latihan lanjutan (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/bulan) dengan strategi optimisasi
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pre-deployment**: Sekarang mencakup pola pemantauan dan koordinasi yang komprehensif
- **Bab Getting Started**: Ditingkatkan dengan pola autentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observabilitas
- **Rangkuman Kursus**: Diperbarui untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progresi Pembelajaran**: Integrasi yang lebih baik antara keamanan dan pemantauan di seluruh kursus
- **Kualitas Dokumentasi**: Standar kelas-A konsisten (95-97%) di seluruh pelajaran baru
- **Pola Produksi**: Cakupan end-to-end lengkap untuk penyebaran tingkat perusahaan

#### Ditingkatkan
- **Pengalaman Pengembang**: Jalur yang jelas dari pengembangan ke pemantauan produksi
- **Standar Keamanan**: Pola profesional untuk autentikasi dan pengelolaan rahasia
- **Observabilitas**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Microsoft Foundry Models dan sistem multi-agen

#### Divalidasi
- ✅ Semua pelajaran menyertakan kode kerja lengkap (bukan potongan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total di 3 pelajaran)
- ✅ Latihan praktis dengan langkah verifikasi (9 total)
- ✅ Template Bicep siap-produksi yang dapat disebarkan via `azd up`
- ✅ Analisis biaya dan strategi optimisasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agen lanjutan
- **Konten Baru Secara Keseluruhan**: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri kustom + distributed tracing
- **Autentikasi**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + kueri Kusto + peringatan + dashboard
- **Manajemen Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Microsoft Foundry Models Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh penyebaran Microsoft Foundry Models lengkap dengan antarmuka chat gpt-4.1.**

#### Ditambahkan
- **🤖 Contoh Chat Microsoft Foundry Models**: Penyebaran gpt-4.1 lengkap dengan implementasi yang berfungsi di `examples/azure-openai-chat/`:
  - Infrastruktur Microsoft Foundry Models lengkap (penyebaran model gpt-4.1)
  - Antarmuka chat baris perintah Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan kunci API yang aman
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan laju dan penanganan error
  - README komprehensif dengan panduan penyebaran 35-45 menit
  - 11 berkas siap-produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik langsung ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-environment (15 menit)
  - Latihan 2: Latihan pengelolaan rahasia (10 menit)
  - Kriteria keberhasilan dan langkah verifikasi yang jelas
- **✅ Verifikasi Penyebaran**: Menambahkan bagian verifikasi ke panduan penyebaran:
  - Prosedur pengecekan kesehatan
  - Daftar periksa kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah penyebaran
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui ke kualitas A-grade (93%):
  - Menambahkan azure-openai-chat ke semua bagian relevan
  - Memperbarui jumlah contoh lokal dari 3 menjadi 4
  - Menambahkan ke tabel Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Menengah
  - Ditambahkan ke bagian Template Microsoft Foundry
  - Memperbarui Matriks Perbandingan dan bagian pencarian teknologi
- **Kualitas Dokumentasi**: Meningkat dari B+ (87%) → A- (92%) di folder docs:
  - Menambahkan output yang diharapkan ke contoh perintah penting
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran praktis dengan latihan yang aplikatif

#### Diubah
- **Progresi Pembelajaran**: Integrasi contoh AI yang lebih baik untuk pembelajar menengah
- **Struktur Dokumentasi**: Latihan yang lebih dapat ditindaklanjuti dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja utama

#### Ditingkatkan
- **Pengalaman Pengembang**: Penyebaran Microsoft Foundry Models sekarang memakan 35-45 menit (vs 60-90 untuk alternatif kompleks)
- **Transparansi Biaya**: Estimasi biaya yang jelas ($50-200/bulan) untuk contoh Microsoft Foundry Models
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi yang konsisten

#### Divalidasi
- ✅ Contoh Microsoft Foundry Models berfungsi penuh dengan `azd up`
- ✅ Semua 11 berkas implementasi sintaksisnya benar
- ✅ Instruksi README sesuai dengan pengalaman penyebaran aktual
- ✅ Tautan dokumentasi diperbarui di 8+ lokasi
- ✅ Indeks contoh mencerminkan 4 contoh lokal dengan akurat
- ✅ Tidak ada tautan eksternal duplikat di tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Microsoft Foundry Models**: gpt-4.1 + Key Vault + pola Container Apps
- **Keamanan**: Siap Managed Identity, rahasia di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimisasi penggunaan
- **Penyebaran**: Perintah `azd up` tunggal untuk pengaturan lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Besar: Contoh Penyebaran Aplikasi Kontainer
**Versi ini memperkenalkan contoh penyebaran aplikasi kontainer siap-produksi yang komprehensif menggunakan Azure Developer CLI (AZD), dengan dokumentasi lengkap dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Aplikasi Kontainer**: Contoh lokal baru di `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Ikhtisar lengkap penyebaran terkontainerisasi, quick start, produksi, dan pola lanjutan
  - [API Flask Sederhana](../../examples/container-app/simple-flask-api): REST API ramah-pemula dengan scale-to-zero, health probes, pemantauan, dan pemecahan masalah
  - [Arsitektur Mikroservis](../../examples/container-app/microservices): Penyebaran multi-layanan siap-produksi (API Gateway, Product, Order, User, Notification), messaging asinkron, Service Bus, Cosmos DB, Azure SQL, distributed tracing, deployment blue-green/canary
- **Praktik Terbaik**: Keamanan, pemantauan, optimisasi biaya, dan panduan CI/CD untuk beban kerja terkontainerisasi
- **Contoh Kode**: `azure.yaml`, template Bicep lengkap, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario pengujian end-to-end, perintah pemantauan, panduan pemecahan masalah

#### Diubah
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh aplikasi kontainer baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Diperbarui untuk menyoroti contoh aplikasi kontainer, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Rangkuman Kursus & Panduan Studi**: Diperbarui untuk merujuk contoh aplikasi kontainer baru dan pola penyebaran di bab terkait

#### Divalidasi
- ✅ Semua contoh baru dapat disebarkan dengan `azd up` dan mengikuti praktik terbaik
- ✅ Cross-link dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario dari pemula hingga lanjutan, termasuk mikroservis produksi

#### Catatan
- **Ruang Lingkup**: Dokumentasi dan contoh bahasa Inggris saja
- **Langkah Selanjutnya**: Perluasan dengan pola kontainer lanjutan tambahan dan otomatisasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Rebranding Produk: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk yang komprehensif dari "Microsoft Foundry" ke "Microsoft Foundry" di seluruh dokumentasi bahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" ke "Microsoft Foundry"
  - Memperbarui semua referensi di seluruh dokumentasi bahasa Inggris di folder `docs/`
  - Mengganti nama folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Nama file diubah: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referensi konten diperbarui di 7 file dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` diubah nama menjadi `docs/microsoft-foundry/`
  - Semua referensi silang diperbarui untuk mencerminkan struktur folder baru
  - Tautan navigasi divalidasi di seluruh dokumentasi

- **📄 Penggantian Nama File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua tautan internal diperbarui untuk merujuk ke nama file baru

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

#### Telah Divalidasi
- ✅ Tidak ada lagi referensi jalur folder "ai-foundry" yang tersisa di dokumen bahasa Inggris
- ✅ Tidak ada lagi referensi nama produk "Microsoft Foundry" yang tersisa di dokumen bahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama file dan folder berhasil diselesaikan
- ✅ Referensi silang antar bab telah divalidasi

#### Catatan
- **Lingkup**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggris di folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui dalam versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui dalam versi ini
- **Contoh**: File contoh mungkin masih merujuk penamaan lama (akan ditangani pada pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repository GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Validasi semua tautan internal bahwa masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau dan Validasi Infrastruktur
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau baru Azure Developer CLI dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi Fitur azd provision --preview**: Cakupan komprehensif dari kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi terperinci dalam panduan penyediaan dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keselamatan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradasi dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Cap waktu pembaruan terakhir untuk transparansi
  - Desain responsif untuk perangkat seluler

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsionalitas pratinjau diintegrasikan ke seluruh dokumentasi penyebaran
- **Validasi Pra-Penerapan**: Skrip otomatis kini menyertakan pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk memasukkan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Ekspektasi pengguna dijelaskan mengenai status pengembangan konten

#### Diubah
- **Praktik Terbaik Penyebaran**: Alur kerja yang mengutamakan pratinjau sekarang menjadi pendekatan yang direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Ditingkatkan Lagi
- **Pendekatan Mengutamakan Keselamatan**: Perubahan infrastruktur kini dapat divalidasi sebelum penyebaran
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk ditinjau dan disetujui
- **Kesadaran Biaya**: Pemahaman yang lebih baik tentang biaya sumber daya sebelum penyediaan
- **Mitigasi Risiko**: Mengurangi kegagalan penyebaran melalui validasi sebelumnya

#### Implementasi Teknis
- **Integrasi Multi-dokumen**: Fitur pratinjau didokumentasikan di 4 file kunci
- **Pola Perintah**: Sintaks dan contoh yang konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau disertakan dalam alur kerja dan skrip validasi
- **Indikator Visual**: Penandaan fitur BARU yang jelas untuk keterlihatan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Presentasi Profesional**: Mempertahankan kredibilitas repository sambil menetapkan ekspektasi
- **Transparansi Garis Waktu**: Cap waktu pembaruan terakhir Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Materi Workshop yang Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran 7 langkah yang terarah dari penemuan hingga kustomisasi
  - 0-Introduction: Ikhtisar workshop dan pengaturan
  - 1-Select-AI-Template: Proses penemuan dan pemilihan template
  - 2-Validate-AI-Template: Prosedur penyebaran dan validasi
  - 3-Deconstruct-AI-Template: Memahami arsitektur template
  - 4-Configure-AI-Template: Konfigurasi dan kustomisasi
  - 5-Customize-AI-Template: Modifikasi lanjutan dan iterasi
  - 6-Teardown-Infrastructure: Pembersihan dan manajemen sumber daya
  - 7-Wrap-up: Ringkasan dan langkah selanjutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran yang ditingkatkan
- **🎯 Jalur Pembelajaran Praktis**: Metodologi 3 langkah (Penemuan → Penyebaran → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **Lab AI Workshop**: Diperluas dengan pengalaman pembelajaran terstruktur 2-3 jam yang komprehensif
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan bantuan visual
- **Progresi Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga penyebaran produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang lebih efisien

#### Ditingkatkan Lagi
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan toggle tema
- **Pembelajaran Mandiri**: Struktur workshop yang fleksibel mengakomodasi kecepatan belajar berbeda
- **Aplikasi Praktis**: Skenario penyebaran template AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan kata kunci dan pelajaran yang cepat
- **Salin Blok Kode**: Fungsionalitas hover-to-copy untuk semua contoh kode
- **Toggle Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Tangkapan layar dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Besar dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repository.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Merefaktor seluruh kursus menjadi 8 bab pembelajaran progresif
  - Chapter 1: Foundation & Quick Start (⭐ - 30-45 menit)
  - Chapter 2: AI-First Development (⭐⭐ - 1-2 jam)
  - Chapter 3: Configuration & Authentication (⭐⭐ - 45-60 menit)
  - Chapter 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 jam)
  - Chapter 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 jam)
  - Chapter 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 jam)
  - Chapter 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 jam)
  - Chapter 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi konsisten di seluruh dokumentasi
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk berbagai level pengalaman dan tujuan
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat ditautkan dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini menyertakan konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan studi terhubung ke bab terkait
- **Integrasi Workshop**: Lab praktis dipetakan ke beberapa tujuan pembelajaran bab

#### Diubah
- **Progresi Pembelajaran**: Beralih dari dokumentasi linier ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi konten spesifik AI yang lebih baik di seluruh perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Bab 8 untuk pembelajar perusahaan

#### Ditingkatkan Lagi
- **Pengalaman Pengguna**: Breadcrumb navigasi dan indikator progresi bab yang jelas
- **Aksesibilitas**: Pola navigasi konsisten untuk memudahkan penjelajahan kursus
- **Presentasi Profesional**: Struktur bergaya universitas cocok untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu untuk menemukan konten relevan berkurang melalui organisasi yang lebih baik

#### Implementasi Teknis
- **Header Navigasi**: Standarisasi navigasi bab di lebih dari 40 file dokumentasi
- **Footer Navigasi**: Panduan progresi dan indikator penyelesaian bab yang konsisten
- **Tautan Silang**: Sistem penautan internal yang komprehensif menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh dikaitkan jelas dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi disusun ulang untuk selaras dengan sistem 8-bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab menyertakan tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal pembelajaran mingguan dengan hasil yang terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas praktis dengan skenario penyebaran nyata dan pemecahan masalah
- **📊 Perkembangan Keterampilan**: Kemajuan jelas dari konsep dasar ke pola perusahaan dengan fokus pengembangan karier
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran 10 minggu yang terstruktur dengan validasi tonggak

### [v3.1.0] - 2025-09-17

#### Peningkatan Solusi Multi-Agent AI
**Versi ini memperbaiki solusi ritel multi-agent dengan penamaan agen yang lebih baik dan dokumentasi yang ditingkatkan.**

#### Diubah
- **Terminologi Multi-Agent**: Mengganti "Cora agent" dengan "Customer agent" di seluruh solusi multi-agent ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "Customer agent" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi Customer agent
- **Diagram Arsitektur**: Memperbarui diagram Mermaid dengan penamaan agen yang diperbarui
- **Contoh Kode**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penyebaran untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Ditingkatkan Lagi
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyesuaian lebih baik dengan konvensi penamaan perusahaan
- **Materi Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan edukasi
- **Kegunaan Template**: Pemahaman fungsi agen dan pola penyebaran yang disederhanakan

#### Rincian Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM untuk menggunakan tipe agen "customer"
- Memperbarui variabel lingkungan dari CORA_AGENT_* menjadi pola CUSTOMER_AGENT_*
- Menyegarkan semua perintah penyebaran dan konfigurasi container

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repository menjadi sumber pembelajaran yang komprehensif berfokus pada AI dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran AI-First**: Restrukturisasi lengkap yang memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi komprehensif untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **Pola Penyebaran Model AI**: Panduan terperinci yang mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **AI Workshop Lab**: lokakarya praktis 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat dideploy dengan AZD
- **Production AI Best Practices**: pola siap-enterprise untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **AI-Specific Troubleshooting Guide**: panduan pemecahan masalah komprehensif untuk Microsoft Foundry Models, Cognitive Services, dan masalah deployment AI
- **AI Template Gallery**: koleksi unggulan template Microsoft Foundry dengan penilaian kompleksitas
- **Workshop Materials**: struktur lokakarya lengkap dengan lab praktis dan materi referensi

#### Enhanced
- **README Structure**: fokus pengembang AI dengan 45% data minat komunitas dari Microsoft Foundry Discord
- **Learning Paths**: jalur pembelajaran khusus pengembang AI bersamaan dengan jalur tradisional untuk pelajar dan insinyur DevOps
- **Template Recommendations**: template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Community Integration**: dukungan komunitas Discord yang ditingkatkan dengan saluran dan diskusi khusus AI

#### Security & Production Focus
- **Managed Identity Patterns**: konfigurasi autentikasi dan keamanan khusus AI
- **Cost Optimization**: pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Multi-Region Deployment**: strategi untuk deployment aplikasi AI secara global
- **Performance Monitoring**: metrik khusus AI dan integrasi Application Insights

#### Documentation Quality
- **Linear Course Structure**: progresi logis dari pola deployment AI pemula hingga lanjutan
- **Validated URLs**: semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Complete Reference**: semua tautan dokumentasi internal divalidasi dan berfungsi
- **Production Ready**: pola deployment enterprise dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Major Changes - Repository Restructure and Professional Enhancement
**This version represents a significant overhaul of the repository structure and content presentation.**

#### Added
- **Structured Learning Framework**: semua halaman dokumentasi sekarang menyertakan bagian Introduction, Learning Goals, dan Learning Outcomes
- **Navigation System**: ditambahkan tautan Previous/Next lesson di seluruh dokumentasi untuk panduan progresi pembelajaran
- **Study Guide**: study-guide.md komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi asesmen
- **Professional Presentation**: dihapus semua ikon emoji untuk meningkatkan aksesibilitas dan tampilan profesional
- **Enhanced Content Structure**: peningkatan organisasi dan alur materi pembelajaran

#### Changed
- **Documentation Format**: distandarisasi seluruh dokumentasi dengan struktur konsisten yang berfokus pada pembelajaran
- **Navigation Flow**: mengimplementasikan progresi logis melalui semua materi pembelajaran
- **Content Presentation**: menghapus elemen dekoratif demi format yang jelas dan profesional
- **Link Structure**: memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Improved
- **Accessibility**: menghapus ketergantungan emoji untuk kompatibilitas pembaca layar yang lebih baik
- **Professional Appearance**: presentasi gaya akademis yang rapi cocok untuk pembelajaran enterprise
- **Learning Experience**: pendekatan terstruktur dengan tujuan dan hasil yang jelas untuk setiap pelajaran
- **Content Organization**: alur logis yang lebih baik dan koneksi antar topik terkait

### [v1.0.0] - 2025-09-09

#### Initial Release - Comprehensive AZD Learning Repository

#### Added
- **Core Documentation Structure**
  - Seri panduan getting-started lengkap
  - Dokumentasi deployment dan provisioning komprehensif
  - Sumber daya pemecahan masalah dan panduan debugging terperinci
  - Alat dan prosedur validasi pra-deployment

- **Getting Started Module**
  - AZD Basics: konsep inti dan terminologi
  - Installation Guide: instruksi setup khusus platform
  - Configuration Guide: pengaturan lingkungan dan autentikasi
  - First Project Tutorial: pembelajaran praktis langkah demi langkah

- **Deployment and Provisioning Module**
  - Deployment Guide: dokumentasi alur kerja lengkap
  - Provisioning Guide: Infrastruktur sebagai Kode dengan Bicep
  - Best practices untuk deployment produksi
  - Pola arsitektur multi-layanan

- **Pre-deployment Validation Module**
  - Capacity Planning: validasi ketersediaan sumber daya Azure
  - SKU Selection: panduan tingkat layanan komprehensif
  - Pre-flight Checks: skrip validasi otomatis (PowerShell dan Bash)
  - Estimasi biaya dan alat perencanaan anggaran

- **Troubleshooting Module**
  - Common Issues: masalah yang sering ditemui dan solusinya
  - Debugging Guide: metodologi pemecahan masalah yang sistematis
  - Teknik dan alat diagnostik lanjutan
  - Pemantauan dan optimasi performa

- **Resources and References**
  - Command Cheat Sheet: referensi cepat untuk perintah penting
  - Glossary: definisi terminologi dan akronim yang komprehensif
  - FAQ: jawaban terperinci untuk pertanyaan umum
  - Tautan sumber eksternal dan koneksi komunitas

- **Examples and Templates**
  - Contoh Aplikasi Web Sederhana
  - Template deployment Static Website
  - Konfigurasi Aplikasi Container
  - Pola integrasi Database
  - Contoh arsitektur Microservices
  - Implementasi fungsi Serverless

#### Features
- **Multi-Platform Support**: panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Multiple Skill Levels**: konten dirancang untuk pelajar hingga pengembang profesional
- **Practical Focus**: contoh praktis dan skenario dunia nyata
- **Comprehensive Coverage**: dari konsep dasar hingga pola enterprise tingkat lanjut
- **Security-First Approach**: praktik terbaik keamanan diintegrasikan di seluruh materi
- **Cost Optimization**: panduan untuk deployment hemat biaya dan manajemen sumber daya

#### Documentation Quality
- **Detailed Code Examples**: contoh kode praktis dan teruji
- **Step-by-Step Instructions**: panduan yang jelas dan dapat ditindaklanjuti
- **Comprehensive Error Handling**: pemecahan masalah untuk isu umum
- **Best Practices Integration**: standar industri dan rekomendasi
- **Version Compatibility**: mutakhir dengan layanan Azure terbaru dan fitur azd

## Planned Future Enhancements

### Version 3.1.0 (Planned)
#### AI Platform Expansion
- **Multi-Model Support**: pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **AI Agent Frameworks**: template untuk LangChain, Semantic Kernel, dan deployment AutoGen
- **Advanced RAG Patterns**: opsi database vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **AI Observability**: pemantauan yang ditingkatkan untuk performa model, penggunaan token, dan kualitas respons

#### Developer Experience
- **VS Code Extension**: pengalaman pengembangan AZD + Microsoft Foundry yang terintegrasi di VS Code
- **GitHub Copilot Integration**: pembuatan template AZD dibantu AI
- **Interactive Tutorials**: latihan coding praktis dengan validasi otomatis untuk skenario AI
- **Video Content**: tutorial video tambahan untuk pembelajar visual yang fokus pada deployment AI

### Version 4.0.0 (Planned)
#### Enterprise AI Patterns
- **Governance Framework**: tata kelola model AI, kepatuhan, dan jejak audit
- **Multi-Tenant AI**: pola untuk melayani banyak pelanggan dengan layanan AI terisolasi
- **Edge AI Deployment**: integrasi dengan Azure IoT Edge dan container instances
- **Hybrid Cloud AI**: pola deployment multi-cloud dan hybrid untuk beban kerja AI

#### Advanced Features
- **AI Pipeline Automation**: integrasi MLOps dengan pipeline Azure Machine Learning
- **Advanced Security**: pola zero-trust, private endpoints, dan perlindungan ancaman tingkat lanjut
- **Performance Optimization**: penyetelan dan strategi penskalaan lanjutan untuk aplikasi AI throughput tinggi
- **Global Distribution**: pola penyampaian konten dan caching edge untuk aplikasi AI

### Version 3.0.0 (Planned) - Superseded by Current Release
#### Proposed Additions - Now Implemented in v3.0.0
- ✅ **AI-Focused Content**: integrasi Microsoft Foundry yang komprehensif (Selesai)
- ✅ **Interactive Tutorials**: lab lokakarya AI praktis (Selesai)
- ✅ **Advanced Security Module**: pola keamanan khusus AI (Selesai)
- ✅ **Performance Optimization**: strategi penyetelan beban kerja AI (Selesai)

### Version 2.1.0 (Planned) - Partially Implemented in v3.0.0
#### Minor Enhancements - Some Completed in Current Release
- ✅ **Additional Examples**: skenario deployment fokus AI (Selesai)
- ✅ **Extended FAQ**: pertanyaan spesifik AI dan pemecahan masalah (Selesai)
- **Tool Integration**: panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Monitoring Expansion**: pola pemantauan dan alerting khusus AI (Selesai)

#### Still Planned for Future Release
- **Mobile-Friendly Documentation**: desain responsif untuk pembelajaran seluler
- **Offline Access**: paket dokumentasi yang dapat diunduh
- **Enhanced IDE Integration**: ekstensi VS Code untuk alur kerja AZD + AI
- **Community Dashboard**: metrik komunitas real-time dan pelacakan kontribusi

## Contributing to the Changelog

### Reporting Changes
Saat berkontribusi ke repositori ini, harap pastikan entri changelog mencakup:

1. **Version Number**: mengikuti semantic versioning (major.minor.patch)
2. **Date**: tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Category**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Clear Description**: deskripsi singkat tentang apa yang berubah
5. **Impact Assessment**: bagaimana perubahan memengaruhi pengguna yang ada

### Change Categories

#### Added
- Fitur baru, bagian dokumentasi, atau kapabilitas
- Contoh baru, template, atau sumber pembelajaran
- Alat tambahan, skrip, atau utilitas

#### Changed
- Modifikasi pada fungsionalitas atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Deprecated
- Fitur atau pendekatan yang sedang dihentikan
- Bagian dokumentasi yang dijadwalkan untuk dihapus
- Metode yang memiliki alternatif lebih baik

#### Removed
- Fitur, dokumentasi, atau contoh yang tidak lagi relevan
- Informasi usang atau pendekatan yang sudah deprecated
- Konten yang redundan atau dikonsolidasikan

#### Fixed
- Koreksi terhadap kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah atau bug yang dilaporkan
- Peningkatan akurasi atau fungsionalitas

#### Security
- Peningkatan atau perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Semantic Versioning Guidelines

#### Major Version (X.0.0)
- Perubahan yang memecah (breaking changes) yang membutuhkan tindakan pengguna
- Restrukturisasi signifikan konten atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi fundamental

#### Minor Version (X.Y.0)
- Fitur baru atau tambahan konten
- Peningkatan yang mempertahankan kompatibilitas mundur
- Contoh, alat, atau sumber daya tambahan

#### Patch Version (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Community Feedback and Suggestions

Kami sangat mendorong umpan balik komunitas untuk meningkatkan sumber belajar ini:

### How to Provide Feedback
- **GitHub Issues**: laporkan masalah atau sarankan peningkatan (isu spesifik AI dipersilakan)
- **Discord Discussions**: bagikan ide dan terlibat dengan komunitas Microsoft Foundry
- **Pull Requests**: kontribusikan perbaikan langsung ke konten, terutama template dan panduan AI
- **Microsoft Foundry Discord**: berpartisipasi di channel #Azure untuk diskusi AZD + AI
- **Community Forums**: ikuti diskusi pengembang Azure yang lebih luas

### Feedback Categories
- **AI Content Accuracy**: koreksi untuk integrasi layanan AI dan informasi deployment
- **Learning Experience**: saran untuk alur pembelajaran pengembang AI yang lebih baik
- **Missing AI Content**: permintaan untuk tambahan template, pola, atau contoh AI
- **Accessibility**: peningkatan untuk kebutuhan pembelajaran yang beragam
- **AI Tool Integration**: saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Production AI Patterns**: permintaan pola deployment AI enterprise

### Response Commitment
- **Issue Response**: dalam 48 jam untuk masalah yang dilaporkan
- **Feature Requests**: evaluasi dalam satu minggu
- **Community Contributions**: tinjauan dalam satu minggu
- **Security Issues**: prioritas segera dengan respons dipercepat

## Maintenance Schedule

### Regular Updates
- **Monthly Reviews**: akurasi konten dan validasi tautan
- **Quarterly Updates**: tambahan dan peningkatan konten utama
- **Semi-Annual Reviews**: restrukturisasi dan peningkatan komprehensif
- **Annual Releases**: pembaruan versi mayor dengan peningkatan signifikan

### Monitoring and Quality Assurance
- **Automated Testing**: validasi rutin contoh kode dan tautan
- **Community Feedback Integration**: penggabungan saran pengguna secara berkala
- **Technology Updates**: penyelarasan dengan layanan Azure terbaru dan rilis azd
- **Accessibility Audits**: tinjauan rutin untuk prinsip desain inklusif

## Version Support Policy

### Current Version Support
- **Latest Major Version**: dukungan penuh dengan pembaruan rutin
- **Previous Major Version**: pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Legacy Versions**: dukungan komunitas saja, tanpa pembaruan resmi

### Migration Guidance
Saat versi mayor dirilis, kami menyediakan:
- **Migration Guides**: instruksi transisi langkah demi langkah
- **Compatibility Notes**: detail tentang perubahan yang memecah kompatibilitas
- **Tool Support**: skrip atau utilitas untuk membantu migrasi
- **Community Support**: forum khusus untuk pertanyaan migrasi

---

**Navigation**
- **Previous Lesson**: [Study Guide](resources/study-guide.md)
- **Next Lesson**: Return to [Main README](README.md)

**Stay Updated**: Watch this repository for notifications about new releases and important updates to the learning materials.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->