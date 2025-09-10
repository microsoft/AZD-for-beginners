<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:23:21+00:00",
  "source_file": "examples/README.md",
  "language_code": "cs"
}
-->
# Příklady - Praktické šablony a konfigurace AZD

## Úvod

Tento adresář obsahuje praktické příklady, šablony a scénáře z reálného světa, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Každý příklad poskytuje kompletní funkční kód, šablony infrastruktury a podrobné instrukce pro různé architektury aplikací a vzory nasazení.

## Cíle učení

Prací na těchto příkladech se naučíte:
- Procvičit pracovní postupy Azure Developer CLI na realistických scénářích aplikací
- Porozumět různým architekturám aplikací a jejich implementacím v azd
- Ovládnout vzory Infrastructure as Code pro různé služby Azure
- Aplikovat strategie správy konfigurace a nasazení specifické pro prostředí
- Implementovat monitorovací, bezpečnostní a škálovací vzory v praktických kontextech
- Získat zkušenosti s řešením problémů a laděním reálných scénářů nasazení

## Výsledky učení

Po dokončení těchto příkladů budete schopni:
- S jistotou nasazovat různé typy aplikací pomocí Azure Developer CLI
- Přizpůsobit poskytnuté šablony vlastním požadavkům na aplikace
- Navrhovat a implementovat vlastní vzory infrastruktury pomocí Bicep
- Konfigurovat komplexní aplikace s více službami a správnými závislostmi
- Aplikovat bezpečnostní, monitorovací a výkonnostní osvědčené postupy v reálných scénářích
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

## Příklady pro rychlý start

