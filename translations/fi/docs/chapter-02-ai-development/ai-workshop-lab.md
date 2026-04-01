# AI-työpaja: Tee AI-ratkaisusi asennettaviksi AZD:llä

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 – AI-ensijainen kehitys
- **⬅️ Edellinen**: [AI-mallien käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Työpajan yleiskatsaus

Tämä käytännön lab-opas ohjaa kehittäjiä ottamaan olemassa olevan AI-templaatin ja käyttöönoton Azure Developer CLI:llä (AZD). Opit keskeisiä tuotantovalmiita AI-käyttöönoton malleja käyttäen Microsoft Foundry -palveluita.

> **Tarkistusmuistio (2026-03-25):** Tämä työpaja tarkistettiin `azd` `1.23.12` -versiota vastaan. Jos paikallinen asennuksesi on vanhempi, päivitä AZD ennen aloittamista, jotta todennus-, templaatti- ja käyttöönotto-työnkulku vastaavat alla olevia vaiheita.

**Kesto:** 2-3 hours  
**Taso:** Keskitaso  
**Esivaatimukset:** Perustiedot Azuren käytöstä, tuntemus AI/ML-käsitteistä

## 🎓 Oppimistavoitteet

Kurssin lopussa osaat:
- ✅ Muuttaa olemassa olevan AI-sovelluksen käyttämään AZD-templaatteja
- ✅ Konfiguroida Microsoft Foundry -palveluita AZD:llä
- ✅ Toteuttaa turvallisen tunnistetietojen hallinnan AI-palveluille
- ✅ Ota käyttöön tuotantovalmiit AI-sovellukset valvonnalla
- ✅ Vianetsinnän yleisimmissä AI-käyttöönoton ongelmissa

## Esivaatimukset

### Vaadittavat työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (VS Code suositeltu)

### Azure-resurssit
- Azure-tilaus, jossa on contributor-oikeudet
- Pääsy Microsoft Foundry Models -palveluihin (tai mahdollisuus pyytää pääsy)
- Oikeudet resurssiryhmän luontiin

### Tietovaatimukset
- Perustiedot Azure-palveluista
- Kokemus komentoriviliittymistä
- Perustason AI/ML-käsitteet (API:t, mallit, promptit)

## Labin asetukset

### Vaihe 1: Ympäristön valmistelu

1. **Varmista työkalujen asennukset:**
```bash
# Tarkista AZD:n asennus
azd version

# Tarkista Azure CLI
az --version

# Kirjaudu Azureen AZD-työnkulkuja varten
azd auth login

# Kirjaudu Azure CLI:hin vain, jos aiot suorittaa az-komentoja diagnostiikan aikana
az login
```

Jos työskentelet useiden tenanttien välillä tai tilauksesi ei tunnistu automaattisesti, yritä uudelleen komennolla `azd auth login --tenant-id <tenant-id>`.

2. **Kloonaa työpajan repositorio:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: Ymmärrä AZD-rakenne AI-sovelluksille

### AI-AZD-templaatin rakenne

Tutustu AI-valmiin AZD-templaatin keskeisiin tiedostoihin:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Lab-harjoitus 1.1: Tutki konfiguraatiota**

1. **Tarkastele azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mitä etsiä:**
- Palvelumäärittelyt AI-komponenteille
- Ympäristömuuttujien asetukset
- Isäntäasetukset

2. **Tarkastele main.bicep-infrastruktuuria:**
```bash
cat infra/main.bicep
```

**Keskeiset AI-kuviot tunnistettavaksi:**
- Microsoft Foundry Models -palvelun provisiointi
- Cognitive Search -integraatio
- Turvallinen avainten hallinta
- Verkkoturvallisuusasetukset

### **Keskustelun aihe:** Miksi nämä mallit ovat tärkeitä AI:lle

- **Palveluiden riippuvuudet**: AI-sovellukset vaativat usein useita yhteensopivia palveluita
- **Turvallisuus**: API-avaimet ja päätepisteet on hallittava turvallisesti
- **Skaalautuvuus**: AI-työkuormat vaativat erityisiä skaalautuvuusvaatimuksia
- **Kustannusten hallinta**: AI-palvelut voivat olla kalliita, jos niitä ei konfiguroida oikein

## Moduuli 2: Ota ensimmäinen AI-sovelluksesi käyttöön

### Vaihe 2.1: Alusta ympäristö

1. **Luo uusi AZD-ympäristö:**
```bash
azd env new myai-workshop
```

2. **Aseta vaaditut parametrit:**
```bash
# Aseta haluamasi Azure-alue
azd env set AZURE_LOCATION eastus

# Valinnainen: Aseta tietty OpenAI-malli
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Vaihe 2.2: Ota infrastruktuuri ja sovellus käyttöön

1. **Ota käyttöön AZD:llä:**
```bash
azd up
```

**Mitä tapahtuu `azd up` -komennon aikana:**
- ✅ Provisionoi Microsoft Foundry Models -palvelun
- ✅ Luo Cognitive Search -palvelun
- ✅ Ottaa käyttöön App Servicen web-sovellukselle
- ✅ Konfiguroi verkon ja turvallisuuden
- ✅ Ota sovelluskoodi käyttöön
- ✅ Ota käyttöön valvonta ja lokitus

2. **Seuraa käyttöönoton etenemistä** ja huomioi luotavat resurssit.

### Vaihe 2.3: Vahvista käyttöönotto

1. **Tarkista käyttöönotetut resurssit:**
```bash
azd show
```

2. **Avaa otettu sovellus:**
```bash
azd show
```

Avaa `azd show` -tulosteessa näkyvä verkkopäätepiste.

3. **Testaa AI-toiminnallisuutta:**
   - Siirry web-sovellukseen
   - Kokeile esimerkkikyselyjä
   - Varmista, että AI-vastaukset toimivat

### **Lab-harjoitus 2.1: Vianetsintäharjoitus**

**Tilanne**: Käyttöönotto onnistui, mutta AI ei vastaa.

**Yleisimmät tarkistettavat asiat:**
1. **OpenAI API -avaimet**: Varmista, että ne on asetettu oikein
2. **Mallin saatavuus**: Tarkista, tukeeko alueesi mallia
3. **Verkkoyhteydet**: Varmista, että palvelut voivat kommunikoida keskenään
4. **RBAC-oikeudet**: Varmista, että sovellus pääsee OpenAI:hin

**Vianetsintäkomennot:**
```bash
# Tarkista ympäristömuuttujat
azd env get-values

# Näytä käyttöönoton lokit
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Tarkista OpenAI:n käyttöönoton tila
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduuli 3: Mukauta AI-sovelluksia tarpeidesi mukaan

### Vaihe 3.1: Muokkaa AI-konfiguraatiota

1. **Päivitä OpenAI-malli:**
```bash
# Vaihda toiseen malliin (jos saatavilla alueellasi)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ota uudelleen käyttöön uudella kokoonpanolla
azd deploy
```

2. **Lisää lisä-AI-palveluja:**

Muokkaa `infra/main.bicep` lisätäksesi Document Intelligence:

```bicep
// Add to main.bicep
resource documentIntelligence 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: 'doc-intel-${uniqueString(resourceGroup().id)}'
  location: location
  kind: 'FormRecognizer'
  sku: {
    name: 'F0'  // Free tier for workshop
  }
  properties: {
    customSubDomainName: 'doc-intel-${uniqueString(resourceGroup().id)}'
  }
}
```

### Vaihe 3.2: Ympäristökohtaiset asetukset

**Parhaat käytännöt**: Eri asetukset kehitykseen ja tuotantoon.

1. **Luo tuotantoympäristö:**
```bash
azd env new myai-production
```

2. **Aseta tuotantokohtaiset parametrit:**
```bash
# Tuotannossa käytetään tyypillisesti korkeamman tason SKUja
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ota käyttöön lisäturvaominaisuudet
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab-harjoitus 3.1: Kustannusten optimointi**

**Haaste**: Konfiguroi templaatti kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista, mitkä SKU:t voidaan asettaa ilmaisille/perus-tasoille
2. Konfiguroi ympäristömuuttujat minimoidaksesi kustannukset
3. Ota käyttöön ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuviitteet:**
- Käytä F0 (ilmainen) tasoa Cognitive Servicesille, kun mahdollista
- Käytä Basic-tasoa Search-palvelulle kehityksessä
- Harkitse Consumption-suunnitelmaa Functionsille

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Turvallinen tunnistetietojen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodavat API-avaimia tai käyttävät epäluotettavaa tallennusta.

**AZD-ratkaisu**: Managed Identity + Key Vault -integraatio.

1. **Tarkastele turvallisuusasetuksia templaattissasi:**
```bash
# Etsi Key Vaultin ja hallitun identiteetin määrityksiä
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että Managed Identity toimii:**
```bash
# Tarkista, onko verkkosovelluksella oikea identiteetin määritys
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkkoturvallisuus

1. **Ota käyttöön yksityiset päätepisteet** (jos eivät ole jo konfiguroitu):

Lisää bicep-templaattiisi:
```bicep
// Private endpoint for OpenAI
resource openAIPrivateEndpoint 'Microsoft.Network/privateEndpoints@2023-04-01' = {
  name: 'pe-openai-${uniqueString(resourceGroup().id)}'
  location: location
  properties: {
    subnet: {
      id: vnet.properties.subnets[0].id
    }
    privateLinkServiceConnections: [
      {
        name: 'openai-connection'
        properties: {
          privateLinkServiceId: openAIAccount.id
          groupIds: ['account']
        }
      }
    ]
  }
}
```

### Vaihe 4.3: Valvonta ja havaittavuus

1. **Konfiguroi Application Insights:**
```bash
# Application Insights pitäisi konfiguroida automaattisesti
# Tarkista kokoonpano:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ota käyttöön AI-kohtainen valvonta:**

Lisää mukautettuja metriikoita AI-operaatioille:
```bicep
// In your web app configuration
resource webApp 'Microsoft.Web/sites@2023-01-01' = {
  properties: {
    siteConfig: {
      appSettings: [
        {
          name: 'APPLICATIONINSIGHTS_CONNECTION_STRING'
          value: applicationInsights.properties.ConnectionString
        }
        {
          name: 'OPENAI_MONITOR_ENABLED'
          value: 'true'
        }
      ]
    }
  }
}
```

### **Lab-harjoitus 4.1: Turvallisuusauditointi**

**Tehtävä**: Tarkista käyttöönotto turvallisuuden parhaiden käytäntöjen mukaisesti.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Managed Identity käytössä palveluiden välisessä todennuksessa
- [ ] Key Vault tallentaa arkaluonteiset asetukset
- [ ] Verkkoyhteydet on rajoitettu asianmukaisesti
- [ ] Valvonta ja lokitus ovat käytössä

## Moduuli 5: Muunna oma AI-sovelluksesi

### Vaihe 5.1: Arviointilomake

**Ennen sovelluksen muuntamista**, vastaa näihin kysymyksiin:

1. **Sovelluksen arkkitehtuuri:**
   - Mitä AI-palveluita sovelluksesi käyttää?
   - Mitä laskentaresursseja se tarvitsee?
   - Tarvitseeko se tietokantaa?
   - Mitkä ovat palveluiden riippuvuudet?

2. **Turvallisuusvaatimukset:**
   - Mitä arkaluonteista dataa sovelluksesi käsittelee?
   - Mitkä ovat vaatimukset vaatimustenmukaisuudelle?
   - Tarvitsetko yksityistä verkottamista?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuorma?
   - Tarvitsetko automaattisen skaalauksen?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo AZD-templaattisi

**Noudata tätä kaavaa muuntaaksesi sovelluksesi:**

1. **Luo perusrakenne:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Alusta AZD-malli
azd init --template minimal
```

2. **Luo azure.yaml:**
```yaml
# Metadata
name: my-ai-app
metadata:
  template: my-ai-app-template@0.0.1-beta

# Services definition
services:
  api:
    project: ./api
    host: containerapp
  web:
    project: ./web
    host: staticwebapp
    
# Hooks for custom deployment logic  
hooks:
  predeploy:
    shell: sh
    run: echo "Preparing AI models..."
```

3. **Luo infrastruktuurimallit:**

**infra/main.bicep** - Päätemplaatti:
```bicep
@description('Primary location for all resources')
param location string = resourceGroup().location

@description('Name of the OpenAI service')
param openAIServiceName string = 'openai-${uniqueString(resourceGroup().id)}'

// Your AI services here
module openAI 'modules/openai.bicep' = {
  name: 'openai'
  params: {
    name: openAIServiceName
    location: location
  }
}
```

**infra/modules/openai.bicep** - OpenAI-moduuli:
```bicep
@description('Name of the OpenAI service')
param name string

@description('Location for the OpenAI service')
param location string

resource openAIAccount 'Microsoft.CognitiveServices/accounts@2023-05-01' = {
  name: name
  location: location
  kind: 'OpenAI'
  sku: {
    name: 'S0'
  }
  properties: {
    customSubDomainName: name
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Lab-harjoitus 5.1: Templaatin luomishaaste**

**Haaste**: Luo AZD-templaatti dokumenttien käsittelyyn tarkoitetulle AI-sovellukselle.

**Vaatimukset:**
- Microsoft Foundry Models sisällön analysointiin
- Document Intelligence OCR:ää varten
- Storage Account dokumenttien latauksille
- Function App käsittelylogiikalle
- Web-sovellus käyttöliittymälle

**Lisäpisteitä:**
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Ota käyttöön valvontapaneelit

## Moduuli 6: Yleisten ongelmien vianetsintä

### Yleiset käyttöönotto-ongelmat

#### Ongelma 1: OpenAI-palvelun kvotan ylitys
**Oireet:** Käyttöönotto epäonnistuu kvottivirheen vuoksi
**Ratkaisut:**
```bash
# Tarkista nykyiset kiintiöt
az cognitiveservices usage list --location eastus

# Pyydä kiintiön korotusta tai kokeile toista aluetta
azd env set AZURE_LOCATION westus2
azd up
```

#### Ongelma 2: Malli ei ole saatavilla alueella
**Oireet:** AI-vastaukset epäonnistuvat tai mallin käyttöönotto epäonnistuu
**Ratkaisut:**
```bash
# Tarkista mallin saatavuus alueittain
az cognitiveservices model list --location eastus

# Päivitä saatavilla olevaan malliin
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Ongelma 3: Käyttöoikeusongelmat
**Oireet:** 403 Forbidden -virheitä AI-palvelujen kutsuissa
**Ratkaisut:**
```bash
# Tarkista roolien määritykset
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Lisää puuttuvat roolit
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Suorituskykyongelmat

#### Ongelma 4: Hitaita AI-vastauksia
**Tutkimusvaiheet:**
1. Tarkista Application Insights suorituskykymetriikat
2. Tarkastele OpenAI-palvelun metriikoita Azure-portaalissa
3. Varmista verkkoyhteydet ja latenssi

**Ratkaisut:**
- Toteuta välimuisti yleisille kyselyille
- Käytä soveltuvaa OpenAI-mallia käyttötapaukseesi
- Harkitse luku-replikoita korkean kuorman tilanteissa

### **Lab-harjoitus 6.1: Vianetsintähaaste**

**Tilanne**: Käyttöönotto onnistui, mutta sovellus palauttaa 500-virheitä.

**Vianetsintätehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluyhteydet
3. Testaa todennus
4. Tarkista konfiguraatiot

**Käytettävät työkalut:**
- `azd show` käyttöönottotiivistelmän saamiseksi
- Azure-portaali yksityiskohtaisille palvelulokeille
- Application Insights sovellustelemetrialle

## Moduuli 7: Valvonta ja optimointi

### Vaihe 7.1: Ota käyttöön kattava valvonta

1. **Luo mukautetut kojelaudat:**

Siirry Azure-portaaliin ja luo kojelauta, joka sisältää:
- OpenAI-pyyntöjen määrä ja latenssi
- Sovelluksen virheprosentit
- Resurssien käyttöasteet
- Kustannusseuranta

2. **Ota hälytykset käyttöön:**
```bash
# Hälytys korkeasta virheprosentista
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Vaihe 7.2: Kustannusten optimointi

1. **Analysoi nykyiset kustannukset:**
```bash
# Hae kustannustiedot Azure CLI:llä
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ota kustannusvalvonta käyttöön:**
- Määritä budjettihälytykset
- Käytä autoskaalauspolitiikkoja
- Toteuta pyyntöjen välimuistitus
- Seuraa OpenAI-tokenien käyttöä

### **Lab-harjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Parannettavat metriikat:**
- Vähennä keskimääräistä vasteaikaa 20%
- Vähennä kuukausikustannuksia 15%
- Säilytä 99.9% käyttöaika

**Kokeiltavat strategiat:**
- Toteuta vastauksien välimuistitus
- Optimoi promptit token-tehokkuuden parantamiseksi
- Käytä soveltuvia compute-SKU:ja
- Määritä asianmukainen autoskaalaus

## Lopullinen haaste: End-to-End -toteutus

### Haasteen tilannekuva

Sinun tehtäväsi on luoda tuotantovalmiiksi valmis AI-pohjainen asiakaspalveluchatbot, joka täyttää seuraavat vaatimukset:

**Toiminnalliset vaatimukset:**
- Web-käyttöliittymä asiakaskohtaamisille
- Integraatio Microsoft Foundry Models -palveluun vastauksia varten
- Dokumenttihaku Cognitive Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielituki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 samanaikaista käyttäjää
- 99.9% käyttöaikatakuu (SLA)
- SOC 2 -vaatimustenmukaisuus
- Kustannus alle 500 $/kuukausi
- Ota käyttöön useisiin ympäristöihin (dev, staging, prod)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-templaatti**
3. **Toteuta turvallisuusratkaisut**
4. **Ota käyttöön valvonta ja hälytykset**
5. **Luo käyttöönotto-putket**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt toteutettu?
- ✅ **Skaalautuvuus**: Pystyykö se käsittelemään kuorman?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin organisoitu?
- ✅ **Kustannukset**: Pysyykö se budjetissa?

## Lisäresurssit

### Microsoftin dokumentaatio
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Esimerkkimallit
- [Microsoft Foundry Models -chat-sovellus](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App -pikaopas](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Yhteisön resurssit
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Upeat AZD-mallit](https://azure.github.io/awesome-azd/)

## 🎓 Suoritustodistus

Onnittelut! Olet suorittanut AI Workshop Labin. Nyt sinun pitäisi osata:

- ✅ Muuntaa olemassa olevat tekoälysovellukset AZD-malleiksi
- ✅ Ota käyttöön tuotantovalmiit tekoälysovellukset
- ✅ Toteuttaa turvallisuuden parhaat käytännöt tekoälykuormituksille
- ✅ Valvoa ja optimoida tekoälysovellusten suorituskykyä
- ✅ Ratkoa yleisiä käyttöönoton ongelmia

### Seuraavat askeleet
1. Sovella näitä malleja omiin tekoälyprojekteihisi
2. Lähetä malleja takaisin yhteisölle
3. Liity Microsoft Foundry Discord -kanavalle saadaksesi jatkuvaa tukea
4. Tutki edistyneitä aiheita, kuten monialueasennuksia

---

**Työpajapalautteet**: Auta meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundry Discord #Azure -kanavalla](https://discord.gg/microsoft-azure).

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Chapter 2 - AI-First Development
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon tekoälyn parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustelua AZD:stä ja tekoälykäyttöönotosta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on pidettävä ratkaisevana lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->