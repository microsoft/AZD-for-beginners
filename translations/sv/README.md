<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "21dcf6a2d8a223a853d965138d4fb045",
  "translation_date": "2025-09-17T23:09:16+00:00",
  "source_file": "README.md",
  "language_code": "sv"
}
-->
# AZD För Nybörjare: En Strukturerad Inlärningsresa

![AZD-for-beginners](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sv.png) 

## Komma Igång med Kursen

Följ dessa steg för att börja din AZD-inlärningsresa:

1. **Forka Repositoriet**: Klicka [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klona Repositoriet**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Gå med i Communityn**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) för experthjälp
4. **Välj Din Inlärningsväg**: Välj ett kapitel nedan som passar din erfarenhetsnivå

### Stöd för Flera Språk

#### Automatiska Översättningar (Alltid Uppdaterade)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](./README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

## Kursöversikt

Lär dig Azure Developer CLI (azd) genom strukturerade kapitel som är utformade för progressiv inlärning. **Särskilt fokus på att distribuera AI-applikationer med Azure AI Foundry-integrering.**

### Varför Denna Kurs är Viktig för Moderna Utvecklare

Baserat på insikter från Azure AI Foundry Discord-communityn, **vill 45% av utvecklarna använda AZD för AI-arbetsbelastningar** men stöter på utmaningar med:
- Komplexa AI-arkitekturer med flera tjänster
- Bästa praxis för AI-distribution i produktion  
- Integrering och konfiguration av Azure AI-tjänster
- Kostnadsoptimering för AI-arbetsbelastningar
- Felsökning av AI-specifika distributionsproblem

### Inlärningsmål

Genom att slutföra denna strukturerade kurs kommer du att:
- **Behärska AZD-grunderna**: Kärnkoncept, installation och konfiguration
- **Distribuera AI-applikationer**: Använd AZD med Azure AI Foundry-tjänster
- **Implementera Infrastruktur som Kod**: Hantera Azure-resurser med Bicep-mallar
- **Felsöka Distributioner**: Lösa vanliga problem och debugga
- **Optimera för Produktion**: Säkerhet, skalning, övervakning och kostnadshantering
- **Bygga Multi-Agent Lösningar**: Distribuera komplexa AI-arkitekturer

## 📚 Inlärningskapitel

*Välj din inlärningsväg baserat på erfarenhetsnivå och mål*

### 🚀 Kapitel 1: Grundläggande & Snabbstart
**Förkunskaper**: Azure-abonnemang, grundläggande kommandoradskunskaper  
**Tidsåtgång**: 30-45 minuter  
**Komplexitet**: ⭐

#### Vad Du Kommer Lära Dig
- Förstå grunderna i Azure Developer CLI
- Installera AZD på din plattform
- Din första lyckade distribution

#### Inlärningsresurser
- **🎯 Börja Här**: [Vad är Azure Developer CLI?](../..)
- **📖 Teori**: [AZD Grunder](docs/getting-started/azd-basics.md) - Kärnkoncept och terminologi
- **⚙️ Installation**: [Installationsguide](docs/getting-started/installation.md) - Plattformsspecifika guider
- **🛠️ Praktiskt**: [Ditt Första Projekt](docs/getting-started/first-project.md) - Steg-för-steg handledning
- **📋 Snabbreferens**: [Kommandoblad](resources/cheat-sheet.md)

#### Praktiska Övningar
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitelresultat**: Lyckas distribuera en enkel webbapplikation till Azure med AZD

---

### 🤖 Kapitel 2: AI-Driven Utveckling (Rekommenderas för AI-utvecklare)
**Förkunskaper**: Kapitel 1 slutfört  
**Tidsåtgång**: 1-2 timmar  
**Komplexitet**: ⭐⭐

#### Vad Du Kommer Lära Dig
- Integrering av Azure AI Foundry med AZD
- Distribuera AI-drivna applikationer
- Förstå konfigurationer för AI-tjänster

