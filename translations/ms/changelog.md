# Changelog - AZD Untuk Pemula

## Pengenalan

Changelog ini mendokumentasikan semua perubahan penting, kemas kini, dan penambahbaikan pada repositori AZD Untuk Pemula. Kami mengikuti prinsip penomboran versi semantik dan menyelenggara log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan mengkaji changelog ini, anda akan:
- Sentiasa mendapat maklumat tentang ciri baru dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Mengesan pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas mengkaji entri changelog, anda akan dapat:
- Mengenal pasti kandungan dan sumber baru yang tersedia untuk pembelajaran
- Memahami bahagian mana yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Memberi maklum balas dan cadangan untuk penambahbaikan akan datang

## Sejarah Versi

### [v3.24.0]- 2026-11-04

#### Diperbetulkan
- Memperbaiki navigasi kursus Bahasa Inggeris, laluan halaman yang dipindahkan, anchor yang hilang, dan rujukan luaran yang usang, termasuk pautan Bab 2 ke panduan AI pengeluaran.
- Menilai semula panduan semasa berbanding AZD 1.37.2 yang diterbitkan, agen 1.0.0-beta.23, dan penilaian 1.0.0-beta.2. Mendokumentasikan aliran kerja `azd ai eval` yang berasingan dan migrasi konfigurasi pengoptimuman.
- Membetulkan bendera CLI yang tidak disokong, sempadan pengesahan, panduan persekitaran/rahsia plaintext, kemas kini infrastruktur, konfigurasi model, dan contoh pemulihan merosakkan.
- Menyegarkan bengkel berasaskan contoh AI Agen semasa, termasuk kait sebenar, input konfigurasi, ujian penilaian, titik masuk red-teaming, dan kebolehmampuan.
- Membetulkan tuntutan pelaksanaan contoh dan membaiki isu aplikasi/infrastruktur/konfigurasi yang berkaitan. Bahan seni bina runcit secara jelas dibezakan daripada aplikasi berfungsi lengkap.
- Memulihkan matriks bahasa CodeQL, memilih Node.js 24 yang disokong untuk bekas pembangunan, dan menjadikan validator persediaan melaporkan perintah versi gagal.

#### Ditambah
- Pengecekan pautan/anchor offline hanya untuk Bahasa Inggeris, ujian regresi, dan aliran kerja dokumentasi yang juga membina bengkel dalam mod ketat. Terjemahan terhasil dan imej yang diterjemah dikecualikan.

#### Skop Pengesahan
- Pemeriksaan sumber, sintaks, konfigurasi, tingkah laku tempatan, dan pautan rangkaian tidak menetapkan kemampuan penyebaran Azure secara langsung, kuota, RBAC, ketersediaan model serantau, pengebilan, pematuhan keselamatan, atau kesiapan pengeluaran.
- Entri lama di bawah adalah rekod sejarah, bukan arahan perintah atau pelepasan semasa.

### [v3.23.0] - 2026-07-13

#### Penyegaran AZD 1.27.1: Kemas Kini Versi Terkini
**Versi ini mengesahkan kembali kursus berbanding `azd` `1.27.1` (Julai 2026, pelepasan stabil terkini) dan sambungan agen AI pratonton `azure.ai.agents` `1.0.0-beta.5` semasa, membawa semua banner "disahkan berbanding" ke tahap terkini selepas pelepasan 1.26.0, 1.27.0, dan 1.27.1.**

#### Diubah
- **✅ Garis asas pengesahan dikemas kini** dari `azd 1.25.6` (Jun 2026) ke `azd 1.27.1` (Julai 2026) merentasi README akar, semua README bab, pelajaran bekas pembangunan Bab 1 (termasuk contoh versi tetap), pelajaran templat khusus Bab 4, pelajaran multi-agen Bab 5, dan dokumen bengkel
- **🤖 Garis asas Bab 2 disegar semula** dari `azd 1.23.12` (Mac 2026) ke `azd 1.27.1` merentasi `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, dan `microsoft-foundry-integration.md`; tarikh nota pengesahan dikemas kini ke 2026-07-13
- **🧩 Sambungan agen AI dinaik taraf** dari `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ke pelepasan `1.0.0-beta.5` semasa dalam README Bab 2 dan `agents.md`
- **🧪 Contoh pengesahan bengkel** (output `azd version`) dikemas kini ke `1.27.1`

#### Nota mengenai pelepasan azd yang berkaitan (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Sokongan Go untuk Azure Functions pada Flex Consumption, penapis langganan per-tenant `azd config sub-filter`, bundel sambungan kendiri (`azd x pack --bundle`), dan `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Projek/agen Azure AI Foundry dimodelkan terus dalam `azure.yaml` (inisialisasi tanpa Bicep/Terraform), sokongan penyebaran kontena untuk App Service (`host: appservice` + `language: docker`), `-s/--source` terus untuk perintah `azd extension`, dan `azd tool uninstall`
- **1.27.1 (2026-07-09):** Bendera `--no-dependencies` untuk `azd extension install`, model yang tidak digunakan dikecualikan secara lalai dari katalog/cadangan kuota, dan beberapa pembaikan pepijat

#### Fail Dikemas Kini
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

