# Chapter 4: Infrastruktur sebagai Kod & Penghantaran

**📚 Kursus**: [AZD Untuk Pemula](../../README.md) | **⏱️ Tempoh**: 1-1.5 jam | **⭐ Tahap Kesukaran**: Pertengahan

---

## Gambaran Keseluruhan

Bab ini merangkumi corak Infrastruktur sebagai Kod (IaC) dengan templat Bicep, penyediaan sumber, dan strategi penghantaran menggunakan Azure Developer CLI.

> Disahkan menggunakan `azd 1.23.12` pada Mac 2026.

## Objektif Pembelajaran

Dengan menamatkan bab ini, anda akan:
- Memahami struktur dan sintaks templat Bicep
- Menyediakan sumber Azure dengan `azd provision`
- Menghantar aplikasi dengan `azd deploy`
- Melaksanakan strategi penghantaran biru-hijau dan bergulung

---

## 📚 Pelajaran

| # | Pelajaran | Penerangan | Masa |
|---|-----------|------------|------|
| 1 | [Penyediaan Sumber](provisioning.md) | Pengurusan sumber Azure dengan AZD | 45 min |
| 2 | [Panduan Penghantaran](deployment-guide.md) | Strategi penghantaran aplikasi | 45 min |

---

## 🚀 Mula Pantas

```bash
# Mulakan dari templat
azd init --template azure-functions-python-v2-http

# Pratonton apa yang akan dicipta
azd provision --preview

# Sediakan infrastruktur sahaja
azd provision

# Hantar kod sahaja
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
| `azd init` | Inisialisasi projek |
| `azd provision` | Membuat sumber Azure |
| `azd deploy` | Menghantar kod aplikasi |
| `azd up` | sediakan + hantar |
| `azd down` | Padam semua sumber |

---

## 🔗 Navigasi

| Arah | Bab |
|-------|---------|
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
Dokumen ini telah diterjemahkan menggunakan perkhidmatan terjemahan AI [Co-op Translator](https://github.com/Azure/co-op-translator). Walaupun kami berusaha untuk ketepatan, sila ambil maklum bahawa terjemahan automatik mungkin mengandungi kesilapan atau ketidaktepatan. Dokumen asal dalam bahasa asalnya harus dianggap sebagai sumber yang sahih. Untuk maklumat penting, terjemahan profesional oleh manusia adalah disyorkan. Kami tidak bertanggungjawab terhadap sebarang salah faham atau salah tafsir yang timbul daripada penggunaan terjemahan ini.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->