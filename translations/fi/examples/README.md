# Esimerkit - Käytännön AZD-mallit ja -kokoonpanot

**Oppiminen esimerkkien kautta - Järjestetty luvuittain**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Lukujen kartoitus**: Esimerkit järjestetty oppimisen vaativuuden mukaan
- **🚀 Paikallinen esimerkki**: [Vähittäiskaupan moniagenttiratkaisu](retail-scenario.md)
- **🤖 Ulkoiset tekoälyesimerkit**: Linkkejä Azure Samples -repositorioihin

> **📍 TÄRKEÄÄ: Paikalliset vs ulkoiset esimerkit**  
> Tämä repositorio sisältää **4 täydellistä paikallista esimerkkiä** täydellisillä toteutuksilla:  
> - **Microsoft Foundry Models Chat** (gpt-4.1 käyttöönotto keskustelukäyttöliittymällä)  
> - **Container Apps** (Yksinkertainen Flask-API + mikropalvelut)  
> - **Tietokantasovellus** (Web + SQL-tietokanta)  
> - **Retail Multi-Agent** (Yritysratkaisu tekoälyllä)  
>  
> Lisäesimerkit ovat **ulkoisia viitteitä** Azure-Samples -repositorioihin, jotka voit kloonata.

## Johdanto

Tämä hakemisto tarjoaa käytännön esimerkkejä ja viitteitä, jotka auttavat oppimaan Azure Developer CLI:n käytännön kautta. Retail Multi-Agent -skenaario on täydellinen, tuotantovalmiiksi tarkoitettu toteutus, joka sisältyy tähän repositorioon. Lisäesimerkit viittaavat virallisiin Azure Samples -repositorioihin, jotka demonstroivat erilaisia AZD-malleja.

### Vaikeustason selite

- ⭐ **Aloittelija** - Peruskonseptit, yksi palvelu, 15-30 minuuttia
- ⭐⭐ **Keskitaso** - Useita palveluja, tietokantaintegraatio, 30-60 minuuttia
- ⭐⭐⭐ **Edistynyt** - Monimutkainen arkkitehtuuri, tekoälyintegraatio, 1-2 tuntia
- ⭐⭐⭐⭐ **Asiantuntija** - Tuotantovalmiit, yritystason mallit, 2+ tuntia

## 🎯 Mitä tässä repositoriossa on käytännössä

### ✅ Paikallinen toteutus (valmis käytettäväksi)

#### [Microsoft Foundry Models Chat -sovellus](azure-openai-chat/README.md) 🆕
**Tässä repositoriossa mukana täydellinen gpt-4.1-käyttöönotto keskustelukäyttöliittymällä**

- **Sijainti:** `examples/azure-openai-chat/`
- **Vaikeustaso:** ⭐⭐ (Keskitaso)
- **Sisältö:**
  - Täydellinen Microsoft Foundry Models -käyttöönotto (gpt-4.1)
  - Python-komentorivinen keskustelukäyttöliittymä
  - Key Vault -integraatio suojattuja API-avaimia varten
  - Bicep-infrastruktuurimallit
  - Tokenien käyttö- ja kustannusseuranta
  - Rajoitusten asettaminen ja virheenkäsittely

**Nopea aloitus:**
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
**Tässä repositoriossa mukana kattavat säiliöiden käyttöönottoesimerkit**

- **Sijainti:** `examples/container-app/`
- **Vaikeustaso:** ⭐-⭐⭐⭐⭐ (Aloittelijasta edistyneeseen)
- **Sisältö:**
  - [Master Guide](container-app/README.md) - Kattava yleiskatsaus säilöjen käyttöönotosta
  - [Yksinkertainen Flask-API](../../../examples/container-app/simple-flask-api) - Perus REST-API esimerkki
  - [Mikropalveluarkkitehtuuri](../../../examples/container-app/microservices) - Tuotantovalmiiksi monipalveluinen käyttöönotto
  - Nopea aloitus, tuotantokäytännöt ja edistyneet mallit
  - Valvonta, tietoturva ja kustannusoptimointi

