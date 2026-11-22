# AZD Para sa mga Baguhan: Balangkas ng Kurso at Balangkas ng Pagkatuto

## Pangkalahatang-ideya ng Kurso

Maging bihasa sa Azure Developer CLI (azd) sa pamamagitan ng mga istrukturadong kabanata na dinisenyo para sa progresibong pagkatuto. **Espesyal na pokus sa pag-deploy ng mga AI application gamit ang integrasyon ng Microsoft Foundry.**

### Bakit Mahalagang Kumuha ng Kursong Ito para sa mga Modernong Developer

Kadalasang kailangan ng mga developer na nagde-deploy ng mga AI workload ang gabay sa:
- Masalimuot na multi-service AI architectures
- Pinakamahuhusay na kasanayan sa pag-deploy ng AI sa produksyon  
- Integrasyon at konfigurasyon ng Azure AI service
- Pag-optimize sa gastos para sa mga AI workload
- Pagsasaayos ng mga isyu sa pag-deploy na kaugnay ng AI

### Pangunahing Mga Layunin sa Pagkatuto

Sa pagtatapos ng istrukturadong kursong ito, ikaw ay:
- **Bihasa sa Mga Pangunahing Kaalaman ng AZD**: Pangunahing konsepto, pag-install, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gamitin ang AZD kasama ang mga serbisyo ng Microsoft Foundry
- **Ipatupad ang Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang mga Bicep template
- **Ayusin ang mga Pag-deploy**: Lutasin ang mga karaniwang isyu at mag-debug ng mga problema
- **Mag-optimize para sa Produksyon**: Seguridad, pag-scale, pagmamanman, at pamamahala ng gastos
- **Gumawa ng Multi-Agent Solutions**: Mag-deploy ng masalimuot na AI architectures

## 🎓 Karanasan sa Pagkatuto sa Workshop

### Mga Opsyon sa Flexible na Paraan ng Pagkatuto
Ang kursong ito ay idinisenyo upang suportahan ang parehong **sariling bilis na indibidwal na pagkatuto** at **pinangasiwaang mga sesyon ng workshop**, na nagpapahintulot sa mga mag-aaral na magkaroon ng praktikal na karanasan gamit ang AZD habang nagpapaunlad ng mga kasanayang praktikal sa pamamagitan ng mga interactive na ehersisyo.

#### 🚀 Paraan ng Sariling Bilis na Pagkatuto
**Perpekto para sa mga indibidwal na developer at tuloy-tuloy na pagkatuto**

**Mga Katangian:**
- **Browser-Based Interface**: Kumpletong MkDocs-powered workshop na maa-access sa anumang web browser
- **GitHub Codespaces Integration**: One-click na development environment na may pre-configured na mga tool
- **Interactive DevContainer Environment**: Hindi kailangan ng lokal na setup - agad simulan ang pag-cocode
- **Pagsubaybay sa Progreso**: May built-in checkpoints at mga ehersisyong pangberipikasyon
- **Suporta ng Komunidad**: Access sa Azure Discord channels para sa mga tanong at kolaborasyon

**Struktura ng Pagkatuto:**
- **Flexible Timing**: Tapusin ang mga kabanata ayon sa sariling bilis sa loob ng mga araw o linggo
- **Checkpoint System**: Beripikahin ang pagkatuto bago lumipat sa mas kumplikadong mga paksa
- **Resource Library**: Komprehensibong dokumentasyon, mga halimbawa, at mga gabay sa pagsasaayos
- **Pagbuo ng Portfolio**: Gumawa ng mga proyektong maaaring ideploy para sa propesyonal na mga portfolio

**Pagsisimula (Sariling Bilis):**
```bash
# Option 1: GitHub Codespaces (Recommended)
# Navigate to the repository and click "Code" → "Create codespace on main"

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow setup instructions in workshop/README.md
```

#### 🏛️ Pinangasiwaang Mga Sesyon ng Workshop
**Perpekto para sa pagsasanay sa korporasyon, bootcamps, at mga institusyong pang-edukasyon**

**Mga Opsyon sa Format ng Workshop:**

**📚 Integrasyon sa Akademikong Kurso (8-12 linggo)**
- **Mga Programa ng Unibersidad**: Semester-long na kurso na may lingguhang 2-oras na mga sesyon
- **Bootcamp Format**: Masigasig na 3-5 araw na programa na may araw-araw na 6-8 oras na sesyon
- **Pagsasanay sa Korporasyon**: Buwanang sesyon ng koponan na may praktikal na pagpapatupad ng proyekto
- **Balangkas sa Pagsusuri**: Mga graded na assignment, peer review, at mga panghuling proyekto

