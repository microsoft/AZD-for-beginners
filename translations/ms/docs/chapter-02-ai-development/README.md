# Bab 2: Pembangunan AI-Pertama

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-2 jam | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini memberi tumpuan kepada penyebaran aplikasi berkuasa AI menggunakan Azure Developer CLI dan perkhidmatan Microsoft Foundry. Dari aplikasi chat AI mudah kepada ejen pintar dengan alat.

> **Nota pengesahan (2026-03-25):** Aliran arahan dan panduan sambungan dalam bab ini telah disemak menggunakan `azd` `1.23.12` dan pelepasan lanjutan ejen AI pratonton kini `azure.ai.agents` `0.1.18-preview`. Jika anda menggunakan binaan AZD yang lebih lama, kemas kini terlebih dahulu dan kemudian teruskan dengan latihan.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Menyebarkan aplikasi AI menggunakan templat AZD siap guna
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengkonfigurasi dan menyesuaikan ejen AI dengan alat
- Menyebarkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Sambungkan AZD dengan perkhidmatan Foundry | 30 min |
| 2 | [Panduan Ejen AI](agents.md) | Menyebarkan ejen pintar dengan alat | 45 min |
| 3 | [Penyebaran Model AI](ai-model-deployment.md) | Menyebar dan mengkonfigurasi model AI | 30 min |
| 4 | [Makmal Bengkel AI](ai-workshop-lab.md) | Amali: Buat penyelesaian AI anda sedia AZD | 60 min |

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

| Templat | Penerangan | Perkhidmatan |
|---------|------------|--------------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG dengan petikan | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Ejen AI dengan alat | Perkhidmatan Ejen AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI asas | OpenAI + Container Apps |

---

## 💰 Kesedaran Kos

| Persekitaran | Anggaran Kos Bulanan |
|--------------|----------------------|
| Pembangunan | $80-150 |
| Persiapan | $150-300 |
| Pengeluaran | $300-3,500+ |

**Petua:** Jalankan `azd down` selepas pengujian untuk elak caj.

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 1: Asas](../chapter-01-foundation/README.md) |
| **Seterusnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Langkau ke** | [Bab 8: Corak Pengeluaran](../chapter-08-production/README.md) |

---

## 📖 Sumber Berkaitan

- [Troubleshooting AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Amalan AI Pengeluaran](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:  
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat kritikal, terjemahan manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->