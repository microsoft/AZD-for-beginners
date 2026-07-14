# 2. Memvalidasi Template

> Divalidasi terhadap `azd 1.27.1` pada Juli 2026.

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Menganalisis Arsitektur Solusi AI
    - [ ] Memahami Alur Kerja Deployment AZD
    - [ ] Menggunakan GitHub Copilot untuk mendapatkan bantuan penggunaan AZD
    - [ ] **Lab 2:** Men-deploy & Memvalidasi template AI Agents

---


## 1. Pengantar

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) atau `azd` adalah alat baris perintah open-source yang menyederhanakan alur kerja pengembang saat membangun dan men-deploy aplikasi ke Azure.

[Template AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) adalah repositori standar yang mencakup kode contoh aplikasi, aset _infrastructure-as-code_, dan file konfigurasi `azd` untuk arsitektur solusi yang terpadu. Penyediaan infrastruktur menjadi semudah perintah `azd provision` - sementara menggunakan `azd up` memungkinkan Anda menyediakan infrastruktur **dan** men-deploy aplikasi Anda sekaligus!

Akibatnya, memulai proses pengembangan aplikasi Anda dapat sesederhana menemukan _template AZD Starter_ yang paling mendekati kebutuhan aplikasi dan infrastruktur Anda - kemudian menyesuaikan repositori untuk memenuhi persyaratan skenario Anda.

Sebelum kita mulai, mari pastikan Anda telah menginstal Azure Developer CLI.

1. Buka terminal VS Code dan ketik perintah ini:

      ```bash title="" linenums="0"
      azd version
      ```

1. Anda akan melihat sesuatu seperti ini!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Sekarang Anda siap memilih dan men-deploy template dengan azd**

---

## 2. Pemilihan Template

Platform Microsoft Foundry hadir dengan [serangkaian template AZD yang direkomendasikan](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) yang mencakup skenario solusi populer seperti _otomasi alur kerja multi-agent_ dan _pemrosesan konten multi-modal_. Anda juga dapat menemukan template ini dengan mengunjungi portal Microsoft Foundry.

