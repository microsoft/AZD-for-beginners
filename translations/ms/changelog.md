# Log Perubahan - AZD Untuk Pemula

## Pengenalan

Log perubahan ini mendokumentasikan semua perubahan penting, kemas kini, dan penambahbaikan pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versi semantik dan mengekalkan log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan mengkaji log perubahan ini, anda akan:
- Sentiasa dimaklumkan tentang ciri baru dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Mengekori pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas mengkaji entri log perubahan, anda akan dapat:
- Mengenal pasti kandungan dan sumber baru yang tersedia untuk pembelajaran
- Memahami bahagian mana yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Menyumbang maklum balas dan cadangan untuk penambahbaikan masa depan

## Sejarah Versi

### [v3.23.0] - 2026-07-13

#### Penyegaran AZD 1.27.1: Kemas Kini Versi Semasa
**Versi ini mengesahkan semula kursus terhadap `azd` `1.27.1` (Julai 2026, keluaran stabil terkini) dan lanjutan ejen AI pratonton semasa `azure.ai.agents` `1.0.0-beta.5`, mengemas kini semua banner "disahkan terhadap" selepas keluaran 1.26.0, 1.27.0, dan 1.27.1.**

#### Perubahan
- **✅ Garis asas pengesahan dikemas kini** dari `azd 1.25.6` (Jun 2026) ke `azd 1.27.1` (Julai 2026) merentasi README akar, semua README bab, pelajaran dev-container Bab 1 (termasuk contoh versi terkunci), pelajaran templat tersuai Bab 4, pelajaran multi-ejen Bab 5, dan dokumen bengkel
- **🤖 Garis asas Bab 2 disegarkan** dari `azd 1.23.12` (Mac 2026) ke `azd 1.27.1` merentasi `agents.md`, `ai-model-deployment.md`, `ai-workshop-lab.md`, dan `microsoft-foundry-integration.md`; tarikh nota pengesahan dikemas kini ke 2026-07-13
- **🧩 Lanjutan ejen AI dinaik taraf** dari `azure.ai.agents` `0.1.40-preview`/`0.1.18-preview` ke keluaran `1.0.0-beta.5` semasa dalam README Bab 2 dan `agents.md`
- **🧪 Contoh pengesahan bengkel** (output `azd version`) dikemas kini ke `1.27.1`

#### Nota mengenai keluaran azd yang relevan (1.26.0 → 1.27.1)
- **1.26.0 (2026-06-24):** Sokongan Go untuk Azure Functions pada Flex Consumption, penapis langganan `azd config sub-filter` per-penyewa, bundel lanjutan berdikari (`azd x pack --bundle`), dan `azd tool install azure-skills`
- **1.27.0 (2026-06-30):** Pemodelan projek/ejen Azure AI Foundry terus dalam `azure.yaml` (inisialisasi tanpa Bicep/Terraform), sokongan penghantaran bekas untuk App Service (`host: appservice` + `language: docker`), `-s/--source` terus untuk arahan `azd extension`, dan `azd tool uninstall`
- **1.27.1 (2026-07-09):** bendera `--no-dependencies` untuk `azd extension install`, model yang tidak disokong tidak termasuk dalam prompt katalog/kuota secara lalai, dan beberapa pembaikan pepijat

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

#### Pengisian Jurang Pemula #2: Penghasilan Templat, Dev Containers, Pulumi, Azure DevOps, Prinsipal Perkhidmatan, dan Lagi
**Versi ini menutup jurang peringkat pertengahan yang tinggal yang dikenal pasti oleh analisis liputan azd: cara menghasilkan dan menerbitkan templat anda sendiri, persekitaran dev-container/Codespaces yang boleh dihasilkan semula, pembekal infrastruktur Pulumi, tutorial Azure DevOps CI/CD, pengesahan prinsipal perkhidmatan, panduan pemilihan hos (AKS/Spring Apps), penerangan `azd restore`/`azd package`, pengendalian ralat hook, dan amalan persekitaran berkumpulan/bersama.**

#### Ditambah
- **🧱 Pelajaran baru Bab 4** `docs/chapter-04-infrastructure/custom-templates.md` — menghasilkan templat azd anda sendiri: struktur yang diperlukan (`azure.yaml`, `infra/`, `src/`), medan `metadata.template`, pemparaman infrastruktur dengan token sumber `uniqueString()` dan tag `azd-env-name`, ujian secara tempatan dengan `azd init --template <local-path>`, penerbitan ke GitHub, dan penghantaran ke galeri Awesome AZD
- **📦 Pelajaran baru Bab 1** `docs/chapter-01-foundation/dev-containers.md` — persekitaran azd yang boleh dihasilkan semula dengan Dev Containers dan GitHub Codespaces: `.devcontainer/devcontainer.json` minimal menggunakan ciri rasmi `ghcr.io/azure/azure-dev/azd`, ciri khusus bahasa, `docker-in-docker` untuk hos bekas, dan `azd auth login --use-device-code` untuk masuk jauh
- **🧩 Pulumi dengan azd** bahagian dalam `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, susun atur folder Pulumi, timbunan dipetakan ke persekitaran azd, output/tagging diperlukan, dan aliran kerja `azd up` / `azd down` yang sama
- **🎯 Panduan pemilihan hos** dalam `docs/chapter-04-infrastructure/provisioning.md` — perbandingan mesra pemula antara `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan bila memilih AKS atau Azure Spring Apps
- **🛠️ Tutorial Azure DevOps CI/CD** dalam `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, sambungan perkhidmatan dengan federasi identiti beban kerja (OIDC), `azure-dev.yml` yang dijana, dan penyediaan kumpulan pembolehubah
- **🔑 Prinsipal Perkhidmatan (Corak 4)** ditambah ke `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` bukan interaktif dengan rahsia klien vs. kelayakan federasi/OIDC, bila digunakan, dan penyimpanan kelayakan yang selamat
- **🪝 Subseksyen pengendalian ralat hook** dalam `docs/chapter-04-infrastructure/deployment-guide.md` — kod keluar dan `set -e`, `continueOnError`, ujian hook secara berasingan dengan `azd hooks run`, shell khusus OS, dan `--debug`
- **👥 Bahagian persekitaran berkumpulan / dikongsi** dalam `docs/chapter-03-configuration/configuration.md` — apa yang terdapat dalam `.azure/`, apa yang perlu di gitignore, persekitaran setiap pembangun, `azd env list`/`select`, dan menyediakan nilai persekitaran dalam CI/CD
- **🧰 Penerangan `azd restore` dan `azd package` yang diperluas** dalam `resources/cheat-sheet.md` — memulihkan kebergantungan dan membina artifak yang boleh dihantar tanpa penghantaran

#### Perubahan
- **🧭 Jadual pelajaran Bab 4** dikemas kini untuk memasukkan pelajaran baru "Menghasilkan Templat Sendiri" (Pelajaran 3)
- **🧭 Jadual pelajaran Bab 1** dikemas kini untuk memasukkan pelajaran baru "Dev Containers & Codespaces" (Pelajaran 5); footer navigasi disambungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pengisian Jurang Pemula: Pelajaran Multi-Ejen Hands-On, "Bawa Aplikasi Anda," Terraform, dan Tutorial CI/CD
**Versi ini menutup jurang terbesar untuk panduan lengkap pemula dengan menambah dua pelajaran hands-on baru (tutorial multi-ejen boleh dihantar dan menambah azd ke aplikasi sedia ada), pengenalan hook mesra pemula, bahagian Terraform dengan azd, tutorial langkah demi langkah GitHub Actions, penerangan untuk lanjutan pratonton baru, dan senarai semak pengesahan penghantaran yang jelas.**

#### Ditambah
- **🤝 Pelajaran baru Bab 5** `docs/chapter-05-multi-agent/multi-agent-basics.md` — tutorial dua ejen boleh dihantar sepenuhnya hands-on (orchestrator + pakar) menggunakan templat sebenar (`contoso-creative-writer`), merangkumi bila menggunakan multi-ejen, aliran kerja `azd up`, memahami sumber yang dihantar, penjejakan silang ejen, pengubahsuaian, dan pembersihan
- **📦 Pelajaran baru Bab 1** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambah azd ke projek sedia ada dengan `azd init` ("gunakan kod dalam direktori semasa"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, pengesanan hos, dan penghantaran dengan `azd up`
- **🌐 Bahagian Terraform dengan azd** ditambah ke `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, susun atur folder `.tf`, output `AZURE_*` yang diperlukan dan penandaan `azd-env-name`, dan aliran kerja yang sama `azd up` / `azd down` (menutup jurang sokongan Terraform yang diklaim tetapi hanya Bicep dipertontonkan)
- **⚙️ Tutorial langkah demi langkah GitHub Actions** dalam `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke penghantaran automatik: `azd pipeline config`, kelayakan federasi OIDC (tiada rahsia disimpan), `azure-dev.yml` yang dijana, dan panduan rahsia vs pembolehubah
- **🪝 Pengenalan "Baru kepada hook?"** bagi pemula dalam `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, jadual peringkat hook, hook permulaan minimal, dan menjalankan hook secara manual dengan `azd hooks run`
- **✅ Senarai semak "Sahkan Penghantaran Anda"** ditambah pada Langkah 5 di `docs/chapter-01-foundation/first-project.md` — ujian asap, semakan titik akhir kesihatan, dan kriteria kejayaan yang jelas
- **🧩 Penerangan untuk lanjutan pratonton baru** `azure.ai.skills` dan `azure.ai.connections` (apa itu dan bila menggunakannya) dalam `docs/chapter-08-production/production-ai-practices.md`

