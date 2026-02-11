# Catatan Perubahan - AZD For Beginners

## Pendahuluan

Catatan perubahan ini mendokumentasikan semua perubahan, pembaruan, dan perbaikan yang signifikan pada repositori AZD For Beginners. Kami mengikuti prinsip penomoran versi semantik dan memelihara log ini untuk membantu pengguna memahami apa yang berubah antar versi.

## Tujuan Pembelajaran

Dengan meninjau catatan perubahan ini, Anda akan:
- Tetap mendapatkan informasi tentang fitur baru dan penambahan konten
- Memahami perbaikan yang dibuat pada dokumentasi yang ada
- Melacak perbaikan bug dan koreksi untuk memastikan akurasi
- Mengikuti evolusi materi pembelajaran dari waktu ke waktu

## Capaian Pembelajaran

Setelah meninjau entri catatan perubahan, Anda akan dapat:
- Mengidentifikasi konten dan sumber daya baru yang tersedia untuk pembelajaran
- Memahami bagian mana yang telah diperbarui atau ditingkatkan
- Merencanakan jalur pembelajaran Anda berdasarkan materi yang paling terbaru
- Memberikan umpan balik dan saran untuk perbaikan di masa depan

## Riwayat Versi

### [v3.17.0] - 2026-02-05

#### Peningkatan Navigasi Kursus
**Versi ini meningkatkan navigasi bab di README.md dengan format tabel yang ditingkatkan.**

#### Diubah
- **Tabel Peta Kursus**: Ditingkatkan dengan tautan pelajaran langsung, estimasi durasi, dan peringkat kompleksitas
- **Pembersihan Folder**: Menghapus folder lama yang redundan (deployment/, getting-started/, pre-deployment/, troubleshooting/)
- **Validasi Tautan**: Semua 21+ tautan internal di tabel Peta Kursus diverifikasi

### [v3.16.0] - 2026-02-05

#### Pembaruan Nama Produk
**Versi ini memperbarui referensi produk agar sesuai dengan merek Microsoft saat ini.**

#### Diubah
- **Azure AI Foundry → Microsoft Foundry**: All references updated across non-translation files
- **Azure AI Agent Service → Foundry Agents**: Service name updated to reflect current branding

#### Files Updated
- `README.md` - Main course landing page
- `changelog.md` - Version history
- `course-outline.md` - Course structure
- `docs/chapter-02-ai-development/agents.md` - AI agents guide
- `examples/README.md` - Examples documentation
- `workshop/README.md` - Workshop landing page
- `workshop/docs/index.md` - Workshop index
- `workshop/docs/instructions/*.md` - All workshop instruction files

---

### [v3.15.0] - 2026-02-05

#### Restrukturisasi Besar Repositori: Nama Folder Berbasis Bab
**Versi ini merestrukturisasi dokumentasi menjadi folder bab yang khusus untuk navigasi yang lebih jelas.**

#### Penggantian Nama Folder
Folder lama telah diganti dengan folder bernomor bab:
- `docs/getting-started/` → `docs/chapter-01-foundation/` + `docs/chapter-03-configuration/`
- `docs/microsoft-foundry/` → `docs/chapter-02-ai-development/` + `docs/chapter-08-production/`
- `docs/deployment/` → `docs/chapter-04-infrastructure/`
- `docs/pre-deployment/` → `docs/chapter-06-pre-deployment/`
- `docs/troubleshooting/` → `docs/chapter-07-troubleshooting/`
- Added new: `docs/chapter-05-multi-agent/`

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
| All pre-deployment files | pre-deployment/ | chapter-06-pre-deployment/ |
| All troubleshooting files | troubleshooting/ | chapter-07-troubleshooting/ |

#### Ditambahkan
- **📚 File README Bab**: Created README.md in each chapter folder with:
  - Tujuan pembelajaran dan durasi
  - Tabel pelajaran dengan deskripsi
  - Perintah mulai cepat
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
- **🤖 docs/microsoft-foundry/agents.md**: Complete guide covering:
  - What AI agents are and how they differ from chatbots
  - Three quick-start agent templates (Foundry Agents, Prompty, RAG)
  - Agent architecture patterns (single agent, RAG, multi-agent)
  - Tool configuration and customization
  - Monitoring and metrics tracking
  - Cost considerations and optimization
  - Common troubleshooting scenarios
  - Three hands-on exercises with success criteria

#### Struktur Konten
- **Pendahuluan**: Konsep agen untuk pemula
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
- **🐳 Image Dasar**: Diperbarui dari `python:3.12-bullseye` ke `python:3.12-bookworm` (Debian stabil terbaru)
- **📛 Nama Container**: Diganti dari "Python 3" menjadi "AZD for Beginners" untuk kejelasan

#### Ditambahkan
- **🔧 Fitur Dev Container Baru**:
  - `azure-cli` dengan dukungan Bicep diaktifkan
  - `node:20` (versi LTS untuk template AZD)
  - `github-cli` untuk manajemen template
  - `docker-in-docker` untuk penerapan aplikasi container

- **🔌 Penerusan Port**: Port yang telah dikonfigurasi sebelumnya untuk pengembangan umum:
  - 8000 (pratinjau MkDocs)
  - 3000 (Aplikasi web)
  - 5000 (Python Flask)
  - 8080 (APIs)

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

