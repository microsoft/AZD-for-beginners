<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ed84aca3294b926341ef9e0a5a78059e",
  "translation_date": "2025-09-18T06:31:24+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "fi"
}
-->
# AI Workshop Lab: AI-ratkaisujen AZD-julkaisuvalmius

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-ensimmäinen kehitys
- **⬅️ Edellinen**: [AI-mallin julkaisu](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

## Työpajan yleiskatsaus

Tämä käytännön labra opastaa kehittäjiä muuntamaan olemassa olevan AI-sovelluksen Azure Developer CLI:n (AZD) avulla julkaisuvalmiiksi. Opit keskeiset tuotannon AI-julkaisumallit Azure AI Foundry -palveluiden avulla.

**Kesto:** 2-3 tuntia  
**Taso:** Keskitaso  
**Esitiedot:** Perustiedot Azuresta, AI/ML-konseptien tuntemus

## 🎓 Oppimistavoitteet

Työpajan lopussa osaat:
- ✅ Muuntaa olemassa olevan AI-sovelluksen käyttämään AZD-malleja
- ✅ Konfiguroida Azure AI Foundry -palvelut AZD:n avulla
- ✅ Toteuttaa turvallisen tunnusten hallinnan AI-palveluille
- ✅ Julkaista tuotantovalmiita AI-sovelluksia seurannalla
- ✅ Ratkaista yleisiä AI-julkaisun ongelmia

## Esitiedot

### Tarvittavat työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (VS Code suositeltu)

### Azure-resurssit
- Azure-tilaus, jossa on kirjoitusoikeudet
- Pääsy Azure OpenAI -palveluihin (tai mahdollisuus pyytää pääsyä)
- Oikeudet luoda resurssiryhmiä

### Tietämyksen esitiedot
- Perustiedot Azure-palveluista
- Komentorivikäyttöliittymien tuntemus
- Perus AI/ML-konseptit (API:t, mallit, kehotteet)

## Labran valmistelu

### Vaihe 1: Ympäristön valmistelu

1. **Varmista työkalujen asennukset:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
az login
azd auth login
```

2. **Kloonaa työpajan repositorio:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: AZD-rakenteen ymmärtäminen AI-sovelluksille

### AI-valmiin AZD-mallin rakenne

Tutustu AI-valmiin AZD-mallin keskeisiin tiedostoihin:

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

### **Labraharjoitus 1.1: Konfiguraation tutkiminen**

1. **Tutki azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mitä etsiä:**
- Palvelumääritelmät AI-komponenteille
- Ympäristömuuttujien kartoitukset
- Isäntäkonfiguraatiot

2. **Tarkista main.bicep-infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Keskeiset AI-mallit:**
- Azure OpenAI -palvelun provisiointi
- Cognitive Search -integraatio
- Turvallinen avainten hallinta
- Verkkoturvallisuuden konfiguraatiot

### **Keskustelupiste:** Miksi nämä mallit ovat tärkeitä AI:lle

- **Palveluriippuvuudet**: AI-sovellukset vaativat usein useita koordinoituja palveluita
- **Turvallisuus**: API-avaimet ja päätepisteet tarvitsevat turvallista hallintaa
- **Skalautuvuus**: AI-työkuormilla on ainutlaatuisia skaalausvaatimuksia
- **Kustannusten hallinta**: AI-palvelut voivat olla kalliita, jos niitä ei konfiguroida oikein

## Moduuli 2: Ensimmäisen AI-sovelluksen julkaisu

### Vaihe 2.1: Ympäristön alustaminen

1. **Luo uusi AZD-ympäristö:**
```bash
azd env new myai-workshop
```

2. **Aseta tarvittavat parametrit:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Vaihe 2.2: Infrastruktuurin ja sovelluksen julkaisu

1. **Julkaise AZD:n avulla:**
```bash
azd up
```

**Mitä tapahtuu `azd up` -komennolla:**
- ✅ Provisioi Azure OpenAI -palvelun
- ✅ Luo Cognitive Search -palvelun
- ✅ Asettaa App Service -palvelun verkkosovellukselle
- ✅ Konfiguroi verkko- ja turvallisuusasetukset
- ✅ Julkaisee sovelluskoodin
- ✅ Asettaa seurannan ja lokituksen

2. **Seuraa julkaisun etenemistä** ja huomioi luodut resurssit.

### Vaihe 2.3: Varmista julkaisu

1. **Tarkista julkaistut resurssit:**
```bash
azd show
```

2. **Avaa julkaistu sovellus:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testaa AI-toiminnallisuus:**
   - Siirry verkkosovellukseen
   - Kokeile esimerkkikyselyitä
   - Varmista, että AI-vastaukset toimivat

### **Labraharjoitus 2.1: Vianetsintäharjoitus**

**Tilanne**: Julkaisu onnistui, mutta AI ei vastaa.

**Yleiset tarkistettavat ongelmat:**
1. **OpenAI API-avaimet**: Varmista, että ne on asetettu oikein
2. **Mallin saatavuus**: Tarkista, tukeeko alueesi mallia
3. **Verkkoyhteys**: Varmista, että palvelut voivat kommunikoida
4. **RBAC-oikeudet**: Varmista, että sovellus voi käyttää OpenAI:ta

**Vianetsintäkomennot:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduuli 3: AI-sovellusten mukauttaminen tarpeisiisi

### Vaihe 3.1: AI-konfiguraation muokkaaminen

1. **Päivitä OpenAI-malli:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
azd deploy
```

2. **Lisää lisä-AI-palveluita:**

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

### Vaihe 3.2: Ympäristökohtaiset konfiguraatiot

**Paras käytäntö**: Eri konfiguraatiot kehitystä ja tuotantoa varten.

1. **Luo tuotantoympäristö:**
```bash
azd env new myai-production
```

2. **Aseta tuotantokohtaiset parametrit:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labraharjoitus 3.1: Kustannusoptimointi**

**Haaste**: Konfiguroi malli kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista, mitkä SKU:t voidaan asettaa ilmais-/perustasoille
2. Konfiguroi ympäristömuuttujat minimikustannuksille
3. Julkaise ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuvinkit:**
- Käytä F0 (ilmainen) tasoa Cognitive Servicesille, kun mahdollista
- Käytä Basic-tasoa Search Service -palvelussa kehityksessä
- Harkitse Consumption-suunnitelmaa Functionsille

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Tunnusten turvallinen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodaavat API-avaimia tai käyttävät turvattomia tallennusratkaisuja.

**AZD-ratkaisu**: Hallittu identiteetti + Key Vault -integraatio.

1. **Tarkista mallisi turvallisuuskonfiguraatio:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että hallittu identiteetti toimii:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkkoturvallisuus

1. **Ota käyttöön yksityiset päätepisteet** (jos ei jo konfiguroitu):

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

### Vaihe 4.3: Seuranta ja havainnointi

1. **Konfiguroi Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Aseta AI-spesifinen seuranta:**

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

### **Labraharjoitus 4.1: Turvallisuusauditointi**

**Tehtävä**: Tarkista julkaisusi turvallisuuden parhaat käytännöt.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Hallittu identiteetti käytössä palveluiden välisessä autentikoinnissa
- [ ] Key Vault tallentaa arkaluontoiset konfiguraatiot
- [ ] Verkkoyhteys on asianmukaisesti rajoitettu
- [ ] Seuranta ja lokitus ovat käytössä

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
   - Tarvitsetko automaattista skaalausta?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo AZD-malli

**Noudata tätä mallia sovelluksesi muuntamiseksi:**

1. **Luo perusrakenne:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
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

### **Labraharjoitus 5.1: Mallinluontihaaste**

**Haaste**: Luo AZD-malli dokumenttien käsittelyyn tarkoitetulle AI-sovellukselle.

**Vaatimukset:**
- Azure OpenAI sisällön analysointiin
- Document Intelligence OCR:lle
- Tallennustili dokumenttien latauksille
- Function App käsittelylogiikalle
- Verkkosovellus käyttöliittymälle

**Bonus-pisteet:**
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Aseta seurannan hallintapaneelit

## Moduuli 6: Yleisten ongelmien vianetsintä

### Yleiset julkaisun ongelmat

#### Ongelma 1: OpenAI-palvelun kiintiö ylitetty
**Oireet:** Julkaisu epäonnistuu kiintiövirheellä
**Ratkaisut:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Ongelma 2: Malli ei saatavilla alueella
**Oireet:** AI-vastaukset epäonnistuvat tai mallin julkaisuvirheet
**Ratkaisut:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Ongelma 3: Oikeusongelmat
**Oireet:** 403 Forbidden -virheet AI-palveluita kutsuttaessa
**Ratkaisut:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Suorituskykyongelmat

#### Ongelma 4: Hitaat AI-vastaukset
**Tutkimusvaiheet:**
1. Tarkista Application Insights -suorituskykymittarit
2. Tarkista OpenAI-palvelun mittarit Azure-portaalissa
3. Varmista verkkoyhteys ja viiveet

**Ratkaisut:**
- Toteuta välimuisti yleisille kyselyille
- Käytä tarkoitukseen sopivaa OpenAI-mallia
- Harkitse luku-replikoita suurille kuormille

### **Labraharjoitus 6.1: Vianetsintähaaste**

**Tilanne**: Julkaisu onnistui, mutta sovellus palauttaa 500-virheitä.

**Vianetsintätehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluyhteydet
3. Testaa autentikointi
4. Tarkista konfiguraatio

**Käytettävät työkalut:**
- `azd show` julkaisun yleiskatsaukseen
- Azure-portaali yksityiskohtaisiin palvelulokeihin
- Application Insights sovelluksen telemetriaan

## Moduuli 7: Seuranta ja optimointi

### Vaihe 7.1: Kattavan seurannan asettaminen

1. **Luo mukautettuja hallintapaneeleja:**

Siirry Azure-portaaliin ja luo hallintapaneeli, jossa on:
- OpenAI-pyyntöjen määrä ja viive
- Sovelluksen virheprosentit
- Resurssien käyttöaste
- Kustannusseuranta

2. **Aseta hälytykset:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Toteuta kustannusten hallinta:**
- Aseta budjettihälytykset
- Käytä automaattisia skaalauskäytäntöjä
- Toteuta pyyntöjen välimuisti
- Seuraa OpenAI:n tokenien käyttöä

### **Labraharjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Parannettavat mittarit:**
- Vähennä keskimääräistä vastausaikaa 20 %
- Vähennä kuukausikustannuksia 15 %
- Säilytä 99,9 % käyttöaika

**Kokeiltavat strategiat:**
- Toteuta vastausten välimuisti
- Optimoi kehotteet tokenien tehokkuuden parantamiseksi
- Käytä tarkoituksenmukaisia laskentaresursseja
- Aseta asianmukaiset automaattiset skaalauskäytännöt

## Lopullinen haaste: Kokonaisvaltainen toteutus

### Haastetilanne

Sinun tehtäväsi on luoda tuotantovalmi AI-pohjainen asiakaspalveluchatbot seuraavilla vaatimuksilla:

**Toiminnalliset vaatimukset:**
- Verkkokäyttöliittymä asiakasvuorovaikutuksille
- Integraatio Azure OpenAI:n kanssa vastauksia varten
- Dokumenttihakuominaisuus Cognitive Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielinen tuki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 samanaikaista käyttäjää
- 99,9 % käyttöaika SLA
- SOC 2 -vaatimustenmukaisuus
- Kustannukset alle $500/kuukausi
- Julkaisu useisiin ympäristöihin (kehitys, testaus, tuotanto)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-malli**
3. **Toteuta turvallisuustoimenpiteet**
4. **Aseta seuranta ja hälytykset**
5. **Luo julkaisupipeline**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt toteutettu?
- ✅ **Skalautuvuus**: Voiko se käsitellä kuormituksen?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin organisoitu?
- ✅ **Kustannukset**: Pysyykö se budjetissa?

## Lisäresurssit

### Microsoft-dokumentaatio
- [Azure Developer CLI Dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Dokumentaatio](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry Dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

### Esimerkkimallit
- [Azure OpenAI Chat App](https://github
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Suoritussertifikaatti

Onnittelut! Olet suorittanut AI Workshop Labin. Sinun pitäisi nyt osata:

- ✅ Muuntaa olemassa olevia AI-sovelluksia AZD-malleiksi
- ✅ Ottaa käyttöön tuotantovalmiita AI-sovelluksia
- ✅ Toteuttaa parhaat käytännöt AI-työkuormien turvallisuudelle
- ✅ Seurata ja optimoida AI-sovellusten suorituskykyä
- ✅ Ratkaista yleisiä käyttöönottoon liittyviä ongelmia

### Seuraavat askeleet
1. Sovella näitä malleja omiin AI-projekteihisi
2. Jaa malleja takaisin yhteisölle
3. Liity Azure AI Foundry Discordiin saadaksesi jatkuvaa tukea
4. Tutustu edistyneisiin aiheisiin, kuten monialueisiin käyttöönottoihin

---

**Työpajan palaute**: Autathan meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Azure AI Foundry Discord #Azure-kanavalla](https://discord.gg/microsoft-azure).

---

**Luvun navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-First-kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../getting-started/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustellaksesi AZD:stä ja AI-käyttöönotosta.

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.