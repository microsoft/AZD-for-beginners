# Chapter 3: Konfigurasi & Pengesahan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 45-60 minit | **⭐ Tahap Kesukaran**: Sederhana

---

## Gambaran Keseluruhan

Bab ini merangkumi konfigurasi persekitaran, corak pengesahan, dan amalan terbaik keselamatan untuk penempatan Azure Developer CLI.

> Disahkan terhadap `azd 1.23.12` pada Mac 2026.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Menguasai hierarki konfigurasi AZD
- Menguruskan pelbagai persekitaran (dev, staging, prod)
- Melaksanakan pengesahan selamat dengan identiti terurus
- Mengkonfigurasi tetapan khusus persekitaran

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Panduan Konfigurasi](configuration.md) | Penetapan dan pengurusan persekitaran | 30 min |
| 2 | [Pengesahan & Keselamatan](authsecurity.md) | Corak identiti terurus dan RBAC | 30 min |

---

## 🚀 Mula Dengan Cepat

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

## 🔧 Hierarki Konfigurasi

AZD menggunakan tetapan dalam susunan ini (yang kemudian menggantikan yang sebelumnya):

1. **Nilai lalai** (terbina dalam templat)
2. **azure.yaml** (konfigurasi projek)
3. **Pembolehubah persekitaran** (`azd env set`)
4. **Bendera baris perintah** (`--location eastus`)

---

## 🔐 Amalan Terbaik Keselamatan

```bash
# Gunakan identiti terurus (disyorkan)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Semak status pengesahan AZD
azd auth status

# Pilihan: sahkan konteks Azure CLI jika anda bercadang untuk menjalankan arahan az
az account show

# Sahkan semula jika perlu
azd auth login

# Pilihan: segarkan pengesahan Azure CLI untuk arahan az
az login
```

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 2: Pembangunan AI](../chapter-02-ai-development/README.md) |
| **Seterusnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |

---

## 📖 Sumber Berkaitan

- [Pemeriksaan Pra-Penyelewengan](../chapter-06-pre-deployment/README.md)
- [Penyelesaian Masalah](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk memastikan ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau tafsiran yang salah yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->