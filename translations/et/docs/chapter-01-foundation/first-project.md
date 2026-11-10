# Teie esimene projekt - praktiline juhend

**Kavalehe navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: 1. peatükk - alused ja kiire käivitamine
- **⬅️ Eelmine**: [Installatsioon ja seadistus](installation.md)
- **➡️ Järgmine**: [Too oma rakendus](bring-your-own-app.md)
- **🚀 Järgmine peatükk**: [2. peatükk: tehisintellektile orienteeritud arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Sissejuhatus

Tere tulemast oma esimesse Azure Developer CLI projekti! Te juurutate todo-rakenduse Reacti esiplaaniga, Node.js API-ga ja Azure Cosmos DB-ga. Mall säilitab ajaloolise nime `todo-nodejs-mongo`; selle praegune infrastruktuur kasutab NoSQL-i jaoks Cosmos DB-d, seega vaadake alla laaditud README-d ja `infra/`, selle asemel et arvestada andmebaasi API-ga nime järgi.

> Kontrollitud vastu `azd 1.37.2` ja avalikku malli 2026. aasta novembris. Allolevad näited kasutavad Bash-i; JSON-i väljavõtmine nõuab ka `jq`. Azure juurutused võivad põhjustada kulusid ja neid ei teostatud selle ülevaate ajal.

## Õpieesmärgid

Selle juhendi lõpetamisega saate:
- Valdada azd projekti algatuse töövoogu mallide abil
- Mõista Azure Developer CLI projekti struktuuri ja konfiguratsioonifaile
- Täieliku rakenduse juurutamine Azure’isse koos infrastruktuuri loomisega
- Rakenduse uuenduste ja uuesti juurutamise strateegiate rakendamine
- Halda mitut keskkonda arenduseks ja etappideks
- Rakenduse ressursside koristamine ja kulude juhtimine

## Õpitulemused

Pärast lõpetamist oskate:
- Iseseisvalt algatada ja konfigureerida azd projekte mallidest
- Efektiivselt navigeerida ja muuta azd projektistruktuure
- Ühe käsuga juurutada täisvirna rakendusi Azure’isse
- Lahendada tavalisi juurutus- ja autentimisprobleeme
- Hallata mitut Azure keskkonda erinevate juurutusstaadiumite jaoks
- Rakendada pidevaid juurutuse töövooge rakendusuuenduste jaoks

## Alustamine

### Nõuete kontrollnimekiri
- ✅ Azure Developer CLI paigaldatud ([Installatsioonijuhend](installation.md))
- ✅ AZD autentimine tehtud `azd auth login` abil
- ✅ Git paigaldatud teie süsteemi
- ✅ Node.js 22 LTS (või alla laetud malli nõutud toetatud versioon)
- ✅ Visual Studio Code (soovituslik)

Enne jätkamist käivitage seadistuskontroll juurkataloogist:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Kontrolli oma seadistust
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Kontrolli valikulist Azure CLI autentimist

```bash
az account show
```

### Kontrolli Node.js versiooni
```bash
node --version
```

## Samm 1: Vali ja algata mall

Alustame populaarse todo-rakenduse malliga, mis sisaldab Reacti esiplaani ja Node.js API tagaplaani.

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

### Mis just juhtus?
- Alla laaditi mallikood teie kohalikku kataloogi
- Loodi `azure.yaml` fail teenuse määratlustega
- Seati üles infrastruktuurikood kataloogi `infra/`
- Loodi keskkonna konfiguratsioon

## Samm 2: Uuri projekti struktuuri

Vaatame, mida azd meile lõi:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Peaksite nägema:
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

### Peamised failid, mida mõista

**azure.yaml** - Sinu azd projekti süda:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastruktuuri määratlus:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Samm 3: Kohanda oma projekti (valikuline)

Enne juurutamist võid rakendust kohandada:

### Muuda esiplaani
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Tee lihtne muudatus:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Sea keskkonnamuutujad
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Need kaks kohandatud väärtust näitavad ainult kohalikku salvestust. Mall ei kasuta `WEBSITE_TITLE` ega `API_VERSION`, nii et need ei muuda rakendust. Selge allikamuudatus ülal muudab kuvatavat pealkirja.

## Samm 4: Juuruta Azure’isse

Nüüd põnev osa - juuruta kõik Azure’i!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Mis toimub juurutuse ajal?

Töövoog loob infrastruktuuri ja pakib/juurutab koodi. Täpne järjekord on kohandatav kaudu `workflows.up` failis `azure.yaml`; see mall täpsustab esmalt loomise ja seejärel juurutamise. Ära looda kõigi mallide universaalsele faasijärjestusele.

### Oodatav väljund
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Samm 5: Testi oma rakendust

### Juurdepääs rakendusele
Klikka juurutuse väljundis antud URL-il või saa see igal ajal:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testi todo-rakendust
1. **Lisa todo-üksus** - kliki "Add Todo" ja sisesta ülesanne
2. **Märgi lõpetatuks** - märgi lõpetatud üksused
3. **Kustuta üksused** - eemalda todo’d, mida enam ei vaja

### Jälgi oma rakendust
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Kinnita oma juurutus

Enne edasi liikumist tee kiire kontrollnimekiri, et veenduda kõiges töötab - ära eelda, et "juurutus õnnestus" tähendab "rakendus töötab":

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

**Juurutus on kontrollitud, kui:**
- ✅ `azd show` kuvab kättesaadava lõpp-punkti URL-i
- ✅ URL avaneb sinu brauseris ilma vigadeta
- ✅ Põhifunktsioonid töötavad (lisa/lõpeta/kustuta todo)
- ✅ `azd monitor --logs` näitab saabuvate päringute ilma ootamatute vigadeta

Kui mõni kontroll kukub läbi, liigu [7. peatüki: tõrkeotsingu](../chapter-07-troubleshooting/README.md) juurde.

## Samm 6: Tee muudatusi ja juuruta uuesti

Teeme muudatuse ja vaatame, kui lihtne seda uuendada on:

### Muuda API-t
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Lisa kohandatud vastuse päis:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Juuruta ainult koodimuudatused
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Samm 7: Halda mitut keskkonda

Loo testimiseks etappide keskkond enne tootmisse minekut:

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

## Samm 8: Puhasta ressursid

Kui eksperimenteerimine on tehtud, puhasta, et vältida pidevaid kulusid:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassikaline rakendus vs. tehisintellekti rakendus: sama töövoog

Sa just juurutasid traditsioonilise veebirakenduse. Aga mis siis, kui soovid juurutada tehisintellektil põhinevat rakendust - näiteks jututuba Microsoft Foundry mudelitega?

Hea uudis: **töövoog on identne.**

| Samm | Klassikaline todo-rakendus | Tehisintellekti juturobot |
|------|-----------------|-------------|
| Algus (tühi kataloog) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentimine | `azd auth login` | `azd auth login` |
| Juurutus | `azd up` | `azd up` |
| Jälgimine | `azd monitor` | `azd monitor` |
| Puhastamine | `azd down --force --purge` | `azd down --force --purge` |

Elutsükli käsud on samad, kuid eeltingimused erinevad. AI mall võib vajada mudeli ligipääsu, piirkondlikku kvota, andmete haaramist ja täiendavat konfigureerimist. Lugege selle README enne juurutamist; `azd up` ei saa tagada puuduvate õiguste ega kvota.

See on azd põhialus: **üks töövoog, kõik töökoormused.** Osavad oskused, mida selles juhendis harjutasid — algatamine, juurutamine, jälgimine, uuesti juurutamine ja koristamine — kehtivad võrdselt tehisintellekti rakendustele ja agentidele.

---

## Mida sa õppisid

Palju õnne! Sa oled edukalt:
- ✅ Algatanud azd projekti mallist
- ✅ Uurinud projekti struktuuri ja olulisi faile
- ✅ Juurutanud täisvirna rakenduse Azure’i
- ✅ Teinud koodimuudatusi ja uuesti juurutanud
- ✅ Halda mitut keskkonda
- ✅ Puhastanud ressursid

## 🎯 Osavuse valideerimise harjutused

### Harjutus 1: Juuruta teine mall (15 minutit)
**Eesmärk**: Demonstreerida valdamist azd init ja juurutuse töövoo osas

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

**Õnnestumise kriteeriumid:**
- [ ] Rakendus juurutub ilma vigadeta
- [ ] Saab ligi rakenduse URL-ile brauseris
- [ ] Rakendus töötab õigesti (lisa/eemalda todo’d)
- [ ] Kõik ressursid on edukalt puhastatud

### Harjutus 2: Kohanda konfiguratsiooni (20 minutit)
**Eesmärk**: Harjutada kohaliku keskkonna väärtuste salvestamist, mitte segi ajada seda jooksuaja konfiguratsiooniga

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

**Õnnestumise kriteeriumid:**
- [ ] Kohandatud keskkond loodud edukalt
- [ ] Keskkonnamuutujad seatud ja kättesaadavad
- [ ] `azd env get-value APP_TITLE` väljastab `My Custom Todo App`
- [ ] Osatakse selgitada, miks need väärtused ei muuda laos olevat rakendust, kui kood/infrastruktuur neid ei kasuta

### Harjutus 3: Mitme keskkonna töövoog (25 minutit)
**Eesmärk**: Valdada keskkonna haldamist ja juurutamisstrateegiaid

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

**Õnnestumise kriteeriumid:**
- [ ] Loodud kaks keskkonda erinevate konfiguratsioonidega
- [ ] Mõlemad keskkonnad on edukalt juurutatud
- [ ] Saab vahetada keskkondi kasutades `azd env select`
- [ ] Keskkonnamuutujad erinevad keskkondade vahel
- [ ] Mõlemad keskkonnad on edukalt puhastatud

## 📊 Teie edusammud

**Aeg kulutatud**: ~60-90 minutit  
**Omandatud oskused**:
- ✅ Mallipõhine projekti algatus
- ✅ Azure ressursside loomine
- ✅ Rakenduse juurutuse töövood
- ✅ Keskkondade haldus
- ✅ Konfiguratsiooni haldus
- ✅ Ressursside koristus ja kulude juhtimine

**Järgmine tase**: Oled valmis [Konfiguratsioonijuhendi](../chapter-03-configuration/configuration.md) õppimiseks, et avastada edasijõudnud konfiguratsioonimustreid!

## Tavapäraste vigade tõrkeotsing

### Autentimisvead
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Juurutuse ebaõnnestumised
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressursi nime konfliktid
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

Nüüd, kui olete oma esimese projekti lõpetanud, uurige neid täiendavaid teemasid:

### 1. Kohanda infrastruktuuri
- [Infrastruktuur kui kood](../chapter-04-infrastructure/provisioning.md)
- [Lisa andmebaasi infrastruktuur](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Sea üles CI/CD
- [Juurutamisjuhend](../chapter-04-infrastructure/deployment-guide.md) - Täielikud CI/CD töövood
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Torujuhtme konfiguratsioon

### 3. Tootmise parimad tavad
- [Juurutamisjuhend](../chapter-04-infrastructure/deployment-guide.md) - Turvalisus, jõudlus ja jälgimine

### 4. Uuri rohkem malle
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

## Täiendavad ressursid

### Õppematerjalid
- [Azure Developer CLI dokumentatsioon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure hästi arhitektuuritud raamistik](https://learn.microsoft.com/en-us/azure/well-architected/)

### Kogukond ja tugi
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure arendajate kogukond](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallid ja näited
- [Ametlik mallide galerii](https://azure.github.io/awesome-azd/)
- [Kogukonna mallide panused](https://github.com/Azure/awesome-azd)
- [Todo malli lähtekood](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Palju õnne esimese azd projekti lõpetamisel!** Oled nüüd valmis ehitama ja juurutama suurepäraseid rakendusi Azure’is enesekindlalt.

---

**Kavalehe navigeerimine:**
- **📚 Kursuse avaleht**: [AZD algajatele](../../README.md)
- **📖 Praegune peatükk**: 1. peatükk - alused ja kiire käivitamine
- **⬅️ Eelmine**: [Installatsioon ja seadistus](installation.md)
- **➡️ Järgmine**: [Too oma rakendus](bring-your-own-app.md)
- **🚀 Järgmine peatükk**: [2. peatükk: tehisintellektile orienteeritud arendus](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->