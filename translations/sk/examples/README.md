<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-23T11:34:22+00:00",
  "source_file": "examples/README.md",
  "language_code": "sk"
}
-->
# Príklady - Praktické šablóny a konfigurácie AZD

**Učenie sa na príkladoch - usporiadané podľa kapitol**
- **📚 Domov kurzu**: [AZD pre začiatočníkov](../README.md)
- **📖 Mapovanie kapitol**: Príklady usporiadané podľa náročnosti učenia
- **🚀 Lokálny príklad**: [Riešenie pre maloobchod s viacerými agentmi](retail-scenario.md)
- **🤖 Externé AI príklady**: Odkazy na repozitáre Azure Samples

> **📍 DÔLEŽITÉ: Lokálne vs externé príklady**  
> Tento repozitár obsahuje **4 kompletné lokálne príklady** s plnou implementáciou:  
> - **Azure OpenAI Chat** (nasadenie GPT-4 s rozhraním pre chat)  
> - **Container Apps** (Jednoduché Flask API + mikroservisy)  
> - **Database App** (Web + SQL databáza)  
> - **Retail Multi-Agent** (Podnikové AI riešenie)  
>  
> Ďalšie príklady sú **externé odkazy** na repozitáre Azure-Samples, ktoré môžete klonovať.

## Úvod

Tento adresár poskytuje praktické príklady a odkazy, ktoré vám pomôžu naučiť sa Azure Developer CLI prostredníctvom praktického cvičenia. Scenár Retail Multi-Agent je kompletná, produkčne pripravená implementácia zahrnutá v tomto repozitári. Ďalšie príklady odkazujú na oficiálne Azure Samples, ktoré demonštrujú rôzne vzory AZD.

### Legenda hodnotenia náročnosti

- ⭐ **Začiatočník** - Základné koncepty, jedna služba, 15-30 minút
- ⭐⭐ **Stredne pokročilý** - Viac služieb, integrácia databázy, 30-60 minút
- ⭐⭐⭐ **Pokročilý** - Komplexná architektúra, integrácia AI, 1-2 hodiny
- ⭐⭐⭐⭐ **Expert** - Produkčne pripravené, podnikové vzory, 2+ hodiny

## 🎯 Čo je vlastne v tomto repozitári

### ✅ Lokálna implementácia (pripravené na použitie)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Kompletné nasadenie GPT-4 s rozhraním pre chat zahrnuté v tomto repozitári**

- **Umiestnenie:** `examples/azure-openai-chat/`
- **Náročnosť:** ⭐⭐ (Stredne pokročilý)
- **Čo je zahrnuté:**
  - Kompletné nasadenie Azure OpenAI (GPT-4)
  - Python príkazové rozhranie pre chat
  - Integrácia Key Vault pre bezpečné API kľúče
  - Šablóny infraštruktúry Bicep
  - Sledovanie používania tokenov a nákladov
  - Obmedzenie rýchlosti a spracovanie chýb

**Rýchly štart:**
```bash
# Prejdite na príklad
cd examples/azure-openai-chat

# Nasadiť všetko
azd up

# Nainštalujte závislosti a začnite chatovať
pip install -r src/requirements.txt
python src/chat.py
```

**Technológie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Príklady aplikácií Container App](container-app/README.md) 🆕
**Komplexné príklady nasadenia kontajnerov zahrnuté v tomto repozitári**

- **Umiestnenie:** `examples/container-app/`
- **Náročnosť:** ⭐-⭐⭐⭐⭐ (Začiatočník až expert)
- **Čo je zahrnuté:**
  - [Hlavný sprievodca](container-app/README.md) - Kompletný prehľad nasadenia kontajnerov
  - [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) - Základný príklad REST API
  - [Architektúra mikroservisov](../../../examples/container-app/microservices) - Produkčne pripravené nasadenie viacerých služieb
  - Vzory pre rýchly štart, produkciu a pokročilé nasadenie
  - Monitorovanie, bezpečnosť a optimalizácia nákladov

**Rýchly štart:**
```bash
# Zobraziť hlavného sprievodcu
cd examples/container-app

# Nasadiť jednoduché Flask API
cd simple-flask-api
azd up

# Nasadiť príklad mikroservisov
cd ../microservices
azd up
```

