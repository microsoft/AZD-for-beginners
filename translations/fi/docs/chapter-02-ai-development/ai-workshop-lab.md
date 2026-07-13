# AI-työpajalaboratorio: Tehdään AI-ratkaisuistasi AZD-jakelukelpoisia

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Työpajan yleiskatsaus

Tämä käytännön laboratorio ohjaa kehittäjiä läpi prosessin, jossa olemassa oleva AI-malli otetaan käyttöön Azure Developer CLI:n (AZD) avulla. Opit oleellisia tuotantovalmiita AI-jakelun malleja Microsoft Foundry -palveluita hyödyntäen.

> **Vahvistusmuistutus (2026-07-13):** Tämä työpaja tarkastettiin `azd` `1.27.1` -version perusteella. Jos paikallinen asennuksesi on vanhempi, päivitä AZD ennen aloittamista, jotta todennukset, mallit ja käyttöönoton työnkulku vastaavat alla olevia ohjeita.

**Kesto:** 2-3 tuntia  
**Taso:** Keskitaso  
**Esivaatimukset:** Perustiedot Azuresta, AI/ML-käsitteiden tuntemus

## 🎓 Oppimistavoitteet

Työpajan lopussa osaat:
- ✅ Muuttaa olemassa olevan AI-sovelluksen AZD-mallia käyttäväksi
- ✅ Konfiguroida Microsoft Foundry -palveluita AZD:llä
- ✅ Toteuttaa turvallinen tunnistetietojen hallinta AI-palveluille
- ✅ Ottaa käyttöön tuotantovalmiit AI-sovellukset seurannan kanssa
- ✅ Ratkaista yleisiä AI-käyttöönoton ongelmia

## Esivaatimukset

### Tarvittavat työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (suositus VS Code)

### Azure-resurssit
- Azure-tilaus, jossa on osallistujan käyttöoikeudet
- Pääsy Microsoft Foundry Models -palveluihin (tai mahdollisuus pyytää pääsyä)
- Oikeudet resurssiryhmän luomiseen

### Tietämyksen esivaatimukset
- Perustiedot Azure-palveluista
- Komentorivien käytön tuntemus
- Peruskäsitykset AI/ML-käsitteistä (API:t, mallit, kehotteet)

## Laboratorion valmistelu

### Vaihe 1: Ympäristön valmistelu

1. **Varmista työkalujen asennukset:**
```bash
# Tarkista AZD-asennus
azd version

# Tarkista Azure CLI
az --version

# Kirjaudu Azureen AZD-työnkuluille
azd auth login

# Kirjaudu Azure CLI:hin vain, jos aiot suorittaa az-komentoja diagnostisoinnin aikana
az login
```

Jos työskentelet useamman vuokralaisen välillä tai tilaus ei löydy automaattisesti, kokeile uudelleen komennolla `azd auth login --tenant-id <tenant-id>`.

2. **Kloonaa työpajan repositorio:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: AZD-rakenteen ymmärtäminen AI-sovelluksille

### AI-valmiin AZD-mallin rakenne

Tutustu keskeisiin tiedostoihin AI-valmiissa AZD-mallissa:

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

### **Labraharkka 1.1: Tutustu konfiguraatioon**

1. **Tarkastele azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mihin kiinnittää huomiota:**
- Palveluiden määritelmät AI-komponenteille
- Ympäristömuuttujien kartoitukset
- Isäntäasetukset

2. **Käy läpi main.bicep-infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Tärkeät AI-mallit tunnistettavaksi:**
- Microsoft Foundry Models -palvelun käyttöönotto
- Azure AI Search -integraatio
- Turvallinen avainhallinta
- Verkon suojausasetukset

### **Keskustelunaihe:** Miksi nämä mallit ovat tärkeitä AI:ssa

- **Palveluiden riippuvuudet**: AI-sovellukset tarvitsevat usein useita yhteensovittuja palveluita
- **Suojaus**: API-avaimet ja päätepisteet tarvitsevat turvallisen hallinnan
- **Skaalautuvuus**: AI-kuormat vaativat erityisiä skaalausratkaisuja
- **Kustannusten hallinta**: AI-palvelut voivat olla kalliita, jos niitä ei konfiguroida oikein

