# AZD Para sa mga Baguhan: Isang Istrakturadong Paglalakbay sa Pagkatuto

![AZD-para-sa-mga-baguhan](../../translated_images/tl/azdbeginners.5527441dd9f74068.webp) 

[![Mga tagasubaybay sa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Mga bituin sa GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Awtomatikong Pagsasalin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Mas gustong I-clone nang Lokal?**
>
> Ang repositoryong ito ay naglalaman ng 50+ na mga pagsasalin sa iba't ibang wika na lubhang nagpapalaki ng laki ng pag-download. Para mag-clone nang walang mga pagsasalin, gamitin ang sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Binibigyan ka nito ng lahat ng kailangan mo para kumpletuhin ang kurso na may mas mabilis na pag-download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ano'ng Bago sa azd Ngayon

Lumago ang Azure Developer CLI lampas sa tradisyunal na mga web app at API. Ngayon, ang azd ang nag-iisang tool para mag-deploy ng anumang aplikasyon sa Azure—kasama na ang mga aplikasyon na pinapatakbo ng AI at matatalinong ahente.

Narito kung ano ang ibig sabihin nito para sa iyo:

- **Ang mga AI agent ngayon ay first-class azd workloads.** Maaari mong i-initialize, i-deploy, at pamahalaan ang mga proyekto ng AI agent gamit ang parehong `azd init` → `azd up` na workflow na alam mo na.
- **Ang integrasyon ng Microsoft Foundry** ay nagdadala ng deployment ng modelo, pagho-host ng ahente, at konfigurasyon ng AI service direkta sa azd template ecosystem.
- **Hindi nagbago ang pangunahing workflow.** Kahit mag-deploy ka ng todo app, microservice, o multi-agent AI solution, pareho pa rin ang mga command.

Kung ginamit mo na ang azd dati, ang suporta para sa AI ay natural na pagpapalawak—hindi isang hiwalay na tool o advanced na track. Kung nagsisimula ka naman, matututo ka ng isang workflow na gumagana para sa lahat.

---

## 🚀 Ano ang Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ay isang developer-friendly na command-line tool na nagpapadali ng pag-deploy ng mga aplikasyon sa Azure. Sa halip na manu-manong gumawa at mag-konekta ng dose-dosenang Azure resources, maaari mong i-deploy ang buong aplikasyon gamit ang isang utos lamang.

### Ang Mahika ng `azd up`

```bash
# Ang iisang utos na ito ay gumagawa ng lahat:
# ✅ Lumilikha ng lahat ng Azure resources
# ✅ Nagse-setup ng networking at seguridad
# ✅ Binubuo ang code ng iyong aplikasyon
# ✅ Nagde-deploy sa Azure
# ✅ Nagbibigay sa iyo ng gumaganang URL
azd up
```

**'Yan na!** Walang pag-click sa Azure Portal, walang komplikadong ARM templates na kailangang aralin muna, walang manu-manong konfigurasyon — mga gumaganang aplikasyon na lamang sa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ano ang Pagkakaiba?

Ito ang pinaka-karaniwang tanong ng mga baguhan. Narito ang simpleng sagot:

| Katangian | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Layunin** | Pamahalaan ang indibidwal na Azure resources | I-deploy ang kumpletong mga aplikasyon |
| **Pananaw** | Nakatuon sa infrastruktura | Nakatuon sa aplikasyon |
| **Halimbawa** | `az webapp create --name myapp...` | `azd up` |
| **Antas ng Pagkatuto** | Kailangang malaman ang Azure services | Kailangan lang mong malaman ang iyong app |
| **Pinakamainam Para sa** | DevOps, Infrastruktura | Mga Developer, Prototyping |

### Simpleng Analohiya

- **Azure CLI** ay parang pagkakaroon ng lahat ng kasangkapan para magtayo ng bahay - mga martilyo, lagari, pako. Maaari kang gumawa ng anumang gusto mo, pero kailangan mong malaman ang konstruksyon.
- **Azure Developer CLI** ay parang pagkuha ng kontratista - ilarawan mo ang gusto mo, at sila ang bahala sa pagtatayo.

### Kailan Gamitin ang Bawat Isa

| Senaryo | Gamitin Ito |
|----------|----------|
| "Gusto kong i-deploy agad ang web app ko" | `azd up` |
| "Kailangan ko lang gumawa ng storage account" | `az storage account create` |
| "Nagtatayo ako ng buong AI application" | `azd init --template azure-search-openai-demo` |
| "Kailangan kong i-debug ang isang tiyak na Azure resource" | `az resource show` |
| "Gusto ko ng production-ready deployment sa loob ng ilang minuto" | `azd up --environment production` |

### Magkakasamang Gumagana!

Gumagamit ang AZD ng Azure CLI sa ilalim. Maaari mong gamitin ang pareho:
```bash
# I-deploy ang iyong app gamit ang AZD
azd up

# Pagkatapos ay i-fine-tune ang mga partikular na resource gamit ang Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Maghanap ng Mga Template sa Awesome AZD

Huwag magsimula mula sa wala! Ang **Awesome AZD** ay koleksyon ng komunidad ng mga template na handang i-deploy:

| Mapagkukunan | Paglalarawan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Mag-browse ng 200+ template na may one-click deploy |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Mag-ambag ng iyong sariling template sa komunidad |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | I-star at tuklasin ang source |

### Mga Sikat na AI Template mula sa Awesome AZD

```bash
# RAG Chat gamit ang Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Mabilis na AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents gamit ang Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Magsimula sa 3 Hakbang

Bago ka magsimula, tiyakin na handa ang iyong makina para sa template na nais mong i-deploy:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung may anumang kinakailangang tseke na pumalya, ayusin muna iyon at pagkatapos ay magpatuloy sa quick start.

### Hakbang 1: I-install ang AZD (2 minuto)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Hakbang 2: Mag-authenticate para sa AZD

```bash
# Opsyonal kung plano mong gamitin ang mga Azure CLI na utos nang direkta sa kursong ito
az login

# Kinakailangan para sa mga AZD workflow
azd auth login
```

Kung hindi ka sigurado kung alin ang kailangan mo, sundin ang buong setup flow sa [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hakbang 3: I-deploy ang Iyong Unang App

```bash
# I-initialize mula sa isang template
azd init --template todo-nodejs-mongo

# I-deploy sa Azure (gumagawa ng lahat!)
azd up
```

**🎉 'Yan na!** Ang iyong app ay naka-live na sa Azure.

### Linisin (Huwag Kalimutan!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Paano Gamitin ang Kurso na Ito

Dinisenyo ang kursong ito para sa **progresibong pagkatuto** - magsimula kung saan ka komportable at paakyat na pag-aralan:

| Iyong Karanasan | Magsimula Dito |
|-----------------|------------|
| **Baguhan sa Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Alam ang Azure, bago sa AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Gusto mag-deploy ng AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gusto ng hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 oras na guided lab |
| **Kailangan ng production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Mabilis na Setup

1. **I-fork ang Repositoryong Ito**: [![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone Ito**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Humingi ng Tulong**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Mas gustong I-clone nang Lokal?**

> Ang repositoryong ito ay naglalaman ng 50+ na mga pagsasalin sa iba't ibang wika na lubhang nagpapalaki ng laki ng pag-download. Para mag-clone nang walang mga pagsasalin, gamitin ang sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Binibigyan ka nito ng lahat ng kailangan mo para kumpletuhin ang kurso na may mas mabilis na pag-download.


## Pangkalahatang Balangkas ng Kurso

Pag-master ng Azure Developer CLI (azd) sa pamamagitan ng istrakturadong mga kabanata na dinisenyo para sa progresibong pagkatuto. **Espesyal na pokus sa pag-deploy ng AI application gamit ang integrasyon ng Microsoft Foundry.**

### Bakit Mahalaga ang Kursong Ito para sa Modernong Mga Developer

Batay sa mga insight mula sa Microsoft Foundry Discord community, **45% ng mga developer ay nais gumamit ng AZD para sa AI workloads** ngunit nahaharap sa mga hamon sa:
- Komplikadong multi-service AI architectures
- Mga best practice sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI service
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga ispesipikong isyu sa deployment ng AI

### Mga Layunin sa Pagkatuto

Sa pagkumpleto ng istrakturadong kursong ito, magagawa mong:
- **Ma-master ang Mga Pangunahing Konsepto ng AZD**: Mga core concept, instalasyon, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at mag-debug ng mga problema
- **Mag-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Bumuo ng Multi-Agent Solutions**: I-deploy ang mga kumplikadong AI architectures

## Bago Ka Magsimula: Mga Account, Pag-access, at Mga Palagay

Bago simulan ang Kabanata 1, tiyakin na nasa ayos ang mga sumusunod. Ipinagpapalagay ng mga hakbang sa pag-install sa susunod na bahagi ng gabay na ang mga pangunahing ito ay naayos na.
- **Isang Azure subscription**: Maaari mong gamitin ang umiiral na subscription mula sa trabaho o mula sa iyong sariling account, o lumikha ng isang [free trial](https://aka.ms/azurefreetrial) upang makapagsimula.
- **Pahintulot na lumikha ng mga Azure resources**: Para sa karamihan ng mga ehersisyo, dapat mayroon kang hindi bababa sa **Contributor** access sa target na subscription o resource group. Maaaring asahan din sa ilang mga kabanata na makakalikha ka ng resource groups, managed identities, at mga RBAC assignment.
- [**Isang GitHub account**](https://github.com): Kapaki-pakinabang ito para sa pag-fork ng repositoryo, pagsubaybay sa iyong sariling mga pagbabago, at paggamit ng GitHub Codespaces para sa workshop.
- **Mga kinakailangan sa runtime ng template**: Ang ilang mga template ay nangangailangan ng mga lokal na tool tulad ng Node.js, Python, Java, o Docker. Patakbuhin ang setup validator bago magsimula upang maagang mahuli ang mga nawawalang tool.
- **Pangunahing pamilyaridad sa terminal**: Hindi mo kailangang maging eksperto, ngunit dapat kang kumportable sa pagpapatakbo ng mga utos tulad ng `git clone`, `azd auth login`, at `azd up`.

> **Nagtatrabaho sa isang enterprise subscription?**
> Kung ang iyong Azure environment ay pinamamahalaan ng isang administrator, tiyaking maaga na kumpirmahin na maaari kang mag-deploy ng mga resource sa subscription o resource group na balak mong gamitin. Kung hindi, humiling ng sandbox subscription o Contributor access bago ka magsimula.

> **Bago sa Azure?**
> Magsimula sa iyong sariling Azure trial o pay-as-you-go subscription sa https://aka.ms/azurefreetrial upang makumpleto mo ang mga ehersisyo mula simula hanggang katapusan nang hindi naghihintay ng mga pag-apruba sa antas ng tenant.

## 🗺️ Mapa ng Kurso: Mabilis na Pag-navigate ayon sa Kabanata

Bawat kabanata ay may dedikadong README na may mga layunin sa pagkatuto, mabilis na panimulang gabay, at mga ehersisyo:

| Kabanata | Paksa | Mga Aralin | Tagal | Kompleksidad |
|---------|-------|---------|----------|------------|
| **[Kabanata 1: Pundasyon](docs/chapter-01-foundation/README.md)** | Pagsisimula | [Mga Pangunahing Kaalaman ng AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pag-install at Pag-set up](docs/chapter-01-foundation/installation.md) &#124; [Ang Iyong Unang Proyekto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kabanata 2: Pag-unlad ng AI](docs/chapter-02-ai-development/README.md)** | Mga App na Unahin ang AI | [Integrasyon ng Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Pag-deploy ng Modelong AI](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kabanata 3: Konfigurasyon](docs/chapter-03-configuration/README.md)** | Auth at Seguridad | [Gabay sa Konfigurasyon](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Seguridad](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kabanata 4: Imprastruktura](docs/chapter-04-infrastructure/README.md)** | IaC at Pag-deploy | [Gabay sa Pag-deploy](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kabanata 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Mga Solusyon ng AI Agent | [Senaryong Retail](examples/retail-scenario.md) &#124; [Mga Pattern ng Koordinasyon](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kabanata 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Pagpaplano at Pagpapatunay | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kabanata 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug at Pag-ayos | [Karaniwang Isyu](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kabanata 8: Produksyon](docs/chapter-08-production/README.md)** | Mga Pattern para sa Enterprise | [Mga Gawain sa Produksyon](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduksyon](workshop/docs/instructions/0-Introduction.md) &#124; [Pagpili](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Pagpapatunay](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Pag-deconstruct](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Pag-configure](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Pag-customize](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Pag-wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Kabuuang Tagal ng Kurso:** ~10-14 hours | **Pag-unlad ng Kasanayan:** Nagsisimula → Handa na para sa Produksyon

---

## 📚 Mga Kabanata sa Pagkatuto

*Piliin ang iyong landas ng pag-aaral batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon & Mabilis na Panimulang Gabay
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kompleksidad**: ⭐

#### Ano ang Matututunan Mo
- Pag-unawa sa mga pundasyon ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan ng Pagkatuto
- **🎯 Magsimula Dito**: [Ano ang Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorya**: [Mga Pangunahing Kaalaman ng AZD](docs/chapter-01-foundation/azd-basics.md) - Mga pangunahing konsepto at termino
- **⚙️ Setup**: [Pag-install at Pag-set up](docs/chapter-01-foundation/installation.md) - Mga gabay para sa bawat platform
- **🛠️ Hands-On**: [Ang Iyong Unang Proyekto](docs/chapter-01-foundation/first-project.md) - Sunod-sunod na tutorial
- **📋 Mabilisang Sanggunian**: [Cheat Sheet ng Mga Utos](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilis na pagsuri sa pag-install
azd version

# I-deploy ang iyong unang aplikasyon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kinalabasan ng Kabanata**: Matagumpay na i-deploy ang isang simpleng web application sa Azure gamit ang AZD

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalisa ang proyekto
azd up                  # Ini-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras na Kailangang Ilaan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing aplikasyon nang mag-isa
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing aplikasyon nang mag-isa

---

### 🤖 Kabanata 2: Pag-unlad na Nakatuon sa AI (Inirerekomenda para sa mga AI Developer)
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Matututunan Mo
- Integrasyon ng Microsoft Foundry sa AZD
- Pag-deploy ng mga aplikasyon na pinapagana ng AI
- Pag-unawa sa mga konfigurasyon ng serbisyo ng AI

#### Mga Mapagkukunan ng Pagkatuto
- **🎯 Magsimula Dito**: [Integrasyon ng Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [Gabay sa AI Agents](docs/chapter-02-ai-development/agents.md) - I-deploy ang mga intelihenteng ahente gamit ang AZD
- **📖 Mga Pattern**: [Pag-deploy ng Modelong AI](docs/chapter-02-ai-development/ai-model-deployment.md) - I-deploy at pamahalaan ang mga modelong AI
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga solusyon sa AI
- **🎥 Interactive Guide**: [Mga Materyales ng Workshop](workshop/README.md) - Pag-aaral sa browser gamit ang MkDocs * DevContainer Environment
- **📋 Mga Template**: [Mga Template ng Microsoft Foundry](#mga-mapagkukunan-ng-workshop)
- **📝 Mga Halimbawa**: [Mga Halimbawa ng Pag-deploy ng AZD](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang aplikasyon ng AI
azd init --template azure-search-openai-demo
azd up

# Subukan ang iba pang mga template ng AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: I-deploy at i-configure ang isang chat application na pinapagana ng AI na may kakayahang RAG

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat ay kaya mong:
azd init --template azure-search-openai-demo
azd up
# Subukan ang interface ng AI chat
# Magtanong at tumanggap ng mga tugon na pinapagana ng AI na may mga sanggunian
# Tiyakin na gumagana ang integrasyon ng paghahanap
azd monitor  # Suriin kung ipinapakita ng Application Insights ang telemetry
azd down --force --purge
```

**📊 Oras na Kailangan:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-configure ng production-ready na mga AI application  
**💰 Pagkaalam sa Gastos:** Unawain ang $80-150/buwan para sa dev, $300-3500/buwan para sa produksyon

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa mga AI Deployment

**Kapaligiran ng Pag-develop (Tinatayang $80-150/buwan):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/buwan (batay sa paggamit ng token)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Kapaligiran ng Produksyon (Tinatayang $300-3,500+/buwan):**
- Microsoft Foundry Models (PTU para sa konsistent na performance): $3,000+/buwan O Pay-as-go sa mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gamitin ang **Free Tier** ng Microsoft Foundry Models para sa pag-aaral (kasama ang Azure OpenAI 50,000 tokens/buwan)
- Patakbuhin ang `azd down` upang i-deallocate ang mga resource kapag hindi aktibong nag-develop
- Magsimula sa consumption-based billing, mag-upgrade sa PTU lamang para sa produksyon
- Gamitin ang `azd provision --preview` upang tantiyahin ang mga gastos bago mag-deploy
- I-enable ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagsubaybay ng Gastos:**
```bash
# Suriin ang tinatayang buwanang gastos
azd provision --preview

# Subaybayan ang aktwal na gastos sa Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Konfigurasyon at Autentikasyon
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kompleksidad**: ⭐⭐

#### Ano ang Matututunan Mo
- Pamamahala at konfigurasyon ng environment
- Mga pinakamahusay na kasanayan sa autentikasyon at seguridad
- Pagpapangalan at organisasyon ng mga resource

#### Mga Mapagkukunan ng Pagkatuto
- **📖 Konfigurasyon**: [Gabay sa Konfigurasyon](docs/chapter-03-configuration/configuration.md) - Pagsisetup ng environment
- **🔐 Seguridad**: [Mga pattern ng Authentication at managed identity](docs/chapter-03-configuration/authsecurity.md) - Mga pattern ng authentication
- **📝 Mga Halimbawa**: [Halimbawa ng Database App](examples/database-app/README.md) - Mga halimbawa ng AZD Database

#### Mga Praktikal na Ehersisyo
- I-configure ang maramihang environment (dev, staging, prod)
- I-setup ang managed identity authentication
- Ipatupad ang environment-specific na mga konfigurasyon

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maramihang environment na may tamang autentikasyon at seguridad

---

### 🏗️ Kabanata 4: Imprastruktura bilang Code (IaC) at Pag-deploy
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kompleksidad**: ⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga advanced na pattern ng pag-deploy
- Imprastruktura bilang Code gamit ang Bicep
- Mga estratehiya sa provisioning ng mga resource

#### Mga Mapagkukunan ng Pagkatuto
- **📖 Pag-deploy**: [Gabay sa Pag-deploy](docs/chapter-04-infrastructure/deployment-guide.md) - Kumpletong workflow
- **🏗️ Provisioning**: [Pag-provision ng Mga Resource](docs/chapter-04-infrastructure/provisioning.md) - Pamamahala ng Azure resource
- **📝 Mga Halimbawa**: [Halimbawa ng Container App](../../examples/container-app) - Containerized na mga deployment

#### Mga Praktikal na Ehersisyo
- Lumikha ng custom na Bicep templates
- I-deploy ang multi-service na mga aplikasyon
- Ipatupad ang mga estratehiya ng blue-green deployment

**💡 Kinalabasan ng Kabanata**: I-deploy ang mga kumplikadong multi-service na aplikasyon gamit ang custom na mga template ng imprastruktura

---

### 🎯 Kabanata 5: Mga Solusyon ng Maramihang Ahente na AI (Advanced)
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kompleksidad**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga pattern ng arkitekturang multi-agent
- Orkestrasyon at koordinasyon ng mga ahente
- Production-ready na mga deployment ng AI

#### Mga Mapagkukunan ng Pagkatuto
- **🤖 Tampok na Proyekto**: [Solusyon ng Multi-Agent para sa Retail](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [Paketeng ARM Template](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektura**: [Mga pattern ng koordinasyon ng multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mga pattern

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang kumpletong multi-agent na solusyon para sa retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tuklasin ang mga konfigurasyon ng ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: I-deploy at pamahalaan ang isang production-ready na solusyon ng multi-agent AI na may mga Customer at Inventory agents

---

### 🔍 Kabanata 6: Pagpapatunay at Pagpaplano Bago ang Pag-deploy
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Tagal**: 1 oras  
**Kompleksidad**: ⭐⭐
#### Ano ang Matututunan Mo
- Pagpaplano ng kapasidad at pagpapatunay ng mga resource
- Mga estratehiya sa pagpili ng SKU
- Mga pre-flight check at automation

#### Mga Mapagkukunan ng Pagkatuto
- **📊 Pagpaplano**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Pagpapatunay ng mga resource
- **💰 Pagpili**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Makatipid na mga pagpipilian
- **✅ Pag-validate**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Mga automated script

#### Mga Praktikal na Pagsasanay
- Patakbuhin ang mga script para sa pagpapatunay ng kapasidad
- I-optimize ang mga pagpili ng SKU para sa gastos
- Ipatupad ang automated na mga pre-deployment check

**💡 Kinalabasan ng Kabanata**: I-validate at i-optimize ang mga deployment bago isagawa

---

### 🚨 Kabanata 7: Pag-troubleshoot at Pag-debug
**Mga Kinakailangan**: Anumang natapos na kabanata ng deployment  
**Tagal**: 1-1.5 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Matututunan Mo
- Sistematikong mga pamamaraan ng pag-debug
- Mga karaniwang isyu at solusyon
- Pag-troubleshoot na espesipiko sa AI

#### Mga Mapagkukunan ng Pagkatuto
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Pag-debug**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Mga problema sa AI service

#### Mga Praktikal na Pagsasanay
- I-diagnose ang mga pagkabigo sa deployment
- Ayusin ang mga isyu sa authentication
- I-debug ang konektividad ng AI service

**💡 Kinalabasan ng Kabanata**: Magawang mag-diagnose at mag-resolba nang magkahiwalay ng mga karaniwang isyu sa deployment

---

### 🏢 Kabanata 8: Mga Pattern para sa Produksyon at Enterprise
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kompleksidad**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga estratehiya para sa production deployment
- Mga pattern ng seguridad para sa enterprise
- Pagmomonitor at pag-optimize ng gastos

#### Mga Mapagkukunan ng Pagkatuto
- **🏭 Produksyon**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga komplikadong arkitektura
- **📊 Pagmomonitor**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Pagmomonitor

#### Mga Praktikal na Pagsasanay
- Ipatupad ang mga pattern ng seguridad para sa enterprise
- Mag-set up ng komprehensibong pagmomonitor
- Mag-deploy sa production na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga application na handa para sa enterprise na may buong kakayahan sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Hands-On na Karanasan sa Pagkatuto

> **⚠️ ESTADO NG WORKSHOP: Aktibong Pag-unlad**  
> Ang mga materyales ng workshop ay kasalukuyang dinidevelop at pinapabuti. Gumagana na ang mga pangunahing module, ngunit ang ilang mga advanced na seksyon ay hindi pa kumpleto. Aktibo naming tinatrabaho ang pagtapos ng lahat ng nilalaman. [I-track ang progreso →](workshop/README.md)

### Mga Interactive na Materyales ng Workshop
**Komprehensibong hands-on na pagkatuto gamit ang mga tool sa browser at gabay na mga pagsasanay**

Ang aming mga materyales sa workshop ay nagbibigay ng istrukturado, interactive na karanasan sa pagkatuto na nagsusupresa sa curriculum na batay sa mga kabanata sa itaas. Idinisenyo ang workshop para sa parehong self-paced na pag-aaral at mga sesyong pinangungunahan ng instruktor.

#### 🛠️ Mga Tampok ng Workshop
- **Browser-Based Interface**: Kumpletong workshop na pinapagana ng MkDocs na may search, copy, at theme na mga tampok
- **GitHub Codespaces Integration**: One-click na setup ng development environment
- **Istrakturadong Landas ng Pagkatuto**: 8-module na mga guided exercise (3-4 na oras kabuuan)
- **Progressive Methodology**: Pagpapakilala → Pagpili → Pag-validate → Dekonstruksyon → Konfigurasyon → Pag-customize → Teardown → Pagsasara
- **Interactive DevContainer Environment**: Mga pre-configure na tool at dependencies

#### 📚 Estruktura ng Mga Modyul ng Workshop
Sinusunod ng workshop ang isang **8-module progressive methodology** na magdadala sa iyo mula sa pagtuklas hanggang sa mastery ng deployment:

| Modyul | Paksa | Ano ang Gagawin Mo | Tagal |
|--------|-------|--------------------|----------|
| **0. Introduction** | Pangkalahatang-ideya ng Workshop | Unawain ang mga layunin ng pagkatuto, mga kinakailangan, at estruktura ng workshop | 15 min |
| **1. Selection** | Template Discovery | Galugarin ang mga AZD template at piliin ang angkop na AI template para sa iyong senaryo | 20 min |
| **2. Validation** | Deploy & Verify | I-deploy ang template gamit ang `azd up` at i-validate na gumagana ang imprastraktura | 30 min |
| **3. Deconstruction** | Understand Structure | Gamitin ang GitHub Copilot upang galugarin ang arkitektura ng template, mga Bicep file, at organisasyon ng code | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Maging bihasa sa `azure.yaml` configuration, lifecycle hooks, at environment variables | 30 min |
| **5. Customization** | Make It Yours | I-enable ang AI Search, tracing, evaluation, at i-customize para sa iyong senaryo | 45 min |
| **6. Teardown** | Clean Up | Ligtas na i-deprovision ang mga resource gamit ang `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Balikan ang mga nagawa, pangunahing konsepto, at ipagpatuloy ang iyong paglalakbay sa pagkatuto | 15 min |

**Daloy ng Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Pagsisimula sa Workshop
```bash
# Opsyon 1: GitHub Codespaces (Inirerekomenda)
# I-click "Code" → "Create codespace on main" sa repository

# Opsyon 2: Lokal na Pag-develop
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga tagubilin sa pag-setup sa workshop/README.md
```

#### 🎯 Mga Kinalabasan ng Pagkatuto sa Workshop
Sa pagtatapos ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Production AI Applications**: Gumamit ng AZD kasama ang Microsoft Foundry services
- **Maging bihasa sa Multi-Agent Architectures**: Magpatupad ng mga pinagsamang solusyon ng AI agents
- **Magpatupad ng Mga Pinakamahusay na Gawain sa Seguridad**: I-configure ang authentication at access control
- **I-optimize para sa Scale**: Disenyuhin ang cost-effective, performant na mga deployment
- **Mag-troubleshoot ng mga Deployment**: Lutasin ang mga karaniwang isyu nang magkahiwalay

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based na learning environment
- **📋 Mga Instruksyon Modyul-by-Modyul**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Pangkalahatang-ideya ng workshop at mga layunin
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Hanapin at piliin ang AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - I-deploy at i-verify ang mga template
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Galugarin ang arkitektura ng template
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Maging bihasa sa azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - I-customize para sa iyong senaryo
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Linisin ang mga resource
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Balikan at mga susunod na hakbang
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mga ehersisyong naka-focus sa AI
- **💡 Mabilis na Pagsisimula**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurasyon ng environment

**Perpekto para sa**: Pagsasanay ng korporasyon, mga kurso sa unibersidad, self-paced na pag-aaral, at developer bootcamps.

---

## 📖 Malalim na Pagsusuri: Mga Kakayahan ng AZD

Higit pa sa mga batayan, nagbibigay ang AZD ng makapangyarihang mga tampok para sa production deployments:

- **Template-based deployments** - Gamitin ang mga pre-built template para sa mga karaniwang pattern ng application
- **Infrastructure as Code** - I-manage ang mga Azure resources gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na mag-provision, mag-deploy, at mag-monitor ng mga application
- **Developer-friendly** - In-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa Mga Deployment ng AI**

**Bakit AZD para sa Mga Solusyon ng AI?** Tinutugunan ng AZD ang mga pangunahing hamon na hinaharap ng mga AI developer:

- **AI-Ready Templates** - Mga pre-configured template para sa Microsoft Foundry Models, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Built-in na mga pattern ng seguridad para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Mga pinakamahusay na kasanayan para sa scalable, cost-effective na deployment ng AI application
- **End-to-End AI Workflows** - Mula sa pag-develop ng model hanggang sa production deployment na may tamang pagmomonitor
- **Cost Optimization** - Matalinong allocation ng resource at mga estratehiya sa scaling para sa AI workloads
- **Microsoft Foundry Integration** - Seamless na koneksyon sa Microsoft Foundry model catalog at mga endpoint

---

## 🎯 Templates & Examples Library

### Tampok: Microsoft Foundry Templates
**Magsimula dito kung mag-de-deploy ka ng mga AI application!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang AI pattern. Ang ilan ay external Azure Samples, ang iba naman ay lokal na implementasyon.

| Template | Kabanata | Kompleksidad | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Panlabas |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Senaryo sa Pagkatuto
**Mga template ng application na handa sa produksyon na naka-map sa mga kabanata ng pagkatuto**

| Template | Kabanata ng Pagkatuto | Kompleksidad | Pangunahing Natutunan |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga batayang pattern ng deployment ng AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Pagpapatupad ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture na may Customer at Inventory agents |

### Pagkatuto ayon sa Uri ng Halimbawa

> **📌 Lokal vs. Panlabas na Mga Halimbawa:**  
> **Local Examples** (sa repo na ito) = Handang gamitin agad  
> **External Examples** (Azure Samples) = I-clone mula sa naka-link na mga repository

#### Lokal na Halimbawa (Handang Gamitin)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong production-ready na implementasyon gamit ang ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Komprehensibong pagmomonitor at evaluation
  - One-click deployment via ARM template

#### Lokal na Halimbawa - Container Applications (Mga Kabanata 2-5)
**Komprehensibong halimbawa ng container deployment sa repo na ito:**
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa mga containerized deployment
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Batayang REST API na may scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Quick Start, Production, at Advanced na mga pattern ng deployment
  - Gabay sa pagmomonitor, seguridad, at pag-optimize ng gastos

#### External na Halimbawa - Simpleng Mga Application (Mga Kabanata 1-2)
**I-clone ang mga Azure Samples na repository na ito upang makapagsimula:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga batayang pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pag-deploy ng static na content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pag-deploy ng REST API

#### External na Halimbawa - Integrasyon ng Database (Kabanata 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng koneksyon sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na daloy ng datos

#### Panlabas na Halimbawa - Advanced na Mga Pattern (Mga Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mga arkitekturang maraming serbisyo
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Pagpoproseso sa background  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mga pattern ng ML na handa para sa produksyon

### Panlabas na Koleksyon ng Template
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng mga opisyal at community na template
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng template sa Microsoft Learn
- [**Examples Directory**](examples/README.md) - Mga lokal na halimbawa para sa pag-aaral na may detalyadong mga paliwanag

---

## 📚 Mga Mapagkukunan sa Pagkatuto at Mga Sanggunian

### Mabilis na Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang azd na utos na inayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiyang Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga pagsasanay na praktikal

### Mga Hands-On na Workshop
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing ma-deploy gamit ang AZD ang iyong mga solusyong AI (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-module na ginabayang mga ehersisyo gamit ang MkDocs at GitHub Codespaces
  - Sinasunod: Panimula → Pagpili → Pagpapatunay → Dekonstruksiyon → Konfigurasyon → Pag-customize → Pag-teardown → Pagsasara

### Panlabas na Mapagkukunan sa Pagkatuto
- Azure Developer CLI Documentation(https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architecture Center(https://learn.microsoft.com/en-us/azure/architecture/)
- Azure Pricing Calculator(https://azure.microsoft.com/pricing/calculator/)
- Azure Status(https://status.azure.com/)

### Mga Kasanayan ng AI Agent para sa Iyong Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 bukas na kasanayan ng agent para sa Azure AI, Foundry, deployment, diagnostics, pag-optimize ng gastos, at iba pa. I-install ang mga ito sa GitHub Copilot, Cursor, Claude Code, o anumang suportadong agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Mga karaniwang isyung kinahaharap ng mga nagsisimula at agarang mga solusyon:**

<details>
<summary><strong>❌ "azd: utos hindi natagpuan"</strong></summary>

```bash
# I-install muna ang AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Suriin ang pag-install
azd version
```
</details>

<details>
<summary><strong>❌ "Walang subscription na natagpuan" o "Hindi na-set ang subscription"</strong></summary>

```bash
# Ilista ang mga magagamit na subscription
az account list --output table

# Itakda ang default na subscription
az account set --subscription "<subscription-id-or-name>"

# Itakda para sa AZD na kapaligiran
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Suriin
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" o "Lumampas ang quota"</strong></summary>

```bash
# Subukan ang ibang rehiyon ng Azure
azd env set AZURE_LOCATION "westus2"
azd up

# O gumamit ng mga mas maliliit na SKU sa development
# I-edit ang infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" nabibigo sa kalagitnaan ng proseso</strong></summary>

```bash
# Opsyon 1: Linisin at subukan muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lang ang imprastruktura
azd provision

# Opsyon 3: Suriin ang detalyadong status
azd show

# Opsyon 4: Suriin ang mga log sa Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Nabigo ang authentication" o "Nag-expire ang token"</strong></summary>

```bash
# Muling mag-authenticate para sa AZD
azd auth logout
azd auth login

# Opsyonal: i-refresh din ang Azure CLI kung nagpapatakbo ka ng mga "az" na utos
az logout
az login

# Suriin ang pagpapatunay
az account show
```
</details>

<details>
<summary><strong>❌ "Umiiral na ang resource" o mga konflik sa pag-name</strong></summary>

```bash
# Gumagawa ang AZD ng natatanging mga pangalan, ngunit kung magkaroon ng salungatan:
azd down --force --purge

# Muling subukan gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Matagal ang deployment ng template</strong></summary>

**Karaniwang oras ng paghihintay:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- Mga aplikasyon ng AI: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Suriin ang progreso
azd show

# Kung natigil nang higit sa 30 minuto, tingnan ang Azure Portal:
azd monitor --overview
# Hanapin ang mga nabigong deployment
```
</details>

<details>
<summary><strong>❌ "Tinanggihan ang permiso" o "Ipinagbabawal"</strong></summary>

```bash
# Suriin ang iyong role sa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa "Contributor" role
# Hilingin sa iyong Azure admin na ibigay:
# - Contributor (para sa mga resource)
# - User Access Administrator (para sa pagtatalaga ng mga role)
```
</details>

<details>
<summary><strong>❌ Hindi makita ang URL ng na-deploy na application</strong></summary>

```bash
# Ipakita ang lahat ng mga endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga *_URL na variable
```
</details>

### 📚 Kumpletong Mga Mapagkukunan sa Pag-troubleshoot

- **Gabay sa Karaniwang Isyu:** [Detalyadong Mga Solusyon](docs/chapter-07-troubleshooting/common-issues.md)
- **Mga Isyu na Espesipiko sa AI:** [Pag-troubleshoot ng AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Gabay sa Debugging:** [Hakbang-hakbang na Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Kumuha ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagkumpleto ng Kurso at Sertipikasyon

### Pagsubaybay ng Progreso
Subaybayan ang iyong progreso sa pag-aaral sa bawat kabanata:

- [ ] **Chapter 1**: Pundasyon at Mabilis na Panimula ✅
- [ ] **Chapter 2**: Pag-develop na Unahin ang AI ✅  
- [ ] **Chapter 3**: Konfigurasyon at Pagpapatunay ✅
- [ ] **Chapter 4**: Imprastruktura bilang Code at Deployment ✅
- [ ] **Chapter 5**: Mga Solusyong AI na Maramihang Agent ✅
- [ ] **Chapter 6**: Pagpapatunay at Pagpaplano bago ang Deployment ✅
- [ ] **Chapter 7**: Pag-troubleshoot at Debugging ✅
- [ ] **Chapter 8**: Mga Pattern para sa Produksyon at Enterprise ✅

### Pagpapatunay ng Pagkatuto
Matapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Ehersisyo**: Kumpletuhin ang praktikal na deployment ng kabanata
2. **Pagsusuri ng Kaalaman**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kumplikasyon

### Mga Benepisyo ng Pagkumpleto ng Kurso
Kapag nakumpleto mo ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasang sa Produksyon**: Na-deploy na totoong mga aplikasyon ng AI sa Azure
- **Propesyonal na Kasanayan**: Mga kakayahang handa para sa enterprise na deployment  
- **Pagkilala ng Komunidad**: Aktibong miyembro ng komunidad ng mga Azure developer
- **Pag-unlad sa Karera**: Hinahangad na kasanayan sa AZD at pag-deploy ng AI

---

## 🤝 Komunidad at Suporta

### Kumuha ng Tulong at Suporta
- **Teknikal na Isyu**: [Iulat ang mga bug at humiling ng mga feature](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pagkatuto**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong na Espesipiko sa AI**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Pananaw ng Komunidad mula sa Microsoft Foundry Discord

**Kamakailang Resulta ng Poll mula sa #Azure Channel:**
- **45%** ng mga developer ang nais gumamit ng AZD para sa mga AI workload
- **Pangunahing mga hamon**: Pag-deploy ng maramihang serbisyo, pamamahala ng kredensyal, kahandaan sa produksyon  
- **Pinakakahilingan**: Mga template na spesipiko sa AI, mga gabay sa pag-troubleshoot, pinakamahusay na kasanayan

**Sumali sa aming komunidad para:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Ma-access ang mga maagang preview ng bagong mga template ng AI
- Mag-ambag sa pinakamahusay na mga kasanayan sa pag-deploy ng AI
- Makaimpluwensya sa hinaharap na pag-develop ng mga feature para sa AI + AZD

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang mga ambag! Basahin ang aming [Gabay sa Pag-aambag](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapabuti ng Nilalaman**: Pagbutihin ang umiiral na mga kabanata at mga halimbawa
- **Bagong Mga Halimbawa**: Magdagdag ng mga totoong senaryo at mga template  
- **Pagsasalin**: Tumulong na panatilihin ang suporta sa maraming wika
- **Ulat ng Bug**: Pahusayin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong mga patnubay sa komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Kaugnay na Mga Pinagkukunang Pang-aral ng Microsoft

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pagkatuto:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Agham ng Datos para sa mga Nagsisimula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa mga Nagsisimula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity para sa mga Nagsisimula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa mga Nagsisimula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa mga Nagsisimula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Pag-develop ng XR para sa mga Nagsisimula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serye ng Copilot
[![Copilot para sa AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pakikipagsapalaran ng Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasyon ng Kurso

**🚀 Handa nang Magsimulang Matuto?**

**Mga Nagsisimula**: Magsimula sa [Kabanata 1: Pundasyon & Mabilis na Panimula](#-chapter-1-foundation--quick-start)  
**Mga Developer ng AI**: Tumungo sa [Kabanata 2: Pag-develop na Nakasentro sa AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Mga Batikang Developer**: Magsimula sa [Kabanata 3: Konfigurasyon & Pagpapatunay](#️-chapter-3-configuration--authentication)

**Susunod na Mga Hakbang**: [Simulan ang Kabanata 1 - Mga Batayan ng AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpakan. Dapat ituring na awtoritatibong sanggunian ang orihinal na dokumento sa orihinal nitong wika. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling pagpapakahulugan na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->