- **📦 Memperbarui requirements-dev.txt**:
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
- **🆚 Perbandingan Azure CLI vs AZD**: Penjelasan jelas kapan menggunakan masing-masing alat dengan contoh praktis
- **🌟 Tautan Awesome AZD**: Tautan langsung ke galeri template komunitas dan sumber kontribusi:
  - [Galeri Awesome AZD](https://azure.github.io/awesome-azd/) - 200+ template siap untuk dideploy
  - [Kirim Template](https://github.com/Azure/awesome-azd/issues) - Kontribusi komunitas
- **🎯 Panduan Mulai Cepat**: Bagian memulai yang disederhanakan dalam 3 langkah (Install → Login → Deploy)
- **📊 Tabel Navigasi Berdasarkan Pengalaman**: Panduan jelas tentang dari mana memulai berdasarkan pengalaman pengembang

#### Diubah
- **Struktur README**: Disusun ulang untuk pengungkapan bertahap - informasi kunci di awal
- **Bagian Pendahuluan**: Ditulis ulang untuk menjelaskan "The Magic of `azd up`" bagi pemula total
- **Menghapus Konten Duplikat**: Menghilangkan bagian pemecahan masalah yang duplikat
- **Perintah Pemecahan Masalah**: Memperbaiki referensi `azd logs` untuk menggunakan `azd monitor --logs`

#### Diperbaiki
- **🔐 Perintah Otentikasi**: Menambahkan `azd auth login` dan `azd auth logout` ke cheat-sheet.md
- **Referensi Perintah Tidak Valid**: Menghapus sisa `azd logs` dari bagian pemecahan masalah README

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan pada README.md utama dan resources/cheat-sheet.md
- **Audiens Sasaran**: Perbaikan khusus ditujukan untuk pengembang yang baru menggunakan AZD

---

### [v3.10.0] - 2026-02-05

#### Pembaruan Ketepatan Perintah Azure Developer CLI
**Versi ini memperbaiki perintah AZD yang tidak ada di seluruh dokumentasi, memastikan semua contoh kode menggunakan sintaks Azure Developer CLI yang valid.**

#### Diperbaiki
- **🔧 Perintah AZD yang Tidak Ada Dihapus**: Audit dan koreksi menyeluruh terhadap perintah yang tidak valid:
  - `azd logs` (tidak ada) → diganti dengan `azd monitor --logs` atau alternatif Azure CLI
  - Subperintah `azd service` (tidak ada) → diganti dengan `azd show` dan Azure CLI
  - `azd infra import/export/validate` (tidak ada) → dihapus atau diganti dengan alternatif yang valid
  - Flag `azd deploy --rollback/--incremental/--parallel/--detect-changes` (tidak ada) → dihapus
  - Flag `azd provision --what-if/--rollback` (tidak ada) → diperbarui untuk menggunakan `--preview`
  - `azd config validate` (tidak ada) → diganti dengan `azd config list`
  - `azd info`, `azd history`, `azd metrics` (tidak ada) → dihapus

- **📚 File yang Diperbarui dengan Koreksi Perintah**:
  - `resources/cheat-sheet.md`: Major overhaul of command reference
  - `docs/deployment/deployment-guide.md`: Fixed rollback and deployment strategies
  - `docs/troubleshooting/debugging.md`: Corrected log analysis sections
  - `docs/troubleshooting/common-issues.md`: Updated troubleshooting commands
  - `docs/troubleshooting/ai-troubleshooting.md`: Fixed AZD debugging section
  - `docs/getting-started/azd-basics.md`: Corrected monitoring commands
  - `docs/getting-started/first-project.md`: Updated monitoring and debugging examples
  - `docs/getting-started/installation.md`: Fixed help and version examples
  - `docs/pre-deployment/application-insights.md`: Corrected log viewing commands
  - `docs/pre-deployment/coordination-patterns.md`: Fixed agent debugging commands

- **📝 Referensi Versi Diperbarui**: 
  - `docs/getting-started/installation.md`: Mengubah versi `1.5.0` yang dikodekan menjadi `1.x.x` generik dengan tautan ke rilisan

#### Diubah
- **Strategi Rollback**: Memperbarui dokumentasi untuk menggunakan rollback berbasis Git (AZD tidak memiliki rollback bawaan)
- **Menampilkan Log**: Mengganti referensi `azd logs` dengan `azd monitor --logs`, `azd monitor --live`, dan perintah Azure CLI
- **Bagian Performa**: Menghapus flag deployment paralel/inkremental yang tidak ada, menyediakan alternatif yang valid

#### Rincian Teknis
- **Perintah AZD yang Valid**: `init`, `up`, `auth`, `deploy`, `down`, `provision`, `publish`, `completion`, `config`, `env`, `show`, `version`, `monitor`
- **Flag azd monitor yang Valid**: `--live`, `--logs`, `--overview`
- **Fitur yang Dihapus**: `azd logs`, `azd service`, `azd infra import/export/validate`, `azd history`, `azd metrics`, `azd info`, `azd config validate`

#### Catatan
- **Verifikasi**: Perintah diverifikasi terhadap Azure Developer CLI v1.23.x

---

### [v3.9.0] - 2026-02-05

#### Penyelesaian Workshop dan Pembaruan Kualitas Dokumentasi
**Versi ini menyelesaikan modul workshop interaktif, memperbaiki semua tautan dokumentasi yang rusak, dan meningkatkan kualitas konten secara keseluruhan untuk pengembang AI yang menggunakan Microsoft AZD.**

#### Ditambahkan
- **📝 CONTRIBUTING.md**: Dokumen pedoman kontribusi baru dengan:
  - Instruksi jelas untuk melaporkan masalah dan mengusulkan perubahan
  - Standar dokumentasi untuk konten baru
  - Panduan contoh kode dan konvensi pesan commit
  - Informasi keterlibatan komunitas

#### Diselesaikan
- **🎯 Modul Workshop 7 (Penutup)**: Modul penutup yang sepenuhnya diselesaikan dengan:
  - Ringkasan komprehensif tentang pencapaian workshop
  - Bagian konsep kunci yang dikuasai mencakup AZD, template, dan AI Foundry
  - Rekomendasi kelanjutan perjalanan pembelajaran
  - Latihan tantangan workshop dengan peringkat kesulitan
  - Umpan balik komunitas dan tautan dukungan

- **📚 Modul Workshop 3 (Dekonstruksi)**: Tujuan pembelajaran diperbarui dengan:
  - Panduan aktivasi GitHub Copilot dengan server MCP
  - Pemahaman struktur folder template AZD
  - Pola organisasi Infrastructure-as-code (Bicep)
  - Petunjuk lab praktikum

- **🔧 Modul Workshop 6 (Pembongkaran)**: Diselesaikan dengan:
  - Tujuan pembersihan sumber daya dan manajemen biaya
  - Penggunaan `azd down` untuk deprovisioning infrastruktur yang aman
  - Panduan pemulihan layanan kognitif yang soft-deleted
  - Prompt eksplorasi tambahan untuk GitHub Copilot dan Azure Portal

#### Diperbaiki
- **🔗 Perbaikan Tautan Rusak**: Menyelesaikan 15+ tautan dokumentasi internal yang rusak:
  - `docs/ai-foundry/ai-model-deployment.md`: Memperbaiki path ke microsoft-foundry-integration.md
  - `docs/troubleshooting/ai-troubleshooting.md`: Mengoreksi path ai-model-deployment.md dan production-ai-practices.md
  - `docs/getting-started/first-project.md`: Mengganti cicd-integration.md yang tidak ada dengan deployment-guide.md
  - `examples/retail-scenario.md`: Memperbaiki path FAQ dan panduan pemecahan masalah
  - `examples/container-app/microservices/README.md`: Mengoreksi path course home dan panduan deployment
  - `resources/faq.md` dan `resources/glossary.md`: Memperbarui referensi bab AI
  - `course-outline.md`: Memperbaiki referensi instructor guide dan lab workshop AI

- **📅 Banner Status Workshop**: Diperbarui dari "Under Construction" menjadi status workshop aktif dengan tanggal Februari 2026

- **🔗 Navigasi Workshop**: Memperbaiki tautan navigasi yang rusak di workshop README.md yang mengarah ke folder lab-1-azd-basics yang tidak ada

#### Diubah
- **Presentasi Workshop**: Menghapus peringatan "under construction", workshop sekarang lengkap dan siap digunakan
- **Konsistensi Navigasi**: Memastikan semua modul workshop memiliki navigasi antar-modul yang tepat
- **Referensi Jalur Pembelajaran**: Memperbarui cross-reference bab untuk menggunakan path microsoft-foundry yang benar

#### Diverifikasi
- ✅ Semua file markdown berbahasa Inggris memiliki tautan internal yang valid
- ✅ Modul workshop 0-7 lengkap dengan tujuan pembelajaran
- ✅ Navigasi antar bab dan modul berfungsi dengan benar
- ✅ Konten cocok untuk pengembang AI yang menggunakan Microsoft AZD
- ✅ Bahasa dan struktur yang ramah pemula dipertahankan sepanjang
- ✅ CONTRIBUTING.md memberikan panduan yang jelas bagi kontributor komunitas

#### Implementasi Teknis
- **Validasi Tautan**: Skrip PowerShell otomatis memverifikasi semua tautan internal .md
- **Audit Konten**: Tinjauan manual terhadap kelengkapan workshop dan kesesuaian untuk pemula
- **Sistem Navigasi**: Pola navigasi bab dan modul yang konsisten diterapkan

#### Catatan
- **Cakupan**: Perubahan diterapkan hanya pada dokumentasi berbahasa Inggris
- **Terjemahan**: Folder terjemahan tidak diperbarui pada versi ini (terjemahan otomatis akan disinkronkan nanti)
- **Durasi Workshop**: Workshop lengkap sekarang menyediakan 3-4 jam pembelajaran praktik

---

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keamanan, dan Pola Multi-Agen
**Versi ini menambahkan pelajaran menyeluruh tingkatan A tentang integrasi Application Insights, pola otentikasi, dan koordinasi multi-agen untuk deployment produksi.**

#### Ditambahkan
- **📊 Pelajaran Integrasi Application Insights**: di `docs/pre-deployment/application-insights.md`:
  - Deployment berfokus AZD dengan provisioning otomatis
  - Template Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python yang bekerja dengan telemetri kustom (1.200+ baris)
  - Pola pemantauan AI/LLM (pelacakan token/biaya Azure OpenAI)
  - 6 diagram Mermaid (arsitektur, distributed tracing, aliran telemetri)
  - 3 latihan praktis (alerts, dashboards, pemantauan AI)
  - Contoh kueri Kusto dan strategi optimisasi biaya
  - Streaming metrik langsung dan debugging real-time
  - Waktu pembelajaran 40-50 menit dengan pola siap produksi

- **🔐 Pelajaran Pola Otentikasi & Keamanan**: di `docs/getting-started/authsecurity.md`:
  - 3 pola otentikasi (connection strings, Key Vault, managed identity)
  - Template infrastruktur Bicep lengkap untuk deployment aman
  - Kode aplikasi Node.js dengan integrasi Azure SDK
  - 3 latihan lengkap (aktifkan managed identity, user-assigned identity, rotasi Key Vault)
  - Praktik terbaik keamanan dan konfigurasi RBAC
  - Panduan pemecahan masalah dan analisis biaya
  - Pola otentikasi tanpa kata sandi siap produksi

- **🤖 Pelajaran Pola Koordinasi Multi-Agen**: di `docs/pre-deployment/coordination-patterns.md`:
  - 5 pola koordinasi (sekuensial, paralel, hierarkis, event-driven, konsensus)
  - Implementasi layanan orchestrator lengkap (Python/Flask, 1.500+ baris)
  - 3 implementasi agen khusus (Research, Writer, Editor)
  - Integrasi Service Bus untuk antrian pesan
  - Manajemen status Cosmos DB untuk sistem terdistribusi
  - 6 diagram Mermaid yang menunjukkan interaksi agen
  - 3 latihan lanjutan (penanganan timeout, logika retry, circuit breaker)
  - Rincian biaya ($240-565/month) dengan strategi optimisasi
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-deployment**: Sekarang mencakup pola pemantauan dan koordinasi yang komprehensif
- **Bab Memulai**: Ditingkatkan dengan pola otentikasi profesional
- **Kesiapan Produksi**: Cakupan lengkap dari keamanan hingga observability
- **Garis Besar Kursus**: Diperbarui untuk merujuk pelajaran baru di Bab 3 dan 6

#### Diubah
- **Progres Pembelajaran**: Integrasi lebih baik antara keamanan dan pemantauan di seluruh kursus
- **Kualitas Dokumentasi**: Standar tingkat A yang konsisten (95-97%) di seluruh pelajaran baru
- **Pola Produksi**: Cakupan end-to-end lengkap untuk deployment enterprise

#### Diperbaiki
- **Pengalaman Pengembang**: Jalur yang jelas dari pengembangan ke pemantauan produksi
- **Standar Keamanan**: Pola profesional untuk otentikasi dan manajemen rahasia
- **Observability**: Integrasi Application Insights yang lengkap dengan AZD
- **Workload AI**: Pemantauan khusus untuk Azure OpenAI dan sistem multi-agen

#### Diverifikasi
- ✅ Semua pelajaran menyertakan kode kerja lengkap (bukan potongan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 total di 3 pelajaran)
- ✅ Latihan praktis dengan langkah verifikasi (9 total)
- ✅ Template Bicep siap produksi dapat dideploy via `azd up`
- ✅ Analisis biaya dan strategi optimisasi
- ✅ Panduan pemecahan masalah dan praktik terbaik
- ✅ Checkpoint pengetahuan dengan perintah verifikasi

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan yang komprehensif
- **docs/getting-started/authsecurity.md**: - Pola keamanan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Arsitektur multi-agen tingkat lanjut
- **Konten Baru Secara Keseluruhan**: - Standar kualitas tinggi yang konsisten

#### Implementasi Teknis
- **Application Insights**: Log Analytics + telemetri kustom + distributed tracing
- **Otentikasi**: Managed Identity + Key Vault + pola RBAC
- **Multi-Agen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + kueri Kusto + alerts + dashboards
- **Manajemen Biaya**: Strategi sampling, kebijakan retensi, kontrol anggaran

### [v3.7.0] - 2025-11-19

#### Peningkatan Kualitas Dokumentasi dan Contoh Azure OpenAI Baru
**Versi ini meningkatkan kualitas dokumentasi di seluruh repositori dan menambahkan contoh deployment Azure OpenAI lengkap dengan antarmuka chat GPT-4.**

#### Ditambahkan
- **🤖 Contoh Chat Azure OpenAI**: Deployment GPT-4 lengkap dengan implementasi kerja di `examples/azure-openai-chat/`:
  - Infrastruktur Azure OpenAI lengkap (deployment model GPT-4)
  - Antarmuka chat baris perintah Python dengan riwayat percakapan
  - Integrasi Key Vault untuk penyimpanan API key yang aman
  - Pelacakan penggunaan token dan estimasi biaya
  - Pembatasan laju dan penanganan kesalahan
  - README komprehensif dengan panduan deployment 35-45 menit
  - 11 file siap produksi (template Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Menambahkan latihan praktik ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-environment (15 menit)
  - Latihan 2: Praktik manajemen rahasia (10 menit)
  - Kriteria keberhasilan dan langkah verifikasi yang jelas
- **✅ Verifikasi Deployment**: Menambahkan bagian verifikasi pada panduan deployment:
  - Prosedur health check
  - Daftar periksa kriteria keberhasilan
  - Output yang diharapkan untuk semua perintah deployment
  - Referensi cepat pemecahan masalah

#### Ditingkatkan
- **examples/README.md**: Diperbarui ke kualitas tingkat A (93%):
  - Menambahkan azure-openai-chat ke semua bagian relevan
  - Memperbarui jumlah contoh lokal dari 3 menjadi 4
  - Ditambahkan ke tabel Contoh Aplikasi AI
  - Diintegrasikan ke Quick Start untuk Pengguna Menengah
  - Ditambahkan ke bagian Microsoft Foundry Templates
  - Memperbarui Matriks Perbandingan dan bagian pencarian teknologi
- **Kualitas Dokumentasi**: Meningkat dari B+ (87%) → A- (92%) di seluruh folder docs:
  - Menambahkan output yang diharapkan ke contoh perintah kritis
  - Menyertakan langkah verifikasi untuk perubahan konfigurasi
  - Meningkatkan pembelajaran praktik dengan latihan yang lebih aplikatif

#### Diubah
- **Progres Pembelajaran**: Integrasi contoh AI yang lebih baik untuk pembelajar menengah
- **Struktur Dokumentasi**: Latihan yang lebih dapat ditindaklanjuti dengan hasil yang jelas
- **Proses Verifikasi**: Kriteria keberhasilan eksplisit ditambahkan ke alur kerja utama

#### Diperbaiki
- **Pengalaman Pengembang**: Deployment Azure OpenAI sekarang memakan waktu 35-45 menit (vs 60-90 untuk alternatif kompleks)
- **Transparansi Biaya**: Estimasi biaya yang jelas ($50-200/month) untuk contoh Azure OpenAI
- **Jalur Pembelajaran**: Pengembang AI memiliki titik masuk yang jelas dengan azure-openai-chat
- **Standar Dokumentasi**: Output yang diharapkan dan langkah verifikasi yang konsisten

#### Diverifikasi
- ✅ Contoh Azure OpenAI berfungsi penuh dengan `azd up`
- ✅ Semua 11 file implementasi secara sintaksis benar
- ✅ Instruksi README cocok dengan pengalaman deployment aktual
- ✅ Tautan dokumentasi diperbarui di 8+ lokasi
- ✅ Indeks contoh mencerminkan 4 contoh lokal dengan akurat
- ✅ Tidak ada duplikat tautan eksternal di tabel
- ✅ Semua referensi navigasi benar

#### Implementasi Teknis
- **Arsitektur Azure OpenAI**: GPT-4 + Key Vault + pola Container Apps
- **Keamanan**: Siap Managed Identity, rahasia di Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Manajemen Biaya**: Pelacakan token dan optimisasi penggunaan
- **Deployment**: Satu perintah `azd up` untuk setup lengkap

### [v3.6.0] - 2025-11-19

#### Pembaruan Utama: Contoh Deployment Container App
**Versi ini memperkenalkan contoh deployment aplikasi kontainer yang komprehensif dan siap produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi lengkap dan integrasi ke jalur pembelajaran.**

#### Ditambahkan
- **🚀 Contoh Container App**: Contoh lokal baru di `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Tinjauan lengkap deployment terkontainerisasi, quick start, produksi, dan pola lanjutan
  - [Simple Flask API](../../examples/container-app/simple-flask-api): API REST ramah pemula dengan scale-to-zero, health probes, pemantauan, dan pemecahan masalah
  - [Arsitektur Microservices](../../examples/container-app/microservices): Deployment multi-layanan siap produksi (API Gateway, Product, Order, User, Notification), messaging asinkron, Service Bus, Cosmos DB, Azure SQL, distributed tracing, blue-green/canary deployment
- **Praktik Terbaik**: Keamanan, pemantauan, optimisasi biaya, dan panduan CI/CD untuk workload yang terkontainerisasi
- **Contoh Kode**: `azure.yaml` lengkap, template Bicep, dan implementasi layanan multi-bahasa (Python, Node.js, C#, Go)
- **Pengujian & Pemecahan Masalah**: Skenario pengujian end-to-end, perintah pemantauan, panduan pemecahan masalah

#### Diubah
- **README.md**: Diperbarui untuk menampilkan dan menautkan contoh container app baru di bawah "Local Examples - Container Applications"
- **examples/README.md**: Diperbarui untuk menyoroti contoh container app, menambahkan entri matriks perbandingan, dan memperbarui referensi teknologi/arsitektur
- **Garis Besar Kursus & Panduan Studi**: Diperbarui untuk merujuk contoh aplikasi kontainer baru dan pola deployment di bab terkait

#### Divalidasi
- ✅ Semua contoh baru dapat dideploy dengan `azd up` dan mengikuti praktik terbaik
- ✅ Tautan silang dokumentasi dan navigasi diperbarui
- ✅ Contoh mencakup skenario dari pemula hingga lanjutan, termasuk microservices produksi

#### Catatan
- **Ruang Lingkup**: Dokumentasi dan contoh berbahasa Inggris saja
- **Langkah Selanjutnya**: Perluas dengan pola kontainer lanjutan tambahan dan automasi CI/CD di rilis mendatang

### [v3.5.0] - 2025-11-19

#### Rebranding Produk: Microsoft Foundry
**Versi ini menerapkan perubahan nama produk yang komprehensif dari "Microsoft Foundry" menjadi "Microsoft Foundry" di seluruh dokumentasi berbahasa Inggris, mencerminkan rebranding resmi Microsoft.**

#### Diubah
- **🔄 Pembaruan Nama Produk**: Rebranding lengkap dari "Microsoft Foundry" menjadi "Microsoft Foundry"
  - Diperbarui semua referensi di seluruh dokumentasi berbahasa Inggris di folder `docs/`
  - Renamed folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Renamed file: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Total: 23 content references updated across 7 documentation files

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` renamed to `docs/microsoft-foundry/`
  - Semua referensi silang diperbarui untuk mencerminkan struktur folder baru
  - Tautan navigasi divalidasi di seluruh dokumentasi

- **📄 Penggantian Nama Berkas**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua tautan internal diperbarui untuk merujuk nama berkas baru

#### Berkas yang Diperbarui
- **Dokumentasi Bab** (7 files):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 pembaruan tautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 referensi nama produk diperbarui
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari pembaruan sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 referensi diperbarui (overview, feedback komunitas, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 tautan referensi silang diperbarui
  - `docs/getting-started/first-project.md` - 2 tautan navigasi bab diperbarui
  - `docs/getting-started/installation.md` - 2 tautan bab berikutnya diperbarui
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 referensi diperbarui (navigasi, komunitas Discord)
  - `docs/troubleshooting/common-issues.md` - 1 tautan navigasi diperbarui
  - `docs/troubleshooting/debugging.md` - 1 tautan navigasi diperbarui

- **Berkas Struktur Kursus** (2 files):
  - `README.md` - 17 referensi diperbarui (ikhtisar kursus, judul bab, bagian templat, wawasan komunitas)
  - `course-outline.md` - 14 referensi diperbarui (ikhtisar, tujuan pembelajaran, sumber daya bab)

#### Divalidasi
- ✅ Tidak ada lagi referensi path folder "ai-foundry" yang tersisa di dokumentasi berbahasa Inggris
- ✅ Tidak ada lagi referensi nama produk "Microsoft Foundry" yang tersisa di dokumentasi berbahasa Inggris
- ✅ Semua tautan navigasi berfungsi dengan struktur folder baru
- ✅ Penggantian nama berkas dan folder berhasil diselesaikan
- ✅ Referensi silang antar bab telah divalidasi

#### Catatan
- **Ruang Lingkup**: Perubahan diterapkan pada dokumentasi berbahasa Inggris di folder `docs/` saja
- **Terjemahan**: Folder terjemahan (`translations/`) tidak diperbarui dalam versi ini
- **Workshop**: Materi workshop (`workshop/`) tidak diperbarui dalam versi ini
- **Contoh**: Berkas contoh mungkin masih merujuk penamaan lama (akan ditangani pada pembaruan mendatang)
- **Tautan Eksternal**: URL eksternal dan referensi repositori GitHub tetap tidak berubah

#### Panduan Migrasi untuk Kontributor
Jika Anda memiliki cabang lokal atau dokumentasi yang merujuk struktur lama:
1. Perbarui referensi folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Perbarui referensi berkas: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ganti nama produk: "Microsoft Foundry" → "Microsoft Foundry"
4. Validasi semua tautan dokumentasi internal masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Peningkatan Pratinjau Infrastruktur dan Validasi
**Versi ini memperkenalkan dukungan komprehensif untuk fitur pratinjau baru Azure Developer CLI dan meningkatkan pengalaman pengguna workshop.**

#### Ditambahkan
- **🧪 Dokumentasi Fitur azd provision --preview**: Cakupan komprehensif untuk kemampuan pratinjau infrastruktur baru
  - Referensi perintah dan contoh penggunaan dalam cheat sheet
  - Integrasi terperinci dalam panduan provisioning dengan kasus penggunaan dan manfaat
  - Integrasi pemeriksaan pra-penerbangan untuk validasi penyebaran yang lebih aman
  - Pembaruan panduan memulai dengan praktik penyebaran yang mengutamakan keselamatan
- **🚧 Banner Status Workshop**: Banner HTML profesional yang menunjukkan status pengembangan workshop
  - Desain gradien dengan indikator konstruksi untuk komunikasi pengguna yang jelas
  - Cap waktu pembaruan terakhir untuk transparansi
  - Desain responsif untuk perangkat seluler semua jenis perangkat

#### Ditingkatkan
- **Keamanan Infrastruktur**: Fungsionalitas pratinjau diintegrasikan di seluruh dokumentasi penyebaran
- **Validasi Pra-penyebaran**: Skrip otomatis sekarang menyertakan pengujian pratinjau infrastruktur
- **Alur Kerja Pengembang**: Urutan perintah diperbarui untuk menyertakan pratinjau sebagai praktik terbaik
- **Pengalaman Workshop**: Harapan yang jelas ditetapkan bagi pengguna tentang status pengembangan konten

#### Diubah
- **Praktik Terbaik Penyebaran**: Alur kerja pratinjau-pertama sekarang direkomendasikan
- **Alur Dokumentasi**: Validasi infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Presentasi Workshop**: Komunikasi status profesional dengan garis waktu pengembangan yang jelas

#### Ditingkatkan
- **Pendekatan Mengutamakan Keamanan**: Perubahan infrastruktur sekarang dapat divalidasi sebelum penyebaran
- **Kolaborasi Tim**: Hasil pratinjau dapat dibagikan untuk tinjauan dan persetujuan
- **Kesadaran Biaya**: Pemahaman yang lebih baik tentang biaya sumber daya sebelum provisioning
- **Mitigasi Risiko**: Pengurangan kegagalan penyebaran melalui validasi sebelumnya

#### Implementasi Teknis
- **Integrasi Multi-dokumen**: Fitur pratinjau didokumentasikan di 4 berkas kunci
- **Pola Perintah**: Sintaks dan contoh yang konsisten di seluruh dokumentasi
- **Integrasi Praktik Terbaik**: Pratinjau disertakan dalam alur kerja dan skrip validasi
- **Indikator Visual**: Tanda fitur BARU yang jelas untuk memudahkan penemuan

#### Infrastruktur Workshop
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradien
- **Pengalaman Pengguna**: Status pengembangan yang jelas mencegah kebingungan
- **Presentasi Profesional**: Mempertahankan kredibilitas repositori sambil menetapkan ekspektasi
- **Transparansi Garis Waktu**: Cap waktu pembaruan terakhir Oktober 2025 untuk akuntabilitas

### [v3.3.0] - 2025-09-24

#### Ditingkatkan Materi Workshop dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan materi workshop komprehensif dengan panduan interaktif berbasis browser dan jalur pembelajaran yang terstruktur.**

#### Ditambahkan
- **🎥 Panduan Workshop Interaktif**: Pengalaman workshop berbasis browser dengan kemampuan pratinjau MkDocs
- **📝 Instruksi Workshop Terstruktur**: Jalur pembelajaran 7 langkah yang dipandu dari penemuan hingga kustomisasi
  - 0-Introduction: Ikhtisar dan pengaturan workshop
  - 1-Select-AI-Template: Penemuan templat dan proses pemilihan
  - 2-Validate-AI-Template: Prosedur deployment dan validasi
  - 3-Deconstruct-AI-Template: Memahami arsitektur templat
  - 4-Configure-AI-Template: Konfigurasi dan kustomisasi
  - 5-Customize-AI-Template: Modifikasi lanjutan dan iterasi
  - 6-Teardown-Infrastructure: Pembersihan dan manajemen sumber daya
  - 7-Wrap-up: Ringkasan dan langkah berikutnya
- **🛠️ Alat Workshop**: Konfigurasi MkDocs dengan tema Material untuk pengalaman belajar yang ditingkatkan
- **🎯 Jalur Pembelajaran Praktis**: Metodologi 3 langkah (Discovery → Deployment → Customization)
- **📱 Integrasi GitHub Codespaces**: Pengaturan lingkungan pengembangan yang mulus

#### Ditingkatkan
- **Lab Workshop AI**: Diperluas dengan pengalaman pembelajaran terstruktur 2-3 jam yang komprehensif
- **Dokumentasi Workshop**: Presentasi profesional dengan navigasi dan bantuan visual
- **Progresi Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan templat hingga deployment produksi
- **Pengalaman Pengembang**: Alat terintegrasi untuk alur kerja pengembangan yang lebih efisien

#### Ditingkatkan
- **Aksesibilitas**: Antarmuka berbasis browser dengan pencarian, fungsi salin, dan tombol tema
- **Pembelajaran Mandiri**: Struktur workshop yang fleksibel mengakomodasi kecepatan belajar yang berbeda
- **Aplikasi Praktis**: Skenario deployment templat AI dunia nyata
- **Integrasi Komunitas**: Integrasi Discord untuk dukungan dan kolaborasi workshop

#### Fitur Workshop
- **Pencarian Bawaan**: Penemuan cepat kata kunci dan pelajaran
- **Salin Blok Kode**: Fungsi hover-to-copy untuk semua contoh kode
- **Tombol Tema**: Dukungan mode gelap/terang untuk preferensi berbeda
- **Aset Visual**: Tangkapan layar dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses langsung ke Discord untuk dukungan komunitas

### [v3.2.0] - 2025-09-17

#### Restrukturisasi Navigasi Utama dan Sistem Pembelajaran Berbasis Bab
**Versi ini memperkenalkan struktur pembelajaran berbasis bab yang komprehensif dengan navigasi yang ditingkatkan di seluruh repositori.**

#### Ditambahkan
- **📚 Sistem Pembelajaran Berbasis Bab**: Menyusun ulang seluruh kursus menjadi 8 bab pembelajaran progresif
  - Bab 1: Foundation & Quick Start (⭐ - 30-45 menit)
  - Bab 2: AI-First Development (⭐⭐ - 1-2 jam)
  - Bab 3: Configuration & Authentication (⭐⭐ - 45-60 menit)
  - Bab 4: Infrastructure as Code & Deployment (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Multi-Agent AI Solutions (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pre-Deployment Validation & Planning (⭐⭐ - 1 jam)
  - Bab 7: Troubleshooting & Debugging (⭐⭐ - 1-1.5 jam)
  - Bab 8: Production & Enterprise Patterns (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Komprehensif**: Header dan footer navigasi yang konsisten di seluruh dokumentasi
- **🎯 Pelacakan Progres**: Daftar periksa penyelesaian kursus dan sistem verifikasi pembelajaran
- **🗺️ Panduan Jalur Pembelajaran**: Titik masuk yang jelas untuk berbagai tingkat pengalaman dan tujuan
- **🔗 Navigasi Referensi Silang**: Bab terkait dan prasyarat yang jelas ditautkan

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran terstruktur dengan organisasi berbasis bab
- **Navigasi Dokumentasi**: Setiap halaman sekarang menyertakan konteks bab dan panduan progres
- **Pengorganisasian Templat**: Contoh dan templat dipetakan ke bab pembelajaran yang sesuai
- **Integrasi Sumber Daya**: Cheat sheet, FAQ, dan panduan studi terhubung ke bab terkait
- **Integrasi Workshop**: Lab praktis dipetakan ke berbagai tujuan pembelajaran bab

#### Diubah
- **Progresi Pembelajaran**: Berubah dari dokumentasi linier ke pembelajaran berbasis bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi diposisikan sebagai Bab 3 untuk alur pembelajaran yang lebih baik
- **Integrasi Konten AI**: Integrasi konten khusus AI yang lebih baik di seluruh perjalanan pembelajaran
- **Konten Produksi**: Pola lanjutan dikonsolidasikan di Bab 8 untuk pembelajar enterprise

#### Ditingkatkan
- **Pengalaman Pengguna**: Breadcrumb navigasi dan indikator progres bab yang jelas
- **Aksesibilitas**: Pola navigasi konsisten untuk memudahkan penelusuran kursus
- **Presentasi Profesional**: Struktur bergaya universitas yang cocok untuk pelatihan akademik dan perusahaan
- **Efisiensi Pembelajaran**: Waktu menemukan konten relevan berkurang melalui organisasi yang ditingkatkan

#### Implementasi Teknis
- **Header Navigasi**: Navigasi bab standar di lebih dari 40+ berkas dokumentasi
- **Footer Navigasi**: Panduan progres dan indikator penyelesaian bab yang konsisten
- **Referensi Silang**: Sistem penautan internal komprehensif yang menghubungkan konsep terkait
- **Pemetaan Bab**: Templat dan contoh dikaitkan dengan jelas ke tujuan pembelajaran

#### Peningkatan Panduan Studi
- **📚 Tujuan Pembelajaran Komprehensif**: Panduan studi disusun ulang untuk selaras dengan sistem 8-bab
- **🎯 Penilaian Berbasis Bab**: Setiap bab mencakup tujuan pembelajaran spesifik dan latihan praktis
- **📋 Pelacakan Progres**: Jadwal pembelajaran mingguan dengan hasil terukur dan daftar periksa penyelesaian
- **❓ Pertanyaan Penilaian**: Pertanyaan validasi pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktis**: Aktivitas praktis dengan skenario deployment nyata dan pemecahan masalah
- **📊 Progresi Keterampilan**: Kemajuan yang jelas dari konsep dasar hingga pola enterprise dengan fokus pengembangan karier
- **🎓 Kerangka Sertifikasi**: Hasil pengembangan profesional dan sistem pengakuan komunitas
- **⏱️ Manajemen Garis Waktu**: Rencana pembelajaran 10-minggu terstruktur dengan validasi pencapaian

### [v3.1.0] - 2025-09-17

#### Peningkatan Solusi AI Multi-Agen
**Versi ini meningkatkan solusi ritel multi-agen dengan penamaan agen yang lebih baik dan dokumentasi yang ditingkatkan.**

#### Diubah
- **Terminologi Multi-Agen**: Mengganti "Cora agent" dengan "Customer agent" di seluruh solusi ritel multi-agen untuk pemahaman yang lebih jelas
- **Arsitektur Agen**: Memperbarui semua dokumentasi, template ARM, dan contoh kode untuk menggunakan penamaan "Customer agent" yang konsisten
- **Contoh Konfigurasi**: Memodernisasi pola konfigurasi agen dengan konvensi penamaan yang diperbarui
- **Konsistensi Dokumentasi**: Memastikan semua referensi menggunakan nama agen yang profesional dan deskriptif

#### Ditingkatkan
- **Paket Template ARM**: Memperbarui retail-multiagent-arm-template dengan referensi Customer agent
- **Diagram Arsitektur**: Menyegarkan diagram Mermaid dengan penamaan agen yang diperbarui
- **Contoh Kode**: Kelas Python dan contoh implementasi sekarang menggunakan penamaan CustomerAgent
- **Variabel Lingkungan**: Memperbarui semua skrip penyebaran untuk menggunakan konvensi CUSTOMER_AGENT_NAME

#### Ditingkatkan
- **Developer Experience**: Peran dan tanggung jawab agen yang lebih jelas dalam dokumentasi
- **Production Readiness**: Penyesuaian yang lebih baik dengan konvensi penamaan perusahaan
- **Learning Materials**: Penamaan agen yang lebih intuitif untuk tujuan pendidikan
- **Template Usability**: Pemahaman yang disederhanakan tentang fungsi agen dan pola penyebaran

#### Rincian Teknis
- Memperbarui diagram arsitektur Mermaid dengan referensi CustomerAgent
- Mengganti nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Mengubah konfigurasi ARM template JSON untuk menggunakan tipe agen "customer"
- Memperbarui variabel lingkungan dari CORA_AGENT_* ke pola CUSTOMER_AGENT_*
- Menyegarkan semua perintah penyebaran dan konfigurasi kontainer

### [v3.0.0] - 2025-09-12

#### Perubahan Utama - Fokus Pengembang AI dan Integrasi Microsoft Foundry
**Versi ini mengubah repositori menjadi sumber belajar yang berfokus pada AI yang komprehensif dengan integrasi Microsoft Foundry.**

#### Ditambahkan
- **🤖 AI-First Learning Path**: Restrukturisasi lengkap yang memprioritaskan pengembang dan insinyur AI
- **Microsoft Foundry Integration Guide**: Dokumentasi komprehensif untuk menghubungkan AZD dengan layanan Microsoft Foundry
- **AI Model Deployment Patterns**: Panduan rinci yang mencakup pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **AI Workshop Lab**: Lokakarya praktik 2-3 jam untuk mengonversi aplikasi AI menjadi solusi yang dapat dideploy oleh AZD
- **Production AI Best Practices**: Pola siap-perusahaan untuk penskalaan, pemantauan, dan pengamanan beban kerja AI
- **AI-Specific Troubleshooting Guide**: Panduan pemecahan masalah komprehensif untuk Azure OpenAI, Cognitive Services, dan masalah penyebaran AI
- **AI Template Gallery**: Koleksi unggulan template Microsoft Foundry dengan peringkat kompleksitas
- **Workshop Materials**: Struktur lokakarya lengkap dengan lab praktik dan materi referensi

#### Ditingkatkan
- **README Structure**: Berfokus pada pengembang AI dengan data minat komunitas 45% dari Microsoft Foundry Discord
- **Learning Paths**: Perjalanan khusus pengembang AI di samping jalur tradisional untuk mahasiswa dan insinyur DevOps
- **Template Recommendations**: Template AI unggulan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Community Integration**: Dukungan komunitas Discord yang ditingkatkan dengan saluran dan diskusi khusus AI

#### Fokus Keamanan & Produksi
- **Managed Identity Patterns**: Konfigurasi otentikasi dan keamanan khusus AI
- **Cost Optimization**: Pelacakan penggunaan token dan kontrol anggaran untuk beban kerja AI
- **Multi-Region Deployment**: Strategi untuk penyebaran aplikasi AI global
- **Performance Monitoring**: Metrik khusus AI dan integrasi Application Insights

#### Kualitas Dokumentasi
- **Linear Course Structure**: Progresi logis dari pemula hingga pola penyebaran AI tingkat lanjut
- **Validated URLs**: Semua tautan repositori eksternal diverifikasi dan dapat diakses
- **Complete Reference**: Semua tautan dokumentasi internal telah diverifikasi dan berfungsi
- **Production Ready**: Pola penyebaran perusahaan dengan contoh dunia nyata

### [v2.0.0] - 2025-09-09

#### Perubahan Utama - Restrukturisasi Repositori dan Peningkatan Profesional
**Versi ini merupakan perombakan signifikan pada struktur repositori dan penyajian konten.**

#### Ditambahkan
- **Structured Learning Framework**: Semua halaman dokumentasi sekarang mencakup bagian Introduction, Learning Goals, dan Learning Outcomes
- **Navigation System**: Menambahkan tautan Previous/Next lesson di seluruh dokumentasi untuk kemajuan pembelajaran yang terpandu
- **Study Guide**: study-guide.md komprehensif dengan tujuan pembelajaran, latihan praktik, dan materi penilaian
- **Professional Presentation**: Menghapus semua ikon emoji untuk meningkatkan aksesibilitas dan penampilan profesional
- **Enhanced Content Structure**: Peningkatan organisasi dan alur materi pembelajaran

#### Diubah
- **Documentation Format**: Menstandarkan semua dokumentasi dengan struktur yang konsisten berfokus pada pembelajaran
- **Navigation Flow**: Menerapkan progresi logis melalui semua materi pembelajaran
- **Content Presentation**: Menghapus elemen dekoratif demi format yang jelas dan profesional
- **Link Structure**: Memperbarui semua tautan internal untuk mendukung sistem navigasi baru

#### Ditingkatkan
- **Accessibility**: Menghapus ketergantungan emoji untuk kompatibilitas pembaca layar yang lebih baik
- **Professional Appearance**: Penyajian bergaya akademis yang bersih cocok untuk pembelajaran perusahaan
- **Learning Experience**: Pendekatan terstruktur dengan tujuan dan hasil yang jelas untuk setiap pelajaran
- **Content Organization**: Alur logis dan koneksi yang lebih baik antar topik terkait

### [v1.0.0] - 2025-09-09

#### Rilis Awal - Repositori Pembelajaran AZD yang Komprehensif

#### Ditambahkan
- **Struktur Dokumentasi Inti**
  - Seri panduan memulai lengkap
  - Dokumentasi penyebaran dan provisioning yang komprehensif
  - Sumber daya pemecahan masalah dan panduan debugging yang rinci
  - Alat dan prosedur validasi pra-penyebaran

- **Modul Memulai**
  - AZD Basics: Konsep inti dan terminologi
  - Installation Guide: Instruksi pengaturan spesifik platform
  - Configuration Guide: Pengaturan lingkungan dan otentikasi
  - First Project Tutorial: Pembelajaran praktik langkah demi langkah

- **Modul Penyebaran dan Provisioning**
  - Deployment Guide: Dokumentasi alur kerja lengkap
  - Provisioning Guide: Infrastructure as Code dengan Bicep
  - Praktik terbaik untuk penyebaran produksi
  - Pola arsitektur multi-layanan

- **Modul Validasi Pra-penyebaran**
  - Capacity Planning: Validasi ketersediaan sumber daya Azure
  - SKU Selection: Panduan lengkap pemilihan tier layanan
  - Pre-flight Checks: Skrip validasi otomatis (PowerShell dan Bash)
  - Alat estimasi biaya dan perencanaan anggaran

- **Modul Pemecahan Masalah**
  - Common Issues: Masalah yang sering ditemui dan solusinya
  - Debugging Guide: Metodologi pemecahan masalah yang sistematis
  - Teknik dan alat diagnostik tingkat lanjut
  - Pemantauan kinerja dan optimisasi

- **Sumber Daya dan Referensi**
  - Command Cheat Sheet: Referensi cepat untuk perintah penting
  - Glossary: Definisi terminologi dan akronim yang komprehensif
  - FAQ: Jawaban rinci untuk pertanyaan umum
  - Tautan sumber eksternal dan koneksi komunitas

- **Contoh dan Template**
  - Contoh Aplikasi Web Sederhana
  - Template penyebaran Situs Statis
  - Konfigurasi Aplikasi Kontainer
  - Pola integrasi Basis Data
  - Contoh arsitektur Microservices
  - Implementasi fungsi Serverless

#### Fitur
- **Multi-Platform Support**: Panduan instalasi dan konfigurasi untuk Windows, macOS, dan Linux
- **Multiple Skill Levels**: Konten dirancang untuk siswa hingga pengembang profesional
- **Practical Focus**: Contoh praktik dan skenario dunia nyata
- **Comprehensive Coverage**: Dari konsep dasar hingga pola perusahaan tingkat lanjut
- **Security-First Approach**: Praktik terbaik keamanan terintegrasi di seluruh
- **Cost Optimization**: Panduan untuk penyebaran hemat biaya dan manajemen sumber daya

#### Kualitas Dokumentasi
- **Detailed Code Examples**: Contoh kode praktis yang diuji
- **Step-by-Step Instructions**: Panduan jelas dan dapat ditindaklanjuti
- **Comprehensive Error Handling**: Pemecahan masalah untuk masalah umum
- **Best Practices Integration**: Standar industri dan rekomendasi
- **Version Compatibility**: Terbaru dengan layanan Azure dan fitur azd terkini

## Peningkatan Masa Depan yang Direncanakan

### Version 3.1.0 (Direncanakan)
#### Perluasan Platform AI
- **Multi-Model Support**: Pola integrasi untuk Hugging Face, Azure Machine Learning, dan model kustom
- **AI Agent Frameworks**: Template untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Advanced RAG Patterns**: Opsi database vektor di luar Azure AI Search (Pinecone, Weaviate, dll.)
- **AI Observability**: Pemantauan ditingkatkan untuk kinerja model, penggunaan token, dan kualitas respons

#### Pengalaman Pengembang
- **VS Code Extension**: Pengalaman pengembangan terintegrasi AZD + AI Foundry
- **GitHub Copilot Integration**: Pembuatan template AZD berbantuan AI
- **Interactive Tutorials**: Latihan pengkodean praktik dengan validasi otomatis untuk skenario AI
- **Video Content**: Tutorial video tambahan untuk pembelajar visual yang berfokus pada penyebaran AI

### Version 4.0.0 (Direncanakan)
#### Pola AI Perusahaan
- **Governance Framework**: Tata kelola model AI, kepatuhan, dan jejak audit
- **Multi-Tenant AI**: Pola untuk melayani banyak pelanggan dengan layanan AI terisolasi
- **Edge AI Deployment**: Integrasi dengan Azure IoT Edge dan instance kontainer
- **Hybrid Cloud AI**: Pola penyebaran multi-cloud dan hybrid untuk beban kerja AI

#### Fitur Lanjutan
- **AI Pipeline Automation**: Integrasi MLOps dengan pipeline Azure Machine Learning
- **Advanced Security**: Pola zero-trust, private endpoint, dan perlindungan ancaman tingkat lanjut
- **Performance Optimization**: Penyetelan dan strategi penskalaan tingkat lanjut untuk aplikasi AI dengan throughput tinggi
- **Global Distribution**: Pola pengiriman konten dan caching edge untuk aplikasi AI

### Version 3.0.0 (Direncanakan) - Digantikan oleh Rilis Saat Ini
#### Penambahan yang Diusulkan - Sekarang Diimplementasikan di v3.0.0
- ✅ **AI-Focused Content**: Integrasi Microsoft Foundry yang komprehensif (Selesai)
- ✅ **Interactive Tutorials**: Lab lokakarya AI praktik (Selesai)
- ✅ **Advanced Security Module**: Pola keamanan khusus AI (Selesai)
- ✅ **Performance Optimization**: Strategi penyetelan beban kerja AI (Selesai)

### Version 2.1.0 (Direncanakan) - Sebagian Diimplementasikan di v3.0.0
#### Peningkatan Minor - Beberapa Diselesaikan di Rilis Saat Ini
- ✅ **Additional Examples**: Skenario penyebaran berfokus AI (Selesai)
- ✅ **Extended FAQ**: Pertanyaan dan pemecahan masalah khusus AI (Selesai)
- **Tool Integration**: Panduan integrasi IDE dan editor yang ditingkatkan
- ✅ **Monitoring Expansion**: Pola pemantauan dan pemberitahuan khusus AI (Selesai)

#### Masih Direncanakan untuk Rilis Mendatang
- **Mobile-Friendly Documentation**: Desain responsif untuk pembelajaran seluler
- **Offline Access**: Paket dokumentasi yang dapat diunduh
- **Enhanced IDE Integration**: Ekstensi VS Code untuk alur kerja AZD + AI
- **Community Dashboard**: Metrik komunitas real-time dan pelacakan kontribusi

## Berkontribusi pada Changelog

### Melaporkan Perubahan
Saat berkontribusi ke repositori ini, harap pastikan entri changelog mencakup:

1. **Nomor Versi**: Mengikuti penomoran semantik (major.minor.patch)
2. **Tanggal**: Tanggal rilis atau pembaruan dalam format YYYY-MM-DD
3. **Kategori**: Added, Changed, Deprecated, Removed, Fixed, Security
4. **Deskripsi yang Jelas**: Deskripsi singkat tentang apa yang diubah
5. **Penilaian Dampak**: Bagaimana perubahan memengaruhi pengguna yang ada

### Kategori Perubahan

#### Ditambahkan
- Fitur baru, bagian dokumentasi, atau kapabilitas
- Contoh, template, atau sumber belajar baru
- Alat, skrip, atau utilitas tambahan

#### Diubah
- Modifikasi pada fungsionalitas atau dokumentasi yang ada
- Pembaruan untuk meningkatkan kejelasan atau akurasi
- Restrukturisasi konten atau organisasi

#### Dideprekasi
- Fitur atau pendekatan yang sedang dihentikan secara bertahap
- Bagian dokumentasi yang dijadwalkan untuk dihapus
- Metode yang memiliki alternatif yang lebih baik

#### Dihapus
- Fitur, dokumentasi, atau contoh yang tidak lagi relevan
- Informasi usang atau pendekatan yang dideprekasi
- Konten yang redundant atau dikonsolidasikan

#### Diperbaiki
- Koreksi terhadap kesalahan dalam dokumentasi atau kode
- Penyelesaian masalah atau isu yang dilaporkan
- Peningkatan akurasi atau fungsionalitas

#### Keamanan
- Peningkatan atau perbaikan terkait keamanan
- Pembaruan praktik terbaik keamanan
- Penyelesaian kerentanan keamanan

### Pedoman Penomoran Semantik

#### Versi Mayor (X.0.0)
- Perubahan yang merusak kompatibilitas dan memerlukan tindakan pengguna
- Restrukturisasi signifikan pada konten atau organisasi
- Perubahan yang mengubah pendekatan atau metodologi dasar

#### Versi Minor (X.Y.0)
- Fitur baru atau penambahan konten
- Peningkatan yang mempertahankan kompatibilitas mundur
- Contoh, alat, atau sumber tambahan

#### Versi Patch (X.Y.Z)
- Perbaikan bug dan koreksi
- Peningkatan kecil pada konten yang ada
- Klarifikasi dan peningkatan kecil

## Masukan dan Saran Komunitas

Kami secara aktif mendorong masukan komunitas untuk meningkatkan sumber belajar ini:

### Cara Memberikan Masukan
- **GitHub Issues**: Laporkan masalah atau sarankan perbaikan (isu khusus AI dipersilakan)
- **Discord Discussions**: Bagikan ide dan berinteraksi dengan komunitas Microsoft Foundry
- **Pull Requests**: Kontribusikan perbaikan langsung pada konten, terutama template dan panduan AI
- **Microsoft Foundry Discord**: Berpartisipasi di channel #Azure untuk diskusi AZD + AI
- **Community Forums**: Ikuti diskusi pengembang Azure yang lebih luas

### Kategori Masukan
- **AI Content Accuracy**: Koreksi terhadap integrasi layanan AI dan informasi penyebaran
- **Learning Experience**: Saran untuk peningkatan alur pembelajaran pengembang AI
- **Missing AI Content**: Permintaan untuk template, pola, atau contoh AI tambahan
- **Accessibility**: Peningkatan untuk kebutuhan belajar yang beragam
- **AI Tool Integration**: Saran untuk integrasi alur kerja pengembangan AI yang lebih baik
- **Production AI Patterns**: Permintaan pola penyebaran AI perusahaan

### Komitmen Respons
- **Issue Response**: Dalam 48 jam untuk masalah yang dilaporkan
- **Feature Requests**: Evaluasi dalam waktu satu minggu
- **Community Contributions**: Tinjauan dalam waktu satu minggu
- **Security Issues**: Prioritas segera dengan respons yang dipercepat

## Jadwal Pemeliharaan

### Pembaruan Berkala
- **Monthly Reviews**: Keakuratan konten dan validasi tautan
- **Quarterly Updates**: Penambahan dan peningkatan konten utama
- **Semi-Annual Reviews**: Restrukturisasi dan peningkatan komprehensif
- **Annual Releases**: Pembaruan versi mayor dengan peningkatan signifikan

### Pemantauan dan Jaminan Kualitas
- **Automated Testing**: Validasi rutin contoh kode dan tautan
- **Community Feedback Integration**: Penggabungan rutin saran pengguna
- **Technology Updates**: Penyesuaian dengan layanan Azure terbaru dan rilis azd
- **Accessibility Audits**: Tinjauan rutin untuk prinsip desain inklusif

## Kebijakan Dukungan Versi

### Dukungan Versi Saat Ini
- **Latest Major Version**: Dukungan penuh dengan pembaruan rutin
- **Previous Major Version**: Pembaruan keamanan dan perbaikan kritis selama 12 bulan
- **Legacy Versions**: Hanya dukungan komunitas, tidak ada pembaruan resmi

### Panduan Migrasi
 Ketika versi mayor dirilis, kami memberikan:
- **Panduan Migrasi**: Instruksi transisi langkah demi langkah
- **Catatan Kompatibilitas**: Rincian tentang perubahan yang tidak kompatibel
- **Dukungan Alat**: Skrip atau utilitas untuk membantu migrasi
- **Dukungan Komunitas**: Forum khusus untuk pertanyaan tentang migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Belajar](resources/study-guide.md)
- **Pelajaran Berikutnya**: Kembali ke [README Utama](README.md)

**Tetap Terinformasi**: Pantau repositori ini untuk mendapatkan notifikasi tentang rilis baru dan pembaruan penting pada materi pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul akibat penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->