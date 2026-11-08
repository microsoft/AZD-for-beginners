# Je Eerste Project - Praktische Handleiding

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Breng Je Eigen App](bring-your-own-app.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introductie

Welkom bij je eerste Azure Developer CLI-project! Je zet een todo-applicatie uit met een React frontend, Node.js API, en Azure Cosmos DB. De template behoudt de historische naam `todo-nodejs-mongo`; de huidige infrastructuur gebruikt Cosmos DB voor NoSQL, dus bekijk de gedownloade README en `infra/` in plaats van de database-API uit de naam af te leiden.

> Gecontroleerd tegen `azd 1.37.2` en de publieke template in november 2026. Voorbeelden hieronder gebruiken Bash; JSON-extractie vereist ook `jq`. Azure-implementaties brengen kosten met zich mee en zijn tijdens deze controle niet uitgevoerd.

## Leerdoelen

Door deze handleiding te voltooien, zul je:
- Het azd project initialisatieproces beheersen via templates
- Begrijpen hoe Azure Developer CLI projectstructuur en configuratiebestanden werken
- Volledige applicatie-implementatie naar Azure uitvoeren inclusief infrastructuur provisioning
- Strategieën voor applicatie-updates en herimplementatie toepassen
- Meerdere omgevingen beheren voor ontwikkeling en staging
- Praktijken voor resource cleanup en kostenbeheer toepassen

## Leerresultaten

Na voltooiing kun je:
- Azd-projecten vanuit templates zelfstandig initialiseren en configureren
- Effectief navigeren en wijzigen van azd projectstructuren
- Full-stack applicaties naar Azure implementeren met één commando
- Veelvoorkomende problemen met deployment en authenticatie oplossen
- Meerdere Azure-omgevingen beheren voor verschillende deployment fasen
- Workflows voor continue deployment van applicatie-updates implementeren

## Aan de Slag

### Checklist Vereisten
- ✅ Azure Developer CLI geïnstalleerd ([Installatiehandleiding](installation.md))
- ✅ AZD-authenticatie voltooid met `azd auth login`
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 22 LTS (of een ondersteunde versie vereist door de gedownloade template)
- ✅ Visual Studio Code (aanbevolen)

Voer voordat je verdergaat de setup-validator uit vanaf de root van de repository:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Controleer Je Setup
```bash
# Check azd installation
azd version

# Check AZD authentication
azd auth login --check-status
```

### Optionele Azure CLI authenticatie controleren

```bash
az account show
```

### Controleer Node.js versie
```bash
node --version
```

## Stap 1: Kies en Initialiseer een Template

Laten we beginnen met een populaire todo-applicatie-template die een React frontend en Node.js API backend bevat.

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

### Wat Is Er Zojuist Gebeurt?
- De templatecode is gedownload naar je lokale map
- Een `azure.yaml` bestand is gemaakt met service-definities
- Infrastructuurcode is opgezet in de `infra/` map
- Een omgevingsconfiguratie is aangemaakt

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

## Stap 3: Pas Je Project Aan (optioneel)

Voordat je gaat deployen, kun je de applicatie aanpassen:

### Wijzig de Frontend
```bash
# Open the React app component
code src/web/src/layout/header.tsx
```

Maak een eenvoudige wijziging:
```tsx
// Replace the existing <Text variant="xLarge">ToDo</Text> element
<Text variant="xLarge">My Awesome Todo App</Text>
```

### Configureer Omgevingsvariabelen
```bash
# Set custom environment variables
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# View all environment variables
azd env get-values
```

Deze twee aangepaste waarden demonstreren alleen lokale opslag. De standaardtemplate verbruikt `WEBSITE_TITLE` of `API_VERSION` niet, dus ze veranderen de app niet. De expliciete bronwijziging hierboven wijzigt de weergegeven titel.

## Stap 4: Implementeer naar Azure

Nu het spannende deel - alles naar Azure deployen!

```bash
# Deploy infrastructure and application
azd up

# This command will:
# 1. Provision Azure resources (App Service, Cosmos DB, etc.)
# 2. Build your application
# 3. Deploy to the provisioned resources
# 4. Display the application URL
```

### Wat Gebeurt Er Tijdens de Deployment?

De workflow voorziet infrastructuur en pakket/implementeert code. Precieze volgorde kan worden aangepast via `workflows.up` in `azure.yaml`; deze template specificeert eerst provision en daarna deploy. Vertrouw niet op één universele fasevolgorde voor elke template.

### Verwachte Uitvoer
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
Klik op de URL die in de deployment-uitvoer staat, of haal deze op elk moment op:
```bash
# Get application endpoints
azd show

# Open the application in your browser
azd show --output json | jq -er '.services.web.ingressUrl'
```

### Test de Todo App
1. **Voeg een todo-item toe** - Klik op "Add Todo" en voer een taak in
2. **Markeer als voltooid** - Vink voltooide items aan
3. **Verwijder items** - Verwijder todos die je niet meer nodig hebt

### Monitor Je Applicatie
```bash
# Open Azure portal for your resources
azd monitor

# View application logs
azd monitor --logs

# View live metrics
azd monitor --live
```

### ✅ Verifieer Je Deployment

Loop voordat je verdergaat deze korte checklist door om te bevestigen dat alles daadwerkelijk werkt — ga er niet van uit dat "deploy is geslaagd" betekent "app werkt":

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

**Deployment is geverifieerd wanneer:**
- ✅ `azd show` een bereikbare eindpunt-URL toont
- ✅ De URL opent zonder fouten in je browser
- ✅ Kernfuncties werken (toevoegen/voltooien/verwijderen van een todo)
- ✅ `azd monitor --logs` laat aantallen verzoeken binnenkomen zonder onverwachte fouten

Als een controle mislukt, ga dan naar [Hoofdstuk 7: Problemen Oplossen](../chapter-07-troubleshooting/README.md).

## Stap 6: Breng Wijzigingen aan en Redeploy

Laten we een wijziging aanbrengen en zien hoe makkelijk het is om bij te werken:

### Wijzig de API
```bash
# Edit the API code
code src/api/src/routes/lists.ts
```

Voeg een aangepaste response-header toe:
```javascript
// Find a route handler and add:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy Alleen de Code Wijzigingen
```bash
# Deploy only the application code (skip infrastructure)
azd deploy

# This is much faster than 'azd up' since infrastructure already exists
```

## Stap 7: Beheer Meerdere Omgevingen

Maak een staging-omgeving om wijzigingen te testen vóór productie:

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

### Omgevingsvergelijking
```bash
# View dev environment
azd env select dev
azd show

# View staging environment  
azd env select staging
azd show
```

## Stap 8: Ruim Resources Op

Wanneer je klaar bent met experimenteren, ruim dan op om doorlopende kosten te voorkomen:

```bash
# Review and delete BOTH environments created in this tutorial
azd down --environment dev
azd down --environment staging

# Automation alternative for a selected disposable environment:
# azd down --environment dev --force --purge
# --purge affects supported soft-deleted Azure resources, not local .azure files.
```

## Klassieke App versus AI-Aangedreven App: Zelfde Workflow

Je hebt net een traditionele webapplicatie gedeployed. Maar wat als je een AI-aangedreven app wilt deployen — bijvoorbeeld een chatapplicatie ondersteund door Microsoft Foundry Models?

Het goede nieuws: **de workflow is identiek.**

| Stap | Klassieke Todo App | AI Chat App |
|------|-----------------|-------------|
| Initialiseren (lege map) | `azd init --template todo-nodejs-mongo .` | `azd init --template azure-search-openai-demo .` |
| Authenticeren | `azd auth login` | `azd auth login` |
| Deployen | `azd up` | `azd up` |
| Monitoren | `azd monitor` | `azd monitor` |
| Opruimen | `azd down --force --purge` | `azd down --force --purge` |

De lifecycle-commando’s zijn hetzelfde, maar de vereisten verschillen. Een AI-template kan modeltoegang, regionale quota, data-inname en extra configuratie vereisen. Lees de README voor deployment; `azd up` kan ontbrekende toestemmingen of quota niet leveren.

Dit is het kernprincipe van azd: **één workflow, elke workload.** De vaardigheden die je in deze tutorial hebt geoefend — initialiseren, deployen, monitoren, herdeployen en opruimen — zijn even toepasbaar op AI-applicaties en -agents.

---

## Wat Je Hebt Geleerd

Gefeliciteerd! Je hebt succesvol:
- ✅ Een azd-project vanuit een template geïnitieerd
- ✅ De projectstructuur en belangrijke bestanden verkend
- ✅ Een full-stack applicatie naar Azure gedeployed
- ✅ Code-veranderingen gemaakt en opnieuw gedeployed
- ✅ Meerdere omgevingen beheerd
- ✅ Resources opgeruimd

## 🎯 Vaardigheidsvalidatie Oefeningen

### Oefening 1: Deploy een Andere Template (15 minuten)
**Doel**: Beheersing aantonen van azd init en deployment workflow

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

**Succescriteria:**
- [ ] Applicatie deployt zonder fouten
- [ ] Toegang tot applicatie URL in browser mogelijk
- [ ] Applicatie functioneert correct (todos toevoegen/verwijderen)
- [ ] Succesvol alle resources opgeruimd

### Oefening 2: Pas Configuratie Aan (20 minuten)
**Doel**: Oefen in lokale opslag van omgevingswaarden zonder deze te verwarren met runtime-configuratie

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

**Succescriteria:**
- [ ] Aangepaste omgeving succesvol aangemaakt
- [ ] Omgevingsvariabelen ingesteld en opvraagbaar
- [ ] `azd env get-value APP_TITLE` print `My Custom Todo App`
- [ ] Kan uitleggen waarom deze waarden de standaardapp niet veranderen tenzij code/infrastructuur ze gebruikt

### Oefening 3: Multi-Environment Workflow (25 minuten)
**Doel**: Beheer van omgevingen en deployment strategieën beheersen

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

**Succescriteria:**
- [ ] Twee omgevingen gemaakt met verschillende configuraties
- [ ] Beide omgevingen succesvol gedeployed
- [ ] Kan wisselen tussen omgevingen met `azd env select`
- [ ] Omgevingsvariabelen verschillen tussen omgevingen
- [ ] Beide omgevingen succesvol opgeruimd

## 📊 Je Voortgang

**Bestede Tijd**: ~60-90 minuten  
**Verkregen Vaardigheden**:
- ✅ Template-gebaseerde projectinitialisatie
- ✅ Azure resource provisioning
- ✅ Applicatie deployment workflows
- ✅ Omgevingsbeheer
- ✅ Configuratiebeheer
- ✅ Resource cleanup en kostenbeheer

**Volgend Niveau**: Je bent klaar voor de [Configuratiehandleiding](../chapter-03-configuration/configuration.md) om geavanceerde configuratiepatronen te leren!

## Veelvoorkomende Problemen Oplossen

### Authenticatiefouten
```bash
# Re-authenticate with azd (az login does not refresh azd's default credentials)
azd auth login

# Verify the selected environment's subscription
azd env get-value AZURE_SUBSCRIPTION_ID
```

### Deploymentfouten
```bash
# Enable debug logging
azd up --debug

# View application logs in Azure
azd monitor --logs

# For Container Apps, use Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource Naamconflicten
```bash
# Use a unique environment name
azd env new dev-$(whoami)-$(date +%s)
```

### Poort/Netwerkproblemen
```bash
# Check if ports are available
netstat -an | grep :3000
netstat -an | grep :3100
```

## Volgende Stappen

Nu je je eerste project hebt voltooid, verken deze geavanceerde onderwerpen:

### 1. Pas Infrastructuur Aan
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Voeg database-infrastructuur toe](../chapter-04-infrastructure/provisioning.md#%EF%B8%8F-database-provisioning)

### 2. Stel CI/CD In
- [Deploymenthandleiding](../chapter-04-infrastructure/deployment-guide.md) - Compleet CI/CD workflows
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelineconfiguratie

### 3. Best Practices voor Productie
- [Deploymenthandleiding](../chapter-04-infrastructure/deployment-guide.md) - Beveiliging, prestaties en monitoring

### 4. Verken Meer Templates
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

## Extra Bronnen

### Leermaterialen
- [Azure Developer CLI Documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuur Centrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Gemeenschap & Ondersteuning
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Voorbeelden
- [Officiële Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Template Bijdragen](https://github.com/Azure/awesome-azd)
- [Todo Template Broncode](https://github.com/Azure-Samples/todo-nodejs-mongo)

---

**Gefeliciteerd met het voltooien van je eerste azd-project!** Je bent nu klaar om geweldige applicaties op Azure te bouwen en met vertrouwen te deployen.

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelle Start
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Breng Je Eigen App](bring-your-own-app.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->