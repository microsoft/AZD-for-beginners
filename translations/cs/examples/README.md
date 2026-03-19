# Příklady - Praktické šablony a konfigurace AZD

**Učení podle příkladů - uspořádáno podle kapitol**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Mapování kapitol**: Příklady uspořádané podle složitosti
- **🚀 Lokální příklad**: [Řešení Multi-Agent pro maloobchod](retail-scenario.md)
- **🤖 Externí příklady AI**: Odkazy na repozitáře Azure Samples

> **📍 DŮLEŽITÉ: Lokální vs externí příklady**  
> Tento repozitář obsahuje **4 kompletní lokální příklady** s plnou implementací:  
> - **Microsoft Foundry Models Chat** (nasazení gpt-4.1 s chatovacím rozhraním)  
> - **Container Apps** (Jednoduché Flask API + mikroservisy)  
> - **Database App** (Web + SQL databáze)  
> - **Retail Multi-Agent** (podnikové AI řešení)  
>   
> Další příklady jsou **externí odkazy** na repozitáře Azure-Samples, které si můžete klonovat.

## Úvod

Tento adresář poskytuje praktické příklady a odkazy, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického procvičování. Scénář Retail Multi-Agent je kompletní, připravená implementace pro produkční nasazení, zahrnutá v tomto repozitáři. Další příklady odkazují na oficiální Azure Samples, které demonstrují různé vzory AZD.

### Legenda hodnocení složitosti

- ⭐ **Začátečník** - Základní pojmy, jedna služba, 15–30 minut
- ⭐⭐ **Středně pokročilý** - Více služeb, integrace databáze, 30–60 minut
- ⭐⭐⭐ **Pokročilý** - Složitá architektura, integrace AI, 1–2 hodiny
- ⭐⭐⭐⭐ **Expert** - Produkční připravenost, podnikové vzory, 2+ hodin

## 🎯 Co se vlastně nachází v tomto repozitáři

### ✅ Lokální implementace (připraveno k použití)

#### [Chatovací aplikace Microsoft Foundry Models](azure-openai-chat/README.md) 🆕
**Kompletní nasazení gpt-4.1 s chatovacím rozhraním zahrnuté v tomto repozitáři**

- **Umístění:** `examples/azure-openai-chat/`
- **Složitost:** ⭐⭐ (Středně pokročilý)
- **Co je zahrnuto:**
  - Kompletní nasazení Microsoft Foundry Models (gpt-4.1)
  - Chatovací rozhraní v Pythonu pro příkazovou řádku
  - Integrace s Key Vault pro bezpečné uložení API klíčů
  - Bicep šablony infrastruktury
  - Sledování využití tokenů a nákladů
  - Omezení rychlosti a zpracování chyb

**Rychlý start:**
```bash
# Přejděte do adresáře example
cd examples/azure-openai-chat

# Nasaďte vše
azd up

# Nainstalujte závislosti a začněte chatovat
pip install -r src/requirements.txt
python src/chat.py
```

**Technologie:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Příklady Container App](container-app/README.md) 🆕
**Komplexní příklady nasazení kontejnerů zahrnuté v tomto repozitáři**

- **Umístění:** `examples/container-app/`
- **Složitost:** ⭐-⭐⭐⭐⭐ (Od začátečníka po experta)
- **Co je zahrnuto:**
  - [Hlavní průvodce](container-app/README.md) - Kompletní přehled nasazení kontejnerů
  - [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) - Základní příklad REST API
  - [Architektura mikroservisů](../../../examples/container-app/microservices) - Nasazení více služeb připravené pro produkci
  - Rychlý start, produkční a pokročilé vzory
  - Monitoring, zabezpečení a optimalizace nákladů

**Rychlý start:**
```bash
# Zobrazit hlavní příručku
cd examples/container-app

# Nasadit jednoduché API ve Flasku
cd simple-flask-api
azd up

# Nasadit příklad mikroslužeb
cd ../microservices
azd up
```

**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Řešení Multi-Agent pro maloobchod](retail-scenario.md) 🆕
**Kompletní implementace připravená pro produkci zahrnutá v tomto repozitáři**

- **Umístění:** `examples/retail-multiagent-arm-template/`
- **Složitost:** ⭐⭐⭐⭐ (Pokročilý)
- **Co je zahrnuto:**
  - Kompletní ARM šablona nasazení
  - Architektura s více agenty (Zákazník + Sklad)
  - Integrace Microsoft Foundry Models
  - AI Search s RAG
  - Komplexní monitoring
  - Skript pro nasazení jedním kliknutím

