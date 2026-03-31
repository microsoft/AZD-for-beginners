# AZD for begyndere: En struktureret læringsrejse

![AZD-til-begyndere](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske oversættelser (altid opdateret)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengalsk](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (Traditionelt, Hongkong)](../zh-HK/README.md) | [Kinesisk (Traditionelt, Macau)](../zh-MO/README.md) | [Kinesisk (Traditionelt, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malayisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk Pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (Filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrækker du at klone lokalt?**
>
> Dette repository inkluderer 50+ sprogoversættelser, hvilket betydeligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
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

## 🆕 Hvad er nyt i azd i dag

Azure Developer CLI er vokset ud over traditionelle webapps og API'er. I dag er azd det eneste værktøj til at udrulle enhver applikation til Azure — inklusive AI-drevne applikationer og intelligente agenter.

Det betyder følgende for dig:

- **AI-agenter er nu førsteklasses azd-workloads.** Du kan initialisere, udrulle og administrere AI-agentprojekter ved hjælp af den samme `azd init` → `azd up` arbejdsflow, du allerede kender.
- **Microsoft Foundry-integration** bringer modeludrulning, agenthosting og AI-tjenestekonfiguration direkte ind i azd-skabelonøkosystemet.
- **Kernearbejdsgangen er ikke ændret.** Uanset om du udruller en todo-app, en microservice eller en multi-agent AI-løsning, er kommandoerne de samme.

Hvis du har brugt azd før, er AI-understøttelse en naturlig udvidelse — ikke et separat værktøj eller et avanceret spor. Hvis du starter fra bunden, lærer du ét arbejdsflow, der virker til alt.

---

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det enkelt at udrulle applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer, kan du udrulle komplette applikationer med en enkelt kommando.

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

**Det er det!** Ingen klik i Azure-portalen, ingen komplekse ARM-skabeloner at lære først, ingen manuel konfiguration - bare fungerende applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hvad er forskellen?

Det her er det mest almindelige spørgsmål, begyndere stiller. Her er det simple svar:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrer individuelle Azure-ressourcer | Udrul komplette applikationer |
| **Tankegang** | Infrastruktur-fokuseret | Applikations-fokuseret |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Indlæringskurve** | Skal kende Azure-tjenester | Kender bare din app |
| **Bedst til** | DevOps, Infrastruktur | Udviklere, Prototyping |

### En simpel analogi

- **Azure CLI** er som at have alle værktøjerne til at bygge et hus - hammere, save, søm. Du kan bygge alt, men du skal kende byggeteknik.
- **Azure Developer CLI** er som at hyre en entreprenør - du beskriver, hvad du vil have, og de klarer byggeriet.

### Hvornår man bruger hvilken

| Scenarie | Brug dette |
|----------|----------|
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

| Resource | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Gennemse 200+ skabeloner med ét-klik-udrulning |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til fællesskabet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Giv stjerne og udforsk koden |

### Populære AI-skabeloner fra Awesome AZD

```bash
# RAG Chat med Microsoft Foundry Modeller + AI Søgning
azd init --template azure-search-openai-demo

# Hurtig AI Chat Applikation
azd init --template openai-chat-app-quickstart

# AI Agenter med Foundry Agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom i gang på 3 trin

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

### Trin 2: Log ind på Azure

```bash
azd auth login
```

### Trin 3: Udrul din første app

```bash
# Initialiser fra en skabelon
azd init --template todo-nodejs-mongo

# Udrul til Azure (opretter alt!)
azd up
```

**🎉 Så er det!** Din app er nu live på Azure.

### Ryd op (Glem ikke!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Sådan bruger du dette kursus

Dette kursus er designet til **progressiv læring** - start hvor du er komfortabel, og arbejd dig opad:

| Din erfaring | Start her |
|-----------------|------------|
| **Helt ny i Azure** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Kender Azure, ny til AZD** | [Chapter 1: Foundation](#-chapter-1-foundation--quick-start) |
| **Vil udrulle AI-apps** | [Chapter 2: AI-First Development](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Vil have praktisk træning** | [🎓 Interactive Workshop](workshop/README.md) - 3-4 hour guided lab |
| **Brug for produktionsmønstre** | [Chapter 8: Production & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Hurtig opsætning

1. **Fork dette repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker du at klone lokalt?**

> Dette repository inkluderer 50+ sprogoversættelser, hvilket betydeligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.


## Kursusoversigt

Behersk Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på udrulning af AI-applikationer med Microsoft Foundry-integration.**

### Hvorfor dette kursus er vigtigt for moderne udviklere

Baseret på Microsoft Foundry Discord-fællesskabets indsigt ønsker **45% af udviklerne at bruge AZD til AI-workloads**, men støder på udfordringer med:
- Komplekse multi-service AI-arkitekturer
- Bedste praksis for AI-udrulning i produktion  
- Integration og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-workloads
- Fejlsøgning af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD's grundprincipper**: kernekoncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementere Infrastruktur som kode**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlsøge udrulninger**: Løs almindelige problemer og fejlret
- **Optimere til produktion**: sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge multi-agent-løsninger**: Udrul komplekse AI-arkitekturer

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Hvert kapitel har en dedikeret README med læringsmål, quick starts og øvelser:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [First Project](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap 2: AI-udvikling](docs/chapter-02-ai-development/README.md)** | AI-fokuserede apps | [Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [AI-modeludrulning](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kap 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Autentificering & Sikkerhed | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Autentificering & sikkerhed](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kap 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Udrulning | [Udrulningsvejledning](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kap 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Detailhandelsscenarie](examples/retail-scenario.md) &#124; [Koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kap 6: Forud-udrulning](docs/chapter-06-pre-deployment/README.md)** | Planlægning & Validering | [Forudgående kontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Valg af SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kap 7: Fejlfinding](docs/chapter-07-troubleshooting/README.md)** | Fejlfinding & Løsning | [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Fejlsøgning](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kap 8: Produktion](docs/chapter-08-production/README.md)** | Virksomhedsmønstre | [Produktionspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On-lab | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruktion](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedtagning af infrastruktur](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afslutning](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Samlet kursusvarighed:** ~10-14 timer | **Kompetencetrin:** Begynder → Produktionsklar

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaring og mål*

### 🚀 Kapitel 1: Grundlag & Hurtig start
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du vil lære
- Forstå Azure Developer CLI's grundprincipper
- Installere AZD på din platform
- Din første succesfulde udrulning

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Teori**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernebegreber og terminologi
- **⚙️ Opsætning**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Platformsspecifikke vejledninger
- **🛠️ Praktisk**: [Dit første projekt](docs/chapter-01-foundation/first-project.md) - Trin-for-trin vejledning
- **📋 Hurtig reference**: [Kommando-oversigt](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Hurtig installationskontrol
azd version

# Udrul din første applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Udrul en simpel webapplikation til Azure ved hjælp af AZD

**✅ Succesvalidering:**
```bash
# Efter at have gennemført Kapitel 1 skal du kunne:
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

### 🤖 Kapitel 2: AI-først udvikling (Anbefales til AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Microsoft Foundry-integration med AZD
- Udrulning af AI-drevne applikationer
- Forstå AI-tjenesters konfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agent-vejledning](docs/chapter-02-ai-development/agents.md) - Udrul intelligente agenter med AZD
- **📖 Mønstre**: [AI-modeludrulning](docs/chapter-02-ai-development/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klare
- **🎥 Interaktiv vejledning**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læring med MkDocs * DevContainer-miljø
- **📋 Skabeloner**: [Microsoft Foundry Templates](#dybdegående-azd-funktioner)
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

**💡 Kapitelresultat**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktioner

**✅ Succesvalidering:**
```bash
# Efter Kapitel 2 skal du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-drevne svar med kilder
# Bekræft, at søgeintegrationen fungerer
azd monitor  # Tjek, at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsforbrug:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå udviklingsomkostninger på $80-150/måned, produktionsomkostninger $300-3500/måned

#### 💰 Omkostningshensyn for AI-udrulninger

**Udviklingsmiljø (estimeret $80-150/måned):**
- Microsoft Foundry Models (Betal efter forbrug): $0-50/måned (baseret på token-forbrug)
- AI Search (Basic-tier): $75/måned
- Container Apps (Forbrug): $0-20/måned
- Storage (Standard): $1-5/måned

**Produktionsmiljø (estimeret $300-3.500+/måned):**
- Microsoft Foundry Models (PTU for konsistent ydeevne): $3.000+/måned ELLER Betal efter forbrug ved højt volumen
- AI Search (Standard-tier): $250/måned
- Container Apps (Dedikeret): $50-100/måned
- Application Insights: $5-50/måned
- Storage (Premium): $10-50/måned

**💡 Tips til omkostningsoptimering:**
- Brug **Free Tier** Microsoft Foundry Models til læring (Azure OpenAI inkluderer 50.000 tokens/måned)
- Kør `azd down` for at afallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` for at estimere omkostninger før udrulning
- Aktivér autoskalering: betal kun for faktisk brug

**Omkostningsovervågning:**
```bash
# Kontroller estimerede månedlige omkostninger
azd provision --preview

# Overvåg faktiske omkostninger i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentificering
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Miljøkonfiguration og -styring
- Autentificering og sikkerhedspraksis
- Ressource-navngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Autentificeringsmønstre
- **📝 Eksempler**: [Database App Example](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity-autentificering
- Implementer miljøspecifikke konfigurationer

**💡 Kapitelresultat**: Administrer flere miljøer med korrekt autentificering og sikkerhed

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
- **📖 Udrulning**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Komplette arbejdsprocesser
- **🏗️ Provisionering**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure-ressourcestyring
- **📝 Eksempler**: [Container App Example](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Udrul multi-service-applikationer
- Implementer blue-green udrulningsstrategier

**💡 Kapitelresultat**: Udrul komplekse multi-service-applikationer ved hjælp af brugerdefinerede infrastrukturskabeloner

---

### 🎯 Kapitel 5: Multi-agent AI-løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Multi-agent arkitekturmønstre
- Agentorkestrering og koordination
- Produktionsklare AI-udrulninger

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Færdig implementering
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klik udrulning
- **📖 Arkitektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Udrul den komplette multi-agent-løsning til detailhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Udrul og administrer en produktionsklar multi-agent AI-løsning med Kunde- og Lageragenter

---

### 🔍 Kapitel 6: Validering & planlægning før udrulning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Kapacitetsplanlægning og ressourcevalidering
- Strategier for valg af SKU
- Forudgående checks og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Valg**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimer SKU-valg for omkostninger
- Implementer automatiserede forud-udrulningskontroller

**💡 Kapitelresultat**: Valider og optimer udrulninger før eksekvering

---

### 🚨 Kapitel 7: Fejlfinding & Fejlsøgning
**Forudsætninger**: Ethvert udrulningskapitel gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske fejlsøgningsmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Fejlsøgning**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-tjenesteproblemer

#### Praktiske øvelser
- Diagnostiser udrulningsfejl
- Løs autentificeringsproblemer
- Fejlsøg AI-tjenesteforbindelser

**💡 Kapitelresultat**: Selvstændigt diagnosticere og løse almindelige udrulningsproblemer

---

### 🏢 Kapitel 8: Produktion & Virksomhedsmønstre
**Forudsætninger**: Kapitel 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Læringsressourcer
- **🏭 Produktion**: [Bedste fremgangsmåder for produktions-AI](docs/chapter-08-production/production-ai-practices.md) - Virksomhedsmønstre
- **📝 Eksempler**: [Microservices-eksempel](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Application Insights-integration](docs/chapter-06-pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementer virksomheds-sikkerhedsmønstre
- Opsæt omfattende overvågning
- Udrul til produktion med korrekt styring

**💡 Kapitelresultat**: Udrul virksomhedsparate applikationer med fulde produktionsfunktioner

---

## 🎓 Workshopoversigt: Praktisk læringsoplevelse

> **⚠️ WORKSHOP STATUS: Aktiv udvikling**  
> Workshopmaterialerne er i øjeblikket under udvikling og forfinelse. Kernemoduler er funktionelle, men nogle avancerede sektioner er ufuldstændige. Vi arbejder aktivt på at færdiggøre alt indhold. [Følg fremdriften →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende praktisk læring med browserbaserede værktøjer og vejledte øvelser**

Vores workshopmaterialer giver en struktureret, interaktiv læringsoplevelse, der supplerer det kapitelbaserede pensum ovenfor. Workshoppen er designet til både selvstyret læring og instruktørledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browserbaseret grænseflade**: Fuldstændig MkDocs-drevet workshop med søgning, kopiering og tema-funktioner
- **Integration med GitHub Codespaces**: Opsætning af udviklingsmiljø med ét klik
- **Struktureret læringsforløb**: 8-moduls vejledte øvelser (3-4 timer i alt)
- **Progressiv metodologi**: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Oprydning → Afrunding
- **Interaktivt DevContainer-miljø**: Forhåndskonfigurerede værktøjer og afhængigheder

#### 📚 Workshop modulstruktur
Workshoppen følger en **8-moduls progressiv metodologi**, der tager dig fra opdagelse til udrulnings-mestring:

| Modul | Emne | Hvad du vil gøre | Varighed |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshopoversigt | Forstå læringsmål, forudsætninger og workshopstruktur | 15 min |
| **1. Udvælgelse** | Skabelonopdagelse | Undersøg AZD-skabeloner og vælg den rigtige AI-skabelon til dit scenarie | 20 min |
| **2. Validering** | Udrul & verificer | Udrul skabelonen med `azd up` og bekræft, at infrastrukturen fungerer | 30 min |
| **3. Nedbrydning** | Forstå struktur | Brug GitHub Copilot til at undersøge skabelonarkitektur, Bicep-filer og kodeorganisering | 30 min |
| **4. Konfiguration** | azure.yaml Dybdegående gennemgang | Mestrer `azure.yaml`-konfiguration, livscyklus-hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gør den til din egen | Aktivér AI Search, tracing, evaluering, og tilpas til dit scenarie | 45 min |
| **6. Oprydning** | Ryd op | Fjern ressourcer sikkert med `azd down --purge` | 15 min |
| **7. Afrunding** | Næste skridt | Gennemgå resultater, nøglekoncepter og fortsæt din læringsrejse | 15 min |

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
# Mulighed 1: GitHub Codespaces (Anbefalet)
# Klik på "Code" → "Create codespace on main" i repositoryet

# Mulighed 2: Lokal udvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg opsætningsinstruktionerne i workshop/README.md
```

#### 🎯 Workshopens læringsresultater
Ved at gennemføre workshoppen vil deltagerne:
- **Udrul produktions-AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Beherske multi-agent-arkitekturer**: Implementer koordinerede AI-agentløsninger
- **Implementer bedste sikkerhedspraksis**: Konfigurer autentifikation og adgangskontrol
- **Optimér for skala**: Design omkostningseffektive, højtydende udrulninger
- **Fejlfinding af udrulninger**: Udbedre almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv guide**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læringsmiljø
- **📋 Modul-for-modul instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshopoversigt og mål
  - [1. Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) - Find og vælg AI-skabeloner
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Udrul og verificer skabeloner
  - [3. Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Undersøg skabelonarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestrer azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpas til dit scenarie
  - [6. Oprydning](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ryd op i ressourcer
  - [7. Afrunding](workshop/docs/instructions/7-Wrap-up.md) - Gennemgang og næste skridt
- **🛠️ AI Workshop-lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Hurtigstart**: [Workshopopsætningsguide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler-bootcamps.

---

## 📖 Dybdegående: AZD-funktioner

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsudrulninger:

- **Skabelonbaserede udrulninger** - Brug forudbyggede skabeloner til almindelige applikationsmønstre
- **Infrastruktur som kode** - Administrer Azure-ressourcer ved hjælp af Bicep eller Terraform  
- **Integrerede arbejdsgange** - Problemfri oprettelse, udrulning og overvågning af applikationer
- **Udviklervenlig** - Optimeret til udviklerproduktivitet og udvikleroplevelse

### **AZD + Microsoft Foundry: Perfekt til AI-udrulninger**

**Hvorfor AZD til AI-løsninger?** AZD håndterer de største udfordringer, AI-udviklere møder:

- **AI-klare skabeloner** - Forhåndskonfigurerede skabeloner til Microsoft Foundry-modeller, Cognitive Services og ML-workloads
- **Sikre AI-udrulninger** - Indbyggede sikkerhedsmønstre for AI-tjenester, API-nøgler og modelendepunkter  
- **Produktions-AI-mønstre** - Bedste praksis for skalerbare, omkostningseffektive AI-applikationsudrulninger
- **End-to-end AI-arbejdsgange** - Fra modeludvikling til produktionsudrulning med korrekt overvågning
- **Omkostningsoptimering** - Smart ressourceallokering og skaleringsstrategier for AI-workloads
- **Microsoft Foundry-integration** - Problemfri forbindelse til Microsoft Foundry-modelkatalog og endepunkter

---

## 🎯 Skabelon- og eksempelbibliotek

### Fremhævet: Microsoft Foundry-skabeloner
**Start her, hvis du udruller AI-applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure-eksempler, andre er lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Tjenester | Type |
|----------|---------|------------|----------|------|
| [**Kom godt i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Kom godt i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent-løsning**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævet: Færdige læringsscenarier
**Produktionsklare applikationsskabeloner tilpasset læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI-udrulningsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligens-integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent-rammeværk og function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent-arkitektur med Kunde- og Lager-agenter |

### Læring efter eksempeltype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Klon fra de linkede repositories

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent-løsning**](examples/retail-scenario.md) - Komplet produktionsklar implementering med ARM-skabeloner
  - Multi-agent-arkitektur (Kunde + Lager-agenter)
  - Omfattende overvågning og evaluering
  - Én-klik udrulning via ARM-skabelon

#### Lokale eksempler - Containerapplikationer (Kapitel 2-5)
**Omfattende containerudrulningseksempler i dette repository:**
- [**Container App-eksempler**](examples/container-app/README.md) - Komplet guide til containeriserede udrulninger
  - [Simpelt Flask-API](../../examples/container-app/simple-flask-api) - Basis REST-API med skaler-til-nul
  - [Mikrotjenestearkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service udrulning
  - Hurtigstart, produktion og avancerede udrulningsmønstre
  - Vejledning i overvågning, sikkerhed og omkostningsoptimering

#### Eksterne eksempler - Enkle applikationer (Kapitel 1-2)
**Klon disse Azure Samples-repositorier for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende udrulningsmønstre
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Udrulning af statisk indhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-udrulning

#### Eksterne eksempler - Databaseintegration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelsesmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless dataarbejdsgang

#### Eksterne eksempler - Avancerede mønstre (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelon-samlinger
- [**Officiel AZD-skabelon-galleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI-skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Eksempelkatalog**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige referencer
- [**Kommando-oversigt**](resources/cheat-sheet.md) - Væsentlige azd-kommandoer organiseret efter kapitel
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende øvelsesopgaver

### Praktiske workshops
- [**AI Workshop-lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-udrulningsklare (2-3 timer)
- [**Interaktiv workshop**](workshop/README.md) - 8-moduls vejledte øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Oprydning → Afrunding

### Eksterne læringsressourcer
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure-status](https://status.azure.com/)

### AI-agentfærdigheder til din editor
- [**Microsoft Azure-færdigheder på skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 åbne agentfærdigheder til Azure AI, Foundry, udrulning, diagnostik, omkostningsoptimering og mere. Installer dem i GitHub Copilot, Cursor, Claude Code eller enhver understøttet agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Hurtig fejlfinding

**Almindelige problemer, som begyndere møder, og øjeblikkelige løsninger:**

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
<summary><strong>❌ "Ingen abonnement fundet" eller "Abonnement ikke indstillet"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" eller "Kvoten overskredet"</strong></summary>

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
# Mulighed 1: Ryd op og prøv igen
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
<summary><strong>❌ "Godkendelse mislykkedes" eller "Token udløbet"</strong></summary>

```bash
# Autentificer igen
az logout
az login

azd auth logout
azd auth login

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
# Tjek fremskridt
azd show

# Hvis du sidder fast i mere end 30 minutter, tjek Azure-portalen:
azd monitor
# Søg efter mislykkede udrulninger
```
</details>

<details>
<summary><strong>❌ "Adgang nægtet" eller "Forbudt"</strong></summary>

```bash
# Tjek din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal mindst have rollen "Contributor"
# Bed din Azure-administrator om at tildele:
# - Contributor (for ressourcer)
# - User Access Administrator (for tildeling af roller)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde URL for den deployerede applikation</strong></summary>

```bash
# Vis alle tjenesteendepunkter
azd show

# Eller åbn Azure-portalen
azd monitor

# Kontroller en bestemt tjeneste
azd env get-values
# Søg efter *_URL-variabler
```
</details>

### 📚 Fuldstændige fejlfindingressourcer

- **Vejledning til almindelige problemer:** [Detaljerede løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikke problemer:** [AI-fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Fejlfindingsvejledning:** [Fejlretning trin for trin](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusgennemførelse & Certificering

### Fremdriftssporing
Spor dine fremskridt gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtigstart ✅
- [ ] **Kapitel 2**: AI-fokuseret udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Godkendelse ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapitel 6**: Forudgående validering & planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Fejlretning ✅
- [ ] **Kapitel 8**: Produktion & Enterprise-mønstre ✅

### Verificering af læring
Efter at have gennemført hvert kapitel, verificer din viden ved at:
1. **Praktisk øvelse**: Gennemfør kapitlets praktiske udrulning
2. **Videnstjek**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din erfaring i Azure Discord
4. **Næste kapitel**: Gå videre til næste kompleksitetsniveau

### Fordele ved kursusgennemførelse
Når du har gennemført alle kapitler, vil du have:
- **Produktionsoplevelse**: Udrullet rigtige AI-applikationer til Azure
- **Professionelle færdigheder**: Virksomhedsklare udrulningskompetencer  
- **Fællesskabsanerkendelse**: Aktivt medlem af Azure-udviklerfællesskabet
- **Karriereudvikling**: Efterspurgt AZD- og AI-udrulningsekspertise

---

## 🤝 Fællesskab & Support

### Få hjælp & support
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Spørgsmål om læring**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Microsoft Foundry Discord

**Nylige afstemningsresultater fra #Azure-kanalen:**
- **45%** af udviklere ønsker at bruge AZD til AI-workloads
- **Topudfordringer**: Multi-service-udrulninger, håndtering af legitimationsoplysninger, produktionsparathed  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlfinding-vejledninger, bedste praksis

**Deltag i vores fællesskab for at:**
- Del dine AZD + AI-erfaringer og få hjælp
- Få adgang til tidlige forhåndsvisninger af nye AI-skabeloner
- Bidrag til bedste praksis for AI-udrulning
- Påvirk fremtidig AI + AZD-funktionsudvikling

### Bidrag til kurset
Vi byder bidrag velkommen! Læs venligst vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedr eksisterende kapitler og eksempler
- **Nye eksempler**: Tilføj virkelighedsnære scenarier og skabeloner  
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
 
### Generativ AI-serie
[![Generative AI for Beginners](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernekurser
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot til AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot til C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot eventyr](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde at lære?**

**Begyndere**: Start med [Kapitel 1: Grundlæggende & Hurtig start](#-chapter-1-foundation--quick-start)  
**AI-udviklere**: Gå til [Kapitel 2: AI-først udvikling](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & Autentificering](#️-chapter-3-configuration--authentication)

**Næste skridt**: [Begynd Kapitel 1 - AZD-grundlæggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets originalsprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->