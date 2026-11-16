# AI-työpajalaki: Tee AI-ratkaisuistasi AZD-jakelukelpoisia

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-etusijainen kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [Tuotannon AI:n parhaat käytännöt](../chapter-08-production/production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Konfigurointi](../chapter-03-configuration/configuration.md)

## Työpajan yleiskatsaus

Tämä käytännön laboharjoitus ohjaa kehittäjiä prosessissa, jossa otetaan olemassa oleva AI-malli ja otetaan se käyttöön Azure Developer CLI:n (AZD) avulla. Opit olennaiset mallit tuotantoon tarkoitetuissa AI-käyttöönotossa Microsoft Foundry -palveluja hyödyntäen.

> **Julkaisukatsaus (2026-11-04):** AZD-komentojen ohjeistus ja esimerkkikonfiguraation nimet tarkistettiin `azd` `1.37.2` -julkaisua ja linkitetyn esimerkin nykyistä konfiguraatiota vastaan. Tämä on dokumentaation tarkastus, ei suora käyttöönoton validointi. RAG-lab ei vaadi agenttilekistiä; agentin arviointiin käytä erillistä `azure.ai.evaluations` -laajennusta ja [nykyistä arviointityönkulkua](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), älä vanhoja agentin arviointikäskyjä.

**Kesto:** 2–3 tuntia  
**Taso:** Keskitaso  
**Ennakkovaatimukset:** Perustiedot Azuresta, tuttuus AI/ML-käsitteisiin

## 🎓 Oppimistavoitteet

Tämän työpajan lopuksi osaat:
- ✅ Tutkia olemassa olevaa AI AZD-mallia ja suunnitella oman sovelluksesi muunnos
- ✅ Konfiguroida Microsoft Foundry -palveluja AZD:n avulla
- ✅ Toteuttaa turvallinen tunnistetietojen hallinta AI-palveluille
- ✅ Ota käyttöön AI-viiteohjelma valvonnalla
- ✅ Vianetsintä yleisissä AI-käyttöönoton ongelmissa

## Ennakkovaatimukset

