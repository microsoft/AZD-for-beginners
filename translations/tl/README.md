# AZD Para sa Mga Baguhan: Isang Istrakturadong Paglalakbay sa Pag-aaral

![AZD-for-beginners](../../translated_images/tl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Mga Automated na Pagsasalin (Palaging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Mas Gusto Mo Bang I-clone Nang Lokal?**
>
> Kasama sa repository na ito ang mahigit 50 pagsasalin sa iba't ibang wika na nagpapalaki nang malaki sa laki ng pag-download. Para mag-clone nang walang mga pagsasalin, gamitin ang sparse checkout:
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
> Ibinibigay nito sa iyo ang lahat ng kailangan mo para matapos ang kurso nang mas mabilis ang pag-download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Anong Bago sa azd Ngayon

> 📌 Ang kursong ito ay nilagyan ng beripikasyon laban sa **`azd 1.27.1`** (Hulyo 2026). Patakbuhin ang `azd version` upang suriin ang iyong build, at `azd upgrade` upang makuha ang pinakabago.

Lumawak na ang Azure Developer CLI lampas sa tradisyonal na web apps at APIs. Ngayon, ang azd ay ang natatanging tool para i-deploy ang **anumang** aplikasyon sa Azure—kabilang ang mga AI-powered na aplikasyon at intelihenteng ahente.

Ito ang ibig sabihin nito para sa iyo:

- **Ngayon, ang mga AI agent ay unang-klaseng azd workloads.** Maaari kang mag-initialize, mag-deploy, at pamahalaan ang mga AI agent na proyekto gamit ang parehas na `azd init` → `azd up` na daloy ng trabaho na pamilyar ka na.
- **Isang kumpletong lifecycle ng ahente mula sa CLI.** Saklaw na ng `azure.ai.agents` extension ang buong paglalakbay—`azd ai agent init` para sa scaffold, `azd ai agent invoke` para sa testing (na may output ng response-timing), `azd ai agent eval generate` at `azd ai agent optimize` para sukatin at pagbutihin ang kalidad, at `azd ai agent delete` para maglinis.
- **Mas maraming AI building blocks.** Ang bagong preview extensions—`azure.ai.skills` at `azure.ai.connections`—ay nagbibigay-daan para pamahalaan ang reusable agent skills at Foundry connections nang direkta sa azd.
- **Integrasyon ng Microsoft Foundry** na nagdadala ng model deployment, agent hosting, at AI service configuration nang direkta sa azd template ecosystem.
- **Mas maayos na pang-araw-araw na mga basic.** Ang mga huling release ay ginawa ang `azd init` idempotent (ligtas ulitin), nilinaw ang `azd auth login` na awtomatikong naglilinis ng mga stale token, at nagdagdag ng magiliw na `azd tool` unang run setup prompt.
- **Hindi nagbago ang pangunahing daloy ng trabaho.** Kahit na nag-de-deploy ka ng todo app, microservice, o multi-agent AI solution, pareho pa rin ang mga command.

> **Tandaan para sa mga gumagamit ng Aspire:** Tawag na lang ngayon ng Microsoft sa produkto ay **Aspire** (dati ".NET Aspire"). Walang pagbabago sa suporta ng azd para sa Aspire—pinalitan lang ang pangalan.

Kung ginamit mo na ang azd noon, ang suporta sa AI ay isang natural na extension—hindi hiwalay na tool o advanced track. Kung nagsisimula ka, matututuhan mo ang isang workflow na gumagana para sa lahat.

---

## 🚀 Ano ang Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ay isang madaling gamitin na command-line tool para sa mga developer na nagpapadali sa pag-deploy ng mga aplikasyon sa Azure. Sa halip na manu-manong gumawa at mag-connect ng maraming Azure resources, maaari kang mag-deploy ng buong aplikasyon gamit ang iisang command.

### Ang Magic ng `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Iyon lang!** Walang pag-click sa Azure Portal, walang komplikadong ARM templates na kailangang matutuhan muna, walang manual na configuration - direktang gumagana ang mga aplikasyon sa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ano ang Pagkakaiba?

Ito ang pinakakaraniwang tanong ng mga baguhan. Narito ang simpleng sagot:

| Tampok | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Layunin** | Pamahalaan ang indibidwal na Azure resources | I-deploy ang kumpletong mga aplikasyon |
| **Isipang ginagamit** | Nakatuon sa imprastraktura | Nakatuon sa aplikasyon |
| **Halimbawa** | `az webapp create --name myapp...` | `azd up` |
| **Antas ng Pagkatuto** | Kailangan marunong ng Azure services | Kailangan marunong lang ng iyong app |
| **Pinakamainam Para sa** | DevOps, Imprastraktura | Mga Developer, Prototyping |

### Simpleng Paghahambing

- **Azure CLI** ay parang may kompleto kang gamit para magtayo ng bahay - martilyo, lagari, pako. Kaya mong magtayo ng anuman, pero kailangan mo marunong sa konstruksyon.
- **Azure Developer CLI** ay parang kumuha ka ng kontratista - sasabihin mo kung ano gusto mo, sila ang bahala sa pagtatayo.

### Kailan Gagamitin ang Bawat Isa

| Sitwasyon | Gamitin Ito |
|----------|----------|
| "Gusto kong mabilis na ideploy ang web app ko" | `azd up` |
| "Kailangan ko lang gumawa ng storage account" | `az storage account create` |
| "Gumagawa ako ng full AI application" | `azd init --template azure-search-openai-demo` |
| "Kailangan kong i-debug ang isang Azure resource" | `az resource show` |
| "Gusto ko ng production-ready deployment sa loob ng ilang minuto" | `azd up --environment production` |

### Magkasamang Gumagana!

Ginagamit ng AZD ang Azure CLI sa likod ng mga eksena. Pwede mong gamitin ang dalawa:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Maghanap ng Mga Template sa Awesome AZD

Huwag magsimula sa wala! **Awesome AZD** ay ang komunidad na koleksyon ng mga handang i-deploy na template:

| Resource | Paglalarawan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Mag-browse ng higit 200 template na may one-click deploy |
| 🔗 [**Mag-submit ng Template**](https://github.com/Azure/awesome-azd/issues) | Mag-ambag ng sarili mong template sa komunidad |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | I-star at tuklasin ang pinagmulan |

### Mga Popular na AI Template mula sa Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Pagsisimula sa 3 Hakbang

Bago ka magsimula, siguraduhin na handa ang iyong makina para sa template na nais mong i-deploy:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Kung may kailangang tsek na pumalya, ayusin muna iyon bago magpatuloy sa mabilis na pagsisimula.

### Hakbang 1: Mag-install ng AZD (2 minuto)

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
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Kung hindi ka sigurado kung alin ang kailangan mo, sundan ang buong proseso ng setup sa [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Hakbang 3: I-deploy ang Iyong Unang App

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Iyan na iyon!** Live na ang iyong app sa Azure.

### Linisin (Huwag Kalimutan!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Paano Gamitin ang Kursong Ito

Dinisenyo ang kurso na ito para sa **pagsusulong ng pagkatuto** - magsimula kung saan ka komportable at unti-unting umakyat:

| Iyong Karanasan | Magsimula Dito |
|-----------------|------------|
| **Baguhan sa Azure** | [Kabanata 1: Pundasyon](#-chapter-1-foundation--quick-start) |
| **Marunong sa Azure, bago sa AZD** | [Kabanata 1: Pundasyon](#-chapter-1-foundation--quick-start) |
| **Nais mag-deploy ng AI apps** | [Kabanata 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Nais ng hands-on na pagsasanay** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 na oras na gabay na lab |
| **Kailangan ng production patterns** | [Kabanata 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Mabilis na Setup

1. **I-fork ang Repository na Ito**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone Ito**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Humingi ng Tulong**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Mas Gusto Mo Bang I-clone Nang Lokal?**

> Kasama sa repository na ito ang mahigit 50 pagsasalin sa iba't ibang wika na nagpapalaki nang malaki sa laki ng pag-download. Para mag-clone nang walang mga pagsasalin, gamitin ang sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ibinibigay nito sa iyo ang lahat ng kailangan mo para matapos ang kurso nang mas mabilis ang pag-download.


## Pangkalahatang Buod ng Kurso

Maging dalubhasa sa Azure Developer CLI (azd) sa pamamagitan ng mga istrakturadong kabanata na idinisenyo para sa progresibong pag-aaral. **Partikular na tutok sa pag-deploy ng AI application na may integrasyon ng Microsoft Foundry.**

### Bakit Mahalagang-Kaalaman ang Kursong Ito para sa Mga Modernong Developer

Batay sa insights ng Microsoft Foundry Discord community, **45% ng mga developer ay nais gamitin ang AZD para sa AI workloads** ngunit nahaharap sa mga suliranin tungkol sa:
- Kumplikadong multi-service AI architectures
- Pinakamahusay na mga kasanayan sa production AI deployment  
- Integrasyon at configuration ng Azure AI services
- Pag-optimize ng gastos para sa AI workloads
- Pagsasaayos ng AI-specific deployment issues

### Mga Layunin ng Pagkatuto

Sa pagtatapos ng istrakturadong kursong ito, ikaw ay:
- **Magiging bihasa sa mga Pangunahing Kaalaman sa AZD**: Mga pangunahing konsepto, pag-install, at configuration
- **Makakapag-deploy ng mga AI Application**: Gamit ang AZD na may Microsoft Foundry services
- **Ipapatupad ang Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang mga Bicep template
- **Ayusin ang Mga Deployment**: Lutasin ang mga karaniwang isyu at i-debug ang mga problema
- **I-optimize para sa Produksyon**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Bumuo ng Multi-Agent na Mga Solusyon**: Mag-deploy ng mga kumplikadong AI na arkitektura

## Bago Ka Magsimula: Mga Account, Access, at mga Palagay

Bago mo simulan ang Kabanata 1, tiyaking mayroon kang mga sumusunod. Ang mga hakbang sa pag-install sa susunod ng gabay na ito ay inaasahan na ang mga pangunahing ito ay naayos na.

- **Isang Azure subscription**: Maaari kang gumamit ng umiiral na subscription mula sa trabaho o sariling account mo, o gumawa ng [libreng pagsubok](https://aka.ms/azurefreetrial) para makapagsimula.
- **Pahintulot na gumawa ng mga Azure resource**: Para sa karamihan ng mga pagsasanay, dapat mayroon kang hindi bababa sa **Contributor** na access sa target na subscription o resource group. Ang ilang mga kabanata ay maaaring asahan din na makakagawa ka ng mga resource group, managed identities, at RBAC assignments.
- [**Isang GitHub account**](https://github.com): Ito ay kapaki-pakinabang para sa pag-fork ng repository, pagtunton ng sarili mong mga pagbabago, at paggamit ng GitHub Codespaces para sa workshop.
- **Mga kinakailangan sa runtime ng template**: Ang ilang mga template ay nangangailangan ng lokal na mga tool tulad ng Node.js, Python, Java, o Docker. Patakbuhin ang setup validator bago magsimula upang maagapan ang mga kulang na tool nang maaga.
- **Pangunahing pamilyaridad sa terminal**: Hindi mo kailangang maging eksperto, ngunit dapat komportable kang magpatakbo ng mga utos tulad ng `git clone`, `azd auth login`, at `azd up`.

> **Nagtatrabaho sa isang enterprise subscription?**
> Kung ang iyong Azure environment ay pinamamahalaan ng isang administrator, kumpirmahin nang maaga na maaari kang mag-deploy ng mga resource sa subscription o resource group na iyong balak gamitin. Kung hindi, humingi ng sandbox subscription o Contributor access bago ka magsimula.

> **Bago sa Azure?**
> Magsimula sa sariling Azure trial o pay-as-you-go subscription sa https://aka.ms/azurefreetrial para makumpleto mo ang mga pagsasanay mula simula hanggang wakas nang hindi na kailangang maghintay ng mga aprubal sa tenant-level.

## 🗺️ Mapa ng Kurso: Mabilis na Pag-navigate ayon sa Kabanata

Ang bawat kabanata ay may dedikadong README na may mga layunin sa pag-aaral, mabilisang panimula, at mga pagsasanay:

| Kabanata | Paksa | Mga Aralin | Tagal | Kakulangan |
|---------|-------|---------|----------|------------|
| **[Kabanata 1: Pundasyon](docs/chapter-01-foundation/README.md)** | Pagsisimula | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kabanata 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kabanata 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kabanata 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kabanata 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kabanata 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kabanata 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kabanata 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Kabuuang Tagal ng Kurso:** ~10-14 na oras | **Pagsulong ng Kasanayan:** Baguhan → Handa sa Produksyon

---

## 📚 Mga Kabanata sa Pag-aaral

*Pumili ng landas ng pag-aaral batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon at Mabilisang Panimula
**Mga Kinakailangan**: Azure subscription, batayang kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kakulangan**: ⭐

#### Ano ang Iyong Matututunan
- Pag-intindi ng mga pundasyon ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Iyong unang matagumpay na deployment

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Magsimula Dito**: [Ano ang Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorya**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Pag-install at Setup](docs/chapter-01-foundation/installation.md) - Mga gabay para sa partikular na platform
- **🛠️ Hands-On**: [Iyong Unang Proyekto](docs/chapter-01-foundation/first-project.md) - Hakbang-hakbang na tutorial
- **📋 Mabilisang Sanggunian**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Pagsasanay
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kinalabasan ng Kabanata**: Matagumpay na makapag-deploy ng simpleng web application sa Azure gamit ang AZD

**✅ Pagpapatunay ng Tagumpay:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Oras na Inilaan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga batayang aplikasyon nang mag-isa
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga batayang aplikasyon nang mag-isa

---

### 🤖 Kabanata 2: AI-First Development (Inirerekomenda para sa mga AI Developer)
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kakulangan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Microsoft Foundry integration sa AZD
- Pag-deploy ng mga AI-powered na aplikasyon
- Pag-unawa ng mga AI service configuration

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Magsimula Dito**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Mag-deploy ng mga intelligent agents gamit ang AZD
- **📖 Mga Pattern**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Mag-deploy at pamahalaan ang mga AI model
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga AI solution
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Pag-aaral gamit ang browser sa MkDocs * DevContainer Environment
- **📋 Mga Template**: [Microsoft Foundry Templates](#featured-microsoft-foundry-templates)
- **📝 Mga Halimbawa**: [AZD Deployment Examples](examples/README.md)

#### Mga Praktikal na Pagsasanay
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at mag-configure ng AI-powered na chat application na may RAG capabilities

**✅ Pagpapatunay ng Tagumpay:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Oras na Inilaan:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-configure ng AI application na handa na para sa produksyon  
**💰 Kamalayan sa Gastos:** Unawain ang $80-150/buwan para sa dev costs, $300-3500/buwan para sa production costs

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa mga AI Deployment

**Development Environment (Tinatayang $80-150/buwan):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/buwan (batay sa paggamit ng token)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Production Environment (Tinatayang $300-3,500+/buwan):**
- Microsoft Foundry Models (PTU para sa consistent na performance): $3,000+/buwan O Pay-as-go na may mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gumamit ng **Free Tier** Microsoft Foundry Models para sa pag-aaral (Azure OpenAI 50,000 tokens/buwan kasama na)
- Patakbuhin ang `azd down` para i-deallocate ang mga resource kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based billing, i-upgrade sa PTU para lang sa produksyon
- Gumamit ng `azd provision --preview` para tantiyahin ang gastos bago mag-deploy
- Paganahin ang auto-scaling: magbayad lang para sa aktwal na paggamit

**Pagsubaybay sa Gastos:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Configuration at Authentication
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kakulangan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Pag-configure at pamamahala ng environment
- Mga pinakamahusay na kasanayan sa authentication at seguridad
- Pagtatalaga ng pangalan at organisasyon ng resource

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Configuration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Pag-setup ng environment
- **🔐 Seguridad**: [Authentication patterns at managed identity](docs/chapter-03-configuration/authsecurity.md) - Mga pattern sa authentication
- **📝 Mga Halimbawa**: [Database App Example](examples/database-app/README.md) - Mga halimbawa ng AZD Database

#### Mga Praktikal na Pagsasanay
- Mag-configure ng maraming environment (dev, staging, prod)
- Mag-setup ng managed identity authentication
- Ipatupad ang mga configuration na tiyak sa environment

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maraming environment na may wastong authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kakulangan**: ⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga advanced na pattern sa deployment
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resources

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Kumpletong mga workflow
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Pamamahala ng Azure resource
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized na deployment

#### Mga Praktikal na Pagsasanay
- Gumawa ng custom na mga Bicep template
- Mag-deploy ng mga multi-service application
- Ipatupad ang mga estratehiya sa blue-green deployment

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng kumplikadong multi-service applications gamit ang mga custom na infrastructure template

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kakulangan**: ⭐⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga pattern ng multi-agent architecture
- Orkestrasyon at koordinasyon ng mga agent
- Mga AI deployment na handa na para sa produksyon

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Tampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mga pattern

#### Mga Praktikal na Pagsasanay
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at pamahalaan ang production-ready na multi-agent AI solution na may Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation at Planning
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Tagal**: 1 oras  
**Kakulangan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Pagpaplano ng kapasidad at pagpapatunay ng resources
- Mga estratehiya sa pagpili ng SKU
- Mga pre-flight check at automation

#### Mga Mapagkukunan sa Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Pagpapatunay ng mga mapagkukunan
- **💰 Pagpili**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Mga matipid na pagpipilian
- **✅ Pagpapatunay**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Mga automated na script

#### Mga Praktikal na Pagsasanay
- Patakbuhin ang mga script para sa pagpapatunay ng kapasidad
- I-optimize ang mga pagpipilian ng SKU para sa gastos
- Ipatupad ang mga automated na pagsusuri bago ang deployment

**💡 Kinalabasan ng Kabanata**: Patunayan at i-optimize ang mga deployment bago isagawa

---

### 🚨 Kabanata 7: Pag-troubleshoot at Pag-debug
**Mga Kinakailangan**: Natapos ang anumang kabanata ng deployment  
**Tagal**: 1-1.5 na oras  
**Kasukdulan**: ⭐⭐

#### Ano ang Matututunan Mo
- Sistematikong mga paraan ng pag-debug
- Mga karaniwang isyu at solusyon
- Troubleshooting na nakatuon sa AI

#### Mga Mapagkukunan sa Pagkatuto
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Pag-debug**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Hakbang-hakbang na mga estratehiya
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Mga problema sa serbisyo ng AI

#### Mga Praktikal na Pagsasanay
- Diagnosen ang mga pagkabigo sa deployment
- Lutasin ang mga isyu sa authentication
- I-debug ang konektibidad ng serbisyo ng AI

**💡 Kinalabasan ng Kabanata**: Mag-diagnose at mag-resolba ng mga karaniwang isyu sa deployment nang mag-isa

---

### 🏢 Kabanata 8: Mga Pattern sa Produksyon at Enterprise
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kasukdulan**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga estratehiya sa production deployment
- Mga pattern sa seguridad ng enterprise
- Monitoring at pag-optimize ng gastos

#### Mga Mapagkukunan sa Pagkatuto
- **🏭 Produksyon**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Mga pattern ng enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga komplikadong arkitektura
- **📊 Pagsubaybay**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Pagsubaybay

#### Mga Praktikal na Pagsasanay
- Ipatupad ang mga pattern ng seguridad ng enterprise
- Mag-set up ng komprehensibong pagsubaybay
- Mag-deploy sa produksyon na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga aplikasyong handa na para sa enterprise na may buong kakayahan sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Hands-On Learning Experience

> **⚠️ KALAGAYAN NG WORKSHOP: Aktibong Pag-develop**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapahusay. Functional ang mga pangunahing module, ngunit hindi pa kumpleto ang ilang advanced na bahagi. Aktibo naming tinatrabaho ang pagkumpleto ng lahat ng nilalaman. [Subaybayan ang progreso →](workshop/README.md)

### Interaktibong Materyales ng Workshop
**Komprehensibong hands-on learning gamit ang browser-based na mga kasangkapan at guided na mga pagsasanay**

Nagbibigay ang aming mga materyales ng workshop ng istrukturadong, interaktibong karanasan sa pagkatuto na sumusuporta sa curriculum na naka-base sa mga kabanata sa itaas. Dinisenyo ang workshop para sa parehong self-paced na pag-aaral at mga sesyon na pinamumunuan ng instruktor.

#### 🛠️ Mga Tampok ng Workshop
- **Browser-Based Interface**: Kumpletong MkDocs-powered na workshop na may paghahanap, pag-copy, at mga tema
- **GitHub Codespaces Integration**: Isang click lang para sa pag-setup ng environment sa pag-develop
- **Istrakturadong Landas ng Pagkatuto**: 8-module guided na mga pagsasanay (3-4 na oras kabuuan)
- **Progressive Methodology**: Panimula → Pagpili → Pagpapatunay → Pagde-deconstruct → Pag-configure → Pag-customize → Pag-teardown → Pagwawakas
- **Interaktibong DevContainer Environment**: Mga paunang-configure na kasangkapan at dependencies

#### 📚 Estruktura ng Mga Module ng Workshop
Sinusunod ng workshop ang isang **8-module progressive methodology** na magdadala sa iyo mula sa pagtuklas hanggang sa mastery sa deployment:

| Module | Paksa | Ano ang Gagawin Mo | Tagal |
|--------|-------|----------------|----------|
| **0. Panimula** | Pangkalahatang-ideya ng Workshop | Unawain ang mga layunin sa pagkatuto, mga kinakailangan, at estruktura ng workshop | 15 min |
| **1. Pagpili** | Pagtuklas ng Template | Suriin ang mga AZD template at piliin ang tamang AI template para sa iyong senaryo | 20 min |
| **2. Pagpapatunay** | Mag-deploy at Mag-verify | I-deploy ang template gamit ang `azd up` at patunayan na gumagana ang imprastraktura | 30 min |
| **3. Pag-deconstruct** | Unawain ang Estruktura | Gamitin ang GitHub Copilot upang tuklasin ang arkitektura ng template, mga Bicep file, at organisasyon ng code | 30 min |
| **4. Pag-configure** | Malalim sa azure.yaml | Masterin ang konfigurasyon ng `azure.yaml`, lifecycle hooks, at mga environment variable | 30 min |
| **5. Pag-customize** | Gawing Iyo | Paganahin ang AI Search, tracing, evaluation, at i-customize para sa iyong senaryo | 45 min |
| **6. Pag-teardown** | Maglinis | Ligtas na i-deprovision ang mga mapagkukunan gamit ang `azd down --purge` | 15 min |
| **7. Pagwawakas** | Mga Susunod na Hakbang | Suriin ang mga nagawa, pangunahing konsepto, at ipagpatuloy ang iyong pag-aaral | 15 min |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Mga Kinalabasan sa Pagkatuto ng Workshop
Sa pagtatapos ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Mga Produksyon na AI Application**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Maging Master sa Multi-Agent Architectures**: Ipatupad ang mga koordinadong solusyon ng AI agent
- **Ipatupad ang Mga Pinakamahuhusay na Paraan sa Seguridad**: I-configure ang authentication at access control
- **I-optimize para sa Sukat**: Disenyo ng matipid sa gastos at mataas ang pagganap na mga deployment
- **Mag-troubleshoot ng Mga Deployment**: Lutasin ang mga karaniwang isyu nang mag-isa

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Workshop Materials](workshop/README.md) - Browser-based na kapaligiran sa pagkatuto
- **📋 Mga Tagubilin Module-by-Module**:
  - [0. Panimula](workshop/docs/instructions/0-Introduction.md) - Pangkalahatang ideya at mga layunin ng workshop
  - [1. Pagpili](workshop/docs/instructions/1-Select-AI-Template.md) - Hanapin at piliin ang mga AI template
  - [2. Pagpapatunay](workshop/docs/instructions/2-Validate-AI-Template.md) - I-deploy at patunayan ang mga template
  - [3. Pag-deconstruct](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tuklasin ang arkitektura ng template
  - [4. Pag-configure](workshop/docs/instructions/4-Configure-AI-Template.md) - Masterin ang azure.yaml
  - [5. Pag-customize](workshop/docs/instructions/5-Customize-AI-Template.md) - I-customize para sa iyong senaryo
  - [6. Pag-teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Linisin ang mga mapagkukunan
  - [7. Pagwawakas](workshop/docs/instructions/7-Wrap-up.md) - Suriin at mga susunod na hakbang
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mga pagsasanay na nakatuon sa AI
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Konfigurasyon ng kapaligiran

**Perpekto para sa**: Pagsasanay ng korporasyon, mga kurso sa unibersidad, self-paced na pag-aaral, at mga developer bootcamp.

---

## 📖 Malalimang Pag-aaral: Mga Kakayahan ng AZD

Higit pa sa mga pangunahing kaalaman, nagbibigay ang AZD ng makapangyarihang mga tampok para sa production deployments:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa mga karaniwang pattern ng aplikasyong
- **Infrastructure as Code** - Pamahalaan ang mga Azure resource gamit ang Bicep o Terraform  
- **Integrated workflows** - Walang putol na pagpaprovide, deployment, at pagsubaybay ng mga aplikasyong
- **Developer-friendly** - Optimized para sa pagiging produktibo at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa Mga Deployment ng AI**

**Bakit AZD para sa Mga Solusyong AI?** Nilalapatan ng AZD ang mga pangunahing hamon na hinarap ng mga AI developer:

- **AI-Ready Templates** - Pre-configured na mga template para sa Microsoft Foundry Models, Azure AI Services, at mga ML workload
- **Secure AI Deployments** - Built-in na mga pattern ng seguridad para sa mga serbisyo ng AI, API keys, at mga endpoint ng modelo  
- **Production AI Patterns** - Pinakamahuhusay na pamamaraan para sa scalable at matipid sa gastos na mga deployment ng AI application
- **End-to-End AI Workflows** - Mula sa pag-develop ng modelo hanggang sa production deployment na may tamang pagsubaybay
- **Cost Optimization** - Matalinong alokasyon ng resource at mga estratehiya sa scaling para sa mga workload ng AI
- **Microsoft Foundry Integration** - Walang putol na koneksyon sa katalogo ng modelo ng Microsoft Foundry at mga endpoint

---

## 🎯 Mga Template at Aklatang mga Halimbawa

### Tampok: Mga Template ng Microsoft Foundry
**Simulan dito kung magde-deploy ka ng mga AI application!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang mga pattern ng AI. Ang ilan ay mga external Azure Samples, ang iba ay lokal na mga implementasyon.

| Template | Kabanata | Kasukdulan | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Simulan ang AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |
| [**Simulan ang AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Panlabas |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Senaryo ng Pagkatuto
**Mga template ng aplikasyon na handa na para sa produksyon na naka-map sa mga kabanata ng pagkatuto**

| Template | Kabanata sa Pagkatuto | Kasukdulan | Pangunahing Pagkatuto |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng AI deployment |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Implementasyon ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Framework ng agent at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Orkestrasyon ng enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture na may Customer at Inventory agents |

### Pag-aaral sa pamamagitan ng Uri ng Halimbawa

> **📌 Lokal vs. Panlabas na mga Halimbawa:**  
> **Mga Lokal na Halimbawa** (sa repo na ito) = Handa nang gamitin kaagad  
> **Panlabas na mga Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repositoryo

#### Mga Lokal na Halimbawa (Handa nang Gamitin)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong produksyong handa na implementasyon gamit ang ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Komprehensibong pagsubaybay at ebalwasyon
  - One-click deployment sa pamamagitan ng ARM template

#### Mga Lokal na Halimbawa - Mga Container Application (Mga Kabanata 2-5)
**Mga komprehensibong halimbawa ng deployment ng container sa repository na ito:**
- [**Mga Halimbawa ng Container App**](examples/container-app/README.md) - Kumpletong gabay sa containerized na mga deployment
  - [Simpleng Flask API](../../examples/container-app/simple-flask-api) - Pangunahing REST API na may scale-to-zero
  - [Arkitekturang Microservices](../../examples/container-app/microservices) - Produksyon-handa na multi-service na deployment
  - Quick Start, Produksyon, at Advanced na mga pattern ng deployment
  - Pagsubaybay, seguridad, at gabay sa pag-optimize ng gastos

#### Mga Panlabas na Halimbawa - Simpleng Mga Aplikasyon (Mga Kabanata 1-2)
**I-clone ang mga repository ng Azure Samples na ito upang makapagsimula:**
- [Simpleng Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga pangunahing pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment ng static content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment ng REST API

#### Mga Panlabas na Halimbawa - Integrasyon ng Database (Mga Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng konektibidad sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na workflow ng data

#### Mga Panlabas na Halimbawa - Advanced na Mga Pattern (Mga Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mga arkitekturang multi-service
- [Mga Trabaho sa Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produksyon-handa na mga pattern ng ML

### Mga Panlabas na Koleksyon ng Template
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng opisyal at komunidad na mga template
- [**Mga Template ng Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng Microsoft Learn template
- [**Direktoryo ng Mga Halimbawa**](examples/README.md) - Mga lokal na halimbawa ng pagkatuto na may detalyadong paliwanag

---

## 📚 Mga Mapagkukunan sa Pagkatuto at Mga Sanggunian

### Mabilisang Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahalagang mga utos ng azd na inayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Malawak na mga pagsasanay na praktikal

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga solusyon sa AI (2-3 na oras)
- [**Interactive Workshop**](workshop/README.md) - 8-module na ginabay na mga pagsasanay gamit ang MkDocs at GitHub Codespaces
  - Sunod-sunod: Panimula → Pagpili → Pagpapatunay → Pagbubuwag → Pag-configure → Pag-customize → Pagwawakas → Pagsasara

### Panlabas na Mga Sanggunian para sa Pagkatuto
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### Mga Kasanayan ng AI Agent para sa Iyong Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 bukas na kasanayan ng agent para sa Azure AI, Foundry, deployment, diagnostics, cost optimization, at iba pa. I-install ang mga ito sa GitHub Copilot, Cursor, Claude Code, o anumang suportadong agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Karaniwang mga isyu na kinakaharap ng mga nagsisimula at agaran na mga solusyon:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal na oras ng paghihintay:**
- Simple web app: 5-10 minuto
- App na may database: 10-15 minuto
- Mga AI na aplikasyon: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Kumpletong Mga Sanggunian sa Pag-troubleshoot

- **Base sa mga Karaniwang Isyu:** [Detalyadong Mga Solusyon](docs/chapter-07-troubleshooting/common-issues.md)
- **Mga Isyu na Tanging AI:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Gabay sa Pag-debug:** [Hakbang-hakbang na Pag-debug](docs/chapter-07-troubleshooting/debugging.md)
- **Kumuha ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagtatapos ng Kurso at Sertipikasyon

### Pagsubaybay ng Progreso
Subaybayan ang iyong progreso sa pag-aaral sa bawat kabanata:

- [ ] **Kabanata 1**: Pundasyon at Mabilisang Pagsisimula ✅
- [ ] **Kabanata 2**: AI-First na Pag-develop ✅  
- [ ] **Kabanata 3**: Pag-configure at Pagpapatunay sa Pagkilala ✅
- [ ] **Kabanata 4**: Infrastructure as Code & Pagbibigay ng Deployment ✅
- [ ] **Kabanata 5**: Multi-Agent AI Solutions ✅
- [ ] **Kabanata 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Kabanata 7**: Pag-troubleshoot at Pag-debug ✅
- [ ] **Kabanata 8**: Mga Pattern para sa Produkto at Enterprise ✅

### Pagpapatunay ng Pagkatuto
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Pagsasanay**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Pagsusuri ng Kaalaman**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kahirapan

### Mga Benepisyo sa Pagtatapos ng Kurso
Kapag natapos mo na ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasang Produkto**: Na-deploy na mga totoong AI applications sa Azure
- **Propesyonal na Kasanayan**: Kakayahang mag-deploy para sa mga enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng Azure developer community
- **Pagsulong sa Karera**: Mahabang hinahanap na kasanayan sa AZD at AI deployment

---

## 🤝 Komunidad at Suporta

### Kumuha ng Tulong at Suporta
- **Teknikal na Isyu**: [I-report ang mga bugs at humiling ng mga tampok](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pagkatuto**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong na Tanging AI**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Pananaw sa Komunidad mula sa Microsoft Foundry Discord

**Mga Resulta ng Pinakabagong Botohan mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gumamit ng AZD para sa mga AI workload
- **Nangungunang mga hamon**: Multi-service deployments, pamamahala ng kredensyal, kahandaan para sa produksyon  
- **Pinakaginusto**: Mga AI-specific template, gabay sa pag-troubleshoot, mga best practice

**Sumali sa aming komunidad para sa:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at kumuha ng tulong
- Ma-access ang mga maagang preview ng mga bagong AI template
- Mag-ambag sa mga best practice sa AI deployment
- Makaimpluwensya sa hinaharap na pag-develop ng AI + AZD na mga tampok

### Pag-ambag sa Kurso
Malugod naming tinatanggap ang mga kontribusyon! Mangyaring basahin ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapabuti ng Nilalaman**: Pagbutihin ang mga umiiral na kabanata at mga halimbawa
- **Bagong Mga Halimbawa**: Magdagdag ng mga totoong sitwasyon at mga template  
- **Pagsasalin**: Tumulong na mapanatili ang suporta sa maraming wika
- **Ulat ng mga Bug**: Palakasin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inclusive na mga patakaran sa komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay may lisensyang MIT License - tingnan ang [LICENSE](../../LICENSE) na file para sa detalye.

### Kaugnay na Mga Sanggunian sa Pagkatuto mula sa Microsoft

Gumagawa ang aming koponan ng iba pang malawak na mga kurso sa pagkatuto:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para sa mga Nagsisimula](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para sa mga Nagsisimula](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain para sa mga Nagsisimula](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD para sa mga Nagsisimula](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para sa mga Nagsisimula](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para sa mga Nagsisimula](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents para sa mga Nagsisimula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI para sa mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML para sa mga Nagsisimula](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science para sa mga Nagsisimula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa mga Nagsisimula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity para sa mga Nagsisimula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa mga Nagsisimula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa mga Nagsisimula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development para sa mga Nagsisimula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot para sa AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Pag-navigate sa Kurso

**🚀 Handa ka na bang Magsimulang Matuto?**

**Mga Nagsisimula**: Magsimula sa [Kabanata 1: Pundasyon at Mabilisang Pagsisimula](#-chapter-1-foundation--quick-start)  
**Mga AI Developer**: Tumalon sa [Kabanata 2: AI-First na Pag-develop](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Mga May Karanasang Developer**: Simulan sa [Kabanata 3: Pag-configure at Authentication](#️-chapter-3-configuration--authentication)

**Susunod na Mga Hakbang**: [Simulan ang Kabanata 1 - Mga Batayang AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->