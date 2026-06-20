# 2. Validasi Template

> Tervalidasi terhadap `azd 1.25.6` pada Juni 2026.

!!! tip "PADA AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Menganalisis Arsitektur Solusi AI
    - [ ] Memahami Alur Kerja Penyebaran AZD
    - [ ] Menggunakan GitHub Copilot untuk membantu penggunaan AZD
    - [ ] **Lab 2:** Menerapkan & Memvalidasi template AI Agents

---


## 1. Pendahuluan

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) atau `azd` adalah alat baris perintah sumber terbuka yang mempermudah alur kerja pengembang saat membangun dan menerapkan aplikasi ke Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) adalah repositori terstandarisasi yang menyertakan kode aplikasi contoh, aset _infrastructure-as-code_, dan file konfigurasi `azd` untuk arsitektur solusi yang kohesif. Penyediaan infrastruktur menjadi sesederhana perintah `azd provision` - sementara menggunakan `azd up` memungkinkan Anda untuk menyediakan infrastruktur **dan** menerapkan aplikasi Anda sekaligus!

Sebagai hasilnya, memulai proses pengembangan aplikasi Anda bisa sesederhana menemukan _AZD Starter template_ yang paling mendekati kebutuhan aplikasi dan infrastruktur Anda - lalu menyesuaikan repositori untuk memenuhi persyaratan skenario Anda.

Sebelum kita mulai, pastikan Anda telah menginstal Azure Developer CLI.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You should see something like this!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Sekarang Anda siap untuk memilih dan menerapkan template dengan azd**

---

## 2. Pemilihan Template

