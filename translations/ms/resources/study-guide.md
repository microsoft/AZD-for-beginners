# Panduan Pembelajaran - Objektif Pembelajaran Komprehensif

**Navigasi Laluan Pembelajaran**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Belajar**: [Bab 1: Asas & Permulaan Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Penjejakan Kemajuan**: [Penyelesaian Kursus](../README.md#-course-completion--certification)

## Pengenalan

Panduan pembelajaran komprehensif ini menyediakan objektif pembelajaran yang terstruktur, konsep utama, latihan praktikal, dan bahan penilaian untuk membantu anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk menjejaki kemajuan anda dan memastikan anda telah meliputi semua topik penting.

## Matlamat Pembelajaran

Dengan melengkapkan panduan pembelajaran ini, anda akan:
- Menguasai semua konsep asas dan lanjutan Azure Developer CLI
- Membangunkan kemahiran praktikal dalam menyebarkan dan mengurus aplikasi Azure
- Meningkatkan keyakinan dalam menyelesaikan masalah dan mengoptimumkan penyebaran
- Memahami amalan penyebaran bersedia untuk pengeluaran dan pertimbangan keselamatan

## Hasil Pembelajaran

Selepas melengkapkan semua bahagian panduan pembelajaran ini, anda akan dapat:
- Merancang, menyebarkan, dan mengurus seni bina aplikasi lengkap menggunakan azd
- Melaksanakan strategi pemantauan, keselamatan, dan pengoptimuman kos yang menyeluruh
- Menyelesaikan masalah penyebaran kompleks secara bebas
- Mencipta templat tersuai dan menyumbang kepada komuniti azd

## Struktur Pembelajaran 8 Bab

### Bab 1: Asas & Permulaan Pantas (Minggu 1)
**Tempoh**: 30-45 minit | **Kerumitan**: ⭐

#### Objektif Pembelajaran
- Memahami konsep teras dan istilah Azure Developer CLI
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
3. **Persediaan Persekitaran**: Konfigurasi pembolehubah persekitaran pertama anda
4. **Eksplorasi Sumber**: Navigasi sumber yang disebarkan di Azure Portal

#### Soalan Penilaian
- Apakah komponen teras projek AZD?
- Bagaimana anda memulakan projek baru dari templat?
- Apakah perbezaan antara `azd up` dan `azd deploy`?
- Bagaimana anda menguruskan pelbagai persekitaran dengan AZD?

---

### Bab 2: Pembangunan Berasaskan AI (Minggu 2)
**Tempoh**: 1-2 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Mengintegrasikan perkhidmatan Microsoft Foundry dengan aliran kerja AZD
- Menyebarkan dan mengkonfigurasi aplikasi berkuasa AI
- Memahami corak pelaksanaan RAG (Retrieval-Augmented Generation)
- Mengurus penyebaran model AI dan penskalaan

#### Konsep Utama untuk Dikuasai
- Integrasi perkhidmatan Azure OpenAI dan pengurusan API
- Konfigurasi Carian AI dan pengindeksan vektor
- Strategi penyebaran model dan perancangan kapasiti
- Pemantauan aplikasi AI dan pengoptimuman prestasi

#### Latihan Praktikal
1. **Penyebaran AI Chat**: Sebarkan templat azure-search-openai-demo
2. **Pelaksanaan RAG**: Konfigurasi pengindeksan dokumen dan pengambilan
3. **Konfigurasi Model**: Sediakan pelbagai model AI dengan tujuan berbeza
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
- Identiti terurus dan pengesahan prinsip perkhidmatan
- Integrasi Key Vault untuk pengurusan rahsia
- Pengurusan parameter khusus persekitaran

#### Latihan Praktikal
1. **Persediaan Pelbagai Persekitaran**: Konfigurasi persekitaran dev, staging, dan prod
2. **Konfigurasi Keselamatan**: Laksanakan pengesahan identiti terurus
3. **Pengurusan Rahsia**: Integrasi Azure Key Vault untuk data sensitif
4. **Pengurusan Parameter**: Cipta konfigurasi khusus persekitaran

#### Soalan Penilaian
- Bagaimana anda mengkonfigurasi persekitaran yang berbeza dengan AZD?
- Apakah manfaat menggunakan identiti terurus berbanding prinsip perkhidmatan?
- Bagaimana anda menguruskan rahsia aplikasi dengan selamat?
- Apakah hierarki konfigurasi dalam AZD?

---

### Bab 4: Infrastruktur sebagai Kod & Penyebaran (Minggu 4-5)
**Tempoh**: 1-1.5 jam | **Kerumitan**: ⭐⭐⭐

#### Objektif Pembelajaran
- Cipta dan sesuaikan templat infrastruktur Bicep
- Laksanakan corak penyebaran dan aliran kerja lanjutan
- Memahami strategi penyediaan sumber
- Reka seni bina pelbagai perkhidmatan yang boleh diskalakan

- Sebarkan aplikasi berasaskan kontena menggunakan Azure Container Apps dan AZD

#### Konsep Utama untuk Dikuasai
- Struktur templat Bicep dan amalan terbaik
- Kebergantungan sumber dan susunan penyebaran
- Fail parameter dan modulariti templat
- Cangkuk tersuai dan automasi penyebaran
- Corak penyebaran aplikasi kontena (permulaan pantas, pengeluaran, mikroservis)

#### Latihan Praktikal
1. **Penciptaan Templat Tersuai**: Bina templat aplikasi pelbagai perkhidmatan
2. **Penguasaan Bicep**: Cipta komponen infrastruktur modular dan boleh digunakan semula
3. **Automasi Penyebaran**: Laksanakan cangkuk pra/pasca penyebaran
4. **Reka Bentuk Seni Bina**: Sebarkan seni bina mikroservis yang kompleks
5. **Penyebaran Aplikasi Kontena**: Sebarkan contoh [Simple Flask API](../../../examples/container-app/simple-flask-api) dan [Microservices Architecture](../../../examples/container-app/microservices) menggunakan AZD

#### Soalan Penilaian
- Bagaimana anda mencipta templat Bicep tersuai untuk AZD?
- Apakah amalan terbaik untuk mengatur kod infrastruktur?
- Bagaimana anda mengendalikan kebergantungan sumber dalam templat?
- Apakah corak penyebaran yang menyokong kemas kini tanpa henti?

---

### Bab 5: Penyelesaian AI Pelbagai Ejen (Minggu 6-7)
**Tempoh**: 2-3 jam | **Kerumitan**: ⭐⭐⭐⭐

#### Objektif Pembelajaran
- Reka dan laksanakan seni bina AI pelbagai ejen
- Mengatur koordinasi dan komunikasi ejen
- Sebarkan penyelesaian AI bersedia untuk pengeluaran dengan pemantauan
- Memahami pengkhususan ejen dan corak aliran kerja
- Integrasi mikroservis berasaskan kontena sebagai sebahagian daripada penyelesaian pelbagai ejen

#### Konsep Utama untuk Dikuasai
- Corak seni bina pelbagai ejen dan prinsip reka bentuk
- Protokol komunikasi ejen dan aliran data
- Strategi pengimbangan beban dan penskalaan untuk ejen AI
- Pemantauan pengeluaran untuk sistem pelbagai ejen
- Komunikasi antara perkhidmatan dalam persekitaran berasaskan kontena

#### Latihan Praktikal
1. **Penyebaran Penyelesaian Runcit**: Sebarkan senario runcit pelbagai ejen lengkap
2. **Penyesuaian Ejen**: Ubah suai tingkah laku ejen Pelanggan dan Inventori
3. **Penskalaan Seni Bina**: Laksanakan pengimbangan beban dan penskalaan automatik
4. **Pemantauan Pengeluaran**: Sediakan pemantauan dan amaran yang komprehensif
5. **Integrasi Mikroservis**: Kembangkan contoh [Microservices Architecture](../../../examples/container-app/microservices) untuk menyokong aliran kerja berasaskan ejen

#### Soalan Penilaian
- Bagaimana anda merancang corak komunikasi ejen pelbagai yang berkesan?
- Apakah pertimbangan utama untuk penskalaan beban kerja ejen AI?
- Bagaimana anda memantau dan menyelesaikan masalah sistem AI pelbagai ejen?
- Apakah corak pengeluaran yang memastikan kebolehpercayaan untuk ejen AI?

---

### Bab 6: Pengesahan & Perancangan Pra-Penyebaran (Minggu 8)
**Tempoh**: 1 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Lakukan perancangan kapasiti dan pengesahan sumber yang komprehensif
- Pilih SKU Azure yang optimum untuk keberkesanan kos
- Laksanakan pemeriksaan pra-penerbangan dan pengesahan automatik
- Rancang penyebaran dengan strategi pengoptimuman kos

#### Konsep Utama untuk Dikuasai
- Kuota sumber Azure dan had kapasiti
- Kriteria pemilihan SKU dan pengoptimuman kos
- Skrip pengesahan automatik dan ujian
- Perancangan penyebaran dan penilaian risiko

#### Latihan Praktikal
1. **Analisis Kapasiti**: Analisis keperluan sumber untuk aplikasi anda
2. **Pengoptimuman SKU**: Bandingkan dan pilih peringkat perkhidmatan yang berkesan kos
3. **Automasi Pengesahan**: Laksanakan skrip pemeriksaan pra-penyebaran
4. **Perancangan Kos**: Cipta anggaran kos penyebaran dan bajet

#### Soalan Penilaian
- Bagaimana anda mengesahkan kapasiti Azure sebelum penyebaran?
- Apakah faktor yang mempengaruhi keputusan pemilihan SKU?
- Bagaimana anda mengautomasi pengesahan pra-penyebaran?
- Apakah strategi yang membantu mengoptimumkan kos penyebaran?

---

### Bab 7: Penyelesaian Masalah & Debugging (Minggu 9)
**Tempoh**: 1-1.5 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Membangunkan pendekatan debugging yang sistematik untuk penyebaran AZD
- Menyelesaikan isu penyebaran dan konfigurasi biasa
- Debug masalah khusus AI dan isu prestasi
- Laksanakan pemantauan dan amaran untuk pengesanan isu secara proaktif

#### Konsep Utama untuk Dikuasai
- Teknik diagnostik dan strategi log
- Corak kegagalan biasa dan penyelesaiannya
- Pemantauan prestasi dan pengoptimuman
- Prosedur tindak balas insiden dan pemulihan

#### Latihan Praktikal
1. **Kemahiran Diagnostik**: Berlatih dengan penyebaran yang sengaja rosak
2. **Analisis Log**: Gunakan Azure Monitor dan Application Insights dengan berkesan
3. **Penalaan Prestasi**: Optimumkan aplikasi yang berprestasi perlahan
4. **Prosedur Pemulihan**: Laksanakan sandaran dan pemulihan bencana

#### Soalan Penilaian
- Apakah kegagalan penyebaran AZD yang paling biasa?
- Bagaimana anda debug isu pengesahan dan kebenaran?
- Apakah strategi pemantauan yang membantu mencegah isu pengeluaran?
- Bagaimana anda mengoptimumkan prestasi aplikasi di Azure?

---

### Bab 8: Corak Pengeluaran & Perusahaan (Minggu 10-11)
**Tempoh**: 2-3 jam | **Kerumitan**: ⭐⭐⭐⭐

#### Objektif Pembelajaran
- Laksanakan strategi penyebaran gred perusahaan
- Reka corak keselamatan dan rangka kerja pematuhan
- Menubuhkan pemantauan, tadbir urus, dan pengurusan kos
- Cipta saluran CI/CD yang boleh diskalakan dengan integrasi AZD
- Terapkan amalan terbaik untuk penyebaran aplikasi kontena pengeluaran (keselamatan, pemantauan, kos, CI/CD)

#### Konsep Utama untuk Dikuasai
- Keperluan keselamatan dan pematuhan perusahaan
- Rangka kerja tadbir urus dan pelaksanaan dasar
- Pemantauan lanjutan dan pengurusan kos
- Integrasi CI/CD dan saluran penyebaran automatik
- Strategi penyebaran biru-hijau dan canary untuk beban kerja berasaskan kontena

#### Latihan Praktikal
1. **Keselamatan Perusahaan**: Laksanakan corak keselamatan yang komprehensif
2. **Rangka Kerja Tadbir Urus**: Sediakan Azure Policy dan pengurusan sumber
3. **Pemantauan Lanjutan**: Cipta papan pemuka dan amaran automatik
4. **Integrasi CI/CD**: Bina saluran penyebaran automatik
5. **Aplikasi Kontena Pengeluaran**: Terapkan keselamatan, pemantauan, dan pengoptimuman kos kepada contoh [Microservices Architecture](../../../examples/container-app/microservices)

#### Soalan Penilaian
- Bagaimana anda melaksanakan keselamatan perusahaan dalam penyebaran AZD?
- Apakah corak tadbir urus yang memastikan pematuhan dan kawalan kos?
- Bagaimana anda merancang pemantauan yang boleh diskalakan untuk sistem pengeluaran?
- Apakah corak CI/CD yang paling sesuai dengan aliran kerja AZD?

#### Objektif Pembelajaran
- Memahami asas dan konsep teras Azure Developer CLI
- Berjaya memasang dan mengkonfigurasi azd pada persekitaran pembangunan anda
- Lengkapkan penyebaran pertama anda menggunakan templat sedia ada
- Navigasi struktur projek azd dan memahami komponen utama

#### Konsep Utama untuk Dikuasai
- Templat, persekitaran, dan perkhidmatan
- Struktur konfigurasi azure.yaml
- Perintah asas azd (init, up, down, deploy)
- Prinsip Infrastruktur sebagai Kod
- Pengesahan dan kebenaran Azure

#### Latihan Praktikal

**Latihan 1.1: Pemasangan dan Persediaan**
```bash
# Selesaikan tugasan ini:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Latihan 1.2: Penyebaran Pertama**
```bash
# Sebarkan aplikasi web yang mudah:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Latihan 1.3: Analisis Struktur Projek**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Soalan Penilaian Kendiri
1. Apakah tiga konsep teras seni bina azd?
2. Apakah tujuan fail azure.yaml?
3. Bagaimana persekitaran membantu menguruskan sasaran penyebaran yang berbeza?
4. Apakah kaedah pengesahan yang boleh digunakan dengan azd?
5. Apa yang berlaku apabila anda menjalankan `azd up` buat kali pertama?

---

## Penjejakan Kemajuan dan Rangka Kerja Penilaian
```bash
# Cipta dan konfigurasi pelbagai persekitaran:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Latihan 2.2: Konfigurasi Lanjutan**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Latihan 2.3: Konfigurasi Keselamatan**
```bash
# Laksanakan amalan terbaik keselamatan:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Soalan Penilaian Kendiri
1. Bagaimana azd mengendalikan keutamaan pembolehubah persekitaran?
2. Apakah cangkuk penyebaran dan bila anda harus menggunakannya?
3. Bagaimana anda mengkonfigurasi SKU yang berbeza untuk persekitaran yang berbeza?
4. Apakah implikasi keselamatan kaedah pengesahan yang berbeza?
5. Bagaimana anda menguruskan rahsia dan data konfigurasi sensitif?

### Modul 3: Penyebaran dan Penyediaan (Minggu 4)

#### Objektif Pembelajaran
- Kuasai aliran kerja penyebaran dan amalan terbaik
- Memahami Infrastruktur sebagai Kod dengan templat Bicep
- Laksanakan seni bina pelbagai perkhidmatan yang kompleks
- Optimumkan prestasi dan kebolehpercayaan penyebaran

#### Konsep Utama untuk Dikuasai
- Struktur templat Bicep dan modul
- Kebergantungan sumber dan susunan
- Strategi penyebaran (biru-hijau, kemas kini bergilir)
- Penyebaran pelbagai wilayah
- Migrasi pangkalan data dan pengurusan data

#### Latihan Praktikal

**Latihan 3.1: Infrastruktur Tersuai**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Latihan 3.2: Aplikasi Pelbagai Perkhidmatan**
```bash
# Terapkan seni bina mikroservis:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Latihan 3.3: Integrasi Pangkalan Data**
```bash
# Laksanakan corak pengedaran pangkalan data:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Soalan Penilaian Kendiri
1. Apakah kelebihan
5. Apakah pertimbangan untuk pelaksanaan pelbagai rantau?

### Modul 4: Pengesahan Pra-Pelaksanaan (Minggu 5)

#### Objektif Pembelajaran
- Melaksanakan pemeriksaan pra-pelaksanaan yang menyeluruh
- Menguasai perancangan kapasiti dan pengesahan sumber
- Memahami pemilihan SKU dan pengoptimuman kos
- Membina saluran pengesahan automatik

#### Konsep Utama untuk Dikuasai
- Kuota dan had sumber Azure
- Kriteria pemilihan SKU dan implikasi kos
- Skrip dan alat pengesahan automatik
- Metodologi perancangan kapasiti
- Ujian prestasi dan pengoptimuman

#### Latihan Praktikal

**Latihan 4.1: Perancangan Kapasiti**
```bash
# Laksanakan pengesahan kapasiti:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Latihan 4.2: Pengesahan Pra-Pelaksanaan**
```powershell
# Bina saluran pengesahan yang komprehensif:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Latihan 4.3: Pengoptimuman SKU**
```bash
# Optimumkan konfigurasi perkhidmatan:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Soalan Penilaian Kendiri
1. Apakah faktor yang harus mempengaruhi keputusan pemilihan SKU?
2. Bagaimana anda mengesahkan ketersediaan sumber Azure sebelum pelaksanaan?
3. Apakah komponen utama sistem pemeriksaan pra-pelaksanaan?
4. Bagaimana anda menganggarkan dan mengawal kos pelaksanaan?
5. Pemantauan apa yang penting untuk perancangan kapasiti?

### Modul 5: Penyelesaian Masalah dan Debugging (Minggu 6)

#### Objektif Pembelajaran
- Menguasai metodologi penyelesaian masalah secara sistematik
- Membangunkan kepakaran dalam debugging isu pelaksanaan yang kompleks
- Melaksanakan pemantauan dan amaran yang menyeluruh
- Membina prosedur tindak balas dan pemulihan insiden

#### Konsep Utama untuk Dikuasai
- Corak kegagalan pelaksanaan yang biasa
- Teknik analisis dan korelasi log
- Pemantauan prestasi dan pengoptimuman
- Pengesanan insiden keselamatan dan tindak balas
- Pemulihan bencana dan kesinambungan perniagaan

#### Latihan Praktikal

**Latihan 5.1: Senario Penyelesaian Masalah**
```bash
# Berlatih menyelesaikan isu-isu biasa:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Latihan 5.2: Pelaksanaan Pemantauan**
```bash
# Tetapkan pemantauan yang komprehensif:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Latihan 5.3: Tindak Balas Insiden**
```bash
# Bina prosedur tindak balas insiden:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Soalan Penilaian Kendiri
1. Apakah pendekatan sistematik untuk menyelesaikan masalah pelaksanaan azd?
2. Bagaimana anda mengaitkan log di antara pelbagai perkhidmatan dan sumber?
3. Apakah metrik pemantauan yang paling kritikal untuk pengesanan masalah awal?
4. Bagaimana anda melaksanakan prosedur pemulihan bencana yang berkesan?
5. Apakah komponen utama pelan tindak balas insiden?

### Modul 6: Topik Lanjutan dan Amalan Terbaik (Minggu 7-8)

#### Objektif Pembelajaran
- Melaksanakan corak pelaksanaan bertaraf perusahaan
- Menguasai integrasi dan automasi CI/CD
- Membangunkan templat tersuai dan menyumbang kepada komuniti
- Memahami keperluan keselamatan dan pematuhan lanjutan

#### Konsep Utama untuk Dikuasai
- Corak integrasi saluran CI/CD
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
# Cipta dan terbitkan templat tersuai:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Latihan 6.3: Pelaksanaan Perusahaan**
```bash
# Laksanakan ciri-ciri bertaraf perusahaan:
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
5. Bagaimana anda menyumbang dengan berkesan kepada komuniti azd?

## Projek Praktikal

### Projek 1: Laman Web Portfolio Peribadi
**Kompleksiti**: Pemula  
**Tempoh**: 1-2 minggu

Bina dan laksanakan laman web portfolio peribadi menggunakan:
- Hosting laman web statik pada Azure Storage
- Konfigurasi domain tersuai
- Integrasi CDN untuk prestasi global
- Saluran pelaksanaan automatik

**Hasil**:
- Laman web berfungsi yang dilaksanakan di Azure
- Templat azd tersuai untuk pelaksanaan portfolio
- Dokumentasi proses pelaksanaan
- Cadangan analisis dan pengoptimuman kos

### Projek 2: Aplikasi Pengurusan Tugas
**Kompleksiti**: Pertengahan  
**Tempoh**: 2-3 minggu

Cipta aplikasi pengurusan tugas full-stack dengan:
- Frontend React dilaksanakan ke App Service
- Backend API Node.js dengan pengesahan
- Pangkalan data PostgreSQL dengan migrasi
- Pemantauan Application Insights

**Hasil**:
- Aplikasi lengkap dengan pengesahan pengguna
- Skema pangkalan data dan skrip migrasi
- Papan pemantauan dan peraturan amaran
- Konfigurasi pelaksanaan pelbagai persekitaran

### Projek 3: Platform E-dagang Mikroservis
**Kompleksiti**: Lanjutan  
**Tempoh**: 4-6 minggu

Reka bentuk dan laksanakan platform e-dagang berasaskan mikroservis:
- Pelbagai perkhidmatan API (katalog, pesanan, pembayaran, pengguna)
- Integrasi antrian mesej dengan Service Bus
- Cache Redis untuk pengoptimuman prestasi
- Log dan pemantauan yang menyeluruh

**Contoh Rujukan**: Lihat [Mikroservis Arkitektur](../../../examples/container-app/microservices) untuk templat sedia pengeluaran dan panduan pelaksanaan

**Hasil**:
- Arkitektur mikroservis lengkap
- Corak komunikasi antara perkhidmatan
- Ujian prestasi dan pengoptimuman
- Pelaksanaan keselamatan sedia pengeluaran

## Penilaian dan Pensijilan

### Pemeriksaan Pengetahuan

Lengkapkan penilaian ini selepas setiap modul:

**Penilaian Modul 1**: Konsep asas dan pemasangan
- Soalan pilihan berganda tentang konsep utama
- Tugas pemasangan dan konfigurasi praktikal
- Latihan pelaksanaan mudah

**Penilaian Modul 2**: Konfigurasi dan persekitaran
- Senario pengurusan persekitaran
- Latihan penyelesaian masalah konfigurasi
- Pelaksanaan konfigurasi keselamatan

**Penilaian Modul 3**: Pelaksanaan dan penyediaan
- Cabaran reka bentuk infrastruktur
- Senario pelaksanaan pelbagai perkhidmatan
- Latihan pengoptimuman prestasi

**Penilaian Modul 4**: Pengesahan pra-pelaksanaan
- Kajian kes perancangan kapasiti
- Senario pengoptimuman kos
- Pelaksanaan saluran pengesahan

**Penilaian Modul 5**: Penyelesaian masalah dan debugging
- Latihan diagnosis masalah
- Tugas pelaksanaan pemantauan
- Simulasi tindak balas insiden

**Penilaian Modul 6**: Topik lanjutan
- Reka bentuk saluran CI/CD
- Pembangunan templat tersuai
- Senario arkitektur perusahaan

### Projek Akhir

Reka bentuk dan laksanakan penyelesaian lengkap yang menunjukkan penguasaan semua konsep:

**Keperluan**:
- Arkitektur aplikasi pelbagai lapisan
- Pelbagai persekitaran pelaksanaan
- Pemantauan dan amaran yang menyeluruh
- Pelaksanaan keselamatan dan pematuhan
- Pengoptimuman kos dan penalaan prestasi
- Dokumentasi lengkap dan buku panduan

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
- [Pusat Arkitektur Azure](https://learn.microsoft.com/en-us/azure/architecture/)

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
- **Minggu 11-12**: Modul 4 (Pengesahan Pra-Pelaksanaan)
- **Minggu 13-14**: Modul 5 (Penyelesaian Masalah dan Debugging)
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)

---

## Penjejakan Kemajuan dan Rangka Kerja Penilaian

### Senarai Semak Penyelesaian Bab

Jejak kemajuan anda melalui setiap bab dengan hasil yang boleh diukur ini:

#### 📚 Bab 1: Asas & Permulaan Pantas
- [ ] **Pemasangan Selesai**: AZD dipasang dan disahkan pada platform anda
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
- [ ] **Persediaan Pelbagai Persekitaran**: Konfigurasi persekitaran dev, staging, dan prod
- [ ] **Pelaksanaan Keselamatan**: Menyediakan pengesahan identiti terurus
- [ ] **Pengurusan Rahsia**: Integrasi Azure Key Vault untuk data sensitif
- [ ] **Pengurusan Parameter**: Membuat konfigurasi khusus persekitaran
- [ ] **Penguasaan Pengesahan**: Melaksanakan corak akses yang selamat

#### 🏗️ Bab 4: Infrastruktur sebagai Kod & Pelaksanaan
- [ ] **Penciptaan Templat Tersuai**: Membina templat aplikasi pelbagai perkhidmatan
- [ ] **Penguasaan Bicep**: Membuat komponen infrastruktur modular dan boleh guna semula
- [ ] **Automasi Pelaksanaan**: Melaksanakan cangkuk pra/pasca pelaksanaan
- [ ] **Reka Bentuk Arkitektur**: Melaksanakan arkitektur mikroservis yang kompleks
- [ ] **Pengoptimuman Templat**: Mengoptimumkan templat untuk prestasi dan kos

#### 🎯 Bab 5: Penyelesaian AI Pelbagai Ejen
- [ ] **Pelaksanaan Penyelesaian Runcit**: Melaksanakan senario runcit pelbagai ejen lengkap
- [ ] **Penyesuaian Ejen**: Mengubah suai tingkah laku ejen Pelanggan dan Inventori
- [ ] **Penskalaan Arkitektur**: Melaksanakan pengimbangan beban dan penskalaan automatik
- [ ] **Pemantauan Pengeluaran**: Menyediakan pemantauan dan amaran yang menyeluruh
- [ ] **Penalaan Prestasi**: Mengoptimumkan prestasi sistem pelbagai ejen

#### 🔍 Bab 6: Pengesahan Pra-Pelaksanaan & Perancangan
- [ ] **Analisis Kapasiti**: Menganalisis keperluan sumber untuk aplikasi
- [ ] **Pengoptimuman SKU**: Memilih tingkat perkhidmatan yang menjimatkan kos
- [ ] **Automasi Pengesahan**: Melaksanakan skrip pemeriksaan pra-pelaksanaan
- [ ] **Perancangan Kos**: Membuat anggaran kos pelaksanaan dan bajet
- [ ] **Penilaian Risiko**: Mengenal pasti dan mengurangkan risiko pelaksanaan

#### 🚨 Bab 7: Penyelesaian Masalah & Debugging
- [ ] **Kemahiran Diagnostik**: Berjaya debugging pelaksanaan yang sengaja rosak
- [ ] **Analisis Log**: Menggunakan Azure Monitor dan Application Insights dengan berkesan
- [ ] **Penalaan Prestasi**: Mengoptimumkan aplikasi yang berprestasi perlahan
- [ ] **Prosedur Pemulihan**: Melaksanakan sandaran dan pemulihan bencana
- [ ] **Persediaan Pemantauan**: Membuat pemantauan dan amaran proaktif

#### 🏢 Bab 8: Corak Pengeluaran & Perusahaan
- [ ] **Keselamatan Perusahaan**: Melaksanakan corak keselamatan yang menyeluruh
- [ ] **Rangka Kerja Tadbir Urus**: Menyediakan Azure Policy dan pengurusan sumber
- [ ] **Pemantauan Lanjutan**: Membuat papan pemuka dan amaran automatik
- [ ] **Integrasi CI/CD**: Membina saluran pelaksanaan automatik
- [ ] **Pelaksanaan Pematuhan**: Memenuhi keperluan pematuhan perusahaan

### Garis Masa Pembelajaran dan Pencapaian

#### Minggu 1-2: Pembinaan Asas
- **Pencapaian**: Melaksanakan aplikasi AI pertama menggunakan AZD
- **Pengesahan**: Aplikasi berfungsi boleh diakses melalui URL awam
- **Kemahiran**: Aliran kerja asas AZD dan integrasi perkhidmatan AI

#### Minggu 3-4: Penguasaan Konfigurasi
- **Pencapaian**: Pelaksanaan pelbagai persekitaran dengan pengesahan yang selamat
- **Pengesahan**: Aplikasi yang sama dilaksanakan ke dev/staging/prod
- **Kemahiran**: Pengurusan persekitaran dan pelaksanaan keselamatan

#### Minggu 5-6: Kepakaran Infrastruktur
- **Pencapaian**: Templat tersuai untuk aplikasi pelbagai perkhidmatan yang kompleks
- **Pengesahan**: Templat boleh guna semula dilaksanakan oleh ahli pasukan lain
- **Kemahiran**: Penguasaan Bicep dan automasi infrastruktur

#### Minggu 7-8: Pelaksanaan AI Lanjutan
- **Pencapaian**: Penyelesaian AI pelbagai ejen sedia pengeluaran
- **Pengesahan**: Sistem mengendalikan beban dunia sebenar dengan pemantauan
- **Kemahiran**: Orkestrasi pelbagai ejen dan pengoptimuman prestasi

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
- **Projek Portfolio**: 8 pelaksanaan sedia pengeluaran
- **Kemahiran Teknikal**: Kepakaran AZD dan pelaksanaan AI bertaraf industri
- **Keupayaan Penyelesaian Masalah**: Penyelesaian masalah dan pengoptimuman secara berdikari
- **Pengiktirafan Komuniti**: Penyertaan aktif dalam komuniti pembangun Azure
- **Kemajuan Kerjaya**: Kemahiran yang boleh terus digunakan untuk peranan awan dan AI

#### Metrik Kejayaan
- **Kadar Kejayaan Pelaksanaan**: >95% pelaksanaan berjaya
- **Masa Penyelesaian Masalah**: <30 minit untuk isu biasa
- **Pengoptimuman Prestasi**: Penambahbaikan yang boleh ditunjukkan dalam kos dan prestasi
- **Pematuhan Keselamatan**: Semua pelaksanaan memenuhi piawaian keselamatan perusahaan
- **Pemindahan Pengetahuan**: Keupayaan untuk membimbing pembangun lain

### Pembelajaran Berterusan dan Penglibatan Komuniti

#### Kekal Terkini
- **Kemas Kini Azure**: Ikuti nota keluaran Azure Developer CLI
- **Acara Komuniti**: Sertai acara pembangun Azure dan AI
- **Dokumentasi**: Sumbang kepada dokumentasi dan contoh komuniti
- **Maklum Balas**: Berikan maklum balas tentang kandungan kursus dan perkhidmatan Azure

#### Pembangunan Kerjaya
- **Rangkaian Profesional**: Berhubung dengan pakar Azure dan AI
- **Peluang Berucap**: Kongsi pembelajaran di persidangan atau pertemuan
- **Sumbangan Sumber Terbuka**: Sumbang kepada templat dan alat AZD
- **Mentor**: Bimbing pembangun lain dalam perjalanan pembelajaran AZD mereka

---

**Navigasi Bab:**
- **📚 Halaman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Belajar**: [Bab 1: Asas & Permulaan Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Penjejakan Kemajuan**: Jejak kemajuan anda melalui sistem pembelajaran 8 bab yang komprehensif
- **🤝 Komuniti**: [Azure Discord](https://discord.gg/microsoft-azure) untuk sokongan dan perbincangan

**Penjejakan Kemajuan Pembelajaran**: Gunakan panduan berstruktur ini untuk menguasai Azure Developer CLI melalui pembelajaran progresif, praktikal dengan hasil yang boleh diukur dan manfaat pembangunan profesional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->