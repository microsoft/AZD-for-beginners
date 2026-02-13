# Bab 5: Penyelesaian AI Ejen Berbilang

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Tempoh**: 2-3 jam | **⭐ Kerumitan**: Lanjutan

---

## Gambaran Keseluruhan

Bab ini merangkumi corak seni bina ejen berbilang yang lanjutan, orkestrasi ejen, dan penyebaran AI sedia untuk pengeluaran untuk senario yang kompleks.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Memahami corak seni bina ejen berbilang
- Menyebarkan sistem ejen AI yang terkoordinasi
- Melaksanakan komunikasi antara ejen
- Membina penyelesaian ejen berbilang yang sedia untuk pengeluaran

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Masa |
|---|--------|-------------|------|
| 1 | [Penyelesaian Ejen Berbilang Runcit](../../examples/retail-scenario.md) | Panduan pelaksanaan lengkap | 90 minit |
| 2 | [Corak Penyelarasan](../chapter-06-pre-deployment/coordination-patterns.md) | Strategi orkestrasi ejen | 30 minit |
| 3 | [Penyebaran Templat ARM](../../examples/retail-multiagent-arm-template/README.md) | Penyebaran satu klik | 30 minit |

---

## 🚀 Mula Pantas

```bash
# Sebarkan penyelesaian multi-ejen runcit
cd examples/retail-multiagent-arm-template
./deploy.sh

# Atau gunakan templat terus
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Seni Bina Ejen Berbilang

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Penyelesaian Unggulan: Ejen Berbilang Runcit

The [Penyelesaian Ejen Berbilang Runcit](../../examples/retail-scenario.md) menunjukkan:

- **Ejen Pelanggan**: Mengendalikan interaksi pengguna dan keutamaan
- **Ejen Inventori**: Mengurus stok dan pemprosesan pesanan
- **Orkestrator**: Mengkoordinasikan antara ejen
- **Memori Berkongsi**: Pengurusan konteks merentasi ejen

### Perkhidmatan Digunakan

| Perkhidmatan | Tujuan |
|---------|---------|
| Azure OpenAI | Pemahaman bahasa |
| Azure AI Search | Katalog produk |
| Cosmos DB | Keadaan ejen dan memori |
| Container Apps | Penghosan ejen |
| Application Insights | Pemantauan |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Seterusnya** | [Bab 6: Pra-Penyebaran](../chapter-06-pre-deployment/README.md) |

---

## 📖 Sumber Berkaitan

- [Panduan Ejen AI](../chapter-02-ai-development/agents.md)
- [Amalan AI Produksi](../chapter-08-production/production-ai-practices.md)
- [Penyelesaian Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa sumber hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat yang kritikal, disyorkan terjemahan profesional oleh penterjemah manusia. Kami tidak bertanggungjawab atas sebarang salah faham atau tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->