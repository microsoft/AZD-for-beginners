# Catatan Perubahan - AZD Untuk Pemula

## Pengantar

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan peningkatan penting pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versi semantik dan memelihara log ini untuk membantu pengguna memahami apa yang telah berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapatkan informasi tentang fitur baru dan penambahan konten
- Memahami peningkatan yang dilakukan pada dokumentasi yang sudah ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran dari waktu ke waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi yang paling mutakhir
- Memberikan masukan dan saran untuk peningkatan di masa depan

## Riwayat Versi

### [v3.23.0] - 2026-07-13

#### Penyegaran AZD 1.27.1: Pembaruan Versi Terkini
**Versi ini memvalidasi ulang kursus terhadap `azd` `1.27.1` (Juli 2026, rilis stabil terbaru) dan ekstensi agen AI preview saat ini `azure.ai.agents` `1.0.0-beta.5`, membawa setiap spanduk "divalidasi terhadap" menjadi mutakhir setelah rilis 1.26.0, 1.27.0, dan 1.27.1.**

#### Perubahan
- **✅ Baseline validasi diperbarui** dari `azd 1.25.6` (Juni 2026) ke `azd 1.27.1` (Juli 2026) di README root, semua README bab, pelajaran dev-container Bab 1 (termasuk contoh versi yang dipasang), pelajaran template kustom Bab 4, pelajaran multi-agent Bab 5, dan dokumen workshop
- **🤖 Baseline Bab 2 disegarkan** dari `azd 1.23.12` (Maret 2026) ke `azd 1.27.1` di `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, dan `microsoft-foundry-integration.md`; tanggal catatan validasi diperbarui ke 2026-07-13
- **🧩 Ekstensi agen AI dinaikkan** dari `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ke rilis `1.0.0-beta.5` saat ini di README Bab 2 dan `agents.md`
- **🧪 Contoh validasi workshop** (`output azd version`) diperbarui ke `1.27.1`

#### Catatan tentang rilis azd yang relevan (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Dukungan Go untuk Azure Functions pada Flex Consumption, filter langganan per-tenant `azd config sub-filter`, bundel ekstensi self-contained (`azd x pack --bundle`), dan `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Proyek/agen Azure AI Foundry dimodel langsung di `azure.yaml` (inisialisasi tanpa Bicep/Terraform), dukungan penyebaran container untuk App Service (`host: appservice` + `language: docker`), `-s/--source` langsung untuk perintah `azd extension`, dan `azd tool uninstall`
- **1.27.1 (2026-07-09):** Flag `--no-dependencies` untuk `azd extension install`, model deprecated dikecualikan dari prompt katalog/kuota secara default, dan beberapa perbaikan bug

#### Berkas Diperbarui
- `README.md`
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md`
- `docs/chapter-01-foundation/dev-containers.md`
- `docs/chapter-02-ai-development/README.md`
- `docs/chapter-02-ai-development/agents.md`
- `docs/chapter-02-ai-development/ai-model-deployment.md`
- `docs/chapter-02-ai-development/ai-workshop-lab.md`
- `docs/chapter-02-ai-development/microsoft-foundry-integration.md`
- `docs/chapter-03-configuration/README.md`
- `docs/chapter-04-infrastructure/custom-templates.md`
- `docs/chapter-04-infrastructure/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-06-pre-deployment/README.md`
- `docs/chapter-07-troubleshooting/README.md`
- `docs/chapter-08-production/README.md`
- `workshop/docs/index.md`
- `workshop/docs/instructions/2-Validate-AI-Template.md`

### [v3.22.0] - 2026-06-16

#### Penutupan Kekurangan Pemula #2: Penyusunan Template, Dev Containers, Pulumi, Azure DevOps, Service Principals, dan Lainnya
**Versi ini menutup kekurangan menengah yang tersisa yang terdeteksi oleh analisis azd-coverage: bagaimana menulis dan menerbitkan template Anda sendiri, lingkungan dev-container/Codespaces yang dapat direproduksi, penyedia infrastruktur Pulumi, panduan CI/CD Azure DevOps, otentikasi service-principal, panduan pemilihan host (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, penanganan kesalahan hook, dan praktik lingkungan tim/berbagi.**

#### Penambahan
- **🧱 Pelajaran Bab 4 baru** `docs/chapter-04-infrastructure/custom-templates.md` — penyusunan template azd Anda sendiri: struktur yang diperlukan (`azure.yaml`, `infra/`, `src/`), bidang `metadata.template`, parameterisasi infrastruktur dengan token sumber daya `uniqueString()` dan tag `azd-env-name`, pengujian lokal dengan `azd init --template <local-path>`, penerbitan ke GitHub, dan pengajuan ke galeri Awesome AZD
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/dev-containers.md` — lingkungan azd yang dapat direproduksi dengan Dev Containers dan GitHub Codespaces: `.devcontainer/devcontainer.json` minimal menggunakan fitur resmi `ghcr.io/azure/azure-dev/azd`, fitur khusus bahasa, `docker-in-docker` untuk host container, dan `azd auth login --use-device-code` untuk login jarak jauh
- **🧩 Pulumi dengan azd** bagian di `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, tata letak folder Pulumi, stack yang dipetakan ke lingkungan azd, output/tagging yang diperlukan, dan alur kerja `azd up` / `azd down` identik
- **🎯 Panduan pemilihan host** di `docs/chapter-04-infrastructure/provisioning.md` — perbandingan ramah pemula antara `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan kapan memilih AKS atau Azure Spring Apps
- **🛠️ Panduan CI/CD Azure DevOps** di `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, koneksi layanan dengan federasi identitas beban kerja (OIDC), `azure-dev.yml` yang dihasilkan, dan pengaturan grup variabel
- **🔑 Service Principals (Pola 4)** ditambahkan pada `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non-interaktif dengan rahasia klien vs. kredensial federasi/OIDC, kapan menggunakan, dan penyimpanan kredensial yang aman
- **🪝 Penanganan kesalahan hook** subbagian di `docs/chapter-04-infrastructure/deployment-guide.md` — kode keluar dan `set -e`, `continueOnError`, pengujian hook secara terpisah dengan `azd hooks run`, shell spesifik OS, dan `--debug`
- **👥 Lingkungan tim / berbagi** bagian di `docs/chapter-03-configuration/configuration.md` — apa yang berada di `.azure/`, yang harus di-gitignore, lingkungan per pengembang, `azd env list`/`select`, dan penyediaan nilai lingkungan di CI/CD
- **🧰 Penjelasan `azd restore` dan `azd package` yang diperluas** di `resources/cheat-sheet.md` — mengembalikan dependensi dan membangun artefak yang bisa dideploy tanpa melakukan penyebaran

#### Perubahan
- **🧭 Tabel pelajaran Bab 4** diperbarui untuk memasukkan pelajaran baru "Menulis Template Anda Sendiri" (Pelajaran 3)
- **🧭 Tabel pelajaran Bab 1** diperbarui untuk memasukkan pelajaran baru "Dev Containers & Codespaces" (Pelajaran 5); footer navigasi dihubungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Penutupan Kekurangan Pemula: Pelajaran Multi-Agent Praktis, "Bring Your Own App," Terraform, dan Panduan CI/CD
**Versi ini menutup kekurangan terbesar untuk panduan pemula lengkap dengan menambahkan dua pelajaran praktis baru (panduan multi-agent yang bisa dideploy dan menambahkan azd ke aplikasi yang sudah ada), pengenalan hooks ramah pemula, bagian Terraform dengan azd, panduan langkah demi langkah pipeline GitHub Actions, penjelasan ekstensi preview baru, dan daftar pengecekan verifikasi penyebaran eksplisit.**

