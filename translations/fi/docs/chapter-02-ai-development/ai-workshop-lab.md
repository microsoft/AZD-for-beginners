# AI-työpajan laboratorio: Tee AI-ratkaisusi AZD:llä tuotantovalmiiksi

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensisuuntainen kehitys
- **⬅️ Edellinen**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Seuraava**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Työpajan yleiskatsaus

Tämä käytännön harjoitusohjelma ohjaa kehittäjiä läpi prosessin, jossa olemassa oleva AI-malli muunnetaan ja otetaan käyttöön Azure Developer CLI:n (AZD) avulla. Opit keskeisiä tuotantovalmiita malleja AI-julkaisuja varten Microsoft Foundry -palveluiden avulla.

**Kesto:** 2–3 tuntia  
**Taso:** Keskitaso  
**Esivaatimukset:** Perustiedot Azuresta, tuntemus AI/ML-konsepteista

## 🎓 Oppimistavoitteet

Työpajan päättyessä osaat:
- ✅ Muuntaa olemassa olevan AI-sovelluksen käyttämään AZD-malleja
- ✅ Määrittää Microsoft Foundryn palvelut AZD:llä
- ✅ Toteuttaa turvallisen tunnistetietojen hallinnan AI-palveluille
- ✅ Julkaista tuotantovalmiita AI-sovelluksia valvonnan kanssa
- ✅ Vianmäärittää yleisiä AI-julkaisuongelmia

## Esivaatimukset

### Vaaditut työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (VS Code suositeltu)

### Azure-resurssit
- Azure-tilaus, jossa on contributor-oikeudet
- Pääsy Azure OpenAI -palveluihin (tai mahdollisuus pyytää pääsyä)
- Oikeudet resurssiryhmän luomiseen

### Tietovaatimukset
- Perusymmärrys Azure-palveluista
- Tuntemus komentorivikäyttöliittymistä
- Perus AI/ML -käsitteet (API:t, mallit, promptit)

## Labin valmistelu

### Vaihe 1: Ympäristön valmistelu

1. **Tarkista työkalujen asennukset:**
```bash
# Tarkista AZD:n asennus
azd version

# Tarkista Azure CLI
az --version

# Kirjaudu Azureen
az login
azd auth login
```

2. **Kloonaa työpajan repositorio:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: AZD:n rakenteen ymmärtäminen AI-sovelluksille

### AI-valmiin AZD-mallin anatomia

Tutustu keskeisiin tiedostoihin AI-valmiissa AZD-mallissa:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Azure OpenAI configuration
│       ├── search.bicep    # Cognitive Search setup
│       └── webapp.bicep    # Web app configuration
├── app/                    # Application code
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

### **Harjoitus 1.1: Tutki konfiguraatiota**

1. **Tutki azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mitä etsiä:**
- AI-komponenttien palvelumäärittelyt
- Ympäristömuuttujien kartoitukset
- Isäntäasetukset

2. **Tarkista main.bicep-infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Keskeiset AI-kuviot, jotka kannattaa tunnistaa:**
- Azure OpenAI -palvelun käyttöönotto
- Cognitive Search -integraatio
- Turvallinen avainten hallinta
- Verkkoturvallisuusasetukset

### **Keskustelun aihe:** Miksi nämä mallit ovat tärkeitä tekoälylle

- **Palveluiden riippuvuudet**: AI-sovellukset vaativat usein useita yhteensovitettuja palveluita
- **Turvallisuus**: API-avaimet ja päätepisteet tarvitsevat turvallisen hallinnan
- **Skaalautuvuus**: AI-kuormat vaativat erityisiä skaalausratkaisuja
- **Kustannusten hallinta**: AI-palvelut voivat olla kalliita, jos niitä ei ole konfiguroitu oikein

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
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Vaihe 2.2: Ota infrastruktuuri ja sovellus käyttöön

1. **Ota käyttöön AZD:llä:**
```bash
azd up
```

**Mitä tapahtuu `azd up`-komennon aikana:**
- ✅ Luo Azure OpenAI -palvelun
- ✅ Luo Cognitive Search -palvelun
- ✅ Määrittää App Servicen web-sovellukselle
- ✅ Määrittää verkon ja tietoturvan
- ✅ Julkaisee sovelluskoodin
- ✅ Ottaa käyttöön valvonnan ja lokituksen

2. **Seuraa käyttöönoton etenemistä** ja merkitse ylös luotavat resurssit.

### Vaihe 2.3: Varmista käyttöönotto

1. **Tarkista julkaistut resurssit:**
```bash
azd show
```

2. **Avaa julkaistu sovellus:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testaa AI-toiminnallisuus:**
   - Siirry web-sovellukseen
   - Kokeile esimerkkikyselyjä
   - Varmista, että AI-vastaukset toimivat

### **Harjoitus 2.1: Vianmäärityksen harjoittelu**

**Tilanne**: Julkaisu onnistui, mutta AI ei vastaa.

