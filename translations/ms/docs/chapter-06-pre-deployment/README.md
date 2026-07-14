# Bab 6: Perancangan & Pengesahan Pra-Penerapan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1 jam | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini merangkumi langkah-langkah penting perancangan dan pengesahan sebelum menerapkan aplikasi anda. Pelajari cara mengelakkan kesilapan mahal dengan perancangan kapasiti yang betul, pemilihan SKU, dan pemeriksaan pra-penerbangan.

> Disahkan dengan `azd 1.27.1` pada Julai 2026.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Menjalankan pemeriksaan pra-penerbangan sebelum penerapan
- Merancang kapasiti dan menganggarkan keperluan sumber
- Memilih SKU yang sesuai untuk pengoptimuman kos
- Menyediakan Application Insights untuk pemantauan
- Memahami corak koordinasi pasukan

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Pemeriksaan Pra-Penerbangan](preflight-checks.md) | Sahkan konfigurasi sebelum penerapan | 15 min |
| 2 | [Perancangan Kapasiti](capacity-planning.md) | Anggarkan keperluan sumber | 20 min |
| 3 | [Pemilihan SKU](sku-selection.md) | Pilih tahap harga yang sesuai | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurasi pemantauan | 20 min |
| 5 | [Corak Koordinasi](coordination-patterns.md) | Aliran kerja penerapan pasukan | 15 min |

---

## 🚀 Mula Cepat

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

## ☑️ Senarai Semak Pra-Penerapan

### Sebelum `azd provision`

- [ ] Kuota disahkan untuk rantau
- [ ] SKU dipilih dengan betul
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
| Aplikasi Kontena | Penggunaan | Dedikasi D4 |
| Servis Aplikasi | B1/B2 | P1v3+ |
| Model Microsoft Foundry | Standard | Standard + PTU |
| AI Search | Asas | Standard S2+ |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
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
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->