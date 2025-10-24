<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:01:17+00:00",
  "source_file": "workshop/README.md",
  "language_code": "ms"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Bengkel Sedang Dibangunkan 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Bengkel ini sedang dalam pembangunan aktif.</strong><br>
      Kandungan mungkin tidak lengkap atau tertakluk kepada perubahan. Kembali semula untuk kemas kini!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Dikemas kini kali terakhir: Oktober 2025
      </span>
    </div>
  </div>
</div>

# Bengkel AZD untuk Pembangun AI

Selamat datang ke bengkel praktikal untuk mempelajari Azure Developer CLI (AZD) dengan fokus pada penyebaran aplikasi AI. Bengkel ini membantu anda memahami penggunaan templat AZD dalam 3 langkah:

1. **Penemuan** - cari templat yang sesuai untuk anda.
1. **Penyebaran** - sebarkan dan sahkan ia berfungsi
1. **Penyesuaian** - ubah dan sesuaikan mengikut keperluan anda!

Sepanjang bengkel ini, anda juga akan diperkenalkan kepada alat dan aliran kerja pembangun utama untuk membantu anda mempercepatkan perjalanan pembangunan dari awal hingga akhir.

<br/>

## Panduan Berasaskan Pelayar

Pelajaran bengkel ini disediakan dalam format Markdown. Anda boleh menavigasi terus di GitHub - atau melancarkan pratonton berasaskan pelayar seperti yang ditunjukkan dalam tangkapan skrin di bawah.

![Bengkel](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.ms.png)

Untuk menggunakan pilihan ini - fork repositori ke profil anda, dan lancarkan GitHub Codespaces. Setelah terminal VS Code aktif, taip arahan ini:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Dalam beberapa saat, anda akan melihat dialog pop-up. Pilih pilihan `Open in browser`. Panduan berasaskan web akan dibuka dalam tab pelayar baru. Beberapa kelebihan pratonton ini:

1. **Carian terbina dalam** - cari kata kunci atau pelajaran dengan cepat.
1. **Ikon salin** - gerakkan tetikus ke atas blok kod untuk melihat pilihan ini
1. **Togol tema** - tukar antara tema gelap dan terang
1. **Dapatkan bantuan** - klik ikon Discord di bahagian bawah untuk sertai!

<br/>

## Gambaran Keseluruhan Bengkel

**Tempoh:** 3-4 jam  
**Tahap:** Pemula hingga Pertengahan  
**Prasyarat:** Kefahaman tentang Azure, konsep AI, VS Code & alat baris perintah.

Ini adalah bengkel praktikal di mana anda belajar dengan melakukan. Setelah anda menyelesaikan latihan, kami mengesyorkan anda mengkaji kurikulum AZD Untuk Pemula untuk meneruskan perjalanan pembelajaran anda ke amalan terbaik dalam Keselamatan dan Produktiviti.

