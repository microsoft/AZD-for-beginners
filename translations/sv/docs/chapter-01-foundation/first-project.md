# Ditt första projekt - praktisk handledning

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduction

Välkommen till ditt första Azure Developer CLI-projekt! Denna omfattande praktiska handledning ger en komplett genomgång av att skapa, distribuera och hantera en fullstack-applikation på Azure med azd. Du kommer att arbeta med en verklig todo-applikation som inkluderar en React-frontend, en Node.js API-backend och en MongoDB-databas.

## Learning Goals

Genom att slutföra denna handledning kommer du att:
- Bemästra arbetsflödet för att initiera azd-projekt med mallar
- Förstå Azure Developer CLI-projektstruktur och konfigurationsfiler
- Köra fullständig applikationsdistribution till Azure med infrastrukturprovisionering
- Implementera uppdaterings- och återdistributionsstrategier för applikationen
- Hantera flera miljöer för utveckling och staging
- Tillämpa rutiner för rensning av resurser och kostnadshantering

## Learning Outcomes

Efter slutförandet kommer du att kunna:
- Initiera och konfigurera azd-projekt från mallar självständigt
- Navigera i och modifiera azd-projektstrukturer effektivt
- Distribuera fullstack-applikationer till Azure med enkla kommandon
- Felsöka vanliga distributionsproblem och autentiseringsproblem
- Hantera flera Azure-miljöer för olika distributionsfaser
- Implementera kontinuerliga distributionsarbetsflöden för applikationsuppdateringar

## Getting Started

### Prerequisites Checklist
- ✅ Azure Developer CLI installed ([Installation Guide](installation.md))
- ✅ Azure CLI installed and authenticated
- ✅ Git installed on your system
- ✅ Node.js 16+ (for this tutorial)
- ✅ Visual Studio Code (recommended)

### Verify Your Setup
```bash
# Kontrollera azd-installationen
azd version
```
### Verify Azure authentication

```bash
az account show
```

### Check Node.js version
```bash
node --version
```

## Step 1: Choose and Initialize a Template

Låt oss börja med en populär todo-applikationsmall som inkluderar en React-frontend och en Node.js API-backend.

```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera mallen för todo-appen
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Följ instruktionerna:
# - Ange ett miljönamn: "dev"
# - Välj en prenumeration (om du har flera)
# - Välj en region: "East US 2" (eller din föredragna region)
```

### What Just Happened?
- Hämtade mallkoden till din lokala katalog
- Skapade en `azure.yaml`-fil med tjänstedefinitioner
- Konfigurerade infrastrukturkod i `infra/`-katalogen
- Skapade en miljökonfiguration

## Step 2: Explore the Project Structure

Låt oss granska vad azd skapade åt oss:

```bash
# Visa projektstrukturen
tree /f   # Windows
# eller
find . -type f | head -20   # macOS/Linux
```

You should see:
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

### Key Files to Understand

**azure.yaml** - Hjärtat i ditt azd-projekt:
```bash
# Visa projektkonfigurationen
cat azure.yaml
```

**infra/main.bicep** - Infrastrukturdefinition:
```bash
# Visa koden för infrastrukturen
head -30 infra/main.bicep
```

## Step 3: Customize Your Project (Optional)

Innan du distribuerar kan du anpassa applikationen:

### Modify the Frontend
```bash
# Öppna React-appkomponenten
code src/web/src/App.tsx
```

Make a simple change:
```typescript
// Hitta titeln och ändra den
<h1>My Awesome Todo App</h1>
```

### Configure Environment Variables
```bash
# Ställ in anpassade miljövariabler
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Visa alla miljövariabler
azd env get-values
```

## Step 4: Deploy to Azure

Nu till den spännande delen - distribuera allt till Azure!

```bash
# Distribuera infrastruktur och applikation
azd up

# Detta kommando kommer att:
# 1. Tillhandahålla Azure-resurser (App Service, Cosmos DB, med mera)
# 2. Bygga din applikation
# 3. Distribuera till de tillhandahållna resurserna
# 4. Visa applikationens URL
```

### What's Happening During Deployment?

The `azd up` command performs these steps:
1. **Provision** (`azd provision`) - Skapar Azure-resurser
2. **Package** - Bygger din applikationskod
3. **Deploy** (`azd deploy`) - Distribuerar kod till Azure-resurser

### Expected Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Step 5: Test Your Application

### Access Your Application
Klicka på URL:en som visas i distributionsutdata, eller hämta den när som helst:
```bash
# Hämta applikationens endpunkter
azd show

# Öppna applikationen i din webbläsare
azd show --output json | jq -r '.services.web.endpoint'
```

### Test the Todo App
1. **Lägg till en todo** - Klicka på "Lägg till Todo" och ange en uppgift
2. **Markera som slutförd** - Bocka av slutförda uppgifter
3. **Ta bort objekt** - Ta bort todos du inte längre behöver

### Monitor Your Application
```bash
# Öppna Azure-portalen för dina resurser
azd monitor

# Visa applikationsloggar
azd monitor --logs

# Visa live-mätvärden
azd monitor --live
```

## Step 6: Make Changes and Redeploy

Låt oss göra en ändring och se hur enkelt det är att uppdatera:

### Modify the API
```bash
# Redigera API-koden
code src/api/src/routes/lists.js
```