#### Penambahan
- **🤝 Pelajaran Bab 5 baru** `docs/chapter-05-multi-agent/multi-agent-basics.md` — panduan dua agen yang sepenuhnya praktis dan dapat dideploy (orchestrator + spesialis) menggunakan template nyata (`contoso-creative-writer`), mencakup kapan menggunakan multi-agent, alur kerja `azd up`, memahami sumber daya yang disebarkan, pelacakan lintas agen, kustomisasi, dan pembersihan
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambahkan azd ke proyek yang sudah ada dengan `azd init` ("gunakan kode di direktori saat ini"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, deteksi host, dan penyebaran dengan `azd up`
- **🌐 Bagian Terraform dengan azd** ditambahkan ke `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, tata letak folder `.tf`, output `AZURE_*` yang dibutuhkan dan penandaan `azd-env-name`, dan alur kerja `azd up` / `azd down` identik (menutup kekurangan di mana dukungan Terraform diklaim tapi hanya Bicep yang ditampilkan)
- **⚙️ Panduan langkah demi langkah GitHub Actions** di `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke penyebaran otomatis: `azd pipeline config`, kredensial federasi OIDC (tanpa rahasia tersimpan), `azure-dev.yml` yang dihasilkan, dan panduan rahasia vs. variabel
- **🪝 Pengenalan "Baru dengan hooks?" untuk pemula** di `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, tabel tahap hook, hook pertama minimal, dan menjalankan hook secara manual dengan `azd hooks run`
- **✅ Daftar pengecekan "Verifikasi Penyebaran Anda"** ditambahkan ke Langkah 5 `docs/chapter-01-foundation/first-project.md` — uji asap, pemeriksaan endpoint kesehatan, dan kriteria keberhasilan eksplisit
- **🧩 Penjelasan untuk ekstensi preview baru** `azure.ai.skills` dan `azure.ai.connections` (apa itu dan kapan menggunakannya) di `docs/chapter-08-production/production-ai-practices.md`

#### Perubahan
- **🧭 Tabel pelajaran Bab 5** dikoreksi: `multi-agent-basics.md` kini Pelajaran 1 (satu-satunya pelajaran praktis penuh), dengan label jujur bahwa Pelajaran 2 ada di Bab 6 dan skenario Retail adalah cetak biru arsitektur, bukan template satu perintah
- **🧭 Tabel pelajaran Bab 1** kini memasukkan pelajaran baru "Bring Your Own App" (Pelajaran 4)
- **🔗 Footer navigasi** diperbarui: `first-project.md` kini menautkan maju ke `bring-your-own-app.md`

#### Perbaikan
- **🧱 Menutup kekurangan Terraform yang diklaim tapi hilang** — kursus sebelumnya menyebut dukungan Terraform tapi tidak menunjukkannya
- **🔀 Memperbaiki tautan lintas Bab 5 yang menyesatkan** yang menyiratkan implementasi multi-agent penuh ada padahal hanya cetak biru arsitektur

#### Berkas Diperbarui
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

#### Penyegaran AZD 1.25.6, Perintah Siklus Hidup Agen Lengkap & Rebranding Aspire

**Versi ini memvalidasi ulang kursus terhadap `azd` `1.25.6` (Juni 2026) dan ekstensi `azure.ai.agents` `0.1.40-preview`, memperluas panduan AI dari "membangun agen" menjadi siklus hidup agen lengkap (uji → evaluasi → optimalkan → inspeksi → hapus), menampilkan ekstensi pratinjau baru `azure.ai.skills` dan `azure.ai.connections`, serta mencatat perubahan merek produk dari ".NET Aspire" menjadi "Aspire".**

#### Ditambahkan
- **🔁 Cakupan siklus hidup agen lengkap** untuk pemula dan insinyur AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabel siklus hidup (membangun → uji → ukur → perbaiki → inspeksi → bersihkan) ditambahkan ke bagian Ekstensi dan Perintah AI
  - `docs/chapter-08-production/production-ai-practices.md` — Bagian baru "Mengelola Siklus Hidup Agen" mencakup `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perintah Agen AI yang diperluas dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Ekstensi pratinjau baru** didokumentasikan: `azure.ai.skills` (keterampilan agen yang dapat digunakan ulang) dan `azure.ai.connections` (koneksi Foundry) ditambahkan ke tabel ekstensi dan cheat sheet
- **⏱️ Panduan waktu respons** — contoh `azd ai agent invoke` kini mencatat total latensi dan waktu-ke-byte-pertama
- **📌 Banner versi** di README root yang mengarahkan pelajar ke perintah `azd version` dan `azd upgrade`

#### Diubah
- **✅ Baseline validasi diperbarui** dari `azd 1.23.12` (Maret 2026) ke `azd 1.25.6` (Juni 2026) di semua README bab dan dokumen workshop
- **🤖 Catatan ekstensi Bab 2** diperbarui dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh validasi workshop** (output `azd version`) diperbarui ke `1.25.6`
- **🧭 README "Apa yang Baru di azd Hari Ini"** disegarkan untuk menyoroti siklus hidup agen dari ujung ke ujung, ekstensi AI baru, dan perbaikan kualitas terbaru (`azd init` idempoten, pembersihan token kadaluarsa pada `azd auth login`, prompt penggunaan pertama `azd tool`)
- **📖 File agents.md Bab 2 (Opsi 4)** kini mengarahkan pelajar ke perintah siklus hidup pasca-deploy daripada berhenti di `azd up`

#### Diperbaiki
- **🏷️ Penamaan produk** — catatan perubahan merek Aspire ditambahkan (".NET Aspire" kini hanya "Aspire"); dukungan azd untuk Aspire tidak berubah
- **🔎 Validasi rilis langsung** dikonfirmasi terhadap feed rilis Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) dan `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### File yang Diperbarui
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

#### Klarifikasi Onboarding Pemula, Validasi Setup & Pembersihan Perintah AZD Terakhir
**Versi ini mengikuti penyisiran validasi AZD 1.23 dengan lintasan dokumentasi yang berfokus pada pemula: mengklarifikasi panduan autentikasi pertama kali dengan AZD, menambahkan skrip validasi pengaturan lokal, memverifikasi perintah kunci terhadap CLI AZD langsung, dan menghapus referensi perintah sumber bahasa Inggris yang sudah usang di luar changelog.**

#### Ditambahkan
- **🧪 Skrip validasi setup pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` agar pelajar dapat mengonfirmasi alat yang dibutuhkan sebelum memulai Bab 1
- **✅ Langkah validasi setup awal** di README root dan README Bab 1 supaya prasyarat yang hilang terdeteksi sebelum `azd up`

#### Diubah
- **🔐 Panduan autentikasi pemula** kini secara konsisten menganggap `azd auth login` sebagai jalur utama untuk alur kerja AZD, dengan `az login` disebut sebagai opsional kecuali perintah Azure CLI digunakan langsung
- **📚 Alur onboarding Bab 1** sekarang mengarahkan pelajar untuk memvalidasi pengaturan lokal mereka sebelum instalasi, autentikasi, dan langkah deployment pertama
- **🛠️ Pesan validator** kini secara jelas memisahkan persyaratan yang menghalangi dari peringatan Azure CLI opsional untuk jalur pemula AZD saja
- **📖 Konfigurasi, troubleshooting, dan dokumen contoh** sekarang membedakan antara autentikasi AZD yang wajib dan sign-in Azure CLI opsional di mana keduanya sebelumnya dipresentasikan tanpa konteks

#### Diperbaiki
- **📋 Referensi perintah sumber Inggris yang tersisa** diperbarui ke bentuk AZD terkini, termasuk `azd config show` di cheat sheet dan `azd monitor --overview` di mana panduan overview Azure Portal dimaksudkan
- **🧭 Klaim pemula di Bab 1** dilunakkan agar tidak menjanjikan perilaku nol kesalahan atau rollback terjamin di semua template dan sumber daya Azure
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
**Versi ini melakukan penyisiran validasi dokumentasi terhadap `azd` `1.23.12`, memperbarui contoh perintah AZD usang, menyegarkan panduan model AI ke default terkini, dan memperluas instruksi workshop melampaui GitHub Codespaces untuk juga mendukung dev container dan klon lokal.**

