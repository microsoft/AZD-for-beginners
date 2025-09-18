<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T23:18:29+00:00",
  "source_file": "examples/README.md",
  "language_code": "sv"
}
-->
# Exempel - Praktiska AZD-mallar och konfigurationer

**Lär dig genom exempel - Organiserat per kapitel**
- **📚 Kursens startsida**: [AZD För Nybörjare](../README.md)
- **📖 Kapitelöversikt**: Exempel organiserade efter lärandekomplexitet
- **🚀 Börja enkelt**: [Kapitel 1 Exempel](../../../examples)
- **🤖 AI Exempel**: [Kapitel 2 & 5 AI-lösningar](../../../examples)

## Introduktion

Denna katalog innehåller praktiska exempel, mallar och verkliga scenarier för att hjälpa dig att lära dig Azure Developer CLI genom praktisk övning. Varje exempel innehåller komplett fungerande kod, infrastruktursmallar och detaljerade instruktioner för olika applikationsarkitekturer och distributionsmönster.

## Lärandemål

Genom att arbeta med dessa exempel kommer du att:
- Öva på Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementeringar
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Tillämpa konfigurationshantering och miljöspecifika distributionsstrategier
- Implementera övervakning, säkerhet och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugging av verkliga distributionsscenarier

## Läranderesultat

När du har slutfört dessa exempel kommer du att kunna:
- Självsäkert distribuera olika applikationstyper med Azure Developer CLI
- Anpassa de tillhandahållna mallarna till dina egna applikationskrav
- Designa och implementera anpassade infrastruktursmönster med Bicep
- Konfigurera komplexa applikationer med flera tjänster och korrekta beroenden
- Tillämpa säkerhets-, övervaknings- och prestandabästa praxis i verkliga scenarier
- Felsöka och optimera distributioner baserat på praktisk erfarenhet

## Katalogstruktur

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Snabbstartsexempel

