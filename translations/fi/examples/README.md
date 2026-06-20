# Esimerkit - Käytännön AZD-mallit ja asetukset

**Oppiminen esimerkkien kautta - järjestetty luvun mukaan**
- **📚 Kurssin koti**: [AZD aloittelijoille](../README.md)
- **📖 Lukujen kartoitus**: Esimerkit järjestetty oppimisen vaikeustason mukaan
- **🚀 Paikallinen esimerkki**: [Vähittäiskaupan moni-agenttiratkaisu](retail-scenario.md)
- **🤖 Ulkoiset AI-esimerkit**: Linkkejä Azure Samples -repositorioihin

> **📍 TÄRKEÄÄ: Paikalliset vs ulkoiset esimerkit**  
> Tämä repositorio sisältää **4 täydellistä paikallista esimerkkiä** täysillä toteutuksilla:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-käyttöönotto keskustelukäyttöliittymällä)  
> - **Container Apps** (Yksinkertainen Flask-API + mikropalvelut)  
> - **Database App** (Web + SQL-tietokanta)  
> - **Retail Multi-Agent** (yritystason AI-ratkaisu)  
>  
> Lisäesimerkit ovat **ulkoisia viitteitä** Azure-Samples-repositoreihin, jotka voit kloonata.

## Johdanto

Tämä hakemisto tarjoaa käytännön esimerkkejä ja viitteitä auttaakseen sinua oppimaan Azure Developer CLI:tä käytännön harjoitusten kautta. Retail Multi-Agent -skenaario on täydellinen, tuotantovalmiiksi tehty toteutus, joka sisältyy tähän repositorioon. Lisäesimerkit viittaavat virallisiin Azure Samples -repositorioihin, jotka demonstroivat erilaisia AZD-malleja.

### Monimutkaisuuden selite

- ⭐ **Aloittelija** - Peruskäsitteet, yksittäinen palvelu, 15-30 minuuttia
- ⭐⭐ **Keskitaso** - Useita palveluita, tietokantaintegraatio, 30-60 minuuttia
- ⭐⭐⭐ **Edistynyt** - Monimutkainen arkkitehtuuri, AI-integraatio, 1-2 tuntia
- ⭐⭐⭐⭐ **Asiantuntija** - Tuotantovalmiit, yritystason mallit, 2+ tuntia

## 🎯 Mitä tässä repositoriossa oikeastaan on

### ✅ Paikallinen toteutus (valmis käytettäväksi)

#### [Microsoft Foundry Models Chat -sovellus](azure-openai-chat/README.md) 🆕
**Täydellinen gpt-4.1-käyttöönotto keskustelukäyttöliittymällä sisältyy tähän repoihin**

- **Sijainti:** `examples/azure-openai-chat/`
- **Monimutkaisuus:** ⭐⭐ (Keskitaso)
- **Sisältö:**
  - Täydellinen Microsoft Foundry Models -käyttöönotto (gpt-4.1)
  - Python-komentorivikäyttöliittymä keskusteluun
  - Key Vault -integraatio suojattuja API-avaimia varten
  - Bicep-infrastruktuurimallit
  - Token-käyttö- ja kustannusseuranta
  - Rajoitusten asettaminen ja virheenkäsittely

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

**Teknologiat:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container App -esimerkit](container-app/README.md) 🆕
**Laajat konttien käyttöönottoesimerkit sisältyvät tähän repoihin**

- **Sijainti:** `examples/container-app/`
- **Monimutkaisuus:** ⭐-⭐⭐⭐⭐ (Aloittelijasta asiantuntijaan)
- **Sisältö:**
  - [Pääopas](container-app/README.md) - Täydellinen yleiskatsaus konttien käyttöönotosta
  - [Yksinkertainen Flask-API](../../../examples/container-app/simple-flask-api) - Perusesimerkki REST-API:sta
  - [Mikropalveluarkkitehtuuri](../../../examples/container-app/microservices) - Tuotantovalmis monipalvelujärjestelmä
  - Pika-aloitus-, tuotanto- ja edistyneet mallit
  - Monitorointi, turvallisuus ja kustannusoptimointi

**Pika-aloitus:**
```bash
# Näytä pääopas
cd examples/container-app

# Ota käyttöön yksinkertainen Flask-API
cd simple-flask-api
azd up

# Ota käyttöön esimerkki mikropalveluista
cd ../microservices
azd up
```