#### Ditambahkan
- **✅ Catatan validasi di seluruh bab inti dan dokumen workshop** agar baseline AZD yang diuji menjadi eksplisit bagi pelajar yang menggunakan build CLI yang lebih baru atau lama
- **⏱️ Panduan batas waktu deployment** untuk deployment aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah inspeksi ekstensi** dengan `azd extension show azure.ai.agents` dalam dokumen alur kerja AI
- **🌐 Panduan lingkungan workshop lebih luas** mencakup GitHub Codespaces, dev container, dan klon lokal dengan MkDocs

#### Diubah
- **📚 README intro bab** sekarang secara konsisten mencatat validasi terhadap `azd 1.23.12` di fondasi, konfigurasi, infrastruktur, multi-agen, pra-deploy, troubleshooting, dan bagian produksi
- **🛠️ Referensi perintah AZD** diperbarui ke bentuk terkini di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` tergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` di mana overview Application Insights dimaksudkan
- **🧪 Contoh provisi pratinjau** disederhanakan ke penggunaan yang saat ini didukung seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Alur workshop** diperbarui agar pelajar dapat menyelesaikan lab di Codespaces, dev container, atau klon lokal tanpa mengasumsikan eksekusi hanya di Codespaces
- **🔐 Panduan autentikasi** kini lebih mengutamakan `azd auth login` untuk alur kerja AZD, dengan `az login` diposisikan sebagai opsional saat perintah Azure CLI digunakan langsung

#### Diperbaiki
- **🪟 Perintah instalasi Windows** dinormalisasi ke penulisan `winget` paket terbaru di panduan instalasi
- **🐧 Panduan instalasi Linux** diperbaiki agar tidak menggunakan instruksi manajer paket `azd` khusus distro yang tidak didukung dan mengarahkan ke aset rilis bila sesuai
- **📦 Contoh model AI** disegarkan dari default lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` ke contoh terkini seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Potongan kode deployment dan diagnostik** diperbaiki untuk menggunakan perintah lingkungan dan status terkini pada log, skrip, dan langkah troubleshooting
- **⚙️ Panduan GitHub Actions** diperbarui dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan consent MCP/Copilot** diperbarui dari `azd mcp consent` ke `azd copilot consent list`

#### Ditingkatkan
- **🧠 Panduan bab AI** kini menjelaskan lebih baik perilaku pratinjau sensitif `azd ai`, login spesifik tenant, penggunaan ekstensi terkini, dan rekomendasi deployment model terbaru
- **🧪 Instruksi workshop** kini menggunakan contoh versi yang lebih realistis dan bahasa pengaturan lingkungan yang lebih jelas untuk lab praktik
- **📈 Dokumen produksi dan troubleshooting** kini lebih selaras dengan contoh monitoring terkini, model fallback, dan tingkat biaya

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

#### Perintah CLI AI AZD, Validasi Konten & Perluasan Template
**Versi ini menambahkan cakupan perintah `azd ai`, `azd extension`, dan `azd mcp` di semua bab terkait AI, memperbaiki tautan rusak dan kode yang kadaluarsa di agents.md, memperbarui cheat sheet, dan merombak bagian Template Contoh dengan deskripsi yang tervalidasi dan template Azure AI AZD baru.**

#### Ditambahkan
- **🤖 Cakupan CLI AI AZD** di 7 file (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagian baru "Ekstensi dan Perintah AI" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsi 4: `azd ai agent init` dengan tabel perbandingan (template vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subbagian "Ekstensi AZD untuk Foundry" dan "Deployment Agen-Pertama"

  - `docs/chapter-05-multi-agent/README.md` — Memulai Cepat kini menampilkan jalur penyebaran berbasis templat dan manifes
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bagian Deploy kini menyertakan opsi `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subbagian "Perintah Ekstensi AZD AI untuk Diagnostik"
  - `resources/cheat-sheet.md` — Bagian baru "Perintah AI & Ekstensi" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** di `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan dukungan chat suara
  - **azure-search-openai-demo-java** — Chat RAG Java menggunakan Langchain4J dengan opsi penyebaran ACA/AKS
  - **contoso-creative-writer** — Aplikasi menulis kreatif multi-agen dengan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa server menggunakan Azure Functions + LangChain.js + Cosmos DB dengan dukungan pengembangan lokal Ollama
  - **chat-with-your-data-solution-accelerator** — Accelerator RAG perusahaan dengan portal admin, integrasi Teams, dan opsi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi referensi orkestrasi MCP multi-agen dengan server di .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat starter infrastruktur Azure AI minimal Bicep
  - **🔗 Tautan Galeri AZD AI Keren** — Referensi ke [galeri awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Diperbaiki
- **🔗 Navigasi agents.md**: Tautan Sebelumnya/Berikutnya sekarang sesuai urutan pelajaran README Bab 2 (Integrasi Microsoft Foundry → Agen → Penyebaran Model AI)
- **🔗 Tautan rusak agents.md**: `production-ai-practices.md` dikoreksi menjadi `../chapter-08-production/production-ai-practices.md` (3 kemunculan)
- **📦 Kode usang agents.md**: Mengganti `opencensus` dengan `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API tidak valid agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Penghitungan token agents.md**: Mengganti perkiraan kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Mengoreksi layanan dari "Cognitive Search + App Service" ke "Azure AI Search + Azure Container Apps" (host default berubah Okt 2024)
- **contoso-chat**: Memperbarui deskripsi agar merujuk Azure AI Foundry + Prompty, sesuai judul dan tumpukan teknologi repo

#### Dihapus
- **ai-document-processing**: Menghapus referensi templat yang tidak berfungsi (repo tidak dapat diakses publik sebagai templat AZD)

#### Ditingkatkan
- **📝 Latihan agents.md**: Latihan 1 kini menampilkan output yang diharapkan dan langkah `azd monitor`; Latihan 2 mencakup kode lengkap pendaftaran `FunctionTool`; Latihan 3 mengganti panduan samar dengan perintah `prepdocs.py` yang konkret
- **📚 Sumber daya agents.md**: Memperbarui tautan dokumentasi ke dokumen dan memulai cepat Azure AI Agent Service terkini
- **📋 Tabel Langkah Berikutnya agents.md**: Menambahkan tautan Lab Workshop AI untuk cakupan bab yang lengkap

#### Berkas Diperbarui
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
**Versi ini memperbaiki navigasi README.md bab dengan format tabel yang ditingkatkan.**

#### Diubah
- **Tabel Peta Kursus**: Ditingkatkan dengan tautan pelajaran langsung, perkiraan durasi, dan penilaian kompleksitas
- **Pembersihan Folder**: Menghapus folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validasi Tautan**: Semua 21+ tautan internal di tabel Peta Kursus diverifikasi

### [v3.16.0] - 2026-02-05

#### Pembaruan Nama Produk
**Versi ini memperbarui referensi produk sesuai merek Microsoft terkini.**

#### Diubah
- **Microsoft Foundry → Microsoft Foundry**: Semua referensi diperbarui di semua file non-terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama layanan diperbarui untuk mencerminkan merek saat ini

#### Berkas Diperbarui
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

#### Restrukturisasi Besar Repository: Nama Folder Berdasarkan Bab
**Versi ini merestrukturisasi dokumentasi ke folder khusus bab untuk navigasi yang lebih jelas.**

#### Penggantian Nama Folder
Folder lama telah digantikan dengan folder bernomor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ditambahkan baru: `docs/chapter-05-multi-agent/`

#### Migrasi Berkas
| Berkas | Dari | Ke |
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
| Semua berkas pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Semua berkas troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambahkan
- **📚 Berkas README Bab**: Membuat README.md di setiap folder bab dengan:
  - Tujuan pembelajaran dan durasi
  - Tabel pelajaran dengan deskripsi
  - Perintah cepat mulai
  - Navigasi ke bab lain

#### Diubah
- **🔗 Memperbarui semua tautan internal**: 78+ jalur diperbarui di semua file dokumentasi
- **🗺️ README.md utama**: Memperbarui Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Memperbarui rujukan silang ke folder bab