**Rychlý start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externí ukázky Azure (klonovat pro použití)

Následující příklady jsou udržovány v oficiálních repozitářích Azure-Samples. Klonujte je a prozkoumejte různé vzory AZD:

### Jednoduché aplikace (kapitoly 1-2)

| Šablona | Repozitář | Složitost | Služby |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Místní: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Místní: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Víceslužbová architektura, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jak používat:**
```bash
# Klonujte libovolný příklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadit
azd up
```

### AI příklady aplikací (kapitoly 2, 5, 8)

| Šablona | Repozitář | Složitost | Zaměření |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Místní: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | nasazení gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základní AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rámec agentů |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | vzor RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databáze & pokročilé vzory (kapitoly 3-8)

| Šablona | Repozitář | Složitost | Zaměření |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrace databáze |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Více služeb |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Výukové cíle

Prací na těchto příkladech si:
- Procvičíte pracovní postupy Azure Developer CLI pomocí realistických aplikačních scénářů
- Porozumíte různým aplikačním architekturám a jejich azd implementacím
- Ovládnete vzory Infrastructure as Code pro různé služby Azure
- Aplikujete správu konfigurací a strategie nasazení specifické pro prostředí
- Implementujete monitoring, zabezpečení a škálovací vzory v praktických kontextech
- Získáte zkušenosti s řešením problémů a laděním reálných nasazovacích scénářů

## Očekávané výsledky

Po dokončení těchto příkladů budete schopni:
- S jistotou nasazovat různé typy aplikací pomocí Azure Developer CLI
- Přizpůsobit poskytnuté šablony požadavkům vaší aplikace
- Navrhovat a implementovat vlastní vzory infrastruktury pomocí Bicep
- Konfigurovat složité více-službové aplikace se správnými závislostmi
- Aplikovat bezpečnostní, monitorovací a výkonové nejlepší praktiky v reálných scénářích
- Řešit a optimalizovat nasazení na základě praktických zkušeností

## Struktura adresářů

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

## Rychlé startovací příklady

> **💡 Nový v AZD?** Začněte příkladem č. 1 (Flask API) - zabere ~20 minut a naučí základní koncepty.

### Pro začátečníky
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Místní) ⭐  
   Nasadí jednoduché REST API s scale-to-zero  
   **Čas:** 20–25 minut | **Náklady:** $0–5/měsíc  
   **Co se naučíte:** Základní azd workflow, kontejnerizace, health probes  
   **Očekávaný výsledek:** Funkční API endpoint vracející "Hello, World!" s monitoringem

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadí webovou aplikaci Node.js Express s MongoDB  
   **Čas:** 25–35 minut | **Náklady:** $10–30/měsíc  
   **Co se naučíte:** Integrace databáze, proměnné prostředí, connection strings  
   **Očekávaný výsledek:** Aplikace Todo s funkcemi vytvoření/čtení/úpravy/smazání

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostování React statické webové aplikace pomocí Azure Static Web Apps  
   **Čas:** 20–30 minut | **Náklady:** $0–10/měsíc  
   **Co se naučíte:** Statické hostování, serverless funkce, nasazení na CDN  
   **Očekávaný výsledek:** React UI s backendovým API, automatické SSL, globální CDN

### Pro středně pokročilé
4. **[Chatovací aplikace Microsoft Foundry Models](../../../examples/azure-openai-chat)** (Místní) ⭐⭐  
   Nasadí gpt-4.1 s chatovacím rozhraním a bezpečnou správou API klíčů  
   **Čas:** 35–45 minut | **Náklady:** $50–200/měsíc  
   **Co se naučíte:** Nasazení Microsoft Foundry Models, integrace Key Vault, sledování tokenů  
   **Očekávaný výsledek:** Funkční chatovací aplikace s gpt-4.1 a monitorováním nákladů

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Místní) ⭐⭐⭐⭐  
   Produkčně připravená víceslužbová architektura  
   **Čas:** 45–60 minut | **Náklady:** $50–150/měsíc  
   **Co se naučíte:** Komunikace mezi službami, fronty zpráv, distribuované traceování  
   **Očekávaný výsledek:** Systém se 2 službami (API Gateway + Product Service) s monitoringem

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikace s C# API a Azure SQL Database  
   **Čas:** 30–45 minut | **Náklady:** $20–80/měsíc  
   **Co se naučíte:** Entity Framework, migrace databáze, zabezpečení připojení  
   **Očekávaný výsledek:** C# API s Azure SQL backendem a automatickým deployem schématu

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggerem a Cosmos DB  
   **Čas:** 30–40 minut | **Náklady:** $10–40/měsíc  
   **Co se naučíte:** Event-driven architektura, serverless škálování, NoSQL integrace  
   **Očekávaný výsledek:** Function app reagující na HTTP požadavky s úložištěm v Cosmos DB

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Víceslužbová Java aplikace s Container Apps a API gateway  
   **Čas:** 60–90 minut | **Náklady:** $80–200/měsíc  
   **Co se naučíte:** Nasazení Spring Boot, service mesh, load balancing  
   **Očekávaný výsledek:** Víceslužbový Java systém s objevováním služeb a směrováním

