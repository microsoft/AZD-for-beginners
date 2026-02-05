# AZD for Begyndere: En Struktureret Læringsrejse

![AZD-for-beginners](../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kom Godt i Gang med Dette Kursus

Følg disse trin for at begynde din AZD-læringsrejse:

1. **Fork Repositoryet**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Repositoryet**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Deltag i Fællesskabet**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) for ekspertstøtte
4. **Vælg Din Læringssti**: Vælg et kapitel nedenfor, der matcher dit erfaringsniveau

### Support på Flere Sprog

#### Automatiske Oversættelser (Altid Opdaterede)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](./README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Foretrækker du at klone lokalt?**

> Dette repository indeholder over 50 sprogoversættelser, hvilket øger downloadstørrelsen betydeligt. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en meget hurtigere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursusoversigt

Mestring af Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på AI-applikationsudrulning med Microsoft Foundry-integration.**

### Hvorfor dette kursus er vigtigt for moderne udviklere

Baseret på indsigter fra Microsoft Foundry Discord-fællesskabet, ønsker **45% af udviklerne at bruge AZD til AI-workloads**, men møder udfordringer med:
- Komplekse multi-service AI arkitekturer
- Bedste praksis for AI-udrulning i produktion  
- Azure AI service integration og konfiguration
- Omkostningsoptimering for AI workloads
- Fejlfinding af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD Grundlæggende**: Kernekoncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-services
- **Implementere Infrastruktur som kode**: Administrer Azure-ressourcer med Bicep skabeloner
- **Fejlfinding af udrulninger**: Løs almindelige problemer og debug fejl
- **Optimere til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge Multi-Agent Løsninger**: Udrul komplekse AI-arkitekturer

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaring og mål*

