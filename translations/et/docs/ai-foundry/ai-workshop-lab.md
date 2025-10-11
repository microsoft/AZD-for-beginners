<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-10-11T16:05:32+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "et"
}
-->
# AI Workshop Lab: Teie AI-lahenduste AZD-le juurutatavaks muutmine

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmane arendus
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmise AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

## Töötoa ülevaade

See praktiline labor juhendab arendajaid olemasoleva AI-malli võtmise ja selle Azure Developer CLI (AZD) abil juurutamise protsessis. Õpite olulisi mustreid tootmise AI juurutamiseks, kasutades Azure AI Foundry teenuseid.

**Kestus:** 2-3 tundi  
**Tase:** Keskmine  
**Eeltingimused:** Põhiteadmised Azure'ist, AI/ML kontseptsioonide tundmine

## 🎓 Õpieesmärgid

Töötoa lõpuks suudate:
- ✅ Muuta olemasoleva AI-rakenduse AZD mallide kasutamiseks
- ✅ Konfigureerida Azure AI Foundry teenuseid AZD-ga
- ✅ Rakendada turvalist mandaadihaldust AI-teenuste jaoks
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
- Juurdepääs Azure OpenAI teenustele (või võime taotleda juurdepääsu)
- Ressursigrupi loomise õigused

### Teadmiste eeltingimused
- Põhiteadmised Azure'i teenustest
- Käsurealiideste tundmine
- Põhilised AI/ML kontseptsioonid (API-d, mudelid, päringud)

## Labori seadistamine

### Samm 1: Keskkonna ettevalmistamine

1. **Kontrollige tööriistade paigaldamist:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
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

Uurige AI-valmis AZD malli põhifailide struktuuri:

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
- Turvalise võtmehalduse rakendamine
- Võrguturbe konfiguratsioonid

### **Arutelu punkt:** Miks need mustrid on AI jaoks olulised

- **Teenuste sõltuvused**: AI rakendused vajavad sageli mitme teenuse koordineerimist
- **Turvalisus**: API võtmed ja lõpp-punktid vajavad turvalist haldust
- **Mastaapsus**: AI töökoormustel on unikaalsed mastaapsusnõuded
- **Kulude haldamine**: AI teenused võivad olla kallid, kui neid ei konfigureerita õigesti

## Moodul 2: Juurutage oma esimene AI-rakendus

### Samm 2.1: Keskkonna initsialiseerimine

1. **Looge uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Määrake vajalikud parameetrid:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juurutage AZD-ga:**
```bash
azd up
```

**Mis juhtub `azd up` käivitamisel:**
- ✅ Azure OpenAI teenuse ettevalmistamine
- ✅ Cognitive Search teenuse loomine
- ✅ Veebirakenduse jaoks App Service seadistamine
- ✅ Võrgu ja turvalisuse konfigureerimine
- ✅ Rakenduse koodi juurutamine
- ✅ Jälgimise ja logimise seadistamine

2. **Jälgige juurutamise edenemist** ja märkige loodud ressursid.

### Samm 2.3: Kontrollige oma juurutust

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
4. **RBAC õigused**: Kontrollige, kas rakendus pääseb OpenAI-le juurde

**Tõrkeotsingu käsud:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: AI-rakenduste kohandamine vastavalt teie vajadustele

### Samm 3.1: AI konfiguratsiooni muutmine

1. **Uuendage OpenAI mudelit:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboriharjutus 3.1: Kulude optimeerimine**

**Väljakutse**: Konfigureerige mall kulutõhusaks arenduseks.

**Ülesanded:**
1. Tuvastage, millised SKU-d saab seadistada tasuta/põhitasemele
2. Konfigureerige keskkonnamuutujad minimaalse kulu jaoks
3. Juurutage ja võrrelge kulusid tootmiskonfiguratsiooniga

**Lahenduse vihjed:**
- Kasutage F0 (tasuta) taset Cognitive Services jaoks, kui võimalik
- Kasutage arenduses Search Service jaoks Basic taset
- Kaaluge Functions jaoks tarbimisplaani kasutamist

## Moodul 4: Turvalisus ja tootmise parimad tavad

### Samm 4.1: Turvaline mandaadihaldus

**Praegune väljakutse**: Paljud AI rakendused kodeerivad API võtmed või kasutavad ebaturvalist salvestust.

**AZD lahendus**: Hallatud identiteet + Key Vault integratsioon.

1. **Vaadake üle turvakonfiguratsioon oma mallis:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrollige, kas hallatud identiteet töötab:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrguturvalisus

1. **Lubage privaatlõpp-punktid** (kui pole juba konfigureeritud):

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
# Application Insights should be automatically configured
# Check the configuration:
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
- [ ] Koodis või konfiguratsioonis pole kõvakodeeritud saladusi
- [ ] Hallatud identiteeti kasutatakse teenustevaheliseks autentimiseks
- [ ] Key Vault salvestab tundlikku konfiguratsiooni
- [ ] Võrguühendus on korralikult piiratud
- [ ] Jälgimine ja logimine on lubatud

## Moodul 5: Oma AI-rakenduse konverteerimine

### Samm 5.1: Hindamisleht

**Enne oma rakenduse konverteerimist** vastake neile küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid teie rakendus kasutab?
   - Milliseid arvutusressursse see vajab?
   - Kas see vajab andmebaasi?
   - Millised on teenuste vahelised sõltuvused?

2. **Turvanõuded:**
   - Millist tundlikku teavet teie rakendus käsitleb?
   - Millised vastavusnõuded teil on?
   - Kas vajate privaatvõrku?

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

