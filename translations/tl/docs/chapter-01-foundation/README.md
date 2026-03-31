# Kabanata 1: Panimula at Mabilisang Pagsisimula

**📚 Course**: [AZD Para sa Mga Baguhan](../../README.md) | **⏱️ Duration**: 30-45 minuto | **⭐ Complexity**: Baguhan

---

## Pangkalahatang-ideya

Ang kabanatang ito ay nagpapakilala sa mga pundasyon ng Azure Developer CLI (azd). Matututuhan mo ang mga pangunahing konsepto, i-install ang mga kasangkapan, at i-deploy ang iyong unang aplikasyon sa Azure.

> Napatunayan gamit `azd 1.23.12` noong Marso 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Maunawaan kung ano ang Azure Developer CLI at paano ito naiiba sa Azure CLI
- I-install at i-configure ang AZD sa iyong platform
- I-deploy ang iyong unang aplikasyon sa Azure gamit ang `azd up`
- Linisin ang mga resources gamit ang `azd down`

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|--------------|------|
| 1 | [Mga Pangunahing Kaalaman sa AZD](azd-basics.md) | Pangunahing mga konsepto, terminolohiya, at istruktura ng proyekto | 15 min |
| 2 | [Pag-install at Pag-setup](installation.md) | Mga gabay sa pag-install ayon sa platform | 10 min |
| 3 | [Ang Iyong Unang Proyekto](first-project.md) | Praktikal: I-deploy ang isang web app sa Azure | 20 min |

---

## ✅ Magsimula Dito: Suriin ang Iyong Setup

Bago ka magsimula, tiyaking handa ang iyong lokal na makina para sa template ng Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung iniulat ng script na may kulang na mga kasangkapan, ayusin ang mga iyon muna bago magpatuloy sa kabanata.

---

## 🚀 Mabilisang Pagsisimula

```bash
# Suriin ang pag-install
azd version

# Mag-authenticate para sa AZD
# Opsyonal: az login kung plano mong direktang patakbuhin ang mga utos ng Azure CLI
azd auth login

# I-deploy ang iyong unang app
azd init --template todo-nodejs-mongo
azd up

# Maglinis kapag tapos na
azd down --force --purge
```

---

## ✅ Pamantayan ng Tagumpay

Pagkatapos tapusin ang kabanatang ito, dapat mong magawang:

```bash
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # I-initialize ang proyekto
azd up                   # Idine-deploy sa Azure
azd show                 # Ipinapakita ang URL ng tumatakbong app
azd down --force --purge # Nililinis ang mga resources
```

---

## 🔗 Nabigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Next** | [Kabanata 2: Pag-develop na Unahin ang AI](../chapter-02-ai-development/README.md) |
| **Skip to** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Mabilisang Sanggunian ng Mga Utos](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Talasalitaan](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Ang dokumentong ito ay isinalin gamit ang serbisyong AI na pagsasalin [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o kamalian. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin mula sa isang dalubhasang tagasalin. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->