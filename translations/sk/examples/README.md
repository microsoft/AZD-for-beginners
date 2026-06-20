# Príklady - Praktické AZD šablóny a konfigurácie

**Učenie podľa príkladov - usporiadané podľa kapitol**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Mapovanie kapitol**: Príklady usporiadané podľa zložitosti učenia
- **🚀 Lokálny príklad**: [Riešenie Retail Multi-Agent](retail-scenario.md)
- **🤖 Externé AI príklady**: Odkazy na repozitáre Azure Samples

> **📍 DÔLEŽITÉ: Lokálne vs externé príklady**  
> Toto úložisko obsahuje **4 kompletné lokálne príklady** s úplnými implementáciami:  
> - **Microsoft Foundry Models Chat** (nasadenie gpt-4.1 s chat rozhraním)  
> - **Container Apps** (Jednoduché Flask API + mikroslužby)  
> - **Databázová aplikácia** (Web + SQL databáza)  
> - **Retail Multi-Agent** (Podnikové AI riešenie)  
>  
> Ďalšie príklady sú **externé odkazy** na repozitáre Azure-Samples, ktoré si môžete sklonovať.

## Úvod

Tento adresár poskytuje praktické príklady a odkazy, ktoré vám pomôžu naučiť sa Azure Developer CLI cez praktické cvičenia. Scenár Retail Multi-Agent je kompletná, produkčne pripravená implementácia zahrnutá v tomto úložisku. Ďalšie príklady odkazujú na oficiálne Azure Samples, ktoré demonštrujú rôzne AZD vzory.

### Legenda hodnotenia zložitosti

- ⭐ **Začiatočník** - Základné koncepty, jedna služba, 15-30 minút
- ⭐⭐ **Stredne pokročilý** - Viac služieb, integrácia databázy, 30-60 minút
- ⭐⭐⭐ **Pokročilý** - Zložitá architektúra, AI integrácia, 1-2 hodiny
- ⭐⭐⭐⭐ **Expert** - Produkčné vzory, podniková úroveň, 2+ hodín

## 🎯 Čo sa vlastne nachádza v tomto úložisku

### ✅ Lokálna implementácia (Pripravené na použitie)

#### [Aplikácia Microsoft Foundry Models Chat](azure-openai-chat/README.md) 🆕
**Kompletné nasadenie gpt-4.1 s chat rozhraním zahrnuté v tomto repozitári**

- **Umiestnenie:** `examples/azure-openai-chat/`
- **Zložitosť:** ⭐⭐ (Stredne pokročilý)
- **Čo je zahrnuté:**
  - Kompletné nasadenie Microsoft Foundry Models (gpt-4.1)
  - Python príkazové rozhranie pre chat
  - Integrácia s Key Vault pre bezpečné API kľúče
  - Bicep šablóny infraštruktúry
  - Sledovanie využitia tokenov a nákladov
  - Obmedzovanie rýchlosti a spracovanie chýb

**Rýchly štart:**
```bash
# Prejdite do priečinka example
cd examples/azure-openai-chat

# Nasadiť všetko
azd up

# Nainštalujte závislosti a začnite chatovať
pip install -r src/requirements.txt
python src/chat.py
```

**Technológie:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Príklady Container App](container-app/README.md) 🆕
**Komplexné príklady nasadenia kontajnerov zahrnuté v tomto repozitári**

- **Umiestnenie:** `examples/container-app/`
- **Zložitosť:** ⭐-⭐⭐⭐⭐ (Od začiatočníka po pokročilého)
- **Čo je zahrnuté:**
  - [Hlavný sprievodca](container-app/README.md) - Kompletný prehľad nasadení kontajnerov
  - [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) - Základný príklad REST API
  - [Architektúra mikroslužieb](../../../examples/container-app/microservices) - Produkčne pripravené nasadenie viacerých služieb
  - Rýchly štart, Produkčné a Pokročilé vzory
  - Monitorovanie, zabezpečenie a optimalizácia nákladov

