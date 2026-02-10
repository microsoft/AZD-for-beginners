# Esimerkit - Käytännön AZD-mallit ja kokoonpanot

**Oppiminen esimerkkien kautta - järjestetty lukujen mukaan**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../README.md)
- **📖 Lukujako**: Esimerkit järjestetty oppimisen vaativuuden mukaan
- **🚀 Paikallinen esimerkki**: [Retail Multi-Agent Solution](retail-scenario.md)
- **🤖 Ulkoiset AI-esimerkit**: Linkkejä Azure Samples -repositorioihin

> **📍 TÄRKEÄÄ: Paikalliset vs ulkoiset esimerkit**  
> Tämä arkisto sisältää **4 täydellistä paikallista esimerkkiä** täydellisillä toteutuksilla:  
> - **Azure OpenAI Chat** (GPT-4 käyttöönotto keskustelukäyttöliittymällä)  
> - **Container Apps** (Yksinkertainen Flask-API + mikropalvelut)  
> - **Database App** (Web + SQL-databasesovellus)  
> - **Retail Multi-Agent** (Yritystason AI-ratkaisu)  
>  
> Lisäesimerkit ovat **ulkoisia viitteitä** Azure-Samples -repositorioihin, jotka voit kloonata.

## Johdanto

Tämä hakemisto tarjoaa käytännön esimerkkejä ja viitteitä, jotka auttavat sinua oppimaan Azure Developer CLI:tä käytännön harjoituksen kautta. Retail Multi-Agent -skenaario on täydellinen, tuotantovalmiiksi tarkoitettu toteutus, joka sisältyy tähän arkistoon. Lisäesimerkit viittaavat virallisiin Azure Samples -esimerkkeihin, jotka esittelevät erilaisia AZD-malleja.

### Vaikeustason legenda

- ⭐ **Aloittelija** - Peruskäsitteet, yksittäinen palvelu, 15–30 minuuttia
- ⭐⭐ **Keskitaso** - Useita palveluja, tietokantaintegraatio, 30–60 minuuttia
- ⭐⭐⭐ **Edistynyt** - Monimutkainen arkkitehtuuri, AI-integraatio, 1–2 tuntia
- ⭐⭐⭐⭐ **Asiantuntija** - Tuotantovalmiit, yritystason mallit, yli 2 tuntia

## 🎯 Mitä tässä arkistossa oikeastaan on

### ✅ Paikallinen toteutus (valmis käytettäväksi)

#### [Azure OpenAI Chat -sovellus](azure-openai-chat/README.md) 🆕
**Täydellinen GPT-4-käyttöönotto keskustelukäyttöliittymällä sisältyy tähän arkistoon**

- **Sijainti:** `examples/azure-openai-chat/`
- **Vaikeusaste:** ⭐⭐ (Keskitaso)
- **Sisältää:**
  - Täydellinen Azure OpenAI -käyttöönotto (GPT-4)
  - Python-komentorivikeskustelukäyttöliittymä
  - Key Vault -integraatio API-avainten turvallisuutta varten
  - Bicep-infrastruktuurimallit
  - Tokenien käyttö- ja kustannusseuranta
  - Rajoitusten hallinta ja virheenkäsittely

**Pika-aloitus:**
```bash
# Siirry esimerkkiin
cd examples/azure-openai-chat

# Ota kaikki käyttöön
azd up

# Asenna riippuvuudet ja aloita keskustelu
pip install -r src/requirements.txt
python src/chat.py
```

**Teknologiat:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App -esimerkit](container-app/README.md) 🆕
**Laajat konttipalvelujen käyttöönottoesimerkit sisältyvät tähän arkistoon**

