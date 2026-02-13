# AZD For Beginners: En struktureret læringsrejse

![AZD-for-begyndere](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub overvågere](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub fork](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stjerner](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske oversættelser (altid opdaterede)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengalsk](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (traditionel, Hongkong)](../zh-HK/README.md) | [Kinesisk (traditionel, Macau)](../zh-MO/README.md) | [Kinesisk (traditionel, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malaysisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

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

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det enkelt at udrulle applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer, kan du udrulle hele applikationer med en enkelt kommando.

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

Dette er det mest almindelige spørgsmål, begyndere stiller. Her er det enkle svar:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrer individuelle Azure-ressourcer | Udrul komplette applikationer |
| **Tankegang** | Infrastrukturfokuseret | Applikationsfokuseret |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Indlæringskurve** | Skal kende Azure-tjenesterne | Kend bare din app |
| **Bedst til** | DevOps, infrastruktur | Udviklere, prototyping |

### Enkel analogi

- **Azure CLI** er som at have alle værktøjerne til at bygge et hus - hamre, save, søm. Du kan bygge alt, men du skal kende konstruktion.
- **Azure Developer CLI** er som at hyre en entreprenør - du beskriver, hvad du vil have, og de klarer byggeriet.

### Hvornår skal man bruge hvad

| Scenario | Brug dette |
|----------|----------|
| "Jeg vil hurtigt udrulle min webapp" | `azd up` |
| "Jeg skal kun oprette en storage account" | `az storage account create` |
| "Jeg bygger en komplet AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jeg skal fejlfinde en specifik Azure-ressource" | `az resource show` |
| "Jeg vil have produktionsklar udrulning på få minutter" | `azd up --environment production` |

### De arbejder sammen!

AZD bruger Azure CLI under motorhjelmen. Du kan bruge begge:
```bash
# Implementer din app med AZD
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
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til fællesskabet |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Star og udforsk kilden |

### Populære AI-skabeloner fra Awesome AZD

```bash
# RAG Chat med Azure OpenAI + AI-søgning
azd init --template azure-search-openai-demo

# Hurtig AI-chatapplikation
azd init --template openai-chat-app-quickstart

# AI-agenter med Foundry-agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom godt i gang i 3 trin

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

**🎉 Det var det!** Din app er nu live på Azure.

### Oprydning (Glem det ikke!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Sådan bruger du dette kursus

Dette kursus er designet til **progressiv læring** - start hvor du er komfortabel, og arbejd dig opad:

| Din erfaring | Start her |
|-----------------|------------|
| **Helt ny til Azure** | [Kapitel 1: Foundation](../..) |
| **Kender Azure, ny til AZD** | [Kapitel 1: Foundation](../..) |
| **Vil udrulle AI-apps** | [Kapitel 2: AI-First Development](../..) |
| **Ønsker praktisk træning** | [🎓 Interaktiv Workshop](workshop/README.md) - 3-4 timers guidet lab |
| **Behøver produktionsmønstre** | [Kapitel 8: Production & Enterprise](../..) |

### Hurtig opsætning

1. **Fork dette repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker du at klone lokalt?**
>
> Dette repository inkluderer 50+ sprogoversættelser, hvilket betydeligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.


## Kursusoversigt

Bliv mester i Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på udrulning af AI-applikationer med Microsoft Foundry-integration.**

### Hvorfor dette kursus er vigtigt for moderne udviklere

Baseret på Microsoft Foundry Discord-fællesskabets indsigter, ønsker **45% af udviklerne at bruge AZD til AI-workloads**, men støder på udfordringer med:
- Komplekse multi-service AI-arkitekturer
- Produktionsmæssige bedste praksisser for AI-udrulning  
- Integration og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-workloads
- Fejlfinding af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD-grundprincipper**: Kernekoncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementere Infrastructure as Code**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlfinding af udrulninger**: Løs almindelige problemer og debug fejl
- **Optimere til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge multi-agent-løsninger**: Udrul komplekse AI-arkitekturer

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Hvert kapitel har en dedikeret README med læringsmål, hurtigstart og øvelser:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Første projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | AI-fokuserede apps | [Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modeludrulning](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Autentificering & sikkerhed | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Autentificering & Sikkerhed](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kapitel 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Udrulning | [Udrulningsvejledning](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kapitel 5: Multi-agent](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Detailhandelsscenarie](examples/retail-scenario.md) &#124; [Koordineringsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[Kapitel 6: Forud for udrulning](docs/chapter-06-pre-deployment/README.md)** | Planlægning & Validering | [Preflight-kontrol](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valg](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 hr | ⭐⭐ |
| **[Kapitel 7: Fejlfinding](docs/chapter-07-troubleshooting/README.md)** | Debug & Ret | [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 hrs | ⭐⭐ |
| **[Kapitel 8: Produktion](docs/chapter-08-production/README.md)** | Virksomhedsmønstre | [Produktionspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 hrs | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk lab | [Introduction](workshop/docs/instructions/0-Introduction.md) &#124; [Selection](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validation](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Customization](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Wrap-up](workshop/docs/instructions/7-Wrap-up.md) | 3-4 hrs | ⭐⭐ |

**Samlet kursusvarighed:** ~10-14 timer | **Færdighedsudvikling:** Begynder → Produktionsklar

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Kapitel 1: Grundlag & Hurtig Start
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du vil lære
- Grundlæggende om Azure Developer CLI
- Installere AZD på din platform
- Din første vellykkede udrulning

#### Læringsressourcer
- **🎯 Start her**: [What is Azure Developer CLI?](../..)
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

**💡 Kapiteludbytte**: Vellykket udrulning af en simpel webapplikation til Azure ved brug af AZD

**✅ Succesvalidering:**
```bash
# Efter at have gennemført kapitel 1 bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                  # Udruller til Azure
azd show                # Viser URL'en til den kørende app
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcerne
```

**📊 Tidsinvestering:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan udrulle grundlæggende applikationer selvstændigt

**✅ Succesvalidering:**
```bash
# Efter at have gennemført Kapitel 1 bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                  # Udruller til Azure
azd show                # Viser URL for kørende app
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcerne
```

**📊 Tidsinvestering:** 30-45 minutter  
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
- **🎯 Start her**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Udrul intelligente agenter med AZD
- **📖 Mønstre**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger klar til AZD
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browser-baseret læring med MkDocs * DevContainer-miljø
- **📋 Skabeloner**: [Microsoft Foundry Templates](../..)
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

**💡 Kapiteludbytte**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktioner

**✅ Succesvalidering:**
```bash
# Efter kapitel 2 skal du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-drevne svar med kilder
# Bekræft, at søgeintegrationen fungerer
azd monitor  # Kontrollér, at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsinvestering:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå $80-150/måned i udviklingsomkostninger, $300-3500/måned i produktionsomkostninger

#### 💰 Omkostningshensyn for AI-udrulninger

**Udviklingsmiljø (anslået $80-150/måned):**
- Azure OpenAI (Pay-as-you-go): $0-50/måned (afhænger af tokenbrug)
- AI Search (Basic-tier): $75/måned
- Container Apps (Consumption): $0-20/måned
- Storage (Standard): $1-5/måned

**Produktionsmiljø (anslået $300-3.500+/måned):**
- Azure OpenAI (PTU for konsistent ydeevne): $3.000+/måned ELLER Pay-as-go ved høj volumen
- AI Search (Standard-tier): $250/måned
- Container Apps (Dedicated): $50-100/måned
- Application Insights: $5-50/måned
- Storage (Premium): $10-50/måned

**💡 Tips til omkostningsoptimering:**
- Brug **Free Tier** Azure OpenAI til læring (50.000 tokens/måned inkluderet)
- Kør `azd down` for at deallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` for at estimere omkostninger før udrulning
- Aktivér autoskalering: betal kun for faktisk forbrug

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
- Ressourcenavngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Autentificeringsmønstre
- **📝 Eksempler**: [Database App Example](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity-autentificering
- Implementer miljøspecifikke konfigurationer

**💡 Kapiteludbytte**: Administrer flere miljøer med korrekt autentificering og sikkerhed

---

### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
**Forudsætninger**: Kapitel 1-3 gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hvad du vil lære
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressourcesprovisionering

#### Læringsressourcer
- **📖 Udrulning**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Fulde workflows
- **🏗️ Provisionering**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure resource management
- **📝 Eksempler**: [Container App Example](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret tilpassede Bicep-skabeloner
- Udrul multi-service applikationer
- Implementer blue-green udrulningsstrategier

**💡 Kapiteludbytte**: Udrul komplekse multi-service applikationer ved hjælp af tilpassede infrastrukturskabeloner

---

### 🎯 Kapitel 5: Multi-agent AI-løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Mønstre for fleragentarkitektur
- Orkestrering og koordinering af agenter
- Produktionsklare AI-udrulninger

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Fuld implementering
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klik udrulning
- **📖 Arkitektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Udrul den komplette multiagent-løsning til detailhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapiteludbytte**: Udrul og administrer en produktionsklar multi-agent AI-løsning med kunde- og lageragenter

---

### 🔍 Kapitel 6: Validering & Planlægning før udrulning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Kapacitetsplanlægning og ressourcevalidering
- Strategier for SKU-valg
- Pre-flight-kontrol og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Valg**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimér SKU-valg for omkostninger
- Implementer automatiserede pre-udrulningskontroller

**💡 Kapiteludbytte**: Valider og optimér udrulninger før eksekvering

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert udrulningskapitel gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske debugging-tilgange
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske øvelser
- Diagnosticer udrulningsfejl
- Løs autentificeringsproblemer
- Debug AI-tjenesteforbindelser

**💡 Kapiteludbytte**: Diagnostiser og løs almindelige udrulningsproblemer selvstændigt

---

### 🏢 Kapitel 8: Produktion & Virksomhedsmønstre
**Forudsætninger**: Kapitel 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Strategier for produktionsudrulning
- Virksomhedssikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Virksomhedsmønstre
- **📝 Eksempler**: [Microservices Example](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementer virksomhedssikkerhedsmønstre
- Opsæt omfattende overvågning
- Udrul til produktion med korrekt governance

**💡 Kapiteludbytte**: Udrul virksomhedsklare applikationer med fulde produktionskapaciteter

---

## 🎓 Workshop Oversigt: Praktisk læringsoplevelse

> **⚠️ WORKSHOP STATUS: Under aktiv udvikling**
> Workshopmaterialerne udvikles og forfines i øjeblikket. Kernemodulerne fungerer, men nogle avancerede sektioner er ufuldstændige. Vi arbejder aktivt på at færdiggøre alt indhold. [Følg fremdriften →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende praktisk læring med browserbaserede værktøjer og guidede øvelser**

Vores workshopmaterialer giver en struktureret, interaktiv læringsoplevelse, der supplerer det kapitelsbaserede pensum ovenfor. Workshoppen er designet til både selvstyret læring og instruktørledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browser-baseret grænseflade**: Fuldt MkDocs-drevet workshop med søgning, kopiering og tema-funktioner
- **GitHub Codespaces-integration**: Ét-klik opsætning af udviklingsmiljø
- **Struktureret læringsforløb**: 8-modulers guidede øvelser (3-4 timer i alt)
- **Progressiv metodologi**: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Opsummering
- **Interaktivt DevContainer-miljø**: Forudkonfigurerede værktøjer og afhængigheder

#### 📚 Workshopmodulstruktur
Workshoppen følger en **8-modulers progressiv metodologi**, der tager dig fra opdagelse til mestring af udrulning:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduktion** | Workshopoversigt | Forstå læringsmål, forudsætninger og workshopstruktur | 15 min |
| **1. Udvælgelse** | Skabelonopdagelse | Undersøg AZD-skabeloner og vælg den rigtige AI-skabelon til dit scenarie | 20 min |
| **2. Validering** | Implementer & verificer | Udrul skabelonen med `azd up` og verificer, at infrastrukturen fungerer | 30 min |
| **3. Nedbrydning** | Forstå struktur | Brug GitHub Copilot til at udforske skabelonarkitektur, Bicep-filer og kodeorganisation | 30 min |
| **4. Konfiguration** | azure.yaml i dybden | Mestre `azure.yaml`-konfiguration, lifecycle hooks og miljøvariabler | 30 min |
| **5. Tilpasning** | Gør det til dit eget | Aktiver AI Search, sporing, evaluering, og tilpas til dit scenarie | 45 min |
| **6. Nedtagning** | Ryd op | Fjern sikkert ressourcer med `azd down --purge` | 15 min |
| **7. Opsummering** | Næste skridt | Gennemgå præstationer, nøglekoncepter, og fortsæt din læringsrejse | 15 min |

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

#### 🎯 Workshop læringsmål
Ved at gennemføre workshoppen vil deltagerne:
- **Udrulle produktions-AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Beherske multi-agent-arkitekturer**: Implementer koordinerede AI-agentløsninger
- **Implementere bedste praksis for sikkerhed**: Konfigurér autentifikation og adgangskontrol
- **Optimere til skalerbarhed**: Design omkostningseffektive, højtydende udrulninger
- **Fejlsøge udrulninger**: Løse almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browserbaseret læringsmiljø
- **📋 Modul-for-modul instruktioner**:
  - [0. Introduktion](workshop/docs/instructions/0-Introduction.md) - Workshopoversigt og mål
  - [1. Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) - Find og vælg AI-skabeloner
  - [2. Validering](workshop/docs/instructions/2-Validate-AI-Template.md) - Udrul og verificer skabeloner
  - [3. Nedbrydning](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Udforsk skabelonarkitektur
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml
  - [5. Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpas til dit scenarie
  - [6. Nedtagning](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ryd op i ressourcer
  - [7. Opsummering](workshop/docs/instructions/7-Wrap-up.md) - Gennemgang og næste skridt
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Øvelser fokuseret på AI
- **💡 Hurtig start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler-bootcamps.

---

## 📖 Dybdegående: AZD-funktioner

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsudrulninger:

- **Skabelonbaserede udrulninger** - Brug forudbyggede skabeloner til almindelige applikationsmønstre
- **Infrastructure as Code** - Administrer Azure-ressourcer ved hjælp af Bicep eller Terraform  
- **Integrerede workflows** - Gør det nemt at provisionere, udrulle og overvåge applikationer
- **Udviklervenlig** - Optimeret til udviklerproduktivitet og -oplevelse

### **AZD + Microsoft Foundry: Perfekt til AI-udrulninger**

**Hvorfor AZD til AI-løsninger?** AZD løser de største udfordringer, som AI-udviklere står overfor:

- **AI-klare skabeloner** - Forudkonfigurerede skabeloner til Azure OpenAI, Cognitive Services og ML-workloads
- **Sikre AI-udrulninger** - Indbyggede sikkerhedsmønstre for AI-tjenester, API-nøgler og modelendepunkter  
- **Produktions-AI-mønstre** - Bedste praksis til skalerbare, omkostningseffektive AI-applikationsudrulninger
- **End-to-end AI-workflows** - Fra modeludvikling til produktionsudrulning med korrekt overvågning
- **Omkostningsoptimering** - Smart ressourceallokering og skaleringsstrategier til AI-workloads
- **Integration med Microsoft Foundry** - Problemfri forbindelse til Microsoft Foundry-modelkataloget og endepunkter

---

## 🎯 Skabelon- og eksempelsamling

### Fremhævet: Microsoft Foundry-skabeloner
**Start her, hvis du udruller AI-applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure Samples, andre er lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Tjenester | Type |
|----------|---------|--------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævet: Komplette læringsscenarier
**Produktionsklare applikationsskabeloner matchet til læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|----------------|--------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI-udrulningsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration af Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent-framework og function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent-arkitektur med Kunde- og Lager-agenter |

### Læring efter eksempeltype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Klon fra linkede repositories

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletn produktionsklar implementering med ARM-skabeloner
  - Multi-agent-arkitektur (Kunde + Lager-agenter)
  - Omfattende overvågning og evaluering
  - Én-klik udrulning via ARM-skabelon

#### Lokale eksempler - Container-applikationer (Kapitel 2-5)
**Omfattende container-udrulseseksempler i dette repository:**
- [**Container App Examples**](examples/container-app/README.md) - Komplet guide til containeriserede udrulninger
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Grundlæggende REST API med scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produktionsklar fler-service udrulning
  - Hurtig start, produktion og avancerede udrulningsmønstre
  - Overvågning, sikkerhed og omkostningsoptimeringsvejledning

#### Eksterne eksempler - Simple applikationer (Kapitel 1-2)
**Klon disse Azure Samples-repositories for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende udrulningsmønstre
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Udrulning af statisk indhold
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-udrulning

#### Eksterne eksempler - Databaseintegration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mønstre for databaseforbindelse
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data-workflow

#### Eksterne eksempler - Avancerede mønstre (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Fler-service arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelonsamlinger
- [**Officielt AZD-skabelongalleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI-skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Eksempelbiblioteket**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige referencer
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Væsentlige azd-kommandoer organiseret efter kapitel
- [**Ordlisten**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende øvelser

### Hands-on workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger klar til AZD-udrulning (2-3 timer)
- [**Interaktiv workshop**](workshop/README.md) - 8-modulers guidede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Udvælgelse → Validering → Nedbrydning → Konfiguration → Tilpasning → Nedtagning → Opsummering

### Eksterne læringsressourcer
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hurtig fejlsøgningsguide

**Almindelige problemer begyndere møder og øjeblikkelige løsninger:**

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
<summary><strong>❌ "InsufficientQuota" eller "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" mislykkes halvvejs igennem</strong></summary>

```bash
# Mulighed 1: Ryd op og prøv igen
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
<summary><strong>❌ "Authentication failed" eller "Token expired"</strong></summary>

```bash
# Autentificér igen
az logout
az login

azd auth logout
azd auth login

# Bekræft autentificering
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unikke navne, men i tilfælde af konflikt:
azd down --force --purge

# Prøv derefter igen med et nyt miljø
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
# Tjek fremdriften
azd show

# Hvis fastlåst >30 minutter, tjek Azure-portalen:
azd monitor
# Se efter mislykkede implementeringer
```
</details>

<details>
<summary><strong>❌ "Permission denied" eller "Forbidden"</strong></summary>

```bash
# Kontroller din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal mindst have rollen "Contributor"
# Bed din Azure-administrator om at tildele:
# - Contributor (til ressourcer)
# - User Access Administrator (til rolle-tildelinger)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde den deployerede applikations-URL</strong></summary>

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

### 📚 Fuldstændige fejlfindingressourcer

- **Vejledning til almindelige problemer:** [Detaljerede løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikke problemer:** [AI-fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Fejlfindingsvejledning:** [Trin-for-trin fejlretning](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusgennemførelse & Certificering

### Fremdriftssporing
Track your learning progress through each chapter:

- [ ] **Kapitel 1**: Grundlag & Hurtigstart ✅
- [ ] **Kapitel 2**: AI-først udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentificering ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapitel 6**: Forud-udrulningsvalidering & Planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Debugging ✅
- [ ] **Kapitel 8**: Produktion & Enterprise-mønstre ✅

### Verificering af læring
After completing each chapter, verify your knowledge by:
1. **Praktisk øvelse**: Fuldfør kapitlets praktiske udrulning
2. **Videnstjek**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din oplevelse i Azure Discord
4. **Næste kapitel**: Gå videre til næste kompleksitetsniveau

### Fordele ved kursusgennemførelse
Upon completing all chapters, you will have:
- **Produktionsoplevelse**: Udrullet rigtige AI-applikationer på Azure
- **Faglige færdigheder**: Virksomhedsklare udrulningskompetencer  
- **Fællesskabsanerkendelse**: Aktivt medlem af Azure-udviklersamfundet
- **Karriereudvikling**: Efterspurgt AZD- og AI-udrulningsekspertise

---

## 🤝 Fællesskab & Support

### Få hjælp & support
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Spørgsmål om læring**: [Microsoft Azure Discord-fællesskab](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Microsoft Foundry Discord

**Seneste afstemningsresultater fra #Azure-kanalen:**
- **45%** af udviklere ønsker at bruge AZD til AI-arbejdsbelastninger
- **Topudfordringer**: Multiservice-udrulninger, legitimationshåndtering, produktionsberedskab  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlfindingvejledninger, bedste praksis

**Deltag i vores fællesskab for at:**
- Del dine AZD + AI-oplevelser og få hjælp
- Få adgang til tidlige forhåndsvisninger af nye AI-skabeloner
- Bidrag til bedste praksis for AI-udrulning
- Påvirk fremtidig AI + AZD-funktionsudvikling

### Bidrag til kurset
Vi byder bidrag velkommen! Læs venligst vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedr eksisterende kapitler og eksempler
- **Nye eksempler**: Tilføj virkelige scenarier og skabeloner  
- **Oversættelse**: Hjælp med at vedligeholde flersproget support
- **Fejlrapporter**: Forbedr nøjagtighed og klarhed
- **Fællesskabsstandarder**: Følg vores inkluderende fællesskabsretningslinjer

---

## 📄 Kursusinformation

### Licens
Dette projekt er licenseret under MIT-licensen - se [LICENSE](../../LICENSE) filen for detaljer.

### Relaterede Microsoft-læringsressourcer

Our team produces other comprehensive learning courses:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j til begyndere](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js til begyndere](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain til begyndere](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD til begyndere](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI til begyndere](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP til begyndere](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agenter til begyndere](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI-serie
[![Generative AI til begyndere](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernekurser
[![ML til begyndere](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Datavidenskab til begyndere](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI til begyndere](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersikkerhed til begyndere](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webudvikling til begyndere](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT til begyndere](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-udvikling til begyndere](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot til AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot til C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde at lære?**

**Begyndere**: Start med [Kapitel 1: Grundlag & Hurtig start](../..)  
**AI-udviklere**: Spring til [Kapitel 2: AI-først udvikling](../..)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & Godkendelse](../..)

**Næste skridt**: [Begynd Kapitel 1 - AZD-grundlæggende](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->