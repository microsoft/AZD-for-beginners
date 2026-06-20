# AZD Para sa mga Nagsisimula: Isang Istrakturadong Paglalakbay sa Pagkatuto

![AZD para sa mga Nagsisimula](../../translated_images/tl/azdbeginners.5527441dd9f74068.webp) 

[![Mga manonood sa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Mga bituin sa GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord ng Azure](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Discord ng Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Mga Awtomatikong Pagsasalin (Palaging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Mas Gustong I-clone Nang Lokal?**
>
> Ang repositoryong ito ay may 50+ na pagsasalin ng wika na malaki ang dagdag sa laki ng pag-download. Upang i-clone nang walang mga pagsasalin, gumamit ng sparse checkout:
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
> Ito ang magbibigay sa iyo ng lahat ng kailangan mo para makumpleto ang kurso na may mas mabilis na pag-download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ano ang Bago sa azd Ngayon

> 📌 Ang kursong ito ay na-validate laban sa **`azd 1.25.6`** (Hunyo 2026). Patakbuhin ang `azd version` para tingnan ang iyong build, at `azd upgrade` para makakuha ng pinakabago.

Ang Azure Developer CLI ay lumago lampas sa tradisyonal na web apps at APIs. Ngayon, ang azd ang nag-iisang tool para i-deploy ang **anumang** aplikasyon sa Azure—kabilang ang mga AI-powered na aplikasyon at intelligent agents.

Narito kung ano ang ibig sabihin nito para sa iyo:

- **Ang mga AI agent ay ngayon unang-klaseng azd workloads.** Maaari mong i-initialize, i-deploy, at i-manage ang mga proyekto ng AI agent gamit ang parehong `azd init` → `azd up` workflow na alam mo na.
- **Isang kumpletong lifecycle ng agent mula sa CLI.** Sinasaklaw na ng extension na `azure.ai.agents` ang buong paglalakbay—`azd ai agent init` para mag-scaffold, `azd ai agent invoke` para mag-test (na may response-timing output), `azd ai agent eval generate` at `azd ai agent optimize` para sukatin at pagandahin ang kalidad, at `azd ai agent delete` para maglinis.
- **Mas maraming AI building blocks.** Ang mga bagong preview extension—`azure.ai.skills` at `azure.ai.connections`—ay nagpapahintulot sa iyo na i-manage ang reusable agent skills at Foundry connections nang direkta gamit ang azd.
- **Integrasyon ng Microsoft Foundry** nagdadala ng model deployment, agent hosting, at AI service configuration direkta sa azd template ecosystem.
- **Mas maayos na pang-araw-araw na mga bagay.** Ang mga kamakailang release ay ginawa ang `azd init` na idempotent (ligtas ulitin), ginawa ang `azd auth login` na awtomatikong mag-clear ng stale tokens, at nagdagdag ng magiliw na `azd tool` first-run setup prompt.
- **Hindi nagbago ang core workflow.** Kung nag-de-deploy ka man ng todo app, microservice, o multi-agent AI solution, pareho lamang ang mga command.

> **Tala para sa mga gumagamit ng Aspire:** Tinatawag na lang ngayon ng Microsoft ang produkto na **Aspire** (dating ".NET Aspire"). Hindi nagbago ang suporta ng azd para sa Aspire—ang pangalan lang ang na-update.

Kung ginamit mo na ang azd dati, ang suporta sa AI ay isang natural na extension—hindi isang hiwalay na tool o advanced na landas. Kung nagsisimula ka mula sa simula, matututo ka ng isang workflow na gumagana para sa lahat.

---

## 🚀 Ano ang Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ay isang developer-friendly na command-line tool na nagpapadali sa pag-deploy ng mga aplikasyon sa Azure. Sa halip na mano-manong gumawa at mag-connect ng dose-dosenang Azure resource, maaari mong i-deploy ang buong aplikasyon gamit ang isang command lamang.

### Ang Magic ng `azd up`

```bash
# Ginagawa lahat ng isang utos na ito:
# ✅ Lumilikha ng lahat ng Azure resources
# ✅ Nagko-configure ng networking at seguridad
# ✅ Nagtatayo ng iyong application code
# ✅ Nagde-deploy sa Azure
# ✅ Nagbibigay sa iyo ng isang gumaganang URL
azd up
```

**Tapos na!** Walang pag-click sa Azure Portal, walang kumplikadong ARM templates na kailangang pag-aralan muna, walang manu-manong configuration - mga gumaganang aplikasyon na lang sa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ano ang Pagkakaiba?

Ito ang pinaka-karaniwang tanong ng mga nagsisimula. Narito ang simpleng sagot:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Pamahalaan ang indibidwal na mga resource ng Azure | I-deploy ang kumpletong mga aplikasyon |
| **Mindset** | Nakatuon sa imprastruktura | Nakatuon sa aplikasyon |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Dapat alam ang mga serbisyo ng Azure | Kailangan lang kilalanin ang iyong app |
| **Best For** | DevOps, Imprastruktura | Mga Developer, Prototyping |

### Simpleng Analohiya

- **Azure CLI** ay parang pagkakaroon ng lahat ng kagamitan para magtayo ng bahay - mga martilyo, lagari, pako. Maaari kang magtayo ng anumang bagay, pero kailangan mong malaman ang konstruksyon.
- **Azure Developer CLI** ay parang pagkuha ng kontratista - ilalarawan mo lang ang gusto mo, at siya na ang bahala sa pagtatayo.

### Kailan Gamitin ang Bawat Isa

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Gumagana Silang Magkasama!

Gumagamit ang AZD ng Azure CLI sa ilalim. Maaari mong gamitin ang pareho:
```bash
# I-deploy ang iyong app gamit ang AZD
azd up

# Pagkatapos ay i-fine-tune ang mga partikular na resources gamit ang Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Hanapin ang Mga Template sa Awesome AZD

Huwag magsimula mula sa simula! Ang **Awesome AZD** ang koleksyon ng komunidad ng mga handa-na-i-deploy na template:

| Resource | Paglalarawan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Mag-browse ng 200+ template na may isang-click na pag-deploy |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Mag-ambag ng iyong sariling template sa komunidad |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | I-star at galugarin ang source |

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

## 🎯 Pagsisimula sa 3 Hakbang

Bago ka magsimula, tiyaking handa ang iyong makina para sa template na nais mong i-deploy:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung may mabigong kinakailangang check, ayusin muna iyon bago magpatuloy sa quick start.

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
# Opsyonal kung plano mong gamitin nang direkta ang mga utos ng Azure CLI sa kurso na ito
az login

# Kinakailangan para sa mga AZD workflow
azd auth login
```

Kung hindi ka sigurado kung alin ang kailangan mo, sundin ang buong flow ng setup sa [Instalasyon at Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hakbang 3: I-deploy ang Iyong Unang App

```bash
# I-initialize mula sa isang template
azd init --template todo-nodejs-mongo

# I-deploy sa Azure (gumagawa ng lahat!)
azd up
```

**🎉 Tapos na!** Ang iyong app ay live na sa Azure.

### Linisin (Huwag Kalimutan!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Paano Gamitin ang Kursong Ito

Ang kursong ito ay dinisenyo para sa **paunti-unting pagkatuto** - magsimula kung saan ka komportable at magtrabaho pataas:

| Iyong Karanasan | Magsimula Dito |
|-----------------|----------------|
| **Bagong-bagong sa Azure** | [Kabanata 1: Pundasyon](#-chapter-1-foundation--quick-start) |
| **Alam ang Azure, bago sa AZD** | [Kabanata 1: Pundasyon](#-chapter-1-foundation--quick-start) |
| **Gustong mag-deploy ng mga AI app** | [Kabanata 2: Pag-unlad na Nakatuon sa AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gustong magkaroon ng hands-on na pagsasanay** | [🎓 Interaktibong Workshop](workshop/README.md) - 3-4 na oras na guided lab |
| **Kailangan ng mga pattern para sa produksyon** | [Kabanata 8: Produksyon at Enterprise](#-chapter-8-production--enterprise-patterns) |

### Mabilis na Setup

1. **I-fork ang Repositoryong Ito**: [![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ito**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Humingi ng Tulong**: [Komunidad ng Azure Discord](https://discord.com/invite/ByRwuEEgH4)

> **Mas Gustong I-clone Nang Lokal?**

> Ang repositoryong ito ay may 50+ na pagsasalin ng wika na malaki ang dagdag sa laki ng pag-download. Upang i-clone nang walang mga pagsasalin, gumamit ng sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ito ang magbibigay sa iyo ng lahat ng kailangan mo para makumpleto ang kurso na may mas mabilis na pag-download.


## Pangkalahatang-ideya ng Kurso

Masterin ang Azure Developer CLI (azd) sa pamamagitan ng mga istrukturadong kabanata na dinisenyo para sa paunti-unting pagkatuto. **May espesyal na pokus sa pag-deploy ng mga AI application kasama ang integrasyon ng Microsoft Foundry.**
### Bakit Mahalaga ang Kursong Ito para sa Mga Modernong Developer

Batay sa mga pananaw mula sa Microsoft Foundry Discord community, **45% ng mga developer ay nais gumamit ng AZD para sa mga AI workload** ngunit nakakaranas ng mga hamon sa:
- Kumplikadong multi-service na AI architecture
- Mga best practice sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI services
- Pag-optimize ng gastos para sa mga AI workload
- Pagsisiyasat ng mga ispesipikong isyu sa deployment ng AI

### Mga Layunin sa Pagkatuto

Sa pagkumpleto ng istrukturadong kursong ito, ikaw ay:
- **Masanay sa Pangunahing Kaalaman sa AZD**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Magpatupad ng Infrastructure as Code**: Pangasiwaan ang mga Azure resource gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at i-debug ang mga problema
- **Mag-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Gumawa ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## Bago Ka Magsimula: Mga Account, Access, at Mga Palagay

Bago ka magsimula sa Kabanata 1, tiyaking mayroon ka ng mga sumusunod na bagay. Ipinapalagay ng mga hakbang sa pag-install sa susunod na gabay na ang mga batayang ito ay naayos na.

- **Isang Azure subscription**: Maaari mong gamitin ang umiiral na subscription mula sa trabaho o iyong sariling account, o gumawa ng isang [libreng pagsubok](https://aka.ms/azurefreetrial) upang makapagsimula.
- **Pahintulot na lumikha ng Azure resources**: Para sa karamihan ng mga ehersisyo, dapat mayroon kang hindi bababa sa **Contributor** access sa target na subscription o resource group. Ang ilang kabanata ay maaaring magpalagay din na maaari kang gumawa ng resource groups, managed identities, at RBAC assignments.
- [**Isang GitHub account**](https://github.com): Kapaki-pakinabang ito para i-fork ang repository, subaybayan ang iyong mga pagbabago, at gamitin ang GitHub Codespaces para sa workshop.
- **Template runtime prerequisites**: Ang ilang mga template ay nangangailangan ng lokal na mga tool tulad ng Node.js, Python, Java, o Docker. Patakbuhin ang setup validator bago magsimula upang maagang makita ang mga nawawalang tool.
- **Pangunahing pamilyaridad sa terminal**: Hindi mo kailangang maging eksperto, ngunit dapat kang komportable sa pagpapatakbo ng mga utos tulad ng `git clone`, `azd auth login`, at `azd up`.

> **Nagtatrabaho sa isang enterprise subscription?**
> Kung ang iyong Azure environment ay pinamamahalaan ng isang administrator, kumpirmahin nang maaga na maaari kang mag-deploy ng mga resource sa subscription o resource group na balak mong gamitin. Kung hindi, humiling ng sandbox subscription o Contributor access bago ka magsimula.

> **Bago sa Azure?**
> Magsimula sa iyong sariling Azure trial o pay-as-you-go subscription sa https://aka.ms/azurefreetrial upang makumpleto mo ang mga ehersisyo mula sa simula hanggang katapusan nang hindi naghihintay ng mga pag-apruba sa antas ng tenant.

## 🗺️ Course Map: Quick Navigation by Chapter

Ang bawat kabanata ay may nakalaang README na may mga layunin sa pagkatuto, quick starts, at mga ehersisyo:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Getting Started | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Kabuuang Tagal ng Kurso:** ~10-14 oras | **Pag-unlad ng Kasanayan:** Beginner → Production-Ready

---

## 📚 Mga Kabanata ng Pagkatuto

*Piliin ang iyong landas sa pagkatuto batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Foundation & Quick Start
**Prerequisites**: Azure subscription, pangunahing kaalaman sa command line  
**Duration**: 30-45 minuto  
**Complexity**: ⭐

#### Ano ang Matututuhan Mo
- Pag-unawa sa mga pangunahing kaalaman ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan sa Pagkatuto
- **🎯 Magsimula Dito**: [Ano ang Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorya**: [Mga Pangunahing Kaalaman ng AZD](docs/chapter-01-foundation/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Mga gabay na partikular sa platform
- **🛠️ Hands-On**: [Ang Iyong Unang Proyekto](docs/chapter-01-foundation/first-project.md) - Sunod-sunod na tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilis na pagsusuri ng pag-install
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
azd init --template todo-nodejs-mongo  # Ini-initialize ang proyekto
azd up                  # Nag-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Inilaang Oras:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing application nang mag-isa
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing application nang mag-isa

---

### 🤖 Kabanata 2: AI-First Development (Inirerekomenda para sa mga AI Developer)
**Prerequisites**: Nakumpleto ang Kabanata 1  
**Duration**: 1-2 oras  
**Complexity**: ⭐⭐

#### Ano ang Matututuhan Mo
- Integrasyon ng Microsoft Foundry sa AZD
- Pag-deploy ng mga AI-powered application
- Pag-unawa sa mga konfigurasyon ng AI service

#### Mga Mapagkukunan sa Pagkatuto
- **🎯 Magsimula Dito**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Mag-deploy ng mga intelligent agents gamit ang AZD
- **📖 Mga Pattern**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Mag-deploy at pamahalaan ang mga AI model
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga AI solution
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based na pagkatuto gamit ang MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](#mga-mapagkukunan-ng-workshop)
- **📝 Mga Halimbawa**: [AZD Deployment Examples](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang aplikasyon ng AI
azd init --template azure-search-openai-demo
azd up

# Subukan ang karagdagang mga template ng AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at mag-configure ng isang AI-powered chat application na may RAG capabilities

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat mong magawa ang mga sumusunod:
azd init --template azure-search-openai-demo
azd up
# Subukan ang interface ng AI chat
# Magtanong at tumanggap ng mga tugon na pinapagana ng AI na may mga sanggunian
# Suriin na gumagana ang integrasyon ng paghahanap
azd monitor  # Suriin na ipinapakita ng Application Insights ang telemetry
azd down --force --purge
```

**📊 Inilaang Oras:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-configure ng production-ready na mga AI application  
**💰 Kamalayan sa Gastos:** Unawain ang $80-150/month na gastusin para sa dev, $300-3500/month para sa production

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa mga AI Deployment

**Development Environment (Tinatayang $80-150/buwan):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/buwan (batay sa token usage)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Production Environment (Tinatayang $300-3,500+/buwan):**
- Microsoft Foundry Models (PTU para sa consistent performance): $3,000+/buwan O Pay-as-go sa mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gamitin ang **Free Tier** Microsoft Foundry Models para sa pag-aaral (Azure OpenAI 50,000 tokens/buwan kasama)
- Patakbuhin ang `azd down` upang i-deallocate ang mga resource kapag hindi aktibo sa pag-develop
- Magsimula sa consumption-based billing, mag-upgrade sa PTU lamang para sa production
- Gamitin ang `azd provision --preview` upang tantiyahin ang gastos bago mag-deploy
- Paganahin ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagmo-monitor ng Gastos:**
```bash
# Suriin ang tinatayang buwanang gastos
azd provision --preview

# Subaybayan ang aktwal na gastos sa Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Configuration & Authentication
**Prerequisites**: Nakumpleto ang Kabanata 1  
**Duration**: 45-60 minuto  
**Complexity**: ⭐⭐

#### Ano ang Matututuhan Mo
- Konfigurasyon at pamamahala ng environment
- Mga best practice sa authentication at seguridad
- Pagpapangalan at organisasyon ng mga resource

#### Mga Mapagkukunan sa Pagkatuto
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Pag-setup ng environment
- **🔐 Seguridad**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Mga pattern ng authentication
- **📝 Mga Halimbawa**: [Database App Example](examples/database-app/README.md) - Mga AZD Database Examples

#### Mga Praktikal na Ehersisyo
- I-configure ang maramihang mga environment (dev, staging, prod)
- I-setup ang managed identity authentication
- Ipatupad ang mga environment-specific na konfigurasyon

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maramihang environment na may wastong authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code & Deployment
**Prerequisites**: Nakumpleto ang Mga Kabanata 1-3  
**Duration**: 1-1.5 oras  
**Complexity**: ⭐⭐⭐

#### Ano ang Matututuhan Mo
- Advanced na mga pattern ng deployment
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resource

#### Mga Mapagkukunan sa Pagkatuto
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Pamamahala ng Azure resource
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized na deployment

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na mga Bicep template
- Mag-deploy ng multi-service na mga application
- Magpatupad ng blue-green deployment strategies

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng kumplikadong multi-service na mga application gamit ang custom na infrastructure templates

---
### 🎯 Kabanata 5: Mga Solusyong Multi-Agent AI (Mas Mataas na Antas)
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kumpleksidad**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga pattern ng arkitekturang multi-agent
- Orkestrasyon at koordinasyon ng mga agent
- Mga deployment ng AI na handa para sa produksyon

#### Mga Pinagkukunang Pang-Aral
- **🤖 Tampok na Proyekto**: [Solusyong Multi-Agent para sa Retail](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Isang-click na deployment
- **📖 Arkitektura**: [Mga pattern ng koordinasyon ng multi-agent](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mga pattern

#### Praktikal na Ehersisyo
```bash
# I-deploy ang kumpletong multi-agent na solusyon para sa retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Suriin ang mga konfigurasyon ng agent
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at pamahalaan ang isang production-ready na multi-agent AI solution na may Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation & Planning
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Tagal**: 1 oras  
**Kumpleksidad**: ⭐⭐

#### Ano ang Matututuhan Mo
- Pagpaplano ng kapasidad at pag-validate ng mga resource
- Mga estratehiya sa pagpili ng SKU
- Mga pre-flight check at automation

#### Mga Pinagkukunang Pang-Aral
- **📊 Pagpaplano**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Pag-validate ng resource
- **💰 Pagpili**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- **✅ Pag-validate**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Mga automated script

#### Praktikal na Ehersisyo
- Patakbuhin ang mga script para sa pag-validate ng kapasidad
- I-optimize ang pagpili ng SKU para sa gastos
- Magpatupad ng mga automated pre-deployment checks

**💡 Kinalabasan ng Kabanata**: I-validate at i-optimize ang mga deployment bago isagawa

---

### 🚨 Kabanata 7: Troubleshooting & Debugging
**Mga Kinakailangan**: Nakumpleto ang anumang deployment na kabanata  
**Tagal**: 1-1.5 oras  
**Kumpleksidad**: ⭐⭐

#### Ano ang Matututuhan Mo
- Sistematikong mga pamamaraan ng debugging
- Mga karaniwang isyu at solusyon
- Troubleshooting na tiyak sa AI

#### Mga Pinagkukunang Pang-Aral
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Mga problema sa AI service

#### Praktikal na Ehersisyo
- I-diagnose ang mga pagkabigo sa deployment
- Lutasin ang mga isyu sa authentication
- I-debug ang connectivity ng AI service

**💡 Kinalabasan ng Kabanata**: Malaya na ma-diagnose at malutas ang mga karaniwang isyu sa deployment

---

### 🏢 Kabanata 8: Production & Enterprise Patterns
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kumpleksidad**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga estratehiya sa deployment para sa produksyon
- Mga pattern ng seguridad sa enterprise
- Monitoring at pag-optimize ng gastos

#### Mga Pinagkukunang Pang-Aral
- **🏭 Produksyon**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga komplikadong arkitektura
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktikal na Ehersisyo
- Ipatupad ang mga pattern ng seguridad para sa enterprise
- I-set up ang komprehensibong monitoring
- Mag-deploy sa produksyon na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga aplikasyon na handa para sa enterprise na may kumpletong kakayahan sa produksyon

---

## 🎓 Overview ng Workshop: Hands-On Learning Experience

> **⚠️ KATAYUAN NG WORKSHOP: Aktibong Pag-develop**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapahusay. Gumagana na ang mga pangunahing module, ngunit ang ilang advanced na seksyon ay hindi pa kumpleto. Aktibo kaming nagtatrabaho upang tapusin ang lahat ng nilalaman. [Subaybayan ang progreso →](workshop/README.md)

### Interactive na Materyales ng Workshop
**Komprehensibong hands-on learning gamit ang browser-based na mga tool at guided exercises**

Ang aming mga materyales sa workshop ay nagbibigay ng istrukturado, interactive na karanasan sa pag-aaral na sumusuporta sa curriculum na naka-batay sa mga kabanata sa itaas. Dinisenyo ang workshop para sa parehong self-paced na pag-aaral at mga sesyon na pinamumunuan ng instruktor.

#### 🛠️ Mga Tampok ng Workshop
- **Browser-Based Interface**: Kumpletong MkDocs-powered na workshop na may search, copy, at theme features
- **GitHub Codespaces Integration**: Isang-click na pag-setup ng development environment
- **Structured Learning Path**: 8-module na guided exercises (3-4 oras kabuuan)
- **Progressive Methodology**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interactive DevContainer Environment**: Pre-configured na mga tool at dependencies

#### 📚 Estruktura ng Module ng Workshop
Sinusunod ng workshop ang isang **8-module progressive methodology** na magdadala sa iyo mula discovery hanggang mastery ng deployment:

| Module | Paksa | Ano ang Gagawin Mo | Tagal |
|--------|-------|--------------------|----------|
| **0. Introduction** | Pangkalahatang-ideya ng Workshop | Maunawaan ang mga layunin sa pag-aaral, mga kinakailangan, at estruktura ng workshop | 15 min |
| **1. Selection** | Pagtuklas ng Template | Galugarin ang mga AZD template at piliin ang tamang AI template para sa iyong scenario | 20 min |
| **2. Validation** | Deploy & Verify | I-deploy ang template gamit ang `azd up` at i-validate na gumagana ang imprastruktura | 30 min |
| **3. Deconstruction** | Unawain ang Estruktura | Gamitin ang GitHub Copilot upang galugarin ang arkitektura ng template, mga Bicep file, at organisasyon ng code | 30 min |
| **4. Configuration** | Malalim na Pag-aaral ng azure.yaml | Masterin ang `azure.yaml` configuration, lifecycle hooks, at environment variables | 30 min |
| **5. Customization** | Gawing Iyo | Paganahin ang AI Search, tracing, evaluation, at i-customize para sa iyong scenario | 45 min |
| **6. Teardown** | Linisin | Ligtas na deprovision ng mga resource gamit ang `azd down --purge` | 15 min |
| **7. Wrap-up** | Mga Susunod na Hakbang | Balikan ang mga nagawa, mga pangunahing konsepto, at ipagpatuloy ang iyong pag-aaral | 15 min |

**Daloy ng Workshop:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Paano Magsimula sa Workshop
```bash
# Opsyon 1: GitHub Codespaces (Inirerekomenda)
# I-click ang "Code" → "Create codespace on main" sa repositoryo

# Opsyon 2: Lokal na pag-develop
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga tagubilin sa pagsasaayos sa workshop/README.md
```

#### 🎯 Mga Kinalabasan ng Pag-aaral sa Workshop
Sa pagkumpleto ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Mga AI Application na Handa para sa Produksyon**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Masanayan ang Mga Arkitekturang Multi-Agent**: Ipatupad ang mga naka-koordinasyong solusyon ng AI agent
- **Ipatupad ang Mga Pinakamahusay na Kasanayan sa Seguridad**: I-configure ang authentication at access control
- **I-optimize para sa Pag-scale**: Disenyuhin ang cost-effective, performant na mga deployment
- **Mag-troubleshoot ng Mga Deployment**: Lutasin ang mga karaniwang isyu nang mag-isa

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Workshop Materials](workshop/README.md) - Browser-based na learning environment
- **📋 Instruksyon Module-by-Module**:
  - [0. Panimula](workshop/docs/instructions/0-Introduction.md) - Pangkalahatang-ideya ng workshop at mga layunin
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Hanapin at piliin ang mga AI template
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - I-deploy at i-verify ang mga template
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Galugarin ang arkitektura ng template
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Masterin ang azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - I-customize para sa iyong scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Linisin ang mga resource
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Balik-aral at mga susunod na hakbang
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mga ehersisyong naka-pokus sa AI
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Pag-configure ng environment

**Perpekto para sa**: Pagsasanay ng korporasyon, mga kursong unibersidad, self-paced na pag-aaral, at mga developer bootcamp.

---

## 📖 Malalimang Pagsisid: Mga Kakayahan ng AZD

Higit pa sa mga pangunahing kaalaman, nag-aalok ang AZD ng malalakas na tampok para sa mga deployment sa produksyon:

- **Mga deployment na batay sa template** - Gamitin ang pre-built na mga template para sa mga karaniwang pattern ng aplikasyon
- **Imprastruktura bilang Code** - Pamahalaan ang mga Azure resource gamit ang Bicep o Terraform  
- **Pinagsamang mga workflow** - Walang putol na provisioning, deployment, at monitoring ng mga aplikasyon
- **Maginhawa para sa mga Developer** - In-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa Mga Deployment ng AI**

**Bakit AZD para sa Mga Solusyong AI?** Tinutugunan ng AZD ang mga pangunahing hamon na hinaharap ng mga AI developer:

- **AI-Ready Templates** - Mga pre-configured na template para sa Microsoft Foundry Models, Azure AI Services, at ML workloads
- **Secure AI Deployments** - Built-in na mga pattern ng seguridad para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Mga best practice para sa scalable, cost-effective na deployment ng AI application
- **End-to-End AI Workflows** - Mula sa pag-develop ng model hanggang sa production deployment na may tamang monitoring
- **Pag-optimize ng Gastos** - Matalinong alokasyon ng resource at mga estratehiya sa scaling para sa ML workloads
- **Microsoft Foundry Integration** - Walang putol na koneksyon sa Microsoft Foundry model catalog at endpoints

---

## 🎯 Templates & Library ng Mga Halimbawa

### Tampok: Microsoft Foundry Templates
**Magsimula dito kung magde-deploy ka ng mga AI application!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang pattern ng AI. Ang ilan ay external na Azure Samples, habang ang iba ay lokal na implementasyon.

| Template | Kabanata | Kumpleksidad | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Magsimula sa AI Chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |
| [**Magsimula sa AI Agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Panlabas |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Senaryo sa Pagkatuto
**Mga aplikasyon na handa para sa produksyon na naka-map sa mga kabanatang pang-aral**

| Template | Kabanata ng Pagkatuto | Kumpleksidad | Pangunahing Matututuhan |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng deployment ng AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Implementasyon ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Arkitekturang multi-agent na may Customer at Inventory agents |

### Pagkatuto sa Pamamagitan ng Halimbawa Uri

> **📌 Lokal vs. Panlabas na Mga Halimbawa:**  
> **Local Examples** (sa repo na ito) = Handa nang gamitin agad  
> **External Examples** (Azure Samples) = I-clone mula sa naka-link na mga repository

#### Lokal na Mga Halimbawa (Handa nang Gamitin)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong production-ready na implementasyon na may ARM templates
  - Arkitekturang multi-agent (Customer + Inventory agents)
  - Komprehensibong monitoring at evaluation
  - Isang-click na deployment via ARM template

#### Lokal na Mga Halimbawa - Container Applications (Kabanata 2-5)
**Komprehensibong mga halimbawa ng container deployment sa repository na ito:**
- [**Mga Halimbawa ng Container App**](examples/container-app/README.md) - Kumpletong gabay para sa mga containerized na deployment
  - [Simpleng Flask API](../../examples/container-app/simple-flask-api) - Pangunahing REST API na may scale-to-zero
  - [Arkitektura ng Microservices](../../examples/container-app/microservices) - Deployment ng maraming serbisyo na handa para sa produksyon
  - Mabilis na Pagsisimula, Produksyon, at Mga Advanced na pattern ng deployment
  - Patnubay sa pagsubaybay, seguridad, at pag-optimize ng gastos

#### Mga Panlabas na Halimbawa - Mga Simpleng Aplikasyon (Mga Kabanata 1-2)
**I-clone ang mga repositoryo ng Azure Samples na ito upang makapagsimula:**
- [Simpleng Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pangunahing mga pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pag-deploy ng static na nilalaman
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pag-deploy ng REST API

#### Mga Panlabas na Halimbawa - Integrasyon ng Database (Mga Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng koneksyon sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na daloy ng trabaho ng data

#### Mga Panlabas na Halimbawa - Mga Advanced na Pattern (Mga Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mga arkitekturang may maraming serbisyo
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Pagpoproseso sa background  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mga pattern ng ML na handa para sa produksyon

### Mga Panlabas na Koleksyon ng Template
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng mga opisyal at komunidad na template
- [**Mga Template ng Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng mga template sa Microsoft Learn
- [**Direktoryo ng Mga Halimbawa**](examples/README.md) - Mga lokal na halimbawa para sa pag-aaral na may detalyadong mga paliwanag

---

## 📚 Mga Mapagkukunan sa Pag-aaral at Mga Sanggunian

### Mabilis na Sanggunian
- [**Cheat Sheet ng Command**](resources/cheat-sheet.md) - Mahahalagang azd na mga utos na inayos ayon sa kabanata
- [**Talatinigan**](resources/glossary.md) - Mga termino sa Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pag-aaral
- [**Gabay sa Pag-aaral**](resources/study-guide.md) - Komprehensibong mga praktikal na ehersisyo

### Mga Hands-On na Workshop
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga solusyon sa AI (2-3 hours)
- [**Interactive Workshop**](workshop/README.md) - 8-module na pinangunahang mga ehersisyo gamit ang MkDocs at GitHub Codespaces
  - Sumusunod: Panimula → Pagpili → Pagpapatunay → Pagbuwag → Konfigurasyon → Pagpapasadya → Pagtanggal → Pagwawakas

### Mga Panlabas na Mapagkukunan sa Pag-aaral
- Azure Developer CLI Documentation: https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/
- Azure Architecture Center: https://learn.microsoft.com/en-us/azure/architecture/
- Azure Pricing Calculator: https://azure.microsoft.com/pricing/calculator/
- Azure Status: https://status.azure.com/

### Mga Kakayahan ng AI Agent para sa Iyong Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent skills para sa Azure AI, Foundry, deployment, diagnostics, pag-optimize ng gastos, at iba pa. I-install ang mga ito sa GitHub Copilot, Cursor, Claude Code, o anumang suportadong agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Karaniwang mga isyung kinakaharap ng mga nagsisimula at mga agarang solusyon:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Ilista ang mga magagamit na subscription
az account list --output table

# Itakda ang default na subscription
az account set --subscription "<subscription-id-or-name>"

# Itakda para sa kapaligiran ng AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Suriin
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Subukan ang ibang rehiyon ng Azure
azd env set AZURE_LOCATION "westus2"
azd up

# O gumamit ng mas maliliit na SKU sa pag-develop
# I-edit ang infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Opsyon 1: Linisin at subukan muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lang ang imprastruktura
azd provision

# Opsyon 3: Suriin ang detalyadong katayuan
azd show

# Opsyon 4: Suriin ang mga log sa Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Muling mag-authenticate para sa AZD
azd auth logout
azd auth login

# Opsyonal: i-refresh din ang Azure CLI kung nagpapatakbo ka ng mga az command
az logout
az login

# Suriin ang pag-authenticate
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# Lumilikha ang AZD ng mga natatanging pangalan, ngunit kung may konflikto:
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
- Mga AI application: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Suriin ang progreso
azd show

# Kung natigil nang higit sa 30 minuto, suriin ang Azure Portal:
azd monitor --overview
# Hanapin ang mga nabigong deployment
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Suriin ang iyong papel sa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa papel na "Contributor"
# Hilingin sa iyong Azure admin na magbigay ng:
# - Contributor (para sa mga resource)
# - User Access Administrator (para sa mga pagtatalaga ng papel)
```
</details>

<details>
<summary><strong>❌ Hindi makita ang URL ng na-deploy na aplikasyon</strong></summary>

```bash
# Ipakita ang lahat ng mga endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga variable na *_URL
```
</details>

### 📚 Kompletong Mga Mapagkukunan sa Pag-troubleshoot

- **Gabayan sa Karaniwang Isyu:** [Mga Detalyadong Solusyon](docs/chapter-07-troubleshooting/common-issues.md)
- **Mga Isyung Espesipiko sa AI:** [Pag-troubleshoot ng AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Gabay sa Pag-debug:** [Hakbang-hakbang na Pag-debug](docs/chapter-07-troubleshooting/debugging.md)
- **Humingi ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagkumpleto ng Kurso at Sertipikasyon

### Pagsubaybay ng Progreso
Subaybayan ang iyong pag-unlad sa pag-aaral sa bawat kabanata:

- [ ] **Kabanata 1**: Pundasyon at Mabilis na Pagsisimula ✅
- [ ] **Kabanata 2**: Pag-develop na Nakatuon sa AI ✅  
- [ ] **Kabanata 3**: Konfigurasyon at Pagpapatunay ✅
- [ ] **Kabanata 4**: Imprastraktura bilang Code at Deployment ✅
- [ ] **Kabanata 5**: Mga Solusyong Multi-Agent sa AI ✅
- [ ] **Kabanata 6**: Pagpapatunay at Pagpaplano bago ang Deployment ✅
- [ ] **Kabanata 7**: Pag-troubleshoot at Pag-debug ✅
- [ ] **Kabanata 8**: Mga Pattern para sa Produksyon at Enterprise ✅

### Pagpapatunay ng Pagkatuto
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Pangpraktikal na Ehersisyo**: Kumpletuhin ang hands-on na deployment ng kabanata
2. **Pagsusuri ng Kaalaman**: Balikan ang seksyon ng FAQ para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kahirapan

### Mga Benepisyo sa Pagkumpleto ng Kurso
Pagkatapos makumpleto ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasang Produksyon**: Nakapag-deploy ng tunay na AI na aplikasyon sa Azure
- **Mga Propesyonal na Kasanayan**: Kakayahang mag-deploy na handa para sa enterprise  
- **Pagkilala mula sa Komunidad**: Aktibong miyembro ng komunidad ng mga Azure developer
- **Pagsulong sa Karera**: Hinahangad na kadalubhasaan sa AZD at pag-deploy ng AI

---

## 🤝 Komunidad at Suporta

### Humingi ng Tulong at Suporta
- **Teknikal na Isyu**: [I-report ang mga bug at humiling ng mga feature](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong para sa AI**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Pananaw ng Komunidad mula sa Microsoft Foundry Discord

**Kamakailang Resulta ng Poll mula sa Channel na #Azure:**
- **45%** ng mga developer ang nais gumamit ng AZD para sa mga AI workload
- **Nangungunang mga hamon**: Mga multi-service deployment, pamamahala ng kredensyal, pagiging handa para sa produksyon  
- **Pinakahiniling**: Mga template na para sa AI, mga gabay sa pag-troubleshoot, mga pinakamahusay na kasanayan

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Mag-access ng mga maagang preview ng mga bagong template ng AI
- Mag-ambag sa pinakamahuhusay na kasanayan sa pag-deploy ng AI
- Maimpluwensyahan ang pag-develop ng mga susunod na feature ng AI + AZD

### Pag-ambag sa Kurso
Tinatanggap namin ang mga ambag! Mangyaring basahin ang aming [Gabay sa Pag-ambag](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapahusay ng Nilalaman**: Pagbutihin ang umiiral na mga kabanata at mga halimbawa
- **Bagong Mga Halimbawa**: Magdagdag ng mga totoong sitwasyon at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng suporta sa maraming wika
- **Ulat ng Bug**: Pahusayin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong mga panuntunan ng komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang file na [LICENSE](../../LICENSE) para sa mga detalye.

### Mga Kaugnay na Mapagkukunan sa Pagkatuto mula sa Microsoft

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pagkatuto:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para sa Mga Nagsisimula](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para sa Mga Nagsisimula](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para sa Mga Nagsisimula](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD para sa Mga Nagsisimula](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para sa Mga Nagsisimula](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para sa Mga Nagsisimula](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents para sa Mga Nagsisimula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serye ng Generative AI
[![Generative AI para sa Mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatibong AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pangunahing Pagkatuto
[![ML para sa mga Nagsisimula](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Agham ng Datos para sa mga Nagsisimula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa mga Nagsisimula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Siberseguridad para sa mga Nagsisimula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa mga Nagsisimula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa mga Nagsisimula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![Pag-unlad ng XR para sa mga Nagsisimula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serye ng Copilot
[![Copilot para sa Magkatuwang na Pagpoprograma ng AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pakikipagsapalaran ng Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Pag-navigate ng Kurso

**🚀 Handa nang Magsimulang Matuto?**

**Mga Nagsisimula**: Magsimula sa [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](#-chapter-1-foundation--quick-start)  
**Mga Developer ng AI**: Tumalon sa [Kabanata 2: Pag-develop na Nauuna ang AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Mga Karanasang Developer**: Magsimula sa [Kabanata 3: Konfigurasyon at Pagpapatunay](#️-chapter-3-configuration--authentication)

**Susunod na Hakbang**: [Simulan ang Kabanata 1 - Mga Pangunahing Kaalaman sa AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->