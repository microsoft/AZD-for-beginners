# AZD Voor Beginners: Een Gestructureerd Leertraject

![AZD-voor-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub kijkers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub sterren](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Geautomatiseerde vertalingen (Altijd actueel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Birmees (Myanmar)](../my/README.md) | [Chinees (vereenvoudigd)](../zh-CN/README.md) | [Chinees (traditioneel, Hong Kong)](../zh-HK/README.md) | [Chinees (traditioneel, Macau)](../zh-MO/README.md) | [Chinees (traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Ests](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigeriaans Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slowaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thais](../th/README.md) | [Turks](../tr/README.md) | [Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

> **Liever lokaal klonen?**
>
> Deze repository bevat meer dan 50 taalvertalingen, waardoor de downloadgrootte aanzienlijk toeneemt. Om te clonen zonder vertalingen, gebruik sparse checkout:
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

## 🆕 Wat is er vandaag nieuw in azd

Azure Developer CLI is gegroeid voorbij traditionele web-apps en API's. Vandaag is azd het enige hulpmiddel om **elke** applicatie naar Azure te implementeren — inclusief AI-aangedreven applicaties en intelligente agenten.

Dit betekent het volgende voor jou:

- **AI-agenten zijn nu eersteklas azd-workloads.** Je kunt AI-agentprojecten initialiseren, implementeren en beheren met dezelfde `azd init` → `azd up` workflow die je al kent.
- **Integratie met Microsoft Foundry** brengt modelimplementatie, agent-hosting en AI-serviceconfiguratie rechtstreeks in het azd-sjabloonecosysteem.
- **De kernworkflow is niet veranderd.** Of je nu een todo-app, een microservice of een multi-agent AI-oplossing implementeert, de commando's zijn hetzelfde.

Als je azd eerder hebt gebruikt, is AI-ondersteuning een natuurlijke uitbreiding — geen apart hulpmiddel of een gevorderd traject. Als je nieuw begint, leer je één workflow die voor alles werkt.

---

## 🚀 Wat is Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarvriendelijke commandoregels-tool die het eenvoudig maakt om applicaties naar Azure te implementeren. In plaats van handmatig tientallen Azure-resources te creëren en te koppelen, kun je volledige applicaties implementeren met één enkel commando.

### De magie van `azd up`

```bash
# Dit enkele commando doet alles:
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

| Kenmerk | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Doel** | Beheer individuele Azure-resources | Implementeer complete applicaties |
| **Denkwijze** | Infrastructuurgericht | Applicatiegericht |
| **Voorbeeld** | `az webapp create --name myapp...` | `azd up` |
| **Leercurve** | Je moet Azure-services kennen | Ken alleen je app |
| **Het meest geschikt voor** | DevOps, infrastructuur | Ontwikkelaars, prototyping |

### Eenvoudige analogie

- **Azure CLI** is alsof je alle gereedschappen hebt om een huis te bouwen — hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet weten hoe bouwen werkt.
- **Azure Developer CLI** is alsof je een aannemer inhuurt — je beschrijft wat je wilt en zij regelen de bouw.

### Wanneer gebruik je welke

| Scenario | Gebruik dit |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Ze werken samen!

AZD gebruikt Azure CLI onder de motorkap. Je kunt beide gebruiken:
```bash
# Zet je app in met AZD
azd up

# Stel daarna specifieke resources bij met Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind sjablonen in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communitycollectie van kant-en-klare sjablonen om te implementeren:

| Resource | Beschrijving |
|----------|-------------|
| 🔗 [**Awesome AZD-galerij**](https://azure.github.io/awesome-azd/) | Blader door 200+ sjablonen met één-klik implementatie |
| 🔗 [**Sjabloon indienen**](https://github.com/Azure/awesome-azd/issues) | Draag je eigen sjabloon bij aan de community |
| 🔗 [**GitHub-repository**](https://github.com/Azure/awesome-azd) | Geef een ster en verken de bron |

### Populaire AI-sjablonen van Awesome AZD

```bash
# RAG Chat met Microsoft Foundry-modellen + AI-zoekfunctie
azd init --template azure-search-openai-demo

# Snelle AI-chatapplicatie
azd init --template openai-chat-app-quickstart

# AI-agenten met Foundry-agenten
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

### Stap 3: Implementeer je eerste app

```bash
# Initialiseren vanuit een sjabloon
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

## 📚 Hoe gebruik je deze cursus

Deze cursus is ontworpen voor **progressief leren** — begin waar je je comfortabel bij voelt en werk jezelf omhoog:

| Je ervaring | Begin hier |
|-----------------|------------|
| **Helemaal nieuw met Azure** | [Hoofdstuk 1: Basis](#-chapter-1-foundation--quick-start) |
| **Kent Azure, nieuw met AZD** | [Hoofdstuk 1: Basis](#-chapter-1-foundation--quick-start) |
| **Wil AI-apps implementeren** | [Hoofdstuk 2: AI-eerst ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Wil hands-on oefening** | [🎓 Interactieve Workshop](workshop/README.md) - 3-4 uur begeleide lab |
| **Heb je productiepatronen nodig** | [Hoofdstuk 8: Productie & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Snelle setup

1. **Maak een fork van deze repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloon het**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Krijg hulp**: [Azure Discord-community](https://discord.com/invite/ByRwuEEgH4)

> **Liever lokaal klonen?**

> Deze repository bevat meer dan 50 taalvertalingen, waardoor de downloadgrootte aanzienlijk toeneemt. Om te clonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.


## Overzicht van de Cursus

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken die ontworpen zijn voor progressief leren. **Speciale focus op het implementeren van AI-applicaties met Microsoft Foundry-integratie.**

### Waarom deze cursus essentieel is voor moderne ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community, wil **45% van de ontwikkelaars AZD gebruiken voor AI-workloads**, maar ze lopen tegen uitdagingen aan met:
- Complexe multi-service AI-architecturen
- Productie-implementatie best practices voor AI  
- Integratie en configuratie van Azure AI-services
- Kostenoptimalisatie voor AI-workloads
- Problemen oplossen bij AI-specifieke implementaties

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zul je:
- **AZD-grondbeginselen beheersen**: Kernconcepten, installatie en configuratie
- **AI-applicaties implementeren**: Gebruik AZD met Microsoft Foundry-services
- **Infrastructuur als code implementeren**: Beheer Azure-resources met Bicep-sjablonen
- **Implementaties debuggen**: Los veelvoorkomende problemen op en debug fouten
- **Optimaliseren voor productie**: Beveiliging, schaalbaarheid, monitoring en kostenbeheer
- **Multi-agent oplossingen bouwen**: Implementeer complexe AI-architecturen

## 🗺️ Cursusoverzicht: Snelle navigatie per hoofdstuk

Elk hoofdstuk heeft een toegewijd README met leerdoelen, snelle starts en oefeningen:

| Hoofdstuk | Onderwerp | Lessen | Duur | Complexiteit |
|---------|-------|---------|----------|------------|
| **[Ch 1: Basis](docs/chapter-01-foundation/README.md)** | Aan de slag | [AZD Basis](docs/chapter-01-foundation/azd-basics.md) &#124; [Installatie](docs/chapter-01-foundation/installation.md) &#124; [Eerste project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI-ontwikkeling](docs/chapter-02-ai-development/README.md)** | AI-first apps | [Foundry-integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agents](docs/chapter-02-ai-development/agents.md) &#124; [Modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuratie](docs/chapter-03-configuration/README.md)** | Authenticatie & beveiliging | [Configuratie](docs/chapter-03-configuration/configuration.md) &#124; [Authenticatie & beveiliging](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructuur](docs/chapter-04-infrastructure/README.md)** | IaC & uitrol | [Uitrolgids](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentoplossingen | [Retailscenario](examples/retail-scenario.md) &#124; [Coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & validatie | [Preflight-controles](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Probleemoplossing](docs/chapter-07-troubleshooting/README.md)** | Debuggen & oplossen | [Veelvoorkomende problemen](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggen](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemen](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Productie](docs/chapter-08-production/README.md)** | Enterprise-patronen | [Productiepraktijken](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktijklab | [Introductie](workshop/docs/instructions/0-Introduction.md) &#124; [Selectie](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Ontleding](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Afbouw](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afronding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Totale cursusduur:** ~10-14 hours | **Vaardigheidsontwikkeling:** Beginner → Klaar voor productie

---

## 📚 Leerhoofdstukken

*Kies je leerpad op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Basis & Snelstart
**Vereisten**: Azure-abonnement, basiskennis van de opdrachtregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je zult leren
- Begrijpen van de basisprincipes van Azure Developer CLI
- AZD installeren op je platform
- Je eerste succesvolle uitrol

#### Leermaterialen
- **🎯 Begin hier**: [Wat is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD Basisprincipes](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Installatie**: [Installatie & configuratie](docs/chapter-01-foundation/installation.md) - Platformspecifieke gidsen
- **🛠️ Hands-On**: [Je Eerste Project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze handleiding
- **📋 Snelle referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische Oefeningen
```bash
# Snelle installatiecontrole
azd version

# Implementeer uw eerste applicatie
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hoofdstukresultaat**: Een eenvoudige webapplicatie succesvol naar Azure uitrollen met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van hoofdstuk 1 moet je in staat zijn om:
azd version              # Toont de geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert het project
azd up                  # Deployt naar Azure
azd show                # Toont de URL van de draaiende app
# De applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt bronnen op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig uitrollen
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig uitrollen

---

### 🤖 Hoofdstuk 2: AI-first ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Microsoft Foundry-integratie met AZD
- AI-gestuurde applicaties uitrollen
- Begrijpen van AI-serviceconfiguraties

#### Leermaterialen
- **🎯 Begin hier**: [Microsoft Foundry-integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agents**: [Gids voor AI-agents](docs/chapter-02-ai-development/agents.md) - Implementeer intelligente agenten met AZD
- **📖 Patronen**: [Modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementeer en beheer AI-modellen
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshop Materials](workshop/README.md) - Browsergebaseerd leren met MkDocs * DevContainer-omgeving
- **📋 Sjablonen**: [Microsoft Foundry-sjablonen](#workshopbronnen)
- **📝 Voorbeelden**: [AZD Implementatievoorbeelden](examples/README.md)

#### Praktische Oefeningen
```bash
# Implementeer je eerste AI-applicatie
azd init --template azure-search-openai-demo
azd up

# Probeer extra AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hoofdstukresultaat**: Een AI-gestuurde chatapplicatie met RAG-mogelijkheden implementeren en configureren

**✅ Succesvalidatie:**
```bash
# Na hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# Test de AI-chatinterface
# Stel vragen en ontvang AI-gegenereerde antwoorden met bronnen
# Controleer of de zoekintegratie werkt
azd monitor  # Controleer of Application Insights telemetrie weergeeft
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan productieklare AI-applicaties uitrollen en configureren  
**💰 Kostenbewustzijn:** Begrijp ontwikkelkosten van $80-150/maand, productiekosten van $300-3500/maand

#### 💰 Kostenoverwegingen voor AI-implementaties

**Ontwikkelomgeving (Schatting $80-150/maand):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/maand (afhankelijk van tokengebruik)
- AI Search (Basic-laag): $75/maand
- Container Apps (Consumption): $0-20/maand
- Opslag (Standaard): $1-5/maand

**Productieomgeving (Schatting $300-3.500+/maand):**
- Microsoft Foundry Models (PTU voor consistente prestaties): $3.000+/maand OF Pay-as-go bij hoog volume
- AI Search (Standaard-laag): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Opslag (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik de **Free Tier** van Microsoft Foundry Models voor leren (Azure OpenAI 50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources vrij te geven wanneer je niet actief ontwikkelt
- Begin met verbruikgebaseerde facturatie, upgrade naar PTU alleen voor productie
- Gebruik `azd provision --preview` om kosten te schatten vóór implementatie
- Schakel autoscaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenbewaking:**
```bash
# Controleer geschatte maandelijkse kosten
azd provision --preview

# Controleer werkelijke kosten in de Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Omgevingsconfiguratie en -beheer
- Authenticatie- en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leermaterialen
- **📖 Configuratie**: [Configuratiegids](docs/chapter-03-configuration/configuration.md) - Omgevingssetup
- **🔐 Beveiliging**: [Authenticatiepatronen en managed identity](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database-appvoorbeeld](examples/database-app/README.md) - AZD-databasevoorbeelden

#### Praktische Oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel managed identity-authenticatie in
- Implementeer omgevingsspecifieke configuraties

**💡 Hoofdstukresultaat**: Beheer meerdere omgevingen met de juiste authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructuur als code & uitrol
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je zult leren
- Geavanceerde uitrolpatronen
- Infrastructuur als code met Bicep
- Strategieën voor resourcevoorziening

#### Leermaterialen
- **📖 Uitrol**: [Uitrolgids](docs/chapter-04-infrastructure/deployment-guide.md) - Volledige workflows
- **🏗️ Provisioning**: [Provisioning van resources](docs/chapter-04-infrastructure/provisioning.md) - Azure-resourcemanagement
- **📝 Voorbeelden**: [Container-appvoorbeeld](../../examples/container-app) - Gecontaineriseerde implementaties

#### Praktische Oefeningen
- Maak aangepaste Bicep-sjablonen
- Rol multi-service applicaties uit
- Implementeer blue-green uitrolstrategieën

**💡 Hoofdstukresultaat**: Complexe multi-service applicaties uitrollen met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-agent AI-oplossingen (Gevorderd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Architectuurpatronen voor multi-agent
- Agent-orchestratie en coördinatie
- AI-implementaties klaar voor productie

#### Leermaterialen
- **🤖 Uitgelicht project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM-sjablonen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click implementatie
- **📖 Architectuur**: [Coördinatiepatronen voor multi-agents](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktische Oefeningen
```bash
# Implementeer de volledige retail multi-agentoplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hoofdstukresultaat**: Een productieklare multi-agent AI-oplossing uitrollen en beheren met Customer- en Inventory-agents

---

### 🔍 Hoofdstuk 6: Pre-deployment validatie & planning
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Capaciteitsplanning en resourcevalidatie
- Strategieën voor SKU-selectie
- Preflight-controles en automatisering

#### Leermaterialen
- **📊 Planning**: [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resourcevalidatie
- **💰 Selectie**: [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Preflight-controles](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische Oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deploycontroles

**💡 Hoofdstukresultaat**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Probleemoplossing & debuggen
**Vereisten**: Een van de implementatiehoofdstukken voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Systematische debugmethoden
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leermaterialen
- **🔧 Veelvoorkomende problemen**: [Veelvoorkomende problemen](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debuggen**: [Debuggengids](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI-problemen**: [AI-specifieke probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-serviceproblemen

#### Praktische Oefeningen
- Diagnostiseer uitrolfouten
- Los authenticatieproblemen op
- Debug AI-serviceconnectiviteit

**💡 Hoofdstukresultaat**: Diagnoseer en los zelfstandig veelvoorkomende implementatieproblemen op

---

### 🏢 Hoofdstuk 8: Productie & enterprisepatronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Strategieën voor productie-implementatie
- Enterprise-beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leermaterialen
- **🏭 Productie**: [Productie AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise-patronen
- **📝 Voorbeelden**: [Microservices Voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Integratie Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische Oefeningen
- Implementeer enterprise-beveiligingspatronen
- Stel uitgebreide monitoring in
- Implementeer naar productie met de juiste governance

**💡 Hoofdstukresultaat**: Implementeer bedrijfsklare applicaties met volledige productiemogelijkheden

---

## 🎓 Workshop Overzicht: Praktijkgerichte Leerervaring

> **⚠️ WORKSHOP STATUS: Actieve Ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige gevorderde secties zijn onvolledig. We werken actief aan het voltooien van alle inhoud. [Volg voortgang →](workshop/README.md)

### Interactieve Workshopmaterialen
**Uitgebreide praktijkgerichte leerervaring met browsergebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfgestuurd leren als sessies onder leiding van een instructeur.

#### 🛠️ Workshop Kenmerken
- **Browsergebaseerde interface**: Volledige MkDocs-gestuurde workshop met zoek-, kopieer- en themafuncties
- **GitHub Codespaces-integratie**: Met één klik de ontwikkelomgeving instellen
- **Gestructureerd leerpad**: 8-modulaire begeleide oefeningen (3-4 uur in totaal)
- **Progressieve methodologie**: Introductie → Selectie → Validatie → Ontleding → Configuratie → Aanpassing → Afbouw → Afronding
- **Interactieve DevContainer-omgeving**: Voorgeconfigureerde tools en afhankelijkheden

#### 📚 Structuur van de workshopmodules
De workshop volgt een **8-modulaire progressieve methodologie** die je van ontdekking naar beheersing van implementatie brengt:

| Module | Onderwerp | Wat je gaat doen | Duur |
|--------|-----------|------------------|------|
| **0. Introductie** | Overzicht van de workshop | Begrijp leerdoelen, vereisten en de structuur van de workshop | 15 min |
| **1. Selectie** | Sjabloonontdekking | Verken AZD-sjablonen en kies het juiste AI-sjabloon voor jouw scenario | 20 min |
| **2. Validatie** | Implementeren & Verifiëren | Implementeer de sjabloon met `azd up` en controleer of de infrastructuur werkt | 30 min |
| **3. Ontleding** | Begrijp de structuur | Gebruik GitHub Copilot om de sjabloonarchitectuur, Bicep-bestanden en codeorganisatie te verkennen | 30 min |
| **4. Configuratie** | Diepgaande azure.yaml | Beheers de configuratie van `azure.yaml`, lifecycle hooks en omgevingsvariabelen | 30 min |
| **5. Aanpassing** | Maak het van jou | Schakel AI Search, tracing en evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Afbouw** | Opruimen | Verwijder resources veilig met `azd down --purge` | 15 min |
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
Door het voltooien van de workshop zullen deelnemers:
- **Productie-AI-applicaties implementeren**: Gebruik AZD met Microsoft Foundry-services
- **Beheers multi-agentarchitecturen**: Implementeer gecoördineerde AI-agentoplossingen
- **Implementeer beveiligingsbest practices**: Configureer authenticatie en toegangscontrole
- **Optimaliseren voor schaal**: Ontwerp kosteneffectieve, performante implementaties
- **Problemen met implementaties oplossen**: Los veelvoorkomende problemen zelfstandig op

#### 📖 Workshopbronnen
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Module-voor-module instructies**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Overzicht van de workshop en doelstellingen
  - [1. Selectie](workshop/docs/instructions/1-Select-AI-Template.md) - Vind en kies AI-sjablonen
  - [2. Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementeer en verifieer sjablonen
  - [3. Ontleding](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken sjabloonarchitectuur
  - [4. Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers `azure.yaml`
  - [5. Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Opruimen](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Afronding](workshop/docs/instructions/7-Wrap-up.md) - Beoordeel en volgende stappen
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Snelstart**: [Workshop Installatiegids](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstraining, universitaire cursussen, zelfgestuurd leren en ontwikkelaarsbootcamps.

---

## 📖 Diepgaande verkenning: AZD-mogelijkheden

Naast de basis biedt AZD krachtige functies voor productie-implementaties:

- **Sjabloon-gebaseerde implementaties** - Gebruik vooraf gebouwde sjablonen voor veelvoorkomende toepassingspatronen
- **Infrastructuur als Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Voorzie, implementeer en monitor applicaties naadloos
- **Ontwikkelaarvriendelijk** - Geoptimaliseerd voor ontwikkelaarsproductiviteit en -ervaring

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de grootste uitdagingen aan waar AI-ontwikkelaars mee te maken hebben:

- **AI-klaar sjablonen** - Vooraf geconfigureerde sjablonen voor Microsoft Foundry-modellen, Cognitive Services en ML-workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-services, API-sleutels en modelendpunten  
- **Productie-AI-patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-end AI-workflows** - Van modelontwikkeling tot productie-implementatie met juiste monitoring
- **Kostenoptimalisatie** - Slimme toewijzing van resources en schaalstrategieën voor AI-workloads
- **Microsoft Foundry-integratie** - Naadloze verbinding met de Microsoft Foundry-modelcatalogus en eindpunten

---

## 🎯 Sjablonen- en voorbeeldbibliotheek

### Uitgelicht: Microsoft Foundry-sjablonen
**Begin hier als je AI-applicaties implementeert!**

> **Opmerking:** Deze sjablonen tonen verschillende AI-patronen. Sommige zijn externe Azure Samples, andere zijn lokale implementaties.

| Sjabloon | Hoofdstuk | Complexiteit | Services | Type |
|----------|-----------|--------------|----------|------|
| [**Aan de slag met AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Aan de slag met AI-agenten**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat-app Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent-oplossing**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Volledige leerscenario's
**Productieklare applicatie-sjablonen gekoppeld aan leerhoofdstukken**

| Sjabloon | Leerhoofdstuk | Complexiteit | Belangrijkste leerpunten |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Integratie van Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agent-framework en functie-aanroepen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Ondernemings-AI-orkestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agentarchitectuur met Klant- en Voorraadagenten |

### Leren per voorbeeldtype

> **📌 Lokale vs. Externe voorbeelden:**  
> **Lokale voorbeelden** (in deze repo) = Direct klaar voor gebruik  
> **Externe voorbeelden** (Azure Samples) = Cloneer vanaf de gelinkte repositories

#### Lokale voorbeelden (Direct klaar voor gebruik)
- [**Retail Multi-Agent-oplossing**](examples/retail-scenario.md) - Volledige productieklare implementatie met ARM-sjablonen
  - Multi-agentarchitectuur (Klant- en Voorraadagenten)
  - Uitgebreide monitoring en evaluatie
  - Eén-klik implementatie via ARM-sjabloon

#### Lokale voorbeelden - Containerapplicaties (Hoofdstukken 2-5)
**Uitgebreide voorbeelden van containerimplementaties in deze repository:**
- [**Container App-voorbeelden**](examples/container-app/README.md) - Volledige gids voor containerimplementaties
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met scale-to-zero
  - [Microservices Architectuur](../../examples/container-app/microservices) - Productieklare multi-service implementatie
  - Quick Start, Productie, en Geavanceerde implementatiepatronen
  - Monitoring-, beveiligings- en kostenoptimalisatie-advies

#### Externe voorbeelden - Eenvoudige applicaties (Hoofdstukken 1-2)
**Clone deze Azure Samples-repositories om te beginnen:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basisimplementatiepatronen
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementatie van statische content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-implementatie

#### Externe voorbeelden - Database-integratie (Hoofdstukken 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patronen voor databaseconnectiviteit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dataworkflows

#### Externe voorbeelden - Geavanceerde patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - ML-patronen klaar voor productie

### Externe sjablooncollecties
- [**Officiële AZD Template-galerij**](https://azure.github.io/awesome-azd/) - Geselecteerde collectie officiële en community-sjablonen
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sjabloondocumentatie
- [**Voorbeeldmap**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leermiddelen & Referenties

### Snelreferenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's geordend per hoofdstuk
- [**Woordenlijst**](resources/glossary.md) - Terminologie van Azure en azd  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen geordend per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktijkworkshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-implementeerbaar (2-3 uur)
- [**Interactieve Workshop**](workshop/README.md) - 8-modulaire begeleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Introductie → Selectie → Validatie → Ontleding → Configuratie → Aanpassing → Afbouw → Afronding

### Externe leermaterialen
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prijsberekenaar](https://azure.microsoft.com/pricing/calculator/)
- [Azure-status](https://status.azure.com/)

### AI-agentvaardigheden voor je editor
- [**Microsoft Azure-vaardigheden op skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agentvaardigheden voor Azure AI, Foundry, deployment, diagnostiek, kostenoptimalisatie en meer. Installeer ze in GitHub Copilot, Cursor, Claude Code of elke ondersteunde agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snelle handleiding voor probleemoplossing

**Veelvoorkomende problemen voor beginners en directe oplossingen:**

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

# Stel standaardabonnement in
az account set --subscription "<subscription-id-or-name>"

# Stel in voor AZD-omgeving
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

# Of gebruik kleinere SKUs in ontwikkeling
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

# Optie 3: Gedetailleerde status controleren
azd show

# Optie 4: Logs controleren in Azure Monitor
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
# AZD genereert unieke namen, maar bij een conflict:
azd down --force --purge

# Probeer dan opnieuw met een nieuwe omgeving
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (het provisionen van OpenAI is traag)

```bash
# Controleer de voortgang
azd show

# Als je langer dan 30 minuten vastzit, controleer de Azure-portal:
azd monitor
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

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
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Toon alle service-eindpunten
azd show

# Of open de Azure-portal
azd monitor

# Controleer een specifieke service
azd env get-values
# Zoek naar *_URL-variabelen
```
</details>

### 📚 Volledige bronnen voor probleemoplossing

- **Gids veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI-probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggengids:** [Stapsgewijze debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursusafronding en certificering

### Voortgang bijhouden
Volg je voortgang per hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Snelstart ✅
- [ ] **Hoofdstuk 2**: AI-first ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructuur als code & implementatie ✅
- [ ] **Hoofdstuk 5**: Multi-agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Validatie en planning vóór implementatie ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & debugging ✅
- [ ] **Hoofdstuk 8**: Productie- & enterprise-patronen ✅

### Verificatie van het leren
Controleer je kennis na het voltooien van elk hoofdstuk door:
1. **Praktijkopdracht**: Voltooi de praktische implementatie van het hoofdstuk
2. **Kenniscontrole**: Bekijk de veelgestelde vragen (FAQ) voor je hoofdstuk
3. **Communitydiscussie**: Deel je ervaring in de Azure Discord
4. **Volgend hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen bij afronding van de cursus
Na het voltooien van alle hoofdstukken heb je:
- **Productie-ervaring**: Reële AI-toepassingen in Azure ingezet
- **Professionele vaardigheden**: Enterprise-klare implementatievaardigheden  
- **Communityerkenning**: Actief lid van de Azure-ontwikkelaarscommunity
- **Carrièremogelijkheden**: Gevraagde AZD- en AI-implementatie-expertise

---

## 🤝 Community & ondersteuning

### Hulp & ondersteuning
- **Technische problemen**: [Meld bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Vragen over leren**: [Microsoft Azure Discord-community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke hulp**: Word lid van de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Communityinzichten van Microsoft Foundry Discord

**Recente peilingresultaten van het #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI-workloads
- **Belangrijkste uitdagingen**: Meerdere services implementeren, beheer van referenties, productierijpheid  
- **Meest gevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, best practices

**Word lid van onze community om:**
- Deel je AZD + AI-ervaringen en krijg hulp
- Krijg toegang tot vroege previews van nieuwe AI-sjablonen
- Draag bij aan best practices voor AI-implementatie
- Beïnvloed toekomstige AI- + AZD-functieontwikkeling

### Bijdragen aan de cursus
Wij verwelkomen bijdragen! Lees onze [Bijdragengids](CONTRIBUTING.md) voor details over:
- **Inhoudsverbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe voorbeelden**: Voeg praktijkvoorbeelden en sjablonen toe  
- **Vertaling**: Help bij het onderhouden van meertalige ondersteuning
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Communitystandaarden**: Volg onze inclusieve communityrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft-leermaterialen

Ons team produceert andere uitgebreide leercursussen:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j voor beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js voor beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain voor beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenten
[![AZD voor beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI voor beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP voor beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents voor beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatieve AI-reeks
[![Generatieve AI voor beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernonderwerpen
[![ML voor beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science voor beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI voor beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity voor beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webontwikkeling voor beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT voor beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-ontwikkeling voor beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-reeks
[![Copilot voor AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot voor C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Avontuur](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelstart](#-chapter-1-foundation--quick-start)  
**AI-ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-first ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](#️-chapter-3-configuration--authentication)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat automatische vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->