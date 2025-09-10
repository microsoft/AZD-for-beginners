<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:30:11+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "ms"
}
-->
# Panduan Pembelajaran - AZD Untuk Pemula

## Pengenalan

Panduan pembelajaran yang komprehensif ini menyediakan objektif pembelajaran yang terstruktur, konsep utama, latihan praktikal, dan bahan penilaian untuk membantu anda menguasai Azure Developer CLI (azd). Gunakan panduan ini untuk menjejaki kemajuan anda dan memastikan anda telah meliputi semua topik penting.

## Matlamat Pembelajaran

Dengan melengkapkan panduan pembelajaran ini, anda akan:
- Menguasai semua konsep asas dan lanjutan Azure Developer CLI
- Membangunkan kemahiran praktikal dalam melaksanakan dan mengurus aplikasi Azure
- Membina keyakinan dalam menyelesaikan masalah dan mengoptimumkan pelaksanaan
- Memahami amalan pelaksanaan bersedia untuk produksi dan pertimbangan keselamatan

## Hasil Pembelajaran

Selepas melengkapkan semua bahagian panduan pembelajaran ini, anda akan dapat:
- Merancang, melaksanakan, dan mengurus seni bina aplikasi lengkap menggunakan azd
- Melaksanakan strategi pemantauan, keselamatan, dan pengoptimuman kos yang menyeluruh
- Menyelesaikan masalah pelaksanaan yang kompleks secara berdikari
- Mencipta templat tersuai dan menyumbang kepada komuniti azd

## Struktur Kursus

### Modul 1: Memulakan (Minggu 1-2)

#### Objektif Pembelajaran
- Memahami asas dan konsep utama Azure Developer CLI
- Berjaya memasang dan mengkonfigurasi azd pada persekitaran pembangunan anda
- Melengkapkan pelaksanaan pertama anda menggunakan templat sedia ada
- Menavigasi struktur projek azd dan memahami komponen utama

#### Konsep Utama untuk Dikuasai
- Templat, persekitaran, dan perkhidmatan
- Struktur konfigurasi azure.yaml
- Perintah asas azd (init, up, down, deploy)
- Prinsip Infrastruktur sebagai Kod
- Pengesahan dan kebenaran Azure

#### Latihan Praktikal

**Latihan 1.1: Pemasangan dan Persediaan**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Latihan 1.2: Pelaksanaan Pertama**  
```bash
# Deploy a simple web application:
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
1. Apakah tiga konsep utama seni bina azd?
2. Apakah tujuan fail azure.yaml?
3. Bagaimana persekitaran membantu mengurus sasaran pelaksanaan yang berbeza?
4. Apakah kaedah pengesahan yang boleh digunakan dengan azd?
5. Apa yang berlaku apabila anda menjalankan `azd up` buat kali pertama?

### Modul 2: Konfigurasi dan Persekitaran (Minggu 3)

#### Objektif Pembelajaran
- Menguasai pengurusan dan konfigurasi persekitaran
- Memahami konfigurasi azure.yaml yang lanjutan
- Melaksanakan tetapan dan pembolehubah khusus persekitaran
- Mengkonfigurasi pengesahan untuk senario yang berbeza

#### Konsep Utama untuk Dikuasai
- Hierarki persekitaran dan keutamaan pembolehubah
- Konfigurasi perkhidmatan dan parameter
- Hooks dan acara kitaran hayat
- Kaedah pengesahan (pengguna, service principal, identiti terurus)
- Pengurusan fail konfigurasi

#### Latihan Praktikal

**Latihan 2.1: Persediaan Multi-Persekitaran**  
```bash
# Create and configure multiple environments:
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
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Soalan Penilaian Kendiri
1. Bagaimana azd mengendalikan keutamaan pembolehubah persekitaran?
2. Apakah hooks pelaksanaan dan bila anda patut menggunakannya?
3. Bagaimana anda mengkonfigurasi SKU yang berbeza untuk persekitaran yang berbeza?
4. Apakah implikasi keselamatan kaedah pengesahan yang berbeza?
5. Bagaimana anda mengurus rahsia dan data konfigurasi sensitif?

### Modul 3: Pelaksanaan dan Penyediaan (Minggu 4)

#### Objektif Pembelajaran
- Menguasai aliran kerja pelaksanaan dan amalan terbaik
- Memahami Infrastruktur sebagai Kod dengan templat Bicep
- Melaksanakan seni bina multi-perkhidmatan yang kompleks
- Mengoptimumkan prestasi dan kebolehpercayaan pelaksanaan

#### Konsep Utama untuk Dikuasai
- Struktur templat Bicep dan modul
- Kebergantungan sumber dan penjadualan
- Strategi pelaksanaan (blue-green, rolling updates)
- Pelaksanaan multi-region
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Latihan 3.3: Integrasi Pangkalan Data**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Soalan Penilaian Kendiri
1. Apakah kelebihan menggunakan Bicep berbanding templat ARM?
2. Bagaimana anda mengendalikan migrasi pangkalan data dalam pelaksanaan azd?
3. Apakah strategi yang wujud untuk pelaksanaan tanpa henti?
4. Bagaimana anda mengurus kebergantungan antara perkhidmatan?
5. Apakah pertimbangan untuk pelaksanaan multi-region?

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
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Latihan 4.2: Pengesahan Pra-Pelaksanaan**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Latihan 4.3: Pengoptimuman SKU**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Soalan Penilaian Kendiri
1. Faktor apa yang harus mempengaruhi keputusan pemilihan SKU?
2. Bagaimana anda mengesahkan ketersediaan sumber Azure sebelum pelaksanaan?
3. Apakah komponen utama sistem pemeriksaan pra-pelaksanaan?
4. Bagaimana anda menganggarkan dan mengawal kos pelaksanaan?
5. Pemantauan apa yang penting untuk perancangan kapasiti?

