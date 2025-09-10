<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "d0054b58dbf5baa786403593d848de4a",
  "translation_date": "2025-09-10T13:18:25+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "sv"
}
-->
# Ditt Första Projekt - Praktisk Guide

## Introduktion

Välkommen till ditt första Azure Developer CLI-projekt! Denna omfattande praktiska guide ger dig en komplett genomgång av hur du skapar, distribuerar och hanterar en fullstack-applikation på Azure med azd. Du kommer att arbeta med en riktig todo-applikation som inkluderar en React-frontend, Node.js API-backend och en MongoDB-databas.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Behärska arbetsflödet för att initiera azd-projekt med hjälp av mallar
- Förstå strukturen och konfigurationsfilerna för Azure Developer CLI-projekt
- Utföra en komplett applikationsdistribution till Azure med infrastrukturprovisionering
- Implementera strategier för applikationsuppdateringar och omdistribution
- Hantera flera miljöer för utveckling och staging
- Tillämpa metoder för resursrensning och kostnadshantering

## Läranderesultat

Efter att ha slutfört guiden kommer du att kunna:
- Självständigt initiera och konfigurera azd-projekt från mallar
- Navigera och modifiera azd-projektstrukturer effektivt
- Distribuera fullstack-applikationer till Azure med enstaka kommandon
- Felsöka vanliga distributionsproblem och autentiseringsfel
- Hantera flera Azure-miljöer för olika distributionsstadier
- Implementera kontinuerliga distributionsarbetsflöden för applikationsuppdateringar

## Kom igång

### Förutsättningar - Checklista
- ✅ Azure Developer CLI installerad ([Installationsguide](installation.md))
- ✅ Azure CLI installerad och autentiserad
- ✅ Git installerat på ditt system
- ✅ Node.js 16+ (för denna guide)
- ✅ Visual Studio Code (rekommenderas)

### Verifiera din installation
```bash
# Check azd installation
azd version
```
### Verifiera Azure-autentisering

```bash
az account show
```

### Kontrollera Node.js-version
```bash
node --version
```

## Steg 1: Välj och initiera en mall

Låt oss börja med en populär todo-applikationsmall som inkluderar en React-frontend och Node.js API-backend.

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

### Vad hände precis?
- Mallkoden laddades ner till din lokala katalog
- En `azure.yaml`-fil skapades med tjänstedefinitioner
- Infrastrukturkod sattes upp i katalogen `infra/`
- En miljökonfiguration skapades

## Steg 2: Utforska projektstrukturen

Låt oss undersöka vad azd har skapat åt oss:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Du bör se:
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

### Viktiga filer att förstå

**azure.yaml** - Kärnan i ditt azd-projekt:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Steg 3: Anpassa ditt projekt (valfritt)

Innan distribution kan du anpassa applikationen:

### Ändra frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Gör en enkel ändring:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Konfigurera miljövariabler
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

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

Kommandot `azd up` utför följande steg:
1. **Provision** (`azd provision`) - Skapar Azure-resurser
2. **Package** - Bygger din applikationskod
3. **Deploy** (`azd deploy`) - Distribuerar kod till Azure-resurser

### Förväntad output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Steg 5: Testa din applikation

### Öppna din applikation
Klicka på URL:en som tillhandahålls i distributionsutdata, eller hämta den när som helst:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Testa todo-appen
1. **Lägg till en todo-post** - Klicka på "Add Todo" och ange en uppgift
2. **Markera som klar** - Kryssa för slutförda uppgifter
3. **Ta bort poster** - Ta bort todos du inte längre behöver

### Övervaka din applikation
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Steg 6: Gör ändringar och distribuera om

Låt oss göra en ändring och se hur enkelt det är att uppdatera:

### Ändra API:et
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Lägg till en anpassad svarshuvud:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Distribuera endast kodändringarna
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Steg 7: Hantera flera miljöer

Skapa en staging-miljö för att testa ändringar innan produktion:

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

### Jämförelse av miljöer
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Steg 8: Rensa resurser

När du är klar med experimenten, rensa för att undvika löpande kostnader:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Vad du har lärt dig

Grattis! Du har framgångsrikt:
- Initierat ett azd-projekt från en mall
- Utforskat projektstrukturen och viktiga filer
- Distribuerat en fullstack-applikation till Azure
- Gjort kodändringar och distribuerat om
- Hanterat flera miljöer
- Rensat resurser

## Felsökning av vanliga problem

### Autentiseringsfel
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Distributionsfel
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resursnamnskonflikter
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Port-/nätverksproblem
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Nästa steg

Nu när du har slutfört ditt första projekt, utforska dessa avancerade ämnen:

### 1. Anpassa infrastruktur
- [Infrastructure as Code](../deployment/provisioning.md)
- [Lägg till databaser, lagring och andra tjänster](../deployment/provisioning.md#adding-services)

### 2. Ställ in CI/CD
- [GitHub Actions Integration](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Produktionsbästa praxis
- [Säkerhetskonfigurationer](../deployment/best-practices.md#security)
- [Prestandaoptimering](../deployment/best-practices.md#performance)
- [Övervakning och loggning](../deployment/best-practices.md#monitoring)

### 4. Utforska fler mallar
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

## Ytterligare resurser

### Lärandematerial
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Mallar & Exempel
- [Officiellt Mallgalleri](https://azure.github.io/awesome-azd/)
- [Community-mallar](https://github.com/Azure-Samples/azd-templates)
- [Enterprise-mönster](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Grattis till att ha slutfört ditt första azd-projekt!** Du är nu redo att bygga och distribuera fantastiska applikationer på Azure med självförtroende.

---

**Navigering**
- **Föregående Lektion**: [Konfiguration](configuration.md)
- **Nästa Lektion**: [Distributionsguide](../deployment/deployment-guide.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiska översättningar kan innehålla fel eller inexaktheter. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.