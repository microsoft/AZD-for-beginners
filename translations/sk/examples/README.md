# Príklady - Praktické AZD šablóny a konfigurácie

**Učenie pomocou príkladov - usporiadané podľa kapitol**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Mapovanie kapitol**: Príklady usporiadané podľa zložitosti učenia
- **🚀 Lokálny príklad**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Externé AI príklady**: Odkazy na repozitáre Azure Samples

> **📍 DÔLEŽITÉ: Lokálne vs Externé príklady**  
> Tento repozitár obsahuje **4 kompletné lokálne príklady** s plnou implementáciou:  
> - **Microsoft Foundry Models Chat** (nasadenie gpt-4.1 s chatovým rozhraním)  
> - **Container Apps** (Jednoduché Flask API + mikroservisy)  
> - **Database App** (Web + SQL databáza)  
> - **Retail Multi-Agent** (Enterprise AI riešenie)  
>  
> Ďalšie príklady sú **externé odkazy** na repozitáre Azure-Samples, ktoré si môžete sklonovať.

## Úvod

Tento adresár poskytuje praktické príklady a odkazy, ktoré vám pomôžu naučiť sa Azure Developer CLI prostredníctvom praktických cvičení. Scenár Retail Multi-Agent je kompletná implementácia pripravená na produkciu, zahrnutá v tomto repozitári. Ďalšie príklady odkazujú na oficiálne Azure Samples, ktoré demonštrujú rôzne vzory AZD.

### Legenda hodnotenia zložitosti

- ⭐ **Začiatočník** - Základné koncepty, jedna služba, 15-30 minút
- ⭐⭐ **Stredne pokročilý** - Viacero služieb, integrácia databázy, 30-60 minút
- ⭐⭐⭐ **Pokročilý** - Zložitá architektúra, integrácia AI, 1-2 hodiny
- ⭐⭐⭐⭐ **Expert** - Pripravené na produkciu, podnikové vzory, 2+ hodiny

## 🎯 Čo sa v tomto repozitári skutočne nachádza

### ✅ Lokálna implementácia (pripravená na použitie)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Kompletné nasadenie gpt-4.1 s chatovým rozhraním zahrnuté v tomto repozitári**

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

# Nasaďte všetko
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
  - [Master Guide](container-app/README.md) - Kompletný prehľad nasadení kontajnerov
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Základný príklad REST API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Produkčne pripravené viacslužbové nasadenie
  - Rýchly štart, Produkcia a Pokročilé vzory
  - Monitorovanie, zabezpečenie a optimalizácia nákladov

**Rýchly štart:**
```bash
# Zobraziť hlavný návod
cd examples/container-app

# Nasadiť jednoduché Flask API
cd simple-flask-api
azd up

# Nasadiť príklad mikroslužieb
cd ../microservices
azd up
```

**Technológie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Kompletná implementácia pripravená na produkciu zahrnutá v tomto repozitári**

- **Umiestnenie:** `examples/retail-multiagent-arm-template/`
- **Zložitosť:** ⭐⭐⭐⭐ (Pokročilý)
- **Čo je zahrnuté:**
  - Kompletná ARM šablóna nasadenia
  - Multi-agentná architektúra (Zákazník + Inventár)
  - Integrácia Microsoft Foundry Models
  - AI Search s RAG
  - Komplexné monitorovanie
  - Skript na jedným kliknutím nasadenie

**Rýchly štart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technológie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externé Azure Samples (sklonovať a použiť)

Nasledujúce príklady sú udržiavané v oficiálnych repozitároch Azure-Samples. Sklonujte ich a preskúmajte rôzne vzory AZD:

### Jednoduché aplikácie (Kapitoly 1-2)

| Šablóna | Repozitár | Zložitosť | Služby |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokálne: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokálne: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Viacslužbové, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Ako používať:**
```bash
# Klonovať ľubovoľný príklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadiť
azd up
```

### AI aplikačné príklady (Kapitoly 2, 5, 8)

| Šablóna | Repozitár | Zložitosť | Zameranie |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokálne: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Nasadenie gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základný AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentný framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzor |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databázy a pokročilé vzory (Kapitoly 3-8)

| Šablóna | Repozitár | Zložitosť | Zameranie |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrácia databázy |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Viacslužbové |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Vzdelávacie ciele

Prácou s týmito príkladmi si osvojíte:
- Prax s workflow Azure Developer CLI v realistických aplikačných scenároch
- Pochopenie rôznych aplikačných architektúr a ich azd implementácií
- Ovládanie vzorov Infrastructure as Code pre rôzne Azure služby
- Aplikovanie správy konfigurácií a stratégií nasadenia špecifických pre prostredie
- Implementovanie monitorovania, zabezpečenia a škálovania v praktických kontextoch
- Získanie skúseností s odhaľovaním chýb a ladením reálnych nasadení

