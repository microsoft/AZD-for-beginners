<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:14:39+00:00",
  "source_file": "examples/README.md",
  "language_code": "sv"
}
-->
# Exempel - Praktiska AZD-mallar och konfigurationer

## Introduktion

Den här katalogen innehåller praktiska exempel, mallar och verkliga scenarier för att hjälpa dig att lära dig Azure Developer CLI genom praktisk övning. Varje exempel erbjuder komplett fungerande kod, infrastruktursmallar och detaljerade instruktioner för olika applikationsarkitekturer och distributionsmönster.

## Lärandemål

Genom att arbeta med dessa exempel kommer du att:
- Öva på Azure Developer CLI-arbetsflöden med realistiska applikationsscenarier
- Förstå olika applikationsarkitekturer och deras azd-implementeringar
- Bemästra Infrastructure as Code-mönster för olika Azure-tjänster
- Tillämpa konfigurationshantering och miljöspecifika distributionsstrategier
- Implementera övervakning, säkerhet och skalningsmönster i praktiska sammanhang
- Bygga erfarenhet av felsökning och debugging av verkliga distributionsscenarier

## Läranderesultat

Efter att ha slutfört dessa exempel kommer du att kunna:
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

### För nybörjare
1. **[Enkel webbapp - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Distribuera en Node.js Express-webbapplikation med MongoDB
2. **[Statisk webbplats - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Värd för en statisk React-webbplats med Azure Static Web Apps
3. **[Containerapp - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Distribuera en containeriserad Python Flask-applikation

### För användare på mellannivå
4. **[Databasapp - C# med Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webbapplikation med C# API och Azure SQL-databas
5. **[Serverlös funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions med HTTP-triggers och Cosmos DB
6. **[Mikrotjänster - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Applikation med flera tjänster i Java med Container Apps och API-gateway

### Azure AI Foundry-mallar

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligent chattapplikation med Azure OpenAI
2. **[AI-dokumentbearbetning](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentanalys med Azure AI-tjänster
3. **[Maskininlärningspipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps-arbetsflöde med Azure Machine Learning

## 📋 Användarinstruktioner

### Köra exempel lokalt

1. **Klona eller kopiera exempel**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Initiera AZD-miljö**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurera miljö**
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

### Anpassa exempel

Varje exempel innehåller:
- **README.md** - Detaljerade installations- och anpassningsinstruktioner
- **azure.yaml** - AZD-konfiguration med kommentarer
- **infra/** - Bicep-mallar med parameterförklaringar
- **src/** - Exempel på applikationskod
- **scripts/** - Hjälpskript för vanliga uppgifter

## 🎯 Lärandemål

### Exempelkategorier

#### **Grundläggande distributioner**
- Applikationer med en tjänst
- Enkla infrastruktursmönster
- Grundläggande konfigurationshantering
- Kostnadseffektiva utvecklingsmiljöer

#### **Avancerade scenarier**
- Arkitekturer med flera tjänster
- Komplexa nätverkskonfigurationer
- Databasintegrationsmönster
- Säkerhets- och efterlevnadsimplementeringar

#### **Produktionsklara mönster**
- Konfigurationer med hög tillgänglighet
- Övervakning och observabilitet
- CI/CD-integration
- Återställningsstrategier vid katastrofer

## 📖 Exempelbeskrivningar

### Enkel webbapp - Node.js Express
**Teknologier**: Node.js, Express, MongoDB, Container Apps  
**Komplexitet**: Nybörjare  
**Koncept**: Grundläggande distribution, REST API, NoSQL-databasintegration

### Statisk webbplats - React SPA
**Teknologier**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexitet**: Nybörjare  
**Koncept**: Statisk hosting, serverlös backend, modern webbutveckling

### Containerapp - Python Flask
**Teknologier**: Python Flask, Docker, Container Apps, Container Registry  
**Komplexitet**: Nybörjare  
**Koncept**: Containerisering, mikrotjänstarkitektur, API-utveckling

### Databasapp - C# med Azure SQL
**Teknologier**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexitet**: Mellannivå  
**Koncept**: Entity Framework, databasanslutningar, webb-API-utveckling

### Serverlös funktion - Python Azure Functions
**Teknologier**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexitet**: Mellannivå  
**Koncept**: Händelsedriven arkitektur, serverlös databehandling, fullstack-utveckling

### Mikrotjänster - Java Spring Boot
**Teknologier**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexitet**: Mellannivå  
**Koncept**: Kommunikation mellan tjänster, distribuerade system, företagsmönster

### Azure AI Foundry-exempel

#### Azure OpenAI Chat App
**Teknologier**: Azure OpenAI, Cognitive Search, App Service  
**Komplexitet**: Mellannivå  
**Koncept**: RAG-arkitektur, vektorsökning, LLM-integration

#### AI-dokumentbearbetning
**Teknologier**: Azure AI Document Intelligence, Storage, Functions  
**Komplexitet**: Mellannivå  
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
- Distributionsinställningar för flera regioner

### Bicep-moduler
- Återanvändbara infrastrukturkomponenter
- Vanliga resursmönster
- Säkerhetshärdade mallar
- Kostnadsoptimerade konfigurationer

### Hjälpskript
- Automatisering av miljöinställningar
- Databas-migrationsskript
- Verktyg för validering av distributioner
- Kostnadsövervakningsverktyg

## 🔧 Anpassningsguide

### Anpassa exempel för dina behov

1. **Granska förutsättningar**
   - Kontrollera Azure-tjänstkrav
   - Verifiera prenumerationsgränser
   - Förstå kostnadsimplikationer

2. **Modifiera konfiguration**
   - Uppdatera tjänstedefinitioner i `azure.yaml`
   - Anpassa Bicep-mallar
   - Justera miljövariabler

3. **Testa noggrant**
   - Distribuera först till utvecklingsmiljön
   - Validera funktionalitet
   - Testa skalning och prestanda

4. **Säkerhetsgranskning**
   - Granska åtkomstkontroller
   - Implementera hantering av hemligheter
   - Aktivera övervakning och larm

## 📊 Jämförelsematris

| Exempel | Tjänster | Databas | Autentisering | Övervakning | Komplexitet |
|---------|----------|----------|---------------|-------------|-------------|
| Node.js Express Todo | 2 | ✅ | Grundläggande | Grundläggande | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundläggande | Fullständig | ⭐ |
| Python Flask Container | 2 | ❌ | Grundläggande | Fullständig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Java Mikrotjänster | 5+ | ✅ | Fullständig | Fullständig | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Fullständig | Fullständig | ⭐⭐⭐ |
| AI-dokumentbearbetning | 2 | ❌ | Grundläggande | Fullständig | ⭐⭐ |
| ML-pipeline | 4+ | ✅ | Fullständig | Fullständig | ⭐⭐⭐⭐ |

## 🎓 Lärandebana

### Rekommenderad progression

1. **Börja med enkel webbapp**
   - Lär dig grundläggande AZD-koncept
   - Förstå distributionsarbetsflöde
   - Öva på miljöhantering

2. **Prova statisk webbplats**
   - Utforska olika hostingalternativ
   - Lär dig om CDN-integration
   - Förstå DNS-konfiguration

3. **Gå vidare till containerapp**
   - Lär dig grunderna i containerisering
   - Förstå skalningskoncept
   - Öva med Docker

4. **Lägg till databasintegration**
   - Lär dig databasprovisionering
   - Förstå anslutningssträngar
   - Öva på hantering av hemligheter

5. **Utforska serverlös**
   - Förstå händelsedriven arkitektur
   - Lär dig om triggers och bindningar
   - Öva med API:er

6. **Bygg mikrotjänster**
   - Lär dig tjänstekommunikation
   - Förstå distribuerade system
   - Öva på komplexa distributioner

## 🔍 Hitta rätt exempel

### Efter teknologisk stack
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Mikrotjänster
- **React**: React SPA + Functions
- **Containers**: Python Flask Container App, Java Mikrotjänster
- **Databaser**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI-dokumentbearbetning, ML-pipeline

### Efter arkitekturmönster
- **Monolitisk**: Node.js Express Todo, C# Web API + SQL
- **Statisk + Serverlös**: React SPA + Functions, Python Functions + SPA
- **Mikrotjänster**: Java Spring Boot Mikrotjänster
- **Containeriserad**: Python Flask Container App
- **AI-drivna**: Azure OpenAI Chat App, AI-dokumentbearbetning, ML-pipeline

### Efter komplexitetsnivå
- **Nybörjare**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Mellannivå**: C# Web API + SQL, Python Functions + SPA, Java Mikrotjänster, Azure OpenAI Chat App, AI-dokumentbearbetning
- **Avancerad**: ML-pipeline

## 📚 Ytterligare resurser

### Dokumentationslänkar
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-exempel
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App med C# och Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App med Python och MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App med Node.js och PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App med C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions med Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Bästa praxis
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Bidra med exempel

Har du ett användbart exempel att dela? Vi välkomnar bidrag!

### Riktlinjer för inskick
1. Följ den etablerade katalogstrukturen
2. Inkludera en omfattande README.md
3. Lägg till kommentarer i konfigurationsfiler
4. Testa noggrant innan du skickar in
5. Inkludera kostnadsuppskattningar och förutsättningar

### Exempelmallstruktur
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

**Tips**: Börja med det enklaste exemplet som matchar din teknologiska stack och arbeta dig gradvis upp till mer komplexa scenarier. Varje exempel bygger på koncept från föregående!

**Nästa steg**: 
- Välj ett exempel som matchar din kunskapsnivå
- Följ installationsinstruktionerna i exempelets README
- Experimentera med anpassningar
- Dela dina lärdomar med communityn

---

**Navigering**
- **Föregående lektion**: [Studieguide](../resources/study-guide.md)
- **Återgå till**: [Huvud-README](../README.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen notera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.