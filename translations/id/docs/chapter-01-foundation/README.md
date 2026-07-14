# Bab 1: Dasar & Memulai Cepat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 30-45 menit | **⭐ Kompleksitas**: Pemula

---

## Ikhtisar

Bab ini memperkenalkan dasar-dasar Azure Developer CLI (azd). Anda akan mempelajari konsep inti, menginstal alat, dan menerapkan aplikasi pertama Anda ke Azure.

> Diverifikasi dengan `azd 1.27.1` pada Juli 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana perbedaannya dengan Azure CLI
- Menginstal dan mengonfigurasi AZD di platform Anda
- Menerapkan aplikasi pertama Anda ke Azure dengan `azd up`
- Membersihkan sumber daya dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|----------|-----------|-------|
| 1 | [Dasar AZD](azd-basics.md) | Konsep inti, terminologi, dan struktur proyek | 15 mnt |
| 2 | [Instalasi & Pengaturan](installation.md) | Panduan instalasi spesifik platform | 10 mnt |
| 3 | [Proyek Pertama Anda](first-project.md) | Praktik langsung: Terapkan aplikasi web ke Azure | 20 mnt |
| 4 | [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md) | Tambahkan azd ke proyek yang sudah ada | 15 mnt |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Lingkungan azd yang dapat direproduksi dengan dev containers | 15 mnt |

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

Jika skrip melaporkan alat yang hilang, perbaiki terlebih dahulu lalu lanjutkan dengan bab ini.

---

## 🚀 Memulai Cepat

```bash
# Periksa instalasi
azd version

# Otentikasi untuk AZD
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

Setelah menyelesaikan bab ini, Anda harus dapat:

```bash
azd version              # Menampilkan versi yang terpasang
azd init --template todo-nodejs-mongo  # Menginisialisasi proyek
azd up                   # Mendeploy ke Azure
azd show                 # Menampilkan URL aplikasi yang berjalan
azd down --force --purge # Membersihkan sumber daya
```

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Berikutnya** | [Bab 2: Pengembangan AI-Pertama](../chapter-02-ai-development/README.md) |
| **Lewati ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Terkait

- [Lembar Cheat Perintah](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glosarium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->