## Výsledky učenia

Po dokončení týchto príkladov budete schopní:
- Nasadzovať rôzne typy aplikácií pomocou Azure Developer CLI sebavedomo
- Prispôsobiť poskytnuté šablóny požiadavkám vašej aplikácie
- Navrhovať a implementovať vlastné infraštruktúrne vzory pomocou Bicep
- Konfigurovať zložité viacslužbové aplikácie s vhodnými závislosťami
- Aplikovať bezpečnostné, monitorovacie a výkonové osvedčené postupy v reálnych scenároch
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

## Rýchle štartovacie príklady

> **💡 Nový v AZD?** Začnite s príkladom č. 1 (Flask API) - trvá ~20 minút a učí základné koncepty.

### Pre začiatočníkov
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokálne) ⭐  
   Nasadiť jednoduché REST API so škálovaním na nulu  
   **Čas:** 20-25 minút | **Náklady:** $0-5/mesačne  
   **Čo sa naučíte:** Základný azd workflow, kontajnerizácia, health probes  
   **Očakávaný výsledok:** Funkčné API endpoint vracajúce "Hello, World!" s monitorovaním

2. **[Jednoduchá webová aplikácia - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadiť Node.js Express webovú aplikáciu s MongoDB  
   **Čas:** 25-35 minút | **Náklady:** $10-30/mesačne  
   **Čo sa naučíte:** Integrácia databázy, premenné prostredia, connection strings  
   **Očakávaný výsledok:** Todo aplikácia s tvorbou/čítaním/úpravou/mazaním položiek

3. **[Statická stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostovať React statickú stránku pomocou Azure Static Web Apps  
   **Čas:** 20-30 minút | **Náklady:** $0-10/mesačne  
   **Čo sa naučíte:** Statické hostovanie, serverless funkcie, nasadenie CDN  
   **Očakávaný výsledok:** React UI s API backendom, automatické SSL, globálne CDN

### Pre stredne pokročilých
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokálne) ⭐⭐  
   Nasadiť gpt-4.1 s chatovým rozhraním a bezpečným manažmentom API kľúčov  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesačne  
   **Čo sa naučíte:** Nasadenie Microsoft Foundry Models, integrácia Key Vault, sledovanie tokenov  
   **Očakávaný výsledok:** Funkčná chat aplikácia s gpt-4.1 a sledovaním nákladov

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokálne) ⭐⭐⭐⭐  
   Produkčne pripravená viacslužbová architektúra  
   **Čas:** 45-60 minút | **Náklady:** $50-150/mesačne  
   **Čo sa naučíte:** Komunikácia medzi službami, queuing správ, distribuované trasovanie  
   **Očakávaný výsledok:** Dvojslužbový systém (API Gateway + Produktová služba) s monitorovaním

