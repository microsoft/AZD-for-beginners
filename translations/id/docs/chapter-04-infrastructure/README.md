# Bab 4: Infrastruktur sebagai Kode & Deployment

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1-1,5 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membahas pola Infrastruktur sebagai Kode (IaC) dengan template Bicep, penyediaan sumber daya, dan strategi deployment menggunakan Azure Developer CLI.

> Divalidasi dengan `azd 1.27.1` pada Juli 2026.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami struktur dan sintaks template Bicep
- Menyediakan sumber daya Azure dengan `azd provision`
- Mendeploy aplikasi dengan `azd deploy`
- Menerapkan strategi deployment blue-green dan rolling

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|----------|-----------|-------|
| 1 | [Provisioning Resources](provisioning.md) | Manajemen sumber daya Azure dengan AZD | 45 menit |
| 2 | [Deployment Guide](deployment-guide.md) | Strategi deployment aplikasi | 45 menit |
| 3 | [Authoring Your Own Template](custom-templates.md) | Membangun dan menerbitkan template azd yang dapat digunakan ulang | 30 menit |

---

## 🚀 Mulai Cepat

```bash
# Inisialisasi dari template
azd init --template azure-functions-python-v2-http

# Pratinjau apa yang akan dibuat
azd provision --preview

# Menyediakan infrastruktur saja
azd provision

# Menyebarkan kode saja
azd deploy

# Atau keduanya bersama-sama
azd up
```

---

## 📁 Struktur Proyek AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Perintah Dasar

| Perintah | Deskripsi |
|---------|-----------|
| `azd init` | Inisialisasi proyek |
| `azd provision` | Membuat sumber daya Azure |
| `azd deploy` | Mendeploy kode aplikasi |
| `azd up` | provision + deploy |
| `azd down` | Menghapus semua sumber daya |

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Berikutnya** | [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md) |

---

## 📖 Sumber Terkait

- [Pemeriksaan Pra-Deployment](../chapter-06-pre-deployment/README.md)
- [Contoh Aplikasi Container](../../examples/container-app/README.md)
- [Contoh Aplikasi Database](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya untuk mencapai akurasi, harap diketahui bahwa terjemahan otomatis mungkin mengandung kesalahan atau ketidakakuratan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber yang sah. Untuk informasi penting, disarankan menggunakan terjemahan profesional oleh manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau penafsiran yang keliru yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->