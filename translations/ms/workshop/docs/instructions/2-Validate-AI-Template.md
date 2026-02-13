# 2. Sahkan Template

!!! tip "PADA AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Menganalisis Seni Bina Penyelesaian AI
    - [ ] Memahami Aliran Kerja Penyebaran AZD
    - [ ] Menggunakan GitHub Copilot untuk mendapatkan bantuan tentang penggunaan AZD
    - [ ] **Makmal 2:** Sebarkan & Sahkan templat AI Agents

---


## 1. Pengenalan

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) atau `azd` ialah alat baris perintah sumber terbuka yang mempermudah aliran kerja pembangun semasa membina dan menyebarkan aplikasi ke Azure.

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) ialah repositori piawaian yang termasuk kod aplikasi contoh, aset _infrastruktur-sebagai-kod_, dan fail konfigurasi `azd` untuk seni bina penyelesaian yang padu. Menyediakan infrastruktur menjadi semudah arahan `azd provision` - sementara menggunakan `azd up` membolehkan anda menyedia dan menyebarkan aplikasi anda dalam satu langkah!

Sebagai hasilnya, memulakan proses pembangunan aplikasi anda boleh semudah mencari _templat Pengenalan AZD_ yang paling hampir dengan keperluan aplikasi dan infrastruktur anda - kemudian menyesuaikan repositori agar sesuai dengan keperluan senario anda.

Sebelum kita mulakan, pastikan anda telah memasang Azure Developer CLI.

1. Buka terminal VS Code dan taip arahan ini:

      ```bash title="" linenums="0"
      azd version
      ```

1. Anda harus melihat sesuatu seperti ini!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Anda kini bersedia untuk memilih dan menyebarkan templat dengan azd**

---

## 2. Pemilihan Templat

Platform Microsoft Foundry datang dengan [set templat AZD yang disyorkan](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) yang merangkumi senario penyelesaian popular seperti _automasi aliran kerja pelbagai agen_ dan _pemprosesan kandungan pelbagai mod_. Anda juga boleh menemui templat ini dengan melawat portal Microsoft Foundry.

