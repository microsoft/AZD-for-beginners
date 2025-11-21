<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-21T15:57:57+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "fi"
}
-->
# AI Workshop Lab: Tee AI-ratkaisuistasi AZD-yhteensopivia

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotantotason AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

## Työpajan yleiskatsaus

Tässä käytännön työpajassa kehittäjät oppivat ottamaan käyttöön olemassa olevan AI-mallipohjan Azure Developer CLI:n (AZD) avulla. Opit keskeiset mallit tuotantotason AI-käyttöönottoihin Microsoft Foundry -palveluiden avulla.

**Kesto:** 2-3 tuntia  
**Taso:** Keskitaso  
**Esitiedot:** Perustiedot Azuresta, AI/ML-konseptien tuntemus

## 🎓 Oppimistavoitteet

Työpajan lopussa osaat:
- ✅ Muuntaa olemassa olevan AI-sovelluksen AZD-mallipohjia käyttäen
- ✅ Konfiguroida Microsoft Foundry -palvelut AZD:n avulla
- ✅ Toteuttaa turvallisen tunnistetietojen hallinnan AI-palveluille
- ✅ Ottaa käyttöön tuotantovalmiita AI-sovelluksia, joissa on valvonta
- ✅ Ratkaista yleisiä AI-käyttöönoton ongelmia

## Esitiedot

### Tarvittavat työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (suositellaan VS Codea)

### Azure-resurssit
- Azure-tilaus, jossa on kirjoitusoikeudet
- Pääsy Azure OpenAI -palveluihin (tai mahdollisuus pyytää pääsyä)
- Oikeudet luoda resurssiryhmiä

### Tietämyksen esitiedot
- Perustiedot Azure-palveluista
- Komentorivien tuntemus
- Perustason AI/ML-konseptit (API:t, mallit, kehotteet)

## Työpajan valmistelu

### Vaihe 1: Ympäristön valmistelu

1. **Varmista työkalujen asennus:**
```bash
# Tarkista AZD-asennus
azd version

# Tarkista Azure CLI
az --version

# Kirjaudu Azureen
az login
azd auth login
```

2. **Kloonaa työpajan arkisto:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: AZD-rakenteen ymmärtäminen AI-sovelluksille

### AI-valmiin AZD-mallipohjan rakenne

Tutustu AI-valmiin AZD-mallipohjan keskeisiin tiedostoihin:

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

### **Lab-harjoitus 1.1: Konfiguraation tutkiminen**

1. **Tarkastele azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mitä etsiä:**
- AI-komponenttien palvelumääritelmät
- Ympäristömuuttujien kartoitukset
- Isäntäkonfiguraatiot

2. **Tarkista main.bicep-infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Keskeiset AI-mallit, jotka tunnistetaan:**
- Azure OpenAI -palvelun provisiointi
- Cognitive Search -integraatio
- Turvallinen avainten hallinta
- Verkon suojausasetukset

### **Keskustelupiste:** Miksi nämä mallit ovat tärkeitä AI:lle

- **Palveluriippuvuudet**: AI-sovellukset vaativat usein useita koordinoituja palveluita
- **Turvallisuus**: API-avaimet ja päätepisteet tarvitsevat turvallista hallintaa
- **Skaalautuvuus**: AI-työkuormilla on ainutlaatuiset skaalautumisvaatimukset
- **Kustannusten hallinta**: AI-palvelut voivat olla kalliita, jos niitä ei ole konfiguroitu oikein

## Moduuli 2: Ensimmäisen AI-sovelluksen käyttöönotto

### Vaihe 2.1: Ympäristön alustaminen

1. **Luo uusi AZD-ympäristö:**
```bash
azd env new myai-workshop
```

2. **Aseta tarvittavat parametrit:**
```bash
# Aseta haluamasi Azure-alue
azd env set AZURE_LOCATION eastus

# Valinnainen: Aseta tietty OpenAI-malli
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Vaihe 2.2: Infrastruktuurin ja sovelluksen käyttöönotto

1. **Ota käyttöön AZD:n avulla:**
```bash
azd up
```

**Mitä tapahtuu `azd up` -komennon aikana:**
- ✅ Provisioi Azure OpenAI -palvelun
- ✅ Luo Cognitive Search -palvelun
- ✅ Määrittää App Servicen verkkosovellukselle
- ✅ Konfiguroi verkon ja turvallisuuden
- ✅ Ottaa käyttöön sovelluskoodin
- ✅ Määrittää valvonnan ja lokituksen

2. **Seuraa käyttöönoton etenemistä** ja huomioi luodut resurssit.

### Vaihe 2.3: Varmista käyttöönotto

1. **Tarkista käyttöönotetut resurssit:**
```bash
azd show
```

2. **Avaa käyttöönotettu sovellus:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testaa AI-toiminnallisuus:**
   - Siirry verkkosovellukseen
   - Kokeile esimerkkikyselyitä
   - Varmista, että AI-vastaukset toimivat

### **Lab-harjoitus 2.1: Vianetsintäharjoitus**

**Tilanne**: Käyttöönotto onnistui, mutta AI ei vastaa.

**Tarkistettavat yleiset ongelmat:**
1. **OpenAI API -avaimet**: Varmista, että ne on asetettu oikein
2. **Mallin saatavuus**: Tarkista, tukeeko alueesi mallia
3. **Verkkoyhteys**: Varmista, että palvelut voivat kommunikoida
4. **RBAC-oikeudet**: Varmista, että sovellus voi käyttää OpenAI:ta

**Vianetsintäkomennot:**
```bash
# Tarkista ympäristömuuttujat
azd env get-values

