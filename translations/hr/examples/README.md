# Primjeri - Praktični AZD predlošci i konfiguracije

**Učenje kroz primjere - organizirano po poglavljima**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Mapiranje poglavlja**: Primjeri organizirani prema složenosti učenja
- **🚀 Lokalni primjer**: [Rješenje za maloprodaju s više agenata](retail-scenario.md)
- **🤖 Vanjski AI primjeri**: Poveznice na repozitorije Azure Samples

> **📍 VAŽNO: Lokalni vs vanjski primjeri**  
> Ovaj repozitorij sadrži **4 kompletna lokalna primjera** s punim implementacijama:  
> - **Azure OpenAI Chat** (GPT-4 implementacija s chat sučeljem)  
> - **Container Apps** (Jednostavni Flask API + mikroservisi)  
> - **Database App** (Web + SQL baza podataka)  
> - **Rješenje za maloprodaju s više agenata** (Enterprise AI rješenje)  
>  
> Dodatni primjeri su **vanjske reference** na repozitorije Azure-Samples koje možete klonirati.

## Uvod

Ovaj direktorij pruža praktične primjere i reference za učenje Azure Developer CLI kroz praktičnu primjenu. Scenarij za maloprodaju s više agenata je kompletna, spremna za produkciju implementacija uključena u ovaj repozitorij. Dodatni primjeri referiraju službene Azure Samples koji demonstriraju različite AZD obrasce.

### Legenda ocjene složenosti

- ⭐ **Početnik** - Osnovni koncepti, jedna usluga, 15-30 minuta
- ⭐⭐ **Srednji** - Više usluga, integracija baze podataka, 30-60 minuta
- ⭐⭐⭐ **Napredni** - Složena arhitektura, AI integracija, 1-2 sata
- ⭐⭐⭐⭐ **Ekspert** - Spremno za produkciju, enterprise obrasci, 2+ sata

## 🎯 Što se zapravo nalazi u ovom repozitoriju

### ✅ Lokalna implementacija (spremno za korištenje)

#### [Azure OpenAI Chat aplikacija](azure-openai-chat/README.md) 🆕
**Kompletna GPT-4 implementacija s chat sučeljem uključena u ovaj repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`
- **Složenost:** ⭐⭐ (Srednji)
- **Što je uključeno:**
  - Kompletna Azure OpenAI implementacija (GPT-4)
  - Python sučelje za chat putem naredbenog retka
  - Integracija Key Vaulta za sigurne API ključeve
  - Bicep predlošci infrastrukture
  - Praćenje korištenja tokena i troškova
  - Ograničenje brzine i rukovanje greškama

**Brzi početak:**
```bash
# Navigirajte do primjera
cd examples/azure-openai-chat

# Implementirajte sve
azd up

# Instalirajte ovisnosti i započnite razgovor
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Primjeri aplikacija u kontejnerima](container-app/README.md) 🆕
**Sveobuhvatni primjeri implementacije aplikacija u kontejnerima uključeni u ovaj repozitorij**

- **Lokacija:** `examples/container-app/`
- **Složenost:** ⭐-⭐⭐⭐⭐ (Početnik do ekspert)
- **Što je uključeno:**
  - [Glavni vodič](container-app/README.md) - Potpuni pregled implementacije aplikacija u kontejnerima
  - [Jednostavni Flask API](../../../examples/container-app/simple-flask-api) - Osnovni primjer REST API-ja
  - [Arhitektura mikroservisa](../../../examples/container-app/microservices) - Spremna za produkciju implementacija s više servisa
  - Obrasci za brzi početak, produkciju i napredne primjene
  - Praćenje, sigurnost i optimizacija troškova

