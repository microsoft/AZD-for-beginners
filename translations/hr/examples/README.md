# Primjeri - Praktični AZD predlošci i konfiguracije

**Učenje kroz primjere - organizirano po poglavljima**  
- **📚 Početna stranica kolegija**: [AZD za početnike](../README.md)  
- **📖 Preslikavanje poglavlja**: Primjeri organizirani po složenosti učenja  
- **🚀 Lokalni primjer**: [Rješenje za maloprodaju s više agenata](retail-scenario.md)  
- **🤖 Primjeri vanjskog AI-a**: Linkovi na repozitorije Azure Samples  

> **📍 VAŽNO: Lokalni naspram Vanjskih Primjera**  
> Ovaj repozitorij sadrži **4 potpuna lokalna primjera** s potpunim implementacijama:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 implementacija s chat sučeljem)  
> - **Container Apps** (Jednostavan Flask API + mikroservisi)  
> - **Database App** (Web + SQL baza podataka)  
> - **Retail Multi-Agent** (Enterprise AI rješenje)  
>  
> Dodatni primjeri su **vanjske reference** na Azure-Samples repozitorije koje možete klonirati.

## Uvod

Ovaj direktorij pruža praktične primjere i reference kako biste naučili Azure Developer CLI kroz praktičnu primjenu. Scenarij Retail Multi-Agent je potpuna, spremna za produkciju implementacija uključena u ovaj repozitorij. Dodatni primjeri upućuju na službene Azure Samples koji demonstriraju razne AZD obrasce.

### Legenda ocjenjivanja složenosti

- ⭐ **Početnik** - Osnovni pojmovi, jedna usluga, 15-30 minuta  
- ⭐⭐ **Srednji nivo** - Više usluga, integracija baze podataka, 30-60 minuta  
- ⭐⭐⭐ **Napredni** - Složena arhitektura, AI integracija, 1-2 sata  
- ⭐⭐⭐⭐ **Stručnjak** - Spremno za produkciju, enterprise obrasci, 2+ sata  

## 🎯 Što se zapravo nalazi u ovom repozitoriju

### ✅ Lokalna implementacija (spremna za korištenje)

#### [Microsoft Foundry Models Chat aplikacija](azure-openai-chat/README.md) 🆕  
**Potpuna gpt-4.1 implementacija s chat sučeljem uključena u ovaj repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`  
- **Složenost:** ⭐⭐ (Srednji nivo)  
- **Što je uključeno:**  
  - Potpuna Microsoft Foundry Models implementacija (gpt-4.1)  
  - Python chat sučelje iz komandne linije  
  - Integracija Key Vault za sigurne API ključeve  
  - Bicep predlošci infrastrukture  
  - Praćenje korištenja tokena i troškova  
  - Ograničavanje brzine i rukovanje greškama  

**Brzi početak:**  
```bash
# Navigiraj na primjer
cd examples/azure-openai-chat

# Postavi sve
azd up

# Instaliraj ovisnosti i započni razgovor
pip install -r src/requirements.txt
python src/chat.py
```
  
**Tehnologije:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep  

#### [Primjeri Container App](container-app/README.md) 🆕  
**Sveobuhvatni primjeri implementacije kontejnera uključeni u ovaj repozitorij**

- **Lokacija:** `examples/container-app/`  
- **Složenost:** ⭐-⭐⭐⭐⭐ (Početnik do Napredni)  
- **Što je uključeno:**  
  - [Glavni vodič](container-app/README.md) - Potpun pregled implementacije kontejnera  
  - [Jednostavan Flask API](../../../examples/container-app/simple-flask-api) - Osnovni REST API primjer  
  - [Arhitektura mikroservisa](../../../examples/container-app/microservices) - Produkcijski spremna implementacija više usluga  
  - Brzi početak, produkcija i napredni obrasci  
  - Praćenje, sigurnost i optimizacija troškova  

**Brzi početak:**  
```bash
# Pogledaj glavni vodič
cd examples/container-app

# Postavi jednostavni Flask API
cd simple-flask-api
azd up

