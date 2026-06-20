# Chapter 1: Asas & Permulaan Pantas

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 30-45 minit | **⭐ Kerumitan**: Pemula

---

## Gambaran Keseluruhan

Bab ini memperkenalkan asas Azure Developer CLI (azd). Anda akan mempelajari konsep teras, memasang alat, dan melancarkan aplikasi pertama anda ke Azure.

> Disahkan menggunakan `azd 1.25.6` pada Jun 2026.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana ia berbeza daripada Azure CLI
- Memasang dan mengkonfigurasi AZD pada platform anda
- Melancarkan aplikasi pertama anda ke Azure dengan `azd up`
- Membersihkan sumber dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Asas AZD](azd-basics.md) | Konsep teras, istilah, dan struktur projek | 15 min |
| 2 | [Pemasangan & Persediaan](installation.md) | Panduan pemasangan khusus platform | 10 min |
| 3 | [Projek Pertama Anda](first-project.md) | Praktikal: Melancarkan aplikasi web ke Azure | 20 min |
| 4 | [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md) | Tambah azd ke projek sedia ada yang anda miliki | 15 min |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Persekitaran azd boleh ulangan dengan kontena dev | 15 min |

---

## ✅ Mula Di Sini: Sahkan Persediaan Anda

Sebelum anda mula, sahkan mesin tempatan anda sedia untuk templat Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika skrip melaporkan alat yang hilang, perbaiki dahulu dan kemudian sambung dengan bab ini.

---

## 🚀 Permulaan Pantas

```bash
# Semak pemasangan
azd version

# Sahkan untuk AZD
# Pilihan: az login jika anda merancang untuk menjalankan arahan Azure CLI secara langsung
azd auth login

# Lancarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up

# Bersihkan apabila selesai
azd down --force --purge
```

---

## ✅ Kriteria Kejayaan

Selepas menyelesaikan bab ini, anda harus boleh:

```bash
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                   # Menyebarkan ke Azure
azd show                 # Memaparkan URL aplikasi yang sedang berjalan
azd down --force --purge # Membersihkan sumber
```

---

## 🔗 Navigasi

| Arah | Bab |
|-------|------|
| **Seterusnya** | [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/README.md) |
| **Langkau ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Berkaitan

- [Lembaran Panjang Perintah](../../resources/cheat-sheet.md)
- [Soalan Lazim](../../resources/faq.md)
- [Glosari](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->