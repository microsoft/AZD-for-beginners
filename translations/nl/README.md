# AZD voor Beginners: Een gestructureerde leerreis

![AZD-for-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Geautomatiseerde vertalingen (altijd up-to-date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Birmaans (Myanmar)](../my/README.md) | [Chinees (Vereenvoudigd)](../zh-CN/README.md) | [Chinees (Traditioneel, Hong Kong)](../zh-HK/README.md) | [Chinees (Traditioneel, Macau)](../zh-MO/README.md) | [Chinees (Traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Ests](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigeriaans Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slowaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turks](../tr/README.md) | [Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

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

## 🆕 Wat is er vandaag nieuw in azd

> 📌 Deze cursus is gevalideerd voor **`azd 1.25.6`** (juni 2026). Voer `azd version` uit om je build te controleren, en `azd upgrade` om de nieuwste versie te krijgen.

Azure Developer CLI is gegroeid voorbij traditionele webapps en API's. Vandaag is azd het enige hulpmiddel voor het implementeren van **elke** toepassing naar Azure — inclusief AI-aangedreven toepassingen en intelligente agenten.

Dit betekent het volgende voor jou:

- **AI-agenten zijn nu eersteklas azd-workloads.** Je kunt AI-agentprojecten initialiseren, implementeren en beheren met dezelfde `azd init` → `azd up` workflow die je al kent.
- **Een volledige agentlevenscyclus vanuit de CLI.** De extensie `azure.ai.agents` dekt nu de hele reis — `azd ai agent init` om te scaffolden, `azd ai agent invoke` om te testen (met responstijd-uitvoer), `azd ai agent eval generate` en `azd ai agent optimize` om kwaliteit te meten en te verbeteren, en `azd ai agent delete` om op te ruimen.
- **Meer AI-bouwstenen.** Nieuwe preview-extensies — `azure.ai.skills` en `azure.ai.connections` — laten je herbruikbare agent-vaardigheden en Foundry-verbindingen direct met azd beheren.
- **Microsoft Foundry-integratie** brengt modelimplementatie, agent-hosting en AI-serviceconfiguratie direct in het azd-template-ecosysteem.
- **Soepeler dagelijkse basiszaken.** Recente releases maakten `azd init` idempotent (veilig om opnieuw uit te voeren), lieten `azd auth login` oude tokens automatisch wissen, en voegden een vriendelijke `azd tool` first-run setup prompt toe.
- **De kernworkflow is niet veranderd.** Of je nu een todo-app, een microservice of een multi-agent AI-oplossing implementeert, de opdrachten zijn hetzelfde.

> **Opmerking voor Aspire-gebruikers:** Microsoft verwijst het product nu eenvoudigweg naar **Aspire** (voorheen ".NET Aspire"). azd's Aspire-ondersteuning is ongewijzigd — alleen de naam is bijgewerkt.

Als je azd eerder hebt gebruikt, is AI-ondersteuning een natuurlijke uitbreiding — niet een apart hulpmiddel of een gevorderd traject. Als je net begint, leer je één workflow die voor alles werkt.

---

## 🚀 Wat is de Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarsvriendelijke opdrachtregeltool die het eenvoudig maakt om applicaties naar Azure te deployen. In plaats van handmatig tientallen Azure-resources te maken en te koppelen, kun je hele applicaties met één opdracht implementeren.

### De magie van `azd up`

```bash
# Dit enkele commando doet alles:
# ✅ Maakt alle Azure-resources aan
# ✅ Configureert netwerken en beveiliging
# ✅ Bouwt je applicatiecode
# ✅ Zet in Azure uit
# ✅ Geeft je een werkende URL
azd up
```

**Dat is alles!** Geen klikken in de Azure Portal, geen complexe ARM-templates die je eerst moet leren, geen handmatige configuratie - gewoon werkende applicaties op Azure.

---

## ❓ Azure Developer CLI versus Azure CLI: Wat is het verschil?

Dit is de meest voorkomende vraag die beginners stellen. Hier is het eenvoudige antwoord:

| Kenmerk | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Doel** | Individuele Azure-resources beheren | Volledige applicaties implementeren |
| **Denkwijze** | Infrastructuurgericht | Applicatiegericht |
| **Voorbeeld** | `az webapp create --name myapp...` | `azd up` |
| **Leercurve** | Je moet Azure-services kennen | Je hoeft alleen je app te kennen |
| **Geschikt voor** | DevOps, Infrastructuur | Ontwikkelaars, Prototyping |

### Eenvoudige analogie

- **Azure CLI** is als alle gereedschappen hebben om een huis te bouwen - hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet bouwkunde kennen.
- **Azure Developer CLI** is als het inhuren van een aannemer - je beschrijft wat je wilt, en zij regelen de bouw.

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
# Implementeer je app met AZD
azd up

# Pas vervolgens specifieke bronnen aan met Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind templates in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communitycollectie van kant-en-klare templates om te implementeren:

| Bron | Beschrijving |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Blader door 200+ templates met één-klik implementatie |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Draag je eigen template bij aan de community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Geef een ster en verken de broncode |

### Populaire AI-templates van Awesome AZD

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

Voordat je begint, zorg ervoor dat je machine klaar is voor het template dat je wilt implementeren:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Als een verplichte controle faalt, los dat dan eerst op en ga vervolgens door met de snelle start.

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

### Stap 2: Authenticatie voor AZD

```bash
# Optioneel als je van plan bent om Azure CLI-commando's rechtstreeks in deze cursus te gebruiken
az login

# Vereist voor AZD-workflows
azd auth login
```

Als je niet zeker weet welke je nodig hebt, volg dan de volledige setupstroom in [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Stap 3: Implementeer je eerste app

```bash
# Initialiseren vanuit een sjabloon
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

## 📚 Hoe je deze cursus gebruikt

Deze cursus is ontworpen voor **progressief leren** - begin waar je je prettig bij voelt en werk je weg omhoog:

| Jouw ervaring | Begin hier |
|-----------------|------------|
| **Nieuw bij Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Ken Azure, nieuw met AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Wil AI-apps implementeren** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Wil hands-on oefenen** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 uur begeleide lab |
| **Heb je productiepatronen nodig** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Snelle setup

1. **Fork deze repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloon het**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hulp krijgen**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Liever lokaal klonen?**
>
> Deze repository bevat meer dan 50 taalvertalingen, wat de downloadgrootte aanzienlijk vergroot. Om te klonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.


## Cursusoverzicht

Beheers Azure Developer CLI (azd) middels gestructureerde hoofdstukken ontworpen voor progressief leren. **Speciale focus op het implementeren van AI-toepassingen met Microsoft Foundry-integratie.**
### Waarom Deze Cursus Essentieel Is voor Moderne Ontwikkelaars

Gebaseerd op inzichten uit de Microsoft Foundry Discord-community wil **45% van de ontwikkelaars AZD gebruiken voor AI-workloads** maar stuiten op uitdagingen met:
- Complexe multi-service AI-architecturen
- Best practices voor AI-implementatie in productie  
- Integratie en configuratie van Azure AI-services
- Kostenoptimalisatie voor AI-workloads
- Problemen oplossen bij AI-specifieke implementaties

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zul je:
- **Beheers de AZD- basisprincipes**: Kernconcepten, installatie en configuratie
- **Implementeer AI-toepassingen**: Gebruik AZD met Microsoft Foundry-services
- **Implementeer Infrastructuur als Code**: Beheer Azure-resources met Bicep-sjablonen
- **Los implementaties op**: Los veelvoorkomende problemen op en debug problemen
- **Optimaliseer voor productie**: Beveiliging, schalen, monitoring en kostenbeheer
- **Bouw multi-agent oplossingen**: Implementeer complexe AI-architecturen

## Voordat je begint: accounts, toegang en veronderstellingen

Voordat je hoofdstuk 1 begint, zorg dat je het volgende hebt geregeld. De installatie-stappen later in deze gids gaan ervan uit dat deze basiszaken al zijn afgevinkt.

- **Een Azure-abonnement**: Je kunt een bestaand abonnement van werk of je eigen account gebruiken, of een [gratis proefversie](https://aka.ms/azurefreetrial) aanmaken om te beginnen.
- **Machtiging om Azure-resources te maken**: Voor de meeste oefeningen zou je minimaal **Contributor**-toegang moeten hebben op het doelabonnement of de resourcegroep. Sommige hoofdstukken gaan er ook van uit dat je resourcegroepen, beheerde identiteiten en RBAC-toewijzingen kunt aanmaken.
- [**Een GitHub-account**](https://github.com): Dit is handig om de repository te fork-en, je eigen wijzigingen bij te houden en GitHub Codespaces voor de workshop te gebruiken.
- **Vereisten voor runtime van sjablonen**: Sommige sjablonen hebben lokale tools nodig zoals Node.js, Python, Java of Docker. Voer de setup-validator uit voordat je begint zodat je ontbrekende tools vroegtijdig ontdekt.
- **Basiskennis van de terminal**: Je hoeft geen expert te zijn, maar je moet je op je gemak voelen bij het uitvoeren van opdrachten zoals `git clone`, `azd auth login` en `azd up`.  

> **Werk je in een enterprise-abonnement?**  
> Als je Azure-omgeving wordt beheerd door een beheerder, bevestig van tevoren dat je resources kunt implementeren in het abonnement of de resourcegroep die je van plan bent te gebruiken. Zo niet, vraag dan om een sandbox-abonnement of Contributor-toegang voordat je begint.

> **Nieuw bij Azure?**  
> Begin met je eigen Azure-trial of pay-as-you-go-abonnement via https://aka.ms/azurefreetrial zodat je de oefeningen van begin tot eind kunt afronden zonder te wachten op tenant-niveau goedkeuringen.

## 🗺️ Cursusoverzicht: Snel navigeren per hoofdstuk

Elk hoofdstuk heeft een eigen README met leerdoelen, snelstarts en oefeningen:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Aan de slag | [AZD Basisprincipes](docs/chapter-01-foundation/azd-basics.md) &#124; [Installatie](docs/chapter-01-foundation/installation.md) &#124; [Eerste project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Integratie met Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agents](docs/chapter-02-ai-development/agents.md) &#124; [AI-modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuratie](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planning & Validation | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Totale cursusduur:** ~10-14 uur | **Vaardigheidsontwikkeling:** Beginner → Productieklaar

---

## 📚 Leerhoofdstukken

*Kies je leerroute op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Fundament & Snelstart
**Vereisten**: Azure-abonnement, basiskennis van de opdrachtregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je leert
- Inzicht in de basisprincipes van de Azure Developer CLI
- AZD op je platform installeren
- Je eerste succesvolle implementatie

#### Leerbronnen
- **🎯 Begin hier**: [Wat is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD Basisprincipes](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Installatie**: [Installatie & Configuratie](docs/chapter-01-foundation/installation.md) - Platform-specifieke handleidingen
- **🛠️ Hands-On**: [Je eerste project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze tutorial
- **📋 Snelreferentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische oefeningen
```bash
# Snelle installatiecontrole
azd version

# Implementeer je eerste applicatie
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hoofdstukresultaat**: Implementeer met succes een eenvoudige webapplicatie naar Azure met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van Hoofdstuk 1 zou je in staat moeten zijn om:
azd version              # Toont de geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseer(t) project
azd up                  # Implementeert naar Azure
azd show                # Toont de URL van de draaiende app
# De applicatie opent in de browser en werkt
azd down --force --purge  # Ruimt resources op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan zelfstandig basisapplicaties implementeren
**📈 Vaardigheidsniveau daarna:** Kan zelfstandig basisapplicaties implementeren

---

### 🤖 Hoofdstuk 2: AI-first ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Integratie van Microsoft Foundry met AZD
- Implementeren van AI-gestuurde applicaties
- Inzicht in AI-serviceconfiguraties

#### Leerbronnen
- **🎯 Begin hier**: [Integratie met Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agents**: [Gids voor AI-agents](docs/chapter-02-ai-development/agents.md) - Implementeer intelligente agents met AZD
- **📖 Patronen**: [AI-modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementeren en beheren van AI-modellen
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshop Materials](workshop/README.md) - Browser-gebaseerd leren met MkDocs * DevContainer Environment
- **📋 Sjablonen**: [Microsoft Foundry-templates](#workshopbronnen)
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

**💡 Hoofdstukresultaat**: Implementeer en configureer een AI-gestuurde chatapplicatie met RAG-mogelijkheden

**✅ Succesvalidatie:**
```bash
# Na hoofdstuk 2 zou je het volgende moeten kunnen:
azd init --template azure-search-openai-demo
azd up
# De AI-chatinterface testen
# Vragen stellen en AI-gestuurde antwoorden met bronnen ontvangen
# Controleren of de zoekintegratie werkt
azd monitor  # Controleren of Application Insights telemetrie toont
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan productieklare AI-toepassingen implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijp $80-150/maand ontwikkelkosten, $300-3500/maand productiekosten

#### 💰 Kostenoverwegingen voor AI-implementaties

**Ontwikkelomgeving (Geschat $80-150/maand):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/maand (gebaseerd op tokengebruik)
- AI Search (Basic tier): $75/maand
- Container Apps (Consumption): $0-20/maand
- Storage (Standard): $1-5/maand

**Productieomgeving (Geschat $300-3,500+/maand):**
- Microsoft Foundry Models (PTU voor consistente prestaties): $3,000+/maand OF pay-as-you-go bij hoog volume
- AI Search (Standard tier): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Storage (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik **Free Tier** Microsoft Foundry Models voor leren (Azure OpenAI 50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources te dealloceren wanneer je niet actief ontwikkelt
- Begin met verbruik-gebaseerde facturering, upgrade naar PTU alleen voor productie
- Gebruik `azd provision --preview` om kosten te schatten voordat je implementeert
- Schakel autoscaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenbewaking:**
```bash
# Controleer geschatte maandelijkse kosten
azd provision --preview

# Bewaak werkelijke kosten in de Azure-portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Omgevingsconfiguratie en -beheer
- Authenticatie- en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leerbronnen
- **📖 Configuratie**: [Configuratiehandleiding](docs/chapter-03-configuration/configuration.md) - Omgevingssetup
- **🔐 Beveiliging**: [Authenticatiepatronen en beheerde identiteit](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database-appvoorbeeld](examples/database-app/README.md) - AZD-databasevoorbeelden

#### Praktische oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel authenticatie met beheerde identiteit in
- Implementeer omgevingsspecifieke configuraties

**💡 Hoofdstukresultaat**: Beheer meerdere omgevingen met juiste authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructuur als Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1.5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je leert
- Geavanceerde implementatiepatronen
- Infrastructuur als Code met Bicep
- Strategieën voor resource-provisioning

#### Leerbronnen
- **📖 Implementatie**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Volledige workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resourcebeheer
- **📝 Voorbeelden**: [Container App Voorbeeld](../../examples/container-app) - Containerized deployments

#### Praktische oefeningen
- Maak aangepaste Bicep-sjablonen
- Implementeer multi-service applicaties
- Implementeer blue-green deploymentstrategieën

**💡 Hoofdstukresultaat**: Implementeer complexe multi-service applicaties met aangepaste infrastructuursjablonen

---
### 🎯 Hoofdstuk 5: Multi-agent AI-oplossingen (Geavanceerd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Multi-agent architectuurpatronen
- Agentorchestratie en coördinatie
- Productieklare AI-implementaties

#### Leerbronnen
- **🤖 Uitgelicht project**: [Retail Multi-Agent Oplossing](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM-sjablonen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Eén-klik implementatie
- **📖 Architectuur**: [Multi-agent coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktische oefeningen
```bash
# Implementeer de volledige retail multi-agentoplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Resultaat van het hoofdstuk**: Implementeer en beheer een productieklare multi-agent AI-oplossing met klant- en voorraadagenten

---

### 🔍 Hoofdstuk 6: Pre-Deployment Validatie & Planning
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Capaciteitsplanning en validatie van resources
- Strategieën voor SKU-selectie
- Preflight-controles en automatisering

#### Leerbronnen
- **📊 Planning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validatie van resources
- **💰 Selectie**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deployment checks

**💡 Resultaat van het hoofdstuk**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Troubleshooting & Debugging
**Vereisten**: Een implementatiehoofdstuk voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Systematische foutopsporingsmethoden
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leerbronnen
- **🔧 Veelvoorkomende problemen**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI-problemen**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemen met AI-services

#### Praktische oefeningen
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug AI-serviceconnectiviteit

**💡 Resultaat van het hoofdstuk**: Diagnoseer en los zelfstandig veelvoorkomende implementatieproblemen op

---

### 🏢 Hoofdstuk 8: Production & Enterprise Patterns
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Strategieën voor productie-implementatie
- Enterprise beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leerbronnen
- **🏭 Productie**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise-patronen
- **📝 Voorbeelden**: [Microservices Example](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische oefeningen
- Implementeer enterprise-beveiligingspatronen
- Stel uitgebreide monitoring in
- Implementeer naar productie met de juiste governance

**💡 Resultaat van het hoofdstuk**: Implementeer enterprise-klaar applicaties met volledige productiecapaciteiten

---

## 🎓 Workshopoverzicht: Praktische leerervaring

> **⚠️ WORKSHOP STATUS: Active Development**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige geavanceerde secties zijn onvolledig. We werken actief aan het afronden van alle inhoud. [Volg de voortgang →](workshop/README.md)

### Interactieve workshopmaterialen
**Uitgebreide hands-on leerervaring met browsergebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfgestuurd leren als door een instructeur geleide sessies.

#### 🛠️ Kenmerken van de workshop
- **Browsergebaseerde interface**: Complete MkDocs-gestuurde workshop met zoek-, kopieer- en themafuncties
- **Integratie met GitHub Codespaces**: Een-klik setup van de ontwikkelomgeving
- **Gestructureerd leerpad**: 8-module begeleide oefeningen (3-4 uur totaal)
- **Progressieve methodologie**: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Opruiming → Afsluiting
- **Interactieve DevContainer-omgeving**: Vooraf geconfigureerde tools en afhankelijkheden

#### 📚 Structuur van de workshopmodules
De workshop volgt een **8-module progressieve methodologie** die je brengt van ontdekking naar beheersing van implementatie:

| Module | Onderwerp | Wat je zult doen | Duur |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshopoverzicht | Begrijp leerdoelen, vereisten, en workshopstructuur | 15 min |
| **1. Selection** | Sjabloononderzoek | Verken AZD-sjablonen en selecteer het juiste AI-sjabloon voor jouw scenario | 20 min |
| **2. Validation** | Implementeren & verifiëren | Implementeer het sjabloon met `azd up` en valideer dat de infrastructuur werkt | 30 min |
| **3. Deconstruction** | Begrijp structuur | Gebruik GitHub Copilot om sjabloonarchitectuur, Bicep-bestanden, en codeorganisatie te verkennen | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Beheers `azure.yaml`-configuratie, lifecycle hooks, en omgevingsvariabelen | 30 min |
| **5. Customization** | Maak het eigen | Schakel AI Search, tracing, evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Teardown** | Opruimen | Verwijder resources veilig met `azd down --purge` | 15 min |
| **7. Wrap-up** | Afsluiting | Beoordeel behaalde resultaten, kernconcepten, en vervolg je leertraject | 15 min |

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
# Volg de installatie-instructies in workshop/README.md
```

#### 🎯 Leerresultaten van de workshop
Door de workshop te voltooien zullen deelnemers:
- **Implementeer productietoepassingen met AI**: Gebruik AZD met Microsoft Foundry-services
- **Beheer multi-agentarchitecturen**: Implementeer gecoördineerde AI-agentoplossingen
- **Implementeer beveiligingsbest practices**: Configureer authenticatie en toegangscontrole
- **Optimaliseer voor schaalbaarheid**: Ontwerp kosteneffectieve, performante implementaties
- **Los implementatieproblemen op**: Los veelvoorkomende problemen zelfstandig op

#### 📖 Workshopbronnen
- **🎥 Interactieve gids**: [Workshop Materials](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Module-voor-module instructies**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Workshopoverzicht en doelstellingen
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Vind en selecteer AI-sjablonen
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementeer en verifieer sjablonen
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken sjabloonarchitectuur
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Overzicht en vervolgstappen
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstraining, universitaire cursussen, zelfgestuurd leren, en developer bootcamps.

---

## 📖 Diepgaande verkenning: AZD-mogelijkheden

Naast de basisfuncties biedt AZD krachtige mogelijkheden voor productie-implementaties:

- **Template-gebaseerde implementaties** - Gebruik kant-en-klare sjablonen voor gangbare applicatiepatronen
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Voorzie, implementeer en monitor applicaties naadloos
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor ontwikkelaarproductiviteit en ervaring

### **AZD + Microsoft Foundry: Ideaal voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de belangrijkste uitdagingen aan waar AI-ontwikkelaars mee te maken hebben:

- **AI-klaar sjablonen** - Vooraf geconfigureerde sjablonen voor Microsoft Foundry-modellen, Azure AI-services en ML-workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-services, API-sleutels en modelendpoints  
- **Productie AI-patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie-implementaties
- **End-to-end AI-workflows** - Van modelontwikkeling tot productie-implementatie met juiste monitoring
- **Kostoptimalisatie** - Slimme resourceallocatie en schaalstrategieën voor AI-workloads
- **Integratie met Microsoft Foundry** - Naadloze verbinding met Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Bibliotheek met sjablonen en voorbeelden

### Uitgelicht: Microsoft Foundry-sjablonen
**Begin hier als je AI-toepassingen implementeert!**

> **Opmerking:** Deze sjablonen tonen verschillende AI-patronen. Sommige zijn externe Azure Samples, andere zijn lokale implementaties.

| Sjabloon | Hoofdstuk | Complexiteit | Diensten | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Volledige leerscenario's
**Productieklare applicatiesjablonen gekoppeld aan leershoofdstukken**

| Sjabloon | Leerhoofdstuk | Complexiteit | Belangrijkste leerdoel |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Integratie van Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agentframework en function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI-orchestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent architectuur met klant- en voorraadagenten |

### Leren aan de hand van voorbeelden

> **📌 Lokale vs. externe voorbeelden:**  
> **Lokale voorbeelden** (in deze repo) = Klaar voor direct gebruik  
> **Externe voorbeelden** (Azure Samples) = Clone vanaf gekoppelde repositories

#### Lokale voorbeelden (Klaar voor gebruik)
- [**Retail Multi-Agent Oplossing**](examples/retail-scenario.md) - Volledige productieklare implementatie met ARM-sjablonen
  - Multi-agent architectuur (klant- + voorraadagenten)
  - Uitgebreide monitoring en evaluatie
  - Eén-klik implementatie via ARM-sjabloon

#### Lokale voorbeelden - Containerapplicaties (Hoofdstukken 2-5)
**Uitgebreide containerimplementatievoorbeelden in deze repository:**
- [**Container App Voorbeelden**](examples/container-app/README.md) - Volledige gids voor containerimplementaties
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST-API met schaal-naar-nul
  - [Microservices-architectuur](../../examples/container-app/microservices) - Multi-service implementatie klaar voor productie
  - Quickstart-, productie- en geavanceerde implementatiepatronen
  - Richtlijnen voor monitoring, beveiliging en kostenoptimalisatie

#### Externe voorbeelden - Eenvoudige applicaties (Hoofdstukken 1-2)
**Kloon deze Azure Samples-repositories om te beginnen:**
- [Eenvoudige webapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basisimplementatiepatronen
- [Statische website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementatie van statische inhoud
- [Container-app - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementatie van REST-API

#### Externe voorbeelden - Database-integratie (Hoofdstukken 3-4)  
- [Database-app - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Patronen voor databaseconnectiviteit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless gegevensworkflow

#### Externe voorbeelden - Geavanceerde patronen (Hoofdstukken 4-8)
- [Java-microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML-pijplijn](https://github.com/Azure-Samples/mlops-v2) - ML-patronen klaar voor productie

### Externe sjablooncollecties
- [**Officiële AZD-sjabloongalerij**](https://azure.github.io/awesome-azd/) - Geselecteerde verzameling officiële en community-sjablonen
- [**Azure Developer CLI-sjablonen**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sjabloondocumentatie
- [**Voorbeeldenmap**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leermiddelen & Referenties

### Snelle referenties
- [**Commando-spiekbrief**](resources/cheat-sheet.md) - Essentiële azd-commando's gerangschikt per hoofdstuk
- [**Woordenlijst**](resources/glossary.md) - Azure- en azd-terminologie  
- [**Veelgestelde vragen (FAQ)**](resources/faq.md) - Veelvoorkomende vragen gerangschikt per hoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Hands-on workshops
- [**AI Workshop-lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-implementeerbaar (2-3 uur)
- [**Interactieve workshop**](workshop/README.md) - 8-module begeleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Inleiding → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Afbouw → Afronding

### Externe leermaterialen
- Azure Developer CLI-documentatie (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architecture Center (https://learn.microsoft.com/en-us/azure/architecture/)
- Azure-prijsberekenaar (https://azure.microsoft.com/pricing/calculator/)
- Azure-status (https://status.azure.com/)

### AI-agentvaardigheden voor je editor
- [**Microsoft Azure Skills op skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent-vaardigheden voor Azure AI, Foundry, implementatie, diagnostiek, kostenoptimalisatie en meer. Installeer ze in GitHub Copilot, Cursor, Claude Code of een andere ondersteunde agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snelle probleemoplossingsgids

**Veelvoorkomende problemen voor beginners en directe oplossingen:**

<details>
<summary><strong>❌ "azd: opdracht niet gevonden"</strong></summary>

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
<summary><strong>❌ "Geen abonnement gevonden" of "Abonnement niet ingesteld"</strong></summary>

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
# Optie 1: Opschonen en opnieuw proberen
azd down --force --purge
azd up

# Optie 2: Alleen de infrastructuur repareren
azd provision

# Optie 3: Controleer gedetailleerde status
azd show

# Optie 4: Controleer logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authenticatie mislukt" of "Token verlopen"</strong></summary>

```bash
# Opnieuw authenticeren voor AZD
azd auth logout
azd auth login

# Optioneel: vernieuw ook de Azure CLI als je az-commando's uitvoert
az logout
az login

# Controleer de authenticatie
az account show
```
</details>

<details>
<summary><strong>❌ "Bron bestaat al" of naamconflicten</strong></summary>

```bash
# AZD genereert unieke namen, maar bij een conflict:
azd down --force --purge

# Probeer het vervolgens opnieuw met een schone omgeving
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sjabloonimplementatie duurt te lang</strong></summary>

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minutes
- App met database: 10-15 minutes
- AI-toepassingen: 15-25 minutes (Het provisionen van OpenAI is traag)

```bash
# Controleer voortgang
azd show

# Als u langer dan 30 minuten vastzit, controleer dan de Azure Portal:
azd monitor --overview
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Toegang geweigerd" of "Verboden"</strong></summary>

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U heeft minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om de volgende rollen toe te kennen:
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

### 📚 Volledige probleemoplossingsbronnen

- **Gids voor veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI-probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stapsgewijze foutopsporing](docs/chapter-07-troubleshooting/debugging.md)
- **Hulp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Voltooiing cursus & Certificering

### Voortgang bijhouden
Volg je leerprogressie per hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Quickstart ✅
- [ ] **Hoofdstuk 2**: AI-first ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructuur als code & Implementatie ✅
- [ ] **Hoofdstuk 5**: Multi-agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Pre-deploy validatie & planning ✅
- [ ] **Hoofdstuk 7**: Problemen oplossen & Debugging ✅
- [ ] **Hoofdstuk 8**: Productie- & Enterprise-patronen ✅

### Verificatie van leren
Na het voltooien van elk hoofdstuk, verifieer je kennis door:
1. **Praktische oefening**: Voltooi de praktische implementatie van het hoofdstuk
2. **Kennischeck**: Bekijk de FAQ-sectie voor je hoofdstuk
3. **Communitydiscussie**: Deel je ervaring in Azure Discord
4. **Volgend hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen bij cursusvoltooiing
Na het voltooien van alle hoofdstukken heb je:
- **Productie-ervaring**: Echte AI-toepassingen naar Azure geïmplementeerd
- **Professionele vaardigheden**: Enterprise-klare implementatievaardigheden  
- **Communityerkenning**: Actief lid van de Azure-developergemeenschap
- **Carrièremogelijkheden**: Gewilde AZD- en AI-implementatie-expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning krijgen
- **Technische problemen**: [Meld bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Leervragen**: [Microsoft Azure Discord-gemeenschap](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke hulp**: Join the [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-inzichten uit Microsoft Foundry Discord

**Recente peilresultaten van het #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI-workloads
- **Belangrijkste uitdagingen**: Multi-service-implementaties, beheer van referenties, productieklaarheid  
- **Meest gevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, best practices

**Word lid van onze community om:**
- Deel je AZD + AI-ervaringen en krijg hulp
- Krijg toegang tot vroege previews van nieuwe AI-sjablonen
- Draag bij aan best practices voor AI-implementatie
- Beïnvloed toekomstige AI + AZD-featureontwikkeling

### Bijdragen aan de cursus
We verwelkomen bijdragen! Lees onze [Bijdragenhandleiding](CONTRIBUTING.md) voor details over:
- **Inhoudsverbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe voorbeelden**: Voeg scenario's uit de praktijk en sjablonen toe  
- **Vertaling**: Help bij het onderhouden van meertalige ondersteuning
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Communitynormen**: Volg onze inclusieve communityrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project valt onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft-leermaterialen

Ons team produceert andere uitgebreide leercursussen:

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
[![AI-agents voor beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatieve AI-serie
[![Generatieve AI voor beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernonderwerpen
[![ML voor Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science voor Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI voor Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity voor Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webontwikkeling voor Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT voor Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-ontwikkeling voor Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot voor AI Pair Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot voor C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-avontuur](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelstart](#-chapter-1-foundation--quick-start)  
**AI-ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-first ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](#️-chapter-3-configuration--authentication)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basis](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->