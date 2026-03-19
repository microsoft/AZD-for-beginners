# Chapter 6: Perancangan & Pengesahan Pra-Penerapan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1 jam | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini merangkumi langkah-langkah penting untuk perancangan dan pengesahan sebelum menerapkan aplikasi anda. Belajar untuk mengelakkan kesilapan mahal dengan perancangan kapasiti yang tepat, pemilihan SKU, dan semakan pra-penerapan.

## Objektif Pembelajaran

Dengan menyiapkan bab ini, anda akan:
- Menjalankan semakan pra-penerapan sebelum penerapan
- Merancang kapasiti dan menganggarkan keperluan sumber
- Memilih SKU yang sesuai untuk pengoptimuman kos
- Mengkonfigurasi Application Insights untuk pemantauan
- Memahami corak koordinasi pasukan

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Semakan Pra-penerapan](preflight-checks.md) | Mengesahkan konfigurasi sebelum penerapan | 15 min |
| 2 | [Perancangan Kapasiti](capacity-planning.md) | Menganggarkan keperluan sumber | 20 min |
| 3 | [Pemilihan SKU](sku-selection.md) | Memilih tier harga yang sesuai | 15 min |
| 4 | [Application Insights](application-insights.md) | Mengkonfigurasi pemantauan | 20 min |
| 5 | [Corak Koordinasi](coordination-patterns.md) | Aliran kerja penerapan pasukan | 15 min |

---

## 🚀 Mula Pantas

```bash
# Semak kuota langganan
az vm list-usage --location eastus --output table

# Pratonton penyebaran (tiada sumber dicipta)
azd provision --preview

# Sahkan sintaks Bicep
az bicep build --file infra/main.bicep

# Semak konfigurasi persekitaran
azd env get-values
```

---

## ☑️ Senarai Semak Pra-Penerapan

### Sebelum `azd provision`

- [ ] Kuota disahkan untuk rantau
- [ ] SKU dipilih dengan sesuai
- [ ] Anggaran kos disemak
- [ ] Konvensyen penamaan konsisten
- [ ] Keselamatan/RBAC dikonfigurasi

### Sebelum `azd deploy`

- [ ] Pembolehubah persekitaran ditetapkan
- [ ] Rahsia dalam Key Vault
- [ ] Rantai sambungan disahkan
- [ ] Semakan kesihatan dikonfigurasi

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
|-------|--------|
| **Sebelumnya** | [Bab 5: Multi-Ejen](../chapter-05-multi-agent/README.md) |
| **Seterusnya** | [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Berkaitan

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Penerapan](../chapter-04-infrastructure/deployment-guide.md)
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat yang penting, terjemahan profesional oleh manusia adalah disarankan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->