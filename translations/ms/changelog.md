<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-22T09:21:06+00:00",
  "source_file": "changelog.md",
  "language_code": "ms"
}
-->
# Log Perubahan - AZD Untuk Pemula

## Pengenalan

Log perubahan ini mendokumentasikan semua perubahan, kemas kini, dan penambahbaikan penting pada repositori AZD Untuk Pemula. Kami mengikuti prinsip versi semantik dan mengekalkan log ini untuk membantu pengguna memahami apa yang telah berubah antara versi.

## Matlamat Pembelajaran

Dengan menyemak log perubahan ini, anda akan:
- Sentiasa dimaklumkan tentang ciri baharu dan penambahan kandungan
- Memahami penambahbaikan yang dibuat pada dokumentasi sedia ada
- Menjejaki pembetulan pepijat untuk memastikan ketepatan
- Mengikuti evolusi bahan pembelajaran dari masa ke masa

## Hasil Pembelajaran

Selepas menyemak entri log perubahan, anda akan dapat:
- Mengenal pasti kandungan dan sumber baharu yang tersedia untuk pembelajaran
- Memahami bahagian mana yang telah dikemas kini atau diperbaiki
- Merancang laluan pembelajaran anda berdasarkan bahan terkini
- Memberi maklum balas dan cadangan untuk penambahbaikan masa depan

## Sejarah Versi

### [v3.8.0] - 2025-11-19

#### Dokumentasi Lanjutan: Pemantauan, Keselamatan, dan Corak Multi-Ejen
**Versi ini menambah pelajaran komprehensif bertaraf A tentang integrasi Application Insights, corak pengesahan, dan koordinasi multi-ejen untuk pelaksanaan produksi.**

#### Ditambah
- **📊 Pelajaran Integrasi Application Insights**: dalam `docs/pre-deployment/application-insights.md`:
  - Pelaksanaan berfokuskan AZD dengan penyediaan automatik
  - Templat Bicep lengkap untuk Application Insights + Log Analytics
  - Aplikasi Python berfungsi dengan telemetri tersuai (1,200+ baris)
  - Corak pemantauan AI/LLM (penjejakan token/kos Azure OpenAI)
  - 6 diagram Mermaid (arkitektur, penjejakan teragih, aliran telemetri)
  - 3 latihan praktikal (amaran, papan pemuka, pemantauan AI)
  - Contoh pertanyaan Kusto dan strategi pengoptimuman kos
  - Penstriman metrik langsung dan penyahpepijatan masa nyata
  - Masa pembelajaran 40-50 minit dengan corak sedia produksi

- **🔐 Pelajaran Corak Pengesahan & Keselamatan**: dalam `docs/getting-started/authsecurity.md`:
  - 3 corak pengesahan (rentetan sambungan, Key Vault, identiti terurus)
  - Templat infrastruktur Bicep lengkap untuk pelaksanaan selamat
  - Kod aplikasi Node.js dengan integrasi SDK Azure
  - 3 latihan lengkap (mengaktifkan identiti terurus, identiti yang ditugaskan pengguna, putaran Key Vault)
  - Amalan terbaik keselamatan dan konfigurasi RBAC
  - Panduan penyelesaian masalah dan analisis kos
  - Corak pengesahan tanpa kata laluan sedia produksi

- **🤖 Pelajaran Corak Koordinasi Multi-Ejen**: dalam `docs/pre-deployment/coordination-patterns.md`:
  - 5 corak koordinasi (berurutan, selari, hierarki, berasaskan acara, konsensus)
  - Pelaksanaan perkhidmatan pengatur lengkap (Python/Flask, 1,500+ baris)
  - 3 pelaksanaan ejen khusus (Penyelidik, Penulis, Penyunting)
  - Integrasi Service Bus untuk penjadualan mesej
  - Pengurusan keadaan Cosmos DB untuk sistem teragih
  - 6 diagram Mermaid menunjukkan interaksi ejen
  - 3 latihan lanjutan (pengendalian tamat masa, logik percubaan semula, pemutus litar)
  - Pecahan kos ($240-565/bulan) dengan strategi pengoptimuman
  - Integrasi Application Insights untuk pemantauan

#### Ditingkatkan
- **Bab Pra-Pelaksanaan**: Kini termasuk corak pemantauan dan koordinasi yang komprehensif
- **Bab Memulakan**: Ditingkatkan dengan corak pengesahan profesional
- **Kesediaan Produksi**: Liputan lengkap dari keselamatan hingga kebolehlihatan
- **Rangka Kursus**: Dikemas kini untuk merujuk pelajaran baharu dalam Bab 3 dan 6

#### Diubah
- **Perkembangan Pembelajaran**: Integrasi lebih baik keselamatan dan pemantauan sepanjang kursus
- **Kualiti Dokumentasi**: Piawaian bertaraf A yang konsisten (95-97%) merentasi pelajaran baharu
- **Corak Produksi**: Liputan lengkap dari hujung ke hujung untuk pelaksanaan perusahaan

#### Diperbaiki
- **Pengalaman Pembangun**: Laluan jelas dari pembangunan ke pemantauan produksi
- **Piawaian Keselamatan**: Corak profesional untuk pengesahan dan pengurusan rahsia
- **Kebolehlihatan**: Integrasi Application Insights lengkap dengan AZD
- **Beban Kerja AI**: Pemantauan khusus untuk Azure OpenAI dan sistem multi-ejen

#### Disahkan
- ✅ Semua pelajaran termasuk kod berfungsi lengkap (bukan serpihan)
- ✅ Diagram Mermaid untuk pembelajaran visual (19 jumlahnya merentasi 3 pelajaran)
- ✅ Latihan praktikal dengan langkah pengesahan (9 jumlahnya)
- ✅ Templat Bicep sedia produksi boleh dilaksanakan melalui `azd up`
- ✅ Analisis kos dan strategi pengoptimuman
- ✅ Panduan penyelesaian masalah dan amalan terbaik
- ✅ Titik semakan pengetahuan dengan arahan pengesahan

#### Hasil Penilaian Dokumentasi
- **docs/pre-deployment/application-insights.md**: - Panduan pemantauan komprehensif
- **docs/getting-started/authsecurity.md**: - Corak keselamatan profesional
- **docs/pre-deployment/coordination-patterns.md**: - Seni bina multi-ejen lanjutan
- **Kandungan Baharu Keseluruhan**: - Piawaian berkualiti tinggi yang konsisten

