# 2. Validasi Template

!!! tip "DI AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Menganalisis Arsitektur Solusi AI
    - [ ] Memahami Alur Kerja Penerapan AZD
    - [ ] Menggunakan GitHub Copilot untuk membantu penggunaan AZD
    - [ ] **Lab 2:** Deploy & Validasi template AI Agents

---


## 1. Pendahuluan

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) atau `azd` adalah alat baris perintah sumber terbuka yang menyederhanakan alur kerja pengembang saat membangun dan menerapkan aplikasi ke Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) adalah repositori standar yang menyertakan contoh kode aplikasi, aset _infrastructure-as-code_, dan file konfigurasi `azd` untuk arsitektur solusi yang kohesif. Penyediaan infrastruktur menjadi sesederhana perintah `azd provision` - sementara menggunakan `azd up` memungkinkan Anda untuk menyediakan infrastruktur **dan** menerapkan aplikasi Anda sekaligus!

Akibatnya, memulai proses pengembangan aplikasi Anda bisa sesederhana menemukan _AZD Starter template_ yang paling mendekati kebutuhan aplikasi dan infrastruktur Anda - lalu menyesuaikan repositori agar sesuai dengan persyaratan skenario Anda.

Sebelum kita mulai, pastikan Anda telah menginstal Azure Developer CLI.

1. Buka terminal VS Code dan ketik perintah ini:

      ```bash title="" linenums="0"
      azd version
      ```

1. Anda akan melihat sesuatu seperti ini!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Sekarang Anda siap memilih dan menerapkan template dengan azd**

---

## 2. Pemilihan Template

Platform Microsoft Foundry dilengkapi dengan [serangkaian template AZD yang direkomendasikan](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) yang mencakup skenario solusi populer seperti _otomatisasi alur kerja multi-agen_ dan _pemrosesan konten multi-modal_. Anda juga dapat menemukan template ini dengan mengunjungi portal Microsoft Foundry.

