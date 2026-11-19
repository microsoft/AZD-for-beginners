# 5. Sesuaikan Templat

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Tetapkan garis dasar

Gunakan repositori [Memulakan dengan Ejen AI](https://github.com/Azure-Samples/get-started-with-ai-agents) yang telah diinisialisasi dari modul sebelumnya. Rekod semakan templat, versi AZD, persekitaran yang dipilih, penyebaran model, dan soalan contoh yang berfungsi sebelum mengubah apa-apa.

Contoh ini melaksanakan aplikasi sembang yang disokong ejen. Ia **tidak** menjadi sistem runcit dua ejen hanya dengan menetapkan pembolehubah persekitaran atau menyimpan fail arahan tambahan. Ejen tambahan, pengendali alat, penalaan laluan, kebenaran, dan akses data memerlukan kod aplikasi.

Periksa arahan dan alat ejen yang sedang disebarkan di Foundry. Uji satu soalan fakta, satu soalan pengambilan, dan satu soalan yang data contoh tidak dapat jawab. Sahkan petikan terhadap dokumen sumber sebenar dan jangan menganggap respons yang lancar adalah betul.

## 5.2 Sesuaikan pengambilan pengetahuan

Templat menyokong pengambilan berasaskan fail dan integrasi Azure AI Search pilihan. Ikuti [panduan semasa AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) untuk pengindeksan dan konfigurasi alat.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Mengaktifkan perkhidmatan hanya sebahagian daripada pengambilan. Sebelum memuat naik data anda sendiri:

1. Sahkan anda mempunyai kebenaran untuk menggunakan dokumen dan buang maklumat sensitif.
2. Pilih model pembenaman yang disokong di rantau anda dan tetapkan versi serasi, jenis penyebaran, dan dimensi vektor.
3. Cipta/isikan indeks menggunakan proses yang didokumenkan dalam contoh.
4. Konfigurasikan alat pengambilan ejen untuk menggunakan indeks tersebut.
5. Uji pengambilan, petikan, kebenaran, dan tingkah laku apabila tiada dokumen yang relevan wujud.

Jangan tukar dari `text-embedding-3-small` ke model pembenaman lain tanpa memeriksa dimensi dan membina semula/mengindeks vektor jika perlu. Nama seperti `retail-products` bukan katalog yang dilaksanakan atau polisi kawalan akses.

## 5.3 Jejak dan pemantauan

Ikuti [panduan observabiliti contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Pastikan sumber Application Insights dan sambungannya wujud; jika menukar tetapan infrastruktur, gunakan `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Hantar permintaan ujian, kemudian periksa log aplikasi Container App dan pandangan jejak ejen di Foundry. Periksa kelewatan, panggilan alat, ralat, dan korelasi antara permintaan dan jejak. Jangan anggap telemetri disambungkan hanya kerana penyebaran berjaya.

Tinggalkan `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` dilumpuhkan kecuali anda telah secara jelas menyemak persetujuan, penghapusan, penyimpanan, dan kawalan akses. Jejak boleh mengandungi argumen alat sensitif atau kandungan dokumen walaupun log aplikasi biasa kelihatan tidak berbahaya.

## 5.4 Penilaian ejen

Titik masuk penilaian contoh sekarang ialah [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), bukan direktori `evals/`. Dari akar contoh, gunakan persekitaran Python yang memenuhi keperluan yang didokumenkan:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Sebelum menjalankan, lengkapkan [prasyarat penilaian](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Ujian memuatkan konfigurasi daripada `.azure/<environment>/.env` yang dipilih; sahkan persekitaran yang dimaksudkan dipilih. Input penting termasuk:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, menggunakan format yang diperlukan oleh contoh semasa (versi yang disemak menggunakan `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, digunakan sebagai penyebaran model hakim

Periksa ujian untuk memahami pilihan penilai, ambang, peranan diperlukan, dan kos model. Larian lengkap bukan secara automatik gerbang kualiti lulus; periksa skor, kes gagal/bermasalah, dan keputusan yang dipautkan di Foundry.

### Sambungan penilaian AZD berasingan

Ujian Python di atas adalah **aliran kerja khusus contoh**. Sambungan pilihan `azure.ai.evaluations` adalah aliran kerja berbeza, dengan konfigurasi `evals/azure.eval.yaml` sendiri. Ia dipasang secara berasingan, tidak termasuk dalam bundel `microsoft.foundry` 1.0 yang tersedia secara umum:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Untuk setup sambungan lengkap, lihat [aliran kerja penilaian dan migrasi](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sejak sambungan ejen beta.22, jangan gunakan arahan `azd ai agent eval` yang telah dialih keluar. Memasang sambungan penilaian tidak menukar ujian Python contoh atau automatik mencipta konfigurasi penilaian.

Untuk latihan ejen hos **GA berasingan**, gunakan folder kosong di luar contoh bengkel ini dan ikuti [panduan Foundry dari lokal ke awan](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ia menggunakan AZD 1.37.0+, bundel `microsoft.foundry`, Python 3.13+, dan uv semasa. Anda akan memeriksa `azure.yaml`, ujian secara lokal dengan Agent Inspector, menyebarkan sumber untuk binaan Foundry jauh, dan menjana/menyemak dataset dan rubrik sebelum mengkonfigurasi `azd ai eval init --name quality`. Jangan menggantikan ujian contoh ini atau anggap memasang bundel mengubah model hosnya.

## 5.5 Red teaming AI dan penilaian berterusan

Contoh semasa menyediakan [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Lengkapkan prasyaratnya dan semak sasaran dan kos yang dimaksudkan sebelum menjalankan:

```bash
pytest tests/test_red_teaming.py -s
```

Gunakan penyebaran ujian yang dibenarkan dan data sintetik. Semak serangan dan hasil yang dijana; imbasan ini tidak menetapkan bahawa aplikasi selamat atau mematuhi peraturan.

Panduan [observability](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) juga menerangkan penilaian berterusan yang dikonfigurasikan semasa permulaan kontena. Ia menilai interaksi pengguna sebenar, bukan trafik ujian yang dijana, dan sokongan penilai berbeza mengikut wilayah. Tiada interaksi bermakna tiada entri penilaian. Sahkan versi sampel yang dipasang dan konfigurasi penilai dan bukannya menganggap setiap penyebaran mempunyai tetapan lalai yang sama.

Pengesahan adalah berasingan daripada penilaian. Ikuti tetapan identiti/akses yang didokumenkan dalam sampel. Tiada “fallback auth asas” yang didokumenkan untuk bergantung bagi melindungi titik akhir awam.

## 5.6 Latihan reka bentuk: pengkhususan runcit

!!! warning "Latihan reka bentuk, bukan penyebaran lengkap"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Tulis pelan ringkas yang merangkumi:

| Kawasan | Keputusan dan bukti untuk dikumpulkan |
|------|----------------------------------|
| Tanggungjawab agen | Mula dengan satu agen, atau justifikasikan agen Shopper dan Loyalty yang berasingan serta logik penghalaan |
| Data | Tetapkan katalog sintetik/dataset ganjaran dan pemilikan kemas kini |
| Alat | Laksanakan pengendali baca sahaja terlebih dahulu; nyatakan kebenaran dan pengesahan untuk sebarang penulisan |
| Model | Pilih kombinasi model/versi/SKU yang tersedia dan sahkan kuota; elakkan penyediaan model yang tidak digunakan |
| Pengambilan | Tetapkan pengindeksan, dimensi embedding, petikan, dan kawalan akses peringkat dokumen |
| Penilaian | Tambah jawapan dijangka, soalan tidak disokong, penggunaan alat, dan kes keselamatan dengan ambang yang jelas |
| Operasi | Tetapkan telemetri, bajet kelewatan/ralat, had kos, dan pemilikan pembersihan |

Menyimpan `custom-agents/shopper-agent-instructions.md` tidak menyebabkan sampel memuatkannya. Cari kod aplikasi yang mencipta/mengemas kini agen, sambungkan arahan yang telah anda semak di situ, dan sahkan versi agen yang terhasil sebelum menguji. Arahan tidak boleh memberi akses kepada data atau alat yang belum anda laksanakan.

Terapkan satu perubahan pada satu masa, sebarkan semula komponen yang terjejas, dan jalankan semula soalan asas dan penilaian anda. Simpan revisi yang berfungsi untuk perbandingan. Untuk inspirasi seni bina, lihat [rangka kerja runcit](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), yang juga bukan aplikasi runcit lengkap.

!!! quote "PADA AKHIR MAJLIS INI ANDA SEPATUTNYA MEMPUNYAI"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Teruskan ke [Pembongkaran Infrastruktur](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->