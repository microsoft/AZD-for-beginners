<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T22:11:34+00:00",
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
- Soveltamaan konfiguraation hallintaa ja ympäristökohtaisia käyttöönotto-strategioita
- Toteuttamaan valvonta-, turvallisuus- ja skaalausmalleja käytännön yhteyksissä
- Kertymään kokemusta todellisten käyttöönottojen vianetsinnästä ja virheenkorjauksesta

## Oppimistulokset

Kun olet suorittanut nämä esimerkit, osaat:
- Ottaa käyttöön erilaisia sovellustyyppejä Azure Developer CLI:n avulla itsevarmasti
- Mukauttaa tarjottuja malleja omiin sovellusvaatimuksiisi
- Suunnitella ja toteuttaa räätälöityjä infrastruktuurimalleja Bicepin avulla
- Konfiguroida monimutkaisia monipalvelusovelluksia asianmukaisilla riippuvuuksilla
- Soveltaa turvallisuus-, valvonta- ja suorituskyvyn parhaita käytäntöjä todellisissa skenaarioissa
- Vianetsintä ja optimointi käyttöönottoja käytännön kokemuksen perusteella

## Hakemistorakenne

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Nopeat aloitusesimerkit

### Aloittelijoille
1. **[Yksinkertainen verkkosovellus](../../../examples/simple-web-app)** - Ota käyttöön perus Node.js-verkkosovellus
2. **[Staattinen verkkosivusto](../../../examples/static-website)** - Isännöi staattinen verkkosivusto Azure Storagessa
3. **[Konttisovellus](../../../examples/container-app)** - Ota käyttöön konttipohjainen sovellus

### Keskitasoisille käyttäjille
4. **[Tietokantasovellus](../../../examples/database-app)** - Verkkosovellus PostgreSQL-tietokannan kanssa
5. **[Serverless-toiminto](../../../examples/serverless-function)** - Azure Functions HTTP-liipaisimilla
6. **[Mikropalvelut](../../../examples/microservices)** - Monipalvelusovellus API-yhdyskäytävällä

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
- **src/** - Näytesovelluskoodi
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
- Valvonta ja havainnointi
- CI/CD-integraatio
- Katastrofipalautusratkaisut

## 📖 Esimerkkien kuvaukset

### Yksinkertainen verkkosovellus
**Teknologiat**: Node.js, App Service, Application Insights  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Peruskäyttöönotto, ympäristömuuttujat, terveystarkistukset

### Staattinen verkkosivusto
**Teknologiat**: HTML/CSS/JS, Storage Account, CDN  
**Monimutkaisuus**: Aloittelija  
**Konseptit**: Staattinen isännöinti, CDN-integraatio, mukautetut verkkotunnukset

### Konttisovellus
**Teknologiat**: Docker, Container Apps, Container Registry  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Konttien käyttö, skaalaus, ingress-konfiguraatio

### Tietokantasovellus
**Teknologiat**: Python Flask, PostgreSQL, App Service  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Tietokantayhteydet, salaisuuksien hallinta, migraatiot

### Serverless-toiminto
**Teknologiat**: Azure Functions, Cosmos DB, API Management  
**Monimutkaisuus**: Keskitaso  
**Konseptit**: Tapahtumapohjainen arkkitehtuuri, sidokset, API-hallinta

### Mikropalvelut
**Teknologiat**: Useita palveluita, Service Bus, API Gateway  
**Monimutkaisuus**: Edistynyt  
**Konseptit**: Palveluiden välinen viestintä, viestijonot, kuormituksen tasapainotus

## 🛠 Konfiguraatioesimerkit

`configurations/`-hakemisto sisältää uudelleenkäytettäviä komponentteja:

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
- Tietokantamigraatiot
- Käyttöönoton validointityökalut
- Kustannusten seurantatyökalut

## 🔧 Mukautusopas

### Esimerkkien mukauttaminen omaan käyttötapaukseesi

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

| Esimerkki | Palvelut | Tietokanta | Autentikointi | Valvonta | Monimutkaisuus |
|-----------|----------|------------|---------------|----------|----------------|
| Yksinkertainen verkkosovellus | 1 | ❌ | Perus | Perus | ⭐ |
| Staattinen verkkosivusto | 1 | ❌ | ❌ | Perus | ⭐ |
| Konttisovellus | 1 | ❌ | Perus | Täysi | ⭐⭐ |
| Tietokantasovellus | 2 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| Serverless-toiminto | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| Mikropalvelut | 5+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |

## 🎓 Oppimispolku

### Suositeltu eteneminen

1. **Aloita Yksinkertaisesta verkkosovelluksesta**
   - Opettele perus AZD-konseptit
   - Ymmärrä käyttöönoton työnkulku
   - Harjoittele ympäristön hallintaa

2. **Kokeile Staattista verkkosivustoa**
   - Tutki erilaisia isännöintivaihtoehtoja
   - Opettele CDN-integraatio
   - Ymmärrä DNS-konfiguraatio

3. **Siirry Konttisovellukseen**
   - Opettele konttien perusasiat
   - Ymmärrä skaalauskonseptit
   - Harjoittele Dockerin käyttöä

4. **Lisää Tietokantaintegraatio**
   - Opettele tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutki Serverless-toimintoja**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opettele liipaisimet ja sidokset
   - Harjoittele API:iden käyttöä

6. **Rakenna Mikropalvelut**
   - Opettele palveluiden välinen viestintä
   - Ymmärrä hajautetut järjestelmät
   - Harjoittele monimutkaisia käyttöönottoja

## 🔍 Oikean esimerkin löytäminen

### Teknologiapinon mukaan
- **Node.js**: Yksinkertainen verkkosovellus, Mikropalvelut
- **Python**: Tietokantasovellus, Serverless-toiminto
- **Staattiset sivustot**: Staattinen verkkosivusto
- **Kontit**: Konttisovellus, Mikropalvelut
- **Tietokannat**: Tietokantasovellus, Serverless-toiminto

### Arkkitehtuurimallin mukaan
- **Monoliittinen**: Yksinkertainen verkkosovellus, Tietokantasovellus
- **Staattinen**: Staattinen verkkosivusto
- **Mikropalvelut**: Mikropalvelut-esimerkki
- **Serverless**: Serverless-toiminto
- **Hybridimalli**: Konttisovellus

### Monimutkaisuuden mukaan
- **Aloittelija**: Yksinkertainen verkkosovellus, Staattinen verkkosivusto
- **Keskitaso**: Konttisovellus, Tietokantasovellus, Serverless-toiminto  
- **Edistynyt**: Mikropalvelut

## 📚 Lisäresurssit

### Dokumentaatiolinkit
- [AZD-mallien määrittely](https://aka.ms/azd/templates)
- [Bicep-dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure-arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisön esimerkit
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD-mallien galleria](https://azure.github.io/awesome-azd/)

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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoasi, ja etene vähitellen monimutkaisempiin skenaarioihin. Jokainen esimerkki rakentuu edellisen konseptien päälle!

**Seuraavat askeleet**: 
- Valitse esimerkki, joka vastaa taitotasoaasi
- Noudata esimerkin README:n asennusohjeita
- Kokeile mukautuksia
- Jaa oppimasi yhteisön kanssa

---

**Navigointi**
- **Edellinen oppitunti**: [Opas](../resources/study-guide.md)
- **Palaa**: [Pää-README](../README.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.