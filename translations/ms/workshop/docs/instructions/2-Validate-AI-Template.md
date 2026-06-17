# 2. Sahkan Templet

> Disahkan menggunakan `azd 1.25.6` pada Jun 2026.

!!! tip "PADA AKHIR MODUL INI ANDA AKAN MAMPU UNTUK"

    - [ ] Menganalisis Seni Bina Penyelesaian AI
    - [ ] Memahami Aliran Kerja Penyebaran AZD
    - [ ] Menggunakan GitHub Copilot untuk bantuan penggunaan AZD
    - [ ] **Makmal 2:** Sebarkan & Sahkan templat Ejen AI

---


## 1. Pengenalan

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) atau `azd` ialah alat baris perintah sumber terbuka yang memudahkan aliran kerja pembangun semasa membina dan menyebarkan aplikasi ke Azure. 

[Templat AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) adalah repositori standard yang termasuk kod aplikasi sampel, aset _infrastruktur-sebagai-kod_, dan fail konfigurasi `azd` untuk seni bina penyelesaian yang padu. Penyediaan infrastruktur menjadi semudah arahan `azd provision` - manakala menggunakan `azd up` membolehkan anda menyedia dan menyebarkan aplikasi anda serentak!

Oleh itu, memulakan proses pembangunan aplikasi anda boleh semudah mencari _Templat Permulaan AZD_ yang paling hampir dengan keperluan aplikasi dan infrastruktur anda - kemudian menyesuaikan repositori supaya sesuai dengan keperluan senario anda.

Sebelum bermula, pastikan anda telah memasang Azure Developer CLI.

1. Buka terminal VS Code dan taip arahan ini:

      ```bash title="" linenums="0"
      azd version
      ```

1. Anda sepatutnya melihat sesuatu seperti ini!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Anda kini bersedia untuk memilih dan menyebarkan templat dengan azd**

---

## 2. Pemilihan Templat

Platform Microsoft Foundry datang dengan [set templat AZD yang disyorkan](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) yang merangkumi senario penyelesaian popular seperti _automasi aliran kerja ejen pelbagai_ dan _pemprosesan kandungan pelbagai mod_. Anda juga boleh menemui templat ini dengan melawat portal Microsoft Foundry.

