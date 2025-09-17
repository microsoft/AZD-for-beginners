<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T22:02:03+00:00",
  "source_file": "workshop/README.md",
  "language_code": "id"
}
-->
# Lokakarya AZD untuk Pengembang AI

**Sebelumnya:** [Panduan Pemecahan Masalah AI](../docs/troubleshooting/ai-troubleshooting.md) | **Selanjutnya:** [Modul Lab Lokakarya](../../../workshop)

Selamat datang di lokakarya praktis untuk mempelajari Azure Developer CLI (AZD) dengan fokus pada penerapan aplikasi AI. Lokakarya ini dirancang untuk membawa Anda dari dasar-dasar AZD hingga penerapan solusi AI yang siap produksi.

## Gambaran Lokakarya

**Durasi:** 2-3 jam  
**Tingkat:** Pemula hingga Menengah  
**Prasyarat:** Pengetahuan dasar tentang Azure, alat baris perintah, dan konsep AI

### Apa yang Akan Anda Pelajari

- **Dasar-dasar AZD**: Memahami Infrastruktur sebagai Kode dengan AZD
- 🤖 **Integrasi Layanan AI**: Menerapkan Azure OpenAI, AI Search, dan layanan AI lainnya
- **Penerapan Kontainer**: Menggunakan Azure Container Apps untuk aplikasi AI
- **Praktik Keamanan Terbaik**: Mengimplementasikan Managed Identity dan konfigurasi yang aman
- **Pemantauan & Observabilitas**: Menyiapkan Application Insights untuk beban kerja AI
- **Pola Produksi**: Strategi penerapan yang siap untuk perusahaan

## Struktur Lokakarya

### Modul 1: Dasar-dasar AZD (30 menit)
- Menginstal dan mengonfigurasi AZD
- Memahami struktur proyek AZD
- Penerapan AZD pertama Anda
- **Lab**: Menerapkan aplikasi web sederhana

### Modul 2: Integrasi Azure OpenAI (45 menit)
- Menyiapkan sumber daya Azure OpenAI
- Strategi penerapan model
- Mengonfigurasi akses API dan autentikasi
- **Lab**: Menerapkan aplikasi chat dengan GPT-4

### Modul 3: Aplikasi RAG (45 menit)
- Integrasi Azure AI Search
- Pemrosesan dokumen dengan Azure Document Intelligence
- Embedding vektor dan pencarian semantik
- **Lab**: Membangun sistem tanya jawab dokumen

### Modul 4: Penerapan Produksi (30 menit)
- Konfigurasi Container Apps
- Skalabilitas dan optimasi kinerja
- Pemantauan dan pencatatan
- **Lab**: Menerapkan ke produksi dengan observabilitas

### Modul 5: Pola Lanjutan (15 menit)
- Penerapan multi-lingkungan
- Integrasi CI/CD
- Strategi optimasi biaya
- **Penutup**: Daftar periksa kesiapan produksi

## Prasyarat

### Alat yang Diperlukan

Harap instal alat-alat berikut sebelum lokakarya:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Pengaturan Akun Azure

