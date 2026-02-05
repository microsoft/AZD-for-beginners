# AI dirbtuvės laboratorija: Kaip padaryti savo AI sprendimus tinkamus AZD diegimui

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmasis vystymas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Geriausios AI praktikos gamyboje](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

## Dirbtuvių apžvalga

Ši praktinė laboratorija padės kūrėjams perkelti esamą AI šabloną ir jį diegti naudojant Azure Developer CLI (AZD). Sužinosite pagrindinius modelius, skirtus AI diegimui gamybos aplinkoje, naudojant Microsoft Foundry paslaugas.

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Būtinos žinios:** Pagrindinės Azure žinios, AI/ML koncepcijų supratimas

## 🎓 Mokymosi tikslai

Baigę šią laboratoriją, galėsite:
- ✅ Konvertuoti esamą AI programą, kad ji naudotų AZD šablonus
- ✅ Konfigūruoti Microsoft Foundry paslaugas su AZD
- ✅ Įgyvendinti saugų kredencialų valdymą AI paslaugoms
- ✅ Diegti gamybai paruoštas AI programas su stebėjimu
- ✅ Spręsti dažniausiai pasitaikančias AI diegimo problemas

## Būtinos sąlygos

### Reikalingi įrankiai
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegtas
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojama VS Code)

### Azure resursai
- Azure prenumerata su prisidėjimo teisėmis
- Prieiga prie Azure OpenAI paslaugų (arba galimybė prašyti prieigos)
- Leidimai kurti resursų grupes

### Žinių būtinybės
- Pagrindinis Azure paslaugų supratimas
- Komandinės eilutės sąsajų supratimas
- Pagrindinės AI/ML koncepcijos (API, modeliai, užklausos)

## Laboratorijos paruošimas

### 1 žingsnis: Aplinkos paruošimas

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

## Modulis 1: AZD struktūros supratimas AI programoms

### AI paruošto AZD šablono anatomija

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

### **Laboratorinis pratimas 1.1: Konfigūracijos tyrimas**

1. **Išnagrinėkite azure.yaml failą:**
```bash
cat azure.yaml
```

**Į ką atkreipti dėmesį:**
- Paslaugų apibrėžimai AI komponentams
- Aplinkos kintamųjų susiejimai
- Host konfigūracijos

2. **Peržiūrėkite pagrindinę bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Pagrindiniai AI modeliai, kuriuos reikia identifikuoti:**
- Azure OpenAI paslaugų teikimas
- Kognityvinės paieškos integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijos taškas:** Kodėl šie modeliai svarbūs AI

- **Paslaugų priklausomybės**: AI programoms dažnai reikia koordinuotų paslaugų
- **Saugumas**: API raktai ir galiniai taškai turi būti saugiai valdomi
- **Mastelio keitimas**: AI darbo krūviai turi unikalius mastelio keitimo reikalavimus
- **Kainų valdymas**: AI paslaugos gali būti brangios, jei netinkamai konfigūruotos

## Modulis 2: Pirmojo AI programos diegimas

### 2.1 žingsnis: Aplinkos inicializavimas

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

### 2.2 žingsnis: Infrastruktūros ir programos diegimas

1. **Diegimas su AZD:**
```bash
azd up
```

**Kas vyksta vykdant `azd up`:**
- ✅ Teikiama Azure OpenAI paslauga
- ✅ Sukuriama Kognityvinės paieškos paslauga
- ✅ Nustatoma App Service žiniatinklio programai
- ✅ Konfigūruojamas tinklas ir saugumas
- ✅ Diegiamas programos kodas
- ✅ Nustatomas stebėjimas ir žurnalai

2. **Stebėkite diegimo eigą** ir atkreipkite dėmesį į kuriamus resursus.

### 2.3 žingsnis: Patikrinkite savo diegimą

1. **Patikrinkite diegtus resursus:**
```bash
azd show
```

2. **Atidarykite diegtą programą:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Išbandykite AI funkcionalumą:**
   - Naršykite žiniatinklio programą
   - Išbandykite pavyzdines užklausas
   - Patikrinkite, ar AI atsakymai veikia

### **Laboratorinis pratimas 2.1: Praktika sprendžiant problemas**

**Scenarijus**: Jūsų diegimas pavyko, bet AI nereaguoja.

**Dažniausios problemos, kurias reikia patikrinti:**
1. **OpenAI API raktai**: Patikrinkite, ar jie teisingai nustatyti
2. **Modelio prieinamumas**: Patikrinkite, ar jūsų regionas palaiko modelį
3. **Tinklo ryšys**: Įsitikinkite, kad paslaugos gali bendrauti
4. **RBAC leidimai**: Patikrinkite, ar programa gali pasiekti OpenAI

