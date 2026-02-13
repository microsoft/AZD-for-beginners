# Primjeri - Praktični AZD predlošci i konfiguracije

**Učenje kroz primjere - Organizirano po poglavljima**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../README.md)
- **📖 Prikaz poglavlja**: Primjeri organizirani prema složenosti učenja
- **🚀 Lokalni primjer**: [Maloprodajno višestruko-agentsko rješenje](retail-scenario.md)
- **🤖 Vanjski AI primjeri**: Poveznice na Azure Samples repozitorije

> **📍 VAŽNO: Lokalni vs Vanjski primjeri**  
> Ovaj repozitorij sadrži **4 potpuna lokalna primjera** s potpunim implementacijama:  
> - **Azure OpenAI Chat** (GPT-4 distribucija s chat sučeljem)  
> - **Container Apps** (Jednostavni Flask API + mikroservisi)  
> - **Database App** (Web + SQL baza podataka)  
> - **Maloprodajno višestruko-agentno** (Enterprise AI rješenje)  
>  
> Dodatni primjeri su **vanjske reference** na Azure-Samples repozitorije koje možete klonirati.

## Uvod

Ovaj direktorij nudi praktične primjere i reference koji vam pomažu naučiti Azure Developer CLI kroz praktičnu primjenu. Scenarij Maloprodajno višestruko-agentno je potpuna, produkcijski spremna implementacija uključena u ovaj repozitorij. Dodatni primjeri referiraju službene Azure Samples koji demonstriraju različite AZD obrasce.

### Legenda ocjene složenosti

- ⭐ **Početnik** - Osnovni pojmovi, jedna usluga, 15-30 minuta
- ⭐⭐ **Srednji nivo** - Više usluga, integracija baze podataka, 30-60 minuta
- ⭐⭐⭐ **Napredni** - Složena arhitektura, AI integracija, 1-2 sata
- ⭐⭐⭐⭐ **Ekspert** - Produkcijski spremno, enterprise obrasci, 2+ sata

## 🎯 Što se zapravo nalazi u ovom repozitoriju

### ✅ Lokalna implementacija (Spremno za korištenje)

#### [Azure OpenAI Chat aplikacija](azure-openai-chat/README.md) 🆕
**Potpuna GPT-4 distribucija s chat sučeljem uključena u ovaj repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`
- **Složenost:** ⭐⭐ (Srednji nivo)
- **Što je uključeno:**
  - Potpuna Azure OpenAI distribucija (GPT-4)
  - Python chat sučelje preko naredbenog retka
  - Integracija s Key Vault za sigurne API ključeve
  - Bicep predlošci za infrastrukturu
  - Praćenje korištenja tokena i troškova
  - Ograničenje brzine i rukovanje pogreškama

**Brzi početak:**
```bash
# Navigiraj do primjera
cd examples/azure-openai-chat

# Postavi sve
azd up

# Instaliraj ovisnosti i započni razgovor
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Primjeri Container App](container-app/README.md) 🆕
**Sveobuhvatni primjeri deployanja kontejnera uključeni u ovaj repozitorij**

- **Lokacija:** `examples/container-app/`
- **Složenost:** ⭐-⭐⭐⭐⭐ (Od početnika do naprednog)
- **Što je uključeno:**
  - [Glavni vodič](container-app/README.md) - Potpuni pregled deployanja kontejnera
  - [Jednostavni Flask API](../../../examples/container-app/simple-flask-api) - Osnovni REST API primjer
  - [Arhitektura mikroservisa](../../../examples/container-app/microservices) - Produkcijski spremna multi-usluga
  - Brzi početak, produkcijski i napredni obrasci
  - Nadzor, sigurnost i optimizacija troškova

**Brzi početak:**
```bash
# Pogledaj glavni vodič
cd examples/container-app

# Postavi jednostavan Flask API
cd simple-flask-api
azd up

# Postavi primjer mikroservisa
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Maloprodajno višestruko-agentno rješenje](retail-scenario.md) 🆕
**Potpuna produkcijski spremna implementacija uključena u ovaj repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`
- **Složenost:** ⭐⭐⭐⭐ (Napredni)
- **Što je uključeno:**
  - Potpuni ARM predložak za deploy
  - Višestruka arhitektura agenata (Kupac + Inventar)
  - Integracija Azure OpenAI
  - AI pretraživanje s RAG
  - Sveobuhvatni nadzor
  - Skripta za jednoklik deploy