**Nopea aloitus:**
```bash
# Näytä pääopas
cd examples/container-app

# Ota käyttöön yksinkertainen Flask-API
cd simple-flask-api
azd up

# Ota käyttöön mikropalveluesimerkki
cd ../microservices
azd up
```

**Teknologiat:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent -ratkaisu](retail-scenario.md) 🆕
**Tässä repositoriossa mukana täydellinen tuotantovalmiiksi tarkoitettu toteutus**

- **Sijainti:** `examples/retail-multiagent-arm-template/`
- **Vaikeustaso:** ⭐⭐⭐⭐ (Edistynyt)
- **Sisältö:**
  - Täydellinen ARM-käyttöönotto-malli
  - Moniagenttiarkkitehtuuri (Asiakas + Varasto)
  - Microsoft Foundry Models -integraatio
  - AI-haku RAG-mallilla
  - Kattava valvonta
  - Yhden klikkauksen käyttöönotto-skripti

**Nopea aloitus:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologiat:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Ulkoiset Azure Samples (Kloonaa käyttääksesi)

Seuraavia esimerkkejä ylläpidetään virallisissa Azure-Samples -repositorioissa. Kloonaa ne tutkiaksesi erilaisia AZD-malleja:

### Yksinkertaiset sovellukset (luvut 1-2)

