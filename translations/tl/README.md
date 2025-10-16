<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be5fd7bf2b02d878efdb442580d98d96",
  "translation_date": "2025-10-16T16:01:36+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa Mga Baguhan: Isang Nakabalangkas na Paglalakbay sa Pag-aaral

![AZD-para-sa-mga-baguhan](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tl.png) 

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

### Suporta sa Maraming Wika

#### Awtomatikong Pagsasalin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pangkalahatang-ideya ng Kurso

Matutunan ang Azure Developer CLI (azd) sa pamamagitan ng mga nakabalangkas na kabanata na idinisenyo para sa progresibong pag-aaral. **May espesyal na pokus sa pag-deploy ng AI application gamit ang Azure AI Foundry integration.**

### Bakit Mahalaga ang Kursong Ito para sa Modernong mga Developer

Batay sa mga insight mula sa Azure AI Foundry Discord community, **45% ng mga developer ang nais gumamit ng AZD para sa AI workloads** ngunit nahihirapan sa:
- Kumplikadong multi-service AI architectures
- Mga pinakamahusay na kasanayan sa pag-deploy ng AI sa produksyon  
- Integrasyon at konfigurasyon ng Azure AI services
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga isyu sa pag-deploy na partikular sa AI

### Mga Layunin sa Pag-aaral

Sa pagtatapos ng kursong ito, ikaw ay:
- **Magiging bihasa sa AZD Fundamentals**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gumamit ng AZD kasama ang Azure AI Foundry services
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at mag-debug ng mga problema
- **Mag-optimize para sa Produksyon**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Magbuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 📚 Mga Kabanata sa Pag-aaral

*Piliin ang iyong landas sa pag-aaral batay sa antas ng karanasan at layunin*

### 🚀 Kabanata 1: Pundasyon at Mabilisang Pagsisimula
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kahirapan**: ⭐

#### Ano ang Iyong Matututunan
- Pag-unawa sa mga pundasyon ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na pag-deploy

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Ano ang Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Pag-install at Setup](docs/getting-started/installation.md) - Mga gabay batay sa platform
- **🛠️ Hands-On**: [Ang Iyong Unang Proyekto](docs/getting-started/first-project.md) - Step-by-step na tutorial
- **📋 Mabilisang Sanggunian**: [Command Cheat Sheet](resources/cheat-sheet.md)

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
**Kahirapan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Integrasyon ng Azure AI Foundry gamit ang AZD
- Pag-deploy ng mga AI-powered applications
- Pag-unawa sa mga konfigurasyon ng AI services

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Integrasyon ng Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - Pag-deploy at pamamahala ng AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Gawing AZD-ready ang iyong AI solutions
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Pag-aaral sa browser gamit ang MkDocs * DevContainer Environment
- **📋 Templates**: [Mga Template ng Azure AI Foundry](../..)

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

### ⚙️ Kabanata 3: Konfigurasyon at Authentication
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kahirapan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Pamamahala ng konfigurasyon ng environment
- Mga pinakamahusay na kasanayan sa authentication at seguridad
- Pagpapangalan at organisasyon ng resources

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Konfigurasyon**: [Configuration Guide](docs/getting-started/configuration.md) - Setup ng environment
- **🔐 Seguridad**: Mga pattern ng authentication at managed identity
- **📝 Mga Halimbawa**: [Halimbawa ng Database App](../../examples/database-app) - Mga pattern ng konfigurasyon

#### Mga Praktikal na Ehersisyo
- Mag-configure ng maraming environment (dev, staging, prod)
- Mag-set up ng managed identity authentication
- Magpatupad ng mga konfigurasyon na partikular sa environment

**💡 Resulta ng Kabanata**: Pamahalaan ang maraming environment na may tamang authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
**Mga Kinakailangan**: Natapos ang Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kahirapan**: ⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga advanced na pattern ng deployment
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa resource provisioning

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Pamamahala ng Azure resources
- **📝 Mga Halimbawa**: [Halimbawa ng Container App](../../examples/container-app) - Mga containerized deployments

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na Bicep templates
- Mag-deploy ng multi-service applications
- Magpatupad ng blue-green deployment strategies

