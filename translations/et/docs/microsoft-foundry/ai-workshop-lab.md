<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8b26783231714a00efafee3aca8b233c",
  "translation_date": "2025-11-24T15:26:36+00:00",
  "source_file": "docs/microsoft-foundry/ai-workshop-lab.md",
  "language_code": "et"
}
-->
# AI Workshop Lab: Teie AI-lahenduste AZD-ga juurutamine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-põhine arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmise AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

## Töötoa ülevaade

See praktiline labor juhendab arendajaid olemasoleva AI-malli kasutuselevõtmisel Azure Developer CLI (AZD) abil. Õpite olulisi mustreid tootmise AI juurutamiseks, kasutades Microsoft Foundry teenuseid.

**Kestus:** 2-3 tundi  
**Tase:** Keskmine  
**Eeltingimused:** Põhiteadmised Azure'ist, AI/ML kontseptsioonide tundmine

## 🎓 Õpieesmärgid

Töötoa lõpuks suudate:
- ✅ Muuta olemasoleva AI-rakenduse AZD mallide kasutamiseks
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD-ga
- ✅ Rakendada turvalist volituste haldamist AI-teenuste jaoks
- ✅ Juurutada tootmisvalmis AI-rakendusi koos jälgimisega
- ✅ Lahendada levinud AI juurutamise probleeme

## Eeltingimused

