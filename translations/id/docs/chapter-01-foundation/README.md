# Bab 1: Dasar & Mulai Cepat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 30-45 menit | **⭐ Kompleksitas**: Pemula

---

## Ikhtisar

Bab ini memperkenalkan dasar-dasar Azure Developer CLI (azd). Anda akan mempelajari konsep inti, menginstal alat, dan menerapkan aplikasi pertama Anda ke Azure.

> Divalidasi terhadap `azd 1.23.12` pada Maret 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana bedanya dengan Azure CLI
- Menginstal dan mengonfigurasi AZD di platform Anda
- Menerapkan aplikasi pertama Anda ke Azure dengan `azd up`
- Membersihkan sumber daya dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Dasar-dasar AZD](azd-basics.md) | Konsep inti, terminologi, dan struktur proyek | 15 min |
| 2 | [Instalasi & Pengaturan](installation.md) | Panduan instalasi spesifik platform | 10 min |
| 3 | [Proyek Pertama Anda](first-project.md) | Praktik: Menerapkan aplikasi web ke Azure | 20 min |

---

## ✅ Mulai di Sini: Validasi Pengaturan Anda

Sebelum memulai, pastikan mesin lokal Anda siap untuk template Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika skrip melaporkan alat yang hilang, perbaiki terlebih dahulu lalu lanjutkan dengan bab ini.

---

## 🚀 Mulai Cepat

```bash
# Periksa instalasi
azd version

# Autentikasi untuk AZD
# Opsional: az login jika Anda berencana menjalankan perintah Azure CLI secara langsung
azd auth login

# Terapkan aplikasi pertama Anda
azd init --template todo-nodejs-mongo
azd up

# Bersihkan setelah selesai
azd down --force --purge
```

---

## ✅ Kriteria Keberhasilan

Setelah menyelesaikan bab ini, Anda seharusnya dapat:

```bash
azd version              # Menampilkan versi yang terpasang
azd init --template todo-nodejs-mongo  # Menginisialisasi proyek
azd up                   # Menerapkan ke Azure
azd show                 # Menampilkan URL aplikasi yang sedang berjalan
azd down --force --purge # Membersihkan sumber daya
```

---

## 🔗 Navigasi

| Direction | Chapter |
|-----------|---------|
| **Next** | [Bab 2: Pengembangan Berbasis AI](../chapter-02-ai-development/README.md) |
| **Skip to** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Terkait

- [Ringkasan Perintah](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glosarium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->