#### Perubahan
- **🧭 Jadual pelajaran Bab 5** dibetulkan: `multi-agent-basics.md` kini Pelajaran 1 (satu-satunya pelajaran penuh hands-on), dengan label jujur bahawa Pelajaran 2 berada di Bab 6 dan senario Retail adalah cetak biru seni bina, bukan templat satu arahan
- **🧭 Jadual pelajaran Bab 1** kini termasuk pelajaran baru "Bawa Aplikasi Anda" (Pelajaran 4)
- **🔗 Footer navigasi** dikemas kini: `first-project.md` kini paut ke hadapan ke `bring-your-own-app.md`

#### Dibaiki
- **🧱 Menutup jurang Terraform yang "diklaim tetapi tiada"** — kursus sebelum ini merujuk sokongan Terraform tanpa menunjukkan penggunaannya
- **🔀 Membetulkan pautan silang Bab 5 yang mengelirukan** yang memberi gambaran bahawa pelaksanaan multi-ejen penuh wujud sedangkan hanya cetak biru seni bina ada

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

#### Penyegaran AZD 1.25.6, Perintah Kitaran Hayat Agen Penuh & Penjenamaan Semula Aspire

**Versi ini mengesahkan semula kursus terhadap `azd` `1.25.6` (Jun 2026) dan pelanjutan pratonton `azure.ai.agents` `0.1.40-preview`, mengembangkan panduan AI dari "membina agen" ke kitaran hayat agen lengkap (uji → nila → optimakan → periksa → padam), memaparkan pelanjutan pratonton baru `azure.ai.skills` dan `azure.ai.connections`, serta mencatat penjenamaan semula produk ".NET Aspire" → "Aspire".**

#### Ditambah
- **🔁 Liputan kitaran hayat agen penuh** untuk pemula dan jurutera AI di seluruh dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Jadual Kitaran Hayat (bina → uji → ukur → perbaiki → periksa → bersihkan) ditambah ke bahagian Pelanjutan dan Perintah AI
  - `docs/chapter-08-production/production-ai-practices.md` — Seksyen baru "Mengurus Kitaran Hayat Agen" merangkumi `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Perintah Agen AI diperluas dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Pelanjutan pratonton baru** didokumentasikan: `azure.ai.skills` (kemahiran agen boleh guna semula) dan `azure.ai.connections` (sambungan Foundry) ditambah ke jadual pelanjutan dan cheat sheet
- **⏱️ Panduan masa tindak balas** — contoh `azd ai agent invoke` kini menyatakan bahawa ia mencetak jumlah kelewatan dan masa-ke-byte-pertama
- **📌 Sepanduk versi** dalam README akar menunjuk pelajar ke `azd version` dan `azd upgrade`

#### Ditukar
- **✅ Garis asas pengesahan dikemas kini** dari `azd 1.23.12` (Mac 2026) ke `azd 1.25.6` (Jun 2026) di semua README bab dan dokumen bengkel
- **🤖 Nota pelanjutan Bab 2** dikemas kini dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh pengesahan bengkel** (output `azd version`) dikemas kini ke `1.25.6`
- **🧭 README "Apa Yang Baru dalam azd Hari Ini"** diperbaharui untuk menonjolkan kitaran hayat agen end-to-end, pelanjutan AI baru, dan pembaikan kualiti hidup terkini (`azd init` idempotensi, pembersihan token lama `azd auth login`, arahan run pertama `azd tool`)
- **📖 agents.md Bab 2 (Pilihan 4)** kini mengarahkan pelajar ke perintah kitaran hayat selepas pelancaran dan bukan berhenti di `azd up`

#### Dibaiki
- **🏷️ Penamaan produk** — nota penjenamaan semula Aspire ditambah (".NET Aspire" kini hanya "Aspire"); sokongan Aspire azd tidak berubah
- **🔎 Pengesahan pelepasan langsung** disahkan terhadap feed pelepasan Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) dan `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fail Dikemas kini
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

#### Penjelasan Onboarding Pemula, Pengesahan Persediaan & Pembersihan Perintah AZD Akhir
**Versi ini mengikuti imbasan pengesahan AZD 1.23 dengan laluan dokumentasi berfokus pada pemula: ia menjelaskan panduan pengesahan pertama AZD, menambah skrip pengesahan persediaan tempatan, mengesahkan perintah utama terhadap AZD CLI langsung, dan menghapuskan rujukan perintah sumber Inggeris terakhir yang usang di luar changelog.**

#### Ditambah
- **🧪 Skrip pengesahan persediaan pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` supaya pelajar dapat mengesahkan alat yang diperlukan sebelum memulakan Bab 1
- **✅ Langkah pengesahan persediaan awal** dalam README akar dan README Bab 1 supaya prasyarat yang hilang dapat dikesan sebelum `azd up`

#### Ditukar
- **🔐 Panduan pengesahan pemula** kini secara konsisten menganggap `azd auth login` sebagai laluan utama untuk aliran kerja AZD, dengan `az login` disebut sebagai pilihan melainkan arahan Azure CLI digunakan secara langsung
- **📚 Aliran onboarding Bab 1** kini mengarahkan pelajar untuk mengesahkan persediaan tempatan mereka sebelum pemasangan, pengesahan, dan langkah pelancaran pertama
- **🛠️ Mesej penilai** kini dengan jelas memisahkan keperluan penghalang dari amaran Azure CLI pilihan untuk laluan pemula hanya AZD
- **📖 Konfigurasi, penyelesaian masalah, dan dokumen contoh** kini membezakan antara pengesahan AZD yang diperlukan dan log masuk Azure CLI pilihan ketika kedua-duanya sebelum ini dipersembahkan tanpa konteks

#### Dibaiki
- **📋 Rujukan perintah sumber Inggeris yang tinggal** dikemas kini ke bentuk AZD terkini, termasuk `azd config show` dalam cheat sheet dan `azd monitor --overview` di mana panduan gambaran Azure Portal dimaksudkan
- **🧭 Kenyataan pemula dalam Bab 1** diubah untuk mengelakkan janji berlebihan jaminan sifar ralat atau perilaku pengembalian semula merentasi semua templat dan sumber Azure
- **🔎 Pengesahan CLI langsung** disahkan untuk sokongan semasa bagi `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

#### Fail Dikemas kini
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
**Versi ini melakukan imbasan pengesahan dokumentasi terhadap `azd` `1.23.12`, mengemas kini contoh perintah AZD yang lapuk, menyegarkan panduan model AI kepada lalai terkini, dan meluaskan arahan bengkel melepasi GitHub Codespaces untuk juga menyokong kontena dev dan klon tempatan.**

#### Ditambah
- **✅ Nota pengesahan di seluruh bab teras dan dokumen bengkel** untuk menjadikan asas pengesahan AZD yang diuji jelas bagi pelajar yang menggunakan binaan CLI yang lebih baru atau lama
- **⏱️ Panduan tamat masa pengeluaran** untuk pengeluaran aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah pemeriksaan pelanjutan** dengan `azd extension show azure.ai.agents` dalam dokumen aliran kerja AI
- **🌐 Panduan persekitaran bengkel yang lebih luas** meliputi GitHub Codespaces, kontena dev, dan klon tempatan dengan MkDocs

#### Ditukar
- **📚 README pengenalan bab** kini secara konsisten menyatakan pengesahan terhadap `azd 1.23.12` di seluruh bahagian asas, konfigurasi, infrastruktur, multi-agen, pra-pelancaran, penyelesaian masalah, dan pengeluaran
- **🛠️ Rujukan perintah AZD** dikemas kini ke bentuk semasa di seluruh dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` bergantung pada konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` di mana gambaran Application Insights dimaksudkan
- **🧪 Contoh pratonton penyediaan** dipermudahkan ke penggunaan yang disokong semasa seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Aliran bengkel** dikemas kini supaya pelajar dapat menyiapkan makmal dalam Codespaces, kontena dev, atau klon tempatan dan bukan menganggap hanya pelaksanaan Codespaces
- **🔐 Panduan pengesahan** kini mengutamakan `azd auth login` untuk aliran kerja AZD, dengan `az login` diletakkan sebagai pilihan apabila arahan Azure CLI digunakan secara langsung

