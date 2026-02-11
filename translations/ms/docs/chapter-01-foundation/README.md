# Bab 1: Asas & Mula Pantas

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 30-45 minit | **⭐ Tahap Kesukaran**: Pemula

---

## Gambaran Keseluruhan

Bab ini memperkenalkan asas Azure Developer CLI (azd). Anda akan mempelajari konsep teras, memasang alat, dan menyebarkan aplikasi pertama anda ke Azure.

## Objektif Pembelajaran

By completing this chapter, you will:
- Memahami apa itu Azure Developer CLI dan bagaimana ia berbeza daripada Azure CLI
- Memasang dan mengkonfigurasikan AZD pada platform anda
- Menyebarkan aplikasi pertama anda ke Azure dengan `azd up`
- Membersihkan sumber dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Asas AZD](azd-basics.md) | Konsep teras, terminologi, dan struktur projek | 15 minit |
| 2 | [Pemasangan & Persediaan](installation.md) | Panduan pemasangan khusus platform | 10 minit |
| 3 | [Projek Pertama Anda](first-project.md) | Amali: Menyebarkan aplikasi web ke Azure | 20 minit |

---

## 🚀 Mula Pantas

```bash
# Periksa pemasangan
azd version

# Log masuk ke Azure
azd auth login

# Sebarkan aplikasi pertama anda
azd init --template todo-nodejs-mongo
azd up

# Bersihkan apabila selesai
azd down --force --purge
```

---

## ✅ Kriteria Kejayaan

Selepas menyelesaikan bab ini, anda sepatutnya dapat:

```bash
azd version              # Memaparkan versi yang dipasang
azd init --template todo-nodejs-mongo  # Menginisialisasi projek
azd up                   # Menerapkan ke Azure
azd show                 # Memaparkan URL aplikasi yang sedang berjalan
azd down --force --purge # Membersihkan sumber daya
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Seterusnya** | [Bab 2: Pembangunan Berfokus AI](../chapter-02-ai-development/README.md) |
| **Langkau ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Berkaitan

- [Lembaran Rujukan Perintah](../../resources/cheat-sheet.md)
- [Soalan Lazim](../../resources/faq.md)
- [Glosari](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidakaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang muktamad. Untuk maklumat yang kritikal, terjemahan profesional oleh penterjemah manusia disarankan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->