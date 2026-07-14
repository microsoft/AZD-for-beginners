# Bab 4: Infrastruktur sebagai Kod & Penyebaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-1.5 jam | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini merangkumi corak Infrastruktur sebagai Kod (IaC) dengan templat Bicep, penyediaan sumber, dan strategi penyebaran menggunakan Azure Developer CLI.

> Disahkan menggunakan `azd 1.27.1` pada Julai 2026.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Memahami struktur dan sintaks templat Bicep
- Menyediakan sumber Azure dengan `azd provision`
- Menyebarkan aplikasi dengan `azd deploy`
- Melaksanakan strategi penyebaran biru-hijau dan bergulung

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Penyediaan Sumber](provisioning.md) | Pengurusan sumber Azure dengan AZD | 45 min |
| 2 | [Panduan Penyebaran](deployment-guide.md) | Strategi penyebaran aplikasi | 45 min |
| 3 | [Menulis Templat Anda Sendiri](custom-templates.md) | Membangun dan menerbitkan templat azd yang boleh digunakan semula | 30 min |

---

## 🚀 Mula Dengan Cepat

```bash
# Mulakan dari templat
azd init --template azure-functions-python-v2-http

# Pratonton apa yang akan dibuat
azd provision --preview

# Sediakan infrastruktur sahaja
azd provision

# Pasang kod sahaja
azd deploy

# Atau kedua-duanya bersama-sama
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
| `azd init` | Memulakan projek |
| `azd provision` | Membuat sumber Azure |
| `azd deploy` | Menyebarkan kod aplikasi |
| `azd up` | menyediakan + menyebar |
| `azd down` | Memadam semua sumber |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelumnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Seterusnya** | [Bab 5: Penyelesaian Multi-Ejen](../chapter-05-multi-agent/README.md) |

---

## 📖 Sumber Berkaitan

- [Semakan Pra-Penyebaran](../chapter-06-pre-deployment/README.md)
- [Contoh Apl Kontena](../../examples/container-app/README.md)
- [Contoh Apl Pangkalan Data](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->