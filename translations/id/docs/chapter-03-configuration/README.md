# Bab 3: Konfigurasi & Otentikasi

**📚 Course**: [AZD Untuk Pemula](../../README.md) | **⏱️ Duration**: 45-60 menit | **⭐ Complexity**: Menengah

---

## Ikhtisar

Bab ini membahas konfigurasi lingkungan, pola otentikasi, dan praktik terbaik keamanan untuk penyebaran Azure Developer CLI.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menguasai hierarki konfigurasi AZD
- Mengelola beberapa lingkungan (dev, staging, prod)
- Menerapkan autentikasi aman dengan identitas terkelola
- Mengonfigurasi pengaturan spesifik lingkungan

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Panduan Konfigurasi](configuration.md) | Penyiapan dan manajemen lingkungan | 30 menit |
| 2 | [Otentikasi & Keamanan](authsecurity.md) | Pola identitas terkelola dan RBAC | 30 menit |

---

## 🚀 Mulai Cepat

```bash
# Buat beberapa lingkungan
azd env new dev
azd env new staging
azd env new prod

# Beralih antar lingkungan
azd env select prod

# Atur variabel lingkungan
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Lihat konfigurasi
azd env get-values
```

---

## 🔧 Hierarki Konfigurasi

AZD menerapkan pengaturan dalam urutan ini (yang belakangan menimpa yang sebelumnya):

1. **Nilai default** (tertanam dalam template)
2. **azure.yaml** (konfigurasi proyek)
3. **Variabel lingkungan** (`azd env set`)
4. **Flag baris perintah** (`--location eastus`)

---

## 🔐 Praktik Terbaik Keamanan

```bash
# Gunakan identitas terkelola (direkomendasikan)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Periksa status otentikasi
azd auth whoami
az account show

# Lakukan otentikasi ulang jika diperlukan
azd auth login
az login
```

---

## 🔗 Navigasi

| Direction | Chapter |
|-----------|---------|
| **Sebelumnya** | [Bab 2: Pengembangan AI](../chapter-02-ai-development/README.md) |
| **Berikutnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Sumber Terkait

- [Pemeriksaan Pra-penyebaran](../chapter-06-pre-deployment/README.md)
- [Pemecahan Masalah](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat penting atau kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->