1. Kunjungi [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Masuk ke portal Microsoft Foundry saat diminta - Anda akan melihat sesuatu seperti ini.

![Pick](../../../../../translated_images/id/01-pick-template.60d2d5fff5ebc374.webp)


Opsi **Basic** adalah template awal Anda:

1. [ ] [Mulai dengan AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) yang men-deploy aplikasi chat dasar _dengan data Anda_ ke Azure Container Apps. Gunakan ini untuk mengeksplorasi skenario chatbot AI dasar.
1. [X] [Mulai dengan AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) yang juga men-deploy Agent AI standar (dengan Foundry Agents). Gunakan ini untuk mengenal solusi AI agentik yang melibatkan alat dan model.

Kunjungi tautan kedua di tab browser baru (atau klik `Open in GitHub` pada kartu terkait). Anda akan melihat repositori untuk Template AZD ini. Luangkan waktu sebentar untuk mengeksplorasi README. Arsitektur aplikasi terlihat seperti ini:

![Arch](../../../../../translated_images/id/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivasi Template

Mari coba men-deploy template ini dan memastikan validitasnya. Kita akan mengikuti panduan di bagian [Memulai](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Pilih lingkungan kerja untuk repositori template:

      - **GitHub Codespaces**: Klik [tautan ini](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) dan konfirmasi `Create codespace`
      - **Clone lokal atau dev container**: Clone `Azure-Samples/get-started-with-ai-agents` dan buka di VS Code

1. Tunggu hingga terminal VS Code siap, lalu ketik perintah berikut:

   ```bash title="" linenums="0"
   azd up
   ```

Selesaikan langkah alur kerja yang akan dipicu ini:

1. Anda akan diminta untuk masuk ke Azure - ikuti instruksi untuk mengautentikasi
1. Masukkan nama lingkungan unik untuk Anda - misalnya, saya menggunakan `nitya-mshack-azd`
1. Ini akan membuat folder `.azure/` - Anda akan melihat subfolder dengan nama env tersebut
1. Anda akan diminta memilih nama langganan - pilih default
1. Anda akan diminta lokasi - gunakan `East US 2`

Sekarang, tunggu hingga penyediaan selesai. **Ini akan memakan waktu 10-15 menit**

1. Saat selesai, konsol Anda akan menampilkan pesan SUKSES seperti ini:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Portal Azure Anda sekarang memiliki grup sumber daya yang disediakan dengan nama env itu:

      ![Infra](../../../../../translated_images/id/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sekarang Anda siap memvalidasi infrastruktur dan aplikasi yang sudah dideploy**.

---

## 4. Validasi Template

1. Kunjungi halaman Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - masuk saat diminta
1. Klik pada RG untuk nama lingkungan Anda - Anda akan melihat halaman seperti di atas

      - klik pada sumber daya Azure Container Apps
      - klik pada Application Url di bagian _Essentials_ (kanan atas)

1. Anda akan melihat aplikasi front-end yang dihost seperti ini:

   ![App](../../../../../translated_images/id/03-test-application.471910da12c3038e.webp)

1. Cobalah mengajukan beberapa [pertanyaan contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Tanyakan: ```Apa ibu kota Perancis?```
      1. Tanyakan: ```Apa tenda terbaik dengan harga di bawah $200 untuk dua orang, dan fitur apa yang dimilikinya?```

1. Anda akan mendapatkan jawaban yang serupa seperti yang ditampilkan di bawah ini. _Tapi bagaimana ini bekerja?_

      ![App](../../../../../translated_images/id/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validasi Agent

Azure Container App men-deploy endpoint yang terhubung ke AI Agent yang disediakan dalam proyek Microsoft Foundry untuk template ini. Mari kita lihat apa artinya.

1. Kembali ke halaman _Overview_ Azure Portal untuk grup sumber daya Anda

1. Klik pada sumber daya `Microsoft Foundry` dalam daftar itu

1. Anda akan melihat ini. Klik tombol `Go to Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/id/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Anda akan melihat halaman Proyek Foundry untuk aplikasi AI Anda
   ![Project](../../../../../translated_images/id/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klik pada `Agents` - Anda melihat Agent default yang disediakan dalam proyek Anda
   ![Agents](../../../../../translated_images/id/06-visit-agents.bccb263f77b00a09.webp)

1. Pilih itu - dan Anda akan melihat detail Agent. Catat hal berikut:

      - Agent menggunakan File Search secara default (selalu)
      - `Knowledge` agent menunjukkan ada 32 file yang diunggah (untuk pencarian file)
      ![Agents](../../../../../translated_images/id/07-view-agent-details.0e049f37f61eae62.webp)

1. Cari opsi `Data+indexes` di menu kiri dan klik untuk melihat detail.

      - Anda akan melihat 32 file data yang diunggah untuk pengetahuan.
      - Ini akan sesuai dengan 12 file pelanggan dan 20 file produk di bawah folder `src/files`
      ![Data](../../../../../translated_images/id/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Anda telah memvalidasi operasi Agent!**

1. Tanggapan agent didasarkan pada pengetahuan dari file-file tersebut.
1. Sekarang Anda bisa mengajukan pertanyaan terkait data itu, dan mendapatkan tanggapan yang berlandaskan.
1. Contoh: `customer_info_10.json` menjelaskan 3 pembelian yang dilakukan oleh "Amanda Perez"

Kembali ke tab browser dengan endpoint Container App dan tanyakan: `Produk apa saja yang dimiliki Amanda Perez?`. Anda akan melihat sesuatu seperti ini:

![Data](../../../../../translated_images/id/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Mari kita bangun pemahaman lebih lanjut tentang kapabilitas Microsoft Foundry, dengan mencoba Agent di Agents Playground.

1. Kembali ke halaman `Agents` di Microsoft Foundry - pilih agent default
1. Klik opsi `Try in Playground` - Anda akan mendapatkan UI Playground seperti ini
1. Tanyakan pertanyaan yang sama: `Produk apa saja yang dimiliki Amanda Perez?`

    ![Data](../../../../../translated_images/id/09-ask-in-playground.a1b93794f78fa676.webp)

Anda mendapatkan tanggapan yang sama (atau serupa) - tetapi Anda juga mendapatkan informasi tambahan yang dapat membantu memahami kualitas, biaya, dan performa aplikasi agentik Anda. Contohnya:

1. Perhatikan bahwa tanggapan menyebut file data yang digunakan untuk "mendasarkan" tanggapan tersebut
1. Arahkan kursor ke label file ini - apakah data cocok dengan query dan tanggapan yang ditampilkan?

Anda juga melihat baris _stats_ di bawah tanggapan.

1. Arahkan kursor pada metrik apa saja - misalnya, Safety. Anda akan melihat sesuatu seperti ini
1. Apakah penilaian yang diberikan cocok dengan intuisi Anda terhadap tingkat keamanan tanggapan?

      ![Data](../../../../../translated_images/id/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilitas Bawaan

Observabilitas berkaitan dengan memasang instrumen pada aplikasi Anda untuk menghasilkan data yang bisa dipakai guna memahami, men-debug, dan mengoptimalkan operasinya. Untuk memahami ini:

1. Klik tombol `View Run Info` - Anda akan melihat tampilan ini. Ini adalah contoh [pelacakan Agent](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) yang sedang berjalan. _Anda juga bisa mendapatkan tampilan ini dengan mengklik Thread Logs di menu tingkat atas_.

   - Dapatkan gambaran langkah-langkah proses dan alat yang digunakan oleh agent
   - Pahami jumlah total Token (dibandingkan penggunaan token output) untuk tanggapan
   - Pahami latensi dan di mana waktu dihabiskan dalam eksekusi

      ![Agent](../../../../../translated_images/id/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klik tab `Metadata` untuk melihat atribut tambahan untuk proses tersebut, yang bisa memberikan konteks berguna untuk debugging masalah nanti.

      ![Agent](../../../../../translated_images/id/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klik tab `Evaluations` untuk melihat penilaian otomatis yang dibuat pada tanggapan agent. Ini mencakup evaluasi keamanan (misalnya, Self-harm) dan evaluasi spesifik agent (misalnya, Penyelesaian intensi, Kepatuhan tugas).

      ![Agent](../../../../../translated_images/id/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Terakhir, klik tab `Monitoring` di menu sidebar.

      - Pilih tab `Resource usage` di halaman yang ditampilkan - dan lihat metriknya.
      - Lacak penggunaan aplikasi dalam hal biaya (token) dan beban (permintaan).
      - Lacak latensi aplikasi ke byte pertama (pemrosesan input) dan byte terakhir (output).

      ![Agent](../../../../../translated_images/id/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabel Lingkungan

Sejauh ini, kita telah menelusuri deployment di browser - dan memvalidasi bahwa infrastruktur kita telah disediakan dan aplikasi sudah berjalan. Namun untuk bekerja dengan kode aplikasi secara _code-first_, kita perlu mengonfigurasi lingkungan pengembangan lokal kita dengan variabel relevan yang diperlukan untuk bekerja dengan sumber daya ini. Menggunakan `azd` membuat ini menjadi mudah.

1. Azure Developer CLI [menggunakan variabel lingkungan](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) untuk menyimpan dan mengelola pengaturan konfigurasi untuk deployment aplikasi.

1. Variabel lingkungan disimpan di `.azure/<env-name>/.env` - ini membuat cakupan variabel tersebut terbatas pada lingkungan `env-name` yang dipakai selama deployment dan membantu Anda mengisolasi lingkungan di antara target deployment berbeda dalam repositori yang sama.

1. Variabel lingkungan secara otomatis dimuat oleh perintah `azd` kapan pun menjalankan perintah tertentu (misalnya, `azd up`). Perhatikan bahwa `azd` tidak secara otomatis membaca variabel lingkungan tingkat OS (misalnya, yang diatur di shell) - sebaliknya gunakan `azd set env` dan `azd get env` untuk mentransfer informasi di dalam skrip.


Mari coba beberapa perintah:

1. Dapatkan semua variabel lingkungan yang disetel untuk `azd` di lingkungan ini:

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

1. Dapatkan nilai spesifik - misalnya, saya ingin tahu apakah kita sudah menyetel nilai `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Anda akan melihat sesuatu seperti ini - ini belum disetel secara default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Tetapkan variabel lingkungan baru untuk `azd`. Di sini, kita memperbarui nama model agent. _Catatan: setiap perubahan yang dilakukan akan langsung tercermin dalam file `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sekarang, kita harus menemukan nilai tersebut telah disetel:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Perlu diperhatikan bahwa beberapa sumber daya bersifat persisten (misalnya, deployment model) dan akan membutuhkan lebih dari sekadar `azd up` untuk memaksa redeployment. Mari coba hentikan deployment asli dan deploy ulang dengan variabel lingkungan yang berubah.

1. **Segarkan** Jika sebelumnya Anda sudah men-deploy infrastruktur menggunakan template azd - Anda bisa _menyegarkan_ status variabel lingkungan lokal berdasarkan status deployment Azure Anda saat ini dengan perintah ini:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Ini adalah cara yang kuat untuk _sinkronisasi_ variabel lingkungan di antara dua atau lebih lingkungan pengembangan lokal (misalnya, tim dengan banyak pengembang) - memungkinkan infrastruktur yang diterapkan berfungsi sebagai kebenaran dasar untuk status variabel env. Anggota tim cukup _menyegarkan_ variabel untuk kembali sinkron.

---

## 9. Selamat 🏆

Anda baru saja menyelesaikan alur kerja end-to-end di mana Anda:

- [X] Memilih Template AZD yang Ingin Anda Gunakan
- [X] Membuka template di lingkungan pengembangan yang didukung
- [X] Menerapkan Template dan memvalidasi bahwa itu berfungsi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->