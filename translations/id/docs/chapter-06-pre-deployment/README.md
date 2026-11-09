# Bab 6: Perencanaan & Validasi Pra-Penyebaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 2-4 jam membaca; waktu tambahan untuk lab yang disesuaikan | **⭐ Kompleksitas**: Menengah–Lanjutan

---

## Ikhtisar

Bab ini membahas langkah-langkah penting untuk perencanaan dan validasi sebelum menyebarkan aplikasi Anda. Pelajari cara menghindari kesalahan mahal dengan perencanaan kapasitas yang tepat, pemilihan SKU, dan pemeriksaan pra-penerbangan.

> Panduan perintah ditinjau terhadap referensi `azd 1.37.2` yang dirilis. Penyebaran cloud tidak dilakukan. Pelajaran yang lebih panjang mencakup fragmen ilustratif, bukan proyek penyebaran lokal lengkap.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menjalankan pemeriksaan pra-penerbangan sebelum penyebaran
- Merencanakan kapasitas dan memperkirakan kebutuhan sumber daya
- Memilih SKU yang sesuai untuk optimasi biaya
- Mengonfigurasi Application Insights untuk pemantauan
- Memahami pola koordinasi multi-agen dan kebutuhan penyebarannya

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Pemeriksaan Pra-penerbangan](preflight-checks.md) | Validasi konfigurasi sebelum penyebaran | 15 mnt |
| 2 | [Perencanaan Kapasitas](capacity-planning.md) | Memperkirakan kebutuhan sumber daya | 20 mnt |
| 3 | [Pemilihan SKU](sku-selection.md) | Memilih tingkatan harga yang sesuai | 15 mnt |
| 4 | [Application Insights](application-insights.md) | Mengonfigurasi pemantauan | 20 mnt |
| 5 | [Pola Koordinasi](coordination-patterns.md) | Desain orkestrasi multi-agen tingkat lanjut | 60-75 mnt |

---

## 🚀 Mulai Cepat

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

## ☑️ Daftar Periksa Pra-Penyebaran

### Sebelum `azd provision`

- [ ] Kuota diverifikasi untuk wilayah
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
| Container Apps | Konsumsi | Konsumsi atau profil beban kerja khusus, berdasarkan beban terukur |
| App Service | B1/B2 | P1v3+ |
| model Azure OpenAI | Tipe penyebaran bayar sesuai penggunaan yang didukung | Bayar sesuai penggunaan atau throughput yang disediakan; tergantung model/wilayah |
| AI Search | Gratis/Dasar dalam batas | Tingkat Dasar atau Standar yang disesuaikan dengan indeks, replika, dan beban kueri |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 5: Multi-Agen](../chapter-05-multi-agent/README.md) |
| **Berikutnya** | [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md) |

---

## 📖 Sumber Daya Terkait

- [Panduan Konfigurasi](../chapter-03-configuration/configuration.md)
- [Panduan Penyebaran](../chapter-04-infrastructure/deployment-guide.md)
- [Masalah Umum](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->