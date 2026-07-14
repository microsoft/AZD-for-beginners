# Kabanata 1: Pundasyon at Mabilis na Pagsisimula

**📚 Kurso**: [AZD Para sa mga Baguhan](../../README.md) | **⏱️ Tagal**: 30-45 minuto | **⭐ Antas ng Hirap**: Baguhan

---

## Pangkalahatang-ideya

Ipinapakilala sa kabanatang ito ang mga pundasyon ng Azure Developer CLI (azd). Matututuhan mo ang mga pangunahing konsepto, paano i-install ang mga kasangkapan, at paano i-deploy ang iyong unang aplikasyon sa Azure.

> Na-validate gamit ang `azd 1.27.1` noong Hulyo 2026.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, magagawa mo:
- Maunawaan kung ano ang Azure Developer CLI at kung paano ito naiiba sa Azure CLI
- Mag-install at mag-configure ng AZD sa iyong plataporma
- I-deploy ang iyong unang aplikasyon sa Azure gamit ang `azd up`
- Linisin ang mga resources gamit ang `azd down`

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Pangunahing Kaalaman sa AZD](azd-basics.md) | Pangunahing mga konsepto, terminolohiya, at istruktura ng proyekto | 15 min |
| 2 | [Pag-install at Setup](installation.md) | Mga gabay sa pag-install para sa partikular na plataporma | 10 min |
| 3 | [Ang Iyong Unang Proyekto](first-project.md) | Hands-on: I-deploy ang isang web app sa Azure | 20 min |
| 4 | [Dalhin ang Sariling App](bring-your-own-app.md) | Idagdag ang azd sa umiiral mong proyekto | 15 min |
| 5 | [Mga Dev Containers at Codespaces](dev-containers.md) | Maaaring ulit-uliting azd environment gamit ang dev containers | 15 min |

---

## ✅ Magsimula Dito: I-validate ang Iyong Setup

Bago ka magsimula, siguraduhing handa ang iyong lokal na makina para sa template ng Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung iniulat ng script na may mga kulang na kasangkapan, ayusin muna ang mga iyon bago magpatuloy sa kabanata.

---

## 🚀 Mabilis na Pagsisimula

```bash
# Suriin ang pag-install
azd version

# Mag-authenticate para sa AZD
# Opsyonal: az login kung plano mong magpatakbo ng mga Azure CLI na utos nang direktang
azd auth login

# I-deploy ang iyong unang app
azd init --template todo-nodejs-mongo
azd up

# Linisin kapag tapos na
azd down --force --purge
```

---

## ✅ Mga Pamantayan sa Tagumpay

Pagkatapos makumpleto ang kabanatang ito, dapat ay kaya mong:

```bash
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalis ang proyekto
azd up                   # Naglalagay sa Azure
azd show                 # Ipinapakita ang URL ng tumatakbong app
azd down --force --purge # Nililinis ang mga resources
```

---

## 🔗 Navigasyon

| Direksyon | Kabanata |
|-----------|---------|
| **Susunod** | [Kabanata 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Laktawan sa** | [Kabanata 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Kaugnay na mga Mapagkukunan

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->