### För Nybörjare
1. **[Enkel Webbapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Distribuera en Node.js Express-webbapplikation med MongoDB
2. **[Statisk Webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Värd för en React statisk webbplats med Azure Static Web Apps
3. **[Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Distribuera en containeriserad Python Flask-applikation

### För Mellanliggande Användare
4. **[Databasapp - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webbapplikation med C# API och Azure SQL-databas
5. **[Serverlös Funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions med HTTP-triggers och Cosmos DB
6. **[Mikrotjänster - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Fler-tjänst Java-applikation med Container Apps och API-gateway

### Azure AI Foundry Mallar

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligent chattapplikation med Azure OpenAI
2. **[AI Dokumentbearbetning](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentanalys med Azure AI-tjänster
3. **[Maskininlärningspipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps-arbetsflöde med Azure Machine Learning

### Verkliga Scenarier

#### **Detaljhandel Multi-Agent Lösning** 🆕
**[Komplett Implementeringsguide](./retail-scenario.md)**

En omfattande, produktionsklar multi-agent kundsupportlösning som demonstrerar AI-applikationsdistribution i företagsklass med AZD. Detta scenario erbjuder:

- **Komplett Arkitektur**: Multi-agent system med specialiserade kundservice- och lagerhanteringsagenter
- **Produktionsinfrastruktur**: Multi-region Azure OpenAI-distributioner, AI-sökning, Container Apps och omfattande övervakning
- **Redo-att-distribuera ARM-mall**: Enklicksdistribution med flera konfigurationslägen (Minimal/Standard/Premium)
- **Avancerade Funktioner**: Säkerhetsvalidering, agentutvärderingsramverk, kostnadsoptimering och felsökningsguider
- **Verklig Affärskontext**: Detaljhandels kundsupportanvändningsfall med filuppladdningar, sökintegration och dynamisk skalning

**Teknologier**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexitet**: ⭐⭐⭐⭐ (Avancerad - Produktionsklar för företag)

**Perfekt för**: AI-utvecklare, lösningsarkitekter och team som bygger produktionsklara multi-agent system

**Snabbstart**: Distribuera den kompletta lösningen på under 30 minuter med den inkluderade ARM-mallen med `./deploy.sh -g myResourceGroup`

## 📋 Användarinstruktioner

### Köra Exempel Lokalt

1. **Klona eller Kopiera Exempel**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initiera AZD Miljö**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurera Miljö**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Distribuera**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Anpassa Exempel

Varje exempel inkluderar:
- **README.md** - Detaljerade installations- och anpassningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-mallar med parameterförklaringar
- **src/** - Exempelapplikationskod
- **scripts/** - Hjälpskript för vanliga uppgifter

## 🎯 Lärandemål

### Exempelkategorier

#### **Grundläggande Distributioner**
- Applikationer med en tjänst
- Enkla infrastruktursmönster
- Grundläggande konfigurationshantering
- Kostnadseffektiva utvecklingsmiljöer

#### **Avancerade Scenarier**
- Arkitekturer med flera tjänster
- Komplexa nätverkskonfigurationer
- Databasintegrationsmönster
- Säkerhets- och efterlevnadsimplementeringar

#### **Produktionsklara Mönster**
- Konfigurationer för hög tillgänglighet
- Övervakning och observabilitet
- CI/CD-integration
- Återställningsstrategier vid katastrofer

## 📖 Exempelbeskrivningar

### Enkel Webbapp - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Komplexitet**: Nybörjare  
**Koncept**: Grundläggande distribution, REST API, NoSQL-databasintegration

### Statisk Webbplats - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, serverlös backend, modern webbutveckling

### Container App - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry  
**Komplexitet**: Nybörjare  
**Koncept**: Containerisering, mikrotjänstarkitektur, API-utveckling

### Databasapp - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitet**: Mellanliggande  
**Koncept**: Entity Framework, databasanslutningar, web API-utveckling

### Serverlös Funktion - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitet**: Mellanliggande  
**Koncept**: Händelsestyrd arkitektur, serverlös databehandling, fullstack-utveckling

### Mikrotjänster - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitet**: Mellanliggande  
**Koncept**: Kommunikation mellan tjänster, distribuerade system, företagsmönster

### Azure AI Foundry Exempel

#### Azure OpenAI Chat App
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Komplexitet**: Mellanliggande  
**Koncept**: RAG-arkitektur, vektorsökning, LLM-integration

#### AI Dokumentbearbetning
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitet**: Mellanliggande  
**Koncept**: Dokumentanalys, OCR, dataextraktion

#### Maskininlärningspipeline
**Teknologier**: Azure ML, MLOps, Container Registry  
**Komplexitet**: Avancerad  
**Koncept**: Modellträning, distributionspipelines, övervakning

## 🛠 Konfigurationsexempel

Katalogen `configurations/` innehåller återanvändbara komponenter:

### Miljökonfigurationer
- Inställningar för utvecklingsmiljö
- Konfigurationer för stagingmiljö
- Produktionsklara konfigurationer
- Multi-region distributionsinställningar

### Bicep-moduler
- Återanvändbara infrastrukturkomponenter
- Vanliga resursmönster
- Säkerhetshärdade mallar
- Kostnadsoptimerade konfigurationer

### Hjälpskript
- Automatisering av miljöinställningar
- Databas-migrationsskript
- Verktyg för distributionsvalidering
- Kostnadsövervakningsverktyg

## 🔧 Anpassningsguide

### Anpassa Exempel för Dina Behov

1. **Granska Förutsättningar**
   - Kontrollera Azure-tjänstkrav
   - Verifiera prenumerationsgränser
   - Förstå kostnadsimplikationer

2. **Modifiera Konfiguration**
   - Uppdatera `azure.yaml` tjänstedefinitioner
   - Anpassa Bicep-mallar
   - Justera miljövariabler

3. **Testa Noggrant**
   - Distribuera först till utvecklingsmiljö
   - Validera funktionalitet
   - Testa skalning och prestanda

4. **Säkerhetsgranskning**
   - Granska åtkomstkontroller
   - Implementera hantering av hemligheter
   - Aktivera övervakning och larm

## 📊 Jämförelsematris

| Exempel | Tjänster | Databas | Auth | Övervakning | Komplexitet |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Grundläggande | Grundläggande | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundläggande | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Grundläggande | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Mikrotjänster | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Dokumentbearbetning | 2 | ❌ | Grundläggande | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Detaljhandel Multi-Agent** | **8+** | **✅** | **Företagsklass** | **Avancerad** | **⭐⭐⭐⭐** |

## 🎓 Lärandebana

### Rekommenderad Progression

1. **Börja med Enkel Webbapp**
   - Lär dig grundläggande AZD-koncept
   - Förstå distributionsarbetsflöde
   - Öva på miljöhantering

2. **Prova Statisk Webbplats**
   - Utforska olika hostingalternativ
   - Lär dig om CDN-integration
   - Förstå DNS-konfiguration

3. **Gå vidare till Container App**
   - Lär dig grunderna i containerisering
   - Förstå skalningskoncept
   - Öva med Docker

4. **Lägg till Databasintegration**
   - Lär dig databasprovisionering
   - Förstå anslutningssträngar
   - Öva på hantering av hemligheter

5. **Utforska Serverlös**
   - Förstå händelsestyrd arkitektur
   - Lär dig om triggers och bindningar
   - Öva med API:er

6. **Bygg Mikrotjänster**
   - Lär dig tjänstekommunikation
   - Förstå distribuerade system
   - Öva på komplexa distributioner

## 🔍 Hitta Rätt Exempel

### Efter Teknologistack
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Mikrotjänster
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Mikrotjänster
- **Databaser**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Dokumentbearbetning, ML Pipeline, **Detaljhandel Multi-Agent Lösning**
- **Multi-Agent System**: **Detaljhandel Multi-Agent Lösning**
- **Företagsproduktion**: **Detaljhandel Multi-Agent Lösning**

### Efter Arkitekturmönster
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverlös**: React SPA + Functions, Python Functions + SPA
- **Mikrotjänster**: Java Spring Boot Mikrotjänster
- **Containeriserad**: Python Flask Container App
- **AI-Driven**: Azure OpenAI Chat App, AI Dokumentbearbetning, ML Pipeline, **Detaljhandel Multi-Agent Lösning**
- **Multi-Agent Arkitektur**: **Detaljhandel Multi-Agent Lösning**
- **Företags Multi-Tjänst**: **Detaljhandel Multi-Agent Lösning**

### Efter Komplexitetsnivå
- **Nybörjare**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Mellanliggande**: C# Web API + SQL, Python Functions + SPA, Java Mikrotjänster, Azure OpenAI Chat App, AI Dokumentbearbetning
- **Avancerad**: ML Pipeline
- **Företagsproduktion**: **Detaljhandel Multi-Agent Lösning** (Komplett multi-agent system med ARM-mall distribution)

## 📚 Ytterligare Resurser

### Dokumentationslänkar
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Mallar](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)

### Community Exempel
- [Azure Samples AZD Mallar](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Mallar](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galleri](https://azure.github.io/awesome-azd/)
- [Todo App med C# och Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python och MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js och PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Jobb](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar bidrag!

### Riktlinjer för inskickning
1. Följ den etablerade katalogstrukturen
2. Inkludera en omfattande README.md
3. Lägg till kommentarer i konfigurationsfiler
4. Testa noggrant innan du skickar in
5. Inkludera kostnadsberäkningar och förutsättningar

### Exempel på mallstruktur
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Tips**: Börja med det enklaste exemplet som passar din teknologiska plattform, och arbeta dig sedan gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från de tidigare!

**Nästa steg**: 
- Välj ett exempel som matchar din kunskapsnivå
- Följ installationsinstruktionerna i exempelets README
- Experimentera med anpassningar
- Dela dina lärdomar med communityn

---

**Navigering**
- **Föregående lektion**: [Studieguide](../resources/study-guide.md)
- **Återgå till**: [Huvud README](../README.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.