<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T12:20:03+00:00",
  "source_file": "README.md",
  "language_code": "da"
}
-->
# AZD for Begyndere: En Struktureret Læringsrejse

![AZD-for-beginners](../../../../translated_images/da/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kom Godt i Gang med Dette Kursus

Følg disse trin for at starte din AZD læringsrejse:

1. **Fork Repositoryet**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Repositoryet**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Deltag i Fællesskabet**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) for ekspertstøtte
4. **Vælg Din Læringssti**: Vælg et kapitel nedenfor, der matcher dit erfaringsniveau

### Multisprogsunderstøttelse

#### Automatiske Oversættelser (Altid Opdaterede)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](./README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Foretrækker du at klone lokalt?**

> Dette repository inkluderer 50+ sprogoversættelser, hvilket væsentligt øger downloadstørrelsen. For at klone uden oversættelser, brug sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dette giver dig alt, hvad du behøver for at gennemføre kurset med en væsentligt hurtigere download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursusoversigt

Bliv ekspert i Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på AI-applikationsudrulning med Microsoft Foundry-integration.**

### Hvorfor dette kursus er vigtigt for moderne udviklere

Baseret på indsigter fra Microsoft Foundry Discord-fællesskabet ønsker **45% af udviklerne at bruge AZD til AI-workloads** men møder udfordringer med:
- Komplekse AI-arkitekturer med flere services
- Bedste praksis ved AI-udrulning i produktion  
- Azure AI-serviceintegration og konfiguration
- Omkostningsoptimering for AI-workloads
- Fejlfinding ved AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD Fundamentet**: Grundlæggende koncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Microsoft Foundry-tjenester
- **Implementere Infrastruktur som kode**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlsøge Udrulninger**: Løs almindelige problemer og debug fejl
- **Optimere til Produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge Multi-agent Løsninger**: Udrul komplekse AI-arkitekturer

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Kapitel 1: Fundament & Hurtig Start
**Forudsætninger**: Azure abonnement, grundlæggende kendskab til kommandolinje  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du vil lære
- Forstå Azure Developer CLI grundprincipper
- Installere AZD på din platform
- Din første succesfulde udrulning

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Basics](docs/getting-started/azd-basics.md) - Kernesystemer og terminologi
- **⚙️ Opsætning**: [Installation & Opsætning](docs/getting-started/installation.md) - Platformsspecifikke guider
- **🛠️ Praktisk**: [Dit Første Projekt](docs/getting-started/first-project.md) - Trin-for-trin vejledning
- **📋 Hurtig reference**: [Kommando Oversigt](resources/cheat-sheet.md)

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
# Efter at have gennemført kapitel 1, bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                  # Udruller til Azure
azd show                # Viser kørende app URL
# Applikationen åbnes i browser og fungerer
azd down --force --purge  # Rydder op i ressourcer
```

**📊 Tidsforbrug:** 30-45 minutter  
**📈 Færdighedsniveau bagefter:** Kan selvstændigt udrulle basale applikationer

**✅ Succesvalidering:**
```bash
# Efter at have gennemført Kapitel 1, bør du kunne:
azd version              # Viser installeret version
azd init --template todo-nodejs-mongo  # Initialiserer projekt
azd up                  # Udruller til Azure
azd show                # Viser kørende app URL
# Applikationen åbnes i browseren og fungerer
azd down --force --purge  # Rydder op i ressourcer
```

**📊 Tidsforbrug:** 30-45 minutter  
**📈 Færdighedsniveau bagefter:** Kan selvstændigt udrulle basale applikationer

---

### 🤖 Kapitel 2: AI-First Udvikling (Anbefalet til AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Microsoft Foundry integration med AZD
- Udrul AI-drevene applikationer
- Forstå AI-servicekonfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mønstre**: [AI Model Udrulning](docs/microsoft-foundry/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klar
- **🎥 Interaktiv guide**: [Workshop Materialer](workshop/README.md) - Browser-baseret læring med MkDocs * DevContainer Miljø
- **📋 Skabeloner**: [Microsoft Foundry Skabeloner](../..)
- **📝 Eksempler**: [AZD Udrulnings Eksempler](examples/README.md)

#### Praktiske øvelser
```bash
# Udrul din første AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prøv yderligere AI-skabeloner
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Udrul og konfigurer en AI-drevet chatapplikation med RAG-funktionalitet

