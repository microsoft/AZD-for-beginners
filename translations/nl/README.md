# AZD For Beginners: A Structured Learning Journey

![AZD-for-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatische vertalingen (altijd up-to-date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Birmees (Myanmar)](../my/README.md) | [Chinees (vereenvoudigd)](../zh-CN/README.md) | [Chinees (traditioneel, Hongkong)](../zh-HK/README.md) | [Chinees (traditioneel, Macau)](../zh-MO/README.md) | [Chinees (traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Ests](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slovaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thais](../th/README.md) | [Turks](../tr/README.md) | [Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

> **Liever lokaal klonen?**
>
> Deze repository bevat meer dan 50 taalvertalingen, wat de downloadgrootte aanzienlijk vergroot. Om te klonen zonder vertalingen, gebruik sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Wat is er nieuw in azd vandaag

Azure Developer CLI is uitgegroeid voorbij traditionele webapps en API's. Vandaag is azd het enige hulpmiddel om **elke** applicatie naar Azure te deployen — inclusief AI-aangedreven applicaties en intelligente agenten.

Dit betekent voor jou het volgende:

- **AI-agents zijn nu eersteklas azd-workloads.** Je kunt AI-agentprojecten initialiseren, uitrollen en beheren met dezelfde `azd init` → `azd up` workflow die je al kent.
- **Integratie met Microsoft Foundry** brengt modeldeployment, agent-hosting en AI-serviceconfiguratie direct naar het azd-template-ecosysteem.
- **De kernworkflow is niet veranderd.** Of je nu een todo-app, een microservice of een multi-agent AI-oplossing uitrolt, de commando's zijn hetzelfde.

Als je azd eerder hebt gebruikt, is AI-ondersteuning een natuurlijke uitbreiding — geen apart hulpmiddel of een geavanceerd traject. Als je nieuw begint, leer je één workflow die voor alles werkt.

---

## 🚀 Wat is Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarsvriendelijke commandoregeltool die het eenvoudig maakt om applicaties naar Azure te deployen. In plaats van handmatig tientallen Azure-resources te maken en te koppelen, kun je hele applicaties met één commando uitrollen.

### De magie van `azd up`

```bash
# Deze enkele opdracht doet alles:
# ✅ Maakt alle Azure-resources aan
# ✅ Configureert netwerken en beveiliging
# ✅ Bouwt je applicatiecode
# ✅ Zet het uit naar Azure
# ✅ Geeft je een werkende URL
azd up
```

**Dat is alles!** Geen klikken in de Azure Portal, geen complexe ARM-templates die je eerst moet leren, geen handmatige configuratie — alleen werkende applicaties op Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wat is het verschil?

Dit is de meest gestelde vraag door beginners. Hier is het eenvoudige antwoord:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Manage individual Azure resources | Deploy complete applications |
| **Mindset** | Infrastructure-focused | Application-focused |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Must know Azure services | Just know your app |
| **Best For** | DevOps, Infrastructure | Developers, Prototyping |

### Simpele analogie

- **Azure CLI** is als het hebben van alle gereedschappen om een huis te bouwen — hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet bouwkundig weten wat je doet.
- **Azure Developer CLI** is als het inhuren van een aannemer — je beschrijft wat je wilt, en zij regelen de bouw.

### Wanneer gebruik je welke

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Ze werken samen!

AZD gebruikt Azure CLI onder de motorkap. Je kunt beide gebruiken:
```bash
# Zet je app uit met AZD
azd up

# Verfijn vervolgens specifieke bronnen met Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind templates in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communityverzameling van kant-en-klare templates om direct te deployen:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Blader door 200+ templates met één-klik deploy |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Draag je eigen template bij aan de community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star en verken de bron |

### Populaire AI-templates van Awesome AZD

```bash
# RAG Chat met Microsoft Foundry Modellen + AI Zoekfunctie
azd init --template azure-search-openai-demo

# Snelle AI Chat Applicatie
azd init --template openai-chat-app-quickstart

# AI Agenten met Foundry Agenten
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aan de slag in 3 stappen

### Stap 1: Installeer AZD (2 minuten)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Stap 2: Inloggen bij Azure

```bash
azd auth login
```

### Stap 3: Deploy je eerste app

```bash
# Initialiseren vanaf een sjabloon
azd init --template todo-nodejs-mongo

# Implementeren naar Azure (maakt alles aan!)
azd up
```

**🎉 Dat is alles!** Je app staat nu live op Azure.

### Opruimen (Niet vergeten!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hoe je deze cursus gebruikt

Deze cursus is ontworpen voor **progressief leren** — begin waar je je comfortabel bij voelt en werk jezelf omhoog:

| Your Experience | Start Here |
|-----------------|------------|
| **Brand new to Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Know Azure, new to AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Want to deploy AI apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Want hands-on practice** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Need production patterns** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Snelle installatie

1. **Fork deze repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone hem**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hulp krijgen**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Liever lokaal klonen?**

> Deze repository bevat meer dan 50 taalvertalingen, wat de downloadgrootte aanzienlijk vergroot. Om te klonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> This gives you everything you need to complete the course with a much faster download.


## Course Overview

Master Azure Developer CLI (azd) through structured chapters designed for progressive learning. **Special focus on AI application deployment with Microsoft Foundry integration.**

### Waarom deze cursus essentieel is voor moderne ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community wil **45% van de ontwikkelaars AZD gebruiken voor AI-workloads**, maar ze lopen tegen uitdagingen aan bij:
- Complexe multi-service AI-architecturen
- Best practices voor AI-deployments in productie  
- Integratie en configuratie van Azure AI-services
- Kostenoptimalisatie voor AI-workloads
- Problemen oplossen bij AI-specifieke deployments

### Leerdoelen

Door deze gestructureerde cursus te voltooien zul je:
- **AZD-grondbeginselen beheersen**: Kernconcepten, installatie en configuratie
- **AI-applicaties deployen**: Gebruik AZD met Microsoft Foundry-services
- **Infrastructure as Code implementeren**: Beheer Azure-resources met Bicep-templates
- **Deployments troubleshooten**: Los veelvoorkomende problemen op en debug fouten
- **Optimaliseren voor productie**: Beveiliging, schaling, monitoring en kostenbeheer
- **Multi-agent oplossingen bouwen**: Deploy complexe AI-architecturen

## 🗺️ Cursuskaart: Snelle navigatie per hoofdstuk

Elk hoofdstuk heeft een eigen README met leerdoelen, quickstarts en oefeningen:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Aan de slag | [AZD Basisprincipes](docs/chapter-01-foundation/azd-basics.md) &#124; [Installatie](docs/chapter-01-foundation/installation.md) &#124; [Eerste project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Hfdst 2: AI-ontwikkeling](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 uur | ⭐⭐ |
| **[Hfdst 3: Configuratie](docs/chapter-03-configuration/README.md)** | Authenticatie & Beveiliging | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Hfdst 4: Infrastructuur](docs/chapter-04-infrastructure/README.md)** | IaC & Implementatie | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 uur | ⭐⭐⭐ |
| **[Hfdst 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[Hfdst 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validatie | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Hfdst 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 uur | ⭐⭐ |
| **[Hfdst 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktijklab | [Introductie](workshop/docs/instructions/0-Introduction.md) &#124; [Selectie](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Opruimen](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afronding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 uur | ⭐⭐ |

**Totale cursusduur:** ~10-14 uur | **Vaardigheidsontwikkeling:** Beginner → Productieklaar

---

## 📚 Leerhoofdstukken

*Kies je leerpad op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Basis & Snelstart
**Vereisten**: Azure-abonnement, basiskennis van de opdrachtregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je zult leren
- Inzicht in de basisprincipes van Azure Developer CLI
- AZD installeren op je platform
- Je eerste succesvolle implementatie

#### Leermaterialen
- **🎯 Start hier**: [Wat is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD basisprincipes](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Setup**: [Installatie & Setup](docs/chapter-01-foundation/installation.md) - Platform-specifieke handleidingen
- **🛠️ Hands-On**: [Je eerste project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze handleiding
- **📋 Snelle referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische oefeningen
```bash
# Snelle installatiecontrole
azd version

# Implementeer je eerste applicatie
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hoofdstukresultaat**: Een eenvoudige webapplicatie succesvol naar Azure implementeren met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1 zou je in staat moeten zijn om:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert het project
azd up                  # Implementeert naar Azure
azd show                # Toont de URL van de draaiende app
# De applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren

---

### 🤖 Hoofdstuk 2: AI-first-ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Microsoft Foundry-integratie met AZD
- AI-gestuurde applicaties implementeren
- Inzicht in AI-serviceconfiguraties

#### Leermaterialen
- **🎯 Start hier**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenten**: [Gids voor AI-agenten](docs/chapter-02-ai-development/agents.md) - Implementeer intelligente agenten met AZD
- **📖 Patronen**: [AI-modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementeren en beheren van AI-modellen
- **🛠️ Workshop**: [AI-workshoplab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browsergebaseerd leren met MkDocs * DevContainer Environment
- **📋 Sjablonen**: [Microsoft Foundry Templates](#workshopbronnen)
- **📝 Voorbeelden**: [AZD-implementatievoorbeelden](examples/README.md)

#### Praktische oefeningen
```bash
# Implementeer je eerste AI-toepassing
azd init --template azure-search-openai-demo
azd up

# Probeer extra AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hoofdstukresultaat**: Een AI-gestuurde chatapplicatie implementeren en configureren met RAG-mogelijkheden

**✅ Succesvalidatie:**
```bash
# Na hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# De AI-chatinterface testen
# Vragen stellen en AI-gestuurde antwoorden met bronnen krijgen
# Controleren of de zoekintegratie werkt
azd monitor  # Controleren of Application Insights telemetrie weergeeft
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan productieklaar AI-applicaties implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijp ontwikkelkosten van $80-150/maand, productiekosten $300-3500/maand

#### 💰 Kostenoverwegingen voor AI-implementaties

**Ontwikkelomgeving (Geschat $80-150/maand):**
- Microsoft Foundry-modellen (Pay-as-you-go): $0-50/maand (gebaseerd op tokengebruik)
- AI Search (Basic tier): $75/maand
- Container Apps (Consumption): $0-20/maand
- Opslag (Standaard): $1-5/maand

**Productieomgeving (Geschat $300-3,500+/maand):**
- Microsoft Foundry-modellen (PTU voor consistente prestaties): $3,000+/maand OF Pay-as-you-go bij hoog volume
- AI Search (Standard tier): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Opslag (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik **Free Tier** Microsoft Foundry-modellen voor leren (Azure OpenAI 50,000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources te dealloceren wanneer je niet actief ontwikkelt
- Begin met consumption-gebaseerde facturering, upgrade alleen naar PTU voor productie
- Gebruik `azd provision --preview` om kosten te schatten vóór implementatie
- Schakel autoscaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenbewaking:**
```bash
# Controleer de geschatte maandelijkse kosten
azd provision --preview

# Houd de werkelijke kosten in het Azure-portaal bij
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Omgevingsconfiguratie en -beheer
- Authenticatie- en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leermaterialen
- **📖 Configuratie**: [Configuratiehandleiding](docs/chapter-03-configuration/configuration.md) - Omgeving opzetten
- **🔐 Beveiliging**: [Authenticatiepatronen en beheerde identiteit](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database-appvoorbeeld](examples/database-app/README.md) - AZD-databasevoorbeelden

#### Praktische oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel verificatie met beheerde identiteit in
- Implementeer omgevingsspecifieke configuraties

**💡 Hoofdstukresultaat**: Beheer meerdere omgevingen met juiste authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructuur als Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1.5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je zult leren
- Geavanceerde implementatiepatronen
- Infrastructuur als Code met Bicep
- Strategieën voor resource-provisioning

#### Leermaterialen
- **📖 Implementatie**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Volledige workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container App Example](../../examples/container-app) - Containerimplementaties

#### Praktische oefeningen
- Maak aangepaste Bicep-sjablonen
- Implementeer multi-service applicaties
- Implementeer blue-green implementatiestrategieën

**💡 Hoofdstukresultaat**: Implementeer complexe multi-service applicaties met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-agent AI-oplossingen (Geavanceerd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Multi-agent architectuurpatronen
- Agent-orchestratie en coördinatie
- Productieklaar AI-implementaties

#### Leermaterialen
- **🤖 Uitgelicht project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM-sjablonen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Een-klik-implementatie
- **📖 Architectuur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktische oefeningen
```bash
# Rol de complete retail multi-agent oplossing uit
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hoofdstukresultaat**: Een productieklaar multi-agent AI-oplossing implementeren en beheren met Klant- en Voorraad-agenten

---

### 🔍 Hoofdstuk 6: Validatie & planning vóór implementatie
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Capaciteitsplanning en resource-validatie
- Strategieën voor SKU-selectie
- Preflight-controles en automatisering

#### Leermaterialen
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource-validatie
- **💰 Selectie**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deployment-controles

**💡 Hoofdstukresultaat**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Probleemoplossing & debuggen
**Vereisten**: Elk implementatiehoofdstuk voltooid  
**Duur**: 1-1.5 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Systeematische debugmethoden
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leermaterialen
- **🔧 Veelvoorkomende problemen**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debuggen**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI-problemen**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktische oefeningen
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug AI-serviceconnectiviteit

**💡 Hoofdstukresultaat**: Zelfstandig veelvoorkomende implementatieproblemen diagnosticeren en oplossen

---

### 🏢 Hoofdstuk 8: Productie & Enterprise-patronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Productie-implementatiestrategieën
- Enterprise-beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leermaterialen
- **🏭 Productie**: [Productie AI beste praktijken](docs/chapter-08-production/production-ai-practices.md) - Enterprise-patronen
- **📝 Voorbeelden**: [Microservices Voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Integratie van Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische Oefeningen
- Implementeer enterprise beveiligingspatronen
- Stel uitgebreide monitoring in
- Rol uit naar productie met de juiste governance

**💡 Hoofdstukresultaat**: Implementeer enterprise-klare applicaties met volledige productiecapaciteiten

---

## 🎓 Workshop Overzicht: Praktische leerervaring

> **⚠️ STATUS VAN DE WORKSHOP: Actieve ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. De kernmodules zijn functioneel, maar sommige geavanceerde secties zijn onvolledig. We werken actief aan het voltooien van alle inhoud. [Volg voortgang →](workshop/README.md)

### Interactieve Workshopmaterialen
**Uitgebreide praktijkgerichte leerervaring met browsergebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hierboven genoemde hoofdstukgebaseerde curriculum aanvult. De workshop is ontworpen voor zowel zelfstudie als door een instructeur geleide sessies.

#### 🛠️ Workshopfuncties
- **Browser-Based Interface**: Complete MkDocs-powered workshop met zoek-, kopieer- en themafuncties
- **GitHub Codespaces Integration**: Eén-klik voor het opzetten van de ontwikkelomgeving
- **Structured Learning Path**: 8-module geleide oefeningen (3-4 uur totaal)
- **Progressive Methodology**: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Afbouw → Afronding
- **Interactive DevContainer Environment**: Vooraf geconfigureerde tools en afhankelijkheden

#### 📚 Workshop Module Structure
De workshop volgt een **8-module progressieve methodologie** die je van ontdekking naar uitrolmeesterschap brengt:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introductie** | Workshopoverzicht | Begrijp leerdoelen, vereisten en workshopstructuur | 15 min |
| **1. Selectie** | Sjabloonontdekking | Verken AZD-sjablonen en selecteer het juiste AI-sjabloon voor jouw scenario | 20 min |
| **2. Validatie** | Uitrollen & Verifiëren | Rol het sjabloon uit met `azd up` en verifieer dat de infrastructuur werkt | 30 min |
| **3. Deconstructie** | Begrijp de structuur | Gebruik GitHub Copilot om sjabloonarchitectuur, Bicep-bestanden en codeorganisatie te verkennen | 30 min |
| **4. Configuratie** | Diepgaande azure.yaml | Beheers `azure.yaml`-configuratie, lifecycle hooks en omgevingsvariabelen | 30 min |
| **5. Aanpassing** | Maak het van jou | Schakel AI Search, tracing, evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Afbouw** | Opruimen | Deprovisioneer veilig resources met `azd down --purge` | 15 min |
| **7. Afronding** | Volgende stappen | Beoordeel behaalde resultaten, kernconcepten en zet je leertraject voort | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Aan de slag met de workshop
```bash
# Optie 1: GitHub Codespaces (Aanbevolen)
# Klik op "Code" → "Create codespace on main" in de repository

# Optie 2: Lokale ontwikkeling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Volg de installatie-instructies in workshop/README.md
```

#### 🎯 Leerresultaten van de workshop
Door de workshop te voltooien, zullen deelnemers:
- **Uitrollen van productie-AI-toepassingen**: Gebruik AZD met Microsoft Foundry-services
- **Beheers multi-agent-architecturen**: Implementeer gecoördineerde AI-agentoplossingen
- **Implementeer beste beveiligingspraktijken**: Configureer authenticatie en toegangsbeheer
- **Optimaliseer voor schaal**: Ontwerp kosteneffectieve, goed presterende implementaties
- **Los deploymentproblemen op**: Los veelvoorkomende problemen zelfstandig op

#### 📖 Workshopbronnen
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Module-voor-module instructies**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Overzicht van de workshop en doelstellingen
  - [1. Selectie](workshop/docs/instructions/1-Select-AI-Template.md) - Vind en selecteer AI-sjablonen
  - [2. Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) - Rol sjablonen uit en verifieer
  - [3. Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken sjabloonarchitectuur
  - [4. Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers azure.yaml
  - [5. Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Afbouw](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Afronding](workshop/docs/instructions/7-Wrap-up.md) - Beoordeel en volgende stappen
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Oefeningen gericht op AI
- **💡 Snelstart**: [Workshop Installatiegids](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: bedrijfstrainingen, universitaire cursussen, zelfstudie en bootcamps voor ontwikkelaars.

---

## 📖 Diepgaande verkenning: AZD-mogelijkheden

Naast de basis biedt AZD krachtige functies voor productie-implementaties:

- **Sjabloon-gebaseerde implementaties** - Gebruik vooraf gebouwde sjablonen voor veelvoorkomende applicatiepatronen
- **Infrastructuur als Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Voorzie, implementeer en monitor applicaties naadloos
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor ontwikkelaarsproductiviteit en -ervaring

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de belangrijkste uitdagingen aan waar AI-ontwikkelaars mee te maken hebben:

- **AI-klare sjablonen** - Vooraf geconfigureerde sjablonen voor Microsoft Foundry Models, Cognitive Services en ML-workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-services, API-sleutels en model-eindpunten  
- **Productie-AI-patronen** - Beste praktijken voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-end AI-workflows** - Van modelontwikkeling tot productie-implementatie met adequate monitoring
- **Kostenoptimalisatie** - Slimme resource-toewijzing en schaalstrategieën voor AI-workloads
- **Integratie met Microsoft Foundry** - Naadloze koppeling met de Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Sjablonen & Voorbeeldenbibliotheek

### Uitgelicht: Microsoft Foundry-sjablonen
**Begin hier als je AI-toepassingen uitrolt!**

> **Opmerking:** Deze sjablonen demonstreren verschillende AI-patronen. Sommige zijn externe Azure Samples, andere zijn lokale implementaties.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Complete leerscenario's
**Productieklare applicatiesjablonen gekoppeld aan leershoofdstukken**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Document Intelligence-integratie |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agentframework en functie-aanroepen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI-orchestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agentarchitectuur met klant- en voorraadagents |

### Learning by Example Type

> **📌 Lokale versus externe voorbeelden:**  
> **Lokale voorbeelden** (in deze repo) = Klaar voor direct gebruik  
> **Externe voorbeelden** (Azure Samples) = Clone vanuit de gekoppelde repositories

#### Lokale voorbeelden (klaar voor gebruik)
- [**Retail Multi-Agent Oplossing**](examples/retail-scenario.md) - Complete productieklare implementatie met ARM-sjablonen
  - Multi-agentarchitectuur (klant- en voorraadagents)
  - Uitgebreide monitoring en evaluatie
  - Eén-klik implementatie via ARM-sjabloon

#### Lokale voorbeelden - Containerapplicaties (Hoofdstukken 2-5)
**Uitgebreide voorbeelden van containerimplementaties in deze repository:**
- [**Container App Voorbeelden**](examples/container-app/README.md) - Volledige handleiding voor containerimplementaties
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST-API met scale-to-zero
  - [Microservices Architectuur](../../examples/container-app/microservices) - Productieklaar multi-service-implementatie
  - Quick Start, Production, and Advanced deployment patterns
  - Richtlijnen voor monitoring, beveiliging, en kostenoptimalisatie

#### Externe voorbeelden - Eenvoudige applicaties (Hoofdstukken 1-2)
**Clone deze Azure Samples repositories om te beginnen:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basis implementatiepatronen
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementatie van statische content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API implementatie

#### Externe voorbeelden - Database-integratie (Hoofdstuk 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patronen voor databaseconnectiviteit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverloze data-workflow

#### Externe voorbeelden - Geavanceerde patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productieklare ML-patronen

### Externe sjabloonverzamelingen
- [**Officiële AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Gecureerde collectie van officiële en community-sjablonen
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sjabloondocumentatie
- [**Examples Directory**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leerbronnen & Referenties

### Snelreferenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's georganiseerd per hoofdstuk
- [**Glossary**](resources/glossary.md) - Azure en azd terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen georganiseerd per leershoofdstuk
- [**Study Guide**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktijkgerichte workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-implementatieklaar (2-3 uur)
- [**Interactieve Workshop**](workshop/README.md) - 8-module geleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Afbouw → Afronding

### Externe leermaterialen
- [Documentatie Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prijsberekenaar](https://azure.microsoft.com/pricing/calculator/)
- [Azure-status](https://status.azure.com/)

### AI-agentvaardigheden voor je editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agentvaardigheden voor Azure AI, Foundry, deployment, diagnostiek, kostenoptimalisatie en meer. Installeer ze in GitHub Copilot, Cursor, Claude Code, of elke ondersteunde agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snelgids voor probleemoplossing

**Veelvoorkomende problemen waar beginners tegenaan lopen en directe oplossingen:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installeer AZD eerst
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Controleer installatie
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Beschikbare abonnementen weergeven
az account list --output table

# Standaardabonnement instellen
az account set --subscription "<subscription-id-or-name>"

# Instellen voor AZD-omgeving
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiëren
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

```bash
# Probeer een andere Azure-regio
azd env set AZURE_LOCATION "westus2"
azd up

# Of gebruik kleinere SKU's tijdens ontwikkeling
# Bewerk infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Optie 1: Opschonen en opnieuw proberen
azd down --force --purge
azd up

# Optie 2: Alleen de infrastructuur herstellen
azd provision

# Optie 3: Controleer de gedetailleerde status
azd show

# Optie 4: Controleer de logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD genereert unieke namen, maar als er een conflict:
azd down --force --purge

# Probeer dan opnieuw met een schone omgeving
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (OpenAI-provisioning is traag)

```bash
# Controleer de voortgang
azd show

# Als je langer dan 30 minuten vastzit, controleer de Azure Portal:
azd monitor
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U hebt minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om toe te kennen:
# - Contributor (voor bronnen)
# - User Access Administrator (voor roltoewijzingen)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Toon alle service-eindpunten
azd show

# Of open de Azure Portal
azd monitor

# Controleer een specifieke service
azd env get-values
# Zoek naar *_URL-variabelen
```
</details>

### 📚 Volledige bronnen voor probleemoplossing

- **Gids Veelvoorkomende Problemen:** [Gedetailleerde oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI-probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stap-voor-stap Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Krijg hulp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursusafronding & Certificering

### Voortgang bijhouden
Volg je voortgang per hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Snelstart ✅
- [ ] **Hoofdstuk 2**: AI-first ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructure as Code & Implementatie ✅
- [ ] **Hoofdstuk 5**: Multi-agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Validatie en planning vóór implementatie ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Foutopsporing ✅
- [ ] **Hoofdstuk 8**: Productie- en zakelijke patronen ✅

### Verificatie van het leren
Na het voltooien van elk hoofdstuk, verifieer je kennis door:
1. **Praktische oefening**: Voltooi de hands-on deployment van het hoofdstuk
2. **Kenniscontrole**: Bekijk de FAQ-sectie voor je hoofdstuk
3. **Communitydiscussie**: Deel je ervaring in Azure Discord
4. **Volgend hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen bij afronding van de cursus
Na het voltooien van alle hoofdstukken zul je hebben:
- **Productie-ervaring**: Echte AI-toepassingen naar Azure uitgerold
- **Professionele vaardigheden**: Enterprise-klare deployment-capaciteiten  
- **Communityerkenning**: Actief lid van de Azure-developercommunity
- **Carrièrestimulans**: Gewilde AZD- en AI-deploymentexpertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning
- **Technische problemen**: [Rapporteer bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Leervragen**: [Microsoft Azure Discord-community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke hulp**: Word lid van de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-inzichten van Microsoft Foundry Discord

**Recente peilingresultaten van het #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI-werklasten
- **Belangrijkste uitdagingen**: Multi-service implementaties, referentiebeheer, productie-klaar maken  
- **Meest gevraagd**: AI-specifieke templates, probleemoplossingsgidsen, best practices

**Doe mee met onze community om:**
- Deel je AZD + AI-ervaringen en krijg hulp
- Toegang tot vroege previews van nieuwe AI-templates
- Draag bij aan best practices voor AI-implementatie
- Beïnvloed toekomstige AI + AZD functieontwikkeling

### Bijdragen aan de cursus
We verwelkomen bijdragen! Lees onze [Richtlijnen voor bijdragen](CONTRIBUTING.md) voor details over:
- **Inhoudsverbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe voorbeelden**: Voeg praktijkvoorbeelden en templates toe  
- **Vertaling**: Help bij het onderhouden van meertalige ondersteuning
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Communitynormen**: Volg onze inclusieve communityrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE)-bestand voor details.

### Gerelateerde Microsoft-leerbronnen

Ons team produceert andere uitgebreide leercursussen:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
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
 
### Kernleer
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot voor AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot voor C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Avontuur](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelle Start](#-chapter-1-foundation--quick-start)  
**AI-ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-eerst ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](#️-chapter-3-configuration--authentication)

**Volgende stappen**: [Begin Chapter 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor belangrijke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->