#### Dihapus
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturisasi Repository: Navigasi Bab
**Versi ini menambahkan berkas README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Agen AI Baru
**Versi ini menambahkan panduan lengkap untuk penyebaran agen AI dengan Azure Developer CLI.**

#### Ditambahkan
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap meliputi:
  - Apa itu agen AI dan bagaimana bedanya dengan chatbot
  - Tiga templat agen mulai cepat (Foundry Agents, Prompty, RAG)
  - Pola arsitektur agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan kustomisasi alat
  - Pemantauan dan pelacakan metrik
  - Pertimbangan biaya dan optimasi
  - Skenario pemecahan masalah umum
  - Tiga latihan praktis dengan kriteria sukses

#### Struktur Konten
- **Pengantar**: Konsep agen untuk pemula
- **Memulai Cepat**: Menyebarkan agen dengan `azd init --template get-started-with-ai-agents`
- **Pola Arsitektur**: Diagram visual pola agen
- **Konfigurasi**: Pengaturan alat dan variabel lingkungan
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktis bertahap (20-45 menit tiap latihan)

---

### [v3.12.0] - 2026-02-05

#### Pembaruan Lingkungan DevContainer
**Versi ini memperbarui konfigurasi container pengembangan dengan alat modern dan pengaturan default yang lebih baik untuk pengalaman belajar AZD.**

#### Diubah
- **🐳 Base Image**: Diperbarui dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terbaru)
- **📛 Nama Container**: Diganti dari "Python 3" menjadi "AZD for Beginners" agar lebih jelas

#### Ditambahkan
- **🔧 Fitur Dev Container Baru**:
  - `azure-cli` dengan dukungan Bicep aktif
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk manajemen templat
  - `docker-in-docker` untuk penyebaran aplikasi container

- **🔌 Port Forwarding**: Port yang telah dikonfigurasi untuk pengembangan umum:
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
  - `DavidAnson.vscode-markdownlint` - Pemeriksaan kualitas Markdown
  - `bierner.markdown-mermaid` - Dukungan diagram Mermaid
  - `redhat.vscode-yaml` - Dukungan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Riwayat Git

- **⚙️ Pengaturan VS Code**: Menambahkan pengaturan default untuk interpreter Python, format saat simpan, dan pemangkasan spasi

- **📦 Memperbarui requirements-dev.txt**:
  - Menambahkan plugin minify MkDocs
  - Menambahkan pre-commit untuk kualitas kode
  - Menambahkan paket Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Pasca-Buat**: Kini memverifikasi instalasi AZD dan Azure CLI saat container mulai

---

### [v3.11.0] - 2026-02-05

#### Perombakan README Ramah Pemula
**Versi ini secara signifikan meningkatkan README.md agar lebih mudah diakses pemula dan menambahkan sumber daya penting untuk pengembang AI.**

#### Ditambahkan
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas kapan menggunakan tiap alat dengan contoh praktis
- **🌟 Tautan Keren AZD**: Tautan langsung ke galeri templat komunitas dan sumber kontribusi:
  - [Galeri Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ templat siap pakai
  - [Kirimkan Templat](https://github.com/Azure/awesome-azd/issues) - Kontribusi komunitas
- **🎯 Panduan Memulai Cepat**: Bagian memulai dalam 3 langkah sederhana (Instal → Masuk → Sebarkan)
- **📊 Tabel Navigasi Berdasarkan Pengalaman**: Panduan jelas untuk pemula berdasarkan pengalaman pengembang

#### Diubah
- **Struktur README**: Disusun ulang untuk pengungkapan progresif - informasi utama di awal
- **Bagian Pengantar**: Ditulis ulang menjelaskan "Keajaiban `azd up`" untuk pemula lengkap
- **Menghapus Duplikat Konten**: Menghilangkan bagian pemecahan masalah yang duplikat
- **Perintah Pemecahan Masalah**: Memperbaiki referensi `azd logs` agar menggunakan `azd monitor --logs` yang valid

#### Diperbaiki

- **🔐 Perintah Otentikasi**: Ditambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Referensi Perintah Tidak Valid**: Menghapus sisa `azd logs` dari bagian pemecahan masalah README

#### Catatan
- **Lingkup**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Audiens Sasaran**: Peningkatan khusus untuk pengembang baru di AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Akurasi Perintah Azure Developer CLI
**Versi ini mengoreksi perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD yang Tidak Ada Dihapus**: Audit dan koreksi menyeluruh dari perintah tidak valid:
  - `azd logs` (tidak ada) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - Subperintah `azd service` (tidak ada) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau diganti dengan alternatif yang valid
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak ada) → dihapus
  - Flag `azd provision --what-if/--rollback` (tidak ada) → diperbarui menjadi menggunakan `--preview`
  - `azd config validate` (tidak ada) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus

- **📚 File yang Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Perombakan besar referensi perintah
  - `docs/deployment/deployment-guide.md`: Memperbaiki strategi rollback dan deployment
  - `docs/troubleshooting/debugging.md`: Memperbaiki bagian analisis log
  - `docs/troubleshooting/common-issues.md`: Memperbarui perintah pemecahan masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Mengoreksi perintah pemantauan
  - `docs/getting-started/first-project.md`: Memperbarui contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Mengoreksi perintah melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki perintah debugging agen

- **📝 Referensi Versi Diperbarui**: 
  - `docs/getting-started/installation.md`: Mengubah versi hardcoded `1.5.0` menjadi generik `1.x.x` dengan tautan ke rilis

#### Diubah
- **Strategi Rollback**: Memperbarui dokumentasi untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback native)
- **Melihat Log**: Mengganti referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bagian Performa**: Menghapus flag deploy paralel/incremental yang tidak ada, memberikan alternatif yang valid

#### Detail Teknis
- **Perintah AZD Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor Valid**: `--live`, `--logs`, `--overview`
- **Fitur yang Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Catatan
- **Verifikasi**: Perintah divalidasi menggunakan Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyelesaian Workshop dan Pembaruan Kualitas Dokumentasi
**Versi ini menyelesaikan modul workshop interaktif, memperbaiki semua tautan dokumentasi yang rusak, dan meningkatkan kualitas konten untuk pengembang AI yang menggunakan Microsoft AZD.**

#### Ditambahkan
- **📝 CONTRIBUTING.md**: Dokumen panduan kontribusi baru dengan:
  - Instruksi jelas untuk melaporkan masalah dan mengusulkan perubahan
  - Standar dokumentasi untuk konten baru
  - Pedoman contoh kode dan konvensi pesan commit
  - Informasi keterlibatan komunitas

#### Diselesaikan
- **🎯 Modul Workshop 7 (Penutup)**: Modul penutup diselesaikan sepenuhnya dengan:
  - Ringkasan komprehensif pencapaian workshop
  - Bagian konsep utama yang dikuasai meliputi AZD, template, dan Microsoft Foundry
  - Rekomendasi kelanjutan perjalanan pembelajaran
  - Latihan tantangan workshop dengan tingkat kesulitan
  - Umpan balik komunitas dan tautan dukungan

- **📚 Modul Workshop 3 (Mendekonstruksi)**: Memperbarui tujuan pembelajaran dengan:
  - Panduan aktivasi GitHub Copilot dengan server MCP
  - Pemahaman struktur folder template AZD
  - Pola organisasi infrastructure-as-code (Bicep)
  - Instruksi laboratorium praktik

- **🔧 Modul Workshop 6 (Pembongkaran)**: Diselesaikan dengan:
  - Tujuan pembersihan sumber daya dan pengelolaan biaya
  - Penggunaan `azd down` untuk deprovisioning infrastruktur dengan aman
  - Panduan pemulihan layanan kognitif yang dihapus secara lunak
  - Prompts eksplorasi bonus untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Perbaikan Tautan Rusak**: Memperbaiki 15+ tautan dokumentasi internal yang rusak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki jalur ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki jalur ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki jalur FAQ dan panduan pemecahan masalah
  - `examples/container-app/microservices/README.md`: Memperbaiki jalur halaman utama kursus dan panduan deployment
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI
  - `course-outline.md`: Memperbaiki panduan instruktur dan referensi lab workshop AI