- **Sijainti:** `examples/container-app/`
- **Vaikeusaste:** ⭐-⭐⭐⭐⭐ (Aloittelijasta asiantuntijaan)
- **Mitä sisältyy:**
  - [Pääopas](container-app/README.md) - Kattava yleiskatsaus konttien käyttöönotosta
  - [Yksinkertainen Flask-API](../../../examples/container-app/simple-flask-api) - Perusesimerkki REST-API:sta
  - [Mikropalveluarkkitehtuuri](../../../examples/container-app/microservices) - Tuotantovalmiiksi tarkoitettu moni-palveluinen käyttöönotto
  - Pika-aloitus-, tuotanto- ja edistyneet mallit
  - Valvonta, tietoturva ja kustannusten optimointi

**Pika-aloitus:**
```bash
# Näytä master-opas
cd examples/container-app

# Ota käyttöön yksinkertainen Flask-API
cd simple-flask-api
azd up

# Ota käyttöön mikropalvelu-esimerkki
cd ../microservices
azd up
```

**Teknologiat:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent -ratkaisu](retail-scenario.md) 🆕
**Täydellinen tuotantovalmiiksi tarkoitettu toteutus sisältyy tähän arkistoon**

- **Sijainti:** `examples/retail-multiagent-arm-template/`
- **Vaikeusaste:** ⭐⭐⭐⭐ (Edistynyt)
- **Sisältää:**
  - Täydellinen ARM-käyttöönottonäytemalli
  - Moniagenttiarkkitehtuuri (Asiakas + Varastonhallinta)
  - Azure OpenAI -integraatio
  - AI-haku RAG-mallilla
  - Kattava valvonta
  - Yhden komennon käyttöönotto skripti

**Pika-aloitus:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologiat:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Ulkoiset Azure-esimerkit (Kloonaa käyttöösi)

Seuraavia esimerkkejä ylläpidetään virallisissa Azure-Samples -repositorioissa. Kloonaa ne tutkiaksesi eri AZD-malleja:

### Yksinkertaiset sovellukset (luvut 1-2)

| Mallipohja | Repositorio | Vaikeusaste | Palvelut |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Paikallinen: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Paikallinen: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Kuinka käyttää:**
```bash
# Kloonaa mikä tahansa esimerkki
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Ota käyttöön
azd up
```

### AI-sovellus-esimerkit (luvut 2, 5, 8)

| Mallipohja | Repositorio | Vaikeusaste | Painopiste |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI Chat** | [Paikallinen: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 käyttöönotto |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Perus AI-keskustelu |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenttikehys |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-malli |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Yritystason AI |

### Tietokanta- ja edistyneet mallit (luvut 3-8)

| Mallipohja | Repositorio | Vaikeusaste | Painopiste |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Tietokantaintegraatio |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Monipalveluinen |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Oppimistavoitteet

Työskentelemällä näiden esimerkkien parissa opit:
- Harjoittelemaan Azure Developer CLI -työnkulkuja realistisissa sovellus­skenaarioissa
- Ymmärtämään erilaisia sovellusarkkitehtuureja ja niiden azd-toteutuksia
- Hallitsemaan Infrastructure as Code -malleja eri Azure-palveluille
- Soveltamaan konfiguraation hallintaa ja ympäristökohtaisia käyttöönotto­strategioita
- Toteuttamaan valvonta-, tietoturva- ja skaalausmalleja käytännön konteksteissa
- Kertymään kokemusta vianmäärityksestä ja debuggaamisesta todellisissa käyttöönotto­tilanteissa

## Oppimistulokset

Esimerkkien läpikäynnin jälkeen osaat:
- Otta a erilaisia sovellustyyppejä käyttöön Azure Developer CLI:llä luottavaisin mielin
- Mukauttaa annettuja malleja omien sovellusvaatimustesi mukaisesti
- Suunnitella ja toteuttaa räätälöityjä infrastruktuuri­malleja Bicepillä
- Konfiguroida monimutkaisia moni-palvelusovelluksia oikeilla riippuvuuksilla
- Soveltaa tietoturvan, valvonnan ja suorituskyvyn parhaita käytäntöjä käytännön skenaarioissa
- Vianmäärittää ja optimoida käyttöönottoja käytännön kokemuksen perusteella

## Hakemistorakenne

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

## Pika-aloitesimerkit

> **💡 Uusi AZD:ssä?** Aloita esimerkillä #1 (Flask-API) - se vie ~20 minuuttia ja opettaa ydinkäsitteet.

### Aloittelijoille
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Paikallinen) ⭐  
   Ota käyttöön yksinkertainen REST-API, joka skaalaa nollaan  
   **Aika:** 20-25 minuuttia | **Kustannus:** $0-5/kk  
   **Opit:** Perus azd-työnkulku, kontitus, terveysprobit  
   **Odotettu lopputulos:** Toimiva API-päätepiste, joka palauttaa "Hello, World!" ja sisältää valvonnan

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Ota käyttöön Node.js Express -verkkosovellus MongoDB:llä  
   **Aika:** 25-35 minuuttia | **Kustannus:** $10-30/kk  
   **Opit:** Tietokantaintegraatio, ympäristömuuttujat, yhteysmerkkijonot  
   **Odotettu lopputulos:** Todo-lista-sovellus, jossa luominen/luku/päivitys/poisto -toiminnot

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Isännöi Reactin staattista sivustoa Azure Static Web Appsilla  
   **Aika:** 20-30 minuuttia | **Kustannus:** $0-10/kk  
   **Opit:** Staattinen isännöinti, serverless-funktiot, CDN-julkaisu  
   **Odotettu lopputulos:** React-käyttöliittymä API-taustapalvelulla, automaattinen SSL ja globaali CDN

