# 7. Ringkasan & Langkah Selanjutnya

!!! tip "POIN-POIN UTAMA"

    - [ ] Template AZD mempercepat pengembangan aplikasi AI dari hari menjadi jam
    - [ ] Metodologi Discovery → Deployment → Customization menyediakan jalur pembelajaran yang terstruktur
    - [ ] GitHub Copilot dengan server MCP memungkinkan eksplorasi kode kompleks menggunakan bahasa alami
    - [ ] Microsoft Foundry menyediakan observabilitas, evaluasi, dan pengujian keamanan bawaan

---

## 1. Apa yang Telah Anda Capai

Selamat! Dalam lokakarya ini, Anda telah berhasil:

| Modul | Pencapaian |
|:---|:---|
| **Modul 1** | Menemukan Azure Developer CLI dan memilih template AI |
| **Modul 2** | Mendeploy dan memvalidasi solusi agen AI yang lengkap |
| **Modul 3** | Membongkar template untuk memahami arsitekturnya |
| **Modul 4** | Mengeksplorasi konfigurasi `azure.yaml` dan hook siklus hidup |
| **Modul 5** | Menyesuaikan template untuk skenario Anda sendiri |
| **Modul 6** | Menurunkan infrastruktur dengan aman dan mengelola sumber daya |

---

## 2. Konsep Utama yang Dikuasai

### Azure Developer CLI (azd)
- `azd init` - Menginisialisasi proyek dari template
- `azd up` - Menyiapkan dan mendeploy dalam satu perintah
- `azd env` - Mengelola variabel lingkungan
- `azd down` - Membersihkan sumber daya dengan aman

### Struktur Template AZD
- `azure.yaml` - Konfigurasi dan hook deployment
- `infra/` - Bicep infrastruktur-sebagai-kode
- `src/` - Kode sumber aplikasi
- `scripts/` - Skrip otomasi dan konfigurasi

### Kemampuan Microsoft Foundry
- Layanan Agen AI untuk asisten cerdas
- File Search dan Azure AI Search untuk pengambilan pengetahuan
- Pelacakan, pemantauan, dan evaluasi bawaan
- Red teaming untuk validasi keamanan AI

---

## 3. Lanjutkan Perjalanan Pembelajaran Anda

### Langkah Berikutnya yang Direkomendasikan

| Jalur | Sumber | Waktu |
|:---|:---|:---|
| **Kursus Lengkap** | [Kurikulum AZD untuk Pemula](../../README.md) | 8-12 jam |
| **Coba Template Lain** | [Template Microsoft Foundry](https://ai.azure.com/templates) | 1-2 jam |
| **Pendalaman** | [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Berlanjut |
| **Komunitas** | [Azure Discord](https://aka.ms/foundry/discord) | Bergabung hari ini! |

### Template yang Disarankan untuk Dicoba Selanjutnya

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Obrolan dasar dengan data Anda
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Pola RAG tingkat lanjut
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Skenario ritel perusahaan

---

## 4. Tantangan Workshop

Siap menguji keterampilan Anda? Coba tantangan ini:

| Tantangan | Deskripsi | Kesulitan |
|:---|:---|:---|
| **1. Skenario Multi-Agen** | Mendeploy dan sesuaikan untuk industri yang berbeda (mis. kesehatan, keuangan) | ⭐⭐ |
| **2. Basis Pengetahuan Kustom** | Tambahkan file data Anda sendiri dan buat indeks pencarian kustom | ⭐⭐⭐ |
| **3. Penyebaran Produksi** | Atur CI/CD dengan GitHub Actions menggunakan `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Bagikan Masukan Anda

Masukan Anda membantu kami meningkatkan lokakarya ini!

- **GitHub Issues**: [Kirim masukan](https://github.com/microsoft/azd-for-beginners/issues) - beri tag dengan `Workshop`
- **Discord**: Bergabung [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - posting di `#get-help`
- **Kontribusi**: Bantu tingkatkan lokakarya ini dengan mengirimkan pull request!

---

## Terima Kasih! 🎉

Terima kasih telah menyelesaikan Workshop AZD untuk Pengembang AI. Kami berharap pengalaman ini telah membekali Anda dengan keterampilan dan kepercayaan diri untuk membangun dan menyebarkan aplikasi AI di Azure.

**Terus membangun, terus belajar, dan selamat datang di komunitas pengembang Azure AI!**

---

| | |
|:---|:---|
| **📚 Beranda Kursus** | [AZD Untuk Pemula](../../README.md) |
| **📖 Dokumentasi** | [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Template AI** | [Template Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Komunitas** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang menjadi acuan. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul akibat penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->