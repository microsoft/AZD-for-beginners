# Changelog - AZD Untuk Pemula

## Pengenalan

Changelog ini mendokumentasikan semua perubahan, kemas kini, dan penambahbaikan yang ketara kepada repositori AZD Untuk Pemula. Kami mengikuti prinsip penomboran versi semantik dan menyelenggara log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan menyemak changelog ini, anda akan:
- Kekal dimaklumkan tentang ciri baharu dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Menjejaki pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas menyemak entri changelog, anda akan dapat:
- Kenal pasti kandungan dan sumber baru yang tersedia untuk pembelajaran
- Fahami bahagian mana yang telah dikemas kini atau dipertingkatkan
- Rancang laluan pembelajaran anda berdasarkan bahan terkini
- Menyumbang maklum balas dan cadangan untuk penambahbaikan masa depan

## Sejarah Versi

### [v3.22.0] - 2026-06-16

#### Pengisian Jurang Pemula #2: Penghasilan Templat, Kontena Pembangunan, Pulumi, Azure DevOps, Prinsipal Perkhidmatan, dan Lain-Lain  
**Versi ini menutup jurang pertengahan yang tinggal yang dikenalpasti oleh analisis azd-coverage: cara menghasilkan dan menerbitkan templat anda sendiri, persekitaran kontena pembangunan/Codespaces yang boleh dihasilkan semula, pembekal infrastruktur Pulumi, panduan CI/CD Azure DevOps, pengesahan prinsipal perkhidmatan, panduan pemilihan hos (AKS/Spring Apps), penjelasan `azd restore`/`azd package`, pengendalian ralat hook, dan amalan pasukan/persekitaran bersama.**

#### Ditambah
- **🧱 Pelajaran Bab 4 baharu** `docs/chapter-04-infrastructure/custom-templates.md` — menghasilkan templat azd anda sendiri: struktur yang diperlukan (`azure.yaml`, `infra/`, `src/`), medan `metadata.template`, memparametrisasi infrastruktur dengan token sumber `uniqueString()` dan tag `azd-env-name`, menguji secara tempatan dengan `azd init --template <local-path>`, menerbitkan ke GitHub, dan menyerahkan ke galeri Awesome AZD
- **📦 Pelajaran Bab 1 baharu** `docs/chapter-01-foundation/dev-containers.md` — persekitaran azd yang boleh dihasilkan semula dengan Kontena Pembangunan dan GitHub Codespaces: `devcontainer.json` minimal `.devcontainer` menggunakan ciri rasmi `ghcr.io/azure/azure-dev/azd`, ciri khusus bahasa, `docker-in-docker` untuk hos kontena, dan `azd auth login --use-device-code` untuk log masuk jauh
- **🧩 Bahagian Pulumi dengan azd** dalam `docs/chapter-04-infrastructure/provisioning.md` — `infra.provider: pulumi`, susunan folder Pulumi, timbunan yang dipetakan ke persekitaran azd, output/tag yang diperlukan, dan aliran kerja `azd up` / `azd down` yang serupa
- **🎯 Panduan pemilihan hos** dalam `docs/chapter-04-infrastructure/provisioning.md` — perbandingan mesra pemula antara `appservice`, `staticwebapp`, `function`, `containerapp`, `aks`, dan `springapp`, dengan panduan bila memilih AKS atau Azure Spring Apps
- **🛠️ Panduan CI/CD Azure DevOps** dalam `docs/chapter-08-production/production-ai-practices.md` — `azd pipeline config --provider azdo`, sambungan perkhidmatan dengan federasi identiti beban kerja (OIDC), `azure-dev.yml` yang dijana, dan setup kumpulan pembolehubah
- **🔑 Prinsipal Perkhidmatan (Corak 4)** ditambah dalam `docs/chapter-03-configuration/authsecurity.md` — `az ad sp create-for-rbac`, `azd auth login` tanpa interaksi dengan rahsia klien berbanding kelayakan federasi/OIDC, bila digunakan, dan penyimpanan kredensial selamat
- **🪝 Pengendalian ralat hook** subsection dalam `docs/chapter-04-infrastructure/deployment-guide.md` — kod keluar dan `set -e`, `continueOnError`, menguji hook secara berasingan dengan `azd hooks run`, shell khusus OS, dan `--debug`
- **👥 Pasukan / persekitaran bersama** bahagian dalam `docs/chapter-03-configuration/configuration.md` — apa yang disimpan dalam `.azure/`, apa yang perlu diabaikan oleh git, persekitaran setiap pembangun, `azd env list`/`select`, dan menyediakan nilai persekitaran dalam CI/CD
- **🧰 Penjelasan `azd restore` dan pengembangan `azd package`** dalam `resources/cheat-sheet.md` — memulihkan kebergantungan dan membina artifak boleh guna tanpa melaksanakan penyebaran

#### Diubah
- **🧭 Jadual pelajaran Bab 4** dikemaskini untuk memasukkan pelajaran baharu "Menghasilkan Templat Anda Sendiri" (Pelajaran 3)
- **🧭 Jadual pelajaran Bab 1** dikemaskini untuk memasukkan pelajaran baharu "Kontena Pembangunan & Codespaces" (Pelajaran 5); footer navigasi disambungkan antara `bring-your-own-app.md` dan `dev-containers.md`

### [v3.21.0] - 2026-06-16

#### Pengisian Jurang Pemula: Pelajaran Multi-Ejen Hands-On, "Bawa Aplikasi Anda Sendiri," Terraform, dan Panduan CI/CD  
**Versi ini menutup jurang terbesar untuk panduan pemula lengkap dengan menambah dua pelajaran hands-on baharu (panduan multi-ejen yang boleh disebarkan dan menambah azd ke aplikasi sedia ada), pengenalan hook mesra pemula, bahagian Terraform dengan azd, panduan langkah demi langkah pipeline GitHub Actions, penerang untuk peluasan pratonton baru, dan senarai semak pengesahan penyebaran yang jelas.**

#### Ditambah
- **🤝 Pelajaran Bab 5 baharu** `docs/chapter-05-multi-agent/multi-agent-basics.md` — panduan dua ejen lengkap, boleh disebarkan (orchestrator + pakar) menggunakan template sebenar (`contoso-creative-writer`), merangkumi bila menggunakan multi-ejen, aliran kerja `azd up`, memahami sumber yang disebarkan, penjejakan lintas ejen, pengubahsuaian, dan pembersihan
- **📦 Pelajaran Bab 1 baharu** `docs/chapter-01-foundation/bring-your-own-app.md` — cara menambah azd ke projek sedia ada dengan `azd init` ("gunakan kod dalam direktori semasa"), memahami `azure.yaml` dan `infra/`, `azd infra generate`, pengesanan hos, dan penyebaran dengan `azd up`
- **🌐 Bahagian Terraform dengan azd** ditambah dalam `docs/chapter-04-infrastructure/provisioning.md` — konfigurasi `infra.provider: terraform`, susunan folder `.tf`, output `AZURE_*` dan penandaan `azd-env-name` yang diperlukan, dan aliran kerja `azd up` / `azd down` yang sama (menutup jurang sokongan Terraform yang pernah diklaim tetapi hanya Bicep ditunjukkan)
- **⚙️ Panduan langkah demi langkah GitHub Actions** dalam `docs/chapter-08-production/production-ai-practices.md` — dari repo GitHub ke penyebaran automatik: `azd pipeline config`, kelayakan federasi OIDC (tiada rahsia disimpan), `azure-dev.yml` yang dijana, dan panduan rahsia vs pembolehubah
- **🪝 Pengenalan "Baru kepada hook?" untuk pemula** dalam `docs/chapter-04-infrastructure/deployment-guide.md` — apa itu hook, jadual peringkat hook, hook minimal pertama, dan menjalankan hook secara manual dengan `azd hooks run`
- **✅ Senarai semak "Sahkan Penyebaran Anda"** ditambah ke Langkah 5 `docs/chapter-01-foundation/first-project.md` — ujian asap, semakan endpoint kesihatan, dan kriteria kejayaan yang jelas
- **🧩 Penerang untuk peluasan pratonton baru** `azure.ai.skills` dan `azure.ai.connections` (apa itu dan bila digunakan) dalam `docs/chapter-08-production/production-ai-practices.md`

#### Diubah
- **🧭 Jadual pelajaran Bab 5** dibetulkan: `multi-agent-basics.md` kini Pelajaran 1 (pelajaran hands-on satu-satunya), dengan label jujur bahawa Pelajaran 2 terletak di Bab 6 dan senario Runcit adalah cetak biru seni bina, bukan templat satu-satu perintah
- **🧭 Jadual pelajaran Bab 1** kini memasukkan pelajaran baharu "Bawa Aplikasi Anda Sendiri" (Pelajaran 4)
- **🔗 Footer navigasi** dikemaskini: `first-project.md` kini paut ke hadapan ke `bring-your-own-app.md`

#### Diperbaiki
- **🧱 Menutup jurang Terraform "diklaim tapi hilang"** — kursus sebelum ini merujuk sokongan Terraform tanpa menunjukkannya
- **🔀 Membetulkan pautan silang Bab 5 yang mengelirukan** yang memberi gambaran pelaksanaan multi-ejen penuh wujud, sedangkan hanya cetak biru seni bina ada