### Keskitasoisille käyttäjille
4. **[Azure OpenAI Chat Application](../../../examples/azure-openai-chat)** (Paikallinen) ⭐⭐  
   Ota GPT-4 käyttöön keskustelukäyttöliittymällä ja turvallisella API-avainten hallinnalla  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kk  
   **Opit:** Azure OpenAI -käyttöönotto, Key Vault -integraatio, token-seuranta  
   **Odotettu lopputulos:** Toimiva keskustelusovellus GPT-4:llä ja kustannusseurannalla

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Paikallinen) ⭐⭐⭐⭐  
   Tuotantovalmiiksi tarkoitettu moni-palveluarkkitehtuuri  
   **Aika:** 45-60 minuuttia | **Kustannus:** $50-150/kk  
   **Opit:** Palvelujen välinen kommunikointi, viestijonot, hajautettu jäljitettävyys  
   **Odotettu lopputulos:** 2-palvelun järjestelmä (API Gateway + Tuotepalvelu) valvonnalla

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web-sovellus C#-API:lla ja Azure SQL -tietokannalla  
   **Aika:** 30-45 minuuttia | **Kustannus:** $20-80/kk  
   **Opit:** Entity Framework, tietokantamigraatiot, yhteysturvallisuus  
   **Odotettu lopputulos:** C#-API Azure SQL -taustalla, automaattinen skeeman käyttöönotto

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP-triggereillä ja Cosmos DB:llä  
   **Aika:** 30-40 minuuttia | **Kustannus:** $10-40/kk  
   **Opit:** Tapahtumavetoisuus, serverless-skaalaus, NoSQL-integraatio  
   **Odotettu lopputulos:** Function app joka vastaa HTTP-pyyntöihin ja tallentaa datan Cosmos DB:hen

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Monipalveluinen Java-sovellus Container Appsilla ja API-gatewaylla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $80-200/kk  
   **Opit:** Spring Boot -käyttöönotto, palveluverkko, kuormantasapainotus  
   **Odotettu lopputulos:** Monipalveluinen Java-järjestelmä palveluhavaintoon ja reititykseen