Platform Microsoft Foundry dilengkapi dengan [set of recommended AZD templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) yang mencakup skenario solusi populer seperti _multi-agent workflow atomation_ dan _multi-modal content processing_. Anda juga dapat menemukan template ini dengan mengunjungi portal Microsoft Foundry.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![Pilih](../../../../../translated_images/id/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) yang menerapkan aplikasi chat dasar _dengan data Anda_ ke Azure Container Apps. Gunakan ini untuk mengeksplorasi skenario chatbot AI dasar.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) yang juga menerapkan Agen AI standar (dengan Foundry Agents). Gunakan ini untuk membiasakan diri dengan solusi AI agenik yang melibatkan alat dan model.

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![Arsitektur](../../../../../translated_images/id/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivasi Template

Let's try to deploy this template and make sure it is valid. We'll follow the guidelines in the [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started) section.

1. Choose a working environment for the template repository:

      - **GitHub Codespaces**: Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) and confirm `Create codespace`
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` and open it in VS Code

1. Wait until the VS Code terminal is ready, then type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. You will be prompted to log into Azure - follow instructions to authenticate
1. Enter a unique environment name for you - e.g., I used `nitya-mshack-azd`
1. This  will create a `.azure/` folder - you will see a subfolder with the env name
1. You will be prompted to select a subscription name - select the default
1. You will be prompted for a location - use `East US 2`

Now, you wait for the provisioning to complete. **This takes 10-15 minutes**

1. When done, your console will show a SUCCESS message like this:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![Infrastruktur](../../../../../translated_images/id/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Anda sekarang siap untuk memvalidasi infrastruktur dan aplikasi yang dideploy**.

---

## 4. Validasi Template

1. Kunjungi halaman Azure Portal [Grup Sumber Daya](https://portal.azure.com/#browse/resourcegroups) - masuk ketika diminta
1. Klik pada RG untuk nama lingkungan Anda - Anda akan melihat halaman seperti di atas

      - klik pada resource Azure Container Apps
      - klik pada Application Url di bagian _Essentials_ (kanan atas)

1. You should see a hosted application front-end UI like this:

   ![Aplikasi](../../../../../translated_images/id/03-test-application.471910da12c3038e.webp)

1. Coba ajukan beberapa [pertanyaan contoh](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Ask: ```Apa ibu kota Prancis?``` 
      1. Ask: ```Tenda terbaik di bawah $200 untuk dua orang, dan fitur apa yang dimilikinya?```

1. You should get answers similar to what is shown below. _But how does this work?_ 

      ![Aplikasi](../../../../../translated_images/id/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Validasi Agen

The Azure Container App deploys an endpoint that connects to the AI Agent provisioned in the Microsoft Foundry project for this template. Let's take a look at what that means.

1. Return to the Azure Portal _Overview_ page for your resource group

1. Click on the `Microsoft Foundry` resource in that list

1. You should see this. Click the `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/id/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You should see the Foundry Project page for your AI application
   ![Proyek](../../../../../translated_images/id/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click on `Agents` - you see the default Agent provisioned in your project
   ![Agen](../../../../../translated_images/id/06-visit-agents.bccb263f77b00a09.webp)

1. Select it - and you see the Agent details. Note the following:

      - The agent uses File Search by default (always)
      - The agent `Knowledge` indicates it has 32 files uploaded (for file search)
      ![Agen](../../../../../translated_images/id/07-view-agent-details.0e049f37f61eae62.webp)

1. Look for the `Data+indexes` option in the left menu and click for details. 

      - You should see the 32 data files uploaded for knowledge.
      - These will correspond to the 12 customer files and 20 product files under `src/files` 
      ![Data](../../../../../translated_images/id/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Anda telah memvalidasi operasi Agent!** 

1. The agent responses are grounded in the knowledge in those files. 
1. You can now ask questions related to that data, and get grounded responses.
1. Example: `customer_info_10.json` describes the 3 purchases made by "Amanda Perez"

Revisit the browser tab with the Container App endpoint and ask: `Produk apa yang dimiliki Amanda Perez?`. You should see something like this:

![Data](../../../../../translated_images/id/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Let's build a bit more intuition for the capabilities of Microsoft Foundry, by taking the Agent for a spin in the Agents Playground. 

1. Return to the `Agents` page in Microsoft Foundry - select the default agent
1. Click the `Try in Playground` option - you should get a Playground UI like this
1. Ask the same question: `Produk apa yang dimiliki Amanda Perez?`

    ![Data](../../../../../translated_images/id/09-ask-in-playground.a1b93794f78fa676.webp)

You get the same (or similar) response - but you also get additional information that you can use to understand the quality, cost, and performance of your agentic app. For example:

1. Note that the response cites data files used to "ground" the response
1. Hover over any of these file labels - does the data match your query and displayed response?

You also see a _stats_ row below the response. 

1. Hover over any metric - e.g., Safety. You see something like this
1. Does the assessed rating match your intuition for the response safety level?

      ![Data](../../../../../translated_images/id/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilitas Bawaan

Observability berkaitan dengan menginstrumentasi aplikasi Anda untuk menghasilkan data yang dapat digunakan untuk memahami, men-debug, dan mengoptimalkan operasinya. Untuk mendapatkan gambaran tentang ini:

1. Click the `View Run Info` button - you should see this view. This is an example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in action. _You can also get this view by clicking Thread Logs in the top-level menu_.

   - Dapatkan gambaran tentang langkah-langkah run dan alat yang digunakan oleh agent
   - Pahami jumlah Token total (vs. penggunaan token output) untuk respons
   - Pahami latensi dan di mana waktu dihabiskan dalam eksekusi

      ![Agen](../../../../../translated_images/id/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click the `Metadata` tab to see additional attributes for the run, that may provide useful context for debugging issues later.   

      ![Agen](../../../../../translated_images/id/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click the `Evaluations` tab to see auto-assessments made on the agent response. These include safety evaluations (e.g., Self-harm) and agent-specifc evaluations (e.g., Intent resolution, Task adherence).

      ![Agen](../../../../../translated_images/id/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, click the `Monitoring` tab in the sidebar menu.

      - Select `Resource usage` tab in the displayed page - and view the metrics.
      - Track application usage in terms of costs (tokens) and load (requests).
      - Track applicaton latency to first byte (input processing) and last byte (output).

      ![Agen](../../../../../translated_images/id/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variabel Lingkungan

So far, we've walked through the deployment in the browser - and validated that our infrastructure is provisioned and the application is operational. But to work with the application _code-first_, we need to configure our local development environment with the relevant variables required to work with these resources. Using `azd` makes it easy.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage configuration settings for  the application deployments.

1. Environment variables are stored in `.azure/<env-name>/.env` - this scopes them to the `env-name` environment used during deployment and helps you isolate environments between different deployment targets in the same repo.

1. Environment variables are automatically loaded by the `azd` command whenever it executes a specific command (e.g., `azd up`). Note that `azd` does not automatically read _OS-level_ environment variables (e.g., set in the shell) - instead use `azd set env` and `azd get env` to transfer information within scripts.


Let's try out a few commands:

1. Get all the environment variables set for `azd` in this environment:

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

1. Get a specific value - e.g., I want to know if we set the `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Anda akan melihat sesuatu seperti ini - tidak disetel secara default!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set a new environment variable for `azd`. Here, we update the agent model name. _Note: any changes made will be immediately reflected in the `.azure/<env-name>/.env` file.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Sekarang, kita harus menemukan nilainya disetel:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note that some resources are persistent (e.g., model deployments) and will require more than just an `azd up` to force the redeployment. Let's try tearing down the original deployment and redeploying with changed env vars.

1. **Refresh** If you had previously deployed infrastructure using an azd template - you can _refresh_ the state of your local environment variables based on the current state of your Azure deployment using this command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Ini adalah cara yang ampuh untuk _menyinkronkan_ variabel lingkungan di antara dua atau lebih lingkungan pengembangan lokal (mis., tim dengan beberapa pengembang) - memungkinkan infrastruktur yang dideploy berfungsi sebagai sumber kebenaran untuk status variabel lingkungan. Anggota tim cukup _menyegarkan_ variabel untuk kembali tersinkronisasi.

---

## 9. Selamat 🏆

Anda baru saja menyelesaikan alur kerja ujung-ke-ujung di mana Anda:

- [X] Memilih AZD Template yang Ingin Anda Gunakan
- [X] Membuka template di lingkungan pengembangan yang didukung
- [X] Mendeploy Template dan memvalidasi bahwa itu berfungsi

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->