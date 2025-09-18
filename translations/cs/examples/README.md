<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T09:46:59+00:00",
  "source_file": "examples/README.md",
  "language_code": "cs"
}
-->
# Příklady - Praktické šablony a konfigurace AZD

**Učení na příkladech - organizováno podle kapitol**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Mapování kapitol**: Příklady organizované podle složitosti učení
- **🚀 Začněte jednoduše**: [Příklady z kapitoly 1](../../../examples)
- **🤖 AI příklady**: [Příklady z kapitol 2 a 5 - AI řešení](../../../examples)

## Úvod

Tento adresář obsahuje praktické příklady, šablony a scénáře z reálného světa, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Každý příklad poskytuje kompletní funkční kód, šablony infrastruktury a podrobné pokyny pro různé architektury aplikací a vzory nasazení.

## Cíle učení

Prací na těchto příkladech se naučíte:
- Procvičit si pracovní postupy Azure Developer CLI na realistických scénářích aplikací
- Porozumět různým architekturám aplikací a jejich implementacím pomocí AZD
- Ovládnout vzory Infrastructure as Code pro různé služby Azure
- Aplikovat strategie správy konfigurace a nasazení specifické pro prostředí
- Implementovat monitorování, zabezpečení a škálovací vzory v praktických kontextech
- Získat zkušenosti s řešením problémů a laděním reálných scénářů nasazení

## Výsledky učení

Po dokončení těchto příkladů budete schopni:
- S jistotou nasazovat různé typy aplikací pomocí Azure Developer CLI
- Přizpůsobit poskytnuté šablony vlastním požadavkům na aplikace
- Navrhovat a implementovat vlastní vzory infrastruktury pomocí Bicep
- Konfigurovat komplexní aplikace s více službami a správnými závislostmi
- Aplikovat osvědčené postupy v oblasti zabezpečení, monitorování a výkonu v reálných scénářích
- Řešit problémy a optimalizovat nasazení na základě praktických zkušeností

## Struktura adresáře

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

## Příklady rychlého startu

