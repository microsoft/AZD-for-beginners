<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T22:56:09+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "lt"
}
-->
# Jūsų pirmasis projektas - praktinis vadovas

**Ankstesnis:** [Konfigūracija](configuration.md) | **Kitas:** [Azure AI Foundry integracija](../ai-foundry/azure-ai-foundry-integration.md)

## Įvadas

Sveiki atvykę į savo pirmąjį Azure Developer CLI projektą! Šis išsamus praktinis vadovas suteiks jums pilną apžvalgą, kaip sukurti, diegti ir valdyti pilnos apimties aplikaciją Azure platformoje naudojant azd. Jūs dirbsite su realia užduočių aplikacija, kuri apima React frontendą, Node.js API backendą ir MongoDB duomenų bazę.

## Mokymosi tikslai

Baigę šį vadovą, jūs:
- Įvaldysite azd projekto inicijavimo procesą naudojant šablonus
- Suprasite Azure Developer CLI projekto struktūrą ir konfigūracijos failus
- Vykdysite pilną aplikacijos diegimą Azure kartu su infrastruktūros paruošimu
- Įgyvendinsite aplikacijos atnaujinimo ir pakartotinio diegimo strategijas
- Valdysite kelias aplinkas, skirtas vystymui ir testavimui
- Taikysite resursų valymo ir kaštų valdymo praktikas

## Mokymosi rezultatai

Baigę šį vadovą, jūs galėsite:
- Savarankiškai inicijuoti ir konfigūruoti azd projektus iš šablonų
- Efektyviai naršyti ir modifikuoti azd projekto struktūras
- Diegti pilnos apimties aplikacijas Azure naudojant vieną komandą
- Spręsti dažniausiai pasitaikančias diegimo ir autentifikacijos problemas
- Valdyti kelias Azure aplinkas skirtingiems diegimo etapams
- Įgyvendinti nuolatinio diegimo procesus aplikacijos atnaujinimams

## Pradžia

### Būtini reikalavimai
- ✅ Įdiegta Azure Developer CLI ([Diegimo vadovas](installation.md))
- ✅ Įdiegta ir autentifikuota Azure CLI
- ✅ Įdiegta Git jūsų sistemoje
- ✅ Node.js 16+ (reikalinga šiam vadovui)
- ✅ Visual Studio Code (rekomenduojama)

### Patikrinkite savo nustatymus
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

## 1 žingsnis: Pasirinkite ir inicijuokite šabloną

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

### Kas ką tik įvyko?
- Šablono kodas buvo atsisiųstas į jūsų vietinį katalogą
- Sukurtas `azure.yaml` failas su paslaugų apibrėžimais
- Nustatytas infrastruktūros kodas kataloge `infra/`
- Sukurta aplinkos konfigūracija

## 2 žingsnis: Ištyrinėkite projekto struktūrą

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

### Svarbiausi failai, kuriuos reikia suprasti

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

## 3 žingsnis: Pritaikykite savo projektą (pasirinktinai)

Prieš diegdami, galite pritaikyti aplikaciją:

### Modifikuokite frontendą
```bash
# Open the React app component
code src/web/src/App.tsx
```

Padarykite paprastą pakeitimą:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigūruokite aplinkos kintamuosius
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## 4 žingsnis: Diegimas į Azure

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

### Kas vyksta diegimo metu?

Komanda `azd up` atlieka šiuos veiksmus:
1. **Provision** (`azd provision`) - Sukuria Azure resursus
2. **Package** - Sukuria jūsų aplikacijos kodą
3. **Deploy** (`azd deploy`) - Diegia kodą į Azure resursus

### Tikėtinas rezultatas
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## 5 žingsnis: Testuokite savo aplikaciją

### Pasiekite savo aplikaciją
Spustelėkite URL, pateiktą diegimo rezultatuose, arba pasiekite jį bet kada:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testuokite užduočių aplikaciją
1. **Pridėkite užduotį** - Spustelėkite „Add Todo“ ir įveskite užduotį
2. **Pažymėkite kaip atliktą** - Pažymėkite atliktas užduotis
3. **Ištrinkite užduotis** - Pašalinkite nereikalingas užduotis

### Stebėkite savo aplikaciją
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## 6 žingsnis: Atlikite pakeitimus ir pakartotinai diekite

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

### Diekite tik kodo pakeitimus
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## 7 žingsnis: Valdykite kelias aplinkas

Sukurkite testavimo aplinką, kad galėtumėte išbandyti pakeitimus prieš diegimą į produkciją:

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

## 8 žingsnis: Išvalykite resursus

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

## Ką išmokote

Sveikiname! Jūs sėkmingai:
- Inicijavote azd projektą iš šablono
- Ištyrinėjote projekto struktūrą ir svarbiausius failus
- Įdiegėte pilnos apimties aplikaciją į Azure
- Atlikote kodo pakeitimus ir pakartotinai diegėte
- Valdėte kelias aplinkas
- Išvalėte resursus

## Dažniausiai pasitaikančių problemų sprendimas

### Autentifikacijos klaidos
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Diegimo nesėkmės
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resursų pavadinimų konfliktai
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Prievado/tinklo problemos
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Kiti žingsniai

Dabar, kai baigėte savo pirmąjį projektą, išbandykite šias pažangias temas:

### 1. Pritaikykite infrastruktūrą
- [Infrastruktūra kaip kodas](../deployment/provisioning.md)
- [Pridėkite duomenų bazes, saugyklas ir kitas paslaugas](../deployment/provisioning.md#adding-services)

### 2. Nustatykite CI/CD
- [GitHub Actions integracija](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Produkcijos geriausios praktikos
- [Saugumo konfigūracijos](../deployment/best-practices.md#security)
- [Našumo optimizavimas](../deployment/best-practices.md#performance)
- [Stebėjimas ir žurnalai](../deployment/best-practices.md#monitoring)

### 4. Išbandykite daugiau šablonų
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

## Papildomi ištekliai

### Mokymosi medžiaga
- [Azure Developer CLI dokumentacija](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure gerai suprojektuotos sistemos principai](https://learn.microsoft.com/en-us/azure/well-architected/)

### Bendruomenė ir palaikymas
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer bendruomenė](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Šablonai ir pavyzdžiai
- [Oficiali šablonų galerija](https://azure.github.io/awesome-azd/)
- [Bendruomenės šablonai](https://github.com/Azure-Samples/azd-templates)
- [Įmonių modeliai](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Sveikiname baigus savo pirmąjį azd projektą!** Dabar esate pasiruošę kurti ir diegti nuostabias aplikacijas Azure platformoje su pasitikėjimu.

---

**Ankstesnis:** [Konfigūracija](configuration.md) | **Kitas:** [Azure AI Foundry integracija](../ai-foundry/azure-ai-foundry-integration.md)
- **Kita pamoka**: [Diegimo vadovas](../deployment/deployment-guide.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant AI vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama profesionali žmogaus vertimo paslauga. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus interpretavimus, atsiradusius naudojant šį vertimą.