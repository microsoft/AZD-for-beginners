# AZD untuk Pengembang AI Workshop

> Panduan sumber diperiksa terhadap AZD 1.37.2 pada 4 November 2026. Tangkapan layar adalah ilustrasi; ketersediaan layanan, label portal, dan default template dapat berubah.

> [!IMPORTANT]  
> **Workshop ini dilengkapi dengan panduan workshop yang dapat Anda pratinjau di browser lokal Anda. Untuk memulai, buka repo di GitHub Codespaces, dev container, atau klon lokal dengan MkDocs terpasang—kemudian tunggu sampai Anda melihat terminal VS Code aktif dan ketik:**  
> Dari root repositori kursus, pasang `requirements-dev.txt`, lalu jalankan `python -m mkdocs serve --config-file workshop/mkdocs.yml` di latar depan.
> **Anda harus melihat dialog pop-up untuk membuka halaman pratinjau di browser.**

Selamat datang di workshop praktis untuk mempelajari Azure Developer CLI (AZD) dengan fokus pada penyebaran aplikasi AI. Workshop ini membantu Anda memperoleh pemahaman terapan tentang template AZD dalam 3 langkah:

1. **Penemuan** - temukan template yang sesuai untuk Anda.
1. **Penyebaran** - sebar dan validasi bahwa itu berfungsi
1. **Penyesuaian** - modifikasi dan iterasi agar menjadi milik Anda!

Sepanjang workshop ini, Anda juga akan diperkenalkan dengan alat dan alur kerja inti pengembang, untuk membantu Anda menyederhanakan perjalanan pengembangan end-to-end Anda.

| | | 
|:---|:---|
| **📚 Beranda Kursus**| [AZD Untuk Pemula](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentasi** | [Memulai dengan template AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Template AI** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Langkah Selanjutnya** | [Ikuti Tantangan](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Ikhtisar Workshop

**Durasi:** 3-4 jam  
**Level:** Pemula hingga Menengah  
**Prasyarat:** Familiar dengan Azure, konsep AI, VS Code & alat baris perintah.

Ini adalah workshop langsung di mana Anda belajar dengan praktik. Setelah menyelesaikan latihan, kami menyarankan meninjau kurikulum AZD Untuk Pemula untuk melanjutkan perjalanan pembelajaran Anda ke praktik terbaik Keamanan dan Produktivitas.

| Waktu| Modul  | Tujuan |
|:---|:---|:---|
| 15 menit | Pengenalan | Menyiapkan panggung, memahami tujuan |
| 30 menit | Pilih Template AI | Jelajahi opsi dan pilih pemula | 
| 30 menit | Validasi Template AI | Sebar solusi default ke Azure |
| 30 menit | Deconstruct Template AI | Eksplorasi struktur dan konfigurasi |
| 30 menit | Konfigurasi Template AI | Aktifkan dan coba fitur yang tersedia |
| 30 menit | Sesuaikan Template AI | Sesuaikan template dengan kebutuhan Anda |
| 30 menit | Pembersihan Infrastruktur | Bersih-bersih dan lepas sumber daya |
| 15 menit | Penutupan & Langkah Selanjutnya | Sumber belajar, tantangan Workshop |
| | |

## Apa yang Akan Anda Pelajari

Anggap Template AZD sebagai sandbox pembelajaran untuk mengeksplorasi berbagai kemampuan dan alat untuk pengembangan end-to-end di Microsoft Foundry. Pada akhir workshop ini, Anda harus memiliki rasa intuitif untuk berbagai alat dan konsep dalam konteks ini.

| Konsep  | Tujuan |
|:---|:---|
| **Azure Developer CLI** | Pahami perintah alat dan alur kerja|
| **Template AZD**| Pahami struktur proyek dan konfigurasi|
| **Azure AI Agent**| Penyediaan & penyebaran proyek Microsoft Foundry  |
| **Azure AI Search**| Aktifkan rekayasa konteks dengan agen |
| **Observability**| Jelajahi pelacakan, pemantauan, dan evaluasi |
| **Red Teaming**| Eksplorasi pengujian adversarial dan mitigasi |
| | |

## Modul Workshop

Siap untuk memulai? Navigasi melalui modul workshop:

- [Modul 1: Pilih Template AI](instructions/1-Select-AI-Template.md)
- [Modul 2: Validasi Template AI](instructions/2-Validate-AI-Template.md) 
- [Modul 3: Deconstruct Template AI](instructions/3-Deconstruct-AI-Template.md)
- [Modul 4: Konfigurasi Template AI](instructions/4-Configure-AI-Template.md)
- [Modul 5: Sesuaikan Template AI](instructions/5-Customize-AI-Template.md)
- [Modul 6: Pembersihan Infrastruktur](instructions/6-Teardown-Infrastructure.md)
- [Modul 7: Penutupan & Langkah Selanjutnya](instructions/7-Wrap-up.md)

## Ada masukan?

Kirim masalah di repo ini (beri tag `Workshop`) atau bergabung dengan kami di [Discord](https://aka.ms/foundry/discord) dan kirim ke channel `#get-help` kami

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->