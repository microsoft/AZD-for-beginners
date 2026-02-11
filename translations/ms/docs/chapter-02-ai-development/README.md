# Chapter 2: Pembangunan Berorientasikan AI

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Tempoh**: 1-2 hours | **⭐ Kerumitan**: Intermediate

---

## Gambaran Keseluruhan

Bab ini memberi tumpuan kepada penyebaran aplikasi dikuasakan AI menggunakan Azure Developer CLI dan perkhidmatan Microsoft Foundry. Dari aplikasi sembang AI mudah kepada agen pintar dengan alat.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Menyebarkan aplikasi AI menggunakan templat AZD pra-binaan
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengkonfigurasi dan menyesuaikan agen AI dengan alat
- Menyebarkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Sambungkan AZD dengan perkhidmatan Foundry | 30 min |
| 2 | [Panduan Agen AI](agents.md) | Menyebarkan agen pintar dengan alat | 45 min |
| 3 | [Penyebaran Model AI](ai-model-deployment.md) | Menyebarkan dan mengkonfigurasi model AI | 30 min |
| 4 | [Makmal Bengkel AI](ai-workshop-lab.md) | Amali: Jadikan penyelesaian AI anda sedia AZD | 60 min |

---

## 🚀 Mula Pantas

```bash
# Pilihan 1: Aplikasi Sembang RAG
azd init --template azure-search-openai-demo
azd up

# Pilihan 2: Ejen AI
azd init --template get-started-with-ai-agents
azd up

# Pilihan 3: Aplikasi Sembang Pantas
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templat AI Pilihan

| Templat | Penerangan | Perkhidmatan |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Sembang RAG dengan petikan | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Ejen AI dengan alat | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Sembang AI asas | OpenAI + Container Apps |

---

## 💰 Kesedaran Kos

| Persekitaran | Anggaran Kos Bulanan |
|-------------|----------------------|
| Pembangunan | $80-150 |
| Peringkat | $150-300 |
| Pengeluaran | $300-3,500+ |

**Petua:** Jalankan `azd down` selepas menguji untuk mengelakkan caj.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Chapter 1: Foundation](../chapter-01-foundation/README.md) |
| **Seterusnya** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Langkau ke** | [Chapter 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI Co-op Translator (https://github.com/Azure/co-op-translator). Walaupun kami berusaha memastikan ketepatan, sila ambil perhatian bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh penterjemah manusia adalah disyorkan. Kami tidak bertanggungjawab atas sebarang salah faham atau salah tafsiran yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->