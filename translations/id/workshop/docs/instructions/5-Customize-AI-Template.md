# 5. Sesuaikan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Menetapkan baseline

Gunakan repositori [Memulai dengan Agen AI](https://github.com/Azure-Samples/get-started-with-ai-agents) yang sudah diinisialisasi dari modul sebelumnya. Catat revisi template, versi AZD, lingkungan yang dipilih, deployment model, dan pertanyaan sampel yang berhasil sebelum mengubah apa pun.

Sampel ini mengimplementasikan aplikasi chat yang didukung agen. Ini **tidak** secara otomatis menjadi sistem ritel dua agen hanya dengan mengatur variabel lingkungan atau menyimpan file instruksi tambahan. Agen ekstra, pengelola alat, routing, otorisasi, dan akses data memerlukan kode aplikasi.

Periksa instruksi dan alat agen yang saat ini dideploy di Foundry. Uji satu pertanyaan faktual, satu pertanyaan pengambilan, dan satu pertanyaan yang tidak dapat dijawab data sampel. Verifikasi sitasi terhadap dokumen sumber asli, jangan hanya menganggap respons yang lancar itu benar.

## 5.2 Sesuaikan pengambilan pengetahuan

Template mendukung pengambilan berbasis file dan integrasi opsional Azure AI Search. Ikuti [panduan AI Search saat ini](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) untuk pengindeksan dan konfigurasi alat.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Mengaktifkan layanan hanya salah satu bagian dari pengambilan. Sebelum mengunggah data sendiri:

1. Pastikan Anda memiliki izin menggunakan dokumen dan hapus informasi sensitif.
2. Pilih model embedding yang didukung di wilayah Anda dan atur versi, jenis deployment, dan dimensi vektor yang kompatibel.
3. Buat/isi indeks menggunakan proses terdokumentasi pada sampel.
4. Konfigurasikan alat pengambilan agen untuk menggunakan indeks tersebut.
5. Uji pengambilan, sitasi, otorisasi, dan perilaku saat tidak ada dokumen yang relevan.

Jangan pindah dari `text-embedding-3-small` ke model embedding lain tanpa memeriksa dimensi dan membangun ulang/mengindeks ulang vektor sesuai kebutuhan. Nama seperti `retail-products` bukan katalog yang diimplementasikan atau kebijakan kontrol akses.

## 5.3 Pelacakan dan pemantauan

Ikuti [panduan observabilitas sampel](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Pastikan sumber daya Application Insights dan koneksi yang diperlukan sudah ada; jika mengubah pengaturan infrastruktur, gunakan `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Kirim permintaan uji, lalu periksa log aplikasi Container App dan tampilan pelacakan agen di Foundry. Periksa latensi, panggilan alat, kesalahan, dan korelasi antara permintaan dan jejak. Jangan menganggap telemetri terhubung hanya karena deployment berhasil.

Biarkan `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` dinonaktifkan kecuali Anda sudah secara eksplisit meninjau persetujuan, redaksi, retensi, dan kontrol akses. Jejak dapat berisi argumen alat yang sensitif atau isi dokumen bahkan ketika log aplikasi biasa tampak tidak berbahaya.

## 5.4 Evaluasi agen

Titik masuk evaluasi sampel kini adalah [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), bukan direktori `evals/`. Dari root sampel, gunakan lingkungan Python yang memenuhi persyaratan terdokumentasi:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Sebelum menjalankan, selesaikan [prasyarat evaluasi](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Tes memuat konfigurasi dari `.azure/<environment>/.env` yang dipilih; pastikan lingkungan yang dimaksud sudah dipilih. Input penting meliputi:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, menggunakan format yang diminta oleh sampel saat ini (versi yang ditinjau menggunakan `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, digunakan sebagai deployment model penilai

Periksa tes untuk memahami pilihan evaluator, ambang batas, peran yang dibutuhkan, dan biaya model. Jalannya tes yang selesai tidak otomatis berarti melewati quality gate; periksa skor, kasus gagal/error, dan hasil Foundry yang terkait.

### Ekstensi evaluasi AZD terpisah

Tes Python di atas adalah **alur kerja khusus sampel**. Ekstensi opsional `azure.ai.evaluations` adalah alur kerja berbeda, dengan konfigurasi `evals/azure.eval.yaml` sendiri:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Untuk penyiapan ekstensi lengkap, lihat [alur kerja evaluasi dan migrasi](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sejak ekstensi agen beta.22, jangan gunakan perintah `azd ai agent eval` yang dihapus. Menginstal ekstensi evaluasi tidak mengubah tes Python sampel atau otomatis membuat konfigurasi evaluasi.

## 5.5 Red teaming AI dan evaluasi berkelanjutan

Sampel saat ini menyediakan [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Selesaikan prasyaratnya dan tinjau target serta biaya yang dimaksud sebelum menjalankan:

```bash
pytest tests/test_red_teaming.py -s
```

Gunakan deployment uji yang berwenang dan data sintetis. Tinjau serangan dan hasil yang dihasilkan; pemindaian ini tidak menetapkan bahwa aplikasi aman atau sesuai.

Panduan [observabilitas](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) juga menjelaskan evaluasi berkelanjutan yang dikonfigurasi saat startup kontainer. Evaluasi ini mengevaluasi interaksi pengguna nyata, bukan lalu lintas uji yang dihasilkan, dan dukungan evaluator bervariasi menurut wilayah. Tidak adanya interaksi berarti tidak ada entri evaluasi. Verifikasi versi contoh yang terpasang dan konfigurasi evaluator daripada mengasumsikan setiap penerapan memiliki pengaturan default yang sama.

Otentikasi terpisah dari evaluasi. Ikuti pengaturan identitas/akses yang didokumentasikan pada contoh. Tidak ada “basic auth fallback” yang didokumentasikan untuk diandalkan dalam melindungi endpoint publik.

## 5.6 Latihan desain: kustomisasi ritel

!!! warning "Latihan desain, bukan penerapan yang selesai"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Tulislah rencana singkat yang membahas:

| Area | Keputusan dan bukti yang harus dikumpulkan |
|------|----------------------------------|
| Tanggung jawab agen | Mulailah dengan satu agen, atau justifikasi agen Shopper dan Loyalty terpisah serta logika pengarahannya |
| Data | Definisikan dataset katalog/reward sintetis dan kepemilikan pembaruan |
| Alat | Terapkan handler baca-saja terlebih dahulu; tentukan otorisasi dan validasi untuk setiap penulisan |
| Model | Pilih kombinasi model/versi/SKU yang tersedia dan verifikasi kuota; hindari penyediaan model yang tidak digunakan |
| Pengambilan | Definisikan pengindeksan, dimensi embedding, sitasi, dan kontrol akses tingkat dokumen |
| Evaluasi | Tambahkan kasus jawaban yang diharapkan, pertanyaan yang tidak didukung, penggunaan alat, dan keselamatan dengan ambang batas eksplisit |
| Operasi | Definisikan telemetri, anggaran latensi/kerusakan, batas biaya, dan kepemilikan pembersihan |

Menyimpan `custom-agents/shopper-agent-instructions.md` tidak menyebabkan contoh memuatnya. Temukan kode aplikasi yang membuat/memperbarui agen, hubungkan instruksi hasil tinjauan Anda di sana, dan verifikasi versi agen yang dihasilkan sebelum menguji. Instruksi tidak dapat memberikan akses ke data atau alat yang belum Anda terapkan.

Terapkan satu perubahan dalam satu waktu, terapkan ulang komponen yang terpengaruh, dan jalankan ulang pertanyaan serta evaluasi baseline Anda. Simpan revisi yang berfungsi untuk perbandingan. Untuk inspirasi arsitektur, lihatlah [retail blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), yang juga bukan aplikasi ritel lengkap.

!!! quote "PADA AKHIR LAB INI ANDA HARUS MEMILIKI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Lanjutkan ke [Teardown Infrastructure](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->