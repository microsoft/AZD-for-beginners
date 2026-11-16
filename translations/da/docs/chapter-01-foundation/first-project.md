# Dit Første Projekt - Praktisk Vejledning

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Grundlag & Hurtig Start
- **⬅️ Forrige**: [Installation & Opsætning](installation.md)
- **➡️ Næste**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-Første Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Velkommen til dit første Azure Developer CLI-projekt! Du skal implementere en todo-applikation med en React-frontend, Node.js API og Azure Cosmos DB. Skabelonen bevarer det historiske navn `todo-nodejs-mongo`; dens nuværende infrastruktur bruger Cosmos DB til NoSQL, så undersøg den hentede README og `infra/` i stedet for at antage database-API'en ud fra navnet.

> Gennemgået mod `azd 1.37.2` og den offentlige skabelon i november 2026. Eksemplerne nedenfor bruger Bash; JSON-udtræk kræver også `jq`. Azure-implementeringer medfører omkostninger og blev ikke udført under denne gennemgang.

## Læringsmål

Ved at gennemføre denne vejledning vil du:
- Mestre azd-projektinitialiseringsarbejdsgangen ved brug af skabeloner
- Forstå Azure Developer CLI projektstruktur og konfigurationsfiler
- Udføre komplet applikationsimplementering til Azure med infrastrukturprovisionering
- Implementere applikationsopdateringer og genudrulningsstrategier
- Administrere flere miljøer til udvikling og test
- Anvende praksis for ressourceoprydning og omkostningsstyring

## Læringsresultater

Når du er færdig, vil du kunne:
- Initialisere og konfigurere azd-projekter fra skabeloner selvstændigt
- Navigere og modificere azd-projektstrukturer effektivt
- Implementere full-stack applikationer til Azure med enkeltkommandoer
- Fejlfinde almindelige implementeringsproblemer og autentificeringsproblemer
- Administrere flere Azure-miljøer til forskellige udgivelsesstadier
- Implementere kontinuerlige implementeringsarbejdsgange til applikationsopdateringer

## Kom godt i gang

### Forudsætningskontrolliste
- ✅ Azure Developer CLI installeret ([Installationsvejledning](installation.md))
- ✅ AZD-autentificering fuldført med `azd auth login`
- ✅ Git installeret på dit system
- ✅ Node.js 22 LTS (eller en understøttet version krævet af den hentede skabelon)
- ✅ Visual Studio Code (anbefalet)

Før du fortsætter, kør opsætningsvalideringen fra repository-roden:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Bekræft din opsætning
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Bekræft valgfri Azure CLI-autentificering

```bash
az account show
```

### Tjek Node.js-version
```bash
node --version
```

## Trin 1: Vælg og initialiser en skabelon

Lad os starte med en populær todo-applikationsskabelon, der inkluderer en React-frontend og Node.js API-backend.

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

### Hvad skete der netop?
- Downloadede skabelonkoden til din lokale mappe
- Oprettede en `azure.yaml`-fil med servicedefinitioner
- Opsatte infrastrukturkode i `infra/`-mappen
- Oprettede en miljøkonfiguration

## Trin 2: Udforsk projektstrukturen

Lad os undersøge, hvad azd oprettede for os:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Du burde se:
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

### Centrale filer at forstå

**azure.yaml** - Hjertet i dit azd-projekt:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Trin 3: Tilpas dit projekt (valgfrit)

Før implementering kan du tilpasse applikationen:

### Ændr frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Foretag en simpel ændring:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurer miljøvariabler
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Disse to brugerdefinerede værdier demonstrerer kun lokal lagring. Standard-skabelonen bruger ikke `WEBSITE_TITLE` eller `API_VERSION`, så de ændrer ikke appen. Den eksplicitte kildeændring ovenfor ændrer den viste titel.

## Trin 4: Implementer til Azure

Nu til den spændende del - implementer alt til Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Hvad sker der under implementeringen?

Arbejdsgangen provisionerer infrastruktur og pakker/implementerer kode. Den nøjagtige rækkefølge kan tilpasses via `workflows.up` i `azure.yaml`; denne skabelon angiver provision først efterfulgt af implementering. Stol ikke på én universel faseorden for hver skabelon.

### Forventet output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Trin 5: Test din applikation

### Adgang til din applikation
Klik på URL'en givet i implementeringsoutputtet, eller hent den når som helst:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Test Todo-app'en
1. **Tilføj en todo** - Klik "Add Todo" og indtast en opgave
2. **Markér som fuldført** - Afkryds fuldførte opgaver
3. **Slet opgaver** - Fjern todo’er du ikke længere behøver

### Overvåg din applikation
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Bekræft din implementering

Før du går videre, gennemgå denne hurtige tjekliste for at bekræfte, at alting faktisk virker – antag ikke at "implementering lykkedes" betyder "app virker":

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

**Implementering er bekræftet, når:**
- ✅ `azd show` viser en tilgængelig endepunkt-URL
- ✅ URL'en åbner i din browser uden fejl
- ✅ Kernefunktionerne virker (tilføj/færdiggør/slet en todo)
- ✅ `azd monitor --logs` viser ankomne forespørgsler uden uventede fejl

Hvis nogen tjek fejler, gå til [Kapitel 7: Fejlfinding](../chapter-07-troubleshooting/README.md).

## Trin 6: Foretag ændringer og genimplementer

Lad os foretage en ændring og se, hvor nemt det er at opdatere:

