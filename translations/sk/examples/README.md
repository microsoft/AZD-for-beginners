<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T10:07:37+00:00",
  "source_file": "examples/README.md",
  "language_code": "sk"
}
-->
# Príklady - Praktické šablóny a konfigurácie AZD

**Učenie sa na príkladoch - Usporiadané podľa kapitol**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Mapovanie kapitol**: Príklady usporiadané podľa náročnosti učenia
- **🚀 Začnite jednoducho**: [Príklady z kapitoly 1](../../../examples)
- **🤖 Príklady AI**: [Riešenia AI z kapitol 2 a 5](../../../examples)

## Úvod

Tento adresár obsahuje praktické príklady, šablóny a scenáre z reálneho sveta, ktoré vám pomôžu naučiť sa používať Azure Developer CLI prostredníctvom praktického cvičenia. Každý príklad poskytuje kompletný funkčný kód, šablóny infraštruktúry a podrobné pokyny pre rôzne architektúry aplikácií a vzory nasadenia.

## Ciele učenia

Prácou na týchto príkladoch sa naučíte:
- Precvičiť si pracovné postupy Azure Developer CLI na realistických scenároch aplikácií
- Pochopiť rôzne architektúry aplikácií a ich implementácie pomocou azd
- Ovládnuť vzory Infrastructure as Code pre rôzne služby Azure
- Aplikovať stratégie správy konfigurácie a nasadenia špecifické pre prostredie
- Implementovať monitorovanie, bezpečnosť a škálovacie vzory v praktických kontextoch
- Získať skúsenosti s riešením problémov a ladením reálnych scenárov nasadenia

## Výsledky učenia

Po dokončení týchto príkladov budete schopní:
- Sebavedome nasadzovať rôzne typy aplikácií pomocou Azure Developer CLI
- Prispôsobiť poskytnuté šablóny vlastným požiadavkám aplikácie
- Navrhovať a implementovať vlastné vzory infraštruktúry pomocou Bicep
- Konfigurovať komplexné aplikácie s viacerými službami a správnymi závislosťami
- Aplikovať bezpečnostné, monitorovacie a výkonnostné osvedčené postupy v reálnych scenároch
- Riešiť problémy a optimalizovať nasadenia na základe praktických skúseností

## Štruktúra adresára

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

## Príklady na rýchly štart