#### Dibaiki
- **🪟 Perintah pemasangan Windows** dinormalkan ke kes pakej `winget` semasa dalam panduan pemasangan
- **🐧 Panduan pemasangan Linux** diperbetulkan untuk mengelakkan arahan pengurus pakej `azd` khusus distro yang tidak disokong dan sebaliknya merujuk kepada aset pelepasan bila sesuai
- **📦 Contoh model AI** disegarkan daripada lalai lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` kepada contoh semasa seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Snipet pelancaran dan diagnostik** diperbetulkan supaya menggunakan perintah persekitaran dan status semasa dalam log, skrip, dan langkah penyelesaian masalah
- **⚙️ Panduan GitHub Actions** dikemas kini daripada `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan kebenaran MCP/Copilot** dikemas kini dari `azd mcp consent` ke `azd copilot consent list`

#### Diperbaiki
- **🧠 Panduan bab AI** kini menerangkan dengan lebih baik tingkah laku `azd ai` sensitif pratonton, log masuk spesifik penyewa, penggunaan pelanjutan semasa, dan cadangan pelancaran model yang dikemas kini
- **🧪 Arahan bengkel** kini menggunakan contoh versi yang lebih realistik dan bahasa persediaan persekitaran yang lebih jelas untuk makmal praktikal
- **📈 Dokumen pengeluaran dan penyelesaian masalah** kini selaras dengan contoh pemantauan semasa, model sandaran, dan tahap kos

#### Fail Dikemas kini
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

#### Perintah CLI AZD AI, Pengesahan Kandungan & Pengembangan Templat
**Versi ini menambah liputan perintah `azd ai`, `azd extension`, dan `azd mcp` di seluruh semua bab berkaitan AI, membetulkan pautan rosak dan kod lapuk dalam agents.md, mengemas kini cheat sheet, dan mengubah suai bahagian Templat Contoh dengan penerangan yang disahkan serta templat AZD Azure AI baru.**