### Pro začátečníky
1. **[Jednoduchá webová aplikace - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Nasazení webové aplikace Node.js Express s MongoDB
2. **[Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hostování statické webové stránky React pomocí Azure Static Web Apps
3. **[Aplikace v kontejneru - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Nasazení kontejnerizované aplikace Python Flask

### Pro pokročilé uživatele
4. **[Databázová aplikace - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webová aplikace s C# API a databází Azure SQL
5. **[Serverless funkce - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions s HTTP triggery a Cosmos DB
6. **[Mikroslužby - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Víceslužbová aplikace Java s Container Apps a API gateway

### Šablony Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentní chatovací aplikace s Azure OpenAI
2. **[Zpracování dokumentů AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analýza dokumentů pomocí služeb Azure AI
3. **[Pipeline strojového učení](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps s Azure Machine Learning

## 📋 Pokyny k použití

### Spuštění příkladů lokálně

1. **Klonování nebo kopírování příkladu**  
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializace prostředí AZD**  
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurace prostředí**  
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
- Implementace bezpečnosti a souladu

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

### Aplikace v kontejneru - Python Flask
**Technologie**: Python Flask, Docker, Container Apps, Container Registry  
**Složitost**: Začátečník  
**Koncepty**: Kontejnerizace, architektura mikroslužeb, vývoj API

### Databázová aplikace - C# s Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složitost**: Pokročilý  
**Koncepty**: Entity Framework, připojení k databázi, vývoj webového API

### Serverless funkce - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složitost**: Pokročilý  
**Koncepty**: Architektura řízená událostmi, serverless computing, vývoj full-stack aplikací

### Mikroslužby - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složitost**: Pokročilý  
**Koncepty**: Komunikace mikroslužeb, distribuované systémy, podnikové vzory

### Příklady Azure AI Foundry

#### Azure OpenAI Chat App
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Složitost**: Pokročilý  
**Koncepty**: Architektura RAG, vektorové vyhledávání, integrace LLM

#### Zpracování dokumentů AI
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Složitost**: Pokročilý  
**Koncepty**: Analýza dokumentů, OCR, extrakce dat

#### Pipeline strojového učení
**Technologie**: Azure ML, MLOps, Container Registry  
**Složitost**: Pokročilý  
**Koncepty**: Trénování modelů, nasazovací pipeline, monitorování

## 🛠 Konfigurační příklady

Adresář `configurations/` obsahuje znovupoužitelné komponenty:

### Konfigurace prostředí
- Nastavení vývojového prostředí
- Konfigurace stagingového prostředí
- Konfigurace připravené pro produkci
- Nastavení nasazení do více regionů

### Moduly Bicep
- Znovupoužitelné komponenty infrastruktury
- Běžné vzory zdrojů
- Šablony s posílenou bezpečností
- Nákladově optimalizované konfigurace

### Pomocné skripty
- Automatizace nastavení prostředí
- Skripty pro migraci databáze
- Nástroje pro validaci nasazení
- Pomůcky pro monitorování nákladů

## 🔧 Průvodce přizpůsobením

### Přizpůsobení příkladů pro vaše potřeby

1. **Zkontrolujte předpoklady**
   - Ověřte požadavky na služby Azure
   - Zkontrolujte limity předplatného
   - Pochopte nákladové dopady

2. **Upravte konfiguraci**
   - Aktualizujte definice služeb v `azure.yaml`
   - Přizpůsobte šablony Bicep
   - Upravte proměnné prostředí

3. **Důkladně otestujte**
   - Nejprve nasazujte do vývojového prostředí
   - Ověřte funkčnost
   - Testujte škálování a výkon

4. **Bezpečnostní kontrola**
   - Zkontrolujte přístupová oprávnění
   - Implementujte správu tajemství
   - Aktivujte monitorování a upozornění

## 📊 Porovnávací tabulka

| Příklad | Služby | Databáze | Autentizace | Monitorování | Složitost |
|---------|--------|----------|-------------|--------------|-----------|
| Node.js Express Todo | 2 | ✅ | Základní | Základní | ⭐ |
| React SPA + Functions | 3 | ✅ | Základní | Plné | ⭐ |
| Python Flask Container | 2 | ❌ | Základní | Plné | ⭐ |
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Plné | Plné | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Základní | Plné | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |

## 🎓 Učební cesta

### Doporučený postup

1. **Začněte s jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte pracovní postup nasazení
   - Procvičte správu prostředí

2. **Vyzkoušejte statickou webovou stránku**
   - Prozkoumejte různé možnosti hostování
   - Naučte se integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na aplikaci v kontejneru**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičte práci s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se zřizování databáze
   - Pochopte připojovací řetězce
   - Procvičte správu tajemství

5. **Prozkoumejte serverless**
   - Pochopte architekturu řízenou událostmi
   - Naučte se o triggerech a vazbách
   - Procvičte práci s API

6. **Vytvořte mikroslužby**
   - Naučte se komunikaci mezi službami
   - Pochopte distribuované systémy
   - Procvičte komplexní nasazení

## 🔍 Výběr správného příkladu

### Podle technologického stacku
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejnery**: Python Flask Container App, Java Microservices
- **Databáze**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Podle architektonického vzoru
- **Monolitické**: Node.js Express Todo, C# Web API + SQL
- **Statické + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroslužby**: Java Spring Boot Microservices
- **Kontejnerizované**: Python Flask Container App
- **AI-poháněné**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Podle úrovně složitosti
- **Začátečník**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Pokročilý**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Pokročilý**: ML Pipeline

## 📚 Další zdroje

### Odkazy na dokumentaci
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentace Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Příklady z komunity
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo App s C# a Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App s Pythonem a MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Javou](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Osvědčené postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Přispívání příkladů

Máte užitečný příklad, který chcete sdílet? Uvítáme vaše příspěvky!

### Pokyny k odeslání
1. Dodržujte zavedenou strukturu adresáře
2. Zahrňte komplexní README.md
3. Přidejte komentáře ke konfiguračním souborům
4. Důkladně otestujte před odesláním
5. Zahrňte odhady nákladů a předpoklady

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

**Tip**: Začněte s nejjednodušším příkladem, který odpovídá vašemu technologickému stacku, a postupně se propracovávejte k složitějším scénářům. Každý příklad staví na konceptech z předchozích!

**Další kroky**: 
- Vyberte příklad, který odpovídá vaší úrovni dovedností
- Postupujte podle pokynů k nastavení v README příkladu
- Experimentujte s přizpůsobením
- Sdílejte své poznatky s komunitou

---

**Navigace**
- **Předchozí lekce**: [Studijní průvodce](../resources/study-guide.md)
- **Návrat na**: [Hlavní README](../README.md)

---

**Prohlášení**:  
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). Ačkoli se snažíme o přesnost, mějte na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.