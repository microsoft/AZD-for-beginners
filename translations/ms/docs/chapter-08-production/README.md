# Bab 8: Corak Pengeluaran & Perusahaan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 2-3 jam | **⭐ Kerumitan**: Lanjutan

---

## Gambaran Keseluruhan

Bab ini merangkumi corak penyebaran sedia perusahaan, pengukuhan keselamatan, pemantauan, dan pengoptimuman kos untuk beban kerja AI pengeluaran.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Menyebarkan aplikasi tahan ralat merentas rantau
- Melaksanakan corak keselamatan perusahaan
- Mengkonfigurasi pemantauan menyeluruh
- Mengoptimumkan kos pada skala
- Menyediakan saluran CI/CD dengan AZD

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Amalan AI Pengeluaran](production-ai-practices.md) | Corak penyebaran perusahaan | 90 min |

---

## 🚀 Senarai Semak Pengeluaran

- [ ] Penyebaran merentas rantau untuk ketahanan
- [ ] Identiti terurus untuk pengesahan (tanpa kunci)
- [ ] Application Insights untuk pemantauan
- [ ] Belanjawan kos dan amaran dikonfigurasikan
- [ ] Imbasan keselamatan diaktifkan
- [ ] Integrasi paip CI/CD
- [ ] Rancangan pemulihan bencana

---

## 🏗️ Corak Seni Bina

### Corak 1: Mikroservis AI

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   API Gateway   │───▶│   AI Service    │───▶│   Azure OpenAI  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                      │
         ▼                      ▼
┌─────────────────┐    ┌─────────────────┐
│   Auth Service  │    │   Data Store    │
└─────────────────┘    └─────────────────┘
```

### Corak 2: AI Dipacu Peristiwa

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Event Grid    │───▶│  Functions      │───▶│   AI Pipeline   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

---

## 🔐 Amalan Terbaik Keselamatan

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

## 💰 Pengoptimuman Kos

| Strategi | Penjimatan |
|----------|---------|
| Skala ke sifar (Container Apps) | 60-80% |
| Gunakan tingkat penggunaan untuk pembangunan | 50-70% |
| Pengskalaan berjadual | 30-50% |
| Kapasiti Terpelihara | 20-40% |

```bash
# Tetapkan amaran bajet
az consumption budget create \
  --budget-name "AI-Budget" \
  --amount 500 \
  --category Cost \
  --time-grain Monthly
```

---

## 📊 Persediaan Pemantauan

```bash
# Strim log
azd monitor --logs

# Periksa Application Insights
azd monitor

# Lihat metrik
az monitor metrics list --resource <resource-id>
```

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 7: Penyelesaian Masalah](../chapter-07-troubleshooting/README.md) |
| **Kursus Lengkap** | [Laman Utama Kursus](../../README.md) |

---

## 📖 Sumber Berkaitan

- [Panduan Ejen AI](../chapter-02-ai-development/agents.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)
- [Penyelesaian Multi-Ejen](../chapter-05-multi-agent/README.md)
- [Contoh Mikroservis](../../examples/microservices/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber rujukan utama. Untuk maklumat yang kritikal, terjemahan profesional oleh penterjemah manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->