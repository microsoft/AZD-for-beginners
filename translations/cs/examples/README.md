# Příklady - Praktické šablony a konfigurace AZD

**Učení na příkladech - organizováno podle kapitol**
- **📚 Domovská stránka kurzu**: [AZD pro začátečníky](../README.md)
- **📖 Mapování kapitol**: Příklady organizované podle složitosti učení
- **🚀 Lokální příklad**: [Řešení pro maloobchod s více agenty](retail-scenario.md)
- **🤖 Externí příklady AI**: Odkazy na repozitáře Azure Samples

> **📍 DŮLEŽITÉ: Lokální vs externí příklady**  
> Tento repozitář obsahuje **4 kompletní lokální příklady** s plnou implementací:  
> - **Azure OpenAI Chat** (nasazení GPT-4 s chatovacím rozhraním)  
> - **Container Apps** (Jednoduché Flask API + mikroservisy)  
> - **Database App** (Web + SQL databáze)  
> - **Retail Multi-Agent** (Podnikové AI řešení)  
>  
> Další příklady jsou **externí odkazy** na repozitáře Azure-Samples, které můžete klonovat.

## Úvod

Tento adresář poskytuje praktické příklady a odkazy, které vám pomohou naučit se Azure Developer CLI prostřednictvím praktického cvičení. Scénář Retail Multi-Agent je kompletní, produkčně připravená implementace zahrnutá v tomto repozitáři. Další příklady odkazují na oficiální Azure Samples, které demonstrují různé vzory AZD.

### Legenda hodnocení složitosti

- ⭐ **Začátečník** - Základní koncepty, jedna služba, 15-30 minut
- ⭐⭐ **Středně pokročilý** - Více služeb, integrace databáze, 30-60 minut
- ⭐⭐⭐ **Pokročilý** - Komplexní architektura, integrace AI, 1-2 hodiny
- ⭐⭐⭐⭐ **Expert** - Produkčně připravené, podnikové vzory, 2+ hodiny

## 🎯 Co je vlastně v tomto repozitáři

### ✅ Lokální implementace (připraveno k použití)

#### [Azure OpenAI Chat Application](azure-openai-chat/README.md) 🆕
**Kompletní nasazení GPT-4 s chatovacím rozhraním zahrnuto v tomto repozitáři**

- **Umístění:** `examples/azure-openai-chat/`
- **Složitost:** ⭐⭐ (Středně pokročilý)
- **Co je zahrnuto:**
  - Kompletní nasazení Azure OpenAI (GPT-4)
  - Chatovací rozhraní příkazového řádku v Pythonu
  - Integrace Key Vault pro bezpečné API klíče
  - Šablony infrastruktury Bicep
  - Sledování využití tokenů a nákladů
  - Omezení rychlosti a zpracování chyb

**Rychlý start:**
```bash
# Přejděte na příklad
cd examples/azure-openai-chat

# Nasadit vše
azd up

# Nainstalujte závislosti a začněte chatovat
pip install -r src/requirements.txt
python src/chat.py
```

**Technologie:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Příklady aplikací Container App](container-app/README.md) 🆕
**Komplexní příklady nasazení kontejnerů zahrnuté v tomto repozitáři**

- **Umístění:** `examples/container-app/`
- **Složitost:** ⭐-⭐⭐⭐⭐ (Začátečník až Expert)
- **Co je zahrnuto:**
  - [Hlavní průvodce](container-app/README.md) - Kompletní přehled nasazení kontejnerů
  - [Jednoduché Flask API](../../../examples/container-app/simple-flask-api) - Základní příklad REST API
  - [Architektura mikroservisů](../../../examples/container-app/microservices) - Produkčně připravené nasazení více služeb
  - Vzory pro rychlý start, produkci a pokročilé použití
  - Monitoring, bezpečnost a optimalizace nákladů

**Rychlý start:**
```bash
# Zobrazit hlavního průvodce
cd examples/container-app

# Nasadit jednoduché Flask API
cd simple-flask-api
azd up

# Nasadit příklad mikroservis
cd ../microservices
azd up
```

