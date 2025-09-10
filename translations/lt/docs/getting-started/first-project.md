<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:46:23+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "lt"
}
-->
# Jūsų Pirmasis Projektas - Praktinis Vadovas

## Įvadas

Sveiki atvykę į savo pirmąjį Azure Developer CLI projektą! Šis išsamus praktinis vadovas suteiks jums pilną apžvalgą, kaip sukurti, diegti ir valdyti pilno funkcionalumo aplikaciją Azure naudojant azd. Jūs dirbsite su tikra užduočių aplikacija, kuri apima React frontendą, Node.js API backendą ir MongoDB duomenų bazę.

## Mokymosi Tikslai

Baigę šį vadovą, jūs:
- Įvaldysite azd projekto inicijavimo procesą naudojant šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus
- Vykdysite pilną aplikacijos diegimą į Azure su infrastruktūros paruošimu
- Įgyvendinsite aplikacijos atnaujinimo ir pakartotinio diegimo strategijas
- Valdysite kelias aplinkas vystymui ir testavimui
- Taikysite resursų valymo ir kaštų valdymo praktikas

## Mokymosi Rezultatai

Baigę vadovą, jūs galėsite:
- Savarankiškai inicijuoti ir konfigūruoti azd projektus iš šablonų
- Efektyviai naršyti ir modifikuoti azd projekto struktūras
- Diegti pilno funkcionalumo aplikacijas į Azure naudojant vieną komandą
- Spręsti dažniausiai pasitaikančias diegimo ir autentifikacijos problemas
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams
- Įgyvendinti nuolatinio diegimo procesus aplikacijos atnaujinimams

## Pradžia

### Būtini Reikalavimai
- ✅ Įdiegta Azure Developer CLI ([Diegimo Vadovas](installation.md))
- ✅ Įdiegta ir autentifikuota Azure CLI
- ✅ Įdiegta Git jūsų sistemoje
- ✅ Node.js 16+ (reikalinga šiam vadovui)
- ✅ Visual Studio Code (rekomenduojama)

### Patikrinkite Savo Nustatymus
```bash
# Check azd installation
azd version
```
### Patikrinkite Azure autentifikaciją

```bash
az account show
```

### Patikrinkite Node.js versiją
```bash
node --version
```

## 1 Žingsnis: Pasirinkite ir Inicijuokite Šabloną

Pradėkime nuo populiaraus užduočių aplikacijos šablono, kuris apima React frontendą ir Node.js API backendą.

```bash
# Browse available templates
azd template list

# Initialize the todo app template
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Follow the prompts:
# - Enter an environment name: "dev"
# - Choose a subscription (if you have multiple)
# - Choose a region: "East US 2" (or your preferred region)
```

### Kas Įvyko?
- Šablono kodas buvo atsisiųstas į jūsų vietinį katalogą
- Sukurtas `azure.yaml` failas su paslaugų apibrėžimais
- Nustatytas infrastruktūros kodas kataloge `infra/`
- Sukurta aplinkos konfigūracija

## 2 Žingsnis: Ištyrinėkite Projekto Struktūrą

Pažiūrėkime, ką azd sukūrė:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Turėtumėte matyti:
```
my-first-azd-app/
├── .azd/
│   └── config.json              # Project configuration
├── .azure/
│   └── dev/                     # Environment-specific files
├── .devcontainer/               # Development container config
├── .github/workflows/           # GitHub Actions CI/CD
├── .vscode/                     # VS Code settings
├── infra/                       # Infrastructure as code (Bicep)
│   ├── main.bicep              # Main infrastructure template
│   ├── main.parameters.json     # Parameters for deployment
│   └── modules/                # Reusable infrastructure modules
├── src/
│   ├── api/                    # Node.js backend API
│   │   ├── src/               # API source code
│   │   ├── package.json       # Node.js dependencies
│   │   └── Dockerfile         # Container configuration
│   └── web/                   # React frontend
│       ├── src/               # React source code
│       ├── package.json       # React dependencies
│       └── Dockerfile         # Container configuration
├── azure.yaml                  # azd project configuration
└── README.md                   # Project documentation
```

### Pagrindiniai Failai, Kuriuos Reikia Suprasti

**azure.yaml** - Jūsų azd projekto pagrindas:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastruktūros apibrėžimas:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## 3 Žingsnis: Pritaikykite Savo Projektą (Pasirinktinai)

