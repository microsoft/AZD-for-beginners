# AZD Para sa mga Nagsisimula: Isang Estrukturadong Paglalakbay sa Pagkatuto

![AZD para sa mga Nagsisimula](../../translated_images/tl/azdbeginners.5527441dd9f74068.webp) 

[![Mga tagamasid sa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Mga bituin sa GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Awtomatikong Mga Salin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Mas Gusto Mong I-clone Lokal?**
>
> Kasama sa repository na ito ang 50+ na salin ng wika na malaki ang dagdag sa laki ng download. Para mag-clone nang walang mga salin, gamitin ang sparse checkout:
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
> Bibigyan ka nito ng lahat ng kailangan mo para tapusin ang kurso nang mas mabilis ang pag-download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Ano ang Bago sa azd Ngayon

Ang Azure Developer CLI ay lumago lampas sa tradisyonal na web apps at APIs. Ngayon, ang azd ang iisang tool para i-deploy ang anumang aplikasyon sa Azure—kabilang na ang mga aplikasyong may AI at mga intelligent agent.

Narito kung ano ang ibig sabihin nito para sa iyo:

- **Ang mga AI agent ay ngayon unang-klaseng workloads ng azd.** Maaari kang mag-initialize, mag-deploy, at mag-manage ng mga AI agent na proyekto gamit ang parehong `azd init` → `azd up` workflow na kilala mo na.
- **Ang integrasyon ng Microsoft Foundry** ay nagdadala ng pag-deploy ng modelo, pagho-host ng agent, at konfigurasyon ng serbisyo ng AI direkta sa azd template ecosystem.
- **Hindi nagbago ang pangunahing workflow.** Kahit nagde-deploy ka ng todo app, microservice, o multi-agent AI solution, pareho pa rin ang mga command.

Kung ginamit mo na ang azd dati, ang suporta para sa AI ay isang natural na extension—hindi hiwalay na tool o isang advanced na landas. Kung nagsisimula ka lang, matututo ka ng isang workflow na gumagana para sa lahat.

---

## 🚀 Ano ang Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ay isang developer-friendly na command-line tool na nagpapadali para mag-deploy ng mga aplikasyon sa Azure. Sa halip na mano-manong gumawa at mag-konekta ng maraming Azure resources, maaari mong i-deploy ang buong mga aplikasyon gamit ang isang command lang.

### Ang Magic ng `azd up`

```bash
# Isang utos na ito lang ang gumagawa ng lahat:
# ✅ Gumagawa ng lahat ng Azure resources
# ✅ Nagkokonpigura ng networking at seguridad
# ✅ Bumubuo ng iyong application code
# ✅ Nagde-deploy sa Azure
# ✅ Nagbibigay sa iyo ng gumaganang URL
azd up
```

**Tapos na!** Walang pag-click sa Azure Portal, walang komplikadong ARM templates na kailangang matutunan muna, walang manu-manong konfigurasyon - direktang gumagana ang mga aplikasyon sa Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Ano ang Pagkakaiba?

Ito ang pinakakaraniwang tanong ng mga nagsisimula. Narito ang simpleng sagot:

| Tampok | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Layunin** | Pamahalaan ang indibidwal na Azure resources | I-deploy ang kumpletong aplikasyon |
| **Pag-iisip** | Nakatuon sa imprastruktura | Nakatuon sa aplikasyon |
| **Halimbawa** | `az webapp create --name myapp...` | `azd up` |
| **Kurba ng Pagkatuto** | Kailangang malaman ang mga serbisyo ng Azure | Kailangan lang malaman ang iyong app |
| **Pinakamabuti Para sa** | DevOps, Imprastruktura | Mga Developer, Prototyping |

### Simpleng Analohiya

- **Azure CLI** ay parang pagkakaroon ng lahat ng mga kasangkapan para magtayo ng bahay - martilyo, lagari, pako. Maaari kang magtayo ng anumang gusto mo, pero kailangan mong marunong sa konstruksyon.
- **Azure Developer CLI** ay parang pagkuha ng contractor - ilarawan mo ang gusto mo, at sila ang bahala sa pagbuo.

### Kailan Gagamitin ang Bawat Isa

| Senaryo | Gamitin Ito |
|----------|----------|
| "Gusto kong i-deploy ang web app ko nang mabilis" | `azd up` |
| "Kailangang gumawa lang ng storage account" | `az storage account create` |
| "Gumagawa ako ng kumpletong AI application" | `azd init --template azure-search-openai-demo` |
| "Kailangang i-debug ang isang partikular na Azure resource" | `az resource show` |
| "Gusto ko ng production-ready deployment sa loob ng minuto" | `azd up --environment production` |

### Sila ay Nagtutulungan!

AZD ay gumagamit ng Azure CLI sa ilalim. Maaari mong gamitin pareho:
```bash
# I-deploy ang iyong app gamit ang AZD
azd up

# Pagkatapos ay i-fine-tune ang mga partikular na resources gamit ang Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Hanapin ang Mga Template sa Awesome AZD

Huwag magsimula mula sa wala! Ang **Awesome AZD** ay koleksyon ng komunidad ng mga template na handa nang i-deploy:

| Resource | Paglalarawan |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Mag-browse ng 200+ templates na may one-click deploy |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Mag-ambag ng sarili mong template sa komunidad |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | I-star at tuklasin ang source |

### Mga Sikat na AI Template mula sa Awesome AZD

```bash
# RAG Chat gamit ang Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Mabilis na AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents kasama ang Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Pagsisimula sa 3 Hakbang

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
# Mag-umpisa mula sa isang template
azd init --template todo-nodejs-mongo

# I-deploy sa Azure (gumagawa ng lahat!)
azd up
```

**🎉 Tapos na!** Live na ang iyong app sa Azure.

### Linisin (Huwag Kalimutan!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Paano Gamitin ang Kursong Ito

Ang kursong ito ay dinisenyo para sa **progressive learning** - magsimula kung saan ka komportable at umakyat mula doon:

| Ang Iyong Karanasan | Magsimula Dito |
|-----------------|------------|
| **Baguhan sa Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Alam ang Azure, bago sa AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Gusto mag-deploy ng AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Gusto ng hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Kailangan ng production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Mabilis na Setup

1. **Fork This Repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone Ito**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Kumuha ng Tulong**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Mas Gusto Mong I-clone Lokal?**

> Kasama sa repository na ito ang 50+ na salin ng wika na malaki ang dagdag sa laki ng download. Para mag-clone nang walang mga salin, gamitin ang sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Bibigyan ka nito ng lahat ng kailangan mo para tapusin ang kurso nang mas mabilis ang pag-download.


## Buod ng Kurso

Masterin ang Azure Developer CLI (azd) sa pamamagitan ng mga estrukturadong kabanata na dinisenyo para sa progressive learning. **Espesyal na pokus sa pag-deploy ng AI application gamit ang integrasyon ng Microsoft Foundry.**

### Bakit Mahalagang Kurso para sa Modernong Mga Developer

Batay sa mga pananaw mula sa Microsoft Foundry Discord community, **45% ng mga developer ang nais gumamit ng AZD para sa AI workloads** pero nahaharap sa mga hamon tulad ng:
- Kumplikadong multi-service AI architectures
- Mga best practice para sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI services
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga ispesipikong isyu sa AI deployment

### Mga Layunin sa Pagkatuto

Sa pagtatapos ng kursong ito, magagawa mong:
- **Masanin ang Mga Pangunahing Kaalaman sa AZD**: Mga core na konsepto, instalasyon, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang karaniwang mga isyu at mag-debug ng mga problema
- **Mag-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Bumuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 🗺️ Mapa ng Kurso: Mabilis na Pag-navigate ayon sa Kabanata

Bawat kabanata ay may dedikadong README na may mga layunin sa pagkatuto, quick starts, at mga ehersisyo:

| Kabanata | Paksa | Mga Aralin | Tagal | Kumplikado |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Pagsisimula | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kblg. 2: Pag-unlad ng AI](docs/chapter-02-ai-development/README.md)** | Mga App na AI-Una | [Integrasyon ng Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [Mga Ahente ng AI](docs/chapter-02-ai-development/agents.md) &#124; [Pag-deploy ng Modelo](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Gawaan](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 oras | ⭐⭐ |
| **[Kblg. 3: Konfigurasyon](docs/chapter-03-configuration/README.md)** | Awtentikasyon at Seguridad | [Gabay sa Konfigurasyon](docs/chapter-03-configuration/configuration.md) &#124; [Awtentikasyon & Seguridad](docs/chapter-03-configuration/authsecurity.md) | 45-60 minuto | ⭐⭐ |
| **[Kblg. 4: Imprastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & Pag-deploy | [Gabay sa Pag-deploy](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Pagpo-provision](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 oras | ⭐⭐⭐ |
| **[Kblg. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | Mga Solusyon ng AI Agent | [Retail Scenario](examples/retail-scenario.md) &#124; [Mga Pattern ng Koordinasyon](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 oras | ⭐⭐⭐⭐ |
| **[Kblg. 6: Bago ang Pag-deploy](docs/chapter-06-pre-deployment/README.md)** | Pagpaplano & Pagpapatunay | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 oras | ⭐⭐ |
| **[Kblg. 7: Pag-troubleshoot](docs/chapter-07-troubleshooting/README.md)** | Pag-debug & Pag-ayos | [Karaniwang Isyu](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Pag-debug](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 oras | ⭐⭐ |
| **[Kblg. 8: Produksyon](docs/chapter-08-production/README.md)** | Mga Pattern sa Enterprise | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 oras | ⭐⭐⭐⭐ |
| **[🎓 Gawaan](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 oras | ⭐⭐ |

**Kabuuang Tagal ng Kurso:** ~10-14 oras | **Pag-unlad ng Kasanayan:** Nagsisimula → Handa para sa Produksyon

---

## 📚 Mga Kabanata sa Pag-aaral

*Piliin ang iyong landas ng pag-aaral ayon sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon & Mabilis na Pagsisimula
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kumplikado**: ⭐

#### Ano ang Matututuhan Mo
- Pag-unawa sa mga pundasyon ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan ng Pag-aaral
- **🎯 Magsimula Dito**: [Ano ang Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teorya**: [Batayan ng AZD](docs/chapter-01-foundation/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Pag-setup**: [Pag-install at Pag-setup](docs/chapter-01-foundation/installation.md) - Mga gabay ayon sa platform
- **🛠️ Praktikal**: [Ang Iyong Unang Proyekto](docs/chapter-01-foundation/first-project.md) - Hakbang-hakbang na tutorial
- **📋 Mabilis na Sanggunian**: [Cheat Sheet ng Mga Utos](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilis na pagsusuri sa pag-install
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
azd up                  # I-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga mapagkukunan
```

**📊 Oras na Kailangan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang i-deploy nang mag-isa ang mga pangunahing aplikasyon  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang i-deploy nang mag-isa ang mga pangunahing aplikasyon

---

### 🤖 Kabanata 2: Pag-develop na AI-Una (Inirerekomenda para sa Mga AI Developer)
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Pagsasama ng Microsoft Foundry sa AZD
- Pag-deploy ng mga aplikasyon na pinatatakbo ng AI
- Pag-unawa sa mga konfigurasyon ng serbisyo ng AI

#### Mga Mapagkukunan ng Pag-aaral
- **🎯 Magsimula Dito**: [Integrasyon ng Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 Mga Ahente ng AI**: [Gabay sa Mga Ahente ng AI](docs/chapter-02-ai-development/agents.md) - Mag-deploy ng mga intelihenteng ahente gamit ang AZD
- **📖 Mga Pattern**: [Pag-deploy ng Modelo ng AI](docs/chapter-02-ai-development/ai-model-deployment.md) - Mag-deploy at mag-manage ng mga modelo ng AI
- **🛠️ Gawaan**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing handa para sa AZD ang iyong mga solusyon sa AI
- **🎥 Interaktibong Gabay**: [Mga Materyales ng Workshop](workshop/README.md) - Pag-aaral sa browser gamit ang MkDocs * DevContainer Environment
- **📋 Mga Template**: [Mga Template ng Microsoft Foundry](#mga-mapagkukunan-ng-workshop)
- **📝 Mga Halimbawa**: [Mga Halimbawa ng AZD Deployment](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang aplikasyon ng AI
azd init --template azure-search-openai-demo
azd up

# Subukan ang mga karagdagang template ng AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: I-deploy at i-configure ang isang AI-powered na chat application na may kakayahang RAG

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, magagawa mo ang mga sumusunod:
azd init --template azure-search-openai-demo
azd up
# Subukan ang interface ng AI chat
# Magtanong at makatanggap ng mga tugon na pinapagana ng AI na may mga sanggunian
# Tiyakin na gumagana ang integrasyon ng paghahanap
azd monitor  # Suriin na ipinapakita ng Application Insights ang telemetry
azd down --force --purge
```

**📊 Oras na Kailangan:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang i-deploy at i-configure ang mga production-ready na AI application  
**💰 Kamalayan sa Gastos:** Unawain ang $80-150/buwan gastos sa dev, $300-3500/buwan gastos sa produksyon

#### 💰 Mga Dapat Isaalang-alang sa Gastos para sa Mga Pag-deploy ng AI

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
- Gamitin ang **Free Tier** ng Microsoft Foundry Models para sa pag-aaral (Azure OpenAI 50,000 tokens/buwan kasama)
- Patakbuhin ang `azd down` para i-deallocate ang mga resource kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based na pagsingil, mag-upgrade sa PTU lamang para sa produksyon
- Gamitin ang `azd provision --preview` para tantiyahin ang mga gastos bago mag-deploy
- I-enable ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagsubaybay ng Gastos:**
```bash
# Suriin ang tinatayang buwanang gastos
azd provision --preview

# Subaybayan ang aktwal na gastos sa Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Konfigurasyon & Pagpapatotoo
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Konfigurasyon at pamamahala ng kapaligiran
- Pinakamahuhusay na kasanayan para sa pagpapatotoo at seguridad
- Pagpapangalan at pag-oorganisa ng mga resource

#### Mga Mapagkukunan ng Pag-aaral
- **📖 Konfigurasyon**: [Gabay sa Konfigurasyon](docs/chapter-03-configuration/configuration.md) - Pagsasaayos ng kapaligiran
- **🔐 Seguridad**: [Mga pattern ng pagpapatotoo at managed identity](docs/chapter-03-configuration/authsecurity.md) - Mga pattern ng pagpapatotoo
- **📝 Mga Halimbawa**: [Halimbawa ng Database App](examples/database-app/README.md) - Mga Halimbawa ng AZD Database

#### Mga Praktikal na Ehersisyo
- I-configure ang maramihang mga kapaligiran (dev, staging, prod)
- I-setup ang managed identity para sa pagpapatotoo
- Ipapatupad ang mga konfigurasyon na partikular sa kapaligiran

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maramihang mga kapaligiran na may tamang pagpapatotoo at seguridad

---

### 🏗️ Kabanata 4: Imprastruktura bilang Code at Pag-deploy
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga advanced na pattern ng pag-deploy
- Imprastruktura bilang Code gamit ang Bicep
- Mga estratehiya sa pag-provision ng resource

#### Mga Mapagkukunan ng Pag-aaral
- **📖 Pag-deploy**: [Gabay sa Pag-deploy](docs/chapter-04-infrastructure/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Pagpo-provision ng Mga Resource](docs/chapter-04-infrastructure/provisioning.md) - Pamamahala ng Azure resources
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga pag-deploy na naka-container

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na mga Bicep template
- I-deploy ang multi-service na mga aplikasyon
- Ipatupad ang blue-green deployment na mga estratehiya

**💡 Kinalabasan ng Kabanata**: I-deploy ang kumplikadong multi-service na mga aplikasyon gamit ang custom na mga template ng imprastruktura

---

### 🎯 Kabanata 5: Mga Solusyong Multi-Agent na AI (Mas Advanced)
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga pattern ng arkitekturang multi-agent
- Orkestrasyon at koordinasyon ng mga ahente
- Mga pag-deploy na handa para sa produksyon ng AI

#### Mga Mapagkukunan ng Pag-aaral
- **🤖 Tampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ Mga ARM Template**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektura**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mga pattern

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang kumpletong solusyon na may maramihang ahente para sa retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Galugarin ang mga konfigurasyon ng ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: I-deploy at pamahalaan ang isang production-ready na multi-agent AI solution na may Customer at Inventory agents

---

### 🔍 Kabanata 6: Pagpapatunay at Pagpaplano Bago ang Pag-deploy
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Tagal**: 1 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Capacity planning at pagpapatunay ng resource
- Mga estratehiya sa pagpili ng SKU
- Pre-flight checks at automation

#### Mga Mapagkukunan ng Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Pagpapatunay ng resource
- **💰 Pagpili**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- **✅ Pagpapatunay**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Mga automated script

#### Mga Praktikal na Ehersisyo
- Patakbuhin ang mga script para sa pagpapatunay ng kapasidad
- I-optimize ang mga pagpili ng SKU para sa gastos
- Ipatupad ang automated pre-deployment checks

**💡 Kinalabasan ng Kabanata**: Patunayan at i-optimize ang mga pag-deploy bago isagawa

---

### 🚨 Kabanata 7: Pag-troubleshoot at Pag-debug
**Mga Kinakailangan**: Anumang kabanata ng pag-deploy na nakumpleto  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Sistematikong mga pamamaraan sa pag-debug
- Mga karaniwang isyu at mga solusyon
- AI-specific na pag-troubleshoot

#### Mga Mapagkukunan ng Pag-aaral
- **🔧 Karaniwang Isyu**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Pag-debug**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Mga istratehiyang hakbang-hakbang
- **🤖 Mga Isyu ng AI**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Mga problema sa serbisyo ng AI

#### Mga Praktikal na Ehersisyo
- I-diagnose ang mga pagkabigo sa pag-deploy
- Lutasin ang mga isyu sa pagpapatotoo
- I-debug ang konektividad ng serbisyo ng AI

**💡 Kinalabasan ng Kabanata**: Mag-diagnose at mag-resolba nang mag-isa ng mga karaniwang isyu sa pag-deploy

---

### 🏢 Kabanata 8: Produksyon at Mga Pattern ng Enterprise
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga estratehiya sa pag-deploy para sa produksyon
- Mga pattern ng seguridad sa enterprise
- Pagmo-monitor at pag-optimize ng gastos

#### Mga Mapagkukunan ng Pag-aaral
- **🏭 Produksyon**: [Pinakamahusay na Kasanayan sa Production AI](docs/chapter-08-production/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Kumplikadong mga arkitektura
- **📊 Pagmamanman**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Pagmamanman

#### Mga Praktikal na Ehersisyo
- Ipatupad ang mga pattern ng seguridad ng enterprise
- Mag-set up ng komprehensibong pagmamanman
- Mag-deploy sa produksyon na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga application na handa para sa enterprise na may kumpletong kakayahan sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Karanasang Pag-aaral na Praktikal

> **⚠️ KATAYUAN NG WORKSHOP: Aktibong Pag-unlad**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapaganda. Gumagana na ang mga pangunahing module, ngunit ang ilang advanced na seksyon ay hindi pa kumpleto. Aktibo kaming nagtatrabaho upang makumpleto ang lahat ng nilalaman. [Subaybayan ang pag-usad →](workshop/README.md)

### Mga Interaktibong Materyales ng Workshop
**Komprehensibong praktikal na pag-aaral gamit ang mga tool na batay sa browser at mga naka-gabay na ehersisyo**

Ang aming mga materyales sa workshop ay nagbibigay ng isang istrukturadong, interaktibong karanasan sa pag-aaral na kumukumplemento sa curriculum na nakaayos sa mga kabanata sa itaas. Dinisenyo ang workshop para sa parehong self-paced na pag-aaral at mga sesyong pinangungunahan ng instruktor.

#### 🛠️ Mga Tampok ng Workshop
- **Interface na Batay sa Browser**: Kumpletong workshop na pinapatakbo ng MkDocs na may paghahanap, pagkopya, at mga tampok ng tema
- **Integrasyon ng GitHub Codespaces**: Isang-click na pag-setup ng development environment
- **Istrukturadong Landas ng Pagkatuto**: 8-module na naka-gabay na mga ehersisyo (3-4 na oras kabuuan)
- **Progressibong Metodolohiya**: Introduksyon → Pagpili → Pagpapatunay → Pag-unawa sa Istruktura → Konfigurasyon → Pagpapasadya → Paglilinis (Teardown) → Pagwawakas
- **Interaktibong DevContainer Environment**: Paunang-konfiguradong mga tool at dependency

#### 📚 Struktura ng Mga Module ng Workshop
Sinusunod ng workshop ang isang **8-module na progressibong metodolohiya** na magdadala sa iyo mula sa pagtuklas hanggang sa mastery ng deployment:

| Module | Paksa | Gagawin Mo | Tagal |
|--------|-------|------------|----------|
| **0. Introduksyon** | Pangkalahatang-ideya ng Workshop | Unawain ang mga layunin sa pagkatuto, mga kinakailangan, at istruktura ng workshop | 15 min |
| **1. Pagpili** | Pagdiskubre ng Template | Galugarin ang mga template ng AZD at piliin ang angkop na AI template para sa iyong senaryo | 20 min |
| **2. Pagpapatunay** | I-deploy at Suriin | I-deploy ang template gamit ang `azd up` at patunayan na tumatakbo ang imprastraktura | 30 min |
| **3. Pag-unawa sa Istruktura** | Unawain ang Istruktura | Gamitin ang GitHub Copilot para galugarin ang arkitektura ng template, mga Bicep file, at organisasyon ng code | 30 min |
| **4. Konfigurasyon** | Malalim na Pagsusuri ng azure.yaml | Maging bihasa sa konfigurasyon ng `azure.yaml`, lifecycle hooks, at mga environment variable | 30 min |
| **5. Pagpapasadya** | Gawing Iyo | I-enable ang AI Search, tracing, evaluation, at i-customize para sa iyong senaryo | 45 min |
| **6. Paglilinis (Teardown)** | Linisin | Ligtas na tanggalin ang mga resource gamit ang `azd down --purge` | 15 min |
| **7. Pagwawakas** | Susunod na Hakbang | Suriin ang mga nagawa, mga pangunahing konsepto, at ipagpatuloy ang iyong paglalakbay sa pagkatuto | 15 min |

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
# Sundin ang mga tagubilin sa pag-setup sa workshop/README.md
```

#### 🎯 Mga Layunin sa Pagkatuto ng Workshop
Sa pagkumpleto ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Mga Production AI na Aplikasyon**: Gamitin ang AZD sa mga serbisyo ng Microsoft Foundry
- **Maging Dalubhasa sa Multi-Agent Architectures**: Magpatupad ng magkakaugnay na solusyon ng AI agent
- **Ipatupad ang Mga Pinakamahusay na Kasanayan sa Seguridad**: I-configure ang authentication at access control
- **I-optimize para sa Scalability**: Magdisenyo ng cost-effective, mataas na performans na mga deployment
- **Mag-troubleshoot ng Mga Deployment**: Lutasin ang mga karaniwang isyu nang independiyente

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Mga Materyales ng Workshop](workshop/README.md) - Kapaligirang pag-aaral na batay sa browser
- **📋 Mga Tagubilin Bawat-Module**:
  - [0. Introduksyon](workshop/docs/instructions/0-Introduction.md) - Pangkalahatang-ideya ng workshop at mga layunin
  - [1. Pagpili](workshop/docs/instructions/1-Select-AI-Template.md) - Hanapin at piliin ang AI templates
  - [2. Pagpapatunay](workshop/docs/instructions/2-Validate-AI-Template.md) - I-deploy at patunayan ang mga template
  - [3. Pag-unawa sa Istruktura](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Galugarin ang arkitektura ng template
  - [4. Konfigurasyon](workshop/docs/instructions/4-Configure-AI-Template.md) - Maging bihasa sa azure.yaml
  - [5. Pagpapasadya](workshop/docs/instructions/5-Customize-AI-Template.md) - I-customize para sa iyong senaryo
  - [6. Paglilinis (Teardown)](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Linisin ang mga resource
  - [7. Pagwawakas](workshop/docs/instructions/7-Wrap-up.md) - Suriin at mga susunod na hakbang
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Mga ehersisyong nakatuon sa AI
- **💡 Mabilis na Pagsisimula**: [Gabay sa Pagsasaayos ng Workshop](workshop/README.md#quick-start) - Pag-configure ng environment

**Perpekto para sa**: Pagsasanay sa korporasyon, kurso sa unibersidad, sariling bilis na pag-aaral, at mga bootcamp para sa mga developer.

---

## 📖 Malalim na Pagsusuri: Mga Kakayahan ng AZD

Higit pa sa mga pangunahing konsepto, nagbibigay ang AZD ng makapangyarihang mga tampok para sa mga deployment sa produksyon:

- **Mga deployment na batay sa template** - Gumamit ng mga pre-built template para sa mga karaniwang pattern ng application
- **Imprastraktura bilang Code** - Pamahalaan ang mga Azure resource gamit ang Bicep o Terraform  
- **Pinagsamang workflow** - Seamless na pag-provision, pag-deploy, at pagmamanman ng mga application
- **Developer-friendly** - In-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa Mga AI Deployment**

**Bakit AZD para sa Mga Solusyon ng AI?** Tinatalakay ng AZD ang mga pangunahing hamon na kinahaharap ng mga AI developer:

- **AI-Ready Templates** - Paunang-konfigurar na mga template para sa Microsoft Foundry Models, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Mga built-in na pattern ng seguridad para sa mga serbisyo ng AI, API keys, at mga endpoint ng modelo  
- **Production AI Patterns** - Mga pinakamahusay na kasanayan para sa scalable, cost-effective na pag-deploy ng AI application
- **End-to-End AI Workflows** - Mula sa pag-develop ng modelo hanggang sa production deployment na may tamang pagmamanman
- **Pag-optimize ng Gastos** - Matalinong alokasyon ng resources at mga estratehiya ng scaling para sa mga workload ng AI
- **Integrasyon sa Microsoft Foundry** - Seamless na koneksyon sa catalog ng Microsoft Foundry model at mga endpoint

---

## 🎯 Aklatan ng Mga Template at Halimbawa

### Tampok: Mga Template ng Microsoft Foundry
**Magsimula dito kung magde-deploy ka ng mga AI na aplikasyon!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang AI pattern. Ang ilan ay panlabas na Azure Samples, ang iba ay lokal na implementasyon.

| Template | Kabanata | Kumplikado | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Magsimula sa AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |
| [**Magsimula sa AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Panlabas |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Senaryong Pampagkatuto
**Mga template ng application na handa para sa produksyon na naka-map sa mga kabanata ng pag-aaral**

| Template | Kabanata ng Pagkatuto | Kumplikado | Pangunahing Matutuhan |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng pag-deploy ng AI |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Implementasyon ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture na may Customer at Inventory agents |

### Pagkatuto Ayon sa Uri ng Halimbawa

> **📌 Lokal vs. Panlabas na Mga Halimbawa:**  
> **Mga Lokal na Halimbawa** (sa repo na ito) = Handa nang gamitin agad  
> **Mga Panlabas na Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repository

#### Mga Lokal na Halimbawa (Handa nang Gamitin)
- [**Solusyon sa Retail na Multi-Agent**](examples/retail-scenario.md) - Kumpletong implementasyon na handa para sa produksyon na may ARM templates
  - Arkitekturang multi-agent (Customer + Inventory agents)
  - Komprehensibong pagmamanman at ebalwasyon
  - Isang-click na deployment sa pamamagitan ng ARM template

#### Mga Lokal na Halimbawa - Mga Container Application (Kabanata 2-5)
**Komprehensibong mga halimbawa ng pag-deploy ng container sa repository na ito:**
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa mga containerized deployment
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Pangunahing REST API na may scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Quick Start, Produksyon, at Advanced na mga pattern ng deployment
  - Patnubay sa pagmamanman, seguridad, at pag-optimize ng gastos

#### Mga Panlabas na Halimbawa - Mga Simpleng Application (Kabanata 1-2)
**I-clone ang mga repository ng Azure Samples na ito upang makapagsimula:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga pangunahing pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pag-deploy ng static na nilalaman
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pag-deploy ng REST API

#### Mga Panlabas na Halimbawa - Integrasyon ng Database (Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng koneksyon sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na data workflow

#### Mga Panlabas na Halimbawa - Advanced na Mga Pattern (Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mga multi-service na arkitektura
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mga pattern ng ML na handa para sa produksyon

### Mga Panlabas na Koleksyon ng Template
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - In-ingatang koleksyon ng opisyal at community na mga template
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng Microsoft Learn para sa mga template
- [**Examples Directory**](examples/README.md) - Mga lokal na halimbawa ng pagkatuto na may detalyadong paliwanag

---

## 📚 Mga Mapagkukunan at Sanggunian sa Pagkatuto

### Mabilis na Sanggunian
- [**Cheat Sheet ng Command**](resources/cheat-sheet.md) - Mahahalagang azd command na inayos ayon sa kabanata
- [**Talahulugan**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pagkatuto
- [**Gabay sa Pag-aaral**](resources/study-guide.md) - Komprehensibong mga praktikal na ehersisyo

### Mga Praktikal na Workshop
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga solusyon sa AI (2-3 oras)
- [**Interaktibong Workshop**](workshop/README.md) - 8-module na naka-gabay na mga ehersisyo gamit ang MkDocs at GitHub Codespaces
  - Sinusunod: Introduksyon → Pagpili → Pagpapatunay → Pag-unawa sa Istruktura → Konfigurasyon → Pagpapasadya → Paglilinis → Pagwawakas

### Mga Panlabas na Mapagkukunan sa Pagkatuto
- [Azure Developer CLI Dokumentasyon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Sentro ng Arkitektura ng Azure](https://learn.microsoft.com/en-us/azure/architecture/)
- [Calculator ng Presyo ng Azure](https://azure.microsoft.com/pricing/calculator/)
- [Status ng Azure](https://status.azure.com/)

### Mga Kasanayan ng AI Agent para sa Iyong Editor
- [**Microsoft Azure Skills sa skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 bukas na kasanayan ng agent para sa Azure AI, Foundry, deployment, diagnostics, pag-optimize ng gastos, at iba pa. I-install ang mga ito sa GitHub Copilot, Cursor, Claude Code, o anumang sinusuportahang agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Karaniwang isyung hinaharap ng mga nagsisimula at agarang solusyon:**

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
# Ipakita ang mga magagamit na subscription
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

# O gumamit ng mas maliit na mga SKU sa development
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

# Opsyon 2: Ayusin lamang ang imprastruktura
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
# Muling patunayan ang pagkakakilanlan
az logout
az login

azd auth logout
azd auth login

# Suriin ang pagpapatunay
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# Ang AZD ay gumagawa ng mga natatanging pangalan, ngunit kung may salungatan:
azd down --force --purge

# Subukang muli gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normal wait times:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- Mga aplikasyon ng AI: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Suriin ang progreso
azd show

# Kung na-stuck ng higit sa 30 minuto, tingnan ang Azure Portal:
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
# Hilingin sa iyong Azure admin na magbigay ng:
# - Contributor (para sa mga resource)
# - User Access Administrator (para sa pagtatalaga ng mga role)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

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

### 📚 Mga Komprehensibong Mapagkukunan sa Pag-troubleshoot

- **Gabay sa Karaniwang Isyu:** [Detalyadong Solusyon](docs/chapter-07-troubleshooting/common-issues.md)
- **Isyung Espesipiko sa AI:** [Pag-troubleshoot ng AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Gabay sa Pag-debug:** [Hakbang-hakbang na Pag-debug](docs/chapter-07-troubleshooting/debugging.md)
- **Kumuha ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagtatapos ng Kurso at Sertipikasyon

### Pagsubaybay ng Pag-unlad
Subaybayan ang iyong pag-unlad sa pag-aaral sa bawat kabanata:

- [ ] **Chapter 1**: Pundasyon at Mabilis na Pagsisimula ✅
- [ ] **Chapter 2**: Pag-unlad na Nakasentro sa AI ✅  
- [ ] **Chapter 3**: Konfigurasyon at Authentication ✅
- [ ] **Chapter 4**: Imprastraktura bilang Code at Pag-deploy ✅
- [ ] **Chapter 5**: Mga Solusyon ng Multi-Agent AI ✅
- [ ] **Chapter 6**: Pagpapatunay at Pagpaplano bago i-deploy ✅
- [ ] **Chapter 7**: Pag-troubleshoot at Pag-debug ✅
- [ ] **Chapter 8**: Mga Pattern para sa Produksyon at Enterprise ✅

### Pagpapatunay ng Pagkatuto
Matapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Ehersisyo**: Kumpletuhin ang hands-on na deployment ng kabanata
2. **Pagsusulit ng Kaalaman**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kahirapan

### Mga Benepisyo sa Pagtatapos ng Kurso
Sa pagtatapos ng lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Produksyon**: Nag-deploy ng totoong mga aplikasyon ng AI sa Azure
- **Propesyonal na Kasanayan**: Mga kakayahan sa deployment na handa para sa enterprise  
- **Pagkilala ng Komunidad**: Aktibong miyembro ng komunidad ng Azure developer
- **Pagsulong sa Karera**: Mataas na hinahanap na kasanayan sa AZD at pag-deploy ng AI

---

## 🤝 Komunidad at Suporta

### Humingi ng Tulong at Suporta
- **Teknikal na Isyu**: [I-report ang mga bug at humiling ng mga feature](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Komunidad ng Microsoft Azure sa Discord](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong na Espesipiko sa AI**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Pananaw ng Komunidad mula sa Microsoft Foundry Discord

**Kamakailang Resulta ng Poll mula sa #Azure Channel:**
- **45%** ng mga developer ang nais gumamit ng AZD para sa mga workload ng AI
- **Nangungunang mga hamon**: Multi-service deployments, pamamahala ng kredensyal, kahandaan sa produksyon  
- **Pinakahiniling**: Mga template na espesipiko sa AI, mga gabay sa pag-troubleshoot, pinakamahusay na kasanayan

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Ma-access ang mga maagang preview ng mga bagong AI template
- Mag-ambag sa pinakamahusay na kasanayan sa pag-deploy ng AI
- Maka-impluwensya sa hinaharap na pag-unlad ng AI + AZD na mga feature

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang kontribusyon! Mangyaring basahin ang aming [Gabay sa Pag-aambag](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapabuti ng Nilalaman**: Pagbutihin ang umiiral na mga kabanata at halimbawa
- **Bagong Mga Halimbawa**: Magdagdag ng mga tunay na scenario at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng multi-language na suporta
- **Mga Ulat ng Bug**: Pahusayin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong patnubay sa komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) na file para sa mga detalye.

### Kaugnay na Mga Mapagkukunang Pang-Pagkatuto ng Microsoft

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
[![Generative AI (.NET) para sa mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java) para sa mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript) para sa mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
[![Copilot para sa Paired Programming ng AI](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pakikipagsapalaran ng Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navagasyon ng Kurso

**🚀 Handa na bang Magsimulang Matuto?**

**Mga Baguhan**: Magsimula sa [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](#-chapter-1-foundation--quick-start)  
**Mga Developer ng AI**: Pumunta sa [Kabanata 2: Pag-develop na Inuuna ang AI](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Mga Karanasang Developer**: Magsimula sa [Kabanata 3: Konfigurasyon at Pagpapatunay](#️-chapter-3-configuration--authentication)

**Mga Susunod na Hakbang**: [Simulan ang Kabanata 1 - Mga Pangunahing Kaalaman sa AZD](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin na pinapagana ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatumpak. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot para sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->