Add a custom response header:
```javascript
// Hitta en routehanterare och lägg till:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Just the Code Changes
```bash
# Distribuera endast applikationskoden (hoppa över infrastrukturen)
azd deploy

# Detta är mycket snabbare än 'azd up' eftersom infrastrukturen redan finns
```

## Step 7: Manage Multiple Environments

Skapa en staging-miljö för att testa ändringar innan produktion:

```bash
# Skapa en ny stagingmiljö
azd env new staging

# Distribuera till stagingmiljön
azd up

# Byt tillbaka till dev-miljön
azd env select dev

# Lista alla miljöer
azd env list
```

### Environment Comparison
```bash
# Visa utvecklingsmiljö
azd env select dev
azd show

# Visa stagingmiljö
azd env select staging
azd show
```

## Step 8: Clean Up Resources

När du är klar med experimenterandet, rensa upp för att undvika löpande kostnader:

```bash
# Ta bort alla Azure-resurser för den aktuella miljön
azd down

# Tvinga borttagning utan bekräftelse och rensa mjukt borttagna resurser
azd down --force --purge

# Ta bort en specifik miljö
azd env select staging
azd down --force --purge
```

## What You've Learned

Grattis! Du har framgångsrikt:
- ✅ Initierat ett azd-projekt från en mall
- ✅ Utforskat projektstrukturen och viktiga filer
- ✅ Distribuerat en fullstack-applikation till Azure
- ✅ Gjort kodändringar och distribuerat igen
- ✅ Hanterat flera miljöer
- ✅ Rensat upp resurser

## 🎯 Skill Validation Exercises

### Exercise 1: Deploy a Different Template (15 minutes)
**Goal**: Demonstrate mastery of azd init and deployment workflow

```bash
# Prova Python + MongoDB-stacken
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifiera driftsättningen
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Rensa upp
azd down --force --purge
```

**Success Criteria:**
- [ ] Applikationen distribueras utan fel
- [ ] Kan nå applikationens URL i webbläsaren
- [ ] Applikationen fungerar korrekt (lägg till/ta bort todos)
- [ ] Lyckades rensa upp alla resurser

### Exercise 2: Customize Configuration (20 minutes)
**Goal**: Practice environment variable configuration

```bash
cd my-first-azd-app

# Skapa anpassad miljö
azd env new custom-config

# Ställ in anpassade variabler
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifiera variabler
azd env get-values | grep APP_TITLE

# Driftsätt med anpassad konfiguration
azd up
```

**Success Criteria:**
- [ ] Anpassad miljö skapad framgångsrikt
- [ ] Miljövariabler satta och hämtbara
- [ ] Applikationen distribueras med anpassad konfiguration
- [ ] Kan verifiera anpassade inställningar i den distribuerade appen

### Exercise 3: Multi-Environment Workflow (25 minutes)
**Goal**: Master environment management and deployment strategies

```bash
# Skapa utvecklingsmiljö
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Notera utvecklings-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Skapa stagingmiljö
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Notera staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Jämför miljöerna
azd env list

# Testa båda miljöerna
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Rensa upp båda
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Success Criteria:**
- [ ] Två miljöer skapade med olika konfigurationer
- [ ] Båda miljöerna distribuerade framgångsrikt
- [ ] Kan växla mellan miljöer med `azd env select`
- [ ] Miljövariabler skiljer sig mellan miljöerna
- [ ] Lyckades rensa upp båda miljöerna

## 📊 Your Progress

**Tid investerad**: ~60-90 minuter  
**Förvärvade färdigheter**:
- ✅ Mallbaserad projektinitiering
- ✅ Azure-resursprovisionering
- ✅ Arbetsflöden för applikationsdistribution
- ✅ Miljöhantering
- ✅ Konfigurationshantering
- ✅ Rensning av resurser och kostnadshantering

**Next Level**: Du är redo för [Konfigurationsguide](configuration.md) för att lära dig avancerade konfigurationsmönster!

## Troubleshooting Common Issues

### Authentication Errors
```bash
# Autentisera på nytt med Azure
az login

# Verifiera åtkomst till prenumerationen
az account show
```

### Deployment Failures
```bash
# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd up --debug

# Visa applikationsloggar i Azure
azd monitor --logs

# För Container Apps, använd Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Name Conflicts
```bash
# Använd ett unikt namn för miljön
azd env new dev-$(whoami)-$(date +%s)
```

### Port/Network Issues
```bash
# Kontrollera om portar är tillgängliga
netstat -an | grep :3000
netstat -an | grep :3100
```

## Next Steps

Nu när du har slutfört ditt första projekt, utforska dessa avancerade ämnen:

### 1. Customize Infrastructure
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Add databases, storage, and other services](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Set Up CI/CD
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Kompletta CI/CD-arbetsflöden
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelinekonfiguration

### 3. Production Best Practices
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Säkerhet, prestanda och övervakning

### 4. Explore More Templates
```bash
# Bläddra bland mallar efter kategori
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Testa olika teknikstackar
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Additional Resources

### Learning Materials
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Support
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Examples
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Grattis till att du slutfört ditt första azd-projekt!** Du är nu redo att bygga och distribuera fantastiska applikationer på Azure med självförtroende.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 1 - Foundation & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->