# Ditt Första Projekt - Praktisk Guide

**Kapitelnavigering:**
- **📚 Kurshemsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grund och Snabbstart
- **⬅️ Föregående**: [Installation & Setup](installation.md)
- **➡️ Nästa**: [Ta Med Din Egen App](bring-your-own-app.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Välkommen till ditt första Azure Developer CLI-projekt! Du kommer att distribuera en todo-applikation med React frontend, Node.js API och Azure Cosmos DB. Mallen behåller det historiska namnet `todo-nodejs-mongo`; dess nuvarande infrastruktur använder Cosmos DB för NoSQL, så granska den nedladdade README och `infra/` snarare än att utgå från databas-API:t från namnet.

> Granskad mot `azd 1.37.2` och den offentliga mallen i november 2026. Exemplen nedan använder Bash; JSON-extraktion kräver också `jq`. Azure-distributioner medför kostnader och kördes inte under denna granskning.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra azd-projektinitieringsflödet med mallar
- Förstå Azure Developer CLI projektstruktur och konfigurationsfiler
- Utföra fullständig applikationsdistribution till Azure med infrastrukturförsörjning
- Implementera applikationsuppdateringar och omdistributionsstrategier
- Hantera flera miljöer för utveckling och staging
- Tillämpa resurssanering och kostnadshanteringsrutiner

## Läranderesultat

Efter slutförandet kommer du att kunna:
- Självständigt initiera och konfigurera azd-projekt från mallar
- Navigera och modifiera azd-projektstrukturer effektivt
- Distribuera fullstack-applikationer till Azure med enkla kommandon
- Felsöka vanliga distributionsproblem och autentiseringsproblem
- Hantera flera Azure-miljöer för olika distributionsfaser
- Implementera kontinuerliga distributionsarbetsflöden för applikationsuppdateringar

## Kom igång

### Förutsättningslista
- ✅ Azure Developer CLI installerad ([Installationsguide](installation.md))
- ✅ AZD-autentisering slutförd med `azd auth login`
- ✅ Git installerat på ditt system
- ✅ Node.js 22 LTS (eller en version som stöds av den nedladdade mallen)
- ✅ Visual Studio Code (rekommenderas)

Innan du fortsätter, kör setup-validatorn från rotmappen:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifiera Din Setup
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Verifiera valfri Azure CLI-autentisering

```bash
az account show
```

### Kontrollera Node.js-version
```bash
node --version
```

## Steg 1: Välj och Initiera en Mall

Vi börjar med en populär todo-applikationsmall som inkluderar en React frontend och en Node.js API backend.

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

### Vad hände precis?
- Mallkoden laddades ner till din lokala katalog
- En `azure.yaml`-fil skapades med tjänstedefinitioner
- Infrastrukturkod sattes upp i katalogen `infra/`
- En miljökonfiguration skapades

## Steg 2: Utforska Projektstrukturen

Låt oss undersöka vad azd skapade åt oss:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Du bör se:
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

### Viktiga Filer att Förstå

**azure.yaml** - Hjärtat i ditt azd-projekt:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Steg 3: Anpassa Ditt Projekt (Frivilligt)

Innan distribution kan du anpassa applikationen:

### Modifiera Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Gör en enkel ändring:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Konfigurera Miljövariabler
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Dessa två anpassade värden visar endast lokal lagring. Standardmallen förbrukar inte `WEBSITE_TITLE` eller `API_VERSION`, så de ändrar inte appen. Den uttryckliga källredigeringen ovan ändrar den visade titeln.

## Steg 4: Distribuera till Azure

Nu till den spännande delen - distribuera allt till Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Vad händer under distributionen?

Arbetsflödet försörjer infrastruktur och paketerar/distribuerar kod. Exakt ordning kan anpassas via `workflows.up` i `azure.yaml`; denna mall specificerar försörjning följt av distribution. Förlita dig inte på en universell fasordning för varje mall.

### Förväntad Utdata
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Testa Din Applikation

### Öppna Din Applikation
Klicka på URL:en som anges i distributionsresultatet, eller hämta den när som helst:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Testa Todo-appen
1. **Lägg till en todo-post** - Klicka på "Add Todo" och skriv in en uppgift
2. **Markera som klar** - Bocka av slutförda uppgifter
3. **Ta bort uppgifter** - Radera todos du inte längre behöver

### Övervaka Din Applikation
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifiera Din Distribution

Innan du går vidare, gå igenom denna snabba lista för att försäkra dig om att allt verkligen fungerar—anta inte att "distribution lyckades" betyder "appen fungerar":

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

**Distributionen är verifierad när:**
- ✅ `azd show` listar en åtkomlig endpoint-URL
- ✅ URL:en öppnas i din webbläsare utan fel
- ✅ Kärnfunktioner fungerar (lägg till/markera som klar/radera en todo)
- ✅ `azd monitor --logs` visar inkommande förfrågningar utan oväntade fel

Om någon kontroll misslyckas, gå till [Kapitel 7: Felsökning](../chapter-07-troubleshooting/README.md).

## Steg 6: Gör Ändringar och Omdistribuera

Låt oss göra en förändring och se hur lätt det är att uppdatera:

### Modifiera API:et
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Lägg till en anpassad svarshuvud:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuera Endast Kodändringarna
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Steg 7: Hantera Flera Miljöer

Skapa en stagingmiljö för att testa ändringar innan produktion:

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

### Miljöjämförelse
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Steg 8: Rensa Upp Resurser

När du är klar med experimenteringen, rensa upp för att undvika löpande kostnader:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassisk App vs. AI-Driven App: Samma Arbetsflöde

Du har precis distribuerat en traditionell webbapplikation. Men tänk om du ville distribuera en AI-driven app istället—t.ex. en chattapplikation baserad på Microsoft Foundry-modeller?

Den goda nyheten: **arbetsflödet är identiskt.**

| Steg | Klassisk Todo-app | AI Chat App |
|------|-----------------|-------------|
| Initiera (tom katalog) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Autentisera | `azd auth login` | `azd auth login` |
| Distribuera | `azd up` | `azd up` |
| Övervaka | `azd monitor` | `azd monitor` |
| Rensa upp | `azd down --force --purge` | `azd down --force --purge` |

Livscykelkommandona är samma, men förutsättningarna skiljer sig. En AI-mall kan kräva modellåtkomst, regional kvot, dataingest och ytterligare konfiguration. Läs dess README före distribution; `azd up` kan inte tillhandahålla saknade behörigheter eller kvot.

Detta är kärnprincipen i azd: **ett arbetsflöde, vilken arbetsbelastning som helst.** De färdigheter du övade på i denna guide—initiering, distribution, övervakning, omdistribution och sanering—gäller lika för AI-applikationer och agenter.

---

## Vad Du Har Lärt Dig

Grattis! Du har framgångsrikt:
- ✅ Initierat ett azd-projekt från en mall
- ✅ Utforskat projektstrukturen och viktiga filer
- ✅ Distribuerat en fullstack-applikation till Azure
- ✅ Gjort kodändringar och omdistribuerat
- ✅ Hanterat flera miljöer
- ✅ Rensat upp resurser

## 🎯 Övningar för Bekräftelse av Färdigheter

### Övning 1: Distribuera en Annan Mall (15 minuter)
**Mål**: Visa behärskning av azd init och distributionsflöde

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

**Framgångskriterier:**
- [ ] Applikationen distribueras utan fel
- [ ] Kan nå applikations-URL i webbläsare
- [ ] Applikationen fungerar korrekt (lägga till/ta bort todos)
- [ ] Framgångsrikt rensat alla resurser

### Övning 2: Anpassa Konfiguration (20 minuter)
**Mål**: Träna lokal lagring av miljövärden utan att förväxla det med körkonfiguration

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

**Framgångskriterier:**
- [ ] Anpassad miljö skapad framgångsrikt
- [ ] Miljövariabler satta och hämtbara
- [ ] `azd env get-value APP_TITLE` skriver ut `My Custom Todo App`
- [ ] Kan förklara varför dessa värden inte ändrar den standardiserade appen om koden/infrastrukturen inte använder dem

### Övning 3: Arbetsflöde för Multi-miljö (25 minuter)
**Mål**: Bemästra miljöhantering och distributionsstrategier

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

**Framgångskriterier:**
- [ ] Två miljöer skapade med olika konfigurationer
- [ ] Båda miljöerna distribuerade framgångsrikt
- [ ] Kan växla mellan miljöer med `azd env select`
- [ ] Miljövariabler skiljer sig mellan miljöerna
- [ ] Framgångsrikt rensat båda miljöerna

## 📊 Din Framsteg

**Investerad Tid**: ~60-90 minuter  
**Erhållna Färdigheter**:
- ✅ Mallbaserad projektinitiering
- ✅ Azure-resursförsörjning
- ✅ Applikationsdistributionsarbetsflöden
- ✅ Miljöhantering
- ✅ Konfigurationshantering
- ✅ Resurssanering och kostnadshantering

**Nästa Nivå**: Du är redo för [Konfigurationsguide](../chapter-03-configuration/configuration.md) för att lära dig avancerade konfigurationsmönster!

## Felsökning av Vanliga Problem

### Autentiseringsfel
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Distributionsfel
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Konflikter med Resursnamn
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/Nätverksproblem
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nästa Steg

Nu när du har slutfört ditt första projekt, utforska dessa avancerade ämnen:

### 1. Anpassa Infrastruktur
- [Infrastruktur som Kod](../chapter-04-infrastructure/provisioning.md)
- [Lägg till databas-infrastruktur](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Ställ in CI/CD
- [Distributionsguide](../chapter-04-infrastructure/deployment-guide.md) - Kompletta CI/CD-arbetsflöden
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfiguration

### 3. Produktionsbästa praxis
- [Distributionsguide](../chapter-04-infrastructure/deployment-guide.md) - Säkerhet, prestanda och övervakning

### 4. Utforska Fler Mallar
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

## Ytterligare Resurser

### Lärmaterial
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Arkitekturcenter](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Gemenskap & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallar & Exempel
- [Officiellt Mallgalleri](https://azure.github.io/awesome-azd/)
- [Community Mallbidrag](https://github.com/Azure/awesome-azd)
- [Todo Mallkälla](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Grattis till att du slutfört ditt första azd-projekt!** Du är nu redo att bygga och distribuera fantastiska applikationer på Azure med självförtroende.

---

**Kapitelnavigering:**
- **📚 Kurshemsida**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 1 - Grund och Snabbstart
- **⬅️ Föregående**: [Installation & Setup](installation.md)
- **➡️ Nästa**: [Ta Med Din Egen App](bring-your-own-app.md)
- **🚀 Nästa Kapitel**: [Kapitel 2: AI-First Utveckling](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->