#### Inlärningsresurser
- **🎯 Börja Här**: [Azure AI Foundry Integrering](docs/ai-foundry/azure-ai-foundry-integration.md)
- **📖 Mönster**: [AI-Modell Distribution](docs/ai-foundry/ai-model-deployment.md) - Distribuera och hantera AI-modeller
- **🛠️ Workshop**: [AI Workshop Lab](docs/ai-foundry/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-klara
- **📋 Mallar**: [Azure AI Foundry Mallar](../..)

#### Praktiska Övningar
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Kapitelresultat**: Distribuera och konfigurera en AI-driven chattapplikation med RAG-funktioner

---

### ⚙️ Kapitel 3: Konfiguration & Autentisering
**Förkunskaper**: Kapitel 1 slutfört  
**Tidsåtgång**: 45-60 minuter  
**Komplexitet**: ⭐⭐

#### Vad Du Kommer Lära Dig
- Hantering av miljökonfigurationer
- Bästa praxis för autentisering och säkerhet
- Namngivning och organisering av resurser

#### Inlärningsresurser
- **📖 Konfiguration**: [Konfigurationsguide](docs/getting-started/configuration.md) - Miljöinställningar
- **🔐 Säkerhet**: Autentiseringsmönster och hanterad identitet
- **📝 Exempel**: [Databasapplikation Exempel](../../examples/database-app) - Konfigurationsmönster

#### Praktiska Övningar
- Konfigurera flera miljöer (dev, staging, prod)
- Ställ in autentisering med hanterad identitet
- Implementera miljöspecifika konfigurationer

**💡 Kapitelresultat**: Hantera flera miljöer med korrekt autentisering och säkerhet

---

### 🏗️ Kapitel 4: Infrastruktur som Kod & Distribution
**Förkunskaper**: Kapitel 1-3 slutfört  
**Tidsåtgång**: 1-1.5 timmar  
**Komplexitet**: ⭐⭐⭐

#### Vad Du Kommer Lära Dig
- Avancerade distributionsmönster
- Infrastruktur som kod med Bicep
- Strategier för resursförsörjning

#### Inlärningsresurser
- **📖 Distribution**: [Distributionsguide](docs/deployment/deployment-guide.md) - Kompletta arbetsflöden
- **🏗️ Försörjning**: [Resursförsörjning](docs/deployment/provisioning.md) - Hantering av Azure-resurser
- **📝 Exempel**: [Containerapplikation Exempel](../../examples/container-app) - Containerbaserade distributioner

#### Praktiska Övningar
- Skapa anpassade Bicep-mallar
- Distribuera applikationer med flera tjänster
- Implementera blå-grön distributionsstrategier

**💡 Kapitelresultat**: Distribuera komplexa applikationer med flera tjänster med anpassade infrastruktursmallar

---

### 🎯 Kapitel 5: Multi-Agent AI-Lösningar (Avancerat)
**Förkunskaper**: Kapitel 1-2 slutfört  
**Tidsåtgång**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad Du Kommer Lära Dig
- Mönster för multi-agent arkitektur
- Orkestrering och samordning av agenter
- Produktionsklara AI-distributioner

#### Inlärningsresurser
- **🤖 Utvalt Projekt**: [Detaljhandel Multi-Agent Lösning](examples/retail-scenario.md) - Komplett implementation
- **🛠️ ARM Mallar**: [ARM Mallpaket](../../examples/retail-multiagent-arm-template) - Enklicksdistribution
- **📖 Arkitektur**: Mönster för samordning av agenter

#### Praktiska Övningar
```bash
# Deploy the complete retail multi-agent solution
cd examples/retail-multiagent-arm-template
./deploy.sh

# Explore agent configurations
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitelresultat**: Distribuera och hantera en produktionsklar multi-agent AI-lösning med kund- och lageragenter

---

### 🔍 Kapitel 6: Validering & Planering före Distribution
**Förkunskaper**: Kapitel 4 slutfört  
**Tidsåtgång**: 1 timme  
**Komplexitet**: ⭐⭐

#### Vad Du Kommer Lära Dig
- Kapacitetsplanering och resursvalidering
- Strategier för val av SKU
- Förkontroller och automatisering

#### Inlärningsresurser
- **📊 Planering**: [Kapacitetsplanering](docs/pre-deployment/capacity-planning.md) - Resursvalidering
- **💰 Val**: [SKU Val](docs/pre-deployment/sku-selection.md) - Kostnadseffektiva val
- **✅ Validering**: [Förkontroller](docs/pre-deployment/preflight-checks.md) - Automatiserade skript

#### Praktiska Övningar
- Kör skript för kapacitetsvalidering
- Optimera SKU-val för kostnad
- Implementera automatiserade förkontroller

**💡 Kapitelresultat**: Validera och optimera distributioner innan utförande

---

### 🚨 Kapitel 7: Felsökning & Debugging
**Förkunskaper**: Något distributionskapitel slutfört  
**Tidsåtgång**: 1-1.5 timmar  
**Komplexitet**: ⭐⭐

#### Vad Du Kommer Lära Dig
- Systematiska felsökningsmetoder
- Vanliga problem och lösningar
- AI-specifik felsökning

#### Inlärningsresurser
- **🔧 Vanliga Problem**: [Vanliga Problem](docs/troubleshooting/common-issues.md) - FAQ och lösningar
- **🕵️ Debugging**: [Debugging Guide](docs/troubleshooting/debugging.md) - Steg-för-steg strategier
- **🤖 AI Problem**: [AI-specifik Felsökning](docs/troubleshooting/ai-troubleshooting.md) - Problem med AI-tjänster

#### Praktiska Övningar
- Diagnostisera distributionsfel
- Lös autentiseringsproblem
- Debugga AI-tjänsters anslutning

**💡 Kapitelresultat**: Självständigt diagnostisera och lösa vanliga distributionsproblem

---

### 🏢 Kapitel 8: Produktions- & Företagsmönster
**Förkunskaper**: Kapitel 1-4 slutfört  
**Tidsåtgång**: 2-3 timmar  
**Komplexitet**: ⭐⭐⭐⭐

#### Vad Du Kommer Lära Dig
- Strategier för distribution i produktion
- Företagsmönster för säkerhet
- Övervakning och kostnadsoptimering

#### Inlärningsresurser
- **🏭 Produktion**: [Bästa Praxis för AI i Produktion](docs/ai-foundry/production-ai-practices.md) - Företagsmönster
- **📝 Exempel**: [Mikrotjänster Exempel](../../examples/microservices) - Komplexa arkitekturer
- **📊 Övervakning**: Integration med Application Insights

#### Praktiska Övningar
- Implementera säkerhetsmönster för företag
- Ställ in omfattande övervakning
- Distribuera till produktion med korrekt styrning

**💡 Kapitelresultat**: Distribuera företagsklara applikationer med fulla produktionsmöjligheter

---

## 📖 Vad är Azure Developer CLI?

Azure Developer CLI (azd) är ett utvecklarfokuserat kommandoradsverktyg som påskyndar processen att bygga och distribuera applikationer till Azure. Det erbjuder:

- **Mallbaserade distributioner** - Använd förbyggda mallar för vanliga applikationsmönster
- **Infrastructure as Code** - Hantera Azure-resurser med Bicep eller Terraform  
- **Integrerade arbetsflöden** - Smidig provisionering, distribution och övervakning av applikationer
- **Utvecklarvänligt** - Optimerat för utvecklarproduktivitet och upplevelse

### **AZD + Azure AI Foundry: Perfekt för AI-distributioner**

**Varför AZD för AI-lösningar?** AZD hanterar de största utmaningarna AI-utvecklare står inför:

- **AI-klara mallar** - Förkonfigurerade mallar för Azure OpenAI, Cognitive Services och ML-arbetsbelastningar
- **Säkra AI-distributioner** - Inbyggda säkerhetsmönster för AI-tjänster, API-nycklar och modellendpoints  
- **Produktionsklara AI-mönster** - Bästa praxis för skalbara och kostnadseffektiva AI-applikationsdistributioner
- **End-to-End AI-arbetsflöden** - Från modellutveckling till produktionsdistribution med korrekt övervakning
- **Kostnadsoptimering** - Smarta strategier för resursallokering och skalning av AI-arbetsbelastningar
- **Integration med Azure AI Foundry** - Sömlös anslutning till AI Foundry-modellkatalog och endpoints

---

## 🎯 Mall- och Exempelbibliotek

### Utvalda: Azure AI Foundry-mallar
**Börja här om du distribuerar AI-applikationer!**

| Mall | Kapitel | Komplexitet | Tjänster |
|------|---------|-------------|----------|
| [**Kom igång med AI-chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights |
| [**Kom igång med AI-agenter**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights|
| [**Multi-agent arbetsflödesautomation**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure AI Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Generera dokument från dina data**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 4 | ⭐⭐⭐  | AzureOpenAI + Azure AI Search + Azure AI Services + Azure CosmosDB|
| [**Förbättra kundmöten med agenter**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 5 | ⭐⭐⭐| AzureOpenAI + Azure AI Search + Azure CosmosDB + Azure SQL Database |
| [**Modernisera din kod med agenter**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Agent Service + Semantic Kernel + Azure CosmosDB + Azure Container Apps|
| [**Bygg din konversationsagent**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 4 | ⭐⭐⭐ | AI Language + AzureOpenAI + AI Search + Azure Storage + Azure Container Registry|
| [**Lås upp insikter från konversationsdata**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 8 | ⭐⭐⭐ | AzureOpenAI + AI Search + Semantic Kernel + Azure Agent Service + AI AI Content Understanding|
| [**Multi-modal innehållsbehandling**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + Azure Content Understanding + Azure CosmosDB + Azure Container Apps|

### Utvalda: Kompletta inlärningsscenarier
**Produktionsklara applikationsmallar kopplade till inlärningskapitel**

| Mall | Inlärningskapitel | Komplexitet | Nyckelinlärning |
|------|-------------------|-------------|-----------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundläggande AI-distributionsmönster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-implementering med Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration med dokumentintelligens |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentramverk och funktionsanrop |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Företags-AI-orkestrering |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-agent arkitektur med kund- och lageragenter |

### Inlärning efter exempeltyp

#### Enkla applikationer (Kapitel 1-2)
- [Enkel webbapp](../../examples/simple-web-app) - Grundläggande distributionsmönster
- [Statisk webbplats](../../examples/static-site) - Distribution av statiskt innehåll
- [Grundläggande API](../../examples/basic-api) - REST API-distribution

#### Databasintegration (Kapitel 3-4)  
- [Databasapp](../../examples/database-app) - Mönster för databasanslutning
- [Databehandling](../../examples/data-processing) - ETL-arbetsflödesdistribution

#### Avancerade mönster (Kapitel 4-8)
- [Container-appar](../../examples/container-app) - Containerbaserade distributioner
- [Mikrotjänster](../../examples/microservices) - Multi-tjänstarkitekturer  
- [Företagslösningar](../../examples/enterprise) - Produktionsklara mönster

### Externa mallkollektioner
- [**Azure-Samples AZD Templates**](https://github.com/Azure-Samples/azd-templates) - Officiella Microsoft-exempel
- [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) - Mallar från communityn
- [**Examples Directory**](examples/README.md) - Lokala inlärningsexempel med detaljerade förklaringar

---

## 📚 Inlärningsresurser & Referenser

### Snabba referenser
- [**Kommandoguide**](resources/cheat-sheet.md) - Viktiga azd-kommandon organiserade per kapitel
- [**Ordlista**](resources/glossary.md) - Terminologi för Azure och azd  
- [**FAQ**](resources/faq.md) - Vanliga frågor organiserade per inlärningskapitel
- [**Studieguide**](resources/study-guide.md) - Omfattande praktiska övningar

### Praktiska workshops
- [**AI Workshop Lab**](docs/ai-foundry/ai-workshop-lab.md) - Gör dina AI-lösningar AZD-distribuerbara
- [**AZD För Nybörjare Workshop**](workshop/README.md) - Kompletta praktiska workshopmaterial

### Externa inlärningsresurser
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Priskalkylator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🎓 Kursavslutning & Certifiering

### Framstegsspårning
Spåra din inlärningsprogression genom varje kapitel:

- [ ] **Kapitel 1**: Grundläggande & Snabbstart ✅
- [ ] **Kapitel 2**: AI-fokuserad utveckling ✅  
- [ ] **Kapitel 3**: Konfiguration & Autentisering ✅
- [ ] **Kapitel 4**: Infrastructure as Code & Distribution ✅
- [ ] **Kapitel 5**: Multi-agent AI-lösningar ✅
- [ ] **Kapitel 6**: Fördistributionsvalidering & Planering ✅
- [ ] **Kapitel 7**: Felsökning & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Företagsmönster ✅

### Inlärningsverifiering
Efter att ha avslutat varje kapitel, verifiera din kunskap genom:
1. **Praktisk övning**: Slutför kapitelns praktiska distribution
2. **Kunskapskontroll**: Granska FAQ-sektionen för ditt kapitel
3. **Community-diskussion**: Dela dina erfarenheter i Azure Discord
4. **Nästa kapitel**: Gå vidare till nästa komplexitetsnivå

### Fördelar med kursavslutning
När du har avslutat alla kapitel kommer du att ha:
- **Produktionsupplevelse**: Distribuerat riktiga AI-applikationer till Azure
- **Professionella färdigheter**: Företagsklara distributionsförmågor  
- **Community-erkännande**: Aktiv medlem i Azure-utvecklarcommunityn
- **Karriärutveckling**: Eftertraktad AZD- och AI-distributionsexpertis

---

## 🤝 Community & Support

### Få hjälp & support
- **Tekniska problem**: [Rapportera buggar och begär funktioner](https://github.com/microsoft/azd-for-beginners/issues)
- **Inlärningsfrågor**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure)
- **AI-specifik hjälp**: Gå med i [#Azure-kanalen](https://discord.gg/microsoft-azure) för diskussioner om AZD + AI Foundry
- **Dokumentation**: [Officiell Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-insikter från Azure AI Foundry Discord

**Senaste omröstningsresultat från #Azure-kanalen:**
- **45%** av utvecklarna vill använda AZD för AI-arbetsbelastningar
- **Största utmaningarna**: Multi-tjänstdistributioner, hantering av autentisering, produktionsberedskap  
- **Mest efterfrågat**: AI-specifika mallar, felsökningsguider, bästa praxis

**Gå med i vår community för att:**
- Dela dina AZD + AI-erfarenheter och få hjälp
- Få tidiga förhandsvisningar av nya AI-mallar
- Bidra till bästa praxis för AI-distribution
- Påverka framtida utveckling av AI + AZD-funktioner

### Bidra till kursen
Vi välkomnar bidrag! Läs vår [Bidragsguide](CONTRIBUTING.md) för detaljer om:
- **Förbättringar av innehåll**: Förbättra befintliga kapitel och exempel
- **Nya exempel**: Lägg till verkliga scenarier och mallar  
- **Översättning**: Hjälp till att upprätthålla flerspråkigt stöd
- **Buggrapporter**: Förbättra noggrannhet och tydlighet
- **Community-standarder**: Följ våra inkluderande community-riktlinjer

---

## 📄 Kursinformation

### Licens
Detta projekt är licensierat under MIT-licensen - se [LICENSE](../../LICENSE)-filen för detaljer.

### Relaterade Microsoft-inlärningsresurser

Vårt team producerar andra omfattande inlärningskurser:

- [**NY** Model Context Protocol (MCP) För Nybörjare](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI-agenter för nybörjare](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI för nybörjare med .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativ AI för nybörjare](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativ AI för nybörjare med Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML för nybörjare](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Data Science för nybörjare](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI för nybörjare](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Cybersäkerhet för nybörjare](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Webbutveckling för nybörjare](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT för nybörjare](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR-utveckling för nybörjare](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Bemästra GitHub Copilot för AI-parprogrammering](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Bemästra GitHub Copilot för C#/.NET-utvecklare](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Välj ditt eget Copilot-äventyr](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

## 🗺️ Kursnavigering

**🚀 Redo att börja lära dig?**

**Nybörjare**: Börja med [Kapitel 1: Grundläggande & Snabbstart](../..)  
**AI-utvecklare**: Hoppa till [Kapitel 2: AI-fokuserad utveckling](../..)
**Erfarna utvecklare**: Börja med [Kapitel 3: Konfiguration & Autentisering](../..)

**Nästa steg**: [Börja med Kapitel 1 - AZD Grunder](docs/getting-started/azd-basics.md) →

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.