### Microsoft Foundry -mallit

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Täydellinen GPT-4-käyttöönotto keskustelukäyttöliittymällä  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kk  
   **Odotettu lopputulos:** Toimiva keskustelusovellus token-seurannalla ja kustannusseurannalla

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Älykäs keskustelusovellus RAG-arkkitehtuurilla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $100-300/kk  
   **Odotettu lopputulos:** RAG-pohjainen keskustelukäyttöliittymä dokumenttihakutoiminnolla ja lähdeviitteillä

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumenttien analysointi Azure AI -palveluilla  
   **Aika:** 40-60 minuuttia | **Kustannus:** $20-80/kk  
   **Odotettu lopputulos:** API, joka poimii tekstiä, taulukoita ja entiteettejä ladatuista dokumenteista

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-työnkulku Azure Machine Learningilla  
   **Aika:** 2-3 tuntia | **Kustannus:** $150-500/kk  
   **Odotettu lopputulos:** Automaattinen ML-putki koulutukselle, käyttöönotolle ja valvonnalle

### Todelliset skenaariot

#### **Retail Multi-Agent -ratkaisu** 🆕  
**[Täydellinen toteutusopas](./retail-scenario.md)**

Kattava, tuotantovalmiiksi tarkoitettu moniagenttipohjainen asiakastukiratkaisu, joka demonstroi yritystason AI-sovelluksen käyttöönottoa AZD:llä. Tämä skenaario tarjoaa:

- **Täydellinen arkkitehtuuri**: Moniagenttijärjestelmä, jossa on erikoistuneet asiakaspalvelu- ja varastonhallinta-agentit
- **Tuotantoinfrastruktuuri**: Monialueiset Azure OpenAI -käyttöönotot, AI Search, Container Apps ja kattava valvonta
- **Valmis käyttöönotettavaksi ARM-malli**: Yhden napsautuksen käyttöönotto useilla kokoonpanotiloilla (Minimal/Standard/Premium)
- **Edistyneet ominaisuudet**: red teaming -turvatarkastus, agenttien arviointikehys, kustannusoptimointi ja vianmääritysohjeet
- **Todellinen liiketoimintaympäristö**: Vähittäiskaupan asiakastuen käyttötapaus, jossa on tiedostojen lataus, haun integrointi ja dynaaminen skaalaus

**Teknologiat**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Vaativuus**: ⭐⭐⭐⭐ (Edistynyt - Yritystuotantovalmius)

**Sopii erinomaisesti**: tekoälykehittäjille, ratkaisuarkkitehdeille ja tiimeille, jotka rakentavat tuotantokelpoisia moni-agenttijärjestelmiä

**Nopea aloitus**: Ota käyttöön koko ratkaisu alle 30 minuutissa mukana tulevalla ARM-mallilla komennolla `./deploy.sh -g myResourceGroup`

## 📋 Käyttöohjeet

### Esivaatimukset

Antes de ejecutar cualquier ejemplo:
- ✅ Azure-tilaus, jossa on Owner- tai Contributor-käyttöoikeudet
- ✅ Azure Developer CLI asennettuna ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop käynnissä (säiliöesimerkeille)
- ✅ Sopivat Azure-kvotit (tarkista esimerkkikohtaiset vaatimukset)

> **💰 Kustannusvaroitus:** Kaikki esimerkit luovat todellisia Azure-resursseja, jotka aiheuttavat kustannuksia. Katso yksittäisistä README-tiedostoista kustannusarviot. Muista suorittaa `azd down` käytön jälkeen välttääksesi jatkuvia kuluja.

### Esimerkkien suorittaminen paikallisesti

1. **Kloonaa tai kopioi esimerkki**
   ```bash
   # Siirry haluamaasi esimerkkiin
   cd examples/simple-web-app
   ```

2. **Alusta AZD-ympäristö**
   ```bash
   # Alusta olemassa olevalla mallilla
   azd init
   
   # Tai luo uusi ympäristö
   azd env new my-environment
   ```

3. **Määritä ympäristö**
   ```bash
   # Aseta tarvittavat muuttujat
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Ota käyttöön**
   ```bash
   # Ota infrastruktuuri ja sovellus käyttöön
   azd up
   ```

5. **Varmista käyttöönotto**
   ```bash
   # Hae palvelun päätepisteet
   azd env get-values
   
   # Testaa päätepistettä (esimerkki)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Odotetut onnistumisen indikaattorit:**
   - ✅ `azd up` suorittuu ilman virheitä
   - ✅ Palvelun päätepiste palauttaa HTTP 200
   - ✅ Azure Portal näyttää tilan "Running"
   - ✅ Application Insights vastaanottaa telemetriaa

