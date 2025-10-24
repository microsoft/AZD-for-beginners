<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a47510110edbcc33ad1ab7e8d234f7c3",
  "translation_date": "2025-10-24T09:37:54+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa Mga Baguhan: Isang Nakaayos na Paglalakbay sa Pag-aaral

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tl.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Pagsisimula sa Kursong Ito

Sundin ang mga hakbang na ito upang simulan ang iyong paglalakbay sa pag-aaral ng AZD:

1. **I-fork ang Repository**: I-click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ang Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Sumali sa Komunidad**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) para sa suporta mula sa mga eksperto
4. **Piliin ang Iyong Landas sa Pag-aaral**: Pumili ng kabanata sa ibaba na naaayon sa iyong antas ng karanasan

### Suporta sa Iba't Ibang Wika

#### Awtomatikong Pagsasalin (Palaging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pangkalahatang-ideya ng Kurso

Pag-aralan ang Azure Developer CLI (azd) sa pamamagitan ng mga nakaayos na kabanata na idinisenyo para sa progresibong pag-aaral. **Espesyal na pokus sa pag-deploy ng AI application gamit ang Azure AI Foundry integration.**

### Bakit Mahalaga ang Kursong Ito para sa Makabagong Mga Developer

Batay sa mga insight mula sa Azure AI Foundry Discord community, **45% ng mga developer ang nais gumamit ng AZD para sa AI workloads** ngunit nahihirapan sa:
- Kumplikadong multi-service AI architectures
- Mga pinakamahusay na kasanayan sa pag-deploy ng AI sa produksyon  
- Integrasyon at konfigurasyon ng Azure AI services
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga isyu sa pag-deploy na partikular sa AI

### Mga Layunin sa Pag-aaral

Sa pagtatapos ng kursong ito, ikaw ay:
- **Mag-master ng AZD Fundamentals**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gumamit ng AZD kasama ang mga serbisyo ng Azure AI Foundry
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at mag-debug ng mga problema
- **Mag-optimize para sa Produksyon**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Magbuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 📚 Mga Kabanata sa Pag-aaral

*Piliin ang iyong landas sa pag-aaral batay sa antas ng karanasan at layunin*

### 🚀 Kabanata 1: Foundation & Quick Start
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kompleksidad**: ⭐

#### Ano ang Iyong Matututunan
- Pag-unawa sa mga pangunahing kaalaman ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na pag-deploy

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Ano ang Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Mga gabay na partikular sa platform
- **🛠️ Hands-On**: [Ang Iyong Unang Proyekto](docs/getting-started/first-project.md) - Step-by-step na tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resulta ng Kabanata**: Matagumpay na ma-deploy ang isang simpleng web application sa Azure gamit ang AZD

---

### 🤖 Kabanata 2: AI-First Development (Inirerekomenda para sa AI Developers)
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Iyong Matututunan
- Integrasyon ng Azure AI Foundry sa AZD
- Pag-deploy ng mga AI-powered applications
- Pag-unawa sa mga konfigurasyon ng AI services

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Integrasyon ng Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - Pag-deploy at pamamahala ng AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Gawing AZD-ready ang iyong AI solutions
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Pag-aaral sa browser gamit ang MkDocs * DevContainer Environment
- **📋 Templates**: [Azure AI Foundry Templates](../..)

#### Mga Praktikal na Ehersisyo
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resulta ng Kabanata**: Ma-deploy at ma-configure ang isang AI-powered chat application na may RAG capabilities

---

### ⚙️ Kabanata 3: Configuration & Authentication
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kompleksidad**: ⭐⭐

#### Ano ang Iyong Matututunan
- Konfigurasyon at pamamahala ng environment
- Mga pinakamahusay na kasanayan sa authentication at seguridad
- Pagpapangalan at organisasyon ng resources

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Konfigurasyon**: [Configuration Guide](docs/getting-started/configuration.md) - Setup ng environment
- **🔐 Seguridad**: Mga pattern ng authentication at managed identity
- **📝 Mga Halimbawa**: [Database App Example](../../examples/database-app) - Mga pattern ng konfigurasyon

#### Mga Praktikal na Ehersisyo
- Mag-configure ng maraming environment (dev, staging, prod)
- Mag-set up ng managed identity authentication
- Magpatupad ng mga konfigurasyon na partikular sa environment