**Technológie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Riešenie pre maloobchod s viacerými agentmi](retail-scenario.md) 🆕
**Kompletná produkčne pripravená implementácia zahrnutá v tomto repozitári**

- **Umiestnenie:** `examples/retail-multiagent-arm-template/`
- **Náročnosť:** ⭐⭐⭐⭐ (Pokročilý)
- **Čo je zahrnuté:**
  - Kompletná šablóna nasadenia ARM
  - Architektúra viacerých agentov (Zákazník + Inventár)
  - Integrácia Azure OpenAI
  - AI vyhľadávanie s RAG
  - Komplexné monitorovanie
  - Skript na jednorazové nasadenie

**Rýchly štart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technológie:** Azure OpenAI, AI vyhľadávanie, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externé Azure Samples (klonovať na použitie)

Nasledujúce príklady sú udržiavané v oficiálnych repozitároch Azure-Samples. Klonujte ich, aby ste preskúmali rôzne vzory AZD:

### Jednoduché aplikácie (kapitoly 1-2)

| Šablóna | Repozitár | Náročnosť | Služby |
|:--------|:----------|:----------|:-------|
| **Python Flask API** | [Lokálne: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisy** | [Lokálne: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Viac služieb, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Ako používať:**
```bash
# Naklonujte akýkoľvek príklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadiť
azd up
```

### Príklady AI aplikácií (kapitoly 2, 5, 8)

| Šablóna | Repozitár | Náročnosť | Zameranie |
|:--------|:----------|:----------|:----------|
| **Azure OpenAI Chat** | [Lokálne: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Nasadenie GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základný AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rámec pre agentov |
| **Vyhľadávanie + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Vzor RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databázy a pokročilé vzory (kapitoly 3-8)

| Šablóna | Repozitár | Náročnosť | Zameranie |
|:--------|:----------|:----------|:----------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrácia databázy |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java mikroservisy** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Viac služieb |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciele učenia

Prácou na týchto príkladoch sa naučíte:
- Praktizovať pracovné postupy Azure Developer CLI s realistickými aplikačnými scenármi
- Porozumieť rôznym architektúram aplikácií a ich implementáciám AZD
- Ovládnuť vzory Infrastructure as Code pre rôzne služby Azure
- Aplikovať stratégie správy konfigurácie a nasadenia špecifické pre prostredie
- Implementovať monitorovanie, bezpečnosť a vzory škálovania v praktických kontextoch
- Získať skúsenosti s riešením problémov a ladením reálnych scenárov nasadenia

## Výsledky učenia

Po dokončení týchto príkladov budete schopní:
- Sebavedomo nasadiť rôzne typy aplikácií pomocou Azure Developer CLI
- Prispôsobiť poskytnuté šablóny vlastným požiadavkám aplikácie
- Navrhnúť a implementovať vlastné vzory infraštruktúry pomocou Bicep
- Konfigurovať komplexné aplikácie s viacerými službami s riadnymi závislosťami
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

## Príklady rýchleho štartu

> **💡 Nový v AZD?** Začnite s príkladom č. 1 (Flask API) - trvá ~20 minút a učí základné koncepty.

### Pre začiatočníkov
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokálne) ⭐  
   Nasadenie jednoduchého REST API so škálovaním na nulu  
   **Čas:** 20-25 minút | **Náklady:** $0-5/mesiac  
   **Čo sa naučíte:** Základný pracovný postup azd, kontajnerizácia, zdravotné sondy  
   **Očakávaný výsledok:** Funkčný API endpoint vracajúci "Hello, World!" s monitorovaním

2. **[Jednoduchá webová aplikácia - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadenie webovej aplikácie Node.js Express s MongoDB  
   **Čas:** 25-35 minút | **Náklady:** $10-30/mesiac  
   **Čo sa naučíte:** Integrácia databázy, environmentálne premenné, pripojovacie reťazce  
   **Očakávaný výsledok:** Aplikácia zoznamu úloh s funkciami vytvárania/čítania/aktualizácie/mazania

3. **[Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostovanie statickej webovej stránky React s Azure Static Web Apps  
   **Čas:** 20-30 minút | **Náklady:** $0-10/mesiac  
   **Čo sa naučíte:** Statické hostovanie, serverless funkcie, nasadenie CDN  
   **Očakávaný výsledok:** React UI s API backendom, automatické SSL, globálne CDN

### Pre stredne pokročilých
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokálne) ⭐⭐  
   Nasadenie GPT-4 s rozhraním pre chat a bezpečnou správou API kľúčov  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesiac  
   **Čo sa naučíte:** Nasadenie Azure OpenAI, integrácia Key Vault, sledovanie tokenov  
   **Očakávaný výsledok:** Funkčná chat aplikácia s GPT-4 a monitorovaním nákladov

5. **[Container App - Mikroservisy](../../../examples/container-app/microservices)** (Lokálne) ⭐⭐⭐⭐  
   Produkčne pripravená architektúra viacerých služieb  
   **Čas:** 45-60 minút | **Náklady:** $50-150/mesiac  
   **Čo sa naučíte:** Komunikácia medzi službami, fronty správ, distribuované sledovanie  
   **Očakávaný výsledok:** Systém s 2 službami (API Gateway + Product Service) s monitorovaním

6. **[Database App - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikácia s C# API a Azure SQL databázou  
   **Čas:** 30-45 minút | **Náklady:** $20-80/mesiac  
   **Čo sa naučíte:** Entity Framework, migrácie databázy, bezpečnosť pripojenia  
   **Očakávaný výsledok:** C# API s backendom Azure SQL, automatické nasadenie schémy

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggermi a Cosmos DB  
   **Čas:** 30-40 minút | **Náklady:** $10-40/mesiac  
   **Čo sa naučíte:** Architektúra založená na udalostiach, serverless škálovanie, integrácia NoSQL  
   **Očakávaný výsledok:** Funkčná aplikácia reagujúca na HTTP požiadavky s úložiskom Cosmos DB

8. **[Mikroservisy - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Viacslužbová Java aplikácia s Container Apps a API gateway  
   **Čas:** 60-90 minút | **Náklady:** $80-200/mesiac  
   **Čo sa naučíte:** Nasadenie Spring Boot, sieť služieb, vyvažovanie záťaže  
   **Očakávaný výsledok:** Viacslužbový Java systém s objavovaním služieb a smerovaním

### Šablóny Azure AI Foundry

1. **[Azure OpenAI Chat App - Lokálny príklad](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletné nasadenie GPT-4 s rozhraním pre chat  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesiac  
   **Očakávaný výsledok:** Funkčná chat aplikácia so sledovaním tokenov a monitorovaním nákladov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentná chat aplikácia s architektúrou RAG  
   **Čas:** 60-90 minút | **Náklady:** $100-300/mesiac  
   **Očakávaný výsledok:** Chat rozhranie poháňané RAG s vyhľadávaním dokumentov a citáciami

3. **[AI spracovanie dokumentov](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentov pomocou služieb Azure AI  
   **Čas:** 40-60 minút | **Náklady:** $20-80/mesiac  
   **Očakávaný výsledok:** API extrahujúce text, tabuľky a entity z nahraných dokumentov

4. **[Pipeline strojového učenia](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   Pracovný postup MLOps s Azure Machine Learning  
   **Čas:** 2-3 hodiny | **Náklady:** $150-500/mesiac  
   **Očakávaný výsledok:** Automatizovaný ML pipeline s tréningom, nasadením a monitorovaním

### Scenáre z reálneho sveta

#### **Riešenie pre maloobchod s viacerými agentmi** 🆕
**[Kompletný sprievodca implementáciou](./retail-scenario.md)**

Komplexné, produkčne pripravené riešenie zákazníckej podpory s viacerými agentmi, ktoré demonštruje podnikové AI aplikácie nasadené pomocou AZD. Tento scenár poskytuje:

- **Kompletná architektúra**: Systém viacerých agentov so špecializovanými agentmi pre zákaznícky servis a správu inventára
- **Produkčná infraštruktúra**: Multi-regionálne nasadenia Azure OpenAI, AI vyhľadávanie, Container Apps a komplexné monitorovanie  
- **Pripravená ARM šablóna na nasadenie**: Jedno kliknutie na nasadenie s viacerými režimami konfigurácie (Minimal/Standard/Premium)  
- **Pokročilé funkcie**: Validácia bezpečnosti red teaming, rámec na hodnotenie agentov, optimalizácia nákladov a návody na riešenie problémov  
- **Reálny obchodný kontext**: Prípad použitia zákazníckej podpory pre maloobchodníkov s nahrávaním súborov, integráciou vyhľadávania a dynamickým škálovaním  

**Technológie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Komplexnosť**: ⭐⭐⭐⭐ (Pokročilé - pripravené na produkčné nasadenie v podnikoch)  

**Ideálne pre**: AI vývojárov, architektov riešení a tímy budujúce produkčné multi-agentové systémy  

**Rýchly štart**: Nasadenie kompletného riešenia za menej ako 30 minút pomocou priloženej ARM šablóny s `./deploy.sh -g myResourceGroup`  

## 📋 Návod na použitie  

### Predpoklady  

Pred spustením akéhokoľvek príkladu:  
- ✅ Azure predplatné s prístupom Owner alebo Contributor  
- ✅ Nainštalovaný Azure Developer CLI ([Návod na inštaláciu](../docs/getting-started/installation.md))  
- ✅ Spustený Docker Desktop (pre príklady s kontajnermi)  
- ✅ Vhodné kvóty Azure (skontrolujte požiadavky konkrétneho príkladu)  

> **💰 Upozornenie na náklady:** Všetky príklady vytvárajú skutočné Azure zdroje, ktoré generujú poplatky. Pozrite si jednotlivé README súbory pre odhady nákladov. Nezabudnite spustiť `azd down`, keď skončíte, aby ste sa vyhli pokračujúcim nákladom.  

### Spustenie príkladov lokálne  

1. **Klonovanie alebo kopírovanie príkladu**  
   ```bash
   # Prejdite na požadovaný príklad
   cd examples/simple-web-app
   ```
  
2. **Inicializácia AZD prostredia**  
   ```bash
   # Inicializovať s existujúcou šablónou
   azd init
   
   # Alebo vytvoriť nové prostredie
   azd env new my-environment
   ```
  
3. **Konfigurácia prostredia**  
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

> **⚠️ Problémy?** Pozrite si [Bežné problémy](../docs/troubleshooting/common-issues.md) pre riešenie problémov s nasadením  

### Prispôsobenie príkladov  

Každý príklad obsahuje:  
- **README.md** - Podrobné pokyny na nastavenie a prispôsobenie  
- **azure.yaml** - Konfigurácia AZD s komentármi  
- **infra/** - Bicep šablóny s vysvetlením parametrov  
- **src/** - Ukážkový aplikačný kód  
- **scripts/** - Pomocné skripty pre bežné úlohy  

## 🎯 Ciele učenia  

### Kategórie príkladov  

#### **Základné nasadenia**  
- Aplikácie s jednou službou  
- Jednoduché infraštruktúrne vzory  
- Základné riadenie konfigurácie  
- Nákladovo efektívne vývojové nastavenia  

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
**Komplexnosť**: Začiatočník  
**Koncepty**: Základné nasadenie, REST API, integrácia NoSQL databázy  

### Statická webová stránka - React SPA  
**Technológie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexnosť**: Začiatočník  
**Koncepty**: Statické hosťovanie, serverless backend, moderný webový vývoj  

### Container App - Python Flask  
**Technológie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexnosť**: Začiatočník  
**Koncepty**: Kontajnerizácia, REST API, škálovanie na nulu, zdravotné sondy, monitorovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/simple-flask-api)  

### Container App - Architektúra mikroservisov  
**Technológie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexnosť**: Pokročilé  
**Koncepty**: Architektúra s viacerými službami, komunikácia služieb, fronty správ, distribuované sledovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/microservices)  

### Databázová aplikácia - C# s Azure SQL  
**Technológie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexnosť**: Stredne pokročilé  
**Koncepty**: Entity Framework, pripojenia k databáze, vývoj webového API  

### Serverless funkcia - Python Azure Functions  
**Technológie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexnosť**: Stredne pokročilé  
**Koncepty**: Architektúra založená na udalostiach, serverless výpočty, vývoj full-stack aplikácií  

### Mikroservisy - Java Spring Boot  
**Technológie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexnosť**: Stredne pokročilé  
**Koncepty**: Komunikácia mikroservisov, distribuované systémy, podnikové vzory  

### Príklady Azure AI Foundry  

#### Azure OpenAI Chat App  
**Technológie**: Azure OpenAI, Cognitive Search, App Service  
**Komplexnosť**: Stredne pokročilé  
**Koncepty**: Architektúra RAG, vektorové vyhľadávanie, integrácia LLM  

#### AI spracovanie dokumentov  
**Technológie**: Azure AI Document Intelligence, Storage, Functions  
**Komplexnosť**: Stredne pokročilé  
**Koncepty**: Analýza dokumentov, OCR, extrakcia dát  

#### Pipeline strojového učenia  
**Technológie**: Azure ML, MLOps, Container Registry  
**Komplexnosť**: Pokročilé  
**Koncepty**: Tréning modelov, nasadzovacie pipeline, monitorovanie  

## 🛠 Príklady konfigurácie  

Adresár `configurations/` obsahuje opakovane použiteľné komponenty:  

### Konfigurácie prostredia  
- Nastavenia vývojového prostredia  
- Konfigurácie staging prostredia  
- Konfigurácie pripravené na produkciu  
- Nastavenia nasadenia do viacerých regiónov  

### Bicep moduly  
- Opakovane použiteľné infraštruktúrne komponenty  
- Bežné vzory zdrojov  
- Šablóny s posilnenou bezpečnosťou  
- Nákladovo optimalizované konfigurácie  

### Pomocné skripty  
- Automatizácia nastavenia prostredia  
- Skripty na migráciu databáz  
- Nástroje na validáciu nasadenia  
- Nástroje na monitorovanie nákladov  

## 🔧 Príručka prispôsobenia  

### Prispôsobenie príkladov pre váš prípad použitia  

1. **Skontrolujte predpoklady**  
   - Skontrolujte požiadavky na služby Azure  
   - Overte limity predplatného  
   - Pochopte nákladové dôsledky  

2. **Upravte konfiguráciu**  
   - Aktualizujte definície služieb v `azure.yaml`  
   - Prispôsobte Bicep šablóny  
   - Upravte premenné prostredia  

3. **Dôkladne testujte**  
   - Najskôr nasadzujte do vývojového prostredia  
   - Overte funkčnosť  
   - Testujte škálovanie a výkon  

4. **Bezpečnostná kontrola**  
   - Skontrolujte prístupové kontroly  
   - Implementujte správu tajomstiev  
   - Aktivujte monitorovanie a upozornenia  

## 📊 Porovnávacia tabuľka  

| Príklad | Služby | Databáza | Autentifikácia | Monitorovanie | Komplexnosť |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Lokálne) | 2 | ❌ | Key Vault | Plné | ⭐⭐ |  
| **Python Flask API** (Lokálne) | 1 | ❌ | Základné | Plné | ⭐ |  
| **Mikroservisy** (Lokálne) | 5+ | ✅ | Podnikové | Pokročilé | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Základné | Základné | ⭐ |  
| React SPA + Functions | 3 | ✅ | Základné | Plné | ⭐ |  
| Python Flask Container | 2 | ❌ | Základné | Plné | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Plné | Plné | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Základné | Plné | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |  
| **Retail Multi-Agent** (Lokálne) | **8+** | **✅** | **Podnikové** | **Pokročilé** | **⭐⭐⭐⭐** |  

## 🎓 Učebná cesta  

### Odporúčaný postup  

1. **Začnite s jednoduchou webovou aplikáciou**  
   - Naučte sa základné koncepty AZD  
   - Pochopte pracovný postup nasadenia  
   - Precvičte si správu prostredia  

2. **Vyskúšajte statickú webovú stránku**  
   - Preskúmajte rôzne možnosti hosťovania  
   - Naučte sa o integrácii CDN  
   - Pochopte konfiguráciu DNS  

3. **Prejdite na Container App**  
   - Naučte sa základy kontajnerizácie  
   - Pochopte koncepty škálovania  
   - Precvičte si prácu s Dockerom  

4. **Pridajte integráciu databázy**  
   - Naučte sa poskytovanie databáz  
   - Pochopte pripojovacie reťazce  
   - Precvičte si správu tajomstiev  

5. **Preskúmajte serverless**  
   - Pochopte architektúru založenú na udalostiach  
   - Naučte sa o triggroch a väzbách  
   - Precvičte si prácu s API  

6. **Budujte mikroservisy**  
   - Naučte sa komunikáciu služieb  
   - Pochopte distribuované systémy  
   - Precvičte si komplexné nasadenia  

## 🔍 Výber správneho príkladu  

### Podľa technologického stacku  
- **Container Apps**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api), [Mikroservisy (Lokálne)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokálne)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokálne)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Lokálne)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Microservices User Service (Lokálne)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Containers**: [Python Flask (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices (Lokálne)](../../../examples/container-app/microservices), Java Microservices  
- **Databases**: [Microservices (Lokálne)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokálne)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**  
- **OpenAI Integration**: **[Azure OpenAI Chat (Lokálne)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution  
- **Enterprise Production**: [Microservices (Lokálne)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Podľa architektonického vzoru  
- **Jednoduché REST API**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api)  
- **Monolitické**: Node.js Express Todo, C# Web API + SQL  
- **Statické + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroservisy**: [Produkčné mikroservisy (Lokálne)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Kontajnerizované**: [Python Flask (Lokálne)](../../../examples/container-app/simple-flask-api), [Microservices (Lokálne)](../../../examples/container-app/microservices)  
- **AI-Powered**: **[Azure OpenAI Chat (Lokálne)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**  
- **Architektúra multi-agentov**: **Retail Multi-Agent Solution**  
- **Podnikové multi-služby**: [Microservices (Lokálne)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**  

### Podľa úrovne komplexnosti  
- **Začiatočník**: [Python Flask API (Lokálne)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Stredne pokročilé**: **[Azure OpenAI Chat (Lokálne)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing  
- **Pokročilé**: ML Pipeline  
- **Pripravené na produkciu v podnikoch**: [Microservices (Lokálne)](../../../examples/container-app/microservices) (Multi-služby s frontami správ), **Retail Multi-Agent Solution** (Kompletný multi-agentový systém s nasadením ARM šablóny)  

## 📚 Ďalšie zdroje  

### Odkazy na dokumentáciu  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Dokumentácia](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Príklady z komunity  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App s C# a Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App s Python a MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo aplikácia s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webová aplikácia s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepšie praktiky
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispievanie príkladov

Máte užitočný príklad na zdieľanie? Radi privítame vaše príspevky!

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

**Tip pre profesionálov**: Začnite s najjednoduchším príkladom, ktorý zodpovedá vašej technologickej zostave, a postupne prejdite k zložitejším scenárom. Každý príklad stavia na konceptoch z predchádzajúcich!

## 🚀 Pripravení začať?

### Vaša učebná cesta

1. **Úplný začiatočník?** → Začnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minút)
2. **Máte základné znalosti AZD?** → Skúste [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minút)
3. **Budujete AI aplikácie?** → Začnite s [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minút) alebo preskúmajte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodiny)
4. **Potrebujete konkrétnu technologickú zostavu?** → Použite sekciu [Nájdenie správneho príkladu](../../../examples) vyššie

### Ďalšie kroky

- ✅ Skontrolujte [Predpoklady](../../../examples) vyššie
- ✅ Vyberte príklad zodpovedajúci vašej úrovni zručností (pozrite [Legenda zložitosti](../../../examples))
- ✅ Dôkladne si prečítajte README príkladu pred nasadením
- ✅ Nastavte si pripomienku na spustenie `azd down` po testovaní
- ✅ Podeľte sa o svoje skúsenosti prostredníctvom GitHub Issues alebo Discussions

### Potrebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Odpovede na bežné otázky
- 🐛 [Príručka na riešenie problémov](../docs/troubleshooting/common-issues.md) - Oprava problémov s nasadením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Opýtajte sa komunity
- 📚 [Študijný materiál](../resources/study-guide.md) - Posilnite svoje učenie

---

**Navigácia**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Študijné materiály**: [Študijný materiál](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glosár](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Riešenie problémov](../docs/troubleshooting/common-issues.md)

---

*Posledná aktualizácia: November 2025 | [Nahlásiť problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispieť príklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Zrieknutie sa zodpovednosti**:  
Tento dokument bol preložený pomocou služby AI prekladu [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, prosím, berte na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho rodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nenesieme zodpovednosť za akékoľvek nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->