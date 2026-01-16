<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T12:03:21+00:00",
  "source_file": "README.md",
  "language_code": "sv"
}
-->
# AZD För Nybörjare: En Strukturerad Läranderesa

![AZD-for-beginners](../../../../translated_images/sv/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kom Igång med Denna Kurs

Följ dessa steg för att påbörja din AZD-läranderesa:

1. **Forka Förrådet**: Klicka [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon Förrådet**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Gå med i Gemenskapen**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) för expertstöd
4. **Välj Din Lärandebana**: Välj ett kapitel nedan som matchar din erfarenhetsnivå

### Flerspråkigt Stöd

#### Automatiserade Översättningar (Alltid Uppdaterade)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Croatian](../hr/README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../br/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](./README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Föredrar du att klona lokalt?**

> Detta förråd inkluderar 50+ språköversättningar vilket kraftigt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Detta ger dig allt du behöver för att genomföra kursen med en mycket snabbare nedladdning.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursöversikt

Bli expert på Azure Developer CLI (azd) genom strukturerade kapitel utformade för progressivt lärande. **Speciellt fokus på AI-applikationsutplacering med Microsoft Foundry-integration.**

### Varför Denna Kurs är Viktig för Moderna Utvecklare

Baserat på insikter från Microsoft Foundry Discord-gemenskapen vill **45 % av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:
- Komplexa AI-arkitekturer med flera tjänster
- Bästa praxis för produktion av AI-distribution  
- Integration och konfiguration av Azure AI-tjänster
- Kostnadsoptimering för AI-arbetsbelastningar
- Felsökning av AI-specifika distributionsproblem

### Lärandemål

Genom att slutföra denna strukturerade kurs kommer du att:
- **Bemästra AZD-grunderna**: Kärnkoncept, installation och konfiguration
- **Distribuera AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Implementera Infrastructure as Code**: Hantera Azure-resurser med Bicep-mallar
- **Felsöka distributioner**: Lösa vanliga problem och debugga
- **Optimera för produktion**: Säkerhet, skalning, övervakning och kostnadshantering
- **Bygga multi-agentlösningar**: Distribuera komplexa AI-arkitekturer

## 📚 Lärandekapitel

*Välj din lärandebana baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grundläggande & Snabbstart
**Förutsättningar**: Azure-prenumeration, grundläggande kunskap om kommandorad  
**Varaktighet**: 30-45 minuter  
**Komplexitet**: ⭐

#### Vad Du Kommer Lära Dig
- Förstå Azure Developer CLI-grunder
- Installera AZD på din plattform
- Din första framgångsrika distribution

#### Läranderesurser
- **🎯 Börja Här**: [Vad är Azure Developer CLI?](../..)
- **📖 Teori**: [AZD-grunderna](docs/getting-started/azd-basics.md) - Kärnkoncept och terminologi
- **⚙️ Installation**: [Installation & Setup](docs/getting-started/installation.md) - Plattformsspecifika guider
- **🛠️ Praktiskt**: [Ditt Första Projekt](docs/getting-started/first-project.md) - Steg-för-steg handledning
- **📋 Snabbreferens**: [Kommandosnytblad](resources/cheat-sheet.md)

#### Praktiska Övningar
```bash
# Snabb installationskontroll
azd version

# Distribuera din första applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Lyckas distribuera en enkel webbapplikation till Azure med AZD

**✅ Framgångsvalidering:**
```bash
# Efter att ha slutfört Kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initialiserar projekt
azd up                  # Distribuerar till Azure
azd show                # Visar körande app-URL
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsåtgång:** 30-45 minuter  
**📈 Kunskapsnivå Efteråt:** Kan distribuera grundläggande applikationer självständigt

**✅ Framgångsvalidering:**
```bash
# Efter att ha avslutat Kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projekt
azd up                  # Distribuerar till Azure
azd show                # Visar körande apps URL
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsåtgång:** 30-45 minuter  
**📈 Kunskapsnivå Efteråt:** Kan distribuera grundläggande applikationer självständigt

---

### 🤖 Kapitel 2: AI-Först Utveckling (Rekommenderas för AI-utvecklare)
**Förutsättningar**: Kapitel 1 klart  
**Varaktighet**: 1-2 timmar  
**Komplexitet**: ⭐⭐

#### Vad Du Kommer Lära Dig
- Microsoft Foundry-integration med AZD
- Distribuera AI-drivna applikationer
- Förstå AI-tjänstekonfigurationer

#### Läranderesurser
- **🎯 Börja Här**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Mönster**: [AI-modellsdistribution](docs/microsoft-foundry/ai-model-deployment.md) - Distribuera och hantera AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gör dina AI-lösningar redo för AZD
- **🎥 Interaktiv Guide**: [Workshop-material](workshop/README.md) - Webbläsarbaserat lärande med MkDocs * DevContainer-miljö
- **📋 Mallar**: [Microsoft Foundry-mallar](../..)
- **📝 Exempel**: [AZD-distributions-exempel](examples/README.md)

#### Praktiska Övningar
```bash
# Distribuera din första AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prova ytterligare AI-mallar
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

**✅ Framgångsvalidering:**
```bash
# Efter kapitel 2 bör du kunna:
azd init --template azure-search-openai-demo
azd up
# Testa AI-chattgränssnittet
# Ställa frågor och få AI-drivna svar med källor
# Verifiera att sökintegrationen fungerar
azd monitor  # Kontrollera att Application Insights visar telemetri
azd down --force --purge
```

**📊 Tidsåtgång:** 1-2 timmar  
**📈 Kunskapsnivå Efteråt:** Kan distribuera och konfigurera produktionsklara AI-applikationer  
**💰 Kostnadsmedvetenhet:** Förstår utvecklingskostnader på $80-150/månad, produktionskostnader på $300-3500/månad

#### 💰 Kostnadsaspekter för AI-Distributioner

**Utvecklingsmiljö (Uppskattat $80-150/månad):**
- Azure OpenAI (Betala per användning): $0-50/månad (baserat på tokenanvändning)
- AI Search (Grundnivå): $75/månad
- Container Apps (Consumption): $0-20/månad
- Lagring (Standard): $1-5/månad

**Produktionsmiljö (Uppskattat $300-3,500+/månad):**
- Azure OpenAI (PTU för konsekvent prestanda): $3,000+/månad ELLER Betala-per-användning med hög volym
- AI Search (Standardnivå): $250/månad
- Container Apps (Dedikerad): $50-100/månad
- Application Insights: $5-50/månad
- Lagring (Premium): $10-50/månad

**💡 Kostnadsoptimeringstips:**
- Använd **Gratisnivå** Azure OpenAI för lärande (50 000 tokens/månad inkluderat)
- Kör `azd down` för att deallokera resurser när du inte aktivt utvecklar
- Börja med förbrukningsbaserad fakturering, uppgradera till PTU endast för produktion
- Använd `azd provision --preview` för att uppskatta kostnader innan distribution
- Aktivera autoskalning: betala endast för faktisk användning

**Kostnadsövervakning:**
```bash
# Kontrollera uppskattade månadskostnader
azd provision --preview

# Övervaka faktiska kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Autentisering
**Förutsättningar**: Kapitel 1 klart  
**Varaktighet**: 45-60 minuter  
**Komplexitet**: ⭐⭐

#### Vad Du Kommer Lära Dig
- Miljökonfiguration och hantering
- Autentisering och säkerhetsbästa praxis
- Namngivning och organisering av resurser

#### Läranderesurser
- **📖 Konfiguration**: [Konfigurationsguide](docs/getting-started/configuration.md) - Miljöinställningar
- **🔐 Säkerhet**: [Autentiseringsmönster och hanterad identitet](docs/getting-started/authsecurity.md) - Autentiseringsmönster
- **📝 Exempel**: [Databasapp-exempel](examples/database-app/README.md) - AZD databasexempel

#### Praktiska Övningar
- Konfigurera flera miljöer (dev, staging, prod)
- Ställ in autentisering med hanterad identitet
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastructure as Code & Distribution
**Förutsättningar**: Kapitlen 1-3 klara  
**Varaktighet**: 1-1,5 timmar  
**Komplexitet**: ⭐⭐⭐

#### Vad Du Kommer Lära Dig
- Avancerade distributionsmönster
- Infrastructure as Code med Bicep
- Strategier för resursprovisionering

#### Läranderesurser
- **📖 Distribution**: [Distributionsguide](docs/deployment/deployment-guide.md) - Kompletta arbetsflöden
- **🏗️ Provisionering**: [Resursprovisionering](docs/deployment/provisioning.md) - Azure resurshantering
- **📝 Exempel**: [Containerapp-exempel](../../examples/container-app) - Containeriserade distributioner

#### Praktiska Övningar
- Skapa anpassade Bicep-mallar
- Distribuera applikationer med flera tjänster
- Implementera blue-green-distributionsstrategier

**💡 Kapitelresultat**: Distribuera komplexa multi-tjänstapplikationer med anpassade infrastruktursmallar

---

### 🎯 Kapitel 5: Multi-Agent AI-lösningar (Avancerat)
**Förutsättningar**: Kapitlen 1-2 klara  
**Varaktighet**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad Du Kommer Lära Dig
- Multi-agent arkitektur-mönster
- Agentorkestrering och samordning
- Produktionsklara AI-distributioner

#### Läromedel
- **🤖 Utvalt Projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplett implementering
- **🛠️ ARM-mallar**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Enklicksdistribution
- **📖 Arkitektur**: [Multi-agent koordinationsmönster](/docs/pre-deployment/coordination-patterns.md) - Mönster

#### Praktiska övningar
```bash
# Distribuera den kompletta multi-agentlösningen för detaljhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforska agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Distribuera och hantera en produktionsklar multi-agent AI-lösning med Customer och Inventory agents

---

### 🔍 Kapitel 6: Validering & Planering före distribution
**Förkunskaper**: Kapitel 4 avklarat  
**Varaktighet**: 1 timme  
**Svårighetsgrad**: ⭐⭐

#### Vad du kommer att lära dig
- Kapacitetsplanering och resursvalidering
- Strategier för val av SKU
- Pre-flight kontroller och automatisering

#### Läromedel
- **📊 Planering**: [Kapacitetsplanering](docs/pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Val**: [SKU-val](docs/pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Pre-flight-kontroller](docs/pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska övningar
- Kör skript för kapacitetsvalidering
- Optimera SKU-val för kostnad
- Implementera automatiserade pre-distributionskontroller

**💡 Kapitelresultat**: Validera och optimera distributioner före genomförande

---

### 🚨 Kapitel 7: Felsökning & Debugging
**Förkunskaper**: Något distributionskapitel avklarat  
**Varaktighet**: 1-1,5 timmar  
**Svårighetsgrad**: ⭐⭐

#### Vad du kommer att lära dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Läromedel
- **🔧 Vanliga problem**: [Vanliga problem](docs/troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Felsökning**: [Felsökningsguide](docs/troubleshooting/debugging.md) - Steg-för-steg strategier
- **🤖 AI-problem**: [AI-specifik felsökning](docs/troubleshooting/ai-troubleshooting.md) - AI-tjänstproblem

#### Praktiska övningar
- Diagnostisera distributionsfel
- Åtgärda autentiseringsproblem
- Felsök anslutning till AI-tjänster

**💡 Kapitelresultat**: Självständigt diagnostisera och lösa vanliga distributionsproblem

---

### 🏢 Kapitel 8: Produktions- & Företagsmönster
**Förkunskaper**: Kapitlen 1-4 avklarade  
**Varaktighet**: 2-3 timmar  
**Svårighetsgrad**: ⭐⭐⭐⭐

#### Vad du kommer att lära dig
- Produktionsdistributionsstrategier
- Säkerhetsmönster för företag
- Övervakning och kostnadsoptimering

#### Läromedel
- **🏭 Produktion**: [Produktionsbästa AI-praktiker](docs/microsoft-foundry/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Microservices-exempel](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: [Application Insights-integration](docs/pre-deployment/application-insights.md) - Övervakning

#### Praktiska övningar
- Implementera företags säkerhetsmönster
- Sätt upp omfattande övervakning
- Distribuera till produktion med korrekt styrning

**💡 Kapitelresultat**: Distribuera företagsklara applikationer med full produktionsfunktionalitet

---

## 🎓 Workshopöversikt: Praktisk lärandeupplevelse

> **⚠️ WORKSHOP STATUS: Aktiv utveckling**  
> Workshop-materialen utvecklas och förfinas för närvarande. Kärnmoduler är funktionella, men vissa avancerade delar är ofullständiga. Vi arbetar aktivt för att färdigställa allt innehåll. [Följ utvecklingen →](workshop/README.md)

### Interaktiva workshop-material
**Omfattande praktiskt lärande med webbläsarbaserade verktyg och guidade övningar**

Våra workshop-material erbjuder en strukturerad, interaktiv lärandeupplevelse som kompletterar kapitelsbaserad kursplan ovan. Workshopen är utformad för både självstyrt lärande och instruktörsledda sessioner.

#### 🛠️ Workshopfunktioner
- **Webbläsarbaserat gränssnitt**: Komplett MkDocs-driven workshop med sök, kopiera och temafunktioner
- **GitHub Codespaces-integration**: Enklicksinstallation av utvecklingsmiljö
- **Strukturerad lärväg**: 7-stegs guidade övningar (totalt 3,5 timmar)
- **Upptäckt → Distribution → Anpassning**: Progressiv metodik
- **Interaktiv DevContainer-miljö**: Förkonfigurerade verktyg och beroenden

#### 📚 Workshopstruktur
Workshopen följer en **Upptäckt → Distribution → Anpassning** metodik:

1. **Upptäcktsfas** (45 min)
   - Utforska Microsoft Foundry-mallar och tjänster
   - Förstå multi-agent arkitekturmönster
   - Gå igenom distributionskrav och förkunskaper

2. **Distributionsfas** (2 timmar)
   - Praktisk distribution av AI-applikationer med AZD
   - Konfigurera Azure AI-tjänster och slutpunkter
   - Implementera säkerhets- och autentiseringsmönster

3. **Anpassningsfas** (45 min)
   - Modifiera applikationer för specifika användningsfall
   - Optimera för produktionsdistribution
   - Implementera övervakning och kostnadshantering

#### 🚀 Komma igång med workshopen
```bash
# Alternativ 1: GitHub Codespaces (Rekommenderat)
# Klicka på "Code" → "Create codespace on main" i arkivet

# Alternativ 2: Lokal utveckling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Följ installationsinstruktionerna i workshop/README.md
```

#### 🎯 Workshopens läranderesultat
Genom att slutföra workshopen kommer deltagarna att:
- **Distribuera AI-applikationer i produktion**: Använd AZD med Microsoft Foundry-tjänster
- **Bemästra multi-agent arkitekturer**: Implementera koordinerade AI-agentlösningar
- **Implementera säkerhetsbästa praxis**: Konfigurera autentisering och åtkomstkontroll
- **Optimera för skalbarhet**: Designa kostnadseffektiva och högpresterande distributioner
- **Felsöka distributioner**: Självständigt lösa vanliga problem

#### 📖 Workshopresurser
- **🎥 Interaktiv guide**: [Workshop-material](workshop/README.md) - Webbläsarbaserad lärmiljö
- **📋 Steg-för-steg instruktioner**: [Guidad övningar](../../workshop/docs/instructions) - Detaljerade genomgångar
- **🛠️ AI workshop-labb**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-fokuserade övningar
- **💡 Snabbstart**: [Workshop uppstartsguide](workshop/README.md#quick-start) - Miljökonfiguration

**Perfekt för**: Företagsutbildningar, universitetskurser, självstudier och utvecklarkurser.

---

## 📖 Vad är Azure Developer CLI?

Azure Developer CLI (azd) är ett utvecklarcentrerat kommandoradsgränssnitt som snabbar upp processen att skapa och distribuera applikationer till Azure. Det erbjuder:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Sömlös provisionering, distribution och övervakning
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och användarupplevelse

### **AZD + Microsoft Foundry: Perfekt för AI-distributioner**

**Varför AZD för AI-lösningar?** AZD hanterar de främsta utmaningarna AI-utvecklare stöter på:

- **AI-redo mallar** - Förkonfigurerade mallar för Azure OpenAI, Cognitive Services och ML-arbetslaster
- **Säkra AI-distributioner** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modellslutpunkter  
- **Produktionsmönster för AI** - Bästa praxis för skalbara, kostnadseffektiva AI-applikationsdistributioner
- **End-to-end AI-arbetsflöden** - Från modellutveckling till produktionsdistribution med korrekt övervakning
- **Kostnadsoptimering** - Smarta resurstilldelnings- och skalningsstrategier för AI-arbetslaster
- **Microsoft Foundry-integration** - Sömlös anslutning till Microsoft Foundrys modellkatalog och slutpunkter

---

## 🎯 Mallar & Exempelsbibliotek

### Utvalt: Microsoft Foundry-mallar
**Börja här om du distribuerar AI-applikationer!**

> **Notera:** Dessa mallar demonstrerar olika AI-mönster. Vissa är externa Azure Samples, andra lokala implementationer.

| Mall | Kapitel | Svårighetsgrad | Tjänster | Typ |
|----------|---------|------------|----------|------|
| [**Kom igång med AI-chatt**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Kom igång med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Snabbstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalt: Kompletta lärscenarier
**Produktionsklara applikationsmallar kopplade till lärkapitel**

| Mall | Lärkapitel | Svårighetsgrad | Nyckellärande |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-distributionsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligensintegration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och funktionsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Företags AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med Customer och Inventory agents |

### Lära genom exempeltyp

> **📌 Lokala vs Externa exempel:**  
> **Lokala exempel** (i detta repo) = Klara att använda direkt  
> **Externa exempel** (Azure Samples) = Klona från länkade repos

#### Lokala exempel (Redo att använda)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produktionsklar implementation med ARM-mallar
  - Multi-agent arkitektur (Customer + Inventory agents)
  - Omfattande övervakning och utvärdering
  - Enklicksdistribution via ARM-mall

#### Lokala exempel - Containerapplikationer (Kapitel 2-5)
**Omfattande exempel på container-distributioner i detta repo:**
- [**Container App Examples**](examples/container-app/README.md) - Komplett guide till containeriserade distributioner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Enkel REST API med scale-to-zero
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices) - Produktionsfärdig multi-tjänstdistribution
  - Snabbstart, Produktion och avancerade distributionsmönster
  - Vägledning för övervakning, säkerhet och kostnadsoptimering

#### Externa exempel - Enkla applikationer (Kapitel 1-2)
**Klona dessa Azure Samples-repos för att komma igång:**
- [Enkel webbapp - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundläggande distributionsmönster
- [Statisk webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribution av statiskt innehåll
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-distribution

#### Externa exempel - Databasintegration (Kapitel 3-4)  
- [Databasapp - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mönster för databasanslutning
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverlöst dataarbetsflöde

#### Externa exempel - Avancerade mönster (Kapitel 4-8)
- [Java mikrotjänster](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-tjänstarkitekturer
- [Container Apps-jobb](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrundsprocessering  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsfärdiga ML-mönster

### Externa mallinsamlare
- [**Officiellt AZD Mallgalleri**](https://azure.github.io/awesome-azd/) - Kurerad samling av officiella och community-mallar
- [**Azure Developer CLI Mallar**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn mall-dokumentation
- [**Exempelkatalog**](examples/README.md) - Lokala inlärningsexempel med detaljerade förklaringar

---

## 📚 Inlärningsresurser & Referenser

### Snabbreferenser
- [**Kommandolathund**](resources/cheat-sheet.md) - Viktiga azd-kommandon organiserade per kapitel
- [**Ordlista**](resources/glossary.md) - Azure- och azd-terminologi  
- [**FAQ**](resources/faq.md) - Vanliga frågor organiserade per inlärningskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattande övningar

### Praktiska Workshops
- [**AI Workshop Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-distribuerbara (2-3 timmar)
- [**Interaktiv workshopguide**](workshop/README.md) - Webbläsarbaserad workshop med MkDocs och DevContainer-miljö
- [**Strukturerad inlärningsväg**](../../workshop/docs/instructions) - 7-stegs guidade övningar (Upptäckt → Distribution → Anpassning)
- [**AZD för nybörjare Workshop**](workshop/README.md) - Kompletta praktiska workshopmaterial med GitHub Codespaces-integration

### Externa inlärningsresurser
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Prisräknare](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Snabbguide för felsökning

**Vanliga problem nybörjare stöter på och omedelbara lösningar:**

### ❌ "azd: command not found"

```bash
# Installera AZD först
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifiera installationen
azd version
```

### ❌ "Ingen prenumeration hittades" eller "Prenumeration ej inställd"

```bash
# Lista tillgängliga prenumerationer
az account list --output table

# Ställ in standardprenumeration
az account set --subscription "<subscription-id-or-name>"

# Ställ in för AZD-miljö
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiera
az account show
```

### ❌ "InsufficientQuota" eller "Kvot överskriden"

```bash
# Prova en annan Azure-region
azd env set AZURE_LOCATION "westus2"
azd up

# Eller använd mindre SKU:er i utveckling
# Redigera infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```

### ❌ "azd up" misslyckas halvvägs

```bash
# Alternativ 1: Rensa och försök igen
azd down --force --purge
azd up

# Alternativ 2: Justera bara infrastrukturen
azd provision

# Alternativ 3: Kontrollera detaljerade loggar
azd show
azd logs
```

### ❌ "Autentisering misslyckades" eller "Token utgått"

```bash
# Autentisera igen
az logout
az login

azd auth logout
azd auth login

# Verifiera autentisering
az account show
```

### ❌ "Resurs finns redan" eller namnkonflikter

```bash
# AZD genererar unika namn, men om konflikt:
azd down --force --purge

# Försök igen med en ny miljö
azd env new dev-v2
azd up
```

### ❌ Mall-distribution tar för lång tid

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI-provisionering är långsam)

```bash
# Kontrollera framsteg
azd show

# Om fast >30 minuter, kontrollera Azure Portal:
azd monitor
# Leta efter misslyckade distributioner
```

### ❌ "Behörighet nekad" eller "Förbjudet"

```bash
# Kontrollera din Azure-roll
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du behöver åtminstone rollen "Bidragsgivare"
# Be din Azure-administratör att bevilja:
# - Bidragsgivare (för resurser)
# - Administratör för användaråtkomst (för rolltilldelningar)
```

### ❌ Kan inte hitta distribuerad applikations-URL

```bash
# Visa alla tjänstendpunkter
azd show

# Eller öppna Azure-portalen
azd monitor

# Kontrollera specifik tjänst
azd env get-values
# Leta efter *_URL-variabler
```

### 📚 Fullständiga felsökningsresurser

- **Guide för vanliga problem:** [Detaljerade lösningar](docs/troubleshooting/common-issues.md)
- **AI-specifika problem:** [AI Felsökning](docs/troubleshooting/ai-troubleshooting.md)
- **Debugguide:** [Steg-för-steg Debugging](docs/troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Snabbguide för felsökning

**Vanliga problem nybörjare stöter på och omedelbara lösningar:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installera AZD först
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verifiera installation
azd version
```
</details>

<details>
<summary><strong>❌ "Ingen prenumeration hittades" eller "Prenumeration ej inställd"</strong></summary>

```bash
# Lista tillgängliga prenumerationer
az account list --output table

# Ställ in standardprenumeration
az account set --subscription "<subscription-id-or-name>"

# Ställ in för AZD-miljö
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verifiera
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" eller "Kvot överskriden"</strong></summary>

```bash
# Prova olika Azure-regioner
azd env set AZURE_LOCATION "westus2"
azd up

# Eller använd mindre SKU:er i utveckling
# Redigera infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" misslyckas halvvägs</strong></summary>

```bash
# Alternativ 1: Rensa och försök igen
azd down --force --purge
azd up

# Alternativ 2: Åtgärda bara infrastrukturen
azd provision

# Alternativ 3: Kontrollera detaljerade loggar
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autentisering misslyckades" eller "Token utgått"</strong></summary>

```bash
# Autentisera igen
az logout
az login

azd auth logout
azd auth login

# Verifiera autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs finns redan" eller namnkonflikter</strong></summary>

```bash
# AZD genererar unika namn, men vid konflikt:
azd down --force --purge

# Försök igen med en ny miljö
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mall-distribution tar för lång tid</strong></summary>

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI-provisionering är långsam)

```bash
# Kontrollera framsteg
azd show

# Om fastnat >30 minuter, kontrollera Azure-portalen:
azd monitor
# Leta efter misslyckade distributioner
```
</details>

<details>
<summary><strong>❌ "Behörighet nekad" eller "Förbjudet"</strong></summary>

```bash
# Kontrollera din Azure-roll
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du behöver minst rollen "Bidragsgivare"
# Be din Azure-administratör att bevilja:
# - Bidragsgivare (för resurser)
# - Användaråtkomstadministratör (för rolltilldelningar)
```
</details>

<details>
<summary><strong>❌ Kan inte hitta distribuerad applikations-URL</strong></summary>

```bash
# Visa alla tjänsteändpunkter
azd show

# Eller öppna Azure Portal
azd monitor

# Kontrollera specifik tjänst
azd env get-values
# Leta efter *_URL variabler
```
</details>

### 📚 Fullständiga felsökningsresurser

- **Guide för vanliga problem:** [Detaljerade lösningar](docs/troubleshooting/common-issues.md)
- **AI-specifika problem:** [AI Felsökning](docs/troubleshooting/ai-troubleshooting.md)
- **Debugguide:** [Steg-för-steg Debugging](docs/troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursgenomförande & Certifiering

### Framstegsspårning
Följ din inlärningsutveckling genom varje kapitel:

- [ ] **Kapitel 1**: Grundläggande & Snabbstart ✅
- [ ] **Kapitel 2**: AI-Först Utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentisering ✅
- [ ] **Kapitel 4**: Infrastruktur som kod & Distribution ✅
- [ ] **Kapitel 5**: Multi-Agent AI-Lösningar ✅
- [ ] **Kapitel 6**: Validering & Planering före distribution ✅
- [ ] **Kapitel 7**: Felsökning & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Företagsmönster ✅

### Inlärningsverifiering
Efter varje kapitel verifierar du dina kunskaper genom att:
1. **Praktisk övning**: Genomför kapitelets praktiska distribution
2. **Kunskapskontroll**: Gå igenom FAQ-sektionen för ditt kapitel
3. **Communitydiskussion**: Dela dina erfarenheter i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa komplexitetsnivå

### Fördelar med att slutföra kursen
När du har slutfört alla kapitel kommer du att ha:
- **Produktionserfarenhet**: Distribuerade riktiga AI-applikationer till Azure
- **Professionella färdigheter**: Företagsförberedda distributionsförmågor  
- **Communityerkännande**: Aktiv medlem i Azure-utvecklargemenskapen
- **Karriärmöjligheter**: Eftertraktad AZD- och AI-distributionskompetens

---

## 🤝 Community & Support

### Få hjälp & Support
- **Tekniska problem**: [Rapportera buggar och önska funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Inlärningsfrågor**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) och [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjälp**: Gå med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiell Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Communityinsikter från Microsoft Foundry Discord

**Senaste undersökningsresultat från #Azure-kanalen:**
- **45%** av utvecklare vill använda AZD för AI-arbetsbelastningar
- **Största utmaningarna**: Multi-service-distributioner, hantering av autentiseringsuppgifter, produktionsberedskap  
- **Mest efterfrågat**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vår community för att:**
- Dela dina AZD + AI-upplevelser och få hjälp
- Få tidig tillgång till nya AI-mallar
- Bidra till AI-distributionsbästa praxis
- Påverka framtida AI + AZD-funktionsutveckling

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- **Förbättring av innehåll**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att upprätthålla flerspråkigt stöd
- **Bugg-rapporter**: Öka noggrannhet och tydlighet
- **Community-standarder**: Följ våra inkluderande community-riktlinjer

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen - se [LICENSE](../../LICENSE) filen för detaljer.

### Relaterade Microsoft-inlärningsresurser

Vårt team producerar andra omfattande lärandekurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j för nybörjare](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js för nybörjare](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agenter
[![AZD för nybörjare](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI för nybörjare](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP för nybörjare](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agenter för nybörjare](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generativ AI-serie
[![Generativ AI för nybörjare](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativ AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kärninlärning
[![ML för nybörjare](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science för nybörjare](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI för nybörjare](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersäkerhet för nybörjare](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webbutveckling för nybörjare](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT för nybörjare](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-utveckling för nybörjare](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot för AI parprogrammering](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot för C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-äventyret](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära dig?**

**Nybörjare**: Börja med [Kapitel 1: Grund och snabbstart](../..)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-först-utveckling](../..)  
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration och autentisering](../..)

**Nästa steg**: [Börja Kapitel 1 - AZD Grundläggande](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell översättning av människa. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår från användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->