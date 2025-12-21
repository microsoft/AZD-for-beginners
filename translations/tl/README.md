<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1caf5e63f84a4cdffbeb8d0fe5fa3fa8",
  "translation_date": "2025-12-21T18:24:19+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa mga Baguhan: Isang Istrakturadong Paglalakbay sa Pagkatuto

![AZD para sa mga Baguhan](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tl.png) 

[![Mga tagamasid sa GitHub](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![Mga fork sa GitHub](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![Mga bituin sa GitHub](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Discord ng Azure](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Discord ng Microsoft Foundry](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Paano Magsimula sa Kurso na Ito

Sundin ang mga hakbang na ito upang simulan ang iyong paglalakbay sa pagkatuto ng AZD:

1. **I-fork ang Repositoryo**: I-click ang [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ang Repositoryo**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Sumali sa Komunidad**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) para sa ekspertong suporta
4. **Piliin ang Iyong Landas ng Pagkatuto**: Pumili ng kabanata sa ibaba na tumutugma sa iyong antas ng karanasan

### Suporta sa Maramihang Wika

#### Awtomatikong Mga Salin (Laging Napapanahon)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](./README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Pangkalahatang-ideya ng Kurso

Magsanay ng Azure Developer CLI (azd) sa pamamagitan ng mga istrakturadong kabanata na dinisenyo para sa progresibong pagkatuto. **Espesyal na pokus sa pag-deploy ng AI application na may integrasyon ng Microsoft Foundry.**

### Bakit Mahalaga ang Kurso na Ito para sa Makabagong mga Developer

Batay sa mga pananaw mula sa Microsoft Foundry Discord community, **45% ng mga developer ay nais gamitin ang AZD para sa mga AI workload** ngunit nahaharap sa mga hamon tulad ng:
- Kumplikadong multi-service na arkitektura ng AI
- Mga pinakamahusay na kasanayan sa production AI deployment
- Integrasyon at konfigurasyon ng Azure AI service
- Pag-optimize ng gastos para sa mga AI workload
- Pag-troubleshoot ng mga ispesipikong isyu sa deployment ng AI

### Mga Layunin sa Pagkatuto

Sa pagtatapos ng istrakturadong kursong ito, ikaw ay:
- **Magtataglay ng Kaalaman sa Mga Pangunahing Konsepto ng AZD**: Mga core na konsepto, pag-install, at konfigurasyon
- **Makakapag-deploy ng AI Applications**: Gamitin ang AZD kasama ang mga serbisyo ng Microsoft Foundry
- **Magpapatupad ng Infrastructure as Code**: Pamahalaan ang mga Azure resource gamit ang mga Bicep template
- **Makakapag-troubleshoot ng Deployments**: Lutasin ang karaniwang mga isyu at mag-debug ng mga problema
- **Mag-o-optimize para sa Produksyon**: Seguridad, scaling, monitoring, at pamamahala ng gastos
- **Makakabuo ng Multi-Agent Solutions**: Mag-deploy ng kumplikadong mga arkitektura ng AI

## 📚 Mga Kabanata sa Pagkatuto

*Pumili ng iyong landas ng pagkatuto base sa antas ng karanasan at mga layunin*

### 🚀 Kabanata 1: Pundasyon at Mabilis na Pagsisimula
**Mga Kinakailangan**: Subscription sa Azure, pangunahing kaalaman sa command line  
**Tagal**: 30-45 minuto  
**Kakompleksidad**: ⭐

#### Ano ang Matututuhan Mo
- Pag-unawa sa mga pangunahing kaalaman ng Azure Developer CLI
- Pag-install ng AZD sa iyong plataporma
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan ng Pagkatuto
- **🎯 Magsimula Dito**: [What is Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga core na konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Mga gabay ayon sa plataporma
- **🛠️ Hands-On**: [Your First Project](docs/getting-started/first-project.md) - Hakbang-hakbang na tutorial
- **📋 Quick Reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Mga Praktikal na Ehersisyo
```bash
# Mabilis na pagsuri ng instalasyon
azd version

# I-deploy ang iyong unang aplikasyon
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kinalabasan ng Kabanata**: Matagumpay na mai-deploy ang isang simpleng web application sa Azure gamit ang AZD

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa ang mga sumusunod:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalisa ang proyekto
azd up                  # Ina-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga resource
```

**📊 Oras na Inilaan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing aplikasyon nang mag-isa

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos makumpleto ang Kabanata 1, dapat mong magawa:
azd version              # Ipinapakita ang naka-install na bersyon
azd init --template todo-nodejs-mongo  # Ini-inisyalisa ang proyekto
azd up                  # Ina-deploy sa Azure
azd show                # Ipinapakita ang URL ng tumatakbong app
# Bubukas ang aplikasyon sa browser at gumagana
azd down --force --purge  # Nililinis ang mga mapagkukunan
```

**📊 Oras na Inilaan:** 30-45 minuto  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy ng mga pangunahing aplikasyon nang mag-isa

---

### 🤖 Kabanata 2: Pag-develop na Nakatuon sa AI (Inirerekomenda para sa mga AI Developer)
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 1-2 oras  
**Kakompleksidad**: ⭐⭐

#### Ano ang Matututuhan Mo
- Integrasyon ng Microsoft Foundry sa AZD
- Pag-deploy ng mga AI-powered na aplikasyon
- Pag-unawa sa mga konfigurasyon ng AI service

#### Mga Mapagkukunan ng Pagkatuto
- **🎯 Magsimula Dito**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - Pag-deploy at pamamahala ng mga AI model
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-ready ang iyong mga AI solution
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Pag-aaral sa browser gamit ang MkDocs * DevContainer Environment
- **📋 Mga Template**: [Microsoft Foundry Templates](../..)
- **📝 Mga Halimbawa**: [AZD Deployment Examples](examples/README.md)

#### Mga Praktikal na Ehersisyo
```bash
# Ilunsad ang iyong unang aplikasyon ng AI
azd init --template azure-search-openai-demo
azd up

# Subukan ang iba pang mga template ng AI
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kinalabasan ng Kabanata**: Mag-deploy at mag-konfigura ng isang AI-powered na chat application na may RAG capabilities

**✅ Pagpapatunay ng Tagumpay:**
```bash
# Pagkatapos ng Kabanata 2, dapat mong magawa:
azd init --template azure-search-openai-demo
azd up
# Subukan ang interface ng chat ng AI
# Magtanong at makakuha ng mga tugon na pinapagana ng AI na may mga sanggunian
# Patunayan na gumagana ang integrasyon ng paghahanap
azd monitor  # Suriin na ipinapakita ng Application Insights ang telemetry
azd down --force --purge
```

**📊 Oras na Inilaan:** 1-2 oras  
**📈 Antas ng Kasanayan Pagkatapos:** Kayang mag-deploy at mag-konfigura ng mga AI application na handa para sa produksyon  
**💰 Kaalaman sa Gastos:** Maunawaan ang $80-150/buwan para sa dev costs, $300-3500/buwan para sa production costs

#### 💰 Mga Pagsasaalang-alang sa Gastos para sa Mga AI Deployment

**Kapaligiran ng Pag-unlad (Tinatayang $80-150/buwan):**
- Azure OpenAI (Pay-as-you-go): $0-50/buwan (batay sa paggamit ng token)
- AI Search (Basic tier): $75/buwan
- Container Apps (Consumption): $0-20/buwan
- Storage (Standard): $1-5/buwan

**Kapaligiran sa Produksyon (Tinatayang $300-3,500+/buwan):**
- Azure OpenAI (PTU para sa tuloy-tuloy na performance): $3,000+/buwan O Pay-as-go sa mataas na volume
- AI Search (Standard tier): $250/buwan
- Container Apps (Dedicated): $50-100/buwan
- Application Insights: $5-50/buwan
- Storage (Premium): $10-50/buwan

**💡 Mga Tip sa Pag-optimize ng Gastos:**
- Gumamit ng **Free Tier** ng Azure OpenAI para sa pag-aaral (kabilang ang 50,000 tokens/buwan)
- Patakbuhin ang `azd down` upang i-deallocate ang mga resource kapag hindi aktibong nagde-develop
- Magsimula sa consumption-based billing, i-upgrade sa PTU lamang para sa produksyon
- Gumamit ng `azd provision --preview` upang tantiyahin ang gastos bago ang deployment
- I-enable ang auto-scaling: magbayad lamang para sa aktwal na paggamit

**Pagsubaybay ng Gastos:**
```bash
# Suriin ang tinatayang buwanang gastos
azd provision --preview

# Subaybayan ang aktwal na gastos sa Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kabanata 3: Konfigurasyon at Authentication
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Tagal**: 45-60 minuto  
**Kakompleksidad**: ⭐⭐

#### Ano ang Matututuhan Mo
- Pamamahala at konfigurasyon ng environment
- Authentication at pinakamahusay na kasanayan sa seguridad
- Pagpapangalan at organisasyon ng mga resource

#### Mga Mapagkukunan ng Pagkatuto
- **📖 Konfigurasyon**: [Configuration Guide](docs/getting-started/configuration.md) - Pag-setup ng environment
- **🔐 Seguridad**: [Authentication patterns and managed identity](docs/getting-started/authsecurity.md) - Mga pattern ng authentication
- **📝 Mga Halimbawa**: [Database App Example](examples/database-app/README.md) - Mga halimbawa ng AZD Database

#### Mga Praktikal na Ehersisyo
- I-configure ang maramihang environment (dev, staging, prod)
- I-setup ang managed identity authentication
- Ipatupad ang configuration na nakabatay sa bawat environment

**💡 Kinalabasan ng Kabanata**: Pamahalaan ang maramihang environment na may tamang authentication at seguridad

---

### 🏗️ Kabanata 4: Infrastructure as Code & Deployment
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-3  
**Tagal**: 1-1.5 oras  
**Kakompleksidad**: ⭐⭐⭐

#### Ano ang Matututuhan Mo
- Advanced na mga pattern sa deployment
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resource

#### Mga Mapagkukunan ng Pagkatuto
- **📖 Deployment**: [Deployment Guide](docs/deployment/deployment-guide.md) - Kumpletong workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Pamamahala ng Azure resource
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized na deployment

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom na mga Bicep template
- Mag-deploy ng multi-service na mga aplikasyon
- Ipatupad ang blue-green deployment strategies

**💡 Kinalabasan ng Kabanata**: Mag-deploy ng kumplikadong multi-service na mga aplikasyon gamit ang custom na infrastructure template

---

### 🎯 Kabanata 5: Multi-Agent AI Solutions (Advanced)
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-2  
**Tagal**: 2-3 oras  
**Kakompleksidad**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga pattern ng multi-agent architecture
- Agent orchestration at coordination
- Mga AI deployment na handa para sa produksyon

#### Mga Mapagkukunan ng Pagkatuto
- **🤖 Tampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Isang-klik na pag-deploy
- **📖 Arkitektura**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Mga pattern

#### Mga Praktikal na Ehersisyo
```bash
# I-deploy ang kumpletong multi-agent na solusyon para sa retail
cd examples/retail-multiagent-arm-template
./deploy.sh

# Galugarin ang mga konfigurasyon ng mga ahente
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Layunin ng Kabanata**: I-deploy at pamahalaan ang production-ready multi-agent AI solution kasama ang mga ahenteng Customer at Inventory

---

### 🔍 Kabanata 6: Pagpapatunay at Pagpaplano bago ang Pag-deploy
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Tagal**: 1 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Pagpaplano ng kapasidad at pagpapatunay ng mga resource
- Mga estratehiya sa pagpili ng SKU
- Mga pre-flight check at awtomasyon

#### Mga Mapagkukunan ng Pag-aaral
- **📊 Pagpaplano**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Pagpapatunay ng mga resource
- **💰 Pagpili**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Mga matipid na pagpipilian
- **✅ Pagpapatunay**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Mga automated na script

#### Mga Praktikal na Ehersisyo
- Patakbuhin ang mga script para sa pagpapatunay ng kapasidad
- I-optimize ang pagpili ng SKU para sa gastos
- Ipatupad ang mga automated na pre-deployment check

**💡 Layunin ng Kabanata**: Patunayan at i-optimize ang mga deployment bago isagawa

---

### 🚨 Kabanata 7: Pagsasaayos at Pag-debug
**Mga Kinakailangan**: Nakumpleto ang kahit anong kabanata ng deployment  
**Tagal**: 1-1.5 oras  
**Kumplikado**: ⭐⭐

#### Ano ang Matututunan Mo
- Sistematikong mga pamamaraan ng pag-debug
- Karaniwang mga isyu at solusyon
- Pagsasaayos ng problema na partikular sa AI

#### Mga Mapagkukunan ng Pag-aaral
- **🔧 Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Pag-debug**: [Debugging Guide](docs/troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya
- **🤖 Isyu sa AI**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa serbisyo ng AI

#### Mga Praktikal na Ehersisyo
- Tukuyin ang mga pagkabigo sa deployment
- Lutasin ang mga isyu sa awtentikasyon
- I-debug ang konektividad ng serbisyo ng AI

**💡 Layunin ng Kabanata**: Malayang matukoy at malutas ang mga karaniwang isyu sa deployment

---

### 🏢 Kabanata 8: Mga Pattern para sa Produksyon at Enterprise
**Mga Kinakailangan**: Nakumpleto ang Mga Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututunan Mo
- Mga estratehiya sa deployment para sa produksyon
- Mga pattern ng seguridad para sa enterprise
- Pagmomonitor at pag-optimize ng gastos

#### Mga Mapagkukunan ng Pag-aaral
- **🏭 Produksyon**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Mga kumplikadong arkitektura
- **📊 Pagmomonitor**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Pagmomonitor

#### Mga Praktikal na Ehersisyo
- Ipatupad ang mga enterprise security pattern
- I-set up ang komprehensibong pagmomonitor
- Mag-deploy sa produksyon na may wastong pamamahala

**💡 Layunin ng Kabanata**: Mag-deploy ng mga application na handa para sa enterprise na may kumpletong kakayahan para sa produksyon

---

## 🎓 Pangkalahatang-ideya ng Workshop: Praktikal na Karanasan sa Pagkatuto

> **⚠️ ESTADO NG WORKSHOP: Aktibong Pag-unlad**  
> Ang mga materyales ng workshop ay kasalukuyang dine-develop at pinapahusay. Gumagana ang mga pangunahing module, ngunit ang ilang mga advanced na seksyon ay hindi pa kumpleto. Aktibo naming pinagtatrabahuhan ang pagkumpleto ng lahat ng nilalaman. [Sundan ang progreso →](workshop/README.md)

### Interaktibong Mga Materyales ng Workshop
**Komprehensibong praktikal na pagkatuto gamit ang mga browser-based na tool at ginagabayang mga ehersisyo**

Ang aming mga materyales sa workshop ay nagbibigay ng istrukturado, interaktibong karanasan sa pagkatuto na kumukumpleto sa kurikulum na nakaayos ayon sa mga kabanata sa itaas. Dinisenyo ang workshop para sa parehong self-paced na pagkatuto at mga sesyon na pinamumunuan ng instruktor.

#### 🛠️ Mga Tampok ng Workshop
- **Interface na Batay sa Browser**: Kumpletong workshop na pinatatakbo ng MkDocs na may mga feature na paghahanap, pagkopya, at tema
- **Integrasyon ng GitHub Codespaces**: Isang-klik na pag-setup ng development environment
- **Istrakturadong Landas ng Pagkatuto**: 7-hakbang na ginagabay na mga ehersisyo (3.5 oras kabuuan)
- **Discovery → Deployment → Customization**: Progresibong metodolohiya
- **Interactive DevContainer Environment**: Mga pre-configured na tool at dependencies

#### 📚 Istruktura ng Workshop
Sinusunod ng workshop ang metodolohiyang **Discovery → Deployment → Customization**:

1. **Yugto ng Discovery** (45 min)
   - Suriin ang mga template at serbisyo ng Microsoft Foundry
   - Unawain ang mga pattern ng multi-agent na arkitektura
   - Suriin ang mga kinakailangan at prerequisites para sa deployment

2. **Yugto ng Deployment** (2 oras)
   - Praktikal na pag-deploy ng mga AI application gamit ang AZD
   - I-configure ang mga Azure AI services at mga endpoint
   - Ipatupad ang mga pattern ng seguridad at awtentikasyon

3. **Yugto ng Customization** (45 min)
   - Baguhin ang mga application para sa mga tiyak na kaso ng paggamit
   - I-optimize para sa deployment sa produksyon
   - Ipatupad ang pagmomonitor at pamamahala ng gastos

#### 🚀 Pagsisimula sa Workshop
```bash
# Opsyon 1: GitHub Codespaces (Inirerekomenda)
# I-click "Code" → "Create codespace on main" sa repositoryo

# Opsyon 2: Lokal na pag-develop
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Sundin ang mga tagubilin sa pag-setup sa workshop/README.md
```

#### 🎯 Mga Layunin sa Pagkatuto ng Workshop
Sa pagkumpleto ng workshop, ang mga kalahok ay:
- **Mag-deploy ng Production AI Applications**: Gamitin ang AZD kasama ang mga serbisyo ng Microsoft Foundry
- **Maging dalubhasa sa Multi-Agent Architectures**: Ipatupad ang nakokoordinang mga solusyon ng mga AI ahente
- **Ipatupad ang Pinakamahuhusay na Praktika sa Seguridad**: I-configure ang awtentikasyon at kontrol sa akses
- **I-optimize para sa Pag-scale**: Magdisenyo ng cost-effective at high-performance na mga deployment
- **Mag-troubleshoot ng mga Deployment**: Lutasin nang mag-isa ang mga karaniwang isyu

#### 📖 Mga Mapagkukunan ng Workshop
- **🎥 Interaktibong Gabay**: [Workshop Materials](workshop/README.md) - Kapaligiran ng pagkatuto na nakabase sa browser
- **📋 Mga Hakbang-hakbang na Instruksyon**: [Guided Exercises](../../workshop/docs/instructions) - Detalyadong mga walkthrough
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Mga ehersisyong naka-pokus sa AI
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Pag-configure ng kapaligiran

**Perpekto para sa**: Pagsasanay sa korporasyon, kurso sa unibersidad, self-paced na pagkatuto, at mga developer bootcamp.

---

## 📖 Ano ang Azure Developer CLI?

Ang Azure Developer CLI (azd) ay isang command-line interface na nakatuon sa mga developer na nagpapabilis ng proseso ng pagbuo at pag-deploy ng mga application sa Azure. Nagbibigay ito ng:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa karaniwang mga pattern ng application
- **Infrastructure as Code** - Pamahalaan ang mga Azure resource gamit ang Bicep o Terraform  
- **Integrated workflows** - Walang putol na mag-provision, mag-deploy, at mag-monitor ng mga application
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng developer

### **AZD + Microsoft Foundry: Perpekto para sa AI Pag-deploy**

Bakit AZD para sa mga Solusyong AI? Tinutugunan ng AZD ang mga pangunahing hamon na kinakaharap ng mga AI developer:

- **AI-Ready Templates** - Mga pre-configured na template para sa Azure OpenAI, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Mga built-in na security pattern para sa mga serbisyo ng AI, API keys, at model endpoints  
- **Production AI Patterns** - Mga pinakamahusay na praktika para sa scalable, cost-effective na pag-deploy ng AI application
- **End-to-End AI Workflows** - Mula sa pag-develop ng modelo hanggang sa pag-deploy sa produksyon na may tamang pagmomonitor
- **Cost Optimization** - Matalinong alokasyon ng resource at mga estratehiya sa pag-scale para sa mga AI workload
- **Microsoft Foundry Integration** - Walang putol na koneksyon sa Microsoft Foundry model catalog at mga endpoint

---

## 🎯 Mga Template at Aklatan ng Mga Halimbawa

### Tampok: Mga Template ng Microsoft Foundry
**Magsimula dito kung nag-de-deploy ka ng mga AI application!**

> **Tandaan:** Ipinapakita ng mga template na ito ang iba't ibang pattern ng AI. Ang ilan ay mga external Azure Samples, ang iba ay lokal na implementasyon.

| Template | Kabanata | Kumplikado | Mga Serbisyo | Uri |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Panlabas |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Panlabas |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Panlabas |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Panlabas |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Panlabas |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Panlabas |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Tampok: Kumpletong Mga Senaryo sa Pagkatuto
**Mga template ng application na handa para sa produksyon na naka-map sa mga kabanata ng pagkatuto**

| Template | Kabanata ng Pagkatuto | Kumplikado | Pangunahing Natutuhan |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Pagkatuto Ayon sa Uri ng Halimbawa

> **📌 Lokal vs. Panlabas na Mga Halimbawa:**  
> **Lokal na Mga Halimbawa** (sa repo na ito) = Handa nang gamitin agad  
> **Panlabas na Mga Halimbawa** (Azure Samples) = I-clone mula sa mga naka-link na repositoryo

#### Lokal na Mga Halimbawa (Handa nang Gamitin)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kumpletong implementasyon na handa para sa produksyon kasama ang ARM templates
  - Multi-agent na arkitektura (mga ahenteng Customer at Inventory)
  - Komprehensibong pagmomonitor at ebalwasyon
  - Isang-klik na pag-deploy gamit ang ARM template

#### Lokal na Mga Halimbawa - Mga Container Application (Mga Kabanata 2-5)
**Komprehensibong mga halimbawa ng pag-deploy ng container sa repository na ito:**
- [**Container App Examples**](examples/container-app/README.md) - Kumpletong gabay sa pag-deploy ng containerized na mga aplikasyon
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Pangunahing REST API na may scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Pag-deploy ng multi-service na handa para sa produksyon
  - Quick Start, Production, at Advanced na mga pattern ng deployment
  - Patnubay sa pagmomonitor, seguridad, at pag-optimize ng gastos

#### Panlabas na Mga Halimbawa - Simpleng Mga Aplikasyon (Mga Kabanata 1-2)
**I-clone ang mga Azure Samples na repositoryo na ito para makapagsimula:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Pangunahing mga pattern ng deployment
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Pag-deploy ng static na nilalaman
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Pag-deploy ng REST API

#### Panlabas na Mga Halimbawa - Integrasyon ng Database (Mga Kabanata 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mga pattern ng konektibidad sa database
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless na workflow ng data

#### Panlabas na Mga Halimbawa - Advanced na Mga Pattern (Mga Kabanata 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service na mga arkitektura
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Mga pattern na handa para sa produksyon ng ML

### Panlabas na Koleksyon ng Mga Template
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Piniling koleksyon ng opisyal at community template
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentasyon ng template ng Microsoft Learn
- [**Examples Directory**](examples/README.md) - Lokal na mga halimbawa ng pagkatuto na may detalyadong paliwanag

---

## 📚 Mga Mapagkukunan sa Pagkatuto at Mga Sanggunian

### Mabilisang Sanggunian
- [**Cheat Sheet ng mga Command**](resources/cheat-sheet.md) - Mahahalagang azd na utos na inayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Karaniwang mga tanong na inayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga gawaing praktikal

### Hands-On Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga AI solution (2-3 oras)
- [**Interactive Workshop Guide**](workshop/README.md) - Browser-based na workshop gamit ang MkDocs at DevContainer Environment
- [**Structured Learning Path**](../../workshop/docs/instructions) - 7-hakbang na ginabay na mga ehersisyo (Discovery → Deployment → Customization)
- [**AZD For Beginners Workshop**](workshop/README.md) - Kumpletong hands-on na materyales ng workshop na may GitHub Codespaces integration

### External Learning Resources
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Karaniwang mga problema na nararanasan ng mga nagsisimula at agarang mga solusyon:**

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
# Subukan ang ibang rehiyon ng Azure
azd env set AZURE_LOCATION "westus2"
azd up

# O gumamit ng mas maliliit na SKU sa development
# I-edit ang infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" fails halfway through

```bash
# Opsyon 1: Linisin at subukan muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lang ang imprastruktura
azd provision

# Opsyon 3: Suriin ang mga detalyadong log
azd show
azd logs
```

### ❌ "Authentication failed" or "Token expired"

```bash
# Patunayan muli ang pagkakakilanlan
az logout
az login

azd auth logout
azd auth login

# Suriin ang pagpapatunay
az account show
```

### ❌ "Resource already exists" or naming conflicts

```bash
# Ang AZD ay gumagawa ng natatanging mga pangalan, ngunit kung may salungatan:
azd down --force --purge

# Muling subukan gamit ang sariwang kapaligiran
azd env new dev-v2
azd up
```

### ❌ Template deployment taking too long

**Karaniwang oras ng paghihintay:**
- Simpleng web app: 5-10 minuto
- App na may database: 10-15 minuto
- AI applications: 15-25 minuto (mabagal ang provisioning ng OpenAI)

```bash
# Suriin ang progreso
azd show

# Kung natigil nang higit sa 30 minuto, tingnan ang Azure Portal:
azd monitor
# Hanapin ang mga nabigong deployment
```

### ❌ "Permission denied" or "Forbidden"

```bash
# Suriin ang iyong role sa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa role na "Contributor"
# Hilingin sa admin ng Azure na ibigay:
# - Contributor (para sa mga resource)
# - User Access Administrator (para sa mga pagtatalaga ng role)
```

### ❌ Can't find deployed application URL

```bash
# Ipakita ang lahat ng mga endpoint ng serbisyo
azd show

# O buksan ang Azure Portal
azd monitor

# Suriin ang partikular na serbisyo
azd env get-values
# Hanapin ang mga *_URL na variable
```

### 📚 Kumpletong Mga Mapagkukunan sa Pag-troubleshoot

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Mabilis na Gabay sa Pag-troubleshoot

**Karaniwang mga problema na nararanasan ng mga nagsisimula at agarang mga solusyon:**

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

# Patunayan
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
# Opsyon 1: Linisin at subukang muli
azd down --force --purge
azd up

# Opsyon 2: Ayusin lang ang imprastruktura
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
# Ang AZD ay bumubuo ng mga natatanging pangalan, ngunit kung magkaroon ng konflikto:
azd down --force --purge

# Pagkatapos, subukang muli gamit ang bagong kapaligiran
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

# Kung natigil nang higit sa 30 minuto, tingnan ang Azure Portal:
azd monitor
# Hanapin ang mga nabigong deployment
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Suriin ang iyong role sa Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Kailangan mo ng hindi bababa sa role na "Contributor"
# Hilingin sa iyong Azure admin na magbigay ng:
# - Contributor (para sa mga resources)
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

### 📚 Kumpletong Mga Mapagkukunan sa Pag-troubleshoot

- **Common Issues Guide:** [Detailed Solutions](docs/troubleshooting/common-issues.md)
- **AI-Specific Issues:** [AI Troubleshooting](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Step-by-step Debugging](docs/troubleshooting/debugging.md)
- **Get Help:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Pagkumpleto ng Kurso at Sertipikasyon

### Pagsubaybay ng Progreso
Subaybayan ang iyong pagkatuto sa bawat kabanata:

- [ ] **Kabanata 1**: Pundasyon at Mabilis na Panimula ✅
- [ ] **Kabanata 2**: AI-First Development ✅  
- [ ] **Kabanata 3**: Configuration & Authentication ✅
- [ ] **Kabanata 4**: Infrastructure as Code & Deployment ✅
- [ ] **Kabanata 5**: Multi-Agent AI Solutions ✅
- [ ] **Kabanata 6**: Pre-Deployment Validation & Planning ✅
- [ ] **Kabanata 7**: Troubleshooting & Debugging ✅
- [ ] **Kabanata 8**: Production & Enterprise Patterns ✅

### Pagpapatunay ng Pagkatuto
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:
1. **Praktikal na Ehersisyo**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Knowledge Check**: Suriin ang FAQ section para sa iyong kabanata
3. **Community Discussion**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kahirapan

### Mga Benepisyo ng Pagkumpleto ng Kurso
Kapag nakumpleto ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Produksyon**: Nakapag-deploy ng tunay na AI applications sa Azure
- **Propesyonal na Kasanayan**: Kakayahang mag-deploy na handa para sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng Azure developer community
- **Pag-unlad ng Karera**: In-demand na kasanayan sa AZD at AI deployment

---

## 🤝 Komunidad at Suporta

### Kumuha ng Tulong at Suporta
- **Teknikal na Mga Isyu**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) at [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Tulong na Espesipiko sa AI**: Sumali sa [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentasyon**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Pananaw ng Komunidad mula sa Microsoft Foundry Discord

**Kamakailang Resulta ng Poll mula sa #Azure Channel:**
- **45%** ng mga developer gusto gamitin ang AZD para sa AI workloads
- **Nangungunang mga hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakahiniling**: AI-specific na mga template, troubleshooting guides, best practices

**Sumali sa aming komunidad para sa:**
- Ibahagi ang iyong mga karanasan sa AZD + AI at humingi ng tulong
- Ma-access ang mga maagang preview ng bagong AI templates
- Mag-ambag sa mga best practice para sa AI deployment
- Impluwensyahan ang hinaharap na pag-develop ng mga feature para sa AI + AZD

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang mga kontribusyon! Pakibasa ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye tungkol sa:
- **Pagpapabuti ng Nilalaman**: Pagandahin ang mga umiiral na kabanata at mga halimbawa
- **Bagong Mga Halimbawa**: Magdagdag ng mga totoong-situasyong scenario at mga template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng multi-language na suporta
- **Ulat ng Bug**: Pahusayin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong gabay ng komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Kaugnay na Microsoft Learning Resources

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pagkatuto:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j para sa Mga Nagsisimula](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js para sa Mga Nagsisimula](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD para sa Mga Nagsisimula](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI para sa Mga Nagsisimula](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP para sa Mga Nagsisimula](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents para sa Mga Nagsisimula](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative AI para sa Mga Nagsisimula](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Pangunahing Pagkatuto
[![ML para sa Mga Nagsisimula](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science para sa Mga Nagsisimula](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI para sa Mga Nagsisimula](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity para sa Mga Nagsisimula](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev para sa Mga Nagsisimula](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT para sa Mga Nagsisimula](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development para sa Mga Nagsisimula](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serye ng Copilot
[![Copilot para sa AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot para sa C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Pakikipagsapalaran ng Copilot](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Nabigasyon ng Kurso

**🚀 Handa nang Magsimulang Matuto?**

**Mga Nagsisimula**: Magsimula sa [Kabanata 1: Pundasyon & Mabilisang Simula](../..)  
**Mga AI Developer**: Tumalon sa [Kabanata 2: AI-First Development](../..)  
**Mga May Karanasang Developer**: Magsimula sa [Kabanata 3: Konfigurasyon & Pagpapatotoo](../..)

**Mga Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Paunawa:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin ng AI na Co-op Translator (https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o kamalian. Ang orihinal na dokumento sa kanyang likas na wika ang dapat ituring na awtoritatibong pinagmulan. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasaling‑tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->