6. **[Databázová aplikácia - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikácia s C# API a Azure SQL databázou  
   **Čas:** 30-45 minút | **Náklady:** $20-80/mesačne  
   **Čo sa naučíte:** Entity Framework, databázové migrácie, zabezpečenie pripojenia  
   **Očakávaný výsledok:** C# API s Azure SQL backendom, automatické nasadenie schémy

7. **[Serverless funkcia - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP spúšťačmi a Cosmos DB  
   **Čas:** 30-40 minút | **Náklady:** $10-40/mesačne  
   **Čo sa naučíte:** Event-driven architektúra, serverless škálovanie, NoSQL integrácia  
   **Očakávaný výsledok:** Funkčná aplikácia reagujúca na HTTP požiadavky s uložením do Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Viacslužbová Java aplikácia s Container Apps a API gateway  
   **Čas:** 60-90 minút | **Náklady:** $80-200/mesačne  
   **Čo sa naučíte:** Nasadenie Spring Boot, service mesh, load balancing  
   **Očakávaný výsledok:** Viacslužbový Java systém s discovery služieb a routovaním

### Microsoft Foundry šablóny

1. **[Microsoft Foundry Models Chat App - Lokálny príklad](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletné nasadenie gpt-4.1 s chatovým rozhraním  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesačne  
   **Očakávaný výsledok:** Funkčná chat aplikácia so sledovaním tokenov a nákladov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentná chat aplikácia s RAG architektúrou  
   **Čas:** 60-90 minút | **Náklady:** $100-300/mesačne  
   **Očakávaný výsledok:** Chat rozhranie poháňané RAG s vyhľadávaním dokumentov a citáciami

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentov pomocou Azure AI služieb  
   **Čas:** 40-60 minút | **Náklady:** $20-80/mesačne  
   **Očakávaný výsledok:** API extrahujúce text, tabuľky a entity z nahraných dokumentov

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow s Azure Machine Learning  
   **Čas:** 2-3 hodiny | **Náklady:** $150-500/mesačne  
   **Očakávaný výsledok:** Automatizovaný ML pipeline s trénovaním, nasadením a monitorovaním

### Scenáre z reálneho sveta

#### **Retail Multi-Agent Solution** 🆕
**[Kompletný sprievodca implementáciou](./retail-scenario.md)**

Komplexné, produkčne pripravené multi-agentné riešenie zákazníckej podpory, ktoré demonštruje podnikové nasadenie AI aplikácií pomocou AZD. Tento scenár poskytuje:
- **Complete Architecture**: Multi-agent system with specialized customer service and inventory management agents
- **Production Infrastructure**: Multi-region Microsoft Foundry Models deployments, AI Search, Container Apps, and comprehensive monitoring
- **Ready-to-Deploy ARM Template**: One-click deployment with multiple configuration modes (Minimal/Standard/Premium)
- **Advanced Features**: Red teaming security validation, agent evaluation framework, cost optimization, and troubleshooting guides
- **Real Business Context**: Retailer customer support use case with file uploads, search integration, and dynamic scaling

**Technologies**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Complexity**: ⭐⭐⭐⭐ (Pokročilé - pripravené pre podnikové produkčné nasadenie)

**Perfect for**: Vývojári AI, návrhári riešení a tímy budujúce produkčné multi-agentové systémy

**Quick Start**: Nasadiť kompletné riešenie za menej než 30 minút pomocou priloženého ARM šablóny s `./deploy.sh -g myResourceGroup`

## 📋 Inštrukcie na použitie

### Predpoklady

Pred spustením akéhokoľvek príkladu:
- ✅ Azure subscription s rolou Owner alebo Contributor
- ✅ Azure Developer CLI nainštalovaný ([Príručka inštalácie](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop spustený (pre príklady s kontajnermi)
- ✅ Vhodné Azure kvóty (skontrolujte požiadavky špecifické pre príklad)

> **💰 Upozornenie na náklady:** Všetky príklady vytvárajú reálne Azure zdroje, ktoré generujú poplatky. Pozrite si jednotlivé README súbory pre odhad nákladov. Nezabudnite spustiť `azd down`, keď skončíte, aby ste sa vyhli priebežným poplatkom.

### Spustenie príkladov lokálne

1. **Klonovať alebo skopírovať príklad**
   ```bash
   # Prejdite na požadovaný príklad
   cd examples/simple-web-app
   ```

2. **Inicializovať AZD prostredie**
   ```bash
   # Inicializovať pomocou existujúcej šablóny
   azd init
   
   # Alebo vytvoriť nové prostredie
   azd env new my-environment
   ```

3. **Konfigurovať prostredie**
   ```bash
   # Nastavte požadované premenné
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasadiť**
   ```bash
   # Nasadiť infraštruktúru a aplikáciu
   azd up
   ```

5. **Overiť nasadenie**
   ```bash
   # Získať koncové body služby
   azd env get-values
   
   # Otestovať koncový bod (príklad)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Očakávané indikátory úspechu:**
   - ✅ `azd up` sa dokončí bez chýb
   - ✅ Koncový bod služby vracia HTTP 200
   - ✅ Azure Portal zobrazuje stav "Running"
   - ✅ Application Insights prijíma telemetriu

> **⚠️ Problémy?** Pozrite si [Bežné problémy](../docs/chapter-07-troubleshooting/common-issues.md) pre riešenie problémov s nasadením

### Prispôsobenie príkladov

Každý príklad obsahuje:
- **README.md** - Podrobné inštrukcie na nastavenie a prispôsobenie
- **azure.yaml** - AZD konfigurácia s komentármi
- **infra/** - Bicep šablóny s vysvetlením parametrov
- **src/** - Vzorkový aplikačný kód
- **scripts/** - Pomocné skripty pre bežné úlohy

## 🎯 Ciele učenia

### Kategórie príkladov

#### **Základné nasadenia**
- Jednoslužbové aplikácie
- Jednoduché infraštruktúrne vzory
- Základné riadenie konfigurácie
- Nákladovo efektívne vývojové nastavenia

#### **Pokročilé scenáre**
- Architektúry s viacerými službami
- Zložité sieťové konfigurácie
- Vzory integrácie databáz
- Implementácie bezpečnosti a súladu

#### **Produkčné vzory**
- Konfigurácie s vysokou dostupnosťou
- Monitorovanie a pozorovateľnosť
- Integrácia CI/CD
- Obnova po havárii

## 📖 Popisy príkladov

### Jednoduchá webová aplikácia - Node.js Express
**Technológie**: Node.js, Express, MongoDB, Container Apps  
**Zložitosť**: Začiatočník  
**Koncepty**: Základné nasadenie, REST API, integrácia NoSQL databázy

### Statická stránka - React SPA
**Technológie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Zložitosť**: Začiatočník  
**Koncepty**: Statické hostovanie, serverless backend, moderný webový vývoj

### Container App - Python Flask
**Technológie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Zložitosť**: Začiatočník  
**Koncepty**: Kontajnerizácia, REST API, scale-to-zero, health probes, monitorovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/simple-flask-api)

### Container App - Mikroservisy Architektúra
**Technológie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Zložitosť**: Pokročilé  
**Koncepty**: Architektúra viacerých služieb, komunikácia služieb, queued messaging, distribuované trasovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/microservices)

### Databázová aplikácia - C# s Azure SQL
**Technológie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Entity Framework, pripojenia k databáze, vývoj webového API

### Serverless funkcia - Python Azure Functions
**Technológie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Event-driven architektúra, serverless computing, full-stack vývoj

### Mikroservisy - Java Spring Boot
**Technológie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Komunikácia mikroservisov, distribuované systémy, podnikové vzory

### Microsoft Foundry Príklady

#### Microsoft Foundry Models Chat App
**Technológie**: Microsoft Foundry Models, Cognitive Search, App Service  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: RAG architektúra, vektorové vyhľadávanie, integrácia LLM

#### AI Spracovanie dokumentov
**Technológie**: Azure AI Document Intelligence, Storage, Functions  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Analýza dokumentov, OCR, extrakcia dát

#### Machine Learning Pipeline
**Technológie**: Azure ML, MLOps, Container Registry  
**Zložitosť**: Pokročilé  
**Koncepty**: Tréning modelov, deployment pipelines, monitorovanie

## 🛠 Príklady konfigurácií

Adresár `configurations/` obsahuje znovupoužiteľné komponenty:

### Konfigurácie prostredí
- Nastavenia vývojového prostredia
- Konfigurácie pre staging
- Produkčné konfigurácie pripravené na nasadenie
- Nasadenia v niekoľkých regiónoch

### Bicep moduly
- Znovupoužiteľné infraštruktúrne komponenty
- Bežné vzory zdrojov
- Šablóny zosilnené pre bezpečnosť
- Nákladovo optimalizované konfigurácie

### Pomocné skripty
- Automatizácia nastavenia prostredia
- Skripty migrácie databáz
- Nástroje na overenie nasadenia
- Nástroje na monitorovanie nákladov

## 🔧 Príručka prispôsobenia

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
   - Najprv nasadiť do vývojového prostredia
   - Overiť funkčnosť
   - Otestovať škálovanie a výkon

4. **Bezpečnostná revízia**
   - Skontrolovať prístupy a oprávnenia
   - Implementovať manažment tajomstiev
   - Povoliť monitorovanie a alertovanie

## 📊 Porovnávacia matica

| Príklad | Služby | Databáza | Overenie | Monitorovanie | Zložitosť |
|---------|--------|----------|----------|---------------|-----------|
| **Microsoft Foundry Models Chat** (Lokálne) | 2 | ❌ | Key Vault | Úplné | ⭐⭐ |
| **Python Flask API** (Lokálne) | 1 | ❌ | Základné | Úplné | ⭐ |
| **Microservices** (Lokálne) | 5+ | ✅ | Podnikové | Pokročilé | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Základné | Základné | ⭐ |
| React SPA + Functions | 3 | ✅ | Základné | Úplné | ⭐ |
| Python Flask Container | 2 | ❌ | Základné | Úplné | ⭐ |
| C# Web API + SQL | 2 | ✅ | Úplné | Úplné | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Úplné | Úplné | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Úplné | Úplné | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Úplné | Úplné | ⭐⭐⭐ |
| AI Spracovanie dokumentov | 2 | ❌ | Základné | Úplné | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Úplné | Úplné | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokálne) | **8+** | **✅** | **Podnikové** | **Pokročilé** | **⭐⭐⭐⭐** |

## 🎓 Vzdelávacia cesta

### Odporúčané poradie

1. **Začať s Jednoduchou webovou aplikáciou**
   - Naučiť sa základné koncepty AZD
   - Pochopiť workflow nasadenia
   - Precvičiť správu prostredí

2. **Vyskúšať statickú stránku**
   - Preskúmať rôzne možnosti hostingu
   - Naučiť sa o CDN integrácii
   - Pochopiť DNS konfiguráciu

3. **Prejsť na Container App**
   - Naučiť sa základy kontajnerizácie
   - Pochopiť koncepty škálovania
   - Precvičiť s Dockerom

4. **Pridať integráciu databázy**
   - Naučiť sa provisioning databázy
   - Pochopiť connection strings
   - Precvičiť správu tajomstiev

5. **Preskúmať serverless**
   - Pochopiť event-driven architektúru
   - Naučiť sa o triggeroch a bindovaniach
   - Precvičiť si tvorbu API

6. **Vytvoriť mikroservisy**
   - Naučiť sa komunikáciu služieb
   - Pochopiť distribuované systémy
   - Precvičiť zložité nasadenia

## 🔍 Ako nájsť správny príklad

### Podľa technologického stacku
- **Container Apps**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices (Lokálne)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokálne)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokálne)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokálne)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokálne)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices (Lokálne)](../../../examples/container-app/microservices), Java Microservices
- **Databázy**: [Microservices (Lokálne)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokálne)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Spracovanie dokumentov, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokálne)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokálne)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podľa architektonického vzoru
- **Jednoduché REST API**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statický + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisy**: [Production Microservices (Lokálne)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontajnerizované**: [Python Flask (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices (Lokálne)](../../../examples/container-app/microservices)
- **AI-poháňané**: **[Microsoft Foundry Models Chat (Lokálne)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Spracovanie dokumentov, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent architektúra**: **Retail Multi-Agent Solution**
- **Podnikové multi-služby**: [Microservices (Lokálne)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podľa úrovne zložitosti
- **Začiatočník**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Stredne pokročilé**: **[Microsoft Foundry Models Chat (Lokálne)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Spracovanie dokumentov
- **Pokročilé**: ML Pipeline
- **Pripravené na podnikové produkčné nasadenie**: [Microservices (Lokálne)](../../../examples/container-app/microservices) (Viacslužbové s message queuing), **Retail Multi-Agent Solution** (Kompletný multi-agentový systém s ARM šablónou)

## 📚 Dodatočné zdroje

### Odkazy na dokumentáciu
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Príklady komunity
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App with C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions with Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepšie postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispievanie príkladov

Máte užitočný príklad, ktorý chcete zdieľať? Vítame príspevky!

### Pokyny na zasielanie
1. Dodržiavajte zavedenú štruktúru adresárov
2. Zahrňte obsiahly README.md
3. Pridajte komentáre do konfiguračných súborov
4. Dôkladne otestujte pred odoslaním
5. Uveďte odhad nákladov a predpoklady

### Príklad štruktúry šablóny
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

**Tip odborníka**: Začnite s najjednoduchším príkladom, ktorý zodpovedá vášmu technologickému stacku, a potom postupne pokračujte k zložitejším scenárom. Každý príklad nadväzuje na koncepty z predchádzajúcich!

## 🚀 Pripravení začať?

### Vaša učebná cesta

1. **Úplný začiatočník?** → Začnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Máte základné znalosti AZD?** → Vyskúšajte [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Staviate AI aplikácie?** → Začnite s [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) alebo preskúmajte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodín)
4. **Potrebujete konkrétny technologický stack?** → Použite sekciu [Nájsť správny príklad](#-finding-the-right-example) vyššie

### Ďalšie kroky

- ✅ Skontrolujte [Prerequisites](#predpoklady) vyššie
- ✅ Vyberte príklad zodpovedajúci vašej úrovni (pozri [Complexity Legend](#legenda-hodnotenia-zložitosti))
- ✅ Pred nasadením si dôkladne prečítajte README príkladu
- ✅ Nastavte si pripomienku na spustenie `azd down` po testovaní
- ✅ Podeľte sa o svoje skúsenosti cez GitHub Issues alebo Discussions

### Potrebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Často kladené otázky a odpovede
- 🐛 [Troubleshooting Guide](../docs/chapter-07-troubleshooting/common-issues.md) - Riešenie problémov s nasadením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Opýtajte sa komunity
- 📚 [Study Guide](../resources/study-guide.md) - Posilnite si vedomosti

---

**Navigácia**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Študijné materiály**: [Study Guide](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Troubleshooting](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Posledná aktualizácia: november 2025 | [Nahlásiť problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispieť príklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyhlásenie o vylúčení zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa usilujeme o presnosť, uvedomte si, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za rozhodujúci zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu nenesieme zodpovednosť.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->