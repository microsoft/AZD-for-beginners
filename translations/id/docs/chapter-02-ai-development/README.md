# Bab 2: Pengembangan AI-Pertama

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 4-5 jam termasuk workshop | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini fokus pada penerapan aplikasi bertenaga AI menggunakan Azure Developer CLI dan layanan Microsoft Foundry. Dari aplikasi chat AI sederhana hingga agen cerdas dengan alat.

> **Pembaruan Foundry GA (2026-11-09):** Bundel `microsoft.foundry` 1.0 sudah [tersedia secara umum](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Gunakan `azd >= 1.37.0`; evaluasi tetap merupakan instalasi terpisah. [Panduan agen hosted](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) membahas pengujian Agent Inspector lokal dan penerapan kode jarak jauh. Ini adalah tinjauan dokumentasi, bukan validasi penerapan langsung; fitur pratinjau opsional mempertahankan statusnya sendiri.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Menerapkan aplikasi AI menggunakan templat AZD yang sudah dibuat
- Memahami integrasi Microsoft Foundry dengan AZD
- Menginstal bundel GA dan menguji agen hosted secara lokal sebelum menerapkan sumbernya ke Foundry
- Meninjau `azure.yaml`, aset evaluasi, dan pembersihan proyek baru vs yang digunakan kembali
- Mengonfigurasi dan menyesuaikan agen AI dengan alat
- Menerapkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Bundel GA, alur kerja agen hosted lokal-ke-cloud, dan evaluasi | 60 menit |
| 2 | [Panduan Agen AI](agents.md) | Menerapkan agen cerdas dengan alat | 45 menit |
| 3 | [Penerapan Model AI](ai-model-deployment.md) | Menerapkan dan mengonfigurasi model AI | 30 menit |
| 4 | [Laboratorium Workshop AI](ai-workshop-lab.md) | Praktik langsung: Jelajahi templat dan rencanakan konversi Anda | 2-3 jam |

---

## 🚀 Mulai Cepat

Pilih satu opsi di direktori kosong baru. `.` di akhir menginisialisasi direktori saat ini; jika tidak, AZD dapat membuat subdirektori tanpa mengubah direktori kerja shell Anda.

Untuk **jalur penerapan kode agen hosted GA**, mulailah dengan [panduan langkah-demi-langkah](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Ini memerlukan AZD 1.37.0+, uv saat ini, Python 3.13+, izin Foundry, dan kuota model. Templat aplikasi lengkap di bawah ini adalah alternatif, bukan prasyarat untuk panduan tersebut.

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

## 🤖 Templat AI Unggulan

| Templat | Deskripsi | Layanan |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | Obrolan RAG dengan sitasi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agen AI dengan alat | Layanan Agen AI |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Obrolan AI dasar | OpenAI + Container Apps |

---

## 💰 Kesadaran Biaya

Ini adalah kisaran ilustratif, bukan kutipan atau batas; lalu lintas model, SKU Pencarian/komputasi, wilayah, dan fitur opsional dapat melebihi angka ini. Tinjau panduan harga contoh pilihan Anda saat ini sebelum melakukan penyediaan.

| Lingkungan | Perkiraan Biaya Bulanan |
|-------------|----------------------|
| Pengembangan | $80-150 |
| Staging | $150-300 |
| Produksi | $300-3,500+ |

**Pembersihan:** Tinjau `azd down` sebelum konfirmasi: untuk proyek Foundry yang baru dibuat, ini menghapus grup sumber daya dan semua isinya. Untuk proyek Foundry yang digunakan kembali, ini membiarkan sumber daya proyek dan agen tetap ada; ikuti [panduan pembersihan walkthrough](microsoft-foundry-integration.md#7-clean-up-deliberately) untuk menghapus sumber daya yang tidak diinginkan secara terpisah.

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 1: Fondasi](../chapter-01-foundation/README.md) |
| **Berikutnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Lewati ke** | [Bab 8: Pola Produksi](../chapter-08-production/README.md) |

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