**💡 Resulta ng Kabanata**: Pamahalaan ang maraming environment na may tamang authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code & Deployment
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kompleksidad**: ⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga advanced na pattern ng pag-deploy
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa resource provisioning

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Pamamahala ng Azure resources
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized deployments

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na Bicep templates
- Mag-deploy ng multi-service applications
- Magpatupad ng blue-green deployment strategies

**💡 Resulta ng Kabanata**: Ma-deploy ang kumplikadong multi-service applications gamit ang custom infrastructure templates

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kompleksidad**: ⭐⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga pattern ng multi-agent architecture
- Orkestrasyon at koordinasyon ng mga agent
- Mga AI deployments na handa para sa produksyon

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektura**: Mga pattern ng koordinasyon ng multi-agent

#### Mga Praktikal na Ehersisyo
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resulta ng Kabanata**: Ma-deploy at mapamahalaan ang isang production-ready multi-agent AI solution na may Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation & Planning
**Mga Kinakailangan**: Natapos ang Kabanata 4  
**Tagal**: 1 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Iyong Matututunan
- Pagpaplano ng kapasidad at pag-validate ng resources
- Mga estratehiya sa pagpili ng SKU
- Mga pre-flight checks at automation

#### Mga Mapagkukunan sa Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Pag-validate ng resources
- **💰 Pagpili**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- **✅ Validation**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Mga automated scripts

#### Mga Praktikal na Ehersisyo
- Magpatakbo ng capacity validation scripts
- Mag-optimize ng SKU selections para sa gastos
- Magpatupad ng automated pre-deployment checks

**💡 Resulta ng Kabanata**: Ma-validate at ma-optimize ang deployments bago ito isagawa

---

### 🚨 Kabanata 7: Troubleshooting & Debugging
**Mga Kinakailangan**: Anumang deployment chapter na natapos  
**Tagal**: 1-1.5 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Iyong Matututunan
- Sistematikong mga pamamaraan ng pag-debug
- Mga karaniwang isyu at solusyon
- Pag-troubleshoot na partikular sa AI

#### Mga Mapagkukunan sa Pag-aaral
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Pag-debug**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step na mga estratehiya
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa AI services

#### Mga Praktikal na Ehersisyo
- Mag-diagnose ng mga pagkabigo sa pag-deploy
- Lutasin ang mga isyu sa authentication
- Mag-debug ng connectivity ng AI services

**💡 Resulta ng Kabanata**: Independiyenteng ma-diagnose at malutas ang mga karaniwang isyu sa pag-deploy

---

### 🏢 Kabanata 8: Mga Pattern para sa Produksyon at Enterprise
**Mga Kinakailangan**: Natapos ang Mga Kabanata 1-4  
**Tagal**: 2-3 oras  

**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga estratehiya sa pag-deploy ng produksyon
- Mga pattern ng seguridad para sa enterprise
- Pagsubaybay at pag-optimize ng gastos

#### Mga Mapagkukunan ng Pag-aaral
- **🏭 Produksyon**: [Mga Pinakamahusay na Praktis sa Production AI](docs/ai-foundry/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Halimbawa ng Microservices](../../examples/microservices) - Mga kumplikadong arkitektura
- **📊 Pagsubaybay**: Integrasyon ng Application Insights

#### Mga Praktikal na Ehersisyo
- Magpatupad ng mga pattern ng seguridad para sa enterprise
- Mag-set up ng komprehensibong pagsubaybay
- Mag-deploy sa produksyon na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga application na handa para sa enterprise na may kumpletong kakayahan sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Karanasang Hands-On na Pag-aaral

### Mga Interaktibong Materyales ng Workshop
**Komprehensibong hands-on na pag-aaral gamit ang mga tool sa browser at mga gabay na ehersisyo**

Ang aming mga materyales sa workshop ay nagbibigay ng istrukturadong, interaktibong karanasan sa pag-aaral na umaakma sa kurikulum na nakabatay sa kabanata sa itaas. Ang workshop ay idinisenyo para sa parehong self-paced na pag-aaral at mga sesyon na pinangungunahan ng tagapagturo.

