# AZD For Beginners: En struktureret læringsrejse

![AZD-for-begyndere](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub - overvågere](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub - forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub - stjerner](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske oversættelser (altid opdateret)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (traditionelt, Hongkong)](../zh-HK/README.md) | [Kinesisk (traditionelt, Macau)](../zh-MO/README.md) | [Kinesisk (traditionelt, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malaysisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrækker du at klone lokalt?**
>
> Dette repository indeholder 50+ sprogoversættelser, hvilket betydeligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
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
> Dette giver dig alt, hvad du har brug for for at gennemføre kurset med en meget hurtigere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Hvad er nyt i azd i dag

Azure Developer CLI er vokset ud over traditionelle webapps og API'er. I dag er azd det eneste værktøj til at udrulle **enhver** applikation til Azure — inklusive AI-drevne applikationer og intelligente agenter.

Det betyder følgende for dig:

- **AI-agenter er nu førsteklasses azd-workloads.** Du kan initialisere, udrulle og administrere AI-agentprojekter ved hjælp af det samme `azd init` → `azd up` workflow, du allerede kender.
- **Microsoft Foundry-integration** bringer modeludrulning, agent-hosting og AI-tjenestekonfiguration direkte ind i azd-skabelonøkosystemet.
- **Kerneworkflowet er ikke ændret.** Uanset om du udruller en todo-app, en microservice eller en multi-agent AI-løsning, er kommandoerne de samme.

Hvis du har brugt azd før, er AI-support en naturlig udvidelse — ikke et separat værktøj eller en avanceret gren. Hvis du starter forfra, lærer du ét workflow, der fungerer for alt.

---

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det simpelt at udrulle applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer, kan du udrulle hele applikationer med en enkelt kommando.

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

**Det var det!** Ingen klik i Azure-portalen, ingen komplekse ARM-templates, du først skal lære, ingen manuel konfiguration - bare fungerende applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hvad er forskellen?

Dette er det mest almindelige spørgsmål, begyndere stiller. Her er det simple svar:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Purpose** | Administrer individuelle Azure-ressourcer | Udrul komplette applikationer |
| **Mindset** | Infrastrukturfokuseret | Applikationsfokuseret |
| **Example** | `az webapp create --name myapp...` | `azd up` |
| **Learning Curve** | Skal kende Azure-tjenester | Kendskab til din app er nok |
| **Best For** | DevOps, Infrastruktur | Udviklere, Prototyping |

### Enkel analogi

- **Azure CLI** er som at have alle værktøjerne til at bygge et hus - hamre, save, søm. Du kan bygge alt, men du skal kende byggeteknik.
- **Azure Developer CLI** er som at hyre en entreprenør - du beskriver, hvad du vil have, og de tager sig af byggeriet.

### Hvornår man skal bruge hver

| Scenarie | Brug dette |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### De fungerer sammen!

AZD bruger Azure CLI under motorhjelmen. Du kan bruge begge:
```bash
# Udrul din app med AZD
azd up

# Derefter finjuster specifikke ressourcer med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find skabeloner i Awesome AZD

Start ikke fra bunden! **Awesome AZD** er fællesskabets samling af klar-til-udrulning skabeloner:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Gennemse 200+ skabeloner med ét-klik udrulning |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til fællesskabet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Giv stjerne og udforsk koden |

### Populære AI-skabeloner fra Awesome AZD

```bash
# RAG Chat med Microsoft Foundry-modeller + AI-søgning
azd init --template azure-search-openai-demo

# Hurtig AI Chat-applikation
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom godt i gang på 3 trin

Før du starter, skal du sikre dig, at din maskine er klar til den skabelon, du vil udrulle:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Hvis en af de krævede tjek mislykkes, skal du rette det først og derefter fortsætte med hurtigstarten.

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
# Valgfrit hvis du planlægger at bruge Azure CLI-kommandoer direkte i dette kursus
az login

# Påkrævet for AZD-arbejdsgange
azd auth login
```

Hvis du er i tvivl om, hvilken du skal bruge, følg hele opsætningsflowet i [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Trin 3: Udrul din første app

```bash
# Initialiser fra en skabelon
azd init --template todo-nodejs-mongo

# Udrul til Azure (opretter alt!)
azd up
```

**🎉 Sådan!** Din app er nu live på Azure.

### Oprydning (glem ikke!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Sådan bruger du dette kursus

Dette kursus er designet til **progressiv læring** - start, hvor du er tryg, og arbejd dig opad:

| Din erfaring | Start her |
|-----------------|------------|
| **Ny til Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Kender Azure, ny til AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Vil udrulle AI-apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Ønsker praktisk erfaring** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 timers guidet lab |
| **Brug for produktionsmønstre** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Hurtig opsætning

1. **Fork dette repository**: [![GitHub - forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord-fællesskab](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker du at klone lokalt?**

> Dette repository indeholder 50+ sprogoversættelser, hvilket betydeligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du har brug for for at gennemføre kurset med en meget hurtigere download.


## Kursusoversigt

Mestrer Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på udrulning af AI-applikationer med Microsoft Foundry-integration.**

### Hvorfor dette kursus er vigtigt for moderne udviklere

Baseret på Microsoft Foundry Discord-fællesskabets indsigt ønsker **45% af udviklerne at bruge AZD til AI-workloads**, men møder udfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Bedste praksis for produktion af AI-udrulning  
- Integration og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-workloads
- Fejlsøgning af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD-grundprincipperne**: Kernekoncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementere Infrastruktur som kode**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlfinde udrulninger**: Løs almindelige problemer og debug fejl
- **Optimér til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Byg multi-agent løsninger**: Udrul komplekse AI-arkitekturer

## Før du går i gang: Konti, adgang og forudsætninger

Før du begynder kapitel 1, skal du sikre dig, at du har følgende på plads. Installationstrinene senere i denne guide antager, at disse grundlæggende ting allerede er håndteret.
- **Et Azure-abonnement**: Du kan bruge et eksisterende abonnement fra arbejde eller din egen konto, eller oprette en [free trial](https://aka.ms/azurefreetrial) for at komme i gang.
- **Tilladelse til at oprette Azure-ressourcer**: For de fleste øvelser bør du have mindst **Contributor**-adgang på det målrettede abonnement eller resource group. Nogle kapitler kan også forudsætte, at du kan oprette resource groups, managed identities og RBAC-tilknytninger.
- [**En GitHub-konto**](https://github.com): Dette er nyttigt til at fork'e repositoryet, spore dine egne ændringer og bruge GitHub Codespaces til workshoppen.
- **Krav til skabelonens runtime**: Nogle skabeloner kræver lokale værktøjer som Node.js, Python, Java eller Docker. Kør setup-validatoren inden du starter, så du opdager manglende værktøjer tidligt.
- **Grundlæggende kendskab til terminalen**: Du behøver ikke være ekspert, men du bør være tryg ved at køre kommandoer som `git clone`, `azd auth login` og `azd up`.

> **Arbejder du i et virksomhedsabonnement?**
> Hvis dit Azure-miljø administreres af en administrator, bekræft på forhånd, at du kan implementere ressourcer i det abonnement eller den resource group, du planlægger at bruge. Hvis ikke, bed om et sandbox-abonnement eller Contributor-adgang, før du starter.

> **Ny i Azure?**
> Start med din egen Azure-prøvekonto eller pay-as-you-go-abonnement på https://aka.ms/azurefreetrial, så du kan gennemføre øvelserne fra start til slut uden at vente på godkendelser på lejer-niveau.

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Ch 1: Grundlag](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD-grundprincipper](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Dit første projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-første apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI Agents](docs/chapter-02-ai-development/agents.md) &#124; [Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Autentificering & Sikkerhed | [Configuration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Security](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Udrulning | [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agent-løsninger | [Retail Scenario](examples/retail-scenario.md) &#124; [Coordination Patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planlægning & Validering | [Preflight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Fejlretning & Rettelse | [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI Issues](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Enterprise Patterns | [Production Practices](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On Lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Total Course Duration:** ~10-14 hours | **Skill Progression:** Beginner → Production-Ready

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Chapter 1: Foundation & Quick Start
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du vil lære
- Forståelse af Azure Developer CLI-grundprincipper
- Installere AZD på din platform
- Din første succesfulde udrulning

#### Læringsressourcer
- **🎯 Start her**: [What is Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD-grundprincipper](docs/chapter-01-foundation/azd-basics.md) - Kernebegreber og terminologi
- **⚙️ Opsætning**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platformspecifikke vejledninger
- **🛠️ Praktisk**: [Dit første projekt](docs/chapter-01-foundation/first-project.md) - Trin-for-trin tutorial
- **📋 Hurtig reference**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Hurtig installationskontrol
azd version

# Udrul din første applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapiteludbytte**: Udrul med succes en simpel webapplikation til Azure ved hjælp af AZD

**✅ Succesvalidering:**
```bash
# Efter at have gennemført kapitel 1, bør du kunne:
azd version              # Viser den installerede version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                  # Udruller til Azure
azd show                # Viser URL'en for den kørende app
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcerne
```

**📊 Tidsforbrug:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan udrulle grundlæggende applikationer selvstændigt
**📈 Færdighedsniveau efter:** Kan udrulle grundlæggende applikationer selvstændigt

---

### 🤖 Chapter 2: AI-First Development (Anbefalet for AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Microsoft Foundry-integration med AZD
- Udrulning af AI-drevne applikationer
- Forståelse af AI-tjenestes konfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Udrul intelligente agenter med AZD
- **📖 Mønstre**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klar
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browser-baseret læring med MkDocs * DevContainer Environment
- **📋 Skabeloner**: [Microsoft Foundry Templates](#workshopressourcer)
- **📝 Eksempler**: [AZD Deployment Examples](examples/README.md)

#### Praktiske øvelser
```bash
# Udrul din første AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prøv flere AI-skabeloner
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapiteludbytte**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-muligheder

**✅ Succesvalidering:**
```bash
# Efter kapitel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-drevne svar med kilder
# Bekræft, at søgeintegrationen fungerer
azd monitor  # Kontroller, at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsforbrug:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå $80-150/måned i udviklingsomkostninger, $300-3500/måned i produktionsomkostninger

#### 💰 Omkostningshensyn ved AI-udrulninger

**Udviklingsmiljø (anslået $80-150/måned):**
- Microsoft Foundry Models (Pay-as-you-go): $0-50/month (based on token usage)
- AI Search (Basic tier): $75/month
- Container Apps (Consumption): $0-20/month
- Storage (Standard): $1-5/month

**Produktionsmiljø (anslået $300-3,500+/måned):**
- Microsoft Foundry Models (PTU for konsistent ydeevne): $3,000+/month OR Pay-as-go with high volume
- AI Search (Standard tier): $250/month
- Container Apps (Dedicated): $50-100/month
- Application Insights: $5-50/month
- Storage (Premium): $10-50/month

**💡 Tips til omkostningsoptimering:**
- Brug **Free Tier** Microsoft Foundry Models til læring (Azure OpenAI 50,000 tokens/month included)
- Kør `azd down` for at deallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` for at estimere omkostninger før udrulning
- Aktivér autoskalering: betal kun for faktisk brug

**Omkostningsovervågning:**
```bash
# Kontroller estimerede månedlige omkostninger
azd provision --preview

# Overvåg de faktiske omkostninger i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Chapter 3: Configuration & Authentication
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Miljøkonfiguration og -styring
- Autentificering og sikkerhedsbest practices
- Ressource-navngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Autentificeringsmønstre
- **📝 Eksempler**: [Database App Example](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity-authentificering
- Implementer miljøspecifikke konfigurationer

**💡 Kapiteludbytte**: Administrer flere miljøer med korrekt autentificering og sikkerhed

---

### 🏗️ Chapter 4: Infrastructure as Code & Deployment
**Forudsætninger**: Kapitel 1-3 gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hvad du vil lære
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressourceprovisionering

#### Læringsressourcer
- **📖 Udrulning**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Komplette workflows
- **🏗️ Provisioning**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure ressourcestyring
- **📝 Eksempler**: [Container App Example](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Udrul multi-service applikationer
- Implementer blue-green udrulningsstrategier

**💡 Kapiteludbytte**: Udrul komplekse multi-service applikationer ved hjælp af brugerdefinerede infrastrukturskabeloner

---

### 🎯 Chapter 5: Multi-Agent AI Solutions (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Multi-agent arkitekturmønstre
- Agentorkestrering og koordinering
- Produktionsklare AI-udrulninger

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Fuld implementation
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-click udrulning
- **📖 Arkitektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Udrul den komplette multiagentløsning til detailhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapiteludbytte**: Udrul og administrer en produktionsklar multi-agent AI-løsning med Customer- og Inventory-agenter

---

### 🔍 Chapter 6: Pre-Deployment Validation & Planning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐
#### Hvad du vil lære
- Kapacitetsplanlægning og validering af ressourcer
- Strategier for valg af SKU'er
- Pre-flight-tjek og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validering af ressourcer
- **💰 Valg**: [Valg af SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimer valg af SKU'er for omkostninger
- Implementer automatiserede pre-udrulningskontroller

**💡 Kapitelresultat**: Valider og optimer udrulninger før udførelse

---

### 🚨 Kapitel 7: Fejlfinding & Fejlretning
**Forudsætninger**: Et hvilket som helst udrulningskapitel gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske fejlfindingsmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Fejlretningsvejledning](docs/chapter-07-troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-specifik fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske øvelser
- Diagnosticer udrulningsfejl
- Løs autentificeringsproblemer
- Debug AI-tjenesteforbindelse

**💡 Kapitelresultat**: Diagnosticer og løs almindelige udrulningsproblemer selvstændigt

---

### 🏢 Kapitel 8: Produktions- og virksomhedsmønstre
**Forudsætninger**: Kapitler 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Strategier for produktionsudrulning
- Sikkerhedsmønstre for virksomheder
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Bedste praksis for AI i produktion](docs/chapter-08-production/production-ai-practices.md) - Virksomhedsmønstre
- **📝 Eksempler**: [Microservices Example](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Application Insights-integration](docs/chapter-06-pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementer sikkerhedsmønstre for virksomheder
- Opsæt omfattende overvågning
- Udrul til produktion med korrekt governance

**💡 Kapitelresultat**: Udrul virksomhedsklare applikationer med fuld produktionsfunktionalitet

---

## 🎓 Workshopoversigt: Praktisk læringsoplevelse

> **⚠️ WORKSHOP STATUS: Under aktiv udvikling**  
> Workshopmaterialerne udvikles og finpudses i øjeblikket. Kernemodulerne er funktionelle, men nogle avancerede sektioner er ufuldstændige. Vi arbejder aktivt på at færdiggøre alt indhold. [Spor fremdrift →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende hands-on læring med browserbaserede værktøjer og guidede øvelser**

Vores workshopmaterialer giver en struktureret, interaktiv læringsoplevelse, der supplerer kapitelbaseret pensum ovenfor. Workshoppen er designet til både selvstyret læring og instruktørledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browserbaseret grænseflade**: Fuldstændig MkDocs-drevet workshop med søge-, kopi- og temafunktioner
- **Integration med GitHub Codespaces**: Én-klik opsætning af udviklingsmiljø
- **Struktureret læringsforløb**: 8-moduls guidede øvelser (3-4 timer i alt)
- **Progressiv metodik**: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Opsummering
- **Interaktivt DevContainer-miljø**: Forhåndskonfigurerede værktøjer og afhængigheder

#### 📚 Workshopmodulstruktur
Workshoppen følger en **8-moduls progressiv metodik**, der tager dig fra opdagelse til mestre udrulning:

| Modul | Emne | Hvad du gør | Varighed |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshopoversigt | Forstå læringsmål, forudsætninger og workshopstruktur | 15 min |
| **1. Udvælgelse** | Skabelonopdagelse | Gennemse AZD-skabeloner og vælg den rette AI-skabelon til dit scenarie | 20 min |
| **2. Validering** | Udrul og verificer | Udrul skabelonen med `azd up` og valider, at infrastrukturen virker | 30 min |
| **3. Nedbrydning** | Forstå struktur | Brug GitHub Copilot til at udforske skabelonarkitektur, Bicep-filer og kodeorganisation | 30 min |
| **4. Konfiguration** | azure.yaml-dybdegående gennemgang | Mestring af `azure.yaml`-konfiguration, lifecycle hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gør det til dit | Aktivér AI Search, tracing, evaluering, og tilpas til dit scenarie | 45 min |
| **6. Nedtagning** | Oprydning | Deprovisioner ressourcer sikkert med `azd down --purge` | 15 min |
| **7. Opsummering** | Næste skridt | Gennemgå resultater, nøglekoncepter og fortsæt din læringsrejse | 15 min |

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
# Følg opsætningsvejledningen i workshop/README.md
```

#### 🎯 Workshop-læringsmål
Ved at gennemføre workshoppen vil deltagerne:
- **Udrul produktions-AI-applikationer**: Brug AZD med Microsoft Foundry-tjenesterne
- **Behersk multi-agent-arkitekturer**: Implementer koordinerede AI-agentløsninger
- **Implementér sikkerhedspraksis**: Konfigurer autentificering og adgangskontrol
- **Optimer til skala**: Design omkostningseffektive, ydelsesoptimerede udrulninger
- **Fejlfind udrulninger**: Løs almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv guide**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læringsmiljø
- **📋 Modul-for-modul instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshopoversigt og mål
  - [1. Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) - Find og vælg AI-skabeloner
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Udrul og verificer skabeloner
  - [3. Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Udforsk skabelonarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestring af azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpas til dit scenarie
  - [6. Nedtagning](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ryd op i ressourcer
  - [7. Opsummering](workshop/docs/instructions/7-Wrap-up.md) - Gennemgang og næste skridt
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Kom godt i gang**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler-bootcamps.

---

## 📖 Dybdegående: AZD-muligheder

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsudrulninger:

- **Template-based deployments** - Brug færdigbyggede skabeloner til almindelige applikationsmønstre
- **Infrastructure as Code** - Administrer Azure-ressourcer ved hjælp af Bicep eller Terraform  
- **Integrated workflows** - Problemfri provisioning, udrulning og overvågning af applikationer
- **Developer-friendly** - Optimeret til udviklerproduktivitet og brugeroplevelse

### **AZD + Microsoft Foundry: Perfekt til AI-udrulninger**

**Hvorfor AZD til AI-løsninger?** AZD håndterer de største udfordringer, AI-udviklere står overfor:

- **AI-Ready Templates** - Forhåndskonfigurerede skabeloner til Microsoft Foundry-modeller, Cognitive Services og ML-workloads
- **Secure AI Deployments** - Indbyggede sikkerhedsmønstre til AI-tjenester, API-nøgler og modelendepunkter  
- **Production AI Patterns** - Bedste praksis for skalerbare, omkostningseffektive AI-applikationsudrulninger
- **End-to-End AI Workflows** - Fra modeludvikling til produktionsudrulning med korrekt overvågning
- **Cost Optimization** - Smart ressourceallokering og skaleringsstrategier for AI-workloads
- **Microsoft Foundry Integration** - Problemfri forbindelse til Microsoft Foundry-modelkataloget og endepunkter

---

## 🎯 Skabeloner & Eksempelsbibliotek

### Fremhævede: Microsoft Foundry-skabeloner
**Start her, hvis du udruller AI-applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure Samples, andre er lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævede: Komplette læringsscenarier
**Produktionsklare applikationsskabeloner tilknyttet læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Hovedlæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI-udrulningsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration af Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent-rammeværk og function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent-arkitektur med Customer- og Inventory-agenter |

### Læring efter eksempeltype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Klon fra de linkede repositories

#### Lokale eksempler (klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fuldt produktionsklar implementering med ARM-skabeloner
  - Multi-agent-arkitektur (Customer + Inventory agents)
  - Omfattende overvågning og evaluering
  - Én-klik udrulning via ARM-skabelon

#### Lokale eksempler - Containerapplikationer (Kapitler 2-5)
**Omfattende container-udrulningseksempler i dette repository:**
- [**Container App Examples**](examples/container-app/README.md) - Komplet guide til containeriserede udrulninger
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Grundlæggende REST API med scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produktionsklar multi-service udrulning
  - Quick Start, Produktion og Avancerede udrulningsmønstre
  - Vejledning om overvågning, sikkerhed og omkostningsoptimering

#### Eksterne eksempler - Simple applikationer (Kapitler 1-2)
**Klon disse Azure Samples-repositorier for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende udrulningsmønstre
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Udrulning af statisk indhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Udrulning af REST API

#### Eksterne eksempler - Databaseintegration (Kapitel 3-4)
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelsesmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløs dataworkflow

#### Eksterne eksempler - Avancerede mønstre (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arkitekturer med flere tjenester
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelonsamlinger
- [**Officiel AZD-skabelongalleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI-skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn-skabelondokumentation
- [**Eksempelmappen**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige reference
- [**Kommandooversigt**](resources/cheat-sheet.md) - Væsentlige azd-kommandoer organiseret efter kapitel
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende øvelser

### Praktiske workshops
- [**AI-workshop-lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-udrulningsklare (2-3 timer)
- [**Interaktiv workshop**](workshop/README.md) - 8-modulede guidede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Valg → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Afrunding

### Eksterne læringsressourcer
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### AI-agentfærdigheder til din editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åbne agent-færdigheder til Azure AI, Foundry, udrulning, diagnostik, omkostningsoptimering og mere. Installer dem i GitHub Copilot, Cursor, Claude Code, eller enhver understøttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hurtig fejlsøgningsguide

**Almindelige problemer, som begyndere møder, og øjeblikkelige løsninger:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

```bash
# Vis tilgængelige abonnementer
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
<summary><strong>❌ "InsufficientQuota" or "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" fails halfway through</strong></summary>

```bash
# Mulighed 1: Rens og prøv igen
azd down --force --purge
azd up

# Mulighed 2: Bare ret infrastrukturen
azd provision

# Mulighed 3: Kontroller detaljeret status
azd show

# Mulighed 4: Kontroller logfiler i Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" or "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" or naming conflicts</strong></summary>

```bash
# AZD genererer unikke navne, men hvis der opstår konflikt:
azd down --force --purge

# Prøv igen med et nyt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template deployment taking too long</strong></summary>

**Normale ventetider:**
- Simpel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikationer: 15-25 minutter (OpenAI-udrulning er langsom)

```bash
# Tjek fremdriften
azd show

# Hvis fast >30 minutter, tjek Azure-portalen:
azd monitor --overview
# Se efter mislykkede udrulninger
```
</details>

<details>
<summary><strong>❌ "Permission denied" or "Forbidden"</strong></summary>

```bash
# Kontroller din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal have mindst rollen "Contributor".
# Bed din Azure-administrator om at tildele:
# - Contributor (til ressourcer)
# - User Access Administrator (til tildeling af roller)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

```bash
# Vis alle serviceendepunkter
azd show

# Eller åbn Azure-portalen
azd monitor

# Kontroller en specifik tjeneste
azd env get-values
# Søg efter *_URL-variabler
```
</details>

### 📚 Fuldstændige fejlsøgningsressourcer

- **Vejledning til almindelige problemer:** [Detaljerede løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikke problemer:** [AI-fejlsøgning](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Fejlfindingsvejledning:** [Trin-for-trin fejlfinding](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusafslutning & Certificering

### Fremdriftssporing
Følg din læringsfremgang gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtig start ✅
- [ ] **Kapitel 2**: AI-fokuseret udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentificering ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapitel 6**: Forudgående validering & planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Fejlretning ✅
- [ ] **Kapitel 8**: Produktions- & Enterprise-mønstre ✅

### Læringsverifikation
Efter at have gennemført hvert kapitel, verificer din viden ved at:
1. **Praktisk øvelse**: Fuldfør kapitlets praktiske udrulning
2. **Videnstjek**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din oplevelse i Azure Discord
4. **Næste kapitel**: Gå videre til næste kompleksitetsniveau

### Fordele ved kursusafslutning
Når du har gennemført alle kapitler, vil du have:
- **Produktionserfaring**: Udrullet ægte AI-applikationer på Azure
- **Professionelle færdigheder**: Enterprise-klar udrulningskapacitet  
- **Fællesskabsanerkendelse**: Aktivt medlem af Azure-udviklerfællesskabet
- **Karrierefremme**: Eftertragtet AZD- og AI-udrulningskompetence

---

## 🤝 Fællesskab & Support

### Få hjælp & support
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørgsmål**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Microsoft Foundry Discord

**Seneste meningsmåleresultater fra #Azure-kanalen:**
- **45%** af udviklere ønsker at bruge AZD til AI-arbejdsbelastninger
- **Topudfordringer**: Udrulninger med flere tjenester, håndtering af legitimationsoplysninger, produktionsparathed  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlsøgningsvejledninger, bedste praksis

**Deltag i vores fællesskab for at:**
- Del dine AZD + AI-oplevelser og få hjælp
- Få adgang til tidlige forhåndsvisninger af nye AI-skabeloner
- Bidrage til bedste praksis for AI-udrulning
- Påvirke fremtidig AI + AZD funktionsudvikling

### Bidrage til kurset
Vi byder bidrag velkommen! Læs venligst vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedre eksisterende kapitler og eksempler
- **Nye eksempler**: Tilføj virkelige scenarier og skabeloner  
- **Oversættelse**: Hjælp med at vedligeholde flersproget support
- **Fejlrapporter**: Forbedre nøjagtighed og klarhed
- **Fællesskabsstandarder**: Følg vores inkluderende fællesskabsretningslinjer

---

## 📄 Kursusinformation

### Licens
Dette projekt er licenseret under MIT-licensen - se filen [LICENSE](../../LICENSE) for detaljer.

### Relaterede Microsoft-læringsressourcer

Vores team producerer andre omfattende læringskurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j for begyndere](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for begyndere](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for begyndere](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD for begyndere](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for begyndere](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for begyndere](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI Agents for begyndere](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI for begyndere](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kerne-læring
[![ML for begyndere](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Begyndere](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Begyndere](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersikkerhed for Begyndere](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webudvikling for Begyndere](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Begyndere](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-udvikling for Begyndere](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot til AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot til C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-Eventyr](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde at lære?**

**Begyndere**: Start med [Kapitel 1: Grundlæggende & Hurtig start](#-chapter-1-foundation--quick-start)  
**AI-udviklere**: Gå til [Kapitel 2: AI-først udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & Autentificering](#️-chapter-3-configuration--authentication)

**Næste trin**: [Begynd Kapitel 1 - AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på præcision, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->