## Moduuli 2: Ota ensimmäinen AI-sovelluksesi käyttöön

### Vaihe 2.1: Aloita ympäristö

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

1. **Käynnistä käyttöönotto AZD:llä:**
```bash
azd up
```

**Mitä tapahtuu `azd up` -komennon aikana:**
- ✅ Microsoft Foundry Models -palvelu provisionoidaan
- ✅ Azure AI Search -palvelu luodaan
- ✅ App Service web-sovellukselle muodostetaan
- ✅ Verkko- ja suojausasetukset tehdään
- ✅ Sovelluskoodi otetaan käyttöön
- ✅ Seuranta ja lokitus käynnistetään

2. **Seuraa käyttöönoton edistymistä** ja tarkkaile luotuja resursseja.

### Vaihe 2.3: Vahvista käyttöönotto

1. **Tarkista käyttöön otetut resurssit:**
```bash
azd show
```

2. **Avaa käyttöönotettu sovellus:**
```bash
azd show
```

Avaa `azd show` -komennon antama web-päätepiste.

3. **Testaa AI-toiminnallisuutta:**
   - Siirry web-sovellukseen
   - Kokeile esimerkkikyselyjä
   - Vahvista AI-vastausten toimivuus

### **Labraharkka 2.1: Ongelmanratkaisu**

**Tapaus**: Käyttöönotto onnistui, mutta AI ei vastaa.

**Yleiset tarkistettavat asiat:**
1. **OpenAI API-avaimet**: Varmista, että ne ovat oikein asetettu
2. **Mallin saatavuus**: Tarkista, tukeeko alue mallia
3. **Verkkoyhteydet**: Varmista, että palvelut voivat kommunikoida
4. **RBAC-oikeudet**: Varmista, että sovellus pääsee OpenAI:in

**Debuggauskomennot:**
```bash
# Tarkista ympäristömuuttujat
azd env get-values

# Katso käyttöönoton lokit
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Tarkista OpenAI-käyttöönoton tila
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduuli 3: AI-sovellusten räätälöinti tarpeisiisi

### Vaihe 3.1: Muokkaa AI-konfiguraatiota

1. **Päivitä OpenAI-malli:**
```bash
# Vaihda toiseen malliin (jos saatavilla alueellasi)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ota uusi kokoonpano käyttöön uudelleen
azd deploy
```

2. **Lisää muita AI-palveluita:**

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

**Hyvä käytäntö**: Erilaiset asetukset kehitykseen ja tuotantoon.

1. **Luo tuotantoympäristö:**
```bash
azd env new myai-production
```

2. **Aseta tuotantokohtaiset parametrit:**
```bash
# Tuotannossa käytetään tyypillisesti korkeampia SKU-koodeja
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ota käyttöön lisäturvaominaisuudet
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labraharkka 3.1: Kustannusten optimointi**

**Haaste**: Konfiguroi malli kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista mitkä SKU:t voidaan asettaa ilmaiselle/perustasolle
2. Määritä ympäristömuuttujat minimikustannusten takaamiseksi
3. Ota käyttöön ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuvinkit:**
- Käytä F0 (ilmainen) tasoa Azure AI Services -palveluissa kun mahdollista
- Käytä Basic-tasoa Search Service -kehityksessä
- Harkitse kulutusperusteista suunnitelmaa Functions-palveluille

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Turvallinen tunnistetietojen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodaa API-avaimia tai käyttävät turvatonta säilytystä.

**AZD-ratkaisu**: Managed Identity + Key Vault -integraatio.

1. **Tarkista mallisi turvallisuusasetukset:**
```bash
# Etsi Key Vaultin ja Managed Identityn asetukset
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista Managed Identityn toimivuus:**
```bash
# Tarkista, onko verkkosovelluksella oikea identiteettikonfiguraatio
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkon turvallisuus

1. **Ota käyttöön yksityiset päätepisteet** (jos ei vielä asetettu):

Lisää se bicep-malliisi:
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

