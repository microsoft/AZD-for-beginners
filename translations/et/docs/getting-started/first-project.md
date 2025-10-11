<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "67ffbcceec008228c4d22c1b3585844c",
  "translation_date": "2025-10-11T16:09:38+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "et"
}
-->
# Teie esimene projekt - praktiline juhend

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire alustamine
- **⬅️ Eelmine**: [Paigaldamine ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-põhine arendus](../ai-foundry/azure-ai-foundry-integration.md)

## Sissejuhatus

Tere tulemast oma esimesse Azure Developer CLI projekti! See põhjalik praktiline juhend annab täieliku ülevaate, kuidas luua, juurutada ja hallata täisfunktsionaalset rakendust Azure'is, kasutades azd tööriista. Töötate reaalse todo-rakendusega, mis sisaldab Reacti esikülge, Node.js API tausta ja MongoDB andmebaasi.

## Õppimise eesmärgid

Selle juhendi läbimisega õpite:
- Valdama azd projekti initsialiseerimise töövoogu, kasutades malle
- Mõistma Azure Developer CLI projekti struktuuri ja konfiguratsioonifaile
- Teostama täielikku rakenduse juurutamist Azure'i koos infrastruktuuri loomisega
- Rakendama muudatusi ja uuesti juurutamise strateegiaid
- Halda mitut keskkonda arenduse ja testimise jaoks
- Rakendama ressursside puhastamise ja kulude haldamise praktikaid

## Õpitulemused

Pärast juhendi läbimist suudate:
- Iseseisvalt initsialiseerida ja konfigureerida azd projekte mallidest
- Tõhusalt navigeerida ja muuta azd projekti struktuure
- Juurutada täisfunktsionaalseid rakendusi Azure'i, kasutades üksikuid käske
- Lahendada levinud juurutamisprobleeme ja autentimisvigu
- Hallata mitut Azure'i keskkonda erinevate juurutamisetappide jaoks
- Rakendada pideva juurutamise töövooge rakenduse uuenduste jaoks

## Alustamine

### Eeltingimuste kontrollnimekiri
- ✅ Azure Developer CLI on paigaldatud ([Paigaldusjuhend](installation.md))
- ✅ Azure CLI on paigaldatud ja autentitud
- ✅ Git on teie süsteemis paigaldatud
- ✅ Node.js 16+ (selle juhendi jaoks)
- ✅ Visual Studio Code (soovitatav)

### Kontrollige oma seadistust
```bash
# Check azd installation
azd version
```
### Kontrollige Azure'i autentimist

```bash
az account show
```

### Kontrollige Node.js versiooni
```bash
node --version
```

## Samm 1: Valige ja initsialiseerige mall

Alustame populaarse todo-rakenduse malliga, mis sisaldab Reacti esikülge ja Node.js API tausta.

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

### Mis just juhtus?
- Laaditi mallikood alla teie kohalikku kausta
- Loodi `azure.yaml` fail teenuste määratlustega
- Seadistati infrastruktuuri kood kausta `infra/`
- Loodi keskkonna konfiguratsioon

## Samm 2: Uurige projekti struktuuri

Vaatame, mida azd meie jaoks lõi:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Te peaksite nägema:
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

### Olulised failid, mida mõista

**azure.yaml** - Teie azd projekti süda:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuuri määratlus:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Samm 3: Kohandage oma projekti (valikuline)

Enne juurutamist saate rakendust kohandada:

### Muutke esikülge
```bash
# Open the React app component
code src/web/src/App.tsx
```

Tehke lihtne muudatus:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigureerige keskkonnamuutujad
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Samm 4: Juurutage Azure'i

Nüüd kõige põnevam osa - juurutage kõik Azure'i!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Mis juurutamise ajal toimub?

Käsk `azd up` täidab järgmised sammud:
1. **Provision** (`azd provision`) - loob Azure'i ressursid
2. **Package** - koostab teie rakenduse koodi
3. **Deploy** (`azd deploy`) - juurutab koodi Azure'i ressurssidele

### Oodatav väljund
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Samm 5: Testige oma rakendust

### Juurdepääs rakendusele
Klõpsake juurutamise väljundis antud URL-il või leidke see igal ajal:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testige Todo rakendust
1. **Lisage todo-üksus** - klõpsake "Add Todo" ja sisestage ülesanne
2. **Märkige lõpetatuks** - märkige lõpetatud üksused
3. **Kustutage üksused** - eemaldage todo-d, mida te enam ei vaja

### Jälgige oma rakendust
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Samm 6: Tehke muudatusi ja juurutage uuesti

Teeme muudatuse ja vaatame, kui lihtne on uuendusi teha:

### Muutke API-d
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Lisage kohandatud vastuse päis:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Juurutage ainult koodimuudatused
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Samm 7: Halda mitut keskkonda

Looge testimiskeskkond, et testida muudatusi enne tootmisse viimist:

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

### Keskkondade võrdlus
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Samm 8: Puhastage ressursid

Kui olete katsetamise lõpetanud, puhastage ressursid, et vältida pidevaid kulusid:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Mida olete õppinud

Palju õnne! Olete edukalt:
- Initsialiseerinud azd projekti mallist
- Uurinud projekti struktuuri ja olulisi faile
- Juurutanud täisfunktsionaalse rakenduse Azure'i
- Teinud koodimuudatusi ja juurutanud uuesti
- Hallanud mitut keskkonda
- Puhastanud ressursid

## Levinud probleemide tõrkeotsing

### Autentimisvead
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Juurutamisvead
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Ressursinimede konfliktid
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Pordi/võrgu probleemid
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Järgmised sammud

Nüüd, kui olete oma esimese projekti lõpetanud, uurige neid edasijõudnute teemasid:

### 1. Kohandage infrastruktuuri
- [Infrastruktuur kui kood](../deployment/provisioning.md)
- [Lisage andmebaase, salvestusruumi ja muid teenuseid](../deployment/provisioning.md#adding-services)

### 2. Seadistage CI/CD
- [GitHub Actions integratsioon](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Tootmise parimad tavad
- [Turvaseaded](../deployment/best-practices.md#security)
- [Jõudluse optimeerimine](../deployment/best-practices.md#performance)
- [Jälgimine ja logimine](../deployment/best-practices.md#monitoring)

### 4. Uurige rohkem malle
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

## Täiendavad ressursid

### Õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuuri keskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektitud raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

### Kogukond ja tugi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure arendajate kogukond](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid ja näited
- [Ametlik malligalerii](https://azure.github.io/awesome-azd/)
- [Kogukonna mallid](https://github.com/Azure-Samples/azd-templates)
- [Ettevõtte mustrid](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Palju õnne oma esimese azd projekti lõpetamise puhul!** Olete nüüd valmis enesekindlalt looma ja juurutama hämmastavaid rakendusi Azure'is.

---

**Peatüki navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: Peatükk 1 - Alused ja kiire alustamine
- **⬅️ Eelmine**: [Paigaldamine ja seadistamine](installation.md)
- **➡️ Järgmine**: [Konfiguratsioon](configuration.md)
- **🚀 Järgmine peatükk**: [Peatükk 2: AI-põhine arendus](../ai-foundry/azure-ai-foundry-integration.md)
- **Järgmine õppetund**: [Juurutamise juhend](../deployment/deployment-guide.md)

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.