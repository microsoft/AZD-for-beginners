# Príklady - Praktické AZD šablóny a konfigurácie

**Učenie sa na príkladoch - usporiadané podľa kapitol**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Mapovanie kapitol**: Príklady usporiadané podľa zložitosti učenia
- **🚀 Lokálny príklad**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Externé AI príklady**: Odkazy na repozitáre Azure Samples

> **📍 DÔLEŽITÉ: Lokálne vs externé príklady**  
> Toto úložisko obsahuje **4 kompletné lokálne príklady** s plnou implementáciou:  
> - **Azure OpenAI Chat** (nasadenie GPT-4 s chat rozhraním)  
> - **Container Apps** (Jednoduché Flask API + Mikroservisy)  
> - **Databázová aplikácia** (Web + SQL databáza)  
> - **Retail Multi-Agent** (Podnikové AI riešenie)  
>  
> Ďalšie príklady sú **externé odkazy** na repozitáre Azure-Samples, ktoré si môžete klonovať.

## Úvod

Tento adresár poskytuje praktické príklady a odkazy, ktoré vám pomôžu naučiť sa Azure Developer CLI prostredníctvom praktických cvičení. Scenár Retail Multi-Agent je kompletná, produkčná implementácia zahrnutá v tomto úložisku. Ďalšie príklady odkazujú na oficiálne Azure Samples, ktoré demonštrujú rôzne vzory AZD.

### Legenda hodnotenia zložitosti

- ⭐ **Začiatočník** - Základné koncepty, jedna služba, 15-30 minút
- ⭐⭐ **Stredne pokročilý** - Viac služieb, integrácia databázy, 30-60 minút
- ⭐⭐⭐ **Pokročilý** - Zložitá architektúra, integrácia AI, 1-2 hodiny
- ⭐⭐⭐⭐ **Expert** - Produkčné vzory, podnikové prístupy, 2+ hodín

## 🎯 Čo sa vlastne nachádza v tomto úložisku

### ✅ Lokálna implementácia (pripravené na použitie)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Kompletné nasadenie GPT-4 s chat rozhraním zahrnuté v tomto repozitári**

- **Umiestnenie:** `examples/azure-openai-chat/`
- **Zložitosť:** ⭐⭐ (Stredne pokročilý)
- **Obsahuje:**
  - Kompletné nasadenie Azure OpenAI (GPT-4)
  - Python rozhranie príkazového riadku pre chat
  - Integrácia s Key Vault pre bezpečné API kľúče
  - Bicep infraštruktúrne šablóny
  - Sledovanie používania tokenov a nákladov
  - Obmedzovanie rýchlosti a spracovanie chýb

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

#### [Príklady Container App](container-app/README.md) 🆕
**Komplexné príklady nasadenia kontajnerov zahrnuté v tomto repozitári**

- **Umiestnenie:** `examples/container-app/`
- **Zložitosť:** ⭐-⭐⭐⭐⭐ (Od začiatočníka po experta)
- **Obsahuje:**
  - [Hlavný sprievodca](container-app/README.md) - Kompletný prehľad nasadení kontajnerov
  - [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) - Základný príklad REST API
  - [Mikroservisy](../../../examples/container-app/microservices) - Produkčné nasadenie s viacerými službami
  - Rýchly štart, Produkčné a Pokročilé vzory
  - Monitorovanie, zabezpečenie a optimalizácia nákladov