**Teknologiat:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Vähittäiskaupan moni-agenttiratkaisu](retail-scenario.md) 🆕
**Täydellinen tuotantovalmis toteutus sisältyy tähän repoihin**

- **Sijainti:** `examples/retail-multiagent-arm-template/`
- **Monimutkaisuus:** ⭐⭐⭐⭐ (Edistynyt)
- **Sisältö:**
  - Täydellinen ARM-käyttöönoton malli
  - Moni-agenttiarkkitehtuuri (asiakas + varasto)
  - Microsoft Foundry Models -integraatio
  - AI-haku RAG-menetelmällä
  - Laaja valvonta
  - Yhden napsautuksen käyttöönotto-skripti

**Pika-aloitus:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologiat:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Ulkoiset Azure Samples -esimerkit (kloonaa käyttääksesi)

Seuraavia esimerkkejä ylläpidetään virallisissa Azure-Samples -repositoriumeissa. Kloonaa ne tutkiaksesi erilaisia AZD-malleja:

### Yksinkertaiset sovellukset (luvut 1-2)

| Mallipohja | Repositorio | Monimutkaisuus | Palvelut |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Paikallinen: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikropalvelut** | [Paikallinen: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Monipalveluinen, Service Bus, Cosmos DB, SQL |
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

| Mallipohja | Repositorio | Monimutkaisuus | Kohde |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Paikallinen: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-käyttöönotto |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Perus AI-keskustelu |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenttikehys |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-malli |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Yritystason AI |

### Tietokannat & kehittyneet mallit (luvut 3-8)

| Mallipohja | Repositorio | Monimutkaisuus | Kohde |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Tietokantaintegraatio |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL-serveriton |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Monipalveluinen |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Oppimistavoitteet

Työskentelemällä näiden esimerkkien parissa sinä:
- Harjoittelet Azure Developer CLI -työnkulkuja realistisissa sovellus-skenaarioissa
- Ymmärrät erilaisia sovellusarkkitehtuureja ja niiden azd-toteutuksia
- Hallitset Infrastructure as Code -mallit eri Azure-palveluille
- Sovellat konfiguraationhallintaa ja ympäristökohtaisia käyttöönotto-strategioita
- Toteutat monitorointi-, turvallisuus- ja skaalausmalleja käytännön tilanteissa
- Käsittelet ja debuggaat todellisia käyttöönottoja ja opit vianmääritystä

## Oppimistulokset

Esimerkkien läpikäynnin jälkeen pystyt:
- Julkaisemaan erilaisia sovellustyyppejä Azure Developer CLI:llä luottavaisesti
- Muokkaamaan annettuja malleja omien sovellusvaatimustesi mukaisesti
- Suunnittelemaan ja toteuttamaan räätälöityjä infrastruktuurimalleja Bicepillä
- Konfiguroimaan monimutkaisia monipalvelusovelluksia oikeilla riippuvuuksilla
- Soveltamaan turvallisuus-, monitorointi- ja suorituskykysuosituksia todellisissa tilanteissa
- Vianmäärityksen ja optimoinnin perusteet käytännön kokemuksen pohjalta

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

## Pika-aloitus-esimerkit

> **💡 Uusi AZD:ssä?** Aloita esimerkistä #1 (Flask API) - se vie ~20 minuuttia ja opettaa keskeiset käsitteet.

### Aloittelijoille
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Paikallinen) ⭐  
   Ota käyttöön yksinkertainen REST-API, joka skaalautuu nollaan  
   **Aika:** 20-25 minuuttia | **Kustannus:** $0-5/kuukausi  
   **Opit:** Perus azd-työnkulku, kontitus, terveystarkastukset  
   **Odotettu lopputulos:** Toimiva API-päätepiste palauttaa "Hello, World!" valvonnalla

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Julkaise Node.js Express -websovellus MongoDB:llä  
   **Aika:** 25-35 minuuttia | **Kustannus:** $10-30/kuukausi  
   **Opit:** Tietokantaintegraatio, ympäristömuuttujat, yhteysmerkkijonot  
   **Odotettu lopputulos:** Todo-lista-sovellus luo/lukee/muokkaa/poistaa toiminnallisuudella

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Isännöi React-pohjaista staattista sivustoa Azure Static Web Appsilla  
   **Aika:** 20-30 minuuttia | **Kustannus:** $0-10/kuukausi  
   **Opit:** Staattinen isännöinti, serverless-funktiot, CDN-julkaisu  
   **Odotettu lopputulos:** React-käyttöliittymä API-taustapalvelulla, automaattinen SSL, globaali CDN

