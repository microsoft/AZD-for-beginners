<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:16:44+00:00",
  "source_file": "examples/README.md",
  "language_code": "fi"
}
-->
# Esimerkit - Käytännön AZD-mallit ja konfiguraatiot

## Johdanto

Tämä hakemisto sisältää käytännön esimerkkejä, malleja ja todellisia skenaarioita, jotka auttavat sinua oppimaan Azure Developer CLI:n käytännön harjoittelun kautta. Jokainen esimerkki tarjoaa täydellisen toimivan koodin, infrastruktuurimallit ja yksityiskohtaiset ohjeet eri sovellusarkkitehtuureille ja käyttöönoton malleille.

## Oppimistavoitteet

Työskennellessäsi näiden esimerkkien parissa opit:
- Harjoittelemaan Azure Developer CLI -työnkulkuja realistisissa sovellusskenaarioissa
- Ymmärtämään erilaisia sovellusarkkitehtuureja ja niiden azd-toteutuksia
- Hallitsemaan Infrastructure as Code -malleja eri Azure-palveluille
- Soveltamaan konfiguraation hallintaa ja ympäristökohtaisia käyttöönoton strategioita
- Toteuttamaan valvonta-, turvallisuus- ja skaalausmalleja käytännön yhteyksissä
- Kertymään kokemusta todellisten käyttöönottojen vianetsinnästä ja optimoinnista

## Oppimistulokset

