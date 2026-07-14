# AI dirbtuvės laboratorija: kaip padaryti, kad jūsų AI sprendimai būtų diegiami naudojant AZD  

**Skyriaus naršymas:**  
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)  
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmumo kūrimas  
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)  
- **➡️ Kitas**: [Geriausios AI gamybos praktikos](production-ai-practices.md)  
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)  

## Dirbtuvių apžvalga  

Ši praktinė laboratorija veda kūrėjus per procesą, kaip paimti esamą AI šabloną ir jį diegti naudojant Azure Developer CLI (AZD). Sužinosite esminius modelius gamybiniam AI diegimui naudojant Microsoft Foundry paslaugas.  

> **Patvirtinimo pastaba (2026-07-13):** Ši dirbtuvė buvo peržiūrėta naudojant `azd` versiją `1.27.1`. Jei jūsų vietinė diegimo versija senesnė, atnaujinkite AZD prieš pradėdami, kad autentifikavimo, šablono ir diegimo procesas atitiktų žemiau pateiktus veiksmus.  

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Išankstinės sąlygos:** Pagrindinės Azure žinios, pažintis su AI/ML sąvokomis  

## 🎓 Mokymosi tikslai  

Baigę šią dirbtuvę mokėsite:  
- ✅ Konvertuoti esamą AI programą naudoti su AZD šablonais  
- ✅ Konfigūruoti Microsoft Foundry paslaugas naudojant AZD  
- ✅ Įgyvendinti saugų kredencialų valdymą AI paslaugoms  
- ✅ Diegti gamybai paruoštas AI programas su stebėsena  
- ✅ Spręsti dažniausiai pasitaikančias AI diegimo problemas  

## Išankstinės sąlygos  