- **📅 Banner Status Workshop**: Memperbarui dari "Dalam Pembangunan" menjadi status workshop aktif dengan tanggal Februari 2026

- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi yang rusak di README.md workshop yang menunjuk ke folder lab-1-azd-basics yang tidak ada

#### Diubah
- **Presentasi Workshop**: Menghapus peringatan "dalam pembangunan", workshop kini selesai dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar-modul yang tepat
- **Referensi Jalur Pembelajaran**: Memperbarui referensi silang bab menggunakan jalur microsoft-foundry yang benar

#### Diverifikasi
- ✅ Semua file markdown bahasa Inggris memiliki tautan internal yang valid
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran
- ✅ Navigasi antar bab dan modul berfungsi dengan baik
- ✅ Konten sesuai untuk pengembang AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur ramah pemula terjaga sepanjang dokumen
- ✅ CONTRIBUTING.md memberikan panduan jelas untuk kontributor komunitas

#### Implementasi Teknis
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md
- **Audit Konten**: Review manual kelengkapan workshop dan kesesuaian untuk pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul yang konsisten diterapkan

#### Catatan
- **Lingkup**: Perubahan hanya diterapkan pada dokumentasi bahasa Inggris
- **Terjemahan**: Folder terjemahan tidak diperbarui di versi ini (terjemahan otomatis akan disinkronkan kemudian)
- **Durasi Workshop**: Workshop lengkap sekarang menyediakan 3-4 jam pembelajaran langsung

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agen
**Versi ini menambahkan pelajaran komprehensif tingkat A tentang integrasi Application Insights, pola otentikasi, dan koordinasi multi-agen untuk deployment produksi.**

#### Ditambahkan
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Deployment fokus AZD dengan provision otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang berfungsi dengan telemetri khusus (>1.200 baris)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Microsoft Foundry Models)
  - 6 diagram Mermaid (arsitektur, distributed tracing, alur telemetri)
  - 3 latihan praktik (peringatan, dashboard, pemantauan AI)
  - Contoh query Kusto dan strategi optimasi biaya
  - Streaming metrik langsung dan debugging real-time
  - Waktu belajar 40-50 menit dengan pola siap produksi

- **🔐 Pelajaran Pola Otentikasi & Keamanan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 pola otentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk deployment aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (mengaktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik terbaik keamanan dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola otentikasi tanpa password siap produksi

- **🤖 Pelajaran Pola Koordinasi Multi-Agen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sekuensial, paralel, hierarkis, event-driven, konsensus)
  - Implementasi lengkap layanan orchestrator (Python/Flask, >1.500 baris)
  - 3 implementasi agen khusus (Research, Writer, Editor)
  - Integrasi Service Bus untuk antrian pesan
  - Manajemen state Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid menunjukkan interaksi agen
  - 3 latihan tingkat lanjut (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/bulan) dengan strategi optimasi
  - Integrasi Application Insights untuk pemantauan

#### Ditambah Baik
- **Bab Pra-Deployment**: Kini mencakup pola pemantauan dan koordinasi yang komprehensif
- **Bab Memulai**: Ditingkatkan dengan pola otentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observabilitas
- **Garis Besar Kursus**: Diperbarui dengan referensi pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progresi Pembelajaran**: Integrasi keamanan dan pemantauan yang lebih baik di seluruh kursus
- **Kualitas Dokumentasi**: Standar tingkat A yang konsisten (95-97%) di pelajaran baru
- **Pola Produksi**: Cakupan lengkap ujung ke ujung untuk deployment enterprise

#### Ditingkatkan
- **Pengalaman Pengembang**: Jalur jelas dari pengembangan ke pemantauan produksi
- **Standar Keamanan**: Pola profesional untuk otentikasi dan manajemen rahasia
- **Observabilitas**: Integrasi lengkap Application Insights dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Microsoft Foundry Models dan sistem multi-agen

#### Diverifikasi
- ✅ Semua pelajaran mencakup kode lengkap yang berfungsi (bukan potongan)
- ✅ Diagram Mermaid untuk pembelajaran visual (total 19 di 3 pelajaran)
- ✅ Latihan praktek dengan langkah verifikasi (total 9)
- ✅ Template Bicep siap produksi yang dapat dideploy via `azd up`
- ✅ Analisis biaya dan strategi optimasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agen tingkat lanjut
- **Konten Baru Keseluruhan**: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri khusus + distributed tracing
- **Otentikasi**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + query Kusto + peringatan + dashboard
- **Pengelolaan Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Microsoft Foundry Models Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh deployment lengkap Microsoft Foundry Models dengan antarmuka chat gpt-4.1.**

#### Ditambahkan
- **🤖 Contoh Chat Microsoft Foundry Models**: Deployment gpt-4.1 lengkap dengan implementasi berjalan di `examples/azure-openai-chat/`:
  - Infrastruktur Microsoft Foundry Models lengkap (deployment model gpt-4.1)
  - Antarmuka chat command-line Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan aman kunci API
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan rate dan penanganan error
  - README komprehensif dengan panduan deployment 35-45 menit
  - 11 file siap produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik pada panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-lingkungan (15 menit)
  - Latihan 2: Praktik manajemen rahasia (10 menit)
  - Kriteria keberhasilan jelas dan langkah verifikasi
- **✅ Verifikasi Deployment**: Menambahkan bagian verifikasi ke panduan deployment:
  - Prosedur pengecekan kesehatan
  - Daftar periksa kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah deployment
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui ke kualitas tingkat A (93%):
  - Menambahkan azure-openai-chat ke semua bagian terkait
  - Mengubah jumlah contoh lokal dari 3 menjadi 4
  - Ditambahkan ke tabel Contoh Aplikasi AI
  - Terintegrasi ke Quick Start bagi pengguna tingkat menengah
  - Ditambahkan ke bagian Template Microsoft Foundry
  - Memperbarui Matriks Perbandingan dan bagian pencarian teknologi
- **Kualitas Dokumentasi**: Meningkat dari B+ (87%) → A- (92%) di folder docs:

  - Menambahkan output yang diharapkan pada contoh perintah penting
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran langsung dengan latihan praktis

#### Diubah
- **Progresi Pembelajaran**: Integrasi contoh AI yang lebih baik untuk pelajar tingkat menengah
- **Struktur Dokumentasi**: Latihan yang lebih dapat ditindaklanjuti dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja utama

#### Ditingkatkan
- **Pengalaman Pengembang**: Penyebaran Microsoft Foundry Models kini memakan waktu 35-45 menit (dibandingkan 60-90 menit untuk alternatif kompleks)
- **Transparansi Biaya**: Estimasi biaya jelas ($50-200/bulan) untuk contoh Microsoft Foundry Models
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi konsisten

