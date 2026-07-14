# AI töötoa labor: Teie AI lahenduste AZD-lahendatavaks muutmine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Jooksev peatükk**: Peatükk 2 - AI-eelne arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmisvalve AI parimad praktikad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Töötoa ülevaade

See praktiline labor juhendab arendajaid olemasoleva AI malli kasutuselevõtuks ja juurutamiseks Azure Developer CLI (AZD) abil. Õpite olulisi mustreid tootmisvalmis AI juurutusteks, kasutades Microsoft Foundry teenuseid.

> **Kinnituse märkus (2026-07-13):** See töötoa juhend vastab `azd` versioonile `1.27.1`. Kui teie kohalik installatsioon on vanem, uuendage AZD enne alustamist, et autentimise, malli ja juurutusvoog vastaks allolevatele sammudele.

**Kestus:** 2-3 tundi  
**Tase:** Keskmine  
**Eelnõuded:** Põhilised Azure teadmised, AI/ML kontseptsioonide tundmine

## 🎓 Õpieesmärgid

Selle töötoa lõpuks suudate:
- ✅ Konverteerida olemasoleva AI rakenduse AZD mallide kasutamiseks
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD kaudu
- ✅ Rakendada turvalist volikirjade haldust AI teenustele
- ✅ Juurutada tootmisvalmis AI rakendusi koos monitooringuga
- ✅ Lahendada tavalisi AI juurutamise probleeme

## Eelnõuded

