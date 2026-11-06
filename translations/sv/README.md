# AZD För nybörjare: En strukturerad inlärningsresa

![AZD-for-beginners](../../translated_images/sv/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiska översättningar (Alltid uppdaterade)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](./README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Föredrar du att klona lokalt?**
>
> Detta arkiv innehåller översättningar till över 50 språk vilket avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparsamt utcheckning:
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
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Vad är nytt i azd idag

> 📌 Denna kurs har validerats mot **`azd 1.27.1`** (Juli 2026). Kör `azd version` för att kontrollera din byggnad och `azd upgrade` för att få den senaste versionen.

Azure Developer CLI har vuxit bortom traditionella webbappar och API:er. Idag är azd det enda verktyget för att distribuera **vilken** applikation som helst till Azure – inklusive AI-drivna applikationer och intelligenta agenter.

Här är vad det betyder för dig:

- **AI-agenter är nu förstklassiga azd-arbetsbelastningar.** Du kan initiera, distribuera och hantera AI-agentprojekt med samma `azd init` → `azd up` arbetsflöde som du redan känner till.
- **En komplett agentlivscykel från CLI.** Tillägget `azure.ai.agents` täcker nu hela resan—`azd ai agent init` för att skapa, `azd ai agent invoke` för att testa (med svarstidutdata), `azd ai agent eval generate` och `azd ai agent optimize` för att mäta och förbättra kvaliteten, och `azd ai agent delete` för att städa upp.
- **Fler AI-byggstenar.** Nya förhandsgransknings-tillägg—`azure.ai.skills` och `azure.ai.connections`—låter dig hantera återanvändbara agentfärdigheter och Foundry-anslutningar direkt med azd.
- **Microsoft Foundry-integration** för med sig modellimplementering, agenthosting och AI-tjänstkonfiguration direkt in i azd-mallekosystemet.
- **Smidigare dagliga grunder.** Senaste versionerna gjorde `azd init` idempotent (säkert att köra om), gjorde så att `azd auth login` rensar utgångna tokens automatiskt, och lade till en vänlig `azd tool` uppstartsguide vid första körningen.
- **Kärnarbetsflödet har inte ändrats.** Oavsett om du distribuerar en todo-app, en mikrotjänst eller en multi-agent AI-lösning, är kommandona desamma.

> **Notera för Aspire-användare:** Microsoft hänvisar nu till produkten helt enkelt som **Aspire** (tidigare ".NET Aspire"). azd:s Aspire-stöd är oförändrat—endast namnet har uppdaterats.

Om du har använt azd tidigare är AI-stödet en naturlig förlängning—inte ett separat verktyg eller ett avancerat spår. Om du börjar från början kommer du att lära dig ett arbetsflöde som fungerar för allt.

---

## 🚀 Vad är Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** är ett utvecklarvänligt kommandoradsverktyg som gör det enkelt att distribuera applikationer till Azure. Istället för att manuellt skapa och koppla ihop dussintals Azure-resurser kan du distribuera hela applikationer med ett enda kommando.

### Magin med `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Det är allt!** Ingen klickning i Azure-portalen, inga komplexa ARM-mallar att lära sig först, ingen manuell konfiguration – bara fungerande applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Vad är skillnaden?

Detta är den vanligaste frågan nybörjare ställer. Här är det enkla svaret:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Syfte** | Hantera individuella Azure-resurser | Distribuera kompletta applikationer |
| **Tänk** | Infrastrukturfokuserad | Applikationsfokuserad |
| **Exempel** | `az webapp create --name myapp...` | `azd up` |
| **Inlärningskurva** | Måste känna till Azure-tjänster | Bara känna till din app |
| **Bäst för** | DevOps, Infrastruktur | Utvecklare, Prototyping |

### Enkel liknelse

- **Azure CLI** är som att ha alla verktyg för att bygga ett hus – hammare, såg, spikar. Du kan bygga vad som helst, men du måste kunna byggnadsteknik.
- **Azure Developer CLI** är som att anlita en entreprenör – du beskriver vad du vill ha och de sköter byggandet.

### När man ska använda vilken

| Scenario | Använd detta |
|----------|----------|
| "Jag vill snabbt distribuera min webbapp" | `azd up` |
| "Jag behöver bara skapa ett lagringskonto" | `az storage account create` |
| "Jag bygger en fullständig AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jag behöver felsöka en specifik Azure-resurs" | `az resource show` |
| "Jag vill ha produktionsredo distribution på några minuter" | `azd up --environment production` |

### De fungerar tillsammans!

AZD använder Azure CLI under huven. Du kan använda båda:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Hitta mallar i Awesome AZD

Börja inte från början! **Awesome AZD** är communityns samling av färdiga att distribuera mallar:

| Resurs | Beskrivning |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Bläddra bland 200+ mallar med en-klicks distribution |
| 🔗 [**Skicka in en mall**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mall till communityn |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Stjärnmärk och utforska källkoden |

### Populära AI-mallar från Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom igång på 3 steg

Innan du börjar, se till att din dator är redo för den mall du vill distribuera:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Om någon nödvändig kontroll misslyckas, fixa det först och fortsätt sedan med snabbstarten.

### Steg 1: Installera AZD (2 minuter)

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

### Steg 2: Autentisera för AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Om du är osäker på vilken du behöver, följ hela installationsflödet i [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Steg 3: Distribuera din första app

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Det är klart!** Din app är nu live på Azure.

### Rensa upp (glöm inte!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Hur man använder denna kurs

Den här kursen är utformad för **progressivt lärande** - börja där du är bekväm och arbeta dig uppåt:

| Din Erfarenhet | Börja Här |
|-----------------|------------|
| **Helt ny på Azure** | [Kapitel 1: Grundläggande](#-chapter-1-foundation--quick-start) |
| **Kan Azure, ny på AZD** | [Kapitel 1: Grundläggande](#-chapter-1-foundation--quick-start) |
| **Vill distribuera AI-appar** | [Kapitel 2: AI-först-utveckling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vill ha praktisk övning** | [🎓 Interaktiv Workshop](workshop/README.md) - 3-4 timmars guidad labb |
| **Behöver produktionsmönster** | [Kapitel 8: Produktion & Företag](#-chapter-8-production--enterprise-patterns) |

### Snabbinstallation

1. **Forka detta repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjälp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Föredrar du att klona lokalt?**

> Det här arkivet innehåller över 50 språköversättningar vilket signifikant ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.


## Kursöversikt

Bemästra Azure Developer CLI (azd) genom strukturerade kapitel designade för progressivt lärande. **Särskilt fokus på distribution av AI-applikationer med Microsoft Foundry-integration.**

### Varför denna kurs är viktig för moderna utvecklare

Baserat på insikter från Microsoft Foundry Discord-communityn vill **45 % av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:
- Komplexa AI-arkitekturer med flera tjänster
- Bästa praxis för produktion av AI-distribution  
- Integration och konfiguration av Azure AI-tjänster
- Kostnadsoptimering för AI-arbetsbelastningar
- Felsökning av AI-specifika distributionsproblem

### Lärandemål

Genom att slutföra denna strukturerade kurs kommer du att:
- **Bemästra AZD-grunderna**: Kärnbegrepp, installation och konfiguration
- **Distribuera AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Implementera Infrastruktur som Kod**: Hantera Azure-resurser med Bicep-mallar
- **Felsök distributioner**: Lös vanliga problem och debugga fel
- **Optimera för Produktion**: Säkerhet, skalning, övervakning och kostnadshantering
- **Bygg Multi-Agent-lösningar**: Distribuera komplexa AI-arkitekturer

## Innan du börjar: Konton, åtkomst och antaganden

Innan du börjar Kapitel 1, se till att du har följande på plats. Installationsstegen senare i denna guide förutsätter att dessa grundläggande saker redan är hanterade.

- **Ett Azure-abonnemang**: Du kan använda ett befintligt abonnemang från jobbet eller ditt eget konto, eller skapa en [gratis provperiod](https://aka.ms/azurefreetrial) för att komma igång.
- **Behörighet att skapa Azure-resurser**: För de flesta övningar bör du ha minst **Medarbetare**-åtkomst på målabonnemanget eller resursgruppen. Vissa kapitel kan också anta att du kan skapa resursgrupper, hanterade identiteter och RBAC-uppdrag.
- [**Ett GitHub-konto**](https://github.com): Detta är användbart för att forka repot, spåra dina egna ändringar och använda GitHub Codespaces för workshopen.
- **Förutsättningar för mallkörning**: Vissa mallar behöver lokala verktyg som Node.js, Python, Java eller Docker. Kör installationsvalideraren före start så att du tidigt upptäcker saknade verktyg.
- **Grundläggande terminalvana**: Du behöver inte vara expert, men du bör känna dig bekväm att köra kommandon som `git clone`, `azd auth login` och `azd up`.

> **Arbetar du i ett företagsabonnemang?**
> Om din Azure-miljö hanteras av en administratör, kontrollera i förväg att du kan distribuera resurser i det abonnemang eller den resursgrupp du tänker använda. Om inte, be om ett sandbox-abonnemang eller Medarbetaråtkomst innan du börjar.

> **Ny på Azure?**
> Börja med ditt eget Azure-provakonto eller pay-as-you-go-abonnemang på https://aka.ms/azurefreetrial så du kan genomföra övningarna från början till slut utan att vänta på godkännanden på hyresnivå.

## 🗺️ Kursöversikt: Snabb navigering per kapitel

Varje kapitel har en dedikerad README med lärandemål, snabbstarter och övningar:

| Kapitel | Ämne | Lektioner | Varaktighet | Svårighetsgrad |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grundläggande](docs/chapter-01-foundation/README.md)** | Kom igång | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Första projektet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utveckling](docs/chapter-02-ai-development/README.md)** | AI-först-appar | [Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modellutplacering](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tim | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Autentisering & Säkerhet | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & Säkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Distribution | [Distributionsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 tim | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentlösningar | [Detaljhandelscenario](examples/retail-scenario.md) &#124; [Koordinationsmönster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tim | ⭐⭐⭐⭐ |
| **[Kap 6: Före-distribution](docs/chapter-06-pre-deployment/README.md)** | Planering & Validering | [Preflight-kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanering](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-val](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tim | ⭐⭐ |
| **[Kap 7: Felsökning](docs/chapter-07-troubleshooting/README.md)** | Debugga & Fixa | [Vanliga problem](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggning](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problem](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 tim | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Företagsmönster | [Produktionspraxis](docs/chapter-08-production/production-ai-practices.md) | 2-3 tim | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk labb | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Val](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedmontering](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Avslutning](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tim | ⭐⭐ |

**Total kurslängd:** ~10-14 timmar | **Färdighetsutveckling:** Nybörjare → Produktrensklart

---

## 📚 Läroavsnitt

*Välj din inlärningsväg baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grundläggande & Snabbstart
**Förkunskaper**: Azure-abonnemang, grundläggande kommandoradskunskaper  
**Varaktighet**: 30-45 minuter  
**Svårighetsgrad**: ⭐

#### Vad du lär dig
- Förstå Azure Developer CLI-grunder
- Installera AZD på din plattform
- Din första lyckade distribution

#### Läromedel
- **🎯 Börja här**: [Vad är Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kärnbegrepp och terminologi
- **⚙️ Installation**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Plattformsspecifika guider
- **🛠️ Praktiskt**: [Ditt första projekt](docs/chapter-01-foundation/first-project.md) - Steg-för-steg guide
- **📋 Snabbreferens**: [Kommandocheatsheet](resources/cheat-sheet.md)

#### Praktiska övningar
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Lyckas distribuera en enkel webbapplikation till Azure med AZD

**✅ Framgångsvalidering:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Tidsinvestering:** 30-45 minuter  
**📈 Färdighetsnivå efter:** Kan självständigt distribuera grundläggande applikationer
**📈 Färdighetsnivå efter:** Kan självständigt distribuera grundläggande applikationer

---

### 🤖 Kapitel 2: AI-först-utveckling (Rekommenderas för AI-utvecklare)
**Förkunskaper**: Kapitel 1 klart  
**Varaktighet**: 1-2 timmar  
**Svårighetsgrad**: ⭐⭐

#### Vad du lär dig
- Microsoft Foundry integration med AZD
- Distribuera AI-drivna applikationer
- Förstå AI-tjänstekonfigurationer

#### Läromedel
- **🎯 Börja här**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [Guide för AI-agenter](docs/chapter-02-ai-development/agents.md) - Distribuera intelligenta agenter med AZD
- **📖 Mönster**: [AI-modellutplacering](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuera och hantera AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar redo för AZD
- **🎥 Interaktiv guide**: [Workshop-material](workshop/README.md) - Webbläsarbaserat lärande med MkDocs * DevContainer-miljö
- **📋 Mallar**: [Microsoft Foundry-mallar](#featured-microsoft-foundry-templates)
- **📝 Exempel**: [AZD-distributionsexempel](examples/README.md)

#### Praktiska övningar
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

**✅ Framgångsvalidering:**
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

**📊 Tidsinvestering:** 1-2 timmar  
**📈 Färdighetsnivå efter:** Kan distribuera och konfigurera produktionsklara AI-applikationer  
**💰 Kostnadsmedvetenhet:** Förstå utvecklingskostnader på $80-150/månad, produktionskostnader på $300-3500/månad

#### 💰 Kostnadshänsyn för AI-distributioner

**Utvecklingsmiljö (Beräknat $80-150/månad):**
- Microsoft Foundry-modeller (Betala per användning): $0-50/månad (baserat på token-användning)
- AI Search (Grundnivå): $75/månad
- Container Apps (Konsumtion): $0-20/månad
- Lagring (Standard): $1-5/månad

**Produktionsmiljö (Beräknat $300-3500+/månad):**
- Microsoft Foundry-modeller (PTU för konsekvent prestanda): $3,000+/månad ELLER Betala per användning med hög volym
- AI Search (Standardnivå): $250/månad
- Container Apps (Dedikerad): $50-100/månad
- Application Insights: $5-50/månad
- Lagring (Premium): $10-50/månad

**💡 Kostnadsoptimeringstips:**
- Använd **Gratisnivå** Microsoft Foundry-modeller för lärande (Azure OpenAI inkluderar 50 000 tokens/månad)
- Kör `azd down` för att avallokera resurser när du inte aktivt utvecklar
- Börja med konsumtionsbaserad fakturering, uppgradera till PTU endast för produktion
- Använd `azd provision --preview` för att uppskatta kostnader före distribution
- Aktivera autoskalning: betala endast för faktisk användning

**Kostnadsövervakning:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentisering
**Förkunskaper**: Kapitel 1 klart  
**Varaktighet**: 45-60 minuter  
**Svårighetsgrad**: ⭐⭐

#### Vad du lär dig
- Miljökonfiguration och hantering
- Autentisering och säkerhetsbästa praxis
- Namngivning och organisering av resurser

#### Läromedel
- **📖 Konfiguration**: [Konfigurationsguide](docs/chapter-03-configuration/configuration.md) - Miljöinställningar
- **🔐 Säkerhet**: [Autentiseringsmönster och hanterad identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmönster
- **📝 Exempel**: [Databasapp-exempel](examples/database-app/README.md) - AZD databasexempel

#### Praktiska övningar
- Konfigurera flera miljöer (dev, staging, prod)
- Sätt upp hanterad identitetsautentisering
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastruktur som Kod & Distribution
**Förkunskaper**: Kapitel 1-3 klara  
**Varaktighet**: 1-1,5 timmar  
**Svårighetsgrad**: ⭐⭐⭐

#### Vad du lär dig
- Avancerade distributionsmönster
- Infrastruktur som Kod med Bicep
- Strategier för resursprovisionering

#### Läromedel
- **📖 Distribution**: [Distributionsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletta arbetsflöden
- **🏗️ Provisionering**: [Provisionering av resurser](docs/chapter-04-infrastructure/provisioning.md) - Hantering av Azure-resurser
- **📝 Exempel**: [Container App-exempel](../../examples/container-app) - Containeriserade distributioner

#### Praktiska övningar
- Skapa anpassade Bicep-mallar
- Distribuera multi-tjänst-applikationer
- Implementera blue-green distributonsstrategier

**💡 Kapitelresultat**: Distribuera komplexa multi-tjänst-applikationer med anpassade infrastrukturella mallar

---

### 🎯 Kapitel 5: Multi-Agent AI-lösningar (Avancerat)
**Förkunskaper**: Kapitel 1-2 klara  
**Varaktighet**: 2-3 timmar  
**Svårighetsgrad**: ⭐⭐⭐⭐

#### Vad du lär dig
- Multi-agent arkitekturmönster
- Agentorkestrering och koordinering
- Produktionsklara AI-distributioner

#### Läromedel
- **🤖 Utvalt projekt**: [Detaljhandel Multi-Agent-lösning](examples/retail-scenario.md) - Komplett implementation
- **🛠️ ARM-mallar**: [ARM Template-paket](../../examples/retail-multiagent-arm-template) - Distribution med ett klick
- **📖 Arkitektur**: [Multi-agent koordinationsmönster](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mönster

#### Praktiska övningar
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Distribuera och hantera en produktionsklar multi-agent AI-lösning med Kund- och Lageragenter

---

### 🔍 Kapitel 6: Före-distributionsvalidering & planering
**Förkunskaper**: Kapitel 4 klart  
**Varaktighet**: 1 timme  
**Svårighetsgrad**: ⭐⭐

#### Vad du lär dig
- Kapacitetsplanering och resursvalidering
- Strategier för SKU-val
- Pre-flight-kontroller och automation

#### Läromedel
- **📊 Planering**: [Kapacitetsplanering](docs/chapter-06-pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Urval**: [SKU-urval](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Pre-flight-kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska övningar
- Kör kapacitetsvalideringsskript
- Optimera SKU-val för kostnad
- Implementera automatiserade kontroller före distribution

**💡 Kapitelresultat**: Validera och optimera distributioner innan genomförande

---

### 🚨 Kapitel 7: Felsökning & Debugging
**Förutsättningar**: Något deployeringskapitel genomfört  
**Varaktighet**: 1-1,5 timmar  
**Komplexitet**: ⭐⭐

#### Vad du kommer lära dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Lärresurser
- **🔧 Vanliga problem**: [Vanliga problem](docs/chapter-07-troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Felsökning**: [Felsökningsguide](docs/chapter-07-troubleshooting/debugging.md) - Steg-för-steg-strategier
- **🤖 AI-problem**: [AI-specifik felsökning](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-tjänsteproblem

#### Praktiska övningar
- Diagnostisera fel vid distribution
- Lösa autentiseringsproblem
- Felsöka AI-tjänstekonnektivitet

**💡 Kapitelresultat**: Självständigt diagnostisera och lösa vanliga deployeringsproblem

---

### 🏢 Kapitel 8: Produktions- & Företagsmönster
**Förutsättningar**: Kapitel 1-4 genomförda  
**Varaktighet**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad du kommer lära dig
- Produktionsdistributionsstrategier
- Företags säkerhetsmönster
- Övervakning och kostnadsoptimering

#### Lärresurser
- **🏭 Produktion**: [Bästa praxis för AI i produktion](docs/chapter-08-production/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Microservices-exempel](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: [Application Insights-integration](docs/chapter-06-pre-deployment/application-insights.md) - Övervakning

#### Praktiska övningar
- Implementera företags säkerhetsmönster
- Sätt upp heltäckande övervakning
- Distribuera till produktion med korrekt styrning

**💡 Kapitelresultat**: Distribuera företagsfärdiga applikationer med fulla produktionsmöjligheter

---

## 🎓 Workshopöversikt: Praktisk inlärningsupplevelse

> **⚠️ WORKSHOPSTATUS: Aktiv utveckling**  
> Workshopmaterialet utvecklas och förfinas just nu. Kärnmoduler är fungerande, men några avancerade sektioner är ofärdiga. Vi arbetar aktivt för att slutföra allt innehåll. [Följ framsteg →](workshop/README.md)

### Interaktivt workshopmaterial
**Omfattande praktisk inlärning med webbläsarbaserade verktyg och guidade övningar**

Vårt workshopmaterial ger en strukturerad, interaktiv inlärningsupplevelse som kompletterar det kapitelbaserade kursinnehållet ovan. Workshopen är utformad för både självstudier och lärarledda sessioner.

#### 🛠️ Workshopfunktioner
- **Webbläsarbaserat gränssnitt**: Komplett MkDocs-driven workshop med sök, kopiering och temafunktioner
- **GitHub Codespaces-integration**: Enkel installation av utvecklingsmiljö med ett klick
- **Strukturerad inlärningsväg**: 8 modulers guidade övningar (totalt 3-4 timmar)
- **Progressiv metodologi**: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Nedmontering → Avslutning
- **Interaktiv DevContainer-miljö**: Förkonfigurerade verktyg och beroenden

#### 📚 Workshopmodulstruktur
Workshopen följer en **8-moduls progressiv metodik** som tar dig från upptäckt till mästerskap i distribution:

| Modul | Ämne | Vad du gör | Varaktighet |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshopöversikt | Förstå inlärningsmål, förutsättningar och workshopstruktur | 15 min |
| **1. Urval** | Mallupptäckt | Utforska AZD-mallar och välj rätt AI-mall för ditt scenario | 20 min |
| **2. Validering** | Distribuera & verifiera | Distribuera mallen med `azd up` och validera infrastruktur fungerar | 30 min |
| **3. Nedbrytning** | Förstå struktur | Använd GitHub Copilot för att utforska mallarkitektur, Bicep-filer och kodorganisation | 30 min |
| **4. Konfiguration** | djupdykning i azure.yaml | Bemästra `azure.yaml` konfiguration, livscykelhakar och miljövariabler | 30 min |
| **5. Anpassning** | Gör den din egen | Aktivera AI-sökning, spårning, utvärdering och anpassa för ditt scenario | 45 min |
| **6. Nedmontering** | Rensa upp | Säkert avveckla resurser med `azd down --purge` | 15 min |
| **7. Avslutning** | Nästa steg | Granska prestationer, nyckelbegrepp och fortsätt din läranderesa | 15 min |

**Workshopflöde:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kom igång med workshopen
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshopens lärandemål
Genom att genomföra workshopen kommer deltagarna att:
- **Distribuera AI-applikationer i produktion**: Använda AZD med Microsoft Foundry-tjänster
- **Bemästra multi-agent-arkitekturer**: Implementera koordinerade AI-agentlösningar
- **Implementera säkerhetsbästa praxis**: Konfigurera autentisering och åtkomstkontroll
- **Optimera för skala**: Designa kostnadseffektiva och högpresterande distributioner
- **Felsöka distributioner**: Självständigt lösa vanliga problem

#### 📖 Workshopresurser
- **🎥 Interaktiv guide**: [Workshopmaterial](workshop/README.md) - Webbläsarbaserad inlärningsmiljö
- **📋 Modul-för-modul-instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshopöversikt och mål
  - [1. Urval](workshop/docs/instructions/1-Select-AI-Template.md) - Hitta och välj AI-mallar
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuera och verifiera mallar
  - [3. Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforska mallarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Bemästra azure.yaml
  - [5. Anpassning](workshop/docs/instructions/5-Customize-AI-Template.md) - Anpassa för ditt scenario
  - [6. Nedmontering](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rensa upp resurser
  - [7. Avslutning](workshop/docs/instructions/7-Wrap-up.md) - Granska och nästa steg
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserade övningar
- **💡 Snabbstart**: [Workshopuppsättningsguide](workshop/README.md#quick-start) - Miljökonfiguration

**Perfekt för**: Företagsträning, universitetskurser, självstudier och utvecklarbootcamps.

---

## 📖 Djupdykning: AZD-funktioner

Utöver grunderna erbjuder AZD kraftfulla funktioner för produktionsdistributioner:

- **Mallbaserade distributioner** - Använd färdiga mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Sömlöst provisionera, distribuera och övervaka applikationer
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och upplevelse

### **AZD + Microsoft Foundry: Perfekt för AI-distributioner**

**Varför AZD för AI-lösningar?** AZD tar itu med de största utmaningarna AI-utvecklare står inför:

- **AI-redo mallar** - Förkonfigurerade mallar för Microsoft Foundry-modeller, Azure AI-tjänster och ML-arbetsbelastningar
- **Säkra AI-distributioner** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modelendpunkter  
- **Produktionsmönster för AI** - Bästa praxis för skalbara, kostnadseffektiva AI-applikationsdistributioner
- **End-to-End AI-arbetsflöden** - Från modellutveckling till produktionsdistribution med korrekt övervakning
- **Kostnadsoptimering** - Smart resursallokering och skalningsstrategier för AI-arbetsbelastningar
- **Microsoft Foundry-integration** - Sömlös anslutning till Microsoft Foundry modellkatalog och endpunkter

---

## 🎯 Mallar & Exempelsamling

### Utvalda: Microsoft Foundry-mallar
**Börja här om du distribuerar AI-applikationer!**

> **Notera:** Dessa mallar visar olika AI-mönster. Vissa är externa Azure Samples, andra är lokala implementationer.

| Mall | Kapitel | Komplexitet | Tjänster | Typ |
|----------|---------|------------|----------|------|
| [**Kom igång med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Kom igång med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Snabbstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalda: Kompletta inlärningsscenarier
**Produktionsfärdiga applikationsmallar kopplade till lärandekapitel**

| Mall | Lärandekapitel | Komplexitet | Nyckellärande |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-distributionsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementation med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligensintegration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och funktionsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Företags-AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent-arkitektur med Kund- och Lageragenter |

### Inlärning efter exempeltyp

> **📌 Lokala vs. Externa exempel:**  
> **Lokala exempel** (i detta repo) = Klara att använda omedelbart  
> **Externa exempel** (Azure Samples) = Klona från länkade repos

#### Lokala exempel (klara att använda)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produktionsfärdig implementation med ARM-mallar
  - Multi-agent-arkitektur (Kund + Lageragenter)
  - Omfattande övervakning och utvärdering
  - Enkel distribution med ARM-mall

#### Lokala exempel - Container-applikationer (Kapitel 2-5)
**Omfattande exempel på container-distributioner i detta repository:**
- [**Container App-exempel**](examples/container-app/README.md) - Komplett guide till containeriserade distributioner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grundläggande REST API med scale-to-zero
  - [Microservices-arkitektur](../../examples/container-app/microservices) - Produktionsfärdig multi-service-distribution
  - Snabbstart, produktion och avancerade distributionsmönster
  - Riktlinjer för övervakning, säkerhet och kostnadsoptimering

#### Externa exempel - Enkla applikationer (Kapitel 1-2)
**Klona dessa Azure Samples-repos för att komma igång:**
- [Enkel Webbapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundläggande distributionsmönster
- [Statisk Webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribution av statiskt innehåll
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-distribution

#### Externa exempel - Databasintegration (Kapitel 3-4)  
- [Databasapp - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaskopplingsmönster
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverlös dataarbetsflöde

#### Externa exempel - Avancerade mönster (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrundsprocesser  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsfärdiga ML-mönster

### Externa mallkollektioner
- [**Officiell AZD Mallgalleri**](https://azure.github.io/awesome-azd/) - Kurerad samling av officiella och community-mallar
- [**Azure Developer CLI Mallar**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mall-dokumentation
- [**Exempelkatalog**](examples/README.md) - Lokala inlärningsexempel med detaljerade förklaringar

---

## 📚 Lärresurser & Referenser

### Snabbreferenser
- [**Kommandosnyggblad**](resources/cheat-sheet.md) - Viktiga azd-kommandon organiserade efter kapitel
- [**Ordlista**](resources/glossary.md) - Azure- och azd-terminologi  
- [**Vanliga frågor**](resources/faq.md) - Vanliga frågor organiserade efter lärandekapitel
- [**Studieguide**](resources/study-guide.md) - Omfattande övningar

### Praktiska workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-distribuerbara (2-3 timmar)
- [**Interaktiv workshop**](workshop/README.md) - Guidade övningar i 8 moduler med MkDocs och GitHub Codespaces
  - Följande: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Avslut → Sammanfattning

### Externa lärresurser
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Priskalkylator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-agents färdigheter för din redigerare
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 öppna agentfärdigheter för Azure AI, Foundry, distribution, diagnostik, kostnadsoptimering och mer. Installera dem i GitHub Copilot, Cursor, Claude Code eller någon stödjande agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snabb felsökningsguide

**Vanliga problem nybörjare stöter på och omedelbara lösningar:**

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

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
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI-provisionering är långsam)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

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
<summary><strong>❌ Can't find deployed application URL</strong></summary>

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

### 📚 Fullständiga felsökningsresurser

- **Vanliga problem-guide:** [Detaljerade lösningar](docs/chapter-07-troubleshooting/common-issues.md)
- **Specifika AI-problem:** [AI-felsökning](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Felsökningsguide:** [Steg-för-steg felsökning](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursavslutning och certifiering

### Framstegsspårning
Följ din inlärningsprogress genom varje kapitel:

- [ ] **Kapitel 1**: Grundläggande och snabbstart ✅
- [ ] **Kapitel 2**: AI-först utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration och autentisering ✅
- [ ] **Kapitel 4**: Infrastruktur som kod & Distribution ✅
- [ ] **Kapitel 5**: Multi-agent AI-lösningar ✅
- [ ] **Kapitel 6**: Validering & planering före distribution ✅
- [ ] **Kapitel 7**: Felsökning & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & företagsmönster ✅

### Lärandebekräftelse
Efter att ha slutfört varje kapitel, verifiera din kunskap genom att:
1. **Praktisk övning**: Slutför kapitelets praktiska distribution
2. **Kunskapskontroll**: Granska FAQ-sektionen för ditt kapitel
3. **Gemenskapsdiskussion**: Dela din erfarenhet i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa komplexitetsnivå

### Fördelar med kursavslutning
Efter att ha slutfört alla kapitel kommer du att ha:
- **Produktionserfarenhet**: Distribuerade verkliga AI-applikationer till Azure
- **Professionella färdigheter**: Distribution för företagsmiljö  
- **Gemenskapsigenkännande**: Aktiv medlem av Azure-utvecklargemenskapen
- **Karriärutveckling**: Eftertraktad AZD- och AI-distributionskompetens

---

## 🤝 Gemenskap & Support

### Få hjälp & support
- **Tekniska problem**: [Rapportera buggar och begär funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Lärandefrågor**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) och [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjälp**: Gå med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiell Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Insikter från Microsoft Foundry Discord

**Senaste röstningsresultat från #Azure-kanalen:**
- **45%** av utvecklarna vill använda AZD för AI-arbetsbelastningar
- **Största utmaningar**: Multi-service distribution, hantering av autentiseringsuppgifter, produktionsberedskap  
- **Mest efterfrågade**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vår gemenskap för att:**
- Dela dina AZD + AI-upplevelser och få hjälp
- Få tidiga förhandsvisningar av nya AI-mallar
- Bidra till bästa praxis för AI-distribution
- Påverka framtida AI + AZD-funktionsutveckling

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- **Förbättring av innehåll**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att underhålla flerspråkigt stöd
- **Buggrapporter**: Förbättra noggrannhet och tydlighet
- **Gemenskapsregler**: Följ våra inkluderande riktlinjer för gemenskap

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen – se [LICENSE](../../LICENSE) för detaljer.

### Relaterade Microsoft-lärresurser

Vårt team producerar andra omfattande lärarkurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j för nybörjare](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js för nybörjare](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain för nybörjare](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD för nybörjare](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI för nybörjare](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP för nybörjare](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agenter för nybörjare](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI för nybörjare](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML för nybörjare](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science för nybörjare](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI för nybörjare](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersäkerhet för nybörjare](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webbutveckling för nybörjare](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT för nybörjare](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-utveckling för nybörjare](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot för AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot för C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära?**

**Nybörjare**: Börja med [Kapitel 1: Grundläggande & snabbstart](#-chapter-1-foundation--quick-start)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-först utveckling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration & autentisering](#️-chapter-3-configuration--authentication)

**Nästa steg**: [Börja Kapitel 1 - AZD-grunder](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->