### Pre začiatočníkov
1. **[Jednoduchá webová aplikácia - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Nasadenie webovej aplikácie Node.js Express s MongoDB
2. **[Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hosting statickej webovej stránky React pomocou Azure Static Web Apps
3. **[Kontajnerová aplikácia - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Nasadenie kontajnerizovanej aplikácie Python Flask

### Pre pokročilých používateľov
4. **[Databázová aplikácia - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webová aplikácia s C# API a databázou Azure SQL
5. **[Serverless funkcia - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions s HTTP triggermi a Cosmos DB
6. **[Mikroslužby - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Viacslužbová Java aplikácia s Container Apps a API gateway

### Šablóny Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentná chatovacia aplikácia s Azure OpenAI
2. **[AI spracovanie dokumentov](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analýza dokumentov pomocou služieb Azure AI
3. **[Pipeline strojového učenia](https://github.com/Azure-Samples/mlops-v2)** - Workflow MLOps s Azure Machine Learning

### Scenáre z reálneho sveta

#### **Riešenie pre maloobchod s viacerými agentmi** 🆕
**[Kompletný sprievodca implementáciou](./retail-scenario.md)**

Komplexné, produkčne pripravené riešenie zákazníckej podpory s viacerými agentmi, ktoré demonštruje nasadenie AI aplikácií na podnikovej úrovni pomocou AZD. Tento scenár poskytuje:

- **Kompletná architektúra**: Systém s viacerými agentmi so špecializovanými agentmi pre zákaznícku podporu a správu inventára
- **Produkčná infraštruktúra**: Nasadenia Azure OpenAI vo viacerých regiónoch, AI Search, Container Apps a komplexné monitorovanie
- **Pripravená ARM šablóna**: Nasadenie na jedno kliknutie s viacerými režimami konfigurácie (Minimal/Štandard/Premium)
- **Pokročilé funkcie**: Validácia bezpečnosti, rámec hodnotenia agentov, optimalizácia nákladov a návody na riešenie problémov
- **Reálny obchodný kontext**: Prípad použitia zákazníckej podpory pre maloobchodníkov s nahrávaním súborov, integráciou vyhľadávania a dynamickým škálovaním

**Technológie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Náročnosť**: ⭐⭐⭐⭐ (Pokročilé - pripravené na podnikové nasadenie)

**Ideálne pre**: AI vývojárov, architektov riešení a tímy budujúce produkčné systémy s viacerými agentmi

**Rýchly štart**: Nasadenie kompletného riešenia za menej ako 30 minút pomocou priloženej ARM šablóny s `./deploy.sh -g myResourceGroup`

## 📋 Pokyny na používanie

### Spustenie príkladov lokálne

1. **Klonovanie alebo kopírovanie príkladu**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializácia prostredia AZD**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurácia prostredia**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasadenie**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Prispôsobenie príkladov

Každý príklad obsahuje:
- **README.md** - Podrobné pokyny na nastavenie a prispôsobenie
- **azure.yaml** - Konfigurácia AZD s komentármi
- **infra/** - Šablóny Bicep s vysvetleniami parametrov
- **src/** - Ukážkový kód aplikácie
- **scripts/** - Pomocné skripty pre bežné úlohy

## 🎯 Ciele učenia

### Kategórie príkladov

#### **Základné nasadenia**
- Aplikácie s jednou službou
- Jednoduché vzory infraštruktúry
- Základná správa konfigurácie
- Nákladovo efektívne vývojové prostredia

#### **Pokročilé scenáre**
- Architektúry s viacerými službami
- Komplexné konfigurácie sietí
- Vzory integrácie databáz
- Implementácie bezpečnosti a súladu

#### **Vzory pripravené na produkciu**
- Konfigurácie vysokej dostupnosti
- Monitorovanie a pozorovateľnosť
- Integrácia CI/CD
- Nastavenia obnovy po havárii

## 📖 Popisy príkladov

### Jednoduchá webová aplikácia - Node.js Express
**Technológie**: Node.js, Express, MongoDB, Container Apps  
**Náročnosť**: Začiatočník  
**Koncepty**: Základné nasadenie, REST API, integrácia NoSQL databázy

### Statická webová stránka - React SPA
**Technológie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Náročnosť**: Začiatočník  
**Koncepty**: Statický hosting, serverless backend, moderný vývoj webu

### Kontajnerová aplikácia - Python Flask
**Technológie**: Python Flask, Docker, Container Apps, Container Registry  
**Náročnosť**: Začiatočník  
**Koncepty**: Kontajnerizácia, architektúra mikroslužieb, vývoj API

### Databázová aplikácia - C# s Azure SQL
**Technológie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Náročnosť**: Stredne pokročilý  
**Koncepty**: Entity Framework, pripojenia k databáze, vývoj webového API

### Serverless funkcia - Python Azure Functions
**Technológie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Náročnosť**: Stredne pokročilý  
**Koncepty**: Architektúra riadená udalosťami, serverless computing, full-stack vývoj

### Mikroslužby - Java Spring Boot
**Technológie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Náročnosť**: Stredne pokročilý  
**Koncepty**: Komunikácia mikroslužieb, distribuované systémy, podnikové vzory

### Príklady Azure AI Foundry

#### Azure OpenAI Chat App
**Technológie**: Azure OpenAI, Cognitive Search, App Service  
**Náročnosť**: Stredne pokročilý  
**Koncepty**: Architektúra RAG, vektorové vyhľadávanie, integrácia LLM

#### AI spracovanie dokumentov
**Technológie**: Azure AI Document Intelligence, Storage, Functions  
**Náročnosť**: Stredne pokročilý  
**Koncepty**: Analýza dokumentov, OCR, extrakcia dát

#### Pipeline strojového učenia
**Technológie**: Azure ML, MLOps, Container Registry  
**Náročnosť**: Pokročilý  
**Koncepty**: Tréning modelov, pipeline nasadenia, monitorovanie

## 🛠 Príklady konfigurácie

Adresár `configurations/` obsahuje opakovane použiteľné komponenty:

### Konfigurácie prostredia
- Nastavenia vývojového prostredia
- Konfigurácie staging prostredia
- Produkčne pripravené konfigurácie
- Nasadenia vo viacerých regiónoch

### Moduly Bicep
- Opakovane použiteľné komponenty infraštruktúry
- Bežné vzory zdrojov
- Šablóny s posilnenou bezpečnosťou
- Nákladovo optimalizované konfigurácie

### Pomocné skripty
- Automatizácia nastavenia prostredia
- Skripty na migráciu databázy
- Nástroje na validáciu nasadenia
- Nástroje na monitorovanie nákladov

## 🔧 Sprievodca prispôsobením

### Prispôsobenie príkladov pre váš prípad použitia

1. **Skontrolujte predpoklady**
   - Overte požiadavky na služby Azure
   - Skontrolujte limity predplatného
   - Pochopte nákladové dôsledky

2. **Upravte konfiguráciu**
   - Aktualizujte definície služieb v `azure.yaml`
   - Prispôsobte šablóny Bicep
   - Upravte premenné prostredia

3. **Dôkladne otestujte**
   - Najprv nasadzujte do vývojového prostredia
   - Overte funkčnosť
   - Otestujte škálovanie a výkon

4. **Bezpečnostná kontrola**
   - Skontrolujte prístupové kontroly
   - Implementujte správu tajomstiev
   - Aktivujte monitorovanie a upozornenia

## 📊 Porovnávacia tabuľka

| Príklad | Služby | Databáza | Autentifikácia | Monitorovanie | Náročnosť |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Základná | Základná | ⭐ |
| React SPA + Functions | 3 | ✅ | Základná | Plná | ⭐ |
| Python Flask Container | 2 | ❌ | Základná | Plná | ⭐ |
| C# Web API + SQL | 2 | ✅ | Plná | Plná | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Plná | Plná | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Plná | Plná | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Plná | Plná | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Základná | Plná | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Plná | Plná | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Podniková** | **Pokročilá** | **⭐⭐⭐⭐** |

## 🎓 Učebná cesta

### Odporúčaný postup

1. **Začnite s jednoduchou webovou aplikáciou**
   - Naučte sa základné koncepty AZD
   - Pochopte pracovný postup nasadenia
   - Precvičte si správu prostredia

2. **Vyskúšajte statickú webovú stránku**
   - Preskúmajte rôzne možnosti hostingu
   - Naučte sa o integrácii CDN
   - Pochopte konfiguráciu DNS

3. **Prejdite na kontajnerovú aplikáciu**
   - Naučte sa základy kontajnerizácie
   - Pochopte koncepty škálovania
   - Precvičte si prácu s Dockerom

4. **Pridajte integráciu databázy**
   - Naučte sa poskytovanie databáz
   - Pochopte pripojovacie reťazce
   - Precvičte si správu tajomstiev

5. **Preskúmajte serverless**
   - Pochopte architektúru riadenú udalosťami
   - Naučte sa o triggroch a väzbách
   - Precvičte si prácu s API

6. **Vytvorte mikroslužby**
   - Naučte sa komunikáciu medzi službami
   - Pochopte distribuované systémy
   - Precvičte si komplexné nasadenia

## 🔍 Výber správneho príkladu

### Podľa technologického stacku
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontajnery**: Python Flask Container App, Java Microservices
- **Databázy**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Systémy s viacerými agentmi**: **Retail Multi-Agent Solution**
- **Podniková produkcia**: **Retail Multi-Agent Solution**

### Podľa architektonického vzoru
- **Monolitické**: Node.js Express Todo, C# Web API + SQL
- **Statické + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroslužby**: Java Spring Boot Microservices
- **Kontajnerizované**: Python Flask Container App
- **AI-poháňané**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architektúra s viacerými agentmi**: **Retail Multi-Agent Solution**
- **Podniková viacslužbová architektúra**: **Retail Multi-Agent Solution**

### Podľa úrovne náročnosti
- **Začiatočník**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Stredne pokročilý**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Pokročilý**: ML Pipeline
- **Pripravené na podnikové nasadenie**: **Retail Multi-Agent Solution** (Kompletný systém s viacerými agentmi s nasadením pomocou ARM šablóny)

## 📚 Ďalšie zdroje

### Odkazy na dokumentáciu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentácia Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Príklady z komunity
- [Šablóny AZD od Azure Samples](https://github.com/Azure-Samples/azd-
- [Todo App s C# a Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App s Python a MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepšie postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispievanie príkladov

Máte užitočný príklad, ktorý chcete zdieľať? Radi privítame vaše príspevky!

### Pokyny na odoslanie
1. Dodržujte stanovenú štruktúru adresárov
2. Zahrňte podrobný README.md
3. Pridajte komentáre do konfiguračných súborov
4. Dôkladne otestujte pred odoslaním
5. Zahrňte odhady nákladov a predpoklady

### Štruktúra šablóny príkladu
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

**Tip na záver**: Začnite s najjednoduchším príkladom, ktorý zodpovedá vašej technologickej zostave, a postupne prejdite k zložitejším scenárom. Každý príklad stavia na konceptoch z predchádzajúcich!

**Ďalšie kroky**: 
- Vyberte si príklad, ktorý zodpovedá vašej úrovni zručností
- Postupujte podľa pokynov na nastavenie v README daného príkladu
- Experimentujte s prispôsobeniami
- Podeľte sa o svoje poznatky s komunitou

---

**Navigácia**
- **Predchádzajúca lekcia**: [Študijný sprievodca](../resources/study-guide.md)
- **Návrat na**: [Hlavný README](../README.md)

---

**Upozornenie**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.