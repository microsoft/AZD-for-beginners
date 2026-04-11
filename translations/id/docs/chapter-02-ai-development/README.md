# Bab 2: Pengembangan Berbasis AI

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Durasi**: 1-2 hours | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini berfokus pada penerapan aplikasi bertenaga AI menggunakan Azure Developer CLI dan layanan Microsoft Foundry. Dari aplikasi obrolan AI sederhana hingga agen cerdas dengan alat.

> **Catatan validasi (2026-03-25):** Alur perintah dan panduan ekstensi dalam bab ini ditinjau terhadap `azd` `1.23.12` dan rilis ekstensi preview agen AI saat ini `azure.ai.agents` `0.1.18-preview`. Jika Anda menggunakan build AZD yang lebih lama, perbarui terlebih dahulu lalu lanjutkan dengan latihan.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menerapkan aplikasi AI menggunakan template AZD yang sudah dibuat sebelumnya
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengonfigurasi dan menyesuaikan agen AI dengan alat
- Menerapkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Hubungkan AZD dengan layanan Foundry | 30 menit |
| 2 | [Panduan Agen AI](agents.md) | Mendeploy agen cerdas dengan alat | 45 menit |
| 3 | [Penerapan Model AI](ai-model-deployment.md) | Mendeploy dan mengonfigurasi model AI | 30 menit |
| 4 | [Lab Workshop AI](ai-workshop-lab.md) | Praktik: Siapkan solusi AI Anda agar siap AZD | 60 menit |

---

## 🚀 Mulai Cepat

```bash
# Opsi 1: Aplikasi Chat RAG
azd init --template azure-search-openai-demo
azd up

# Opsi 2: Agen AI
azd init --template get-started-with-ai-agents
azd up

# Opsi 3: Aplikasi Chat Cepat
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Template AI Unggulan

| Template | Deskripsi | Layanan |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Obrolan RAG dengan sitasi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agen AI dengan alat | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Obrolan AI dasar | OpenAI + Container Apps |

---

## 💰 Kesadaran Biaya

| Lingkungan | Perkiraan Biaya Bulanan |
|-------------|----------------------|
| Pengembangan | $80-150 |
| Staging | $150-300 |
| Produksi | $300-3,500+ |

**Tip:** Jalankan `azd down` setelah pengujian untuk menghindari biaya.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 1: Foundation](../chapter-01-foundation/README.md) |
| **Berikutnya** | [Bab 3: Configuration](../chapter-03-configuration/README.md) |
| **Langsung ke** | [Bab 8: Production Patterns](../chapter-08-production/README.md) |

---

## 📖 Sumber Terkait

- [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Production AI Practices](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya seakurat mungkin, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau kekeliruan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->