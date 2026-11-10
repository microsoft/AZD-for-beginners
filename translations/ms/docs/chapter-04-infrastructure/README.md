# Bab 4: Infrastruktur sebagai Kod & Penghantaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 2-3 jam bacaan; beri masa tambahan untuk latihan penghantaran | **⭐ Kerumitan**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini merangkumi corak Infrastruktur sebagai Kod (IaC) dengan templat Bicep, penyediaan sumber, dan strategi penghantaran menggunakan Azure Developer CLI.

> Sasaran semakan arahan dan konfigurasi: `azd 1.37.2` (November 2026). Penyediaan Azure secara langsung tidak dijalankan semasa semakan.

## Objektif Pembelajaran

Dengan menyelesaikan bab ini, anda akan:
- Memahami struktur dan sintaks templat Bicep
- Menyediakan sumber Azure dengan `azd provision`
- Menghantar aplikasi dengan `azd deploy`
- Melaksanakan strategi penghantaran hijau-biru dan berperingkat

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|--------|-------------|------|
| 1 | [Penyediaan Sumber](provisioning.md) | Pengurusan sumber Azure dengan AZD | 45 min |
| 2 | [Panduan Penghantaran](deployment-guide.md) | Strategi penghantaran aplikasi | 45 min |
| 3 | [Membuat Templat Sendiri](custom-templates.md) | Membina dan menerbitkan templat azd yang boleh digunakan semula | 30 min |

---

## 🚀 Mula Pantas

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
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
| `azd provision` | Cipta sumber Azure |
| `azd deploy` | Hantar kod aplikasi |
| `azd up` | sediakan + hantar |
| `azd down` | Padam semua sumber |

---

## 🔗 Navigasi

| Arah | Bab |
|-----------|---------|
| **Sebelum** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Seterusnya** | [Bab 5: Penyelesaian Pelbagai Ejen](../chapter-05-multi-agent/README.md) |

---

## 📖 Sumber Berkaitan

- [Pemeriksaan Pra-Penghantaran](../chapter-06-pre-deployment/README.md)
- [Contoh Aplikasi Kontena](../../examples/container-app/README.md)
- [Contoh Aplikasi Pangkalan Data](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Penafian**:
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan oleh manusia profesional adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->