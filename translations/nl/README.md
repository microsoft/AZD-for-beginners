# AZD Voor Beginners: Een Gestructureerde Leerroute

![AZD-voor-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Geautomatiseerde Vertalingen (Altijd Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](./README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Liever lokaal clonen?**

> Deze repository bevat meer dan 50 taalvertalingen, wat de downloadgrootte aanzienlijk vergroot. Om zonder vertalingen te clonen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Wat is Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarsvriendelijke commandoregeltool die het eenvoudig maakt om applicaties naar Azure te deployen. In plaats van handmatig tientallen Azure-resources te maken en te verbinden, kun je volledige applicaties uitrollen met één enkele opdracht.

### De magie van `azd up`

```bash
# Deze enkele opdracht doet alles:
# ✅ Maakt alle Azure-resources aan
# ✅ Configureert netwerken en beveiliging
# ✅ Bouwt je applicatiecode
# ✅ Zet uit naar Azure
# ✅ Geeft je een werkende URL
azd up
```

**Dat is alles!** Geen geklik in de Azure Portal, geen complexe ARM-templates die je eerst moet leren, geen handmatige configuratie - gewoon werkende applicaties op Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wat is het Verschil?

Dit is de meest gestelde vraag door beginners. Hier is het eenvoudige antwoord:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Doel** | Beheer individuele Azure-resources | Deploy volledige applicaties |
| **Mentaliteit** | Gericht op infrastructuur | Gericht op applicaties |
| **Voorbeeld** | `az webapp create --name myapp...` | `azd up` |
| **Leercurve** | Moet Azure-services kennen | Alleen je app hoeven te kennen |
| **Het beste voor** | DevOps, Infrastructuur | Ontwikkelaars, Prototyping |

### Eenvoudige Analogie

- **Azure CLI** is zoals alle gereedschappen hebben om een huis te bouwen - hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet de bouw kennen.
- **Azure Developer CLI** is zoals het inhuren van een aannemer - je beschrijft wat je wilt en zij regelen de bouw.

### Wanneer Gebruik Je Welke

| Scenario | Gebruik Dit |
|----------|-------------|
| "Ik wil snel mijn webapp deployen" | `azd up` |
| "Ik moet alleen een storage account aanmaken" | `az storage account create` |
| "Ik bouw een volledige AI-applicatie" | `azd init --template azure-search-openai-demo` |
| "Ik moet een specifieke Azure-resource debuggen" | `az resource show` |
| "Ik wil productieklare deployment in minuten" | `azd up --environment production` |

### Ze Werken Samen!

AZD gebruikt de Azure CLI onderliggend. Je kunt beide gebruiken:
```bash
# Implementeer je app met AZD
azd up

# Pas vervolgens specifieke resources aan met Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind Templates in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communitycollectie van kant-en-klare deploy-templates:

| Resource | Beschrijving |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Blader door 200+ templates met één klik om te deployen |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Draag je eigen template bij aan de community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star en verken de bron |

### Populaire AI-templates uit Awesome AZD

```bash
# RAG-chat met Azure OpenAI + AI-zoekfunctie
azd init --template azure-search-openai-demo

# Snelle AI-chatapplicatie
azd init --template openai-chat-app-quickstart

# AI-agenten met Foundry-agenten
azd init --template get-started-with-ai-agents
```

---

## 🎯 Beginnen in 3 Stappen

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

### Stap 2: Aanmelden bij Azure

```bash
azd auth login
```

### Stap 3: Deploy je eerste app

```bash
# Initialiseren vanuit een sjabloon
azd init --template todo-nodejs-mongo

# Uitrollen naar Azure (maakt alles aan!)
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

Deze cursus is ontworpen voor **progressief leren** - begin waar je je comfortabel bij voelt en werk jezelf omhoog:

| Jouw ervaring | Begin hier |
|-----------------|------------|
| **Volledig nieuw met Azure** | [Hoofdstuk 1: Basis](../..) |
| **Ken Azure, nieuw met AZD** | [Hoofdstuk 1: Basis](../..) |
| **Wil AI-apps deployen** | [Hoofdstuk 2: AI-first Development](../..) |
| **Wil hands-on oefenen** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 uur begeleide lab |
| **Heb productiepatronen nodig** | [Hoofdstuk 8: Productie & Enterprise](../..) |

### Snelle setup

1. **Maak een fork van deze repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone het**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Krijg hulp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Liever lokaal clonen?**

> Deze repository bevat meer dan 50 taalvertalingen, wat de downloadgrootte aanzienlijk vergroot. Om zonder vertalingen te clonen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.


## Cursusoverzicht

Beheers de Azure Developer CLI (azd) via gestructureerde hoofdstukken ontworpen voor progressief leren. **Speciale focus op het deployen van AI-applicaties met Microsoft Foundry-integratie.**

### Waarom deze cursus essentieel is voor moderne ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community wil **45% van de ontwikkelaars AZD gebruiken voor AI-workloads**, maar komen ze uitdagingen tegen met:
- Complexe multi-service AI-architecturen
- Best practices voor productie-AI-deployment  
- Integratie en configuratie van Azure AI-services
- Kostenoptimalisatie voor AI-workloads
- Problemen oplossen bij AI-specifieke deployments

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zul je:
- **Beheer AZD-basisprincipes**: Kernconcepten, installatie en configuratie
- **Deploy AI-applicaties**: Gebruik AZD met Microsoft Foundry-services
- **Implementeer Infrastructure as Code**: Beheer Azure-resources met Bicep-templates
- **Los deploymentproblemen op**: Los veelvoorkomende problemen op en debug
- **Optimaliseer voor productie**: Beveiliging, schalen, monitoring en kostenbeheer
- **Bouw multi-agent oplossingen**: Deploy complexe AI-architecturen

## 🗺️ Cursuskaart: Snelle navigatie per hoofdstuk

Elk hoofdstuk heeft een toegewijd README met leerdoelen, quick starts en oefeningen:

| Hoofdstuk | Onderwerp | Lessen | Duur | Complexiteit |
|---------|-------|---------|----------|------------|
| **[Hoofdstuk 1: Basis](docs/chapter-01-foundation/README.md)** | Aan de slag | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Hoofdstuk 2: AI-ontwikkeling](docs/chapter-02-ai-development/README.md)** | AI-first apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Hoofdstuk 3: Configuratie](docs/chapter-03-configuration/README.md)** | Auth & Beveiliging | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Hoofdstuk 4: Infrastructuur](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Hoofdstuk 5: Multi-agent](docs/chapter-05-multi-agent/README.md)** | AI-agentoplossingen | [Retailscenario](examples/retail-scenario.md) &#124; [Coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[Hoofdstuk 6: Pre-deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validatie | [Preflight-controles](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 uur | ⭐⭐ |
| **[Hoofdstuk 7: Problemen oplossen](docs/chapter-07-troubleshooting/README.md)** | Debuggen & Oplossen | [Veelvoorkomende problemen](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggen](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemen](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 uur | ⭐⭐ |
| **[Hoofdstuk 8: Productie](docs/chapter-08-production/README.md)** | Enterprise-patronen | [Productiepraktijken](docs/chapter-08-production/production-ai-practices.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktijklab | [Introductie](workshop/docs/instructions/0-Introduction.md) &#124; [Selectie](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Afbouw infrastructuur](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afronding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 uur | ⭐⭐ |

**Totale cursusduur:** ~10-14 uur | **Vaardigheidsontwikkeling:** Beginner → Productieklaar

---

## 📚 Leerhoofdstukken

*Kies je leerroute op basis van ervaringsniveau en doelstellingen*

### 🚀 Hoofdstuk 1: Basis & Snelstart
**Vereisten**: Azure-abonnement, basiskennis van de opdrachtregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je leert
- Inzicht in de basisprincipes van de Azure Developer CLI
- AZD installeren op je platform
- Je eerste succesvolle implementatie

#### Leerbronnen
- **🎯 Begin hier**: [Wat is Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Installatie**: [Installatie & Setup](docs/chapter-01-foundation/installation.md) - Platform-specifieke handleidingen
- **🛠️ Praktijk**: [Je eerste project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze tutorial
- **📋 Snelreferentie**: [Commando-overzicht](resources/cheat-sheet.md)

#### Praktijkopdrachten
```bash
# Snelle installatiecontrole
azd version

# Implementeer uw eerste applicatie
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultaat van hoofdstuk**: Implementeer succesvol een eenvoudige webapplicatie naar Azure met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1 zou je in staat moeten zijn om:
azd version              # Toont de geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Implementeert op Azure
azd show                # Toont de URL van de draaiende app
# De applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren

**✅ Succesvalidatie:**
```bash
# Na het voltooien van hoofdstuk 1 zou je het volgende moeten kunnen:
azd version              # Toont de geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert het project
azd up                  # Deployt naar Azure
azd show                # Toont de URL van de draaiende app
# De applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt bronnen op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren

---

### 🤖 Hoofdstuk 2: AI-first ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Microsoft Foundry-integratie met AZD
- AI-gestuurde applicaties implementeren
- Inzicht in AI-serviceconfiguraties

#### Leerbronnen
- **🎯 Begin hier**: [Microsoft Foundry-integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenten**: [AI-agentengids](docs/chapter-02-ai-development/agents.md) - Implementeren van intelligente agenten met AZD
- **📖 Patronen**: [AI-modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) - AI-modellen implementeren en beheren
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browsergebaseerd leren met MkDocs * DevContainer-omgeving
- **📋 Sjablonen**: [Microsoft Foundry-sjablonen](../..)
- **📝 Voorbeelden**: [AZD-implementatievoorbeelden](examples/README.md)

#### Praktijkopdrachten
```bash
# Implementeer je eerste AI-toepassing
azd init --template azure-search-openai-demo
azd up

# Probeer aanvullende AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultaat van hoofdstuk**: Implementeer en configureer een AI-chatapplicatie met RAG-mogelijkheden

**✅ Succesvalidatie:**
```bash
# Na hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# De AI-chatinterface testen
# Vragen stellen en AI-gegenereerde antwoorden met bronnen ontvangen
# Controleren of de zoekintegratie werkt
azd monitor  # Controleren of Application Insights telemetrie weergeeft
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan productieklare AI-applicaties implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijp ontwikkelkosten van $80-150/maand, productie-kosten van $300-3500/maand

#### 💰 Kostenoverwegingen voor AI-implementaties

**Ontwikkelomgeving (geschat $80-150/maand):**
- Azure OpenAI (Pay-as-you-go): $0-50/maand (gebaseerd op tokengebruik)
- AI Search (Basic-tier): $75/maand
- Container Apps (Consumption): $0-20/maand
- Storage (Standard): $1-5/maand

**Productieomgeving (geschat $300-3.500+/maand):**
- Azure OpenAI (PTU voor consistente prestaties): $3.000+/maand OF Pay-as-you-go bij hoog volume
- AI Search (Standard-tier): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Storage (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik de **Free Tier** van Azure OpenAI voor leren (50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources te dealloqueren wanneer je niet actief ontwikkelt
- Begin met verbruikgebaseerde facturering, upgrade naar PTU alleen voor productie
- Gebruik `azd provision --preview` om kosten vóór implementatie te schatten
- Schakel auto-scaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenmonitoring:**
```bash
# Controleer de geschatte maandelijkse kosten
azd provision --preview

# Houd de werkelijke kosten in het Azure-portaal in de gaten
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Omgevingsconfiguratie en -beheer
- Authenticatie en beveiligingsbest practices
- Resource-naming en organisatie

#### Leerbronnen
- **📖 Configuratie**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Omgevingsinstelling
- **🔐 Beveiliging**: [Authenticatiepatronen en managed identity](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database-appvoorbeeld](examples/database-app/README.md) - AZD-databasevoorbeelden

#### Praktijkopdrachten
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel managed identity-authenticatie in
- Implementeer omgevingsspecifieke configuraties

**💡 Resultaat van hoofdstuk**: Beheer meerdere omgevingen met correcte authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructuur als Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je leert
- Geavanceerde implementatiepatronen
- Infrastructuur als code met Bicep
- Strategieën voor resource-provisioning

#### Leerbronnen
- **📖 Implementatie**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Volledige workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container-appvoorbeeld](../../examples/container-app) - Gecontaineriseerde implementaties

#### Praktijkopdrachten
- Maak aangepaste Bicep-sjablonen
- Implementeer multi-service applicaties
- Implementeer blue-green implementatiestrategieën

**💡 Resultaat van hoofdstuk**: Implementeer complexe multi-service applicaties met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-agent AI-oplossingen (Geavanceerd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Architectuurpatronen voor multi-agent
- Agentorchestratie en coördinatie
- Productieklare AI-implementaties

#### Leerbronnen
- **🤖 Uitgelicht project**: [Retail multi-agentoplossing](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM-sjablonen**: [ARM-templatepakket](../../examples/retail-multiagent-arm-template) - One-click implementatie
- **📖 Architectuur**: [Multi-agent coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktijkopdrachten
```bash
# Implementeer de complete retail multi-agentoplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultaat van hoofdstuk**: Implementeer en beheer een productieklare multi-agent AI-oplossing met Klant- en Voorraad-agenten

---

### 🔍 Hoofdstuk 6: Pre-deployment validatie & planning
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Capaciteitsplanning en resource-validatie
- SKU-selectiestrategieën
- Pre-flight-controles en automatisering

#### Leerbronnen
- **📊 Planning**: [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource-validatie
- **💰 Selectie**: [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Preflight-controles](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktijkopdrachten
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deployment controles

**💡 Resultaat van hoofdstuk**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Problemen oplossen & Debuggen
**Vereisten**: Elk implementatiehoofdstuk voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Systematische debugmethodes
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leerbronnen
- **🔧 Veelvoorkomende problemen**: [Veelvoorkomende problemen](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI-problemen**: [AI-specifieke probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktijkopdrachten
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug AI-serviceconnectiviteit

**💡 Resultaat van hoofdstuk**: Diagnoseer en los zelfstandig veelvoorkomende implementatieproblemen op

---

### 🏢 Hoofdstuk 8: Productie & Enterprise-patronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Strategieën voor productie-implementatie
- Enterprise-beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leerbronnen
- **🏭 Productie**: [Productie AI-best practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise-patronen
- **📝 Voorbeelden**: [Microservices-voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights-integratie](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktijkopdrachten
- Implementeer enterprise-beveiligingspatronen
- Stel uitgebreide monitoring in
- Implementeer naar productie met juiste governance

**💡 Resultaat van hoofdstuk**: Implementeer enterprise-klare applicaties met volledige productiecapaciteiten

---

## 🎓 Workshopoverzicht: Praktijkgerichte leerervaring

> **⚠️ WORKSHOP STATUS: Actieve ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige gevorderde secties zijn onvolledig. We werken actief aan het voltooien van alle inhoud. [Volg de voortgang →](workshop/README.md)

### Interactieve workshopmaterialen
**Uitgebreide praktijkgerichte leerervaring met browsergebaseerde tools en begeleide oefeningen**
Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfgestuurd leren als door een instructeur geleide sessies.

#### 🛠️ Workshopfuncties
- **Browser-Based Interface**: Volledige MkDocs-gestuurde workshop met zoek-, kopieer- en themafuncties
- **GitHub Codespaces Integration**: Eén-klik voor het opzetten van de ontwikkelomgeving
- **Structured Learning Path**: 8-module begeleide oefeningen (in totaal 3-4 uur)
- **Progressive Methodology**: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Opruimen → Afsluiting
- **Interactive DevContainer Environment**: Vooraf geconfigureerde tools en afhankelijkheden

#### 📚 Structuur van workshopmodules
De workshop volgt een **8-module progressieve methodologie** die je van verkenning naar beheersing van implementatie brengt:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introductie** | Workshop Overview | Begrijp leerdoelen, vereisten en workshopstructuur | 15 min |
| **1. Selectie** | Template Discovery | Verken AZD-sjablonen en selecteer het juiste AI-sjabloon voor jouw scenario | 20 min |
| **2. Validatie** | Deploy & Verify | Rol het sjabloon uit met `azd up` en verifieer dat de infrastructuur werkt | 30 min |
| **3. Deconstructie** | Understand Structure | Gebruik GitHub Copilot om sjabloonarchitectuur, Bicep-bestanden en codeorganisatie te verkennen | 30 min |
| **4. Configuratie** | azure.yaml Deep Dive | Beheers de configuratie van `azure.yaml`, lifecycle hooks en omgevingsvariabelen | 30 min |
| **5. Aanpassing** | Make It Yours | Schakel AI Search, tracing, evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Opruimen** | Clean Up | Maak resources veilig vrij met `azd down --purge` | 15 min |
| **7. Afsluiting** | Next Steps | Beoordeel wat je bereikt hebt, belangrijke concepten en zet je leertraject voort | 15 min |

**Workshopverloop:**
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
# Klik op "Code" → "Maak codespace aan op main" in de repository

# Optie 2: Lokaal ontwikkelen
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Volg de installatie-instructies in workshop/README.md
```

#### 🎯 Leerresultaten van de workshop
Door de workshop te voltooien, zullen deelnemers:
- **Deploy Production AI Applications**: Gebruik AZD met Microsoft Foundry-diensten
- **Master Multi-Agent Architectures**: Beheers multi-agent-architecturen
- **Implement Security Best Practices**: Implementeer beveiligingsbest practices voor authenticatie en toegangsbeheer
- **Optimize for Scale**: Ontwerp kosteneffectieve, prestatiegerichte implementaties
- **Troubleshoot Deployments**: Los veelvoorkomende deploymentproblemen zelfstandig op

#### 📖 Workshopbronnen
- **🎥 Interactive Guide**: [Workshop Materials](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Per-module instructies**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Workshopoverzicht en doelstellingen
  - [1. Selectie](workshop/docs/instructions/1-Select-AI-Template.md) - Vind en selecteer AI-sjablonen
  - [2. Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) - Rol sjablonen uit en verifieer
  - [3. Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken sjabloonarchitectuur
  - [4. Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers `azure.yaml`
  - [5. Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Opruimen](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Afsluiting](workshop/docs/instructions/7-Wrap-up.md) - Overzicht en volgende stappen
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstrainingen, universitaire cursussen, zelfstudie en ontwikkelaarsbootcamps.

---

## 📖 Diepgaande verkenning: AZD-mogelijkheden

Voorbij de basis biedt AZD krachtige functies voor productie-implementaties:

- **Sjabloongebaseerde implementaties** - Gebruik vooraf gebouwde sjablonen voor veelvoorkomende applicatiepatronen
- **Infrastructuur als Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloos provisionen, uitrollen en monitoren van applicaties
- **Ontwikkelaarvriendelijk** - Geoptimaliseerd voor ontwikkelaarproductiviteit en -ervaring

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de belangrijkste uitdagingen aan waarmee AI-ontwikkelaars geconfronteerd worden:

- **AI-Ready Templates** - Vooraf geconfigureerde sjablonen voor Azure OpenAI, Cognitive Services en ML-workloads
- **Secure AI Deployments** - Ingebouwde beveiligingspatronen voor AI-diensten, API-sleutels en modelendpoints  
- **Production AI Patterns** - Best practices voor schaalbare, kostenefficiënte AI-applicatie-implementaties
- **End-to-End AI Workflows** - Van modelontwikkeling tot productie-implementatie met juiste monitoring
- **Cost Optimization** - Slimme resourceallocatie en schaalstrategieën voor AI-workloads
- **Microsoft Foundry Integration** - Naadloze koppeling met Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Sjablonen & voorbeeldbibliotheek

### Aanbevolen: Microsoft Foundry-sjablonen
**Begin hier als je AI-toepassingen implementeert!**

> **Note:** Deze sjablonen demonstreren verschillende AI-patronen. Sommige zijn externe Azure Samples, andere zijn lokale implementaties.

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
**Productieklare applicatiesjablonen gekoppeld aan leerhoofdstukken**

| Template | Leerhoofdstuk | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Document Intelligence-integratie |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agentframework en function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI-orchestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent-architectuur met Customer- en Inventory-agents |

### Leren aan de hand van voorbeeldtypen

> **📌 Lokaal vs. Externe voorbeelden:**  
> **Lokale voorbeelden** (in deze repo) = Direct klaar voor gebruik  
> **Externe voorbeelden** (Azure Samples) = Cloneer uit gekoppelde repositories

#### Lokale voorbeelden (Klaar voor gebruik)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Volledige productieklare implementatie met ARM-sjablonen
  - Multi-agent-architectuur (Customer + Inventory agents)
  - Uitgebreide monitoring en evaluatie
  - Eén-klik implementatie via ARM-sjabloon

#### Lokale voorbeelden - Containerapplicaties (Hoofdstukken 2-5)
**Uitgebreide voorbeelden van containerimplementaties in deze repository:**
- [**Container App Examples**](examples/container-app/README.md) - Complete gids voor containerimplementaties
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Productieklare multi-service-implementatie
  - Snelstart-, productie- en geavanceerde implementatiepatronen
  - Richtlijnen voor monitoring, beveiliging en kostenoptimalisatie

#### Externe voorbeelden - Eenvoudige applicaties (Hoofdstukken 1-2)
**Clone deze Azure Samples-repositories om te beginnen:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basis implementatiepatronen
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementatie van statische content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementatie van REST API

#### Externe voorbeelden - Database-integratie (Hoofdstukken 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseconnectiviteitspatronen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dataworkflows

#### Externe voorbeelden - Geavanceerde patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productieklare ML-patronen

### Externe sjablooncollecties
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Gecureerde collectie van officiële en community-sjablonen
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sjabloondocumentatie
- [**Examples Directory**](examples/README.md) - Lokale voorbeelden met gedetailleerde toelichtingen

---

## 📚 Leermiddelen & verwijzingen

### Snelle referenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's georganiseerd per hoofdstuk
- [**Glossary**](resources/glossary.md) - Azure- en azd-terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen georganiseerd per leerhoofdstuk
- [**Study Guide**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktische workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-implementatieklaar (2-3 uur)
- [**Interactive Workshop**](workshop/README.md) - 8-module begeleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Opruimen → Afsluiting

### Externe leermaterialen
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Snelle probleemoplossingsgids

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

# Controleer installatie
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Toon beschikbare abonnementen
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

# Of gebruik kleinere SKU's tijdens de ontwikkeling
# Bewerk infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fails halfway through</strong></summary>
```bash
# Optie 1: Opruimen en opnieuw proberen
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
<summary><strong>❌ "Bron bestaat al" of naamconflicten</strong></summary>

```bash
# AZD genereert unieke namen, maar als er een conflict is:
azd down --force --purge

# Probeer het dan opnieuw met een schone omgeving
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

# Als je langer dan 30 minuten vastzit, controleer de Azure-portal:
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
# Vraag uw Azure-beheerder om het volgende toe te kennen:
# - Contributor (voor resources)
# - User Access Administrator (voor roltoewijzingen)
```
</details>

<details>
<summary><strong>❌ Kan de URL van de gedeployde applicatie niet vinden</strong></summary>

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

### 📚 Volledige probleemoplossingsbronnen

- **Gids voor veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI-probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stapsgewijze debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Krijg hulp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursusvoltooiing & Certificering

### Voortgang bijhouden
Houd je voortgang per hoofdstuk bij:

- [ ] **Chapter 1**: Basis & Snelstart ✅
- [ ] **Chapter 2**: AI-First ontwikkeling ✅  
- [ ] **Chapter 3**: Configuratie & Authenticatie ✅
- [ ] **Chapter 4**: Infrastructuur als Code & Implementatie ✅
- [ ] **Chapter 5**: Multi-agent AI-oplossingen ✅
- [ ] **Chapter 6**: Voorafgaande validatie & planning ✅
- [ ] **Chapter 7**: Probleemoplossing & Foutopsporing ✅
- [ ] **Chapter 8**: Productie- & Enterprise-patronen ✅

### Verificatie van het leren
Na het voltooien van elk hoofdstuk, verifieer je je kennis door:
1. **Praktische oefening**: Voltooi de praktische implementatie van het hoofdstuk
2. **Kenniscontrole**: Bekijk de FAQ-sectie voor je hoofdstuk
3. **Communitydiscussie**: Deel je ervaring in Azure Discord
4. **Volgend hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen van het voltooien van de cursus
Na afronding van alle hoofdstukken heb je:
- **Productie-ervaring**: Echte AI-toepassingen op Azure gedeployd
- **Professionele vaardigheden**: Implementatiekennis geschikt voor ondernemingen  
- **Communityherkenning**: Actief lid van de Azure-ontwikkelaarscommunity
- **Carrièregroei**: Gevraagde expertise in AZD en AI-implementatie

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning
- **Technische problemen**: [Report bugs and request features](https://github.com/microsoft/azd-for-beginners/issues)
- **Vragen over leren**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke hulp**: Word lid van de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Official Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Communityinzichten uit Microsoft Foundry Discord

**Recente peilresultaten uit het #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI-workloads
- **Top uitdagingen**: Implementaties met meerdere services, beheer van referenties, productieklaarheid  
- **Meest gevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, beste werkwijzen

**Sluit je aan bij onze community om:**
- Deel je AZD + AI-ervaringen en krijg hulp
- Krijg toegang tot vroege previews van nieuwe AI-sjablonen
- Draag bij aan best practices voor AI-implementatie
- Beïnvloed toekomstige AI + AZD feature-ontwikkeling

### Bijdragen aan de cursus
We verwelkomen bijdragen! Lees onze [CONTRIBUTING.md](CONTRIBUTING.md) voor details over:
- **Inhoudsverbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe voorbeelden**: Voeg scenario's uit de praktijk en sjablonen toe  
- **Vertaling**: Help bij het onderhouden van meertalige ondersteuning
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Communitynormen**: Volg onze inclusieve communityrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT License - zie het [LICENSE](../../LICENSE)-bestand voor details.

### Gerelateerde Microsoft-leerbronnen

Our team produces other comprehensive learning courses:

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
 
### Core Learning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Start met [Hoofdstuk 1: Basis & Snelstart](../..)
**AI-ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-first ontwikkeling](../..)  
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](../..)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Afwijzing van aansprakelijkheid**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->