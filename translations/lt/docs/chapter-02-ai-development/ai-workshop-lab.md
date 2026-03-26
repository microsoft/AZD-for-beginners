# AI dirbtuvės laboratorija: Kaip padaryti, kad jūsų AI sprendimai būtų diegiami per AZD

**Skyrių naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmasis vystymas
- **⬅️ Ankstesnis**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Kitas**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

## Laboratorijos apžvalga

Ši praktinė laboratorija veda programuotojus per procesą, kaip paimti esamą AI šabloną ir išdiegti jį naudojant Azure Developer CLI (AZD). Išmoksite esminių modelių gamybinio AI diegimo su Microsoft Foundry paslaugomis.

**Trukmė:** 2-3 valandos  
**Lygis:** Tarpinis  
**Išankstiniai reikalavimai:** Pagrindinės Azure žinios, susipažinimas su AI/ML koncepcijomis

## 🎓 Mokymosi tikslai

Baigę šią laboratoriją, sugebėsite:
- ✅ Konvertuoti esamą AI programą, kad ji naudotų AZD šablonus
- ✅ Konfigūruoti Microsoft Foundry paslaugas naudojant AZD
- ✅ Įgyvendinti saugų kredencialų valdymą AI paslaugoms
- ✅ Diegti gamybai paruoštas AI programas su stebėsena
- ✅ Spręsti dažniausiai pasitaikančias AI diegimo problemas

## Išankstiniai reikalavimai

### Reikalingi įrankiai
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegtas
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojama VS Code)

### Azure ištekliai
- Azure prenumerata su contributor prieiga
- Prieiga prie Microsoft Foundry Models paslaugų (arba galimybė prašyti prieigos)
- Teisės kurti resource group