**🚀 Masigasig na Workshop (1-3 araw)**
- **Araw 1**: Pundasyon + AI Development (Mga Kabanata 1-2) - 6 na oras
- **Araw 2**: Konfigurasyon + Infrastructure (Mga Kabanata 3-4) - 6 na oras  
- **Araw 3**: Mga Advanced na Pattern + Produksyon (Mga Kabanata 5-8) - 8 na oras
- **Follow-up**: Opsyonal na 2-linggong mentorship para sa pagtatapos ng proyekto

**⚡ Executive Briefing (4-6 na oras)**
- **Strategic Overview**: Halaga ng AZD at epekto sa negosyo (1 oras)
- **Hands-On Demo**: Buong pag-deploy ng AI application (2 oras)
- **Review sa Arkitektura**: Mga pattern ng enterprise at pamamahala (1 oras)
- **Plano sa Pagpapatupad**: Estratehiya para sa pag-aampon ng organisasyon (1-2 oras)

#### 🛠️ Pamamaraan sa Pagkatuto sa Workshop
**Discovery → Deployment → Customization na paraan para sa praktikal na pag-develop ng kasanayan**

**Phase 1: Discovery (45 minuto)**
- **Paggalugad ng Template**: Suriin ang Microsoft Foundry templates at serbisyo
- **Pagsusuri ng Arkitektura**: Unawain ang mga multi-agent na pattern at mga estratehiya sa pag-deploy
- **Pagtasa ng Mga Pangangailangan**: Tukuyin ang mga pangangailangan at limitasyon ng organisasyon
- **Pagsasaayos ng Kapaligiran**: I-configure ang development environment at mga Azure resources

**Phase 2: Deployment (2 oras)**
- **Gabay sa Pagpapatupad**: Sunod-sunod na pag-deploy ng mga AI application gamit ang AZD
- **Konfigurasyon ng Serbisyo**: I-configure ang Azure AI services, endpoints, at authentication
- **Pagpapatupad ng Seguridad**: Ipatupad ang mga pattern ng seguridad ng enterprise at mga access control
- **Pagsubok sa Beripikasyon**: Suriin ang mga pag-deploy at ayusin ang mga karaniwang isyu

**Phase 3: Customization (45 minuto)**
- **Pagbabago ng Application**: I-adapt ang mga template para sa mga partikular na kaso at pangangailangan
- **Pag-optimize para sa Produksyon**: Ipatupad ang pagmamanman, pamamahala ng gastos, at mga estratehiya sa pag-scale
- **Mga Advanced na Pattern**: Suriin ang koordinasyon ng multi-agent at kumplikadong mga arkitektura
- **Plano para sa Susunod na Hakbang**: Tukuyin ang landas ng pagkatuto para sa patuloy na paglinang ng kasanayan

#### 🎯 Mga Kinalabasan sa Pagkatuto ng Workshop
**Nasusukat na kasanayang nadevelop sa pamamagitan ng hands-on na pagsasanay**

**Teknikal na Kasanayan:**
- **Mag-deploy ng Production AI Applications**: Matagumpay na mag-deploy at mag-configure ng mga solusyong pinapagana ng AI
- **Kahusayan sa Infrastructure as Code**: Gumawa at pamahalaan ang mga custom na Bicep template
- **Multi-Agent Architecture**: Magpatupad ng mga koordinadong AI agent solution
- **Kahandaan sa Produksyon**: Ipatupad ang mga pattern sa seguridad, pagmamanman, at pamamahala
- **Ekspertong Pagsasaayos ng Problema**: Malaya na lutasin ang mga isyu sa pag-deploy at konfigurasyon

**Propesyonal na Kasanayan:**
- **Pangunguna sa Proyekto**: Pamunuan ang mga teknikal na koponan sa mga inisyatibo sa pag-deploy sa ulap
- **Disenyo ng Arkitektura**: Disenyuhin ang mga scalable at cost-effective na solusyon sa Azure
- **Paglilipat ng Kaalaman**: Sanayin at mentor ang mga kasamahan sa mga pinakamahusay na kasanayan ng AZD
- **Strategic Planning**: Impluwensyahan ang mga estratehiyang adopsyon sa ulap ng organisasyon

#### 📋 Mga Kagamitan at Materyales sa Workshop
**Komprehensibong toolkit para sa mga facilitator at mag-aaral**

**Para sa mga Facilitator:**
- **Instructor Guide**: [Workshop Overview](workshop/README.md) - Gabay sa pagpaplano at paghahatid ng sesyon
- **Mga Materyal sa Presentasyon**: Slide decks, mga diagram ng arkitektura, at script ng demo
- **Mga Tool sa Pagsusuri**: Praktikal na mga ehersisyo, kaalaman sa pag-check, at mga rubric sa pagtatasa
- **Teknikal na Setup**: Konfigurasyon ng kapaligiran, mga gabay sa troubleshooting, at mga backup plan

