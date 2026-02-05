<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T12:54:50+00:00",
  "source_file": "README.md",
  "language_code": "nl"
}
-->
# AZD voor Beginners: Een Gestructureerde Leerreis

![AZD-for-beginners](../../../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Aan de Slag met Deze Cursus

Volg deze stappen om je AZD- leerreis te beginnen:

1. **Fork de Repository**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone de Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Doe mee met de Community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) voor deskundige ondersteuning
4. **Kies je Leerpad**: Selecteer een hoofdstuk hieronder dat aansluit bij je ervaringsniveau

### Meertalige Ondersteuning

#### Geautomatiseerde Vertalingen (Altijd Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](./README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Liever Lokaal Clonen?**

> Deze repository bevat meer dan 50 vertalingen wat de downloadgrootte aanzienlijk vergroot. Om te clonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Cursus Overzicht

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken ontworpen voor geleidelijke kennisopbouw. **Speciale focus op implementatie van AI-applicaties met Microsoft Foundry integratie.**

### Waarom Deze Cursus Essentieel is voor Moderne Ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community wil **45% van de ontwikkelaars AZD gebruiken voor AI workloads**, maar ondervinden uitdagingen met:
- Complexe multi-service AI-architecturen
- Best practices voor productie AI-implementaties  
- Integratie en configuratie van Azure AI-diensten
- Kostenoptimalisatie voor AI workloads
- Problemen oplossen bij AI-specifieke implementaties

### Leerdoelen

Na het voltooien van deze gestructureerde cursus zul je:
- **AZD Basisvaardigheden Beheersen**: Kernconcepten, installatie en configuratie
- **AI-applicaties Implementeren**: Gebruik AZD met Microsoft Foundry-diensten
- **Infrastructure as Code Implementeren**: Beheer Azure-resources met Bicep-sjablonen
- **Deployments Troubleshooten**: Veelvoorkomende problemen oplossen en debuggen
- **Optimaliseren voor Productie**: Beveiliging, schaling, monitoring en kostenbeheer
- **Multi-Agent Oplossingen Bouwen**: Complexe AI-architecturen uitrollen

## 📚 Leer Hoofdstukken

*Kies je leerpad op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Fundament & Snelle Start
**Vereisten**: Azure-abonnement, basiskennis command line  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je leert
- Inzicht in Azure Developer CLI basisprincipes
- AZD installeren op je platform
- Je eerste succesvolle implementatie

