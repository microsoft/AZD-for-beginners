# AI-työpaja: Tee AI-ratkaisustasi AZD-asennuskelpoinen

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensijainen kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Työpajan yleiskatsaus

Tämä käytännön lab-opas ohjaa kehittäjiä prosessin läpi, jossa otetaan olemassa oleva AI-mallipohja ja otetaan se käyttöön Azure Developer CLI:n (AZD) avulla. Opit olennaiset mallit tuotantokelpoisiin AI-käyttöönottoihin käyttäen Microsoft Foundry -palveluita.

> **Vahvistusmuistio (2026-03-25):** Tämä työpaja tarkistettiin `azd` `1.23.12` -version mukaisesti. Jos paikallinen asennuksesi on vanhempi, päivitä AZD ennen aloittamista, jotta autentikointi-, template- ja käyttöönotto-työnkulku vastaavat alla olevia vaiheita.

**Kesto:** 2-3 tuntia  
**Taso:** Keskitaso  
**Vaatimukset:** Perustiedot Azuresta, tuntemus AI/ML-käsitteistä

## 🎓 Oppimistavoitteet

By the end of this workshop, you will be able to:
- ✅ Muuntaa olemassa olevan AI-sovelluksen käyttämään AZD-malleja
- ✅ Konfiguroida Microsoft Foundry -palvelut AZD:llä
- ✅ Toteuttaa turvallinen tunnistetietojen hallinta AI-palveluille
- ✅ Ota käyttöön tuotantovalmiit AI-sovellukset valvonnan kanssa
- ✅ Vianmääritys yleisille AI-käyttöönotto-ongelmille

## Esivaatimukset

### Vaadittavat työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (VS Code suositeltu)

### Azure-resurssit
- Azure-tilaus, jolla on osallistujan (Contributor) oikeudet
- Pääsy Microsoft Foundry Models -palveluihin (tai mahdollisuus pyytää pääsyä)
- Oikeudet resurssiryhmän luomiseen

### Tietovaatimukset
- Perustiedot Azure-palveluista
- Tuttu komentorivien käyttöön
- Perustiedot AI/ML-käsitteistä (API:t, mallit, kehotteet)

## Laboratorioasetukset

### Vaihe 1: Ympäristön valmistelu

1. **Tarkista työkalujen asennukset:**
```bash
# Tarkista AZD-asennus
azd version

# Tarkista Azure CLI
az --version

# Kirjaudu Azureen AZD-työnkulkuja varten
azd auth login

# Kirjaudu Azure CLI:hin vain, jos aiot suorittaa az-komentoja diagnostiikan aikana
az login
```

Jos työskentelet useiden tenanttien välillä tai tilauksesi ei tunnistu automaattisesti, kokeile uudelleen komennolla `azd auth login --tenant-id <tenant-id>`.

2. **Kloonaa työpajan repositorio:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: AZD-rakenteen ymmärtäminen AI-sovelluksille

### AI-AZD-mallipohjan rakenne

Tutustu tärkeisiin tiedostoihin AI-valmiissa AZD-mallipohjassa:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   └── modules/            # Reusable Bicep modules
│       ├── openai.bicep    # Microsoft Foundry Models configuration
│       ├── search.bicep    # Azure AI Search setup
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

**Mihin kiinnittää huomiota:**
- AI-komponenttien palvelumäärittelyt
- Ympäristömuuttujien kartoitukset
- Isäntäkonfiguraatiot

2. **Tarkista main.bicep-infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Tunnistettavat keskeiset AI-mallit:**
- Microsoft Foundry Models -palvelun provisiointi
- Azure AI Search -integraatio
- Turvallinen avainten hallinta
- Verkon suojausasetukset

### **Keskustelunaihe:** Miksi nämä mallit ovat tärkeitä AI-sovelluksille