#### Fail Dikemaskini
- `changelog.md`
- `docs/chapter-01-foundation/README.md`
- `docs/chapter-01-foundation/bring-your-own-app.md` *(baharu)*
- `docs/chapter-01-foundation/first-project.md`
- `docs/chapter-04-infrastructure/deployment-guide.md`
- `docs/chapter-04-infrastructure/provisioning.md`
- `docs/chapter-05-multi-agent/README.md`
- `docs/chapter-05-multi-agent/multi-agent-basics.md` *(baharu)*
- `docs/chapter-08-production/production-ai-practices.md`

---

### [v3.20.0] - 2026-06-16

#### Penyegaran AZD 1.25.6, Arahan Sepenuhnya Kitar Hayat Ejen & Rebranding Aspire  
**Versi ini mengesahkan semula kursus dengan `azd` `1.25.6` (Jun 2026) dan peluasan `azure.ai.agents` `0.1.40-preview`, memperluas panduan AI dari "membina ejen" kepada kitar hayat ejen lengkap (uji → nilai → optimakan → periksa → padam), memperlihatkan peluasan pratonton baru `azure.ai.skills` dan `azure.ai.connections`, dan mencatat penjenamaan semula produk ".NET Aspire" → "Aspire".**

#### Ditambah
- **🔁 Liputan kitar hayat ejen penuh** untuk pemula dan jurutera AI merentas dokumen:
  - `docs/chapter-01-foundation/azd-basics.md` — Jadual Kitar Hayat (scaffold → test → measure → improve → inspect → clean up) ditambah ke bahagian Peluasan dan Arahan AI
  - `docs/chapter-08-production/production-ai-practices.md` — Bahagian baru "Mengurus Kitar Hayat Ejen" merangkumi `azd ai agent invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
  - `resources/cheat-sheet.md` — Arahan Ejen AI yang diperluas dengan `invoke`, `endpoint show`, `eval generate`, `optimize`, `code download`, dan `delete --force`
- **🧩 Peluasan pratonton baru** didokumenkan: `azure.ai.skills` (kemahiran ejen boleh guna semula) dan `azure.ai.connections` (sambungan Foundry) ditambah ke jadual peluasan dan cheat sheet
- **⏱️ Panduan masa tindak balas** — contoh `azd ai agent invoke` kini mencatat jumlah kelewatan dan masa-ke-byte-pertama
- **📌 Sepanduk versi** dalam README akar menunjuk pelajar pada `azd version` dan `azd upgrade`

#### Diubah
- **✅ Baseline pengesahan dikemaskini** dari `azd 1.23.12` (Mac 2026) ke `azd 1.25.6` (Jun 2026) merentas semua README bab dan dokumen bengkel
- **🤖 Nota peluasan Bab 2** dikemaskini dari `azure.ai.agents` `0.1.18-preview` ke `0.1.40-preview`
- **🧪 Contoh pengesahan bengkel** (`azd version` output) dikemaskini ke `1.25.6`
- **🧭 README "Apa Yang Baharu dalam azd Hari Ini"** disegarkan untuk menonjolkan kitar hayat ejen hujung-ke-hujung, peluasan AI baru, dan pembetulan mutu hidup terkini (`azd init` idempotensi, pembersihan token lapuk `azd auth login`, prom pertama kali `azd tool`)
- **📖 Bab 2 agents.md (Pilihan 4)** kini memandu pelajar kepada arahan kitar hayat selepas penyebaran dan bukannya berhenti di `azd up`

#### Diperbaiki
- **🏷️ Penamaan produk** — nota rebranding Aspire ditambah (".NET Aspire" kini hanya "Aspire"); sokongan Aspire azd tidak berubah
- **🔎 Pengesahan siaran langsung** disahkan melawan feed siaran Azure Developer CLI: CLI stabil `1.25.6` (2026-06-12) dan `azure.ai.agents` `0.1.40-preview` (2026-06-15)

#### Fail Dikemaskini
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
#### Penjelasan Pendaftaran Pemula, Pengesahan Persediaan & Pembersihan Arahan AZD Akhir
**Versi ini mengikuti imbasan pengesahan AZD 1.23 dengan laluan dokumentasi fokus pemula: ia menjelaskan panduan pengesahan AZD-pertama, menambah skrip pengesahan persediaan tempatan, mengesahkan arahan utama terhadap CLI AZD secara langsung, dan menghapuskan rujukan arahan bahasa Inggeris yang telah ketinggalan zaman di luar changelog.**

#### Ditambah
- **🧪 Skrip pengesahan persediaan pemula** dengan `validate-setup.ps1` dan `validate-setup.sh` supaya pelajar dapat mengesahkan alat yang diperlukan sebelum memulakan Bab 1
- **✅ Langkah pengesahan persediaan awal** dalam README utama dan README Bab 1 supaya prasyarat yang hilang dapat dikesan sebelum `azd up`

#### Diubah
- **🔐 Panduan pengesahan pemula** kini secara konsisten menganggap `azd auth login` sebagai laluan utama untuk aliran kerja AZD, dengan `az login` disebut sebagai pilihan kecuali arahan Azure CLI digunakan secara langsung
- **📚 Aliran pendaftaran Bab 1** kini mengarahkan pelajar untuk mengesahkan persediaan tempatan mereka sebelum pemasangan, pengesahan, dan langkah penyebaran pertama
- **🛠️ Mesej pengesahan** kini memisahkan dengan jelas keperluan yang menghalang daripada amaran Azure CLI pilihan untuk laluan pemula AZD sahaja
- **📖 Dokumen konfigurasi, penyelesaian masalah, dan contoh** kini membezakan antara pengesahan AZD yang diperlukan dan log masuk Azure CLI pilihan di mana kedua-duanya sebelum ini dibentangkan tanpa konteks

#### Dibaiki
- **📋 Rujukan arahan bahasa Inggeris yang tinggal** dikemas kini kepada bentuk AZD semasa, termasuk `azd config show` dalam lembaran cheat dan `azd monitor --overview` di mana panduan gambaran keseluruhan Azure Portal dimaksudkan
- **🧭 Tuntutan pemula dalam Bab 1** diperkemaskan supaya tidak menjanjikan perilaku tanpa ralat atau rollback yang dijamin merentas semua templat dan sumber Azure
- **🔎 Pengesahan CLI langsung** mengesahkan sokongan semasa untuk `azd env get-values`, `azd template list`, `azd extension list --installed`, `azd copilot consent list`, `azd mcp start`, `azd provision --preview`, `azd monitor --logs`, dan `azd down --force --purge`

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
**Versi ini menjalankan imbasan pengesahan dokumentasi terhadap `azd` `1.23.12`, mengemas kini contoh arahan AZD yang ketinggalan zaman, menyegarkan panduan model AI kepada lalai semasa, dan meluaskan arahan bengkel di luar GitHub Codespaces untuk menyokong juga bekas pembangunan dan klon tempatan.**

#### Ditambah
- **✅ Nota pengesahan di seluruh bab teras dan dokumen bengkel** untuk menjadikan garis asas AZD yang diuji jelas kepada pelajar yang menggunakan binaan CLI yang lebih baru atau lama
- **⏱️ Panduan tamat masa penyebaran** untuk penyebaran aplikasi AI yang berjalan lama menggunakan `azd deploy --timeout 1800`
- **🔎 Langkah pemeriksaan sambungan** dengan `azd extension show azure.ai.agents` dalam dokumen aliran kerja AI
- **🌐 Panduan persekitaran bengkel yang lebih luas** merangkumi GitHub Codespaces, bekas pembangunan dan klon tempatan dengan MkDocs

#### Diubah
- **📚 README pengenalan bab** kini secara konsisten menyatakan pengesahan terhadap `azd 1.23.12` merentas asas, konfigurasi, infrastruktur, pelbagai ejen, pra-penyebaran, penyelesaian masalah, dan bahagian pengeluaran
- **🛠️ Rujukan arahan AZD** dikemas kini kepada bentuk semasa merentas dokumen:
  - `azd config list` → `azd config show`
  - `azd env show` → `azd env list` atau `azd env get-value(s)` bergantung pada konteks
  - `azd auth whoami` → `azd auth status`
  - `azd monitor` → `azd monitor --overview` di mana gambaran keseluruhan Application Insights dimaksudkan
- **🧪 Contoh pratonton penyediaan** dipermudahkan kepada penggunaan sokongan semasa seperti `azd provision --preview` dan `azd provision --preview -e production`
- **🧭 Aliran bengkel** dikemas kini supaya pelajar boleh melengkapkan makmal dalam Codespaces, bekas pembangunan, atau klon tempatan dan bukannya menganggap pelaksanaan hanya di Codespaces
- **🔐 Panduan pengesahan** kini mengutamakan `azd auth login` untuk aliran kerja AZD, dengan `az login` sebagai pilihan apabila arahan Azure CLI digunakan secara langsung

#### Dibaiki
- **🪟 Arahan pemasangan Windows** dinormalisasi kepada ejaan kes pakej `winget` semasa dalam panduan pemasangan
- **🐧 Panduan pemasangan Linux** diperbetulkan untuk mengelakkan arahan pengurus pakej `azd` khusus distro yang tidak disokong dan sebaliknya merujuk kepada aset keluaran di mana sesuai
- **📦 Contoh model AI** disegar semula daripada lalai lama seperti `gpt-35-turbo` dan `text-embedding-ada-002` kepada contoh semasa seperti `gpt-4.1-mini`, `gpt-4.1`, dan `text-embedding-3-large`
- **📋 Petikan penyebaran dan diagnostik** diperbetulkan untuk menggunakan arahan persekitaran dan status semasa dalam log, skrip, dan langkah penyelesaian masalah
- **⚙️ Panduan GitHub Actions** dikemas kini dari `Azure/setup-azd@v1.0.0` ke `Azure/setup-azd@v2`
- **🤖 Panduan keizinan MCP/Copilot** dikemas kini dari `azd mcp consent` ke `azd copilot consent list`

#### Dipertingkatkan
- **🧠 Panduan bab AI** kini lebih baik menerangkan tingkah laku sensitif pratonton `azd ai`, log masuk khusus penyewa, penggunaan sambungan semasa, dan cadangan penyebaran model yang dikemas kini
- **🧪 Arahan bengkel** kini menggunakan contoh versi yang lebih realistik dan bahasa penetapan persekitaran yang lebih jelas untuk makmal tangan
- **📈 Dokumen pengeluaran dan penyelesaian masalah** kini selari lebih baik dengan pemantauan semasa, model sandaran, dan contoh peringkat kos

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
**Versi ini menambah liputan arahan `azd ai`, `azd extension`, dan `azd mcp` merentas semua bab berkaitan AI, membaiki pautan rosak dan kod lapuk dalam agents.md, mengemas kini lembaran cheat, dan merombak bahagian Templat Contoh dengan penerangan yang disahkan dan templat Azure AI AZD baru.**

#### Ditambah
- **🤖 Liputan AZD AI CLI** merentas 7 fail (sebelumnya hanya di Bab 8):
  - `docs/chapter-01-foundation/azd-basics.md` — Bahagian baru "Sambungan dan Arahan AI" memperkenalkan `azd extension`, `azd ai agent init`, dan `azd mcp`
  - `docs/chapter-02-ai-development/agents.md` — Pilihan 4: `azd ai agent init` dengan jadual perbandingan (templat vs pendekatan manifest)
  - `docs/chapter-02-ai-development/microsoft-foundry-integration.md` — Subbahagian "Sambungan AZD untuk Foundry" dan "Penyebaran Berasaskan Ejen"
  - `docs/chapter-05-multi-agent/README.md` — Permulaan Pantas kini menunjukkan kedua-dua laluan penyebaran berasaskan templat dan manifest
  - `docs/chapter-06-pre-deployment/coordination-patterns.md` — Bahagian Penyebaran kini termasuk pilihan `azd ai agent init`
  - `docs/chapter-07-troubleshooting/ai-troubleshooting.md` — Subbahagian "Arahan Sambungan AZD AI untuk Diagnosis"
  - `resources/cheat-sheet.md` — Bahagian baru "Arahan AI & Sambungan" dengan `azd extension`, `azd ai agent init`, `azd mcp`, dan `azd infra generate`
- **📦 Templat contoh AZD AI baru** dalam `microsoft-foundry-integration.md`:
  - **azure-search-openai-demo-csharp** — Perbualan RAG .NET dengan Blazor WebAssembly, Semantic Kernel, dan sokongan suara
  - **azure-search-openai-demo-java** — Perbualan RAG Java menggunakan Langchain4J dengan pilihan penyebaran ACA/AKS
  - **contoso-creative-writer** — Aplikasi penulisan kreatif pelbagai ejen menggunakan Azure AI Agent Service, Bing Grounding, dan Prompty
  - **serverless-chat-langchainjs** — RAG tanpa pelayan menggunakan Azure Functions + LangChain.js + Cosmos DB dengan sokongan pembangunan tempatan Ollama
  - **chat-with-your-data-solution-accelerator** — Pecut an RAG perusahaan dengan portal pentadbir, integrasi Teams, dan pilihan PostgreSQL/Cosmos DB
  - **azure-ai-travel-agents** — Aplikasi rujukan orkestra MCP pelbagai ejen dengan pelayan dalam .NET, Python, Java, dan TypeScript
  - **azd-ai-starter** — Templat permulaan Bicep infrastruktur Azure AI minimum
  - **🔗 Pautan Galeri AZD AI Hebat** — Rujukan kepada [galeri awesome-azd AI](https://azure.github.io/awesome-azd/?tags=ai) (80+ templat)

#### Dibaiki
- **🔗 Navigasi agents.md**: Pautan Sebelumnya/Seterusnya kini sepadan dengan susunan pelajaran README Bab 2 (Integrasi Microsoft Foundry → Ejen → Penyebaran Model AI)
- **🔗 Pautan rosak agents.md**: `production-ai-practices.md` diperbetulkan kepada `../chapter-08-production/production-ai-practices.md` (3 kejadian)
- **📦 Kod lapuk agents.md**: Gantikan `opencensus` dengan `azure-monitor-opentelemetry` + SDK OpenTelemetry
- **🐛 API tidak sah agents.md**: Alihkan `max_tokens` dari `create_agent()` ke `create_run()` sebagai `max_completion_tokens`
- **🔢 Pengiraan token agents.md**: Gantikan anggaran kasar `len//4` dengan `tiktoken.encoding_for_model()`
- **azure-search-openai-demo**: Betulkan perkhidmatan dari "Cognitive Search + App Service" ke "Azure AI Search + Azure Container Apps" (hos lalai bertukar Okt 2024)
- **contoso-chat**: Kemas kini penerangan untuk merujuk Azure AI Foundry + Prompty, selaras dengan tajuk repositori dan teknologinya

