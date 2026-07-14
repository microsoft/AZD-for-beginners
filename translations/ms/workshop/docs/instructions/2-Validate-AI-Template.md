# 2. Sahkan Templat

> Disahkan dengan `azd 1.27.1` pada Julai 2026.

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Menganalisis Seni Bina Penyelesaian AI
    - [ ] Memahami Aliran Kerja Penyebaran AZD
    - [ ] Menggunakan GitHub Copilot untuk mendapatkan bantuan penggunaan AZD
    - [ ] **Makmal 2:** Sebarkan & Sahkan templat AI Agents

---


## 1. Pengenalan

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) atau `azd` adalah alat baris perintah sumber terbuka yang mempermudah aliran kerja pembangun apabila membina dan menyebarkan aplikasi ke Azure.

[Templat AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) adalah repositori piawai yang termasuk kod aplikasi contoh, aset _infrastruktur-sebagai-kod_, dan fail konfigurasi `azd` untuk seni bina penyelesaian yang padu. Menyediakan infrastruktur menjadi semudah arahan `azd provision` - manakala menggunakan `azd up` membolehkan anda menyediakan infrastruktur **dan** menyebarkan aplikasi anda sekaligus!

Oleh itu, memulakan proses pembangunan aplikasi anda boleh jadi semudah mencari _Templat Pemula AZD_ yang paling hampir dengan keperluan aplikasi dan infrastruktur anda - kemudian menyesuaikan repositori agar sesuai dengan keperluan senario anda.

Sebelum kita mulakan, pastikan anda telah memasang Azure Developer CLI.

1. Buka terminal VS Code dan taip arahan ini:

      ```bash title="" linenums="0"
      azd version
      ```

1. Anda harus melihat sesuatu seperti ini!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Anda sekarang sudah bersedia untuk memilih dan menyebarkan templat dengan azd**

---

## 2. Pemilihan Templat

Platform Microsoft Foundry dilengkapi dengan [set templat AZD yang disyorkan](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) yang merangkumi senario penyelesaian popular seperti _automasi aliran kerja multi-ejen_ dan _pemprosesan kandungan multimodal_. Anda juga boleh menemui templat ini dengan melawat portal Microsoft Foundry.