### Vaadittavat työkalut
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) asennettuna
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) asennettuna
- [Git](https://git-scm.com/) asennettuna
- Koodieditori (VS Code suositeltu)

Nämä komentolohkot käyttävät Bash-syntaksia (sisältäen rivinjatkoksia ja `grep`). Windowsissa käytä Git Bash/WSL:ää tai muunna komentojen syntaksi PowerShelliksi. Asenna myös kieli-, paketinhallinta- ja konttityökalut, jotka on listattu [esimerkin paikallisessa ympäristön asetuksessa](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure-resurssit
- Azure-tilaus, jossa on resurssien provisionointioikeudet ja roolien määritysoikeudet (pelkkä Contributor ei pysty luomaan RBAC-määrityksiä; käytä valtuutettua roolihallinnoijaa tai esimerkin dokumentoitua vastaavuutta)
- Pääsy Microsoft Foundry Models -palveluihin (tai mahdollisuus pyytää pääsyä)
- Oikeudet resurssiryhmän luomiseen

### Tietoennakkovaatimukset
- Perustiedot Azuren palveluista
- Komentorivikäyttöliittymien tuntemus
- Perustiedot AI/ML-käsitteistä (API:t, mallit, kyselyt)

## Labin valmistelu

### Vaihe 1: Ympäristön valmistelu

1. **Varmista työkalujen asennukset:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure for AZD workflows
azd auth login

# Login to Azure CLI only if you plan to run az commands during diagnostics
az login
```

Jos työskentelet useilla vuokralaisilla tai tilaus ei tunnistu automaattisesti, kokeile uudelleen komennolla `azd auth login --tenant-id <tenant-id>`.

2. **Kloonaa työpajan git-repository:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moduuli 1: AZD-rakenteen ymmärtäminen AI-sovelluksille

### AI AZD -mallin anatomia

Tutki AI-valmiin AZD-mallin keskeisiä tiedostoja:

```
azure-search-openai-demo/
├── azure.yaml              # AZD configuration
├── infra/                   # Infrastructure as Code
│   ├── main.bicep          # Main infrastructure template
│   ├── main.parameters.json # Environment parameters
│   ├── core/               # Shared infrastructure modules
│   └── app/                # Application-specific infrastructure
├── app/                    # Backend, frontend, and optional ingestion functions
├── scripts/               # Deployment scripts
└── .azure/               # AZD environment files
```

Tarkistettu esimerkki voi muuttua; `.azure/` ilmestyy ympäristön alustuksen jälkeen, ei välttämättä tuoreeseen klooniin. Tarkastele todellista checkout-tilaa äläkä luo puuttuvia hakemistoja vastaamaan kaaviota.

### **Lab -harjoitus 1.1: Tutki konfiguraatiota**

1. **Tutki azure.yaml-tiedostoa:**
```bash
cat azure.yaml
```

**Mihin kiinnittää huomiota:**
- AI-komponenttien palvelumääritykset
- Ympäristömuuttujien kartoitus
- Isäntäkoneiden asetukset

2. **Käy läpi main.bicep infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Keskeiset AI-mallit tunnistettavaksi:**
- Microsoft Foundry Models -palvelun provisionointi
- Azure AI Search -integraatio
- Turvallinen avainhallinta
- Verkon suojausasetukset

### **Keskustelun aihe:** Miksi nämä mallit ovat tärkeitä AI:lle

- **Palvelujen riippuvuudet**: AI-sovellukset vaativat usein useita koordinoituja palveluja
- **Turvallisuus**: API-avaimia ja päätepisteitä tulee hallita turvallisesti
- **Skaalautuvuus**: AI-kuormituksilla on ainutlaatuiset skaalavaatimukset
- **Kustannusten hallinta**: AI-palvelut voivat olla kalliita, jos niitä ei konfiguroida oikein

## Moduuli 2: Ensimmäisen AI-sovelluksesi käyttöönotto

### Vaihe 2.1: Ympäristön alustus

1. **Luo uusi AZD-ympäristö:**
```bash
azd env new myai-workshop
```

2. **Määritä vaaditut parametrit:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Vaihe 2.2: Infrastruktuurin ja sovelluksen käyttöönotto

1. **Ota käyttöön AZD:llä:**
```bash
azd up
```

**Mitä tapahtuu `azd up` aikana:**
- ✅ Provisionoi Microsoft Foundry Models -palvelu
- ✅ Luo Azure AI Search -palvelu
- ✅ Määrittää Azure Container Apps -takapään ja mukana pakatun frontendin (nykyinen esimerkin oletus)
- ✅ Konfiguroi verkotus ja turvallisuus
- ✅ Ottaa sovelluskoodi käyttöön
- ✅ Ottaa käyttöön valvonta ja lokitus

2. **Seuraa käyttöönoton etenemistä** ja huomioi luodut resurssit.

### Vaihe 2.3: Tarkista käyttöönotto

1. **Tarkista otetut resurssit:**
```bash
azd show
```

2. **Avaa käyttöön otettu sovellus:**
```bash
azd show
```

Avaa verkkopäätepiste, joka näkyy `azd show`-tulosteessa.

3. **Testaa AI-toiminnallisuutta:**
   - Siirry web-sovellukseen
   - Kokeile esimerkkikyselyjä
   - Varmista, että AI vastaa oikein

### **Lab -harjoitus 2.1: Vianetsintäharjoitus**

**Tilanne:** Käyttöönotto onnistui, mutta AI ei vastaa.

**Tarkistettavat yleiset ongelmat:**
1. **Todennus**: Varmista hallinnoitu identiteetti ja roolimääritykset; API-avaimia tarkista vain, jos olet tietoisesti ottanut avainpohjaisen todennuksen käyttöön
2. **Mallin saatavuus**: Tarkista, tukeeko alue malliasi
3. **Verkkoyhteys**: Varmista palvelujen välinen kommunikointi
4. **RBAC-oikeudet**: Tarkista, että sovellus pääsee OpenAI:hin

**Debuggauskomennot:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moduuli 3: AI-sovellusten mukauttaminen tarpeisiisi

### Vaihe 3.1: AI-konfiguraation muokkaaminen

1. **Päivitä OpenAI-malli:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Lisää lisä-AI-palveluja:**

Muokkaa `infra/main.bicep` lisätäksesi Document Intelligence:

Alla on kuvaava fragmentti, ei täydellinen malli. Esimerkin malli voi jo provisionoida dokumenttien käsittelyyn liittyviä palveluja: tarkista nykyinen infrastruktuuri ennen päällekkäisten resurssien lisäämistä. Mukautukset vaativat tulosteiden, identiteettien ja sovelluskonfiguraation yhteensovittamista.

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

**Hyvä käytäntö**: Eri konfiguraatiot kehitykselle ja tuotannolle.

1. **Luo tuotantoympäristö:**
```bash
azd env new myai-production
```

2. **Määritä tuotantokohtaiset parametrit:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Nimet tulevat esimerkin [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json)-tiedostosta. `azd env set` tallentaa arvon, mutta ei tee satunnaista muuttujaa toimivaksi: malli sen pitää käyttää. Tarkista esimerkin [verkkoeristysopas](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ennen julkisen pääsyn estämistä, ja käytä `azd up` infrastruktuurin muutosten käyttöönottoon. OpenAI SKU `S0` yksin ei ratkaise mallin läpivirtausta; myös mallin käyttöönotto- ja kapasiteettityyppi vaikuttavat.

### **Labiharjoitus 3.1: Kustannusten optimointi**

**Haaste:** Konfiguroi malli kustannustehokkaaseen kehitykseen.

**Tehtävät:**
1. Valitse kertakäyttöinen työpajaympäristö: `azd env select myai-workshop`.
2. Kirjaa nykyinen Search SKU ja mallin kapasiteetti `infra/main.parameters.json` ja valitun ympäristön tiedoista.
3. Käytä alla olevia tuettuja syötteitä mallin/alueen kiintiön varmistamisen jälkeen:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Tarkista portaalissa Search SKU ja käyttöönoton kapasiteetti, ja arvioi ero hinnoittelulaskurilla. Älä odota laskutustietojen päivittyvän heti.

**Onnistumisen kriteerit:** Search käyttää Basicia, chat-käyttöönotolla on pyydetty kapasiteetti, ja sovellus vastaa yhä esimerkkikysymykseen. Kapasiteetti `10` on nopeusrajoituksen jako, ei token-hintojen alennus. Search-tason muutokset voidaan rajoittaa tai ne vaativat uudelleenluonnin; älä kokeile tuotantoresursseilla. F0 on palvelukohtainen eikä ole Azure OpenAI -mallin SKU.

## Moduuli 4: Turvallisuus ja tuotannon parhaat käytännöt

### Vaihe 4.1: Turvallinen tunnistetietojen hallinta

**Nykyhaaste:** Monet AI-sovellukset kovakoodaavat API-avaimia tai käyttävät turvatonta tallennusta.

**AZD-ratkaisu:** Hallinnoitu identiteetti + Key Vault -integraatio.

1. **Tarkista mallisi turvallisuuskonfigurointi:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Varmista, että hallinnoitu identiteetti toimii:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Vaihe 4.2: Verkon turvallisuus

1. **Ota käyttöön yksityiset päätepisteet** esimerkin tuetuilla verkkoasetuksilla (jos ei jo määritetty).

Oman mallisi osalta tämä kuvava fragmentti näyttää OpenAI-päätepisteyhteyden. Se vaatii myös VNetin, yksityisen DNS-konfiguraation ja sovelluksen yhteydet; älä liitä sitä sellaisenaan esimerkkiin, jossa on jo yksityis-päätepistemoduulit:
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
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Ota käyttöön esimerkin Application Insights -integraatio:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Esimerkin instrumentointi lähettää telemetriaa; satunnainen `OPENAI_MONITOR_ENABLED` ei käytä AI-mittareita. Tarkista mallikutsujen, viiveiden, virheiden ja token-käytön jäljet, ja vältä arkaluontoisten kehotteiden tai vastausten tallentamista.

### **Labiharjoitus 4.1: Turvallisuustarkastus**

**Tehtävä:** Tarkista käyttöönotto turvallisuuden parhaiden käytäntöjen mukaisesti.

**Tarkistuslista:**
- [ ] Ei kovakoodattuja salaisuuksia koodissa tai konfiguraatiossa
- [ ] Hallinnoitua identiteettiä käytetään palveluiden todennuksessa
- [ ] Key Vault tallentaa arkaluontoiset konfiguraatiot
- [ ] Verkon pääsy on kunnolla rajoitettu
- [ ] Valvonta ja lokitus ovat käytössä

## Moduuli 5: Oman AI-sovelluksen muuntaminen

### Vaihe 5.1: Arviointilomake

**Ennen sovelluksen muuntamista**, vastaa näihin kysymyksiin:

1. **Sovellusarkkitehtuuri:**
   - Mitä AI-palveluja sovelluksesi käyttää?
   - Mitä laskentaresursseja se tarvitsee?
   - Tarvitseeko se tietokantaa?
   - Mitkä ovat palvelujen riippuvuudet?

2. **Turvavaatimukset:**
   - Mitä arkaluonteista dataa sovelluksesi käsittelee?
   - Mitä vaatimuksia noudatat?
   - Tarvitsetko yksityistä verkottumista?

3. **Skaalausvaatimukset:**
   - Mikä on odotettu kuormitus?
   - Tarvitsetko automaattista skaalausta?
   - Onko alueellisia vaatimuksia?

### Vaihe 5.2: Luo AZD-mallisi

**Noudata tätä mallia sovelluksesi muuntamiseksi:**

**Pelkkä rakenne:** Tämä osio ei tarjoa API-/web-sovelluksen lähdekoodia, isäntiinfrastruktuuria, mallin käyttöönottoja, identiteettiä/RBAC:ia tai valmista `main.parameters.json`:tä. Resurssiryhmäkohtaista Bicepiä käytetään moduulikoostumuksen havainnollistamiseen; tyypillinen AZD-tilauskohtainen entry point luo resurssiryhmän ja kutsuu sitä kyseisellä laajuudella. Älä odota `azd up` käyttöönoton hoitavan koko sovellusta vain näiden fragmenttien kopioinnilla. Käytettäväksi lähtökohdaksi pidä edelleen RAG-mallia moduulista 1.

1. **Luo perusrakenne:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Labiharjoitus 5.1: Mallin luonti -haaste**

**Haaste:** Luo AZD-malli dokumenttien käsittelyyn tarkoitetulle AI-sovellukselle.

**Vaateet:**
- Microsoft Foundry Models sisällön analysointiin
- Document Intelligence OCR:ään
- Tallennustili dokumenttien lataukseen
- Function App käsittelylogiikalle
- Web-sovellus käyttöliittymälle

**Bonus-pisteet:**
- Lisää kunnollinen virheiden käsittely
- Sisällytä kustannusarvio
- Luo valvontapaneelit

## Moduuli 6: Yleisimpien ongelmien vianetsintä

### Yleisimmät käyttöönoton ongelmat

#### Ongelma 1: OpenAI-palvelun kiintiö ylittynyt
**Oireet:** Käyttöönotto epäonnistuu kiintiövirheeseen
**Ratkaisut:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Ongelma 2: Malli ei saatavilla alueella
**Oireet:** AI-vastaukset epäonnistuvat tai mallin käyttöönottovirheitä
**Ratkaisut:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Ongelma 3: Oikeusongelmat
**Oireet:** 403 Kielletty -virheitä AI-palveluita kutsuttaessa
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

#### Ongelma 4: Hitaita AI-vastauksia
**Tutkimusvaiheet:**
1. Tarkista Application Insightsin suorituskykymittarit
2. Tarkastele OpenAI-palvelun mittareita Azure-portaalissa
3. Varmista verkkoyhteys ja viiveet

**Ratkaisut:**
- Toteuta välimuisti yleisille kyselyille
- Käytä tarkoitukseen sopivaa OpenAI-mallia
- Skaalaa sovellusreplikat vasta, kun mallin RPM/ TPM -rajat on tarkistettu; Azure OpenAI -käyttöönotot eivät tarjoa yleistä tietokantatyyppistä "read replica" -asetusta

### **Labiharjoitus 6.1: Debuggaushaaste**

**Tilanne:** Käyttöönotto onnistui, mutta sovellus palauttaa 500-virheitä.

**Debuggaustehtävät:**
1. Tarkista sovelluslokit
2. Varmista palveluyhteydet
3. Testaa todennus
4. Tarkista kokoonpano

**Käytettävät työkalut:**
- `azd show` käyttöönoton yleiskatsaukseen
- Azure-portaali yksityiskohtaisiin palvelulokeihin
- Application Insights sovelluksen telemetriaan

## Moduuli 7: Valvonta ja optimointi

### Vaihe 7.1: Ota käyttöön kattava valvonta

1. **Luo mukautetut hallintapaneelit:**

Siirry Azure-portaaliin ja luo hallintapaneeli, jossa on:
- OpenAI-pyyntöjen määrä ja viive
- Sovelluksen virheprosentit
- Resurssien käyttö
- Kustannusten seuranta

2. **Määritä hälytykset:**
```bash
# Failed-request count on the Application Insights component (not a percentage)
az monitor metrics alert create \
  --name "AI-App-Failed-Requests" \
  --resource-group YOUR_RG \
  --scopes YOUR_APPLICATION_INSIGHTS_RESOURCE_ID \
  --condition "count requests/failed > 10" \
  --window-size 5m \
  --evaluation-frequency 1m \
  --description "More than 10 failed requests in five minutes"
```

Varmista, että komponentti lähettää pyyntötelemetriaa ja lisää toimintaryhmä, jos ilmoituksia tarvitaan. Mittari on laskuri, ei epäonnistumisprosentti; nopeushälytys tarvitsee sopivan kyselyn ja nimittäjän.

### Vaihe 7.2: Kustannusten optimointi

1. **Analysoi nykyiset kustannukset:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Korvaa päivämääräpaikat. Consumption API -tuki vaihtelee riippuen laskutussopimuksesta; käytä portaalin Kustannusten hallintaa, jos käyttöerittely ei ole saatavilla. Kustannukset viivästyvät, eivät ole reaaliaikainen testin tulos.

2. **Ota käyttöön kustannusvalvonta:**
- Määritä budjettihälytykset
- Käytä automaattisen skaalaamisen käytäntöjä
- Toteuta pyyntöjen välimuistitus
- Valvo OpenAI:n tokenien käyttöä

### **Labraharjoitus 7.1: Suorituskyvyn optimointi**

**Tehtävä**: Optimoi AI-sovelluksesi sekä suorituskyvyn että kustannusten osalta.

**Parannettavat mittarit:**
- Vähennä keskimääräistä vasteaikaa 20 %:lla
- Vähennä kuukausikustannuksia 15 %:lla
- Määritä 99,9 % käytettävyystasoa (SLO) ja mittausikkuna (lyhyt labra ei voi osoittaa kuukausittaista käyttöaikaa)

**Kokeiltavat strategiat:**
- Toteuta vasteen välimuistitus
- Optimoi kehotteet tokenien tehokkuudeksi
- Käytä sopivia laskentaskuja (SKU)
- Määritä asianmukainen automaattinen skaalaus

## Viimeinen haaste: End-to-End toteutus

### Haasteen skenaario

Tämä on **valinnainen arkkitehtuuri-/suunnittelutehtävä**, ei toimitettu ajettava harjoitus tai tuotantosertifiointi. Ehdota tekoälypohjainen asiakaspalveluchatbot ja dokumentoi mitkä vaatimukset vaativat lisätoimia ja todistusaineistoa:

**Toiminnalliset vaatimukset:**
- Verkkokäyttöliittymä asiakasvuorovaikutuksiin
- Integrointi Microsoft Foundry -malleihin vastauksissa
- Asiakirjahaku Azure AI Searchin avulla
- Integrointi olemassa olevaan asiakasrekisteriin
- Monikielituki

**Ei-toiminnalliset vaatimukset:**
- Käsiteltävä 1000 yhtäaikaista käyttäjää
- 99,9 % käytettävyysaika (SLA)
- SOC 2 -vaatimustenmukaisuus
- Kustannukset alle 500 dollaria kuukaudessa
- Käyttöönotto useissa ympäristöissä (kehitys, testaus, tuotanto)

Nämä ovat hypoteettisia sidosryhmien rajoitteita, eivät samanaikaisesti taattuja tuloksia. Määritä pyyntötahti, kehotteiden/lähtöjen koot ja istunnon kesto ennen kustannusarvion tekemistä; 1000 yhtäaikaista käyttäjää ei määritä kuormitusta eikä todista 500 dollarin budjetin toteutettavuutta. SOC 2 on organisaation auditointitulosta, ei AZD-mallin käynnistämä kytkin. Tunnista kompromissit ja hylkää mahdottomat rajoitukset todistein.

### Toteutusvaiheet

1. **Suunnittele arkkitehtuuri**
2. **Luo AZD-malli**
3. **Toteuta turvallisuustoimenpiteet**
4. **Ota käyttöön valvonta ja hälytykset**
5. **Luo käyttöönoton putket**
6. **Dokumentoi ratkaisu**

### Arviointikriteerit

- ✅ **Toiminnallisuus**: Ovatko toteutetut ominaisuudet osoitettu ja jäljellä olevat puutteet selkeästi esitetty?
- ✅ **Turvallisuus**: Onko parhaat käytännöt otettu käyttöön?
- ✅ **Skaalautuvuus**: Pystyykö käsittelemään kuormituksen?
- ✅ **Ylläpidettävyys**: Onko koodi ja infrastruktuuri hyvin järjestetty?
- ✅ **Kustannukset**: Pysyykö budjetissa?

## Lisäresurssit

### Microsoftin dokumentaatio
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service -dokumentaatio](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry -dokumentaatio](https://learn.microsoft.com/azure/ai-studio/)

### Mallipohjat
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Yhteisön resurssit
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Suorituksen tarkistuspiste

Onnistuit! Olet suorittanut AI-työpajaharjoituksen. Nyt sinun pitäisi pystyä:

- ✅ Selittämään, miten olemassa oleva AI-sovellus mukautetaan AZD-malliin
- ✅ Ottamaan käyttöön ja testaamaan AI-viitesovellus
- ✅ Toteuttamaan turvallisuuden parhaat käytännöt AI-kuormituksille
- ✅ Valvomaan ja optimoimaan AI-sovelluksen suorituskykyä
- ✅ Ratkomaan yleisiä käyttöönotto-ongelmia

**Siivous:** Suorita `azd env list`, valitse jokainen tässä laboratoriossa luotu tilapäinen ympäristö (`myai-workshop`, ja jos otit käyttöön `myai-production`/`myai-quota-test`), ja aja `azd down` kussakin. Tarkista poistosuunnitelma; pelkkä ympäristön paikallisen konfiguraation poistaminen ei poista Azure-resursseja. Vältä `--purge`, ellei ymmärrä irreversible մեղանելիորեն pehmeästi poistettujen resurssien poistoa.

### Seuraavat askeleet
1. Käytä näitä malleja omissa AI-projekteissasi
2. Osallistu mallipohjien palauttamiseen yhteisölle
3. Liity Microsoft Foundry Discordiin saadaksesi jatkuvaa tukea
4. Tutustu edistyneisiin aiheisiin, kuten monialuekäyttöönotot

---

**Työpajan palaute**: Autamme parantamaan tätä työpajaa jakamalla kokemuksesi [Microsoft Foundry Discord #Azure -kanavassa](https://discord.gg/microsoft-azure).

---

**Luku navigointi:**
- **📚 Kurssin aloitus**: [AZD Aloittelijoille](../../README.md)
- **📖 Nykyinen luku**: Luku 2 - AI-Ensisijainen kehitys
- **⬅️ Edellinen**: [AI-mallin käyttöönotto](ai-model-deployment.md)
- **➡️ Seuraava**: [AI-tuotannon parhaat käytännöt](../chapter-08-production/production-ai-practices.md)
- **🚀 Seuraava luku**: [Luku 3: Kokoonpano](../chapter-03-configuration/configuration.md)

**Tarvitsetko apua?** Liity yhteisöömme saadaksesi tukea ja keskusteluja AZD:n ja AI-käyttöönottojen parissa.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->