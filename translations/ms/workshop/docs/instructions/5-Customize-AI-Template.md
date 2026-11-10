# 5. Sesuaikan Templat

!!! tip "PADA AKHIR MODUL INI, ANDA AKAN BOLEH"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Tetapkan garisan asas

Gunakan repositori [Memulakan dengan Ejen AI](https://github.com/Azure-Samples/get-started-with-ai-agents) yang telah diinisialisasi dari modul-modul sebelum ini. Rekodkan semakan templat, versi AZD, persekitaran yang dipilih, penyebaran model, dan soalan contoh yang berfungsi sebelum menukar apa-apa.

Contoh ini melaksanakan aplikasi sembang yang disokong ejen. Ia **tidak** menjadi sistem runcit dua ejen hanya dengan menetapkan pembolehubah persekitaran atau menyimpan fail arahan tambahan. Ejen tambahan, pengendali alat, penghalaan, kebenaran, dan akses data memerlukan kod aplikasi.

Periksa arahan dan alat ejen yang sedang disebarkan dalam Foundry. Uji satu soalan fakta, satu soalan pengambilan, dan satu soalan yang data contoh tidak dapat jawab. Sahkan petikan mengikut dokumen sumber sebenar dan jangan menganggap jawapan lancar adalah betul.

## 5.2 Sesuaikan pengambilan pengetahuan

Templat ini menyokong pengambilan berasaskan fail dan integrasi pilihan Azure AI Search. Ikuti [panduan AI Search semasa](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) untuk pengindeksan dan konfigurasi alat.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Mengaktifkan perkhidmatan hanyalah sebahagian daripada pengambilan. Sebelum memuat naik data anda sendiri:

1. Sahkan anda mempunyai kebenaran untuk menggunakan dokumen dan alihkan maklumat sensitif.
2. Pilih model embedding yang disokong di rantau anda dan tetapkan versi yang serasi, jenis penyebaran, dan dimensi vektor.
3. Cipta/isikan indeks menggunakan proses yang didokumenkan dalam contoh.
4. Konfigurasikan alat pengambilan ejen untuk menggunakan indeks tersebut.
5. Uji pengambilan, petikan, kebenaran, dan tingkah laku apabila tiada dokumen berkaitan wujud.

Jangan alihkan dari `text-embedding-3-small` ke model embedding lain tanpa memeriksa dimensi dan membina semula/mengindeks semula vektor jika perlu. Nama seperti `retail-products` bukan katalog yang dilaksanakan atau polisi kawalan akses.

## 5.3 Jejak dan pemantauan

Ikuti [panduan kebolehlihatan contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Pastikan sumber Application Insights yang diperlukan dan sambungan sudah wujud; jika menukar tetapan infrastruktur, gunakan `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Hantar permintaan ujian, kemudian periksa log aplikasi Container App dan pandangan jejak ejen dalam Foundry. Periksa kelewatan, panggilan alat, ralat, dan korelasi antara permintaan dan jejak. Jangan anggap telemetri disambung hanya kerana penyebaran berjaya.

Biarkan `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` dilumpuhkan melainkan anda secara eksplisit telah mengkaji persetujuan, penyuntingan, penahanan, dan kawalan akses. Jejak boleh mengandungi hujah alat sensitif atau kandungan dokumen walaupun log aplikasi biasa kelihatan selamat.

## 5.4 Penilaian Ejen

Titik masuk penilaian contoh sekarang ialah [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), bukan direktori `evals/`. Dari akar contoh, gunakan persekitaran Python yang memenuhi keperluan dokumennya:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Sebelum menjalankan, lengkapkan [prasyarat penilaian](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Ujian memuat konfigurasi dari `.azure/<environment>/.env` yang dipilih; sahkan persekitaran yang dimaksudkan dipilih. Input penting termasuk:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, menggunakan format yang diperlukan oleh contoh semasa (versi semak guna `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, digunakan sebagai penyebaran model hakim

Periksa ujian untuk memahami pilihan penilai, ambang, peranan diperlukan, dan kos model. Larian yang selesai bukan secara automatik pintu kualiti lulus; periksa skor, kes gagal/ralat, dan keputusan Foundry yang berkaitan.

### Sambungan penilaian AZD yang berasingan

Ujian Python di atas adalah **aliran kerja khusus contoh**. Sambungan pilihan `azure.ai.evaluations` adalah aliran kerja berbeza, dengan konfigurasi `evals/azure.eval.yaml` sendiri:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Untuk setup sambungan lengkap, lihat [aliran kerja penilaian dan migrasi](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Sejak beta.22 sambungan ejen, jangan gunakan arahan `azd ai agent eval` yang telah dibuang. Memasang sambungan penilaian tidak menukar ujian Python contoh atau secara automatik mencipta konfigurasi penilaian.

## 5.5 Pengujian merah AI dan penilaian berterusan

Contoh semasa menyediakan [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Lengkapkan prasyaratnya dan semak sasaran dan kos yang dimaksudkan sebelum menjalankan:

```bash
pytest tests/test_red_teaming.py -s
```

Gunakan penyebaran ujian yang dibenarkan dan data sintetik. Semak serangan dan keputusan yang dijana; imbasan ini tidak menentukan bahawa sesuatu aplikasi itu selamat atau mematuhi.

Panduan [observability](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) juga menerangkan penilaian berterusan yang dikonfigurasikan semasa permulaan bekas. Ia menilai interaksi pengguna sebenar, bukan trafik ujian yang dijana, dan sokongan penilai berbeza mengikut wilayah. Tiada interaksi bermakna tiada entri penilaian. Sahkan versi contoh yang dipasang dan konfigurasi penilai daripada membuat andaian setiap pelaksanaan mempunyai tetapan lalai yang sama.

Pengesahan adalah berasingan daripada penilaian. Ikut tetapan identiti/akses yang didokumentasikan dalam contoh. Tiada “fallback basic auth” yang didokumentasikan untuk melindungi titik akhir awam.

## 5.6 Latihan reka bentuk: penyesuaian runcit

!!! warning "Latihan reka bentuk, bukan pelaksanaan lengkap"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Tulis pelan ringkas yang merangkumi:

| Kawasan | Keputusan dan bukti yang perlu dikumpul |
|------|----------------------------------|
| Tanggungjawab agen | Mulakan dengan satu agen, atau justifikasikan agen Shopper dan Loyalty yang berasingan serta logik perutean |
| Data | Definisikan set data katalog/ganjaran sintetik dan pemilikan kemas kini |
| Alat | Laksanakan pengendali baca sahaja dahulu; nyatakan kebenaran dan pengesahan untuk sebarang penulisan |
| Model | Pilih kombinasi model/versi/SKU yang tersedia dan sahkan kuota; elakkan memperuntukkan model yang tidak digunakan |
| Pengambilan | Definisikan pengindeksan, dimensi embedding, sitasi, dan kawalan akses tahap dokumen |
| Penilaian | Tambah kes jawapan dijangka, soalan tidak disokong, penggunaan alat, dan keselamatan dengan ambang yang jelas |
| Operasi | Definisikan telemetri, belanjawan kelewatan/ralat, had kos, dan pemilikan pembersihan |

Menyimpan `custom-agents/shopper-agent-instructions.md` tidak menyebabkan contoh memuatkannya. Cari kod aplikasi yang mencipta/mengemas kini agen, sambungkan arahan yang telah anda semak di sana, dan sahkan versi agen yang terhasil sebelum menguji. Arahan tidak boleh memberikan akses kepada data atau alat yang belum anda laksanakan.

Terapkan satu perubahan pada satu masa, lancarkan semula komponen yang terjejas, dan jalankan semula soalan asas serta penilaian anda. Simpan revisi yang berfungsi untuk perbandingan. Untuk inspirasi reka bentuk, lihat [pelan induk runcit](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), yang juga bukan aplikasi runcit lengkap.

!!! quote "PADA AKHIR MAKMAL INI ANDA SEPATUTNYA MEMPUNYAI"

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