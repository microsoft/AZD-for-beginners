# Bab 1: Asas & Permulaan Pantas

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 75-120 minit termasuk pelancaran pertama; latihan tambahan mengambil masa lebih lama | **⭐ Kesukaran**: Pemula

---

## Gambaran Keseluruhan

Bab ini memperkenalkan asas Azure Developer CLI (azd). Anda akan mempelajari konsep teras, memasang alat, dan melancarkan aplikasi pertama anda ke Azure.

> Sasaran semakan arahan dan konfigurasi: `azd 1.37.2` (November 2026). Penyediaan Azure secara langsung tidak dijalankan semasa semakan.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Memahami apa itu Azure Developer CLI dan bagaimana ia berbeza daripada Azure CLI
- Memasang dan mengkonfigurasi AZD pada platform anda
- Melancarkan aplikasi pertama anda ke Azure dengan `azd up`
- Membersihkan sumber dengan `azd down`

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Asas AZD](azd-basics.md) | Konsep utama, istilah, dan struktur projek | 15 min |
| 2 | [Pemasangan & Persediaan](installation.md) | Panduan pemasangan khusus platform | 10 min |
| 3 | [Projek Pertama Anda](first-project.md) | Praktikal: Lancarkan aplikasi web ke Azure | 20 min |
| 4 | [Bawa Aplikasi Anda Sendiri](bring-your-own-app.md) | Tambah azd ke projek sedia ada yang anda miliki | 15 min |
| 5 | [Kontena Dev & Codespaces](dev-containers.md) | Persekitaran azd boleh ulang dengan kontena dev | 15 min |

---

## ✅ Mula Di Sini: Sahkan Persediaan Anda

Sebelum bermula, sahkan bahawa mesin tempatan anda sedia untuk templat Bab 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jika skrip melaporkan alat yang hilang, baiki dulu dan kemudian teruskan dengan bab ini.

---

## 🚀 Permulaan Pantas

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

## ✅ Kriteria Kejayaan

Selepas menyelesaikan bab ini, anda sepatutnya dapat:

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
| **Seterusnya** | [Bab 2: Pembangunan AI-Pertama](../chapter-02-ai-development/README.md) |
| **Langkau ke** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |

---

## 📖 Sumber Berkaitan

- [Lembaran Cheat Arahan](../../resources/cheat-sheet.md)
- [Soalan Lazim](../../resources/faq.md)
- [Glosari](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->