**Debugging komandos:**
```bash
# Patikrinkite aplinkos kintamuosius
azd env get-values

# Peržiūrėkite diegimo žurnalus
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Patikrinkite OpenAI diegimo būseną
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulis 3: AI programų pritaikymas pagal jūsų poreikius

### 3.1 žingsnis: AI konfigūracijos keitimas

1. **Atnaujinkite OpenAI modelį:**
```bash
# Pakeiskite į kitą modelį (jei jūsų regione yra prieinamas)
azd env set AZURE_OPENAI_MODEL gpt-4

# Iš naujo įdiekite su nauja konfigūracija
azd deploy
```

2. **Pridėkite papildomas AI paslaugas:**

Redaguokite `infra/main.bicep`, kad pridėtumėte Dokumentų intelektą:

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

### 3.2 žingsnis: Konfigūracijos, pritaikytos aplinkai

**Geriausia praktika**: Skirtingos konfigūracijos vystymui ir gamybai.

1. **Sukurkite gamybos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite gamybai skirtus parametrus:**
```bash
# Gamyba paprastai naudoja aukštesnius SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įjungti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorinis pratimas 3.1: Kainų optimizavimas**

**Iššūkis**: Konfigūruokite šabloną, kad jis būtų ekonomiškas vystymui.

**Užduotys:**
1. Nustatykite, kurie SKUs gali būti nustatyti į nemokamą/pagrindinį lygį
2. Konfigūruokite aplinkos kintamuosius minimalioms išlaidoms
3. Diekite ir palyginkite išlaidas su gamybos konfigūracija

**Sprendimo užuominos:**
- Naudokite F0 (nemokamą) lygį Kognityvinėms paslaugoms, kai įmanoma
- Naudokite Pagrindinį lygį Paieškos paslaugai vystymo metu
- Apsvarstykite Vartojimo planą Funkcijoms

## Modulis 4: Saugumas ir geriausios praktikos gamybai

### 4.1 žingsnis: Saugus kredencialų valdymas

**Dabartinis iššūkis**: Daugelis AI programų koduoja API raktus arba naudoja nesaugų saugojimą.

**AZD sprendimas**: Valdoma tapatybė + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Ieškokite Key Vault ir Managed Identity konfigūracijos
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, ar valdoma tapatybė veikia:**
```bash
# Patikrinkite, ar žiniatinklio programoje yra teisinga tapatybės konfigūracija
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 žingsnis: Tinklo saugumas

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

### 4.3 žingsnis: Stebėjimas ir stebimumas

1. **Konfigūruokite Application Insights:**
```bash
# Programos įžvalgos turėtų būti automatiškai sukonfigūruotos
# Patikrinkite konfigūraciją:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nustatykite AI specifinį stebėjimą:**

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

### **Laboratorinis pratimas 4.1: Saugumo auditas**

**Užduotis**: Peržiūrėkite savo diegimą dėl saugumo geriausių praktikų.

**Kontrolinis sąrašas:**
- [ ] Nėra koduotų paslapčių kode ar konfigūracijoje
- [ ] Valdoma tapatybė naudojama paslaugų autentifikacijai
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Stebėjimas ir žurnalai įjungti

## Modulis 5: Savo AI programos konvertavimas

### 5.1 žingsnis: Vertinimo darbalapis

**Prieš konvertuodami savo programą**, atsakykite į šiuos klausimus:

1. **Programos architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokius kompiuterinius resursus jai reikia?
   - Ar jai reikia duomenų bazės?
   - Kokios yra paslaugų priklausomybės?

2. **Saugumo reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų programa?
   - Kokius atitikties reikalavimus turite?
   - Ar jums reikia privataus tinklo?

3. **Mastelio keitimo reikalavimai:**
   - Koks yra jūsų numatomas apkrovimas?
   - Ar jums reikia automatinio mastelio keitimo?
   - Ar yra regioninių reikalavimų?

### 5.2 žingsnis: Sukurkite savo AZD šabloną

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

### **Laboratorinis pratimas 5.1: Šablono kūrimo iššūkis**

**Iššūkis**: Sukurkite AZD šabloną dokumentų apdorojimo AI programai.

**Reikalavimai:**
- Azure OpenAI turinio analizei
- Dokumentų intelektas OCR
- Saugojimo paskyra dokumentų įkėlimui
- Funkcijų programa apdorojimo logikai
- Žiniatinklio programa vartotojo sąsajai