**Rýchly štart:**
```bash
# Zobraziť hlavnú príručku
cd examples/container-app

# Nasadiť jednoduché API vo Flasku
cd simple-flask-api
azd up

# Nasadiť príklad mikroslužieb
cd ../microservices
azd up
```

**Technológie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Riešenie Retail Multi-Agent](retail-scenario.md) 🆕
**Kompletná produkčne pripravená implementácia zahrnutá v tomto repozitári**

- **Umiestnenie:** `examples/retail-multiagent-arm-template/`
- **Zložitosť:** ⭐⭐⭐⭐ (Pokročilý)
- **Čo je zahrnuté:**
  - Kompletna ARM šablóna nasadenia
  - Architektúra multi-agentov (Zákazník + Inventár)
  - Integrácia Microsoft Foundry Models
  - AI vyhľadávanie s RAG
  - Komplexné monitorovanie
  - Skript na nasadenie jedným kliknutím

**Rýchly štart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technológie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externé Azure Samples (naklonovať na použitie)

Nasledujúce príklady sú udržiavané v oficiálnych repozitároch Azure-Samples. Sklonujte ich, aby ste preskúmali rôzne AZD vzory:

### Jednoduché aplikácie (Kapitoly 1-2)

| Šablóna | Repozitár | Zložitosť | Služby |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokálne: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokálne: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Ako používať:**
```bash
# Klonujte ľubovoľný príklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadiť
azd up
```

### Príklady AI aplikácií (Kapitoly 2, 5, 8)

| Šablóna | Repozitár | Zložitosť | Zameranie |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokálne: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 nasadenie |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základný AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzor |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databázy a pokročilé vzory (Kapitoly 3-8)

| Šablóna | Repozitár | Zložitosť | Zameranie |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrácia databázy |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-service |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciele učenia

Pracovaním na týchto príkladoch budete:
- Precvičovať pracovné postupy Azure Developer CLI s realistickými aplikačnými scenármi
- Pochopiť rôzne aplikačné architektúry a ich azd implementácie
- Ovládnuť vzory Infrastructure as Code pre rôzne Azure služby
- Použiť správu konfigurácií a deployment stratégie špecifické pre prostredie
- Implementovať monitorovanie, zabezpečenie a škálovacie vzory v praktických kontextoch
- Získať skúsenosti s riešením problémov a ladením reálnych nasadení

## Výsledky učenia

Po dokončení týchto príkladov budete vedieť:
- Nasadzovať rôzne typy aplikácií pomocou Azure Developer CLI s istotou
- Prispôsobiť poskytnuté šablóny vašim vlastným požiadavkám aplikácie
- Navrhovať a implementovať vlastné infraštruktúrne vzory pomocou Bicep
- Konfigurovať zložité viacservisné aplikácie so správnymi závislosťami
- Použiť bezpečnostné, monitorovacie a výkonnostné osvedčené postupy v reálnych scenároch
- Riešiť a optimalizovať nasadenia na základe praktických skúseností

## Štruktúra adresárov

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

## Rýchle štartovacie príklady

> **💡 Nový v AZD?** Začnite s príkladom č. 1 (Flask API) - trvá približne 20 minút a učí základné koncepty.

### Pre začiatočníkov
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokálne) ⭐  
   Nasadiť jednoduché REST API s scale-to-zero  
   **Čas:** 20-25 minút | **Náklady:** $0-5/mesiac  
   **Čo sa naučíte:** Základný azd pracovný postup, kontajnerizácia, health probes  
   **Očakávaný výsledok:** Funkčný endpoint API vracajúci "Hello, World!" s monitorovaním

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadiť Node.js Express webovú aplikáciu s MongoDB  
   **Čas:** 25-35 minút | **Náklady:** $10-30/mesiac  
   **Čo sa naučíte:** Integrácia databázy, premenné prostredia, connection strings  
   **Očakávaný výsledok:** Aplikácia Todo so CRUD funkciami

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostovať React statickú stránku s Azure Static Web Apps  
   **Čas:** 20-30 minút | **Náklady:** $0-10/mesiac  
   **Čo sa naučíte:** Statické hostovanie, serverless funkcie, nasadenie cez CDN  
   **Očakávaný výsledok:** React UI s API backendom, automatické SSL, globálne CDN

