# Bab 1: Asas & Permulaan Pantas

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 30-45 minit | **⭐ Kerumitan**: Pemula

---

## Gambaran Keseluruhan

Bab ini memperkenalkan asas Azure Developer CLI (azd). Anda akan belajar konsep teras, memasang alat, dan melancarkan aplikasi pertama anda ke Azure.

> Disahkan dengan `azd 1.23.12` pada Mac 2026.

## Objektif Pembelajaran

Dengan melengkapkan bab ini, anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana ia berbeza daripada Azure CLI
- Memasang dan mengkonfigurasi AZD pada platform anda
- Melancarkan aplikasi pertama anda ke Azure dengan `azd up`
- Membersihkan sumber dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Asas AZD](azd-basics.md) | Konsep teras, terminologi, dan struktur projek | 15 min |
| 2 | [Pemasangan & Persediaan](installation.md) | Panduan pemasangan khusus platform | 10 min |
| 3 | [Projek Pertama Anda](first-project.md) | Amali: Lancarkan aplikasi web ke Azure | 20 min |

---

## ✅ Mula Di Sini: Sahkan Persediaan Anda

Sebelum anda mulakan, pastikan mesin tempatan anda sedia untuk templat Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika skrip melaporkan alat yang hilang, perbaiki dahulu dan kemudian teruskan dengan bab ini.

---

## 🚀 Permulaan Pantas

```bash
# Semak pemasangan
azd version

# Sahkan untuk AZD
# Pilihan: az login jika anda merancang untuk menjalankan arahan Azure CLI secara langsung
azd auth login

# Laksanakan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up

# Bersihkan selepas selesai
azd down --force --purge
```

---

## ✅ Kriteria Kejayaan

Selepas melengkapkan bab ini, anda harus dapat:

```bash
azd version              # Menunjukkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Memulakan projek
azd up                   # Melaksanakan ke Azure
azd show                 # Memaparkan URL aplikasi yang sedang berjalan
azd down --force --purge # Membersihkan sumber daya
```

---

## 🔗 Navigasi

| Arah | Bab |
|------|-----|
| **Seterusnya** | [Bab 2: Pembangunan AI-Utama](../chapter-02-ai-development/README.md) |
| **Langkau ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Berkaitan

- [Lembaran Cheat Perintah](../../resources/cheat-sheet.md)
- [Soalan Lazim](../../resources/faq.md)
- [Glosari](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->