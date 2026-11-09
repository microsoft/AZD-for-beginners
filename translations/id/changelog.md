# Catatan Perubahan - AZD Untuk Pemula

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan penting, pembaruan, dan perbaikan pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versioning semantik dan memelihara log ini untuk membantu pengguna memahami apa yang telah berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapatkan informasi tentang fitur baru dan penambahan konten
- Memahami perbaikan yang dilakukan pada dokumentasi yang sudah ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran seiring waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian-bagian yang telah diperbarui atau diperbaiki
- Merencanakan jalur pembelajaran Anda berdasarkan materi terkini
- Memberikan umpan balik dan saran untuk perbaikan di masa depan

## Riwayat Versi

### [v3.24.0]- 2026-11-04

#### Diperbaiki
- Memperbaiki navigasi kursus bahasa Inggris, jalur halaman yang dipindahkan, jangkar yang hilang, dan referensi eksternal usang, termasuk tautan Bab 2 ke panduan AI produksi.
- Meninjau panduan saat ini terhadap AZD 1.37.2 yang sudah diterbitkan, agen 1.0.0-beta.23, dan evaluasi 1.0.0-beta.2. Mendokumentasikan alur kerja `azd ai eval` terpisah dan migrasi konfigurasi optimasi.
- Mengoreksi flag CLI yang tidak didukung, batas otentikasi, panduan lingkungan/rahasia teks biasa, pembaruan infrastruktur, konfigurasi model, dan contoh pemulihan yang merusak.
- Menyegarkan workshop terhadap contoh AI Agents saat ini, termasuk hook aktual, input konfigurasi, pengujian evaluasi, titik masuk red-teaming, dan observabilitas.
- Mengoreksi klaim implementasi contoh dan memperbaiki masalah terkait aplikasi/infrastruktur/konfigurasi. Materi arsitektur ritel secara eksplisit dibedakan dari aplikasi kerja lengkap.
- Mengembalikan matriks bahasa CodeQL, memilih Node.js 24 yang didukung untuk container pengembangan, dan membuat validator setup melaporkan perintah versi yang gagal.

#### Ditambahkan
- Pemeriksa tautan/jangkar offline bahasa Inggris saja, pengujian regresi, dan alur kerja dokumentasi yang juga membangun workshop dalam mode ketat. Terjemahan yang dihasilkan dan gambar yang diterjemahkan tidak termasuk.

#### Lingkup Validasi
- Pemeriksaan sumber, sintaksis, konfigurasi, perilaku lokal, dan tautan jaringan tidak menentukan kelayakan penyebaran Azure langsung, kuota, RBAC, ketersediaan model regional, penagihan, kepatuhan keamanan, atau kesiapan produksi.
- Entri lama di bawah adalah catatan historis, bukan instruksi perintah atau rilis saat ini.

### [v3.23.0] - 2026-07-13

#### Penyegaran AZD 1.27.1: Pembaruan Versi Terkini
**Versi ini memvalidasi ulang kursus terhadap `azd` `1.27.1` (Juli 2026, rilis stabil terbaru) dan ekstensi agen AI preview `azure.ai.agents` `1.0.0-beta.5` saat ini, memperbarui setiap spanduk "divalidasi terhadap" setelah rilis 1.26.0, 1.27.0, dan 1.27.1.**

#### Diubah
- **✅ Dasar validasi diperbarui** dari `azd 1.25.6` (Juni 2026) ke `azd 1.27.1` (Juli 2026) di seluruh README root, semua README bab, pelajaran container pengembangan Bab 1 (termasuk contoh versi pin), pelajaran template khusus Bab 4, pelajaran multi-agen Bab 5, dan dokumentasi workshop
- **🤖 Dasar Bab 2 disegarkan** dari `azd 1.23.12` (Maret 2026) ke `azd 1.27.1` di `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, dan `microsoft-foundry-integration.md`; tanggal catatan validasi diperbarui ke 2026-07-13
- **🧩 Ekstensi agen AI dinaikkan** dari `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ke rilis `1.0.0-beta.5` saat ini di README Bab 2 dan `agents.md`
- **🧪 Contoh validasi workshop** (output `azd version`) diperbarui ke `1.27.1`

#### Catatan tentang rilis azd terkait (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Dukungan Go untuk Azure Functions pada Flex Consumption, filter langganan per-tenant `azd config sub-filter`, bundel ekstensi mandiri (`azd x pack --bundle`), dan `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Proyek/agen Azure AI Foundry dimodelkan langsung di `azure.yaml` (init tanpa Bicep/Terraform), dukungan penyebaran container untuk App Service (`host: appservice` + `language: docker`), perintah langsung `-s/--source` untuk `azd extension`, dan `azd tool uninstall`
- **1.27.1 (2026-07-09):** flag `--no-dependencies` untuk `azd extension install`, model yang tidak digunakan tidak termasuk dari prompt katalog/kuota secara default, dan beberapa perbaikan bug

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