### Modul 5: Penyelesaian Masalah dan Debugging (Minggu 6)

#### Objektif Pembelajaran
- Menguasai metodologi penyelesaian masalah yang sistematik
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
- Menguasai integrasi dan automasi CI/CD
- Membangunkan templat tersuai dan menyumbang kepada komuniti
- Memahami keperluan keselamatan dan pematuhan yang lanjutan

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
- Saluran pelaksanaan automatik  

**Hasil**:
- Laman web berfungsi yang dilaksanakan di Azure
- Templat azd tersuai untuk pelaksanaan portfolio
- Dokumentasi proses pelaksanaan
- Cadangan analisis dan pengoptimuman kos  

### Projek 2: Aplikasi Pengurusan Tugas  
**Kerumitan**: Pertengahan  
**Tempoh**: 2-3 minggu  

Cipta aplikasi pengurusan tugas full-stack dengan:
- Frontend React dilaksanakan ke App Service
- Backend API Node.js dengan pengesahan
- Pangkalan data PostgreSQL dengan migrasi
- Pemantauan Application Insights  

**Hasil**:
- Aplikasi lengkap dengan pengesahan pengguna
- Skrip skema pangkalan data dan migrasi
- Papan pemantauan dan peraturan amaran
- Konfigurasi pelaksanaan multi-persekitaran  

### Projek 3: Platform E-dagang Mikroservis  
**Kerumitan**: Lanjutan  
**Tempoh**: 4-6 minggu  

Reka bentuk dan laksanakan platform e-dagang berasaskan mikroservis:
- Pelbagai perkhidmatan API (katalog, pesanan, pembayaran, pengguna)
- Integrasi antrian mesej dengan Service Bus
- Cache Redis untuk pengoptimuman prestasi
- Log dan pemantauan yang menyeluruh  

**Hasil**:
- Seni bina mikroservis lengkap
- Corak komunikasi antara perkhidmatan
- Ujian prestasi dan pengoptimuman
- Pelaksanaan keselamatan bersedia untuk produksi  

## Penilaian dan Pensijilan

### Pemeriksaan Pengetahuan

Lengkapkan penilaian ini selepas setiap modul:

**Penilaian Modul 1**: Konsep asas dan pemasangan  
- Soalan pilihan berganda tentang konsep utama  
- Tugas pemasangan dan konfigurasi praktikal  
- Latihan pelaksanaan ringkas  

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
- Pelaksanaan saluran pengesahan  

**Penilaian Modul 5**: Penyelesaian masalah dan debugging  
- Latihan diagnosis masalah  
- Tugas pelaksanaan pemantauan  
- Simulasi tindak balas insiden  

**Penilaian Modul 6**: Topik lanjutan  
- Reka bentuk saluran CI/CD  
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
- **Minggu 11-12**: Modul 4 (Pengesahan Pra-Pelaksanaan)  
- **Minggu 13-14**: Modul 5 (Penyelesaian Masalah dan Debugging)  
- **Minggu 15-16**: Modul 6 (Topik Lanjutan dan Penilaian)  

### Pembelajaran Mengikut Kadar Sendiri
- Lengkapkan setiap modul mengikut kadar anda sendiri  
- Luangkan masa tambahan pada konsep yang mencabar  
- Ulangi latihan sehingga anda mencapai penguasaan  
- Sertai perbincangan komuniti dan ajukan soalan  

## Petua Kejayaan

### Strategi Pembelajaran Berkesan
1. **Berlatih Secara Berkala**: Laksanakan aplikasi dengan kerap untuk membina ingatan otot  
2. **Bereksperimen Tanpa Ragu**: Gunakan persekitaran pembangunan untuk mencuba konfigurasi baharu  
3. **Dokumentasikan Pembelajaran Anda**: Simpan nota tentang penyelesaian masalah yang anda hadapi  
4. **Sertai Komuniti**: Sertai perbincangan dan sumbang kepada projek  
5. **Sentiasa Terkini**: Ikuti kemas kini Azure dan ciri azd baharu  

### Kesilapan Biasa untuk Dielakkan
1. **Mengabaikan Prasyarat**: Pastikan anda mempunyai pengetahuan asas yang betul  
2. **Tergesa-gesa Melalui Konsep**: Luangkan masa untuk memahami asas dengan teliti  
3. **Mengabaikan Keselamatan**: Sentiasa laksanakan amalan keselamatan terbaik dari awal  
4. **Tidak Menguji Secara Menyeluruh**: Uji pelaksanaan dalam pelbagai persekitaran  
5. **Mengabaikan Dokumentasi**: Dokumentasi yang baik adalah penting untuk penyelenggaraan  

### Membina Pengalaman Praktikal
1. **Mulakan Kecil**: Mulakan dengan aplikasi mudah dan tingkatkan kerumitan secara beransur-ansur  
2. **Belajar Dari Kegagalan**: Gunakan latihan penyelesaian masalah sebagai peluang pembelajaran  
3. **Sumbangkan kepada Sumber Terbuka**: Kongsi templat dan penyelesaian anda dengan komuniti  
4. **Ajarkan Orang Lain**: Menerangkan konsep kepada orang lain mengukuhkan pemahaman anda sendiri  
5. **Teruskan Rasa Ingin Tahu**: Sentiasa teroka perkhidmatan Azure baharu dan corak integrasi  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [FAQ](faq.md)  
- **Pelajaran Seterusnya**: [Changelog](../changelog.md)  

**Penjejakan Kemajuan Pembelajaran**: Gunakan panduan ini untuk menjejaki perjalanan pembelajaran anda dan memastikan liputan menyeluruh semua konsep dan amalan Azure Developer CLI.  

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.