# Bab 2: Pengembangan Berbasis AI

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1-2 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini berfokus pada penerapan aplikasi bertenaga AI menggunakan Azure Developer CLI dan layanan Microsoft Foundry. Dari aplikasi obrolan AI sederhana hingga agen cerdas dengan alat.

> **Catatan validasi (2026-06-15):** Alur perintah dan panduan ekstensi dalam bab ini telah ditinjau terhadap `azd` `1.25.6` dan rilisan ekstensi agen AI pratinjau saat ini `azure.ai.agents` `0.1.40-preview`. Jika Anda menggunakan build AZD yang lebih lama, perbarui terlebih dahulu lalu lanjutkan dengan latihan.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menerapkan aplikasi AI menggunakan template AZD pra-buat
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengonfigurasi dan menyesuaikan agen AI dengan alat
- Menerapkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Hubungkan AZD dengan layanan Foundry | 30 min |
| 2 | [Panduan Agen AI](agents.md) | Terapkan agen cerdas dengan alat | 45 min |
| 3 | [Penerapan Model AI](ai-model-deployment.md) | Terapkan dan konfigurasikan model AI | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktik langsung: Siapkan solusi AI Anda agar siap AZD | 60 min |

---

## 🚀 Memulai Cepat

```bash
# Opsi 1: Aplikasi Obrolan RAG
azd init --template azure-search-openai-demo
azd up

# Opsi 2: Agen AI
azd init --template get-started-with-ai-agents
azd up

# Opsi 3: Aplikasi Obrolan Cepat
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
| **Sebelumnya** | [Bab 1: Dasar](../chapter-01-foundation/README.md) |
| **Berikutnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Lompat ke** | [Bab 8: Pola Produksi](../chapter-08-production/README.md) |

---

## 📖 Sumber Daya Terkait

- [Pemecahan Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktik AI Produksi](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->