# Näytä käyttöönoton lokit
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Tarkista OpenAI:n käyttöönoton tila
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduuli 3: AI-sovellusten mukauttaminen tarpeisiisi

### Vaihe 3.1: AI-konfiguraation muokkaaminen

1. **Päivitä OpenAI-malli:**
```bash
# Vaihda toiseen malliin (jos saatavilla alueellasi)
azd env set AZURE_OPENAI_MODEL gpt-4

# Ota uusi kokoonpano käyttöön uudelleen
azd deploy
```

2. **Lisää lisä-AI-palveluita:**

Muokkaa `infra/main.bicep`-tiedostoa lisätäksesi Document Intelligencen:

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

**Paras käytäntö**: Eri konfiguraatiot kehitystä ja tuotantoa varten.

1. **Luo tuotantoympäristö:**
```bash
azd env new myai-production
```

2. **Aseta tuotantokohtaiset parametrit:**
```bash
# Tuotanto käyttää yleensä korkeampia SKU:ita
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ota käyttöön lisäturvaominaisuudet
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab-harjoitus 3.1: Kustannusoptimointi**

**Haaste**: Konfiguroi mallipohja kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista, mitkä SKU:t voidaan asettaa ilmais-/perustasoille
2. Konfiguroi ympäristömuuttujat minimikustannuksilla
3. Ota käyttöön ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuvinkkejä:**
- Käytä F0 (ilmainen) tasoa Cognitive Services -palveluille, kun mahdollista
- Käytä Basic-tasoa Search Service -palvelussa kehityksessä
- Harkitse Consumption-suunnitelman käyttöä Functions-palveluille

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Tunnistetietojen turvallinen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodaavat API-avaimia tai käyttävät turvattomia tallennusratkaisuja.

**AZD-ratkaisu**: Hallittu identiteetti + Key Vault -integraatio.

1. **Tarkista mallipohjan turvallisuuskonfiguraatio:**
```bash
# Etsi Key Vault- ja Managed Identity -kokoonpano
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että hallittu identiteetti toimii:**
```bash
# Tarkista, onko verkkosovelluksella oikea identiteettikonfiguraatio
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkon turvallisuus

1. **Ota käyttöön yksityiset päätepisteet** (jos ei vielä konfiguroitu):

Lisää bicep-mallipohjaan:
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

### Vaihe 4.3: Valvonta ja näkyvyys

1. **Määritä Application Insights:**
```bash
# Sovelluksen näkemykset pitäisi konfiguroida automaattisesti
# Tarkista kokoonpano:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ota käyttöön AI-spesifinen valvonta:**

Lisää mukautettuja mittareita AI-toiminnoille:
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

**Tehtävä**: Tarkista käyttöönotto turvallisuuden parhaiden käytäntöjen osalta.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Hallittua identiteettiä käytetään palveluiden väliseen autentikointiin
- [ ] Key Vault tallentaa arkaluontoiset konfiguraatiot
- [ ] Verkon pääsy on asianmukaisesti rajoitettu
- [ ] Valvonta ja lokitus ovat käytössä

## Moduuli 5: Oman AI-sovelluksen muuntaminen

### Vaihe 5.1: Arviointilomake

**Ennen sovelluksesi muuntamista**, vastaa näihin kysymyksiin:

1. **Sovelluksen arkkitehtuuri:**
   - Mitä AI-palveluita sovelluksesi käyttää?
   - Mitä laskentaresursseja se tarvitsee?
   - Tarvitseeko se tietokannan?
   - Mitkä ovat palveluiden väliset riippuvuudet?

2. **Turvallisuusvaatimukset:**
   - Mitä arkaluontoisia tietoja sovelluksesi käsittelee?
   - Mitä vaatimustenmukaisuusvaatimuksia sinulla on?
   - Tarvitsetko yksityistä verkkoa?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuormitus?
   - Tarvitsetko automaattista skaalautumista?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo oma AZD-mallipohja

**Noudata tätä mallia sovelluksesi muuntamiseksi:**

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

3. **Luo infrastruktuurimallipohjat:**

**infra/main.bicep** - Päämallipohja:
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

**Haaste**: Luo AZD-mallipohja asiakirjojen käsittelyyn tarkoitetulle AI-sovellukselle.

