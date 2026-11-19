# Bab 2: Pembangunan AI-Pertama

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 4-5 jam termasuk bengkel | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini memfokuskan kepada penyebaran aplikasi berasaskan AI menggunakan Azure Developer CLI dan perkhidmatan Microsoft Foundry. Dari aplikasi chat AI mudah hingga ejen pintar dengan alat.

> **Kemas kini Foundry GA (2026-11-09):** Bundel `microsoft.foundry` 1.0 adalah [secara umumnya tersedia](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gunakan `azd >= 1.37.0`; penilaian kekal sebagai pemasangan berasingan. [Panduan ejen yang dihos](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) merangkumi ujian Inspector Ejen tempatan dan penyebaran kod dari jauh. Ini adalah ulasan dokumentasi, bukan pengesahan penyebaran langsung; ciri pratonton pilihan mengekalkan status tersendiri.

## Objektif Pembelajaran

Dengan menyiapkan bab ini, anda akan:
- Menyebarkan aplikasi AI menggunakan templat AZD sedia ada
- Memahami integrasi Microsoft Foundry dengan AZD
- Pasang bundel GA dan uji ejen yang dihos secara tempatan sebelum menyebarkan sumbernya ke Foundry
- Semak `azure.yaml`, aset penilaian, dan pembersihan projek baru berbanding projek guna semula
- Konfigurasi dan sesuaikan ejen AI dengan alat
- Menyebarkan aplikasi RAG (Generasi Augmented Retrieval)

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Bundel GA, aliran kerja ejen yang dihos dari tempatan ke awan, dan penilaian | 60 min |
| 2 | [Panduan Ejen AI](agents.md) | Menyebarkan ejen pintar dengan alat | 45 min |
| 3 | [Penyebaran Model AI](ai-model-deployment.md) | Menyebar dan konfigurasi model AI | 30 min |
| 4 | [Makmal Bengkel AI](ai-workshop-lab.md) | Hands-on: Terokai templat dan rancang penukaran anda | 2-3 jam |

---

## 🚀 Mula Pantas

Pilih satu pilihan dalam direktori kosong baru. `.` yang diapit memulakan direktori semasa; jika tidak AZD boleh mencipta subdirektori tanpa menukar direktori kerja shell anda.

Untuk **laluan penyebaran kod ejen yang dihos GA**, mulakan dengan [panduan langkah demi langkah](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ia memerlukan AZD 1.37.0+, uv terkini, Python 3.13+, kebenaran Foundry, dan kuota model. Templat aplikasi penuh di bawah adalah alternatif, bukan prasyarat untuk panduan itu.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Templat AI Pilihan

| Templat | Penerangan | Perkhidmatan |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG dengan sitasi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Ejen AI dengan alat | Perkhidmatan Ejen AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI Asas | OpenAI + Container Apps |

---

## 💰 Kesedaran Kos

Ini adalah julat ilustratif, bukan sebut harga atau had; trafik model, SKU Pengiraan/Carian, rantau, dan ciri pilihan boleh melebihi mereka. Semak panduan harga terkini sampel pilihan anda sebelum menyediakan.

| Persekitaran | Anggaran Kos Bulanan |
|-------------|----------------------|
| Pembangunan | $80-150 |
| Staging | $150-300 |
| Pengeluaran | $300-3,500+ |

**Pembersihan:** Semak `azd down` sebelum mengesahkan: untuk projek Foundry yang baru dibuat ia memadamkan kumpulan sumber dan segala isinya. Untuk projek Foundry yang digunakan semula, ia meninggalkan projek dan sumber ejen di tempatnya; ikut [panduan pembersihan langkah demi langkah](microsoft-foundry-integration.md#7-clean-up-deliberately) untuk mengalih keluar sumber yang tidak diingini secara berasingan.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 1: Asas](../chapter-01-foundation/README.md) |
| **Seterusnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Langkau ke** | [Bab 8: Corak Pengeluaran](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [Penyelesaian Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Amalan AI Pengeluaran](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->