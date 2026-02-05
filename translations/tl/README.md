<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T13:44:57+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa mga Nagsisimula: Isang Estrukturadong Paglalakbay sa Pagkatuto

![AZD-for-beginners](../../../../translated_images/tl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Pagsisimula sa Kurso na Ito

Sundin ang mga hakbang na ito upang simulan ang iyong paglalakbay sa pagkatuto ng AZD:

1. **I-fork ang Repository**: I-click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ang Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Sumali sa Komunidad**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) para sa ekspertong suporta
4. **Pumili ng Iyong Landas sa Pagkatuto**: Piliin ang isang kabanata sa ibaba na tumutugma sa iyong antas ng karanasan

### Suporta sa Maramihang Wika

#### Automated na mga Pagsasalin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Mas Gusto Mo Bang I-clone nang Lokal?**

> Kasama sa repositoryong ito ang 50+ na pagsasalin ng wika na nagpapalaki nang malaki sa laki ng download. Para i-clone nang walang mga pagsasalin, gamitin ang sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Binibigyan ka nito ng lahat ng kailangan mo upang matapos ang kurso nang mas mabilis ang pag-download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pangkalahatang-ideya ng Kurso

Maging eksperto sa Azure Developer CLI (azd) sa pamamagitan ng mga estrukturadong kabanata na idinisenyo para sa progresibong pagkatuto. **Espesyal na pokus sa deployment ng AI application gamit ang integrasyon ng Microsoft Foundry.**

### Bakit Mahalaga ang Kursong Ito para sa Mga Modernong Developer

Batay sa mga pananaw mula sa Microsoft Foundry Discord community, **45% ng mga developer ay nais gamitin ang AZD para sa mga AI workload** ngunit nahaharap sa mga hamon na tulad ng:
- Kumplikadong multi-service AI architectures
- Pinakamahusay na gawain sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI services
- Optimisasyon sa gastos para sa AI workloads
- Pag-troubleshoot ng mga problema sa AI-specific deployment

### Mga Layunin ng Pagkatuto

Sa pagtapos ng estrukturadong kursong ito, magagawa mo ang mga sumusunod:
- **Maging Master sa AZD Fundamentals**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **I-deploy ang AI Applications**: Gamitin ang AZD kasama ang mga serbisyong Microsoft Foundry
- **Ipatupad ang Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at debug ng mga problema
- **I-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Magbuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 📚 Mga Kabanata ng Pagkatuto

*Pumili ng iyong landas sa pagkatuto batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon at Mabilisang Pagsisimula
**Mga Kinakailangan**: Azure subscription, batayang kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kumplikado**: ⭐

#### Ano ang Matututunan Mo
- Pag-unawa sa mga pangunahing kaalaman ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Iyong unang matagumpay na deployment

