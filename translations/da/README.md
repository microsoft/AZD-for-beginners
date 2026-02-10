# AZD for Begyndere: En struktureret læringsrejse

![AZD for begyndere](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub overvågere](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stjerner](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatiske oversættelser (altid opdaterede)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisk](../ar/README.md) | [Bengalsk](../bn/README.md) | [Bulgarsk](../bg/README.md) | [Burmesisk (Myanmar)](../my/README.md) | [Kinesisk (forenklet)](../zh-CN/README.md) | [Kinesisk (traditionelt, Hongkong)](../zh-HK/README.md) | [Kinesisk (traditionelt, Macau)](../zh-MO/README.md) | [Kinesisk (traditionelt, Taiwan)](../zh-TW/README.md) | [Kroatisk](../hr/README.md) | [Tjekkisk](../cs/README.md) | [Dansk](./README.md) | [Hollandsk](../nl/README.md) | [Estisk](../et/README.md) | [Finsk](../fi/README.md) | [Fransk](../fr/README.md) | [Tysk](../de/README.md) | [Græsk](../el/README.md) | [Hebraisk](../he/README.md) | [Hindi](../hi/README.md) | [Ungarsk](../hu/README.md) | [Indonesisk](../id/README.md) | [Italiensk](../it/README.md) | [Japansk](../ja/README.md) | [Kannada](../kn/README.md) | [Koreansk](../ko/README.md) | [Litauisk](../lt/README.md) | [Malaysisk](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisk](../ne/README.md) | [Nigeriansk pidgin](../pcm/README.md) | [Norsk](../no/README.md) | [Persisk (Farsi)](../fa/README.md) | [Polsk](../pl/README.md) | [Portugisisk (Brasilien)](../pt-BR/README.md) | [Portugisisk (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumænsk](../ro/README.md) | [Russisk](../ru/README.md) | [Serbisk (kyrillisk)](../sr/README.md) | [Slovakisk](../sk/README.md) | [Slovensk](../sl/README.md) | [Spansk](../es/README.md) | [Swahili](../sw/README.md) | [Svensk](../sv/README.md) | [Tagalog (filippinsk)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Tyrkisk](../tr/README.md) | [Ukrainsk](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisk](../vi/README.md)

> **Foretrækker at klone lokalt?**

> Dette repository indeholder 50+ sprogoversættelser, hvilket markant øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Hvad er Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** er et udviklervenligt kommandolinjeværktøj, der gør det enkelt at udrulle applikationer til Azure. I stedet for manuelt at oprette og forbinde dusinvis af Azure-ressourcer, kan du udrulle hele applikationer med en enkelt kommando.

### Magien ved `azd up`

```bash
# Denne eneste kommando gør det hele:
# ✅ Opretter alle Azure-ressourcer
# ✅ Konfigurerer netværk og sikkerhed
# ✅ Bygger din applikationskode
# ✅ Udruller til Azure
# ✅ Giver dig en fungerende URL
azd up
```

**Det er det!** Ingen klik i Azure-portalen, ingen komplekse ARM-skabeloner, der skal læres først, ingen manuel konfiguration - bare fungerende applikationer på Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Hvad er forskellen?

Dette er det mest almindelige spørgsmål, begyndere stiller. Her er det korte svar:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Formål** | Administrere individuelle Azure-ressourcer | Udrulle komplette applikationer |
| **Tankegang** | Infrastruktur-fokuseret | Applikations-fokuseret |
| **Eksempel** | `az webapp create --name myapp...` | `azd up` |
| **Læringskurve** | Skal kende Azure-tjenester | Behøver kun at kende din app |
| **Bedst til** | DevOps, infrastruktur | Udviklere, prototyping |

### Enkel analogi

- **Azure CLI** er ligesom at have alle værktøjerne til at bygge et hus - hamre, save, søm. Du kan bygge alt, men du skal kende byggeri.
- **Azure Developer CLI** er som at hyre en entreprenør - du beskriver, hvad du vil have, og de tager sig af byggeriet.

### Hvornår man bruger hver

| Scenario | Brug dette |
|----------|------------|
| "Jeg vil gerne udrulle min webapp hurtigt" | `azd up` |
| "Jeg skal kun oprette en storage-konto" | `az storage account create` |
| "Jeg bygger en komplet AI-applikation" | `azd init --template azure-search-openai-demo` |
| "Jeg skal debugge en specifik Azure-ressource" | `az resource show` |
| "Jeg vil have produktionsklar udrulning på få minutter" | `azd up --environment production` |

### De arbejder sammen!

AZD bruger Azure CLI under huven. Du kan bruge begge:
```bash
# Udrul din app med AZD
azd up

# Justér derefter specifikke ressourcer med Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Find skabeloner i Awesome AZD

Start ikke fra bunden! **Awesome AZD** er fællesskabets samling af klar-til-udrulning-skabeloner:

| Ressource | Beskrivelse |
|----------|-------------|
| 🔗 [**Awesome AZD-galleri**](https://azure.github.io/awesome-azd/) | Gennemse 200+ skabeloner med udrulning med ét klik |
| 🔗 [**Indsend en skabelon**](https://github.com/Azure/awesome-azd/issues) | Bidrag med din egen skabelon til fællesskabet |
| 🔗 [**GitHub-repositorium**](https://github.com/Azure/awesome-azd) | Giv stjerne og udforsk kilden |

### Populære AI-skabeloner fra Awesome AZD

```bash
# RAG Chat med Azure OpenAI + AI Søgning
azd init --template azure-search-openai-demo

# Hurtig AI Chat Applikation
azd init --template openai-chat-app-quickstart

# AI Agenter med Foundry Agenter
azd init --template get-started-with-ai-agents
```

---

## 🎯 Kom godt i gang på 3 trin

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

**🎉 Det er det!** Din app er nu live på Azure.

### Oprydning (Glem ikke!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Sådan bruger du dette kursus

Dette kursus er designet til **progressiv læring** - start, hvor du er tryg, og arbejd dig opad:

| Din erfaring | Start her |
|-----------------|------------|
| **Helt ny i Azure** | [Kapitel 1: Grundlag](../..) |
| **Kender Azure, ny til AZD** | [Kapitel 1: Grundlag](../..) |
| **Vil udrulle AI-apps** | [Kapitel 2: AI-først udvikling](../..) |
| **Vil have praktisk øvelse** | [🎓 Interaktiv workshop](workshop/README.md) - 3-4 timers guidet lab |
| **Brug for produktionsmønstre** | [Kapitel 8: Produktion & Enterprise](../..) |

### Hurtig opsætning

1. **Fork dette repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon det**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Få hjælp**: [Azure Discord-fællesskab](https://discord.com/invite/ByRwuEEgH4)

> **Foretrækker at klone lokalt?**

> Dette repository indeholder 50+ sprogoversættelser, hvilket markant øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.


## Kursusoversigt

Bliv ekspert i Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på udrulning af AI-applikationer med Microsoft Foundry-integration.**

### Hvorfor dette kursus er essentielt for moderne udviklere

Baseret på indsigt fra Microsoft Foundry Discord-fællesskabet, **vil 45% af udviklerne gerne bruge AZD til AI-workloads**, men støder på udfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Bedste praksis for produktionsudrulning af AI  
- Integration og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-workloads
- Fejlfinding af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Behersk AZD-grundprincipper**: Kernekoncepter, installation og konfiguration
- **Udrul AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementer Infrastructure as Code**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlfind udrulninger**: Løs almindelige problemer og fejlsøg fejl
- **Optimér til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Byg multi-agent løsninger**: Udrul komplekse AI-arkitekturer

## 🗺️ Kursuskort: Hurtig navigation efter kapitel

Hvert kapitel har en dedikeret README med læringsmål, hurtigstart og øvelser:

| Kapitel | Emne | Lektioner | Varighed | Kompleksitet |
|---------|-------|---------|----------|------------|
| **[Kapitel 1: Grundlag](docs/chapter-01-foundation/README.md)** | Kom godt i gang | [AZD-grundlæggende](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Første projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kapitel 2: AI-først udvikling](docs/chapter-02-ai-development/README.md)** | AI-først-apps | [Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agenter](docs/chapter-02-ai-development/agents.md) &#124; [Modeludrulning](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 hrs | ⭐⭐ |
| **[Kapitel 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Auth & sikkerhed | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Autentificering & sikkerhed](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Kapitel 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & udrulning | [Udrulningsguide](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionering](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 hrs | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI-agentløsninger | [Detailhandelsscenario](examples/retail-scenario.md) &#124; [Koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 timer | ⭐⭐⭐⭐ |
| **[Kap. 6: Forud-udrulning](docs/chapter-06-pre-deployment/README.md)** | Planlægning & Validering | [Forudkørselskontroller](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-udvælgelse](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 time | ⭐⭐ |
| **[Kap. 7: Fejlfinding](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI-problemer](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 timer | ⭐⭐ |
| **[Kap. 8: Produktion](docs/chapter-08-production/README.md)** | Enterprise-mønstre | [Produktionspraksis](docs/chapter-08-production/production-ai-practices.md) | 2-3 timer | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisk laboratorium | [Introduktion](workshop/docs/instructions/0-Introduction.md) &#124; [Udvælgelse](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validering](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruktion](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Tilpasning](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Nedtagning](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Afslutning](workshop/docs/instructions/7-Wrap-up.md) | 3-4 timer | ⭐⭐ |

**Samlet kursusvarighed:** ~10-14 timer | **Færdighedsudvikling:** Begynder → Produktionsklar

---

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Kapitel 1: Grundlag & Hurtigstart
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du lærer
- Forståelse af Azure Developer CLI's grundprincipper
- Installation af AZD på din platform
- Din første vellykkede implementering

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Grundlæggende](docs/chapter-01-foundation/azd-basics.md) - Kernekoncepter og terminologi
- **⚙️ Opsætning**: [Installation & Opsætning](docs/chapter-01-foundation/installation.md) - Platformsspecifikke guides
- **🛠️ Praktisk**: [Dit første projekt](docs/chapter-01-foundation/first-project.md) - Trin-for-trin vejledning
- **📋 Hurtig reference**: [Kommandooversigt](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Hurtig installationskontrol
azd version

# Udrul din første applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Vellykket udrulning af en simpel webapplikation til Azure ved hjælp af AZD

**✅ Succesvalidering:**
```bash
# Når du har gennemført Kapitel 1, bør du kunne:
azd version              # Viser den installerede version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                  # Udruller til Azure
azd show                # Viser URL for den kørende app
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcerne
```

**📊 Tidinvestering:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan udrulle grundlæggende applikationer selvstændigt

**✅ Succesvalidering:**
```bash
# Efter at have gennemført kapitel 1 bør du være i stand til:
azd version              # Viser den installerede version
azd init --template todo-nodejs-mongo  # Initialiserer projektet
azd up                  # Udruller til Azure
azd show                # Viser URL for den kørende app
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcerne
```

**📊 Tidinvestering:** 30-45 minutter  
**📈 Færdighedsniveau efter:** Kan udrulle grundlæggende applikationer selvstændigt

---

### 🤖 Kapitel 2: AI-første udvikling (Anbefalet til AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Microsoft Foundry-integration med AZD
- Udrulning af AI-drevne applikationer
- Forståelse af AI-servicekonfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry-integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agenter**: [AI-agentguide](docs/chapter-02-ai-development/agents.md) - Udrul intelligente agenter med AZD
- **📖 Mønstre**: [Udrulning af AI-modeller](docs/chapter-02-ai-development/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI-workshop-lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klare
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browserbaseret læring med MkDocs * DevContainer-miljø
- **📋 Skabeloner**: [Microsoft Foundry-skabeloner](../..)
- **📝 Eksempler**: [AZD Udrulningseksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Udrul din første AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prøv flere AI-skabeloner
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktioner

**✅ Succesvalidering:**
```bash
# Efter kapitel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-genererede svar med kilder
# Bekræfte, at søgeintegrationen fungerer
azd monitor  # Kontrollere, at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidinvestering:** 1-2 timer  
**📈 Færdighedsniveau efter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå $80-150/måned udviklingsomkostninger, $300-3500/måned produktionsomkostninger

#### 💰 Overvejelser om omkostninger for AI-udrulninger

**Udviklingsmiljø (Anslået $80-150/måned):**
- Azure OpenAI (Betal efter forbrug): $0-50/måned (baseret på tokenforbrug)
- AI Search (Basisniveau): $75/måned
- Container Apps (Forbrug): $0-20/måned
- Lagring (Standard): $1-5/måned

**Produktionsmiljø (Anslået $300-3.500+/måned):**
- Azure OpenAI (PTU for konsistent ydeevne): $3.000+/måned ELLER Betal efter forbrug ved højt volumen
- AI Search (Standardniveau): $250/måned
- Container Apps (Dedikeret): $50-100/måned
- Application Insights: $5-50/måned
- Lagring (Premium): $10-50/måned

**💡 Tips til omkostningsoptimering:**
- Brug **Gratisniveauet** for Azure OpenAI til læring (50.000 tokens/måned inkluderet)
- Kør `azd down` for at deallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun i produktion
- Brug `azd provision --preview` for at estimere omkostninger før udrulning
- Aktivér autoskalering: betal kun for faktisk brug

**Omkostningsovervågning:**
```bash
# Kontrollér estimerede månedlige omkostninger
azd provision --preview

# Overvåg faktiske omkostninger i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentificering
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Konfiguration og styring af miljøer
- Autentificering og sikkerhedsbest practices
- Ressource-navngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Konfigurationsvejledning](docs/chapter-03-configuration/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Autentificeringsmønstre og managed identity](docs/chapter-03-configuration/authsecurity.md) - Autentificeringsmønstre
- **📝 Eksempler**: [Databaseapp-eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity-autentificering
- Implementér miljøspecifikke konfigurationer

**💡 Kapitelresultat**: Administrer flere miljøer med korrekt autentificering og sikkerhed

---

### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
**Forudsætninger**: Kapitel 1-3 gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hvad du lærer
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Strategier for ressourceprovisionering

#### Læringsressourcer
- **📖 Udrulning**: [Udrulningsvejledning](docs/chapter-04-infrastructure/deployment-guide.md) - Komplette workflows
- **🏗️ Provisionering**: [Provisionering af ressourcer](docs/chapter-04-infrastructure/provisioning.md) - Azure ressourcestyring
- **📝 Eksempler**: [Container App-eksempel](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Udrul multi-service applikationer
- Implementér blue-green udrulningsstrategier

**💡 Kapitelresultat**: Udrul komplekse multi-service applikationer ved hjælp af brugerdefinerede infrastruktur-skabeloner

---

### 🎯 Kapitel 5: Multi-Agent AI-løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du lærer
- Multi-agent arkitektur-mønstre
- Agentorchestration og koordinering
- Produktionsklare AI-udrulninger

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplet implementering
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Ét-klik udrulning
- **📖 Arkitektur**: [Multi-agent koordinationsmønstre](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Udrul den komplette multiagent-løsning til detailhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Udrul og administrer en produktionsklar multi-agent AI-løsning med Customer- og Inventory-agenter

---

### 🔍 Kapitel 6: Validering & Planlægning før udrulning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Kapacitetsplanlægning og ressourcevalidering
- Strategier for SKU-udvælgelse
- Pre-flight checks og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Udvælgelse**: [SKU-udvælgelse](docs/chapter-06-pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Forudkørselskontroller](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimér SKU-udvælgelse for omkostninger
- Implementér automatiserede pre-udrulningskontroller

**💡 Kapitelresultat**: Valider og optimér udrulninger før eksekvering

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert udrulningskapitel gennemført  
**Varighed**: 1-1.5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Systematiske debugging-tilgange
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Almindelige problemer](docs/chapter-07-troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-specifik fejlfinding](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - AI-serviceproblemer

#### Praktiske øvelser
- Diagnosticer udrulningsfejl
- Løs autentificeringsproblemer
- Debug AI-serviceforbindelser

**💡 Kapitelresultat**: Selvstændigt diagnosticer og løs almindelige udrulningsproblemer

---

### 🏢 Kapitel 8: Produktion & Enterprise-mønstre
**Forudsætninger**: Kapitel 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du lærer
- Strategier for produktionsudrulning
- Enterprise sikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Microservices Example](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementér enterprise-sikkerhedsmønstre
- Opsæt omfattende overvågning
- Udrul til produktion med korrekt governance

**💡 Kapitelresultat**: Udrul enterprise-klare applikationer med fuld produktionsfunktionalitet

---

## 🎓 Workshop Oversigt: Praktisk læringsoplevelse

> **⚠️ WORKSHOP STATUS: Aktiv udvikling**  
> Workshop-materialerne er i øjeblikket under udvikling og finpudsning. Kernemodulerne er funktionelle, men nogle avancerede sektioner er ufuldstændige. Vi arbejder aktivt på at færdiggøre alt indhold. [Følg fremdriften →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende praktisk læring med browserbaserede værktøjer og guidede øvelser**
Vores workshopmaterialer giver en struktureret, interaktiv læringsoplevelse, der supplerer det kapiteldelte pensum ovenfor. Workshoppen er designet til både selvstyret læring og instruktørledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browser-baseret grænseflade**: Færdig MkDocs-drevet workshop med søgning, kopiering og tema-funktioner
- **GitHub Codespaces-integration**: Ét-klik-opsætning af udviklingsmiljø
- **Struktureret læringssti**: 8-modulers guidede øvelser (3-4 timer i alt)
- **Progressiv metodologi**: Introduktion → Udvælgelse → Validering → Dekonstruktion → Konfiguration → Tilpasning → Oprydning → Afrunding
- **Interaktivt DevContainer-miljø**: For-konfigurerede værktøjer og afhængigheder

#### 📚 Workshopmodulstruktur
Workshoppen følger en **8-modulers progressiv metodologi**, der tager dig fra opdagelse til deployments-mestrer:

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

**Workshop Flow:**
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

#### 🎯 Læringsmål for workshoppen
Ved at gennemføre workshoppen vil deltagerne:
- **Deployere AI-applikationer i produktion**: Brug AZD med Microsoft Foundry-tjenester
- **Mestre multi-agent-arkitekturer**: Implementere koordinerede AI-agent-løsninger
- **Implementere sikkerhedsbedste praksis**: Konfigurere autentificering og adgangskontrol
- **Optimere for skala**: Designe omkostningseffektive, højtydende deployments
- **Fejlsøge deployments**: Løse almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Browser-baseret læringsmiljø
- **📋 Modul-for-modul instruktioner**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshopoversigt og mål
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - Find og vælg AI-skabeloner
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Deploy og verificer skabeloner
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Undersøg skabelonarkitektur
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - Mestre azure.yaml
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Tilpas til dit scenarie
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ryd op i ressourcer
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Opsummering og næste skridt
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Quick Start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler-bootcamps.

---

## 📖 Dyk ned: AZD-funktioner

Ud over det grundlæggende tilbyder AZD kraftfulde funktioner til produktionsdeployments:

- **Skabelonbaserede deployments** - Brug forudbyggede skabeloner til almindelige applikationsmønstre
- **Infrastructure as Code** - Administrer Azure-ressourcer ved hjælp af Bicep eller Terraform  
- **Integrerede workflows** - Provisioner, deployer og overvåg applikationer problemfrit
- **Udviklervenlig** - Optimeret til udviklerproduktivitets- og oplevelsesforbedringer

### **AZD + Microsoft Foundry: Perfekt til AI-deployments**

**Hvorfor AZD til AI-løsninger?** AZD adresserer de største udfordringer, AI-udviklere står over for:

- **AI-klare skabeloner** - For-konfigurerede skabeloner til Azure OpenAI, Cognitive Services og ML-workloads
- **Sikre AI-deployments** - Indbyggede sikkerhedsmønstre for AI-tjenester, API-nøgler og modelendepunkter  
- **Produktions-AI-mønstre** - Bedste praksis for skalerbare, omkostningseffektive AI-applikationer
- **End-to-end AI-workflows** - Fra modeludvikling til produktionsdeployment med korrekt overvågning
- **Omkostningsoptimering** - Smart ressourceallokering og skalering til AI-workloads
- **Microsoft Foundry-integration** - Problemfri forbindelse til Microsoft Foundry modelkatalog og endepunkter

---

## 🎯 Skabeloner & eksempler bibliotek

### Udvalgt: Microsoft Foundry-skabeloner
**Start her, hvis du deployer AI-applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure Samples, andre er lokale implementeringer.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Chapter 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Local** |

### Udvalgt: Færdige læringsscenarier
**Produktion-klare applikationsskabeloner kortlagt til læringskapitler**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Chapter 2 | ⭐ | Basic AI deployment patterns |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Chapter 2 | ⭐⭐ | RAG implementation with Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Chapter 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Chapter 5 | ⭐⭐⭐ | Agent framework and function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Chapter 8 | ⭐⭐⭐ | Enterprise AI orchestration |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Chapter 5 | ⭐⭐⭐⭐ | Multi-agent architecture with Customer and Inventory agents |

### Læring efter eksempeltype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Clone fra de linkede repositories

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fuldstændig produktionsklar implementering med ARM-skabeloner
  - Multi-agent-arkitektur (Customer + Inventory agents)
  - Omfattende overvågning og evaluering
  - Ét-klik-deployment via ARM-skabelon

#### Lokale eksempler - Container-applikationer (Kapitler 2-5)
**Omfattende container-deployments i dette repository:**
- [**Container App Examples**](examples/container-app/README.md) - Komplett guide til containeriserede deployments
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basal REST API med scale-to-zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produktionsklar multi-service deployment
  - Quick Start, Production og Advanced deployment-mønstre
  - Overvågning, sikkerhed og omkostningsoptimeringsvejledning

#### Eksterne eksempler - Simple applikationer (Kapitler 1-2)
**Clone disse Azure Samples repositories for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Basale deployment-mønstre
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk indholds-deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-deployment

#### Eksterne eksempler - Databaseintegration (Kapitler 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelsesmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data-workflow

#### Eksterne eksempler - Avancerede mønstre (Kapitler 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelon-samlinger
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Examples Directory**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & referencer

### Hurtige referencer
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Væsentlige azd-kommandoer organiseret efter kapitel
- [**Glossary**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Study Guide**](resources/study-guide.md) - Omfattende øvelser til praksis

### Hands-on workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Gør dine AI-løsninger deployable med AZD (2-3 timer)
- [**Interactive Workshop**](workshop/README.md) - 8-modulers guidede øvelser med MkDocs og GitHub Codespaces
  - Følger: Introduktion → Udvælgelse → Validering → Dekonstruktion → Konfiguration → Tilpasning → Oprydning → Afrunding

### Eksterne læringsressourcer
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hurtig fejlfinding

**Almindelige problemer nybegyndere møder og hurtige løsninger:**

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

# Indstil for AZD-miljø
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
# Mulighed 1: Ryd op og prøv igen
azd down --force --purge
azd up

# Mulighed 2: Reparer kun infrastrukturen
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
# AZD genererer unikke navne, men hvis der opstår en konflikt:
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
- AI-applikationer: 15-25 minutter (OpenAI-provisionering er langsom)

```bash
# Tjek fremskridt
azd show

# Hvis du sidder fast i mere end 30 minutter, tjek Azure-portalen:
azd monitor
# Se efter mislykkede implementeringer
```
</details>

<details>
<summary><strong>❌ "Adgang nægtet" eller "Forbudt"</strong></summary>

```bash
# Tjek din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal mindst have rollen 'Contributor'
# Bed din Azure-administrator om at tildele:
# - Contributor (til ressourcer)
# - User Access Administrator (til tildeling af roller)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde den deployede applikations-URL</strong></summary>

```bash
# Vis alle tjenesteendepunkter
azd show

# Eller åbn Azure-portalen
azd monitor

# Kontroller en specifik tjeneste
azd env get-values
# Søg efter *_URL-variabler
```
</details>

### 📚 Komplette fejlsøgningsressourcer

- **Vejledning til almindelige problemer:** [Detaljerede løsninger](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-specifikke problemer:** [AI-fejlsøgning](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Fejlfindingsvejledning:** [Trinvis fejlfinding](docs/chapter-07-troubleshooting/debugging.md)
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusafslutning & Certificering

### Fremskridtsopsporing
Spor dine læringsfremskridt gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtigstart ✅
- [ ] **Kapitel 2**: AI-først udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Godkendelse ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-agent AI-løsninger ✅
- [ ] **Kapitel 6**: Validering og planlægning før udrulning ✅
- [ ] **Kapitel 7**: Fejlsøgning & Fejlretning ✅
- [ ] **Kapitel 8**: Produktion & Enterprise-mønstre ✅

### Verificering af læring
Efter at have gennemført hvert kapitel, verificer din viden ved at:
1. **Praktisk øvelse**: Gennemfør kapitlets praktiske udrulning
2. **Videnskontrol**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din oplevelse i Azure Discord
4. **Næste kapitel**: Gå videre til næste kompleksitetsniveau

### Fordele ved at fuldføre kurset
Ved at fuldføre alle kapitler vil du have:
- **Produktionserfaring**: Udrullet reelle AI-applikationer til Azure
- **Professionelle færdigheder**: Enterprise-klare udrulningskompetencer  
- **Fællesskabsanerkendelse**: Aktivt medlem af Azure-udviklerfællesskabet
- **Karrierefremme**: Eftertragtet AZD- og AI-udrulningsekspertise

---

## 🤝 Fællesskab & Support

### Få hjælp & support
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørgsmål**: [Microsoft Azure Discord-fællesskab](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigt fra Microsoft Foundry Discord

**Seneste afstemningsresultater fra #Azure-kanalen:**
- **45%** af udviklere vil bruge AZD til AI-workloads
- **Største udfordringer**: Udrulninger med flere services, håndtering af legitimationsoplysninger, produktionsparathed  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlsøgningsguides, bedste praksis

**Deltag i vores fællesskab for at:**
- Del dine AZD + AI-erfaringer og få hjælp
- Få adgang til tidlige forhåndsvisninger af nye AI-skabeloner
- Bidrage til bedste praksis for AI-udrulning
- Påvirke fremtidig AI + AZD funktionsudvikling

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
[![LangChain4j for Begyndere](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js for Begyndere](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain for Begyndere](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenter
[![AZD for Begyndere](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI for Begyndere](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP for Begyndere](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agenter for Begyndere](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI for Begyndere](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kerne-læring
[![ML for Begyndere](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Begyndere](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Begyndere](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Begyndere](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Begyndere](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Begyndere](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-udvikling for Begyndere](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serie
[![Copilot til AI-parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot til C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-eventyr](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde at lære?**

**Begyndere**: Start med [Chapter 1: Foundation & Quick Start](../..)
**AI-udviklere**: Gå til [Kapitel 2: AI-først udvikling](../..)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & Godkendelse](../..)

**Næste trin**: [Begynd Kapitel 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten Co-op Translator (https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Originaldokumentet i dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel, menneskelig oversættelse. Vi påtager os intet ansvar for eventuelle misforståelser eller fejltolkninger, som måtte opstå ved brug af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->