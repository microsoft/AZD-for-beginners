# AZD for Begyndere: En Struktureret Læringsrejse

![AZD-for-beginners](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske Oversættelser (Altid Opdaterede)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengalsk](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (Forenklet)](../zh-CN/README.md) | [Kinesisk (Traditionelt, Hong Kong)](../zh-HK/README.md) | [Kinesisk (Traditionelt, Macau)](../zh-MO/README.md) | [Kinesisk (Traditionelt, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malaysisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk Pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (Kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailandsk](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrækker du at klone lokalt?**
>
> Dette repository indeholder 50+ sprogoversættelser, hvilket markant øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
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
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Hvad er Nyt i azd i dag

> 📌 Dette kursus er valideret mod **`azd 1.27.1`** (juli 2026). Kør `azd version` for at tjekke din version, og `azd upgrade` for at få den nyeste.

Azure Developer CLI er vokset ud over traditionelle webapps og API'er. I dag er azd det eneste værktøj til at deployere **enhver** applikation til Azure—herunder AI-drevne applikationer og intelligente agenter.

Her er, hvad det betyder for dig:

- **AI-agenter er nu førsteklasses azd-arbejdsbelastninger.** Du kan initialisere, deployere og administrere AI-agentprojekter med det samme `azd init` → `azd up` workflow, som du allerede kender.
- **En komplet agentlivscyklus fra CLI.** Udvidelsen `azure.ai.agents` dækker nu hele rejsen—`azd ai agent init` til at generere skabelon, `azd ai agent invoke` til test (med responstid-output), `azd ai agent eval generate` og `azd ai agent optimize` til at måle og forbedre kvaliteten, samt `azd ai agent delete` til oprydning.
- **Flere AI byggesten.** Nye preview-udvidelser—`azure.ai.skills` og `azure.ai.connections`—giver dig mulighed for at administrere genanvendelige agentskills og Foundry-forbindelser direkte via azd.
- **Microsoft Foundry-integration** bringer modeludrulning, agenthosting og AI-servicekonfiguration direkte ind i azd-temaets økosystem.
- **Mere smidige daglige basale ting.** Nylige udgivelser har gjort `azd init` idempotent (sikker at køre flere gange), gjort `azd auth login` til automatisk at rydde gamle tokens, og tilføjet en venlig første-setup prompt til `azd tool`.
- **Kernearbejdsgangen er uændret.** Uanset om du deployerer en todo-app, en mikrotjeneste eller en multi-agent AI-løsning, er kommandoerne de samme.

> **Note til Aspire-brugere:** Microsoft kalder nu produktet simpelthen **Aspire** (tidligere ".NET Aspire"). azd's Aspire-support er uændret—kun navnet blev opdateret.

Hvis du har brugt azd før, er AI-support en naturlig udvidelse—ikke et separat værktøj eller en avanceret bane. Hvis du starter forfra, lærer du én arbejdsgang, der virker til alt.

---

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det enkelt at deployere applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer kan du deployere hele applikationer med en enkelt kommando.

### Magien ved `azd up`

```bash
# Denne enkeltkommando klarer det hele:
# ✅ Opretter alle Azure-ressourcer
# ✅ Konfigurerer netværk og sikkerhed
# ✅ Bygger din applikationskode
# ✅ Udruller til Azure
# ✅ Giver dig en fungerende URL
azd up
```

**Det er det!** Intet klik i Azure-portalen, ingen komplekse ARM-skabeloner at lære først, ingen manuel konfiguration - bare fungerende applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hvad er forskellen?

Det er det mest almindelige spørgsmål begyndere stiller. Her er det simple svar:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressourcer | Deployere komplette applikationer |
| **Tankegang** | Infrastrukturfokuseret | Applikationsfokuseret |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Skal kende Azure-tjenester | Skal bare kende din app |
| **Bedst til** | DevOps, Infrastruktur | Udviklere, Prototyping |

### Enkel analogi

- **Azure CLI** er som at have alle værktøjerne til at bygge et hus - hammere, save, søm. Du kan bygge hvad som helst, men du skal kende byggeri.
- **Azure Developer CLI** er som at hyre en entreprenør - du beskriver, hvad du vil have, og de klarer byggeriet.

### Hvornår bruges hvilke

| Scenarie | Brug dette |
|----------|----------|
| "Jeg vil hurtigt deployere min webapp" | `azd up` |
| "Jeg skal bare oprette en storagekonto" | `az storage account create` |
| "Jeg bygger en fuld AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jeg skal fejlfinde en specifik Azure-ressource" | `az resource show` |
| "Jeg vil have produktionsklar deployment på få minutter" | `azd up --environment production` |

### De arbejder sammen!

AZD bruger Azure CLI under motorhjelmen. Du kan bruge begge:
```bash
# Udrul din app med AZD
azd up

# Finjuster derefter specifikke ressourcer med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find Skabeloner i Awesome AZD

Start ikke fra bunden! **Awesome AZD** er fællesskabets samling af klar-til-deployment skabeloner:

| Ressource | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Galleri**](https://azure.github.io/awesome-azd/) | Gennemse 200+ skabeloner med ét klik deployment |
| 🔗 [**Indsend en Skabelon**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til fællesskabet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Stjernemærk og udforsk kilden |

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

## 🎯 Kom Godt I Gang På 3 Trin

Før du går i gang, sikre dig at din maskine er klar til den skabelon, du ønsker at deployere:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis nogen obligatoriske kontroller mislykkes, ret dem først og fortsæt derefter med hurtigstarten.

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

### Trin 2: Godkend for AZD

```bash
# Valgfrit, hvis du planlægger at bruge Azure CLI-kommandoer direkte i dette kursus
az login

# Krævet for AZD-arbejdsgange
azd auth login
```

Hvis du er usikker på, hvilken du har brug for, følg den fulde opsætning i [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Trin 3: Deploy din første app

```bash
# Initialiser fra en skabelon
azd init --template todo-nodejs-mongo

# Udrul til Azure (opretter alt!)
azd up
```

**🎉 Det er det!** Din app er nu live på Azure.

### Ryd op (Glem ikke!)

```bash
# Fjern alle ressourcer, når eksperimenteringen er færdig
azd down --force --purge
```

---

## 📚 Hvordan man bruger dette kursus

Dette kursus er designet til **progressiv læring** - start hvor du føler dig tryg, og arbejd dig opad:

| Din Erfaring | Start Her |
|-----------------|------------|
| **Helt ny til Azure** | [Kapitel 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Kender Azure, ny til AZD** | [Kapitel 1: Fundament](#-chapter-1-foundation--quick-start) |
| **Ønsker at deployere AI-apps** | [Kapitel 2: AI-Først Udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil have praktisk øvelse** | [🎓 Interaktiv Workshop](workshop/README.md) - 3-4 timers guidet laboratorium |
| **Behøver produktionsmønstre** | [Kapitel 8: Produktion & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Hurtig Opsætning

1. **Fork dette repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker du at klone lokalt?**

> Dette repository indeholder 50+ sprogoversættelser, hvilket markant øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.


## Kursusoversigt

Mestre Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på AI-applikationsudrulning med Microsoft Foundry-integration.**


### Hvorfor dette kursus er essentielt for moderne udviklere

Baseret på indsigt fra Microsoft Foundry Discord-fællesskabet ønsker **45 % af udviklerne at bruge AZD til AI-arbejdsbelastninger**, men støder på udfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Bedste praksis for produktionsimplementering af AI  
- Integration og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-arbejdsbelastninger
- Fejlfinding af AI-specifikke implementeringsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD-grundlæggende**: Kernebegreber, installation og konfiguration
- **Implementere AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementere infrastruktur som kode**: Administrere Azure-ressourcer med Bicep-skabeloner
- **Fejlsøge implementeringer**: Løse almindelige problemer og fejlfinde
- **Optimere til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge multi-agent-løsninger**: Implementere komplekse AI-arkitekturer

## Før du starter: Konti, adgang og forudsætninger

Inden du går i gang med kapitel 1, skal du sikre dig, at du har følgende på plads. Installationsfremgangsmåderne senere i denne guide forudsætter, at disse grundlæggende ting allerede er håndteret.

- **Et Azure-abonnement**: Du kan bruge et eksisterende abonnement fra arbejde eller din egen konto, eller oprette en [gratis prøveperiode](https://aka.ms/azurefreetrial) for at komme i gang.
- **Tilladelse til at oprette Azure-ressourcer**: Til de fleste øvelser bør du have mindst **Bidragyder**-adgang til det valgte abonnement eller ressourcegruppe. Nogle kapitler kan også antage, at du kan oprette ressourcegrupper, administrerede identiteter og RBAC-tildelinger.
- [**En GitHub-konto**](https://github.com): Dette er nyttigt til at forgrene repositoryen, spore dine egne ændringer og bruge GitHub Codespaces til workshoppen.
- **Kørselsforudsætninger for skabeloner**: Nogle skabeloner kræver lokale værktøjer som Node.js, Python, Java eller Docker. Kør opsætningsvalidatoren inden start, så du hurtigt opdager manglende værktøjer.
- **Grundlæggende terminalkendskab**: Du behøver ikke at være ekspert, men bør være fortrolig med at køre kommandoer som `git clone`, `azd auth login` og `azd up`.

> **Arbejder du i et virksomhederabonnement?**
> Hvis dit Azure-miljø administreres af en administrator, skal du forud bekræfte, at du kan implementere ressourcer i det abonnement eller den ressourcegruppe, du planlægger at bruge. Hvis ikke, bed om et sandkasseabonnement eller Bidragyder-adgang inden du starter.

> **Ny på Azure?**
> Start med din egen Azure-prøveperiode eller pay-as-you-go-abonnement på https://aka.ms/azurefreetrial, så du kan gennemføre øvelserne fra start til slut uden at vente på godkendelser på tenants niveau.

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Hvert kapitel har en dedikeret README med læringsmål, hurtigstart og øvelser:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kap 1: Fundament](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Første projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-udvikling](docs/chapter-02-ai-development/README.md)** | AI-First Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modelimplementering](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 t | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Auth & Sikkerhed | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Implementering | [Implementeringsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 t | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Retail Scenario](examples/retail-scenario.md) &#124; [Koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[Kap 6: Forud for implementering](docs/chapter-06-pre-deployment/README.md)** | Planlægning & validering | [Preflight checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-udvælgelse](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 t | ⭐⭐ |
| **[Kap 7: Fejlfinding](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 t | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Virksomhedsmønstre | [Produktionspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 t | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk laboratorie | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedlukning](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afrunding](workshop/docs/instructions/7-Wrap-up.md) | 3-4 t | ⭐⭐ |

**Samlet kursusvarighed:** ~10-14 timer | **Færdighedsniveau:** Begynder → Produktionsklar

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Kapitel 1: Fundament & Hurtigstart
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinje  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Det lærer du
- Forstå Azure Developer CLI grundlæggende
- Installation af AZD på din platform
- Din første succesfulde implementering

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernebegreber og terminologi
- **⚙️ Opsætning**: [Installation & opsætning](docs/chapter-01-foundation/installation.md) - Plattformsspecifikke guider
- **🛠️ Praktisk**: [Dit første projekt](docs/chapter-01-foundation/first-project.md) - Trin-for-trin vejledning
- **📋 Hurtig reference**: [Kommando Cheat Sheet](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Hurtig installationskontrol
azd version

# Udrul din første applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Implementer en simpel webapplikation i Azure med AZD

**✅ Succesvalidering:**
```bash
# Efter at have gennemført Kapitel 1, bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                  # Udruller til Azure
azd show                # Viser URL for kørende app
# Applikationen åbner i browseren og virker
azd down --force --purge  # Rydder op i ressourcer
```

**📊 Tidsforbrug:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan implementere basale applikationer selvstændigt
**📈 Færdighedsniveau efter:** Kan implementere basale applikationer selvstændigt

---

### 🤖 Kapitel 2: AI-Først Udvikling (Anbefalet for AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Det lærer du
- Microsoft Foundry-integration med AZD
- Implementering af AI-drevne applikationer
- Forståelse af AI-tjenestekonfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI-agentvejledning](docs/chapter-02-ai-development/agents.md) - Implementer intelligente agenter med AZD
- **📖 Mønstre**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Implementer og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klare
- **🎥 Interaktiv guide**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læring med MkDocs * DevContainer-miljø
- **📋 Skabeloner**: [Microsoft Foundry-skabeloner](#workshop-ressourcer)
- **📝 Eksempler**: [AZD-implementeringseksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Udrul din første AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prøv yderligere AI-skabeloner
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Implementer og konfigurer en AI-drevet chatapplikation med RAG-funktioner

**✅ Succesvalidering:**
```bash
# Efter kapitel 2 skal du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-drevne svar med kilder
# Bekræfte at søgeintegration fungerer
azd monitor  # Tjekke at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsforbrug:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan implementere og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå udviklingsomkostninger på $80-150/måned, produktionsomkostninger på $300-3500/måned

#### 💰 Omkostningsovervejelser for AI-implementeringer

**Udviklingsmiljø (estimeret $80-150/måned):**
- Microsoft Foundry-modeller (Pay-as-you-go): $0-50/måned (baseret på tokenforbrug)
- AI Search (basic tier): $75/måned
- Container Apps (forbrug): $0-20/måned
- Storage (standard): $1-5/måned

**Produktionsmiljø (estimeret $300-3.500+/måned):**
- Microsoft Foundry-modeller (PTU for stabil ydeevne): $3.000+/måned ELLER Pay-as-you-go ved højt forbrug
- AI Search (standard tier): $250/måned
- Container Apps (dedikeret): $50-100/måned
- Application Insights: $5-50/måned
- Storage (premium): $10-50/måned

**💡 Omkostningsoptimeringstips:**
- Brug **Gratis niveau** Microsoft Foundry-modeller til læring (Azure OpenAI inkluderer 50.000 tokens/måned)
- Kør `azd down` for at afallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` for at estimere omkostninger før implementering
- Aktiver autoskalering: betal kun for faktisk brug

**Omkostningsovervågning:**
```bash
# Tjek estimerede månedlige omkostninger
azd provision --preview

# Overvåg faktiske omkostninger i Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & godkendelse
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Det lærer du
- Miljøkonfiguration og -styring
- Godkendelse og sikkerhedspraksis
- Ressourcenavne og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Konfigurationsguide](docs/chapter-03-configuration/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Godkendelsesmønstre og administrerede identiteter](docs/chapter-03-configuration/authsecurity.md) - Godkendelsesmønstre
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt godkendelse med administreret identitet
- Implementer miljøspecifikke konfigurationer

**💡 Kapitelresultat**: Styr flere miljøer med korrekt godkendelse og sikkerhed

---

### 🏗️ Kapitel 4: Infrastruktur som kode & implementering
**Forudsætninger**: Kapitel 1-3 gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Det lærer du
- Avancerede implementeringsmønstre
- Infrastruktur som kode med Bicep
- Ressourceprovisioneringsstrategier

#### Læringsressourcer
- **📖 Implementering**: [Implementeringsguide](docs/chapter-04-infrastructure/deployment-guide.md) - Komplette arbejdsgange
- **🏗️ Provisionering**: [Provisionering af ressourcer](docs/chapter-04-infrastructure/provisioning.md) - Azure-ressourceadministration
- **📝 Eksempler**: [Container-app-eksempel](../../examples/container-app) - Containeriserede implementeringer

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Implementer multi-tjeneste applikationer
- Implementer blue-green implementeringsstrategier

**💡 Kapitelresultat**: Implementer komplekse multi-tjeneste applikationer ved hjælp af brugerdefinerede infrastruktur-skabeloner

---


### 🎯 Kapitel 5: Multi-Agent AI Løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad Du Vil Lære
- Multi-agent arkitekturmønstre
- Agent orkestrering og koordinering
- Produktionsklare AI-implementeringer

#### Læringsressourcer
- **🤖 Fremhævet Projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Fuldstændig implementering
- **🛠️ ARM Skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klik implementering
- **📖 Arkitektur**: [Multi-agent koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske Øvelser
```bash
# Udrul den komplette multi-agent løsning til detailhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelens Resultat**: Implementér og administrer en produktionsklar multi-agent AI-løsning med Kunde- og Lager-agenter

---

### 🔍 Kapitel 6: For-Implementering Validering & Planlægning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad Du Vil Lære
- Kapacitetsplanlægning og ressourcevalidering
- SKU-udvælgelsesstrategier
- For-kontrol og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Udvælgelse**: [SKU Udvælgelse](docs/chapter-06-pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [For-kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske Øvelser
- Kør scripts til kapacitetsvalidering
- Optimer SKU-udvælgelse for omkostninger
- Implementér automatiserede for-implementeringskontroller

**💡 Kapitelens Resultat**: Valider og optimer implementeringer før udførelse

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert implementeringskapitel gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad Du Vil Lære
- Systematiske debugmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige Problemer**: [Almindelige Problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI Problemer**: [AI-Specifik Fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI service problemer

#### Praktiske Øvelser
- Diagnostiser implementeringsfejl
- Løs autentificeringsproblemer
- Debug forbindelsesproblemer i AI service

**💡 Kapitelens Resultat**: Diagnostiser og løs almindelige implementeringsproblemer på egen hånd

---

### 🏢 Kapitel 8: Produktions- & Enterprise-mønstre
**Forudsætninger**: Kapitel 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad Du Vil Lære
- Produktionsimplementeringsstrategier
- Enterprise sikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Produktions AI Bedste Praksis](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Microservices Eksempel](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Overvågning

#### Praktiske Øvelser
- Implementér enterprise sikkerhedsmønstre
- Opsæt omfattende overvågning
- Implementér i produktion med korrekt styring

**💡 Kapitelens Resultat**: Implementér enterprise-klare applikationer med fuld produktionskapacitet

---

## 🎓 Workshop Oversigt: Hands-On Læringsoplevelse

> **⚠️ WORKSHOP STATUS: Aktiv Udvikling**  
> Workshopmaterialerne er under udvikling og finpudsning. Kerne-moduler er funktionelle, men nogle avancerede sektioner mangler stadig. Vi arbejder aktivt på at færdiggøre alt indhold. [Følg fremskridt →](workshop/README.md)

### Interaktive Workshopmaterialer
**Omfattende hands-on læring med browserbaserede værktøjer og guidede øvelser**

Vores workshopmaterialer giver en struktureret, interaktiv læringsoplevelse, der supplerer den kapitelbaserede undervisning ovenfor. Workshoppen er designet til både selvstyret læring og instruktør-ledede sessioner.

#### 🛠️ Workshop Funktioner
- **Browser-Baseret Interface**: Komplett MkDocs-drevet workshop med søgning, kopi og tema-funktioner
- **GitHub Codespaces Integration**: Én-klik udviklingsmiljøopsætning
- **Struktureret Læringssti**: 8-moduls guidede øvelser (3-4 timer samlet)
- **Progressiv Metodologi**: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Opsamling
- **Interaktivt DevContainer Miljø**: For-konfigurerede værktøjer og afhængigheder

#### 📚 Workshop Modulstruktur
Workshoppen følger en **8-moduls progressiv metodologi**, der tager dig fra opdagelse til implementeringsmesterskab:

| Modul | Emne | Hvad Du Vil Gøre | Varighed |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshop Oversigt | Forstå læringsmål, forudsætninger og workshopstruktur | 15 min |
| **1. Udvælgelse** | Skabelon Opdagelse | Udforsk AZD-skabeloner og vælg den rette AI-skabelon til dit scenarie | 20 min |
| **2. Validering** | Implementér & Verificér | Implementér skabelonen med `azd up` og valider infrastrukturen | 30 min |
| **3. Nedbrydning** | Forstå Strukturen | Brug GitHub Copilot til at udforske skabelonarkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfiguration** | azure.yaml Dybdegående | Mestre `azure.yaml` konfiguration, livscyklus hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gør Det Dit Eget | Aktiver AI Search, tracing, evaluering og tilpas til dit scenarie | 45 min |
| **6. Nedtagning** | Ryd Op | Sikkert fraværende ressourcer med `azd down --purge` | 15 min |
| **7. Opsamling** | Næste Skridt | Gennemgå resultater, nøglekoncepter og fortsæt din læringsrejse | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Kom Godt I Gang Med Workshoppen
```bash
# Mulighed 1: GitHub Codespaces (Anbefalet)
# Klik "Code" → "Create codespace on main" i depotet

# Mulighed 2: Lokal udvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg opsætningsinstruktionerne i workshop/README.md
```

#### 🎯 Workshop Læringsresultater
Ved at gennemføre workshoppen vil deltagerne:
- **Implementere Produktions-AI Applikationer**: Brug AZD med Microsoft Foundry services
- **Beherske Multi-Agent Arkitekturer**: Implementere koordinerede AI agent løsninger
- **Implementere Sikkerheds Bedste Praksis**: Konfigurere autentificering og adgangskontrol
- **Optimere til Skalerbarhed**: Designe omkostningseffektive, performant implementeringer
- **Fejlfinding af Implementeringer**: Selvstændigt løse almindelige problemer

#### 📖 Workshop Ressourcer
- **🎥 Interaktiv Guide**: [Workshop Materialer](workshop/README.md) - Browserbaseret læringsmiljø
- **📋 Modul-for-Modul Instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshop oversigt og mål
  - [1. Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) - Find og vælg AI skabeloner
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementér og valider skabeloner
  - [3. Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Udforsk skabelonarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpas til dit scenarie
  - [6. Nedtagning](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ryd op i ressourcer
  - [7. Opsamling](workshop/docs/instructions/7-Wrap-up.md) - Gennemgå og næste skridt
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Hurtig Start**: [Workshop Opsætnings Guide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler bootcamps.

---

## 📖 Dybdegående: AZD Kapaciteter

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsimplementeringer:

- **Skabelonbaserede implementeringer** - Brug forbyggede skabeloner til almindelige applikationsmønstre
- **Infrastruktur som kode** - Administrer Azure ressourcer med Bicep eller Terraform  
- **Integrerede workflows** - Uproblematiske provisionering, implementering og overvågning af applikationer
- **Udviklervenlig** - Optimeret for udviklerproduktivitet og oplevelse

### **AZD + Microsoft Foundry: Perfekt til AI Implementeringer**

**Hvorfor AZD til AI Løsninger?** AZD håndterer de største udfordringer AI-udviklere møder:

- **AI-Klare Skabeloner** - For-konfigurerede skabeloner til Microsoft Foundry modeller, Azure AI Services og ML workloads
- **Sikre AI Implementeringer** - Indbyggede sikkerhedsmønstre for AI services, API nøgler og modelendepunkter  
- **Produktions AI Mønstre** - Bedste praksis for skalerbar, omkostningseffektiv AI applikationsimplementering
- **End-to-End AI Workflows** - Fra modeludvikling til produktionsimplementering med korrekt overvågning
- **Omkostningsoptimering** - Smarte ressourcefordelings- og skaleringsstrategier for AI workloads
- **Microsoft Foundry Integration** - Problemfri forbindelse til Microsoft Foundry modelkatalog og endepunkter

---

## 🎯 Skabeloner & Eksempelsamling

### Fremhævet: Microsoft Foundry Skabeloner
**Start her hvis du implementerer AI applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI mønstre. Nogle er eksterne Azure Samples, andre er lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Services | Type |
|----------|---------|------------|----------|------|
| [**Kom godt i gang med AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom godt i gang med AI agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævet: Færdige Læringsscenarier
**Produktionsklare applikationsskabeloner tilknyttet læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI implementeringsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligens integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentrammeværk og funktionkald |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Kunde- og Lager-agenter |

### Læring efter Eksempels Type

> **📌 Lokale vs. Eksterne Eksempler:**  
> **Lokale Eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne Eksempler** (Azure Samples) = Klon fra linkede repositories

#### Lokale Eksempler (Klar til Brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fuldstændig produktionsklar implementering med ARM skabeloner
  - Multi-agent arkitektur (Kunde + Lager agenter)
  - Omfattende overvågning og evaluering
  - Én-klik implementering via ARM skabelon

#### Lokale Eksempler - Container Applikationer (Kapitel 2-5)
**Omfattende containerimplementeringseksampler i dette repository:**

- [**Container App Eksempler**](examples/container-app/README.md) - Fuldstændig guide til containeriserede implementeringer
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Grundlæggende REST API med skaler-til-nul
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service implementering
  - Hurtig start, produktion og avancerede implementeringsmønstre
  - Overvågning, sikkerhed og omkostningsoptimeringsvejledning

#### Eksterne Eksempler - Enkle Applikationer (Kapitel 1-2)
**Klon disse Azure Samples repositorier for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende implementeringsmønstre
- [Statisk Hjemmeside - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk indholdsimplementering
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API implementering

#### Eksterne Eksempler - Databaseintegration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelsesmønstre
- [Funktioner + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs dataarbejdsgang

#### Eksterne Eksempler - Avancerede Mønstre (Kapitel 4-8)
- [Java Mikrotjenester](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML mønstre

### Eksterne Skabelonsamlinger
- [**Officiel AZD Skabelongalleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community skabeloner
- [**Azure Developer CLI Skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Eksempelmappen**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige Referencer
- [**Kommandooversigt**](resources/cheat-sheet.md) - Væsentlige azd-kommandoer organiseret efter kapitel
- [**Ordliste**](resources/glossary.md) - Azure og azd terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studievejledning**](resources/study-guide.md) - Omfattende øvelser

### Hands-On Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-implementerbare (2-3 timer)
- [**Interaktiv Workshop**](workshop/README.md) - 8-moduls guidede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Opsamling

### Eksterne Læringsressourcer
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI Agent Kompetencer til Din Editor
- [**Microsoft Azure Kompetencer på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åbne agentfærdigheder til Azure AI, Foundry, implementering, diagnosticering, omkostningsoptimering og mere. Installer dem i GitHub Copilot, Cursor, Claude Code eller enhver understøttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hurtig Fejlfinding Guide

**Almindelige problemer begyndere møder og umiddelbare løsninger:**

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

# Bekræft installation
azd version
```
</details>

<details>
<summary><strong>❌ "Ingen abonnement fundet" eller "Abonnement ikke sat"</strong></summary>

```bash
# List tilgængelige abonnementer
az account list --output table

# Indstil standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Indstil for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Bekræft
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Kvota overskredet"</strong></summary>

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
<summary><strong>❌ "azd up" fejler halvvejs</strong></summary>

```bash
# Mulighed 1: Rens og prøv igen
azd down --force --purge
azd up

# Mulighed 2: Ret kun infrastrukturen
azd provision

# Mulighed 3: Tjek detaljeret status
azd show

# Mulighed 4: Tjek logs i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Godkendelse mislykkedes" eller "Token udløbet"</strong></summary>

```bash
# Genautentificer for AZD
azd auth logout
azd auth login

# Valgfrit: opdater også Azure CLI, hvis du kører az-kommandoer
az logout
az login

# Bekræft autentificering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressourcen findes allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unikke navne, men hvis der opstår konflikt:
azd down --force --purge

# Så prøv igen med et nyt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Skabelonimplementering tager for lang tid</strong></summary>

**Normale ventetider:**
- Simpel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI applikationer: 15-25 minutter (OpenAI udrulning er langsom)

```bash
# Tjek fremskridt
azd show

# Hvis fastlåst >30 minutter, tjek Azure-portalen:
azd monitor --overview
# Se efter mislykkede implementeringer
```
</details>

<details>
<summary><strong>❌ "Tilladelse nægtet" eller "Forbudt"</strong></summary>

```bash
# Tjek din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal have mindst rollen "Bidragyder"
# Bed din Azure-administrator om at give:
# - Bidragyder (for ressourcer)
# - Brugeradgangsadministrator (for rolle tildelinger)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde den implementerede applikations URL</strong></summary>

```bash
# Vis alle tjenesteendepunkter
azd show

# Eller åbn Azure Portal
azd monitor

# Tjek specifik tjeneste
azd env get-values
# Se efter *_URL variable
```
</details>

### 📚 Fuld Fejlfinding Ressourcer

- **Guide til Almindelige Problemer:** [Detaljerede Løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikke Problemer:** [AI Fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Trin-for-trin Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Få Hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusafslutning & Certificering

### Fremdriftssporing
Følg din læringsfremdrift gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtig Start ✅
- [ ] **Kapitel 2**: AI-Første Udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Godkendelse ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Implementering ✅
- [ ] **Kapitel 5**: Multi-Agent AI Løsninger ✅
- [ ] **Kapitel 6**: Forud-implementeringsvalidering & Planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Debugging ✅
- [ ] **Kapitel 8**: Produktion & Enterprise Mønstre ✅

### Læringsverifikation
Efter du har gennemført hvert kapitel, verificer din viden ved at:
1. **Praktisk Øvelse**: Fuldfør kapitlets hands-on implementering
2. **Videnskontrol**: Gennemgå FAQ sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din erfaring i Azure Discord
4. **Næste Kapitel**: Gå til næste kompleksitetsniveau

### Fordele ved Kursusafslutning
Når du har afsluttet alle kapitler, har du:
- **Produktionserfaring**: Implementerede rigtige AI-applikationer til Azure
- **Professionelle Færdigheder**: Enterprise-klare implementeringsevner  
- **Fællesskabsanerkendelse**: Aktiv medlem af Azure udviklerfællesskabet
- **Karrierefremme**: Efterspurgt AZD og AI implementeringsekspertise

---

## 🤝 Fællesskab & Support

### Få Hjælp & Support
- **Tekniske Problemer**: [Rapporter fejl og foreslå funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørgsmål**: [Microsoft Azure Discord Fællesskab](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik Hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Microsoft Foundry Discord

**Seneste afstemningsresultater fra #Azure-kanalen:**
- **45%** af udviklere ønsker at bruge AZD til AI arbejdsbelastninger
- **Topudfordringer**: Multi-service implementeringer, legitimationsstyring, produktionsparathed  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlfinding guides, bedste praksis

**Deltag i vores fællesskab for at:**
- Dele dine AZD + AI erfaringer og få hjælp
- Få adgang til tidlige previews af nye AI-skabeloner
- Bidrage til bedste praksis for AI-implementering
- Påvirke fremtidig AI + AZD funktionsudvikling

### Bidrag til Kurset
Vi byder bidrag velkommen! Læs venligst vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedr eksisterende kapitler og eksempler
- **Nye Eksempler**: Tilføj virkelige scenarier og skabeloner  
- **Oversættelse**: Hjælp med at vedligeholde flersproget understøttelse
- **Fejlrapporter**: Forbedr nøjagtighed og klarhed
- **Fællesskabsstandarder**: Følg vores inklusivt fællesskabsguide

---

## 📄 Kursusinformation

### Licens
Dette projekt er licenseret under MIT-licensen - se [LICENSE](../../LICENSE) filen for detaljer.

### Relaterede Microsoft Læringsressourcer

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
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kerne Læring
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serien
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at starte læringen?**

**Begyndere**: Start med [Kapitel 1: Fundament & Hurtig Start](#-chapter-1-foundation--quick-start)  
**AI Udviklere**: Hop til [Kapitel 2: AI-Første Udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne Udviklere**: Begynd med [Kapitel 3: Konfiguration & Autentifikation](#️-chapter-3-configuration--authentication)

**Næste Skridt**: [Begynd Kapitel 1 - AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->