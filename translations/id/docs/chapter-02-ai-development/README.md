# Bab 2: Pengembangan AI-First

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 4-5 jam termasuk lokakarya | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini berfokus pada penerapan aplikasi bertenaga AI menggunakan Azure Developer CLI dan layanan Microsoft Foundry. Mulai dari aplikasi chat AI sederhana hingga agen cerdas dengan alat.

> **Ulasan rilis (2026-11-04):** Panduan AI CLI telah diperiksa terhadap dokumentasi/sumber yang dipublikasikan `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, dan `azure.ai.evaluations` `1.0.0-beta.2`. Gunakan `azd >= 1.37.0` untuk alur kerja gabungan. Evaluasi sekarang menggunakan namespace `azd ai eval` yang terpisah; lihat [perubahan rilis dan panduan migrasi](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ini bukan validasi penerapan langsung.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menerapkan aplikasi AI menggunakan template AZD yang sudah dibuat
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengonfigurasi dan menyesuaikan agen AI dengan alat
- Menerapkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Hubungkan AZD dengan layanan Foundry | 30 menit |
| 2 | [Panduan Agen AI](agents.md) | Terapkan agen cerdas dengan alat | 45 menit |
| 3 | [Penerapan Model AI](ai-model-deployment.md) | Terapkan dan konfigurasikan model AI | 30 menit |
| 4 | [Lab Lokakarya AI](ai-workshop-lab.md) | Praktik langsung: Jelajahi template dan rencanakan konversi Anda | 2-3 jam |

---

## 🚀 Memulai Cepat

Pilih salah satu opsi di direktori kosong baru. `.` di akhir menginisialisasi direktori saat ini; jika tidak, AZD dapat membuat subdirektori tanpa mengubah direktori kerja shell Anda.

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

## 🤖 Template AI Unggulan

| Template | Deskripsi | Layanan |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Chat RAG dengan sitasi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agen AI dengan alat | Layanan Agen AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI dasar | OpenAI + Container Apps |

---

## 💰 Kesadaran Biaya

Ini adalah rentang ilustrasi, bukan kutipan atau batas; lalu lintas model, SKU pencarian/komputasi, wilayah, dan fitur opsional bisa melebihi ini. Tinjau panduan harga terkini dari contoh yang Anda pilih sebelum penyediaan.

| Lingkungan | Perkiraan Biaya Bulanan |
|-------------|------------------------|
| Pengembangan | $80-150 |
| Tahap Uji | $150-300 |
| Produksi | $300-3,500+ |

**Tip:** Jalankan `azd down` setelah pengujian untuk menghindari biaya.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 1: Fondasi](../chapter-01-foundation/README.md) |
| **Selanjutnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Langsung ke** | [Bab 8: Pola Produksi](../chapter-08-production/README.md) |

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