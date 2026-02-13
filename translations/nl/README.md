# AZD voor Beginners: Een Gestructureerde Leerreis

![AZD voor beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatische vertalingen (Altijd up-to-date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Burmees (Myanmar)](../my/README.md) | [Chinees (Vereenvoudigd)](../zh-CN/README.md) | [Chinees (Traditioneel, Hongkong)](../zh-HK/README.md) | [Chinees (Traditioneel, Macau)](../zh-MO/README.md) | [Chinees (Traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Ests](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigeriaanse Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slowaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thais](../th/README.md) | [Turks](../tr/README.md) | [Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

> **Bij voorkeur lokaal klonen?**
>
> Deze repository bevat meer dan 50 taalvertalingen die de downloadgrootte aanzienlijk vergroten. Om te klonen zonder vertalingen, gebruik sparse checkout:
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

## 🚀 Wat is Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarsvriendelijke opdrachtregeltool die het eenvoudig maakt om applicaties naar Azure te implementeren. In plaats van handmatig tientallen Azure-resources te maken en te verbinden, kun je hele applicaties met één opdracht implementeren.

### De magie van `azd up`

```bash
# Dit enkele commando doet alles:
# ✅ Maakt alle Azure-resources aan
# ✅ Configureert netwerken en beveiliging
# ✅ Bouwt je applicatiecode
# ✅ Zet uit naar Azure
# ✅ Geeft je een werkende URL
azd up
```

**Dat is alles!** Geen klikken in de Azure Portal, geen complexe ARM-sjablonen om eerst te leren, geen handmatige configuratie - alleen werkende applicaties op Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wat is het verschil?

Dit is de meest gestelde vraag door beginners. Hier is het eenvoudige antwoord:

| Kenmerk | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Doel** | Beheer individuele Azure-resources | Implementeer complete applicaties |
| **Denkwijze** | Infrastructuurgericht | Applicatiegericht |
| **Voorbeeld** | `az webapp create --name myapp...` | `azd up` |
| **Leercurve** | Moet Azure-diensten kennen | Ken alleen je app |
| **Bij uitstek voor** | DevOps, infrastructuur | Ontwikkelaars, prototyping |

### Eenvoudige analogie

- **Azure CLI** is als het hebben van alle gereedschappen om een huis te bouwen - hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet weten hoe bouwkunde werkt.
- **Azure Developer CLI** is als het inhuren van een aannemer - je beschrijft wat je wilt en zij regelen de bouw.

### Wanneer gebruik je welke

| Scenario | Gebruik dit |
|----------|-------------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Ze werken samen!

AZD gebruikt Azure CLI onder de motorkap. Je kunt beide gebruiken:
```bash
# Implementeer je app met AZD
azd up

# Fijnstem vervolgens specifieke resources met Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind sjablonen in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communityverzameling van kant-en-klare sjablonen die direct te implementeren zijn:

| Bron | Beschrijving |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Blader door 200+ sjablonen met één-klik implementatie |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Draag je eigen sjabloon bij aan de community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Geef een ster en verken de bron |

### Populaire AI-sjablonen van Awesome AZD

```bash
# RAG-chat met Azure OpenAI + AI-zoekfunctie
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

### Stap 2: Log in bij Azure

```bash
azd auth login
```

### Stap 3: Implementeer je eerste app

```bash
# Initialiseren van een sjabloon
azd init --template todo-nodejs-mongo

# Implementeren naar Azure (maakt alles aan!)
azd up
```

**🎉 Dat is alles!** Je app staat nu live op Azure.

### Opruimen (niet vergeten!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hoe gebruik je deze cursus

Deze cursus is ontworpen voor **progressief leren** - begin waar je je comfortabel bij voelt en werk je omhoog:

| Jouw ervaring | Begin hier |
|-----------------|------------|
| **Volledig nieuw met Azure** | [Hoofdstuk 1: Foundation](../..) |
| **Ken Azure, nieuw met AZD** | [Hoofdstuk 1: Foundation](../..) |
| **Wil AI-apps implementeren** | [Hoofdstuk 2: AI-First Development](../..) |
| **Wil praktische oefening** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 uur begeleide lab |
| **Hebben productiepatronen nodig** | [Hoofdstuk 8: Production & Enterprise](../..) |

### Snel opzetten

1. **Maak een fork van deze repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloon het**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hulp krijgen**: [Azure Discord-community](https://discord.com/invite/ByRwuEEgH4)

> **Bij voorkeur lokaal klonen?**
>
> Deze repository bevat meer dan 50 taalvertalingen die de downloadgrootte aanzienlijk vergroten. Om te klonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.


## Cursusoverzicht

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken ontworpen voor progressief leren. **Speciale focus op AI-applicatie-implementatie met Microsoft Foundry-integratie.**

### Waarom deze cursus essentieel is voor moderne ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community, **wil 45% van de ontwikkelaars AZD gebruiken voor AI-workloads**, maar ondervinden uitdagingen met:
- Complexe multi-service AI-architecturen
- Best practices voor productie-implementatie van AI  
- Integratie en configuratie van Azure AI-diensten
- Kostenoptimalisatie voor AI-workloads
- Foutoplossing van AI-specifieke implementatieproblemen

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zal je:
- **Beheers de AZD-basisprincipes**: Kernconcepten, installatie en configuratie
- **Implementeer AI-applicaties**: Gebruik AZD met Microsoft Foundry-diensten
- **Implementeer Infrastructure as Code**: Beheer Azure-resources met Bicep-sjablonen
- **Problemen oplossen bij implementaties**: Los veelvoorkomende problemen op en debug problemen
- **Optimaliseren voor productie**: Beveiliging, schalen, monitoring en kostenbeheer
- **Bouw multi-agentoplossingen**: Implementeer complexe AI-architecturen

## 🗺️ Cursuskaart: Snelle navigatie per hoofdstuk

Elk hoofdstuk heeft een toegewijde README met leerdoelen, snelle starts en oefeningen:

| Hoofdstuk | Onderwerp | Lessen | Duur | Complexiteit |
|---------|-------|---------|----------|------------|
| **[Hoofdstuk 1: Foundation](docs/chapter-01-foundation/README.md)** | Aan de slag | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installatie](docs/chapter-01-foundation/installation.md) &#124; [Eerste project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Hoofdstuk 2: AI-ontwikkeling](docs/chapter-02-ai-development/README.md)** | AI-eerste apps | [Foundry-integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agents](docs/chapter-02-ai-development/agents.md) &#124; [Modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Hoofdstuk 3: Configuratie](docs/chapter-03-configuration/README.md)** | Auth & Beveiliging | [Configuratie](docs/chapter-03-configuration/configuration.md) &#124; [Authenticatie & Beveiliging](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Implementatie | [Implementatiegids](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Oplossingen | [Retail Scenario](examples/retail-scenario.md) &#124; [Coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validatie | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Oplossen | [Veelvoorkomende Problemen](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patronen | [Productiepraktijken](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introductie](workshop/docs/instructions/0-Introduction.md) &#124; [Selectie](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Afbouw](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afronding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Totale cursusduur:** ~10-14 uur | **Vaardigheidsprogressie:** Beginner → Productieklaar

---

## 📚 Leerhoofdstukken

*Kies je leerpad op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Basis & Snelstart
**Vereisten**: Azure-abonnement, basiskennis van de opdrachtregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je leert
- Begrijpen van de basisprincipes van Azure Developer CLI
- AZD installeren op je platform
- Je eerste succesvolle implementatie

#### Leermaterialen
- **🎯 Begin hier**: [What is Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Setup**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platform-specifieke handleidingen
- **🛠️ Hands-On**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze tutorial
- **📋 Snelreferentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische oefeningen
```bash
# Snelle installatiecontrole
azd version

# Implementeer uw eerste applicatie
azd init --template todo-nodejs-mongo
azd up
```

**💡 Leerresultaat Hoofdstuk**: Een eenvoudige webapplicatie succesvol implementeren naar Azure met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1 zou je in staat moeten zijn om:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Publiceert naar Azure
azd show                # Toont URL van de draaiende app
# Applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1 zou je het volgende moeten kunnen:
azd version              # Toont de geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Deployt naar Azure
azd show                # Toont URL van de draaiende app
# De applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren

---

### 🤖 Hoofdstuk 2: AI-First Ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Integratie van Microsoft Foundry met AZD
- Implementeren van AI-gestuurde applicaties
- Begrijpen van AI-serviceconfiguraties

#### Leermaterialen
- **🎯 Begin hier**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agents**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Implementeer intelligente agents met AZD
- **📖 Patronen**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - AI-modellen implementeren en beheren
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshop Materials](workshop/README.md) - Browser-gebaseerd leren met MkDocs * DevContainer-omgeving
- **📋 Templates**: [Microsoft Foundry Templates](../..)
- **📝 Voorbeelden**: [AZD Deployment Examples](examples/README.md)

#### Praktische oefeningen
```bash
# Implementeer je eerste AI-toepassing
azd init --template azure-search-openai-demo
azd up

# Probeer aanvullende AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Leerresultaat Hoofdstuk**: Een AI-gestuurde chatapplicatie implementeren en configureren met RAG-mogelijkheden

**✅ Succesvalidatie:**
```bash
# Na hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# Test de AI-chatinterface
# Stel vragen en ontvang door AI aangedreven antwoorden met bronnen
# Controleer of de zoekintegratie werkt
azd monitor  # Controleer of Application Insights telemetrie toont
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan production-ready AI-applicaties implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijp $80-150/maand ontwikkelkosten, $300-3500/maand productiekosten

#### 💰 Kostenoverwegingen voor AI-implementaties

**Ontwikkelomgeving (Geschat $80-150/maand):**
- Azure OpenAI (Pay-as-you-go): $0-50/maand (gebaseerd op tokengebruik)
- AI Search (Basic tier): $75/maand
- Container Apps (Consumption): $0-20/maand
- Storage (Standard): $1-5/maand

**Productieomgeving (Geschat $300-3.500+/maand):**
- Azure OpenAI (PTU voor consistente prestaties): $3.000+/maand OF Pay-as-you-go bij hoog volume
- AI Search (Standard tier): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Storage (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik **Free Tier** Azure OpenAI voor leren (50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources te dealloceren wanneer je niet actief ontwikkelt
- Begin met verbruik-gebaseerde facturering, upgrade naar PTU alleen voor productie
- Gebruik `azd provision --preview` om kosten voor implementatie te schatten
- Schakel autoscaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenbewaking:**
```bash
# Controleer de geschatte maandelijkse kosten
azd provision --preview

# Houd de werkelijke kosten in de Azure Portal in de gaten
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
- Naamgeving en organisatie van resources

#### Leermaterialen
- **📖 Configuratie**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Omgevingsinstelling
- **🔐 Beveiliging**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database App Example](examples/database-app/README.md) - AZD-databasevoorbeelden

#### Praktische oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel managed identity-authenticatie in
- Implementeer omgevingsspecifieke configuraties

**💡 Leerresultaat Hoofdstuk**: Beheer meerdere omgevingen met juiste authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructure as Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1.5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je leert
- Geavanceerde implementatiepatronen
- Infrastructure as Code met Bicep
- Resource-provisioning strategieën

#### Leermaterialen
- **📖 Implementatie**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Volledige workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container App Example](../../examples/container-app) - Gedeployde containeroplossingen

#### Praktische oefeningen
- Maak aangepaste Bicep-templates
- Implementeer multi-service applicaties
- Implementeer blue-green deployment-strategieën

**💡 Leerresultaat Hoofdstuk**: Implementeer complexe multi-service applicaties met aangepaste infrastructuurtemplates

---

### 🎯 Hoofdstuk 5: Multi-Agent AI Oplossingen (Gevorderd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Multi-agent architectuurpatronen
- Agent-orchestratie en coördinatie
- Production-ready AI-implementaties

#### Leermaterialen
- **🤖 Uitgelicht project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM-templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click implementatie
- **📖 Architectuur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktische oefeningen
```bash
# Implementeer de volledige retail multi-agentoplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Leerresultaat Hoofdstuk**: Implementeer en beheer een production-ready multi-agent AI-oplossing met Customer- en Inventory-agents

---

### 🔍 Hoofdstuk 6: Pre-Deployment Validatie & Planning
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Capacity planning en resource-validatie
- SKU-selectiestrategieën
- Pre-flight checks en automatisering

#### Leermaterialen
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource-validatie
- **💰 Selectie**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische oefeningen
- Voer capacity-validatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deployment checks

**💡 Leerresultaat Hoofdstuk**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Troubleshooting & Debugging
**Vereisten**: Elk implementatiehoofdstuk voltooid  
**Duur**: 1-1.5 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Systematische debuggingbenaderingen
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leermaterialen
- **🔧 Veelvoorkomende problemen**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI-problemen**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktische oefeningen
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug AI-serviceconnectiviteit

**💡 Leerresultaat Hoofdstuk**: Diagnoseer en los zelfstandig veelvoorkomende implementatieproblemen op

---

### 🏢 Hoofdstuk 8: Productie & Enterprise Patronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Productie-implementatiestrategieën
- Enterprise-beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leermaterialen
- **🏭 Productie**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprisepatronen
- **📝 Voorbeelden**: [Microservices Example](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische oefeningen
- Implementeer enterprise-beveiligingspatronen
- Stel uitgebreide monitoring in
- Deploy naar productie met juiste governance

**💡 Leerresultaat Hoofdstuk**: Implementeer enterprise-klare applicaties met volledige productiemogelijkheden

---

## 🎓 Workshop Overzicht: Hands-On Leerervaring

> **⚠️ WORKSHOP STATUS: Actieve Ontwikkeling**
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige geavanceerde secties zijn nog niet voltooid. We werken actief aan het voltooien van alle inhoud. [Volg de voortgang →](workshop/README.md)

### Interactieve workshopmaterialen
**Uitgebreide praktische leerervaring met browser-gebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfgestuurd leren als door een instructeur geleide sessies.

#### 🛠️ Workshopfuncties
- **Browsergebaseerde interface**: Complete MkDocs-aangedreven workshop met zoek-, kopieer- en themafuncties
- **Integratie met GitHub Codespaces**: Opzetten van de ontwikkelomgeving met één klik
- **Gestructureerd leerpad**: 8-module geleide oefeningen (3-4 uur in totaal)
- **Progressieve methodologie**: Introductie → Selectie → Validatie → Ontleding → Configuratie → Personalisatie → Afbouw → Afronding
- **Interactieve DevContainer-omgeving**: Vooraf geconfigureerde tools en afhankelijkheden

#### 📚 Structuur van workshopmodules
De workshop volgt een **8-module progressieve methodologie** die je van verkenning naar beheersing van implementatie brengt:

| Module | Onderwerp | Wat je zult doen | Duur |
|--------|-------|----------------|----------|
| **0. Introductie** | Workshopoverzicht | Begrijp leerdoelen, vereisten en de workshopstructuur | 15 min |
| **1. Selectie** | Template-ontdekking | Verken AZD-templates en selecteer het juiste AI-template voor jouw scenario | 20 min |
| **2. Validatie** | Implementeren & verifiëren | Implementeer het template met `azd up` en verifieer dat de infrastructuur werkt | 30 min |
| **3. Ontleding** | Begrijp structuur | Gebruik GitHub Copilot om template-architectuur, Bicep-bestanden en code-organisatie te verkennen | 30 min |
| **4. Configuratie** | Diepgaande azure.yaml-analyse | Beheers de `azure.yaml`-configuratie, lifecycle hooks en omgevingsvariabelen | 30 min |
| **5. Personalisatie** | Maak het eigen | Schakel AI Search, tracing, evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Afbouw** | Opruimen | Deprovisioneer resources veilig met `azd down --purge` | 15 min |
| **7. Afronding** | Volgende stappen | Beoordeel behaalde resultaten, kernconcepten en zet je leerreis voort | 15 min |

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
# Klik op "Code" → "Create codespace on main" in de repository

# Optie 2: Lokale ontwikkeling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Volg de setup-instructies in workshop/README.md
```

#### 🎯 Leerresultaten van de workshop
Door de workshop te voltooien zullen deelnemers:
- **Productie AI-toepassingen implementeren**: Gebruik AZD met Microsoft Foundry-services
- **Beheers multi-agent-architecturen**: Implementeer gecoördineerde AI-agentoplossingen
- **Implementeer beveiligingsbest practices**: Configureer authenticatie en toegangscontrole
- **Optimaliseer voor schaal**: Ontwerp kosteneffectieve, presterende implementaties
- **Los implementatieproblemen op**: Los veelvoorkomende problemen zelfstandig op

#### 📖 Workshopbronnen
- **🎥 Interactieve gids**: [Workshopmaterialen](workshop/README.md) - Browser-gebaseerde leeromgeving
- **📋 Instructies per module**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Overzicht van de workshop en doelstellingen
  - [1. Selectie](workshop/docs/instructions/1-Select-AI-Template.md) - Vind en selecteer AI-templates
  - [2. Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementeer en verifieer templates
  - [3. Ontleding](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken template-architectuur
  - [4. Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers azure.yaml
  - [5. Personalisatie](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Opruimen](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Afronding](workshop/docs/instructions/7-Wrap-up.md) - Beoordeling en volgende stappen
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Oefeningen gericht op AI
- **💡 Snelstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstrainingen, universitaire cursussen, zelfgestuurd leren en developer bootcamps.

---

## 📖 Diepgaande verkenning: AZD-mogelijkheden

Naast de basis biedt AZD krachtige functies voor productie-implementaties:

- **Template-gebaseerde implementaties** - Gebruik vooraf gebouwde templates voor veelvoorkomende applicatiepatronen
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Provision, implementeer en monitor applicaties naadloos
- **Developer-vriendelijk** - Geoptimaliseerd voor ontwikkelaarsproductiviteit en -ervaring

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de belangrijkste uitdagingen aan waarmee AI-ontwikkelaars te maken hebben:

- **AI-klaar templates** - Vooraf geconfigureerde templates voor Azure OpenAI, Cognitive Services en ML-workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-diensten, API-sleutels en modelendpoints  
- **Productie-AI-patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-end AI-workflows** - Van modelontwikkeling tot productie-implementatie met juiste monitoring
- **Kostenoptimalisatie** - Slimme resource-toewijzing en schaalstrategieën voor AI-workloads
- **Integratie met Microsoft Foundry** - Naadloze koppeling met de Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Sjablonen- en voorbeeldbibliotheek

### Aanbevolen: Microsoft Foundry-templates
**Begin hier als je AI-toepassingen implementeert!**

> **Opmerking:** Deze templates tonen verschillende AI-patronen. Sommige zijn externe Azure Samples, andere zijn lokale implementaties.

| Sjabloon | Hoofdstuk | Complexiteit | Services | Type |
|----------|---------|------------|----------|------|
| [**Aan de slag met AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Aan de slag met AI-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat-app Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent-oplossing**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Aanbevolen: Volledige leerscenario's
**Productieklare applicatie-templates gekoppeld aan leershoofdstukken**

| Sjabloon | Leerhoofdstuk | Complexiteit | Belangrijkste leerpunten |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basispatronen voor AI-implementatie |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Integratie van Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agent-framework en functie-aanroepen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI-orchestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agentarchitectuur met Customer- en Inventory-agents |

### Leren per voorbeeldtype

> **📌 Lokaal vs. externe voorbeelden:**  
> **Lokale voorbeelden** (in deze repo) = Klaar voor direct gebruik  
> **Externe voorbeelden** (Azure Samples) = Kloon vanuit gekoppelde repositories

#### Lokale voorbeelden (Klaar voor gebruik)
- [**Retail Multi-Agent-oplossing**](examples/retail-scenario.md) - Complete productieklare implementatie met ARM-templates
  - Multi-agentarchitectuur (Customer + Inventory agents)
  - Uitgebreide monitoring en evaluatie
  - Eén-klik deployment via ARM-template

#### Lokale voorbeelden - Container-applicaties (Hoofdstukken 2-5)
**Uitgebreide containerimplementatievoorbeelden in deze repository:**
- [**Container App Voorbeelden**](examples/container-app/README.md) - Volledige gids voor containerimplementaties
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Productieklare multi-service implementatie
  - Quick Start, Productie en Geavanceerde implementatiepatronen
  - Richtlijnen voor monitoring, beveiliging en kostenoptimalisatie

#### Externe voorbeelden - Eenvoudige applicaties (Hoofdstukken 1-2)
**Kloon deze Azure Samples repositories om te beginnen:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basisimplementatiepatronen
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementatie van statische content
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-implementatie

#### Externe voorbeelden - Database-integratie (Hoofdstukken 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseconnectiviteits-patronen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dataworkflows

#### Externe voorbeelden - Geavanceerde patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productieklare ML-patronen

### Externe templatecollecties
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Gecureerde collectie van officiële en community-templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template-documentatie
- [**Examples Directory**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leerbronnen en referenties

### Snelle referenties
- [**Overzicht van commando's**](resources/cheat-sheet.md) - Essentiële azd-commando's, georganiseerd per hoofdstuk
- [**Woordenlijst**](resources/glossary.md) - Terminologie voor Azure en azd  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen, georganiseerd per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktische workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-implementeerbaar (2-3 uur)
- [**Interactieve workshop**](workshop/README.md) - 8-module geleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Introductie → Selectie → Validatie → Ontleding → Configuratie → Personalisatie → Afbouw → Afronding

### Externe leerbronnen
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

# Controleer de installatie
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

# Instellen voor AZD-omgeving
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Controleren
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" of "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" faalt halverwege</strong></summary>

```bash
# Optie 1: Opschonen en opnieuw proberen
azd down --force --purge
azd up

# Optie 2: Alleen infrastructuur repareren
azd provision

# Optie 3: Controleer gedetailleerde status
azd show

# Optie 4: Controleer logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" of "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" of naamconflicten</strong></summary>

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
- AI-toepassingen: 15-25 minuten (de provisioning van OpenAI is traag)

```bash
# Controleer voortgang
azd show

# Als het meer dan 30 minuten vastzit, controleer de Azure-portal:
azd monitor
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Permission denied" of "Forbidden"</strong></summary>

```bash
# Controleer je Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Je hebt minimaal de rol "Contributor" nodig
# Vraag je Azure-beheerder om het volgende toe te kennen:
# - Contributor (voor bronnen)
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

### 📚 Volledige bronnen voor probleemoplossing

- **Gids voor veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI-probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Foutopsporingsgids:** [Stapsgewijze foutopsporing](docs/chapter-07-troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursus voltooiing & certificering

### Voortgang bijhouden
Volg je voortgang per hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Snelstart ✅
- [ ] **Hoofdstuk 2**: AI-first ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructuur als code & Implementatie ✅
- [ ] **Hoofdstuk 5**: Multi-agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Validatie & Planning vóór implementatie ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Foutopsporing ✅
- [ ] **Hoofdstuk 8**: Productie & Enterprise-patronen ✅

### Verificatie van kennis
Na het voltooien van elk hoofdstuk, controleer je kennis door:
1. **Praktijkopdracht**: Voltooi de hands-on implementatie van het hoofdstuk
2. **Kenniscontrole**: Bekijk de FAQ-sectie van je hoofdstuk
3. **Communitydiscussie**: Deel je ervaring in Azure Discord
4. **Volgend hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen na voltooiing van de cursus
Na het voltooien van alle hoofdstukken heb je:
- **Productie-ervaring**: Echte AI-toepassingen in Azure geïmplementeerd
- **Professionele vaardigheden**: Implementatiemogelijkheden geschikt voor ondernemingen  
- **Communityerkenning**: Actief lid van de Azure-ontwikkelaarscommunity
- **Carrièreontwikkeling**: Gewilde AZD- en AI-implementatie-expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning
- **Technische problemen**: [Meld bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Vragen over leren**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke hulp**: Sluit je aan bij de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële documentatie van Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Communityinzichten van Microsoft Foundry Discord

**Recente peilingresultaten van het #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI-workloads
- **Top-uitdagingen**: Multi-service implementaties, beheer van referenties, productierijpheid  
- **Meest gevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, best practices

**Sluit je aan bij onze community om:**
- Deel je AZD + AI-ervaringen en krijg hulp
- Toegang tot vroege previews van nieuwe AI-sjablonen
- Bijdragen aan best practices voor AI-implementatie
- Beïnvloed de toekomstige ontwikkeling van AI + AZD-functionaliteit

### Bijdragen aan de cursus
We verwelkomen bijdragen! Lees onze [Richtlijnen voor bijdragen](CONTRIBUTING.md) voor details over:
- **Inhoudsverbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe voorbeelden**: Voeg praktijkvoorbeelden en sjablonen toe  
- **Vertaling**: Help meertalige ondersteuning onderhouden
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Communitynormen**: Volg onze inclusieve communityrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft-leermaterialen

Onze team produceert andere uitgebreide leercursussen:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j voor beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js voor beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain voor beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD voor beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI voor beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP voor beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agenten voor beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatieve AI-serie
[![Generatieve AI voor beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernmateriaal
[![ML voor beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science voor beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI voor beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity voor beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webontwikkeling voor beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT voor beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-ontwikkeling voor beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot voor AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot voor C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-avontuur](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelstart](../..)  
**AI-ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-first ontwikkeling](../..)  
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](../..)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, verzoeken wij u te bedenken dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal geldt als de gezaghebbende bron. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->