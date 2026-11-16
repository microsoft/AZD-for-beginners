# Jūsų pirmasis projektas – praktinis vadovas

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius – Pagrindai ir greitas pradėjimas
- **⬅️ Ankstesnis**: [Įdiegimas ir nustatymai](installation.md)
- **➡️ Tolimesnis**: [Pristatykite savo programėlę](bring-your-own-app.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI pirmumo kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Įvadas

Sveiki atvykę į savo pirmąjį Azure Developer CLI projektą! Diegsite todo programą su React vartotojo sąsaja, Node.js API ir Azure Cosmos DB. Šablonas išlaiko istorinį pavadinimą `todo-nodejs-mongo`; dabartinė infrastruktūra naudoja Cosmos DB NoSQL, todėl peržiūrėkite atsisiųstą README ir `infra/` vietoje to, kad spėliotumėte apie duomenų bazės API pagal pavadinimą.

> Peržiūrėta pagal `azd 1.37.2` ir viešąjį šabloną 2026 m. lapkritį. Toliau pateikti pavyzdžiai naudoja Bash; JSON išvedimui taip pat reikalingas `jq`. Azure diegimai sukelia išlaidas ir šio peržiūros metu nebuvo vykdyti.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Išmoksite inicializuoti azd projektus naudodami šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus
- Atliksite pilną programos diegimą į Azure su infrastruktūros pateikimu
- Įgyvendinsite programos atnaujinimo ir perdiegimo metodikas
- Tvarkysite kelias aplinkas kūrimui ir testavimui
- Naudosite išteklių valymo ir sąnaudų valdymo praktikas

## Išmoktos kompetencijos

Baigę mokymą, galėsite:
- Nepriklausomai inicializuoti ir konfiguruti azd projektus iš šablonų
- Efektyviai naršyti ir keisti azd projekto struktūras
- Diegti pilnos pakopos programas į Azure vienu komandų rinkiniu
- Spręsti dažniausias diegimo problemas ir autentifikacijos trikdžius
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams
- Įgyvendinti nuolatinio diegimo procesus programos atnaujinimams

## Pradžia

### Reikalingi komponentai
- ✅ Įdiegtas Azure Developer CLI ([Įdiegimo vadovas](installation.md))
- ✅ Baigta AZD autentifikacija su `azd auth login`
- ✅ Git įdiegtas jūsų sistemoje
- ✅ Node.js 22 LTS (arba pagal atsisiųsto šablono reikalavimus)
- ✅ Visual Studio Code (rekomenduojama)

Prieš tęsdami, paleiskite nustatymo tikrintuvą iš saugyklos šaknies:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Patikrinkite savo aplinką
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Patikrinkite pasirenkamą Azure CLI autentifikaciją

```bash
az account show
```

### Patikrinkite Node.js versiją
```bash
node --version
```

## 1 žingsnis: Pasirinkite ir inicializuokite šabloną

Pradėkime nuo populiaraus todo programos šablono su React frontendu ir Node.js API back-end'u.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo .

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Kas ką tik įvyko?
- Atsisiuntėte šablono kodą į savo vietinį katalogą
- Sukūrėte `azure.yaml` failą su paslaugų apibrėžimais
- Paruošėte infrastruktūros kodą `infra/` kataloge
- Sukūrėte aplinkos konfigūraciją

## 2 žingsnis: Apžvelkite projekto struktūrą

Pažiūrėkime, ką azd mums sukūrė:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Turėtumėte matyti:
```
my-first-azd-app/
├── .azure/
│   ├── config.json              # Selected local environment
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── app/                    # Application infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   └── package.json       # Node.js dependencies
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       └── package.json       # React dependencies
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Svarbūs failai suprasti

**azure.yaml** – Jūsų azd projekto širdis:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** – Infrastruktūros aprašymas:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 3 žingsnis: Pasirinkite savo projekto konfigūraciją (pasirinktinai)

Prieš diegiant, galite pritaikyti programą:

### Keiskite front-end dalį
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Atlikite paprastą pakeitimą:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigūruokite aplinkos kintamuosius
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Šie du pritaikyti kintamieji rodo tik vietinę saugyklą. Šablonas nevartoja `WEBSITE_TITLE` ar `API_VERSION`, todėl jie nekeičia programos. Aukščiau pateiktas tiesioginis šaltinio redagavimas keičia rodomą pavadinimą.

## 4 žingsnis: Diegimas į Azure

O dabar įdomioji dalis – įdiekite viską į Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Kas vyksta diegimo metu?

Procesas paruošia infrastruktūrą ir paketuose siunčia/kodą įdiegia. Tiksli eilės tvarka gali būti pritaikyta per `workflows.up` faile `azure.yaml`; šis šablonas nurodo pirmiau paruošti, tada diegti. Nesitikėkite vienodos tvarkos kiekvienam šablonui.

### Numatyta išvestis
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5 žingsnis: Išbandykite programą

### Prieiga prie programos
Spustelėkite URL, pateiktą diegimo išvestyje, arba įsigykite jį bet kada:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Išbandykite todo programą
1. **Pridėkite užduotį** – spustelėkite „Add Todo“ ir įveskite užduotį
2. **Pažymėkite kaip atliktą** – pažymėkite įvykdytas užduotis
3. **Ištrinkite užduotis** – pašalinkite nebereikalingas

### Stebėkite savo programą
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Patikrinkite diegimą

Prieš tęsdami, peržiūrėkite šį greitą sąrašą, kad įsitikintumėte, jog viskas tikrai veikia – nepriimkite „diegiama sėkmingai“ kaip „programa veikia“:

```bash
# 1. Confirm the endpoint exists and is reachable
azd show

# 2. Smoke-test the endpoint (expects HTTP 200)
WEB_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
curl --fail --show-error --location "$WEB_URL"

# 3. Test the API's actual list route (the template has no /health route)
API_URL=$(azd show --output json | jq -er '.services.api.ingressUrl')
curl --fail --show-error "$API_URL/lists"
```

**Diegimas patvirtinamas, kai:**
- ✅ `azd show` išveda pasiekiamo galinio taško URL
- ✅ URL atsidaro naršyklėje be klaidų
- ✅ Pagrindinės funkcijos veikia (pridėti/užbaigti/ištrinti todo)
- ✅ `azd monitor --logs` rodo atvykstančius užklausimus be nenumatytų klaidų

Jei kuris nors punktas nepavyksta, pereikite prie [7 skyriaus: trikčių šalinimas](../chapter-07-troubleshooting/README.md).

## 6 žingsnis: Darykite pakeitimus ir perdiekite

Padarykime pakeitimą ir pažiūrėkime, kaip paprasta atnaujinti:

### Modifikuokite API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Pridėkite pasirinktą atsakymo antraštę:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Diegkite tik kodo pakeitimus
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7 žingsnis: Tvarkykite kelias aplinkas

Sukurkite testavimo aplinką pakeitimams bandyti prieš gamybą:

```bash
# Create a new staging environment
azd env new staging

# Deploy to staging
azd up

# Switch back to dev environment
azd env select dev

# List all environments
azd env list
```

### Aplinkų palyginimas
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 8 žingsnis: Išvalykite išteklius

Kai baigsite eksperimentuoti, išvalykite, kad išvengtumėte nuolatinių mokesčių:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klasikinė programa prieš AI valdomą programą: ta pati eiga

Jūs ką tik įdiegėte tradicinę internetinę programą. O jei norėtumėte įdiegti AI valdomą programą, pavyzdžiui, pokalbių programą, paremta Microsoft Foundry modeliais?

Gera naujiena: **veikimo eiga identiška.**

| Žingsnis | Klasikinė Todo programa | AI pokalbių programa |
|------|-----------------|-------------|
| Inicializuoti (tuščias katalogas) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentifikuotis | `azd auth login` | `azd auth login` |
| Diegti | `azd up` | `azd up` |
| Stebėti | `azd monitor` | `azd monitor` |
| Išvalyti | `azd down --force --purge` | `azd down --force --purge` |

Komandos vykdymas tas pats, bet priešpriešos skiriasi. AI šablonas gali reikalauti modelio prieigos, regioninių kvotų, duomenų įvedimo ir papildomos konfigūracijos. Prieš diegiant perskaitykite README; `azd up` negali suteikti trūkstamų leidimų ar kvotų.

Tai azd pagrindinė esmė: **viena eiga, bet koks darbo krūvis.** Įgūdžiai, kuriuos praktikavote šiame vadove – inicializavimas, diegimas, stebėjimas, perdiegimas ir išteklių valymas – taikomi tiek AI programoms, tiek agentams.

---

## Ko išmokote

Sveikiname! Jūs sėkmingai:
- ✅ Inicializavote azd projektą iš šablono
- ✅ Išnagrinėjote projekto struktūrą ir svarbius failus
- ✅ Įdiegėte pilnos pakopos programą Azure
- ✅ Atlikote kodo pakeitimus ir perdiegėte
- ✅ Tvarkėte kelias aplinkas
- ✅ Išvalėte išteklius

## 🎯 Įgūdžių vertinimo pratimai

### 1 pratimas: Įdiekite kitą šabloną (15 minučių)
**Tikslas**: parodyti, kad mokate naudoti azd init ir diegimo eigą

```bash
# Try Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo .
azd up

# Verify deployment
azd show
curl --fail "$(azd show --output json | jq -er '.services.web.ingressUrl')"

# Clean up
azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Programa diegiama be klaidų
- [ ] Galima pasiekti programą per URL naršyklėje
- [ ] Programa veikia tinkamai (pridėti/pašalinti užduotis)
- [ ] Sėkmingai išvalyti visi ištekliai

### 2 pratimas: Konfigūracijos pritaikymas (20 minučių)
**Tikslas**: praktikuoti vietinių aplinkos reikšmių saugojimą be klaidžiojimo su vartojimu vykdymo metu

```bash
# Return to your original my-first-azd-app directory first

# Create custom environment
azd env new custom-config

# Set custom variables
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verify variables
azd env get-values | grep APP_TITLE

# Check one value exactly; expected: My Custom Todo App
azd env get-value APP_TITLE
```

**Sėkmės kriterijai:**
- [ ] Pritaikyta aplinka sukurta sėkmingai
- [ ] Aplinkos kintamieji nustatyti ir gaunami
- [ ] `azd env get-value APP_TITLE` išveda `My Custom Todo App`
- [ ] Geba paaiškinti, kodėl šios reikšmės nekeičia šabloninės programos, jei kodas/infrastruktūra jų nevartoja

### 3 pratimas: Daugialypės aplinkos eiga (25 minutės)
**Tikslas**: mokėti valdyti aplinkas ir diegimo strategijas

```bash
# Create dev environment
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Note dev URL
DEV_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Dev: $DEV_URL"

# Create staging environment
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Note staging URL
STAGING_URL=$(azd show --output json | jq -er '.services.web.ingressUrl')
echo "Staging: $STAGING_URL"

# Compare environments
azd env list

# Test both environments
curl --fail "$DEV_URL"
curl --fail "$STAGING_URL"

# Clean up both
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Sėkmės kriterijai:**
- [ ] Sukurtos dvi aplinkos su skirtinga konfigūracija
- [ ] Abi aplinkos sėkmingai įdiegta
- [ ] Gali keisti aplinkas naudojant `azd env select`
- [ ] Aplinkos kintamieji skiriasi tarp aplinkų
- [ ] Sėkmingai išvalytos abi aplinkos

## 📊 Jūsų pažanga

**Skirtas laikas**: ~60–90 minučių  
**Įgyti įgūdžiai**:
- ✅ Šabloninė projekto inicializacija
- ✅ Azure išteklių suteikimas
- ✅ Programos diegimo procesai
- ✅ Aplinkos valdymas
- ✅ Konfigūracijos valdymas
- ✅ Išteklių valymas ir išlaidų kontrolė

**Kitas žingsnis**: Esate pasiruošę [Konfigūracijos vadovas](../chapter-03-configuration/configuration.md) mokytis pažangių konfigūracijos modelių!

## Dažnos problemos ir jų sprendimas

### Autentifikacijos klaidos
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Diegimo nesėkmės
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Išteklių vardų konfliktai
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Prievado/tinklų problemos
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kiti žingsniai

Baigę pirmąjį projektą, tyrinėkite šias pažangias temas:

### 1. Pritaikykite infrastruktūrą
- [Infrastruktūra kaip kodas](../chapter-04-infrastructure/provisioning.md)
- [Pridėti duomenų bazės infrastruktūrą](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Įdiekite CI/CD
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) – visi CI/CD procesai
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) – Vamzdyno konfigūravimas

### 3. Gamybos geriausios praktikos
- [Diegimo vadovas](../chapter-04-infrastructure/deployment-guide.md) – saugumas, našumas ir stebėsena

### 4. Tyrinėkite kitus šablonus
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
# Choose ONE in a new empty directory, not all three in the same project
azd init --template todo-python-mongo .
# azd init --template todo-csharp-sql .
# azd init --template todo-java-mongo .
```

## Papildomi ištekliai

### Mokymosi medžiaga
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure gerosios architektūros sistema](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir palaikymas
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure programuotojų bendruomenė](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow – azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai
- [Oficialių šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės šablonų prisidėjimai](https://github.com/Azure/awesome-azd)
- [Todo šablono šaltinis](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Sveikiname baigus pirmą azd projektą!** Dabar galite drąsiai kurti ir diegti nuostabias programas Azure.

---

**Skyriaus navigacija:**
- **📚 Kurso pradžia**: [AZD pradedantiesiems](../../README.md)
- **📖 Dabartinis skyrius**: 1 skyrius – Pagrindai ir greitas pradėjimas
- **⬅️ Ankstesnis**: [Įdiegimas ir nustatymai](installation.md)
- **➡️ Tolimesnis**: [Pristatykite savo programėlę](bring-your-own-app.md)
- **🚀 Kitas skyrius**: [2 skyrius: AI pirmumo kūrimas](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->