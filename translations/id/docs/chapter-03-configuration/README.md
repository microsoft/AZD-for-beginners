# Bab 3: Konfigurasi & Otentikasi

**📚 Kursus**: [AZD untuk Pemula](../../README.md) | **⏱️ Durasi**: 45-60 menit | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membahas konfigurasi lingkungan, pola otentikasi, dan praktik terbaik keamanan untuk penyebaran Azure Developer CLI.

> Tervalidasi terhadap `azd 1.23.12` pada Maret 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menguasai hierarki konfigurasi AZD
- Mengelola beberapa lingkungan (dev, staging, prod)
- Menerapkan otentikasi aman dengan identitas terkelola
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

# Beralih lingkungan
azd env select prod

# Atur variabel lingkungan
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Lihat konfigurasi
azd env get-values
```

---

## 🔧 Hierarki Konfigurasi

AZD menerapkan pengaturan dalam urutan ini (yang kemudian menggantikan yang sebelumnya):

1. **Nilai default** (tertanam dalam template)
2. **azure.yaml** (konfigurasi proyek)
3. **Variabel lingkungan** (`azd env set`)
4. **Flag baris perintah** (`--location eastus`)

---

## 🔐 Praktik Terbaik Keamanan

```bash
# Gunakan identitas terkelola (disarankan)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Periksa status autentikasi AZD
azd auth status

# Opsional: verifikasi konteks Azure CLI jika Anda berencana menjalankan perintah az
az account show

# Autentikasi ulang jika diperlukan
azd auth login

# Opsional: segarkan autentikasi Azure CLI untuk perintah az
az login
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 2: Pengembangan AI](../chapter-02-ai-development/README.md) |
| **Berikutnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Sumber Terkait

- [Pemeriksaan Pra-Penyebaran](../chapter-06-pre-deployment/README.md)
- [Pemecahan Masalah](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berusaha untuk akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->