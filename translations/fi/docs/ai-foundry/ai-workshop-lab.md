<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "668bc93b35c9249e52245a0b037b6011",
  "translation_date": "2025-09-12T21:38:12+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "fi"
}
-->
# AI Workshop Lab: AI-ratkaisujen AZD-julkaisuvalmius

**Edellinen:** [AI-mallin käyttöönotto](ai-model-deployment.md) | **Seuraava:** [Tuotannon AI-käytännöt](production-ai-practices.md)

## Työpajan yleiskatsaus

Tämä käytännön työpaja opastaa kehittäjiä muuntamaan olemassa olevan AI-sovelluksen Azure Developer CLI:n (AZD) avulla julkaisuvalmiiksi. Opit keskeiset tuotannon AI-julkaisumallit Azure AI Foundry -palveluiden avulla.

**Kesto:** 2-3 tuntia  
**Taso:** Keskitaso  
**Esitiedot:** Perustiedot Azuresta, AI/ML-konseptien tuntemus

## 🎓 Oppimistavoitteet

Työpajan lopussa osaat:
- ✅ Muuntaa olemassa olevan AI-sovelluksen AZD-mallien käyttöön
- ✅ Konfiguroida Azure AI Foundry -palvelut AZD:n avulla
- ✅ Toteuttaa turvallisen tunnistetietojen hallinnan AI-palveluille
- ✅ Julkaista tuotantovalmiita AI-sovelluksia, joissa on seuranta
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
- Perustiedot AI/ML-konsepteista (API:t, mallit, kehotteet)

## Työpajan valmistelu

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

2. **Kloonaa työpajan arkisto:**  
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

### **Lab-harjoitus 1.1: Konfiguraation tutkiminen**

1. **Tutki azure.yaml-tiedostoa:**  
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
- Verkkoturvallisuuskonfiguraatiot

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

**Mitä tapahtuu `azd up` -komennon aikana:**
- ✅ Azure OpenAI -palvelun provisiointi
- ✅ Cognitive Search -palvelun luominen
- ✅ Web-sovelluksen App Service -asennus
- ✅ Verkkoturvallisuuden ja -konfiguraation asennus
- ✅ Sovelluskoodin julkaisu
- ✅ Seurannan ja lokituksen asennus

2. **Seuraa julkaisun etenemistä** ja huomioi luodut resurssit.

### Vaihe 2.3: Julkaisun tarkistaminen

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
   - Kokeile esimerkkikyselyitä
   - Varmista, että AI-vastaukset toimivat

### **Lab-harjoitus 2.1: Vianetsintäharjoitus**

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

2. **Lisää lisäpalveluita:**

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

### **Lab-harjoitus 3.1: Kustannusoptimointi**

**Haaste**: Konfiguroi malli kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Tunnista, mitkä SKU:t voidaan asettaa ilmaiseksi/perustasolle
2. Konfiguroi ympäristömuuttujat minimikustannuksilla
3. Julkaise ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuvinkkejä:**
- Käytä F0 (ilmainen) tasoa Cognitive Servicesille, kun mahdollista
- Käytä Basic-tasoa Search Service -palvelussa kehityksessä
- Harkitse Consumption-suunnitelman käyttöä Functionsille

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Tunnistetietojen turvallinen hallinta

**Nykyinen haaste**: Monet AI-sovellukset kovakoodaavat API-avaimia tai käyttävät epävarmaa tallennusta.

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

1. **Ota käyttöön yksityiset päätepisteet** (jos ei vielä konfiguroitu):

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

2. **Ota käyttöön AI-spesifinen seuranta:**

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

**Noudata tätä mallia sovelluksesi muuntamisessa:**

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

### **Lab-harjoitus 5.1: Mallinluontihaaste**

**Haaste**: Luo AZD-malli dokumenttien käsittelyyn tarkoitetulle AI-sovellukselle.

**Vaatimukset:**
- Azure OpenAI sisällön analysointiin
- Document Intelligence OCR:lle
- Tallennustili dokumenttien latauksille
- Function App käsittelylogiikalle
- Web-sovellus käyttöliittymälle

