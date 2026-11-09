# Bab 3: Konfigurasi & Autentikasi

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 90-150 menit termasuk praktik integrasi | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membahas konfigurasi lingkungan, pola autentikasi, dan praktik keamanan terbaik untuk deployment Azure Developer CLI.

> Target tinjauan perintah dan konfigurasi: `azd 1.37.2` (November 2026). Penyediaan Azure langsung tidak dijalankan selama tinjauan.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menguasai hierarki konfigurasi AZD
- Mengelola banyak lingkungan (dev, staging, prod)
- Menerapkan autentikasi aman dengan managed identities
- Mengonfigurasi pengaturan spesifik lingkungan

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Panduan Konfigurasi](configuration.md) | Pengaturan dan manajemen lingkungan | 30 menit |
| 2 | [Autentikasi & Keamanan](authsecurity.md) | Pola managed identity dan RBAC | 30 menit |

---

## 🚀 Memulai Cepat

Jalankan dari root aplikasi **azd yang sudah diinisialisasi**, bukan dari repositori kursus. Gunakan nama lingkungan yang belum terpakai jika nama tersebut sudah ada.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` bersifat ilustratif: hanya memengaruhi infrastruktur jika template Anda secara eksplisit menggunakannya. Nilai `azd env set` biasa disimpan secara lokal dalam bentuk teks biasa; mereka bukan penyimpanan rahasia yang aman.

---

## 🔧 Hierarki Konfigurasi

Jaga tiga permukaan konfigurasi yang berbeda tetap terpisah: preferensi global (`azd config`), struktur proyek (`azure.yaml`), dan nilai per lingkungan (`azd env`). Flag hanya menimpa pengaturan yang benar-benar didukung; tidak ada overlay universal dari variabel lingkungan sewenang-wenang ke `azure.yaml` atau Bicep.

---

## 🔐 Praktik Keamanan Terbaik

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
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
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->