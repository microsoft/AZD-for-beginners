<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "4a896781acb2a7bebb3c4c66c4f46e7f",
  "translation_date": "2025-11-21T15:34:09+00:00",
  "source_file": "examples/README.md",
  "language_code": "fi"
}
-->
# Esimerkit - Käytännön AZD-mallit ja -konfiguraatiot

**Oppiminen esimerkkien avulla - Järjestetty luvuittain**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../README.md)
- **📖 Lukujaottelu**: Esimerkit järjestetty oppimisen vaikeustason mukaan
- **🚀 Paikallinen esimerkki**: [Vähittäiskaupan monen agentin ratkaisu](retail-scenario.md)
- **🤖 Ulkoiset AI-esimerkit**: Linkit Azure Samples -tietovarastoihin

> **📍 TÄRKEÄÄ: Paikalliset vs ulkoiset esimerkit**  
> Tämä tietovarasto sisältää **4 täydellistä paikallista esimerkkiä** täysillä toteutuksilla:  
> - **Azure OpenAI Chat** (GPT-4 käyttöönotto chat-käyttöliittymällä)  
> - **Container Apps** (Yksinkertainen Flask-API + mikropalvelut)  
> - **Tietokantasovellus** (Web + SQL-tietokanta)  
> - **Vähittäiskaupan monen agentin ratkaisu** (Yritystason AI-ratkaisu)  
>  
> Lisäesimerkit ovat **ulkoisia viittauksia** Azure-Samples-tietovarastoihin, jotka voit kloonata.

## Johdanto

Tämä hakemisto tarjoaa käytännön esimerkkejä ja viittauksia, jotka auttavat sinua oppimaan Azure Developer CLI:n käytön käytännön harjoittelun kautta. Vähittäiskaupan monen agentin skenaario on täydellinen, tuotantovalmiiksi toteutettu ratkaisu, joka sisältyy tähän tietovarastoon. Lisäesimerkit viittaavat virallisiin Azure Samples -toteutuksiin, jotka esittelevät erilaisia AZD-malleja.

### Vaikeustason luokitus

- ⭐ **Aloittelija** - Peruskäsitteet, yksi palvelu, 15-30 minuuttia
- ⭐⭐ **Keskitaso** - Useita palveluita, tietokantaintegraatio, 30-60 minuuttia
- ⭐⭐⭐ **Edistynyt** - Monimutkainen arkkitehtuuri, AI-integraatio, 1-2 tuntia
- ⭐⭐⭐⭐ **Asiantuntija** - Tuotantovalmiit, yritystason mallit, 2+ tuntia

## 🎯 Mitä tässä tietovarastossa on

### ✅ Paikallinen toteutus (valmis käytettäväksi)

#### [Azure OpenAI Chat -sovellus](azure-openai-chat/README.md) 🆕
**Täydellinen GPT-4 käyttöönotto chat-käyttöliittymällä sisältyy tähän tietovarastoon**

- **Sijainti:** `examples/azure-openai-chat/`
- **Vaikeustaso:** ⭐⭐ (Keskitaso)
- **Sisältö:**
  - Täydellinen Azure OpenAI käyttöönotto (GPT-4)
  - Python-komentorivipohjainen chat-käyttöliittymä
  - Key Vault -integraatio turvallisia API-avaimia varten
  - Bicep-infrastruktuurimallit
  - Tokenien käyttö ja kustannusseuranta
  - Nopeusrajoitukset ja virheenkäsittely

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
**Kattavat konttien käyttöönottoesimerkit sisältyvät tähän tietovarastoon**

- **Sijainti:** `examples/container-app/`
- **Vaikeustaso:** ⭐-⭐⭐⭐⭐ (Aloittelijasta asiantuntijaan)
- **Sisältö:**
  - [Pääopas](container-app/README.md) - Kattava yleiskatsaus konttien käyttöönottoon
  - [Yksinkertainen Flask-API](../../../examples/container-app/simple-flask-api) - Perus REST API -esimerkki
  - [Mikropalveluarkkitehtuuri](../../../examples/container-app/microservices) - Tuotantovalmiit monipalvelutoteutukset
  - Pika-aloitus, tuotanto ja edistyneet mallit
  - Seuranta, turvallisuus ja kustannusten optimointi

