# 6. Membongkar Infrastruktur

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Latihan Bonus

Sebelum kita membongkar projek, luangkan beberapa minit untuk melakukan penerokaan terbuka.

!!! info "Cuba Petunjuk Penerokaan Ini"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Nyahperuntukan Infra

!!! warning "Jika anda juga telah menyelesaikan latihan ejen yang dihoskan GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Membongkar infrastruktur semudah:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Sahkan persekitaran yang dipilih dan semak sumber yang akan dipadamkan. Ini membuang sumber Azure dan boleh memusnahkan data. Simpan arahan pengesahan untuk aliran pembelajaran ini. Setelah selesai anda akan melihat output yang serupa dengan:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Sahkan pemadaman dalam portal dan periksa sumber di luar skop penyebaran. Laporan kos dan kemas kini kuota mungkin tertangguh. Konfigurasi `.azure` tempatan kekal kecuali anda keluarkan secara eksplisit.

1. `azd down --purge` juga meminta pemadaman kekal bagi sumber yang disokong yang dipadam secara lembut. Gunakan hanya apabila pemulihan tidak diperlukan dan anda faham polisi penahanan/perlindungan pembersihan. Ia tidak menjamin pelepasan kuota serta-merta.

1. Jangan pasang semula hanya untuk mengesahkan pembersihan. `azd up` sengaja kemudian boleh mencipta semula sumber menggunakan input tempatan yang tinggal, dan akan dikenakan caj sekali lagi. Kemas kini model biasanya menggunakan perubahan penyediaan yang disokong, bukan pembongkaran.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->