#### Pelaksanaan Teknikal
- **Application Insights**: Log Analytics + telemetri tersuai + penjejakan teragih
- **Pengesahan**: Identiti Terurus + Key Vault + corak RBAC
- **Multi-Ejen**: Service Bus + Cosmos DB + Container Apps + orkestrasi
- **Pemantauan**: Metrik langsung + pertanyaan Kusto + amaran + papan pemuka
- **Pengurusan Kos**: Strategi pensampelan, dasar pengekalan, kawalan bajet

### [v3.7.0] - 2025-11-19

#### Penambahbaikan Kualiti Dokumentasi dan Contoh Azure OpenAI Baharu
**Versi ini meningkatkan kualiti dokumentasi di seluruh repositori dan menambah contoh pelaksanaan Azure OpenAI lengkap dengan antara muka sembang GPT-4.**

#### Ditambah
- **🤖 Contoh Sembang Azure OpenAI**: Pelaksanaan GPT-4 lengkap dengan pelaksanaan berfungsi dalam `examples/azure-openai-chat/`:
  - Infrastruktur Azure OpenAI lengkap (pelaksanaan model GPT-4)
  - Antara muka sembang baris perintah Python dengan sejarah perbualan
  - Integrasi Key Vault untuk penyimpanan kunci API yang selamat
  - Penjejakan penggunaan token dan anggaran kos
  - Had kadar dan pengendalian ralat
  - README komprehensif dengan panduan pelaksanaan 35-45 minit
  - 11 fail sedia produksi (templat Bicep, aplikasi Python, konfigurasi)
- **📚 Latihan Dokumentasi**: Ditambah latihan praktikal ke panduan konfigurasi:
  - Latihan 1: Konfigurasi multi-persekitaran (15 minit)
  - Latihan 2: Latihan pengurusan rahsia (10 minit)
  - Kriteria kejayaan yang jelas dan langkah pengesahan
- **✅ Pengesahan Pelaksanaan**: Ditambah bahagian pengesahan ke panduan pelaksanaan:
  - Prosedur pemeriksaan kesihatan
  - Senarai semak kriteria kejayaan
  - Output yang dijangka untuk semua arahan pelaksanaan
  - Rujukan cepat penyelesaian masalah

#### Ditingkatkan
- **examples/README.md**: Dikemas kini ke kualiti bertaraf A (93%):
  - Ditambah azure-openai-chat ke semua bahagian yang relevan
  - Dikemas kini jumlah contoh tempatan dari 3 ke 4
  - Ditambah ke jadual Contoh Aplikasi AI
  - Disepadukan ke dalam Permulaan Cepat untuk Pengguna Pertengahan
  - Ditambah ke bahagian Templat Microsoft Foundry Azure
  - Dikemas kini Matriks Perbandingan dan bahagian penemuan teknologi
- **Kualiti Dokumentasi**: Ditingkatkan dari B+ (87%) → A- (92%) di seluruh folder docs:
  - Ditambah output yang dijangka ke contoh arahan kritikal
  - Termasuk langkah pengesahan untuk perubahan konfigurasi
  - Meningkatkan pembelajaran praktikal dengan latihan praktikal

#### Diubah
- **Perkembangan Pembelajaran**: Integrasi lebih baik contoh AI untuk pelajar pertengahan
- **Struktur Dokumentasi**: Latihan lebih berorientasikan tindakan dengan hasil yang jelas
- **Proses Pengesahan**: Kriteria kejayaan eksplisit ditambah ke aliran kerja utama

#### Diperbaiki
- **Pengalaman Pembangun**: Pelaksanaan Azure OpenAI kini mengambil masa 35-45 minit (berbanding 60-90 untuk alternatif kompleks)
- **Ketelusan Kos**: Anggaran kos yang jelas ($50-200/bulan) untuk contoh Azure OpenAI
- **Laluan Pembelajaran**: Pembangun AI mempunyai titik permulaan yang jelas dengan azure-openai-chat
- **Piawaian Dokumentasi**: Output yang dijangka dan langkah pengesahan yang konsisten

#### Disahkan
- ✅ Contoh Azure OpenAI berfungsi sepenuhnya dengan `azd up`
- ✅ Semua 11 fail pelaksanaan betul secara sintaksis
- ✅ Arahan README sepadan dengan pengalaman pelaksanaan sebenar
- ✅ Pautan dokumentasi dikemas kini di lebih 8 lokasi
- ✅ Indeks contoh mencerminkan 4 contoh tempatan dengan tepat
- ✅ Tiada pautan luaran pendua dalam jadual
- ✅ Semua rujukan navigasi betul

#### Pelaksanaan Teknikal
- **Seni Bina Azure OpenAI**: GPT-4 + Key Vault + corak Container Apps
- **Keselamatan**: Sedia Identiti Terurus, rahsia dalam Key Vault
- **Pemantauan**: Integrasi Application Insights
- **Pengurusan Kos**: Penjejakan token dan pengoptimuman penggunaan
- **Pelaksanaan**: Satu arahan `azd up` untuk penyediaan lengkap

### [v3.6.0] - 2025-11-19

#### Kemas Kini Utama: Contoh Pelaksanaan Aplikasi Kontena
**Versi ini memperkenalkan contoh pelaksanaan aplikasi kontena yang komprehensif dan sedia produksi menggunakan Azure Developer CLI (AZD), dengan dokumentasi lengkap dan integrasi ke dalam laluan pembelajaran.**

#### Ditambah
- **🚀 Contoh Aplikasi Kontena**: Contoh tempatan baharu dalam `examples/container-app/`:
  - [Panduan Utama](examples/container-app/README.md): Gambaran keseluruhan lengkap pelaksanaan kontena, permulaan cepat, produksi, dan corak lanjutan
  - [API Flask Mudah](../../examples/container-app/simple-flask-api): REST API mesra pemula dengan skala-ke-sifar, probe kesihatan, pemantauan, dan penyelesaian masalah
  - [Seni Bina Mikroservis](../../examples/container-app/microservices): Pelaksanaan multi-perkhidmatan sedia produksi (API Gateway, Produk, Pesanan, Pengguna, Pemberitahuan), pemesejan asinkron, Service Bus, Cosmos DB, Azure SQL, penjejakan teragih, pelaksanaan biru-hijau/kanari
