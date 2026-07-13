# AZD Voor Beginners: Een Gestructureerde Leerreis

![AZD-voor-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Geautomatiseerde Vertalingen (Altijd Up-to-Date)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Birmaans (Myanmar)](../my/README.md) | [Chinees (Vereenvoudigd)](../zh-CN/README.md) | [Chinees (Traditioneel, Hong Kong)](../zh-HK/README.md) | [Chinees (Traditioneel, Macau)](../zh-MO/README.md) | [Chinees (Traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Ests](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigeriaans Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slowaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turks](../tr/README.md) | [Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

> **Liever lokaal klonen?**
>
> Deze repository bevat 50+ vertalingen wat de downloadgrootte aanzienlijk verhoogt. Om te klonen zonder vertalingen, gebruik sparse checkout:
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

> 📌 Deze cursus is gevalideerd met **`azd 1.27.1`** (juli 2026). Voer `azd version` uit om je build te controleren, en `azd upgrade` om de nieuwste versie te krijgen.

Azure Developer CLI is uitgegroeid tot meer dan traditionele webapps en API's. Vandaag is azd het enige gereedschap voor het implementeren van **elke** applicatie naar Azure—even AI-gestuurde applicaties en intelligente agenten.

Dit betekent het volgende voor jou:

- **AI-agenten zijn nu volwaardige azd workloads.** Je kunt AI-agentprojecten initialiseren, implementeren en beheren met dezelfde `azd init` → `azd up` workflow die je al kent.
- **Een volledige agent lifecycle via de CLI.** De `azure.ai.agents` extensie dekt nu de hele reis—`azd ai agent init` om te scaffolden, `azd ai agent invoke` om te testen (met reactietijd-output), `azd ai agent eval generate` en `azd ai agent optimize` om kwaliteit te meten en verbeteren, en `azd ai agent delete` om op te ruimen.
- **Meer AI bouwstenen.** Nieuwe preview extensies—`azure.ai.skills` en `azure.ai.connections`—laten je herbruikbare agent-vaardigheden en Foundry-verbindingen direct beheren met azd.
- **Microsoft Foundry integratie** brengt model-implementatie, agent-hosting en AI-serviceconfiguratie direct in het azd template-ecosysteem.
- **Vlottere dagelijkse basiszaken.** Recente releases maakten `azd init` idempotent (veilig om opnieuw uit te voeren), maakten `azd auth login` automatisch verlopen tokens schoon, en voegden een vriendelijke `azd tool` eerste-run setup prompt toe.
- **De kernworkflow is niet veranderd.** Of je nu een todo-app, een microservice, of een multi-agent AI-oplossing implementeert, de commando's zijn hetzelfde.

> **Notitie voor Aspire-gebruikers:** Microsoft noemt het product nu simpelweg **Aspire** (voorheen ".NET Aspire"). De Aspire-ondersteuning van azd is ongewijzigd—alleen de naam is bijgewerkt.

Als je azd al gebruikte, is AI-ondersteuning een natuurlijke uitbreiding—geen apart gereedschap of gevorderd traject. Als je nieuw bent, leer je één workflow die voor alles werkt.

---

## 🚀 Wat is Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarvriendelijke commandoregeltool die het eenvoudig maakt applicaties naar Azure te implementeren. In plaats van handmatig tientallen Azure-bronnen te maken en te verbinden, kun je hele applicaties met één commando implementeren.

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

**Dat is het!** Geen geklik in Azure Portal, geen complexe ARM-templates om eerst te leren, geen handmatige configuratie - gewoon werkende applicaties op Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wat is het Verschil?

Dit is de meest gestelde vraag van beginners. Hier is het eenvoudige antwoord:

| Kenmerk | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Doel** | Beheer individuele Azure-bronnen | Implementeer complete applicaties |
| **Mindset** | Infrastructuur-georiënteerd | Applicatie-georiënteerd |
| **Voorbeeld** | `az webapp create --name myapp...` | `azd up` |
| **Leercurve** | Moet Azure-diensten kennen | Alleen je app kennen |
| **Geschikt voor** | DevOps, Infrastructuur | Ontwikkelaars, Prototyping |

### Eenvoudige Vergelijking

- **Azure CLI** is alsof je alle gereedschappen hebt om een huis te bouwen - hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet bouwen kennen.
- **Azure Developer CLI** is alsof je een aannemer inhuurt - je beschrijft wat je wilt, en zij regelen de bouw.

### Wanneer welke te gebruiken

| Scenario | Gebruik Dit |
|----------|----------|
| "Ik wil mijn webapp snel implementeren" | `azd up` |
| "Ik moet alleen een opslagaccount maken" | `az storage account create` |
| "Ik bouw een volledige AI-applicatie" | `azd init --template azure-search-openai-demo` |
| "Ik moet een specifieke Azure-bron debuggen" | `az resource show` |
| "Ik wil productierijpe implementatie binnen enkele minuten" | `azd up --environment production` |

### Ze werken samen!

AZD gebruikt Azure CLI onder de motorkap. Je kunt beide gebruiken:
```bash
# Zet je app in met AZD
azd up

# Stem daarna specifieke resources af met Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind Templates in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communityverzameling van kant-en-klare templates:

| Bron | Beschrijving |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Blader door 200+ templates met één-klik implementatie |
| 🔗 [**Dien een Template In**](https://github.com/Azure/awesome-azd/issues) | Draag je eigen template bij aan de community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star en verken de bron |

### Populaire AI-Templates uit Awesome AZD

```bash
# RAG-chat met Microsoft Foundry-modellen + AI-zoekopdracht
azd init --template azure-search-openai-demo

# Snelle AI-chatapplicatie
azd init --template openai-chat-app-quickstart

# AI-agenten met Foundry-agenten
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aan de slag in 3 stappen

Voordat je begint, zorg dat je machine klaar is voor de template die je wilt implementeren:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Als een vereiste controle faalt, los dat dan eerst op en ga verder met de snelle start.

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

### Stap 2: Authenticeren voor AZD

```bash
# Optioneel als je van plan bent om Azure CLI-commando's direct in deze cursus te gebruiken
az login

# Vereist voor AZD-workflows
azd auth login
```

Als je niet zeker weet welke je nodig hebt, volg dan de volledige setup-flow in [Installatie & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Stap 3: Implementeer je eerste app

```bash
# Initialiseren vanaf een sjabloon
azd init --template todo-nodejs-mongo

# Implementeren naar Azure (maakt alles aan!)
azd up
```

**🎉 Dat is het!** Je app staat nu live op Azure.

### Opruimen (Niet vergeten!)

```bash
# Verwijder alle bronnen wanneer het experimenteren klaar is
azd down --force --purge
```

---

## 📚 Hoe deze cursus te gebruiken

Deze cursus is ontworpen voor **progressief leren** - begin waar je je comfortabel voelt en werk omhoog:

| Jouw ervaring | Begin hier |
|-----------------|------------|
| **Volledig nieuw in Azure** | [Hoofdstuk 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Ken Azure, nieuw met AZD** | [Hoofdstuk 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Wil AI-apps implementeren** | [Hoofdstuk 2: AI-Eerst Ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Wil hands-on oefenen** | [🎓 Interactieve Workshop](workshop/README.md) - 3-4 uur begeleide lab |
| **Heb productiepatronen nodig** | [Hoofdstuk 8: Productie & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Snelle Setup

1. **Fork deze Repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Clone het**: `git clone https://github.com/JOUW-GEBRUIKERSNAAM/azd-for-beginners.git`
3. **Krijg hulp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Liever lokaal klonen?**

> Deze repository bevat 50+ vertalingen wat de downloadgrootte aanzienlijk verhoogt. Om te klonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dit geeft je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.


## Cursusoverzicht

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken ontworpen voor progressief leren. **Speciale focus op AI-applicatie-implementatie met Microsoft Foundry integratie.**


### Waarom Deze Cursus Essentieel is voor Moderne Ontwikkelaars

Gebaseerd op inzichten van de Microsoft Foundry Discord-gemeenschap, **wil 45% van de ontwikkelaars AZD gebruiken voor AI-workloads** maar stuiten ze op uitdagingen met:
- Complexe multi-service AI-architecturen
- Best practices voor AI-implementatie in productie  
- Integratie en configuratie van Azure AI-diensten
- Kostenoptimalisatie voor AI-workloads
- Probleemoplossing bij AI-specifieke implementatieproblemen

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zul je:
- **AZD Basics beheersen**: Kernconcepten, installatie en configuratie
- **AI-toepassingen implementeren**: Gebruik AZD met Microsoft Foundry-diensten
- **Infrastructuur als Code toepassen**: Beheer Azure-resources met Bicep-templates
- **Implementaties oplossen**: Veelvoorkomende problemen oplossen en debuggen
- **Optimaliseren voor productie**: Beveiliging, schaalbaarheid, monitoring en kostenbeheer
- **Multi-agent oplossingen bouwen**: Complexe AI-architecturen implementeren

## Voordat je begint: Accounts, Toegang en Veronderstellingen

Voordat je aan Hoofdstuk 1 begint, zorg dat je het volgende op orde hebt. De installatie stappen in deze gids gaan ervan uit dat deze basics al geregeld zijn.

- **Een Azure-abonnement**: Je kunt een bestaand abonnement van werk of eigen account gebruiken, of een [gratis proefversie](https://aka.ms/azurefreetrial) aanmaken om te starten.
- **Toestemming om Azure-resources aan te maken**: Voor de meeste oefeningen moet je ten minste **Contributor** toegang hebben op het doelsubscriptie of de resourcegroep. Sommige hoofdstukken veronderstellen ook dat je resourcegroepen, managed identities en RBAC-toewijzingen kunt creëren.
- [**Een GitHub-account**](https://github.com): Dit is handig om de repository te forken, je eigen wijzigingen bij te houden en GitHub Codespaces te gebruiken voor de workshop.
- **Runtime-vereisten voor templates**: Sommige templates vereisen lokale tools zoals Node.js, Python, Java of Docker. Voer de setup-validator uit voordat je begint om ontbrekende tools vroegtijdig te herkennen.
- **Basis terminalvaardigheden**: Je hoeft geen expert te zijn, maar je moet comfortabel zijn met commando's zoals `git clone`, `azd auth login` en `azd up`.

> **Werk je in een enterprise-subscriptie?**
> Als je Azure-omgeving wordt beheerd door een beheerder, bevestig van tevoren dat je resources kunt implementeren in het subscriptie of de resourcegroep die je wil gebruiken. Zo niet, vraag dan om een sandbox-subscriptie of Contributor-toegang voordat je begint.

> **Nieuw in Azure?**
> Begin met je eigen Azure-proefversie of pay-as-you-go abonnement via https://aka.ms/azurefreetrial zodat je de oefeningen van begin tot eind zonder wachttijden op tenant-level goedkeuringen kunt maken.

## 🗺️ Cursuskaart: Snelle Navigatie per Hoofdstuk

Elk hoofdstuk heeft een dedicated README met leerdoelen, snelle starters en oefeningen:

| Hoofdstuk | Onderwerp | Lessen | Duur | Complexiteit |
|---------|-------|---------|----------|------------|
| **[Hfdstk 1: Fundament](docs/chapter-01-foundation/README.md)** | Aan de slag | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installatie](docs/chapter-01-foundation/installation.md) &#124; [Eerste Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Hfdstk 2: AI-ontwikkeling](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Implementatie](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 uur | ⭐⭐ |
| **[Hfdstk 3: Configuratie](docs/chapter-03-configuration/README.md)** | Auth & Beveiliging | [Configuratie](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Beveiliging](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Hfdstk 4: Infrastructuur](docs/chapter-04-infrastructure/README.md)** | IaC & Implementatie | [Implementatiegids](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 uur | ⭐⭐⭐ |
| **[Hfdstk 5: Multi-agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Oplossingen | [Retail Scenario](examples/retail-scenario.md) &#124; [Coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[Hfdstk 6: Pre-implementatie](docs/chapter-06-pre-deployment/README.md)** | Planning & Validatie | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 uur | ⭐⭐ |
| **[Hfdstk 7: Probleemoplossing](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Veelvoorkomende Problemen](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggen](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Problemen](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 uur | ⭐⭐ |
| **[Hfdstk 8: Productie](docs/chapter-08-production/README.md)** | Enterprise Patronen | [Productie Praktijken](docs/chapter-08-production/production-ai-practices.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktijklab | [Introductie](workshop/docs/instructions/0-Introduction.md) &#124; [Selectie](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Afbreken](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afronding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 uur | ⭐⭐ |

**Totale cursusduur:** ~10-14 uur | **Vaardigheidsgroei:** Beginner → Productieklaar

---

## 📚 Leerhoofdstukken

*Selecteer je leerroute op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Fundament & Snelle Start
**Vereisten**: Azure-abonnement, basiskennis commandoregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je zult leren
- Begrip van Azure Developer CLI basisprincipes
- AZD installeren op jouw platform
- Je eerste succesvolle implementatie

#### Leerbronnen
- **🎯 Begin hier**: [Wat is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Setup**: [Installatie & Setup](docs/chapter-01-foundation/installation.md) - Platforms specifieke handleidingen
- **🛠️ Praktijk**: [Je Eerste Project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze tutorial
- **📋 Snelle referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische oefeningen
```bash
# Snelle installatiecheck
azd version

# Zet uw eerste applicatie in
azd init --template todo-nodejs-mongo
azd up
```

**💡 Resultaat hoofdstuk**: Implementeer met succes een eenvoudige webapplicatie naar Azure met AZD

**✅ Succesvalidatie:**
```bash
# Na het voltooien van hoofdstuk 1 zou je in staat moeten zijn om:
azd version              # Toont geïnstalleerde versie
azd init --template todo-nodejs-mongo  # Initialiseert project
azd up                  # Zet uit naar Azure
azd show                # Toont URL van draaiende app
# Applicatie opent in browser en werkt
azd down --force --purge  # Ruimt bronnen op
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren
**📈 Vaardigheidsniveau daarna:** Kan basisapplicaties zelfstandig implementeren

---

### 🤖 Hoofdstuk 2: AI-First Ontwikkeling (Aanbevolen voor AI Ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Integratie van Microsoft Foundry met AZD
- Implementeren van AI-aangedreven applicaties
- Begrip van AI-serviceconfiguraties

#### Leerbronnen
- **🎯 Begin hier**: [Microsoft Foundry Integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Gids](docs/chapter-02-ai-development/agents.md) - Implementeer intelligente agents met AZD
- **📖 Patronen**: [AI Model Implementatie](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementeer en beheer AI-modellen
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshop Materialen](workshop/README.md) - Browsergebaseerd leren met MkDocs * DevContainer Environment
- **📋 Templates**: [Microsoft Foundry Templates](#workshop-materialen)
- **📝 Voorbeelden**: [AZD Implementatievoorbeelden](examples/README.md)

#### Praktische oefeningen
```bash
# Implementeer je eerste AI-toepassing
azd init --template azure-search-openai-demo
azd up

# Probeer extra AI-sjablonen
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Resultaat hoofdstuk**: Implementeer en configureer een AI-chatapplicatie met RAG-mogelijkheden

**✅ Succesvalidatie:**
```bash
# Na hoofdstuk 2 zou je in staat moeten zijn om:
azd init --template azure-search-openai-demo
azd up
# De AI-chatinterface te testen
# Vragen te stellen en AI-gestuurde antwoorden met bronnen te krijgen
# Te verifiëren dat zoekintegratie werkt
azd monitor  # Te controleren of Application Insights telemetrie weergeeft
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan productieklare AI-applicaties implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijp $80-150/maand ontwikkelkosten, $300-3500/maand productiekosten

#### 💰 Kostenoverwegingen voor AI-Implementaties

**Ontwikkelomgeving (geschat $80-150/maand):**
- Microsoft Foundry Modellen (Pay-as-you-go): $0-50/maand (afhankelijk van tokengebruik)
- AI Search (Basis niveau): $75/maand
- Container Apps (Consumptie): $0-20/maand
- Opslag (Standaard): $1-5/maand

**Productieomgeving (geschat $300-3.500+/maand):**
- Microsoft Foundry Modellen (PTU voor consistente prestatie): $3.000+/maand OF Pay-as-go met hoog volume
- AI Search (Standaard niveau): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Opslag (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik **Gratis Niveau** Microsoft Foundry Modellen om te leren (Azure OpenAI 50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources vrij te geven wanneer je niet actief ontwikkelt
- Begin met verbruiksgestuurde facturering, upgrade alleen naar PTU voor productie
- Gebruik `azd provision --preview` om kosten vooraf te schatten
- Schakel auto-scaling in: betaal alleen voor daadwerkelijk gebruik

**Kostenmonitoring:**
```bash
# Controleer geschatte maandelijkse kosten
azd provision --preview

# Houd werkelijke kosten bij in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Omgevingsconfiguratie en -beheer
- Authenticatie en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leerbronnen
- **📖 Configuratie**: [Configuratie Gids](docs/chapter-03-configuration/configuration.md) - Omgevingsinstellingen
- **🔐 Beveiliging**: [Authenticatiepatronen en managed identity](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database App Voorbeeld](examples/database-app/README.md) - AZD Database Voorbeelden

#### Praktische oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel managed identity authenticatie in
- Implementeer omgeving-specifieke configuraties

**💡 Resultaat hoofdstuk**: Beheer meerdere omgevingen met correcte authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructuur als Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je zult leren
- Geavanceerde implementatiepatronen
- Infrastructuur als Code met Bicep
- Strategieën voor resource provisioning

#### Leerbronnen
- **📖 Implementatie**: [Implementatiegids](docs/chapter-04-infrastructure/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Resource Provisioning](docs/chapter-04-infrastructure/provisioning.md) - Beheer van Azure-resources
- **📝 Voorbeelden**: [Container App Voorbeeld](../../examples/container-app) - Containerized implementaties

#### Praktische oefeningen
- Maak aangepaste Bicep-templates
- Implementeer multi-service applicaties
- Implementeer blue-green implementatie strategieën

**💡 Resultaat hoofdstuk**: Implementeer complexe multi-service applicaties met aangepaste infrastructuurtemplates

---


### 🎯 Hoofdstuk 5: Multi-Agent AI Oplossingen (Gevorderd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Multi-agent architectuurpatronen
- Agent orchestratie en coördinatie
- Productieklaar AI deployments

#### Leermaterialen
- **🤖 Uitgelicht Project**: [Retail Multi-Agent Oplossing](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM Templates**: [ARM Template Pakket](../../examples/retail-multiagent-arm-template) - Deployment met één klik
- **📖 Architectuur**: [Multi-agent coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktische Oefeningen
```bash
# Implementeer de complete retail multi-agent oplossing
cd examples/retail-multiagent-arm-template
./deploy.sh

# Verken agentconfiguraties
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hoofdstukresultaat**: Implementeer en beheer een productieklaar multi-agent AI-systeem met Klant- en Voorraadagenten

---

### 🔍 Hoofdstuk 6: Validatie & Planning vóór Deployment
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Capaciteitsplanning en resourcevalidatie
- SKU-selectiestrategieën
- Pre-flight checks en automatisering

#### Leermaterialen
- **📊 Planning**: [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resourcevalidatie
- **💰 Selectie**: [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische Oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deployment controles

**💡 Hoofdstukresultaat**: Valideer en optimaliseer deployments vóór uitvoering

---

### 🚨 Hoofdstuk 7: Probleemoplossing & Debugging
**Vereisten**: Elk deployment hoofdstuk voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Systematische debuggingmethoden
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leermaterialen
- **🔧 Veelvoorkomende Problemen**: [Veelvoorkomende Problemen](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debugging Handleiding](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI Problemen**: [AI-Specifieke Probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI servicedproblemen

#### Praktische Oefeningen
- Diagnoseer deployment fouten
- Los authenticatieproblemen op
- Debug AI service connectiviteit

**💡 Hoofdstukresultaat**: Diagnoseer en los zelfstandig veelvoorkomende deploymentproblemen op

---

### 🏢 Hoofdstuk 8: Productie- & Enterprisepatronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Productie-deploymentstrategieën
- Enterprise beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leermaterialen
- **🏭 Productie**: [Best Practices Productie AI](docs/chapter-08-production/production-ai-practices.md) - Enterprise patronen
- **📝 Voorbeelden**: [Microservices Voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights integratie](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische Oefeningen
- Implementeer enterprise beveiligingspatronen
- Zet uitgebreide monitoring op
- Implementeer productie-deployment met governance

**💡 Hoofdstukresultaat**: Implementeer enterprise-klare applicaties met volledige productiecapaciteiten

---

## 🎓 Workshop Overzicht: Praktische Leerervaring

> **⚠️ WORKSHOP STATUS: Actieve Ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige gevorderde secties zijn nog niet voltooid. We werken actief aan voltooiing van alle inhoud. [Volg voortgang →](workshop/README.md)

### Interactieve Workshop Materialen
**Uitgebreide praktische leermiddelen met browsergebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfstudie als begeleide sessies.

#### 🛠️ Workshop kenmerken
- **Browsergebaseerde interface**: Complete MkDocs-gestuurde workshop met zoek-, kopieer- en themafuncties
- **GitHub Codespaces integratie**: One-click setup voor ontwikkelomgeving
- **Gestructureerde leerroute**: 8-module begeleide oefeningen (3-4 uur totaal)
- **Progressieve methodologie**: Introductie → Selectie → Validatie → Ontleding → Configuratie → Customisatie → Afbouw → Afronding
- **Interactieve DevContainer omgeving**: Vooraf geconfigureerde tools en dependencies

#### 📚 Workshop Module Structuur
De workshop volgt een **8-module progressieve methodologie** die je van ontdekking naar deployment-bekwaamheid leidt:

| Module | Onderwerp | Wat je doet | Duur |
|--------|----------|-------------|-------|
| **0. Introductie** | Workshop Overzicht | Begrijp leerdoelen, vereisten en workshopstructuur | 15 min |
| **1. Selectie** | Template Ontdekking | Verken AZD-templates en kies de juiste AI-template voor jouw scenario | 20 min |
| **2. Validatie** | Deploy & Verifieer | Deploy de template met `azd up` en valideer de infrastructuur | 30 min |
| **3. Ontleding** | Structuur begrijpen | Gebruik GitHub Copilot om templatearchitectuur, Bicep-bestanden en codeorganisatie te verkennen | 30 min |
| **4. Configuratie** | Diepgaande azure.yaml | Beheers `azure.yaml` configuratie, lifecycle hooks, en omgevingsvariabelen | 30 min |
| **5. Customisatie** | Maak het eigen | Schakel AI Search, tracing, evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Afbouw** | Opruimen | Veilig resources afbouwen met `azd down --purge` | 15 min |
| **7. Afronding** | Volgende stappen | Herzie prestaties, kernconcepten en vervolg je leertraject | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Aan de slag met de Workshop
```bash
# Optie 1: GitHub Codespaces (Aanbevolen)
# Klik op "Code" → "Create codespace on main" in de repository

# Optie 2: Lokale ontwikkeling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Volg de installatie-instructies in workshop/README.md
```

#### 🎯 Workshop Leerresultaten
Door het voltooien van de workshop zullen deelnemers:
- **Productie AI-toepassingen deployen**: Gebruik AZD met Microsoft Foundry services
- **Multi-Agent Architecturen beheersen**: Implementeer gecoördineerde AI-agent oplossingen
- **Beveiligingsbest practices implementeren**: Configureer authenticatie en toegangscontrole
- **Optimaliseren voor schaal**: Ontwerp kosteneffectieve, performante deployments
- **Deployments troubleshooten**: Los zelfstandig veelvoorkomende problemen op

#### 📖 Workshop Materialen
- **🎥 Interactieve Gids**: [Workshop Materialen](workshop/README.md) - Browsergebaseerde leeromgeving
- **📋 Module per Module Instructies**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Workshop overzicht en doelen
  - [1. Selectie](workshop/docs/instructions/1-Select-AI-Template.md) - Zoek en selecteer AI-templates
  - [2. Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementeer en verifieer templates
  - [3. Ontleding](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken template architectuur
  - [4. Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers azure.yaml
  - [5. Customisatie](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Afbouw](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Afronding](workshop/docs/instructions/7-Wrap-up.md) - Overzicht en vervolg
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Zakelijke trainingen, universiteitscursussen, zelfstudie en ontwikkelaar bootcamps.

---

## 📖 Diepgaande Verkenning: AZD Mogelijkheden

Naast de basis biedt AZD krachtige functies voor productie-deployments:

- **Template-gebaseerde deployments** - Gebruik vooraf gebouwde templates voor gangbare applicatiepatronen
- **Infrastructure as Code** - Beheer Azure resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloos provisioneren, deployen en monitoren van applicaties
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor productiviteit en gebruikservaring

### **AZD + Microsoft Foundry: Perfect voor AI Deployments**

**Waarom AZD voor AI-oplossingen?** AZD lost de grootste uitdagingen van AI-ontwikkelaars op:

- **AI-Klare Templates** - Vooraf geconfigureerde templates voor Microsoft Foundry Modellen, Azure AI Services en ML-workloads
- **Veilige AI Deployments** - Ingebouwde beveiligingspatronen voor AI-diensten, API-sleutels en model endpoints  
- **Productie AI Patronen** - Best practices voor schaalbare, kosteneffectieve AI-applicatie deployments
- **End-to-End AI Workflows** - Van modelontwikkeling tot productie met juiste monitoring
- **Kostenoptimalisatie** - Slimme resource allocatie en schaalstrategieën voor AI workloads
- **Microsoft Foundry Integratie** - Naadloze koppeling met Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Template- & Voorbeeldenbibliotheek

### Uitgelicht: Microsoft Foundry Templates
**Begin hier als je AI-toepassingen gaat deployen!**

> **Opmerking:** Deze templates tonen verschillende AI-patronen. Sommige zijn externe Azure Samples, andere zijn lokale implementaties.

| Template | Hoofdstuk | Complexiteit | Diensten | Type |
|----------|-----------|-------------|----------|------|
| [**Start met AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Start met AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Oplossing**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Complete Leerscenario's
**Productieklaar applicatietemplates gekoppeld aan leerscenario's**

| Template | Leerhoofdstuk | Complexiteit | Belangrijkste Leerpunt |
|----------|--------------|-------------|---------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-deploymentpatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG-implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Integratie van Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agent raamwerk en functie-aanroepen |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI orkestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent architectuur met Klant- en Voorraadagenten |

### Leren via Voorbeeldtype

> **📌 Lokale vs. Externe Voorbeelden:**  
> **Lokale Voorbeelden** (in deze repo) = Direct klaar voor gebruik  
> **Externe Voorbeelden** (Azure Samples) = Clone vanuit gelinkte repositories

#### Lokale Voorbeelden (Direct klaar voor gebruik)
- [**Retail Multi-Agent Oplossing**](examples/retail-scenario.md) - Complete productieklaar implementatie met ARM-templates
  - Multi-agent architectuur (Klant + Voorraad agenten)
  - Uitgebreide monitoring en evaluatie
  - Deployment met één klik via ARM-template

#### Lokale Voorbeelden - Container Applicaties (Hoofdstukken 2-5)
**Uitgebreide container deployment voorbeelden in deze repository:**

- [**Container App Voorbeelden**](examples/container-app/README.md) - Complete gids voor containerized deployments
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met schaal-tot-nul
  - [Microservices Architectuur](../../examples/container-app/microservices) - Productie-klare multi-service deployment
  - Snelstart, Productie, en Geavanceerde deployment patronen
  - Monitoring, beveiliging, en kostenoptimalisatie richtlijnen

#### Externe Voorbeelden - Eenvoudige Applicaties (Hoofdstukken 1-2)
**Kloon deze Azure Samples repositories om te starten:**
- [Eenvoudige Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basis deployment patronen
- [Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statische content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### Externe Voorbeelden - Database Integratie (Hoofdstuk 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectiviteit patronen
- [Functies + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### Externe Voorbeelden - Geavanceerde Patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Achtergrondverwerking  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productie-klare ML patronen

### Externe Sjabloon Collecties
- [**Officiële AZD Sjabloongalerij**](https://azure.github.io/awesome-azd/) - Geselecteerde collectie van officiële en community sjablonen
- [**Azure Developer CLI Sjablonen**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn sjabloondocumentatie
- [**Voorbeelden Directory**](examples/README.md) - Lokale leer-voorbeelden met uitgebreide uitleg

---

## 📚 Leerbronnen & Referenties

### Snelle Referenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando’s georganiseerd per hoofdstuk
- [**Woordenlijst**](resources/glossary.md) - Azure en azd terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen georganiseerd per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Praktische Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-deployable (2-3 uur)
- [**Interactieve Workshop**](workshop/README.md) - 8-module begeleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Introductie → Selectie → Validatie → Ontleding → Configuratie → Aanpassing → Afbouw → Afronding

### Externe Leerbronnen
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Vaardigheden voor Je Editor
- [**Microsoft Azure Vaardigheden op skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent-vaardigheden voor Azure AI, Foundry, deployment, diagnostiek, kostenoptimalisatie en meer. Installeer ze in GitHub Copilot, Cursor, Claude Code, of elke ondersteunde agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snelle Stappen voor Probleemoplossing

**Veelvoorkomende problemen voor beginners en directe oplossingen:**

<details>
<summary><strong>❌ "azd: commando niet gevonden"</strong></summary>

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

# Stel standaard abonnement in
az account set --subscription "<subscription-id-or-name>"

# Instellen voor AZD-omgeving
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiëren
az account show
```
</details>

<details>
<summary><strong>❌ "OnvoldoendeQuota" of "Quota overschreden"</strong></summary>

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
<summary><strong>❌ "azd up" mislukt halverwege</strong></summary>

```bash
# Optie 1: Opruimen en opnieuw proberen
azd down --force --purge
azd up

# Optie 2: Alleen infrastructuur repareren
azd provision

# Optie 3: Gedetailleerde status controleren
azd show

# Optie 4: Logboeken controleren in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authenticatie mislukt" of "Token verlopen"</strong></summary>

```bash
# Opnieuw authenticeren voor AZD
azd auth logout
azd auth login

# Optioneel: vernieuw ook Azure CLI als je az-commando's uitvoert
az logout
az login

# Verifieer authenticatie
az account show
```
</details>

<details>
<summary><strong>❌ "Resource bestaat al" of naamconflicten</strong></summary>

```bash
# AZD genereert unieke namen, maar bij conflict:
azd down --force --purge

# Probeer dan opnieuw met een schone omgeving
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sjabloon deployment duurt te lang</strong></summary>

**Normale wachttijden:**
- Eenvoudige webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI applicaties: 15-25 minuten (OpenAI provisioning is traag)

```bash
# Controleer voortgang
azd show

# Als vastgelopen >30 minuten, controleer Azure Portal:
azd monitor --overview
# Zoek naar mislukte implementaties
```
</details>

<details>
<summary><strong>❌ "Toestemming geweigerd" of "Verboden"</strong></summary>

```bash
# Controleer uw Azure-rol
az role assignment list --assignee $(az account show --query user.name -o tsv)

# U hebt minimaal de rol "Contributor" nodig
# Vraag uw Azure-beheerder om toe te kennen:
# - Contributor (voor resources)
# - User Access Administrator (voor roltoewijzingen)
```
</details>

<details>
<summary><strong>❌ Kan de URL van de gedeployde applicatie niet vinden</strong></summary>

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

- **Gids voor veelvoorkomende problemen:** [Gedetailleerde oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifieke problemen:** [AI Probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging gids:** [Stap-voor-stap Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursus Voltooiing & Certificering

### Voortgang Bijhouden
Houd je leerprogressie bij per hoofdstuk:

- [ ] **Hoofdstuk 1**: Basis & Snelstart ✅
- [ ] **Hoofdstuk 2**: AI-First Ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructure as Code & Deployment ✅
- [ ] **Hoofdstuk 5**: Multi-Agent AI Oplossingen ✅
- [ ] **Hoofdstuk 6**: Pre-Deployment Validatie & Planning ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Debugging ✅
- [ ] **Hoofdstuk 8**: Productie & Enterprise Patronen ✅

### Leercontrole
Na het voltooien van elk hoofdstuk, verifieer je je kennis door:
1. **Praktijkopdracht**: Voltooi de hands-on deployment van het hoofdstuk
2. **Kennischeck**: Bekijk de FAQ-sectie van je hoofdstuk
3. **Community Discussie**: Deel je ervaring in Azure Discord
4. **Volgend Hoofdstuk**: Ga naar het volgende complexiteitsniveau

### Voordelen van Cursus Voltooiing
Na afronding van alle hoofdstukken, heb je:
- **Productie-ervaring**: Gereedgemaakte AI-applicaties gedeployed naar Azure
- **Professionele Vaardigheden**: Enterprise-klare deploymentmogelijkheden  
- **Community Erkenning**: Actief lid van de Azure ontwikkelaarscommunity
- **Carrièrebevordering**: Gewilde AZD en AI deployment expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning Krijgen
- **Technische Problemen**: [Meld bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Leer Vragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifieke Hulp**: Word lid van de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community Inzichten van Microsoft Foundry Discord

**Recente peilingresultaten van #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI workloads
- **Top uitdagingen**: Multi-service deployments, credential management, productie-gereedheid  
- **Meest aangevraagd**: AI-specifieke sjablonen, probleemoplossingsgidsen, best practices

**Doe mee met onze community om:**
- Je AZD + AI ervaringen te delen en hulp te krijgen
- Eerdere previews van nieuwe AI-sjablonen te bekijken
- Bij te dragen aan beste praktijken voor AI-deployment
- Invloed te hebben op toekomstige AI + AZD functionaliteiten

### Bijdragen aan de Cursus
Wij verwelkomen bijdragen! Lees onze [Bijdragegids](CONTRIBUTING.md) voor details over:
- **Inhoud Verbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe Voorbeelden**: Voeg realistische scenario’s en sjablonen toe  
- **Vertaling**: Help meertalige ondersteuning onderhouden
- **Bug Rapporten**: Verhoog nauwkeurigheid en duidelijkheid
- **Community Standaarden**: Volg onze inclusieve gemeenschapsrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft Leerbronnen

Ons team produceert andere uitgebreide leerprogramma’s:

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
 
### Generatieve AI Serie
[![Generatieve AI voor Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatieve AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernleren
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursusnavigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Basis & Snelle Start](#-chapter-1-foundation--quick-start)  
**AI-ontwikkelaars**: Ga naar [Hoofdstuk 2: AI-First Ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Ervaren ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](#️-chapter-3-configuration--authentication)

**Volgende stappen**: [Begin Hoofdstuk 1 - AZD Basiskennis](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->