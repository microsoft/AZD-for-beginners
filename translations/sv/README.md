# AZD för nybörjare: En strukturerad läranderesa

![AZD-for-beginners](../../translated_images/sv/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiserade översättningar (alltid uppdaterade)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](./README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Föredrar du att klona lokalt?**
>
> Detta arkiv inkluderar över 50 språköversättningar vilket avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparsamt utcheckning:
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

> 📌 Denna kurs är validerad mot **`azd 1.27.1`** (juli 2026). Kör `azd version` för att kontrollera din version och `azd upgrade` för att få den senaste.

Azure Developer CLI har vuxit bortom traditionella webbappar och API:er. Idag är azd det enda verktyget för att distribuera **vilken som helst** applikation till Azure—including AI-driven programvara och intelligenta agenter.

Här är vad det innebär för dig:

- **AI-agenter är nu förstklassiga azd-arbetsbelastningar.** Du kan initiera, distribuera och hantera AI-agentprojekt med samma `azd init` → `azd up` arbetsflöde du redan kan.
- **En komplett agentlivscykel från CLI.** `azure.ai.agents`-tillägget täcker hela resan—`azd ai agent init` för att sätta upp, `azd ai agent invoke` för att testa (med svarstid-output), `azd ai agent eval generate` och `azd ai agent optimize` för att mäta och förbättra kvaliteten, samt `azd ai agent delete` för att städa upp.
- **Fler AI-byggstenar.** Nya förhandsversionstillägg—`azure.ai.skills` och `azure.ai.connections`—låter dig hantera återanvändbara agentfärdigheter och Foundry-anslutningar direkt med azd.
- **Microsoft Foundry-integrationen** ger modellutplacering, agenthosting och AI-tjänstekonfiguration direkt i azd-mallens ekosystem.
- **Smidigare vardagsfunktioner.** Nyligen släppta versioner gjorde `azd init` idempotent (säker att köra flera gånger), gjorde så `azd auth login` automatiskt rensar gamla tokens och lade till en vänlig `azd tool` första-kör-setup.
- **Kärn-arbetsflödet är oförändrat.** Oavsett om du distribuerar en todo-app, en mikrotjänst eller en multi-agent AI-lösning, är kommandona desamma.

> **Notering för Aspire-användare:** Microsoft kallar nu produkten helt enkelt **Aspire** (tidigare ".NET Aspire"). azd:s stöd för Aspire är oförändrat – bara namnet har uppdaterats.

Om du har använt azd tidigare är AI-stödet en naturlig förlängning – inte ett separat verktyg eller en avancerad spår. Om du börjar från början kommer du att lära dig ett arbetsflöde som funkar för allt.

---

## 🚀 Vad är Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** är ett utvecklarvänligt kommandoradsverktyg som gör det enkelt att distribuera applikationer till Azure. Istället för att manuellt skapa och koppla ihop dussintals Azure-resurser kan du distribuera hela applikationer med ett enda kommando.

### Magin med `azd up`

```bash
# Detta enda kommando gör allt:
# ✅ Skapar alla Azure-resurser
# ✅ Konfigurerar nätverk och säkerhet
# ✅ Kompilerar din applikationskod
# ✅ Distribuerar till Azure
# ✅ Ger dig en fungerande URL
azd up
```

**Det är allt!** Ingen Azure Portal-klickning, inga komplexa ARM-mallar att lära sig först, ingen manuell konfigurering – bara fungerande applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Vad är skillnaden?

Det här är den vanligaste frågan nybörjare ställer. Här är det enkla svaret:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Syfte** | Hantera enskilda Azure-resurser | Distribuera kompletta applikationer |
| **Tankesätt** | Infrastrukturfokuserad | Applikationsfokuserad |
| **Exempel** | `az webapp create --name myapp...` | `azd up` |
| **Inlärningskurva** | Måste kunna Azure-tjänster | Behöver bara kunna din app |
| **Bäst för** | DevOps, Infrastruktur | Utvecklare, prototyping |

### En enkel liknelse

- **Azure CLI** är som att ha alla verktyg för att bygga ett hus — hammare, sågar, spik. Du kan bygga vad som helst, men du måste kunna byggnadskonsten.
- **Azure Developer CLI** är som att anlita en entreprenör — du beskriver vad du vill ha och de tar hand om bygget.

### När man ska använda vad

| Scenario | Använd detta |
|----------|-------------|
| "Jag vill snabbt distribuera min webbapp" | `azd up` |
| "Jag behöver bara skapa ett lagringskonto" | `az storage account create` |
| "Jag bygger en komplett AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jag behöver felsöka en specifik Azure-resurs" | `az resource show` |
| "Jag vill ha produktionsfärdig distribution på några minuter" | `azd up --environment production` |

### De fungerar tillsammans!

AZD använder Azure CLI under ytan. Du kan använda båda:
```bash
# Distribuera din app med AZD
azd up

# Finjustera sedan specifika resurser med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Hitta mallar i Awesome AZD

Börja inte från början! **Awesome AZD** är communityns samling av färdiga mallar för distribution:

| Resurs | Beskrivning |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Bläddra bland 200+ mallar med en-klikks-distribution |
| 🔗 [**Skicka in en mall**](https://github.com/Azure/awesome-azd/issues) | Bidra med din egen mall till communityn |
| 🔗 [**GitHub-repo**](https://github.com/Azure/awesome-azd) | Stjärnmärk och utforska källkoden |

### Populära AI-mallar från Awesome AZD

```bash
# RAG-chatt med Microsoft Foundry-modeller + AI-sökning
azd init --template azure-search-openai-demo

# Snabb AI-chattapplikation
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom igång i 3 steg

Innan du börjar, se till att din dator är redo för den mall du vill distribuera:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Om någon av kontrollerna misslyckas, fixa det först och fortsätt sedan med snabbstarten.

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
# Valfritt om du planerar att använda Azure CLI-kommandon direkt i denna kurs
az login

# Krävs för AZD-arbetsflöden
azd auth login
```

Om du är osäker på vilken du behöver, följ hela installationsflödet i [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Steg 3: Distribuera din första app

```bash
# Initiera från en mall
azd init --template todo-nodejs-mongo

# Distribuera till Azure (skapar allt!)
azd up
```

**🎉 Klart!** Din app är nu live på Azure.

### Rensa upp (glöm inte!)

```bash
# Ta bort alla resurser när experimenten är klara
azd down --force --purge
```

---

## 📚 Så här använder du denna kurs

Den här kursen är designad för **progressivt lärande** - börja där du känner dig bekväm och arbeta dig uppåt:

| Din erfarenhet | Börja här |
|-----------------|------------|
| **Helt ny till Azure** | [Kapitel 1: Grunderna](#-chapter-1-foundation--quick-start) |
| **Kan Azure, ny till AZD** | [Kapitel 1: Grunderna](#-chapter-1-foundation--quick-start) |
| **Vill distribuera AI-appar** | [Kapitel 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vill ha praktisk övning** | [🎓 Interaktiv Workshop](workshop/README.md) - 3-4 timmars guidad labb |
| **Behöver produktionsmönster** | [Kapitel 8: Produktion & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Snabb installation

1. **Forka detta repo**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjälp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Föredrar du att klona lokalt?**

> Detta arkiv inkluderar över 50 språköversättningar vilket avsevärt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparsamt utcheckning:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.


## Kursöversikt

Behärska Azure Developer CLI (azd) genom strukturerade kapitel designade för progressivt lärande. **Särskilt fokus på AI-applikationsdistribution med Microsoft Foundry-integration.**


### Varför denna kurs är viktig för moderna utvecklare

Baserat på insikter från Microsoft Foundry Discord-communityt vill **45 % av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:
- Komplexa AI-arkitekturer med flera tjänster
- Bästa praxis för produktion av AI-distributioner  
- Integration och konfiguration av Azure AI-tjänster
- Kostnadsoptimering för AI-arbetsbelastningar
- Felsökning av AI-specifika distributionsproblem

### Lärandemål

Genom att slutföra denna strukturerade kurs kommer du att:
- **Bemästra AZD-grunderna**: Kärnbegrepp, installation och konfiguration
- **Distribuera AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Implementera Infrastructure as Code**: Hantera Azure-resurser med Bicep-mallar
- **Felsöka distributioner**: Lösa vanliga problem och debugga fel
- **Optimera för produktion**: Säkerhet, skalning, övervakning och kostnadshantering
- **Bygga multi-agentlösningar**: Distribuera komplexa AI-arkitekturer

## Innan du börjar: Konton, åtkomst och förutsättningar

Innan du börjar Kapitel 1, se till att du har följande på plats. Installationsstegen senare i denna guide förutsätter att dessa grunder redan är hanterade.

- **Ett Azure-abonnemang**: Du kan använda ett befintligt abonnemang från jobbet eller ditt eget konto, eller skapa en [gratis testversion](https://aka.ms/azurefreetrial) för att komma igång.
- **Behörighet att skapa Azure-resurser**: För de flesta övningar bör du ha minst **Bidragsgivare**-åtkomst på målabonnemanget eller resursgruppen. Vissa kapitel kan även förutsätta att du kan skapa resursgrupper, hanterade identiteter och RBAC-tilldelningar.
- [**Ett GitHub-konto**](https://github.com): Detta är användbart för att forka repositoriet, spåra dina egna ändringar och använda GitHub Codespaces för workshopen.
- **Förutsättningar för mallens körning**: Vissa mallar kräver lokala verktyg som Node.js, Python, Java eller Docker. Kör setup-validatorn innan du börjar så att du upptäcker saknade verktyg i tid.
- **Grundläggande terminalvana**: Du behöver inte vara expert, men du bör vara bekväm med att köra kommandon som `git clone`, `azd auth login` och `azd up`.

> **Arbetar du i ett företagsabonnemang?**
> Om din Azure-miljö hanteras av en administratör, bekräfta i förväg att du kan distribuera resurser i det abonnemang eller den resursgrupp som du planerar att använda. Om inte, be om ett sandbox-abonnemang eller Bidragsgivare-åtkomst innan du börjar.

> **Ny på Azure?**
> Starta med din egen Azure-testversion eller betal-efter-hand abonnemang på https://aka.ms/azurefreetrial så att du kan slutföra övningarna från början till slut utan att vänta på godkännanden på tenant-nivå.

## 🗺️ Kurskarta: Snabb navigering per kapitel

Varje kapitel har en dedikerad README med lärandemål, snabba starter och övningar:

| Kapitel | Ämne | Lektioner | Varaktighet | Komplexitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Grundläggande](docs/chapter-01-foundation/README.md)** | Kom Igång | [AZD-grunder](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Första Projektet](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-utveckling](docs/chapter-02-ai-development/README.md)** | AI-Först Appar | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modell-Distribution](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 tim | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Autentisering & Säkerhet | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Autentisering & Säkerhet](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Distribution | [Distributionsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 tim | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agentlösningar | [Detaljhandelsscenario](examples/retail-scenario.md) &#124; [Koordinationsmönster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tim | ⭐⭐⭐⭐ |
| **[Kap 6: Fördistribution](docs/chapter-06-pre-deployment/README.md)** | Planering & Validering | [Preflight-Kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanering](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-val](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tim | ⭐⭐ |
| **[Kap 7: Felsökning](docs/chapter-07-troubleshooting/README.md)** | Debug & Lösning | [Vanliga problem](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debuggning](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problem](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 tim | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Företagsmönster | [Produktionspraxis](docs/chapter-08-production/production-ai-practices.md) | 2-3 tim | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Val](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedmontering](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Avslut](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tim | ⭐⭐ |

**Total kurslängd:** ~10-14 timmar | **Färdighetsprogression:** Nybörjare → Produktionsredo

---

## 📚 Lärandekapitlen

*Välj din lärandeväg baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grundläggande & Snabbstart
**Förutsättningar**: Azure-abonnemang, grundläggande kommandoradskunskaper  
**Varaktighet**: 30-45 minuter  
**Komplexitet**: ⭐

#### Vad du kommer att lära dig
- Förstå Azure Developer CLI-grunderna
- Installera AZD på din plattform
- Din första lyckade distribution

#### Läranderesurser
- **🎯 Börja här**: [Vad är Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD-grunder](docs/chapter-01-foundation/azd-basics.md) - Kärnbegrepp och terminologi
- **⚙️ Installation**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Plattformsspecifika guider
- **🛠️ Praktiskt**: [Ditt Första Projekt](docs/chapter-01-foundation/first-project.md) - Steg-för-steg handledning
- **📋 Snabbreferens**: [Kommandolathund](resources/cheat-sheet.md)

#### Praktiska övningar
```bash
# Snabb installationskontroll
azd version

# Distribuera din första applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Distribuera en enkel webbapplikation till Azure med AZD

**✅ Validering av framgång:**
```bash
# Efter att ha slutfört Kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projekt
azd up                  # Distribuerar till Azure
azd show                # Visar URL för appen som körs
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidåtgång:** 30-45 minuter  
**📈 Färdighetsnivå efter:** Kan distribuera grundläggande applikationer självständigt
**📈 Färdighetsnivå efter:** Kan distribuera grundläggande applikationer självständigt

---

### 🤖 Kapitel 2: AI-Först Utveckling (Rekommenderas för AI-utvecklare)
**Förutsättningar**: Kapitel 1 klart  
**Varaktighet**: 1-2 timmar  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Microsoft Foundry-integration med AZD
- Distribuera AI-drivna applikationer
- Förstå AI-tjänstekonfigurationer

#### Läranderesurser
- **🎯 Börja här**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI-agentguide](docs/chapter-02-ai-development/agents.md) - Distribuera intelligenta agenter med AZD
- **📖 Mönster**: [AI-modell-distribution](docs/chapter-02-ai-development/ai-model-deployment.md) - Distribuera och hantera AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar redo för AZD
- **🎥 Interaktiv guide**: [Workshop-material](workshop/README.md) - Webbläsarbaserat lärande med MkDocs * DevContainer-miljö
- **📋 Mallar**: [Microsoft Foundry-mallar](#workshopresurser)
- **📝 Exempel**: [AZD-distributionsexempel](examples/README.md)

#### Praktiska övningar
```bash
# Distribuera din första AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prova ytterligare AI-mallar
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

**✅ Validering av framgång:**
```bash
# Efter kapitel 2 bör du kunna:
azd init --template azure-search-openai-demo
azd up
# Testa AI-chattgränssnittet
# Ställa frågor och få AI-driven svar med källor
# Verifiera att sökintegration fungerar
azd monitor  # Kontrollera att Application Insights visar telemetri
azd down --force --purge
```

**📊 Tidåtgång:** 1-2 timmar  
**📈 Färdighetsnivå efter:** Kan distribuera och konfigurera produktionsfärdiga AI-applikationer  
**💰 Kostnadsmedvetenhet:** Förstå $80-150/månad i utvecklingskostnader, $300-3500/månad i produktionskostnader

#### 💰 Kostnadsöverväganden för AI-distributioner

**Utvecklingsmiljö (beräknat $80-150/månad):**
- Microsoft Foundry-modeller (betal-per-användning): $0-50/månad (baserat på token-användning)
- AI Search (Grundnivå): $75/månad
- Container Apps (Konsumtion): $0-20/månad
- Lagring (Standard): $1-5/månad

**Produktionsmiljö (beräknat $300-3,500+/månad):**
- Microsoft Foundry-modeller (PTU för konsekvent prestanda): $3,000+/månad ELLER Betal-per-användning med hög volym
- AI Search (Standardnivå): $250/månad
- Container Apps (Dedikerad): $50-100/månad
- Application Insights: $5-50/månad
- Lagring (Premium): $10-50/månad

**💡 Kostnadsoptimeringstips:**
- Använd **Gratisnivå** Microsoft Foundry-modeller för inlärning (Azure OpenAI 50 000 tokens/månad inkluderat)
- Kör `azd down` för att frigöra resurser när du inte aktivt utvecklar
- Börja med förbrukningsbaserad fakturering, uppgradera till PTU bara för produktion
- Använd `azd provision --preview` för att uppskatta kostnader före distribution
- Aktivera autoskalning: betala bara för faktisk användning

**Kostnadsövervakning:**
```bash
# Kontrollera uppskattade månadskostnader
azd provision --preview

# Övervaka faktiska kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentisering
**Förutsättningar**: Kapitel 1 klart  
**Varaktighet**: 45-60 minuter  
**Komplexitet**: ⭐⭐

#### Vad du kommer att lära dig
- Miljökonfiguration och hantering
- Autentisering och säkerhetsbästa praxis
- Namngivning och organisering av resurser

#### Läranderesurser
- **📖 Konfiguration**: [Konfigurationsguide](docs/chapter-03-configuration/configuration.md) - Miljöinställning
- **🔐 Säkerhet**: [Autentiseringsmönster och hanterad identitet](docs/chapter-03-configuration/authsecurity.md) - Autentiseringsmönster
- **📝 Exempel**: [Databasapp-exempel](examples/database-app/README.md) - AZD-databasexempel

#### Praktiska övningar
- Konfigurera flera miljöer (dev, staging, prod)
- Ställ in hanterad identitetsautentisering
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastructure as Code & Distribution
**Förutsättningar**: Kapitel 1-3 klara  
**Varaktighet**: 1-1.5 timmar  
**Komplexitet**: ⭐⭐⭐

#### Vad du kommer att lära dig
- Avancerade distributionsmönster
- Infrastructure as Code med Bicep
- Strategier för resursprovisionering

#### Läranderesurser
- **📖 Distribution**: [Distributionsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Kompletta arbetsflöden
- **🏗️ Provisionering**: [Provisionering av resurser](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurshantering
- **📝 Exempel**: [Container App-exempel](../../examples/container-app) - Containeriserade distributioner

#### Praktiska övningar
- Skapa anpassade Bicep-mallar
- Distribuera multi-tjänst-applikationer
- Implementera blue-green distributionstrategier

**💡 Kapitelresultat**: Distribuera komplexa multi-tjänst applikationer med hjälp av anpassade infrastrukturmallar

---


### 🎯 Kapitel 5: Multi-Agent AI-lösningar (Avancerat)
**Förkunskaper**: Kapitel 1-2 slutförda  
**Varaktighet**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Det du kommer lära dig
- Multi-agent arkitektur-mönster
- Agent-orkestrering och samordning
- Produktionsfärdiga AI-implementationer

#### Läromedel
- **🤖 Utvalt projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplett implementation
- **🛠️ ARM-mallar**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Enkel distribution
- **📖 Arkitektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mönster

#### Praktiska övningar
```bash
# Distribuera den kompletta detaljhandelslösningen med flera agenter
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforska agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Distribuera och hantera en produktionsklar multi-agent AI-lösning med kund- och lageragenter

---

### 🔍 Kapitel 6: Validering och planering före distribution
**Förkunskaper**: Kapitel 4 slutfört  
**Varaktighet**: 1 timme  
**Komplexitet**: ⭐⭐

#### Det du kommer lära dig
- Kapacitetsplanering och resursvalidering
- Strategier för val av SKU
- Pre-flight kontroller och automatisering

#### Läromedel
- **📊 Planering**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Val**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska övningar
- Kör skript för kapacitetsvalidering
- Optimera SKU-val för kostnad
- Implementera automatiserade kontroller före distribution

**💡 Kapitelresultat**: Validera och optimera distributioner före genomförande

---

### 🚨 Kapitel 7: Felsökning och debugging
**Förkunskaper**: Något distributionskapitel slutfört  
**Varaktighet**: 1-1,5 timmar  
**Komplexitet**: ⭐⭐

#### Det du kommer lära dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Läromedel
- **🔧 Vanliga problem**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Steg-för-steg-strategier
- **🤖 AI-problem**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problem med AI-tjänster

#### Praktiska övningar
- Diagnostisera distributionsfel
- Lös autentiseringsproblem
- Felsök AI-tjänstekonnektivitet

**💡 Kapitelresultat**: Självständigt diagnostisera och lösa vanliga distributionsproblem

---

### 🏢 Kapitel 8: Produktions- och företagsmönster
**Förkunskaper**: Kapitel 1-4 slutförda  
**Varaktighet**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Det du kommer lära dig
- Strategier för produktiondistribution
- Företags-säkerhetsmönster
- Övervakning och kostnadsoptimering

#### Läromedel
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Microservices Example](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Övervakning

#### Praktiska övningar
- Implementera företags-säkerhetsmönster
- Sätta upp heltäckande övervakning
- Distribuera till produktion med rätt styrning

**💡 Kapitelresultat**: Distribuera företagsfärdiga applikationer med full produktionkapacitet

---

## 🎓 Workshop-översikt: Praktisk lärandeupplevelse

> **⚠️ WORKSHOP-STATUS: Aktiv utveckling**  
> Workshopmaterialet är för närvarande under utveckling och förfining. Kärnmoduler fungerar, men några avancerade sektioner är ofullständiga. Vi arbetar aktivt för att slutföra allt innehåll. [Följ framstegen →](workshop/README.md)

### Interaktiva workshopmaterial
**Omfattande praktiskt lärande med webbläsarbaserade verktyg och guidade övningar**

Våra workshopmaterial erbjuder en strukturerad, interaktiv lärandeupplevelse som kompletterar kapitlen ovan. Workshopen är utformad för både självstudier och lärarledda sessioner.

#### 🛠️ Workshopfunktioner
- **Webbläsarbaserat gränssnitt**: Komplett MkDocs-driven workshop med sök-, kopierings- och temafunktioner
- **GitHub Codespaces-integration**: Enkel miljösetup med ett klick
- **Strukturerad lärandeväg**: 8-modulers guidade övningar (totalt 3-4 timmar)
- **Progressiv metodik**: Introduktion → Urval → Validering → Nedbrytning → Konfiguration → Anpassning → Avveckling → Sammanfattning
- **Interaktiv DevContainer-miljö**: Förkonfigurerade verktyg och beroenden

#### 📚 Workshop-modulstruktur
Workshopen följer en **8-modulers progressiv metodik** som tar dig från upptäckt till distributionsmästerskap:

| Modul | Ämne | Vad du gör | Varaktighet |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshop-översikt | Förstå lärandemål, förkunskaper och workshopstruktur | 15 min |
| **1. Urval** | Mallupptäckt | Utforska AZD-mallar och välj rätt AI-mall för ditt scenario | 20 min |
| **2. Validering** | Distribuera och verifiera | Distribuera mallen med `azd up` och validera infrastrukturen | 30 min |
| **3. Nedbrytning** | Förstå struktur | Använd GitHub Copilot för att utforska mall-arkitektur, Bicep-filer och kodorganisation | 30 min |
| **4. Konfiguration** | Fördjupning i azure.yaml | Bemästra `azure.yaml`-konfiguration, livscykelhakar och miljövariabler | 30 min |
| **5. Anpassning** | Anpassa | Aktivera AI-sökning, spårning, utvärdering och anpassa för ditt scenario | 45 min |
| **6. Avveckling** | Rensa upp | Säker avveckling av resurser med `azd down --purge` | 15 min |
| **7. Sammanfattning** | Nästa steg | Granska prestationer, viktiga begrepp och fortsätt din läranderesa | 15 min |

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
# Alternativ 1: GitHub Codespaces (Rekommenderas)
# Klicka på "Code" → "Create codespace on main" i repot

# Alternativ 2: Lokal utveckling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Följ installationsinstruktionerna i workshop/README.md
```

#### 🎯 Workshop-lärandemål
Genom att slutföra workshopen kommer deltagarna att:
- **Distribuera AI-applikationer i produktion**: Använd AZD med Microsoft Foundry-tjänster
- **Bemästra multi-agent-arkitekturer**: Implementera koordinerade AI-agentlösningar
- **Implementera säkerhetsbästa praxis**: Konfigurera autentisering och åtkomstkontroll
- **Optimera för skala**: Designa kostnadseffektiva, högpresterande distributioner
- **Felsöka distributioner**: Självständigt lösa vanliga problem

#### 📖 Workshopresurser
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Webbläsarbaserat lärmiljö
- **📋 Modul-för-modul instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshop-översikt och mål
  - [1. Urval](workshop/docs/instructions/1-Select-AI-Template.md) - Hitta och välj AI-mallar
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Distribuera och verifiera mallar
  - [3. Nedbrytning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Utforska mallarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Bemästra azure.yaml
  - [5. Anpassning](workshop/docs/instructions/5-Customize-AI-Template.md) - Anpassa för ditt scenario
  - [6. Avveckling](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Rensa upp resurser
  - [7. Sammanfattning](workshop/docs/instructions/7-Wrap-up.md) - Granskning och nästa steg
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserade övningar
- **💡 Snabbstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljökonfiguration

**Perfekt för**: Företagsträning, universitetskurser, självstudier och utvecklarbootcamps.

---

## 📖 Fördjupning: AZD-funktioner

Utöver grunderna erbjuder AZD kraftfulla funktioner för produktionsdistribution:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Sömlöst provisionera, distribuera och övervaka applikationer
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och användarupplevelse

### **AZD + Microsoft Foundry: Perfekt för AI-distributioner**

**Varför AZD för AI-lösningar?** AZD adresserar de största utmaningarna för AI-utvecklare:

- **AI-färdiga mallar** - Förkonfigurerade mallar för Microsoft Foundry-modeller, Azure AI-tjänster och ML-arbetslaster
- **Säkra AI-distributioner** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modeländpunkter  
- **Produktions AI-mönster** - Bästa praxis för skalbara, kostnadseffektiva AI-applikationsdistributioner
- **End-to-End AI-arbetsflöden** - Från modellutveckling till produktionsdistribution med korrekt övervakning
- **Kostnadsoptimering** - Smart resursallokering och skalningsstrategier för AI-arbetslaster
- **Microsoft Foundry-integrering** - Sömlös koppling till Microsoft Foundry-modellkatalog och ändpunkter

---

## 🎯 Mallar & Exempelbibliotek

### Utvalda: Microsoft Foundry-mallar
**Börja här om du distribuerar AI-applikationer!**

> **Obs:** Dessa mallar visar olika AI-mönster. Vissa är externa Azure Samples, andra är lokala implementationer.

| Mall | Kapitel | Komplexitet | Tjänster | Typ |
|----------|---------|------------|----------|------|
| [**Kom igång med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Kom igång med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalda: Kompletta lärandescenarier
**Produktionsfärdiga applikationsmallar kopplade till lärandekapitlen**

| Mall | Lärandekapitel | Komplexitet | Nyckellärande |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-distributionsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligensintegration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och funktionsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Företags AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med kund- och lageragenter |

### Lära sig via exempeltyp

> **📌 Lokala vs. externa exempel:**  
> **Lokala exempel** (i den här repot) = Klara att använda direkt  
> **Externa exempel** (Azure Samples) = Klona från länkade repositorier

#### Lokala exempel (klar att använda)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produktionsfärdig implementation med ARM-mallar
  - Multi-agent arkitektur (kund- och lageragenter)
  - Omfattande övervakning och utvärdering
  - Enkel distribution via ARM-mall

#### Lokala exempel - Container-applikationer (Kapitel 2-5)
**Omfattande exempel på containerdistribuering i det här arkivet:**

- [**Exempel på Containerappar**](examples/container-app/README.md) - Komplett guide för containeriserade driftsättningar
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grundläggande REST API med skalning till noll
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices) - Produktionsfärdig multi-service driftsättning
  - Snabbstart, produktion och avancerade driftsättningsmönster
  - Övervakning, säkerhet och vägledning för kostnadsoptimering

#### Externa exempel - Enkla applikationer (Kapitel 1-2)
**Klon dessa Azure Samples repositories för att komma igång:**
- [Enkel webbapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundläggande driftsättningsmönster
- [Statisk webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Driftsättning av statiskt innehåll
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Driftsättning av REST API

#### Externa exempel - Databasintegration (Kapitel 3-4)  
- [Databasapp - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaskopplingsmönster
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverlös dataflöde

#### Externa exempel - Avancerade mönster (Kapitel 4-8)
- [Java-mikrotjänster](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arkitekturer med flera tjänster
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsfärdiga ML-mönster

### Externa mall-samlingar
- [**Officiella AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuraterad samling av officiella och community-mallar
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mall-dokumentation
- [**Exempelkatalog**](examples/README.md) - Lokala lärandexempel med detaljerade förklaringar

---

## 📚 Läranderesurser & Referenser

### Snabbreferenser
- [**Kommandoschema**](resources/cheat-sheet.md) - Viktiga azd-kommandon organiserade efter kapitel
- [**Ordlista**](resources/glossary.md) - Azure- och azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanliga frågor organiserade efter lärandekapitel
- [**Studieguide**](resources/study-guide.md) - Omfattande övningar

### Praktiska workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-driftsättningsbara (2-3 timmar)
- [**Interaktiv Workshop**](workshop/README.md) - 8-moduls styrda övningar med MkDocs och GitHub Codespaces
  - Följ: Introduktion → Val → Validering → Dekonstruktion → Konfiguration → Anpassning → Avveckling → Avslutning

### Externa läranderesurser
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Priskalkylator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-agentfärdigheter för din editor
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 öppna agentfärdigheter för Azure AI, Foundry, driftsättning, diagnostik, kostnadsoptimering med mera. Installera dem i GitHub Copilot, Cursor, Claude Code eller vilken som helst stödd agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Snabb felsökningsguide

**Vanliga problem som nybörjare stöter på och omedelbara lösningar:**

<details>
<summary><strong>❌ "azd: kommando hittades inte"</strong></summary>

```bash
# Installera AZD först
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifiera installationen
azd version
```
</details>

<details>
<summary><strong>❌ "Ingen prenumeration hittades" eller "Prenumeration ej inställd"</strong></summary>

```bash
# Lista tillgängliga prenumerationer
az account list --output table

# Ställ in standardprenumeration
az account set --subscription "<subscription-id-or-name>"

# Ställ in för AZD-miljö
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiera
az account show
```
</details>

<details>
<summary><strong>❌ "Otillräcklig kvot" eller "Kvote överskriden"</strong></summary>

```bash
# Prova en annan Azure-region
azd env set AZURE_LOCATION "westus2"
azd up

# Eller använd mindre SKU:er i utveckling
# Redigera infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" misslyckas halvvägs</strong></summary>

```bash
# Alternativ 1: Rensa och försök igen
azd down --force --purge
azd up

# Alternativ 2: Åtgärda bara infrastrukturen
azd provision

# Alternativ 3: Kontrollera detaljerad status
azd show

# Alternativ 4: Kontrollera loggar i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentisering misslyckades" eller "Token har gått ut"</strong></summary>

```bash
# Autentisera om för AZD
azd auth logout
azd auth login

# Valfritt: uppdatera även Azure CLI om du kör az-kommandon
az logout
az login

# Verifiera autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Resursen finns redan" eller namngivningskonflikter</strong></summary>

```bash
# AZD genererar unika namn, men vid konflikt:
azd down --force --purge

# Försök igen med en ny miljö
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mall-driftsättning tar för lång tid</strong></summary>

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI-provisionering är långsam)

```bash
# Kontrollera framsteg
azd show

# Om fastnat >30 minuter, kontrollera Azure-portalen:
azd monitor --overview
# Leta efter misslyckade distributioner
```
</details>

<details>
<summary><strong>❌ "Behörighet nekad" eller "Förbjudet"</strong></summary>

```bash
# Kontrollera din Azure-roll
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du behöver åtminstone rollen "Medarbetare"
# Be din Azure-administratör att ge:
# - Medarbetare (för resurser)
# - Användaråtkomstadministratör (för rolltilldelningar)
```
</details>

<details>
<summary><strong>❌ Kan inte hitta URL för driftsatt applikation</strong></summary>

```bash
# Visa alla tjänstendpunkter
azd show

# Eller öppna Azure-portalen
azd monitor

# Kontrollera specifik tjänst
azd env get-values
# Leta efter *_URL-variabler
```
</details>

### 📚 Fullständiga felsökningsresurser

- **Guide för vanliga problem:** [Detaljerade lösningar](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifika problem:** [AI-felsökning](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-guide:** [Steg-för-steg felsökning](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursavslutning & Certifiering

### Framstegsspårning
Följ din lärandeprogress genom varje kapitel:

- [ ] **Kapitel 1**: Grund & Snabbstart ✅
- [ ] **Kapitel 2**: AI-först utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration & autentisering ✅
- [ ] **Kapitel 4**: Infrastruktur som kod & driftsättning ✅
- [ ] **Kapitel 5**: Multi-agent AI-lösningar ✅
- [ ] **Kapitel 6**: Fördriftsättningsvalidering & planering ✅
- [ ] **Kapitel 7**: Felsökning & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & företagsmönster ✅

### Verifiering av lärande
Efter att ha slutfört varje kapitel, verifiera din kunskap genom att:
1. **Praktisk övning**: Fullfölj kapitlets praktiska driftsättning
2. **Kunskapskontroll**: Granska FAQ-sektionen för ditt kapitel
3. **Communitydiskussion**: Dela dina erfarenheter i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa komplexitetsnivå

### Fördelar med kursavslutning
Efter att ha avslutat alla kapitel kommer du att ha:
- **Produktionsvana**: Driftsatt verkliga AI-applikationer till Azure
- **Professionella färdigheter**: Företagsfärdiga driftsättningsmöjligheter  
- **Gemenskapsigenkänning**: Aktiv medlem i Azure-utvecklargemenskapen
- **Karriärutveckling**: Efterfrågad AZD- och AI-driftsättningsexpertis

---

## 🤝 Gemenskap & Support

### Få hjälp & support
- **Tekniska problem**: [Rapportera buggar och begär funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Lärandefrågor**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) och [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjälp**: Gå med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiell Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Gemenskapsinsikter från Microsoft Foundry Discord

**Senaste undersökningsresultat från #Azure-kanalen:**
- **45%** av utvecklare vill använda AZD för AI-arbetslaster
- **Största utmaningarna**: Driftsättningar med flera tjänster, hantering av referenser, produktionsberedskap  
- **Mest efterfrågade**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vårt community för att:**
- Dela dina erfarenheter med AZD + AI och få hjälp
- Få tillgång till tidiga förhandsvisningar av nya AI-mallar
- Bidra till bästa praxis för AI-driftsättning
- Påverka framtida AI + AZD-funktionsutveckling

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- **Innehållsförbättringar**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att underhålla flerspråkigt stöd
- **Buggrapporter**: Öka noggrannhet och tydlighet
- **Gemenskapsstandarder**: Följ våra inkluderande community-riktlinjer

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen - se [LICENSE](../../LICENSE) filen för detaljer.

### Relaterade Microsoft-läranderesurser

Vårt team producerar andra omfattande lärandekurser:

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

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kärninlärning
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära dig?**

**Nybörjare**: Börja med [Kapitel 1: Grund & Snabbstart](#-chapter-1-foundation--quick-start)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-först utveckling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration & Autentisering](#️-chapter-3-configuration--authentication)

**Nästa steg**: [Börja Kapitel 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->