#### Isian Kekosongan Pemula #2: Penghasilan Templat, Bekas Pembangunan, Pulumi, Azure DevOps, Prinsipal Perkhidmatan, dan Lain-lain
**Versi ini menutup jurang peringkat sederhana yang tinggal yang dikenalpasti oleh analisis liputan azd: cara menghasilkan dan menerbitkan templat sendiri, persekitaran bekas pembangunan/Codespaces yang boleh dihasilkan semula, penyedia infrastruktur Pulumi, panduan CI/CD Azure DevOps, pengesahan prinsip perkhidmatan, panduan pemilihan hos (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, pengendalian ralat kait, dan amalan persekitaran berkongsi/pasukan.**

#### Ditambah
- **🧱 Pelajaran Bab 4 baru** `docs/chapter-04-infrastructure/custom-templates.md` — menghasilkan templat azd sendiri: struktur diperlukan (`azure.yaml`, `infra/`, `src/`), medan `metadata.template`, parameterisasi infrastruktur dengan token sumber `uniqueString()` dan tag `azd-env-name`, ujian tempatan dengan `azd init --template <local-path>`, penerbitan ke GitHub, dan penghantaran ke galeri Awesome AZD
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/dev-containers.md` — persekitaran azd boleh dihasilkan semula dengan Bekas Pembangunan dan GitHub Codespaces: `.devcontainer/devcontainer.json` minimal menggunakan ciri rasmi `ghcr.io/azure/azure-dev/azd`, ciri khusus bahasa, `docker-in-docker` untuk hos kontena, dan `azd auth login --use-device-code` untuk log masuk jauh
- **🧩 Pulumi dengan azd** bahagian dalam `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, susunan folder Pulumi, timbunan dipetakan ke persekitaran azd, output/tagging diperlukan, dan aliran kerja `azd up` / `azd down` yang sama
- **🎯 Panduan pemilihan hos** dalam `docs/chapter-04-infrastructure/provisioning.md` — perbandingan mesra pemula mengenai `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan bila memilih AKS atau Azure Spring Apps
- **🛠️ Panduan langkah demi langkah Azure DevOps CI/CD** dalam `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, sambungan perkhidmatan dengan persekutuan identiti beban kerja (OIDC), `azure-dev.yml` yang dihasilkan, dan persediaan kumpulan pembolehubah
- **🔑 Prinsipal Perkhidmatan (Corak 4)** ditambah ke `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` tanpa interaksi dengan rahsia klien berbanding kelayakan persekutuan/OIDC, bila digunakan, dan penyimpanan kelayakan selamat
- **🪝 Pengendalian ralat kait** subseksyen dalam `docs/chapter-04-infrastructure/deployment-guide.md` — kod keluar dan `set -e`, `continueOnError`, menguji kait secara terasing dengan `azd hooks run`, shell khusus OS, dan `--debug`
- **👥 Persekitaran pasukan/berkongsi** bahagian dalam `docs/chapter-03-configuration/configuration.md` — apa yang tinggal dalam `.azure/`, apa yang harus di gitignore, persekitaran setiap pembangun, `azd env list`/`select`, dan penyediaan nilai persekitaran dalam CI/CD
- **🧰 `azd restore` dan penjelasan diperluas `azd package`** dalam `resources/cheat-sheet.md` — memulihkan kebergantungan dan membina artifak yang boleh disebarkan tanpa menyebarkannya

#### Diubah
- **🧭 Jadual pelajaran Bab 4** dikemas kini untuk memasukkan pelajaran baru "Menghasilkan Templat Sendiri" (Pelajaran 3)
- **🧭 Jadual pelajaran Bab 1** dikemas kini untuk memasukkan pelajaran baru "Bekas Pembangunan & Codespaces" (Pelajaran 5); footer navigasi dihubungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Isian Kekosongan Pemula: Pelajaran Multi-Agen Praktikal, "Bawa Aplikasi Sendiri," Terraform, dan Panduan CI/CD
**Versi ini menutup jurang terbesar untuk panduan lengkap pemula dengan menambah dua pelajaran praktikal baru (panduan multi-agen yang boleh disebarkan dan menambah azd ke aplikasi sedia ada), pengenalan kait mesra pemula, bahagian Terraform dengan azd, panduan langkah demi langkah pipeline GitHub Actions, penjelasan sambungan pratonton baru, dan senarai semak pengesahan penyebaran yang jelas.**

#### Ditambah
- **🤝 Pelajaran Bab 5 baru** `docs/chapter-05-multi-agent/multi-agent-basics.md` — panduan dua agen yang sepenuhnya praktikal dan boleh disebarkan (perancang + pakar) menggunakan templat sebenar (`contoso-creative-writer`), meliputi bila menggunakan multi-agen, aliran kerja `azd up`, memahami sumber yang disebarkan, penjejakan silang agen, pengubahsuaian, dan pembersihan
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambah azd ke projek sedia ada dengan `azd init` ("gunakan kod dalam direktori semasa"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, pengesanan hos, dan penyebaran dengan `azd up`
- **🌐 Terraform dengan azd** bahagian ditambah dalam `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, susunan folder `.tf`, output `AZURE_*` dan penandaan `azd-env-name` yang diperlukan, dan aliran kerja `azd up` / `azd down` yang sama (menutup jurang di mana sokongan Terraform dikatakan ada tetapi hanya Bicep ditunjukkan)
- **⚙️ Panduan langkah demi langkah GitHub Actions** dalam `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke penyebaran automatik: `azd pipeline config`, kelayakan persekutuan OIDC (tiada rahsia disimpan), `azure-dev.yml` yang dihasilkan, dan panduan rahsia berbanding pembolehubah
- **🪝 Pengenalan "Baru kepada kait?" untuk pemula** dalam `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu kait, jadual tahap kait, kait pertama yang minimal, dan menjalankan kait secara manual dengan `azd hooks run`
- **✅ Senarai semak "Sahkan Penyebaran Anda"** ditambah pada Langkah 5 `docs/chapter-01-foundation/first-project.md` — ujian asap, pemeriksaan titik akhir kesihatan, dan kriteria kejayaan jelas
- **🧩 Penjelasan untuk sambungan pratonton baru** `azure.ai.skills` dan `azure.ai.connections` (apa mereka dan bila menggunakannya) dalam `docs/chapter-08-production/production-ai-practices.md`

#### Diubah
- **🧭 Jadual pelajaran Bab 5** diperbetulkan: `multi-agent-basics.md` kini Pelajaran 1 (satu-satunya pelajaran yang sepenuhnya praktikal), dengan label jujur bahawa Pelajaran 2 berada di Bab 6 dan senario Runcit adalah cetak biru seni bina, bukan templat satu perintah
- **🧭 Jadual pelajaran Bab 1** kini termasuk pelajaran baru "Bawa Aplikasi Sendiri" (Pelajaran 4)
- **🔗 Footer navigasi** dikemas kini: `first-project.md` kini memautkan ke hadapan ke `bring-your-own-app.md`

#### Diperbetulkan
- **🧱 Menutup jurang Terraform "dituntut tetapi hilang"** — kursus sebelum ini merujuk sokongan Terraform tanpa menunjukkannya
- **🔀 Membetulkan pautan silang Bab 5 yang mengelirukan** yang seolah-olah menunjukkan pelaksanaan multi-agen penuh wujud sedangkan hanya cetak biru seni bina sahaja

#### Fail Dikemas Kini
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

#### Penyegaran AZD 1.25.6, Arahan Kitaran Hayat Ejen Penuh & Penjenamaan Semula Aspire
**Versi ini mengesahkan semula kursus terhadap `azd` `1.25.6` (Jun 2026) dan peluasan `azure.ai.agents` `0.1.40-preview`, mengembangkan panduan AI dari "mengrangka ejen" kepada kitaran hayat ejen lengkap (uji → nilai → optimalkan → periksa → padam), memaparkan peluasan pratonton baru `azure.ai.skills` dan `azure.ai.connections`, serta mencatat penjenamaan semula produk ".NET Aspire" → "Aspire".**

#### Ditambah
- **🔁 Liputan kitaran hayat ejen penuh** untuk pemula dan jurutera AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Jadual kitaran hayat (rangkap → uji → ukur → baiki → periksa → bersihkan) ditambah ke bahagian Peluasan dan Arahan AI
  - `docs/chapter-08-production/production-ai-practices.md` — Seksyen baru "Mengurus Kitaran Hayat Ejen" meliputi `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perluasan Arahan Ejen AI dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Peluasan pratonton baru** didokumentasikan: `azure.ai.skills` (kemahiran ejen boleh guna semula) dan `azure.ai.connections` (sambungan Foundry) ditambah ke jadual peluasan dan helaian cheat
- **⏱️ Panduan masa respons** — contoh `azd ai agent invoke` kini mencatat jumlah sela masa dan masa-ke-bait-pertama
- **📌 Sepanduk versi** dalam README akar mengarahkan pelajar ke `azd version` dan `azd upgrade`

#### Diubah
- **✅ Baseline pengesahan dikemas kini** dari `azd 1.23.12` (Mac 2026) ke `azd 1.25.6` (Jun 2026) di semua README bab dan dokumen bengkel
- **🤖 Nota peluasan Bab 2** dikemas kini dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh pengesahan bengkel** (output `azd version`) dikemas kini ke `1.25.6`
- **🧭 README "Apa Yang Baru dalam azd Hari Ini"** disegarkan untuk menonjolkan kitaran hayat ejen menyeluruh, peluasan AI baru, dan pembaikan kualiti hidup terkini (`azd init` idempotensi, `azd auth login` pembersihan token lapuk, `azd tool` prompt pertama kali)
- **📖 Bab 2 agents.md (Pilihan 4)** kini mengarahkan pelajar kepada arahan kitaran hayat selepas penyebaran dan bukannya berhenti di `azd up`

#### Dibaiki
- **🏷️ Penamaan produk** — menambah nota penjenamaan semula Aspire (".NET Aspire" kini hanya "Aspire"); sokongan azd untuk Aspire tidak berubah
- **🔎 Pengesahan keluaran langsung** disahkan terhadap suapan keluaran Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) dan `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fail Dikemas Kini
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

#### Penjelasan Penyediaan Pemula, Pengesahan Setup & Pembersihan Arahan AZD Akhir
**Versi ini mengikuti imbasan pengesahan AZD 1.23 dengan pemeriksaan dokumentasi fokus pemula: ia menjelaskan panduan pengesahan AZD-pertama, menambah skrip pengesahan penyediaan tempatan, mengesahkan arahan utama terhadap Azure CLI AZD langsung, dan membuang rujukan arahan sumber bahasa Inggeris usang terakhir di luar nota perubahan.**

#### Ditambah
- **🧪 Skrip pengesahan penyediaan pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` supaya pelajar dapat mengesahkan alat diperlukan sebelum memulakan Bab 1
- **✅ Langkah pengesahan penyediaan awal** dalam README akar dan README Bab 1 supaya kekurangan prasyarat dikesan sebelum `azd up`

#### Diubah
- **🔐 Panduan pengesahan pemula** kini konsisten menganggap `azd auth login` sebagai laluan utama untuk aliran kerja AZD, dengan `az login` disebut sebagai pilihan kecuali arahan Azure CLI digunakan secara langsung
- **📚 Aliran onboarding Bab 1** kini mengarahkan pelajar mengesahkan penyediaan tempatan mereka sebelum pemasangan, pengesahan, dan langkah penyebaran pertama
- **🛠️ Mesej pemeriksa** kini memisahkan dengan jelas keperluan yang menghalang dari amaran Azure CLI pilihan untuk laluan pemula hanya AZD
- **📖 Dokumen konfigurasi, penyelesaian masalah, dan contoh** kini membezakan antara pengesahan AZD wajib dan log masuk Azure CLI pilihan di mana kedua-duanya sebelum ini dipersembahkan tanpa konteks

#### Dibaiki
- **📋 Rujukan arahan sumber bahasa Inggeris yang tinggal** dikemas kini ke bentuk AZD semasa, termasuk `azd config show` dalam helaian cheat dan `azd monitor --overview` di mana panduan gambaran portal Azure dimaksudkan
- **🧭 Tuntutan pemula dalam Bab 1** dilunakkan untuk mengelakkan janji berlebihan tingkah laku tanpa ralat terjamin atau rollback di semua templat dan sumber Azure
- **🔎 Pengesahan CLI langsung** disahkan sokongan semasa untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

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

#### Pengesahan AZD 1.23.12, Perluasan Persekitaran Bengkel & Penyegaran Model AI
**Versi ini melaksanakan imbasan pengesahan dokumentasi terhadap `azd` `1.23.12`, mengemas kini contoh arahan AZD yang lapuk, menyegar panduan model AI kepada lalai semasa, dan meluaskan arahan bengkel melebihi GitHub Codespaces untuk juga menyokong bekas dev dan klon tempatan.**

#### Ditambah
- **✅ Nota pengesahan merentasi bab teras dan dokumen bengkel** untuk menjadikan baseline AZD yang diuji jelas untuk pelajar menggunakan binaan CLI lebih baru atau lebih lama
- **⏱️ Panduan tamat masa penyebaran** untuk penyebaran aplikasi AI berjalankan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah pemeriksaan peluasan** dengan `azd extension show azure.ai.agents` dalam dokumen aliran kerja AI
- **🌐 Panduan persekitaran bengkel lebih luas** merangkumi GitHub Codespaces, bekas dev, dan klon tempatan dengan MkDocs

#### Diubah
- **📚 README pengenalan bab** kini konsisten mencatat pengesahan terhadap `azd 1.23.12` merentasi asas, konfigurasi, infrastruktur, pelbagai ejen, pra-penyebaran, penyelesaian masalah, dan seksyen pengeluaran
- **🛠️ Rujukan arahan AZD** dikemas kini ke bentuk semasa merentasi dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` bergantung pada konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` di mana gambaran ringkas Application Insights dimaksudkan
- **🧪 Contoh pratonton selesai** dipermudahkan ke penggunaan disokong semasa seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Aliran bengkel** dikemas kini supaya pelajar boleh melengkapkan makmal dalam Codespaces, bekas dev, atau klon tempatan dan bukannya menganggap pelaksanaan hanya Codespaces
- **🔐 Panduan pengesahan** kini mengutamakan `azd auth login` untuk aliran kerja AZD, dengan `az login` diletakkan sebagai pilihan apabila arahan Azure CLI digunakan secara langsung

#### Dibaiki
- **🪟 Arahan pasang Windows** dinormalkan ke pengepala pakej `winget` semasa dalam panduan pemasangan
- **🐧 Panduan pasang Linux** diperbetulkan untuk mengelakkan arahan pengurus pakej distro-spesifik `azd` yang tidak disokong dan sebaliknya mengarahkan kepada aset keluaran yang sesuai
- **📦 Contoh model AI** disegarkan daripada lalai lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` kepada contoh semasa seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Petikan penyebaran dan diagnostik** diperbetulkan untuk menggunakan arahan persekitaran dan status semasa dalam log, skrip, dan langkah penyelesaian masalah
- **⚙️ Panduan GitHub Actions** dikemas kini dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** dikemas kini dari `azd mcp consent` ke `azd copilot consent list`

#### Diperbaiki
- **🧠 Panduan bab AI** kini lebih baik menjelaskan tingkah laku sensitif pratonton `azd ai`, log masuk khusus penyewa, penggunaan peluasan semasa, dan cadangan penyebaran model dikemas kini
- **🧪 Arahan bengkel** kini menggunakan contoh versi lebih realistik dan bahasa penyediaan persekitaran lebih jelas untuk makmal praktikal
- **📈 Dokumen pengeluaran dan penyelesaian masalah** kini sejajar lebih baik dengan pemantauan semasa, model laluan keluar, dan contoh tahap kos

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

#### Arahan AZD AI CLI, Pengesahan Kandungan & Perluasan Templat
**Versi ini menambah liputan arahan `azd ai`, `azd extension`, dan `azd mcp` merentasi semua bab berkaitan AI, membaiki pautan rosak dan kod usang dalam agents.md, mengemas kini helaian cheat, dan memperbaharui seksyen Templat Contoh dengan deskripsi yang disahkan dan templat Azure AI AZD baru.**

#### Ditambah
- **🤖 Liputan AZD AI CLI** merentasi 7 fail (sebelumnya hanya dalam Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Seksyen baru "Pelanjutan dan Arahan AI" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pilihan 4: `azd ai agent init` dengan jadual perbandingan (templat vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — "Peluasan AZD untuk Foundry" dan subseksyen "Penyebaran Ejen-Pertama"
  - `docs/chapter-05-multi-agent/README.md` — Mula Cepat kini menunjukkan laluan penyebaran berasaskan templat dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Seksyen Penyebaran kini termasuk pilihan `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — subseksyen "Arahan Peluasan AZD AI untuk Diagnostik"
  - `resources/cheat-sheet.md` — Seksyen baru "Arahan AI & Pelanjutan" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan sokongan sembang suara
  - **azure-search-openai-demo-java** — Chat RAG Java menggunakan Langchain4J dengan pilihan penyebaran ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif berbilang ejen menggunakan Perkhidmatan Ejen Azure AI, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa pelayan menggunakan Azure Functions + LangChain.js + Cosmos DB dengan sokongan dev tempatan Ollama
  - **chat-with-your-data-solution-accelerator** — Pemecut Enterprise RAG dengan portal pentadbir, integrasi Teams, dan pilihan PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi rujukan orkestrasi MCP ejen pelbagai dengan pelayan dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat permulaan Bicep infrastruktur Azure AI minimal
  - **🔗 Pautan Galeri AZD AI Hebat** — Rujukan kepada [awesome-azd AI gallery](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Diperbaiki
- **🔗 navigasi agents.md**: Pautan Sebelumnya/Seterusnya kini sepadan dengan urutan pelajaran README Bab 2 (Integrasi Microsoft Foundry → Agen → Penyebaran Model AI)
- **🔗 pautan rosak agents.md**: `production-ai-practices.md` diperbetulkan kepada `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 kod usang agents.md**: Gantikan `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak sah agents.md**: Pindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 kiraan token agents.md**: Gantikan anggaran kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Betulkan perkhidmatan daripada "Cognitive Search + App Service" kepada "Azure AI Search + Azure Container Apps" (hos lalai ditukar Okt 2024)
- **contoso-chat**: Kemas kini penerangan untuk merujuk Azure AI Foundry + Prompty, sepadan dengan tajuk dan susunan teknologi repo sebenar

#### Dibuang
- **ai-document-processing**: Buang rujukan templat tidak berfungsi (repo tidak boleh diakses secara awam sebagai templat AZD)

#### Dipertingkatkan
- **📝 latihan agents.md**: Latihan 1 kini menunjukkan output yang dijangka dan langkah `azd monitor`; Latihan 2 termasuk kod pendaftaran `FunctionTool` lengkap; Latihan 3 menggantikan panduan samar dengan arahan `prepdocs.py` konkrit
- **📚 sumber agents.md**: Kemas kini pautan dokumentasi kepada dokumen Azure AI Agent Service semasa dan panduan permulaan pantas
- **📋 Jadual Langkah Seterusnya agents.md**: Tambah pautan AI Workshop Lab untuk liputan bab lengkap

#### Fail Dikemas Kini
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

#### Ditukar
- **Jadual Peta Kursus**: Dipertingkatkan dengan pautan pelajaran langsung, anggaran tempoh, dan penarafan kerumitan
- **Pembersihan Folder**: Buang folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pengesahan Pautan**: Semua 21+ pautan dalaman dalam Jadual Peta Kursus disahkan

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk
**Versi ini mengemas kini rujukan produk kepada penjenamaan Microsoft semasa.**

#### Ditukar
- **Microsoft Foundry → Microsoft Foundry**: Semua rujukan dikemas kini di seluruh fail bukan terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama perkhidmatan dikemas kini untuk mencerminkan penjenamaan terkini

#### Fail Dikemas Kini
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

#### Penyusunan Semula Repositori Besar: Nama Folder Berdasarkan Bab
**Versi ini menyusun semula dokumentasi ke dalam folder khusus bab untuk navigasi yang lebih jelas.**

#### Penamaan Semula Folder
Folder lama telah diganti dengan folder bernombor bab:
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
| Semua fail pra-penyebaran | pre-deployment/ | chapter-06-pre-deployment/ |
| Semua fail penyelesaian masalah | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambah
- **📚 Fail README Bab**: Cipta README.md dalam setiap folder bab dengan:
  - Objektif pembelajaran dan tempoh
  - Jadual pelajaran dengan penerangan
  - Arahan mula pantas
  - Navigasi ke bab lain

#### Ditukar
- **🔗 Kemaskini semua pautan dalaman**: 78+ laluan dikemas kini di semua fail dokumentasi
- **🗺️ README.md Utama**: Kemas kini Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Kemas kini rujukan silang kepada folder bab

#### Dibuang
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Penyusunan Semula Repositori: Navigasi Bab
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan AI Agents Baru
**Versi ini menambah panduan komprehensif untuk penyebaran ejen AI dengan Azure Developer CLI.**

#### Ditambah
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap merangkumi:
  - Apa itu ejen AI dan bagaimana ia berbeza dari chatbot
  - Tiga templat permulaan pantas ejen (Foundry Agents, Prompty, RAG)
  - Corak seni bina ejen (ejen tunggal, RAG, multi-ejen)
  - Konfigurasi dan penyesuaian alat
  - Pemantauan dan penjejakan metrik
  - Pertimbangan kos dan pengoptimuman
  - Senario penyelesaian masalah biasa
  - Tiga latihan amali dengan kriteria kejayaan

#### Struktur Kandungan
- **Pengenalan**: Konsep ejen untuk pemula
- **Mula Pantas**: Sebar ejen dengan `azd init --template get-started-with-ai-agents`
- **Corak Seni Bina**: Diagram visual corak ejen
- **Konfigurasi**: Persediaan alat dan pembolehubah persekitaran
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran amali progresif (20-45 minit setiap satu)

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer
**Versi ini mengemas kini konfigurasi kontena pembangunan dengan alat moden dan tetapan lalai lebih baik untuk pengalaman pembelajaran AZD.**

#### Ditukar
- **🐳 Imej Asas**: Dikemas kini dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terkini)
- **📛 Nama Kontena**: Ditukar dari "Python 3" ke "AZD untuk Pemula" untuk kejelasan

#### Ditambah
- **🔧 Ciri Baru Dev Container**:
  - `azure-cli` dengan sokongan Bicep diaktifkan
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk pengurusan templat
  - `docker-in-docker` untuk penyebaran aplikasi kontena

- **🔌 Terusan Port**: Port pra-konfigurasi untuk pembangunan biasa:
  - 8000 (pratonton MkDocs)
  - 3000 (aplikasi Web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Sambungan VS Code Baru**:
  - `ms-python.vscode-pylance` - IntelliSense Python dipertingkat
  - `ms-azuretools.vscode-azurefunctions` - Sokongan Azure Functions
  - `ms-azuretools.vscode-docker` - Sokongan Docker
  - `ms-azuretools.vscode-bicep` - Sokongan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pengurusan sumber Azure
  - `yzhang.markdown-all-in-one` - Penyuntingan Markdown
  - `DavidAnson.vscode-markdownlint` - Penyemak pemformatan Markdown
  - `bierner.markdown-mermaid` - Sokongan diagram Mermaid
  - `redhat.vscode-yaml` - Sokongan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Sejarah Git

- **⚙️ Tetapan VS Code**: Ditambah tetapan lalai untuk penafsir Python, format semasa simpan, dan trim ruang putih

- **📦 Kemas Kini fail requirements-dev.txt**:
  - Ditambah pemalam minify MkDocs
  - Ditambah pre-commit untuk kualiti kod
  - Ditambah pakej Azure SDK (azure-identity, azure-mgmt-resource)

#### Diperbaiki
- **Perintah Pasca-Ciptaan**: Kini mengesahkan pemasangan AZD dan Azure CLI semasa permulaan kontena

---

### [v3.11.0] - 2026-02-05

#### Pembaikan README Mesra Pemula
**Versi ini secara signifikan memperbaiki README.md untuk lebih mudah diakses pemula dan menambah sumber penting untuk pembangun AI.**

#### Ditambah
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas bila menggunakan setiap alat dengan contoh praktikal
- **🌟 Pautan Hebat AZD**: Pautan langsung ke galeri templat komuniti dan sumber penyumbang:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templat sedia guna
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti
- **🎯 Panduan Mula Pantas**: Bahagian permulaan 3 langkah mudah (Pasang → Log Masuk → Sebar)
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas tempat untuk mula berdasarkan pengalaman pembangun

#### Ditukar
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat utama dahulu
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" untuk pemula lengkap
- **Buang Kandungan Pendua**: Buang bahagian penyelesaian masalah pendua
- **Perintah Penyelesaian Masalah**: Betulkan rujukan `azd logs` untuk menggunakan `azd monitor --logs` yang sah

#### Diperbaiki
- **🔐 Perintah Pengesahan**: Ditambah `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Rujukan Perintah Tidak Sah**: Buang baki `azd logs` dari bahagian troubleshooting README

#### Nota
- **Skop**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Sasaran Audiens**: Penambahbaikan khusus untuk pembangun baru kepada AZD

---

### [v3.10.0] - 2026-02-05

#### Kemas Kini Ketepatan Perintah Azure Developer CLI
**Versi ini membetulkan perintah AZD yang tidak wujud dalam dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Diperbaiki
- **🔧 Perintah AZD Tidak Wujud Dibuang**: Audit dan pembetulan menyeluruh perintah tidak sah:
  - `azd logs` (tidak wujud) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI
  - subperintah `azd service` (tidak wujud) → digantikan dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak wujud) → dibuang atau digantikan alternatif sah
  - flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dibuang
  - flag `azd provision --what-if/--rollback` (tidak wujud) → dikemas kini untuk guna `--preview`
  - `azd config validate` (tidak wujud) → digantikan dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dibuang

- **📚 Fail Dikemas Kini dengan Pembetulan Perintah**:
  - `resources/cheat-sheet.md`: Pengubahsuaian besar rujukan perintah
  - `docs/deployment/deployment-guide.md`: Betulkan strategi rollback dan penyebaran
  - `docs/troubleshooting/debugging.md`: Betulkan bahagian analisis log
  - `docs/troubleshooting/common-issues.md`: Kemas kini perintah penyelesaian masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan bahagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Membetulkan arahan pemantauan
  - `docs/getting-started/first-project.md`: Mengemas kini contoh pemantauan dan penyahpepijatan
  - `docs/getting-started/installation.md`: Memperbaiki contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Membetulkan arahan melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Memperbaiki arahan penyahpepijatan agen

- **📝 Rujukan Versi Dikemas Kini**: 
  - `docs/getting-started/installation.md`: Menukar versi hardcoded `1.5.0` kepada versi generik `1.x.x` dengan pautan ke siaran

#### Berubah
- **Strategi Rollback**: Dikemas kini dokumentasi untuk menggunakan rollback berasaskan Git (AZD tidak mempunyai rollback asli)
- **Melihat Log**: Menggantikan rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan arahan Azure CLI
- **Bahagian Prestasi**: Membuang bendera pelaksanaan selari/incremental yang tidak wujud, menyediakan alternatif sah

#### Butiran Teknikal
- **Arahan AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera azd monitor Sah**: `--live`, `--logs`, `--overview`
- **Ciri-ciri Dikeluarkan**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Arahan disahkan terhadap Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Kemas Kini Penyelesaian Bengkel dan Kualiti Dokumentasi
**Versi ini melengkapkan modul bengkel interaktif, memperbetulkan semua pautan dokumentasi yang rosak, dan meningkatkan kualiti keseluruhan kandungan untuk pembangun AI yang menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen garis panduan sumbangan baru dengan:
  - Arahan jelas untuk melaporkan isu dan mencadangkan perubahan
  - Piawaian dokumentasi untuk kandungan baru
  - Garis panduan contoh kod dan konvensi mesej commit
  - Maklumat penglibatan komuniti

#### Selesai
- **🎯 Modul Bengkel 7 (Penutup)**: Modul penutup lengkap dengan:
  - Ringkasan menyeluruh pencapaian bengkel
  - Bahagian konsep utama yang dikuasai merangkumi AZD, templat, dan Microsoft Foundry
  - Cadangan untuk meneruskan perjalanan pembelajaran
  - Latihan cabaran bengkel dengan penilaian tahap kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Pecahan)**: Objektif pembelajaran dikemas kini dengan:
  - Panduan pengaktifan GitHub Copilot dengan pelayan MCP
  - Pemahaman struktur folder templat AZD
  - Corak organisasi infrastruktur sebagai kod (Bicep)
  - Arahan makmal praktikal

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Diselesaikan dengan:
  - Objektif pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk deprovisioning infrastruktur yang selamat
  - Panduan pemulihan perkhidmatan kognitif yang dipadam secara lembut
  - Cadangan penerokaan bonus untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Pembaikan Pautan Rosak**: Menyelesaikan lebih 15 pautan dokumentasi dalaman yang rosak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki laluan ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Membetulkan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Menggantikan cicd-integration.md yang tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki laluan FAQ dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Membetulkan laluan rumah kursus dan panduan pelaksanaan
  - `resources/faq.md` dan `resources/glossary.md`: Mengemas kini rujukan bab AI
  - `course-outline.md`: Memperbaiki panduan pengajar dan rujukan makmal bengkel AI

- **📅 Banner Status Bengkel**: Dikemas kini dari "Sedang Dibina" menjadi status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Memperbaiki pautan navigasi rosak dalam README.md bengkel yang menunjuk ke folder lab-1-azd-basics yang tidak wujud

#### Berubah
- **Persembahan Bengkel**: Menghapuskan amaran "sedang dibina", bengkel kini lengkap dan sedia digunakan
- **Konsistensi Navigasi**: Memastikan semua modul bengkel mempunyai navigasi inter-modul yang betul
- **Rujukan Jalan Pembelajaran**: Mengemas kini rujukan silang bab untuk menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown Bahasa Inggeris mempunyai pautan dalaman yang sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan betul
- ✅ Kandungan sesuai untuk pembangun AI yang menggunakan Microsoft AZD
- ✅ Bahasa mesra pemula dan struktur dikekalkan sepanjang masa
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan dalaman .md
- **Audit Kandungan**: Semakan manual keutuhan bengkel dan kesesuaian untuk pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul konsisten diterapkan

#### Nota
- **Skop**: Perubahan dikenakan hanya untuk dokumentasi Bahasa Inggeris
- **Terjemahan**: Folder terjemahan tidak dikemas kini dalam versi ini (terjemahan automatik akan diselaraskan kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan 3-4 jam pembelajaran praktikal

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Pelbagai Agen
**Versi ini menambah pelajaran lengkap kelas A mengenai integrasi Application Insights, corak pengesahan, dan koordinasi pelbagai agen untuk pelaksanaan pengeluaran.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Pelaksanaan berfokus AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri khusus (lebih 1,200 baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Model Microsoft Foundry)
  - 6 rajah Mermaid (senibina, pengesanan teragih, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh pertanyaan Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan penyahpepijatan masa sebenar
  - Masa pembelajaran 40-50 minit dengan corak bersedia pengeluaran

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, identiti terurus)
  - Templat infrastruktur Bicep lengkap untuk pelaksanaan selamat
  - Kod aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (dayakan identiti terurus, identiti ditugaskan pengguna, putaran Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan bersedia produksi

- **🤖 Pelajaran Corak Koordinasi Pelbagai Agen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (bersiri, selari, hierarki, dipacu acara, konsensus)
  - Pelaksanaan perkhidmatan pengatur cara lengkap (Python/Flask, lebih 1,500 baris)
  - 3 pelaksanaan agen khusus (Penyelidikan, Penulis, Penyunting)
  - Integrasi Service Bus untuk antrian mesej
  - Pengurusan status Cosmos DB untuk sistem teragih
  - 6 rajah Mermaid menunjukkan interaksi agen
  - 3 latihan lanjutan (pengendalian had masa, logik cuba semula, pemutus litar)
  - Perincian kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-pelaksanaan**: Kini termasuk corak pemantauan dan koordinasi menyeluruh
- **Bab Memulakan**: Ditingkatkan dengan corak pengesahan profesional
- **Kesediaan Pengeluaran**: Liputan lengkap dari keselamatan ke kebolehlihatan
- **Garis Panduan Kursus**: Dikemas kini untuk merujuk pelajaran baru dalam Bab 3 dan 6

#### Berubah
- **Progres Pembelajaran**: Integrasi lebih baik keselamatan dan pemantauan dalam kursus
- **Kualiti Dokumentasi**: Piawaian kelas A konsisten (95-97%) untuk pelajaran baru
- **Corak Pengeluaran**: Liputan lengkap hujung ke hujung untuk pelaksanaan perusahaan

#### Diperbaiki
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan pengeluaran
- **Piawaian Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Kebolehlihatan**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Model Microsoft Foundry dan sistem pelbagai agen

#### Disahkan
- ✅ Semua pelajaran termasuk kod berfungsi lengkap (bukan petikan)
- ✅ Rajah Mermaid untuk pembelajaran visual (19 jumlah dalam 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 jumlah)
- ✅ Templat Bicep bersedia produksi boleh dilaksanakan melalui `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Titik pemeriksaan pengetahuan dengan arahan pengesahan

#### Keputusan Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan menyeluruh
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Senibina pelbagai agen lanjutan
- **Kandungan Baharu Keseluruhan**: - Piawaian kualiti tinggi konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri khusus + pengesanan teragih
- **Pengesahan**: Identiti Terurus + Key Vault + corak RBAC
- **Pelbagai Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, dasar pengekalan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualiti Dokumentasi dan Contoh Model Microsoft Foundry Baru
**Versi ini meningkatkan kualiti dokumentasi di seluruh repositori dan menambah contoh pelaksanaan lengkap Model Microsoft Foundry dengan antara muka chat gpt-4.1.**

#### Ditambah
- **🤖 Contoh Chat Model Microsoft Foundry**: Pelaksanaan gpt-4.1 lengkap dengan pelaksanaan berfungsi dalam `examples/azure-openai-chat/`:
  - Infrastruktur Model Microsoft Foundry lengkap (pelaksanaan model gpt-4.1)
  - Antara muka chat baris arahan Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Had kadar dan pengendalian ralat
  - README komprehensif dengan panduan pelaksanaan 35-45 minit
  - 11 fail bersedia pengeluaran (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambah latihan praktikal dalam panduan konfigurasi:
  - Latihan 1: Konfigurasi pelbagai persekitaran (15 minit)
  - Latihan 2: Amalan pengurusan rahsia (10 minit)
  - Kriteria kejayaan dan langkah pengesahan yang jelas
- **✅ Pengesahan Pelaksanaan**: Menambah bahagian pengesahan dalam panduan pelaksanaan:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output yang dijangka untuk semua arahan pelaksanaan
  - Rujukan pantas penyelesaian masalah

#### Ditingkatkan
- **examples/README.md**: Dikemas kini ke kualiti kelas A (93%):
  - Ditambah azure-openai-chat ke semua bahagian berkaitan
  - Bilangan contoh tempatan dikemas kini dari 3 ke 4
  - Ditambah ke jadual Contoh Aplikasi AI
  - Diintegrasikan ke dalam Permulaan Pantas untuk Pengguna Pertengahan
  - Ditambah ke bahagian Templat Microsoft Foundry
  - Dikemas kini Matriks Perbandingan dan bahagian penemuan teknologi
- **Kualiti Dokumentasi**: Ditingkatkan dari B+ (87%) ke A- (92%) keseluruhannya di folder docs:
  - Ditambah output yang dijangka kepada contoh arahan penting
  - Termasuk langkah pengesahan untuk perubahan konfigurasi
  - Meningkatkan pembelajaran praktikal dengan latihan praktikal

#### Berubah
- **Progres Pembelajaran**: Integrasi lebih baik contoh AI untuk pelajar pertengahan
- **Struktur Dokumentasi**: Latihan lebih boleh dilaksanakan dengan hasil yang jelas
- **Proses Pengesahan**: Kriteria kejayaan jelas ditambah kepada aliran kerja utama

#### Diperbaiki
- **Pengalaman Pembangun**: Pelaksanaan Model Microsoft Foundry kini mengambil 35-45 minit (berbanding 60-90 untuk alternatif kompleks)
- **Ketelusan Kos**: Anggaran kos jelas ($50-200/bulan) untuk contoh Model Microsoft Foundry
- **Jalan Pembelajaran**: Pembangun AI mempunyai titik masuk jelas dengan azure-openai-chat
- **Piawaian Dokumentasi**: Output yang dijangka dan langkah pengesahan konsisten

#### Disahkan
- ✅ Contoh Model Microsoft Foundry berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan sintaks betul
- ✅ Arahan README sepadan dengan pengalaman pelaksanaan sebenar
- ✅ Pautan dokumentasi dikemas kini di lebih 8 lokasi
- ✅ Indeks contoh tepat menggambarkan 4 contoh tempatan
- ✅ Tiada pautan luaran berganda dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Senibina Model Microsoft Foundry**: gpt-4.1 + Key Vault + corak Container Apps
- **Keselamatan**: Identiti Terurus bersedia, rahsia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Pelaksanaan**: Arahan `azd up` tunggal untuk penyediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemas Kini Utama: Contoh Pelaksanaan Aplikasi Container
**Versi ini memperkenalkan contoh pelaksanaan aplikasi container lengkap, bersedia produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke dalam jalan pembelajaran.**

#### Ditambah
- **🚀 Contoh Aplikasi Container**: Contoh tempatan baru dalam `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Gambaran lengkap mengenai penyebaran berasaskan kontena, permulaan pantas, produksi, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala-ke-nol, ujian kesihatan, pemantauan, dan penyelesaian masalah
  - [Seni Bina Mikroservis](../../examples/container-app/microservices): Penyebaran multi-perkhidmatan sedia produksi (API Gateway, Produk, Pesanan, Pengguna, Pemberitahuan), pemesejan tak segerak, Service Bus, Cosmos DB, Azure SQL, penjejakan teragih, penyebaran biru-hijau/canary
- **Amalan Terbaik**: Keselamatan, pemantauan, pengoptimuman kos, dan panduan CI/CD untuk beban kerja berasaskan kontena
- **Contoh Kod**: Penuh `azure.yaml`, templat Bicep, dan pelaksanaan perkhidmatan berbilang bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung-ke-hujung, arahan pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemaskini untuk memaparkan dan memaut contoh aplikasi kontena baru di bawah "Contoh Tempatan - Aplikasi Kontena"
- **examples/README.md**: Dikemaskini untuk menyerlahkan contoh aplikasi kontena, menambah entri matriks perbandingan, dan mengemas kini rujukan teknologi/seni bina
- **Garis Kursus & Panduan Kajian**: Dikemaskini untuk merujuk contoh aplikasi kontena baru dan corak penyebaran dalam bab berkaitan

#### Disahkan
- ✅ Semua contoh baru boleh disebarkan dengan `azd up` dan mengikuti amalan terbaik
- ✅ Cross-link dokumentasi dan navigasi dikemaskini
- ✅ Contoh merangkumi senario dari pemula ke lanjutan, termasuk mikroservis produksi

#### Nota
- **Skop**: Dokumentasi dan contoh bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak kontena lanjutan tambahan dan automasi CI/CD dalam keluaran akan datang

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk yang menyeluruh dari "Microsoft Foundry" kepada "Microsoft Foundry" di seluruh dokumentasi bahasa Inggeris, mencerminkan penjenamaan rasmi Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula sepenuhnya dari "Microsoft Foundry" kepada "Microsoft Foundry"
  - Dikemas kini semua rujukan dalam dokumentasi bahasa Inggeris dalam folder `docs/`
  - Penamaan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Penamaan semula fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini merangkumi 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula kepada `docs/microsoft-foundry/`
  - Semua cross-referensi dikemas kini untuk mencerminkan struktur folder baru
  - Pautan navigasi disahkan merentas semua dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini merujuk nama fail baru

#### Fail Dikemaskini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari kemas kini terdahulu)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan cross-referensi dikemas kini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemas kini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemas kini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemas kini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemas kini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran keseluruhan kursus, tajuk bab, bahagian templat, pandangan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran keseluruhan, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen Inggeris
- ✅ Tiada lagi rujukan nama produk "Microsoft Foundry" dalam dokumen Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baru
- ✅ Penamaan semula fail dan folder berjaya diselesaikan
- ✅ Cross-referensi antara bab disahkan

#### Nota
- **Skop**: Perubahan diterapkan hanya pada dokumentasi bahasa Inggeris dalam folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk penamaan lama (akan ditangani dalam kemas kini akan datang)
- **Pautan Luaran**: URL luaran dan rujukan repositori GitHub kekal tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cabang tempatan atau dokumentasi yang merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dokumentasi dalaman masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratonton Infrastruktur dan Peningkatan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton baru Azure Developer CLI dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan komprehensif keupayaan pratonton infrastruktur baru
  - Rujukan arahan dan contoh penggunaan dalam senarai ringkas
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan awal untuk pengesahan penyebaran lebih selamat
  - Kemas kini panduan permulaan dengan amalan penyebaran keselamatan terlebih dahulu
- **🚧 Banner Status Bengkel**: Sepanduk HTML profesional yang menunjukkan status pembangunan bengkel
  - Reka bentuk gradien dengan penunjuk pembinaan untuk komunikasi pengguna yang jelas
  - Cap waktu kemas kini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Dipertingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton diintegrasikan merentas dokumentasi penyebaran
- **Pengesahan Pra-penyebaran**: Skrip automatik kini merangkumi ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan arahan dikemaskini untuk termasuk pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan jelas ditetapkan untuk pengguna mengenai status kandungan pembangunan

#### Diubah
- **Amalan Terbaik Penyebaran**: Aliran kerja pratonton-dulu kini disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan ke awal proses pembelajaran
- **Persembahan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan yang jelas

#### Ditingkatkan
- **Pendekatan Keselamatan Terlebih Dahulu**: Perubahan infrastruktur kini boleh disahkan sebelum penyebaran
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Pemahaman lebih baik mengenai kos sumber sebelum penyediaan
- **Mitigasi Risiko**: Mengurangkan kegagalan penyebaran melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-dokumen**: Ciri pratonton didokumentasikan merentas 4 fail utama
- **Corak Arahan**: Sintaks konsisten dan contoh dalam seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton disertakan dalam aliran kerja dan skrip pengesahan
- **Penunjuk Visual**: Penandaan ciri BARU yang jelas untuk penemuan

#### Infrastruktur Bengkel
- **Komunikasi Status**: Sepanduk HTML profesional dengan gaya gradien
- **Pengalaman Pengguna**: Status pembangunan jelas mengelakkan kekeliruan
- **Persembahan Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap waktu kemas kini terakhir Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel menyeluruh dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan kemampuan pratonton MkDocs
- **📝 Arahan Bengkel Berstruktur**: Laluan pembelajaran berpandu 7 langkah dari penemuan hingga pengubahsuaian
  - 0-Pengenalan: Gambaran keseluruhan bengkel dan persediaan
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat
  - 2-Pengesahan-Templat-AI: Prosedur penyebaran dan pengesahan
  - 3-Pembongkaran-Templat-AI: Memahami seni bina templat
  - 4-Konfigurasi-Templat-AI: Konfigurasi dan pengubahsuaian
  - 5-Pengubahsuaian-Templat-AI: Pengubahsuaian lanjutan dan iterasi
  - 6-Pembongkaran-Infrastruktur: Pembersihan dan pengurusan sumber
  - 7-Pengakhiran: Rumusan dan langkah seterusnya
- **🛠️ Alat Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran dipertingkat
- **🎯 Laluan Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Penyebaran → Pengubahsuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan lancar

#### Dipertingkatkan
- **Makmal AI Bengkel**: Diperluaskan dengan pengalaman pembelajaran berstruktur selama 2-3 jam
- **Dokumentasi Bengkel**: Persembahan profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah jelas dari pemilihan templat hingga penyebaran produksi
- **Pengalaman Pembangun**: Alat bersepadu untuk aliran kerja pembangunan yang lancar

#### Ditingkatkan
- **Kebolehcapaian**: Antara muka berasaskan pelayar dengan fungsi carian, salin, dan togol tema
- **Pembelajaran Kendiri**: Struktur bengkel fleksibel memenuhi kelajuan pembelajaran berbeza
- **Aplikasi Praktikal**: Senario penyebaran templat AI dunia nyata
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan dan kolaborasi bengkel

#### Ciri Bengkel
- **Carian Terbina Dalam**: Penemuan kata kunci dan pelajaran pantas
- **Salin Blok Kod**: Fungsi hover-untuk-salin untuk semua contoh kod
- **Togol Tema**: Sokongan mod gelap/terang untuk keutamaan berbeza
- **Aset Visual**: Tangkapan skrin dan rajah untuk pemahaman dipertingkat
- **Integrasi Bantuan**: Akses langsung Discord untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penstrukturan Semula Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab menyeluruh dengan navigasi dipertingkat merentasi keseluruhan repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menstruktur semula keseluruhan kursus kepada 8 bab pembelajaran progresif
  - Bab 1: Asas & Permulaan Pantas (⭐ - 30-45 minit)
  - Bab 2: Pembangunan AI-Pertama (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Pelbagai Ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan Pra-Penyebaran & Perancangan (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Pengesan Ralat (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Produksi & Perniagaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Tajuk navigasi dan footer konsisten merentas semua dokumentasi
- **🎯 Penjejakan Progres**: Senarai semak penyempurnaan kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Laluan Pembelajaran**: Titik masuk jelas untuk tahap pengalaman dan matlamat berbeza
- **🔗 Navigasi Cross-Referensi**: Bab berkaitan dan prasyarat dihubungkan dengan jelas

#### Dipertingkatkan
- **Struktur README**: Ditukar menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap halaman kini termasuk konteks bab dan panduan progres
- **Organisasi Templat**: Contoh dan templat dipetakan kepada bab pembelajaran yang sesuai
- **Integrasi Sumber**: Lembaran ringkas, FAQ, dan panduan kajian dihubungkan ke bab berkaitan
- **Integrasi Bengkel**: Makmal amali dipetakan kepada beberapa objektif pembelajaran bab

#### Diubah
- **Progres Pembelajaran**: Berpindah dari dokumentasi linear ke pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi diletakkan semula sebagai Bab 3 untuk aliran pembelajaran lebih baik
- **Integrasi Kandungan AI**: Integrasi kandungan khusus AI lebih baik sepanjang perjalanan pembelajaran
- **Kandungan Produksi**: Corak lanjutan dikumpulkan dalam Bab 8 untuk pelajar perusahaan

#### Ditingkatkan
- **Pengalaman Pengguna**: Navigasi breadcrumb yang jelas dan penunjuk progres bab
- **Kebolehcapaian**: Corak navigasi konsisten untuk memudahkan laluan kursus
- **Persembahan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa diperpendek mencari kandungan berkaitan melalui organisasi dipertingkat

#### Pelaksanaan Teknikal
- **Tajuk Navigasi**: Navigasi bab distandardkan merentas lebih 40 fail dokumentasi
- **Navigasi Footer**: Panduan progres konsisten dan penunjuk penyempurnaan bab
- **Cross-Linking**: Sistem pautan dalaman komprehensif menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh jelas dikaitkan dengan objektif pembelajaran

#### Peningkatan Panduan Kajian
- **📚 Objektif Pembelajaran Komprehensif**: Panduan kajian distruktur semula selaras dengan sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab merangkumi objektif pembelajaran khusus dan latihan praktikal
- **📋 Penjejakan Progres**: Jadual pembelajaran mingguan dengan hasil boleh diukur dan senarai semak penyempurnaan
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti praktikal dengan senario penyebaran sebenar dan penyelesaian masalah
- **📊 Progres Kemahiran**: Kemajuan jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya
- **🎓 Rangka Kerja Pensijilan**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran berstruktur 10 minggu dengan pengesahan pencapaian

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Pelbagai Ejen Ditingkatkan
**Versi ini memperbaiki penyelesaian runcit pelbagai ejen dengan penamaan ejen lebih baik dan dokumentasi dipertingkatkan.**

#### Diubah
- **Terminologi Multi-Ejen**: Menggantikan "agen Cora" dengan "agen Pelanggan" di seluruh penyelesaian multi-ejen runcit untuk pemahaman yang lebih jelas
- **Senibina Ejen**: Mengemas kini semua dokumentasi, templat ARM, dan contoh kod untuk menggunakan nama "agen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodenkan corak konfigurasi agen dengan konvensyen penamaan terkini
- **Konsistensi Dokumentasi**: Memastikan semua rujukan menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Pakej Templat ARM**: Mengemas kini retail-multiagent-arm-template dengan rujukan agen Pelanggan
- **Rajah Senibina**: Menyegarkan rajah Mermaid dengan penamaan agen yang dikemas kini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pembolehubah Persekitaran**: Mengemas kini semua skrip pelaksanaan untuk menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pembangun**: Peranan dan tanggungjawab agen lebih jelas dalam dokumentasi
- **Kesiapan Pengeluaran**: Keserasian yang lebih baik dengan konvensyen penamaan perusahaan
- **Bahan Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan
- **Kebolehgunaan Templat**: Memudahkan kefahaman fungsi agen dan corak pelaksanaan

#### Perincian Teknikal
- Mengemas kini rajah senibina Mermaid dengan rujukan CustomerAgent
- Menggantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Mengubah konfigurasi JSON templat ARM untuk menggunakan jenis agen "customer"
- Mengemas kini pembolehubah persekitaran dari CORA_AGENT_* ke corak CUSTOMER_AGENT_*
- Menyegarkan semua arahan pelaksanaan dan konfigurasi bekas

### [v3.0.0] - 2025-09-12

#### Perubahan Utama - Fokus Pembangun AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran berfokus AI yang komprehensif dengan integrasi Microsoft Foundry.**

#### Ditambah
- **🤖 Laluan Pembelajaran AI-First**: Struktur lengkap yang memprioritaskan pembangun dan jurutera AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi komprehensif untuk menyambungkan AZD dengan perkhidmatan Microsoft Foundry
- **Corak Pelaksanaan Model AI**: Panduan terperinci merangkumi pemilihan model, konfigurasi, dan strategi pelaksanaan pengeluaran
- **Makmal Bengkel AI**: Bengkel praktikal 2-3 jam untuk menukar aplikasi AI kepada penyelesaian boleh dilaksanakan AZD
- **Amalan Terbaik AI Pengeluaran**: Corak bersedia perusahaan untuk penskalaan, pemantauan, dan keselamatan beban kerja AI
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah lengkap untuk Model Microsoft Foundry, Cognitive Services, dan isu pelaksanaan AI
- **Galeri Templat AI**: Koleksi terpilih templat Microsoft Foundry dengan penarafan kerumitan
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan

#### Ditingkatkan
- **Struktur README**: Berfokus kepada pembangun AI dengan data minat komuniti 45% dari Microsoft Foundry Discord
- **Laluan Pembelajaran**: Perjalanan pembangun AI berdedikasi bersama laluan tradisional untuk pelajar dan jurutera DevOps
- **Cadangan Templat**: Templat AI terpilih termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komuniti**: Sokongan komuniti Discord dipertingkat dengan saluran dan perbincangan khusus AI

#### Fokus Keselamatan & Pengeluaran
- **Corak Identiti Terurus**: Pengesahan dan konfigurasi keselamatan khusus AI
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI
- **Pelaksanaan Multi-Wilayah**: Strategi untuk pelaksanaan aplikasi AI global
- **Pemantauan Prestasi**: Metrik khusus AI dan integrasi Application Insights

#### Kualiti Dokumentasi
- **Struktur Kursus Linear**: Progresi logik dari pola asas ke lanjutan dalam pelaksanaan AI
- **URL Sah**: Semua pautan repositori luaran disahkan dan boleh diakses
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi
- **Sedia untuk Pengeluaran**: Corak pelaksanaan perusahaan dengan contoh dunia sebenar

### [v2.0.0] - 2025-09-09

#### Perubahan Utama - Struktur Repositori dan Peningkatan Profesional
**Versi ini mewakili pengubahsuaian ketara struktur repositori dan penyampaian kandungan.**

#### Ditambah
- **Rangka Kerja Pembelajaran Berstruktur**: Semua halaman dokumentasi kini merangkumi Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Ditambah pautan Pelajaran Sebelumnya/Seterusnya di seluruh dokumentasi untuk panduan pembelajaran berperingkat
- **Panduan Kajian**: study-guide.md yang komprehensif dengan objektif pembelajaran, latihan amali, dan bahan penilaian
- **Pembentangan Profesional**: Menghapuskan semua ikon emoji untuk aksesibiliti dan penampilan profesional yang lebih baik
- **Struktur Kandungan Ditingkatkan**: Penataan dan aliran bahan pembelajaran dipertingkat

#### Diubah
- **Format Dokumentasi**: Menyeragamkan semua dokumentasi dengan struktur berfokus pembelajaran yang konsisten
- **Aliran Navigasi**: Melaksanakan progresi logik melalui semua bahan pembelajaran
- **Pembentangan Kandungan**: Menghapuskan elemen hiasan demi format yang jelas dan profesional
- **Struktur Pautan**: Mengemas kini semua pautan dalaman untuk menyokong sistem navigasi baru

#### Diperbaiki
- **Aksesibiliti**: Menghapuskan kebergantungan emoji untuk keserasian pembaca skrin yang lebih baik
- **Penampilan Profesional**: Pembentangan gaya akademik yang kemas sesuai untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil jelas bagi setiap pelajaran
- **Pengaturan Kandungan**: Aliran logik dan hubungan yang lebih baik antara topik berkaitan

### [v1.0.0] - 2025-09-09

#### Pelepasan Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambah
- **Struktur Dokumentasi Teras**
  - Siri panduan memulakan lengkap
  - Dokumentasi pelaksanaan dan penyediaan komprehensif
  - Sumber penyelesaian masalah terperinci dan panduan debugging
  - Alat dan prosedur pengesahan pra-pelaksanaan

- **Modul Memulakan**
  - Asas AZD: Konsep dan terminologi teras
  - Panduan Pemasangan: Arahan setup khusus platform
  - Panduan Konfigurasi: Penetapan persekitaran dan pengesahan
  - Tutorial Projek Pertama: Pembelajaran amali langkah demi langkah

- **Modul Pelaksanaan dan Penyediaan**
  - Panduan Pelaksanaan: Dokumentasi aliran kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kod dengan Bicep
  - Amalan terbaik untuk pelaksanaan pengeluaran
  - Corak senibina perkhidmatan pelbagai

- **Modul Pengesahan Pra-Pelaksanaan**
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure
  - Pemilihan SKU: Panduan terperinci tahap perkhidmatan
  - Pemeriksaan Pra-Terbang: Skrip pengesahan automatik (PowerShell dan Bash)
  - Alatan anggaran kos dan perancangan bajet

- **Modul Penyelesaian Masalah**
  - Isu Biasa: Masalah dan penyelesaian kerap ditemui
  - Panduan Debugging: Metodologi penyelesaian masalah sistematik
  - Teknik dan alat diagnostik maju
  - Pemantauan dan pengoptimuman prestasi

- **Sumber dan Rujukan**
  - Lembaran Cheat Perintah: Rujukan cepat arahan penting
  - Glosari: Definisi terminologi dan singkatan lengkap
  - Soalan Lazim: Jawapan terperinci untuk soalan biasa
  - Pautan sumber luaran dan sambungan komuniti

- **Contoh dan Templat**
  - Contoh Aplikasi Web Mudah
  - Templat pelaksanaan Laman Web Statik
  - Konfigurasi Aplikasi Bekas
  - Corak integrasi pangkalan data
  - Contoh senibina Mikroservis
  - Pelaksanaan fungsi tanpa pelayan

#### Ciri-ciri
- **Sokongan Multi-Platfom**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux
- **Pelbagai Tahap Kemahiran**: Kandungan direka untuk pelajar hingga pembangun profesional
- **Fokus Praktikal**: Contoh amali dan senario dunia sebenar
- **Liputan Menyeluruh**: Dari konsep asas hingga corak perusahaan lanjutan
- **Pendekatan Keselamatan Terlebih Dahulu**: Amalan terbaik keselamatan diintegrasi sepanjang
- **Pengoptimuman Kos**: Panduan pelaksanaan kos efektif dan pengurusan sumber

#### Kualiti Dokumentasi
- **Contoh Kod Terperinci**: Sampel kod praktikal yang diuji
- **Arahan Langkah demi Langkah**: Panduan jelas dan boleh dilaksanakan
- **Penanganan Ralat Komprehensif**: Penyelesaian masalah untuk isu biasa
- **Integrasi Amalan Terbaik**: Standard industri dan cadangan
- **Keserasian Versi**: Terkini dengan perkhidmatan Azure dan ciri azd terbaru

## Penambahbaikan Masa Depan yang Dirancang

### Versi 3.1.0 (Dirancang)
#### Pengembangan Platform AI
- **Sokongan Multi-Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model tersuai
- **Rangka Kerja Ejen AI**: Templat untuk pelaksanaan LangChain, Semantic Kernel, dan AutoGen
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **Observabiliti AI**: Pemantauan dipertingkat untuk prestasi model, penggunaan token, dan kualiti respons

#### Pengalaman Pembangun
- **Sambungan VS Code**: Pengalaman pembangunan bersepadu AZD + Microsoft Foundry
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengaturcaraan amali dengan pengesahan automatik untuk senario AI
- **Kandungan Video**: Tutorial video tambahan untuk pembelajar visual yang menumpukan pada pelaksanaan AI

### Versi 4.0.0 (Dirancang)
#### Corak AI Perusahaan
- **Rangka Kerja Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit
- **AI Multi-Penyewa**: Corak untuk melayani banyak pelanggan dengan perkhidmatan AI terasing
- **Pelaksanaan AI Tepi**: Integrasi dengan Azure IoT Edge dan contoh bekas
- **AI Awan Hibrid**: Corak pelaksanaan multi-awan dan hibrid untuk beban kerja AI

#### Ciri-ciri Lanjutan
- **Automasi Saluran AI**: Integrasi MLOps dengan saluran Azure Machine Learning
- **Keselamatan Lanjutan**: Corak zero-trust, titik akhir peribadi, dan perlindungan ancaman lanjutan
- **Pengoptimuman Prestasi**: Penalaan dan strategi penskalaan lanjutan untuk aplikasi AI berkapasiti tinggi
- **Pengedaran Global**: Corak penghantaran kandungan dan caching tepi untuk aplikasi AI

### Versi 3.0.0 (Dirancang) - Diganti oleh Pelepasan Semasa
#### Penambahan Cadangan - Kini Dilaksanakan dalam v3.0.0
- ✅ **Kandungan Berfokus AI**: Integrasi Microsoft Foundry komprehensif (Lengkap)
- ✅ **Tutorial Interaktif**: Makmal bengkel AI amali (Lengkap)
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Lengkap)
- ✅ **Pengoptimuman Prestasi**: Strategi penalaan beban kerja AI (Lengkap)

### Versi 2.1.0 (Dirancang) - Sebahagiannya Dilaksanakan dalam v3.0.0
#### Penambahbaikan Kecil - Sebahagian Selesai dalam Pelepasan Semasa
- ✅ **Contoh Tambahan**: Senario pelaksanaan berfokus AI (Lengkap)
- ✅ **FAQ Diperluas**: Soalan dan penyelesaian masalah khusus AI (Lengkap)
- **Integrasi Alat**: Panduan penyepaduan IDE dan editor yang dipertingkat
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan amaran khusus AI (Lengkap)

#### Masih Dirancang untuk Pelepasan Masa Depan
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih
- **Akses Luar Talian**: Pek dokumentasi boleh dimuat turun
- **Integrasi IDE Ditingkatkan**: Sambungan VS Code untuk aliran kerja AZD + AI
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan

## Menyumbang kepada Changelog

### Melaporkan Perubahan
Ketika menyumbang kepada repositori ini, sila pastikan entri changelog merangkumi:

1. **Nombor Versi**: Mengikuti penomboran semantik (utama.ciri.susun)
2. **Tarikh**: Tarikh pelepasan atau kemas kini dalam format YYYY-MM-DD
3. **Kategori**: Ditambah, Diubah, Ditangguhkan, Dibuang, Diperbaiki, Keselamatan
4. **Penerangan Jelas**: Penerangan ringkas tentang apa yang berubah
5. **Penilaian Impak**: Bagaimana perubahan mempengaruhi pengguna sedia ada

### Kategori Perubahan

#### Ditambah
- Ciri baru, seksyen dokumentasi, atau keupayaan
- Contoh baru, templat, atau sumber pembelajaran
- Alatan tambahan, skrip, atau utiliti

#### Diubah
- Pengubahsuaian fungsi atau dokumentasi sedia ada
- Kemas kini untuk meningkatkan kejelasan atau ketepatan
- Penstrukturan semula kandungan atau organisasi

#### Ditangguhkan
- Ciri atau pendekatan yang sedang dihentikan
- Seksian dokumentasi yang dijadual untuk pembuangan
- Kaedah yang mempunyai alternatif lebih baik

#### Dibuang
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan
- Maklumat sudah lapuk atau pendekatan yang ditangguhkan
- Kandungan berlebihan atau digabungkan

#### Diperbaiki
- Pembetulan kesilapan dalam dokumentasi atau kod
- Penyelesaian isu atau masalah yang dilaporkan
- Penambahbaikan ketepatan atau fungsi

#### Keselamatan
- Penambahbaikan atau pembetulan berkaitan keselamatan
- Kemas kini untuk amalan terbaik keselamatan
- Penyelesaian kerentanan keselamatan

### Garis Panduan Penomboran Semantik

#### Versi Utama (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Penstrukturan semula ketara kandungan atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi asas

#### Versi Minor (X.Y.0)
- Ciri baru atau penambahan kandungan
- Penambahbaikan yang mengekalkan keserasian belakang
- Contoh, alatan, atau sumber tambahan

#### Versi Patch (X.Y.Z)
- Pembetulan pepijat dan pembaikan
- Penambahbaikan kecil kepada kandungan sedia ada
- Penjelasan dan peningkatan kecil

## Maklum Balas dan Cadangan Komuniti

Kami menggalakkan maklum balas komuniti secara aktif untuk meningkatkan sumber pembelajaran ini:

### Cara Memberi Maklum Balas
- **Isu GitHub**: Laporkan masalah atau cadangkan penambahbaikan (isu khusus AI dialu-alukan)
- **Perbincangan Discord**: Kongsi idea dan sertai komuniti Microsoft Foundry
- **Permintaan Tarik**: Sumbangkan penambahbaikan langsung kepada kandungan, terutama templat dan panduan AI
- **Discord Microsoft Foundry**: Sertai saluran #Azure untuk perbincangan AZD + AI
- **Forum Komuniti**: Sertai perbincangan pembangun Azure yang lebih meluas

### Kategori Maklum Balas
- **Ketepatan Kandungan AI**: Pembetulan pada maklumat integrasi dan pelaksanaan perkhidmatan AI
- **Pengalaman Pembelajaran**: Cadangan untuk aliran pembelajaran pembangun AI yang lebih baik
- **Kandungan AI Hilang**: Permintaan templat, corak, atau contoh AI tambahan
- **Aksesibiliti**: Penambahbaikan untuk keperluan pembelajaran pelbagai
- **Integrasi Alat AI**: Cadangan untuk integrasi aliran kerja pembangunan AI yang lebih baik
- **Corak AI Pengeluaran**: Permintaan corak pelaksanaan AI perusahaan

### Komitmen Respons
- **Respons Isu**: Dalam masa 48 jam untuk masalah yang dilaporkan
- **Permintaan Ciri**: Penilaian dalam masa satu minggu
- **Sumbangan Komuniti**: Semakan dalam masa satu minggu
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan

## Jadual Penyelenggaraan

### Kemas Kini Berkala
- **Ulasan Bulanan**: Ketepatan kandungan dan pengesahan pautan
- **Kemas Kini Suku Tahun**: Penambahan dan penambahbaikan kandungan utama
- **Ulasan Setengah Tahun**: Penstrukturan semula dan penambahbaikan komprehensif
- **Pelepasan Tahunan**: Kemas kini versi utama dengan penambahbaikan signifikan

### Pemantauan dan Jaminan Kualiti
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala
- **Kemas Kini Teknologi**: Penyelarasan dengan perkhidmatan Azure terkini dan keluaran azd
- **Audit Kebolehcapaian**: Semakan berkala untuk prinsip reka bentuk inklusif

## Polisi Sokongan Versi

### Sokongan Versi Semasa
- **Versi Utama Terkini**: Sokongan penuh dengan kemas kini berkala
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembaikan kritikal selama 12 bulan
- **Versi Warisan**: Sokongan komuniti sahaja, tiada kemas kini rasmi

### Panduan Migrasi
Apabila versi utama dikeluarkan, kami menyediakan:
- **Panduan Migrasi**: Arahan peralihan langkah demi langkah
- **Nota Keserasian**: Butiran mengenai perubahan yang memecah keserasian
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi
- **Sokongan Komuniti**: Forum berdedikasi untuk soalan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)

**Sentiasa Dikemas Kini**: Tonton repositori ini untuk pemberitahuan tentang keluaran baru dan kemas kini penting kepada bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->