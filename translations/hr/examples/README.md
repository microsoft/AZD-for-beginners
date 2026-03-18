# Primjeri - Praktične AZD predloške i konfiguracije

**Učenje kroz primjere - organizirano po poglavljima**
- **📚 Početna stranica tečaja**: [AZD Za početnike](../README.md)
- **📖 Preslikavanje poglavlja**: Primjeri organizirani po složenosti učenja
- **🚀 Lokalni primjer**: [Retail Multi-Agent rješenje](retail-scenario.md)
- **🤖 Vanjski AI primjeri**: Poveznice na Azure Samples repozitorije

> **📍 VAŽNO: Lokalni vs Vanjski Primjeri**  
> Ovaj repozitorij sadrži **4 potpuna lokalna primjera** s punim implementacijama:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 implementacija s chat sučeljem)  
> - **Container Apps** (Jednostavan Flask API + mikroservisi)  
> - **Database App** (Web + SQL baza podataka)  
> - **Retail Multi-Agent** (Enterprise AI rješenje)  
>   
> Dodatni primjeri su **vanjske reference** na Azure-Samples repozitorije koje možete klonirati.

## Uvod

Ovaj direktorij pruža praktične primjere i reference za učenje Azure Developer CLI kroz praktičnu vježbu. Retail Multi-Agent scenarij je kompletna, proizvodno spremna implementacija uključena u ovaj repozitorij. Dodatni primjeri referiraju na službene Azure Samples koji demonstriraju različite AZD uzorke.

### Legenda za ocjenu složenosti

- ⭐ **Početnik** - Osnovni koncepti, jedna usluga, 15-30 minuta
- ⭐⭐ **Srednji** - Više usluga, integracija baze podataka, 30-60 minuta
- ⭐⭐⭐ **Napredni** - Složena arhitektura, AI integracija, 1-2 sata
- ⭐⭐⭐⭐ **Stručnjak** - Proizvodno spremno, enterprise uzorci, 2+ sata

## 🎯 Što se zapravo nalazi u ovom repozitoriju

### ✅ Lokalna implementacija (spremna za korištenje)

#### [Microsoft Foundry Models Chat application](azure-openai-chat/README.md) 🆕
**Kompletna gpt-4.1 implementacija s chat sučeljem uključena u ovaj repozitorij**

- **Lokacija:** `examples/azure-openai-chat/`
- **Složenost:** ⭐⭐ (Srednji)
- **Što je uključeno:**
  - Kompletna Microsoft Foundry Models implementacija (gpt-4.1)
  - Python chat sučelje iz komandne linije
  - Integracija Key Vaulta za sigurne API ključeve
  - Bicep predlošci infrastrukture
  - Praćenje korištenja tokena i troškova
  - Ograničavanje brzine i rukovanje greškama

**Brzi početak:**
```bash
# Navigirajte na primjer
cd examples/azure-openai-chat

# Implementirajte sve
azd up

# Instalirajte ovisnosti i započnite razgovor
pip install -r src/requirements.txt
python src/chat.py
```

**Tehnologije:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Primjeri Container App](container-app/README.md) 🆕
**Sveobuhvatni primjeri implementacije kontejnera uključeni u ovaj repozitorij**

- **Lokacija:** `examples/container-app/`
- **Složenost:** ⭐-⭐⭐⭐⭐ (Početnik do Napredni)
- **Što je uključeno:**
  - [Glavni vodič](container-app/README.md) - Kompletan pregled implementacija kontejnera
  - [Jednostavan Flask API](../../../examples/container-app/simple-flask-api) - Osnovni primjer REST API-ja
  - [Mikroservisna arhitektura](../../../examples/container-app/microservices) - Proizvodno spremna višeservisna implementacija
  - Brzi početak, proizvodni i napredni uzorci
  - Nadzor, sigurnost i optimizacija troškova

**Brzi početak:**
```bash
# Pogledajte glavni vodič
cd examples/container-app

# Postavite jednostavan Flask API
cd simple-flask-api
azd up

# Postavite primjer mikroservisa
cd ../microservices
azd up
```

