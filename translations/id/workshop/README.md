<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Lokakarya AZD untuk Pengembang AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Lokakarya praktis untuk membangun aplikasi AI dengan Azure Developer CLI.</strong><br>
      Selesaikan 7 modul untuk menguasai template AZD dan alur kerja penyebaran AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Terakhir Diperbarui: Februari 2026
      </span>
    </div>
  </div>
</div>

# Lokakarya AZD untuk Pengembang AI

Selamat datang di lokakarya praktis untuk mempelajari Azure Developer CLI (AZD) dengan fokus pada penyebaran aplikasi AI. Lokakarya ini membantu Anda memperoleh pemahaman terapan tentang template AZD dalam 3 langkah:

1. **Penemuan** - temukan template yang tepat untuk Anda.
1. **Penyebaran** - menyebarkan dan memvalidasi bahwa itu berfungsi
1. **Kustomisasi** - modifikasi dan lakukan iterasi agar menjadi milik Anda!

Sepanjang lokakarya ini, Anda juga akan diperkenalkan pada alat dan alur kerja pengembang inti, untuk membantu Anda menyederhanakan perjalanan pengembangan end-to-end.

<br/>

## Panduan Berbasis Browser

Pelajaran lokakarya ini dalam bentuk Markdown. Anda dapat menavigasinya langsung di GitHub - atau meluncurkan preview berbasis browser seperti yang ditunjukkan pada tangkapan layar di bawah ini.

![Lokakarya](../../../translated_images/id/workshop.75906f133e6f8ba0.webp)

Untuk menggunakan opsi ini - buat fork repositori ke profil Anda, lalu jalankan GitHub Codespaces. Setelah terminal VS Code aktif, ketik perintah ini:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Dalam beberapa detik, Anda akan melihat dialog pop-up. Pilih opsi `Buka di browser`. Panduan berbasis web sekarang akan terbuka di tab browser baru. Beberapa manfaat dari preview ini:

1. **Pencarian bawaan** - temukan kata kunci atau pelajaran dengan cepat.
1. **Ikon salin** - arahkan kursor ke blok kode untuk melihat opsi ini
1. **Tombol ganti tema** - beralih antara tema gelap dan terang
1. **Dapatkan bantuan** - klik ikon Discord di footer untuk bergabung!

<br/>

## Ikhtisar Lokakarya

**Durasi:** 3-4 jam  
**Tingkat:** Pemula hingga Menengah  
**Prasyarat:** Familiaritas dengan Azure, konsep AI, VS Code & alat baris perintah.

Ini adalah lokakarya praktis di mana Anda belajar dengan melakukan. Setelah Anda menyelesaikan latihan, kami sarankan meninjau kurikulum AZD For Beginners untuk melanjutkan perjalanan pembelajaran Anda ke praktik terbaik Keamanan dan Produktivitas.