**Para sa mga Mag-aaral:**
- **Interactive Workshop Environment**: [Workshop Materials](workshop/README.md) - Browser-based na platform para sa pagkatuto
- **Step-by-Step na Mga Instruksyon**: [Guided Exercises](../../workshop/docs/instructions) - Detalyadong walkthrough ng pagpapatupad  
- **Reference Documentation**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Malalalim na pagtalakay tungkol sa AI
- **Mga Mapagkukunan ng Komunidad**: Azure Discord channels, talakayan sa GitHub, at suporta mula sa eksperto

#### 🏢 Implementasyon ng Enterprise Workshop
**Mga estratehiya sa pag-deploy at pagsasanay ng organisasyon**

**Mga Programa sa Pagsasanay ng Korporasyon:**
- **Onboarding ng Developer**: Oryentasyon para sa bagong hire gamit ang mga pangunahing kaalaman sa AZD (2-4 na linggo)
- **Pagpapalawak ng Kasanayan ng Koponan**: Quarterly workshops para sa mga umiiral na koponan sa development (1-2 araw)
- **Review ng Arkitektura**: Buwanang sesyon para sa mga senior engineer at arkitekto (4 na oras)
- **Leadership Briefings**: Executive workshops para sa mga tagagawa ng teknikal na desisyon (kalahating araw)

**Suporta sa Implementasyon:**
- **Custom Workshop Design**: Nilalaman na iniangkop para sa mga tiyak na pangangailangan ng organisasyon
- **Pamamahala ng Pilot Program**: Istrakturang rollout na may mga sukatan ng tagumpay at feedback loop  
- **Patuloy na Mentorship**: Suporta matapos ang workshop para sa pagpapatupad ng proyekto
- **Pagbuo ng Komunidad**: Internal na mga komunidad ng Azure AI developer at pagbabahagi ng kaalaman

**Mga Sukatan ng Tagumpay:**
- **Pagkuha ng Kasanayan**: Mga pre/post assessment na sumusukat ng paglago sa teknikal na kakayahan
- **Tagumpay sa Pag-deploy**: Porsyento ng mga kalahok na matagumpay na nakakapag-deploy ng mga aplikasyon sa produksyon
- **Oras para sa Produktibidad**: Pinabuting oras ng onboarding para sa mga bagong proyekto sa Azure AI
- **Pagpapanatili ng Kaalaman**: Mga follow-up na pagsusuri 3-6 na buwan pagkatapos ng workshop

## 8-Kabanatang Balangkas ng Pagkatuto

### Kabanata 1: Pundasyon at Mabilis na Pagsisimula (30-45 minuto) 🌱
**Mga Kinakailangan**: Azure subscription, pangunahing kaalaman sa command line  
**Kumplikado**: ⭐

#### Ano ang Matututuhan Mo
- Pag-unawa sa mga pangunahing kaalaman ng Azure Developer CLI
- Pag-install ng AZD sa iyong platform  
- Ang iyong unang matagumpay na pag-deploy
- Pangunahing mga konsepto at terminolohiya

