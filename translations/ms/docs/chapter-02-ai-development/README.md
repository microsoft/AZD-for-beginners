# Bab 2: Pembangunan AI-Pertama

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 4-5 jam termasuk bengkel | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini memberi tumpuan kepada penyebaran aplikasi berkuasa AI menggunakan Azure Developer CLI dan perkhidmatan Microsoft Foundry. Dari aplikasi chat AI yang mudah hingga ejen pintar dengan alat.

> **Ulasan keluaran (2026-11-04):** Panduan AI CLI telah diperiksa terhadap dokumentasi/sumber diterbitkan `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, dan `azure.ai.evaluations` `1.0.0-beta.2`. Gunakan `azd >= 1.37.0` untuk aliran kerja gabungan. Penilaian kini menggunakan namespace `azd ai eval` berasingan; lihat [perubahan keluaran dan panduan migrasi](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ini bukan pengesahan penyebaran langsung.

## Objektif Pembelajaran

Dengan melengkapkan bab ini, anda akan:
- Menyebarkan aplikasi AI menggunakan templat AZD yang telah dibina
- Memahami integrasi Microsoft Foundry dengan AZD
- Mengkonfigurasi dan menyesuaikan ejen AI dengan alat
- Menyebarkan aplikasi RAG (Retrieval-Augmented Generation)

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Integrasi Microsoft Foundry](microsoft-foundry-integration.md) | Sambungkan AZD dengan perkhidmatan Foundry | 30 minit |
| 2 | [Panduan Ejen AI](agents.md) | Menyebarkan ejen pintar dengan alat | 45 minit |
| 3 | [Penyebaran Model AI](ai-model-deployment.md) | Menyebarkan dan mengkonfigurasi model AI | 30 minit |
| 4 | [Makmal Bengkel AI](ai-workshop-lab.md) | Amali: Terokai templat dan rancang penukaran anda | 2-3 jam |

---

## 🚀 Mula Pantas

Pilih satu pilihan dalam direktori kosong yang baru. `.` di hujungnya menginisialisasi direktori semasa; jika tidak AZD boleh mencipta subdirektori tanpa menukar direktori kerja shell anda.

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
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chat AI asas | OpenAI + Aplikasi Kontena |

---

## 💰 Kesedaran Kos

Ini adalah julat ilustrasi, bukan sebut harga atau had; trafik model, Search/compute SKU, rantau, dan ciri pilihan boleh melebihi mereka. Semak panduan harga semasa sampel pilihan anda sebelum menyediakan.

| Persekitaran | Anggaran Kos Bulanan |
|-------------|----------------------|
| Pembangunan | $80-150 |
| Penstaging | $150-300 |
| Pengeluaran | $300-3,500+ |

**Petua:** Jalankan `azd down` selepas ujian untuk mengelakkan caj.

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