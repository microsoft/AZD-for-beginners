<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-18T06:45:42+00:00",
  "source_file": "README.md",
  "language_code": "nl"
}
-->
# AZD Voor Beginners: Een Gestructureerde Leerreis

![AZD-voor-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.nl.png) 

## Aan de slag met deze cursus

Volg deze stappen om je AZD-leerreis te beginnen:

1. **Fork de repository**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone de repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Word lid van de community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) voor deskundige ondersteuning
4. **Kies je leerpad**: Selecteer een hoofdstuk hieronder dat past bij jouw ervaringsniveau

### Ondersteuning voor meerdere talen

#### Geautomatiseerde vertalingen (Altijd up-to-date)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](./README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Cursusoverzicht

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken die zijn ontworpen voor stapsgewijze vooruitgang. **Speciale focus op het implementeren van AI-toepassingen met Azure AI Foundry-integratie.**

### Waarom deze cursus essentieel is voor moderne ontwikkelaars

Gebaseerd op inzichten uit de Azure AI Foundry Discord-community, **wil 45% van de ontwikkelaars AZD gebruiken voor AI-werkbelastingen**, maar ze lopen tegen uitdagingen aan zoals:
- Complexe AI-architecturen met meerdere services
- Best practices voor productie-implementatie van AI
- Integratie en configuratie van Azure AI-services
- Kostenoptimalisatie voor AI-werkbelastingen
- Problemen oplossen bij AI-specifieke implementaties

### Leerdoelen

Door deze gestructureerde cursus te voltooien, leer je:
- **Beheers AZD Basisprincipes**: Kernconcepten, installatie en configuratie
- **Implementeer AI-toepassingen**: Gebruik AZD met Azure AI Foundry-services
- **Voer Infrastructure as Code uit**: Beheer Azure-resources met Bicep-sjablonen
- **Los implementatieproblemen op**: Los veelvoorkomende problemen op en debug
- **Optimaliseer voor productie**: Beveiliging, schaalbaarheid, monitoring en kostenbeheer
- **Bouw oplossingen met meerdere agents**: Implementeer complexe AI-architecturen

## 📚 Leerhoofdstukken

*Kies je leerpad op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Basis & Snelle Start
**Vereisten**: Azure-abonnement, basiskennis van de commandoregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je leert
- Begrip van de basisprincipes van Azure Developer CLI
- AZD installeren op jouw platform
- Je eerste succesvolle implementatie

