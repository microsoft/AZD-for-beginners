<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T08:24:11+00:00",
  "source_file": "README.md",
  "language_code": "tl"
}
-->
# AZD Para sa Mga Baguhan: Isang Estrukturadong Paglalakbay sa Pag-aaral

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.tl.png) 

## Pagsisimula sa Kursong Ito

Sundin ang mga hakbang na ito upang simulan ang iyong pag-aaral sa AZD:

1. **I-fork ang Repository**: I-click ang [Fork](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **I-clone ang Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Sumali sa Komunidad**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) para sa suporta mula sa mga eksperto
4. **Piliin ang Iyong Landas sa Pag-aaral**: Pumili ng kabanata sa ibaba na naaayon sa iyong antas ng karanasan

### Suporta sa Iba't Ibang Wika

#### Awtomatikong Pagsasalin (Laging Napapanahon)

[Tagalog (Filipino)](./README.md)

## Pangkalahatang-ideya ng Kurso

Masterin ang Azure Developer CLI (azd) sa pamamagitan ng mga estrukturadong kabanata na idinisenyo para sa progresibong pag-aaral. **Espesyal na pokus sa pag-deploy ng mga AI application gamit ang Azure AI Foundry integration.**

### Bakit Mahalaga ang Kursong Ito para sa Modernong Mga Developer

Batay sa mga insight mula sa Azure AI Foundry Discord community, **45% ng mga developer ang nais gumamit ng AZD para sa AI workloads** ngunit nahihirapan sa:
- Kumplikadong multi-service AI architectures
- Mga pinakamahusay na kasanayan sa production AI deployment  
- Integrasyon at konfigurasyon ng Azure AI services
- Pag-optimize ng gastos para sa AI workloads
- Pag-troubleshoot ng mga isyu sa AI-specific deployment

### Mga Layunin sa Pag-aaral

Sa pagtatapos ng kursong ito, ikaw ay:
- **Masterin ang AZD Fundamentals**: Mga pangunahing konsepto, pag-install, at konfigurasyon
- **Mag-deploy ng AI Applications**: Gumamit ng AZD kasama ang Azure AI Foundry services
- **Magpatupad ng Infrastructure as Code**: Pamahalaan ang mga Azure resources gamit ang Bicep templates
- **Mag-troubleshoot ng Deployments**: Lutasin ang mga karaniwang isyu at mag-debug ng mga problema
- **Mag-optimize para sa Production**: Seguridad, scaling, monitoring, at pamamahala ng gastos
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
- Ang iyong unang matagumpay na deployment

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Ano ang Azure Developer CLI?](../..)
- **📖 Teorya**: [AZD Basics](docs/getting-started/azd-basics.md) - Mga pangunahing konsepto at terminolohiya
- **⚙️ Setup**: [Installation & Setup](docs/getting-started/installation.md) - Mga gabay batay sa platform
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
- Integrasyon ng Azure AI Foundry sa AZD
- Pag-deploy ng mga AI-powered applications
- Pag-unawa sa mga konfigurasyon ng AI services

