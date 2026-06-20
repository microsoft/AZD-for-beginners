# AZD For Beginners: A Structured Learning Journey

![AZD-for-begyndere](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub overvågninger](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stjerner](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske oversættelser (altid opdateret)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (traditionel, Hongkong)](../zh-HK/README.md) | [Kinesisk (traditionel, Macau)](../zh-MO/README.md) | [Kinesisk (traditionel, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malaysisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrækker du at klone lokalt?**
>
> Dette repository indeholder 50+ sprogoversættelser, hvilket i høj grad øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
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

> 📌 Dette kursus er valideret mod **`azd 1.25.6`** (juni 2026). Kør `azd version` for at tjekke din build, og `azd upgrade` for at få den seneste.

Azure Developer CLI har udviklet sig ud over traditionelle webapps og API'er. I dag er azd det eneste værktøj til at udrulle enhver applikation til Azure — inklusive AI-drevne applikationer og intelligente agenter.

Her er hvad det betyder for dig:

- **AI-agenter er nu førsteklasses azd-arbejdsbelastninger.** Du kan initialisere, udrulle og administrere AI-agentprojekter ved hjælp af det samme `azd init` → `azd up` workflow, du allerede kender.
- **En komplet agent-lifecycle fra CLI'en.** `azure.ai.agents`-udvidelsen dækker nu hele rejsen — `azd ai agent init` til at scafolde, `azd ai agent invoke` til at teste (med responstid-output), `azd ai agent eval generate` og `azd ai agent optimize` til at måle og forbedre kvalitet, og `azd ai agent delete` til oprydning.
- **Flere AI-byggesten.** Nye preview-udvidelser — `azure.ai.skills` og `azure.ai.connections` — lader dig administrere genanvendelige agentfærdigheder og Foundry-forbindelser direkte med azd.
- **Microsoft Foundry-integration** bringer modeludrulning, agent-hosting og AI-servicekonfiguration direkte ind i azd-skabelonøkosystemet.
- **Glattere dag-til-dag grundlæggende funktioner.** Seneste udgivelser gjorde `azd init` idempotent (sikkert at køre igen), fik `azd auth login` til automatisk at rydde forældede tokens, og tilføjede en venlig `azd tool` førstegangopsætningsprompt.
- **Kerne-workflowet er ikke ændret.** Uanset om du udruller en todo-app, en microservice eller en multi-agent AI-løsning, er kommandoerne de samme.

> **Note til Aspire-brugere:** Microsoft omtaler nu produktet enkelt som **Aspire** (tidligere ".NET Aspire"). azd's Aspire-understøttelse er uændret — kun navnet er opdateret.

Hvis du har brugt azd før, er AI-understøttelse en naturlig udvidelse — ikke et separat værktøj eller et avanceret spor. Hvis du starter nyt, lærer du ét workflow, der virker for alting.

---

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det enkelt at udrulle applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer, kan du udrulle hele applikationer med én enkelt kommando.

### Magien ved `azd up`

```bash
# Denne enkeltkommando gør alt:
# ✅ Opretter alle Azure-ressourcer
# ✅ Konfigurerer netværk og sikkerhed
# ✅ Bygger din applikationskode
# ✅ Udruller til Azure
# ✅ Giver dig en fungerende URL
azd up
```

**Det er det!** Ingen klik i Azure-portalen, ingen komplekse ARM-skabeloner du først skal lære, ingen manuel konfiguration - bare fungerende applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hvad er forskellen?

Dette er det mest almindelige spørgsmål begyndere stiller. Her er det enkle svar:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrer individuelle Azure-ressourcer | Udrul komplette applikationer |
| **Tankegang** | Infrastruktur-fokuseret | Applikations-fokuseret |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Skal kende Azure-tjenester | Bare kendskab til din app |
| **Bedst til** | DevOps, Infrastruktur | Udviklere, Prototyping |

### Enkel analogi

- **Azure CLI** er som at have alle værktøjerne til at bygge et hus - hammere, save, søm. Du kan bygge hvad som helst, men du skal kende byggeri.
- **Azure Developer CLI** er som at hyre en entreprenør - du beskriver, hvad du vil have, og de tager sig af byggeriet.

### Hvornår skal man bruge hvilken

| Scenario | Brug dette |
|----------|------------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### De arbejder sammen!

AZD bruger Azure CLI under motorhjelmen. Du kan bruge begge:
```bash
# Udrul din app med AZD
azd up

# Finjuster derefter specifikke ressourcer med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find skabeloner i Awesome AZD

Start ikke fra bunden! **Awesome AZD** er fællesskabets samling af klar-til-udrulning skabeloner:

| Ressource | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Gennemse 200+ skabeloner med ét-klik udrulning |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til community'et |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star og udforsk kilden |

### Populære AI-skabeloner fra Awesome AZD

```bash
# RAG Chat med Microsoft Foundry-modeller + AI-søgning
azd init --template azure-search-openai-demo

# Hurtig AI-chatapplikation
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom godt i gang på 3 trin

Før du starter, sørg for at din maskine er klar til den skabelon, du ønsker at udrulle:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis en nødvendig kontrol fejler, ret det først og fortsæt så med quick start.

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

### Trin 2: Autentificer til AZD

```bash
# Valgfri, hvis du planlægger at bruge Azure CLI-kommandoer direkte i dette kursus
az login

# Påkrævet for AZD-workflows
azd auth login
```

Hvis du er usikker på hvilken du har brug for, følg den fulde opsætningsflow i [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Trin 3: Udrul din første app

```bash
# Initialiser fra en skabelon
azd init --template todo-nodejs-mongo

# Udrul til Azure (opretter alt!)
azd up
```

**🎉 Så er det færdigt!** Din app er nu live på Azure.

### Ryd op (glem det ikke!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Sådan bruger du dette kursus

Dette kursus er designet til **progressiv læring** - start hvor du er komfortabel, og arbejd dig opad:

| Din erfaring | Start her |
|-----------------|------------|
| **Helt ny til Azure** | [Kapitel 1: Grundlag](#-chapter-1-foundation--quick-start) |
| **Kender Azure, ny til AZD** | [Kapitel 1: Grundlag](#-chapter-1-foundation--quick-start) |
| **Vil udrulle AI-apps** | [Kapitel 2: AI-først udvikling (anbefalet for AI-udviklere)](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil have praktisk øvelse** | [🎓 Interaktiv workshop](workshop/README.md) - 3-4 timers guidet lab |
| **Behøver produktionsmønstre** | [Kapitel 8: Produktion & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Hurtig opsætning

1. **Fork dette repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker du at klone lokalt?**
>
> Dette repository indeholder 50+ sprogoversættelser, hvilket i høj grad øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en langt hurtigere download.


## Kursusoversigt

Mestre Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på udrulning af AI-applikationer med Microsoft Foundry-integration.**
### Hvorfor dette kursus er essentielt for moderne udviklere

Baseret på Microsoft Foundry Discord-fællesskabets indsigt ønsker **45% af udviklerne at bruge AZD til AI-workloads**, men støder på udfordringer med:
- Komplekse multi-service AI-arkitekturer
- Bedste praksis for AI-implementering i produktion  
- Integrering og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-workloads
- Fejlfinding af AI-specifikke implementeringsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD-grundprincipperne**: Kernekoncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementere Infrastruktur som kode**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlsøge udrulninger**: Løs almindelige problemer og debug
- **Optimere til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge multi-agent-løsninger**: Udrul komplekse AI-arkitekturer

## Før du begynder: Konti, adgang og forudsætninger

Før du begynder Kapitel 1, sørg for at du har følgende på plads. Installationsvejledningen senere i denne guide antager, at disse grundlæggende ting allerede er håndteret.

- **Et Azure-abonnement**: Du kan bruge et eksisterende abonnement fra arbejde eller din egen konto, eller oprette en [free trial](https://aka.ms/azurefreetrial) for at komme i gang.
- **Tilladelse til at oprette Azure-ressourcer**: Til de fleste øvelser bør du have mindst **Contributor**-adgang på den målrettede subscription eller resource group. Nogle kapitler kan også antage, at du kan oprette ressourcegrupper, administrerede identiteter og RBAC-tildelinger.
- [**En GitHub-konto**](https://github.com): Dette er nyttigt til at fork'e repositoryet, spore dine egne ændringer og bruge GitHub Codespaces til workshoppen.
- **Krav til skabelonens runtime**: Nogle skabeloner kræver lokale værktøjer såsom Node.js, Python, Java eller Docker. Kør setup-validatoren før start, så du fanger manglende værktøjer tidligt.
- **Grundlæggende kendskab til terminalen**: Du behøver ikke være ekspert, men du bør være komfortabel med at køre kommandoer som `git clone`, `azd auth login`, og `azd up`.

> **Arbejder du i et virksomhedsabonnement?**
> Hvis dit Azure-miljø administreres af en administrator, bekræft på forhånd, at du kan udrulle ressourcer i det subscription eller den resource group, du planlægger at bruge. Hvis ikke, bed om et sandbox-abonnement eller Contributor-adgang før du starter.

> **Ny til Azure?**
> Start med din egen Azure-prøveperiode eller pay-as-you-go-abonnement på https://aka.ms/azurefreetrial, så du kan gennemføre øvelserne fra ende til ende uden at vente på godkendelser på tenant-niveau.

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-fokuserede apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Security | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Deployment | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 t | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI Agent Solutions | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planlægning & Validering | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Fejlfinding | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 t | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Virksomhedsmønstre | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Samlet kursustid:** ~10-14 timer | **Færdighedsudvikling:** Begynder → Produktionsklar

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaring og mål*

### 🚀 Kapitel 1: Grundlag & Kom godt i gang
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du vil lære
- Forstå Azure Developer CLI-grundprincipperne
- Installere AZD på din platform
- Din første vellykkede udrulning

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernekoncepter og terminologi
- **⚙️ Opsætning**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platformsspecifikke vejledninger
- **🛠️ Praktisk**: [Your First Project](docs/chapter-01-foundation/first-project.md) - Trin-for-trin vejledning
- **📋 Hurtig reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Hurtig installationskontrol
azd version

# Udrul din første applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitlets resultat**: Udrul en simpel webapplikation til Azure ved hjælp af AZD

**✅ Succesvalidering:**
```bash
# Efter at have gennemført kapitel 1 bør du være i stand til:
azd version              # Viser den installerede version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                  # Udruller til Azure
azd show                # Viser URL'en til den kørende app
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcerne
```

**📊 Tidsinvestering:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan selvstændigt udrulle grundlæggende applikationer
**📈 Færdighedsniveau efter:** Kan selvstændigt udrulle grundlæggende applikationer

---

### 🤖 Kapitel 2: AI-først-udvikling (Anbefalet for AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Microsoft Foundry-integration med AZD
- Udrulning af AI-drevne applikationer
- Forstå AI-tjenestekonfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Udrul intelligente agenter med AZD
- **📖 Mønstre**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klare
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browser-baseret læring med MkDocs * DevContainer Environment
- **📋 Skabeloner**: [Microsoft Foundry Templates](#workshopressourcer)
- **📝 Eksempler**: [AZD Deployment Examples](examples/README.md)

#### Praktiske øvelser
```bash
# Udrul din første AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prøv yderligere AI-skabeloner
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitlets resultat**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktionalitet

**✅ Succesvalidering:**
```bash
# Efter kapitel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Test AI-chatgrænsefladen
# Stil spørgsmål og få AI-drevne svar med kilder
# Bekræft, at søgeintegrationen virker
azd monitor  # Kontroller, at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsinvestering:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå udviklingsomkostninger på $80-150/pr. måned, produktionsomkostninger $300-3500/pr. måned

#### 💰 Omkostningsovervejelser for AI-udrulninger

**Udviklingsmiljø (anslået $80-150/pr. måned):**
- Microsoft Foundry-modeller (Pay-as-you-go): $0-50/pr. måned (baseret på token-forbrug)
- AI Search (Basic tier): $75/pr. måned
- Container Apps (Consumption): $0-20/pr. måned
- Storage (Standard): $1-5/pr. måned

**Produktionsmiljø (anslået $300-3,500+/pr. måned):**
- Microsoft Foundry-modeller (PTU for konsistent ydeevne): $3,000+/pr. måned ELLER Pay-as-go ved høj volumen
- AI Search (Standard tier): $250/pr. måned
- Container Apps (Dedicated): $50-100/pr. måned
- Application Insights: $5-50/pr. måned
- Storage (Premium): $10-50/pr. måned

**💡 Tips til omkostningsoptimering:**
- Brug **Free Tier** Microsoft Foundry-modeller til læring (Azure OpenAI 50,000 tokens/month included)
- Kør `azd down` for at frakoble ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` for at estimere omkostninger før udrulning
- Aktivér autoskalering: betal kun for faktisk brug

**Cost Monitoring:**
```bash
# Kontroller anslåede månedlige omkostninger
azd provision --preview

# Overvåg de faktiske omkostninger i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentificering
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Miljøkonfiguration og -styring
- Autentificering og bedste praksis for sikkerhed
- Ressourcenavngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Autentificeringsmønstre
- **📝 Eksempler**: [Database App Example](examples/database-app/README.md) - AZD-databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity-autentificering
- Implementer miljøspecifikke konfigurationer

**💡 Kapitlets resultat**: Administrer flere miljøer med korrekt autentificering og sikkerhed

---

### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
**Forudsætninger**: Kapitel 1-3 gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hvad du vil lære
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressourceprovisionering

#### Læringsressourcer
- **📖 Udrulning**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Fuldstændige workflows
- **🏗️ Provisionering**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure-ressourcehåndtering
- **📝 Eksempler**: [Container App Example](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Udrul multi-service-applikationer
- Implementer blue-green-udrulningsstrategier

**💡 Kapitlets resultat**: Udrul komplekse multi-service-applikationer ved hjælp af brugerdefinerede infrastruktur-skabeloner
### 🎯 Kapitel 5: Multi-Agent AI Solutions (Advanced)
**Forudsætninger**: Chapters 1-2 completed  
**Varighed**: 2-3 hours  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Multi-agent architecture patterns
- Agent orchestration and coordination
- Production-ready AI deployments

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Complete implementation
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click deployment
- **📖 Arkitektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Patterns

#### Praktiske øvelser
```bash
# Udrul den komplette multi-agent-løsning til detailhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapiteludbytte**: Deploy and manage a production-ready multi-agent AI solution with Customer and Inventory agents

---

### 🔍 Kapitel 6: Pre-Deployment Validation & Planning
**Forudsætninger**: Chapter 4 completed  
**Varighed**: 1 hour  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Kapacitetsplanlægning og ressourcevalidering
- SKU-valgsstrategier
- Forhåndstjek og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resource validation
- **💰 Valg**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Cost-effective choices
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automated scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimer SKU-valg for omkostninger
- Implementer automatiserede forud-implementeringskontroller

**💡 Kapiteludbytte**: Valider og optimer implementeringer før udførelse

---

### 🚨 Kapitel 7: Troubleshooting & Debugging
**Forudsætninger**: Any deployment chapter completed  
**Varighed**: 1-1.5 hours  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske fejlsøgningsmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ and solutions
- **🕵️ Fejlsøgning**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Step-by-step strategies
- **🤖 AI-problemer**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problems

#### Praktiske øvelser
- Diagnosticer udrulningsfejl
- Løs autentificeringsproblemer
- Fejlsøg AI-tjenestes forbindelse

**💡 Kapiteludbytte**: Independently diagnose and resolve common deployment issues

---

### 🏢 Kapitel 8: Production & Enterprise Patterns
**Forudsætninger**: Chapters 1-4 completed  
**Varighed**: 2-3 hours  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Strategier for produktionsudrulning
- Virksomhedssikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise patterns
- **📝 Eksempler**: [Microservices Example](../../examples/microservices) - Complex architectures
- **📊 Overvågning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktiske øvelser
- Implementer virksomhedssikkerhedsmønstre
- Opsæt omfattende overvågning
- Udrul til produktion med korrekt governance

**💡 Kapiteludbytte**: Deploy enterprise-ready applications with full production capabilities

---

## 🎓 Workshop Oversigt: Praktisk læringsoplevelse

> **⚠️ WORKSHOP STATUS: Active Development**  
> The workshop materials are currently being developed and refined. Core modules are functional, but some advanced sections are incomplete. We're actively working to complete all content. [Spor fremdrift →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende praktisk læring med browser-baserede værktøjer og vejledte øvelser**

Vores workshopmaterialer giver en struktureret, interaktiv læringsoplevelse, der supplerer kapitlerne ovenfor. Workshoppen er designet til både selvstyret læring og instruktør-ledede sessions.

#### 🛠️ Workshopfunktioner
- **Browser-baseret interface**: Complete MkDocs-powered workshop with search, copy, and theme features
- **GitHub Codespaces-integration**: One-click development environment setup
- **Struktureret læringssti**: 8-module guided exercises (3-4 hours total)
- **Progressiv metodologi**: Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
- **Interaktivt DevContainer-miljø**: Pre-configured tools and dependencies

#### 📚 Workshop modulstruktur
Workshoppen følger en **8-moduls progressiv metodologi**, der tager dig fra opdagelse til udrulningsmestring:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop Overview | Understand learning objectives, prerequisites, and workshop structure | 15 min |
| **1. Selection** | Template Discovery | Explore AZD templates and select the right AI template for your scenario | 20 min |
| **2. Validation** | Deploy & Verify | Deploy the template with `azd up` and validate infrastructure works | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | Master `azure.yaml` configuration, lifecycle hooks, and environment variables | 30 min |
| **5. Customization** | Make It Yours | Enable AI Search, tracing, evaluation, and customize for your scenario | 45 min |
| **6. Teardown** | Clean Up | Safely deprovision resources with `azd down --purge` | 15 min |
| **7. Wrap-up** | Next Steps | Review accomplishments, key concepts, and continue your learning journey | 15 min |

**Workshopforløb:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kom godt i gang med workshoppen
```bash
# Mulighed 1: GitHub Codespaces (Anbefalet)
# Klik på "Code" → "Create codespace on main" i repositoryet

# Mulighed 2: Lokal udvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg opsætningsinstruktionerne i workshop/README.md
```

#### 🎯 Workshop læringsudbytte
Ved at gennemføre workshoppen vil deltagerne:
- **Udrul produktions-AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Behersk multi-agent-arkitekturer**: Implementer koordinerede AI-agentløsninger
- **Implementer sikkerhedsbedste praksis**: Konfigurer autentificering og adgangskontrol
- **Optimér til skala**: Design omkostningseffektive, højtydende udrulninger
- **Fejlfinding af udrulninger**: Løs almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browser-based learning environment
- **📋 Modul-for-modul instruktioner**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop overview and objectives
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find and select AI templates
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy and verify templates
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Explore template architecture
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Master azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Customize for your scenario
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Clean up resources
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Review and next steps
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-focused exercises
- **💡 Hurtigstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Environment configuration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler-bootcamps.

---

## 📖 Dybdegående: AZD-funktioner

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsudrulninger:

- **Skabelonbaserede udrulninger** - Use pre-built templates for common application patterns
- **Infrastruktur som kode** - Manage Azure resources using Bicep or Terraform  
- **Integrerede arbejdsgange** - Seamlessly provision, deploy, and monitor applications
- **Udviklervenlig** - Optimized for developer productivity and experience

### **AZD + Microsoft Foundry: Perfekt til AI-udrulninger**

**Hvorfor AZD til AI-løsninger?** AZD adresserer de største udfordringer, AI-udviklere står overfor:

- **AI-klar skabeloner** - Pre-configured templates for Microsoft Foundry Models, Azure AI Services, and ML workloads
- **Sikre AI-udrulninger** - Built-in security patterns for AI services, API keys, and model endpoints  
- **Produktions-AI-mønstre** - Best practices for scalable, cost-effective AI application deployments
- **End-to-end AI-arbejdsgange** - From model development to production deployment with proper monitoring
- **Omkostningsoptimering** - Smart resource allocation and scaling strategies for AI workloads
- **Integration med Microsoft Foundry** - Seamless connection to Microsoft Foundry model catalog and endpoints

---

## 🎯 Skabelon- & eksempelsbibliotek

### Fremhævet: Microsoft Foundry Templates
**Start her, hvis du udruller AI-applikationer!**

> **Note:** These templates demonstrate various AI patterns. Some are external Azure Samples, others are local implementations.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Fremhævet: Komplette læringsscenarier
**Produktionsklare applikationsskabeloner kortlagt til læringskapitler**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Læring via eksemplerstype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Clone fra de linkede repositories

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Complete production-ready implementation with ARM templates
  - Multi-agent architecture (Customer + Inventory agents)
  - Comprehensive monitoring and evaluation
  - One-click deployment via ARM template

#### Lokale eksempler - Container Applications (Kapitler 2-5)
**Omfattende container-udrulningseksempler i dette repository:**
- [**Container App-eksempler**](examples/container-app/README.md) - Komplet guide til containeriserede udrulninger
  - [Simpelt Flask-API](../../examples/container-app/simple-flask-api) - Grundlæggende REST-API med skalér-til-nul
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service-udrulning
  - Hurtig start, produktion og avancerede udrulningsmønstre
  - Vejledning om overvågning, sikkerhed og omkostningsoptimering

#### Eksterne eksempler - Enkle applikationer (Kapitler 1-2)
**Klon disse Azure Samples-repositorier for at komme i gang:**
- [Simpel webapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende implementeringsmønstre
- [Statisk websted - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Udrulning af statisk indhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Udrulning af REST-API

#### Eksterne eksempler - Databaseintegration (Kapitler 3-4)  
- [Database-app - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mønstre for databaseforbindelse
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs dataarbejdsgang

#### Eksterne eksempler - Avancerede mønstre (Kapitler 4-8)
- [Java-mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arkitekturer med flere tjenester
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelonsamlinger
- [**Officielt AZD-skabelongalleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI-skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer og referencer

### Hurtige referencer
- [**Kommando-oversigt**](resources/cheat-sheet.md) - Væsentlige azd-kommandoer organiseret efter kapitel
- [**Gloseliste**](resources/glossary.md) - Azure og azd-terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende praksisøvelser

### Praktiske workshops
- [**AI Workshop-lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-implementerbare (2-3 timer)
- [**Interaktiv workshop**](workshop/README.md) - 8-moduls guidede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Oprydning → Afrunding

### Eksterne læringsressourcer
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure status](https://status.azure.com/)

### AI-agentfærdigheder til din editor
- [**Microsoft Azure-færdigheder på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åbne agentfærdigheder for Azure AI, Foundry, udrulning, diagnostik, omkostningsoptimering og mere. Installer dem i GitHub Copilot, Cursor, Claude Code, eller enhver understøttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hurtig fejlfindingsguide

**Almindelige problemer, som begyndere møder, og hurtige løsninger:**

<details>
<summary><strong>❌ "azd: kommando ikke fundet"</strong></summary>

```bash
# Installer AZD først
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Bekræft installationen
azd version
```
</details>

<details>
<summary><strong>❌ "Intet abonnement fundet" eller "Abonnement ikke indstillet"</strong></summary>

```bash
# Vis tilgængelige abonnementer
az account list --output table

# Indstil standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Indstil for AZD-miljøet
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Bekræft
az account show
```
</details>

<details>
<summary><strong>❌ "Utilstrækkelig kvote" eller "Kvote overskredet"</strong></summary>

```bash
# Prøv en anden Azure-region
azd env set AZURE_LOCATION "westus2"
azd up

# Eller brug mindre SKU'er i udvikling
# Rediger infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" fejler halvvejs igennem</strong></summary>

```bash
# Mulighed 1: Rens og prøv igen
azd down --force --purge
azd up

# Mulighed 2: Ret kun infrastrukturen
azd provision

# Mulighed 3: Kontroller detaljeret status
azd show

# Mulighed 4: Kontroller logfiler i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentificering mislykkedes" eller "Token udløbet"</strong></summary>

```bash
# Autentificer igen for AZD
azd auth logout
azd auth login

# Valgfrit: opfrisk også Azure CLI, hvis du kører az-kommandoer
az logout
az login

# Bekræft autentificering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource findes allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unikke navne, men hvis der opstår konflikt:
azd down --force --purge

# Prøv igen med et nyt miljø
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
# Tjek fremdrift
azd show

# Hvis du sidder fast i >30 minutter, tjek Azure-portalen:
azd monitor --overview
# Se efter mislykkede udrulninger
```
</details>

<details>
<summary><strong>❌ "Adgang nægtet" eller "Forbudt"</strong></summary>

```bash
# Kontroller din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal som minimum have rollen "Contributor"
# Bed din Azure-administrator om at tildele:
# - Contributor (til ressourcer)
# - User Access Administrator (til rolle-tildelinger)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde den implementerede applikations-URL</strong></summary>

```bash
# Vis alle tjenesteendepunkter
azd show

# Eller åbn Azure-portalen
azd monitor

# Tjek en specifik tjeneste
azd env get-values
# Søg efter *_URL-variabler
```
</details>

### 📚 Fuldstændige ressourcer til fejlfinding

- **Guide til almindelige problemer:** [Detaljerede løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikke problemer:** [AI-fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-guide:** [Trin-for-trin fejlfinding](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusgennemførelse & certificering

### Fremdriftssporing
Spor din læringsfremgang gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtig start ✅
- [ ] **Kapitel 2**: AI-først udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Godkendelse ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapitel 6**: Forudgående validering & planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Fejlsøgning ✅
- [ ] **Kapitel 8**: Produktion & Virksomhedsmønstre ✅

### Verificering af læring
Efter at have gennemført hvert kapitel, verificer din viden ved at:
1. **Praktisk øvelse**: Gennemfør kapitlets praktiske udrulning
2. **Videnstest**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din erfaring i Azure Discord
4. **Næste kapitel**: Gå videre til næste kompleksitetsniveau

### Fordele ved kursusgennemførelse
Efter at have gennemført alle kapitler, vil du have:
- **Produktionserfaring**: Udrullet virkelige AI-applikationer til Azure
- **Professionelle færdigheder**: Produktionsklare udrulningskompetencer  
- **Fællesskabsanerkendelse**: Aktivt medlem af Azure-udviklerfællesskabet
- **Karrierefremme**: Eftertragtede AZD- og AI-udrulningskompetencer

---

## 🤝 Fællesskab & support

### Få hjælp & support
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Spørgsmål om læring**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Microsoft Foundry Discord

**Seneste meningsmåleresultater fra #Azure-kanalen:**
- **45%** af udviklere vil bruge AZD til AI-arbejdsbelastninger
- **Topudfordringer**: Multi-service-udrulninger, håndtering af legitimationsoplysninger, produktionsparathed  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlfinding-vejledninger, bedste praksis

**Deltag i vores fællesskab for at:**
- Del dine AZD + AI-erfaringer og få hjælp
- Få tidlig adgang til forhåndsvisninger af nye AI-skabeloner
- Bidrage til bedste praksis for AI-udrulning
- Påvirke fremtidig AI + AZD-funktionsudvikling

### Bidrag til kurset
Vi byder bidrag velkommen! Læs venligst vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedre eksisterende kapitler og eksempler
- **Nye eksempler**: Tilføj virkelige scenarier og skabeloner  
- **Oversættelse**: Hjælp med at vedligeholde flersproget support
- **Fejlrapporter**: Forbedr nøjagtighed og klarhed
- **Fællesskabsstandarder**: Følg vores inkluderende fællesskabsretningslinjer

---

## 📄 Kursusinformation

### Licens
Dette projekt er licenseret under MIT-licensen - se filen [LICENSE](../../LICENSE) for detaljer.

### Relaterede Microsoft-læringsressourcer

Vores team producerer andre omfattende læringskurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for Begyndere](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Begyndere](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Begyndere](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD for Begyndere](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Begyndere](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Begyndere](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-Agenter for Begyndere](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI for Begyndere](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kerneindlæring
[![ML for begyndere](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for begyndere](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for begyndere](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersikkerhed for begyndere](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webudvikling for begyndere](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for begyndere](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-udvikling for begyndere](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot til AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot til C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-eventyr](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at komme i gang?**

**Begyndere**: Start med [Kapitel 1: Grundlag & Hurtigstart](#-chapter-1-foundation--quick-start)  
**AI-udviklere**: Gå til [Kapitel 2: AI-først udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & Autentificering](#️-chapter-3-configuration--authentication)

**Næste skridt**: [Start Kapitel 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->