**Brzi početak:**
```bash
# Pogledajte glavni vodič
cd examples/container-app

# Postavite jednostavni Flask API
cd simple-flask-api
azd up

# Postavite primjer mikroservisa
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Rješenje za maloprodaju s više agenata](retail-scenario.md) 🆕
**Kompletna implementacija spremna za produkciju uključena u ovaj repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`
- **Složenost:** ⭐⭐⭐⭐ (Napredni)
- **Što je uključeno:**
  - Kompletan ARM predložak za implementaciju
  - Arhitektura s više agenata (Kupac + Inventar)
  - Integracija Azure OpenAI
  - AI pretraživanje s RAG-om
  - Sveobuhvatno praćenje
  - Skripta za implementaciju jednim klikom

**Brzi početak:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Azure OpenAI, AI pretraživanje, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Vanjski Azure primjeri (klonirajte za korištenje)

Sljedeći primjeri održavaju se u službenim repozitorijima Azure-Samples. Klonirajte ih kako biste istražili različite AZD obrasce:

### Jednostavne aplikacije (Poglavlja 1-2)

| Predložak | Repozitorij | Složenost | Usluge |
|:----------|:------------|:----------|:-------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Više servisa, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako koristiti:**
```bash
# Kloniraj bilo koji primjer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Implementiraj
azd up
```

### Primjeri AI aplikacija (Poglavlja 2, 5, 8)

| Predložak | Repozitorij | Složenost | Fokus |
|:----------|:------------|:----------|:------|
| **Azure OpenAI Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 implementacija |
| **Brzi početak AI chata** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI chat |
| **AI agenti** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Okvir za agente |
| **Demo pretraživanja + OpenAI** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG obrazac |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Baze podataka i napredni obrasci (Poglavlja 3-8)

| Predložak | Repozitorij | Složenost | Fokus |
|:----------|:------------|:----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podataka |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java mikroservisi** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Više servisa |
| **ML cjevovod** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciljevi učenja

Radom na ovim primjerima, naučit ćete:
- Prakticirati Azure Developer CLI radne procese kroz realne aplikacijske scenarije
- Razumjeti različite arhitekture aplikacija i njihove AZD implementacije
- Ovladati obrascima infrastrukture kao koda za različite Azure usluge
- Primijeniti upravljanje konfiguracijom i strategije implementacije specifične za okruženje
- Implementirati obrasce za praćenje, sigurnost i skaliranje u praktičnim kontekstima
- Steći iskustvo u rješavanju problema i otklanjanju grešaka u stvarnim scenarijima implementacije

## Ishodi učenja

Nakon završetka ovih primjera, moći ćete:
- Pouzdano implementirati različite vrste aplikacija koristeći Azure Developer CLI
- Prilagoditi pružene predloške vlastitim zahtjevima aplikacije
- Dizajnirati i implementirati prilagođene obrasce infrastrukture koristeći Bicep
- Konfigurirati složene aplikacije s više servisa s odgovarajućim ovisnostima
- Primijeniti najbolje prakse za sigurnost, praćenje i performanse u stvarnim scenarijima
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

> **💡 Novi u AZD-u?** Započnite s primjerom #1 (Flask API) - traje ~20 minuta i podučava osnovne koncepte.

