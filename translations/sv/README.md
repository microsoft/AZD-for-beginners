# AZD för nybörjare: En strukturerad läranderesa

![AZD-for-beginners](../../translated_images/sv/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Kom igång med den här kursen

Följ dessa steg för att börja din AZD-läranderesa:

1. **Forka repositoryt**: Klicka [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klon repositoryt**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Gå med i communityn**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) för expertstöd
4. **Välj din lärandestig**: Välj ett kapitel nedan som matchar din erfarenhetsnivå

### Flerspråkigt stöd

#### Automatiska översättningar (Alltid uppdaterade)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabiska](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgariska](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Kinesiska (förenklad)](../zh-CN/README.md) | [Kinesiska (traditionell, Hongkong)](../zh-HK/README.md) | [Kinesiska (traditionell, Macau)](../zh-MO/README.md) | [Kinesiska (traditionell, Taiwan)](../zh-TW/README.md) | [Kroatiska](../hr/README.md) | [Tjeckiska](../cs/README.md) | [Danska](../da/README.md) | [Holländska](../nl/README.md) | [Estniska](../et/README.md) | [Finska](../fi/README.md) | [Franska](../fr/README.md) | [Tyska](../de/README.md) | [Grekiska](../el/README.md) | [Hebreiska](../he/README.md) | [Hindi](../hi/README.md) | [Ungerska](../hu/README.md) | [Indonesiska](../id/README.md) | [Italienska](../it/README.md) | [Japanska](../ja/README.md) | [Kannada](../kn/README.md) | [Koreanska](../ko/README.md) | [Litauiska](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesiska](../ne/README.md) | [Nigeriansk Pidgin](../pcm/README.md) | [Norska](../no/README.md) | [Persiska (Farsi)](../fa/README.md) | [Polska](../pl/README.md) | [Portugisiska (Brasilien)](../pt-BR/README.md) | [Portugisiska (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänska](../ro/README.md) | [Ryska](../ru/README.md) | [Serbiska (kyrilliska)](../sr/README.md) | [Slovakiska](../sk/README.md) | [Slovenska](../sl/README.md) | [Spanska](../es/README.md) | [Swahili](../sw/README.md) | [Svenska](./README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändska](../th/README.md) | [Turkiska](../tr/README.md) | [Ukrainska](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesiska](../vi/README.md)

> **Föredrar du att klona lokalt?**

> Detta repository inkluderar 50+ språkversioner vilket kraftigt ökar nedladdningsstorleken. För att klona utan översättningar, använd sparse checkout:  
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
 > Detta ger dig allt du behöver för att slutföra kursen med en mycket snabbare nedladdning.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursöversikt

Bemästra Azure Developer CLI (azd) genom strukturerade kapitel utformade för progressivt lärande. **Särskilt fokus på AI-applikationsdistribution med integration av Microsoft Foundry.**

### Varför denna kurs är viktig för moderna utvecklare

Baserat på insikter från Microsoft Foundry Discord-communityn vill **45 % av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:  
- Komplexa AI-arkitekturer med flera tjänster  
- Bästa praxis för produktion av AI-distributioner  
- Integration och konfiguration av Azure AI-tjänster  
- Kostnadsoptimering för AI-arbetsbelastningar  
- Felsökning av AI-specifika distributionsproblem

### Lärandemål

Genom att slutföra denna strukturerade kurs kommer du att:  
- **Bemästra AZD-grunderna**: Kärnkoncept, installation och konfiguration  
- **Distribuera AI-applikationer**: Använda AZD med Microsoft Foundry-tjänster  
- **Implementera Infrastructure as Code**: Hantera Azure-resurser med Bicep-mallar  
- **Felsöka distributioner**: Lösa vanliga problem och debugga  
- **Optimera för produktion**: Säkerhet, skalning, övervakning och kostnadshantering  
- **Bygga multi-agent-lösningar**: Distribuera komplexa AI-arkitekturer

## 📚 Lärandekapitel

*Välj din lärandestig baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grund och snabbstart
**Förkunskaper**: Azure-abonnemang, grundläggande kommandoradskunskaper  
**Tid**: 30-45 minuter  
**Svårighetsgrad**: ⭐

#### Vad du lär dig
- Förstå Azure Developer CLI-grunder  
- Installera AZD på din plattform  
- Din första lyckade distribution

#### Lärresurser
- **🎯 Börja här**: [Vad är Azure Developer CLI?](../..)  
- **📖 Teori**: [AZD Basics](docs/getting-started/azd-basics.md) - Kärnkoncept och terminologi  
- **⚙️ Installation**: [Installation & Setup](docs/getting-started/installation.md) - Plattformsspecifika guider  
- **🛠️ Praktiskt**: [Ditt första projekt](docs/getting-started/first-project.md) - Steg-för-steg handledning  
- **📋 Snabbreferens**: [Kommandocheatsheet](resources/cheat-sheet.md)

#### Praktiska övningar
```bash
# Snabb installationskontroll
azd version

# Distribuera din första applikation
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Distribuera framgångsrikt en enkel webbapplikation till Azure med AZD

**✅ Validering av framgång:**  
```bash
# Efter att ha slutfört Kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initialiserar projekt
azd up                  # Distribuerar till Azure
azd show                # Visar URL för körande app
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsinvestering:** 30-45 minuter  
**📈 Nivå efteråt:** Kan distribuera grundläggande applikationer självständigt

**✅ Validering av framgång:**  
```bash
# Efter att ha slutfört Kapitel 1 bör du kunna:
azd version              # Visar installerad version
azd init --template todo-nodejs-mongo  # Initierar projekt
azd up                  # Distribuerar till Azure
azd show                # Visar körande app-URL
# Applikationen öppnas i webbläsaren och fungerar
azd down --force --purge  # Rensar upp resurser
```

**📊 Tidsinvestering:** 30-45 minuter  
**📈 Nivå efteråt:** Kan distribuera grundläggande applikationer självständigt

---

### 🤖 Kapitel 2: AI-Först Utveckling (Rekommenderas för AI-utvecklare)
**Förkunskaper**: Kapitel 1 slutfört  
**Tid**: 1-2 timmar  
**Svårighetsgrad**: ⭐⭐

#### Vad du lär dig
- Microsoft Foundry-integration med AZD  
- Distribuera AI-drivna applikationer  
- Förstå AI-tjänstkonfigurationer

#### Lärresurser
- **🎯 Börja här**: [Microsoft Foundry-integration](docs/microsoft-foundry/microsoft-foundry-integration.md)  
- **📖 Mönster**: [AI-modell-distribution](docs/microsoft-foundry/ai-model-deployment.md) - Distribuera och hantera AI-modeller  
- **🛠️ Workshop**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-klara  
- **🎥 Interaktiv guide**: [Workshop-material](workshop/README.md) - Webbläsarbaserat lärande med MkDocs * DevContainer-miljö  
- **📋 Mallar**: [Microsoft Foundry-mallar](../..)  
- **📝 Exempel**: [AZD-distributionsexempel](examples/README.md)

#### Praktiska övningar
```bash
# Distribuera din första AI-applikation
azd init --template azure-search-openai-demo
azd up

# Prova ytterligare AI-mallar
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

**✅ Validering av framgång:**  
```bash
# Efter kapitel 2 ska du kunna:
azd init --template azure-search-openai-demo
azd up
# Testa AI-chattgränssnittet
# Ställa frågor och få AI-drivna svar med källor
# Verifiera att sökintegration fungerar
azd monitor  # Kontrollera att Application Insights visar telemetri
azd down --force --purge
```

**📊 Tidsinvestering:** 1-2 timmar  
**📈 Nivå efteråt:** Kan distribuera och konfigurera produktionsfärdiga AI-applikationer  
**💰 Kostnadsmedvetenhet:** Förstå utvecklingskostnader på $80-150/månad, produktionskostnader $300-3500/månad

#### 💰 Kostnadshänsyn för AI-distributioner

**Utvecklingsmiljö (beräknat $80-150/månad):**  
- Azure OpenAI (Pay-as-you-go): $0-50/månad (baserat på tokenanvändning)  
- AI Search (Basic tier): $75/månad  
- Container Apps (Consumption): $0-20/månad  
- Lagring (Standard): $1-5/månad

**Produktionsmiljö (beräknat $300-3,500+/månad):**  
- Azure OpenAI (PTU för konsekvent prestanda): $3,000+/månad ELLER Pay-as-you-go med hög volym  
- AI Search (Standard tier): $250/månad  
- Container Apps (Dedicated): $50-100/månad  
- Application Insights: $5-50/månad  
- Lagring (Premium): $10-50/månad

**💡 Kostnadsoptimeringstips:**  
- Använd **Free Tier** Azure OpenAI för lärande (50 000 tokens/månad inkluderat)  
- Kör `azd down` för att frigöra resurser när du inte aktivt utvecklar  
- Börja med konsumtionsbaserad debitering, uppgradera till PTU endast för produktion  
- Använd `azd provision --preview` för att uppskatta kostnader före distribution  
- Aktivera autoskalning: betala endast för faktisk användning

**Kostnadsövervakning:**  
```bash
# Kontrollera uppskattade månadskostnader
azd provision --preview

# Övervaka faktiska kostnader i Azure-portalen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & autentisering
**Förkunskaper**: Kapitel 1 slutfört  
**Tid**: 45-60 minuter  
**Svårighetsgrad**: ⭐⭐

#### Vad du lär dig
- Konfiguration och hantering av miljöer  
- Autentisering och säkerhetsbästa praxis  
- Namngivning och organisering av resurser

#### Lärresurser
- **📖 Konfiguration**: [Konfigurationsguide](docs/getting-started/configuration.md) - Miljöinställningar  
- **🔐 Säkerhet**: [Autentiseringsmönster och hanterad identitet](docs/getting-started/authsecurity.md) - Autentiseringsmönster  
- **📝 Exempel**: [Databasapplikationsexempel](examples/database-app/README.md) - AZD-databasexempel

#### Praktiska övningar
- Konfigurera flera miljöer (dev, staging, prod)  
- Sätta upp hanterad identitetsautentisering  
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastructure as Code & distribution
**Förkunskaper**: Kapitel 1-3 slutförda  
**Tid**: 1-1,5 timmar  
**Svårighetsgrad**: ⭐⭐⭐

#### Vad du lär dig
- Avancerade distributionsmönster  
- Infrastructure as Code med Bicep  
- Strategier för resurstilldelning

#### Lärresurser
- **📖 Distribution**: [Distributionsguide](docs/deployment/deployment-guide.md) - Kompletta arbetsflöden  
- **🏗️ Provisionering**: [Provisionering av resurser](docs/deployment/provisioning.md) - Azure-resurshantering  
- **📝 Exempel**: [Container App-exempel](../../examples/container-app) - Containerdistribueringar

#### Praktiska övningar
- Skapa egna Bicep-mallar  
- Distribuera multi-tjänst applikationer  
- Implementera blue-green deployments

**💡 Kapitelresultat**: Distribuera komplexa multi-tjänst applikationer med egna infrastruktursmallar

---

### 🎯 Kapitel 5: Multi-Agent AI-lösningar (Avancerat)
**Förkunskaper**: Kapitel 1-2 slutförda  
**Tid**: 2-3 timmar  
**Svårighetsgrad**: ⭐⭐⭐⭐
#### Vad du kommer att lära dig
- Mönster för multi-agentarkitektur
- Agentorkestrering och samordning
- Produktionsklara AI-distributioner

#### Lärresurser
- **🤖 Utvalt projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplett implementation
- **🛠️ ARM-mallar**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Distribuering med ett klick
- **📖 Arkitektur**: [Multi-agent coordination patterns](/docs/pre-deployment/coordination-patterns.md) - Mönster

#### Praktiska övningar
```bash
# Distribuera den kompletta detaljhandelslösningen med flera agenter
cd examples/retail-multiagent-arm-template
./deploy.sh

# Utforska agentkonfigurationer
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Distribuera och hantera en produktionsklar multi-agent AI-lösning med kund- och lagersagenter

---

### 🔍 Kapitel 6: Förvalidering och planering före distribution
**Förkunskaper**: Kapitel 4 färdigställt  
**Varaktighet**: 1 timme  
**Svårighetsgrad**: ⭐⭐

#### Vad du kommer att lära dig
- Kapacitetsplanering och resursvalidering
- Strategier för val av SKU
- Förhandskontroller och automatisering

#### Lärresurser
- **📊 Planering**: [Capacity Planning](docs/pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Urval**: [SKU Selection](docs/pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Pre-flight Checks](docs/pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska övningar
- Kör skript för kapacitetsvalidering
- Optimera SKU-val för kostnad
- Implementera automatiserade förvalideringskontroller

**💡 Kapitelresultat**: Validera och optimera distributioner innan utförande

---

### 🚨 Kapitel 7: Felsökning och debuggningsarbete
**Förkunskaper**: Något distributionskapitel färdigställt  
**Varaktighet**: 1-1,5 timme  
**Svårighetsgrad**: ⭐⭐

#### Vad du kommer att lära dig
- Systematiska metoder för felsökning
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Lärresurser
- **🔧 Vanliga problem**: [Common Issues](docs/troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Felsökning**: [Debugging Guide](docs/troubleshooting/debugging.md) - Steg-för-steg-strategier
- **🤖 AI-problem**: [AI-Specific Troubleshooting](docs/troubleshooting/ai-troubleshooting.md) - Problem med AI-tjänster

#### Praktiska övningar
- Diagnostisera distributionsfel
- Lös autentiseringsproblem
- Debugga anslutningsproblem för AI-tjänster

**💡 Kapitelresultat**: Oberoende diagnostisera och lösa vanliga distributionsproblem

---

### 🏢 Kapitel 8: Produktions- och företagsmönster
**Förkunskaper**: Kapitlen 1-4 färdigställda  
**Varaktighet**: 2-3 timmar  
**Svårighetsgrad**: ⭐⭐⭐⭐

#### Vad du kommer att lära dig
- Strategier för produktionsdistribution
- Säkerhetsmönster för företag
- Övervakning och kostnadsoptimering

#### Lärresurser
- **🏭 Produktion**: [Production AI Best Practices](docs/microsoft-foundry/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Microservices Example](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: [Application Insights integration](docs/pre-deployment/application-insights.md) - Övervakning

#### Praktiska övningar
- Implementera säkerhetsmönster för företag
- Sätt upp omfattande övervakning
- Distribuera till produktion med korrekt styrning

**💡 Kapitelresultat**: Distribuera företagsklara applikationer med full produktionskapacitet

---

## 🎓 Workshop-översikt: Praktisk lärandeupplevelse

> **⚠️ STATUS FÖR WORKSHOP: Aktiv utveckling**  
> Workshopens material utvecklas och förfinas för närvarande. Kärnmodulerna fungerar, men vissa avancerade sektioner är ofärdiga. Vi arbetar aktivt för att slutföra allt innehåll. [Följ framsteg →](workshop/README.md)

### Interaktiva workshopmaterial
**Omfattande praktiskt lärande med webbläsarbaserade verktyg och guidade övningar**

Våra workshopmaterial erbjuder en strukturerad, interaktiv lärandeupplevelse som kompletterar kapitelbaserade kursplanen ovan. Workshoppen är utformad för både självstyrt lärande och instruktörsledda sessioner.

#### 🛠️ Workshopfunktioner
- **Webbläsarbaserat gränssnitt**: Komplett MkDocs-driven workshop med sök, kopiering och teman
- **GitHub Codespaces-integration**: Distribuera utvecklingsmiljö med ett klick
- **Strukturerad lärandegång**: 7-stegs guidade övningar (totalt 3,5 timmar)
- **Upptäckt → Distribution → Anpassning**: Progressiv metodik
- **Interaktiv DevContainer-miljö**: Förkonfigurerade verktyg och beroenden

#### 📚 Workshopstruktur
Workshoppen följer metodiken **Upptäckt → Distribution → Anpassning**:

1. **Upptäcktsfas** (45 min)
   - Utforska Microsoft Foundry-mallar och tjänster
   - Förstå multi-agentarkitekturens mönster
   - Gå igenom distributionskrav och förutsättningar

2. **Distributionsfas** (2 timmar)
   - Praktisk distribution av AI-applikationer med AZD
   - Konfigurera Azure AI-tjänster och ändpunkter
   - Implementera säkerhets- och autentiseringsmönster

3. **Anpassningsfas** (45 min)
   - Modifiera applikationer för specifika användningsfall
   - Optimera för produktionsdistribution
   - Implementera övervakning och kostnadshantering

#### 🚀 Kom igång med workshoppen
```bash
# Alternativ 1: GitHub Codespaces (Rekommenderat)
# Klicka på "Code" → "Create codespace on main" i förrådet

# Alternativ 2: Lokal utveckling
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Följ installationsinstruktionerna i workshop/README.md
```

#### 🎯 Workshop-lärandemål
Genom att slutföra workshoppen kommer deltagarna att kunna:
- **Distribuera produktionsklara AI-applikationer**: Använd AZD med Microsoft Foundry-tjänster
- **Bemästra multi-agentarkitektur**: Implementera samordnade AI-agentlösningar
- **Implementera säkerhetsbästa praxis**: Konfigurera autentisering och åtkomstkontroll
- **Optimera för skalning**: Designa kostnadseffektiva och högpresterande distributioner
- **Felsöka distributioner**: Självständigt lösa vanliga problem

#### 📖 Workshop-resurser
- **🎥 Interaktiv guide**: [Workshop Materials](workshop/README.md) - Webbläsarbaserat lärandemiljö
- **📋 Steg-för-steg-instruktioner**: [Guided Exercises](../../workshop/docs/instructions) - Detaljerade genomgångar
- **🛠️ AI Workshop-labb**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) - AI-fokuserade övningar
- **💡 Snabbstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Miljökonfiguration

**Perfekt för**: Företagsträning, universitetskurser, självstudier och utvecklarbootcamps.

---

## 📖 Vad är Azure Developer CLI?

Azure Developer CLI (azd) är en utvecklarfokuserad kommandoradsgränssnitt som påskyndar processen att bygga och distribuera applikationer till Azure. Den erbjuder:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Provisionera, distribuera och övervaka applikationer sömlöst
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och -upplevelse

### **AZD + Microsoft Foundry: Perfekt för AI-distributioner**

**Varför AZD för AI-lösningar?** AZD hanterar topputmaningar som AI-utvecklare möter:

- **AI-klara mallar** - Förkonfigurerade mallar för Azure OpenAI, Cognitive Services och ML-arbetsbelastningar
- **Säkra AI-distributioner** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modeländpunkter  
- **Produktionsklara AI-mönster** - Bästa praxis för skalbara, kostnadseffektiva AI-applikationsdistributioner
- **Helhetliga AI-arbetsflöden** - Från modellutveckling till produktionsdistribution med korrekt övervakning
- **Kostnadsoptimering** - Smart resursallokering och skalningsstrategier för AI-arbetsbelastningar
- **Microsoft Foundry-integration** - Sömlös koppling till Microsoft Foundry modellkatalog och ändpunkter

---

## 🎯 Mall- och exempelbibliotek

### Utvalda: Microsoft Foundry-mallar
**Börja här om du distribuerar AI-applikationer!**

> **Notera:** Dessa mallar demonstrerar olika AI-mönster. Vissa är externa Azure Samples, andra är lokala implementationer.

| Mall | Kapitel | Svårighetsgrad | Tjänster | Typ |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Utvalda: Kompletta lärscenarier
**Produktionsklara applikationsmallar kopplade till lärkapitel**

| Mall | Lärkapitel | Svårighetsgrad | Viktigaste lärandet |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-distributionsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentintelligensintegration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och funktionsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Företags-AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agentarkitektur med kund- och lagersagenter |

### Lär genom exempeltyp

> **📌 Lokala vs. externa exempel:**  
> **Lokala exempel** (i detta repo) = Klara att använda omedelbart  
> **Externa exempel** (Azure Samples) = Klona från länkade arkiv

#### Lokala exempel (klara att använda)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Komplett produktionsklar implementation med ARM-mallar
  - Multi-agentarkitektur (Kund + Lager-agenter)
  - Omfattande övervakning och utvärdering
  - Distribution med ett klick via ARM-mall

#### Lokala exempel - Container-applikationer (Kapitel 2-5)
**Omfattande exempel på containerdistributioner i detta arkiv:**
- [**Container App Examples**](examples/container-app/README.md) - Komplett guide till containeriserade distributioner
  - [Enkel Flask API](../../examples/container-app/simple-flask-api) - Grundläggande REST API med scale-to-zero
  - [Mikrotjänstarkitektur](../../examples/container-app/microservices) - Produktionsklar multi-service-distribution
  - Snabbstart, produktion och avancerade distributionsmönster
  - Övervakning, säkerhet och kostnadsoptimeringsvägledning

#### Externa exempel - Enkla applikationer (Kapitel 1-2)
**Klona dessa Azure Samples arkiv för att komma igång:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundläggande distributionsmönster
- [Statisk webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Distribution av statiskt innehåll
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST API-distribution

#### Externa exempel - Databasintegration (Kapitel 3-4)  
- [Databasapplikation - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Mönster för databasanslutning
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverlöst dataarbetsflöde

#### Externa exempel - Avancerade mönster (Kapitel 4-8)
- [Java-mikrotjänster](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-service-arkitekturer
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Bakgrundsprocessering  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsklara ML-mönster

### Externa mall-samlingar
- [**Officiell AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuraterad samling av officiella och community-mallar
- [**Azure Developer CLI-mallar**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – Microsoft Learn mall-dokumentation
- [**Exempelkatalog**](examples/README.md) – Lokala inlärningsexempel med utförliga förklaringar

---

## 📚 Inlärningsresurser & Referenser

### Snabbreferenser
- [**Kommandosammanfattning**](resources/cheat-sheet.md) – Viktiga azd-kommandon organiserade efter kapitel
- [**Ordlista**](resources/glossary.md) – Azure- och azd-termer  
- [**FAQ**](resources/faq.md) – Vanliga frågor organiserade efter inlärningskapitel
- [**Studiehandledning**](resources/study-guide.md) – Omfattande övningar

### Praktiska workshops
- [**AI Workshop-lab**](docs/microsoft-foundry/ai-workshop-lab.md) – Gör dina AI-lösningar AZD-distribuerbara (2-3 timmar)
- [**Interaktiv workshop-guide**](workshop/README.md) – Webbläsarbaserad workshop med MkDocs och DevContainer-miljö
- [**Strukturerad lärandestig**](../../workshop/docs/instructions) – 7-stegs guidade övningar (Discovery → Deployment → Customization)
- [**AZD för nybörjare workshop**](workshop/README.md) – Komplett praktiskt workshopmaterial med GitHub Codespaces-integration

### Externa inlärningsresurser
- Azure Developer CLI-dokumentation
- Azure Architecture Center
- Azure Pricing Calculator
- Azure Status

---

## 🔧 Snabb felsökningsguide

**Vanliga problem nybörjare stöter på och omedelbara lösningar:**

### ❌ "azd: kommando hittades inte"

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

### ❌ "Ingen prenumeration hittades" eller "Prenumeration inte inställd"

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

### ❌ "Otillräcklig kvot" eller "Kvot överskriden"

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

### ❌ "azd up" misslyckas halvvägs

```bash
# Alternativ 1: Rensa och försök igen
azd down --force --purge
azd up

# Alternativ 2: Bara åtgärda infrastrukturen
azd provision

# Alternativ 3: Kontrollera detaljerade loggar
azd show
azd logs
```

### ❌ "Autentisering misslyckades" eller "Token har gått ut"

```bash
# Autentisera på nytt
az logout
az login

azd auth logout
azd auth login

# Verifiera autentisering
az account show
```

### ❌ "Resurs finns redan" eller namnkollisioner

```bash
# AZD genererar unika namn, men vid konflikt:
azd down --force --purge

# Försök igen med en ny miljö
azd env new dev-v2
azd up
```

### ❌ Malldistribution tar för lång tid

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI provisioning är långsam)

```bash
# Kontrollera framsteg
azd show

# Om fast i >30 minuter, kontrollera Azure-portalen:
azd monitor
# Leta efter misslyckade distributioner
```

### ❌ "Behörighet nekad" eller "Förbjudet"

```bash
# Kontrollera din Azure-roll
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Du behöver minst rollen "Bidragsgivare"
# Be din Azure-administratör att bevilja:
# - Bidragsgivare (för resurser)
# - Användaråtkomstadministratör (för rolltilldelningar)
```

### ❌ Kan inte hitta distribuerad applikations-URL

```bash
# Visa alla tjänstendpunkter
azd show

# Eller öppna Azure-portalen
azd monitor

# Kontrollera specifik tjänst
azd env get-values
# Leta efter *_URL variabler
```

### 📚 Fullständiga felsökningsresurser

- **Vanliga problem-guide:** [Detaljerade lösningar](docs/troubleshooting/common-issues.md)
- **AI-specifika problem:** [AI-felsökning](docs/troubleshooting/ai-troubleshooting.md)
- **Felsökningsguide:** [Steg-för-steg felsökning](docs/troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Snabb felsökningsguide

**Vanliga problem nybörjare stöter på och omedelbara lösningar:**

<details>
<summary><strong>❌ "azd: kommando hittades inte"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "Ingen prenumeration hittades" eller "Prenumeration inte inställd"</strong></summary>

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
<summary><strong>❌ "Otillräcklig kvot" eller "Kvot överskriden"</strong></summary>

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
</details>

<details>
<summary><strong>❌ "azd up" misslyckas halvvägs</strong></summary>

```bash
# Alternativ 1: Rensa och försök igen
azd down --force --purge
azd up

# Alternativ 2: Bara fixa infrastrukturen
azd provision

# Alternativ 3: Kontrollera detaljerade loggar
azd show
azd logs
```
</details>

<details>
<summary><strong>❌ "Autentisering misslyckades" eller "Token har gått ut"</strong></summary>

```bash
# Autentisera om
az logout
az login

azd auth logout
azd auth login

# Verifiera autentisering
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs finns redan" eller namnkollisioner</strong></summary>

```bash
# AZD genererar unika namn, men om det uppstår konflikt:
azd down --force --purge

# Försök igen med en ny miljö
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Malldistribution tar för lång tid</strong></summary>

**Normala väntetider:**
- Enkel webbapp: 5-10 minuter
- App med databas: 10-15 minuter
- AI-applikationer: 15-25 minuter (OpenAI provisioning är långsam)

```bash
# Kontrollera framsteg
azd show

# Om fast i >30 minuter, kontrollera Azure Portal:
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
# Visa alla tjänstendpunkter
azd show

# Eller öppna Azure Portal
azd monitor

# Kontrollera specifik tjänst
azd env get-values
# Leta efter *_URL-variabler
```
</details>

### 📚 Fullständiga felsökningsresurser

- **Vanliga problem-guide:** [Detaljerade lösningar](docs/troubleshooting/common-issues.md)
- **AI-specifika problem:** [AI-felsökning](docs/troubleshooting/ai-troubleshooting.md)
- **Felsökningsguide:** [Steg-för-steg felsökning](docs/troubleshooting/debugging.md)
- **Få hjälp:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursavslutning & Certifiering

### Framstegsuppföljning
Följ ditt lärande genom varje kapitel:

- [ ] **Kapitel 1**: Grundläggande & Snabbstart ✅
- [ ] **Kapitel 2**: AI-fokuserad utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentisering ✅
- [ ] **Kapitel 4**: Infrastruktur som kod & Distribution ✅
- [ ] **Kapitel 5**: Multi-Agent AI-lösningar ✅
- [ ] **Kapitel 6**: Förvalidering & planering före distribution ✅
- [ ] **Kapitel 7**: Felsökning & Debuggning ✅
- [ ] **Kapitel 8**: Produktion & företagsmönster ✅

### Verifiering av inlärning
Efter varje kapitel verifierar du kunskapen genom att:
1. **Praktisk övning**: Slutför kapitelns praktiska distribution
2. **Kunskapskontroll**: Granska FAQ-sektionen för ditt kapitel
3. **Communitydiskussion**: Dela dina erfarenheter i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa komplexitetsnivå

### Fördelar vid kursavslutning
När du slutfört alla kapitel kommer du att ha:
- **Produktionserfarenhet**: Distribuerat riktiga AI-applikationer till Azure
- **Professionella färdigheter**: Enterprise-klara distributionsförmågor  
- **Communityrecognition**: Aktiv medlem i Azure-utvecklargemenskapen
- **Karriärutveckling**: Eftertraktad AZD- och AI-distributionskompetens

---

## 🤝 Community & Support

### Få hjälp & support
- **Tekniska problem**: [Rapportera buggar och önska funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Inlärningsfrågor**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) och [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-specifik hjälp**: Gå med i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentation**: [Officiell Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Communityinsikter från Microsoft Foundry Discord

**Senaste undersökningsresultat från #Azure-kanalen:**
- **45%** av utvecklare vill använda AZD för AI-arbetsbelastningar
- **Största utmaningar**: Multi-service-distributioner, hantering av behörigheter, produktionsberedskap  
- **Mest efterfrågat**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vår community för att:**
- Dela dina erfarenheter med AZD + AI och få hjälp
- Få tillgång till tidiga förhandsvisningar av nya AI-mallar
- Bidra till bästa praxis för AI-distribution
- Påverka framtida utveckling av AI + AZD-funktioner

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [guide för bidrag](CONTRIBUTING.md) för detaljer om:
- **Förbättringar av innehåll**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att underhålla flerspråkigt stöd
- **Buggrapporter**: Förbättra noggrannhet och tydlighet
- **Communitystandarder**: Följ våra inkluderande riktlinjer

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen – se [LICENSE](../../LICENSE) för detaljer.

### Relaterade Microsoft-inlärningsresurser

Vårt team producerar fler omfattande lärandekurser:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j för nybörjare](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js för nybörjare](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain för nybörjare](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
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
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-serien
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära dig?**

**Nybörjare**: Börja med [Kapitel 1: Grundläggande & snabbstart](../..)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-först utveckling](../..)  
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration & autentisering](../..)

**Nästa steg**: [Börja Kapitel 1 - AZD Basics](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör man vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål ska anses vara den auktoritativa källan. För kritisk information rekommenderas professionell människöversättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår från användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->