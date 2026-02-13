# Bab 1: Dasar & Memulai Cepat

**📚 Kursus**: [AZD untuk Pemula](../../README.md) | **⏱️ Durasi**: 30-45 menit | **⭐ Kompleksitas**: Pemula

---

## Ikhtisar

Bab ini memperkenalkan dasar-dasar Azure Developer CLI (azd). Anda akan mempelajari konsep inti, menginstal alat, dan menerapkan aplikasi pertama Anda ke Azure.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana perbedaannya dengan Azure CLI
- Menginstal dan mengonfigurasi AZD pada platform Anda
- Menerapkan aplikasi pertama Anda ke Azure dengan `azd up`
- Membersihkan sumber daya dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Dasar AZD](azd-basics.md) | Konsep inti, terminologi, dan struktur proyek | 15 menit |
| 2 | [Instalasi & Pengaturan](installation.md) | Panduan instalasi spesifik platform | 10 menit |
| 3 | [Proyek Pertama Anda](first-project.md) | Praktik: Menerapkan aplikasi web ke Azure | 20 menit |

---

## 🚀 Memulai Cepat

```bash
# Periksa instalasi
azd version

# Masuk ke Azure
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
| **Berikutnya** | [Bab 2: Pengembangan Berbasis AI](../chapter-02-ai-development/README.md) |
| **Lewati ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Terkait

- [Ringkasan Perintah](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glosarium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diingat bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->