1. Kunjungi [https://ai.azure.com/templates]
1. Masuk ke portal Microsoft Foundry saat diminta - Anda akan melihat sesuatu seperti ini.

![Pilih](../../../../../translated_images/id/01-pick-template.60d2d5fff5ebc374.webp)


Opsi **Basic** adalah template pemula Anda:

1. [ ] [Mulai dengan AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) yang menerapkan aplikasi chat dasar _dengan data Anda_ ke Azure Container Apps. Gunakan ini untuk mengeksplorasi skenario chatbot AI dasar.
1. [X] [Mulai dengan AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) yang juga menerapkan AI Agent standar (dengan Foundry Agents). Gunakan ini untuk mengenal solusi AI agenik yang melibatkan alat dan model.

Kunjungi tautan kedua di tab browser baru (atau klik `Open in GitHub` untuk kartu terkait). Anda akan melihat repositori untuk AZD Template ini. Luangkan satu menit untuk menjelajahi README. Arsitektur aplikasi terlihat seperti ini:

![Arsitektur](../../../../../translated_images/id/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivasi Template

Mari kita coba menerapkan template ini dan memastikan itu valid. Kita akan mengikuti panduan di bagian [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Klik [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - konfirmasi tindakan default untuk `Create codespace`
1. Ini membuka tab browser baru - tunggu sesi GitHub Codespaces selesai dimuat
1. Buka terminal VS Code di Codespaces - ketik perintah berikut:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. Anda akan diminta untuk masuk ke Azure - ikuti instruksi untuk mengautentikasi
1. Masukkan nama lingkungan unik untuk Anda - mis., saya menggunakan `nitya-mshack-azd`
1. This  will create a `.azure/` folder - you will see a subfolder with the env name
1. Anda akan diminta untuk memilih nama langganan - pilih default
1. Anda akan diminta untuk memilih lokasi - gunakan `East US 2`

Sekarang, Anda menunggu sampai penyediaan selesai. **Ini memakan waktu 10-15 menit**

1. Saat selesai, konsol Anda akan menampilkan pesan SUCCESS seperti ini:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal Azure Anda sekarang akan memiliki resource group yang diprovisikan dengan nama env itu:

      ![Infrastruktur](../../../../../translated_images/id/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sekarang Anda siap memvalidasi infrastruktur dan aplikasi yang telah diterapkan**.

---

## 4. Validasi Template

1. Kunjungi halaman Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - masuk saat diminta
1. Klik pada RG untuk nama lingkungan Anda - Anda akan melihat halaman di atas

      - klik pada resource Azure Container Apps
      - klik pada Application Url di bagian _Essentials_ (kanan atas)

1. Anda akan melihat UI front-end aplikasi yang dihosting seperti ini:

   ![Aplikasi](../../../../../translated_images/id/03-test-application.471910da12c3038e.webp)

1. Coba ajukan beberapa [pertanyaan contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanyakan: ```What is the capital of France?``` 
      1. Tanyakan: ```What's the best tent under $200 for two people, and what features does it include?```

1. Anda akan mendapatkan jawaban yang mirip dengan yang ditunjukkan di bawah ini. _Tapi bagaimana ini bekerja?_ 

      ![Aplikasi](../../../../../translated_images/id/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Validasi Agen

Azure Container App menerapkan sebuah endpoint yang terhubung ke AI Agent yang disediakan dalam proyek Microsoft Foundry untuk template ini. Mari kita lihat apa artinya itu.

1. Kembali ke halaman _Overview_ Azure Portal untuk resource group Anda

1. Klik pada resource `Microsoft Foundry` dalam daftar tersebut

1. Anda akan melihat ini. Klik tombol `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/id/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Anda akan melihat halaman Proyek Foundry untuk aplikasi AI Anda
   ![Proyek](../../../../../translated_images/id/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik pada `Agents` - Anda akan melihat Agent default yang disediakan dalam proyek Anda
   ![Agen](../../../../../translated_images/id/06-visit-agents.bccb263f77b00a09.webp)

1. Pilih itu - dan Anda akan melihat detail Agent. Perhatikan hal berikut:

      - Agen menggunakan File Search secara default (selalu)
      - `Knowledge` agen menunjukkan bahwa ia memiliki 32 file yang diunggah (untuk file search)
      ![Agen](../../../../../translated_images/id/07-view-agent-details.0e049f37f61eae62.webp)

1. Cari opsi `Data+indexes` di menu kiri dan klik untuk melihat detail. 

      - Anda akan melihat 32 file data yang diunggah untuk knowledge.
      - Ini akan sesuai dengan 12 file customer dan 20 file product di bawah `src/files` 
      ![Data](../../../../../translated_images/id/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Anda telah memvalidasi operasi Agen!** 

1. Respons agen didasarkan pada pengetahuan dalam file-file tersebut. 
1. Anda sekarang dapat mengajukan pertanyaan terkait data itu, dan mendapatkan respons yang berlandaskan.
1. Contoh: `customer_info_10.json` menggambarkan 3 pembelian yang dilakukan oleh "Amanda Perez"

Kembali ke tab browser dengan endpoint Container App dan tanyakan: `What products does Amanda Perez own?`. Anda akan melihat sesuatu seperti ini:

![Data](../../../../../translated_images/id/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground Agen

Mari bangun sedikit intuisi lebih lanjut tentang kemampuan Microsoft Foundry, dengan mencoba Agent di Agents Playground. 

1. Kembali ke halaman `Agents` di Microsoft Foundry - pilih agent default
1. Klik opsi `Try in Playground` - Anda akan mendapatkan UI Playground seperti ini
1. Tanyakan pertanyaan yang sama: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/id/09-ask-in-playground.a1b93794f78fa676.webp)

Anda mendapatkan respons yang sama (atau serupa) - tetapi Anda juga mendapatkan informasi tambahan yang dapat Anda gunakan untuk memahami kualitas, biaya, dan kinerja aplikasi agenik Anda. Misalnya:

1. Perhatikan bahwa respons menyebut file data yang digunakan untuk "mengarahkan" respons
1. Arahkan kursor ke salah satu label file ini - apakah data tersebut cocok dengan kueri dan respons yang ditampilkan?

Anda juga melihat baris _statistik_ di bawah respons. 

1. Arahkan kursor ke metrik mana pun - mis., Safety. Anda akan melihat sesuatu seperti ini
1. Apakah penilaian yang dinilai cocok dengan intuisi Anda tentang tingkat keselamatan respons?

      ![Data](../../../../../translated_images/id/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilitas Bawaan

Observabilitas berkaitan dengan menginstrumen aplikasi Anda untuk menghasilkan data yang dapat digunakan untuk memahami, men-debug, dan mengoptimalkan operasinya. Untuk merasakan ini:

1. Klik tombol `View Run Info` - Anda akan melihat tampilan ini. Ini adalah contoh [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) dalam aksi. _Anda juga dapat mendapatkan tampilan ini dengan mengklik Thread Logs di menu tingkat atas_.

   - Dapatkan gambaran tentang langkah-langkah run dan alat yang digunakan oleh agen
   - Pahami total jumlah Token (vs. penggunaan token output) untuk respons
   - Pahami latensi dan di mana waktu dihabiskan dalam eksekusi

      ![Agen](../../../../../translated_images/id/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik tab `Metadata` untuk melihat atribut tambahan untuk run, yang dapat memberikan konteks berguna untuk men-debug masalah nanti.   

      ![Agen](../../../../../translated_images/id/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik tab `Evaluations` untuk melihat penilaian otomatis yang dibuat terhadap respons agen. Ini termasuk evaluasi keselamatan (mis., Self-harm) dan evaluasi khusus agen (mis., Penyelesaian Intent, Kepatuhan Tugas).

      ![Agen](../../../../../translated_images/id/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Terakhir, klik tab `Monitoring` di menu sidebar.

      - Pilih tab `Resource usage` di halaman yang ditampilkan - dan lihat metriknya.
      - Lacak penggunaan aplikasi dalam hal biaya (token) dan beban (permintaan).
      - Lacak latensi aplikasi hingga byte pertama (pemrosesan input) dan byte terakhir (output).

      ![Agen](../../../../../translated_images/id/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabel Lingkungan

Sejauh ini, kita telah menelusuri penerapan di browser - dan memvalidasi bahwa infrastruktur kita telah diprovisikan dan aplikasi beroperasi. Tetapi untuk bekerja dengan aplikasi secara _code-first_, kita perlu mengonfigurasi lingkungan pengembangan lokal kita dengan variabel relevan yang diperlukan untuk bekerja dengan sumber daya ini. Menggunakan `azd` membuatnya mudah.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) untuk menyimpan dan mengelola pengaturan konfigurasi untuk penerapan aplikasi.

1. Variabel lingkungan disimpan di `.azure/<env-name>/.env` - ini memfokuskan mereka pada lingkungan `env-name` yang digunakan selama penerapan dan membantu Anda mengisolasi lingkungan antar target penerapan yang berbeda dalam repositori yang sama.

1. Variabel lingkungan secara otomatis dimuat oleh perintah `azd` setiap kali menjalankan perintah tertentu (mis., `azd up`). Perlu dicatat bahwa `azd` tidak secara otomatis membaca variabel lingkungan tingkat OS (mis., yang disetel di shell) - sebaliknya gunakan `azd set env` dan `azd get env` untuk mentransfer informasi dalam skrip.


Mari coba beberapa perintah:

1. Dapatkan semua variabel lingkungan yang diatur untuk `azd` di lingkungan ini:

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

1. Dapatkan nilai tertentu - mis., saya ingin tahu apakah kita mengatur nilai `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Anda akan melihat sesuatu seperti ini - itu tidak diatur secara default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Tetapkan variabel lingkungan baru untuk `azd`. Di sini, kita memperbarui nama model agen. _Catatan: setiap perubahan yang dibuat akan segera tercermin dalam file `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sekarang, kita harus menemukan nilai sudah diatur:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Perlu dicatat bahwa beberapa sumber daya bersifat persisten (mis., penyebaran model) dan akan memerlukan lebih dari sekadar `azd up` untuk memaksa penyebaran ulang. Mari coba menurunkan penerapan asli dan menerapkan kembali dengan variabel lingkungan yang diubah.

1. **Refresh** Jika Anda sebelumnya telah menerapkan infrastruktur menggunakan template azd - Anda dapat _refresh_ status variabel lingkungan lokal Anda berdasarkan status saat ini dari penerapan Azure Anda menggunakan perintah ini:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ini adalah cara yang ampuh untuk _sinkronkan_ variabel lingkungan di dua atau lebih lingkungan pengembangan lokal (misalnya, tim dengan beberapa pengembang) - memungkinkan infrastruktur yang dideploy berfungsi sebagai sumber kebenaran untuk status variabel lingkungan. Anggota tim cukup _muat ulang_ variabel untuk kembali sinkron.

---

## 9. Selamat 🏆

Anda baru saja menyelesaikan alur kerja ujung-ke-ujung di mana Anda:

- [X] Memilih Template AZD yang Ingin Anda Gunakan
- [X] Meluncurkan Template dengan GitHub Codespaces 
- [X] Mendeploy Template dan memvalidasi bahwa itu berfungsi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan berbasis AI Co-op Translator (https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat penting, disarankan menggunakan jasa penerjemah profesional manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul akibat penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->