**Yleiset tarkistettavat ongelmat:**
1. **OpenAI API -avaimet**: Varmista, että ne on asetettu oikein
2. **Mallin saatavuus**: Tarkista, tukeeko alueesi mallia
3. **Verkkoyhteys**: Varmista, että palvelut voivat kommunikoida
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
azd env set AZURE_OPENAI_MODEL gpt-4

# Ota uudelleen käyttöön uudella kokoonpanolla
azd deploy
```

2. **Lisää lisä-AI-palveluita:**

Muokkaa `infra/main.bicep` lisätäksesi Document Intelligencein:

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

### **Harjoitus 3.1: Kustannusten optimointi**

**Haaste**: Määritä malli kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista, mitkä SKUt voidaan asettaa ilmaiseen/perustasoon
2. Määritä ympäristömuuttujat minimoidaksesi kustannukset
3. Ota käyttöön ja vertaa kustannuksia tuotantokokoonpanoon

**Ratkaisuvinkkejä:**
- Käytä F0 (ilmainen) tasoa Cognitive Servicesille, jos mahdollista
- Käytä Basic-tasoa Search Servicelle kehityksessä
- Harkitse Consumption-suunnitelman käyttöä Functions:lle

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Turvallinen tunnistetietojen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodaavat API-avaimia tai käyttävät epävarmaa tallennusta.

**AZD-ratkaisu**: Managed Identity + Key Vault -integraatio.

1. **Tarkista turvallisuusasetukset mallissasi:**
```bash
# Etsi Key Vaultin ja Managed Identityn määrityksiä
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että Managed Identity toimii:**
```bash
# Tarkista, onko web-sovelluksella oikea identiteettikonfiguraatio.
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkkoturvallisuus

1. **Ota yksityiset päätepisteet käyttöön** (jos eivät ole jo konfiguroitu):

Lisää bicep-malliisi:
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

1. **Määritä Application Insights:**
```bash
# Application Insights tulisi konfiguroida automaattisesti
# Tarkista konfiguraatio:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Määritä AI-kohtainen valvonta:**

Lisää mukautettuja metriikoita AI-toiminnoille:
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

### **Harjoitus 4.1: Turvallisuusauditointi**

**Tehtävä**: Tarkista käyttöönotto turvallisuuden parhaiden käytäntöjen mukaan.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Managed Identity käytössä palveluiden välisessä todennuksessa
- [ ] Key Vault tallentaa arkaluonteisen konfiguraation
- [ ] Verkkopääsy on oikein rajoitettu
- [ ] Valvonta ja lokitus ovat käytössä

## Moduuli 5: Muunna oma AI-sovelluksesi

### Vaihe 5.1: Arviointilomake

**Ennen sovelluksen muuntamista**, vastaa näihin kysymyksiin:

1. **Sovelluksen arkkitehtuuri:**
   - Mitä AI-palveluita sovelluksesi käyttää?
   - Millaisia laskentaresursseja se tarvitsee?
   - Tarvitseeko se tietokantaa?
   - Mitkä ovat palveluiden väliset riippuvuudet?

2. **Turvallisuusvaatimukset:**
   - Mitä arkaluontoista dataa sovellus käsittelee?
   - Mitä vaatimuksia sääntelyn/vaatimustenmukaisuuden osalta on?
   - Tarvitsetko yksityistä verkkoa?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuormitus?
   - Tarvitsetko automaattisen skaalaamisen?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo AZD-mallisi

**Noudata tätä mallia sovelluksen muuntamiseksi:**

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

**infra/main.bicep** - Päämalli:
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

### **Harjoitus 5.1: Mallin luontihaaste**

**Haaste**: Luo AZD-malli asiakirjojen käsittelyä tekevälle AI-sovellukselle.

**Vaatimukset:**
- Azure OpenAI sisällön analysointiin
- Document Intelligence OCR:ää varten
- Storage Account asiakirjojen latauksia varten
- Function App käsittelylogiikkaa varten
- Web-sovellus käyttöliittymää varten

**Lisäpisteitä:**
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Perusta valvontapaneelit

## Moduuli 6: Yleisten ongelmien vianetsintä

### Yleiset käyttöönotto-ongelmat

#### Ongelma 1: OpenAI-palvelun kiintiö ylitetty
**Oireet:** Käyttöönotto epäonnistuu kiintiövirheen takia
**Ratkaisut:**
```bash
# Tarkista nykyiset kiintiöt
az cognitiveservices usage list --location eastus

# Pyydä kiintiön korotusta tai kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up
```