**Brzi početak:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Azure OpenAI, AI pretraživanje, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Vanjski Azure Samples (Klonirajte za korištenje)

Sljedeći primjeri održavaju se u službenim Azure-Samples repozitorijima. Klonirajte ih da istražite različite AZD obrasce:

### Jednostavne aplikacije (Poglavlja 1-2)

| Predložak | Repozitorij | Složenost | Usluge |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-usluga, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask kontejner** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako koristiti:**
```bash
# Kloniraj bilo koji primjer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implementiraj
azd up
```

### AI aplikacijski primjeri (Poglavlja 2, 5, 8)

| Predložak | Repozitorij | Složenost | Fokus |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 distribucija |
| **AI Chat Brzi početak** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI chat |
| **AI Agent Framework** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Pretraživanje + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG obrazac |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Baze podataka i napredni obrasci (Poglavlja 3-8)

| Predložak | Repozitorij | Složenost | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podataka |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java mikroservisi** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-usluga |
| **ML pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciljevi učenja

Radom kroz ove primjere, naučit ćete:
- Prakticirati Azure Developer CLI radne tokove s realnim scenarijima aplikacija
- Razumjeti različite arhitekture aplikacija i njihove azd implementacije
- Ovladati infrastrukturom kao kod obrascima za različite Azure usluge
- Primijeniti upravljanje konfiguracijama i strategije deploya specifične za okoliš
- Implementirati obrasce nadzora, sigurnosti i skaliranja u praktičnim kontekstima
- Steći iskustvo u rješavanju problema i otklanjanju grešaka u realnim scenarijima deploya

## Ishodi učenja

Nakon dovršetka ovih primjera bit ćete sposobni:
- Pouzdano distribuirati različite vrste aplikacija koristeći Azure Developer CLI
- Prilagoditi dostupne predloške vlastitim potrebama aplikacije
- Dizajnirati i implementirati prilagođene infrastrukturene obrasce koristeći Bicep
- Konfigurirati složene multi-uslužne aplikacije s ispravnim ovisnostima
- Primijeniti sigurnosne, nadzorne i izvedbene najbolje prakse u stvarnim scenarijima
- Otklanjati i optimizirati deploy prema praktičnom iskustvu

## Struktura direktorija

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

## Primjeri za brzi početak

> **💡 Nov u AZD-u?** Počni s primjerom #1 (Flask API) - traje oko 20 minuta i uči osnovne pojmove.

### Za početnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Deploy jednostavnog REST API-ja sa scale-to-zero  
   **Vrijeme:** 20-25 minuta | **Trošak:** $0-5/mjesečno  
   **Što ćete naučiti:** Osnovni azd radni tok, kontejnerizacija, health probe  
   **Očekivani rezultat:** Funkcionalan API endpoint koji vraća "Hello, World!" uz nadzor