**Pika-aloitus:**
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

#### [Vähittäiskaupan monen agentin ratkaisu](retail-scenario.md) 🆕
**Täydellinen tuotantovalmiiksi toteutettu ratkaisu sisältyy tähän tietovarastoon**

- **Sijainti:** `examples/retail-multiagent-arm-template/`
- **Vaikeustaso:** ⭐⭐⭐⭐ (Edistynyt)
- **Sisältö:**
  - Täydellinen ARM-käyttöönotto
  - Monen agentin arkkitehtuuri (Asiakas + Varasto)
  - Azure OpenAI -integraatio
  - AI-haku RAG-mallilla
  - Kattava seuranta
  - Yhden klikkauksen käyttöönotto

**Pika-aloitus:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Teknologiat:** Azure OpenAI, AI-haku, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Ulkoiset Azure Samples (kloonaa käytettäväksi)

Seuraavat esimerkit ovat virallisissa Azure-Samples-tietovarastoissa. Kloonaa ne tutkiaksesi erilaisia AZD-malleja:

### Yksinkertaiset sovellukset (Luvut 1-2)

| Malli | Tietovarasto | Vaikeustaso | Palvelut |
|:------|:-------------|:------------|:---------|
| **Python Flask API** | [Paikallinen: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Mikropalvelut** | [Paikallinen: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Monipalvelu, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Käyttöohjeet:**
```bash
# Kloonaa mikä tahansa esimerkki
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Ota käyttöön
azd up
```

### AI-sovellusesimerkit (Luvut 2, 5, 8)

| Malli | Tietovarasto | Vaikeustaso | Painopiste |
|:------|:-------------|:------------|:-----------|
| **Azure OpenAI Chat** | [Paikallinen: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4 käyttöönotto |
| **AI Chat Pika-aloitus** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Perus AI-chat |
| **AI-agentit** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenttikehys |
| **Haku + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-malli |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Yritystason AI |

### Tietokanta & edistyneet mallit (Luvut 3-8)

| Malli | Tietovarasto | Vaikeustaso | Painopiste |
|:------|:-------------|:------------|:-----------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Tietokantaintegraatio |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL-palveluton |
| **Java-mikropalvelut** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Monipalvelu |
| **ML-putki** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Oppimistavoitteet

Näiden esimerkkien avulla opit:
- Harjoittelemaan Azure Developer CLI -työnkulkuja realistisilla sovellusskenaarioilla
- Ymmärtämään erilaisia sovellusarkkitehtuureja ja niiden AZD-toteutuksia
- Hallitsemaan Infrastructure as Code -malleja eri Azure-palveluille
- Soveltamaan konfiguraationhallintaa ja ympäristökohtaisia käyttöönottoja
- Toteuttamaan seuranta-, turvallisuus- ja skaalausmalleja käytännön yhteyksissä
- Kertymään kokemusta vianetsinnästä ja todellisten käyttöönottojen optimoinnista

## Oppimistulokset

Näiden esimerkkien suorittamisen jälkeen osaat:
- Ottaa käyttöön erilaisia sovellustyyppejä Azure Developer CLI:llä luottavaisesti
- Mukauttaa tarjottuja malleja omiin sovellusvaatimuksiisi
- Suunnitella ja toteuttaa räätälöityjä infrastruktuurimalleja Bicepillä
- Konfiguroida monimutkaisia monipalvelusovelluksia oikeilla riippuvuuksilla
- Soveltaa turvallisuus-, seuranta- ja suorituskyvyn parhaita käytäntöjä todellisissa skenaarioissa
- Vianetsintä ja optimointi käyttöönottojen perusteella käytännön kokemuksella

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

## Pika-aloitus esimerkit

> **💡 Uusi AZD:ssä?** Aloita esimerkistä #1 (Flask API) - se kestää noin 20 minuuttia ja opettaa ydinkonseptit.

### Aloittelijoille
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Paikallinen) ⭐  
   Ota käyttöön yksinkertainen REST API, joka skaalautuu nollaan  
   **Aika:** 20-25 minuuttia | **Kustannus:** $0-5/kuukausi  
   **Opit:** Perus AZD-työnkulku, kontitus, terveysprobet  
   **Odotettu tulos:** Toimiva API-päätepiste, joka palauttaa "Hello, World!" seurannalla

2. **[Yksinkertainen verkkosovellus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Ota käyttöön Node.js Express -verkkosovellus MongoDB:llä  
   **Aika:** 25-35 minuuttia | **Kustannus:** $10-30/kuukausi  
   **Opit:** Tietokantaintegraatio, ympäristömuuttujat, yhteysmerkkijonot  
   **Odotettu tulos:** Tehtävälista-sovellus, jossa luonti/luku/päivitys/poisto-toiminnallisuus

3. **[Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Isännöi React-staattista verkkosivustoa Azure Static Web Appsilla  
   **Aika:** 20-30 minuuttia | **Kustannus:** $0-10/kuukausi  
   **Opit:** Staattinen isännöinti, palveluttomat funktiot, CDN-käyttöönotto  
   **Odotettu tulos:** React-käyttöliittymä API-taustalla, automaattinen SSL, globaali CDN

### Keskitasoisille käyttäjille
4. **[Azure OpenAI Chat -sovellus](../../../examples/azure-openai-chat)** (Paikallinen) ⭐⭐  
   Ota käyttöön GPT-4 chat-käyttöliittymällä ja turvallisella API-avainten hallinnalla  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kuukausi  
   **Opit:** Azure OpenAI käyttöönotto, Key Vault -integraatio, tokenien seuranta  
   **Odotettu tulos:** Toimiva chat-sovellus GPT-4:llä ja kustannusseurannalla

5. **[Container App - Mikropalvelut](../../../examples/container-app/microservices)** (Paikallinen) ⭐⭐⭐⭐  
   Tuotantovalmiit monipalveluarkkitehtuurit  
   **Aika:** 45-60 minuuttia | **Kustannus:** $50-150/kuukausi  
   **Opit:** Palveluiden välinen viestintä, viestijonot, hajautettu jäljitys  
   **Odotettu tulos:** 2-palvelujärjestelmä (API Gateway + Tuotepalvelu) seurannalla

6. **[Tietokantasovellus - C# ja Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Verkkosovellus C# API:lla ja Azure SQL -tietokannalla  
   **Aika:** 30-45 minuuttia | **Kustannus:** $20-80/kuukausi  
   **Opit:** Entity Framework, tietokantamigraatiot, yhteysturvallisuus  
   **Odotettu tulos:** C# API Azure SQL -taustalla, automaattinen skeeman käyttöönotto

7. **[Palveluton funktio - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions HTTP-liipaisimilla ja Cosmos DB:llä  
   **Aika:** 30-40 minuuttia | **Kustannus:** $10-40/kuukausi  
   **Opit:** Tapahtumapohjainen arkkitehtuuri, palveluton skaalaus, NoSQL-integraatio  
   **Odotettu tulos:** Funktiosovellus, joka vastaa HTTP-pyyntöihin Cosmos DB -tallennuksella

8. **[Mikropalvelut - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Monipalvelu Java-sovellus Container Appsilla ja API Gatewaylla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $80-200/kuukausi  
   **Opit:** Spring Boot -käyttöönotto, palveluverkko, kuormituksen tasapainotus  
   **Odotettu tulos:** Monipalvelu Java-järjestelmä palveluiden löytämisellä ja reitityksellä

### Azure AI Foundry -mallit

1. **[Azure OpenAI Chat App - Paikallinen esimerkki](../../../examples/azure-openai-chat)** ⭐⭐  
   Täydellinen GPT-4 käyttöönotto chat-käyttöliittymällä  
   **Aika:** 35-45 minuuttia | **Kustannus:** $50-200/kuukausi  
   **Odotettu tulos:** Toimiva chat-sovellus tokenien seurannalla ja kustannusseurannalla

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Älykäs chat-sovellus RAG-arkkitehtuurilla  
   **Aika:** 60-90 minuuttia | **Kustannus:** $100-300/kuukausi  
   **Odotettu tulos:** RAG-pohjainen chat-käyttöliittymä dokumenttihaulla ja viittauksilla

3. **[AI-dokumenttien käsittely](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumenttianalyysi Azure AI -palveluilla  
   **Aika:** 40-60 minuuttia | **Kustannus:** $20-80/kuukausi  
   **Odotettu tulos:** API, joka poimii tekstiä, taulukoita ja entiteettejä ladatuista dokumenteista

4. **[Koneoppimisen putki](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-työnkulku Azure Machine Learningilla  
   **Aika:** 2-3 tuntia | **Kustannus:** $150-500/kuukausi  
   **Odotettu tulos:** Automaattinen ML-putki koulutuksella, käyttöönotolla ja seurannalla

### Todelliset skenaariot

#### **Vähittäiskaupan monen agentin ratkaisu** 🆕
**[Täydellinen toteutusopas](./retail-scenario.md)**

Kattava, tuotantovalmiiksi toteutettu monen agentin asiakastukiratkaisu, joka esittelee yritystason AI-sovelluksen
- **Tuotantoinfrastruktuuri**: Monialueiset Azure OpenAI -asennukset, AI-haku, Container Apps ja kattava seuranta
- **Valmiiksi käyttöön otettava ARM-malli**: Yhden napsautuksen käyttöönotto useilla konfigurointitiloilla (Minimal/Standard/Premium)
- **Edistyneet ominaisuudet**: Red teaming -turvallisuusvalidaatio, agenttien arviointikehys, kustannusoptimointi ja vianetsintäoppaat
- **Todellinen liiketoimintayhteys**: Vähittäiskaupan asiakastuen käyttötapaus tiedostojen latauksilla, haun integroinnilla ja dynaamisella skaalauksella

**Teknologiat**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Monimutkaisuus**: ⭐⭐⭐⭐ (Edistynyt - Valmis yritystuotantoon)

**Täydellinen**: AI-kehittäjille, ratkaisusuunnittelijoille ja tiimeille, jotka rakentavat tuotantovalmiita monen agentin järjestelmiä

**Pikakäynnistys**: Ota koko ratkaisu käyttöön alle 30 minuutissa mukana tulevalla ARM-mallilla komennolla `./deploy.sh -g myResourceGroup`

## 📋 Käyttöohjeet

### Esivaatimukset

Ennen kuin suoritat esimerkin:
- ✅ Azure-tilaus, jossa on omistajan tai avustajan käyttöoikeudet
- ✅ Azure Developer CLI asennettuna ([Asennusohje](../docs/getting-started/installation.md))
- ✅ Docker Desktop käynnissä (konttiesimerkeille)
- ✅ Sopivat Azure-kvotat (tarkista esimerkkikohtaiset vaatimukset)

> **💰 Kustannusvaroitus:** Kaikki esimerkit luovat todellisia Azure-resursseja, jotka aiheuttavat kustannuksia. Katso yksittäisten README-tiedostojen kustannusarviot. Muista suorittaa `azd down`, kun olet valmis, välttääksesi jatkuvat kustannukset.

### Esimerkkien suorittaminen paikallisesti

1. **Kloonaa tai kopioi esimerkki**
   ```bash
   # Siirry haluttuun esimerkkiin
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
   # Aseta vaaditut muuttujat
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Ota käyttöön**
   ```bash
   # Ota käyttöön infrastruktuuri ja sovellus
   azd up
   ```

5. **Vahvista käyttöönotto**
   ```bash
   # Hae palvelupisteet
   azd env get-values
   
   # Testaa päätepiste (esimerkki)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Odotetut onnistumisen merkit:**
   - ✅ `azd up` suoritetaan ilman virheitä
   - ✅ Palvelupäätepiste palauttaa HTTP 200
   - ✅ Azure-portaalissa näkyy "Running"-tila
   - ✅ Application Insights vastaanottaa telemetriaa

> **⚠️ Ongelmia?** Katso [Yleiset ongelmat](../docs/troubleshooting/common-issues.md) käyttöönoton vianetsintään

### Esimerkkien mukauttaminen

Jokainen esimerkki sisältää:
- **README.md** - Yksityiskohtaiset asennus- ja mukautusohjeet
- **azure.yaml** - AZD-konfiguraatio kommentteineen
- **infra/** - Bicep-mallit parametri-selityksineen
- **src/** - Esimerkkisovelluskoodi
- **scripts/** - Apuskriptit yleisiin tehtäviin

## 🎯 Oppimistavoitteet

### Esimerkkiluokat

#### **Peruskäyttöönotot**
- Yksipalvelusovellukset
- Yksinkertaiset infrastruktuurimallit
- Peruskonfiguraation hallinta
- Kustannustehokkaat kehitysympäristöt

#### **Edistyneet skenaariot**
- Monipalveluarkkitehtuurit
- Monimutkaiset verkkomallit
- Tietokannan integrointimallit
- Turvallisuus- ja vaatimustenmukaisuusratkaisut

#### **Tuotantovalmiit mallit**
- Korkean saatavuuden konfiguraatiot
- Seuranta ja näkyvyys
- CI/CD-integraatio
- Katastrofipalautusratkaisut

## 📖 Esimerkkikuvaukset

### Yksinkertainen verkkosovellus - Node.js Express
**Teknologiat**: Node.js, Express, MongoDB, Container Apps  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Peruskäyttöönotto, REST API, NoSQL-tietokannan integrointi

### Staattinen verkkosivusto - React SPA
**Teknologiat**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Staattinen hosting, serverless-taustajärjestelmä, moderni verkkokehitys

### Container App - Python Flask
**Teknologiat**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Konttien käyttö, REST API, scale-to-zero, terveysprobet, seuranta  
**Sijainti**: [Paikallinen esimerkki](../../../examples/container-app/simple-flask-api)

### Container App - Mikroservices-arkkitehtuuri
**Teknologiat**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Monimutkaisuus**: Edistynyt  
**Konseptit**: Monipalveluarkkitehtuuri, palveluiden välinen viestintä, viestijonot, hajautettu jäljitys  
**Sijainti**: [Paikallinen esimerkki](../../../examples/container-app/microservices)

### Tietokantasovellus - C# ja Azure SQL
**Teknologiat**: C# ASP.NET Core, Azure SQL Database, App Service  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Entity Framework, tietokantayhteydet, web API -kehitys

### Serverless-toiminto - Python Azure Functions
**Teknologiat**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Tapahtumapohjainen arkkitehtuuri, serverless-laskenta, full-stack-kehitys

### Mikroservices - Java Spring Boot
**Teknologiat**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Mikroservices-viestintä, hajautetut järjestelmät, yritysmallit

### Azure AI Foundry -esimerkit

#### Azure OpenAI Chat App
**Teknologiat**: Azure OpenAI, Cognitive Search, App Service  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: RAG-arkkitehtuuri, vektorihaku, LLM-integraatio

#### AI-dokumenttien käsittely
**Teknologiat**: Azure AI Document Intelligence, Storage, Functions  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Dokumenttianalyysi, OCR, tiedon poiminta

#### Koneoppimisen putkisto
**Teknologiat**: Azure ML, MLOps, Container Registry  
**Monimutkaisuus**: Edistynyt  
**Konseptit**: Mallin koulutus, käyttöönoton putkistot, seuranta

## 🛠 Konfiguraatioesimerkit

Hakemisto `configurations/` sisältää uudelleenkäytettäviä komponentteja:

### Ympäristökonfiguraatiot
- Kehitysympäristön asetukset
- Välivaiheen ympäristön konfiguraatiot
- Tuotantovalmiit konfiguraatiot
- Monialueiset käyttöönotot

### Bicep-moduulit
- Uudelleenkäytettävät infrastruktuurikomponentit
- Yleiset resurssimallit
- Turvallisuutta parantavat mallit
- Kustannuksia optimoivat konfiguraatiot

### Apuskriptit
- Ympäristön asennusautomaatio
- Tietokannan migraatioskriptit
- Käyttöönoton validointityökalut
- Kustannusseurantatyökalut

## 🔧 Mukautusopas

### Esimerkkien mukauttaminen omaan käyttötapaukseen

1. **Tarkista esivaatimukset**
   - Tarkista Azure-palveluvaatimukset
   - Vahvista tilausrajat
   - Ymmärrä kustannusvaikutukset

2. **Muokkaa konfiguraatiota**
   - Päivitä `azure.yaml` palvelumääritelmät
   - Mukauta Bicep-mallit
   - Säädä ympäristömuuttujat

3. **Testaa perusteellisesti**
   - Ota ensin käyttöön kehitysympäristössä
   - Vahvista toiminnallisuus
   - Testaa skaalautuvuus ja suorituskyky

4. **Turvallisuuskatsaus**
   - Tarkista käyttöoikeudet
   - Toteuta salaisuuksien hallinta
   - Ota käyttöön seuranta ja hälytykset

## 📊 Vertailutaulukko

| Esimerkki | Palvelut | Tietokanta | Autentikointi | Seuranta | Monimutkaisuus |
|-----------|----------|------------|---------------|----------|----------------|
| **Azure OpenAI Chat** (Paikallinen) | 2 | ❌ | Key Vault | Täysi | ⭐⭐ |
| **Python Flask API** (Paikallinen) | 1 | ❌ | Perus | Täysi | ⭐ |
| **Mikroservices** (Paikallinen) | 5+ | ✅ | Yritys | Edistynyt | ⭐⭐⭐⭐ |
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

1. **Aloita yksinkertaisesta verkkosovelluksesta**
   - Opettele AZD:n peruskäsitteet
   - Ymmärrä käyttöönoton työnkulku
   - Harjoittele ympäristön hallintaa

2. **Kokeile staattista verkkosivustoa**
   - Tutki erilaisia hosting-vaihtoehtoja
   - Opettele CDN-integraatio
   - Ymmärrä DNS-konfiguraatio

3. **Siirry Container Appiin**
   - Opettele konttien peruskäsitteet
   - Ymmärrä skaalautuvuuden käsitteet
   - Harjoittele Dockerin käyttöä

4. **Lisää tietokannan integrointi**
   - Opettele tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutki serverless-ratkaisuja**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opettele triggereiden ja sidosten käyttö
   - Harjoittele API:iden kanssa

6. **Rakenna mikroservices-arkkitehtuuri**
   - Opettele palveluiden välinen viestintä
   - Ymmärrä hajautetut järjestelmät
   - Harjoittele monimutkaisia käyttöönottoja

## 🔍 Oikean esimerkin löytäminen

### Teknologiapinon mukaan
- **Container Apps**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), [Mikroservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Mikroservices API Gateway (Paikallinen)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), [Mikroservices Product Service (Paikallinen)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Mikroservices Order Service (Paikallinen)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Mikroservices User Service (Paikallinen)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontit**: [Python Flask (Paikallinen)](../../../examples/container-app/simple-flask-api), [Mikroservices (Paikallinen)](../../../examples/container-app/microservices), Java Microservices
- **Tietokannat**: [Mikroservices (Paikallinen)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Monen agentin järjestelmät**: **Retail Multi-Agent Solution**
- **OpenAI-integraatio**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Yritystuotanto**: [Mikroservices (Paikallinen)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Arkkitehtuurimallin mukaan
- **Yksinkertainen REST API**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api)
- **Monoliittinen**: Node.js Express Todo, C# Web API + SQL
- **Staattinen + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservices**: [Tuotantomikroservices (Paikallinen)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Kontitettu**: [Python Flask (Paikallinen)](../../../examples/container-app/simple-flask-api), [Mikroservices (Paikallinen)](../../../examples/container-app/microservices)
- **AI-pohjainen**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Monen agentin arkkitehtuuri**: **Retail Multi-Agent Solution**
- **Yrityksen monipalvelu**: [Mikroservices (Paikallinen)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Monimutkaisuuden tason mukaan
- **Aloittelija**: [Python Flask API (Paikallinen)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Keskitaso**: **[Azure OpenAI Chat (Paikallinen)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Edistynyt**: ML Pipeline
- **Yritystuotantovalmius**: [Mikroservices (Paikallinen)](../../../examples/container-app/microservices) (Monipalvelu viestijonoilla), **Retail Multi-Agent Solution** (Täydellinen monen agentin järjestelmä ARM-mallin käyttöönotolla)

## 📚 Lisäresurssit

### Dokumentaatiolinkit
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisön esimerkit
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-sovellus Node.js:llä ja PostgreSQL:llä](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-verkkosovellus C# API:lla](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps -työ](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java:lla](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parhaat käytännöt
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Esimerkkien jakaminen

Onko sinulla hyödyllinen esimerkki jaettavaksi? Otamme mielellämme vastaan kontribuutioita!

### Lähetysohjeet
1. Noudata vakiintunutta hakemistorakennetta
2. Sisällytä kattava README.md
3. Lisää kommentteja konfiguraatiotiedostoihin
4. Testaa huolellisesti ennen lähettämistä
5. Sisällytä kustannusarviot ja vaatimukset

### Esimerkkimallin rakenne
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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoasi, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisen konseptien päälle!

## 🚀 Valmis aloittamaan?

### Oppimispolkusi

1. **Täysin aloittelija?** → Aloita [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 min)
2. **Perustiedot AZD:stä?** → Kokeile [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 min)
3. **Rakennatko AI-sovelluksia?** → Aloita [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 min) tai tutustu [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, yli 2 tuntia)
4. **Tarvitsetko tietyn teknologiapinon?** → Käytä [Oikean esimerkin löytäminen](../../../examples) -osiota yllä

### Seuraavat askeleet

- ✅ Tarkista [Vaatimukset](../../../examples) yllä
- ✅ Valitse esimerkki, joka vastaa taitotasoasi (katso [Monimutkaisuuden luokitus](../../../examples))
- ✅ Lue esimerkin README huolellisesti ennen käyttöönottoa
- ✅ Aseta muistutus suorittaa `azd down` testauksen jälkeen
- ✅ Jaa kokemuksesi GitHub Issues- tai Discussions-osiossa

### Tarvitsetko apua?

- 📖 [FAQ](../resources/faq.md) - Yleisimmät kysymykset
- 🐛 [Vianetsintäopas](../docs/troubleshooting/common-issues.md) - Korjaa käyttöönotto-ongelmat
- 💬 [GitHub-keskustelut](https://github.com/microsoft/AZD-for-beginners/discussions) - Kysy yhteisöltä
- 📚 [Opiskelumateriaali](../resources/study-guide.md) - Vahvista oppimistasi

---

**Navigointi**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../README.md)
- **📖 Opiskelumateriaalit**: [Opiskelumateriaali](../resources/study-guide.md) | [Pikaopas](../resources/cheat-sheet.md) | [Sanasto](../resources/glossary.md)
- **🔧 Resurssit**: [FAQ](../resources/faq.md) | [Vianetsintä](../docs/troubleshooting/common-issues.md)

---

*Viimeksi päivitetty: marraskuu 2025 | [Ilmoita ongelmista](https://github.com/microsoft/AZD-for-beginners/issues) | [Osallistu esimerkkien luomiseen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->