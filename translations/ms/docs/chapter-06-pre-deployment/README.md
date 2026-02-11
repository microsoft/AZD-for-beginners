# Bab 6: Perancangan & Pengesahan Pra-Penyebaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1 jam | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini merangkumi langkah-langkah perancangan dan pengesahan penting sebelum menyebarkan aplikasi anda. Pelajari cara mengelakkan kesilapan mahal dengan perancangan kapasiti yang betul, pemilihan SKU, dan pemeriksaan pra-pelayaran.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Menjalankan pemeriksaan pra-pelayaran sebelum penyebaran
- Merancang kapasiti dan menganggarkan keperluan sumber
- Memilih SKU yang sesuai untuk pengoptimuman kos
- Mengkonfigurasi Application Insights untuk pemantauan
- Memahami corak penyelarasan pasukan

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Masa |
|---|--------|-------------|------|
| 1 | [Pemeriksaan Pra-Penyebaran](preflight-checks.md) | Sahkan konfigurasi sebelum penyebaran | 15 min |
| 2 | [Perancangan Kapasiti](capacity-planning.md) | Anggarkan keperluan sumber | 20 min |
| 3 | [Pemilihan SKU](sku-selection.md) | Pilih peringkat harga yang sesuai | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurasikan pemantauan | 20 min |
| 5 | [Corak Penyelarasan](coordination-patterns.md) | Aliran kerja penyebaran pasukan | 15 min |

---

## 🚀 Mula Pantas

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

## ☑️ Senarai Semak Pra-Penyebaran

### Sebelum `azd provision`

- [ ] Kuota disahkan untuk rantau
- [ ] SKUs dipilih dengan sewajarnya
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
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Seterusnya** | [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Berkaitan

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md)
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa ibundanya hendaklah dianggap sebagai sumber yang menjadi rujukan utama. Untuk maklumat yang kritikal, disyorkan mendapatkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab ke atas sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->