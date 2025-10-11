<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "56313679644ccd28e9d15bb7089ae5ca",
  "translation_date": "2025-10-11T14:59:26+00:00",
  "source_file": "README.md",
  "language_code": "da"
}
-->
# AZD For Begyndere: En Struktureret Læringsrejse

![AZD-for-begyndere](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.da.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/kzRShWzttr)](https://discord.gg/kzRShWzttr)

## Kom godt i gang med dette kursus

Følg disse trin for at starte din AZD-læringsrejse:

1. **Fork repositoryet**: Klik [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon repositoryet**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Deltag i fællesskabet**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) for eksperthjælp
4. **Vælg din læringssti**: Vælg et kapitel nedenfor, der passer til dit erfaringsniveau

### Flersproget support

#### Automatiske oversættelser (Altid opdateret)

[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](./README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

## Kursusoversigt

Bliv ekspert i Azure Developer CLI (azd) gennem strukturerede kapitler designet til progressiv læring. **Særligt fokus på AI-applikationsudrulning med Azure AI Foundry-integration.**

### Hvorfor dette kursus er vigtigt for moderne udviklere

Baseret på indsigt fra Azure AI Foundry Discord-fællesskabet ønsker **45% af udviklerne at bruge AZD til AI-arbejdsbelastninger**, men støder på udfordringer med:
- Komplekse AI-arkitekturer med flere tjenester
- Bedste praksis for produktionsudrulning af AI
- Integration og konfiguration af Azure AI-tjenester
- Omkostningsoptimering for AI-arbejdsbelastninger
- Fejlfinding af AI-specifikke udrulningsproblemer

### Læringsmål

Ved at gennemføre dette strukturerede kursus vil du:
- **Beherske AZD-grundlæggende**: Kernekoncepter, installation og konfiguration
- **Udrulle AI-applikationer**: Brug AZD med Azure AI Foundry-tjenester
- **Implementere Infrastructure as Code**: Administrer Azure-ressourcer med Bicep-skabeloner
- **Fejlsøge udrulninger**: Løs almindelige problemer og debug fejl
- **Optimere til produktion**: Sikkerhed, skalering, overvågning og omkostningsstyring
- **Bygge multi-agent løsninger**: Udrulle komplekse AI-arkitekturer

## 📚 Læringskapitler

*Vælg din læringssti baseret på erfaringsniveau og mål*

### 🚀 Kapitel 1: Grundlag & Hurtig Start
**Forudsætninger**: Azure-abonnement, grundlæggende kendskab til kommandolinjen  
**Varighed**: 30-45 minutter  
**Kompleksitet**: ⭐

#### Hvad du vil lære
- Forståelse af Azure Developer CLI-grundlæggende
- Installation af AZD på din platform
- Din første succesfulde udrulning

#### Læringsressourcer
- **🎯 Start her**: [Hvad er Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Basics](docs/getting-started/azd-basics.md) - Kernekoncepter og terminologi
- **⚙️ Opsætning**: [Installation & Opsætning](docs/getting-started/installation.md) - Platform-specifikke vejledninger
- **🛠️ Praktisk**: [Dit første projekt](docs/getting-started/first-project.md) - Trin-for-trin tutorial
- **📋 Hurtig reference**: [Kommandosnydeark](resources/cheat-sheet.md)

#### Praktiske øvelser
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Udrul en simpel webapplikation til Azure ved hjælp af AZD

---

### 🤖 Kapitel 2: AI-First Udvikling (Anbefales til AI-udviklere)
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 1-2 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Integration af Azure AI Foundry med AZD
- Udrulning af AI-drevne applikationer
- Forståelse af AI-tjenestekonfigurationer

#### Læringsressourcer
- **🎯 Start her**: [Azure AI Foundry Integration](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mønstre**: [AI Model Deployment](docs/ai-foundry/ai-model-deployment.md) - Udrul og administrer AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-klar
- **🎥 Interaktiv guide**: [Workshop Materialer](workshop/README.md) - Browserbaseret læring med MkDocs * DevContainer Environment
- **📋 Skabeloner**: [Azure AI Foundry Skabeloner](../..)

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

---

### ⚙️ Kapitel 3: Konfiguration & Autentifikation
**Forudsætninger**: Kapitel 1 gennemført  
**Varighed**: 45-60 minutter  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Miljøkonfiguration og -styring
- Bedste praksis for autentifikation og sikkerhed
- Ressourcenavngivning og organisering

#### Læringsressourcer
- **📖 Konfiguration**: [Konfigurationsguide](docs/getting-started/configuration.md) - Miljøopsætning
- **🔐 Sikkerhed**: Autentifikationsmønstre og administreret identitet
- **📝 Eksempler**: [Database App Eksempel](../../examples/database-app) - Konfigurationsmønstre

#### Praktiske øvelser
- Konfigurer flere miljøer (dev, staging, prod)
- Opsæt administreret identitetsautentifikation
- Implementer miljøspecifikke konfigurationer

**💡 Kapitelresultat**: Administrer flere miljøer med korrekt autentifikation og sikkerhed

---

### 🏗️ Kapitel 4: Infrastructure as Code & Udrulning
**Forudsætninger**: Kapitel 1-3 gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐⭐

#### Hvad du vil lære
- Avancerede udrulningsmønstre
- Infrastructure as Code med Bicep
- Strategier for ressourceprovisionering

#### Læringsressourcer
- **📖 Udrulning**: [Udrulningsguide](docs/deployment/deployment-guide.md) - Komplette arbejdsgange
- **🏗️ Provisionering**: [Provisionering af ressourcer](docs/deployment/provisioning.md) - Azure ressourceadministration
- **📝 Eksempler**: [Container App Eksempel](../../examples/container-app) - Containeriserede udrulninger

#### Praktiske øvelser
- Opret brugerdefinerede Bicep-skabeloner
- Udrul applikationer med flere tjenester
- Implementer blue-green udrulningsstrategier

**💡 Kapitelresultat**: Udrul komplekse applikationer med flere tjenester ved hjælp af brugerdefinerede infrastrukturskabeloner

---

### 🎯 Kapitel 5: Multi-Agent AI-løsninger (Avanceret)
**Forudsætninger**: Kapitel 1-2 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad du vil lære
- Mønstre for multi-agent arkitektur
- Agentorkestrering og koordinering
- Produktionsklare AI-udrulninger

#### Læringsressourcer
- **🤖 Fremhævet projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplet implementering
- **🛠️ ARM-skabeloner**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Én-klik udrulning
- **📖 Arkitektur**: Mønstre for multi-agent koordinering

#### Praktiske øvelser
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Udrul og administrer en produktionsklar multi-agent AI-løsning med kunde- og lageragenter

---

### 🔍 Kapitel 6: Validering & Planlægning før udrulning
**Forudsætninger**: Kapitel 4 gennemført  
**Varighed**: 1 time  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Kapacitetsplanlægning og ressourcevalidering
- Strategier for valg af SKU'er
- Pre-flight checks og automatisering

#### Læringsressourcer
- **📊 Planlægning**: [Kapacitetsplanlægning](docs/pre-deployment/capacity-planning.md) - Ressourcevalidering
- **💰 Valg**: [SKU-valg](docs/pre-deployment/sku-selection.md) - Omkostningseffektive valg
- **✅ Validering**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automatiserede scripts

#### Praktiske øvelser
- Kør kapacitetsvalideringsscripts
- Optimer SKU-valg for omkostninger
- Implementer automatiserede pre-deployment checks

**💡 Kapitelresultat**: Valider og optimer udrulninger før eksekvering

---

### 🚨 Kapitel 7: Fejlfinding & Debugging
**Forudsætninger**: Ethvert udrulningskapitel gennemført  
**Varighed**: 1-1,5 timer  
**Kompleksitet**: ⭐⭐

#### Hvad du vil lære
- Systematiske debugging-metoder
- Almindelige problemer og løsninger
- AI-specifik fejlfinding

#### Læringsressourcer
- **🔧 Almindelige problemer**: [Almindelige problemer](docs/troubleshooting/common-issues.md) - FAQ og løsninger
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Trin-for-trin strategier
- **🤖 AI-problemer**: [AI-specifik fejlfinding](docs/troubleshooting/ai-troubleshooting.md) - Problemer med AI-tjenester

#### Praktiske øvelser
- Diagnosticer udrulningsfejl
- Løs autentifikationsproblemer
- Debug AI-tjenesteforbindelser

**💡 Kapitelresultat**: Diagnosticer og løs almindelige udrulningsproblemer selvstændigt

---

### 🏢 Kapitel 8: Produktions- & Enterprise-mønstre
**Forudsætninger**: Kapitel 1-4 gennemført  
**Varighed**: 2-3 timer  
**Kompleksitet**: ⭐⭐⭐⭐

#### Hvad Du Vil Lære
- Strategier for produktionsudrulning
- Sikkerhedsmønstre for virksomheder
- Overvågning og optimering af omkostninger

#### Læringsressourcer
- **🏭 Produktion**: [Produktion AI Best Practices](docs/ai-foundry/production-ai-practices.md) - Mønstre for virksomheder
- **📝 Eksempler**: [Eksempel på mikroservices](../../examples/microservices) - Komplekse arkitekturer
- **📊 Overvågning**: Integration med Application Insights

#### Praktiske Øvelser
- Implementer sikkerhedsmønstre for virksomheder
- Opsæt omfattende overvågning
- Udrul til produktion med korrekt styring

**💡 Kapitelresultat**: Udrul applikationer klar til virksomheder med fulde produktionskapaciteter

---

## 🎓 Workshopoversigt: Praktisk Læring

### Interaktive Workshopmaterialer
**Omfattende praktisk læring med browserbaserede værktøjer og guidede øvelser**

Vores workshopmaterialer tilbyder en struktureret, interaktiv læringsoplevelse, der supplerer det kapitelbaserede pensum ovenfor. Workshoppen er designet til både selvstudium og instruktørledede sessioner.

#### 🛠️ Workshopfunktioner
- **Browserbaseret Interface**: Komplet MkDocs-drevet workshop med søge-, kopierings- og temafunktioner
- **GitHub Codespaces Integration**: Ét klik for opsætning af udviklingsmiljø
- **Struktureret Læringssti**: 7-trins guidede øvelser (3,5 timer i alt)
- **Opdagelse → Udrulning → Tilpasning**: Progressiv metodologi
- **Interaktiv DevContainer Miljø**: Forudkonfigurerede værktøjer og afhængigheder

#### 📚 Workshopstruktur
Workshoppen følger en **Opdagelse → Udrulning → Tilpasning** metodologi:

1. **Opdagelsesfase** (45 min)
   - Udforsk Azure AI Foundry skabeloner og tjenester
   - Forstå mønstre for multi-agent arkitektur
   - Gennemgå krav og forudsætninger for udrulning

2. **Udrulningsfase** (2 timer)
   - Praktisk udrulning af AI-applikationer med AZD
   - Konfigurer Azure AI-tjenester og endpoints
   - Implementer sikkerheds- og autentifikationsmønstre

3. **Tilpasningsfase** (45 min)
   - Tilpas applikationer til specifikke brugsscenarier
   - Optimer til produktionsudrulning
   - Implementer overvågning og omkostningsstyring

#### 🚀 Kom i gang med workshoppen
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Workshop Læringsresultater
Ved at gennemføre workshoppen vil deltagerne:
- **Udrulle Produktions-AI Applikationer**: Brug AZD med Azure AI Foundry tjenester
- **Beherske Multi-Agent Arkitekturer**: Implementere koordinerede AI-agent løsninger
- **Implementere Sikkerhedsbedste Praksis**: Konfigurere autentifikation og adgangskontrol
- **Optimere til Skala**: Designe omkostningseffektive og præstationsdygtige udrulninger
- **Fejlsøge Udrulninger**: Løse almindelige problemer selvstændigt

#### 📖 Workshopressourcer
- **🎥 Interaktiv Guide**: [Workshopmaterialer](workshop/README.md) - Browserbaseret læringsmiljø
- **📋 Trin-for-Trin Instruktioner**: [Guidede Øvelser](../../workshop/docs/instructions) - Detaljerede gennemgange
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - AI-fokuserede øvelser
- **💡 Hurtig Start**: [Workshop Opsætningsguide](workshop/README.md#quick-start) - Miljøkonfiguration

**Perfekt til**: Virksomhedstræning, universitetskurser, selvstudium og udvikler bootcamps.

---

## 📖 Hvad er Azure Developer CLI?

Azure Developer CLI (azd) er en udviklercentreret kommandolinjegrænseflade, der fremskynder processen med at bygge og udrulle applikationer til Azure. Den tilbyder:

- **Skabelonbaserede udrulninger** - Brug forudbyggede skabeloner til almindelige applikationsmønstre
- **Infrastruktur som kode** - Administrer Azure-ressourcer med Bicep eller Terraform  
- **Integrerede arbejdsgange** - Problemfrit provisionere, udrulle og overvåge applikationer
- **Udviklervenlig** - Optimeret til udviklerproduktivitet og oplevelse

### **AZD + Azure AI Foundry: Perfekt til AI-udrulninger**

**Hvorfor AZD til AI-løsninger?** AZD adresserer de største udfordringer AI-udviklere står overfor:

- **AI-Klar Skabeloner** - Forudkonfigurerede skabeloner til Azure OpenAI, Cognitive Services og ML-arbejdsbelastninger
- **Sikre AI-udrulninger** - Indbyggede sikkerhedsmønstre for AI-tjenester, API-nøgler og modelendpoints  
- **Produktions-AI Mønstre** - Bedste praksis for skalerbare, omkostningseffektive AI-applikationsudrulninger
- **End-to-End AI Arbejdsgange** - Fra modeludvikling til produktionsudrulning med korrekt overvågning
- **Omkostningsoptimering** - Smarte ressourceallokerings- og skaleringsstrategier for AI-arbejdsbelastninger
- **Azure AI Foundry Integration** - Problemfri forbindelse til AI Foundry modelkatalog og endpoints

---

## 🎯 Skabeloner & Eksempelsamling

### Fremhævet: Azure AI Foundry Skabeloner
**Start her, hvis du udruller AI-applikationer!**

| Skabelon | Kapitel | Kompleksitet | Tjenester |
|----------|---------|--------------|-----------|
| [**Kom i gang med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Kom i gang med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent arbejdsgangsautomatisering**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generer dokumenter fra dine data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Forbedr kundemøder med agenter**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Moderniser din kode med agenter**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Byg din samtaleagent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Lås op for indsigt fra samtaledata**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal indholdsbehandling**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Fremhævet: Komplette Læringsscenarier
**Produktionsklare applikationsskabeloner kortlagt til læringskapitler**

| Skabelon | Læringskapitel | Kompleksitet | Nøglelæring |
|----------|----------------|--------------|-------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlæggende AI-udrulningsmønstre |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration af dokumentintelligens |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentframework og funktionskald |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Orkestrering af AI til virksomheder |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med kunde- og lageragenter |

### Læring efter Eksempeltype

#### Enkle Applikationer (Kapitel 1-2)
- [Simple Web App](../../examples/simple-web-app) - Grundlæggende udrulningsmønstre
- [Statisk Website](../../examples/static-site) - Udrulning af statisk indhold
- [Basic API](../../examples/basic-api) - REST API-udrulning

#### Databaseintegration (Kapitel 3-4)  
- [Database App](../../examples/database-app) - Mønstre for databaseforbindelse
- [Data Processing](../../examples/data-processing) - ETL-arbejdsgangsudrulning

#### Avancerede Mønstre (Kapitel 4-8)
- [Container Apps](../../examples/container-app) - Containeriserede udrulninger
- [Mikroservices](../../examples/microservices) - Multi-service arkitekturer  
- [Virksomhedsløsninger](../../examples/enterprise) - Produktionsklare mønstre

### Eksterne Skabelonsamlinger
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Officielle Microsoft-eksempler
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Skabeloner bidraget af fællesskabet
- [**Eksempelskatalog**](examples/README.md) - Lokale læringseksempler med detaljerede forklaringer

---

## 📚 Læringsressourcer & Referencer

### Hurtige Referencer
- [**Kommandosnydeark**](resources/cheat-sheet.md) - Vigtige azd-kommandoer organiseret efter kapitel
- [**Ordliste**](resources/glossary.md) - Terminologi for Azure og azd  
- [**FAQ**](resources/faq.md) - Almindelige spørgsmål organiseret efter læringskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattende praksisøvelser

### Praktiske Workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Gør dine AI-løsninger AZD-udrulningsklare (2-3 timer)
- [**Interaktiv Workshop Guide**](workshop/README.md) - Browserbaseret workshop med MkDocs og DevContainer Miljø
- [**Struktureret Læringssti**](../../workshop/docs/instructions) - 7-trins guidede øvelser (Opdagelse → Udrulning → Tilpasning)
- [**AZD For Begyndere Workshop**](workshop/README.md) - Komplette praktiske workshopmaterialer med GitHub Codespaces integration

### Eksterne Læringsressourcer
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prisberegner](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Kursusafslutning & Certificering

### Fremskridtssporing
Spor din læringsfremskridt gennem hvert kapitel:

- [ ] **Kapitel 1**: Grundlag & Hurtig Start ✅
- [ ] **Kapitel 2**: AI-First Udvikling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentifikation ✅
- [ ] **Kapitel 4**: Infrastruktur som kode & Udrulning ✅
- [ ] **Kapitel 5**: Multi-Agent AI-løsninger ✅
- [ ] **Kapitel 6**: Validering & Planlægning før Udrulning ✅
- [ ] **Kapitel 7**: Fejlfinding & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Virksomhedsmønstre ✅

### Læringsverifikation
Efter afslutning af hvert kapitel, verificer din viden ved:
1. **Praktisk Øvelse**: Gennemfør kapitelens praktiske udrulning
2. **Videnscheck**: Gennemgå FAQ-sektionen for dit kapitel
3. **Fællesskabsdiskussion**: Del din oplevelse i Azure Discord
4. **Næste Kapitel**: Gå videre til næste kompleksitetsniveau

### Kursusafslutningsfordele
Ved afslutning af alle kapitler vil du have:
- **Produktionsoplevelse**: Udrullet reelle AI-applikationer til Azure
- **Professionelle Færdigheder**: Kapaciteter til udrulning klar til virksomheder  
- **Fællesskabsanerkendelse**: Aktivt medlem af Azure udviklerfællesskabet
- **Karrierefremgang**: Eftertragtet AZD- og AI-udrulningsekspertise

---

## 🤝 Fællesskab & Support

### Få Hjælp & Support
- **Tekniske Problemer**: [Rapporter fejl og anmod om funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Læringsspørgsmål**: [Microsoft Azure Discord Fællesskab](https://discord.gg/microsoft-azure)
- **AI-Specifik Hjælp**: Deltag i [#Azure-kanalen](https://discord.gg/microsoft-azure) for AZD + AI Foundry diskussioner
- **Dokumentation**: [Officiel Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Fællesskabsindsigter fra Azure AI Foundry Discord

**Seneste Afstemningsresultater fra #Azure-kanalen:**
- **45%** af udviklere ønsker at bruge AZD til AI-arbejdsbelastninger
- **Topudfordringer**: Multi-service udrulninger, credential management, produktionsklarhed  
- **Mest efterspurgt**: AI-specifikke skabeloner, fejlsøgningsguider, bedste praksis

**Deltag i vores fællesskab for at:**
- Dele dine AZD + AI-oplevelser og få hjælp
- Få tidlig adgang til nye AI-skabeloner
- Bidrage til bedste praksis for AI-udrulning
- Påvirke fremtidig udvikling af AI + AZD-funktioner

### Bidrag til Kurset
Vi byder bidrag velkommen! Læs vores [Bidragsguide](CONTRIBUTING.md) for detaljer om:
- **Forbedring af indhold**: Forbedre eksisterende kapitler og eksempler
- **Nye Eksempler**: Tilføj virkelige scenarier og skabeloner  
- **Oversættelse**: Hjælp med at opretholde flersproget support  
- **Fejlrapporter**: Forbedr nøjagtighed og klarhed  
- **Fællesskabsstandarder**: Følg vores inkluderende retningslinjer for fællesskabet  

---

## 📄 Kursusinformation  

### Licens  
Dette projekt er licenseret under MIT-licensen – se [LICENSE](../../LICENSE)-filen for detaljer.  

### Relaterede Microsoft-læringsressourcer  

Vores team producerer andre omfattende læringskurser:  

- [Model Context Protocol (MCP) For Begyndere](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI-agenter for begyndere](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI for begyndere med .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI for begyndere](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI for begyndere med Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML for begyndere](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science for begyndere](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI for begyndere](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersikkerhed for begyndere](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Webudvikling for begyndere](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT for begyndere](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR-udvikling for begyndere](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Mestre GitHub Copilot til AI-parprogrammering](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Mestre GitHub Copilot til C#/.NET-udviklere](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Vælg dit eget Copilot-eventyr](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

## 🗺️ Kursusnavigation  

**🚀 Klar til at begynde at lære?**  

**Begyndere**: Start med [Kapitel 1: Grundlag & Hurtig Start](../..)  
**AI-udviklere**: Hop til [Kapitel 2: AI-først udvikling](../..)  
**Erfarne udviklere**: Begynd med [Kapitel 3: Konfiguration & Autentifikation](../..)  

**Næste trin**: [Begynd Kapitel 1 - AZD Grundlæggende](docs/getting-started/azd-basics.md) →  

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.