**💡 Resulta ng Kabanata**: Ma-deploy ang kumplikadong multi-service applications gamit ang custom infrastructure templates

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Natapos ang Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kahirapan**: ⭐⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga pattern ng multi-agent architecture
- Orkestrasyon at koordinasyon ng mga agent
- Mga AI deployments na handa para sa produksyon

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Itinatampok na Proyekto**: [Solusyon sa Multi-Agent para sa Retail](examples/retail-scenario.md) - Kumpletong implementasyon
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

**💡 Resulta ng Kabanata**: Ma-deploy at mapamahalaan ang isang produksyon-ready na multi-agent AI solution na may Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation at Planning
**Mga Kinakailangan**: Natapos ang Kabanata 4  
**Tagal**: 1 oras  
**Kahirapan**: ⭐⭐

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

### 🚨 Kabanata 7: Troubleshooting at Debugging
**Mga Kinakailangan**: Anumang deployment chapter na natapos  
**Tagal**: 1-1.5 oras  
**Kahirapan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Sistematikong mga pamamaraan sa debugging
- Mga karaniwang isyu at solusyon
- Troubleshooting na partikular sa AI

#### Mga Mapagkukunan sa Pag-aaral
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step na mga estratehiya
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa AI services

#### Mga Praktikal na Ehersisyo
- Mag-diagnose ng mga pagkabigo sa deployment
- Lutasin ang mga isyu sa authentication
- Mag-debug ng connectivity ng AI services

**💡 Resulta ng Kabanata**: Independiyenteng ma-diagnose at malutas ang mga karaniwang isyu sa deployment

---

### 🏢 Kabanata 8: Mga Pattern para sa Produksyon at Enterprise
**Mga Kinakailangan**: Natapos ang Kabanata 1-4  
**Tagal**: 2-3 oras  

**Kompleksidad**: ⭐⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga estratehiya sa pag-deploy sa produksyon
- Mga pattern sa seguridad para sa enterprise
- Pagsubaybay at pag-optimize ng gastos

#### Mga Mapagkukunan ng Pag-aaral
- **🏭 Produksyon**: [Mga Pinakamahusay na Praktis sa Production AI](docs/ai-foundry/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Halimbawa ng Microservices](../../examples/microservices) - Mga komplikadong arkitektura
- **📊 Pagsubaybay**: Pagsasama ng Application Insights

#### Mga Praktikal na Ehersisyo
- Ipatupad ang mga pattern sa seguridad para sa enterprise
- Mag-set up ng komprehensibong pagsubaybay
- Mag-deploy sa produksyon nang may tamang pamamahala

**💡 Resulta ng Kabanata**: Mag-deploy ng mga application na handa para sa enterprise na may kumpletong kakayahan sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Karanasang Hands-On

### Mga Interaktibong Materyales ng Workshop
**Komprehensibong hands-on na pag-aaral gamit ang mga tool sa browser at mga gabay na ehersisyo**

Ang aming mga materyales sa workshop ay nagbibigay ng istrukturadong, interaktibong karanasan sa pag-aaral na umaakma sa kurikulum na nakabatay sa kabanata sa itaas. Ang workshop ay idinisenyo para sa parehong self-paced na pag-aaral at mga sesyon na pinangungunahan ng instruktor.

#### 🛠️ Mga Tampok ng Workshop
- **Interface na Batay sa Browser**: Kumpletong workshop na pinapagana ng MkDocs na may search, copy, at mga tampok sa tema
- **Pagsasama ng GitHub Codespaces**: Isang-click na pag-set up ng development environment
- **Istrukturang Landas ng Pag-aaral**: 7 hakbang na gabay na ehersisyo (kabuuang 3.5 oras)
- **Pagdiskubre → Pag-deploy → Pag-customize**: Progresibong metodolohiya
- **Interaktibong DevContainer Environment**: Pre-configured na mga tool at dependencies

#### 📚 Istruktura ng Workshop
Ang workshop ay sumusunod sa metodolohiyang **Pagdiskubre → Pag-deploy → Pag-customize**:

1. **Yugto ng Pagdiskubre** (45 minuto)
   - Tuklasin ang mga template at serbisyo ng Azure AI Foundry
   - Unawain ang mga pattern ng multi-agent architecture
   - Suriin ang mga kinakailangan at paunang kondisyon para sa pag-deploy

