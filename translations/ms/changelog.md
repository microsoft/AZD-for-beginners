# Changelog - AZD Untuk Pemula

## Pengenalan

Changelog ini mendokumentasikan semua perubahan penting, kemas kini, dan penambahbaikan pada repositori AZD Untuk Pemula. Kami mengikut prinsip pengurusan versi semantik dan mengekalkan log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan meninjau changelog ini, anda akan:
- Kekal maklum mengenai ciri baru dan penambahan kandungan
- Memahami penambahbaikan yang dibuat kepada dokumentasi sedia ada
- Menjejak pembaikan pepijat dan pembetulan untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas meninjau entri changelog, anda akan dapat:
- Mengenal pasti kandungan dan sumber baru yang tersedia untuk pembelajaran
- Memahami bahagian mana yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Memberi maklum balas dan cadangan untuk penambahbaikan masa depan

## Sejarah Versi

### [v3.17.0] - 2026-02-05

#### Penambahbaikan Navigasi Kursus
**Versi ini memperbaiki navigasi bab dalam README.md dengan format jadual yang dipertingkatkan.**

#### Ditukar
- **Jadual Peta Kursus**: Dipertingkatkan dengan pautan pelajaran langsung, anggaran tempoh, dan penilaian kerumitan
- **Pembersihan Folder**: Mengeluarkan folder lama yang berlebihan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Pengesahan Pautan**: Semua 21+ pautan dalaman dalam jadual Peta Kursus disahkan

### [v3.16.0] - 2026-02-05

#### Kemas Kini Nama Produk
**Versi ini mengemas kini rujukan produk kepada penjenamaan semasa Microsoft.**

#### Ditukar
- **Azure AI Foundry → Microsoft Foundry**: Semua rujukan dikemas kini merentas fail bukan terjemahan
- **Azure AI Agent Service → Foundry Agents**: Nama perkhidmatan dikemas kini untuk mencerminkan penjenamaan semasa

#### Fail Dikemas Kini
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

#### Penstrukturan Semula Repositori Utama: Nama Folder Berdasarkan Bab
**Versi ini menyusun semula dokumentasi ke dalam folder bab khusus untuk navigasi yang lebih jelas.**

#### Penukaran Nama Folder
Folder lama telah diganti dengan folder bernombor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Ditambah baru: `docs/chapter-05-multi-agent/`

#### Pemindahan Fail
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
- **📚 Fail README Bab**: Membuat README.md dalam setiap folder bab dengan:
  - Objektif pembelajaran dan tempoh
  - Jadual pelajaran dengan penerangan
  - Perintah mula cepat
  - Navigasi ke bab lain

#### Ditukar
- **🔗 Kemaskini semua pautan dalaman**: 78+ laluan dikemas kini merentas semua fail dokumentasi
- **🗺️ README.md Utama**: Kemas kini Peta Kursus dengan struktur bab baru
- **📝 examples/README.md**: Kemas kini rujukan silang ke folder bab

#### Dibuang
- Struktur folder lama (getting-started/, microsoft-foundry/, deployment/, pre-deployment/, troubleshooting/, ai-foundry/)

---

### [v3.14.0] - 2026-02-05

#### Penstrukturan Semula Repositori: Navigasi Bab
**Versi ini menambah fail README navigasi bab (digantikan oleh v3.15.0).**

---

### [v3.13.0] - 2026-02-05

#### Panduan Agen AI Baharu
**Versi ini menambah panduan menyeluruh untuk menyebarkan agen AI dengan Azure Developer CLI.**

#### Ditambah
- **🤖 docs/microsoft-foundry/agents.md**: Panduan lengkap merangkumi:
  - Apa itu agen AI dan bagaimana mereka berbeza dengan chatbot
  - Tiga templat agen permulaan pantas (Foundry Agents, Prompty, RAG)
  - Corak seni bina agen (agen tunggal, RAG, multi-agen)
  - Konfigurasi dan penyesuaian alat
  - Pemantauan dan penjejakan metrik
  - Pertimbangan kos dan pengoptimuman
  - Senario penyelesaian masalah biasa
  - Tiga latihan praktikal dengan kriteria kejayaan

#### Struktur Kandungan
- **Pengenalan**: Konsep agen untuk pemula
- **Mula Cepat**: Menyebarkan agen dengan `azd init --template get-started-with-ai-agents`
- **Corak Seni Bina**: Diagram visual corak agen
- **Konfigurasi**: Persediaan alat dan pemboleh ubah persekitaran
- **Pemantauan**: Integrasi Application Insights
- **Latihan**: Pembelajaran praktikal berperingkat (20-45 minit setiap satu)

---

### [v3.12.0] - 2026-02-05

#### Kemas Kini Persekitaran DevContainer
**Versi ini mengemas kini konfigurasi bekas pembangunan dengan alat moden dan tetapan lalai yang lebih baik untuk pengalaman pembelajaran AZD.**

#### Ditukar
- **🐳 Imej Asas**: Dikemas kini dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terkini)
- **📛 Nama Bekas**: Ditukar dari "Python 3" ke "AZD for Beginners" untuk kejelasan

#### Ditambah
- **🔧 Ciri Baru Dev Container**:
  - `azure-cli` dengan sokongan Bicep diaktifkan
  - `node:20` (versi LTS untuk templat AZD)
  - `github-cli` untuk pengurusan templat
  - `docker-in-docker` untuk penyebaran aplikasi kontena

- **🔌 Pemajuan Port**: Port yang telah dikonfigurasi untuk pembangunan biasa:
  - 8000 (pratonton MkDocs)
  - 3000 (aplikasi web)
  - 5000 (Python Flask)
  - 8080 (API)

- **🧩 Sambungan VS Code Baru**:
  - `ms-python.vscode-pylance` - IntelliSense Python yang dipertingkatkan
  - `ms-azuretools.vscode-azurefunctions` - Sokongan Azure Functions
  - `ms-azuretools.vscode-docker` - Sokongan Docker
  - `ms-azuretools.vscode-bicep` - Sokongan bahasa Bicep
  - `ms-azure-devtools.azure-resource-groups` - Pengurusan sumber Azure
  - `yzhang.markdown-all-in-one` - Penyuntingan Markdown
  - `DavidAnson.vscode-markdownlint` - Pengauman Markdown
  - `bierner.markdown-mermaid` - Sokongan diagrama Mermaid
  - `redhat.vscode-yaml` - Sokongan YAML (untuk azure.yaml)
  - `eamodio.gitlens` - Visualisasi Git
  - `mhutchie.git-graph` - Sejarah Git

- **⚙️ Tetapan VS Code**: Menambah tetapan lalai untuk penafsir Python, format semasa simpan, dan pemangkasan ruang kosong