**Papildomi taškai:**
- Pridėkite tinkamą klaidų tvarkymą
- Įtraukite išlaidų įvertinimą
- Nustatykite stebėjimo skydelius

## Modulis 6: Dažniausiai pasitaikančių problemų sprendimas

### Dažnos diegimo problemos

#### Problema 1: OpenAI paslaugos kvotos viršijimas
**Simptomai:** Diegimas nepavyksta su kvotos klaida
**Sprendimai:**
```bash
# Patikrinkite dabartines kvotas
az cognitiveservices usage list --location eastus

# Prašykite kvotos padidinimo arba bandykite kitą regioną
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
**Simptomai:** 403 Draudžiama klaidos, kai skambinama AI paslaugoms
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

### Našumo problemos

#### Problema 4: Lėti AI atsakymai
**Tyrimo žingsniai:**
1. Patikrinkite Application Insights našumo metrikas
2. Peržiūrėkite OpenAI paslaugų metrikas Azure portale
3. Patikrinkite tinklo ryšį ir vėlavimą

**Sprendimai:**
- Įgyvendinkite talpyklą dažnoms užklausoms
- Naudokite tinkamą OpenAI modelį pagal jūsų poreikius
- Apsvarstykite skaitymo replikas didelės apkrovos scenarijams

### **Laboratorinis pratimas 6.1: Debugging iššūkis**

**Scenarijus**: Jūsų diegimas pavyko, bet programa grąžina 500 klaidas.

**Debugging užduotys:**
1. Patikrinkite programos žurnalus
2. Patikrinkite paslaugų ryšį
3. Išbandykite autentifikaciją
4. Peržiūrėkite konfigūraciją

**Įrankiai, kuriuos naudoti:**
- `azd show` diegimo apžvalgai
- Azure portalas detaliems paslaugų žurnalams
- Application Insights programos telemetrijai

## Modulis 7: Stebėjimas ir optimizavimas

### 7.1 žingsnis: Išsamus stebėjimo nustatymas

1. **Sukurkite pasirinktinius skydelius:**

Naršykite Azure portalą ir sukurkite skydelį su:
- OpenAI užklausų skaičiumi ir vėlavimu
- Programos klaidų rodikliais
- Resursų naudojimu
- Išlaidų stebėjimu

2. **Nustatykite įspėjimus:**
```bash
# Įspėjimas apie didelį klaidų rodiklį
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 7.2 žingsnis: Išlaidų optimizavimas

1. **Analizuokite dabartines išlaidas:**
```bash
# Naudokite Azure CLI, kad gautumėte išlaidų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įgyvendinkite išlaidų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite automatinio mastelio keitimo politiką
- Įgyvendinkite užklausų talpyklą
- Stebėkite OpenAI žetonų naudojimą

### **Laboratorinis pratimas 7.1: Našumo optimizavimas**

**Užduotis**: Optimizuokite savo AI programą tiek našumui, tiek išlaidoms.

**Metrikos, kurias reikia pagerinti:**
- Sumažinkite vidutinį atsakymo laiką 20%
- Sumažinkite mėnesines išlaidas 15%
- Išlaikykite 99.9% veikimo laiką

**Strategijos, kurias išbandyti:**
- Įgyvendinkite atsakymų talpyklą
- Optimizuokite užklausas žetonų efektyvumui
- Naudokite tinkamus kompiuterinius SKUs
- Nustatykite tinkamą automatinio mastelio keitimą

## Galutinis iššūkis: Pilnas įgyvendinimas

### Iššūkio scenarijus

Jums pavesta sukurti gamybai paruoštą AI pagrįstą klientų aptarnavimo pokalbių robotą su šiais reikalavimais:

**Funkciniai reikalavimai:**
- Žiniatinklio sąsaja klientų sąveikai
- Integracija su Azure OpenAI atsakymams
- Dokumentų paieškos galimybė naudojant Kognityvinę paiešką
- Integracija su esama klientų duomenų baze
- Daugiakalbė parama

**Nefunkciniai reikalavimai:**
- Aptarnauti 1000 vienu metu prisijungusių vartotojų
- 99.9% veikimo SLA
- SOC 2 atitiktis
- Išlaidos mažesn
Sveikiname! Jūs užbaigėte AI dirbtuvių laboratoriją. Dabar turėtumėte gebėti:

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

**Dirbtuvių atsiliepimai**: Padėkite mums tobulinti šias dirbtuves, pasidalindami savo patirtimi [Microsoft Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyrių navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmasis kūrimas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Geriausios praktikos gamybos AI](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės, kad gautumėte pagalbą ir diskutuotumėte apie AZD ir AI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, atsiradusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->