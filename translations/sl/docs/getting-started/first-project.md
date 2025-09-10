<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:42:16+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sl"
}
-->
# Vaš prvi projekt - Praktični vodič

## Uvod

Dobrodošli v vašem prvem projektu z Azure Developer CLI! Ta obsežen praktični vodič vas bo korak za korakom popeljal skozi ustvarjanje, uvajanje in upravljanje celovite aplikacije na Azure z uporabo azd. Delali boste s pravo aplikacijo za upravljanje opravil, ki vključuje React frontend, Node.js API backend in MongoDB bazo podatkov.

## Cilji učenja

Z dokončanjem tega vodiča boste:
- Obvladali postopek inicializacije projekta azd z uporabo predlog
- Razumeli strukturo projektov in konfiguracijskih datotek Azure Developer CLI
- Izvedli popolno uvajanje aplikacije na Azure z zagotavljanjem infrastrukture
- Izvedli posodobitve aplikacije in strategije ponovnega uvajanja
- Upravljali več okolij za razvoj in testiranje
- Uporabili prakse čiščenja virov in upravljanja stroškov

## Rezultati učenja

Po zaključku boste sposobni:
- Samostojno inicializirati in konfigurirati azd projekte iz predlog
- Učinkovito navigirati in spreminjati strukture projektov azd
- Uvajati celovite aplikacije na Azure z enostavnimi ukazi
- Odpravljati pogoste težave pri uvajanju in avtentikaciji
- Upravljati več Azure okolij za različne faze uvajanja
- Implementirati delovne tokove za neprekinjeno uvajanje posodobitev aplikacij

## Začetek

### Kontrolni seznam predpogojev
- ✅ Nameščen Azure Developer CLI ([Navodila za namestitev](installation.md))
- ✅ Nameščen in avtenticiran Azure CLI
- ✅ Nameščen Git na vašem sistemu
- ✅ Nameščen Node.js 16+ (za ta vodič)
- ✅ Priporočeno: Visual Studio Code

### Preverite svojo nastavitev
```bash
# Check azd installation
azd version
```
### Preverite avtentikacijo na Azure

```bash
az account show
```

### Preverite različico Node.js
```bash
node --version
```

## Korak 1: Izberite in inicializirajte predlogo

Začnimo s priljubljeno predlogo aplikacije za upravljanje opravil, ki vključuje React frontend in Node.js API backend.

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

### Kaj se je pravkar zgodilo?
- Prenesli ste kodo predloge v lokalni imenik
- Ustvarili ste datoteko `azure.yaml` z definicijami storitev
- Nastavili ste kodo infrastrukture v imeniku `infra/`
- Ustvarili ste konfiguracijo okolja

## Korak 2: Raziščite strukturo projekta

Poglejmo, kaj je azd ustvaril za nas:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Videti bi morali:
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

### Ključne datoteke za razumevanje

**azure.yaml** - Srce vašega azd projekta:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definicija infrastrukture:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Korak 3: Prilagodite svoj projekt (neobvezno)

Pred uvajanjem lahko prilagodite aplikacijo:

### Spremenite frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Naredite preprosto spremembo:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurirajte okoljske spremenljivke
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Korak 4: Uvedite na Azure

Zdaj pa k razburljivemu delu - vse uvedite na Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Kaj se dogaja med uvajanjem?

Ukaz `azd up` izvede naslednje korake:
1. **Zagotavljanje** (`azd provision`) - Ustvari Azure vire
2. **Pakiranje** - Zgradi kodo vaše aplikacije
3. **Uvajanje** (`azd deploy`) - Uvede kodo na Azure vire

### Pričakovani izhod
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Korak 5: Preizkusite svojo aplikacijo

### Dostopajte do svoje aplikacije
Kliknite na URL, ki je naveden v izhodu uvajanja, ali ga pridobite kadar koli:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Preizkusite aplikacijo za upravljanje opravil
1. **Dodajte opravilo** - Kliknite "Add Todo" in vnesite nalogo
2. **Označite kot dokončano** - Označite dokončane naloge
3. **Izbrišite naloge** - Odstranite opravila, ki jih ne potrebujete več

### Spremljajte svojo aplikacijo
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Korak 6: Naredite spremembe in ponovno uvedite

Naredimo spremembo in preverimo, kako enostavno je posodobiti:

### Spremenite API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Dodajte prilagojeno glavo odgovora:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Uvedite samo spremembe kode
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Korak 7: Upravljajte več okolij

Ustvarite testno okolje za preverjanje sprememb pred produkcijo:

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

### Primerjava okolij
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Korak 8: Počistite vire

Ko končate z eksperimentiranjem, počistite vire, da se izognete tekočim stroškom:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Kaj ste se naučili

Čestitamo! Uspešno ste:
- Inicializirali azd projekt iz predloge
- Raziskali strukturo projekta in ključne datoteke
- Uvedli celovito aplikacijo na Azure
- Naredili spremembe kode in ponovno uvedli
- Upravljali več okolij
- Počistili vire

## Odpravljanje pogostih težav

### Napake pri avtentikaciji
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Napake pri uvajanju
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Konflikti imen virov
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Težave s pristanišči/omrežjem
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Naslednji koraki

Zdaj, ko ste zaključili svoj prvi projekt, raziščite te napredne teme:

### 1. Prilagodite infrastrukturo
- [Infrastruktura kot koda](../deployment/provisioning.md)
- [Dodajanje baz podatkov, shranjevanja in drugih storitev](../deployment/provisioning.md#adding-services)

### 2. Nastavite CI/CD
- [Integracija z GitHub Actions](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Najboljše prakse za produkcijo
- [Varnostne konfiguracije](../deployment/best-practices.md#security)
- [Optimizacija zmogljivosti](../deployment/best-practices.md#performance)
- [Spremljanje in beleženje](../deployment/best-practices.md#monitoring)

### 4. Raziščite več predlog
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

## Dodatni viri

### Učna gradiva
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Skupnost in podpora
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Predloge in primeri
- [Uradna galerija predlog](https://azure.github.io/awesome-azd/)
- [Predloge skupnosti](https://github.com/Azure-Samples/azd-templates)
- [Vzorci za podjetja](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Čestitamo za dokončanje vašega prvega azd projekta!** Zdaj ste pripravljeni na gradnjo in uvajanje izjemnih aplikacij na Azure z zaupanjem.

---

**Navigacija**
- **Prejšnja lekcija**: [Konfiguracija](configuration.md)
- **Naslednja lekcija**: [Vodič za uvajanje](../deployment/deployment-guide.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.