1. **Langganan Azure**: [Daftar gratis](https://azure.microsoft.com/free/)
2. **Akses Azure OpenAI**: [Ajukan akses](https://aka.ms/oai/access)
3. **Izin yang Diperlukan**:
   - Peran Kontributor pada langganan atau grup sumber daya
   - Administrator Akses Pengguna (untuk penugasan RBAC)

### Verifikasi Prasyarat

Jalankan skrip ini untuk memverifikasi pengaturan Anda:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Materi Lokakarya

### Latihan Lab

Setiap modul mencakup lab praktis dengan kode awal dan instruksi langkah demi langkah:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Penerapan AZD pertama Anda
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Aplikasi chat dengan Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Aplikasi RAG dengan AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Pola penerapan produksi
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Skenario penerapan lanjutan

### Materi Referensi

- **[Panduan Integrasi AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Pola integrasi yang komprehensif
- **[Panduan Penerapan Model AI](../docs/ai-foundry/ai-model-deployment.md)** - Praktik terbaik penerapan model
- **[Praktik AI Produksi](../docs/ai-foundry/production-ai-practices.md)** - Pola penerapan perusahaan
- **[Panduan Pemecahan Masalah AI](../docs/troubleshooting/ai-troubleshooting.md)** - Masalah umum dan solusinya

### Template Contoh

Template mulai cepat untuk skenario AI umum:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Memulai

### Opsi 1: GitHub Codespaces (Direkomendasikan)

Cara tercepat untuk memulai lokakarya:

[![Buka di GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Opsi 2: Pengembangan Lokal

1. **Clone repositori lokakarya:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Login ke Azure:**
```bash
az login
azd auth login
```

3. **Mulai dengan Lab 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Opsi 3: Lokakarya yang Dipandu Instruktur

Jika Anda mengikuti sesi yang dipandu instruktur:

- 🎥 **Rekaman Lokakarya**: [Tersedia sesuai permintaan](https://aka.ms/azd-ai-workshop)
- 💬 **Komunitas Discord**: [Bergabung untuk dukungan langsung](https://aka.ms/foundry/discord)
- **Umpan Balik Lokakarya**: [Bagikan pengalaman Anda](https://aka.ms/azd-workshop-feedback)

## Garis Waktu Lokakarya

### Pembelajaran Mandiri (3 jam)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Sesi yang Dipandu Instruktur (2.5 jam)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Kriteria Keberhasilan

Pada akhir lokakarya ini, Anda akan dapat:

✅ **Menerapkan aplikasi AI** menggunakan template AZD  
✅ **Mengonfigurasi Azure OpenAI** dengan keamanan yang tepat  
✅ **Membangun aplikasi RAG** dengan integrasi Azure AI Search  
✅ **Mengimplementasikan pola produksi** untuk beban kerja AI perusahaan  
✅ **Memantau dan memecahkan masalah** penerapan aplikasi AI  
✅ **Menerapkan strategi optimasi biaya** untuk beban kerja AI  

## Komunitas & Dukungan

### Selama Lokakarya

- 🙋 **Pertanyaan**: Gunakan chat lokakarya atau angkat tangan
- 🐛 **Masalah**: Periksa [panduan pemecahan masalah](../docs/troubleshooting/ai-troubleshooting.md)
- **Tips**: Bagikan temuan dengan peserta lainnya

### Setelah Lokakarya

- 💬 **Discord**: [Komunitas Azure AI Foundry](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Laporkan masalah template](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Umpan Balik**: [Formulir evaluasi lokakarya](https://aka.ms/azd-workshop-feedback)

## Langkah Selanjutnya

### Lanjutkan Pembelajaran

1. **Skenario Lanjutan**: Jelajahi [penerapan multi-region](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **Integrasi CI/CD**: Siapkan [workflow GitHub Actions](../docs/deployment/github-actions.md)
3. **Template Kustom**: Buat [template AZD Anda sendiri](../docs/getting-started/custom-templates.md)

### Terapkan dalam Proyek Anda

1. **Penilaian**: Gunakan [daftar periksa kesiapan](./production-readiness-checklist.md)
2. **Template**: Mulai dengan [template khusus AI](../../../workshop/templates)
3. **Dukungan**: Bergabung dengan [Discord Azure AI Foundry](https://aka.ms/foundry/discord)

### Bagikan Kesuksesan Anda

- ⭐ **Beri bintang repositori** jika lokakarya ini membantu Anda
- 🐦 **Bagikan di media sosial** dengan #AzureDeveloperCLI #AzureAI
- 📝 **Tulis postingan blog** tentang perjalanan penerapan AI Anda

---

## Umpan Balik Lokakarya

Umpan balik Anda membantu kami meningkatkan pengalaman lokakarya:

| Aspek | Penilaian (1-5) | Komentar |
|-------|-----------------|----------|
| Kualitas Konten | ⭐⭐⭐⭐⭐ | |
| Lab Praktis | ⭐⭐⭐⭐⭐ | |
| Dokumentasi | ⭐⭐⭐⭐⭐ | |
| Tingkat Kesulitan | ⭐⭐⭐⭐⭐ | |
| Pengalaman Keseluruhan | ⭐⭐⭐⭐⭐ | |

**Kirim umpan balik**: [Formulir Evaluasi Lokakarya](https://aka.ms/azd-workshop-feedback)

---

**Sebelumnya:** [Panduan Pemecahan Masalah AI](../docs/troubleshooting/ai-troubleshooting.md) | **Selanjutnya:** Mulai dengan [Lab 1: Dasar-dasar AZD](../../../workshop/lab-1-azd-basics)

**Siap untuk mulai membangun aplikasi AI dengan AZD?**

[Mulai Lab 1: Dasar-dasar AZD →](./lab-1-azd-basics/README.md)

---

**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan layanan penerjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk memberikan hasil yang akurat, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan jasa penerjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.