### Reikalingi įrankiai  
- Įdiegta [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)  
- Įdiegta [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)  
- Įdiegta [Git](https://git-scm.com/)  
- Kodo redaktorius (rekomenduojama VS Code)  

### Azure ištekliai  
- Azure prenumerata su prisidėjimo teisėmis  
- Prieiga prie Microsoft Foundry Models paslaugų (arba galimybė gauti prieigą)  
- Leidimai kurti išteklių grupes  

### Žinių išankstiniai reikalavimai  
- Pagrindinis supratimas apie Azure paslaugas  
- Pažintis su komandine eilute  
- Pagrindinės AI/ML sąvokos (API, modeliai, užklausos)  

## Laboratorijos paruošimas  

### 1 žingsnis: Aplinkos paruošimas  

1. **Patikrinkite įrankių diegimą:**  
```bash
# Patikrinkite AZD diegimą
azd version

# Patikrinkite Azure CLI
az --version

# Prisijunkite prie Azure AZD darbo eigoms
azd auth login

# Prisijunkite prie Azure CLI tik jei planuojate naudoti az komandas diagnostikos metu
az login
```
  
Jei dirbate per kelis klientus arba jūsų prenumerata nėra automatiškai aptikta, bandykite naudoti komandą `azd auth login --tenant-id <tenant-id>`.  

2. **Klonuokite dirbtuvių saugyklą:**  
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```
  
## Modulis 1: AZD struktūros supratimas AI programoms  

### AI AZD šablono sandara  

Išnagrinėkite esminius failus AI paruoštame AZD šablone:  

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
  
### **Laboratorijos pratimas 1.1: Išnagrinėkite konfigūraciją**  

1. **Peržiūrėkite azure.yaml failą:**  
```bash
cat azure.yaml
```
  
**Ką stebėti:**  
- AI komponentų paslaugų aprašymai  
- Aplinkos kintamųjų susiejimas  
- Hostingų konfigūracijos  

2. **Peržiūrėkite main.bicep infrastruktūrą:**  
```bash
cat infra/main.bicep
```
  
**Svarbūs AI modeliai, kuriuos reikia atpažinti:**  
- Microsoft Foundry Models paslaugos užsakymas  
- Azure AI Search integracija  
- Saugus raktų valdymas  
- Tinklo saugumo konfigūracijos  

### **Diskusijos taškas:** Kodėl šie modeliai svarbūs AI  

- **Paslaugų priklausomybės:** AI programos dažnai reikalauja kelių koordinuotų paslaugų  
- **Saugumas:** API raktai ir galiniai taškai turi būti saugiai valdomi  
- **Mastelio keitimas:** AI darbai reikalauja unikalių mastelio keitimo sprendimų  
- **Išlaidų valdymas:** AI paslaugos gali būti brangios, jei neaparengtos tinkamai  

## Modulis 2: Pirmojo AI taikymo diegimas  

### 2.1 žingsnis: Aplinkos inicializavimas  

1. **Sukurkite naują AZD aplinką:**  
```bash
azd env new myai-workshop
```
  
2. **Nustatykite privalomus parametrus:**  
```bash
# Nustatykite pageidaujamą Azure regioną
azd env set AZURE_LOCATION eastus

# Pasirenkama: Nustatykite konkretų OpenAI modelį
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```
  
### 2.2 žingsnis: Infrastrukturą ir programą diegimas  

1. **Diegimo vykdymas su AZD:**  
```bash
azd up
```
  
**Kas vyksta `azd up` metu:**  
- ✅ Užsakoma Microsoft Foundry Models paslauga  
- ✅ Sukuriama Azure AI Search paslauga  
- ✅ Sukuriama App Service žiniatinklio programai  
- ✅ Sujungiama tinklo ir saugumo konfigūracija  
- ✅ Diegiamas programos kodas  
- ✅ Nustatoma stebėsena ir registracija  

2. **Stebėkite diegimo eigą** ir atkreipkite dėmesį į kuriamus išteklius.  

### 2.3 žingsnis: Diegimo patikrinimas  

1. **Patikrinkite diegiamus išteklius:**  
```bash
azd show
```
  
2. **Atidarykite diegtą programą:**  
```bash
azd show
```
  
Atidarykite žiniatinklio galinį tašką, nurodytą `azd show` išvestyje.  

3. **Išbandykite AI funkcionalumą:**  
   - Eikite į žiniatinklio programą  
   - Išbandykite pavyzdines užklausas  
   - Patikrinkite, ar AI atsakymai veikia  

### **Laboratorijos pratimas 2.1: Trikčių šalinimo praktika**  

**Situacija:** Diegimas pavyko, bet AI neatsako.  

**Dažniausios problemos, ką patikrinti:**  
1. **OpenAI API raktai:** Patikrinkite, ar jie teisingai nustatyti  
2. **Modelio prieinamumas:** Patikrinkite, ar jūsų regionas palaiko modelį  
3. **Tinklo ryšys:** Užtikrinkite, kad paslaugos gali bendrauti  
4. **RBAC leidimai:** Patikrinkite, ar programa turi prieigą prie OpenAI  

**Debug komandos:**  
```bash
# Patikrinti aplinkos kintamuosius
azd env get-values

# Peržiūrėti diegimo žurnalus
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Patikrinti OpenAI diegimo būseną
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```
  
## Modulis 3: AI programų pritaikymas pagal jūsų poreikius  

### 3.1 žingsnis: AI konfigūracijos keitimas  

1. **Atnaujinkite OpenAI modelį:**  
```bash
# Pakeiskite į kitą modelį (jei jis yra prieinamas jūsų regione)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Iš naujo diegti su nauja konfigūracija
azd deploy
```
  
2. **Pridėkite papildomas AI paslaugas:**  

Redaguokite `infra/main.bicep`, kad pridėti Dokumentų intelektą:  

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
  
### 3.2 žingsnis: Aplinkos specifinės konfigūracijos  

**Geriausia praktika:** Skirtingos konfigūracijos kūrimui ir gamybai.  

1. **Sukurkite gamybos aplinką:**  
```bash
azd env new myai-production
```
  
2. **Nustatykite gamybai specifinius parametrus:**  
```bash
# Gamyboje paprastai naudojamos aukštesnės prekės vienetų kodai (SKU)
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įjungti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```
  
### **Laboratorijos pratimas 3.1: Išlaidų optimizavimas**  

**Uždavinys:** Konfigūruokite šabloną išlaidų efektyviam kūrimui.  

**Užduotys:**  
1. Nustatykite, kuriuos SKU galima nustatyti kaip nemokamus/pagrindinius lygius  
2. Konfigūruokite aplinkos kintamuosius mažoms išlaidoms  
3. Diegkite ir palyginkite išlaidas su gamybos konfiguracija  

**Sprendimo užuominos:**  
- Naudokite F0 (nemokamą) lygį Azure AI paslaugoms, kai įmanoma  
- Naudokite pagrindinį lygį paieškos paslaugoms kūrimo metu  
- Apsvarstykite sunaudojimo planą funkcijoms  

## Modulis 4: Saugumas ir geros gamybos praktikos  

### 4.1 žingsnis: Saugus kredencialų valdymas  

**Esama problema:** Daugelis AI programų naudoja kietai užkoduotus API raktus ar nesaugias saugyklas.  

**AZD sprendimas:** Tvarkoma tapatybė + Key Vault integracija.  

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**  
```bash
# Ieškokite Key Vault ir Managed Identity konfigūracijos
grep -r "keyVault\|managedIdentity" infra/
```
  
2. **Patikrinkite, ar Tvarkoma tapatybė veikia:**  
```bash
# Patikrinkite, ar žiniatinklio programoje yra teisinga tapatybės konfigūracija
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```
  
### 4.2 žingsnis: Tinklo saugumas  

1. **Įgalinkite privačius galinius taškus** (jei dar nėra sukonfigūruoti):  

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
  
### 4.3 žingsnis: Stebėsena ir stebimumas  

1. **Nustatykite Application Insights:**  
```bash
# Application Insights turėtų būti automatiškai sukonfigūruotas
# Patikrinkite konfigūraciją:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```
  
2. **Nustatykite AI specifinę stebėseną:**  

Pridėkite pasirinktinį matavimą AI operacijoms:  
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
  
### **Laboratorijos pratimas 4.1: Saugumo auditas**  

**Užduotis:** Peržiūrėkite savo diegimą dėl saugumo gerosios praktikos.  

**Tikrinimo sąrašas:**  
- [ ] Nėra kietai užkoduotų slaptažodžių kode ar konfigūracijoje  
- [ ] Naudojama Tvarkoma tapatybė paslaugų autentifikacijai  
- [ ] Key Vault saugo jautrią konfigūraciją  
- [ ] Teisingai apribota tinklo prieiga  
- [ ] Įjungta stebėsena ir registracija  

## Modulis 5: Jūsų pačių AI programos konvertavimas  

### 5.1 žingsnis: Vertinimo lapas  

**Prieš konvertuojant jūsų programą, atsakykite į šiuos klausimus:**  

1. **Programos architektūra:**  
   - Kokias AI paslaugas naudoja jūsų programa?  
   - Kokius skaičiavimo išteklius reikia?  
   - Ar reikia duomenų bazės?  
   - Kokios yra priklausomybės tarp paslaugų?  

2. **Saugumo reikalavimai:**  
   - Kokius jautrius duomenis tvarko jūsų programa?  
   - Kokie atitikties reikalavimai taikomi?  
   - Ar reikalingas privatus tinklas?  

3. **Mastelio keitimo reikalavimai:**  
   - Koks numatomas apkrovimas?  
   - Ar reikia automatinio mastelio keitimo?  
   - Ar yra regioniniai reikalavimai?  

### 5.2 žingsnis: Sukurkite savo AZD šabloną  

**Sekite šį modelį, kad konvertuotumėte savo programą:**  

1. **Sukurkite pagrindinę struktūrą:**  
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Inicializuokite AZD šabloną
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

**infra/main.bicep** - pagrindinis šablonas:  
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
  
### **Laboratorijos pratimas 5.1: Šablono kūrimo iššūkis**  

**Iššūkis:** Sukurkite AZD šabloną dokumentų apdorojimo AI programai.  

**Reikalavimai:**  
- Microsoft Foundry Models turinio analizei  
- Dokumentų intelektas (OCR)  
- Saugyklos paskyra dokumentų įkėlimui  
- Funkcijų programa apdorojimo logikai  
- Žiniatinklio programa vartotojo sąsajai  

**Dėmesio taškai bonusui:**  
- Pridėkite tinkamą klaidų valdymą  
- Įtraukite kaštų vertinimą  
- Nustatykite stebėsenos informacinius skydelius  

## Modulis 6: Dažniausiai pasitaikančių problemų trikčių šalinimas  

### Dažnos diegimo problemos  

#### Problema 1: Viršytas OpenAI paslaugos kvotas  
**Simptomai:** Diegimas nepavyksta dėl kvotos klaidos  
**Sprendimai:**  
```bash
# Patikrinkite esamus kvotas
az cognitiveservices usage list --location eastus

# Užklauskite kvotos padidinimo arba išbandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up
```
  
#### Problema 2: Modelis neprieinamas regione  
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos  
**Sprendimai:**  
```bash
# Patikrinkite modelio prieinamumą pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinti į prieinamą modelį
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```
  
#### Problema 3: Leidimų problemos  
**Simptomai:** 403 Forbidden klaidos kreipiantis į AI paslaugas  
**Sprendimai:**  
```bash
# Patikrinkite vaidmenų priskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridėkite trūkstamus vaidmenis
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```
  
### Veiklos problemos  

#### Problema 4: Lėti AI atsakymai  
**Tyrimo veiksmai:**  
1. Patikrinkite Application Insights veiklos rodiklius  
2. Peržiūrėkite OpenAI paslaugų rodiklius Azure portale  
3. Patikrinkite tinklo ryšį ir vėlavimą  

**Sprendimai:**  
- Įgyvendinkite talpinimą dažniausiai užklausoms  
- Naudokite tinkamą OpenAI modelį pagal naudojimo atvejį  
- Apsvarstykite skaitymo kopijų naudojimą didelio apkrovimo situacijose  

### **Laboratorijos pratimas 6.1: Trikčių šalinimo iššūkis**  

**Situacija:** Diegimas pavyko, bet programa grąžina 500 klaidas.  

**Trikčių šalinimo užduotys:**  
1. Patikrinkite programos žurnalus  
2. Patikrinkite paslaugų ryšį  
3. Išbandykite autentifikaciją  
4. Peržiūrėkite konfigūraciją  

**Įrankiai naudojimui:**  
- `azd show` diegimo apžvalgai  
- Azure portal detalizuotiems paslaugų žurnalams  
- Application Insights programos telemetrijai  

## Modulis 7: Stebėsena ir optimizavimas  

### 7.1 žingsnis: Išsamios stebėsenos nustatymas  

1. **Sukurkite pasirinktinius informacinius skydelius:**  

Eikite į Azure portalą ir sukurkite informacinį skydelį su:  
- OpenAI užklausų skaičius ir delsimas  
- Programos klaidų rodikliai  
- Išteklių panaudojimas  
- Kaštų stebėsena  

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
  
### 7.2 žingsnis: Išlaidų optimizavimas  

1. **Analizuokite esamas išlaidas:**  
```bash
# Naudokite Azure CLI, kad gautumėte sąnaudų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```
  
2. **Įgyvendinkite išlaidų kontrolę:**  
- Nustatykite biudžeto įspėjimus  
- Naudokite automatinio mastelio keitimo taisykles  
- Įgyvendinkite užklausų talpinimą  
- Stebėkite OpenAI tokenų naudojimą  

### **Laboratorijos pratimas 7.1: Veiklos optimizavimas**  

**Užduotis:** Optimizuokite savo AI programą veiklai ir išlaidoms.  

**Rodikliai, kuriuos reikėtų pagerinti:**  
- Sumažinkite vidutinį atsako laiką 20%  
- Sumažinkite mėnesines išlaidas 15%  
- Išlaikykite 99,9% neveikimo laiką  

**Strategijos, kurias verta išbandyti:**  
- Įgyvendinkite atsakymų talpinimą  
- Optimizuokite užklausas dėl tokenų efektyvumo  
- Naudokite tinkamus skaičiavimo SKU  
- Nustatykite tinkamą automatinį mastelio keitimą  

## Paskutinis iššūkis: Pilna įgyvendinimo eiga  

### Iššūkio situacija  

Jums pavesta sukurti gamybai paruoštą AI varomą klientų aptarnavimo pokalbių robotą pagal šiuos reikalavimus:  

**Funkciniai reikalavimai:**  
- Žiniatinklio sąsaja klientų sąveikoms  
- Integracija su Microsoft Foundry Models atsakymams generuoti  
- Dokumentų paieškos galimybė naudojant Azure AI Search  
- Integracija su esama klientų duomenų baze  
- Daugiakalbė parama  

**Nefunkciniai reikalavimai:**  
- Talpinti 1000 vienu metu veikiančių vartotojų  
- 99,9% veikimo laikas (SLA)  
- SOC 2 atitiktis  
- Išlaidos neviršija 500 USD per mėnesį  
- Diegimas kelioms aplinkoms (kūrimas, testavimas, gamyba)  

### Įgyvendinimo žingsniai  

1. **Sukurkite architektūrą**  
2. **Sukurkite AZD šabloną**  
3. **Įgyvendinkite saugumo priemones**  
4. **Sukurkite stebėsenos ir įspėjimų sistemą**  
5. **Sukurkite diegimo srautus**  
6. **Dokumentuokite sprendimą**  

### Vertinimo kriterijai  

- ✅ **Funkcionalumas:** Ar atitinka visus reikalavimus?  
- ✅ **Saugumas:** Ar įgyvendinta geriausia praktika?  
- ✅ **Mastelio keitimas:** Ar gali atlaikyti apkrovą?  
- ✅ **Priežiūra:** Ar kodas ir infrastruktūra yra gerai organizuoti?  
- ✅ **Išlaidos:** Ar laikosi biudžeto?  

## Papildomi ištekliai  

### Microsoft dokumentacija  
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Microsoft Foundry Models paslaugų dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)  
- [Microsoft Foundry dokumentacija](https://learn.microsoft.com/azure/ai-studio/)  

### Pavyzdiniai šablonai  
- [Microsoft Foundry Models pokalbių programa](https://github.com/Azure-Samples/azure-search-openai-demo)  
- [OpenAI pokalbių programos greitas startas](https://github.com/Azure-Samples/openai-chat-app-quickstart)  

- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Bendruomenės ištekliai
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Baigimo pažymėjimas

Sveikiname! Jūs baigėte DI dirbtuvių laboratoriją. Dabar turėtumėte mokėti:

- ✅ Konvertuoti esamas DI programas į AZD šablonus
- ✅ Diegti gamybai paruoštas DI programas
- ✅ Įgyvendinti geriausias saugumo praktikas DI užduotims
- ✅ Stebėti ir optimizuoti DI programų našumą
- ✅ Spręsti dažnas diegimo problemas

### Tolimesni žingsniai
1. Taikyti šias schemas savo DI projektuose
2. Grįžtamai prisidėti prie bendruomenės šablonų
3. Prisijungti prie Microsoft Foundry Discord nuolatinei pagalbai
4. Tyrinėti pažangias temas, tokias kaip daugiariai diegimai

---

**Dirbtuvių atsiliepimai**: Padėkite mums tobulinti šias dirbtuves dalindamiesi savo patirtimi [Microsoft Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – DI pirmenybės vystymas
- **⬅️ Ankstesnis**: [DI modelio diegimas](ai-model-deployment.md)
- **➡️ Sekantis**: [Gamybinės DI geriausios praktikos](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės, kad gautumėte palaikymą ir diskutuotumėte apie AZD ir DI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->