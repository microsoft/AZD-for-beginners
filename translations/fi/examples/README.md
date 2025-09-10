<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:18:48+00:00",
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
- Soveltamaan konfiguraationhallintaa ja ympäristökohtaisia käyttöönoton strategioita
- Toteuttamaan monitorointi-, turvallisuus- ja skaalausmalleja käytännön yhteyksissä
- Kertymään kokemusta todellisten käyttöönottojen vianetsinnästä ja virheenkorjauksesta

## Oppimistulokset

Kun olet suorittanut nämä esimerkit, osaat:
- Ottaa käyttöön erilaisia sovellustyyppejä Azure Developer CLI:n avulla itsevarmasti
- Mukauttaa tarjottuja malleja omiin sovellusvaatimuksiisi
- Suunnitella ja toteuttaa räätälöityjä infrastruktuurimalleja Bicepin avulla
- Konfiguroida monimutkaisia monipalvelusovelluksia oikeilla riippuvuuksilla
- Soveltaa turvallisuus-, monitorointi- ja suorituskyvyn parhaita käytäntöjä todellisissa skenaarioissa
- Vianetsintää ja optimointia käytännön kokemuksen perusteella

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
1. **[Yksinkertainen verkkosovellus](../../../examples/simple-web-app)** - Ota käyttöön perus Node.js -verkkosovellus
2. **[Staattinen verkkosivusto](../../../examples/static-website)** - Isännöi staattista verkkosivustoa Azure Storagessa
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
- Monitorointi ja havainnointi
- CI/CD-integraatio
- Katastrofipalautusasetukset

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
- Kustannusten seurannan apuvälineet

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
   - Ota käyttöön monitorointi ja hälytykset

## 📊 Vertailutaulukko

| Esimerkki | Palvelut | Tietokanta | Autentikointi | Monitorointi | Monimutkaisuus |
|-----------|----------|------------|---------------|--------------|----------------|
| Yksinkertainen verkkosovellus | 1 | ❌ | Perus | Perus | ⭐ |
| Staattinen verkkosivusto | 1 | ❌ | ❌ | Perus | ⭐ |
| Konttisovellus | 1 | ❌ | Perus | Täysi | ⭐⭐ |
| Tietokantasovellus | 2 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| Serverless-toiminto | 3 | ✅ | Täysi | Täysi | ⭐⭐⭐ |
| Mikropalvelut | 5+ | ✅ | Täysi | Täysi | ⭐⭐⭐⭐ |

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
   - Opettele konttien perusasiat
   - Ymmärrä skaalauskonseptit
   - Harjoittele Dockerin käyttöä

4. **Lisää tietokantaintegraatio**
   - Opettele tietokannan provisiointi
   - Ymmärrä yhteysmerkkijonot
   - Harjoittele salaisuuksien hallintaa

5. **Tutki serverless-ratkaisuja**
   - Ymmärrä tapahtumapohjainen arkkitehtuuri
   - Opettele liipaisimet ja sidokset
   - Harjoittele API:iden käyttöä

6. **Rakenna mikropalveluja**
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
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep-dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisön esimerkit
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

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

**Vinkki**: Aloita yksinkertaisimmasta esimerkistä, joka vastaa teknologiapinoasi, ja etene vähitellen kohti monimutkaisempia skenaarioita. Jokainen esimerkki rakentuu edellisen oppien päälle!

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
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.