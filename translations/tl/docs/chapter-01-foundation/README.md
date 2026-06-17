# Kabanata 1: Pundasyon at Mabilis na Pagsisimula

**📚 Kurso**: [AZD For Beginners](../../README.md) | **⏱️ Tagal**: 30-45 minuto | **⭐ Antas ng Kahirapan**: Baguhan

---

## Pangkalahatang-ideya

Ipinapakilala ng kabanatang ito ang mga pangunahing kaalaman ng Azure Developer CLI (azd). Matututuhan mo ang mga pangunahing konsepto, i-install ang mga tool, at i-deploy ang iyong unang aplikasyon sa Azure.

> Napatunayan gamit ang `azd 1.25.6` noong Hunyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Maunawaan kung ano ang Azure Developer CLI at kung paano ito naiiba mula sa Azure CLI
- I-install at i-configure ang AZD sa iyong plataporma
- I-deploy ang iyong unang aplikasyon sa Azure gamit ang `azd up`
- Linisin ang mga resources gamit ang `azd down`

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Pundamental ng AZD](azd-basics.md) | Mga pangunahing konsepto, terminolohiya, at istruktura ng proyekto | 15 minuto |
| 2 | [Pag-install at Pag-setup](installation.md) | Mga gabay sa pag-install ayon sa plataporma | 10 minuto |
| 3 | [Ang Iyong Unang Proyekto](first-project.md) | Praktikal: I-deploy ang isang web app sa Azure | 20 minuto |
| 4 | [Dalhin ang Sariling App](bring-your-own-app.md) | Idagdag ang azd sa isang umiiral na proyekto na mayroon ka na | 15 minuto |
| 5 | [Dev Containers & Codespaces](dev-containers.md) | Mga reproducible na kapaligiran ng azd gamit ang dev containers | 15 minuto |

---

## ✅ Magsimula Dito: Suriin ang Iyong Setup

Bago ka magsimula, kumpirmahin na ang iyong lokal na makina ay handa para sa template ng Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung ang script ay nag-uulat ng mga nawawalang tool, ayusin muna ang mga iyon at pagkatapos ay magpatuloy sa kabanata.

---

## 🚀 Mabilis na Pagsisimula

```bash
# Suriin ang pag-install
azd version

# Mag-authenticate para sa AZD
# Opsyonal: az login kung plano mong magpatakbo ng mga utos ng Azure CLI nang direkta
azd auth login

# I-deploy ang iyong unang app
azd init --template todo-nodejs-mongo
azd up

# Linisin kapag tapos na
azd down --force --purge
```

---

## ✅ Pamantayan ng Tagumpay

Pagkatapos kumpletuhin ang kabanatang ito, dapat mong magawa ang mga sumusunod:

```bash
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-initialize ang proyekto
azd up                   # Ina-deploy sa Azure
azd show                 # Ipinapakita ang URL ng tumatakbong app
azd down --force --purge # Nililinis ang mga resource
```

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Susunod** | [Kabanata 2: Pag-develop na Pinapangunahan ng AI](../chapter-02-ai-development/README.md) |
| **Tumalon sa** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Cheat Sheet ng Mga Utos](../../resources/cheat-sheet.md)
- [Mga Madalas Itanong (FAQ)](../../resources/faq.md)
- [Glosaryo](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->