**Tehnologije:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent rješenje](retail-scenario.md) 🆕
**Kompletna proizvodno spremna implementacija uključena u ovaj repozitorij**

- **Lokacija:** `examples/retail-multiagent-arm-template/`
- **Složenost:** ⭐⭐⭐⭐ (Napredni)
- **Što je uključeno:**
  - Kompletan ARM predložak za implementaciju
  - Višeservisna arhitektura (Kupac + Inventar)
  - Integracija Microsoft Foundry Models
  - AI pretraga s RAG-om
  - Sveobuhvatni nadzor
  - Skripta za implementaciju jednim klikom

**Brzi početak:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Tehnologije:** Microsoft Foundry Models, AI pretraga, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Vanjski Azure Samples (Klonirajte za korištenje)

Sljedeći primjeri se održavaju u službenim Azure-Samples repozitorijima. Klonirajte ih kako biste istražili različite AZD uzorke:

### Jednostavne aplikacije (Poglavlja 1-2)

| Predložak | Repozitorij | Složenost | Usluge |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokalno: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikroservisi** | [Lokalno: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Višeservisno, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kako koristiti:**
```bash
# Kloniraj bilo koji primjer
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Postavi u rad
azd up
```

### AI primjeri aplikacija (Poglavlja 2, 5, 8)

| Predložak | Repozitorij | Složenost | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokalno: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 implementacija |
| **AI Chat Brzi početak** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Osnovni AI chat |
| **AI Agenti** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agent framework |
| **Pretraga + OpenAI demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG uzorak |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise AI |

### Baze podataka & Napredni uzorci (Poglavlja 3-8)

| Predložak | Repozitorij | Složenost | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Integracija baze podataka |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java mikroservisi** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Višeservisno |
| **ML pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Ciljevi učenja

Radom kroz ove primjere ćete:
- Prakticirati Azure Developer CLI tijekove rada sa stvarnim scenarijima aplikacija
- Razumjeti različite arhitekture aplikacija i njihove azd implementacije
- Svladati uzorke Infrastructure as Code za različite Azure usluge
- Primijeniti upravljanje konfiguracijom i strategije implementacije specifične za okruženje
- Implementirati praćenje, sigurnost i uzorke skaliranja u praktičnim situacijama
- Izgraditi iskustvo u rješavanju problema i debugiranju stvarnih scenarija implementacije

## Ishodi učenja

Nakon što dovršite ove primjere moći ćete:
- Samopouzdano implementirati razne tipove aplikacija koristeći Azure Developer CLI
- Prilagoditi dostupne predloške prema vlastitim zahtjevima aplikacije
- Dizajnirati i implementirati prilagođene infrastrukturne uzorke koristeći Bicep
- Konfigurirati složene višeservisne aplikacije s pravilnim ovisnostima
- Primijeniti sigurnosne, nadzorne i najbolje prakse izvedbe u stvarnim scenarijima
- Dijagnosticirati i optimizirati implementacije na temelju praktičnog iskustva

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

## Primjeri brzog početka

> **💡 Novi ste u AZD?** Započnite s primjerom #1 (Flask API) - traje oko 20 minuta i uči osnovne koncepte.

### Za početnike
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokalno) ⭐  
   Implementirajte jednostavan REST API s automatskim skaliranjem na nulu  
   **Vrijeme:** 20-25 minuta | **Trošak:** $0-5/mjesečno  
   **Naučit ćete:** Osnovni azd tijek rada, kontejnerizaciju, health probe-ove  
   **Očekivani rezultat:** Funkcionalna API krajnja točka koja vraća "Hello, World!" s nadzorom