### Pre stredne pokročilých používateľov
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokálne) ⭐⭐  
   Nasadiť gpt-4.1 s chat rozhraním a zabezpečeným manažmentom API kľúčov  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesiac  
   **Čo sa naučíte:** Nasadenie Microsoft Foundry Models, integrácia Key Vault, sledovanie tokenov  
   **Očakávaný výsledok:** Funkčná chat aplikácia s gpt-4.1 a monitorovaním nákladov

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokálne) ⭐⭐⭐⭐  
   Produkčne pripravená architektúra viacerých služieb  
   **Čas:** 45-60 minút | **Náklady:** $50-150/mesiac  
   **Čo sa naučíte:** Komunikácia služieb, fronty správ, distribuované trasovanie  
   **Očakávaný výsledok:** Systém 2 služieb (API Gateway + Product Service) s monitorovaním

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikácia s C# API a Azure SQL databázou  
   **Čas:** 30-45 minút | **Náklady:** $20-80/mesiac  
   **Čo sa naučíte:** Entity Framework, migrácie databázy, zabezpečenie pripojení  
   **Očakávaný výsledok:** C# API s Azure SQL backendom a automatickým nasadením schémy

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggerami a Cosmos DB  
   **Čas:** 30-40 minút | **Náklady:** $10-40/mesiac  
   **Čo sa naučíte:** Event-driven architektúra, serverless škálovanie, NoSQL integrácia  
   **Očakávaný výsledok:** Funkčná aplikácia reagujúca na HTTP požiadavky s uložením v Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java aplikácia s Container Apps a API gateway  
   **Čas:** 60-90 minút | **Náklady:** $80-200/mesiac  
   **Čo sa naučíte:** Nasadenie Spring Boot, service mesh, load balancing  
   **Očakávaný výsledok:** Viacservisný Java systém s service discovery a routingom

### Šablóny Microsoft Foundry

