# 5. Sesuaikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Tetapkan dasar

Gunakan repositori [Mulai dengan Agen AI](https://github.com/Azure-Samples/get-started-with-ai-agents) yang sudah diinisialisasi dari modul sebelumnya. Catat revisi template, versi AZD, lingkungan yang dipilih, penyebaran model, dan contoh pertanyaan kerja sebelum mengubah apapun.

Contoh ini mengimplementasikan aplikasi chat berbasis agen. Ini **tidak** menjadi sistem ritel dua agen hanya dengan menetapkan variabel lingkungan atau menyimpan file instruksi tambahan. Agen ekstra, pengelola alat, routing, otorisasi, dan akses data memerlukan kode aplikasi.

Periksa instruksi dan alat agen yang saat ini diterapkan di Foundry. Uji satu pertanyaan faktual, satu pertanyaan pengambilan, dan satu pertanyaan yang tidak dapat dijawab oleh data contoh. Verifikasi kutipan dengan dokumen sumber asli daripada mengasumsikan respons yang lancar benar.

## 5.2 Sesuaikan pengambilan pengetahuan

Template mendukung pengambilan berbasis file dan integrasi opsional Azure AI Search. Ikuti [panduan AI Search saat ini](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) untuk pengindeksan dan konfigurasi alat.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Mengaktifkan layanan hanyalah satu bagian dari pengambilan. Sebelum mengunggah data Anda sendiri:

1. Pastikan Anda memiliki izin untuk menggunakan dokumen dan hapus informasi sensitif.
2. Pilih model embedding yang didukung di wilayah Anda dan tetapkan versi kompatibel, tipe penyebaran, dan dimensi vektor yang sesuai.
3. Buat/isi indeks menggunakan proses yang didokumentasikan dalam contoh.
4. Konfigurasikan alat pengambilan agen untuk menggunakan indeks tersebut.
5. Uji pengambilan, kutipan, otorisasi, dan perilaku saat tidak ada dokumen relevan.

Jangan beralih dari `text-embedding-3-small` ke model embedding lain tanpa memeriksa dimensi dan membangun ulang/mengindeks ulang vektor sesuai kebutuhan. Nama seperti `retail-products` bukan katalog yang diimplementasikan atau kebijakan kontrol akses.

## 5.3 Pelacakan dan pemantauan

Ikuti [panduan observabilitas contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Pastikan sumber daya Application Insights yang dibutuhkan dan koneksinya sudah ada; jika mengubah pengaturan infrastruktur, gunakan `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Kirim permintaan uji, lalu periksa log aplikasi Container App dan tampilan pelacakan agen di Foundry. Periksa latensi, panggilan alat, kesalahan, dan korelasi antara permintaan dan jejak. Jangan menganggap telemetri terhubung hanya karena penyebaran berhasil.

Biarkan `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` dinonaktifkan kecuali Anda secara eksplisit telah meninjau persetujuan, redaksi, retensi, dan kontrol akses. Jejak dapat berisi argumen alat sensitif atau konten dokumen meskipun log aplikasi biasa terlihat tidak berbahaya.

## 5.4 Evaluasi agen

Titik masuk evaluasi contoh sekarang adalah [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), bukan direktori `evals/`. Dari root contoh, gunakan lingkungan Python yang memenuhi persyaratan yang didokumentasikan:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Sebelum menjalankan, lengkapi [prasyarat evaluasi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Tes memuat konfigurasi dari `.azure/<environment>/.env` yang dipilih; pastikan lingkungan yang dimaksud sudah dipilih. Input penting meliputi:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, menggunakan format yang dibutuhkan oleh contoh saat ini (versi yang ditinjau menggunakan `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, digunakan sebagai penyebaran model penilai

Periksa tes untuk memahami pilihan evaluator, ambang batas, peran yang dibutuhkan, dan biaya model. Jalankan yang selesai tidak otomatis melewati gerbang kualitas; periksa skor, kasus yang gagal/bermasalah, dan hasil Foundry yang ditautkan.

### Ekstensi evaluasi AZD terpisah

Tes Python di atas adalah **alur kerja spesifik contoh**. Ekstensi opsional `azure.ai.evaluations` adalah alur kerja berbeda, dengan konfigurasi `evals/azure.eval.yaml` sendiri. Ini dipasang secara terpisah, tidak termasuk dalam bundle `microsoft.foundry` 1.0 yang tersedia umum:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Untuk pengaturan ekstensi lengkap, lihat [alur evaluasi dan migrasi](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sejak agen ekstensi beta.22, jangan gunakan perintah `azd ai agent eval` yang dihapus. Memasang ekstensi evaluasi tidak mengonversi tes Python contoh atau otomatis membuat konfigurasi evaluasi.

Untuk **latihan agen yang dihosting GA** yang terpisah, gunakan folder kosong di luar contoh workshop ini dan ikuti [panduan local-to-cloud Foundry](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ini menggunakan AZD 1.37.0+, bundel `microsoft.foundry`, Python 3.13+, dan uv terkini. Anda akan memeriksa `azure.yaml`, menguji secara lokal dengan Agent Inspector, menerapkan sumber untuk build Foundry jarak jauh, dan membuat/meninjau dataset dan rubrik sebelum mengonfigurasi `azd ai eval init --name quality`. Jangan mengganti tes contoh ini atau menganggap pemasangan bundel mengubah model hostingnya.

## 5.5 Red teaming AI dan evaluasi berkelanjutan

Contoh saat ini menyediakan [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Lengkapi prasyaratnya dan tinjau target serta biaya yang dimaksud sebelum menjalankan:

```bash
pytest tests/test_red_teaming.py -s
```

Gunakan penerapan tes yang sah dan data sintetis. Tinjau serangan dan hasil yang dihasilkan; pemindaian ini tidak menentukan bahwa sebuah aplikasi aman atau sesuai.

Panduan [observabilitas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) juga menjelaskan evaluasi berkelanjutan yang dikonfigurasi saat startup container. Evaluasi ini menilai interaksi pengguna nyata, bukan lalu lintas uji yang dihasilkan, dan dukungan evaluator bervariasi menurut wilayah. Tidak ada interaksi berarti tidak ada entri evaluasi. Verifikasi versi sampel yang diinstal dan konfigurasi evaluator alih-alih mengasumsikan setiap penerapan memiliki pengaturan default yang sama.

Autentikasi terpisah dari evaluasi. Ikuti pengaturan identitas/akses yang didokumentasikan dalam sampel. Tidak ada “basic auth fallback” yang didokumentasikan untuk dijadikan andalan dalam melindungi endpoint publik.

## 5.6 Latihan desain: kustomisasi ritel

!!! warning "Latihan desain, bukan penerapan lengkap"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Tulis rencana singkat yang membahas:

| Area | Keputusan dan bukti yang harus dikumpulkan |
|------|-----------------------------------------|
| Tanggung jawab agen | Mulai dengan satu agen, atau jelaskan agen Shopper dan Loyalty yang terpisah beserta logika perutean |
| Data | Definisikan katalog/rewards sintetis dan kepemilikan pembaruan |
| Alat | Terapkan handler baca-saja terlebih dahulu; tentukan otorisasi dan validasi untuk setiap penulisan |
| Model | Pilih kombinasi model/versi/SKU yang tersedia dan verifikasi kuota; hindari penyediaan model yang tidak digunakan |
| Pengambilan | Definisikan pengindeksan, dimensi embedding, kutipan, dan kontrol akses tingkat dokumen |
| Evaluasi | Tambahkan kasus jawaban yang diharapkan, pertanyaan tidak didukung, penggunaan alat, dan kasus keamanan dengan ambang batas yang eksplisit |
| Operasi | Definisikan telemetri, anggaran latensi/galat, batas biaya, dan kepemilikan pembersihan |

Menyimpan `custom-agents/shopper-agent-instructions.md` tidak menyebabkan sampel memuatnya. Temukan kode aplikasi yang membuat/memperbarui agen, hubungkan instruksi yang telah Anda tinjau di sana, dan verifikasi versi agen yang dihasilkan sebelum menguji. Instruksi tidak bisa memberikan akses ke data atau alat yang belum Anda implementasikan.

Terapkan satu perubahan sekaligus, lakukan penerapan ulang komponen yang terkena dampak, dan jalankan ulang pertanyaan dan evaluasi dasar Anda. Simpan revisi yang berfungsi untuk perbandingan. Untuk inspirasi arsitektur, lihat [blueprint ritel](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), yang juga bukan aplikasi ritel lengkap.

!!! quote "PADA AKHIR LAB INI ANDA HARUS MEMILIKI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Lanjut ke [Pembongkaran Infrastruktur](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->