### Šablony Microsoft Foundry

1. **[Chatovací aplikace Microsoft Foundry Models - Lokální příklad](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletní nasazení gpt-4.1 s chatovacím rozhraním  
   **Čas:** 35–45 minut | **Náklady:** $50–200/měsíc  
   **Očekávaný výsledek:** Funkční chatovací aplikace se sledováním tokenů a monitorováním nákladů

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentní chatovací aplikace s RAG architekturou  
   **Čas:** 60–90 minut | **Náklady:** $100–300/měsíc  
   **Očekávaný výsledek:** Chat rozhraní poháněné RAG s vyhledáváním dokumentů a citacemi

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentů pomocí služeb Azure AI  
   **Čas:** 40–60 minut | **Náklady:** $20–80/měsíc  
   **Očekávaný výsledek:** API extrahující text, tabulky a entity ze nahraných dokumentů

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow s Azure Machine Learning  
   **Čas:** 2–3 hodiny | **Náklady:** $150–500/měsíc  
   **Očekávaný výsledek:** Automatizovaný ML pipeline s tréninkem, nasazením a monitoringem

### Scénáře z reálného světa

#### **Řešení Multi-Agent pro maloobchod** 🆕  
**[Kompletní průvodce implementací](./retail-scenario.md)**

Komplexní, produkčně připravené řešení zákaznické podpory s více agenty, které demonstruje nasazení podnikových AI aplikací pomocí AZD. Tento scénář poskytuje:
- **Kompletní architektura**: Systém více agentů se specializovanými agenty pro zákaznickou podporu a správu zásob
- **Produkční infrastruktura**: Nasazení Microsoft Foundry Models v několika regionech, Azure AI Search, Container Apps a komplexní monitorování
- **Připravená k nasazení ARM šablona**: Nasazení jedním kliknutím s více režimy konfigurace (Minimal/Standard/Premium)
- **Pokročilé funkce**: Validace zabezpečení red teaming, rámec pro hodnocení agentů, optimalizace nákladů a průvodci řešením problémů
- **Skutečný obchodní kontext**: Případ použití zákaznické podpory pro maloobchodníka s nahráváním souborů, integrací vyhledávání a dynamickým škálováním

**Technologie**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složitost**: ⭐⭐⭐⭐ (Pokročilé - připravené pro podnikové produkční nasazení)

**Ideální pro**: vývojáře AI, architekty řešení a týmy budující produkční systémy s více agenty

**Rychlý start**: Nasadíte kompletní řešení za méně než 30 minut pomocí přiložené ARM šablony s `./deploy.sh -g myResourceGroup`

## 📋 Pokyny k použití

### Požadavky

Před spuštěním jakéhokoli příkladu:
- ✅ Azure subscription s přístupem Owner nebo Contributor
- ✅ Azure Developer CLI nainstalovaný ([Průvodce instalací](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop spuštěný (pro příklady s kontejnery)
- ✅ Vhodné kvóty v Azure (zkontrolujte požadavky konkrétního příkladu)

> **💰 Upozornění na náklady:** Všechny příklady vytvářejí reálné Azure zdroje, které generují poplatky. Podívejte se do jednotlivých README souborů pro odhad nákladů. Nezapomeňte spustit `azd down` po dokončení, abyste se vyhnuli průběžným nákladům.

### Spouštění příkladů lokálně

1. **Klonovat nebo zkopírovat příklad**
   ```bash
   # Přejděte na požadovaný příklad
   cd examples/simple-web-app
   ```

2. **Inicializovat AZD prostředí**
   ```bash
   # Inicializovat pomocí existující šablony
   azd init
   
   # Nebo vytvořit nové prostředí
   azd env new my-environment
   ```

3. **Konfigurovat prostředí**
   ```bash
   # Nastavte požadované proměnné
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Nasadit**
   ```bash
   # Nasadit infrastrukturu a aplikaci
   azd up
   ```

5. **Ověřit nasazení**
   ```bash
   # Získat koncové body služby
   azd env get-values
   
   # Otestovat koncový bod (příklad)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Očekávané ukazatele úspěchu:**
   - ✅ `azd up` dokončí bez chyb
   - ✅ Koncový bod služby vrací HTTP 200
   - ✅ Azure Portal zobrazuje stav "Running"
   - ✅ Application Insights přijímá telemetrii

> **⚠️ Problémy?** Viz [Běžné problémy](../docs/chapter-07-troubleshooting/common-issues.md) pro řešení problémů s nasazením

### Úprava příkladů

Každý příklad obsahuje:
- **README.md** - Podrobné pokyny pro nastavení a přizpůsobení
- **azure.yaml** - Konfigurace AZD s komentáři
- **infra/** - Bicep šablony s vysvětlením parametrů
- **src/** - Ukázkový kód aplikace
- **scripts/** - Pomocné skripty pro běžné úkoly

## 🎯 Cíle učení

### Kategorie příkladů

#### **Základní nasazení**
- Aplikace s jednou službou
- Jednoduché infrastrukturní vzory
- Základní správa konfigurace
- Nákladově efektivní nastavení pro vývoj

#### **Pokročilé scénáře**
- Architektury s více službami
- Komplexní síťové konfigurace
- Vzory integrace databází
- Implementace bezpečnosti a souladu

#### **Vzorové postupy připravené pro produkci**
- Konfigurace vysoké dostupnosti
- Monitorování a pozorovatelnost
- Integrace CI/CD
- Nastavení obnovy po havárii

## 📖 Popisy příkladů

### Jednoduchá webová aplikace - Node.js Express
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Složitost**: Začátečník  
**Koncepty**: Základní nasazení, REST API, integrace NoSQL databáze

### Statická webová aplikace - React SPA
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složitost**: Začátečník  
**Koncepty**: Statické hostování, serverless backend, moderní webový vývoj

### Container App - Python Flask
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složitost**: Začátečník  
**Koncepty**: Kontejnerizace, REST API, scale-to-zero, health probes, monitoring  
**Umístění**: [Lokální příklad](../../../examples/container-app/simple-flask-api)

### Container App - Architektura mikroslužeb
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složitost**: Pokročilé  
**Koncepty**: Architektura s více službami, komunikace mezi službami, fronty zpráv, distribuované traceování  
**Umístění**: [Lokální příklad](../../../examples/container-app/microservices)

### Aplikaace s databází - C# s Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složitost**: Středně pokročilé  
**Koncepty**: Entity Framework, připojení k databázi, vývoj webového API

### Serverless Function - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složitost**: Středně pokročilé  
**Koncepty**: Event-driven architektura, serverless výpočty, full-stack vývoj

### Mikroslužby - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složitost**: Středně pokročilé  
**Koncepty**: Komunikace mikroslužeb, distribuované systémy, podnikové vzory

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologie**: Microsoft Foundry Models, Cognitive Search, App Service  
**Složitost**: Středně pokročilé  
**Koncepty**: RAG architektura, vektorové vyhledávání, integrace LLM

#### AI Document Processing
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Složitost**: Středně pokročilé  
**Koncepty**: Analýza dokumentů, OCR, extrakce dat

#### Machine Learning Pipeline
**Technologie**: Azure ML, MLOps, Container Registry  
**Složitost**: Pokročilé  
**Koncepty**: Trénování modelů, nasazovací pipeline, monitorování

## 🛠 Příklady konfigurací

Adresář `configurations/` obsahuje znovupoužitelné komponenty:

### Konfigurace prostředí
- Nastavení vývojového prostředí
- Konfigurace staging prostředí
- Konfigurace připravené pro produkci
- Nastavení pro nasazení do více regionů

### Bicep moduly
- Znovupoužitelné infrastrukturní komponenty
- Běžné vzory pro zdroje
- Bezpečnostně zpevněné šablony
- Nákladově optimalizované konfigurace

### Pomocné skripty
- Automatizace nastavení prostředí
- Skripty migrace databáze
- Nástroje pro validaci nasazení
- Utility pro monitorování nákladů

## 🔧 Průvodce přizpůsobením

### Úprava příkladů pro vaše použití

1. **Zkontrolujte požadavky**
   - Prověřte požadavky služeb Azure
   - Ověřte limity předplatného
   - Pochopte dopady na náklady

2. **Upravte konfiguraci**
   - Aktualizujte definice služeb v `azure.yaml`
   - Přizpůsobte Bicep šablony
   - Upravte proměnné prostředí

3. **Důkladně testujte**
   - Nejprve nasadit do vývojového prostředí
   - Ověřit funkčnost
   - Testovat škálování a výkon

4. **Bezpečnostní přezkum**
   - Prověřte přístupy a oprávnění
   - Implementujte správu tajemství
   - Zapněte monitorování a alerty

## 📊 Matice porovnání

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

## 🎓 Studijní cesta

### Doporučené pořadí

1. **Začněte s Jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte workflow nasazení
   - Procvičujte správu prostředí

2. **Vyzkoušejte Statickou webovou aplikaci**
   - Prozkoumejte různé možnosti hostingu
   - Naučte se o integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na Container App**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičujte s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se provisioning databází
   - Pochopte connection strings
   - Procvičujte správu tajemství

5. **Prozkoumejte Serverless**
   - Pochopte event-driven architekturu
   - Naučte se o triggery a bindingy
   - Procvičujte s API

6. **Vytvořte mikroslužby**
   - Naučte se komunikaci služeb
   - Pochopte distribuované systémy
   - Procvičujte složitá nasazení

## 🔍 Nalezení správného příkladu

### Podle technologického stacku
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podle architektonického vzoru
- **Jednoduché REST API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statické + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroslužby**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontejnerizované**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-poháněné**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architektura více agentů**: **Retail Multi-Agent Solution**
- **Podniková multi-služba**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podle úrovně složitosti
- **Začátečník**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Středně pokročilé**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Pokročilé**: ML Pipeline
- **Připravené pro podnikové nasazení**: [Microservices (Local)](../../../examples/container-app/microservices) (víceslužbová architektura s frontami zpráv), **Retail Multi-Agent Solution** (Kompletní systém více agentů s ARM šablonou pro nasazení)

## 📚 Další zdroje

### Odkazy na dokumentaci
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Příklady od komunity
- [Šablony Azure Samples AZD](https://github.com/Azure-Samples/azd-templates)
- [Šablony Microsoft Foundry](https://github.com/Azure/ai-foundry-templates)
- [Galerie Azure Developer CLI](https://azure.github.io/awesome-azd/)
- [Todo aplikace s C# a Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo aplikace s Pythonem a MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo aplikace s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webová aplikace s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions v Javě](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Nejlepší postupy
- [Rámec Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Rámec pro zavádění cloudu](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Přispějte s příklady

Máte užitečný příklad, který chcete sdílet? Vítáme příspěvky!

### Pokyny pro zasílání
1. Dodržte zavedenou strukturu adresářů
2. Přiložte podrobný README.md
3. Přidejte komentáře do konfiguračních souborů
4. Pečlivě otestujte před odesláním
5. Uveďte odhad nákladů a předpoklady

### Struktura ukázkové šablony
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

**Užitečný tip**: Začněte s nejjednodušším příkladem, který odpovídá vašemu technologickému stacku, a poté postupně přecházejte k složitějším scénářům. Každý příklad staví na konceptech z předchozích!

## 🚀 Připraveni začít?

### Váš studijní plán

1. **Úplný začátečník?** → Začněte s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Máte základní znalosti AZD?** → Vyzkoušejte [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Vytváříte AI aplikace?** → Začněte s [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) nebo prozkoumejte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodin)
4. **Potřebujete konkrétní technologii?** → Použijte sekci [Finding the Right Example](#-finding-the-right-example) výše

### Další kroky

- ✅ Zkontrolujte [Požadavky](#požadavky) výše
- ✅ Vyberte příklad odpovídající vaší úrovni dovedností (viz [Legenda složitosti](#legenda-hodnocení-složitosti))
- ✅ Pečlivě si přečtěte README příkladu před nasazením
- ✅ Nastavte si připomenutí spustit `azd down` po testování
- ✅ Sdílejte své zkušenosti prostřednictvím GitHub Issues nebo Discussions

### Potřebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Často kladené otázky
- 🐛 [Průvodce řešením problémů](../docs/chapter-07-troubleshooting/common-issues.md) - Řešení problémů s nasazením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Zeptejte se komunity
- 📚 [Studijní průvodce](../resources/study-guide.md) - Posilte své učení

---

**Navigace**
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Studijní materiály**: [Studijní průvodce](../resources/study-guide.md) | [Rychlý přehled](../resources/cheat-sheet.md) | [Glosář](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Řešení problémů](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Poslední aktualizace: listopad 2025 | [Nahlásit problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Přispět příklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vyloučení odpovědnosti**:
Tento dokument byl přeložen pomocí služby pro automatický překlad [Co-op Translator](https://github.com/Azure/co-op-translator). I když usilujeme o přesnost, vezměte prosím na vědomí, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo chybné výklady vzniklé v důsledku použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->