# Initialize AZD template
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
- Azure OpenAI sisuanalüüsiks
- Document Intelligence OCR-i jaoks
- Dokumentide üleslaadimiseks Storage Account
- Funktsioonirakendus töötlemisloogika jaoks
- Veebirakendus kasutajaliidese jaoks

**Lisapunktid:**
- Lisage korralik veakäsitlus
- Kaasake kulude hinnang
- Seadistage jälgimisdashboarid

## Moodul 6: Levinud probleemide tõrkeotsing

### Levinud juurutamise probleemid

#### Probleem 1: OpenAI teenuse kvoot ületatud
**Sümptomid:** Juurutamine ebaõnnestub kvoodi veaga
**Lahendused:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole piirkonnas saadaval
**Sümptomid:** AI vastused ebaõnnestuvad või mudeli juurutamise vead
**Lahendused:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Probleem 3: Õiguste probleemid
**Sümptomid:** 403 Keelatud vead AI teenuste kutsumisel
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

#### Probleem 4: Aeglased AI vastused
**Uurimissammud:**
1. Kontrollige Application Insightsi jõudlusmõõdikuid
2. Vaadake OpenAI teenuse mõõdikuid Azure'i portaalis
3. Kontrollige võrguühendust ja latentsust

**Lahendused:**
- Rakendage vahemällu salvestamine tavaliste päringute jaoks
- Kasutage oma kasutusjuhtumi jaoks sobivat OpenAI mudelit
- Kaaluge lugemisreplikaid suure koormuse korral

### **Laboriharjutus 6.1: Tõrkeotsingu väljakutse**

**Stsenaarium**: Teie juurutamine õnnestus, kuid rakendus tagastab 500 vead.

**Tõrkeotsingu ülesanded:**
1. Kontrollige rakenduse logisid
2. Kontrollige teenuste ühenduvust
3. Testige autentimist
4. Vaadake konfiguratsioon üle

**Tööriistad, mida kasutada:**
- `azd show` juurutuse ülevaate jaoks
- Azure'i portaal teenuste üksikasjalike logide jaoks
- Application Insights rakenduse telemeetria jaoks

## Moodul 7: Jälgimine ja optimeerimine

### Samm 7.1: Põhjaliku jälgimise seadistamine

1. **Looge kohandatud dashboarid:**

Navigeerige Azure'i portaali ja looge dashboard koos:
- OpenAI päringute arvu ja latentsusega
- Rakenduse veamääradega
- Ressursside kasutusega
- Kulude jälgimisega

2. **Seadistage hoiatused:**
```bash
# Alert for high error rate
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
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakendage kulude kontrolli:**
- Seadistage eelarvehoiatused
- Kasutage automaatse mastaapsuse poliitikaid
- Rakendage päringute vahemällu salvestamist
- Jälgige OpenAI tokenite kasutust

### **Laboriharjutus 7.1: Jõudluse optimeerimine**

**Ülesanne**: Optimeerige oma AI rakendus nii jõudluse kui ka kulude osas.

**Mõõdikud, mida parandada:**
- Vähendage keskmist vastuseaega 20%
- Vähendage igakuiseid kulusid 15%
- Säilitage 99,9% tööaeg

**Strateegiad, mida proovida:**
- Rakendage vastuste vahemällu salvestamist
- Optimeerige päringuid tokenite tõhususe jaoks
- Kasutage sobivaid arvutusressursse
- Seadistage korralik automaatne mastaapsus

## Lõplik väljakutse: Lõpuni viidud rakendamine

### Väljakutse stsenaarium

Teie ülesanne on luua tootmisvalmis AI-toega klienditeeninduse vestlusrobot järgmiste nõuetega:

**Funktsionaalsed nõuded:**
- Veebiliides kliendisuhtluseks
- Integratsioon Azure OpenAI-ga vastuste jaoks
- Dokumentide otsinguvõime Cognitive Searchi abil
- Integratsioon olemasoleva kliendibaasiga
- Mitmekeelne tugi

**Mittefunktsionaalsed nõuded:**
- Toetab 1000 samaaegset kasutajat
- 99,9% tööaja SLA
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
- [Azure AI Foundry dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Azure OpenAI vestlusrakendus](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI vestlusrakenduse kiirstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso vestlus](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid
- [Azure AI Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer
Palju õnne! Olete lõpetanud AI Workshopi labori. Nüüd peaksite olema võimeline:

- ✅ Muutma olemasolevaid AI rakendusi AZD mallideks
- ✅ Juurutama tootmisvalmis AI rakendusi
- ✅ Rakendama turvalisuse parimaid tavasid AI töökoormuste jaoks
- ✅ Jälgima ja optimeerima AI rakenduste jõudlust
- ✅ Lahendama levinud juurutamise probleeme

### Järgmised sammud
1. Rakendage neid mustreid oma AI projektides
2. Panustage mallidega tagasi kogukonda
3. Liituge Azure AI Foundry Discordiga, et saada pidevat tuge
4. Uurige edasijõudnud teemasid, nagu mitme piirkonna juurutused

---

**Töötoa tagasiside**: Aidake meil seda töötuba paremaks muuta, jagades oma kogemusi [Azure AI Foundry Discordi #Azure kanalil](https://discord.gg/microsoft-azure).

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD Algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-Esimene Arendus
- **⬅️ Eelmine**: [AI Mudeli Juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmise AI Parimad Tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../getting-started/configuration.md)

**Vajate abi?** Liituge meie kogukonnaga, et saada tuge ja arutada AZD ja AI juurutuste üle.

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.