- **Palvelurisiteet**: AI-sovellukset vaativat usein useita yhteensovitettuja palveluita
- **Suojaus**: API-avaimet ja päätepisteet tarvitsevat turvallista hallintaa
- **Skaalautuvuus**: AI-kuormilla on erityiset skaalausvaatimukset
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

**Mitä tapahtuu komennon `azd up` aikana:**
- ✅ Provisionoi Microsoft Foundry Models -palvelun
- ✅ Luo Azure AI Search -palvelun
- ✅ Määrittää App Servicen web-sovellukselle
- ✅ Konfiguroi verkon ja turvallisuuden
- ✅ Julkaisee sovelluskoodin
- ✅ Määrittää valvonnan ja lokituksen

2. **Valvo käyttöönoton etenemistä** ja kirjaa luotavat resurssit.

### Vaihe 2.3: Vahvista käyttöönotto

1. **Tarkista käyttöön otetut resurssit:**
```bash
azd show
```

2. **Avaa käyttöönotettu sovellus:**
```bash
azd show
```

Avaa web-päätepiste, joka näkyy `azd show` -komennon tulosteessa.

3. **Testaa AI-toiminnallisuutta:**
   - Siirry web-sovellukseen
   - Kokeile esimerkkikyselyjä
   - Varmista, että AI-vastaukset toimivat

### **Lab-harjoitus 2.1: Vianetsintäharjoitus**

**Tilanne**: Käyttöönotto onnistui, mutta AI ei vastaa.

**Yleisimmät tarkistettavat ongelmat:**
1. **OpenAI API -avaimet**: Varmista, että ne on asetettu oikein
2. **Mallin saatavuus**: Tarkista, tukeeko alueesi mallia
3. **Verkkoyhteydet**: Varmista, että palvelut voivat kommunikoida
4. **RBAC-oikeudet**: Varmista, että sovellus pääsee OpenAI:hin

**Vianmäärityskomennot:**
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

# Ota uudelleen käyttöön uusi konfiguraatio
azd deploy
```

2. **Lisää lisä-AI-palveluita:**

Muokkaa `infra/main.bicep`-tiedostoa lisätäksesi Document Intelligence:
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

### Vaihe 3.2: Ympäristökohtaiset konfiguraatiot

**Parhaat käytännöt**: Eri asetukset kehitykseen ja tuotantoon.

1. **Luo tuotantoympäristö:**
```bash
azd env new myai-production
```

2. **Aseta tuotantokohtaiset parametrit:**
```bash
# Tuotannossa käytetään yleensä korkeampia SKU-tasoja
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ota käyttöön lisätietoturvaominaisuudet
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab-harjoitus 3.1: Kustannusoptimointi**

**Haaste**: Konfiguroi mallipohja kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista, mitkä SKU:t voidaan asettaa ilmais- tai perustasoille
2. Konfiguroi ympäristömuuttujat minimoidaksesi kustannukset
3. Ota käyttöön ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuvihjeitä:**
- Käytä F0 (ilmainen) -tasoa Azure AI Services -palveluissa, kun mahdollista
- Käytä Basic-tasoa Search Service -palvelussa kehityksessä
- Harkitse Consumption-suunnitelmaa Functionsille

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Turvallinen tunnistetietojen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodavat API-avaimia tai käyttävät epävarmaa tallennusta.

**AZD-ratkaisu**: Managed Identity + Key Vault -integraatio.

1. **Tarkista suojauskonfiguraatio mallipohjassasi:**
```bash
# Etsi Key Vaultin ja hallinnoidun identiteetin määritykset
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että Managed Identity toimii:**
```bash
# Tarkista, ovatko verkkosovelluksen identiteettiasetukset oikein
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkon turvallisuus

1. **Ota yksityiset päätepisteet käyttöön** (jos ei ole jo konfiguroitu):

Lisää bicep-mallipohjaasi:
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
# Application Insights tulisi konfiguroida automaattisesti
# Tarkista asetukset:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ota käyttöön AI-kohtainen valvonta:**

Lisää mukautetut mittarit AI-toiminnoille:
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

