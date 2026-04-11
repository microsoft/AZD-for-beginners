# Bab 6: Perencanaan & Validasi Pra-Penyebaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membahas langkah-langkah perencanaan dan validasi penting sebelum menyebarkan aplikasi Anda. Pelajari cara menghindari kesalahan mahal dengan perencanaan kapasitas yang tepat, pemilihan SKU, dan pemeriksaan pra-penyebaran.

> Diverifikasi terhadap `azd 1.23.12` pada Maret 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menjalankan pemeriksaan pra-penyebaran sebelum penyebaran
- Merencanakan kapasitas dan memperkirakan kebutuhan sumber daya
- Memilih SKU yang sesuai untuk optimasi biaya
- Mengonfigurasi Application Insights untuk pemantauan
- Memahami pola koordinasi tim

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Pemeriksaan Pra-Penyebaran](preflight-checks.md) | Validasi konfigurasi sebelum penyebaran | 15 menit |
| 2 | [Perencanaan Kapasitas](capacity-planning.md) | Perkirakan kebutuhan sumber daya | 20 menit |
| 3 | [Pemilihan SKU](sku-selection.md) | Pilih tingkat harga yang sesuai | 15 menit |
| 4 | [Application Insights](application-insights.md) | Konfigurasi pemantauan | 20 menit |
| 5 | [Pola Koordinasi](coordination-patterns.md) | Alur kerja penyebaran tim | 15 menit |

---

## 🚀 Mulai Cepat

```bash
# Periksa kuota langganan
az vm list-usage --location eastus --output table

# Pratinjau penerapan (tidak ada sumber daya yang dibuat)
azd provision --preview

# Validasi sintaks Bicep
az bicep build --file infra/main.bicep

# Periksa konfigurasi lingkungan
azd env get-values
```

---

## ☑️ Daftar Periksa Pra-Penyebaran

### Sebelum `azd provision`

- [ ] Kuota terverifikasi untuk wilayah
- [ ] SKU dipilih dengan tepat
- [ ] Estimasi biaya ditinjau
- [ ] Konvensi penamaan konsisten
- [ ] Keamanan/RBAC dikonfigurasi

### Sebelum `azd deploy`

- [ ] Variabel lingkungan disetel
- [ ] Rahasia di Key Vault
- [ ] String koneksi diverifikasi
- [ ] Pemeriksaan kesehatan dikonfigurasi

---

## 💰 Panduan Pemilihan SKU

| Beban Kerja | Pengembangan | Produksi |
|----------|-------------|------------|
| Container Apps | Consumption | Dedicated D4 |
| App Service | B1/B2 | P1v3+ |
| Microsoft Foundry Models | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Selanjutnya** | [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Terkait

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md)
- [Masalah Umum](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya memberikan terjemahan yang akurat, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi penting, disarankan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->