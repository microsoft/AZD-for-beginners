<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T06:39:31+00:00",
  "source_file": "examples/README.md",
  "language_code": "fi"
}
-->
# Esimerkit - Käytännön AZD-mallit ja konfiguraatiot

**Oppiminen esimerkkien avulla - Järjestetty luvuittain**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../README.md)
- **📖 Lukujaottelu**: Esimerkit järjestetty oppimisen vaikeustason mukaan
- **🚀 Aloita yksinkertaisesti**: [Luvun 1 esimerkit](../../../examples)
- **🤖 AI-esimerkit**: [Luvun 2 & 5 AI-ratkaisut](../../../examples)

## Johdanto

Tämä hakemisto sisältää käytännön esimerkkejä, malleja ja todellisia skenaarioita, jotka auttavat sinua oppimaan Azure Developer CLI:n käytön käytännön harjoittelun kautta. Jokainen esimerkki tarjoaa toimivan koodin, infrastruktuurimallit ja yksityiskohtaiset ohjeet eri sovellusarkkitehtuureille ja käyttöönoton malleille.

## Oppimistavoitteet

Näiden esimerkkien avulla voit:
- Harjoitella Azure Developer CLI -työnkulkuja realistisissa sovellusskenaarioissa
- Ymmärtää erilaisia sovellusarkkitehtuureja ja niiden azd-toteutuksia
- Hallita Infrastructure as Code -malleja eri Azure-palveluille
- Soveltaa konfiguraationhallintaa ja ympäristökohtaisia käyttöönoton strategioita
- Toteuttaa valvonta-, turvallisuus- ja skaalausmalleja käytännön yhteyksissä
- Kertoa kokemuksia vianmäärityksestä ja todellisten käyttöönottojen optimoinnista

## Oppimistulokset

Kun olet suorittanut nämä esimerkit, osaat:
- Ottaa käyttöön erilaisia sovellustyyppejä Azure Developer CLI:n avulla itsevarmasti
- Mukauttaa tarjottuja malleja omiin sovellusvaatimuksiisi
- Suunnitella ja toteuttaa räätälöityjä infrastruktuurimalleja Bicepin avulla
- Konfiguroida monimutkaisia monipalvelusovelluksia oikeilla riippuvuuksilla
- Soveltaa turvallisuus-, valvonta- ja suorituskyvyn parhaita käytäntöjä todellisissa skenaarioissa
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

## Nopeat aloitusesimerkit