**✅ Succesvalidering:**
```bash
# Efter kapitel 2 bør du kunne:
azd init --template azure-search-openai-demo
azd up
# Teste AI-chatgrænsefladen
# Stille spørgsmål og få AI-drevne svar med kilder
# Bekræfte at søgeintegrationen fungerer
azd monitor  # Tjekke at Application Insights viser telemetri
azd down --force --purge
```

**📊 Tidsforbrug:** 1-2 timer  
**📈 Færdighedsniveau bagefter:** Kan udrulle og konfigurere produktionsklare AI-applikationer  
**💰 Omkostningsbevidsthed:** Forstå udviklingsomkostninger på $80-150/måned, produktionsomkostninger på $300-3500/måned

#### 💰 Omkostningsovervejelser for AI-udrulninger

**Udviklingsmiljø (Anslået $80-150/måned):**
- Azure OpenAI (Betal efter forbrug): $0-50/måned (baseret på tokenforbrug)
- AI Search (Basisniveau): $75/måned
- Container Apps (Consumption): $0-20/måned
- Storage (Standard): $1-5/måned

**Produktionsmiljø (Anslået $300-3,500+/måned):**
- Azure OpenAI (PTU for konsistent ydeevne): $3,000+/måned ELLER Betal efter forbrug med højt volumenniveau
- AI Search (Standardniveau): $250/måned
- Container Apps (Dedikeret): $50-100/måned
- Application Insights: $5-50/måned
- Storage (Premium): $10-50/måned

