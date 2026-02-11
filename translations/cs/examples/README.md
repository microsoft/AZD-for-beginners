# Příklady - Praktické šablony a konfigurace AZD

**Učení na příkladech - Organizováno podle kapitol**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Mapování kapitol**: Příklady organizované podle složitosti učení
- **🚀 Lokální příklad**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Externí příklady AI**: Odkazy na repozitáře Azure Samples

> **📍 DŮLEŽITÉ: Lokální vs externí příklady**  
> Tento repozitář obsahuje **4 kompletní lokální příklady** s plnými implementacemi:  
> - **Azure OpenAI Chat** (nasazení GPT-4 s chatovacím rozhraním)  
> - **Container Apps** (Jednoduché Flask API + mikroslužby)  
> - **Database App** (Web + SQL databáze)  
> - **Retail Multi-Agent** (Enterprise AI řešení)  
>  
> Další příklady jsou **externí odkazy** na repozitáře Azure-Samples, které si můžete klonovat.

## Úvod

Tento adresář poskytuje praktické příklady a odkazy, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Scénář Retail Multi-Agent je kompletní implementací připravenou pro produkci, která je zahrnuta v tomto repozitáři. Další příklady odkazují na oficiální Azure Samples, které demonstrují různé vzory AZD.

### Legenda hodnocení složitosti

- ⭐ **Začátečník** - Základní koncepty, jedna služba, 15-30 minut
- ⭐⭐ **Středně pokročilý** - Více služeb, integrace databáze, 30-60 minut
- ⭐⭐⭐ **Pokročilý** - Komplexní architektura, integrace AI, 1-2 hodiny
- ⭐⭐⭐⭐ **Expert** - Připravené pro produkci, podnikové vzory, 2+ hodiny

## 🎯 Co se vlastně nachází v tomto repozitáři

### ✅ Lokální implementace (připraveno k použití)

#### [Aplikace Azure OpenAI Chat](azure-openai-chat/README.md) 🆕
**Kompletní nasazení GPT-4 s chatovacím rozhraním zahrnuté v tomto repozitáři**

- **Umístění:** `examples/azure-openai-chat/`
- **Složitost:** ⭐⭐ (Středně pokročilý)
- **Co je zahrnuto:**
  - Kompletní nasazení Azure OpenAI (GPT-4)
  - Chatovací rozhraní příkazového řádku v Pythonu
  - Integrace Key Vault pro zabezpečené API klíče
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

**Technologie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Příklady Container App](container-app/README.md) 🆕
**Komplexní příklady nasazení kontejnerů zahrnuté v tomto repozitáři**

- **Umístění:** `examples/container-app/`
- **Složitost:** ⭐-⭐⭐⭐⭐ (Od začátečníka po pokročilého)
- **Co je zahrnuto:**
  - [Hlavní průvodce](container-app/README.md) - Kompletní přehled nasazení kontejnerů
  - [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) - Základní příklad REST API
  - [Architektura mikroslužeb](../../../examples/container-app/microservices) - Produkčně připravené víceslužbové nasazení
  - Rychlý start, produkční a pokročilé vzory
  - Monitoring, zabezpečení a optimalizace nákladů

**Rychlý start:**
```bash
# Zobrazit hlavního průvodce
cd examples/container-app

# Nasadit jednoduché Flask API
cd simple-flask-api
azd up

# Nasadit příklad mikroslužeb
cd ../microservices
azd up
```

**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Řešení Retail Multi-Agent](retail-scenario.md) 🆕
**Kompletní implementace připravená pro produkci zahrnutá v tomto repozitáři**

- **Umístění:** `examples/retail-multiagent-arm-template/`
- **Složitost:** ⭐⭐⭐⭐ (Pokročilé)
- **Co je zahrnuto:**
  - Kompletní ARM šablona nasazení
  - Multiagentní architektura (Customer + Inventory)
  - Integrace Azure OpenAI
  - AI Search s RAG
  - Komplexní monitorování
  - Skript pro nasazení jedním kliknutím

**Rychlý start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologie:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externí ukázky Azure (naklonujte k použití)

Následující příklady jsou udržovány v oficiálních repozitářích Azure-Samples. Naklonujte je a prozkoumejte různé vzory AZD:

### Jednoduché aplikace (kapitoly 1-2)