Prieš diegiant, galite pritaikyti aplikaciją:

### Modifikuokite Frontendą
```bash
# Open the React app component
code src/web/src/App.tsx
```

Padarykite paprastą pakeitimą:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigūruokite Aplinkos Kintamuosius
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 4 Žingsnis: Diegimas į Azure

Dabar pats įdomiausias momentas - viską diegiame į Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Kas Vyksta Diegimo Metu?

Komanda `azd up` atlieka šiuos veiksmus:
1. **Paruošimas** (`azd provision`) - Sukuria Azure resursus
2. **Pakavimas** - Sukuria jūsų aplikacijos kodą
3. **Diegimas** (`azd deploy`) - Diegia kodą į Azure resursus

### Tikėtinas Rezultatas
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5 Žingsnis: Testuokite Savo Aplikaciją

### Pasiekite Savo Aplikaciją
Spustelėkite URL, pateiktą diegimo rezultatuose, arba pasiekite jį bet kada:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testuokite Užduočių Aplikaciją
1. **Pridėkite užduotį** - Spustelėkite "Add Todo" ir įveskite užduotį
2. **Pažymėkite kaip atliktą** - Pažymėkite atliktas užduotis
3. **Ištrinkite užduotis** - Pašalinkite nereikalingas užduotis

### Stebėkite Savo Aplikaciją
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 6 Žingsnis: Darykite Pakeitimus ir Pakartotinai Diekite

Padarykime pakeitimą ir pažiūrėkime, kaip lengva atnaujinti:

### Modifikuokite API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Pridėkite pasirinktą atsakymo antraštę:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Diekite Tik Kodo Pakeitimus
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7 Žingsnis: Valdykite Kelias Aplinkas

Sukurkite testavimo aplinką, kad patikrintumėte pakeitimus prieš gamybą:

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

### Aplinkų Palyginimas
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## 8 Žingsnis: Išvalykite Resursus

Kai baigsite eksperimentuoti, išvalykite resursus, kad išvengtumėte papildomų išlaidų:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Ką Išmokote

Sveikiname! Jūs sėkmingai:
- Inicijavote azd projektą iš šablono
- Ištyrinėjote projekto struktūrą ir pagrindinius failus
- Diegėte pilno funkcionalumo aplikaciją į Azure
- Padarėte kodo pakeitimus ir pakartotinai diegėte
- Valdėte kelias aplinkas
- Išvalėte resursus

## Dažniausiai Pasitaikančių Problemų Sprendimas

### Autentifikacijos Klaidos
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Diegimo Nesėkmės
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resursų Pavadinimų Konfliktai
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Prievado/Tinklo Problemos
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kiti Žingsniai

Dabar, kai baigėte savo pirmąjį projektą, išbandykite šias pažangias temas:

### 1. Pritaikykite Infrastruktūrą
- [Infrastruktūra kaip Kodas](../deployment/provisioning.md)
- [Pridėkite duomenų bazes, saugyklas ir kitas paslaugas](../deployment/provisioning.md#adding-services)

### 2. Nustatykite CI/CD
- [GitHub Actions Integracija](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Gamybos Geriausios Praktikos
- [Saugumo konfigūracijos](../deployment/best-practices.md#security)
- [Našumo optimizavimas](../deployment/best-practices.md#performance)
- [Stebėjimas ir žurnalai](../deployment/best-practices.md#monitoring)

### 4. Išbandykite Daugiau Šablonų
```bash
# Browse templates by category
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Try different technology stacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Papildomi Ištekliai

### Mokymosi Medžiaga
- [Azure Developer CLI Dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architektūros Centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Gerai Suplanuotos Architektūros Sistema](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir Pagalba
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Bendruomenė](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir Pavyzdžiai
- [Oficiali Šablonų Galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės Šablonai](https://github.com/Azure-Samples/azd-templates)
- [Įmonių Modeliai](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname baigus savo pirmąjį azd projektą!** Dabar esate pasiruošę kurti ir diegti nuostabias aplikacijas Azure su pasitikėjimu.

---

**Navigacija**
- **Ankstesnė Pamoka**: [Konfigūracija](configuration.md)
- **Kita Pamoka**: [Diegimo Vadovas](../deployment/deployment-guide.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipiame dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudotis profesionalių vertėjų paslaugomis. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.