**💡 Omkostningsoptimeringstips:**
- Brug **Gratis Niveau** Azure OpenAI til læring (50.000 tokens/måned inkluderet)
- Kør `azd down` for at frigive ressourcer, når du ikke aktivt udvikler
- Start med forbrugsbaseret fakturering, opgrader til PTU kun for produktion
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
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Konfiguration og styring af miljøer
- Autentifikation og sikkerhedsbedste praksis
- Ressourcenavne og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Konfigurationsguide](docs/getting-started/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: [Autentifikationsmønstre og managed identity](docs/getting-started/authsecurity.md) - Autentifikationsmønstre
- **📝 Eksempler**: [Database App Eksempel](examples/database-app/README.md) - AZD Databaseeksempler

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt managed identity autentifikation
- Implementer miljøspecifikke konfigurationer

**💡 Kapitelresultat**: Administrer flere miljøer med korrekt autentifikation og sikkerhed

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
- **📖 Udrulning**: [Udrulningsguide](docs/deployment/deployment-guide.md) - Fuldstændige workflows
- **🏗️ Provisionering**: [Provisionering af Ressourcer](docs/deployment/provisioning.md) - Azure ressourcestyring
- **📝 Eksempler**: [Container App Eksempel](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Udrul multi-service applikationer
- Implementer blue-green udrulningsstrategier

**💡 Kapitelresultat**: Udrul komplekse multi-service applikationer ved hjælp af brugerdefinerede infrastrukturskabeloner

---

### 🎯 Kapitel 5: Multi-Agent AI Løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Multi-agent arkitektur mønstre

- Agent orkestrering og koordinering
- Produktionsklare AI-implementeringer

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplett implementering
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Et-klik installation
- **📖 Arkitektur**: [Multi-agent koordinationsmønstre](/docs/pre-deployment/coordination-patterns.md) - Mønstre

#### Praktiske øvelser
```bash
# Udrul den komplette detail multi-agent løsning
cd examples/retail-multiagent-arm-template
./deploy.sh

# Udforsk agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitel resultat**: Implementer og administrer en produktionsklar multi-agent AI-løsning med Customer og Inventory agenter

---

### 🔍 Kapitel 6: Forudgående validering & planlægning
**Forudsætninger**: Kapitel 4 fuldført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Kapacitetsplanlægning og ressourcevalidering
- Strategier for valg af SKU
- Forhåndstjek og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Udvælgelse**: [SKU-udvælgelse](docs/pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Forhåndstjek](docs/pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør scripts til kapacitetsvalidering
- Optimer SKU-valg for omkostninger
- Implementer automatiserede forhåndstjek

**💡 Kapitel resultat**: Valider og optimer implementeringer før eksekvering

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert implementeringskapitel fuldført  
**Varighed**: 1-1,5 time  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske fejlfindingsmetoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Almindelige problemer](docs/troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging-guide](docs/troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-specifik fejlfinding](docs/troubleshooting/ai-troubleshooting.md) - AI-tjenesteproblemer

#### Praktiske øvelser
- Diagnostiser implementeringsfejl
- Løs autentificeringsproblemer
- Debug AI-tjeneste-forbindelse

**💡 Kapitel resultat**: Selvstændigt diagnosticer og løs almindelige implementeringsproblemer

---

### 🏢 Kapitel 8: Produktions- & Enterprise-mønstre
**Forudsætninger**: Kapitel 1-4 fuldført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Produktionsimplementeringsstrategier
- Enterprise sikkerhedsmønstre
- Overvågning og omkostningsoptimering

#### Læringsressourcer
- **🏭 Produktion**: [Produktion AI bedste praksisser](docs/microsoft-foundry/production-ai-practices.md) - Enterprise-mønstre
- **📝 Eksempler**: [Microservices Eksempel](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Overvågning

#### Praktiske øvelser
- Implementer enterprise sikkerhedsmønstre
- Opsæt omfattende overvågning
- Implementer til produktion med korrekt styring

**💡 Kapitel resultat**: Implementer enterprise-klar applikationer med fulde produktionsmuligheder

---

## 🎓 Workshopoversigt: Praktisk læringserfaring

> **⚠️ WORKSHOP STATUS: Aktiv udvikling**  
> Workshopmaterialerne udvikles og forbedres stadig. Kernemodulerne er funktionelle, men nogle avancerede sektioner mangler stadig. Vi arbejder aktivt på at færdiggøre alt indhold. [Følg fremskridt →](workshop/README.md)

### Interaktive workshopmaterialer
**Omfattende praktisk læring med browser-baserede værktøjer og guidede øvelser**

Vores workshopmaterialer tilbyder en struktureret, interaktiv læring, der supplerer det kapitelbaserede pensum ovenfor. Workshoppen er designet til både selvstyret læring og instruktørledte sessioner.

#### 🛠️ Workshop Funktioner
- **Browser-baseret interface**: Fuld MkDocs-drevet workshop med søgning, kopiering og tema-funktioner
- **GitHub Codespaces integration**: Et-klik opsætning af udviklingsmiljø
- **Struktureret læringsvej**: 7-trins guidede øvelser (3,5 timer samlet)
- **Discovery → Deployment → Customization**: Progressiv metode
- **Interaktivt DevContainer miljø**: Forudkonfigurerede værktøjer og afhængigheder

#### 📚 Workshop Struktur
Workshoppen følger en **Discovery → Deployment → Customization** metode:

1. **Discovery fase** (45 min)
   - Udforsk Microsoft Foundry skabeloner og services
   - Forstå multi-agent arkitektur mønstre
   - Gennemgå implementeringskrav og forudsætninger

2. **Implementeringsfase** (2 timer)
   - Praktisk implementering af AI-applikationer med AZD
   - Konfigurer Azure AI services og endpoints
   - Implementer sikkerheds- og autentificeringsmønstre

3. **Tilpasningsfase** (45 min)
   - Tilpas applikationer til specifikke brugsscenarier
   - Optimer til produktionsimplementering
   - Implementer overvågning og omkostningsstyring

#### 🚀 Kom godt i gang med workshoppen
```bash
# Mulighed 1: GitHub Codespaces (Anbefalet)
# Klik "Code" → "Create codespace on main" i repositoryet

# Mulighed 2: Lokal Udvikling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Følg installationsvejledningen i workshop/README.md
```

#### 🎯 Workshop læringsmål
Ved at gennemføre workshoppen vil deltagerne:
- **Implementere produktions-AI-applikationer**: Brug AZD med Microsoft Foundry services
- **Beherske multi-agent arkitekturer**: Implementer koordinerede AI-agent løsninger
- **Implementere sikkerhedsbest practices**: Konfigurer autentificering og adgangskontrol
- **Optimere for skalerbarhed**: Design omkostningseffektive, performante implementeringer
- **Fejlsøge implementeringer**: Løs almindelige problemer selvstændigt

#### 📖 Workshop ressourcer
- **🎥 Interaktiv guide**: [Workshop-materialer](workshop/README.md) - Browser-baseret læringsmiljø
- **📋 Trin-for-trin instruktioner**: [Guidede øvelser](../../workshop/docs/instructions) - Detaljerede vejledninger
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Hurtig start**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstyret læring og udvikler-bootcamps.

---

## 📖 Hvad er Azure Developer CLI?

Azure Developer CLI (azd) er en udviklerfokuseret kommandolinjegrænseflade, der accelererer processen med at bygge og implementere applikationer til Azure. Den tilbyder:

- **Skabelonbaserede implementeringer** - Brug forudbyggede skabeloner til almindelige applikationsmønstre
- **Infrastructure as Code** - Administrer Azure ressourcer med Bicep eller Terraform  
- **Integrerede arbejdsgange** - Problemfri provisionering, implementering og overvågning
- **Udviklervenlig** - Optimeret for udviklerproduktivitet og oplevelse

### **AZD + Microsoft Foundry: Perfekt til AI-implementeringer**

**Hvorfor AZD til AI-løsninger?** AZD imødekommer de største udfordringer, AI-udviklere står overfor:

- **AI-klar skabeloner** - Forudkonfigurerede skabeloner til Azure OpenAI, Cognitive Services og ML workloads
- **Sikrede AI-implementeringer** - Indbyggede sikkerhedsmønstre for AI services, API-nøgler og modelendpoints  
- **Produktions-AI mønstre** - Bedste praksis for skalerbare, omkostningseffektive AI-applikationsimplementeringer
- **End-to-End AI arbejdsgange** - Fra modeludvikling til produktionsimplementering med korrekt overvågning
- **Omkostningsoptimering** - Smarte ressourceallokering- og skaleringsstrategier for AI workloads
- **Microsoft Foundry integration** - Problemfri forbindelse til Microsoft Foundry modelkatalog og endpoints

---

## 🎯 Skabelon- & eksempelbibliotek

### Fremhævet: Microsoft Foundry skabeloner
**Start her, hvis du implementerer AI-applikationer!**

> **Bemærk:** Disse skabeloner demonstrerer forskellige AI-mønstre. Nogle er eksterne Azure Samples, andre lokale implementeringer.

| Skabelon | Kapitel | Kompleksitet | Services | Type |
|----------|---------|--------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Ekstern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Ekstern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Ekstern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Ekstern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Ekstern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Ekstern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Fremhævet: Komplette læringsscenarier
**Produktionsklare applikationsskabeloner knyttet til læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|----------------|--------------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI implementeringsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration af Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent-framework og funktionskald |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise AI orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Customer og Inventory agenter |

### Læring ved eksemplerstype

> **📌 Lokale vs. eksterne eksempler:**  
> **Lokale eksempler** (i dette repo) = Klar til brug med det samme  
> **Eksterne eksempler** (Azure Samples) = Klon fra tilknyttede repositories

#### Lokale eksempler (Klar til brug)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produktionsklar implementering med ARM-skabeloner
  - Multi-agent arkitektur (Customer + Inventory agenter)
  - Omfattende overvågning og evaluering
  - Et-klik implementering via ARM-skabelon

#### Lokale eksempler - Container applikationer (Kapitel 2-5)
**Omfattende eksempler på containerimplementering i dette depot:**
- [**Container App Examples**](examples/container-app/README.md) - Fuld guide til containeriserede implementeringer
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Basal REST API med scale-to-zero
  - [Microservices Arkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service implementering
  - Quick Start, Produktion og Avancerede implementeringsmønstre
  - Overvågning, sikkerhed og omkostningsoptimeringsvejledning

#### Eksterne eksempler - Simpel applikationer (Kapitel 1-2)
**Klon disse Azure Samples repositories for at komme i gang:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlæggende implementeringsmønstre
- [Statisk website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statisk indholdsimplementering
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API implementering

#### Eksterne eksempler - Database integration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Databaseforbindelsesmønstre
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverløse dataarbejdsgange

#### Eksterne eksempler - Avancerede mønstre (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Baggrundsbehandling  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklare ML-mønstre

### Eksterne skabelonsamlinger
- [**Officiel AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kurateret samling af officielle og community-skabeloner
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn skabelondokumentation
- [**Eksempelmappe**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige referencer
- [**Kommando Hurtigguide**](resources/cheat-sheet.md) - Vigtige azd-kommandoer organiseret efter kapitel
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**Ofte stillede spørgsmål (FAQ)**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende praktiske øvelser

### Praktiske workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Gør dine AI-løsninger klar til AZD-udrulning (2-3 timer)
- [**Interaktiv Workshop Guide**](workshop/README.md) - Browserbaseret workshop med MkDocs og DevContainer-miljø
- [**Struktureret Læringssti**](../../workshop/docs/instructions) - 7-trins guidede øvelser (Opdagelse → Udrulning → Tilpasning)
- [**AZD For Begyndere Workshop**](workshop/README.md) - Fuldstændige hands-on workshopmaterialer med GitHub Codespaces-integration

### Eksterne læringsressourcer
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Hurtig Fejlfinding Guide

**Almindelige problemer som begyndere møder og hurtige løsninger:**

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
# Liste tilgængelige abonnementer
az account list --output table

# Indstil standardabonnement
az account set --subscription "<subscription-id-or-name>"

# Indstil for AZD-miljø
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Bekræft
az account show
```

### ❌ "InsufficientQuota" eller "Kvoten overskredet"

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

### ❌ "azd up" fejler midt i processen

```bash
# Mulighed 1: Rens og prøv igen
azd down --force --purge
azd up

# Mulighed 2: Ret blot infrastrukturen
azd provision

# Mulighed 3: Tjek detaljerede logs
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

# Så prøv igen med et frisk miljø
azd env new dev-v2
azd up
```

### ❌ Skabelonudrulning tager for lang tid

**Normale ventetider:**
- Enkel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikationer: 15-25 minutter (OpenAI-provisionering er langsom)

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

# Du skal have mindst rollen "Contributor"
# Bed din Azure-administrator om at tildele:
# - Contributor (for ressourcer)
# - User Access Administrator (for rolle tildelinger)
```

### ❌ Kan ikke finde URL til udrullet applikation

```bash
# Vis alle serviceendepunkter
azd show

# Eller åbn Azure Portal
azd monitor

# Tjek specifik tjeneste
azd env get-values
# Kig efter *_URL variabler
```

### 📚 Fuld Fejlfinding Ressourcer

- **Guide til Almindelige Problemer:** [Detaljerede Løsninger](docs/troubleshooting/common-issues.md)
- **AI-specifikke Problemer:** [AI Fejlfinding](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Trin-for-trin Debugging](docs/troubleshooting/debugging.md)
- **Få Hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Hurtig Fejlfinding Guide

**Almindelige problemer som begyndere møder og hurtige løsninger:**

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
<summary><strong>❌ "azd up" fejler midt i processen</strong></summary>

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
</details>

<details>
<summary><strong>❌ "Godkendelse mislykkedes" eller "Token udløbet"</strong></summary>

```bash
# Re-autentificer
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

# Prøv derefter igen med et frisk miljø
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Skabelonudrulning tager for lang tid</strong></summary>

**Normale ventetider:**
- Enkel webapp: 5-10 minutter
- App med database: 10-15 minutter
- AI-applikationer: 15-25 minutter (OpenAI-provisionering er langsom)

```bash
# Tjek fremdrift
azd show

# Hvis fast i >30 minutter, tjek Azure Portal:
azd monitor
# Kig efter mislykkede implementeringer
```
</details>

<details>
<summary><strong>❌ "Adgang nægtet" eller "Forbudt"</strong></summary>

```bash
# Tjek din Azure-rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du skal have mindst "Contributor"-rolle
# Bed din Azure-administrator om at give:
# - Contributor (for ressourcer)
# - User Access Administrator (for rolle tildelinger)
```
</details>

<details>
<summary><strong>❌ Kan ikke finde URL til udrullet applikation</strong></summary>

```bash
# Vis alle serviceendepunkter
azd show

# Eller åbn Azure Portal
azd monitor

# Tjek specifik service
azd env get-values
# Kig efter *_URL variabler
```
</details>

### 📚 Fuld Fejlfinding Ressourcer

- **Guide til Almindelige Problemer:** [Detaljerede Løsninger](docs/troubleshooting/common-issues.md)
- **AI-specifikke Problemer:** [AI Fejlfinding](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging Guide:** [Trin-for-trin Debugging](docs/troubleshooting/debugging.md)
- **Få Hjælp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursusfuldførelse & Certificering

### Fremskridtsopfølgning
Følg dit læringsfremskridt gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlæggende & Hurtig Start ✅
- [ ] **Kapitel 2**: AI-First Udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Godkendelse ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-Agent AI Løsninger ✅
- [ ] **Kapitel 6**: Forudgående Validering & Planlægning ✅
- [ ] **Kapitel 7**: Fejlfinding & Debugging ✅
- [ ] **Kapitel 8**: Produktion & Enterprise Mønstre ✅

### Læringsverificering
Efter hvert kapitel, bekræft din viden ved at:
1. **Praktisk Øvelse**: Fuldfør kapitlets hands-on udrulning
2. **Videnscheck**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del dine erfaringer i Azure Discord
4. **Næste Kapitel**: Gå til næste kompleksitetsniveau

### Kursusfuldførelsesfordele
Når du har gennemført alle kapitler, vil du have:
- **Produktionsoplevelse**: Udrullet rigtige AI-applikationer til Azure
- **Professionelle færdigheder**: Enterprise-klar udrulningsevne  
- **Fællesskabsanerkendelse**: Aktiv medlem af Azure-udviklerfællesskabet
- **Karrierefremme**: Efterspurgt AZD- og AI-udrulningsekspertise

---

## 🤝 Fællesskab & Support

### Få Hjælp & Support
- **Tekniske problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørgsmål**: [Microsoft Azure Discord Fællesskab](https://discord.gg/microsoft-azure) og [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjælp**: Deltag i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiel Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigt fra Microsoft Foundry Discord

**Seneste meningsmåleresultater fra #Azure-kanalen:**
- **45 %** af udviklere ønsker at bruge AZD til AI arbejdsbelastninger
- **Topudfordringer**: Multi-service udrulninger, legitimationsstyring, produktionsberedskab  
- **Mest efterspurgt**: AI-specifikke skabeloner, fejlfinding guider, bedste praksis

**Deltag i vores fællesskab for at:**
- Dele dine erfaringer med AZD + AI og få hjælp
- Få adgang til tidlige prøver af nye AI-skabeloner
- Bidrage til AI-udrulningens bedste praksis
- Påvirke fremtidig AI + AZD funktionalitetsudvikling

### Bidrage til kurset
Vi byder bidrag velkommen! Læs vores [Bidragsvejledning](CONTRIBUTING.md) for detaljer om:
- **Indholdsforbedringer**: Forbedr eksisterende kapitler og eksempler
- **Nye Eksempler**: Tilføj virkelighedsnære scenarier og skabeloner  
- **Oversættelse**: Hjælp med vedligeholdelse af flersprogget understøttelse
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
 
### Copilot-serie
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursusnavigation

**🚀 Klar til at begynde at lære?**

**Begyndere**: Start med [Kapitel 1: Grundlag & Hurtig start](../..)  
**AI-udviklere**: Spring til [Kapitel 2: AI-først udvikling](../..)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & godkendelse](../..)

**Næste skridt**: [Begynd Kapitel 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets modersmål bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for eventuelle misforståelser eller fejltolkninger, der opstår ved brug af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->