### Keskitasoisille käyttäjille
4. **[Microsoft Foundry Models Chat -sovellus](../../../examples/azure-openai-chat)** (Paikallinen) ⭐⭐  
   Julkaise gpt-4.1 keskustelukäyttöliittymällä ja turvallisella API-avainten hallinnalla  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kuukausi  
   **Opit:** Microsoft Foundry Models -käyttöönotto, Key Vault -integraatio, token-seuranta  
   **Odotettu lopputulos:** Toimiva keskustelusovellus gpt-4.1:llä ja kustannusseurannalla

5. **[Container App - Mikropalvelut](../../../examples/container-app/microservices)** (Paikallinen) ⭐⭐⭐⭐  
   Tuotantovalmis monipalveluarkkitehtuuri  
   **Aika:** 45-60 minuuttia | **Kustannus:** $50-150/kuukausi  
   **Opit:** Palveluiden välinen kommunikointi, viestijonot, hajautettu seuranta  
   **Odotettu lopputulos:** 2-palvelun järjestelmä (API Gateway + Tuotepalvelu) valvonnalla

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web-sovellus C# API:lla ja Azure SQL -tietokannalla  
   **Aika:** 30-45 minuuttia | **Kustannus:** $20-80/kuukausi  
   **Opit:** Entity Framework, tietokantamigraatiot, yhteysturva  
   **Odotettu lopputulos:** C# API Azure SQL -taustalla, automaattinen skeeman käyttöönotto

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP-triggeröinneillä ja Cosmos DB:llä  
   **Aika:** 30-40 minuuttia | **Kustannus:** $10-40/kuukausi  
   **Opit:** Tapahtumapohjainen arkkitehtuuri, serverless-skaalaus, NoSQL-integraatio  
   **Odotettu lopputulos:** Funktiosovellus vastaa HTTP-pyyntöihin ja tallentaa Cosmos DB:hen

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Monipalveluinen Java-sovellus Container Appsilla ja API-gatewaylla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $80-200/kuukausi  
   **Opit:** Spring Boot -julkaisu, palveluverkko, kuormantasapainotus  
   **Odotettu lopputulos:** Monipalveluinen Java-järjestelmä palveluiden löytymisen ja reitityksen kanssa

### Microsoft Foundry -mallit

1. **[Microsoft Foundry Models Chat App - paikallinen esimerkki](../../../examples/azure-openai-chat)** ⭐⭐  
   Täydellinen gpt-4.1-käyttöönotto keskustelukäyttöliittymällä  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kuukausi  
   **Odotettu lopputulos:** Toimiva keskustelusovellus token-seurannalla ja kustannusmonitoroinnilla

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Älykäs keskustelusovellus RAG-arkkitehtuurilla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $100-300/kuukausi  
   **Odotettu lopputulos:** RAG-pohjainen keskustelukäyttöliittymä dokumenttihakutoiminnolla ja viitteillä

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Asiakirja-analyysi Azure AI -palveluilla  
   **Aika:** 40-60 minuuttia | **Kustannus:** $20-80/kuukausi  
   **Odotettu lopputulos:** API, joka poimii tekstiä, taulukoita ja entiteettejä ladatuista asiakirjoista

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-työnkulku Azure Machine Learningin kanssa  
   **Aika:** 2-3 tuntia | **Kustannus:** $150-500/kuukausi  
   **Odotettu lopputulos:** Automaattinen ML-putki koulutuksella, käyttöönotolla ja monitoroinnilla

### Todelliset skenaariot

#### **Retail Multi-Agent Solution** 🆕
**[Täydellinen toteutusopas](./retail-scenario.md)**

Kattava, tuotantovalmis moni-agenttipohjainen asiakastukiratkaisu, joka demonstroi yritystason AI-sovelluksen käyttöönottoa AZD:llä. Tämä skenaario tarjoaa:

- **Täydellinen arkkitehtuuri**: Moni-agenttijärjestelmä, jossa on erikoistuneet asiakaspalvelu- ja varastonhallinta-agentit
- **Tuotantoinfrastruktuuri**: Monialueiset Microsoft Foundry Models -asennukset, AI Search, Container Apps ja kattava seuranta
- **Valmis käyttöönotettava ARM Template**: Yhden napsautuksen käyttöönotto useilla kokoonpanotiloilla (Minimal/Standard/Premium)
- **Kehittyneet ominaisuudet**: Red teaming -tietoturvan validointi, agenttien arviointikehys, kustannusoptimointi ja vianmääritysohjeet
- **Todellinen liiketoimintakonteksti**: Vähittäiskaupan asiakaspalvelun käyttötapaus tiedostojen latauksilla, hakuintgraatiolla ja dynaamisella skaalaamisella

