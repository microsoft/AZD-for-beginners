# AI Töötoalabor: Teie AI lahenduste tegemine AZD-lahenduseks

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 2 - AI-eelistusega arendus
- **⬅️ Eelmine**: [AI mudeli juurutus](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmisvalmis AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Töötoa ülevaade

See praktiline labor juhendab arendajaid olemasoleva AI malli võtmise ja Azure Developer CLI (AZD) abil juurutamise protsessis. Õpite tootmisvalmide AI juurutuste jaoks olulisi mustreid Microsoft Foundry teenuste abil.

**Kestus:** 2-3 tundi  
**Tase:** Kesktase  
**Eeltingimused:** Põhiline Azure teadmine, tutvumine AI/ML mõistetega

## 🎓 Õpieesmärgid

Selle töötoa lõpuks oskate:
- ✅ Konverteerida olemasolev AI rakendus AZD mallide kasutamiseks
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD abil
- ✅ Rakendada turvalist volikirjade haldust AI teenustele
- ✅ Juurutada tootmisvalmis AI rakendusi koos jälgimisega
- ✅ Lahendada levinud AI juurutusprobleeme

## Eeltingimused

### Vajalikud tööriistad
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) paigaldatud
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) paigaldatud
- [Git](https://git-scm.com/) paigaldatud
- Koodiredaktor (soovitatavalt VS Code)

### Azure ressursid
- Azure tellimus koos kaastöötluse õigustega
- Juurdepääs Microsoft Foundry Models teenustele (või võimalus taotleda)
- Ressursigrupi loomise õigused

### Teadmised
- Põhiline arusaam Azure teenustest
- Käsurealiideste tundmine
- Põhilised AI/ML mõisted (API-d, mudelid, promptid)

## Labori seadistus

### Samm 1: Keskkonna ettevalmistamine

1. **Kontrolli tööriistade paigaldust:**
```bash
# Kontrolli AZD paigaldust
azd version

# Kontrolli Azure CLI-d
az --version

# Logi sisse Azure'i
az login
azd auth login
```

2. **Klooni töötoa hoidla:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI rakendustes

### AI AZD malli anatoomia

Avasta AI-valmis AZD malli võtmefailid:

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

### **Laboriharjutus 1.1: Konfiguratsiooni uurimine**

1. **Vaata azure.yaml faili:**
```bash
cat azure.yaml
```

**Millele tähelepanu pöörata:**
- Teenuste definitsioonid AI komponentidele
- Keskkonnamuutujate kaardistused
- Hostkäivituse konfiguratsioonid

2. **Ülevaade main.bicep infrastruktuurist:**
```bash
cat infra/main.bicep
```

**Olulised AI mustrid, mida märgata:**
- Microsoft Foundry Models teenuse loomine
- Cognitive Search integratsioon
- Turvaline võtmehaldussüsteem
- Võrgu turvaseaded

### **Arutelu: Miks need mustrid on AI jaoks olulised**

- **Teenuste sõltuvused**: AI rakendused vajavad sageli mitme koordineeritud teenuse kasutamist
- **Turvalisus**: API võtmed ja lõpp-punktid vajavad turvalist haldust
- **Skaalautuvus**: AI koormused nõuavad eripärast skaleerimist
- **Kulukontroll**: AI teenused võivad ilma nõuetekohase konfiguratsioonita kalliks minna

## Moodul 2: Esimese AI rakenduse juurutamine

### Samm 2.1: Keskkonna initsialiseerimine

1. **Loo uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Sea vajalikud parameetrid:**
```bash
# Määra oma eelistatud Azure'i piirkond
azd env set AZURE_LOCATION eastus

# Valikuline: Määra konkreetne OpenAI mudel
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juuruta azd abil:**
```bash
azd up
```

**Mis toimub `azd up` käivitamisel:**
- ✅ Teenuse Microsoft Foundry Models loomine
- ✅ Cognitive Search teenuse loomine
- ✅ Veebirakenduse jaoks App Service seadistamine
- ✅ Võrgu ja turbe konfiguratsioon
- ✅ Rakenduskoodi juurutus
- ✅ Jälgimise ja logimise seadistamine

2. **Jälgi juurutuse edenemist** ja märgi loodavad ressursid.

### Samm 2.3: Juurutuse kontrollimine

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
   - Proovi näidispäringuid
   - Kontrolli AI vastuste õigsust

### **Laboriharjutus 2.1: Veadete lahendamise harjutus**

**Stsenaarium**: Juurutus õnnestus, aga AI ei reageeri.

**Levinud probleemid:**
1. **OpenAI API võtmed**: Kontrolli, et need oleksid õigesti seadistatud
2. **Mudeli kättesaadavus**: Kontrolli, kas sinu piirkond mudelit toetab
3. **Võrguühendus**: Veendu, et teenused saavad omavahel suhelda
4. **RBAC õigused**: Kontrolli, et rakendus pääseb OpenAI juurde

**Silumise käsud:**
```bash
# Kontrolli keskkonnamuutujaid
azd env get-values

# Vaata kasutuselevõtu logisid
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrolli OpenAI kasutuselevõtu olekut
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: AI rakenduste kohandamine oma vajadustele

### Samm 3.1: AI konfiguratsiooni muutmine

1. **Uuenda OpenAI mudelit:**
```bash
# Vaheta teise mudeli vastu (kui see on sinu piirkonnas saadaval)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Paiguta uuesti koos uue konfiguratsiooniga
azd deploy
```

2. **Lisa täiendavad AI teenused:**

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

### Samm 3.2: Keskkonnapõhised konfiguratsioonid

**Parim tava**: Erinevad konfiguratsioonid arendus- ja tootmiskeskkondadele.

1. **Loo tootmiskeskkond:**
```bash
azd env new myai-production
```

2. **Sea tootmiskeskkonna spetsiifilised parameetrid:**
```bash
# Tootmises kasutatakse tavaliselt rohkem SKU-sid
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Luba täiendavad turvafunktsioonid
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboriharjutus 3.1: Kulu optimeerimine**

**Väljakutse**: Konfigureeri mall kulutõhusaks arenduseks.

**Ülesanded:**
1. Tuvasta, millised SKU-d saab määrata tasuta või põhitasemele
2. Sea keskkonnamuutujad minimaalsete kuludega töötamiseks
3. Juuruta ja võrdle kulusid tootmiskonfiguratsiooniga

**Lahenduse vihjed:**
- Kasuta Cognitive Services jaoks võimalusel F0 (tasuta) taset
- Kasuta Search Service jaoks arenduses Basic taset
- Kaalu Functions'i puhul tarbimiskava kasutamist

## Moodul 4: Turvalisus ja tootmisparimad tavad

### Samm 4.1: Turvaline volikirjade haldus

**Hetkeprobleem**: Paljud AI rakendused salvestavad API võtmeid kovalt või ebaturvaliselt.

**AZD lahendus**: Hallatud identiteet + Key Vault integratsioon.

1. **Vaata üle turvakonfiguratsioon mallis:**
```bash
# Otsi Key Vaulti ja hallatud identiteedi konfiguratsiooni
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrolli, et hallatud identiteet töötab:**
```bash
# Kontrolli, kas veebirakendusel on õige identiteedikontseptsioon
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrgu turvalisus

1. **Luba privaatsed lõpp-punktid** (kui pole veel seadistatud):

Lisa bicep malli:
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

### Samm 4.3: Jälgimine ja jälgitavus

1. **Konfigureeri Application Insights:**
```bash
# Application Insights peaks olema automaatselt konfigureeritud
# Kontrolli konfiguratsiooni:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sea üles AI-spetsiifiline jälgimine:**

Lisa AI operatsioonide kohandatud mõõdikud:
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

**Ülesanne**: Kontrolli oma juurutust turvapõhimõtete osas.

**Kontrollnimekiri:**
- [ ] Ei ole kovalt kodeeritud saladusi koodis ega konfiguratsioonis
- [ ] Kasutatakse hallatud identiteeti teenustevaheliseks autentimiseks
- [ ] Key Vault hoiab tundlikku konfiguratsiooni
- [ ] Võrgu juurdepääs on korrektselt piiratud
- [ ] Jälgimine ja logimine on lubatud

## Moodul 5: Oma AI rakenduse konverteerimine

### Samm 5.1: Hindamisleht

**Enne rakenduse konverteerimist** vasta neile küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid sinu rakendus kasutab?
   - Milliseid arvutusressursse see vajab?
   - Kas see vajab andmebaasi?
   - Millised on teenustevahelised sõltuvused?

2. **Turvanõuded:**
   - Millist tundlikku infot sinu rakendus töötleb?
   - Millised vastavusnõuded on?
   - Kas vajad privaatsidet?
   
3. **Skaalautumise nõuded:**
   - Milline on eeldatav koormus?
   - Kas vajad automaatset skaleerimist?
   - Kas eksisteerivad piirkonnapõhised nõuded?

### Samm 5.2: Loo oma AZD mall

**Järgi seda mustrit, et konverteerida rakendus:**

1. **Loo baasstruktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initsialiseeri AZD mall
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

**Väljakutse**: Loo AZD mall dokumentide töötlemise AI rakendusele.

**Nõuded:**
- Microsoft Foundry Models sisuanalüüsiks
- Document Intelligence OCR-iks
- Salvestuskonto dokumentide üleslaadimiseks
- Function App töötlemisloogikaks
- Veebirakendus kasutajaliidese jaoks

**Boonuspunktid:**
- Korralik vigade käsitlemine
- Kulu prognoosimine
- Jälgimisarmatuurlaudade seadistamine

## Moodul 6: Levinud probleemide lahendamine

### Levinud juurutusprobleemid

#### Probleem 1: OpenAI teenuse kvota ületatud  
**Sümptomid:** Juurutus ebaõnnestub kvota veaga  
**Lahendused:**  
```bash
# Kontrolli praeguseid limiite
az cognitiveservices usage list --location eastus

# Taotle limiidi tõstmist või proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole piirkonnas saadaval  
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutuse vead  
**Lahendused:**  
```bash
# Kontrolli mudeli saadavust piirkonna järgi
az cognitiveservices model list --location eastus

# Uuenda saadaoleva mudeli peale
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probleem 3: Õiguste probleemid  
**Sümptomid:** 403 Keelatud vead AI teenuste kutsumisel  
**Lahendused:**  
```bash
# Kontrolli rollide määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Lisa puuduvaid rolle
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Jõudlusprobleemid

#### Probleem 4: AI vastused on aeglased  
**Uurimisetapid:**  
1. Kontrolli Application Insights jõudlusmõõdikuid  
2. Vaata OpenAI teenuse mõõdikuid Azure portaalis  
3. Kontrolli võrguühenduse kiirust ja latentsust  

**Lahendused:**  
- Rakenda populaarsete päringute vahemälu  
- Kasuta õiget OpenAI mudelit oma juhtumi jaoks  
- Kaalu lugemiskoopiaid suurte koormuste korral

### **Laboriharjutus 6.1: Silumise väljakutse**

**Stsenaarium**: Juurutus õnnestus, aga rakendus tagastab 500 vead.

**Silumise ülesanded:**  
1. Kontrolli rakenduse logisid  
2. Kontrolli teenusteühendust  
3. Testi autentimist  
4. Vaata konfiguratsiooni läbi  

**Kasutatavad tööriistad:**  
- `azd show` juurutuse üldvaateks  
- Azure portaal teenuste logide jaoks  
- Application Insights rakenduse telemeetria jaoks

## Moodul 7: Jälgimine ja optimeerimine

### Samm 7.1: Komplekssed jälgimise seadistused

1. **Loo kohandatud armatuurlaud:**

Mine Azure portaalisse ja loo armatuurlaud koos:  
- OpenAI päringute arv ja latentsus  
- Rakenduse veamäärad  
- Ressursside kasutus  
- Kulude jälgimine

2. **Seadista hoiatused:**  
```bash
# Häire kõrge veamäära korral
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Samm 7.2: Kulu optimeerimine

1. **Analüüsi praeguseid kulusid:**  
```bash
# Kasutage kulude andmete saamiseks Azure CLI-d
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakenda kulukontrollid:**  
- Sea eelarveteated  
- Kasuta automaatse skaleerimise poliitikaid  
- Rakenda päringute vahemällu salvestamine  
- Jälgi OpenAI märkide kasutust

### **Laboriharjutus 7.1: Jõudluse optimeerimine**

**Ülesanne**: Optimeeri oma AI rakendus nii jõudluse kui ka kulu osas.

**Mõõdikud, mida parandada:**  
- Vähenda keskmist vastuse aega 20%  
- Vähenda kuu kulutusi 15%  
- Säilita 99.9% tööaeg

**Proovitavad strateegiad:**  
- Rakenda vastusevahemälu  
- Optimeeri promptid märksõnade tõhususe jaoks  
- Kasuta sobivaid arvutus-SKU-sid  
- Sea korralik automaatne skaleerimine

## Lõpuprojekt: Täielik rakenduse elluviimine

### Väljakutse stsenaarium

Sinu ülesandeks on luua tootmisvalmis AI-põhine klienditeenindusbot, mille nõuded on:

**Funktsionaalsed nõuded:**  
- Veebiliides kliendi suhtluseks  
- Microsoft Foundry Models integreerimine vastusteks  
- Dokumentide otsingu võimekus Cognitive Search abil  
- Olemasoleva kliendiandmebaasi integreerimine  
- Mitmekeelne tugi

**Mittefunktsionaalsed nõuded:**  
- Koormus 1000 samaaegset kasutajat  
- 99.9% tööaja SLA  
- SOC 2 vastavus  
- Kulu alla 500$/kuus  
- Juurutus mitmesse keskkonda (arendus, etapp, tootmine)

### Elluviimise sammud

1. **Arhitektuuri kujundamine**  
2. **AZD malli loomine**  
3. **Turvameetmete rakendamine**  
4. **Jälgimise ja hoiatussüsteemi seadistamine**  
5. **Juurutuskanalite loomine**  
6. **Lahenduse dokumenteerimine**

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus**: Kas vastab kõikidele nõuetele?  
- ✅ **Turvalisus**: Kas on rakendatud parimad tavad?  
- ✅ **Skaalautuvus**: Kas suudab koormusega toime tulla?  
- ✅ **Hooldatavus**: Kas kood ja infrastruktuur on hästi organiseeritud?  
- ✅ **Kulu**: Kas jääb eelarvesse?

## Täiendavad ressursid

### Microsofti dokumentatsioon  
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models teenuse dokumentatsioon](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid  
- [Microsoft Foundry Models Chat rakendus](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI Chat rakenduse kiire algus](https://github.com/Azure-Samples/openai-chat-app-quickstart)  
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid  
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)  
- [Azure Developer CLI GitHubis](https://github.com/Azure/azure-dev)  
- [Awesome AZD mallid](https://azure.github.io/awesome-azd/)

## 🎓 Lõputunnistus

Palju õnne! Olete lõpetanud AI Töötoalabori. Nüüd peaksite oskama:
- ✅ Muuda olemasolevad tehisintellekti rakendused AZD mallideks
- ✅ Käivita tootmiskõlbulikud tehisintellekti rakendused
- ✅ Rakenda tehisintellekti töökoormuste turvalisuse parimaid tavasid
- ✅ Jälgi ja optimeeri tehisintellekti rakenduse jõudlust
- ✅ Tõrkeotsing levinumate juurutamisprobleemide korral

### Järgmised sammud
1. Rakenda neid mustreid omaenda tehisintellekti projektides
2. Panusta mallid tagasi kogukonda
3. Liitu Microsoft Foundry Discordiga pideva toe saamiseks
4. Uuri edasi edasijõudnute teemasid nagu mitut regiooni hõlmavad juurutused

---

**Töötoa tagasiside**: Aita meil seda töötuba paremaks muuta, jagades oma kogemusi Microsoft Foundry Discordi kanalis [#Azure](https://discord.gg/microsoft-azure).

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - Tehisintellekti eeline arendus
- **⬅️ Eelmine**: [Tehisintellekti mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmistehisintellekti parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vaja abi?** Liitu meie kogukonnaga, et saada tuge ja arutelusid AZD ja tehisintellekti juurutamise kohta.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest vabanemine**:  
See dokument on tõlgitud kasutades tehisintellektil põhinevat tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüdleme täpsuse poole, tuleb arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Originaaldokument selle emakeeles peaks olema käsitletav kui autoriteetne allikas. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti mõistmiste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->