#### Leermaterialen
- **🎯 Begin hier**: [Wat is Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD Basisprincipes](docs/getting-started/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Installatie**: [Installatie & Setup](docs/getting-started/installation.md) - Platformspecifieke gidsen
- **🛠️ Praktijk**: [Je eerste project](docs/getting-started/first-project.md) - Stapsgewijze tutorial
- **📋 Snelle referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische oefeningen
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultaat van het hoofdstuk**: Een eenvoudige webapplicatie succesvol implementeren op Azure met AZD

---

### 🤖 Hoofdstuk 2: AI-First Ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Integratie van Azure AI Foundry met AZD
- AI-aangedreven toepassingen implementeren
- Begrip van AI-serviceconfiguraties

#### Leermaterialen
- **🎯 Begin hier**: [Azure AI Foundry Integratie](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Patronen**: [AI Model Implementatie](docs/ai-foundry/ai-model-deployment.md) - AI-modellen implementeren en beheren
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **📋 Sjablonen**: [Azure AI Foundry Sjablonen](../..)

#### Praktische oefeningen
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultaat van het hoofdstuk**: Een AI-aangedreven chatapplicatie met RAG-functionaliteiten implementeren en configureren

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Omgevingsconfiguratie en -beheer
- Authenticatie en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leermaterialen
- **📖 Configuratie**: [Configuratiegids](docs/getting-started/configuration.md) - Omgevingsinstellingen
- **🔐 Beveiliging**: Authenticatiepatronen en beheerde identiteit
- **📝 Voorbeelden**: [Database App Voorbeeld](../../examples/database-app) - Configuratiepatronen

#### Praktische oefeningen
- Meerdere omgevingen configureren (dev, staging, prod)
- Beheerde identiteit authenticatie instellen
- Omgevingsspecifieke configuraties implementeren

**💡 Resultaat van het hoofdstuk**: Meerdere omgevingen beheren met correcte authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructure as Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je leert
- Geavanceerde implementatiepatronen
- Infrastructure as Code met Bicep
- Resource provisioning strategieën

#### Leermaterialen
- **📖 Implementatie**: [Implementatiegids](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Resources Provisioning](docs/deployment/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container App Voorbeeld](../../examples/container-app) - Containerized implementaties

#### Praktische oefeningen
- Aangepaste Bicep-sjablonen maken
- Applicaties met meerdere services implementeren
- Blue-green implementatiestrategieën toepassen

**💡 Resultaat van het hoofdstuk**: Complexe applicaties met meerdere services implementeren met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-Agent AI Oplossingen (Geavanceerd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Patronen voor multi-agent architecturen
- Orchestratie en coördinatie van agents
- Productieklaar AI-implementaties

#### Leermaterialen
- **🤖 Uitgelicht project**: [Retail Multi-Agent Oplossing](examples/retail-scenario.md) - Complete implementatie
- **🛠️ ARM Sjablonen**: [ARM Sjabloonpakket](../../examples/retail-multiagent-arm-template) - Eén-klik implementatie
- **📖 Architectuur**: Patronen voor multi-agent coördinatie

#### Praktische oefeningen
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultaat van het hoofdstuk**: Een productieklaar multi-agent AI-oplossing implementeren en beheren met Klant- en Inventarisagents

---

### 🔍 Hoofdstuk 6: Validatie & Planning vóór Implementatie
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Capaciteitsplanning en resourcevalidatie
- Strategieën voor SKU-selectie
- Pre-flight checks en automatisering

#### Leermaterialen
- **📊 Planning**: [Capaciteitsplanning](docs/pre-deployment/capacity-planning.md) - Resourcevalidatie
- **💰 Selectie**: [SKU Selectie](docs/pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische oefeningen
- Capaciteitsvalidatiescripts uitvoeren
- SKU-selecties optimaliseren voor kosten
- Geautomatiseerde pre-implementatiechecks implementeren

**💡 Resultaat van het hoofdstuk**: Implementaties valideren en optimaliseren vóór uitvoering

---

### 🚨 Hoofdstuk 7: Problemen oplossen & Debuggen
**Vereisten**: Elk implementatiehoofdstuk voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Systematische debugbenaderingen
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leermaterialen
- **🔧 Veelvoorkomende problemen**: [Veelvoorkomende Problemen](docs/troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debuggen**: [Debuggids](docs/troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI Problemen**: [AI-specifieke Probleemoplossing](docs/troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktische oefeningen
- Implementatiefouten diagnosticeren
- Authenticatieproblemen oplossen
- AI-serviceconnectiviteit debuggen

**💡 Resultaat van het hoofdstuk**: Zelfstandig veelvoorkomende implementatieproblemen diagnosticeren en oplossen

---

### 🏢 Hoofdstuk 8: Productie & Enterprise Patronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Strategieën voor productie-implementatie
- Enterprise beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leermaterialen
- **🏭 Productie**: [Best Practices voor Productie AI](docs/ai-foundry/production-ai-practices.md) - Enterprise patronen
- **📝 Voorbeelden**: [Microservices Voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: Integratie met Application Insights

#### Praktische Oefeningen
- Implementeer beveiligingspatronen voor ondernemingen
- Stel uitgebreide monitoring in
- Voer productie-implementaties uit met de juiste governance

**💡 Resultaat van het hoofdstuk**: Ontwikkel applicaties die klaar zijn voor productie en geschikt zijn voor ondernemingen

---

## 📖 Wat is Azure Developer CLI?

Azure Developer CLI (azd) is een command-line interface gericht op ontwikkelaars die het proces van het bouwen en implementeren van applicaties naar Azure versnelt. Het biedt:

- **Template-gebaseerde implementaties** - Gebruik vooraf gebouwde templates voor veelvoorkomende applicatiepatronen
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloos voorzien, implementeren en monitoren van applicaties
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor productiviteit en ervaring van ontwikkelaars

### **AZD + Azure AI Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de grootste uitdagingen aan waarmee AI-ontwikkelaars worden geconfronteerd:

- **AI-Klare Templates** - Vooraf geconfigureerde templates voor Azure OpenAI, Cognitive Services en ML-workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-services, API-sleutels en modelendpoints  
- **Productie-AI-patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-End AI Workflows** - Van modelontwikkeling tot productie-implementatie met de juiste monitoring
- **Kostenoptimalisatie** - Slimme strategieën voor resourceallocatie en schaalbaarheid voor AI-workloads
- **Azure AI Foundry-integratie** - Naadloze verbinding met de modelcatalogus en endpoints van AI Foundry

---

## 🎯 Templates & Voorbeeldbibliotheek

### Uitgelicht: Azure AI Foundry Templates
**Begin hier als je AI-applicaties implementeert!**

| Template | Hoofdstuk | Complexiteit | Services |
|----------|-----------|--------------|----------|
| [**Aan de slag met AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Aan de slag met AI-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent workflow automatisering**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Genereer documenten uit je data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Verbeter klantgesprekken met agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Moderniseer je code met agents**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Bouw je conversatie-agent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Ontgrendel inzichten uit conversatiedata**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modale contentverwerking**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Uitgelicht: Complete Leertrajecten
**Productieklare applicatietemplates gekoppeld aan leerhoofdstukken**

| Template | Leerhoofdstuk | Complexiteit | Belangrijkste Leerpunten |
|----------|---------------|--------------|--------------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Document Intelligence-integratie |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agentframework en functieaanroepen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI-orkestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent architectuur met Klant- en Inventarisagents |

### Leren op basis van voorbeeldtype

#### Eenvoudige Applicaties (Hoofdstukken 1-2)
- [Eenvoudige Web App](../../examples/simple-web-app) - Basis implementatiepatronen
- [Statische Website](../../examples/static-site) - Implementatie van statische content
- [Basis API](../../examples/basic-api) - REST API-implementatie

#### Database-integratie (Hoofdstuk 3-4)  
- [Database App](../../examples/database-app) - Patronen voor databaseconnectiviteit
- [Dataverwerking](../../examples/data-processing) - ETL-workflow implementatie

#### Geavanceerde Patronen (Hoofdstukken 4-8)
- [Container Apps](../../examples/container-app) - Containerized implementaties
- [Microservices](../../examples/microservices) - Multi-service architecturen  
- [Enterprise-oplossingen](../../examples/enterprise) - Patronen die klaar zijn voor productie

### Externe Templatecollecties
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Officiële Microsoft-samples
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Door de community bijgedragen templates
- [**Voorbeeldendirectory**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leerbronnen & Referenties

### Snelle Referenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's georganiseerd per hoofdstuk
- [**Glossary**](resources/glossary.md) - Azure- en azd-terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen georganiseerd per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide praktijkoefeningen

### Hands-On Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-implementeerbaar
- [**AZD Voor Beginners Workshop**](workshop/README.md) - Complete hands-on workshopmaterialen

### Externe Leerbronnen
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Cursusvoltooiing & Certificering

### Voortgang Bijhouden
Houd je leerproces bij door elk hoofdstuk af te vinken:

- [ ] **Hoofdstuk 1**: Basis & Snelle Start ✅
- [ ] **Hoofdstuk 2**: AI-First Ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructure as Code & Implementatie ✅
- [ ] **Hoofdstuk 5**: Multi-Agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Validatie & Planning vóór Implementatie ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Debugging ✅
- [ ] **Hoofdstuk 8**: Productie- & Enterprise-patronen ✅

### Leerbevestiging
Na het voltooien van elk hoofdstuk, bevestig je kennis door:
1. **Praktische Oefening**: Voltooi de hands-on implementatie van het hoofdstuk
2. **Kenniscontrole**: Bekijk de FAQ-sectie van je hoofdstuk
3. **Community Discussie**: Deel je ervaring in Azure Discord
4. **Volgend Hoofdstuk**: Ga door naar het volgende complexiteitsniveau

### Voordelen van Cursusvoltooiing
Na het voltooien van alle hoofdstukken beschik je over:
- **Productie-ervaring**: Echte AI-applicaties geïmplementeerd op Azure
- **Professionele vaardigheden**: Implementatiecapaciteiten die klaar zijn voor ondernemingen  
- **Community-erkenning**: Actief lid van de Azure-ontwikkelaarscommunity
- **Carrièrevoordeel**: Gewilde AZD- en AI-implementatie-expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning
- **Technische Problemen**: [Rapporteer bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Leervragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-Specifieke Hulp**: Word lid van het [#Azure-kanaal](https://discord.gg/microsoft-azure) voor AZD + AI Foundry-discussies
- **Documentatie**: [Officiële Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-inzichten van Azure AI Foundry Discord

**Recente Pollresultaten van #Azure Kanaal:**
- **45%** van de ontwikkelaars wil AZD gebruiken voor AI-workloads
- **Topuitdagingen**: Multi-service implementaties, credential management, productievoorbereiding  
- **Meest gevraagd**: AI-specifieke templates, probleemoplossingsgidsen, best practices

**Word lid van onze community om:**
- Je AZD + AI-ervaringen te delen en hulp te krijgen
- Vroege previews van nieuwe AI-templates te ontvangen
- Bij te dragen aan best practices voor AI-implementatie
- Invloed uit te oefenen op toekomstige AI + AZD-functieontwikkeling

### Bijdragen aan de Cursus
We verwelkomen bijdragen! Lees onze [Bijdragengids](CONTRIBUTING.md) voor details over:
- **Verbeteringen aan inhoud**: Bestaande hoofdstukken en voorbeelden verbeteren
- **Nieuwe Voorbeelden**: Real-world scenario's en templates toevoegen  
- **Vertaling**: Helpen bij het onderhouden van meertalige ondersteuning
- **Bugrapporten**: Nauwkeurigheid en duidelijkheid verbeteren
- **Communitynormen**: Onze inclusieve richtlijnen volgen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE)-bestand voor details.

### Gerelateerde Microsoft Leerbronnen

Ons team produceert andere uitgebreide leertrajecten:

- [**NIEUW** Model Context Protocol (MCP) Voor Beginners](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents voor Beginners](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generatieve AI voor Beginners met .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generatieve AI voor Beginners](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generatieve AI voor Beginners met Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML voor Beginners](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science voor Beginners](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI voor Beginners](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersecurity voor Beginners](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webontwikkeling voor Beginners](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT voor Beginners](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR Ontwikkeling voor Beginners](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot voor AI Pair Programming](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Mastering GitHub Copilot voor C#/.NET Ontwikkelaars](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Kies Je Eigen Copilot Avontuur](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelle Start](../..)  
**AI Ontwikkelaars**: Ga direct naar [Hoofdstuk 2: AI-First Ontwikkeling](../..)
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](../..)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basisprincipes](docs/getting-started/azd-basics.md) →

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.