#### Dibuang
- **ai-document-processing**: Buang rujukan templat yang tidak berfungsi (repositori tidak boleh diakses secara terbuka sebagai templat AZD)

#### Dipertingkatkan
- **📝 Latihan agents.md**: Latihan 1 kini menunjukkan output yang dijangka dan langkah `azd monitor`; Latihan 2 termasuk kod pendaftaran penuh `FunctionTool`; Latihan 3 menggantikan panduan kabur dengan arahan konkrit `prepdocs.py`
- **📚 Sumber agents.md**: Kemas kini pautan dokumentasi kepada dokumen dan panduan pantas Azure AI Agent Service semasa
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
**Versi ini meningkatkan navigasi bab README.md dengan format jadual yang dipertingkatkan.**

#### Ditukar
- **Jadual Peta Kursus**: Dipertingkat dengan pautan pelajaran langsung, anggaran tempoh dan penarafan kerumitan
- **Pembersihan Folder**: Menghapus folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pengesahan Pautan**: Semua 21+ pautan dalaman dalam jadual Peta Kursus disahkan

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk
**Versi ini mengemas kini rujukan produk kepada penjenamaan Microsoft semasa.**

#### Ditukar
- **Microsoft Foundry → Microsoft Foundry**: Semua rujukan dikemas kini merentasi fail bukan terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama perkhidmatan dikemas kini bagi mencerminkan penjenamaan semasa

#### Fail Dikemaskini
- `README.md` - Halaman utama kursus
- `changelog.md` - Sejarah versi
- `course-outline.md` - Struktur kursus
- `docs/chapter-02-ai-development/agents.md` - Panduan agen AI
- `examples/README.md` - Dokumentasi contoh
- `workshop/README.md` - Halaman utama bengkel
- `workshop/docs/index.md` - Indeks bengkel
- `workshop/docs/instructions/*.md` - Semua fail arahan bengkel

---

### [v3.15.0] - 2026-02-05

#### Penstrukturan Semula Repositori Utama: Nama Folder Berasaskan Bab
**Versi ini menyusun semula dokumentasi ke dalam folder bab khusus bagi navigasi yang lebih jelas.**

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
- **📚 Fail README Bab**: Dicipta README.md dalam setiap folder bab dengan:
  - Objektif pembelajaran dan tempoh
  - Jadual pelajaran dengan penerangan
  - Arahan mula cepat
  - Navigasi ke bab lain

#### Ditukar
- **🔗 Dikemas kini semua pautan dalaman**: 78+ laluan dikemas kini merentasi semua fail dokumentasi
- **🗺️ README.md Utama**: Dikemas kini Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Dikemas kini rujukan silang kepada folder bab

#### Dibuang
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Penstrukturan Semula Repositori: Navigasi Bab
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Baru Agen AI
**Versi ini menambah panduan lengkap untuk penerapan agen AI dengan Azure Developer CLI.**

#### Ditambah
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap merangkumi:
  - Apa itu agen AI dan bagaimana ia berbeza daripada chatbot
  - Tiga templat agen mula cepat (Foundry Agents, Prompty, RAG)
  - Corak seni bina agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi alat dan penyesuaian
  - Pemantauan dan penjejakan metrik
  - Pertimbangan kos dan pengoptimuman
  - Senario biasa penyelesaian masalah
  - Tiga latihan praktikal dengan kriteria kejayaan

