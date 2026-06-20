# Bab 1: Dasar & Mulai Cepat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 30-45 menit | **⭐ Kompleksitas**: Pemula

---

## Gambaran Umum

Bab ini memperkenalkan dasar-dasar Azure Developer CLI (azd). Anda akan mempelajari konsep inti, menginstal alat, dan menyebarkan aplikasi pertama Anda ke Azure.

> Divalidasi terhadap `azd 1.25.6` pada Juni 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana bedanya dengan Azure CLI
- Menginstal dan mengonfigurasi AZD di platform Anda
- Menyebarkan aplikasi pertama Anda ke Azure dengan `azd up`
- Membersihkan sumber daya dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Dasar-dasar AZD](azd-basics.md) | Konsep inti, terminologi, dan struktur proyek | 15 min |
| 2 | [Instalasi & Pengaturan](installation.md) | Panduan instalasi khusus platform | 10 min |
| 3 | [Proyek Pertama Anda](first-project.md) | Praktik: Menyebarkan aplikasi web ke Azure | 20 min |
| 4 | [Bawa Aplikasi Anda](bring-your-own-app.md) | Tambahkan azd ke proyek yang sudah ada | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Lingkungan azd yang dapat direproduksi dengan dev containers | 15 min |

---

## ✅ Mulai Di Sini: Validasi Pengaturan Anda

Sebelum memulai, pastikan mesin lokal Anda siap untuk template Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika skrip melaporkan alat yang hilang, perbaiki terlebih dahulu lalu lanjutkan ke bab ini.

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

| Arah | Bab |
|-----------|---------|
| **Berikutnya** | [Bab 2: Pengembangan Berorientasi AI](../chapter-02-ai-development/README.md) |
| **Lewati ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Terkait

- [Ringkasan Perintah](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glosarium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->