#### Divalidasi
- ✅ Contoh Microsoft Foundry Models berfungsi penuh dengan `azd up`
- ✅ Semua 11 berkas implementasi syntaktis benar
- ✅ Instruksi README sesuai dengan pengalaman penyebaran sebenarnya
- ✅ Tautan dokumentasi diperbarui di lebih dari 8 lokasi
- ✅ Indeks contoh mencerminkan 4 contoh lokal secara akurat
- ✅ Tidak ada tautan eksternal duplikat di tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Microsoft Foundry Models**: pola gpt-4.1 + Key Vault + Container Apps
- **Keamanan**: Siap Managed Identity, rahasia tersimpan di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimasi penggunaan
- **Penyebaran**: Perintah tunggal `azd up` untuk pengaturan lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Besar: Contoh Penyebaran Container App
**Versi ini memperkenalkan contoh deployment aplikasi container yang lengkap dan siap produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Container App**: Contoh lokal baru di `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Tinjauan lengkap deployment containerized, quick start, produksi, dan pola lanjutan
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API ramah pemula dengan fitur skala-ke-nol, pemeriksaan kesehatan, pemantauan, dan pemecahan masalah
  - [Arsitektur Microservices](../../examples/container-app/microservices): Deployment multi-layanan siap produksi (API Gateway, Produk, Pesanan, Pengguna, Notifikasi), pesan asinkron, Service Bus, Cosmos DB, Azure SQL, pelacakan terdistribusi, deployment blue-green/canary
- **Praktik Terbaik**: Keamanan, pemantauan, optimasi biaya, dan panduan CI/CD untuk beban kerja containerized
- **Contoh Kode**: `azure.yaml` lengkap, template Bicep, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario pengujian ujung-ke-ujung, perintah pemantauan, panduan pemecahan masalah

#### Diubah
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh container app baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Diperbarui untuk menyoroti contoh container app, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Outline & Panduan Studi Kursus**: Diperbarui untuk merujuk contoh container app baru dan pola deployment di bab terkait

#### Divalidasi
- ✅ Semua contoh baru bisa dideploy dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Lingkup**: Dokumentasi dan contoh hanya dalam bahasa Inggris
- **Langkah Selanjutnya**: Perluasan dengan pola container lanjutan dan otomatisasi CI/CD pada rilis mendatang

### [v3.5.0] - 2025-11-19

#### Rebranding Produk: Microsoft Foundry
**Versi ini mengimplementasikan perubahan nama produk yang menyeluruh dari "Microsoft Foundry" menjadi "Microsoft Foundry" di semua dokumentasi berbahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" menjadi "Microsoft Foundry"
  - Memperbarui semua referensi di seluruh dokumentasi bahasa Inggris dalam folder `docs/`
  - Mengganti nama folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Mengganti nama berkas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referensi konten diperbarui di 7 berkas dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` diubah menjadi `docs/microsoft-foundry/`
  - Semua referensi silang diperbarui untuk mencerminkan struktur folder baru
  - Tautan navigasi divalidasi di seluruh dokumentasi

- **📄 Penggantian Nama Berkas**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua tautan internal diperbarui untuk merujuk nama berkas baru