| Masa | Modul  | Objektif |
|:---|:---|:---|
| 15 minit | [Pengenalan](docs/instructions/0-Introduction.md) | Tetapkan asas, fahami matlamat |
| 30 minit | [Pilih Templat AI](docs/instructions/1-Select-AI-Template.md) | Terokai pilihan dan pilih permulaan | 
| 30 minit | [Sahkan Templat AI](docs/instructions/2-Validate-AI-Template.md) | Sebarkan penyelesaian lalai ke Azure |
| 30 minit | [Huraikan Templat AI](docs/instructions/3-Deconstruct-AI-Template.md) | Terokai struktur dan konfigurasi |
| 30 minit | [Konfigurasi Templat AI](docs/instructions/4-Configure-AI-Template.md) | Aktifkan dan cuba ciri yang tersedia |
| 30 minit | [Sesuaikan Templat AI](docs/instructions/5-Customize-AI-Template.md) | Sesuaikan templat mengikut keperluan anda |
| 30 minit | [Hapus Infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Bersihkan dan lepaskan sumber |
| 15 minit | [Penutup & Langkah Seterusnya](docs/instructions/7-Wrap-up.md) | Sumber pembelajaran, cabaran bengkel |

<br/>

## Apa Yang Akan Anda Pelajari

Anggaplah Templat AZD sebagai kotak pasir pembelajaran untuk meneroka pelbagai keupayaan dan alat untuk pembangunan hujung ke hujung di Azure AI Foundry. Pada akhir bengkel ini, anda seharusnya mempunyai pemahaman intuitif tentang pelbagai alat dan konsep dalam konteks ini.

| Konsep  | Objektif |
|:---|:---|
| **Azure Developer CLI** | Fahami arahan alat dan aliran kerja|
| **Templat AZD**| Fahami struktur projek dan konfigurasi|
| **Azure AI Agent**| Sediakan & sebarkan projek Azure AI Foundry  |
| **Azure AI Search**| Aktifkan kejuruteraan konteks dengan agen |
| **Keterlihatan**| Terokai penjejakan, pemantauan dan penilaian |
| **Red Teaming**| Terokai ujian adversarial dan mitigasi |

<br/>

## Struktur Bengkel

Bengkel ini disusun untuk membawa anda melalui perjalanan dari penemuan templat, ke penyebaran, penghuraian, dan penyesuaian - menggunakan templat permulaan rasmi [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) sebagai asas.

### [Modul 1: Pilih Templat AI](docs/instructions/1-Select-AI-Template.md) (30 minit)

- Apa itu Templat AI?
- Di mana saya boleh mencari Templat AI?
- Bagaimana saya boleh mula membina Agen AI?
- **Makmal**: Permulaan pantas dengan GitHub Codespaces

### [Modul 2: Sahkan Templat AI](docs/instructions/2-Validate-AI-Template.md) (30 minit)

- Apakah Seni Bina Templat AI?
- Apakah Aliran Kerja Pembangunan AZD?
- Bagaimana saya boleh mendapatkan bantuan dengan Pembangunan AZD?
- **Makmal**: Sebarkan & Sahkan templat Agen AI

### [Modul 3: Huraikan Templat AI](docs/instructions/3-Deconstruct-AI-Template.md) (30 minit)

- Terokai persekitaran anda dalam `.azure/` 
- Terokai persediaan sumber anda dalam `infra/` 
- Terokai konfigurasi AZD anda dalam `azure.yaml`s
- **Makmal**: Ubah Pembolehubah Persekitaran & Sebarkan Semula

### [Modul 4: Konfigurasi Templat AI](docs/instructions/4-Configure-AI-Template.md) (30 minit)
- Terokai: Retrieval Augmented Generation
- Terokai: Penilaian Agen & Red Teaming
- Terokai: Penjejakan & Pemantauan
- **Makmal**: Terokai Agen AI + Keterlihatan 

### [Modul 5: Sesuaikan Templat AI](docs/instructions/5-Customize-AI-Template.md) (30 minit)
- Tentukan: PRD dengan Keperluan Senario
- Konfigurasi: Pembolehubah Persekitaran untuk AZD
- Laksanakan: Lifecycle Hooks untuk tugas tambahan
- **Makmal**: Sesuaikan templat untuk senario saya

### [Modul 6: Hapus Infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 minit)
- Ulang Kaji: Apa itu Templat AZD?
- Ulang Kaji: Mengapa menggunakan Azure Developer CLI?
- Langkah Seterusnya: Cuba templat lain!
- **Makmal**: Nyahbekalkan infrastruktur & bersihkan

<br/>

## Cabaran Bengkel

Ingin mencabar diri anda untuk melakukan lebih banyak? Berikut adalah beberapa cadangan projek - atau kongsikan idea anda dengan kami!!

| Projek | Penerangan |
|:---|:---|
|1. **Huraikan Templat AI yang Kompleks** | Gunakan aliran kerja dan alat yang telah kami gariskan dan lihat jika anda boleh menyebarkan, mengesahkan, dan menyesuaikan templat penyelesaian AI yang berbeza. _Apa yang anda pelajari?_|
|2. **Sesuaikan Dengan Senario Anda**  | Cuba tulis PRD (Dokumen Keperluan Produk) untuk senario yang berbeza. Kemudian gunakan GitHub Copilot dalam repo templat anda dalam Model Agen - dan minta ia menjana aliran kerja penyesuaian untuk anda. _Apa yang anda pelajari? Bagaimana anda boleh memperbaiki cadangan ini?_|
| | |

## Ada maklum balas?

1. Hantar isu di repo ini - tag ia sebagai `Workshop` untuk kemudahan.
1. Sertai Discord Azure AI Foundry - berhubung dengan rakan-rakan anda!


| | | 
|:---|:---|
| **📚 Halaman Kursus**| [AZD Untuk Pemula](../README.md)|
| **📖 Dokumentasi** | [Mulakan dengan templat AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Templat AI** | [Templat Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Langkah Seterusnya** | [Ambil Cabaran](../../../workshop) |
| | |

<br/>

---

**Sebelumnya:** [Panduan Penyelesaian Masalah AI](../docs/troubleshooting/ai-troubleshooting.md) | **Seterusnya:** Mulakan dengan [Makmal 1: Asas AZD](../../../workshop/lab-1-azd-basics)

**Sedia untuk mula membina aplikasi AI dengan AZD?**

[Mulakan Makmal 1: Asas AZD →](./lab-1-azd-basics/README.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang berwibawa. Untuk maklumat penting, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.