#### Mga Mapagkunang Pangkatuto
- **🎯 Magsimula Dito**: [Ano ang Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Gabay sa bawat platform
- **🛠️ Hands-On**: [Iyong Unang Proyekto](docs/getting-started/first-project.md) - Tutorial na hakbang-hakbang
- **📋 Mabilisang Sanggunian**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilisang pagsuri sa pag-install
azd version

# Ilunsad ang iyong unang aplikasyon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kinalabasan ng Kabanata**: Matagumpay na makapagdeploy ng simpleng web application sa Azure gamit ang AZD

**✅ Katunayan ng Tagumpay:**
```bash
# Pagkatapos matapos ang Kabanata 1, dapat mong magawa ang mga sumusunod:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Nag-i-initialize ng proyekto
azd up                  # Nagde-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Nabubuksan ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras ng Pagsasanay:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang magdeploy ng mga basic na aplikasyon nang mag-isa

**✅ Katunayan ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang mga sumusunod:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-initialize ang proyekto
azd up                  # Nagde-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bumubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras ng Pagsasanay:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang magdeploy ng mga basic na aplikasyon nang mag-isa

---

### 🤖 Kabanata 2: AI-First Development (Inirekomenda para sa mga AI Developer)
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Integrasyon ng Microsoft Foundry sa AZD
- Pag-deploy ng mga AI-powered na aplikasyon
- Pag-unawa sa AI service configurations

#### Mga Mapagkunang Pangkatuto
- **🎯 Magsimula Dito**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - Magdeploy at mag-manage ng AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gumawa ng mga AI solution na handa para sa AZD
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning na may MkDocs * DevContainer Environment
- **📋 Mga Template**: [Microsoft Foundry Templates](../..)
- **📝 Mga Halimbawa**: [AZD Deployment Examples](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang AI na aplikasyon
azd init --template azure-search-openai-demo
azd up

# Subukan ang mga karagdagang AI na template
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: Maideploy at makonfigura ang isang AI-powered chat application na may RAG capabilities

**✅ Katunayan ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat kang makagawa ng:
azd init --template azure-search-openai-demo
azd up
# Subukan ang AI chat interface
# Magtanong at makatanggap ng mga sagot na pinatatakbo ng AI na may mga sanggunian
# Tiyakin na gumagana ang pagsasama ng paghahanap
azd monitor  # Suriin kung nagpapakita ang Application Insights ng telemetriya
azd down --force --purge
```

**📊 Oras ng Pagsasanay:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang magdeploy at mag-konfigura ng production-ready na AI applications  
**💰 Pagkakaalam sa Gastos:** Nauunawaan ang $80-150/buwan na gastusin sa dev, $300-3500/buwan na gastusin sa production

#### 💰 Mga Considerasyon sa Gastos para sa AI Deployments

**Development Environment (Tinatayang $80-150/buwan):**
- Azure OpenAI (Pay-as-you-go): $0-50/buwan (ayon sa token usage)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Production Environment (Tinatayang $300-3,500+/buwan):**
- Azure OpenAI (PTU para sa consistent performance): $3,000+/buwan O Pay-as-go na may mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gumamit ng **Free Tier** ng Azure OpenAI para sa pagkatuto (kasama ang 50,000 tokens/buwan)
- Patakbuhin ang `azd down` para i-deallocate ang mga resources kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based billing, mag-upgrade sa PTU para lang sa production
- Gamitin ang `azd provision --preview` para tantyahin ang gastos bago ang deployment
- I-enable ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagmomonitor ng Gastos:**
```bash
# Suriin ang tinatayang buwanang gastos
azd provision --preview

# Subaybayan ang aktwal na gastos sa Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Konfigurasyon at Authentication
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Pag-configure at pamamahala ng mga environment
- Authentication at mga pinakamagandang pamamaraan sa seguridad
- Pangalanan at organisasyon ng mga resources

#### Mga Mapagkunang Pangkatuto
- **📖 Konfigurasyon**: [Configuration Guide](docs/getting-started/configuration.md) - Pagsasaayos ng environment
- **🔐 Seguridad**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Mga authentication pattern
- **📝 Mga Halimbawa**: [Database App Example](examples/database-app/README.md) - Mga AZD Database na Halimbawa

#### Mga Praktikal na Ehersisyo
- Mag-configure ng maraming environment (dev, staging, prod)
- Mag-setup ng managed identity authentication
- Ipatupad ang environment-specific na konfigurasyon

**💡 Kinalabasan ng Kabanata**: Mapamahalaan ang maraming environment na may wastong authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga advanced na deployment pattern
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resources

#### Mga Mapagkunang Pangkatuto
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Kumpletong workflow
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Pamamahala ng Azure resources
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized deployment

#### Mga Praktikal na Ehersisyo
- Gumawa ng mga custom na Bicep templates
- Magdeploy ng multi-service applications
- Ipatupad ang blue-green deployment strategies

**💡 Kinalabasan ng Kabanata**: Magdeploy ng kumplikadong multi-service applications gamit ang custom infrastructure templates

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga architecture pattern para sa multi-agent
- Pag-oorganisa at koordinasyon ng mga ahente  
- AI deployments na handa na para sa produksyon  

#### Mga Mapagkukunan sa Pag-aaral  
- **🤖 Tampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon  
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click na deployment  
- **📖 Arkitektura**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Mga pattern  

#### Mga Praktikal na Ehersisyo  
```bash
# I-deploy ang kumpletong retail multi-agent na solusyon
cd examples/retail-multiagent-arm-template
./deploy.sh

# Suriin ang mga configuration ng ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Kinalabasan ng Kabanata**: Mag-deploy at pamahalaan ang production-ready multi-agent AI solution gamit ang mga Customer at Inventory agents  

---  

### 🔍 Kabanata 6: Pre-Deployment Validation & Planning  
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Tagal**: 1 oras  
**Kahusayan**: ⭐⭐  

#### Ano ang Matututuhan Mo  
- Pagpaplano ng kapasidad at pag-validate ng mga resource  
- Mga estratehiya sa pagpili ng SKU  
- Pre-flight checks at awtomasyon  

#### Mga Mapagkukunan sa Pag-aaral  
- **📊 Pagpaplano**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Pag-validate ng resource  
- **💰 Pagpili**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian  
- **✅ Pag-validate**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Mga automated na script  

#### Mga Praktikal na Ehersisyo  
- Patakbuhin ang mga capacity validation script  
- I-optimize ang mga SKU selection para makatipid  
- Magpatupad ng automated na mga pre-deployment check  

**💡 Kinalabasan ng Kabanata**: I-validate at i-optimize ang mga deployment bago isagawa  

---  

### 🚨 Kabanata 7: Troubleshooting & Debugging  
**Mga Kinakailangan**: Anumang kabanata ng deployment ay natapos na  
**Tagal**: 1-1.5 oras  
**Kahusayan**: ⭐⭐  

#### Ano ang Matututuhan Mo  
- Sistematikong mga pamamaraan sa debugging  
- Mga karaniwang isyu at solusyon  
- AI-specific troubleshooting  

#### Mga Mapagkukunan sa Pag-aaral  
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon  
- **🕵️ Gabay sa Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya  
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa AI service  

#### Mga Praktikal na Ehersisyo  
- Mag-diagnose ng mga kabiguan sa deployment  
- Lutasin ang mga isyu sa authentication  
- Mag-debug ng koneksyon sa AI service  

**💡 Kinalabasan ng Kabanata**: Mag-diagnose at magresolba ng mga karaniwang isyu sa deployment nang mag-isa  

---  

### 🏢 Kabanata 8: Production & Enterprise Patterns  
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kahusayan**: ⭐⭐⭐⭐  

#### Ano ang Matututuhan Mo  
- Mga estratehiya sa production deployment  
- Mga pattern ng seguridad para sa enterprise  
- Pagmo-monitor at pag-optimize ng gastos  

#### Mga Mapagkukunan sa Pag-aaral  
- **🏭 Produksyon**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Mga enterprise na pattern  
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga komplikadong arkitektura  
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Pagmo-monitor  

#### Mga Praktikal na Ehersisyo  
- Magpatupad ng mga pattern ng seguridad para sa enterprise  
- Mag-set up ng komprehensibong monitoring  
- Mag-deploy sa produksyon nang may tamang pamamahala  

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga enterprise-ready application na may kompletong kakayahan sa produksyon  

---  

## 🎓 Overview ng Workshop: Hands-On Learning Experience  

> **⚠️ KALAGAYAN NG WORKSHOP: Aktibong Pagpapaunlad**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapahusay. Gumagana na ang mga core module, ngunit ang ilang mga advanced na seksyon ay hindi pa kumpleto. Aktibong nagtatrabaho kami upang matapos ang lahat ng nilalaman. [Subaybayan ang progreso →](workshop/README.md)  

### Mga Interactive na Materyales ng Workshop  
**Komprehensibong hands-on learning gamit ang mga tool na browser-based at mga pinangungunang ehersisyo**  

Ang aming mga materyales sa workshop ay nagbibigay ng isang istrukturadong, interactive na karanasan sa pag-aaral na bumubuo sa curriculum na nakaayos sa mga kabanata sa itaas. Dinisenyo ang workshop para sa parehong self-paced na pag-aaral at instructor-led sessions.  

#### 🛠️ Mga Tampok ng Workshop  
- **Browser-Based Interface**: Kumpletong MkDocs-powered na workshop na may search, copy, at mga tema  
- **GitHub Codespaces Integration**: One-click na pag-setup ng development environment  
- **Istrakturadong Learning Path**: 7-step na guided exercises (3.5 na oras kabuuan)  
- **Discovery → Deployment → Customization**: Progressive na metodolohiya  
- **Interactive DevContainer Environment**: Pre-configured na mga tool at dependencies  

#### 📚 Istraktura ng Workshop  
Ang workshop ay sumusunod sa metodolohiyang **Discovery → Deployment → Customization**:  

1. **Discovery Phase** (45 min)  
   - Tuklasin ang Microsoft Foundry templates at mga serbisyo  
   - Unawain ang mga pattern ng multi-agent na arkitektura  
   - Review ng mga kailangan sa deployment at prerequisites  

2. **Deployment Phase** (2 oras)  
   - Hands-on na pag-deploy ng AI applications gamit ang AZD  
   - I-configure ang mga Azure AI serbisyo at mga endpoint  
   - Magpatupad ng seguridad at authentication pattern  

3. **Customization Phase** (45 min)  
   - Baguhin ang mga application para sa tiyak na paggamit  
   - I-optimize para sa production deployment  
   - Magpatupad ng monitoring at pamamahala ng gastos  

#### 🚀 Pagsisimula sa Workshop  
```bash
# Opsyon 1: GitHub Codespaces (Inirerekomenda)
# I-click ang "Code" → "Create codespace on main" sa repository

# Opsyon 2: Lokal na Pag-unlad
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga instruksyon sa setup sa workshop/README.md
```
  
#### 🎯 Mga Kinalabasan sa Pag-aaral ng Workshop  
Sa pagtatapos ng workshop, matututuhan ng mga kalahok na:  
- **Mag-deploy ng Production AI Applications**: Gamit ang AZD sa Microsoft Foundry services  
- **Maging Master sa Multi-Agent Architectures**: Magpatupad ng coordinated AI agent solutions  
- **Magpatupad ng Security Best Practices**: I-configure ang authentication at control ng access  
- **Mag-optimize para sa Scalability**: Disenyo ng cost-effective at performant na deployment  
- **Mag-troubleshoot ng Deployment**: Lutasin ang mga karaniwang isyu nang mag-isa  

#### 📖 Mga Mapagkukunan sa Workshop  
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based na kapaligiran sa pag-aaral  
- **📋 Hakbang-hakbang na mga Instruksyon**: [Guided Exercises](../../workshop/docs/instructions) - Detalyadong walkthrough  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Mga AI-focused na ehersisyo  
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Pag-configure ng kapaligiran  

**Perpekto para sa**: Corporate training, mga kurso sa unibersidad, self-paced na pag-aaral, at developer bootcamps.  

---  

## 📖 Ano ang Azure Developer CLI?  

Ang Azure Developer CLI (azd) ay isang developer-centric na command-line interface na nagpapabilis ng proseso ng paggawa at pag-deploy ng mga application sa Azure. Nagbibigay ito ng:  

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa mga karaniwang pattern ng application  
- **Infrastructure as Code** - Pamahalaan ang Azure resources gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na provisioning, deployment, at monitoring ng mga application  
- **Developer-friendly** - Na-optimize para sa productivity at karanasan ng developer  

### **AZD + Microsoft Foundry: Perpekto para sa AI Deployments**  

**Bakit AZD para sa AI Solutions?** Tinugunan ng AZD ang mga pangunahing hamon na kinahaharap ng mga AI developer:  

- **AI-Ready Templates** - Pre-configured na mga template para sa Azure OpenAI, Cognitive Services, at ML workloads  
- **Secure AI Deployments** - Built-in na security pattern para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Mga best practice para sa scalable, cost-effective na AI application deployments  
- **End-to-End AI Workflows** - Mula sa pagbuo ng modelo hanggang sa production deployment na may tamang monitoring  
- **Cost Optimization** - Matalinong alokasyon ng resource at scaling strategies para sa AI workloads  
- **Microsoft Foundry Integration** - Seamless na koneksyon sa Microsoft Foundry model catalog at mga endpoint  

---  

## 🎯 Templates & Examples Library  

### Tampok: Microsoft Foundry Templates  
**Simulan dito kung nagde-deploy ka ng AI applications!**  

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang AI pattern. Ang ilan ay panlabas na Azure Samples, ang iba ay lokal na implementasyon.  

| Template | Kabanata | Kahusayan | Mga Serbisyo | Uri |  
|----------|----------|-----------|-------------|-----|  
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |  
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |  
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |  
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |  
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |  
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |  
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |  

### Tampok: Kumpletong Mga Learning Scenario  
**Mga production-ready application templates na naiuugnay sa mga kabanata ng pag-aaral**  

| Template | Kabanata ng Pag-aaral | Kahusayan | Pangunahing Natutunan |  
|----------|-----------------------|-----------|-----------------------|  
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga basic na AI deployment pattern |  
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | RAG implementation gamit ang Azure AI Search |  
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Document Intelligence integration |  
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework at function calling |  
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |  
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture gamit ang Customer at Inventory agents |  

### Pag-aaral sa Pamamagitan ng Uri ng Halimbawa  

> **📌 Lokal vs. Panlabas na Halimbawa:**  
> **Lokal na Halimbawa** (sa repo na ito) = Handa nang gamitin  
> **Panlabas na Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repository  

#### Lokal na Halimbawa (Handa Nang Gamitin)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong production-ready implementasyon kasama ang ARM templates  
  - Multi-agent architecture (Customer + Inventory agents)  
  - Komprehensibong monitoring at pagsusuri  
  - One-click deployment gamit ang ARM template  

#### Lokal na Halimbawa - Container Applications (Kabanata 2-5)  
**Komprehensibong container deployment examples sa repository na ito:**  
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa containerized deployments  
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API na may scale-to-zero  
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready multi-service deployment  
  - Quick Start, Production, at Advanced na pattern ng deployment  
  - Gabay sa monitoring, seguridad, at pag-optimize ng gastos  

#### Panlabas na Halimbawa - Simple Applications (Kabanata 1-2)  
**I-clone ang mga Azure Samples repository na ito para makapagsimula:**  
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga basic na pattern ng deployment  
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Static content deployment  
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment  

#### Panlabas na Halimbawa - Database Integration (Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng pagkonekta sa database  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na workflow ng data  

#### Panlabas na Halimbawa - Advanced na Mga Pattern (Kabanata 4-8)  
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mga arkitekturang multi-service  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready ML pattern  

### Mga Koleksyon ng Panlabas na Template  
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng opisyal at community templates  
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng mga Microsoft Learn template
- [**Mga Halimbawa na Direktoryo**](examples/README.md) - Mga lokal na halimbawa para sa pag-aaral na may detalyadong mga paliwanag

---

## 📚 Mga Mapagkukunan sa Pag-aaral & Mga Sanggunian

### Mabilis na Mga Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang azd commands na inayos ayon sa kabanata
- [**Terminolohiya**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pag-aaral
- [**Gabay sa Pag-aaral**](resources/study-guide.md) - Malawakang mga pagsasanay

### Mga Hands-On na Workshop
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga AI solution (2-3 oras)
- [**Interactive Workshop Guide**](workshop/README.md) - Browser-based workshop gamit ang MkDocs at DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-hakbang na gabay na mga pagsasanay (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Kumpletong mga materyales para sa hands-on na workshop na may integrasyon ng GitHub Codespaces

### Mga Panlabas na Mapagkukunan sa Pag-aaral
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Mabilis na Gabay sa Pag-aayos ng Problema

**Pangkaraniwang mga isyu na kinahaharap ng mga nagsisimula at mga agarang solusyon:**

### ❌ "azd: command not found"

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

### ❌ "No subscription found" or "Subscription not set"

```bash
# Ilista ang mga available na subscription
az account list --output table

# Itakda ang default na subscription
az account set --subscription "<subscription-id-or-name>"

# Itakda para sa AZD na kapaligiran
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Beripikahin
az account show
```

### ❌ "InsufficientQuota" or "Quota exceeded"

```bash
# Subukan ang ibang Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# O gumamit ng mas maliit na SKUs sa development
# I-edit ang infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Opsyon 1: Linisin at subukang muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lamang ang imprastruktura
azd provision

# Opsyon 3: Suriin ang mga detalyadong log
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Muling patunayan
az logout
az login

azd auth logout
azd auth login

# Suriin ang pagpapatotoo
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# Ang AZD ay bumubuo ng mga natatanging pangalan, ngunit kung may salungatan:
azd down --force --purge

# Subukan muli gamit ang bagong environment
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Karaniwang oras ng paghihintay:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- AI applications: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Tingnan ang progreso
azd show

# Kung natigil nang higit sa 30 minuto, tingnan ang Azure Portal:
azd monitor
# Hanapin ang mga nabigong deployment
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Suriin ang iyong Azure na papel
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa papel na "Contributor"
# Hilingin sa iyong Azure admin na bigyan ng:
# - Contributor (para sa mga resources)
# - User Access Administrator (para sa mga itinakdang papel)
```

### ❌ Hindi makita ang URL ng na-deploy na aplikasyon

```bash
# Ipakita lahat ng mga endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga *_URL na variable
```

### 📚 Kumpletong Mga Mapagkukunan sa Pag-aayos ng Problema

- **Gabay sa Karaniwang Isyu:** [Detalyadong mga Solusyon](docs/troubleshooting/common-issues.md)
- **Mga Isyu na Pang-AI:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Gabay sa Pag-debug:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Humingi ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Mabilis na Gabay sa Pag-aayos ng Problema

**Pangkaraniwang mga isyu na kinahaharap ng mga nagsisimula at mga agarang solusyon:**

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
# Subukan ang ibang Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# O gumamit ng mas maliit na SKU sa development
# I-edit ang infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Opsyon 1: Linisin at subukang muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lamang ang imprastruktura
azd provision

# Opsyon 3: Suriin ang detalyadong mga log
azd show
azd logs
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
# Gumagawa ang AZD ng mga natatanging pangalan, ngunit kung magkakaroon ng pagtutunggali:
azd down --force --purge

# Subukang muli gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Karaniwang oras ng paghihintay:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- AI applications: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Suriin ang progreso
azd show

# Kung na-stuck nang >30 minuto, tingnan ang Azure Portal:
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
# Hilingin sa iyong Azure admin na bigyan ng:
# - Contributor (para sa mga resources)
# - User Access Administrator (para sa mga role assignments)
```
</details>

<details>
<summary><strong>❌ Hindi makita ang URL ng na-deploy na aplikasyon</strong></summary>

```bash
# Ipakita lahat ng mga endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga variable na *_URL
```
</details>

### 📚 Kumpletong Mga Mapagkukunan sa Pag-aayos ng Problema

- **Gabay sa Karaniwang Isyu:** [Detalyadong mga Solusyon](docs/troubleshooting/common-issues.md)
- **Mga Isyu na Pang-AI:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Gabay sa Pag-debug:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Humingi ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagtatapos ng Kurso at Sertipikasyon

### Pagsubaybay sa Progreso
Subaybayan ang iyong progreso sa pag-aaral sa bawat kabanata:

- [ ] **Kabanata 1**: Foundation & Quick Start ✅
- [ ] **Kabanata 2**: AI-First Development ✅  
- [ ] **Kabanata 3**: Configuration & Authentication ✅
- [ ] **Kabanata 4**: Infrastructure as Code & Deployment ✅
- [ ] **Kabanata 5**: Multi-Agent AI Solutions ✅
- [ ] **Kabanata 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Kabanata 7**: Troubleshooting & Debugging ✅
- [ ] **Kabanata 8**: Production & Enterprise Patterns ✅

### Pagpapatunay sa Pagkatuto
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Pagsasanay**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Knowledge Check**: Balikan ang FAQ na seksyon para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa mas mataas na antas ng komplikasyon

### Mga Benepisyo ng Pagtatapos ng Kurso
Kapag nakumpleto ang lahat ng kabanata, makakamit mo ang:
- **Karanasang Pang-produksyon**: Na-deploy ang mga totoong AI application sa Azure
- **Propesyonal na Kakayahan**: Kakayahang mag-deploy na handa sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng Azure developer community
- **Pag-unlad ng Karera**: In-demand na kadalubhasaan sa AZD at AI deployment

---

## 🤝 Komunidad at Suporta

### Humingi ng Tulong at Suporta
- **Mga Teknikal na Isyu**: [I-report ang mga bugs at humiling ng mga feature](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong na Pang-AI**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Pananaw ng Komunidad mula sa Microsoft Foundry Discord

**Mga Kamakailang Resulta ng Botohan mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gamitin ang AZD para sa AI workloads
- **Mga Nangungunang Hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakakailanganin**: AI-specific templates, troubleshooting guides, best practices

**Sumali sa aming komunidad para sa:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Maagang access sa mga bagong AI templates
- Mag-ambag sa mga best practice sa AI deployment
- Impluwensyahan ang hinaharap ng AI + AZD development

### Pagsali sa Pagbabahagi ng Kurso
Malugod naming tinatanggap ang mga kontribusyon! Mangyaring basahin ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagsasaayos ng Nilalaman**: Pagbutihin ang umiiral na mga kabanata at mga halimbawa
- **Bagong mga Halimbawa**: Magdagdag ng mga totoong scenario at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng multi-language support
- **Pag-uulat ng Bug**: Pagbutihin ang katumpakan at kalinawan
- **Mga Pamantayan sa Komunidad**: Sundin ang aming inklusibong mga patnubay sa komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) para sa mga detalye.

### Kaugnay na Microsoft Learning Resources

Ang aming koponan ay gumagawa ng iba pang malawakang mga kurso sa pag-aaral:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

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
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa mga Baguhan](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity para sa mga Baguhan](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa mga Baguhan](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa mga Baguhan](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development para sa mga Baguhan](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot para sa AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigasyon ng Kurso

**🚀 Handa Ka Na Bang Magsimulang Matuto?**

**Mga Baguhan**: Simulan sa [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../..)  
**Mga AI Developer**: Tumalon sa [Kabanata 2: AI-First Development](../..)  
**Mga Batikang Developer**: Magsimula sa [Kabanata 3: Konfigurasyon at Pagpapatunay](../..)

**Mga Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pahayag ng Pagsuway**:
Ang dokumentong ito ay isinalin gamit ang AI na serbisyo sa pagsasalin na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat nagsusumikap kami na maging tumpak, pakatandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi eksaktong interpretasyon. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaintindihan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->