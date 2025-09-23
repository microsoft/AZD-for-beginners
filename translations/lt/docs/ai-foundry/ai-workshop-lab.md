<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22e9deee2d82e70fc841c60f97627916",
  "translation_date": "2025-09-23T14:53:21+00:00",
  "source_file": "docs/ai-foundry/ai-workshop-lab.md",
  "language_code": "lt"
}
-->
# AI Workshop Lab: AI sprendimų paruošimas AZD diegimui

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI pirmasis vystymas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Geriausios AI praktikos gamyboje](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

## Dirbtuvių apžvalga

Šios praktinės dirbtuvės padės programuotojams perimti esamą AI šabloną ir jį diegti naudojant Azure Developer CLI (AZD). Sužinosite pagrindinius modelius, kaip diegti AI sprendimus gamybos aplinkoje naudojant Azure AI Foundry paslaugas.

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Reikalavimai:** Pagrindinės Azure žinios, AI/ML koncepcijų supratimas

## 🎓 Mokymosi tikslai

Baigę šias dirbtuves, galėsite:
- ✅ Konvertuoti esamą AI programą į AZD šabloną
- ✅ Konfigūruoti Azure AI Foundry paslaugas naudojant AZD
- ✅ Įgyvendinti saugų kredencialų valdymą AI paslaugoms
- ✅ Diegti gamybai paruoštas AI programas su stebėsena
- ✅ Spręsti dažniausiai pasitaikančias AI diegimo problemas

## Reikalavimai

### Reikalingi įrankiai
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegtas
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojamas VS Code)

### Azure resursai
- Azure prenumerata su prisijungimo teisėmis
- Prieiga prie Azure OpenAI paslaugų (arba galimybė prašyti prieigos)
- Leidimas kurti resursų grupes

### Žinių reikalavimai
- Pagrindinis Azure paslaugų supratimas
- Susipažinimas su komandų eilutės sąsajomis
- Pagrindinės AI/ML koncepcijos (API, modeliai, užklausos)

## Dirbtuvių paruošimas

### 1 žingsnis: Aplinkos paruošimas

1. **Patikrinkite įrankių įdiegimą:**
```bash
# Check AZD installation
azd version

# Check Azure CLI
az --version

# Login to Azure
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

Susipažinkite su pagrindiniais failais AI paruoštame AZD šablone:

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


### **Praktinė užduotis 1.1: Konfigūracijos tyrimas**

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
- Cognitive Search integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijos tema:** Kodėl šie modeliai svarbūs AI

- **Paslaugų priklausomybės**: AI programos dažnai reikalauja koordinuotų paslaugų
- **Saugumas**: API raktai ir galiniai taškai turi būti saugiai valdomi
- **Mastelio keitimas**: AI darbo krūviai turi unikalius mastelio keitimo reikalavimus
- **Kaštų valdymas**: AI paslaugos gali būti brangios, jei nėra tinkamai konfigūruotos

## Modulis 2: Pirmojo AI programos diegimas

### 2.1 žingsnis: Aplinkos inicializavimas

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikalingus parametrus:**
```bash
# Set your preferred Azure region
azd env set AZURE_LOCATION eastus

# Optional: Set specific OpenAI model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```


### 2.2 žingsnis: Infrastruktūros ir programos diegimas

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
- ✅ Sukuriama stebėsena ir žurnalai

2. **Stebėkite diegimo eigą** ir atkreipkite dėmesį į kuriamus resursus.

### 2.3 žingsnis: Diegimo patikrinimas

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

### **Praktinė užduotis 2.1: Trikčių šalinimo praktika**

**Scenarijus**: Jūsų diegimas pavyko, bet AI neatsako.

**Dažniausios problemos, kurias reikia patikrinti:**
1. **OpenAI API raktai**: Patikrinkite, ar jie teisingai nustatyti
2. **Modelio prieinamumas**: Patikrinkite, ar jūsų regionas palaiko modelį
3. **Tinklo ryšys**: Įsitikinkite, kad paslaugos gali bendrauti
4. **RBAC leidimai**: Patikrinkite, ar programa gali pasiekti OpenAI

**Trikčių šalinimo komandos:**
```bash
# Check environment variables
azd env get-values

# View deployment logs
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Check OpenAI deployment status
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```


