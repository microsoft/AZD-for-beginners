# Bab 2: Pengembangan AI-Pertama

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1-2 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini berfokus pada penerapan aplikasi bertenaga AI menggunakan Azure Developer CLI dan layanan Microsoft Foundry. Dari aplikasi chat AI sederhana hingga agen cerdas dengan alat.

> **Catatan validasi (2026-07-13):** Alur perintah dan panduan ekstensi dalam bab ini telah ditinjau dengan `azd` `1.27.1` dan rilis ekstensi agen AI pratinjau saat ini `azure.ai.agents` `1.0.0-beta.5`. Jika Anda menggunakan versi AZD yang lebih lama, perbarui terlebih dahulu lalu lanjutkan dengan latihan.

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
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Menghubungkan AZD dengan layanan Foundry | 30 menit |
| 2 | [Panduan Agen AI](agents.md) | Menerapkan agen cerdas dengan alat | 45 menit |
| 3 | [Penerapan Model AI](ai-model-deployment.md) | Menerapkan dan mengonfigurasi model AI | 30 menit |
| 4 | [Lab Workshop AI](ai-workshop-lab.md) | Praktik: Membuat solusi AI Anda siap AZD | 60 menit |

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG dengan kutipan | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agen AI dengan alat | Layanan Agen AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI dasar | OpenAI + Container Apps |

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
| **Sebelumnya** | [Bab 1: Fondasi](../chapter-01-foundation/README.md) |
| **Berikutnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Lewati ke** | [Bab 8: Pola Produksi](../chapter-08-production/README.md) |

---

## 📖 Sumber Terkait

- [Pemecahan Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praktik AI Produksi](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->