### Pro začátečníky
1. **[Jednoduchá webová aplikace - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Nasazení webové aplikace Node.js Express s MongoDB
2. **[Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hostování statické webové stránky React pomocí Azure Static Web Apps
3. **[Kontejnerová aplikace - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Nasazení kontejnerizované aplikace Python Flask

### Pro středně pokročilé uživatele
4. **[Databázová aplikace - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webová aplikace s C# API a databází Azure SQL
5. **[Serverless funkce - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions s HTTP triggery a Cosmos DB
6. **[Mikroslužby - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Víceslužbová aplikace Java s Container Apps a API gateway

### Šablony Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentní chatovací aplikace s Azure OpenAI
2. **[AI zpracování dokumentů](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analýza dokumentů pomocí služeb Azure AI
3. **[Pipeline strojového učení](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps s Azure Machine Learning

### Scénáře z reálného světa

#### **Řešení pro maloobchodní multi-agentní systém** 🆕
**[Kompletní průvodce implementací](./retail-scenario.md)**

Komplexní, produkčně připravené multi-agentní řešení zákaznické podpory, které demonstruje nasazení AI aplikací na podnikové úrovni pomocí AZD. Tento scénář poskytuje:

- **Kompletní architekturu**: Multi-agentní systém se specializovanými agenty pro zákaznický servis a správu inventáře
- **Produkční infrastrukturu**: Multi-regionální nasazení Azure OpenAI, AI Search, Container Apps a komplexní monitorování
- **Připravenou ARM šablonu**: Jedno kliknutí pro nasazení s více režimy konfigurace (Minimal/Standard/Premium)
- **Pokročilé funkce**: Validace zabezpečení, rámec pro hodnocení agentů, optimalizace nákladů a průvodce řešením problémů
- **Reálný obchodní kontext**: Případ použití zákaznické podpory maloobchodníka s nahráváním souborů, integrací vyhledávání a dynamickým škálováním

**Technologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složitost**: ⭐⭐⭐⭐ (Pokročilé - připravené pro produkci)

**Ideální pro**: AI vývojáře, architekty řešení a týmy budující produkční multi-agentní systémy

**Rychlý start**: Nasazení kompletního řešení za méně než 30 minut pomocí přiložené ARM šablony s `./deploy.sh -g myResourceGroup`

## 📋 Pokyny k použití

### Spuštění příkladů lokálně

1. **Naklonujte nebo zkopírujte příklad**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializujte prostředí AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurujte prostředí**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasazení**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Přizpůsobení příkladů

Každý příklad obsahuje:
- **README.md** - Podrobné pokyny k nastavení a přizpůsobení
- **azure.yaml** - Konfigurace AZD s komentáři
- **infra/** - Šablony Bicep s vysvětlením parametrů
- **src/** - Ukázkový kód aplikace
- **scripts/** - Pomocné skripty pro běžné úkoly

## 🎯 Cíle učení

### Kategorie příkladů

#### **Základní nasazení**
- Aplikace s jednou službou
- Jednoduché vzory infrastruktury
- Základní správa konfigurace
- Nákladově efektivní vývojová nastavení

#### **Pokročilé scénáře**
- Architektury s více službami
- Komplexní konfigurace sítí
- Vzory integrace databází
- Implementace zabezpečení a souladu

#### **Vzory připravené pro produkci**
- Konfigurace vysoké dostupnosti
- Monitorování a pozorovatelnost
- Integrace CI/CD
- Nastavení obnovy po havárii

## 📖 Popisy příkladů

### Jednoduchá webová aplikace - Node.js Express
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Složitost**: Začátečník  
**Koncepty**: Základní nasazení, REST API, integrace NoSQL databáze

### Statická webová stránka - React SPA
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složitost**: Začátečník  
**Koncepty**: Statické hostování, serverless backend, moderní vývoj webu

### Kontejnerová aplikace - Python Flask
**Technologie**: Python Flask, Docker, Container Apps, Container Registry  
**Složitost**: Začátečník  
**Koncepty**: Kontejnerizace, architektura mikroslužeb, vývoj API

### Databázová aplikace - C# s Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složitost**: Středně pokročilý  
**Koncepty**: Entity Framework, připojení k databázi, vývoj webového API

### Serverless funkce - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složitost**: Středně pokročilý  
**Koncepty**: Architektura řízená událostmi, serverless computing, full-stack vývoj

### Mikroslužby - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složitost**: Středně pokročilý  
**Koncepty**: Komunikace mikroslužeb, distribuované systémy, podnikové vzory

### Příklady Azure AI Foundry

#### Azure OpenAI Chat App
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Složitost**: Středně pokročilý  
**Koncepty**: Architektura RAG, vektorové vyhledávání, integrace LLM

#### AI zpracování dokumentů
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Složitost**: Středně pokročilý  
**Koncepty**: Analýza dokumentů, OCR, extrakce dat

#### Pipeline strojového učení
**Technologie**: Azure ML, MLOps, Container Registry  
**Složitost**: Pokročilé  
**Koncepty**: Trénování modelů, nasazovací pipeline, monitorování

## 🛠 Konfigurační příklady

Adresář `configurations/` obsahuje znovupoužitelné komponenty:

### Konfigurace prostředí
- Nastavení vývojového prostředí
- Konfigurace staging prostředí
- Konfigurace připravené pro produkci
- Nastavení nasazení do více regionů

### Moduly Bicep
- Znovupoužitelné komponenty infrastruktury
- Běžné vzory zdrojů
- Šablony s posíleným zabezpečením
- Nákladově optimalizované konfigurace

### Pomocné skripty
- Automatizace nastavení prostředí
- Skripty pro migraci databáze
- Nástroje pro validaci nasazení
- Nástroje pro monitorování nákladů

## 🔧 Průvodce přizpůsobením

### Přizpůsobení příkladů pro vaše použití

1. **Zkontrolujte předpoklady**
   - Ověřte požadavky na služby Azure
   - Zkontrolujte limity předplatného
   - Pochopte nákladové dopady

2. **Upravte konfiguraci**
   - Aktualizujte definice služeb v `azure.yaml`
   - Přizpůsobte šablony Bicep
   - Upravte proměnné prostředí

3. **Důkladně otestujte**
   - Nejprve nasazení do vývojového prostředí
   - Ověřte funkčnost
   - Otestujte škálování a výkon

4. **Zabezpečení**
   - Zkontrolujte přístupová oprávnění
   - Implementujte správu tajemství
   - Aktivujte monitorování a upozornění

## 📊 Porovnávací tabulka

| Příklad | Služby | Databáze | Autentizace | Monitorování | Složitost |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Základní | Základní | ⭐ |
| React SPA + Functions | 3 | ✅ | Základní | Plné | ⭐ |
| Python Flask Container | 2 | ❌ | Základní | Plné | ⭐ |
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Plné | Plné | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Základní | Plné | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Podnikové** | **Pokročilé** | **⭐⭐⭐⭐** |

## 🎓 Učební cesta

### Doporučený postup

1. **Začněte s jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte pracovní postup nasazení
   - Procvičte si správu prostředí

2. **Vyzkoušejte statickou webovou stránku**
   - Prozkoumejte různé možnosti hostování
   - Naučte se integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na kontejnerovou aplikaci**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičte si práci s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se zřizování databáze
   - Pochopte připojovací řetězce
   - Procvičte si správu tajemství

5. **Prozkoumejte serverless**
   - Pochopte architekturu řízenou událostmi
   - Naučte se o triggerech a vazbách
   - Procvičte si práci s API

6. **Vytvořte mikroslužby**
   - Naučte se komunikaci mezi službami
   - Pochopte distribuované systémy
   - Procvičte si komplexní nasazení

## 🔍 Hledání správného příkladu

### Podle technologického stacku
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejnery**: Python Flask Container App, Java Microservices
- **Databáze**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-agentní systémy**: **Retail Multi-Agent Solution**
- **Produkce na podnikové úrovni**: **Retail Multi-Agent Solution**

### Podle architektonického vzoru
- **Monolitické**: Node.js Express Todo, C# Web API + SQL
- **Statické + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroslužby**: Java Spring Boot Microservices
- **Kontejnerizované**: Python Flask Container App
- **AI-poháněné**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-agentní architektura**: **Retail Multi-Agent Solution**
- **Podnikové multi-služby**: **Retail Multi-Agent Solution**

### Podle úrovně složitosti
- **Začátečník**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Středně pokročilý**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Pokročilé**: ML Pipeline
- **Produkčně připravené**: **Retail Multi-Agent Solution** (Kompletní multi-agentní systém s nasazením pomocí ARM šablony)

## 📚 Další zdroje

### Odkazy na dokumentaci
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Šablony Azure AI Foundry AZD](https://github.com/Azure/ai-foundry-templates)
- [Dokumentace Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Centrum architektury Azure](https://learn.microsoft.com/en-us/azure/architecture/)

### Příklady z komunity
- [Šablony AZD od Azure Samples](https://github.com/Azure-Samples/azd-templates)
- [Šablony Azure AI Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App s C# a Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App s Pythonem a MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [React Web App s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions s Javou](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Nejlepší postupy  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Příspěvky příkladů  

Máte užitečný příklad, který chcete sdílet? Vaše příspěvky jsou vítány!  

### Pokyny pro odeslání  
1. Dodržujte stanovenou strukturu adresářů  
2. Zahrňte podrobný README.md  
3. Přidejte komentáře do konfiguračních souborů  
4. Důkladně otestujte před odesláním  
5. Zahrňte odhady nákladů a požadavky  

### Struktura šablony příkladu  
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

**Tip**: Začněte s nejjednodušším příkladem, který odpovídá vaší technologické sadě, a postupně přecházejte k složitějším scénářům. Každý příklad staví na konceptech z předchozích!  

**Další kroky**:  
- Vyberte příklad, který odpovídá vaší úrovni dovedností  
- Postupujte podle pokynů k nastavení v README daného příkladu  
- Experimentujte s přizpůsobením  
- Sdílejte své poznatky s komunitou  

---  

**Navigace**  
- **Předchozí lekce**: [Studijní průvodce](../resources/study-guide.md)  
- **Zpět na**: [Hlavní README](../README.md)  

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace doporučujeme profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.