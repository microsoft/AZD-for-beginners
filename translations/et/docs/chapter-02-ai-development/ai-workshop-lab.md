# AI töötoa labor: Teie AI lahenduste tegemine AZD-jõustatavaks

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Jooksev peatükk**: Peatükk 2 - AI-ealine arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmise AI parimad praktikad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Töötoa ülevaade

See praktiline labor juhendab arendajaid protsessis, kuidas võtta olemasolev AI mall ja juurutada see Azure Developer CLI (AZD) abil. Õpite tootmisvalmis AI juurutuste puhul olulisi mustreid, kasutades Microsoft Foundry teenuseid.

> **Kinnituse märkus (2026-03-25):** See töötoa materjal vaadati üle koos `azd` versiooniga `1.23.12`. Kui teie kohalik installatsioon on vanem, uuendage AZD enne alustamist, et autoriseerimis-, malli- ja juurutusvoog vastaks allolevatele sammudele.

**Kestus:** 2-3 tundi  
**Tase:** Kesktase  
**Eeltingimused:** Põhiline Azure’i tundmine, AI/ML kontseptsioonide tundmine

## 🎓 Õpieesmärgid

Selle töötoa lõpuks oskate:
- ✅ Konverteerida olemasolev AI rakendus kasutama AZD malle
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD abil
- ✅ Rakendada turvalist volituste haldust AI teenuste jaoks
- ✅ Juurutada tootmisvalmis AI rakendusi koos monitooringuga
- ✅ Lahendada levinud AI juurutamisega seotud probleemid

## Eeltingimused

