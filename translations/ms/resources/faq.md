# Soalan Lazim (FAQ)

**Dapatkan Bantuan Mengikut Bab**
- **📚 Halaman Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Masalah Pemasangan**: [Bab 1: Pemasangan & Persediaan](../docs/getting-started/installation.md)
- **🤖 Soalan AI**: [Bab 2: Pembangunan Berasaskan AI](../docs/ai-foundry/azure-ai-foundry-integration.md)
- **🔧 Penyelesaian Masalah**: [Bab 7: Penyelesaian Masalah & Debugging](../docs/troubleshooting/common-issues.md)

## Pengenalan

FAQ yang komprehensif ini menyediakan jawapan kepada soalan-soalan yang paling biasa tentang Azure Developer CLI (azd) dan pengurusan Azure. Dapatkan penyelesaian pantas untuk masalah biasa, fahami amalan terbaik, dan dapatkan penjelasan tentang konsep serta aliran kerja azd.

## Matlamat Pembelajaran

Dengan menyemak FAQ ini, anda akan:
- Menemui jawapan pantas kepada soalan dan isu Azure Developer CLI yang biasa
- Memahami konsep dan istilah utama melalui format soal jawab yang praktikal
- Mengakses penyelesaian masalah untuk senario kesilapan yang kerap
- Mempelajari amalan terbaik melalui soalan lazim tentang pengoptimuman
- Menemui ciri dan keupayaan lanjutan melalui soalan tahap pakar
- Merujuk panduan kos, keselamatan, dan strategi pengurusan dengan cekap

## Hasil Pembelajaran

Dengan rujukan kerap kepada FAQ ini, anda akan dapat:
- Menyelesaikan isu Azure Developer CLI yang biasa secara berdikari menggunakan penyelesaian yang disediakan
- Membuat keputusan yang bijak tentang strategi dan konfigurasi pengurusan
- Memahami hubungan antara azd dan alat serta perkhidmatan Azure lain
- Mengaplikasikan amalan terbaik berdasarkan pengalaman komuniti dan cadangan pakar
- Menyelesaikan masalah pengesahan, pengurusan, dan konfigurasi dengan berkesan
- Mengoptimumkan kos dan prestasi menggunakan pandangan serta cadangan FAQ

## Kandungan

- [Memulakan](../../../resources)
- [Pengesahan & Akses](../../../resources)
- [Templat & Projek](../../../resources)
- [Pengurusan & Infrastruktur](../../../resources)
- [Konfigurasi & Persekitaran](../../../resources)
- [Penyelesaian Masalah](../../../resources)
- [Kos & Pengebilan](../../../resources)
- [Amalan Terbaik](../../../resources)
- [Topik Lanjutan](../../../resources)

---

## Memulakan

### S: Apa itu Azure Developer CLI (azd)?
**J**: Azure Developer CLI (azd) ialah alat baris perintah yang berpusatkan pembangun yang mempercepatkan masa untuk membawa aplikasi anda dari persekitaran pembangunan tempatan ke Azure. Ia menyediakan amalan terbaik melalui templat dan membantu dengan keseluruhan kitaran hayat pengurusan.

### S: Bagaimana azd berbeza daripada Azure CLI?
**J**: 
- **Azure CLI**: Alat tujuan umum untuk mengurus sumber Azure
- **azd**: Alat berfokuskan pembangun untuk aliran kerja pengurusan aplikasi
- azd menggunakan Azure CLI secara dalaman tetapi menyediakan abstraksi tahap tinggi untuk senario pembangunan biasa
- azd termasuk templat, pengurusan persekitaran, dan automasi pengurusan

### S: Adakah saya perlu memasang Azure CLI untuk menggunakan azd?
**J**: Ya, azd memerlukan Azure CLI untuk pengesahan dan beberapa operasi. Pasang Azure CLI terlebih dahulu, kemudian pasang azd.

### S: Bahasa pengaturcaraan apa yang disokong oleh azd?
**J**: azd tidak bergantung kepada bahasa tertentu. Ia berfungsi dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Laman web statik
- Aplikasi yang dikontainerkan

### S: Bolehkah saya menggunakan azd dengan projek sedia ada?
**J**: Ya! Anda boleh:
1. Gunakan `azd init` untuk menambah konfigurasi azd kepada projek sedia ada
2. Menyesuaikan projek sedia ada agar sesuai dengan struktur templat azd
3. Membuat templat tersuai berdasarkan seni bina sedia ada anda

---

## Pengesahan & Akses