### **Lab-harjoitus 4.1: Turvallisuustarkastus**

**Tehtävä**: Tarkista käyttöönotto turvallisuuden parhaiden käytäntöjen mukaan.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Managed Identity käytössä palveluiden välisessä autentikoinnissa
- [ ] Key Vault säilyttää arkaluonteiset asetukset
- [ ] Verkon pääsy on asianmukaisesti rajoitettu
- [ ] Valvonta ja lokitus ovat käytössä

## Moduuli 5: Muunna oma AI-sovelluksesi

### Vaihe 5.1: Arviointilomake

**Ennen sovelluksesi muuntamista**, vastaa näihin kysymyksiin:

1. **Sovelluksen arkkitehtuuri:**
   - Mitä AI-palveluita sovelluksesi käyttää?
   - Mitä laskentaresursseja se tarvitsee?
   - Tarvitseeko se tietokannan?
   - Mitkä ovat palveluiden väliset riippuvuudet?

2. **Turvallisuusvaatimukset:**
   - Millaisia arkaluonteisia tietoja sovelluksesi käsittelee?
   - Mitä vaatimuksia noudattamiselle (compliance) sinulla on?
   - Tarvitsetko yksityisverkon?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuormituksesi?
   - Tarvitsetko automaattisen skaalaamisen?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo AZD-mallipohjasi

**Noudata tätä kaaviota muuntaaksesi sovelluksesi:**

1. **Luo perusrakenne:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Alusta AZD-mallipohja
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

### **Lab-harjoitus 5.1: Mallipohjan luontihaaste**

**Haaste**: Luo AZD-mallipohja asiakirjakäsittelyä tekevälle AI-sovellukselle.

**Vaatimukset:**
- Microsoft Foundry Models sisällön analysointiin
- Document Intelligence OCR:ää varten
- Storage Account asiakirjalatauksia varten
- Function App käsittelylogiikalle
- Web-sovellus käyttöliittymää varten

**Lisäpisteitä:**
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Ota käyttöön valvontapaneelit

## Moduuli 6: Yleisten ongelmien vianetsintä

### Yleiset käyttöönotto-ongelmat

#### Ongelma 1: OpenAI-palvelun kiintiö ylittynyt
**Oireet:** Käyttöönotto epäonnistuu kiintiövirheen vuoksi
**Ratkaisut:**
```bash
# Tarkista nykyiset kiintiöt
az cognitiveservices usage list --location eastus

# Pyydä kiintiön korotusta tai kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up
```

#### Ongelma 2: Malli ei ole saatavilla alueella
**Oireet:** AI-vastaukset epäonnistuvat tai mallin käyttöönotossa esiintyy virheitä
**Ratkaisut:**
```bash
# Tarkista mallin saatavuus alueittain
az cognitiveservices model list --location eastus

# Päivitä saatavilla olevaan malliin
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Ongelma 3: Oikeusongelmat
**Oireet:** 403 Forbidden -virheitä AI-palveluita kutsuttaessa
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
1. Tarkista Application Insightsin suorituskykymittarit
2. Tarkastele OpenAI-palvelun mittareita Azure-portaalissa
3. Varmista verkkoyhteydet ja latenssi

**Ratkaisut:**
- Toteuta välimuisti yleisille kyselyille
- Käytä käyttötapaukseesi sopivaa OpenAI-mallia
- Harkitse read-replikoita korkean kuorman tilanteissa

### **Lab-harjoitus 6.1: Vianetsintähaaste**

**Tilanne**: Käyttöönotto onnistui, mutta sovellus palauttaa 500-virheitä.

**Vianetsintätehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluiden yhteydet
3. Testaa autentikointi
4. Tarkista konfiguraatio

**Käytettävät työkalut:**
- `azd show` käyttöönoton yleiskatsaukseen
- Azure-portaali yksityiskohtaisia palvelulokeja varten
- Application Insights sovellustelemetriaa varten

## Moduuli 7: Valvonta ja optimointi

### Vaihe 7.1: Ota käyttöön kattava valvonta

1. **Luo mukautetut kojelaudat:**

Siirry Azure-portaaliin ja luo kojelauta, joka sisältää:
- OpenAI-pyyntöjen määrä ja latenssi
- Sovelluksen virheiden prosenttiosuus
- Resurssien käyttöaste
- Kustannusseuranta

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

### Vaihe 7.2: Kustannusoptimointi

1. **Analysoi nykyiset kustannukset:**
```bash
# Käytä Azure CLI:tä saadaksesi kustannustiedot
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ota käyttöön kustannusvalvonta:**
- Määritä budjettihälytykset
- Käytä automaattisen skaalaamisen politiikkoja
- Toteuta pyyntöjen välimuistitus
- Seuraa OpenAI-tokenien käyttöä