### Vajalikud tööriistad
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) paigaldatud
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) paigaldatud
- [Git](https://git-scm.com/) paigaldatud
- Koodiredaktor (soovitatav VS Code)

### Azure'i ressursid
- Azure'i tellimus koos kaastöötaja juurdepääsuga
- Juurdepääs Azure OpenAI teenustele (või võimalus taotleda juurdepääsu)
- Ressursigrupi loomise õigused

### Teadmiste eeltingimused
- Põhiteadmised Azure'i teenustest
- Käsurealiideste tundmine
- Põhilised AI/ML kontseptsioonid (API-d, mudelid, päringud)

## Labori seadistamine

### Samm 1: Keskkonna ettevalmistamine

1. **Kontrollige tööriistade paigaldust:**
```bash
# Kontrolli AZD paigaldust
azd version

# Kontrolli Azure CLI-d
az --version

# Logi sisse Azure'i
az login
azd auth login
```

2. **Kloonige töötoa repositoorium:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI-rakenduste jaoks

### AI-valmis AZD malli anatoomia

Tutvuge AI-valmis AZD malli põhifailidega:

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

1. **Vaadake üle azure.yaml fail:**
```bash
cat azure.yaml
```

**Mida otsida:**
- Teenuste määratlused AI komponentide jaoks
- Keskkonnamuutujate kaardistamine
- Hostide konfiguratsioonid

2. **Vaadake üle main.bicep infrastruktuur:**
```bash
cat infra/main.bicep
```

**Peamised AI mustrid, mida tuvastada:**
- Azure OpenAI teenuse ettevalmistamine
- Cognitive Search integratsioon
- Turvaline võtmete haldamine
- Võrguturbe konfiguratsioonid

### **Arutelu punkt:** Miks need mustrid on AI jaoks olulised

- **Teenuste sõltuvused**: AI rakendused vajavad sageli mitme teenuse koordineerimist
- **Turvalisus**: API võtmed ja lõpp-punktid vajavad turvalist haldamist
- **Mastaapsus**: AI töökoormustel on unikaalsed mastaapsusnõuded
- **Kulude haldamine**: AI teenused võivad olla kallid, kui neid ei konfigureerita õigesti

## Moodul 2: Esimese AI-rakenduse juurutamine

### Samm 2.1: Keskkonna initsialiseerimine

1. **Looge uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Määrake vajalikud parameetrid:**
```bash
# Määrake oma eelistatud Azure'i piirkond
azd env set AZURE_LOCATION eastus

# Valikuline: Määrake konkreetne OpenAI mudel
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juurutage AZD-ga:**
```bash
azd up
```

**Mis toimub `azd up` käivitamisel:**
- ✅ Azure OpenAI teenuse ettevalmistamine
- ✅ Cognitive Search teenuse loomine
- ✅ Veebirakenduse jaoks App Service seadistamine
- ✅ Võrgu ja turvalisuse konfiguratsioon
- ✅ Rakenduse koodi juurutamine
- ✅ Jälgimise ja logimise seadistamine

2. **Jälgige juurutamise edenemist** ja märkige loodud ressursid.

### Samm 2.3: Juurutamise kontrollimine

1. **Kontrollige juurutatud ressursse:**
```bash
azd show
```

2. **Avage juurutatud rakendus:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Testige AI funktsionaalsust:**
   - Navigeerige veebirakendusse
   - Proovige näidispäringuid
   - Kontrollige, kas AI vastused töötavad

### **Laboriharjutus 2.1: Tõrkeotsingu praktika**

**Stsenaarium**: Teie juurutamine õnnestus, kuid AI ei vasta.

**Levinud probleemid, mida kontrollida:**
1. **OpenAI API võtmed**: Kontrollige, kas need on õigesti seadistatud
2. **Mudelite saadavus**: Kontrollige, kas teie piirkond toetab mudelit
3. **Võrguühendus**: Veenduge, et teenused saavad suhelda
4. **RBAC õigused**: Kontrollige, kas rakendus pääseb OpenAI-le ligi

**Tõrkeotsingu käsud:**
```bash
# Kontrolli keskkonnamuutujaid
azd env get-values

# Vaata juurutamise logisid
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrolli OpenAI juurutamise olekut
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: AI-rakenduste kohandamine vastavalt vajadustele

### Samm 3.1: AI konfiguratsiooni muutmine

1. **Uuendage OpenAI mudelit:**
```bash
# Vaheta teise mudeli vastu (kui see on sinu piirkonnas saadaval)
azd env set AZURE_OPENAI_MODEL gpt-4

# Paigalda uuesti uue konfiguratsiooniga
azd deploy
```

2. **Lisage täiendavaid AI teenuseid:**

Redigeerige `infra/main.bicep`, et lisada Document Intelligence:

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

**Parim tava**: Erinevad konfiguratsioonid arenduse ja tootmise jaoks.

1. **Looge tootmiskeskkond:**
```bash
azd env new myai-production
```

2. **Määrake tootmispõhised parameetrid:**
```bash
# Tootmine kasutab tavaliselt kõrgemaid SKU-sid
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Luba täiendavad turvafunktsioonid
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboriharjutus 3.1: Kulude optimeerimine**

**Väljakutse**: Konfigureerige mall kulutõhusaks arenduseks.

**Ülesanded:**
1. Tuvastage, millised SKU-d saab seadistada tasuta/põhitasemele
2. Konfigureerige keskkonnamuutujad minimaalsete kulude jaoks
3. Juurutage ja võrrelge kulusid tootmiskonfiguratsiooniga

**Lahenduse vihjed:**
- Kasutage Cognitive Services jaoks võimalusel F0 (tasuta) taset
- Kasutage arenduses Search Service jaoks Basic taset
- Kaaluge Functions jaoks tarbimiskava kasutamist

## Moodul 4: Turvalisus ja tootmise parimad tavad

### Samm 4.1: Turvaline volituste haldamine

**Praegune väljakutse**: Paljud AI rakendused kodeerivad API võtmed või kasutavad ebaturvalist salvestust.

**AZD lahendus**: Hallatud identiteet + Key Vault integratsioon.

1. **Vaadake üle turvakonfiguratsioon oma mallis:**
```bash
# Otsi Key Vaulti ja Hallatud Identiteedi konfiguratsiooni
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrollige, kas hallatud identiteet töötab:**
```bash
# Kontrollige, kas veebirakendusel on õige identiteedi konfiguratsioon
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrguturve

1. **Lubage privaatsed lõpp-punktid** (kui pole veel konfigureeritud):

Lisage oma bicep mallile:
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

### Samm 4.3: Jälgimine ja nähtavus

1. **Konfigureerige Application Insights:**
```bash
# Rakenduse ülevaated peaksid olema automaatselt konfigureeritud
# Kontrolli konfiguratsiooni:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Seadistage AI-spetsiifiline jälgimine:**

Lisage kohandatud mõõdikud AI operatsioonide jaoks:
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

**Ülesanne**: Vaadake oma juurutus üle turvalisuse parimate tavade osas.

**Kontrollnimekiri:**
- [ ] Koodis või konfiguratsioonis pole kõvakodeeritud võtmeid
- [ ] Hallatud identiteeti kasutatakse teenustevaheliseks autentimiseks
- [ ] Key Vault salvestab tundlikku konfiguratsiooni
- [ ] Võrguühendus on korralikult piiratud
- [ ] Jälgimine ja logimine on lubatud

## Moodul 5: Oma AI-rakenduse konverteerimine

### Samm 5.1: Hindamisleht

**Enne oma rakenduse konverteerimist** vastake järgmistele küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid teie rakendus kasutab?
   - Milliseid arvutusressursse see vajab?
   - Kas see vajab andmebaasi?
   - Millised on teenuste vahelised sõltuvused?

2. **Turvanõuded:**
   - Milliseid tundlikke andmeid teie rakendus käsitleb?
   - Millised vastavusnõuded teil on?
   - Kas vajate privaatset võrku?

3. **Mastaapsusnõuded:**
   - Milline on teie eeldatav koormus?
   - Kas vajate automaatset mastaapsust?
   - Kas on piirkondlikke nõudeid?

### Samm 5.2: Looge oma AZD mall

**Järgige seda mustrit oma rakenduse konverteerimiseks:**

1. **Looge põhistruktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initsialiseeri AZD mall
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

### **Laboriharjutus 5.1: Malli loomise väljakutse**

**Väljakutse**: Looge AZD mall dokumenditöötluse AI rakenduse jaoks.

**Nõuded:**
- Azure OpenAI sisu analüüsiks
- Document Intelligence OCR-i jaoks
- Storage Account dokumentide üleslaadimiseks
- Function App töötlemisloogika jaoks
- Veebirakendus kasutajaliidese jaoks

**Boonuspunktid:**
- Lisage korralik veakäsitlus
- Kaasake kulude hindamine
- Seadistage jälgimise armatuurlauad

## Moodul 6: Levinud probleemide tõrkeotsing

### Levinud juurutamise probleemid

#### Probleem 1: OpenAI teenuse kvoot ületatud
**Sümptomid:** Juurutamine ebaõnnestub kvoodi veaga
**Lahendused:**
```bash
# Kontrolli praeguseid kvoote
az cognitiveservices usage list --location eastus

# Taotle kvoodi suurendamist või proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole piirkonnas saadaval
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutamise vead
**Lahendused:**
```bash
# Kontrolli mudeli saadavust piirkonna järgi
az cognitiveservices model list --location eastus

# Uuenda saadaval olevaks mudeliks
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probleem 3: Õiguste probleemid
**Sümptomid:** 403 Keelatud vead AI teenuste kutsumisel
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
**Uurimissammud:**
1. Kontrollige Application Insightsi jõudlusmõõdikuid
2. Vaadake OpenAI teenuse mõõdikuid Azure'i portaalis
3. Kontrollige võrguühendust ja latentsust

**Lahendused:**
- Rakendage vahemälu korduvate päringute jaoks
- Kasutage oma kasutusjuhtumi jaoks sobivat OpenAI mudelit
- Kaaluge lugemisreplikaid suure koormuse korral

### **Laboriharjutus 6.1: Tõrkeotsingu väljakutse**

**Stsenaarium**: Teie juurutamine õnnestus, kuid rakendus tagastab 500 vead.

**Tõrkeotsingu ülesanded:**
1. Kontrollige rakenduse logisid
2. Kontrollige teenuste ühenduvust
3. Testige autentimist
4. Vaadake üle konfiguratsioon

**Tööriistad, mida kasutada:**
- `azd show` juurutuse ülevaate jaoks
- Azure'i portaal üksikasjalike teenuste logide jaoks
- Application Insights rakenduse telemeetria jaoks

## Moodul 7: Jälgimine ja optimeerimine

### Samm 7.1: Põhjaliku jälgimise seadistamine

1. **Looge kohandatud armatuurlauad:**

Navigeerige Azure'i portaali ja looge armatuurlaud koos:
- OpenAI päringute arvu ja latentsusega
- Rakenduse veamääradega
- Ressursside kasutusega
- Kulude jälgimisega

2. **Seadistage hoiatused:**
```bash
# Teade kõrge veamäära kohta
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Samm 7.2: Kulude optimeerimine

1. **Analüüsige praeguseid kulusid:**
```bash
# Kasuta Azure CLI-d, et saada kulude andmeid
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakendage kulude kontrolli:**
- Seadistage eelarvehoiatused
- Kasutage automaatse mastaapsuse poliitikaid
- Rakendage päringute vahemälu
- Jälgige OpenAI tokenite kasutust

### **Laboriharjutus 7.1: Jõudluse optimeerimine**

**Ülesanne**: Optimeerige oma AI rakendus nii jõudluse kui ka kulude osas.

**Parandatavad mõõdikud:**
- Vähendage keskmist vastuseaega 20%
- Vähendage igakuiseid kulusid 15%
- Säilitage 99.9% tööaeg

**Strateegiad, mida proovida:**
- Rakendage vastuste vahemälu
- Optimeerige päringuid tokenite tõhususe jaoks
- Kasutage sobivaid arvutusressursse
- Seadistage korralik automaatne mastaapsus

## Lõplik väljakutse: Lõpuni viidud rakendamine

### Väljakutse stsenaarium

Teie ülesanne on luua tootmisvalmis AI-põhine klienditeeninduse vestlusrobot järgmiste nõuetega:

**Funktsionaalsed nõuded:**
- Veebiliides kliendi interaktsioonide jaoks
- Integratsioon Azure OpenAI-ga vastuste jaoks
- Dokumendiotsingu võimekus Cognitive Search abil
- Integratsioon olemasoleva kliendibaasiga
- Mitmekeelne tugi

**Mittefunktsionaalsed nõuded:**
- Toetab 1000 samaaegset kasutajat
- 99.9% tööaja SLA
- SOC 2 vastavus
- Kulu alla $500/kuus
- Juurutamine mitmesse keskkonda (arendus, testimine, tootmine)

### Rakendamise sammud

1. **Kavandage arhitektuur**
2. **Looge AZD mall**
3. **Rakendage turvameetmed**
4. **Seadistage jälgimine ja hoiatused**
5. **Looge juurutustorud**
6. **Dokumenteerige lahendus**

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus**: Kas see vastab kõigile nõuetele?
- ✅ **Turvalisus**: Kas parimad tavad on rakendatud?
- ✅ **Mastaapsus**: Kas see suudab koormust hallata?
- ✅ **Hooldatavus**: Kas kood ja infrastruktuur on hästi organiseeritud?
- ✅ **Kulu**: Kas see jääb eelarvesse?

## Täiendavad ressursid

### Microsofti dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI teenuse dokumentatsioon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Azure OpenAI vestlusrakendus](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI vestlusrakenduse kiirstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso vestlus](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github
Palju õnne! Olete lõpetanud AI Workshop Lab'i. Nüüd peaksite olema võimeline:

- ✅ Muutma olemasolevaid AI rakendusi AZD mallideks
- ✅ Juurutama tootmisvalmis AI rakendusi
- ✅ Rakendama turvalisuse parimaid tavasid AI töökoormuste jaoks
- ✅ Jälgima ja optimeerima AI rakenduste jõudlust
- ✅ Lahendama levinud juurutamise probleeme

### Järgmised sammud
1. Rakendage neid mustreid oma AI projektides
2. Panustage mallidega tagasi kogukonda
3. Liituge Microsoft Foundry Discordiga, et saada pidevat tuge
4. Uurige edasijõudnud teemasid, nagu mitme piirkonna juurutused

---

**Töötoa tagasiside**: Aidake meil seda töötuba paremaks muuta, jagades oma kogemusi [Microsoft Foundry Discord #Azure kanalil](https://discord.gg/microsoft-azure).

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-First arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmise AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

**Vajate abi?** Liituge meie kogukonnaga, et saada tuge ja arutada AZD ja AI juurutuste üle.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->