# Bab 3: Konfigurasi & Pengesahan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 45-60 minit | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini merangkumi konfigurasi persekitaran, corak pengesahan, dan amalan terbaik keselamatan untuk penyebaran Azure Developer CLI.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Menguasai hirarki konfigurasi AZD
- Mengurus pelbagai persekitaran (dev, staging, prod)
- Melaksanakan pengesahan yang selamat dengan identiti terurus
- Mengkonfigurasi tetapan khusus persekitaran

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Panduan Konfigurasi](configuration.md) | Persediaan dan pengurusan persekitaran | 30 minit |
| 2 | [Pengesahan & Keselamatan](authsecurity.md) | Corak identiti terurus dan RBAC | 30 minit |

---

## 🚀 Mula Pantas

```bash
# Cipta pelbagai persekitaran
azd env new dev
azd env new staging
azd env new prod

# Tukar persekitaran
azd env select prod

# Tetapkan pembolehubah persekitaran
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Lihat konfigurasi
azd env get-values
```

---

## 🔧 Hirarki Konfigurasi

AZD menerapkan tetapan dalam susunan ini (yang kemudiannya menggantikan yang terdahulu):

1. **Nilai lalai** (terbina dalam templat)
2. **azure.yaml** (konfigurasi projek)
3. **Pembolehubah persekitaran** (`azd env set`)
4. **Bendera baris arahan** (`--location eastus`)

---

## 🔐 Amalan Terbaik Keselamatan

```bash
# Gunakan identiti terurus (disyorkan)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Periksa status pengesahan
azd auth whoami
az account show

# Sahkan semula jika perlu
azd auth login
az login
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 2: Pembangunan AI](../chapter-02-ai-development/README.md) |
| **Seterusnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Sumber Berkaitan

- [Semakan Pra-Penyebaran](../chapter-06-pre-deployment/README.md)
- [Penyelesaian Masalah](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha sedaya upaya untuk memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidakakuratan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber rujukan yang muktamad. Bagi maklumat penting, penterjemahan profesional oleh penterjemah manusia adalah disarankan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->