### Vaihe 4.3: Seuranta ja havaittavuus

1. **Konfiguroi Application Insights:**
```bash
# Application Insights tulisi konfiguroida automaattisesti
# Tarkista konfiguraatio:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Perusta AI-kohtainen seuranta:**

Lisää räätälöidyt mittarit AI-toiminnoille:
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

### **Labraharkka 4.1: Turvallisuustarkastus**

**Tehtävä**: Tarkista käyttöönotto turvallisuuden parhaiden käytäntöjen mukaan.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Managed Identity käytössä palveluiden väliseen todennukseen
- [ ] Key Vault säilyttää arkaluontoiset asetukset
- [ ] Verkon pääsy on asianmukaisesti rajattu
- [ ] Seuranta ja lokitus ovat käytössä

## Moduuli 5: Oman AI-sovelluksen muuntaminen

### Vaihe 5.1: Arviointityökalu

**Ennen sovelluksen muuttamista**, vastaa näihin kysymyksiin:

1. **Sovellusarkkitehtuuri:**
   - Mitä AI-palveluita sovelluksesi käyttää?
   - Mitä laskentaresursseja se tarvitsee?
   - Tarvitaanko tietokantaa?
   - Mitkä ovat palveluiden väliset riippuvuudet?

2. **Turvallisuusvaatimukset:**
   - Mitä arkaluontoisia tietoja sovelluksesi käsittelee?
   - Mitä vaatimuksia noudatat?
   - Tarvitsetko yksityisen verkon?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuormitus?
   - Tarvitsetko automaattisen skaalauksen?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo oma AZD-malli

**Seuraa tätä mallia muuttaessasi sovellusta:**

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

3. **Luo infrastruktuurin mallit:**

**infra/main.bicep** - päämalli:
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

### **Labraharkka 5.1: Mallin luonti**

**Haaste**: Luo AZD-malli asiakirjojen prosessointiin AI-sovellukselle.

**Vaatimukset:**
- Microsoft Foundry Models sisällön analysointiin
- Document Intelligence OCR-toimintoon
- Storage Account asiakirjojen latauksia varten
- Function App käsittelylogiikalle
- Web-sovellus käyttäjärajapintaan

**Lisäpisteet:**
- Lisää kunnollinen virheenkäsittely
- Sisällytä kustannusarvio
- Perusta seurantapaneelit

## Moduuli 6: Yleisten ongelmien ratkaisu

### Yleisiä käyttöönotto-ongelmia

#### Ongelma 1: OpenAI-palvelun käyttöoikeus ylittynyt
**Oireet:** Käyttöönotto epäonnistuu käyttöoikeusvirheeseen
**Ratkaisut:**
```bash
# Tarkista nykyiset kiintiöt
az cognitiveservices usage list --location eastus

# Pyydä kiintiön korotusta tai kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up
```

#### Ongelma 2: Malli ei ole saatavilla alueella
**Oireet:** AI-vastaukset epäonnistuvat tai mallin käyttöönotto virheilee
**Ratkaisut:**
```bash
# Tarkista mallin saatavuus alueittain
az cognitiveservices model list --location eastus

