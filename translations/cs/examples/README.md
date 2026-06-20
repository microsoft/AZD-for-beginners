# Příklady - Praktické AZD šablony a konfigurace

**Učení se podle příkladů - uspořádáno podle kapitol**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Mapa kapitol**: Příklady uspořádané podle složitosti učení
- **🚀 Lokální příklad**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Externí AI příklady**: Odkazy na repozitáře Azure Samples

> **📍 DŮLEŽITÉ: Lokální vs externí příklady**  
> Tento repozitář obsahuje **4 kompletní lokální příklady** s plnou implementací:  
> - **Microsoft Foundry Models Chat** (nasazení gpt-4.1 s chat rozhraním)  
> - **Container Apps** (Jednoduché Flask API + mikroslužby)  
> - **Database App** (Web + SQL databáze)  
> - **Retail Multi-Agent** (Enterprise AI řešení)  
>  
> Další příklady jsou **externí odkazy** na repozitáře Azure-Samples, které si můžete naklonovat.

## Úvod

Tento adresář poskytuje praktické příklady a odkazy, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Scénář Retail Multi-Agent je kompletní, produkční implementace zahrnutá v tomto repozitáři. Další příklady odkazují na oficiální Azure Samples, které demonstrují různé vzory AZD.

### Legenda hodnocení složitosti

- ⭐ **Začátečník** - Základní koncepty, jedna služba, 15–30 minut
- ⭐⭐ **Středně pokročilý** - Více služeb, integrace databáze, 30–60 minut
- ⭐⭐⭐ **Pokročilý** - Komplexní architektura, integrace AI, 1–2 hodiny
- ⭐⭐⭐⭐ **Expert** - Produkční úroveň, podnikové vzory, 2+ hodin

## 🎯 Co se vlastně nachází v tomto repozitáři

### ✅ Lokální implementace (připraveno k použití)

#### [Microsoft Foundry Models Chat Application](azure-openai-chat/README.md) 🆕
**Kompletní nasazení gpt-4.1 s chat rozhraním obsažené v tomto repozitáři**

- **Umístění:** `examples/azure-openai-chat/`
- **Složitost:** ⭐⭐ (Středně pokročilý)
- **Co je zahrnuto:**
  - Kompletní nasazení Microsoft Foundry Models (gpt-4.1)
  - Python příkazové chat rozhraní
  - Integrace Key Vault pro zabezpečení API klíčů
  - Bicep šablony infrastruktury
  - Sledování využití tokenů a nákladů
  - Omezování rychlosti a zpracování chyb

**Rychlý start:**
```bash
# Přejít do složky example
cd examples/azure-openai-chat

# Nasadit vše
azd up

# Nainstalovat závislosti a začít chatovat
pip install -r src/requirements.txt
python src/chat.py
```

**Technologie:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App Examples](container-app/README.md) 🆕
**Komplexní příklady nasazení kontejnerů obsažené v tomto repozitáři**

- **Umístění:** `examples/container-app/`
- **Složitost:** ⭐-⭐⭐⭐⭐ (Od začátečníka po experta)
- **Co je zahrnuto:**
  - [Master Guide](container-app/README.md) - Kompletní přehled nasazení kontejnerů
  - [Simple Flask API](../../../examples/container-app/simple-flask-api) - Základní příklad REST API
  - [Microservices Architecture](../../../examples/container-app/microservices) - Produkčně připravené nasazení více služeb
  - Rychlý start, Produkční a Pokročilé vzory
  - Monitoring, zabezpečení a optimalizace nákladů

**Rychlý start:**
```bash
# Zobrazit hlavní příručku
cd examples/container-app

# Nasadit jednoduché Flask API
cd simple-flask-api
azd up

# Nasadit příklad mikroslužeb
cd ../microservices
azd up
```

**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕
**Kompletní produkčně připravená implementace obsažená v tomto repozitáři**

- **Umístění:** `examples/retail-multiagent-arm-template/`
- **Složitost:** ⭐⭐⭐⭐ (Pokročilý)
- **Co je zahrnuto:**
  - Kompletní ARM šablona nasazení
  - Multi-agentní architektura (Customer + Inventory)
  - Integrace Microsoft Foundry Models
  - AI Search s RAG
  - Komplexní monitoring
  - Skript pro jedním kliknutím nasazení

**Rychlý start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologie:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externí Azure Samples (Naklonujte pro použití)