#### Mga Mapagkukunan sa Pag-aaral
- **🎯 Simulan Dito**: [Integrasyon ng Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mga Pattern**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - Pag-deploy at pamamahala ng AI models
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Gawing AZD-ready ang iyong AI solutions
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
- **📝 Mga Halimbawa**: [Database App Example](../../examples/database-app) - Mga pattern ng konfigurasyon

#### Mga Praktikal na Ehersisyo
- Mag-configure ng maraming environment (dev, staging, prod)
- Mag-set up ng managed identity authentication
- Magpatupad ng environment-specific configurations

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
- **📝 Mga Halimbawa**: [Container App Example](../../examples/container-app) - Mga containerized deployments

#### Mga Praktikal na Ehersisyo
- Gumawa ng custom Bicep templates
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
- Mga production-ready AI deployments

#### Mga Mapagkukunan sa Pag-aaral
- **🤖 Itinatampok na Proyekto**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Kumpletong implementasyon
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

**💡 Resulta ng Kabanata**: Ma-deploy at ma-manage ang isang production-ready multi-agent AI solution na may Customer at Inventory agents

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
**Mga Kinakailangan**: Natapos ang anumang deployment chapter  
**Tagal**: 1-1.5 oras  
**Kahirapan**: ⭐⭐

#### Ano ang Iyong Matututunan
- Sistematikong mga approach sa debugging
- Mga karaniwang isyu at solusyon
- AI-specific troubleshooting

#### Mga Mapagkukunan sa Pag-aaral
- **🔧 Mga Karaniwang Isyu**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ at mga solusyon
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Step-by-step na mga estratehiya
- **🤖 AI Issues**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Mga problema sa AI services

#### Mga Praktikal na Ehersisyo
- Mag-diagnose ng deployment failures
- Lutasin ang mga isyu sa authentication
- Mag-debug ng connectivity ng AI services

**💡 Resulta ng Kabanata**: Independiyenteng ma-diagnose at ma-resolve ang mga karaniwang isyu sa deployment

---

### 🏢 Kabanata 8: Production at Enterprise Patterns
**Mga Kinakailangan**: Natapos ang Kabanata 1-4  
**Tagal**: 2-3 oras  
**Kahirapan**: ⭐⭐⭐⭐

#### Ano ang Iyong Matututunan
- Mga estratehiya sa production deployment
- Mga pattern ng seguridad para sa enterprise
- Monitoring at pag-optimize ng gastos

#### Mga Mapagkukunan sa Pag-aaral
- **🏭 Production**: [Production AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Mga pattern para sa enterprise
- **📝 Mga Halimbawa**: [Microservices Example](../../examples/microservices) - Kumplikadong arkitektura
- **📊 Pagsubaybay**: Application Insights integration

#### Mga Praktikal na Gawain
- Ipatupad ang mga pattern ng seguridad para sa enterprise
- Mag-set up ng komprehensibong pagsubaybay
- Mag-deploy sa production na may tamang pamamahala

**💡 Layunin ng Kabanata**: Mag-deploy ng mga application na handa para sa enterprise na may buong kakayahan sa production

---

## 📖 Ano ang Azure Developer CLI?

Ang Azure Developer CLI (azd) ay isang command-line interface na nakatuon sa mga developer na nagpapabilis sa proseso ng pagbuo at pag-deploy ng mga application sa Azure. Nagbibigay ito ng:

- **Template-based deployments** - Gumamit ng mga pre-built na template para sa karaniwang mga pattern ng application
- **Infrastructure as Code** - Pamahalaan ang mga resource ng Azure gamit ang Bicep o Terraform  
- **Integrated workflows** - Walang kahirap-hirap na mag-provision, mag-deploy, at mag-monitor ng mga application
- **Developer-friendly** - Na-optimize para sa produktibidad at karanasan ng mga developer

### **AZD + Azure AI Foundry: Perpekto para sa AI Deployments**

**Bakit AZD para sa AI Solutions?** Tinutugunan ng AZD ang mga pangunahing hamon na kinakaharap ng mga AI developer:

- **AI-Ready Templates** - Pre-configured na mga template para sa Azure OpenAI, Cognitive Services, at ML workloads
- **Secure AI Deployments** - Built-in na mga pattern ng seguridad para sa AI services, API keys, at model endpoints  
- **Production AI Patterns** - Mga pinakamahusay na kasanayan para sa scalable at cost-effective na AI application deployments
- **End-to-End AI Workflows** - Mula sa pagbuo ng modelo hanggang sa production deployment na may tamang pagsubaybay
- **Cost Optimization** - Matalinong alokasyon ng resource at mga estratehiya sa scaling para sa AI workloads
- **Azure AI Foundry Integration** - Walang kahirap-hirap na koneksyon sa AI Foundry model catalog at endpoints

---

## 🎯 Templates & Examples Library

### Itinatampok: Azure AI Foundry Templates
**Simulan dito kung magde-deploy ka ng AI applications!**

| Template | Kabanata | Complexity | Mga Serbisyo |
|----------|---------|------------|--------------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kabanata 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generate documents from your data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Improve client meetings with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernize your code with agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Build your conversational agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Unlock insights from conversational data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal content processing**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kabanata 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Itinatampok: Kumpletong Mga Learning Scenario
**Mga template ng application na handa para sa production na naka-map sa mga kabanata ng pag-aaral**

| Template | Kabanata ng Pag-aaral | Complexity | Pangunahing Natutunan |
|----------|-----------------------|------------|-----------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kabanata 2 | ⭐ | Mga pangunahing pattern ng AI deployment |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kabanata 2 | ⭐⭐ | RAG implementation gamit ang Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kabanata 4 | ⭐⭐ | Integrasyon ng Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kabanata 5 | ⭐⭐⭐ | Framework ng agent at function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kabanata 8 | ⭐⭐⭐ | Orkestrasyon ng enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kabanata 5 | ⭐⭐⭐⭐ | Arkitektura ng multi-agent na may Customer at Inventory agents |

### Pag-aaral Batay sa Uri ng Halimbawa

#### Simpleng Mga Application (Kabanata 1-2)
- [Simple Web App](../../examples/simple-web-app) - Mga pangunahing pattern ng deployment
- [Static Website](../../examples/static-site) - Deployment ng static na nilalaman
- [Basic API](../../examples/basic-api) - Deployment ng REST API

#### Integrasyon ng Database (Kabanata 3-4)  
- [Database App](../../examples/database-app) - Mga pattern ng koneksyon sa database
- [Data Processing](../../examples/data-processing) - Deployment ng ETL workflow

#### Advanced na Mga Pattern (Kabanata 4-8)
- [Container Apps](../../examples/container-app) - Mga containerized na deployment
- [Microservices](../../examples/microservices) - Multi-service na arkitektura  
- [Enterprise Solutions](../../examples/enterprise) - Mga pattern na handa para sa production

### Panlabas na Koleksyon ng Template
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Mga opisyal na sample mula sa Microsoft
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Mga template na kontribusyon ng komunidad
- [**Examples Directory**](examples/README.md) - Lokal na mga halimbawa ng pag-aaral na may detalyadong paliwanag

---

## 📚 Mga Learning Resources & Sanggunian

### Mabilisang Sanggunian
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Mahahalagang azd commands na nakaayos ayon sa kabanata
- [**Glossary**](resources/glossary.md) - Terminolohiya ng Azure at azd  
- [**FAQ**](resources/faq.md) - Karaniwang mga tanong na nakaayos ayon sa kabanata ng pag-aaral
- [**Study Guide**](resources/study-guide.md) - Komprehensibong mga praktikal na gawain

### Mga Hands-On Workshop
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Gawing AZD-deployable ang iyong mga AI solution
- [**AZD For Beginners Workshop**](workshop/README.md) - Kumpletong materyales para sa hands-on workshop

### Panlabas na Mga Learning Resource
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Pagtatapos ng Kurso & Sertipikasyon

### Pagsubaybay sa Pag-unlad
Subaybayan ang iyong pag-unlad sa pag-aaral sa bawat kabanata:

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
1. **Praktikal na Gawain**: Kumpletuhin ang hands-on deployment ng kabanata
2. **Pagsusuri ng Kaalaman**: Suriin ang FAQ section para sa iyong kabanata
3. **Diskusyon sa Komunidad**: Ibahagi ang iyong karanasan sa Azure Discord
4. **Susunod na Kabanata**: Lumipat sa susunod na antas ng kahirapan

### Mga Benepisyo ng Pagtatapos ng Kurso
Kapag natapos ang lahat ng kabanata, magkakaroon ka ng:
- **Karanasan sa Production**: Na-deploy ang mga tunay na AI application sa Azure
- **Propesyonal na Kasanayan**: Kakayahan sa deployment na handa para sa enterprise  
- **Pagkilala sa Komunidad**: Aktibong miyembro ng Azure developer community
- **Pag-unlad sa Karera**: Ekspertong AZD at AI deployment na in-demand

---

## 🤝 Komunidad & Suporta

### Humingi ng Tulong & Suporta
- **Mga Teknikal na Isyu**: [Mag-report ng bugs at mag-request ng features](https://github.com/microsoft/azd-for-beginners/issues)
- **Mga Tanong sa Pag-aaral**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **Tulong sa AI**: Sumali sa [#Azure channel](https://discord.gg/microsoft-azure) para sa AZD + AI Foundry discussions
- **Dokumentasyon**: [Opisyal na dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Mga Insight ng Komunidad mula sa Azure AI Foundry Discord

**Mga Resulta ng Kamakailang Poll mula sa #Azure Channel:**
- **45%** ng mga developer ay nais gumamit ng AZD para sa AI workloads
- **Mga pangunahing hamon**: Multi-service deployments, credential management, production readiness  
- **Pinakamarami ang hiniling**: AI-specific templates, troubleshooting guides, best practices

**Sumali sa aming komunidad upang:**
- Ibahagi ang iyong AZD + AI na karanasan at humingi ng tulong
- Mag-access ng maagang preview ng mga bagong AI template
- Mag-ambag sa mga pinakamahusay na kasanayan sa AI deployment
- Makaimpluwensya sa hinaharap na pag-unlad ng AI + AZD features

### Pag-aambag sa Kurso
Malugod naming tinatanggap ang mga kontribusyon! Pakibasa ang aming [Contributing Guide](CONTRIBUTING.md) para sa mga detalye sa:
- **Pagpapabuti ng Nilalaman**: Pagandahin ang mga umiiral na kabanata at halimbawa
- **Mga Bagong Halimbawa**: Magdagdag ng mga real-world na scenario at template  
- **Pagsasalin**: Tumulong sa pagpapanatili ng suporta sa multi-language
- **Pag-uulat ng Bug**: Pagbutihin ang katumpakan at kalinawan
- **Pamantayan ng Komunidad**: Sundin ang aming inklusibong mga alituntunin ng komunidad

---

## 📄 Impormasyon ng Kurso

### Lisensya
Ang proyektong ito ay lisensyado sa ilalim ng MIT License - tingnan ang [LICENSE](../../LICENSE) file para sa mga detalye.

### Kaugnay na Microsoft Learning Resources

Ang aming koponan ay gumagawa ng iba pang komprehensibong mga kurso sa pag-aaral:

- [**BAGO** Model Context Protocol (MCP) For Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents for Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generative AI for Beginners using .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generative AI for Beginners using Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML for Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science for Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI for Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity for Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Web Dev for Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT for Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Development for Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for AI Paired Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot for C#/.NET Developers](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Choose Your Own Copilot Adventure](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Pag-navigate sa Kurso

**🚀 Handa nang Magsimula sa Pag-aaral?**

**Mga Baguhan**: Simulan sa [Kabanata 1: Foundation & Quick Start](../..)  
**AI Developers**: Tumalon sa [Kabanata 2: AI-First Development](../..)
**Mga Karanasang Developer**: Magsimula sa [Kabanata 3: Konpigurasyon at Awtentikasyon](../..)

**Susunod na Hakbang**: [Simulan ang Kabanata 1 - AZD Pangunahing Kaalaman](docs/getting-started/azd-basics.md) →

---

**Paunawa**:  
Ang dokumentong ito ay isinalin gamit ang AI translation service na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't sinisikap naming maging tumpak, tandaan na ang mga awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa kanyang katutubong wika ang dapat ituring na opisyal na sanggunian. Para sa mahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na maaaring magmula sa paggamit ng pagsasaling ito.