#### Struktur Kandungan
- **Pengenalan**: Konsep agen untuk pemula
- **Mula Cepat**: Terapkan agen dengan `azd init --template get-started-with-ai-agents`
- **Corak Seni Bina**: Rajah visual corak agen
- **Konfigurasi**: Persediaan alat dan pembolehubah persekitaran
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktikal secara berperingkat (20-45 minit setiap satu)

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer
**Versi ini mengemas kini konfigurasi bekas pembangunan dengan alat moden dan tetapan lalai lebih baik untuk pengalaman belajar AZD.**

#### Ditukar
- **🐳 Imej Asas**: Dikemas kini dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terkini)
- **📛 Nama Bekas**: Ditukar dari "Python 3" ke "AZD for Beginners" untuk kejelasan

#### Ditambah
- **🔧 Ciri Dev Container Baru**:
  - `azure-cli` dengan sokongan Bicep diaktifkan
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk pengurusan templat
  - `docker-in-docker` untuk penerapan aplikasi kontena

- **🔌 Penyaluran Port**: Port dipra-konfigurasi untuk pembangunan biasa:
  - 8000 (pratonton MkDocs)
  - 3000 (aplikasi web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Sambungan VS Code Baru**:
  - `ms-python.vscode-pylance` - IntelliSense Python dipertingkatkan
  - `ms-azuretools.vscode-azurefunctions` - Sokongan Azure Functions
  - `ms-azuretools.vscode-docker` - Sokongan Docker
  - `ms-azuretools.vscode-bicep` - Sokongan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pengurusan sumber Azure
  - `yzhang.markdown-all-in-one` - Penyuntingan Markdown
  - `DavidAnson.vscode-markdownlint` - Penyemak tatabahasa Markdown
  - `bierner.markdown-mermaid` - Sokongan rajah Mermaid
  - `redhat.vscode-yaml` - Sokongan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Sejarah Git

- **⚙️ Tetapan VS Code**: Ditambah tetapan lalai untuk pengantara Python, format semasa simpan, dan pemangkasan ruang kosong

- **📦 Dikemaskini requirements-dev.txt**:
  - Ditambah plugin MkDocs minify
  - Ditambah pre-commit untuk kualiti kod
  - Ditambah pakej SDK Azure (azure-identity, azure-mgmt-resource)

#### Dibaiki
- **Perintah Post-Create**: Kini mengesahkan pemasangan AZD dan Azure CLI semasa permulaan bekas

---

### [v3.11.0] - 2026-02-05

#### Pembaharuan README Mesra Pemula
**Versi ini meningkatkan README.md untuk lebih mudah difahami oleh pemula dan menambah sumber penting untuk pembangun AI.**

#### Ditambah
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas kapan menggunakan setiap alat dengan contoh praktikal
- **🌟 Pautan Awesome AZD**: Pautan langsung ke galeri templat komuniti dan sumber sumbangan:
  - [Awesome AZD Gallery](https://azure.github.io/awesome-azd/) - 200+ templat sedia untuk diterapkan
  - [Submit a Template](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti
- **🎯 Panduan Mula Cepat**: Bahagian mula cepat 3 langkah mudah (Pasang → Log masuk → Terap)
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas tempat mula berdasarkan pengalaman pembangun

#### Ditukar
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat utama dahulu
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" bagi pemula lengkap
- **Dibuang Kandungan Duplikat**: Bahagian penyelesaian masalah yang berganda dibuang
- **Perintah Penyelesaian Masalah**: Rujukan `azd logs` diperbaiki menggunakan `azd monitor --logs` yang sah

#### Dibaiki
- **🔐 Perintah Pengesahan**: Ditambah `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Rujukan Perintah Tidak Sah**: `azd logs` yang tinggal dibuang dari bahagian penyelesaian masalah README

#### Nota
- **Skop**: Perubahan dikenakan ke README.md utama dan resources/cheat-sheet.md
- **Sasaran**: Penambahbaikan khusus untuk pembangun baru kepada AZD

---

### [v3.10.0] - 2026-02-05

#### Kemas Kini Ketepatan Perintah Azure Developer CLI
**Versi ini membetulkan perintah AZD yang tidak wujud dalam dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Dibaiki
- **🔧 Perintah AZD Tidak Wujud Dibuang**: Audit dan pembetulan menyeluruh perintah tidak sah:
  - `azd logs` (tidak wujud) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - Perintah sub `azd service` (tidak wujud) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak wujud) → dibuang atau diganti dengan alternatif sah
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dibuang
  - Flag `azd provision --what-if/--rollback` (tidak wujud) → dikemas kini guna `--preview`
  - `azd config validate` (tidak wujud) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dibuang

- **📚 Fail Dikemas Kini dengan Pembetulan Perintah**:
  - `resources/cheat-sheet.md`: Peningkatan rujukan perintah besar-besaran
  - `docs/deployment/deployment-guide.md`: Perbaikan strategi rollback dan penerapan
  - `docs/troubleshooting/debugging.md`: Betulkan bahagian analisis log
  - `docs/troubleshooting/common-issues.md`: Kemas kini perintah penyelesaian masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan bahagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Betulkan perintah pemantauan
  - `docs/getting-started/first-project.md`: Kemas kini contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Betulkan contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Betulkan perintah melihat log
  - `docs/pre-deployment/coordination-patterns.md`: Betulkan perintah debugging agen

- **📝 Rujukan Versi Dikemas Kini**: 
  - `docs/getting-started/installation.md`: Tukar versi `1.5.0` tetap kepada generik `1.x.x` dengan pautan kepada siaran

#### Ditukar
- **Strategi Rollback**: Dikemas kini dokumentasi guna rollback berasaskan Git (AZD tiada rollback asli)
- **Melihat Log**: Ganti rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bahagian Prestasi**: Buang flag penerapan selari/inkremental tidak wujud, sediakan alternatif sah

#### Butiran Teknikal
- **Perintah AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag sah azd monitor**: `--live`, `--logs`, `--overview`
- **Ciri Dibuang**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Perintah disahkan dengan Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyiapan Bengkel dan Kualiti Dokumentasi Dikemaskini
**Versi ini menyiapkan modul bengkel interaktif, membetulkan semua pautan dokumentasi yang rosak, dan meningkatkan kualiti kandungan untuk pembangun AI menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen garis panduan sumbangan baru dengan:
  - Arahan jelas untuk melaporkan isu dan mencadangkan perubahan
  - Standard dokumentasi untuk kandungan baru

  - Garis panduan contoh kod dan konvensyen mesej komit
  - Maklumat penglibatan komuniti

#### Selesai
- **🎯 Modul Bengkel 7 (Penutupan)**: Modul penutupan lengkap dengan:
  - Ringkasan komprehensif pencapaian bengkel
  - Bahagian konsep utama yang dikuasai meliputi AZD, templat, dan Microsoft Foundry
  - Cadangan penerusan perjalanan pembelajaran
  - Latihan cabaran bengkel dengan penarafan kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Membongkar)**: Objektif pembelajaran dikemas kini dengan:
  - Panduan pengaktifan GitHub Copilot bersama pelayan MCP
  - Memahami struktur folder templat AZD
  - Corak organisasi infrastruktur-sebagai-kod (Bicep)
  - Arahan makmal praktikal

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Diselesaikan dengan:
  - Objektif pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk penyahtersediaan infrastruktur yang selamat
  - Panduan pemulihan perkhidmatan kognitif yang dipadam secara lembut
  - Cadangan penerokaan bonus untuk GitHub Copilot dan Portal Azure

#### Dibaiki
- **🔗 Pembetulan Pautan Rosak**: Menyelesaikan 15+ pautan dokumentasi dalaman yang rosak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki laluan ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Membetulkan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Menggantikan cicd-integration.md yang tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki laluan FAQ dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Membetulkan rumah kursus dan laluan panduan penyebaran
  - `resources/faq.md` dan `resources/glossary.md`: Kemas kini rujukan bab AI
  - `course-outline.md`: Memperbaiki panduan pengajar dan rujukan makmal bengkel AI

- **📅 Sepanduk Status Bengkel**: Dikemas kini dari "Sedang Dibina" kepada status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Memperbaiki pautan navigasi rosak dalam README.md bengkel yang menunjuk ke folder lab-1-azd-basics yang tidak wujud

#### Ditukar
- **Pembentangan Bengkel**: Mengeluarkan amaran "sedang dibina", bengkel kini lengkap dan sedia digunakan
- **Konsistensi Navigasi**: Memastikan semua modul bengkel mempunyai navigasi antara modul yang betul
- **Rujukan Laluan Pembelajaran**: Mengemas kini silang rujukan bab untuk menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown Bahasa Inggeris mempunyai pautan dalaman yang sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan betul
- ✅ Kandungan sesuai untuk pembangun AI menggunakan Microsoft AZD
- ✅ Bahasa dan struktur mesra pemula dikekalkan sepanjang masa
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan .md dalaman
- **Audit Kandungan**: Semakan manual untuk kesempurnaan bengkel dan kesesuaian pemula
- **Sistem Navigasi**: Corak navigasi bab dan modul yang konsisten digunakan

#### Nota
- **Skop**: Perubahan terpakai hanya kepada dokumentasi Bahasa Inggeris
- **Terjemahan**: Folder terjemahan tidak dikemas kini dalam versi ini (terjemahan automatik akan diselaraskan kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan 3-4 jam pembelajaran praktikal

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Berbilang Ejen
**Versi ini menambah pelajaran kelas A yang komprehensif mengenai integrasi Application Insights, corak pengesahan, dan koordinasi berbilang ejen untuk penyebaran produksi.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Penyebaran fokus AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri tersuai (1,200+ baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Model Microsoft Foundry)
  - 6 rajah Mermaid (senibina, jejak diedar, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh pertanyaan Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan pembaikan ralat masa nyata
  - Masa pembelajaran 40-50 minit dengan corak siap sedia produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, pengenalpastian terurus)
  - Templat infrastruktur Bicep lengkap untuk penyebaran selamat
  - Kod aplikasi Node.js dengan integrasi SDK Azure
  - 3 latihan lengkap (aktifkan pengenalpastian terurus, pengenalpastian ditugaskan pengguna, pusingan Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan siap produksi

- **🤖 Pelajaran Corak Koordinasi Berbilang Ejen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (bersiri, selari, hierarki, berasaskan acara, konsensus)
  - Pelaksanaan perkhidmatan pengarah lengkap (Python/Flask, 1,500+ baris)
  - 3 pelaksanaan ejen khusus (Penyelidikan, Penulis, Penyunting)
  - Integrasi Service Bus untuk penghantaran mesej
  - Pengurusan keadaan Cosmos DB untuk sistem teragih
  - 6 rajah Mermaid menunjukkan interaksi ejen
  - 3 latihan lanjutan (pengendalian tamat masa, logik cuba semula, pemutus litar)
  - Pecahan kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Dipertingkat
- **Bab Pra-Penyebaran**: Kini termasuk corak pemantauan dan koordinasi komprehensif
- **Bab Mula**: Dipertingkat dengan corak pengesahan profesional
- **Kesediaan Produksi**: Liputan lengkap dari keselamatan ke kebolehpantauan
- **Garis Kursus**: Dikemas kini untuk merujuk pelajaran baru dalam Bab 3 dan 6

#### Ditukar
- **Perkembangan Pembelajaran**: Integrasi lebih baik keselamatan dan pemantauan sepanjang kursus
- **Kualiti Dokumentasi**: Standard kelas A konsisten (95-97%) merentasi pelajaran baru
- **Corak Produksi**: Liputan menyeluruh hujung ke hujung untuk penyebaran perusahaan

#### Diperkemaskan
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan produksi
- **Standard Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Kebolehpantauan**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Model Microsoft Foundry dan sistem berbilang ejen

#### Disahkan
- ✅ Semua pelajaran menyertakan kod kerja lengkap (bukan petikan)
- ✅ Rajah Mermaid untuk pembelajaran visual (19 keseluruhan 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 keseluruhan)
- ✅ Templat Bicep siap produksi boleh disebarkan melalui `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Titik pemeriksaan pengetahuan dengan arahan pengesahan

#### Keputusan Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Seni bina berbilang ejen lanjutan
- **Kandungan Baharu Keseluruhan**: - Standard kualiti tinggi konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + jejak diedar
- **Pengesahan**: Pengenalpastian Terurus + Key Vault + corak RBAC
- **Berbilang Ejen**: Service Bus + Cosmos DB + Container Apps + pengurusan pengarah
- **Pemantauan**: Metrik langsung + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, polisi simpanan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualiti Dokumentasi dan Contoh Model Microsoft Foundry Baharu
**Versi ini meningkatkan kualiti dokumentasi merentasi repositori dan menambah contoh penyebaran Model Microsoft Foundry lengkap dengan antara muka perbualan gpt-4.1.**

#### Ditambah
- **🤖 Contoh Perbualan Model Microsoft Foundry**: Penyebaran gpt-4.1 lengkap dengan pelaksanaan berfungsi dalam `examples/azure-openai-chat/`:
  - Infrastruktur Model Microsoft Foundry lengkap (penyebaran model gpt-4.1)
  - Antara muka perbualan baris arahan Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Had kadar dan pengendalian ralat
  - README menyeluruh dengan panduan penyebaran 35-45 minit
  - 11 fail bersedia produksi (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Ditambah latihan praktikal dalam panduan konfigurasi:
  - Latihan 1: Konfigurasi pelbagai persekitaran (15 minit)
  - Latihan 2: Amalan pengurusan rahsia (10 minit)
  - Kriteria kejayaan jelas dan langkah pengesahan
- **✅ Pengesahan Penyebaran**: Ditambah bahagian pengesahan dalam panduan penyebaran:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output yang dijangka untuk semua arahan penyebaran
  - Rujukan pantas penyelesaian masalah

#### Dipertingkat
- **examples/README.md**: Dikemas kini ke kualiti kelas A (93%):
  - Ditambah azure-openai-chat ke semua seksyen berkaitan
  - Dikemas kini bilangan contoh tempatan dari 3 ke 4
  - Ditambah ke jadual Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Pertengahan
  - Ditambah ke seksyen Templat Microsoft Foundry
  - Dikemas kini Matriks Perbandingan dan bahagian pencarian teknologi
- **Kualiti Dokumentasi**: Dipertingkat B+ (87%) → A- (92%) merentasi folder docs:
  - Ditambah output yang dijangka kepada contoh arahan penting
  - Disertakan langkah pengesahan untuk perubahan konfigurasi
  - Diperkemaskan pembelajaran praktikal dengan latihan praktikal

#### Ditukar
- **Perkembangan Pembelajaran**: Integrasi lebih baik contoh AI untuk pelajar pertengahan
- **Struktur Dokumentasi**: Latihan lebih boleh diambil tindakan dengan hasil jelas
- **Proses Pengesahan**: Kriteria kejayaan eksplisit ditambah ke aliran kerja utama

#### Diperkemaskan
- **Pengalaman Pembangun**: Penyebaran Model Microsoft Foundry kini mengambil 35-45 minit (berbanding 60-90 untuk alternatif kompleks)
- **Ketelusan Kos**: Anggaran kos jelas ($50-200/bulan) untuk contoh Model Microsoft Foundry
- **Laluan Pembelajaran**: Pembangun AI mempunyai titik masuk jelas dengan azure-openai-chat
- **Standard Dokumentasi**: Output dijangka konsisten dan langkah pengesahan

#### Disahkan
- ✅ Contoh Model Microsoft Foundry berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan sintaksis betul
- ✅ Arahan README sepadan dengan pengalaman penyebaran sebenar
- ✅ Pautan dokumentasi dikemas kini merentasi 8+ lokasi
- ✅ Indeks contoh mencerminkan 4 contoh tempatan dengan tepat
- ✅ Tiada pautan luaran duplikat dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Seni Bina Model Microsoft Foundry**: gpt-4.1 + Key Vault + corak Container Apps
- **Keselamatan**: Pengenalpastian Terurus sedia, rahsia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Penyebaran**: Perintah tunggal `azd up` untuk penyediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemas Kini Utama: Contoh Penyebaran Aplikasi Bekas
**Versi ini memperkenalkan contoh penyebaran aplikasi bekas siap produksi yang komprehensif menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke laluan pembelajaran.**

#### Ditambah
- **🚀 Contoh Aplikasi Bekas**: Contoh tempatan baru dalam `examples/container-app/`:
  - [Panduan Induk](examples/container-app/README.md): Gambaran keseluruhan lengkap penyebaran bekas, mula cepat, produksi, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala ke sifar, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Senibina Mikroseservis](../../examples/container-app/microservices): Penyebaran multi-perkhidmatan siap produksi (API Gateway, Produk, Pesanan, Pengguna, Pemberitahuan), pesanan tak segerak, Service Bus, Cosmos DB, Azure SQL, jejak diedar, penyebaran biru-hijau/canary
- **Amalan Terbaik**: Keselamatan, pemantauan, pengoptimuman kos, dan panduan CI/CD untuk beban kerja berasaskan bekas
- **Contoh Kod**: Lengkap `azure.yaml`, templat Bicep, dan pelaksanaan perkhidmatan pelbagai bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung-ke-hujung, arahan pemantauan, panduan penyelesaian masalah

#### Ditukar
- **README.md**: Dikemas kini untuk menampilkan dan memaut ke contoh aplikasi bekas baru di bawah "Contoh Tempatan - Aplikasi Bekas"
- **examples/README.md**: Dikemas kini untuk menonjolkan contoh aplikasi bekas, menambah entri matriks perbandingan, dan mengemas kini rujukan teknologi/senibina
- **Garis Kursus & Panduan Kajian**: Dikemas kini untuk merujuk contoh aplikasi bekas dan corak penyebaran dalam bab yang berkaitan

#### Disahkan
- ✅ Semua contoh baru boleh disebarkan dengan `azd up` dan mengikuti amalan terbaik
- ✅ Silang pautan dokumentasi dan navigasi dikemas kini
- ✅ Contoh merangkumi senario dari pemula ke lanjutan, termasuk mikroseservis produksi

#### Nota
- **Skop**: Dokumentasi dan contoh Bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak bekas lanjutan tambahan dan automasi CI/CD dalam siaran akan datang

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan penukaran nama produk menyeluruh dari "Microsoft Foundry" kepada "Microsoft Foundry" dalam semua dokumentasi Bahasa Inggeris, mencerminkan penjenamaan rasmi Microsoft.**

#### Ditukar
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula lengkap dari "Microsoft Foundry" kepada "Microsoft Foundry"
  - Dikemas kini semua rujukan dalam dokumentasi Bahasa Inggeris dalam folder `docs/`
  - Menamakan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Tukar nama fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini merentasi 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula kepada `docs/microsoft-foundry/`
  - Semua rujukan silang dikemas kini untuk mencerminkan struktur folder baru
  - Pautan navigasi disahkan merentasi semua dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini untuk merujuk nama fail baru

#### Fail Dikemaskini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari kemas kini sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan rujukan silang dikemas kini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemas kini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemas kini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemas kini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemas kini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran keseluruhan kursus, tajuk bab, seksyen templat, pandangan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran keseluruhan, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen Bahasa Inggeris
- ✅ Tiada lagi rujukan nama produk "Microsoft Foundry" dalam dokumen Bahasa Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baru
- ✅ Penamaan semula fail dan folder dilaksanakan dengan jayanya
- ✅ Rujukan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan hanya pada dokumentasi Bahasa Inggeris dalam folder `docs/`
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk kepada penamaan lama (akan ditangani dalam kemas kini akan datang)
- **Pautan Luar**: URL luaran dan rujukan repositori GitHub kekal tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cawangan tempatan atau dokumentasi merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dokumentasi dalaman masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Penambahbaikan Pratonton Infrastruktur dan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton Azure Developer CLI yang baru dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan menyeluruh keupayaan pratonton infrastruktur baru
  - Rujukan arahan dan contoh penggunaan dalam lembaran pintas
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk pengesahan penyebaran lebih selamat
  - Kemas kini panduan mula dengan amalan penyebaran berfokuskan keselamatan
- **🚧 Sepanduk Status Bengkel**: Sepanduk HTML profesional menunjukkan status pembangunan bengkel
  - Reka bentuk gradasi dengan indikator pembinaan untuk komunikasi pengguna jelas
  - Cap waktu dikemas kini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Ditingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton disepadukan sepanjang dokumentasi penyebaran
- **Pengesahan Pra-Penyebaran**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan arahan dikemas kini termasuk pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan jelas ditetapkan untuk pengguna tentang status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Penyebaran**: Aliran kerja pratonton-dulu kini menjadi pendekatan yang disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dimajukan lebih awal dalam proses pembelajaran
- **Persembahan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan yang jelas

#### Diperbaiki
- **Pendekatan Berfokus Keselamatan**: Perubahan infrastruktur kini boleh disahkan sebelum penyebaran
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Memahami kos sumber dengan lebih baik sebelum penyediaan
- **Pengurangan Risiko**: Mengurangkan kegagalan penyebaran melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-fail Dokumen**: Ciri pratonton didokumentasikan merentasi 4 fail utama
- **Corak Arahan**: Sintaks dan contoh konsisten dalam seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton disertakan dalam aliran kerja pengesahan dan skrip
- **Penanda Visual**: Tanda ciri BARU jelas untuk kemudahan penemuan

#### Infrastruktur Bengkel
- **Komunikasi Status**: Sepanduk HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pembangunan jelas mengelakkan kekeliruan
- **Persembahan Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap waktu kemas kini Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel yang menyeluruh dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs
- **📝 Arahan Bengkel Berstruktur**: Laluan pembelajaran panduan 7 langkah dari penemuan ke pengubahsuaian
  - 0-Pengenalan: Gambaran keseluruhan bengkel dan persediaan
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat
  - 2-Sahkan-Templat-AI: Prosedur penyebaran dan pengesahan
  - 3-Teliti-Templat-AI: Memahami seni bina templat
  - 4-Konfigurasi-Templat-AI: Konfigurasi dan pengubahsuaian
  - 5-Ubahsuai-Templat-AI: Pengubahsuaian lanjutan dan iterasi
  - 6-Bongkar-Infrastruktur: Pembersihan dan pengurusan sumber
  - 7-Ringkasan: Rumusan dan langkah seterusnya
- **🛠️ Alatan Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran ditingkatkan
- **🎯 Laluan Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Penyebaran → Pengubahsuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan tanpa gangguan

#### Ditingkatkan
- **Makmal Bengkel AI**: Diperluas dengan pengalaman pembelajaran berstruktur selama 2-3 jam menyeluruh
- **Dokumentasi Bengkel**: Persembahan profesional dengan navigasi dan bahan visual
- **Progresi Pembelajaran**: Panduan langkah demi langkah jelas dari pemilihan templat ke penyebaran produksi
- **Pengalaman Pembangun**: Alatan bersepadu untuk aliran kerja pembangunan yang lancar

#### Diperbaiki
- **Kebolehcapaian**: Antara muka berasaskan pelayar dengan capaian carian, fungsi salin, dan togol tema
- **Pembelajaran Berdasarkan Kelajuan Sendiri**: Struktur bengkel fleksibel menyesuaikan kelajuan pembelajaran berlainan
- **Penggunaan Praktikal**: Senario penyebaran templat AI dunia sebenar
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan dan kolaborasi bengkel

#### Ciri Bengkel
- **Carian Terbina Dalam**: Penemuan kata kunci dan pelajaran pantas
- **Salin Blok Kod**: Fungsi seret untuk salin semua contoh kod
- **Togol Tema**: Sokongan mod gelap/terang untuk pilihan berbeza
- **Aset Visual**: Tangkapan skrin dan rajah untuk kefahaman lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penyusunan Semula Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab yang menyeluruh dengan navigasi yang dipertingkatkan merentasi keseluruhan repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menstruktur semula keseluruhan kursus ke dalam 8 bab pembelajaran progresif
  - Bab 1: Asas & Mula Pantas (⭐ - 30-45 minit)
  - Bab 2: Pembangunan Berfokus AI (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Pelbagai ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan & Perancangan Pra-Penyebaran (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Pembaikan (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Menyeluruh**: Header dan footer navigasi konsisten merentasi semua dokumentasi
- **🎯 Penjejakan Progres**: Senarai semak penyelesaian kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Laluan Pembelajaran**: Titik kemasukan jelas untuk pelbagai tahap pengalaman dan matlamat
- **🔗 Navigasi Rujukan Silang**: Bab berkaitan dan prasyarat dipaut secara jelas

#### Ditingkatkan
- **Struktur README**: Ditukar menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap halaman kini termasuk konteks bab dan panduan progresi
- **Pengurusan Templat**: Contoh dan templat dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber**: Lembaran pintas, FAQ, dan panduan belajar dihubungkan dengan bab berkaitan
- **Integrasi Bengkel**: Makmal praktikal dipetakan ke pelbagai objektif pembelajaran bab

#### Diubah
- **Progresi Pembelajaran**: Berubah daripada dokumentasi linear ke pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk aliran pembelajaran yang lebih baik
- **Integrasi Kandungan AI**: Kandungan khusus AI lebih baik disepadukan sepanjang perjalanan pembelajaran
- **Kandungan Produksi**: Corak lanjutan disatukan dalam Bab 8 untuk pembelajar perusahaan

#### Diperbaiki
- **Pengalaman Pengguna**: Roti serbuk navigasi jelas dan penunjuk progres bab
- **Kebolehcapaian**: Corak navigasi konsisten untuk memudahkan pelayaran kursus
- **Persembahan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa untuk mencari kandungan berkaitan dikurangkan melalui organisasi yang dipertingkatkan

#### Pelaksanaan Teknikal
- **Header Navigasi**: Navigasi bab distandardkan merentasi lebih 40 fail dokumentasi
- **Footer Navigasi**: Panduan progresi konsisten dan penunjuk penyelesaian bab
- **Pautan Silang**: Sistem pautan dalaman menyeluruh menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh dengan jelas dikaitkan dengan objektif pembelajaran

#### Penambahbaikan Panduan Belajar
- **📚 Objektif Pembelajaran Menyeluruh**: Panduan belajar distruktur semula selaras sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab termasuk objektif pembelajaran tertentu dan latihan praktikal
- **📋 Penjejakan Progres**: Jadual pembelajaran mingguan dengan hasil boleh diukur dan senarai semak penyelesaian
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti praktikal dengan senario penyebaran sebenar dan penyelesaian masalah
- **📊 Progresi Kemahiran**: Kemajuan jelas dari konsep asas ke corak perusahaan dengan tumpuan pembangunan kerjaya
- **🎓 Rangka Pensijilan**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran terstruktur 10 minggu dengan pengesahan hentian penting

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Pelbagai Ejen Ditingkatkan
**Versi ini memperbaiki penyelesaian runcit pelbagai ejen dengan penamaan ejen lebih baik dan dokumentasi dipertingkatkan.**

#### Diubah
- **Terminologi Pelbagai Ejen**: Gantikan "ejen Cora" dengan "ejen Pelanggan" merentasi penyelesaian runcit pelbagai ejen untuk kefahaman lebih jelas
- **Seni Bina Ejen**: Kemas kini semua dokumentasi, templat ARM, dan contoh kod menggunakan penamaan "ejen Pelanggan" konsisten
- **Contoh Konfigurasi**: Pola konfigurasi ejen diperbaharui dengan konvensyen penamaan dikemas kini
- **Konsistensi Dokumentasi**: Pastikan semua rujukan menggunakan nama ejen profesional dan deskriptif

#### Ditingkatkan
- **Pakej Templat ARM**: Kemas kini retail-multiagent-arm-template dengan rujukan ejen Pelanggan
- **Rajah Seni Bina**: Segar semula rajah Mermaid dengan penamaan ejen dikemas kini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pembolehubah Persekitaran**: Kemas kini semua skrip penyebaran menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pembangun**: Peranan dan tanggungjawab ejen lebih jelas dalam dokumentasi
- **Kesediaan Produksi**: Penyelarasan lebih baik dengan konvensyen penamaan perusahaan
- **Bahan Pembelajaran**: Penamaan ejen lebih intuitif untuk tujuan pendidikan
- **Kegunaan Templat**: Kefahaman fungsi ejen dan pola penyebaran dipermudahkan

#### Perincian Teknikal
- Kemas kini rajah seni bina Mermaid dengan rujukan CustomerAgent
- Gantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Ubah konfigurasi JSON templat ARM untuk jenis ejen "customer"
- Kemas kini pembolehubah persekitaran dari CORA_AGENT_* ke CUSTOMER_AGENT_*
- Segar semula semua arahan penyebaran dan konfigurasi kontena

### [v3.0.0] - 2025-09-12

#### Perubahan Besar - Fokus Pembangun AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran berfokus AI menyeluruh dengan integrasi Microsoft Foundry.**

#### Ditambah
- **🤖 Laluan Pembelajaran Berfokus AI**: Penyusunan semula lengkap mengutamakan pembangun dan jurutera AI
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi menyeluruh untuk menghubungkan AZD dengan perkhidmatan Microsoft Foundry
- **Corak Penyebaran Model AI**: Panduan terperinci merangkumi pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **Makmal Bengkel AI**: Bengkel praktikal selama 2-3 jam untuk menukar aplikasi AI kepada penyelesaian yang boleh dideploy menggunakan AZD  
- **Amalan Terbaik AI untuk Pengeluaran**: Corak sedia perusahaan untuk skala, pemantauan, dan keselamatan beban kerja AI  
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah menyeluruh untuk Model Microsoft Foundry, Perkhidmatan Kognitif, dan isu deployment AI  
- **Galeri Templat AI**: Koleksi templat Microsoft Foundry terpilih dengan penarafan kerumitan  
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan  

#### Dipertingkatkan  
- **Struktur README**: Fokus kepada pembangun AI dengan data minat komuniti sebanyak 45% dari Microsoft Foundry Discord  
- **Laluan Pembelajaran**: Perjalanan pembangun AI yang berdedikasi bersama laluan tradisional untuk pelajar dan jurutera DevOps  
- **Cadangan Templat**: Templat AI terpilih termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart  
- **Integrasi Komuniti**: Sokongan komuniti Discord dipertingkatkan dengan saluran dan perbincangan khusus AI  

#### Fokus Keselamatan & Pengeluaran  
- **Corak Identiti Terkawal**: Konfigurasi pengesahan dan keselamatan khusus AI  
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI  
- **Deployment Pelbagai Wilayah**: Strategi untuk deployment aplikasi AI secara global  
- **Pemantauan Prestasi**: Metik khusus AI dan integrasi Application Insights  

#### Kualiti Dokumentasi  
- **Struktur Kursus Linear**: Progresi logik dari corak deployment AI asas hingga lanjutan  
- **URL Disahkan**: Semua pautan repositori luar disemak dan boleh diakses  
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disemak dan berfungsi  
- **Sedia untuk Pengeluaran**: Corak deployment perusahaan dengan contoh dunia sebenar  

### [v2.0.0] - 2025-09-09  

#### Perubahan Utama - Penstrukturan Semula Repositori dan Peningkatan Profesional  
**Versi ini mewakili pengubahsuaian besar struktur repositori dan penyampaian kandungan.**  

#### Ditambah  
- **Rangka Kerja Pembelajaran Berstruktur**: Semua halaman dokumentasi kini termasuk Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran  
- **Sistem Navigasi**: Dipasang pautan Pelajaran Sebelumnya/Seterusnya di seluruh dokumentasi untuk panduan progresi pembelajaran  
- **Panduan Kajian**: study-guide.md menyeluruh dengan objektif pembelajaran, latihan praktikal, dan bahan penilaian  
- **Pembentangan Profesional**: Semua ikon emoji dibuang untuk aksesibiliti dan penampilan profesional yang lebih baik  
- **Struktur Kandungan Dipertingkatkan**: Organisasi dan aliran bahan pembelajaran diperbaiki  

#### Diubah  
- **Format Dokumentasi**: Semua dokumentasi distrukturkan secara konsisten dengan fokus pembelajaran  
- **Aliran Navigasi**: Progresi logik melalui semua bahan pembelajaran dilaksanakan  
- **Pembentangan Kandungan**: Elemen dekoratif dibuang untuk format yang jelas dan profesional  
- **Struktur Pautan**: Semua pautan dalaman dikemas kini untuk menyokong sistem navigasi baru  

#### Diperbaiki  
- **Aksesibiliti**: Ketergantungan pada emoji dihapuskan untuk keserasian pembaca skrin lebih baik  
- **Penampilan Profesional**: Pembentangan gaya akademik yang bersih sesuai untuk pembelajaran perusahaan  
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil jelas untuk setiap pelajaran  
- **Organisasi Kandungan**: Aliran logik dan hubungan antara topik yang lebih baik  

### [v1.0.0] - 2025-09-09  

#### Siaran Awal - Repositori Pembelajaran AZD Menyeluruh  

#### Ditambah  
- **Struktur Dokumentasi Teras**  
  - Rangkaian panduan memulakan lengkap  
  - Dokumentasi deployment dan penyediaan komprehensif  
  - Sumber penyelesaian masalah dan panduan debugging terperinci  
  - Alat dan prosedur pengesahan pra-deployment  

- **Modul Memulakan**  
  - Asas AZD: Konsep dan terminologi teras  
  - Panduan Pemasangan: Arahan pemasangan khusus platform  
  - Panduan Konfigurasi: Persediaan persekitaran dan pengesahan  
  - Tutorial Projek Pertama: Pembelajaran praktikal langkah demi langkah  

- **Modul Deployment dan Penyediaan**  
  - Panduan Deployment: Dokumentasi alur kerja lengkap  
  - Panduan Penyediaan: Infrastruktur sebagai Kod dengan Bicep  
  - Amalan terbaik untuk deployment pengeluaran  
  - Corak seni bina perkhidmatan pelbagai  

- **Modul Pengesahan Pra-Deployment**  
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure  
  - Pemilihan SKU: Panduan komprehensif tahap perkhidmatan  
  - Pemeriksaan Pra-Penerbangan: Skrip pengesahan automatik (PowerShell dan Bash)  
  - Anggaran kos dan alat perancangan bajet  

- **Modul Penyelesaian Masalah**  
  - Isu Biasa: Masalah dan penyelesaian yang kerap dihadapi  
  - Panduan Debugging: Metodologi penyelesaian masalah sistematik  
  - Teknik dan alat diagnostik lanjutan  
  - Pemantauan prestasi dan pengoptimuman  

- **Sumber dan Rujukan**  
  - Lembaran Senarai Perintah: Rujukan pantas untuk arahan penting  
  - Glosari: Definisi terperinci istilah dan akronim  
  - FAQ: Jawapan terperinci untuk soalan lazim  
  - Pautan sumber luar dan sambungan komuniti  

- **Contoh dan Templat**  
  - Contoh Aplikasi Web Ringkas  
  - Templat Deploy Laman Web Statik  
  - Konfigurasi Aplikasi Kontena  
  - Corak integrasi pangkalan data  
  - Contoh seni bina Mikroservis  
  - Pelaksanaan fungsi tanpa pelayan  

#### Ciri-ciri  
- **Sokongan Pelbagai Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux  
- **Tahap Kemahiran Pelbagai**: Kandungan direka untuk pelajar hingga pembangun profesional  
- **Fokus Praktikal**: Contoh praktikal dan senario dunia sebenar  
- **Liputan Menyeluruh**: Dari konsep asas hingga corak perusahaan lanjutan  
- **Pendekatan Keselamatan Teratas**: Amalan keselamatan diintegrasi sepanjang bahan  
- **Pengoptimuman Kos**: Panduan untuk deployment kos efektif dan pengurusan sumber  

#### Kualiti Dokumentasi  
- **Contoh Kod Terperinci**: Sampel kod praktikal dan diuji  
- **Arahan Langkah Demi Langkah**: Panduan jelas dan boleh dilaksanakan  
- **Pengendalian Ralat Komprehensif**: Penyelesaian masalah untuk isu biasa  
- **Integrasi Amalan Terbaik**: Standard industri dan cadangan  
- **Keserasian Versi**: Dikemas kini dengan perkhidmatan Azure terkini dan ciri azd  

## Penambahbaikan Masa Depan yang Dirancang  

### Versi 3.1.0 (Dirancang)  
#### Pengembangan Platform AI  
- **Sokongan Pelbagai Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model tersuai  
- **Rangka Kerja Ejen AI**: Templat untuk deployment LangChain, Semantic Kernel, dan AutoGen  
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor selain Azure AI Search (Pinecone, Weaviate, dll.)  
- **Kebolehlihatan AI**: Pemantauan dipertingkatkan untuk prestasi model, penggunaan token, dan kualiti respons  

#### Pengalaman Pembangun  
- **Sambungan VS Code**: Pengalaman pembangunan integrasi AZD + Microsoft Foundry  
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI  
- **Tutorial Interaktif**: Latihan kod praktikal dengan pengesahan automatik untuk senario AI  
- **Kandungan Video**: Tutorial video tambahan untuk pembelajaran visual fokus pada deployment AI  

### Versi 4.0.0 (Dirancang)  
#### Corak AI Perusahaan  
- **Rangka Kerja Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit  
- **AI Pelbagai Penyewa**: Corak untuk melayani pelbagai pelanggan dengan perkhidmatan AI terpencil  
- **Deployment AI Edge**: Integrasi dengan Azure IoT Edge dan instans kontena  
- **AI Awan Hibrid**: Corak deployment multi-awan dan hibrid untuk beban kerja AI  

#### Ciri Lanjutan  
- **Automasi Sisa AI**: Integrasi MLOps dengan saluran Azure Machine Learning  
- **Keselamatan Lanjutan**: Corak zero-trust, titik akhir persendirian, dan perlindungan ancaman canggih  
- **Pengoptimuman Prestasi**: Strategi penyetelan dan penskalaan lanjutan untuk aplikasi AI berkapasiti tinggi  
- **Pengedaran Global**: Corak penghantaran kandungan dan caching edge untuk aplikasi AI  

### Versi 3.0.0 (Dirancang) - Digantikan oleh Siaran Semasa  
#### Penambahan Dicadangkan - Kini Dilaksanakan dalam v3.0.0  
- ✅ **Kandungan Fokus AI**: Integrasi Microsoft Foundry menyeluruh (Selesai)  
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Selesai)  
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Selesai)  
- ✅ **Pengoptimuman Prestasi**: Strategi penyetelan beban kerja AI (Selesai)  

### Versi 2.1.0 (Dirancang) - Sebahagian Dilaksanakan di v3.0.0  
#### Penambahbaikan Kecil - Beberapa Selesai dalam Siaran Semasa  
- ✅ **Contoh Tambahan**: Senario deployment berfokus AI (Selesai)  
- ✅ **FAQ Dipanjangkan**: Soalan dan penyelesaian masalah khusus AI (Selesai)  
- **Integrasi Alat**: Panduan integrasi IDE dan editor dipertingkat  
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan penggera khusus AI (Selesai)  

#### Masih Dirancang untuk Siaran Masa Depan  
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih  
- **Akses Luar Talian**: Pek dokumentasi boleh dimuat turun  
- **Integrasi IDE Dipertingkat**: Sambungan VS Code untuk aliran kerja AZD + AI  
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan  

## Menyumbang kepada Changelog  

### Melaporkan Perubahan  
Apabila menyumbang ke repositori ini, pastikan entri changelog merangkumi:  

1. **Nombor Versi**: Mengikut versi semantik (major.minor.patch)  
2. **Tarikh**: Tarikh pelepasan atau kemaskini dalam format YYYY-MM-DD  
3. **Kategori**: Ditambah, Diubah, Dihapuskan, Dibuang, Diperbaiki, Keselamatan  
4. **Penerangan Jelas**: Deskripsi ringkas apa yang diubah  
5. **Penilaian Impak**: Bagaimana perubahan memberi kesan kepada pengguna sedia ada  

### Kategori Perubahan  

#### Ditambah  
- Ciri baru, seksyen dokumentasi, atau keupayaan  
- Contoh baru, templat, atau sumber pembelajaran  
- Alat, skrip, atau utiliti tambahan  

#### Diubah  
- Pengubahsuaian fungsi atau dokumentasi sedia ada  
- Kemaskini untuk meningkatkan kejelasan atau ketepatan  
- Penstrukturan semula kandungan atau organisasi  

#### Dihapuskan  
- Ciri atau pendekatan yang sedang dihentikan  
- Seksyen dokumentasi dijadualkan untuk dihapuskan  
- Kaedah yang mempunyai alternatif lebih baik  

#### Dibuang  
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan  
- Maklumat usang atau pendekatan yang sudah tidak digunakan  
- Kandungan berlebihan atau disatukan  

#### Diperbaiki  
- Pembetulan kesalahan dalam dokumentasi atau kod  
- Penyelesaian isu atau masalah yang dilaporkan  
- Peningkatan ketepatan atau fungsi  

#### Keselamatan  
- Peningkatan atau pembetulan berkaitan keselamatan  
- Kemaskini amalan keselamatan terbaik  
- Penyelesaian kelemahan keselamatan  

### Garis Panduan Versi Semantik  

#### Versi Utama (X.0.0)  
- Perubahan besar yang memerlukan tindakan pengguna  
- Penstrukturan semula kandungan atau organisasi yang ketara  
- Perubahan yang mengubah pendekatan atau metodologi asas  

#### Versi Minor (X.Y.0)  
- Ciri baru atau tambahan kandungan  
- Penambahbaikan yang mengekalkan keserasian kebelakang  
- Contoh, alat, atau sumber tambahan  

#### Versi Patch (X.Y.Z)  
- Pembetulan pepijat dan kesalahan  
- Penambahbaikan kecil kepada kandungan sedia ada  
- Penjelasan dan penambahbaikan kecil  

## Maklum Balas dan Cadangan Komuniti  

Kami menggalakkan maklum balas komuniti untuk memperbaiki sumber pembelajaran ini:  

### Cara Memberi Maklum Balas  
- **Isu GitHub**: Laporkan masalah atau cadangan penambahbaikan (isu khusus AI dialu-alukan)  
- **Perbincangan Discord**: Kongsi idea dan berinteraksi dengan komuniti Microsoft Foundry  
- **Pull Request**: Sumbang peningkatan langsung ke kandungan, terutamanya templat dan panduan AI  
- **Microsoft Foundry Discord**: Sertai saluran #Azure untuk perbincangan AZD + AI  
- **Forum Komuniti**: Sertai perbincangan yang lebih luas dengan pembangun Azure  

### Kategori Maklum Balas  
- **Ketepatan Kandungan AI**: Pembetulan integrasi perkhidmatan AI dan maklumat deployment  
- **Pengalaman Pembelajaran**: Cadangan untuk aliran pembelajaran pembangun AI yang lebih baik  
- **Kandungan AI Hilang**: Permintaan templat AI, corak, atau contoh tambahan  
- **Aksesibiliti**: Penambahbaikan untuk keperluan pembelajaran pelbagai pengguna  
- **Integrasi Alat AI**: Cadangan untuk integrasi aliran kerja pembangunan AI lebih baik  
- **Corak AI Pengeluaran**: Permintaan corak deployment AI perusahaan  

### Komitmen Respons  
- **Respons Isu**: Dalam masa 48 jam untuk masalah yang dilaporkan  
- **Permintaan Ciri**: Penilaian dalam masa satu minggu  
- **Sumbangan Komuniti**: Semakan dalam masa satu minggu  
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan  

## Jadual Penyelenggaraan  

### Kemas Kini Berkala  
- **Ulasan Bulanan**: Ketepatan kandungan dan pengesahan pautan  
- **Kemas Kini Suku Tahun**: Penambahan dan penambahbaikan kandungan besar  
- **Ulasan Setengah Tahun**: Penstrukturan dan peningkatan menyeluruh  
- **Siaraan Tahunan**: Kemas kini versi utama dengan peningkatan ketara  

### Pemantauan dan Jaminan Kualiti  
- **Ujian Automatik**: Pengesahan rutin contoh kod dan pautan  
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala  
- **Kemas Kini Teknologi**: Penyesuaian dengan perkhidmatan Azure terkini dan versi azd  
- **Audit Aksesibiliti**: Semakan berkala untuk prinsip reka bentuk inklusif  

## Polisi Sokongan Versi  

### Sokongan Versi Semasa  
- **Versi Utama Terkini**: Sokongan penuh dengan kemaskini berkala  
- **Versi Utama Sebelumnya**: Kemaskini keselamatan dan pembetulan kritikal selama 12 bulan  
- **Versi Warisan**: Sokongan komuniti sahaja, tiada kemaskini rasmi  

### Panduan Migrasi  
Apabila versi utama dikeluarkan, kami menyediakan:  
- **Panduan Migrasi**: Arahan langkah demi langkah untuk peralihan  
- **Nota Keserasian**: Maklumat perubahan besar yang mempengaruhi  
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi  
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Panduan Kajian](resources/study-guide.md)  
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)  

**Sentiasa Dikemaskini**: Pantau repositori ini untuk pemberitahuan mengenai pelepasan baru dan kemas kini penting bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->