## Modulis 3: AI programų pritaikymas pagal poreikius

### 3.1 žingsnis: AI konfigūracijos keitimas

1. **Atnaujinkite OpenAI modelį:**
```bash
# Change to a different model (if available in your region)
azd env set AZURE_OPENAI_MODEL gpt-4

# Redeploy with the new configuration
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


### 3.2 žingsnis: Konfigūracijos pagal aplinką

**Geriausia praktika**: Skirtingos konfigūracijos vystymui ir gamybai.

1. **Sukurkite gamybos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite gamybai skirtus parametrus:**
```bash
# Production typically uses higher SKUs
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Enable additional security features
azd env set ENABLE_PRIVATE_ENDPOINTS true
```


### **Praktinė užduotis 3.1: Kaštų optimizavimas**

**Iššūkis**: Konfigūruokite šabloną ekonomiškam vystymui.

**Užduotys:**
1. Nustatykite, kurie SKUs gali būti nustatyti į nemokamą/pagrindinį lygį
2. Konfigūruokite aplinkos kintamuosius minimaliems kaštams
3. Diekite ir palyginkite kaštus su gamybos konfigūracija

**Sprendimo užuominos:**
- Naudokite F0 (nemokamą) lygį Cognitive Services, kai įmanoma
- Naudokite Basic lygį Search Service vystymo metu
- Apsvarstykite Consumption planą Functions

## Modulis 4: Saugumas ir geriausios praktikos gamybai

### 4.1 žingsnis: Saugus kredencialų valdymas

**Dabartinis iššūkis**: Daugelis AI programų naudoja kietai užkoduotus API raktus arba nesaugų saugojimą.

**AZD sprendimas**: Managed Identity + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Look for Key Vault and Managed Identity configuration
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, ar Managed Identity veikia:**
```bash
# Check if the web app has the correct identity configuration
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```


### 4.2 žingsnis: Tinklo saugumas

1. **Įgalinkite privačius galinius taškus** (jei dar neįgalinta):

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

1. **Konfigūruokite Application Insights:**
```bash
# Application Insights should be automatically configured
# Check the configuration:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nustatykite AI specifinę stebėseną:**

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


### **Praktinė užduotis 4.1: Saugumo auditas**

**Užduotis**: Peržiūrėkite savo diegimą pagal saugumo geriausias praktikas.

**Kontrolinis sąrašas:**
- [ ] Nėra kietai užkoduotų paslapčių kode ar konfigūracijoje
- [ ] Managed Identity naudojamas paslaugų autentifikacijai
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Stebėsena ir žurnalai įgalinti

## Modulis 5: Jūsų AI programos konvertavimas

### 5.1 žingsnis: Vertinimo lapas

**Prieš konvertuodami savo programą**, atsakykite į šiuos klausimus:

1. **Programos architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokius skaičiavimo resursus ji reikalauja?
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

# Initialize AZD template
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


### **Praktinė užduotis 5.1: Šablono kūrimo iššūkis**

**Iššūkis**: Sukurkite AZD šabloną dokumentų apdorojimo AI programai.

**Reikalavimai:**
- Azure OpenAI turinio analizei
- Document Intelligence OCR
- Saugojimo paskyra dokumentų įkėlimui
- Function App apdorojimo logikai
- Žiniatinklio programa vartotojo sąsajai

**Papildomi taškai:**
- Pridėkite tinkamą klaidų tvarkymą
- Įtraukite kaštų įvertinimą
- Nustatykite stebėjimo skydelius

## Modulis 6: Dažniausios problemos ir jų sprendimas

### Dažniausios diegimo problemos

#### Problema 1: OpenAI paslaugos kvotos viršijimas
**Simptomai:** Diegimas nepavyksta su kvotos klaida
**Sprendimai:**
```bash
# Check current quotas
az cognitiveservices usage list --location eastus

# Request quota increase or try different region
azd env set AZURE_LOCATION westus2
azd up
```


#### Problema 2: Modelis neprieinamas regione
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos
**Sprendimai:**
```bash
# Check model availability by region
az cognitiveservices model list --location eastus

# Update to available model
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```


