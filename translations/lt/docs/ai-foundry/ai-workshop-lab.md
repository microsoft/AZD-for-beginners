# AI Dirbtuvių Laboratorija: Kaip Padaryti Jūsų AI Sprendimus AZD Pritaikomus

**Skyriaus Navigacija:**
- **📚 Kurso Pagrindinis Puslapis**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis Skyrius**: 2 skyrius - AI-Pirmasis Vystymas
- **⬅️ Ankstesnis**: [AI Modelio Diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Geriausios Praktikos Produkcijos AI](production-ai-practices.md)
- **🚀 Kitas Skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

## Dirbtuvių Apžvalga

Ši praktinė laboratorija padės kūrėjams perkelti esamą AI šabloną ir diegti jį naudojant Azure Developer CLI (AZD). Jūs išmoksite pagrindinius modelius, skirtus AI diegimui produkcijoje, naudojant Microsoft Foundry paslaugas.

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Reikalavimai:** Pagrindinės žinios apie Azure, susipažinimas su AI/ML koncepcijomis

## 🎓 Mokymosi Tikslai

Baigę šią laboratoriją, jūs galėsite:
- ✅ Paversti esamą AI programą AZD šablonais
- ✅ Konfigūruoti Microsoft Foundry paslaugas su AZD
- ✅ Įgyvendinti saugų kredencialų valdymą AI paslaugoms
- ✅ Diegti produkcijai paruoštas AI programas su stebėjimu
- ✅ Spręsti dažniausiai pasitaikančias AI diegimo problemas

## Reikalavimai

### Reikalingi Įrankiai
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegtas
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojama VS Code)

### Azure Ištekliai
- Azure prenumerata su bendradarbio prieiga
- Prieiga prie Azure OpenAI paslaugų (arba galimybė prašyti prieigos)
- Leidimai kurti išteklių grupes

### Žinių Reikalavimai
- Pagrindinis Azure paslaugų supratimas
- Susipažinimas su komandų eilutės sąsajomis
- Pagrindinės AI/ML koncepcijos (API, modeliai, užklausos)

## Laboratorijos Paruošimas

### 1 žingsnis: Aplinkos Paruošimas

1. **Patikrinkite įrankių įdiegimą:**
```bash
# Patikrinkite AZD diegimą
azd version

# Patikrinkite Azure CLI
az --version

# Prisijunkite prie Azure
az login
azd auth login
```

2. **Klonuokite dirbtuvių saugyklą:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1 modulis: AZD Struktūros Supratimas AI Programoms

### AI Paruošto AZD Šablono Anatomija

Išnagrinėkite pagrindinius failus AI paruoštame AZD šablone:

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

### **Laboratorinis Pratimas 1.1: Konfigūracijos Tyrimas**

1. **Išnagrinėkite azure.yaml failą:**
```bash
cat azure.yaml
```

**Į ką atkreipti dėmesį:**
- Paslaugų apibrėžimai AI komponentams
- Aplinkos kintamųjų susiejimai
- Pagrindinio kompiuterio konfigūracijos

2. **Peržiūrėkite main.bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Pagrindiniai AI modeliai, kuriuos reikia atpažinti:**
- Azure OpenAI paslaugos teikimas
- Cognitive Search integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijos Taškas:** Kodėl Šie Modeliai Svarbūs AI

- **Paslaugų Priklausomybės**: AI programoms dažnai reikia kelių koordinuotų paslaugų
- **Saugumas**: API raktai ir galiniai taškai turi būti saugiai valdomi
- **Mastelio Keitimas**: AI darbo krūviai turi unikalius mastelio keitimo reikalavimus
- **Kainų Valdymas**: AI paslaugos gali būti brangios, jei netinkamai sukonfigūruotos

## 2 modulis: Pirmojo AI Programos Diegimas