| Malli | Repositorio | Vaikeustaso | Palvelut |
|:---------|:-----------|:-----------|:---------|
| **Python Flask -API** | [Paikallinen: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikropalvelut** | [Paikallinen: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Monipalvelu, Service Bus, Cosmos DB, SQL |
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

### Tekoälysovellus-esimerkit (luvut 2, 5, 8)

| Malli | Repositorio | Vaikeustaso | Tavoite |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Paikallinen: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1 käyttöönotto |
| **AI Chat -pika-aloitus** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Perus AI-keskustelu |
| **AI-agentit** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenttikehys |
| **Search + OpenAI -demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-malli |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Yritystason AI |

### Tietokanta- ja edistyneet mallit (luvut 3-8)

| Malli | Repositorio | Vaikeustaso | Tavoite |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Tietokantaintegraatio |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serveriton |
| **Java-mikropalvelut** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Monipalvelu |
| **ML-putki** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Oppimistavoitteet

Työskentelemällä näiden esimerkkien parissa opit:
- Harjoittele Azure Developer CLI -työnkulkuja realististen sovellusskenaarioiden parissa
- Ymmärrä erilaisia sovellusarkkitehtuureja ja niiden azd-toteutuksia
- Hallitse Infrastructure as Code -mallit eri Azure-palveluille
- Käytä konfiguraationhallintaa ja ympäristökohtaisia käyttöönotto­strategioita
- Toteuta valvonta-, tietoturva- ja skaalautuvuusmalleja käytännön tilanteissa
- Kehitä kokemusta vianetsinnästä ja virheenkorjauksesta todellisissa käyttöönotto­skenaarioissa

## Oppimistulokset

Näiden esimerkkien läpikäynnin jälkeen osaat:
- Ota käyttöön eri tyyppisiä sovelluksia Azure Developer CLI:llä itsevarmasti
- Mukauta toimitettuja malleja omien sovellusvaatimustesi mukaan
- Suunnittele ja toteuta räätälöityjä infrastruktuurimalleja käyttäen Bicep:iä
- Määritä monimutkaisia monipalvelusovelluksia oikeilla riippuvuuksilla
- Käytä tietoturva-, valvonta- ja suorituskykyparhaiden käytäntöjen periaatteita todellisissa tilanteissa
- Vianetsintä ja käyttöönottojen optimointi käytännön kokemuksen perusteella

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

## Nopeat aloitusesimerkit

> **💡 Uusi AZD:ssä?** Aloita esimerkistä #1 (Flask API) - se vie ~20 minuuttia ja opettaa ydinkäsitteet.

### Aloittelijoille
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Paikallinen) ⭐  
   Ota käyttöön yksinkertainen REST-API, joka skaalautuu nollaan  
   **Aika:** 20-25 minuuttia | **Kustannus:** $0-5/kuukausi  
   **Opit:** Perus azd-työnkulku, säiliöinti, terveystarkastukset  
   **Odotettu lopputulos:** Toimiva API-päätepiste, joka palauttaa "Hello, World!" valvonnalla

2. **[Simple Web App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Ota käyttöön Node.js Express -web-sovellus MongoDB:llä  
   **Aika:** 25-35 minuuttia | **Kustannus:** $10-30/kuukausi  
   **Opit:** Tietokantaintegraatio, ympäristömuuttujat, yhteysmerkkijonot  
   **Odotettu lopputulos:** Todo-listasovellus, jossa on luo/lue/päivitä/poista -toiminnot

3. **[Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Isännöi React-pohjaista staattista sivustoa Azure Static Web Appsilla  
   **Aika:** 20-30 minuuttia | **Kustannus:** $0-10/kuukausi  
   **Opit:** Staattinen isännöinti, serverittömät funktiot, CDN-käyttöönotto  
   **Odotettu lopputulos:** React-käyttöliittymä API-taustapalvelulla, automaattinen SSL ja maailmanlaajuinen CDN

### Keskitasoisille käyttäjille
4. **[Microsoft Foundry Models Chat Application](../../../examples/azure-openai-chat)** (Paikallinen) ⭐⭐  
   Ota käyttöön gpt-4.1 keskustelukäyttöliittymällä ja turvallisella API-avainten hallinnalla  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kuukausi  
   **Opit:** Microsoft Foundry Models -käyttöönotto, Key Vault -integraatio, tokenien seuranta  
   **Odotettu lopputulos:** Toimiva keskustelusovellus gpt-4.1:llä ja kustannusseurannalla

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Paikallinen) ⭐⭐⭐⭐  
   Tuotantovalmiiksi monipalveluarkkitehtuuri  
   **Aika:** 45-60 minuuttia | **Kustannus:** $50-150/kuukausi  
   **Opit:** Palveluiden välinen viestintä, viestijonotus, hajautettu jäljitys  
   **Odotettu lopputulos:** 2-palvelun järjestelmä (API Gateway + Product Service) valvonnalla

6. **[Database App - C# with Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Web-sovellus C#-API:lla ja Azure SQL -tietokannalla  
   **Aika:** 30-45 minuuttia | **Kustannus:** $20-80/kuukausi  
   **Opit:** Entity Framework, tietokantamigraatiot, yhteyksien turvallisuus  
   **Odotettu lopputulos:** C#-API Azure SQL -taustajärjestelmällä, automaattinen skeeman käyttöönotto

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP-triggereillä ja Cosmos DB:llä  
   **Aika:** 30-40 minuuttia | **Kustannus:** $10-40/kuukausi  
   **Opit:** Tapahtumapohjainen arkkitehtuuri, serveriton skaalautuvuus, NoSQL-integraatio  
   **Odotettu lopputulos:** Funktiosovellus vastaa HTTP-pyyntöihin ja käyttää Cosmos DB -tallennusta

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Monipalveluinen Java-sovellus Container Appsilla ja API-gatewaylla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $80-200/kuukausi  
   **Opit:** Spring Boot -käyttöönotto, palveluverkko (service mesh), kuormantasapainotus  
   **Odotettu lopputulos:** Monipalveluinen Java-järjestelmä palvelunlöytämisellä ja reitityksellä

### Microsoft Foundry -mallit

1. **[Microsoft Foundry Models Chat App - paikallinen esimerkki](../../../examples/azure-openai-chat)** ⭐⭐  
   Täydellinen gpt-4.1-käyttöönotto keskustelukäyttöliittymällä  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kuukausi  
   **Odotettu lopputulos:** Toimiva keskustelusovellus token-seurannalla ja kustannusseurannalla

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Älykäs keskustelusovellus RAG-arkkitehtuurilla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $100-300/kuukausi  
   **Odotettu lopputulos:** RAG-vetoinen keskustelukäyttöliittymä asiakirjahakuineen ja lähdeviitteineen

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Asiakirja-analyysi Azure AI -palveluilla  
   **Aika:** 40-60 minuuttia | **Kustannus:** $20-80/kuukausi  
   **Odotettu lopputulos:** API, joka poimii tekstiä, taulukoita ja entiteettejä ladatuista asiakirjoista

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-työnkulku Azure Machine Learningillä  
   **Aika:** 2-3 tuntia | **Kustannus:** $150-500/kuukausi  
   **Odotettu lopputulos:** Automaattinen ML-putki koulutuksella, käyttöönotolla ja valvonnalla

### Todelliset käyttöskenaariot

#### **Retail Multi-Agent -ratkaisu** 🆕
**[Täydellinen toteutusopas](./retail-scenario.md)**

Kaikkiaan tuotantovalmiiksi tarkoitettu moniagenttinen asiakastuen ratkaisu, joka demonstroi yritystason tekoälysovelluksen käyttöönottoa AZD:llä. Tämä skenaario tarjoaa:
- **Täydellinen arkkitehtuuri**: Moni-agenttijärjestelmä, jossa erikoistuneita asiakaspalvelu- ja varastonhallinta-agentteja
- **Tuotantoinfrastruktuuri**: Monialueiset Microsoft Foundry Models -käyttöönotot, AI Search, Container Apps ja kattava valvonta
- **Valmis käyttöön otettavaksi ARM-malli**: Yhden napsautuksen käyttöönotto useilla konfigurointitiloilla (Minimal/Standard/Premium)
- **Edistyneet ominaisuudet**: Red teaming -tietoturvatarkastus, agenttien arviointikehys, kustannusoptimointi ja vianmääritysohjeet
- **Todellinen liiketoimintakonteksti**: Vähittäiskauppiaan asiakastuen käyttötapaus tiedostojen latauksilla, hakujen integraatiolla ja dynaamisella skaalaamisella

**Teknologiat**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Monimutkaisuus**: ⭐⭐⭐⭐ (Edistynyt - Yritystason tuotantovalmis)

**Täydellinen valinta**: AI-kehittäjille, ratkaisusuunnittelijoille ja tiimeille, jotka rakentavat tuotantoon tarkoitettuja moni-agenttijärjestelmiä

**Pika-aloitus**: Ota täysi ratkaisu käyttöön alle 30 minuutissa käyttämällä mukana tulevaa ARM-mallia komennolla `./deploy.sh -g myResourceGroup`

## 📋 Käyttöohjeet

### Esivaatimukset

Before running any example:
- ✅ Azure-tilaus, jossa on Owner- tai Contributor-oikeudet
- ✅ Azure Developer CLI asennettuna ([Asennusohje](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop käynnissä (konttiesimerkkejä varten)
- ✅ Soveltuvat Azure-kiintiöt (tarkista esimerkkikohtaiset vaatimukset)

> **💰 Kustannusvaroitus:** Kaikki esimerkit luovat todellisia Azure-resursseja, joista aiheutuu kustannuksia. Katso kustannusarviot kunkin README-tiedoston kohdasta. Muista suorittaa `azd down` käytön jälkeen välttääksesi jatkuvat kustannukset.

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
   # Ota käyttöön infrastruktuuri ja sovellus
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
   - ✅ `azd up` suoritetaan ilman virheitä
   - ✅ Palvelun päätepiste vastaa HTTP 200 -koodilla
   - ✅ Azure-portaali näyttää tilan "Running"
   - ✅ Application Insights vastaanottaa telemetriaa

> **⚠️ Ongelmia?** Katso [Yleiset ongelmat](../docs/chapter-07-troubleshooting/common-issues.md) käyttöönottovianmääritystä varten

### Esimerkkien mukauttaminen

Jokainen esimerkki sisältää:
- **README.md** - Yksityiskohtaiset asennus- ja mukautusohjeet
- **azure.yaml** - AZD-konfiguraatio kommenttien kera
- **infra/** - Bicep-mallit parametriselityksineen
- **src/** - Esimerkkisovelluksen koodi
- **scripts/** - Apuskkriptit yleisiin tehtäviin

## 🎯 Oppimistavoitteet

### Esimerkkiluokat

#### **Peruskäyttöönotot**
- Yksipalvelusovellukset
- Yksinkertaiset infrastruktuurimallit
- Peruskonfiguraation hallinta
- Kustannustehokkaat kehitysympäristöt

#### **Edistyneet skenaariot**
- Monipalveluarkkitehtuurit
- Monimutkaiset verkkoasetukset
- Tietokantaintegraatiomallit
- Tietoturva- ja vaatimustenmukaisuuden toteutukset

#### **Tuotantovalmiit mallit**
- Korkean käytettävyyden kokoonpanot
- Valvonta ja havaittavuus
- CI/CD-integraatio
- Hätäpalautusasetukset

## 📖 Esimerkkikuvaukset

### Yksinkertainen web-sovellus - Node.js Express
**Teknologiat**: Node.js, Express, MongoDB, Container Apps  
**Monimutkaisuus**: Aloittelija  
**Käsitteet**: Peruskäyttöönotto, REST-API, NoSQL-tietokanta-integraatio

### Staattinen verkkosivusto - React SPA
**Teknologiat**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Monimutkaisuus**: Aloittelija  
**Käsitteet**: Staattinen hosting, serverless-backend, moderni web-kehitys

### Container App - Python Flask
**Teknologiat**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Monimutkaisuus**: Aloittelija  
**Käsitteet**: Konttiteknologia, REST-API, scale-to-zero, terveystarkastukset, valvonta  
**Sijainti**: [Paikallinen esimerkki](../../../examples/container-app/simple-flask-api)

### Container App - Mikropalveluarkkitehtuuri
**Teknologiat**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Monimutkaisuus**: Edistynyt  
**Käsitteet**: Monipalveluarkkitehtuuri, palvelujen välinen viestintä, viestijonot, hajautettu jäljitys  
**Sijainti**: [Paikallinen esimerkki](../../../examples/container-app/microservices)

### Tietokantasovellus - C# Azure SQL:llä
**Teknologiat**: C# ASP.NET Core, Azure SQL Database, App Service  
**Monimutkaisuus**: Keskitaso  
**Käsitteet**: Entity Framework, tietokantayhteydet, web-API-kehitys

### Serverless-funktio - Python Azure Functions
**Teknologiat**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Monimutkaisuus**: Keskitaso  
**Käsitteet**: Tapahtumapohjainen arkkitehtuuri, serverless-laskenta, full-stack-kehitys

### Mikropalvelut - Java Spring Boot
**Teknologiat**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Monimutkaisuus**: Keskitaso  
**Käsitteet**: Mikropalvelujen viestintä, hajautetut järjestelmät, yritystason mallit

### Microsoft Foundry -esimerkit

#### Microsoft Foundry Models Chat -sovellus
**Teknologiat**: Microsoft Foundry Models, Cognitive Search, App Service  
**Monimutkaisuus**: Keskitaso  
**Käsitteet**: RAG-arkkitehtuuri, vektorihaku, LLM-integraatio

#### AI-dokumenttien käsittely
**Teknologiat**: Azure AI Document Intelligence, Storage, Functions  
**Monimutkaisuus**: Keskitaso  
**Käsitteet**: Asiakirjojen analyysi, OCR, tiedon poiminta

#### Koneoppimisputki
**Teknologiat**: Azure ML, MLOps, Container Registry  
**Monimutkaisuus**: Edistynyt  
**Käsitteet**: Mallin koulutus, käyttöönotto-putket, valvonta

## 🛠 Konfiguraatioesimerkit

The `configurations/` directory contains reusable components:

### Ympäristökonfiguraatiot
- Kehitysympäristön asetukset
- Staging-ympäristön konfiguraatiot
- Tuotantovalmiit konfiguraatiot
- Monialueiset käyttöönottojärjestelyt

### Bicep-moduulit
- Uudelleenkäytettävät infrastruktuurikomponentit
- Yleiset resurssimallit
- Turvallisuusvahvistetut mallit
- Kustannusoptimoidut konfiguraatiot

### Apuskriptit
- Ympäristön asennuksen automatisointi
- Tietokantamigraatio-skriptit
- Käyttöönoton validointityökalut
- Kustannusten seurantatyökalut

## 🔧 Mukautusopas

### Esimerkkien mukauttaminen omaan käyttötapaukseesi

1. **Tarkista esivaatimukset**
   - Tarkista Azure-palveluiden vaatimukset
   - Varmista tilin rajoitukset
   - Ymmärrä kustannusvaikutukset

2. **Muokkaa konfiguraatiota**
   - Päivitä `azure.yaml`-palvelumäärittelyt
   - Mukauta Bicep-malleja
   - Muokkaa ympäristömuuttujia

3. **Testaa huolellisesti**
   - Ota ensin käyttöön kehitysympäristöön
   - Varmista toiminnallisuus
   - Testaa skaalaus ja suorituskyky

4. **Tietoturvatarkastus**
   - Tarkista käyttöoikeudet
   - Ota käyttöön salaisuuksien hallinta
   - Aktiivoi valvonta ja hälytykset

## 📊 Vertailumatriisi

| Esimerkki | Palvelut | Tietokanta | Todennus | Valvonta | Monimutkaisuus |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Paikallinen) | 2 | ❌ | Key Vault | Täysi | ⭐⭐ |
| **Python Flask API** (Paikallinen) | 1 | ❌ | Perus | Täysi | ⭐ |
| **Microservices** (Paikallinen) | 5+ | ✅ | Yritystason | Edistynyt | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Perus | Perus | ⭐ |
| React SPA + Functions | 3 | ✅ | Perus | Täysi | ⭐ |
| Python Flask Container | 2 | ❌ | Perus | Täysi | ⭐ |
| C# Web API + SQL | 2 | ✅ | Täysi | Täysi | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Täysi | Täysi | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Täysi | Täysi | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Perus | Täysi | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Paikallinen) | **8+** | **✅** | **Yritystason** | **Edistynyt** | **⭐⭐⭐⭐** |

## 🎓 Oppimispolku

### Suositeltu etenemisjärjestys

1. **Aloita yksinkertaisella web-sovelluksella**
   - Opi perus-AZD-käsitteet
   - Ymmärrä käyttöönoton työnkulku
   - Harjoittele ympäristön hallintaa

2. **Kokeile staattista verkkosivustoa**
   - Tutki eri hosting-vaihtoehtoja
   - Opi CDN-integraatiosta
   - Ymmärrä DNS-konfigurointi

3. **Siirry Container App -sovellukseen**
   - Opi konttiteknologian perusteet
   - Ymmärrä skaalauskonseptit
   - Harjoittele Dockerilla

4. **Lisää tietokantaintegraatio**
   - Opi tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutki serverlessiä**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opi triggereistä ja bindingeista
   - Harjoittele API:illa

6. **Rakenna mikropalveluja**
   - Opi palvelujen välistä viestintää
   - Ymmärrä hajautetut järjestelmät
   - Harjoittele monimutkaisia käyttöönottoja

## 🔍 Oikean esimerkin löytäminen

### Teknologiapinon mukaan
- **Container Apps**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Paikallinen)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Paikallinen)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Paikallinen)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Paikallinen)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Paikallinen)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Systems**: **Retail Multi-Agent Solution**
- **OpenAI Integration**: **[Microsoft Foundry Models Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Paikallinen)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Arkkitehtuurimallin mukaan
- **Simple REST API**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api)
- **Monoliittinen**: Node.js Express Todo, C# Web API + SQL
- **Staattinen + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerized**: [Python Flask (Paikallinen)](../../../examples/container-app/simple-flask-api), [Microservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **AI-Powered**: **[Microsoft Foundry Models Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent Architecture**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Paikallinen)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Monimutkaisuustason mukaan
- **Aloittelija**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Keskitaso**: **[Microsoft Foundry Models Chat (Paikallinen)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, AI Document Processing
- **Edistynyt**: ML Pipeline
- **Yritystason tuotantovalmis**: [Microservices (Paikallinen)](../../../examples/container-app/microservices) (Monipalvelu viestijonotuksella), **Retail Multi-Agent Solution** (Täydellinen moni-agenttijärjestelmä ARM-mallilla käyttöönotettavaksi)

## 📚 Lisäresurssit

### Dokumentaatiolinkit
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure-arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisön esimerkit
- [Azure Samples AZD -mallit](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry -mallit](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI -galleria](https://azure.github.io/awesome-azd/)
- [Todo-sovellus C#:lla ja Azure SQL:llä](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-sovellus Pythonilla ja MongoDB:llä](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-sovellus Node.js:llä ja PostgreSQL:llä](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-verkkosovellus C#-rajapinnalla](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps -tehtävä](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java-kielellä](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parhaat käytännöt
- [Azure Well-Architected -viitekehys](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Pilven käyttöönoton viitekehys](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Esimerkkien lähettäminen

Onko sinulla hyödyllinen esimerkki jaettavaksi? Otamme mielellämme vastaan kontribuutioita!

### Lähetysohjeet
1. Noudata määriteltyä hakemistorakennetta
2. Sisällytä kattava README.md
3. Lisää kommentteja konfigurointitiedostoihin
4. Testaa huolellisesti ennen lähettämistä
5. Lisää kustannusarviot ja esivaatimukset

### Esimerkkipohjan rakenne
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

**Pro-vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiakokonaisuuttasi, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisten käsitteiden päälle!

## 🚀 Valmis aloittamaan?

### Oppimispolkusi

1. **Täysin aloittelija?** → Aloita with [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Onko sinulla perustiedot AZD:stä?** → Kokeile [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Rakennatko tekoälysovelluksia?** → Aloita [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) tai tutustu [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, yli 2 tuntia)
4. **Tarvitsetko tiettyä teknologista pinoa?** → Käytä yllä olevaa osiota [Oikean esimerkin löytäminen](#-finding-the-right-example)

### Seuraavat askeleet

- ✅ Käy läpi yllä olevat [Esivaatimukset](#esivaatimukset)
- ✅ Valitse taitotasollesi sopiva esimerkki (katso [Monimutkaisuusmerkintä](#vaikeustason-selite))
- ✅ Lue esimerkin README huolellisesti ennen käyttöönottoa
- ✅ Aseta muistutus suorittaa `azd down` testauksen jälkeen
- ✅ Jaa kokemuksesi GitHub Issuesin tai Discussionsin kautta

### Tarvitsetko apua?

- 📖 [UKK](../resources/faq.md) - Vastauksia yleisiin kysymyksiin
- 🐛 [Vianmääritysohje](../docs/chapter-07-troubleshooting/common-issues.md) - Korjaa käyttöönotto-ongelmat
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Kysy yhteisöltä
- 📚 [Opas](../resources/study-guide.md) - Vahvista oppimistasi

---

**Navigointi**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Opintomateriaalit**: [Opas](../resources/study-guide.md) | [Pikaopas](../resources/cheat-sheet.md) | [Sanasto](../resources/glossary.md)
- **🔧 Resurssit**: [UKK](../resources/faq.md) | [Vianmääritys](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Viimeksi päivitetty: marraskuu 2025 | [Ilmoita ongelmista](https://github.com/microsoft/AZD-for-beginners/issues) | [Lähetä esimerkkejä](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää auktoritatiivisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->