#### Penutupan Celah Pemula #2: Pembuatan Template, Dev Containers, Pulumi, Azure DevOps, Service Principals, dan Lainnya
**Versi ini menutup celah menengah yang tersisa berdasarkan analisis cakupan azd: cara membuat dan menerbitkan template Anda sendiri, lingkungan dev-container/Codespaces yang dapat direproduksi, penyedia infrastruktur Pulumi, walkthrough CI/CD Azure DevOps, otentikasi service-principal, panduan pemilihan host (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, penanganan kesalahan hook, dan praktik lingkungan tim/bagian.**

#### Ditambahkan
- **🧱 Pelajaran baru Bab 4** `docs/chapter-04-infrastructure/custom-templates.md` — membuat template azd Anda sendiri: struktur yang diperlukan (`azure.yaml`, `infra/`, `src/`), bidang `metadata.template`, parameterisasi infrastruktur dengan token sumber daya `uniqueString()` dan tag `azd-env-name`, pengujian lokal dengan `azd init --template <local-path>`, penerbitan ke GitHub, dan pengajuan ke galeri Awesome AZD
- **📦 Pelajaran baru Bab 1** `docs/chapter-01-foundation/dev-containers.md` — lingkungan azd yang dapat direproduksi dengan Dev Containers dan GitHub Codespaces: `.devcontainer/devcontainer.json` minimal menggunakan fitur resmi `ghcr.io/azure/azure-dev/azd`, fitur spesifik bahasa, `docker-in-docker` untuk host container, dan `azd auth login --use-device-code` untuk masuk jarak jauh
- **🧩 Bagian Pulumi dengan azd** di `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, tata letak folder Pulumi, stack yang dipetakan ke lingkungan azd, output/tagging yang diperlukan, dan alur kerja `azd up` / `azd down` identik
- **🎯 Panduan pemilihan host** di `docs/chapter-04-infrastructure/provisioning.md` — perbandingan ramah pemula dari `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan kapan memilih AKS atau Azure Spring Apps
- **🛠️ Walkthrough CI/CD Azure DevOps** di `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, koneksi layanan dengan federasi identitas beban kerja (OIDC), `azure-dev.yml` yang dihasilkan, dan pengaturan variabel grup
- **🔑 Service Principals (Pola 4)** ditambahkan pada `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non-interaktif dengan rahasia klien vs. kredensial federasi/OIDC, kapan digunakan, dan penyimpanan kredensial yang aman
- **🪝 Subbagian penanganan kesalahan hook** di `docs/chapter-04-infrastructure/deployment-guide.md` — kode keluar dan `set -e`, `continueOnError`, pengujian hook secara terpisah dengan `azd hooks run`, shell spesifik OS, dan `--debug`
- **👥 Bagian lingkungan tim / berbagi** di `docs/chapter-03-configuration/configuration.md` — apa yang ada di `.azure/`, apa yang di Gitignore, lingkungan per pengembang, `azd env list`/`select`, dan penyediaan nilai lingkungan di CI/CD
- **🧰 Penjelasan `azd restore` dan `azd package` yang diperluas** di `resources/cheat-sheet.md` — memulihkan dependensi dan membangun artefak yang dapat diterapkan tanpa menyebarkannya

#### Diubah
- **🧭 Tabel pelajaran Bab 4** diperbarui untuk menyertakan pelajaran baru "Membuat Template Sendiri" (Pelajaran 3)
- **🧭 Tabel pelajaran Bab 1** diperbarui untuk menyertakan pelajaran baru "Dev Containers & Codespaces" (Pelajaran 5); footer navigasi dihubungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Penutupan Celah Pemula: Pelajaran Multi-Agen Praktik, "Bawa Aplikasimu Sendiri," Terraform, dan Walkthrough CI/CD
**Versi ini menutup celah terbesar untuk panduan pemula lengkap dengan menambahkan dua pelajaran praktis baru (walkthrough multi-agen yang dapat diterapkan dan menambahkan azd ke aplikasi yang sudah ada), pengenalan hook yang ramah pemula, bagian Terraform dengan azd, walkthrough pipeline GitHub Actions langkah demi langkah, penjelasan ekstensi preview baru, dan daftar periksa verifikasi penyebaran yang eksplisit.**

#### Ditambahkan
- **🤝 Pelajaran baru Bab 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — walkthrough praktis penuh dua agen yang dapat diterapkan (orchestrator + spesialis) menggunakan template nyata (`contoso-creative-writer`), mencakup kapan menggunakan multi-agen, alur kerja `azd up`, memahami sumber daya yang diterapkan, pelacakan lintas-agen, kustomisasi, dan pembersihan
- **📦 Pelajaran baru Bab 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambahkan azd ke proyek yang sudah ada dengan `azd init` ("gunakan kode di direktori saat ini"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, deteksi host, dan penyebaran dengan `azd up`
- **🌐 Bagian Terraform dengan azd** ditambahkan ke `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, tata letak folder `.tf`, output `AZURE_*` dan penandaan `azd-env-name` yang diperlukan, dan alur kerja identik `azd up` / `azd down` (menutup celah di mana dukungan Terraform diklaim tapi hanya Bicep yang ditunjukkan)
- **⚙️ Walkthrough GitHub Actions langkah demi langkah** di `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke penyebaran otomatis: `azd pipeline config`, kredensial federasi OIDC (tanpa rahasia tersimpan), `azure-dev.yml` yang dihasilkan, dan panduan rahasia vs variabel
- **🪝 Pengenalan "Baru dengan hook?" untuk pemula** di `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, tabel tahapan hook, hook minimal pertama, dan menjalankan hook secara manual dengan `azd hooks run`
- **✅ Daftar periksa "Verifikasi Penyebaran Anda"** ditambahkan ke Langkah 5 dari `docs/chapter-01-foundation/first-project.md` — tes asap, pemeriksaan endpoint kesehatan, dan kriteria keberhasilan eksplisit
- **🧩 Penjelasan ekstensi preview baru** `azure.ai.skills` dan `azure.ai.connections` (apa itu dan kapan digunakan) di `docs/chapter-08-production/production-ai-practices.md`

#### Diubah
- **🧭 Tabel pelajaran Bab 5** dikoreksi: `multi-agent-basics.md` sekarang Pelajaran 1 (satu-satunya pelajaran praktis penuh), dengan pelabelan jujur bahwa Pelajaran 2 ada di Bab 6 dan skenario Retail adalah cetak biru arsitektur, bukan template satu perintah
- **🧭 Tabel pelajaran Bab 1** sekarang menyertakan pelajaran baru "Bawa Aplikasimu Sendiri" (Pelajaran 4)
- **🔗 Footer navigasi** diperbarui: `first-project.md` sekarang menautkan ke depan ke `bring-your-own-app.md`

#### Diperbaiki
- **🧱 Menutup celah "klaim tapi hilang" Terraform** — kursus sebelumnya merujuk dukungan Terraform tanpa menunjukkannya
- **🔀 Mengoreksi tautan silang Bab 5 yang menyesatkan** yang mengindikasikan implementasi multi-agen penuh ada sedangkan hanya cetak biru arsitektur yang ada

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
**Versi ini memvalidasi ulang kursus terhadap `azd` `1.25.6` (Juni 2026) dan ekstensi `azure.ai.agents` `0.1.40-preview`, memperluas panduan AI dari "mengkonstruksi agen" ke seluruh siklus hidup agen (uji → evaluasi → optimasi → inspeksi → hapus), menampilkan ekstensi pratinjau baru `azure.ai.skills` dan `azure.ai.connections`, serta mencatat rebranding produk ".NET Aspire" → "Aspire".**

#### Ditambahkan
- **🔁 Cakupan siklus hidup agen penuh** untuk pemula dan insinyur AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabel siklus hidup (konstruksi → uji → ukur → perbaiki → inspeksi → bersihkan) ditambahkan ke bagian Ekstensi dan Perintah AI
  - `docs/chapter-08-production/production-ai-practices.md` — Bagian baru "Mengelola Siklus Hidup Agen" yang mencakup `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perintah Agen AI yang diperluas dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Ekstensi pratinjau baru** didokumentasikan: `azure.ai.skills` (keahlian agen yang dapat digunakan ulang) dan `azure.ai.connections` (koneksi Foundry) ditambahkan ke tabel ekstensi dan lembar contekan
- **⏱️ Panduan waktu respons** — contoh `azd ai agent invoke` sekarang mencatat total latensi dan waktu-ke-bait-pertama
- **📌 Banner versi** di README root mengarahkan pembelajar ke `azd version` dan `azd upgrade`

#### Diubah
- **✅ Baseline validasi diperbarui** dari `azd 1.23.12` (Maret 2026) ke `azd 1.25.6` (Juni 2026) di semua README bab dan dokumen workshop
- **🤖 Catatan ekstensi Bab 2** diperbarui dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh validasi workshop** (output `azd version`) diperbarui ke `1.25.6`
- **🧭 README "Apa yang Baru di azd Hari Ini"** disegarkan untuk menyoroti siklus hidup agen secara menyeluruh, ekstensi AI baru, dan perbaikan kualitas hidup terbaru (`azd init` idempoten, `azd auth login` pembersihan token usang, `azd tool` prompt pertama kali)
- **📖 File agents.md Bab 2 (Opsi 4)** sekarang mengarahkan pembelajar ke perintah siklus hidup pasca-deploy daripada berhenti di `azd up`

#### Diperbaiki
- **🏷️ Penamaan produk** — menambahkan catatan rebranding Aspire (".NET Aspire" kini hanya "Aspire"); dukungan azd untuk Aspire tidak berubah
- **🔎 Validasi rilis langsung** dikonfirmasi dengan feed rilis CLI Azure Developer: CLI stabil `1.25.6` (2026-06-12) dan `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Klarifikasi Onboarding Pemula, Validasi Setup & Pembersihan Perintah AZD Akhir
**Versi ini mengikuti sweep validasi AZD 1.23 dengan lintasan dokumentasi yang fokus pada pemula: memperjelas panduan autentikasi AZD terlebih dahulu, menambahkan skrip validasi setup lokal, memverifikasi perintah utama terhadap live CLI AZD, dan menghapus referensi perintah berbahasa Inggris yang sudah usang di luar changelog.**

#### Ditambahkan
- **🧪 Skrip validasi setup pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` sehingga pembelajar dapat memastikan alat yang dibutuhkan sebelum memulai Bab 1
- **✅ Langkah validasi setup di muka** di README root dan README Bab 1 agar persyaratan yang hilang dapat terdeteksi sebelum `azd up`

#### Diubah
- **🔐 Panduan autentikasi pemula** sekarang secara konsisten menganggap `azd auth login` sebagai jalur utama untuk alur kerja AZD, dengan `az login` disebut sebagai opsional kecuali perintah Azure CLI digunakan langsung
- **📚 Alur onboarding Bab 1** sekarang mengarahkan pembelajar untuk memvalidasi setup lokal mereka sebelum langkah instalasi, autentikasi, dan deploy pertama
- **🛠️ Pesan validator** sekarang jelas memisahkan persyaratan penghalang dari peringatan opsional Azure CLI untuk jalur pemula hanya AZD
- **📖 Dokumentasi konfigurasi, pemecahan masalah, dan contoh** sekarang membedakan antara autentikasi AZD yang wajib dan sign-in Azure CLI opsional dimana keduanya sebelumnya disajikan tanpa konteks

#### Diperbaiki
- **📋 Referensi perintah sumber bahasa Inggris yang tersisa** diperbarui ke bentuk AZD terkini, termasuk `azd config show` di lembar contekan dan `azd monitor --overview` dimana panduan overview Azure Portal dimaksudkan
- **🧭 Klaim pemula di Bab 1** dilunakkan untuk menghindari janji berlebih tentang perilaku nol kesalahan atau rollback yang dijamin di semua template dan sumber daya Azure
- **🔎 Validasi CLI langsung** dikonfirmasi dukungannya saat ini untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

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
**Versi ini melakukan sweep validasi dokumentasi terhadap `azd` `1.23.12`, memperbarui contoh perintah AZD yang sudah usang, menyegarkan panduan model AI ke default terkini, dan memperluas instruksi workshop di luar GitHub Codespaces untuk mendukung dev container dan klon lokal juga.**

#### Ditambahkan
- **✅ Catatan validasi di seluruh bab inti dan dokumen workshop** untuk membuat baseline AZD yang diuji menjadi eksplisit bagi pembelajar yang menggunakan build CLI yang lebih baru atau lebih lama
- **⏱️ Panduan timeout deploy** untuk deployment aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah inspeksi ekstensi** dengan `azd extension show azure.ai.agents` di dokumen alur kerja AI
- **🌐 Panduan lingkungan workshop yang lebih luas** meliputi GitHub Codespaces, dev container, dan klon lokal dengan MkDocs

#### Diubah
- **📚 README pengantar bab** sekarang secara konsisten mencatat validasi terhadap `azd 1.23.12` di seluruh bagian fondasi, konfigurasi, infrastruktur, multi-agen, pra-deployment, pemecahan masalah, dan produksi
- **🛠️ Referensi perintah AZD** diperbarui ke bentuk terkini di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` tergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` dimana overview Application Insights dimaksudkan
- **🧪 Contoh pratinjau provisioning** disederhanakan ke penggunaan yang didukung kini seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Alur workshop** diperbarui agar pembelajar dapat menyelesaikan lab di Codespaces, dev container, atau klon lokal daripada mengasumsikan eksekusi hanya di Codespaces
- **🔐 Panduan autentikasi** sekarang memprioritaskan `azd auth login` untuk alur kerja AZD, dengan `az login` diposisikan sebagai opsional saat perintah Azure CLI digunakan langsung

#### Diperbaiki
- **🪟 Perintah instalasi Windows** dinormalkan ke penulisan paket `winget` terkini di panduan instalasi
- **🐧 Panduan instalasi Linux** dikoreksi untuk menghindari instruksi pengelola paket distro-spesifik `azd` yang tidak didukung dan sebagai gantinya mengarahkan ke aset rilis jika sesuai
- **📦 Contoh model AI** disegarkan dari default lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` ke contoh terkini seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Snippet deploy dan diagnostik** dikoreksi untuk menggunakan perintah lingkungan dan status terkini di log, skrip, dan langkah pemecahan masalah
- **⚙️ Panduan GitHub Actions** diperbarui dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** diperbarui dari `azd mcp consent` ke `azd copilot consent list`

#### Ditingkatkan
- **🧠 Panduan bab AI** sekarang lebih baik menjelaskan perilaku `azd ai` sensitif pratinjau, login spesifik tenant, penggunaan ekstensi terkini, dan rekomendasi deployment model yang diperbarui
- **🧪 Instruksi workshop** sekarang menggunakan contoh versi yang lebih realistis dan bahasa setup lingkungan yang lebih jelas untuk lab praktis
- **📈 Dokumen produksi dan pemecahan masalah** sekarang lebih selaras dengan contoh monitoring, fallback model, dan tingkat biaya saat ini

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

#### Perintah AZD AI CLI, Validasi Konten & Perluasan Template
**Versi ini menambahkan cakupan perintah `azd ai`, `azd extension`, dan `azd mcp` di seluruh bab terkait AI, memperbaiki tautan rusak dan kode yang deprecated di agents.md, memperbarui lembar contekan, dan merombak bagian Template Contoh dengan deskripsi yang tervalidasi dan template Azure AI AZD baru.**

#### Ditambahkan
- **🤖 Cakupan AZD AI CLI** di 7 file (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagian baru "Ekstensi dan Perintah AI" yang memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsi 4: `azd ai agent init` dengan tabel perbandingan (template vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subbagian "Ekstensi AZD untuk Foundry" dan "Deployment Agen Pertama"
  - `docs/chapter-05-multi-agent/README.md` — Mulai Cepat sekarang menunjukkan jalur deployment berbasis template dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bagian Deploy sekarang termasuk opsi `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subbagian "Perintah Ekstensi AZD AI untuk Diagnostik"
  - `resources/cheat-sheet.md` — Bagian baru "Perintah AI & Ekstensi" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Template contoh AZD AI baru** di `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan dukungan chat suara
  - **azure-search-openai-demo-java** — Chat RAG Java menggunakan Langchain4J dengan opsi deployment ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif multi-agen menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa server menggunakan Azure Functions + LangChain.js + Cosmos DB dengan dukungan pengembangan lokal Ollama
  - **chat-with-your-data-solution-accelerator** — Akselerator RAG Perusahaan dengan portal admin, integrasi Teams, dan opsi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi referensi orkestrasi MCP multi-agen dengan server di .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Template starter Bicep infrastruktur Azure AI minimal
  - **🔗 Tautan Galeri AZD AI yang Luar Biasa** — Referensi ke [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ template)

#### Diperbaiki
- **🔗 navigasi agents.md**: Tautan Sebelumnya/Berikutnya sekarang cocok dengan urutan pelajaran README Bab 2 (Integrasi Microsoft Foundry → Agen → Penyebaran Model AI)
- **🔗 tautan rusak agents.md**: `production-ai-practices.md` dikoreksi menjadi `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 kode usang agents.md**: Mengganti `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak valid agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 penghitungan token agents.md**: Mengganti perkiraan kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Mengoreksi layanan dari "Cognitive Search + App Service" menjadi "Azure AI Search + Azure Container Apps" (host default diubah Oktober 2024)
- **contoso-chat**: Memperbarui deskripsi untuk merujuk Azure AI Foundry + Prompty, sesuai judul dan tumpukan teknologi repositori

#### Dihapus
- **ai-document-processing**: Menghapus referensi template yang tidak berfungsi (repo tidak dapat diakses secara publik sebagai template AZD)

#### Ditingkatkan
- **📝 latihan agents.md**: Latihan 1 sekarang menampilkan output yang diharapkan dan langkah `azd monitor`; Latihan 2 menyertakan kode pendaftaran lengkap `FunctionTool`; Latihan 3 mengganti panduan samar dengan perintah konkret `prepdocs.py`
- **📚 sumber daya agents.md**: Memperbarui tautan dokumentasi ke dokumen Azure AI Agent Service dan quickstart saat ini
- **📋 tabel Langkah Selanjutnya agents.md**: Menambahkan tautan AI Workshop Lab untuk cakupan bab lengkap

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
**Versi ini memperbaiki navigasi bab README.md dengan format tabel yang ditingkatkan.**

#### Diubah
- **Tabel Peta Kursus**: Ditingkatkan dengan tautan pelajaran langsung, perkiraan durasi, dan tingkat kompleksitas
- **Pembersihan Folder**: Menghapus folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validasi Tautan**: Semua 21+ tautan internal di tabel Peta Kursus diverifikasi

### [v3.16.0] - 2026-02-05

#### Pembaruan Nama Produk
**Versi ini memperbarui referensi produk dengan branding Microsoft saat ini.**

#### Diubah
- **Microsoft Foundry → Microsoft Foundry**: Semua referensi diperbarui di file non-terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama layanan diperbarui untuk mencerminkan branding saat ini

#### Berkas Diperbarui
- `README.md` - Halaman landing utama kursus
- `changelog.md` - Riwayat versi
- `course-outline.md` - Struktur kursus
- `docs/chapter-02-ai-development/agents.md` - Panduan agen AI
- `examples/README.md` - Dokumentasi contoh
- `workshop/README.md` - Halaman landing workshop
- `workshop/docs/index.md` - Indeks workshop
- `workshop/docs/instructions/*.md` - Semua berkas instruksi workshop

---

### [v3.15.0] - 2026-02-05

#### Restrukturisasi Repositori Besar: Nama Folder Berbasis Bab
**Versi ini merestrukturisasi dokumentasi ke dalam folder bab khusus untuk navigasi yang lebih jelas.**

#### Penggantian Nama Folder
Folder lama telah diganti dengan folder bernomor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Menambahkan baru: `docs/chapter-05-multi-agent/`

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
| Semua berkas pra-penyebaran | pre-deployment/ | chapter-06-pre-deployment/ |
| Semua berkas troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambahkan
- **📚 Berkas README Bab**: Membuat README.md di setiap folder bab dengan:
  - Tujuan pembelajaran dan durasi
  - Tabel pelajaran dengan deskripsi
  - Perintah mulai cepat
  - Navigasi ke bab lain

#### Diubah
- **🔗 Memperbarui semua tautan internal**: 78+ jalur diperbarui di seluruh berkas dokumentasi
- **🗺️ README.md utama**: Memperbarui Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Memperbarui referensi silang ke folder bab

#### Dihapus
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Restrukturisasi Repositori: Navigasi Bab
**Versi ini menambahkan berkas README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Agen AI Baru
**Versi ini menambahkan panduan lengkap untuk menyebarkan agen AI dengan Azure Developer CLI.**

#### Ditambahkan
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap meliputi:
  - Apa itu agen AI dan bagaimana perbedaannya dengan chatbot
  - Tiga template agen mulai cepat (Foundry Agents, Prompty, RAG)
  - Pola arsitektur agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan kustomisasi alat
  - Pemantauan dan pelacakan metrik
  - Pertimbangan biaya dan optimasi
  - Skenario troubleshooting umum
  - Tiga latihan praktik dengan kriteria keberhasilan

#### Struktur Konten
- **Pendahuluan**: Konsep agen untuk pemula
- **Mulai Cepat**: Menyebarkan agen dengan `azd init --template get-started-with-ai-agents`
- **Pola Arsitektur**: Diagram visual pola agen
- **Konfigurasi**: Pengaturan alat dan variabel lingkungan
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktik progresif (20-45 menit tiap latihan)

---

### [v3.12.0] - 2026-02-05

#### Pembaruan Environment DevContainer
**Versi ini memperbarui konfigurasi container development dengan alat modern dan default lebih baik untuk pengalaman belajar AZD.**

#### Diubah
- **🐳 Gambar Dasar**: Diperbarui dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stable terbaru)
- **📛 Nama Container**: Diganti dari "Python 3" menjadi "AZD for Beginners" agar lebih jelas

#### Ditambahkan
- **🔧 Fitur Baru Dev Container**:
  - `azure-cli` dengan dukungan Bicep diaktifkan
  - `node:20` (versi LTS untuk template AZD)
  - `github-cli` untuk manajemen template
  - `docker-in-docker` untuk penyebaran aplikasi container

- **🔌 Pengalihan Port**: Port pra-konfigurasi untuk pengembangan umum:
  - 8000 (pratayang MkDocs)
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

- **⚙️ Pengaturan VS Code**: Menambahkan pengaturan default untuk interpreter Python, format saat simpan, dan pemangkasan whitespace

- **📦 Memperbarui requirements-dev.txt**:
  - Menambahkan plugin minify MkDocs
  - Menambahkan pre-commit untuk kualitas kode
  - Menambahkan paket Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Setelah Buat**: Sekarang memverifikasi instalasi AZD dan Azure CLI saat kontainer mulai

---

### [v3.11.0] - 2026-02-05

#### Perombakan README untuk Pemula
**Versi ini secara signifikan memperbaiki README.md agar lebih mudah diakses bagi pemula dan menambahkan sumber daya penting bagi pengembang AI.**

#### Ditambahkan
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas kapan menggunakan masing-masing alat dengan contoh praktis
- **🌟 Tautan AZD yang Luar Biasa**: Tautan langsung ke galeri template komunitas dan sumber kontribusi:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ template siap deploy
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Kontribusi komunitas
- **🎯 Panduan Mulai Cepat**: Bagian tiga langkah sederhana (Install → Login → Deploy)
- **📊 Tabel Navigasi Berdasarkan Pengalaman**: Panduan jelas di mana memulai berdasarkan pengalaman pengembang

#### Diubah
- **Struktur README**: Disusun ulang untuk pengungkapan progresif - informasi utama pertama
- **Bagian Pendahuluan**: Ditulis ulang untuk menjelaskan "Keajaiban `azd up`" bagi pemula total
- **Menghapus Konten Duplikat**: Menghilangkan bagian troubleshooting yang duplikat
- **Perintah Troubleshooting**: Memperbaiki referensi `azd logs` untuk menggunakan `azd monitor --logs` yang valid

#### Diperbaiki
- **🔐 Perintah Otentikasi**: Menambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Referensi Perintah Tidak Valid**: Menghapus sisa `azd logs` dari bagian troubleshooting README

#### Catatan
- **Cakupan**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Audiens Sasaran**: Perbaikan khusus untuk pengembang baru menggunakan AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Akurasi Perintah Azure Developer CLI
**Versi ini memperbaiki perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD Tidak Ada Dihapus**: Audit komprehensif dan perbaikan perintah tidak valid:
  - `azd logs` (tidak ada) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - subperintah `azd service` (tidak ada) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau diganti dengan alternatif valid
  - flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak ada) → dihapus
  - flag `azd provision --what-if/--rollback` (tidak ada) → diperbarui menggunakan `--preview`
  - `azd config validate` (tidak ada) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus

- **📚 Berkas Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Perombakan besar referensi perintah
  - `docs/deployment/deployment-guide.md`: Memperbaiki strategi rollback dan penyebaran
  - `docs/troubleshooting/debugging.md`: Mengoreksi bagian analisis log
  - `docs/troubleshooting/common-issues.md`: Memperbarui perintah troubleshooting
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Memperbaiki perintah monitoring  
  - `docs/getting-started/first-project.md`: Memperbarui contoh monitoring dan debugging  
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi  
  - `docs/pre-deployment/application-insights.md`: Memperbaiki perintah melihat log  
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki perintah debugging agen  

- **📝 Referensi Versi Diperbarui**:  
  - `docs/getting-started/installation.md`: Mengubah versi `1.5.0` yang dikodekan keras menjadi versi generik `1.x.x` dengan tautan ke rilis  

#### Diubah  
- **Strategi Rollback**: Memperbarui dokumentasi untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback bawaan)  
- **Melihat Log**: Mengganti referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI  
- **Bagian Performa**: Menghapus bendera deployment paralel/incremental yang tidak ada, menyediakan alternatif yang valid  

#### Detail Teknis  
- **Perintah AZD yang Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`  
- **Flag azd monitor yang Valid**: `--live`, `--logs`, `--overview`  
- **Fitur yang Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`  

#### Catatan  
- **Verifikasi**: Perintah telah divalidasi terhadap Azure Developer CLI v1.23.x  

---

### [v3.9.0] - 2026-02-05  

#### Penyelesaian Workshop dan Pembaruan Kualitas Dokumentasi  
**Versi ini menyelesaikan modul workshop interaktif, memperbaiki semua tautan dokumentasi rusak, dan meningkatkan kualitas konten keseluruhan untuk pengembang AI yang menggunakan Microsoft AZD.**  

#### Ditambahkan  
- **📝 CONTRIBUTING.md**: Dokumen panduan kontribusi baru dengan:  
  - Instruksi jelas untuk melaporkan masalah dan mengusulkan perubahan  
  - Standar dokumentasi untuk konten baru  
  - Panduan contoh kode dan konvensi pesan commit  
  - Informasi keterlibatan komunitas  

#### Selesai  
- **🎯 Modul Workshop 7 (Penutupan)**: Modul penutupan lengkap dengan:  
  - Ringkasan menyeluruh pencapaian workshop  
  - Bagian konsep kunci yang dikuasai meliputi AZD, template, dan Microsoft Foundry  
  - Rekomendasi kelanjutan perjalanan pembelajaran  
  - Latihan tantangan workshop dengan tingkat kesulitan  
  - Umpan balik komunitas dan tautan dukungan  

- **📚 Modul Workshop 3 (Membongkar)**: Memperbarui tujuan pembelajaran dengan:  
  - Panduan aktivasi GitHub Copilot dengan server MCP  
  - Pemahaman struktur folder template AZD  
  - Pola organisasi infrastructure-as-code (Bicep)  
  - Instruksi lab praktik  

- **🔧 Modul Workshop 6 (Pembongkaran)**: Selesai dengan:  
  - Tujuan pembersihan sumber daya dan pengelolaan biaya  
  - Penggunaan `azd down` untuk deprovisi infrastruktur yang aman  
  - Panduan pemulihan layanan kognitif yang terhapus lembut  
  - Tambahan eksplorasi GitHub Copilot dan Azure Portal  

#### Diperbaiki  
- **🔗 Perbaikan Tautan Rusak**: Memperbaiki 15+ tautan internal dokumentasi yang rusak:  
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki jalur ke microsoft-foundry-integration.md  
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki jalur ai-model-deployment.md dan production-ai-practices.md  
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md  
  - `examples/retail-scenario.md`: Memperbaiki jalur FAQ dan panduan pemecahan masalah  
  - `examples/container-app/microservices/README.md`: Memperbaiki jalur beranda kursus dan panduan deployment  
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI  
  - `course-outline.md`: Memperbaiki panduan instruktur dan referensi lab workshop AI  

- **📅 Banner Status Workshop**: Memperbarui dari "Under Construction" ke status aktif workshop dengan tanggal Februari 2026  

- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi rusak di README.md workshop yang menunjuk ke folder lab-1-azd-basics yang tidak ada  

#### Diubah  
- **Presentasi Workshop**: Menghapus peringatan "under construction", workshop kini lengkap dan siap digunakan  
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar modul yang tepat  
- **Referensi Jalur Pembelajaran**: Memperbarui referensi silang bab untuk menggunakan jalur microsoft-foundry yang benar  

#### Diverifikasi  
- ✅ Semua berkas markdown bahasa Inggris memiliki tautan internal yang valid  
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran  
- ✅ Navigasi antar bab dan modul berfungsi dengan benar  
- ✅ Konten sesuai untuk pengembang AI yang menggunakan Microsoft AZD  
- ✅ Bahasa dan struktur ramah pemula terpelihara sepanjang waktu  
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk kontributor komunitas  

#### Implementasi Teknis  
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md  
- **Audit Konten**: Tinjauan manual kelengkapan dan kesesuaian untuk pemula  
- **Sistem Navigasi**: Pola navigasi bab dan modul yang konsisten diterapkan  

#### Catatan  
- **Lingkup**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggris  
- **Terjemahan**: Folder terjemahan tidak diperbarui dalam versi ini (terjemahan otomatis akan disinkronkan kemudian)  
- **Durasi Workshop**: Workshop lengkap kini menyediakan 3-4 jam pembelajaran praktik  

---

### [v3.8.0] - 2025-11-19  

#### Dokumentasi Lanjutan: Monitoring, Keamanan, dan Pola Multi-Agen  
**Versi ini menambahkan pelajaran lengkap nilai A tentang integrasi Application Insights, pola autentikasi, dan koordinasi multi-agen untuk deployment produksi.**  

#### Ditambahkan  
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:  
  - Deployment berfokus AZD dengan provisioning otomatis  
  - Template Bicep lengkap untuk Application Insights + Log Analytics  
  - Aplikasi Python bekerja dengan telemetri kustom (1.200+ baris)  
  - Pola monitoring AI/LLM (pelacakan token/biaya Model Microsoft Foundry)  
  - 6 diagram Mermaid (arsitektur, tracing terdistribusi, aliran telemetri)  
  - 3 latihan praktik (peringatan, dashboard, monitoring AI)  
  - Contoh query Kusto dan strategi optimasi biaya  
  - Streaming metrik langsung dan debugging real-time  
  - Waktu pembelajaran 40-50 menit dengan pola siap-produksi  

- **🔐 Pelajaran Pola Autentikasi & Keamanan**: di `docs/getting-started/authsecurity.md`:  
  - 3 pola autentikasi (connection strings, Key Vault, managed identity)  
  - Template infrastruktur Bicep lengkap untuk deployment aman  
  - Kode aplikasi Node.js dengan integrasi Azure SDK  
  - 3 latihan lengkap (aktifkan managed identity, user-assigned identity, rotasi Key Vault)  
  - Praktik terbaik keamanan dan konfigurasi RBAC  
  - Panduan pemecahan masalah dan analisis biaya  
  - Pola autentikasi tanpa kata sandi siap-produksi  

- **🤖 Pelajaran Pola Koordinasi Multi-Agen**: di `docs/pre-deployment/coordination-patterns.md`:  
  - 5 pola koordinasi (berurutan, paralel, hierarkis, event-driven, konsensus)  
  - Implementasi layanan orchestrator lengkap (Python/Flask, 1.500+ baris)  
  - 3 implementasi agen khusus (Peneliti, Penulis, Editor)  
  - Integrasi Service Bus untuk antrean pesan  
  - Manajemen status Cosmos DB untuk sistem terdistribusi  
  - 6 diagram Mermaid menunjukkan interaksi agen  
  - 3 latihan lanjutan (penanganan timeout, logika retry, circuit breaker)  
  - Rincian biaya ($240-565/bulan) dengan strategi optimasi  
  - Integrasi Application Insights untuk monitoring  

#### Ditingkatkan  
- **Bab Pra-Deployment**: Kini mencakup pola monitoring dan koordinasi komprehensif  
- **Bab Memulai**: Ditingkatkan dengan pola autentikasi profesional  
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan sampai observabilitas  
- **Garis Besar Kursus**: Diperbarui untuk merujuk pelajaran baru di Bab 3 dan 6  

#### Diubah  
- **Progres Pembelajaran**: Integrasi keamanan dan monitoring yang lebih baik sepanjang kursus  
- **Kualitas Dokumentasi**: Standar nilai A yang konsisten (95-97%) di pelajaran baru  
- **Pola Produksi**: Cakupan lengkap ujung-ke-ujung untuk deployment perusahaan  

#### Diperbaiki  
- **Pengalaman Pengembang**: Jalur jelas dari pengembangan ke monitoring produksi  
- **Standar Keamanan**: Pola profesional untuk autentikasi dan manajemen rahasia  
- **Observabilitas**: Integrasi Application Insights lengkap dengan AZD  
- **Beban Kerja AI**: Monitoring khusus untuk Model Microsoft Foundry dan sistem multi-agen  

#### Diverifikasi  
- ✅ Semua pelajaran menyertakan kode lengkap yang berfungsi (bukan potongan)  
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total dalam 3 pelajaran)  
- ✅ Latihan praktik dengan langkah verifikasi (9 total)  
- ✅ Template Bicep siap produksi dapat dideploy via `azd up`  
- ✅ Analisis biaya dan strategi optimasi  
- ✅ Panduan pemecahan masalah dan praktik terbaik  
- ✅ Titik pemeriksaan pengetahuan dengan perintah verifikasi  

#### Hasil Penilaian Dokumentasi  
- **docs/pre-deployment/application-insights.md**: - Panduan monitoring komprehensif  
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional  
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agen tingkat lanjut  
- **Konten Baru Keseluruhan**: - Standar kualitas tinggi yang konsisten  

#### Implementasi Teknis  
- **Application Insights**: Log Analytics + telemetri kustom + tracing terdistribusi  
- **Autentikasi**: Managed Identity + Key Vault + pola RBAC  
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi  
- **Monitoring**: Metrik langsung + query Kusto + peringatan + dashboard  
- **Manajemen Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran  

### [v3.7.0] - 2025-11-19  

#### Peningkatan Kualitas Dokumentasi dan Contoh Microsoft Foundry Models Baru  
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh deployment lengkap Microsoft Foundry Models dengan antarmuka chat gpt-4.1.**  

#### Ditambahkan  
- **🤖 Contoh Chat Microsoft Foundry Models**: Deployment gpt-4.1 lengkap dengan implementasi bekerja di `examples/azure-openai-chat/`:  
  - Infrastruktur Microsoft Foundry Models lengkap (deployment model gpt-4.1)  
  - Antarmuka chat baris perintah Python dengan riwayat percakapan  
  - Integrasi Key Vault untuk penyimpanan kunci API yang aman  
  - Pelacakan penggunaan token dan estimasi biaya  
  - Pembatasan kecepatan dan penanganan kesalahan  
  - README komprehensif dengan panduan deployment 35-45 menit  
  - 11 berkas siap produksi (template Bicep, aplikasi Python, konfigurasi)  
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik pada panduan konfigurasi:  
  - Latihan 1: Konfigurasi multi-lingkungan (15 menit)  
  - Latihan 2: Praktik manajemen rahasia (10 menit)  
  - Kriteria keberhasilan jelas dan langkah verifikasi  
- **✅ Verifikasi Deployment**: Menambahkan bagian verifikasi pada panduan deployment:  
  - Prosedur pemeriksaan kesehatan  
  - Daftar periksa kriteria keberhasilan  
  - Output yang diharapkan untuk semua perintah deployment  
  - Referensi cepat pemecahan masalah  

#### Ditingkatkan  
- **examples/README.md**: Diperbarui ke kualitas nilai A (93%):  
  - Ditambahkan azure-openai-chat ke semua bagian terkait  
  - Mengubah jumlah contoh lokal dari 3 menjadi 4  
  - Ditambahkan ke tabel Contoh Aplikasi AI  
  - Terintegrasi ke Quick Start untuk Pengguna Menengah  
  - Ditambahkan ke bagian Template Microsoft Foundry  
  - Memperbarui Matriks Perbandingan dan bagian pencarian teknologi  
- **Kualitas Dokumentasi**: Meningkat dari B+ (87%) → A- (92%) di folder docs:  
  - Ditambahkan output yang diharapkan pada contoh perintah penting  
  - Termasuk langkah verifikasi untuk perubahan konfigurasi  
  - Meningkatkan pembelajaran praktik dengan latihan yang aplikatif  

#### Diubah  
- **Progres Pembelajaran**: Integrasi lebih baik contoh AI untuk pembelajar menengah  
- **Struktur Dokumentasi**: Latihan lebih aplikatif dengan hasil yang jelas  
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja kunci  

#### Diperbaiki  
- **Pengalaman Pengembang**: Deployment Microsoft Foundry Models sekarang memakan waktu 35-45 menit (vs 60-90 untuk alternatif kompleks)  
- **Transparansi Biaya**: Estimasi biaya jelas ($50-200/bulan) untuk contoh Microsoft Foundry Models  
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk jelas dengan azure-openai-chat  
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi konsisten  

#### Diverifikasi  
- ✅ Contoh Microsoft Foundry Models berfungsi penuh dengan `azd up`  
- ✅ Semua 11 berkas implementasi sintaksis benar  
- ✅ Instruksi README sesuai dengan pengalaman deployment sebenarnya  
- ✅ Tautan dokumentasi diperbarui di 8+ lokasi  
- ✅ Indeks contoh akurat mencerminkan 4 contoh lokal  
- ✅ Tidak ada tautan eksternal duplikat di tabel  
- ✅ Semua referensi navigasi benar  

#### Implementasi Teknis  
- **Arsitektur Microsoft Foundry Models**: gpt-4.1 + Key Vault + pola Container Apps  
- **Keamanan**: Managed Identity siap, rahasia di Key Vault  
- **Monitoring**: Integrasi Application Insights  
- **Manajemen Biaya**: Pelacakan token dan optimasi penggunaan  
- **Deployment**: Satu perintah `azd up` untuk setup lengkap  

### [v3.6.0] - 2025-11-19  

#### Pembaruan Besar: Contoh Deployment Container App  
**Versi ini memperkenalkan contoh lengkap deployment aplikasi container siap produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi lengkap dan integrasi ke jalur pembelajaran.**  

#### Ditambahkan  
- **🚀 Contoh Container App**: Contoh lokal baru di `examples/container-app/`:  
  - [Panduan Utama](examples/container-app/README.md): Ikhtisar lengkap tentang penyebaran container, start cepat, produksi, dan pola lanjutan
  - [API Flask Sederhana](../../examples/container-app/simple-flask-api): REST API ramah pemula dengan scale-to-zero, health probes, pemantauan, dan pemecahan masalah
  - [Arsitektur Microservices](../../examples/container-app/microservices): Penyebaran multi-layanan siap produksi (API Gateway, Produk, Pesanan, Pengguna, Notifikasi), messaging async, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Praktik Terbaik**: Keamanan, pemantauan, optimisasi biaya, dan panduan CI/CD untuk workload container
- **Contoh Kode**: Lengkap `azure.yaml`, template Bicep, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario pengujian ujung-ke-ujung, perintah pemantauan, panduan pemecahan masalah

#### Perubahan
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh aplikasi container baru di bawah "Contoh Lokal - Aplikasi Container"
- **examples/README.md**: Diperbarui untuk menyoroti contoh aplikasi container, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Outline Kursus & Panduan Studi**: Diperbarui untuk merujuk contoh aplikasi container baru dan pola penyebaran dalam bab terkait

#### Diverifikasi
- ✅ Semua contoh baru dapat disebarkan dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Ruang Lingkup**: Dokumentasi dan contoh bahasa Inggris saja
- **Langkah Berikutnya**: Perluas dengan pola container lanjutan tambahan dan otomatisasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Perubahan Merek Produk: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk secara menyeluruh dari "Microsoft Foundry" menjadi "Microsoft Foundry" di seluruh dokumentasi bahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Perubahan
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" menjadi "Microsoft Foundry"
  - Memperbarui semua referensi di seluruh dokumentasi bahasa Inggris di folder `docs/`
  - Mengganti nama folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Mengganti nama file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referensi konten diperbarui di 7 file dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` diubah menjadi `docs/microsoft-foundry/`
  - Semua tautan silang diperbarui sesuai struktur folder baru
  - Tautan navigasi diverifikasi di seluruh dokumentasi

- **📄 Penggantian Nama File**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua tautan internal diperbarui sesuai nama file baru

#### File yang Diperbarui
- **Dokumentasi Bab** (7 file):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 pembaruan tautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 pembaruan referensi nama produk
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari pembaruan sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referensi diperbarui (ikhtisar, umpan balik komunitas, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 tautan silang diperbarui
  - `docs/getting-started/first-project.md` - 2 tautan navigasi bab diperbarui
  - `docs/getting-started/installation.md` - 2 tautan bab berikutnya diperbarui
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referensi diperbarui (navigasi, komunitas Discord)
  - `docs/troubleshooting/common-issues.md` - 1 tautan navigasi diperbarui
  - `docs/troubleshooting/debugging.md` - 1 tautan navigasi diperbarui

- **File Struktur Kursus** (2 file):
  - `README.md` - 17 referensi diperbarui (ikhtisar kursus, judul bab, bagian template, wawasan komunitas)
  - `course-outline.md` - 14 referensi diperbarui (ikhtisar, tujuan pembelajaran, sumber daya bab)

#### Diverifikasi
- ✅ Tidak ada lagi referensi jalur folder "ai-foundry" dalam dokumen bahasa Inggris
- ✅ Tidak ada lagi referensi nama produk "Microsoft Foundry" dalam dokumen bahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama file dan folder selesai dengan sukses
- ✅ Tautan silang antar bab diverifikasi

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggris di folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui di versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui di versi ini
- **Contoh**: File contoh mungkin masih merujuk pada penamaan lama (akan diperbaiki di pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repositori GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Verifikasi semua tautan internal dokumentasi masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau dan Validasi Infrastruktur
**Versi ini memperkenalkan dukungan menyeluruh untuk fitur pratinjau Azure Developer CLI baru dan meningkatkan pengalaman pengguna workshop.**

#### Penambahan
- **🧪 Dokumentasi Fitur azd provision --preview**: Cakupan lengkap kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi rinci dalam panduan penyediaan dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan pre-flight untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keselamatan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradasi dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Timestamp pembaruan terakhir untuk transparansi
  - Desain responsif untuk semua jenis perangkat

#### Peningkatan
- **Keamanan Infrastruktur**: Fungsi pratinjau terintegrasi dalam seluruh dokumentasi penyebaran
- **Validasi Pra-penyebaran**: Skrip otomatis kini mencakup pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk memasukkan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Ekspektasi yang jelas disampaikan kepada pengguna mengenai status pengembangan konten

#### Perubahan
- **Praktik Terbaik Penyebaran**: Alur kerja pratinjau dahulu kini direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan timeline pengembangan yang jelas

#### Peningkatan
- **Pendekatan Utamakan Keselamatan**: Perubahan infrastruktur kini dapat divalidasi sebelum penyebaran
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk tinjauan dan persetujuan
- **Kesadaran Biaya**: Pemahaman lebih baik tentang biaya sumber daya sebelum penyediaan
- **Mitigasi Risiko**: Mengurangi kegagalan penyebaran melalui validasi awal

#### Implementasi Teknis
- **Integrasi Multi-dokumen**: Fitur pratinjau didokumentasikan di 4 file utama
- **Pola Perintah**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau termasuk dalam alur kerja dan skrip validasi
- **Indikator Visual**: Tanda fitur BARU yang jelas untuk kemudahan penemuan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Presentasi Profesional**: Menjaga kredibilitas repositori sekaligus menetapkan ekspektasi
- **Transparansi Timeline**: Timestamp pembaruan terakhir Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Peningkatan Materi Workshop dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop lengkap dengan panduan interaktif berbasis browser dan jalur pembelajaran terstruktur.**

#### Penambahan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran 7 langkah dari penemuan hingga kustomisasi
  - 0-Pengenalan: Ikhtisar workshop dan pengaturan
  - 1-Pilih-Template-AI: Proses penemuan dan pemilihan template
  - 2-Validasi-Template-AI: Prosedur penyebaran dan validasi
  - 3-Deconstruct-Template-AI: Memahami arsitektur template
  - 4-Konfigurasi-Template-AI: Konfigurasi dan kustomisasi
  - 5-Kustomisasi-Template-AI: Modifikasi lanjutan dan iterasi
  - 6-Pembongkaran-Infrastruktur: Pembersihan dan manajemen sumber daya
  - 7-Penutupan: Ringkasan dan langkah berikutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman belajar yang ditingkatkan
- **🎯 Jalur Pembelajaran Praktis**: Metodologi 3 langkah (Penemuan → Penyebaran → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Penyiapan lingkungan pengembangan tanpa batas

#### Peningkatan
- **Lab Workshop AI**: Diperluas dengan pengalaman pembelajaran terstruktur selama 2-3 jam
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah dari pemilihan template hingga penyebaran produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang lancar

#### Peningkatan
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan toggle tema
- **Pembelajaran Mandiri**: Struktur workshop fleksibel yang mengakomodasi kecepatan belajar berbeda
- **Aplikasi Praktis**: Skenario penyebaran template AI di dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan cepat kata kunci dan pelajaran
- **Salin Blok Kode**: Fungsi hover-to-copy untuk semua contoh kode
- **Toggle Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Screenshot dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Besar dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Penambahan
- **📚 Sistem Pembelajaran Berbasis Bab**: Merestrukturisasi seluruh kursus menjadi 8 bab pembelajaran progresif
  - Bab 1: Dasar & Mulai Cepat (⭐ - 30-45 menit)
  - Bab 2: Pengembangan AI-Pertama (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Otentikasi (⭐⭐ - 45-60 menit)
  - Bab 4: Infrastruktur sebagai Kode & Penyebaran (⭐⭐⭐ - 1-1,5 jam)
  - Bab 5: Solusi AI Multi-Agen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Validasi & Perencanaan Pra-Penyebaran (⭐⭐ - 1 jam)
  - Bab 7: Pemecahan Masalah & Debugging (⭐⭐ - 1-1,5 jam)
  - Bab 8: Pola Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi konsisten di seluruh dokumentasi
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk jelas untuk tingkat pengalaman dan tujuan berbeda
- **🔗 Navigasi Tautan Silang**: Bab terkait dan prasyarat ditautkan dengan jelas

#### Peningkatan
- **Struktur README**: Bertransformasi menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini mencakup konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan studi terhubung ke bab relevan
- **Integrasi Workshop**: Lab praktik dipetakan ke berbagai tujuan pembelajaran bab

#### Perubahan
- **Progres Pembelajaran**: Beralih dari dokumentasi linier ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk alur pembelajaran lebih baik
- **Integrasi Konten AI**: Integrasi konten AI khusus lebih baik sepanjang perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan digabungkan di Bab 8 untuk pelajar perusahaan

#### Peningkatan
- **Pengalaman Pengguna**: Breadcrumb navigasi yang jelas dan indikator progresi bab
- **Aksesibilitas**: Pola navigasi konsisten untuk memudahkan penelusuran kursus
- **Presentasi Profesional**: Struktur kursus gaya universitas cocok untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu pencarian konten relevan dikurangi melalui organisasi yang ditingkatkan

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab distandarisasi di lebih dari 40 file dokumentasi
- **Footer Navigasi**: Panduan progresi konsisten dan indikator penyelesaian bab
- **Tautan Silang**: Sistem tautan internal komprehensif yang menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh terasosiasi jelas dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi direstrukturisasi sesuai sistem 8 bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal pembelajaran mingguan dengan hasil terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas langsung dengan skenario penyebaran nyata dan pemecahan masalah
- **📊 Progres Keterampilan**: Kemajuan jelas dari konsep dasar ke pola perusahaan dengan fokus pengembangan karir
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Timeline**: Rencana pembelajaran terstruktur 10 minggu dengan validasi milestone

### [v3.1.0] - 2025-09-17

#### Peningkatan Solusi AI Multi-Agen
**Versi ini meningkatkan solusi ritel multi-agen dengan penamaan agen yang lebih baik dan dokumentasi yang diperbarui.**

#### Perubahan
- **Terminologi Multi-Agen**: Mengganti "agen Cora" dengan "agen Pelanggan" di seluruh solusi multi-agen ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode agar menggunakan penamaan "agen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi agen Pelanggan
- **Diagram Arsitektur**: Memperbarui diagram Mermaid dengan penamaan agen yang baru
- **Contoh Kode**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip deployment untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyesuaian lebih baik dengan konvensi penamaan enterprise
- **Materi Pembelajaran**: Penamaan agen lebih intuitif untuk tujuan edukasi
- **Kegunaan Template**: Mempermudah pemahaman fungsi agen dan pola deployment

#### Detail Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM untuk menggunakan tipe agen "customer"
- Memperbarui variabel lingkungan dari CORA_AGENT_* menjadi pola CUSTOMER_AGENT_*
- Memperbaharui semua perintah deployment dan konfigurasi container

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus pada Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber belajar lengkap berfokus pada AI dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran AI-Pertama**: Restrukturisasi lengkap yang memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi lengkap untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **Pola Deployment Model AI**: Panduan terperinci mencakup pemilihan model, konfigurasi, dan strategi deployment produksi
- **Lab Workshop AI**: Workshop praktik 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat dideploy dengan AZD
- **Praktik Terbaik AI Produksi**: Pola siap enterprise untuk skala, monitoring, dan keamanan beban kerja AI
- **Panduan Pemecahan Masalah AI**: Pemecahan masalah lengkap untuk Model Microsoft Foundry, Cognitive Services, dan isu deployment AI
- **Galeri Template AI**: Koleksi unggulan template Microsoft Foundry dengan rating kompleksitas
- **Materi Workshop**: Struktur workshop lengkap dengan lab praktik dan materi referensi

#### Ditingkatkan
- **Struktur README**: Fokus pada pengembang AI dengan data minat komunitas 45% dari Discord Microsoft Foundry
- **Jalur Pembelajaran**: Perjalanan pengembang AI khusus berdampingan dengan jalur tradisional untuk pelajar dan insinyur DevOps
- **Rekomendasi Template**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komunitas**: Dukungan komunitas Discord yang diperkuat dengan saluran dan diskusi khusus AI

#### Fokus Keamanan & Produksi
- **Pola Managed Identity**: Konfigurasi otentikasi dan keamanan khusus AI
- **Optimisasi Biaya**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Deployment Multi-Region**: Strategi deployment aplikasi AI global
- **Monitoring Kinerja**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Struktur Kursus Linear**: Progres logis dari pola deployment AI pemula hingga tingkat lanjut
- **URL Terverifikasi**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Referensi Lengkap**: Semua tautan dokumentasi internal diverifikasi dan berfungsi
- **Siap Produksi**: Pola deployment enterprise dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Penyempurnaan Profesional
**Versi ini merupakan overhaul signifikan struktur repositori dan penyajian konten.**

#### Ditambahkan
- **Kerangka Pembelajaran Terstruktur**: Semua halaman dokumentasi kini mencakup bagian Pendahuluan, Tujuan Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Menambahkan tautan pelajaran Sebelumnya/Berikutnya di seluruh dokumentasi untuk panduan belajar progresif
- **Panduan Studi**: study-guide.md komprehensif dengan tujuan belajar, latihan praktik, dan materi penilaian
- **Penyajian Profesional**: Menghapus semua ikon emoji untuk aksesibilitas lebih baik dan tampilan profesional
- **Struktur Konten Ditingkatkan**: Organisasi dan alur materi pembelajaran diperbaiki

#### Diubah
- **Format Dokumentasi**: Menstandarkan semua dokumentasi dengan struktur fokus belajar yang konsisten
- **Alur Navigasi**: Menerapkan progresi logis dalam semua materi pembelajaran
- **Penyajian Konten**: Menghapus elemen dekoratif demi pemformatan yang jelas dan profesional
- **Struktur Tautan**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Diperbaiki
- **Aksesibilitas**: Menghapus ketergantungan emoji untuk kompatibilitas pembaca layar lebih baik
- **Tampilan Profesional**: Penyajian gaya akademik bersih cocok untuk pembelajaran enterprise
- **Pengalaman Belajar**: Pendekatan terstruktur dengan tujuan dan hasil yang jelas untuk setiap pelajaran
- **Organisasi Konten**: Alur logis dan keterkaitan topik diperbaiki

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan memulai lengkap
  - Dokumentasi penyebaran dan penyediaan lengkap
  - Sumber daya pemecahan masalah dan panduan debugging terperinci
  - Alat dan prosedur validasi pra-deployment

- **Modul Memulai**
  - AZD Basics: Konsep inti dan terminologi
  - Panduan Instalasi: Instruksi setup spesifik platform
  - Panduan Konfigurasi: Setup lingkungan dan otentikasi
  - Tutorial Proyek Pertama: Pembelajaran langsung langkah demi langkah

- **Modul Penyebaran dan Penyediaan**
  - Panduan Penyebaran: Dokumentasi alur kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kode dengan Bicep
  - Praktik terbaik untuk penyebaran produksi
  - Pola arsitektur multi-layanan

- **Modul Validasi Pra-deployment**
  - Perencanaan Kapasitas: Validasi ketersediaan sumber daya Azure
  - Pemilihan SKU: Panduan tingkat layanan yang lengkap
  - Pemeriksaan Pre-flight: Skrip validasi otomatis (PowerShell dan Bash)
  - Estimasi biaya dan alat perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Masalah Umum: Masalah dan solusi yang sering ditemui
  - Panduan Debugging: Metodologi pemecahan masalah sistematis
  - Teknik dan alat diagnostik lanjutan
  - Monitoring kinerja dan optimisasi

- **Sumber Daya dan Referensi**
  - Cheat Sheet Perintah: Referensi cepat untuk perintah penting
  - Glosarium: Definisi terminologi dan akronim lengkap
  - FAQ: Jawaban terperinci untuk pertanyaan umum
  - Tautan sumber eksternal dan koneksi komunitas

- **Contoh dan Template**
  - Contoh Aplikasi Web Sederhana
  - Template penyebaran Situs Statik
  - Konfigurasi Aplikasi Container
  - Pola integrasi Basis Data
  - Contoh arsitektur Microservices
  - Implementasi fungsi Serverless

#### Fitur
- **Dukungan Multi-Platform**: Panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Berbagai Level Keahlian**: Konten dirancang untuk pelajar hingga pengembang profesional
- **Fokus Praktis**: Contoh langsung dan skenario dunia nyata
- **Cakupan Komprehensif**: Dari konsep dasar hingga pola enterprise tingkat lanjut
- **Pendekatan Keamanan-Pertama**: Praktik keamanan terbaik terintegrasi di seluruh materi
- **Optimisasi Biaya**: Panduan untuk penyebaran hemat biaya dan manajemen sumber daya

#### Kualitas Dokumentasi
- **Contoh Kode Terperinci**: Sampel kode praktis yang telah diuji
- **Instruksi Langkah-demi-Langkah**: Panduan yang jelas dan dapat ditindaklanjuti
- **Penanganan Error Komprehensif**: Pemecahan masalah untuk isu umum
- **Integrasi Praktik Terbaik**: Standar industri dan rekomendasi
- **Kompatibilitas Versi**: Terupdate dengan layanan Azure dan fitur azd terbaru

## Rencana Peningkatan Mendatang

### Versi 3.1.0 (Direncanakan)
#### Perluasan Platform AI
- **Dukungan Multi-Model**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **Kerangka Agen AI**: Template untuk deployment LangChain, Semantic Kernel, dan AutoGen
- **Pola RAG Lanjutan**: Opsi basis data vektor selain Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabilitas AI**: Monitoring lanjutan untuk performa model, penggunaan token, dan kualitas respons

#### Pengalaman Pengembang
- **Ekstensi VS Code**: Pengalaman pengembangan AZD + Microsoft Foundry terintegrasi
- **Integrasi GitHub Copilot**: Pembuatan template AZD bantuan AI
- **Tutorial Interaktif**: Latihan coding langsung dengan validasi otomatis untuk skenario AI
- **Konten Video**: Tutorial video tambahan untuk pembelajar visual fokus pada deployment AI

### Versi 4.0.0 (Direncanakan)
#### Pola AI Enterprise
- **Kerangka Tata Kelola**: Tata kelola model AI, kepatuhan, dan jejak audit
- **AI Multi-Tenant**: Pola untuk melayani banyak pelanggan dengan layanan AI terisolasi
- **Deployment AI Edge**: Integrasi dengan Azure IoT Edge dan instance container
- **AI Hybrid Cloud**: Pola deployment multi-cloud dan hybrid untuk beban kerja AI

#### Fitur Lanjutan
- **Otomasi Pipeline AI**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Keamanan Lanjutan**: Pola zero-trust, endpoint privat, dan perlindungan ancaman canggih
- **Optimisasi Kinerja**: Penyetelan dan strategi skala lanjutan untuk aplikasi AI throughput tinggi
- **Distribusi Global**: Pola pengiriman konten dan caching edge untuk aplikasi AI

### Versi 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Penambahan yang Diusulkan - Sekarang Diimplementasikan di v3.0.0
- ✅ **Konten Berfokus AI**: Integrasi Microsoft Foundry lengkap (Selesai)
- ✅ **Tutorial Interaktif**: Lab workshop AI praktik (Selesai)
- ✅ **Modul Keamanan Lanjutan**: Pola keamanan khusus AI (Selesai)
- ✅ **Optimisasi Kinerja**: Strategi penyetelan beban kerja AI (Selesai)

### Versi 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Penyempurnaan Minor - Beberapa Selesai di Rilis Saat Ini
- ✅ **Contoh Tambahan**: Skenario deployment berfokus AI (Selesai)
- ✅ **FAQ Ekstensif**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Perluasan Monitoring**: Pola monitoring dan pemberitahuan khusus AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Dokumentasi Ramah Mobile**: Desain responsif untuk pembelajaran mobile
- **Akses Offline**: Paket dokumentasi yang dapat diunduh
- **Integrasi IDE Ditingkatkan**: Ekstensi VS Code untuk workflow AZD + AI
- **Dashboard Komunitas**: Metrik komunitas real-time dan pelacakan kontribusi

## Kontribusi pada Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, harap pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti versi semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Ditambahkan, Diubah, Tidak Lagi Digunakan, Dihapus, Diperbaiki, Keamanan
4. **Deskripsi Jelas**: Deskripsi singkat tentang apa yang berubah
5. **Penilaian Dampak**: Bagaimana perubahan mempengaruhi pengguna yang ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kapabilitas
- Contoh baru, template, atau sumber belajar
- Alat tambahan, skrip, atau utilitas

#### Diubah
- Modifikasi fungsi atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Tidak Lagi Digunakan
- Fitur atau pendekatan yang sedang dihentikan
- Bagian dokumentasi yang dijadwalkan dihapus
- Metode yang memiliki alternatif lebih baik

#### Dihapus
- Fitur, dokumentasi, atau contoh yang sudah tidak relevan
- Informasi usang atau pendekatan yang sudah dihentikan
- Konten yang redundan atau digabungkan

#### Diperbaiki
- Koreksi kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah yang dilaporkan
- Peningkatan akurasi atau fungsi

#### Keamanan
- Perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Panduan Versi Semantik

#### Versi Mayor (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Restrukturisasi signifikan konten atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi fundamental

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Penyempurnaan yang mempertahankan kompatibilitas ke belakang
- Contoh, alat, atau sumber daya tambahan

#### Versi Patch (X.Y.Z)
- Perbaikan bug dan koreksi
- Penyempurnaan minor pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Masukan dan Saran Komunitas

Kami sangat mendorong masukan komunitas untuk meningkatkan sumber belajar ini:

### Cara Memberikan Masukan
- **GitHub Issues**: Laporkan masalah atau sarankan perbaikan (isu khusus AI dipersilakan)
- **Diskusi Discord**: Bagikan ide dan berinteraksi dengan komunitas Microsoft Foundry
- **Pull Requests**: Kontribusi perbaikan langsung ke konten, khususnya template dan panduan AI
- **Discord Microsoft Foundry**: Berpartisipasi di channel #Azure untuk diskusi AZD + AI
- **Forum Komunitas**: Berpartisipasi dalam diskusi pengembang Azure yang lebih luas

### Kategori Masukan
- **Akurasi Konten AI**: Koreksi integrasi layanan AI dan informasi deployment
- **Pengalaman Belajar**: Saran alur pembelajaran pengembang AI yang lebih baik
- **Konten AI yang Hilang**: Permintaan untuk tambahan template, pola, atau contoh AI
- **Aksesibilitas**: Peningkatan untuk kebutuhan belajar yang beragam
- **Integrasi Alat AI**: Saran integrasi workflow pengembangan AI yang lebih baik
- **Pola AI Produksi**: Permintaan pola deployment AI enterprise

### Komitmen Respon
- **Respon Isu**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Fitur**: Evaluasi dalam satu minggu
- **Kontribusi Komunitas**: Review dalam satu minggu
- **Isu Keamanan**: Prioritas segera dengan respon cepat

## Jadwal Pemeliharaan

### Pembaruan Berkala
- **Review Bulanan**: Akurasi konten dan validasi tautan
- **Pembaruan Kuartalan**: Penambahan dan peningkatan konten utama
- **Review Setengah Tahunan**: Restrukturisasi dan peningkatan komprehensif
- **Rilis Tahunan**: Pembaruan versi mayor dengan peningkatan signifikan

### Pemantauan dan Penjaminan Kualitas
- **Pengujian Otomatis**: Validasi rutin contoh kode dan tautan
- **Integrasi Masukan Komunitas**: Penerapan rutin saran pengguna
- **Pembaruan Teknologi**: Penyesuaian dengan layanan Azure terbaru dan rilis azd
- **Audit Aksesibilitas**: Tinjauan rutin untuk prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Versi Mayor Terbaru**: Dukungan penuh dengan pembaruan rutin
- **Versi Mayor Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Lama**: Dukungan komunitas saja, tidak ada pembaruan resmi

### Panduan Migrasi
Saat versi mayor dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Rincian tentang perubahan yang memutus kompatibilitas
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Berikutnya**: Kembali ke [README Utama](README.md)

**Tetap Terupdate**: Pantau repositori ini untuk pemberitahuan tentang rilis baru dan pembaruan penting bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->