#### Berkas yang Diperbarui
- **Dokumentasi Bab** (7 berkas):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 pembaruan tautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referensi nama produk diperbarui
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari pembaruan sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referensi diperbarui (ikhtisar, umpan balik komunitas, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pembaruan tautan silang
  - `docs/getting-started/first-project.md` - 2 pembaruan tautan navigasi bab
  - `docs/getting-started/installation.md` - 2 pembaruan tautan bab berikutnya
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referensi diperbarui (navigasi, komunitas Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pembaruan tautan navigasi
  - `docs/troubleshooting/debugging.md` - 1 pembaruan tautan navigasi

- **Berkas Struktur Kursus** (2 berkas):
  - `README.md` - 17 referensi diperbarui (ikhtisar kursus, judul bab, bagian template, wawasan komunitas)
  - `course-outline.md` - 14 referensi diperbarui (ikhtisar, tujuan pembelajaran, sumber bab)

#### Divalidasi
- ✅ Tidak ada referensi jalur folder "ai-foundry" tersisa dalam dokumentasi bahasa Inggris
- ✅ Tidak ada referensi nama produk "Microsoft Foundry" tersisa dalam dokumentasi bahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama berkas dan folder selesai dengan sukses
- ✅ Referensi silang antar bab divalidasi

#### Catatan
- **Lingkup**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggris di folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui pada versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui pada versi ini
- **Contoh**: Berkas contoh mungkin masih merujuk penamaan lama (akan ditangani di pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repositori GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi berkas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Validasi semua tautan internal dokumentasi berfungsi dengan baik

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau Infrastruktur dan Validasi
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau Azure Developer CLI baru dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi fitur azd provision --preview**: Cakupan lengkap kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi rinci dalam panduan provisioning dengan kasus penggunaan dan keuntungan
  - Integrasi pemeriksaan pra-penerbangan untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keamanan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradasi dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Cap waktu pembaruan terakhir untuk transparansi
  - Desain responsif seluler untuk semua jenis perangkat

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsi pratinjau terintegrasi di seluruh dokumentasi penyebaran
- **Validasi Pra-penyebaran**: Skrip otomatis kini menyertakan pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui agar termasuk pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Ekspektasi yang jelas disampaikan kepada pengguna tentang status pengembangan konten

#### Diubah
- **Praktik Terbaik Penyebaran**: Alur kerja berfokus pada pratinjau kini menjadi pendekatan yang disarankan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Penyajian Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Diperbaiki
- **Pendekatan Mengutamakan Keamanan**: Perubahan infrastruktur kini dapat divalidasi sebelum penyebaran
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk tinjauan dan persetujuan
- **Kesadaran Biaya**: Pemahaman yang lebih baik tentang biaya sumber daya sebelum provisioning
- **Mitigasi Risiko**: Mengurangi kegagalan penyebaran melalui validasi awal

#### Implementasi Teknis
- **Integrasi Multi-berkas**: Fitur pratinjau didokumentasikan di 4 berkas utama
- **Pola Perintah**: Sintaksis dan contoh konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau disertakan dalam alur kerja dan skrip validasi
- **Indikator Visual**: Penandaan fitur BARU untuk kemudahan penemuan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Penyajian Profesional**: Menjaga kredibilitas repositori sekaligus menetapkan ekspektasi
- **Transparansi Garis Waktu**: Cap waktu pembaruan Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Peningkatan Materi Workshop dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran berpanduan 7 langkah dari penemuan hingga kustomisasi
  - 0-Introduction: Ikhtisar workshop dan pengaturan
  - 1-Select-AI-Template: Proses penemuan dan pemilihan template
  - 2-Validate-AI-Template: Prosedur penyebaran dan validasi
  - 3-Deconstruct-AI-Template: Memahami arsitektur template
  - 4-Configure-AI-Template: Konfigurasi dan kustomisasi
  - 5-Customize-AI-Template: Modifikasi lanjutan dan iterasi
  - 6-Teardown-Infrastructure: Pembersihan dan manajemen sumber daya
  - 7-Wrap-up: Ringkasan dan langkah selanjutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman belajar yang ditingkatkan
- **🎯 Jalur Pembelajaran Hands-On**: Metodologi 3 langkah (Penemuan → Penyebaran → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **Lab Workshop AI**: Diperluas dengan pengalaman belajar terstruktur 2-3 jam yang komprehensif
- **Dokumentasi Workshop**: Penyajian profesional dengan navigasi dan bantuan visual
- **Progresi Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga penyebaran produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang efisien

#### Diperbaiki
- **Aksesibilitas**: Antarmuka berbasis browser dengan fungsi pencarian, penyalinan, dan toggle tema
- **Pembelajaran Mandiri**: Struktur workshop fleksibel yang mengakomodasi kecepatan belajar berbeda
- **Aplikasi Praktis**: Skenario penyebaran template AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan cepat kata kunci dan pelajaran
- **Salin Blok Kode**: Fitur hover-to-copy untuk semua contoh kode
- **Toggle Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Tangkapan layar dan diagram untuk pemahaman yang ditingkatkan
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Besar dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Menyusun ulang seluruh kursus menjadi 8 bab pembelajaran bertahap
  - Bab 1: Dasar & Mulai Cepat (⭐ - 30-45 menit)
  - Bab 2: Pengembangan AI-First (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Otentikasi (⭐⭐ - 45-60 menit)
  - Bab 4: Infrastruktur sebagai Kode & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Solusi AI Multi-Agen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Validasi & Perencanaan Pra-Penyebaran (⭐⭐ - 1 jam)
  - Bab 7: Pemecahan Masalah & Debugging (⭐⭐ - 1-1.5 jam)
  - Bab 8: Pola Produksi & Enterprise (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi konsisten di seluruh dokumentasi
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk berbagai tingkat pengalaman dan tujuan
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat ditautkan dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini menyertakan konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai

- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan belajar yang terhubung ke bab terkait
- **Integrasi Workshop**: Lab praktik yang dipetakan ke beberapa tujuan pembelajaran bab

#### Diubah
- **Progres Pembelajaran**: Beralih dari dokumentasi linier ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Memindahkan panduan konfigurasi ke Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi konten khusus AI yang lebih baik sepanjang perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Bab 8 untuk pembelajar perusahaan

#### Ditingkatkan
- **Pengalaman Pengguna**: Navigasi breadcrumb yang jelas dan indikator progres bab
- **Aksesibilitas**: Pola navigasi yang konsisten untuk mempermudah penelusuran kursus
- **Presentasi Profesional**: Struktur kursus bergaya universitas yang cocok untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu pencarian konten relevan yang berkurang melalui organisasi yang lebih baik

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab yang distandarisasi di lebih dari 40 file dokumentasi
- **Navigasi Footer**: Panduan progres yang konsisten dan indikator penyelesaian bab
- **Cross-Linking**: Sistem penautan internal yang komprehensif menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh yang jelas terkait dengan tujuan pembelajaran

#### Peningkatan Panduan Belajar
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan belajar yang disusun ulang agar selaras dengan sistem 8 bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal belajar mingguan dengan hasil terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas langsung dengan skenario penyebaran nyata dan pemecahan masalah
- **📊 Progres Keterampilan**: Kemajuan jelas dari konsep dasar ke pola perusahaan dengan fokus pengembangan karier
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana belajar terstruktur 10 minggu dengan validasi tonggak pencapaian

### [v3.1.0] - 2025-09-17

#### Solusi AI Multi-Agen yang Ditingkatkan
**Versi ini meningkatkan solusi multi-agen ritel dengan penamaan agen yang lebih baik dan dokumentasi yang ditingkatkan.**

#### Diubah
- **Terminologi Multi-Agen**: Mengganti "agen Cora" dengan "agen Pelanggan" di seluruh solusi multi-agen ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "agen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan terbaru
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi agen Pelanggan
- **Diagram Arsitektur**: Menyegarkan diagram Mermaid dengan penamaan agen yang diperbarui
- **Contoh Kode**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penyebaran agar menggunakan konvensi CUSTOMER_AGENT_NAME

#### Ditingkatkan
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen yang lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyelarasan yang lebih baik dengan konvensi penamaan perusahaan
- **Materi Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan edukasi
- **Kegunaan Template**: Mempermudah pemahaman fungsi agen dan pola penyebaran

#### Detail Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM agar menggunakan tipe agen "customer"
- Memperbarui variabel lingkungan dari CORA_AGENT_* menjadi pola CUSTOMER_AGENT_*
- Menyegarkan semua perintah penyebaran dan konfigurasi kontainer

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber belajar yang komprehensif berfokus AI dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran AI-Pertama**: Restrukturisasi lengkap memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi lengkap untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **Pola Penyebaran Model AI**: Panduan rinci mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **Workshop AI**: Workshop praktik 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat diterapkan AZD
- **Praktik Terbaik Produksi AI**: Pola siap perusahaan untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **Panduan Pemecahan Masalah Khusus AI**: Troubleshooting lengkap untuk Model Microsoft Foundry, Layanan Kognitif, dan masalah penyebaran AI
- **Galeri Template AI**: Koleksi unggulan template Microsoft Foundry dengan rating kompleksitas
- **Materi Workshop**: Struktur workshop lengkap dengan lab praktik dan materi referensi

#### Ditingkatkan
- **Struktur README**: Fokus pada pengembang AI dengan data ketertarikan komunitas 45% dari Discord Microsoft Foundry
- **Jalur Pembelajaran**: Perjalanan pengembang AI khusus berdampingan dengan jalur tradisional untuk pelajar dan insinyur DevOps
- **Rekomendasi Template**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komunitas**: Dukungan komunitas Discord yang ditingkatkan dengan saluran dan diskusi khusus AI

#### Fokus Keamanan & Produksi
- **Pola Identitas Terkelola**: Konfigurasi autentikasi dan keamanan khusus AI
- **Optimasi Biaya**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Penyebaran Multi-Wilayah**: Strategi penyebaran aplikasi AI secara global
- **Pemantauan Kinerja**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Struktur Kursus Linier**: Progres logis dari pola penyebaran AI pemula hingga lanjutan
- **URL Terverifikasi**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Referensi Lengkap**: Semua tautan dokumentasi internal tervalidasi dan berfungsi
- **Siap Produksi**: Pola penyebaran perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini mewakili perombakan signifikan struktur repositori dan penyajian konten.**

#### Ditambahkan
- **Kerangka Pembelajaran Terstruktur**: Semua halaman dokumentasi kini menyertakan bagian Pengantar, Tujuan Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Menambahkan tautan Pelajaran Sebelumnya/Berikutnya di seluruh dokumentasi untuk panduan progres belajar
- **Panduan Belajar**: study-guide.md komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi penilaian
- **Presentasi Profesional**: Menghapus semua ikon emoji untuk aksesibilitas dan penampilan profesional yang lebih baik
- **Struktur Konten yang Ditingkatkan**: Organisasi dan aliran materi pembelajaran yang lebih baik

#### Diubah
- **Format Dokumentasi**: Standarisasi semua dokumentasi dengan struktur fokus pembelajaran yang konsisten
- **Alur Navigasi**: Menerapkan progres logis melalui semua materi pembelajaran
- **Penyajian Konten**: Menghapus elemen dekoratif demi formatasi yang jelas dan profesional
- **Struktur Tautan**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Ditingkatkan
- **Aksesibilitas**: Menghapus ketergantungan emoji untuk kompatibilitas pembaca layar lebih baik
- **Penampilan Profesional**: Penyajian bersih bergaya akademik yang cocok untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan terstruktur dengan tujuan dan hasil jelas untuk setiap pelajaran
- **Organisasi Konten**: Alur logis dan keterkaitan topik yang lebih baik

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan memulai lengkap
  - Dokumentasi lengkap penyebaran dan penyediaan
  - Sumber daya pemecahan masalah dan panduan debugging terperinci
  - Alat dan prosedur validasi sebelum penyebaran

- **Modul Memulai**
  - AZD Dasar: Konsep inti dan terminologi
  - Panduan Instalasi: Instruksi pengaturan spesifik platform
  - Panduan Konfigurasi: Pengaturan lingkungan dan autentikasi
  - Tutorial Proyek Pertama: Pembelajaran langsung langkah demi langkah

- **Modul Penyebaran dan Penyediaan**
  - Panduan Penyebaran: Dokumentasi alur kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kode dengan Bicep
  - Praktik terbaik untuk penyebaran produksi
  - Pola arsitektur multi-layanan

- **Modul Validasi Pra-Penyebaran**
  - Perencanaan Kapasitas: Validasi ketersediaan sumber daya Azure
  - Pemilihan SKU: Panduan lengkap tingkat layanan
  - Pemeriksaan Pra-terbang: Skrip validasi otomatis (PowerShell dan Bash)
  - Perkiraan biaya dan alat perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Masalah Umum: Permasalahan dan solusi yang sering ditemui
  - Panduan Debugging: Metodologi pemecahan masalah sistematis
  - Teknik dan alat diagnostik lanjutan
  - Pemantauan dan optimasi kinerja

- **Sumber Daya dan Referensi**
  - Cheat Sheet Perintah: Referensi cepat untuk perintah penting
  - Glosarium: Definisi istilah dan akronim komprehensif
  - FAQ: Jawaban terperinci atas pertanyaan umum
  - Tautan sumber daya eksternal dan koneksi komunitas

- **Contoh dan Template**
  - Contoh aplikasi web sederhana
  - Template penyebaran situs web statis
  - Konfigurasi aplikasi kontainer
  - Pola integrasi basis data
  - Contoh arsitektur mikroservis
  - Implementasi fungsi serverless

#### Fitur
- **Dukungan Multi-Platform**: Panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Berbagai Tingkatan Keterampilan**: Konten dirancang untuk pelajar hingga pengembang profesional
- **Fokus Praktis**: Contoh langsung dan skenario dunia nyata
- **Cakupan Komprehensif**: Dari konsep dasar hingga pola perusahaan tingkat lanjut
- **Pendekatan Keamanan-Utara**: Praktik terbaik keamanan terintegrasi sepenuhnya
- **Optimasi Biaya**: Panduan penyebaran hemat biaya dan pengelolaan sumber daya

#### Kualitas Dokumentasi
- **Contoh Kode Terperinci**: Sampel kode praktis dan teruji
- **Instruksi Langkah-demi-Langkah**: Panduan jelas dan dapat ditindaklanjuti
- **Penanganan Kesalahan Komprehensif**: Pemecahan masalah untuk permasalahan umum
- **Integrasi Praktik Terbaik**: Standar dan rekomendasi industri
- **Kompatibilitas Versi**: Terbaru dengan layanan Azure dan fitur azd terkini

## Rencana Peningkatan di Masa Depan

### Versi 3.1.0 (Direncanakan)
#### Perluasan Platform AI
- **Dukungan Multi-Model**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **Kerangka Agen AI**: Template untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Pola RAG Lanjutan**: Opsi basis data vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabilitas AI**: Pemantauan ditingkatkan untuk kinerja model, penggunaan token, dan kualitas respons

#### Pengalaman Pengembang
- **Ekstensi VS Code**: Pengalaman pengembangan AZD + Microsoft Foundry terintegrasi
- **Integrasi GitHub Copilot**: Pembuatan template AZD dengan bantuan AI
- **Tutorial Interaktif**: Latihan kode langsung dengan validasi otomatis untuk skenario AI
- **Konten Video**: Tutorial video tambahan untuk pembelajar visual yang berfokus pada penyebaran AI

### Versi 4.0.0 (Direncanakan)
#### Pola AI Perusahaan
- **Kerangka Tata Kelola**: Tata kelola model AI, kepatuhan, dan jejak audit
- **AI Multi-Penyewa**: Pola layanan AI terisolasi untuk melayani banyak pelanggan
- **Penyebaran AI Edge**: Integrasi dengan Azure IoT Edge dan instansi kontainer
- **AI Hybrid Cloud**: Pola penyebaran multi-cloud dan hibrida untuk beban kerja AI

#### Fitur Lanjutan
- **Otomasi Pipeline AI**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Keamanan Lanjutan**: Pola zero-trust, endpoint privat, dan perlindungan ancaman canggih
- **Optimasi Kinerja**: Penyempurnaan dan skalasi lanjutan untuk aplikasi AI berthroughput tinggi
- **Distribusi Global**: Pola pengiriman konten dan caching edge untuk aplikasi AI

### Versi 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Penambahan yang Diusulkan - Kini Diimplementasikan di v3.0.0
- ✅ **Konten Berfokus AI**: Integrasi Microsoft Foundry komprehensif (Selesai)
- ✅ **Tutorial Interaktif**: Lab workshop AI langsung (Selesai)
- ✅ **Modul Keamanan Lanjutan**: Pola keamanan khusus AI (Selesai)
- ✅ **Optimasi Kinerja**: Strategi tuning beban kerja AI (Selesai)

### Versi 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Peningkatan Minor - Beberapa Selesai di Rilis Saat Ini
- ✅ **Contoh Tambahan**: Skenario penyebaran berfokus AI (Selesai)
- ✅ **FAQ Diperluas**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Perluasan Pemantauan**: Pola pemantauan dan peringatan khusus AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Dokumentasi Ramah Mobile**: Desain responsif untuk pembelajaran mobile
- **Akses Offline**: Paket dokumentasi yang dapat diunduh
- **Integrasi IDE Ditingkatkan**: Ekstensi VS Code untuk AZD + alur kerja AI
- **Dashboard Komunitas**: Metrik komunitas real-time dan pelacakan kontribusi

## Berkontribusi pada Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, harap pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti versi semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Ditambahkan, Diubah, Dihentikan, Dihapus, Diperbaiki, Keamanan
4. **Deskripsi Jelas**: Deskripsi singkat tentang apa yang diubah
5. **Penilaian Dampak**: Bagaimana perubahan mempengaruhi pengguna yang ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kapabilitas
- Contoh baru, template, atau sumber belajar
- Alat tambahan, skrip, atau utilitas

#### Diubah
- Modifikasi pada fungsi atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau ketepatan
- Restrukturisasi konten atau organisasi

#### Dihentikan
- Fitur atau pendekatan yang sedang dihentikan
- Bagian dokumentasi yang dijadwalkan dihapus
- Metode yang memiliki alternatif lebih baik

#### Dihapus
- Fitur, dokumentasi, atau contoh yang tidak relevan lagi
- Informasi usang atau pendekatan yang dihentikan
- Konten yang redundan atau dikonsolidasikan

#### Diperbaiki
- Koreksi kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah yang dilaporkan
- Peningkatan ketepatan atau fungsi


#### Keamanan
- Perbaikan atau peningkatan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Panduan Versi Semantik

#### Versi Mayor (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Restrukturisasi signifikan dari konten atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi mendasar

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Peningkatan yang mempertahankan kompatibilitas mundur
- Contoh, alat, atau sumber daya tambahan

#### Versi Perbaikan (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Umpan Balik dan Saran Komunitas

Kami secara aktif mendorong umpan balik komunitas untuk meningkatkan sumber belajar ini:

### Cara Memberikan Umpan Balik
- **GitHub Issues**: Laporkan masalah atau usulkan perbaikan (masalah khusus AI sangat disambut)
- **Diskusi Discord**: Bagikan ide dan berinteraksi dengan komunitas Microsoft Foundry
- **Pull Requests**: Kontribusi perbaikan langsung pada konten, khususnya templat dan panduan AI
- **Microsoft Foundry Discord**: Ikuti saluran #Azure untuk diskusi AZD + AI
- **Forum Komunitas**: Ikut serta dalam diskusi pengembang Azure yang lebih luas

### Kategori Umpan Balik
- **Akurasi Konten AI**: Koreksi informasi integrasi dan penyebaran layanan AI
- **Pengalaman Belajar**: Saran untuk meningkatkan alur pembelajaran pengembang AI
- **Konten AI yang Hilang**: Permintaan templat, pola, atau contoh AI tambahan
- **Aksesibilitas**: Peningkatan untuk kebutuhan belajar yang beragam
- **Integrasi Alat AI**: Saran untuk integrasi alur pengembangan AI yang lebih baik
- **Pola AI Produksi**: Permintaan pola penyebaran AI perusahaan

### Komitmen Tanggapan
- **Tanggapan Masalah**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Fitur**: Evaluasi dalam satu minggu
- **Kontribusi Komunitas**: Tinjauan dalam satu minggu
- **Masalah Keamanan**: Prioritas langsung dengan tanggapan dipercepat

## Jadwal Pemeliharaan

### Pembaruan Reguler
- **Tinjauan Bulanan**: Akurasi konten dan validasi tautan
- **Pembaruan Triwulanan**: Penambahan dan peningkatan konten utama
- **Tinjauan Setengah Tahunan**: Restrukturisasi dan peningkatan menyeluruh
- **Rilis Tahunan**: Pembaruan versi mayor dengan peningkatan signifikan

### Pemantauan dan Penjaminan Kualitas
- **Pengujian Otomatis**: Validasi rutin contoh kode dan tautan
- **Integrasi Umpan Balik Komunitas**: Penerapan rutin saran pengguna
- **Pembaruan Teknologi**: Penyesuaian dengan layanan Azure terbaru dan rilis azd
- **Audit Aksesibilitas**: Tinjauan rutin prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Versi Mayor Terbaru**: Dukungan penuh dengan pembaruan rutin
- **Versi Mayor Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Warisan**: Dukungan komunitas saja, tanpa pembaruan resmi

### Panduan Migrasi
Saat versi mayor dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Detail perubahan besar
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Berikutnya**: Kembali ke [Main README](README.md)

**Tetap Terupdate**: Pantau repositori ini untuk notifikasi tentang rilis baru dan pembaruan penting pada materi pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->