- **Amalan Terbaik**: Keselamatan, pemantauan, pengoptimuman kos, dan panduan CI/CD untuk beban kerja kontena
- **Contoh Kod**: `azure.yaml` lengkap, templat Bicep, dan pelaksanaan perkhidmatan berbilang bahasa (Python, Node.js, C#, Go)
- **Ujian & Penyelesaian Masalah**: Senario ujian hujung ke hujung, arahan pemantauan, panduan penyelesaian masalah

#### Diubah
- **README.md**: Dikemas kini untuk menampilkan dan memautkan contoh aplikasi kontena baharu di bawah "Contoh Tempatan - Aplikasi Kontena"
- **examples/README.md**: Dikemas kini untuk menyerlahkan contoh aplikasi kontena, menambah entri matriks perbandingan, dan mengemas kini rujukan teknologi/seni bina
- **Rangka Kursus & Panduan Kajian**: Dikemas kini untuk merujuk contoh aplikasi kontena baharu dan corak pelaksanaan dalam bab yang relevan

#### Disahkan
- ✅ Semua contoh baharu boleh dilaksanakan dengan `azd up` dan mengikuti amalan terbaik
- ✅ Pautan silang dokumentasi dan navigasi dikemas kini
- ✅ Contoh meliputi senario pemula hingga lanjutan, termasuk mikroservis produksi

#### Nota
- **Skop**: Dokumentasi dan contoh dalam bahasa Inggeris sahaja
- **Langkah Seterusnya**: Kembangkan dengan corak kontena lanjutan tambahan dan automasi CI/CD dalam keluaran masa depan

### [v3.5.0] - 2025-11-19

#### Penjenamaan Semula Produk: Microsoft Foundry
**Versi ini melaksanakan perubahan nama produk secara menyeluruh dari "Azure AI Foundry" ke "Microsoft Foundry" di seluruh dokumentasi bahasa Inggeris, mencerminkan penjenamaan semula rasmi Microsoft.**

#### Diubah
- **🔄 Kemas Kini Nama Produk**: Penjenamaan semula lengkap dari "Azure AI Foundry" ke "Microsoft Foundry"
  - Dikemas kini semua rujukan di seluruh dokumentasi bahasa Inggeris dalam folder `docs/`
  - Folder dinamakan semula: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Fail dinamakan semula: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Jumlah: 23 rujukan kandungan dikemas kini di 7 fail dokumentasi

- **📁 Perubahan Struktur Folder**:
  - `docs/ai-foundry/` dinamakan semula ke `docs/microsoft-foundry/`
  - Semua rujukan silang dikemas kini untuk mencerminkan struktur folder baharu
  - Pautan navigasi disahkan di seluruh dokumentasi

- **📄 Penamaan Semula Fail**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Semua pautan dalaman dikemas kini untuk merujuk nama fail baharu

#### Fail Dikemas Kini
- **Dokumentasi Bab** (7 fail):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 kemas kini pautan navigasi
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 rujukan nama produk dikemas kini
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Sudah menggunakan Microsoft Foundry (dari kemas kini sebelumnya)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 rujukan dikemas kini (gambaran keseluruhan, maklum balas komuniti, dokumentasi)
  - `docs/getting-started/azd-basics.md` - 4 pautan silang bab dikemas kini
  - `docs/getting-started/first-project.md` - 2 pautan navigasi bab dikemas kini
  - `docs/getting-started/installation.md` - 2 pautan bab seterusnya dikemas kini
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 rujukan dikemas kini (navigasi, komuniti Discord)
  - `docs/troubleshooting/common-issues.md` - 1 pautan navigasi dikemas kini
  - `docs/troubleshooting/debugging.md` - 1 pautan navigasi dikemas kini

- **Fail Struktur Kursus** (2 fail):
  - `README.md` - 17 rujukan dikemas kini (gambaran keseluruhan kursus, tajuk bab, bahagian templat, pandangan komuniti)
  - `course-outline.md` - 14 rujukan dikemas kini (gambaran keseluruhan, objektif pembelajaran, sumber bab)

#### Disahkan
- ✅ Tiada lagi rujukan laluan folder "ai-foundry" dalam dokumen bahasa Inggeris
- ✅ Tiada lagi rujukan nama produk "Azure AI Foundry" dalam dokumen bahasa Inggeris
- ✅ Semua pautan navigasi berfungsi dengan struktur folder baharu
- ✅ Penamaan semula fail dan folder berjaya diselesaikan
- ✅ Rujukan silang antara bab disahkan

#### Nota
- **Skop**: Perubahan diterapkan pada dokumentasi bahasa Inggeris dalam folder `docs/` sahaja
- **Terjemahan**: Folder terjemahan (`translations/`) tidak dikemas kini dalam versi ini
- **Bengkel**: Bahan bengkel (`workshop/`) tidak dikemas kini dalam versi ini
- **Contoh**: Fail contoh mungkin masih merujuk kepada penamaan lama (akan diperbaiki dalam kemas kini akan datang)
- **Pautan Luar**: URL luar dan rujukan repositori GitHub kekal tidak berubah

#### Panduan Migrasi untuk Penyumbang
Jika anda mempunyai cawangan tempatan atau dokumentasi yang merujuk kepada struktur lama:
1. Kemas kini rujukan folder: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Kemas kini rujukan fail: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Gantikan nama produk: "Azure AI Foundry" → "Microsoft Foundry"
4. Sahkan semua pautan dokumentasi dalaman masih berfungsi

---

### [v3.4.0] - 2025-10-24

#### Pratonton Infrastruktur dan Penambahbaikan Pengesahan
**Versi ini memperkenalkan sokongan menyeluruh untuk ciri pratonton Azure Developer CLI yang baru dan meningkatkan pengalaman pengguna bengkel.**

#### Ditambah
- **🧪 Dokumentasi Ciri Pratonton azd provision --preview**: Liputan menyeluruh tentang keupayaan pratonton infrastruktur yang baru
  - Rujukan arahan dan contoh penggunaan dalam helaian rujukan
  - Integrasi terperinci dalam panduan penyediaan dengan kes penggunaan dan manfaat
  - Integrasi pemeriksaan awal untuk pengesahan penyebaran yang lebih selamat
  - Kemas kini panduan memulakan dengan amalan penyebaran yang mengutamakan keselamatan
- **🚧 Banner Status Bengkel**: Banner HTML profesional yang menunjukkan status pembangunan bengkel
  - Reka bentuk gradasi dengan indikator pembinaan untuk komunikasi pengguna yang jelas
  - Cap masa kemas kini terakhir untuk ketelusan
  - Reka bentuk responsif untuk semua jenis peranti

#### Ditingkatkan
- **Keselamatan Infrastruktur**: Fungsi pratonton diintegrasikan ke seluruh dokumentasi penyebaran
- **Pengesahan Pra-penyebaran**: Skrip automatik kini termasuk ujian pratonton infrastruktur
- **Aliran Kerja Pembangun**: Urutan arahan yang dikemas kini untuk memasukkan pratonton sebagai amalan terbaik
- **Pengalaman Bengkel**: Jangkaan yang jelas ditetapkan untuk pengguna tentang status pembangunan kandungan

#### Diubah
- **Amalan Terbaik Penyebaran**: Aliran kerja berasaskan pratonton kini menjadi pendekatan yang disyorkan
- **Aliran Dokumentasi**: Pengesahan infrastruktur dipindahkan lebih awal dalam proses pembelajaran
- **Penyampaian Bengkel**: Komunikasi status profesional dengan garis masa pembangunan yang jelas

#### Diperbaiki
- **Pendekatan Mengutamakan Keselamatan**: Perubahan infrastruktur kini boleh disahkan sebelum penyebaran
- **Kerjasama Pasukan**: Hasil pratonton boleh dikongsi untuk semakan dan kelulusan
- **Kesedaran Kos**: Pemahaman yang lebih baik tentang kos sumber sebelum penyediaan
- **Pengurangan Risiko**: Mengurangkan kegagalan penyebaran melalui pengesahan awal

#### Pelaksanaan Teknikal
- **Integrasi Berbilang Dokumen**: Ciri pratonton didokumentasikan dalam 4 fail utama
- **Corak Arahan**: Sintaks dan contoh yang konsisten di seluruh dokumentasi
- **Integrasi Amalan Terbaik**: Pratonton dimasukkan dalam aliran kerja dan skrip pengesahan
- **Indikator Visual**: Penandaan ciri BARU yang jelas untuk kebolehtemuan

#### Infrastruktur Bengkel
- **Komunikasi Status**: Banner HTML profesional dengan gaya gradasi
- **Pengalaman Pengguna**: Status pembangunan yang jelas mengelakkan kekeliruan
- **Penyampaian Profesional**: Mengekalkan kredibiliti repositori sambil menetapkan jangkaan
- **Ketelusan Garis Masa**: Cap masa kemas kini terakhir Oktober 2025 untuk akauntabiliti

### [v3.3.0] - 2025-09-24

#### Bahan Bengkel yang Ditingkatkan dan Pengalaman Pembelajaran Interaktif
**Versi ini memperkenalkan bahan bengkel yang menyeluruh dengan panduan interaktif berasaskan pelayar dan laluan pembelajaran yang terstruktur.**

#### Ditambah
- **🎥 Panduan Bengkel Interaktif**: Pengalaman bengkel berasaskan pelayar dengan keupayaan pratonton MkDocs
- **📝 Arahan Bengkel Terstruktur**: Laluan pembelajaran berpandu 7 langkah dari penemuan hingga penyesuaian
  - 0-Pengenalan: Gambaran keseluruhan bengkel dan persediaan
  - 1-Pilih-Templat-AI: Proses penemuan dan pemilihan templat
  - 2-Sahkan-Templat-AI: Prosedur penyebaran dan pengesahan
  - 3-Bongkar-Templat-AI: Memahami seni bina templat
  - 4-Konfigurasi-Templat-AI: Konfigurasi dan penyesuaian
  - 5-Sesuaikan-Templat-AI: Pengubahsuaian dan iterasi lanjutan
  - 6-Hapuskan-Infrastruktur: Pengurusan pembersihan dan sumber
  - 7-Penutup: Ringkasan dan langkah seterusnya
- **🛠️ Alat Bengkel**: Konfigurasi MkDocs dengan tema Material untuk pengalaman pembelajaran yang dipertingkatkan
- **🎯 Laluan Pembelajaran Praktikal**: Metodologi 3 langkah (Penemuan → Penyebaran → Penyesuaian)
- **📱 Integrasi GitHub Codespaces**: Persediaan persekitaran pembangunan yang lancar

#### Ditingkatkan
- **Makmal Bengkel AI**: Diperluaskan dengan pengalaman pembelajaran terstruktur selama 2-3 jam
- **Dokumentasi Bengkel**: Penyampaian profesional dengan navigasi dan bantuan visual
- **Perkembangan Pembelajaran**: Panduan langkah demi langkah yang jelas dari pemilihan templat hingga penyebaran produksi
- **Pengalaman Pembangun**: Alat yang diintegrasikan untuk aliran kerja pembangunan yang dipermudahkan

#### Diperbaiki
- **Kebolehcapaian**: Antara muka berasaskan pelayar dengan fungsi carian, salin, dan togol tema
- **Pembelajaran Kendiri**: Struktur bengkel yang fleksibel untuk menyesuaikan kelajuan pembelajaran yang berbeza
- **Aplikasi Praktikal**: Senario penyebaran templat AI dunia sebenar
- **Integrasi Komuniti**: Integrasi Discord untuk sokongan bengkel dan kerjasama

#### Ciri Bengkel
- **Carian Terbina Dalam**: Penemuan kata kunci dan pelajaran dengan cepat
- **Salin Blok Kod**: Fungsi salin dengan hover untuk semua contoh kod
- **Togol Tema**: Sokongan mod gelap/terang untuk keutamaan yang berbeza
- **Aset Visual**: Tangkapan skrin dan diagram untuk pemahaman yang lebih baik
- **Integrasi Bantuan**: Akses terus ke Discord untuk sokongan komuniti

### [v3.2.0] - 2025-09-17

#### Penstrukturan Semula Navigasi Utama dan Sistem Pembelajaran Berasaskan Bab
**Versi ini memperkenalkan struktur pembelajaran berasaskan bab yang menyeluruh dengan navigasi yang dipertingkatkan di seluruh repositori.**

#### Ditambah
- **📚 Sistem Pembelajaran Berasaskan Bab**: Menyusun semula keseluruhan kursus kepada 8 bab pembelajaran progresif
  - Bab 1: Asas & Permulaan Cepat (⭐ - 30-45 minit)
  - Bab 2: Pembangunan Berasaskan AI (⭐⭐ - 1-2 jam)
  - Bab 3: Konfigurasi & Pengesahan (⭐⭐ - 45-60 minit)
  - Bab 4: Infrastruktur sebagai Kod & Penyebaran (⭐⭐⭐ - 1-1.5 jam)
  - Bab 5: Penyelesaian AI Berbilang Ejen (⭐⭐⭐⭐ - 2-3 jam)
  - Bab 6: Pengesahan & Perancangan Pra-penyebaran (⭐⭐ - 1 jam)
  - Bab 7: Penyelesaian Masalah & Penyahpepijatan (⭐⭐ - 1-1.5 jam)
  - Bab 8: Corak Produksi & Perusahaan (⭐⭐⭐⭐ - 2-3 jam)
- **📚 Sistem Navigasi Menyeluruh**: Tajuk dan kaki navigasi yang konsisten di seluruh dokumentasi
- **🎯 Penjejakan Kemajuan**: Senarai semak penyelesaian kursus dan sistem pengesahan pembelajaran
- **🗺️ Panduan Laluan Pembelajaran**: Titik masuk yang jelas untuk tahap pengalaman dan matlamat yang berbeza
- **🔗 Navigasi Rujukan Silang**: Bab berkaitan dan prasyarat yang jelas dipautkan

#### Ditingkatkan
- **Struktur README**: Diubah menjadi platform pembelajaran berstruktur dengan organisasi berasaskan bab
- **Navigasi Dokumentasi**: Setiap halaman kini termasuk konteks bab dan panduan perkembangan
- **Organisasi Templat**: Contoh dan templat dipetakan kepada bab pembelajaran yang sesuai
- **Integrasi Sumber**: Helaian rujukan, Soalan Lazim, dan panduan belajar dihubungkan ke bab yang relevan
- **Integrasi Bengkel**: Makmal praktikal dipetakan kepada pelbagai objektif pembelajaran bab

#### Diubah
- **Perkembangan Pembelajaran**: Beralih dari dokumentasi linear ke pembelajaran berasaskan bab yang fleksibel
- **Penempatan Konfigurasi**: Panduan konfigurasi diposisikan semula sebagai Bab 3 untuk aliran pembelajaran yang lebih baik
- **Integrasi Kandungan AI**: Integrasi yang lebih baik bagi kandungan khusus AI sepanjang perjalanan pembelajaran
- **Kandungan Produksi**: Corak lanjutan disatukan dalam Bab 8 untuk pelajar perusahaan

#### Diperbaiki
- **Pengalaman Pengguna**: Navigasi breadcrumbs yang jelas dan indikator perkembangan bab
- **Kebolehcapaian**: Corak navigasi yang konsisten untuk memudahkan penelusuran kursus
- **Penyampaian Profesional**: Struktur kursus gaya universiti yang sesuai untuk latihan akademik dan korporat
- **Kecekapan Pembelajaran**: Masa yang dikurangkan untuk mencari kandungan yang relevan melalui organisasi yang dipertingkatkan

#### Pelaksanaan Teknikal
- **Tajuk Navigasi**: Navigasi bab yang diseragamkan di seluruh 40+ fail dokumentasi
- **Navigasi Kaki**: Panduan perkembangan yang konsisten dan indikator penyelesaian bab
- **Pautan Silang**: Sistem pautan dalaman yang menyeluruh menghubungkan konsep berkaitan
- **Pemetaan Bab**: Templat dan contoh yang jelas dikaitkan dengan objektif pembelajaran

#### Peningkatan Panduan Belajar
- **📚 Objektif Pembelajaran Menyeluruh**: Panduan belajar disusun semula untuk sejajar dengan sistem 8 bab
- **🎯 Penilaian Berasaskan Bab**: Setiap bab termasuk objektif pembelajaran khusus dan latihan praktikal
- **📋 Penjejakan Kemajuan**: Jadual pembelajaran mingguan dengan hasil yang boleh diukur dan senarai semak penyelesaian
- **❓ Soalan Penilaian**: Soalan pengesahan pengetahuan untuk setiap bab dengan hasil profesional
- **🛠️ Latihan Praktikal**: Aktiviti praktikal dengan senario penyebaran sebenar dan penyelesaian masalah
- **📊 Perkembangan Kemahiran**: Kemajuan yang jelas dari konsep asas ke corak perusahaan dengan fokus pembangunan kerjaya
- **🎓 Rangka Kerja Pensijilan**: Hasil pembangunan profesional dan sistem pengiktirafan komuniti
- **⏱️ Pengurusan Garis Masa**: Pelan pembelajaran 10 minggu yang terstruktur dengan pengesahan pencapaian

### [v3.1.0] - 2025-09-17

#### Penyelesaian AI Berbilang Ejen yang Ditingkatkan
**Versi ini meningkatkan penyelesaian runcit berbilang ejen dengan penamaan ejen yang lebih baik dan dokumentasi yang dipertingkatkan.**

#### Diubah
- **Terminologi Berbilang Ejen**: Menggantikan "Cora agent" dengan "Customer agent" di seluruh penyelesaian runcit berbilang ejen untuk pemahaman yang lebih jelas
- **Seni Bina Ejen**: Mengemas kini semua dokumentasi, templat ARM, dan contoh kod untuk menggunakan penamaan "Customer agent" yang konsisten
- **Contoh Konfigurasi**: Memodenkan corak konfigurasi ejen dengan konvensyen penamaan yang dikemas kini
- **Konsistensi Dokumentasi**: Memastikan semua rujukan menggunakan nama ejen yang profesional dan deskriptif

#### Ditingkatkan
- **Pakej Templat ARM**: Mengemas kini templat retail-multiagent-arm-template dengan rujukan Customer agent
- **Diagram Seni Bina**: Menyegarkan diagram Mermaid dengan penamaan ejen yang dikemas kini
- **Contoh Kod**: Kelas Python dan contoh pelaksanaan kini menggunakan penamaan CustomerAgent
- **Pembolehubah Persekitaran**: Mengemas kini semua skrip penyebaran untuk menggunakan konvensyen CUSTOMER_AGENT_NAME

#### Diperbaiki
- **Pengalaman Pembangun**: Peranan dan tanggungjawab ejen yang lebih jelas dalam dokumentasi
- **Kesediaan Produksi**: Penjajaran yang lebih baik dengan konvensyen penamaan perusahaan
- **Bahan Pembelajaran**: Penamaan ejen yang lebih intuitif untuk tujuan pendidikan
- **Kebolehgunaan Templat**: Mempermudah pemahaman tentang fungsi ejen dan corak penyebaran

#### Butiran Teknikal
- Mengemas kini diagram seni bina Mermaid dengan rujukan CustomerAgent
- Menggantikan nama kelas CoraAgent dengan CustomerAgent dalam contoh Python
- Mengubah konfigurasi JSON templat ARM untuk menggunakan jenis ejen "customer"
- Mengemas kini pembolehubah persekitaran dari CORA_AGENT_* ke corak CUSTOMER_AGENT_*
- Menyegarkan semua arahan penyebaran dan konfigurasi kontena

### [v3.0.0] - 2025-09-12

#### Perubahan Utama - Fokus Pembangun AI dan Integrasi Azure AI Foundry
**Versi ini mengubah repositori menjadi sumber pembelajaran AI yang komprehensif dengan integrasi Azure AI Foundry.**

#### Ditambah
- **🤖 Laluan Pembelajaran Berasaskan AI**: Penyusunan semula lengkap yang memfokuskan kepada pembangun dan jurutera AI
- **Panduan Integrasi Azure AI Foundry**: Dokumentasi menyeluruh untuk menghubungkan AZD dengan perkhidmatan Azure AI Foundry
- **Corak Penyebaran Model AI**: Panduan terperinci yang merangkumi pemilihan model, konfigurasi, dan strategi penyebaran produksi
- **Makmal Bengkel AI**: Bengkel praktikal selama 2-3 jam untuk menukar aplikasi AI kepada penyelesaian yang boleh disebarkan oleh AZD
- **Amalan Terbaik AI Produksi**: Corak siap perusahaan untuk menskalakan, memantau, dan mengamankan beban kerja AI
- **Panduan Penyelesaian Masalah Khusus AI**: Penyelesaian masalah menyeluruh untuk Azure OpenAI, Cognitive Services, dan isu penyebaran AI
- **Galeri Templat AI**: Koleksi templat Azure AI Foundry yang ditampilkan dengan penilaian kerumitan
- **Bahan Bengkel**: Struktur bengkel lengkap dengan makmal praktikal dan bahan rujukan

#### Ditingkatkan
- **Struktur README**: Fokus kepada pembangun AI dengan data minat komuniti 45% dari Discord Azure AI Foundry
- **Laluan Pembelajaran**: Perjalanan pembangun AI khusus bersama laluan tradisional untuk pelajar dan jurutera DevOps
- **Cadangan Templat**: Templat AI yang ditampilkan termasuk azure-search-openai-demo, contoso-chat, dan openai-chat-app-quickstart
- **Integrasi Komuniti**: Sokongan komuniti Discord yang dipertingkatkan dengan saluran dan perbincangan khusus AI

#### Fokus Keselamatan & Produksi
- **Corak Identiti Terurus**: Konfigurasi pengesahan dan keselamatan khusus AI
- **Pengoptimuman Kos**: Penjejakan penggunaan token dan kawalan bajet untuk beban kerja AI
- **Penyebaran Berbilang Wilayah**: Strategi untuk penyebaran aplikasi AI global
- **Pemantauan Prestasi**: Metrik khusus AI dan integrasi Application Insights

#### Kualiti Dokumentasi
- **Struktur Kursus Linear**: Perkembangan logik dari corak penyebaran AI pemula hingga lanjutan
- **URL yang Disahkan**: Semua pautan repositori luar disahkan dan boleh diakses
- **Rujukan Lengkap**: Semua pautan dokumentasi dalaman disahkan dan berfungsi
- **Siap Produksi**: Corak penyebaran perusahaan dengan contoh dunia sebenar

### [v2.0.0] - 2025-09-09

#### Perubahan Utama - Penstrukturan Semula Repositori dan Peningkatan Profesional
**Versi ini mewakili perubahan besar dalam struktur repositori dan penyampaian kandungan.**

#### Ditambah
- **Rangka Kerja Pembelajaran Berstruktur**: Semua halaman dokumentasi kini termasuk bahagian Pengenalan, Matlamat Pembelajaran, dan Hasil Pembelajaran
- **Sistem Navigasi**: Menambah pautan Pelajaran Sebelumnya/Seterusnya di seluruh dokumentasi untuk perkembangan pembelajaran berpandu
- **Panduan Belajar**: study-guide.md yang komprehensif dengan objektif pembelajaran, latihan praktikal, dan bahan penilaian
- **Penyampaian Profesional**: Menghapuskan semua ikon emoji untuk meningkatkan
- **Penyampaian Kandungan**: Elemen hiasan dibuang untuk format yang jelas dan profesional
- **Struktur Pautan**: Semua pautan dalaman dikemas kini untuk menyokong sistem navigasi baharu

#### Ditingkatkan
- **Kebolehcapaian**: Ketergantungan emoji dibuang untuk keserasian pembaca skrin yang lebih baik
- **Penampilan Profesional**: Persembahan gaya akademik yang bersih, sesuai untuk pembelajaran perusahaan
- **Pengalaman Pembelajaran**: Pendekatan berstruktur dengan objektif dan hasil yang jelas untuk setiap pelajaran
- **Organisasi Kandungan**: Aliran logik dan sambungan yang lebih baik antara topik berkaitan

### [v1.0.0] - 2025-09-09

#### Pelepasan Awal - Repositori Pembelajaran AZD Komprehensif

#### Ditambah
- **Struktur Dokumentasi Teras**
  - Siri panduan memulakan lengkap
  - Dokumentasi penyebaran dan penyediaan yang komprehensif
  - Sumber penyelesaian masalah dan panduan debugging yang terperinci
  - Alat dan prosedur pengesahan pra-penyebaran

- **Modul Memulakan**
  - Asas AZD: Konsep dan istilah teras
  - Panduan Pemasangan: Arahan persediaan khusus platform
  - Panduan Konfigurasi: Persediaan persekitaran dan pengesahan
  - Tutorial Projek Pertama: Pembelajaran praktikal langkah demi langkah

- **Modul Penyebaran dan Penyediaan**
  - Panduan Penyebaran: Dokumentasi aliran kerja lengkap
  - Panduan Penyediaan: Infrastruktur sebagai Kod dengan Bicep
  - Amalan terbaik untuk penyebaran produksi
  - Corak seni bina pelbagai perkhidmatan

- **Modul Pengesahan Pra-Penyebaran**
  - Perancangan Kapasiti: Pengesahan ketersediaan sumber Azure
  - Pemilihan SKU: Panduan peringkat perkhidmatan yang komprehensif
  - Pemeriksaan Awal: Skrip pengesahan automatik (PowerShell dan Bash)
  - Alat anggaran kos dan perancangan bajet

- **Modul Penyelesaian Masalah**
  - Isu Biasa: Masalah yang sering ditemui dan penyelesaiannya
  - Panduan Debugging: Metodologi penyelesaian masalah yang sistematik
  - Teknik dan alat diagnostik lanjutan
  - Pemantauan prestasi dan pengoptimuman

- **Sumber dan Rujukan**
  - Lembaran Rujukan Perintah: Rujukan pantas untuk perintah penting
  - Glosari: Definisi istilah dan akronim yang komprehensif
  - FAQ: Jawapan terperinci kepada soalan lazim
  - Pautan sumber luaran dan sambungan komuniti

- **Contoh dan Templat**
  - Contoh Aplikasi Web Ringkas
  - Templat penyebaran Laman Web Statik
  - Konfigurasi Aplikasi Kontena
  - Corak integrasi pangkalan data
  - Contoh seni bina mikroservis
  - Pelaksanaan fungsi tanpa pelayan

#### Ciri-ciri
- **Sokongan Pelbagai Platform**: Panduan pemasangan dan konfigurasi untuk Windows, macOS, dan Linux
- **Pelbagai Tahap Kemahiran**: Kandungan direka untuk pelajar hingga pembangun profesional
- **Fokus Praktikal**: Contoh praktikal dan senario dunia sebenar
- **Liputan Komprehensif**: Dari konsep asas hingga corak perusahaan lanjutan
- **Pendekatan Keutamaan Keselamatan**: Amalan terbaik keselamatan disepadukan sepanjang kandungan
- **Pengoptimuman Kos**: Panduan untuk penyebaran kos efektif dan pengurusan sumber

#### Kualiti Dokumentasi
- **Contoh Kod Terperinci**: Contoh kod praktikal yang telah diuji
- **Arahan Langkah Demi Langkah**: Panduan yang jelas dan boleh diikuti
- **Pengendalian Ralat Komprehensif**: Penyelesaian masalah untuk isu biasa
- **Integrasi Amalan Terbaik**: Piawaian industri dan cadangan
- **Keserasian Versi**: Dikemas kini dengan perkhidmatan Azure terkini dan ciri azd

## Penambahbaikan Masa Depan yang Dirancang

### Versi 3.1.0 (Dirancang)
#### Pengembangan Platform AI
- **Sokongan Pelbagai Model**: Corak integrasi untuk Hugging Face, Azure Machine Learning, dan model tersuai
- **Kerangka Agen AI**: Templat untuk penyebaran LangChain, Semantic Kernel, dan AutoGen
- **Corak RAG Lanjutan**: Pilihan pangkalan data vektor selain Azure AI Search (Pinecone, Weaviate, dll.)
- **Kebolehlihatan AI**: Pemantauan yang dipertingkatkan untuk prestasi model, penggunaan token, dan kualiti respons

#### Pengalaman Pembangun
- **Sambungan VS Code**: Pengalaman pembangunan AZD + AI Foundry yang disepadukan
- **Integrasi GitHub Copilot**: Penjanaan templat AZD dibantu AI
- **Tutorial Interaktif**: Latihan pengekodan praktikal dengan pengesahan automatik untuk senario AI
- **Kandungan Video**: Tutorial video tambahan untuk pembelajaran visual yang memfokuskan pada penyebaran AI

### Versi 4.0.0 (Dirancang)
#### Corak AI Perusahaan
- **Kerangka Tadbir Urus**: Tadbir urus model AI, pematuhan, dan jejak audit
- **AI Pelbagai Penyewa**: Corak untuk melayani pelbagai pelanggan dengan perkhidmatan AI yang terasing
- **Penyebaran AI Tepi**: Integrasi dengan Azure IoT Edge dan instans kontena
- **AI Awan Hibrid**: Corak penyebaran pelbagai awan dan hibrid untuk beban kerja AI

#### Ciri Lanjutan
- **Automasi Saluran AI**: Integrasi MLOps dengan saluran Azure Machine Learning
- **Keselamatan Lanjutan**: Corak kepercayaan sifar, titik akhir peribadi, dan perlindungan ancaman lanjutan
- **Pengoptimuman Prestasi**: Strategi penalaan dan penskalaan lanjutan untuk aplikasi AI berkapasiti tinggi
- **Pengedaran Global**: Corak penghantaran kandungan dan caching tepi untuk aplikasi AI

### Versi 3.0.0 (Dirancang) - Digantikan oleh Pelepasan Semasa
#### Penambahan yang Dicadangkan - Kini Dilaksanakan dalam v3.0.0
- ✅ **Kandungan Berfokus AI**: Integrasi Azure AI Foundry yang komprehensif (Selesai)
- ✅ **Tutorial Interaktif**: Makmal bengkel AI praktikal (Selesai)
- ✅ **Modul Keselamatan Lanjutan**: Corak keselamatan khusus AI (Selesai)
- ✅ **Pengoptimuman Prestasi**: Strategi penalaan beban kerja AI (Selesai)

### Versi 2.1.0 (Dirancang) - Sebahagiannya Dilaksanakan dalam v3.0.0
#### Penambahbaikan Kecil - Sebahagian Selesai dalam Pelepasan Semasa
- ✅ **Contoh Tambahan**: Senario penyebaran berfokus AI (Selesai)
- ✅ **FAQ Diperluas**: Soalan dan penyelesaian masalah khusus AI (Selesai)
- **Integrasi Alat**: Panduan integrasi IDE dan editor yang dipertingkatkan
- ✅ **Pengembangan Pemantauan**: Corak pemantauan dan amaran khusus AI (Selesai)

#### Masih Dirancang untuk Pelepasan Masa Depan
- **Dokumentasi Mesra Mudah Alih**: Reka bentuk responsif untuk pembelajaran mudah alih
- **Akses Luar Talian**: Pakej dokumentasi yang boleh dimuat turun
- **Integrasi IDE yang Dipertingkatkan**: Sambungan VS Code untuk aliran kerja AZD + AI
- **Papan Pemuka Komuniti**: Metrik komuniti masa nyata dan penjejakan sumbangan

## Menyumbang kepada Changelog

### Melaporkan Perubahan
Apabila menyumbang kepada repositori ini, pastikan entri changelog termasuk:

1. **Nombor Versi**: Mengikut versi semantik (utama.minor.tambahan)
2. **Tarikh**: Tarikh pelepasan atau kemas kini dalam format YYYY-MM-DD
3. **Kategori**: Ditambah, Diubah, Dihapuskan, Dikeluarkan, Diperbaiki, Keselamatan
4. **Penerangan Jelas**: Penerangan ringkas tentang apa yang berubah
5. **Penilaian Impak**: Bagaimana perubahan mempengaruhi pengguna sedia ada

### Kategori Perubahan

#### Ditambah
- Ciri baharu, bahagian dokumentasi, atau keupayaan
- Contoh baharu, templat, atau sumber pembelajaran
- Alat, skrip, atau utiliti tambahan

#### Diubah
- Pengubahsuaian kepada fungsi atau dokumentasi sedia ada
- Kemas kini untuk meningkatkan kejelasan atau ketepatan
- Penyusunan semula kandungan atau organisasi

#### Dihapuskan
- Ciri atau pendekatan yang sedang dihentikan
- Bahagian dokumentasi yang dijadualkan untuk dikeluarkan
- Kaedah yang mempunyai alternatif yang lebih baik

#### Dikeluarkan
- Ciri, dokumentasi, atau contoh yang tidak lagi relevan
- Maklumat usang atau pendekatan yang dihentikan
- Kandungan yang berlebihan atau disatukan

#### Diperbaiki
- Pembetulan kepada kesilapan dalam dokumentasi atau kod
- Penyelesaian kepada isu atau masalah yang dilaporkan
- Penambahbaikan kepada ketepatan atau fungsi

#### Keselamatan
- Penambahbaikan atau pembetulan berkaitan keselamatan
- Kemas kini kepada amalan terbaik keselamatan
- Penyelesaian kepada kelemahan keselamatan

### Garis Panduan Versi Semantik

#### Versi Utama (X.0.0)
- Perubahan besar yang memerlukan tindakan pengguna
- Penyusunan semula kandungan atau organisasi yang ketara
- Perubahan yang mengubah pendekatan atau metodologi asas

#### Versi Minor (X.Y.0)
- Ciri atau penambahan kandungan baharu
- Penambahbaikan yang mengekalkan keserasian ke belakang
- Contoh, alat, atau sumber tambahan

#### Versi Tambahan (X.Y.Z)
- Pembetulan pepijat dan kesilapan
- Penambahbaikan kecil kepada kandungan sedia ada
- Penjelasan dan penambahbaikan kecil

## Maklum Balas dan Cadangan Komuniti

Kami menggalakkan maklum balas komuniti untuk meningkatkan sumber pembelajaran ini:

### Cara Memberi Maklum Balas
- **Isu GitHub**: Laporkan masalah atau cadangkan penambahbaikan (isu khusus AI dialu-alukan)
- **Perbincangan Discord**: Kongsi idea dan berinteraksi dengan komuniti Azure AI Foundry
- **Permintaan Tarik**: Sumbang penambahbaikan langsung kepada kandungan, terutamanya templat dan panduan AI
- **Discord Azure AI Foundry**: Sertai saluran #Azure untuk perbincangan AZD + AI
- **Forum Komuniti**: Sertai perbincangan pembangun Azure yang lebih luas

### Kategori Maklum Balas
- **Ketepatan Kandungan AI**: Pembetulan kepada maklumat integrasi dan penyebaran perkhidmatan AI
- **Pengalaman Pembelajaran**: Cadangan untuk aliran pembelajaran pembangun AI yang lebih baik
- **Kandungan AI yang Hilang**: Permintaan untuk templat, corak, atau contoh AI tambahan
- **Kebolehcapaian**: Penambahbaikan untuk keperluan pembelajaran yang pelbagai
- **Integrasi Alat AI**: Cadangan untuk integrasi aliran kerja pembangunan AI yang lebih baik
- **Corak AI Produksi**: Permintaan corak penyebaran AI perusahaan

### Komitmen Respons
- **Respons Isu**: Dalam masa 48 jam untuk masalah yang dilaporkan
- **Permintaan Ciri**: Penilaian dalam masa seminggu
- **Sumbangan Komuniti**: Semakan dalam masa seminggu
- **Isu Keselamatan**: Keutamaan segera dengan respons dipercepatkan

## Jadual Penyelenggaraan

### Kemas Kini Berkala
- **Semakan Bulanan**: Ketepatan kandungan dan pengesahan pautan
- **Kemas Kini Suku Tahunan**: Penambahan dan penambahbaikan kandungan utama
- **Semakan Setengah Tahun**: Penyusunan semula dan peningkatan menyeluruh
- **Pelepasan Tahunan**: Kemas kini versi utama dengan penambahbaikan ketara

### Pemantauan dan Jaminan Kualiti
- **Ujian Automatik**: Pengesahan berkala contoh kod dan pautan
- **Integrasi Maklum Balas Komuniti**: Penggabungan cadangan pengguna secara berkala
- **Kemas Kini Teknologi**: Penjajaran dengan perkhidmatan Azure terkini dan pelepasan azd
- **Audit Kebolehcapaian**: Semakan berkala untuk prinsip reka bentuk inklusif

## Polisi Sokongan Versi

### Sokongan Versi Semasa
- **Versi Utama Terkini**: Sokongan penuh dengan kemas kini berkala
- **Versi Utama Sebelumnya**: Kemas kini keselamatan dan pembetulan kritikal selama 12 bulan
- **Versi Legasi**: Sokongan komuniti sahaja, tiada kemas kini rasmi

### Panduan Migrasi
Apabila versi utama dikeluarkan, kami menyediakan:
- **Panduan Migrasi**: Arahan peralihan langkah demi langkah
- **Nota Keserasian**: Butiran tentang perubahan besar
- **Sokongan Alat**: Skrip atau utiliti untuk membantu migrasi
- **Sokongan Komuniti**: Forum khusus untuk soalan migrasi

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Panduan Kajian](resources/study-guide.md)
- **Pelajaran Seterusnya**: Kembali ke [README Utama](README.md)

**Kekal Dikemas Kini**: Ikuti repositori ini untuk pemberitahuan tentang pelepasan baharu dan kemas kini penting kepada bahan pembelajaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->