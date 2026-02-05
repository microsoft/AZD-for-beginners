# AZD voor Beginners: Een Gestructureerde Leerreis

![AZD-for-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Beginnen met Deze Cursus

Volg deze stappen om te starten met je AZD-leerreis:

1. **Fork de Repository**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone de Repository**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Word Lid van de Community**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) voor deskundige ondersteuning
4. **Kies je Leerpad**: Selecteer een hoofdstuk hieronder dat overeenkomt met je ervaringsniveau

### Meertalige Ondersteuning

#### Geautomatiseerde Vertalingen (Altijd Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Birmaans (Myanmar)](../my/README.md) | [Chinees (Vereenvoudigd)](../zh-CN/README.md) | [Chinees (Traditioneel, Hong Kong)](../zh-HK/README.md) | [Chinees (Traditioneel, Macau)](../zh-MO/README.md) | [Chinees (Traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Ests](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slowaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turks](../tr/README.md) | [ Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

> **Voorkeur om lokaal te clonen?**

> Deze repository bevat meer dan 50 taalvertalingen, wat de downloadgrootte aanzienlijk vergroot. Om zonder vertalingen te clonen, gebruik je sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Overzicht van de Cursus

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken ontworpen voor stapsgewijs leren. **Speciale focus op AI-applicatie-implementatie met integratie van Microsoft Foundry.**

### Waarom Deze Cursus Essentieel is voor Moderne Ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community, wil **45% van de ontwikkelaars AZD gebruiken voor AI-workloads**, maar komt men uitdagingen tegen bij:
- Complexe multi-service AI-architecturen
- Best practices voor productie-implementatie van AI  
- Integratie en configuratie van Azure AI-diensten
- Kostenoptimalisatie voor AI-workloads
- Problemen oplossen bij AI-specifieke implementaties

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zul je:
- **AZD Basisprincipes Beheersen**: Kernconcepten, installatie en configuratie
- **AI-toepassingen Implementeren**: Gebruik AZD met Microsoft Foundry-services
- **Infrastructuur als Code Implementeren**: Beheer Azure-resources met Bicep-sjablonen
- **Problemen bij Implementaties Oplossen**: Algemene problemen oplossen en debuggen
- **Optimaliseren voor Productie**: Beveiliging, schaling, monitoring en kostenbeheer
- **Multi-Agent Oplossingen Bouwen**: Implementeer complexe AI-architecturen

## 📚 Leerhoofdstukken

*Kies je leerpad op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Basis & Snelle Start
**Vereisten**: Azure-abonnement, basiskennis van de command line  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat Je Leert
- Begrip van Azure Developer CLI basisprincipes
- AZD installeren op jouw platform
- Je eerste succesvolle implementatie