2. **Yugto ng Pag-deploy** (2 oras)
   - Hands-on na pag-deploy ng mga AI application gamit ang AZD
   - I-configure ang mga serbisyo at endpoint ng Azure AI
   - Ipatupad ang mga pattern sa seguridad at authentication

3. **Yugto ng Pag-customize** (45 minuto)
   - Baguhin ang mga application para sa partikular na mga use case
   - I-optimize para sa pag-deploy sa produksyon
   - Ipatupad ang pagsubaybay at pamamahala ng gastos

#### 🚀 Pagsisimula sa Workshop
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Mga Resulta ng Pag-aaral sa Workshop
Sa pagtatapos ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Production AI Applications**: Gamitin ang AZD kasama ang mga serbisyo ng Azure AI Foundry
- **Master Multi-Agent Architectures**: Ipatupad ang mga coordinated na solusyon ng AI agent
- **Ipatupad ang Mga Pinakamahusay na Praktis sa Seguridad**: I-configure ang authentication at access control
- **I-optimize para sa Scale**: Magdisenyo ng cost-effective at performant na mga deployment
- **Mag-troubleshoot ng Mga Deployment**: Malutas ang mga karaniwang isyu nang mag-isa

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Mga Materyales ng Workshop](workshop/README.md) - Kapaligiran sa pag-aaral na batay sa browser
- **📋 Mga Gabay na Hakbang**: [Mga Gabay na Ehersisyo](../../workshop/docs/instructions) - Detalyadong walkthrough
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Mga ehersisyo na nakatuon sa AI
- **💡 Quick Start**: [Gabay sa Setup ng Workshop](workshop/README.md#quick-start) - Configuration ng environment

**Perpekto para sa**: Pagsasanay sa korporasyon, mga kurso sa unibersidad, self-paced na pag-aaral, at mga developer bootcamp.

---

## 📖 Ano ang Azure Developer CLI?

Ang Azure Developer CLI (azd) ay isang command-line interface na nakatuon sa developer na nagpapabilis sa proseso ng pagbuo at pag-deploy ng mga application sa Azure. Nagbibigay ito ng:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa mga karaniwang pattern ng application
- **Infrastructure as Code** - Pamahalaan ang mga resource ng Azure gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na pag-provision, pag-deploy, at pagsubaybay sa mga application
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng developer

### **AZD + Azure AI Foundry: Perpekto para sa AI Deployments**

**Bakit AZD para sa mga Solusyon sa AI?** Tinutugunan ng AZD ang mga pangunahing hamon na kinakaharap ng mga AI developer:

- **AI-Ready Templates** - Mga pre-configured na template para sa Azure OpenAI, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Mga built-in na pattern sa seguridad para sa mga serbisyo ng AI, API keys, at mga endpoint ng modelo  
- **Production AI Patterns** - Mga pinakamahusay na praktis para sa scalable at cost-effective na pag-deploy ng AI application
- **End-to-End AI Workflows** - Mula sa pagbuo ng modelo hanggang sa pag-deploy sa produksyon na may tamang pagsubaybay
- **Cost Optimization** - Mga estratehiya sa matalinong paglalaan ng resource at pag-scale para sa AI workloads
- **Azure AI Foundry Integration** - Seamless na koneksyon sa AI Foundry model catalog at mga endpoint

---

## 🎯 Library ng Mga Template at Halimbawa

### Itinatampok: Mga Template ng Azure AI Foundry
**Simulan dito kung magde-deploy ka ng mga AI application!**

| Template | Kabanata | Komplikasyon | Mga Serbisyo |
|----------|---------|------------|----------|
| [**Simulan ang AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Simulan ang AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Gumawa ng mga dokumento mula sa iyong data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Pagbutihin ang mga client meeting gamit ang agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernize ang iyong code gamit ang agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Gumawa ng iyong conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**I-unlock ang insights mula sa conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Itinatampok: Kumpletong Mga Scenario ng Pag-aaral
**Mga template ng application na handa para sa produksyon na naka-map sa mga kabanata ng pag-aaral**

| Template | Kabanata ng Pag-aaral | Komplikasyon | Pangunahing Pag-aaral |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng AI deployment |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Implementasyon ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Framework ng agent at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Orkestrasyon ng Enterprise AI |
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
- [Microservices](../../examples/microservices) - Mga multi-service na arkitektura  
- [Enterprise Solutions](../../examples/enterprise) - Mga pattern na handa para sa produksyon

### Mga Koleksyon ng Template sa Labas
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated na koleksyon ng opisyal at community templates
- [**Mga Template ng Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng template sa Microsoft Learn
- [**Direktoryo ng Mga Halimbawa**](examples/README.md) - Mga lokal na halimbawa ng pag-aaral na may detalyadong paliwanag

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
- [**Istrukturang Landas ng Pag-aaral**](../../workshop/docs/instructions) - 7 hakbang na gabay na ehersisyo (Pagdiskubre → Pag-deploy → Pag-customize)
- [**AZD Para sa Mga Baguhan Workshop**](workshop/README.md) - Kumpletong materyales sa workshop na hands-on na may integrasyon ng GitHub Codespaces

### Mga Mapagkukunan ng Pag-aaral sa Labas
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
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Ehersisyo**: Kumpletuhin ang hands-on na deployment ng kabanata
2. **Knowledge Check**: Suriin ang seksyon ng FAQ para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng komplikasyon

### Mga Benepisyo ng Pagtatapos ng Kurso
Kapag natapos ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Produksyon**: Na-deploy ang mga totoong AI application sa Azure
- **Propesyonal na Kasanayan**: Mga kakayahan sa pag-deploy na handa para sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng komunidad ng Azure developer
- **Pag-unlad sa Karera**: In-demand na AZD at AI deployment expertise

---

## 🤝 Komunidad at Suporta

### Humingi ng Tulong at Suporta
- **Mga Isyung Teknikal**: [Mag-report ng mga bug at mag-request ng mga feature](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **Tulong na Nakatuon sa AI**: Sumali sa [#Azure channel](https://discord.gg/microsoft-azure) para sa mga diskusyon sa AZD + AI Foundry
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Insight ng Komunidad mula sa Azure AI Foundry Discord

**Mga Resulta ng Kamakailang Poll mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gumamit ng AZD para sa AI workloads
- **Mga pangunahing hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakamaraming hiniling**: Mga template na nakatuon sa AI, mga gabay sa troubleshooting, pinakamahusay na praktis

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Mag-access ng maagang preview ng mga bagong template ng AI
- Mag-ambag sa mga pinakamahusay na praktis sa AI deployment
- Makaimpluwensya sa hinaharap na pag-develop ng mga feature ng AI + AZD

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang mga kontribusyon! Pakibasa ang aming [Gabay sa Pag-aambag](CONTRIBUTING.md) para sa mga detalye sa:
- **Pagpapahusay ng Nilalaman**: Pagbutihin ang mga umiiral na kabanata at halimbawa
- **Mga Bagong Halimbawa**: Magdagdag ng mga totoong sitwasyon at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng suporta sa maraming wika  
- **Mga Ulat ng Bug**: Pagbutihin ang katumpakan at kalinawan  
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong mga alituntunin ng komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Kaugnay na Microsoft Learning Resources

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pag-aaral:

- [Model Context Protocol (MCP) Para sa Mga Baguhan](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents para sa Mga Baguhan](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI para sa Mga Baguhan gamit ang .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI para sa Mga Baguhan](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI para sa Mga Baguhan gamit ang Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML para sa Mga Baguhan](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science para sa Mga Baguhan](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI para sa Mga Baguhan](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity para sa Mga Baguhan](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev para sa Mga Baguhan](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT para sa Mga Baguhan](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development para sa Mga Baguhan](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot para sa AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot para sa C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Piliin ang Iyong Sariling Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Pag-navigate sa Kurso

**🚀 Handa nang Matuto?**

**Mga Baguhan**: Magsimula sa [Kabanata 1: Pundasyon at Mabilisang Simula](../..)  
**AI Developers**: Tumungo sa [Kabanata 2: AI-First Development](../..)  
**Mga May Karanasang Developer**: Magsimula sa [Kabanata 3: Configuration at Authentication](../..)

**Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, mangyaring tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na mapagkakatiwalaang pinagmulan. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.