**Bonus:**  
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Ota käyttöön seurannan hallintapaneelit

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
1. Tarkista Application Insightsin suorituskykymittarit
2. Tarkista OpenAI-palvelun mittarit Azure-portaalissa
3. Varmista verkkoyhteys ja viiveet

**Ratkaisut:**
- Ota käyttöön välimuisti yleisille kyselyille
- Käytä sovelluksellesi sopivaa OpenAI-mallia
- Harkitse luku-replikoita suurille kuormille

### **Lab-harjoitus 6.1: Vianetsintähaaste**

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

### Vaihe 7.1: Kattavan seurannan asennus

1. **Luo mukautetut hallintapaneelit:**

Siirry Azure-portaaliin ja luo hallintapaneeli, jossa on:
- OpenAI-pyyntöjen määrä ja viive
- Sovelluksen virheprosentit
- Resurssien käyttöaste
- Kustannusseuranta

2. **Ota käyttöön hälytykset:**  
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

2. **Toteuta kustannusten hallintatoimenpiteet:**
- Aseta budjettihälytykset
- Käytä automaattisia skaalauskäytäntöjä
- Ota käyttöön pyyntöjen välimuisti
- Seuraa OpenAI:n tokenien käyttöä

### **Lab-harjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Parannettavat mittarit:**
- Vähennä keskimääräistä vasteaikaa 20 %
- Vähennä kuukausikustannuksia 15 %
- Säilytä 99,9 % käyttöaika

**Kokeiltavat strategiat:**
- Ota käyttöön vasteen välimuisti
- Optimoi kehotteet tokenien tehokkuuden parantamiseksi
- Käytä sopivia laskentaresursseja
- Ota käyttöön asianmukainen automaattinen skaalaus

## Lopullinen haaste: Kokonaisvaltainen toteutus

### Haastetilanne

Sinun tehtäväsi on luoda tuotantovalmi AI-pohjainen asiakaspalveluchatbot, jolla on seuraavat vaatimukset:

**Toiminnalliset vaatimukset:**
- Web-käyttöliittymä asiakasvuorovaikutuksille
- Integraatio Azure OpenAI:n kanssa vastauksia varten
- Dokumenttihaku Cognitive Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielinen tuki

**Ei-toiminnalliset vaatimukset:**
- Käsittele 1000 samanaikaista käyttäjää
- 99,9 % käyttöaika SLA
- SOC 2 -vaatimustenmukaisuus
- Kustannukset alle 500 $/kuukausi
- Julkaisu useisiin ympäristöihin (kehitys, testaus, tuotanto)

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-malli**
3. **Toteuta turvallisuustoimenpiteet**
4. **Ota käyttöön seuranta ja hälytykset**
5. **Luo julkaisupipelines**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt toteutettu?
- ✅ **Skalautuvuus**: Voiko se käsitellä kuormituksen?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin järjestetty?
- ✅ **Kustannukset**: Pysyykö se budjetissa?

## Lisäresurssit

### Microsoft-dokumentaatio
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI -palvelun dokumentaatio](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Azure AI Foundry -dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

### Esimerkkimallit
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Yhteisöresurssit
- ✅ Toteuta parhaat käytännöt AI-työkuormien turvallisuudelle
- ✅ Seuraa ja optimoi AI-sovellusten suorituskykyä
- ✅ Ratkaise yleisiä käyttöönottoon liittyviä ongelmia

### Seuraavat askeleet
1. Sovella näitä malleja omiin AI-projekteihisi
2. Jaa mallipohjia takaisin yhteisölle
3. Liity Azure AI Foundry Discordiin saadaksesi jatkuvaa tukea
4. Tutustu edistyneisiin aiheisiin, kuten monialueisiin käyttöönottoihin

---

**Työpajan palaute**: Autathan meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Azure AI Foundry Discordin #Azure-kanavalla](https://discord.gg/microsoft-azure).

---

**Edellinen:** [AI-mallin käyttöönotto](ai-model-deployment.md) | **Seuraava:** [Tuotannon AI-käytännöt](production-ai-practices.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskusteluja AZD:stä ja AI-käyttöönotosta.

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.