| Šablona | Repozitář | Složitost | Služby |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokální: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroslužby** | [Lokální: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Více služeb, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jak používat:**
```bash
# Klonovat libovolný příklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadit
azd up
```

### Příklady AI aplikací (kapitoly 2, 5, 8)

| Šablona | Repozitář | Složitost | Zaměření |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokální: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Nasazení GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základní AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Framework agentů |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Vzor RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databáze a pokročilé vzory (kapitoly 3-8)

| Šablona | Repozitář | Složitost | Zaměření |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrace databáze |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Víceslužbové |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cíle učení

Prací na těchto příkladech budete:
- Procvičovat workflow Azure Developer CLI na realistických aplikačních scénářích
- Porozumět různým aplikačním architekturám a jejich implementacím v azd
- Ovládnout vzory Infrastructure as Code pro různé Azure služby
- Použít správu konfigurací a nasazení specifická pro prostředí
- Implementovat monitoring, zabezpečení a škálování v praktických kontextech
- Získat zkušenosti s řešením problémů a laděním reálných nasazení

## Výsledky učení

Po dokončení těchto příkladů budete schopni:
- Nasazovat různé typy aplikací pomocí Azure Developer CLI sebevědomě
- Přizpůsobit poskytnuté šablony vlastním požadavkům aplikace
- Navrhovat a implementovat vlastní infrastrukturní vzory pomocí Bicep
- Konfigurovat komplexní víceslužbové aplikace s patřičnými závislostmi
- Uplatnit bezpečnostní, monitorovací a výkonové osvědčené postupy v reálných scénářích
- Diagnostikovat a optimalizovat nasazení na základě praktických zkušeností

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

> **💡 Nový v AZD?** Začněte příkladem č. 1 (Flask API) - zabere ~20 minut a naučí vás základní koncepty.

### Pro začátečníky
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokální) ⭐  
   Nasadit jednoduché REST API s podporou scale-to-zero  
   **Čas:** 20-25 minut | **Cena:** $0-5/month  
   **Co se naučíte:** Základní azd workflow, kontejnerizace, health probe  
   **Očekávaný výsledek:** Funkční API endpoint vracející "Hello, World!" s monitoringem

