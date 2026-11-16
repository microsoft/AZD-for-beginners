# AI töötuba: Teie AI lahenduste AZD-lahendatavaks tegemine

**Lõigu navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune lõik**: Lõik 2 - AI-esmase arenduse
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmises AI parimad tavad](../chapter-08-production/production-ai-practices.md)
- **🚀 Järgmine lõik**: [Lõik 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Töötuba ülevaade

See praktiline lab juhendab arendajaid olemasoleva AI-malli kasutuselevõtul ja selle juurutamisel Azure Developer CLI (AZD) abil. Õpite tootmises AI juurutamiseks olulisi mustreid Microsoft Foundry teenuseid kasutades.

> **Väljalaske ülevaade (2026-11-04):** AZD käsu juhised ja näidiskonfiguratsiooni nimed kontrolliti `azd` `1.37.2` väljaande ja seotud näidise kehtiva konfiguratsiooni vastu. See on dokumentatsiooni ülevaade, mitte reaalajas juurutamise valideerimine. RAG labor ei nõua agentlaiendust; agentide hindamisel kasutage eraldi `azure.ai.evaluations` laiendust ja [praegust hindamisvoogu](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), mitte pärandagentide hindamiskäske.

**Kestus:** 2-3 tundi  
**Tase:** Kesktase  
**Eeltingimused:** Põhitõed Azure’st, AI/ML mõistete tundmine

## 🎓 Õpieesmärgid

Selle töötuba lõpuks oskate:
- ✅ Uurida olemasolevat AI AZD malli ja planeerida oma rakenduse konverteerimist
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD abil
- ✅ Rakendada turvalist tunnuste haldamist AI teenustele
- ✅ Juurutada AI viiterakendus koos monitooringuga
- ✅ Lahendada tavalisi AI juurutamise probleeme

## Eeltingimused

### Vajalikud tööriistad
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) installitud
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) installitud
- [Git](https://git-scm.com/) installitud
- Koodiredaktor (soovitatavalt VS Code)

Need käsud on kirjutatud Bash süntaksis (sh. ka rea jätkamine ja `grep`). Windowsis kasuta Git Bash/WSLi või tõlgi need PowerShelli. Installeeri ka keel, paketihaldur ja konteineritööriistad, mis on loetletud [näidise kohalikus keskkonna seadistuses](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure ressursid
- Azure tellimus sobivate õigustega ressursside loomisel ja rollide määramisel (üksik Autor ei saa luua RBAC määranguid; kasuta volitatud rollihaldurit või näidises dokumenteeritud ekvivalentset rolli)
- Juurdepääs Microsoft Foundry mudelite teenustele (või võimalik taotleda juurdepääsu)
- Õigused ressursigrupi loomiseks

### Teadmiste eelteadmised
- Põhiteadmised Azure teenustest
- Käsurealiideste tundmine
- AI/ML põhikontseptsioonide tundmine (API-d, mudelid, päringud)

## Labi seadistamine

### Samm 1: Keskkonna ettevalmistamine

1. **Kontrolli tööriistade installatsiooni:**
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

Kui töötad mitme rentniku vahel või tellimus ei ole automaatselt leitav, proovi uuesti `azd auth login --tenant-id <tenant-id>`.

2. **Klooni töötuba hoidla:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI rakendustele

### AI valmis AZD malli anatoomia

Uuri AI-valmis AZD malli põhifaile:

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

Kontrollitud näidis võidakse muuta; `.azure/` ilmub pärast keskkonna initsialiseerimist, mitte tingimata värske klooni puhul. Uuri reaalseid faile, mitte ära loo puuduvad kaustad selle skeemi järgimiseks.

### **Labiharjutus 1.1: Konfiguratsiooni uurimine**

1. **Uuri azure.yaml faili:**
```bash
cat azure.yaml
```

**Millele tähelepanu pöörata:**
- AI komponentide teenuse määratlused
- Keskkonnamuutujate kaardistused
- Hostide konfiguratsioonid

2. **Vaata main.bicep infrastruktuuri:**
```bash
cat infra/main.bicep
```

**Olulised AI mustrid, mida märgata:**
- Microsoft Foundry mudelite teenuse loomine
- Azure AI Search integreerimine
- Turvaline võtmehaldus
- Võrgu turvakonfiguratsioonid

### **Arutelu: Miks need mustrid on AI jaoks olulised**

- **Teenuste sõltuvused**: AI rakendused vajavad tihti koordineeritud teenuseid
- **Turvalisus**: API võtmeid ja lõpp-punkte tuleb turvaliselt hallata
- **Skaalautuvus**: AI töökoormustel on spetsiifilised skaleerimisvajadused
- **Kuluhaldus**: AI teenused võivad olla kallid, kui neid pole korralikult konfigureeritud

## Moodul 2: Tee oma esimene AI rakendus juurutus

### Samm 2.1: Keskkonna initsialiseerimine

1. **Loo uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Sea vajalikud parameetrid:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### Samm 2.2: Juuruta infrastruktuur ja rakendus

1. **Juuruta AZD-ga:**
```bash
azd up
```

**Mis toimub `azd up` ajal:**
- ✅ Microsoft Foundry mudelite teenuse loomine
- ✅ Azure AI Search teenuse loomine
- ✅ Azure Container Apps seadistamine backend’ile ja kaasatud frontend’ile (näidise vaikeseade)
- ✅ Võrgu ja turbe seadistamine
- ✅ Rakenduse koodi juurutamine
- ✅ Monitooringu ja logimise seadistamine

2. **Jälgi juurutuse edenemist** ja pane tähele loodavaid ressursse.

### Samm 2.3: Kontrolli oma juurutust

1. **Kontrolli juurutatud ressursse:**
```bash
azd show
```

2. **Ava juurutatud rakendus:**
```bash
azd show
```

Ava veebilõpp-punkt, mis kuvatakse `azd show` väljundis.

3. **Testi AI funktsionaalsust:**
   - Navigeeri veebi rakendusse
   - Proovi näidispäringuid
   - Kontrolli, et AI vastused töötavad

### **Labiharjutus 2.1: Tõrkeotsingu praktika**

**Stsenaarium**: Sinu juurutus õnnestus, kuid AI ei reageeri.

**Tavalised probleemid, mida kontrollida:**
1. **Autentimine**: Kontrolli hallatud identiteedi ja rollimäärajate kehtivust; API võtmeid vaata ainult siis kui oled eraldi lülitanud võtmebaase autentimist
2. **Mudeli kättesaadavus**: Kontrolli kas regioon toetab mudelit
3. **Võrguühendus**: Veendu, et teenused saavad omavahel suhelda
4. **RBAC õigused**: Kontrolli, et rakendus pääseb OpenAI teenusele ligi

**Tõrkeotsingu käsud:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: Kohanda AI rakendusi vastavalt vajadustele

### Samm 3.1: Muuda AI konfiguratsiooni

1. **Uuenda OpenAI mudelit:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Lisa täiendavad AI teenused:**

Muuda `infra/main.bicep` lisamaks Document Intelligence’i:

Järgmine on illustreeriv fragment, mitte täielik mall. Näidis võib juba luua dokumendi töötlemise teenuseid: enne dubleerivate ressursside lisamist vaata üle praegune infrastruktuur. Kohandused nõuavad väljundite, identiteetide ja rakenduse konfiguratsiooni sidumist.

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

### Samm 3.2: Keskkonnaspetsiifilised konfiguratsioonid

**Parim tava**: Erinevad konfiguratsioonid arenduseks ja tootmiseks.

1. **Loo tootmiskeskkond:**
```bash
azd env new myai-production
```

2. **Määra tootmiskeskkonna parameetrid:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Need nimed pärinevad näidise [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json)-st. `azd env set` hoiab väärtust, kuid ei tee suvalist muutuja kasutust efektiivseks: malli peab seda tarbima. Enne avaliku juurdepääsu keelamist vaata näidise [võrgu isoleerimise juhendit](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ja kasuta `azd up` infrastruktuuri muudatuste rakendamiseks. OpenAI SKU `S0` ainult ei määra mudeli läbilaskevõimet; oluline on ka mudeli juurutustiil ja maht.

### **Labiharjutus 3.1: Kulu optimeerimine**

**Väljakutse**: Konfigureeri mall kuluefektiivseks arenduseks.

**Tööd:**
1. Vali töötoa ajutine keskkond: `azd env select myai-workshop`.
2. Kirjuta üles praegune Search SKU ja mudeli maht `infra/main.parameters.json` ja valitud keskkonnast.
3. Kasuta allpool toetatud sisendeid, pärast mudeli/regiooni koormuse kinnitamist:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Kontrolli portaalis Search SKU ja juurutusmahtu ning hinda erinevust hinnakalkulaatoriga. Ärge oodake arveldusandmete kohest uuendust.

**Õnnestumiskriteeriumid:** Search kasutab Basic’i, chati juurutus on nõutud toetatud mahuga ja rakendus vastab veel näidisküsimusele. Mahu `10` ei tähenda märgi hinna allahindlust, vaid läbilaske kiiruse limiiti. Search taseme muutused võivad olla piiratud või nõuda uut loomist; ärge eksperimenteerige tootmisressurssidega. F0 on teenuspõhine ega ole Azure OpenAI mudeli SKU.

## Moodul 4: Turvalisus ja tootmise parimad tavad

### Samm 4.1: Turvaline tunnuste haldus

**Praegune probleem:** Paljud AI rakendused kodeerivad API võtmed kõvaks või kasutavad ebaturvalist salvestust.

**AZD lahendus:** Hallatud identiteet + Key Vault integreerimine.

1. **Vaata oma malli turvakonfiguratsiooni:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrolli, et hallatud identiteet töötab:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrgu turvalisus

1. **Luba privaatlõpp-punktid** näidise toetatud võrgukonfiguratsiooni alusel (kui neid pole juba seadistatud).

Oma malli jaoks näitlik fragmendi näide OpenAI lõpp-punkti ühendusest. Vajab ka VNet’i, privaatset DNS konfiguratsiooni ja rakenduste ühenduvust; ära kleebi seda muutmata näidisse, millel on juba privaatlõpp-punkti moodulid:
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

### Samm 4.3: Monitooring ja jälgitavus

1. **Konfigureeri Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Luba näidise Application Insights integratsioon:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Näidise instrumendid saadavad telemeetria; suvaline `OPENAI_MONITOR_ENABLED` seadistus ei lülita AI mõõdikuid sisse. Vaata mudele kõnesid, latentsusaega, ebaõnnestumisi ja märgi kasutust, ja väldi tundlike päringute või vastuste salvestamist.

### **Labiharjutus 4.1: Turbeaudiit**

**Ülesanne:** Vaata üle oma juurutus turvalisuse parimate tavade osas.

**Kontrollnimekiri:**
- [ ] Koodis ega konfiguratsioonis pole kõva kodeeritud saladusi
- [ ] Hallatud identiteet teenus-teenuse autentimiseks
- [ ] Key Vault hoiab tundlikku konfiguratsiooni
- [ ] Võrgu juurdepääs on korrektselt piiratud
- [ ] Monitooring ja logimine on lubatud

## Moodul 5: Oma AI rakenduse konverteerimine

### Samm 5.1: Hindamistõmmis

**Enne oma rakenduse konverteerimist** vasta nendele küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid su rakendus kasutab?
   - Milliseid arvutusressursse ta vajab?
   - Kas ta vajab andmebaasi?
   - Millised on teenustevahelised sõltuvused?

2. **Turvanõuded:**
   - Millist tundlikku infot su rakendus haldab?
   - Milliseid vastavusnõudeid on?
   - Kas vajad privaatvõrku?

3. **Skaalautumise nõuded:**
   - Milline on oodatav koormus?
   - Kas vajad automaatset skaaleerimist?
   - Kas on regioonispetsiifilisi nõudeid?

### Samm 5.2: Loo oma AZD mall

**Järgi seda mustrit oma rakenduse konverteerimisel:**

**Skelett ainult:** See osa ei anna API/veebirakenduse lähtekoodi, hosti infrastruktuuri, mudelijuurutusi, identiteeti/RBAC ega valmiskujulist `main.parameters.json`. Ressursigrupile scoped Bicep näitab mooduli koostamist; tüüpiline AZD tellimusel scoped alguspunkt peab looma ressursigrupi ja kutsuma seda vastaval tasemel. Ära eelda, et `azd up` juurutab täieliku rakenduse, kui kopeerid ainult neid fragmente. Käidavale lähtepunktile kasuta edasi RAG malli Moodulist 1.

1. **Loo põhiline struktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
```

2. **Loo azure.yaml:**
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

3. **Loo infrastruktuuri mallid:**

**infra/main.bicep** - Põhimall:
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

**infra/modules/openai.bicep** - OpenAI moodul:
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

### **Labiharjutus 5.1: Malli loomise väljakutse**

**Väljakutse:** Loo AZD mall dokumenditöötluse AI-rakendusele.

**Nõuded:**
- Microsoft Foundry mudelid sisuanalüüsiks
- Document Intelligence OCR jaoks
- Salvestuskonto dokumentide üleslaadimiseks
- Funktsioonirakendus töötlemise loogikaks
- Veebirakendus kasutajaliidese jaoks

**Boonuspunktid:**
- Lisa korralik veahaldus
- Kaasa kulu hinnang
- Loo monitooringu armatuurlauad

## Moodul 6: Sageli esinevate vigade tõrkeotsing

### Tavalised juurutamisprobleemid

#### Probleem 1: OpenAI teenuse limiidi ületamine
**Sümptomid:** Juurutus ebaõnnestub limiitiviga veaga
**Lahendused:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole regioonis saadaval
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutusvead
**Lahendused:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Probleem 3: Õiguste probleemid
**Sümptomid:** 403 keelatud vead AI teenuste pöördumisel
**Lahendused:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Jõudlusprobleemid

#### Probleem 4: AI vastused on aeglased
**Uurimissammud:**
1. Kontrolli Application Insights jõudlusmõõdikuid
2. Vaata OpenAI teenuse mõõdikuid Azure portaali kaudu
3. Kinnita võrguühendust ja latentsust

**Lahendused:**
- Rakenda vahemällu salvestus sagedaste päringute jaoks
- Kasuta sobivat OpenAI mudelit oma kasutusjuhtumile
- Skaaleeri rakenduse koopiad alles pärast mudeli RPM/TPM piiride kontrolli; Azure OpenAI juurutused ei paku üldist andmebaasilist "read replica" seadet

### **Labiharjutus 6.1: Tõrkeotsingu väljakutse**

**Stsenaarium:** Juurutus õnnestus, kuid rakendus tagastab 500 vigu.

**Tõrkeotsingu ülesanded:**
1. Kontrolli rakenduse logisid
2. Kontrolli teenuste ühenduvust
3. Autentimise testimine
4. Konfiguratsiooni ülevaatus

**Kasutatavad tööriistad:**
- `azd show` juurutuse ülevaate jaoks
- Azure portaal üksikasjalike teenuselogide jaoks
- Application Insights rakenduse telemeetria jaoks

## Moodul 7: Jälgimine ja optimeerimine

### Samm 7.1: Põhjaliku jälgimise seadistamine

1. **Loo kohandatud juhtpaneelid:**

Liigu Azure portaali ja loo juhtpaneel järgmistega:
- OpenAI taotluste arv ja latentsus
- Rakenduse veamäärad
- Ressursside kasutus
- Kulude jälgimine

2. **Sea teavitused:**
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

Kontrolli, kas komponent edastab taotluste telemeetriat, ja lisa teavitusrühm, kui teated on vajalikud. Määr on arv, mitte tõrkete protsent; määra teate jaoks on vaja sobivat päringut ja nimetajat.

### Samm 7.2: Kulude optimeerimine

1. **Analüüsi praeguseid kulusid:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Asenda kuupäeva kohatäited. Tarbimis-API tugi varieerub arvelduslepingu järgi; kui kasutusandmed puuduvad, kasuta portaali Kulu haldamist. Kulud kajastuvad viivitusega, need ei ole reaalajas testimisallikas.

2. **Rakenda kulukontrollid:**
- Sea eelarvateavitused
- Kasuta automaatse skaleerimise poliitikaid
- Rakenda taotluste vahemällu salvestamine
- Jälgi OpenAI tokenite kasutust

### **Labori harjutus 7.1: Tulemuste optimeerimine**

**Ülesanne**: Optimeeri oma tehisintellekti rakendus nii jõudluse kui ka kulu osas.

**Parandatavad mõõdikud:**
- Vähenda keskmist vastuseaega 20% võrra
- Vähenda kuu kulusid 15% võrra
- Määra 99,9% töökindluse SLO ja mõõtmise aken (lühike labor ei saa kuu tööaja täituvust demonstreerida)

**Proovi järgmisi strateegiaid:**
- Rakenda vastuste vahemällu salvestamist
- Optimeeri päringuid tokenite tõhususe jaoks
- Kasuta sobivaid arvutusvõimsuse SKU-sid
- Sea puhas automaatne skaleerimine

## Lõplik väljakutse: Terviklik rakendus

### Väljakutse stsenaarium

See on **valikuline arhitektuuri/disaini väljakutse**, mitte käitatav harjutus ega tootmise sertifikaat. Paku välja AI-põhine klienditeeninduse vestlusrobot ja dokumenteeri, millised nõuded vajavad edasist rakendamist ja tõestamist:

**Funktsionaalsed nõuded:**
- Veebiliides kliendisuhtluseks
- Integratsioon Microsoft Foundry mudelitega vastuste jaoks
- Dokumendipõhine otsing Azure AI Search abil
- Integreerimine olemasoleva kliendibaasiga
- Mitmekeelne tugi

**Mittefunktsionaalsed nõuded:**
- 1000 samaaegset kasutajat
- 99,9% tööaja SLA
- SOC 2 nõuetele vastavus
- Kulu alla 500 USD kuus
- Paigalda mitmesse keskkonda (arendus, testimine, tootmine)

Need on hüpoteetilised sidusrühmade piirangud, mitte korraga tagatud tulemused. Määra taotluste maht, päringu/vastuse suurused ja sessiooni kestus enne kulude hindamist; 1000 samaaegset kasutajat ei defineeri töökoormust ega tõesta 500 dollari eelarve teostatavust. SOC 2 on organisatsiooni audititulemus, mitte AZD malli poolt lubatav lüliti. Leia kompromissid ja jäta teostamatud piirangud tõenditega kõrvale.

### Rakendamise sammud

1. **Määra arhitektuur**
2. **Loo AZD mall**
3. **Rakenda turvameetmed**
4. **Sea üles jälgimine ja teavitamine**
5. **Loo juurutuskanalid**
6. **Dokumenteeri lahendus**

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus**: Kas rakendatud võimeid on demonstreeritud ja jäänud puudujäägid selgelt välja toodud?
- ✅ **Turvalisus**: Kas praktikad on rakendatud?
- ✅ **Skaalautuvus**: Kas see suudab koormusega toime tulla?
- ✅ **Hooldatavus**: Kas kood ja infrastruktuur on hästi korraldatud?
- ✅ **Kulu**: Kas püsitakse eelarves?

## Lisamaterjalid

### Microsofti dokumentatsioon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Lõpetamise kontrollpunkt

Palju õnne! Olete lõpetanud AI töötoa labori. Nüüd peaksite olema võimeline:

- ✅ Selgitama, kuidas kohandada olemasolevat AI rakendust AZD mallile
- ✅ Juhtima ja testima AI referentsrakendust
- ✅ Rakendama turvaliseimad praktikad AI töökoormuste jaoks
- ✅ Jälgima ja optimeerima AI rakenduse jõudlust
- ✅ Lahendama levinud juurutusprobleeme

**Puhastamine:** Käivita `azd env list`, vali iga selles laboris loodud kasutusvalmis keskkond (`myai-workshop`, ja kui paigaldatud `myai-production`/`myai-quota-test`), ning käivita `azd down` neis. Vaata kustutuskava üle; keskkonna lokaalse konfiguratsiooni kustutamine üksi ei kustuta Azure ressursse. Vältida `--purge`, kui ei ole teadlik pöördumatust pehmelt kustutatud ressursside eemaldamisest.

### Edasised sammud
1. Rakenda neid mustreid oma AI projektides
2. Panusta kogukonnale mallitena tagasi
3. Liitu Microsoft Foundry Discordi kanaliga pideva toe saamiseks
4. Uuri edasijõudnutele mõeldud teemasid nagu mitmeregioonilised juurutused

---

**Töötoa tagasiside**: Aita meil parandada seda töötoast, jagades oma kogemust [Microsoft Foundry Discord #Azure kanalil](https://discord.gg/microsoft-azure).

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmane arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmisalased AI parimad tavad](../chapter-08-production/production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vajad abi?** Liitu meie kogukonnaga, et saada tuge ja arutelusid AZD ja AI juurutuste kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->