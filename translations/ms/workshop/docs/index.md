# Bengkel AZD untuk Pembangun AI

> Panduan sumber disemak mengikut AZD 1.37.2 pada 4 November 2026. Tangkapan skrin adalah ilustratif; ketersediaan perkhidmatan, label portal, dan tetapan lalai templat boleh berubah.

> [!IMPORTANT]  
> **Bengkel ini dilengkapi panduan bengkel yang boleh anda pratonton dalam pelayar tempatan anda. Untuk bermula, buka repo dalam GitHub Codespaces, bekas pembangunan, atau klon tempatan dengan MkDocs dipasang—kemudian tunggu sehingga anda melihat terminal VS Code aktif dan taip:**  
> Dari akar repositori kursus, pasangkan `requirements-dev.txt`, kemudian jalankan `python -m mkdocs serve --config-file workshop/mkdocs.yml` di latar hadapan.
> **Anda harus melihat dialog timbul untuk membuka halaman pratonton dalam pelayar.**

Selamat datang ke bengkel praktikal untuk mempelajari Azure Developer CLI (AZD) dengan tumpuan pada penyebaran aplikasi AI. Bengkel ini membantu anda memperoleh pemahaman terapan tentang templat AZD dalam 3 langkah:

1. **Penemuan** - cari templat yang sesuai untuk anda.
1. **Penyebaran** - sebarkan dan sahkan ia berfungsi.
1. **Penyesuaian** - ubah dan ulang untuk membuatnya menjadi milik anda!

Sepanjang bengkel ini, anda juga akan diperkenalkan dengan alat dan aliran kerja pembangun teras, untuk membantu anda melancarkan perjalanan pembangunan hujung-ke-hujung anda.

| | | 
|:---|:---|
| **📚 Laman Utama Kursus**| [AZD Untuk Pemula](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentasi** | [Mulakan dengan templat AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️T emplat AI** | [Templat Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Langkah Seterusnya** | [Ambil Cabaran](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Gambaran Keseluruhan Bengkel

**Tempoh:** 3-4 jam  
**Tahap:** Pemula ke Sederhana  
**Prasyarat:** Kefahaman dengan Azure, konsep AI, VS Code & alat garis arahan.

Ini adalah bengkel praktikal di mana anda belajar dengan membuat. Setelah anda menyelesaikan latihan, kami mencadangkan agar anda menyemak kurikulum AZD Untuk Pemula untuk meneruskan perjalanan pembelajaran anda ke dalam amalan terbaik Keselamatan dan Produktiviti.

| Masa| Modul  | Objektif |
|:---|:---|:---|
| 15 minit | Pengenalan | Tetapkan pentas, fahami matlamat |
| 30 minit | Pilih Templat AI | Terokai pilihan dan pilih permulaan | 
| 30 minit | Sah Templat AI | Sebarkan penyelesaian lalai ke Azure |
| 30 minit | Bongkar Templat AI | Terokai struktur dan konfigurasi |
| 30 minit | Konfigurasikan Templat AI | Aktifkan dan cuba ciri tersedia |
| 30 minit | Sesuaikan Templat AI | Sesuaikan templat mengikut keperluan anda |
| 30 minit | Bongkar Infrastruktur | Bersihkan dan lepaskan sumber |
| 15 minit | Penutup & Langkah Seterusnya | Sumber pembelajaran, cabaran bengkel |
| | |

## Apa yang Anda Akan Pelajari

Anggapkan Templat AZD sebagai kotak pasir pembelajaran untuk meneroka pelbagai keupayaan dan alat untuk pembangunan hujung-ke-hujung di Microsoft Foundry. Menjelang akhir bengkel ini, anda sepatutnya mempunyai rasa intuitif tentang pelbagai alat dan konsep dalam konteks ini.

| Konsep  | Objektif |
|:---|:---|
| **Azure Developer CLI** | Fahami perintah alat dan aliran kerja|
| **Templat AZD**| Fahami struktur projek dan konfigurasi|
| **Azure AI Agent**| Sediakan & sebarkan projek Microsoft Foundry  |
| **Azure AI Search**| Aktifkan kejuruteraan konteks dengan agen |
| **Kebolehamatan**| Terokai penjejakan, pemantauan dan penilaian |
| **Red Teaming**| Terokai ujian lawan dan mitigasi |
| | |

## Modul Bengkel

Bersedia untuk bermula? Navigasi melalui modul bengkel:

- [Modul 1: Pilih Templat AI](instructions/1-Select-AI-Template.md)
- [Modul 2: Sah Templat AI](instructions/2-Validate-AI-Template.md) 
- [Modul 3: Bongkar Templat AI](instructions/3-Deconstruct-AI-Template.md)
- [Modul 4: Konfigurasikan Templat AI](instructions/4-Configure-AI-Template.md)
- [Modul 5: Sesuaikan Templat AI](instructions/5-Customize-AI-Template.md)
- [Modul 6: Bongkar Infrastruktur](instructions/6-Teardown-Infrastructure.md)
- [Modul 7: Penutup & Langkah Seterusnya](instructions/7-Wrap-up.md)

## Ada maklum balas?

Posting isu pada repo ini (tag ia `Workshop`) atau sertai kami di [Discord](https://aka.ms/foundry/discord) dan hantar di saluran `#get-help` kami

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->