### Ændr API'en
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Tilføj en brugerdefineret responsheader:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementer kun kodeændringerne
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Trin 7: Administrer flere miljøer

Opret et staging-miljø for at teste ændringer før produktion:

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

### Miljøsammenligning
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Trin 8: Ryd op i ressourcer

Når du er færdig med at eksperimentere, ryd op for at undgå løbende omkostninger:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassisk app vs. AI-drevet app: Samme arbejdsgang

Du har netop implementeret en traditionel webapplikation. Men hvad hvis du ville implementere en AI-drevet app i stedet – fx en chatapplikation drevet af Microsoft Foundry Models?

Den gode nyhed: **arbejdsgangen er identisk.**

| Trin | Klassisk Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialiser (tom mappe) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentificer | `azd auth login` | `azd auth login` |
| Implementer | `azd up` | `azd up` |
| Overvåg | `azd monitor` | `azd monitor` |
| Ryd op | `azd down --force --purge` | `azd down --force --purge` |

Livscykluskommandoerne er de samme, men forudsætningerne varierer. En AI-skabelon kan kræve modeladgang, regional kvote, dataindsamling og yderligere konfiguration. Læs dens README før implementering; `azd up` kan ikke sørge for manglende tilladelser eller kvoter.

Dette er det grundlæggende princip for azd: **én arbejdsgang, enhver arbejdsbyrde.** De færdigheder, du øvede i denne vejledning – initialisering, implementering, overvågning, genimplementering og oprydning – gælder lige så godt for AI-applikationer og agenter.

---

## Hvad du har lært

Tillykke! Du har succesfuldt:
- ✅ Initialiseret et azd-projekt fra en skabelon
- ✅ Udforsket projektstrukturen og centrale filer
- ✅ Implementeret en full-stack applikation til Azure
- ✅ Foretaget kodeændringer og genimplementeret
- ✅ Administreret flere miljøer
- ✅ Ryddet op i ressourcer

## 🎯 Færdighedsvalideringsøvelser

### Øvelse 1: Implementer en anden skabelon (15 minutter)
**Mål**: Demonstrer mestring af azd init og implementeringsarbejdsgangen

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

**Succes kriterier:**
- [ ] Applikationen implementerer uden fejl
- [ ] Kan tilgå applikations-URL i browser
- [ ] Applikationen fungerer korrekt (tilføj/fjern todos)
- [ ] Ryddet succesfuldt op i alle ressourcer

### Øvelse 2: Tilpas konfiguration (20 minutter)
**Mål**: Øv lokal miljøværdi-lagring uden at forveksle det med runtime-konfiguration

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

**Succes kriterier:**
- [ ] Brugerdefineret miljø oprettet succesfuldt
- [ ] Miljøvariabler sat og hentet korrekt
- [ ] `azd env get-value APP_TITLE` printer `My Custom Todo App`
- [ ] Kan forklare, hvorfor disse værdier ikke ændrer standardappen, medmindre kode/infrastruktur bruger dem

### Øvelse 3: Multi-miljø arbejdsgang (25 minutter)
**Mål**: Mest miljøstyring og implementeringsstrategier

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

**Succes kriterier:**
- [ ] To miljøer oprettet med forskellige konfigurationer
- [ ] Begge miljøer succesfuldt implementeret
- [ ] Kan skifte mellem miljøer ved brug af `azd env select`
- [ ] Miljøvariabler varierer mellem miljøer
- [ ] Ryddet op i begge miljøer med succes

## 📊 Din Fremgang

**Investering af tid**: ~60-90 minutter  
**Erhvervede færdigheder**:
- ✅ Skabelonbaseret projektinitialisering
- ✅ Azure-ressourceprovisionering
- ✅ Applikationsimplementeringsarbejdsgange
- ✅ Miljøstyring
- ✅ Konfigurationshåndtering
- ✅ Rengøring af ressourcer og omkostningsstyring

**Næste niveau**: Du er klar til [Konfigurationsvejledning](../chapter-03-configuration/configuration.md) for at lære avancerede konfigurationsmønstre!

## Fejlfinding af almindelige problemer

### Autentificeringsfejl
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Implementeringsfejl
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Ressourcenavn-konflikter
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Netværksproblemer
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Næste skridt

Nu hvor du har gennemført dit første projekt, kan du udforske disse avancerede emner:

### 1. Tilpas Infrastruktur
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Tilføj databasinfrastruktur](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Opsæt CI/CD
- [Implementeringsvejledning](../chapter-04-infrastructure/deployment-guide.md) - Færdige CI/CD-arbejdsgange
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfiguration

### 3. Produktions bedste praksis
- [Implementeringsvejledning](../chapter-04-infrastructure/deployment-guide.md) - Sikkerhed, ydeevne og overvågning

### 4. Udforsk flere skabeloner
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

## Yderligere ressourcer

### Læringsmaterialer
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Skabeloner & Eksempler
- [Officiel Skabelongalleri](https://azure.github.io/awesome-azd/)
- [Community Skabelonbidrag](https://github.com/Azure/awesome-azd)
- [Todo Skabelonkilde](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Tillykke med at have gennemført dit første azd-projekt!** Du er nu klar til at bygge og implementere fantastiske applikationer på Azure med tillid.

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 1 - Grundlag & Hurtig Start
- **⬅️ Forrige**: [Installation & Opsætning](installation.md)
- **➡️ Næste**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Næste Kapitel**: [Kapitel 2: AI-Første Udvikling](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->