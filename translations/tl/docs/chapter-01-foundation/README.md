# Kabanata 1: Pundasyon at Mabilis na Simula

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 30-45 minuto | **⭐ Kompleksidad**: Baguhan

---

## Pangkalahatang-ideya

Ang kabanatang ito ay nagpapakilala sa mga pangunahing kaalaman ng Azure Developer CLI (azd). Malalaman mo ang mga pangunahing konsepto, mag-i-install ng mga tool, at ide-deploy ang iyong unang aplikasyon sa Azure.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Maunawaan kung ano ang Azure Developer CLI at paano ito naiiba mula sa Azure CLI
- Mag-install at mag-configure ng AZD sa iyong platform
- I-deploy ang iyong unang aplikasyon sa Azure gamit ang `azd up`
- Linisin ang mga resource gamit ang `azd down`

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Batayan ng AZD](azd-basics.md) | Pangunahing konsepto, terminolohiya, at istruktura ng proyekto | 15 min |
| 2 | [Pag-install at Pagsasaayos](installation.md) | Mga gabay sa pag-install na naka-akma sa platform | 10 min |
| 3 | [Ang Iyong Unang Proyekto](first-project.md) | Praktikal: I-deploy ang isang web app sa Azure | 20 min |

---

## 🚀 Mabilis na Simula

```bash
# Suriin ang pag-install
azd version

# Mag-login sa Azure
azd auth login

# I-deploy ang iyong unang app
azd init --template todo-nodejs-mongo
azd up

# Linisin kapag tapos na
azd down --force --purge
```

---

## ✅ Mga Pamantayan ng Tagumpay

Pagkatapos tapusin ang kabanatang ito, dapat mong magawa:

```bash
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalisa ang proyekto
azd up                   # Ina-deploy sa Azure
azd show                 # Ipinapakita ang URL ng tumatakbong app
azd down --force --purge # Nililinis ang mga resource
```

---

## 🔗 Nabigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Susunod** | [Kabanata 2: Pag-unlad na Pinangungunahan ng AI](../chapter-02-ai-development/README.md) |
| **Laktawan sa** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |

---

## 📖 Kaugnay na Mga Mapagkukunan

- [Cheat Sheet ng Mga Utos](../../resources/cheat-sheet.md)
- [FAQ (Mga Madalas Itanong)](../../resources/faq.md)
- [Talasalitaan](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin na pinapagana ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring bilang opisyal na sanggunian. Para sa mga kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na magmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->