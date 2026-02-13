# Bab 4: Infrastruktur sebagai Kode & Penerapan

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Durasi**: 1-1.5 jam | **⭐ Kompleksitas**: Menengah

---

## Ikhtisar

Bab ini membahas pola Infrastructure as Code (IaC) dengan template Bicep, penyediaan sumber daya, dan strategi penerapan menggunakan Azure Developer CLI.

## Tujuan Pembelajaran

Dengan menyelesaikan bab ini, Anda akan:
- Memahami struktur dan sintaks template Bicep
- Menyediakan sumber daya Azure dengan `azd provision`
- Menerapkan aplikasi dengan `azd deploy`
- Menerapkan strategi blue-green dan rolling

---

## 📚 Pelajaran

| # | Pelajaran | Deskripsi | Waktu |
|---|--------|-------------|------|
| 1 | [Penyediaan Sumber Daya](provisioning.md) | Manajemen sumber daya Azure dengan AZD | 45 menit |
| 2 | [Panduan Penerapan](deployment-guide.md) | Strategi penerapan aplikasi | 45 menit |

---

## 🚀 Mulai Cepat

```bash
# Inisialisasi dari templat
azd init --template azure-functions-python-v2-http

# Pratinjau apa yang akan dibuat
azd provision --preview

# Hanya menyediakan infrastruktur
azd provision

# Hanya menerapkan kode
azd deploy

# Atau keduanya sekaligus
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

## 🔧 Perintah Penting

| Perintah | Deskripsi |
|---------|-------------|
| `azd init` | Inisialisasi proyek |
| `azd provision` | Membuat sumber daya Azure |
| `azd deploy` | Menerapkan kode aplikasi |
| `azd up` | provision + deploy |
| `azd down` | Menghapus semua sumber daya |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Berikutnya** | [Bab 5: Solusi Multi-Agen](../chapter-05-multi-agent/README.md) |

---

## 📖 Sumber Daya Terkait

- [Pemeriksaan Pra-Penerapan](../chapter-06-pre-deployment/README.md)
- [Contoh Aplikasi Kontainer](../../examples/container-app/README.md)
- [Contoh Aplikasi Basis Data](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan layanan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Meskipun kami berupaya mencapai ketepatan, harap diperhatikan bahwa terjemahan otomatis dapat mengandung kesalahan atau ketidaktepatan. Dokumen asli dalam bahasa aslinya harus dianggap sebagai sumber otoritatif. Untuk informasi yang bersifat kritis, disarankan menggunakan terjemahan profesional oleh penerjemah manusia. Kami tidak bertanggung jawab atas kesalahpahaman atau salah tafsir yang timbul dari penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->