**Teknologiat**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Vaikeustaso**: ⭐⭐⭐⭐ (Edistynyt - Yrityksen tuotantovalmis)

**Täydellinen kohderyhmä**: AI-kehittäjille, ratkaisukehittäjille ja tiimeille, jotka rakentavat tuotantokelpoisia moniedustajajärjestelmiä

**Nopea aloitus**: Ota koko ratkaisu käyttöön alle 30 minuutissa mukana tulevalla ARM-templatella komennolla `./deploy.sh -g myResourceGroup`

## 📋 Käyttöohjeet

### Esivaatimukset

Ennen kuin suoritat mitään esimerkkiä:
- ✅ Azure-tilaus, jossa on Owner- tai Contributor-oikeudet
- ✅ Azure Developer CLI asennettuna ([Installation Guide](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop käynnissä (konttiesimerkeille)
- ✅ Sopivat Azure-kvot (tarkista esimerkkiin liittyvät vaatimukset)

> **💰 Kustannusvaroitus:** Kaikki esimerkit luovat oikeita Azure-resursseja, joista aiheutuu kustannuksia. Katso kunkin README-tiedoston kustannusarviot. Muista ajaa `azd down` valmiina ollessasi, jotta jatkuvat kulut vältetään.

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

3. **Konfiguroi ympäristö**
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
   
   **Odotetut onnistumisen merkit:**
   - ✅ `azd up` suorittuu ilman virheitä
   - ✅ Palvelun päätepiste palauttaa HTTP 200
   - ✅ Azure Portal näyttää "Running" -tilan
   - ✅ Application Insights vastaanottaa telemetriaa

> **⚠️ Ongelmia?** Katso [Common Issues](../docs/chapter-07-troubleshooting/common-issues.md) käyttöönoton vianmääritykseen

### Esimerkkien mukauttaminen

Jokainen esimerkki sisältää:
- **README.md** - Yksityiskohtaiset asennus- ja mukautusohjeet
- **azure.yaml** - AZD-konfiguraatio kommenttien kera
- **infra/** - Bicep-mallit parametriselityksineen
- **src/** - Esimerkkisovelluksen koodi
- **scripts/** - Apuohjelmat yleisiin tehtäviin

## 🎯 Oppimistavoitteet

### Esimerkkiluokat

#### **Perusasennukset**
- Yksipalveluiset sovellukset
- Yksinkertaiset infrastruktuurimallit
- Peruskonfiguraation hallinta
- Kustannustehokkaat kehitysympäristöt

#### **Edistyneet skenaariot**
- Monipalveluarkkitehtuurit
- Monimutkaiset verkotuskokoonpanot
- Tietokantaintegraatiomallit
- Tietoturva- ja vaatimustenmukaisuusratkaisut

#### **Tuotantovalmiit mallit**
- Korkean käytettävyyden kokoonpanot
- Monitorointi ja observability
- CI/CD-integraatio
- Liiketoiminnan jatkuvuuden varmistus

## 📖 Esimerkkikuvaukset

### Simple Web App - Node.js Express
**Teknologiat**: Node.js, Express, MongoDB, Container Apps  
**Vaikeustaso**: Aloittelija  
**Käsitteet**: Perusasennus, REST-API, NoSQL-tietokantaintegraatio

### Static Website - React SPA
**Teknologiat**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Vaikeustaso**: Aloittelija  
**Käsitteet**: Staattinen isännöinti, serverless-taustapalvelu, moderni web-kehitys

### Container App - Python Flask
**Teknologiat**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Vaikeustaso**: Aloittelija  
**Käsitteet**: Kontittaminen, REST-API, scale-to-zero, health probe -tarkistukset, monitorointi  
**Sijainti**: [Local Example](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Teknologiat**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Vaikeustaso**: Edistynyt  
**Käsitteet**: Monipalveluarkkitehtuuri, palveluiden välinen viestintä, viestijonotus, hajautettu seuranta  
**Sijainti**: [Local Example](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Teknologiat**: C# ASP.NET Core, Azure SQL Database, App Service  
**Vaikeustaso**: Keskitaso  
**Käsitteet**: Entity Framework, tietokantayhteydet, web-API-kehitys

### Serverless Function - Python Azure Functions
**Teknologiat**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Vaikeustaso**: Keskitaso  
**Käsitteet**: Tapahtumapohjainen arkkitehtuuri, serverless-laskenta, full-stack-kehitys

### Microservices - Java Spring Boot
**Teknologiat**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Vaikeustaso**: Keskitaso  
**Käsitteet**: Mikropalveluiden kommunikointi, hajautetut järjestelmät, yritystason mallit

### Microsoft Foundry Examples

#### Microsoft Foundry Models Chat App
**Teknologiat**: Microsoft Foundry Models, Azure AI Search, App Service  
**Vaikeustaso**: Keskitaso  
**Käsitteet**: RAG-arkkitehtuuri, vektorihaku, LLM-integraatio

#### AI Document Processing
**Teknologiat**: Azure AI Document Intelligence, Storage, Functions  
**Vaikeustaso**: Keskitaso  
**Käsitteet**: Asiakirjojen analysointi, OCR, tiedon poiminta

#### Machine Learning Pipeline
**Teknologiat**: Azure ML, MLOps, Container Registry  
**Vaikeustaso**: Edistynyt  
**Käsitteet**: Mallin koulutus, käyttöönotto-putket, monitorointi

## 🛠 Konfiguraatioesimerkit

Hakemisto `configurations/` sisältää uudelleenkäytettäviä komponentteja:

### Ympäristökonfiguraatiot
- Kehitysympäristön asetukset
- Staging-ympäristön konfiguraatiot
- Tuotantovalmiit konfiguraatiot
- Monialueiset käyttöönotot

### Bicep-moduulit
- Uudelleenkäytettävät infrastruktuurikomponentit
- Yleiset resurssimallit
- Tietoturvakovetetut templatet
- Kustannustehokkaat kokoonpanot

### Apuohjelmaskriptit
- Ympäristön asetusten automatisointi
- Tietokantamigraatio-skriptit
- Käyttöönoton validointityökalut
- Kustannusseurantatyökalut

## 🔧 Mukautusopas

### Esimerkkien mukauttaminen omaan käyttötapaukseesi

1. **Tarkista esivaatimukset**
   - Tarkista Azure-palvelujen vaatimukset
   - Varmista tilauksen rajat
   - Ymmärrä kustannusvaikutukset

2. **Muokkaa konfiguraatiota**
   - Päivitä `azure.yaml` -palvelumäärittelyt
   - Muokkaa Bicep-malleja
   - Säädä ympäristömuuttujia

3. **Testaa perusteellisesti**
   - Ota ensin käyttöön kehitysympäristöön
   - Vahvista toiminnallisuus
   - Testaa skaalautuvuus ja suorituskyky

4. **Tietoturvakatselmus**
   - Tarkista käyttöoikeudet
   - Ota käyttöön salaisuuksien hallinta
   - Ota monitorointi ja hälytykset käyttöön

## 📊 Vertailumatriisi

| Esimerkki | Palvelut | Tietokanta | Autentikointi | Valvonta | Vaikeustaso |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Paikallinen) | 2 | ❌ | Key Vault | Täysi | ⭐⭐ |
| **Python Flask API** (Paikallinen) | 1 | ❌ | Perus | Täysi | ⭐ |
| **Microservices** (Paikallinen) | 5+ | ✅ | Yritys | Edistynyt | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Perus | Perus | ⭐ |
| React SPA + Functions | 3 | ✅ | Perus | Täysi | ⭐ |
| Python Flask Container | 2 | ❌ | Perus | Täysi | ⭐ |
| C# Web API + SQL | 2 | ✅ | Täysi | Täysi | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Täysi | Täysi | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Täysi | Täysi | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Perus | Täysi | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Paikallinen) | **8+** | **✅** | **Yritys** | **Edistynyt** | **⭐⭐⭐⭐** |

## 🎓 Oppimispolku

### Suositeltu eteneminen

1. **Aloita Simple Web Appilla**
   - Opettele perus AZD-käsitteet
   - Ymmärrä käyttöönoton työflow
   - Harjoittele ympäristön hallintaa

2. **Kokeile Static Websitea**
   - Tutki eri isännöintivaihtoehtoja
   - Opettele CDN-integraatiota
   - Ymmärrä DNS-konfigurointi

3. **Siirry Container Appiin**
   - Opi kontittamisen perusteet
   - Ymmärrä skaalauskäsitteet
   - Harjoittele Dockerin kanssa

4. **Lisää tietokantaintegraatio**
   - Opi tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutustu serverlessiin**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opettele triggerit ja bindingit
   - Harjoittele API:ien kanssa

6. **Rakenna mikropalveluita**
   - Opi palveluiden välistä kommunikointia
   - Ymmärrä hajautetut järjestelmät
   - Harjoittele monimutkaisia käyttöönottoja

## 🔍 Oikean esimerkin löytäminen

### Teknologiapinon mukaan
- **Container Apps**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Local)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Local)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Local)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Local)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices), Java Microservices
- **Tietokannat**: [Microservices (Local)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Moniedustajajärjestelmät**: **Retail Multi-Agent Solution**
- **OpenAI-integraatio**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Yrityksen tuotantokäyttöön**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Arkkitehtuurimallin mukaan
- **Yksinkertainen REST-API**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api)
- **Monoliitti**: Node.js Express Todo, C# Web API + SQL
- **Staattinen + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikropalvelut**: [Production Microservices (Local)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Konttioitu**: [Python Flask (Local)](../../../examples/container-app/simple-flask-api), [Microservices (Local)](../../../examples/container-app/microservices)
- **AI-vetoinen**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Moniedustaja-arkkitehtuuri**: **Retail Multi-Agent Solution**
- **Yrityksen monipalveluarkkitehtuuri**: [Microservices (Local)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Vaikeustason mukaan
- **Aloittelija**: [Python Flask API (Local)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Keskitaso**: **[Microsoft Foundry Models Chat (Local)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Edistynyt**: ML Pipeline
- **Yrityksen tuotantovalmiit**: [Microservices (Local)](../../../examples/container-app/microservices) (Monipalvelu viestijonotuksella), **Retail Multi-Agent Solution** (Täydellinen moniedustajajärjestelmä ARM-templaten käyttöönotolla)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-verkkosovellus C#-API:lla](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps -tehtävä](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java:lla](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parhaat käytännöt
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Esimerkkien lähettäminen

Onko sinulla hyödyllinen esimerkki jaettavaksi? Otamme mielellämme vastaan esimerkkejä!

### Lähetysohjeet
1. Noudata vakiintunutta hakemistorakennetta
2. Lisää kattava README.md
3. Lisää kommentteja konfiguraatiotiedostoihin
4. Testaa huolellisesti ennen lähettämistä
5. Sisällytä kustannusarviot ja edellytykset

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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoasi, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisten käsitteiden päälle!

## 🚀 Valmiina aloittamaan?

### Oppimispolkusi

1. **Täysin aloittelija?** → Aloita [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Onko sinulla perustiedot AZD:stä?** → Kokeile [Mikropalvelut](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Rakennatko tekoälysovelluksia?** → Aloita [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) tai tutustu [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, yli 2 tuntia)
4. **Tarvitsetko tiettyä teknologiaa?** → Käytä yllä olevaa osiota [Löydä oikea esimerkki](#-finding-the-right-example)

### Seuraavat askeleet

- ✅ Käy läpi yllä olevat [Prerequisites](#esivaatimukset)
- ✅ Valitse taitotasoasi vastaava esimerkki (katso [Complexity Legend](#monimutkaisuuden-selite))
- ✅ Lue esimerkin README huolellisesti ennen käyttöönottoa
- ✅ Aseta muistutus suorittaa `azd down` testauksen jälkeen
- ✅ Jaa kokemuksesi GitHub Issues- tai Discussions-keskusteluissa

### Tarvitsetko apua?

- 📖 [FAQ](../resources/faq.md) - Yleisimmät kysymykset ja vastaukset
- 🐛 [Vianmääritysopas](../docs/chapter-07-troubleshooting/common-issues.md) - Korjaa käyttöönotto-ongelmia
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Kysy yhteisöltä
- 📚 [Opiskeluopas](../resources/study-guide.md) - Vahvista oppimistasi

---

**Navigointi**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Opintomateriaalit**: [Opiskeluopas](../resources/study-guide.md) | [Pikaopas](../resources/cheat-sheet.md) | [Sanasto](../resources/glossary.md)
- **🔧 Resurssit**: [FAQ](../resources/faq.md) | [Vianmääritys](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Viimeksi päivitetty: marraskuu 2025 | [Ilmoita ongelmista](https://github.com/microsoft/AZD-for-beginners/issues) | [Lähetä esimerkkejä](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->