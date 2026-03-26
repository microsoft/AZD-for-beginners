# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-First Development
- **⬅️ Edellinen**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Seuraava**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Workshop Overview

Tämä käytännön labra opastaa kehittäjiä ottamaan olemassa olevan AI-mallipohjan ja ottamaan sen käyttöön Azure Developer CLI:llä (AZD). Opit olennaisia malleja tuotantovalmiisiin AI-julkaisuun Microsoft Foundry -palveluiden avulla.

**Kesto:** 2-3 tuntia  
**Taso:** Keskitaso  
**Esivaatimukset:** Perustiedot Azuren käytöstä, perehtyneisyys AI/ML-käsitteisiin

## 🎓 Learning Objectives

Tämän työpajan jälkeen osaat:
- ✅ Muuntaa olemassa olevan AI-sovelluksen käyttämään AZD-mallipohjia
- ✅ Konfiguroida Microsoft Foundry -palveluita AZD:llä
- ✅ Toteuttaa turvallisen tunnistetietojen hallinnan AI-palveluille
- ✅ Julkaista tuotantovalmiit AI-sovellukset valvonnalla
- ✅ Vianetsintä yleisissä AI-julkaisun ongelmissa

## Prerequisites

### Required Tools
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (suositus: VS Code)

### Azure Resources
- Azure-tilaus, jossa on contributor-oikeudet
- Pääsy Microsoft Foundry Models -palveluihin (tai mahdollisuus pyytää pääsy)
- Oikeudet resurssiryhmän luomiseen

### Knowledge Prerequisites
- Peruskäsitys Azure-palveluista
- Perehtyneisyys komentorivikäyttöön
- Perus AI/ML-käsitteet (API:t, mallit, promptit)

## Lab Setup

### Step 1: Environment Preparation

1. **Varmista työkalujen asennus:**
```bash
# Tarkista AZD:n asennus
azd version

# Tarkista Azure CLI:n asennus
az --version

# Kirjaudu Azureen
az login
azd auth login
```

2. **Kloonaa workshop-repositorio:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Module 1: Understanding AZD Structure for AI Applications

### Anatomy of an AI AZD Template

Tutustu avaintiedostoihin AI-valmiissa AZD-mallipohjassa:

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

### **Lab Exercise 1.1: Explore the Configuration**

1. **Tarkastele azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mitä etsiä:**
- AI-komponenttien palvelumääritykset
- Ympäristömuuttujien mappaukset
- Isäntä- (host) kokoonpanot

2. **Käy läpi main.bicep-infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Keskeiset AI-kuviot, jotka tunnistaa:**
- Microsoft Foundry Models -palvelun provisiointi
- Cognitive Search -integraatio
- Turvallinen avainten hallinta
- Verkon suojausasetukset

### **Discussion Point:** Why These Patterns Matter for AI

- **Service Dependencies**: AI-sovellukset vaativat usein useita koordinoituja palveluja
- **Security**: API-avaimet ja päätepisteet tarvitsevat turvallista hallintaa
- **Scalability**: AI-kuormituksilla on omat skaalausvaatimuksensa
- **Cost Management**: AI-palvelut voivat olla kalliita, jos niitä ei ole oikein konfiguroitu

## Module 2: Deploy Your First AI Application

### Step 2.1: Initialize the Environment

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

### Step 2.2: Deploy the Infrastructure and Application

1. **Ota tuotantoon AZD:llä:**
```bash
azd up
```

**Mitä tapahtuu suoritettaessa `azd up`:**
- ✅ Provisionoi Microsoft Foundry Models -palvelun
- ✅ Luo Cognitive Search -palvelun
- ✅ Asettaa App Servicen web-sovellukselle
- ✅ Konfiguroi verkot ja turvallisuuden
- ✅ Julkaisee sovelluskoodin
- ✅ Asettaa valvonnan ja lokituksen

2. **Seuraa julkaisuputken etenemistä** ja huomioi luotavat resurssit.

### Step 2.3: Verify Your Deployment

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

### **Lab Exercise 2.1: Troubleshooting Practice**

**Skenaario**: Julkaisu onnistui mutta AI ei vastaa.

**Yleisimmät tarkistettavat ongelmat:**
1. **OpenAI API -avaimet**: Varmista, että ne on asetettu oikein
2. **Mallin saatavuus**: Tarkista, tukeeko alueesi mallia
3. **Verkkoyhteydet**: Varmista, että palvelut voivat kommunikoida
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

## Module 3: Customizing AI Applications for Your Needs

### Step 3.1: Modify the AI Configuration

1. **Päivitä OpenAI-mallia:**
```bash
# Vaihda toiseen malliin (jos se on saatavilla alueellasi)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Ota uudelleen käyttöön uusi kokoonpano
azd deploy
```

2. **Lisää lisä-AI-palveluja:**

Muokkaa `infra/main.bicep` lisätäksesi Document Intelligence -palvelun:

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

### Step 3.2: Environment-Specific Configurations

**Parhaat käytännöt**: Eri kokoonpanot kehitystä ja tuotantoa varten.

1. **Luo production-ympäristö:**
```bash
azd env new myai-production
```

