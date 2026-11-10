# Bab 5: Solusi AI Multi-Agen

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 2-3 jam | **⭐ Kompleksitas**: Lanjutan

---

## Ikhtisar

Bab ini membahas pola arsitektur multi-agen lanjutan, orkestrasi agen, dan penerapan AI siap produksi untuk skenario kompleks.

> Panduan perintah ditinjau terhadap referensi `azd 1.37.2` yang dirilis. Penerapan cloud tidak dijalankan.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami pola arsitektur multi-agen
- Menerapkan sistem agen AI yang terkoordinasi
- Mengimplementasikan komunikasi antar-agen
- Membangun solusi multi-agen siap produksi

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Dasar Multi-Agen](multi-agent-basics.md) | Praktik langsung: terapkan aplikasi multi-agen yang berfungsi dengan `azd up` | 45 menit |
| 2 | [Pola Koordinasi](../chapter-06-pre-deployment/coordination-patterns.md) | Strategi orkestrasi agen (berlanjut di Bab 6) | 30 menit |
| 3 | [Penerapan Template ARM](../../examples/retail-multiagent-arm-template/README.md) | Contoh penerapan satu-klik | 30 menit |

> **Mulai dengan Pelajaran 1.** Ini satu-satunya pelajaran yang sepenuhnya praktis dan dapat diterapkan dalam bab ini. Pelajaran 2 ada di Bab 6 (dibagikan dengan perencanaan pra-penerapan), dan [Solusi Multi-Agen Retail](../../examples/retail-scenario.md) adalah cetak biru arsitektur—referensi desain, bukan template perintah tunggal.

---

## 🚀 Mulai Cepat

```bash
# Option 1: Deploy the multi-agent template used in Lesson 1
azd init --template Azure-Samples/contoso-creative-writer .
azd up

# Option 2: Initialize a Foundry agent interactively (requires azure.ai.agents)
azd extension install azure.ai.agents
azd ai agent init
azd up
```

> **Pendekatan mana?** Gunakan `azd init --template` untuk mulai dari sampel yang berfungsi. Gunakan `azd ai agent init` secara interaktif, atau `azd ai agent init --template <path-to-azure.yaml>` untuk mengadopsi proyek agen saat ini. Lihat [referensi AZD AI CLI](../chapter-08-production/production-ai-practices.md#azd-ai-cli-commands-and-extensions) untuk persyaratan versi dan migrasi evaluasi.

Jalankan alternatif-alternatif ini di folder kosong yang terpisah. Ekstensi agen `1.0.0-beta.23` membutuhkan `azd >= 1.37.0`; alur interaktifnya tidak menghasilkan pipeline Service Bus khusus dalam pelajaran koordinasi.

---

## 🤖 Arsitektur Multi-Agen

```mermaid
graph TD
    Orchestrator[Orchestrator Agent<br/>Routes requests, manages workflow] --> Customer[Customer Agent<br/>User queries, preferences]
    Orchestrator --> Inventory[Inventory Agent<br/>Stock levels, orders]
```

---

## 🎯 Solusi Unggulan: Retail Multi-Agen

Solusi [Multi-Agen Ritel](../../examples/retail-scenario.md) menunjukkan:

- **Agen Pelanggan**: Menangani interaksi dan preferensi pengguna
- **Agen Inventaris**: Mengelola stok dan pemrosesan pesanan
- **Orkestrator**: Mengkoordinasikan antar agen
- **Memori Bersama**: Manajemen konteks lintas agen

### Layanan yang Digunakan

| Layanan | Tujuan |
|---------|---------|
| Microsoft Foundry Models | Pemahaman bahasa |
| Azure AI Search | Katalog produk |
| Cosmos DB | Status dan memori agen |
| Container Apps | Hosting agen |
| Application Insights | Pemantauan |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Berikutnya** | [Bab 6: Pra-Penerapan](../chapter-06-pre-deployment/README.md) |

---

## 📖 Sumber Terkait

- [Panduan Agen AI](../chapter-02-ai-development/agents.md)
- [Praktik Produksi AI](../chapter-08-production/production-ai-practices.md)
- [Pemecahan Masalah AI](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->