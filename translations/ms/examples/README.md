# Contoh — Sumber Bahasa Inggeris dan Sampel Azure

Ini adalah sampel pembelajaran, bukan aplikasi yang disahkan untuk produksi. Baca setiap
prasyarat, had, kos, dan arahan pembersihan contoh sebelum
menjalankan arahan. Ketersediaan dan kuota Azure mesti diperiksa dalam langganan anda.

- [Halaman kursus](../README.md)
- [Pemasangan](../docs/chapter-01-foundation/installation.md)
- [Penyelesaian masalah](../docs/chapter-07-troubleshooting/common-issues.md)

## Apa yang sebenarnya wujud secara tempatan

Terdapat **empat sampel aplikasi** dan **satu rangka infrastruktur**:

| Contoh | Pelaksanaan tempatan | Fokus pembelajaran | Tahap |
|---|---|---|---|
| [API Flask mudah](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Penempatan kontena, probe, log | Pemula |
| [Microservices dua perkhidmatan](../../../examples/container-app/microservices) | Node.js gateway dan perkhidmatan produk Python baca sahaja, Dockerfiles, Bicep, `azure.yaml` | Komunikasi HTTPS dalaman, penskalaan bebas | Pertengahan |
| [Aplikasi pangkalan data](../../../examples/database-app) | Flask API baca, Azure SQL, App Service, Bicep, `azure.yaml` | Ketersambungan SQL, inisialisasi, log | Pertengahan |
| [Sembang Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python tempatan, Bicep Azure OpenAI dan Key Vault, infrastruktur sahaja `azure.yaml` | Penyediaan model, sejarah sembang, anggaran token | Pertengahan |
| [Infrastruktur runcit](../../../examples/retail-multiagent-arm-template) | Templat ARM, parameter, skrip pemasangan Bash; **hanya kontena hello-world** | Infrastruktur untuk aplikasi agen-multi masa depan | Lanjutan |

Senario [retail](retail-scenario.md) adalah **pelan seni bina**, bukan
pelaksanaan multi-ejen yang lengkap. Tiada kod ejen runcit, frontend sembang, API perute,
saluran data carian, CLI penilaian, failover automatik, atau pengukuhan pengeluaran disertakan.
Ini mesti direka, dibina, dan diuji secara berasingan.

Gambaran keseluruhan [mikroservis](microservices/README.md) merujuk kepada contoh dua perkhidmatan yang boleh dijalankan;
ia bukan direktori penyebaran lain.

## Laluan pembelajaran yang disyorkan

1. Sebarkan API Flask dan sahkan `/health` dan operasi CRUD.
2. Sebarkan aplikasi pangkalan data dan sahkan lima produk yang dimasukkan.
3. Sebarkan contoh dua perkhidmatan dan sahkan permintaan gerbang-ke-produk.
4. Sediakan sumber sembang dan jalankan CLI interaktif **secara tempatan**.
5. Pelajari pelan runcit selepas menyelesaikan contoh yang berfungsi.

Benarkan kira-kira 30–60 minit setiap contoh aplikasi termasuk prasyarat dan
pengesahan. Pelaksanaan runcit adalah projek pembangunan berasingan, bukan
bengkel 30 minit. Membaca seni bina mengambil masa kira-kira 2–3 jam; pelaksanaan
dan kesediaan pengeluaran boleh mengambil masa jauh lebih lama daripada ilustrasi
80–120 jam pembangunan dalam panduan.

## Mula cepat

Dari akar repositori, untuk contoh bekas pertama:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Dijangka: HTTP 200 dan JSON mengandungi `"status": "healthy"`.
Anda perlu menjalankan Docker untuk binaan bekas tempatan.

Untuk sembang, ikut [README sembang](azure-openai-chat/README.md): gunakan
`azd provision`, muat kunci API dari Key Vault ke shell semasa, pasang
`src/requirements.txt`, dan jalankan `python src/chat.py`. Tiada servis sembang dihoskan.

Untuk runcit, gunakan [panduan ARM](retail-multiagent-arm-template/README.md).
Ia tidak mempunyai `azure.yaml` dan **tidak** disebarkan atau dialih keluar oleh `azd up`/`azd down`.

## Kos dan had

- Semua penyebaran mencipta sumber Azure yang boleh dikenakan bil. Skala-ke-nol hanya terpakai kepada
  pengkomputeran aplikasi; ia tidak menghapuskan kos pendaftaran, pangkalan data, penyimpanan, carian, atau log.
- Harga tepat bergantung pada rantau, mata wang, trafik, model/SKU, dan pengekalan.
  Gunakan [kalkulator harga Azure](https://azure.microsoft.com/pricing/calculator/)
  sebelum penyebaran dan konfigurasikan bajet dalam Pengurusan Kos Azure.
- Data CRUD Flask berada dalam memori, terhad kepada satu pekerja dan paling banyak satu replika secara
  lalai. Ia hilang semasa mulakan semula atau skala-ke-nol. Ini bukan penyimpanan tahan lama.
- Mikroservis produk hanya mendedahkan titik akhir GET. Tiada servis pesanan, servis pengguna,
  pangkalan data, Service Bus, pelaksanaan C#, atau Go disertakan.
- Sumber Application Insights tidak secara automatik menginstrumen setiap aplikasi.
  Rujuk setiap contoh untuk telemetri yang benar-benar dipancarkan.
- Contoh tidak melaksanakan pengesahan aplikasi. Tambah identiti, kebenaran,
  penyimpanan kekal, kawalan rangkaian, ujian, dan prosedur operasi sebelum pengeluaran.

## Sampel Azure luaran — klon secara berasingan

Pautan ini merujuk kepada repositori berasingan, **bukan contoh tempatan**.
Penyelenggara mereka memiliki arahan pemasangan, pelaksanaan, kebergantungan, dan kos.

| Sampel | Fokus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Aplikasi Node.js dengan pangkalan data |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# dan Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend statik dengan Fungsi C# dan SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Aplikasi tanpa pelayan Python |
| [Container Apps store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend kedai bercontainer |
| [AI chat quickstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aplikasi sembang AI |
| [AI agents quickstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplikasi ejen |
| [Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG dengan carian dan sitasi |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Contoh AI perbualan |
| [Java on Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservis Java |

Terokai lebih banyak projek dalam [galeri templat AZD](https://azure.github.io/awesome-azd/).
Jangan andaian projek luaran menyokong `azd` tanpa memeriksa README semasanya.

## Struktur repositori

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Tiada direktori bersama `configurations/`, `scripts/`, atau ujian yang dijanjikan oleh
indeks ini. Fail sebenar dan idea sambungan pilihan dikenalpasti dalam setiap panduan.

## Pembersihan

Untuk empat sampel AZD, jalankan ini **dari direktori sampel yang dipilih**:

```bash
azd down
```

Semak arahan penghapusan. Untuk runcit, padamkan hanya kumpulan sumber khusus
yang anda buat, menggunakan arahan dalam panduan ARM. Periksa Pengurusan Kos Azure
selepas pembersihan; data bil mungkin tiba lewat.

## Menyumbang

Sertakan sumber, infrastruktur, konfigurasi penghantaran, langkah persediaan dan
pengesahan yang boleh diambil tindakan, had, dan arahan pembersihan dengan setiap sampel aplikasi.
Tandakan bahan hanya senibina dan petikan tidak lengkap dengan jelas.
Jangan dakwa kesediaan produksi tanpa ujian penghantaran, fungsi dan operasi.

[Soalan Lazim](../resources/faq.md) · [Panduan belajar](../resources/study-guide.md) ·
[Laporkan isu](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->