### 🚀 Kapitel 1: Grundlag & Hurtig Start
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinje  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du lærer
- Forstå Azure Developer CLI grundlæggende
- Installere AZD på din platform
- Din første succesfulde udrulning

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Basics](docs/getting-started/azd-basics.md) - Kernekoncepter og terminologi
- **⚙️ Opsætning**: [Installation & Setup](docs/getting-started/installation.md) - Plattform-specifikke guider
- **🛠️ Hands-On**: [Dit første projekt](docs/getting-started/first-project.md) - Trin-for-trin tutorial
- **📋 Hurtig reference**: [Kommando snydeark](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Hurtig installationskontrol
azd version

# Udrul din første applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitel resultat**: Succesfuldt udrulle en simpel webapplikation til Azure ved hjælp af AZD

**✅ Validering af succes:**
```bash
# Efter at have gennemført Kapitel 1, bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                  # Udruller til Azure
azd show                # Viser URL for kørende app
# Applikationen åbnes i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcer
```

**📊 Tidsforbrug:** 30-45 minutter  
**📈 Færdighedsniveau bagefter:** Kan udrulle basale applikationer selvstændigt

**✅ Validering af succes:**
```bash
# Efter at have gennemført Kapitel 1, bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                  # Udruller til Azure
azd show                # Viser kørende app URL
# Applikationen åbner i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcer
```

**📊 Tidsforbrug:** 30-45 minutter  
**📈 Færdighedsniveau bagefter:** Kan udrulle basale applikationer selvstændigt

---

### 🤖 Kapitel 2: AI-Første Udvikling (Anbefalet til AI-udviklere)
**Forudsætninger**: Kapitel 1 fuldført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Microsoft Foundry integration med AZD
- Udrulning af AI-drevne applikationer
- Forståelse af AI service konfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mønstre**: [AI Model Udrulning](docs/microsoft-foundry/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klar
- **🎥 Interaktiv guide**: [Workshop materialer](workshop/README.md) - Browser-baseret læring med MkDocs * DevContainer Miljø
- **📋 Skabeloner**: [Microsoft Foundry Skabeloner](../..)
- **📝 Eksempler**: [AZD Udrulningseksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Udrul din første AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prøv yderligere AI-skabeloner
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitel resultat**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-muligheder

**✅ Validering af succes:**
```bash
# Efter kapitel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-drevne svar med kilder
# Bekræfte, at søgeintegrationen fungerer
azd monitor  # Kontrollere, at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsforbrug:** 1-2 timer  
**📈 Færdighedsniveau bagefter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå udviklingsomkostninger på $80-150/måned, produktionsomkostninger på $300-3500/måned

#### 💰 Omkostningsovervejelser for AI-udrulninger

**Udviklingsmiljø (estimeret $80-150/måned):**
- Azure OpenAI (Betal efter forbrug): $0-50/måned (baseret på tokenforbrug)
- AI Search (Basic niveau): $75/måned
- Container Apps (Forbrug): $0-20/måned
- Storage (Standard): $1-5/måned

**Produktionsmiljø (estimeret $300-3.500+/måned):**
- Azure OpenAI (PTU for konsistent ydeevne): $3.000+/måned ELLER Betal efter forbrug med højt volumen
- AI Search (Standard niveau): $250/måned
- Container Apps (Dedikeret): $50-100/måned
- Application Insights: $5-50/måned
- Storage (Premium): $10-50/måned

**💡 Tips til omkostningsoptimering:**
- Brug **Gratis niveau** Azure OpenAI til læring (50.000 tokens/måned inkluderet)
- Kør `azd down` for at deallokere ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun til produktion
- Brug `azd provision --preview` for at estimere omkostninger før udrulning
- Aktiver autoskalering: betal kun for faktisk forbrug

**Omkostningsovervågning:**
```bash
# Tjek estimerede månedlige omkostninger
azd provision --preview

# Overvåg faktiske omkostninger i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentifikation
**Forudsætninger**: Kapitel 1 fuldført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Miljøkonfiguration og -styring
- Autentifikation og sikkerhed bedste praksis
- Navngivning og organisering af ressourcer

#### Læringsressourcer
- **📖 Konfiguration**: [Konfigurationsguide](docs/getting-started/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Autentifikationsmønstre og managed identity](docs/getting-started/authsecurity.md) - Autentifikationsmønstre
- **📝 Eksempler**: [Databaseapplikations eksempel](examples/database-app/README.md) - AZD databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity autentifikation
- Implementer miljøspecifikke konfigurationer

**💡 Kapitel resultat**: Administrer flere miljøer med korrekt autentifikation og sikkerhed

---

### 🏗️ Kapitel 4: Infrastruktur som kode & Udrulning
**Forudsætninger**: Kapitel 1-3 fuldført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hvad du lærer
- Avancerede udrulningsmønstre
- Infrastruktur som kode med Bicep
- Ressourceprovisioneringsstrategier

#### Læringsressourcer
- **📖 Udrulning**: [Udrulningsguide](docs/deployment/deployment-guide.md) - Komplette workflows
- **🏗️ Provisionering**: [Provisionering af ressourcer](docs/deployment/provisioning.md) - Azure ressourcehåndtering
- **📝 Eksempler**: [Container App Eksempel](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret tilpassede Bicep skabeloner
- Udrul multi-service applikationer
- Implementer blue-green udrulningsstrategier

**💡 Kapitel resultat**: Udrul komplekse multi-service applikationer ved brug af tilpassede infrastruktur skabeloner

---

### 🎯 Kapitel 5: Multi-Agent AI Løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 fuldført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐
#### Hvad du lærer
- Multi-agent arkitektur mønstre
- Agent orkestrering og koordinering
- Produktionsklare AI-implementeringer

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Færdig implementering
- **🛠️ ARM Skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klik implementering
- **📖 Arkitektur**: [Multi-agent koordinationsmønstre](/docs/pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Udrul den komplette detail multi-agent løsning
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitel resultat**: Implementer og administrer en produktionsklar multi-agent AI-løsning med kunde- og lageragenter

---

### 🔍 Kapitel 6: Forudgående validering & planlægning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Kapacitetsplanlægning og ressourcevalidering
- SKU udvælgelsesstrategier
- Forudgående tjek og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Udvælgelse**: [SKU Udvælgelse](docs/pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Forudgående tjek](docs/pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimer SKU udvælgelse for omkostninger
- Implementer automatiserede forudgående checks

**💡 Kapitel resultat**: Valider og optimer implementeringer før udførelse

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert deployeringskapitel gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du lærer
- Systematiske debuggingmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Almindelige problemer](docs/troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging guide](docs/troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI problemer**: [AI-specifik fejlfinding](docs/troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske øvelser
- Diagnostiser implementeringsfejl
- Løs autentificeringsproblemer
- Debug AI tjeneste forbindelser

**💡 Kapitel resultat**: Selvstændigt diagnosticer og løst almindelige implementeringsproblemer

---

### 🏢 Kapitel 8: Produktions- & Erhvervsmønstre
**Forudsætninger**: Kapitel 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du lærer
- Produktionsimplementeringsstrategier
- Erhvervssikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Best Practices for AI i produktion](docs/microsoft-foundry/production-ai-practices.md) - Erhvervsmønstre
- **📝 Eksempler**: [Microservices eksempel](../../examples/microservices) - Kompleks arkitektur
- **📊 Overvågning**: [Integration af Application Insights](docs/pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementer erhvervssikkerhedsmønstre
- Opsæt omfattende overvågning
- Deploy til produktion med korrekt governance

**💡 Kapitel resultat**: Implementer erhvervsklare applikationer med fulde produktionsmuligheder

---

## 🎓 Workshop Oversigt: Hands-On læring

> **⚠️ WORKSHOP STATUS: Aktiv Udvikling**  
> Workshopmaterialerne er under udvikling og finpudsning. Kernemoduler virker, men nogle avancerede afsnit er ikke færdige. Vi arbejder aktivt på at færdiggøre alt indhold. [Følg fremdrift →](workshop/README.md)

### Interaktive Workshopmaterialer
**Omfattende hands-on læring med browser-baserede værktøjer og guidede øvelser**

Vores workshopmaterialer tilbyder en struktureret, interaktiv læringsoplevelse, som supplerer kapitelbaseret curriculum ovenfor. Workshoppen er designet til både selvstyret læring og undervisningsledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browser-baseret interface**: Fuld MkDocs-baseret workshop med søgning, kopiering og tema-funktioner
- **GitHub Codespaces Integration**: Én-klik opsætning af udviklingsmiljø
- **Struktureret læringsvej**: 7-trins guidede øvelser (3,5 timer samlet)
- **Discovery → Deployment → Customization**: Progressiv metode
- **Interaktiv DevContainer-miljø**: Forudkonfigurerede værktøjer og afhængigheder

#### 📚 Workshopstruktur
Workshoppen følger en **Discovery → Deployment → Customization** metode:

1. **Discovery fase** (45 min)
   - Udforsk Microsoft Foundry skabeloner og tjenester
   - Forstå multi-agent arkitektur mønstre
   - Gennemgå implementeringskrav og forudsætninger

2. **Deployment fase** (2 timer)
   - Hands-on implementering af AI applikationer med AZD
   - Konfigurer Azure AI tjenester og endpoints
   - Implementer sikkerheds- og autentificeringsmønstre

3. **Customization fase** (45 min)
   - Tilpas applikationer til specifikke anvendelsestilfælde
   - Optimer til produktionsimplementering
   - Implementer overvågning og omkostningsstyring

#### 🚀 Kom godt i gang med Workshoppen
```bash
# Mulighed 1: GitHub Codespaces (Anbefalet)
# Klik på "Code" → "Create codespace on main" i lageret

# Mulighed 2: Lokal udvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg installationsvejledningen i workshop/README.md
```

#### 🎯 Workshop læringsresultater
Ved at gennemføre workshoppen vil deltagerne:
- **Deploy produktions-AI applikationer**: Brug AZD med Microsoft Foundry tjenester
- **Beherske multi-agent arkitekturer**: Implementer koordinerede AI agent løsninger
- **Implementer bedste praksis for sikkerhed**: Konfigurer autentificering og adgangskontrol
- **Optimer til skalerbarhed**: Design omkostningseffektive, højtydende implementeringer
- **Fejlfinding af implementeringer**: Løs almindelige problemer selvstændigt

#### 📖 Workshop ressourcer
- **🎥 Interaktiv guide**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læringsmiljø
- **📋 Trin-for-trin instruktioner**: [Guidede øvelser](../../workshop/docs/instructions) - Detaljerede gennemgange
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Hurtig start**: [Workshop opsætningsguide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler bootcamps.

---

## 📖 Hvad er Azure Developer CLI?

Azure Developer CLI (azd) er en udviklercentreret kommandolinjegrænseflade, der fremskynder processen med at bygge og deployere applikationer til Azure. Den tilbyder:

- **Template-baserede implementeringer** - Brug forbyggede skabeloner til almindelige applikationsmønstre
- **Infrastructure as Code** - Administrer Azure ressourcer med Bicep eller Terraform  
- **Integrerede workflows** - Sømløs provisoner, implementering og overvågning af applikationer
- **Udviklervenlig** - Optimeret til udviklerproduktivitet og oplevelse

### **AZD + Microsoft Foundry: Perfekt til AI-Implementeringer**

**Hvorfor AZD til AI-løsninger?** AZD adresserer de største udfordringer AI-udviklere møder:

- **AI-klare skabeloner** - Forud-konfigurerede skabeloner til Azure OpenAI, Cognitive Services og ML workloads
- **Sikre AI-implementeringer** - Bygget ind sikkerheds-mønstre til AI-tjenester, API-nøgler og modelendpoints  
- **Produktionsklare AI mønstre** - Bedste praksis til skalerbare, omkostningseffektive AI applikationsimplementeringer
- **End-to-End AI workflows** - Fra modeludvikling til produktionsimplementering med korrekt overvågning
- **Omkostningsoptimering** - Smarte ressourceallokeringer og skaleringsstrategier for AI workloads
- **Microsoft Foundry Integration** - Sømløs forbindelse til Microsoft Foundry modelkatalog og endpoints

---

## 🎯 Skabeloner & Eksempelbibliotek

### Fremhævet: Microsoft Foundry Skabeloner
**Start her hvis du implementerer AI applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure Samples, andre er lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Tjenester | Type |
|----------|---------|--------------|-----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævet: Fulde læringsscenarier
**Produktionsklare applikationsskabeloner knyttet til læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|----------------|--------------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI-deploy mønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Document Intelligence integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent framework og funktionskald |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med kunde- og lageragenter |

### Læring efter eksempeltype

> **📌 Lokale vs. Eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Klon fra de linkede repos

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Fuld produktionsklar implementering med ARM skabeloner
  - Multi-agent arkitektur (Kunde + Lagermedarbejder agenter)
  - Omfattende overvågning og evaluering
  - Én-klik implementering via ARM skabelon

#### Lokale eksempler - Container applikationer (Kapitel 2-5)
**Omfattende container deployments eksempler i dette repository:**
- [**Container App Examples**](examples/container-app/README.md) - Fuld guide til containeriserede implementeringer
  - [Simpel Flask API](../../examples/container-app/simple-flask-api) - Grundlæggende REST API med scale-to-zero
  - [Microservices arkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service implementering
  - Quick Start, Produktion og Avancerede deployments mønstre
  - Overvågning, sikkerhed og omkostningsoptimering vejledning

#### Eksterne eksempler - Simple applikationer (Kapitel 1-2)
**Klon disse Azure Samples repositories for at komme i gang:**
- [Simpel Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende implementeringsmønstre
- [Statisk Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk content deployment
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API deployment

#### Eksterne eksempler - Database integration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelse mønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless data workflow

#### Eksterne eksempler - Avancerede mønstre (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsprocesser  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML mønstre

### Eksterne skabelonsamlinger
- [**Officiel AZD Skabelongalleri**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community skabeloner
- [**Azure Developer CLI-skabeloner**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation  
- [**Eksempler-mappe**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer  

---

## 📚 Læringsressourcer & Referencer

### Hurtige Referencer
- [**Kommando Cheatsheet**](resources/cheat-sheet.md) - Grundlæggende azd-kommandoer organiseret efter kapitel  
- [**Glossar**](resources/glossary.md) - Azure og azd terminologi  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel  
- [**Studieguide**](resources/study-guide.md) - Omfattende øvelser  

### Hands-On Workshops
- [**AI Workshop Laboratorium**](docs/microsoft-foundry/ai-workshop-lab.md) - Gør dine AI-løsninger klar til AZD-udrulning (2-3 timer)  
- [**Interaktiv Workshop Guide**](workshop/README.md) - Browserbaseret workshop med MkDocs og DevContainer miljø  
- [**Struktureret Læringssti**](../../workshop/docs/instructions) - 7-trins guidede øvelser (Opdagelse → Udrulning → Tilpasning)  
- [**AZD For Begyndere Workshop**](workshop/README.md) - Fuldstændige hands-on workshopmaterialer med GitHub Codespaces integration  

### Eksterne Læringsressourcer
- Azure Developer CLI-dokumentation (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Azure Architecture Center (https://learn.microsoft.com/en-us/azure/architecture/)  
- Azure Prisberegner (https://azure.microsoft.com/pricing/calculator/)  
- Azure Status (https://status.azure.com/)  

---

## 🔧 Hurtig Fejlfinding Guide

**Almindelige problemer begyndere møder og hurtige løsninger:**

### ❌ "azd: kommando ikke fundet"

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

### ❌ "Ingen abonnement fundet" eller "Abonnement ikke sat"

```bash
# Liste over tilgængelige abonnementer
az account list --output table

# Indstil standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Indstil for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Bekræft
az account show
```

### ❌ "InsufficientQuota" eller "Kvote overskredet"

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

### ❌ "azd up" fejler halvvejs

```bash
# Mulighed 1: Rens og prøv igen
azd down --force --purge
azd up

# Mulighed 2: Ret kun infrastrukturen
azd provision

# Mulighed 3: Tjek detaljerede logfiler
azd show
azd logs
```

### ❌ "Godkendelse mislykkedes" eller "Token udløbet"

```bash
# Genautentificer
az logout
az login

azd auth logout
azd auth login

# Bekræft autentificering
az account show
```

### ❌ "Ressource eksisterer allerede" eller navnekonflikter

```bash
# AZD genererer unikke navne, men hvis der opstår konflikt:
azd down --force --purge

# Så prøv igen med et nyt miljø
azd env new dev-v2
azd up
```

### ❌ Skabelonudrulning tager for lang tid

**Normale ventetider:**  
- Simpel webapp: 5-10 minutter  
- App med database: 10-15 minutter  
- AI-applikationer: 15-25 minutter (OpenAI provisionering er langsom)  

```bash
# Tjek fremskridt
azd show

# Hvis fastlåst >30 minutter, tjek Azure Portal:
azd monitor
# Kig efter mislykkede implementeringer
```

### ❌ "Adgang nægtet" eller "Forbudt"

```bash
# Tjek din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal mindst have "Bidragyder"-rollen
# Bed din Azure-administrator om at give:
# - Bidragyder (for ressourcer)
# - Brugeradgangsadministrator (for rolle tildelinger)
```

### ❌ Kan ikke finde URL til udrullet applikation

```bash
# Vis alle tjenesteendepunkter
azd show

# Eller åbn Azure-portalen
azd monitor

# Tjek specifik tjeneste
azd env get-values
# Kig efter *_URL variabler
```

### 📚 Fuld Fejlfinding Ressourcer

- **Almindelige problemer guide:** [Detaljerede løsninger](docs/troubleshooting/common-issues.md)  
- **AI-specifikke problemer:** [AI Fejlfinding](docs/troubleshooting/ai-troubleshooting.md)  
- **Debugging guide:** [Trin-for-trin Debugging](docs/troubleshooting/debugging.md)  
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🔧 Hurtig Fejlfinding Guide

**Almindelige problemer begyndere møder og hurtige løsninger:**

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
# Liste tilgængelige abonnementer
az account list --output table

# Indstil standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Indstil til AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Bekræft
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Kvote overskredet"</strong></summary>

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

# Mulighed 2: Reparer kun infrastrukturen
azd provision

# Mulighed 3: Tjek detaljerede logs
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Godkendelse mislykkedes" eller "Token udløbet"</strong></summary>

```bash
# Genautentificer
az logout
az login

azd auth logout
azd auth login

# Bekræft autentificering
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource eksisterer allerede" eller navnekonflikter</strong></summary>

```bash
# AZD genererer unikke navne, men hvis der opstår konflikt:
azd down --force --purge

# Så prøv igen med et nyt miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Skabelonudrulning tager for lang tid</strong></summary>

**Normale ventetider:**  
- Simpel webapp: 5-10 minutter  
- App med database: 10-15 minutter  
- AI-applikationer: 15-25 minutter (OpenAI provisionering er langsom)  

```bash
# Tjek fremskridt
azd show

# Hvis fastlåst >30 minutter, tjek Azure Portal:
azd monitor
# Se efter mislykkede implementeringer
```
</details>

<details>
<summary><strong>❌ "Adgang nægtet" eller "Forbudt"</strong></summary>

```bash
# Kontrollér din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du har brug for mindst rollen "Bidragyder"
# Bed din Azure-administrator om at give:
# - Bidragyder (for ressourcer)
# - Brugeradgangsadministrator (for rolle tildelinger)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde URL til udrullet applikation</strong></summary>

```bash
# Vis alle serviceendepunkter
azd show

# Eller åbn Azure-portalen
azd monitor

# Tjek specifik service
azd env get-values
# Søg efter *_URL variabler
```
</details>

### 📚 Fuld Fejlfinding Ressourcer

- **Almindelige problemer guide:** [Detaljerede løsninger](docs/troubleshooting/common-issues.md)  
- **AI-specifikke problemer:** [AI Fejlfinding](docs/troubleshooting/ai-troubleshooting.md)  
- **Debugging guide:** [Trin-for-trin Debugging](docs/troubleshooting/debugging.md)  
- **Få hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli  

---

## 🎓 Kursusfuldførelse & Certificering

### Fremskridtssporing  
Følg din læringsprogression gennem hvert kapitel:  

- [ ] **Kapitel 1**: Fundament & Hurtig Start ✅  
- [ ] **Kapitel 2**: AI-Første Udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Godkendelse ✅  
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅  
- [ ] **Kapitel 5**: Multi-Agent AI Løsninger ✅  
- [ ] **Kapitel 6**: Forud-udrulning validering & planlægning ✅  
- [ ] **Kapitel 7**: Fejlfinding & Debugging ✅  
- [ ] **Kapitel 8**: Produktion & Enterprise-Mønstre ✅  

### Læringsverifikation  
Efter hvert kapitel skal du verificere din viden ved at:  
1. **Praktisk øvelse**: Fuldfør kapitelets hands-on udrulning  
2. **Videnscheck**: Gennemgå FAQ-sektionen for dit kapitel  
3. **Fællesskabsdiskussion**: Del dine erfaringer i Azure Discord  
4. **Næste kapitel**: Gå til næste kompleksitetsniveau  

### Fordele ved Kursusfuldførelse  
Når du har gennemført alle kapitler, vil du have:  
- **Produktionsoplevelse**: Udrullet ægte AI-applikationer til Azure  
- **Professionelle færdigheder**: Enterprise-klar udrulningsevner  
- **Fællesskabsanerkendelse**: Aktiv medlem af Azure udviklerfællesskabet  
- **Karrierefremskridt**: Eftertragtet AZD og AI-udrulningsekspertise  

---

## 🤝 Fællesskab & Support

### Få Hjælp & Support  
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)  
- **Læringsspørgsmål**: [Microsoft Azure Discord Fællesskab](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)  
- **Dokumentation**: [Officiel Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

### Fællesskabsindsigter fra Microsoft Foundry Discord  

**Seneste afstemningsresultater fra #Azure kanalen:**  
- **45%** af udviklerne ønsker at bruge AZD til AI-arbejdsbelastninger  
- **Top udfordringer**: Multi-service udrulninger, credential management, produktionsparathed  
- **Mest efterspurgte**: AI-specifikke skabeloner, fejlfinding guides, bedste praksis  

**Deltag i vores fællesskab for at:**  
- Dele dine AZD + AI erfaringer og få hjælp  
- Få tidlig adgang til nye AI-skabeloner  
- Bidrage til AI-udrulningens bedste praksis  
- Påvirke fremtidig AI + AZD funktionalitetsudvikling  

### Bidrag til Kurset  
Vi byder bidrag velkommen! Læs venligst vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:  
- **Indholdsforbedringer**: Forbedr eksisterende kapitler og eksempler  
- **Nye eksempler**: Tilføj virkelighedsnære scenarier og skabeloner  
- **Oversættelse**: Hjælp med at vedligeholde flersproget support  
- **Fejlrapporter**: Forbedr nøjagtighed og klarhed  
- **Fællesskabsstandarder**: Følg vores inkluderende fællesskabsretningslinjer  

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
### Copilot Serien

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde at lære?**

**Begyndere**: Start med [Kapitel 1: Grundlag & Hurtig start](../..)  
**AI-udviklere**: Spring til [Kapitel 2: AI-første udvikling](../..)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & autentificering](../..)

**Næste skridt**: [Begynd Kapitel 1 - AZD Grundlæggende](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets modersmål bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->