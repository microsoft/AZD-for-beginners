<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e131a5271d4c8eb0d44ae82302f8fd1a",
  "translation_date": "2025-09-12T21:15:14+00:00",
  "source_file": "docs/getting-started/first-project.md",
  "language_code": "nl"
}
-->
# Je Eerste Project - Praktische Tutorial

**Vorige:** [Configuratie](configuration.md) | **Volgende:** [Azure AI Foundry Integratie](../ai-foundry/azure-ai-foundry-integration.md)

## Introductie

Welkom bij je eerste Azure Developer CLI-project! Deze uitgebreide praktische tutorial biedt een volledige walkthrough van het maken, implementeren en beheren van een full-stack applicatie op Azure met behulp van azd. Je werkt met een echte todo-applicatie die een React-frontend, Node.js API-backend en MongoDB-database bevat.

## Leerdoelen

Door deze tutorial te voltooien, leer je:
- Het azd-projectinitialisatieproces beheersen met behulp van templates
- De structuur van Azure Developer CLI-projecten en configuratiebestanden begrijpen
- Een volledige applicatie implementeren op Azure inclusief infrastructuurvoorziening
- Applicatie-updates en herimplementatiestrategieën uitvoeren
- Meerdere omgevingen beheren voor ontwikkeling en staging
- Praktijken toepassen voor het opruimen van resources en kostenbeheer

## Leerresultaten

Na voltooiing kun je:
- Zelfstandig azd-projecten initialiseren en configureren vanuit templates
- Effectief navigeren en wijzigingen aanbrengen in azd-projectstructuren
- Full-stack applicaties implementeren op Azure met enkele commando's
- Veelvoorkomende implementatieproblemen en authenticatieproblemen oplossen
- Meerdere Azure-omgevingen beheren voor verschillende implementatiefasen
- Continue implementatieworkflows toepassen voor applicatie-updates

## Aan de slag

### Checklist Voorvereisten
- ✅ Azure Developer CLI geïnstalleerd ([Installatiehandleiding](installation.md))
- ✅ Azure CLI geïnstalleerd en geauthenticeerd
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 16+ (voor deze tutorial)
- ✅ Visual Studio Code (aanbevolen)

### Verifieer Je Setup
```bash
# Check azd installation
azd version
```
### Verifieer Azure-authenticatie

```bash
az account show
```

### Controleer Node.js-versie
```bash
node --version
```

## Stap 1: Kies en Initialiseer een Template

Laten we beginnen met een populaire todo-applicatietemplate die een React-frontend en Node.js API-backend bevat.

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

### Wat is er net gebeurd?
- De templatecode is gedownload naar je lokale map
- Een `azure.yaml`-bestand is aangemaakt met servicedefinities
- Infrastructuurcode is ingesteld in de map `infra/`
- Een configuratie voor de omgeving is aangemaakt

## Stap 2: Verken de Projectstructuur

Laten we bekijken wat azd voor ons heeft aangemaakt:

```bash
# View the project structure
tree /f   # Windows
# or
find . -type f | head -20   # macOS/Linux
```

Je zou het volgende moeten zien:
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

### Belangrijke Bestanden om te Begrijpen

**azure.yaml** - Het hart van je azd-project:
```bash
# View the project configuration
cat azure.yaml
```

**infra/main.bicep** - Definitie van de infrastructuur:
```bash
# View the infrastructure code
head -30 infra/main.bicep
```

## Stap 3: Pas Je Project Aan (Optioneel)

Voordat je implementeert, kun je de applicatie aanpassen:

### Wijzig de Frontend
```bash
# Open the React app component
code src/web/src/App.tsx
```

Maak een eenvoudige wijziging:
```typescript
// Find the title and change it
<h1>My Awesome Todo App</h1>
```

### Configureer Omgevingsvariabelen
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

## Stap 4: Implementeer op Azure

Nu komt het spannende deel - alles implementeren op Azure!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Wat Gebeurt Er Tijdens de Implementatie?

Het commando `azd up` voert de volgende stappen uit:
1. **Voorzien** (`azd provision`) - Maakt Azure-resources aan
2. **Pakket** - Bouwt je applicatiecode
3. **Implementeer** (`azd deploy`) - Implementeert code naar Azure-resources

### Verwachte Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Stap 5: Test Je Applicatie

### Toegang tot Je Applicatie
Klik op de URL die wordt weergegeven in de implementatie-output, of haal deze op elk moment op:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test de Todo-App
1. **Voeg een todo-item toe** - Klik op "Add Todo" en voer een taak in
2. **Markeer als voltooid** - Vink voltooide items aan
3. **Verwijder items** - Verwijder todo's die je niet meer nodig hebt

### Monitor Je Applicatie
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd logs
```

## Stap 6: Wijzigingen Aanbrengen en Herimplementeren

Laten we een wijziging aanbrengen en zien hoe eenvoudig het is om te updaten:

### Wijzig de API
```bash
# Edit the API code
code src/api/src/routes/lists.js
```

Voeg een aangepaste response header toe:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementeer Alleen de Codewijzigingen
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Stap 7: Beheer Meerdere Omgevingen

Maak een stagingomgeving om wijzigingen te testen voordat je naar productie gaat:

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

### Vergelijking van Omgevingen
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Stap 8: Ruim Resources Op

Als je klaar bent met experimenteren, ruim dan op om doorlopende kosten te vermijden:

```bash
# Delete all Azure resources for current environment
azd down

# Force delete without confirmation and purge soft-deleted resources
azd down --force --purge

# Delete specific environment
azd env select staging
azd down --force --purge
```

## Wat Je Hebt Geleerd

Gefeliciteerd! Je hebt succesvol:
- Een azd-project vanuit een template geïnitieerd
- De projectstructuur en belangrijke bestanden verkend
- Een full-stack applicatie geïmplementeerd op Azure
- Codewijzigingen aangebracht en hergeïmplementeerd
- Meerdere omgevingen beheerd
- Resources opgeruimd

## Veelvoorkomende Problemen Oplossen

### Authenticatiefouten
```bash
# Re-authenticate with Azure
az login

# Verify subscription access
az account show
```

### Implementatiefouten
```bash
# Enable debug logging
export AZD_DEBUG=true
azd up --debug

# View detailed logs
azd logs --service api
azd logs --service web
```

### Resource Naamconflicten
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Poort-/Netwerkproblemen
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Volgende Stappen

Nu je je eerste project hebt voltooid, kun je deze geavanceerde onderwerpen verkennen:

### 1. Infrastructuur Aanpassen
- [Infrastructure as Code](../deployment/provisioning.md)
- [Voeg databases, opslag en andere services toe](../deployment/provisioning.md#adding-services)

### 2. Stel CI/CD In
- [GitHub Actions Integratie](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Productie Best Practices
- [Beveiligingsconfiguraties](../deployment/best-practices.md#security)
- [Prestatieoptimalisatie](../deployment/best-practices.md#performance)
- [Monitoring en logging](../deployment/best-practices.md#monitoring)

### 4. Verken Meer Templates
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

## Aanvullende Bronnen

### Leermaterialen
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Ondersteuning
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Voorbeelden
- [Officiële Templategalerij](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patronen](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gefeliciteerd met het voltooien van je eerste azd-project!** Je bent nu klaar om geweldige applicaties op Azure te bouwen en te implementeren met vertrouwen.

---

**Vorige:** [Configuratie](configuration.md) | **Volgende:** [Azure AI Foundry Integratie](../ai-foundry/azure-ai-foundry-integration.md)
- **Volgende Les**: [Implementatiehandleiding](../deployment/deployment-guide.md)

---

**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in zijn oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.