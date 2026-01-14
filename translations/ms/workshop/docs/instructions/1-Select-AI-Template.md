<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-24T23:34:10+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "ms"
}
-->
# 1. Pilih Templat

!!! tip "MENJELANG AKHIR MODUL INI ANDA AKAN DAPAT"

    - [ ] Terangkan apa itu templat AZD
    - [ ] Temui dan gunakan templat AZD untuk AI
    - [ ] Mulakan dengan templat AI Agents
    - [ ] **Makmal 1:** AZD Quickstart dengan GitHub Codespaces

---

## 1. Analogi Pembinaan

Membina aplikasi AI moden yang bersedia untuk perusahaan _dari awal_ boleh menjadi tugas yang mencabar. Ia sedikit seperti membina rumah baru anda sendiri, bata demi bata. Ya, ia boleh dilakukan! Tetapi ia bukan cara yang paling berkesan untuk mencapai hasil yang diinginkan!

Sebaliknya, kita sering bermula dengan _pelan reka bentuk_ yang sedia ada, dan bekerjasama dengan arkitek untuk menyesuaikannya mengikut keperluan peribadi kita. Dan itulah pendekatan yang perlu diambil apabila membina aplikasi pintar. Pertama, cari seni bina reka bentuk yang baik yang sesuai dengan ruang masalah anda. Kemudian bekerjasama dengan arkitek penyelesaian untuk menyesuaikan dan membangunkan penyelesaian untuk senario khusus anda.

Tetapi di mana kita boleh mencari pelan reka bentuk ini? Dan bagaimana kita boleh mencari arkitek yang bersedia mengajar kita cara menyesuaikan dan melaksanakan pelan ini sendiri? Dalam bengkel ini, kami menjawab soalan-soalan tersebut dengan memperkenalkan anda kepada tiga teknologi:

1. [Azure Developer CLI](https://aka.ms/azd) - alat sumber terbuka yang mempercepatkan laluan pembangun daripada pembangunan tempatan (build) kepada pelaksanaan awan (ship).
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - repositori sumber terbuka yang standard yang mengandungi kod contoh, fail infrastruktur dan konfigurasi untuk melaksanakan seni bina penyelesaian AI.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - agen pengekodan yang berasaskan pengetahuan Azure, yang boleh membimbing kita dalam menavigasi pangkalan kod dan membuat perubahan - menggunakan bahasa semula jadi.

Dengan alat-alat ini, kita kini boleh _mencari_ templat yang sesuai, _melaksanakan_ untuk mengesahkan ia berfungsi, dan _menyesuaikan_ untuk memenuhi senario khusus kita. Mari kita terokai dan pelajari cara alat-alat ini berfungsi.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (atau `azd`) ialah alat baris perintah sumber terbuka yang boleh mempercepatkan perjalanan kod-ke-awan anda dengan set arahan mesra pembangun yang berfungsi secara konsisten merentasi persekitaran IDE (pembangunan) dan CI/CD (devops).

Dengan `azd`, perjalanan pelaksanaan anda boleh menjadi semudah:

- `azd init` - Memulakan projek AI baru daripada templat AZD yang sedia ada.
- `azd up` - Menyediakan infrastruktur dan melaksanakan aplikasi anda dalam satu langkah.
- `azd monitor` - Dapatkan pemantauan dan diagnostik masa nyata untuk aplikasi yang telah dilaksanakan.
- `azd pipeline config` - Sediakan saluran CI/CD untuk mengautomasi pelaksanaan ke Azure.

**🎯 | LATIHAN**: <br/> Terokai alat baris perintah `azd` dalam persekitaran GitHub Codespaces anda sekarang. Mulakan dengan menaip arahan ini untuk melihat apa yang alat ini boleh lakukan:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/azd-flow.19ea67c2f81eaa66.ms.png)

---

## 3. Templat AZD

Untuk `azd` mencapai ini, ia perlu mengetahui infrastruktur yang hendak disediakan, tetapan konfigurasi yang hendak dikuatkuasakan, dan aplikasi yang hendak dilaksanakan. Di sinilah [templat AZD](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) memainkan peranan.

Templat AZD ialah repositori sumber terbuka yang menggabungkan kod contoh dengan fail infrastruktur dan konfigurasi yang diperlukan untuk melaksanakan seni bina penyelesaian. 
Dengan menggunakan pendekatan _Infrastructure-as-Code_ (IaC), ia membolehkan definisi sumber templat dan tetapan konfigurasi dikawal versi (seperti kod sumber aplikasi) - mewujudkan aliran kerja yang boleh digunakan semula dan konsisten di kalangan pengguna projek tersebut.

Apabila mencipta atau menggunakan templat AZD untuk senario _anda_, pertimbangkan soalan-soalan ini:

1. Apa yang anda bina? → Adakah terdapat templat yang mempunyai kod permulaan untuk senario tersebut?
1. Bagaimana seni bina penyelesaian anda? → Adakah terdapat templat yang mempunyai sumber yang diperlukan?
1. Bagaimana penyelesaian anda dilaksanakan? → Fikirkan `azd deploy` dengan cangkuk pra/pasca-pemprosesan!
1. Bagaimana anda boleh mengoptimumkannya lagi? → Fikirkan pemantauan terbina dalam dan saluran automasi!

**🎯 | LATIHAN**: <br/> 
Lawati galeri [Awesome AZD](https://azure.github.io/awesome-azd/) dan gunakan penapis untuk meneroka lebih daripada 250 templat yang tersedia. Lihat jika anda boleh menemui satu yang selaras dengan keperluan senario _anda_.

![Code](../../../../../translated_images/azd-code-to-cloud.2d9503d69d3400da.ms.png)

---

## 4. Templat Aplikasi AI

---

