<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T08:20:44+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ms"
}
-->
# Panduan Pembelajaran - Objektif Pembelajaran Komprehensif

**Navigasi Laluan Pembelajaran**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Belajar**: [Bab 1: Asas & Permulaan Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Penjejakan Kemajuan**: [Penyelesaian Kursus](../README.md#-course-completion--certification)

## Pengenalan

Panduan pembelajaran komprehensif ini menyediakan objektif pembelajaran yang tersusun, konsep utama, latihan praktikal, dan bahan penilaian untuk membantu anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk menjejaki kemajuan anda dan memastikan semua topik penting telah diliputi.

## Matlamat Pembelajaran

Dengan melengkapkan panduan pembelajaran ini, anda akan:
- Menguasai semua konsep asas dan lanjutan Azure Developer CLI
- Membangunkan kemahiran praktikal dalam menyebarkan dan mengurus aplikasi Azure
- Meningkatkan keyakinan dalam menyelesaikan masalah dan mengoptimumkan penyebaran
- Memahami amalan penyebaran bersedia untuk produksi dan pertimbangan keselamatan

## Hasil Pembelajaran

Selepas melengkapkan semua bahagian dalam panduan pembelajaran ini, anda akan dapat:
- Mereka bentuk, menyebar, dan mengurus seni bina aplikasi lengkap menggunakan azd
- Melaksanakan strategi pemantauan, keselamatan, dan pengoptimuman kos yang menyeluruh
- Menyelesaikan masalah penyebaran yang kompleks secara berdikari
- Mencipta templat tersuai dan menyumbang kepada komuniti azd

## Struktur Pembelajaran 8 Bab

### Bab 1: Asas & Permulaan Pantas (Minggu 1)
**Tempoh**: 30-45 minit | **Kerumitan**: ⭐

#### Objektif Pembelajaran
- Memahami konsep asas dan istilah Azure Developer CLI
- Berjaya memasang dan mengkonfigurasi AZD pada platform pembangunan anda
- Menyebarkan aplikasi pertama anda menggunakan templat sedia ada
- Menavigasi antara muka baris perintah AZD dengan berkesan

#### Konsep Utama untuk Dikuasai
- Struktur projek AZD dan komponen (azure.yaml, infra/, src/)
- Aliran kerja penyebaran berasaskan templat
- Asas konfigurasi persekitaran
- Pengurusan kumpulan sumber dan langganan

#### Latihan Praktikal
1. **Pengesahan Pemasangan**: Pasang AZD dan sahkan dengan `azd version`
2. **Penyebaran Pertama**: Berjaya menyebarkan templat todo-nodejs-mongo
3. **Persediaan Persekitaran**: Konfigurasikan pembolehubah persekitaran pertama anda
4. **Penerokaan Sumber**: Navigasi sumber yang disebarkan di Portal Azure

#### Soalan Penilaian
- Apakah komponen utama projek AZD?
- Bagaimana anda memulakan projek baru daripada templat?
- Apakah perbezaan antara `azd up` dan `azd deploy`?
- Bagaimana anda menguruskan pelbagai persekitaran dengan AZD?

---

### Bab 2: Pembangunan Berasaskan AI (Minggu 2)
**Tempoh**: 1-2 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Mengintegrasikan perkhidmatan Azure AI Foundry dengan aliran kerja AZD
- Menyebar dan mengkonfigurasi aplikasi berkuasa AI
- Memahami corak pelaksanaan RAG (Retrieval-Augmented Generation)
- Mengurus penyebaran dan penskalaan model AI

#### Konsep Utama untuk Dikuasai
- Integrasi perkhidmatan Azure OpenAI dan pengurusan API
- Konfigurasi AI Search dan pengindeksan vektor
- Strategi penyebaran model dan perancangan kapasiti
- Pemantauan aplikasi AI dan pengoptimuman prestasi

#### Latihan Praktikal
1. **Penyebaran AI Chat**: Sebarkan templat azure-search-openai-demo
2. **Pelaksanaan RAG**: Konfigurasikan pengindeksan dan pengambilan dokumen
3. **Konfigurasi Model**: Sediakan pelbagai model AI untuk tujuan berbeza
4. **Pemantauan AI**: Laksanakan Application Insights untuk beban kerja AI

#### Soalan Penilaian
- Bagaimana anda mengkonfigurasi perkhidmatan Azure OpenAI dalam templat AZD?
- Apakah komponen utama seni bina RAG?
- Bagaimana anda menguruskan kapasiti dan penskalaan model AI?
- Apakah metrik pemantauan yang penting untuk aplikasi AI?

---

### Bab 3: Konfigurasi & Pengesahan (Minggu 3)
**Tempoh**: 45-60 minit | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Menguasai strategi konfigurasi dan pengurusan persekitaran
- Melaksanakan corak pengesahan yang selamat dan identiti terurus
- Mengatur sumber dengan konvensyen penamaan yang betul
- Mengkonfigurasi penyebaran pelbagai persekitaran (dev, staging, prod)

#### Konsep Utama untuk Dikuasai
- Hierarki persekitaran dan keutamaan konfigurasi
- Pengesahan identiti terurus dan perkhidmatan utama
- Integrasi Key Vault untuk pengurusan rahsia
- Pengurusan parameter khusus persekitaran

#### Latihan Praktikal
1. **Persediaan Pelbagai Persekitaran**: Konfigurasikan persekitaran dev, staging, dan prod
2. **Konfigurasi Keselamatan**: Laksanakan pengesahan identiti terurus
3. **Pengurusan Rahsia**: Integrasikan Azure Key Vault untuk data sensitif
4. **Pengurusan Parameter**: Cipta konfigurasi khusus persekitaran

#### Soalan Penilaian
- Bagaimana anda mengkonfigurasi persekitaran yang berbeza dengan AZD?
- Apakah kelebihan menggunakan identiti terurus berbanding perkhidmatan utama?
- Bagaimana anda menguruskan rahsia aplikasi dengan selamat?
- Apakah hierarki konfigurasi dalam AZD?

---

### Bab 4: Infrastruktur sebagai Kod & Penyebaran (Minggu 4-5)
**Tempoh**: 1-1.5 jam | **Kerumitan**: ⭐⭐⭐

#### Objektif Pembelajaran
- Mencipta dan menyesuaikan templat infrastruktur Bicep
- Melaksanakan corak penyebaran dan aliran kerja lanjutan
- Memahami strategi penyediaan sumber
- Mereka bentuk seni bina pelbagai perkhidmatan yang boleh diskalakan

#### Konsep Utama untuk Dikuasai
- Struktur templat Bicep dan amalan terbaik
- Kebergantungan sumber dan susunan penyebaran
- Fail parameter dan modulariti templat
- Cangkuk tersuai dan automasi penyebaran

#### Latihan Praktikal
1. **Penciptaan Templat Tersuai**: Bina templat aplikasi pelbagai perkhidmatan
2. **Penguasaan Bicep**: Cipta komponen infrastruktur modular dan boleh guna semula
3. **Automasi Penyebaran**: Laksanakan cangkuk sebelum/selepas penyebaran
4. **Reka Bentuk Seni Bina**: Sebarkan seni bina mikroservis yang kompleks

#### Soalan Penilaian
- Bagaimana anda mencipta templat Bicep tersuai untuk AZD?
- Apakah amalan terbaik untuk mengatur kod infrastruktur?
- Bagaimana anda mengendalikan kebergantungan sumber dalam templat?
- Apakah corak penyebaran yang menyokong kemas kini tanpa henti?

---

### Bab 5: Penyelesaian AI Pelbagai Ejen (Minggu 6-7)
**Tempoh**: 2-3 jam | **Kerumitan**: ⭐⭐⭐⭐

#### Objektif Pembelajaran
- Mereka bentuk dan melaksanakan seni bina AI pelbagai ejen
- Menyelaras komunikasi dan koordinasi ejen
- Menyebarkan penyelesaian AI bersedia untuk produksi dengan pemantauan
- Memahami pengkhususan ejen dan corak aliran kerja

#### Konsep Utama untuk Dikuasai
- Corak seni bina pelbagai ejen dan prinsip reka bentuk
- Protokol komunikasi ejen dan aliran data
- Strategi pengimbangan beban dan penskalaan untuk ejen AI
- Pemantauan produksi untuk sistem pelbagai ejen

#### Latihan Praktikal
1. **Penyebaran Penyelesaian Runcit**: Sebarkan senario runcit pelbagai ejen lengkap
2. **Penyesuaian Ejen**: Ubah suai tingkah laku ejen Pelanggan dan Inventori
3. **Penskalaan Seni Bina**: Laksanakan pengimbangan beban dan penskalaan automatik
4. **Pemantauan Produksi**: Sediakan pemantauan dan amaran yang komprehensif

#### Soalan Penilaian
- Bagaimana anda mereka bentuk corak komunikasi ejen yang berkesan?
- Apakah pertimbangan utama untuk penskalaan beban kerja ejen AI?
- Bagaimana anda memantau dan menyelesaikan masalah sistem AI pelbagai ejen?
- Apakah corak produksi yang memastikan kebolehpercayaan untuk ejen AI?

---

### Bab 6: Pengesahan & Perancangan Pra-Penyebaran (Minggu 8)
**Tempoh**: 1 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Melaksanakan perancangan kapasiti dan pengesahan sumber yang menyeluruh
- Memilih SKU Azure yang optimum untuk keberkesanan kos
- Melaksanakan pemeriksaan dan pengesahan automatik sebelum penyebaran
- Merancang penyebaran dengan strategi pengoptimuman kos

#### Konsep Utama untuk Dikuasai
- Kuota sumber Azure dan had kapasiti
- Kriteria pemilihan SKU dan pengoptimuman kos
- Skrip pengesahan automatik dan ujian
- Perancangan penyebaran dan penilaian risiko

#### Latihan Praktikal
1. **Analisis Kapasiti**: Analisis keperluan sumber untuk aplikasi anda
2. **Pengoptimuman SKU**: Bandingkan dan pilih peringkat perkhidmatan yang kos efektif
3. **Automasi Pengesahan**: Laksanakan skrip pemeriksaan sebelum penyebaran
4. **Perancangan Kos**: Cipta anggaran kos penyebaran dan bajet

#### Soalan Penilaian
- Bagaimana anda mengesahkan kapasiti Azure sebelum penyebaran?
- Apakah faktor yang mempengaruhi keputusan pemilihan SKU?
- Bagaimana anda mengautomasi pengesahan sebelum penyebaran?
- Apakah strategi yang membantu mengoptimumkan kos penyebaran?
2. Bagaimana anda mengesahkan ketersediaan sumber Azure sebelum pelaksanaan?  
3. Apakah komponen utama sistem pemeriksaan awal?  
4. Bagaimana anda menganggarkan dan mengawal kos pelaksanaan?  
5. Pemantauan apa yang penting untuk perancangan kapasiti?

### Modul 5: Penyelesaian Masalah dan Debugging (Minggu 6)

#### Objektif Pembelajaran
- Kuasai metodologi penyelesaian masalah secara sistematik  
- Membangunkan kepakaran dalam debugging isu pelaksanaan yang kompleks  
- Melaksanakan pemantauan dan amaran yang menyeluruh  
- Membina prosedur tindak balas dan pemulihan insiden  

#### Konsep Utama untuk Dikuasai
- Corak kegagalan pelaksanaan yang biasa  
- Teknik analisis dan korelasi log  
- Pemantauan prestasi dan pengoptimuman  
- Pengesanan dan tindak balas insiden keselamatan  
- Pemulihan bencana dan kesinambungan perniagaan  

#### Latihan Praktikal

**Latihan 5.1: Senario Penyelesaian Masalah**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Latihan 5.2: Pelaksanaan Pemantauan**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Latihan 5.3: Tindak Balas Insiden**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Soalan Penilaian Kendiri
1. Apakah pendekatan sistematik untuk menyelesaikan masalah pelaksanaan azd?  
2. Bagaimana anda mengaitkan log merentasi pelbagai perkhidmatan dan sumber?  
3. Apakah metrik pemantauan yang paling kritikal untuk pengesanan masalah awal?  
4. Bagaimana anda melaksanakan prosedur pemulihan bencana yang berkesan?  
5. Apakah komponen utama pelan tindak balas insiden?

### Modul 6: Topik Lanjutan dan Amalan Terbaik (Minggu 7-8)

#### Objektif Pembelajaran
- Melaksanakan corak pelaksanaan bertaraf perusahaan  
- Kuasai integrasi dan automasi CI/CD  
- Membangunkan templat tersuai dan menyumbang kepada komuniti  
- Memahami keperluan keselamatan dan pematuhan lanjutan  

#### Konsep Utama untuk Dikuasai
- Corak integrasi pipeline CI/CD  
- Pembangunan dan pengedaran templat tersuai  
- Tadbir urus dan pematuhan perusahaan  
- Konfigurasi rangkaian dan keselamatan lanjutan  
- Pengoptimuman prestasi dan pengurusan kos  

#### Latihan Praktikal

**Latihan 6.1: Integrasi CI/CD**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Latihan 6.2: Pembangunan Templat Tersuai**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Latihan 6.3: Pelaksanaan Perusahaan**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Soalan Penilaian Kendiri
1. Bagaimana anda mengintegrasikan azd ke dalam aliran kerja CI/CD sedia ada?  
2. Apakah pertimbangan utama untuk pembangunan templat tersuai?  
3. Bagaimana anda melaksanakan tadbir urus dan pematuhan dalam pelaksanaan azd?  
4. Apakah amalan terbaik untuk pelaksanaan berskala perusahaan?  
5. Bagaimana anda menyumbang secara berkesan kepada komuniti azd?

## Projek Praktikal

### Projek 1: Laman Web Portfolio Peribadi  
**Kerumitan**: Pemula  
**Tempoh**: 1-2 minggu  

Bina dan laksanakan laman web portfolio peribadi menggunakan:  
- Hosting laman web statik pada Azure Storage  
- Konfigurasi domain tersuai  
- Integrasi CDN untuk prestasi global  
- Pipeline pelaksanaan automatik  

**Hasil Kerja**:  
- Laman web berfungsi yang dilaksanakan di Azure  
- Templat azd tersuai untuk pelaksanaan portfolio  
- Dokumentasi proses pelaksanaan  
- Cadangan analisis dan pengoptimuman kos  

### Projek 2: Aplikasi Pengurusan Tugas  
**Kerumitan**: Pertengahan  
**Tempoh**: 2-3 minggu  

Bina aplikasi pengurusan tugas full-stack dengan:  
- Frontend React yang dilaksanakan ke App Service  
- Backend API Node.js dengan pengesahan  
- Pangkalan data PostgreSQL dengan migrasi  
- Pemantauan Application Insights  

**Hasil Kerja**:  
- Aplikasi lengkap dengan pengesahan pengguna  
- Skrip skema dan migrasi pangkalan data  
- Dashboard pemantauan dan peraturan amaran  
- Konfigurasi pelaksanaan multi-persekitaran  

### Projek 3: Platform E-dagang Mikroservis  
**Kerumitan**: Lanjutan  
**Tempoh**: 4-6 minggu  

Reka bentuk dan laksanakan platform e-dagang berasaskan mikroservis:  
- Pelbagai perkhidmatan API (katalog, pesanan, pembayaran, pengguna)  
- Integrasi antrian mesej dengan Service Bus  
- Cache Redis untuk pengoptimuman prestasi  
- Log dan pemantauan yang menyeluruh  

**Hasil Kerja**:  
- Seni bina mikroservis lengkap  
- Corak komunikasi antara perkhidmatan  
- Ujian prestasi dan pengoptimuman  
- Pelaksanaan keselamatan bersedia untuk pengeluaran  

## Penilaian dan Pensijilan

### Pemeriksaan Pengetahuan  

Lengkapkan penilaian ini selepas setiap modul:  

**Penilaian Modul 1**: Konsep asas dan pemasangan  
- Soalan pilihan berganda tentang konsep teras  
- Tugas pemasangan dan konfigurasi praktikal  
- Latihan pelaksanaan mudah  

**Penilaian Modul 2**: Konfigurasi dan persekitaran  
- Senario pengurusan persekitaran  
- Latihan penyelesaian masalah konfigurasi  
- Pelaksanaan konfigurasi keselamatan  

**Penilaian Modul 3**: Pelaksanaan dan penyediaan  
- Cabaran reka bentuk infrastruktur  
- Senario pelaksanaan multi-perkhidmatan  
- Latihan pengoptimuman prestasi  

**Penilaian Modul 4**: Pengesahan pra-pelaksanaan  
- Kajian kes perancangan kapasiti  
- Senario pengoptimuman kos  
- Pelaksanaan pipeline pengesahan  

**Penilaian Modul 5**: Penyelesaian masalah dan debugging  
- Latihan diagnosis masalah  
- Tugas pelaksanaan pemantauan  
- Simulasi tindak balas insiden  

**Penilaian Modul 6**: Topik lanjutan  
- Reka bentuk pipeline CI/CD  
- Pembangunan templat tersuai  
- Senario seni bina perusahaan  

### Projek Akhir  

Reka bentuk dan laksanakan penyelesaian lengkap yang menunjukkan penguasaan semua konsep:  

**Keperluan**:  
- Seni bina aplikasi multi-tier  
- Pelbagai persekitaran pelaksanaan  
- Pemantauan dan amaran yang menyeluruh  
- Pelaksanaan keselamatan dan pematuhan  
- Pengoptimuman kos dan penalaan prestasi  
- Dokumentasi lengkap dan runbook  

**Kriteria Penilaian**:  
- Kualiti pelaksanaan teknikal  
- Kelengkapan dokumentasi  
- Pematuhan keselamatan dan amalan terbaik  
- Pengoptimuman prestasi dan kos  
- Keberkesanan penyelesaian masalah dan pemantauan  

## Sumber Pembelajaran dan Rujukan

### Dokumentasi Rasmi  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Sumber Komuniti  
- [Galeri Templat AZD](https://azure.github.io/awesome-azd/)  
- [Organisasi GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Repositori GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Persekitaran Praktikal  
- [Akaun Percuma Azure](https://azure.microsoft.com/free/)  
- [Tier Percuma Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Alat Tambahan  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Pakej Sambungan Alat Azure](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Cadangan Jadual Pembelajaran  

### Pembelajaran Sepenuh Masa (8 minggu)  
- **Minggu 1-2**: Modul 1-2 (Memulakan, Konfigurasi)  
- **Minggu 3-4**: Modul 3-4 (Pelaksanaan, Pra-pelaksanaan)  
- **Minggu 5-6**: Modul 5-6 (Penyelesaian Masalah, Topik Lanjutan)  
- **Minggu 7-8**: Projek Praktikal dan Penilaian Akhir  

### Pembelajaran Separuh Masa (16 minggu)  
- **Minggu 1-4**: Modul 1 (Memulakan)  
- **Minggu 5-7**: Modul 2 (Konfigurasi dan Persekitaran)  
- **Minggu 8-10**: Modul 3 (Pelaksanaan dan Penyediaan)  
- **Minggu 11-12**: Modul 4 (Pengesahan Pra-pelaksanaan)  
- **Minggu 13-14**: Modul 5 (Penyelesaian Masalah dan Debugging)  
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)  

---

## Penjejakan Kemajuan dan Rangka Kerja Penilaian  

### Senarai Semak Penyelesaian Bab  

Jejaki kemajuan anda melalui setiap bab dengan hasil yang boleh diukur:  

#### 📚 Bab 1: Asas & Permulaan Pantas  
- [ ] **Pemasangan Lengkap**: AZD dipasang dan disahkan pada platform anda  
- [ ] **Pelaksanaan Pertama**: Berjaya melaksanakan templat todo-nodejs-mongo  
- [ ] **Persediaan Persekitaran**: Konfigurasi pembolehubah persekitaran pertama  
- [ ] **Navigasi Sumber**: Terokai sumber yang dilaksanakan di Azure Portal  
- [ ] **Penguasaan Perintah**: Selesa dengan perintah asas AZD  

#### 🤖 Bab 2: Pembangunan AI-Pertama  
- [ ] **Pelaksanaan Templat AI**: Berjaya melaksanakan azure-search-openai-demo  
- [ ] **Pelaksanaan RAG**: Konfigurasi pengindeksan dan pengambilan dokumen  
- [ ] **Konfigurasi Model**: Menyediakan pelbagai model AI dengan tujuan berbeza  
- [ ] **Pemantauan AI**: Melaksanakan Application Insights untuk beban kerja AI  
- [ ] **Pengoptimuman Prestasi**: Menala prestasi aplikasi AI  

#### ⚙️ Bab 3: Konfigurasi & Pengesahan  
- [ ] **Persediaan Multi-Persekitaran**: Konfigurasi persekitaran dev, staging, dan prod  
- [ ] **Pelaksanaan Keselamatan**: Menyediakan pengesahan identiti terurus  
- [ ] **Pengurusan Rahsia**: Integrasi Azure Key Vault untuk data sensitif  
- [ ] **Pengurusan Parameter**: Mencipta konfigurasi khusus persekitaran  
- [ ] **Penguasaan Pengesahan**: Melaksanakan corak akses yang selamat  

#### 🏗️ Bab 4: Infrastruktur sebagai Kod & Pelaksanaan  
- [ ] **Penciptaan Templat Tersuai**: Membina templat aplikasi multi-perkhidmatan  
- [ ] **Penguasaan Bicep**: Mencipta komponen infrastruktur modular dan boleh guna semula  
- [ ] **Automasi Pelaksanaan**: Melaksanakan hook pra/pasca pelaksanaan  
- [ ] **Reka Bentuk Seni Bina**: Melaksanakan seni bina mikroservis yang kompleks  
- [ ] **Pengoptimuman Templat**: Mengoptimumkan templat untuk prestasi dan kos  

#### 🎯 Bab 5: Penyelesaian AI Multi-Ejen  
- [ ] **Pelaksanaan Penyelesaian Runcit**: Melaksanakan senario runcit multi-ejen lengkap  
- [ ] **Penyesuaian Ejen**: Mengubah suai tingkah laku ejen Pelanggan dan Inventori  
- [ ] **Penskalaan Seni Bina**: Melaksanakan load balancing dan auto-scaling  
- [ ] **Pemantauan Pengeluaran**: Menyediakan pemantauan dan amaran yang menyeluruh  
- [ ] **Penalaan Prestasi**: Mengoptimumkan prestasi sistem multi-ejen  

#### 🔍 Bab 6: Pengesahan Pra-Pelaksanaan & Perancangan  
- [ ] **Analisis Kapasiti**: Menganalisis keperluan sumber untuk aplikasi  
- [ ] **Pengoptimuman SKU**: Memilih tier perkhidmatan yang kos efektif  
- [ ] **Automasi Pengesahan**: Melaksanakan skrip pemeriksaan pra-pelaksanaan  
- [ ] **Perancangan Kos**: Membuat anggaran kos pelaksanaan dan bajet  
- [ ] **Penilaian Risiko**: Mengenal pasti dan mengurangkan risiko pelaksanaan  

#### 🚨 Bab 7: Penyelesaian Masalah & Debugging  
- [ ] **Kemahiran Diagnostik**: Berjaya debug pelaksanaan yang sengaja rosak  
- [ ] **Analisis Log**: Menggunakan Azure Monitor dan Application Insights dengan berkesan  
- [ ] **Penalaan Prestasi**: Mengoptimumkan aplikasi yang berprestasi perlahan  
- [ ] **Prosedur Pemulihan**: Melaksanakan sandaran dan pemulihan bencana  
- [ ] **Persediaan Pemantauan**: Mencipta pemantauan dan amaran proaktif  

#### 🏢 Bab 8: Corak Pengeluaran & Perusahaan  
- [ ] **Keselamatan Perusahaan**: Melaksanakan corak keselamatan yang menyeluruh  
- [ ] **Rangka Kerja Tadbir Urus**: Menyediakan Azure Policy dan pengurusan sumber  
- [ ] **Pemantauan Lanjutan**: Mencipta dashboard dan amaran automatik  
- [ ] **Integrasi CI/CD**: Membina pipeline pelaksanaan automatik  
- [ ] **Pelaksanaan Pematuhan**: Memenuhi keperluan pematuhan perusahaan  

### Garis Masa Pembelajaran dan Pencapaian  

#### Minggu 1-2: Pembinaan Asas  
- **Pencapaian**: Melaksanakan aplikasi AI pertama menggunakan AZD  
- **Pengesahan**: Aplikasi berfungsi boleh diakses melalui URL awam  
- **Kemahiran**: Aliran kerja asas AZD dan integrasi perkhidmatan AI  

#### Minggu 3-4: Penguasaan Konfigurasi  
- **Pencapaian**: Pelaksanaan multi-persekitaran dengan pengesahan yang selamat  
- **Pengesahan**: Aplikasi yang sama dilaksanakan ke dev/staging/prod  
- **Kemahiran**: Pengurusan persekitaran dan pelaksanaan keselamatan  

#### Minggu 5-6: Kepakaran Infrastruktur  
- **Pencapaian**: Templat tersuai untuk aplikasi multi-perkhidmatan yang kompleks  
- **Pengesahan**: Templat boleh guna semula dilaksanakan oleh ahli pasukan lain  
- **Kemahiran**: Penguasaan Bicep dan automasi infrastruktur  

#### Minggu 7-8: Pelaksanaan AI Lanjutan  
- **Pencapaian**: Penyelesaian AI multi-ejen bersedia untuk pengeluaran  
- **Pengesahan**: Sistem mengendalikan beban dunia sebenar dengan pemantauan  
- **Kemahiran**: Orkestrasi multi-ejen dan pengoptimuman prestasi  

#### Minggu 9-10: Kesediaan Pengeluaran  
- **Pencapaian**: Pelaksanaan bertaraf perusahaan dengan pematuhan penuh  
- **Pengesahan**: Lulus semakan keselamatan dan audit pengoptimuman kos  
- **Kemahiran**: Tadbir urus, pemantauan, dan integrasi CI/CD  

### Penilaian dan Pensijilan  

#### Kaedah Pengesahan Pengetahuan  
1. **Pelaksanaan Praktikal**: Aplikasi berfungsi untuk setiap bab  
2. **Semakan Kod**: Penilaian kualiti templat dan konfigurasi  
3. **Penyelesaian Masalah**: Senario penyelesaian masalah dan penyelesaian  
4. **Pengajaran Rakan Sebaya**: Terangkan konsep kepada pelajar lain  
5. **Sumbangan Komuniti**: Kongsi templat atau penambahbaikan  

#### Hasil Pembangunan Profesional  
- **Projek Portfolio**: 8 pelaksanaan bersedia untuk pengeluaran  
- **Kemahiran Teknikal**: Kepakaran pelaksanaan AZD dan AI bertaraf industri  
- **Keupayaan Penyelesaian Masalah**: Penyelesaian masalah dan pengoptimuman secara bebas  
- **Pengiktirafan Komuniti**: Penyertaan aktif dalam komuniti pembangun Azure  
- **Kemajuan Kerjaya**: Kemahiran yang boleh digunakan secara langsung untuk peranan awan dan AI  

#### Metrik Kejayaan  
- **Kadar Kejayaan Pelaksanaan**: >95% pelaksanaan berjaya  
- **Masa Penyelesaian Masalah**: <30 minit untuk isu biasa  
- **Pengoptimuman Prestasi**: Penambahbaikan yang boleh ditunjukkan dalam kos dan prestasi  
- **Pematuhan Keselamatan**: Semua pelaksanaan memenuhi piawaian keselamatan perusahaan  
- **Pemindahan Pengetahuan**: Keupayaan untuk membimbing pembangun lain  

### Pembelajaran Berterusan dan Penglibatan Komuniti  

#### Kekal Terkini  
- **Kemas Kini Azure**: Ikuti nota pelepasan Azure Developer CLI  
- **Acara Komuniti**: Sertai acara pembangun Azure dan AI  
- **Dokumentasi**: Menyumbang kepada dokumentasi komuniti dan contoh-contoh
- **Maklum Balas**: Berikan maklum balas mengenai kandungan kursus dan perkhidmatan Azure

#### Pembangunan Kerjaya
- **Rangkaian Profesional**: Berhubung dengan pakar Azure dan AI
- **Peluang Berucap**: Kongsi pembelajaran di persidangan atau pertemuan
- **Sumbangan Sumber Terbuka**: Menyumbang kepada templat dan alat AZD
- **Mentor**: Membimbing pembangun lain dalam perjalanan pembelajaran AZD mereka

---

**Navigasi Bab:**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Belajar**: [Bab 1: Asas & Permulaan Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Penjejakan Kemajuan**: Jejak kemajuan anda melalui sistem pembelajaran 8 bab yang komprehensif
- **🤝 Komuniti**: [Azure Discord](https://discord.gg/microsoft-azure) untuk sokongan dan perbincangan

**Penjejakan Kemajuan Pembelajaran**: Gunakan panduan berstruktur ini untuk menguasai Azure Developer CLI melalui pembelajaran progresif, praktikal dengan hasil yang boleh diukur dan manfaat pembangunan profesional.

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.