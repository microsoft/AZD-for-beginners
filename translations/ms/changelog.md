# Log Perubahan - AZD Untuk Pemula

## Pengenalan

Log perubahan ini mendokumentasikan semua perubahan ketara, kemas kini, dan penambahbaikan kepada repositori AZD Untuk Pemula. Kami mengikuti prinsip versi semantik dan menyelenggara log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan mengkaji log perubahan ini, anda akan:
- Sentiasa dimaklumkan tentang ciri baru dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Mengikuti pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas mengkaji entri log perubahan, anda akan dapat:
- Mengenal pasti kandungan baru dan sumber yang tersedia untuk pembelajaran
- Memahami bahagian mana yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Memberikan maklum balas dan cadangan untuk penambahbaikan masa depan

## Sejarah Versi

### [v3.25.0] - 2026-11-09

#### Sambungan Microsoft Foundry 1.0 kini tersedia umum

Bundel `microsoft.foundry` 1.0 adalah **langsung dan tersedia umum**, seperti yang diumumkan pada [5 November 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Kursus kini mengajar aliran kerja GA yang telah dikeluarkan, bukan pelepasan akan datang. Bermula dengan AZD **1.37.0 atau lebih baru** dan `azd ext install microsoft.foundry`.

#### Tersedia dalam kemas kini kursus ini
- Panduan Bahasa Inggeris menggunakan bundel GA sebagai laluan pemasangan lalai dan menerangkan tujuh sambungan teras yang bernombor versi secara bebas.
- [Panduan ejen hos-pelayan](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) merangkumi contoh API Respons Kerangka Ejen Python arus atas, uv semasa, Python 3.13+, pilihan projek baru/sedia ada, penggunaan semula model, dan semakan `azure.yaml`.
- Aliran kerja tempatan-ke-awan merangkumi ujian Pemeriksa Ejen, kos panggilan model sokongan Azure, binaan kod jauh, pelaksanaan yang dideploy, penjejakan awan, pratonton penyebaran, log, dan diagnostik.
- Panduan penilaian berasingan merangkumi penjanaan dan semakan set data/rubrik, konfigurasi penilaian bernama, pendaftaran aset, dan pemeriksaan keputusan. Arahan penilaian/pengoptimuman lama kekal sebagai sejarah migrasi, bukan garis dasar pelepasan semasa.
- Panduan CI/CD Foundry merangkumi pemasangan sambungan pelari, penyebaran yang diautentikasi, aset/akses penilaian, dan gerbang kualiti yang jelas.
- Panduan pembersihan membezakan projek Foundry yang baru dibuat dan digunakan semula. Bengkel memaut ke latihan GA berasingan tanpa menggantikan ujian spesifik contoh tersebut.
- Navigasi kursus, objektif pembelajaran, prasyarat persediaan, lembaran cheat, FAQ, dan panduan kajian mencerminkan aliran kerja GA. Terjemahan yang dijana tidak disunting secara manual.

#### Skop semakan
- Berdasarkan pengumuman GA, panduan Microsoft Learn yang dipautkan, dan konfigurasi contoh arus atas. Tiada penyediaan Azure langsung, penyebaran, pelaksanaan model, atau penilaian dilakukan.
- Bundel GA tidak bermaksud GA untuk setiap ciri pilihan, sambungan bebas, atau SDK, atau mengesahkan contoh untuk pengeluaran.

### [v3.24.0]- 2026-11-04

#### Diperbaiki
- Memperbaiki navigasi kursus Bahasa Inggeris, laluan halaman dipindahkan, jangkar hilang, dan rujukan luaran usang, termasuk pautan Bab 2 ke panduan AI pengeluaran.
- Menyemak panduan semasa berbanding AZD 1.37.2 yang diterbitkan, ejen 1.0.0-beta.23, dan penilaian 1.0.0-beta.2. Mendokumentasikan aliran kerja `azd ai eval` yang berasingan dan migrasi konfigurasi pengoptimuman.
- Membetulkan bendera CLI yang tidak disokong, sempadan pengesahan, panduan persekitaran/rahsia teks biasa, kemas kini infrastruktur, konfigurasi model, dan contoh pemulihan merosakkan.
- Menyegar semula bengkel berbanding contoh AI Agents semasa, termasuk wayar sebenar, input konfigurasi, ujian penilaian, titik kemasukan pengujian merah, dan pengamatan.
- Membetulkan dakwaan pelaksanaan contoh dan memperbaiki isu aplikasi/infrastruktur/konfigurasi berkaitan. Bahan seni bina runcit dibezakan secara jelas dari aplikasi kerja lengkap.
- Memulihkan matriks bahasa CodeQL, memilih Node.js 24 yang disokong untuk bekas pembangunan, dan membolehkan validator persediaan melaporkan arahan versi gagal.

#### Ditambah
- Pengecek pautan/jangkar luar talian Bahasa Inggeris sahaja, ujian regresi, dan aliran kerja dokumentasi yang juga membina bengkel dalam mod ketat. Terjemahan dijana dan imej diterjemah tidak disertakan.

#### Skop pengesahan
- Pemeriksaan sumber, sintaks, konfigurasi, tingkah laku tempatan, dan pautan rangkaian tidak menentukan kebolehgunaan penyebaran Azure langsung, kuota, RBAC, ketersediaan model serantau, pengebilan, pematuhan keselamatan, atau kesediaan pengeluaran.
- Entri lama di bawah adalah rekod sejarah, bukan arahan perintah atau pelepasan semasa.

### [v3.23.0] - 2026-07-13

#### Penyegaran AZD 1.27.1: Kemas Kini Matawang Versi
**Versi ini mengesahkan semula kursus berbanding `azd` `1.27.1` (Julai 2026, pelepasan stabil terkini) dan sambungan ejen AI pratonton semasa `azure.ai.agents` `1.0.0-beta.5`, membawa semua "disahkan berbanding" ke tarikh terkini selepas pelepasan 1.26.0, 1.27.0, dan 1.27.1.**

#### Diubah
- **✅ Asas pengesahan dikemas kini** dari `azd 1.25.6` (Jun 2026) ke `azd 1.27.1` (Julai 2026) merangkumi README akar, semua README bab, pelajaran dev-container Bab 1 (termasuk contoh versi tetap), pelajaran templat tersuai Bab 4, pelajaran multi-ejen Bab 5, dan dokumen bengkel
- **🤖 Asas Bab 2 disegarkan** dari `azd 1.23.12` (Mac 2026) ke `azd 1.27.1` merangkumi `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, dan `microsoft-foundry-integration.md`; tarikh nota pengesahan dikemas kini ke 2026-07-13
- **🧩 Sambungan ejen AI dinaikkan** dari `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ke pelepasan `1.0.0-beta.5` semasa dalam README Bab 2 dan `agents.md`
- **🧪 Contoh pengesahan bengkel** (`azd version` output) dikemas kini ke `1.27.1`

#### Nota mengenai pelepasan azd yang relevan (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Sokongan Go untuk Azure Functions pada Flex Consumption, penapis langganan sewa per-tenant `azd config sub-filter`, bundel sambungan berdiri sendiri (`azd x pack --bundle`), dan `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Projek/agen Model Azure AI Foundry terus dalam `azure.yaml` (init tanpa Bicep/Terraform), sokongan penyebaran bekas untuk App Service (`host: appservice` + `language: docker`), `-s/--source` terus untuk arahan `azd extension`, dan `azd tool uninstall`
- **1.27.1 (2026-07-09):** Bendera `--no-dependencies` untuk `azd extension install`, model yang sudah usang dikecualikan secara lalai dari petunjuk katalog/kuota, dan beberapa pembaikan pepijat

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

#### Jurang Pemula #2: Penghasilan Templat, Dev Containers, Pulumi, Azure DevOps, Prinsipal Perkhidmatan, dan Lain-lain
**Versi ini menutup jurang pertengahan yang tinggal yang didedahkan oleh analisis liputan azd: cara menghasilkan dan menerbitkan templat anda sendiri, persekitaran dev-container/Codespaces yang boleh dihasilkan semula, pembekal infrastruktur Pulumi, panduan CI/CD Azure DevOps, pengesahan prinsipal perkhidmatan, panduan pemilihan hos (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, pengendalian ralat cangkuk, dan amalan pasukan/persekitaran dikongsi.**

#### Ditambah
- **🧱 Pelajaran Bab 4 baru** `docs/chapter-04-infrastructure/custom-templates.md` — menghasilkan templat azd anda sendiri: struktur diperlukan (`azure.yaml`, `infra/`, `src/`), medan `metadata.template`, parameterisasi infrastruktur dengan token sumber `uniqueString()` dan tag `azd-env-name`, ujian secara tempatan dengan `azd init --template <local-path>`, penerbitan ke GitHub, dan penghantaran ke galeri Awesome AZD
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/dev-containers.md` — persekitaran azd boleh dihasilkan semula dengan Dev Containers dan GitHub Codespaces: minimal `.devcontainer/devcontainer.json` menggunakan ciri rasmi `ghcr.io/azure/azure-dev/azd`, ciri khusus bahasa, `docker-in-docker` untuk hos bekas, dan `azd auth login --use-device-code` untuk log masuk jauh
- **🧩 Pulumi dengan azd** dalam `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, susun atur folder Pulumi, timpa yang dipetakan ke persekitaran azd, output/tag yang diperlukan, dan aliran kerja `azd up` / `azd down` yang identik
- **🎯 Panduan pemilihan hos** dalam `docs/chapter-04-infrastructure/provisioning.md` — perbandingan mesra pemula antara `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan bila memilih AKS atau Azure Spring Apps
- **🛠️ Panduan Azure DevOps CI/CD** dalam `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, sambungan perkhidmatan dengan persekutuan identiti beban kerja (OIDC), `azure-dev.yml` yang dijana, dan penyediaan kumpulan pembolehubah  
- **🔑 Prinsipal Perkhidmatan (Corak 4)** ditambah ke `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` bukan interaktif dengan rahsia klien vs. kelayakan bersekutu/OIDC, bila untuk digunakan, dan penyimpanan kelayakan yang selamat  
- **🪝 Subbahagian pengendalian ralat Hook** dalam `docs/chapter-04-infrastructure/deployment-guide.md` — kod keluar dan `set -e`, `continueOnError`, menguji hook secara tersendirian dengan `azd hooks run`, shell khusus OS, dan `--debug`  
- **👥 Pasukan / persekitaran dikongsi** bahagian dalam `docs/chapter-03-configuration/configuration.md` — apa yang wujud dalam `.azure/`, apa yang perlu diabaikan git, persekitaran setiap pembangun, `azd env list`/`select`, dan menyediakan nilai persekitaran dalam CI/CD  
- **🧰 Penjelasan `azd restore` dan `azd package` yang diperluaskan** dalam `resources/cheat-sheet.md` — memulihkan pergantungan dan membina artifak yang boleh dikerahkan tanpa mendeploy  

#### Diubah  
- **🧭 Jadual pelajaran Bab 4** dikemas kini untuk memasukkan pelajaran "Menulis Templat Anda Sendiri" yang baru (Pelajaran 3)  
- **🧭 Jadual pelajaran Bab 1** dikemas kini untuk memasukkan pelajaran "Dev Containers & Codespaces" yang baru (Pelajaran 5); kaki navigasi dipasang antara `bring-your-own-app.md` dan `dev-containers.md`  

### [v3.21.0] - 2026-06-16  

#### Isian Jurang Pemula: Pelajaran Berbilang Ejen Praktikal, "Bawa App Anda Sendiri," Terraform, dan Panduan CI/CD  
**Versi ini menutup jurang terbesar untuk panduan lengkap pemula dengan menambah dua pelajaran praktikal baru (panduan dua ejen boleh dikerahkan dan menambah azd ke app sedia ada), pengenalan hook mesra pemula, bahagian Terraform-dengan-azd, panduan langkah demi langkah saluran GitHub Actions, penerangan tentang sambungan pratonton yang baru, dan senarai semak pengesahan deployment yang jelas.**  

#### Ditambah  
- **🤝 Pelajaran Bab 5 baru** `docs/chapter-05-multi-agent/multi-agent-basics.md` — panduan sepenuhnya praktikal, deployable dua ejen (orchestrator + pakar) menggunakan templat sebenar (`contoso-creative-writer`), merangkumi bila untuk menggunakan berbilang ejen, aliran kerja `azd up`, memahami sumber yang dikerahkan, penjejakan lintas-ejen, pengubahsuaian, dan pembersihan  
- **📦 Pelajaran Bab 1 baru** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambah azd ke projek sedia ada dengan `azd init` ("gunakan kod dalam direktori semasa"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, pengesanan hos, dan deployment dengan `azd up`  
- **🌐 Bahagian Terraform dengan azd** ditambah ke `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, susun atur folder `.tf`, output `AZURE_*` yang diperlukan dan penandaan `azd-env-name`, dan aliran kerja `azd up` / `azd down` yang serupa (menutup jurang di mana sokongan Terraform diisytiharkan tetapi hanya Bicep yang ditunjukkan)  
- **⚙️ Panduan langkah demi langkah GitHub Actions** dalam `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke deploy automatik: `azd pipeline config`, kelayakan federasi OIDC (tiada rahsia disimpan), `azure-dev.yml` yang dijana, dan panduan rahsia vs pemboleh ubah
- **🪝 Pengenalan "Baru dengan hook?" untuk pemula** dalam `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, jadual peringkat hook, hook pertama yang minimal, dan menjalankan hook secara manual dengan `azd hooks run`
- **✅ Senarai semak "Sahkan Deployment Anda"** ditambah ke Langkah 5 `docs/chapter-01-foundation/first-project.md` — ujian asap, semakan endpoint kesihatan, dan kriteria kejayaan yang jelas
- **🧩 Penjelasan untuk peluasan pratonton baru** `azure.ai.skills` dan `azure.ai.connections` (apa itu dan bila harus digunakan) dalam `docs/chapter-08-production/production-ai-practices.md`

#### Diubah
- **🧭 Jadual pelajaran Bab 5** diperbetulkan: `multi-agent-basics.md` kini adalah Pelajaran 1 (satu-satunya pelajaran hands-on sepenuhnya), dengan penandaan jujur bahawa Pelajaran 2 berada di Bab 6 dan senario Runcit adalah cetak biru seni bina, bukan templat satu arahan
- **🧭 Jadual pelajaran Bab 1** kini termasuk pelajaran baru "Bawa Aplikasi Anda Sendiri" (Pelajaran 4)
- **🔗 Footer Navigasi** dikemas kini: `first-project.md` kini paut ke depan ke `bring-your-own-app.md`

#### Dibaiki
- **🧱 Menutup jurang Terraform yang "dituntut tetapi hilang"** — kursus sebelumnya merujuk sokongan Terraform tanpa menunjukkan penggunaannya
- **🔀 Pembetulan pautan silang Bab 5 yang mengelirukan** yang memberi gambaran pelaksanaan pelbagai agen penuh wujud sedangkan hanya cetak biru seni bina yang ada

#### Fail Dikemas kini
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

#### Penyegaran AZD 1.25.6, Perintah Kitaran Hidup Agen Penuh & Rebranding Aspire
**Versi ini mengesahkan semula kursus terhadap `azd` `1.25.6` (Jun 2026) dan peluasan `azure.ai.agents` `0.1.40-preview`, mengembangkan panduan AI dari "membina agen" ke kitaran hidup agen lengkap (ujian → nilai → optima → semak → hapus), memperlihatkan peluasan pratonton baru `azure.ai.skills` dan `azure.ai.connections`, dan mencatatkan rebranding produk ".NET Aspire" → "Aspire".**

#### Ditambah
- **🔁 Liputan kitaran hidup agen penuh** untuk pemula dan jurutera AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Jadual Kitaran Hidup (bina → uji → ukur → baik pulih → semak → bersihkan) ditambah ke bahagian Pemaniksaan dan Perintah AI
  - `docs/chapter-08-production/production-ai-practices.md` — Bahagian baru "Mengurus Kitaran Hidup Agen" meliputi `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perintah AI Agen diperluaskan dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Peluasan pratonton baru** didokumentasi: `azure.ai.skills` (kemahiran agen guna semula) dan `azure.ai.connections` (sambungan Foundry) ditambah ke jadual peluasan dan helaian cheat
- **⏱️ Panduan masa tindak balas** — contoh `azd ai agent invoke` kini menyenaraikan jumlah latensi dan masa-ke-bait-pertama dicetak
- **📌 Sepanduk versi** dalam README akar menunjuk pelajar ke `azd version` dan `azd upgrade`

#### Diubah
- **✅ Talian asas pengesahan dikemas kini** dari `azd 1.23.12` (Mac 2026) ke `azd 1.25.6` (Jun 2026) di seluruh README bab dan dokumen bengkel
- **🤖 Nota peluasan Bab 2** dikemas kini dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh pengesahan bengkel** (output `azd version`) dikemas kini ke `1.25.6`
- **🧭 README "Apa Yang Baru hari ini di azd"** disegarkan untuk menyerlahkan kitaran hidup agen hujung ke hujung, peluasan AI baru, dan pembetulan kualiti hidup terkini (`azd init` idempotensi, `azd auth login` pembersihan token lapuk, `azd tool` prompt pertama kali)
- **📖 Bab 2 agents.md (Pilihan 4)** kini menunjukkan pelajar ke perintah kitaran hidup pasca-deploy dan bukan berhenti di `azd up`

#### Dibaiki
- **🏷️ Penamaan produk** — nota rebranding Aspire ditambah (".NET Aspire" kini hanya "Aspire"); sokongan azd Aspire tidak berubah
- **🔎 Pengesahan pelepasan langsung** disahkan terhadap saluran pelepasan CLI Pembangun Azure: CLI stabil `1.25.6` (2026-06-12) dan versi `azure.ai.agents` `0.1.40-preview` (2026-06-15)

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

#### Penjelasan Onboarding Pemula, Pengesahan Setup & Pembersihan Perintah AZD Akhir
**Versi ini mengikuti pemeriksaan pengesahan AZD 1.23 dengan lintasan dokumen fokus pemula: ia menjelaskan panduan pengesahan AZD-pertama, menambah skrip pengesahan setup lokal, mengesahkan perintah utama terhadap CLI AZD langsung, dan membuang rujukan arahan sumber Inggeris usang terakhir di luar changelog.**

#### Ditambah
- **🧪 Skrip pengesahan setup pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` supaya pelajar dapat mengesahkan alat diperlukan sebelum memulakan Bab 1
- **✅ Langkah pengesahan setup awal** dalam README akar dan README Bab 1 supaya pra-syarat yang hilang dikesan sebelum `azd up`

#### Diubah
- **🔐 Panduan pengesahan pemula** kini secara konsisten menganggap `azd auth login` sebagai laluan utama untuk aliran kerja AZD, dengan `az login` ditandai sebagai pilihan kecuali perintah Azure CLI digunakan secara langsung
- **📚 Aliran onboarding Bab 1** kini mengarahkan pelajar untuk mengesahkan setup lokal sebelum pemasangan, pengesahan, dan langkah deploy pertama
- **🛠️ Mesej Validator** kini memisahkan keperluan perlu dan amaran Azure CLI pilihan untuk laluan AZD sahaja dengan jelas
- **📖 Konfigurasi, penyelesaian masalah, dan dokumen contoh** kini membezakan antara pengesahan AZD wajib dan log masuk Azure CLI pilihan di mana sebelum ini kedua-duanya dipersembahkan tanpa konteks

#### Dibaiki
- **📋 Rujukan arahan sumber Inggeris yang tinggal** dikemas kini ke bentuk AZD semasa, termasuk `azd config show` dalam helaian cheat dan `azd monitor --overview` di mana panduan gambaran portal Azure dimaksudkan
- **🧭 Tuntutan pemula dalam Bab 1** dilembutkan untuk mengelakkan janji berlebihan tentang kelakuan tanpa ralat atau rollback dijamin di semua templat dan sumber Azure
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

#### Pengesahan AZD 1.23.12, Pengembangan Persekitaran Bengkel & Penyegaran Model AI
**Versi ini menjalankan pemeriksaan pengesahan dokumentasi terhadap `azd` `1.23.12`, mengemas kini contoh perintah AZD usang, menyegarkan panduan model AI ke lalai terkini, dan meluaskan arahan bengkel selain GitHub Codespaces untuk menyokong kontena dev dan klon lokal juga.**

#### Ditambah
- **✅ Nota pengesahan merentasi bab teras dan dokumen bengkel** supaya garisan asas AZD yang diuji jelas untuk pelajar menggunakan binaan CLI yang lebih baru atau lebih lama
- **⏱️ Panduan masa tamat deploy** untuk deploy aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah pemeriksaan peluasan** dengan `azd extension show azure.ai.agents` dalam dokumen aliran kerja AI
- **🌐 Panduan persekitaran bengkel lebih luas** meliputi GitHub Codespaces, kontena dev, dan klon lokal dengan MkDocs

#### Diubah
- **📚 README intro Bab** kini secara konsisten menyatakan pengesahan terhadap `azd 1.23.12` merentas asas, konfigurasi, infrastruktur, multi-agen, pra-deploy, penyelesaian masalah, dan seksyen produksi
- **🛠️ Rujukan perintah AZD** dikemas kini ke bentuk semasa di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` bergantung konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` di mana gambaran Application Insights dimaksudkan
- **🧪 Contoh provision pratonton** dipermudahkan ke penggunaan disokong semasa seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Aliran bengkel** dikemas kini supaya pelajar boleh menamatkan makmal dalam Codespaces, kontena dev, atau klon lokal dan bukan andaian pelaksanaan hanya Codespaces
- **🔐 Panduan pengesahan** kini lebih mengutamakan `azd auth login` untuk aliran kerja AZD, dengan `az login` sebagai pilihan bila perintah Azure CLI digunakan terus

#### Dibaiki
- **🪟 Perintah pemasangan Windows** dinormalisasi ke casing pakej `winget` terkini dalam panduan pemasangan
- **🐧 Panduan pemasangan Linux** diperbetulkan untuk mengelak arahan pengurus pakej distro khusus `azd` yang tidak disokong dan sebaliknya menunjuk ke aset pelepasan bila berkenaan
- **📦 Contoh model AI** disegarkan daripada lalai lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` ke contoh semasa seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Petikan deploy dan diagnostik** diperbetulkan untuk menggunakan persekitaran dan perintah status semasa dalam log, skrip, dan langkah penyelesaian masalah
- **⚙️ Panduan GitHub Actions** dikemas kini dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan persetujuan MCP/Copilot** dikemas kini dari `azd mcp consent` ke `azd copilot consent list`

#### Diperbaiki
- **🧠 Panduan bab AI** kini menerangkan dengan lebih baik kelakuan sensitif pratonton `azd ai`, log masuk khusus tenant, penggunaan peluasan semasa, dan cadangan pengedaran model dikemas kini
- **🧪 Arahan bengkel** kini menggunakan contoh versi yang lebih realistik dan bahasa setup persekitaran yang lebih jelas untuk makmal hands-on
- **📈 Dokumen produksi dan penyelesaian masalah** kini lebih selaras dengan pemantauan semasa, model fallback, dan contoh tahap kos

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

#### Perintah CLI AI AZD, Pengesahan Kandungan & Pengembangan Templat
**Versi ini menambah liputan arahan `azd ai`, `azd extension`, dan `azd mcp` di semua bab berkaitan AI, membaiki pautan yang rosak dan kod lapuk dalam agents.md, mengemas kini lembaran helah, dan mengubahsuai bahagian Templat Contoh dengan penerangan yang disahkan serta templat Azure AI AZD baru.**

#### Ditambah
- **🤖 Liputan AZD AI CLI** merentasi 7 fail (sebelumnya hanya dalam Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bahagian baru "Sambungan dan Arahan AI" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pilihan 4: `azd ai agent init` dengan jadual perbandingan (templat vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseksyen "Sambungan AZD untuk Foundry" dan "Penghantaran Berfokuskan Ejen"
  - `docs/chapter-05-multi-agent/README.md` — Permulaan Pantas kini menunjukkan kedua-dua laluan penghantaran berasaskan templat dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bahagian Penghantaran kini termasuk pilihan `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subseksyen "Arahan Sambungan AZD AI untuk Diagnostik"
  - `resources/cheat-sheet.md` — Bahagian baru "Arahan AI & Sambungan" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Chat RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan sokongan chat suara
  - **azure-search-openai-demo-java** — Chat RAG Java menggunakan Langchain4J dengan pilihan penghantaran ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif berbilang ejen menggunakan Perkhidmatan Ejen Azure AI, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa pelayan menggunakan Azure Functions + LangChain.js + Cosmos DB dengan sokongan pembangunan tempatan Ollama
  - **chat-with-your-data-solution-accelerator** — Pemecut RAG perusahaan dengan portal pentadbir, integrasi Teams, dan pilihan PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi rujukan orkestrasi MCP berbilang ejen dengan pelayan dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat permulaan Bicep infrastruktur Azure AI minimal
  - **🔗 Pautan Galeri AZD AI Hebat** — Rujukan kepada [galeri hebat-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Dibaiki
- **🔗 Navigasi agents.md**: Pautan Sebelumnya/Seterusnya kini sepadan dengan susunan pelajaran dalam Bab 2 README (Integrasi Microsoft Foundry → Ejen → Penghantaran Model AI)
- **🔗 Pautan rosak agents.md**: `production-ai-practices.md` diperbetulkan kepada `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 Kod lapuk agents.md**: Menggantikan `opencensus` dengan `azure-monitor-opentelemetry` + OpenTelemetry SDK
- **🐛 API tidak sah agents.md**: Memindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Pengiraan token agents.md**: Menggantikan anggaran kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Membaiki perkhidmatan daripada "Cognitive Search + App Service" kepada "Azure AI Search + Azure Container Apps" (hos lalai ditukar Okt 2024)
- **contoso-chat**: Mengemas kini penerangan untuk merujuk Azure AI Foundry + Prompty, sepadan dengan tajuk dan teknologi repo sebenar

#### Dibuang
- **ai-document-processing**: Membuang rujukan templat yang tidak berfungsi (repo tidak boleh diakses secara umum sebagai templat AZD)

#### Diperbaiki
- **📝 Latihan agents.md**: Latihan 1 kini menunjukkan output yang dijangka dan langkah `azd monitor`; Latihan 2 termasuk keseluruhan kod pendaftaran `FunctionTool`; Latihan 3 menggantikan panduan samar dengan arahan `prepdocs.py` yang konkrit
- **📚 Sumber agents.md**: Mengemas kini pautan dokumentasi kepada dokumen Azure AI Agent Service dan permulaan pantas semasa
- **📋 Jadual Langkah Seterusnya agents.md**: Menambah pautan Makmal Bengkel AI untuk liputan bab lengkap

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

#### Peningkatan Navigasi Kursus
**Versi ini memperbaiki navigasi bab README.md dengan format jadual yang dipertingkatkan.**

#### Ditukar
- **Jadual Peta Kursus**: Dipertingkat dengan pautan pelajaran langsung, anggaran tempoh, dan penilaian kerumitan
- **Pembersihan Folder**: Membuang folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pengesahan Pautan**: Semua 21+ pautan dalaman dalam jadual Peta Kursus disahkan

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk
**Versi ini mengemas kini rujukan produk kepada penjenamaan Microsoft terkini.**

#### Ditukar
- **Microsoft Foundry → Microsoft Foundry**: Semua rujukan dikemas kini merentasi fail bukan penterjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama perkhidmatan dikemas kini untuk mencerminkan penjenamaan terkini

#### Fail Dikemas Kini
- `README.md` - Laman muncul utama kursus
- `changelog.md` - Sejarah versi
- `course-outline.md` - Struktur kursus
- `docs/chapter-02-ai-development/agents.md` - Panduan ejen AI
- `examples/README.md` - Dokumentasi contoh
- `workshop/README.md` - Laman muncul bengkel
- `workshop/docs/index.md` - Indeks bengkel
- `workshop/docs/instructions/*.md` - Semua fail arahan bengkel

---

### [v3.15.0] - 2026-02-05

#### Penstrukturan Semula Repositori Utama: Nama Folder Berdasarkan Bab
**Versi ini menstruktur semula dokumentasi ke folder berpandukan bab untuk navigasi yang lebih jelas.**

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
| Semua fail pra-penghantaran | pre-deployment/ | chapter-06-pre-deployment/ |
| Semua fail penyelesaian masalah | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambah
- **📚 Fail README Bab**: Membuat README.md di setiap folder bab dengan:
  - Objektif pembelajaran dan tempoh
  - Jadual pelajaran dengan penerangan
  - Arahan permulaan pantas
  - Navigasi ke bab lain

#### Ditukar
- **🔗 Mengemas kini semua pautan dalaman**: 78+ laluan dikemas kini merentasi semua fail dokumentasi
- **🗺️ README.md Utama**: Mengemas kini Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Mengemas kini rujukan silang ke folder bab

#### Dibuang
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Penstrukturan Semula Repositori: Navigasi Bab
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Ejen AI Baru
**Versi ini menambah panduan menyeluruh untuk penghantaran ejen AI dengan Azure Developer CLI.**

#### Ditambah
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap merangkumi:
  - Apakah ejen AI dan bagaimana ia berbeza daripada chatbot
  - Tiga templat ejen permulaan pantas (Foundry Agents, Prompty, RAG)
  - Corak seni bina ejen (ejen tunggal, RAG, berbilang ejen)
  - Konfigurasi dan pengubahsuaian alat
  - Pemantauan dan penjejakan metrik
  - Pertimbangan kos dan pengoptimuman
  - Senario penyelesaian masalah biasa
  - Tiga latihan amali dengan kriteria kejayaan

#### Struktur Kandungan
- **Pengenalan**: Konsep ejen untuk pemula
- **Permulaan Pantas**: Menghantar ejen dengan `azd init --template get-started-with-ai-agents`
- **Corak Seni Bina**: Rajah visual corak ejen
- **Konfigurasi**: Persediaan alat dan pembolehubah persekitaran
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran amali progresif (20-45 minit setiap satu)

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer
**Versi ini mengemas kini konfigurasi bekas pembangunan dengan alat moden dan tetapan lalai yang lebih baik untuk pengalaman pembelajaran AZD.**

#### Ditukar
- **🐳 Imej Asas**: Dikemas kini dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terkini)
- **📛 Nama Bekas**: Ditukar dari "Python 3" kepada "AZD untuk Pemula" untuk kejelasan

#### Ditambah
- **🔧 Ciri Dev Container Baru**:
  - `azure-cli` dengan sokongan Bicep diaktifkan
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk pengurusan templat
  - `docker-in-docker` untuk penghantaran aplikasi bekas

- **🔌 Penerusan Port**: Port yang telah dikonfigurasikan untuk pembangunan biasa:
  - 8000 (pratonton MkDocs)
  - 3000 (Aplikasi web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Sambungan VS Code Baru**:
  - `ms-python.vscode-pylance` - IntelliSense Python yang dipertingkat
  - `ms-azuretools.vscode-azurefunctions` - Sokongan Azure Functions
  - `ms-azuretools.vscode-docker` - Sokongan Docker
  - `ms-azuretools.vscode-bicep` - Sokongan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pengurusan sumber Azure
  - `yzhang.markdown-all-in-one` - Penyuntingan Markdown
  - `DavidAnson.vscode-markdownlint` - Penguatkuasaan aturan Markdown
  - `bierner.markdown-mermaid` - Sokongan rajah Mermaid
  - `redhat.vscode-yaml` - Sokongan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Sejarah Git

- **⚙️ Tetapan VS Code**: Menambah tetapan lalai untuk penterjemah Python, format semasa simpan, dan pemangkasan ruang kosong

- **📦 Kemas Kini requirements-dev.txt**:
  - Menambah pemalam minify MkDocs
  - Menambah pre-commit untuk kualiti kod
  - Menambah pakej SDK Azure (azure-identity, azure-mgmt-resource)

#### Dibaiki
- **Arahan Pasca-Cipta**: Kini mengesahkan pemasangan AZD dan Azure CLI semasa mula bekas

---

### [v3.11.0] - 2026-02-05

#### Penambahbaikan README Mesra Pemula
**Versi ini memperbaiki secara signifikan README.md agar lebih mudah diakses oleh pemula dan menambah sumber penting untuk pemaju AI.**

#### Ditambah
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas bila menggunakan setiap alat dengan contoh praktikal
- **🌟 Pautan AZD Hebat**: Pautan langsung ke galeri templat komuniti dan sumber penyumbang:
  - [Galeri AZD Hebat](https://azure.github.io/awesome-azd/) - 200+ templat sedia untuk dihantar
  - [Hantar Templat](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti
- **🎯 Panduan Permulaan Pantas**: Seksyen permulaan ringkas 3 langkah (Pasang → Log Masuk → Hantar)
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas di mana untuk bermula berdasarkan pengalaman pembangun

#### Ditukar
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat penting di hadapan
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" bagi pemula lengkap
- **Dibuang Kandungan Berganda**: Menghapuskan bahagian penyelesaian masalah berganda
- **Perintah Penyelesaian Masalah**: Betulkan rujukan `azd logs` untuk menggunakan `azd monitor --logs` yang sah

#### Diperbaiki
- **🔐 Perintah Pengesahan**: Ditambah `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Rujukan Perintah Tidak Sah**: Dikeluarkan baki `azd logs` daripada bahagian penyelesaian masalah README

#### Nota
- **Skop**: Perubahan dikenakan pada README.md utama dan resources/cheat-sheet.md
- **Audien Sasaran**: Penambahbaikan khusus untuk pembangun baru kepada AZD

---

### [v3.10.0] - 2026-02-05

#### Kemas Kini Ketepatan Perintah Azure Developer CLI
**Versi ini membetulkan perintah AZD yang tidak wujud di seluruh dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Diperbaiki
- **🔧 Perintah AZD Tidak Wujud Dikeluarkan**: Audit komprehensif dan pembetulan perintah tidak sah:
  - `azd logs` (tidak wujud) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI
  - Subperintah `azd service` (tidak wujud) → digantikan dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak wujud) → dikeluarkan atau digantikan dengan alternatif yang sah
  - Bendera `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dikeluarkan
  - Bendera `azd provision --what-if/--rollback` (tidak wujud) → dikemas kini untuk menggunakan `--preview`
  - `azd config validate` (tidak wujud) → digantikan dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dikeluarkan

- **📚 Fail Dikemaskini dengan Pembetulan Perintah**:
  - `resources/cheat-sheet.md`: Ulasan besar-besaran rujukan perintah
  - `docs/deployment/deployment-guide.md`: Membetulkan strategi rollback dan pelaksanaan
  - `docs/troubleshooting/debugging.md`: Betulkan bahagian analisis log
  - `docs/troubleshooting/common-issues.md`: Kemas kini perintah penyelesaian masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan bahagian penyahpepijatan AZD
  - `docs/getting-started/azd-basics.md`: Betulkan perintah pemantauan
  - `docs/getting-started/first-project.md`: Kemas kini contoh pemantauan dan penyahpepijatan
  - `docs/getting-started/installation.md`: Betulkan contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Betulkan perintah paparan log
  - `docs/pre-deployment/coordination-patterns.md`: Betulkan perintah penyahpepijatan ejen

- **📝 Kemas Kini Rujukan Versi**: 
  - `docs/getting-started/installation.md`: Tukar versi keras kod `1.5.0` kepada `1.x.x` generik dengan pautan ke keluaran

#### Ditukar
- **Strategi Rollback**: Kemas kini dokumentasi untuk menggunakan rollback berasaskan Git (AZD tidak mempunyai rollback asli)
- **Paparan Log**: Gantikan rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bahagian Prestasi**: Keluarkan bendera pelaksanaan selari/incremental yang tidak wujud, sediakan alternatif yang sah

#### Butiran Teknikal
- **Perintah AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Bendera azd monitor Sah**: `--live`, `--logs`, `--overview`
- **Ciri Dikeluarkan**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Perintah disahkan dengan Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyiapan Bengkel dan Kemas Kini Kualiti Dokumentasi
**Versi ini melengkapkan modul bengkel interaktif, membaiki semua pautan dokumentasi rosak, dan memperbaiki kualiti kandungan keseluruhan untuk pembangun AI yang menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen garis panduan sumbangan baharu dengan:
  - Arahan jelas untuk melaporkan isu dan mencadangkan perubahan
  - Standard dokumentasi untuk kandungan baru
  - Garis panduan contoh kod dan konvensyen mesej commit
  - Maklumat penglibatan komuniti

#### Disiapkan
- **🎯 Modul Bengkel 7 (Penutup)**: Modul penutup lengkap dengan:
  - Rumusan komprehensif pencapaian bengkel
  - Bahagian konsep utama dikuasai merangkumi AZD, templat, dan Microsoft Foundry
  - Cadangan sambungan perjalanan pembelajaran
  - Latihan cabaran bengkel dengan penarafan kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Penyahstrukturan)**: Kemas kini objektif pembelajaran dengan:
  - Panduan pengaktifan GitHub Copilot dengan pelayan MCP
  - Kefahaman struktur folder templat AZD
  - Corak pengurusan infrastruktur sebagai kod (Bicep)
  - Arahan makmal praktik

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Disiapkan dengan:
  - Objektif pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk penyahperlengkapan infrastruktur selamat
  - Panduan pemulihan perkhidmatan kognitif dipadam lembut
  - Cadangan eksplorasi bonus untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Pembaikan Pautan Rosak**: Betulkan lebih 15 pautan dokumentasi dalaman rosak:
  - `docs/ai-foundry/ai-model-deployment.md`: Betulkan laluan ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Gantikan cicd-integration.md yang tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Betulkan laluan FAQ dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Betulkan laluan halaman utama kursus dan panduan pelaksanaan
  - `resources/faq.md` dan `resources/glossary.md`: Kemas kini rujukan bab AI
  - `course-outline.md`: Betulkan panduan pengajar dan rujukan makmal bengkel AI

- **📅 Sepanduk Status Bengkel**: Kemas kini daripada "Dalam Pembinaan" ke status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Betulkan pautan navigasi rosak dalam README.md bengkel yang menunjuk kepada folder lab-1-azd-basics yang tidak wujud

#### Ditukar
- **Pembentangan Bengkel**: Keluarkan amaran "dalam pembinaan", bengkel kini lengkap dan sedia digunakan
- **Konsistensi Navigasi**: Pastikan semua modul bengkel mempunyai navigasi antara modul yang betul
- **Rujukan Laluan Pembelajaran**: Kemas kini rujukan silang bab untuk menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown bahasa Inggeris mempunyai pautan dalaman yang sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan betul
- ✅ Kandungan sesuai untuk pembangun AI menggunakan Microsoft AZD
- ✅ Bahasa dan struktur mesra pemula dikekalkan sepanjang
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan dalaman .md
- **Audit Kandungan**: Semakan manual kesempurnaan bengkel dan kesesuaian pemula
- **Sistem Navigasi**: Corak navigasi bab dan modul konsisten digunakan

#### Nota
- **Skop**: Perubahan dikenakan hanya pada dokumentasi bahasa Inggeris
- **Terjemahan**: Folder terjemahan tidak dikemas kini dalam versi ini (penterjemahan automatik akan disegerakkan kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan 3-4 jam pembelajaran praktikal

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Multi-Ejen
**Versi ini menambah pelajaran komprehensif kelas A pada integrasi Application Insights, corak pengesahan, dan koordinasi multi-ejen untuk pelaksanaan produksi.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:
  - Pelaksanaan fokus AZD dengan pembekalan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri tersuai (lebih 1,200 baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Model Microsoft Foundry)
  - 6 rajah Mermaid (senibina, jejak diedarkan, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh kueri Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan penyahpepijatan masa nyata
  - Masa pembelajaran 40-50 minit dengan corak sedia produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: di `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, identiti terurus)
  - Templat infrastruktur Bicep lengkap untuk pelaksanaan selamat
  - Kod aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (aktifkan identiti terurus, identiti ditugaskan pengguna, putaran Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan sedia produksi

- **🤖 Pelajaran Corak Koordinasi Multi-Ejen**: di `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (sekuen, selari, hierarki, event-driven, konsensus)
  - Pelaksanaan perkhidmatan pengaturcara lengkap (Python/Flask, lebih 1,500 baris)
  - 3 pelaksanaan ejen khusus (Penyelidikan, Penulis, Editor)
  - Integrasi Service Bus untuk antrian mesej
  - Pengurusan keadaan Cosmos DB untuk sistem diedarkan
  - 6 rajah Mermaid yang menunjukan interaksi ejen
  - 3 latihan lanjutan (pengendalian masa tamat, logik cubaan semula, pemutus litar)
  - Pecahan kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-Pelaksanaan**: Kini termasuk corak pemantauan dan koordinasi komprehensif
- **Bab Memulakan**: Ditingkatkan dengan corak pengesahan profesional
- **Kesediaan Produksi**: Liputan lengkap dari keselamatan hingga observabiliti
- **Garis Besar Kursus**: Diperbaharui untuk merujuk pelajaran baru di Bab 3 dan 6

#### Ditukar
- **Perkembangan Pembelajaran**: Integrasi lebih baik keselamatan dan pemantauan dalam kursus
- **Kualiti Dokumentasi**: Standard kelas A konsisten (95-97%) merentasi pelajaran baru
- **Corak Produksi**: Liputan lengkap hujung-ke-hujung untuk pelaksanaan perusahaan

#### Ditingkatkan
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan produksi
- **Standard Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Observabiliti**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Model Microsoft Foundry dan sistem multi-ejen

#### Disahkan
- ✅ Semua pelajaran termasuk kod berfungsi lengkap (bukan petikan)
- ✅ Rajah Mermaid untuk pembelajaran visual (19 jumlah dalam 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 jumlah)
- ✅ Templat Bicep sedia produksi boleh dilaksanakan melalui `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Titik pemeriksaan pengetahuan dengan perintah pengesahan

#### Keputusan Gred Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Seni bina multi-ejen lanjutan
- **Keseluruhan Kandungan Baru**: - Standard kualiti tinggi konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + jejak diedarkan
- **Pengesahan**: Identiti Terurus + Key Vault + corak RBAC
- **Multi-Ejen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + kueri Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, polisi pengekalan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Penambahbaikan Kualiti Dokumentasi dan Contoh Baru Microsoft Foundry Models
**Versi ini meningkatkan kualiti dokumentasi merentasi repositori dan menambah contoh lengkap pelaksanaan Microsoft Foundry Models dengan antaramuka chat gpt-4.1.**

#### Ditambah
- **🤖 Contoh Chat Microsoft Foundry Models**: Pelaksanaan lengkap gpt-4.1 dengan implementasi berfungsi dalam `examples/azure-openai-chat/`:
  - Infrastruktur lengkap Microsoft Foundry Models (pelaksanaan model gpt-4.1)
  - Antaramuka chat baris perintah Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Pembatasan kadar dan pengendalian ralat
  - README komprehensif dengan panduan pelaksanaan 35-45 minit
  - 11 fail sedia produksi (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Tambah latihan praktikal ke panduan konfigurasi:
  - Latihan 1: Konfigurasi pelbagai persekitaran (15 minit)
  - Latihan 2: Latihan pengurusan rahsia (10 minit)
  - Kriteria kejayaan jelas dan langkah pengesahan
- **✅ Pengesahan Pelaksanaan**: Tambah bahagian pengesahan ke panduan pelaksanaan:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output diharapkan untuk semua perintah pelaksanaan
  - Rujukan pantas penyelesaian masalah

#### Ditingkatkan
- **examples/README.md**: Dikemas kini kepada kualiti kelas A (93%):
  - Ditambah azure-openai-chat ke semua bahagian berkaitan
  - Kemas kini bilangan contoh tempatan dari 3 ke 4
  - Ditambah ke jadual Contoh Aplikasi AI
  - Disepadukan ke Quick Start untuk Pengguna Pertengahan
  - Ditambah ke bahagian Templat Microsoft Foundry
  - Kemas kini Matriks Perbandingan dan bahagian penemuan teknologi
- **Kualiti Dokumentasi**: Diperbaiki B+ (87%) → A- (92%) di seluruh folder dokumen:
  - Ditambah keluaran yang dijangka kepada contoh arahan penting
  - Disertakan langkah pengesahan untuk perubahan konfigurasi
  - Dipertingkatkan pembelajaran hands-on dengan latihan praktikal

#### Diubah
- **Progres Pembelajaran**: Integrasi contoh AI yang lebih baik untuk pelajar pertengahan
- **Struktur Dokumentasi**: Latihan yang lebih boleh dilaksanakan dengan hasil yang jelas
- **Proses Pengesahan**: Kriteria kejayaan yang jelas ditambah kepada aliran kerja utama

#### Ditingkatkan
- **Pengalaman Pembangun**: Penghurai Model Microsoft Foundry kini mengambil masa 35-45 minit (berbanding 60-90 untuk alternatif kompleks)
- **Ketelusan Kos**: Anggaran kos yang jelas ($50-200/bulan) untuk contoh Model Microsoft Foundry
- **Laluan Pembelajaran**: Pembangun AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standard Dokumentasi**: Output yang dijangka dan langkah pengesahan yang konsisten

#### Disahkan
- ✅ Contoh Model Microsoft Foundry berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan sah secara sintaksis
- ✅ Arahan README sepadan dengan pengalaman penghurai sebenar
- ✅ Pautan dokumentasi dikemaskini di 8+ lokasi
- ✅ Indeks contoh tepat mencerminkan 4 contoh tempatan
- ✅ Tiada pautan luaran berganda dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Arkitektur Model Microsoft Foundry**: gpt-4.1 + Key Vault + corak Container Apps
- **Keselamatan**: Identiti Terurus sedia, rahsia di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Penghurai**: Satu arahan `azd up` untuk persediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemas Kini Utama: Contoh Penghurai Container App
**Versi ini memperkenalkan contoh penghurai aplikasi kontena lengkap dan sedia produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke laluan pembelajaran.**

#### Ditambah
- **🚀 Contoh Container App**: Contoh tempatan baru dalam `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Gambaran lengkap penghurai kontena, permulaan pantas, produksi, dan corak lanjutan
  - [Simple Flask API](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala-ke-nol, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Microservices Architecture](../../examples/container-app/microservices): Penghurai multi-perkhidmatan sedia produksi (API Gateway, Product, Order, User, Notification), pemesejan asinkron, Service Bus, Cosmos DB, Azure SQL, pelacakan teragih, penghurai blue-green/canary
- **Amalan Terbaik**: Keselamatan, pemantauan, pengoptimuman kos, dan panduan CI/CD untuk beban kerja berkontena
- **Contoh Kod**: `azure.yaml` lengkap, templat Bicep, dan pelaksanaan perkhidmatan pelbagai bahasa (Python, Node.js, C#, Go)
- **Pengujian & Penyelesaian Masalah**: Senario ujian menyeluruh, arahan pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemaskini untuk menampilkan dan pautkan contoh container app baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Dikemaskini untuk menonjolkan contoh container app, tambah entri matriks perbandingan, dan kemaskini rujukan teknologi/arkitektur
- **Rangka Kursus & Panduan Belajar**: Dikemaskini untuk merujuk contoh container app baru dan corak penghurai dalam bab berkaitan

#### Disahkan
- ✅ Semua contoh baru boleh dihuraikan dengan `azd up` dan mengikuti amalan terbaik
- ✅ Pautan silang dan navigasi dokumentasi dikemaskini
- ✅ Contoh merangkumi senario pemula hingga lanjutan, termasuk mikroservis produksi

#### Nota
- **Skop**: Dokumentasi dan contoh bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak kontena lanjutan tambahan dan automasi CI/CD dalam versi akan datang

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk yang menyeluruh dari "Microsoft Foundry" ke "Microsoft Foundry" di seluruh dokumentasi bahasa Inggeris, mencerminkan penjenamaan rasmi Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula lengkap dari "Microsoft Foundry" ke "Microsoft Foundry"
  - Dikemaskini semua rujukan di seluruh dokumentasi bahasa Inggeris di folder `docs/`
  - Penamaan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Penamaan semula fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemaskini di 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula kepada `docs/microsoft-foundry/`
  - Semua rujukan silang dikemaskini untuk mencerminkan struktur folder baru
  - Pautan navigasi disahkan di semua dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemaskini untuk merujuk nama fail baru

#### Fail Dikemaskini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemaskini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemaskini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (daripada kemaskini sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemaskini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan silang dikemaskini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemaskini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemaskini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemaskini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemaskini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemaskini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemaskini (gambaran kursus, tajuk bab, seksyen templat, pandangan komuniti)
  - `course-outline.md` - 14 rujukan dikemaskini (gambaran, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen Inggeris
- ✅ Tiada lagi rujukan nama produk "Microsoft Foundry" dalam dokumen Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baru
- ✅ Penamaan semula fail dan folder berjaya diselesaikan
- ✅ Rujukan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan hanya digunakan pada dokumentasi bahasa Inggeris di folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk nama lama (akan diperbaiki dalam kemaskini akan datang)
- **Pautan Luaran**: URL luaran dan rujukan repositori GitHub kekal tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cawangan tempatan atau dokumentasi yang merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dokumentasi dalaman masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratonton Infrastruktur dan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton baru Azure Developer CLI dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan menyeluruh keupayaan pratonton infrastruktur baru
  - Rujukan arahan dan contoh penggunaan dalam cheat sheet
  - Integrasi terperinci dalam panduan penyediaan dengan kes guna dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk pengesahan pelaksanaan yang lebih selamat
  - Kemas kini panduan permulaan dengan amalan penghurai berfokus keselamatan
- **🚧 Banner Status Bengkel**: Banner HTML profesional menunjukkan status pembangunan bengkel
  - Reka bentuk gradasi dengan penunjuk pembinaan untuk komunikasi pengguna yang jelas
  - Cap masa dikemaskini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Ditingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton disepadukan ke seluruh dokumentasi penghurai
- **Pengesahan Pra-Penerbangan**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Susunan arahan dikemas kini untuk memasukkan pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan jelas ditetapkan untuk pengguna mengenai status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Penghurai**: Aliran kerja pratonton dahulu kini pendekatan yang disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Pembentangan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan yang jelas

#### Diperbaiki
- **Pendekatan Berfokus Keselamatan**: Perubahan infrastruktur kini boleh disahkan sebelum penghurai
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Kefahaman lebih baik kos sumber sebelum penyediaan
- **Mitigasi Risiko**: Pengurangan kegagalan penghurai melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-dokumen**: Ciri pratonton didokumentasi di 4 fail utama
- **Corak Arahan**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton disertakan dalam aliran kerja dan skrip pengesahan
- **Penunjuk Visual**: Penandaan ciri BARU yang jelas untuk kebolehcarian

#### Infrastruktur Bengkel
- **Komunikasi Status**: Banner HTML profesional dengan reka bentuk gradasi
- **Pengalaman Pengguna**: Status pembangunan yang jelas mengelakkan kekeliruan
- **Pembentangan Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap masa dikemaskini terakhir Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel Diperluas dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel menyeluruh dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs
- **📝 Arahan Bengkel Berstruktur**: Laluan pembelajaran berpandu 7 langkah dari penemuan ke penyesuaian
  - 0-Pengenalan: Gambaran keseluruhan bengkel dan persediaan
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat
  - 2-Pengesahan-Templat-AI: Prosedur penghurai dan pengesahan
  - 3-Deconstruct-Templat-AI: Memahami arkitektur templat
  - 4-Konfigurasikan-Templat-AI: Konfigurasi dan penyesuaian
  - 5-Personalisasi-Templat-AI: Pengubahsuaian lanjutan dan iterasi
  - 6-Pembongkaran-Infrastruktur: Pembersihan dan pengurusan sumber
  - 7-Penutup: Ringkasan dan langkah seterusnya
- **🛠️ Alatan Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran ditingkatkan
- **🎯 Laluan Pembelajaran Hands-On**: Metodologi 3 langkah (Penemuan → Penghurai → Penyesuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan tanpa halangan

#### Ditingkatkan
- **Makmal Bengkel AI**: Diperluaskan dengan pengalaman pembelajaran berstruktur selama 2-3 jam yang menyeluruh
- **Dokumentasi Bengkel**: Pembentangan profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan templat ke penghurai produksi
- **Pengalaman Pembangun**: Alatan terintegrasi untuk aliran kerja pembangunan yang lebih lancar

#### Diperbaiki
- **Aksesibiliti**: Antara muka berasaskan pelayar dengan fungsi pencarian, salin, dan togol tema
- **Pembelajaran Kendiri**: Struktur bengkel fleksibel menyesuaikan kelajuan pembelajaran berbeza
- **Aplikasi Praktikal**: Senario penghurai templat AI dunia sebenar
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan bengkel dan kerjasama

#### Ciri Bengkel
- **Carian Terbina Dalam**: Penemuan cepat kata kunci dan pelajaran
- **Salin Blok Kod**: Fungsi hover-to-copy untuk semua contoh kod
- **Togol Tema**: Sokongan mod gelap/cerah untuk keutamaan berbeza
- **Aset Visual**: Tangkapan skrin dan diagram untuk pemahaman yang dipertingkatkan
- **Integrasi Bantuan**: Akses langsung ke Discord untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penstrukturan Semula Navigasi Besar dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab yang menyeluruh dengan navigasi dipertingkatkan di seluruh repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menyusun semula keseluruhan kursus kepada 8 bab pembelajaran progresif
  - Bab 1: Asas & Permulaan Pantas (⭐ - 30-45 minit)
  - Bab 2: Pembangunan Utama AI (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Penghurai (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Berbilang Ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan & Perancangan Pra-Penghurai (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Pengebugan (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Tajuk dan kaki halaman navigasi konsisten di semua dokumentasi
- **🎯 Jejak Progres**: Senarai semak penyiapan kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Laluan Pembelajaran**: Titik masuk jelas untuk tahap pengalaman dan matlamat berbeza
- **🔗 Navigasi Rujukan Silang**: Bab berkaitan dan prasyarat dipautkan dengan jelas

#### Ditingkatkan
- **Struktur README**: Ditukar menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap halaman kini menyertakan konteks bab dan panduan progresi
- **Organisasi Templat**: Contoh dan templat dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber**: Cheat sheet, FAQ, dan panduan belajar disambungkan ke bab berkaitan
- **Integrasi Bengkel**: Makmal hands-on dipetakan ke beberapa objektif pembelajaran bab

#### Diubah
- **Perkembangan Pembelajaran**: Beralih daripada dokumentasi linear kepada pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Menyusun semula panduan konfigurasi sebagai Bab 3 untuk aliran pembelajaran yang lebih baik
- **Integrasi Kandungan AI**: Integrasi kandungan khusus AI yang lebih baik sepanjang perjalanan pembelajaran
- **Kandungan Pengeluaran**: Corak lanjutan disatukan dalam Bab 8 untuk pelajar perusahaan

#### Diperbaiki
- **Pengalaman Pengguna**: Navigasi breadcrumbs yang jelas dan penunjuk perkembangan bab
- **Kebolehcapaian**: Corak navigasi yang konsisten untuk memudahkan pelayaran kursus
- **Pembentangan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa dikurangkan untuk mencari kandungan relevan melalui organisasi yang dipertingkatkan

#### Pelaksanaan Teknikal
- **Header Navigasi**: Penyeragaman navigasi bab merentasi lebih 40 fail dokumentasi
- **Navigasi Footer**: Panduan kemajuan konsisten dan penunjuk penyelesaian bab
- **Pautan Antara**: Sistem pautan dalaman menyeluruh menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh yang jelas dikaitkan dengan objektif pembelajaran

#### Penambahbaikan Panduan Studi
- **📚 Objektif Pembelajaran Komprehensif**: Panduan studi disusun semula mengikut sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab termasuk objektif pembelajaran khusus dan latihan praktikal
- **📋 Penjejakan Kemajuan**: Jadual pembelajaran mingguan dengan hasil boleh diukur dan senarai semak penyelesaian
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti praktikal dengan senario pelaksanaan sebenar dan penyelesaian masalah
- **📊 Perkembangan Kemahiran**: Kemajuan jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya
- **🎓 Rangka Sijil**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Rancangan pembelajaran 10 minggu berstruktur dengan pengesahan pencapaian

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Multi-Ejen Dipertingkatkan
**Versi ini memperbaiki penyelesaian runcit multi-ejen dengan penamaan ejen lebih baik dan dokumentasi dipertingkatkan.**

#### Perubahan
- **Terminologi Multi-Ejen**: Menggantikan "ejen Cora" dengan "ejen Pelanggan" di seluruh penyelesaian runcit multi-ejen untuk kefahaman lebih jelas
- **Senibina Ejen**: Mengemas kini semua dokumentasi, templat ARM, dan contoh kod untuk menggunakan penamaan "Ejen Pelanggan" secara konsisten
- **Contoh Konfigurasi**: Memodenkan corak konfigurasi ejen dengan konvensyen penamaan dikemas kini
- **Konsistensi Dokumentasi**: Memastikan semua rujukan menggunakan nama ejen profesional dan deskriptif

#### Dipertingkatkan
- **Pakej Templat ARM**: Dikemas kini retail-multiagent-arm-template dengan rujukan Ejen Pelanggan
- **Rajah Senibina**: Diagram Mermaid yang disegarkan dengan penamaan ejen dikemas kini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pemboleh Ubah Persekitaran**: Mengemas kini semua skrip pelaksanaan untuk menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pembangun**: Peranan dan tanggungjawab ejen lebih jelas dalam dokumentasi
- **Kesediaan Pengeluaran**: Penyelarasan lebih baik dengan konvensyen penamaan perusahaan
- **Bahan Pembelajaran**: Penamaan ejen lebih intuitif untuk tujuan pendidikan
- **Kegunaan Templat**: Memudahkan pemahaman fungsi ejen dan corak pelaksanaan

#### Butiran Teknikal
- Mengemas kini diagram senibina Mermaid dengan rujukan CustomerAgent
- Menggantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Mengubah konfigurasi JSON templat ARM untuk menggunakan jenis ejen "customer"
- Mengemas kini pemboleh ubah persekitaran dari CORA_AGENT_* kepada corak CUSTOMER_AGENT_*
- Menyegarkan semua arahan pelaksanaan dan konfigurasi kontena

### [v3.0.0] - 2025-09-12

#### Perubahan Utama - Fokus Pembangun AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran komprehensif berfokus AI dengan integrasi Microsoft Foundry.**

#### Ditambah
- **🤖 Laluan Pembelajaran AI-Pertama**: Penyusunan semula lengkap mengutamakan pembangun dan jurutera AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi menyeluruh untuk menghubungkan AZD dengan perkhidmatan Microsoft Foundry
- **Corak Pengeluaran Model AI**: Panduan terperinci merangkumi pemilihan model, konfigurasi, dan strategi pengeluaran
- **Makmal Bengkel AI**: Bengkel praktikal 2-3 jam untuk menukar aplikasi AI kepada penyelesaian yang boleh dilaksanakan AZD
- **Amalan Terbaik AI Pengeluaran**: Corak sedia perusahaan untuk skala, pemantauan, dan keselamatan beban kerja AI
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah komprehensif untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan isu pengeluaran AI
- **Galeri Templat AI**: Koleksi terpilih templat Microsoft Foundry dengan penilaian kerumitan
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan

#### Dipertingkatkan
- **Struktur README**: Fokus kepada pembangun AI dengan 45% data minat komuniti daripada Discord Microsoft Foundry
- **Laluan Pembelajaran**: Laluan pembangun AI dikhaskan bersama laluan tradisional untuk pelajar dan jurutera DevOps
- **Cadangan Templat**: Templat AI terpilih termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komuniti**: Sokongan komuniti Discord dipertingkatkan dengan saluran dan perbincangan khusus AI

#### Fokus Keselamatan & Pengeluaran
- **Corak Identiti Terurus**: Konfigurasi pengesahan dan keselamatan khusus AI
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI
- **Pengeluaran Multi-Wilayah**: Strategi untuk pengeluaran aplikasi AI global
- **Pemantauan Prestasi**: Metrik khusus AI dan integrasi Application Insights

#### Kualiti Dokumentasi
- **Struktur Kursus Linear**: Perkembangan logik dari corak pengeluaran AI asas ke lanjutan
- **URL Disahkan**: Semua pautan repositori luaran diperiksa dan dapat diakses
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi
- **Sedia Pengeluaran**: Corak pengeluaran perusahaan dengan contoh dunia sebenar

### [v2.0.0] - 2025-09-09

#### Perubahan Utama - Penstrukturan Semula Repositori dan Penambahbaikan Profesional
**Versi ini mewakili pengubahsuaian besar struktur repositori dan pembentangan kandungan.**

#### Ditambah
- **Rangka Pembelajaran Berstruktur**: Semua halaman dokumentasi kini mengandungi Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Ditambahkan pautan pelajaran Sebelumnya/Seterusnya pada semua dokumentasi untuk panduan perkembangan pembelajaran
- **Panduan Studi**: study-guide.md yang komprehensif dengan objektif pembelajaran, latihan amali, dan bahan penilaian
- **Pembentangan Profesional**: Membuang semua ikon emoji bagi meningkatkan kebolehcapaian dan penampilan profesional
- **Struktur Kandungan Dipertingkatkan**: Organisasi dan aliran bahan pembelajaran dipertingkatkan

#### Diubah
- **Format Dokumentasi**: Menyeragamkan semua dokumentasi dengan struktur berfokus pembelajaran yang konsisten
- **Aliran Navigasi**: Melaksanakan perkembangan logik melalui semua bahan pembelajaran
- **Pembentangan Kandungan**: Mengeluarkan elemen hiasan demi format yang jelas dan profesional
- **Struktur Pautan**: Mengemas kini semua pautan dalaman untuk menyokong sistem navigasi baru

#### Diperbaiki
- **Kebolehcapaian**: Membuang pergantungan emoji demi keserasian pembaca skrin yang lebih baik
- **Penampilan Profesional**: Pembentangan gaya akademik yang bersih sesuai untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil jelas untuk setiap pelajaran
- **Organisasi Kandungan**: Aliran logik dan hubungan antara topik berkaitan lebih baik

### [v1.0.0] - 2025-09-09

#### Pelepasan Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambah
- **Struktur Dokumentasi Teras**
  - Siri panduan memulakan lengkap
  - Dokumentasi komprehensif pelaksanaan dan penyediaan
  - Sumber penyelesaian masalah dan panduan debugging terperinci
  - Alat dan prosedur pengesahan sebelum pelaksanaan

- **Modul Memulakan**
  - Asas AZD: Konsep teras dan terminologi
  - Panduan Pemasangan: Arahan persediaan khusus platform
  - Panduan Konfigurasi: Persediaan persekitaran dan pengesahan
  - Tutorial Projek Pertama: Pembelajaran amali langkah demi langkah

- **Modul Pelaksanaan dan Penyediaan**
  - Panduan Pelaksanaan: Dokumentasi aliran kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kod menggunakan Bicep
  - Amalan terbaik untuk pelaksanaan pengeluaran
  - Corak senibina pelbagai perkhidmatan

- **Modul Pengesahan Pra-Pelaksanaan**
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure
  - Pemilihan SKU: Panduan tier perkhidmatan komprehensif
  - Pemeriksaan Pra-Penerbangan: Skrip pengesahan automatik (PowerShell dan Bash)
  - Alatan anggaran kos dan perancangan bajet

- **Modul Penyelesaian Masalah**
  - Isu Lazim: Masalah yang kerap dihadapi dan penyelesaian
  - Panduan Debugging: Kaedah penyelesaian masalah secara sistematik
  - Teknik dan alatan diagnostik lanjutan
  - Pemantauan dan pengoptimuman prestasi

- **Sumber dan Rujukan**
  - Lembaran Calit Perintah: Rujukan pantas untuk perintah penting
  - Glosari: Definisi terminologi dan akronim komprehensif
  - Soalan Lazim: Jawapan terperinci untuk soalan biasa
  - Pautan sumber luar dan hubungan komuniti

- **Contoh dan Templat**
  - Contoh Aplikasi Web Mudah
  - Templat pelaksanaan Laman Web Statik
  - Konfigurasi Aplikasi Kontena
  - Corak integrasi pangkalan data
  - Contoh senibina mikroservis
  - Pelaksanaan fungsi tanpa pelayan

#### Ciri-ciri
- **Sokongan Berbilang Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux
- **Pelbagai Tahap Kemahiran**: Kandungan direka untuk pelajar hingga pembangun profesional
- **Fokus Praktikal**: Contoh amali dan senario dunia sebenar
- **Liputan Komprehensif**: Dari konsep asas hingga corak perusahaan lanjutan
- **Pendekatan Keutamaan Keselamatan**: Amalan terbaik keselamatan disepadukan sepanjang masa
- **Pengoptimuman Kos**: Panduan untuk pelaksanaan kos efektif dan pengurusan sumber

#### Kualiti Dokumentasi
- **Contoh Kod Terperinci**: Contoh kod praktikal yang diuji
- **Arahan Langkah demi Langkah**: Panduan jelas dan boleh dilaksanakan
- **Pengendalian Ralat Komprehensif**: Penyelesaian masalah untuk isu biasa
- **Integrasi Amalan Terbaik**: Standard industri dan cadangan
- **Keserasian Versi**: Terkini dengan perkhidmatan Azure dan ciri azd terbaru

## Penambahbaikan Masa Depan yang Dirancang

### Versi 3.1.0 (Dirancang)
#### Pengembangan Platform AI
- **Sokongan Multi-Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model tersuai
- **Rangka Kerja Ejen AI**: Templat untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor selain Azure AI Search (Pinecone, Weaviate, dll.)
- **Pemerhatian AI**: Pemantauan dipertingkatkan untuk prestasi model, penggunaan token, dan kualiti respons

#### Pengalaman Pembangun
- **Sambungan VS Code**: Pengalaman pembangunan bersepadu AZD + Microsoft Foundry
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengkodan praktikal dengan pengesahan automatik untuk senario AI
- **Kandungan Video**: Tutorial video tambahan untuk pembelajar visual fokus pada penyebaran AI

### Versi 4.0.0 (Dirancang)
#### Corak AI Perusahaan
- **Rangka Kerja Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit
- **AI Berbilang Penyewa**: Corak untuk melayani pelanggan berbilang dengan perkhidmatan AI terasing
- **Pengeluaran AI Edge**: Integrasi dengan Azure IoT Edge dan instans kontena
- **AI Awan Hibrid**: Corak pengeluaran multi-awan dan hibrid untuk beban kerja AI

#### Ciri Lanjutan
- **Automasi Paip AI**: Integrasi MLOps dengan paip Azure Machine Learning
- **Keselamatan Lanjutan**: Corak zero-trust, titik akhir peribadi, dan perlindungan ancaman lanjutan
- **Pengoptimuman Prestasi**: Pelarasan dan skala lanjutan untuk aplikasi AI berkapasiti tinggi
- **Pengedaran Global**: Corak penghantaran kandungan dan caching edge untuk aplikasi AI

### Versi 3.0.0 (Dirancang) - Ditandingi oleh Pelepasan Semasa
#### Penambahan Dicadangkan - Kini Dilaksanakan dalam v3.0.0
- ✅ **Kandungan Berfokus AI**: Integrasi Microsoft Foundry komprehensif (Selesai)
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Selesai)
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Selesai)
- ✅ **Pengoptimuman Prestasi**: Strategi pelarasan beban kerja AI (Selesai)

### Versi 2.1.0 (Dirancang) - Sebahagian Dilaksanakan dalam v3.0.0
#### Penambahbaikan Kecil - Beberapa Selesai dalam Pelepasan Semasa
- ✅ **Contoh Tambahan**: Senario pelaksanaan berfokus AI (Selesai)
- ✅ **Soalan Lazim Lanjutan**: Soalan dan penyelesaian masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor dipertingkatkan
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan amaran khusus AI (Selesai)

#### Masih Dirancang untuk Pelepasan Masa Depan
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih
- **Akses Luar Talian**: Pakej dokumentasi boleh dimuat turun
- **Integrasi IDE Dipertingkatkan**: Sambungan VS Code untuk aliran kerja AZD + AI
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan

## Menyumbang kepada Log Perubahan

### Melaporkan Perubahan
Apabila menyumbang kepada repositori ini, sila pastikan entri log perubahan termasuk:

1. **Nombor Versi**: Mengikut penentuan versi semantik (utama.kecil.selendang)
2. **Tarikh**: Tarikh pelepasan atau kemas kini dalam format YYYY-MM-DD
3. **Kategori**: Ditambah, Diubah, Dihapus, Tetap, Keselamatan
4. **Penerangan Jelas**: Penerangan ringkas tentang apa yang berubah
5. **Penilaian Kesannya**: Bagaimana perubahan memberi kesan kepada pengguna sedia ada

### Kategori Perubahan

#### Ditambah
- Ciri baharu, seksyen dokumentasi, atau keupayaan
- Contoh baru, templat, atau sumber pembelajaran
- Alat tambahan, skrip, atau utiliti

#### Diubah
- Pengubahsuaian ke fungsi atau dokumentasi sedia ada
- Kemas kini untuk memperbaiki kejelasan atau ketepatan
- Penstrukturan semula kandungan atau organisasi

#### Dihapus
- Ciri atau pendekatan yang sedang dihentikan
- Seksien dokumentasi yang dijadualkan untuk dikeluarkan
- Kaedah yang mempunyai alternatif yang lebih baik

#### Dibuang
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan
- Maklumat lapuk atau pendekatan yang sudah tidak digunakan
- Kandungan berlebihan atau disatukan

#### Tetap
- Pembetulan kepada ralat dalam dokumentasi atau kod
- Penyelesaian isu atau masalah yang dilaporkan
- Penambahbaikan ketepatan atau fungsi

#### Keselamatan
- Penambahbaikan atau pembetulan berkaitan keselamatan
- Kemas kini amalan keselamatan terbaik
- Penyelesaian kelemahan keselamatan

### Garis Panduan Penentuan Versi Semantik

#### Versi Utama (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Penyusunan semula kandungan atau organisasi yang ketara
- Perubahan yang mengubah pendekatan atau metodologi asas

#### Versi Minor (X.Y.0)
- Ciri baru atau penambahan kandungan
- Penambahbaikan yang mengekalkan keserasian belakang
- Contoh tambahan, alat, atau sumber

#### Versi Tampalan (X.Y.Z)
- Pembetulan pepijat dan pembetulan
- Penambahbaikan kecil pada kandungan sedia ada
- Penjelasan dan penambahbaikan kecil

## Maklum Balas dan Cadangan Komuniti

Kami secara aktif menggalakkan maklum balas komuniti untuk meningkatkan sumber pembelajaran ini:

### Cara Memberi Maklum Balas
- **Isu GitHub**: Laporkan masalah atau cadangkan penambahbaikan (isu khusus AI dialu-alukan)
- **Perbincangan Discord**: Kongsi idea dan berinteraksi dengan komuniti Microsoft Foundry
- **Pull Requests**: Sumbang penambahbaikan terus kepada kandungan, terutamanya templat dan panduan AI
- **Microsoft Foundry Discord**: Sertai saluran #Azure untuk perbincangan AZD + AI
- **Forum Komuniti**: Sertai perbincangan pembangun Azure yang lebih luas

### Kategori Maklum Balas
- **Ketepatan Kandungan AI**: Pembetulan maklumat integrasi dan penggunaan servis AI
- **Pengalaman Pembelajaran**: Cadangan untuk peningkatan aliran pembelajaran pembangun AI
- **Kandungan AI Hilang**: Permintaan untuk templat, corak, atau contoh AI tambahan
- **Kebolehcapaian**: Penambahbaikan untuk keperluan pembelajaran yang pelbagai
- **Integrasi Alat AI**: Cadangan untuk integrasi aliran kerja pembangunan AI yang lebih baik
- **Corak AI Pengeluaran**: Permintaan corak penggunaan AI perusahaan

### Komitmen Respons
- **Respons Isu**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Ciri**: Penilaian dalam masa satu minggu
- **Sumbangan Komuniti**: Semakan dalam masa satu minggu
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan

## Jadual Penyelenggaraan

### Kemas Kini Berkala
- **Ulasan Bulanan**: Ketepatan kandungan dan pengesahan pautan
- **Kemas Kini Suku Tahun**: Penambahan dan penambahbaikan kandungan utama
- **Ulasan Setengah Tahunan**: Penyusunan semula dan peningkatan menyeluruh
- **Pelepasan Tahunan**: Kemas kini versi utama dengan penambahbaikan ketara

### Pemantauan dan Jaminan Kualiti
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala
- **Kemas Kini Teknologi**: Penyesuaian dengan perkhidmatan Azure terkini dan pelepasan azd
- **Audit Kebolehcapaian**: Semakan berkala untuk prinsip reka bentuk inklusif

## Polisi Sokongan Versi

### Sokongan Versi Semasa
- **Versi Utama Terkini**: Sokongan penuh dengan kemas kini berkala
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembetulan kritikal selama 12 bulan
- **Versi Lama**: Sokongan komuniti sahaja, tiada kemas kini rasmi

### Panduan Migrasi
Apabila versi utama dikeluarkan, kami menyediakan:
- **Panduan Migrasi**: Arahan langkah demi langkah untuk peralihan
- **Nota Keserasian**: Butiran mengenai perubahan besar
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Kajian](resources/study-guide.md)
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)

**Sentiasa Dikemas Kini**: Tonton repositori ini untuk pemberitahuan mengenai pelepasan baru dan kemas kini penting pada bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->