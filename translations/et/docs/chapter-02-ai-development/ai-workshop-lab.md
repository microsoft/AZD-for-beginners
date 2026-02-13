# AI Workshop Lab: Making Your AI Solutions AZD-Deployable

**Chapter Navigation:**
- **📚 Course Home**: [AZD algajatele](../../README.md)
- **📖 Current Chapter**: Peatükk 2 - Tehisintellekti-keskne arendus
- **⬅️ Previous**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Next**: [AI tootmise parimad tavad](production-ai-practices.md)
- **🚀 Next Chapter**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Workshop Overview

See praktiline labor juhendab arendajaid läbi olemasoleva AI malli AZD abil juurutamise protsessi. Õpid tootmisvalmis AI juurutuste jaoks olulisi mustreid Microsoft Foundry teenuste kasutamisel.

**Duration:** 2-3 tundi  
**Level:** Kesktase  
**Prerequisites:** Põhiline Azure'i teadmine, tuttavus AI/ML kontseptsioonidega

## 🎓 Õpieesmärgid

Selle töötoa lõppedes oskad:
- ✅ Muuta olemasolev AI rakendus AZD mallide kasutamiseks
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD abil
- ✅ Rakendada turvalist mandaatide haldust AI teenuste jaoks
- ✅ Juurutada tootmisvalmis AI rakendusi koos monitooringuga
- ✅ Siluda levinumaid AI juurutuse probleeme

## Eeltingimused

