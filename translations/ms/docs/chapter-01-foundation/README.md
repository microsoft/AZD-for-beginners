# Bab 1: Asas & Mula Pantas

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 30-45 minit | **⭐ Kerumitan**: Pemula

---

## Gambaran Keseluruhan

Bab ini memperkenalkan asas Azure Developer CLI (azd). Anda akan belajar konsep utama, memasang alat, dan menghantar aplikasi pertama anda ke Azure.

> Disahkan dengan `azd 1.27.1` pada Julai 2026.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana ia berbeza dari Azure CLI
- Memasang dan mengkonfigurasi AZD pada platform anda
- Menghantar aplikasi pertama anda ke Azure dengan `azd up`
- Membersihkan sumber dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Asas AZD](azd-basics.md) | Konsep teras, terminologi, dan struktur projek | 15 minit |
| 2 | [Pemasangan & Persediaan](installation.md) | Panduan pemasangan spesifik platform | 10 minit |
| 3 | [Projek Pertama Anda](first-project.md) | Latihan praktikal: Hantar aplikasi web ke Azure | 20 minit |
| 4 | [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md) | Tambah azd ke projek sedia ada anda | 15 minit |
| 5 | [Kontena Pembangun & Codespaces](dev-containers.md) | Persekitaran azd yang boleh diulang dengan kontena pembangun | 15 minit |

---

## ✅ Mulakan Di Sini: Sahkan Persediaan Anda

Sebelum memulakan, pastikan mesin tempatan anda sudah siap untuk templat Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika skrip melaporkan alat yang hilang, betulkan dahulu sebelum meneruskan bab ini.

---

## 🚀 Mula Pantas

```bash
# Semak pemasangan
azd version

# Sahkan untuk AZD
# Pilihan: az login jika anda merancang untuk menjalankan perintah Azure CLI secara langsung
azd auth login

# Lancarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up

# Bersihkan apabila selesai
azd down --force --purge
```

---

## ✅ Kriteria Kejayaan

Selepas menamatkan bab ini, anda harus boleh:

```bash
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                   # Melaksanakan ke Azure
azd show                 # Memaparkan URL aplikasi yang berjalan
azd down --force --purge # Membersihkan sumber
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Seterusnya** | [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/README.md) |
| **Langkau ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Berkaitan

- [Lembaran Singkatan Perintah](../../resources/cheat-sheet.md)
- [Soalan Lazim](../../resources/faq.md)
- [Glosari](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->