#### Ongelma 2: Malli ei ole saatavilla alueella
**Oireet:** AI-vastaukset epäonnistuvat tai mallin käyttöönotto antaa virheitä
**Ratkaisut:**
```bash
# Tarkista mallin saatavuus alueittain
az cognitiveservices model list --location eastus

# Päivitä saatavilla olevaan malliin
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Ongelma 3: Oikeusongelmat
**Oireet:** 403 Forbidden -virheitä kutsuttaessa AI-palveluita
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

#### Ongelma 4: Hitaat AI-vastaukset
**Tutkimusvaiheet:**
1. Tarkista Application Insights suorituskykymetriikoista
2. Tarkastele OpenAI-palvelun metrikkoja Azure-portaalissa
3. Varmista verkkoyhteys ja viive

**Ratkaisut:**
- Ota välimuisti käyttöön yleisille kyselyille
- Käytä sovelluksellesi sopivaa OpenAI-mallia
- Harkitse read-replicoja korkean kuormituksen tilanteissa

### **Harjoitus 6.1: Vianetsintähaaste**

**Tilanne**: Julkaisu onnistui, mutta sovellus palauttaa 500-virheitä.

**Vianetsintätehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluiden yhteydet
3. Testaa todennus
4. Tarkista konfiguraatio

**Käytettävät työkalut:**
- `azd show` käyttöönoton yleiskatsaukseen
- Azure-portaali yksityiskohtaisten palvelulokitietojen tarkasteluun
- Application Insights sovellustelemetriaa varten

## Moduuli 7: Valvonta ja optimointi

### Vaihe 7.1: Ota käyttöön kattava valvonta

1. **Luo mukautettuja kojelautoja:**

Siirry Azure-portaaliin ja luo kojelauta, jossa on:
- OpenAI-pyyntöjen määrä ja latenssi
- Sovelluksen virheprosentit
- Resurssien käyttöaste
- Kustannusten seuranta

2. **Määritä hälytykset:**
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
# Käytä Azure CLI:tä saadaksesi kustannustiedot.
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ota käyttöön kustannusvalvonta:**
- Määritä budjetti-ilmoituksia
- Käytä automaattisen skaalaamisen sääntöjä
- Ota pyyntöjen välimuisti käyttöön
- Seuraa tokenien käyttöä OpenAI:ssä

### **Harjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Metrikit parannettaviksi:**
- Vähennä keskimääräistä vasteaikaa 20 %:lla
- Vähennä kuukausikustannuksia 15 %:lla
- Säilytä 99,9 % käyttöaika

**Kokeiltavat strategiat:**
- Ota vasteiden välimuisti käyttöön
- Optimoi promptit tokenien tehokkuuden vuoksi
- Käytä sopivia laskenta-SKUja
- Määritä asianmukainen automaattinen skaalaus

## Lopullinen haaste: Päästä päähän toteutus

### Haasteen tilannekuva

Tehtävänasi on luoda tuotantovalmiiksi tarkoitettu AI-pohjainen asiakaspalveluchatbot, jonka vaatimukset ovat:

**Toiminnalliset vaatimukset:**
- Web-käyttöliittymä asiakasvuorovaikutukseen
- Integraatio Azure OpenAI:n kanssa vastauksia varten
- Asiakirjahaku Cognitive Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielinen tuki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 yhtäaikaista käyttäjää
- 99,9 % käyttöaikatakuu (SLA)
- SOC 2 -vaatimustenmukaisuus
- Kustannus alle $500/kuukausi
- Julkaise useisiin ympäristöihin (dev, staging, prod)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-malli**
3. **Toteuta turvallisuustoimenpiteet**
4. **Määritä valvonta ja hälytykset**
5. **Luo julkaisuputket**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt otettu käyttöön?
- ✅ **Skaalautuvuus**: Kestääkö se kuorman?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin organisoitu?
- ✅ **Kustannukset**: Pysyykö se budjetissa?

## Lisäresurssit

### Microsoftin dokumentaatio
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Esimerkkimallit
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Yhteisöresurssit
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Valmistumistodistus
Onnittelut! Olet suorittanut AI Workshop Labin. Nyt sinun pitäisi pystyä:

- ✅ Muuntaa olemassa olevat AI-sovellukset AZD-templaatteiksi
- ✅ Ota tuotantovalmiit AI-sovellukset käyttöön
- ✅ Ota käyttöön AI-kuormitusten turvallisuuden parhaat käytännöt
- ✅ Valvoa ja optimoida AI-sovellusten suorituskykyä
- ✅ Tunnistaa ja korjata yleisiä käyttöönotto-ongelmia

### Seuraavat askeleet
1. Sovella näitä malleja omiin AI-projekteihisi
2. Lahjoita mallipohjia yhteisölle
3. Liity Microsoft Foundryn Discordiin saadaksesi jatkuvaa tukea
4. Tutki edistyneitä aiheita, kuten monialueisia käyttöönottoja

---

**Workshop Feedback**: Auta meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundry Discord #Azure -kanavalla](https://discord.gg/microsoft-azure).

---

**Lukujen navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensisuunnittelu
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Määritys](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustellaksesi AZD:stä ja AI-käyttöönotosta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattisissa käännöksissä saattaa olla virheitä tai epätarkkuuksia. Asiakirjan alkuperäistä versiota sen alkuperäisellä kielellä tulee pitää virallisena lähteenä. Kriittistä tietoa varten suosittelemme ammattimaista ihmiskäännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virheellisistä tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->