1. Lawati [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log masuk ke portal Microsoft Foundry apabila diminta - anda akan melihat sesuatu seperti ini.

![Pick](../../../../../translated_images/ms/01-pick-template.60d2d5fff5ebc374.webp)


Pilihan **Asas** adalah templat pemula anda:

1. [ ] [Mula dengan AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) yang menyebarkan aplikasi chat asas _dengan data anda_ ke Azure Container Apps. Gunakan ini untuk meneroka senario chatbot AI asas.
1. [X] [Mula dengan AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) yang juga menyebarkan Ejen AI standard (dengan Foundry Agents). Gunakan ini untuk membiasakan diri dengan penyelesaian AI ejen yang melibatkan alat dan model.

Lawati pautan kedua di tab pelayar baru (atau klik `Open in GitHub` untuk kad berkaitan). Anda harus melihat repositori untuk Templat AZD ini. Luangkan masa untuk meneroka README. Seni bina aplikasi adalah seperti berikut:

![Arch](../../../../../translated_images/ms/architecture.8cec470ec15c65c7.webp)

---

## 3. Pengaktifan Templat

Mari cuba menyebarkan templat ini dan pastikan ia sah. Kita akan mengikuti panduan dalam bahagian [Memulakan](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pilih persekitaran kerja untuk repositori templat:

      - **GitHub Codespaces**: Klik [pautan ini](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) dan sahkan `Create codespace`
      - **Klona tempatan atau kontena dev**: Klona `Azure-Samples/get-started-with-ai-agents` dan buka di VS Code

1. Tunggu sehingga terminal VS Code sedia, kemudian taip arahan berikut:

   ```bash title="" linenums="0"
   azd up
   ```

Lengkapkan langkah aliran kerja yang akan dicetuskan ini:

1. Anda akan diminta log masuk ke Azure - ikut arahan untuk pengesahan
1. Masukkan nama persekitaran unik untuk anda - contohnya, saya menggunakan `nitya-mshack-azd`
1. Ini akan mencipta folder `.azure/` - anda akan melihat subfolder dengan nama persekitaran
1. Anda akan diminta untuk memilih nama langganan - pilih lalai
1. Anda akan diminta lokasi - gunakan `East US 2`

Sekarang, tunggu provisioning selesai. **Ini mengambil masa 10-15 minit**

1. Apabila selesai, konsol anda akan menunjukkan mesej BERJAYA seperti ini:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal Azure anda kini akan mempunyai kumpulan sumber yang telah disediakan dengan nama persekitaran itu:

      ![Infra](../../../../../translated_images/ms/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Anda sekarang sudah bersedia untuk mengesahkan infrastruktur dan aplikasi yang disebarkan**.

---

## 4. Pengesahan Templat

1. Lawati halaman [Resource Groups](https://portal.azure.com/#browse/resourcegroups) Azure Portal - log masuk apabila diminta
1. Klik pada RG untuk nama persekitaran anda - anda akan melihat halaman di atas

      - klik pada sumber Azure Container Apps
      - klik pada URL Aplikasi di bahagian _Essentials_ (atas kanan)

1. Anda harus melihat antara muka hadapan aplikasi yang dihoskan seperti ini:

   ![App](../../../../../translated_images/ms/03-test-application.471910da12c3038e.webp)

1. Cuba tanya beberapa [soalan contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanya: ```Apakah ibu negara Perancis?```
      1. Tanya: ```Apa khemah terbaik di bawah $200 untuk dua orang, dan apa ciri yang disertakan?```

1. Anda akan mendapat jawapan yang serupa seperti yang ditunjukkan di bawah. _Tetapi bagaimana ini berfungsi?_

      ![App](../../../../../translated_images/ms/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Pengesahan Ejen

Azure Container App menyebarkan endpoint yang bersambung ke AI Agent yang disediakan dalam projek Microsoft Foundry untuk templat ini. Mari kita lihat apa maksudnya.

1. Kembali ke halaman _Overview_ Portal Azure untuk kumpulan sumber anda

1. Klik pada sumber `Microsoft Foundry` dalam senarai itu

1. Anda harus melihat ini. Klik butang `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/ms/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Anda harus melihat halaman Projek Foundry untuk aplikasi AI anda
   ![Project](../../../../../translated_images/ms/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik pada `Agents` - anda akan melihat Ejen lalai yang disediakan dalam projek anda
   ![Agents](../../../../../translated_images/ms/06-visit-agents.bccb263f77b00a09.webp)

1. Pilihnya - dan anda akan melihat butiran Ejen. Perhatikan perkara berikut:

      - Ejen menggunakan Carian Fail secara lalai (sentiasa)
      - `Knowledge` ejen menunjukkan ia mempunyai 32 fail dimuat naik (untuk carian fail)
      ![Agents](../../../../../translated_images/ms/07-view-agent-details.0e049f37f61eae62.webp)

1. Cari pilihan `Data+indexes` dalam menu kiri dan klik untuk butiran.

      - Anda harus melihat 32 fail data yang dimuat naik untuk pengetahuan.
      - Ini akan sepadan dengan 12 fail pelanggan dan 20 fail produk di bawah `src/files`
      ![Data](../../../../../translated_images/ms/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Anda telah mengesahkan operasi Ejen!**

1. Respons ejen berasaskan pada pengetahuan dalam fail-fail tersebut.
1. Anda kini boleh bertanya soalan berkaitan dengan data tersebut, dan mendapat respons yang berasaskan fakta.
1. Contoh: `customer_info_10.json` menerangkan 3 pembelian yang dibuat oleh "Amanda Perez"

Kembali ke tab pelayar dengan endpoint Container App dan tanya: `Apakah produk yang dimiliki oleh Amanda Perez?`. Anda harus melihat sesuatu seperti ini:

![Data](../../../../../translated_images/ms/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Taman Permainan Ejen

Mari bina sedikit lagi intuitif untuk keupayaan Microsoft Foundry, dengan membawa Ejen berputar dalam Taman Permainan Ejen.

1. Kembali ke halaman `Agents` dalam Microsoft Foundry - pilih ejen lalai
1. Klik pilihan `Try in Playground` - anda akan mendapat UI Taman Permainan seperti ini
1. Tanya soalan yang sama: `Apakah produk yang dimiliki oleh Amanda Perez?`

    ![Data](../../../../../translated_images/ms/09-ask-in-playground.a1b93794f78fa676.webp)

Anda menerima respons yang sama (atau serupa) - tetapi anda juga mendapat maklumat tambahan yang boleh digunakan untuk memahami kualiti, kos, dan prestasi aplikasi ejen anda. Sebagai contoh:

1. Perhatikan respons menyebut fail data yang digunakan untuk "menguatkan" respons itu
1. Luncur tetikus ke atas mana-mana label fail ini - adakah data sepadan dengan pertanyaan dan respons yang dipaparkan?

Anda juga melihat bar _stats_ di bawah respons.

1. Luncur tetikus ke atas mana-mana metrik - contohnya, Keselamatan. Anda akan melihat sesuatu seperti ini
1. Adakah penilaian yang diberikan sepadan dengan intuisi anda terhadap tahap keselamatan respons?

      ![Data](../../../../../translated_images/ms/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabiliti Terbina Dalam

Observabiliti adalah mengenai menggubah aplikasi anda untuk menghasilkan data yang boleh digunakan untuk memahami, menyahpepijat, dan mengoptimumkan operasi aplikasi itu. Untuk merasai ini:

1. Klik butang `View Run Info` - anda akan melihat pandangan ini. Ini adalah contoh [Penjejakan Ejen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) dalam tindakan. _Anda juga boleh mendapatkan pandangan ini dengan mengklik Thread Logs dalam menu aras atas_.

   - Dapatkan gambaran langkah-langkah berjalan dan alat yang digunakan oleh ejen
   - Fahami jumlah kiraan Token (berbanding penggunaan token output) untuk respons
   - Fahami kelewatan dan di mana masa dihabiskan dalam pelaksanaan

      ![Agent](../../../../../translated_images/ms/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik tab `Metadata` untuk melihat atribut tambahan untuk larian, yang mungkin menyediakan konteks berguna untuk menyahpepijat isu kemudian.

      ![Agent](../../../../../translated_images/ms/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik tab `Evaluations` untuk melihat penilaian automatik dibuat ke atas respons ejen. Ini termasuk penilaian keselamatan (contohnya, Self-harm) dan penilaian khusus ejen (contohnya, Penyelesaian niat, Pematuhan tugas).

      ![Agent](../../../../../translated_images/ms/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Akhir sekali, klik tab `Monitoring` dalam menu bar sisi.

      - Pilih tab `Resource usage` dalam halaman yang dipaparkan - dan lihat metrik tersebut.
      - Jejaki penggunaan aplikasi dari segi kos (token) dan beban (permintaan).
      - Jejaki kelewatan aplikasi ke bait pertama (pemprosesan input) dan bait terakhir (output).

      ![Agent](../../../../../translated_images/ms/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Pembolehubah Persekitaran

Setakat ini, kita telah melalui penyebaran di pelayar - dan mengesahkan bahawa infrastruktur kita disediakan dan aplikasi beroperasi. Tetapi untuk bekerja dengan kod aplikasi _terlebih dahulu_, kita perlu mengkonfigurasikan persekitaran pembangunan tempatan dengan pembolehubah yang berkaitan yang diperlukan untuk bekerja dengan sumber ini. Menggunakan `azd` menjadikannya mudah.

1. Azure Developer CLI [menggunakan pembolehubah persekitaran](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) untuk menyimpan dan mengurus tetapan konfigurasi bagi penyebaran aplikasi.

1. Pembolehubah persekitaran disimpan dalam `.azure/<env-name>/.env` - ini menskopnya kepada persekitaran `env-name` yang digunakan semasa penyebaran dan membantu memisahkan persekitaran antara sasaran penyebaran berbeza dalam repositori yang sama.

1. Pembolehubah persekitaran dimuat secara automatik oleh arahan `azd` setiap kali ia melaksanakan arahan tertentu (contohnya, `azd up`). Perhatikan bahawa `azd` tidak secara automatik membaca pembolehubah persekitaran _peringkat OS_ (contohnya, ditetapkan dalam shell) - sebaliknya gunakan `azd set env` dan `azd get env` untuk memindah maklumat dalam skrip.


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

1. Dapatkan nilai spesifik - contohnya, saya mahu tahu jika nilai `AZURE_AI_AGENT_MODEL_NAME` telah ditetapkan

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Anda akan melihat sesuatu seperti ini - ia tidak ditetapkan secara lalai!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Tetapkan pembolehubah persekitaran baru untuk `azd`. Di sini, kita mengemas kini nama model ejen. _Perhatian: sebarang perubahan yang dibuat akan segera tercermin dalam fail `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sekarang, kita harus dapati nilai telah ditetapkan:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Perhatikan bahawa sesetengah sumber adalah kekal (contohnya, penyebaran model) dan memerlukan lebih daripada sekadar `azd up` untuk memaksa penyebaran semula. Mari cuba membongkar penyebaran asal dan menyebarkan semula dengan pembolehubah persekitaran yang telah diubah.

1. **Segarkan** Jika anda telah menyebarkan infrastruktur menggunakan templat azd sebelum ini - anda boleh _menyegarkan_ keadaan pembolehubah persekitaran tempatan berdasarkan keadaan semasa penyebaran Azure anda menggunakan arahan ini:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Ini adalah cara yang berkuasa untuk _menyelaraskan_ pembolehubah persekitaran di antara dua atau lebih persekitaran pembangunan setempat (contohnya, pasukan dengan beberapa pembangun) - membolehkan infrastruktur yang digunakan berfungsi sebagai kebenaran asas bagi keadaan pembolehubah env. Ahli pasukan hanya perlu _menyegarkan_ pembolehubah untuk menyelaraskan semula.

---

## 9. Tahniah 🏆

Anda baru sahaja melengkapkan aliran kerja hujung-ke-hujung di mana anda:

- [X] Memilih Templat AZD Yang Anda Mahu Gunakan
- [X] Membuka templat dalam persekitaran pembangunan yang disokong
- [X] Melaksanakan Templat dan mengesahkan ia berfungsi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->