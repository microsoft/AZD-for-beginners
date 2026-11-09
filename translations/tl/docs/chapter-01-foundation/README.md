# Kabanata 1: Pundasyon at Mabilisang Simula

**📚 Kurso**: [AZD Para sa Mga Nagsisimula](../../README.md) | **⏱️ Tagal**: 75-120 minuto kasama ang unang deployment; mas matagal para sa karagdagang mga pagsasanay | **⭐ Antas ng Hirap**: Baguhan

---

## Pangkalahatang-ideya

Ipinapakilala ng kabanatang ito ang mga pundasyon ng Azure Developer CLI (azd). Matututuhan mo ang mga pangunahing konsepto, paano mag-install ng mga kasangkapan, at paano mag-deploy ng iyong unang aplikasyon sa Azure.

> Target sa pagsusuri ng utos at konfigurasyon: `azd 1.37.2` (Nobyembre 2026). Hindi isinagawa ang live na provisioning ng Azure sa panahon ng pagsusuri.

## Mga Layunin sa Pagkatuto

Sa pagtatapos ng kabanatang ito, kaya mong:
- Maunawaan kung ano ang Azure Developer CLI at kung paano ito naiiba mula sa Azure CLI
- Mag-install at mag-configure ng AZD sa iyong platform
- Mag-deploy ng iyong unang aplikasyon sa Azure gamit ang `azd up`
- Linisin ang mga resources gamit ang `azd down`

---

## 📚 Mga Aralin

| # | Aralin | Paglalarawan | Oras |
|---|--------|-------------|------|
| 1 | [Mga Pangunahing Kaalaman sa AZD](azd-basics.md) | Mga pangunahing konsepto, terminolohiya, at estruktura ng proyekto | 15 min |
| 2 | [Pag-install at Setup](installation.md) | Mga gabay para sa pag-install sa partikular na platform | 10 min |
| 3 | [Ang Iyong Unang Proyekto](first-project.md) | Praktikal: Mag-deploy ng web app sa Azure | 20 min |
| 4 | [Dalhin Ang Sariling App](bring-your-own-app.md) | Idagdag ang azd sa isang umiiral nang proyekto na meron ka na | 15 min |
| 5 | [Dev Containers at Codespaces](dev-containers.md) | Pabalik-balik na mga kapaligiran ng azd gamit ang dev containers | 15 min |

---

## ✅ Magsimula Dito: Patunayan ang Iyong Setup

Bago ka magsimula, kumpirmahin na handa ang iyong lokal na makina para sa template ng Kabanata 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung iniulat ng script na may kulang na mga kasangkapan, ayusin muna ang mga iyon bago magpatuloy sa kabanata.

---

## 🚀 Mabilisang Simula

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Mga Pamantayan ng Tagumpay

Pagkatapos makumpleto ang kabanatang ito, dapat mong magawa ang mga sumusunod:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Pag-navigate

| Direksyon | Kabanata |
|-----------|---------|
| **Susunod** | [Kabanata 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Laktawan sa** | [Kabanata 3: Konfigurasyon](../chapter-03-configuration/README.md) |

---

## 📖 Mga Kaugnay na Mapagkukunan

- [Command Cheat Sheet](../../resources/cheat-sheet.md)
- [FAQ](../../resources/faq.md)
- [Glossary](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->