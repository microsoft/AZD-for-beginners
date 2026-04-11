# Dirbtinio Intelekto Dirbtuvė: Kaip Jūsų DI Sprendimus Padaryti Pasiekiamus per AZD

**Skyrių Navigacija:**
- **📚 Kurso Pagrindai**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis Skyrius**: 2 skyrius - AI-Pirmoji Plėtra
- **⬅️ Ankstesnis**: [DI Modelių Diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [DI Gamybinės Gerosios Praktikos](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

## Dirbtuvių Apžvalga

Ši praktinė laboratorija veda kūrėjus per esamo DI šablono naudojimą ir diegimą su Azure Developer CLI (AZD). Išmoksite pagrindinius produkcijai skirtų DI diegimo modelius, naudojant Microsoft Foundry paslaugas.

> **Patvirtinimo pastaba (2026-03-25):** Šios dirbtuvės buvo peržiūrėtos su `azd` versija `1.23.12`. Jei jūsų diegta versija senesnė, prieš pradėdami atnaujinkite AZD, kad autentifikacijos, šablono ir diegimo procesas atitiktų žemiau pateiktus veiksmus.

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Reikalavimai:** Pagrindinės Azure žinios, DI/ML koncepcijų pažinimas

## 🎓 Mokymosi Tikslai

Šio seminaro pabaigoje galėsite:
- ✅ Pakeisti esamą DI aplikaciją naudoti AZD šablonus
- ✅ Konfigūruoti Microsoft Foundry paslaugas naudojant AZD
- ✅ Įgyvendinti saugų kredencialų valdymą DI paslaugoms
- ✅ Diegti produkcijai paruoštas DI aplikacijas su stebėjimu
- ✅ Spręsti dažniausiai pasitaikančias DI diegimo problemas

## Pradiniai Reikalavimai

### Reikalingi Įrankiai
- Įdiegta [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- Įdiegta [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli)
- Įdiegta [Git](https://git-scm.com/)
- Kodo redaktorius (rekomenduojama VS Code)

### Azure Ištekliai
- Azure prenumerata su bendradarbio prieiga
- Prieiga prie Microsoft Foundry Models paslaugų (ar galimybė prašyti prieigos)
- Teisės kurti išteklių grupes

### Žinių Reikalavimai
- Pagrindinės Azure paslaugų žinios
- Patirtis su komandine eilute
- Pagrindinės DI/ML koncepcijos (API, modeliai, užklausos)

## Laboratorijos Paruošimas

### 1 žingsnis: Aplinkos Paruošimas

1. **Patikrinkite įrankių diegimą:**
```bash
# Patikrinkite AZD diegimą
azd version

# Patikrinkite Azure CLI
az --version

# Prisijunkite prie Azure AZD darbo eigos
azd auth login

# Prisijunkite prie Azure CLI tik jei planuojate vykdyti az komandas diagnozės metu
az login
```

Jei dirbate keliuose tenantų paskyrose arba jūsų prenumerata nenustatoma automatiškai, pabandykite dar kartą su `azd auth login --tenant-id <tenant-id>`.

2. **Kopijuokite dirbtuvių saugyklą:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## 1 modulis: AZD Struktūros Supratimas DI Aplikacijoms

### DI AZD Šablono Anatomija

Susipažinkite su pagrindiniais failais DI pasiruošusio AZD šablono:

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

### **Laboratorijos Užduotis 1.1: Konfigūracijos Tyrinėjimas**

1. **Peržvelkite azure.yaml failą:**
```bash
cat azure.yaml
```

**Į ką atkreipti dėmesį:**
- Paslaugų aprašymai DI komponentams
- Aplinkos kintamųjų susiejimai
- Užsakovų konfigūracijos

2. **Peržiūrėkite main.bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Svarbiausi DI modeliai:**
- Microsoft Foundry Models paslaugos įrengimas
- Cognitive Search integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijų Taškas:** Kodėl Šie Modeliai Svarbūs DI

- **Paslaugų priklausomybės:** DI aplikacijoms dažnai reikia kelių koordinuotų paslaugų
- **Saugumas:** API raktai ir galutiniai taškai turi būti saugiai tvarkomi
- **Mastelio Keitimas:** DI apkrova turi unikalias išteklių keitimo sąlygas
- **Išlaidų valdymas:** Nesutvarkytos DI paslaugos gali būti brangios

## 2 modulis: Diegkite Savo Pirmąją DI Aplikaciją

### 2.1 žingsnis: Aplinkos Inicializavimas

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikiamus parametrus:**
```bash
# Nustatykite norimą Azure regioną
azd env set AZURE_LOCATION eastus

# Pasirinktinai: Nustatykite konkretų OpenAI modelį
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### 2.2 žingsnis: Infrastruktūros ir Aplikacijos Diegimas

1. **Diegimas su AZD:**
```bash
azd up
```

**Kas vyksta su `azd up`:**
- ✅ Sukuriama Microsoft Foundry Models paslauga
- ✅ Sukuriama Cognitive Search paslauga
- ✅ Įdiegiama App Service tinklaraščio aplikacijai
- ✅ Konfigūruojamas tinklas ir saugumas
- ✅ Diegiamas programos kodas
- ✅ Įjungiami stebėjimo ir žurnalo įrankiai

2. **Stebėkite diegimo pažangą** ir atkreipkite dėmesį į kuriamus išteklius.

### 2.3 žingsnis: Patikrinkite Savo Diegimą

1. **Patikrinkite įdiegtus išteklius:**
```bash
azd show
```

2. **Atidarykite įdiegtą programą:**
```bash
azd show
```

Atidarykite internetinį galutinį tašką, kuris nurodytas `azd show` išvestyje.

3. **Išbandykite DI funkcionalumą:**
   - Eikite į internetinę aplikaciją
   - Išbandykite pavyzdinius užklausimus
   - Patikrinkite, ar DI atsakymai veikia

### **Laboratorijos Užduotis 2.1: Nesklandumų Šalinimo Praktika**

**Situacija:** Diegimas pavyko, bet DI neatsako.

**Dažniausios problemos:**
1. **OpenAI API raktai:** Patikrinkite, ar tinkamai nustatyti
2. **Modelių prieinamumas:** Įsitikinkite, kad jūsų regionas palaiko modelį
3. **Tinklo ryšys:** Patikrinkite paslaugų sugebėjimą bendrauti
4. **RBAC leidimai:** Patikrinkite, ar aplikacija gali pasiekti OpenAI

**Derinimo komandos:**
```bash
# Patikrinti aplinkos kintamuosius
azd env get-values

# Peržiūrėti dislokavimo žurnalus
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Patikrinti OpenAI diegimo būseną
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## 3 modulis: DI Aplikacijų Priderinimas Jūsų Poreikiams

### 3.1 žingsnis: Modifikuokite DI Konfigūraciją

1. **Atnaujinkite OpenAI modelį:**
```bash
# Pakeiskite į kitą modelį (jei jis yra jūsų regione)
azd env set AZURE_OPENAI_MODEL gpt-4.1

# Iš naujo diegti su nauja konfigūracija
azd deploy
```

2. **Pridėkite papildomas DI paslaugas:**

Redaguokite `infra/main.bicep` ir pridėkite Document Intelligence:

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

### 3.2 žingsnis: Aplinkai Specifiškos Konfigūracijos

**Gera praktika**: Skirtingos konfigūracijos vystymui ir gamybai.

1. **Sukurkite gamybos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite gamybai skirtus parametrus:**
```bash
# Gamyboje paprastai naudojami aukštesni SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įgalinti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorijos Užduotis 3.1: Išlaidų Optimizavimas**

**Iššūkis:** Konfigūruokite šabloną ekonomiškam vystymui.

**Užduotys:**
1. Nustatykite, kuriuos SKU galima nustatyti nemokamais/pagrindiniais lygiais
2. Konfigūruokite aplinkos kintamuosius minimaliosioms sąnaudoms
3. Atlikite diegimą ir palyginkite sąnaudas su gamybine konfigūracija

**Sprendimų užuominos:**
- Naudokite F0 (nemokamą) lygį Cognitive Services, jeigu įmanoma
- Vystymui naudokite pagrindinį lygį Search paslaugai
- Apsvarstykite Consumption plan naudojimą Functions paslaugoms

## 4 modulis: Saugumas ir Gamybinės Gerosios Praktikos

### 4.1 žingsnis: Saugus Kredencialų Valdymas

**Dabartinė problema:** Daugelis DI aplikacijų naudoja kietai užkoduotus API raktus arba nesaugų saugojimą.

**AZD sprendimas:** Valdomos tapatybės + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Ieškokite Key Vault ir valdoma tapatybės konfigūracijos
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite valdomos tapatybės veikimą:**
```bash
# Patikrinkite, ar žiniatinklio programa turi teisingą identiteto konfigūraciją
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### 4.2 žingsnis: Tinklo Saugumas

1. **Įjunkite privačius galutinius taškus** (jei dar nenustatyta):

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

### 4.3 žingsnis: Stebėsena ir Stebėjimo Priemonės

1. **Konfigūruokite Application Insights:**
```bash
# Application Insights turėtų būti automatiškai sukonfigūruotas
# Patikrinkite konfigūraciją:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Nustatykite DI specifinį stebėjimą:**

Pridėkite vartotojų metrikas DI operacijoms:
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

### **Laboratorijos Užduotis 4.1: Saugumo Auditas**

**Užduotis:** Patikrinkite savo diegimą dėl geros saugumo praktikos.

**Tikrinimo sąrašas:**
- [ ] Neturi neišsaugotų slaptažodžių kode ar konfigūracijoje
- [ ] Naudoja Managed Identity paslaugoms autentifikuoti
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Įjungiami stebėjimo ir žurnalo įrankiai

## 5 modulis: Savo DI Aplikacijos Konvertavimas

### 5.1 žingsnis: Vertinimo Darbalapis

**Prieš konvertuojant savo aplikaciją, atsakykite į šiuos klausimus:**

1. **Programos Architektūra:**
   - Kokias DI paslaugas naudoja jūsų aplikacija?
   - Kokius skaičiavimo išteklius reikalauja?
   - Ar reikalinga duomenų bazė?
   - Kokios priklausomybės tarp paslaugų?

2. **Saugumo Reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų aplikacija?
   - Kokie atitikties reikalavimai taikomi?
   - Ar reikalingas privatus tinklas?

3. **Mastelio Keitimo Reikalavimai:**
   - Kokia yra numatoma apkrova?
   - Ar reikia automatinio mastelio keitimo?
   - Ar yra regioniniai reikalavimai?

### 5.2 žingsnis: Sukurkite Savo AZD Šabloną

**Sekite šį modelį konvertuodami savo aplikaciją:**

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

### **Laboratorijos Užduotis 5.1: Šablono Kūrimo Iššūkis**

**Iššūkis:** Sukurkite AZD šabloną dokumentų apdorojimo DI aplikacijai.

**Reikalavimai:**
- Microsoft Foundry Models turinio analizei
- Document Intelligence OCR
- Saugojimo paskyra dokumentų įkėlimui
- Functions aplikacija apdorojimo logikai
- Internetinė aplikacija vartotojo sąsajai

**Papildomi taškai:**
- Tinkamas klaidų valdymas
- Išlaidų vertinimas
- Stebėjimo skydelių nustatymas

## 6 modulis: Dažniausiai Pasitaikančių Problemų Šalinimas

### Dažnos Diegimo Problemų

#### Problema 1: Viršytas OpenAI Paslaugos Kvotas
**Simptomai:** Diegimas nepavyksta dėl kvotos klaidos  
**Sprendimai:**
```bash
# Patikrinti esamus kvotas
az cognitiveservices usage list --location eastus

# Prašyti kvotų didinimo arba išbandyti kitą regioną
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelis Neprieinamas Regionui
**Simptomai:** DI atsakymai nevyksta arba modelio diegimo klaidos  
**Sprendimai:**
```bash
# Patikrinkite modelio prieinamumą pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinti į prieinamą modelį
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Leidimų Problemos
**Simptomai:** 403 uždrausta klaida kviečiant DI paslaugas  
**Sprendimai:**
```bash
# Patikrinti vaidmenų paskyrimus
az role assignment list --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG

# Pridėti trūkstamus vaidmenis
az role assignment create \
  --assignee YOUR_PRINCIPAL_ID \
  --role "Cognitive Services OpenAI User" \
  --scope /subscriptions/YOUR_SUB/resourceGroups/YOUR_RG
```

### Veiklos Problemų Šalinimas

#### Problema 4: Lėtas DI Atsakas
**Tyrimo žingsniai:**
1. Tikrinkite Application Insights našumo metrikas
2. Peržiūrėkite OpenAI paslaugos metrikas Azure portale
3. Patikrinkite tinklo ryšį ir delsą

**Sprendimai:**
- Įgyvendinkite paplitimo kešavimą dažnoms užklausoms
- Naudokite tinkamą OpenAI modelį pagal atvejį
- Apsvarstykite skaitymo kopijas didelio apkrovimo atvejams

### **Laboratorijos Užduotis 6.1: Derinimo Iššūkis**

**Situacija:** Diegimas pavyko, tačiau aplikacija grąžina 500 klaidas.

**Derinimo užduotys:**
1. Tikrinkite aplikacijos žurnalus
2. Patikrinkite paslaugų ryšį
3. Testuokite autentifikaciją
4. Peržiūrėkite konfigūraciją

**Naudingi įrankiai:**
- `azd show` diegimo apžvalgai
- Azure portalas paslaugų žurnaluose
- Application Insights programos telemetrikoje

## 7 modulis: Stebėsena ir Optimizavimas

### 7.1 žingsnis: Viso Kompleksinio Stebėjimo Nustatymas

1. **Sukurkite pasirinktinius skydelius:**

Eikite į Azure portalą ir sukurkite skydelį su:
- OpenAI užklausų skaičius ir delsos metriks
- Programos klaidų rodikliai
- Išteklio naudojimo statistika
- Išlaidų stebėjimas

2. **Nustatykite įspėjimus:**
```bash
# Įspėjimas dėl didelio klaidų lygio
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### 7.2 žingsnis: Išlaidų Optimizavimas

1. **Analizuokite dabartines sąnaudas:**
```bash
# Naudokite Azure CLI, kad gautumėte sąnaudų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įgyvendinkite išlaidų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite automatinio mastelio keitimo politiką
- Įgyvendinkite užklausų kešavimą
- Stebėkite OpenAI rakto naudojimą

### **Laboratorijos Užduotis 7.1: Veiklos Optimizavimas**

**Užduotis:** Optimizuokite DI aplikaciją tiek našumui, tiek sąnaudoms.

**Metrai, kuriuos gerinti:**
- Sumažinti vidutinį atsako laiką 20%
- Sumažinti mėnesines sąnaudas 15%
- Išlaikyti 99,9% veikimo laiką

**Strategijos bandymui:**
- Implementuoti atsakymų kešavimą
- Optimizuoti užklausas dėl raktų efektyvumo
- Naudoti tinkamus skaičiavimo SKU
- Nustatyti tinkamą automatinį mastelio keitimą

## Galutinis Iššūkis: Visapusiškas Diegimas

### Iššūkio Scenarijus

Jums pavesta sukurti produkcijai paruoštą DI pagrindu veikiantį klientų aptarnavimo pokalbių robotą su šiais reikalavimais:

**Funkciniai Reikalavimai:**
- Internetinė sąsaja klientų sąveikai
- Integracija su Microsoft Foundry Models atsakymams
- Dokumentų paieška naudojant Cognitive Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė palaikymas

**Ne-funkciniai Reikalavimai:**
- Aptarnauti 1000 vienu metu veikiančių naudotojų
- 99,9% pasiekiamumo SLA
- SOC 2 atitikimas
- Išlaidos neviršija 500$/mėn.
- Diegimas kelioms aplinkoms (vystymas, testavimas, gamyba)

### Įgyvendinimo Žingsniai

1. Sukurti architektūrą  
2. Sukurti AZD šabloną  
3. Įgyvendinti saugumo priemones  
4. Nustatyti stebėjimą ir įspėjimus  
5. Sukurti diegimų vamzdynus  
6. Dokumentuoti sprendimą  

### Vertinimo Kriterijai

- ✅ **Funkcionalumas:** Ar atitinka visus reikalavimus?  
- ✅ **Saugumas:** Ar įdiegtos geros praktikos?  
- ✅ **Mastelio keitimas:** Ar gali aptarnauti apkrovą?  
- ✅ **Prižiūrimumas:** Ar kodas ir infrastruktūra gerai suorganizuoti?  
- ✅ **Išlaidos:** Ar išlaikoma biudžeto riba?  

## Papildomi Ištekliai

### Microsoft Dokumentacija
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Paslaugų Dokumentacija](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Dokumentacija](https://learn.microsoft.com/azure/ai-studio/)

### Pavyzdiniai Šablonai
- [Microsoft Foundry Models Chat programėlė](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat programėlės greitas pradžios vadovas](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Bendruomenės ištekliai
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Baigimo pažymėjimas

Sveikiname! Jūs baigėte DI dirbtuvių laboratoriją. Dabar turėtumėte sugebėti:

- ✅ Konvertuoti esamas DI programas į AZD šablonus
- ✅ Diegti produkcijai paruoštas DI programas
- ✅ Įgyvendinti saugumo gerąsias praktiką DI darbo krūviams
- ✅ Stebėti ir optimizuoti DI programų veikimą
- ✅ Spręsti dažnias diegimo problemas

### Tolimesni žingsniai
1. Taikyti šiuos modelius savo DI projektuose
2. Grąžinti šablonus bendruomenei
3. Prisijungti prie Microsoft Foundry Discord dėl nuolatinės pagalbos
4. Tyrinėti pažangias temas, tokias kaip daugiakampiai regionų diegimai

---

**Dirbtuvių atsiliepimai**: Padėkite mums tobulinti šias dirbtuves dalindamiesi savo patirtimi [Microsoft Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyriaus navigacija:**
- **📚 Kursų pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius – DI pirmoji kūrimo praktika
- **⬅️ Ankstesnis**: [DI modelio diegimas](ai-model-deployment.md)
- **➡️ Sekantis**: [DI gamybos gerosios praktikos](production-ai-practices.md)
- **🚀 Sekantis skyrius**: [3 skyrius: Konfigūravimas](../chapter-03-configuration/configuration.md)

**Reikia pagalbos?** Prisijunkite prie mūsų bendruomenės pagalbai ir diskusijoms apie AZD ir DI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatizuotuose vertimuose gali būti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojama kreiptis į profesionalius vertėjus. Mes neatsakome už jokią neteisingą supratimą ar klaidų aiškinimą, kilusį dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->