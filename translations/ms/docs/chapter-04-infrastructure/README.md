# Bab 4: Infrastruktur sebagai Kod & Penyebaran

**📚 Kursus**: [AZD For Beginners](../../README.md) | **⏱️ Tempoh**: 1-1.5 hours | **⭐ Kerumitan**: Intermediate

---

## Gambaran Keseluruhan

Bab ini merangkumi corak Infrastruktur sebagai Kod (IaC) dengan templat Bicep, penyediaan sumber, dan strategi penyebaran menggunakan Azure Developer CLI.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Memahami struktur dan sintaks templat Bicep
- Menyediakan sumber Azure dengan `azd provision`
- Menyebarkan aplikasi dengan `azd deploy`
- Melaksanakan strategi penyebaran blue-green dan rolling

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Pengurusan sumber Azure dengan AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Strategi penyebaran aplikasi | 45 min |

---

## 🚀 Mula Pantas

```bash
# Inisialisasi daripada templat
azd init --template azure-functions-python-v2-http

# Pratonton apa yang akan dibuat
azd provision --preview

# Sediakan infrastruktur sahaja
azd provision

# Terapkan kod sahaja
azd deploy

# Atau kedua-duanya serentak
azd up
```

---

## 📁 Struktur Projek AZD

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

## 🔧 Arahan Penting

| Arahan | Penerangan |
|---------|-------------|
| `azd init` | Inisialisasi projek |
| `azd provision` | Membuat sumber Azure |
| `azd deploy` | Menyebarkan kod aplikasi |
| `azd up` | sediakan + sebarkan |
| `azd down` | Padam semua sumber |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Seterusnya** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Sumber Berkaitan

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Penafian:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi ralat atau ketidaktepatan. Dokumen asal dalam bahasa asalnya hendaklah dianggap sebagai sumber yang sahih. Bagi maklumat penting, terjemahan profesional oleh penterjemah manusia adalah disyorkan. Kami tidak bertanggungjawab ke atas sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->