### Vajalikud tööriistad
- Paigaldatud [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Paigaldatud [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Paigaldatud [Git](https://git-scm.com/)
- Koodi redaktor (soovitatavalt VS Code)

### Azure ressursid
- Azure tellimus kontribuutori õigustega
- Ligipääs Microsoft Foundry Models teenustele (või võimalus ligipääsu taotleda)
- Ressursigrupi loomise õigused

### Teadmiste eeltingimused
- Azure teenuste põhitunnetus
- Käsurea liideste tundmine
- AI/ML põhilised mõisted (API-d, mudelid, promptid)

## Labori ettevalmistus

### Samm 1: Keskkonna ettevalmistamine

1. **Kontrolli tööriistade installeerimist:**
```bash
# Kontrolli AZD paigaldust
azd version

# Kontrolli Azure CLI-d
az --version

# Logi sisse Azure'i AZD töövoogude jaoks
azd auth login

# Logi sisse Azure CLI-sse ainult siis, kui plaanid diagnostika ajal käivitada az käske
az login
```

Kui töötate mitme tenantiga või teie tellimus ei tuvastata automaatselt, proovige uuesti käsuga `azd auth login --tenant-id <tenant-id>`.

2. **Kloonige töötoa hoidla:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI rakenduste jaoks

### AI AZD malli anatoomia

Uurige AI-valmis AZD malli olulisi faile:

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

### **Labori harjutus 1.1: Konfiguratsiooni uurimine**

1. **Vaadake azure.yaml faili:**
```bash
cat azure.yaml
```

**Mida otsida:**
- Teenuste definitsioonid AI komponentide jaoks
- Keskkonnamuutujate seosed
- Hostikonfiguratsioonid

2. **Vaadake üle main.bicep infrastruktuur:**
```bash
cat infra/main.bicep
```

**Olulised AI mustrid, mida tuvastada:**
- Microsoft Foundry Models teenuse loomine
- Azure AI Search integratsioon
- Turvaline võtmehaldussüsteem
- Võrgu turvaseaded

### **Arutelu teema:** Miks need mustrid AI puhul olulised on

- **Teenuste sõltuvused:** AI rakendused vajavad tihti mitut koordineeritud teenust
- **Turvalisus:** API võtmed ja lõpp-punktid peavad olema turvaliselt hallatud
- **Skaalautuvus:** AI töökoormustel on spetsiifilised skaleerimisnõuded
- **Kulujuhtimine:** AI teenused võivad maksumuselt märkimisväärsed olla, kui neid korrektselt ei seadistata

## Moodul 2: Esimese AI rakenduse juurutamine

### Samm 2.1: Keskkonna käivitamine

1. **Loo uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Määra vajalikud parameetrid:**
```bash
# Määra eelistatud Azure piirkond
azd env set AZURE_LOCATION eastus

# Valikuline: Määra konkreetne OpenAI mudel
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juuruta AZD-ga:**
```bash
azd up
```

**Mis juhtub `azd up` ajal:**
- ✅ Loob Microsoft Foundry Models teenuse
- ✅ Loob Azure AI Search teenuse
- ✅ Seadistab App Service veebirakenduse jaoks
- ✅ Konfigureerib võrgu- ja turvaseaded
- ✅ Juurutab rakenduse koodi
- ✅ Seadistab monitooringu ja logimise

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

Ava veebipunkt, mis on näidatud `azd show` väljundis.

3. **Testi AI funktsionaalsust:**
   - Mine veebirakendusse
   - Proovi näidis päringuid
   - Kinnita AI vastused töötavad

### **Labori harjutus 2.1: Vigade tuvastamise praktika**

**Stsenaarium**: Sinu juurutus õnnestus, kuid AI ei vasta.

**Levinud probleemid, mida kontrollida:**
1. **OpenAI API võtmed**: Kontrolli, et need oleksid korrektselt seadistatud
2. **Mudeli kättesaadavus**: Kontrolli, kas sinu piirkond toetab mudelit
3. **Võrguühendus**: Veendu, et teenused saavad suhelda
4. **RBAC õigused**: Kontrolli, kas rakendus pääseb OpenAI-le ligi

**Tõrkeotsingu käsud:**
```bash
# Kontrolli keskkonnamuutujaid
azd env get-values

# Vaata juurutuslogisid
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrolli OpenAI juurutuse staatust
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: AI rakenduste kohandamine vastavalt vajadustele

### Samm 3.1: AI konfiguratsiooni muutmine

1. **Uuenda OpenAI mudelit:**
```bash
# Vaheta teise mudeli vastu (kui see on sinu piirkonnas saadaval)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Käivita uuesti uuendatud konfiguratsiooniga
azd deploy
```

2. **Lisa täiendavad AI teenused:**

Muuda faili `infra/main.bicep` ja lisa Document Intelligence:

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

**Parim tava**: Erinevad konfiguratsioonid arenduse ja tootmise jaoks.

1. **Loo tootmiskeskkond:**
```bash
azd env new myai-production
```

2. **Määra tootmiskeskkonna parameetrid:**
```bash
# Tootmises kasutatakse tavaliselt kõrgemaid SKU-sid
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Luba täiendavad turvafunktsioonid
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labori harjutus 3.1: Kulu optimeerimine**

**Väljakutse**: Konfigureeri mall kulutõhusaks arenduseks.

**Tööd:**
1. Tuvastada, millised SKU-d saab seada tasuta/põhitasemele
2. Konfigureerida keskkonnamuutujad minimaalse kulu jaoks
3. Juurutada ja võrrelda kulusid tootmise konfiguratsiooniga

**Lahenduse vihjed:**
- Kasuta võimalusel F0 (tasuta) taset Azure AI teenustes
- Kasuta arenduses Search Service jaoks Basic taset
- Mõtle funktsioonide puhul kasutusele tarbimispõhist plaani

## Moodul 4: Turvalisus ja tootmise parimad praktikad

### Samm 4.1: Turvaline volituste haldamine

**Praegune probleem**: Paljud AI rakendused kodeerivad API võtmeid või kasutavad ebaturvalist salvestust.

**AZD lahendus**: Managed Identity + Key Vault integreerimine.

1. **Vaata üle turvakonfiguratsioon oma mallis:**
```bash
# Otsi Key Vaulti ja hallatud identiteedi konfiguratsiooni
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrolli, kas Managed Identity töötab:**
```bash
# Kontrolli, kas veebirakendusel on õige identiteedikõrgendus
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrgu turvalisus

1. **Luba privaatse lõpp-punktid** (kui pole veel seadistatud):

Lisa oma bicep malli:
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

1. **Seadista Application Insights:**
```bash
# Application Insights tuleks automaatselt seadistada
# Kontrollige konfiguratsiooni:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Seadista AI-spetsiifiline monitooring:**

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

### **Labori harjutus 4.1: Turvakontroll**

**Ülesanne**: Vaata üle oma juurutus turvalisuse parimate praktikate osas.

**Kontrollnimekiri:**
- [ ] Koodi ega konfiguratsiooni ei ole kõvakodeeritud saladusi
- [ ] Kasutatakse Managed Identity teenuste autentimiseks
- [ ] Key Vault hoiab tundlikud konfiguratsioonid
- [ ] Võrgu ligipääs on korrektselt piiratud
- [ ] Monitooring ja logimine on lubatud

## Moodul 5: Oma AI rakenduse konverteerimine

### Samm 5.1: Hindamisleht

**Enne oma rakenduse konverteerimist** vastake neile küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid teie rakendus kasutab?
   - Milliseid arvutusressursse ta vajab?
   - Kas ta vajab andmebaasi?
   - Millised on teenustevahelised sõltuvused?

2. **Turvanõuded:**
   - Milliseid tundlikke andmeid teie rakendus töötleb?
   - Millised on teie vastavusnõuded?
   - Kas vajate privaatvõrku?

3. **Skaalumise nõuded:**
   - Milline on oodatav koormus?
   - Kas on vaja automaatset skaleerimist?
   - Kas on piirkondlikke nõudeid?

### Samm 5.2: Loo oma AZD mall

**Järgige seda mustrit oma rakenduse konverteerimiseks:**

1. **Loo põhiline struktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Alusta AZD malli
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

**infra/main.bicep** - peamine mall:
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

### **Labori harjutus 5.1: Malle loomise väljakutse**

**Väljakutse**: Loo AZD mall dokumenditöötluse AI rakenduse jaoks.

**Nõuded:**
- Microsoft Foundry Models sisuanalüüsiks
- Document Intelligence OCR-iks
- Storage Account dokumentide üleslaadimiseks
- Function App töötlusloogikaks
- Veebirakendus kasutajaliidese jaoks

**Boonuspunktid:**
- Lisa korralik veakäsitlus
- Sisalda kuluarvestus
- Seadista monitooringu armatuurlauad

## Moodul 6: Levinud probleemide tõrkeotsing

### Levinud juurutusprobleemid

#### Probleem 1: OpenAI teenuse kvoot ületatud
**Sümptomid:** Juurutus ebaõnnestub kvoodivigaga  
**Lahendused:**
```bash
# Kontrolli praeguseid limiite
az cognitiveservices usage list --location eastus

# Taotle limiidi suurendamist või proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole piirkonnas saadaval
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutuse vead  
**Lahendused:**
```bash
# Kontrolli mudeli saadavust piirkonna järgi
az cognitiveservices model list --location eastus

# Uuenda saadaval olevale mudelile
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Probleem 3: Õiguste probleemid
**Sümptomid:** 403 Forbidden vead AI teenuseid kutsudes  
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

#### Probleem 4: AI vastused on aeglased
**Uurimistööd:**
1. Uuri Application Insights jõudlusmõõdikuid
2. Vaata OpenAI teenuse mõõdikuid Azure portaalis
3. Kontrolli võrgu ligipääsu ja latentsust

**Lahendused:**
- Rakenda vahemällu salvestust sagedastele päringutele
- Kasuta sobivat OpenAI mudelit vastava kasutusjuhtumi jaoks
- Mõtle replica lugemiste kasutamisele kõrge koormuse korral

### **Labori harjutus 6.1: Tõrkeotsingu väljakutse**

**Stsenaarium:** Sinu juurutus õnnestus, kuid rakendus tagastab 500 vead.

**Tõrkeotsingu ülesanded:**
1. Kontrolli rakenduse logisid
2. Kontrolli teenuste ühenduvust
3. Testi autentimist
4. Vaata üle konfiguratsioon

**Kasutatavad tööriistad:**
- `azd show` juurutuse ülevaate saamiseks
- Azure portaal üksikasjalike teenuse logide jaoks
- Application Insights rakenduse telemeetria jaoks

## Moodul 7: Monitooring ja optimeerimine

### Samm 7.1: Looge kõikehõlmav monitooring

1. **Loo kohandatud armatuurlauad:**

Mine Azure portaalis ja loo armatuurlaud järgmistega:
- OpenAI päringute arv ja latentsus
- Rakenduse veamäärad
- Ressursside kasutus
- Kulude jälgimine

2. **Seadista häired:**
```bash
# Häire kõrge veamäära puhul
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Samm 7.2: Kuluoptimeerimine

1. **Analüüsi praeguseid kulusid:**
```bash
# Kasutage Azure CLI-d, et saada kulude andmeid
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakenda kulude kontrollmeid:**
- Sea eelarvehoiatused
- Kasuta automaatse skaleerimise poliitikaid
- Rakenda päringute vahemällu salvestust
- Jälgi OpenAI tokeni kasutust

### **Labori harjutus 7.1: Jõudluse optimeerimine**

**Ülesanne:** Optimeeri oma AI rakendus nii jõudluse kui ka kulu osas.

**Parandatavad mõõdikud:**
- Vähenda keskmist vastuse aega 20% võrra
- Vähenda kuukulusid 15% võrra
- Säilita 99,9% tööaeg

**Katsetatavad strateegiad:**
- Rakenda vastuse vahemälu
- Optimeeri promptid tokenite säästmiseks
- Kasuta sobivaid arvutus-SKU-sid
- Sea paika korrektne automaatne skaleerimine

## Lõplik väljakutse: Lõplik rakendamine

### Väljakutse stsenaarium

Sulle anti ülesandeks luua tootmisvalmis AI-põhine klienditeeninduse vestlusrobot nende nõuetega:

**Funktsionaalsed nõuded:**
- Veebiliides kliendisuhtluseks
- Integratsioon Microsoft Foundry Models vastusteks
- Dokumentide otsingu võimekus Azure AI Search abil
- Integratsioon olemasoleva kliendiandmebaasiga
- Mitmekeelne tugi

**Mittefunktsionaalsed nõuded:**
- Käidelda 1000 samaaegset kasutajat
- 99,9% tööaeg SLA
- SOC 2 vastavus
- Kulu alla 500 $ kuus
- Juuruta mitmesse keskkonda (arendus, etapp, tootmine)

### Rakendussammud

1. **Planeeri arhitektuur**
2. **Loo AZD mall**
3. **Rakenda turvameetmed**
4. **Seadista monitooring ja häired**
5. **Loo juurutuskanalid**
6. **Dokumenteeri lahendus**

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus**: Kas täidab kõik nõuded?
- ✅ **Turvalisus**: Kas on rakendatud parimaid praktikaid?
- ✅ **Skaalautuvus**: Kas suudab koormust taluda?
- ✅ **Hooldatavus**: Kas kood ja infrastruktuur on hästi organiseeritud?
- ✅ **Kulu**: Kas jääb eelarvesse?

## Lisamaterjalid

### Microsofti dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models teenuse dokumentatsioon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Kiirkäivitamine](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD mallid](https://azure.github.io/awesome-azd/)

## 🎓 Lõputunnistus

Palju õnne! Oled lõpetanud AI töötuba. Nüüd peaksid suutma:

- ✅ Muuta olemasolevad tehisintellekti rakendused AZD mallideks
- ✅ Paigaldada tootmiskõlblikke AI rakendusi
- ✅ Rakendada AI töökoormuste turvalisuse parimaid tavasid
- ✅ Jälgida ja optimeerida AI rakenduste jõudlust
- ✅ Lahendada levinud paigaldusprobleeme

### Järgmised sammud
1. Rakenda neid mustreid oma AI projektides
2. Anna mallid kogukonnale tagasi
3. Liitu Microsoft Foundry Discordi tugiks
4. Uuri täpsemaid teemasid nagu mitmeregioonilised paigaldused

---

**Töötoa tagasiside**: Aita meil seda töötoad parandada, jagades oma kogemust [Microsoft Foundry Discord #Azure kanalil](https://discord.gg/microsoft-azure).

---

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI esmalt arendamine
- **⬅️ Eelmine**: [AI mudeli paigaldus](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmise AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vajad abi?** Liitu meie kogukonnaga, et saada tuge ja arutada AZD ning AI paigaldusi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->