#### 🛠️ Mga Tampok ng Workshop
- **Interface na Batay sa Browser**: Kumpletong workshop na pinapagana ng MkDocs na may mga tampok tulad ng paghahanap, kopya, at tema
- **Integrasyon ng GitHub Codespaces**: Isang click na setup ng development environment
- **Istrakturang Landas ng Pag-aaral**: 7 hakbang na gabay na mga ehersisyo (kabuuang 3.5 oras)
- **Pagdiskubre → Pag-deploy → Pag-customize**: Progresibong metodolohiya
- **Interaktibong DevContainer Environment**: Pre-configured na mga tool at dependencies

#### 📚 Istraktura ng Workshop
Ang workshop ay sumusunod sa metodolohiyang **Pagdiskubre → Pag-deploy → Pag-customize**:

1. **Yugto ng Pagdiskubre** (45 minuto)
   - Tuklasin ang mga template at serbisyo ng Azure AI Foundry
   - Unawain ang mga pattern ng multi-agent architecture
   - Suriin ang mga kinakailangan at paunang kondisyon ng pag-deploy

2. **Yugto ng Pag-deploy** (2 oras)
   - Hands-on na pag-deploy ng mga AI application gamit ang AZD
   - I-configure ang mga serbisyo at endpoint ng Azure AI
   - Magpatupad ng mga pattern ng seguridad at pagpapatunay

3. **Yugto ng Pag-customize** (45 minuto)
   - Baguhin ang mga application para sa mga partikular na gamit
   - I-optimize para sa pag-deploy sa produksyon
   - Magpatupad ng pagsubaybay at pamamahala ng gastos