**Vaatimukset:**
- Azure OpenAI sisällön analysointiin
- Document Intelligence OCR:lle
- Tallennustili asiakirjojen lataamiseen
- Function App käsittelylogiikalle
- Verkkosovellus käyttöliittymälle

**Bonus-pisteet:**
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Määritä valvontapaneelit

## Moduuli 6: Yleisten ongelmien vianetsintä

### Yleiset käyttöönotto-ongelmat

#### Ongelma 1: OpenAI-palvelun kiintiö ylittyi
**Oireet:** Käyttöönotto epäonnistuu kiintiövirheellä
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
**Oireet:** 403 Kielletty -virheet AI-palveluita kutsuttaessa
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
2. Tarkista OpenAI-palvelun mittarit Azure-portaalista
3. Varmista verkkoyhteys ja viiveet

**Ratkaisut:**
- Ota käyttöön välimuisti yleisille kyselyille
- Käytä tarkoitukseen sopivaa OpenAI-mallia
- Harkitse luku-replikoita suurille kuormille

### **Lab-harjoitus 6.1: Vianetsintähaaste**

**Tilanne**: Käyttöönotto onnistui, mutta sovellus palauttaa 500-virheitä.

**Vianetsintätehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluiden yhteydet
3. Testaa autentikointi
4. Tarkista konfiguraatio

**Käytettävät työkalut:**
- `azd show` käyttöönoton yleiskatsaukseen
- Azure-portaali yksityiskohtaisille palvelulokeille
- Application Insights sovelluksen telemetrialle

## Moduuli 7: Valvonta ja optimointi

### Vaihe 7.1: Kattavan valvonnan määrittäminen

1. **Luo mukautetut hallintapaneelit:**

Siirry Azure-portaaliin ja luo hallintapaneeli, jossa on:
- OpenAI-pyyntöjen määrä ja viive
- Sovelluksen virheprosentit
- Resurssien käyttöaste
- Kustannusseuranta

2. **Määritä hälytykset:**
```bash
# Hälytys korkeasta virheasteesta
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

2. **Toteuta kustannusten hallinta:**
- Aseta budjettihälytykset
- Käytä automaattisia skaalautumiskäytäntöjä
- Ota käyttöön pyyntöjen välimuisti
- Seuraa OpenAI:n tokenien käyttöä

### **Lab-harjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Parannettavat mittarit:**
- Vähennä keskimääräistä vastausaikaa 20 %
- Vähennä kuukausikustannuksia 15 %
- Säilytä 99,9 % käyttöaika

**Kokeiltavat strategiat:**
- Ota käyttöön vastausten välimuisti
- Optimoi kehotteet tokenien tehokkuuden parantamiseksi
- Käytä sopivia laskentaresursseja
- Määritä asianmukainen automaattinen skaalautuminen

## Lopullinen haaste: Kokonaisvaltainen toteutus

### Haastetilanne

Sinun tehtäväsi on luoda tuotantovalmiin AI-pohjaisen asiakaspalveluchatbotin, jolla on seuraavat vaatimukset:

**Toiminnalliset vaatimukset:**
- Verkkokäyttöliittymä asiakasvuorovaikutuksille
- Integraatio Azure OpenAI:n kanssa vastauksia varten
- Asiakirjahaku Cognitive Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielinen tuki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 samanaikaista käyttäjää
- 99,9 % käyttöaikatakuu
- SOC 2 -vaatimustenmukaisuus
- Kustannukset alle 500 $/kk
- Käyttöönotto useisiin ympäristöihin (kehitys, testaus, tuotanto)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-mallipohja**
3. **Toteuta turvallisuustoimenpiteet**
4. **Määritä valvonta ja hälytykset**
5. **Luo käyttöönoton putkistot**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt toteutettu?
- ✅ **Skaalautuvuus**: Voiko se käsitellä kuormituksen?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin organisoitu?
- ✅ **K
Onnittelut! Olet suorittanut AI Workshop Labin. Sinun pitäisi nyt osata:

- ✅ Muuntaa olemassa olevia AI-sovelluksia AZD-malleiksi
- ✅ Ottaa käyttöön tuotantovalmiita AI-sovelluksia
- ✅ Toteuttaa parhaat käytännöt AI-työkuormien turvallisuudelle
- ✅ Seurata ja optimoida AI-sovellusten suorituskykyä
- ✅ Ratkaista yleisiä käyttöönottoon liittyviä ongelmia

### Seuraavat askeleet
1. Sovella näitä malleja omiin AI-projekteihisi
2. Jaa malleja takaisin yhteisölle
3. Liity Microsoft Foundry Discordiin saadaksesi jatkuvaa tukea
4. Tutustu edistyneisiin aiheisiin, kuten monialueisiin käyttöönottoihin

---

**Työpajan palaute**: Autathan meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundry Discordin #Azure-kanavalla](https://discord.gg/microsoft-azure).

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-First-kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustellaksesi AZD:stä ja AI-käyttöönotosta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi katsoa ensisijaiseksi lähteeksi. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->