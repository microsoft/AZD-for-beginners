<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6539a34c770f3ceff282370d72ee74dc",
  "translation_date": "2025-09-24T23:34:46+00:00",
  "source_file": "workshop/docs/instructions/6-Teardown-Infrastructure.md",
  "language_code": "id"
}
-->
# 6. Membongkar Infrastruktur

!!! tip "DI AKHIR MODUL INI ANDA AKAN MAMPU"

    - [ ] Item
    - [ ] Item
    - [ ] Item

---

## Latihan Bonus

Sebelum kita membongkar proyek, luangkan beberapa menit untuk melakukan eksplorasi terbuka.

!!! danger "NITYA-TODO: Buat beberapa saran untuk dicoba"

---

## Membongkar Infrastruktur

1. Membongkar infrastruktur semudah:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Flag `--purge` memastikan bahwa sumber daya Cognitive Service yang dihapus secara lunak juga dibersihkan, sehingga kuota yang digunakan oleh sumber daya tersebut dilepaskan. Setelah selesai, Anda akan melihat sesuatu seperti ini:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opsional) Jika Anda sekarang menjalankan `azd up` lagi, Anda akan melihat model gpt-4.1 dideploy karena variabel lingkungan telah diubah (dan disimpan) di folder lokal `.azure`.

      Berikut adalah deployment model **sebelum**:

      ![Awal](../../../../../translated_images/14-deploy-initial.30e4cf1c29b587bc.id.png)

      Dan berikut adalah **setelah**:
      ![Baru](../../../../../translated_images/14-deploy-new.f7f3c355a3cf7299.id.png)

---