#### Mga Mapagkukunan sa Pagkatuto
- [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Pangunahing mga konsepto
- [Installation & Setup](docs/chapter-01-foundation/installation.md) - Mga gabay na tiyak sa platform
- [Your First Project](docs/chapter-01-foundation/first-project.md) - Hands-on na tutorial
- [Command Cheat Sheet](resources/cheat-sheet.md) - Mabilisang sanggunian

#### Praktikal na Kinalabasan
Matagumpay na mag-deploy ng isang simpleng web application sa Azure gamit ang AZD

---

### Kabanata 2: AI-First na Pag-develop (4-5 oras kasama ang workshop) 🤖
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Integrasyon ng Microsoft Foundry gamit ang AZD
- GA `microsoft.foundry` bundle installation at hosted-agent code deployment
- Pagsubok ng Local Agent Inspector at hiwalay na mga dataset/rubric sa ebalwasyon
- Pag-deploy ng mga AI-powered application
- Pag-unawa sa konfigurasyon ng AI service
- Mga pattern ng RAG (Retrieval-Augmented Generation)

#### Mga Mapagkukunan sa Pagkatuto
- [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- [Hosted-Agent Walkthrough (GA)](docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) - Simulan, repasuhin ang `azure.yaml`, mag-provision, subukan lokal, mag-deploy, suriin, at maglinis
- [AI Agents Guide](docs/chapter-02-ai-development/agents.md)
- [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md)
- [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - **BAGO**: Komprehensibong 2-3 oras na hands-on na lab
- [Interactive Workshop Guide](workshop/README.md) - **BAGO**: Browser-based workshop na may MkDocs preview
- [Microsoft Foundry Templates](README.md#featured-microsoft-foundry-templates)
- [Workshop Instructions](../../workshop/docs/instructions) - **BAGO**: Sunod-sunod na mga gabay na ehersisyo

#### Praktikal na Kinalabasan
Subukan ang isang hosted agent lokal at sa Foundry gamit ang GA bundle, repasuhin ang resulta ng ebalwasyon, at ihinlay ang paglilinis ng mga bagong proyekto at mga ginamit na muli. Ang hiwalay na RAG/workshop path ay sumasaklaw sa pag-configure ng AI-powered chat application.

#### Landas ng Pagkatuto sa Workshop (Opsyonal na Pagpapahusay)
**BAGONG Interactive na Karanasan**: [Kompletong Gabay sa Workshop](workshop/README.md)
1. **Discovery** (30 mins): Pagpili at pagsusuri ng template
2. **Deployment** (45 mins): Mag-deploy at beripikahin ang AI template functionality  
3. **Deconstruction** (30 mins): Unawain ang arkitektura at mga bahagi ng template
4. **Configuration** (30 mins): I-customize ang mga setting at parameter
5. **Customization** (45 mins): Baguhin at ulitin upang maging sa'yo ito
6. **Teardown** (15 mins): Linisin ang mga resources at unawain ang lifecycle
7. **Wrap-up** (15 mins): Mga susunod na hakbang at advanced na landas ng pagkatuto

---

### Kabanata 3: Konfigurasyon at Authentication (45-60 minuto) ⚙️
**Mga Kinakailangan**: Nakumpleto ang Kabanata 1  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Konfigurasyon at pamamahala ng kapaligiran
- Mga pinakamahuhusay na kasanayan sa authentication at seguridad
- Pagpapangalan at pagsasaayos ng mga resources
- Mga pag-deploy sa multi-environment

#### Mga Mapagkukunan sa Pagkatuto
- [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Pagsasaayos ng kapaligiran
- [Authentication & Security Patterns](docs/chapter-03-configuration/authsecurity.md) - Managed identity at Key Vault integration
- Mga halimbawa ng multi-environment

#### Praktikal na Kinalabasan
Pamahalaan ang maraming kapaligiran na may tamang authentication at seguridad

---

### Kabanata 4: Infrastructure as Code at Pag-deploy (1-1.5 oras) 🏗️
**Mga Kinakailangan**: Nakumpleto ang mga Kabanata 1-3  
**Kumplikado**: ⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga advanced na pattern sa pag-deploy
- Infrastructure as Code gamit ang Bicep
- Mga estratehiya sa provisioning ng resources
- Paggawa ng custom template

- Pag-deploy ng containerized application gamit ang Azure Container Apps at AZD

#### Mga Mapagkukunan sa Pagkatuto
- [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Kumpletong mga workflow
- [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Pamamahala ng resources
- Mga halimbawa ng container at microservices
- [Container App Examples](examples/container-app/README.md) - Mabilisang pagsisimula, produksyon, at advanced na mga pattern sa pag-deploy

#### Praktikal na Kinalabasan
Mag-deploy ng masalimuot na multi-service application gamit ang mga custom na infrastructure template

---

### Kabanata 5: Multi-Agent AI Solutions (2-3 oras) 🤖🤖
**Mga Kinakailangan**: Nakumpleto ang mga Kabanata 1-2  
**Kumplikado**: ⭐⭐⭐⭐

#### Ano ang Matututuhan Mo
- Mga pattern ng multi-agent architecture
- Orkestrasyon at koordinasyon ng mga agent
- Mga AI deployment na handa na para sa produksyon
- Mga implementasyon ng Customer at Inventory agent

- Integrasyon ng containerized microservices bilang bahagi ng mga agent-based solution

#### Mga Mapagkukunan sa Pagkatuto
- [Retail Multi-Agent Solution](examples/retail-scenario.md) - Blueprint ng arkitektura, hindi isang kompletong aplikasyon
- [ARM Template Package](../../examples/retail-multiagent-arm-template) - Scaffold ng infrastructure na may mga kinakailangang implementasyon
- Mga pattern ng koordinasyon ng multi-agent
- [Microservices Architecture Example](../../examples/container-app/microservices) - Komunikasyon mula serbisyo-sa-serbisyo, async messaging, at pag-deploy sa produksyon

#### Praktikal na Kinalabasan
Disenyuhin ang isang multi-agent AI solution at tukuyin ang kinakailangang implementasyon ng aplikasyon, beripikasyon, at operasyon maliban sa provisioning ng infrastructure

---

### Kabanata 6: Pre-Deployment Validation at Pagpaplano (1 oras) 🔍
**Mga Kinakailangan**: Nakumpleto ang Kabanata 4  
**Kumplikado**: ⭐⭐

#### Ano ang Matututuhan Mo
- Pagpaplano sa kapasidad at beripikasyon ng resources
- Mga estratehiya sa pagpili ng SKU
- Pre-flight checks at automation
- Pagpaplano sa pag-optimize ng gastos

#### Mga Mapagkukunan sa Pagkatuto
- [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Beripikasyon ng resources
- [Pagpili ng SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Mga cost-effective na pagpipilian
- [Mga Pre-flight na Pagsusuri](docs/chapter-06-pre-deployment/preflight-checks.md) - Mga automated na script
- [Integrasyon ng Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring at obserbabilidad
- [Mga Pattern ng Multi-Agent Coordination](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mga estratehiya ng koordinasyon ng ahente

#### Praktikal na Kinalabasan
Patunayan at i-optimize ang mga deployment bago ang pagpapatupad

---

### Kabanata 7: Troubleshooting at Debugging (1-1.5 na oras) 🔧
**Mga Kinakailangan**: Nakumpletong anumang kabanata sa deployment  
**Kompleksidad**: ⭐⭐

#### Mga Matututuhan Mo
- Sistematikong mga pamamaraan sa debugging
- Mga karaniwang isyu at mga solusyon
- Pag-troubleshoot na nakatutok sa AI
- Pag-optimize ng pagganap

#### Mga Mapagkukunan sa Pag-aaral
- [Mga Karaniwang Isyu](docs/chapter-07-troubleshooting/common-issues.md) - FAQ at mga solusyon
- [Gabay sa Debugging](docs/chapter-07-troubleshooting/debugging.md) - Mga hakbang-hakbang na estratehiya
- [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Mga problema sa serbisyo ng AI

#### Praktikal na Kinalabasan
Makapag-diagnose at makapag-ayos ng mga karaniwang isyu sa deployment nang mag-isa

---

### Kabanata 8: Mga Pattern sa Produksyon at Enterprise (2-3 na oras) 🏢
**Mga Kinakailangan**: Nakumpletong mga Kabanata 1-4  
**Kompleksidad**: ⭐⭐⭐⭐

#### Mga Matututuhan Mo
- Mga estratehiya sa production deployment
- Mga pattern ng seguridad sa enterprise
- Monitoring at pag-optimize ng gastos
- Scalability at pamamahala

- Pinakamahuhusay na kasanayan para sa production container app deployment (seguridad, monitoring, gastos, CI/CD)

#### Mga Mapagkukunan sa Pag-aaral
- [Pinakamahuhusay na Kasanayan sa Production AI](docs/chapter-08-production/production-ai-practices.md) - Mga pattern ng enterprise
- Mga halimbawa ng microservices at enterprise
- Mga framework para sa monitoring at pamamahala
- [Halimbawa ng Arkitektura ng Microservices](../../examples/container-app/microservices) - Blue-green/canary deployment, distributed tracing, at pag-optimize ng gastos

#### Praktikal na Kinalabasan
Mag-deploy ng mga aplikasyong handa na para sa enterprise na may buong kakayahan sa produksyon

---

## Progresyon ng Pagkatuto at Kompleksidad

### Pagsusulong ng Kasanayan

- **🌱 Mga Baguhan**: Magsimula sa Kabanata 1 (Pundasyon) → Kabanata 2 (AI Development)
- **🔧 Intermediate**: Mga Kabanata 3-4 (Configuration & Infrastructure) → Kabanata 6 (Validation)
- **🚀 Advanced**: Kabanata 5 (Multi-Agent Solutions) → Kabanata 7 (Troubleshooting)
- **🏢 Enterprise**: Kumpletuhin ang lahat ng kabanata, magpokus sa Kabanata 8 (Production Patterns)

- **Daan ng Container App**: Mga Kabanata 4 (Containerized deployment), 5 (Microservices integration), 8 (Pinakamahuhusay sa Produksyon)

### Mga Palatandaan ng Kompleksidad

- **⭐ Basic**: Isa lamang ang konsepto, gabay na mga tutorial, 30-60 minuto
- **⭐⭐ Intermediate**: Maramihang mga konsepto, gawa-gawang praktis, 1-2 na oras  
- **⭐⭐⭐ Advanced**: Masalimuot na mga arkitektura, pasadyang mga solusyon, 1-3 na oras
- **⭐⭐⭐⭐ Expert**: Mga production system, mga pattern sa enterprise, 2-4 na oras

### Flexible na mga Daan sa Pagkatuto

#### 🎯 AI Developer Fast Track (4-6 na oras)
1. **Kabanata 1**: Pundasyon at Quick Start (45 minuto)
2. **Kabanata 2**: AI-First Development (2 oras)  
3. **Kabanata 5**: Multi-Agent AI Solutions (3 oras)
4. **Kabanata 8**: Pinakamahuhusay na Kasanayan sa Production AI (1 oras)

#### 🛠️ Daan ng Infrastructure Specialist (5-7 na oras)
1. **Kabanata 1**: Pundasyon at Quick Start (45 minuto)
2. **Kabanata 3**: Configuration at Authentication (1 oras)
3. **Kabanata 4**: Infrastructure as Code at Deployment (1.5 na oras)
4. **Kabanata 6**: Pre-Deployment Validation at Planning (1 oras)
5. **Kabanata 7**: Troubleshooting at Debugging (1.5 na oras)
6. **Kabanata 8**: Production at Enterprise Patterns (2 oras)

#### 🎓 Kumpletong Paglalakbay sa Pagkatuto (8-12 na oras)
Sunud-sunod na pagkumpleto ng lahat ng 8 kabanata na may gawa-gawang praktis at pagpapatunay

## Balangkas ng Pagkumpleto ng Kurso

### Pagpapatunay ng Kaalaman
- **Mga Checkpoint sa Kabanata**: Mga praktikal na pagsasanay na may masukat na kinalabasan
- **Pagpapatunay na Hands-On**: Mag-deploy ng gumaganang mga solusyon para sa bawat kabanata
- **Pagsubaybay ng Progreso**: Mga visual na palatandaan at badge ng pagkumpleto
- **Pagpapatunay ng Komunidad**: Ibahagi ang mga karanasan sa mga channel ng Azure Discord

### Pagtatasa ng Mga Kinalabasang Pagkatuto

#### Pagkumpleto ng Kabanata 1-2 (Pundasyon + AI)
- ✅ Mag-deploy ng simpleng web application gamit ang AZD
- ✅ Mag-deploy ng AI-powered chat application gamit ang RAG
- ✅ Unawain ang mga pangunahing konsepto ng AZD at integrasyon ng AI

#### Pagkumpleto ng Kabanata 3-4 (Configuration + Infrastructure)  
- ✅ Pamahalaan ang multi-environment deployments
- ✅ Lumikha ng pasadyang mga Bicep infrastructure template
- ✅ Magpatupad ng mga secure authentication pattern

#### Pagkumpleto ng Kabanata 5-6 (Multi-Agent + Validation)
- ✅ Mag-deploy ng komplikadong multi-agent AI solution
- ✅ Magsagawa ng capacity planning at cost optimization
- ✅ Magpatupad ng automated pre-deployment validation

#### Pagkumpleto ng Kabanata 7-8 (Troubleshooting + Production)
- ✅ Mag-debug at mag-ayos ng mga isyu sa deployment nang mag-isa  
- ✅ Magpatupad ng enterprise-grade monitoring at security
- ✅ Mag-deploy ng mga production-ready na aplikasyon na may pamamahala

### Sertipikasyon at Pagkilala
- **Badge ng Pagkumpleto ng Kurso**: Kumpletuhin ang lahat ng 8 kabanata na may praktikal na pagpapatunay
- **Pagkilala ng Komunidad**: Aktibong partisipasyon sa Microsoft Foundry Discord
- **Propesyonal na Pag-unlad**: Mga kasanayang nauugnay sa industriya sa AZD at AI deployment
- **Pagsulong sa Karera**: Kakayahang mag-deploy ng cloud para sa enterprise

## 🎓 Komprehensibong Mga Kinalabasang Pagkatuto

### Antas ng Pundasyon (Mga Kabanata 1-2)
Sa pagkumpleto ng mga kabanata sa pundasyon, ipapakita ng mga mag-aaral:

**Teknikal na Kakayahan:**
- Mag-deploy ng simpleng web applications sa Azure gamit ang mga utos ng AZD
- Mag-configure at mag-deploy ng AI-powered chat application gamit ang RAG
- Unawain ang mga pangunahing konsepto ng AZD: mga template, mga environment, workflows ng provisioning
- I-integrate ang mga serbisyo ng Microsoft Foundry sa mga deployment ng AZD
- Mag-navigate sa mga configuration ng Azure AI service at mga API endpoint

**Propesyonal na Kasanayan:**
- Sundin ang mga istrakturang workflow ng deployment para sa pare-parehong resulta
- Mag-troubleshoot ng mga pangunahing isyu sa deployment gamit ang mga logs at dokumentasyon
- Makipagkomunika nang epektibo tungkol sa mga proseso ng cloud deployment
- Mag-aplay ng pinakamahuhusay na paraan para sa secure na integrasyon ng AI service

**Pagpapatunay ng Pagkatuto:**
- ✅ Matagumpay na mag-deploy ng `todo-nodejs-mongo` template
- ✅ Mag-deploy at mag-configure ng `azure-search-openai-demo` gamit ang RAG
- ✅ Kumpletuhin ang mga interaktibong pagsasanay sa workshop (Discovery phase)
- ✅ Makilahok sa mga talakayan sa komunidad ng Azure Discord

### Antas ng Intermediate (Mga Kabanata 3-4)
Sa pagkumpleto ng mga intermediate na kabanata, ipapakita ng mga mag-aaral:

**Teknikal na Kakayahan:**
- Pamahalaan ang multi-environment na mga deployment (dev, staging, production)
- Lumikha ng pasadyang mga Bicep template para sa infrastructure as code
- Magpatupad ng secure authentication patterns gamit ang managed identity
- Mag-deploy ng komplikadong multi-service applications na may pasadyang mga configuration
- I-optimize ang mga estratehiya ng provisioning ng resource para sa gastos at pagganap

**Propesyonal na Kasanayan:**
- Disenyo ng scalable na mga arkitektura ng imprastraktura
- Magpatupad ng pinakamahuhusay na paraan sa seguridad para sa mga cloud deployment
- Dokumentuhin ang mga pattern ng imprastraktura para sa pakikipagtulungan ng koponan
- Suriin at pumili ng angkop na mga serbisyo ng Azure para sa mga pangangailangan

**Pagpapatunay ng Pagkatuto:**
- ✅ Mag-configure ng magkahiwalay na mga environment gamit ang mga setting na animo'y environment-specific
- ✅ Lumikha at mag-deploy ng pasadyang Bicep template para sa multi-service application
- ✅ Magpatupad ng managed identity authentication para sa secure na access
- ✅ Kumpletuhin ang mga pagsasanay sa configuration management gamit ang mga totoong senaryo

### Antas ng Advanced (Mga Kabanata 5-6)
Sa pagkumpleto ng mga advanced na kabanata, ipapakita ng mga mag-aaral:

**Teknikal na Kakayahan:**
- Mag-deploy at mag-orchestrate ng multi-agent AI solutions na may koordinadong workflows
- Magpatupad ng mga arkitektura ng Customer at Inventory agent para sa mga retail na senaryo
- Magsagawa ng komprehensibong capacity planning at pagpapatunay ng resource
- Mag-execute ng automated pre-deployment validation at optimization
- Magdisenyo ng mga cost-effective na pagpili ng SKU batay sa mga pangangailangan ng workload

**Propesyonal na Kasanayan:**
- Magdisenyo ng komplikadong AI solutions para sa mga production environment
- Pinamunuan ang mga teknikal na talakayan tungkol sa mga estratehiya ng AI deployment
- Magmentora sa mga junior na developer sa pinakamahusay na praktis sa AZD at AI deployment
- Suriin at irekomenda ang mga pattern ng AI architecture para sa mga pangangailangan ng negosyo

**Pagpapatunay ng Pagkatuto:**
- ✅ Suriin ang retail multi-agent blueprint at tukuyin ang na-provision na imprastraktura mula sa nawawalang implementasyon ng aplikasyon
- ✅ Ipakita ang koordinasyon ng ahente at workflow orchestration
- ✅ Kumpletuhin ang mga pagsasanay sa capacity planning gamit ang totoong limitasyon ng resource
- ✅ Patunayan ang kahandaan sa deployment sa pamamagitan ng automated na pre-flight checks

### Antas ng Eksperto (Mga Kabanata 7-8)
Sa pagkumpleto ng mga eksperto na kabanata, ipapakita ng mga mag-aaral:

**Teknikal na Kakayahan:**
- Mag-diagnose at mag-ayos ng masalimuot na isyu sa deployment nang mag-isa
- Magpatupad ng enterprise-grade na mga pattern sa seguridad at mga balangkas ng pamamahala
- Magdisenyo ng komprehensibong mga estratehiya sa monitoring at alerting
- I-optimize ang mga production deployment para sa scalability, gastos, at pagganap
- Magtatag ng mga CI/CD pipeline na may tamang testing at pagpapatunay

**Propesyonal na Kasanayan:**
- Pangunahan ang mga inisyatiba sa enterprise cloud transformation
- Magdisenyo at magpatupad ng mga pamantayan ng deployment ng organisasyon
- Mag-train at mag-mentora ng mga development team sa advanced na mga praktis ng AZD
- Makaimpluwensya sa teknikal na pagdedesisyon para sa mga enterprise AI deployment

**Pagpapatunay ng Pagkatuto:**
- ✅ Ayusin ang mga malalalim na pagkabigo sa multi-service deployment
- ✅ Magpatupad ng mga enterprise security pattern na may pagsunod sa mga kinakailangan
- ✅ Magdisenyo at mag-deploy ng production monitoring gamit ang Application Insights
- ✅ Kumpletuhin ang pagpapatupad ng balangkas ng enterprise governance

## 🎯 Sertipikasyon sa Pagkumpleto ng Kurso

### Balangkas ng Pagsubaybay ng Progreso
Subaybayan ang iyong pag-usad sa pag-aaral sa pamamagitan ng mga istrakturang checkpoint:

- [ ] **Kabanata 1**: Pundasyon at Quick Start ✅
- [ ] **Kabanata 2**: AI-First Development ✅  
- [ ] **Kabanata 3**: Configuration at Authentication ✅
- [ ] **Kabanata 4**: Infrastructure as Code at Deployment ✅
- [ ] **Kabanata 5**: Multi-Agent AI Solutions ✅
- [ ] **Kabanata 6**: Pre-Deployment Validation at Planning ✅
- [ ] **Kabanata 7**: Troubleshooting at Debugging ✅
- [ ] **Kabanata 8**: Production at Enterprise Patterns ✅

### Proseso ng Pagpapatunay
Pagkatapos makumpleto ang bawat kabanata, patunayan ang iyong kaalaman sa pamamagitan ng:

1. **Pagsasagawa ng Praktikal na Ehersisyo**: Mag-deploy ng gumaganang mga solusyon para sa bawat kabanata
2. **Pagtatasa ng Kaalaman**: Balikan ang mga bahagi ng FAQ at kumpletuhin ang mga self-assessment
3. **Pakikilahok sa Komunidad**: Ibahagi ang mga karanasan at kumuha ng feedback sa Azure Discord
4. **Pagbuo ng Portfolio**: Idokumento ang iyong mga deployment at mga natutunang aral
5. **Peer Review**: Makipagtulungan sa ibang mga mag-aaral sa mga komplikadong senaryo

### Mga Benepisyo ng Pagkumpleto ng Kurso
Sa pagkumpleto ng lahat ng kabanata na may pagpapatunay, magkakaroon ang mga nagtapos ng:

**Teknikal na Ekspertis:**
- **Karanasan sa Produksyon**: Nakapag-deploy ng mga totoong AI na aplikasyon sa mga kapaligiran ng Azure
- **Propesyonal na Kasanayan**: Kakayahan sa enterprise-ready deployment at troubleshooting  
- **Kaalaman sa Arkitektura**: Mga multi-agent AI solution at mga kumplikadong pattern sa imprastraktura
- **Kakayahan sa Troubleshooting**: Malaya na paglutas ng mga isyu sa deployment at configuration

**Propesyonal na Pag-unlad:**
- **Pagkilala ng Industriya**: Mapatunayan na mga kasanayan sa mga high-demand na lugar ng AZD at AI deployment
- **Pagsulong sa Karera**: Kwalipikasyon para sa mga papel ng cloud architect at AI deployment specialist
- **Pamumuno sa Komunidad**: Aktibong pagiging miyembro ng mga Azure developer at AI communities
- **Patuloy na Pagkatuto**: Pundasyon para sa advanced na pagsasanay sa Microsoft Foundry

**Mga Ari-arian ng Portfolio:**
- **Mga Na-deploy na Solusyon**: Gumaganang mga halimbawa ng AI applications at pattern ng imprastraktura
- **Dokumentasyon**: Malawakang mga gabay sa deployment at mga pamamaraan sa troubleshooting  
- **Kontribusyon sa Komunidad**: Mga talakayan, halimbawa, at mga pagbuti na ibinahagi sa Azure community
- **Propesyonal na Network**: Mga koneksyon sa mga eksperto sa Azure at mga practitioner ng AI deployment

### Post-Kurso na Landas sa Pagkatuto
Handang-handa ang mga nagtapos para sa advanced na espesyalidad sa:
- **Microsoft Foundry Expert**: Malalim na espesyalisasyon sa deployment at orchestration ng AI model
- **Pamumuno sa Cloud Architecture**: Disenyo at pamamahala ng deployment sa enterprise-scale
- **Pamumuno sa Developer Community**: Pagsusulong sa mga halimbawa at mga mapagkukunan ng komunidad sa Azure
- **Corporate Training**: Pagtuturo ng mga kasanayan sa AZD at AI deployment sa loob ng mga organisasyon

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->