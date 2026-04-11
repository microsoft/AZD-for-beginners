# AI töötuba: Teie AI lahenduste AZD-depluinta

**Peatükkide navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Käesolev peatükk**: Peatükk 2 - AI-eelne arendamine
- **⬅️ Eelmine**: [AI mudeli juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Produktiivse AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

## Töötuba Ülevaade

See praktiline labor juhendab arendajaid protsessis, kuidas võtta olemasolev AI mall ja juurutada see Azure Developer CLI-ga (AZD). Õpite olulisi mustreid, mis on vajalikud tootmiskõlblike AI juurutuste jaoks, kasutades Microsoft Foundry teenuseid.

> **Kinnituse märkus (2026-03-25):** See töötuba vaadati üle `azd` versiooniga `1.23.12`. Kui teie kohalik paigaldus on vanem, uuendage AZD enne alustamist, et autoriseerimise, malli ja juurutamise töövoog vastaks allolevatele sammudele.

**Kestus:** 2-3 tundi  
**Tase:** Kesktase  
**Eelteadmised:** Põhilised teadmised Azure’ist, AI/ML kontseptsioonidega tutvumine

## 🎓 Õpieesmärgid

Selle töötuba lõpuks suudate:
- ✅ Muuta olemasolev AI rakendus kasutama AZD malle
- ✅ Konfigureerida Microsoft Foundry teenuseid AZD-ga
- ✅ Rakendada turvalist mandaatide haldust AI teenustele
- ✅ Juurutada tootmiskõlblikke AI rakendusi koos jälgimisega
- ✅ Lahendada tavapäraseid AI juurutamise probleeme

## Eelteadmised

### Vajalikud tööriistad
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) paigaldatud
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) paigaldatud
- [Git](https://git-scm.com/) paigaldatud
- Koodiredaktor (soovitatavalt VS Code)

### Azure ressursid
- Azure tellimus kontribuutori juurdepääsuga
- Juurdepääs Microsoft Foundry mudelite teenustele (või võimalus juurdepääsu taotleda)
- Ressursigrupi loomise õigused

### Teadmiste eeldused
- Põhiline Azure teenuste mõistmine
- Käsurida kasutamise kogemus
- Põhilised AI/ML kontseptsioonid (API-d, mudelid, prompt'id)

## Labori seadistamine

### Samm 1: Keskkonna ettevalmistus

1. **Kontrolli tööriistade paigaldust:**
```bash
# Kontrolli AZD paigaldust
azd version

# Kontrolli Azure CLI
az --version

# Logi Azure'i sisse AZD töövoogude jaoks
azd auth login

# Logi Azure CLI sisse ainult siis, kui plaanid diagnostika käigus käivitada az käsklusi
az login
```

Kui töötate mitme rentniku vahel või teie tellimus ei tuvastu automaatselt, proovige uuesti käsuga `azd auth login --tenant-id <tenant-id>`.

2. **Klooni töötuba hoidla:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Moodul 1: AZD struktuuri mõistmine AI rakenduste jaoks

### AI AZD malli anatoomia

Uurige peamisi faile AI-valmis AZD mallis:

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

### **Labori harjutus 1.1: Konfiguratsiooni uurimine**

1. **Vaata azure.yaml faili:**
```bash
cat azure.yaml
```

**Mida jälgida:**
- AI komponentide teenuste definitsioonid
- Keskkonnamuutujate kaardistused
- Hostimise konfiguratsioonid

2. **Vaata üle main.bicep infrastruktuur:**
```bash
cat infra/main.bicep
```

**Olulised AI mustrid:**
- Microsoft Foundry mudelite teenuse loomine
- Cognitive Search integreerimine
- Turvaline võtmehaldussüsteem
- Võrgu turvakonfiguratsioonid

### **Arutelupunkt:** Miks need mustrid AI jaoks olulised on

- **Teenuste sõltuvused:** AI rakendused vajavad tihti mitut koordineeritud teenust  
- **Turvalisus:** API võtmed ja lõpp-punktid vajavad turvalist haldust  
- **Skaalautuvus:** AI töökoormustel on unikaalsed skaleerimisvajadused  
- **Kulude haldus:** AI teenused võivad olla kulukad, kui neid korralikult ei seadistata  

## Moodul 2: Esimese AI rakenduse juurutamine

### Samm 2.1: Keskkonna initsialiseerimine

1. **Loo uus AZD keskkond:**
```bash
azd env new myai-workshop
```

2. **Sea vajalikud moodustamisparameetrid:**
```bash
# Määrake oma eelistatud Azure'i piirkond
azd env set AZURE_LOCATION eastus

# Valikuline: määrake konkreetne OpenAI mudel
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Samm 2.2: Infrastruktuuri ja rakenduse juurutamine

1. **Juuruta AZD-ga:**
```bash
azd up
```

**Mis toimub käsku `azd up` täites:**
- ✅ Luuakse Microsoft Foundry mudelite teenus  
- ✅ Luuakse Cognitive Search teenus  
- ✅ Seadistatakse App Service veebirakendusele  
- ✅ Konfigureeritakse võrgud ja turvalisus  
- ✅ Juurutatakse rakenduse kood  
- ✅ Seadistatakse jälgimine ja logimine  

2. **Jälgi juurutuse edenemist** ja märgi loodavad ressursid.

### Samm 2.3: Juurutuse kontrollimine

1. **Kontrolli juurutatud ressursse:**
```bash
azd show
```

2. **Ava juurutatud rakendus:**
```bash
azd show
```

Ava veebiaadress, mis on näidatud käsus `azd show`.

3. **Testi AI funktsionaalsust:**
   - Ava veebirakendus  
   - Proovi näitepäringuid  
   - Kontrolli, kas AI vastused toimivad  

### **Labori harjutus 2.1: Probleemide lahendamise praktika**

**Stsenaarium**: Sinu juurutus õnnestus, aga AI ei vasta.

**Tavalisimad probleemid, mida kontrollida:**
1. **OpenAI API võtmed:** Kinnita, et need on õigesti seadistatud  
2. **Mudeli saadavus:** Kontrolli, kas sinu regioon toetab mudelit  
3. **Võrguühendus:** Veendu, et teenused saavad omavahel suhelda  
4. **RBAC õigused:** Veendu, et rakendus pääseb OpenAI-le ligi  

**Silumis käsud:**
```bash
# Kontrolli keskkonnamuutujaid
azd env get-values

# Vaata juurutuslogisid
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Kontrolli OpenAI juurutuseolekut
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Moodul 3: AI rakenduste kohandamine vastavalt vajadustele

### Samm 3.1: AI konfiguratsiooni muutmine

1. **Uuenda OpenAI mudelit:**
```bash
# Vaheta teise mudeli vastu (kui teie piirkonnas saadaval)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Taaspaiguta uue konfiguratsiooniga
azd deploy
```

2. **Lisa täiendavad AI teenused:**

Muuda `infra/main.bicep` ja lisa Document Intelligence:

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

**Parim tava:** Erinevad konfiguratsioonid arenduseks ja tootmiseks.

1. **Loo tootmiskeskkond:**
```bash
azd env new myai-production
```

2. **Sea tootmiskonfiguratsiooni parameetrid:**
```bash
# Tootmises kasutatakse tavaliselt kõrgemaid SKU-sid
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Luba täiendavad turvafunktsioonid
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Labori harjutus 3.1: Kulu optimeerimine**

**Väljakutse:** Konfigureeri mall kulutõhusa arenduse jaoks.

**Ülesanded:**
1. Tuleta välja, millised SKU-d saab seada tasuta/põhitasemele  
2. Konfigureeri keskkonnamuutujad minimaalsete kuludega  
3. Juuruta ja võrdle kulusid tootmiskonfiguratsiooniga  

**Lahenduse vihjed:**
- Kasuta võimalusel Cognitive Services puhul F0 tasuta plaani  
- Kasuta arenduses Search teenuse Basic taset  
- Mõtle Functions-i puhul tarbijapõhise plaani peale  

## Moodul 4: Turvalisus ja tootmisparimad tavad

### Samm 4.1: Mandaatide turvaline haldus

**Praegune probleem:** Paljud AI rakendused kasutavad API võtmeid kõvas kodeeringus või ebaturvalises salvestuses.

**AZD lahendus:** Managed Identity + Key Vault integreerimine.

1. **Vaata üle turvakonfiguratsioon oma mallis:**
```bash
# Otsi Key Vault ja hallatud identiteedi seadistust
grep -r "keyVault\|managedIdentity" infra/
```

2. **Kontrolli, et Managed Identity töötab:**
```bash
# Kontrolli, kas veebirakendusel on õige identiteedikinnitusseadistus
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Samm 4.2: Võrgu turvalisus

1. **Luba privaatsed lõpp-punktid** (kui pole veel konfigureeritud):

Lisa oma bicep mallile:
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

### Samm 4.3: Jälgimine ja vaatlevus

1. **Seadista Application Insights:**
```bash
# Application Insights tuleks automaatselt seadistada
# Kontrolli seadistust:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Seadista AI spetsiifiline jälgimine:**

Lisa AI toimingute kohandatud mõõdikud:
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

### **Labori harjutus 4.1: Turvalisuse audit**

**Ülesanne**: Vaata üle oma juurutus turvalisuse parimate tavade osas.

**Kontrollnimekiri:**
- [ ] Puuduvad kõvad kodeeritud saladused koodis või konfiguratsioonis  
- [ ] Kasutatakse Managed Identity teenuste autentimiseks  
- [ ] Key Vault hoiab tundlikku konfiguratsiooni  
- [ ] Võrgu juurdepääs on õigesti piiratud  
- [ ] Jälgimine ja logimine on lubatud  

## Moodul 5: Oma AI rakenduse teisendamine

### Samm 5.1: Hindamisleht

**Enne rakenduse teisendamist** vasta neile küsimustele:

1. **Rakenduse arhitektuur:**
   - Milliseid AI teenuseid rakendus kasutab?  
   - Milliseid arvutusressursse vajab?  
   - Kas on vaja andmebaasi?  
   - Millised on teenustevahelised sõltuvused?  

2. **Turvanõuded:**
   - Milliseid tundlikke andmeid rakendus töötleb?  
   - Millised vastavusnõuded on?  
   - Kas on vaja privaatvõrku?  

3. **Skaalavusnõuded:**
   - Milline on oodatav koormus?  
   - Kas on vajadus automaatseks skaleerimiseks?  
   - Kas on piirkondlikud nõuded?  

### Samm 5.2: Loo oma AZD mall

**Järgi seda mustrit, et muuta oma rakendus:**

1. **Loo põhiline struktuur:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Algata AZD mall
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

### **Labori harjutus 5.1: Malle loomise väljakutse**

**Väljakutse:** Loo AZD mall dokumenditöötluse AI rakenduse jaoks.

**Nõuded:**
- Microsoft Foundry mudelid sisu analüüsiks  
- Document Intelligence OCR-iks  
- Salvestuskonto dokumendi üleslaadimiseks  
- Function App töötlemisloogika jaoks  
- Veebirakendus kasutajaliidese jaoks  

**Lisapunktid:**
- Lisa korralik veahaldus  
- Sisalda kuluarvutused  
- Seadista jälgimise armatuurlauad  

## Moodul 6: Tavapäraste probleemide lahendamine

### Tavapärased juurutusprobleemid

#### Probleem 1: OpenAI teenuse kvota ületatud
**Sümptomid:** Juurutus ebaõnnestub kvota veaga  
**Lahendused:**
```bash
# Kontrolli praeguseid kvotasid
az cognitiveservices usage list --location eastus

# Taotle kvota suurendamist või proovi teist piirkonda
azd env set AZURE_LOCATION westus2
azd up
```

#### Probleem 2: Mudel pole piirkonnas saadaval
**Sümptomid:** AI vastused ei toimi või mudeli juurutusvead  
**Lahendused:**
```bash
# Kontrolli mudeli kättesaadavust piirkonna järgi
az cognitiveservices model list --location eastus

# Uuenda saadaolevale mudelile
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Probleem 3: Lubade probleemid
**Sümptomid:** 403 keelatud vead AI teenuste kasutamisel  
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
**Uurimisetapid:**
1. Kontrolli Application Insights jõudlusmõõdikuid  
2. Vaata OpenAI teenuse mõõdikuid Azure portaalist  
3. Veendu võrguühenduse ja latentsuse üle  

**Lahendused:**
- Rakenda sagedasti kasutatavate päringute vahemällu salvestus  
- Kasuta oma kasutusjuhtumile sobivat OpenAI mudelit  
- Kaalu loetudikute kasutamist suure koormuse korral  

### **Labori harjutus 6.1: Silumise väljakutse**

**Stsenaarium:** Juurutus õnnestus, aga rakendus tagastab 500 vead.

**Silumisülesanded:**
1. Kontrolli rakenduse logisid  
2. Veendu teenuste ühenduvuses  
3. Testi autentimist  
4. Vaata üle konfiguratsioon  

**Kasutatavad tööriistad:**
- `azd show` juurutuse ülevaate saamiseks  
- Azure portaal, teenuste logide üksikasjalikuks uurimiseks  
- Application Insights telemeetria jaoks  

## Moodul 7: Jälgimine ja optimeerimine

### Samm 7.1: Seadista ulatuslik jälgimine

1. **Loo kohandatud armatuurlaud:**

Mine Azure portaali ja loo armatuurlaud, mis sisaldab:
- OpenAI päringute arvu ja latentsust  
- Rakenduse veamäärasid  
- Ressursside kasutust  
- Kulu jälgimist  

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
# Kasutage kuluandmete saamiseks Azure CLI-d
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Rakenda kulude kontrollimeetmed:**
- Sea eelarve hoiatused  
- Kasuta automaatse skaleerimise poliitikaid  
- Rakenda päringute vahemällu salvestust  
- Jälgi OpenAI tokenite kasutust  

### **Labori harjutus 7.1: Jõudluse optimeerimine**

**Ülesanne:** Optimeeri oma AI rakendus nii jõudluse kui kulu osas.

**Paranda mõõdikuid:**
- Vähenda keskmist vastuse aega 20% võrra  
- Vähenda kuukulusid 15% võrra  
- Hoia 99,9% tööaega  

**Proovi strateegiaid:**
- Rakenda vastuse vahemällu salvestus  
- Optimeeri prompt'e tokeni efektiivsuse jaoks  
- Kasuta sobivaid arvutustaset (SKU-sid)  
- Seadista korralik automaatne skaleerimine  

## Lõplik väljakutse: Täielik rakendus

### Väljakutse stsenaarium

Sinu ülesandeks on luua tootmiskõlblik AI-põhine klienditeeninduse vestlusrobot järgmiste nõuetega:

**Funktsionaalsed nõuded:**
- Veebiliides kliendisuhtluseks  
- Integratsioon Microsoft Foundry mudelitega vastusteks  
- Dokumendi otsingu võimalus Cognitive Search abil  
- Integratsioon olemasoleva kliendiandmebaasiga  
- Mitmekeelne tugi  

**Mittefunktsionaalsed nõuded:**
- Käsitleda 1000 samaaegset kasutajat  
- 99,9% tööaja SLA  
- SOC 2 vastavus  
- Kulu alla $500 kuus  
- Juurutus mitmesse keskkonda (arendus, eeltootmine, tootmine)  

### Rakendamise sammud

1. Kujunda arhitektuur  
2. Loo AZD mall  
3. Rakenda turvameetmed  
4. Seadista jälgimine ja hoiatused  
5. Loo juurutuspipelines  
6. Dokumenteeri lahendus  

### Hindamiskriteeriumid

- ✅ **Funktsionaalsus:** Kas vastab kõigile nõuetele?  
- ✅ **Turvalisus:** Kas on rakendatud parimad tavapõhimõtted?  
- ✅ **Skaalautuvus:** Kas suudab koormust taluda?  
- ✅ **Hooldatavus:** Kas kood ja infrastruktuur on hästi organiseeritud?  
- ✅ **Kulu:** Kas jääb eelarve piiridesse?  

## Täiendavad ressursid

### Microsofti dokumentatsioon
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry mudelite teenuse dokumentatsioon](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentatsioon](https://learn.microsoft.com/azure/ai-studio/)

### Näidismallid
- [Microsoft Foundry mudelite vestlusrakendus](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI vestlusrakenduse kiire alustamine](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso vestlus](https://github.com/Azure-Samples/contoso-chat)

### Kogukonna ressursid
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure arendaja CLI GitHubis](https://github.com/Azure/azure-dev)
- [Awesome AZD mallid](https://azure.github.io/awesome-azd/)

## 🎓 Lõputunnistus

Palju õnne! Oled lõpetanud AI töötuba. Nüüd peaksid saama:

- ✅ Olevaid AI rakendusi teisendada AZD mallideks
- ✅ Paigaldada tootmiseks valmis AI rakendusi
- ✅ Rakendada turvalisuse parimaid tavasid AI töökoormuste jaoks
- ✅ Jälgida ja optimeerida AI rakenduse jõudlust
- ✅ Lahendada levinumaid paigaldusprobleeme

### Järgmised sammud
1. Kasuta neid mustreid oma AI projektides
2. Panusta mallide kaudu kogukonda tagasi
3. Liitu Microsoft Foundry Discordiga pidevaks toeks
4. Uuri edasijõudnute teemasid nagu mitu piirkonda hõlmavad paigaldused

---

**Töötoa tagasiside**: Aita meil seda töötuba paremaks muuta, jagades oma kogemusi [Microsoft Foundry Discord #Azure kanalis](https://discord.gg/microsoft-azure).

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 2 - AI-esmalt arendamine
- **⬅️ Eelmine**: [AI mudelite juurutamine](ai-model-deployment.md)
- **➡️ Järgmine**: [Tootmiskeskkonna AI parimad tavad](production-ai-practices.md)
- **🚀 Järgmine peatükk**: [Peatükk 3: Konfiguratsioon](../chapter-03-configuration/configuration.md)

**Abi vaja?** Liitu meie kogukonnaga toetuse ja arutelude jaoks AZD ja AI paigalduste teemal.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud kasutades tehisintellekti tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi püüdleme täpsuse poole, palun arvestage, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud arusaamatuste ega valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->