Následující příklady jsou udržovány v oficiálních repozitářích Azure-Samples. Naklonujte je a prozkoumejte různé vzory AZD:

### Jednoduché aplikace (Kapitoly 1–2)

| Šablona | Repozitář | Složitost | Služby |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokální: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroslužby** | [Lokální: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Víceslužbová, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jak používat:**
```bash
# Naklonujte libovolný příklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasaďte
azd up
```

### AI aplikační příklady (Kapitoly 2, 5, 8)

| Šablona | Repozitář | Složitost | Zaměření |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokální: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | nasazení gpt-4.1 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základní AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agentní rámec |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG vzor |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databáze a pokročilé vzory (Kapitoly 3–8)

| Šablona | Repozitář | Složitost | Zaměření |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrace databáze |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java mikroservisy** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Víceslužbová |
| **ML pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cíle učení

Prostřednictvím práce s těmito příklady budete:
- Procvičovat pracovní toky Azure Developer CLI s realistickými aplikačními scénáři
- Pochopit různé aplikační architektury a jejich azd implementace
- Ovládnout Infrastructure as Code vzory pro různé Azure služby
- Aplikovat správu konfigurace a nasazovací strategie specifické pro prostředí
- Implementovat monitorování, zabezpečení a škálovací vzory v praktických kontextech
- Získat zkušenosti s řešením problémů a laděním reálných nasazovacích scénářů

## Výstupy učení

Po dokončení těchto příkladů budete schopni:
- Nasazovat různé typy aplikací pomocí Azure Developer CLI s jistotou
- Přizpůsobit poskytnuté šablony vašim vlastním aplikačním požadavkům
- Navrhovat a implementovat vlastní infrastrukturní vzory pomocí Bicep
- Konfigurovat komplexní více-službové aplikace s správnými závislostmi
- Aplikovat osvědčené postupy zabezpečení, monitorování a výkonu v reálných scénářích
- Řešit problémy a optimalizovat nasazení na základě praktických zkušeností

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
   Nasadit jednoduché REST API s možností scale-to-zero  
   **Čas:** 20–25 minut | **Náklady:** $0–5/měsíc  
   **Co se naučíte:** Základní azd pracovní tok, kontejnerizace, health proby  
   **Očekávaný výsledek:** Fungující API endpoint vracející "Hello, World!" s monitoringem

2. **[Jednoduchá webová aplikace - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasadit Node.js Express webovou aplikaci s MongoDB  
   **Čas:** 25–35 minut | **Náklady:** $10–30/měsíc  
   **Co se naučíte:** Integrace databáze, proměnné prostředí, connection stringy  
   **Očekávaný výsledek:** Todo aplikace s funkcemi vytvořit/číst/aktualizovat/smazat

3. **[Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostovat React statickou stránku s Azure Static Web Apps  
   **Čas:** 20–30 minut | **Náklady:** $0–10/měsíc  
   **Co se naučíte:** Statické hostování, serverless funkce, nasazení na CDN  
   **Očekávaný výsledek:** React UI s API backendem, automatické SSL, globální CDN

### Pro středně pokročilé
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Lokální) ⭐⭐  
   Nasadit gpt-4.1 s chat rozhraním a zabezpečeným řízením API klíčů  
   **Čas:** 35–45 minut | **Náklady:** $50–200/měsíc  
   **Co se naučíte:** Nasazení Microsoft Foundry Models, integrace Key Vault, sledování tokenů  
   **Očekávaný výsledek:** Fungující chat aplikace s gpt-4.1 a sledováním nákladů

5. **[Container App - Mikroslužby](../../../examples/container-app/microservices)** (Lokální) ⭐⭐⭐⭐  
   Produkčně připravená víceslužbová architektura  
   **Čas:** 45–60 minut | **Náklady:** $50–150/měsíc  
   **Co se naučíte:** Komunikace služeb, fronty zpráv, distribuované trasování  
   **Očekávaný výsledek:** Systém se 2 službami (API Gateway + Produktová služba) s monitoringem

6. **[Databázová aplikace - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikace s C# API a Azure SQL databází  
   **Čas:** 30–45 minut | **Náklady:** $20–80/měsíc  
   **Co se naučíte:** Entity Framework, migrace databáze, zabezpečení připojení  
   **Očekávaný výsledek:** C# API s Azure SQL backendem a automatickým nasazením schématu

7. **[Serverless funkce - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggery a Cosmos DB  
   **Čas:** 30–40 minut | **Náklady:** $10–40/měsíc  
   **Co se naučíte:** Event-driven architektura, serverless škálování, NoSQL integrace  
   **Očekávaný výsledek:** Funkční aplikace reagující na HTTP požadavky s úložištěm v Cosmos DB

8. **[Mikroslužby - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Víceslužbová Java aplikace s Container Apps a API gateway  
   **Čas:** 60–90 minut | **Náklady:** $80–200/měsíc  
   **Co se naučíte:** Nasazení Spring Boot, service mesh, load balancing  
   **Očekávaný výsledek:** Víceslužbový Java systém s objevováním služeb a směrováním

### Microsoft Foundry šablony

1. **[Microsoft Foundry Models Chat App - Lokální příklad](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletní nasazení gpt-4.1 s chat rozhraním  
   **Čas:** 35–45 minut | **Náklady:** $50–200/měsíc  
   **Očekávaný výsledek:** Fungující chat aplikace se sledováním tokenů a nákladů

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentní chat aplikace s RAG architekturou  
   **Čas:** 60–90 minut | **Náklady:** $100–300/měsíc  
   **Očekávaný výsledek:** Chat rozhraní poháněné RAG s vyhledáváním dokumentů a citacemi

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentů pomocí Azure AI služeb  
   **Čas:** 40–60 minut | **Náklady:** $20–80/měsíc  
   **Očekávaný výsledek:** API extrahující text, tabulky a entity z nahraných dokumentů

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps pracovní tok s Azure Machine Learning  
   **Čas:** 2–3 hodiny | **Náklady:** $150–500/měsíc  
   **Očekávaný výsledek:** Automatizovaný ML pipeline s trénováním, nasazením a monitoringem

### Reálné scénáře

#### **Retail Multi-Agent Solution** 🆕
**[Kompletní průvodce implementací](./retail-scenario.md)**

Komplexní, produkčně připravené multi-agentní zákaznické podpůrné řešení, které demonstruje nasazení podnikové AI aplikace pomocí AZD. Toto scénář poskytuje:

- **Kompletní architektura**: Multi-agentní systém se specializovanými agenty pro zákaznický servis a správu zásob
- **Produkční infrastruktura**: Nasazení Microsoft Foundry Models ve více regionech, AI Search, Container Apps a komplexní monitoring
- **Šablona ARM připravená k nasazení**: Nasazení jedním kliknutím s více konfiguračními režimy (Minimalní/Standardní/Premium)
- **Pokročilé funkce**: Validace bezpečnosti red teaming, rámec pro hodnocení agentů, optimalizace nákladů a průvodce řešením problémů
- **Skutečné obchodní prostředí**: Případ použití zákaznické podpory pro maloobchodníka s nahráváním souborů, integrací vyhledávání a dynamickým škálováním

**Technologie**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složitost**: ⭐⭐⭐⭐ (Pokročilé - připravené pro enterprise produkci)

**Ideální pro**: AI vývojáře, architekty řešení a týmy, které vytvářejí produkční systémy s více agenty

**Rychlý start**: Nasazení kompletního řešení za méně než 30 minut pomocí přiložené šablony ARM s `./deploy.sh -g myResourceGroup`

## 📋 Pokyny k použití

### Požadavky

Před spuštěním jakéhokoli příkladu:
- ✅ Předplatné Azure s rolí Owner nebo Contributor
- ✅ Nainstalovaný Azure Developer CLI ([Instalační příručka](../docs/chapter-01-foundation/installation.md))
- ✅ Spuštěný Docker Desktop (pro příklady s kontejnery)
- ✅ Dostatečné kvóty v Azure (zkontrolujte požadavky specifické pro příklad)

> **💰 Upozornění na náklady:** Všechny příklady vytvářejí skutečné zdroje v Azure, za které budou účtovány poplatky. Pro odhad nákladů viz jednotlivé soubory README. Nezapomeňte po dokončení spustit `azd down`, aby nedocházelo k průběžným nákladům.

### Spuštění příkladů lokálně

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
   
   **Očekávané indikátory úspěchu:**
   - ✅ `azd up` se dokončí bez chyb
   - ✅ Koncový bod služby vrátí HTTP 200
   - ✅ Azure Portal ukazuje stav "Running"
   - ✅ Application Insights přijímá telemetrii

> **⚠️ Problémy?** Podívejte se na [Běžné problémy](../docs/chapter-07-troubleshooting/common-issues.md) pro řešení potíží s nasazením

### Úprava příkladů

Každý příklad obsahuje:
- **README.md** - Podrobné pokyny pro nastavení a přizpůsobení
- **azure.yaml** - Konfigurace AZD s komentáři
- **infra/** - Bicep šablony s vysvětlením parametrů
- **src/** - Ukázkový kód aplikace
- **scripts/** - Pomocné skripty pro běžné úkoly

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
- Vzory integrace databází
- Implementace bezpečnosti a souladu

#### **Vzory připravené pro produkci**
- Konfigurace vysoké dostupnosti
- Monitoring a pozorovatelnost
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

### Aplikační databáze - C# s Azure SQL
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složitost**: Středně pokročilý  
**Koncepty**: Entity Framework, připojení k databázi, vývoj webového API

### Serverless Function - Python Azure Functions
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složitost**: Středně pokročilý  
**Koncepty**: Event-driven architektura, serverless výpočty, full-stack vývoj

### Mikroslužby - Java Spring Boot
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složitost**: Středně pokročilý  
**Koncepty**: Komunikace mikroslužeb, distribuované systémy, podnikové vzory

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Technologie**: Microsoft Foundry Models, Azure AI Search, App Service  
**Složitost**: Středně pokročilý  
**Koncepty**: RAG architektura, vektorové vyhledávání, integrace LLM

#### AI Document Processing
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Složitost**: Středně pokročilý  
**Koncepty**: Analýza dokumentů, OCR, extrakce dat

#### Machine Learning Pipeline
**Technologie**: Azure ML, MLOps, Container Registry  
**Složitost**: Pokročilé  
**Koncepty**: Trénování modelů, nasazovací pipeline, monitoring

## 🛠 Příklady konfigurací

Adresář `configurations/` obsahuje znovupoužitelné komponenty:

### Konfigurace prostředí
- Nastavení vývojového prostředí
- Konfigurace staging prostředí
- Konfigurace připravené pro produkci
- Nastavení nasazení do více regionů

### Bicep moduly
- Znovupoužitelné komponenty infrastruktury
- Běžné vzory zdrojů
- Šablony s bezpečnostním utužením
- Konfigurace optimalizované pro náklady

### Pomocné skripty
- Automatizace nastavování prostředí
- Skripty pro migraci databáze
- Nástroje pro ověření nasazení
- Utility pro monitorování nákladů

## 🔧 Průvodce přizpůsobením

### Úprava příkladů pro váš případ použití

1. **Zkontrolujte požadavky**
   - Zkontrolujte požadavky služeb Azure
   - Ověřte limity předplatného
   - Pochopte dopady na náklady

2. **Upravte konfiguraci**
   - Aktualizujte definice služeb v `azure.yaml`
   - Přizpůsobte Bicep šablony
   - Upravte proměnné prostředí

3. **Důkladně testujte**
   - Nejprve nasadit do vývojového prostředí
   - Ověřte funkčnost
   - Otestujte škálování a výkon

4. **Bezpečnostní revize**
   - Zkontrolujte přístupová oprávnění
   - Implementujte správu tajemství
   - Zapněte monitoring a alerty

## 📊 Matice porovnání

| Příklad | Služby | Databáze | Autentizace | Monitoring | Složitost |
|---------|--------|----------|-------------|------------|----------|
| **Microsoft Foundry Models Chat** (Lokální) | 2 | ❌ | Key Vault | Plné | ⭐⭐ |
| **Python Flask API** (Lokální) | 1 | ❌ | Základní | Plné | ⭐ |
| **Microservices** (Lokální) | 5+ | ✅ | Enterprise | Pokročilé | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Základní | Základní | ⭐ |
| React SPA + Functions | 3 | ✅ | Základní | Plné | ⭐ |
| Python Flask Container | 2 | ❌ | Základní | Plné | ⭐ |
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Plné | Plné | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Základní | Plné | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokální) | **8+** | **✅** | **Enterprise** | **Pokročilé** | **⭐⭐⭐⭐** |

## 🎓 Studijní postup

### Doporučený postup

1. **Začněte s Jednoduchou webovou aplikací**
   - Naučte se základní koncepty AZD
   - Pochopte workflow nasazení
   - Procvičujte správu prostředí

2. **Vyzkoušejte Statickou webovou stránku**
   - Prozkoumejte různé možnosti hostingu
   - Naučte se o integraci CDN
   - Pochopte konfiguraci DNS

3. **Přejděte na Container App**
   - Naučte se základy kontejnerizace
   - Pochopte koncepty škálování
   - Procvičujte práci s Dockerem

4. **Přidejte integraci databáze**
   - Naučte se provisionování databází
   - Pochopte connection strings
   - Procvičujte správu tajemství

5. **Prozkoumejte serverless**
   - Pochopte event-driven architekturu
   - Naučte se o triggerech a bindingech
   - Procvičujte práci s API

6. **Vytvořte mikroslužby**
   - Naučte se komunikaci mezi službami
   - Pochopte distribuované systémy
   - Procvičujte složitá nasazení

## 🔍 Najít správný příklad

### Podle technologického stacku
- **Container Apps**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices (Lokální)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokální)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokální)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokální)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokální)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices (Lokální)](../../../examples/container-app/microservices), Java Microservices
- **Databáze**: [Microservices (Lokální)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokální)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Lokální)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokální)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podle architektonického vzoru
- **Jednoduché REST API**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api)
- **Monolit**: Node.js Express Todo, C# Web API + SQL
- **Statické + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroslužby**: [Production Microservices (Lokální)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontejnerizované**: [Python Flask (Lokální)](../../../examples/container-app/simple-flask-api), [Microservices (Lokální)](../../../examples/container-app/microservices)
- **AI-poháněné**: **[Microsoft Foundry Models Chat (Lokální)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Architektura s více agenty**: **Retail Multi-Agent Solution**
- **Podnikové více-službové**: [Microservices (Lokální)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Podle úrovně složitosti
- **Začátečník**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Středně pokročilý**: **[Microsoft Foundry Models Chat (Lokální)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Pokročilé**: ML Pipeline
- **Připravené pro enterprise produkci**: [Microservices (Lokální)](../../../examples/container-app/microservices) (více služeb s frontami zpráv), **Retail Multi-Agent Solution** (Kompletní systém s více agenty a nasazením pomocí ARM šablony)

## 📚 Další zdroje

### Odkazy na dokumentaci
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Komunitní příklady
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React webová aplikace s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Úloha Azure Container Apps](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Javou](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Nejlepší postupy
- [Rámec Azure Well-Architected](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Přispívání příkladů

Máte užitečný příklad, který byste chtěli sdílet? Vítáme příspěvky!

### Pokyny pro zasílání
1. Postupujte podle stanovené struktury adresářů
2. Přidejte podrobný README.md
3. Přidejte komentáře do konfiguračních souborů
4. Důkladně otestujte před odesláním
5. Uveďte odhad nákladů a předpoklady

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

**Pro tip**: Začněte s nejjednodušším příkladem, který odpovídá vašemu technologickému stacku, a postupně přecházejte k složitějším scénářům. Každý příklad staví na konceptech z předchozích!

## 🚀 Připraven začít?

### Vaše učební cesta

1. **Úplný začátečník?** → Začněte s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Máte základní znalosti AZD?** → Vyzkoušejte [Mikroslužby](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Vytváříte AI aplikace?** → Začněte s [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) nebo prozkoumejte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodin)
4. **Potřebujete konkrétní technologický stack?** → Použijte sekci [Nalezení správného příkladu](#-finding-the-right-example) výše

### Další kroky

- ✅ Zkontrolujte [Požadavky](#požadavky) výše
- ✅ Vyberte příklad odpovídající vaší úrovni dovedností (viz [Legenda složitosti](#legenda-hodnocení-složitosti))
- ✅ Přečtěte si README konkrétního příkladu důkladně před nasazením
- ✅ Nastavte si připomenutí spustit `azd down` po testování
- ✅ Sdílejte své zkušenosti prostřednictvím GitHub Issues nebo Discussions

### Potřebujete pomoc?

- 📖 [FAQ](../resources/faq.md) - Odpovědi na běžné otázky
- 🐛 [Průvodce odstraňováním problémů](../docs/chapter-07-troubleshooting/common-issues.md) - Opravte problémy s nasazením
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Zeptejte se komunity
- 📚 [Studijní příručka](../resources/study-guide.md) - Prohlubte své znalosti

---

**Navigace**
- **📚 Domov kurzu**: [AZD For Beginners](../README.md)
- **📖 Studijní materiály**: [Studijní příručka](../resources/study-guide.md) | [Rychlý přehled](../resources/cheat-sheet.md) | [Glosář](../resources/glossary.md)
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Odstraňování problémů](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Poslední aktualizace: listopad 2025 | [Nahlásit problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Přidat příklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->