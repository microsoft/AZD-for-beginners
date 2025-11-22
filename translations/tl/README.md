<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "b2e94dc30cab0675918a6ad34863b05d",
  "translation_date": "2025-11-22T09:55:03+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa mga Baguhan: Isang Estrukturadong Paglalakbay sa Pag-aaral

![AZD-para-sa-mga-baguhan](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tl.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Pagsisimula sa Kursong Ito

Sundin ang mga hakbang na ito upang simulan ang iyong paglalakbay sa pag-aaral ng AZD:

1. **I-fork ang Repository**: I-click [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ang Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Sumali sa Komunidad**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) para sa suporta mula sa mga eksperto
4. **Pumili ng Landas sa Pag-aaral**: Piliin ang kabanata sa ibaba na naaayon sa iyong antas ng karanasan

### Suporta sa Iba't Ibang Wika

#### Awtomatikong Pagsasalin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pangkalahatang-ideya ng Kurso

Matutunan ang Azure Developer CLI (azd) sa pamamagitan ng mga estrukturadong kabanata na idinisenyo para sa progresibong pag-aaral. **May espesyal na pokus sa pag-deploy ng mga AI application gamit ang Microsoft Foundry integration.**

### Bakit Mahalaga ang Kursong Ito para sa Modernong mga Developer

Batay sa mga insight mula sa Microsoft Foundry Discord community, **45% ng mga developer ang nais gumamit ng AZD para sa AI workloads** ngunit nahihirapan sa:
- Kumplikadong multi-service AI architectures
- Mga pinakamahusay na kasanayan sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI services
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga isyu sa AI-specific deployment

### Mga Layunin sa Pag-aaral

Sa pagtatapos ng kursong ito, ikaw ay:
- **Magiging bihasa sa AZD Fundamentals**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **Makakapag-deploy ng AI Applications**: Gamit ang AZD kasama ang Microsoft Foundry services
- **Makakapagpatupad ng Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang Bicep templates
- **Makakapag-troubleshoot ng Deployments**: Malulutas ang mga karaniwang isyu at ma-debug ang mga problema
- **Mag-o-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Makakabuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong AI architectures

## 📚 Mga Kabanata sa Pag-aaral

*Piliin ang iyong landas sa pag-aaral batay sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon at Mabilisang Pagsisimula
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kumplikado**: ⭐

#### Ano ang Matututuhan Mo
- Pag-unawa sa mga pangunahing kaalaman ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Magsimula Dito**: [Ano ang Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Pag-install at Setup](docs/getting-started/installation.md) - Mga gabay ayon sa platform
- **🛠️ Hands-On**: [Ang Iyong Unang Proyekto](docs/getting-started/first-project.md) - Step-by-step na tutorial
- **📋 Mabilisang Sanggunian**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilisang pagsusuri ng pag-install
azd version

# I-deploy ang iyong unang aplikasyon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resulta ng Kabanata**: Matagumpay na ma-deploy ang isang simpleng web application sa Azure gamit ang AZD

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-initialize ang proyekto
azd up                  # I-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bumubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras ng Pamumuhunan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga simpleng application nang mag-isa

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-initialize ang proyekto
azd up                  # I-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bumubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resources
```

**📊 Oras ng Pamumuhunan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga simpleng application nang mag-isa

---

### 🤖 Kabanata 2: AI-First Development (Inirerekomenda para sa AI Developers)
**Mga Kinakailangan**: Natapos ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Integrasyon ng Microsoft Foundry sa AZD
- Pag-deploy ng mga AI-powered application
- Pag-unawa sa mga konfigurasyon ng AI services

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Magsimula Dito**: [Integrasyon ng Microsoft Foundry](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - Pag-deploy at pamamahala ng mga AI model
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga AI solution
- **🎥 Interactive Guide**: [Mga Materyales sa Workshop](workshop/README.md) - Pag-aaral gamit ang browser na may MkDocs * DevContainer Environment
- **📋 Mga Template**: [Microsoft Foundry Templates](../..)
- **📝 Mga Halimbawa**: [Mga Halimbawa ng AZD Deployment](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang iyong unang AI na aplikasyon
azd init --template azure-search-openai-demo
azd up

# Subukan ang karagdagang mga template ng AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resulta ng Kabanata**: Ma-deploy at ma-configure ang isang AI-powered chat application na may RAG capabilities

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat mong magawa ang mga sumusunod:
azd init --template azure-search-openai-demo
azd up
# Subukan ang AI chat interface
# Magtanong at makakuha ng mga sagot mula sa AI na may mga pinagmulan
# Tiyakin na gumagana ang pagsasama ng paghahanap
azd monitor  # Suriin na nagpapakita ang Application Insights ng telemetry
azd down --force --purge
```

**📊 Oras ng Pamumuhunan:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-configure ng production-ready AI applications  
**💰 Kamalayan sa Gastos:** Nauunawaan ang $80-150/buwan na gastos sa dev, $300-3500/buwan na gastos sa production

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa AI Deployments

**Development Environment (Tinatayang $80-150/buwan):**
- Azure OpenAI (Pay-as-you-go): $0-50/buwan (batay sa token usage)
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
- Gamitin ang **Free Tier** ng Azure OpenAI para sa pag-aaral (50,000 tokens/buwan na kasama)
- Patakbuhin ang `azd down` upang ma-deallocate ang mga resources kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based billing, mag-upgrade sa PTU lamang para sa production
- Gamitin ang `azd provision --preview` upang matantya ang mga gastos bago ang deployment
- I-enable ang auto-scaling: magbayad lamang para sa aktwal na paggamit

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
- Pamamahala at konfigurasyon ng environment
- Mga pinakamahusay na kasanayan sa authentication at seguridad
- Pagpapangalan at organisasyon ng mga resource

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Konfigurasyon**: [Gabay sa Konfigurasyon](docs/getting-started/configuration.md) - Setup ng environment
- **🔐 Seguridad**: [Mga pattern ng authentication at managed identity](docs/getting-started/authsecurity.md) - Mga pattern ng authentication
- **📝 Mga Halimbawa**: [Halimbawa ng Database App](examples/database-app/README.md) - Mga Halimbawa ng AZD Database

#### Mga Praktikal na Ehersisyo
- Mag-configure ng maraming environment (dev, staging, prod)
- Mag-set up ng managed identity authentication
- Magpatupad ng environment-specific configurations

**💡 Resulta ng Kabanata**: Kayang pamahalaan ang maraming environment na may tamang authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code at Deployment
**Mga Kinakailangan**: Natapos ang Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga advanced na pattern ng deployment
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa resource provisioning

#### Mga Mapagkukunan sa Pag-aaral
- **📖 Deployment**: [Gabay sa Deployment](docs/deployment/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Pag-provision ng Resources](docs/deployment/provisioning.md) - Pamamahala ng Azure resources
- **📝 Mga Halimbawa**: [Halimbawa ng Container App](../../examples/container-app) - Mga containerized deployments

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na Bicep templates
- Mag-deploy ng multi-service applications
- Magpatupad ng blue-green deployment strategies

**💡 Resulta ng Kabanata**: Kayang mag-deploy ng kumplikadong multi-service applications gamit ang custom infrastructure templates

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Natapos ang Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga pattern ng multi-agent architecture
- Orkestrasyon at koordinasyon ng mga agent
- Production-ready AI deployments

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Itinatampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektura**: [Mga pattern ng koordinasyon ng multi-agent](/docs/pre-deployment/coordination-patterns.md) - Mga pattern

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang kumpletong retail multi-agent na solusyon
cd examples/retail-multiagent-arm-template
./deploy.sh

# Suriin ang mga configuration ng ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kinalabasan ng Kabanata**: I-deploy at pamahalaan ang isang production-ready na multi-agent AI solution gamit ang Customer at Inventory agents

---

### 🔍 Kabanata 6: Pre-Deployment Validation at Pagpaplano
**Mga Kinakailangan**: Natapos ang Kabanata 4  
**Tagal**: 1 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Matututuhan Mo
- Pagpaplano ng kapasidad at pag-validate ng mga resources
- Mga estratehiya sa pagpili ng SKU
- Pre-flight checks at automation

#### Mga Mapagkukunan ng Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Pag-validate ng resources
- **💰 Pagpili**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- **✅ Pag-validate**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Mga automated na script

#### Mga Praktikal na Ehersisyo
- Patakbuhin ang mga capacity validation script
- I-optimize ang mga pagpili ng SKU para sa gastos
- Ipatupad ang mga automated pre-deployment checks

**💡 Kinalabasan ng Kabanata**: I-validate at i-optimize ang mga deployment bago ito isagawa

---

### 🚨 Kabanata 7: Troubleshooting at Debugging
**Mga Kinakailangan**: Natapos ang anumang deployment chapter  
**Tagal**: 1-1.5 oras  
**Kompleksidad**: ⭐⭐

#### Ano ang Matututuhan Mo
- Sistematikong mga pamamaraan ng debugging
- Karaniwang mga isyu at solusyon
- Troubleshooting na partikular sa AI

#### Mga Mapagkukunan ng Pag-aaral
- **🔧 Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya
- **🤖 Mga Isyu sa AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa AI service

#### Mga Praktikal na Ehersisyo
- Mag-diagnose ng mga deployment failure
- Lutasin ang mga authentication issue
- I-debug ang AI service connectivity

**💡 Kinalabasan ng Kabanata**: Magawang mag-diagnose at magresolba ng mga karaniwang deployment issue nang mag-isa

---

### 🏢 Kabanata 8: Production at Enterprise Patterns
**Mga Kinakailangan**: Natapos ang Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kompleksidad**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga estratehiya sa production deployment
- Mga enterprise security pattern
- Monitoring at cost optimization

#### Mga Mapagkukunan ng Pag-aaral
- **🏭 Production**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Mga enterprise pattern
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga komplikadong arkitektura
- **📊 Monitoring**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Monitoring

#### Mga Praktikal na Ehersisyo
- Ipatupad ang mga enterprise security pattern
- Mag-set up ng komprehensibong monitoring
- Mag-deploy sa production na may tamang pamamahala

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng mga enterprise-ready na application na may kumpletong production capabilities

---

## 🎓 Pangkalahatang-ideya ng Workshop: Hands-On Learning Experience

> **⚠️ STATUS NG WORKSHOP: Aktibong Pag-develop**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapahusay. Ang mga pangunahing module ay gumagana na, ngunit ang ilang advanced na seksyon ay hindi pa tapos. Aktibo naming tinatapos ang lahat ng nilalaman. [Subaybayan ang progreso →](workshop/README.md)

### Mga Interactive na Materyales ng Workshop
**Komprehensibong hands-on learning gamit ang browser-based tools at guided exercises**

Ang aming mga materyales sa workshop ay nagbibigay ng isang istrukturadong, interactive na karanasan sa pag-aaral na umaakma sa kurikulum na nakabatay sa kabanata sa itaas. Ang workshop ay idinisenyo para sa parehong self-paced learning at instructor-led sessions.

#### 🛠️ Mga Tampok ng Workshop
- **Browser-Based Interface**: Kumpletong MkDocs-powered workshop na may search, copy, at theme features
- **GitHub Codespaces Integration**: One-click na pag-set up ng development environment
- **Structured Learning Path**: 7-step guided exercises (3.5 oras kabuuan)
- **Discovery → Deployment → Customization**: Progresibong metodolohiya
- **Interactive DevContainer Environment**: Pre-configured na mga tool at dependencies

#### 📚 Istruktura ng Workshop
Ang workshop ay sumusunod sa metodolohiyang **Discovery → Deployment → Customization**:

1. **Discovery Phase** (45 minuto)
   - Tuklasin ang Microsoft Foundry templates at services
   - Unawain ang mga multi-agent architecture pattern
   - Suriin ang mga deployment requirement at prerequisites

2. **Deployment Phase** (2 oras)
   - Hands-on deployment ng AI applications gamit ang AZD
   - I-configure ang Azure AI services at endpoints
   - Ipatupad ang mga security at authentication pattern

3. **Customization Phase** (45 minuto)
   - I-modify ang mga application para sa partikular na use cases
   - I-optimize para sa production deployment
   - Ipatupad ang monitoring at cost management

#### 🚀 Pagsisimula sa Workshop
```bash
# Opsyon 1: GitHub Codespaces (Inirerekomenda)
# I-click ang "Code" → "Create codespace on main" sa repositoryo

# Opsyon 2: Lokal na Pag-develop
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga tagubilin sa setup sa workshop/README.md
```

#### 🎯 Mga Kinalabasan ng Pag-aaral sa Workshop
Sa pagtatapos ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Production AI Applications**: Gamitin ang AZD kasama ang Microsoft Foundry services
- **Master Multi-Agent Architectures**: Magpatupad ng coordinated AI agent solutions
- **Ipatupad ang Security Best Practices**: I-configure ang authentication at access control
- **I-optimize para sa Scale**: Magdisenyo ng cost-effective at performant na mga deployment
- **Mag-troubleshoot ng Deployments**: Magresolba ng mga karaniwang isyu nang mag-isa

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Step-by-Step Instructions**: [Guided Exercises](../../workshop/docs/instructions) - Detalyadong walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Mga AI-focused na ehersisyo
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Configuration ng environment

**Perpekto para sa**: Corporate training, university courses, self-paced learning, at developer bootcamps.

---

## 📖 Ano ang Azure Developer CLI?

Ang Azure Developer CLI (azd) ay isang developer-centric na command-line interface na nagpapabilis sa proseso ng pagbuo at pag-deploy ng mga application sa Azure. Nagbibigay ito ng:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa mga karaniwang application pattern
- **Infrastructure as Code** - Pamahalaan ang mga Azure resources gamit ang Bicep o Terraform  
- **Integrated workflows** - Seamless na pag-provision, pag-deploy, at pag-monitor ng mga application
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa AI Deployments**

**Bakit AZD para sa AI Solutions?** Tinutugunan ng AZD ang mga pangunahing hamon na kinakaharap ng mga AI developer:

- **AI-Ready Templates** - Mga pre-configured na template para sa Azure OpenAI, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Built-in na mga security pattern para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Mga best practices para sa scalable at cost-effective na AI application deployments
- **End-to-End AI Workflows** - Mula sa model development hanggang production deployment na may tamang monitoring
- **Cost Optimization** - Matalinong paglalaan ng resources at scaling strategies para sa AI workloads
- **Microsoft Foundry Integration** - Seamless na koneksyon sa Microsoft Foundry model catalog at endpoints

---

## 🎯 Templates at Library ng Mga Halimbawa

### Itinatampok: Microsoft Foundry Templates
**Magsimula dito kung nagde-deploy ka ng AI applications!**

> **Tandaan:** Ang mga template na ito ay nagpapakita ng iba't ibang AI pattern. Ang ilan ay external Azure Samples, ang iba ay lokal na implementasyon.

| Template | Kabanata | Kompleksidad | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Itinatampok: Kumpletong Mga Learning Scenario
**Mga production-ready na application template na naka-mapa sa mga kabanata ng pag-aaral**

| Template | Kabanata ng Pag-aaral | Kompleksidad | Pangunahing Matututuhan |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga basic na AI deployment pattern |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | Implementasyon ng RAG gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture na may Customer at Inventory agents |

### Pag-aaral sa Pamamagitan ng Uri ng Halimbawa

> **📌 Lokal vs. External na Mga Halimbawa:**  
> **Lokal na Mga Halimbawa** (sa repo na ito) = Handa nang gamitin agad  
> **External na Mga Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repository

#### Lokal na Mga Halimbawa (Handa nang Gamitin)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong production-ready na implementasyon gamit ang ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Komprehensibong monitoring at pagsusuri
  - One-click deployment gamit ang ARM template

#### Lokal na Mga Halimbawa - Container Applications (Kabanata 2-5)
**Komprehensibong mga halimbawa ng container deployment sa repository na ito:**
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa containerized deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basic REST API na may scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Production-ready na multi-service deployment
  - Quick Start, Production, at Advanced deployment patterns
  - Monitoring, security, at cost optimization guidance

#### External na Mga Halimbawa - Simpleng Application (Kabanata 1-2)
**I-clone ang mga Azure Samples repository na ito para magsimula:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Mga basic na deployment pattern
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment ng static content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### External na Mga Halimbawa - Database Integration (Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng database connectivity
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na data workflow

#### External na Mga Halimbawa - Advanced na Pattern (Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architectures
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Production-ready na ML patterns

### External na Koleksyon ng Template
- [**Opisyal na AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Curated na koleksyon ng opisyal at community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng Microsoft Learn template
- [**Examples Directory**](examples/README.md) - Lokal na mga halimbawa ng pag-aaral na may detalyadong paliwanag

---

## 📚 Mga Mapagkukunan ng Pag-aaral at Sanggunian

### Mabilisang Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang azd commands na nakaayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Mga karaniwang tanong na nakaayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga ehersisyo sa pagsasanay
### Mga Workshop na Pwedeng Subukan
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong AI solutions (2-3 oras)
- [**Interactive Workshop Guide**](workshop/README.md) - Workshop gamit ang browser na may MkDocs at DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-hakbang na gabay sa mga exercise (Discovery → Deployment → Customization)
- [**AZD Para sa Mga Baguhan Workshop**](workshop/README.md) - Kumpletong materyales para sa hands-on workshop na may GitHub Codespaces integration

### Mga Panlabas na Learning Resources
- [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Mabilisang Gabay sa Pag-aayos ng Problema

**Karaniwang mga isyu na nararanasan ng mga baguhan at ang agarang solusyon:**

### ❌ "azd: command not found"

```bash
# I-install muna ang AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Tiyakin ang pag-install
azd version
```

### ❌ "No subscription found" o "Subscription not set"

```bash
# Ilista ang mga magagamit na subscription
az account list --output table

# Itakda ang default na subscription
az account set --subscription "<subscription-id-or-name>"

# Itakda para sa kapaligiran ng AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Tiyakin
az account show
```

### ❌ "InsufficientQuota" o "Quota exceeded"

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

### ❌ Nabigo ang "azd up" sa kalagitnaan

```bash
# Opsyon 1: Linisin at subukang muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lamang ang imprastraktura
azd provision

# Opsyon 3: Suriin ang detalyadong mga log
azd show
azd logs
```

### ❌ "Authentication failed" o "Token expired"

```bash
# Muling magpatotoo
az logout
az login

azd auth logout
azd auth login

# Tiyakin ang pagpapatotoo
az account show
```

### ❌ "Resource already exists" o may conflict sa pangalan

```bash
# Ang AZD ay bumubuo ng natatanging mga pangalan, ngunit kung may salungatan:
azd down --force --purge

# Pagkatapos subukang muli gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```

### ❌ Masyadong matagal ang template deployment

**Karaniwang oras ng paghihintay:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- AI applications: 15-25 minuto (mabagal ang OpenAI provisioning)

```bash
# Suriin ang progreso
azd show

# Kung natigil >30 minuto, suriin ang Azure Portal:
azd monitor
# Hanapin ang mga nabigong deployment
```

### ❌ "Permission denied" o "Forbidden"

```bash
# Suriin ang iyong Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa "Contributor" na role
# Hilingin sa iyong Azure admin na magbigay ng:
# - Contributor (para sa mga resources)
# - User Access Administrator (para sa mga role assignments)
```

### ❌ Hindi mahanap ang URL ng na-deploy na application

```bash
# Ipakita ang lahat ng service endpoints
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga *_URL na variable
```

### 📚 Buong Mga Resource sa Pag-aayos ng Problema

- **Gabay sa Karaniwang Isyu:** [Detalyadong Solusyon](docs/troubleshooting/common-issues.md)
- **Mga Isyu Kaugnay sa AI:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Gabay sa Debugging:** [Hakbang-hakbang na Debugging](docs/troubleshooting/debugging.md)
- **Humingi ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Mabilisang Gabay sa Pag-aayos ng Problema

**Karaniwang mga isyu na nararanasan ng mga baguhan at ang agarang solusyon:**

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

# Tiyakin ang pag-install
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" o "Subscription not set"</strong></summary>

```bash
# Ilista ang mga magagamit na subscription
az account list --output table

# Itakda ang default na subscription
az account set --subscription "<subscription-id-or-name>"

# Itakda para sa kapaligiran ng AZD
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Tiyakin
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" o "Quota exceeded"</strong></summary>

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
<summary><strong>❌ Nabigo ang "azd up" sa kalagitnaan</strong></summary>

```bash
# Opsyon 1: Linisin at subukang muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lamang ang imprastraktura
azd provision

# Opsyon 3: Suriin ang detalyadong mga log
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" o "Token expired"</strong></summary>

```bash
# Muling magpatotoo
az logout
az login

azd auth logout
azd auth login

# Tiyakin ang pagpapatotoo
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" o may conflict sa pangalan</strong></summary>

```bash
# Ang AZD ay bumubuo ng natatanging mga pangalan, ngunit kung may salungatan:
azd down --force --purge

# Pagkatapos subukang muli gamit ang bagong kapaligiran
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Masyadong matagal ang template deployment</strong></summary>

**Karaniwang oras ng paghihintay:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- AI applications: 15-25 minuto (mabagal ang OpenAI provisioning)

```bash
# Suriin ang progreso
azd show

# Kung natigil >30 minuto, suriin ang Azure Portal:
azd monitor
# Hanapin ang mga nabigong deployment
```
</details>

<details>
<summary><strong>❌ "Permission denied" o "Forbidden"</strong></summary>

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
<summary><strong>❌ Hindi mahanap ang URL ng na-deploy na application</strong></summary>

```bash
# Ipakita ang lahat ng service endpoints
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga *_URL na variable
```
</details>

### 📚 Buong Mga Resource sa Pag-aayos ng Problema

- **Gabay sa Karaniwang Isyu:** [Detalyadong Solusyon](docs/troubleshooting/common-issues.md)
- **Mga Isyu Kaugnay sa AI:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Gabay sa Debugging:** [Hakbang-hakbang na Debugging](docs/troubleshooting/debugging.md)
- **Humingi ng Tulong:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagkumpleto ng Kurso at Sertipikasyon

### Pagsubaybay sa Progreso
Subaybayan ang iyong progreso sa bawat kabanata:

- [ ] **Kabanata 1**: Foundation & Quick Start ✅
- [ ] **Kabanata 2**: AI-First Development ✅  
- [ ] **Kabanata 3**: Configuration & Authentication ✅
- [ ] **Kabanata 4**: Infrastructure as Code & Deployment ✅
- [ ] **Kabanata 5**: Multi-Agent AI Solutions ✅
- [ ] **Kabanata 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Kabanata 7**: Troubleshooting & Debugging ✅
- [ ] **Kabanata 8**: Production & Enterprise Patterns ✅

### Pagpapatunay ng Natutunan
Pagkatapos ng bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Exercise**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Pagsusuri ng Kaalaman**: Balikan ang FAQ section ng kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa mas mataas na antas ng kahirapan

### Mga Benepisyo ng Pagkumpleto ng Kurso
Kapag natapos ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Produksyon**: Na-deploy na totoong AI applications sa Azure
- **Propesyonal na Kasanayan**: Kakayahang mag-deploy na handa sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng Azure developer community
- **Pag-unlad sa Karera**: Ekspertong kaalaman sa AZD at AI deployment

---

## 🤝 Komunidad at Suporta

### Humingi ng Tulong at Suporta
- **Mga Teknikal na Isyu**: [I-report ang mga bug at mag-request ng features](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong Kaugnay sa AI**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Insight ng Komunidad mula sa Microsoft Foundry Discord

**Mga Resulta ng Kamakailang Botohan mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gumamit ng AZD para sa AI workloads
- **Mga Pangunahing Hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakamaraming Hinihiling**: AI-specific templates, troubleshooting guides, best practices

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong AZD + AI na karanasan at humingi ng tulong
- Magkaroon ng access sa mga maagang preview ng bagong AI templates
- Mag-ambag sa mga best practices sa AI deployment
- Makaimpluwensya sa mga hinaharap na feature development ng AI + AZD

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang mga kontribusyon! Pakibasa ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapahusay ng Nilalaman**: Pagbutihin ang mga umiiral na kabanata at halimbawa
- **Bagong Halimbawa**: Magdagdag ng mga real-world na scenario at templates  
- **Pagsasalin**: Tumulong sa pagpapanatili ng multi-language support
- **Pag-uulat ng Bug**: Pagbutihin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong community guidelines

---

## 📄 Impormasyon Tungkol sa Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Kaugnay na Microsoft Learning Resources

Ang aming team ay gumagawa ng iba pang komprehensibong learning courses:

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
[![IoT para sa mga Baguhan](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
[![Pag-develop ng XR para sa mga Baguhan](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---

### Copilot Series  
[![Copilot para sa AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Pag-navigate sa Kurso  

**🚀 Handa nang Matuto?**

**Para sa mga Baguhan**: Magsimula sa [Kabanata 1: Pundasyon at Mabilisang Simula](../..)  
**Para sa mga AI Developers**: Tumalon sa [Kabanata 2: AI-First Development](../..)  
**Para sa mga May Karanasan nang Developers**: Magsimula sa [Kabanata 3: Configuration at Authentication](../..)  

**Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Basics](docs/getting-started/azd-basics.md) →  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, pakitandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na dulot ng paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->