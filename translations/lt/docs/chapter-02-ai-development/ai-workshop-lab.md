# AI Workshop Lab: Kaip padaryti, kad jūsų AI sprendimai būtų diegiami per AZD

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 2 - AI-First Development
- **⬅️ Previous**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Next**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Next Chapter**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Laboratorijos apžvalga

Ši praktinė laboratorija veda kūrėjus per procesą, kaip paimti esamą AI šabloną ir jį įdiegti naudojant Azure Developer CLI (AZD). Išmoksite esminių gamybai tinkamų AI diegimo modelių naudojant Microsoft Foundry paslaugas.

> **Validation note (2026-03-25):** This workshop was reviewed against `azd` `1.23.12`. If your local installation is older, update AZD before starting so the auth, template, and deployment workflow matches the steps below.

**Duration:** 2-3 hours  
**Level:** Intermediate  
**Prerequisites:** Basic Azure knowledge, familiarity with AI/ML concepts

## 🎓 Mokymosi tikslai

Baigę šią laboratoriją, galėsite:
- ✅ Konvertuoti esamą AI programą, kad ji naudotų AZD šablonus
- ✅ Konfigūruoti Microsoft Foundry paslaugas naudojant AZD
- ✅ Įdiegti saugų kredencialų valdymą AI paslaugoms
- ✅ Diegti gamybai tinkamas AI programas su stebėjimu
- ✅ Trikčių šalinimas dažnai pasitaikančių AI diegimo problemų

## Išankstinės sąlygos

### Reikalingi įrankiai
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegtas
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojama VS Code)

### Azure ištekliai
- Azure prenumerata su contributor prieiga
- Prieiga prie Microsoft Foundry Models paslaugų (arba galimybė prašyti prieigos)
- Leidimai kurti resource group

