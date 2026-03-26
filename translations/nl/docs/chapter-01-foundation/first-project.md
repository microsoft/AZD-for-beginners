# Je Eerste Project - Hands-On Tutorial

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD For Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Foundation & Quick Start
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Configuratie](configuration.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introductie

Welkom bij je eerste Azure Developer CLI-project! Deze uitgebreide hands-on tutorial biedt een complete walkthrough voor het maken, implementeren en beheren van een full-stack applicatie op Azure met azd. Je werkt met een echte todo-applicatie die een React-frontend, een Node.js API-backend en een MongoDB-database bevat.

## Leerdoelen

Door deze tutorial te voltooien, zul je:
- De azd-projectinitialisatieworkflow met sjablonen beheersen
- De projectstructuur en configuratiebestanden van Azure Developer CLI begrijpen
- Een volledige applicatie naar Azure implementeren inclusief het provisioen van infrastructuur
- Strategieën voor het bijwerken en opnieuw implementeren van applicaties toepassen
- Meerdere omgevingen voor ontwikkeling en staging beheren
- Praktijken voor het opruimen van resources en kostenbeheer toepassen

## Leerresultaten

Na voltooiing kun je:
- Azd-projecten uit sjablonen initialiseren en configureren
- Effectief door azd-projectstructuren navigeren en deze aanpassen
- Full-stack applicaties naar Azure deployen met één commando
- Algemene problemen bij implementatie en authenticatie oplossen
- Meerdere Azure-omgevingen beheren voor verschillende implementatiefasen
- Continue implementatie-workflows opzetten voor applicatie-updates

## Aan de slag

### Checklist Vereisten
- ✅ Azure Developer CLI geïnstalleerd ([Installatiegids](installation.md))
- ✅ Azure CLI geïnstalleerd en geauthenticeerd
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 16+ (voor deze tutorial)
- ✅ Visual Studio Code (aanbevolen)

### Controleer je setup
```bash
# Controleer of azd is geïnstalleerd
azd version
```
### Azure-authenticatie verifiëren

```bash
az account show
```

### Controleer de Node.js-versie
```bash
node --version
```

## Stap 1: Kies en initialiseer een sjabloon

Laten we beginnen met een populair todo-app-sjabloon dat een React-frontend en een Node.js API-backend bevat.

```bash
# Blader door beschikbare sjablonen
azd template list

# Initialiseer de todo-appsjabloon
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Volg de aanwijzingen:
# - Voer een omgevingsnaam in: "dev"
# - Kies een abonnement (als je er meerdere hebt)
# - Kies een regio: "East US 2" (of je voorkeursregio)
```

### Wat is er net gebeurd?
- Het sjablooncode naar je lokale map gedownload
- Een `azure.yaml`-bestand aangemaakt met servicedefinities
- Infrastructuurcode opgezet in de `infra/` map
- Een omgevingsconfiguratie aangemaakt

## Stap 2: Verken de projectstructuur

Laten we bekijken wat azd voor ons heeft aangemaakt:

```bash
# Bekijk de projectstructuur
tree /f   # Windows
# of
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

### Belangrijke bestanden om te begrijpen

**azure.yaml** - Het hart van je azd-project:
```bash
# Bekijk de projectconfiguratie
cat azure.yaml
```

**infra/main.bicep** - Infrastructuurdefinitie:
```bash
# Bekijk de infrastructuurcode
head -30 infra/main.bicep
```

## Stap 3: Pas je project aan (optioneel)

Voordat je gaat deployen, kun je de applicatie aanpassen:

### Wijzig de frontend
```bash
# Open de React-appcomponent
code src/web/src/App.tsx
```

Maak een eenvoudige wijziging:
```typescript
// Zoek de titel en wijzig deze
<h1>My Awesome Todo App</h1>
```

### Configureer omgevingsvariabelen
```bash
# Stel aangepaste omgevingsvariabelen in
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Bekijk alle omgevingsvariabelen
azd env get-values
```

## Stap 4: Deploy naar Azure

Nu het spannende gedeelte - implementeer alles naar Azure!

```bash
# Infrastructuur en applicatie uitrollen
azd up

# Dit commando zal:
# 1. Azure-resources inrichten (App Service, Cosmos DB, enz.)
# 2. Uw applicatie bouwen
# 3. Naar de ingerichte resources uitrollen
# 4. De applicatie-URL weergeven
```

### Wat gebeurt er tijdens de implementatie?

Het `azd up`-commando voert deze stappen uit:
1. **Provision** (`azd provision`) - Maakt Azure-resources aan
2. **Package** - Bouwt je applicatiecode
3. **Deploy** (`azd deploy`) - Implementeert code naar Azure-resources

### Verwachte output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Stap 5: Test je applicatie

### Toegang tot je applicatie
Klik op de URL die in de implementatie-uitvoer is gegeven, of haal deze op wanneer je maar wilt:
```bash
# Haal de applicatie-eindpunten op
azd show

# Open de applicatie in uw browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test de Todo-app
1. **Add a todo** - Klik "Add Todo" en voer een taak in
2. **Mark as complete** - Vink voltooide items aan
3. **Delete items** - Verwijder todo's die je niet meer nodig hebt

### Monitor je applicatie
```bash
# Open het Azure-portaal voor uw resources
azd monitor

# Bekijk applicatielogboeken
azd monitor --logs

# Bekijk live statistieken
azd monitor --live
```

## Stap 6: Breng wijzigingen aan en redeploy

Laten we een wijziging aanbrengen en zien hoe eenvoudig het is om bij te werken:

### Wijzig de API
```bash
# Bewerk de API-code
code src/api/src/routes/lists.js
```

Voeg een aangepaste response-header toe:
```javascript
// Zoek een routehandler en voeg toe:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Deploy alleen de codewijzigingen
```bash
# Implementeer alleen de applicatiecode (sla de infrastructuur over)
azd deploy

# Dit is veel sneller dan 'azd up' omdat de infrastructuur al bestaat
```

## Stap 7: Beheer meerdere omgevingen

Maak een staging-omgeving om wijzigingen te testen voordat ze naar productie gaan:

```bash
# Maak een nieuwe staging-omgeving
azd env new staging

# Deploy naar staging
azd up

# Schakel terug naar de dev-omgeving
azd env select dev

# Lijst alle omgevingen
azd env list
```

### Omgevingsvergelijking
```bash
# Bekijk ontwikkelomgeving
azd env select dev
azd show

# Bekijk staging-omgeving
azd env select staging
azd show
```

## Stap 8: Resources opruimen

Als je klaar bent met experimenteren, ruim dan op om doorlopende kosten te voorkomen:

```bash
# Verwijder alle Azure-resources voor de huidige omgeving
azd down

# Gedwongen verwijderen zonder bevestiging en soft-verwijderde resources permanent verwijderen
azd down --force --purge

# Verwijder specifieke omgeving
azd env select staging
azd down --force --purge
```

## Klassieke app vs. AI-aangedreven app: dezelfde workflow

Je hebt zojuist een traditionele webapplicatie gedeployed. Maar wat als je in plaats daarvan een AI-aangedreven app wilt deployen — bijvoorbeeld een chatapplicatie ondersteund door Microsoft Foundry Models?

Het goede nieuws: **de workflow is identiek.**

| Stap | Klassieke Todo-app | AI Chat-app |
|------|--------------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Het enige verschil is het **sjabloon** waar je mee begint. Een AI-sjabloon bevat extra infrastructuur (zoals een Microsoft Foundry Models-resource of een AI Search-index), maar azd regelt dat allemaal voor je. Je hoeft geen nieuwe commando's te leren, geen ander gereedschap te gebruiken, of je denkwijze over implementatie te veranderen.

Dit is het kernprincipe van azd: **één workflow, elk workload.** De vaardigheden die je in deze tutorial hebt geoefend — initialiseren, implementeren, monitoren, opnieuw implementeren en opruimen — zijn even goed toepasbaar op AI-applicaties en agents.

---

## Wat je hebt geleerd

Gefeliciteerd! Je hebt succesvol:
- ✅ Een azd-project geïnitialiseerd vanaf een sjabloon
- ✅ De projectstructuur en belangrijke bestanden verkend
- ✅ Een full-stack applicatie naar Azure gedeployed
- ✅ Codewijzigingen aangebracht en opnieuw gedeployed
- ✅ Meerdere omgevingen beheerd
- ✅ Resources opgeschoond

## 🎯 Oefeningen ter validering van vaardigheden

### Oefening 1: Een ander sjabloon deployen (15 minuten)
**Doel**: Beheersing demonstreren van azd init en de deployment-workflow

```bash
# Probeer Python + MongoDB-stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Controleer de uitrol
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Ruim op
azd down --force --purge
```

**Succescriteria:**
- [ ] Applicatie deployed zonder fouten
- [ ] Kan de applicatie-URL in de browser openen
- [ ] Applicatie functioneert correct (todos toevoegen/verwijderen)
- [ ] Alle resources succesvol opgeruimd

### Oefening 2: Configuratie aanpassen (20 minuten)
**Doel**: Oefen met het configureren van omgevingsvariabelen

```bash
cd my-first-azd-app

# Maak een aangepaste omgeving
azd env new custom-config

# Stel aangepaste variabelen in
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Controleer variabelen
azd env get-values | grep APP_TITLE

# Implementeer met aangepaste configuratie
azd up
```

**Succescriteria:**
- [ ] Aangepaste omgeving succesvol aangemaakt
- [ ] Omgevingsvariabelen ingesteld en opvraagbaar
- [ ] Applicatie deployed met aangepaste configuratie
- [ ] Aangepaste instellingen verifieerbaar in de gedeployde app

### Oefening 3: Workflow voor meerdere omgevingen (25 minuten)
**Doel**: Beheers het beheer van omgevingen en deployment-strategieën

```bash
# Maak ontwikkelomgeving
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noteer dev-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Maak staging-omgeving
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Noteer staging-URL
STAGING_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Staging: $STAGING_URL"

# Vergelijk omgevingen
azd env list

# Test beide omgevingen
curl "$DEV_URL/health"
curl "$STAGING_URL/health"

# Ruim beide op
azd env select dev-$(whoami) && azd down --force --purge
azd env select staging-$(whoami) && azd down --force --purge
```

**Succescriteria:**
- [ ] Twee omgevingen aangemaakt met verschillende configuraties
- [ ] Beide omgevingen succesvol gedeployed
- [ ] Kan wisselen tussen omgevingen met `azd env select`
- [ ] Omgevingsvariabelen verschillen tussen omgevingen
- [ ] Beide omgevingen succesvol opgeruimd

## 📊 Je voortgang

**Besteedde tijd**: ~60-90 minuten  
**Verworven vaardigheden**:
- ✅ Sjabloon-gebaseerde projectinitialisatie
- ✅ Azure-resourceprovisioning
- ✅ Applicatie-implementatie-workflows
- ✅ Omgevingsbeheer
- ✅ Configuratiemanagement
- ✅ Resources opruimen en kostenbeheer

**Volgend niveau**: Je bent klaar voor de [Configuratiegids](configuration.md) om geavanceerde configuratiepatronen te leren!

## Veelvoorkomende problemen oplossen

### Authenticatie-fouten
```bash
# Opnieuw authenticeren bij Azure
az login

# Controleer toegang tot het abonnement
az account show
```

### Deployment-fouten
```bash
# Schakel debuglogging in
export AZD_DEBUG=true
azd up --debug

# Bekijk toepassingslogboeken in Azure
azd monitor --logs

# Voor Container Apps, gebruik de Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Resource-naamconflicten
```bash
# Gebruik een unieke naam voor de omgeving
azd env new dev-$(whoami)-$(date +%s)
```

### Poort-/netwerkproblemen
```bash
# Controleer of poorten beschikbaar zijn
netstat -an | grep :3000
netstat -an | grep :3100
```

## Volgende stappen

Nu je je eerste project hebt voltooid, verken deze gevorderde onderwerpen:

### 1. Pas infrastructuur aan
- [Infrastructuur als code](../chapter-04-infrastructure/provisioning.md)
- [Voeg databases, opslag en andere services toe](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Stel CI/CD in
- [Deploymentgids](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD-workflows
- [Documentatie Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelineconfiguratie

### 3. Best practices voor productie
- [Deploymentgids](../chapter-04-infrastructure/deployment-guide.md) - Beveiliging, prestatie en monitoring

### 4. Verken meer sjablonen
```bash
# Blader door sjablonen per categorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Probeer verschillende technologiestacks
azd init --template todo-python-mongo
azd init --template todo-csharp-sql
azd init --template todo-java-mongo
```

## Aanvullende bronnen

### Leermaterialen
- [Documentatie Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Ondersteuning
- [Azure Developer CLI op GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sjablonen & Voorbeelden
- [Officiële sjabloongalerij](https://azure.github.io/awesome-azd/)
- [Community-sjablonen](https://github.com/Azure-Samples/azd-templates)
- [Enterprise-patronen](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gefeliciteerd met het voltooien van je eerste azd-project!** Je bent nu klaar om met vertrouwen geweldige applicaties op Azure te bouwen en te deployen.

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD For Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Foundation & Quick Start
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Configuratie](configuration.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Volgende Les**: [Deploymentgids](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vrijwaring**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties voortvloeiend uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->