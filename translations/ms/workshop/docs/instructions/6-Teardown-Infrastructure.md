# 6. Menyahpasang Infrastruktur

!!! tip "PADA AKHIR MODUL INI ANDA AKAN BOLEH"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Latihan Bonus

Sebelum kita menyahpasang projek, luangkan beberapa minit untuk melakukan penerokaan terbuka.

!!! info "Cuba Panduan Penerokaan Ini"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Nyahpasang Infra

1. Menyahpasang infrastruktur adalah semudah:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Sahkan persekitaran yang dipilih dan semak sumber yang hendak dipadamkan. Ini akan mengalih keluar sumber Azure dan boleh memusnahkan data. Kekalkan arahan pengesahan untuk aliran pembelajaran ini. Setelah selesai anda akan melihat output serupa:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Sahkan pemadaman di portal dan periksa sumber di luar skop penyebaran. Pelaporan kos dan kemas kini kuota boleh berlaku lambat. Konfigurasi `.azure` tempatan kekal melainkan anda nyahpadamkannya secara eksplisit.

1. `azd down --purge` juga meminta pemadaman kekal sumber yang disokong yang dipadamkan secara lembut. Gunakan hanya apabila pemulihan tidak diperlukan dan anda faham polisi pengekalan/pemeliharaan lindungan hapus. Ia tidak menjamin pelepasan kuota segera.

1. Jangan pasang semula hanya untuk mengesahkan pembersihan. `azd up` yang disengajakan kemudian boleh mencipta semula sumber menggunakan input tempatan yang tinggal, dan akan mengenakan caj semula. Kemas kini model biasanya menggunakan perubahan penyediaan yang disokong, bukan pembuangan.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->