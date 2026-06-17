# Bab 4: Infrastruktur sebagai Kod & Penghantaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-1.5 jam | **⭐ Kerumitan**: Sederhana

---

## Gambaran Keseluruhan

Bab ini merangkumi corak Infrastruktur sebagai Kod (IaC) dengan templat Bicep, penyediaan sumber, dan strategi penghantaran menggunakan Azure Developer CLI.

> Disahkan terhadap `azd 1.25.6` pada Jun 2026.

## Objektif Pembelajaran

Dengan melengkapkan bab ini, anda akan:
- Memahami struktur dan sintaks templat Bicep
- Menyediakan sumber Azure dengan `azd provision`
- Menghantar aplikasi dengan `azd deploy`
- Melaksanakan strategi penghantaran blue-green dan rolling

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Penyediaan Sumber](provisioning.md) | Pengurusan sumber Azure dengan AZD | 45 min |
| 2 | [Panduan Penghantaran](deployment-guide.md) | Strategi penghantaran aplikasi | 45 min |
| 3 | [Membuat Templat Sendiri](custom-templates.md) | Membina dan menerbitkan templat azd boleh guna semula | 30 min |

---

## 🚀 Mula Cepat

```bash
# Mulakan dari templat
azd init --template azure-functions-python-v2-http

# Pratonton apa yang akan dibuat
azd provision --preview

# Menyediakan infrastruktur sahaja
azd provision

# Melaksanakan kod sahaja
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

## 🔧 Perintah Penting

| Perintah | Penerangan |
|----------|------------|
| `azd init` | Memulakan projek |
| `azd provision` | Membuat sumber Azure |
| `azd deploy` | Menghantar kod aplikasi |
| `azd up` | sediakan + hantar |
| `azd down` | Padam semua sumber |

---

## 🔗 Navigasi

| Arah | Bab |
|-------|-----|
| **Sebelumnya** | [Bab 3: Konfigurasi](../chapter-03-configuration/README.md) |
| **Seterusnya** | [Bab 5: Penyelesaian Multi-Ejen](../chapter-05-multi-agent/README.md) |

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