2. **[Jednostavna web aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Postavljanje Node.js Express web aplikacije s MongoDB  
   **Vrijeme:** 25-35 minuta | **Trošak:** $10-30/mjesečno  
   **Što ćete naučiti:** Integracija baze podataka, varijable okruženja, connection stringovi  
   **Očekivani rezultat:** Todo lista aplikacija s funkcionalnostima kreiranja/čitanja/izmjene/brisanja

3. **[Statička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosting React statičke web stranice s Azure Static Web Apps  
   **Vrijeme:** 20-30 minuta | **Trošak:** $0-10/mjesečno  
   **Što ćete naučiti:** Statički hosting, serverless funkcije, CDN deploy  
   **Očekivani rezultat:** React UI s API backendom, automatski SSL, globalni CDN

### Za korisnike srednjeg nivoa
4. **[Azure OpenAI Chat aplikacija](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Deploy GPT-4 s chat sučeljem i sigurnim upravljanjem API ključevima  
   **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno  
   **Što ćete naučiti:** Azure OpenAI deploy, integracija Key Vault, praćenje tokena  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s GPT-4 i praćenjem troškova

5. **[Container App - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Produkcijski spremna arhitektura multi-usluga  
   **Vrijeme:** 45-60 minuta | **Trošak:** $50-150/mjesečno  
   **Što ćete naučiti:** Komunikacija usluga, poručivanje u redu, distribuirano praćenje  
   **Očekivani rezultat:** Sustav od 2 usluge (API Gateway + Product Service) s nadzorom

6. **[Database App - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web aplikacija s C# API-jem i Azure SQL bazom podataka  
   **Vrijeme:** 30-45 minuta | **Trošak:** $20-80/mjesečno  
   **Što ćete naučiti:** Entity Framework, migracije baze podataka, sigurnost konekcija  
   **Očekivani rezultat:** C# API s Azure SQL back-endom i automatskim deployem sheme

7. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP okidačima i Cosmos DB  
   **Vrijeme:** 30-40 minuta | **Trošak:** $10-40/mjesečno  
   **Što ćete naučiti:** Event-driven arhitektura, serverless skaliranje, NoSQL integracija  
   **Očekivani rezultat:** Funkcija koja odgovara na HTTP zahtjeve s Cosmos DB skladištem

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-uslužna Java aplikacija s Container Apps i API gateway  
   **Vrijeme:** 60-90 minuta | **Trošak:** $80-200/mjesečno  
   **Što ćete naučiti:** Spring Boot deploy, service mesh, load balancing  
   **Očekivani rezultat:** Multi-uslužni Java sustav s otkrivanjem usluga i rutiranjem

### Microsoft Foundry predlošci

1. **[Azure OpenAI Chat App - Lokalni primjer](../../../examples/azure-openai-chat)** ⭐⭐  
   Potpuna GPT-4 distribucija s chat sučeljem  
   **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s praćenjem tokena i troškova

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna chat aplikacija s RAG arhitekturom  
   **Vrijeme:** 60-90 minuta | **Trošak:** $100-300/mjesečno  
   **Očekivani rezultat:** RAG-pokretano chat sučelje s pretraživanjem dokumenata i citatima

3. **[AI obrada dokumenata](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumenata korištenjem Azure AI servisa  
   **Vrijeme:** 40-60 minuta | **Trošak:** $20-80/mjesečno  
   **Očekivani rezultat:** API koji izvlači tekst, tablice i entitete iz učitanih dokumenata

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps radni tok s Azure Machine Learning  
   **Vrijeme:** 2-3 sata | **Trošak:** $150-500/mjesečno  
   **Očekivani rezultat:** Automatizirani ML pipeline s treniranjem, deployem i nadzorom

### Scenariji iz stvarnog svijeta

#### **Maloprodajno višestruko-agentno rješenje** 🆕
**[Kompletni vodič za implementaciju](./retail-scenario.md)**

Sveobuhvatno, produkcijski spremno multi-agentno rješenje za korisničku podršku koje demonstrira enterprise razinu AI aplikacije deploya s AZD. Ovaj scenarij pruža:

- **Potpunu arhitekturu**: Multi-agent sustav sa specijaliziranim agentima za korisničku podršku i upravljanje inventarom
- **Proizvodna infrastruktura**: Višeregionalna Azure OpenAI implementacija, AI pretraživanje, Container Apps i sveobuhvatno nadgledanje
- **Spremna za implementaciju ARM predložak**: Implementacija jednim klikom s više načina konfiguracije (Minimalni/Standardni/Premium)
- **Napredne značajke**: Red teaming sigurnosna validacija, okvir za procjenu agenta, optimizacija troškova i vodiči za rješavanje problema
- **Stvarni poslovni kontekst**: Primjer korisničke podrške trgovca s prijenosom datoteka, integracijom pretraživanja i dinamičkim skaliranjem

**Tehnologije**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složenost**: ⭐⭐⭐⭐ (Napredno - spremno za proizvodnju u poduzeću)

**Savršeno za**: AI developere, arhitekte rješenja i timove koji grade proizvodne sustave s više agenata

**Brzi početak**: Implementirajte cjelovito rješenje za manje od 30 minuta koristeći priloženi ARM predložak s `./deploy.sh -g myResourceGroup`

## 📋 Upute za korištenje

### Preduvjeti

Prije pokretanja bilo kojeg primjera:
- ✅ Azure pretplata s pristupom vlasnika ili suradnika
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](../docs/chapter-01-foundation/installation.md))
- ✅ Pokrenut Docker Desktop (za primjere s kontejnerima)
- ✅ Odgovarajući Azure kvote (provjerite zahtjeve specifične za primjer)

> **💰 Upozorenje na troškove:** Svi primjeri stvaraju stvarne Azure resurse koji generiraju troškove. Pogledajte pojedinačne README datoteke za procjene troškova. Ne zaboravite pokrenuti `azd down` po završetku kako biste izbjegli daljnje troškove.

### Pokretanje primjera lokalno

1. **Klonirajte ili kopirajte primjer**
   ```bash
   # Navigirajte do željenog primjera
   cd examples/simple-web-app
   ```

2. **Inicijalizirajte AZD okruženje**
   ```bash
   # Inicijaliziraj s postojećim predloškom
   azd init
   
   # Ili stvori novo okruženje
   azd env new my-environment
   ```

3. **Konfigurirajte okruženje**
   ```bash
   # Postavi potrebne varijable
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementirajte**
   ```bash
   # Implementirajte infrastrukturu i aplikaciju
   azd up
   ```

5. **Provjerite implementaciju**
   ```bash
   # Dohvati krajnje točke usluge
   azd env get-values
   
   # Testiraj krajnju točku (primjer)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Očekivani indikatori uspjeha:**
   - ✅ `azd up` se izvršava bez pogrešaka
   - ✅ Krajnja točka servisa vraća HTTP 200
   - ✅ Azure Portal prikazuje status "Running"
   - ✅ Application Insights prima telemetriju

> **⚠️ Problemi?** Pogledajte [Česte poteškoće](../docs/chapter-07-troubleshooting/common-issues.md) za rješavanje problema implementacije

### Prilagodba primjera

Svaki primjer sadrži:
- **README.md** - Detaljne upute za postavljanje i prilagodbu
- **azure.yaml** - AZD konfiguracija s komentarima
- **infra/** - Bicep predlošci s objašnjenjima parametara
- **src/** - Primjer aplikacijskog koda
- **scripts/** - Pomoćni skripti za uobičajene zadatke

## 🎯 Ciljevi učenja

### Kategorije primjera

#### **Osnovne implementacije**
- Aplikacije jedne usluge
- Jednostavni infrastrukturni uzorci
- Osnovno upravljanje konfiguracijom
- Troškovno učinkoviti razvojni sustavi

#### **Napredni scenariji**
- Arhitekture s više usluga
- Složene mrežne konfiguracije
- Uzorci integracije baza podataka
- Implementacije sigurnosti i usklađenosti

#### **Uzorci spremni za proizvodnju**
- Konfiguracije visoke dostupnosti
- Nadgledanje i promatranje
- Integracija CI/CD-a
- Postavke za oporavak od katastrofe

## 📖 Opisi primjera

### Jednostavna web aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Složenost**: Početnik  
**Pojmovi**: Osnovna implementacija, REST API, integracija NoSQL baze podataka

### Statička web stranica - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složenost**: Početnik  
**Pojmovi**: Statički hosting, bezserverni backend, suvremeni web razvoj

### Container App - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složenost**: Početnik  
**Pojmovi**: Kontejnerizacija, REST API, scale-to-zero, health probes, nadgledanje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/simple-flask-api)

### Container App - Arhitektura mikroservisa
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složenost**: Napredno  
**Pojmovi**: Arhitektura s više usluga, komunikacija usluga, red čekanja poruka, distribuirano praćenje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/microservices)

### Aplikacija s bazom podataka - C# s Azure SQL-om
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složenost**: Srednja razina  
**Pojmovi**: Entity Framework, veze s bazom podataka, razvoj web API-ja

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složenost**: Srednja razina  
**Pojmovi**: Arhitektura vođena događajima, bezserverno računarstvo, full-stack razvoj

### Mikroservisi - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složenost**: Srednja razina  
**Pojmovi**: Komunikacija mikroservisa, distribuirani sustavi, poduzetnički uzorci

### Microsoft Foundry primjeri

#### Azure OpenAI Chat App
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Složenost**: Srednja razina  
**Pojmovi**: RAG arhitektura, vektorsko pretraživanje, integracija LLM-a

#### AI Obrada dokumenata
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Složenost**: Srednja razina  
**Pojmovi**: Analiza dokumenata, OCR, ekstrakcija podataka

#### Strojno učenje pipeline
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Složenost**: Napredno  
**Pojmovi**: Trening modela, implementacijski pipeline-ovi, nadgledanje

## 🛠 Konfiguracijski primjeri

Direktorij `configurations/` sadrži ponovo upotrebljive komponente:

### Konfiguracije okruženja
- Postavke razvojnih okruženja
- Konfiguracije staging okruženja
- Konfiguracije spremne za produkciju
- Postavke za višeregionalnu implementaciju

### Bicep moduli
- Ponovo upotrebljivi infrastrukturni sastavni dijelovi
- Uobičajeni obrasci resursa
- Sigurnosno ojačani predlošci
- Optimizirane konfiguracije troškova

### Pomoćni skripti
- Automatizacija postavljanja okruženja
- Skripte za migraciju baza podataka
- Alati za provjeru ispravnosti implementacije
- Pomoćne skripte za nadzor troškova

## 🔧 Vodič za prilagodbu

### Prilagodba primjera za vaš slučaj upotrebe

1. **Pregledajte preduvjete**
   - Provjerite zahtjeve Azure servisa
   - Potvrdite ograničenja pretplate
   - Razumite implikacije troškova

2. **Izmijenite konfiguraciju**
   - Ažurirajte definicije servisa u `azure.yaml`
   - Prilagodite Bicep predloške
   - Podešavajte varijable okruženja

3. **Detaljno testirajte**
   - Najprije implementirajte u razvojno okruženje
   - Validirajte funkcionalnost
   - Testirajte skaliranje i performanse

4. **Sigurnosni pregled**
   - Pregledajte kontrole pristupa
   - Implementirajte upravljanje tajnama
   - Omogućite nadzor i upozorenja

## 📊 Matrica usporedbe

| Primjer                     | Usluge | Baza podataka | Autentifikacija | Nadgledanje | Složenost  |
|----------------------------|--------|---------------|-----------------|-------------|------------|
| **Azure OpenAI Chat** (Lokalno) | 2      | ❌            | Key Vault       | Potpuno    | ⭐⭐         |
| **Python Flask API** (Lokalno)  | 1      | ❌            | Osnovno         | Potpuno    | ⭐          |
| **Mikroservisi** (Lokalno)      | 5+     | ✅            | Poduzeće        | Napredno   | ⭐⭐⭐⭐       |
| Node.js Express Todo            | 2      | ✅            | Osnovno         | Osnovno    | ⭐          |
| React SPA + Functions           | 3      | ✅            | Osnovno         | Potpuno    | ⭐          |
| Python Flask Container          | 2      | ❌            | Osnovno         | Potpuno    | ⭐          |
| C# Web API + SQL               | 2      | ✅            | Potpuno         | Potpuno    | ⭐⭐         |
| Python Functions + SPA         | 3      | ✅            | Potpuno         | Potpuno    | ⭐⭐         |
| Java Mikroservisi              | 5+     | ✅            | Potpuno         | Potpuno    | ⭐⭐         |
| Azure OpenAI Chat              | 3      | ✅            | Potpuno         | Potpuno    | ⭐⭐⭐        |
| AI Obrada dokumenata           | 2      | ❌            | Osnovno         | Potpuno    | ⭐⭐         |
| ML Pipeline                   | 4+     | ✅            | Potpuno         | Potpuno    | ⭐⭐⭐⭐       |
| **Retail Multi-Agent** (Lokalno) | **8+** | **✅**        | **Poduzeće**    | **Napredno** | **⭐⭐⭐⭐**   |

## 🎓 Put učenja

### Preporučeni redoslijed

1. **Započnite s jednostavnom web aplikacijom**
   - Naučite osnovne AZD koncepte
   - Razumite tijek implementacije
   - Vježbajte upravljanje okruženjem

2. **Isprobajte statičku web stranicu**
   - Istražite različite opcije hostinga
   - Naučite o CDN integraciji
   - Razumite DNS konfiguraciju

3. **Pređite na Container App**
   - Naučite osnove kontejnerizacije
   - Razumite koncepte skaliranja
   - Vježbajte s Dockerom

4. **Dodajte integraciju baze podataka**
   - Naučite kako provizirati bazu podataka
   - Razumite connection stringove
   - Vježbajte upravljanje tajnama

5. **Istražite serverless**
   - Razumite arhitekturu vođenu događajima
   - Naučite o okidačima i vezama (bindings)
   - Vježbajte s API-jima

6. **Gradite mikroservise**
   - Naučite komunikaciju usluga
   - Razumite distribuirane sustave
   - Vježbajte složene implementacije

## 🔍 Kako pronaći pravi primjer

### Prema tehnološkom stacku
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Mikroservisi
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalno)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL baza, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokalno)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot mikroservisi
- **React**: React SPA + Functions
- **Kontejneri**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java mikroservisi
- **Baze podataka**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI obrada dokumenata, ML Pipeline, **Retail Multi-Agent rješenje**
- **Sustavi s više agenata**: **Retail Multi-Agent rješenje**
- **Integracija OpenAI**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent rješenje
- **Proizvodnja za poduzeće**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent rješenje**

### Prema arhitektonskom uzorku
- **Jednostavni REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolitik**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisi**: [Produkcijski mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot mikroservisi
- **Kontejnerizirano**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices)
- **Pokretano AI-jem**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI obrada dokumenata, ML Pipeline, **Retail Multi-Agent rješenje**
- **Arhitektura s više agenata**: **Retail Multi-Agent rješenje**
- **Enterprise višestruke usluge**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent rješenje**

### Prema razini složenosti
- **Početnik**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Srednja razina**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java mikroservisi, Azure OpenAI Chat App, AI obrada dokumenata
- **Napredno**: ML Pipeline
- **Spremno za proizvodnju u poduzeću**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices) (više usluga s redom čekanja poruka), **Retail Multi-Agent rješenje** (kompletni sustav s više agenata s ARM predloškom)

## 📚 Dodatni resursi

### Linkovi na dokumentaciju
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primjeri iz zajednice
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo app s C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo app s Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo aplikacija s Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React web aplikacija s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Javom](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najbolje prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Doprinos primjera

Imate koristan primjer za podijeliti? Dobrodošli su doprinosi!

### Smjernice za predaju
1. Slijedite uspostavljenu strukturu direktorija
2. Uključite sveobuhvatan README.md
3. Dodajte komentare u konfiguracijske datoteke
4. Temeljito testirajte prije predaje
5. Uključite procjene troškova i preduvjete

### Struktura predloška primjera
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

**Stručni savjet**: Počnite s najjednostavnijim primjerom koji odgovara vašem tehnološkom stacku, a zatim postupno idite prema složenijim scenarijima. Svaki primjer nadograđuje koncepte iz prethodnih!

## 🚀 Spremni za početak?

### Vaš put učenja

1. **Potpuni početnik?** → Počnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuta)
2. **Imate osnovno znanje o AZD-u?** → Isprobajte [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuta)
3. **Gradite AI aplikacije?** → Počnite s [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuta) ili istražite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ sata)
4. **Trebate specifičan tehnički stack?** → Koristite odjeljak [Pronalaženje pravog primjera](../../../examples) gore

### Sljedeći koraci

- ✅ Pregledajte [Preduvjete](../../../examples) gore
- ✅ Odaberite primjer koji odgovara vašoj razini vještine (pogledajte [Legenda za složenost](../../../examples))
- ✅ Pažljivo pročitajte README primjera prije implementacije
- ✅ Postavite podsjetnik za pokretanje `azd down` nakon testiranja
- ✅ Podijelite svoje iskustvo putem GitHub Issues ili Discussions

### Trebate pomoć?

- 📖 [Često postavljana pitanja](../resources/faq.md) - Odgovori na uobičajena pitanja
- 🐛 [Vodič za rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md) - Popravite probleme s implementacijom
- 💬 [GitHub rasprave](https://github.com/microsoft/AZD-for-beginners/discussions) - Pitajte zajednicu
- 📚 [Vodič za učenje](../resources/study-guide.md) - Ojačajte svoje znanje

---

**Navigacija**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Materijali za učenje**: [Vodič za učenje](../resources/study-guide.md) | [Prečac](../resources/cheat-sheet.md) | [Rječnik](../resources/glossary.md)
- **🔧 Resursi**: [Često postavljana pitanja](../resources/faq.md) | [Rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zadnje ažuriranje: studeni 2025. | [Prijavi probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Doprinesi primjerima](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument preveden je korištenjem AI prevodilačke usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba se smatrati autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->