**Rýchly štart:**
```bash
# Zobraziť hlavný návod
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
**Kompletná produkčná implementácia zahrnutá v tomto repozitári**

- **Umiestnenie:** `examples/retail-multiagent-arm-template/`
- **Zložitosť:** ⭐⭐⭐⭐ (Pokročilý)
- **Obsahuje:**
  - Komplexná ARM šablóna nasadenia
  - Architektúra s viacerými agentmi (Zákazník + Inventár)
  - Integrácia Azure OpenAI
  - AI Search s RAG
  - Komplexné monitorovanie
  - Skript na nasadenie jedným klikom

**Rýchly štart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technológie:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externé príklady Azure (Klonujte pre použitie)

Nasledujúce príklady sú udržiavané v oficiálnych repozitároch Azure-Samples. Naklonujte ich, aby ste preskúmali rôzne vzory AZD:

### Jednoduché aplikácie (Kapitoly 1-2)

| Šablóna | Repozitár | Zložitosť | Služby |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokálne: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisy** | [Lokálne: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Viacslužbové, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

Ako používať:
```bash
# Klonovať ľubovoľný príklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadiť
azd up
```

### Príklady AI aplikácií (Kapitoly 2, 5, 8)

| Šablóna | Repozitár | Zložitosť | Zameranie |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokálne: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Nasadenie GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základný AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rámec agentov |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzor |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databázy a pokročilé vzory (Kapitoly 3-8)

| Šablóna | Repozitár | Zložitosť | Zameranie |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrácia databázy |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Viacslužbové |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciele učenia

Pri práci s týmito príkladmi budete:
- Precvičovať si pracovné postupy Azure Developer CLI s realistickými aplikačnými scenármi
- Pochopiť rôzne architektúry aplikácií a ich implementácie v azd
- Ovládnuť vzory Infrastructure as Code pre rôzne Azure služby
- Aplikovať správu konfigurácií a nasadzovacie stratégie špecifické pre prostredie
- Implementovať monitorovanie, zabezpečenie a škálovateľnosť v praktických kontextoch
- Získať skúsenosti s riešením problémov a ladením reálnych nasadení

## Výsledky učenia

Po dokončení týchto príkladov budete schopní:
- Istotne nasadzovať rôzne typy aplikácií pomocou Azure Developer CLI
- Prispôsobiť poskytnuté šablóny vlastným požiadavkám aplikácie
- Navrhovať a implementovať vlastné infraštruktúrne vzory pomocou Bicep
- Konfigurovať zložité viacslužbové aplikácie s korektnými závislosťami
- Použiť bezpečnostné, monitorovacie a výkonnostné osvedčené postupy v reálnych scenároch
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

## Rýchly štart - príklady

> **💡 Nový v AZD?** Začnite s príkladom č. 1 (Flask API) - trvá to ~20 minút a naučí základné koncepty.

### Pre začiatočníkov
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokálne) ⭐  
   Nasadiť jednoduché REST API so škálovaním na nulu  
   **Čas:** 20-25 minút | **Náklady:** $0-5/mesiac  
   **Čo sa naučíte:** Základný azd pracovný postup, kontajnerizácia, health probe-y  
   **Očakávaný výsledok:** Funkčný API endpoint vracajúci "Hello, World!" s monitorovaním

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadiť Node.js Express webovú aplikáciu s MongoDB  
   **Čas:** 25-35 minút | **Náklady:** $10-30/mesiac  
   **Čo sa naučíte:** Integrácia databázy, premenné prostredia, connection stringy  
   **Očakávaný výsledok:** Aplikácia Todo list s CRUD funkciami

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostovať statickú webovú stránku React s Azure Static Web Apps  
   **Čas:** 20-30 minút | **Náklady:** $0-10/mesiac  
   **Čo sa naučíte:** Statické hostovanie, serverless funkcie, CDN nasadenie  
   **Očakávaný výsledok:** React UI s API backendom, automatické SSL, globálne CDN

### Pre stredne pokročilých
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokálne) ⭐⭐  
   Nasadiť GPT-4 s chat rozhraním a bezpečným manažmentom API kľúčov  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesiac  
   **Čo sa naučíte:** Nasadenie Azure OpenAI, integrácia Key Vault, sledovanie tokenov  
   **Očakávaný výsledok:** Funkčná chat aplikácia s GPT-4 a monitorovaním nákladov

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokálne) ⭐⭐⭐⭐  
   Produkčná multi-service architektúra  
   **Čas:** 45-60 minút | **Náklady:** $50-150/mesiac  
   **Čo sa naučíte:** Komunikácia služieb, message queuing, distribuované trasovanie  
   **Očakávaný výsledok:** Systém z 2 služieb (API Gateway + Product Service) s monitorovaním

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikácia s C# API a Azure SQL databázou  
   **Čas:** 30-45 minút | **Náklady:** $20-80/mesiac  
   **Čo sa naučíte:** Entity Framework, migrácie databázy, zabezpečenie pripojení  
   **Očakávaný výsledok:** C# API s Azure SQL backendom, automatické nasadenie schémy

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP trigger-mi a Cosmos DB  
   **Čas:** 30-40 minút | **Náklady:** $10-40/mesiac  
   **Čo sa naučíte:** Event-driven architektúra, serverless škálovanie, NoSQL integrácia  
   **Očakávaný výsledok:** Function app reagujúca na HTTP požiadavky s uložením v Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-service Java aplikácia s Container Apps a API gateway  
   **Čas:** 60-90 minút | **Náklady:** $80-200/mesiac  
   **Čo sa naučíte:** Nasadenie Spring Boot, service mesh, load balancing  
   **Očakávaný výsledok:** Viacslužbový Java systém s discovery a routovaním

### Microsoft Foundry šablóny

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletné nasadenie GPT-4 s chat rozhraním  
   **Čas:** 35-45 minút | **Náklady:** $50-200/mesiac  
   **Očakávaný výsledok:** Funkčná chat aplikácia so sledovaním tokenov a nákladov

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentná chat aplikácia s RAG architektúrou  
   **Čas:** 60-90 minút | **Náklady:** $100-300/mesiac  
   **Očakávaný výsledok:** Chat rozhranie poháňané RAG s vyhľadávaním dokumentov a citáciami

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentov pomocou Azure AI služieb  
   **Čas:** 40-60 minút | **Náklady:** $20-80/mesiac  
   **Očakávaný výsledok:** API extrahujúce text, tabuľky a entity z nahraných dokumentov

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps pracovný tok s Azure Machine Learning  
   **Čas:** 2-3 hodiny | **Náklady:** $150-500/mesiac  
   **Očakávaný výsledok:** Automatizovaný ML pipeline s trénovaním, nasadením a monitorovaním

### Scenáre z reálneho sveta

#### **Riešenie Retail Multi-Agent** 🆕
**[Kompletný sprievodca implementáciou](./retail-scenario.md)**

Komplexné, produkčné multi-agentné riešenie zákazníckej podpory, ktoré demonštruje nasadenie podnikovej AI aplikácie pomocou AZD. Tento scenár poskytuje:

- **Kompletná architektúra**: Systém s viacerými agentmi so špecializovanými agentmi pre zákaznícky servis a správu zásob
- **Produkčná infraštruktúra**: Multi-regionálne nasadenia Azure OpenAI, AI Search, Container Apps a komplexné monitorovanie
- **ARM šablóna pripravená na nasadenie**: Nasadenie na jedno kliknutie s viacerými režimami konfigurácie (Minimal/Standard/Premium)
- **Pokročilé funkcie**: Red teaming bezpečnostná validácia, rámec hodnotenia agentov, optimalizácia nákladov a návody na riešenie problémov
- **Reálny obchodný kontext**: Použitie v zákazníckej podpore maloobchodníka s nahrávaním súborov, integráciou vyhľadávania a dynamickým škálovaním

**Technológie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Zložitosť**: ⭐⭐⭐⭐ (Pokročilé - Pripravené do podnikovej produkcie)

**Vhodné pre**: AI vývojárov, riešenových architektov a tímy budujúce produkčné multi-agentné systémy

**Rýchly štart**: Nasadte kompletné riešenie za menej ako 30 minút pomocou priloženej ARM šablóny s `./deploy.sh -g myResourceGroup`

## 📋 Inštrukcie použitia

### Požiadavky

Pred spustením akéhokoľvek príkladu:
- ✅ Predplatné Azure s prístupom Owner alebo Contributor
- ✅ Azure Developer CLI nainštalovaný ([Návod na inštaláciu](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop spustený (pre príklady s kontajnermi)
- ✅ Primerané kvóty Azure (skontrolujte požiadavky špecifické pre príklad)

> **💰 Varovanie o nákladoch:** Všetky príklady vytvárajú skutočné Azure zdroje, ktoré generujú poplatky. Pozrite si jednotlivé súbory README pre odhad nákladov. Nezabudnite spustiť `azd down` po dokončení, aby ste predišli priebežným poplatkom.

### Spúšťanie príkladov lokálne

1. **Klonovať alebo skopírovať príklad**
   ```bash
   # Prejdite na požadovaný príklad
   cd examples/simple-web-app
   ```

2. **Inicializovať AZD prostredie**
   ```bash
   # Inicializujte pomocou existujúcej šablóny
   azd init
   
   # Alebo vytvorte nové prostredie
   azd env new my-environment
   ```

3. **Nakonfigurovať prostredie**
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
   # Získajte koncové body služby
   azd env get-values
   
   # Otestujte koncový bod (príklad)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Očakávané indikátory úspechu:**
   - ✅ `azd up` dokončený bez chýb
   - ✅ Endpunkt služby vracia HTTP 200
   - ✅ Azure Portal zobrazuje stav "Running"
   - ✅ Application Insights prijíma telemetriu

> **⚠️ Problémy?** Pozrite si [Bežné problémy](../docs/chapter-07-troubleshooting/common-issues.md) pre riešenie problémov pri nasadení

### Prispôsobenie príkladov

Každý príklad obsahuje:
- **README.md** - Podrobné inštrukcie na nastavenie a prispôsobenie
- **azure.yaml** - AZD konfigurácia s komentármi
- **infra/** - Bicep šablóny s vysvetlením parametrov
- **src/** - Ukážkový aplikačný kód
- **scripts/** - Pomocné skripty pre bežné úlohy

## 🎯 Ciele učenia

### Kategórie príkladov

#### **Základné nasadenia**
- Jednoslužbové aplikácie
- Jednoduché vzory infraštruktúry
- Základné riadenie konfigurácie
- Nákladovo efektívne vývojové nastavenia

#### **Pokročilé scenáre**
- Viacslužbové architektúry
- Zložité sieťové konfigurácie
- Vzory integrácie databáz
- Implementácie bezpečnosti a súladu

#### **Vzorové postupy pripravené do produkcie**
- Konfigurácie vysokého dostupnosti
- Monitorovanie a pozorovateľnosť
- Integrácia CI/CD
- Nastavenia pre obnovu po havárii

## 📖 Popisy príkladov

### Jednoduchá webová aplikácia - Node.js Express
**Technológie**: Node.js, Express, MongoDB, Container Apps  
**Zložitosť**: Začiatočník  
**Koncepty**: Základné nasadenie, REST API, integrácia NoSQL databázy

### Statická webová stránka - React SPA
**Technológie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Zložitosť**: Začiatočník  
**Koncepty**: Statické hostovanie, serverless backend, moderný webový vývoj

### Container App - Python Flask
**Technológie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Zložitosť**: Začiatočník  
**Koncepty**: Kontajnerizácia, REST API, scale-to-zero, health probe, monitorovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/simple-flask-api)

### Container App - Mikroservisy
**Technológie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Zložitosť**: Pokročilé  
**Koncepty**: Viacslužbová architektúra, komunikácia služieb, zaškrcovanie správ, distribuované trasovanie  
**Umiestnenie**: [Lokálny príklad](../../../examples/container-app/microservices)

### Aplikačná databáza - C# s Azure SQL
**Technológie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Entity Framework, pripojenia k databáze, vývoj webového API

### Serverless funkcia - Python Azure Functions
**Technológie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Event-driven architektúra, serverless výpočty, full-stack vývoj

### Mikroservisy - Java Spring Boot
**Technológie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Komunikácia mikroservisov, distribuované systémy, podnikové vzory

### Microsoft Foundry príklady

#### Azure OpenAI Chat App
**Technológie**: Azure OpenAI, Cognitive Search, App Service  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: RAG architektúra, vektorové vyhľadávanie, integrácia LLM

#### AI spracovanie dokumentov
**Technológie**: Azure AI Document Intelligence, Storage, Functions  
**Zložitosť**: Stredne pokročilé  
**Koncepty**: Analýza dokumentov, OCR, extrakcia dát

#### Pipeline strojového učenia
**Technológie**: Azure ML, MLOps, Container Registry  
**Zložitosť**: Pokročilé  
**Koncepty**: Tréning modelov, nasadzovacie pipeline, monitorovanie

## 🛠 Príklady konfigurácií

Adresár `configurations/` obsahuje znovupoužiteľné komponenty:

### Konfigurácie prostredia
- Nastavenia vývojového prostredia
- Konfigurácie staging prostredia
- Konfigurácie pripravené do produkcie
- Nastavenia pre multi-regionálne nasadenie

### Bicep moduly
- Znovupoužiteľné infraštruktúrne komponenty
- Bežné vzory zdrojov
- Šablóny tvrdené pre bezpečnosť
- Konfigurácie optimalizované pre náklady

### Pomocné skripty
- Automatizácia nastavenia prostredia
- Skripty migrácie databázy
- Nástroje na validáciu nasadenia
- Utility na monitorovanie nákladov

## 🔧 Návod na prispôsobenie

### Prispôsobenie príkladov pre váš prípad použitia

1. **Skontrolujte požiadavky**
   - Overte požiadavky služieb Azure
   - Skontrolujte limity predplatného
   - Pochopte dopady na náklady

2. **Upravte konfiguráciu**
   - Aktualizujte definície služieb v `azure.yaml`
   - Prispôsobte Bicep šablóny
   - Upravte premenné prostredia

3. **Dôkladne otestujte**
   - Najprv nasadiť do vývojového prostredia
   - Validovať funkčnosť
   - Otestovať škálovanie a výkon

4. **Bezpečnostné preskúmanie**
   - Skontrolujte prístupové kontroly
   - Implementujte správu tajomstiev
   - Aktivujte monitorovanie a alerty

## 📊 Porovnávacia matica

| Príklad | Služby | Databáza | Autentifikácia | Monitorovanie | Zložitosť |
|---------|--------|----------|----------------|---------------|-----------|
| **Azure OpenAI Chat** (Local) | 2 | ❌ | Key Vault | Plné | ⭐⭐ |
| **Python Flask API** (Local) | 1 | ❌ | Základné | Plné | ⭐ |
| **Microservices** (Local) | 5+ | ✅ | Podnikové | Pokročilé | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Základné | Základné | ⭐ |
| React SPA + Functions | 3 | ✅ | Základné | Plné | ⭐ |
| Python Flask Container | 2 | ❌ | Základné | Plné | ⭐ |
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Plné | Plné | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Základné | Plné | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Local) | **8+** | **✅** | **Podnikové** | **Pokročilé** | **⭐⭐⭐⭐** |

## 🎓 Vzdelávacia cesta

### Odporúčaný postup

1. **Začnite s Jednoduchou webovou aplikáciou**
   - Naučte sa základné koncepty AZD
   - Pochopte pracovný tok nasadenia
   - Precvičujte správu prostredí

2. **Vyskúšajte statickú stránku**
   - Preskúmajte rôzne možnosti hostingu
   - Naučte sa o integrácii CDN
   - Pochopte konfiguráciu DNS

3. **Prejdite na Container App**
   - Naučte sa základy kontajnerizácie
   - Pochopte koncepty škálovania
   - Precvičujte prácu s Dockerom

4. **Pridajte integráciu databázy**
   - Naučte sa provisioning databázy
   - Pochopte connection stringy
   - Precvičujte správu tajomstiev

5. **Preskúmajte serverless**
   - Pochopte event-driven architektúru
   - Naučte sa o triggeroch a bindings
   - Precvičujte prácu s API

6. **Budujte mikroservisy**
   - Naučte sa komunikáciu služieb
   - Pochopte distribuované systémy
   - Precvičujte zložité nasadenia

## 🔍 Ako nájsť správny príklad

### Podľa technologického stacku
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontajnery**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databázy**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systémy**: **Retail Multi-Agent Solution**
- **OpenAI Integrácia**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Podniková produkcia**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podľa architektonického vzoru
- **Jednoduché REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statické + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisy**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontajnerizované**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **S podporou AI**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-agentná architektúra**: **Retail Multi-Agent Solution**
- **Podnikové viacslužbové**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podľa úrovne zložitosti
- **Začiatočník**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Stredne pokročilé**: **[Azure OpenAI Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Pokročilé**: ML Pipeline
- **Pripravené do podnikovej produkcie**: [Microservices (Local)](../../../examples/container-app/microservices) (Viacslužbové s message queuing), **Retail Multi-Agent Solution** (Kompletný multi-agentný systém s ARM šablónou na nasadenie)

## 📚 Dodatočné zdroje

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
- [Todo aplikácia s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webová aplikácia s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Úloha Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions v Jave](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najlepšie postupy
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Príspevky s príkladmi

Máte užitočný príklad, ktorý chcete zdieľať? Vítame príspevky!

### Pokyny na odoslanie
1. Dodržujte zabehnutú štruktúru adresárov
2. Priložte podrobný README.md
3. Pridajte komentáre do konfiguračných súborov
4. Dôkladne otestujte pred odoslaním
5. Uveďte odhady nákladov a predpoklady

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

**Tip od odborníka**: Začnite s najjednoduchším príkladom, ktorý zodpovedá vášmu technologickému stacku, a potom postupne prejdite na zložitejšie scenáre. Každý príklad nadväzuje na koncepty z predchádzajúcich!

## 🚀 Pripravení začať?

### Váš učebný plán

1. **Úplný začiatočník?** → Začnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Máte základné znalosti AZD?** → Vyskúšajte [Mikroslužby](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Vytvárate AI aplikácie?** → Začnite s [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) alebo preskúmajte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodín)
4. **Potrebujete konkrétny technologický stack?** → Využite sekciu [Nájdenie správneho príkladu](../../../examples) vyššie

### Ďalšie kroky

- ✅ Skontrolujte [Predpoklady](../../../examples) vyššie
- ✅ Vyberte príklad zodpovedajúci vašej úrovni (pozrite si [Legendu zložitosti](../../../examples))
- ✅ Pred nasadením si dôkladne prečítajte README príkladu
- ✅ Nastavte si pripomienku spustiť `azd down` po testovaní
- ✅ Podeľte sa o svoje skúsenosti cez GitHub Issues alebo Discussions

### Potrebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Odpovede na bežné otázky
- 🐛 [Sprievodca riešením problémov](../docs/chapter-07-troubleshooting/common-issues.md) - Opravte problémy s nasadením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Pýtajte sa komunity
- 📚 [Študijný sprievodca](../resources/study-guide.md) - Prehĺbte si vedomosti

---

**Navigácia**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Študijné materiály**: [Študijný sprievodca](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Glossary](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Riešenie problémov](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Naposledy aktualizované: november 2025 | [Nahlásiť problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Prispieť príklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Upozornenie:
Tento dokument bol preložený pomocou AI prekladateľskej služby Co-op Translator (https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatizované preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za rozhodujúci (autoritatívny) zdroj. Pre dôležité informácie sa odporúča profesionálny ľudský preklad. Nezodpovedáme za žiadne nedorozumenia alebo nesprávne interpretácie, ktoré vyplývajú z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->