- **📦 Kemas Kini requirements-dev.txt**:
  - Menambah plugin minify MkDocs
  - Menambah pre-commit untuk kualiti kod
  - Menambah pakej Azure SDK (azure-identity, azure-mgmt-resource)

#### Dibaiki
- **Perintah Tamat Cipta**: Kini mengesah penginstalan AZD dan Azure CLI semasa permulaan bekas

---

### [v3.11.0] - 2026-02-05

#### Penambahbaikan README Mesra Pemula
**Versi ini memperbaiki README.md dengan ketara untuk lebih mesra pemula dan menambah sumber penting untuk pembangun AI.**

#### Ditambah
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas bila menggunakan setiap alat dengan contoh praktikal
- **🌟 Pautan Hebat AZD**: Pautan terus ke galeri templat komuniti dan sumber sumbangan:
  - [Galeri Hebat AZD](https://azure.github.io/awesome-azd/) - 200+ templat sedia untuk disebarkan
  - [Hantar Templat](https://github.com/Azure/awesome-azd/issues) - Sumbangan komuniti
- **🎯 Panduan Mula Cepat**: Bahagian permulaan mudah 3 langkah (Pasang → Log masuk → Sebar)
- **📊 Jadual Navigasi Berdasarkan Pengalaman**: Panduan jelas dari mana hendak bermula berdasarkan pengalaman pembangun

#### Ditukar
- **Struktur README**: Disusun semula untuk pendedahan progresif - maklumat utama dahulu
- **Bahagian Pengenalan**: Ditulis semula untuk menerangkan "Keajaiban `azd up`" untuk pemula lengkap
- **Buang Kandungan Berganda**: Menghapus bahagian penyelesaian masalah berganda
- **Perintah Penyelesaian Masalah**: Memperbaiki rujukan `azd logs` dengan menggunakan `azd monitor --logs` yang sah

#### Dibaiki
- **🔐 Perintah Pengesahan**: Menambah `azd auth login` dan `azd auth logout` dalam cheat-sheet.md
- **Rujukan Perintah Tidak Sah**: Membuang baki `azd logs` dari bahagian penyelesaian masalah README

#### Nota
- **Skop**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Audiens Sasaran**: Penambahbaikan khusus untuk pembangun baru kepada AZD

---

### [v3.10.0] - 2026-02-05

#### Kemas Kini Ketepatan Perintah Azure Developer CLI
**Versi ini membetulkan perintah AZD yang tidak wujud merentasi dokumentasi, memastikan semua contoh kod menggunakan sintaks Azure Developer CLI yang sah.**

#### Dibaiki
- **🔧 Perintah AZD Tidak Wujud Dibuang**: Audit menyeluruh dan pembetulan perintah tidak sah:
  - `azd logs` (tidak wujud) → digantikan dengan `azd monitor --logs` atau alternatif Azure CLI
  - Subperintah `azd service` (tidak wujud) → digantikan dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak wujud) → dibuang atau ditukar dengan alternatif sah
  - Bendera `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak wujud) → dibuang
  - Bendera `azd provision --what-if/--rollback` (tidak wujud) → dikemas kini untuk menggunakan `--preview`
  - `azd config validate` (tidak wujud) → digantikan dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak wujud) → dibuang

- **📚 Fail Dikemas Kini dengan Pembetulan Perintah**:
  - `resources/cheat-sheet.md`: Pembaharuan utama rujukan perintah
  - `docs/deployment/deployment-guide.md`: Betulkan strategi rollback dan penyebaran
  - `docs/troubleshooting/debugging.md`: Betulkan bahagian analisis log
  - `docs/troubleshooting/common-issues.md`: Kemas kini perintah penyelesaian masalah
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan bahagian debugging AZD
  - `docs/getting-started/azd-basics.md`: Betulkan perintah pemantauan
  - `docs/getting-started/first-project.md`: Kemas kini contoh pemantauan dan debugging
  - `docs/getting-started/installation.md`: Betulkan contoh bantuan dan versi
  - `docs/pre-deployment/application-insights.md`: Betulkan perintah paparan log
  - `docs/pre-deployment/coordination-patterns.md`: Betulkan perintah debugging agen

- **📝 Rujukan Versi Dikemas Kini**: 
  - `docs/getting-started/installation.md`: Tukar versi tetapan keras `1.5.0` kepada generik `1.x.x` dengan pautan ke keluaran

#### Ditukar
- **Strategi Rollback**: Kemas kini dokumentasi menggunakan rollback berasaskan Git (AZD tiada rollback asli)
- **Paparan Log**: Gantikan rujukan `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bahagian Prestasi**: Buang bendera penyebaran selari/incremental yang tidak wujud, sediakan alternatif sah

#### Butiran Teknikal
- **Perintah AZD Sah**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor Sah**: `--live`, `--logs`, `--overview`
- **Ciri-ciri Dibuang**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Nota
- **Pengesahan**: Perintah disahkan dengan Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Kemaskini Penyempurnaan Bengkel dan Kualiti Dokumentasi
**Versi ini melengkapkan modul bengkel interaktif, membaiki semua pautan dokumentasi yang rosak, dan meningkatkan kualiti kandungan secara keseluruhan untuk pembangun AI yang menggunakan Microsoft AZD.**

#### Ditambah
- **📝 CONTRIBUTING.md**: Dokumen garis panduan sumbangan baru dengan:
  - Arahan jelas untuk melaporkan isu dan mencadangkan perubahan
  - Standard dokumentasi untuk kandungan baru
  - Garis panduan contoh kod dan konvensyen mesej komit
  - Maklumat penglibatan komuniti

#### Disempurnakan
- **🎯 Modul Bengkel 7 (Penutup)**: Modul penutup lengkap dengan:
  - Rumusan komprehensif pencapaian bengkel
  - Bahagian konsep utama yang dikuasai merangkumi AZD, templat, dan AI Foundry
  - Cadangan sambungan perjalanan pembelajaran
  - Latihan cabaran bengkel dengan penarafan kesukaran
  - Maklum balas komuniti dan pautan sokongan

- **📚 Modul Bengkel 3 (Memecah)**: Objektif pembelajaran dikemaskini dengan:
  - Panduan pengaktifan GitHub Copilot dengan pelayan MCP
  - Memahami struktur folder templat AZD
  - Corak organisasi infrastruktur sebagai kod (Bicep)
  - Arahan makmal praktikal

- **🔧 Modul Bengkel 6 (Pembongkaran)**: Lengkap dengan:
  - Objektif pembersihan sumber dan pengurusan kos
  - Penggunaan `azd down` untuk penurunan infrastruktur secara selamat
  - Panduan pemulihan perkhidmatan kognitif yang dipadamkan secara lembut
  - Cadangan penerokaan bonus untuk GitHub Copilot dan Azure Portal

#### Dibaiki
- **🔗 Pembaikan Pautan Rosak**: Diselesaikan lebih 15 pautan dokumentasi dalaman yang rosak:
  - `docs/ai-foundry/ai-model-deployment.md`: Baiki laluan kepada microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Betulkan laluan ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Gantikan cicd-integration.md yang tidak wujud dengan deployment-guide.md
  - `examples/retail-scenario.md`: Baiki laluan FAQ dan panduan penyelesaian masalah
  - `examples/container-app/microservices/README.md`: Betulkan laluan rumah kursus dan panduan penyebaran
  - `resources/faq.md` dan `resources/glossary.md`: Kemas kini rujukan bab AI
  - `course-outline.md`: Baiki panduan pengajar dan rujukan makmal bengkel AI

- **📅 Sepanduk Status Bengkel**: Dikemaskini daripada "Dalam Pembinaan" kepada status bengkel aktif dengan tarikh Februari 2026

- **🔗 Navigasi Bengkel**: Pautan navigasi rosak dalam README.md bengkel dipindahkan ke folder lab-1-azd-basics yang tidak wujud diperbaiki

#### Diubah
- **Pembentangan Bengkel**: Amaran "dalam pembinaan" dialih keluar, bengkel kini lengkap dan sedia digunakan
- **Konsistensi Navigasi**: Pastikan semua modul bengkel mempunyai navigasi antara modul yang betul
- **Rujukan Laluan Pembelajaran**: Kemas kini rujukan silang bab menggunakan laluan microsoft-foundry yang betul

#### Disahkan
- ✅ Semua fail markdown bahasa Inggeris mempunyai pautan dalaman yang sah
- ✅ Modul bengkel 0-7 lengkap dengan objektif pembelajaran
- ✅ Navigasi antara bab dan modul berfungsi dengan betul
- ✅ Kandungan sesuai untuk pembangun AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur mesra pemula dikekalkan sepanjang
- ✅ CONTRIBUTING.md menyediakan panduan jelas untuk penyumbang komuniti

#### Pelaksanaan Teknikal
- **Pengesahan Pautan**: Skrip PowerShell automatik mengesahkan semua pautan .md dalaman
- **Audit Kandungan**: Semakan manual terhadap kesempurnaan bengkel dan kesesuaian pemula
- **Sistem Navigasi**: Corak navigasi bab dan modul yang konsisten diterapkan

#### Nota
- **Skop**: Perubahan digunakan pada dokumentasi bahasa Inggeris sahaja
- **Terjemahan**: Folder terjemahan tidak dikemas kini dalam versi ini (terjemahan automatik akan diselaraskan kemudian)
- **Tempoh Bengkel**: Bengkel lengkap kini menyediakan pembelajaran praktikal selama 3-4 jam

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Multi-Ejen
**Versi ini menambah pelajaran tahap A yang menyeluruh tentang integrasi Application Insights, corak pengesahan, dan koordinasi multi-ejen untuk penyebaran produksi.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Penyebaran berfokus AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri tersuai (1,200+ baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Azure OpenAI)
  - 6 rajah Mermaid (senibina, penjejakan diedarkan, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh pertanyaan Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan debug masa nyata
  - Masa pembelajaran 40-50 minit dengan corak sedia produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, identiti terurus)
  - Templat infrastruktur Bicep lengkap untuk penyebaran selamat
  - Kod aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (dayakan identiti terurus, identiti ditetapkan pengguna, pusingan Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan sedia produksi

- **🤖 Pelajaran Corak Koordinasi Multi-Ejen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (berurutan, selari, hierarki, dipacu acara, konsensus)
  - Pelaksanaan servis penyelaras lengkap (Python/Flask, 1,500+ baris)
  - 3 pelaksanaan ejen khusus (Penyelidikan, Penulis, Editor)
  - Integrasi Service Bus untuk antrian mesej
  - Pengurusan status Cosmos DB untuk sistem diedarkan
  - 6 rajah Mermaid menunjukkan interaksi ejen
  - 3 latihan lanjutan (pengendalian tamat masa, logik cuba semula, pemutus litar)
  - Pecahan kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Dipertingkat
- **Bab Pra-penyebaran**: Kini termasuk corak pemantauan dan koordinasi komprehensif
- **Bab Memulakan**: Dipertingkat dengan corak pengesahan profesional
- **Kesediaan Produksi**: Liputan lengkap dari keselamatan hingga pemerhatian
- **Rangka Kursus**: Dikemaskini untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Kemajuan Pembelajaran**: Integrasi lebih baik keselamatan dan pemantauan sepanjang kursus
- **Kualiti Dokumentasi**: Standard tahap A yang konsisten (95-97%) di semua pelajaran baru
- **Corak Produksi**: Liputan menyeluruh dari hujung ke hujung untuk penyebaran perusahaan

#### Diperbaiki
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan produksi
- **Standard Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Pemerhatian**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Azure OpenAI dan sistem multi-ejen

#### Disahkan
- ✅ Semua pelajaran termasuk kod berfungsi lengkap (bukan potongan)
- ✅ Rajah Mermaid untuk pembelajaran visual (19 keseluruhan dalam 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 keseluruhan)
- ✅ Templat Bicep sedia produksi boleh disebarkan melalui `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Penanda aras pengetahuan dengan arahan pengesahan

#### Keputusan Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Senibina multi-ejen lanjutan
- **Kandungan Baharu Keseluruhan**: - Standard kualiti tinggi konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + penjejakan diedarkan
- **Pengesahan**: Identiti Terurus + Key Vault + corak RBAC
- **Multi-Ejen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, polisi pengekalan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualiti Dokumentasi dan Contoh Azure OpenAI Baru
**Versi ini meningkatkan kualiti dokumentasi di seluruh repositori dan menambah contoh penyebaran Azure OpenAI lengkap dengan antara muka chat GPT-4.**

#### Ditambah
- **🤖 Contoh Chat Azure OpenAI**: Penyebaran GPT-4 lengkap dengan pelaksanaan berfungsi dalam `examples/azure-openai-chat/`:
  - Infrastruktur Azure OpenAI lengkap (penyebaran model GPT-4)
  - Antara muka chat baris arahan Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Had kadar dan pengendalian ralat
  - README komprehensif dengan panduan penyebaran 35-45 minit
  - 11 fail sedia produksi (templat Bicep, app Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Ditambah latihan praktikal ke panduan konfigurasi:
  - Latihan 1: Konfigurasi pelbagai persekitaran (15 minit)
  - Latihan 2: Latihan pengurusan rahsia (10 minit)
  - Kriteria kejayaan dan langkah pengesahan jelas
- **✅ Pengesahan Penyebaran**: Ditambah seksyen pengesahan ke panduan penyebaran:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output dijangka untuk semua perintah penyebaran
  - Rujukan pantas penyelesaian masalah

#### Dipertingkat
- **examples/README.md**: Dikemaskini ke kualiti tahap A (93%):
  - Ditambah azure-openai-chat ke semua bahagian relevan
  - Dikemaskini bilangan contoh tempatan daripada 3 ke 4
  - Ditambah ke jadual Contoh Aplikasi AI
  - Disepadukan dalam Mulakan Pantas untuk Pengguna Pertengahan
  - Ditambah ke bahagian Templat Microsoft Foundry
  - Dikemaskini Matriks Perbandingan dan bahagian penemuan teknologi
- **Kualiti Dokumentasi**: Diperbaiki daripada B+ (87%) → A- (92%) di seluruh folder docs:
  - Ditambah output dijangka ke contoh perintah kritikal
  - Termasuk langkah pengesahan untuk perubahan konfigurasi
  - Dipertingkat latihan praktikal dengan latihan sebenar

#### Diubah
- **Kemajuan Pembelajaran**: Integrasi lebih baik contoh AI untuk pelajar peringkat pertengahan
- **Struktur Dokumentasi**: Latihan yang lebih boleh dilaksanakan dengan hasil jelas
- **Proses Pengesahan**: Kriteria kejayaan jelas ditambah kepada aliran kerja utama

#### Diperbaiki
- **Pengalaman Pembangun**: Penyebaran Azure OpenAI kini mengambil masa 35-45 minit (banding 60-90 untuk pilihan kompleks)
- **Ketelusan Kos**: Anggaran kos jelas ($50-200/bulan) untuk contoh Azure OpenAI
- **Laluan Pembelajaran**: Pembangun AI mempunyai titik masuk jelas dengan azure-openai-chat
- **Standard Dokumentasi**: Output dijangka dan langkah pengesahan konsisten

#### Disahkan
- ✅ Contoh Azure OpenAI berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan betul secara sintaksis
- ✅ Arahan README sepadan dengan pengalaman penyebaran sebenar
- ✅ Pautan dokumentasi dikemaskini di 8+ lokasi
- ✅ Indeks contoh mencerminkan 4 contoh tempatan dengan tepat
- ✅ Tiada pautan luaran pendua dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Senibina Azure OpenAI**: GPT-4 + Key Vault + corak Container Apps
- **Keselamatan**: Sedia Identiti Terurus, rahsia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Penyebaran**: Arahan `azd up` tunggal untuk persediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemaskini Utama: Contoh Penyebaran Aplikasi Container
**Versi ini memperkenalkan contoh penyebaran aplikasi container sedia produksi yang komprehensif menggunakan Azure Developer CLI (AZD), dengan dokumentasi penuh dan integrasi ke dalam laluan pembelajaran.**

#### Ditambah
- **🚀 Contoh Aplikasi Container**: Contoh tempatan baru dalam `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Gambaran lengkap penyebaran tercontainer, permulaan pantas, produksi, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala kepada sifar, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Senibina Mikroservis](../../examples/container-app/microservices): Penyebaran pelbagai servis sedia produksi (API Gateway, Produk, Pesanan, Pengguna, Notifikasi), pemesejan async, Service Bus, Cosmos DB, Azure SQL, penjejakan diedarkan, penyebaran blue-green/canary
- **Amalan Terbaik**: Panduan keselamatan, pemantauan, pengoptimuman kos, dan CI/CD untuk beban kerja tercontainer
- **Contoh Kod**: `azure.yaml` lengkap, templat Bicep, dan pelaksanaan servis pelbagai bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung ke hujung, perintah pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemaskini untuk menonjolkan dan pautkan contoh aplikasi container baru di bawah "Contoh Tempatan - Aplikasi Container"
- **examples/README.md**: Dikemaskini untuk menyerlahkan contoh aplikasi container, tambah entri matriks perbandingan, dan kemaskini rujukan teknologi/senibina
- **Garis Kursus & Panduan Kajian**: Dikemas kini untuk merujuk contoh aplikasi bekas baru dan corak pelaksanaan dalam bab yang berkaitan

#### Disahkan
- ✅ Semua contoh baru boleh dilaksanakan dengan `azd up` dan mengikuti amalan terbaik
- ✅ Pautan silang dokumentasi dan navigasi dikemas kini
- ✅ Contoh merangkumi senario dari pemula hingga lanjutan, termasuk mikroservis produksi

#### Nota
- **Skop**: Dokumentasi dan contoh dalam Bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak bekas lanjutan tambahan dan automasi CI/CD dalam keluaran akan datang

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk secara menyeluruh dari "Microsoft Foundry" kepada "Microsoft Foundry" di semua dokumentasi Bahasa Inggeris, mencerminkan penjenamaan rasmi oleh Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula sepenuhnya dari "Microsoft Foundry" kepada "Microsoft Foundry"
  - Dikemas kini semua rujukan di seluruh dokumentasi Bahasa Inggeris dalam folder `docs/`
  - Penamaan semula folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Penamaan semula fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini dalam 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula kepada `docs/microsoft-foundry/`
  - Semua rujukan silang dikemas kini untuk mencerminkan struktur folder baru
  - Pautan navigasi disahkan dalam semua dokumentasi

- **📄 Penamaan semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini untuk merujuk nama fail baru

#### Fail Dikemas Kini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (daripada kemas kini sebelum ini)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan silang dikemas kini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemas kini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemas kini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemas kini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemas kini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran kursus, tajuk bab, bahagian templat, pandangan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran keseluruhan, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen Bahasa Inggeris
- ✅ Tiada lagi rujukan nama produk "Microsoft Foundry" dalam dokumen Bahasa Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baru
- ✅ Penamaan semula fail dan folder selesai dengan jayanya
- ✅ Pautan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan dikenakan kepada dokumentasi Bahasa Inggeris dalam folder `docs/` sahaja
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk kepada penamaan lama (akan ditangani dalam kemas kini akan datang)
- **Pautan Luar**: URL luaran dan rujukan repositori GitHub tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cawangan tempatan atau dokumentasi yang merujuk struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dalaman dokumentasi masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratonton Infrastruktur dan Penambahbaikan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton Azure Developer CLI yang baru dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri azd provision --preview**: Liputan menyeluruh tentang keupayaan pratonton infrastruktur baru
  - Rujukan arahan dan contoh penggunaan dalam helaian cheat
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan awal untuk pengesahan pelaksanaan yang lebih selamat
  - Kemas kini panduan memulakan dengan amalan pelaksanaan yang memberi keutamaan keselamatan
- **🚧 Banner Status Bengkel**: Banner HTML profesional yang menunjukkan status pembangunan bengkel
  - Reka bentuk gradasi dengan penunjuk pembinaan untuk komunikasi jelas pengguna
  - Cap masa kemas kini terakhir untuk ketelusan
  - Reka bentuk responsif mudah alih untuk semua jenis peranti

#### Ditingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton disepadukan di seluruh dokumentasi pelaksanaan
- **Pengesahan Pra-pelaksanaan**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan arahan dikemas kini untuk memasukkan pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan jelas ditetapkan untuk pengguna mengenai status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Pelaksanaan**: Aliran kerja pratonton dahulu kini menjadi pendekatan yang disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan ke peringkat awal dalam proses pembelajaran
- **Pembentangan Bengkel**: Komunikasi status profesional dengan garis masa pembangunan yang jelas

#### Dipertingkatkan
- **Pendekatan Keselamatan Terlebih Dahulu**: Perubahan infrastruktur boleh disahkan sebelum pelaksanaan
- **Kerjasama Pasukan**: Keputusan pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Pemahaman lebih baik tentang kos sumber sebelum penyediaan
- **Pengurangan Risiko**: Mengurangkan kegagalan pelaksanaan melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Multi-dokumen**: Ciri pratonton didokumentasikan dalam 4 fail utama
- **Corak Arahan**: Sintaks dan contoh konsisten dalam seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton dimasukkan dalam aliran pengesahan dan skrip
- **Penanda Visual**: Penanda ciri BARU yang jelas untuk keterlihatan

#### Infrastruktur Bengkel
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pembangunan jelas mengelakkan kekeliruan
- **Pembentangan Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap masa kemas kini terakhir Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Penambahbaikan Bahan Bengkel dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel menyeluruh dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran berstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs
- **📝 Arahan Bengkel Berstruktur**: Laluan pembelajaran berpandukan 7 langkah dari penemuan hingga penyesuaian
  - 0-Pengenalan: Gambaran bengkel dan persiapan
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat
  - 2-Pengesahan-Templat-AI: Prosedur pelaksanaan dan pengesahan
  - 3-Bedah-Templat-AI: Memahami seni bina templat
  - 4-Konfigurasi-Templat-AI: Konfigurasi dan penyesuaian
  - 5-Penyesuaian-Templat-AI: Pengubahsuaian lanjutan dan iterasi
  - 6-Pembongkaran-Infrastruktur: Pembersihan dan pengurusan sumber
  - 7-Ringkasan: Rumusan dan langkah seterusnya
- **🛠️ Alat Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran yang dipertingkatkan
- **🎯 Laluan Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Pelaksanaan → Penyesuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan yang lancar

#### Ditingkatkan
- **Makmal Bengkel AI**: Diperluas dengan pengalaman pembelajaran 2-3 jam berstruktur yang komprehensif
- **Dokumentasi Bengkel**: Pembentangan profesional dengan navigasi dan bantu visual
- **Progresi Pembelajaran**: Panduan langkah demi langkah dari pemilihan templat hingga pelaksanaan produksi
- **Pengalaman Pembangun**: Alat terintegrasi untuk aliran kerja pembangunan yang dipermudah

#### Dipertingkatkan
- **Aksesibiliti**: Antara muka berasaskan pelayar dengan fungsi cari, salin, dan togol tema
- **Pembelajaran Kendiri**: Struktur bengkel fleksibel sesuai dengan kelajuan pembelajaran berbeza
- **Aplikasi Praktikal**: Senario pelaksanaan templat AI sebenar
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan dan kerjasama bengkel

#### Ciri Bengkel
- **Cari Terbina Dalam**: Penemuan kata kunci dan pelajaran cepat
- **Salin Blok Kod**: Fungsi salin dengan hover untuk semua contoh kod
- **Togol Tema**: Sokongan mod gelap/terang untuk keutamaan berbeza
- **Aset Visual**: Tangkapan skrin dan rajah untuk pemahaman dipertingkatkan
- **Integrasi Bantuan**: Akses terus ke Discord untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penstrukturan Semula Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab yang menyeluruh dengan navigasi yang dipertingkatkan di seluruh repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menstruktur semula keseluruhan kursus kepada 8 bab pembelajaran progresif
  - Bab 1: Asas & Permulaan Pantas (⭐ - 30-45 minit)
  - Bab 2: Pembangunan AI-Pertama (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Pelaksanaan (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Multi-Ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan Pra-Pelaksanaan & Perancangan (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Pengimbasan (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Tajuk utama navigasi dan kaki halaman konsisten dalam semua dokumentasi
- **🎯 Jejak Kemajuan**: Senarai semak penyiapan kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Laluan Pembelajaran**: Titik masuk jelas untuk tahap pengalaman dan matlamat berbeza
- **🔗 Navigasi Rujukan Silang**: Bab berkaitan dan prasyarat dipautkan dengan jelas

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap muka surat kini menyertakan konteks bab dan panduan progresi
- **Organisasi Templat**: Contoh dan templat dipetakan kepada bab pembelajaran yang sesuai
- **Integrasi Sumber**: Helaian cheat, FAQ, dan panduan kajian dipautkan kepada bab berkaitan
- **Integrasi Bengkel**: Makmal praktikal dipetakan kepada beberapa objektif pembelajaran bab

#### Diubah
- **Progresi Pembelajaran**: Berpindah dari dokumentasi linear kepada pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi dipindahkan ke Bab 3 untuk aliran pembelajaran lebih baik
- **Integrasi Kandungan AI**: Kandungan khusus AI lebih baik disepadukan sepanjang laluan pembelajaran
- **Kandungan Produksi**: Corak lanjutan disatukan di Bab 8 untuk pembelajar perusahaan

#### Dipertingkatkan
- **Pengalaman Pengguna**: Jejak navigasi jelas dan penunjuk progresi bab
- **Aksesibiliti**: Corak navigasi konsisten untuk memudahkan penjelajahan kursus
- **Pembentangan Profesional**: Struktur kursus gaya universiti sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa mencari kandungan relevan dikurangkan melalui organisasi lebih baik

#### Pelaksanaan Teknikal
- **Tajuk Navigasi**: Navigasi bab distandardkan dalam 40+ fail dokumentasi
- **Navigasi Kaki Halaman**: Panduan progresi dan penunjuk penyelesaian bab konsisten
- **Pautan Silang**: Sistem pautan dalaman komprehensif menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh jelas dikaitkan dengan objektif pembelajaran

#### Penambahbaikan Panduan Kajian
- **📚 Objektif Pembelajaran Komprehensif**: Panduan kajian distruktur semula untuk sejajar dengan sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab mengandungi objektif pembelajaran spesifik dan latihan praktikal
- **📋 Jejak Kemajuan**: Jadual pembelajaran mingguan dengan hasil boleh diukur dan senarai semak penyelesaian
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti amali dengan senario pelaksanaan sebenar dan penyelesaian masalah
- **📊 Progresi Kemahiran**: Peningkatan jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya
- **🎓 Rangka Pensijilan**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran 10 minggu berstruktur dengan pengesahan pencapaian

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Multi-Ejen yang Dipertingkatkan
**Versi ini memperbaiki penyelesaian runcit multi-ejen dengan penamaan ejen yang lebih baik dan dokumentasi yang dipertingkatkan.**

#### Diubah
- **Terminologi Multi-Ejen**: Menggantikan "ejen Cora" dengan "ejen Pelanggan" di seluruh penyelesaian multi-ejen runcit untuk pemahaman lebih jelas
- **Seni Bina Ejen**: Dikemas kini semua dokumentasi, templat ARM, dan contoh kod menggunakan penamaan "ejen Pelanggan" yang konsisten
- **Contoh Konfigurasi**: Corak konfigurasi ejen dimodenkan dengan konvensyen penamaan baharu
- **Konsistensi Dokumentasi**: Memastikan semua rujukan menggunakan nama ejen yang profesional dan deskriptif

#### Ditingkatkan
- **Pakej Templat ARM**: Dikemas kini retail-multiagent-arm-template dengan rujukan ejen Pelanggan
- **Rajah Seni Bina**: Rajah Mermaid disegarkan dengan penamaan ejen yang dikemas kini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pembolehubah Persekitaran**: Dikemas kini semua skrip pelaksanaan untuk menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Dipertingkatkan
- **Pengalaman Pembangun**: Peranan agen dan tanggungjawab yang lebih jelas dalam dokumentasi  
- **Kesediaan Pengeluaran**: Penyesuaian yang lebih baik dengan konvensyen penamaan perusahaan  
- **Bahan Pembelajaran**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan  
- **Kebolehgunaan Templat**: Pemahaman yang dipermudahkan mengenai fungsi agen dan corak penggunaan  

#### Butiran Teknikal  
- Diagram seni bina Mermaid dikemas kini dengan rujukan CustomerAgent  
- Gantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python  
- Ubah konfigurasi templat ARM JSON untuk menggunakan jenis agen "customer"  
- Kemas kini pembolehubah persekitaran dari CORA_AGENT_* ke corak CUSTOMER_AGENT_*  
- Segarkan semua arahan penyebaran dan konfigurasi kontena  

### [v3.0.0] - 2025-09-12  

#### Perubahan Utama - Fokus Pembangun AI dan Integrasi Microsoft Foundry  
**Versi ini mengubah repositori menjadi sumber pembelajaran menyeluruh berfokus AI dengan integrasi Microsoft Foundry.**  

#### Ditambah  
- **🤖 Laluan Pembelajaran AI-Pertama**: Penstrukturan semula lengkap mengutamakan pembangun dan jurutera AI  
- **Panduan Integrasi Microsoft Foundry**: Dokumentasi menyeluruh untuk menghubungkan AZD dengan perkhidmatan Microsoft Foundry  
- **Corak Penyebaran Model AI**: Panduan terperinci merangkumi pemilihan model, konfigurasi, dan strategi penyebaran pengeluaran  
- **Makmal Bengkel AI**: Bengkel praktikal 2-3 jam untuk menukar aplikasi AI ke penyelesaian yang boleh disebarkan dengan AZD  
- **Amalan Terbaik AI Pengeluaran**: Corak siap perusahaan untuk skala, pemantauan, dan keselamatan beban kerja AI  
- **Panduan Penyelesaian Masalah AI**: Penyelesaian masalah menyeluruh untuk Azure OpenAI, Perkhidmatan Kognitif, dan isu penyebaran AI  
- **Galeri Templat AI**: Koleksi templat Microsoft Foundry terpilih dengan penarafan kerumitan  
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan  

#### Dipertingkatkan  
- **Struktur README**: Fokus pembangun AI dengan data minat komuniti 45% dari Discord Microsoft Foundry  
- **Laluan Pembelajaran**: Laluan pembangun AI berdedikasi bersama laluan tradisional untuk pelajar dan jurutera DevOps  
- **Cadangan Templat**: Templat AI terpilih termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart  
- **Integrasi Komuniti**: Sokongan komuniti Discord yang dipertingkatkan dengan saluran dan perbincangan khusus AI  

#### Fokus Keselamatan & Pengeluaran  
- **Corak Identiti Terkawal**: Konfigurasi pengesahan dan keselamatan khusus AI  
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI  
- **Penyebaran Pelbagai Wilayah**: Strategi penyebaran aplikasi AI global  
- **Pemantauan Prestasi**: Metrik khusus AI dan integrasi Application Insights  

#### Kualiti Dokumentasi  
- **Struktur Kursus Linear**: Progresi logik dari corak penyebaran AI pemula ke maju  
- **URL Disahkan**: Semua pautan repositori luar disahkan dan boleh diakses  
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi  
- **Sedia untuk Pengeluaran**: Corak penyebaran perusahaan dengan contoh dunia sebenar  

### [v2.0.0] - 2025-09-09  

#### Perubahan Utama - Penyusunan Semula Repositori dan Penambahbaikan Profesional  
**Versi ini mewakili perubahan ketara struktur repositori dan penyampaian kandungan.**  

#### Ditambah  
- **Rangka Kerja Pembelajaran Berstruktur**: Semua halaman dokumentasi kini termasuk Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran  
- **Sistem Navigasi**: Tambah pautan Pelajaran Sebelumnya/Berikut dalam semua dokumentasi untuk kemajuan pembelajaran berpanduan  
- **Panduan Belajar**: study-guide.md menyeluruh dengan objektif pembelajaran, latihan praktikal, dan bahan penilaian  
- **Pembentangan Profesional**: Keluarkan semua ikon emoji untuk aksesibiliti dan penampilan profesional yang lebih baik  
- **Struktur Kandungan Dipertingkatkan**: Penambahbaikan organisasi dan aliran bahan pembelajaran  

#### Diubah  
- **Format Dokumentasi**: Pensandardan semua dokumentasi dengan struktur berfokus pembelajaran yang konsisten  
- **Aliran Navigasi**: Pelaksanaan progresi logik melalui semua bahan pembelajaran  
- **Pembentangan Kandungan**: Buang elemen hiasan bagi format yang jelas dan profesional  
- **Struktur Pautan**: Kemas kini semua pautan dalaman menyokong sistem navigasi baru  

#### Ditingkatkan  
- **Aksesibiliti**: Buang kebergantungan emoji untuk keserasian pembaca skrin yang lebih baik  
- **Penampilan Profesional**: Pembentangan gaya akademik yang kemas sesuai untuk pembelajaran perusahaan  
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil jelas untuk setiap pelajaran  
- **Organisasi Kandungan**: Aliran logik yang lebih baik dan hubungan antara topik berkaitan  

### [v1.0.0] - 2025-09-09  

#### Pelepasan Awal - Repositori Pembelajaran AZD Menyeluruh  

#### Ditambah  
- **Struktur Dokumentasi Teras**  
  - Siri panduan memulakan lengkap  
  - Dokumentasi penyebaran dan penyediaan menyeluruh  
  - Sumber penyelesaian masalah dan panduan debugging terperinci  
  - Alat dan prosedur pengesahan pra-penyebaran  

- **Modul Memulakan**  
  - Asas AZD: Konsep dan istilah teras  
  - Panduan Pemasangan: Arahan pemasangan khusus platform  
  - Panduan Konfigurasi: Penetapan persekitaran dan pengesahan  
  - Tutorial Projek Pertama: Pembelajaran praktikal langkah demi langkah  

- **Modul Penyebaran dan Penyediaan**  
  - Panduan Penyebaran: Dokumentasi aliran kerja lengkap  
  - Panduan Penyediaan: Infrastruktur sebagai Kod dengan Bicep  
  - Amalan terbaik untuk penyebaran pengeluaran  
  - Corak seni bina pelbagai perkhidmatan  

- **Modul Pengesahan Pra-penyebaran**  
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure  
  - Pemilihan SKU: Panduan menyeluruh pelbagai tier perkhidmatan  
  - Pemeriksaan Pra-penerbangan: Skrip pengesahan automatik (PowerShell dan Bash)  
  - Alat anggaran kos dan perancangan bajet  

- **Modul Penyelesaian Masalah**  
  - Isu Umum: Masalah biasa dan penyelesaiannya  
  - Panduan Debugging: Kaedah penyelesaian masalah sistematik  
  - Teknik diagnostik lanjutan dan alat  
  - Pemantauan dan pengoptimuman prestasi  

- **Sumber dan Rujukan**  
  - Lembaran Singkatan Arahan: Rujukan pantas untuk arahan penting  
  - Glosari: Definisi terperinci istilah dan singkatan  
  - FAQ: Jawapan terperinci kepada soalan lazim  
  - Pautan sumber luar dan sambungan komuniti  

- **Contoh dan Templat**  
  - Contoh aplikasi web mudah  
  - Templat penyebaran laman web statik  
  - Konfigurasi aplikasi kontena  
  - Corak integrasi pangkalan data  
  - Contoh seni bina mikroservis  
  - Pelaksanaan fungsi tanpa pelayan  

#### Ciri-ciri  
- **Sokongan Pelbagai Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux  
- **Pelbagai Tahap Kemahiran**: Kandungan direka untuk pelajar hingga pembangun profesional  
- **Fokus Praktikal**: Contoh praktikal dan senario dunia sebenar  
- **Liputan Menyeluruh**: Dari konsep asas hingga corak perusahaan canggih  
- **Pendekatan Keselamatan-Pertama**: Amalan keselamatan terbaik terintegrasi  
- **Pengoptimuman Kos**: Panduan penyebaran kos efektif dan pengurusan sumber  

#### Kualiti Dokumentasi  
- **Contoh Kod Terperinci**: Kod praktikal yang diuji  
- **Arahan Langkah demi Langkah**: Panduan jelas dan boleh diikuti  
- **Pengendalian Ralat Menyeluruh**: Penyelesaian masalah isu biasa  
- **Integrasi Amalan Terbaik**: Piawaian dan cadangan industri  
- **Keserasian Versi**: Dikemas kini dengan perkhidmatan Azure dan ciri azd terkini  

## Penambahbaikan Masa Depan Dirancang  

### Versi 3.1.0 (Dirancang)  
#### Pengembangan Platform AI  
- **Sokongan Pelbagai Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model khusus  
- **Kerangka Agen AI**: Templat untuk penyebaran LangChain, Semantic Kernel, dan AutoGen  
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor melebihi Azure AI Search (Pinecone, Weaviate, dll.)  
- **Pemerhatian AI**: Pemantauan dipertingkatkan untuk prestasi model, penggunaan token, dan kualiti respons  

#### Pengalaman Pembangun  
- **Sambungan VS Code**: Pengalaman pembangunan AZD + AI Foundry terpadu  
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI  
- **Tutorial Interaktif**: Latihan pengkodan praktikal dengan pengesahan automatik untuk senario AI  
- **Kandungan Video**: Tutorial video tambahan untuk pembelajar visual fokus pada penyebaran AI  

### Versi 4.0.0 (Dirancang)  
#### Corak AI Perusahaan  
- **Kerangka Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit  
- **AI Multi-Penyewa**: Corak untuk melayani pelanggan banyak dengan perkhidmatan AI terasing  
- **Penyebaran AI Tepi**: Integrasi dengan Azure IoT Edge dan instans kontena  
- **AI Awan Hibrid**: Corak penyebaran multi-awan dan hibrid untuk beban kerja AI  

#### Ciri-ciri Lanjutan  
- **Automasi Saluran AI**: Integrasi MLOps dengan saluran Azure Machine Learning  
- **Keselamatan Lanjutan**: Corak zero-trust, titik akhir persendirian, dan perlindungan ancaman maju  
- **Pengoptimuman Prestasi**: Penalaan dan strategi skala lanjutan untuk aplikasi AI berkapasiti tinggi  
- **Pengedaran Global**: Corak penghantaran kandungan dan caching tepi untuk aplikasi AI  

### Versi 3.0.0 (Dirancang) - Digantikan oleh Pelepasan Semasa  
#### Tambahan Dicadangkan - Kini Dilaksanakan dalam v3.0.0  
- ✅ **Kandungan Berfokus AI**: Integrasi menyeluruh Microsoft Foundry (Selesai)  
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Selesai)  
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Selesai)  
- ✅ **Pengoptimuman Prestasi**: Strategi penalaan beban kerja AI (Selesai)  

### Versi 2.1.0 (Dirancang) - Sebahagian Dilaksanakan dalam v3.0.0  
#### Penambahbaikan Kecil - Sebahagian Disiapkan dalam Pelepasan Semasa  
- ✅ **Contoh Tambahan**: Senario penyebaran berfokus AI (Selesai)  
- ✅ **FAQ Diperluas**: Soalan dan penyelesaian masalah berkaitan AI (Selesai)  
- **Integrasi Alat**: Panduan integrasi IDE dan editor dipertingkatkan  
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan amaran khusus AI (Selesai)  

#### Masih Dirancang untuk Pelepasan Masa Depan  
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih  
- **Akses Luar Talian**: Pek dokumentasi boleh dimuat turun  
- **Integrasi IDE Ditingkatkan**: Sambungan VS Code untuk aliran kerja AZD + AI  
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan  

## Menyumbang kepada Log Perubahan  

### Melaporkan Perubahan  
Apabila menyumbang kepada repositori ini, sila pastikan entri log perubahan merangkumi:  

1. **Nombor Versi**: Mengikut penomboran versi semantik (utama.kecil.tompok)  
2. **Tarikh**: Tarikh pelepasan atau kemas kini dalam format YYYY-MM-DD  
3. **Kategori**: Ditambah, Diubah, Dulukan, Dikeluarkan, Dibaiki, Keselamatan  
4. **Penerangan Jelas**: Penerangan ringkas mengenai perubahan  
5. **Penilaian Impak**: Bagaimana perubahan menjejaskan pengguna sedia ada  

### Kategori Perubahan  

#### Ditambah  
- Ciri baru, seksyen dokumentasi, atau keupayaan  
- Contoh baru, templat, atau sumber pembelajaran  
- Alat tambahan, skrip, atau utiliti  

#### Diubah  
- Pengubahsuaian fungsi atau dokumentasi sedia ada  
- Kemas kini untuk meningkatkan kejelasan atau ketepatan  
- Penyusunan semula kandungan atau organisasi  

#### Dulukan  
- Ciri atau pendekatan yang sedang dihentikan  
- Seksyen dokumentasi yang dijadualkan dikeluarkan  
- Kaedah yang mempunyai alternatif lebih baik  

#### Dikeluarkan  
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan  
- Maklumat ketinggalan zaman atau pendekatan dulukan  
- Kandungan berlebihan atau disatukan  

#### Dibaiki  
- Pembetulan ralat dalam dokumentasi atau kod  
- Penyelesaian isu atau masalah yang dilaporkan  
- Penambahbaikan ketepatan atau fungsi  

#### Keselamatan  
- Penambahbaikan atau pembaikan berkaitan keselamatan  
- Kemas kini amalan keselamatan terbaik  
- Penyelesaian kelemahan keselamatan  

### Garis Panduan Penomboran Semantik  

#### Versi Utama (X.0.0)  
- Perubahan besar yang memerlukan tindakan pengguna  
- Penstrukturan semula kandungan atau organisasi yang ketara  
- Perubahan yang mengubah pendekatan atau metodologi asas  

#### Versi Kecil (X.Y.0)  
- Ciri baru atau penambahan kandungan  
- Penambahbaikan yang mengekalkan keserasian ke belakang  
- Contoh tambahan, alat, atau sumber  

#### Versi Tompok (X.Y.Z)  
- Pembetulan pepijat dan kesilapan  
- Penambahbaikan kecil pada kandungan sedia ada  
- Penjelasan dan penambahan kecil  

## Maklum Balas dan Cadangan Komuniti  

Kami menggalakkan maklum balas komuniti secara aktif untuk memperbaiki sumber pembelajaran ini:  

### Cara Memberi Maklum Balas  
- **Isu GitHub**: Laporkan masalah atau cadangan penambahbaikan (isu khusus AI dialu-alukan)  
- **Perbincangan Discord**: Kongsi idea dan terlibat dengan komuniti Microsoft Foundry  
- **Permintaan Seretan**: Sumbang penambahbaikan langsung pada kandungan, terutamanya templat dan panduan AI  
- **Discord Microsoft Foundry**: Sertai saluran #Azure untuk perbincangan AZD + AI  
- **Forum Komuniti**: Terlibat dalam perbincangan pembangun Azure yang lebih luas  

### Kategori Maklum Balas  
- **Ketepatan Kandungan AI**: Pembetulan integrasi perkhidmatan dan penyebaran AI  
- **Pengalaman Pembelajaran**: Cadangan aliran pembelajaran pembangun AI yang dipertingkat  
- **Kandungan AI Hilang**: Permintaan templat, corak, atau contoh AI tambahan  
- **Aksesibiliti**: Penambahbaikan untuk keperluan pembelajaran pelbagai  
- **Integrasi Alat AI**: Cadangan integrasi aliran kerja pembangunan AI yang lebih baik  
- **Corak AI Pengeluaran**: Permintaan corak penyebaran perusahaan AI  

### Komitmen Respons  
- **Respons Isu**: Dalam masa 48 jam untuk masalah dilaporkan  
- **Permintaan Ciri**: Penilaian dalam masa seminggu  
- **Sumbangan Komuniti**: Semakan dalam masa seminggu  
- **Isu Keselamatan**: Keutamaan segera dengan respons terpantas  

## Jadual Penyelenggaraan  

### Kemas Kini Berkala  
- **Ulasan Bulanan**: Ketepatan kandungan dan pengesahan pautan  
- **Kemas Kini Suku Tahunan**: Penambahan kandungan utama dan penambahbaikan  
- **Ulasan Setengah Tahunan**: Penyusunan semula dan penambahbaikan menyeluruh  
- **Pelepasan Tahunan**: Kemas kini versi utama dengan penambahbaikan ketara  

### Pemantauan dan Jaminan Kualiti  
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan  
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala  
- **Kemas Kini Teknologi**: Penyelarasan dengan perkhidmatan Azure terkini dan keluaran azd  
- **Audit Aksesibiliti**: Ulasan berkala untuk prinsip reka bentuk inklusif  

## Polisi Sokongan Versi  

### Sokongan Versi Semasa  
- **Versi Utama Terbaru**: Sokongan penuh dengan kemas kini berkala  
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembaikan kritikal selama 12 bulan  
- **Versi Warisan**: Sokongan komuniti sahaja, tiada kemas kini rasmi  

### Panduan Migrasi  
Apabila versi utama dikeluarkan, kami menyediakan:
- **Panduan Migrasi**: Arahan peralihan langkah demi langkah
- **Nota Keserasian**: Butiran tentang perubahan besar
- **Sokongan Alat**: Skrip atau utiliti untuk membantu dengan migrasi
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)

**Kekal Dikemas Kini**: Tonton repositori ini untuk pemberitahuan tentang pelepasan baru dan kemas kini penting ke bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggungjawab atas sebarang salah faham atau penafsiran yang salah yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->