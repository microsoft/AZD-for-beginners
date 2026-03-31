# AZD Para sa mga Nagsisimula: Isang Istrukturadong Paglalakbay sa Pag-aaral

![AZD para sa mga Nagsisimula](../../translated_images/tl/azdbeginners.5527441dd9f74068.webp) 

[![Manonood sa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Mga bituin sa GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Awtomatikong Mga Salin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabe](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaryo](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Kroatiya](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [Pranses](../fr/README.md) | [Aleman](../de/README.md) | [Griyego](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italiano](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Espanyol](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Mas Gusto Mo Bang I-clone nang Lokal?**
>
> Ang repositoryong ito ay may 50+ na mga salin sa wika na malaki ang pinapataas sa laki ng pag-download. Upang i-clone nang walang mga salin, gamitin ang sparse checkout:
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
> Ito ay nagbibigay sa iyo ng lahat ng kailangan mo upang makumpleto ang kurso na may mas mabilis na pag-download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ano ang Bago sa azd Ngayon

Azure Developer CLI ay lumago lampas sa tradisyonal na web apps at APIs. Ngayon, azd ang iisang tool para i-deploy ang anumang application sa Azure—kabilang ang mga aplikasyon na pinapagana ng AI at mga intelligent agent.

Narito kung ano ang ibig sabihin nito para sa iyo:

- **Ang mga AI agent ay ngayon first-class na azd workloads.** Maaari kang mag-initialize, mag-deploy, at mag-manage ng mga proyekto ng AI agent gamit ang parehong `azd init` → `azd up` workflow na alam mo na.
- **Ang integrasyon ng Microsoft Foundry** ay nagdadala ng deployment ng modelo, pagho-host ng agent, at configuration ng AI service direkta sa azd template ecosystem.
- **Hindi nagbago ang pangunahing workflow.** Kung magde-deploy ka man ng todo app, microservice, o isang multi-agent AI solution, pareho ang mga command.

Kung nagamit mo na ang azd noon, ang suporta para sa AI ay isang natural na extension—hindi isang hiwalay na tool o isang advanced na track. Kung nagsisimula ka pa lang, matututo ka ng isang workflow na gumagana para sa lahat.

---

## 🚀 Ano ang Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ay isang developer-friendly na command-line tool na nagpapadali sa pag-deploy ng mga aplikasyon sa Azure. Sa halip na mano-manong lumikha at mag-connect ng dose-dosenang Azure na resource, maaari mong i-deploy ang buong aplikasyon gamit ang iisang command.

### Ang Mahika ng `azd up`

```bash
# Ang iisang utos na ito ang gumagawa ng lahat:
# ✅ Lumilikha ng lahat ng Azure resources
# ✅ Nagkokonpigura ng networking at seguridad
# ✅ Ibinubuo ang iyong application code
# ✅ Nag-de-deploy sa Azure
# ✅ Nagbibigay sa iyo ng isang gumaganang URL
azd up
```

**Iyon lang!** Walang pag-click sa Azure Portal, walang komplikadong ARM template na kailangang pag-aralan muna, walang manu-manong configuration - mga gumaganang aplikasyon na lang sa Azure.

---

## ❓ Azure Developer CLI kumpara sa Azure CLI: Ano ang Pagkakaiba?

Ito ang pinakakaraniwang tanong ng mga nagsisimula. Narito ang simpleng sagot:

| Tampok | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Layunin** | Pamamahala ng mga indibidwal na resource ng Azure | Pag-deploy ng kumpletong mga aplikasyon |
| **Isipan** | Nakatuon sa imprastruktura | Nakatuon sa aplikasyon |
| **Halimbawa** | `az webapp create --name myapp...` | `azd up` |
| **Antas ng Pagkatuto** | Kailangang alam ang mga serbisyo ng Azure | Kailangan lang kilalanin ang iyong app |
| **Pinakamahusay Para sa** | DevOps, Imprastruktura | Mga Developer, Pagbuo ng Prototype |

### Simpleng Analohiya

- **Azure CLI** ay parang pagkakaroon ng lahat ng mga kasangkapan para magtayo ng bahay - martilyo, lagari, mga pako. Maaari kang bumuo ng anumang gusto mo, pero kailangan mong marunong sa konstruksyon.
- **Azure Developer CLI** ay parang pagkuha ng kontratista - ilalarawan mo kung ano ang gusto mo, at sila ang bahala sa paggawa.

### Kailan Gamitin ang Bawat Isa

| Scenario | Gamitin Ito |
|----------|-------------|
| "Gusto kong mabilis na i-deploy ang aking web app" | `azd up` |
| "Kailangan kong gumawa ng isang storage account lang" | `az storage account create` |
| "Gumagawa ako ng buong AI application" | `azd init --template azure-search-openai-demo` |
| "Kailangan kong i-debug ang isang partikular na Azure resource" | `az resource show` |
| "Gusto ko ng production-ready deployment sa loob ng minuto" | `azd up --environment production` |

### Gumagana Sila Nang Magkasama!

Gumagamit ang AZD ng Azure CLI sa ilalim. Maaari mong gamitin ang pareho:
```bash
# I-deploy ang iyong app gamit ang AZD
azd up

# Pagkatapos, i-fine-tune ang mga partikular na resource gamit ang Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Maghanap ng Mga Template sa Awesome AZD

Huwag magsimula mula sa wala! **Awesome AZD** ay koleksyon ng komunidad ng mga handa-ng-i-deploy na template:

| Resource | Paglalarawan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Mag-browse ng 200+ template na may isang-klik na pag-deploy |
| 🔗 [**Mag-sumite ng Template**](https://github.com/Azure/awesome-azd/issues) | Mag-ambag ng sarili mong template sa komunidad |
| 🔗 [**Repositoryo ng GitHub**](https://github.com/Azure/awesome-azd) | I-star at tuklasin ang pinanggalingan |

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

## 🎯 Paano Magsimula sa 3 Hakbang

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

### Hakbang 2: Mag-login sa Azure

```bash
azd auth login
```

### Hakbang 3: I-deploy ang Iyong Unang App

```bash
# I-initialize mula sa isang template
azd init --template todo-nodejs-mongo

# I-deploy sa Azure (lumilikha ng lahat!)
azd up
```

**🎉 Iyon lang!** Ang iyong app ay live na ngayon sa Azure.

### Linisin (Huwag Kalimutan!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Paano Gamitin ang Kursong Ito

Ang kursong ito ay idinisenyo para sa **progressive learning** - magsimula kung saan ka kumportable at unti-unting umakyat:

| Ang Iyong Karanasan | Magsimula Dito |
|---------------------|----------------|
| **Bagong sa Azure** | [Kabanata 1: Pundasyon](#-chapter-1-foundation--quick-start) |
| **Alam ang Azure, bago sa AZD** | [Kabanata 1: Pundasyon](#-chapter-1-foundation--quick-start) |
| **Nais mag-deploy ng mga AI app** | [Kabanata 2: Pag-unlad na Nakatuon sa AI](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Nais ng praktikal na pagsasanay** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Kailangan ng mga pattern para sa produksyon** | [Kabanata 8: Produksyon & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Mabilis na Pagsasaayos

1. **I-fork ang Repositoryong Ito**: [![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone Ito**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kumuha ng Tulong**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Mas Gusto Mo Bang I-clone nang Lokal?**
>
> Ang repositoryong ito ay may 50+ na mga salin sa wika na malaki ang pinapataas sa laki ng pag-download. Upang i-clone nang walang mga salin, gamitin ang sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ito ay nagbibigay sa iyo ng lahat ng kailangan mo upang makumpleto ang kurso na may mas mabilis na pag-download.


## Pangkalahatang-ideya ng Kurso

Magsanay ng Azure Developer CLI (azd) sa pamamagitan ng mga istrukturadong kabanata na idinisenyo para sa progressive learning. **Espesyal na pokus sa pag-deploy ng AI application gamit ang integrasyon ng Microsoft Foundry.**

### Bakit Mahalaga ang Kursong Ito para sa Mga Modernong Developer

Batay sa mga insight mula sa Microsoft Foundry Discord community, **45% ng mga developer ay nais gamitin ang AZD para sa mga AI workload** ngunit nahaharap sa mga hamon sa:
- Kumplikadong multi-service AI architectures
- Pinakamahuhusay na kasanayan para sa production AI deployment  
- Integrasyon at configuration ng Azure AI services
- Pag-optimize ng gastos para sa mga AI workload
- Pag-troubleshoot ng mga ispesipikong isyu sa deployment ng AI

### Mga Layunin sa Pagkatuto

Sa pamamagitan ng pagtatapos ng istrukturadong kursong ito, ikaw ay:
- **Magmamaster sa Mga Batayan ng AZD**: Pangunahing konsepto, pag-install, at configuration
- **Magde-deploy ng Mga AI Application**: Gamitin ang AZD kasama ang mga serbisyo ng Microsoft Foundry
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang Azure resources gamit ang mga Bicep template
- **Mag-troubleshoot ng Mga Deployment**: Lutasin ang mga karaniwang isyu at mag-debug ng mga problema
- **Mag-optimize para sa Produksyon**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Bumuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 🗺️ Mapa ng Kurso: Mabilis na Navigasyon ayon sa Kabanata

Bawat kabanata ay may nakalaang README na may mga layunin sa pagkatuto, quick starts, at mga ehersisyo:

| Kabanata | Paksa | Mga Aralin | Tagal | Kompleksidad |
|---------|-------|---------|----------|------------|
| **[Kabanata 1: Pundasyon](docs/chapter-01-foundation/README.md)** | Pagsisimula | [Mga Batayang AZD](docs/chapter-01-foundation/azd-basics.md) &#124; [Pag-install](docs/chapter-01-foundation/installation.md) &#124; [Unang Proyekto](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 oras | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 minuto | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 oras | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 oras | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oras | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 oras | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 oras | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 oras | ⭐⭐ |

**Kabuuang Tagal ng Kurso:** ~10-14 oras | **Pag-usad ng Kasanayan:** Baguhan → Handa para sa Produksyon

---

## 📚 Mga Kabanata sa Pag-aaral

*Piliin ang iyong landas ng pag-aaral batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon & Mabilis na Pagsisimula
**Kinakailangan**: Azure subscription, batayang kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kumplikado**: ⭐

#### Ano ang Matututunan Mo
- Pag-unawa sa mga pundasyon ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Magsimula Dito**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorya**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Mga patnubay ayon sa platform
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Sunud-sunod na tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktikal na Ehersisyo
```bash
# Mabilis na pagsusuri ng pag-install
azd version

# I-deploy ang iyong unang aplikasyon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kinalabasan ng Kabanata**: Matagumpay na ma-deploy ang isang simpleng web application sa Azure gamit ang AZD

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang mga sumusunod:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-initialize ang proyekto
azd up                  # Ina-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Nagbubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras na Kinakailangan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kakayahang mag-deploy ng mga pangunahing aplikasyon nang mag-isa
**📈 Antas ng Kasanayan Pagkatapos:** Kakayahang mag-deploy ng mga pangunahing aplikasyon nang mag-isa

---

### 🤖 Kabanata 2: AI-First Development (Inirerekomenda para sa mga AI Developer)
**Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Integrasyon ng Microsoft Foundry sa AZD
- Pag-deploy ng mga application na pinatatakbo ng AI
- Pag-unawa sa mga konfigurasyon ng AI service

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Magsimula Dito**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Mag-deploy ng mga intelligent agent gamit ang AZD
- **📖 Mga Pattern**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Mag-deploy at pamahalaan ang mga modelo ng AI
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga AI solution
- **🎥 Interaktibong Gabay**: [Workshop Materials](workshop/README.md) - Pag-aaral sa browser gamit ang MkDocs * DevContainer Environment
- **📋 Mga Template**: [Microsoft Foundry Templates](#mga-pinagkukunan-ng-workshop)
- **📝 Mga Halimbawa**: [AZD Deployment Examples](examples/README.md)

#### Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang aplikasyon ng AI
azd init --template azure-search-openai-demo
azd up

# Subukan ang karagdagang mga template ng AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: I-deploy at i-configure ang isang AI-powered chat application na may RAG capabilities

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat mong magawa ang mga sumusunod:
azd init --template azure-search-openai-demo
azd up
# Subukan ang interface ng AI chat
# Magtanong at tumanggap ng mga tugon na pinapagana ng AI na may mga sanggunian
# Tiyakin na gumagana ang integrasyon ng paghahanap
azd monitor  # Suriin na nagpapakita ang Application Insights ng telemetry
azd down --force --purge
```

**📊 Oras na Kinakailangan:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-configure ng production-ready na mga AI application  
**💰 Pagkaalam sa Gastos:** Unawain ang $80-150/month dev costs, $300-3500/month production costs

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa Pag-deploy ng AI

**Kapaligiran ng Pag-develop (Tinatayang $80-150/buwan):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/buwan (batay sa paggamit ng token)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Kapaligiran ng Produksyon (Tinatayang $300-3,500+/buwan):**
- Microsoft Foundry Models (PTU para sa consistent na performance): $3,000+/buwan O Pay-as-go sa mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gamitin ang **Free Tier** Microsoft Foundry Models para sa pagkatuto (Azure OpenAI 50,000 tokens/buwan kasama)
- Patakbuhin ang `azd down` upang i-deallocate ang mga resource kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based billing, i-upgrade sa PTU lamang para sa produksyon
- Gamitin ang `azd provision --preview` upang tantiyahin ang mga gastos bago ang deployment
- Paganahin ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagsubaybay ng Gastos:**
```bash
# Suriin ang tinatayang buwanang gastos
azd provision --preview

# Subaybayan ang aktwal na gastos sa Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Konfigurasyon & Autentikasyon
**Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Pag-configure at pamamahala ng environment
- Mga best practice sa authentication at seguridad
- Pagpapangalan at organisasyon ng mga resource

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Konfigurasyon**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Pag-setup ng environment
- **🔐 Seguridad**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Mga pattern sa authentication
- **📝 Mga Halimbawa**: [Database App Example](examples/database-app/README.md) - Mga AZD Database Examples

#### Praktikal na Ehersisyo
- I-configure ang maraming environment (dev, staging, prod)
- I-setup ang managed identity authentication
- Ipatupad ang mga environment-specific na konfigurasyon

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maraming environment na may tamang authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code & Deployment
**Kinakailangan**: Natapos ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga advanced na deployment pattern
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resource

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Deployment**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Pamamahala ng Azure resource
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Containerized deployments

#### Praktikal na Ehersisyo
- Gumawa ng custom na Bicep templates
- Mag-deploy ng multi-service na mga application
- Ipatupad ang blue-green deployment strategies

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng kumplikadong multi-service na mga application gamit ang custom na infrastructure templates

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Kinakailangan**: Natapos ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga pattern ng multi-agent architecture
- Orkestrasyon at koordinasyon ng mga agent
- Production-ready na mga AI deployment

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Tampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mga pattern

#### Praktikal na Ehersisyo
```bash
# I-deploy ang kumpletong multi-agent na solusyon para sa retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tuklasin ang mga konfigurasyon ng ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at pamahalaan ang production-ready na multi-agent AI solution na may Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation & Planning
**Kinakailangan**: Natapos ang Kabanata 4  
**Tagal**: 1 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Capacity planning at pagsusuri ng resource
- Mga estratehiya sa pagpili ng SKU
- Pre-flight checks at automation

#### Mga Mapagkukunan sa Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Pagsusuri ng resource
- **💰 Pagpili**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- **✅ Pagpapatunay**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Mga automated na script

#### Praktikal na Ehersisyo
- Patakbuhin ang capacity validation scripts
- I-optimize ang mga pagpili ng SKU para sa gastos
- Ipatupad ang automated na pre-deployment checks

**💡 Kinalabasan ng Kabanata**: Patunayan at i-optimize ang mga deployment bago isagawa

---

### 🚨 Kabanata 7: Troubleshooting & Debugging
**Kinakailangan**: Anumang kabanata sa deployment ay natapos  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Sistematikong mga pamamaraan sa debugging
- Mga karaniwang isyu at solusyon
- AI-specific na troubleshooting

#### Mga Mapagkukunan sa Pag-aaral
- **🔧 Karaniwang Isyu**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Pag-debug**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Mga estratehiya nang sunud-sunod
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Mga problema sa AI service

#### Praktikal na Ehersisyo
- Suriin ang mga pagkabigo sa deployment
- Lutasin ang mga isyu sa authentication
- I-debug ang connectivity ng AI service

**💡 Kinalabasan ng Kabanata**: Magawang mag-diagnose at mag-resolba nang mag-isa ng mga karaniwang isyu sa deployment

---

### 🏢 Kabanata 8: Production & Enterprise Patterns
**Kinakailangan**: Natapos ang Mga Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga estratehiya sa production deployment
- Mga pattern sa seguridad para sa enterprise
- Monitoring at pag-optimize ng gastos

#### Mga Mapagkukunan sa Pag-aaral
- **🏭 Produksyon**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Pagsubaybay**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Mga Praktikal na Ehersisyo
- Ipatupad ang mga pattern ng seguridad para sa enterprise
- Mag-set up ng komprehensibong pagsubaybay
- I-deploy sa produksyon na may wastong pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga enterprise-ready na aplikasyon na may buong kakayahan para sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Hands-On Learning Experience

> **⚠️ STATUS NG WORKSHOP: Aktibong Pag-unlad**  
> Ang mga materyales ng workshop ay kasalukuyang ginagawa at pinapahusay. Gumagana na ang mga pangunahing module, ngunit ang ilang advanced na seksyon ay hindi pa kumpleto. Aktibo kaming nagtatrabaho upang mabuo ang lahat ng nilalaman. [Subaybayan ang progreso →](workshop/README.md)

### Interactive Workshop Materials
**Komprehensibong hands-on na pagkatuto gamit ang mga tool sa browser at ginagabayan na mga ehersisyo**

Ang aming mga materyales sa workshop ay nagbibigay ng isang istrukturadong, interaktibong karanasan sa pagkatuto na kumukumplemento sa kabanata-based na kurikulum sa itaas. Dinisenyo ang workshop para sa parehong self-paced na pagkatuto at instructor-led na mga sesyon.

#### 🛠️ Mga Tampok ng Workshop
- **Interface na Nasa Browser**: Kumpletong MkDocs-powered na workshop na may paghahanap, pagkopya, at mga tema
- **Integrasyon ng GitHub Codespaces**: Isang-click na pag-setup ng development environment
- **Istrakturang Landas ng Pagkatuto**: 8-modul na ginagabayan na mga ehersisyo (3-4 na oras kabuuan)
- **Sunud-sunod na Metodolohiya**: Panimula → Pagpili → Pagpapatunay → Dekonstruksiyon → Konfigurasyon → Pagpapasadya → Paglilinis → Pagtatapos
- **Interaktibong DevContainer Environment**: Mga naunang naka-configure na tool at dependency

#### 📚 Istruktura ng Mga Module ng Workshop
Sinusunod ng workshop ang isang **8-modul na sunud-sunod na metodolohiya** na magdadala sa iyo mula sa pagtuklas hanggang sa kadalubhasaan sa pag-deploy:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Pangkalahatang-ideya ng Workshop | Unawain ang mga layunin sa pag-aaral, mga kinakailangan, at estruktura ng workshop | 15 min |
| **1. Selection** | Pagdiskubre ng Template | Galugarin ang mga template ng AZD at piliin ang tamang AI template para sa iyong senaryo | 20 min |
| **2. Validation** | I-deploy at Beripikahin | I-deploy ang template gamit ang `azd up` at beripikahin na gumagana ang imprastruktura | 30 min |
| **3. Deconstruction** | Unawain ang Estruktura | Gamitin ang GitHub Copilot upang galugarin ang arkitektura ng template, mga Bicep file, at organisasyon ng code | 30 min |
| **4. Configuration** | Malalim na Pagsusuri sa azure.yaml | Maging bihasa sa `azure.yaml` configuration, lifecycle hooks, at environment variables | 30 min |
| **5. Customization** | Gawing Iyo | I-enable ang AI Search, tracing, evaluation, at i-customize para sa iyong senaryo | 45 min |
| **6. Teardown** | Linisin | Ligtas na i-deprovision ang mga resources gamit ang `azd down --purge` | 15 min |
| **7. Wrap-up** | Mga Susunod na Hakbang | Suriin ang mga nagawa, mga pangunahing konsepto, at ipagpatuloy ang iyong paglalakbay sa pagkatuto | 15 min |

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
# I-click ang "Code" → "Create codespace on main" sa repositoryo

# Opsyon 2: Lokal na Pag-develop
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga tagubilin sa pagsasaayos sa workshop/README.md
```

#### 🎯 Mga Layunin sa Pagkatuto ng Workshop
Sa pamamagitan ng pagkompleto ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Mga Production AI Application**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Maging Dalubhasa sa Multi-Agent na Arkitektura**: Ipatupad ang magkakatugmang mga solusyon ng AI agent
- **Ipatupad ang Mga Pinakamahusay na Gawi sa Seguridad**: I-configure ang pagpapatunay at kontrol sa access
- **I-optimize para sa Pag-scale**: Magdisenyo ng cost-effective at mataas-performans na mga deployment
- **Mag-troubleshoot ng mga Deployment**: Lutasin ang mga karaniwang isyu nang mag-isa

#### 📖 Mga Pinagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Mga Materyales ng Workshop](workshop/README.md) - Kapaligirang pagkatuto na nasa browser
- **📋 Mga Instruksyon Module-by-Module**:
  - [0. Panimula](workshop/docs/instructions/0-Introduction.md) - Pangkalahatang-ideya ng workshop at mga layunin
  - [1. Pagpili](workshop/docs/instructions/1-Select-AI-Template.md) - Hanapin at piliin ang mga AI template
  - [2. Pagpapatunay](workshop/docs/instructions/2-Validate-AI-Template.md) - I-deploy at beripikahin ang mga template
  - [3. Dekonstruksiyon](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Galugarin ang arkitektura ng template
  - [4. Konfigurasyon](workshop/docs/instructions/4-Configure-AI-Template.md) - Maging bihasa sa azure.yaml
  - [5. Pagpapasadya](workshop/docs/instructions/5-Customize-AI-Template.md) - I-customize para sa iyong senaryo
  - [6. Paglilinis](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Linisin ang mga resources
  - [7. Pagtatapos](workshop/docs/instructions/7-Wrap-up.md) - Suriin at mga susunod na hakbang
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mga ehersisyong nakatuon sa AI
- **💡 Quick Start**: [Gabay sa Pag-setup ng Workshop](workshop/README.md#quick-start) - Konfigurasyon ng kapaligiran

**Perpekto para sa**: Pagsasanay ng korporasyon, mga kurso sa unibersidad, self-paced na pagkatuto, at mga bootcamp para sa mga developer.

---

## 📖 Malalim na Pagsusuri: Mga Kakayahan ng AZD

Higit pa sa mga batayan, nagbibigay ang AZD ng makapangyarihang mga tampok para sa mga production deployment:

- **Template-based deployments** - Gamitin ang mga pre-built na template para sa mga karaniwang pattern ng aplikasyon
- **Infrastructure as Code** - Pamahalaan ang mga Azure resource gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na mag-provision, mag-deploy, at magsubaybay ng mga aplikasyon
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa mga AI Deployment**

**Bakit AZD para sa mga Solusyong AI?** Tinatalakay ng AZD ang nangungunang mga hamon na kinakaharap ng mga AI developer:

- **Mga Template na Handa para sa AI** - Mga pre-configured na template para sa Microsoft Foundry Models, Cognitive Services, at ML workloads
- **Secure na mga AI Deployment** - Built-in na mga pattern ng seguridad para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Mga pinakamahusay na gawi para sa scalable, cost-effective na mga deployment ng AI application
- **End-to-End AI Workflows** - Mula sa pag-develop ng modelo hanggang sa production deployment na may tamang pagsubaybay
- **Pag-optimize ng Gastos** - Matalinong alokasyon ng resource at mga estratehiya sa pag-scale para sa AI workloads
- **Integrasyon ng Microsoft Foundry** - Seamless na koneksyon sa Microsoft Foundry model catalog at mga endpoint

---

## 🎯 Library ng Mga Template at Halimbawa

### Tampok: Microsoft Foundry Templates
**Magsimula dito kung nag-de-deploy ka ng mga AI application!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang AI pattern. Ang ilan ay external Azure Samples, ang iba naman ay lokal na implementasyon.

| Template | Kabanata | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Magsimula sa AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |
| [**Magsimula sa AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Panlabas |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Senaryong Pang-Pagkatuto
**Mga template ng application na handa para sa produksyon na naka-mapa sa mga kabanata ng pagkatuto**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Pagkatuto sa Pamamagitan ng Uri ng Halimbawa

> **📌 Lokal vs. Panlabas na Mga Halimbawa:**  
> **Lokal na Mga Halimbawa** (sa repo na ito) = Handa nang gamitin kaagad  
> **Panlabas na Mga Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repository

#### Lokal na Mga Halimbawa (Handa nang Gamitin)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong production-ready na implementasyon na may ARM templates
  - Multi-agent na arkitektura (Customer + Inventory agents)
  - Komprehensibong pagsubaybay at evaluasyon
  - One-click na pag-deploy via ARM template

#### Lokal na Mga Halimbawa - Container Applications (Kabanata 2-5)
**Komprehensibong mga halimbawa ng pag-deploy ng container sa repository na ito:**
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Simpleng REST API na may scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Quick Start, Production, at Advanced na mga pattern ng deployment
  - Patnubay sa pagsubaybay, seguridad, at pag-optimize ng gastos

#### Panlabas na Mga Halimbawa - Simpleng Aplikasyon (Kabanata 1-2)
**I-clone ang mga Azure Samples na repository na ito upang makapagsimula:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga pangunahing pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pag-deploy ng static na nilalaman
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pag-deploy ng REST API

#### Panlabas na Mga Halimbawa - Integrasyon ng Database (Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng konektividad sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na workflow ng data

#### Panlabas na Mga Halimbawa - Advanced na Mga Pattern (Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service na arkitektura
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mga production-ready na pattern para sa ML

### Koleksyon ng Panlabas na Template
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng opisyal at community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng Microsoft Learn para sa mga template
- [**Examples Directory**](examples/README.md) - Lokal na mga halimbawa ng pagkatuto na may detalyadong paliwanag

---

## 📚 Mga Pinagkukunan sa Pagkatuto at mga Sanggunian

### Mabilis na Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang azd na command na inayos ayon sa kabanata
- [**Glosaryo**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pagkatuto
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga praktikal na ehersisyo

### Mga Hands-On na Workshop
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga solusyong AI (2-3 na oras)
- [**Interactive Workshop**](workshop/README.md) - 8-modul na ginagabayan na mga ehersisyo na may MkDocs at GitHub Codespaces
  - Sinusunod ang: Panimula → Pagpili → Pagpapatunay → Dekonstruksiyon → Konfigurasyon → Pagpapasadya → Paglilinis → Pagtatapos

### Panlabas na Mga Pinagkukunan sa Pagkatuto
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sentro ng Arkitektura ng Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Kalkulador ng Presyo ng Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status ng Azure](https://status.azure.com/)

### Mga Kasanayan ng AI Agent para sa Iyong Editor
- [**Microsoft Azure Skills sa skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 bukas na kasanayan ng agent para sa Azure AI, Foundry, deployment, diagnostics, pag-optimize ng gastos, at iba pa. I-install ang mga ito sa GitHub Copilot, Cursor, Claude Code, o anumang suportadong agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Karaniwang mga isyung nararanasan ng mga nagsisimula at agarang mga solusyon:**

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

# Itakda para sa AZD na kapaligiran
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

# O gumamit ng mas maliit na SKU sa pag-develop
# I-edit ang infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Opsyon 1: Linisin at muling subukan
azd down --force --purge
azd up

# Opsyon 2: Ayusin lang ang imprastruktura
azd provision

# Opsyon 3: Suriin ang detalyadong katayuan
azd show

# Opsyon 4: Tingnan ang mga log sa Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

```bash
# Muling patunayan ang pagkakakilanlan
az logout
az login

azd auth logout
azd auth login

# Suriin ang pagpapatunay ng pagkakakilanlan
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# Ang AZD ay bumubuo ng mga natatanging pangalan, ngunit kung may konflikto:
azd down --force --purge

# Muling subukan gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning is slow)

```bash
# Suriin ang progreso
azd show

# Kung natigil ng higit sa 30 minuto, tingnan ang Azure Portal:
azd monitor
# Hanapin ang mga nabigong deployment
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Suriin ang iyong Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa "Contributor" role
# Hilingin sa iyong Azure admin na magbigay:
# - Contributor (para sa mga resource)
# - User Access Administrator (para sa pagtatalaga ng mga role)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Ipakita ang lahat ng endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga variable na *_URL
```
</details>

### 📚 Kumpletong Mga Mapagkukunan sa Pag-troubleshoot

- **Gabay sa Karaniwang Mga Isyu:** [Detalyadong Mga Solusyon](docs/chapter-07-troubleshooting/common-issues.md)
- **Mga Isyu na Tiyak sa AI:** [Pag-troubleshoot ng AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Gabay sa Pag-debug:** [Hakbang-hakbang na Pag-debug](docs/chapter-07-troubleshooting/debugging.md)
- **Kumuha ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagtatapos ng Kurso at Sertipikasyon

### Pagsubaybay ng Progreso
Subaybayan ang iyong progreso sa pag-aaral sa bawat kabanata:

- [ ] **Kabanata 1**: Pundasyon at Mabilis na Pagsisimula ✅
- [ ] **Kabanata 2**: Pag-unlad na Nakatuon sa AI ✅  
- [ ] **Kabanata 3**: Pag-configure at Pagpapatunay ✅
- [ ] **Kabanata 4**: Imprastruktura bilang Code at Pag-deploy ✅
- [ ] **Kabanata 5**: Mga Solusyon sa AI na Maramihang-Agent ✅
- [ ] **Kabanata 6**: Pagpapatunay at Pagpaplano bago ang Pag-deploy ✅
- [ ] **Kabanata 7**: Pag-troubleshoot at Pag-debug ✅
- [ ] **Kabanata 8**: Mga Pattern sa Produksyon at Enterprise ✅

### Pagpapatunay ng Pagkatuto
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Ehersisyo**: Kumpletuhin ang hands-on na pag-deploy ng kabanata
2. **Pagsusuri ng Kaalaman**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Talakayan sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng pagiging kumplikado

### Mga Benepisyo ng Pagtatapos ng Kurso
Sa pagtapos ng lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Produksyon**: Mga totoong AI application na na-deploy sa Azure
- **Propesyonal na Kasanayan**: Kakayahan sa pag-deploy na handa para sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng komunidad ng Azure developer
- **Pagsulong sa Karera**: Mataas ang demand sa kasanayan sa AZD at sa pag-deploy ng AI

---

## 🤝 Komunidad at Suporta

### Kumuha ng Tulong at Suporta
- **Teknikal na Mga Isyu:** [I-report ang bugs at humiling ng mga feature](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pagkatuto:** [Komunidad ng Microsoft Azure Discord](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong na Tiyak sa AI:** Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon:** [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Insight ng Komunidad mula sa Microsoft Foundry Discord

**Kamakailang Mga Resulta ng Poll mula sa #Azure Channel:**
- **45%** ng mga developer ang nais gamitin ang AZD para sa mga workload ng AI
- **Nangungunang hamon**: Pag-deploy ng maramihang serbisyo, pamamahala ng kredensyal, kahandaan para sa produksyon  
- **Pinakamadalas na hinihingi**: Mga template na tiyak sa AI, gabay sa pag-troubleshoot, mga pinakamahusay na kasanayan

**Sumali sa aming komunidad para sa:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Ma-access ang maagang preview ng mga bagong template ng AI
- Mag-ambag sa pinakamahusay na kasanayan sa pag-deploy ng AI
- Maka-impluwensya sa pagbuo ng mga susunod na feature para sa AI + AZD

### Pag-ambag sa Kurso
Tinatanggap namin ang mga ambag! Mangyaring basahin ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapabuti ng Nilalaman**: Pahusayin ang umiiral na mga kabanata at mga halimbawa
- **Mga Bagong Halimbawa**: Magdagdag ng mga totoong senaryo at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng suporta sa maraming wika
- **Mga Ulat ng Bug**: Pagbutihin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong mga alituntunin sa komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensiyado sa ilalim ng MIT License - tingnan ang file na [LICENSE](../../LICENSE) para sa mga detalye.

### Kaugnay na Mga Mapagkukunan sa Pagkatuto ng Microsoft

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pagkatuto:

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
 
### Serye ng Generative AI
[![Generative AI para sa mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pangunahing Pagkatuto
[![ML para sa mga Nagsisimula](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science para sa mga Nagsisimula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa mga Nagsisimula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity para sa mga Nagsisimula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa mga Nagsisimula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa mga Nagsisimula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development para sa mga Nagsisimula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serye ng Copilot
[![Copilot para sa Pinagsanib na Pagpoprograma ng AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pakikipagsapalaran ng Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Pag-navigate ng Kurso

**🚀 Handa nang Magsimulang Matuto?**

**Mga Baguhan**: Magsimula sa [Kabanata 1: Pundasyon at Mabilis na Panimula](#-chapter-1-foundation--quick-start)  
**Mga Developer ng AI**: Pumunta sa [Kabanata 2: Pag-develop na Unahin ang AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Mga Naranasang Developer**: Magsimula sa [Kabanata 3: Konfigurasyon at Pagpapatunay](#️-chapter-3-configuration--authentication)

**Susunod na Hakbang**: [Simulan ang Kabanata 1 - Mga Batayang AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pinagmumulan ng awtoridad. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasaling-tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->