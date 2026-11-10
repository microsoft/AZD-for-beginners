# Bab 7: Penyelesaian Masalah & Pengesan Ralat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-1.5 jam | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini membantu anda mendiagnosis dan menyelesaikan isu biasa ketika bekerja dengan Azure Developer CLI. Dari kegagalan penyebaran hingga masalah khusus AI.

> Panduan arahan disemak berdasarkan rujukan `azd 1.37.2` yang dikeluarkan. Penyebaran awan tidak dilaksanakan. Gantikan nama sumber dan ID contoh sebelum menggunakan arahan.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Mendiagnosis kegagalan penyebaran AZD yang biasa
- Mengesan ralat pengesahan dan kebenaran
- Menyelesaikan masalah sambungan perkhidmatan AI
- Menggunakan Azure Portal dan CLI untuk penyelesaian masalah

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Isu Biasa](common-issues.md) | Masalah yang sering ditemui | 30 min |
| 2 | [Panduan Pengesanan Ralat](debugging.md) | Strategi pengesanan ralat langkah demi langkah | 45 min |
| 3 | [Penyelesaian Masalah AI](ai-troubleshooting.md) | Isu khusus AI | 30 min |

---

## 🚨 Pembetulan Pantas

### Isu Pengesahan
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Kegagalan Penyediaan
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflik Sumber
Periksa terlebih dahulu sumber sedia ada dan ralat penyebaran. Jangan padam persekitaran yang dikongsi atau produksi untuk menyelesaikan konflik penamaan. Untuk **persekitaran buangan baru**, gunakan nama unik:

```bash
azd env new different-name
azd up
```

### Kuota Terlampau
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Menukar `AZURE_LOCATION` tidak memindahkan sumber sedia ada dan boleh menyebabkan konflik lokasi semasa penyebaran semula.

---

## 📋 Rujukan Kod Ralat

| Ralat | Sebab | Penyelesaian |
|-------|-------|----------|
| `AuthenticationError` | Tidak log masuk | `azd auth login` |
| `ResourceNotFound` | Sumber hilang | Semak nama sumber |
| `QuotaExceeded` | Had langganan | Mohon peningkatan kuota |
| `InvalidTemplate` | Ralat sintaks Bicep | `az bicep build` |
| `Conflict` | Sumber wujud | Gunakan nama baru atau padam |
| `Forbidden` | Kebenaran tidak mencukupi | Semak peranan RBAC |

---

## 🔄 Tetapan Semula dan Pemulihan

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Tetapan semula keras memadam data dan mungkin mengubah titik hujung. Sandarkan terlebih dahulu dan semak arahan interaktif pemadaman. `--force --purge` hanya sesuai untuk persekitaran buangan apabila pemadaman tidak boleh dipulihkan dimaksudkan.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 6: Pra-Penyebaran](../chapter-06-pre-deployment/README.md) |
| **Seterusnya** | [Bab 8: Produksi](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [Pemeriksaan Pra-Penyebaran](../chapter-06-pre-deployment/preflight-checks.md)
- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Isu GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->