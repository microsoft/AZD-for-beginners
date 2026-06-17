# Bab 2: Pembangunan AI-Pertama

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-2 jam | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini memfokuskan pada pelaksanaan aplikasi berkuasa AI menggunakan Azure Developer CLI dan perkhidmatan Microsoft Foundry. Dari aplikasi chat AI mudah ke agen pintar dengan alat.

> **Nota pengesahan (2026-06-15):** Aliran arahan dan panduan sambungan dalam bab ini telah disemak berbanding `azd` `1.25.6` dan keluaran pratonton sambungan agen AI semasa `azure.ai.agents` `0.1.40-preview`. Jika anda menggunakan binaan AZD yang lebih lama, kemas kini dahulu dan kemudian teruskan dengan latihan.

## Objektif Pembelajaran

Dengan melengkapkan bab ini, anda akan:
- Melaksanakan aplikasi AI menggunakan templat AZD yang telah dibina
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengkonfigurasi dan menyesuaikan agen AI dengan alat
- Melaksanakan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Perihalan | Masa |
|---|-----------|-----------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Sambungkan AZD dengan perkhidmatan Foundry | 30 minit |
| 2 | [Panduan Agen AI](agents.md) | Melaksanakan agen pintar dengan alat | 45 minit |
| 3 | [Pelaksanaan Model AI](ai-model-deployment.md) | Melaksanakan dan mengkonfigurasi model AI | 30 minit |
| 4 | [Makmal Bengkel AI](ai-workshop-lab.md) | Praktikal: Menghasilkan penyelesaian AI yang sedia AZD | 60 minit |

---

## 🚀 Mula Pantas

```bash
# Pilihan 1: Aplikasi RAG Chat
azd init --template azure-search-openai-demo
azd up

# Pilihan 2: Ejen AI
azd init --template get-started-with-ai-agents
azd up

# Pilihan 3: Aplikasi Chat Pantas
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Templat AI Pilihan

| Templat | Perihalan | Perkhidmatan |
|---------|-----------|--------------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat dengan rujukan | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agen AI dengan alat | Perkhidmatan Agen AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI asas | OpenAI + Aplikasi Kontena |

---

## 💰 Kesedaran Kos

| Persekitaran | Anggaran Kos Bulanan |
|--------------|----------------------|
| Pembangunan | $80-150 |
| Penstagingan | $150-300 |
| Pengeluaran | $300-3,500+ |

**Tip:** Jalankan `azd down` selepas ujian untuk mengelakkan caj.

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 1: Asas](../chapter-01-foundation/README.md) |
| **Seterusnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Langkau ke** | [Bab 8: Corak Pengeluaran](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [Penyelesaian Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Amalan AI Pengeluaran](../chapter-08-production/production-ai-practices.md)
- [Insights Aplikasi](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->