# Päivitä saatavilla olevaan malliin
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Ongelma 3: Oikeusongelmat
**Oireet:** 403 Forbiddeen virheet AI-palveluiden kutsuissa
**Ratkaisut:**
```bash
# Tarkista roolijako
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
2. Käy läpi OpenAI-palvelun mittarit Azure-portaalissa
3. Varmista verkkoyhteys ja viiveet

**Ratkaisut:**
- Ota välimuisti käyttöön yleisille kyselyille
- Käytä käyttötarkoitukseen sopivaa OpenAI-mallia
- Harkitse lukupeilejä korkean kuorman tilanteisiin

### **Labraharkka 6.1: Debuggaushaaste**

**Tapaus**: Käyttöönotto onnistui, mutta sovellus palauttaa 500-virheitä.

**Debuggaustehtävät:**
1. Tarkista lokitiedostot
2. Varmista palveluyhteydet
3. Testaa todennus
4. Tarkista konfiguraatio

**Käytettävät työkalut:**
- `azd show` käyttöönottokatsaukseen
- Azure-portaali yksityiskohtaisiin palvelulokeihin
- Application Insights sovellustietojen seurantaan

## Moduuli 7: Seuranta ja optimointi

### Vaihe 7.1: Perusteellinen seurannan perustaminen

1. **Luo räätälöidyt hallintapaneelit:**

Siirry Azure-portaaliin ja luo hallintapaneeli, jossa on:
- OpenAI-kutsujen määrä ja viive
- Sovelluksen virhetasot
- Resurssien käyttöasteet
- Kustannusten seuranta

2. **Perusta hälytykset:**
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
# Käytä Azure CLI:tä saadaksesi kustannustiedot
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ota käyttöön kustannusten hallinta:**
- Aseta budjettihälytykset
- Käytä automaattisen skaalauspolitiikkoja
- Toteuta pyynnön välimuisti
- Seuraa token-kulutusta OpenAI:ssa

### **Labraharkka 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi suorituskyky ja kustannustehokkuus.

**Parannettavat mittarit:**
- Laske keskimääräinen vasteaika 20%:lla
- Pienennä kuukausittaisia kustannuksia 15%:lla
- Säilytä 99,9% käyttöaika

**Kokeiltavat strategiat:**
- Ota vasteen välimuisti käyttöön
- Optimoi kehotteet tokenien tehokkuuden parantamiseksi
- Käytä sopivia laskentatyyppejä (SKU:t)
- Konfiguroi asianmukainen automaattinen skaalaus

## Lopullinen haaste: Päätepisteestä toiseen toteutus

### Haasteen tilannekuva

Sinulle on annettu tehtäväksi luoda tuotantovalmiiksi AI-tehoinen asiakaspalveluchatbot näillä vaatimuksilla:

**Toiminnalliset vaatimukset:**
- Web-käyttöliittymä asiakaskohtaamisille
- Integrointi Microsoft Foundry Modelsin kanssa vastausten tuottamiseksi
- Asiakirjahaku Azure AI Searchin avulla
- Integrointi olemassa olevaan asiakastietokantaan
- Monikielinen tuki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 samanaikaista käyttäjää
- 99,9% käyttöaikatakuu (SLA)
- SOC 2 -vaatimustenmukaisuus
- Kustannukset alle 500 $/kuukausi
- Käyttöönotto useisiin ympäristöihin (kehitys, testaus, tuotanto)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-malli**
3. **Toteuta turvallisuustoimenpiteet**
4. **Perusta seuranta ja hälytykset**
5. **Luo käyttöönotto putket**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt otettu käyttöön?
- ✅ **Skaalautuvuus**: Pystyykö käsittelemään kuormituksen?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin organisoitu?
- ✅ **Kustannukset**: Pysyykö budjetissa?

## Lisäresurssit

### Microsoftin dokumentaatio
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Malliesimerkit
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Yhteisön resurssit
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Valmistumistodistus

Onnittelut! Olet suorittanut AI-työpajan. Sinun pitäisi nyt osata:

- ✅ Muuntaa olemassa olevat tekoälysovellukset AZD-malleiksi
- ✅ Ottaa käyttöön tuotantovalmiita tekoälysovelluksia
- ✅ Toteuttaa turvallisuuden parhaat käytännöt tekoälykuormille
- ✅ Valvoa ja optimoida tekoälysovellusten suorituskykyä
- ✅ Ratkaista yleisiä käyttöönotto-ongelmia

### Seuraavat vaiheet
1. Sovella näitä malleja omiin tekoälyprojekteihisi
2. Anna malleja takaisin yhteisölle
3. Liity Microsoft Foundry Discordiin saadaksesi jatkuvaa tukea
4. Tutustu edistyneisiin aiheisiin, kuten monialueisiin käyttöönottoihin

---

**Työpajan palaute**: Auta meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundry Discord #Azure -kanavalla](https://discord.gg/microsoft-azure).

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensisijainen kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon tekoälyn parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustelua AZD:stä ja tekoälyn käyttöönotosta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->