### 2.1 žingsnis: Aplinkos Inicijavimas

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikiamus parametrus:**
```bash
# Nustatykite pageidaujamą Azure regioną
azd env set AZURE_LOCATION eastus

# Pasirinktinai: Nustatykite konkretų OpenAI modelį
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### 2.2 žingsnis: Infrastruktūros ir Programos Diegimas

1. **Diegimas su AZD:**
```bash
azd up
```

**Kas vyksta vykdant `azd up`:**
- ✅ Sukuriama Azure OpenAI paslauga
- ✅ Sukuriama Cognitive Search paslauga
- ✅ Sukuriama App Service žiniatinklio programai
- ✅ Konfigūruojamas tinklas ir saugumas
- ✅ Diegiamas programos kodas
- ✅ Sukuriamas stebėjimas ir žurnalai

2. **Stebėkite diegimo eigą** ir atkreipkite dėmesį į kuriamus išteklius.

### 2.3 žingsnis: Patikrinkite Savo Diegimą

1. **Patikrinkite diegtus išteklius:**
```bash
azd show
```

2. **Atidarykite diegtą programą:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Išbandykite AI funkcionalumą:**
   - Naršykite į žiniatinklio programą
   - Išbandykite pavyzdines užklausas
   - Patikrinkite, ar AI atsakymai veikia

### **Laboratorinis Pratimas 2.1: Trikčių Šalinimo Praktika**

**Scenarijus**: Jūsų diegimas pavyko, bet AI nereaguoja.

**Dažniausios problemos, kurias reikia patikrinti:**
1. **OpenAI API raktai**: Patikrinkite, ar jie tinkamai nustatyti
2. **Modelio prieinamumas**: Patikrinkite, ar jūsų regione palaikomas modelis
3. **Tinklo ryšys**: Įsitikinkite, kad paslaugos gali bendrauti
4. **RBAC leidimai**: Patikrinkite, ar programa gali pasiekti OpenAI

**Trikčių šalinimo komandos:**
```bash
# Patikrinkite aplinkos kintamuosius
azd env get-values

# Peržiūrėkite diegimo žurnalus
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Patikrinkite OpenAI diegimo būseną
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3 modulis: AI Programų Pritaikymas Jūsų Poreikiams

### 3.1 žingsnis: AI Konfigūracijos Keitimas

1. **Atnaujinkite OpenAI modelį:**
```bash
# Pakeiskite į kitą modelį (jei jis pasiekiamas jūsų regione)
azd env set AZURE_OPENAI_MODEL gpt-4

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

### 3.2 žingsnis: Aplinkai Specifinės Konfigūracijos

**Geriausia Praktika**: Skirtingos konfigūracijos kūrimui ir produkcijai.

1. **Sukurkite produkcijos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite produkcijai specifinius parametrus:**
```bash
# Gamyba paprastai naudoja aukštesnius SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įjungti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorinis Pratimas 3.1: Kainų Optimizavimas**

**Iššūkis**: Suplanuokite šabloną ekonomiškam kūrimui.

**Užduotys:**
1. Nustatykite, kurie SKU gali būti nustatyti į nemokamą/pagrindinį lygį
2. Konfigūruokite aplinkos kintamuosius minimalioms išlaidoms
3. Diekite ir palyginkite išlaidas su produkcijos konfigūracija

**Sprendimo užuominos:**
- Naudokite F0 (nemokamą) lygį Cognitive Services, kai įmanoma
- Naudokite Basic lygį Search Service kūrimo metu
- Apsvarstykite Consumption planą Functions

## 4 modulis: Saugumas ir Produkcijos Geriausios Praktikos

### 4.1 žingsnis: Saugus Kredencialų Valdymas

**Dabartinis iššūkis**: Daugelis AI programų kietai koduoja API raktus arba naudoja nesaugų saugojimą.