### Aloittelijoille
1. **[Yksinkertainen verkkosovellus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Node.js Express -verkkosovelluksen käyttöönotto MongoDB:n kanssa
2. **[Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - React-pohjaisen staattisen verkkosivuston isännöinti Azure Static Web Appsilla
3. **[Konttisovellus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Kontitetun Python Flask -sovelluksen käyttöönotto

### Keskitasoisille käyttäjille
4. **[Tietokantasovellus - C# ja Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Verkkosovellus C# API:lla ja Azure SQL -tietokannalla
5. **[Palveluton funktio - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions HTTP-liipaisimilla ja Cosmos DB:llä
6. **[Mikropalvelut - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Monipalveluinen Java-sovellus Container Appsilla ja API-portilla

### Azure AI Foundry -mallit

1. **[Azure OpenAI Chat -sovellus](https://github.com/Azure-Samples/azure-search-openai-demo)** - Älykäs chat-sovellus Azure OpenAI:lla
2. **[AI-dokumenttien käsittely](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumenttianalyysi Azure AI -palveluiden avulla
3. **[Koneoppimisen putkisto](https://github.com/Azure-Samples/mlops-v2)** - MLOps-työnkulku Azure Machine Learningilla

### Todelliset skenaariot

#### **Vähittäiskaupan monitoimijärjestelmä** 🆕
**[Täydellinen toteutusopas](./retail-scenario.md)**

Kattava, tuotantovalmiin monitoimijärjestelmän asiakastukiratkaisu, joka esittelee yritystason AI-sovelluksen käyttöönottoa AZD:llä. Tämä skenaario tarjoaa:

- **Täydellinen arkkitehtuuri**: Monitoimijärjestelmä erikoistuneilla asiakaspalvelu- ja varastonhallinta-agenteilla
- **Tuotantoinfrastruktuuri**: Monialueiset Azure OpenAI -käyttöönotot, AI-haku, Container Apps ja kattava valvonta
- **Valmis ARM-malli**: Yhden napsautuksen käyttöönotto useilla konfiguraatiotiloilla (Minimal/Standard/Premium)
- **Edistyneet ominaisuudet**: Red teaming -turvallisuusvalidaatio, agenttien arviointikehys, kustannusoptimointi ja vianmääritysoppaat
- **Todellinen liiketoimintayhteys**: Vähittäiskaupan asiakastukitapaus tiedostojen latauksilla, hakutoiminnoilla ja dynaamisella skaalauksella

**Teknologiat**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Vaikeustaso**: ⭐⭐⭐⭐ (Edistynyt - Tuotantovalmius)

**Sopii täydellisesti**: AI-kehittäjille, ratkaisusuunnittelijoille ja tiimeille, jotka rakentavat tuotantovalmiita monitoimijärjestelmiä

**Nopea aloitus**: Ota koko ratkaisu käyttöön alle 30 minuutissa mukana tulevan ARM-mallin avulla `./deploy.sh -g myResourceGroup`

## 📋 Käyttöohjeet

### Esimerkkien suorittaminen paikallisesti

1. **Kloonaa tai kopioi esimerkki**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Alusta AZD-ympäristö**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfiguroi ympäristö**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Ota käyttöön**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Esimerkkien mukauttaminen

Jokainen esimerkki sisältää:
- **README.md** - Yksityiskohtaiset asennus- ja mukautusohjeet
- **azure.yaml** - AZD-konfiguraatio kommentteineen
- **infra/** - Bicep-mallit parametri-selityksineen
- **src/** - Esimerkkisovelluksen koodi
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
- Tietokantaintegraatiomallit
- Turvallisuus- ja vaatimustenmukaisuusratkaisut

#### **Tuotantovalmiit mallit**
- Korkean saatavuuden konfiguraatiot
- Valvonta ja näkyvyys
- CI/CD-integraatio
- Katastrofipalautusratkaisut

## 📖 Esimerkkikuvaukset

### Yksinkertainen verkkosovellus - Node.js Express
**Teknologiat**: Node.js, Express, MongoDB, Container Apps  
**Vaikeustaso**: Aloittelija  
**Konseptit**: Peruskäyttöönotto, REST API, NoSQL-tietokantaintegraatio

### Staattinen verkkosivusto - React SPA
**Teknologiat**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Vaikeustaso**: Aloittelija  
**Konseptit**: Staattinen isännöinti, palveluton taustajärjestelmä, moderni verkkokehitys

### Konttisovellus - Python Flask
**Teknologiat**: Python Flask, Docker, Container Apps, Container Registry  
**Vaikeustaso**: Aloittelija  
**Konseptit**: Kontitus, mikropalveluarkkitehtuuri, API-kehitys

### Tietokantasovellus - C# ja Azure SQL
**Teknologiat**: C# ASP.NET Core, Azure SQL Database, App Service  
**Vaikeustaso**: Keskitaso  
**Konseptit**: Entity Framework, tietokantayhteydet, verkkosovelluskehitys

### Palveluton funktio - Python Azure Functions
**Teknologiat**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Vaikeustaso**: Keskitaso  
**Konseptit**: Tapahtumapohjainen arkkitehtuuri, palveluton laskenta, full-stack-kehitys

### Mikropalvelut - Java Spring Boot
**Teknologiat**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Vaikeustaso**: Keskitaso  
**Konseptit**: Palveluiden välinen viestintä, hajautetut järjestelmät, yritysmallit

### Azure AI Foundry -esimerkit

#### Azure OpenAI Chat -sovellus
**Teknologiat**: Azure OpenAI, Cognitive Search, App Service  
**Vaikeustaso**: Keskitaso  
**Konseptit**: RAG-arkkitehtuuri, vektorihaku, LLM-integraatio

#### AI-dokumenttien käsittely
**Teknologiat**: Azure AI Document Intelligence, Storage, Functions  
**Vaikeustaso**: Keskitaso  
**Konseptit**: Dokumenttianalyysi, OCR, tiedon poiminta

#### Koneoppimisen putkisto
**Teknologiat**: Azure ML, MLOps, Container Registry  
**Vaikeustaso**: Edistynyt  
**Konseptit**: Mallin koulutus, käyttöönoton putkistot, valvonta

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
- Kustannusten seurantatyökalut

## 🔧 Mukautusopas

### Esimerkkien mukauttaminen omaan käyttötarkoitukseen

1. **Tarkista vaatimukset**
   - Tarkista Azure-palveluiden vaatimukset
   - Varmista tilauksen rajat
   - Ymmärrä kustannusvaikutukset

2. **Muokkaa konfiguraatiota**
   - Päivitä `azure.yaml` palvelumääritelmät
   - Mukauta Bicep-mallit
   - Säädä ympäristömuuttujat

3. **Testaa perusteellisesti**
   - Ota käyttöön ensin kehitysympäristössä
   - Varmista toiminnallisuus
   - Testaa skaalaus ja suorituskyky

4. **Turvallisuuskatsaus**
   - Tarkista käyttöoikeudet
   - Toteuta salaisuuksien hallinta
   - Ota käyttöön valvonta ja hälytykset

## 📊 Vertailutaulukko

| Esimerkki | Palvelut | Tietokanta | Autentikointi | Valvonta | Vaikeustaso |
|-----------|----------|------------|---------------|----------|-------------|
| Node.js Express Todo | 2 | ✅ | Perus | Perus | ⭐ |
| React SPA + Functions | 3 | ✅ | Perus | Täysi | ⭐ |
| Python Flask Container | 2 | ❌ | Perus | Täysi | ⭐ |
| C# Web API + SQL | 2 | ✅ | Täysi | Täysi | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Täysi | Täysi | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Täysi | Täysi | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Perus | Täysi | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Yritys** | **Edistynyt** | **⭐⭐⭐⭐** |

## 🎓 Oppimispolku

### Suositeltu eteneminen

1. **Aloita yksinkertaisella verkkosovelluksella**
   - Opettele AZD:n peruskäsitteet
   - Ymmärrä käyttöönoton työnkulku
   - Harjoittele ympäristön hallintaa

2. **Kokeile staattista verkkosivustoa**
   - Tutki erilaisia isännöintivaihtoehtoja
   - Opettele CDN-integraatio
   - Ymmärrä DNS-konfiguraatio

3. **Siirry konttisovellukseen**
   - Opettele kontituksen perusteet
   - Ymmärrä skaalauskonseptit
   - Harjoittele Dockerin käyttöä

4. **Lisää tietokantaintegraatio**
   - Opettele tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutustu palveluttomiin ratkaisuihin**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opettele liipaisimet ja sidokset
   - Harjoittele API:iden käyttöä

6. **Rakenna mikropalveluja**
   - Opettele palveluiden välinen viestintä
   - Ymmärrä hajautetut järjestelmät
   - Harjoittele monimutkaisia käyttöönottoja

## 🔍 Oikean esimerkin löytäminen

### Teknologiapinon mukaan
- **Node.js**: Node.js Express Todo -sovellus
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontit**: Python Flask Container App, Java Microservices
- **Tietokannat**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Monitoimijärjestelmät**: **Retail Multi-Agent Solution**
- **Yritystuotanto**: **Retail Multi-Agent Solution**

### Arkkitehtuurimallin mukaan
- **Monoliittinen**: Node.js Express Todo, C# Web API + SQL
- **Staattinen + palveluton**: React SPA + Functions, Python Functions + SPA
- **Mikropalvelut**: Java Spring Boot Microservices
- **Kontitetut**: Python Flask Container App
- **AI-pohjaiset**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Monitoimijärjestelmä**: **Retail Multi-Agent Solution**
- **Yrityksen monipalvelu**: **Retail Multi-Agent Solution**

### Vaikeustason mukaan
- **Aloittelija**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Keskitaso**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Edistynyt**: ML Pipeline
- **Yritystuotantovalmius**: **Retail Multi-Agent Solution** (Täydellinen monitoimijärjestelmä ARM-mallin käyttöönotolla)

## 📚 Lisäresurssit

### Dokumentaatiolinkit
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture
- [Todo-sovellus C#:llä ja Azure SQL:llä](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-sovellus Pythonilla ja MongoDB:llä](https://github.com/Azure-Samples/todo-python-mongo)
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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoasi, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisen esimerkin käsitteiden päälle!

**Seuraavat askeleet**: 
- Valitse esimerkki, joka vastaa taitotasoasi
- Noudata esimerkin README-tiedoston asennusohjeita
- Kokeile mukautuksia
- Jaa oppimasi yhteisön kanssa

---

**Navigointi**
- **Edellinen oppitunti**: [Opas](../resources/study-guide.md)
- **Palaa**: [Pääasiallinen README](../README.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.