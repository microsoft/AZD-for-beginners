# Bab 8: Pola Produksi & Perusahaan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 2-3 jam | **⭐ Kompleksitas**: Lanjutan

---

## Ikhtisar

Bab ini membahas pola penerapan siap perusahaan, penguatan keamanan, pemantauan, dan optimisasi biaya untuk beban kerja AI produksi.

> Divalidasi menggunakan `azd 1.27.1` pada Juli 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menerapkan aplikasi tahan multi-wilayah
- Mengimplementasikan pola keamanan perusahaan
- Mengonfigurasi pemantauan menyeluruh
- Mengoptimalkan biaya dalam skala besar
- Menyiapkan pipeline CI/CD dengan AZD

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Praktik AI Produksi](production-ai-practices.md) | Pola penerapan perusahaan | 90 menit |

---

## 🚀 Daftar Periksa Produksi

- [ ] Penerapan multi-wilayah untuk ketahanan
- [ ] Identitas terkelola untuk autentikasi (tanpa kunci)
- [ ] Application Insights untuk pemantauan
- [ ] Anggaran dan peringatan biaya dikonfigurasi
- [ ] Pemindaian keamanan diaktifkan
- [ ] Integrasi pipeline CI/CD
- [ ] Rencana pemulihan bencana

---

## 🏗️ Pola Arsitektur

### Pola 1: Microservices AI

```mermaid
graph LR
    Gateway[Gerbang API] --> AI[Layanan AI] --> Models[Model Foundry Microsoft]
    Gateway --> Auth[Layanan Authentikasi]
    AI --> Data[Tempat Penyimpanan Data]
```

### Pola 2: AI Berbasis Peristiwa

```mermaid
graph LR
    EventGrid[Event Grid] --> Functions[Fungsi] --> Pipeline[Jalur AI]
```

---

## 🔐 Praktik Terbaik Keamanan

```bicep
// Use managed identity
identity: {
  type: 'SystemAssigned'
}

// Private endpoints for AI services
properties: {
  publicNetworkAccess: 'Disabled'
  networkAcls: {
    defaultAction: 'Deny'
  }
}
```

---

## 💰 Optimisasi Biaya

| Strategi | Penghematan |
|----------|---------|
| Skala ke nol (Container Apps) | 60-80% |
| Gunakan tingkat konsumsi untuk pengembangan | 50-70% |
| Skala terjadwal | 30-50% |
| Kapasitas terpesan | 20-40% |

```bash
# Atur peringatan anggaran
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Pengaturan Pemantauan

```bash
# Alirkan log
azd monitor --logs

# Periksa Application Insights
azd monitor --overview

# Lihat metrik
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 7: Pemecahan Masalah](../chapter-07-troubleshooting/README.md) |
| **Kursus Selesai** | [Beranda Kursus](../../README.md) |

---

## 📖 Sumber Daya Terkait

- [Panduan Agen AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Solusi Multi-Agen](../chapter-05-multi-agent/README.md)
- [Contoh Microservices](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->