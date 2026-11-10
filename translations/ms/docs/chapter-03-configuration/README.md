# Bab 3: Konfigurasi & Pengesahan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 90-150 minit termasuk amalan integrasi | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini merangkumi konfigurasi persekitaran, corak pengesahan, dan amalan keselamatan terbaik untuk penyebaran Azure Developer CLI.

> Sasaran semakan arahan dan konfigurasi: `azd 1.37.2` (November 2026). Penyediaan Azure langsung tidak dijalankan semasa semakan.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Menguasai hierarki konfigurasi AZD
- Mengurus beberapa persekitaran (dev, staging, prod)
- Melaksanakan pengesahan selamat dengan identiti terurus
- Mengkonfigurasi tetapan khusus persekitaran

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|----------|------------|------|
| 1 | [Panduan Konfigurasi](configuration.md) | Penyediaan dan pengurusan persekitaran | 30 minit |
| 2 | [Pengesahan & Keselamatan](authsecurity.md) | Corak identiti terurus dan RBAC | 30 minit |

---

## 🚀 Mula Cepat

Jalankan dari akar aplikasi **azd yang sudah diinisialisasi**, bukan repositori kursus. Gunakan nama persekitaran yang belum digunakan jika ini sudah wujud.

```bash
# Create multiple environments
azd env new dev
azd env new staging
azd env new prod

# Switch environments
azd env select prod

# Set environment variables
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# View configuration
azd env get-values
```

`SKU_NAME` adalah ilustrasi: ia hanya menjejaskan infrastruktur jika templat anda secara eksplisit menggunakannya. Nilai `azd env set` biasa disimpan secara tempatan dalam teks tulen; ia bukan simpanan rahsia yang selamat.

---

## 🔧 Hierarki Konfigurasi

Kekalkan tiga permukaan konfigurasi yang berbeza berasingan: keutamaan global (`azd config`), struktur projek (`azure.yaml`), dan nilai per persekitaran (`azd env`). Bendera hanya menggantikan tetapan yang mereka sokong; tidak ada lapisan sejagat pembolehubah persekitaran sewenang-wenangnya ke atas `azure.yaml` atau Bicep.

---

## 🔐 Amalan Terbaik Keselamatan

```bash
# Runtime managed identity must be enabled in infrastructure and granted RBAC.
# To authenticate azd itself on an Azure host with an assigned identity:
# azd auth login --managed-identity

# Check AZD authentication status
azd auth login --check-status

# Optional: verify Azure CLI context if you plan to run az commands
az account show

# Re-authenticate if needed
azd auth login

# Optional: refresh Azure CLI authentication for az commands
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

- [Pemeriksaan Pra-Penyebaran](../chapter-06-pre-deployment/README.md)
- [Penyelesaian Masalah](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->