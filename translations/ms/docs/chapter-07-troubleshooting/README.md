# Chapter 7: Penyelesaian Masalah & Pengesanan Ralat

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-1.5 jam | **⭐ Kompleksiti**: Sederhana

---

## Gambaran Keseluruhan

Bab ini membantu anda mendiagnosis dan menyelesaikan isu biasa apabila bekerja dengan Azure Developer CLI. Dari kegagalan penyebaran hingga masalah khusus AI.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Mendiagnosis kegagalan penyebaran AZD yang biasa
- Menyahpepijat isu pengesahan dan kebenaran
- Menyelesaikan masalah sambungan perkhidmatan AI
- Menggunakan Azure Portal dan CLI untuk penyelesaian masalah

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Isu Biasa](common-issues.md) | Masalah yang sering ditemui | 30 min |
| 2 | [Panduan Penyahpepijatan](debugging.md) | Strategi penyahpepijatan langkah demi langkah | 45 min |
| 3 | [Penyelesaian Masalah AI](ai-troubleshooting.md) | Isu khusus AI | 30 min |

---

## 🚨 Pembaikan Pantas

### Authentication Issues
```bash
azd auth login
az login
azd auth whoami
```

### Provisioning Failures
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Resource Conflicts
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Quota Exceeded
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Rujukan Kod Ralat

| Ralat | Punca | Penyelesaian |
|-------|-------|----------|
| `AuthenticationError` | Belum log masuk | `azd auth login` |
| `ResourceNotFound` | Sumber tidak ditemui | Periksa nama sumber |
| `QuotaExceeded` | Had langganan | Minta peningkatan kuota |
| `InvalidTemplate` | Ralat sintaks Bicep | `az bicep build` |
| `Conflict` | Sumber wujud | Gunakan nama baru atau padam |
| `Forbidden` | Kebenaran tidak mencukupi | Periksa peranan RBAC |

---

## 🔄 Set semula dan Pemulihan

```bash
# Tetapan semula lembut (kekalkan sumber, pasang semula kod)
azd deploy --force

# Tetapan semula keras (padamkan semuanya, mulakan semula dari awal)
azd down --force --purge
azd up
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 6: Pra-Penyebaran](../chapter-06-pre-deployment/README.md) |
| **Seterusnya** | [Bab 8: Pengeluaran](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [Pemeriksaan Pra-Penyebaran](../chapter-06-pre-deployment/preflight-checks.md)
- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Isu GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:

Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Walaupun kami berusaha memastikan ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber rujukan yang sah. Untuk maklumat yang kritikal, disyorkan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->