2. **[Jednostavna web aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Implementirajte Node.js Express web aplikaciju s MongoDB-om  
   **Vrijeme:** 25-35 minuta | **Trošak:** $10-30/mjesečno  
   **Naučit ćete:** Integraciju baze podataka, varijable okruženja, connection stringove  
   **Očekivani rezultat:** Todo lista aplikacija s funkcijama kreiranja/čitanja/uređivanja/brisanja

3. **[Statična web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hostajte React statičnu web stranicu koristeći Azure Static Web Apps  
   **Vrijeme:** 20-30 minuta | **Trošak:** $0-10/mjesečno  
   **Naučit ćete:** Statičko hostanje, serverless funkcije, CDN implementaciju  
   **Očekivani rezultat:** React korisničko sučelje s API backendom, automatski SSL, globalni CDN

### Za srednje korisnike
4. **[Microsoft Foundry Models Chat application](../../../examples/azure-openai-chat)** (Lokalno) ⭐⭐  
   Implementirajte gpt-4.1 s chat sučeljem i sigurnim upravljanjem API ključevima  
   **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno  
   **Naučit ćete:** Implementaciju Microsoft Foundry Models, integraciju Key Vaulta, praćenje tokena  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s gpt-4.1 i praćenjem troškova

5. **[Container App - Mikroservisi](../../../examples/container-app/microservices)** (Lokalno) ⭐⭐⭐⭐  
   Proizvodno spremna višeservisna arhitektura  
   **Vrijeme:** 45-60 minuta | **Trošak:** $50-150/mjesečno  
   **Naučit ćete:** Komunikaciju usluga, upravljanje redovima poruka, distribuirano praćenje  
   **Očekivani rezultat:** Sustav s 2 servisa (API Gateway + Product Service) s nadzorom

6. **[Database App - C# sa Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web aplikacija s C# API i Azure SQL bazom podataka  
   **Vrijeme:** 30-45 minuta | **Trošak:** $20-80/mjesečno  
   **Naučit ćete:** Entity Framework, migracije baze, sigurnost veze  
   **Očekivani rezultat:** C# API s Azure SQL backendom, automatska implementacija sheme

7. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions s HTTP okidačima i Cosmos DB-om  
   **Vrijeme:** 30-40 minuta | **Trošak:** $10-40/mjesečno  
   **Naučit ćete:** Event-driven arhitekturu, serverless skaliranje, NoSQL integraciju  
   **Očekivani rezultat:** Funkcija koja odgovara na HTTP zahtjeve s Cosmos DB pohranom

8. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Višeservisna Java aplikacija s Container Apps i API gatewayem  
   **Vrijeme:** 60-90 minuta | **Trošak:** $80-200/mjesečno  
   **Naučit ćete:** Implementaciju Spring Boota, service mesh, load balancing  
   **Očekivani rezultat:** Višeservisni Java sustav s otkrivanjem servisa i rutiranjem

### Microsoft Foundry predlošci

1. **[Microsoft Foundry Models Chat App - lokalni primjer](../../../examples/azure-openai-chat)** ⭐⭐  
   Potpuna gpt-4.1 implementacija s chat sučeljem  
   **Vrijeme:** 35-45 minuta | **Trošak:** $50-200/mjesečno  
   **Očekivani rezultat:** Funkcionalna chat aplikacija s praćenjem tokena i troškova

2. **[Azure Search + OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Inteligentna chat aplikacija s RAG arhitekturom  
   **Vrijeme:** 60-90 minuta | **Trošak:** $100-300/mjesečno  
   **Očekivani rezultat:** Chat sučelje pokretano RAG-om s pretragom dokumenata i citatima

3. **[AI obrada dokumenata](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Analiza dokumenata koristeći Azure AI usluge  
   **Vrijeme:** 40-60 minuta | **Trošak:** $20-80/mjesečno  
   **Očekivani rezultat:** API za ekstrakciju teksta, tablica i entiteta iz učitanih dokumenata

4. **[Machine Learning pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps tijek rada s Azure Machine Learning  
   **Vrijeme:** 2-3 sata | **Trošak:** $150-500/mjesečno  
   **Očekivani rezultat:** Automatizirani ML pipeline s treniranjem, implementacijom i nadzorom

### Stvarni scenariji

#### **Retail Multi-Agent rješenje** 🆕
**[Kompletan vodič za implementaciju](./retail-scenario.md)**

Sveobuhvatno, proizvodno spremno višeservisno rješenje za korisničku podršku koje demonstrira implementaciju enterprise razine AI aplikacija pomoću AZD. Ovaj scenarij pruža:
- **Kompletna arhitektura**: Više-agentni sustav sa specijaliziranim agentima za korisničku podršku i upravljanje zalihama  
- **Proizvodna infrastruktura**: Implementacije Microsoft Foundry Models u više regija, AI pretraživanje, Container Apps i sveobuhvatno nadgledanje  
- **ARM predložak spreman za implementaciju**: Implementacija jednim klikom s više konfiguracijskih načina (Minimalno/Standardno/Premium)  
- **Napredne značajke**: Validacija sigurnosti red teamingom, okvir za evaluaciju agenata, optimizacija troškova i vodiči za otklanjanje poteškoća  
- **Stvarni poslovni kontekst**: Primjer korisničke podrške za maloprodaju s prijenosom datoteka, integracijom pretraživanja i dinamičkim skaliranjem  

**Tehnologije**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Složenost**: ⭐⭐⭐⭐ (Napredno - Spremno za proizvodnju u poduzeću)  

**Savršeno za**: AI developere, arhitekte rješenja i timove koji grade proizvodne više-agentne sustave  

**Brzi početak**: Implementirajte cjelokupno rješenje za manje od 30 minuta koristeći priloženi ARM predložak s `./deploy.sh -g myResourceGroup`  

## 📋 Upute za korištenje

### Preduvjeti

Prije pokretanja bilo kojeg primjera:  
- ✅ Pretplata na Azure s pristupom vlasnika ili suradnika  
- ✅ Instalirani Azure Developer CLI ([Vodič za instalaciju](../docs/chapter-01-foundation/installation.md))  
- ✅ Pokrenuti Docker Desktop (za primjere s kontejnerima)  
- ✅ Odgovarajući Azure kvote (provjerite zahtjeve specifične za primjere)  

> **💰 Upozorenje o troškovima:** Svi primjeri stvaraju stvarne Azure resurse koji generiraju troškove. Pogledajte README datoteke pojedinačnih primjera za procjene troškova. Ne zaboravite pokrenuti `azd down` kada završite kako biste izbjegli stalne troškove.  

### Pokretanje primjera lokalno

1. **Klonirajte ili Kopirajte Primjer**  
   ```bash
   # Navigirajte do željenog primjera
   cd examples/simple-web-app
   ```
  
2. **Inicijalizirajte AZD okruženje**  
   ```bash
   # Inicijaliziraj s postojećom predloškom
   azd init
   
   # Ili kreiraj novo okruženje
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
   # Postavite infrastrukturu i aplikaciju
   azd up
   ```
  
5. **Potvrdite implementaciju**  
   ```bash
   # Dohvati završne točke usluge
   azd env get-values
   
   # Testiraj završnu točku (primjer)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Očekivani znakovi uspjeha:**  
   - ✅ `azd up` završi bez pogrešaka  
   - ✅ Krajnja točka usluge vraća HTTP 200  
   - ✅ Azure Portal prikazuje status "Running"  
   - ✅ Application Insights prima telemetriju  

> **⚠️ Problemi?** Pogledajte [Česte poteškoće](../docs/chapter-07-troubleshooting/common-issues.md) za rješavanje problema s implementacijom  

### Prilagodba primjera

Svaki primjer uključuje:  
- **README.md** - Detaljne upute za postavljanje i prilagodbu  
- **azure.yaml** - AZD konfiguracija s komentarima  
- **infra/** - Bicep predlošci s objašnjenjima parametara  
- **src/** - Primjer izvornog koda aplikacije  
- **scripts/** - Pomoćni skripti za uobičajene zadatke  

## 🎯 Ciljevi učenja

### Kategorije primjera

#### **Osnovne implementacije**  
- Aplikacije s jednom uslugom  
- Jednostavni obrasci infrastrukture  
- Osnovno upravljanje konfiguracijom  
- Troškovno učinkoviti razvojni setovi  

#### **Napredni scenariji**  
- Arhitekture s više usluga  
- Složene mrežne konfiguracije  
- Obrasci integracije baza podataka  
- Implementacije sigurnosti i usklađenosti  

#### **Obrasci spremni za proizvodnju**  
- Konfiguracije visoke dostupnosti  
- Nadgledanje i promatranje  
- Integracija CI/CD-a  
- Postavke za oporavak od katastrofe  

## 📖 Opisi primjera

### Jednostavna web aplikacija - Node.js Express  
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Složenost**: Početnik  
**Koncepti**: Osnovna implementacija, REST API, integracija NoSQL baze podataka  

### Statička web stranica - React SPA  
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složenost**: Početnik  
**Koncepti**: Statički hosting, bezposlužiteljski backend, moderna web razvoj  

### Container App - Python Flask  
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Složenost**: Početnik  
**Koncepti**: Kontejnerizacija, REST API, scale-to-zero, health probes, nadgledanje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/simple-flask-api)  

### Container App - Arhitektura mikroservisa  
**Tehnologije**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Složenost**: Napredno  
**Koncepti**: Arhitektura s više usluga, komunikacija između servisa, redovi poruka, distribuirano praćenje  
**Lokacija**: [Lokalni primjer](../../../examples/container-app/microservices)  

### Aplikacija s bazom podataka - C# s Azure SQL  
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složenost**: Srednji nivo  
**Koncepti**: Entity Framework, veze s bazama podataka, razvoj web API-ja  

### Serverless funkcija - Python Azure Functions  
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složenost**: Srednji nivo  
**Koncepti**: Arhitektura vođena događajima, bezposlužiteljsko računalstvo, full-stack razvoj  

### Mikroservisi - Java Spring Boot  
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složenost**: Srednji nivo  
**Koncepti**: Komunikacija mikroservisa, distribuirani sustavi, poduzećni obrasci  

### Microsoft Foundry Primjeri

#### Microsoft Foundry Models Chat App  
**Tehnologije**: Microsoft Foundry Models, Cognitive Search, App Service  
**Složenost**: Srednji nivo  
**Koncepti**: RAG arhitektura, vektorsko pretraživanje, integracija velikih jezičnih modela  

#### AI obrada dokumenata  
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Složenost**: Srednji nivo  
**Koncepti**: Analiza dokumenata, OCR, izvlačenje podataka  

#### Strojno učenje Pipeline  
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Složenost**: Napredno  
**Koncepti**: Trening modela, implementacijski pipeline-ovi, nadgledanje  

## 🛠 Konfiguracijski primjeri

Direktorij `configurations/` sadrži višekratno upotrebljive komponente:  

### Konfiguracije okruženja  
- Postavke razvojnog okruženja  
- Konfiguracije za staging  
- Konfiguracije spremne za proizvodnju  
- Postavke implementacije u više regija  

### Bicep moduli  
- Višekratno upotrebljivi infrastrukturni dijelovi  
- Uobičajeni obrasci resursa  
- Zaštićeni predlošci za sigurnost  
- Troškovno optimizirane konfiguracije  

### Pomoćni skripti  
- Automatizacija postavljanja okruženja  
- Skripte za migraciju baza podataka  
- Alati za validaciju implementacije  
- Uredaji za nadzor troškova  

## 🔧 Vodič za prilagodbu

### Prilagodba primjera vašem slučaju korištenja

1. **Pregledajte preduvjete**  
   - Provjerite zahtjeve Azure servisa  
   - Potvrdite ograničenja pretplate  
   - Razumite implikacije troškova  

2. **Izmijenite konfiguraciju**  
   - Ažurirajte definicije servisa u `azure.yaml`  
   - Prilagodite Bicep predloške  
   - Prilagodite varijable okruženja  

3. **Detaljno testirajte**  
   - Prvo implementirajte u razvojno okruženje  
   - Potvrdite funkcionalnost  
   - Testirajte skaliranje i performanse  

4. **Sigurnosna provjera**  
   - Pregledajte kontrole pristupa  
   - Implementirajte upravljanje tajnama  
   - Omogućite nadzor i upozorenja  

## 📊 Matrica usporedbe

| Primjer                         | Usluge | Baza podataka | Autentikacija | Nadgledanje | Složenost  |
|--------------------------------|--------|---------------|---------------|-------------|------------|
| **Microsoft Foundry Models Chat** (Lokalno)  | 2      | ❌            | Key Vault     | Potpuno    | ⭐⭐         |
| **Python Flask API** (Lokalno)               | 1      | ❌            | Osnovno       | Potpuno    | ⭐          |
| **Mikroservisi** (Lokalno)                    | 5+     | ✅            | Poduzeće      | Napredno   | ⭐⭐⭐⭐       |
| Node.js Express Todo                         | 2      | ✅            | Osnovno       | Osnovno    | ⭐          |
| React SPA + Functions                        | 3      | ✅            | Osnovno       | Potpuno    | ⭐          |
| Python Flask Container                       | 2      | ❌            | Osnovno       | Potpuno    | ⭐          |
| C# Web API + SQL                            | 2      | ✅            | Potpuno       | Potpuno    | ⭐⭐         |
| Python Functions + SPA                       | 3      | ✅            | Potpuno       | Potpuno    | ⭐⭐         |
| Java Mikroservisi                           | 5+     | ✅            | Potpuno       | Potpuno    | ⭐⭐         |
| Microsoft Foundry Models Chat                | 3      | ✅            | Potpuno       | Potpuno    | ⭐⭐⭐        |
| AI obrada dokumenata                         | 2      | ❌            | Osnovno       | Potpuno    | ⭐⭐         |
| ML Pipeline                                  | 4+     | ✅            | Potpuno       | Potpuno    | ⭐⭐⭐⭐       |
| **Retail Multi-Agent** (Lokalno)             | **8+** | **✅**        | **Poduzeće**  | **Napredno** | **⭐⭐⭐⭐**  |

## 🎓 Put učenja

### Preporučeni redoslijed

1. **Počnite s Jednostavnom web aplikacijom**  
   - Naučite osnovne AZD koncepte  
   - Razumite tijek implementacije  
   - Vježbajte upravljanje okruženjem  

2. **Isprobajte Statičku web stranicu**  
   - Istražite različite mogućnosti hostinga  
   - Naučite o integraciji CDN-a  
   - Razumite konfiguraciju DNS-a  

3. **Pređite na Container App**  
   - Naučite osnove kontejnerizacije  
   - Razumite koncepte skaliranja  
   - Vježbajte s Dockerom  

4. **Dodajte integraciju baze podataka**  
   - Naučite o pripremi baza podataka  
   - Razumite connection stringove  
   - Vježbajte upravljanje tajnama  

5. **Istražite bezposlužiteljsku arhitekturu**  
   - Razumite arhitekturu vođenu događajima  
   - Naučite o okidačima i vezama  
   - Vježbajte s API-jima  

6. **Izgradite mikroservise**  
   - Naučite komunikaciju između servisa  
   - Razumite distribuirane sustave  
   - Vježbajte složene implementacije  

## 🔍 Pronalaženje pravog primjera

### Prema tehnološkom stogu  
- **Container Apps**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Mikroservisi  
- **Node.js**: Node.js Express Todo App, [Mikroservisi API Gateway (Lokalno)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi Product Service (Lokalno)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Mikroservisi Order Service (Lokalno)](../../../examples/container-app/microservices), C# Web API + SQL baza, Microsoft Foundry Models Chat App, ML Pipeline  
- **Go**: [Mikroservisi User Service (Lokalno)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Mikroservisi  
- **React**: React SPA + Functions  
- **Kontejneri**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Mikroservisi  
- **Baze podataka**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI obrada dokumenata, ML Pipeline, **Retail Multi-Agent rješenje**  
- **Sustavi s više agenata**: **Retail Multi-Agent rješenje**  
- **OpenAI integracija**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Retail Multi-Agent rješenje  
- **Proizvodno poduzeće**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent rješenje**  

### Prema arhitektonskom obrascu  
- **Jednostavan REST API**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api)  
- **Monolit**: Node.js Express Todo, C# Web API + SQL  
- **Statički + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Mikroservisi**: [Proizvodni mikroservisi (Lokalno)](../../../examples/container-app/microservices), Java Spring Boot Mikroservisi  
- **Kontejnerizirano**: [Python Flask (Lokalno)](../../../examples/container-app/simple-flask-api), [Mikroservisi (Lokalno)](../../../examples/container-app/microservices)  
- **Vođeno AI-jem**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI obrada dokumenata, ML Pipeline, **Retail Multi-Agent rješenje**  
- **Više-agentna arhitektura**: **Retail Multi-Agent rješenje**  
- **Više-usluga u poduzeću**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices), **Retail Multi-Agent rješenje**  

### Prema razini složenosti  
- **Početnik**: [Python Flask API (Lokalno)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Srednji nivo**: **[Microsoft Foundry Models Chat (Lokalno)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Mikroservisi, Microsoft Foundry Models Chat App, AI obrada dokumenata  
- **Napredno**: ML Pipeline  
- **Spremno za proizvodnju u poduzeću**: [Mikroservisi (Lokalno)](../../../examples/container-app/microservices) (Više-usluga s redovima poruka), **Retail Multi-Agent rješenje** (Potpuni više-agentni sustav s ARM predloškom za implementaciju)  

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
- [React web aplikacija s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps posao](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure funkcije s Javiom](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najbolje prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Doprinos Primjerima

Imate koristan primjer za podijeliti? Dobrodošli su doprinosi!

### Smjernice za predaju
1. Slijedite uspostavljenu strukturu direktorija
2. Uključite sveobuhvatan README.md
3. Dodajte komentare u konfiguracijske datoteke
4. Temeljito testirajte prije predaje
5. Uključite procjenu troškova i preduvjete

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

**Pro savjet**: Počnite s najjednostavnijim primjerom koji odgovara vašem tehnološkom stogu, a zatim postupno prijeđite na složenije scenarije. Svaki primjer se nadovezuje na koncepte prethodnih!

## 🚀 Spremni za početak?

### Vaš put učenja

1. **Potpuni početnik?** → Počnite s [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 minuta)
2. **Imate osnovno znanje o AZD-u?** → Isprobajte [Mikroservisi](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 minuta)
3. **Gradite AI aplikacije?** → Počnite s [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 minuta) ili istražite [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ sata)
4. **Trebate specifičan tehnološki stog?** → Koristite odjeljak [Pronalaženje pravog primjera](#-finding-the-right-example) gore

### Sljedeći koraci

- ✅ Pregledajte [Preduvjete](#preduvjeti) gore
- ✅ Odaberite primjer koji odgovara vašoj razini vještine (pogledajte [Legenda složenosti](#legenda-za-ocjenu-složenosti))
- ✅ Pažljivo pročitajte README primjera prije implementacije
- ✅ Postavite podsjetnik za pokretanje `azd down` nakon testiranja
- ✅ Podijelite svoje iskustvo putem GitHub Issues ili Discussions

### Trebate pomoć?

- 📖 [Često postavljana pitanja (FAQ)](../resources/faq.md) - Odgovori na često postavljana pitanja
- 🐛 [Vodič za rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md) - Popravljanje problema s implementacijom
- 💬 [GitHub rasprave](https://github.com/microsoft/AZD-for-beginners/discussions) - Pitajte zajednicu
- 📚 [Vodič za učenje](../resources/study-guide.md) - Ojačajte svoje znanje

---

**Navigacija**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Materijali za učenje**: [Vodič za učenje](../resources/study-guide.md) | [Prečac](../resources/cheat-sheet.md) | [Rječnik](../resources/glossary.md)
- **🔧 Resursi**: [FAQ](../resources/faq.md) | [Rješavanje problema](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zadnje ažuriranje: studeni 2025. | [Prijavi probleme](https://github.com/microsoft/AZD-for-beginners/issues) | [Doprinesi primjere](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj je dokument preveden korištenjem AI usluge prijevoda [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, molimo imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na njegovom izvornom jeziku treba se smatrati autoritativnim izvorom. Za kritične informacije preporuča se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->