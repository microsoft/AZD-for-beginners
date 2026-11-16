# Bab 1: Dasar & Mulai Cepat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 75-120 menit termasuk deployment pertama; latihan tambahan memakan waktu lebih lama | **⭐ Kompleksitas**: Pemula

---

## Ikhtisar

Bab ini memperkenalkan dasar-dasar Azure Developer CLI (azd). Anda akan mempelajari konsep inti, memasang alat, dan melakukan deployment aplikasi pertama Anda ke Azure.

> Tinjauan perintah dan konfigurasi target: `azd 1.37.2` (November 2026). Penyediaan Azure langsung tidak dijalankan selama tinjauan.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana perbedaannya dengan Azure CLI
- Menginstal dan mengkonfigurasi AZD di platform Anda
- Melakukan deployment aplikasi pertama Anda ke Azure dengan `azd up`
- Membersihkan sumber daya dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Dasar AZD](azd-basics.md) | Konsep inti, terminologi, dan struktur proyek | 15 menit |
| 2 | [Instalasi & Pengaturan](installation.md) | Panduan instalasi spesifik platform | 10 menit |
| 3 | [Proyek Pertama Anda](first-project.md) | Praktik langsung: Deploy aplikasi web ke Azure | 20 menit |
| 4 | [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md) | Tambahkan azd ke proyek yang sudah Anda miliki | 15 menit |
| 5 | [Kontainer Dev & Codespaces](dev-containers.md) | Lingkungan azd yang dapat direproduksi dengan dev containers | 15 menit |

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

Jika skrip melaporkan alat yang hilang, perbaiki terlebih dahulu dan kemudian lanjutkan dengan bab ini.

---

## 🚀 Mulai Cepat

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Kriteria Keberhasilan

Setelah menyelesaikan bab ini, Anda seharusnya dapat:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Selanjutnya** | [Bab 2: Pengembangan Berbasis AI](../chapter-02-ai-development/README.md) |
| **Lewati ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Daya Terkait

- [Lembar Curang Perintah](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glosarium](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->