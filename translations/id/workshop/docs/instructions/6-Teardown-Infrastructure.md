# 6. Membongkar Infrastruktur

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BISA"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Latihan Bonus

Sebelum kita membongkar proyek, luangkan beberapa menit untuk menjelajah secara bebas.

!!! info "Coba Petunjuk Eksplorasi Ini"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Menghapus Infrastruktur

!!! warning "Jika Anda juga menyelesaikan latihan agen yang dihosting GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Membongkar infrastruktur sesederhana:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Konfirmasikan lingkungan yang dipilih dan tinjau sumber daya yang akan dihapus. Ini menghapus sumber daya Azure dan dapat menghancurkan data. Pertahankan prompt konfirmasi untuk alur pembelajaran ini. Setelah selesai Anda akan melihat output seperti:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifikasi penghapusan di portal dan periksa sumber daya di luar cakupan penyebaran. Pelaporan biaya dan pembaruan kuota bisa terlambat. Konfigurasi lokal `.azure` tetap ada kecuali Anda menghapusnya secara eksplisit.

1. `azd down --purge` juga meminta penghapusan permanen sumber daya yang dihapus lunak yang didukung. Gunakan hanya saat pemulihan tidak diperlukan dan Anda memahami kebijakan retensi/perlindungan penghapusan. Ini tidak menjamin pelepasan kuota secara langsung.

1. Jangan melakukan penerapan ulang hanya untuk memverifikasi pembersihan. `azd up` sengaja yang dilakukan kemudian dapat membuat ulang sumber daya menggunakan input lokal yang tersisa, dan akan dikenakan biaya lagi. Pembaruan model biasanya menggunakan perubahan penyediaan yang didukung, bukan pembongkaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->