### Reikalingos žinios
- Pagrindinis Azure paslaugų supratimas
- Susipažinimas su komandų eilutės sąsajomis
- Pagrindinės AI/ML sąvokos (APIs, modeliai, prompt'ai)

## Laboratorijos paruošimas

### 1 veiksmas: Aplinkos paruošimas

1. **Patikrinkite įrankių įdiegimus:**
```bash
# Patikrinkite AZD diegimą
azd version

# Patikrinkite Azure CLI
az --version

# Prisijunkite prie Azure
az login
azd auth login
```

2. **Klonuokite laboratorijos repozitoriją:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1 modulis: AZD struktūros supratimas AI programoms

### AI AZD šablono sandara

Išnagrinėkite pagrindinius failus AI paruoštame AZD šablone:

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

### **Laboratorinė užduotis 1.1: Išnagrinėkite konfigūraciją**

1. **Išnagrinėkite failą azure.yaml:**
```bash
cat azure.yaml
```

**Ką vertėtų ieškoti:**
- Paslaugų apibrėžimai AI komponentams
- Aplinkos kintamųjų susiejimai
- Hostų konfigūracijos

2. **Peržiūrėkite infra/main.bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Pagrindiniai AI šablonai, kuriuos reikia identifikuoti:**
- Microsoft Foundry Models paslaugos teikimas
- Cognitive Search integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijos taškas:** Kodėl šie šablonai svarbūs AI

- **Paslaugų priklausomybės**: AI programos dažnai reikalauja kelių suderintų paslaugų
- **Saugumas**: API raktai ir endpoint'ai turi būti saugiai valdomi
- **Mastelio keitimas**: AI užduotims būdingi specifiniai mastelio keitimo reikalavimai
- **Kaštų valdymas**: AI paslaugos gali būti brangios, jei nėra teisingai sukonfigūruotos

## 2 modulis: Išdiekite savo pirmąją AI programą

### 2.1 veiksmas: Inicializuokite aplinką

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikiamus parametrus:**
```bash
# Nustatykite pageidaujamą Azure regioną
azd env set AZURE_LOCATION eastus

# Pasirinktinai: nustatykite konkretų OpenAI modelį
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 2.2 veiksmas: Diegti infrastruktūrą ir programą

1. **Diegimas su AZD:**
```bash
azd up
```

**Kas vyksta vykdant `azd up`:**
- ✅ Sukuria Microsoft Foundry Models paslaugą
- ✅ Sukuria Cognitive Search paslaugą
- ✅ Paruošia App Service žiniatinklio programai
- ✅ Konfigūruoja tinklą ir saugumą
- ✅ Diegia programos kodą
- ✅ Nustato stebėjimą ir žurnalų kaupimą

2. **Stebėkite diegimo eigą** ir atkreipkite dėmesį į kuriamus išteklius.

### 2.3 veiksmas: Patikrinkite diegimą

1. **Patikrinkite įdiegtus išteklius:**
```bash
azd show
```

2. **Atidarykite įdiegtą programą:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Išbandykite AI funkcionalumą:**
   - Pereikite į žiniatinklio programą
   - Išbandykite pavyzdines užklausas
   - Patikrinkite, ar AI atsakymai veikia

### **Laboratorinė užduotis 2.1: Gedimų šalinimo praktika**

**Scenarijus**: Diegimas pavyko, bet AI neatsako.

**Dažnos problemos, kurias verta patikrinti:**
1. **OpenAI API raktai**: Patikrinkite, ar jie tinkamai nustatyti
2. **Modelio prieinamumas**: Patikrinkite, ar jūsų regionas palaiko modelį
3. **Tinklo ryšys**: Užtikrinkite, kad paslaugos gali komunikuoti
4. **RBAC leidimai**: Patikrinkite, ar programa gali pasiekti OpenAI

**Derinimo komandos:**
```bash
# Patikrinti aplinkos kintamuosius
azd env get-values

# Peržiūrėti diegimo žurnalus
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Patikrinti OpenAI diegimo būseną
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3 modulis: Priderinkite AI programas pagal savo poreikius

### 3.1 veiksmas: Pakeiskite AI konfigūraciją

1. **Atnaujinkite OpenAI modelį:**
```bash
# Pakeiskite į kitą modelį (jei jis prieinamas jūsų regione)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Iš naujo įdiekite su nauja konfigūracija
azd deploy
```

2. **Pridėkite papildomas AI paslaugas:**

Redaguokite `infra/main.bicep`, kad pridėtumėte Document Intelligence:

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

### 3.2 veiksmas: Aplinkai specifinės konfigūracijos

**Geriausia praktika**: Skirtingos konfigūracijos kūrimo ir produkcijos aplinkoms.

1. **Sukurkite produkcijos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite produkcijai specifinius parametrus:**
```bash
# Gamyboje paprastai naudojami aukštesnio lygio SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įgalinti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorinė užduotis 3.1: Kaštų optimizavimas**

**Iššūkis**: Konfigūruokite šabloną ekonomiškam vystymui.

**Užduotys:**
1. Nustatykite, kurios SKU gali būti nustatytos į free/basic lygius
2. Konfigūruokite aplinkos kintamuosius minimalioms išlaidoms
3. Išdiekite ir palyginkite išlaidas su produkcijos konfigūracija

**Sprendimo užuominos:**
- Naudokite F0 (nemokamą) lygį Cognitive Services, kai įmanoma
- Vystymui naudokite Basic lygį Search Service
- Apsvarstykite Consumption plan naudojimą Functions

## 4 modulis: Saugumas ir gamybos geriausios praktikos

### 4.1 veiksmas: Saugus kredencialų valdymas

**Dabartinė problema**: Daugelis AI programų įkoduoja API raktus arba naudoja nesaugias saugyklas.

**AZD sprendimas**: Managed Identity + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Ieškokite Key Vault ir valdomos tapatybės konfigūracijos
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, ar Managed Identity veikia:**
```bash
# Patikrinkite, ar žiniatinklio programoje yra teisinga tapatybės konfigūracija
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 veiksmas: Tinklo saugumas

1. **Įgalinkite privačius galinius taškus** (jei dar nekonfigūruota):

Pridėkite į savo bicep šabloną:
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

### 4.3 veiksmas: Stebėsena ir matomumas

1. **Konfigūruokite Application Insights:**
```bash
# Application Insights turėtų būti sukonfigūruotas automatiškai
# Patikrinkite konfigūraciją:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nustatykite AI specifinį stebėjimą:**

Pridėkite pasirinktinius metrikus AI operacijoms:
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

### **Laboratorinė užduotis 4.1: Saugumo auditas**

**Užduotis**: Peržiūrėkite savo diegimą dėl saugumo geriausių praktikų.

**Kontrolinis sąrašas:**
- [ ] Nėra įkoduotų slaptų duomenų kode ar konfigūracijoje
- [ ] Managed Identity naudojama paslaugų tarpusavio autentifikacijai
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Stebėjimas ir žurnalavimas įjungti

## 5 modulis: Konvertuokite savo AI programą

### 5.1 veiksmas: Vertinimo lapas

**Prieš konvertuodami savo programą**, atsakykite į šiuos klausimus:

1. **Programos architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokie kompiuteriniai resursai jai reikalingi?
   - Ar reikalinga duomenų bazė?
   - Kokios priklausomybės tarp paslaugų?

2. **Saugumo reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų programa?
   - Kokie atitikties reikalavimai?
   - Ar reikalingas privatus tinklas?

3. **Mastelio keitimo reikalavimai:**
   - Koks yra jūsų numatomas apkrovimas?
   - Ar reikia auto-scaling?
   - Ar yra regioniniai reikalavimai?

### 5.2 veiksmas: Sukurkite savo AZD šabloną

**Vadovaukitės šiuo pavyzdžiu, kad konvertuotumėte savo programą:**

1. **Sukurkite bazinę struktūrą:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializuoti AZD šabloną
azd init --template minimal
```

2. **Sukurkite azure.yaml:**
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

3. **Sukurkite infrastruktūros šablonus:**

**infra/main.bicep** - Pagrindinis šablonas:
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

**infra/modules/openai.bicep** - OpenAI modulis:
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

### **Laboratorinė užduotis 5.1: Šablono kūrimo iššūkis**

**Iššūkis**: Sukurkite AZD šabloną dokumentų apdorojimo AI programai.

**Reikalavimai:**
- Microsoft Foundry Models turiniui analizuoti
- Document Intelligence OCR
- Saugyklos paskyra dokumentų kėlimui
- Function App apdorojimo logikai
- Žiniatinklio programa vartotojo sąsajai

**Papildomi taškai:**
- Pridėkite tinkamą klaidų valdymą
- Įtraukite kaštų įvertinimą
- Sukurkite stebėjimo informacines paneles

## 6 modulis: Dažnų problemų sprendimas

### Dažnos diegimo problemos

#### Problema 1: OpenAI paslaugos kvotos viršytos
**Simptomai:** Diegimas nepavyksta dėl kvotos klaidos
**Sprendimai:**
```bash
# Patikrinkite esamas kvotas
az cognitiveservices usage list --location eastus

# Prašykite kvotos padidinimo arba pabandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelis neprieinamas regione
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos
**Sprendimai:**
```bash
# Patikrinkite modelio prieinamumą pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinkite į prieinamą modelį
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Leidimų problemos
**Simptomai:** 403 Forbidden klaidos kviečiant AI paslaugas
**Sprendimai:**
```bash
# Patikrinti vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridėti trūkstamus vaidmenis
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Veikimo problemos

#### Problema 4: Lėti AI atsakymai
**Tyrimo žingsniai:**
1. Peržiūrėkite Application Insights dėl našumo metrikų
2. Peržiūrėkite OpenAI paslaugos metrikas Azure portale
3. Patikrinkite tinklo ryšį ir vėlinimą

**Sprendimai:**
- Įgyvendinkite talpyklą dažnoms užklausoms
- Naudokite tinkamą OpenAI modelį savo atvejui
- Apsvarstykite skaitymo replikas didelės apkrovos scenarijams

### **Laboratorinė užduotis 6.1: Derinimo iššūkis**

**Scenarijus**: Diegimas pavyko, bet programa grąžina 500 klaidas.

**Derinimo užduotys:**
1. Patikrinkite programos žurnalus
2. Patikrinkite paslaugų ryšį
3. Išbandykite autentifikaciją
4. Peržiūrėkite konfigūraciją

**Priemonės, kurias naudoti:**
- `azd show` diegimo apžvalgai
- Azure portalas išsamiems paslaugų žurnalams
- Application Insights programos telemetrijai

## 7 modulis: Stebėsena ir optimizavimas

### 7.1 veiksmas: Nustatykite išsamią stebėseną

1. **Sukurkite pasirinktines informacines paneles:**

Eikite į Azure portalą ir sukurkite panelę su:
- OpenAI užklausų skaičius ir vėlinimas
- Programos klaidų rodikliai
- Išteklių naudojimas
- Kaštų sekimas

2. **Nustatykite įspėjimus:**
```bash
# Įspėjimas apie didelį klaidų dažnį
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 7.2 veiksmas: Kaštų optimizavimas

1. **Analizuokite einamąsias išlaidas:**
```bash
# Naudokite Azure CLI, kad gautumėte išlaidų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įdiekite kaštų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite autoscaling politiką
- Įgyvendinkite užklausų talpyklą
- Stebėkite tokenų naudojimą OpenAI

### **Laboratorinė užduotis 7.1: Veikimo optimizavimas**

**Užduotis**: Optimizuokite savo AI programą tiek našumo, tiek kaštų atžvilgiu.

**Metrikos, kurias reikia pagerinti:**
- Sumažinti vidutinį atsakymo laiką 20%
- Sumažinti mėnesines išlaidas 15%
- Išlaikyti 99.9% veikimo laiką

**Strategijos, kurias verta išbandyti:**
- Įgyvendinti atsakymų talpyklą
- Optimizuoti prompt'us tokenų efektyvumui
- Naudoti tinkamus compute SKU
- Nustatyti tinkamą autoscaling

## Galutinis iššūkis: Nuo pradžios iki galo įgyvendinimas

### Iššūkio scenarijus

Jums pavesta sukurti gamybai paruoštą AI varomą klientų aptarnavimo pokalbių robotą su šiomis sąlygomis:

**Funkciniai reikalavimai:**
- Žiniatinklio sąsaja klientų sąveikai
- Integracija su Microsoft Foundry Models atsakymams generuoti
- Dokumentų paieškos galimybė naudojant Cognitive Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė palaikymas

**Nefunkciniai reikalavimai:**
- Aptarnauti 1000 vienu metu veikiančių vartotojų
- 99.9% veikimo laiko SLA
- SOC 2 atitiktis
- Išlaidos mažiau nei $500 per mėnesį
- Diegti į kelias aplinkas (dev, staging, prod)

### Įgyvendinimo žingsniai

1. **Sukurkite architektūrą**
2. **Sukurkite AZD šabloną**
3. **Įgyvendinkite saugumo priemones**
4. **Nustatykite stebėjimą ir įspėjimus**
5. **Sukurkite diegimo pipelines**
6. **Dokumentuokite sprendimą**

### Vertinimo kriterijai

- ✅ **Funkcionalumas**: Ar atitinka visus reikalavimus?
- ✅ **Saugumas**: Ar įgyvendintos geriausios praktikos?
- ✅ **Mastelio keitimas**: Ar gali tvarkyti apkrovą?
- ✅ **Prižiūrimumas**: Ar kodas ir infrastruktūra gerai organizuoti?
- ✅ **Kaštai**: Ar laiko biudžetą?

## Papildomi ištekliai

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Pavyzdžių šablonai
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Bendruomenės ištekliai
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Baigimo pažymėjimas

Sveikiname! Jūs baigėte AI dirbtuvių laboratoriją. Dabar turėtumėte sugebėti:
- ✅ Konvertuoti esamas DI programas į AZD šablonus
- ✅ Diegti gamybai paruoštas DI programas
- ✅ Įgyvendinti geriausias saugumo praktikas DI darbo krūviams
- ✅ Stebėti ir optimizuoti DI programų našumą
- ✅ Spręsti įprastas diegimo problemas

### Kiti žingsniai
1. Taikyti šiuos modelius savo DI projektuose
2. Pasiūlyti šablonus bendruomenei
3. Prisijungti prie Microsoft Foundry Discord dėl nuolatinės pagalbos
4. Išnagrinėti pažangias temas, pvz., kelių regionų diegimus

---

**Atgalinis ryšys apie dirbtuves**: Padėkite mums patobulinti šias dirbtuves, pasidalindami savo patirtimi [Microsoft Foundry Discord #Azure kanalas](https://discord.gg/microsoft-azure).

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - DI orientuotas vystymas
- **⬅️ Ankstesnis**: [DI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Gamybinio DI geriausios praktikos](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūravimas](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės, kad gautumėte palaikymą ir dalyvautumėte diskusijose apie AZD ir DI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už bet kokius nesusipratimus ar neteisingas interpretacijas, kilusias naudojant šį vertimą.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->