#### Problema 3: Leidimų problemos
**Simptomai:** 403 Forbidden klaidos, kai kviečiamos AI paslaugos
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

### **Praktinė užduotis 6.1: Trikčių šalinimo iššūkis**

**Scenarijus**: Jūsų diegimas pavyko, bet programa grąžina 500 klaidas.

**Trikčių šalinimo užduotys:**
1. Patikrinkite programos žurnalus
2. Patikrinkite paslaugų ryšį
3. Išbandykite autentifikaciją
4. Peržiūrėkite konfigūraciją

**Įrankiai, kuriuos naudoti:**
- `azd show` diegimo apžvalgai
- Azure portalas detaliems paslaugų žurnalams
- Application Insights programos telemetrijai

## Modulis 7: Stebėsena ir optimizavimas

### 7.1 žingsnis: Išsamios stebėsenos nustatymas

1. **Sukurkite pasirinktinius skydelius:**

Naršykite Azure portalą ir sukurkite skydelį su:
- OpenAI užklausų skaičiumi ir vėlavimu
- Programos klaidų rodikliais
- Resursų naudojimu
- Kaštų stebėjimu

2. **Nustatykite įspėjimus:**
```bash
# Alert for high error rate
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```


### 7.2 žingsnis: Kaštų optimizavimas

1. **Analizuokite dabartinius kaštus:**
```bash
# Use Azure CLI to get cost data
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įgyvendinkite kaštų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite automatinio mastelio keitimo politiką
- Įgyvendinkite užklausų talpyklą
- Stebėkite OpenAI žetonų naudojimą

### **Praktinė užduotis 7.1: Našumo optimizavimas**

**Užduotis**: Optimizuokite savo AI programą tiek našumui, tiek kaštams.

**Metrikos, kurias reikia pagerinti:**
- Sumažinkite vidutinį atsakymo laiką 20%
- Sumažinkite mėnesinius kaštus 15%
- Išlaikykite 99.9% veikimo laiką

**Strategijos, kurias išbandyti:**
- Įgyvendinkite atsakymų talpyklą
- Optimizuokite užklausas žetonų efektyvumui
- Naudokite tinkamus skaičiavimo SKUs
- Nustatykite tinkamą automatinį mastelio keitimą

## Galutinis iššūkis: Pilnas įgyvendinimas

### Iššūkio scenarijus

Jums pavesta sukurti gamybai paruoštą AI pagrįstą klientų aptarnavimo pokalbių robotą su šiais reikalavimais:

**Funkciniai reikalavimai:**
- Žiniatinklio sąsaja klientų sąveikai
- Integracija su Azure OpenAI atsakymams
- Dokumentų paieškos galimybė naudojant Cognitive Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė palaikymas

**Nefunkciniai reikalavimai:**
- Aptarnauti 1000 vartotojų vienu metu
- 99.9% veikimo SLA
- SOC 2 atitiktis
- Kaštai iki $500/mėn
- Diegimas į kelias aplinkas (vystymas, testavimas, gamyba)

### Įgyvendinimo žingsniai

1. **Sukurkite architektūrą
Sveikiname! Jūs baigėte AI dirbtuvių laboratoriją. Dabar turėtumėte gebėti:

- ✅ Konvertuoti esamas AI programas į AZD šablonus
- ✅ Diegti AI programas, paruoštas gamybai
- ✅ Įgyvendinti saugumo geriausias praktikas AI darbo krūviams
- ✅ Stebėti ir optimizuoti AI programų našumą
- ✅ Spręsti dažniausiai pasitaikančias diegimo problemas

### Kiti žingsniai
1. Taikykite šiuos modelius savo AI projektuose
2. Prisidėkite prie šablonų kūrimo bendruomenei
3. Prisijunkite prie Azure AI Foundry Discord, kad gautumėte nuolatinę pagalbą
4. Tyrinėkite pažangias temas, tokias kaip diegimas keliuose regionuose

---

**Dirbtuvių atsiliepimai**: Padėkite mums tobulinti šias dirbtuves, pasidalindami savo patirtimi [Azure AI Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmasis vystymas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Geriausios praktikos AI gamybai](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../getting-started/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės, kad gautumėte pagalbą ir diskusijas apie AZD ir AI diegimus.

---