#### Ditambah
- **🤖 Liputan CLI AZD AI** merangkumi 7 fail (sebelumnya hanya dalam Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Seksyen baru "Pelanjutan dan Perintah AI" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pilihan 4: `azd ai agent init` dengan jadual perbandingan (templar berbanding pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subseksyen "Pelanjutan AZD untuk Foundry" dan "Pelancaran Agen-Pertama"

  - `docs/chapter-05-multi-agent/README.md` — Mula Cepat kini menunjukkan kedua-dua laluan pelaksanaan berasaskan templat dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bahagian Pelaksanaan kini termasuk pilihan `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — subseksyen "Perintah Sambungan AZD AI untuk Diagnosis"
  - `resources/cheat-sheet.md` — Bahagian baru "Perintah AI & Sambungan" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Sembang RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan sokongan sembang suara
  - **azure-search-openai-demo-java** — Sembang RAG Java menggunakan Langchain4J dengan pilihan pelaksanaan ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif pelbagai ejen menggunakan Perkhidmatan Ejen Azure AI, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG serverless menggunakan Azure Functions + LangChain.js + Cosmos DB dengan sokongan dev tempatan Ollama
  - **chat-with-your-data-solution-accelerator** — Pemecut RAG perusahaan dengan portal admin, integrasi Teams, dan pilihan PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi rujukan orkestra MCP pelbagai ejen dengan pelayan dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat permulaan Bicep infrastruktur Azure AI minimal
  - **🔗 Pautan Galeri AZD AI Hebat** — Rujukan ke [galeri hebat azd AI](https://azure.github.io/awesome-azd/?tags=ai) (lebih 80 templat)

#### Diperbaiki
- **🔗 navigasi agents.md**: Pautan Sebelumnya/Seterusnya kini sepadan dengan susunan pelajaran README Bab 2 (Integrasi Microsoft Foundry → Ejen → Pelaksanaan Model AI)
- **🔗 pautan rosak agents.md**: `production-ai-practices.md` diperbetulkan kepada `../chapter-08-production/production-ai-practices.md` (3 kali)
- **📦 kod lapuk agents.md**: Gantikan `opencensus` dengan `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API tidak sah agents.md**: Pindahkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 pengiraan token agents.md**: Gantikan anggaran kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Betulkan perkhidmatan dari "Cognitive Search + App Service" kepada "Azure AI Search + Azure Container Apps" (hos lalai berubah Okt 2024)
- **contoso-chat**: Kemas kini deskripsi untuk merujuk Azure AI Foundry + Prompty, selari dengan tajuk dan teknologi repo sebenar

#### Dibuang
- **ai-document-processing**: Buang rujukan templat tidak berfungsi (repo tidak boleh diakses secara awam sebagai templat AZD)

#### Diperbaiki
- **📝 latihan agents.md**: Latihan 1 kini menunjukkan output jangkaan dan langkah `azd monitor`; Latihan 2 termasuk kod pendaftaran penuh `FunctionTool`; Latihan 3 menggantikan panduan samar dengan perintah konkrit `prepdocs.py`
- **📚 sumber agents.md**: Kemas kini pautan dokumentasi ke dokumentasi Perkhidmatan Ejen AI Azure dan mula cepat semasa
- **📋 Jadual Langkah Seterusnya agents.md**: Tambah pautan Makmal Bengkel AI untuk liputan bab lengkap

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
**Versi ini memperbaiki navigasi bab README.md dengan format jadual yang dipertingkat.**

#### Diubah
- **Jadual Peta Kursus**: Dipertingkat dengan pautan pelajaran langsung, anggaran tempoh, dan penarafan kerumitan
- **Pembersihan Folder**: Keluarkan folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pengesahan Pautan**: Semua 21+ pautan dalaman dalam jadual Peta Kursus disahkan

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk
**Versi ini mengemas kini rujukan produk kepada penjenamaan Microsoft terkini.**

#### Diubah
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

#### Penstrukturan Semula Repositori Utama: Nama Folder Berasaskan Bab
**Versi ini menyusun semula dokumentasi ke dalam folder bab khusus untuk navigasi yang lebih jelas.**

#### Penjenamaan Semula Folder
Folder lama telah digantikan dengan folder bernombor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Tambahan baru: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambah
- **📚 Fail README Bab**: Mencipta README.md dalam setiap folder bab dengan:
  - Objektif pembelajaran dan tempoh masa
  - Jadual pelajaran dengan penerangan
  - Arahan mula pantas
  - Navigasi ke bab lain

#### Diubah
- **🔗 Kemas kini semua pautan dalaman**: 78+ laluan dikemas kini merentas semua fail dokumentasi
- **🗺️ README.md utama**: Kemas kini Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Kemas kini rujukan silang ke folder bab

#### Dikeluarkan
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Penyusunan Semula Repositori: Navigasi Bab
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Ejen AI Baru
**Versi ini menambah panduan menyeluruh untuk menyebarkan ejen AI menggunakan Azure Developer CLI.**

#### Ditambah
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap merangkumi:
  - Apa itu ejen AI dan bagaimana ia berbeza daripada chatbot
  - Tiga templat ejen mula pantas (Foundry Agents, Prompty, RAG)
  - Corak seni bina ejen (ejen tunggal, RAG, pelbagai ejen)
  - Konfigurasi dan penyesuaian alat
  - Pemantauan dan penjejakan metrik
  - Pertimbangan kos dan pengoptimuman
  - Senario penyelesaian masalah biasa
  - Tiga latihan amali dengan kriteria kejayaan

#### Struktur Kandungan
- **Pengenalan**: Konsep ejen untuk pemula
- **Mula Pantas**: Sebarkan ejen dengan `azd init --template get-started-with-ai-agents`
- **Corak Seni Bina**: Rajah visual corak ejen
- **Konfigurasi**: Persediaan alat dan pemboleh ubah persekitaran
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran amali progresif (20-45 minit setiap satu)

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer
**Versi ini mengemas kini konfigurasi bekas pembangunan dengan alat moden dan tetapan lalai lebih baik untuk pengalaman pembelajaran AZD.**

#### Diubah
- **🐳 Imej Asas**: Dikemaskini dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terkini)
- **📛 Nama Bekas**: Ditukar dari "Python 3" ke "AZD for Beginners" untuk kejelasan

#### Ditambah
- **🔧 Ciri Baharu Dev Container**:
  - `azure-cli` dengan sokongan Bicep diaktifkan
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk pengurusan templat
  - `docker-in-docker` untuk penyebaran aplikasi bekas

- **🔌 Pemajuan Port**: Port yang telah dikonfigurasikan untuk pembangunan biasa:
  - 8000 (pratonton MkDocs)
  - 3000 (aplikasi web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Luas VS Code Baharu**:
  - `ms-python.vscode-pylance` - IntelliSense Python dipertingkatkan
  - `ms-azuretools.vscode-azurefunctions` - Sokongan Azure Functions
  - `ms-azuretools.vscode-docker` - Sokongan Docker
  - `ms-azuretools.vscode-bicep` - Sokongan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pengurusan sumber Azure
  - `yzhang.markdown-all-in-one` - Penyuntingan Markdown
  - `DavidAnson.vscode-markdownlint` - Linting Markdown
  - `bierner.markdown-mermaid` - Sokongan rajah Mermaid
  - `redhat.vscode-yaml` - Sokongan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Sejarah Git

- **⚙️ Tetapan VS Code**: Ditambah tetapan lalai untuk penterjemah Python, format semasa simpan, dan pemangkasan ruang kosong

- **📦 Kemas Kini fail requirements-dev.txt**:
  - Ditambah pemalam minify MkDocs
  - Ditambah pre-commit untuk kualiti kod
  - Ditambah pakej Azure SDK (azure-identity, azure-mgmt-resource)

#### Dibaiki
- **Arahan Pasca-Cipta**: Kini mengesahkan pemasangan AZD dan Azure CLI semasa permulaan bekas

---

### [v3.11.0] - 2026-02-05

#### Pengubahsuaian README Mesra Pemula
**Versi ini memperbaiki README.md dengan ketara untuk lebih mesra pemula dan menambah sumber penting untuk pembangun AI.**

#### Ditambah
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas bila menggunakan setiap alat dengan contoh praktikal
- **🌟 Pautan Hebat AZD**: Pautan terus ke galeri templat komuniti dan sumber sumbangan:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templat siap guna
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti
- **🎯 Panduan Mula Pantas**: Bahagian mula 3 langkah yang dipermudahkan (Pasang → Log Masuk → Sebar)
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas di mana untuk bermula berdasarkan pengalaman pembangun

#### Diubah
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat utama dahulu
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" bagi pemula sepenuhnya
- **Dibuang Kandungan Berganda**: Menghapuskan bahagian penyelesaian masalah berganda

- **Arahan Penyelesaian Masalah**: Memperbaiki rujukan `azd logs` untuk menggunakan `azd monitor --logs` yang sah

#### Diperbaiki

- **🔐 Perintah Pengesahan**: Ditambah `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Rujukan Perintah Tidak Sah**: Mengeluarkan baki `azd logs` dari bahagian penyelesaian masalah README

#### Nota
- **Skop**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Sasaran Penonton**: Penambahbaikan khusus untuk pembangun baru kepada AZD

---

### [v3.10.0] - 2026-02-05

#### Kemas Kini Ketepatan Perintah Azure Developer CLI
**Versi ini membetulkan perintah AZD yang tidak wujud di seluruh dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Tetapan
- **🔧 Perintah AZD Tidak Wujud Dikeluarkan**: Audit menyeluruh dan pembetulan perintah yang tidak sah:
  - `azd logs` (tidak wujud) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI
  - Subperintah `azd service` (tidak wujud) → digantikan dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak wujud) → dikeluarkan atau diganti dengan alternatif sah
  - Tanda `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dikeluarkan
  - Tanda `azd provision --what-if/--rollback` (tidak wujud) → dikemas kini untuk menggunakan `--preview`
  - `azd config validate` (tidak wujud) → digantikan dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dikeluarkan

- **📚 Fail Dikemas Kini dengan Pembetulan Perintah**:
  - `resources/cheat-sheet.md`: Penambahbaikan utama rujukan perintah
  - `docs/deployment/deployment-guide.md`: Betulkan strategi rollback dan pelancaran
  - `docs/troubleshooting/debugging.md`: Betulkan bahagian analisis log
  - `docs/troubleshooting/common-issues.md`: Kemas kini perintah penyelesaian masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan bahagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Betulkan perintah pemantauan
  - `docs/getting-started/first-project.md`: Kemas kini contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Betulkan contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Betulkan perintah melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Betulkan perintah debugging agen

- **📝 Rujukan Versi Dikemas Kini**: 
  - `docs/getting-started/installation.md`: Tukar versi keraskod `1.5.0` kepada `1.x.x` generik dengan pautan ke pelepasan

#### Diubah
- **Strategi Rollback**: Kemas kini dokumentasi untuk menggunakan rollback berasaskan Git (AZD tidak mempunyai rollback asli)
- **Melihat Log**: Gantikan rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bahagian Prestasi**: Keluarkan tanda pelancaran paralel/incremental yang tidak wujud, beri alternatif sah

#### Butiran Teknikal
- **Perintah AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Tanda valid azd monitor**: `--live`, `--logs`, `--overview`
- **Ciri Dikeluarkan**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Perintah disahkan dengan Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Kemas Kini Penyelesaian Bengkel dan Kualiti Dokumentasi
**Versi ini melengkapkan modul bengkel interaktif, memperbaiki semua pautan dokumentasi yang rosak, dan meningkatkan kualiti kandungan secara keseluruhan untuk pembangun AI menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen panduan sumbangan baru dengan:
  - Arahan jelas untuk melaporkan isu dan mencadangkan perubahan
  - Standard dokumentasi untuk kandungan baru
  - Garis panduan contoh kod dan konvensyen mesej komit
  - Maklumat penglibatan komuniti

#### Diselesaikan
- **🎯 Modul Bengkel 7 (Penutupan)**: Modul penutupan lengkap dengan:
  - Ringkasan menyeluruh pencapaian bengkel
  - Bahagian konsep utama yang dikuasai meliputi AZD, templat, dan Microsoft Foundry
  - Cadangan kesinambungan perjalanan pembelajaran
  - Latihan cabaran bengkel dengan penilaian kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Pembongkaran)**: Kemas kini objektif pembelajaran dengan:
  - Panduan pengaktifan GitHub Copilot dengan pelayan MCP
  - Memahami struktur folder templat AZD
  - Corak organisasi Infrastructure-as-code (Bicep)
  - Arahan makmal praktikal

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Diselesaikan dengan:
  - Objektif pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk deprovising infrastruktur secara selamat
  - Panduan pemulihan perkhidmatan kognitif yang dipadam lembut
  - Prompt penerokaan bonus untuk GitHub Copilot dan Papan Pemuka Azure

#### Tetapan
- **🔗 Perbaikan Pautan Rosak**: Menyelesaikan 15+ pautan dokumentasi dalaman yang rosak:
  - `docs/ai-foundry/ai-model-deployment.md`: Betulkan laluan kepada microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Gantikan cicd-integration.md tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Betulkan laluan FAQ dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Betulkan laluan kursus utama dan panduan pelancaran
  - `resources/faq.md` dan `resources/glossary.md`: Kemas kini rujukan bab AI
  - `course-outline.md`: Betulkan rujukan panduan pengajar dan makmal bengkel AI

- **📅 Banner Status Bengkel**: Kemas kini dari "Sedang Dibina" ke status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Betulkan pautan navigasi rosak dalam README.md bengkel yang menunjuk ke folder lab-1-azd-basics tidak wujud

#### Diubah
- **Pembentangan Bengkel**: Keluarkan amaran "sedang dibina", bengkel kini lengkap dan siap digunakan
- **Konsistensi Navigasi**: Pastikan semua modul bengkel mempunyai navigasi antara modul yang betul
- **Rujukan Laluan Pembelajaran**: Kemas kini rujukan bab silang untuk menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown Bahasa Inggeris mempunyai pautan dalaman yang sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan betul
- ✅ Kandungan sesuai untuk pembangun AI menggunakan Microsoft AZD
- ✅ Bahasa dan struktur mesra pemula dikekalkan sepanjang masa
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan .md dalaman
- **Audit Kandungan**: Semakan manual terhadap kelengkapan bengkel dan kesesuaian pemula
- **Sistem Navigasi**: Corak navigasi bab dan modul konsisten diterapkan

#### Nota
- **Skop**: Perubahan diterapkan hanya pada dokumentasi Bahasa Inggeris
- **Terjemahan**: Folder terjemahan tidak dikemas kini dalam versi ini (penterjemahan automatik akan disinkron kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan 3-4 jam pembelajaran praktikal

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Multi-Agen
**Versi ini menambah pelajaran kelas A yang menyeluruh mengenai integrasi Application Insights, corak pengesahan, dan koordinasi multi-agen untuk pelancaran produksi.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Pelancaran fokus AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang berfungsi dengan telemetri tersuai (1,200+ baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Model Microsoft Foundry)
  - 6 rajah Mermaid (arsitektur, pengesanan teragih, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh pertanyaan Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan debugging masa nyata
  - Masa pembelajaran 40-50 minit dengan corak siap produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, pengenalan terurus)
  - Templat infrastruktur Bicep lengkap untuk pelancaran selamat
  - Kod aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (aktifkan identiti terurus, identiti tugasan pengguna, putaran Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan siap produksi

- **🤖 Pelajaran Corak Koordinasi Multi-Agen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (sekuens, selari, hierarki, terarah peristiwa, konsensus)
  - Pelaksanaan perkhidmatan pengaturcara lengkap (Python/Flask, 1,500+ baris)
  - 3 pelaksanaan agen khusus (Penyelidik, Penulis, Penyunting)
  - Integrasi Service Bus untuk antrian mesej
  - Pengurusan status Cosmos DB untuk sistem teragih
  - 6 rajah Mermaid menunjukkan interaksi agen
  - 3 latihan lanjutan (pengendalian masa tamat, logik cubaan semula, pemutus litar)
  - Pecahan kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Diperbaiki
- **Bab Pra-pelancaran**: Kini termasuk corak pemantauan dan koordinasi menyeluruh
- **Bab Bermula**: Ditingkatkan dengan corak pengesahan profesional
- **Kesediaan Produksi**: Liputan lengkap dari keselamatan ke observabiliti
- **Garis Kursus**: Dikemaskini untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progres Pembelajaran**: Integrasi lebih baik keselamatan dan pemantauan di seluruh kursus
- **Kualiti Dokumentasi**: Standard kelas A konsisten (95-97%) di seluruh pelajaran baru
- **Corak Produksi**: Liputan menyeluruh hujung-ke-hujung untuk pelancaran perusahaan

#### Ditingkatkan
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan produksi
- **Standard Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Observabiliti**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Model Microsoft Foundry dan sistem multi-agen

#### Disahkan
- ✅ Semua pelajaran termasuk kod kerja lengkap (bukan petikan)
- ✅ Rajah Mermaid untuk pembelajaran visual (19 jumlah di 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 jumlah)
- ✅ Templat Bicep siap produksi boleh dilancarkan via `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Penanda pengetahuan dengan perintah pengesahan

#### Keputusan Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan menyeluruh
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Seni bina multi-agen lanjutan
- **Kandungan Baru Keseluruhan**: - Standard kualiti tinggi konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + pengesanan teragih
- **Pengesahan**: Identiti Terurus + Key Vault + corak RBAC
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + pengaturcaraan
- **Pemantauan**: Metrik langsung + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, polisi pengekalan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualiti Dokumentasi dan Contoh Model Microsoft Foundry Baru
**Versi ini meningkatkan kualiti dokumentasi di seluruh repositori dan menambah contoh pelancaran Model Microsoft Foundry lengkap dengan antara muka chat gpt-4.1.**

#### Ditambah
- **🤖 Contoh Chat Model Microsoft Foundry**: Pelancaran lengkap gpt-4.1 dengan pelaksanaan berfungsi dalam `examples/azure-openai-chat/`:
  - Infrastruktur Model Microsoft Foundry lengkap (pelancaran model gpt-4.1)
  - Antara muka chat baris perintah Python dengan sejarah perbualan
  - Integrasi Key Vault untuk simpanan kunci API dengan selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Had kadar dan pengendalian ralat
  - README menyeluruh dengan panduan pelancaran 35-45 minit
  - 11 fail siap produksi (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Tambah latihan amali pada panduan konfigurasi:
  - Latihan 1: Konfigurasi berbilang persekitaran (15 minit)
  - Latihan 2: Latihan pengurusan rahsia (10 minit)
  - Kriteria kejayaan jelas dan langkah pengesahan
- **✅ Pengesahan Pelancaran**: Tambah bahagian pengesahan pada panduan pelancaran:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output dijangka untuk semua perintah pelancaran
  - Rujukan pantas penyelesaian masalah

#### Diperbaiki
- **examples/README.md**: Dikemas kini ke kualiti kelas A (93%):
  - Ditambah azure-openai-chat ke semua bahagian berkaitan
  - Kemas kini bilangan contoh tempatan dari 3 ke 4
  - Ditambah ke jadual Contoh Aplikasi AI
  - Disepadukan ke Mulakan Cepat untuk Pengguna Pertengahan
  - Ditambah ke bahagian Templat Microsoft Foundry
  - Dikemas kini Matriks Perbandingan dan bahagian pencarian teknologi
- **Kualiti Dokumentasi**: Ditingkatkan dari B+ (87%) → A- (92%) di seluruh folder docs:

  - Ditambah output yang dijangka pada contoh perintah kritikal
  - Disertakan langkah pengesahan untuk perubahan konfigurasi
  - Ditingkatkan pembelajaran praktikal dengan latihan praktikal

#### Diubah
- **Progres Pembelajaran**: Integrasi lebih baik contoh AI untuk pelajar peringkat pertengahan
- **Struktur Dokumentasi**: Latihan lebih boleh dilaksanakan dengan hasil yang jelas
- **Proses Pengesahan**: Kriteria kejayaan yang jelas ditambah pada aliran kerja utama

#### Ditingkatkan
- **Pengalaman Pembangun**: Penyebaran Model Microsoft Foundry kini mengambil masa 35-45 minit (berbanding 60-90 untuk alternatif yang kompleks)
- **Ketelusan Kos**: Anggaran kos yang jelas ($50-200/bulan) untuk contoh Model Microsoft Foundry
- **Jalur Pembelajaran**: Pembangun AI mempunyai titik kemasukan yang jelas dengan azure-openai-chat
- **Standard Dokumentasi**: Output dijangka dan langkah pengesahan konsisten

#### Disahkan
- ✅ Contoh Microsoft Foundry Models berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan betul dari segi sintaksis
- ✅ Arahan README sejajar dengan pengalaman penyebaran sebenar
- ✅ Pautan dokumentasi dikemas kini di lebih 8 lokasi
- ✅ Indeks contoh mencerminkan 4 contoh tempatan dengan tepat
- ✅ Tiada pautan luaran berganda dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Arkitek Model Microsoft Foundry**: gpt-4.1 + Key Vault + corak Container Apps
- **Keselamatan**: Identiti Terurus siap, rahsia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Jejak token dan pengoptimuman penggunaan
- **Penyebaran**: Perintah `azd up` tunggal untuk persediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemas Kini Utama: Contoh Penyebaran Aplikasi Container
**Versi ini memperkenalkan contoh penyebaran aplikasi container lengkap sedia produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke dalam jalur pembelajaran.**

#### Ditambah
- **🚀 Contoh Aplikasi Container**: Contoh tempatan baru dalam `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Tinjauan lengkap penyebaran container, permulaan pantas, produksi, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala-ke-nol, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Arkitektur Mikroskhidmat](../../examples/container-app/microservices): Penyebaran pelbagai perkhidmatan sedia produksi (API Gateway, Product, Order, User, Notification), penghantaran mesej tidak serentak, Service Bus, Cosmos DB, Azure SQL, pengesanan teragih, penyebaran blue-green/canary
- **Amalan Terbaik**: Panduan keselamatan, pemantauan, pengoptimuman kos, dan CI/CD untuk beban kerja container
- **Contoh Kod**: `azure.yaml` lengkap, templat Bicep, dan pelaksanaan perkhidmatan pelbagai bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung-ke-hujung, perintah pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemas kini untuk menampilkan dan memautkan contoh aplikasi container baru di bawah "Contoh Tempatan - Aplikasi Container"
- **examples/README.md**: Dikemas kini untuk menyerlahkan contoh aplikasi container, menambah entri matriks perbandingan, dan mengemas kini rujukan teknologi/arkitektur
- **Garis Panduan Kursus & Panduan Belajar**: Dikemas kini untuk merujuk contoh aplikasi container dan corak penyebaran baru dalam bab berkaitan

#### Disahkan
- ✅ Semua contoh baru boleh disebarkan dengan `azd up` dan mengikut amalan terbaik
- ✅ Pautan silang dokumentasi dan navigasi dikemas kini
- ✅ Contoh merangkumi senario dari pemula ke maju, termasuk mikroskhidmat produksi

#### Nota
- **Skop**: Dokumentasi dan contoh bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak container lanjutan tambahan dan automasi CI/CD dalam keluaran akan datang

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk menyeluruh dari "Microsoft Foundry" kepada "Microsoft Foundry" dalam semua dokumentasi Bahasa Inggeris, menggambarkan penjenamaan rasmi Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan penuh dari "Microsoft Foundry" kepada "Microsoft Foundry"
  - Dikemas kini semua rujukan dalam dokumentasi Bahasa Inggeris di folder `docs/`
  - Penamaan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Penamaan semula fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini dalam 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula menjadi `docs/microsoft-foundry/`
  - Semua rujukan silang dikemas kini untuk mencerminkan struktur folder baru
  - Pautan navigasi disahkan di seluruh dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini untuk merujuk nama fail baharu

#### Fail Dikemas Kini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari kemas kini sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (tinjauan, maklumbalas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 kemas kini pautan silang rujukan
  - `docs/getting-started/first-project.md` - 2 kemas kini pautan navigasi bab
  - `docs/getting-started/installation.md` - 2 kemas kini pautan bab seterusnya
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 kemas kini pautan navigasi
  - `docs/troubleshooting/debugging.md` - 1 kemas kini pautan navigasi

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran kursus, tajuk bab, seksyen templat, wawasan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen Bahasa Inggeris
- ✅ Tiada lagi rujukan nama produk "Microsoft Foundry" dalam dokumen Bahasa Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baru
- ✅ Penamaan semula fail dan folder selesai dengan berjaya
- ✅ Rujukan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan digunakan pada dokumentasi Bahasa Inggeris dalam folder `docs/` sahaja
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk penamaan lama (akan ditangani dalam kemas kini akan datang)
- **Pautan Luaran**: URL luaran dan rujukan repositori GitHub kekal tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cawangan lokal atau dokumentasi yang merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dalaman dokumentasi masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratonton Infrastruktur dan Penambahbaikan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton Azure Developer CLI yang baru dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan menyeluruh keupayaan pratonton infrastruktur yang baru
  - Rujukan perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk pengesahan penyebaran yang lebih selamat
  - Kemas kini panduan permulaan dengan amalan penyebaran keselamatan terlebih dahulu
- **🚧 Sepanduk Status Bengkel**: Sepanduk HTML profesional menunjukkan status pembangunan bengkel
  - Rekaan gradasi dengan penunjuk pembinaan untuk komunikasi pengguna yang jelas
  - Tanda masa kemas kini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Ditingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton disepadukan di seluruh dokumentasi penyebaran
- **Pengesahan Pra-penyebaran**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan perintah dikemas kini untuk memasukkan pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan jelas ditetapkan untuk pengguna mengenai status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Penyebaran**: Aliran kerja pra-pratonton kini disarankan sebagai pendekatan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan ke awal proses pembelajaran
- **Persembahan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan yang jelas

#### Diperbaiki
- **Pendekatan Keselamatan Terlebih Dahulu**: Perubahan infrastruktur kini boleh disahkan sebelum penyebaran
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Pemahaman lebih baik tentang kos sumber sebelum penyediaan
- **Mitigasi Risiko**: Mengurangkan kegagalan penyebaran melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-dokumen**: Ciri pratonton didokumentasikan dalam 4 fail utama
- **Corak Perintah**: Sintaks dan contoh konsisten di seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton disertakan dalam aliran kerja pengesahan dan skrip
- **Penunjuk Visual**: Tanda ciri BARU yang jelas untuk mudah ditemui

#### Infrastruktur Bengkel
- **Komunikasi Status**: Sepanduk HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pembangunan yang jelas mengelakkan kekeliruan
- **Persembahan Profesional**: Menjaga kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Tanda masa kemas kini Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel menyeluruh dengan panduan interaktif berasaskan pelayar dan jalur pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs
- **📝 Arahan Bengkel Berstruktur**: Jalur pembelajaran berpandukan 7 langkah dari penemuan hingga penyesuaian
  - 0-Pengenalan: Gambaran bengkel dan persediaan
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat
  - 2-Pengesahan-Templat-AI: Prosedur penyebaran dan pengesahan
  - 3-Membongkar-Templat-AI: Memahami arkitektur templat
  - 4-Konfigurasi-Templat-AI: Konfigurasi dan penyesuaian
  - 5-Peribadikan-Templat-AI: Pengubahsuaian lanjutan dan iterasi
  - 6-Bongkar-Infrastruktur: Pembersihan dan pengurusan sumber
  - 7-Penutup: Ringkasan dan langkah seterusnya
- **🛠️ Alat Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran yang dipertingkatkan
- **🎯 Jalur Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Penyebaran → Penyesuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan lancar

#### Ditingkatkan
- **Makmal Bengkel AI**: Dilanjutkan dengan pengalaman pembelajaran berstruktur selama 2-3 jam yang komprehensif
- **Dokumentasi Bengkel**: Persembahan profesional dengan navigasi dan bantuan visual
- **Progres Pembelajaran**: Panduan langkah demi langkah jelas dari pemilihan templat ke penyebaran produksi
- **Pengalaman Pembangun**: Alat terintegrasi untuk aliran kerja pembangunan yang lancar

#### Diperbaiki
- **Aksesibiliti**: Antara muka berasaskan pelayar dengan fungsi carian, salin, dan togol tema
- **Pembelajaran Kendiri**: Struktur bengkel fleksibel menyesuaikan kelajuan pembelajaran yang berbeza
- **Aplikasi Praktikal**: Senario penyebaran templat AI dunia sebenar
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan dan kolaborasi bengkel

#### Ciri Bengkel
- **Carian Terbina Dalam**: Penemuan kata kunci dan pelajaran pantas
- **Salin Blok Kod**: Fungsi hover-untuk-salin untuk semua contoh kod
- **Togol Tema**: Sokongan mod gelap/terang untuk keutamaan berbeza
- **Aset Visual**: Tangkapan skrin dan diagram untuk pemahaman lebih baik
- **Integrasi Bantuan**: Akses Discord langsung untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penstrukturan Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab yang komprehensif dengan navigasi yang dipertingkatkan di seluruh repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menstruktur semula keseluruhan kursus ke dalam 8 bab pembelajaran progresif
  - Bab 1: Asas & Permulaan Pantas (⭐ - 30-45 minit)
  - Bab 2: Pembangunan AI-Pertama (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Multi-Ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan Pra-Penyebaran & Perancangan (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Pengubahsuaian (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi konsisten di seluruh dokumentasi
- **🎯 Jejak Progres**: Senarai semak tamat kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk pelbagai tahap pengalaman dan matlamat
- **🔗 Navigasi Rujukan Silang**: Bab berkaitan dan prasyarat dipautkan dengan jelas

#### Ditingkatkan
- **Struktur README**: Ditukar menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap halaman kini merangkumi konteks bab dan panduan progres
- **Organisasi Templat**: Contoh dan templat dipetakan ke bab pembelajaran yang sesuai

- **Integrasi Sumber**: Lembaran cheat, FAQ, dan panduan pembelajaran yang dihubungkan dengan bab yang relevan
- **Integrasi Bengkel**: Makmal praktikal dipetakan ke beberapa objektif pembelajaran bab

#### Diubah
- **Perkembangan Pembelajaran**: Berpindah dari dokumentasi linear ke pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk aliran pembelajaran yang lebih baik
- **Integrasi Kandungan AI**: Integrasi kandungan khusus AI yang lebih baik sepanjang perjalanan pembelajaran
- **Kandungan Pengeluaran**: Corak lanjutan digabungkan di Bab 8 untuk pelajar perniagaan

#### Diperbaiki
- **Pengalaman Pengguna**: Penunjuk navigasi jelas dan indikator perkembangan bab
- **Aksesibiliti**: Corak navigasi konsisten untuk memudahkan penelusuran kursus
- **Pembentangan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa untuk mencari kandungan relevan dikurangkan melalui organisasi yang lebih baik

#### Pelaksanaan Teknikal
- **Tajuk Navigasi**: Penyeragaman navigasi bab dalam lebih 40 fail dokumentasi
- **Navigasi Kaki Laman**: Panduan perkembangan konsisten dan indikator penyiapan bab
- **Pautan Silang**: Sistem pautan dalaman menyeluruh menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh yang jelas dikaitkan dengan objektif pembelajaran

#### Peningkatan Panduan Pembelajaran
- **📚 Objektif Pembelajaran Menyeluruh**: Panduan pembelajaran disusun semula mengikut sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab mengandungi objektif pembelajaran khusus dan latihan praktikal
- **📋 Penjejakan Kemajuan**: Jadual pembelajaran mingguan dengan hasil terukur dan senarai semak penyelesaian
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti amali dengan senario pengendalian sebenar dan penyelesaian masalah
- **📊 Perkembangan Kemahiran**: Kemajuan jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya
- **🎓 Kerangka Pensijilan**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran 10 minggu yang terstruktur dengan pengesahan pencapaian

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Multi-Ejen Dipertingkatkan
**Versi ini meningkatkan penyelesaian runcit multi-ejen dengan penamaan ejen lebih baik dan dokumentasi yang dipertingkatkan.**

#### Diubah
- **Terminologi Multi-Ejen**: Menggantikan "Ejen Cora" dengan "Ejen Pelanggan" dalam penyelesaian multi-ejen runcit untuk pemahaman lebih jelas
- **Seni Bina Ejen**: Mengemas kini semua dokumentasi, templat ARM, dan contoh kod menggunakan penamaan "Ejen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Memodenkan corak konfigurasi ejen dengan konvensyen penamaan terkini
- **Konsistensi Dokumentasi**: Memastikan semua rujukan menggunakan nama ejen profesional dan deskriptif

#### Dipertingkatkan
- **Pakej Templat ARM**: Mengemas kini retail-multiagent-arm-template dengan rujukan Ejen Pelanggan
- **Rajah Seni Bina**: Menyegarkan rajah Mermaid dengan penamaan ejen terkini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pembolehubah Persekitaran**: Mengemas kini semua skrip penyebaran untuk menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pembangun**: Peranan dan tanggungjawab ejen yang lebih jelas dalam dokumentasi
- **Kesediaan Pengeluaran**: Penepatan lebih baik dengan konvensyen penamaan perusahaan
- **Bahan Pembelajaran**: Penamaan ejen yang lebih intuitif untuk tujuan pendidikan
- **Kegunaan Templat**: Mempermudah pemahaman fungsi ejen dan corak penyebaran

#### Butiran Teknikal
- Mengemas kini rajah seni bina Mermaid dengan rujukan CustomerAgent
- Menggantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Mengubah konfigurasi JSON templat ARM untuk menggunakan jenis ejen "customer"
- Mengemas kini pembolehubah persekitaran dari CORA_AGENT_* ke pola CUSTOMER_AGENT_*
- Menyegarkan semua arahan penyebaran dan konfigurasi kontena

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pembangun AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran komprehensif berfokus AI dengan integrasi Microsoft Foundry.**

#### Ditambah
- **🤖 Laluan Pembelajaran AI-Pertama**: Susunan semula lengkap memprioritaskan pembangun dan jurutera AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi komprehensif untuk menyambung AZD dengan perkhidmatan Microsoft Foundry
- **Corak Penyebaran Model AI**: Panduan terperinci meliputi pemilihan model, konfigurasi, dan strategi penyebaran pengeluaran
- **Makmal Bengkel AI**: Bengkel praktikal 2-3 jam untuk menukar aplikasi AI ke penyelesaian yang boleh disebarkan menggunakan AZD
- **Amalan Terbaik AI Pengeluaran**: Corak sedia perusahaan untuk penskalaan, pemantauan, dan keselamatan beban kerja AI
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah menyeluruh untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan isu penyebaran AI
- **Galeri Templat AI**: Koleksi templat Microsoft Foundry terpilih dengan penilaian kompleksiti
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan

#### Dipertingkatkan
- **Struktur README**: Fokus pada pembangun AI dengan data minat komuniti 45% dari Discord Microsoft Foundry
- **Laluan Pembelajaran**: Perjalanan pembangun AI khusus berdampingan bersama laluan tradisional untuk pelajar dan jurutera DevOps
- **Cadangan Templat**: Templat AI pilihan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komuniti**: Sokongan komuniti Discord dipertingkatkan dengan saluran dan perbincangan khusus AI

#### Fokus Keselamatan & Pengeluaran
- **Corak Identiti Terurus**: Konfigurasi pengesahan dan keselamatan khusus AI
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI
- **Penyebaran Multi-Region**: Strategi penyebaran aplikasi AI global
- **Pemantauan Prestasi**: Metrik khusus AI dan integrasi Application Insights

#### Kualiti Dokumentasi
- **Struktur Kursus Linear**: Perkembangan logik dari corak penyebaran AI asas ke lanjutan
- **URL Disahkan**: Semua pautan repositori luaran disahkan dan boleh diakses
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi
- **Sedia Pengeluaran**: Corak penyebaran perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Besar - Penstrukturan Semula Repositori dan Peningkatan Profesional
**Versi ini mewakili pengubahsuaian besar pada struktur repositori dan penyampaian kandungan.**

#### Ditambah
- **Rangka Kerja Pembelajaran Berstruktur**: Semua halaman dokumentasi kini termasuk Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Ditambah pautan Pelajaran Sebelumnya/Seterusnya di semua dokumentasi untuk panduan perkembangan pembelajaran
- **Panduan Pembelajaran**: study-guide.md komprehensif dengan objektif pembelajaran, latihan amali, dan bahan penilaian
- **Pembentangan Profesional**: Menghapuskan semua ikon emoji untuk aksesibiliti lebih baik dan penampilan profesional
- **Struktur Kandungan Dipertingkatkan**: Organisasi dan aliran bahan pembelajaran yang lebih baik

#### Diubah
- **Format Dokumentasi**: Menyeragamkan semua dokumentasi dengan struktur fokus pembelajaran yang konsisten
- **Aliran Navigasi**: Melaksanakan perkembangan logik melalui semua bahan pembelajaran
- **Pembentangan Kandungan**: Menghapuskan elemen hiasan demi format yang jelas dan profesional
- **Struktur Pautan**: Mengemas kini semua pautan dalaman untuk menyokong sistem navigasi baru

#### Diperbaiki
- **Aksesibiliti**: Menghilangkan kebergantungan emoji untuk keserasian pembaca skrin lebih baik
- **Penampilan Profesional**: Pembentangan gaya akademik bersih sesuai untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan tersusun dengan objektif dan hasil jelas untuk setiap pelajaran
- **Organisasi Kandungan**: Aliran logik dan hubungan topik berkaitan yang lebih baik

### [v1.0.0] - 2025-09-09

#### Siaran Awal - Repositori Pembelajaran AZD Menyeluruh

#### Ditambah
- **Struktur Dokumentasi Teras**
  - Siri panduan permulaan lengkap
  - Dokumentasi penyebaran dan penyediaan yang menyeluruh
  - Sumber penyelesaian masalah dan panduan debugging terperinci
  - Alat dan prosedur pengesahan pra-penyebaran

- **Modul Permulaan**
  - Asas AZD: Konsep teras dan terminologi
  - Panduan Pemasangan: Arahan penyediaan khusus platform
  - Panduan Konfigurasi: Penetapan persekitaran dan pengesahan
  - Tutorial Projek Pertama: Pembelajaran amali langkah demi langkah

- **Modul Penyebaran dan Penyediaan**
  - Panduan Penyebaran: Dokumentasi aliran kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kod menggunakan Bicep
  - Amalan terbaik untuk penyebaran pengeluaran
  - Corak seni bina pelbagai perkhidmatan

- **Modul Pengesahan Pra-penyebaran**
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure
  - Pemilihan SKU: Panduan menyeluruh tentang tier perkhidmatan
  - Pemeriksaan Pra-penerbangan: Skrip pengesahan automatik (PowerShell dan Bash)
  - Alat anggaran kos dan perancangan bajet

- **Modul Penyelesaian Masalah**
  - Isu Biasa: Masalah kerap dihadapi dan penyelesaian
  - Panduan Debugging: Metodologi penyelesaian masalah sistematik
  - Teknik diagnostik dan alat lanjutan
  - Pemantauan prestasi dan pengoptimuman

- **Sumber dan Rujukan**
  - Lembaran Cheat Perintah: Rujukan pantas bagi perintah penting
  - Glosari: Definisi istilah dan akronim komprehensif
  - FAQ: Jawapan terperinci kepada soalan lazim
  - Pautan sumber luaran dan sambungan komuniti

- **Contoh dan Templat**
  - Contoh Aplikasi Web Mudah
  - Templat penyebaran Laman Statik
  - Konfigurasi Aplikasi Kontena
  - Corak integrasi pangkalan data
  - Contoh seni bina mikros perkhidmatan
  - Pelaksanaan fungsi tanpa pelayan

#### Ciri-ciri
- **Sokongan Pelbagai Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux
- **Pelbagai Tahap Kemahiran**: Kandungan direka untuk pelajar hingga pembangun profesional
- **Fokus Praktikal**: Contoh amali dan senario dunia sebenar
- **Liputan Menyeluruh**: Dari konsep asas ke corak pikahantan perusahaan lanjutan
- **Pendekatan Keselamatan-Diutamakan**: Amalan keselamatan terbaik disepadukan sepanjang kursus
- **Pengoptimuman Kos**: Panduan untuk penyebaran kos efektif dan pengurusan sumber

#### Kualiti Dokumentasi
- **Contoh Kod Terperinci**: Contoh kod praktikal yang telah diuji
- **Arahan Langkah demi Langkah**: Panduan jelas dan boleh dilaksanakan
- **Pengendalian Ralat Menyeluruh**: Penyelesaian masalah untuk isu biasa
- **Integrasi Amalan Terbaik**: Piawaian dan cadangan industri
- **Keserasian Versi**: Dikemas kini dengan perkhidmatan Azure dan ciri azd terkini

## Penambahbaikan Masa Depan yang Dirancang

### Versi 3.1.0 (Dirancang)
#### Pengembangan Platform AI
- **Sokongan Pelbagai Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model khusus
- **Rangka Kerja Ejen AI**: Templat untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor selain Azure AI Search (Pinecone, Weaviate, dll)
- **Kebolehlihatan AI**: Pemantauan dipertingkatkan untuk prestasi model, penggunaan token, dan kualiti respons

#### Pengalaman Pembangun
- **Sambungan VS Code**: Pengalaman pembangunan bersepadu AZD + Microsoft Foundry
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengkodan praktikal dengan pengesahan automatik untuk senario AI
- **Kandungan Video**: Tutorial video tambahan untuk pelajar visual dengan fokus kepada penyebaran AI

### Versi 4.0.0 (Dirancang)
#### Corak AI Perusahaan
- **Rangka Kerja Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit
- **AI Pelbagai Penyewa**: Corak untuk melayani banyak pelanggan dengan perkhidmatan AI terasing
- **Penyebaran AI di Edge**: Integrasi dengan Azure IoT Edge dan instans kontena
- **AI Awan Hibrid**: Corak penyebaran multi-awan dan hibrid untuk beban kerja AI

#### Ciri-ciri Lanjutan
- **Automasi Saluran AI**: Integrasi MLOps dengan saluran Azure Machine Learning
- **Keselamatan Lanjutan**: Corak zero-trust, endpoint peribadi, dan perlindungan ancaman canggih
- **Pengoptimuman Prestasi**: Penalaan dan strategi penskalaan lanjutan untuk aplikasi AI berkapasiti tinggi
- **Pengedaran Global**: Corak penghantaran kandungan dan caching edge untuk aplikasi AI

### Versi 3.0.0 (Dirancang) - Digantikan oleh Siaran Semasa
#### Penambahan Dicadangkan - Kini Dilaksanakan dalam v3.0.0
- ✅ **Kandungan Berfokus AI**: Integrasi menyeluruh Microsoft Foundry (Lengkap)
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Lengkap)
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Lengkap)
- ✅ **Pengoptimuman Prestasi**: Strategi penalaan beban kerja AI (Lengkap)

### Versi 2.1.0 (Dirancang) - Sebahagian Dilaksanakan dalam v3.0.0
#### Penambahbaikan Kecil - Sebahagian Lengkap dalam Siaran Semasa
- ✅ **Contoh Tambahan**: Senario penyebaran berfokus AI (Lengkap)
- ✅ **FAQ Dilanjutkan**: Soalan dan penyelesaian masalah khusus AI (Lengkap)
- **Integrasi Alat**: Panduan integrasi IDE dan penyunting dipertingkatkan
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan amaran khusus AI (Lengkap)

#### Masih Dirancang untuk Siaran Masa Depan
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih
- **Akses Luar Talian**: Pakej dokumentasi boleh dimuat turun
- **Integrasi IDE Dipertingkatkan**: Sambungan VS Code untuk aliran kerja AZD + AI
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan pengesanan sumbangan

## Menyumbang ke Changelog

### Melaporkan Perubahan
Apabila menyumbang ke repositori ini, sila pastikan entri changelog termasuk:

1. **Nombor Versi**: Mengikut penomboran semantik (major.minor.patch)
2. **Tarikh**: Tarikh keluaran atau kemas kini dalam format YYYY-MM-DD
3. **Kategori**: Ditambah, Diubah, Dihentikan, Dibuang, Diperbaiki, Keselamatan
4. **Penerangan Jelas**: Penerangan ringkas tentang apa yang diubah
5. **Penilaian Impak**: Bagaimana perubahan memberi kesan kepada pengguna sedia ada

### Kategori Perubahan

#### Ditambah
- Ciri baru, bahagian dokumentasi, atau keupayaan
- Contoh baru, templat atau sumber pembelajaran
- Alat tambahan, skrip, atau utiliti

#### Diubah
- Pengubahsuaian pada fungsi atau dokumentasi sedia ada
- Kemas kini untuk memperbaiki kejelasan atau ketepatan
- Penyusunan semula kandungan atau organisasi

#### Dihentikan
- Ciri atau pendekatan yang sedang dihentikan
- Bahagian dokumentasi yang dijadualkan untuk dikeluarkan
- Kaedah yang mempunyai alternatif yang lebih baik

#### Dibuang
- Ciri, dokumentasi, atau contoh yang sudah tidak relevan
- Maklumat lapuk atau pendekatan yang dihentikan
- Kandungan berulang atau disatukan

#### Diperbaiki
- Pembetulan kepada kesilapan dalam dokumentasi atau kod
- Penyelesaian isu atau masalah yang dilaporkan
- Penambahbaikan ketepatan atau fungsi


#### Keselamatan
- Penambahbaikan atau pembaikan yang berkaitan dengan keselamatan
- Kemas kini kepada amalan terbaik keselamatan
- Penyelesaian kelemahan keselamatan

### Garis Panduan Penomboran Semantik

#### Versi Utama (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Penstrukturan semula ketara kandungan atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi asas

#### Versi Minor (X.Y.0)
- Ciri baru atau penambahan kandungan
- Penambahbaikan yang mengekalkan keserasian ke belakang
- Contoh tambahan, alat, atau sumber

#### Versi Patch (X.Y.Z)
- Pembaikan bug dan pembetulan
- Penambahbaikan kecil kepada kandungan sedia ada
- Penjelasan dan penambahbaikan kecil

## Maklum Balas dan Cadangan Komuniti

Kami menggalakkan maklum balas komuniti untuk memperbaiki sumber pembelajaran ini:

### Cara Memberi Maklum Balas
- **GitHub Issues**: Laporkan masalah atau cadangkan penambahbaikan (isu khusus AI dialu-alukan)
- **Discord Discussions**: Kongsi idea dan berinteraksi dengan komuniti Microsoft Foundry
- **Pull Requests**: Sumbang penambahbaikan langsung kepada kandungan, terutamanya templat dan panduan AI
- **Microsoft Foundry Discord**: Sertai saluran #Azure untuk perbincangan AZD + AI
- **Community Forums**: Sertai perbincangan pembangun Azure yang lebih luas

### Kategori Maklum Balas
- **Ketepatan Kandungan AI**: Pembetulan kepada integrasi dan maklumat pelaksanaan perkhidmatan AI
- **Pengalaman Pembelajaran**: Cadangan untuk memperbaiki aliran pembelajaran pembangun AI
- **Kandungan AI Hilang**: Permintaan untuk templat, corak, atau contoh AI tambahan
- **Kebolehcapaian**: Penambahbaikan untuk keperluan pembelajaran yang pelbagai
- **Integrasi Alat AI**: Cadangan untuk integrasi aliran kerja pembangunan AI yang lebih baik
- **Corak AI Produksi**: Permintaan corak pelaksanaan AI perusahaan

### Komitmen Respons
- **Respons Isu**: Dalam 48 jam untuk masalah yang dilaporkan
- **Permintaan Ciri**: Penilaian dalam masa satu minggu
- **Sumbangan Komuniti**: Semakan dalam masa satu minggu
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan

## Jadual Penyelenggaraan

### Kemas Kini Berkala
- **Semakan Bulanan**: Ketepatan kandungan dan pengesahan pautan
- **Kemas Kini Suku Tahunan**: Penambahan dan penambahbaikan kandungan utama
- **Semakan Setengah Tahunan**: Penstrukturan dan peningkatan menyeluruh
- **Keluaran Tahunan**: Kemas kini versi utama dengan penambahbaikan ketara

### Pemantauan dan Jaminan Kualiti
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala
- **Kemas Kini Teknologi**: Penyelarasan dengan perkhidmatan Azure terkini dan keluaran azd
- **Audit Kebolehcapaian**: Semakan berkala untuk prinsip reka bentuk inklusif

## Polisi Sokongan Versi

### Sokongan Versi Semasa
- **Versi Utama Terkini**: Sokongan penuh dengan kemas kini berkala
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembaikan kritikal selama 12 bulan
- **Versi Legasi**: Sokongan komuniti sahaja, tiada kemas kini rasmi

### Panduan Migrasi
Apabila versi utama dikeluarkan, kami menyediakan:
- **Panduan Migrasi**: Arahan langkah demi langkah untuk peralihan
- **Nota Keserasian**: Perincian tentang perubahan yang memecahkan sistem
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Kajian](resources/study-guide.md)
- **Pelajaran Seterusnya**: Kembali ke [Main README](README.md)

**Sentiasa Dikemaskini**: Ikuti repositori ini untuk pemberitahuan tentang keluaran baru dan kemas kini penting kepada bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->