#### 🚀 Pagsisimula sa Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Mga Kinalabasan ng Pag-aaral sa Workshop
Sa pagtatapos ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Production AI Applications**: Gamitin ang AZD kasama ang mga serbisyo ng Azure AI Foundry
- **Master Multi-Agent Architectures**: Magpatupad ng mga coordinated na solusyon ng AI agent
- **Magpatupad ng Mga Pinakamahusay na Praktis sa Seguridad**: I-configure ang pagpapatunay at kontrol sa pag-access
- **I-optimize para sa Scale**: Magdisenyo ng cost-effective at mahusay na mga deployment
- **Mag-troubleshoot ng Mga Deployment**: Malutas ang mga karaniwang isyu nang mag-isa

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Mga Materyales ng Workshop](workshop/README.md) - Kapaligiran sa pag-aaral na batay sa browser
- **📋 Mga Gabay na Hakbang-Hakbang**: [Mga Gabay na Ehersisyo](../../workshop/docs/instructions) - Detalyadong walkthrough
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Mga ehersisyo na nakatuon sa AI
- **💡 Quick Start**: [Gabay sa Setup ng Workshop](workshop/README.md#quick-start) - Configuration ng kapaligiran

**Perpekto para sa**: Pagsasanay sa korporasyon, mga kurso sa unibersidad, self-paced na pag-aaral, at mga bootcamp para sa developer.

---

## 📖 Ano ang Azure Developer CLI?

Ang Azure Developer CLI (azd) ay isang command-line interface na nakatuon sa developer na nagpapabilis sa proseso ng pagbuo at pag-deploy ng mga application sa Azure. Nagbibigay ito ng:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa mga karaniwang pattern ng application
- **Infrastructure as Code** - Pamahalaan ang mga resource ng Azure gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na pag-provision, pag-deploy, at pagsubaybay sa mga application
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng developer

### **AZD + Azure AI Foundry: Perpekto para sa AI Deployments**

**Bakit AZD para sa mga Solusyon ng AI?** Tinutugunan ng AZD ang mga pangunahing hamon na kinakaharap ng mga AI developer:

- **AI-Ready Templates** - Mga pre-configured na template para sa Azure OpenAI, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Mga built-in na pattern ng seguridad para sa mga serbisyo ng AI, API keys, at mga endpoint ng modelo  
- **Production AI Patterns** - Mga pinakamahusay na praktis para sa scalable, cost-effective na pag-deploy ng AI application
- **End-to-End AI Workflows** - Mula sa pagbuo ng modelo hanggang sa pag-deploy sa produksyon na may tamang pagsubaybay
- **Cost Optimization** - Mga estratehiya sa matalinong paglalaan ng resource at pag-scale para sa AI workloads
- **Azure AI Foundry Integration** - Seamless na koneksyon sa AI Foundry model catalog at mga endpoint

---

## 🎯 Templates & Examples Library

### Itinatampok: Mga Template ng Azure AI Foundry
**Simulan dito kung magde-deploy ka ng mga AI application!**

| Template | Kabanata | Kumplikado | Mga Serbisyo |
|----------|---------|------------|----------|
| [**Simulan ang AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Simulan ang AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Automation ng multi-agent workflow**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Gumawa ng mga dokumento mula sa iyong data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Pagbutihin ang mga client meeting gamit ang agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernize ang iyong code gamit ang agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Bumuo ng iyong conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**I-unlock ang insights mula sa conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Itinatampok: Kumpletong Mga Senaryo ng Pag-aaral
**Mga template ng application na handa para sa produksyon na naka-map sa mga kabanata ng pag-aaral**

| Template | Kabanata ng Pag-aaral | Kumplikado | Pangunahing Pag-aaral |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng AI deployment |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Implementasyon ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Framework ng agent at pagtawag ng function |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Orkestrasyon ng AI para sa enterprise |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Arkitektura ng multi-agent na may Customer at Inventory agents |

### Pag-aaral sa Pamamagitan ng Uri ng Halimbawa

#### Simpleng Mga Application (Kabanata 1-2)
- [Simpleng Web App](../../examples/simple-web-app) - Mga pangunahing pattern ng deployment
- [Static Website](../../examples/static-site) - Deployment ng static na nilalaman
- [Basic API](../../examples/basic-api) - Deployment ng REST API

#### Integrasyon ng Database (Kabanata 3-4)  
- [Database App](../../examples/database-app) - Mga pattern ng koneksyon sa database
- [Data Processing](../../examples/data-processing) - Deployment ng ETL workflow

#### Mga Advanced na Pattern (Kabanata 4-8)
- [Container Apps](../../examples/container-app) - Mga containerized na deployment
- [Microservices](../../examples/microservices) - Mga arkitektura ng multi-service  
- [Enterprise Solutions](../../examples/enterprise) - Mga pattern na handa para sa produksyon

### Mga Panlabas na Koleksyon ng Template
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated na koleksyon ng opisyal at community templates
- [**Mga Template ng Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng Microsoft Learn template
- [**Direktoryo ng Mga Halimbawa**](examples/README.md) - Lokal na mga halimbawa ng pag-aaral na may detalyadong paliwanag

---

## 📚 Mga Mapagkukunan ng Pag-aaral at Sanggunian

### Mabilisang Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang azd commands na inayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na inayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga ehersisyo sa pagsasanay

### Mga Hands-On Workshop
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga solusyon sa AI (2-3 oras)
- [**Interaktibong Gabay sa Workshop**](workshop/README.md) - Workshop na batay sa browser gamit ang MkDocs at DevContainer Environment
- [**Istrakturang Landas ng Pag-aaral**](../../workshop/docs/instructions) - 7 hakbang na gabay na ehersisyo (Pagdiskubre → Pag-deploy → Pag-customize)
- [**Workshop para sa mga Baguhan sa AZD**](workshop/README.md) - Kumpletong materyales ng hands-on workshop na may integrasyon ng GitHub Codespaces

### Panlabas na Mga Mapagkukunan ng Pag-aaral
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Pagtatapos ng Kurso at Sertipikasyon

### Pagsubaybay sa Pag-unlad
Subaybayan ang iyong progreso sa pag-aaral sa bawat kabanata:

- [ ] **Kabanata 1**: Foundation & Quick Start ✅
- [ ] **Kabanata 2**: AI-First Development ✅  
- [ ] **Kabanata 3**: Configuration & Authentication ✅
- [ ] **Kabanata 4**: Infrastructure as Code & Deployment ✅
- [ ] **Kabanata 5**: Multi-Agent AI Solutions ✅
- [ ] **Kabanata 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Kabanata 7**: Troubleshooting & Debugging ✅
- [ ] **Kabanata 8**: Production & Enterprise Patterns ✅

### Pagpapatunay ng Pag-aaral
Pagkatapos ng bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Ehersisyo**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Knowledge Check**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kumplikado

### Mga Benepisyo ng Pagtatapos ng Kurso
Sa pagtatapos ng lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Produksyon**: Na-deploy ang mga tunay na AI application sa Azure
- **Mga Propesyonal na Kasanayan**: Mga kakayahan sa pag-deploy na handa para sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng komunidad ng developer ng Azure
- **Pag-unlad sa Karera**: In-demand na AZD at AI deployment expertise

---

## 🤝 Komunidad at Suporta

### Kumuha ng Tulong at Suporta
- **Mga Isyung Teknikal**: [Mag-ulat ng mga bug at humiling ng mga tampok](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **Tulong na Nakatuon sa AI**: Sumali sa [#Azure channel](https://discord.gg/microsoft-azure) para sa mga talakayan sa AZD + AI Foundry
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Insight ng Komunidad mula sa Azure AI Foundry Discord

**Mga Resulta ng Kamakailang Poll mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gumamit ng AZD para sa AI workloads
- **Mga Pangunahing Hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakamaraming Hiniling**: Mga template na nakatuon sa AI, mga gabay sa troubleshooting, pinakamahusay na praktis

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at kumuha ng tulong
- Magkaroon ng access sa mga maagang preview ng mga bagong template ng AI
- Mag-ambag sa mga pinakamahusay na praktis sa pag-deploy ng AI
- Makaimpluwensya sa hinaharap na pag-unlad ng mga tampok ng AI + AZD

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang mga kontribusyon! Mangyaring basahin ang aming [Gabay sa Pag-aambag](CONTRIBUTING.md) para sa mga detalye sa:
- **Pagpapahusay ng Nilalaman**: Pagbutihin ang mga umiiral na kabanata at halimbawa
- **Mga Bagong Halimbawa**: Magdagdag ng mga totoong sitwasyon at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng suporta sa maraming wika  
- **Mga Ulat ng Bug**: Pagbutihin ang katumpakan at kalinawan  
- **Mga Pamantayan ng Komunidad**: Sundin ang aming inklusibong mga alituntunin ng komunidad  

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Mga Kaugnay na Microsoft Learning Resources

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pag-aaral:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### Azure / Edge / MCP / Agents
[![AZD para sa mga Baguhan](https://img.shields.io/badge/AZD%20para%20sa%20mga%20Baguhan-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para sa mga Baguhan](https://img.shields.io/badge/Edge%20AI%20para%20sa%20mga%20Baguhan-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para sa mga Baguhan](https://img.shields.io/badge/MCP%20para%20sa%20mga%20Baguhan-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents para sa mga Baguhan](https://img.shields.io/badge/AI%20Agents%20para%20sa%20mga%20Baguhan-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI para sa mga Baguhan](https://img.shields.io/badge/Generative%20AI%20para%20sa%20mga%20Baguhan-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML para sa mga Baguhan](https://img.shields.io/badge/ML%20para%20sa%20mga%20Baguhan-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science para sa mga Baguhan](https://img.shields.io/badge/Data%20Science%20para%20sa%20mga%20Baguhan-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa mga Baguhan](https://img.shields.io/badge/AI%20para%20sa%20mga%20Baguhan-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity para sa mga Baguhan](https://img.shields.io/badge/Cybersecurity%20para%20sa%20mga%20Baguhan-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa mga Baguhan](https://img.shields.io/badge/Web%20Dev%20para%20sa%20mga%20Baguhan-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa mga Baguhan](https://img.shields.io/badge/IoT%20para%20sa%20mga%20Baguhan-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development para sa mga Baguhan](https://img.shields.io/badge/XR%20Development%20para%20sa%20mga%20Baguhan-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot para sa AI Paired Programming](https://img.shields.io/badge/Copilot%20para%20sa%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20para%20sa%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Pag-navigate sa Kurso

**🚀 Handa nang Mag-aral?**

**Mga Baguhan**: Magsimula sa [Kabanata 1: Pundasyon at Mabilisang Simula](../..)  
**AI Developers**: Tumalon sa [Kabanata 2: AI-First Development](../..)  
**Mga May Karanasang Developer**: Magsimula sa [Kabanata 3: Configuration at Authentication](../..)

**Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Bagamat sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na mapagkakatiwalaang pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.