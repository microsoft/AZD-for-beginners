# Bab 6: Perencanaan & Validasi Pra-Penerapan

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Durasi**: 1 jam | **⭐ Kompleksitas**: Menengah

---

## Gambaran Umum

Bab ini mencakup langkah-langkah perencanaan dan validasi penting sebelum menerapkan aplikasi Anda. Pelajari cara menghindari kesalahan mahal dengan perencanaan kapasitas yang tepat, pemilihan SKU, dan pemeriksaan pra-penerapan.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menjalankan pemeriksaan pra-deploy sebelum penerapan
- Merencanakan kapasitas dan memperkirakan kebutuhan sumber daya
- Memilih SKU yang sesuai untuk optimasi biaya
- Mengonfigurasi Application Insights untuk pemantauan
- Memahami pola koordinasi tim

---

## 📚 Lessons

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Pemeriksaan Pra-Deploy](preflight-checks.md) | Validasi konfigurasi sebelum penerapan | 15 menit |
| 2 | [Perencanaan Kapasitas](capacity-planning.md) | Perkirakan kebutuhan sumber daya | 20 menit |
| 3 | [Pemilihan SKU](sku-selection.md) | Pilih tingkatan harga yang sesuai | 15 menit |
| 4 | [Application Insights](application-insights.md) | Konfigurasikan pemantauan | 20 menit |
| 5 | [Pola Koordinasi](coordination-patterns.md) | Alur kerja penerapan tim | 15 menit |

---

## 🚀 Mulai Cepat

```bash
# Periksa kuota langganan
az vm list-usage --location eastus --output table

# Pratinjau penyebaran (tidak ada sumber daya yang dibuat)
azd provision --preview

# Validasi sintaks Bicep
az bicep build --file infra/main.bicep

# Periksa konfigurasi lingkungan
azd env get-values
```

---

## ☑️ Daftar Periksa Pra-Deploy

### Sebelum `azd provision`

- [ ] Kuota diverifikasi untuk wilayah
- [ ] SKU dipilih dengan tepat
- [ ] Perkiraan biaya ditinjau
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
| Azure OpenAI | Standard | Standard + PTU |
| AI Search | Basic | Standard S2+ |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 5: Multi-Agent](../chapter-05-multi-agent/README.md) |
| **Berikutnya** | [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Terkait

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Penerapan](../chapter-04-infrastructure/deployment-guide.md)
- [Masalah Umum](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang krusial, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->