# Postavi primjer mikroservisa
cd ../microservices
azd up
```
  
**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights  

#### [Retail Multi-Agent Solution](retail-scenario.md) 🆕  
**Potpuna produkcijski spremna implementacija uključena u ovaj repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`  
- **Složenost:** ⭐⭐⭐⭐ (Napredni)  
- **Što je uključeno:**  
  - Potpuni ARM predložak za implementaciju  
  - Višeagentska arhitektura (Korisnik + Inventar)  
  - Integracija Microsoft Foundry Models  
  - AI pretraživanje s RAG  
  - Sveobuhvatno praćenje  
  - Skripta za jednim klikom implementaciju  

**Brzi početak:**  
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```
  
**Tehnologije:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights  

---

## 🔗 Vanjski Azure Samples (Klonirajte za korištenje)

Sljedeći primjeri se održavaju u službenim Azure-Samples repozitorijima. Klonirajte ih da istražite različite AZD obrasce:

### Jednostavne aplikacije (Poglavlja 1-2)

| Predložak | Repozitorij | Složenost | Usluge |
|:---------|:-----------|:----------|:-------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Više usluga, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako koristiti:**  
```bash
# Kloniraj bilo koji primjer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Postavi
azd up
```
  
### Primjeri AI aplikacija (Poglavlja 2, 5, 8)

| Predložak | Repozitorij | Složenost | Fokus |
|:---------|:-----------|:----------|:-------|
| **Microsoft Foundry Models Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 implementacija |
| **AI Chat Brzi početak** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG obrazac |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Baze podataka i napredni obrasci (Poglavlja 3-8)

| Predložak | Repozitorij | Složenost | Fokus |
|:---------|:-----------|:----------|:-------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podataka |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Bezposlužna NoSQL integracija |
| **Java Mikroservisi** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Više usluga |
| **ML pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciljevi učenja

Kroz rad na ovim primjerima, naučit ćete:  
- Prakticirati Azure Developer CLI tokove rada kroz realne aplikacijske scenarije  
- Razumjeti različite aplikacijske arhitekture i njihove azd implementacije  
- Ovladati Infrastructure as Code obrascima za razne Azure usluge  
- Primjenjivati upravljanje konfiguracijom i strategije implementacije specifične za okruženja  
- Implementirati obrasce praćenja, sigurnosti i skaliranja u praktičnim kontekstima  
- Steći iskustvo u rješavanju problema i otklanjanju pogrešaka u stvarnim scenarijima implementacije  

## Ishodi učenja

Nakon završetka ovih primjera moći ćete:  
- Sigurno implementirati različite vrste aplikacija koristeći Azure Developer CLI  
- Prilagoditi predloške vlastitim aplikacijskim zahtjevima  
- Dizajnirati i implementirati prilagođene infrastrukturne obrasce koristeći Bicep  
- Konfigurirati složene višeservisne aplikacije s ispravnim ovisnostima  
- Primijeniti sigurnosne, nadzorne i izvedbene najbolje prakse u stvarnim scenarijima  
- Rješavati probleme i optimizirati implementacije na temelju praktičnog iskustva  

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

> **💡 Novi ste u AZD?** Počnite s primjerom #1 (Flask API) - traje oko 20 minuta i uči osnovne koncepte.

### Za početnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Implementirajte jednostavan REST API s automatskim skaliranjem do nule  
   **Vrijeme:** 20-25 minuta | **Trošak:** 0-5 $/mjesečno  
   **Naučit ćete:** Osnovni azd tijek rada, kontejnerizacija, health probes  
   **Očekivani rezultat:** Funkcionalna API točka koja vraća "Hello, World!" s praćenjem

2. **[Jednostavna web aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementirajte Node.js Express web aplikaciju s MongoDB  
   **Vrijeme:** 25-35 minuta | **Trošak:** 10-30 $/mjesečno  
   **Naučit ćete:** Integraciju baze podataka, varijable okruženja, connection strings  
   **Očekivani rezultat:** Todo aplikacija s funkcionalnostima kreiranja/čitanja/izmjene/brisanja

3. **[Static Web Site - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostajte React statičku web stranicu s Azure Static Web Apps  
   **Vrijeme:** 20-30 minuta | **Trošak:** 0-10 $/mjesečno  
   **Naučit ćete:** Statički hosting, serverless funkcije, CDN implementaciju  
   **Očekivani rezultat:** React UI s API backendom, automatskim SSL-om, globalnim CDN-om

### Za srednje korisnike
4. **[Microsoft Foundry Models Chat aplikacija](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Implementirajte gpt-4.1 s chat sučeljem i sigurnim upravljanjem API ključevima  
   **Vrijeme:** 35-45 minuta | **Trošak:** 50-200 $/mjesečno  
   **Naučit ćete:** Microsoft Foundry Models deployment, integraciju Key Vault, praćenje tokena  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s gpt-4.1 i praćenjem troškova

5. **[Container App - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Produkcijski spremna višeservisna arhitektura  
   **Vrijeme:** 45-60 minuta | **Trošak:** 50-150 $/mjesečno  
   **Naučit ćete:** Komunikaciju servisa, redove poruka, distribuirano praćenje  
   **Očekivani rezultat:** Sustav od 2 servisa (API Gateway + Product Service) s praćenjem

6. **[Database App - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web aplikacija s C# API-jem i Azure SQL bazom podataka  
   **Vrijeme:** 30-45 minuta | **Trošak:** 20-80 $/mjesečno  
   **Naučit ćete:** Entity Framework, migracije baze, sigurnost veze  
   **Očekivani rezultat:** C# API s Azure SQL backendom, automatska implementacija sheme

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP triggerima i Cosmos DB  
   **Vrijeme:** 30-40 minuta | **Trošak:** 10-40 $/mjesečno  
   **Naučit ćete:** Event-driven arhitekturu, serverless skaliranje, NoSQL integraciju  
   **Očekivani rezultat:** Funkcija koja odgovara na HTTP zahtjeve sa spremanjem u Cosmos DB

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Višeservisna Java aplikacija s Container Apps i API gatewayjem  
   **Vrijeme:** 60-90 minuta | **Trošak:** 80-200 $/mjesečno  
   **Naučit ćete:** Spring Boot implementaciju, service mesh, balansiranje opterećenja  
   **Očekivani rezultat:** Višeservisni Java sustav s otkrivanjem servisa i rutiranjem

### Microsoft Foundry predlošci

1. **[Microsoft Foundry Models Chat aplikacija - lokalni primjer](../../../examples/azure-openai-chat)** ⭐⭐  
   Potpuna gpt-4.1 implementacija s chat sučeljem  
   **Vrijeme:** 35-45 minuta | **Trošak:** 50-200 $/mjesečno  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s praćenjem tokena i troškova

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna chat aplikacija s RAG arhitekturom  
   **Vrijeme:** 60-90 minuta | **Trošak:** 100-300 $/mjesečno  
   **Očekivani rezultat:** RAG-powered chat sučelje s pretraživanjem dokumenata i citatima

3. **[AI obrada dokumenata](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumenata pomoću Azure AI usluga  
   **Vrijeme:** 40-60 minuta | **Trošak:** 20-80 $/mjesečno  
   **Očekivani rezultat:** API za izvlačenje teksta, tablica i entiteta iz učitanih dokumenata

4. **[Strojno učenje pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps tijek rada s Azure Machine Learning  
   **Vrijeme:** 2-3 sata | **Trošak:** 150-500 $/mjesečno  
   **Očekivani rezultat:** Automatizirani ML pipeline s treniranjem, implementacijom i nadzorom

### Scenariji iz stvarnog svijeta

#### **Retail Multi-Agent Solution** 🆕  
**[Potpuni vodič za implementaciju](./retail-scenario.md)**

Sveobuhvatno, produkcijski spremno višeservisno rješenje za korisničku podršku koje demonstrira implementaciju AI aplikacije enterprise razine s AZD. Ovaj scenarij pruža:  

- **Potpunu arhitekturu:** Višeagentski sustav s agentima specijaliziranim za korisničku službu i upravljanje inventarom
- **Infrastruktura za proizvodnju**: Implementacije Microsoft Foundry Models u više regija, AI Search, Container Apps i sveobuhvatno praćenje
- **ARM predložak spreman za implementaciju**: Implementacija jednim klikom s više načina konfiguracije (Minimalno/Standardno/Premium)
- **Napredne značajke**: Validacija sigurnosti red teamingom, okvir za evaluaciju agenata, optimizacija troškova i vodiči za rješavanje problema
- **Stvarni poslovni kontekst**: Primjer korisničke podrške trgovca s prijenosom datoteka, integracijom pretraživanja i dinamičkim skaliranjem

**Tehnologije**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složenost**: ⭐⭐⭐⭐ (Napredno - Spremno za proizvodnju u poduzeću)

**Savršeno za**: AI developere, arhitekte rješenja i timove koji grade višestruke agente u produkciji

**Brzi početak**: Implementirajte kompletno rješenje za manje od 30 minuta koristeći priloženi ARM predložak s `./deploy.sh -g myResourceGroup`

## 📋 Upute za korištenje

### Preduvjeti

Prije pokretanja bilo kojeg primjera:
- ✅ Pretplata na Azure s pristupom vlasnika ili suradnika
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](../docs/chapter-01-foundation/installation.md))
- ✅ Pokrenut Docker Desktop (za primjere s kontejnerima)
- ✅ Odgovarajuće kvote na Azureu (provjerite zahtjeve specifične za primjer)

> **💰 Upozorenje o troškovima:** Svi primjeri stvaraju stvarne Azure resurse koji generiraju troškove. Pogledajte pojedinačne README datoteke za procjene troškova. Ne zaboravite pokrenuti `azd down` nakon završetka da biste izbjegli nastavne troškove.

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
   # Postavite potrebne varijable
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
   
   **Očekivani pokazatelji uspjeha:**
   - ✅ `azd up` završi bez grešaka
   - ✅ Krajnja točka usluge vraća HTTP 200
   - ✅ Azure Portal prikazuje status "Running"
   - ✅ Application Insights prima telemetriju

> **⚠️ Problemi?** Pogledajte [Česti problemi](../docs/chapter-07-troubleshooting/common-issues.md) za rješavanje problema s implementacijom

### Prilagodba primjera

Svaki primjer sadrži:
- **README.md** - Detaljne upute za postavljanje i prilagodbu
- **azure.yaml** - AZD konfiguracija s komentarima
- **infra/** - Bicep predlošci s objašnjenjima parametara
- **src/** - Primjer koda aplikacije
- **scripts/** - Pomoćni skripti za uobičajene zadatke

## 🎯 Ciljevi učenja

### Kategorije primjera

#### **Osnovne implementacije**
- Aplikacije s jednom uslugom
- Jednostavni obrasci infrastrukture
- Osnovno upravljanje konfiguracijom
- Troškovno učinkovita razvojna okruženja

#### **Napredni scenariji**
- Arhitekture s više usluga
- Kompleksne mrežne konfiguracije
- Obrasci za integraciju baza podataka
- Implementacije sigurnosti i usklađenosti

#### **Obrasci spremni za proizvodnju**
- Konfiguracije visoke dostupnosti
- Praćenje i uočavanje stanja
- Integracija CI/CD procesa
- Postavke za oporavak od katastrofe

## 📖 Opisi primjera

### Jednostavna web aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Složenost**: Početnički  
**Koncepti**: Osnovna implementacija, REST API, integracija NoSQL baze podataka

### Statična web stranica - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složenost**: Početnički  
**Koncepti**: Statični hosting, serverless backend, moderan web razvoj

### Container App - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složenost**: Početnički  
**Koncepti**: Kontejnerizacija, REST API, scale-to-zero, health probes, monitoring  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složenost**: Napredno  
**Koncepti**: Arhitektura s više usluga, komunikacija među uslugama, redovi poruka, distribuirano praćenje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/microservices)

### Aplikacija s bazom podataka - C# s Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složenost**: Srednja razina  
**Koncepti**: Entity Framework, veze s bazom podataka, razvoj web API-ja

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složenost**: Srednja razina  
**Koncepti**: Arhitektura vođena događajima, računarstvo bez servera, full-stack razvoj

### Mikroservisi - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složenost**: Srednja razina  
**Koncepti**: Komunikacija mikroservisa, distribuirani sustavi, obrasci za poduzeća

### Microsoft Foundry primjeri

#### Microsoft Foundry Models Chat App
**Tehnologije**: Microsoft Foundry Models, Azure AI Search, App Service  
**Složenost**: Srednja razina  
**Koncepti**: RAG arhitektura, vektorsko pretraživanje, integracija LLM-a

#### AI obrada dokumenata
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Složenost**: Srednja razina  
**Koncepti**: Analiza dokumenata, OCR, izdvajanje podataka

#### Strojno učenje pipeline
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Složenost**: Napredno  
**Koncepti**: Trening modela, pipeline za implementaciju, monitoring

## 🛠 Primjeri konfiguracija

Direktorij `configurations/` sadrži ponovno upotrebljive komponente:

### Konfiguracije okruženja
- Postavke razvojnih okruženja
- Konfiguracije testnih/staging okruženja
- Konfiguracije spremne za proizvodnju
- Implementacije u više regija

### Bicep moduli
- Ponovno upotrebljivi infrastrukturni dijelovi
- Zajednički obrasci resursa
- Predlošci za povećanu sigurnost
- Optimizirane konfiguracije za troškove

### Pomoćni skripti
- Automatizacija postavljanja okruženja
- Skripte za migraciju baza podataka
- Alati za validaciju implementacije
- Alati za praćenje troškova

## 🔧 Vodič za prilagodbu

### Prilagodba primjera za vaše potrebe

1. **Pregledajte preduvjete**
   - Provjerite zahtjeve Azure usluga
   - Potvrdite limite pretplate
   - Razumite implikacije troškova

2. **Izmijenite konfiguraciju**
   - Ažurirajte definicije usluga u `azure.yaml`
   - Prilagodite Bicep predloške
   - Promijenite varijable okruženja

3. **Temeljito testirajte**
   - Prvo implementirajte u razvojno okruženje
   - Validirajte funkcionalnost
   - Testirajte skalabilnost i performanse

4. **Sigurnosna revizija**
   - Provjerite kontrole pristupa
   - Implementirajte upravljanje tajnama
   - Omogućite monitoring i upozorenja

## 📊 Matrica usporedbe

| Primjer | Usluge | Baza podataka | Autentifikacija | Praćenje | Složenost |
|---------|---------|--------------|-----------------|----------|-----------|
| **Microsoft Foundry Models Chat** (Lokalno) | 2 | ❌ | Key Vault | Puno | ⭐⭐ |
| **Python Flask API** (Lokalno) | 1 | ❌ | Osnovno | Puno | ⭐ |
| **Microservices** (Lokalno) | 5+ | ✅ | Enterprise | Napredno | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Puno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Puno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Puno | Puno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Puno | Puno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Puno | Puno | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Puno | Puno | ⭐⭐⭐ |
| AI obrada dokumenata | 2 | ❌ | Osnovno | Puno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Puno | Puno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalno) | **8+** | **✅** | **Enterprise** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Put učenja

### Preporučeni tijek

1. **Započnite s jednostavnom web aplikacijom**
   - Naučite osnovne AZD koncepte
   - Razumite tok rada implementacije
   - Vježbajte upravljanje okruženjem

2. **Isprobajte statičnu web stranicu**
   - Istražite različite opcije hostinga
   - Naučite o integraciji CDN-a
   - Razumite DNS konfiguraciju

3. **Prijeđite na Container App**
   - Naučite osnove kontejnerizacije
   - Razumite pojmove skaliranja
   - Vježbajte s Dockerom

4. **Dodajte integraciju baze podataka**
   - Naučite o provisioningu baza podataka
   - Razumite connection stringove
   - Vježbajte upravljanje tajnama

5. **Istražite serverless**
   - Razumite arhitekturu vođenu događajima
   - Naučite o triggerima i bindingovima
   - Vježbajte s API-jima

6. **Izgradite mikroservise**
   - Naučite komunikaciju usluga
   - Razumite distribuirane sustave
   - Vježbajte složene implementacije

## 🔍 Pronalaženje pravog primjera

### Po tehnološkom stogu
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokalno)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokalno)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejneri**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices), Java Microservices
- **Baze podataka**: [Microservices (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI obrada dokumenata, ML Pipeline, **Retail Multi-Agent rješenje**
- **Sustavi s više agenata**: **Retail Multi-Agent rješenje**
- **OpenAI integracija**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent rješenje
- **Enterprise proizvodnja**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent rješenje**

### Po arhitektonskom obrascu
- **Jednostavni REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolitno**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisi**: [Production Microservices (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontejnerizirano**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Microservices (Lokalno)](../../../examples/container-app/microservices)
- **AI-pokretano**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI obrada dokumenata, ML Pipeline, **Retail Multi-Agent rješenje**
- **Arhitektura s više agenata**: **Retail Multi-Agent rješenje**
- **Enterprise višeservisno**: [Microservices (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent rješenje**

### Po razini složenosti
- **Početnik**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Srednja razina**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI obrada dokumenata
- **Napredno**: ML Pipeline
- **Spremno za enterprise proizvodnju**: [Microservices (Lokalno)](../../../examples/container-app/microservices) (Višeservisno s redovima poruka), **Retail Multi-Agent rješenje** (Kompletan sustav više agenata s implementacijom ARM predloška)

## 📚 Dodatni resursi

### Linkovi na dokumentaciju
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD predlošci](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primjeri iz zajednice
- [Azure Samples AZD predlošci](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry predlošci](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerija](https://azure.github.io/awesome-azd/)
- [Todo aplikacija s C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo aplikacija s Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo aplikacija s Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React web-aplikacija s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps posao](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Javom](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najbolje prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Okvir za usvajanje oblaka](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Doprinos primjera

Imate koristan primjer za podijeliti? Dobrodošli su vaši doprinosi!

### Smjernice za predaju
1. Slijedite uspostavljenu strukturu direktorija
2. Uključite sveobuhvatan README.md
3. Dodajte komentare u konfiguracijske datoteke
4. Temeljito testirajte prije predaje
5. Uključite procjene troškova i preduvjete

### Primjer strukture predloška
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

**Stručni savjet**: Počnite s najjednostavnijim primjerom koji odgovara vašem tehnološkom stogu, zatim postupno napredujte prema složenijim scenarijima. Svaki primjer gradi na konceptima iz prethodnih!

## 🚀 Spremni za početak?

### Vaš put učenja

1. **Potpuni početnik?** → Počnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuta)
2. **Imate osnovno znanje o AZD-u?** → Isprobajte [Mikroservise](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuta)
3. **Gradite AI aplikacije?** → Počnite s [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuta) ili istražite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ sata)
4. **Trebate specifični tehnološki stog?** → Koristite odjeljak [Pronalaženje pravog primjera](#-finding-the-right-example) gore

### Sljedeći koraci

- ✅ Pregledajte [Preduvjete](#preduvjeti) iznad
- ✅ Odaberite primjer koji odgovara vašoj razini vještine (vidi [Legenda ocjene složenosti](#legenda-ocjenjivanja-složenosti))
- ✅ Pomno pročitajte README primjera prije implementacije
- ✅ Postavite podsjetnik za pokretanje `azd down` nakon testiranja
- ✅ Podijelite svoja iskustva putem GitHub Issues ili Discussions

### Trebate pomoć?

- 📖 [FAQ](../resources/faq.md) - Odgovori na često postavljena pitanja
- 🐛 [Vodič za rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md) - Popravak problema s implementacijom
- 💬 [GitHub Rasprave](https://github.com/microsoft/AZD-for-beginners/discussions) - Pitajte zajednicu
- 📚 [Vodič za učenje](../resources/study-guide.md) - Ojačajte svoje znanje

---

**Navigacija**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Materijali za učenje**: [Vodič za učenje](../resources/study-guide.md) | [Priručnik](../resources/cheat-sheet.md) | [Rječnik](../resources/glossary.md)
- **🔧 Resursi**: [FAQ](../resources/faq.md) | [Rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zadnje ažuriranje: studeni 2025. | [Prijavi probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Doprinesi primjere](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->