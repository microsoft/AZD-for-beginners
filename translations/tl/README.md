<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9d6a833ed38e4fb2c726d3955fc8a726",
  "translation_date": "2025-12-19T13:15:43+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa Mga Nagsisimula: Isang Istrakturadong Paglalakbay sa Pag-aaral

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tl.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Pagsisimula sa Kurso na Ito

Sundin ang mga hakbang na ito upang simulan ang iyong paglalakbay sa pag-aaral ng AZD:

1. **I-fork ang Repositoryo**: I-click ang [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ang Repositoryo**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Sumali sa Komunidad**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) para sa ekspertong suporta
4. **Pumili ng Iyong Landas sa Pag-aaral**: Piliin ang isang kabanata sa ibaba na tumutugma sa iyong antas ng karanasan

### Suporta sa Maramihang Wika

#### Awtomatikong Pagsasalin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pangkalahatang-ideya ng Kurso

Maging bihasa sa Azure Developer CLI (azd) sa pamamagitan ng mga istrakturadong kabanata na dinisenyo para sa progresibong pag-aaral. **Espesyal na pokus sa pag-deploy ng AI application gamit ang Microsoft Foundry integration.**

### Bakit Mahalaga ang Kurso na Ito para sa mga Modernong Developer

Batay sa mga pananaw mula sa Microsoft Foundry Discord community, **45% ng mga developer ay nais gamitin ang AZD para sa AI workloads** ngunit nahaharap sa mga hamon tulad ng:
- Kumplikadong multi-service AI architectures
- Pinakamahuhusay na kasanayan sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI service
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga ispesipikong isyu sa AI deployment

### Mga Layunin sa Pag-aaral

Sa pagtatapos ng istrakturadong kursong ito, ikaw ay:
- **Maging Eksperto sa AZD Fundamentals**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at mag-debug ng problema
- **Mag-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Gumawa ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 📚 Mga Kabanata sa Pag-aaral

*Pumili ng iyong landas sa pag-aaral batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon at Mabilis na Pagsisimula
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kumplikado**: ⭐

#### Ano ang Matututuhan Mo
- Pag-unawa sa mga pundasyon ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Ano ang Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Mga gabay para sa partikular na platform
- **🛠️ Hands-On**: [Ang Iyong Unang Proyekto](docs/getting-started/first-project.md) - Hakbang-hakbang na tutorial
- **📋 Mabilisang Sanggunian**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilis na pagsuri ng pag-install
azd version

# I-deploy ang iyong unang aplikasyon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kinalabasan ng Kabanata**: Matagumpay na maideploy ang isang simpleng web application sa Azure gamit ang AZD

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang mga sumusunod:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalisa ang proyekto
azd up                  # Nagde-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bumubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras na Ginugol:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing aplikasyon nang mag-isa

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang mga sumusunod:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalisa ang proyekto
azd up                  # Nagde-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bumubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras na Ginugol:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing aplikasyon nang mag-isa

---