| Waktu| Modul  | Tujuan |
|:---|:---|:---|
| 15 mins | [Pendahuluan](docs/instructions/0-Introduction.md) | Menetapkan konteks, memahami tujuan |
| 30 mins | [Pilih Template AI](docs/instructions/1-Select-AI-Template.md) | Jelajahi opsi dan pilih starter | 
| 30 mins | [Validasi Template AI](docs/instructions/2-Validate-AI-Template.md) | Menyebarkan solusi default ke Azure |
| 30 mins | [Dekonstruksi Template AI](docs/instructions/3-Deconstruct-AI-Template.md) | Jelajahi struktur dan konfigurasi |
| 30 mins | [Konfigurasikan Template AI](docs/instructions/4-Configure-AI-Template.md) | Aktifkan dan coba fitur yang tersedia |
| 30 mins | [Kustomisasi Template AI](docs/instructions/5-Customize-AI-Template.md) | Sesuaikan template dengan kebutuhan Anda |
| 30 mins | [Bongkar Infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Bersihkan dan lepaskan sumber daya |
| 15 mins | [Penutup & Langkah Selanjutnya](docs/instructions/7-Wrap-up.md) | Sumber belajar, Tantangan lokakarya |

<br/>

## Apa yang Akan Anda Pelajari

Anggap Template AZD sebagai sandbox pembelajaran untuk menjelajahi berbagai kemampuan dan alat untuk pengembangan end-to-end di Microsoft Foundry. Pada akhir lokakarya ini, Anda seharusnya memiliki rasa intuitif terhadap berbagai alat dan konsep dalam konteks ini.

| Konsep  | Tujuan |
|:---|:---|
| **Azure Developer CLI** | Memahami perintah dan alur kerja alat|
| **Template AZD**| Memahami struktur proyek dan konfigurasi|
| **Azure AI Agent**| Menyediakan & menyebarkan proyek Microsoft Foundry  |
| **Azure AI Search**| Mengaktifkan rekayasa konteks dengan agen |
| **Observabilitas**| Menjelajahi penelusuran, pemantauan dan evaluasi |
| **Red Teaming**| Menjelajahi pengujian adversarial dan mitigasinya |

<br/>

## Struktur Lokakarya

Lokakarya ini disusun untuk membawa Anda dalam perjalanan dari penemuan template, hingga penyebaran, dekonstruksi, dan kustomisasi - menggunakan starter template resmi [Memulai dengan Agen AI](https://github.com/Azure-Samples/get-started-with-ai-agents) sebagai dasar.

### [Modul 1: Pilih Template AI](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Apa itu Template AI?
- Di mana saya bisa menemukan Template AI?
- Bagaimana saya bisa memulai membangun Agen AI?
- **Lab**: Mulai cepat dengan GitHub Codespaces

### [Modul 2: Validasi Template AI](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Apa itu Arsitektur Template AI?
- Apa itu Alur Kerja Pengembangan AZD?
- Bagaimana saya bisa mendapatkan bantuan dengan Pengembangan AZD?
- **Lab**: Sebarkan & Validasi template Agen AI

### [Modul 3: Dekonstruksi Template AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Jelajahi lingkungan Anda di `.azure/` 
- Jelajahi pengaturan sumber daya Anda di `infra/` 
- Jelajahi konfigurasi AZD Anda di `azure.yaml`s
- **Lab**: Ubah Variabel Lingkungan & deploy ulang

### [Modul 4: Konfigurasikan Template AI](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Jelajahi: Retrieval Augmented Generation
- Jelajahi: Evaluasi Agen & Red Teaming
- Jelajahi: Penelusuran & Pemantauan
- **Lab**: Jelajahi Agen AI + Observabilitas 

### [Modul 5: Kustomisasi Template AI](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Tentukan: PRD dengan Persyaratan Skenario
- Konfigurasikan: Variabel Lingkungan untuk AZD
- Implementasikan: Lifecycle Hooks untuk tugas tambahan
- **Lab**: Kustomisasi template untuk skenario saya

### [Modul 6: Bongkar Infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Ringkasan: Apa itu Template AZD?
- Ringkasan: Mengapa menggunakan Azure Developer CLI?
- Langkah Selanjutnya: Coba template yang berbeda!
- **Lab**: Batalkan penyediaan infrastruktur & bersihkan

<br/>

## Tantangan Lokakarya

Ingin menantang diri Anda untuk melakukan lebih banyak? Berikut beberapa saran proyek - atau bagikan ide Anda kepada kami!!

| Proyek | Deskripsi |
|:---|:---|
|1. **Dekonstruksi Template AI yang Kompleks** | Gunakan alur kerja dan alat yang kami jelaskan dan lihat apakah Anda bisa menyebarkan, memvalidasi, dan menyesuaikan template solusi AI yang berbeda. _Apa yang Anda pelajari?_|
|2. **Kustomisasi Dengan Skenario Anda**  | Cobalah menulis PRD (Product Requirements Document) untuk skenario yang berbeda. Kemudian gunakan GitHub Copilot di repo template Anda di Agent Model - dan minta untuk menghasilkan alur kerja kustomisasi untuk Anda. _Apa yang Anda pelajari? Bagaimana Anda bisa memperbaiki saran-saran ini?_|
| | |

## Punya masukan?

1. Buat issue di repo ini - beri tag `Workshop` untuk kemudahan.
1. Bergabunglah dengan Microsoft Foundry Discord - terhubung dengan rekan Anda!


| | | 
|:---|:---|
| **📚 Beranda Kursus**| [AZD For Beginners](../README.md)|
| **📖 Dokumentasi** | [Memulai dengan template AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Template AI** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Langkah Selanjutnya** | [Mulai Lokakarya](../../../workshop) |
| | |

<br/>

---

**Navigasi:** [Kursus Utama](../README.md) | [Pendahuluan](docs/instructions/0-Introduction.md) | [Modul 1: Pilih Template](docs/instructions/1-Select-AI-Template.md)

**Siap untuk mulai membangun aplikasi AI dengan AZD?**

[Mulai Lokakarya: Pendahuluan →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diketahui bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemah profesional. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->