1. Lawati [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log masuk ke portal Microsoft Foundry apabila diminta - anda akan melihat sesuatu seperti ini.

![Pick](../../../../../translated_images/ms/01-pick-template.60d2d5fff5ebc374.webp)


Pilihan **Basic** ialah templat permulaan anda:

1. [ ] [Mulakan dengan AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) yang menyebarkan aplikasi sembang asas _dengan data anda_ ke Azure Container Apps. Gunakan ini untuk meneroka senario chatbot AI asas.
1. [X] [Mulakan dengan Ejen AI](https://github.com/Azure-Samples/get-started-with-ai-agents) yang juga menyebarkan Ejen AI standard (dengan Ejen Foundry). Gunakan ini untuk mengenali penyelesaian AI agen yang melibatkan alat dan model.

Lawati pautan kedua dalam tab penyemak imbas baru (atau klik `Open in GitHub` untuk kad berkaitan). Anda sepatutnya melihat repositori untuk Templat AZD ini. Luangkan masa seketika untuk meneroka README. Seni bina aplikasi kelihatan seperti ini:

![Arch](../../../../../translated_images/ms/architecture.8cec470ec15c65c7.webp)

---

## 3. Pengaktifan Templat

Mari cuba menyebarkan templat ini dan memastikan ia sah. Kita akan mengikuti garis panduan dalam bahagian [Memulakan](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pilih persekitaran kerja untuk repositori templat:

      - **GitHub Codespaces**: Klik [pautan ini](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) dan sahkan `Create codespace`
      - **Salin tempatan atau bekas pembangunan**: Klon `Azure-Samples/get-started-with-ai-agents` dan buka dalam VS Code

1. Tunggu sehingga terminal VS Code sedia, kemudian taip arahan berikut:

   ```bash title="" linenums="0"
   azd up
   ```

Lengkapkan langkah aliran kerja yang akan dicetuskan:

1. Anda akan diminta untuk log masuk ke Azure - ikut arahan untuk pengesahan
1. Masukkan nama persekitaran unik untuk anda - contohnya, saya guna `nitya-mshack-azd`
1. Ini akan mencipta folder `.azure/` - anda akan melihat subfolder dengan nama persekitaran
1. Anda akan diminta memilih nama langganan - pilih yang lalai
1. Anda akan diminta lokasi - gunakan `East US 2`

Sekarang, anda tunggu sehingga penyediaan selesai. **Ini mengambil masa 10-15 minit**

1. Apabila selesai, konsol anda akan memaparkan mesej BERJAYA seperti ini:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal Azure anda kini mempunyai kumpulan sumber yang telah disediakan dengan nama persekitaran itu:

      ![Infra](../../../../../translated_images/ms/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Anda kini bersedia untuk mengesahkan infrastruktur dan aplikasi yang telah disebarkan**.

---

## 4. Pengesahan Templat

1. Lawati halaman Kumpulan Sumber Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - log masuk apabila diminta
1. Klik pada Kumpulan Sumber (RG) untuk nama persekitaran anda - anda akan melihat halaman di atas

      - klik pada sumber Azure Container Apps
      - klik pada URL Aplikasi di bahagian _Essentials_ (atas kanan)

1. Anda sepatutnya melihat antaramuka hadapan aplikasi yang dihoskan seperti ini:

   ![App](../../../../../translated_images/ms/03-test-application.471910da12c3038e.webp)

1. Cuba kemukakan beberapa [soalan sampel](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanyakan: ```Apakah ibu negara Perancis?``` 
      1. Tanyakan: ```Apa khemah terbaik di bawah $200 untuk dua orang, dan apa ciri-cirinya?```

1. Anda sepatutnya mendapat jawapan serupa seperti yang dipaparkan di bawah. _Tapi bagaimana ia berfungsi?_

      ![App](../../../../../translated_images/ms/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Pengesahan Ejen

Azure Container App menyebarkan titik hujung yang bersambung ke Ejen AI yang disediakan dalam projek Microsoft Foundry untuk templat ini. Mari lihat apa maksudnya.

1. Kembali ke halaman _Overview_ Kumpulan Sumber anda di Azure Portal

1. Klik pada sumber `Microsoft Foundry` dalam senarai itu

1. Anda akan melihat ini. Klik butang `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/ms/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Anda akan melihat halaman Projek Foundry untuk aplikasi AI anda
   ![Project](../../../../../translated_images/ms/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik pada `Agents` - anda akan melihat Ejen lalai yang disediakan dalam projek anda
   ![Agents](../../../../../translated_images/ms/06-visit-agents.bccb263f77b00a09.webp)

1. Pilihnya - dan anda akan melihat butiran Ejen. Ambil perhatian perkara berikut:

      - Ejen menggunakan Carian Fail secara lalai (sentiasa)
      - `Knowledge` ejen menunjukkan ia mempunyai 32 fail dimuat naik (untuk carian fail)
      ![Agents](../../../../../translated_images/ms/07-view-agent-details.0e049f37f61eae62.webp)

1. Cari pilihan `Data+indexes` dalam menu kiri dan klik untuk butiran.

      - Anda akan melihat 32 fail data yang dimuat naik untuk pengetahuan.
      - Ini akan sepadan dengan 12 fail pelanggan dan 20 fail produk dalam `src/files`
      ![Data](../../../../../translated_images/ms/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Anda telah mengesahkan operasi Ejen!**

1. Jawapan ejen berasaskan pengetahuan dalam fail-fail tersebut.
1. Anda kini boleh bertanya soalan berkaitan data itu, dan mendapat jawapan berasas.
1. Contoh: `customer_info_10.json` menerangkan 3 pembelian yang dibuat oleh "Amanda Perez"

Kembali ke tab penyemak imbas dengan titik hujung Container App dan tanya: `Apa produk yang dimiliki Amanda Perez?`. Anda sepatutnya melihat sesuatu seperti ini:

![Data](../../../../../translated_images/ms/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Padang Permainan Ejen

Mari bina sedikit lagi kefahaman untuk keupayaan Microsoft Foundry, dengan mencuba Ejen di Padang Permainan Ejen.

1. Kembali ke halaman `Agents` dalam Microsoft Foundry - pilih ejen lalai
1. Klik pilihan `Try in Playground` - anda akan mendapat UI Padang Permainan seperti ini
1. Tanya soalan yang sama: `Apa produk yang dimiliki Amanda Perez?`

    ![Data](../../../../../translated_images/ms/09-ask-in-playground.a1b93794f78fa676.webp)

Anda mendapat jawapan yang sama (atau serupa) - tetapi anda juga mendapat maklumat tambahan yang boleh digunakan untuk memahami kualiti, kos, dan prestasi aplikasi agen anda. Contohnya:

1. Perhatikan bahawa jawapan menyebut fail data yang digunakan untuk "mendasarkan" jawapan
1. Gerakkan tetikus di atas mana-mana label fail ini - adakah data sepadan dengan pertanyaan dan jawapan yang dipaparkan?

Anda juga melihat bar _stats_ di bawah jawapan.

1. Gerakkan tetikus di atas mana-mana metrik - contohnya, Keselamatan. Anda akan melihat sesuatu seperti ini
1. Adakah penilaian yang dibuat sepadan dengan intuisi anda terhadap tahap keselamatan jawapan?

      ![Data](../../../../../translated_images/ms/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Kebolehamatan Terbina Dalam

Kebolehamatan ialah tentang memasang instrumen dalam aplikasi anda untuk menghasilkan data yang boleh digunakan untuk memahami, menyahpepijat, dan mengoptimumkan operasi aplikasi. Untuk mendapatkan gambaran tentang ini:

1. Klik butang `View Run Info` - anda akan melihat paparan ini. Ini contoh [penjejakan Ejen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) sedang beraksi. _Anda juga boleh mendapat paparan ini dengan mengklik Thread Logs dalam menu atas_.

   - Dapatkan gambaran tentang langkah dan alat yang digunakan oleh ejen
   - Fahami jumlah kiraan Token (berbanding penggunaan token output) untuk jawapan
   - Fahami latensi dan di mana masa dihabiskan dalam pelaksanaan

      ![Agent](../../../../../translated_images/ms/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik tab `Metadata` untuk melihat atribut tambahan bagi larian itu, yang mungkin memberikan konteks berguna untuk menyahpepijat isu kemudian.

      ![Agent](../../../../../translated_images/ms/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik tab `Evaluations` untuk melihat penilaian automatik yang dibuat ke atas jawapan ejen. Ini termasuk penilaian keselamatan (contoh: Bahaya Diri) dan penilaian khusus ejen (contoh: Penyelesaian niat, Pematuhan tugas).

      ![Agent](../../../../../translated_images/ms/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Akhir sekali, klik tab `Monitoring` dalam menu bar sisi.

      - Pilih tab `Resource usage` pada halaman yang dipaparkan - dan lihat metrik.
      - Jejaki penggunaan aplikasi dari segi kos (token) dan beban (permintaan).
      - Jejaki latensi aplikasi kepada byte pertama (pemprosesan input) dan byte terakhir (output).

      ![Agent](../../../../../translated_images/ms/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Pembolehubah Persekitaran

Sejauh ini, kita telah menelusuri penyebaran dalam penyemak imbas - dan mengesahkan bahawa infrastruktur kita telah disediakan dan aplikasi beroperasi. Tetapi untuk bekerja dengan _kod aplikasi dulu_, kita perlu konfigurasikan persekitaran pembangunan tempatan dengan pembolehubah berkaitan yang diperlukan untuk bekerja dengan sumber ini. Menggunakan `azd` menjadikannya mudah.

1. Azure Developer CLI [menggunakan pembolehubah persekitaran](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) untuk menyimpan dan mengurus tetapan konfigurasi bagi penyebaran aplikasi.

1. Pembolehubah persekitaran disimpan dalam `.azure/<env-name>/.env` - ini mengikatnya pada persekitaran `env-name` yang digunakan semasa penyebaran dan membantu anda mengasingkan persekitaran antara sasaran penyebaran berbeza dalam repositori yang sama.

1. Pembolehubah persekitaran dimuat secara automatik oleh arahan `azd` bila-bila ia menjalankan arahan tertentu (contoh: `azd up`). Perlu diingat `azd` tidak membaca pembolehubah persekitaran _peringkat OS_ secara automatik (contoh: ditetapkan dalam shell) - gunakan `azd set env` dan `azd get env` untuk memindahkan maklumat dalam skrip.


Mari cuba beberapa arahan:

1. Dapatkan semua pembolehubah persekitaran yang ditetapkan untuk `azd` dalam persekitaran ini:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Anda akan melihat sesuatu seperti:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Dapatkan nilai spesifik - contohnya, saya mahu tahu jika `AZURE_AI_AGENT_MODEL_NAME` ditetapkan

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Anda akan melihat sesuatu seperti ini - ia tidak ditetapkan secara lalai!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Tetapkan pembolehubah persekitaran baru untuk `azd`. Di sini, kita kemaskini nama model ejen. _Nota: sebarang perubahan yang dibuat akan terus dipaparkan dalam fail `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sekarang, kita perlu mendapati nilai itu ditetapkan:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Harus diingat bahawa sesetengah sumber adalah berterusan (contohnya, penyebaran model) dan akan memerlukan lebih daripada sekadar `azd up` untuk memaksa penyebaran semula. Mari cuba menanggalkan penyebaran asal dan menyebarkannya semula dengan pembolehubah persekitaran yang diubah.

1. **Segarkan** Jika anda pernah menyebarkan infrastruktur menggunakan templat azd sebelum ini - anda boleh _menyegarkan semula_ keadaan pembolehubah persekitaran tempatan anda berdasarkan keadaan penyebaran Azure anda semasa dengan arahan ini:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ini adalah cara yang berkuasa untuk _sync_ pembolehubah persekitaran merentas dua atau lebih persekitaran pembangunan tempatan (contohnya, pasukan dengan berbilang pembangun) - membolehkan infrastruktur yang ditempatkan berfungsi sebagai kebenaran asas untuk keadaan pembolehubah env. Ahli pasukan hanya perlu _refresh_ pembolehubah untuk kembali selari.

---

## 9. Tahniah 🏆

Anda baru sahaja melengkapkan aliran kerja hujung ke hujung di mana anda:

- [X] Memilih Templat AZD Yang Anda Ingin Gunakan
- [X] Membuka templat dalam persekitaran pembangunan yang disokong
- [X] Menyebarkan Templat dan mengesahkannya berfungsi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->