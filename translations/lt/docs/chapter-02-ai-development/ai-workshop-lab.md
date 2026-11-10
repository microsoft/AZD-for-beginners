# AI Dirbtuvės: Kaip padaryti, kad jūsų AI sprendimai būtų diegiami per AZD

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD pradžiamokslis](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – Pirmauti su AI kūrimu
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [AI diegimo geriausios praktikos](../chapter-08-production/production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

## Dirbtuvių apžvalga

Šis praktinis užsiėmimas supažindina kūrėjus su procesu, kaip pasiimti esamą AI šabloną ir jį įdiegti naudojant Azure Developer CLI (AZD). Išmoksite svarbiausių šablonų, skirtų AI diegimams gamyboje, naudojant Microsoft Foundry paslaugas.

> **Išleidimo peržiūra (2026-11-04):** AZD komandų paskirtys ir pavyzdinių konfigūracijų pavadinimai buvo patikrinti pagal `azd` `1.37.2` išleidimą ir susietos pavyzdinės konfigūracijos dabartinį atnaujinimą. Tai dokumentacijos peržiūra, o ne tiesioginis diegimo patikrinimas. RAG laboratorijai agentų plėtinys nereikalingas; agentų vertinimams naudokite atskirą `azure.ai.evaluations` plėtinį ir [dabartinę vertinimo eigą](../chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks), o ne senus agentų vertinimo komandas.

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Reikalavimai:** Pagrindinės Azure žinios, AI/ML sampratų pažinimas

## 🎓 Mokymosi tikslai

Baigę šias dirbtuves, galėsite:
- ✅ Išnagrinėti esamą AI AZD šabloną ir suplanuoti savo programos konvertavimą
- ✅ Konfigūruoti Microsoft Foundry paslaugas naudojant AZD
- ✅ Įdiegti saugų kredencialų valdymą AI paslaugoms
- ✅ Diegti AI referencinę programą su stebėsena
- ✅ Spręsti dažniausias AI diegimo problemas

## Reikalavimai

### Reikalingi įrankiai
- [Azure kūrėjo CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegta
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojama VS Code)

Šie komandų blokai naudoja Bash sintaksę (įskaitant eilutės tęsinius ir `grep`). Windows sistemoje naudokite Git Bash/WSL arba išverskite jas į PowerShell. Taip pat įdiekite kalbos, paketų valdymo ir konteinerių įrankius, išvardytus [pavyzdžio vietinės aplinkos nustatymuose](https://github.com/Azure-Samples/azure-search-openai-demo#local-environment).

### Azure ištekliai
- Azure prenumerata su išteklių aprūpinimo ir vaidmenų priskyrimo teisėmis (vien „Contributor“ negali kurti RBAC priskyrimų; naudokite įgaliotą vaidmenų administratorių arba pavyzdžio dokumentuotą atitikmenį)
- Prieiga prie Microsoft Foundry Models paslaugų (arba galimybė prašyti prieigos)
- Leidimai kurti išteklių grupę

### Reikalingos žinios
- Pagrindinės Azure paslaugų žinios
- Susipažinimas su komandine eilute
- Pagrindinės AI/ML sąvokos (APIs, modeliai, užklausos)

## Laboratorijos nustatymas

### 1 žingsnis: Aplinkos paruošimas

1. **Patikrinkite įrankių diegimus:**
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

Jei dirbate su keliais nuomininkais arba jūsų prenumerata nėra automatiškai aptikta, bandykite dar kartą su `azd auth login --tenant-id <tenant-id>`.

2. **Klonuokite dirbtuvių saugyklą:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulis 1: AZD struktūros supratimas dirbtinio intelekto programoms

### Dirbtinio intelekto AZD šablono anatomija

Išnagrinėkite pagrindinius failus AI paruoštame AZD šablone:

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

Patikrintas pavyzdys gali keistis; `.azure/` pasirodo po aplinkos inicializacijos, ne būtinai naujo klono metu. Peržiūrėkite faktinį patikrinimą vietoje, o ne kurkite trūkstamus katalogus, kad atitiktų šį schemą.

### **Laboratorinis pratimas 1.1: Išnagrinėkite konfigūraciją**

1. **Išnagrinėkite azure.yaml failą:**
```bash
cat azure.yaml
```

**Į ką atkreipti dėmesį:**
- AI komponentų paslaugų aprašymai
- Aplinkos kintamųjų priskyrimai
- Pagrindinio kompiuterio konfigūracijos

2. **Peržiūrėkite main.bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Svarbiausi AI šablonai:**
- Microsoft Foundry Models paslaugų teikimas
- Azure AI Search integracija
- Saugi raktų tvarkyba
- Tinklo saugumo konfigūracijos

### **Diskusijos taškas:** Kodėl šie šablonai svarbūs AI

- **Paslaugų priklausomybės**: AI programos dažnai reikalauja kelių koordinuotų paslaugų
- **Saugumas**: API raktams ir galiniams taškams reikia užtikrintos tvarkymo
- **Mastelio keitimas**: AI darbo krūviams reikalingos unikalios mastelio keitimo galimybės
- **Sąnaudų valdymas**: AI paslaugos gali būti brangios, jei nėra tinkamai sukonfigūruotos

## 2 modulis: Paskelbkite savo pirmąją AI programą

### 2.1 žingsnis: Inicializuokite aplinką

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikiamus parametrus:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: select a chat model supported by your region and quota
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
```

### 2.2 žingsnis: Paskelbkite infrastruktūrą ir programą

1. **Paskelbkite naudodami AZD:**
```bash
azd up
```

**Kas vyksta vykdant `azd up`:**
- ✅ Teikiama Microsoft Foundry Models paslauga
- ✅ Sukuriama Azure AI Search paslauga
- ✅ Sukonfigūruojamos Azure Container Apps backendui ir įdiegtam frontendui (dabartinis pavyzdys pagal numatytuosius nustatymus)
- ✅ Konfigūruoja tinklą ir saugumą
- ✅ Diegia programos kodą
- ✅ Nustato stebėjimą ir žurnalo vedimą

2. **Stebėkite diegimo pažangą** ir užsirašykite kuriamus išteklius.

### 2.3 žingsnis: Patikrinkite savo diegimą

1. **Patikrinkite diegiamus išteklius:**
```bash
azd show
```

2. **Atidarykite diegtą programą:**
```bash
azd show
```

Atidarykite interneto galinį tašką, parodytą `azd show` išvestyje.

3. **Išbandykite DI funkcionalumą:**
   - Eikite į interneto programą
   - Išbandykite pavyzdinius užklausimus
   - Patikrinkite, ar DI atsakymai veikia

### **Laboratorinis pratimas 2.1: Gedimų šalinimo praktika**

**Scenarijus**: Jūsų diegimas pavyko, tačiau DI neatsako.

**Dažniausios problemos, kurias reikia patikrinti:**
1. **Autentifikacija**: Patikrinkite valdomą tapatybę ir vaidmenų paskyrimus; tik tikrinkite API raktus, jei sąmoningai įjungėte raktų pagrindu veikiančią autentifikaciją
2. **Modelio prieinamumas**: Patikrinkite, ar jūsų regionas palaiko modelį
3. **Tinklo ryšys**: Įsitikinkite, kad paslaugos gali bendrauti
4. **RBAC leidimai**: Patikrinkite, ar programa gali pasiekti OpenAI

**Gedimų diagnostikos komandos:**
```bash
# Check environment variables
azd env get-values

# Open the selected environment's logging view
azd monitor --logs

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3 modulis: DI programų pritaikymas jūsų poreikiams

### 3.1 žingsnis: Pakeiskite DI konfigūraciją

1. **Atnaujinkite OpenAI modelį:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1

# Apply the model infrastructure change, then deploy the application
azd up
```

2. **Pridėkite papildomas DI paslaugas:**

Redaguokite `infra/main.bicep` ir pridėkite Dokumentų intelektą:

Toliau pateiktas fragmentas yra iliustracinis, ne viso šablono pavyzdys. Pavyzdys gali jau įtraukti dokumentų apdorojimo paslaugas: prieš pridėdami pasikartojančius išteklius, patikrinkite esamą infrastruktūrą. Pasirinktini papildymai reikalauja išvesties, tapatybių ir programos konfigūracijos sujungimo.

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

**Geriausia praktika**: Skirtingos konfigūracijos vystymui ir gamybai.

1. **Sukurkite gamybos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite gamybai būdingus parametrus:**
```bash
# Use the sample's actual Search SKU parameter
azd env set AZURE_SEARCH_SERVICE_SKU standard

# Enable private endpoints using the sample's parameter
azd env set AZURE_USE_PRIVATE_ENDPOINT true
```

Šie pavadinimai yra iš pavyzdžio [main.parameters.json](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/infra/main.parameters.json). `azd env set` saugo reikšmę, bet neveikia kaip savavališkas kintamasis: šablonas turi ją naudoti. Prieš išjungdami viešą prieigą, peržiūrėkite pavyzdžio [tinklo izoliacijos vadovą](https://github.com/Azure-Samples/azure-search-openai-demo/blob/main/docs/deploy_private.md) ir naudokite `azd up` taikydami infrastruktūros pakeitimus. OpenAI SKU `S0` vien tik nenulemia modelio pralaidumo; svarbus ir modelio diegimo tipas bei pajėgumas.

### **Laboratorinis pratimas 3.1: Sąnaudų optimizavimas**

**Iššūkis**: Sužinokite, kaip suderinti šabloną ekonomiškam vystymui.

**Užduotys:**
1. Pasirinkite vienkartinę dirbtuvės aplinką: `azd env select myai-workshop`.
2. Įrašykite dabartinį Search SKU ir modelio pajėgumą iš `infra/main.parameters.json` ir pasirinktos aplinkos.
3. Naudokite palaikomus įvestis žemiau, patvirtinę modelio/regiono kvotą:
   ```bash
   azd env set AZURE_SEARCH_SERVICE_SKU basic
   azd env set AZURE_OPENAI_CHATGPT_DEPLOYMENT_CAPACITY 10
   azd up
   ```
4. Patikrinkite Search SKU ir diegimo pajėgumą portale ir įvertinkite skirtumą su kainų skaičiuokle. Nesitikėkite, kad apmokestinimo duomenys atsinaujins iš karto.

**Sėkmės kriterijai:** Search naudoja Basic lygį, pokalbių diegimas turi pageidaujamą palaikomą pajėgumą, o programa vis dar atsako į pavyzdinį klausimą. Pajėgumo `10` reikšmė yra greičio ribojimo paskirstymas, o ne nuolaida už ženklus. „Search“ pakopos pakeitimai gali būti apriboti arba reikalauti pakartotinio kūrimo; nesimėginkite gamybos išteklių. F0 yra paslaugai būdingas ir nėra Azure OpenAI modelio SKU.

## 4 modulis: Saugumas ir geriausios gamybos praktikos

### 4.1 žingsnis: Saugus kredencialų valdymas

**Dabartinė problema**: Daugelis AI programėlių įkoduojamos API raktus arba naudoja nesaugų saugojimą.

**AZD sprendimas**: Valdomo identiteto + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, ar Valdomas identitetas veikia:**
```bash
# For the sample's default Container Apps host
az containerapp identity show --name YOUR_CONTAINER_APP_NAME --resource-group YOUR_RG
```

### 4.2 žingsnis: Tinklo saugumas

1. **Įjunkite privačius galinius taškus** naudodami pavyzdžio palaikomą tinklo konfigūraciją (jei dar ne sukonfigūruota).

Jūsų šablonui šis iliustracinis fragmentas rodo OpenAI galinio taško prijungimą. Jam taip pat reikia VNet, privataus DNS konfigūracijos ir programos susiejimo; nekopijuokite jo nepakitę į pavyzdį, kuris jau turi privataus galinio taško modulius:
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

1. **Sukonfigūruokite Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_INSIGHTS_NAME --resource-group YOUR_RG
```

2. **Įjunkite pavyzdžio Application Insights integraciją:**
```bash
azd env set AZURE_USE_APPLICATION_INSIGHTS true
azd up
azd monitor --overview
```

Pavyzdžio instrumentacija siunčia telemetriją; atsitiktinis `OPENAI_MONITOR_ENABLED` nustatymas neįjungia AI metrikų. Peržiūrėkite sekimus dėl modelio skambučių, delsos, gedimų ir žetonų naudojimo, ir venkite fiksuoti jautrių užklausų ar atsakymų.

### **Laboratorinis pratimas 4.1: Saugumo auditas**

**Užduotis**: Peržiūrėkite savo diegimą dėl geriausių saugumo praktikų.

**Kontrolinis sąrašas:**
- [ ] Nėra įkoduotų slaptažodžių kode ar konfigūracijoje
- [ ] Naudojamas Valdomas identitetas paslaugų autentifikavimui
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Įjungta stebėsena ir žurnalas

## 5 modulis: Savo AI programos konvertavimas

### 5.1 žingsnis: Vertinimo darbo lapas

**Prieš konvertuodami programą**, atsakykite į šiuos klausimus:

1. **Programos architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokius skaičiavimo išteklius ji reikalauja?
   - Ar jai reikalinga duomenų bazė?
   - Kokios yra priklausomybės tarp paslaugų?

2. **Saugumo reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų programa?
   - Kokius atitikties reikalavimus turite?
   - Ar reikia privataus tinklo?

3. **Mastelio keitimo reikalavimai:**
   - Koks tikėtinas jūsų apkrovos dydis?
   - Ar reikalingas automatinis mastelio keitimas?
   - Ar yra regioninių reikalavimų?

### 5.2 žingsnis: Sukurkite savo AZD šabloną

**Vadovaukitės šiuo šablonu konvertuodami savo programą:**

**Tik karkasas:** Ši skiltis nepateikia API / žiniatinklio programos šaltinio kodo, pagrindinės infrastruktūros, modelių diegimų, identiteto / RBAC ar baigto `main.parameters.json`. Išteklų grupės apribotas Bicep iliustruoja modulio sudėtį; tipinis prenumeratos apribotas AZD įėjimo taškas turi sukurti išteklių grupę ir ją iškviesti toje apriboje. Nesitikėkite, kad `azd up` paleis pilną programą, tik nukopijavus šiuos fragmentus. Norėdami turėti vykdomą pagrindą, toliau naudokite RAG šabloną iš 1 modulio.

1. **Sukurkite pagrindinę struktūrą:**
```bash
mkdir my-ai-app-azd
cd my-ai-app-azd

# Initialize AZD template
azd init --template minimal .
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
    disableLocalAuth: true
  }
}

output endpoint string = openAIAccount.properties.endpoint
output name string = openAIAccount.name
```

### **Laboratorinis pratimas 5.1: Šablono kūrimo iššūkis**

**Iššūkis**: Sukurkite AZD šabloną dokumentų apdorojimo AI programėlei.

**Reikalavimai:**
- Microsoft Foundry modeliai turinio analizei
- Dokumentų intelektas OCR
- Saugyklos paskyra dokumentų įkėlimams
- Funkcijų aplikacija apdorojimo logikai
- Internetinė aplikacija vartotojo sąsajai

**Papildomi balai:**
- Pridėti tinkamą klaidų tvarkymą
- Įtraukti sąnaudų įvertinimą
- Nustatyti stebėjimo informacines paneles

## Modulis 6: Dažnai pasitaikančių problemų trikčių šalinimas

### Dažnos diegimo problemos

#### Problema 1: Viršytas OpenAI paslaugos kvotos limitas
**Simptomai:** Diegimas nepavyksta dėl kvotos klaidos
**Sprendimai:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase, OR try a new disposable environment in another region.
# Azure resources cannot be relocated merely by changing AZURE_LOCATION.
azd env new myai-quota-test
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelio nėra regione
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos
**Sprendimai:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_CHATGPT_MODEL gpt-4.1-mini
azd up
```

#### Problema 3: Leidimų problemos
**Simptomai:** 403 Draudžiama klaidos kviečiant AI paslaugas
**Sprendimai:**
```bash
# Check role assignments
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Add missing roles
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Veikimo problemos

#### Problema 4: Lėti AI atsakymai
**Tyrimo žingsniai:**
1. Patikrinti Application Insights našumo rodiklius
2. Peržiūrėti OpenAI paslaugos rodiklius Azure portale
3. Patikrinti tinklo ryšį ir delsą

**Sprendimai:**
- Įgyvendinti talpyklą dažnai užklausiamiems duomenims
- Naudoti tinkamą OpenAI modelį savo atvejui
- Skalauti aplikacijos kopijas tik patikrinus modelio RPM/TPM ribas; Azure OpenAI diegimai nepateikia bendro duomenų bazės stiliaus „skaitymo kopijos“ nustatymo

### **Laboratorinis pratimas 6.1: Trikčių šalinimo iššūkis**

**Scenarijus**: Jūsų diegimas pavyko, bet aplikacija grąžina 500 klaidas.

**Trikčių šalinimo užduotys:**
1. Patikrinti aplikacijos žurnalus
2. Patikrinti paslaugos ryšį
3. Autentifikacijos testavimas
4. Konfigūracijos peržiūra

**Naudojami įrankiai:**
- `azd show` diegimo apžvalgai
- Azure portalas detalioms paslaugų žurnalams
- Application Insights programos telemetrijai

## 7 modulis: Stebėjimas ir optimizavimas

### 7.1 žingsnis: Išsamus stebėjimo nustatymas

1. **Sukurkite pasirinktines skydeles:**

Eikite į Azure portalą ir sukurkite skydelį su:
- OpenAI užklausų skaičius ir delsos laikas
- Programos klaidų rodikliai
- Išteklių naudojimas
- Sąnaudų sekimas

2. **Nustatykite įspėjimus:**
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

Patikrinkite, ar komponentas siunčia užklausų telemetriją, ir pridėkite veiksmų grupę, jei reikia pranešimų. Metrika yra skaičius, o ne klaidų procentas; rodiklio įspėjimui reikia tinkamos užklausos ir vardiklio.

### 7.2 žingsnis: Sąnaudų optimizavimas

1. **Analizuokite esamas sąnaudas:**
```bash
# Set a recent reporting window supported by your billing account.
az consumption usage list --start-date YYYY-MM-DD --end-date YYYY-MM-DD
```

Pakeiskite datos vietas. Vartojimo API palaikymas priklauso nuo atsiskaitymo sutarties; jei naudojimo duomenys nepasiekiami, naudokite Sąnaudų valdymą portale. Sąnaudos yra vėluojančios, o ne realaus laiko testavimo šaltinis.

2. **Įgyvendinkite sąnaudų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite automatinio skalavimo politikas
- Įgyvendinkite užklausų talpyklavimą
- Stebėkite OpenAI žetonų naudojimą

### **Laboratorinis pratimas 7.1: Veikimo optimizavimas**

**Užduotis**: Optimizuokite savo AI programą tiek veikimui, tiek sąnaudoms.

**Patobulinti rodikliai:**
- Sumažinti vidutinį atsako laiką 20%
- Sumažinti mėnesio sąnaudas 15%
- Apibrėžti 99,9% prieinamumo SLO ir matavimo langą (trumpas laborantas negali parodyti mėnesinio neveikimo)

**Bandytinos strategijos:**
- Įgyvendinti atsakymų talpyklavimą
- Optimizuoti užklausas žetonų efektyvumui
- Naudoti tinkamus kompiuterinius SKU
- Nustatyti tinkamą automatinį skalavimą

## Paskutinė užduotis: Pilnas sprendimo įgyvendinimas

### Užduoties scenarijus

Tai **pasirenkama architektūros/dizaino užduotis**, o ne pateiktas vykdomas pratimas ar gamybinis sertifikatas. Pasiūlykite AI valdomą klientų aptarnavimo pokalbių robotą ir dokumentuokite, kurios reikalavimų sritys dar reikalauja įgyvendinimo ir įrodymų:

**Funkciniai reikalavimai:**
- Tinklapio sąsaja klientų sąveikoms
- Integracija su Microsoft Foundry modeliais atsakymams
- Dokumentų paieška naudojant Azure AI Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė palaikymas

**Nefunkciniai reikalavimai:**
- Aptarnauti 1000 nuolatinių vartotojų
- 99,9% veikimo laiko SLA
- SOC 2 atitiktis
- Sąnaudos žemesnės nei 500 USD/mėn.
- Diegimas keliuose aplinkose (kūrimo, bandymų, gamybos)

Tai hipotetiniai suinteresuotųjų reikalavimai, o ne vienu metu garantuojami rezultatai. Apibrėžkite užklausų dažnumą, užklausų/atsakymų dydžius ir sesijos trukmę prieš vertindami sąnaudas; 1000 nuolatinių vartotojų nereiškia darbo krūvio ar įrodo 500 USD biudžeto įmanomumą. SOC 2 yra organizacinio audito rezultatas, o ne per AZD šabloną įjungiamas jungiklis. Nustatykite kompromisus ir atminkite neįmanomus reikalavimus su įrodymais.

### Įgyvendinimo žingsniai

1. **Sukurkite architektūrą**
2. **Sukurkite AZD šabloną**
3. **Įgyvendinkite saugumo priemones**
4. **Nustatykite stebėjimą ir įspėjimus**
5. **Sukurkite diegimo kanalus**
6. **Dokumentuokite sprendimą**

### Įvertinimo kriterijai

- ✅ **Funkcionalumas**: Ar demonstruojamos įgyvendintos galimybės ir nurodomos likusios spragos?
- ✅ **Saugumas**: Ar taikomos geriausios praktikos?
- ✅ **Mastelio keitimas**: Ar gali išlaikyti apkrovą?
- ✅ **Priežiūra**: Ar kodas ir infrastruktūra gerai organizuota?
- ✅ **Sąnaudos**: Ar laikosi biudžeto?

## Papildomi ištekliai

### Microsoft dokumentacija
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry modelių paslaugų dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Pavyzdiniai šablonai
- [Microsoft Foundry modelių pokalbių programa](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI pokalbių programos greitas paleidimas](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso pokalbis](https://github.com/Azure-Samples/contoso-chat)

### Bendruomenės ištekliai
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Nuostabūs AZD šablonai](https://azure.github.io/awesome-azd/)

## 🎓 Užbaigimo etapas

Sveikiname! Jūs baigėte AI dirbtuvių laboratoriją. Dabar turėtumėte sugebėti:

- ✅ Paaiškinti, kaip pritaikyti esamą AI programą AZD šablonui
- ✅ Diegti ir testuoti AI atskaitos programą
- ✅ Įgyvendinti saugumo gerąsias praktikas AI darbo krūviams
- ✅ Stebėti ir optimizuoti AI programos veikimą
- ✅ Spręsti dažniausias diegimo problemas

**Išvalymas:** Paleiskite `azd env list`, pasirinkite kiekvieną šiame laboratorijoje sukurtą trumpalaikę aplinką (`myai-workshop`, ir jei buvo diegta `myai-production`/`myai-quota-test`), ir kiekvienoje paleiskite `azd down`. Peržiūrėkite ištrynimo planą; vien tik vietinės aplinkos konfigūracijos ištrynimas neištrina Azure išteklių. Venkite `--purge`, nebent suprantate negrįžtamą minkštą ištrintų išteklių pašalinimą.

### Kiti žingsniai
1. Pritaikykite šiuos šablonus savo AI projektams
2. Prisidėkite prie šablonų bendruomenei
3. Prisijunkite prie Microsoft Foundry Discord dėl nuolatinės pagalbos
4. Tyrinėkite pažangias temas, pvz., daugregionius diegimus

---

**Dirbtuvių atsiliepimai**: Padėkite mums patobulinti šias dirbtuves dalindamiesi savo patirtimi [Microsoft Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – AI koncepcijos
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Gamybinės AI geriausios praktikos](../chapter-08-production/production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės norėdami gauti palaikymą ir diskutuoti apie AZD ir AI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->