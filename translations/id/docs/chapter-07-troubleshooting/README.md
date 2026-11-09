# Bab 7: Pemecahan Masalah & Debugging

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1-1.5 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membantu Anda mendiagnosis dan menyelesaikan masalah umum saat bekerja dengan Azure Developer CLI. Dari kegagalan penerapan hingga masalah khusus AI.

> Panduan perintah telah ditinjau terhadap referensi `azd 1.37.2` yang dirilis. Penerapan cloud tidak dijalankan. Ganti nama dan ID sumber daya contoh sebelum menggunakan perintah.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Mendiagnosis kegagalan penerapan AZD yang umum
- Debug masalah autentikasi dan izin
- Menyelesaikan masalah konektivitas layanan AI
- Menggunakan Azure Portal dan CLI untuk pemecahan masalah

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Masalah Umum](common-issues.md) | Masalah yang sering ditemui | 30 menit |
| 2 | [Panduan Debugging](debugging.md) | Strategi debugging langkah demi langkah | 45 menit |
| 3 | [Pemecahan Masalah AI](ai-troubleshooting.md) | Masalah khusus AI | 30 menit |

---

## 🚨 Perbaikan Cepat

### Masalah Autentikasi
```bash
# Required for AZD workflows
azd auth login

# Optional if you are also using Azure CLI commands directly
az login

azd auth login --check-status
```

### Kegagalan Provisioning
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflik Sumber Daya
Periksa sumber daya yang ada dan kesalahan penerapan terlebih dahulu. Jangan hapus lingkungan bersama atau produksi untuk menyelesaikan konflik penamaan. Untuk **lingkungan sekali pakai baru**, gunakan nama unik:

```bash
azd env new different-name
azd up
```

### Kuota Terlampaui
```bash
az vm list-usage --location eastus --output table
# Check the affected service's own quotas, not just VM quotas.
# For a new environment only, choose a supported region with available quota.
```

Mengubah `AZURE_LOCATION` tidak memindahkan sumber daya yang ada dan dapat menyebabkan konflik lokasi saat penerapan ulang.

---

## 📋 Referensi Kode Error

| Error | Penyebab | Solusi |
|-------|-------|----------|
| `AuthenticationError` | Tidak masuk | `azd auth login` |
| `ResourceNotFound` | Sumber daya hilang | Periksa nama sumber daya |
| `QuotaExceeded` | Batas langganan | Minta peningkatan kuota |
| `InvalidTemplate` | Kesalahan sintaks Bicep | `az bicep build` |
| `Conflict` | Sumber daya sudah ada | Gunakan nama baru atau hapus |
| `Forbidden` | Izin tidak cukup | Periksa peran RBAC |

---

## 🔄 Reset dan Pemulihan

```bash
# Soft reset (keep resources, redeploy code)
azd deploy

# Hard reset (delete everything, start fresh)
azd down
azd up
```

Reset keras menghapus data dan dapat mengubah titik akhir. Cadangkan terlebih dahulu dan tinjau prompt penghapusan interaktif. `--force --purge` hanya sesuai untuk lingkungan sekali pakai ketika penghapusan yang tidak dapat dibatalkan dimaksudkan.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 6: Pra-Penerapan](../chapter-06-pre-deployment/README.md) |
| **Berikutnya** | [Bab 8: Produksi](../chapter-08-production/README.md) |

---

## 📖 Sumber Terkait

- [Pemeriksaan Pra-Penerapan](../chapter-06-pre-deployment/preflight-checks.md)
- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Masalah GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->