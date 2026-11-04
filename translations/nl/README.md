# AZD Voor Beginners: Een Gestructureerde Leerreis

![AZD-voor-beginners](../../translated_images/nl/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Geautomatiseerde Vertalingen (Altijd Actueel)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengaals](../bn/README.md) | [Bulgaars](../bg/README.md) | [Birmaans (Myanmar)](../my/README.md) | [Chinees (Vereenvoudigd)](../zh-CN/README.md) | [Chinees (Traditioneel, Hong Kong)](../zh-HK/README.md) | [Chinees (Traditioneel, Macau)](../zh-MO/README.md) | [Chinees (Traditioneel, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tsjechisch](../cs/README.md) | [Deens](../da/README.md) | [Nederlands](./README.md) | [Estisch](../et/README.md) | [Fins](../fi/README.md) | [Frans](../fr/README.md) | [Duits](../de/README.md) | [Grieks](../el/README.md) | [Hebreeuws](../he/README.md) | [Hindi](../hi/README.md) | [Hongaars](../hu/README.md) | [Indonesisch](../id/README.md) | [Italiaans](../it/README.md) | [Japans](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreaans](../ko/README.md) | [Litouws](../lt/README.md) | [Maleis](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepalees](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Noors](../no/README.md) | [Perzisch (Farsi)](../fa/README.md) | [Pools](../pl/README.md) | [Portugees (Brazilië)](../pt-BR/README.md) | [Portugees (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Roemeens](../ro/README.md) | [Russisch](../ru/README.md) | [Servisch (Cyrillisch)](../sr/README.md) | [Slowaaks](../sk/README.md) | [Sloveens](../sl/README.md) | [Spaans](../es/README.md) | [Swahili](../sw/README.md) | [Zweeds](../sv/README.md) | [Tagalog (Filipijns)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thais](../th/README.md) | [Turks](../tr/README.md) | [Oekraïens](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamees](../vi/README.md)

> **Liever lokaal klonen?**
>
> Deze repository bevat vertalingen in meer dan 50 talen, wat de downloadgrootte aanzienlijk vergroot. Om te klonen zonder vertalingen, gebruik sparse checkout:
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
> Hiermee krijg je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Wat is er nieuw in azd vandaag

> 📌 Deze cursus is gevalideerd tegen **`azd 1.27.1`** (juli 2026). Voer `azd version` uit om je build te controleren, en `azd upgrade` om de nieuwste versie te krijgen.

Azure Developer CLI is verder gegroeid dan traditionele webapps en API's. Vandaag is azd het enige gereedschap om **elke** applicatie naar Azure te deployen—inclusief AI-gestuurde applicaties en intelligente agenten.

Dit betekent het volgende voor jou:

- **AI-agenten zijn nu eersteklas azd workloads.** Je kunt AI-agentprojecten initialiseren, deployen en beheren met dezelfde `azd init` → `azd up` workflow die je al kent.
- **Een volledige agent lifecycle vanuit de CLI.** De `azure.ai.agents` extensie dekt nu het hele traject—`azd ai agent init` om te scaffolden, `azd ai agent invoke` om te testen (met reactietijd-output), `azd ai agent eval generate` en `azd ai agent optimize` om kwaliteit te meten en te verbeteren, en `azd ai agent delete` om op te ruimen.
- **Meer AI bouwstenen.** Nieuwe preview-extensies—`azure.ai.skills` en `azure.ai.connections`—laten je herbruikbare agent-skills en Foundry-verbindingen rechtstreeks met azd beheren.
- **Microsoft Foundry-integratie** brengt modeldeployments, agent-hosting en AI-serviceconfiguratie direct in het azd-template-ecosysteem.
- **Vlottere dagelijkse basiszaken.** Recente releases maakten `azd init` idempotent (veilig opnieuw uit te voeren), zorgden dat `azd auth login` automatisch verouderde tokens verwijdert, en voegden een vriendelijke `azd tool` setup-prompt toe bij de eerste run.
- **De kernworkflow is niet veranderd.** Of je nu een todo-app, een microservice of een multi-agent AI-oplossing deployt, de commando's zijn hetzelfde.

> **Opmerking voor Aspire-gebruikers:** Microsoft noemt het product nu simpelweg **Aspire** (voorheen ".NET Aspire"). azd's ondersteuning voor Aspire blijft ongewijzigd—alleen de naam is aangepast.

Als je azd eerder hebt gebruikt, is AI-ondersteuning een natuurlijke uitbreiding—geen afzonderlijk gereedschap of een geavanceerd traject. Als je nieuw begint, leer je één workflow die voor alles werkt.

---

## 🚀 Wat is Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** is een ontwikkelaarsvriendelijke commandoregeltool die het eenvoudig maakt om applicaties naar Azure te deployen. In plaats van handmatig tientallen Azure-resources aan te maken en te verbinden, kun je complete applicaties met één commando deployen.

### De Magie van `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Dat is alles!** Geen klikken door de Azure Portal, geen complexe ARM-templates om eerst te leren, geen handmatige configuratie—gewoon werkende applicaties op Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Wat is het Verschil?

Dit is de meest gestelde vraag door beginners. Hier is het eenvoudige antwoord:

| Kenmerk | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Doel** | Beheren van individuele Azure-resources | Deployen van complete applicaties |
| **Mindset** | Infrastructuur-gericht | Applicatie-gericht |
| **Voorbeeld** | `az webapp create --name myapp...` | `azd up` |
| **Leertraject** | Moet Azure-diensten kennen | Alleen je app kennen |
| **Beste voor** | DevOps, Infrastructuur | Ontwikkelaars, Prototyping |

### Simpele Analogie

- **Azure CLI** is als alle gereedschappen hebben om een huis te bouwen - hamers, zagen, spijkers. Je kunt alles bouwen, maar je moet weet hebben van bouwen.
- **Azure Developer CLI** is als een aannemer inhuren - je beschrijft wat je wilt, en zij regelen de bouw.

### Wanneer gebruik je wat

| Scenario | Gebruik Dit |
|----------|----------|
| "Ik wil mijn webapp snel deployen" | `azd up` |
| "Ik moet alleen een opslagaccount maken" | `az storage account create` |
| "Ik bouw een volledige AI-applicatie" | `azd init --template azure-search-openai-demo` |
| "Ik moet een specifieke Azure-resource debuggen" | `az resource show` |
| "Ik wil productieklaar deployment in enkele minuten" | `azd up --environment production` |

### Ze werken samen!

AZD gebruikt Azure CLI onder de motorkap. Je kunt ze beide gebruiken:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vind Templates in Awesome AZD

Begin niet vanaf nul! **Awesome AZD** is de communityverzameling van kant-en-klare deploybare templates:

| Resource | Beschrijving |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Blader door 200+ templates met één-klik deploy |
| 🔗 [**Dien een Template in**](https://github.com/Azure/awesome-azd/issues) | Lever je eigen template aan voor de community |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Geef een ster en verken de bron |

### Populaire AI Templates van Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aan de slag in 3 stappen

Voordat je begint, zorg ervoor dat je machine klaar is voor het template dat je wilt deployen:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Als een vereiste controle mislukt, herstel dat eerst en ga dan verder met de snelle start.

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

### Stap 2: Authenticeer voor AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Als je niet zeker weet welke je nodig hebt, volg dan de volledige setup flow in [Installatie & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Stap 3: Deploy je eerste app

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Dat is alles!** Je app staat nu live op Azure.

### Opruimen (Niet Vergeten!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hoe deze cursus te gebruiken

Deze cursus is ontworpen voor **progressief leren** - begin waar je je prettig bij voelt en bouw geleidelijk op:

| Jouw Ervaring | Begin Hier |
|-----------------|------------|
| **Helemaal nieuw met Azure** | [Hoofdstuk 1: Basis](#-chapter-1-foundation--quick-start) |
| **Ken Azure, nieuw met AZD** | [Hoofdstuk 1: Basis](#-chapter-1-foundation--quick-start) |
| **Wil AI-apps deployen** | [Hoofdstuk 2: AI-First Ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Wil praktijkervaring** | [🎓 Interactieve Workshop](workshop/README.md) - 3-4 uur begeleide lab |
| **Heb productiemethoden nodig** | [Hoofdstuk 8: Productie & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Snelle Setup

1. **Fork deze repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloon hem**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Vraag hulp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Liever lokaal klonen?**

> Deze repository bevat vertalingen in meer dan 50 talen, wat de downloadgrootte aanzienlijk vergroot. Om te klonen zonder vertalingen, gebruik sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Hiermee krijg je alles wat je nodig hebt om de cursus te voltooien met een veel snellere download.


## Cursusoverzicht

Beheers Azure Developer CLI (azd) via gestructureerde hoofdstukken ontworpen voor progressief leren. **Speciale focus op AI-applicatie-deployments met Microsoft Foundry-integratie.**

### Waarom deze cursus essentieel is voor moderne ontwikkelaars

Gebaseerd op inzichten van de Microsoft Foundry Discord-community, **wil 45% van de ontwikkelaars AZD gebruiken voor AI-workloads** maar ondervinden ze uitdagingen met:
- Complexe AI-architecturen met meerdere services
- Productie AI-deployment best practices  
- Azure AI-service integratie en configuratie
- Kostenoptimalisatie voor AI-workloads
- Probleemoplossing bij AI-specifieke deployproblemen

### Leerdoelen

Door deze gestructureerde cursus te voltooien, zul je:
- **AZD basisprincipes beheersen**: Kernconcepten, installatie en configuratie
- **AI-applicaties deployen**: Gebruik AZD met Microsoft Foundry-services
- **Implementeer Infrastructure as Code**: Beheer Azure-resources met Bicep-sjablonen
- **Los implementatieproblemen op**: Los veelvoorkomende problemen op en debug problemen
- **Optimaliseer voor productie**: Beveiliging, schaling, monitoring en kostenbeheer
- **Bouw multi-agent oplossingen**: Implementeer complexe AI-architecturen

## Voordat je begint: Accounts, Toegang en Veronderstellingen

Voordat je aan hoofdstuk 1 begint, zorg dat je het volgende klaar hebt staan. De installatiestappen later in deze gids gaan ervan uit dat deze basis al geregeld is.

- **Een Azure-abonnement**: Je kunt een bestaand abonnement van werk of je eigen account gebruiken, of een [gratis proefabonnement](https://aka.ms/azurefreetrial) aanmaken om te beginnen.
- **Toestemming om Azure-resources aan te maken**: Voor de meeste oefeningen heb je minimaal **Contributor**-toegang nodig op het doelsubscriptie of resourcegroep. Sommige hoofdstukken gaan er ook vanuit dat je resourcegroepen, beheerde identiteiten en RBAC-toewijzingen kunt aanmaken.
- [**Een GitHub-account**](https://github.com): Dit is handig om de repository te fork-en, je eigen wijzigingen bij te houden en GitHub Codespaces voor de workshop te gebruiken.
- **Vereisten voor runtime van sjablonen**: Sommige sjablonen hebben lokale tools nodig zoals Node.js, Python, Java of Docker. Voer de setup-validator uit voordat je begint zodat je ontbrekende tools vroegtijdig opmerkt.
- **Basis terminalvaardigheden**: Je hoeft geen expert te zijn, maar je moet comfortabel zijn met het uitvoeren van opdrachten zoals `git clone`, `azd auth login` en `azd up`.

> **Werk je in een enterprise abonnement?**
> Als je Azure-omgeving door een beheerder wordt beheerd, bevestig dan vooraf dat je resources kunt implementeren in de abonnement of resourcegroep die je wilt gebruiken. Zo niet, vraag dan om een sandbox-abonnement of Contributor-toegang voordat je begint.

> **Nieuw met Azure?**
> Begin met je eigen Azure trial of pay-as-you-go abonnement bij https://aka.ms/azurefreetrial zodat je de oefeningen van begin tot eind kunt doen zonder te wachten op goedkeuringen op tenantniveau.

## 🗺️ Cursuskaart: Snelle navigatie per hoofdstuk

Elk hoofdstuk heeft een aparte README met leerdoelen, snelle starts en oefeningen:

| Hoofdstuk | Onderwerp | Lessen | Duur | Complexiteit |
|---------|-------|---------|----------|------------|
| **[Hfdst 1: Basis](docs/chapter-01-foundation/README.md)** | Beginnen | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installatie](docs/chapter-01-foundation/installation.md) &#124; [Eerste Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Hfdst 2: AI-ontwikkeling](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry-integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Modelimplementatie](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 uur | ⭐⭐ |
| **[Hfdst 3: Configuratie](docs/chapter-03-configuration/README.md)** | Auth & Beveiliging | [Configuratie](docs/chapter-03-configuration/configuration.md) &#124; [Authenticatie & Beveiliging](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Hfdst 4: Infrastructuur](docs/chapter-04-infrastructure/README.md)** | IaC & Implementatie | [Implementatiegids](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 uur | ⭐⭐⭐ |
| **[Hfdst 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent-oplossingen | [Retail Scenario](examples/retail-scenario.md) &#124; [Coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[Hfdst 6: Pre-implementatie](docs/chapter-06-pre-deployment/README.md)** | Planning & Validatie | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 uur | ⭐⭐ |
| **[Hfdst 7: Probleemoplossing](docs/chapter-07-troubleshooting/README.md)** | Debug & Oplossen | [Veelvoorkomende problemen](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemen](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 uur | ⭐⭐ |
| **[Hfdst 8: Productie](docs/chapter-08-production/README.md)** | Enterprise Patronen | [Productiepraktijken](docs/chapter-08-production/production-ai-practices.md) | 2-3 uur | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktijklab | [Introductie](workshop/docs/instructions/0-Introduction.md) &#124; [Selectie](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Afbraak](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Afsluiting](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 uur | ⭐⭐ |

**Totale cursusduur:** ~10-14 uur | **Vaardigheidsontwikkeling:** Beginner → Productieklaar

---

## 📚 Leerhoofdstukken

*Selecteer je leerroute op basis van ervaringsniveau en doelen*

### 🚀 Hoofdstuk 1: Basis & Snelle Start
**Vereisten**: Azure-abonnement, basiskennis commandoregel  
**Duur**: 30-45 minuten  
**Complexiteit**: ⭐

#### Wat je leert
- Begrip van Azure Developer CLI-grondbeginselen
- AZD installeren op jouw platform
- Je eerste succesvolle implementatie

#### Leerbronnen
- **🎯 Start hier**: [Wat is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD Basis](docs/chapter-01-foundation/azd-basics.md) - Kernconcepten en terminologie
- **⚙️ Setup**: [Installatie & Setup](docs/chapter-01-foundation/installation.md) - Platform-specifieke handleidingen
- **🛠️ Praktijk**: [Je eerste project](docs/chapter-01-foundation/first-project.md) - Stapsgewijze tutorial
- **📋 Snelle referentie**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktische oefeningen
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Hoofdstukresultaat**: Succesvol een eenvoudige webapplicatie implementeren naar Azure met AZD

**✅ Succesvalidering:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Tijdsinvestering:** 30-45 minuten  
**📈 Vaardigheidsniveau daarna:** Kan zelfstandig basistoepassingen implementeren
**📈 Vaardigheidsniveau daarna:** Kan zelfstandig basistoepassingen implementeren

---

### 🤖 Hoofdstuk 2: AI-First Ontwikkeling (Aanbevolen voor AI-ontwikkelaars)
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 1-2 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Microsoft Foundry-integratie met AZD
- Implementeren van AI-aangedreven applicaties
- Begrip van AI-serviceconfiguraties

#### Leerbronnen
- **🎯 Start hier**: [Microsoft Foundry Integratie](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI Agents**: [AI Agents Gids](docs/chapter-02-ai-development/agents.md) - Intelligente agenten implementeren met AZD
- **📖 Patronen**: [AI Model Implementatie](docs/chapter-02-ai-development/ai-model-deployment.md) - AI-modellen implementeren en beheren
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen AZD-klaar
- **🎥 Interactieve gids**: [Workshopmateriaal](workshop/README.md) - Browser-gebaseerd leren met MkDocs * DevContainer-omgeving
- **📋 Sjablonen**: [Microsoft Foundry Sjablonen](#featured-microsoft-foundry-templates)
- **📝 Voorbeelden**: [AZD Implementatievoorbeelden](examples/README.md)

#### Praktische oefeningen
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Hoofdstukresultaat**: Implementeer en configureer een AI-aangedreven chatapplicatie met RAG-mogelijkheden

**✅ Succesvalidering:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Tijdsinvestering:** 1-2 uur  
**📈 Vaardigheidsniveau daarna:** Kan productieklare AI-applicaties implementeren en configureren  
**💰 Kostenbewustzijn:** Begrijp ontwikkelkosten van $80-150/maand, productiekosten van $300-3500/maand

#### 💰 Kostenoverwegingen voor AI-implementaties

**Ontwikkelomgeving (geschat $80-150/maand):**
- Microsoft Foundry-modellen (Pay-as-you-go): $0-50/maand (afhankelijk van tokengebruik)
- AI Search (Basislaag): $75/maand
- Container Apps (Consumption): $0-20/maand
- Opslag (Standaard): $1-5/maand

**Productieomgeving (geschat $300-3500+/maand):**
- Microsoft Foundry-modellen (PTU voor consistente prestaties): $3.000+/maand OF Pay-as-you-go met hoog volume
- AI Search (Standaardlaag): $250/maand
- Container Apps (Dedicated): $50-100/maand
- Application Insights: $5-50/maand
- Opslag (Premium): $10-50/maand

**💡 Tips voor kostenoptimalisatie:**
- Gebruik **Gratis laag** Microsoft Foundry-modellen om te leren (Azure OpenAI 50.000 tokens/maand inbegrepen)
- Voer `azd down` uit om resources te dealloceren wanneer je niet actief ontwikkelt
- Begin met kosten op verbruik, upgrade naar PTU alleen voor productie
- Gebruik `azd provision --preview` om kosten te schatten vóór implementatie
- Schakel autoschaling in: betaal alleen voor werkelijk verbruik

**Kostenmonitoring:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Hoofdstuk 3: Configuratie & Authenticatie
**Vereisten**: Hoofdstuk 1 voltooid  
**Duur**: 45-60 minuten  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Configuratie en beheer van omgevingen
- Authenticatie en beveiligingsbest practices
- Naamgeving en organisatie van resources

#### Leerbronnen
- **📖 Configuratie**: [Configuratiegids](docs/chapter-03-configuration/configuration.md) - Omgevingsinstellingen
- **🔐 Beveiliging**: [Authenticatiepatronen en beheerde identiteit](docs/chapter-03-configuration/authsecurity.md) - Authenticatiepatronen
- **📝 Voorbeelden**: [Database App Voorbeeld](examples/database-app/README.md) - AZD Database-voorbeelden

#### Praktische oefeningen
- Configureer meerdere omgevingen (dev, staging, prod)
- Stel authenticatie met beheerde identiteit in
- Implementeer omgevingsspecifieke configuraties

**💡 Hoofdstukresultaat**: Beheer meerdere omgevingen met correcte authenticatie en beveiliging

---

### 🏗️ Hoofdstuk 4: Infrastructure as Code & Implementatie
**Vereisten**: Hoofdstukken 1-3 voltooid  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐⭐

#### Wat je leert
- Geavanceerde implementatiepatronen
- Infrastructure as Code met Bicep
- Strategieën voor resource provisioning

#### Leerbronnen
- **📖 Implementatie**: [Implementatiegids](docs/chapter-04-infrastructure/deployment-guide.md) - Complete workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resource management
- **📝 Voorbeelden**: [Container App Voorbeeld](../../examples/container-app) - Containerized implementaties

#### Praktische oefeningen
- Maak aangepaste Bicep-sjablonen
- Implementeer multi-service applicaties
- Implementeer blue-green implementatiestrategieën

**💡 Hoofdstukresultaat**: Implementeer complexe multi-service applicaties met aangepaste infrastructuursjablonen

---

### 🎯 Hoofdstuk 5: Multi-Agent AI-oplossingen (Geavanceerd)
**Vereisten**: Hoofdstukken 1-2 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je leert
- Multi-agent architectuurpatronen
- Agent orchestratie en coördinatie
- Productie-klare AI-implementaties

#### Leerbronnen
- **🤖 Uitgelicht project**: [Retail Multi-Agent Oplossing](examples/retail-scenario.md) - Volledige implementatie
- **🛠️ ARM-sjablonen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Eén-klik implementatie
- **📖 Architectuur**: [Multi-agent coördinatiepatronen](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patronen

#### Praktische oefeningen
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Hoofdstukresultaat**: Implementeer en beheer een productieklare multi-agent AI-oplossing met Klant- en Voorraadagenten

---

### 🔍 Hoofdstuk 6: Pre-implementatie Validatie & Planning
**Vereisten**: Hoofdstuk 4 voltooid  
**Duur**: 1 uur  
**Complexiteit**: ⭐⭐

#### Wat je leert
- Capaciteitsplanning en resourcevalidatie
- SKU-selectiestrategieën
- Pre-flight checks en automatisering

#### Leerbronnen
- **📊 Planning**: [Capaciteitsplanning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resourcevalidatie
- **💰 Selectie**: [SKU-selectie](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffectieve keuzes
- **✅ Validatie**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Geautomatiseerde scripts

#### Praktische Oefeningen
- Voer capaciteitsvalidatiescripts uit
- Optimaliseer SKU-selecties voor kosten
- Implementeer geautomatiseerde pre-deploy checks

**💡 Hoofdstukresultaat**: Valideer en optimaliseer implementaties vóór uitvoering

---

### 🚨 Hoofdstuk 7: Probleemoplossing & Debugging
**Vereisten**: Elk voltooid implementatiehoofdstuk  
**Duur**: 1-1,5 uur  
**Complexiteit**: ⭐⭐

#### Wat je zult leren
- Systematische debugmethoden
- Veelvoorkomende problemen en oplossingen
- AI-specifieke probleemoplossing

#### Leermaterialen
- **🔧 Veelvoorkomende Problemen**: [Veelvoorkomende Problemen](docs/chapter-07-troubleshooting/common-issues.md) - FAQ en oplossingen
- **🕵️ Debugging**: [Debughandleiding](docs/chapter-07-troubleshooting/debugging.md) - Stapsgewijze strategieën
- **🤖 AI Problemen**: [AI Specifieke Probleemoplossing](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-serviceproblemen

#### Praktische Oefeningen
- Diagnoseer implementatiefouten
- Los authenticatieproblemen op
- Debug AI-service connectiviteit

**💡 Hoofdstukresultaat**: Zelfstandig veelvoorkomende implementatieproblemen diagnosticeren en oplossen

---

### 🏢 Hoofdstuk 8: Productie- & Enterprise-patronen
**Vereisten**: Hoofdstukken 1-4 voltooid  
**Duur**: 2-3 uur  
**Complexiteit**: ⭐⭐⭐⭐

#### Wat je zult leren
- Productie-implementatiestrategieën
- Enterprise beveiligingspatronen
- Monitoring en kostenoptimalisatie

#### Leermaterialen
- **🏭 Productie**: [Beste Praktijken voor Productie AI](docs/chapter-08-production/production-ai-practices.md) - Enterprise-patronen
- **📝 Voorbeelden**: [Microservices Voorbeeld](../../examples/microservices) - Complexe architecturen
- **📊 Monitoring**: [Application Insights Integratie](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische Oefeningen
- Implementeer enterprise beveiligingspatronen
- Zet uitgebreide monitoring op
- Deploy naar productie met correcte governance

**💡 Hoofdstukresultaat**: Zet enterprise-klare applicaties in met volledige productiecapaciteiten

---

## 🎓 Workshop Overzicht: Hands-on Leerervaring

> **⚠️ WORKSHOPSTATUS: Actieve Ontwikkeling**  
> De workshopmaterialen worden momenteel ontwikkeld en verfijnd. Kernmodules zijn functioneel, maar sommige geavanceerde delen zijn nog niet af. We werken actief aan het voltooien van alle inhoud. [Volg de voortgang →](workshop/README.md)

### Interactieve Workshopmaterialen
**Uitgebreide hands-on leerervaring met browser-gebaseerde tools en begeleide oefeningen**

Onze workshopmaterialen bieden een gestructureerde, interactieve leerervaring die het hoofdstukgebaseerde curriculum hierboven aanvult. De workshop is ontworpen voor zowel zelfstudie als begeleide sessies.

#### 🛠️ Workshop Kenmerken
- **Browser-gebaseerde Interface**: Complete MkDocs-gestuurde workshop met zoek-, kopieer- en themafuncties
- **GitHub Codespaces Integratie**: Omgevingsinstelling met één klik
- **Gestructureerd Leerpad**: 8-module begeleide oefeningen (3-4 uur totaal)
- **Progressieve Methodologie**: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Afbouw → Afronding
- **Interactieve DevContainer Omgeving**: Vooraf geconfigureerde tools en afhankelijkheden

#### 📚 Workshop Module Structuur
De workshop volgt een **8-module progressieve methodologie** die je van ontdekking naar beheersing van deployment leidt:

| Module | Onderwerp | Wat je Doet | Duur |
|--------|----------|-------------|-------|
| **0. Introductie** | Workshop Overzicht | Begrijp leerdoelen, vereisten, en workshopstructuur | 15 min |
| **1. Selectie** | Template Ontdekking | Verken AZD-templates en selecteer het juiste AI-template voor jouw scenario | 20 min |
| **2. Validatie** | Deploy & Verifieer | Deploy het template met `azd up` en valideer dat infrastructuur werkt | 30 min |
| **3. Deconstructie** | Begrijp Structuur | Gebruik GitHub Copilot om template-architectuur, Bicep-bestanden en codeorganisatie te verkennen | 30 min |
| **4. Configuratie** | azure.yaml Diepgaande Verkenning | Beheers `azure.yaml` configuratie, lifecycle hooks, en omgevingsvariabelen | 30 min |
| **5. Aanpassing** | Maak Het Persoonlijk | Schakel AI Search, tracing, evaluatie in en pas aan voor jouw scenario | 45 min |
| **6. Afbouw** | Opruimen | Voer veilig resource-afbouw uit met `azd down --purge` | 15 min |
| **7. Afronding** | Volgende Stappen | Beoordeel prestaties, kernconcepten en vervolg je leertraject | 15 min |

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
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Leerresultaten Workshop
Door het voltooien van de workshop zullen deelnemers:
- **Productie AI Applicaties Implementeren**: Gebruik AZD met Microsoft Foundry-services
- **Master Multi-Agent Architecturen**: Implementeer gecoördineerde AI-agentoplossingen
- **Beveiligingsbest practices Implementeren**: Configureer authenticatie en toegangscontrole
- **Optimaliseren voor Schaal**: Ontwerp kosteneffectieve, performante implementaties
- **Probleemoplossing van Implementaties**: Los veelvoorkomende problemen zelfstandig op

#### 📖 Workshopbronnen
- **🎥 Interactieve Gids**: [Workshop Materialen](workshop/README.md) - Browser-gebaseerde leeromgeving
- **📋 Module-voor-module instructies**:
  - [0. Introductie](workshop/docs/instructions/0-Introduction.md) - Workshop overzicht en doelen
  - [1. Selectie](workshop/docs/instructions/1-Select-AI-Template.md) - Vind en selecteer AI-templates
  - [2. Validatie](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy en verifieer templates
  - [3. Deconstructie](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Verken template-architectuur
  - [4. Configuratie](workshop/docs/instructions/4-Configure-AI-Template.md) - Beheers azure.yaml
  - [5. Aanpassing](workshop/docs/instructions/5-Customize-AI-Template.md) - Pas aan voor jouw scenario
  - [6. Afbouw](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ruim resources op
  - [7. Afronding](workshop/docs/instructions/7-Wrap-up.md) - Overzicht en volgende stappen
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-gerichte oefeningen
- **💡 Snelle Start**: [Workshop Setup Gids](workshop/README.md#quick-start) - Omgevingsconfiguratie

**Perfect voor**: Bedrijfstrainingen, universitaire cursussen, zelfstudie en developer bootcamps.

---

## 📖 Diepgaande Verkenning: AZD Mogelijkheden

Buiten de basisfuncties biedt AZD krachtige mogelijkheden voor productie-implementaties:

- **Template-gebaseerde implementaties** - Gebruik kant-en-klare templates voor veelvoorkomende applicatiepatronen
- **Infrastructure as Code** - Beheer Azure-resources met Bicep of Terraform  
- **Geïntegreerde workflows** - Naadloos provisioneren, deployen en monitoren van applicaties
- **Ontwikkelaarsvriendelijk** - Geoptimaliseerd voor productiviteit en ervaring van ontwikkelaars

### **AZD + Microsoft Foundry: Perfect voor AI-implementaties**

**Waarom AZD voor AI-oplossingen?** AZD pakt de grootste uitdagingen van AI-ontwikkelaars aan:

- **AI-klaar Templates** - Vooraf geconfigureerde templates voor Microsoft Foundry Modellen, Azure AI Services en ML workloads
- **Veilige AI-implementaties** - Ingebouwde beveiligingspatronen voor AI-services, API-sleutels en modelendpoints  
- **Productie AI-patronen** - Beste praktijken voor schaalbare, kosteneffectieve AI applicatie-implementaties
- **End-to-End AI Workflows** - Van modelontwikkeling tot productie-implementatie met correcte monitoring
- **Kostenoptimalisatie** - Slimme resourceallocatie- en schaalstrategieën voor AI workloads
- **Microsoft Foundry-integratie** - Naadloze koppeling met Microsoft Foundry modelcatalogus en endpoints

---

## 🎯 Templates & Voorbeelden Bibliotheek

### Uitgelicht: Microsoft Foundry Templates
**Begin hier als je AI applicaties implementeert!**

> **Let op:** Deze templates tonen verschillende AI-patronen. Sommige zijn externe Azure Samples, anderen zijn lokale implementaties.

| Template | Hoofdstuk | Complexiteit | Services | Type |
|----------|----------|-------------|----------|------|
| [**Begin met AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Begin met AI agenten**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Hoofdstuk 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Oplossing**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokaal** |

### Uitgelicht: Complete Leerscenario's
**Productieklare applicatietemplates gekoppeld aan leerhoofdstukken**

| Template | Leerhoofdstuk | Complexiteit | Belangrijkste Leerpunten |
|----------|----------------|------------|--------------------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Hoofdstuk 2 | ⭐ | Basis AI-implementatiepatronen |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Hoofdstuk 2 | ⭐⭐ | RAG implementatie met Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Hoofdstuk 4 | ⭐⭐ | Document Intelligence integratie |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Hoofdstuk 5 | ⭐⭐⭐ | Agent framework en function calls |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Hoofdstuk 8 | ⭐⭐⭐ | Enterprise AI orkestratie |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Hoofdstuk 5 | ⭐⭐⭐⭐ | Multi-agent architectuur met Customer en Inventory agents |

### Leren door Voorbeeldtype

> **📌 Lokale vs. Externe Voorbeelden:**  
> **Lokale Voorbeelden** (in deze repo) = Direct klaar voor gebruik  
> **Externe Voorbeelden** (Azure Samples) = Clonen van gelinkte repositories

#### Lokale Voorbeelden (Direct Klaar voor Gebruik)
- [**Retail Multi-Agent Oplossing**](examples/retail-scenario.md) - Complete productieklare implementatie met ARM-templates
  - Multi-agent architectuur (Customer + Inventory agents)
  - Uitgebreide monitoring en evaluatie
  - Eén-klik implementatie via ARM-template

#### Lokale Voorbeelden - Container Applicaties (Hoofdstukken 2-5)
**Uitgebreide containerimplementatievoorbeelden in deze repository:**
- [**Container App Voorbeelden**](examples/container-app/README.md) - Complete gids voor containerimplementaties
  - [Eenvoudige Flask API](../../examples/container-app/simple-flask-api) - Basis REST API met scale-to-zero
  - [Microservices Architectuur](../../examples/container-app/microservices) - Productieklare multi-service implementatie
  - Quick Start, Productie en Geavanceerde implementatiepatronen
  - Monitoring, beveiliging en kostenoptimalisatie richtlijnen

#### Externe Voorbeelden - Eenvoudige Applicaties (Hoofdstukken 1-2)
**Clone deze Azure Samples repositories om te beginnen:**
- [Eenvoudige Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basis implementatiepatronen
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statische inhoud implementatie
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API implementatie

#### Externe Voorbeelden - Database Integratie (Hoofdstukken 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Database connectiviteitspatronen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### Externe Voorbeelden - Geavanceerde Patronen (Hoofdstukken 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service architecturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Background processing  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Productieklare ML-patronen

### Externe Template Collecties
- [**Officiële AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Geselecteerde collectie van officiële en community templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn template documentatie
- [**Voorbeelden Directory**](examples/README.md) - Lokale leervoorbeelden met gedetailleerde uitleg

---

## 📚 Leerbronnen & Referenties

### Snelle Referenties
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Essentiële azd-commando's georganiseerd per hoofdstuk
- [**Glossarium**](resources/glossary.md) - Azure- en azd-terminologie  
- [**FAQ**](resources/faq.md) - Veelgestelde vragen georganiseerd per leerhoofdstuk
- [**Studiegids**](resources/study-guide.md) - Uitgebreide oefenopdrachten

### Hands-on Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Maak je AI-oplossingen deploybaar met AZD (2-3 uur)
- [**Interactieve Workshop**](workshop/README.md) - 8-module begeleide oefeningen met MkDocs en GitHub Codespaces
  - Volgt: Introductie → Selectie → Validatie → Deconstructie → Configuratie → Aanpassing → Afbouw → Afsluiting

### Externe Leerbronnen
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prijscalculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Skills voor Je Editor
- [**Microsoft Azure Skills op skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 open agent skills voor Azure AI, Foundry, deploy, diagnostiek, kostenoptimalisatie en meer. Installeer ze in GitHub Copilot, Cursor, Claude Code of elke ondersteunde agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snelle Probleemoplossingsgids

**Veelvoorkomende problemen waar beginners tegenaan lopen en directe oplossingen:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "No subscription found" of "Subscription not set"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" of "Quota exceeded"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" faalt halverwege</strong></summary>

```bash
# Option 1: Clean and retry
azd down --force --purge
azd up

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" of "Token expired"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" of naamconflicten</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Sjabloon-implementatie duurt te lang</strong></summary>

**Normale wachttijden:**
- Simpele webapp: 5-10 minuten
- App met database: 10-15 minuten
- AI-toepassingen: 15-25 minuten (OpenAI provisie is traag)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission denied" of "Forbidden"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Kan URL van geïmplementeerde applicatie niet vinden</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Volledige Troubleshooting Bronnen

- **Gids voor Veelvoorkomende Problemen:** [Gedetailleerde Oplossingen](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specifieke Problemen:** [AI Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debuggids:** [Stap-voor-stap Debuggen](docs/chapter-07-troubleshooting/debugging.md)
- **Hulp krijgen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Cursus Voltooiing & Certificering

### Voortgang Bijhouden
Volg je leerprogressie door elk hoofdstuk:

- [ ] **Hoofdstuk 1**: Fundament & Snelle Start ✅
- [ ] **Hoofdstuk 2**: AI-Eerst Ontwikkeling ✅  
- [ ] **Hoofdstuk 3**: Configuratie & Authenticatie ✅
- [ ] **Hoofdstuk 4**: Infrastructuur als Code & Deployment ✅
- [ ] **Hoofdstuk 5**: Multi-Agent AI-oplossingen ✅
- [ ] **Hoofdstuk 6**: Pre-Deployment Validatie & Planning ✅
- [ ] **Hoofdstuk 7**: Probleemoplossing & Debugging ✅
- [ ] **Hoofdstuk 8**: Productie & Enterprise Patronen ✅

### Leerverificatie
Na het voltooien van elk hoofdstuk, verifieer je kennis door:
1. **Praktische Oefening**: Rond de hoofdstukhands-on deployment af
2. **Kenniscontrole**: Bekijk de FAQ-sectie voor je hoofdstuk
3. **Gemeenschapsdiscussie**: Deel je ervaring in Azure Discord
4. **Volgend Hoofdstuk**: Ga door naar het volgende complexiteitsniveau

### Voordelen van Cursus Voltooiing
Na het voltooien van alle hoofdstukken heb je:
- **Productie-ervaring**: Echte AI-applicaties naar Azure gedeployed
- **Professionele Vaardigheden**: Gereed voor enterprise deployment  
- **Gemeenschapsherkenning**: Actief lid van Azure ontwikkelaarscommunity
- **Carrièreontwikkeling**: Gewilde AZD- en AI-deployment expertise

---

## 🤝 Community & Ondersteuning

### Hulp & Ondersteuning Krijgen
- **Technische Problemen**: [Meld bugs en vraag functies aan](https://github.com/microsoft/azd-for-beginners/issues)
- **Leer Vragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) en [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specifieke Hulp**: Sluit je aan bij de [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Documentatie**: [Officiële Azure Developer CLI documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Gemeenschapsinzichten van Microsoft Foundry Discord

**Recente Peilingsresultaten van #Azure-kanaal:**
- **45%** van ontwikkelaars wil AZD gebruiken voor AI workloads
- **Topuitdagingen**: Multi-service deployments, credential management, productieklare status  
- **Meest gevraagd**: AI-specifieke sjablonen, troubleshooting gidsen, best practices

**Doe mee met onze community om:**
- Je AZD + AI ervaringen te delen en hulp te krijgen
- Vroegtijdige previews van nieuwe AI-sjablonen te ervaren
- Bij te dragen aan best practices voor AI-deployment
- Invloed uit te oefenen op toekomstige AI + AZD featureontwikkeling

### Bijdragen aan de Cursus
We verwelkomen bijdragen! Lees onze [Bijdrage Gids](CONTRIBUTING.md) voor details over:
- **Inhoud Verbeteringen**: Verbeter bestaande hoofdstukken en voorbeelden
- **Nieuwe Voorbeelden**: Voeg praktijkvoorbeelden en sjablonen toe  
- **Vertaling**: Help meertalige ondersteuning te onderhouden
- **Bugrapporten**: Verbeter nauwkeurigheid en duidelijkheid
- **Gemeenschapsnormen**: Volg onze inclusieve gemeenschapsrichtlijnen

---

## 📄 Cursusinformatie

### Licentie
Dit project is gelicentieerd onder de MIT-licentie - zie het [LICENSE](../../LICENSE) bestand voor details.

### Gerelateerde Microsoft Leerbronnen

Ons team produceert andere uitgebreide leertrajecten:

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
[![Generatieve AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernleren
[![ML voor Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science voor Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI voor Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity voor Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webontwikkeling voor Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT voor Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Ontwikkeling voor Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serie
[![Copilot voor AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot voor C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Avontuur](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Cursus Navigatie

**🚀 Klaar om te beginnen met leren?**

**Beginners**: Begin met [Hoofdstuk 1: Fundament & Snelle Start](#-chapter-1-foundation--quick-start)  
**AI Ontwikkelaars**: Spring naar [Hoofdstuk 2: AI-Eerst Ontwikkeling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Ervaren Ontwikkelaars**: Begin met [Hoofdstuk 3: Configuratie & Authenticatie](#️-chapter-3-configuration--authentication)

**Volgende Stappen**: [Begin Hoofdstuk 1 - AZD Basisprincipes](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->