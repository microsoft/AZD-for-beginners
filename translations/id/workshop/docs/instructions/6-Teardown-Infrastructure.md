# 6. Menghapus Infrastruktur

!!! tip "PADA AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Memahami pentingnya pembersihan sumber daya dan pengelolaan biaya
    - [ ] Gunakan `azd down` untuk menghapus penyediaan infrastruktur dengan aman
    - [ ] Memulihkan layanan Azure AI yang dihapus sementara jika diperlukan
    - [ ] **Lab 6:** Membersihkan sumber daya Azure dan memverifikasi penghapusan

---

## Latihan Tambahan

Before we tear down the project, take a few minutes to do some open-ended exploration.

!!! info "Coba Prompt Eksplorasi Ini"

    **Bereksperimen dengan GitHub Copilot:**
    
    1. Ask: `Template AZD lain apa yang bisa saya coba untuk skenario multi-agen?`
    2. Ask: `Bagaimana saya dapat menyesuaikan instruksi agen untuk kasus penggunaan layanan kesehatan?`
    3. Ask: `Variabel lingkungan apa yang mengontrol optimasi biaya?`
    
    **Jelajahi Azure Portal:**
    
    1. Tinjau metrik Application Insights untuk penyebaran Anda
    2. Periksa analisis biaya untuk sumber daya yang disediakan
    3. Jelajahi ulang playground agen di portal Microsoft Foundry

---

## Menghapus Penyediaan Infrastruktur

1. Membongkar infrastruktur semudah:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opsional) Jika Anda sekarang menjalankan `azd up` lagi, Anda akan melihat model gpt-4.1 dideploy karena variabel lingkungan diubah (dan disimpan) di folder lokal `.azure`. 

      Berikut adalah penempatan model **sebelum**:

      ![Sebelum](../../../../../translated_images/id/14-deploy-initial.30e4cf1c29b587bc.webp)

      Dan ini **setelah**:
      ![Setelah](../../../../../translated_images/id/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->