### 🤖 Kabanata 2: AI-First Development (Inirerekomenda para sa mga AI Developer)
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Microsoft Foundry integration gamit ang AZD
- Pag-deploy ng mga AI-powered na aplikasyon
- Pag-unawa sa mga konfigurasyon ng AI service

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - Mag-deploy at mag-manage ng mga AI model
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga AI solution
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Pag-aaral gamit ang browser na may MkDocs * DevContainer Environment
- **📋 Mga Template**: [Microsoft Foundry Templates](../..)
- **📝 Mga Halimbawa**: [AZD Deployment Examples](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang AI na aplikasyon
azd init --template azure-search-openai-demo
azd up

# Subukan ang karagdagang mga AI na template
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at mag-configure ng AI-powered chat application na may RAG capabilities

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat mong magawa ang mga sumusunod:
azd init --template azure-search-openai-demo
azd up
# Subukan ang AI chat interface
# Magtanong at makakuha ng mga sagot na pinapagana ng AI na may mga sanggunian
# Suriin kung gumagana ang pagsasama ng paghahanap
azd monitor  # Tingnan kung nagpapakita ang Application Insights ng telemetry
azd down --force --purge
```

**📊 Oras na Ginugol:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-configure ng production-ready AI applications  
**💰 Kamalayan sa Gastos:** Naiintindihan ang $80-150/buwan na gastos sa dev, $300-3500/buwan sa production

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa AI Deployments

**Development Environment (Tinatayang $80-150/buwan):**
- Azure OpenAI (Pay-as-you-go): $0-50/buwan (batay sa paggamit ng token)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Production Environment (Tinatayang $300-3,500+/buwan):**
- Azure OpenAI (PTU para sa consistent na performance): $3,000+/buwan O Pay-as-go na may mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gamitin ang **Free Tier** ng Azure OpenAI para sa pag-aaral (kasama ang 50,000 tokens/buwan)
- Patakbuhin ang `azd down` upang i-deallocate ang mga resources kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based billing, i-upgrade sa PTU lamang para sa production
- Gamitin ang `azd provision --preview` upang tantiyahin ang gastos bago mag-deploy
- Paganahin ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagsubaybay sa Gastos:**
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

#### Ano ang Matututuhan Mo
- Konfigurasyon at pamamahala ng environment
- Authentication at mga pinakamahusay na kasanayan sa seguridad
- Pagpapangalan at organisasyon ng mga resource

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Konfigurasyon**: [Configuration Guide](docs/getting-started/configuration.md) - Setup ng environment
- **🔐 Seguridad**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Mga pattern ng authentication
- **📝 Mga Halimbawa**: [Database App Example](examples/database-app/README.md) - Mga halimbawa ng AZD Database

#### Mga Praktikal na Ehersisyo
- I-configure ang maramihang environment (dev, staging, prod)
- I-setup ang managed identity authentication
- Ipatupad ang mga environment-specific na konfigurasyon

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maramihang environment na may tamang authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
**Mga Kinakailangan**: Natapos ang Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga advanced na pattern sa deployment
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resource

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Pamamahala ng Azure resource
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized deployment

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na Bicep templates
- Mag-deploy ng multi-service applications
- Ipatupad ang blue-green deployment strategies

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng kumplikadong multi-service applications gamit ang custom infrastructure templates

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Natapos ang Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga pattern ng multi-agent architecture
- Agent orchestration at coordination
- Production-ready AI deployments

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Tampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Isang-click na deployment
- **📖 Arkitektura**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Mga pattern

#### Praktikal na Mga Ehersisyo
```bash
# I-deploy ang kumpletong retail multi-agent na solusyon
cd examples/retail-multiagent-arm-template
./deploy.sh

# Suriin ang mga konfigurasyon ng ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at mag-manage ng production-ready na multi-agent AI solution gamit ang Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation & Planning
**Mga Kinakailangan**: Natapos ang Kabanata 4  
**Tagal**: 1 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Iyong Matututuhan
- Pagpaplano ng kapasidad at pag-validate ng mga resources
- Mga estratehiya sa pagpili ng SKU
- Mga pre-flight check at automation

#### Mga Mapagkukunan sa Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Pag-validate ng resources
- **💰 Pagpili**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- **✅ Pag-validate**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Mga automated na script

#### Praktikal na Mga Ehersisyo
- Patakbuhin ang mga script para sa pag-validate ng kapasidad
- I-optimize ang mga pagpili ng SKU para sa gastos
- Ipatupad ang mga automated na pre-deployment check

**💡 Kinalabasan ng Kabanata**: I-validate at i-optimize ang mga deployment bago isagawa

---

### 🚨 Kabanata 7: Troubleshooting & Debugging
**Mga Kinakailangan**: Natapos ang kahit anong deployment na kabanata  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Iyong Matututuhan
- Sistematikong mga pamamaraan sa debugging
- Mga karaniwang isyu at solusyon
- AI-specific na troubleshooting

#### Mga Mapagkukunan sa Pag-aaral
- **🔧 Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya
- **🤖 AI Isyu**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa AI service

#### Praktikal na Mga Ehersisyo
- Mag-diagnose ng mga pagkabigo sa deployment
- Lutasin ang mga isyu sa authentication
- I-debug ang konektibidad ng AI service

**💡 Kinalabasan ng Kabanata**: Mag-diagnose at mag-resolba ng mga karaniwang isyu sa deployment nang mag-isa

---

### 🏢 Kabanata 8: Production & Enterprise Patterns
**Mga Kinakailangan**: Natapos ang Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Iyong Matututuhan
- Mga estratehiya sa production deployment
- Mga pattern ng seguridad sa enterprise
- Monitoring at pag-optimize ng gastos

#### Mga Mapagkukunan sa Pag-aaral
- **🏭 Produksyon**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Mga pattern sa enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga komplikadong arkitektura
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### Praktikal na Mga Ehersisyo
- Ipatupad ang mga pattern ng seguridad sa enterprise
- Mag-set up ng komprehensibong monitoring
- Mag-deploy sa produksyon na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga enterprise-ready na aplikasyon na may buong kakayahan sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Hands-On Learning Experience

> **⚠️ KALAGAYAN NG WORKSHOP: Aktibong Pag-develop**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapahusay. Gumagana na ang mga pangunahing module, ngunit may ilang advanced na bahagi na hindi pa kumpleto. Aktibo naming tinatapos ang lahat ng nilalaman. [Subaybayan ang progreso →](workshop/README.md)

### Interactive Workshop Materials
**Komprehensibong hands-on na pag-aaral gamit ang browser-based na mga tool at mga gabay na ehersisyo**

Ang aming mga materyales sa workshop ay nagbibigay ng isang istrukturadong, interactive na karanasan sa pag-aaral na sumusuporta sa curriculum na nakabase sa mga kabanata sa itaas. Ang workshop ay dinisenyo para sa parehong self-paced na pag-aaral at mga instructor-led na sesyon.

#### 🛠️ Mga Tampok ng Workshop
- **Browser-Based Interface**: Kumpletong MkDocs-powered na workshop na may search, copy, at theme features
- **GitHub Codespaces Integration**: Isang-click na setup ng development environment
- **Istrakturadong Landas ng Pag-aaral**: 7-hakbang na guided exercises (3.5 oras kabuuan)
- **Discovery → Deployment → Customization**: Progressive na metodolohiya
- **Interactive DevContainer Environment**: Pre-configured na mga tool at dependencies

#### 📚 Istraktura ng Workshop
Ang workshop ay sumusunod sa metodolohiyang **Discovery → Deployment → Customization**:

1. **Discovery Phase** (45 minuto)
   - Tuklasin ang Microsoft Foundry templates at mga serbisyo
   - Unawain ang mga pattern ng multi-agent architecture
   - Suriin ang mga kinakailangan at prerequisites sa deployment

2. **Deployment Phase** (2 oras)
   - Hands-on na deployment ng AI applications gamit ang AZD
   - I-configure ang Azure AI services at mga endpoints
   - Ipatupad ang mga pattern ng seguridad at authentication

3. **Customization Phase** (45 minuto)
   - Baguhin ang mga aplikasyon para sa mga partikular na use case
   - I-optimize para sa production deployment
   - Ipatupad ang monitoring at pamamahala ng gastos

#### 🚀 Pagsisimula sa Workshop
```bash
# Opsyon 1: GitHub Codespaces (Inirerekomenda)
# I-click ang "Code" → "Create codespace on main" sa repositoryo

# Opsyon 2: Lokal na Pag-unlad
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga tagubilin sa pag-setup sa workshop/README.md
```

#### 🎯 Mga Kinalabasan ng Pag-aaral sa Workshop
Sa pagtatapos ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Production AI Applications**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Maging Master sa Multi-Agent Architectures**: Ipatupad ang coordinated AI agent solutions
- **Ipatupad ang Pinakamahusay na Praktis sa Seguridad**: I-configure ang authentication at access control
- **I-optimize para sa Sukat**: Magdisenyo ng cost-effective at performant na mga deployment
- **Mag-troubleshoot ng Mga Deployment**: Lutasin ang mga karaniwang isyu nang mag-isa

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based na learning environment
- **📋 Hakbang-hakbang na Mga Tagubilin**: [Guided Exercises](../../workshop/docs/instructions) - Detalyadong walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Mga ehersisyong nakatuon sa AI
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Pag-configure ng environment

**Perpekto para sa**: Corporate training, mga kurso sa unibersidad, self-paced na pag-aaral, at developer bootcamps.

---

## 📖 Ano ang Azure Developer CLI?

Ang Azure Developer CLI (azd) ay isang developer-centric na command-line interface na nagpapabilis ng proseso ng pagbuo at pag-deploy ng mga aplikasyon sa Azure. Nagbibigay ito ng:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa mga karaniwang pattern ng aplikasyon
- **Infrastructure as Code** - Pamahalaan ang mga Azure resources gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na pag-provision, deployment, at monitoring ng mga aplikasyon
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa AI Deployments**

**Bakit AZD para sa AI Solutions?** Tinatalakay ng AZD ang mga pangunahing hamon na kinahaharap ng mga AI developer:

- **AI-Ready Templates** - Pre-configured na mga template para sa Azure OpenAI, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Built-in na mga pattern ng seguridad para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Pinakamahusay na praktis para sa scalable at cost-effective na AI application deployments
- **End-to-End AI Workflows** - Mula sa pag-develop ng modelo hanggang sa production deployment na may tamang monitoring
- **Cost Optimization** - Matalinong alokasyon ng resources at mga estratehiya sa scaling para sa AI workloads
- **Microsoft Foundry Integration** - Seamless na koneksyon sa Microsoft Foundry model catalog at mga endpoints

---

## 🎯 Templates & Examples Library

### Tampok: Microsoft Foundry Templates
**Magsimula dito kung magde-deploy ka ng AI applications!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang AI pattern. Ang ilan ay external Azure Samples, ang iba ay lokal na implementasyon.

| Template | Kabanata | Kumplikado | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Scenario sa Pag-aaral
**Production-ready na mga template ng aplikasyon na naka-map sa mga kabanata ng pag-aaral**

| Template | Kabanata ng Pag-aaral | Kumplikado | Pangunahing Natutunan |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng AI deployment |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | RAG implementation gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture gamit ang Customer at Inventory agents |

### Pag-aaral Ayon sa Uri ng Halimbawa

> **📌 Lokal vs. External na Mga Halimbawa:**  
> **Lokal na Mga Halimbawa** (sa repo na ito) = Agad magagamit  
> **External na Mga Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repositoryo

#### Lokal na Mga Halimbawa (Agad Magagamit)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong production-ready na implementasyon gamit ang ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Komprehensibong monitoring at pagsusuri
  - Isang-click na deployment gamit ang ARM template

#### Lokal na Mga Halimbawa - Container Applications (Kabanata 2-5)
**Komprehensibong mga halimbawa ng container deployment sa repositoryong ito:**
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Pangunahing REST API na may scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Quick Start, Production, at Advanced na mga pattern ng deployment
  - Gabay sa monitoring, seguridad, at pag-optimize ng gastos

#### External na Mga Halimbawa - Simpleng Aplikasyon (Kabanata 1-2)
**I-clone ang mga Azure Samples na repositoryo na ito para makapagsimula:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga pangunahing pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment ng static content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Deployment ng REST API

#### External na Mga Halimbawa - Integrasyon ng Database (Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng konektibidad sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na data workflow

#### External na Mga Halimbawa - Advanced na Mga Pattern (Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Mga multi-service na arkitektura
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready na mga pattern ng ML

### Koleksyon ng External na Template
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng opisyal at community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng Microsoft Learn para sa mga template
- [**Examples Directory**](examples/README.md) - Lokal na mga halimbawa sa pag-aaral na may detalyadong paliwanag

---

## 📚 Mga Mapagkukunan sa Pag-aaral at Mga Sanggunian

### Mabilisang Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang utos ng azd na inayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga pagsasanay

### Hands-On Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga solusyon sa AI (2-3 oras)
- [**Interactive Workshop Guide**](workshop/README.md) - Workshop na batay sa browser gamit ang MkDocs at DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-hakbang na gabay na mga pagsasanay (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Kumpletong materyales para sa hands-on workshop na may integrasyon ng GitHub Codespaces

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Quick Troubleshooting Guide

**Mga karaniwang isyu na nararanasan ng mga nagsisimula at agarang mga solusyon:**

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
# Ilista ang mga magagamit na subscription
az account list --output table

# Itakda ang default na subscription
az account set --subscription "<subscription-id-or-name>"

# Itakda para sa kapaligiran ng AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Suriin
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

# Opsyon 3: Suriin ang detalyadong mga log
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Muling patunayan ang pagkakakilanlan
az logout
az login

azd auth logout
azd auth login

# Suriin ang pagpapatunay
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# Gumagawa ang AZD ng mga natatanging pangalan, ngunit kung may salungatan:
azd down --force --purge

# Subukang muli gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Karaniwang oras ng paghihintay:**
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

### ❌ "Permission denied" or "Forbidden"

```bash
# Suriin ang iyong Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa "Contributor" na role
# Hilingin sa iyong Azure admin na magbigay:
# - Contributor (para sa mga resources)
# - User Access Administrator (para sa mga role assignments)
```

### ❌ Can't find deployed application URL

```bash
# Ipakita ang lahat ng mga endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga variable na *_URL
```

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Quick Troubleshooting Guide

**Mga karaniwang isyu na nararanasan ng mga nagsisimula at agarang mga solusyon:**

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

# O gumamit ng mas maliit na SKUs sa development
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

# Suriin ang pagpapatunay
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# Gumagawa ang AZD ng mga natatanging pangalan, ngunit kung may salungatan:
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

# Kailangan mo ng hindi bababa sa "Contributor" na role
# Hilingin sa iyong Azure admin na magbigay ng:
# - Contributor (para sa mga resources)
# - User Access Administrator (para sa mga role assignments)
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
# Hanapin ang mga variable na *_URL
```
</details>

### 📚 Full Troubleshooting Resources

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Course Completion & Certification

### Progress Tracking
Subaybayan ang iyong pag-unlad sa pag-aaral sa bawat kabanata:

- [ ] **Chapter 1**: Foundation & Quick Start ✅
- [ ] **Chapter 2**: AI-First Development ✅  
- [ ] **Chapter 3**: Configuration & Authentication ✅
- [ ] **Chapter 4**: Infrastructure as Code & Deployment ✅
- [ ] **Chapter 5**: Multi-Agent AI Solutions ✅
- [ ] **Chapter 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Chapter 7**: Troubleshooting & Debugging ✅
- [ ] **Chapter 8**: Production & Enterprise Patterns ✅

### Learning Verification
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Practical Exercise**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Knowledge Check**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Community Discussion**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Next Chapter**: Lumipat sa susunod na antas ng kahirapan

### Course Completion Benefits
Pagkatapos makumpleto ang lahat ng kabanata, magkakaroon ka ng:
- **Production Experience**: Na-deploy na totoong mga aplikasyon ng AI sa Azure
- **Professional Skills**: Kakayahan sa enterprise-ready deployment  
- **Community Recognition**: Aktibong miyembro ng Azure developer community
- **Career Advancement**: In-demand na kasanayan sa AZD at AI deployment

---

## 🤝 Community & Support

### Get Help & Support
- **Technical Issues**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Learning Questions**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specific Help**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentation**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Insights from Microsoft Foundry Discord

**Mga Kamakailang Resulta ng Poll mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gamitin ang AZD para sa mga AI workload
- **Pangunahing mga hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakakailangan**: AI-specific templates, troubleshooting guides, best practices

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Ma-access ang mga maagang preview ng mga bagong AI template
- Mag-ambag sa mga best practice sa AI deployment
- Makaimpluwensya sa hinaharap na pag-develop ng AI + AZD na mga tampok

### Contributing to the Course
Malugod naming tinatanggap ang mga kontribusyon! Mangyaring basahin ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Content Improvements**: Pagbutihin ang mga umiiral na kabanata at mga halimbawa
- **New Examples**: Magdagdag ng mga totoong senaryo at mga template  
- **Translation**: Tumulong sa pagpapanatili ng suporta sa maraming wika
- **Bug Reports**: Pagbutihin ang katumpakan at kalinawan
- **Community Standards**: Sundin ang aming inklusibong mga patakaran sa komunidad

---

## 📄 Course Information

### License
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Related Microsoft Learning Resources

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pag-aaral:

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
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Pag-navigate sa Kurso

**🚀 Handa Ka Na Bang Magsimulang Matuto?**

**Mga Baguhan**: Magsimula sa [Kabanata 1: Pundasyon at Mabilis na Pagsisimula](../..)  
**Mga AI Developer**: Tumalon sa [Kabanata 2: AI-First Development](../..)  
**Mga May Karanasang Developer**: Simulan sa [Kabanata 3: Konfigurasyon at Pagpapatunay](../..)

**Mga Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paalala**:
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat nagsusumikap kami para sa katumpakan, pakatandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->