2. **Aseta tuotantokohtaiset parametrit:**
```bash
# Tuotannossa käytetään tyypillisesti korkeamman tason SKU:ja
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Ota käyttöön lisäturvaominaisuuksia
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Lab Exercise 3.1: Cost Optimization**

**Haaste**: Konfiguroi malli kustannustehokkaaseen kehityskäyttöön.

**Tehtävät:**
1. Tunnista mitkä SKUt voidaan asettaa free/basic-tasoille
2. Konfiguroi ympäristömuuttujat minimoidaksesi kustannukset
3. Ota käyttöön ja vertaa kustannuksia tuotantokonfiguraatioon

**Ratkaisuvinkkejä:**
- Käytä F0 (free) -tasoa Cognitive Servicesissa, kun mahdollista
- Käytä Basic-tasoa Search Service -palvelussa kehityksessä
- Harkitse Consumption-suunnitelmaa Functionsille

## Module 4: Security and Production Best Practices

### Step 4.1: Secure Credential Management

**Nykyinen haaste**: Monet AI-sovellukset kovakoodavaat API-avaimia tai käyttävät epävarmaa tallennusta.

**AZD-ratkaisu**: Managed Identity + Key Vault -integraatio.

1. **Tarkastele turvallisuusasetuksia mallipohjassasi:**
```bash
# Etsi Key Vaultin ja Managed Identityn määritykset
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että Managed Identity toimii:**
```bash
# Tarkista, onko verkkosovelluksen identiteettiasetukset oikein
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Step 4.2: Network Security

1. **Ota private endpointit käyttöön** (jos eivät ole jo konfiguroitu):

Lisää bicep-malliin:
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

### Step 4.3: Monitoring and Observability

1. **Konfiguroi Application Insights:**
```bash
# Application Insights tulisi konfiguroida automaattisesti
# Tarkista konfiguraatio:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Ota käyttöön AI-spesifinen valvonta:**

Lisää mukautetut mittarit AI-operaatioille:
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

### **Lab Exercise 4.1: Security Audit**

**Tehtävä**: Tarkista julkaisu turvallisuuden parhaiden käytäntöjen mukaisesti.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Managed Identity palveluiden väliseen autentikointiin
- [ ] Key Vault tallentaa arkaluonteisen konfiguraation
- [ ] Verkon pääsy on asianmukaisesti rajoitettu
- [ ] Valvonta ja lokitus on otettu käyttöön

## Module 5: Converting Your Own AI Application

### Step 5.1: Assessment Worksheet

**Ennen sovelluksen muuntamista**, vastaa näihin kysymyksiin:

1. **Sovelluksen arkkitehtuuri:**
   - Mitä AI-palveluja sovelluksesi käyttää?
   - Mitä laskentaresursseja se tarvitsee?
   - Tarvitseeko se tietokantaa?
   - Mitkä ovat palveluiden väliset riippuvuudet?

2. **Turvallisuusvaatimukset:**
   - Millaisia arkaluonteisia tietoja sovelluksesi käsittelee?
   - Mitkä vaatimukset noudatettavuudessa (compliance) sinulla on?
   - Tarvitsetko yksityisverkon?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuormitus?
   - Tarvitsetko automaattisen skaalaamisen?
   - Onko alueellisia vaatimuksia?

### Step 5.2: Create Your AZD Template

**Seuraa tätä kaavaa muuntaaksesi sovelluksesi:**

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

### **Lab Exercise 5.1: Template Creation Challenge**

**Haaste**: Luo AZD-mallipohja dokumenttien käsittelyä varten AI-sovellukselle.

**Vaatimukset:**
- Microsoft Foundry Models sisällön analysointiin
- Document Intelligence OCR:ää varten
- Storage Account asiakirjojen latauksia varten
- Function App käsittelylogiikalle
- Web-sovellus käyttöliittymälle

**Lisäpisteitä:**
- Lisää asianmukainen virheenkäsittely
- Sisällytä kustannusarvio
- Aseta valvontadashboardit

## Module 6: Troubleshooting Common Issues

### Common Deployment Issues

#### Issue 1: OpenAI Service Quota Exceeded
**Oireet:** Julkaisu epäonnistuu quota-virheellä
**Ratkaisut:**
```bash
# Tarkista nykyiset kiintiöt
az cognitiveservices usage list --location eastus

# Pyydä kiintiön korotusta tai kokeile eri aluetta
azd env set AZURE_LOCATION westus2
azd up
```

