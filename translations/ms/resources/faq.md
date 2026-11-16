# Soalan Lazim (FAQ)

**Dapatkan Bantuan Mengikut Bab**
- **📚 Laman Utama Kursus**: [AZD Untuk Pemula](../README.md)
- **🚆 Isu Pemasangan**: [Bab 1: Pemasangan & Persediaan](../docs/chapter-01-foundation/installation.md)
- **🤖 Soalan AI**: [Bab 2: Pembangunan Berfokus AI](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Penyelesaian Masalah**: [Bab 7: Penyelesaian Masalah & Pengesanan Ralat](../docs/chapter-07-troubleshooting/common-issues.md)

## Pengenalan

FAQ menyeluruh ini menyediakan jawapan untuk soalan yang paling biasa tentang Azure Developer CLI (azd) dan pelancaran Azure. Dapatkan penyelesaian pantas untuk masalah biasa, fahami amalan terbaik, dan dapatkan penjelasan tentang konsep dan aliran kerja azd.

## Matlamat Pembelajaran

Dengan meneliti FAQ ini, anda akan:
- Mendapat jawapan pantas untuk soalan dan isu Azure Developer CLI yang biasa
- Memahami konsep utama dan terminologi melalui format soal jawab yang praktikal
- Mengakses penyelesaian penyelesaian masalah untuk masalah dan senario ralat yang kerap
- Belajar amalan terbaik melalui soalan yang sering ditanya tentang pengoptimuman
- Meneroka ciri dan keupayaan lanjutan melalui soalan tahap pakar
- Merujuk panduan kos, keselamatan, dan strategi pelancaran dengan cekap

## Hasil Pembelajaran

Dengan merujuk secara berkala kepada FAQ ini, anda akan dapat:
- Menyelesaikan isu Azure Developer CLI yang biasa secara berdikari menggunakan penyelesaian yang disediakan
- Membuat keputusan termaklum tentang strategi dan konfigurasi pelancaran
- Memahami hubungan antara azd dan alat serta perkhidmatan Azure yang lain
- Mengaplikasikan amalan terbaik berdasarkan pengalaman komuniti dan cadangan pakar
- Menyelesaikan masalah pengesahan, pelancaran, dan konfigurasi dengan berkesan
- Mengoptimumkan kos dan prestasi menggunakan pandangan dan cadangan FAQ

## Jadual Kandungan

- [Memulakan](#getting-started)
- [Pengesahan & Akses](#authentication--access)
- [Templat & Projek](#templates--projects)
- [Pelancaran & Infrastruktur](#deployment--infrastructure)
- [Konfigurasi & Persekitaran](#configuration--environments)
- [Penyelesaian Masalah](#troubleshooting)
- [Kos & Pengebilan](#cost--billing)
- [Amalan Terbaik](#best-practices)
- [Topik Lanjutan](#advanced-topics)

---

## Memulakan

### S: Apakah Azure Developer CLI (azd)?
**J**: Azure Developer CLI (azd) adalah alat baris perintah berfokuskan pembangun yang mempercepatkan masa yang anda perlukan untuk membawa aplikasi anda daripada persekitaran pembangunan tempatan ke Azure. Ia menyediakan amalan terbaik melalui templat dan membantu dengan keseluruhan kitaran hayat pelancaran.

### S: Apakah bezanya azd dengan Azure CLI?
**J**: 
- **Azure CLI**: Alat berfungsi umum untuk menguruskan sumber Azure
- **azd**: Alat berfokuskan pembangun untuk aliran kerja pelancaran aplikasi
- azd mempunyai pengesahan dan aliran kerja pelancaran sendiri; Azure CLI adalah alat berasingan yang melengkapi
- azd termasuk templat, pengurusan persekitaran, dan automasi pelancaran

### S: Adakah saya perlu memasang Azure CLI untuk menggunakan azd?
**J**: Tidak untuk aliran kerja utama AZD. Sahkan dengan `azd auth login`. Pasang Azure CLI secara berasingan apabila kaitan templat atau latihan secara eksplisit menjalankan arahan `az`.

### S: Apakah bahasa pengaturcaraan yang disokong azd?
**J**: azd tidak bergantung bahasa. Ia berfungsi dengan:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Laman web statik
- Aplikasi dalam bekas

### S: Bolehkah saya menggunakan azd dengan projek sedia ada?
**J**: Boleh! Anda boleh sama ada:
1. Gunakan `azd init` untuk menambah konfigurasi azd kepada projek sedia ada
2. Sesuaikan projek sedia ada supaya sepadan dengan struktur templat azd
3. Cipta templat tersuai berdasarkan seni bina anda yang sedia ada

### S: Apa yang berubah dengan kebolehcapaian umum sambungan Foundry?
**J**: Bundel `microsoft.foundry` mencapai versi 1.0 dan GA pada 5 November 2026. Dengan AZD 1.37.0+, gunakan `azd ext install microsoft.foundry` untuk memasang tujuh sambungan teras bagi ejen, sambungan, pemeriksa, projek, rutin, kemahiran, dan kotak alat. Ia bukan ruang nama arahan baru, dan komponennya versi secara bebas. Penilaian, set data, pelarasan halus, dan model tersuai dipasang secara berasingan; ciri pratonton pilihan tidak menjadi GA hanya kerana bundel itu GA.

Panduan [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) menggunakan Python 3.13+ dan uv semasa. `azd ai agent run` membuka Agent Inspector secara lokal, tetapi panggilan model masih menggunakan Azure dan menimbulkan caj. Mod kod `azd deploy` memuat naik sumber untuk binaan jauh tanpa memerlukan binaan bekas tempatan.

### S: Adakah `azd down` membuang ejen hos dari projek Foundry yang sedia ada?
**J**: Tidak untuk laluan projek yang digunakan semula yang diterangkan dalam permulaan cepat hosted-agent: ia meninggalkan projek, ejen hos, dan sumber lain di tempatnya. Buang sumber yang tidak diingini secara berasingan tanpa memadam sumber yang dikongsi. Jika persekitaran mencipta projek Foundry baru, `azd down` memadam kumpulan sumbernya dan segala-galanya di dalamnya. Semak [panduan pembersihan](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) dan arahan penghapusan sebelum mengesahkan.

---

## Pengesahan & Akses

### S: Bagaimana saya mengesahkan dengan Azure menggunakan azd?
**J**: Gunakan `azd auth login` yang akan membuka tetingkap pelayar untuk pengesahan Azure. Untuk senario CI/CD, gunakan prinsip perkhidmatan atau identiti yang dikendalikan.

### S: Bolehkah saya menggunakan azd dengan beberapa langganan Azure?
**J**: Ya. Gunakan `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` untuk menentukan langganan mana yang akan digunakan untuk setiap persekitaran.

### S: Apakah kebenaran yang saya perlukan untuk deploy dengan azd?
**J**: Biasanya anda memerlukan:
- Peranan **Contributor** pada kumpulan sumber atau langganan
- **User Access Administrator** jika deploy sumber yang memerlukan penugasan peranan
- Kebenaran khusus berbeza mengikut templat dan sumber yang dideploy

### S: Bolehkah saya menggunakan azd dalam saluran CI/CD?
**A**: Sudah tentu! azd direka untuk integrasi CI/CD. Gunakan prinsipal perkhidmatan untuk pengesahan dan tetapkan pembolehubah persekitaran untuk konfigurasi.

### Q: Bagaimana saya mengendalikan pengesahan dalam GitHub Actions?
**A**: Lebihkan penggunaan federasi identiti beban kerja (OIDC), yang dikonfigurasi dengan `azd pipeline config`. Aliran kerja yang dijana memasang AZD dan mengesahkan AZD secara langsung dengan identiti berfederasi. Langkah `azure/login` sahaja tidak mewujudkan log masuk AZD. Langkah log masuk dalam pekerjaan yang sedia ada adalah:
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

Sediakan atau lahirkan selepas log masuk, dengan persekitaran AZD, langganan, dan lokasi yang dikehendaki dikonfigurasi. Kredential berfederasi identiti mesti mempercayai repositori/rujukan aliran kerja atau persekitaran GitHub, dan peranan Azure-nya mesti membenarkan operasi yang diminta.

---

## Templat & Projek

### Q: Di mana saya boleh mendapatkan templat azd?
**A**: 
- Templat rasmi dan komuniti: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Templat komuniti: Cari di GitHub dengan "azd-template"
- Gunakan `azd template list` untuk melayari templat yang tersedia

### Q: Bagaimana saya membuat templat tersuai?
**A**: 
1. Mulakan dengan struktur templat yang sedia ada
2. Ubah suai `azure.yaml`, fail infrastruktur, dan kod aplikasi
3. Uji sepenuhnya dengan `azd up`
4. Terbitkan ke GitHub dengan tag yang sesuai

### Q: Bolehkah saya menggunakan azd tanpa templat?
**A**: Ya, gunakan `azd init` dalam projek sedia ada untuk membuat fail konfigurasi yang diperlukan. Anda perlu mengkonfigurasi secara manual `azure.yaml` dan fail infrastruktur.

### S: Apakah perbezaan antara templat rasmi dan komuniti?
**J**: 
- **Templat Rasmi**: Diselenggara oleh Microsoft, dikemas kini secara berkala, dokumentasi menyeluruh
- **Templat Komuniti**: Dicipta oleh pembangun, mungkin mempunyai kes penggunaan khusus, kualiti dan penyelenggaraan berbeza-beza

### S: Bagaimana saya mengemas kini templat dalam projek saya?
**J**: Templat tidak dikemas kini secara automatik. Anda boleh:
1. Bandingkan dan gabungkan perubahan dari templat sumber secara manual
2. Mula baru dengan `azd init` menggunakan templat yang dikemas kini
3. Pilih khusus penambahbaikan dari templat yang dikemas kini

---

## Penyebaran & Infrastruktur

### S: Apakah perkhidmatan Azure yang boleh azd sebarkan?
**J**: azd boleh menyebarkan apa-apa perkhidmatan Azure melalui templat Bicep/ARM, termasuk:
- App Services, Container Apps, Functions
- Pangkalan Data (SQL, PostgreSQL, Cosmos DB)
- Penyimpanan, Key Vault, Application Insights
- Sumber rangkaian, keselamatan, dan pemantauan

### S: Bolehkah saya menyebarkan ke berbilang wilayah?
**J**: Ya, konfigurasikan berbilang wilayah dalam templat Bicep anda dan tetapkan parameter lokasi dengan sesuai untuk setiap persekitaran.

### S: Bagaimana saya mengendalikan migrasi skema pangkalan data?
**J**: Gunakan hook penyebaran dalam `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### S: Bolehkah saya hanya menyebarkan infrastruktur tanpa aplikasi?
**J**: Ya, gunakan `azd provision` untuk menyebarkan hanya komponen infrastruktur yang ditakrifkan dalam templat anda.

### S: Bagaimana saya menyebarkan ke sumber Azure yang sedia ada?
**J**: Ya, apabila templat menyokongnya. Rujuk sumber sedia ada dengan deklarasi `existing` Bicep atau parameter sumber-sedia-ada yang didokumenkan dalam templat, dan peta perkhidmatan aplikasi ke sasaran yang dimaksudkan. Ini tidak mengimport pemilikan atau secara automatik mencipta kebenaran yang hilang. Semak templat sebelum menyebarkan.

### S: Bolehkah saya menggunakan Terraform menggantikan Bicep?
**J**: Ya. AZD menyokong Terraform serta Bicep. Pilih templat berasaskan Terraform atau konfigurasikan `infra.provider: terraform` dalam `azure.yaml`, dengan fail Terraform dan konfigurasi state/backend yang sesuai. Lihat [aliran kerja Terraform](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfigurasi & Persekitaran

### S: Bagaimana saya menguruskan persekitaran berbeza (dev, staging, prod)?
**J**: Cipta persekitaran berasingan dengan `azd env new <environment-name>` dan konfigurasikan tetapan berbeza untuk setiap satu:
```bash
azd env new development
azd env new staging  
azd env new production
```

### S: Di manakah konfigurasi persekitaran disimpan?
**J**: Dalam folder `.azure` dalam direktori projek anda. Setiap persekitaran mempunyai folder sendiri dengan fail konfigurasi.

### S: Bagaimana saya menetapkan konfigurasi khusus persekitaran?
**J**: Gunakan `azd env set` untuk mengkonfigurasi pembolehubah persekitaran:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### S: Bolehkah saya berkongsi konfigurasi persekitaran antara ahli pasukan?
**J**: Folder `.azure` mengandungi maklumat sensitif dan tidak patut dimasukkan dalam kawalan versi. Sebaliknya:
1. Dokumentasikan pembolehubah persekitaran yang diperlukan
2. Gunakan skrip penyebaran untuk menyediakan persekitaran
3. Gunakan Azure Key Vault untuk konfigurasi sensitif

### S: Bagaimana saya memintas tetapan lalai templat?
**J**: Tetapkan pembolehubah persekitaran yang sepadan dengan parameter templat:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Hanya pembolehubah yang digunakan oleh templat mempengaruhi penyebaran. `SKU_NAME` di atas adalah contoh input khusus, bukan tetapan AZD sejagat.

---

## Penyelesaian Masalah

### S: Mengapa `azd up` gagal?
**J**: Punca biasa:
1. **Isu pengesahan**: Jalankan `azd auth login`
2. **Kebenaran tidak mencukupi**: Semak tugasan peranan Azure anda
3. **Konflik penamaan sumber**: Tinjau sumber yang bertentangan dan input penamaan templat; buat persekitaran berasingan dengan `azd env new` apabila pengasingan diperlukan
4. **Isu kuota/kapasiti**: Semak ketersediaan serantau
5. **Ralat templat**: Sahkan templat Bicep

### S: Bagaimana saya menyahpepijat kegagalan pengeluaran?
**J**: 
1. Gunakan `azd deploy --debug` untuk keluaran terperinci
2. Semak sejarah pengeluaran portal Azure
3. Tinjau Log Aktiviti di portal Azure
4. Gunakan `azd show` untuk memaparkan keadaan persekitaran semasa

### S: Kenapa pembolehubah persekitaran saya tidak berfungsi?
**J**: Semak:
1. Nama pembolehubah sepadan dengan parameter templat dengan tepat
2. Nilai diapit dengan betul jika mengandungi ruang
3. Persekitaran dipilih: `azd env select <environment>`
4. Pembolehubah ditetapkan dalam persekitaran yang betul

### S: Bagaimana saya membersihkan pengeluaran yang gagal?
**J**: 
```bash
azd down
```
Tinjau persekitaran yang dipilih dan pengesahan penghapusan terlebih dahulu. Ini memadam sumber Azure yang disediakan, bukan konfigurasi persekitaran tempatan `.azure`. `--purge` juga meminta penghapusan kekal untuk sumber yang dipadam lembut yang disokong dan boleh disekat oleh perlindungan penahanan/purj; ini bukan langkah pemulihan rutin.

### S: Kenapa aplikasi saya tidak boleh diakses selepas pengeluaran?
**J**: Semak:
1. Pengeluaran selesai dengan berjaya
2. Aplikasi berjalan (semak log di portal Azure)
3. Kumpulan keselamatan rangkaian membenarkan trafik
4. DNS/domain tersuai dikonfigurasikan dengan betul

---

## Kos & Pengebilan

### S: Berapa kos pengeluaran azd?
**J**: Kos bergantung pada:
- Perkhidmatan Azure yang digunakan
- Tier/SKU perkhidmatan yang dipilih
- Perbezaan harga serantau
- Corak penggunaan

Gunakan [Pengira Harga Azure](https://azure.microsoft.com/pricing/calculator/) untuk anggaran.

### S: Bagaimana saya mengawal kos dalam pengeluaran azd?
**J**: 
1. Gunakan SKU tahap rendah untuk persekitaran pembangunan
2. Tetapkan bajet dan amaran Azure
3. Gunakan `azd down` untuk membuang sumber apabila tidak diperlukan
4. Pilih rantau yang sesuai (kos berbeza mengikut lokasi)
5. Gunakan alat Pengurusan Kos Azure

### S: Adakah terdapat pilihan lapisan percuma untuk templat azd?
**J**: Sesetengah perkhidmatan mempunyai SKU percuma atau geran bulanan, tertakluk kepada kelayakan, pelan pengehosan, rantau, dan had langganan. Ini tidak menjadikan keseluruhan templat percuma: pangkalan data, carian, rangkaian, daftar, telemetri, dan inferens model boleh mengenakan caj secara berasingan. Semak [senarai perkhidmatan percuma Azure](https://azure.microsoft.com/free/) dan harga terkini untuk setiap sumber sebelum penyebaran.

### S: Bagaimana saya menganggarkan kos sebelum penyebaran?
**J**: 
1. Semak `main.bicep` templat untuk melihat sumber apa yang dibuat
2. Gunakan Kalkulator Harga Azure dengan SKU tertentu
3. Sebarkan ke persekitaran pembangunan dahulu untuk memantau kos sebenar
4. Gunakan Pengurusan Kos Azure untuk analisis kos terperinci

---

## Amalan Terbaik

### S: Apakah amalan terbaik untuk struktur projek azd?
**J**: 
1. Simpan kod aplikasi berasingan daripada infrastruktur
2. Gunakan nama perkhidmatan yang bermakna dalam `azure.yaml` 
3. Laksanakan pengendalian ralat yang betul dalam skrip binaan
4. Gunakan konfigurasi khusus persekitaran
5. Sertakan dokumentasi yang lengkap

### S: Bagaimana saya hendak mengatur pelbagai perkhidmatan dalam azd?
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

### S: Patutkah saya mengkomitkan folder `.azure` ke kawalan versi?
**J**: **Tidak!** Folder `.azure` mengandungi maklumat sensitif. Tambahkan ke `.gitignore`:
```gitignore
.azure/
```

### S: Bagaimana saya mengendalikan rahsia dan konfigurasi sensitif?
**J**: 
1. Gunakan Azure Key Vault untuk rahsia
2. Rujuk rahsia Key Vault dalam konfigurasi aplikasi
3. Jangan sekali-kali mengkomit rahsia ke kawalan versi
4. Gunakan identiti terurus untuk pengesahan perkhidmatan-ke-perkhidmatan

### S: Apakah pendekatan yang disyorkan untuk CI/CD dengan azd?
**J**: 
1. Gunakan persekitaran berasingan untuk setiap tahap (dev/staging/prod)
2. Laksanakan ujian automatik sebelum penyebaran
3. Gunakan prinsipal perkhidmatan untuk pengesahan
4. Simpan konfigurasi sensitif dalam rahsia/variabel saluran paip
5. Laksanakan pintu kelulusan untuk penyebaran produksi

---

## Topik Lanjutan

### S: Bolehkah saya meluaskan azd dengan fungsi tersuai?
**J**: Ya, melalui kait penyebaran dalam `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### S: Bagaimana saya mengintegrasi azd dengan proses DevOps yang sedia ada?
**J**: 
1. Gunakan arahan azd dalam skrip saluran paip sedia ada
2. Standarkan penggunaan templat azd di seluruh pasukan
3. Integrasi dengan pemantauan dan amaran yang sedia ada
4. Gunakan output JSON azd untuk integrasi saluran paip

### S: Bolehkah saya menggunakan azd dengan Azure DevOps?
**J**: Ya, azd berfungsi dengan mana-mana sistem CI/CD. Cipta saluran paip Azure DevOps yang menggunakan arahan azd.

### S: Bagaimana saya menyumbang kepada azd atau mencipta templat komuniti?
**J**: 
1. **alat azd**: Sumbang ke [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templat**: Ikut arahan [Sumbangan galeri Awesome AZD](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentasi**: Sumbang ke dokumen di [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### S: Apakah pelan hala tuju untuk azd?
**J**: Semak [pelan hala tuju rasmi](https://github.com/Azure/azure-dev/projects) untuk ciri dan penambahbaikan yang dirancang.

### S: Bagaimana saya memindahkan dari alat penyebaran lain ke azd?
**J**: 
1. Analisa seni bina penyebaran semasa
2. Cipta templat Bicep yang setara
3. Konfigurasikan `azure.yaml` untuk sepadan dengan perkhidmatan semasa
4. Uji dengan teliti dalam persekitaran pembangunan
5. Migrasi persekitaran secara berperingkat

---

## Masih Ada Soalan?

### **Cari Terlebih Dahulu**
- Semak [dokumentasi rasmi](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Cari [isu GitHub](https://github.com/Azure/azure-dev/issues) untuk masalah serupa

### **Dapatkan Bantuan**
- [Perbincangan GitHub](https://github.com/Azure/azure-dev/discussions) - Sokongan komuniti
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Soalan teknikal
- [Azure Discord](https://discord.gg/azure) - Sembang komuniti masa nyata

### **Laporkan Isu**
- [Isu GitHub](https://github.com/Azure/azure-dev/issues/new) - Laporan pepijat dan permintaan ciri
- Sertakan log, mesej ralat, dan langkah untuk menghasilkan isu

### **Ketahui Lebih Lanjut**
- [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Pusat Seni Bina Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Rangka Kerja Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Panduan teknikal disemak: 4 November 2026. Ketersediaan awan dan harga perlu disemak untuk langganan dan rantau anda.*

---

**Navigasi**
- **Pelajaran Sebelumnya**: [Glosari](glossary.md)
- **Pelajaran Seterusnya**: [Panduan Kajian](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->