**Technologie:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Řešení pro maloobchod s více agenty](retail-scenario.md) 🆕
**Kompletní produkčně připravená implementace zahrnutá v tomto repozitáři**

- **Umístění:** `examples/retail-multiagent-arm-template/`
- **Složitost:** ⭐⭐⭐⭐ (Pokročilý)
- **Co je zahrnuto:**
  - Kompletní šablona nasazení ARM
  - Architektura s více agenty (Zákazník + Inventář)
  - Integrace Azure OpenAI
  - AI vyhledávání s RAG
  - Komplexní monitoring
  - Skript pro nasazení jedním kliknutím

**Rychlý start:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologie:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externí Azure Samples (klonovat k použití)

Následující příklady jsou udržovány v oficiálních repozitářích Azure-Samples. Klonujte je, abyste prozkoumali různé vzory AZD:

### Jednoduché aplikace (Kapitoly 1-2)

| Šablona | Repozitář | Složitost | Služby |
|:--------|:----------|:----------|:-------|
| **Python Flask API** | [Lokální: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisy** | [Lokální: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Více služeb, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Jak používat:**
```bash
# Naklonujte libovolný příklad
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Nasadit
azd up
```

### Příklady AI aplikací (Kapitoly 2, 5, 8)

| Šablona | Repozitář | Složitost | Zaměření |
|:--------|:----------|:----------|:---------|
| **Azure OpenAI Chat** | [Lokální: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | Nasazení GPT-4 |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Základní AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Rámec pro agenty |
| **Vyhledávání + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | Vzor RAG |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Podnikové AI |

### Databázové a pokročilé vzory (Kapitoly 3-8)

| Šablona | Repozitář | Složitost | Zaměření |
|:--------|:----------|:----------|:---------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integrace databáze |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java mikroservisy** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Více služeb |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Cíle učení

Prací na těchto příkladech se naučíte:
- Procvičit pracovní postupy Azure Developer CLI s realistickými scénáři aplikací
- Porozumět různým architekturám aplikací a jejich implementacím v AZD
- Ovládnout vzory Infrastructure as Code pro různé služby Azure
- Aplikovat správu konfigurace a strategie nasazení specifické pro prostředí
- Implementovat vzory monitorování, bezpečnosti a škálování v praktických kontextech
- Získat zkušenosti s odstraňováním problémů a laděním reálných scénářů nasazení

## Výsledky učení

Po dokončení těchto příkladů budete schopni:
- Sebevědomě nasazovat různé typy aplikací pomocí Azure Developer CLI
- Přizpůsobit poskytnuté šablony vlastním požadavkům aplikace
- Navrhovat a implementovat vlastní vzory infrastruktury pomocí Bicep
- Konfigurovat komplexní aplikace s více službami s odpovídajícími závislostmi
- Aplikovat nejlepší postupy v oblasti bezpečnosti, monitorování a výkonu v reálných scénářích
- Odstraňovat problémy a optimalizovat nasazení na základě praktických zkušeností

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

> **💡 Nováček v AZD?** Začněte příkladem č. 1 (Flask API) - zabere ~20 minut a naučí vás základní koncepty.

### Pro začátečníky
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokální) ⭐  
   Nasazení jednoduchého REST API s funkcí scale-to-zero  
   **Čas:** 20-25 minut | **Náklady:** $0-5/měsíc  
   **Co se naučíte:** Základní pracovní postup AZD, kontejnerizace, zdravotní sondy  
   **Očekávaný výsledek:** Funkční API endpoint vracející "Hello, World!" s monitoringem

2. **[Jednoduchá webová aplikace - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Nasazení webové aplikace Node.js Express s MongoDB  
   **Čas:** 25-35 minut | **Náklady:** $10-30/měsíc  
   **Co se naučíte:** Integrace databáze, proměnné prostředí, připojovací řetězce  
   **Očekávaný výsledek:** Aplikace seznamu úkolů s funkcemi vytvoření/čtení/aktualizace/smazání

3. **[Statická webová stránka - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostování statické webové stránky React s Azure Static Web Apps  
   **Čas:** 20-30 minut | **Náklady:** $0-10/měsíc  
   **Co se naučíte:** Statické hostování, serverless funkce, nasazení CDN  
   **Očekávaný výsledek:** React UI s API backendem, automatický SSL, globální CDN

### Pro středně pokročilé
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Lokální) ⭐⭐  
   Nasazení GPT-4 s chatovacím rozhraním a správou bezpečných API klíčů  
   **Čas:** 35-45 minut | **Náklady:** $50-200/měsíc  
   **Co se naučíte:** Nasazení Azure OpenAI, integrace Key Vault, sledování tokenů  
   **Očekávaný výsledek:** Funkční chatovací aplikace s GPT-4 a monitoringem nákladů

5. **[Container App - Mikroservisy](../../../examples/container-app/microservices)** (Lokální) ⭐⭐⭐⭐  
   Produkčně připravená architektura více služeb  
   **Čas:** 45-60 minut | **Náklady:** $50-150/měsíc  
   **Co se naučíte:** Komunikace mezi službami, fronty zpráv, distribuované sledování  
   **Očekávaný výsledek:** Systém se 2 službami (API Gateway + Product Service) s monitoringem

6. **[Database App - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webová aplikace s C# API a Azure SQL databází  
   **Čas:** 30-45 minut | **Náklady:** $20-80/měsíc  
   **Co se naučíte:** Entity Framework, migrace databáze, bezpečnost připojení  
   **Očekávaný výsledek:** C# API s backendem Azure SQL, automatické nasazení schématu

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggery a Cosmos DB  
   **Čas:** 30-40 minut | **Náklady:** $10-40/měsíc  
   **Co se naučíte:** Architektura řízená událostmi, serverless škálování, integrace NoSQL  
   **Očekávaný výsledek:** Funkční aplikace reagující na HTTP požadavky s úložištěm Cosmos DB

8. **[Mikroservisy - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Víceslužbová Java aplikace s Container Apps a API gateway  
   **Čas:** 60-90 minut | **Náklady:** $80-200/měsíc  
   **Co se naučíte:** Nasazení Spring Boot, síť služeb, vyvažování zátěže  
   **Očekávaný výsledek:** Víceslužbový Java systém s objevováním služeb a směrováním

### Šablony Azure AI Foundry

1. **[Azure OpenAI Chat App - Lokální příklad](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletní nasazení GPT-4 s chatovacím rozhraním  
   **Čas:** 35-45 minut | **Náklady:** $50-200/měsíc  
   **Očekávaný výsledek:** Funkční chatovací aplikace se sledováním tokenů a monitoringem nákladů

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentní chatovací aplikace s architekturou RAG  
   **Čas:** 60-90 minut | **Náklady:** $100-300/měsíc  
   **Očekávaný výsledek:** Chatovací rozhraní poháněné RAG s vyhledáváním dokumentů a citacemi

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analýza dokumentů pomocí služeb Azure AI  
   **Čas:** 40-60 minut | **Náklady:** $20-80/měsíc  
   **Očekávaný výsledek:** API extrahující text, tabulky a entity z nahraných dokumentů

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps pracovní postup s Azure Machine Learning  
   **Čas:** 2-3 hodiny | **Náklady:** $150-500/měsíc  
   **Očekávaný výsledek:** Automatizovaný ML pipeline s tréninkem, nasazením a monitoringem

### Scénáře z reálného světa

#### **Řešení pro maloobchod s více agenty** 🆕
**[Kompletní průvodce implementací](./retail-scenario.md)**

Komplexní, produkčně připravené řešení zákaznické podpory s více agenty, které demonstruje podnikové nasazení AI aplikací s AZD. Tento scénář poskytuje:

- **Kompletní architektura**: Systém s více agenty se specializovanými agenty pro zákaznický servis a správu inventáře
- **Produkční infrastruktura**: Nasazení Azure OpenAI ve více regionech, AI vyhledávání, Container Apps a komplexní monitorování  
- **Připravená ARM šablona**: Nasazení jedním kliknutím s více režimy konfigurace (Minimal/Standard/Premium)  
- **Pokročilé funkce**: Bezpečnostní validace red teaming, rámec pro hodnocení agentů, optimalizace nákladů a návody na řešení problémů  
- **Reálný obchodní kontext**: Případová studie zákaznické podpory maloobchodníka s nahráváním souborů, integrací vyhledávání a dynamickým škálováním  

**Technologie**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Složitost**: ⭐⭐⭐⭐ (Pokročilé - připraveno pro produkční nasazení v podnicích)  

**Ideální pro**: AI vývojáře, architekty řešení a týmy budující produkční multi-agentní systémy  

**Rychlý start**: Nasazení kompletního řešení za méně než 30 minut pomocí přiložené ARM šablony s `./deploy.sh -g myResourceGroup`  

## 📋 Návod k použití  

### Předpoklady  

Před spuštěním jakéhokoliv příkladu:  
- ✅ Azure předplatné s přístupem Owner nebo Contributor  
- ✅ Nainstalovaný Azure Developer CLI ([Průvodce instalací](../docs/getting-started/installation.md))  
- ✅ Běžící Docker Desktop (pro příklady s kontejnery)  
- ✅ Odpovídající kvóty Azure (zkontrolujte požadavky specifické pro příklad)  

> **💰 Upozornění na náklady:** Všechny příklady vytvářejí skutečné Azure zdroje, které generují náklady. Podívejte se na odhady nákladů v jednotlivých README souborech. Nezapomeňte spustit `azd down`, až budete hotovi, abyste předešli dalším nákladům.  

### Spuštění příkladů lokálně  

1. **Klonování nebo kopírování příkladu**  
   ```bash
   # Přejděte na požadovaný příklad
   cd examples/simple-web-app
   ```
  
2. **Inicializace prostředí AZD**  
   ```bash
   # Inicializovat s existující šablonou
   azd init
   
   # Nebo vytvořit nové prostředí
   azd env new my-environment
   ```
  
3. **Konfigurace prostředí**  
   ```bash
   # Nastavte požadované proměnné
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```
  
4. **Nasazení**  
   ```bash
   # Nasadit infrastrukturu a aplikaci
   azd up
   ```
  
5. **Ověření nasazení**  
   ```bash
   # Získejte koncové body služby
   azd env get-values
   
   # Otestujte koncový bod (příklad)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Očekávané indikátory úspěchu:**  
   - ✅ `azd up` proběhne bez chyb  
   - ✅ Koncový bod služby vrací HTTP 200  
   - ✅ Azure Portal ukazuje stav "Running"  
   - ✅ Application Insights přijímá telemetrii  

> **⚠️ Problémy?** Podívejte se na [Časté problémy](../docs/troubleshooting/common-issues.md) pro řešení problémů s nasazením  

### Přizpůsobení příkladů  

Každý příklad obsahuje:  
- **README.md** - Podrobné pokyny k nastavení a přizpůsobení  
- **azure.yaml** - Konfigurace AZD s komentáři  
- **infra/** - Bicep šablony s vysvětlením parametrů  
- **src/** - Ukázkový aplikační kód  
- **scripts/** - Pomocné skripty pro běžné úkoly  

## 🎯 Výukové cíle  

### Kategorie příkladů  

#### **Základní nasazení**  
- Aplikace s jednou službou  
- Jednoduché infrastrukturní vzory  
- Základní správa konfigurace  
- Nákladově efektivní vývojová prostředí  

#### **Pokročilé scénáře**  
- Architektury s více službami  
- Složité síťové konfigurace  
- Vzory integrace databází  
- Implementace bezpečnosti a souladu  

#### **Vzory připravené pro produkci**  
- Konfigurace s vysokou dostupností  
- Monitorování a sledovatelnost  
- Integrace CI/CD  
- Plány obnovy po havárii  

## 📖 Popisy příkladů  

### Jednoduchá webová aplikace - Node.js Express  
**Technologie**: Node.js, Express, MongoDB, Container Apps  
**Složitost**: Začátečník  
**Koncepty**: Základní nasazení, REST API, integrace NoSQL databáze  

### Statická webová stránka - React SPA  
**Technologie**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složitost**: Začátečník  
**Koncepty**: Statické hostování, serverless backend, moderní webový vývoj  

### Kontejnerová aplikace - Python Flask  
**Technologie**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složitost**: Začátečník  
**Koncepty**: Kontejnerizace, REST API, škálování na nulu, zdravotní kontroly, monitorování  
**Umístění**: [Lokální příklad](../../../examples/container-app/simple-flask-api)  

### Kontejnerová aplikace - Architektura mikroslužeb  
**Technologie**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složitost**: Pokročilé  
**Koncepty**: Architektura s více službami, komunikace mezi službami, fronty zpráv, distribuované sledování  
**Umístění**: [Lokální příklad](../../../examples/container-app/microservices)  

### Databázová aplikace - C# s Azure SQL  
**Technologie**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složitost**: Středně pokročilé  
**Koncepty**: Entity Framework, připojení k databázi, vývoj webového API  

### Serverless funkce - Python Azure Functions  
**Technologie**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složitost**: Středně pokročilé  
**Koncepty**: Architektura řízená událostmi, serverless výpočetní model, full-stack vývoj  

### Mikroslužby - Java Spring Boot  
**Technologie**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složitost**: Středně pokročilé  
**Koncepty**: Komunikace mikroslužeb, distribuované systémy, podnikové vzory  

### Příklady Azure AI Foundry  

#### Azure OpenAI Chat App  
**Technologie**: Azure OpenAI, Cognitive Search, App Service  
**Složitost**: Středně pokročilé  
**Koncepty**: RAG architektura, vektorové vyhledávání, integrace LLM  

#### Zpracování dokumentů pomocí AI  
**Technologie**: Azure AI Document Intelligence, Storage, Functions  
**Složitost**: Středně pokročilé  
**Koncepty**: Analýza dokumentů, OCR, extrakce dat  

#### Strojové učení - Pipeline  
**Technologie**: Azure ML, MLOps, Container Registry  
**Složitost**: Pokročilé  
**Koncepty**: Trénování modelů, nasazovací pipeline, monitorování  

## 🛠 Příklady konfigurace  

Adresář `configurations/` obsahuje znovupoužitelné komponenty:  

### Konfigurace prostředí  
- Nastavení vývojového prostředí  
- Konfigurace testovacího prostředí  
- Konfigurace připravené pro produkci  
- Nasazení do více regionů  

### Bicep moduly  
- Znovupoužitelné infrastrukturní komponenty  
- Běžné vzory zdrojů  
- Šablony s posíleným zabezpečením  
- Nákladově optimalizované konfigurace  

### Pomocné skripty  
- Automatizace nastavení prostředí  
- Skripty pro migraci databází  
- Nástroje pro ověření nasazení  
- Nástroje pro sledování nákladů  

## 🔧 Průvodce přizpůsobením  

### Přizpůsobení příkladů pro vaše potřeby  

1. **Zkontrolujte předpoklady**  
   - Ověřte požadavky na služby Azure  
   - Zkontrolujte limity předplatného  
   - Pochopte nákladové dopady  

2. **Upravte konfiguraci**  
   - Aktualizujte definice služeb v `azure.yaml`  
   - Přizpůsobte Bicep šablony  
   - Upravte proměnné prostředí  

3. **Důkladně otestujte**  
   - Nejprve nasazujte do vývojového prostředí  
   - Ověřte funkčnost  
   - Testujte škálování a výkon  

4. **Bezpečnostní kontrola**  
   - Zkontrolujte přístupová oprávnění  
   - Implementujte správu tajných klíčů  
   - Aktivujte monitorování a upozornění  

## 📊 Porovnávací tabulka  

| Příklad | Služby | Databáze | Autentizace | Monitorování | Složitost |  
|---------|--------|----------|-------------|--------------|-----------|  
| **Azure OpenAI Chat** (Lokální) | 2 | ❌ | Key Vault | Plné | ⭐⭐ |  
| **Python Flask API** (Lokální) | 1 | ❌ | Základní | Plné | ⭐ |  
| **Mikroslužby** (Lokální) | 5+ | ✅ | Podnikové | Pokročilé | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Základní | Základní | ⭐ |  
| React SPA + Functions | 3 | ✅ | Základní | Plné | ⭐ |  
| Python Flask Container | 2 | ❌ | Základní | Plné | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Plné | Plné | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Plné | Plné | ⭐⭐ |  
| Java Mikroslužby | 5+ | ✅ | Plné | Plné | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Plné | Plné | ⭐⭐⭐ |  
| AI Document Processing | 2 | ❌ | Základní | Plné | ⭐⭐ |  
| ML Pipeline | 4+ | ✅ | Plné | Plné | ⭐⭐⭐⭐ |  
| **Maloobchodní multi-agentní řešení** (Lokální) | **8+** | **✅** | **Podnikové** | **Pokročilé** | **⭐⭐⭐⭐** |  

## 🎓 Výuková cesta  

### Doporučený postup  

1. **Začněte s jednoduchou webovou aplikací**  
   - Naučte se základní koncepty AZD  
   - Pochopte pracovní postup nasazení  
   - Procvičte si správu prostředí  

2. **Vyzkoušejte statickou webovou stránku**  
   - Prozkoumejte různé možnosti hostování  
   - Naučte se o integraci CDN  
   - Pochopte konfiguraci DNS  

3. **Přejděte na kontejnerovou aplikaci**  
   - Naučte se základy kontejnerizace  
   - Pochopte koncepty škálování  
   - Procvičte si práci s Dockerem  

4. **Přidejte integraci databáze**  
   - Naučte se zřizování databází  
   - Pochopte připojovací řetězce  
   - Procvičte si správu tajných klíčů  

5. **Prozkoumejte serverless**  
   - Pochopte architekturu řízenou událostmi  
   - Naučte se o spouštěčích a vazbách  
   - Procvičte si práci s API  

6. **Vytvořte mikroslužby**  
   - Naučte se komunikaci mezi službami  
   - Pochopte distribuované systémy  
   - Procvičte si složitá nasazení  

## 🔍 Výběr správného příkladu  

### Podle technologického stacku  
- **Container Apps**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), [Mikroslužby (Lokální)](../../../examples/container-app/microservices), Java Mikroslužby  
- **Node.js**: Node.js Express Todo App, [Mikroslužby API Gateway (Lokální)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), [Mikroslužby Product Service (Lokální)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroslužby Order Service (Lokální)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline  
- **Go**: [Mikroslužby User Service (Lokální)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroslužby  
- **React**: React SPA + Functions  
- **Kontejnery**: [Python Flask (Lokální)](../../../examples/container-app/simple-flask-api), [Mikroslužby (Lokální)](../../../examples/container-app/microservices), Java Mikroslužby  
- **Databáze**: [Mikroslužby (Lokální)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Maloobchodní multi-agentní řešení**  
- **Multi-agentní systémy**: **Maloobchodní multi-agentní řešení**  
- **Integrace OpenAI**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, Maloobchodní multi-agentní řešení  
- **Produkce v podnicích**: [Mikroslužby (Lokální)](../../../examples/container-app/microservices), **Maloobchodní multi-agentní řešení**  

### Podle architektonického vzoru  
- **Jednoduché REST API**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api)  
- **Monolitické**: Node.js Express Todo, C# Web API + SQL  
- **Statické + serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroslužby**: [Produkční mikroslužby (Lokální)](../../../examples/container-app/microservices), Java Spring Boot Mikroslužby  
- **Kontejnerizované**: [Python Flask (Lokální)](../../../examples/container-app/simple-flask-api), [Mikroslužby (Lokální)](../../../examples/container-app/microservices)  
- **AI-poháněné**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Maloobchodní multi-agentní řešení**  
- **Multi-agentní architektura**: **Maloobchodní multi-agentní řešení**  
- **Podnikové multi-služby**: [Mikroslužby (Lokální)](../../../examples/container-app/microservices), **Maloobchodní multi-agentní řešení**  

### Podle úrovně složitosti  
- **Začátečník**: [Python Flask API (Lokální)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Středně pokročilé**: **[Azure OpenAI Chat (Lokální)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroslužby, Azure OpenAI Chat App, AI Document Processing  
- **Pokročilé**: ML Pipeline  
- **Připravené pro produkci v podnicích**: [Mikroslužby (Lokální)](../../../examples/container-app/microservices) (Multi-služby s frontami zpráv), **Maloobchodní multi-agentní řešení** (Kompletní multi-agentní systém s nasazením pomocí ARM šablony)  

## 📚 Další zdroje  

### Odkazy na dokumentaci  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep Dokumentace](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Příklady z komunity  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App s C# a Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App s Pythonem a MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo aplikace s Node.js a PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [React webová aplikace s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions s Javou](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Nejlepší postupy  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Příspěvky příkladů  

Máte užitečný příklad, který chcete sdílet? Rádi uvítáme vaše příspěvky!  

### Pokyny pro odeslání  
1. Dodržujte zavedenou strukturu adresářů  
2. Zahrňte podrobný README.md  
3. Přidejte komentáře do konfiguračních souborů  
4. Důkladně otestujte před odesláním  
5. Uveďte odhady nákladů a požadavky  

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

**Tip od profíků**: Začněte s nejjednodušším příkladem, který odpovídá vaší technologické sadě, a postupně přecházejte ke složitějším scénářům. Každý příklad staví na konceptech z předchozích!  

## 🚀 Připraveni začít?  

### Vaše vzdělávací cesta  

1. **Úplný začátečník?** → Začněte s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minut)  
2. **Máte základní znalosti AZD?** → Vyzkoušejte [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minut)  
3. **Vytváříte AI aplikace?** → Začněte s [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minut) nebo prozkoumejte [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hodiny)  
4. **Potřebujete konkrétní technologickou sadu?** → Použijte sekci [Najít správný příklad](../../../examples) výše  

### Další kroky  

- ✅ Projděte si [Požadavky](../../../examples) výše  
- ✅ Vyberte příklad odpovídající vaší úrovni dovedností (viz [Legenda složitosti](../../../examples))  
- ✅ Přečtěte si podrobně README příkladu před nasazením  
- ✅ Nastavte si připomínku na spuštění `azd down` po testování  
- ✅ Sdílejte své zkušenosti prostřednictvím GitHub Issues nebo Discussions  

### Potřebujete pomoc?  

- 📖 [FAQ](../resources/faq.md) - Odpovědi na běžné otázky  
- 🐛 [Průvodce řešením problémů](../docs/troubleshooting/common-issues.md) - Oprava problémů s nasazením  
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Zeptejte se komunity  
- 📚 [Studijní průvodce](../resources/study-guide.md) - Posilte své znalosti  

---  

**Navigace**  
- **📚 Domov kurzu**: [AZD pro začátečníky](../README.md)  
- **📖 Studijní materiály**: [Studijní průvodce](../resources/study-guide.md) | [Tahák](../resources/cheat-sheet.md) | [Slovník](../resources/glossary.md)  
- **🔧 Zdroje**: [FAQ](../resources/faq.md) | [Řešení problémů](../docs/troubleshooting/common-issues.md)  

---  

*Poslední aktualizace: listopad 2025 | [Nahlásit problémy](https://github.com/microsoft/AZD-for-beginners/issues) | [Přispět příklady](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení**:  
Tento dokument byl přeložen pomocí služby AI pro překlady [Co-op Translator](https://github.com/Azure/co-op-translator). I když se snažíme o přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Původní dokument v jeho původním jazyce by měl být považován za autoritativní zdroj. Pro důležité informace se doporučuje profesionální lidský překlad. Neodpovídáme za žádná nedorozumění nebo nesprávné interpretace vyplývající z použití tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->