### **Lab-harjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Parannettavat mittarit:**
- Vähennä keskimääräistä vasteaikaa 20 %:lla
- Vähennä kuukausikustannuksia 15 %:lla
- Säilytä 99,9 %:n käytettävyys

**Kokeiltavia strategioita:**
- Toteuta vastausten välimuisti
- Optimoi kehotteet tokenien käytön tehokkuudeksi
- Käytä sopivia laskenta-SKUja
- Määritä asianmukainen automaattinen skaalaus

## Loppuhaaste: Päästä päähän -toteutus

### Haasteen tilanne

Tehtäväsi on luoda tuotantovalmiiksi tarkoitettu AI-pohjainen asiakaspalveluchatbot, jolla on seuraavat vaatimukset:

**Toiminnalliset vaatimukset:**
- Web-käyttöliittymä asiakasvuorovaikutusta varten
- Integraatio Microsoft Foundry Models -palveluun vastauksia varten
- Asiakirjahaku Azure AI Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielinen tuki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 samanaikaista käyttäjää
- 99,9 % käytettävyystakuu (SLA)
- SOC 2 -yhteensopivuus
- Kustannus alle $500/kuukausi
- Ota käyttöön useisiin ympäristöihin (dev, staging, prod)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-mallipohja**
3. **Toteuta turvallisuustoimenpiteet**
4. **Ota käyttöön valvonta ja hälytykset**
5. **Luo käyttöönotto-putket**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt otettu käyttöön?
- ✅ **Skaalautuvuus**: Kestääkö se kuorman?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin järjestetty?
- ✅ **Kustannukset**: Pysyykö se budjetissa?

## Lisäresurssit

### Microsoftin dokumentaatio
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models -palvelun dokumentaatio](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry -dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

### Mallipohjat
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Yhteisön resurssit
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Suoritustodistus

Onneksi olkoon! Olet suorittanut AI-työpajan laboratorion. Sinun pitäisi nyt osata:

- ✅ Muuntaa olemassa olevat tekoälysovellukset AZD-malleiksi
- ✅ Ottaa käyttöön tuotantovalmiit tekoälysovellukset
- ✅ Toteuttaa tietoturvan parhaat käytännöt tekoälykuormille
- ✅ Valvoa ja optimoida tekoälysovellusten suorituskykyä
- ✅ Tunnistaa ja korjata yleisiä käyttöönotto-ongelmia

### Seuraavat askeleet
1. Sovella näitä malleja omiin tekoälyprojekteihisi
2. Lähetä malleja takaisin yhteisölle
3. Liity Microsoft Foundryn Discordiin jatkuvaa tukea varten
4. Tutki kehittyneitä aiheita, kuten monialueiset käyttöönotot

---

**Workshop Feedback**: Autathan meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundryn Discordin #Azure-kanavalla](https://discord.gg/microsoft-azure).

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - Tekoälylähtöinen kehitys
- **⬅️ Edellinen**: [Tekoälymallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon tekoälyn parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustellaksesi AZD:stä ja tekoälyn käyttöönotosta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->