### Vajalikud tööriistad
- Paigaldatud [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Paigaldatud [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Paigaldatud [Git](https://git-scm.com/)
- Koodiredaktor (soovitatavalt VS Code)

### Azure ressursid
- Azure tellimus, millel on panustaja ligipääs
- Ligipääs Microsoft Foundry mudelite teenustele (või võimalus taotleda ligipääsu)
- Ressursside grupi loomise õigused

### Teadmised eeltingimustena
- Põhiline arusaamine Azure teenustest
- Käsurea liideste tundmine
- Põhilised AI/ML kontseptsioonid (API-d, mudelid, promptid)

## Labori seadistamine

### Samm 1: Keskkonna ettevalmistus

1. **Kontrollige tööriistade paigaldusi:**
```bash
# Kontrolli AZD installatsiooni
azd version

# Kontrolli Azure CLI-d
az --version

# Logi Azure'i sisse AZD töövoogude jaoks
azd auth login

# Logi Azure CLI sisse ainult siis, kui plaanid diagnostika käigus az käske kasutada
az login
```

Kui töötate mitme üürnikuga või teid ei tuvastata automaatselt, proovige uuesti käsuga `azd auth login --tenant-id <tenant-id>`.

2. **Kloonige töötoa hoidla:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI rakendustes

### AI AZD malli anatoomia

Uurige AI-valmis AZD malli võtmefaile:

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

### **Laboriharjutus 1.1: Konfiguratsiooni uurimine**

1. **Vaadake läbi azure.yaml fail:**
```bash
cat azure.yaml
```

**Mida otsida:**
- AI komponentide teenuse definitsioonid
- Keskkonnamuutujate kaardistused
- Hostide konfiguratsioonid

2. **Ülevaade main.bicep infrastruktuur:**
```bash
cat infra/main.bicep
```

**Märkimisväärsed AI mustrid:**
- Microsoft Foundry mudelite teenuse juurutamine
- Azure AI Search integreerimine
- Turvaline võtmehalduri kasutamine
- Võrgu turvalisuse seadistused

### **Aruteluteema:** Miks need mustrid on AI jaoks olulised

- **Teenuse sõltuvused**: AI rakendused vajavad sageli mitut koordineeritud teenust
- **Turvalisus**: API võtmed ja lõpp-punktid vajavad turvalist haldust
- **Skaalautuvus**: AI töökoormustel on unikaalsed skaleerimisnõuded
- **Kulujuhtimine**: AI teenused võivad olla kulukad, kui neid hästi ei seadistata

## Moodul 2: Esimese AI rakenduse juurutamine

### Samm 2.1: Keskkonna initsialiseerimine

1. **Looge uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Määrake vajalikud parameetrid:**
```bash
# Määra oma eelistatud Azure'i regiooni
azd env set AZURE_LOCATION eastus

# Valikuline: määra konkreetne OpenAI mudel
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juurutage AZD-ga:**
```bash
azd up
```

**Mis juhtub käsus `azd up`:**
- ✅ Uuendab Microsoft Foundry mudelite teenust
- ✅ Loob Azure AI Search teenuse
- ✅ Seadistab App Service veebirakendusele
- ✅ Konfigureerib võrgu ja turvalisuse
- ✅ Juurutab rakenduse koodi
- ✅ Seadistab monitooringu ja logimise

2. **Jälgige juurutamise edenemist** ja märkige loodavad ressursid.

### Samm 2.3: Teie juurutuse kontrollimine

1. **Kontrollige juurutatud ressursse:**
```bash
azd show
```

2. **Avage juurutatud rakendus:**
```bash
azd show
```

Avage veebilõpp-punkt, mis on näidatud `azd show` väljundis.

3. **Testige AI funktsionaalsust:**
   - Navigeerige veebirakendusse
   - Proovige näidisküsimusi
   - Kontrollige AI vastuste toimimist

### **Laboriharjutus 2.1: Tõrkeotsingu praktika**

**Stsenaarium**: Teie juurutamine õnnestus, aga AI ei reageeri.

**Tavalised probleemid, mida kontrollida:**
1. **OpenAI API võtmed**: Kontrollige, kas need on õigesti määratud
2. **Mudeli saadavus**: Kontrollige, kas teie piirkond toetab mudelit
3. **Võrguühendus**: Veenduge, et teenused saavad omavahel suhelda
4. **RBAC õigused**: Kontrollige, kas rakendusel on ligipääs OpenAI-le

**Silumise käsud:**
```bash
# Kontrolli keskkonnamuutujaid
azd env get-values

# Vaata juurutamise logisid
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrolli OpenAI juurutamise olekut
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: AI rakenduste kohandamine teie vajadustele

### Samm 3.1: AI konfiguratsiooni muutmine

1. **Uuendage OpenAI mudelit:**
```bash
# Vaheta teise mudeli vastu (kui see on su piirkonnas saadaval)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Paigalda uus konfiguratsioon uuesti
azd deploy
```

2. **Lisage täiendavad AI teenused:**

Muutke faili `infra/main.bicep`, et lisada Dokumentide intelligentsus:

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

**Parim praktika**: Erinevad konfiguratsioonid arendus- ja tootmiskeskkondade jaoks.

1. **Looge tootmiskeskkond:**
```bash
azd env new myai-production
```

2. **Määrake tootmiskeskkonna parameetrid:**
```bash
# Tootmises kasutatakse tavaliselt kõrgemaid SKU-sid
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Lülita sisse täiendavad turvafunktsioonid
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboriharjutus 3.1: Kulu optimeerimine**

**Väljakutse**: Konfigureerige mall kulutõhusaks arendamiseks.

**Ülesanded:**
1. Tuvastage, millised SKU-d saab seada tasuta/põhitasemele
2. Konfigureerige keskkonnamuutujad minimaalsete kulude jaoks
3. Juurutage ja võrrelge kulusid tootmiskonfiguratsiooniga

**Lahendusvihjed:**
- Kasutage F0 (tasuta) taset Azure AI teenustes, kui võimalik
- Kasutage arenduses Search Service puhul Basic taset
- Kaaluge Functions jaoks tarbimisplaani kasutamist

## Moodul 4: Turvalisus ja tootmise parimad praktikad

### Samm 4.1: Turvaline volikirjade haldus

**Praegune väljakutse**: Paljud AI rakendused sisestavad API võtmeid kõvakodeeritult või kasutavad ebaturvalist salvestust.

**AZD lahendus**: Hallatud identiteet + Key Vault integratsioon.

1. **Vaadake üle turbekonfiguratsioon teie mallis:**
```bash
# Otsi Key Vaulti ja hallatud identiteedi konfiguratsiooni
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrollige, kas hallatud identiteet töötab:**
```bash
# Kontrolli, kas veebiäpil on õige identiteedikontekst
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrgu turvalisus

1. **Lubage eralõpp-punktid** (kui pole veel seadistatud):

Lisage see oma bicep malli:
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

1. **Seadistage Application Insights:**
```bash
# Application Insights peaks olema automaatselt konfigureeritud
# Kontrolli konfiguratsiooni:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Määrake AI-spetsiifiline monitooring:**

Lisage AI operatsioonide kohandatud mõõdikud:
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

### **Laboriharjutus 4.1: Turbeaudit**

**Ülesanne**: Kontrollige oma juurutust turvalisuse parimate tavade suhtes.

**Kontrollnimekiri:**
- [ ] Koodis või konfiguratsioonis ei ole kõvakodeeritud saladusi
- [ ] Teenusevahelise autentimise jaoks kasutatakse hallatud identiteeti
- [ ] Key Vault salvestab tundlikku konfiguratsiooni
- [ ] Võrgu ligipääs on asjakohaselt piiratud
- [ ] Monitooring ja logimine on lubatud

## Moodul 5: Oma AI rakenduse konverteerimine

### Samm 5.1: Hinnangu tööleht

**Enne oma rakenduse konverteerimist** vastake järgmistele küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid teie rakendus kasutab?
   - Milliseid arvutusressursse see vajab?
   - Kas see vajab andmebaasi?
   - Millised on teenustevahelised sõltuvused?

2. **Turvalisuse nõuded:**
   - Millist tundlikku teavet teie rakendus haldab?
   - Millised on täitmise nõuded?
   - Kas vajate privaatset võrgustikku?

3. **Skaalumise nõuded:**
   - Milline on oodatav koormus?
   - Kas vajate automaatset skaleerimist?
   - Kas on piirkondlikud nõuded?

### Samm 5.2: Looge oma AZD mall

**Järgige seda mustrit oma rakenduse konverteerimiseks:**

1. **Looge põhistruktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Algata AZD mall
azd init --template minimal
```

2. **Looge azure.yaml:**
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

3. **Looge infrastruktuuri mallid:**

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

### **Laboriharjutus 5.1: Malle loomise väljakutse**

**Väljakutse:** Looge AZD mall dokumenditöötluse AI rakendusele.

**Nõuded:**
- Microsoft Foundry mudelid sisuanalüüsiks
- Document Intelligence OCR-iks
- Salvestuskonto dokumendilaadimiseks
- Funktsioonirakendus töötlemisloogikaks
- Veebirakendus kasutajaliideseks

**Lisapunktid:**
- Lisage korralik veahaldus
- Hinnake kulusid
- Seadistage monitooringu armatuurlaud

## Moodul 6: Levinud probleemide tõrkeotsing

### Levinud juurutamise probleemid

#### Probleem 1: OpenAI teenuse kvota ületatud
**Sümptomid:** Juurutamine ebaõnnestub kvota veaga
**Lahendused:**
```bash
# Kontrolli praeguseid kvotasid
az cognitiveservices usage list --location eastus

# Taotle kvota suurendamist või proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel ei ole piirkonnas saadaval
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutusvead
**Lahendused:**
```bash
# Kontrolli mudeli saadavust piirkonna kaupa
az cognitiveservices model list --location eastus

# Uuenda saadavalolevale mudelile
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Probleem 3: Õiguste probleemid
**Sümptomid:** 403 keelatud vead AI teenuseid kutsudes
**Lahendused:**
```bash
# Kontrolli rolli määramisi
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Lisa puuduvad rollid
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Jõudluse probleemid

#### Probleem 4: AI vastused on aeglased
**Uurimissammud:**
1. Kontrollige Application Insights jõudlusmõõdikuid
2. Vaadake Azure portaali OpenAI teenuse mõõdikuid
3. Kontrollige võrguühendust ja latentsust

**Lahendused:**
- Rakendage sagedaste päringute vahemällu salvestust
- Kasutage oma kasutusjuhtumi jaoks sobivat OpenAI mudelit
- Kaaluge lugemisreplikaate kõrge koormuse korral

### **Laboriharjutus 6.1: Silumise väljakutse**

**Stsenaarium:** Teie juurutamine õnnestus, kuid rakendus tagastab 500 vigu.

**Silumise ülesanded:**
1. Kontrollige rakenduse logisid
2. Kontrollige teenuse ühenduvust
3. Testige autentimist
4. Vaadake konfiguratsiooni üle

**Kasutatavad tööriistad:**
- `azd show` juurutuse ülevaate jaoks
- Azure portaal teenuste üksikasjalike logide jaoks
- Application Insights rakendustelemeetria jaoks

## Moodul 7: Monitooring ja optimeerimine

### Samm 7.1: Looge põhjalik monitooring

1. **Looge kohandatud armatuurlauad:**

Minge Azure portaalile ja looge armatuurlaud, kus on:
- OpenAI päringute arv ja latentsus
- Rakenduse veamäärad
- Ressursside kasutus
- Kulude jälgimine

2. **Seadistage teavitused:**
```bash
# Häire kõrge veamäära kohta
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Samm 7.2: Kuluoptimeerimine

1. **Analüüsige praeguseid kulusid:**
```bash
# Kasutage kulude andmete saamiseks Azure CLI-t
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakendage kulukontrollid:**
- Seadistage eelarve teavitused
- Kasutage automaatse skaleerimise poliitikaid
- Rakendage päringute vahemällu salvestus
- Jälgige OpenAI tokenite kasutust

### **Laboriharjutus 7.1: Jõudluse optimeerimine**

**Ülesanne:** Optimeerige oma AI rakendus nii jõudluse kui ka kulu osas.

**Parandatavad mõõdikud:**
- Vähendage keskmist vastuse aega 20% võrra
- Vähendage kuukulusid 15% võrra
- Säilitage 99,9% tööaega

**Proovimiseks soovitatavad strateegiad:**
- Rakendage vastuste vahemällu salvestust
- Optimeerige prompte tokenite efektiivsuse jaoks
- Kasutage sobivaid arvutikõrgusi
- Seadistage korralik automaatne skaleerimine

## Lõplik väljakutse: Lõpp-lõpuni rakendus

### Väljakutse stsenaarium

Teil on ülesandeks luua tootmisvalmis AI-toega klienditeeninduse vestlusrobot koos järgmiste nõuetega:

**Funktsionaalsed nõuded:**
- Veebiliides kliendi suhtluseks
- Integratsioon Microsoft Foundry mudelitega vastusteks
- Dokumendihõive võimekus Azure AI Search abil
- Integratsioon olemasoleva kliendiandmebaasiga
- Mitmekeelsuse tugi

**Mitteinformatiivsed nõuded:**
- Käsitleb 1000 samaaegset kasutajat
- 99,9% tööaja SLA
- SOC 2 vastavus
- Kulu alla 500 $ kuus
- Juurutage mitmesse keskkonda (arendus, testimine, tootmine)

### Rakendussammud

1. **Disainige arhitektuur**
2. **Looge AZD mall**
3. **Rakendage turvameetmed**
4. **Seadistage monitooring ja teavitused**
5. **Looge juurutuse torud**
6. **Dokumenteerige lahendus**

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus**: Kas see vastab kõigile nõuetele?
- ✅ **Turvalisus**: Kas on rakendatud parimad praktikad?
- ✅ **Skaalautuvus**: Kas suudab koormust hallata?
- ✅ **Hooldatavus**: Kas kood ja infrastruktuur on hästi organiseeritud?
- ✅ **Kulu**: Kas jääb eelarve piiridesse?

## Lisamaterjalid

### Microsofti dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry mudelite teenuste dokumentatsioon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Microsoft Foundry mudelite vestlusrakendus](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App kiirstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Ühiskonna ressursid
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Lõputunnistus

Palju õnne! Olete lõpetanud AI töötoa. Nüüd peaksite oskama:

- ✅ Konverteerida olemasolevaid AI rakendusi AZD mallideks
- ✅ Paigaldada tootmiskõlblikke AI rakendusi
- ✅ Teostada AI töökoormuste turvalisuse parimaid tavasid
- ✅ Jälgida ja optimeerida AI rakenduste jõudlust
- ✅ Lahendada tavapäraseid paigaldusprobleeme

### Järgmised sammud
1. Rakenda need mustrid omaenda AI projektides
2. Panusta mallid tagasi kogukonda
3. Liitu Microsoft Foundry Discordiga, et saada jätkuvat tuge
4. Uuri keerukamaid teemasid, nagu mitmeregioonilised paigaldused

---

**Töötoa tagasiside**: Aita meil seda töötoad parandada, jagades oma kogemusi [Microsoft Foundry Discordi #Azure kanalil](https://discord.gg/microsoft-azure).

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI esmane arendus
- **⬅️ Eelmine**: [AI mudeli paigaldus](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmisalased AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Vaja abi?** Liitu meie kogukonnaga, et saada tuge ja arutada AZD ja AI paigalduste üle.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->