**AZD Sprendimas**: Valdomos Tapatybės + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Ieškokite Key Vault ir Managed Identity konfigūracijos
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, ar Valdoma Tapatybė veikia:**
```bash
# Patikrinkite, ar žiniatinklio programoje yra teisinga tapatybės konfigūracija
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 žingsnis: Tinklo Saugumas

1. **Įgalinkite privačius galinius taškus** (jei dar neįgalinta):

Pridėkite prie savo bicep šablono:
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

### 4.3 žingsnis: Stebėjimas ir Stebimumas

1. **Konfigūruokite Application Insights:**
```bash
# Programos įžvalgos turėtų būti automatiškai sukonfigūruotos
# Patikrinkite konfigūraciją:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nustatykite AI-specifinį stebėjimą:**

Pridėkite pasirinktinius metrikos AI operacijoms:
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

### **Laboratorinis Pratimas 4.1: Saugumo Auditas**

**Užduotis**: Peržiūrėkite savo diegimą dėl saugumo geriausių praktikų.

**Kontrolinis sąrašas:**
- [ ] Nėra kietai koduotų paslapčių kode ar konfigūracijoje
- [ ] Naudojama Valdoma Tapatybė paslaugų autentifikavimui
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Stebėjimas ir žurnalai įjungti

## 5 modulis: Savo AI Programos Konvertavimas

### 5.1 žingsnis: Vertinimo Darbo Lapas

**Prieš konvertuodami savo programą**, atsakykite į šiuos klausimus:

1. **Programos Architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokius skaičiavimo išteklius jai reikia?
   - Ar reikalinga duomenų bazė?
   - Kokios yra paslaugų priklausomybės?

2. **Saugumo Reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų programa?
   - Kokie atitikties reikalavimai jums taikomi?
   - Ar reikia privataus tinklo?

3. **Mastelio Reikalavimai:**
   - Koks yra jūsų tikėtinas apkrovimas?
   - Ar reikia automatinio mastelio keitimo?
   - Ar yra regioninių reikalavimų?

### 5.2 žingsnis: Sukurkite Savo AZD Šabloną

**Sekite šį modelį, kad konvertuotumėte savo programą:**

1. **Sukurkite pagrindinę struktūrą:**
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

### **Laboratorinis Pratimas 5.1: Šablono Kūrimo Iššūkis**

**Iššūkis**: Sukurkite AZD šabloną dokumentų apdorojimo AI programai.

**Reikalavimai:**
- Azure OpenAI turinio analizei
- Document Intelligence OCR
- Saugojimo Paskyra dokumentų įkėlimui
- Function App apdorojimo logikai
- Žiniatinklio programa vartotojo sąsajai

**Papildomi taškai:**
- Pridėkite tinkamą klaidų tvarkymą
- Įtraukite išlaidų įvertinimą
- Nustatykite stebėjimo skydelius

## 6 modulis: Dažniausiai Pasitaikančių Problemų Sprendimas

### Dažniausios Diegimo Problemos

#### Problema 1: OpenAI Paslaugos Kvoros Viršijimas
**Simptomai:** Diegimas nepavyksta dėl kvoros klaidos
**Sprendimai:**
```bash
# Patikrinkite dabartines kvotas
az cognitiveservices usage list --location eastus

# Prašykite kvotos padidinimo arba bandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelis Nepasiekiamas Regione
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos
**Sprendimai:**
```bash
# Patikrinkite modelio prieinamumą pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinkite į prieinamą modelį
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Problema 3: Leidimų Problemos
**Simptomai:** 403 Draudžiama klaidos, kai kviečiamos AI paslaugos
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

### Veikimo Problemos

#### Problema 4: Lėti AI Atsakymai
**Tyrimo žingsniai:**
1. Patikrinkite Application Insights veikimo metrikas
2. Peržiūrėkite OpenAI paslaugos metrikas Azure portale
3. Patikrinkite tinklo ryšį ir delsą

**Sprendimai:**
- Įgyvendinkite talpyklą dažnoms užklausoms
- Naudokite tinkamą OpenAI modelį savo atvejui
- Apsvarstykite skaitymo replikas didelės apkrovos scenarijams

### **Laboratorinis Pratimas 6.1: Derinimo Iššūkis**

