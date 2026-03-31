# Chapter 7: Penyelesaian Masalah & Pengimbasan Ralat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-1.5 jam | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini membantu anda mendiagnosa dan menyelesaikan masalah biasa semasa bekerja dengan Azure Developer CLI. Dari kegagalan penyebaran hingga masalah khusus AI.

> Disahkan menggunakan `azd 1.23.12` pada Mac 2026.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Mendiagnosa kegagalan penyebaran AZD yang biasa
- Mengimbas ralat pengesahan dan isu kebenaran
- Menyelesaikan masalah sambungan perkhidmatan AI
- Menggunakan Azure Portal dan CLI untuk penyelesaian masalah

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Isu Biasa](common-issues.md) | Masalah yang sering dihadapi | 30 min |
| 2 | [Panduan Pengimbasan Ralat](debugging.md) | Strategi pengimbasan secara langkah demi langkah | 45 min |
| 3 | [Penyelesaian Masalah AI](ai-troubleshooting.md) | Isu khusus AI | 30 min |

---

## 🚨 Pembetulan Pantas

### Isu Pengesahan
```bash
# Diperlukan untuk aliran kerja AZD
azd auth login

# Opsional jika anda juga menggunakan arahan Azure CLI secara langsung
az login

azd auth status
```

### Kegagalan Penyediaan
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflik Sumber
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kuota Melebihi Had
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Rujukan Kod Ralat

| Ralat | Punca | Penyelesaian |
|-------|-------|--------------|
| `AuthenticationError` | Tidak log masuk | `azd auth login` |
| `ResourceNotFound` | Sumber hilang | Semak nama sumber |
| `QuotaExceeded` | Had langganan | Mohon peningkatan kuota |
| `InvalidTemplate` | Ralat sintaks Bicep | `az bicep build` |
| `Conflict` | Sumber wujud | Gunakan nama baru atau padam |
| `Forbidden` | Kebenaran tidak mencukupi | Semak peranan RBAC |

---

## 🔄 Reset dan Pemulihan

```bash
# Set semula lembut (simpan sumber, sebarkan semula kod)
azd deploy --force

# Set semula keras (padam semua, mula baru)
azd down --force --purge
azd up
```

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 6: Pra-Penyebaran](../chapter-06-pre-deployment/README.md) |
| **Seterusnya** | [Bab 8: Pengeluaran](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [Semakan Pra-Penyebaran](../chapter-06-pre-deployment/preflight-checks.md)
- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Isu AZD GitHub](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, adalah disarankan menggunakan terjemahan manusia profesional. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->