### S: Bagaimana saya mengesahkan dengan Azure menggunakan azd?
**J**: Gunakan `azd auth login` yang akan membuka tetingkap pelayar untuk pengesahan Azure. Untuk senario CI/CD, gunakan prinsipal perkhidmatan atau identiti terurus.

### S: Bolehkah saya menggunakan azd dengan beberapa langganan Azure?
**J**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan yang akan digunakan bagi setiap persekitaran.

### S: Apakah kebenaran yang saya perlukan untuk mengurus dengan azd?
**J**: Biasanya anda memerlukan:
- Peranan **Contributor** pada kumpulan sumber atau langganan
- **User Access Administrator** jika mengurus sumber yang memerlukan tugasan peranan
- Kebenaran tertentu bergantung pada templat dan sumber yang diuruskan

### S: Bolehkah saya menggunakan azd dalam saluran CI/CD?
**J**: Sudah tentu! azd direka untuk integrasi CI/CD. Gunakan prinsipal perkhidmatan untuk pengesahan dan tetapkan pembolehubah persekitaran untuk konfigurasi.

### S: Bagaimana saya mengendalikan pengesahan dalam GitHub Actions?
**J**: Gunakan tindakan Azure Login dengan kelayakan prinsipal perkhidmatan:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templat & Projek

### S: Di mana saya boleh mencari templat azd?
**J**: 
- Templat rasmi: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Templat komuniti: Cari di GitHub untuk "azd-template"
- Gunakan `azd template list` untuk melihat templat yang tersedia

### S: Bagaimana saya membuat templat tersuai?
**J**: 
1. Mulakan dengan struktur templat sedia ada
2. Ubah suai `azure.yaml`, fail infrastruktur, dan kod aplikasi
3. Uji dengan teliti menggunakan `azd up`
4. Terbitkan ke GitHub dengan tag yang sesuai

### S: Bolehkah saya menggunakan azd tanpa templat?
**J**: Ya, gunakan `azd init` dalam projek sedia ada untuk membuat fail konfigurasi yang diperlukan. Anda perlu mengkonfigurasi `azure.yaml` dan fail infrastruktur secara manual.

### S: Apakah perbezaan antara templat rasmi dan komuniti?
**J**: 
- **Templat rasmi**: Diselenggara oleh Microsoft, dikemas kini secara berkala, dokumentasi yang komprehensif
- **Templat komuniti**: Dicipta oleh pembangun, mungkin mempunyai kes penggunaan khusus, kualiti dan penyelenggaraan yang berbeza-beza

### S: Bagaimana saya mengemas kini templat dalam projek saya?
**J**: Templat tidak dikemas kini secara automatik. Anda boleh:
1. Membandingkan dan menggabungkan perubahan secara manual dari templat sumber
2. Memulakan semula dengan `azd init` menggunakan templat yang dikemas kini
3. Memilih perubahan tertentu dari templat yang dikemas kini

---

## Pengurusan & Infrastruktur

### S: Perkhidmatan Azure apa yang boleh diuruskan oleh azd?
**J**: azd boleh menguruskan mana-mana perkhidmatan Azure melalui templat Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Pangkalan data (SQL, PostgreSQL, Cosmos DB)
- Penyimpanan, Key Vault, Application Insights
- Sumber rangkaian, keselamatan, dan pemantauan

### S: Bolehkah saya menguruskan ke beberapa wilayah?
**J**: Ya, konfigurasikan beberapa wilayah dalam templat Bicep anda dan tetapkan parameter lokasi dengan sesuai untuk setiap persekitaran.