### Nõutavad tööriistad
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) paigaldatud
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) paigaldatud
- [Git](https://git-scm.com/) paigaldatud
- Koodiredaktor (soovitatav VS Code)

### Azure ressursid
- Azure tellimus koos contributor õigustega
- Juurdepääs Azure OpenAI teenustele (või võimalus taotleda juurdepääsu)
- Ressursigrupi loomise õigused

### Teadmiste eeldused
- Põhiline arusaam Azure teenustest
- Tutvumine käsurealiideste kasutamisega
- Põhilised AI/ML kontseptsioonid (API-d, mudelid, promptid)

## Lab Setup

### Samm 1: Keskkonna ettevalmistus

1. **Kontrolli tööriistade paigaldusi:**
```bash
# Kontrolli AZD-i installatsiooni
azd version

# Kontrolli Azure CLI-d
az --version

# Logi sisse Azure'i
az login
azd auth login
```

2. **Klooni töötoa repositoorium:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI rakenduste jaoks

### AI AZD malli anatoomia

Uuri AI-valmis AZD malli olulisi faile:

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

### **Laboriharjutus 1.1: Konfiguratsiooni uurimine**

1. **Vaata üle azure.yaml fail:**
```bash
cat azure.yaml
```

**Millele tähelepanu pöörata:**
- Teenuste määratlused AI komponentide jaoks
- Keskkonnamuutujate vastavused
- Hostimise konfiguratsioonid

2. **Vaata üle infra/main.bicep infrastruktuur:**
```bash
cat infra/main.bicep
```

**Olulised AI mustrid, mida tuvastada:**
- Azure OpenAI teenuse provisjoneerimine
- Cognitive Search integreerimine
- Turvaline võtmete haldamine
- Võrgu turbe konfiguratsioonid

### **Arutluse teema:** Miks need mustrid on AI jaoks olulised

- **Teenuste sõltuvused**: AI rakendused vajavad tihti mitut koordineeritud teenust
- **Turvalisus**: API võtmed ja lõpp-punktid vajavad turvalist haldust
- **Skaalautuvus**: AI töökoormustel on eripärased skaleerimisnõuded
- **Kulude haldamine**: AI teenused võivad olla kallid, kui neid ei konfigureerita õigesti

## Moodul 2: Juuruta oma esimene AI rakendus

### Samm 2.1: Keskkonna initsialiseerimine

1. **Loo uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Määra vajalikud parameetrid:**
```bash
# Määra oma eelistatud Azure'i regioon
azd env set AZURE_LOCATION eastus

# Valikuline: Määra konkreetne OpenAI mudel
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juuruta AZD abil:**
```bash
azd up
```

**Mis juhtub `azd up` ajal:**
- ✅ Provisjoneeritakse Azure OpenAI teenus
- ✅ Luuakse Cognitive Search teenus
- ✅ Seadistatakse App Service veebirakenduse jaoks
- ✅ Konfigureeritakse võrgud ja turvalisus
- ✅ Juurutatakse rakenduse kood
- ✅ Seadistatakse monitooring ja logimine

2. **Jälgi juurutuse edenemist** ja märgi üles loodavad ressursid.

### Samm 2.3: Kinnita oma juurutus

1. **Kontrolli juurutatud ressursse:**
```bash
azd show
```

2. **Ava juurutatud rakendus:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testi AI funktsionaalsust:**
   - Liigu veebirakendusse
   - Proovi näidupäringuid
   - Kinnita, et AI vastused töötavad

### **Laboriharjutus 2.1: Tõrkeotsingu praktika**

**Stsenaarium**: Juurutus õnnestus, kuid AI ei reageeri.

**Tavalised kontrollitavad probleemid:**
1. **OpenAI API võtmed**: Kontrolli, et need on õigesti seadistatud
2. **Mudeli kättesaadavus**: Kontrolli, kas sinu piirkond toetab mudelit
3. **Võrguühendus**: Veendu, et teenused saavad omavahel suhelda
4. **RBAC õigused**: Kontrolli, et rakendus saab OpenAI-le juurde

**Silumise käsud:**
```bash
# Kontrolli keskkonnamuutujaid
azd env get-values

# Vaata juurutamise logisid
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrolli OpenAI juurutamise olekut
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: Kohanda AI rakendusi vastavalt oma vajadustele

### Samm 3.1: Muuda AI konfiguratsiooni

1. **Uuenda OpenAI mudelit:**
```bash
# Vaheta teise mudeli vastu (kui see on sinu piirkonnas saadaval)
azd env set AZURE_OPENAI_MODEL gpt-4

# Juuruta uuesti uue konfiguratsiooniga
azd deploy
```

2. **Lisa täiendavaid AI teenuseid:**

Muuda `infra/main.bicep`, et lisada Document Intelligence:

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

2. **Määra tootmispõhised parameetrid:**
```bash
# Tootmises kasutatakse tavaliselt kõrgemaid SKU-sid
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Luba täiendavad turvafunktsioonid
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboriharjutus 3.1: Kulude optimeerimine**

**Väljakutse**: Konfigureeri mall kuluefektiivseks arenduskeskkonnaks.

**Ülesanded:**
1. Tuvasta, milliseid SKU-sid saab seada tasuta/põhitasemele
2. Konfigureeri keskkonnamuutujad minimaalsete kulude jaoks
3. Juuruta ja võrdle kulusid tootmiskonfiguratsiooniga

**Lahenduse vihjed:**
- Kasuta F0 (tasuta) taset Cognitive Services puhul, kui võimalik
- Kasuta arenduses Search Service jaoks Basic taset
- Kaalu Functions jaoks Consumption plaani

## Moodul 4: Turvalisus ja tootmise parimad tavad

### Samm 4.1: Turvaline volituste haldus

**Praegune väljakutse**: Paljud AI rakendused kodeerivad API võtmeid sisse või kasutavad ebaturvalist salvestust.

**AZD lahendus**: Managed Identity + Key Vault integratsioon.

1. **Vaata üle oma malli turbekonfiguratsioon:**
```bash
# Otsige Key Vaulti ja haldustatud identiteedi konfiguratsiooni
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrolli, et Managed Identity töötab:**
```bash
# Kontrolli, kas veebirakendusel on õige identiteedi konfiguratsioon
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrgu turvalisus

1. **Luba privaatotsad** (kui need pole veel konfigureeritud):

Lisa oma bicep-malli:
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

### Samm 4.3: Monitooring ja nähtavus

1. **Konfigureeri Application Insights:**
```bash
# Application Insights peaks olema automaatselt seadistatud
# Kontrolli konfiguratsiooni:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sea üles AI-spetsiifiline monitooring:**

Lisa kohandatud mõõdikud AI toimingute jaoks:
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

### **Laboriharjutus 4.1: Turvaaudit**

**Ülesanne**: Vaata oma juurutus üle turvalisuse parimate tavade osas.

**Kontrollnimekiri:**
- [ ] Puuduvad kõvakodeeritud saladused koodis või konfiguratsioonis
- [ ] Teenustevaheliseks autentimiseks kasutatakse Managed Identity'd
- [ ] Key Vault hoiab tundlikku konfiguratsiooni
- [ ] Võrgu juurdepääs on korrektselt piiratud
- [ ] Monitooring ja logimine on lubatud

## Moodul 5: Oma AI rakenduse konverteerimine

### Samm 5.1: Hinnanguleht

**Enne rakenduse konverteerimist** vasta neile küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid sinu rakendus kasutab?
   - Milliseid arvutusressursse see vajab?
   - Kas see vajab andmebaasi?
   - Millised on teenustevahelised sõltuvused?

2. **Turbe nõuded:**
   - Milliseid tundlikke andmeid sinu rakendus käsitleb?
   - Millised regulatiivsed nõuded kehtivad?
   - Kas vajad privaatvõrku?

3. **Skaalimise nõuded:**
   - Milline on oodatud koormus?
   - Kas vajad automaatset skaleerimist?
   - Kas on piirkondlikke nõudeid?

### Samm 5.2: Loo oma AZD mall

**Järgi seda mustrit oma rakenduse konverteerimiseks:**

1. **Loo põhistruktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initsialiseeri AZD-mall
azd init --template minimal
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

**infra/main.bicep** - Peamine mall:
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
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Laboriharjutus 5.1: Malli loomise väljakutse**

**Väljakutse**: Loo AZD mall dokumentide töötlemise AI rakenduse jaoks.

**Nõuded:**
- Azure OpenAI sisu analüüsiks
- Document Intelligence OCR-iks
- Storage Account dokumentide üleslaadimiseks
- Function App töötlemisloogika jaoks
- Veebirakendus kasutajaliidese jaoks

**Boonuspunkte:**
- Lisa korralik vigade käitlemine
- Kaasa kulude hinnang
- Sea üles monitooringu armatuurlaud

## Moodul 6: Levinud probleemide silumine

### Levinud juurutusprobleemid

#### Probleem 1: OpenAI teenuse piirang ületatud
**Sümptomid:** Juurutus ebaõnnestub piirangu veaga
**Lahendused:**
```bash
# Kontrolli praeguseid piiranguid
az cognitiveservices usage list --location eastus

# Taotle piirangu suurendamist või proovi teist regiooni
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole piirkonnas saadaval
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutamine annab vea
**Lahendused:**
```bash
# Kontrolli mudeli saadavust regiooniti
az cognitiveservices model list --location eastus

# Uuenda saadaval olevale mudelile
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probleem 3: Õiguste probleemid
**Sümptomid:** 403 Forbidden vead AI teenustele pöördumisel
**Lahendused:**
```bash
# Kontrolli rollide määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Lisa puuduvad rollid
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Jõudlusprobleemid

#### Probleem 4: Aeglased AI vastused
**Uurimis- ja tõrkeotsingusammud:**
1. Kontrolli Application Insights'i jõudlusmõõdikuid
2. Vaata OpenAI teenuse mõõdikuid Azure portaalis
3. Kontrolli võrguühendust ja latentsusaega

**Lahendused:**
- Rakenda vahemällu salvestust sagedaste päringute jaoks
- Kasuta sinu juhtumi jaoks sobivat OpenAI mudelit
- Kaalu lugemis-replikasid suure koormuse korral

### **Laboriharjutus 6.1: Silumise väljakutse**

**Stsenaarium**: Juurutus õnnestus, kuid rakendus tagastab 500 vigu.

**Silumise ülesanded:**
1. Kontrolli rakenduse logisid
2. Kinnita teenuste ühenduvus
3. Testi autentimist
4. Vaata konfiguratsiooni üle

**Kasutatavad tööriistad:**
- `azd show` juurutuse ülevaate jaoks
- Azure portaal üksikasjalike teenuste logide jaoks
- Application Insights rakenduse telemeetriaks

## Moodul 7: Monitooring ja optimeerimine

### Samm 7.1: Sea üles põhjalik monitooring

1. **Loo kohandatud juhtpaneelid:**

Mine Azure portaali ja loo armatuurlaud, mis sisaldab:
- OpenAI päringute arv ja latentsus
- Rakenduse vigade määr
- Ressursside kasutus
- Kulude jälgimine

2. **Sea üles teavitused:**
```bash
# Hoiatus kõrge veamäära kohta
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Samm 7.2: Kulude optimeerimine

1. **Analüüsi praeguseid kulusid:**
```bash
# Kasutage Azure CLI-d kulude andmete saamiseks
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakenda kulukontrolle:**
- Sea eelarve teavitused
- Kasuta automaatse skaleerimise poliitikaid
- Rakenda päringute vahemällu salvestust
- Jälgi OpenAI tokenite kasutust

### **Laboriharjutus 7.1: Jõudluse optimeerimine**

**Ülesanne**: Optimeeri oma AI rakendus nii jõudluse kui kulude osas.

**Parandatavad mõõdikud:**
- Vähenda keskmist vastuseaega 20% võrra
- Vähenda igakuiseid kulusid 15% võrra
- Säilita 99.9% tööaeg

**Prooviks strateegiad:**
- Rakenda vastuste vahemällu salvestust
- Optimeeri promptid tokeni efektiivsuse jaoks
- Kasuta sobivaid arvutus-SKU-sid
- Sea korralik automaatne skaleerimine

## Lõplik väljakutse: End-to-End rakenduse implementeerimine

### Väljakutse stsenaarium

Sinu ülesandeks on luua tootmisvalmis AI-toega klienditeeninduse vestlusrobot, millel on järgmised nõuded:

**Funktsionaalsed nõuded:**
- Veebiliides kliendisuhtluseks
- Integratsioon Azure OpenAI-ga vastuste saamiseks
- Dokumendipõhine otsing Cognitive Search abil
- Integratsioon olemasoleva kliendibaasiga
- Mitmekeelne tugi

**Mittemfunktsionaalsed nõuded:**
- Käsitleb 1000 samaaegset kasutajat
- 99.9% tööaja SLA
- SOC 2 vastavus
- Kulu alla $500/kuu
- Juurutada mitmesse keskkonda (dev, staging, prod)

### Rakendamise sammud

1. **Disaini arhitektuur**
2. **Loo AZD mall**
3. **Rakenda turvameetmed**
4. **Sea üles monitooring ja teavitused**
5. **Loo juurutustorud**
6. **Dokumenteeri lahendus**

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus**: Kas see vastab kõikidele nõuetele?
- ✅ **Turvalisus**: Kas parimad tavad on rakendatud?
- ✅ **Skaalautuvus**: Kas see suudab koormust hallata?
- ✅ **Hooldatavus**: Kas kood ja infrastruktuur on hästi organiseeritud?
- ✅ **Kulu**: Kas see jääb eelarvesse?

## Täiendavad ressursid

### Microsofti dokumentatsioon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Lõputunnistus
Palju õnne! Oled lõpetanud AI-töötoa labori. Nüüd peaksid suutma:

- ✅ Konverteerida olemasolevaid AI-rakendusi AZD-mallideks
- ✅ Juurutada tootmiskõlblikke AI-rakendusi
- ✅ Rakendada AI töökoormuste turvalisuse parimaid tavasid
- ✅ Jälgida ja optimeerida AI-rakenduste jõudlust
- ✅ Lahendada tavalisi juurutusprobleeme

### Järgmised sammud
1. Rakenda neid mustreid oma AI-projektidele
2. Panusta mallidega kogukonda
3. Liitu Microsoft Foundry Discordiga jätkuva toe saamiseks
4. Uuri edasijõudnud teemasid nagu mitmeregionilised juurutused

---

**Töötoa tagasiside**: Aita meil seda töötoa parandada, jagades oma kogemust [Microsoft Foundry Discordi #Azure kanalis](https://discord.gg/microsoft-azure).

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmane arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [AI tootmise parimad tavad](production-ai-practices.md)
- **🚀 Järgnev peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vajate abi?** Liitu meie kogukonnaga, et saada tuge ja arutada AZD ja AI juurutuste üle.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastutusest loobumine:
See dokument on tõlgitud tehisintellekti tõlketeenuse Co-op Translator (https://github.com/Azure/co-op-translator) abil. Kuigi me püüame tagada täpsust, palun arvestage, et automatiseeritud tõlked võivad sisaldada vigu või ebatäpsusi. Algset dokumenti selle algkeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste ega väär­tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->