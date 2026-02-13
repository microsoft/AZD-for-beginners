# AI dirbtuvės: padarykite savo AI sprendimus diegiamus per AZD

**Skyriaus naršymas:**
- **📚 Kurso pradžia**: [AZD For Beginners](../../README.md)
- **📖 Dabartinis skyrius**: Skyrius 2 - AI-pirmasis vystymas
- **⬅️ Ankstesnis**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Kitas**: [Production AI Best Practices](production-ai-practices.md)
- **🚀 Kitas skyrius**: [Chapter 3: Configuration](../chapter-03-configuration/configuration.md)

## Dirbtuvių apžvalga

Šis praktinis laboratorinis užsiėmimas veda kūrėjus per procesą, kaip imti esamą AI šabloną ir jį diegti naudojant Azure Developer CLI (AZD). Išmoksite esminių modelių gamybiniams AI diegimams, naudojant Microsoft Foundry paslaugas.

**Trukmė:** 2-3 valandos  
**Lygis:** Vidutinis  
**Išankstiniai reikalavimai:** Pagrindinės Azure žinios, susipažinimas su AI/ML koncepcijomis

## 🎓 Mokymosi tikslai

Baigę šias dirbtuves galėsite:
- ✅ Konvertuoti esamą AI programą, kad būtų naudojami AZD šablonai
- ✅ Konfigūruoti Microsoft Foundry paslaugas naudojant AZD
- ✅ Įdiegti saugų prisijungimų valdymą AI paslaugoms
- ✅ Diegti gamybai paruoštas AI programas su stebėsena
- ✅ Spręsti dažnas AI diegimo problemas

## Išankstiniai reikalavimai

