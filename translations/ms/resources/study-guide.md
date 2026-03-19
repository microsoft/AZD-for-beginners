# Panduan Kajian - Objektif Pembelajaran Komprehensif

**Navigasi Laluan Pembelajaran**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **📖 Mula Belajar**: [Bab 1: Asas & Mula Pantas](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Jejak Kemajuan**: [Penyiapan Kursus](../README.md#-course-completion--certification)

## Pengenalan

Panduan kajian komprehensif ini menyediakan objektif pembelajaran yang terstruktur, konsep utama, latihan praktikal, dan bahan penilaian untuk membantu anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk menjejak kemajuan anda dan memastikan anda telah merangkumi semua topik penting.

## Matlamat Pembelajaran

Dengan menyiapkan panduan kajian ini, anda akan:
- Menguasai semua konsep asas dan lanjutan Azure Developer CLI
- Membangunkan kemahiran praktikal dalam penyebaran dan pengurusan aplikasi Azure
- Meningkatkan keyakinan dalam menyelesaikan masalah dan mengoptimumkan penyebaran
- Memahami amalan penyebaran bersedia produksi dan pertimbangan keselamatan

## Hasil Pembelajaran

Selepas menyiapkan semua bahagian panduan kajian ini, anda akan dapat:
- Reka bentuk, sebarkan, dan uruskan seni bina aplikasi lengkap menggunakan azd
- Melaksanakan pemantauan komprehensif, keselamatan, dan strategi pengoptimuman kos
- Menyelesaikan isu penyebaran kompleks secara berdikari
- Mencipta templat tersuai dan menyumbang kepada komuniti azd

## Struktur Pembelajaran 8 Bab

### Bab 1: Asas & Mula Pantas (Minggu 1)
**Tempoh**: 30-45 minit | **Kerumitan**: ⭐

#### Objektif Pembelajaran
- Memahami konsep teras dan terminologi Azure Developer CLI
- Berjaya memasang dan mengkonfigurasi AZD pada platform pembangunan anda
- Menyebarkan aplikasi pertama anda menggunakan templat sedia ada
- Menavigasi antaramuka baris perintah AZD dengan berkesan

#### Konsep Utama untuk Dikuasai
- Struktur dan komponen projek AZD (azure.yaml, infra/, src/)
- Aliran kerja penyebaran berasaskan templat
- Asas konfigurasi persekitaran
- Pengurusan kumpulan sumber dan langganan

#### Latihan Praktikal
1. **Pengesahan Pemasangan**: Pasang AZD dan sahkan dengan `azd version`
2. **Penyebaran Pertama**: Sebarkan templat todo-nodejs-mongo dengan berjaya
3. **Penetapan Persekitaran**: Konfigurasikan pembolehubah persekitaran pertama anda
4. **Eksplorasi Sumber**: Navigasi sumber yang telah disebarkan di Azure Portal

#### Soalan Penilaian
- Apakah komponen teras projek AZD?
- Bagaimana anda menginisialisasi projek baru dari templat?
- Apakah perbezaan antara `azd up` dan `azd deploy`?
- Bagaimana anda menguruskan pelbagai persekitaran dengan AZD?

---

### Bab 2: Pembangunan AI-Pertama (Minggu 2)
**Tempoh**: 1-2 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Mengintegrasi perkhidmatan Microsoft Foundry dengan aliran kerja AZD
- Menyebarkan dan mengkonfigurasi aplikasi berkuasa AI
- Memahami corak pelaksanaan RAG (Retrieval-Augmented Generation)
- Mengurus penyebaran model AI dan penskalaan

#### Konsep Utama untuk Dikuasai
- Integrasi perkhidmatan Microsoft Foundry Models dan pengurusan API
- Konfigurasi AI Search dan pengindeksan vektor
- Strategi penyebaran model dan perancangan kapasiti
- Pemantauan aplikasi AI dan pengoptimuman prestasi

#### Latihan Praktikal
1. **Penyebaran AI Chat**: Sebarkan templat azure-search-openai-demo
2. **Pelaksanaan RAG**: Konfigurasikan pengindeksan dan pemulihan dokumen
3. **Konfigurasi Model**: Tetapkan pelbagai model AI dengan tujuan berbeza
4. **Pemantauan AI**: Laksanakan Application Insights untuk beban kerja AI

#### Soalan Penilaian
- Bagaimana anda mengkonfigurasi perkhidmatan Microsoft Foundry Models dalam templat AZD?
- Apakah komponen utama seni bina RAG?
- Bagaimana anda mengurus kapasiti dan penskalaan model AI?
- Apakah metrik pemantauan penting untuk aplikasi AI?

---

### Bab 3: Konfigurasi & Pengesahan (Minggu 3)
**Tempoh**: 45-60 minit | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Menguasai strategi konfigurasi dan pengurusan persekitaran
- Melaksanakan corak pengesahan selamat dan identiti terurus
- Menyusun sumber dengan konvensyen penamaan yang betul
- Mengkonfigurasi penyebaran pelbagai persekitaran (dev, staging, prod)

#### Konsep Utama untuk Dikuasai
- Hierarki persekitaran dan keutamaan konfigurasi
- Identiti terurus dan pengesahan prinsip perkhidmatan
- Integrasi Key Vault untuk pengurusan rahsia
- Pengurusan parameter khusus persekitaran

#### Latihan Praktikal
1. **Penetapan Pelbagai Persekitaran**: Konfigurasikan persekitaran dev, staging, dan prod
2. **Konfigurasi Keselamatan**: Laksanakan pengesahan identiti terurus
3. **Pengurusan Rahsia**: Integrasi Azure Key Vault untuk data sensitif
4. **Pengurusan Parameter**: Cipta konfigurasi khusus persekitaran

#### Soalan Penilaian
- Bagaimana anda mengkonfigurasi persekitaran berbeza dengan AZD?
- Apakah manfaat menggunakan identiti terurus berbanding prinsip perkhidmatan?
- Bagaimana anda mengurus rahsia aplikasi secara selamat?
- Apakah hierarki konfigurasi dalam AZD?

---

### Bab 4: Infrastruktur sebagai Kod & Penyebaran (Minggu 4-5)
**Tempoh**: 1-1.5 jam | **Kerumitan**: ⭐⭐⭐

#### Objektif Pembelajaran
- Cipta dan sesuaikan templat infrastruktur Bicep
- Laksanakan corak penyebaran dan aliran kerja maju
- Memahami strategi penyediaan sumber
- Reka bentuk seni bina pelbagai perkhidmatan yang boleh diskalakan

- Sebarkan aplikasi berkontena menggunakan Azure Container Apps dan AZD

#### Konsep Utama untuk Dikuasai
- Struktur templat Bicep dan amalan terbaik
- Kebergantungan sumber dan urutan penyebaran
- Fail parameter dan modulariti templat
- Hooks tersuai dan automasi penyebaran
- Corak penyebaran aplikasi kontena (mula pantas, produksi, mikroservis)

#### Latihan Praktikal
1. **Penciptaan Templat Tersuai**: Bina templat aplikasi pelbagai perkhidmatan
2. **Penguasaan Bicep**: Cipta komponen infrastruktur modular dan boleh guna semula
3. **Automasi Penyebaran**: Laksanakan hook sebelum/selepas penyebaran
4. **Reka Bentuk Seni Bina**: Sebarkan seni bina mikroservis kompleks
5. **Penyebaran Aplikasi Kontena**: Sebarkan contoh [Simple Flask API](../../../examples/container-app/simple-flask-api) dan [Microservices Architecture](../../../examples/container-app/microservices) menggunakan AZD

#### Soalan Penilaian
- Bagaimana anda mencipta templat Bicep tersuai untuk AZD?
- Apakah amalan terbaik untuk menyusun kod infrastruktur?
- Bagaimana anda mengendalikan kebergantungan sumber dalam templat?
- Apakah corak penyebaran yang menyokong kemas kini tanpa henti?

---

### Bab 5: Penyelesaian AI Multi-Ejen (Minggu 6-7)
**Tempoh**: 2-3 jam | **Kerumitan**: ⭐⭐⭐⭐

#### Objektif Pembelajaran
- Reka bentuk dan laksanakan seni bina AI berbilang ejen
- Mengatur koordinasi dan komunikasi ejen
- Sebarkan penyelesaian AI bersedia produksi dengan pemantauan
- Memahami pengkhususan ejen dan corak aliran kerja
- Integrasi mikroservis berkontena sebagai sebahagian penyelesaian multi-ejen

#### Konsep Utama untuk Dikuasai
- Corak seni bina multi-ejen dan prinsip reka bentuk
- Protokol komunikasi ejen dan aliran data
- Strategi imbangan beban dan penskalaan untuk ejen AI
- Pemantauan produksi untuk sistem multi-ejen
- Komunikasi perkhidmatan-ke-perkhidmatan dalam persekitaran berkontena

#### Latihan Praktikal
1. **Penyebaran Penyelesaian Runcit**: Sebarkan senario runcit multi-ejen lengkap
2. **Pengubahsuaian Ejen**: Ubah kelakuan Ejen Pelanggan dan Inventori
3. **Penskalaan Seni Bina**: Laksanakan imbangan beban dan penskalaan automatik
4. **Pemantauan Produksi**: Tetapkan pemantauan dan amaran menyeluruh
5. **Integrasi Mikroservis**: Luaskan contoh [Microservices Architecture](../../../examples/container-app/microservices) untuk menyokong aliran kerja berasaskan ejen

#### Soalan Penilaian
- Bagaimana anda mereka corak komunikasi multi-ejen yang berkesan?
- Apakah pertimbangan utama untuk penskalaan beban kerja ejen AI?
- Bagaimana anda memantau dan membaiki sistem AI multi-ejen?
- Apakah corak produksi yang memastikan kebolehpercayaan untuk ejen AI?

---

### Bab 6: Pengesahan & Perancangan Pra-Penyebaran (Minggu 8)
**Tempoh**: 1 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Melakukan perancangan kapasiti dan pengesahan sumber komprehensif
- Memilih SKU Azure yang optimum untuk keberkesanan kos
- Melaksanakan pemeriksaan dan pengesahan pra-penerbangan automatik
- Merancang penyebaran dengan strategi pengoptimuman kos

#### Konsep Utama untuk Dikuasai
- Kuota sumber Azure dan had kapasiti
- Kriteria pemilihan SKU dan pengoptimuman kos
- Skrip pengesahan automatik dan pengujian
- Perancangan penyebaran dan penilaian risiko

#### Latihan Praktikal
1. **Analisis Kapasiti**: Analisis keperluan sumber untuk aplikasi anda
2. **Pengoptimuman SKU**: Bandingkan dan pilih tahap perkhidmatan kos efektif
3. **Automasi Pengesahan**: Laksanakan skrip pemeriksaan pra-penyebaran
4. **Perancangan Kos**: Cipta anggaran kos penyebaran dan bajet

#### Soalan Penilaian
- Bagaimana anda mengesahkan kapasiti Azure sebelum penyebaran?
- Apakah faktor yang mempengaruhi keputusan pemilihan SKU?
- Bagaimana anda mengautomasi pengesahan pra-penyebaran?
- Apakah strategi yang membantu mengoptimumkan kos penyebaran?

---

### Bab 7: Penyelesaian Masalah & Pembaikan (Minggu 9)
**Tempoh**: 1-1.5 jam | **Kerumitan**: ⭐⭐

#### Objektif Pembelajaran
- Membangun pendekatan pembaikan sistematik untuk penyebaran AZD
- Menyelesaikan isu penyebaran dan konfigurasi biasa
- Membaiki masalah khusus AI dan isu prestasi
- Melaksanakan pemantauan dan amaran untuk pengesanan masalah proaktif

#### Konsep Utama untuk Dikuasai
- Teknik diagnostik dan strategi perekodan log
- Corak kegagalan biasa dan penyelesaiannya
- Pemantauan prestasi dan pengoptimuman
- Prosedur tindak balas insiden dan pemulihan

#### Latihan Praktikal
1. **Kemahiran Diagnostik**: Latih dengan penyebaran yang sengaja rosak
2. **Analisis Log**: Gunakan Azure Monitor dan Application Insights dengan berkesan
3. **Pelarasan Prestasi**: Optimumkan aplikasi yang lambat berprestasi
4. **Prosedur Pemulihan**: Laksanakan sandaran dan pemulihan bencana

#### Soalan Penilaian
- Apakah kegagalan penyebaran AZD yang paling biasa?
- Bagaimana anda membaiki isu pengesahan dan kebenaran?
- Apakah strategi pemantauan yang membantu mencegah isu produksi?
- Bagaimana anda mengoptimumkan prestasi aplikasi dalam Azure?

---

### Bab 8: Corak Produksi & Perusahaan (Minggu 10-11)
**Tempoh**: 2-3 jam | **Kerumitan**: ⭐⭐⭐⭐

#### Objektif Pembelajaran
- Melaksanakan strategi penyebaran tahap perusahaan
- Reka corak keselamatan dan rangka kerja pematuhan
- Menubuhkan pemantauan, tadbir urus, dan pengurusan kos
- Cipta saluran CI/CD skala boleh ubah dengan integrasi AZD
- Gunakan amalan terbaik untuk penyebaran aplikasi kontena produksi (keselamatan, pemantauan, kos, CI/CD)

#### Konsep Utama untuk Dikuasai
- Keperluan keselamatan dan pematuhan perusahaan
- Rangka kerja tadbir urus dan pelaksanaan polisi
- Pemantauan lanjutan dan pengurusan kos
- Integrasi CI/CD dan saluran penyebaran automatik
- Strategi penyebaran blue-green dan canary untuk beban kerja berkontena

#### Latihan Praktikal
1. **Keselamatan Perusahaan**: Laksanakan corak keselamatan komprehensif
2. **Rangka Kerja Tadbir Urus**: Tetapkan Polisi Azure dan pengurusan sumber
3. **Pemantauan Lanjutan**: Cipta papan pemuka dan amaran automatik
4. **Integrasi CI/CD**: Bina saluran penyebaran automatik
5. **Aplikasi Kontena Produksi**: Gunakan keselamatan, pemantauan, dan pengoptimuman kos untuk contoh [Microservices Architecture](../../../examples/container-app/microservices)

#### Soalan Penilaian
- Bagaimana anda melaksanakan keselamatan perusahaan dalam penyebaran AZD?
- Apakah corak tadbir urus yang memastikan pematuhan dan kawalan kos?
- Bagaimana anda mereka pemantauan skala untuk sistem produksi?
- Apakah corak CI/CD yang paling sesuai dengan aliran kerja AZD?

#### Objektif Pembelajaran
- Memahami asas dan konsep teras Azure Developer CLI
- Berjaya memasang dan mengkonfigurasi azd pada persekitaran pembangunan anda
- Menyiapkan penyebaran pertama menggunakan templat sedia ada
- Menavigasi struktur projek azd dan memahami komponen utama

#### Konsep Utama untuk Dikuasai
- Templat, persekitaran, dan perkhidmatan
- Struktur konfigurasi azure.yaml
- Arahan azd asas (init, up, down, deploy)
- Prinsip Infrastruktur sebagai Kod
- Pengesahan dan kebenaran Azure

#### Latihan Praktikal

**Latihan 1.1: Pemasangan dan Penetapan**
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
# Lancarkan aplikasi web yang mudah:
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
3. Bagaimana persekitaran membantu mengurus sasaran penyebaran berbeza?
4. Apakah kaedah pengesahan yang boleh digunakan dengan azd?
5. Apa yang berlaku apabila anda menjalankan `azd up` buat pertama kali?

---

## Jejak Kemajuan dan Rangka Penilaian
```bash
# Cipta dan konfigurasikan pelbagai persekitaran:
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
2. Apakah hook penyebaran dan bilakah anda perlu menggunakannya?
3. Bagaimana anda mengkonfigurasi SKU berbeza untuk persekitaran berbeza?
4. Apakah implikasi keselamatan kaedah pengesahan berbeza?
5. Bagaimana anda mengurus rahsia dan data konfigurasi sensitif?

### Modul 3: Penyebaran dan Penyediaan (Minggu 4)

#### Objektif Pembelajaran
- Menguasai aliran kerja penyebaran dan amalan terbaik
- Memahami Infrastruktur sebagai Kod dengan templat Bicep
- Melaksanakan seni bina multi-perkhidmatan yang kompleks
- Mengoptimumkan prestasi dan kebolehpercayaan penyebaran

#### Konsep Utama untuk Dikuasai
- Struktur templat Bicep dan modulasi
- Kebergantungan sumber dan pengurutan
- Strategi penyebaran (blue-green, kemas kini bergulung)
- Penyebaran pelbagai rantau
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

**Latihan 3.2: Aplikasi Multi-Perkhidmatan**
```bash
# Melaksanakan seni bina mikroservis:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Latihan 3.3: Integrasi Pangkalan Data**
```bash
# Melaksanakan corak pengedaran pangkalan data:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Soalan Penilaian Kendiri
1. Apakah kelebihan menggunakan Bicep berbanding templat ARM?
2. Bagaimana anda mengendalikan migrasi pangkalan data dalam penyebaran azd?
3. Apakah strategi yang ada untuk penyebaran tanpa henti?
4. Bagaimana anda mengurus kebergantungan antara perkhidmatan?
5. Apakah pertimbangan untuk penyebaran pelbagai rantau?

### Modul 4: Pengesahan Pra-Penyebaran (Minggu 5)

#### Objektif Pembelajaran
- Melaksanakan pemeriksaan pra-penempatan yang menyeluruh  
- Menguasai perancangan kapasiti dan pengesahan sumber  
- Memahami pemilihan SKU dan pengoptimuman kos  
- Membina saluran pengesahan automatik  

#### Konsep Utama untuk Dikuasai  
- Kuota dan had sumber Azure  
- Kriteria pemilihan SKU dan implikasi kos  
- Skrip dan alat pengesahan automatik  
- Metodologi perancangan kapasiti  
- Ujian prestasi dan pengoptimuman  

#### Latihan Amali  

**Latihan 4.1: Perancangan Kapasiti**  
```bash
# Laksanakan pengesahan kapasiti:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Latihan 4.2: Pengesahan Pra-penerbangan**  
```powershell
# Bina saluran pensahan menyeluruh:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Latihan 4.3: Pengoptimuman SKU**  
```bash
# Mengoptimumkan konfigurasi perkhidmatan:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  
#### Soalan Penilaian Kendiri  
1. Faktor apa yang harus mempengaruhi keputusan pemilihan SKU?  
2. Bagaimana anda mengesahkan ketersediaan sumber Azure sebelum penempatan?  
3. Apakah komponen utama sistem pemeriksaan pra-penerbangan?  
4. Bagaimana anda menganggarkan dan mengawal kos penempatan?  
5. Pemantauan apa yang penting untuk perancangan kapasiti?  

### Modul 5: Penyelesaian Masalah dan Penyahpepijatan (Minggu 6)  

#### Objektif Pembelajaran  
- Menguasai metodologi penyelesaian masalah sistematik  
- Membangunkan kepakaran dalam penyahpepijatan isu penempatan yang kompleks  
- Melaksanakan pemantauan dan amaran yang menyeluruh  
- Membina prosedur tindak balas insiden dan pemulihan  

#### Konsep Utama untuk Dikuasai  
- Corak kegagalan penempatan biasa  
- Analisis log dan teknik korelasi  
- Pemantauan prestasi dan pengoptimuman  
- Pengesanan dan tindak balas insiden keselamatan  
- Pemulihan bencana dan kesinambungan perniagaan  

#### Latihan Amali  

**Latihan 5.1: Senario Penyelesaian Masalah**  
```bash
# Amalkan menyelesaikan masalah biasa:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Latihan 5.2: Pelaksanaan Pemantauan**  
```bash
# Tetapkan pemantauan menyeluruh:
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
1. Apakah pendekatan sistematik untuk penyelesaian masalah penempatan azd?  
2. Bagaimana anda mengaitkan log merentasi pelbagai perkhidmatan dan sumber?  
3. Metik pemantauan apa yang paling kritikal untuk pengesanan masalah awal?  
4. Bagaimana anda melaksanakan prosedur pemulihan bencana yang berkesan?  
5. Apakah komponen utama pelan tindak balas insiden?  

### Modul 6: Topik Lanjutan dan Amalan Terbaik (Minggu 7-8)  

#### Objektif Pembelajaran  
- Melaksanakan corak penempatan bertaraf perusahaan  
- Menguasai integrasi CI/CD dan automasi  
- Membangunkan templat tersuai dan menyumbang kepada komuniti  
- Memahami keperluan keselamatan dan pematuhan lanjutan  

#### Konsep Utama untuk Dikuasai  
- Corak integrasi saluran CI/CD  
- Pembangunan dan pengedaran templat tersuai  
- Tadbir urus perusahaan dan pematuhan  
- Konfigurasi rangkaian dan keselamatan lanjutan  
- Pengoptimuman prestasi dan pengurusan kos  

#### Latihan Amali  

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
# Laksanakan ciri tahap perusahaan:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  
#### Soalan Penilaian Kendiri  
1. Bagaimana anda mengintegrasikan azd ke dalam aliran kerja CI/CD sedia ada?  
2. Apakah pertimbangan utama dalam pembangunan templat tersuai?  
3. Bagaimana anda melaksanakan tadbir urus dan pematuhan dalam penempatan azd?  
4. Apakah amalan terbaik untuk penempatan skala perusahaan?  
5. Bagaimana anda menyumbang secara berkesan kepada komuniti azd?  

## Projek Praktikal  

### Projek 1: Laman Web Portfolio Peribadi  
**Kerumitan**: Permulaan  
**Tempoh**: 1-2 minggu  

Bina dan tempatkan laman web portfolio peribadi menggunakan:  
- Hosting laman web statik pada Azure Storage  
- Konfigurasi domain tersuai  
- Integrasi CDN untuk prestasi global  
- Saluran penempatan automatik  

**Penghantaran**:  
- Laman web berfungsi yang ditempatkan di Azure  
- Templat azd tersuai untuk penempatan portfolio  
- Dokumentasi proses penempatan  
- Analisis kos dan cadangan pengoptimuman  

### Projek 2: Aplikasi Pengurusan Tugas  
**Kerumitan**: Pertengahan  
**Tempoh**: 2-3 minggu  

Cipta aplikasi pengurusan tugas penuh dengan:  
- React frontend ditempatkan di App Service  
- Backend API Node.js dengan pengesahan  
- Pangkalan data PostgreSQL dengan migrasi  
- Pemantauan Application Insights  

**Penghantaran**:  
- Aplikasi lengkap dengan pengesahan pengguna  
- Skema pangkalan data dan skrip migrasi  
- Papan pemuka pemantauan dan peraturan amaran  
- Konfigurasi penempatan berbilang persekitaran  

### Projek 3: Platform E-dagang Mikroservis  
**Kerumitan**: Lanjutan  
**Tempoh**: 4-6 minggu  

Reka dan laksanakan platform e-dagang berasaskan mikroservis:  
- Pelbagai perkhidmatan API (katalog, pesanan, pembayaran, pengguna)  
- Integrasi barisan mesej dengan Service Bus  
- Cache Redis untuk pengoptimuman prestasi  
- Logging dan pemantauan menyeluruh  

**Contoh Rujukan**: Lihat [Microservices Architecture](../../../examples/container-app/microservices) untuk templat dan panduan penempatan yang sedia untuk produksi  

**Penghantaran**:  
- Senibina mikroservis yang lengkap  
- Corak komunikasi antara perkhidmatan  
- Ujian prestasi dan pengoptimuman  
- Pelaksanaan keselamatan sedia produksi  

## Penilaian dan Pensijilan  

### Pemeriksaan Pengetahuan  

Lengkapkan penilaian ini selepas setiap modul:  

**Penilaian Modul 1**: Konsep asas dan pemasangan  
- Soalan pilihan berganda mengenai konsep teras  
- Tugasan pemasangan dan konfigurasi praktikal  
- Latihan penempatan mudah  

**Penilaian Modul 2**: Konfigurasi dan persekitaran  
- Senario pengurusan persekitaran  
- Latihan penyelesaian masalah konfigurasi  
- Pelaksanaan konfigurasi keselamatan  

**Penilaian Modul 3**: Penempatan dan penyediaan  
- Cabaran reka bentuk infrastruktur  
- Senario penempatan pelbagai perkhidmatan  
- Latihan pengoptimuman prestasi  

**Penilaian Modul 4**: Pengesahan pra-penempatan  
- Kajian kes perancangan kapasiti  
- Senario pengoptimuman kos  
- Pelaksanaan saluran pengesahan  

**Penilaian Modul 5**: Penyelesaian masalah dan penyahpepijatan  
- Latihan diagnosis masalah  
- Tugasan pelaksanaan pemantauan  
- Simulasi tindak balas insiden  

**Penilaian Modul 6**: Topik lanjutan  
- Reka bentuk saluran CI/CD  
- Pembangunan templat tersuai  
- Senario senibina perusahaan  

### Projek Capstone Akhir  

Reka dan laksanakan penyelesaian lengkap yang menunjukkan penguasaan semua konsep:  

**Keperluan**:  
- Senibina aplikasi multitier  
- Pelbagai persekitaran penempatan  
- Pemantauan dan amaran menyeluruh  
- Pelaksanaan keselamatan dan pematuhan  
- Pengoptimuman kos dan penyetelan prestasi  
- Dokumentasi dan buku panduan lengkap  

**Kriteria Penilaian**:  
- Kualiti pelaksanaan teknikal  
- Kesempurnaan dokumentasi  
- Pematuhan keselamatan dan amalan terbaik  
- Pengoptimuman prestasi dan kos  
- Keberkesanan penyelesaian masalah dan pemantauan  

## Sumber dan Rujukan Kajian  

### Dokumentasi Rasmi  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Dokumentasi Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Pusat Senibina Azure](https://learn.microsoft.com/en-us/azure/architecture/)  

### Sumber Komuniti  
- [Galeri Templat AZD](https://azure.github.io/awesome-azd/)  
- [Organisasi GitHub Azure-Samples](https://github.com/Azure-Samples)  
- [Repositori GitHub Azure Developer CLI](https://github.com/Azure/azure-dev)  

### Persekitaran Latihan  
- [Akaun Azure Percuma](https://azure.microsoft.com/free/)  
- [Tier Percuma Azure DevOps](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Alat Tambahan  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Pakej Sambungan Azure Tools](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Cadangan Jadual Kajian  

### Kajian Sepenuh Masa (8 minggu)  
- **Minggu 1-2**: Modul 1-2 (Pengenalan, Konfigurasi)  
- **Minggu 3-4**: Modul 3-4 (Penempatan, Pra-penempatan)  
- **Minggu 5-6**: Modul 5-6 (Penyelesaian Masalah, Topik Lanjutan)  
- **Minggu 7-8**: Projek Praktikal dan Penilaian Akhir  

### Kajian Sambilan (16 minggu)  
- **Minggu 1-4**: Modul 1 (Pengenalan)  
- **Minggu 5-7**: Modul 2 (Konfigurasi dan Persekitaran)  
- **Minggu 8-10**: Modul 3 (Penempatan dan Penyediaan)  
- **Minggu 11-12**: Modul 4 (Pengesahan Pra-penempatan)  
- **Minggu 13-14**: Modul 5 (Penyelesaian Masalah dan Penyahpepijatan)  
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)  

---  

## Kerangka Penjejakan Kemajuan dan Penilaian  

### Senarai Semak Penyiapan Bab  

Jejak kemajuan anda melalui setiap bab dengan hasil yang boleh diukur ini:  

#### 📚 Bab 1: Asas & Permulaan Pantas  
- [ ] **Pemasangan Lengkap**: AZD dipasang dan disahkan pada platform anda  
- [ ] **Penempatan Pertama**: Templat todo-nodejs-mongo berjaya ditempatkan  
- [ ] **Persediaan Persekitaran**: Konfigurasi pemboleh ubah persekitaran pertama  
- [ ] **Navigasi Sumber**: Meneroka sumber yang ditempatkan dalam Azure Portal  
- [ ] **Penguasaan Arahan**: Selesa dengan arahan AZD asas  

#### 🤖 Bab 2: Pembangunan Berasaskan AI  
- [ ] **Penempatan Templat AI**: Berjaya tempatkan azure-search-openai-demo  
- [ ] **Pelaksanaan RAG**: Konfigurasikan pengindeksan dan pengambilan dokumen  
- [ ] **Konfigurasi Model**: Sediakan pelbagai model AI dengan tujuan berbeza  
- [ ] **Pemantauan AI**: Laksanakan Application Insights untuk beban kerja AI  
- [ ] **Pengoptimuman Prestasi**: Laraskan prestasi aplikasi AI  

#### ⚙️ Bab 3: Konfigurasi & Pengesahan  
- [ ] **Persediaan Pelbagai Persekitaran**: Konfigurasi persekitaran dev, staging, dan prod  
- [ ] **Pelaksanaan Keselamatan**: Sediakan pengesahan identiti terurus  
- [ ] **Pengurusan Rahsia**: Integrasikan Azure Key Vault untuk data sensitif  
- [ ] **Pengurusan Parameter**: Buat konfigurasi khusus persekitaran  
- [ ] **Penguasaan Pengesahan**: Melaksanakan corak akses selamat  

#### 🏗️ Bab 4: Infrastruktur sebagai Kod & Penempatan  
- [ ] **Penciptaan Templat Tersuai**: Bina templat aplikasi pelbagai perkhidmatan  
- [ ] **Penguasaan Bicep**: Buat komponen infrastruktur modular dan boleh guna semula  
- [ ] **Automasi Penempatan**: Melaksanakan hook sebelum/selepas penempatan  
- [ ] **Reka Bentuk Senibina**: Tempatkan senibina mikroservis kompleks  
- [ ] **Pengoptimuman Templat**: Optimumkan templat untuk prestasi dan kos  

#### 🎯 Bab 5: Penyelesaian AI Pelbagai Ejen  
- [ ] **Penempatan Penyelesaian Runcit**: Tempatkan senario runcit pelbagai ejen lengkap  
- [ ] **Penyesuaian Ejen**: Ubah suai tingkah laku ejen Pelanggan dan Inventori  
- [ ] **Penskalahan Senibina**: Laksanakan imbangan beban dan penskalaan automatik  
- [ ] **Pemantauan Produksi**: Sediakan pemantauan dan amaran menyeluruh  
- [ ] **Penyetelan Prestasi**: Optimumkan prestasi sistem pelbagai ejen  

#### 🔍 Bab 6: Pengesahan & Perancangan Pra-penempatan  
- [ ] **Analisis Kapasiti**: Analisis keperluan sumber untuk aplikasi  
- [ ] **Pengoptimuman SKU**: Pilih tier perkhidmatan yang kos efektif  
- [ ] **Automasi Pengesahan**: Laksanakan skrip pemeriksaan pra-penempatan  
- [ ] **Perancangan Kos**: Buat anggaran kos penempatan dan bajet  
- [ ] **Penilaian Risiko**: Kenal pasti dan kurangkan risiko penempatan  

#### 🚨 Bab 7: Penyelesaian Masalah & Penyahpepijatan  
- [ ] **Kemahiran Diagnostik**: Berjaya nyahpepijat penempatan yang rosak dengan sengaja  
- [ ] **Analisis Log**: Gunakan Azure Monitor dan Application Insights dengan berkesan  
- [ ] **Penyetelan Prestasi**: Optimumkan aplikasi yang berprestasi perlahan  
- [ ] **Prosedur Pemulihan**: Laksanakan sandaran dan pemulihan bencana  
- [ ] **Persediaan Pemantauan**: Buat pemantauan dan amaran proaktif  

#### 🏢 Bab 8: Produksi & Corak Perusahaan  
- [ ] **Keselamatan Perusahaan**: Laksanakan corak keselamatan menyeluruh  
- [ ] **Kerangka Tadbir Urus**: Sediakan Azure Policy dan pengurusan sumber  
- [ ] **Pemantauan Lanjutan**: Buat papan pemuka dan amaran automatik  
- [ ] **Integrasi CI/CD**: Bina saluran penempatan automatik  
- [ ] **Pelaksanaan Pematuhan**: Penuhi keperluan pematuhan perusahaan  

### Garis Masa dan Pencapaian Pembelajaran  

#### Minggu 1-2: Pembinaan Asas  
- **Pencapaian**: Tempatkan aplikasi AI pertama menggunakan AZD  
- **Pengesahan**: Aplikasi berfungsi boleh diakses melalui URL awam  
- **Kemahiran**: Aliran kerja AZD asas dan integrasi perkhidmatan AI  

#### Minggu 3-4: Penguasaan Konfigurasi  
- **Pencapaian**: Penempatan pelbagai persekitaran dengan pengesahan selamat  
- **Pengesahan**: Aplikasi sama ditempatkan ke dev/staging/prod  
- **Kemahiran**: Pengurusan persekitaran dan pelaksanaan keselamatan  

#### Minggu 5-6: Kepakaran Infrastruktur  
- **Pencapaian**: Templat tersuai untuk aplikasi multi-perkhidmatan kompleks  
- **Pengesahan**: Templat guna semula ditempatkan oleh ahli pasukan lain  
- **Kemahiran**: Penguasaan Bicep dan automasi infrastruktur  

#### Minggu 7-8: Pelaksanaan AI Lanjutan  
- **Pencapaian**: Penyelesaian AI multi-ejen sedia produksi  
- **Pengesahan**: Sistem mengendalikan beban dunia sebenar dengan pemantauan  
- **Kemahiran**: Orkestrasi multi-ejen dan pengoptimuman prestasi  

#### Minggu 9-10: Kesediaan Produksi  
- **Pencapaian**: Penempatan bertaraf perusahaan dengan pematuhan penuh  
- **Pengesahan**: Lulus semakan keselamatan dan audit pengoptimuman kos  
- **Kemahiran**: Tadbir urus, pemantauan, dan integrasi CI/CD  

### Penilaian dan Pensijilan  

#### Kaedah Pengesahan Pengetahuan  
1. **Penempatan Praktikal**: Aplikasi berfungsi untuk setiap bab  
2. **Ulasan Kod**: Penilaian kualiti templat dan konfigurasi  
3. **Penyelesaian Masalah**: Senario dan penyelesaian penyelesaian masalah  
4. **Pengajaran Rakan**: Terangkan konsep kepada pelajar lain  
5. **Sumbangan Komuniti**: Kongsi templat atau penambahbaikan  

#### Hasil Pembangunan Profesional
- **Projek Portfolio**: 8 pelaksanaan sedia produksi  
- **Kemahiran Teknikal**: Kepakaran pelaksanaan AZD dan AI bersaiz industri  
- **Kemampuan Penyelesaian Masalah**: Penyelesaian masalah dan pengoptimuman secara bebas  
- **Pengiktirafan Komuniti**: Penyertaan aktif dalam komuniti pembangun Azure  
- **Kemajuan Kerjaya**: Kemahiran yang boleh digunakan terus dalam peranan awan dan AI  

#### Metrix Kejayaan  
- **Kadar Kejayaan Pelaksanaan**: >95% pelaksanaan berjaya  
- **Masa Penyelesaian Masalah**: <30 minit untuk isu biasa  
- **Pengoptimuman Prestasi**: Penambahbaikan yang dapat dibuktikan dalam kos dan prestasi  
- **Pematuhan Keselamatan**: Semua pelaksanaan memenuhi piawaian keselamatan perusahaan  
- **Pemindahan Pengetahuan**: Kebolehan membimbing pembangun lain  

### Pembelajaran Berterusan dan Penglibatan Komuniti  

#### Kekal Terkini  
- **Kemas Kini Azure**: Ikuti nota pelepasan Azure Developer CLI  
- **Acara Komuniti**: Sertai acara pembangun Azure dan AI  
- **Dokumentasi**: Sumbang kepada dokumentasi dan contoh komuniti  
- **Gelung Maklum Balas**: Beri maklum balas mengenai kandungan kursus dan perkhidmatan Azure  

#### Pembangunan Kerjaya  
- **Rangkaian Profesional**: Berhubung dengan pakar Azure dan AI  
- **Peluang Berucap**: Bentangkan pembelajaran di persidangan atau pertemuan  
- **Sumbangan Sumber Terbuka**: Sumbang kepada templat dan alat AZD  
- **Mentor**: Pandu pembangun lain dalam perjalanan pembelajaran AZD mereka  

---

**Navigasi Bab:**  
- **📚 Laman Utama Kursus**: [AZD For Beginners](../README.md)  
- **📖 Mula Belajar**: [Bab 1: Asas & Permulaan Pantas](../README.md#-chapter-1-foundation--quick-start)  
- **🎯 Jejak Kemajuan**: Jejaki kemajuan anda melalui sistem pembelajaran 8-bab yang komprehensif  
- **🤝 Komuniti**: [Azure Discord](https://discord.gg/microsoft-azure) untuk sokongan dan perbincangan  

**Jejak Kemajuan Pembelajaran:** Gunakan panduan berstruktur ini untuk menguasai Azure Developer CLI melalui pembelajaran praktikal berperingkat dengan hasil yang boleh diukur dan manfaat pembangunan profesional.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau penafsiran yang salah yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->