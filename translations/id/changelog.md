# Catatan Perubahan - AZD Untuk Pemula

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan perbaikan penting pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versioning semantik dan mempertahankan log ini untuk membantu pengguna memahami apa yang telah berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapat informasi tentang fitur baru dan penambahan konten
- Memahami perbaikan yang dilakukan pada dokumentasi yang ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran seiring waktu

## Hasil Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau diperbaiki
- Merencanakan jalur pembelajaran berdasarkan materi terkini
- Memberikan umpan balik dan saran untuk perbaikan di masa depan

## Riwayat Versi

### [v3.25.0] - 2026-11-09

#### Ekstensi Microsoft Foundry 1.0 sekarang tersedia secara umum

Bundel `microsoft.foundry` 1.0 sudah **aktif dan tersedia secara umum**, seperti diumumkan pada [5 November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kursus ini kini mengajarkan alur kerja GA yang dirilis, bukan rilis yang akan datang. Mulailah dengan AZD **1.37.0 atau lebih baru** dan `azd ext install microsoft.foundry`.

#### Tersedia di pembaruan kursus ini
- Panduan bahasa Inggris menggunakan bundel GA sebagai jalur instalasi default dan menjelaskan tujuh ekstensi inti yang versi nya dikelola secara independen.
- [Panduan agen hosted](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) mencakup contoh API Tanggapan Framework Agen Python hulu, uv terkini, Python 3.13+, pemilihan proyek baru/yang sudah ada, penggunaan ulang model, dan tinjauan `azure.yaml`.
- Alur kerja lokal-ke-cloud mencakup pengujian Agent Inspector, biaya panggilan model berbasis Azure, pembangunan kode jarak jauh, invokasi yang dideploy, pelacakan awan, pratinjau deployment, log, dan diagnostik.
- Panduan evaluasi terpisah mencakup pembuatan dan peninjauan dataset/rubrik, konfigurasi evaluasi bernama, pendaftaran aset, dan pemeriksaan hasil. Instruksi evaluasi/optimasi lama tetap menjadi sejarah migrasi, bukan baseline rilis saat ini.
- Panduan Foundry CI/CD mencakup instalasi ekstensi runner, deployment dengan autentikasi, aset/akses evaluasi, dan gerbang kualitas eksplisit.
- Panduan pembersihan membedakan proyek Foundry yang baru dibuat dan yang digunakan ulang. Workshop menautkan ke latihan GA terpisah tanpa mengganti tes spesifik contoh.
- Navigasi kursus, tujuan pembelajaran, prasyarat setup, cheat sheet, FAQ, dan panduan belajar mencerminkan alur kerja GA. Terjemahan yang dihasilkan tidak diedit secara manual.

#### Ruang lingkup tinjauan
- Berdasarkan pengumuman GA, panduan Microsoft Learn yang ditautkan, dan konfigurasi contoh hulu. Tidak dilakukan penyediaan Azure langsung, deployment, invokasi model, atau evaluasi secara live.
- Bundel GA tidak berarti GA untuk setiap fitur opsional, ekstensi independen, atau SDK, juga tidak mengesahkan contoh untuk produksi.

### [v3.24.0]- 2026-11-04

#### Diperbaiki
- Memperbaiki navigasi kursus bahasa Inggris, jalur halaman yang dipindahkan, anchor yang hilang, dan referensi eksternal usang, termasuk tautan Bab 2 ke panduan AI produksi.
- Meninjau panduan terkini terhadap AZD 1.37.2 yang diterbitkan, agen 1.0.0-beta.23, dan evaluasi 1.0.0-beta.2. Mendokumentasikan alur `azd ai eval` terpisah dan migrasi konfigurasi optimasi.
- Memperbaiki bendera CLI yang tidak didukung, batasan autentikasi, panduan lingkungan/rahasia dalam teks biasa, pembaruan infrastruktur, konfigurasi model, dan contoh pemulihan destruktif.
- Menyegarkan workshop terhadap contoh AI Agents saat ini, termasuk hooks aktual, input konfigurasi, tes evaluasi, titik masuk red-teaming, dan observabilitas.
- Memperbaiki klaim implementasi contoh dan memperbaiki masalah terkait aplikasi/infrastruktur/konfigurasi. Materi arsitektur retail dibedakan secara eksplisit dari aplikasi kerja lengkap.
- Memulihkan matriks bahasa CodeQL, memilih Node.js 24 yang didukung untuk dev container, dan membuat validator setup melaporkan perintah versi yang gagal.

#### Ditambahkan
- Pengecek tautan/offline anchor bahasa Inggris saja, tes regresi, dan alur dokumentasi yang juga membangun workshop dalam mode ketat. Terjemahan hasil dan gambar terjemahan dikecualikan.

#### Ruang lingkup validasi
- Pemeriksaan sumber, sintaks, konfigurasi, perilaku lokal, dan tautan jaringan tidak memastikan kemampuan deploy Azure live, kuota, RBAC, ketersediaan model regional, penagihan, kepatuhan keamanan, atau kesiapan produksi.
- Entri lama di bawah ini adalah catatan sejarah, bukan instruksi perintah atau rilis saat ini.

### [v3.23.0] - 2026-07-13

#### Penyegaran AZD 1.27.1: Pembaruan Versi Terkini
**Versi ini memvalidasi ulang kursus terhadap `azd` `1.27.1` (Juli 2026, rilis stabil terbaru) dan ekstensi agen AI preview saat ini `azure.ai.agents` `1.0.0-beta.5`, memperbarui semua banner "divalidasi terhadap" setelah rilis 1.26.0, 1.27.0, dan 1.27.1.**

#### Diubah
- **✅ Baseline validasi diperbarui** dari `azd 1.25.6` (Juni 2026) ke `azd 1.27.1` (Juli 2026) di root README, semua README bab, pelajaran dev-container Bab 1 (termasuk contoh versi terkunci), pelajaran custom-templates Bab 4, pelajaran multi-agent Bab 5, dan dokumentasi workshop
- **🤖 Baseline Bab 2 disegarkan** dari `azd 1.23.12` (Maret 2026) ke `azd 1.27.1` di `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, dan `microsoft-foundry-integration.md`; tanggal catatan validasi diperbarui ke 2026-07-13
- **🧩 Ekstensi agen AI dinaikkan** dari `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ke rilis `1.0.0-beta.5` saat ini di README Bab 2 dan `agents.md`
- **🧪 Contoh validasi workshop** (output `azd version`) diperbarui ke `1.27.1`

#### Catatan tentang rilis azd terkait (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Dukungan Go untuk Azure Functions di Flex Consumption, filter langganan per-penyewa `azd config sub-filter`, bundel ekstensi yang mandiri (`azd x pack --bundle`), dan `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Model proyek/agen Azure AI Foundry langsung di `azure.yaml` (init tanpa Bicep/Terraform), dukungan deploy container untuk App Service (`host: appservice` + `language: docker`), `-s/--source` langsung untuk perintah `azd extension`, dan `azd tool uninstall`
- **1.27.1 (2026-07-09):** Bendera `--no-dependencies` untuk `azd extension install`, model deprecated dikecualikan dari katalog/prompt kuota secara default, dan beberapa perbaikan bug

#### File yang Diperbarui
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

#### Pengisian Kekurangan Pemula #2: Pembuatan Template, Dev Containers, Pulumi, Azure DevOps, Service Principal, dan Lainnya
**Versi ini menutup kekurangan tingkat menengah yang tersisa yang diungkap oleh analisis cakupan azd: cara membuat dan menerbitkan template Anda sendiri, lingkungan dev-container/Codespaces yang dapat direproduksi, penyedia infrastruktur Pulumi, panduan CI/CD Azure DevOps, autentikasi service principal, panduan pemilihan host (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, penanganan error hook, dan praktik lingkungan tim/dibagi.**

#### Ditambahkan
- **🧱 Pelajaran Bab 4 baru** `docs/chapter-04-infrastructure/custom-templates.md` — membuat template azd Anda sendiri: struktur yang dibutuhkan (`azure.yaml`, `infra/`, `src/`), bidang `metadata.template`, parameterisasi infrastruktur dengan token sumber daya `uniqueString()` dan tag `azd-env-name`, pengujian lokal dengan `azd init --template <local-path>`, penerbitan ke GitHub, dan pengiriman ke galeri Awesome AZD
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/dev-containers.md` — lingkungan azd yang dapat direproduksi dengan Dev Containers dan GitHub Codespaces: sebuah minimal `.devcontainer/devcontainer.json` menggunakan fitur resmi `ghcr.io/azure/azure-dev/azd`, fitur spesifik bahasa, `docker-in-docker` untuk host container, dan `azd auth login --use-device-code` untuk masuk jarak jauh
- Bagian **🧩 Pulumi dengan azd** di `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, susunan folder Pulumi, stack yang dipetakan ke lingkungan azd, output/tagging yang dibutuhkan, dan alur kerja `azd up` / `azd down` yang identik
- Panduan **🎯 Pemilihan host** di `docs/chapter-04-infrastructure/provisioning.md` — perbandingan ramah pemula mengenai `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan kapan memilih AKS atau Azure Spring Apps
- Panduan **🛠️ CI/CD Azure DevOps** di `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, koneksi layanan dengan federasi identitas beban kerja (OIDC), `azure-dev.yml` yang dihasilkan, dan setup grup variabel
- **🔑 Service Principal (Pola 4)** ditambahkan di `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` non-interaktif dengan rahasia klien vs. kredensial federasi/OIDC, kapan menggunakan, dan penyimpanan kredensial yang aman
- Bagian **🪝 Penanganan error hook** di `docs/chapter-04-infrastructure/deployment-guide.md` — kode keluar dan `set -e`, `continueOnError`, pengujian hook secara terisolasi dengan `azd hooks run`, shell OS-spesifik, dan `--debug`
- Bagian **👥 Lingkungan Tim / Bersama** di `docs/chapter-03-configuration/configuration.md` — apa yang tinggal di `.azure/`, apa yang harus di gitignore, lingkungan per-developer, `azd env list`/`select`, dan penyediaan nilai lingkungan di CI/CD
- Penjelasan **🧰 `azd restore` dan perluasan `azd package`** di `resources/cheat-sheet.md` — mengembalikan dependensi dan membangun artefak yang bisa di-deploy tanpa melakukan deployment

#### Diubah
- Tabel pelajaran **🧭 Bab 4** diperbarui untuk memasukkan pelajaran baru "Membuat Template Sendiri" (Pelajaran 3)
- Tabel pelajaran **🧭 Bab 1** diperbarui untuk memasukkan pelajaran baru "Dev Containers & Codespaces" (Pelajaran 5); footer navigasi dihubungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pengisian Kekurangan Pemula: Pelajaran Multi-Agent Praktis, "Bawa Aplikasi Anda Sendiri," Terraform, dan Panduan CI/CD
**Versi ini menutup kekurangan terbesar untuk panduan pemula lengkap dengan menambahkan dua pelajaran praktis baru (panduan multi-agent yang dapat di-deploy dan menambahkan azd ke aplikasi yang ada), pengantar hook yang ramah pemula, bagian Terraform-dengan-azd, panduan langkah-demi-langkah pipeline GitHub Actions, penjelasan ekstensi preview baru, dan daftar periksa verifikasi deployment yang eksplisit.**

#### Ditambahkan
- **🤝 Pelajaran Bab 5 baru** `docs/chapter-05-multi-agent/multi-agent-basics.md` — panduan dua agen yang sepenuhnya praktis dan dapat di-deploy (orchestrator + spesialis) menggunakan template nyata (`contoso-creative-writer`), mencakup kapan menggunakan multi-agent, alur `azd up`, memahami sumber daya yang dideploy, pelacakan lintas agen, kustomisasi, dan pembersihan
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambahkan azd ke proyek yang ada dengan `azd init` ("gunakan kode di direktori saat ini"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, deteksi host, dan deployment dengan `azd up`
- Bagian **🌐 Terraform dengan azd** ditambahkan ke `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, susunan folder `.tf`, output `AZURE_*` dan tagging `azd-env-name` yang dibutuhkan, serta alur kerja `azd up` / `azd down` yang identik (menutup kekurangan di mana dukungan Terraform diklaim tetapi hanya menunjukkan Bicep)
- **⚙️ Panduan langkah demi langkah GitHub Actions** di `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke deploy otomatis: `azd pipeline config`, kredensial federasi OIDC (tanpa rahasia tersimpan), `azure-dev.yml` yang dihasilkan, dan panduan rahasia-vs-variabel
- **🪝 Pengantar Pemula "Baru dengan hooks?"** di `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, tabel hook-stage, hook pertama minimal, dan menjalankan hook secara manual dengan `azd hooks run`
- **✅ Daftar periksa "Verifikasi Deploy Anda"** ditambahkan ke Langkah 5 dari `docs/chapter-01-foundation/first-project.md` — tes asap, pemeriksaan endpoint kesehatan, dan kriteria keberhasilan eksplisit
- **🧩 Penjelasan untuk ekstensi preview baru** `azure.ai.skills` dan `azure.ai.connections` (apa itu dan kapan menggunakannya) di `docs/chapter-08-production/production-ai-practices.md`

#### Diubah
- **🧭 Tabel pelajaran Bab 5** diperbaiki: `multi-agent-basics.md` sekarang adalah Pelajaran 1 (satu-satunya pelajaran penuh langsung praktik), dengan pelabelan jujur bahwa Pelajaran 2 berada di Bab 6 dan skenario Retail adalah cetak biru arsitektur, bukan template satu perintah
- **🧭 Tabel pelajaran Bab 1** sekarang mencakup pelajaran baru "Bawa Aplikasi Anda Sendiri" (Pelajaran 4)
- **🔗 Footer navigasi** diperbarui: `first-project.md` sekarang terhubung maju ke `bring-your-own-app.md`

#### Diperbaiki
- **🧱 Menutup celah Terraform "diklaim tetapi hilang"** — kursus sebelumnya merujuk dukungan Terraform tanpa menunjukkannya
- **🔀 Memperbaiki tautan silang Bab 5 yang menyesatkan** yang menyiratkan implementasi multi-agent penuh padahal hanya ada cetak biru arsitektur

#### File yang Diperbarui
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

#### Penyegaran AZD 1.25.6, Perintah Lengkap Siklus Hidup Agen & Rebranding Aspire
**Versi ini memvalidasi ulang kursus terhadap `azd` `1.25.6` (Juni 2026) dan ekstensi `azure.ai.agents` `0.1.40-preview`, memperluas panduan AI dari "membuat kerangka agen" menjadi siklus hidup agen lengkap (tes → evaluasi → optimasi → inspeksi → hapus), menampilkan ekstensi preview baru `azure.ai.skills` dan `azure.ai.connections`, serta mencatat rebranding produk ".NET Aspire" → "Aspire".**

#### Ditambahkan
- **🔁 Cakupan lengkap siklus hidup agen** untuk pemula dan insinyur AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Tabel Siklus Hidup (membuat kerangka → tes → ukur → tingkatkan → inspeksi → bersih-bersih) ditambahkan ke bagian Ekstensi dan Perintah AI
  - `docs/chapter-08-production/production-ai-practices.md` — Bagian baru "Mengelola Siklus Hidup Agen" mencakup `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perintah Agen AI diperluas dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Ekstensi preview baru** didokumentasikan: `azure.ai.skills` (kemampuan agen yang dapat digunakan ulang) dan `azure.ai.connections` (koneksi Foundry) ditambahkan ke tabel ekstensi dan lembar contekan
- **⏱️ Panduan waktu respons** — contoh `azd ai agent invoke` sekarang mencetak total latensi dan waktu-ke-byte-pertama
- **📌 Banner versi** di README root menunjuk pelajar ke `azd version` dan `azd upgrade`

#### Diubah
- **✅ Baseline validasi diperbarui** dari `azd 1.23.12` (Maret 2026) ke `azd 1.25.6` (Juni 2026) di semua README bab dan dokumen workshop
- **🤖 Catatan ekstensi Bab 2** diperbarui dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh validasi workshop** (output `azd version`) diperbarui ke `1.25.6`
- **🧭 README "Apa yang Baru di azd Hari Ini"** diperbarui untuk menyoroti siklus hidup agen end-to-end, ekstensi AI baru, dan perbaikan kualitas hidup terbaru (`azd init` idempoten, penghapusan token usang `azd auth login`, prompt jalankan pertama `azd tool`)
- **📖 agents.md Bab 2 (Opsi 4)** sekarang mengarahkan pelajar ke perintah siklus hidup pasca-deploy dibandingkan berhenti di `azd up`

#### Diperbaiki
- **🏷️ Penamaan produk** — menambahkan catatan rebranding Aspire (".NET Aspire" sekarang cukup "Aspire"); dukungan Aspire di azd tidak berubah
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

#### Klarifikasi onboarding pemula, validasi setup & pembersihan perintah AZD terakhir
**Versi ini menindaklanjuti sweep validasi AZD 1.23 dengan pass dokumentasi berfokus pada pemula: mengklarifikasi panduan otentikasi AZD-pertama, menambahkan skrip validasi setup lokal, memverifikasi perintah utama terhadap AZD CLI langsung, dan menghapus referensi perintah sumber Inggris usang terakhir di luar changelog.**

#### Ditambahkan
- **🧪 Skrip validasi setup pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` agar pelajar dapat memastikan alat yang diperlukan sebelum memulai Bab 1
- **✅ Langkah validasi setup di awal** di README root dan README Bab 1 agar prasyarat yang hilang tertangkap sebelum `azd up`

#### Diubah
- **🔐 Panduan otentikasi pemula** sekarang secara konsisten memperlakukan `azd auth login` sebagai jalur utama untuk alur AZD, dengan `az login` disebut sebagai opsional kecuali perintah Azure CLI digunakan langsung
- **📚 Alur onboarding Bab 1** sekarang mengarahkan pelajar untuk memvalidasi setup lokal sebelum instalasi, otentikasi, dan langkah deploy pertama
- **🛠️ Pesan validator** sekarang dengan jelas memisahkan persyaratan blocking dari peringatan Azure CLI opsional untuk jalur pemula yang hanya AZD
- **📖 Konfigurasi, pemecahan masalah, dan dokumen contoh** sekarang membedakan antara otentikasi AZD yang diperlukan dan sign-in Azure CLI opsional di mana sebelumnya keduanya disajikan tanpa konteks

#### Diperbaiki
- **📋 Referensi perintah sumber Inggris yang tersisa** diperbarui ke bentuk AZD saat ini, termasuk `azd config show` di lembar contekan dan `azd monitor --overview` di mana panduan overview Portal Azure dimaksudkan
- **🧭 Klaim pemula di Bab 1** dilunakkan untuk menghindari janji berlebihan perilaku tanpa kesalahan atau rollback dijamin di semua template dan sumber daya Azure
- **🔎 Validasi CLI langsung** dikonfirmasi dukungan saat ini untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

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
**Versi ini melakukan sweep validasi dokumentasi terhadap `azd` `1.23.12`, memperbarui contoh perintah AZD yang usang, menyegarkan panduan model AI ke default saat ini, dan memperluas instruksi workshop melampaui GitHub Codespaces untuk juga mendukung dev container dan clone lokal.**

#### Ditambahkan
- **✅ Catatan validasi di seluruh bab inti dan dokumen workshop** agar baseline AZD yang diuji menjadi eksplisit bagi pelajar yang menggunakan build CLI baru atau lama
- **⏱️ Panduan timeout deploy** untuk deploy aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah inspeksi ekstensi** dengan `azd extension show azure.ai.agents` dalam dokumen alur kerja AI
- **🌐 Panduan lingkungan workshop yang lebih luas** mencakup GitHub Codespaces, dev container, dan clone lokal dengan MkDocs

#### Diubah
- **📚 README pengantar bab** sekarang secara konsisten mencatat validasi terhadap `azd 1.23.12` di bagian fondasi, konfigurasi, infrastruktur, multi-agen, pra-deploy, pemecahan masalah, dan produksi
- **🛠️ Referensi perintah AZD** diperbarui ke bentuk saat ini di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` tergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` dimana overview Application Insights dimaksudkan
- **🧪 Contoh provision preview** disederhanakan ke penggunaan yang didukung saat ini seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Alur workshop** diperbarui agar pelajar dapat menyelesaikan lab di Codespaces, dev container, atau clone lokal bukan hanya asumsi eksekusi di Codespaces
- **🔐 Panduan otentikasi** sekarang lebih memilih `azd auth login` untuk alur kerja AZD, dengan `az login` sebagai opsional ketika perintah Azure CLI digunakan langsung

#### Diperbaiki
- **🪟 Perintah instalasi Windows** dinormalisasi ke casing paket `winget` saat ini di panduan instalasi
- **🐧 Panduan instalasi Linux** diperbaiki untuk menghindari instruksi manajer paket distro-spesifik `azd` yang tidak didukung dan sebagai gantinya menunjuk ke aset rilis yang sesuai
- **📦 Contoh model AI** diperbarui dari default lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` ke contoh saat ini seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Cuplikan deploy dan diagnostik** diperbaiki menggunakan perintah status dan lingkungan saat ini dalam log, skrip, dan langkah pemecahan masalah
- **⚙️ Panduan GitHub Actions** diperbarui dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** diperbarui dari `azd mcp consent` ke `azd copilot consent list`

#### Ditingkatkan
- **🧠 Panduan bab AI** sekarang lebih baik menjelaskan perilaku preview-sensitif `azd ai`, login tenant-spesifik, penggunaan ekstensi saat ini, dan rekomendasi deploy model terbaru
- **🧪 Instruksi workshop** sekarang menggunakan contoh versi yang lebih realistis dan bahasa setup lingkungan yang lebih jelas untuk lab praktis
- **📈 Dokumen produksi dan pemecahan masalah** sekarang lebih selaras dengan contoh monitoring, fallback model, dan tier biaya saat ini

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

#### Perintah AI CLI AZD, Validasi Konten & Perluasan Template
**Versi ini menambahkan cakupan perintah `azd ai`, `azd extension`, dan `azd mcp` di semua bab terkait AI, memperbaiki tautan rusak dan kode usang di agents.md, memperbarui cheat sheet, dan memperbarui bagian Template Contoh dengan deskripsi yang tervalidasi serta template Azure AI AZD baru.**

#### Ditambahkan
- **🤖 Cakupan AZD AI CLI** di 7 file (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bagian baru "Ekstensi dan Perintah AI" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Opsi 4: `azd ai agent init` dengan tabel perbandingan (template vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subbagian "Ekstensi AZD untuk Foundry" dan "Penerapan Agent-Pertama"
  - `docs/chapter-05-multi-agent/README.md` — Mulai Cepat sekarang menunjukkan jalur penerapan berbasis template dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bagian Deploy sekarang mencakup opsi `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subbagian "Perintah Ekstensi AZD AI untuk Diagnostik"
  - `resources/cheat-sheet.md` — Bagian baru "Perintah AI & Ekstensi" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Template contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan dukungan chat suara
  - **azure-search-openai-demo-java** — Chat RAG Java menggunakan Langchain4J dengan opsi penerapan ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif multi-agent menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG serverless menggunakan Azure Functions + LangChain.js + Cosmos DB dengan dukungan pengembangan lokal Ollama
  - **chat-with-your-data-solution-accelerator** — Akselerator RAG perusahaan dengan portal admin, integrasi Teams, dan opsi PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi referensi orkestrasi MCP multi-agent dengan server di .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Template starter Bicep infrastruktur Azure AI minimalis
  - **🔗 Tautan Galeri AZD AI Keren** — Referensi ke [galeri AI awesome-azd](https://azure.github.io/awesome-azd/?tags=ai) (lebih dari 80 template)

#### Diperbaiki
- **🔗 Navigasi agents.md**: Tautan Sebelumnya/Berikutnya kini sesuai dengan urutan pelajaran README Bab 2 (Integrasi Microsoft Foundry → Agents → Penerapan Model AI)
- **🔗 Tautan rusak agents.md**: `production-ai-practices.md` dikoreksi menjadi `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 Kode usang agents.md**: Mengganti `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak valid agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Penghitungan token agents.md**: Mengganti estimasi kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Memperbaiki layanan dari "Cognitive Search + App Service" menjadi "Azure AI Search + Azure Container Apps" (host default berubah Oktober 2024)
- **contoso-chat**: Memperbarui deskripsi untuk merujuk Azure AI Foundry + Prompty, sesuai judul dan tumpukan teknologi repositori sebenarnya

#### Dihapus
- **ai-document-processing**: Menghapus referensi template yang tidak berfungsi (repositori tidak dapat diakses publik sebagai template AZD)

#### Ditingkatkan
- **📝 Latihan agents.md**: Latihan 1 sekarang menampilkan output yang diharapkan dan langkah `azd monitor`; Latihan 2 mencakup kode registrasi `FunctionTool` lengkap; Latihan 3 menggantikan panduan samar dengan perintah `prepdocs.py` yang konkret
- **📚 Sumber daya agents.md**: Memperbarui tautan dokumentasi ke dokumen layanan Azure AI Agent dan panduan cepat saat ini
- **📋 Tabel Langkah Berikutnya agents.md**: Menambahkan tautan Lab Workshop AI untuk cakupan bab lengkap

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
**Versi ini meningkatkan navigasi bab README.md dengan format tabel yang lebih baik.**

#### Diubah
- **Tabel Peta Kursus**: Ditingkatkan dengan tautan pelajaran langsung, perkiraan durasi, dan peringkat kompleksitas
- **Pembersihan Folder**: Menghapus folder lama yang redundan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validasi Tautan**: Semua lebih dari 21 tautan internal dalam tabel Peta Kursus diverifikasi

### [v3.16.0] - 2026-02-05

#### Pembaruan Nama Produk
**Versi ini memperbarui referensi produk sesuai branding Microsoft saat ini.**

#### Diubah
- **Microsoft Foundry → Microsoft Foundry**: Semua referensi diperbarui di file non-terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama layanan diperbarui untuk mencerminkan branding terkini

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

#### Restrukturisasi Repositori Besar: Nama Folder Berbasis Bab
**Versi ini menyusun ulang dokumentasi ke dalam folder khusus bab untuk navigasi yang lebih jelas.**

#### Penggantian Nama Folder
Folder lama telah digantikan dengan folder bernomor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Menambahkan baru: `docs/chapter-05-multi-agent/`

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
| Semua file pre-deployment | pre-deployment/ | chapter-06-pre-deployment/ |
| Semua file troubleshooting | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambahkan
- **📚 File README Bab**: Membuat README.md di setiap folder bab dengan:
  - Tujuan pembelajaran dan durasi
  - Tabel pelajaran dengan deskripsi
  - Perintah mulai cepat
  - Navigasi ke bab lain

#### Diubah
- **🔗 Memperbarui semua tautan internal**: Lebih dari 78 jalur diperbarui di seluruh file dokumentasi
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
  - Tiga template agen mulai cepat (Foundry Agents, Prompty, RAG)
  - Pola arsitektur agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan kustomisasi alat
  - Pemantauan dan pelacakan metrik
  - Pertimbangan biaya dan optimasi
  - Skenario pemecahan masalah umum
  - Tiga latihan praktik dengan kriteria keberhasilan

#### Struktur Konten
- **Pendahuluan**: Konsep agen untuk pemula
- **Mulai Cepat**: Menerapkan agen dengan `azd init --template get-started-with-ai-agents`
- **Pola Arsitektur**: Diagram visual pola agen
- **Konfigurasi**: Pengaturan alat dan variabel lingkungan
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktik progresif (20-45 menit tiap latihan)

---

### [v3.12.0] - 2026-02-05

#### Pembaruan Lingkungan DevContainer
**Versi ini memperbarui konfigurasi container pengembangan dengan alat modern dan pengaturan bawaan yang lebih baik untuk pengalaman belajar AZD.**

#### Diubah
- **🐳 Gambar Dasar**: Diperbarui dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terbaru)
- **📛 Nama Container**: Diganti dari "Python 3" menjadi "AZD untuk Pemula" untuk kejelasan

#### Ditambahkan
- **🔧 Fitur Dev Container Baru**:
  - `azure-cli` dengan dukungan Bicep diaktifkan
  - `node:20` (versi LTS untuk template AZD)
  - `github-cli` untuk manajemen template
  - `docker-in-docker` untuk penerapan aplikasi container

- **🔌 Penerusan Port**: Port yang sudah dikonfigurasi untuk pengembangan umum:
  - 8000 (pratinjau MkDocs)
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
  - `DavidAnson.vscode-markdownlint` - Pengecekan Markdown
  - `bierner.markdown-mermaid` - Dukungan diagram Mermaid
  - `redhat.vscode-yaml` - Dukungan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Riwayat Git

- **⚙️ Pengaturan VS Code**: Menambahkan pengaturan bawaan untuk interpreter Python, format saat simpan, dan pemangkasan spasi kosong

- **📦 Memperbarui requirements-dev.txt**:
  - Menambahkan plugin minimifikasi MkDocs
  - Menambahkan pre-commit untuk kualitas kode
  - Menambahkan paket SDK Azure (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Setelah Buat**: Sekarang memeriksa instalasi AZD dan Azure CLI saat memulai container

---

### [v3.11.0] - 2026-02-05

#### Perombakan README Ramah Pemula
**Versi ini sangat meningkatkan README.md agar lebih mudah diakses oleh pemula dan menambahkan sumber daya penting untuk pengembang AI.**

#### Ditambahkan
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas kapan menggunakan masing-masing alat dengan contoh praktis
- **🌟 Tautan AZD Keren**: Tautan langsung ke galeri template komunitas dan sumber daya kontribusi:
  - [Galeri AZD Keren](https://azure.github.io/awesome-azd/) - lebih dari 200 template siap pakai
  - [Kirim Template](https://github.com/Azure/awesome-azd/issues) - Kontribusi komunitas
- **🎯 Panduan Mulai Cepat**: Bagian memulai sederhana dengan 3 langkah (Instal → Login → Deploy)
- **📊 Tabel Navigasi Berdasarkan Pengalaman**: Panduan jelas tentang tempat memulai berdasarkan pengalaman pengembang

#### Diubah
- **Struktur README**: Disusun ulang untuk pengungkapan progresif - informasi utama di awal
- **Bagian Pendahuluan**: Ditulis ulang untuk menjelaskan "Keajaiban `azd up`" bagi pemula lengkap
- **Menghapus Konten Duplikat**: Menghilangkan bagian pemecahan masalah yang berulang
- **Perintah Pemecahan Masalah**: Memperbaiki referensi `azd logs` agar menggunakan `azd monitor --logs` yang valid

#### Diperbaiki
- **🔐 Perintah Autentikasi**: Menambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Referensi Perintah Tidak Valid**: Menghapus sisa `azd logs` dari bagian pemecahan masalah README

#### Catatan
- **Lingkup**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Audiens Target**: Perbaikan khusus ditujukan bagi pengembang yang baru menggunakan AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Akurasi Perintah Azure Developer CLI
**Versi ini memperbaiki perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD Tidak Ada Dihapus**: Audit dan perbaikan komprehensif terhadap perintah yang tidak valid:
  - `azd logs` (tidak ada) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - Subperintah `azd service` (tidak ada) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau diganti dengan alternatif yang valid
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak ada) → dihapus
  - Flag `azd provision --what-if/--rollback` (tidak ada) → diperbarui untuk menggunakan `--preview`
  - `azd config validate` (tidak ada) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus

- **📚 Berkas Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Perombakan besar pada referensi perintah
  - `docs/deployment/deployment-guide.md`: Memperbaiki strategi rollback dan deployment
  - `docs/troubleshooting/debugging.md`: Memperbaiki bagian analisis log
  - `docs/troubleshooting/common-issues.md`: Memperbarui perintah pemecahan masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki bagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Memperbaiki perintah monitoring
  - `docs/getting-started/first-project.md`: Memperbarui contoh monitoring dan debugging
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Memperbaiki perintah melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki perintah debugging agen

- **📝 Referensi Versi Diperbarui**: 
  - `docs/getting-started/installation.md`: Mengubah versi `1.5.0` yang dikodekan secara keras menjadi `1.x.x` generik dengan tautan ke rilis

#### Diubah
- **Strategi Rollback**: Memperbarui dokumentasi untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback bawaan)
- **Melihat Log**: Mengganti referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bagian Performa**: Menghapus flag deployment paralel/incremental yang tidak ada, menyediakan alternatif yang valid

#### Detail Teknis
- **Perintah AZD Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor Valid**: `--live`, `--logs`, `--overview`
- **Fitur Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Catatan
- **Verifikasi**: Perintah divalidasi menggunakan Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyelesaian Workshop dan Pembaruan Kualitas Dokumentasi
**Versi ini menyelesaikan modul workshop interaktif, memperbaiki semua tautan dokumentasi yang rusak, dan meningkatkan kualitas konten secara keseluruhan untuk pengembang AI yang menggunakan Microsoft AZD.**

#### Ditambahkan
- **📝 CONTRIBUTING.md**: Dokumen panduan kontribusi baru dengan:
  - Instruksi jelas untuk melaporkan masalah dan mengusulkan perubahan
  - Standar dokumentasi untuk konten baru
  - Panduan contoh kode dan konvensi pesan commit
  - Informasi keterlibatan komunitas

#### Diselesaikan
- **🎯 Modul Workshop 7 (Penutup)**: Modul penutup lengkap dengan:
  - Ringkasan komprehensif pencapaian workshop
  - Bagian konsep kunci yang dikuasai meliputi AZD, template, dan Microsoft Foundry
  - Rekomendasi kelanjutan perjalanan pembelajaran
  - Latihan tantangan workshop dengan tingkat kesulitan
  - Tautan umpan balik dan dukungan komunitas

- **📚 Modul Workshop 3 (Dekonstruksi)**: Memperbarui tujuan pembelajaran dengan:
  - Panduan aktivasi GitHub Copilot dengan server MCP
  - Pemahaman struktur folder template AZD
  - Pola organisasi infrastruktur sebagai kode (Bicep)
  - Instruksi laboratorium praktis

- **🔧 Modul Workshop 6 (Pembongkaran)**: Diselesaikan dengan:
  - Tujuan pembersihan sumber daya dan manajemen biaya
  - Penggunaan `azd down` untuk penghapusan infrastruktur yang aman
  - Panduan pemulihan layanan kognitif yang terhapus secara lunak
  - Prompt eksplorasi bonus untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Perbaikan Tautan Rusak**: Memperbaiki lebih dari 15 tautan internal dokumentasi yang rusak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki jalur ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Memperbaiki jalur ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki jalur FAQ dan panduan pemecahan masalah
  - `examples/container-app/microservices/README.md`: Memperbaiki jalur halaman utama kursus dan panduan deployment
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI
  - `course-outline.md`: Memperbaiki referensi panduan instruktur dan lab workshop AI

- **📅 Banner Status Workshop**: Memperbarui dari "Dalam Pengerjaan" menjadi status workshop aktif dengan tanggal Februari 2026

- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi yang rusak di README.md workshop yang mengarah ke folder lab-1-azd-basics yang tidak ada

#### Diubah
- **Presentasi Workshop**: Menghapus peringatan "dalam pengerjaan", workshop sekarang selesai dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar modul yang tepat
- **Referensi Jalur Pembelajaran**: Memperbarui referensi silang bab untuk menggunakan jalur microsoft-foundry yang benar

#### Diverifikasi
- ✅ Semua berkas markdown Bahasa Inggris memiliki tautan internal yang valid
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran
- ✅ Navigasi antar bab dan modul berfungsi dengan baik
- ✅ Konten sesuai untuk pengembang AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur ramah pemula terjaga sepanjang dokumen
- ✅ CONTRIBUTING.md memberikan panduan jelas untuk kontributor komunitas

#### Implementasi Teknis
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md
- **Audit Konten**: Peninjauan manual untuk kelengkapan workshop dan kesesuaian pemula
- **Sistem Navigasi**: Menerapkan pola navigasi bab dan modul yang konsisten

#### Catatan
- **Lingkup**: Perubahan diterapkan hanya pada dokumentasi Bahasa Inggris
- **Terjemahan**: Folder terjemahan tidak diperbarui pada versi ini (terjemahan otomatis akan disinkronisasi nanti)
- **Durasi Workshop**: Workshop lengkap kini menyediakan 3-4 jam pembelajaran praktik

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agen
**Versi ini menambahkan pelajaran lengkap tingkat A tentang integrasi Application Insights, pola autentikasi, dan koordinasi multi-agen untuk deployment produksi.**

#### Ditambahkan
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:
  - Deployment fokus AZD dengan provisioning otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri kustom (1.200+ baris)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Microsoft Foundry Models)
  - 6 diagram Mermaid (arsitektur, distributed tracing, alur telemetri)
  - 3 latihan praktik (alert, dashboard, monitoring AI)
  - Contoh kueri Kusto dan strategi optimisasi biaya
  - Streaming metrik langsung dan debugging waktu nyata
  - Waktu pembelajaran 40-50 menit dengan pola siap produksi

- **🔐 Pelajaran Pola Autentikasi & Keamanan**: di `docs/getting-started/authsecurity.md`:
  - 3 pola autentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk deployment aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (aktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik keamanan terbaik dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola autentikasi tanpa kata sandi siap produksi

- **🤖 Pelajaran Pola Koordinasi Multi-Agen**: di `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sekuensial, paralel, hierarkis, berbasis event, konsensus)
  - Implementasi lengkap layanan orchestrator (Python/Flask, 1.500+ baris)
  - 3 implementasi agen khusus (Research, Writer, Editor)
  - Integrasi Service Bus untuk antrian pesan
  - Manajemen status Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid menunjukkan interaksi agen
  - 3 latihan lanjutan (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/bulan) dengan strategi optimasi
  - Integrasi Application Insights untuk monitoring

#### Ditingkatkan
- **Bab Pra-Deployment**: Sekarang mencakup pola monitoring dan koordinasi yang komprehensif
- **Bab Memulai**: Ditingkatkan dengan pola autentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observabilitas
- **Garis Besar Kursus**: Memperbarui referensi pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progresi Pembelajaran**: Integrasi pola keamanan dan monitoring yang lebih baik sepanjang kursus
- **Kualitas Dokumentasi**: Standar tingkat A yang konsisten (95-97%) di seluruh pelajaran baru
- **Pola Produksi**: Cakupan menyeluruh end-to-end untuk deployment perusahaan

#### Diperbaiki
- **Pengalaman Pengembang**: Jalur jelas dari pengembangan ke monitoring produksi
- **Standar Keamanan**: Pola profesional untuk autentikasi dan manajemen rahasia
- **Observabilitas**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Monitoring khusus untuk Microsoft Foundry Models dan sistem multi-agen

#### Diverifikasi
- ✅ Semua pelajaran menyertakan kode berjalan lengkap (bukan potongan kode)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total di 3 pelajaran)
- ✅ Latihan praktik dengan langkah verifikasi (9 total)
- ✅ Template Bicep siap produksi dapat dideploy melalui `azd up`
- ✅ Analisis biaya dan strategi optimasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan lengkap
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agen tingkat lanjut
- **Konten Baru Keseluruhan**: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri kustom + distributed tracing
- **Autentikasi**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Monitoring**: Metrik langsung + kueri Kusto + alert + dashboard
- **Manajemen Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Microsoft Foundry Models Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh deployment lengkap Microsoft Foundry Models dengan antarmuka chat gpt-4.1.**

#### Ditambahkan
- **🤖 Contoh Chat Microsoft Foundry Models**: Deployment lengkap gpt-4.1 dengan implementasi yang berfungsi di `examples/azure-openai-chat/`:
  - Infrastruktur Microsoft Foundry Models lengkap (deployment model gpt-4.1)
  - Antarmuka chat baris perintah Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan aman kunci API
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan laju dan penanganan kesalahan
  - README komprehensif dengan panduan deployment 35-45 menit
  - 11 berkas siap produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-lingkungan (15 menit)
  - Latihan 2: Praktik manajemen rahasia (10 menit)
  - Kriteria keberhasilan dan langkah verifikasi yang jelas
- **✅ Verifikasi Deployment**: Menambahkan bagian verifikasi ke panduan deployment:
  - Prosedur pemeriksaan kesehatan
  - Daftar periksa kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah deployment
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui ke kualitas tingkat A (93%):
  - Menambahkan azure-openai-chat ke semua bagian relevan
  - Memperbarui jumlah contoh lokal dari 3 menjadi 4
  - Ditambahkan ke tabel Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Menengah
  - Ditambahkan ke bagian Template Microsoft Foundry
  - Memperbarui Matriks Perbandingan dan bagian pencarian teknologi
- **Kualitas Dokumentasi**: Ditingkatkan dari B+ (87%) → A- (92%) di seluruh folder docs:
  - Menambahkan output yang diharapkan pada contoh perintah penting
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran langsung dengan latihan praktis

#### Diubah
- **Progres Pembelajaran**: Integrasi contoh AI yang lebih baik untuk pembelajar menengah
- **Struktur Dokumentasi**: Latihan yang lebih dapat ditindaklanjuti dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja utama

#### Ditingkatkan
- **Pengalaman Pengembang**: Deployment Microsoft Foundry Models sekarang memakan waktu 35-45 menit (vs 60-90 untuk alternatif kompleks)
- **Transparansi Biaya**: Perkiraan biaya yang jelas ($50-200/bulan) untuk contoh Microsoft Foundry Models
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi konsisten

#### Divalidasi
- ✅ Contoh Microsoft Foundry Models berfungsi penuh dengan `azd up`
- ✅ Semua 11 file implementasi sintaksis benar
- ✅ Instruksi README sesuai dengan pengalaman deployment aktual
- ✅ Tautan dokumentasi diperbarui di lebih dari 8 lokasi
- ✅ Indeks contoh mencerminkan 4 contoh lokal secara akurat
- ✅ Tidak ada tautan eksternal duplikat di tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Microsoft Foundry Models**: pola gpt-4.1 + Key Vault + Container Apps
- **Keamanan**: Siap Managed Identity, rahasia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimasi penggunaan
- **Deployment**: Satu perintah `azd up` untuk setup lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Utama: Contoh Deployment Container App
**Versi ini memperkenalkan contoh penerapan aplikasi container lengkap yang siap produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Container App**: Contoh lokal baru di `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Gambaran lengkap deployment containerized, quick start, produksi, dan pola lanjutan
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API ramah pemula dengan scale-to-zero, health probes, monitoring, dan troubleshooting
  - [Microservices Architecture](../../examples/container-app/microservices): Deployment multi-layanan siap produksi (API Gateway, Product, Order, User, Notification), messaging async, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Praktik Terbaik**: Keamanan, pemantauan, optimasi biaya, dan panduan CI/CD untuk beban kerja containerized
- **Contoh Kode**: Lengkap `azure.yaml`, template Bicep, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Troubleshooting**: Skenario tes end-to-end, perintah monitoring, panduan troubleshooting

#### Diubah
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh container app baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Diperbarui untuk menyoroti contoh container app, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Course Outline & Study Guide**: Diperbarui untuk merujuk contoh container app baru dan pola deployment di bab terkait

#### Divalidasi
- ✅ Semua contoh baru dapat di-deploy dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario dari pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Ruang Lingkup**: Dokumentasi dan contoh hanya dalam bahasa Inggris
- **Langkah Selanjutnya**: Perluasan dengan pola container lanjutan tambahan dan otomasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Rebranding Produk: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk secara menyeluruh dari "Microsoft Foundry" menjadi "Microsoft Foundry" di semua dokumentasi bahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" ke "Microsoft Foundry"
  - Memperbarui semua referensi di seluruh dokumentasi bahasa Inggris dalam folder `docs/`
  - Mengganti nama folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Mengganti nama file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 referensi konten diperbarui di 7 file dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` diganti menjadi `docs/microsoft-foundry/`
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
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referensi diperbarui (gambaran, umpan balik komunitas, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 tautan silang diperbarui
  - `docs/getting-started/first-project.md` - 2 tautan navigasi bab diperbarui
  - `docs/getting-started/installation.md` - 2 tautan bab berikutnya diperbarui
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referensi diperbarui (navigasi, komunitas Discord)
  - `docs/troubleshooting/common-issues.md` - 1 tautan navigasi diperbarui
  - `docs/troubleshooting/debugging.md` - 1 tautan navigasi diperbarui

- **File Struktur Kursus** (2 file):
  - `README.md` - 17 referensi diperbarui (gambaran kursus, judul bab, bagian template, wawasan komunitas)
  - `course-outline.md` - 14 referensi diperbarui (gambaran, tujuan pembelajaran, sumber daya bab)

#### Divalidasi
- ✅ Tidak ada referensi path folder "ai-foundry" yang tersisa di dokumen bahasa Inggris
- ✅ Tidak ada referensi nama produk "Microsoft Foundry" yang tersisa di dokumen bahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama file dan folder berhasil dilakukan
- ✅ Referensi silang antar bab divalidasi

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggris di folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui pada versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui pada versi ini
- **Contoh**: File contoh mungkin masih merujuk nama lama (akan diperbaiki pada pembaruan berikutnya)
- **Tautan Eksternal**: URL eksternal dan referensi repository GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Validasi semua tautan internal dokumentasi masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau dan Validasi Infrastruktur
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau Azure Developer CLI baru dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi fitur azd provision --preview**: Liputan lengkap kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi rinci dalam panduan penyediaan dengan studi kasus dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk validasi deployment lebih aman
  - Pembaruan panduan memulai dengan praktik deployment utama keselamatan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradasi dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Tanda waktu pembaruan terakhir untuk transparansi
  - Desain responsif mobile untuk semua jenis perangkat

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fitur pratinjau terintegrasi di seluruh dokumentasi deployment
- **Validasi Pra-Deployment**: Skrip otomatis kini mencakup pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk menyertakan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Harapan jelas ditetapkan kepada pengguna mengenai status pengembangan konten

#### Diubah
- **Praktik Terbaik Deployment**: Alur kerja pratinjau-pertama sekarang direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindah ke tahap awal proses pembelajaran
- **Penyajian Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Ditingkatkan
- **Pendekatan Keselamatan**: Perubahan infrastruktur kini dapat divalidasi sebelum deployment
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk ditinjau dan disetujui
- **Kesadaran Biaya**: Pemahaman lebih baik tentang biaya sumber daya sebelum penyediaan
- **Mitigasi Risiko**: Mengurangi kegagalan deployment melalui validasi terlebih dahulu

#### Implementasi Teknis
- **Integrasi Multi-dokumen**: Fitur pratinjau didokumentasikan di 4 file utama
- **Pola Perintah**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau disertakan dalam alur kerja dan skrip validasi
- **Indikator Visual**: Penandaan fitur BARU yang jelas untuk menemukan fitur

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Penyajian Profesional**: Menjaga kredibilitas repositori sambil mengatur ekspektasi
- **Transparansi Garis Waktu**: Tanda waktu pembaruan terakhir Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Materi Workshop Diperluas dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran terarah 7 langkah dari penemuan hingga kustomisasi
  - 0-Pengenalan: Gambaran workshop dan setup
  - 1-Pilih-Template-AI: Proses penemuan dan pemilihan template
  - 2-Verifikasi-Template-AI: Prosedur deployment dan validasi
  - 3-Bongkar-Template-AI: Memahami arsitektur template
  - 4-Konfigurasi-Template-AI: Konfigurasi dan kustomisasi
  - 5-Kustomisasi-Template-AI: Modifikasi dan iterasi lanjutan
  - 6-Pembersihan-Infrastruktur: Pembersihan dan manajemen sumber daya
  - 7-Penutup: Ringkasan dan langkah selanjutnya
- **🛠️ Peralatan Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman belajar yang lebih baik
- **🎯 Jalur Pembelajaran Hands-On**: Metodologi 3 langkah (Penemuan → Deployment → Kustomisasi)
- **📱 Integrasi GitHub Codespaces**: Setup lingkungan pengembangan yang mulus

#### Ditingkatkan
- **Lab Workshop AI**: Diperluas dengan pengalaman pembelajaran terstruktur selama 2-3 jam
- **Dokumentasi Workshop**: Penyajian profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan template hingga deployment produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang efisien

#### Ditingkatkan
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan toggle tema
- **Pembelajaran Mandiri**: Struktur workshop fleksibel yang mengakomodasi kecepatan belajar berbeda
- **Aplikasi Praktis**: Skenario deployment template AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan cepat kata kunci dan pelajaran
- **Salin Blok Kode**: Fungsi gulir dan salin untuk semua contoh kode
- **Toggle Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Screenshot dan diagram untuk pemahaman lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Besar dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Menstrukturkan ulang seluruh kursus menjadi 8 bab pembelajaran progresif
  - Bab 1: Dasar & Mulai Cepat (⭐ - 30-45 menit)
  - Bab 2: Pengembangan AI-Pertama (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Autentikasi (⭐⭐ - 45-60 menit)
  - Bab 4: Infrastruktur sebagai Kode & Deployment (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Solusi AI Multi-Agen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Validasi & Perencanaan Pra-Deployment (⭐⭐ - 1 jam)
  - Bab 7: Pemecahan Masalah & Debugging (⭐⭐ - 1-1.5 jam)
  - Bab 8: Pola Produksi & Enterprise (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi yang konsisten di seluruh dokumentasi
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk tingkat pengalaman dan tujuan berbeda
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat terhubung dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman kini menyertakan konteks bab dan panduan progresi
- **Organisasi Template**: Contoh dan template dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan belajar terhubung ke bab terkait
- **Integrasi Workshop**: Lab praktis dipetakan ke beberapa tujuan pembelajaran bab

#### Diubah
- **Progres Pembelajaran**: Berpindah dari dokumentasi linear ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Memposisikan kembali panduan konfigurasi sebagai Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi konten khusus AI yang lebih baik di seluruh perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Bab 8 untuk pelajar tingkat perusahaan

#### Ditingkatkan
- **Pengalaman Pengguna**: Navigasi breadcrumb yang jelas dan indikator progres bab
- **Aksesibilitas**: Pola navigasi konsisten untuk memudahkan penelusuran kursus
- **Presentasi Profesional**: Struktur kursus ala universitas yang sesuai untuk pelatihan akademik dan korporat
- **Efisiensi Pembelajaran**: Waktu berkurang untuk menemukan konten relevan melalui organisasi yang lebih baik

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab distandarisasi di lebih dari 40 file dokumentasi
- **Navigasi Footer**: Panduan progres yang konsisten dan indikator penyelesaian bab
- **Tautan Silang**: Sistem tautan internal komprehensif yang menghubungkan konsep terkait
- **Pemetaan Bab**: Template dan contoh dikaitkan secara jelas dengan tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi direstrukturisasi agar sesuai dengan sistem 8 bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal pembelajaran mingguan dengan hasil terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas langsung dengan skenario penerapan nyata dan pemecahan masalah
- **📊 Progres Keterampilan**: Kemajuan jelas dari konsep dasar ke pola perusahaan dengan fokus pengembangan karier
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran terstruktur 10 minggu dengan validasi tonggak pencapaian

### [v3.1.0] - 2025-09-17

#### Solusi AI Multi-Agen yang Ditingkatkan
**Versi ini meningkatkan solusi multi-agen ritel dengan penamaan agen yang lebih baik dan dokumentasi yang diperbaharui.**

#### Perubahan
- **Terminologi Multi-Agen**: Mengganti "agen Cora" dengan "agen Pelanggan" di seluruh solusi multi-agen ritel untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "agen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan terbaru
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi agen Pelanggan
- **Diagram Arsitektur**: Menyegarkan diagram Mermaid dengan penamaan agen terbaru
- **Contoh Kode**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penerapan untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pengembang**: Peran dan tanggung jawab agen yang lebih jelas dalam dokumentasi
- **Kesiapan Produksi**: Penyelarasan yang lebih baik dengan konvensi penamaan perusahaan
- **Materi Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan
- **Kegunaan Template**: Mempermudah pemahaman fungsi agen dan pola penerapan

#### Detail Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Memodifikasi konfigurasi JSON template ARM untuk menggunakan tipe agen "customer"
- Memperbarui variabel lingkungan dari CORA_AGENT_* ke pola CUSTOMER_AGENT_*
- Menyegarkan semua perintah penerapan dan konfigurasi container

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran komprehensif berfokus AI dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 Jalur Pembelajaran AI-Pertama**: Restrukturisasi lengkap memprioritaskan pengembang dan insinyur AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi lengkap untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **Pola Penerapan Model AI**: Panduan rinci mencakup pemilihan model, konfigurasi, dan strategi penerapan produksi
- **Lab Workshop AI**: Workshop langsung 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat diterapkan dengan AZD
- **Praktik Terbaik AI Produksi**: Pola siap perusahaan untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **Panduan Pemecahan Masalah Khusus AI**: Pemecahan masalah komprehensif untuk Microsoft Foundry Models, Cognitive Services, dan isu penerapan AI
- **Galeri Template AI**: Koleksi unggulan template Microsoft Foundry dengan peringkat kompleksitas
- **Materi Workshop**: Struktur workshop lengkap dengan lab praktis dan materi referensi

#### Ditingkatkan
- **Struktur README**: Fokus pengembang AI dengan data minat komunitas 45% dari Discord Microsoft Foundry
- **Jalur Pembelajaran**: Perjalanan pengembang AI khusus bersamaan dengan jalur tradisional untuk siswa dan insinyur DevOps
- **Rekomendasi Template**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komunitas**: Dukungan komunitas Discord diperkuat dengan saluran dan diskusi khusus AI

#### Fokus Keamanan & Produksi
- **Polanya Managed Identity**: Konfigurasi autentikasi dan keamanan khusus AI
- **Optimasi Biaya**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Penerapan Multi-Region**: Strategi penerapan aplikasi AI secara global
- **Pemantauan Kinerja**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Struktur Kursus Linear**: Progres logis dari pola penerapan AI pemula hingga lanjutan
- **URL Terverifikasi**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Referensi Lengkap**: Semua tautan dokumentasi internal tervalidasi dan berfungsi
- **Siap Produksi**: Pola penerapan perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini merupakan perombakan besar struktur repositori dan penyajian konten.**

#### Ditambahkan
- **Kerangka Pembelajaran Terstruktur**: Semua halaman dokumentasi kini mencakup bagian Pengantar, Tujuan Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Menambahkan tautan Pelajaran Sebelumnya/Berikutnya di semua dokumentasi untuk progres pembelajaran terpandu
- **Panduan Studi**: study-guide.md komprehensif dengan tujuan belajar, latihan praktik, dan materi penilaian
- **Presentasi Profesional**: Menghapus semua ikon emoji untuk aksesibilitas dan tampilan profesional yang lebih baik
- **Struktur Konten yang Ditingkatkan**: Organisasi dan alur materi pembelajaran diperbaiki

#### Diubah
- **Format Dokumentasi**: Mendistandarisasi semua dokumentasi dengan struktur berfokus pembelajaran yang konsisten
- **Alur Navigasi**: Menerapkan progres logis di semua materi pembelajaran
- **Penyajian Konten**: Menghapus elemen dekoratif demi format yang jelas dan profesional
- **Struktur Tautan**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Ditingkatkan
- **Aksesibilitas**: Menghilangkan ketergantungan emoji untuk kompatibilitas pembaca layar yang lebih baik
- **Tampilan Profesional**: Penyajian bersih ala akademik yang sesuai untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan terstruktur dengan tujuan dan hasil jelas untuk setiap pelajaran
- **Organisasi Konten**: Alur logis yang lebih baik dan keterkaitan antara topik terkait

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan memulai lengkap
  - Dokumentasi lengkap penerapan dan penyediaan
  - Sumber daya pemecahan masalah dan panduan debugging terperinci
  - Alat dan prosedur validasi pra-penerapan

- **Modul Memulai**
  - Dasar-dasar AZD: Konsep dan terminologi inti
  - Panduan Instalasi: Instruksi pemasangan spesifik platform
  - Panduan Konfigurasi: Pengaturan lingkungan dan autentikasi
  - Tutorial Proyek Pertama: Pembelajaran praktis langkah demi langkah

- **Modul Penerapan dan Penyediaan**
  - Panduan Penerapan: Dokumentasi alur kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kode dengan Bicep
  - Praktik terbaik untuk penerapan produksi
  - Pola arsitektur multi-layanan

- **Modul Validasi Pra-Penerapan**
  - Perencanaan Kapasitas: Validasi ketersediaan sumber daya Azure
  - Pemilihan SKU: Panduan tingkat layanan komprehensif
  - Pemeriksaan Pra-Penerbangan: Skrip validasi otomatis (PowerShell dan Bash)
  - Estimasi biaya dan alat perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Masalah Umum: Masalah dan solusi yang sering ditemui
  - Panduan Debugging: Metodologi pemecahan masalah sistematis
  - Teknik diagnostik dan alat lanjutan
  - Pemantauan dan optimasi kinerja

- **Sumber Daya dan Referensi**
  - Cheat Sheet Perintah: Referensi cepat untuk perintah penting
  - Glosarium: Terminologi dan definisi akronim komprehensif
  - FAQ: Jawaban rinci untuk pertanyaan umum
  - Tautan sumber eksternal dan koneksi komunitas

- **Contoh dan Template**
  - Contoh Aplikasi Web Sederhana
  - Template penerapan Situs Web Statis
  - Konfigurasi Aplikasi Container
  - Pola integrasi Basis Data
  - Contoh arsitektur Microservices
  - Implementasi fungsi tanpa server

#### Fitur
- **Dukungan Multi-Platform**: Panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Berbagai Level Keterampilan**: Konten dirancang untuk siswa hingga pengembang profesional
- **Fokus Praktis**: Contoh langsung dan skenario dunia nyata
- **Cakupan Komprehensif**: Dari konsep dasar hingga pola perusahaan tingkat lanjut
- **Pendekatan Keamanan-First**: Praktik terbaik keamanan terintegrasi sepanjang materi
- **Optimasi Biaya**: Panduan penerapan hemat biaya dan pengelolaan sumber daya

#### Kualitas Dokumentasi
- **Contoh Kode Terperinci**: Sampel kode praktis dan teruji
- **Instruksi Langkah-demi-Langkah**: Panduan jelas dan bisa diikuti
- **Penanganan Kesalahan Komprehensif**: Pemecahan masalah untuk isu umum
- **Integrasi Praktik Terbaik**: Standar industri dan rekomendasi
- **Kompatibilitas Versi**: Terupdate dengan layanan Azure dan fitur azd terbaru

## Peningkatan yang Direncanakan di Masa Depan

### Versi 3.1.0 (Direncanakan)
#### Perluasan Platform AI
- **Dukungan Multi-Model**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **Kerangka Kerja Agen AI**: Template untuk penerapan LangChain, Semantic Kernel, dan AutoGen
- **Pola RAG Lanjutan**: Opsi basis data vektor selain Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabilitas AI**: Pemantauan diperkuat untuk kinerja model, penggunaan token, dan kualitas respons

#### Pengalaman Pengembang
- **Ekstensi VS Code**: Pengalaman pengembangan terpadu AZD + Microsoft Foundry
- **Integrasi GitHub Copilot**: Pembuatan template AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengkodean langsung dengan validasi otomatis untuk skenario AI
- **Konten Video**: Tutorial video pendukung untuk pembelajar visual dengan fokus pada penerapan AI

### Versi 4.0.0 (Direncanakan)
#### Pola AI Perusahaan
- **Kerangka Tata Kelola**: Tata kelola model AI, kepatuhan, dan jejak audit
- **AI Multi-Penyewa**: Pola penyajian beberapa pelanggan dengan layanan AI terisolasi
- **Penerapan AI Edge**: Integrasi dengan Azure IoT Edge dan instance container
- **AI Hybrid Cloud**: Pola penerapan multi-cloud dan hybrid untuk beban kerja AI

#### Fitur Lanjutan
- **Otomasi Pipeline AI**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Keamanan Lanjutan**: Pola zero-trust, private endpoint, dan perlindungan ancaman canggih
- **Optimasi Kinerja**: Penalaan dan strategi penskalaan lanjutan untuk aplikasi AI berthroughput tinggi
- **Distribusi Global**: Pola pengiriman konten dan cache edge untuk aplikasi AI

### Versi 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Penambahan yang Diusulkan - Kini Diimplementasikan di v3.0.0
- ✅ **Konten Berfokus AI**: Integrasi Microsoft Foundry komprehensif (Selesai)
- ✅ **Tutorial Interaktif**: Lab workshop AI langsung (Selesai)
- ✅ **Modul Keamanan Lanjutan**: Pola keamanan khusus AI (Selesai)
- ✅ **Optimasi Kinerja**: Strategi penalaan beban kerja AI (Selesai)

### Versi 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Peningkatan Minor - Beberapa Selesai di Rilis Saat Ini
- ✅ **Contoh Tambahan**: Skenario penerapan berfokus AI (Selesai)
- ✅ **FAQ Diperluas**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor diperkuat
- ✅ **Perluasan Pemantauan**: Pola pemantauan dan peringatan khusus AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Dokumentasi Ramah Mobile**: Desain responsif untuk pembelajaran mobile
- **Akses Offline**: Paket dokumentasi yang dapat diunduh
- **Integrasi IDE Ditingkatkan**: Ekstensi VS Code untuk alur kerja AZD + AI
- **Dasbor Komunitas**: Metrik komunitas waktu nyata dan pelacakan kontribusi

## Kontribusi ke Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti penomoran semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Ditambahkan, Diubah, Didepresiasi, Dihapus, Diperbaiki, Keamanan
4. **Deskripsi Jelas**: Deskripsi singkat tentang apa yang berubah
5. **Penilaian Dampak**: Bagaimana perubahan memengaruhi pengguna yang ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kapabilitas
- Contoh baru, template, atau sumber belajar
- Alat tambahan, skrip, atau utilitas

#### Diubah
- Modifikasi pada fungsi atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Didepresiasi
- Fitur atau pendekatan yang sedang dihentikan
- Bagian dokumentasi yang dijadwalkan untuk dihapus
- Metode yang memiliki alternatif lebih baik

#### Dihapus
- Fitur, dokumentasi, atau contoh yang tidak lagi relevan
- Informasi usang atau pendekatan yang dihentikan
- Konten yang redundan atau dikonsolidasikan

#### Diperbaiki
- Koreksi kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah yang dilaporkan
- Peningkatan akurasi atau fungsi

#### Keamanan
- Peningkatan atau perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Panduan Penomoran Semantik

#### Versi Mayor (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Restrukturisasi signifikan konten atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi mendasar

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Peningkatan yang mempertahankan kompatibilitas mundur
- Contoh tambahan, alat, atau sumber daya

#### Versi Patch (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Umpan Balik dan Saran Komunitas

Kami secara aktif mendorong umpan balik komunitas untuk meningkatkan sumber belajar ini:

### Cara Memberi Umpan Balik
- **GitHub Issues**: Laporkan masalah atau sarankan perbaikan (isu khusus AI disambut)
- **Discord Discussions**: Bagikan ide dan terlibat dengan komunitas Microsoft Foundry
- **Pull Requests**: Berkontribusi langsung pada perbaikan konten, terutama template dan panduan AI
- **Microsoft Foundry Discord**: Ikuti saluran #Azure untuk diskusi AZD + AI
- **Forum Komunitas**: Ikut serta dalam diskusi pengembang Azure yang lebih luas

### Kategori Umpan Balik
- **Akurasi Konten AI**: Koreksi pada integrasi dan informasi penyebaran layanan AI
- **Pengalaman Belajar**: Saran untuk alur belajar pengembang AI yang lebih baik
- **Konten AI yang Hilang**: Permintaan template, pola, atau contoh AI tambahan
- **Aksesibilitas**: Peningkatan untuk kebutuhan belajar yang beragam
- **Integrasi Alat AI**: Saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Pola AI Produksi**: Permintaan pola penyebaran AI perusahaan

### Komitmen Tanggapan
- **Tanggapan Masalah**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Fitur**: Evaluasi dalam waktu satu minggu
- **Kontribusi Komunitas**: Tinjauan dalam waktu satu minggu
- **Masalah Keamanan**: Prioritas segera dengan tanggapan dipercepat

## Jadwal Pemeliharaan

### Pembaruan Rutin
- **Tinjauan Bulanan**: Akurasi konten dan validasi tautan
- **Pembaruan Triwulanan**: Penambahan dan perbaikan konten besar
- **Tinjauan Setengah Tahunan**: Restrukturisasi dan peningkatan menyeluruh
- **Rilis Tahunan**: Pembaruan versi besar dengan peningkatan signifikan

### Pemantauan dan Penjaminan Kualitas
- **Pengujian Otomatis**: Validasi rutin contoh kode dan tautan
- **Integrasi Umpan Balik Komunitas**: Penggabungan rutin saran pengguna
- **Pembaruan Teknologi**: Penyelarasan dengan layanan Azure terbaru dan rilis azd
- **Audit Aksesibilitas**: Peninjauan rutin prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Versi Mayor Terbaru**: Dukungan penuh dengan pembaruan rutin
- **Versi Mayor Sebelumnya**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Versi Lama**: Dukungan komunitas saja, tanpa pembaruan resmi

### Panduan Migrasi
Saat versi mayor dirilis, kami menyediakan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Detail tentang perubahan besar yang memutuskan kompatibilitas
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Studi](resources/study-guide.md)
- **Pelajaran Berikutnya**: Kembali ke [README Utama](README.md)

**Tetap Terupdate**: Pantau repositori ini untuk notifikasi tentang rilisan baru dan pembaruan penting pada materi pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->