1. **[Microsoft Foundry Models Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletné nasadenie gpt-4.1 s chat rozhraním  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesiac  
   **Očakávaný výsledok:** Funkčná chat aplikácia so sledovaním tokenov a nákladov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentná chat aplikácia s RAG architektúrou  
   **Čas:** 60-90 minút | **Náklady:** $100-300/mesiac  
   **Očakávaný výsledok:** RAG-poháňané chat rozhranie s vyhľadávaním dokumentov a citáciami

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentov pomocou Azure AI služieb  
   **Čas:** 40-60 minút | **Náklady:** $20-80/mesiac  
   **Očakávaný výsledok:** API extrahujúce text, tabuľky a entity z nahratých dokumentov

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps pracovný tok s Azure Machine Learning  
   **Čas:** 2-3 hodiny | **Náklady:** $150-500/mesiac  
   **Očakávaný výsledok:** Automatizovaný ML pipeline s trénovaním, nasadením a monitorovaním

### Scenáre z reálneho sveta

#### **Riešenie Retail Multi-Agent** 🆕
**[Kompletný sprievodca implementáciou](./retail-scenario.md)**

Komplexné, produkčne pripravené multi-agentné riešenie zákazníckej podpory, ktoré demonštruje podnikové nasadenie AI aplikácií s AZD. Tento scenár poskytuje:

- **Kompletná architektúra**: Multi-agentný systém so špecializovanými agentmi pre zákaznícku podporu a správu inventára
- **Production Infrastructure**: Viacreionálne nasadenia Microsoft Foundry Models, AI Search, Container Apps a komplexné monitorovanie
- **Ready-to-Deploy ARM Template**: Jednoklikové nasadenie s viacerými režimami konfigurácie (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming overenie bezpečnosti, rámec hodnotenia agentov, optimalizácia nákladov a návody na riešenie problémov
- **Real Business Context**: Prípad použitia zákazníckej podpory pre maloobchodníka s nahrávaním súborov, integráciou vyhľadávania a dynamickým škálovaním

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Pokročilé - pripravené pre produkciu v podniku)

**Perfect for**: AI vývojárov, riešenia architektov a tímy budujúce produkčné multi-agentné systémy

**Quick Start**: Nasadte kompletné riešenie za menej než 30 minút pomocou priloženej ARM šablóny s `./deploy.sh -g myResourceGroup`

## 📋 Pokyny na použitie

### Predpoklady

Pred spustením akéhokoľvek príkladu:
- ✅ Azure predplatné s rolou Owner alebo Contributor
- ✅ Azure Developer CLI nainštalovaný ([Návod na inštaláciu](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop spustený (pre príklady s kontajnermi)
- ✅ Príslušné kvóty Azure (skontrolujte požiadavky špecifické pre príklad)

> **💰 Upozornenie na náklady:** Všetky príklady vytvárajú reálne zdroje v Azure, ktoré generujú poplatky. Pozrite si jednotlivé README súbory pre odhad nákladov. Nezabudnite spustiť `azd down` po dokončení, aby ste sa vyhli priebežným poplatkom.

### Spustenie príkladov lokálne

1. **Klónujte alebo skopírujte príklad**
   ```bash
   # Prejdite na požadovaný príklad
   cd examples/simple-web-app
   ```

2. **Inicializujte prostredie AZD**
   ```bash
   # Inicializovať pomocou existujúcej šablóny
   azd init
   
   # Alebo vytvoriť nové prostredie
   azd env new my-environment
   ```

3. **Skonfigurujte prostredie**
   ```bash
   # Nastavte požadované premenné
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasadenie**
   ```bash
   # Nasadiť infraštruktúru a aplikáciu
   azd up
   ```

5. **Overenie nasadenia**
   ```bash
   # Získajte koncové body služby
   azd env get-values
   
   # Otestujte koncový bod (príklad)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Očakávané indikátory úspechu:**
   - ✅ `azd up` dokončené bez chýb
   - ✅ Koncový bod služby vracia HTTP 200
   - ✅ Azure Portal zobrazuje stav "Running"
   - ✅ Application Insights prijíma telemetriu

> **⚠️ Problémy?** Pozrite si [Bežné problémy](../docs/chapter-07-troubleshooting/common-issues.md) pre riešenie problémov s nasadením

### Prispôsobenie príkladov

Každý príklad obsahuje:
- **README.md** - Podrobné inštrukcie na nastavenie a prispôsobenie
- **azure.yaml** - AZD konfigurácia s komentármi
- **infra/** - Bicep šablóny s vysvetlením parametrov
- **src/** - Ukážkový aplikačný kód
- **scripts/** - Pomocné skripty pre bežné úlohy

## 🎯 Vzdelávacie ciele

### Kategórie príkladov

#### **Základné nasadenia**
- Jednoslužbové aplikácie
- Jednoduché infraštruktúrne vzory
- Základné riadenie konfigurácie
- Nákladovo efektívne vývojové nastavenia

#### **Pokročilé scenáre**
- Viacslužbové architektúry
- Komplexné sieťové konfigurácie
- Vzory integrácie databáz
- Implementácie bezpečnosti a súladu

#### **Vzor pre produkciu**
- Konfigurácie vysokej dostupnosti
- Monitorovanie a observabilita
- Integrácia CI/CD
- Obnova po havárii

## 📖 Popisy príkladov

### Jednoduchá webová aplikácia - Node.js Express
**Technologies**: Node.js, Express, MongoDB, Container Apps  
**Complexity**: Začiatočník  
**Concepts**: Základné nasadenie, REST API, integrácia NoSQL databázy

### Statická webová stránka - React SPA
**Technologies**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Complexity**: Začiatočník  
**Concepts**: Statické hostovanie, serverless backend, moderný webový vývoj

### Container App - Python Flask
**Technologies**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Complexity**: Začiatočník  
**Concepts**: Kontajnerizácia, REST API, scale-to-zero, health probes, monitorovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologies**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Complexity**: Pokročilé  
**Concepts**: Viacslužbová architektúra, komunikácia medzi službami, frontovanie správ, distribuované trasovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/microservices)

### Databázová aplikácia - C# s Azure SQL
**Technologies**: C# ASP.NET Core, Azure SQL Database, App Service  
**Complexity**: Stredne pokročilý  
**Concepts**: Entity Framework, pripojenia do databázy, vývoj webového API

### Serverless Function - Python Azure Functions
**Technologies**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Complexity**: Stredne pokročilý  
**Concepts**: Event-driven architektúra, serverless computing, full-stack vývoj

### Microservices - Java Spring Boot
**Technologies**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Complexity**: Stredne pokročilý  
**Concepts**: Komunikácia mikroslužieb, distribuované systémy, podnikové vzory

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologies**: Microsoft Foundry Models, Azure AI Search, App Service  
**Complexity**: Stredne pokročilý  
**Concepts**: RAG architektúra, vektorové vyhľadávanie, integrácia LLM

#### AI Document Processing
**Technologies**: Azure AI Document Intelligence, Storage, Functions  
**Complexity**: Stredne pokročilý  
**Concepts**: Analýza dokumentov, OCR, extrakcia údajov

#### Machine Learning Pipeline
**Technologies**: Azure ML, MLOps, Container Registry  
**Complexity**: Pokročilé  
**Concepts**: Tréning modelov, nasadzovacie pipeline, monitorovanie

## 🛠 Príklady konfigurácií

Adresár `configurations/` obsahuje znovupoužiteľné komponenty:

### Konfigurácie prostredia
- Nastavenia vývojového prostredia
- Konfigurácie staging prostredia
- Produkčné konfigurácie pripravené na nasadenie
- Nastavenia pre viacregionálne nasadenie

### Bicep moduly
- Znovupoužiteľné infraštruktúrne komponenty
- Bežné vzory zdrojov
- Šablóny s tvrdením bezpečnosti
- Konfigurácie optimalizované z hľadiska nákladov

### Pomocné skripty
- Automatizácia nastavenia prostredia
- Skripty migrácie databázy
- Nástroje na overenie nasadenia
- Utility na monitorovanie nákladov

## 🔧 Sprievodca prispôsobením

### Prispôsobenie príkladov pre váš prípad použitia

1. **Skontrolujte predpoklady**
   - Overte požiadavky služieb Azure
   - Skontrolujte limity predplatného
   - Pochopte dopady na náklady

2. **Upravte konfiguráciu**
   - Aktualizujte definície služieb v `azure.yaml`
   - Prispôsobte Bicep šablóny
   - Upravte premenné prostredia

3. **Dôkladne testujte**
   - Nasadzujte najprv do vývojového prostredia
   - Overte funkčnosť
   - Testujte škálovanie a výkon

4. **Bezpečnostná kontrola**
   - Skontrolujte prístupové kontroly
   - Implementujte správu tajomstiev
   - Povoľte monitorovanie a alertovanie

## 📊 Porovnávacia matica

| Example | Services | Database | Auth | Monitoring | Complexity |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Local) | 2 | ❌ | Key Vault | Full | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Basic | Full | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Enterprise | Advanced | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Vzdelávacia cesta

### Odporúčaná postupnosť

1. **Začnite s Jednoduchou webovou aplikáciou**
   - Naučte sa základné koncepty AZD
   - Pochopte workflow nasadenia
   - Precvičujte správu prostredí

2. **Vyskúšajte statickú webovú stránku**
   - Preskúmajte rôzne možnosti hostovania
   - Naučte sa o integrácii CDN
   - Pochopte konfiguráciu DNS

3. **Prejdite na Container App**
   - Naučte sa základy kontajnerizácie
   - Pochopte koncepty škálovania
   - Precvičujte s Dockerom

4. **Pridajte integráciu databázy**
   - Naučte sa provisioning databázy
   - Pochopte connection stringy
   - Precvičujte správu tajomstiev

5. **Preskúmajte serverless**
   - Pochopte event-driven architektúru
   - Naučte sa o triggeroch a bindingoch
   - Precvičujte s API

6. **Budujte mikroslužby**
   - Naučte sa komunikáciu medzi službami
   - Pochopte distribuované systémy
   - Precvičujte komplexné nasadenia

## 🔍 Nájsť správny príklad

### Podľa technologického stacku
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontajnery**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databázy**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **Integrácia OpenAI**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podľa architektonického vzoru
- **Jednoduché REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statické + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroslužby**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontajnerizované**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-poháňané**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent architektúra**: **Retail Multi-Agent Solution**
- **Enterprise viacslužbové**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podľa úrovne zložitosti
- **Začiatočník**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Stredne pokročilý**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Pokročilé**: ML Pipeline
- **Pripravené pre produkciu v podniku**: [Microservices (Local)](../../../examples/container-app/microservices) (viacslužbové s frontovaním správ), **Retail Multi-Agent Solution** (Kompletný multi-agentný systém s ARM šablónou na nasadenie)

## 📚 Doplnkové zdroje

### Odkazy na dokumentáciu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Komunitné príklady
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webová aplikácia s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Úloha Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions v Jave](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepšie postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispievanie príkladov

Máte užitočný príklad na zdieľanie? Vítame príspevky!

### Pokyny na odovzdanie
1. Dodržte stanovenú štruktúru adresárov
2. Priložte komplexný README.md
3. Pridajte komentáre do konfiguračných súborov
4. Dôkladne otestujte pred odoslaním
5. Uveďte odhad nákladov a predpoklady

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

**Profesionálna rada**: Začnite s najjednoduchším príkladom, ktorý zodpovedá vašej technologickej sade, potom postupne prejdite k zložitejším scenárom. Každý príklad nadväzuje na koncepty z predchádzajúcich!

## 🚀 Pripravení začať?

### Váš vzdelávací plán

1. **Úplný začiatočník?** → Začnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Máte základné znalosti AZD?** → Vyskúšajte [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Vytvárate AI aplikácie?** → Začnite s [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) alebo preskúmajte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodiny)
4. **Potrebujete konkrétny technologický stack?** → Použite sekciu [Nájdenie správneho príkladu](#-finding-the-right-example) vyššie

### Ďalšie kroky

- ✅ Skontrolujte [Predpoklady](#predpoklady) vyššie
- ✅ Vyberte príklad zodpovedajúci vašej úrovni (pozrite [Legendu zložitosti](#legenda-hodnotenia-zložitosti))
- ✅ Prečítajte si README príkladu dôkladne pred nasadením
- ✅ Nastavte pripomienku spustiť `azd down` po testovaní
- ✅ Podeľte sa o svoje skúsenosti cez GitHub Issues alebo Discussions

### Potrebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Odpovede na bežné otázky
- 🐛 [Príručka riešenia problémov](../docs/chapter-07-troubleshooting/common-issues.md) - Opravte problémy s nasadením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Spýtajte sa komunity
- 📚 [Sprievodca štúdiom](../resources/study-guide.md) - Prehĺbte si vedomosti

---

**Navigácia**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Študijné materiály**: [Sprievodca štúdiom](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glosár](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Riešenie problémov](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Naposledy aktualizované: november 2025 | [Nahlásiť problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Pridať príklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->