### S: Bagaimana saya mengendalikan migrasi skema pangkalan data?
**J**: Gunakan cangkuk pengurusan dalam `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Bolehkah saya menguruskan hanya infrastruktur tanpa aplikasi?
**J**: Ya, gunakan `azd provision` untuk menguruskan hanya komponen infrastruktur yang ditentukan dalam templat anda.

### S: Bagaimana saya menguruskan ke sumber Azure sedia ada?
**J**: Ini adalah kompleks dan tidak disokong secara langsung. Anda boleh:
1. Mengimport sumber sedia ada ke dalam templat Bicep anda
2. Menggunakan rujukan sumber sedia ada dalam templat
3. Mengubah suai templat untuk secara bersyarat mencipta atau merujuk sumber

### S: Bolehkah saya menggunakan Terraform sebagai ganti Bicep?
**J**: Pada masa ini, azd terutamanya menyokong templat Bicep/ARM. Sokongan Terraform tidak tersedia secara rasmi, walaupun penyelesaian komuniti mungkin wujud.

---

## Konfigurasi & Persekitaran

### S: Bagaimana saya menguruskan persekitaran yang berbeza (dev, staging, prod)?
**J**: Buat persekitaran berasingan dengan `azd env new <environment-name>` dan konfigurasikan tetapan yang berbeza untuk setiap satu:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Di mana konfigurasi persekitaran disimpan?
**J**: Dalam folder `.azure` dalam direktori projek anda. Setiap persekitaran mempunyai folder sendiri dengan fail konfigurasi.

### S: Bagaimana saya menetapkan konfigurasi khusus persekitaran?
**J**: Gunakan `azd env set` untuk mengkonfigurasi pembolehubah persekitaran:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Bolehkah saya berkongsi konfigurasi persekitaran dengan ahli pasukan?
**J**: Folder `.azure` mengandungi maklumat sensitif dan tidak boleh dikomit ke kawalan versi. Sebaliknya:
1. Dokumentasikan pembolehubah persekitaran yang diperlukan
2. Gunakan skrip pengurusan untuk menyediakan persekitaran
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### S: Bagaimana saya mengatasi tetapan lalai templat?
**J**: Tetapkan pembolehubah persekitaran yang sepadan dengan parameter templat:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Penyelesaian Masalah

### S: Mengapa `azd up` gagal?
**J**: Punca biasa:
1. **Masalah pengesahan**: Jalankan `azd auth login`
2. **Kebenaran tidak mencukupi**: Periksa tugasan peranan Azure anda
3. **Konflik penamaan sumber**: Tukar AZURE_ENV_NAME
4. **Isu kuota/kapasiti**: Periksa ketersediaan wilayah
5. **Kesilapan templat**: Sahkan templat Bicep

### S: Bagaimana saya menyelesaikan kegagalan pengurusan?
**J**: 
1. Gunakan `azd deploy --debug` untuk output terperinci
2. Periksa sejarah pengurusan di portal Azure
3. Semak Log Aktiviti di portal Azure
4. Gunakan `azd show` untuk memaparkan keadaan persekitaran semasa

### S: Mengapa pembolehubah persekitaran saya tidak berfungsi?
**J**: Periksa:
1. Nama pembolehubah sepadan dengan parameter templat dengan tepat
2. Nilai diquote dengan betul jika mengandungi ruang
3. Persekitaran dipilih: `azd env select <environment>`
4. Pembolehubah ditetapkan dalam persekitaran yang betul

### S: Bagaimana saya membersihkan pengurusan yang gagal?
**J**: 
```bash
azd down --force --purge
```
Ini akan menghapuskan semua sumber dan konfigurasi persekitaran.

### S: Mengapa aplikasi saya tidak boleh diakses selepas pengurusan?
**J**: Periksa:
1. Pengurusan selesai dengan berjaya
2. Aplikasi berjalan (semak log di portal Azure)
3. Kumpulan keselamatan rangkaian membenarkan trafik
4. DNS/domain tersuai dikonfigurasikan dengan betul

---

## Kos & Pengebilan

### S: Berapa kos pengurusan azd?
**J**: Kos bergantung pada:
- Perkhidmatan Azure yang diuruskan
- Tahap perkhidmatan/SKU yang dipilih
- Perbezaan harga wilayah
- Corak penggunaan

Gunakan [Kalkulator Harga Azure](https://azure.microsoft.com/pricing/calculator/) untuk anggaran.

### S: Bagaimana saya mengawal kos dalam pengurusan azd?
**J**: 
1. Gunakan SKU tahap rendah untuk persekitaran pembangunan
2. Tetapkan bajet dan amaran Azure
3. Gunakan `azd down` untuk menghapuskan sumber apabila tidak diperlukan
4. Pilih wilayah yang sesuai (kos berbeza mengikut lokasi)
5. Gunakan alat Pengurusan Kos Azure

### S: Adakah terdapat pilihan tier percuma untuk templat azd?
**J**: Banyak perkhidmatan Azure menawarkan tier percuma:
- App Service: Tier percuma tersedia
- Azure Functions: 1 juta eksekusi percuma/bulan
- Cosmos DB: Tier percuma dengan 400 RU/s
- Application Insights: 5GB pertama/bulan percuma

Konfigurasikan templat untuk menggunakan tier percuma di mana tersedia.

### S: Bagaimana saya menganggarkan kos sebelum pengurusan?
**J**: 
1. Semak `main.bicep` templat untuk melihat sumber yang dibuat
2. Gunakan Kalkulator Harga Azure dengan SKU tertentu
3. Uruskan ke persekitaran pembangunan terlebih dahulu untuk memantau kos sebenar
4. Gunakan Pengurusan Kos Azure untuk analisis kos terperinci

---

## Amalan Terbaik

### S: Apakah amalan terbaik untuk struktur projek azd?
**J**: 
1. Pisahkan kod aplikasi daripada infrastruktur
2. Gunakan nama perkhidmatan yang bermakna dalam `azure.yaml`
3. Laksanakan pengendalian kesilapan yang betul dalam skrip binaan
4. Gunakan konfigurasi khusus persekitaran
5. Sertakan dokumentasi yang komprehensif

### S: Bagaimana saya harus mengaturkan pelbagai perkhidmatan dalam azd?
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

### S: Perlukah saya mengkomit folder `.azure` ke kawalan versi?
**J**: **Tidak!** Folder `.azure` mengandungi maklumat sensitif. Tambahkan ke `.gitignore`:
```gitignore
.azure/
```

### S: Bagaimana saya mengendalikan rahsia dan konfigurasi sensitif?
**J**: 
1. Gunakan Azure Key Vault untuk rahsia
2. Rujuk rahsia Key Vault dalam konfigurasi aplikasi
3. Jangan sekali-kali mengkomit rahsia ke kawalan versi
4. Gunakan identiti terurus untuk pengesahan antara perkhidmatan

### S: Apakah pendekatan yang disyorkan untuk CI/CD dengan azd?
**J**: 
1. Gunakan persekitaran berasingan untuk setiap peringkat (dev/staging/prod)
2. Laksanakan ujian automatik sebelum pengurusan
3. Gunakan prinsipal perkhidmatan untuk pengesahan
4. Simpan konfigurasi sensitif dalam rahsia/pembolehubah saluran
5. Laksanakan pintu kelulusan untuk pengurusan pengeluaran

---

## Topik Lanjutan

### S: Bolehkah saya melanjutkan azd dengan fungsi tersuai?
**J**: Ya, melalui cangkuk pengurusan dalam `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Bagaimana saya mengintegrasikan azd dengan proses DevOps sedia ada?
**J**: 
1. Gunakan arahan azd dalam skrip saluran sedia ada
2. Standardkan templat azd di seluruh pasukan
3. Integrasikan dengan pemantauan dan amaran sedia ada
4. Gunakan output JSON azd untuk integrasi saluran