#### Issue 2: Model Not Available in Region
**Oireet:** AI-vastaukset epäonnistuvat tai mallin käyttöönotto virheilee
**Ratkaisut:**
```bash
# Tarkista mallin saatavuus alueittain
az cognitiveservices model list --location eastus

# Päivitä saatavilla olevaan malliin
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Issue 3: Permission Issues
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

### Performance Issues

#### Issue 4: Slow AI Responses
**Tutkimusvaiheet:**
1. Tarkista Application Insights -suorituskykymittarit
2. Tarkastele OpenAI-palvelun mittareita Azure-portaalissa
3. Varmista verkkoyhteydet ja latenssi

**Ratkaisut:**
- Toteuta välimuisti yleisille kyselyille
- Käytä tarkoitukseen sopivaa OpenAI-mallia
- Harkitse read-replikoita korkeaan kuormitukseen

### **Lab Exercise 6.1: Debugging Challenge**

**Skenaario**: Julkaisu onnistui, mutta sovellus palauttaa 500-virheitä.

**Vianetsintätehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluiden yhteydet
3. Testaa autentikointi
4. Tarkista konfiguraatio

**Käytettävät työkalut:**
- `azd show` julkaisun yleiskatsaukseen
- Azure-portaali yksityiskohtaisiin palvelulokeihin
- Application Insights sovellustelemetrialle

## Module 7: Monitoring and Optimization

### Step 7.1: Set Up Comprehensive Monitoring

1. **Luo mukautetut dashboardit:**

Siirry Azure-portaaliin ja luo dashboard, joka sisältää:
- OpenAI-pyyntöjen määrä ja latenssi
- Sovelluksen virheprosentit
- Resurssien käyttöasteet
- Kustannusseuranta

2. **Aseta hälytykset:**
```bash
# Hälytys korkeasta virheprosentista
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Step 7.2: Cost Optimization

1. **Analysoi nykyiset kustannukset:**
```bash
# Käytä Azure CLI:tä saadaksesi kustannustiedot
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Ota käyttöön kustannusvalvonta:**
- Aseta budjettihälytykset
- Käytä autoscaling-politiikkoja
- Toteuta pyyntöjen välimuistitus
- Seuraa OpenAI-tokenien käyttöä

### **Lab Exercise 7.1: Performance Optimization**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Mittarit, joita parantaa:**
- Keskivasteajan vähentäminen 20%
- Kuukausikustannusten vähentäminen 15%
- Säilytä 99,9 % käyttöaika

**Strategioita kokeiltavaksi:**
- Toteuta vastausten välimuisti
- Optimoi promptit tokenien tehokkuuden parantamiseksi
- Käytä tarkoituksenmukaisia compute-SKUja
- Aseta asianmukainen autoscaling

## Final Challenge: End-to-End Implementation

### Challenge Scenario

Tehtäväsi on luoda tuotantovalmiiksi tarkoitettu AI-asiakaspalveluchatbot näillä vaatimuksilla:

**Toiminnalliset vaatimukset:**
- Web-käyttöliittymä asiakaskohtaamisille
- Integraatio Microsoft Foundry Models -palveluun vastauksia varten
- Dokumenttihaku Cognitive Searchin avulla
- Integraatio olemassa olevaan asiakastietokantaan
- Monikielituki

**Ei-toiminnalliset vaatimukset:**
- Käsiteltävä 1000 samanaikaista käyttäjää
- 99,9 % käyttöaika SLA
- SOC 2 -yhteensopivuus
- Kustannus alle 500 $/kk
- Julkaistava useisiin ympäristöihin (dev, staging, prod)

### Implementation Steps

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-mallipohja**
3. **Toteuta turvallisuustoimenpiteet**
4. **Aseta valvonta ja hälytykset**
5. **Luo julkaisuputket**
6. **Dokumentoi ratkaisu**

### Evaluation Criteria

- ✅ **Toiminnallisuus**: Täyttääkö se kaikki vaatimukset?
- ✅ **Turvallisuus**: Onko parhaat käytännöt toteutettu?
- ✅ **Skaalautuvuus**: Kestääkö se kuorman?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin organisoitu?
- ✅ **Kustannukset**: Pysyykö se budjetissa?

## Additional Resources

### Microsoft Documentation
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Sample Templates
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Community Resources
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Completion Certificate

Onnittelut! Olet suorittanut AI Workshop Labin. Nyt sinun pitäisi pystyä:
- ✅ Muunna olemassa olevat tekoälysovellukset AZD-malleiksi
- ✅ Ota tuotantovalmiit tekoälysovellukset käyttöön
- ✅ Ota käyttöön tietoturvan parhaat käytännöt tekoälytyökuormille
- ✅ Seuraa ja optimoi tekoälysovellusten suorituskykyä
- ✅ Ratkaise yleisiä käyttöönoton ongelmia

### Seuraavat vaiheet
1. Sovella näitä malleja omiin tekoälyprojekteihisi
2. Lähetä mallipohjat takaisin yhteisölle
3. Liity Microsoft Foundryn Discordiin saadaksesi jatkuvaa tukea
4. Tutki edistyneitä aiheita, kuten monialuekäyttöönotot

---

**Työpajan palaute**: Auta meitä parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundry Discordin #Azure-kanavalla](https://discord.gg/microsoft-azure).

---

**Luvunavigointi:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - Tekoälylähtöinen kehitys
- **⬅️ Edellinen**: [Tekoälymallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon tekoälyn parhaat käytännöt](production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskustelua AZD:stä ja tekoälyn käyttöönotosta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty tekoälypohjaisen käännöspalvelun [Co-op Translator](https://github.com/Azure/co-op-translator) avulla. Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulee pitää auktoritatiivisena lähteenä. Kriittisissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään väärinymmärryksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->