**Scenarijus**: Jūsų diegimas pavyko, tačiau programa grąžina 500 klaidas.

**Derinimo užduotys:**
1. Patikrinkite programos žurnalus
2. Patikrinkite paslaugų ryšį
3. Išbandykite autentifikavimą
4. Peržiūrėkite konfigūraciją

**Įrankiai, kuriuos naudoti:**
- `azd show` diegimo apžvalgai
- Azure portalas detaliems paslaugų žurnalams
- Application Insights programos telemetrijai

## 7 modulis: Stebėjimas ir Optimizavimas

### 7.1 žingsnis: Išsamus Stebėjimo Nustatymas

1. **Sukurkite pasirinktinius skydelius:**

Naršykite į Azure portalą ir sukurkite skydelį su:
- OpenAI užklausų skaičiumi ir delsos laiku
- Programos klaidų rodikliais
- Išteklių naudojimu
- Išlaidų stebėjimu

2. **Nustatykite įspėjimus:**
```bash
# Įspėjimas dėl didelio klaidų dažnio
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 7.2 žingsnis: Išlaidų Optimizavimas

1. **Analizuokite dabartines išlaidas:**
```bash
# Naudokite Azure CLI, kad gautumėte išlaidų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įgyvendinkite išlaidų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite automatinio mastelio politiką
- Įgyvendinkite užklausų talpyklą
- Stebėkite OpenAI žetonų naudojimą

### **Laboratorinis Pratimas 7.1: Veikimo Optimizavimas**

**Užduotis**: Optimizuokite savo AI programą tiek veikimui, tiek išlaidoms.

**Metrikos, kurias reikia pagerinti:**
- Sumažinkite vidutinį atsakymo laiką 20%
- Sumažinkite mėnesines išlaidas 15%
- Išlaikykite 99,9% veikimo laiką

**Strategijos, kurias išbandyti:**
- Įgyvendinkite atsakymų talpyklą
- Optimizuokite užklausas žetonų efektyvumui
- Naudokite tinkamus skaičiavimo SKU
- Nustatykite tinkamą automatinį mastelio keitimą

## Galutinis Iššūkis: Pilnas Įgyvendinimas

### Iššūkio Scenarijus

Jums pavesta sukurti produkcijai paruoštą AI pagrįstą klientų aptarnavimo pokalbių robotą su šiais reikalavimais:

**Funkciniai Reikalavimai:**
- Žiniatinklio sąsaja klientų sąveikai
- Integracija su Azure OpenAI atsakymams
- Dokumentų paieškos galimybė naudojant Cognitive Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė parama

**Nefunkciniai Reikalavimai:**
- Palaikyti 1000 vienu metu veikiančių vartotojų
- 99,9% veikimo SLA
- SOC 2 atitiktis
- Išlaidos mažesnės nei $
Sveikiname! Jūs baigėte AI dirbtuvių laboratoriją. Dabar turėtumėte gebėti:

- ✅ Paversti esamas AI programas į AZD šablonus
- ✅ Diegti gamybai paruoštas AI programas
- ✅ Įgyvendinti saugumo geriausias praktikas AI darbo krūviams
- ✅ Stebėti ir optimizuoti AI programų našumą
- ✅ Spręsti dažniausiai pasitaikančias diegimo problemas

### Kiti žingsniai
1. Taikykite šiuos modelius savo AI projektuose
2. Prisidėkite prie šablonų kūrimo bendruomenei
3. Prisijunkite prie „Microsoft Foundry“ Discord kanalo, kad gautumėte nuolatinę pagalbą
4. Tyrinėkite pažangias temas, tokias kaip diegimas keliuose regionuose

---

**Atsiliepimai apie dirbtuves**: Padėkite mums tobulinti šias dirbtuves, pasidalindami savo patirtimi [Microsoft Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI orientuotas kūrimas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Geriausios praktikos gamybos AI](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės, kad gautumėte pagalbą ir diskutuotumėte apie AZD ir AI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->