### S: Bolehkah saya menggunakan azd dengan Azure DevOps?
**J**: Ya, azd berfungsi dengan mana-mana sistem CI/CD. Buat saluran Azure DevOps yang menggunakan arahan azd.

### S: Bagaimana saya menyumbang kepada azd atau mencipta templat komuniti?
**J**: 
1. **Alat azd**: Sumbang kepada [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templat**: Cipta templat mengikut [panduan templat](https://github.com/Azure-Samples/awesome-azd)  
3. **Dokumentasi**: Sumbangkan kepada dokumen di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)  

### S: Apakah pelan hala tuju untuk azd?  
**J**: Semak [pelan hala tuju rasmi](https://github.com/Azure/azure-dev/projects) untuk ciri dan penambahbaikan yang dirancang.  

### S: Bagaimana saya boleh berhijrah daripada alat penyebaran lain ke azd?  
**J**:  
1. Analisis seni bina penyebaran semasa  
2. Cipta templat Bicep yang setara  
3. Konfigurasi `azure.yaml` untuk sepadan dengan perkhidmatan semasa  
4. Uji dengan teliti dalam persekitaran pembangunan  
5. Berhijrah secara beransur-ansur ke persekitaran lain  

---

## Masih Ada Soalan?  

### **Cari Dahulu**  
- Semak [dokumentasi rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Cari [isu GitHub](https://github.com/Azure/azure-dev/issues) untuk masalah yang serupa  

### **Dapatkan Bantuan**  
- [Perbincangan GitHub](https://github.com/Azure/azure-dev/discussions) - Sokongan komuniti  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Soalan teknikal  
- [Azure Discord](https://discord.gg/azure) - Sembang komuniti masa nyata  

### **Laporkan Isu**  
- [Isu GitHub](https://github.com/Azure/azure-dev/issues/new) - Laporan pepijat dan permintaan ciri  
- Sertakan log yang relevan, mesej ralat, dan langkah untuk menghasilkan semula  

### **Ketahui Lebih Lanjut**  
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Kerangka Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*FAQ ini dikemas kini secara berkala. Kemas kini terakhir: 9 September 2025*  

---

**Navigasi**  
- **Pelajaran Sebelumnya**: [Glosari](glossary.md)  
- **Pelajaran Seterusnya**: [Panduan Kajian](study-guide.md)  

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.