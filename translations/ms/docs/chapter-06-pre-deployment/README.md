# Bab 6: Perancangan & Pengesahan Pra-Penyebaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 2-4 jam bacaan; masa tambahan untuk makmal yang disesuaikan | **⭐ Kerumitan**: Pertengahan–Lanjutan

---

## Gambaran Keseluruhan

Bab ini merangkumi langkah penting perancangan dan pengesahan sebelum menyebarkan aplikasi anda. Pelajari cara mengelakkan kesilapan mahal dengan perancangan kapasiti yang betul, pemilihan SKU, dan pemeriksaan prapenerbangan.

> Panduan arahan disemak berbanding rujukan `azd 1.37.2` yang dikeluarkan. Penyebaran awan tidak dijalankan. Pelajaran yang lebih panjang mengandungi serpihan ilustratif, bukan projek penyebaran tempatan lengkap.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Jalankan pemeriksaan prapenerbangan sebelum penyebaran
- Merancang kapasiti dan menganggar keperluan sumber
- Memilih SKU yang sesuai untuk pengoptimuman kos
- Konfigurasikan Application Insights untuk pemantauan
- Fahami corak koordinasi berbilang ejen dan keperluan penyebaran mereka

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Pemeriksaan Pra-Penerbangan](preflight-checks.md) | Sahihkan konfigurasi sebelum penyebaran | 15 min |
| 2 | [Perancangan Kapasiti](capacity-planning.md) | Anggar keperluan sumber | 20 min |
| 3 | [Pemilihan SKU](sku-selection.md) | Pilih tier harga yang sesuai | 15 min |
| 4 | [Application Insights](application-insights.md) | Konfigurasikan pemantauan | 20 min |
| 5 | [Corak Koordinasi](coordination-patterns.md) | Reka bentuk orkestrasinya ejen berbilang yang maju | 60-75 min |

---

## 🚀 Mula Pantas

```bash
# Check subscription quotas
az vm list-usage --location eastus --output table

# Preview infrastructure changes (inspect template hooks before running)
azd provision --preview

# Validate Bicep syntax
az bicep build --file infra/main.bicep

# Check environment configuration
azd env get-values
```

---

## ☑️ Senarai Semak Pra-Penyebaran

### Sebelum `azd provision`

- [ ] Kuota disahkan untuk rantau
- [ ] SKUs dipilih dengan sesuai
- [ ] Anggaran kos disemak
- [ ] Konvensyen penamaan konsisten
- [ ] Keselamatan/RBAC dikonfigurasikan

### Sebelum `azd deploy`

- [ ] Pemboleh ubah persekitaran ditetapkan
- [ ] Rahsia dalam Key Vault
- [ ] Rentetan sambungan disahkan
- [ ] Pemeriksaan kesihatan dikonfigurasikan

---

## 💰 Panduan Pemilihan SKU

| Beban Kerja | Pembangunan | Pengeluaran |
|----------|-------------|------------|
| Container Apps | Penggunaan | Penggunaan atau profil beban khusus, berdasarkan beban yang diukur |
| App Service | B1/B2 | P1v3+ |
| model Azure OpenAI | Jenis penyebaran bayar-semasa yang disokong | Bayar-semasa atau jalur lebar terprovisian; bergantung model/rantau |
| AI Search | Percuma/Asas dalam had | Tier Asas atau Standard saiz untuk indeks, replikasi, dan beban pertanyaan |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 5: Ejen Berbilang](../chapter-05-multi-agent/README.md) |
| **Seterusnya** | [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Berkaitan

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md)
- [Isu Biasa](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->