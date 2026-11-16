# Soalan Lazim (FAQ)

**Dapatkan Bantuan Mengikut Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Isu Pemasangan**: [Bab 1: Pemasangan & Persediaan](../docs/chapter-01-foundation/installation.md)
- **🤖 Soalan AI**: [Bab 2: Pembangunan Fokus AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Penyelesaian Masalah**: [Bab 7: Penyelesaian Masalah & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Pengenalan

FAQ komprehensif ini menyediakan jawapan kepada soalan-soalan yang paling biasa tentang Azure Developer CLI (azd) dan penyebaran Azure. Temui penyelesaian pantas untuk masalah biasa, fahami amalan terbaik, dan dapatkan penjelasan tentang konsep dan aliran kerja azd.

## Matlamat Pembelajaran

Dengan menyemak FAQ ini, anda akan:
- Mendapatkan jawapan pantas kepada soalan dan isu Azure Developer CLI yang biasa
- Memahami konsep utama dan terminologi melalui format soal jawab praktikal
- Mengakses penyelesaian penyelesaian masalah bagi masalah dan senario ralat yang kerap berlaku
- Belajar amalan terbaik melalui soalan biasa mengenai pengoptimuman
- Meneroka ciri dan kemampuan lanjutan melalui soalan tahap pakar
- Merujuk panduan kos, keselamatan, dan strategi penyebaran dengan berkesan

## Hasil Pembelajaran

Dengan merujuk FAQ ini secara berkala, anda akan dapat:
- Menyelesaikan isu Azure Developer CLI biasa secara berdikari menggunakan penyelesaian yang disediakan
- Membuat keputusan yang berinformasi mengenai strategi dan konfigurasi penyebaran
- Memahami hubungan antara azd dan alat serta perkhidmatan Azure lain
- Mengaplikasikan amalan terbaik berdasarkan pengalaman komuniti dan cadangan pakar
- Menyelesaikan masalah pengesahan, penyebaran, dan konfigurasi dengan berkesan
- Mengoptimumkan kos dan prestasi menggunakan pandangan dan cadangan FAQ

## Jadual Kandungan

- [Bermula](#getting-started)
- [Pengesahan & Akses](#authentication--access)
- [Templat & Projek](#templates--projects)
- [Penyebaran & Infrastruktur](#deployment--infrastructure)
- [Konfigurasi & Persekitaran](#configuration--environments)
- [Penyelesaian Masalah](#troubleshooting)
- [Kos & Pengebilan](#cost--billing)
- [Amalan Terbaik](#best-practices)
- [Topik Lanjutan](#advanced-topics)

---

## Bermula

### S: Apakah Azure Developer CLI (azd)?
**J**: Azure Developer CLI (azd) adalah alat baris perintah berfokuskan pembangun yang mempercepat masa yang diambil untuk membawakan aplikasi anda dari persekitaran pembangunan tempatan ke Azure. Ia menyediakan amalan terbaik melalui templat dan membantu dengan keseluruhan kitaran hayat penyebaran.

### S: Bagaimana azd berbeza daripada Azure CLI?
**J**: 
- **Azure CLI**: Alat serba guna untuk mengurus sumber Azure
- **azd**: Alat fokus pembangun untuk aliran kerja penyebaran aplikasi
- azd mempunyai proses pengesahan dan penyebaran sendiri; Azure CLI adalah alat yang berasingan dan pelengkap
- azd termasuk templat, pengurusan persekitaran, dan automasi penyebaran

### S: Adakah saya perlu memasang Azure CLI untuk menggunakan azd?
**J**: Tidak untuk aliran kerja utama AZD. Lakukan pengesahan dengan `azd auth login`. Pasang Azure CLI secara berasingan apabila kaitan templat atau latihan secara eksplisit menjalankan arahan `az`.

### S: Apakah bahasa pengaturcaraan yang disokong oleh azd?
**J**: azd tidak bergantung pada bahasa. Ia berfungsi dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Laman web statik
- Aplikasi berkontena

### S: Bolehkah saya menggunakan azd dengan projek sedia ada?
**J**: Ya! Anda boleh:
1. Gunakan `azd init` untuk menambah konfigurasi azd ke projek sedia ada
2. Sesuaikan projek sedia ada untuk padan dengan struktur templat azd
3. Cipta templat tersuai berdasarkan seni bina anda yang sedia ada

---

## Pengesahan & Akses

### S: Bagaimana saya mengesahkan menggunakan Azure dengan azd?
**J**: Gunakan `azd auth login` yang akan membuka tetingkap pelayar untuk pengesahan Azure. Untuk senario CI/CD, guna service principals atau managed identities.

### S: Bolehkah saya menggunakan azd dengan beberapa langganan Azure?
**J**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan yang digunakan bagi setiap persekitaran.

### S: Apakah kebenaran yang saya perlukan untuk menyebar dengan azd?
**J**: Biasanya anda memerlukan:
- Peranan **Contributor** pada kumpulan sumber atau langganan
- **User Access Administrator** jika menyebar sumber yang memerlukan penugasan peranan
- Kebenaran khusus berbeza mengikut templat dan sumber yang sedang disebar

### S: Bolehkah saya menggunakan azd dalam pipeline CI/CD?
**J**: Sudah tentu! azd direka untuk integrasi CI/CD. Gunakan service principals untuk pengesahan dan tetapkan pembolehubah persekitaran untuk konfigurasi.

### S: Bagaimana saya mengendalikan pengesahan dalam GitHub Actions?
**J**: Pilih beban kerja federasi identiti (OIDC), dikonfigurasikan dengan `azd pipeline config`. Aliran kerja yang dijana memasang AZD dan mengesahkan AZD terus dengan identiti persekutuan. Langkah `azure/login` sahaja tidak menetapkan log masuk AZD. Langkah log masuk dalam tugasan sedia ada adalah:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Sediakan atau sebarkan selepas log masuk, dengan persekitaran AZD yang dimaksudkan, langganan, dan lokasi dikonfigurasikan. Kredensial federasi identiti mesti mempercayai repositori/ref aliran kerja atau persekitaran GitHub, dan peranan Azure-nya mesti membenarkan operasi diminta.

---

## Templat & Projek

### S: Di mana saya boleh dapati templat azd?
**J**: 
- Templat rasmi dan komuniti: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Templat komuniti: Carian GitHub untuk "azd-template"
- Gunakan `azd template list` untuk melayari templat yang tersedia

### S: Bagaimana saya cipta templat tersuai?
**J**: 
1. Mulakan dengan struktur templat sedia ada
2. Ubah `azure.yaml`, fail infrastruktur, dan kod aplikasi
3. Uji dengan teliti menggunakan `azd up`
4. Terbitkan ke GitHub dengan tag yang sesuai

### S: Bolehkah saya gunakan azd tanpa templat?
**J**: Ya, gunakan `azd init` dalam projek sedia ada untuk cipta fail konfigurasi perlu. Anda perlu mengkonfigurasi secara manual `azure.yaml` dan fail infrastruktur.

### S: Apakah perbezaan antara templat rasmi dan komuniti?
**J**: 
- **Templat rasmi**: Diselenggara oleh Microsoft, sering dikemaskini, dokumentasi menyeluruh
- **Templat komuniti**: Dicipta oleh pembangun, mungkin mempunyai kes penggunaan khusus, kualiti dan penyelenggaraan berbeza-beza

### S: Bagaimana saya kemaskini templat dalam projek saya?
**J**: Templat tidak dikemaskini secara automatik. Anda boleh:
1. Banding dan gabungkan perubahan dari templat asal secara manual
2. Mulakan baru dengan `azd init` menggunakan templat yang dikemaskini
3. Pilih penambahbaikan tertentu dari templat yang dikemaskini

---

## Penyebaran & Infrastruktur

### S: Apakah perkhidmatan Azure yang boleh azd sebarkan?
**J**: azd boleh menyebarkan mana-mana perkhidmatan Azure melalui templat Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Pangkalan data (SQL, PostgreSQL, Cosmos DB)
- Penyimpanan, Key Vault, Application Insights
- Rangkaian, keselamatan, dan sumber pemantauan

### S: Bolehkah saya menyebar ke pelbagai rantau?
**J**: Ya, konfigurasikan beberapa rantau dalam templat Bicep anda dan tetapkan parameter lokasi dengan sesuai untuk setiap persekitaran.

### S: Bagaimana saya mengendalikan migrasi skema pangkalan data?
**J**: Gunakan kait penyebaran dalam `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Bolehkah saya menyebarkan hanya infrastruktur tanpa aplikasi?
**J**: Ya, gunakan `azd provision` untuk menyebarkan hanya komponen infrastruktur yang ditakrifkan dalam templat anda.

### S: Bagaimana saya menyebarkan ke sumber Azure yang sedia ada?
**J**: Ya, apabila templat menyokongnya. Rujuk sumber sedia ada dengan deklarasi `existing` Bicep atau parameter sumber-sedia-ada templat yang didokumenkan, dan padankan perkhidmatan aplikasi ke sasaran yang dimaksudkan. Ini tidak mengimport hak milik atau secara automatik mencipta kebenaran hilang. Semak templat sebelum menyebar.

### S: Bolehkah saya menggunakan Terraform sebagai ganti Bicep?
**J**: Ya. AZD menyokong Terraform serta Bicep. Pilih templat berasaskan Terraform atau konfigurasikan `infra.provider: terraform` dalam `azure.yaml`, dengan fail Terraform dan konfigurasi state/backend yang sesuai. Lihat [aliran kerja Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasi & Persekitaran

### S: Bagaimana saya uruskan persekitaran berbeza (dev, staging, prod)?
**J**: Cipta persekitaran berasingan dengan `azd env new <environment-name>` dan konfigurasikan tetapan berbeza untuk masing-masing:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Di mana konfigurasi persekitaran disimpan?
**J**: Di dalam folder `.azure` dalam direktori projek anda. Setiap persekitaran mempunyai folder sendiri dengan fail konfigurasi.

### S: Bagaimana saya tetapkan konfigurasi khusus persekitaran?
**J**: Gunakan `azd env set` untuk konfigurasi pembolehubah persekitaran:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Bolehkah saya kongsi konfigurasi persekitaran dengan ahli pasukan?
**J**: Folder `.azure` mengandungi maklumat sensitif dan tidak seharusnya dikomit ke kawalan versi. Sebaliknya:
1. Dokumenkan pembolehubah persekitaran diperlukan
2. Gunakan skrip penyebaran untuk sediakan persekitaran
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### S: Bagaimana saya mengatasi tetapan lalai templat?
**J**: Tetapkan pembolehubah persekitaran yang sepadan dengan parameter templat:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Hanya pembolehubah yang digunakan oleh templat mempengaruhi penyebaran. `SKU_NAME` di atas adalah contoh input tersuai, bukan tetapan AZD sejagat.

---

## Penyelesaian Masalah

### S: Kenapa `azd up` gagal?
**J**: Punca biasa:
1. **Isu pengesahan**: Jalankan `azd auth login`
2. **Kebenaran tidak mencukupi**: Semak tugasan peranan Azure anda
3. **Pertindihan penamaan sumber**: Semak sumber bertindih dan input penamaan templat; cipta persekitaran berasingan dengan `azd env new` apabila pengasingan diperlukan
4. **Isu kuota/kapasiti**: Semak ketersediaan serantau
5. **Ralat templat**: Sahkan templat Bicep

### S: Bagaimana saya debug kegagalan penyebaran?
**J**: 
1. Gunakan `azd deploy --debug` untuk keluaran terperinci
2. Semak sejarah penyebaran di portal Azure
3. Semak Log Aktiviti di portal Azure
4. Gunakan `azd show` untuk paparkan keadaan persekitaran terkini

### S: Kenapa pembolehubah persekitaran saya tidak berfungsi?
**J**: Semak:
1. Nama pembolehubah tepat sepadan parameter templat
2. Nilai dikutip dengan betul jika mengandungi ruang
3. Persekitaran telah dipilih: `azd env select <environment>`
4. Pembolehubah ditetapkan dalam persekitaran yang betul

### S: Bagaimana saya bersihkan penyebaran yang gagal?
**J**: 
```bash
azd down
```
Semak persekitaran yang dipilih dan pengesahan penghapusan terlebih dahulu. Ini memadam sumber Azure yang telah disediakan, bukan konfigurasi persekitaran `.azure` tempatan. `--purge` juga meminta penghapusan kekal bagi sumber soft-deleted yang disokong dan boleh disekat oleh perlindungan simpanan/pembuangan; ia bukan langkah pemulihan rutin.

### S: Kenapa aplikasi saya tidak boleh diakses selepas penyebaran?
**J**: Semak:
1. Penyebaran berjaya diselesaikan
2. Aplikasi sedang berjalan (semak log dalam portal Azure)
3. Kumpulan keselamatan rangkaian membenarkan trafik
4. DNS/domain tersuai dikonfigurasikan dengan betul

---

## Kos & Pengebilan

### S: Berapa kos penyebaran azd?
**J**: Kos bergantung pada:
- Perkhidmatan Azure yang disebar
- Tahap Perkhidmatan/SKU yang dipilih
- Perbezaan harga serantau
- Corak penggunaan

Gunakan [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/) untuk anggaran.

### S: Bagaimana saya kawal kos dalam penyebaran azd?
**J**: 
1. Gunakan SKU tahap rendah untuk persekitaran pembangunan
2. Tetapkan bajet dan amaran Azure
3. Gunakan `azd down` untuk alih keluar sumber apabila tidak diperlukan
4. Pilih rantau yang sesuai (kos berbeza mengikut lokasi)
5. Gunakan alat Pengurusan Kos Azure

### S: Adakah terdapat pilihan tahap percuma untuk templat azd?
**J**: Sesetengah perkhidmatan mempunyai SKU percuma atau pemberian bulanan, tertakluk pada kelayakan, pelan hosting, rantau, dan had langganan. Ini tidak menjadikan keseluruhan templat percuma: pangkalan data, carian, rangkaian, registry, telemetri, dan inferens model boleh mengenakan caj secara berasingan. Semak [senarai perkhidmatan percuma Azure](https://azure.microsoft.com/free/) dan harga terkini setiap sumber sebelum penyebaran.

### S: Bagaimana saya anggarkan kos sebelum penyebaran?
**J**: 
1. Semak `main.bicep` templat untuk lihat sumber yang dicipta
2. Gunakan Kalkulator Harga Azure dengan SKU khusus
3. Sebar ke persekitaran pembangunan terlebih dahulu untuk pantau kos sebenar
4. Gunakan Pengurusan Kos Azure untuk analisis kos terperinci

---

## Amalan Terbaik

### S: Apakah amalan terbaik untuk struktur projek azd?
**J**: 
1. Pisahkan kod aplikasi daripada infrastruktur
2. Gunakan nama perkhidmatan yang bermakna dalam `azure.yaml`
3. Laksanakan pengendalian ralat yang betul dalam skrip binaan
4. Gunakan konfigurasi khusus persekitaran
5. Sertakan dokumentasi menyeluruh

### S: Bagaimana saya susun pelbagai perkhidmatan dalam azd?
**J**: Gunakan struktur yang disyorkan:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### S: Haruskah saya komit folder `.azure` ke kawalan versi?
**J**: **Tidak!** Folder `.azure` mengandungi maklumat sensitif. Tambahkan ia ke `.gitignore`:
```gitignore
.azure/
```

### S: Bagaimana saya mengendalikan rahsia dan konfigurasi sensitif?
**J**: 
1. Gunakan Azure Key Vault untuk rahsia
2. Rujuk rahsia Key Vault dalam konfigurasi aplikasi
3. Jangan sekali-kali komit rahsia ke kawalan versi
4. Gunakan identiti terurus untuk pengesahan servis-ke-servis

### S: Apakah pendekatan yang disyorkan untuk CI/CD dengan azd?
**J**:
1. Gunakan persekitaran berasingan untuk setiap peringkat (dev/staging/prod)
2. Laksanakan ujian automatik sebelum penyebaran
3. Gunakan prinsipal servis untuk pengesahan
4. Simpan konfigurasi sensitif dalam rahsia/pembolehubah pipeline
5. Laksanakan pintu kelulusan untuk penyebaran produksi

---

## Topik Lanjutan

### S: Bolehkah saya mengembangkan azd dengan fungsi tersuai?
**J**: Ya, melalui kait penyebaran dalam `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Bagaimana saya mengintegrasikan azd dengan proses DevOps yang sedia ada?
**J**: 
1. Gunakan arahan azd dalam skrip pipeline sedia ada
2. Standardkan templat azd merentasi pasukan
3. Integrasikan dengan pemantauan dan amaran sedia ada
4. Gunakan keluaran JSON azd untuk integrasi pipeline

### S: Bolehkah saya menggunakan azd dengan Azure DevOps?
**J**: Ya, azd berfungsi dengan mana-mana sistem CI/CD. Buat pipeline Azure DevOps yang menggunakan arahan azd.

### S: Bagaimana saya menyumbang kepada azd atau membuat templat komuniti?
**J**: 
1. **alat azd**: Sumbang ke [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templat**: Ikuti [arahan penyumbangan galeri Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentasi**: Sumbang kepada docs di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### S: Apakah peta jalan untuk azd?
**J**: Semak [peta jalan rasmi](https://github.com/Azure/azure-dev/projects) untuk ciri dan penambahbaikan yang dirancang.

### S: Bagaimana saya berhijrah dari alat penyebaran lain ke azd?
**J**: 
1. Analisis seni bina penyebaran semasa
2. Buat templat Bicep yang setara
3. Konfigurasikan `azure.yaml` untuk padankan servis semasa
4. Uji dengan teliti dalam persekitaran pembangunan
5. Hijrahkan persekitaran secara berperingkat

---

## Masih Ada Soalan?

### **Cari Dahulu**
- Semak [dokumentasi rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cari [isu GitHub](https://github.com/Azure/azure-dev/issues) untuk masalah serupa

### **Dapatkan Bantuan**
- [Perbincangan GitHub](https://github.com/Azure/azure-dev/discussions) - Sokongan komuniti
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Soalan teknikal
- [Azure Discord](https://discord.gg/azure) - Sembang komuniti masa nyata

### **Laporkan Isu**
- [Isu GitHub](https://github.com/Azure/azure-dev/issues/new) - Laporan pepijat dan permintaan ciri
- Sertakan log, mesej ralat, dan langkah untuk mengulang

### **Pelajari Lebih Lanjut**
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Panduan teknikal disemak: 4 November 2026. Ketersediaan awan dan harga mesti disemak untuk langganan dan rantau anda.*

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Glosari](glossary.md)
- **Pelajaran Seterusnya**: [Panduan Kajian](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->