> **⚠️ Ongelmia?** Katso [Yleiset ongelmat](../docs/chapter-07-troubleshooting/common-issues.md) käyttöönoton vianmääritystä varten

### Esimerkkien mukauttaminen

Jokainen esimerkki sisältää:
- **README.md** - Yksityiskohtaiset asennus- ja mukautusohjeet
- **azure.yaml** - AZD-konfiguraatio kommentteineen
- **infra/** - Bicep-mallit parametriselityksineen
- **src/** - Esimerkkisovelluksen koodi
- **scripts/** - Avustavat skriptit yleisiin tehtäviin

## 🎯 Oppimistavoitteet

### Esimerkkiluokat

#### **Peruskäyttöönotot**
- Yhden palvelun sovellukset
- Yksinkertaiset infrastruktuurimallit
- Peruskonfiguraation hallinta
- Kustannustehokkaat kehitysympäristöt

#### **Edistyneet skenaariot**
- Monipalveluarkkitehtuurit
- Monimutkaiset verkkokonfiguraatiot
- Tietokantaintegraation mallit
- Turvallisuus- ja vaatimustenmukaisuuden toteutukset

#### **Tuotantovalmiit mallit**
- Korkean käytettävyyden konfiguraatiot
- Valvonta ja havaittavuus
- CI/CD-integrointi
- Häiriöpalautusasetukset

## 📖 Esimerkkien kuvaukset

### Yksinkertainen verkkosovellus - Node.js Express
**Teknologiat**: Node.js, Express, MongoDB, Container Apps  
**Vaativuus**: Aloittelija  
**Käsitteet**: Peruskäyttöönotto, REST-rajapinta, NoSQL-tietokantaintegraatio

### Staattinen verkkosivusto - React SPA
**Teknologiat**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Vaativuus**: Aloittelija  
**Käsitteet**: Staattinen isännöinti, serverless-taustapalvelu, moderni web-kehitys

### Container-sovellus - Python Flask
**Teknologiat**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Vaativuus**: Aloittelija  
**Käsitteet**: Konttien käyttö, REST-rajapinta, skaalaus nollaan, terveystarkastukset, valvonta  
**Sijainti**: [Paikallinen esimerkki](../../../examples/container-app/simple-flask-api)

### Container-sovellus - Mikropalveluarkkitehtuuri
**Teknologiat**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Vaativuus**: Edistynyt  
**Käsitteet**: Monipalveluarkkitehtuuri, palveluiden välinen kommunikointi, viestijonotus, hajautettu jäljitys  
**Sijainti**: [Paikallinen esimerkki](../../../examples/container-app/microservices)

### Tietokantasovellus - C# ja Azure SQL
**Teknologiat**: C# ASP.NET Core, Azure SQL Database, App Service  
**Vaativuus**: Keskitaso  
**Käsitteet**: Entity Framework, tietokantayhteydet, web-API-kehitys

### Serverless-funktio - Python Azure Functions
**Teknologiat**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Vaativuus**: Keskitaso  
**Käsitteet**: Tapahtumapohjainen arkkitehtuuri, serverless-laskenta, full-stack-kehitys

### Mikropalvelut - Java Spring Boot
**Teknologiat**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Vaativuus**: Keskitaso  
**Käsitteet**: Mikropalveluiden viestintä, hajautetut järjestelmät, yritystason mallit

### Microsoft Foundry -esimerkit

#### Azure OpenAI -chat-sovellus
**Teknologiat**: Azure OpenAI, Cognitive Search, App Service  
**Vaativuus**: Keskitaso  
**Käsitteet**: RAG-arkkitehtuuri, vektorihaut, LLM-integraatio

#### AI-asiakirjakäsittely
**Teknologiat**: Azure AI Document Intelligence, Storage, Functions  
**Vaativuus**: Keskitaso  
**Käsitteet**: Asiakirja-analyysi, OCR, tiedon poiminta

#### Koneoppimisen putkisto
**Teknologiat**: Azure ML, MLOps, Container Registry  
**Vaativuus**: Edistynyt  
**Käsitteet**: Mallin koulutus, käyttöönoton putkistot, valvonta

## 🛠 Konfiguraatioesimerkit

Kansio `configurations/` sisältää uudelleenkäytettäviä komponentteja:

### Ympäristökonfiguraatiot
- Kehitysympäristön asetukset
- Staging-ympäristön konfiguraatiot
- Tuotantovalmiit konfiguraatiot
- Monialueiset käyttöönottoasetukset

### Bicep-moduulit
- Uudelleenkäytettävät infrastruktuurikomponentit
- Yleiset resurssimallit
- Turvallisuutta vahvistavat mallipohjat
- Kustannusoptimoidut konfiguraatiot

### Avustavat skriptit
- Ympäristön käyttöönoton automaatio
- Tietokannan migraatio-skriptit
- Käyttöönoton validointityökalut
- Kustannusseurannan työkalut

## 🔧 Mukautusopas

### Esimerkkien mukauttaminen omaan käyttötapaukseesi

1. **Tarkista esivaatimukset**
   - Tarkista Azure-palveluiden vaatimukset
   - Varmista tilausrajoitukset
   - Ymmärrä kustannusvaikutukset

2. **Muokkaa konfiguraatiota**
   - Päivitä `azure.yaml` palvelumäärittelyt
   - Mukauta Bicep-malleja
   - Säädä ympäristömuuttujia

3. **Testaa huolellisesti**
   - Ota ensin käyttöön kehitysympäristöön
   - Varmista toiminnallisuus
   - Testaa skaalaus ja suorituskyky

4. **Turvallisuustarkastus**
   - Tarkista käyttöoikeudet
   - Ota käyttöön salaisuuksien hallinta
   - Ota käyttöön valvonta ja hälytykset

## 📊 Vertailumatriisi

| Esimerkki | Palvelut | Tietokanta | Todennus | Valvonta | Vaativuus |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Paikallinen) | 2 | ❌ | Key Vault | Täysi | ⭐⭐ |
| **Python Flask API** (Paikallinen) | 1 | ❌ | Perus | Täysi | ⭐ |
| **Microservices** (Paikallinen) | 5+ | ✅ | Yritys | Edistynyt | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Perus | Perus | ⭐ |
| React SPA + Functions | 3 | ✅ | Perus | Täysi | ⭐ |
| Python Flask Container | 2 | ❌ | Perus | Täysi | ⭐ |
| C# Web API + SQL | 2 | ✅ | Täysi | Täysi | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Täysi | Täysi | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Täysi | Täysi | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Perus | Täysi | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Paikallinen) | **8+** | **✅** | **Yritys** | **Edistynyt** | **⭐⭐⭐⭐** |

## 🎓 Oppimispolku

### Suositeltu eteneminen

1. **Aloita yksinkertaisella verkkosovelluksella**
   - Opettele AZD:n peruskäsitteet
   - Ymmärrä käyttöönoton työnkulku
   - Harjoittele ympäristön hallintaa

2. **Kokeile staattista verkkosivustoa**
   - Tutki erilaisia isännöintivaihtoehtoja
   - Opi CDN-integraatiosta
   - Ymmärrä DNS-konfiguraatio

3. **Siirry Container Appiin**
   - Opi konttiteknologian perusteet
   - Ymmärrä skaalausperiaatteet
   - Harjoittele Dockerilla

4. **Lisää tietokantaintegraatio**
   - Opi tietokantojen provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutustu serverlessiin**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opi triggereistä ja bindingeistä
   - Harjoittele API:illa

6. **Rakenna mikropalveluita**
   - Opi palveluiden välinen kommunikointi
   - Ymmärrä hajautetut järjestelmät
   - Harjoittele monimutkaisia käyttöönottoja

## 🔍 Oikean esimerkin löytäminen

### Teknologiapinon mukaan
- **Container Apps**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo -sovellus, [Microservices API Gateway (Paikallinen)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Paikallinen)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Paikallinen)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Paikallinen)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Paikallinen)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Paikallinen)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Arkkitehtuurimallin mukaan
- **Simple REST API**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api)
- **Monoliittinen**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices (Paikallinen)](../../../examples/container-app/microservices)
- **AI-Powered**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Paikallinen)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Vaikeustason mukaan
- **Aloittelija**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Keskitaso**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Edistynyt**: ML Pipeline
- **Yritystuotantovalmiit**: [Microservices (Paikallinen)](../../../examples/container-app/microservices) (Monipalveluinen ratkaisu viestijonotuksella), **Retail Multi-Agent Solution** (Täydellinen moni-agenttijärjestelmä ARM-mallilla otettavaksi käyttöön)

## 📚 Lisäresurssit

### Dokumentaatio-linkit
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisön esimerkit
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-sovellus Node.js:llä ja PostgreSQL:llä](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-verkkosovellus C#-API:lla](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java:lla](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parhaat käytännöt
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Esimerkkien lähettäminen

Onko sinulla hyödyllinen esimerkki jaettavaksi? Otamme mielellämme vastaan panoksesi!

### Lähetysohjeet
1. Noudata vakiintunutta hakemistorakennetta
2. Sisällytä kattava README.md
3. Lisää kommentteja konfiguraatiotiedostoihin
4. Testaa huolellisesti ennen lähettämistä
5. Sisällytä kustannusarviot ja ennakkoedellytykset

### Esimerkin mallirakenne
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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoa, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisen käsitteiden päälle!

## 🚀 Valmis aloittamaan?

### Oppimispolkusi

1. **Täysin aloittelija?** → Aloita [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Onko sinulla perustiedot AZD:stä?** → Kokeile [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Rakennatko tekoälysovelluksia?** → Aloita [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) tai tutustu [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, yli 2 tuntia)
4. **Tarvitsetko tietyn teknologiapinon?** → Käytä yllä olevaa [Oikean esimerkin löytäminen](../../../examples) osiota

### Seuraavat vaiheet

- ✅ Käy läpi yllä olevat [Vaatimukset](../../../examples)
- ✅ Valitse esimerkki taitotasollesi (katso [Kompleksisuusluokitus](../../../examples))
- ✅ Lue esimerkin README huolellisesti ennen käyttöönottoa
- ✅ Aseta muistutus suorittaa `azd down` testauksen jälkeen
- ✅ Jaa kokemuksesi GitHub Issuesin tai Discussionsin kautta

### Tarvitsetko apua?

- 📖 [UKK](../resources/faq.md) - Vastaukset yleisimpiin kysymyksiin
- 🐛 [Vianmääritys](../docs/chapter-07-troubleshooting/common-issues.md) - Korjaa käyttöönotto-ongelmat
- 💬 [GitHub-keskustelut](https://github.com/microsoft/AZD-for-beginners/discussions) - Kysy yhteisöltä
- 📚 [Opinto-opas](../resources/study-guide.md) - Vahvista oppimistasi

---

**Navigointi**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Opintomateriaalit**: [Opinto-opas](../resources/study-guide.md) | [Pikavihjeet](../resources/cheat-sheet.md) | [Sanasto](../resources/glossary.md)
- **🔧 Resurssit**: [UKK](../resources/faq.md) | [Vianmääritys](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Viimeksi päivitetty: marraskuu 2025 | [Ilmoita ongelmista](https://github.com/microsoft/AZD-for-beginners/issues) | [Lähetä esimerkkejä](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä saattaa olla virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä on pidettävä auktoritatiivisena lähteenä. Tärkeiden tietojen osalta suosittelemme ammattikääntäjän tekemää käännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->