1. Lawati [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log masuk ke portal Microsoft Foundry apabila diminta - anda akan melihat sesuatu seperti ini.

![Pick](../../../../../translated_images/ms/01-pick-template.60d2d5fff5ebc374.webp)


Pilihan **Basic** ialah templat pengenalan anda:

1. [ ] [Mula Dengan AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) yang menyebarkan aplikasi sembang asas _dengan data anda_ ke Azure Container Apps. Gunakan ini untuk meneroka senario chatbot AI asas.
1. [X] [Mula Dengan AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) yang juga menyebarkan AI Agent standard (dengan Foundry Agents). Gunakan ini untuk membiasakan diri dengan penyelesaian AI agenik yang melibatkan alat dan model.

Lawati pautan kedua dalam tab penyemak imbas baru (atau klik `Open in GitHub` untuk kad yang berkaitan). Anda harus melihat repositori untuk Templat AZD ini. Luangkan masa melihat README. Seni bina aplikasi kelihatan seperti ini:

![Arch](../../../../../translated_images/ms/architecture.8cec470ec15c65c7.webp)

---

## 3. Pengaktifan Templat

Mari cuba menyebarkan templat ini dan pastikan ia sah. Kita akan mengikuti panduan dalam bahagian [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Klik [pautan ini](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - sahkan tindakan lalai untuk `Create codespace`
1. Ini akan membuka tab penyemak imbas baru - tunggu sesi GitHub Codespaces selesai dimuatkan
1. Buka terminal VS Code dalam Codespaces - taip arahan berikut:

   ```bash title="" linenums="0"
   azd up
   ```

Selesaikan langkah aliran kerja yang ini akan picu:

1. Anda akan diminta log masuk ke Azure - ikut arahan untuk mengesahkan
1. Masukkan nama persekitaran unik untuk anda - contohnya, saya guna `nitya-mshack-azd`
1. Ini akan mencipta folder `.azure/` - anda akan melihat subfolder dengan nama env
1. Anda akan diminta memilih nama langganan - pilih lalai
1. Anda akan diminta memilih lokasi - gunakan `East US 2`

Sekarang, tunggu penyediaan selesai. **Ini mengambil masa 10-15 minit**

1. Apabila selesai, konsol anda akan menunjukkan mesej BERJAYA seperti ini:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal Azure anda kini akan mempunyai sekumpulan sumber yang disediakan dengan nama env tersebut:

      ![Infra](../../../../../translated_images/ms/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Anda kini bersedia untuk mengesahkan infrastruktur dan aplikasi yang telah disebarkan**.

---

## 4. Pengesahan Templat

1. Lawati halaman [Resource Groups](https://portal.azure.com/#browse/resourcegroups) di Portal Azure - log masuk bila diminta
1. Klik pada RG untuk nama persekitaran anda - anda akan melihat halaman di atas

      - klik pada sumber Azure Container Apps
      - klik pada URL Aplikasi dalam bahagian _Essentials_ (atas kanan)

1. Anda harus melihat UI hadapan aplikasi yang dihoskan seperti ini:

   ![App](../../../../../translated_images/ms/03-test-application.471910da12c3038e.webp)

1. Cuba tanya beberapa [soalan contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanya: ```Apakah ibu negara Perancis?``` 
      1. Tanya: ```Apa khemah terbaik di bawah $200 untuk dua orang, dan apakah ciri-cirinya?```

1. Anda harus mendapatkan jawapan yang serupa seperti yang ditunjukkan di bawah. _Tapi bagaimana ini berfungsi?_ 

      ![App](../../../../../translated_images/ms/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Pengesahan Ejen

Azure Container App menyebarkan titik akhir yang bersambung ke AI Agent yang disediakan dalam projek Microsoft Foundry untuk templat ini. Mari lihat apa maksudnya.

1. Kembali ke halaman _Overview_ Portal Azure untuk kumpulan sumber anda

1. Klik pada sumber `Microsoft Foundry` dalam senarai itu

1. Anda harus melihat ini. Klik butang `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/ms/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Anda harus melihat halaman Projek Foundry untuk aplikasi AI anda
   ![Project](../../../../../translated_images/ms/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik pada `Agents` - anda akan melihat Ejen lalai yang disediakan dalam projek anda
   ![Agents](../../../../../translated_images/ms/06-visit-agents.bccb263f77b00a09.webp)

1. Pilih ia - dan anda akan lihat butiran Ejen. Perhatikan yang berikut:

      - Ejen menggunakan Carian Fail secara lalai (sentiasa)
      - `Knowledge` ejen menunjukkan ada 32 fail dimuat naik (untuk carian fail)
      ![Agents](../../../../../translated_images/ms/07-view-agent-details.0e049f37f61eae62.webp)

1. Cari pilihan `Data+indexes` dalam menu kiri dan klik untuk butiran.

      - Anda akan melihat 32 fail data yang dimuat naik untuk pengetahuan.
      - Ini sepadan dengan 12 fail pelanggan dan 20 fail produk di bawah `src/files`
      ![Data](../../../../../translated_images/ms/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Anda telah mengesahkan operasi Ejen!**

1. Jawapan ejen berasaskan pengetahuan dalam fail-fail tersebut. 
1. Anda kini boleh bertanya soalan berkaitan dengan data tersebut, dan mendapat jawapan berasaskan fakta.
1. Contoh: `customer_info_10.json` menerangkan 3 pembelian yang dibuat oleh "Amanda Perez"

Kunjungi semula tab penyemak imbas dengan titik akhir Container App dan tanya: `Apakah produk yang dimiliki oleh Amanda Perez?`. Anda harus melihat sesuatu seperti ini:

![Data](../../../../../translated_images/ms/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Tempat Bermain Ejen

Mari bina sedikit intuisi tentang keupayaan Microsoft Foundry, dengan membawa Ejen bermain di Agents Playground.

1. Kembali ke halaman `Agents` di Microsoft Foundry - pilih ejen lalai
1. Klik pilihan `Try in Playground` - anda akan mendapat UI Playground seperti ini
1. Tanya soalan yang sama: `Apakah produk yang dimiliki oleh Amanda Perez?`

    ![Data](../../../../../translated_images/ms/09-ask-in-playground.a1b93794f78fa676.webp)

Anda akan mendapat jawapan yang sama (atau serupa) - tetapi anda juga mendapat maklumat tambahan yang boleh digunakan untuk memahami kualiti, kos, dan prestasi aplikasi ejen anda. Contohnya:

1. Perhatikan bahawa jawapan menyenaraikan fail data yang digunakan untuk "memastikan" jawapan itu
1. Letakkan kursor pada mana-mana label fail ini - adakah data sepadan dengan pertanyaan dan jawapan yang dipaparkan?

Anda juga akan melihat baris _stats_ di bawah jawapan.

1. Letakkan kursor pada mana-mana metrik - contohnya, Keselamatan. Anda akan melihat sesuatu seperti ini
1. Adakah penilaian dinilai selari dengan intuisi anda tentang tahap keselamatan jawapan?

      ![Data](../../../../../translated_images/ms/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Kebolehlihatan Terbina Dalam

Kebolehlihatan berkaitan dengan menginstrumen aplikasi anda untuk menjana data yang boleh digunakan untuk memahami, menyahpepijat, dan mengoptimumkan operasi aplikasi itu. Untuk merasai ini:

1. Klik butang `View Run Info` - anda harus melihat paparan ini. Ini ialah contoh [Penjejakan Ejen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) sedang berfungsi. _Anda juga boleh mendapatkan paparan ini dengan mengklik Thread Logs dalam menu peringkat atas_.

   - Dapatkan gambaran langkah-langkah run dan alat yang digunakan oleh ejen
   - Fahami jumlah kiraan Token (berbanding penggunaan token output) untuk jawapan
   - Fahami kelewatan dan di mana masa sedang digunakan dalam pelaksanaan

      ![Agent](../../../../../translated_images/ms/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik tab `Metadata` untuk melihat atribut tambahan untuk run, yang mungkin memberikan konteks berguna untuk menyahpepijat masalah kemudian.

      ![Agent](../../../../../translated_images/ms/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik tab `Evaluations` untuk melihat penilaian automatik yang dibuat ke atas jawapan ejen. Ini termasuk penilaian keselamatan (contoh: Bahaya kendiri) dan penilaian khusus ejen (contoh: Resolusi niat, Pematuhan tugasan).

      ![Agent](../../../../../translated_images/ms/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Akhir sekali, klik tab `Monitoring` dalam menu bar sisi.

      - Pilih tab `Resource usage` dalam halaman yang dipaparkan - dan lihat metrik.
      - Jejaki penggunaan aplikasi dari segi kos (token) dan beban (permintaan).
      - Jejaki kelewatan aplikasi kepada bait pertama (pemprosesan input) dan bait terakhir (output).

      ![Agent](../../../../../translated_images/ms/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Pembolehubah Persekitaran

Sejauh ini, kita telah melalui penyebaran dalam penyemak imbas - dan mengesahkan bahawa infrastruktur kita telah disediakan dan aplikasi beroperasi. Tetapi untuk bekerja dengan aplikasi _berasaskan kod dahulu_, kita perlu mengkonfigurasi persekitaran pembangunan tempatan kita dengan pembolehubah berkaitan yang diperlukan untuk berinteraksi dengan sumber ini. Menggunakan `azd` menjadikannya mudah.

1. Azure Developer CLI [menggunakan pembolehubah persekitaran](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) untuk menyimpan dan mengurus tetapan konfigurasi untuk penyebaran aplikasi.

1. Pembolehubah persekitaran disimpan dalam `.azure/<env-name>/.env` - ini mengskop mereka kepada persekitaran `env-name` yang digunakan semasa penyebaran dan membantu anda memisahkan persekitaran antara sasaran penyebaran yang berbeza dalam repositori yang sama.

1. Pembolehubah persekitaran secara automatik dimuatkan oleh arahan `azd` bila-bila masa ia melaksanakan arahan tertentu (contohnya, `azd up`). Perhatikan bahawa `azd` tidak secara automatik membaca pembolehubah persekitaran _tahap OS_ (contoh: set dalam shell) - sebaliknya gunakan `azd set env` dan `azd get env` untuk memindahkan maklumat dalam skrip.


Mari cuba beberapa arahan:

1. Dapatkan semua pembolehubah persekitaran yang ditetapkan untuk `azd` dalam persekitaran ini:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Anda akan melihat sesuatu seperti:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Dapatkan nilai tertentu - contohnya, saya mahu tahu jika kami tetapkan nilai `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Anda akan melihat sesuatu seperti ini - ia tidak ditetapkan secara lalai!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Tetapkan pembolehubah persekitaran baru untuk `azd`. Di sini, kita kemas kini nama model ejen. _Perhatian: sebarang perubahan yang dibuat akan terus dicerminkan dalam fail `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sekarang, kita harus dapati nilai itu ditetapkan:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nota bahawa beberapa sumber adalah kekal (contohnya, penyebaran model) dan memerlukan lebih daripada sekadar `azd up` untuk memaksa penyebaran semula. Mari cuba membongkar penyebaran asal dan menyebarkan semula dengan pembolehubah env yang diubah.

1. **Segarkan** Jika anda sebelum ini telah menyebar infrastruktur menggunakan templat azd - anda boleh _menyegarkan_ keadaan pembolehubah persekitaran tempatan anda berdasarkan keadaan semasa penyebaran Azure anda menggunakan arahan ini:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ini adalah cara yang berkuasa untuk _sinkron_ pemboleh ubah persekitaran di antara dua atau lebih persekitaran pembangunan tempatan (contohnya, pasukan dengan berbilang pembangun) - membolehkan infrastruktur yang telah dikerahkan menjadi kebenaran asas bagi keadaan pemboleh ubah persekitaran. Ahli pasukan hanya perlu _segarkan_ pemboleh ubah untuk menyelaraskan semula.

---

## 9. Tahniah 🏆

Anda baru sahaja melengkapkan aliran kerja hujung ke hujung di mana anda:

- [X] Memilih Templat AZD Yang Ingin Anda Gunakan  
- [X] Melancarkan Templat Dengan GitHub Codespaces  
- [X] Mengerahkan Templat dan mengesahkan ia berfungsi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->