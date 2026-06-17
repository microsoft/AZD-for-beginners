# 6. Membongkar Infrastruktur

!!! tip "PADA AKHIR MODUL INI ANDA AKAN MAMPU"

    - [ ] Memahami kepentingan pembersihan sumber dan pengurusan kos
    - [ ] Menggunakan `azd down` untuk membatalkan penyediaan infrastruktur dengan selamat
    - [ ] Memulihkan Perkhidmatan Azure AI yang dipadamkan secara lembut jika perlu
    - [ ] **Makmal 6:** Bersihkan sumber Azure dan sahkan penghapusannya

---

## Latihan Bonus

Sebelum kita membongkar projek, luangkan beberapa minit untuk melakukan penerokaan terbuka.

!!! info "Cuba Arahan Penerokaan Ini"

    **Bersuai dengan GitHub Copilot:**
    
    1. Tanya: `Apakah templat AZD lain yang boleh saya cuba untuk senario agen berganda?`
    2. Tanya: `Bagaimana saya boleh sesuaikan arahan agen untuk kes penggunaan penjagaan kesihatan?`
    3. Tanya: `Apakah pembolehubah persekitaran yang mengawal pengoptimuman kos?`
    
    **Terokai Portal Azure:**
    
    1. Semak metrik Application Insights untuk penyebaran anda
    2. Semak analisis kos untuk sumber yang disediakan
    3. Terokai taman permainan agen portal Microsoft Foundry sekali lagi

---

## Membatalkan Penyediaan Infra

1. Membongkar infrastruktur semudah:

      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Bendera `--purge` memastikan ia juga membersihkan sumber Perkhidmatan Kognitif yang dipadamkan secara lembut, dengan itu melepaskan kuota yang dipegang oleh sumber ini. Setelah selesai anda akan melihat sesuatu seperti ini:

      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Pilihan) Jika anda menjalankan `azd up` lagi sekarang, anda akan perhatikan model gpt-4.1 dikerahkan kerana pembolehubah persekitaran telah diubah (dan disimpan) dalam folder `.azure` tempatan.

      Berikut adalah penyebaran model **sebelum**:

      ![Initial](../../../../../translated_images/ms/14-deploy-initial.30e4cf1c29b587bc.webp)

      Dan inilah **selepas**:
      ![New](../../../../../translated_images/ms/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->