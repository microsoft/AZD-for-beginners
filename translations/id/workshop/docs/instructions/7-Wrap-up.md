# 7. Penutup & Langkah Selanjutnya

!!! tip "PELAJARAN UTAMA YANG DIDAPAT ADALAH"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Apa yang Telah Anda Capai

Selamat! Dalam lokakarya ini, Anda telah berhasil:

| Modul | Pencapaian |
|:---|:---|
| **Modul 1** | Menemukan Azure Developer CLI dan memilih template AI |
| **Modul 2** | Mendeploy dan memvalidasi solusi agen AI lengkap |
| **Modul 3** | Membongkar template untuk memahami arsitekturnya |
| **Modul 4** | Menjelajahi konfigurasi `azure.yaml` dan lifecycle hooks |
| **Modul 5** | Menyesuaikan template untuk skenario Anda sendiri |
| **Modul 6** | Membongkar infrastruktur dengan aman dan mengelola sumber daya |

---

## 2. Konsep Utama yang Dikuasai

### Azure Developer CLI (azd)
- `azd init` - Menginisialisasi proyek dari template
- `azd up` - Menyediakan dan mendeploy dalam satu perintah
- `azd env` - Mengelola variabel lingkungan
- `azd down` - Membersihkan sumber daya dengan aman

### Struktur Template AZD
- `azure.yaml` - Konfigurasi dan hooks deployment
- `infra/` - Infrastruktur sebagai kode Bicep
- `src/` - Kode sumber aplikasi
- `scripts/` - Automasi dan skrip setup

### Kapabilitas Microsoft Foundry
- Layanan Agen AI untuk asisten cerdas
- Pencarian Berkas dan Azure AI Search untuk pengambilan pengetahuan
- Tracing, monitoring, dan evaluasi bawaan
- Red teaming untuk validasi keamanan AI

---

## 3. Lanjutkan Perjalanan Pembelajaran Anda

### Langkah Selanjutnya yang Direkomendasikan

| Jalur | Sumber Daya | Waktu |
|:---|:---|:---|
| **Kursus Lengkap** | [Kurikulum AZD untuk Pemula](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Mandiri |
| **Coba Template Lain** | [Template Microsoft Foundry](https://ai.azure.com/templates) | 1-2 jam |
| **Pendalaman** | [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Berkelanjutan |
| **Komunitas** | [Azure Discord](https://aka.ms/foundry/discord) | Bergabung sekarang! |

### Template yang Disarankan untuk Dicoba Selanjutnya

1. **[Mulai dengan Chat AI](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Chat dasar dengan data Anda
2. **[Demo Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Pola RAG lanjutan
3. **[Chat Contoso](https://github.com/Azure-Samples/contoso-chat)** - Skenario ritel enterprise

---

## 4. Tantangan Workshop

Siap menguji keterampilan Anda? Coba tantangan berikut:

| Tantangan | Deskripsi | Kesulitan |
|:---|:---|:---|
| **1. Skenario Multi-Agen** | Deploy dan sesuaikan untuk industri berbeda (misal: kesehatan, keuangan) | ⭐⭐ |
| **2. Basis Pengetahuan Kustom** | Tambahkan file data Anda sendiri dan buat indeks pencarian kustom | ⭐⭐⭐ |
| **3. Deployment Produksi** | Siapkan CI/CD dengan GitHub Actions menggunakan `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Bagikan Masukan Anda

Masukan Anda membantu kami meningkatkan lokakarya ini!

- **GitHub Issues**: [Berikan masukan](https://github.com/microsoft/azd-for-beginners/issues) - beri tag dengan `Workshop`
- **Discord**: Bergabung di [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - posting di `#get-help`
- **Kontribusi**: Bantu tingkatkan lokakarya dengan mengirim pull request!

---

## Terima Kasih! 🎉

Terima kasih telah menyelesaikan Lokakarya AZD untuk Pengembang AI. Kami berharap pengalaman ini telah membekali Anda dengan keterampilan dan kepercayaan diri untuk membangun dan mendeploy aplikasi AI di Azure.

**Teruslah membangun, teruslah belajar, dan selamat datang di komunitas pengembang Azure AI!**

---

| | |
|:---|:---|
| **📚 Beranda Kursus** | [AZD Untuk Pemula](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentasi** | [Dokumentasi Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Template AI** | [Template Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Komunitas** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->