# Chapter 6: Perancangan & Pengesahan Sebelum Pelaksanaan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1 jam | **⭐ Tahap Kesukaran**: Sederhana

---

## Gambaran Keseluruhan

Bab ini merangkumi langkah-langkah penting perancangan dan pengesahan sebelum melaksanakan aplikasi anda. Pelajari cara mengelakkan kesilapan mahal dengan perancangan kapasiti yang betul, pemilihan SKU, dan pemeriksaan awal.

> Disahkan dengan `azd 1.23.12` pada Mac 2026.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Melakukan pemeriksaan awal sebelum pelaksanaan
- Merancang kapasiti dan menganggarkan keperluan sumber
- Memilih SKU yang sesuai untuk pengoptimuman kos
- Mengkonfigurasi Application Insights untuk pemantauan
- Memahami corak penyelarasan pasukan

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Pemeriksaan Awal](preflight-checks.md) | Mengesahkan konfigurasi sebelum pelaksanaan | 15 min |
| 2 | [Perancangan Kapasiti](capacity-planning.md) | Menganggarkan keperluan sumber | 20 min |
| 3 | [Pemilihan SKU](sku-selection.md) | Memilih tier harga yang sesuai | 15 min |
| 4 | [Application Insights](application-insights.md) | Mengkonfigurasi pemantauan | 20 min |
| 5 | [Corak Penyelarasan](coordination-patterns.md) | Aliran kerja pelaksanaan pasukan | 15 min |

---

## 🚀 Mula Dengan Cepat

```bash
# Semak kuota langganan
az vm list-usage --location eastus --output table

# Pratonton penyebaran (tiada sumber dibuat)
azd provision --preview

# Sahkan sintaks Bicep
az bicep build --file infra/main.bicep

# Semak konfigurasi persekitaran
azd env get-values
```

---

## ☑️ Senarai Semak Sebelum Pelaksanaan

### Sebelum `azd provision`

- [ ] Kuota disahkan untuk rantau
- [ ] SKU dipilih dengan sesuai
- [ ] Anggaran kos disemak
- [ ] Konvensyen penamaan konsisten
- [ ] Keselamatan/RBAC dikonfigurasi

### Sebelum `azd deploy`

- [ ] Pembolehubah persekitaran ditetapkan
- [ ] Rahsia dalam Key Vault
- [ ] Rentetan sambungan disahkan
- [ ] Pemeriksaan kesihatan dikonfigurasi

---

## 💰 Panduan Pemilihan SKU

| Beban Kerja | Pembangunan | Pengeluaran |
|-------------|-------------|-------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Model Microsoft Foundry | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 5: Multi-Ejen](../chapter-05-multi-agent/README.md) |
| **Seterusnya** | [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Berkaitan

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Pelaksanaan](../chapter-04-infrastructure/deployment-guide.md)
- [Isu Umum](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidakakuratan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->