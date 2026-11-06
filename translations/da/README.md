# AZD for begyndere: En struktureret læringsrejse

![AZD-for-beginners](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watcher](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske oversættelser (Altid opdaterede)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengalsk](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (traditionelt, Hong Kong)](../zh-HK/README.md) | [Kinesisk (traditionelt, Macau)](../zh-MO/README.md) | [Kinesisk (traditionelt, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malayisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Manipuri (Meitei Mayek)](../mni/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk Pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Foretrækker du at klone lokalt?**
>
> Dette repository inkluderer 50+ sprogoversættelser, hvilket øger downloadstørrelsen betydeligt. For at klone uden oversættelser, brug spars checkout:
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
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en langt hurtigere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Hvad er nyt i azd i dag

> 📌 Dette kursus er valideret mod **`azd 1.27.1`** (juli 2026). Kør `azd version` for at tjekke din build, og `azd upgrade` for at få den seneste version.

Azure Developer CLI er vokset ud over traditionelle webapps og API'er. I dag er azd det eneste værktøj til at deployere **enhver** applikation til Azure—inklusive AI-drevne applikationer og intelligente agenter.

Dette betyder følgende for dig:

- **AI-agenter er nu førstegangs azd workloads.** Du kan initialisere, deployere og administrere AI-agentprojekter ved hjælp af den samme `azd init` → `azd up` workflow, som du allerede kender.
- **En komplet agentlivscyklus fra CLI'en.** Udvidelsen `azure.ai.agents` dækker nu hele rejsen—`azd ai agent init` til at skabe skabeloner, `azd ai agent invoke` til test (med svartidsuddata), `azd ai agent eval generate` og `azd ai agent optimize` til at måle og forbedre kvalitet, og `azd ai agent delete` til oprydning.
- **Flere byggeklodser til AI.** Nye forhåndsvisningsudvidelser—`azure.ai.skills` og `azure.ai.connections`—lader dig administrere genanvendelige agentskills og Foundry-forbindelser direkte med azd.
- **Microsoft Foundry integration** bringer modeludrulning, agent-hosting og AI-servicekonfiguration direkte ind i azd's skabelonøkosystem.
- **Mere glidende hverdag.** For nylige udgivelser gjorde `azd init` idempotent (sikker at køre igen), gjorde `azd auth login` i stand til automatisk at rydde udløbne tokens op, og tilføjede en venlig `azd tool` opsætningsprompt ved første kørsel.
- **Kernearbejdsgangen er uændret.** Uanset om du udruller en to-do app, en mikrotjeneste eller en multi-agent AI-løsning, er kommandoerne de samme.

> **Note til Aspire-brugere:** Microsoft omtaler nu produktet simpelt som **Aspire** (tidligere ".NET Aspire"). azd's Aspire-understøttelse er uændret—kun navnet er opdateret.

Hvis du har brugt azd før, er AI-understøttelse en naturlig udvidelse—ikke et separat værktøj eller en avanceret spor. Hvis du starter nyt, lærer du én arbejdsgang, der virker til alt.

---

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det nemt at deployere applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer, kan du deployere hele applikationer med en enkelt kommando.

### Magien ved `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

**Det er det!** Ingen klik i Azure Portal, ingen komplekse ARM-skabeloner, du skal lære først, ingen manuel konfiguration – bare fungerende applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hvad er forskellen?

Dette er det mest almindelige spørgsmål, begyndere stiller. Her er det enkle svar:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Håndtering af individuelle Azure-ressourcer | Deployere komplette applikationer |
| **Tankegang** | Infrastruktur-fokuseret | Applikations-fokuseret |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Skal kende Azure-tjenester | Skal bare kende din app |
| **Bedst til** | DevOps, Infrastruktur | Udviklere, Prototyping |

### En simpel analogi

- **Azure CLI** er som at have alle værktøjerne til at bygge et hus – hammere, save, søm. Du kan bygge alt, men du skal kende byggeri.
- **Azure Developer CLI** er som at hyre en entreprenør – du beskriver, hvad du vil have, og de tager sig af byggeriet.

### Hvornår skal man bruge hvad

| Scenario | Brug dette |
|----------|----------|
| "Jeg vil hurtigt deployere min webapp" | `azd up` |
| "Jeg har brug for kun at oprette en lagringskonto" | `az storage account create` |
| "Jeg bygger en fuld AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jeg har brug for at fejlfinde en specifik Azure-ressource" | `az resource show` |
| "Jeg vil have produktionsklar implementering på få minutter" | `azd up --environment production` |

### De Arbejder Sammen!

AZD bruger Azure CLI under motorhjelmen. Du kan bruge begge dele:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find Skabeloner i Awesome AZD

Start ikke fra bunden! **Awesome AZD** er fællesskabets samling af klar-til-implementering skabeloner:

| Ressource | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Gennemse over 200 skabeloner med ét klik implementering |
| 🔗 [**Indsend en Skabelon**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til fællesskabet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Sæt stjerne og udforsk koden |

### Populære AI-skabeloner fra Awesome AZD

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom i gang i 3 trin

Før du går i gang, skal du sikre dig at din maskine er klar til den skabelon, du vil implementere:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis en nødvendig kontrol fejler, skal du rette det først og derefter fortsætte med hurtigstarten.

### Trin 1: Installer AZD (2 minutter)

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

### Trin 2: Autentificer for AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Hvis du er usikker på, hvilken du behøver, følg hele opsætningsflowet i [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Trin 3: Implementer din første app

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo

# Deploy to Azure (creates everything!)
azd up
```

**🎉 Sådan!** Din app er nu live på Azure.

### Ryd op (Glem ikke!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Sådan bruger du dette kursus

Dette kursus er designet til **progressiv læring** - start hvor du er tryg, og arbejd dig op:

| Din Erfaring | Start Her |
|-----------------|------------|
| **Helt ny til Azure** | [Kapitel 1: Grundlag](#-chapter-1-foundation--quick-start) |
| **Kender Azure, ny til AZD** | [Kapitel 1: Grundlag](#-chapter-1-foundation--quick-start) |
| **Vil implementere AI-apps** | [Kapitel 2: AI-første udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil have praktisk øvelse** | [🎓 Interaktiv Workshop](workshop/README.md) - 3-4 timers guidet lab |
| **Brug for produktionsmønstre** | [Kapitel 8: Produktion & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Hurtig opsætning

1. **Fork dette repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker du at klone lokalt?**

> Dette lager inkluderer 50+ sprogoversættelser, som betydeligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.


## Kursusoversigt

Mestre Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særlig fokus på AI-applikationsudrulning med Microsoft Foundry-integration.**

### Hvorfor dette kursus er essentielt for moderne udviklere

Baseret på Microsoft Foundry Discord-fællesskabets indsigt, ønsker **45% af udviklerne at bruge AZD til AI-arbejdsbelastninger** men støder på udfordringer med:
- Komplekse multi-service AI-arkitekturer
- Bedste praksis for produktion af AI-udrulning  
- Azure AI-tjeneste integration og konfiguration
- Omkostningsoptimering for AI-arbejdsbelastninger
- Fejlfinding af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Mestre AZD fundamentet**: Kernebegreber, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementer Infrastruktur som kode**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlfinding af implementeringer**: Løs almindelige problemer og fejlfind
- **Optimer til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Byg Multi-Agent-løsninger**: Udrul komplekse AI-arkitekturer

## Før du starter: Konti, adgang og forudsætninger

Før du begynder på kapitel 1, skal du sikre, at du har følgende på plads. Installationsvejledningen senere i denne guide antager, at disse grundlæggende ting allerede er håndteret.

- **Et Azure-abonnement**: Du kan bruge et eksisterende abonnement fra arbejde eller din egen konto, eller oprette en [gratis prøveperiode](https://aka.ms/azurefreetrial) for at komme i gang.
- **Tilladelse til at oprette Azure-ressourcer**: For de fleste øvelser bør du have mindst **Bidragyder**-adgang til det målrettede abonnement eller ressourcegruppe. Nogle kapitler kan også antage, at du kan oprette ressourcegrupper, administrerede identiteter og RBAC-tildelinger.
- [**En GitHub-konto**](https://github.com): Dette er nyttigt til at forke depotet, spore dine egne ændringer og bruge GitHub Codespaces til workshoppen.
- **Forudsætninger for template-runtime**: Nogle skabeloner kræver lokale værktøjer som Node.js, Python, Java eller Docker. Kør opsætningsvalidatoren før start, så du fanger manglende værktøjer tidligt.
- **Grundlæggende kendskab til terminal**: Du behøver ikke at være ekspert, men du bør være komfortabel med at køre kommandoer som `git clone`, `azd auth login`, og `azd up`.

> **Arbejder du i et virksomhedsabonnement?**
> Hvis dit Azure-miljø administreres af en administrator, skal du på forhånd bekræfte, at du kan udrulle ressourcer i det abonnement eller den ressourcegruppe, du planlægger at bruge. Hvis ikke, bed om et sandbox-abonnement eller Bidragyder-adgang før du starter.

> **Ny til Azure?**
> Start med din egen Azure-prøveperiode eller et betal-når-du-bruger-abonnement på https://aka.ms/azurefreetrial, så du kan gennemføre øvelserne fra start til slut uden at vente på lejerniveau-godkendelser.

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Hvert kapitel har en dedikeret README med læringsmål, hurtigstart og øvelser:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Fundament](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Første projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-udvikling](docs/chapter-02-ai-development/README.md)** | AI-Første apps | [Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modeludrulning](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Auth & Sikkerhed | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sikkerhed](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Udrulning | [Udrulningsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 t | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent-løsninger | [Detailhandelsscenario](examples/retail-scenario.md) &#124; [Koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Kap 6: Før Udrulning](docs/chapter-06-pre-deployment/README.md)** | Planlægning & Validering | [Preflight Tjek](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-udvælgelse](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Kap 7: Fejlfinding](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 t | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Enterprise-mønstre | [Produktionspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk laboratorium | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedtagning](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afrunding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Samlet Kursusvarighed:** ~10-14 timer | **Færdighedsudvikling:** Begynder → Produktionsklar

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Kapitel 1: Fundament & Hurtigstart
**Forudsætninger**: Azure-abonnement, grundlæggende kommando linje-viden  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Det vil du lære
- Forstå grundlaget for Azure Developer CLI
- Installation af AZD på din platform
- Din første succesfulde udrulning

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) - Kernemæssige koncepter og terminologi
- **⚙️ Opsætning**: [Installation & Opsætning](docs/chapter-01-foundation/installation.md) - Platformspecifikke vejledninger
- **🛠️ Hands-On**: [Dit første projekt](docs/chapter-01-foundation/first-project.md) - Trin-for-trin vejledning
- **📋 Hurtig reference**: [Kommando snydeark](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Succesfuldt udrulle en simpel webapplikation til Azure med AZD

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

**📊 Tidsinvestering:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan udrulle basale applikationer selvstændigt
**📈 Færdighedsniveau efter:** Kan udrulle basale applikationer selvstændigt

---

### 🤖 Kapitel 2: AI-Første udvikling (Anbefales til AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Det vil du lære
- Microsoft Foundry-integration med AZD
- Udrulning af AI-drevne applikationer
- Forstå AI-servicernes konfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agent Guide](docs/chapter-02-ai-development/agents.md) - Udrul intelligente agenter med AZD
- **📖 Mønstre**: [AI Modeludrulning](docs/chapter-02-ai-development/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klar
- **🎥 Interaktiv guide**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læring med MkDocs * DevContainer-miljø
- **📋 Skabeloner**: [Microsoft Foundry Skabeloner](#featured-microsoft-foundry-templates)
- **📝 Eksempler**: [AZD Udrulningseksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktioner

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

**📊 Tidsinvestering:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå udviklingsomkostninger på $80-150/måned, produktionsomkostninger på $300-3500/måned

#### 💰 Omkostningshensyn ved AI-udrulninger

**Udviklingsmiljø (estimeret $80-150/måned):**
- Microsoft Foundry Modeller (Betal efter forbrug): $0-50/måned (baseret på token-forbrug)
- AI Search (Basic niveau): $75/måned
- Container Apps (Consumption): $0-20/måned
- Lager (Standard): $1-5/måned

**Produktionsmiljø (estimeret $300-3.500+/måned):**
- Microsoft Foundry Modeller (PTU for konsistent ydeevne): $3.000+/måned ELLER Betal efter forbrug med højt volumenniveau
- AI Search (Standard niveau): $250/måned
- Container Apps (Dedicated): $50-100/måned
- Application Insights: $5-50/måned
- Lager (Premium): $10-50/måned

**💡 Tips til omkostningsoptimering:**
- Brug **Gratis niveau** Microsoft Foundry-modeller til læring (Azure OpenAI 50.000 tokens/måned inkluderet)
- Kør `azd down` for at afallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` til at estimere omkostninger før udrulning
- Aktivér autoskalering: betal kun for faktisk brug

**Omkostningsovervågning:**
```bash
# Check estimated monthly costs
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentificering
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Det vil du lære
- Konfiguration og styring af miljøer
- Autentificering og bedste sikkerhedspraksis
- Ressourcenavngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Konfigurationsvejledning](docs/chapter-03-configuration/configuration.md) - Opsætning af miljø
- **🔐 Sikkerhed**: [Autentificeringsmønstre og administreret identitet](docs/chapter-03-configuration/authsecurity.md) - Autentificeringsmønstre
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (udvikling, staging, produktion)
- Opsæt autentificering med administreret identitet
- Implementer miljøspecifikke konfigurationer

**💡 Kapitelresultat**: Håndtér flere miljøer med korrekt autentificering og sikkerhed

---

### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
**Forudsætninger**: Kapitler 1-3 gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Det vil du lære
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressourceprovisionering

#### Læringsressourcer
- **📖 Udrulning**: [Udrulningsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Komplette workflows
- **🏗️ Provisionering**: [Provisionering af ressourcer](docs/chapter-04-infrastructure/provisioning.md) - Azure-ressourcestyring
- **📝 Eksempler**: [Containerapp-eksempel](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret tilpassede Bicep-skabeloner
- Udrul multi-service applikationer
- Implementer blue-green udrulningsstrategier

**💡 Kapitelresultat**: Udrul komplekse multi-service applikationer ved hjælp af brugerdefinerede infrastrukturskabeloner

---

### 🎯 Kapitel 5: Multi-Agent AI-løsninger (Avanceret)
**Forudsætninger**: Kapitler 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Det vil du lære
- Arkitekturmønstre for multi-agent
- Agent orchestration og koordinering
- Produktionsklare AI-udrulninger

#### Læringsressourcer
- **🤖 Udvalgt projekt**: [Detailhandel Multi-Agent-løsning](examples/retail-scenario.md) - Fuld implementering
- **🛠️ ARM-skabeloner**: [ARM Template-pakke](../../examples/retail-multiagent-arm-template) - Én-knaps udrulning
- **📖 Arkitektur**: [Multi-agent-koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Udrul og administrer en produktionsklar multi-agent AI-løsning med Kunde- og Lager-agenter

---

### 🔍 Kapitel 6: Præ-udrulningsvalidering & Planlægning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Det vil du lære
- Kapacitetsplanlægning og ressourcevalidering
- SKU-valgsstrategier
- Preflight-tjek og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Udvælgelse**: [SKU-udvælgelse](docs/chapter-06-pre-deployment/sku-selection.md) - Økonomiske valg
- **✅ Validering**: [Forhåndstjek](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør scripts til kapacitetsvalidering
- Optimer SKU-udvælgelse for omkostninger
- Implementer automatiserede forhåndstjek før implementering

**💡 Kapitelresultat**: Valider og optimer implementeringer før udførelse

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert implementeringskapitel gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske debugging-metoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging-guide](docs/chapter-07-troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-specifik fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-tjenesteproblemer

#### Praktiske øvelser
- Diagnostiser implementeringsfejl
- Løs autentificeringsproblemer
- Debug AI-tjenesteforbindelse

**💡 Kapitelresultat**: Selvstændigt diagnosticere og løse almindelige implementeringsproblemer

---

### 🏢 Kapitel 8: Produktions- & Enterprise-mønstre
**Forudsætninger**: Kapitlerne 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Produktionsimplementeringsstrategier
- Enterprise-sikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Bedste praksis for produktions-AI](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Mikrotjenester-eksempel](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Integration af Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementer enterprise-sikkerhedsmønstre
- Opsæt omfattende overvågning
- Implementer til produktion med korrekt styring

**💡 Kapitelresultat**: Implementer enterprise-klar applikationer med fulde produktionsfunktioner

---

## 🎓 Workshopoversigt: Praktisk læringserfaring

> **⚠️ WORKSHOP STATUS: Aktiv udvikling**  
> Workshopmaterialerne er under udvikling og forbedring. Kernemoduler fungerer, men nogle avancerede sektioner mangler stadig. Vi arbejder aktivt på at færdiggøre alt indhold. [Spor fremskridt →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende praktisk læring med browser-baserede værktøjer og guidede øvelser**

Vores workshopmaterialer tilbyder en struktureret, interaktiv læringsoplevelse, som supplerer det kapitelbaserede pensum ovenfor. Workshoppen er designet til både selvstyret læring og instruktørledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browser-baseret interface**: Fuld MkDocs-drevet workshop med søge-, kopierings- og tema-funktioner
- **GitHub Codespaces-integration**: Én-klik opsætning af udviklingsmiljø
- **Struktureret læringssti**: 8 modulers guidede øvelser (3-4 timer samlet)
- **Progressiv metode**: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Oprydning → Afslutning
- **Interaktivt DevContainer-miljø**: Forudkonfigurerede værktøjer og afhængigheder

#### 📚 Workshopmodulstruktur
Workshoppen følger en **8-moduls progressiv metode**, som tager dig fra opdagelse til implementeringsmestring:

| Modul | Emne | Hvad du skal gøre | Varighed |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshopoversigt | Forstå læringsmål, forudsætninger og workshopstruktur | 15 min |
| **1. Udvælgelse** | Skabelonopdagelse | Udforsk AZD-skabeloner og vælg den rette AI-skabelon til dit scenarie | 20 min |
| **2. Validering** | Implementer & Verificer | Implementer skabelonen med `azd up` og valider infrastrukturen virker | 30 min |
| **3. Nedbrydning** | Forstå struktur | Brug GitHub Copilot til at udforske skabelonarkitektur, Bicep-filer og kodeorganisation | 30 min |
| **4. Konfiguration** | azure.yaml-dybdegående | Mestring af `azure.yaml` konfiguration, livscykluskroge og miljøvariabler | 30 min |
| **5. Tilpasning** | Gør det til dit | Aktiver AI Search, sporing, evaluering, og tilpas til dit scenarie | 45 min |
| **6. Oprydning** | Ryd op | Sikker nedlukning af ressourcer med `azd down --purge` | 15 min |
| **7. Afslutning** | Næste skridt | Gennemgå præstationer, nøglebegreber og fortsæt din læringsrejse | 15 min |

**Workshopflow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kom godt i gang med workshoppen
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshop læringsudbytte
Ved at gennemføre workshoppen vil deltagerne:
- **Implementere AI-applikationer i produktion**: Brug AZD med Microsoft Foundry-tjenester
- **Mestre multi-agent-arkitekturer**: Implementer koordinerede AI-agent-løsninger
- **Implementere sikker bedste praksis**: Konfigurer autentificering og adgangskontrol
- **Optimere til skala**: Design omkostningseffektive, performant implementeringer
- **Fejlfinding af implementeringer**: Løs almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv guide**: [Workshopmaterialer](workshop/README.md) - Browser-baseret læringsmiljø
- **📋 Modul-for-modul instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshopoversigt og mål
  - [1. Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) - Find og vælg AI-skabeloner
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementer og verificer skabeloner
  - [3. Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Udforsk skabelonarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestring af azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpas til dit scenarie
  - [6. Oprydning](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ryd op i ressourcer
  - [7. Afslutning](workshop/docs/instructions/7-Wrap-up.md) - Gennemgang og næste skridt
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Hurtig start**: [Workshop opsætningsguide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstudium og udvikler-bootcamps.

---

## 📖 Dybdegående: AZD-funktioner

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsimplementeringer:

- **Skabelonbaserede implementeringer** - Brug forudbyggede skabeloner til almindelige applikationsmønstre
- **Infrastructure as Code** - Administrer Azure-ressourcer med Bicep eller Terraform  
- **Integrerede arbejdsflow** - Problemfri provisioning, implementering og overvågning af applikationer
- **Udviklervenlig** - Optimeret til udviklerproduktivitet og oplevelse

### **AZD + Microsoft Foundry: Perfekt til AI-implementeringer**

**Hvorfor AZD til AI-løsninger?** AZD adresserer de største udfordringer AI-udviklere møder:

- **AI-klar skabeloner** - Forudkonfigurerede skabeloner til Microsoft Foundry-modeller, Azure AI-tjenester og ML-arbejdsbelastninger
- **Sikre AI-implementeringer** - Indbyggede sikkerhedsmønstre for AI-tjenester, API-nøgler og modelendepunkter  
- **Produktions-AI-mønstre** - Bedste praksis for skalerbare, omkostningseffektive AI-applikationsimplementeringer
- **End-to-end AI-arbejdsflow** - Fra modeludvikling til produktionsimplementering med korrekt overvågning
- **Omkostningsoptimering** - Smarte ressourcetildelings- og skaleringsstrategier for AI-arbejdsbelastninger
- **Microsoft Foundry-integration** - Problemfri forbindelse til Microsoft Foundry-modelkatalog og endepunkter

---

## 🎯 Skabeloner & Eksempelsamling

### Fremhævet: Microsoft Foundry-skabeloner
**Start her, hvis du implementerer AI-applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure Samples, andre lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom godt i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom godt i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Hurtigstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævet: Komplette læringsscenarier
**Produktionsklare applikationsskabeloner kortlagt til læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI-implementeringsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligens-integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentframework og funktionskald |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent-arkitektur med Kunde- og Lageragenter |

### Læring efter eksempeltype

> **📌 Lokale vs. Eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Klon fra linkede repositories

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fuldt produktionsklar implementering med ARM-skabeloner
  - Multi-agent-arkitektur (Kunde + Lageragenter)
  - Omfattende overvågning og evaluering
  - Én-klik implementering via ARM-skabelon

#### Lokale eksempler - Containerapplikationer (Kapitel 2-5)
**Omfattende containerimplementeringseksempler i dette repository:**
- [**Container App-eksempler**](examples/container-app/README.md) - Fuld guide til containeriserede implementeringer
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Grundlæggende REST API med scale-to-zero
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service implementering
  - Hurtigstart, produktion og avancerede implementeringsmønstre
  - Overvågning, sikkerhed og omkostningsoptimeringsvejledning

#### Eksterne eksempler - Simple applikationer (Kapitel 1-2)
**Klon disse Azure Samples repositories for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende implementeringsmønstre
- [Statisk websted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementering af statisk indhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-implementering

#### Eksterne eksempler - Databaseintegration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelsesmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs dataarbejdsgang

#### Eksterne eksempler - Avancerede mønstre (Kapitel 4-8)
- [Java mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelonsamlinger
- [**Officiel AZD Skabelongalleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI Skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige Referencer
- [**Kommando Hurtig Guide**](resources/cheat-sheet.md) - Vigtige azd-kommandoer organiseret efter kapitel
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende praktiske øvelser

### Praktiske Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-udrulningsklare (2-3 timer)
- [**Interaktiv Workshop**](workshop/README.md) - 8-moduls vejledte øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Opsummering

### Eksterne Læringsressourcer
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitektur Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agentfærdigheder til Din Editor
- [**Microsoft Azure Skills på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åbne agentfærdigheder til Azure AI, Foundry, implementering, diagnostik, omkostningsoptimering og mere. Installer dem i GitHub Copilot, Cursor, Claude Code eller enhver understøttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hurtig Fejlfinding Guide

**Almindelige problemer nybegyndere støder på og øjeblikkelige løsninger:**

<details>
<summary><strong>❌ "azd: kommando ikke fundet"</strong></summary>

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
<summary><strong>❌ "Ingen abonnement fundet" eller "Abonnement ikke sat"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" eller "Kvota overskredet"</strong></summary>

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
<summary><strong>❌ "azd up" fejler midt i processen</strong></summary>

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
<summary><strong>❌ "Autentificering mislykkedes" eller "Token udløbet"</strong></summary>

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
<summary><strong>❌ "Ressource findes allerede" eller navnekonflikter</strong></summary>

```bash
# AZD generates unique names, but if conflict:
azd down --force --purge

# Then retry with fresh environment
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Skabelonudrulning tager for lang tid</strong></summary>

**Normale ventetider:**
- Simpel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikationer: 15-25 minutter (OpenAI-provisionering er langsom)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Tilladelse nægtet" eller "Forbudt"</strong></summary>

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
<summary><strong>❌ Kan ikke finde URL til udrullet applikation</strong></summary>

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

### 📚 Fuld Fejlfinding Ressourcer

- **Almindelige Problemer Guide:** [Detaljerede løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-Specifikke Problemer:** [AI Fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Trin-for-trin Fejlfinding](docs/chapter-07-troubleshooting/debugging.md)
- **Få Hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursus Fuldførelse & Certificering

### Fremskridtssporing
Følg din læringsprogression gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtig Start ✅
- [ ] **Kapitel 2**: AI-Første Udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentificering ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-Agent AI-løsninger ✅
- [ ] **Kapitel 6**: Præ-udrulningsvalidering & Planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Debugging ✅
- [ ] **Kapitel 8**: Produktion & Enterprise Mønstre ✅

### Læringsverifikation
Efter at have fuldført hvert kapitel, verificer din viden ved:
1. **Praktisk Øvelse**: Fuldfør kapitlets praktiske udrulning
2. **Videnstest**: Gennemgå FAQ-sektionen for dit kapitel
3. **Community Diskussion**: Del din erfaring i Azure Discord
4. **Næste Kapitel**: Gå videre til næste komplekstitet

### Fordele ved Kursus Fuldførelse
Når du har gennemført alle kapitler, vil du have:
- **Produktionserfaring**: Udrullet reelle AI-applikationer til Azure
- **Professionelle Færdigheder**: Enterprise-klare udrulningsevner  
- **Community Anerkendelse**: Aktivt medlem af Azure udviklerfællesskabet
- **Karrierefremskridt**: Efterspurgt AZD og AI-udrulningsekspertise

---

## 🤝 Fællesskab & Support

### Få Hjælp & Support
- **Tekniske Problemer**: [Rapporter fejl og foreslå funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørgsmål**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-Specifik Hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Microsoft Foundry Discord

**Seneste afstemningsresultater fra #Azure-kanalen:**
- **45%** af udviklere vil bruge AZD til AI workloads
- **Topudfordringer**: Multi-service udrulninger, legitimationsstyring, produktionsparathed  
- **Mest ønskede**: AI-specifikke skabeloner, fejlfinding guides, bedste praksis

**Deltag i vores fællesskab for at:**
- Dele dine AZD + AI erfaringer og få hjælp
- Få adgang til tidlige forhåndsvisninger af nye AI-skabeloner
- Bidrage til AI-udrulnings bedste praksis
- Påvirke fremtidig AI + AZD funktionalitetsudvikling

### Bidrag til Kurset
Vi byder bidrag velkommen! Læs venligst vores [Bidragsguide](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedre eksisterende kapitler og eksempler
- **Nye Eksempler**: Tilføj virkelige scenarier og skabeloner  
- **Oversættelse**: Hjælp med at vedligeholde flersproget support
- **Fejlrapporter**: Forbedr nøjagtighed og klarhed
- **Fællesskabsstandarder**: Følg vores inkluderende fællesskabsretningslinjer

---

## 📄 Kursusinformation

### Licens
Dette projekt er licenseret under MIT-licensen - se [LICENSE](../../LICENSE) filen for detaljer.

### Relaterede Microsoft-læringsressourcer

Vores team producerer andre omfattende læringskurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Beginners](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Beginners](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Beginners](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD for Beginners](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Beginners](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Beginners](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for Beginners](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI Serie
[![Generativ AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kerne Læring
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersikkerhed for Begyndere](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webudvikling for Begyndere](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Begyndere](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-udvikling for Begyndere](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serie
[![Copilot for AI Parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Eventyr](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde læring?**

**Nybegyndere**: Start med [Kapitel 1: Grundlag & Hurtig Start](#-chapter-1-foundation--quick-start)  
**AI Udviklere**: Spring til [Kapitel 2: AI-Første Udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne Udviklere**: Begynd med [Kapitel 3: Konfiguration & Autentificering](#️-chapter-3-configuration--authentication)

**Næste Skridt**: [Begynd Kapitel 1 - AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->