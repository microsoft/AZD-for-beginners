# Bab 7: Pemecahan Masalah & Debugging

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1-1.5 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membantu Anda mendiagnosis dan menyelesaikan masalah umum saat bekerja dengan Azure Developer CLI. Mulai dari kegagalan penyebaran hingga masalah khusus AI.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Mendiagnosis kegagalan penyebaran AZD yang umum
- Debug masalah otentikasi dan izin
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

### Masalah Otentikasi
```bash
azd auth login
az login
azd auth whoami
```

### Kegagalan Penyediaan
```bash
azd show
azd monitor --logs
az deployment sub list --query "[?properties.provisioningState!='Succeeded']"
```

### Konflik Sumber Daya
```bash
azd down --force --purge
azd env new different-name
azd up
```

### Kuota Terlampaui
```bash
az vm list-usage --location eastus --output table
azd env set AZURE_LOCATION westus2
azd up
```

---

## 📋 Referensi Kode Kesalahan

| Kesalahan | Penyebab | Solusi |
|-------|-------|----------|
| `AuthenticationError` | Belum masuk | `azd auth login` |
| `ResourceNotFound` | Sumber daya hilang | Periksa nama sumber daya |
| `QuotaExceeded` | Batas langganan | Minta peningkatan kuota |
| `InvalidTemplate` | Kesalahan sintaks Bicep | `az bicep build` |
| `Conflict` | Sumber daya sudah ada | Gunakan nama baru atau hapus |
| `Forbidden` | Izin tidak cukup | Periksa peran RBAC |

---

## 🔄 Reset dan Pemulihan

```bash
# Reset lembut (pertahankan sumber daya, deploy ulang kode)
azd deploy --force

# Reset keras (hapus semuanya, mulai dari awal)
azd down --force --purge
azd up
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 6: Pra-Penyebaran](../chapter-06-pre-deployment/README.md) |
| **Berikutnya** | [Bab 8: Produksi](../chapter-08-production/README.md) |

---

## 📖 Sumber Terkait

- [Pemeriksaan Pra-Penyebaran](../chapter-06-pre-deployment/preflight-checks.md)
- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Isu GitHub AZD](https://github.com/Azure/azure-dev/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai akurasi, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas segala kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->