Kun olet suorittanut nämä esimerkit, pystyt:
- Ottamaan käyttöön erilaisia sovellustyyppejä Azure Developer CLI:n avulla itsevarmasti
- Mukauttamaan tarjottuja malleja omien sovellusvaatimustesi mukaan
- Suunnittelemaan ja toteuttamaan räätälöityjä infrastruktuurimalleja Bicepin avulla
- Konfiguroimaan monimutkaisia monipalvelusovelluksia oikeilla riippuvuuksilla
- Soveltamaan turvallisuus-, valvonta- ja suorituskyvyn parhaita käytäntöjä todellisissa skenaarioissa
- Vianetsimään ja optimoimaan käyttöönottoja käytännön kokemuksen perusteella

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
1. **[Yksinkertainen verkkosovellus - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Ota käyttöön Node.js Express -verkkosovellus MongoDB:n kanssa
2. **[Staattinen verkkosivusto - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Isännöi React-pohjaista staattista verkkosivustoa Azure Static Web Appsilla
3. **[Konttisovellus - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Ota käyttöön konttimuotoinen Python Flask -sovellus

### Keskitasoisille käyttäjille
4. **[Tietokantasovellus - C# ja Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Verkkosovellus C# API:lla ja Azure SQL -tietokannalla
5. **[Palveluton funktio - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions HTTP-liipaisimilla ja Cosmos DB:llä
6. **[Mikropalvelut - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Monipalveluinen Java-sovellus Container Appsilla ja API-yhdyskäytävällä

### Azure AI Foundry -mallit

1. **[Azure OpenAI Chat -sovellus](https://github.com/Azure-Samples/azure-search-openai-demo)** - Älykäs chat-sovellus Azure OpenAI:lla
2. **[AI-dokumenttien käsittely](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumenttianalyysi Azure AI -palveluiden avulla
3. **[Koneoppimisen putkisto](https://github.com/Azure-Samples/mlops-v2)** - MLOps-työnkulku Azure Machine Learningilla

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
- Tietokantaintegraatiomallit
- Turvallisuus- ja vaatimustenmukaisuuden toteutukset

#### **Tuotantovalmiit mallit**
- Korkean saatavuuden konfiguraatiot
- Valvonta ja näkyvyys
- CI/CD-integraatio
- Katastrofipalautusasetukset

## 📖 Esimerkkien kuvaukset

### Yksinkertainen verkkosovellus - Node.js Express
**Teknologiat**: Node.js, Express, MongoDB, Container Apps  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Peruskäyttöönotto, REST API, NoSQL-tietokantaintegraatio

### Staattinen verkkosivusto - React SPA
**Teknologiat**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Staattinen isännöinti, palveluton taustajärjestelmä, moderni verkkokehitys

### Konttisovellus - Python Flask
**Teknologiat**: Python Flask, Docker, Container Apps, Container Registry  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Konttimuotoisuus, mikropalveluarkkitehtuuri, API-kehitys

### Tietokantasovellus - C# ja Azure SQL
**Teknologiat**: C# ASP.NET Core, Azure SQL Database, App Service  
**Monimutkaisuus**: Keskitasoinen  
**Konseptit**: Entity Framework, tietokantayhteydet, verkkosovelluskehitys

### Palveluton funktio - Python Azure Functions
**Teknologiat**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Monimutkaisuus**: Keskitasoinen  
**Konseptit**: Tapahtumapohjainen arkkitehtuuri, palveluton laskenta, full-stack-kehitys

### Mikropalvelut - Java Spring Boot
**Teknologiat**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Monimutkaisuus**: Keskitasoinen  
**Konseptit**: Mikropalveluiden kommunikointi, hajautetut järjestelmät, yritysmallit

### Azure AI Foundry -esimerkit

#### Azure OpenAI Chat -sovellus
**Teknologiat**: Azure OpenAI, Cognitive Search, App Service  
**Monimutkaisuus**: Keskitasoinen  
**Konseptit**: RAG-arkkitehtuuri, vektorihaku, LLM-integraatio

#### AI-dokumenttien käsittely
**Teknologiat**: Azure AI Document Intelligence, Storage, Functions  
**Monimutkaisuus**: Keskitasoinen  
**Konseptit**: Dokumenttianalyysi, OCR, tiedon poiminta

#### Koneoppimisen putkisto
**Teknologiat**: Azure ML, MLOps, Container Registry  
**Monimutkaisuus**: Edistynyt  
**Konseptit**: Mallin koulutus, käyttöönoton putkistot, valvonta

## 🛠 Konfiguraatioesimerkit

`configurations/`-hakemisto sisältää uudelleenkäytettäviä komponentteja:

### Ympäristökonfiguraatiot
- Kehitysympäristön asetukset
- Välivaiheen ympäristön konfiguraatiot
- Tuotantovalmiit konfiguraatiot
- Monialueiset käyttöönottoasetukset

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
   - Päivitä `azure.yaml`-palvelumääritelmät
   - Mukauta Bicep-mallit
   - Säädä ympäristömuuttujat

3. **Testaa perusteellisesti**
   - Ota ensin käyttöön kehitysympäristössä
   - Varmista toiminnallisuus
   - Testaa skaalausta ja suorituskykyä

4. **Turvallisuuskatsaus**
   - Tarkista käyttöoikeudet
   - Toteuta salaisuuksien hallinta
   - Ota käyttöön valvonta ja hälytykset

## 📊 Vertailutaulukko

| Esimerkki | Palvelut | Tietokanta | Autentikointi | Valvonta | Monimutkaisuus |
|-----------|----------|------------|---------------|----------|----------------|
| Node.js Express Todo | 2 | ✅ | Perus | Perus | ⭐ |
| React SPA + Functions | 3 | ✅ | Perus | Täysi | ⭐ |
| Python Flask Container | 2 | ❌ | Perus | Täysi | ⭐ |
| C# Web API + SQL | 2 | ✅ | Täysi | Täysi | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Täysi | Täysi | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Täysi | Täysi | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Perus | Täysi | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |

## 🎓 Oppimispolku

### Suositeltu eteneminen

1. **Aloita yksinkertaisesta verkkosovelluksesta**
   - Opettele perus AZD-konseptit
   - Ymmärrä käyttöönoton työnkulku
   - Harjoittele ympäristön hallintaa

2. **Kokeile staattista verkkosivustoa**
   - Tutki erilaisia isännöintivaihtoehtoja
   - Opettele CDN-integraatio
   - Ymmärrä DNS-konfiguraatio

3. **Siirry konttisovellukseen**
   - Opettele konttimuotoisuuden perusteet
   - Ymmärrä skaalauskonseptit
   - Harjoittele Dockerin käyttöä

4. **Lisää tietokantaintegraatio**
   - Opettele tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutki palvelutonta arkkitehtuuria**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opettele liipaisimet ja sidokset
   - Harjoittele API:iden käyttöä

6. **Rakenna mikropalveluita**
   - Opettele palveluiden välinen kommunikointi
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
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Arkkitehtuurimallin mukaan
- **Monoliittinen**: Node.js Express Todo, C# Web API + SQL
- **Staattinen + palveluton**: React SPA + Functions, Python Functions + SPA
- **Mikropalvelut**: Java Spring Boot Microservices
- **Konttimuotoinen**: Python Flask Container App
- **AI-pohjainen**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Monimutkaisuuden mukaan
- **Aloittelija**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Keskitasoinen**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Edistynyt**: ML Pipeline

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
- [Todo-sovellus C#:llä ja Azure SQL:llä](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-sovellus Pythonilla ja MongoDB:llä](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-sovellus Node.js:llä ja PostgreSQL:llä](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-verkkosovellus C# API:lla](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Parhaat käytännöt
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Esimerkkien kontribuointi

Onko sinulla hyödyllinen esimerkki jaettavaksi? Otamme mielellämme vastaan kontribuutioita!

### Lähetysohjeet
1. Noudata vakiintunutta hakemistorakennetta
2. Sisällytä kattava README.md
3. Lisää kommentteja konfiguraatiotiedostoihin
4. Testaa perusteellisesti ennen lähettämistä
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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoasi, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisen oppien päälle!

**Seuraavat askeleet**: 
- Valitse esimerkki, joka vastaa taitotasoasi
- Noudata esimerkin README:n asennusohjeita
- Kokeile mukautuksia
- Jaa oppimasi yhteisön kanssa

---

**Navigointi**
- **Edellinen oppitunti**: [Opintosuunnitelma](../resources/study-guide.md)
- **Palaa**: [Pää-README](../README.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.