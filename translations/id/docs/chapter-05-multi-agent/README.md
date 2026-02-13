# Bab 5: Solusi AI Multi-Agen

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 2-3 jam | **⭐ Complexity**: Lanjutan

---

## Ikhtisar

Bab ini membahas pola arsitektur multi-agen tingkat lanjut, orkestrasi agen, dan penyebaran AI siap produksi untuk skenario kompleks.

## Tujuan Pembelajaran

By completing this chapter, you will:
- Memahami pola arsitektur multi-agen
- Menyebarkan sistem agen AI yang terkoordinasi
- Mengimplementasikan komunikasi antar-agen
- Membangun solusi multi-agen siap produksi

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Solusi Multi-Agen Ritel](../../examples/retail-scenario.md) | Panduan implementasi lengkap | 90 menit |
| 2 | [Pola Koordinasi](../chapter-06-pre-deployment/coordination-patterns.md) | Strategi orkestrasi agen | 30 menit |
| 3 | [Penyebaran Template ARM](../../examples/retail-multiagent-arm-template/README.md) | Penyebaran sekali klik | 30 menit |

---

## 🚀 Mulai Cepat

```bash
# Terapkan solusi multi-agen ritel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Atau gunakan templat langsung
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Arsitektur Multi-Agen

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Solusi Unggulan: Multi-Agen Ritel

Solusi [Solusi Multi-Agen Ritel](../../examples/retail-scenario.md) menunjukkan:

- **Agen Pelanggan**: Menangani interaksi pengguna dan preferensi
- **Agen Inventaris**: Mengelola stok dan pemrosesan pesanan
- **Orkestrator**: Mengkoordinasikan antar-agen
- **Memori Bersama**: Manajemen konteks lintas-agen

### Layanan yang Digunakan

| Layanan | Tujuan |
|---------|---------|
| Azure OpenAI | Pemahaman bahasa |
| Azure AI Search | Katalog produk |
| Cosmos DB | Status dan memori agen |
| Container Apps | Hosting agen |
| Application Insights | Pemantauan |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Berikutnya** | [Bab 6: Pra-Penyebaran](../chapter-06-pre-deployment/README.md) |

---

## 📖 Sumber Terkait

- [Panduan Agen AI](../chapter-02-ai-development/agents.md)
- [Praktik AI Produksi](../chapter-08-production/production-ai-practices.md)
- [Pemecahan Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang berwenang. Untuk informasi yang bersifat penting atau krusial, disarankan menggunakan jasa penerjemah profesional manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->