### Za početnike
1. **[Aplikacija u kontejneru - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Implementirajte jednostavni REST API s skaliranjem na nulu  
   **Vrijeme:** 20-25 minuta | **Trošak:** $0-5/mjesečno  
   **Što ćete naučiti:** Osnovni AZD radni proces, kontejnerizacija, provjere zdravlja  
   **Očekivani rezultat:** Funkcionalna API krajnja točka koja vraća "Hello, World!" s praćenjem

2. **[Jednostavna web aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementirajte Node.js Express web aplikaciju s MongoDB-om  
   **Vrijeme:** 25-35 minuta | **Trošak:** $10-30/mjesečno  
   **Što ćete naučiti:** Integracija baze podataka, varijable okruženja, nizovi za povezivanje  
   **Očekivani rezultat:** Aplikacija za popis zadataka s funkcionalnostima stvaranja/čitanja/ažuriranja/brisanja

3. **[Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostajte React statičku web stranicu s Azure Static Web Apps  
   **Vrijeme:** 20-30 minuta | **Trošak:** $0-10/mjesečno  
   **Što ćete naučiti:** Statično hostanje, serverless funkcije, implementacija CDN-a  
   **Očekivani rezultat:** React korisničko sučelje s API pozadinom, automatski SSL, globalni CDN

### Za srednje korisnike
4. **[Azure OpenAI Chat aplikacija](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Implementirajte GPT-4 s chat sučeljem i sigurnim upravljanjem API ključevima  
   **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno  
   **Što ćete naučiti:** Implementacija Azure OpenAI, integracija Key Vaulta, praćenje tokena  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s GPT-4 i praćenjem troškova

5. **[Aplikacija u kontejneru - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Arhitektura s više servisa spremna za produkciju  
   **Vrijeme:** 45-60 minuta | **Trošak:** $50-150/mjesečno  
   **Što ćete naučiti:** Komunikacija servisa, redovi poruka, distribuirano praćenje  
   **Očekivani rezultat:** Sustav s 2 servisa (API Gateway + Product Service) s praćenjem

6. **[Aplikacija baze podataka - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web aplikacija s C# API-jem i Azure SQL bazom podataka  
   **Vrijeme:** 30-45 minuta | **Trošak:** $20-80/mjesečno  
   **Što ćete naučiti:** Entity Framework, migracije baze podataka, sigurnost povezivanja  
   **Očekivani rezultat:** C# API s Azure SQL pozadinom, automatska implementacija sheme

7. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP okidačima i Cosmos DB-om  
   **Vrijeme:** 30-40 minuta | **Trošak:** $10-40/mjesečno  
   **Što ćete naučiti:** Arhitektura temeljena na događajima, serverless skaliranje, integracija NoSQL-a  
   **Očekivani rezultat:** Funkcija aplikacije koja odgovara na HTTP zahtjeve s Cosmos DB pohranom

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Višeservisna Java aplikacija s Container Apps i API gatewayom  
   **Vrijeme:** 60-90 minuta | **Trošak:** $80-200/mjesečno  
   **Što ćete naučiti:** Implementacija Spring Boota, mreža servisa, balansiranje opterećenja  
   **Očekivani rezultat:** Višeservisni Java sustav s otkrivanjem servisa i usmjeravanjem

### Predlošci Azure AI Foundry

1. **[Azure OpenAI Chat aplikacija - Lokalni primjer](../../../examples/azure-openai-chat)** ⭐⭐  
   Kompletna GPT-4 implementacija s chat sučeljem  
   **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s praćenjem tokena i troškova

2. **[Azure pretraživanje + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna chat aplikacija s RAG arhitekturom  
   **Vrijeme:** 60-90 minuta | **Trošak:** $100-300/mjesečno  
   **Očekivani rezultat:** Chat sučelje pogonjeno RAG-om s pretraživanjem dokumenata i citatima

3. **[AI obrada dokumenata](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumenata koristeći Azure AI usluge  
   **Vrijeme:** 40-60 minuta | **Trošak:** $20-80/mjesečno  
   **Očekivani rezultat:** API za izdvajanje teksta, tablica i entiteta iz prenesenih dokumenata

4. **[Cjevovod strojnog učenja](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps radni proces s Azure Machine Learning  
   **Vrijeme:** 2-3 sata | **Trošak:** $150-500/mjesečno  
   **Očekivani rezultat:** Automatizirani ML cjevovod s treniranjem, implementacijom i praćenjem

### Scenariji iz stvarnog svijeta

#### **Rješenje za maloprodaju s više agenata** 🆕
**[Kompletan vodič za implementaciju](./retail-scenario.md)**

Sveobuhvatno, spremno za produkciju rješenje za korisničku podršku s više agenata koje demonstrira implementaciju enterprise-grade AI aplikacije s AZD-om. Ovaj scenarij pruža:

- **Kompletna arhitektura**: Sustav s više agenata sa specijaliziranim agentima za korisničku podršku i upravljanje inventarom
- **Proizvodna infrastruktura**: Višeregionalne Azure OpenAI implementacije, AI pretraživanje, Container Apps i sveobuhvatno praćenje
- **Spremni ARM predložak za implementaciju**: Jednostavna implementacija s više načina konfiguracije (Minimalno/Standardno/Premium)
- **Napredne značajke**: Sigurnosna validacija red teaming, okvir za evaluaciju agenata, optimizacija troškova i vodiči za rješavanje problema
- **Stvarni poslovni kontekst**: Korisnička podrška za trgovce s prijenosom datoteka, integracijom pretraživanja i dinamičkim skaliranjem

**Tehnologije**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složenost**: ⭐⭐⭐⭐ (Napredno - Spremno za proizvodnju u poduzeću)

**Idealno za**: AI programere, arhitekte rješenja i timove koji razvijaju proizvodne sustave s više agenata

**Brzi početak**: Implementirajte kompletno rješenje za manje od 30 minuta koristeći priloženi ARM predložak s `./deploy.sh -g myResourceGroup`

## 📋 Upute za korištenje

### Preduvjeti

Prije pokretanja bilo kojeg primjera:
- ✅ Azure pretplata s pristupom vlasnika ili suradnika
- ✅ Instaliran Azure Developer CLI ([Vodič za instalaciju](../docs/getting-started/installation.md))
- ✅ Pokrenut Docker Desktop (za primjere s kontejnerima)
- ✅ Odgovarajuće Azure kvote (provjerite zahtjeve specifične za primjer)

> **💰 Upozorenje o troškovima:** Svi primjeri stvaraju stvarne Azure resurse koji generiraju troškove. Pogledajte pojedinačne README datoteke za procjene troškova. Ne zaboravite pokrenuti `azd down` kada završite kako biste izbjegli stalne troškove.

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
   # Implementiraj infrastrukturu i aplikaciju
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
   - ✅ `azd up` završava bez grešaka
   - ✅ Krajnja točka usluge vraća HTTP 200
   - ✅ Azure Portal prikazuje status "Running"
   - ✅ Application Insights prima telemetriju

> **⚠️ Problemi?** Pogledajte [Uobičajeni problemi](../docs/troubleshooting/common-issues.md) za rješavanje problema s implementacijom

### Prilagodba primjera

Svaki primjer uključuje:
- **README.md** - Detaljne upute za postavljanje i prilagodbu
- **azure.yaml** - AZD konfiguracija s komentarima
- **infra/** - Bicep predlošci s objašnjenjem parametara
- **src/** - Uzorak aplikacijskog koda
- **scripts/** - Pomoćni skripti za uobičajene zadatke

## 🎯 Ciljevi učenja

### Kategorije primjera

#### **Osnovne implementacije**
- Aplikacije s jednom uslugom
- Jednostavni infrastrukturni obrasci
- Osnovno upravljanje konfiguracijom
- Isplativa razvojna okruženja

#### **Napredni scenariji**
- Arhitekture s više usluga
- Složene mrežne konfiguracije
- Obrasci integracije baza podataka
- Implementacije sigurnosti i usklađenosti

#### **Obrasci spremni za proizvodnju**
- Konfiguracije visoke dostupnosti
- Praćenje i preglednost
- Integracija CI/CD
- Postavke za oporavak od katastrofe

## 📖 Opisi primjera

### Jednostavna web aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Složenost**: Početnik  
**Koncepti**: Osnovna implementacija, REST API, integracija NoSQL baze podataka

### Statička web stranica - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složenost**: Početnik  
**Koncepti**: Statičko hostiranje, serverless backend, moderni web razvoj

### Container App - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složenost**: Početnik  
**Koncepti**: Kontejnerizacija, REST API, skaliranje na nulu, zdravstvene provjere, praćenje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/simple-flask-api)

### Container App - Arhitektura mikroservisa
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složenost**: Napredno  
**Koncepti**: Arhitektura s više usluga, komunikacija između usluga, redovi poruka, distribuirano praćenje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/microservices)

### Aplikacija s bazom podataka - C# s Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složenost**: Srednje  
**Koncepti**: Entity Framework, povezivanje s bazom podataka, razvoj web API-ja

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složenost**: Srednje  
**Koncepti**: Arhitektura temeljena na događajima, serverless računalstvo, razvoj full-stack aplikacija

### Mikroservisi - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složenost**: Srednje  
**Koncepti**: Komunikacija mikroservisa, distribuirani sustavi, obrasci za poduzeća

### Azure AI Foundry primjeri

#### Azure OpenAI Chat App
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Složenost**: Srednje  
**Koncepti**: RAG arhitektura, vektorsko pretraživanje, integracija LLM-a

#### Obrada AI dokumenata
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Složenost**: Srednje  
**Koncepti**: Analiza dokumenata, OCR, ekstrakcija podataka

#### Strojno učenje - ML pipeline
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Složenost**: Napredno  
**Koncepti**: Treniranje modela, implementacijski procesi, praćenje

## 🛠 Primjeri konfiguracije

Direktorij `configurations/` sadrži komponente za višekratnu upotrebu:

### Konfiguracije okruženja
- Postavke za razvojno okruženje
- Konfiguracije za testno okruženje
- Konfiguracije spremne za proizvodnju
- Postavke za višeregionalnu implementaciju

### Bicep moduli
- Komponente infrastrukture za višekratnu upotrebu
- Uobičajeni obrasci resursa
- Sigurnosno ojačani predlošci
- Konfiguracije optimizirane za troškove

### Pomoćni skripti
- Automatizacija postavljanja okruženja
- Skripti za migraciju baza podataka
- Alati za validaciju implementacije
- Alati za praćenje troškova

## 🔧 Vodič za prilagodbu

### Prilagodba primjera za vaše potrebe

1. **Pregledajte preduvjete**
   - Provjerite zahtjeve za Azure usluge
   - Provjerite ograničenja pretplate
   - Razumite implikacije troškova

2. **Izmijenite konfiguraciju**
   - Ažurirajte definicije usluga u `azure.yaml`
   - Prilagodite Bicep predloške
   - Prilagodite varijable okruženja

3. **Temeljito testirajte**
   - Prvo implementirajte u razvojno okruženje
   - Validirajte funkcionalnost
   - Testirajte skaliranje i performanse

4. **Sigurnosni pregled**
   - Pregledajte kontrole pristupa
   - Implementirajte upravljanje tajnama
   - Omogućite praćenje i upozorenja

## 📊 Matrica usporedbe

| Primjer | Usluge | Baza podataka | Autentifikacija | Praćenje | Složenost |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokalno) | 2 | ❌ | Key Vault | Puno | ⭐⭐ |
| **Python Flask API** (Lokalno) | 1 | ❌ | Osnovno | Puno | ⭐ |
| **Mikroservisi** (Lokalno) | 5+ | ✅ | Poduzeće | Napredno | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Puno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Puno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Puno | Puno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Puno | Puno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Puno | Puno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Puno | Puno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Puno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Puno | Puno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokalno) | **8+** | **✅** | **Poduzeće** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Put učenja

### Preporučeni redoslijed

1. **Započnite s jednostavnom web aplikacijom**
   - Naučite osnovne AZD koncepte
   - Razumite tijek implementacije
   - Vježbajte upravljanje okruženjem

2. **Isprobajte statičku web stranicu**
   - Istražite različite opcije hostinga
   - Naučite o integraciji CDN-a
   - Razumite konfiguraciju DNS-a

3. **Prijeđite na Container App**
   - Naučite osnove kontejnerizacije
   - Razumite koncepte skaliranja
   - Vježbajte s Dockerom

4. **Dodajte integraciju baze podataka**
   - Naučite o postavljanju baza podataka
   - Razumite veze s bazom podataka
   - Vježbajte upravljanje tajnama

5. **Istražite serverless**
   - Razumite arhitekturu temeljenu na događajima
   - Naučite o okidačima i vezama
   - Vježbajte s API-ima

6. **Izgradite mikroservise**
   - Naučite komunikaciju između usluga
   - Razumite distribuirane sustave
   - Vježbajte složene implementacije

## 🔍 Pronalaženje pravog primjera

### Prema tehnološkom sklopu
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [API Gateway mikroservisa (Lokalno)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Product Service mikroservisa (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Order Service mikroservisa (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [User Service mikroservisa (Lokalno)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot mikroservisi
- **React**: React SPA + Functions
- **Kontejneri**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java mikroservisi
- **Baze podataka**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sustavi s više agenata**: **Retail Multi-Agent Solution**
- **Integracija OpenAI**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Proizvodnja u poduzeću**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Prema arhitekturnom obrascu
- **Jednostavni REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)
- **Monolitni**: Node.js Express Todo, C# Web API + SQL
- **Statički + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisi**: [Proizvodni mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot mikroservisi
- **Kontejnerizirani**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices)
- **AI-pogon**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arhitektura s više agenata**: **Retail Multi-Agent Solution**
- **Višeservisno poduzeće**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Prema razini složenosti
- **Početnik**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Srednje**: **[Azure OpenAI Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java mikroservisi, Azure OpenAI Chat App, AI Document Processing
- **Napredno**: ML Pipeline
- **Spremno za proizvodnju u poduzeću**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices) (Višeservisno s redovima poruka), **Retail Multi-Agent Solution** (Kompletan sustav s više agenata s ARM predloškom za implementaciju)

## 📚 Dodatni resursi

### Dokumentacijski linkovi
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primjeri iz zajednice
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App s C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App s Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo aplikacija s Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React web aplikacija s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Javom](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najbolje prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Primjeri za doprinos

Imate koristan primjer za podijeliti? Pozdravljamo vaše doprinose!

### Smjernice za predaju
1. Slijedite utvrđenu strukturu direktorija
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

**Savjet**: Započnite s najjednostavnijim primjerom koji odgovara vašem tehnološkom stacku, a zatim postupno prelazite na složenije scenarije. Svaki primjer nadograđuje koncepte iz prethodnih!

## 🚀 Spremni za početak?

### Vaš put učenja

1. **Potpuni početnik?** → Započnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Imate osnovno znanje o AZD-u?** → Isprobajte [Mikroservise](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Gradite AI aplikacije?** → Započnite s [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) ili istražite [Maloprodajni Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ sata)
4. **Trebate specifičan tehnološki stack?** → Koristite odjeljak [Pronalaženje pravog primjera](../../../examples) iznad

### Sljedeći koraci

- ✅ Pregledajte [Preduvjete](../../../examples) iznad
- ✅ Odaberite primjer koji odgovara vašoj razini vještine (pogledajte [Legenda složenosti](../../../examples))
- ✅ Pažljivo pročitajte README primjera prije implementacije
- ✅ Postavite podsjetnik za pokretanje `azd down` nakon testiranja
- ✅ Podijelite svoje iskustvo putem GitHub Issues ili Discussions

### Trebate pomoć?

- 📖 [FAQ](../resources/faq.md) - Odgovori na česta pitanja
- 🐛 [Vodič za otklanjanje poteškoća](../docs/troubleshooting/common-issues.md) - Rješavanje problema s implementacijom
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Pitajte zajednicu
- 📚 [Vodič za učenje](../resources/study-guide.md) - Učvrstite svoje znanje

---

**Navigacija**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Materijali za učenje**: [Vodič za učenje](../resources/study-guide.md) | [Cheat Sheet](../resources/cheat-sheet.md) | [Pojmovnik](../resources/glossary.md)
- **🔧 Resursi**: [FAQ](../resources/faq.md) | [Otklanjanje poteškoća](../docs/troubleshooting/common-issues.md)

---

*Zadnje ažuriranje: studeni 2025 | [Prijavite probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Doprinesite primjerima](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->