2. **[Jednoduchá webová aplikace - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadit Node.js Express webovou aplikaci s MongoDB  
   **Čas:** 25-35 minut | **Cena:** $10-30/month  
   **Co se naučíte:** Integrace databáze, proměnné prostředí, connection stringy  
   **Očekávaný výsledek:** Aplikace Todo s funkcemi create/read/update/delete

3. **[Statická stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostovat React statickou stránku s Azure Static Web Apps  
   **Čas:** 20-30 minut | **Cena:** $0-10/month  
   **Co se naučíte:** Statické hostování, serverless funkce, nasazení CDN  
   **Očekávaný výsledek:** React UI s API backendem, automatické SSL, globální CDN

### Pro pokročilé uživatele
4. **[Aplikace Azure OpenAI Chat](../../../examples/azure-openai-chat)** (Lokální) ⭐⭐  
   Nasadit GPT-4 s chatovacím rozhraním a zabezpečeným řízením API klíčů  
   **Čas:** 35-45 minut | **Cena:** $50-200/month  
   **Co se naučíte:** Nasazení Azure OpenAI, integrace Key Vault, sledování tokenů  
   **Očekávaný výsledek:** Fungující chatovací aplikace s GPT-4 a monitorováním nákladů

5. **[Container App - Mikroslužby](../../../examples/container-app/microservices)** (Lokální) ⭐⭐⭐⭐  
   Produkčně připravená víceslužbová architektura  
   **Čas:** 45-60 minut | **Cena:** $50-150/month  
   **Co se naučíte:** Komunikace služeb, fronty zpráv, distribuované trasování  
   **Očekávaný výsledek:** Systém se 2 službami (API Gateway + Product Service) s monitoringem

6. **[Databázová aplikace - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikace s C# API a Azure SQL Database  
   **Čas:** 30-45 minut | **Cena:** $20-80/month  
   **Co se naučíte:** Entity Framework, migrace databáze, zabezpečení připojení  
   **Očekávaný výsledek:** C# API s Azure SQL backendem, automatické nasazení schématu

7. **[Serverless funkce - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggery a Cosmos DB  
   **Čas:** 30-40 minut | **Cena:** $10-40/month  
   **Co se naučíte:** Event-driven architektura, serverless škálování, NoSQL integrace  
   **Očekávaný výsledek:** Funkční aplikace reagující na HTTP požadavky s uložištěm v Cosmos DB

8. **[Mikroslužby - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Víceslužbová Java aplikace s Container Apps a API gateway  
   **Čas:** 60-90 minut | **Cena:** $80-200/month  
   **Co se naučíte:** Nasazení Spring Boot, service mesh, load balancing  
   **Očekávaný výsledek:** Víceslužbový Java systém s objevováním služeb a směrováním

### Šablony Microsoft Foundry

1. **[Aplikace Azure OpenAI Chat - lokální příklad](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletní nasazení GPT-4 s chatovacím rozhraním  
   **Čas:** 35-45 minut | **Cena:** $50-200/month  
   **Očekávaný výsledek:** Fungující chatovací aplikace se sledováním tokenů a nákladů

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentní chatovací aplikace s architekturou RAG  
   **Čas:** 60-90 minut | **Cena:** $100-300/month  
   **Očekávaný výsledek:** Chatovací rozhraní poháněné RAG s vyhledáváním dokumentů a citacemi

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentů pomocí Azure AI služeb  
   **Čas:** 40-60 minut | **Cena:** $20-80/month  
   **Očekávaný výsledek:** API extrahující text, tabulky a entity z nahraných dokumentů

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps workflow s Azure Machine Learning  
   **Čas:** 2-3 hodiny | **Cena:** $150-500/month  
   **Očekávaný výsledek:** Automatizovaný ML pipeline s tréninkem, nasazením a monitorováním

### Scénáře z reálného světa

#### **Řešení Retail Multi-Agent** 🆕
**[Kompletní průvodce implementací](./retail-scenario.md)**

Komplexní, produkčně připravené multiagentní řešení zákaznické podpory, které demonstruje nasazení enterprise-grade AI aplikací pomocí AZD. Tento scénář poskytuje:

- **Kompletní architekturu:** Multiagentní systém se specializovanými agenty pro zákaznický servis a správu zásob
- **Produkční infrastruktura**: Nasazení Azure OpenAI v několika regionech, Azure AI Search, Container Apps a komplexní monitorování
- **Připravená ARM šablona k nasazení**: Nasazení jedním kliknutím s několika režimy konfigurace (Minimal/Standard/Premium)
- **Pokročilé funkce**: red teaming ověření bezpečnosti, rámec pro hodnocení agentů, optimalizace nákladů a návody pro řešení problémů
- **Skutečný obchodní kontext**: Případ použití zákaznické podpory pro maloobchodníka s nahráváním souborů, integrací vyhledávání a dynamickým škálováním

**Technologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složitost**: ⭐⭐⭐⭐ (Pokročilé - připravené pro podnikové nasazení)

**Ideální pro**: AI vývojáře, architekty řešení a týmy budující produkční multi-agentní systémy

**Rychlý start**: Nasadíte kompletní řešení za méně než 30 minut pomocí přiložené ARM šablony s `./deploy.sh -g myResourceGroup`

## 📋 Pokyny k použití

### Požadavky

Před spuštěním jakéhokoli příkladu:
- ✅ Azure předplatné s přístupem Owner nebo Contributor
- ✅ Azure Developer CLI nainstalován ([Průvodce instalací](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop spuštěný (pro příklady s kontejnery)
- ✅ Vhodné kvóty Azure (zkontrolujte požadavky specifické pro příklad)

> **💰 Varování o nákladech:** Všechny příklady vytvářejí skutečné prostředky Azure, které budou účtovány. Podívejte se do jednotlivých README souborů pro odhad nákladů. Nezapomeňte po dokončení spustit `azd down`, aby nedocházelo k dalším poplatkům.

### Spouštění příkladů lokálně

1. **Klonovat nebo zkopírovat příklad**
   ```bash
   # Přejděte na požadovaný příklad
   cd examples/simple-web-app
   ```

2. **Inicializovat prostředí AZD**
   ```bash
   # Inicializovat pomocí existující šablony
   azd init
   
   # Nebo vytvořit nové prostředí
   azd env new my-environment
   ```

3. **Nakonfigurovat prostředí**
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
   - ✅ `azd up` proběhne bez chyb
   - ✅ Koncový bod služby vrací HTTP 200
   - ✅ Azure Portal zobrazuje stav "Running"
   - ✅ Application Insights přijímá telemetrii

> **⚠️ Máte problémy?** Viz [Běžné problémy](../docs/chapter-07-troubleshooting/common-issues.md) pro řešení problémů při nasazení

### Úprava příkladů

Každý příklad obsahuje:
- **README.md** - Podrobné instrukce pro nastavení a přizpůsobení
- **azure.yaml** - Konfigurace AZD s komentáři
- **infra/** - Bicep šablony s vysvětlením parametrů
- **src/** - Ukázkový aplikační kód
- **scripts/** - Pomocné skripty pro běžné úlohy

## 🎯 Výukové cíle

### Kategorie příkladů

#### **Základní nasazení**
- Aplikace s jednou službou
- Jednoduché vzory infrastruktury
- Základní správa konfigurace
- Nákladově efektivní nastavení pro vývoj

#### **Pokročilé scénáře**
- Architektury s více službami
- Komplexní síťové konfigurace
- Vzorové integrace databází
- Implementace bezpečnosti a souladu

#### **Vzory připravené pro produkci**
- Konfigurace vysoké dostupnosti
- Monitorování a observabilita
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
**Koncepty**: Statické hostování, serverless backend, moderní webový vývoj

### Aplikace v kontejneru - Python Flask
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složitost**: Začátečník  
**Koncepty**: Kontejnerizace, REST API, scale-to-zero, health probe, monitorování  
**Umístění**: [Lokální příklad](../../../examples/container-app/simple-flask-api)

### Container App - Mikroservisní architektura
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složitost**: Pokročilé  
**Koncepty**: Architektura s více službami, komunikace mezi službami, fronty zpráv, distribuce trasování  
**Umístění**: [Lokální příklad](../../../examples/container-app/microservices)

### Databázová aplikace - C# s Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složitost**: Středně pokročilé  
**Koncepty**: Entity Framework, připojení k databázi, vývoj webového API

### Serverless funkce - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složitost**: Středně pokročilé  
**Koncepty**: Event-driven architektura, serverless computing, full-stack vývoj

### Mikroservisy - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složitost**: Středně pokročilé  
**Koncepty**: Komunikace mikroservis, distribuované systémy, podnikové vzory

### Příklady Microsoft Foundry

#### Aplikace chatu Azure OpenAI
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Složitost**: Středně pokročilé  
**Koncepty**: Architektura RAG, vyhledávání vektorů, integrace LLM

#### Zpracování dokumentů pomocí AI
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Složitost**: Středně pokročilé  
**Koncepty**: Analýza dokumentů, OCR, extrakce dat

#### Pipeline strojového učení
**Technologie**: Azure ML, MLOps, Container Registry  
**Složitost**: Pokročilé  
**Koncepty**: Trénink modelů, nasazovací pipeline, monitorování

## 🛠 Příklady konfigurací

Adresář `configurations/` obsahuje znovupoužitelné komponenty:

### Konfigurace prostředí
- Nastavení vývojového prostředí
- Konfigurace testovacího/staging prostředí
- Konfigurace připravené pro produkci
- Nastavení nasazení do více regionů

### Bicep moduly
- Znovupoužitelné komponenty infrastruktury
- Běžné vzory zdrojů
- Šablony s posílenou bezpečností
- Konfigurace optimalizované pro náklady

### Pomocné skripty
- Automatizace nastavení prostředí
- Skripty migrace databází
- Nástroje pro validaci nasazení
- Utility pro sledování nákladů

## 🔧 Průvodce přizpůsobením

### Úprava příkladů pro váš případ použití

1. **Zkontrolujte požadavky**
   - Zkontrolujte požadavky služeb Azure
   - Ověřte limity předplatného
   - Pochopte dopad na náklady

2. **Upravte konfiguraci**
   - Aktualizujte definice služeb v `azure.yaml`
   - Přizpůsobte Bicep šablony
   - Upravte proměnné prostředí

3. **Důkladně otestujte**
   - Nejprve nasadit do vývojového prostředí
   - Ověřte funkčnost
   - Otestujte škálování a výkon

4. **Bezpečnostní kontrola**
   - Zkontrolujte přístupová práva
   - Implementujte správu tajemství
   - Povolte monitorování a upozornění

## 📊 Porovnávací matice

| Příklad | Služby | Databáze | Autentizace | Monitorování | Složitost |
|---------|--------|----------|-------------|--------------|----------|
| **Azure OpenAI Chat** (Lokální) | 2 | ❌ | Key Vault | Plné | ⭐⭐ |
| **Python Flask API** (Lokální) | 1 | ❌ | Základní | Plné | ⭐ |
| **Microservices** (Lokální) | 5+ | ✅ | Podnikové | Pokročilé | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Základní | Základní | ⭐ |
| React SPA + Functions | 3 | ✅ | Základní | Plné | ⭐ |
| Python Flask Container | 2 | ❌ | Základní | Plné | ⭐ |
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Plné | Plné | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Základní | Plné | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokální) | **8+** | **✅** | **Podnikové** | **Pokročilé** | **⭐⭐⭐⭐** |

## 🎓 Studijní cesta

### Doporučené pořadí

1. **Začněte s jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte workflow nasazení
   - Procvičte si správu prostředí

2. **Vyzkoušejte statickou webovou stránku**
   - Prozkoumejte různé možnosti hostování
   - Naučte se o integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na aplikaci v kontejneru**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičte si práci s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se provisionování databází
   - Pochopte connection stringy
   - Procvičte správu tajemství

5. **Prozkoumejte serverless**
   - Pochopte event-driven architekturu
   - Naučte se o triggerech a bindinzích
   - Procvičte si práci s API

6. **Vytvořte mikroservisy**
   - Naučte se komunikaci mezi službami
   - Pochopte distribuované systémy
   - Procvičte nasazení složitých řešení

## 🔍 Jak najít správný příklad

### Podle technologického stacku
- **Container Apps**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices (Lokální)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokální)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokální)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokální)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokální)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices (Lokální)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokální)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Řešení maloobchodního multi-agenta**
- **Multi-Agent Systems**: **Řešení maloobchodního multi-agenta**
- **OpenAI Integration**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, Řešení maloobchodního multi-agenta
- **Enterprise Production**: [Microservices (Lokální)](../../../examples/container-app/microservices), **Řešení maloobchodního multi-agenta**

### Podle architektonického vzoru
- **Simple REST API**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api)
- **Monolithic**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokální)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices (Lokální)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Řešení maloobchodního multi-agenta**
- **Multi-Agent Architecture**: **Řešení maloobchodního multi-agenta**
- **Enterprise Multi-Service**: [Microservices (Lokální)](../../../examples/container-app/microservices), **Řešení maloobchodního multi-agenta**

### Podle úrovně složitosti
- **Začátečník**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Středně pokročilé**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Pokročilé**: ML Pipeline
- **Připravené pro produkci (Enterprise)**: [Microservices (Lokální)](../../../examples/container-app/microservices) (Víceslužbové s frontami zpráv), **Řešení maloobchodního multi-agenta** (Kompletní multi-agentní systém s ARM šablonou)

## 📚 Další zdroje

### Dokumentace
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Příklady z komunity
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikace Todo s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webová aplikace s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Úloha Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Javou](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Nejlepší postupy
- [Rámec Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Rámec Cloud Adoption](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Přispějte příklady

Máte užitečný příklad, který chcete sdílet? Vítáme příspěvky!

### Pokyny pro zasílání
1. Dodržte zavedenou strukturu adresářů
2. Přiložte obsáhlý README.md
3. Přidejte komentáře do konfiguračních souborů
4. Důkladně otestujte před odesláním
5. Přiložte odhady nákladů a předpoklady

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

**Pro Tip**: Začněte s nejjednodušším příkladem odpovídajícím vašemu technologickému stacku a postupně přecházejte ke složitějším scénářům. Každý příklad vychází z konceptů předchozího!

## 🚀 Připraven začít?

### Vaše učební cesta

1. **Úplný začátečník?** → Začněte s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Máte základní znalosti AZD?** → Vyzkoušejte [Mikroslužby](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Budujete aplikace s AI?** → Začněte s [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) nebo prozkoumejte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodiny)
4. **Potřebujete konkrétní technologický stack?** → Použijte sekci [Najít správný příklad](../../../examples) výše

### Další kroky

- ✅ Zkontrolujte výše uvedené [Předpoklady](../../../examples)
- ✅ Vyberte příklad odpovídající vaší úrovni dovedností (viz [Legenda složitosti](../../../examples))
- ✅ Přečtěte si důkladně README příkladu před nasazením
- ✅ Nastavte připomenutí spustit `azd down` po testování
- ✅ Podělte se o své zkušenosti prostřednictvím GitHub Issues nebo Discussions

### Potřebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Odpovědi na běžné dotazy
- 🐛 [Průvodce řešením problémů](../docs/chapter-07-troubleshooting/common-issues.md) - Řešení problémů s nasazením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Zeptejte se komunity
- 📚 [Studijní průvodce](../resources/study-guide.md) - Prohlubte si své znalosti

---

**Navigace**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Studijní materiály**: [Studijní průvodce](../resources/study-guide.md) | [Rychlý přehled](../resources/cheat-sheet.md) | [Glosář](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Řešení problémů](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Poslední aktualizace: listopad 2025 | [Nahlásit problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Přispět příklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyloučení odpovědnosti:
Tento dokument byl přeložen pomocí služby strojového překladu založené na umělé inteligenci [Co‑op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o přesnost, mějte prosím na paměti, že automatické překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho původním jazyce by měl být považován za závazný zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za žádná nedorozumění nebo mylné výklady vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->