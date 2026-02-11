# Soalan Lazim (FAQ)

**Dapatkan Bantuan Mengikut Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Isu Pemasangan**: [Bab 1: Pemasangan & Persediaan](../docs/getting-started/installation.md)
- **🤖 Soalan AI**: [Bab 2: Pembangunan Utama AI](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Menyelesaikan Masalah**: [Bab 7: Penyelesaian Masalah & Pengesanan Ralat](../docs/troubleshooting/common-issues.md)

## Pengenalan

FAQ komprehensif ini menyediakan jawapan kepada soalan-soalan yang paling kerap ditanya tentang Azure Developer CLI (azd) dan penghantaran Azure. Dapatkan penyelesaian pantas kepada masalah biasa, fahami amalan terbaik, dan peroleh penjelasan tentang konsep dan aliran kerja azd.

## Matlamat Pembelajaran

Dengan mengkaji FAQ ini, anda akan:
- Mendapati jawapan pantas kepada soalan dan isu Azure Developer CLI yang biasa
- Memahami konsep utama dan terminologi melalui format soal jawab yang praktikal
- Mendapat akses kepada penyelesaian menyelesaikan masalah untuk isu dan senario ralat yang kerap
- Belajar amalan terbaik melalui soalan-soalan lazim berkaitan pengoptimuman
- Menemui ciri dan keupayaan lanjutan melalui soalan tahap pakar
- Merujuk panduan kos, keselamatan, dan strategi penghantaran dengan cekap

## Hasil Pembelajaran

Dengan selalu merujuk FAQ ini, anda akan dapat:
- Menyelesaikan isu Azure Developer CLI biasa secara berdikari menggunakan penyelesaian disediakan
- Membuat keputusan bijak mengenai strategi dan konfigurasi penghantaran
- Memahami hubungan antara azd dan alat serta perkhidmatan Azure lain
- Mengaplikasikan amalan terbaik berdasarkan pengalaman komuniti dan cadangan pakar
- Menyelesaikan masalah pengesahan, penghantaran, dan konfigurasi dengan berkesan
- Mengoptimumkan kos dan prestasi menggunakan pandangan dan cadangan FAQ

## Jadual Kandungan

- [Memulakan](../../../resources)
- [Pengesahan & Akses](../../../resources)
- [Templat & Projek](../../../resources)
- [Penghantaran & Infrastruktur](../../../resources)
- [Konfigurasi & Persekitaran](../../../resources)
- [Menyelesaikan Masalah](../../../resources)
- [Kos & Pengebilan](../../../resources)
- [Amalan Terbaik](../../../resources)
- [Topik Lanjutan](../../../resources)

---

## Memulakan

### S: Apakah Azure Developer CLI (azd)?
**J**: Azure Developer CLI (azd) ialah alat baris arahan berfokuskan pembangun yang mempercepatkan masa yang anda ambil untuk membawa aplikasi anda dari persekitaran pembangunan tempatan ke Azure. Ia menyediakan amalan terbaik melalui templat dan membantu dengan keseluruhan kitaran hayat penghantaran.

### S: Apakah perbezaan azd dengan Azure CLI?
**J**: 
- **Azure CLI**: Alat tujuan umum untuk mengurus sumber Azure
- **azd**: Alat berfokuskan pembangun untuk aliran kerja penghantaran aplikasi
- azd menggunakan Azure CLI secara dalaman tetapi menyediakan abstraksi tahap tinggi untuk senario pembangunan biasa
- azd termasuk templat, pengurusan persekitaran, dan automasi penghantaran

### S: Adakah saya perlu memasang Azure CLI untuk menggunakan azd?
**J**: Ya, azd memerlukan Azure CLI untuk pengesahan dan beberapa operasi. Pasang Azure CLI dahulu, kemudian pasang azd.

### S: Apakah bahasa pengaturcaraan yang disokong azd?
**J**: azd tidak terikat kepada bahasa tertentu. Ia berfungsi dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Laman web statik
- Aplikasi bersalut kontena

### S: Bolehkah saya menggunakan azd dengan projek sedia ada?
**J**: Ya! Anda boleh:
1. Gunakan `azd init` untuk menambah konfigurasi azd ke projek sedia ada
2. Sesuaikan projek sedia ada untuk menyamai struktur templat azd
3. Cipta templat tersuai berdasarkan seni bina anda sedia ada

---

## Pengesahan & Akses

### S: Bagaimana saya autentikasi dengan Azure menggunakan azd?
**J**: Gunakan `azd auth login` yang akan membuka tetingkap pelayar untuk pengesahan Azure. Untuk senario CI/CD, gunakan prinsip perkhidmatan atau identiti terurus.

### S: Bolehkah saya menggunakan azd dengan pelbagai langganan Azure?
**J**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan yang hendak digunakan bagi setiap persekitaran.

### S: Apakah kebenaran yang diperlukan untuk penghantaran dengan azd?
**J**: Biasanya anda memerlukan:
- Peranan **Contributor** pada kumpulan sumber atau langganan
- **User Access Administrator** jika menghantar sumber yang memerlukan penugasan peranan
- Kebenaran khusus berbeza mengikut templat dan sumber yang dihantar

### S: Bolehkah saya menggunakan azd dalam saluran CI/CD?
**J**: Sudah tentu! azd direka untuk integrasi CI/CD. Gunakan prinsip perkhidmatan untuk pengesahan dan tetapkan pemboleh ubah persekitaran untuk konfigurasi.

### S: Bagaimana saya mengendalikan pengesahan dalam GitHub Actions?
**J**: Gunakan tindakan Azure Login dengan kelayakan prinsip perkhidmatan:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templat & Projek

### S: Di manakah saya boleh cari templat azd?
**J**: 
- Templat rasmi: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Templat komuniti: Cari "azd-template" di GitHub
- Gunakan `azd template list` untuk meneroka templat tersedia

### S: Bagaimana saya cipta templat tersuai?
**J**: 
1. Mulakan dengan struktur templat sedia ada
2. Ubah `azure.yaml`, fail infrastruktur, dan kod aplikasi
3. Uji dengan teliti menggunakan `azd up`
4. Terbitkan ke GitHub dengan tag sesuai

### S: Bolehkah saya menggunakan azd tanpa templat?
**J**: Ya, gunakan `azd init` dalam projek sedia ada untuk membuat fail konfigurasi yang diperlukan. Anda perlu konfigurasi `azure.yaml` dan fail infrastruktur secara manual.

### S: Apakah perbezaan antara templat rasmi dan komuniti?
**J**: 
- **Templat rasmi**: Diselenggara oleh Microsoft, dikemas kini secara berkala, dokumentasi komprehensif
- **Templat komuniti**: Dicipta oleh pembangun, mungkin mempunyai kes penggunaan khusus, kualiti dan penyelenggaraan berbeza-beza

### S: Bagaimana saya kemas kini templat dalam projek saya?
**J**: Templat tidak dikemas kini secara automatik. Anda boleh:
1. Banding dan gabungkan perubahan dari templat asal secara manual
2. Mulakan semula dengan `azd init` menggunakan templat dikemas kini
3. Pilih secara khusus penambahbaikan dari templat dikemas kini

---

## Penghantaran & Infrastruktur

### S: Apakah perkhidmatan Azure yang boleh dihantar oleh azd?
**J**: azd boleh menghantar sebarang perkhidmatan Azure melalui templat Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Pangkalan data (SQL, PostgreSQL, Cosmos DB)
- Penyimpanan, Key Vault, Application Insights
- Rangkaian, keselamatan, dan sumber pemantauan

### S: Bolehkah saya hantar ke pelbagai rantau?
**J**: Ya, konfigurasikan pelbagai rantau dalam templat Bicep anda dan tetapkan parameter lokasi dengan betul untuk setiap persekitaran.

### S: Bagaimana saya urus migrasi skema pangkalan data?
**J**: Gunakan kait penghantaran dalam `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Bolehkah saya hantar hanya infrastruktur tanpa aplikasi?
**J**: Ya, gunakan `azd provision` untuk menghantar hanya komponen infrastruktur yang ditakrifkan dalam templat anda.

### S: Bagaimana saya hantar ke sumber Azure sedia ada?
**J**: Ini rumit dan tidak disokong secara langsung. Anda boleh:
1. Import sumber sedia ada ke dalam templat Bicep anda
2. Gunakan rujukan sumber sedia ada dalam templat
3. Ubah templat untuk mencipta atau merujuk sumber secara bersyarat

### S: Bolehkah saya guna Terraform menggantikan Bicep?
**J**: Kini, azd terutamanya menyokong templat Bicep/ARM. Sokongan Terraform tidak rasmi, walaupun mungkin terdapat penyelesaian komuniti.

---

## Konfigurasi & Persekitaran

### S: Bagaimana saya urus persekitaran berbeza (dev, staging, prod)?
**J**: Cipta persekitaran berasingan dengan `azd env new <environment-name>` dan konfigurasikan tetapan yang berlainan untuk setiap satu:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Di manakah konfigurasi persekitaran disimpan?
**J**: Dalam folder `.azure` dalam direktori projek anda. Setiap persekitaran mempunyai folder sendiri dengan fail konfigurasi.

### S: Bagaimana saya tetapkan konfigurasi khusus persekitaran?
**J**: Gunakan `azd env set` untuk mengatur pemboleh ubah persekitaran:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Bolehkah saya kongsikan konfigurasi persekitaran dengan ahli pasukan lain?
**J**: Folder `.azure` mengandungi maklumat sensitif dan tidak seharusnya disimpan dalam kawalan versi. Sebaliknya:
1. Dokumentasikan pemboleh ubah persekitaran yang diperlukan
2. Gunakan skrip penghantaran untuk menyediakan persekitaran
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### S: Bagaimana saya gantikan nilai lalai templat?
**J**: Tetapkan pemboleh ubah persekitaran yang sepadan dengan parameter templat:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Menyelesaikan Masalah

### S: Mengapa `azd up` gagal?
**J**: Punca biasa:
1. **Isu pengesahan**: Jalankan `azd auth login`
2. **Kebenaran tidak mencukupi**: Semak penugasan peranan Azure anda
3. **Konflik penamaan sumber**: Tukar AZURE_ENV_NAME
4. **Isu kuota/kapasiti**: Semak ketersediaan rantau
5. **Ralat templat**: Sahkan templat Bicep

### S: Bagaimana saya debug kegagalan penghantaran?
**J**: 
1. Gunakan `azd deploy --debug` untuk output terperinci
2. Semak sejarah penghantaran di portal Azure
3. Kaji Log Aktiviti di portal Azure
4. Gunakan `azd show` untuk paparkan keadaan persekitaran semasa

### S: Kenapa pemboleh ubah persekitaran saya tidak berfungsi?
**J**: Periksa:
1. Nama pemboleh ubah tepat seperti parameter templat
2. Nilai dipetik dengan betul jika mengandungi ruang
3. Persekitaran dipilih: `azd env select <environment>`
4. Pemboleh ubah ditetapkan dalam persekitaran yang betul

### S: Bagaimana saya bersihkan penghantaran yang gagal?
**J**: 
```bash
azd down --force --purge
```
Ini membuang semua sumber dan konfigurasi persekitaran.

### S: Kenapa aplikasi saya tidak boleh diakses selepas penghantaran?
**J**: Periksa:
1. Penghantaran selesai dengan jayanya
2. Aplikasi sedang berjalan (semak log di portal Azure)
3. Kumpulan keselamatan rangkaian membenarkan trafik
4. DNS/domain tersuai dikonfigurasi dengan betul

---

## Kos & Pengebilan

### S: Berapa kos penghantaran azd?
**J**: Kos bergantung kepada:
- Perkhidmatan Azure dihantar
- Tier/SKU perkhidmatan dipilih
- Perbezaan harga mengikut rantau
- Corak penggunaan

Gunakan [Pengira Harga Azure](https://azure.microsoft.com/pricing/calculator/) untuk anggaran.

### S: Bagaimana saya kawal kos dalam penghantaran azd?
**J**: 
1. Gunakan SKU tier rendah untuk persekitaran pembangunan
2. Tetapkan bajet dan amaran Azure
3. Gunakan `azd down` untuk membuang sumber apabila tidak diperlukan
4. Pilih rantau sesuai (kos berbeza mengikut lokasi)
5. Gunakan alat Pengurusan Kos Azure

### S: Adakah terdapat pilihan tier percuma untuk templat azd?
**J**: Banyak perkhidmatan Azure menawarkan tier percuma:
- App Service: Tier percuma tersedia
- Azure Functions: 1J pelaksanaan percuma/sebulan
- Cosmos DB: Tier percuma dengan 400 RU/s
- Application Insights: 5GB pertama/sebulan percuma

Konfigurasikan templat untuk gunakan tier percuma jika ada.

### S: Bagaimana saya anggar kos sebelum penghantaran?
**J**: 
1. Semak `main.bicep` templat untuk lihat sumber yang dibuat
2. Gunakan Pengira Harga Azure dengan SKU spesifik
3. Hantar ke persekitaran pembangunan dahulu untuk pantau kos sebenar
4. Gunakan Pengurusan Kos Azure untuk analisis terperinci

---

## Amalan Terbaik

### S: Apakah amalan terbaik untuk struktur projek azd?
**J**: 
1. Pisahkan kod aplikasi daripada infrastruktur
2. Gunakan nama perkhidmatan bermakna dalam `azure.yaml`
3. Laksanakan pengendalian ralat yang betul dalam skrip binaan
4. Gunakan konfigurasi khusus persekitaran
5. Sertakan dokumentasi komprehensif

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

### S: Patutkah saya commit folder `.azure` ke kawalan versi?
**J**: **Tidak!** Folder `.azure` mengandungi maklumat sensitif. Tambahkan ke `.gitignore`:
```gitignore
.azure/
```

### S: Bagaimana saya urus rahsia dan konfigurasi sensitif?
**J**: 
1. Gunakan Azure Key Vault untuk rahsia
2. Rujuk rahsia Key Vault dalam konfigurasi aplikasi
3. Jangan sekali-kali commit rahsia ke kawalan versi
4. Gunakan identiti terurus untuk pengesahan servis ke servis

### S: Apakah pendekatan disyorkan untuk CI/CD dengan azd?
**J**: 
1. Gunakan persekitaran berasingan untuk setiap peringkat (dev/staging/prod)
2. Laksanakan ujian automatik sebelum penghantaran
3. Gunakan prinsip perkhidmatan untuk pengesahan
4. Simpan konfigurasi sensitif dalam rahsia/pemboleh ubah pipeline
5. Laksanakan pintu kelulusan untuk penghantaran pengeluaran

---

## Topik Lanjutan

### S: Bolehkah saya kembangkan azd dengan fungsi tersuai?
**J**: Ya, melalui kait penghantaran dalam `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Bagaimana saya integrasi azd dengan proses DevOps sedia ada?
**J**: 
1. Gunakan arahan azd dalam skrip pipeline sedia ada
2. Standarkan templat azd merentasi pasukan
3. Integrasi dengan pemantauan dan amaran sedia ada
4. Gunakan output JSON azd untuk integrasi pipeline

### S: Bolehkah saya gunakan azd dengan Azure DevOps?
**J**: Ya, azd berfungsi dengan mana-mana sistem CI/CD. Cipta pipeline Azure DevOps yang menggunakan arahan azd.

### S: Bagaimana saya sumbang kepada azd atau cipta templat komuniti?
**J**: 
1. **alat azd**: Menyumbang kepada [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templat**: Cipta templat mengikut [garis panduan templat](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentasi**: Menyumbang kepada dokumen di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### S: Apakah peta jalan untuk azd?
**J**: Semak [peta jalan rasmi](https://github.com/Azure/azure-dev/projects) untuk ciri dan penambahbaikan yang dirancang.

### S: Bagaimana saya boleh berhijrah dari alat penghantaran lain ke azd?
**J**: 
1. Analisis seni bina penghantaran semasa
2. Cipta templat Bicep yang setara
3. Konfigurasikan `azure.yaml` untuk padan dengan perkhidmatan semasa
4. Uji dengan teliti dalam persekitaran pembangunan
5. Beransur-ansur berhijrah persekitaran

---

## Masih Ada Soalan?

### **Cari Terlebih Dahulu**
- Semak [dokumentasi rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cari di [Isu GitHub](https://github.com/Azure/azure-dev/issues) untuk masalah yang serupa

### **Dapatkan Bantuan**
- [Perbincangan GitHub](https://github.com/Azure/azure-dev/discussions) - Sokongan komuniti
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Soalan teknikal
- [Azure Discord](https://discord.gg/azure) - Sembang komuniti masa nyata

### **Laporkan Isu**
- [Isu GitHub](https://github.com/Azure/azure-dev/issues/new) - Laporan pepijat dan permintaan ciri
- Sertakan log yang berkaitan, mesej ralat, dan langkah untuk menghasilkan semula

### **Ketahui Lebih Lanjut**
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*FAQ ini dikemas kini secara berkala. Dikemas kini terakhir: 9 September 2025*

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Glosari](glossary.md)
- **Pelajaran Seterusnya**: [Panduan Belajar](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat yang kritikal, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->