### Reikalingi įrankiai
- [Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) įdiegtas
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) įdiegtas
- [Git](https://git-scm.com/) įdiegtas
- Kodo redaktorius (rekomenduojamas VS Code)

### Azure ištekliai
- Azure prenumerata su Contributor prieigos teisėmis
- Prieiga prie Azure OpenAI paslaugų (arba galimybė jos prašyti)
- Leidimai kurti išteklių grupes

### Žinių reikalavimai
- Pagrindinės Azure paslaugų žinios
- Susipažinimas su komandine eilute
- Pagrindinės AI/ML sąvokos (API, modeliai, promptai)

## Laboratorijos paruošimas

### Žingsnis 1: Aplinkos paruošimas

1. **Patikrinkite įrankių įdiegimą:**
```bash
# Patikrinti AZD diegimą
azd version

# Patikrinti Azure CLI
az --version

# Prisijungti prie Azure
az login
azd auth login
```

2. **Klonuokite dirbtuvių saugyklą:**
```bash
git clone https://github.com/Azure-Samples/azure-search-openai-demo
cd azure-search-openai-demo
```

## Modulis 1: AZD struktūros supratimas AI programoms

### AI AZD šablono sandara

Išnagrinėkite pagrindinius failus AI parengtame AZD šablone:

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

### **Praktinė užduotis 1.1: Išnagrinėkite konfigūraciją**

1. **Peržiūrėkite azure.yaml failą:**
```bash
cat azure.yaml
```

**Ko ieškoti:**
- Paslaugų apibrėžimai AI komponentams
- Aplinkos kintamųjų susiejimai
- Hostingo konfigūracijos

2. **Peržiūrėkite main.bicep infrastruktūrą:**
```bash
cat infra/main.bicep
```

**Pagrindiniai AI šablonai, kuriuos reikia identifikuoti:**
- Azure OpenAI paslaugos paruošimas
- Cognitive Search integracija
- Saugus raktų valdymas
- Tinklo saugumo konfigūracijos

### **Diskusijos taškas:** Kodėl šie šablonai svarbūs AI

- **Paslaugų priklausomybės**: AI programoms dažnai reikalingos kelios suderintos paslaugos
- **Saugumas**: API raktai ir galiniai taškai turi būti saugiai valdomi
- **Mastelio keitimas**: AI apkrovos turi specifinius mastelio keitimo reikalavimus
- **Sąnaudų valdymas**: AI paslaugos gali būti brangios, jei jos nėra tinkamai sukonfigūruotos

## Modulis 2: Diegkite savo pirmąją AI programą

### Žingsnis 2.1: Inicijuokite aplinką

1. **Sukurkite naują AZD aplinką:**
```bash
azd env new myai-workshop
```

2. **Nustatykite reikiamus parametrus:**
```bash
# Nustatykite savo pageidaujamą Azure regioną
azd env set AZURE_LOCATION eastus

# Neprivaloma: Nustatykite konkretų OpenAI modelį
azd env set AZURE_OPENAI_MODEL gpt-35-turbo
```

### Žingsnis 2.2: Diegti infrastruktūrą ir programą

1. **Diegti naudojant AZD:**
```bash
azd up
```

**Kas vyksta vykdant `azd up`:**
- ✅ Paruošiama Azure OpenAI paslauga
- ✅ Sukuriama Cognitive Search paslauga
- ✅ Nustatomas App Service žiniatinklio programai
- ✅ Konfigūruojami tinklai ir saugumas
- ✅ Diegiamas programos kodas
- ✅ Nustatoma stebėsena ir žurnavimas

2. **Stebėkite diegimo eigą** ir užsirašykite kuriamus išteklius.

### Žingsnis 2.3: Patikrinkite diegimą

1. **Patikrinkite diegiamus išteklius:**
```bash
azd show
```

2. **Atidarykite diegtą programą:**
```bash
azd show --output json | grep "webAppUrl"
```

3. **Išbandykite AI funkcionalumą:**
   - Eikite į žiniatinklio programą
   - Išbandykite pavyzdines užklausas
   - Patikrinkite, ar AI atsakymai veikia

### **Praktinė užduotis 2.1: Gedimų šalinimo pratimas**

**Scenarijus**: jūsų diegimas pavyko, bet AI neatsako.

**Dažnos problemos, kurias reikėtų patikrinti:**
1. **OpenAI API raktai**: patikrinkite, ar jie tinkamai nustatyti
2. **Modelio prieinamumas**: patikrinkite, ar jūsų regionas palaiko modelį
3. **Tinklo ryšys**: užtikrinkite, kad paslaugos galėtų komunikuoti
4. **RBAC leidimai**: patikrinkite, ar programa gali pasiekti OpenAI

**Derinimo komandos:**
```bash
# Patikrinti aplinkos kintamuosius
azd env get-values

# Peržiūrėti diegimo žurnalus
az webapp log tail --name YOUR_APP_NAME --resource-group YOUR_RG

# Patikrinti OpenAI diegimo būseną
az cognitiveservices account deployment list --name YOUR_OPENAI_NAME --resource-group YOUR_RG
```

## Modulis 3: AI programų pritaikymas jūsų poreikiams

### Žingsnis 3.1: Pakeiskite AI konfigūraciją

1. **Atnaujinkite OpenAI modelį:**
```bash
# Pakeiskite į kitą modelį (jei jis prieinamas jūsų regione)
azd env set AZURE_OPENAI_MODEL gpt-4

# Iš naujo įdiekite naudodami naują konfigūraciją
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

### Žingsnis 3.2: Aplinkai specifiškos konfigūracijos

**Geriausia praktika**: skirtingos konfigūracijos vystymui ir gamybai.

1. **Sukurkite gamybos aplinką:**
```bash
azd env new myai-production
```

2. **Nustatykite gamybai specifinius parametrus:**
```bash
# Gamyboje paprastai naudojami aukštesnio lygio SKU
azd env set AZURE_OPENAI_SKU S0
azd env set AZURE_SEARCH_SKU standard

# Įgalinti papildomas saugumo funkcijas
azd env set ENABLE_PRIVATE_ENDPOINTS true
```

### **Praktinė užduotis 3.1: Sąnaudų optimizavimas**

**Uždavinys**: sukonfigūruokite šabloną ekonomiškam vystymui.

**Užduotys:**
1. Nustatykite, kurios SKU gali būti nustatytos į free/basic lygius
2. Konfigūruokite aplinkos kintamuosius minimaliosioms sąnaudoms
3. Diekite ir palyginkite sąnaudas su gamybine konfigūracija

**Sprendimo užuominos:**
- Naudokite F0 (nemokamą) sluoksnį Cognitive Services, kai įmanoma
- Naudokite Basic sluoksnį Search paslaugai vystymo metu
- Apsvarstykite Consumption planą Functions paslaugoms

## Modulis 4: Saugumas ir geriausios gamybinės praktikos

### Žingsnis 4.1: Saugus kredencialų valdymas

**Dabartinė problema**: daug AI programų įkoduoja API raktus arba naudoja nesaugų saugojimą.

**AZD sprendimas**: Managed Identity + Key Vault integracija.

1. **Peržiūrėkite saugumo konfigūraciją savo šablone:**
```bash
# Patikrinkite Key Vault ir valdomos tapatybės konfigūraciją.
grep -r "keyVault\|managedIdentity" infra/
```

2. **Patikrinkite, ar Managed Identity veikia:**
```bash
# Patikrinkite, ar žiniatinklio programos tapatybės konfigūracija yra teisinga
az webapp identity show --name YOUR_APP_NAME --resource-group YOUR_RG
```

### Žingsnis 4.2: Tinklo saugumas

1. **Įgalinkite privatinius galinius taškus** (jei dar nekonfigūruota):

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

### Žingsnis 4.3: Monitoravimas ir observabilumas

1. **Sukonfigūruokite Application Insights:**
```bash
# Application Insights turėtų būti automatiškai sukonfigūruotas
# Patikrinkite konfigūraciją:
az monitor app-insights component show --app YOUR_APP_NAME --resource-group YOUR_RG
```

2. **Sukurkite AI specifinę stebėseną:**

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

### **Praktinė užduotis 4.1: Saugumo auditas**

**Užduotis**: Peržiūrėkite savo diegimą pagal saugumo gerąsias praktikas.

**Kontrolinis sąrašas:**
- [ ] Nėra kietai įkoduotų slaptų raktų kode ar konfigūracijoje
- [ ] Managed Identity naudojama paslaugų tarpusavio autentifikacijai
- [ ] Key Vault saugo jautrią konfigūraciją
- [ ] Tinklo prieiga tinkamai apribota
- [ ] Stebėsena ir žurnalavimas įjungti

## Modulis 5: Jūsų AI programos konvertavimas

### Žingsnis 5.1: Įvertinimo lapas

**Prieš konvertuodami savo programą**, atsakykite į šiuos klausimus:

1. **Programos architektūra:**
   - Kokias AI paslaugas naudoja jūsų programa?
   - Kokių skaičiavimo išteklių jai reikia?
   - Ar reikalinga duomenų bazė?
   - Kokios priklausomybės tarp paslaugų?

2. **Saugumo reikalavimai:**
   - Kokius jautrius duomenis tvarko jūsų programa?
   - Kokius atitikties reikalavimus turite?
   - Ar jums reikia privataus tinklo?

3. **Mastelio reikalavimai:**
   - Koks yra laukiamas apkrovimas?
   - Ar reikia automatinio mastelio keitimo?
   - Ar yra regioninių reikalavimų?

### Žingsnis 5.2: Sukurkite savo AZD šabloną

**Laikykitės šio šablono, kad konvertuotumėte programą:**

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

### **Praktinė užduotis 5.1: Šablono kūrimo iššūkis**

**Uždavinys**: Sukurkite AZD šabloną dokumentų apdorojimo AI programai.

**Reikalavimai:**
- Azure OpenAI turiniui analizuoti
- Document Intelligence OCR
- Storage Account dokumentų įkėlimams
- Function App apdorojimo logikai
- Web app vartotojo sąsajai

**Papildomi taškai:**
- Pridėkite tinkamą klaidų valdymą
- Įtraukite sąnaudų įvertinimą
- Nustatykite stebėjimo informacines sritis

## Modulis 6: Dažnų problemų šalinimas

### Dažnos diegimo problemos

#### Klaida 1: OpenAI paslaugos kvota viršyta
**Simptomai:** diegimas nepavyksta dėl kvotos klaidos
**Sprendimai:**
```bash
# Patikrinkite dabartines kvotas
az cognitiveservices usage list --location eastus

# Prašykite kvotos padidinimo arba pabandykite kitą regioną
azd env set AZURE_LOCATION westus2
azd up
```

#### Klaida 2: Modelis nepasiekiamas regione
**Simptomai:** AI atsakymai nepavyksta arba modelio diegimo klaidos
**Sprendimai:**
```bash
# Patikrinti modelio prieinamumą pagal regioną
az cognitiveservices model list --location eastus

# Atnaujinti į prieinamą modelį
azd env set AZURE_OPENAI_MODEL gpt-35-turbo-16k
azd deploy
```

#### Klaida 3: Leidimų problemos
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

### Našumo problemos

#### Klaida 4: Lėti AI atsakymai
**Tyrimo žingsniai:**
1. Patikrinkite Application Insights našumo metrikas
2. Peržiūrėkite OpenAI paslaugos metrikas Azure portale
3. Patikrinkite tinklo ryšį ir vėlavimą

**Sprendimai:**
- Įgyvendinkite talpyklavimą dažnoms užklausoms
- Naudokite tinkamą OpenAI modelį savo atvejui
- Apsvarstykite skaitymo replikas didelio užimimo scenarijams

### **Praktinė užduotis 6.1: Derinimo iššūkis**

**Scenarijus**: jūsų diegimas pavyko, bet programa grąžina 500 klaidas.

**Derinimo užduotys:**
1. Patikrinkite programos žurnalus
2. Patikrinkite paslaugų ryšį
3. Išbandykite autentifikaciją
4. Peržiūrėkite konfigūraciją

**Įrankiai, kuriuos naudoti:**
- `azd show` diegimo apžvalgai
- Azure portalas detaliems paslaugų žurnalams
- Application Insights programos telemetriniams duomenims

## Modulis 7: Stebėsena ir optimizavimas

### Žingsnis 7.1: Sukurkite visapusišką stebėseną

1. **Sukurkite pasirinktinius informacinius skydus:**

Eikite į Azure portalą ir sukurkite skydą su:
- OpenAI užklausų skaičius ir vėlavimas
- Programos klaidų rodikliai
- Išteklių naudojimas
- Sąnaudų sekimas

2. **Sukonfigūruokite įspėjimus:**
```bash
# Įspėjimas apie didelį klaidų dažnį
az monitor metrics alert create \
  --name "AI-App-High-Error-Rate" \
  --resource-group YOUR_RG \
  --target-resource-id YOUR_APP_ID \
  --condition "avg Http5xx greater than 10" \
  --description "Alert when error rate is high"
```

### Žingsnis 7.2: Sąnaudų optimizavimas

1. **Analizuokite esamas sąnaudas:**
```bash
# Naudokite Azure CLI, kad gautumėte išlaidų duomenis
az consumption usage list --start-date 2024-01-01 --end-date 2024-01-31
```

2. **Įgyvendinkite sąnaudų kontrolę:**
- Nustatykite biudžeto įspėjimus
- Naudokite autoscaling politiką
- Įgyvendinkite užklausų talpyklavimą
- Stebėkite OpenAI tokenų naudojimą

### **Praktinė užduotis 7.1: Našumo optimizavimas**

**Uždavinys**: Optimizuokite savo AI programą tiek našumui, tiek sąnaudoms.

**Metrikos, kurias reikia pagerinti:**
- Sumažinti vidutinį atsakymo laiką 20%
- Sumažinti mėnesines sąnaudas 15%
- Išlaikyti 99.9% prieinamumą

**Strategijos, kurias išbandyti:**
- Įgyvendinkite atsakymų talpyklavimą
- Optimizuokite promptus tokenų efektyvumui
- Naudokite tinkamus skaičiavimo SKU
- Nustatykite tinkamą automatinį mastelio keitimą

## Galutinis iššūkis: nuo pradžios iki pabaigos įgyvendinimas

### Iššūkio scenarijus

Jums pavesta sukurti gamybai parengtą AI palaikomą klientų aptarnavimo pokalbių robotą su šiais reikalavimais:

**Funkciniai reikalavimai:**
- Žiniatinklio sąsaja klientų sąveikai
- Integracija su Azure OpenAI atsakymams
- Dokumentų paieškos galimybė naudojant Cognitive Search
- Integracija su esama klientų duomenų baze
- Daugiakalbė palaikymas

**Nefunkciniai reikalavimai:**
- Aptarnauti 1000 vienu metu prisijungusių vartotojų
- 99.9% prieinamumas (SLA)
- SOC 2 atitiktis
- Sąnaudos iki $500/mėn.
- Diegimas į kelias aplinkas (dev, staging, prod)

### Įgyvendinimo žingsniai

1. **Sukurkite architektūrą**
2. **Sukurkite AZD šabloną**
3. **Įdiekite saugumo priemones**
4. **Nustatykite stebėseną ir įspėjimus**
5. **Sukurkite diegimo pipelines**
6. **Dokumentuokite sprendimą**

### Įvertinimo kriterijai

- ✅ **Funkcionalumas**: Ar atitinka visus reikalavimus?
- ✅ **Saugumas**: Ar įgyvendintos gerosios praktikos?
- ✅ **Masteliai**: Ar gali tvarkyti apkrovą?
- ✅ **Priežiūra**: Ar kodas ir infrastruktūra gerai sutvarkyti?
- ✅ **Sąnaudos**: Ar atitinka biudžetą?

## Papildomi ištekliai

### Microsoft dokumentacija
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure OpenAI Service Documentation](https://learn.microsoft.com/azure/cognitive-services/openai/)
- [Microsoft Foundry Documentation](https://learn.microsoft.com/azure/ai-studio/)

### Pavyzdiniai šablonai
- [Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)
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
- ✅ Įgyvendinti saugumo gerąsias praktikas AI darbo krūviams
- ✅ Stebėti ir optimizuoti AI programų našumą
- ✅ Spręsti dažniausias diegimo problemas

### Kiti žingsniai
1. Taikykite šiuos šablonus savo AI projektuose
2. Prisidėkite šablonais prie bendruomenės
3. Prisijunkite prie Microsoft Foundry Discord dėl nuolatinės pagalbos
4. Išnagrinėkite pažangias temas, pvz., kelių regionų diegimus

---

**Atsiliepimai apie dirbtuves**: Padėkite mums tobulinti šias dirbtuves, dalindamiesi savo patirtimi [Microsoft Foundry Discord #Azure kanale](https://discord.gg/microsoft-azure).

---

**Skyrių navigacija:**
- **📚 Kurso pradžia**: [AZD Pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 2 skyrius - AI orientuotas kūrimas
- **⬅️ Ankstesnis**: [AI modelio diegimas](ai-model-deployment.md)
- **➡️ Kitas**: [Gamybinės AI gerosios praktikos](production-ai-practices.md)
- **🚀 Kitas skyrius**: [3 skyrius: Konfigūracija](../chapter-03-configuration/configuration.md)

Reikia pagalbos? Prisijunkite prie mūsų bendruomenės, kad gautumėte palaikymą ir dalyvautumėte diskusijose apie AZD ir AI diegimus.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatizuoti vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinės informacijos atveju rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->