### Žinių reikalavimai
- Pagrindinės Azure paslaugų žinios
- Patirtis su komandine eilute
- Pagrindinės AI/ML sąvokos (API, modeliai, prompt'ai)

## Laboratorijos paruošimas

### Žingsnis 1: Aplinkos paruošimas

1. **Patikrinkite įrankių įdiegimus:**
```bash
# Patikrinkite AZD diegimą
azd version

# Patikrinkite Azure CLI
az --version

# Prisijunkite prie Azure AZD darbo eigoms
azd auth login

# Prisijunkite prie Azure CLI tik jei ketinate vykdyti az komandas diagnostikos metu
az login
```

Jei dirbate keliuose tenant'uose arba jūsų prenumerata nenuskaitoma automatiškai, bandykite prisijungti dar kartą naudodami `azd auth login --tenant-id <tenant-id>`.

2. **Klonuokite laboratorijos saugyklą:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulis 1: AZD struktūros supratimas AI programoms

### AI AZD šablono anatomija

Išnagrinėkite pagrindinius failus AI pasirengusiame AZD šablone:

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

### **Laboratorijos pratimas 1.1: Konfigūracijos tyrinėjimas**

1. **Peržiūrėkite azure.yaml failą:**
```bash
cat azure.yaml
```

**Ko ieškoti:**
- Paslaugų apibrėžimai AI komponentams
- Aplinkos kintamųjų susiejimai
- Host konfigūracijos

2. **Peržiūrėkite main.bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Pagrindiniai AI šablonai, kuriuos reikia nustatyti:**
- Microsoft Foundry Models paslaugos paruošimas
- Azure AI Search integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijos taškas:** Kodėl šie šablonai svarbūs AI

- **Paslaugų priklausomybės**: AI programoms dažnai reikalingos kelios koordinuotos paslaugos
- **Sauga**: API raktai ir endpoint'ai turi būti saugiai valdomi
- **Išplečiamumas**: AI darbo krūviai turi specifinius skalavimo reikalavimus
- **Išlaidų valdymas**: AI paslaugos gali būti brangios, jei nėra tinkamai sukonfigūruotos

## Modulis 2: Diegti savo pirmąją AI programą

### Žingsnis 2.1: Aplinkos inicializavimas

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikiamus parametrus:**
```bash
# Nustatykite savo pageidaujamą Azure regioną
azd env set AZURE_LOCATION eastus

# Pasirinktinai: nustatykite konkretų OpenAI modelį
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
```

### Žingsnis 2.2: Diegti infrastruktūrą ir programą

1. **Diegti naudojant AZD:**
```bash
azd up
```

**Kas vyksta vykdant `azd up`:**
- ✅ Paruošia Microsoft Foundry Models paslaugą
- ✅ Sukuria Azure AI Search paslaugą
- ✅ Nustato App Service žiniatinklio programai
- ✅ Konfigūruoja tinklą ir saugumą
- ✅ Diegia programos kodą
- ✅ Nustato stebėjimą ir žurnalavimą

2. **Stebėkite diegimo eigą** ir atkreipkite dėmesį į kuriamus išteklius.

### Žingsnis 2.3: Patikrinkite savo diegimą

1. **Patikrinkite įdiegtus išteklius:**
```bash
azd show
```

2. **Atidarykite įdiegtą programą:**
```bash
azd show
```

Atidarykite žiniatinklio endpoint'ą, parodytą `azd show` išvestyje.

3. **Išbandykite AI funkcionalumą:**
   - Apsilankykite žiniatinklio programoje
   - Išbandykite pavyzdinius užklausimus
   - Patikrinkite, ar AI atsakymai veikia

### **Laboratorijos pratimas 2.1: Trikčių šalinimo praktika**

**Scenarijus**: Jūsų diegimas pavyko, bet AI neatsako.

**Dažnos problemos, kurias reikia patikrinti:**
1. **OpenAI API raktai**: Patikrinkite, ar jie teisingai nustatyti
2. **Modelio prieinamumas**: Patikrinkite, ar jūsų regionas palaiko modelį
3. **Tinklo ryšys**: Įsitikinkite, kad paslaugos gali komunikuoti
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

## Modulis 3: Pritaikyti AI programas pagal jūsų poreikius

### Žingsnis 3.1: Redaguokite AI konfigūraciją

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

### Žingsnis 3.2: Konfigūracijos, priklausančios nuo aplinkos

**Geriausia praktika**: Skirtingos konfigūracijos kūrimui ir produkcijai.

1. **Sukurkite gamybinę aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite gamybai būdingus parametrus:**
```bash
# Produkcijoje paprastai naudojamos aukštesnės SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įgalinti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Laboratorijos pratimas 3.1: Išlaidų optimizavimas**

**Iššūkis**: Konfigūruokite šabloną ekonomiškam kūrimui.

**Užduotys:**
1. Nustatykite, kurios SKU galima nustatyti į nemokamus / bazinius lygius
2. Konfigūruokite aplinkos kintamuosius minimaliosioms išlaidoms
3. Įdiekite ir palyginkite išlaidas su gamybine konfigūracija

**Sprendimo užuominos:**
- Naudokite F0 (nemokamą) lygį Azure AI paslaugoms, kai įmanoma
- Kūrimo metu naudokite Basic lygį Search paslaugai
- Apsvarstykite galimybę naudoti Consumption planą Functions

## Modulis 4: Saugumas ir gamybos geriausios praktikos

### Žingsnis 4.1: Saugus kredencialų valdymas

**Dabartinė problema**: Daugelis AI programų įkoduoja API raktus arba naudoja nesaugų saugojimą.

**AZD sprendimas**: Valdomos tapatybės + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Ieškokite Key Vault ir valdomos tapatybės konfigūracijos
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, kad valdomoji tapatybė veiktų:**
```bash
# Patikrinkite, ar žiniatinklio programa turi teisingą tapatybės konfigūraciją
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Žingsnis 4.2: Tinklo saugumas

1. **Įgalinkite privatųs galinius taškus** (jei dar nekonfigūruota):

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

### Žingsnis 4.3: Stebėjimas ir matomumas

1. **Konfigūruokite Application Insights:**
```bash
# Application Insights turėtų būti automatiškai sukonfigūruotas
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

### **Laboratorijos pratimas 4.1: Saugumo auditas**

**Užduotis**: Peržiūrėkite savo diegimą pagal saugumo gerąsias praktikas.

**Kontrolinis sąrašas:**
- [ ] Nėra įkoduotų paslapčių kode ar konfigūracijoje
- [ ] Valdomoji tapatybė naudojama paslaugų tarpusavio autentifikacijai
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Įjungtas stebėjimas ir žurnalavimas

## Modulis 5: Konvertuoti savo AI programą

### Žingsnis 5.1: Įvertinimo anketė

**Prieš konvertuodami savo programą**, atsakykite į šiuos klausimus:

1. **Programos architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokie skaičiavimo ištekliai jai reikalingi?
   - Ar reikalinga duomenų bazė?
   - Kokie yra priklausomybės tarp paslaugų?

2. **Saugumo reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų programa?
   - Kokius atitikties reikalavimus turite?
   - Ar reikia privatūs tinklai?

3. **Skalavimo reikalavimai:**
   - Koks numatomas apkrovimas?
   - Ar reikia automatinio skalavimo?
   - Ar yra regioniniai reikalavimai?

### Žingsnis 5.2: Sukurkite savo AZD šabloną

**Laikykitės šio šablono, kad konvertuotumėte savo programą:**

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

### **Laboratorijos pratimas 5.1: Šablono kūrimo iššūkis**

**Iššūkis**: Sukurkite AZD šabloną dokumentų apdorojimo AI programai.

**Reikalavimai:**
- Microsoft Foundry Models turinio analizei
- Document Intelligence OCR funkcionalumui
- Storage Account dokumentų įkėlimui
- Function App apdorojimo logikai
- Web app vartotojo sąsajai

**Papildomi taškai:**
- Pridėkite tinkamą klaidų tvarkymą
- Įtraukite sąnaudų įvertinimą
- Nustatykite stebėjimo informacijos paneles

## Modulis 6: Dažniausiai pasitaikančių problemų trikčių šalinimas

### Dažnos diegimo problemos

#### Problema 1: Viršytas OpenAI paslaugos kvotos limitas
**Simptomai:** Diegimas nepavyksta dėl kvotos klaidos
**Sprendimai:**
```bash
# Patikrinkite dabartines kvotas
az cognitiveservices usage list --location eastus

# Prašykite kvotos padidinimo arba išbandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up
```

#### Problema 2: Modelis nėra pasiekiamas regione
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos
**Sprendimai:**
```bash
# Patikrinti modelio prieinamumą pagal regionus
az cognitiveservices model list --location eastus

# Atnaujinti į prieinamą modelį
azd env set AZURE_OPENAI_MODEL gpt-4.1-mini
azd deploy
```

#### Problema 3: Prieigos teisės problemos
**Simptomai:** 403 Forbidden klaidos kviečiant AI paslaugas
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
1. Patikrinkite Application Insights dėl veiklos metrikų
2. Peržiūrėkite OpenAI paslaugos metrikas Azure portale
3. Patikrinkite tinklo ryšį ir vėlavimą

**Sprendimai:**
- Įgyvendinkite talpyklą dažnoms užklausoms
- Naudokite tinkamą OpenAI modelį jūsų naudojimo atvejui
- Apsvarstykite skaitymo replikas didelės apkrovos scenarijams

### **Laboratorijos pratimas 6.1: Derinimo iššūkis**

**Scenarijus**: Jūsų diegimas pavyko, bet programa grąžina 500 klaidas.

**Derinimo užduotys:**
1. Patikrinkite programos žurnalus
2. Patikrinkite paslaugų ryšį
3. Išbandykite autentifikaciją
4. Peržiūrėkite konfigūraciją

**Įrankiai, kuriuos naudoti:**
- `azd show` diegimo apžvalgai
- Azure portal detalėms paslaugų žurnalams
- Application Insights programos telemetrijai

## Modulis 7: Stebėjimas ir optimizavimas

### Žingsnis 7.1: Nustatykite išsamų stebėjimą

1. **Sukurkite pasirinktines informacines lentas:**

Eikite į Azure portalą ir sukurkite informacinę lentą su:
- OpenAI užklausų skaičius ir uždelsimas
- Programos klaidų rodikliai
- Išteklių naudojimas
- Išlaidų stebėjimas

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

### Žingsnis 7.2: Išlaidų optimizavimas

1. **Analizuokite esamas išlaidas:**
```bash
# Naudokite Azure CLI, kad gautumėte sąnaudų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įgyvendinkite išlaidų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite autoscaling politiką
- Įgyvendinkite užklausų talpinimą
- Stebėkite OpenAI tokenų naudojimą

### **Laboratorijos pratimas 7.1: Veiklos optimizavimas**

**Užduotis**: Optimizuokite savo AI programą tiek veiklai, tiek išlaidoms.

**Metrikos, kurias reikia pagerinti:**
- Sumažinti vidutinį atsako laiką 20%
- Sumažinti mėnesines išlaidas 15%
- Išlaikyti 99.9% prieinamumą

**Strategijos, kurias išbandyti:**
- Įdiegti atsako talpinimą
- Optimizuoti prompt'us tokenų efektyvumui
- Naudoti tinkamus kompiuterių SKU
- Nustatyti tinkamą automatinį skalavimą

## Galutinis iššūkis: Nuo pradžios iki pabaigos įgyvendinimas

### Iššūkio scenarijus

Jums pavesta sukurti gamybai parengtą AI pagrįstą klientų aptarnavimo pokalbių robotą su šiomis sąlygomis:

**Funkciniai reikalavimai:**
- Žiniatinklio sąsaja klientų sąveikoms
- Integracija su Microsoft Foundry Models atsakymams
- Dokumentų paieškos galimybė naudojant Azure AI Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė palaikymas

**Ne-funkciniai reikalavimai:**
- Aptarnauti 1000 lygiagrečių vartotojų
- 99.9% uptime SLA
- SOC 2 atitiktis
- Išlaidos iki $500/mėn
- Diegimas kelioms aplinkoms (dev, staging, prod)

### Įgyvendinimo žingsniai

1. Sukurkite architektūrą
2. Sukurkite AZD šabloną
3. Įdiekite saugumo priemones
4. Nustatykite stebėjimą ir įspėjimus
5. Sukurkite diegimo linijas
6. Dokumentuokite sprendimą

### Vertinimo kriterijai

- ✅ **Funkcionalumas**: Ar atitinka visus reikalavimus?
- ✅ **Sauga**: Ar įgyvendintos gerosios praktikos?
- ✅ **Išplečiamumas**: Ar gali tvarkyti apkrovą?
- ✅ **Palaikymas**: Ar kodas ir infrastruktūra gerai organizuoti?
- ✅ **Išlaidos**: Ar laikosi biudžeto?

## Papildomi ištekliai

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Microsoft Foundry Models Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Pavyzdiniai šablonai
- [Microsoft Foundry Models Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
- [OpenAI Chat App Quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart)
- [Contoso Chat](https://github.com/Azure-Samples/contoso-chat)

### Bendruomenės ištekliai
- [Microsoft Foundry Discord](https://discord.gg/microsoft-azure)
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Awesome AZD Templates](https://azure.github.io/awesome-azd/)

## 🎓 Baigimo pažymėjimas

Sveikiname! Jūs baigėte AI dirbtuvių laboratoriją. Dabar turėtumėte sugebėti:

- ✅ Konvertuoti esamas AI programas į AZD šablonus
- ✅ Diegti gamybai paruoštas AI programas
- ✅ Įdiegti saugumo geriausias praktikas AI darbo krūviams
- ✅ Stebėti ir optimizuoti AI programų našumą
- ✅ Šalinti dažnas diegimo problemas

### Tolimesni veiksmai
1. Pritaikykite šiuos modelius savo AI projektams
2. Prisidėkite šablonais bendruomenei
3. Prisijunkite prie Microsoft Foundry Discord dėl tolesnės pagalbos
4. Tyrinėkite pažangias temas, tokias kaip daugregioniai diegimai

---

**Atsiliepimai apie dirbtuves**: Padėkite mums patobulinti šias dirbtuves pasidalindami savo patirtimi [Microsoft Foundry Discord #Azure channel](https://discord.gg/microsoft-azure).

---

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI-pirmumo vystymas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Gamybinės AI geriausios praktikos](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

Reikia pagalbos? Prisijunkite prie mūsų bendruomenės dėl palaikymo ir diskusijų apie AZD ir AI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->