#### Leerbronnen
- **🎯 Begin Hier**: [Wat is Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD Basics](docs/getting-started/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Setup**: [Installatie & Setup](docs/getting-started/installation.md) - Platform-specifieke handleidingen
- **🛠️ Praktijk**: [Je Eerste Project](docs/getting-started/first-project.md) - Stapsgewijze tutorial
- **📋 Snel Referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische Oefeningen
```bash
# Snelle installatiecontrole
azd version

# Implementeer je eerste applicatie
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hoofdstuk Resultaat**: Succesvol een eenvoudige webapplicatie deployen naar Azure met AZD

**✅ Validatie Succes:**
```bash
# Na het voltooien van Hoofdstuk 1, zou je het volgende moeten kunnen:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Zet uit naar Azure
azd show                # Toont URL van draaiende app
# Applicatie opent in browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau Na:** Kan basisapplicaties zelfstandig deployen

**✅ Validatie Succes:**
```bash
# Na het voltooien van Hoofdstuk 1 zou je in staat moeten zijn om:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Zet uit naar Azure
azd show                # Toont URL van draaiende app
# Applicatie opent in browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau Na:** Kan basisapplicaties zelfstandig deployen

---

### 🤖 Hoofdstuk 2: AI-First Ontwikkeling (Aanbevolen voor AI-Ontwikkelaars)
**Vereisten**: Hoofdstuk 1 afgerond  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat Je Leert
- Microsoft Foundry-integratie met AZD
- AI-gestuurde applicaties deployen
- Begrip van AI-serviceconfiguraties

#### Leerbronnen
- **🎯 Begin Hier**: [Microsoft Foundry Integratie](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Patronen**: [AI Model Deployment](docs/microsoft-foundry/ai-model-deployment.md) - AI-modellen implementeren en beheren
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve Gids**: [Workshop Materialen](workshop/README.md) - Browser-gebaseerd leren met MkDocs * DevContainer-omgeving
- **📋 Sjablonen**: [Microsoft Foundry Sjablonen](../..)
- **📝 Voorbeelden**: [AZD Deployments Voorbeelden](examples/README.md)

#### Praktische Oefeningen
```bash
# Zet je eerste AI-toepassing in
azd init --template azure-search-openai-demo
azd up

# Probeer aanvullende AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hoofdstuk Resultaat**: Een AI-gestuurde chatapplicatie deployen en configureren met RAG-functionaliteiten

**✅ Validatie Succes:**
```bash
# Na Hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# De AI-chatinterface te testen
# Vragen te stellen en AI-aangedreven antwoorden te krijgen met bronnen
# Te controleren of de zoekintegratie werkt
azd monitor  # Te controleren of Application Insights telemetrie toont
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau Na:** Kan productieklare AI-applicaties deployen en configureren  
**💰 Kostenbewustzijn:** Begrijpt ontwikkelkosten van $80-150/maand en productiekosten van $300-3500/maand

#### 💰 Kostenoverwegingen voor AI-Implementaties

**Ontwikkelomgeving (Geschat $80-150/maand):**
- Azure OpenAI (Pay-as-you-go): $0-50/maand (op basis van tokengebruik)
- AI Search (Basislaag): $75/maand
- Container Apps (Verbruik): $0-20/maand
- Opslag (Standaard): $1-5/maand

**Productieomgeving (Geschat $300-3.500+/maand):**
- Azure OpenAI (PTU voor consistente prestaties): $3.000+/maand OF Pay-as-you-go bij hoog volume
- AI Search (Standaardlaag): $250/maand
- Container Apps (Toegewijd): $50-100/maand
- Application Insights: $5-50/maand
- Opslag (Premium): $10-50/maand

**💡 Tips voor Kostenoptimalisatie:**
- Gebruik **Gratis Laag** Azure OpenAI voor leren (50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources vrij te geven wanneer je niet actief ontwikkelt
- Begin met verbruiksafhankelijke facturering, upgrade naar PTU alleen voor productie
- Gebruik `azd provision --preview` om kosten voor implementatie te schatten
- Activeer autoscaling: betaal alleen voor daadwerkelijk gebruik

**Kostenmonitoring:**
```bash
# Controleer de geschatte maandelijkse kosten
azd provision --preview

# Houd de werkelijke kosten bij in de Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 afgerond  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat Je Leert
- Omgevingsconfiguratie en beheer
- Authenticatie en beveiligingsbest practices
- Resource naming en organisatie

#### Leerbronnen
- **📖 Configuratie**: [Configuratiehandleiding](docs/getting-started/configuration.md) - Omgevingsinstellingen
- **🔐 Beveiliging**: [Authenticatiepatronen en beheerde identiteit](docs/getting-started/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database App Voorbeeld](examples/database-app/README.md) - AZD Database Voorbeelden

#### Praktische Oefeningen
- Meerdere omgevingen configureren (dev, staging, prod)
- Managed identity authenticatie instellen
- Omgevingsspecifieke configuraties implementeren

**💡 Hoofdstuk Resultaat**: Beheer meerdere omgevingen met juiste authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructuur als Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 afgerond  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat Je Leert
- Geavanceerde implementatiepatronen
- Infrastructuur als Code met Bicep
- Resource provisioning strategieën

#### Leerbronnen
- **📖 Implementatie**: [Implementatiehandleiding](docs/deployment/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Resource Provisioning](docs/deployment/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container App Voorbeeld](../../examples/container-app) - Containerized implementaties

#### Praktische Oefeningen
- Custom Bicep-sjablonen maken
- Multi-service applicaties deployen
- Blue-green implementatiestrategieën toepassen

**💡 Hoofdstuk Resultaat**: Complexe multi-service applicaties deployen met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-Agent AI-oplossingen (Gevorderd)
**Vereisten**: Hoofdstukken 1-2 afgerond  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐
#### Wat je zult leren
- Multi-agent architectuurpatronen
- Agentorkestratie en coördinatie
- Productieklaar AI-implementaties

#### Leerbronnen
- **🤖 Uitgelicht Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementatie
- **🛠️ ARM-sjablonen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Implementatie met één klik
- **📖 Architectuur**: [Multi-agent coördinatiepatronen](/docs/pre-deployment/coordination-patterns.md) - Patronen

#### Praktische oefeningen
```bash
# Implementeer de complete retail multi-agent oplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultaat van het hoofdstuk**: Implementeer en beheer een productieklaar multi-agent AI-oplossing met Customer- en Inventory-agenten

---

### 🔍 Hoofdstuk 6: Pre-Deployment Validatie & Planning
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Capaciteitsplanning en resource-validatie
- SKU-selectiestrategieën
- Pre-flight controles en automatisering

#### Leerbronnen
- **📊 Planning**: [Capaciteitsplanning](docs/pre-deployment/capacity-planning.md) - Resource-validatie
- **💰 Selectie**: [SKU-selectie](docs/pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Controles](docs/pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deployment controles

**💡 Resultaat van het hoofdstuk**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Probleemoplossing & Debugging
**Vereisten**: Elk implementatiehoofdstuk voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Systematische debugging-methoden
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leerbronnen
- **🔧 Veelvoorkomende Problemen**: [Veelvoorkomende Problemen](docs/troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debuggengids](docs/troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI Problemen**: [AI-Specifieke Probleemoplossing](docs/troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktische oefeningen
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug de connectiviteit van AI-services

**💡 Resultaat van het hoofdstuk**: Zelfstandig veelvoorkomende implementatieproblemen diagnosticeren en oplossen

---

### 🏢 Hoofdstuk 8: Productie- & Enterprisepatronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Productie-implementatiestrategieën
- Enterprise beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leerbronnen
- **🏭 Productie**: [Best Practices voor Productie AI](docs/microsoft-foundry/production-ai-practices.md) - Enterprisepatronen
- **📝 Voorbeelden**: [Microservices Voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights integratie](docs/pre-deployment/application-insights.md) - Monitoring

#### Praktische oefeningen
- Implementeer enterprise beveiligingspatronen
- Zet uitgebreide monitoring op
- Implementeer productie met goede governance

**💡 Resultaat van het hoofdstuk**: Implementeer enterprise-klaar applicaties met volledige productiecapaciteiten

---

## 🎓 Workshopoverzicht: Praktische leerervaring

> **⚠️ WORKSHOPSTATUS: Actieve ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige geavanceerde secties zijn nog niet compleet. We werken actief aan het voltooien van alle inhoud. [Volg de voortgang →](workshop/README.md)

### Interactieve workshopmaterialen
**Uitgebreide hands-on leerervaring met browsergebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het op hoofdstukken gebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfstudie als instructor-geleide sessies.

#### 🛠️ Workshopkenmerken
- **Browsergebaseerde interface**: Volledige MkDocs-workshop met zoeken, kopiëren en thema-opties
- **GitHub Codespaces-integratie**: Eén-klik setup van ontwikkelomgeving
- **Gestructureerd leerpad**: 7-stappen begeleide oefeningen (3,5 uur totaal)
- **Discovery → Deployment → Customization**: Progressieve methodologie
- **Interactieve DevContainer-omgeving**: Vooraf geconfigureerde tools en afhankelijkheden

#### 📚 Workshopstructuur
De workshop volgt de **Discovery → Deployment → Customization** methodologie:

1. **Ontdekkingsfase** (45 min)
   - Verken Microsoft Foundry-sjablonen en -diensten
   - Begrijp multi-agent architectuurpatronen
   - Bekijk implementatievereisten en vereisten

2. **Implementatiefase** (2 uur)
   - Hands-on implementatie van AI-applicaties met AZD
   - Configureer Azure AI-diensten en endpoints
   - Implementeer beveiligings- en authenticatiepatronen

3. **Aanpassingsfase** (45 min)
   - Pas applicaties aan voor specifieke use-cases
   - Optimaliseer voor productie-implementatie
   - Implementeer monitoring en kostenbeheer

#### 🚀 Aan de slag met de workshop
```bash
# Optie 1: GitHub Codespaces (Aanbevolen)
# Klik op "Code" → "Maak codespace aan op main" in de repository

# Optie 2: Lokale ontwikkeling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Volg de installatie-instructies in workshop/README.md
```

#### 🎯 Leerresultaten workshop
Door de workshop te voltooien zullen deelnemers:
- **Productie AI-applicaties implementeren**: Gebruik van AZD met Microsoft Foundry-diensten
- **Meesterschap in multi-agent architecturen**: Geïmplementeerde gecoördineerde AI-agentoplossingen
- **Beste beveiligingspraktijken implementeren**: Configuratie van authenticatie en toegangscontrole
- **Optimaliseren voor schaal**: Ontwerp van kosteneffectieve, performante implementaties
- **Problemen oplossen bij implementaties**: Zelfstandig veelvoorkomende problemen oplossen

#### 📖 Workshopbronnen
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Stapsgewijze instructies**: [Begeleide oefeningen](../../workshop/docs/instructions) - Gedetailleerde walkthroughs
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Snelle start**: [Workshop Setup-gids](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstrainingen, universitaire cursussen, zelfstudie en developer bootcamps.

---

## 📖 Wat is Azure Developer CLI?

Azure Developer CLI (azd) is een ontwikkelaarvriendelijke commandoregelinterface die het proces van het bouwen en implementeren van applicaties naar Azure versnelt. Het biedt:

- **Sjabloon-gebaseerde implementaties** - Gebruik kant-en-klare sjablonen voor gangbare applicatiepatronen
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloos voorzien, implementeren en monitoren van applicaties
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor productiviteit en gebruiksgemak van ontwikkelaars

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD adresseert de belangrijkste uitdagingen waar AI-ontwikkelaars mee te maken hebben:

- **AI-klaar sjablonen** - Vooraf geconfigureerde sjablonen voor Azure OpenAI, Cognitive Services en ML workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-diensten, API-sleutels en modelendpoints  
- **Productie AI-patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-End AI-workflows** - Van modelontwikkeling tot productie-implementatie met goede monitoring
- **Kostenoptimalisatie** - Slimme resource-toewijzing en schaalstrategieën voor AI workloads
- **Microsoft Foundry-integratie** - Naadloze koppeling naar Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Sjablonen & Voorbeeldenbibliotheek

### Uitgelicht: Microsoft Foundry-sjablonen
**Begin hier als je AI-applicaties implementeert!**

> **Opmerking:** Deze sjablonen demonstreren diverse AI-patronen. Sommige zijn externe Azure Samples, andere lokale implementaties.

| Sjabloon | Hoofdstuk | Complexiteit | Diensten | Soort |
|----------|-----------|-------------|----------|-------|
| [**Begin met AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Begin met AI-agenten**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Complete leerscenario's
**Productieklaar applicatiesjablonen gekoppeld aan leerhoofdstukken**

| Sjabloon | Leerhoofdstuk | Complexiteit | Belangrijkste Leerpunten |
|----------|---------------|-------------|-------------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Document Intelligence-integratie |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agentframework en function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI-orkestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent architectuur met Customer- en Inventory-agenten |

### Leren via voorbeeldtypen

> **📌 Lokale vs. externe voorbeelden:**  
> **Lokale Voorbeelden** (in deze repo) = Direct klaar voor gebruik  
> **Externe Voorbeelden** (Azure Samples) = Clonen vanuit gekoppelde repositories

#### Lokale voorbeelden (direct klaar voor gebruik)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete productieklare implementatie met ARM-sjablonen
  - Multi-agent architectuur (Customer- + Inventory-agenten)
  - Uitgebreide monitoring en evaluatie
  - Implementatie met één klik via ARM-sjabloon

#### Lokale voorbeelden - Containerapplicaties (Hoofdstukken 2-5)
**Uitgebreide containerimplementatievoorbeelden in deze repository:**
- [**Container App Voorbeelden**](examples/container-app/README.md) - Complete handleiding voor container-implementaties
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met scale-to-zero
  - [Microservices Architectuur](../../examples/container-app/microservices) - Productieklare multi-service implementatie
  - Quick Start-, productie- en geavanceerde implementatiepatronen
  - Monitoring, beveiliging en kostenoptimalisatie richtlijnen

#### Externe voorbeelden - Eenvoudige applicaties (Hoofdstukken 1-2)
**Clone deze Azure Samples repositories om te starten:**
- [Eenvoudige Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basis implementatiepatronen
- [Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statische content-implementatie
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-implementatie

#### Externe voorbeelden - Database-integratie (Hoofdstukken 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectiviteitspatronen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### Externe voorbeelden - Geavanceerde patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productieklare ML-patronen

### Externe sjabloonverzamelingen
- [**Officiële AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Gecureerde collectie van officiële en community-sjablonen
- [**Azure Developer CLI-sjablonen**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sjabloondocumentatie
- [**Voorbeeldmap**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leerbronnen & Referenties

### Snelle Referenties
- [**Commando Spiekbriefje**](resources/cheat-sheet.md) - Essentiële azd-commando's georganiseerd per hoofdstuk
- [**Woordenlijst**](resources/glossary.md) - Azure en azd terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen georganiseerd per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktische Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Maak je AI-oplossingen inzetbaar met AZD (2-3 uur)
- [**Interactieve Workshop Gids**](workshop/README.md) - Browser-based workshop met MkDocs en DevContainer-omgeving
- [**Gestructureerd Leertraject**](../../workshop/docs/instructions) - 7-staps begeleide oefeningen (Ontdekking → Inzet → Aanpassing)
- [**AZD voor Beginners Workshop**](workshop/README.md) - Complete praktische workshopmaterialen met GitHub Codespaces-integratie

### Externe Leerbronnen
- Azure Developer CLI-documentatie (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architectuurcentrum (https://learn.microsoft.com/en-us/azure/architecture/)
- Azure Prijscalculator (https://azure.microsoft.com/pricing/calculator/)
- Azure Status (https://status.azure.com/)

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

# Controleer de installatie
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

# Optie 3: Gedetailleerde logs controleren
azd show
azd logs
```

### ❌ "Authenticatie mislukt" of "Token verlopen"

```bash
# Opnieuw verifiëren
az logout
az login

azd auth logout
azd auth login

# Verifieer authenticatie
az account show
```

### ❌ "Resource bestaat al" of conflicten met namen

```bash
# AZD genereert unieke namen, maar bij een conflict:
azd down --force --purge

# Probeer het dan opnieuw met een nieuwe omgeving
azd env new dev-v2
azd up
```

### ❌ Sjablooninzet duurt te lang

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (OpenAI-provisioning gaat traag)

```bash
# Controleer voortgang
azd show

# Als je meer dan 30 minuten vastzit, controleer dan de Azure Portal:
azd monitor
# Zoek naar mislukte implementaties
```

### ❌ "Toestemming geweigerd" of "Verboden"

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U heeft minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om te verlenen:
# - Contributor (voor bronnen)
# - User Access Administrator (voor roltoewijzingen)
```

### ❌ Kan URL van ingezetde applicatie niet vinden

```bash
# Toon alle service-eindpunten
azd show

# Of open de Azure Portal
azd monitor

# Controleer specifieke service
azd env get-values
# Zoek naar *_URL variabelen
```

### 📚 Volledige Probleemoplossingsbronnen

- **Gids veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/troubleshooting/common-issues.md)
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

# Optie 3: Controleer gedetailleerde logboeken
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

# Verifieer authenticatie
az account show
```
</details>

<details>
<summary><strong>❌ "Resource bestaat al" of conflicten met namen</strong></summary>

```bash
# AZD genereert unieke namen, maar bij conflict:
azd down --force --purge

# Probeer het dan opnieuw met een nieuwe omgeving
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sjablooninzet duurt te lang</strong></summary>

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (OpenAI-provisioning gaat traag)

```bash
# Controleer voortgang
azd show

# Als je >30 minuten vastzit, controleer dan de Azure Portal:
azd monitor
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Toestemming geweigerd" of "Verboden"</strong></summary>

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U heeft minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om te verlenen:
# - Contributor (voor resources)
# - User Access Administrator (voor roltoewijzingen)
```
</details>

<details>
<summary><strong>❌ Kan URL van ingezetde applicatie niet vinden</strong></summary>

```bash
# Toon alle service-eindpunten
azd show

# Of open Azure Portaal
azd monitor

# Controleer specifieke service
azd env get-values
# Zoek naar *_URL variabelen
```
</details>

### 📚 Volledige Probleemoplossingsbronnen

- **Gids veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI Probleemoplossing](docs/troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stapsgewijze debugging](docs/troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Voltooiing & Certificering van de Cursus

### Voortgang bijhouden
Volg je leerproces door elk hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Snelle Start ✅
- [ ] **Hoofdstuk 2**: AI-First Ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructure as Code & Inzet ✅
- [ ] **Hoofdstuk 5**: Multi-Agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Validatie & Planning voor Inzet ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Debugging ✅
- [ ] **Hoofdstuk 8**: Productie- & Enterprisepatronen ✅

### Leer Verificatie
Na het afronden van elk hoofdstuk, verifieer je kennis door:
1. **Praktische Oefening**: Voltooi de hands-on inzet van het hoofdstuk
2. **Kennis Check**: Bekijk de FAQ-sectie voor je hoofdstuk
3. **Community Discussie**: Deel je ervaring in Azure Discord
4. **Volgend Hoofdstuk**: Ga door naar het volgende complexiteitsniveau

### Voordelen van Cursusvoltooiing
Na voltooiing van alle hoofdstukken heb je:
- **Productie-ervaring**: Echt AI-toepassingen ingezet op Azure
- **Professionele Vaardigheden**: Inzet mogelijkheden gereed voor ondernemingen  
- **Community Erkenning**: Actief lid van Azure ontwikkelaars community
- **Carrièrevooruitgang**: Gewilde AZD en AI inzet expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning Krijgen
- **Technische Problemen**: [Meld bugs en vraag om functies](https://github.com/microsoft/azd-for-beginners/issues)
- **Leer Vragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specifieke Hulp**: Sluit je aan bij de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Inzichten van Microsoft Foundry Discord

**Recente Peilingresultaten van #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI workloads
- **Top uitdagingen**: Multi-service inzet, credentialbeheer, productiegereedheid  
- **Meest gevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, best practices

**Word lid van onze community om:**
- Je AZD + AI ervaringen te delen en hulp te krijgen
- Toegang tot vroege previews van nieuwe AI-sjablonen
- Bij te dragen aan AI inzet beste praktijken
- Invloed uit te oefenen op toekomstige AI + AZD functionaliteit

### Bijdragen aan de Cursus
We verwelkomen bijdragen! Lees onze [Bijdragen Gids](CONTRIBUTING.md) voor details over:
- **Inhoud Verbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe Voorbeelden**: Voeg praktijkvoorbeelden en sjablonen toe  
- **Vertaling**: Help meertalige ondersteuning onderhouden
- **Bugrapportages**: Verhoog nauwkeurigheid en duidelijkheid
- **Community Normen**: Volg onze inclusieve community richtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicenseerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft Leerbronnen

Ons team produceert andere uitgebreide leer hun cursussen:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j voor Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js voor Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain voor Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD voor Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI voor Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP voor Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents voor Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatieve AI Series
[![Generatieve AI voor Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

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
 
### Copilot Serie
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelle Start](../..)  
**AI Ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-Eerste Ontwikkeling](../..)  
**Ervaren Ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](../..)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat automatische vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal wordt beschouwd als de gezaghebbende bron. Voor belangrijke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->