#### Leerbronnen
- **🎯 Start Hier**: [Wat is Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD Basisprincipes](docs/getting-started/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Setup**: [Installatie & Setup](docs/getting-started/installation.md) - Platformspecifieke gidsen
- **🛠️ Praktijk**: [Je Eerste Project](docs/getting-started/first-project.md) - Stapsgewijze tutorial
- **📋 Snelle Referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische Oefeningen
```bash
# Snelle installatiecontrole
azd version

# Zet je eerste applicatie uit
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultaat Hoofdstuk**: Een eenvoudige webapplicatie succesvol implementeren op Azure met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1 moet je in staat zijn om:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Zet uit naar Azure
azd show                # Toont URL van draaiende app
# Applicatie opent in browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau Na:** Kan zelfstandig basisapplicaties implementeren

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1, zou je in staat moeten zijn om:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Zet uit naar Azure
azd show                # Geeft de URL van de draaiende app weer
# Applicatie opent in browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau Na:** Kan zelfstandig basisapplicaties implementeren

---

### 🤖 Hoofdstuk 2: AI-Eerste Ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 afgerond  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Microsoft Foundry integratie met AZD
- Implementeren van AI-gedreven toepassingen
- Begrip van AI-service configuraties

#### Leerbronnen
- **🎯 Start Hier**: [Microsoft Foundry Integratie](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patronen**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - AI-modellen uitrollen en beheren
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve Gids**: [Workshop Materialen](workshop/README.md) - Browser-gebaseerd leren met MkDocs * DevContainer Environment
- **📋 Sjablonen**: [Microsoft Foundry Sjablonen](../..)
- **📝 Voorbeelden**: [AZD Deployment Voorbeelden](examples/README.md)

#### Praktische Oefeningen
```bash
# Zet je eerste AI-toepassing in
azd init --template azure-search-openai-demo
azd up

# Probeer aanvullende AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultaat Hoofdstuk**: Een AI-gedreven chatapplicatie met RAG-mogelijkheden implementeren en configureren

**✅ Succesvalidatie:**
```bash
# Na Hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# De AI-chatinterface te testen
# Vragen te stellen en AI-gegenereerde antwoorden met bronnen te krijgen
# Te verifiëren dat zoekintegratie werkt
azd monitor  # Te controleren of Application Insights telemetrie weergeeft
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau Na:** Kan productieklare AI-applicaties implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijpt $80-150/maand aan ontwikkelkosten, $300-3500/maand aan productiekosten

#### 💰 Overwegingen Kosten voor AI-Implementaties

**Ontwikkelomgeving (Geschat $80-150/maand):**
- Azure OpenAI (Pay-as-you-go): $0-50/maand (op basis van tokengebruik)
- AI Search (Basic tier): $75/maand
- Container Apps (Consumption): $0-20/maand
- Opslag (Standaard): $1-5/maand

**Productieomgeving (Geschat $300-3.500+/maand):**
- Azure OpenAI (PTU voor consistente prestaties): $3.000+/maand OF Pay-as-you-go bij hoog volume
- AI Search (Standard tier): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Opslag (Premium): $10-50/maand

**💡 Tips Kostenoptimalisatie:**
- Gebruik **Free Tier** Azure OpenAI voor leren (50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources te de-alloceren wanneer niet actief ontwikkeld
- Begin met billing op consumptiebasis, upgrade alleen naar PTU voor productie
- Gebruik `azd provision --preview` om kosten te schatten vóór implementatie
- Schakel auto-scaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenmonitoring:**
```bash
# Controleer geschatte maandelijkse kosten
azd provision --preview

# Houd werkelijke kosten in de Azure Portal in de gaten
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 afgerond  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Omgevingsconfiguratie en -beheer
- Authenticatie en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leerbronnen
- **📖 Configuratie**: [Configuratie Gids](docs/getting-started/configuration.md) - Omgevingsinstellingen
- **🔐 Beveiliging**: [Authenticatiepatronen en beheerde identiteit](docs/getting-started/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database App Voorbeeld](examples/database-app/README.md) - AZD Database Voorbeelden

#### Praktische Oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel authenticatie met beheerde identiteit in
- Implementeer omgevingsspecifieke configuraties

**💡 Resultaat Hoofdstuk**: Beheer meerdere omgevingen met juiste authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructure as Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 afgerond  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je leert
- Geavanceerde implementatiepatronen
- Infrastructure as Code met Bicep
- Strategieën voor resource provisioning

#### Leerbronnen
- **📖 Implementatie**: [Implementatie Gids](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/deployment/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container App Voorbeeld](../../examples/container-app) - Containerized implementaties

#### Praktische Oefeningen
- Maak aangepaste Bicep-sjablonen
- Implementeer multi-service applicaties
- Implementeer blue-green deployment strategieën

**💡 Resultaat Hoofdstuk**: Complexe multi-service applicaties implementeren met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-Agent AI Oplossingen (Geavanceerd)
**Vereisten**: Hoofdstukken 1-2 afgerond  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Multi-agent architectuurpatronen
- Agent orchestratie en coördinatie
- Productieklaar AI-implementaties

#### Leerbronnen
- **🤖 Uitgelicht Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Implementatie met één klik
- **📖 Architectuur**: [Multi-agent coördinatiepatronen](/docs/pre-deployment/coordination-patterns.md) - Patronen

#### Praktische oefeningen
```bash
# Implementeer de complete multi-agent retail oplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hoofdstukresultaat**: Implementeer en beheer een productieklaar multi-agent AI-oplossing met Customer- en Inventory-agents

---

### 🔍 Hoofdstuk 6: Validatie & Planning vóór Implementatie
**Vereisten**: Hoofdstuk 4 afgerond  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Capaciteitsplanning en resourcevalidatie
- Strategieën voor SKU-selectie
- Pre-flight controles en automatisering

#### Leerbronnen
- **📊 Planning**: [Capaciteitsplanning](docs/pre-deployment/capacity-planning.md) - Resourcevalidatie
- **💰 Selectie**: [SKU-selectie](docs/pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flightchecks](docs/pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-implementatie controles

**💡 Hoofdstukresultaat**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Probleemoplossing & Debugging
**Vereisten**: Elk implementatiehoofdstuk voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Systematische debuggingmethodes
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leerbronnen
- **🔧 Veelvoorkomende problemen**: [Veelvoorkomende problemen](docs/troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debugginggids](docs/troubleshooting/debugging.md) - Stap-voor-stap strategieën
- **🤖 AI-problemen**: [AI-specifieke probleemoplossing](docs/troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktische oefeningen
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug AI-service connectiviteit

**💡 Hoofdstukresultaat**: Diagnosticeer en los zelfstandig veelvoorkomende implementatieproblemen op

---

### 🏢 Hoofdstuk 8: Productie- & Enterprisepatronen
**Vereisten**: Hoofdstukken 1-4 afgerond  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Strategieën voor productie-implementatie
- Enterprise beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leerbronnen
- **🏭 Productie**: [Best Practices voor Productie AI](docs/microsoft-foundry/production-ai-practices.md) - Enterprisepatronen
- **📝 Voorbeelden**: [Microservices voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights integratie](docs/pre-deployment/application-insights.md) - Monitoring

#### Praktische oefeningen
- Implementeer enterprise beveiligingspatronen
- Zet uitgebreide monitoring op
- Implementeer in productie met juiste governance

**💡 Hoofdstukresultaat**: Implementeer enterprise-klare applicaties met volledige productiecapaciteiten

---

## 🎓 Workshopoverzicht: Praktische Leerervaring

> **⚠️ STATUS WORKSHOP: Actieve Ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kerndelen zijn functioneel, maar sommige gevorderde secties zijn incompleet. We werken actief aan voltooiing van alle inhoud. [Volg voortgang →](workshop/README.md)

### Interactieve Workshopmaterialen
**Uitgebreide hands-on leerervaring met browsergebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum bovenaan aanvult. De workshop is ontworpen voor zowel zelfstudie als begeleide sessies.

#### 🛠️ Workshopkenmerken
- **Browser Interface**: Volledige MkDocs-gestuurde workshop met zoek-, kopieer- en themafuncties
- **GitHub Codespaces Integratie**: One-click setup van de ontwikkelomgeving
- **Gestructureerd Leertraject**: 7-stappen begeleide oefeningen (in totaal 3,5 uur)
- **Ontdekking → Implementatie → Aanpassing**: Progressieve methodologie
- **Interactieve DevContainer Omgeving**: Vooraf geconfigureerde tools en dependencies

#### 📚 Workshopstructuur
De workshop volgt een methode van **Ontdekking → Implementatie → Aanpassing**:

1. **Ontdekkingsfase** (45 minuten)
   - Verken Microsoft Foundry templates en services
   - Begrijp multi-agent architectuurpatronen
   - Bekijk implementatievereisten en vereisten

2. **Implementatiefase** (2 uur)
   - Hands-on implementatie van AI-applicaties met AZD
   - Configureer Azure AI-services en endpoints
   - Implementeer beveiligings- en authenticatiepatronen

3. **Aanpassingsfase** (45 minuten)
   - Pas applicaties aan specifieke gebruikssituaties aan
   - Optimaliseer voor productie-implementatie
   - Implementeer monitoring en kostenbeheer

#### 🚀 Aan de slag met de workshop
```bash
# Optie 1: GitHub Codespaces (Aanbevolen)
# Klik op "Code" → "Create codespace on main" in de repository

# Optie 2: Lokale ontwikkeling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Volg de installatie-instructies in workshop/README.md
```

#### 🎯 Leerresultaten Workshop
Na afronding van de workshop kunnen deelnemers:
- **Productie AI-applicaties implementeren**: Gebruik AZD met Microsoft Foundry-services
- **Multi-agent architecturen beheersen**: Gecoördineerde AI-agentoplossingen implementeren
- **Veiligheidsbest practices toepassen**: Authenticatie en toegangscontrole configureren
- **Optimaliseren voor schaal**: Kosteneffectieve en performante implementaties ontwerpen
- **Problemen oplossen met implementaties**: Veelvoorkomende problemen zelfstandig verhelpen

#### 📖 Workshopbronnen
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Stapsgewijze instructies**: [Begeleide oefeningen](../../workshop/docs/instructions) - Gedetailleerde walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Snelle start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstrainingen, universitaire cursussen, zelfstudie en ontwikkelaarsbootcamps.

---

## 📖 Wat is Azure Developer CLI?

Azure Developer CLI (azd) is een voor ontwikkelaarsgerichte commandoregelinterface die het proces van bouwen en implementeren van applicaties naar Azure versnelt. Het biedt:

- **Template-gebaseerde implementaties** - Gebruik vooraf gebouwde templates voor veelvoorkomende applicatiepatronen
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloze provisioning, implementatie en monitoring van applicaties
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor productiviteit en ervaring van ontwikkelaars

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de grootste uitdagingen aan waar AI-ontwikkelaars tegenaan lopen:

- **AI-klaar templates** - Vooraf geconfigureerde templates voor Azure OpenAI, Cognitive Services en ML workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-services, API-sleutels en modelendpoints  
- **Productie AI-patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-End AI-workflows** - Van modelontwikkeling tot productie-implementatie met juiste monitoring
- **Kostenoptimalisatie** - Slimme resourceallocatie en schaalstrategieën voor AI workloads
- **Microsoft Foundry-integratie** - Naadloze koppeling met Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Template- & Voorbeeldenbibliotheek

### Uitgelicht: Microsoft Foundry Templates
**Begin hier als je AI-applicaties implementeert!**

> **Let op:** Deze templates demonstreren verschillende AI-patronen. Sommige zijn externe Azure Samples, andere lokaal geïmplementeerd.

| Template | Hoofdstuk | Complexiteit | Services | Type |
|----------|-----------|-------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Volledige Leeruitdagingen
**Productieklaar applicatietemplates gekoppeld aan leerhoofdstukken**

| Template | Leerhoofdstuk | Complexiteit | Belangrijk leerpunt |
|----------|---------------|-------------|---------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Integratie Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agent framework en function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI orchestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent architectuur met Customer- en Inventory-agents |

### Leren door Voorbeeldtype

> **📌 Lokale vs. Externe Voorbeelden:**  
> **Lokale Voorbeelden** (in deze repo) = Direct gebruiksklaar  
> **Externe Voorbeelden** (Azure Samples) = Clone uit gekoppelde repositories

#### Lokale Voorbeelden (Direct Gebruiksklaar)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Volledige productieklare implementatie met ARM-templates
  - Multi-agent architectuur (Customer + Inventory agents)
  - Uitgebreide monitoring en evaluatie
  - Implementatie met één klik via ARM-template

#### Lokale Voorbeelden - Containerapplicaties (Hoofdstukken 2-5)
**Uitgebreide voorbeelden van containerimplementaties in deze repository:**
- [**Container App Voorbeelden**](examples/container-app/README.md) - Volledige gids voor containerimplementaties
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met scale-to-zero
  - [Microservices Architectuur](../../examples/container-app/microservices) - Productieklaar multi-service implementatie
  - Voorbeeldimplementaties voor Snelle Start, Productie en Geavanceerd
  - Richtlijnen voor monitoring, beveiliging en kostenoptimalisatie

#### Externe Voorbeelden - Eenvoudige Applicaties (Hoofdstukken 1-2)
**Clone deze Azure Samples repositories om aan de slag te gaan:**
- [Eenvoudige Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basis implementatiepatronen
- [Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Deployment van statische content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-implementatie

#### Externe Voorbeelden - Database Integratie (Hoofdstukken 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectiviteitspatronen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### Externe Voorbeelden - Geavanceerde Patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productieklare ML-patronen

### Externe Templatecollecties
- [**Officiële AZD Templategalerij**](https://azure.github.io/awesome-azd/) - Geselecteerde collectie van officiële en community-templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentatie
- [**Voorbeeldenmap**](examples/README.md) - Lokale leer voorbeelden met gedetailleerde uitleg

---

## 📚 Leerbronnen & Referenties

### Snelle Referenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's georganiseerd per hoofdstuk
- [**Glossarium**](resources/glossary.md) - Azure en azd terminologie  
- [**FAQ**](resources/faq.md) - Veelvoorkomende vragen georganiseerd per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktische Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-deployable (2-3 uur)
- [**Interactieve Workshopgids**](workshop/README.md) - Browsergebaseerde workshop met MkDocs en DevContainer-omgeving
- [**Gestructureerd Leertraject**](../../workshop/docs/instructions) - 7-staps begeleide oefeningen (Discovery → Deployment → Customization)
- [**AZD voor Beginners Workshop**](workshop/README.md) - Complete hands-on workshopmaterialen met GitHub Codespaces-integratie

### Externe Leerbronnen
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Snelle Probleemoplossingsgids

**Veelvoorkomende problemen voor beginners en directe oplossingen:**

### ❌ "azd: command not found"

```bash
# Installeer eerst AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifieer installatie
azd version
```

### ❌ "Geen abonnement gevonden" of "Abonnement niet ingesteld"

```bash
# Lijst beschikbare abonnementen
az account list --output table

# Stel standaardabonnement in
az account set --subscription "<subscription-id-or-name>"

# Instellen voor AZD-omgeving
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiëren
az account show
```

### ❌ "InsufficientQuota" of "Quota overschreden"

```bash
# Probeer een andere Azure-regio
azd env set AZURE_LOCATION "westus2"
azd up

# Of gebruik kleinere SKU's in ontwikkeling
# Bewerk infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" faalt halverwege

```bash
# Optie 1: Opruimen en opnieuw proberen
azd down --force --purge
azd up

# Optie 2: Alleen infrastructuur repareren
azd provision

# Optie 3: Controleer gedetailleerde logs
azd show
azd logs
```

### ❌ "Authenticatie mislukt" of "Token verlopen"

```bash
# Opnieuw authenticeren
az logout
az login

azd auth logout
azd auth login

# Verifieer authenticatie
az account show
```

### ❌ "Resource bestaat al" of naamconflicten

```bash
# AZD genereert unieke namen, maar als er een conflict is:
azd down --force --purge

# Probeer het dan opnieuw met een nieuwe omgeving
azd env new dev-v2
azd up
```

### ❌ Sjabloonimplementatie duurt te lang

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (OpenAI-provisioning is traag)

```bash
# Controleer voortgang
azd show

# Als vast >30 minuten, controleer Azure Portal:
azd monitor
# Zoek naar mislukte implementaties
```

### ❌ "Toegang geweigerd" of "Verboden"

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U hebt minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om toe te kennen:
# - Contributor (voor resources)
# - User Access Administrator (voor roltoewijzingen)
```

### ❌ Kan URL van gedeploide applicatie niet vinden

```bash
# Toon alle service-eindpunten
azd show

# Of open Azure Portal
azd monitor

# Controleer specifieke service
azd env get-values
# Zoek naar *_URL-variabelen
```

### 📚 Volledige Probleemoplossingsbronnen

- **Gids veel voorkomende problemen:** [Gedetailleerde oplossingen](docs/troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI Probleemoplossing](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stapsgewijze debugging](docs/troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Snelle Probleemoplossingsgids

**Veelvoorkomende problemen voor beginners en directe oplossingen:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installeer eerst AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifieer installatie
azd version
```
</details>

<details>
<summary><strong>❌ "Geen abonnement gevonden" of "Abonnement niet ingesteld"</strong></summary>

```bash
# Lijst beschikbare abonnementen
az account list --output table

# Stel standaardabonnement in
az account set --subscription "<subscription-id-or-name>"

# Instellen voor AZD-omgeving
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiëren
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" of "Quota overschreden"</strong></summary>

```bash
# Probeer een andere Azure-regio
azd env set AZURE_LOCATION "westus2"
azd up

# Of gebruik kleinere SKU's in ontwikkeling
# Bewerk infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" faalt halverwege</strong></summary>

```bash
# Optie 1: Opruimen en opnieuw proberen
azd down --force --purge
azd up

# Optie 2: Alleen infrastructuur repareren
azd provision

# Optie 3: Gedetailleerde logs controleren
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Authenticatie mislukt" of "Token verlopen"</strong></summary>

```bash
# Opnieuw authenticeren
az logout
az login

azd auth logout
azd auth login

# Authenticatie verifiëren
az account show
```
</details>

<details>
<summary><strong>❌ "Resource bestaat al" of naamconflicten</strong></summary>

```bash
# AZD genereert unieke namen, maar bij conflicten:
azd down --force --purge

# Probeer dan opnieuw met een nieuwe omgeving
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sjabloonimplementatie duurt te lang</strong></summary>

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (OpenAI-provisioning is traag)

```bash
# Controleer voortgang
azd show

# Als het meer dan 30 minuten vastzit, controleer dan de Azure-portal:
azd monitor
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Toegang geweigerd" of "Verboden"</strong></summary>

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U heeft minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om toe te kennen:
# - Contributor (voor bronnen)
# - User Access Administrator (voor roltoewijzingen)
```
</details>

<details>
<summary><strong>❌ Kan URL van gedeploide applicatie niet vinden</strong></summary>

```bash
# Toon alle service-eindpunten
azd show

# Of open Azure Portal
azd monitor

# Controleer specifieke service
azd env get-values
# Zoek naar *_URL variabelen
```
</details>

### 📚 Volledige Probleemoplossingsbronnen

- **Gids veel voorkomende problemen:** [Gedetailleerde oplossingen](docs/troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI Probleemoplossing](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stapsgewijze debugging](docs/troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursusvoltooiing & Certificering

### Voortgang Bijhouden
Volg je leer voortgang door elk hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Snelle Start ✅
- [ ] **Hoofdstuk 2**: AI-First Ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructuur als Code & Implementatie ✅
- [ ] **Hoofdstuk 5**: Multi-Agent AI Oplossingen ✅
- [ ] **Hoofdstuk 6**: Validatie & Planning Voorafgaand aan Implementatie ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Debugging ✅
- [ ] **Hoofdstuk 8**: Productie & Enterprise Patronen ✅

### Leer Verificatie
Na voltooiing van elk hoofdstuk controleer je je kennis door:
1. **Praktische Oefening**: Voltooi het hands-on deployment van het hoofdstuk
2. **Kenniscontrole**: Bekijk de FAQ-sectie voor je hoofdstuk
3. **Community Discussie**: Deel je ervaring op Azure Discord
4. **Volgend Hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen van Cursusvoltooiing
Na afronding van alle hoofdstukken heb je:
- **Productie-ervaring**: Werkelijke AI-toepassingen gedeployed naar Azure
- **Professionele vaardigheden**: Enterprise-klaar implementatietalent  
- **Community Erkenning**: Actief lid van Azure ontwikkelaarscommunity
- **Carrière Vooruitgang**: Gevraagde AZD- en AI-implementatie-expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning Krijgen
- **Technische Problemen**: [Meld bugs en vraag om functies](https://github.com/microsoft/azd-for-beginners/issues)
- **Leer Vragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke Hulp**: Word lid van de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Inzichten van Microsoft Foundry Discord

**Recente Peilingsresultaten van het #Azure-kanaal:**
- **45%** van de ontwikkelaars wil AZD gebruiken voor AI workloads
- **Top uitdagingen**: Multi-service deploys, credentialbeheer, productiegereedheid  
- **Meest gevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, beste praktijken

**Word lid van onze community om:**
- Je AZD + AI ervaringen te delen en hulp te krijgen
- Toegang te krijgen tot vroege previews van nieuwe AI-sjablonen
- Bij te dragen aan beste praktijken voor AI-implementatie
- Invloed uit te oefenen op toekomstige AI + AZD functieontwikkeling

### Bijdragen aan de Cursus
Wij verwelkomen bijdrages! Lees onze [Bijdragengids](CONTRIBUTING.md) voor details over:
- **Inhoud Verbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe Voorbeelden**: Voeg praktijkvoorbeelden en sjablonen toe  
- **Vertaling**: Help meertalige ondersteuning te onderhouden
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Community Normen**: Volg onze inclusieve communityrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft Leerbronnen

Ons team produceert andere uitgebreide leercursussen:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j voor Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js voor Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agents
[![AZD voor Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI voor Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP voor Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents voor Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatieve AI Serie
[![Generatieve AI voor Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernleren
[![ML voor Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Datawetenschap voor Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serie
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursus Navigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelle Start](../..)  
**AI Ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-First Ontwikkeling](../..)  
**Ervaren Ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](../..)

**Volgende Stappen**: [Begin Hoofdstuk 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal dient als de gezaghebbende bron te worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->