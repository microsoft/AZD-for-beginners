# Je Eerste Project - Praktische handleiding

**Hoofdstuknavigatie:**
- **📚 Cursus Start**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelstart
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Configuratie](configuration.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introductie

Welkom bij je eerste Azure Developer CLI-project! Deze uitgebreide praktische tutorial biedt een complete rondleiding voor het maken, deployen en beheren van een full-stack applicatie op Azure met azd. Je werkt met een echte todo-applicatie die een React-frontend, een Node.js API-backend en een MongoDB-database bevat.

## Leerdoelen

Door deze tutorial te voltooien, zul je:
- Beheers de azd-projectinitialisatieworkflow met templates
- Begrijp de projectstructuur en configuratiebestanden van Azure Developer CLI
- Voer volledige applicatiedeployments uit naar Azure inclusief infrastructuurvoorziening
- Implementeer applicatie-updates en herdeploystrategieën
- Beheer meerdere omgevingen voor ontwikkeling en staging
- Pas resource-opruiming en kostenbeheerspraktijken toe

## Leerresultaten

Na voltooiing kun je:
- Azd-projecten vanuit templates initialiseren en configureren zonder hulp
- Effectief navigeren en wijzigingen aanbrengen in azd-projectstructuren
- Full-stack applicaties naar Azure deployen met enkele commando's
- Veelvoorkomende deploymentproblemen en authenticatieproblemen oplossen
- Meerdere Azure-omgevingen beheren voor verschillende deploymentfasen
- Continue deployment-workflows implementeren voor applicatie-updates

## Aan de slag

### Vereisten
- ✅ Azure Developer CLI geïnstalleerd ([Installatiegids](installation.md))
- ✅ AZD-authenticatie voltooid met `azd auth login`
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 16+ (voor deze tutorial)
- ✅ Visual Studio Code (aanbevolen)

Voordat je verdergaat, voer de setup-validator uit vanaf de repository-root:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Controleer je setup
```bash
# Controleer azd-installatie
azd version

# Controleer AZD-authenticatie
azd auth login --check-status
```

### Verifieer optionele Azure CLI-authenticatie

```bash
az account show
```

### Controleer Node.js-versie
```bash
node --version
```

## Stap 1: Kies en initialiseer een template

Laten we beginnen met een populair todo-applicatie-template dat een React-frontend en een Node.js API-backend bevat.

```bash
# Blader door beschikbare sjablonen
azd template list

# Initialiseer het todo-appsjabloon
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Volg de aanwijzingen:
# - Voer een omgevingsnaam in: "dev"
# - Kies een abonnement (als je er meerdere hebt)
# - Kies een regio: "East US 2" (of je voorkeursregio)
```

### Wat is er zojuist gebeurd?
- De templatecode naar je lokale map gedownload
- Een `azure.yaml`-bestand aangemaakt met servicedefinities
- Infrastructuurcode opgezet in de `infra/`-map
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

Voordat je deployt, kun je de applicatie aanpassen:

### Pas de frontend aan
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

Nu het spannende gedeelte - deploy alles naar Azure!

```bash
# Implementeer infrastructuur en applicatie
azd up

# Dit commando zal:
# 1. Azure-resources provisioneren (App Service, Cosmos DB, enz.)
# 2. Bouw uw applicatie
# 3. Deployen naar de aangemaakte resources
# 4. Toon de applicatie-URL
```

### Wat gebeurt er tijdens het deployen?

Het `azd up`-commando voert de volgende stappen uit:
1. **Provision** (`azd provision`) - Maakt Azure-resources aan
2. **Package** - Bouwt je applicatiecode
3. **Deploy** (`azd deploy`) - Deployt code naar Azure-resources

### Verwachte uitvoer
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
Klik op de URL die in de deployment-uitvoer wordt weergegeven, of haal deze op wanneer je wilt:
```bash
# Haal de applicatie-eindpunten op
azd show

# Open de applicatie in uw browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test de Todo-app
1. **Een todo-item toevoegen** - Klik op "Add Todo" en voer een taak in
2. **Markeer als voltooid** - Vink voltooide items aan
3. **Items verwijderen** - Verwijder todo's die je niet meer nodig hebt

### Bewaak je applicatie
```bash
# Open het Azure-portaal voor uw bronnen
azd monitor

# Bekijk applicatielogboeken
azd monitor --logs

# Bekijk realtime statistieken
azd monitor --live
```

### ✅ Verifieer je deployment

Voordat je verdergaat, doorloop deze snelle checklist om te bevestigen dat alles echt werkt—ga er niet van uit dat "deploy succeeded" betekent "app werkt":

```bash
# 1. Bevestig dat het eindpunt bestaat en bereikbaar is
azd show

# 2. Voer een smoketest uit op het eindpunt (verwacht HTTP 200)
curl -I "$(azd show --output json | jq -r '.services.web.endpoint')"

# 3. Controleer het health-eindpunt als je app er een aanbiedt
curl "$(azd show --output json | jq -r '.services.web.endpoint')/health"
```

**Deployment is geverifieerd wanneer:**
- ✅ `azd show` toont een bereikbare endpoint-URL
- ✅ De URL opent in je browser zonder fouten
- ✅ Kernfuncties werken (toevoegen/voltooien/verwijderen van een todo)
- ✅ `azd monitor --logs` toont binnenkomende verzoeken zonder onverwachte fouten

Als een controle faalt, ga dan naar [Hoofdstuk 7: Problemen oplossen](../chapter-07-troubleshooting/README.md).

## Stap 6: Breng wijzigingen aan en herdeploy

Laten we een wijziging doorvoeren en kijken hoe eenvoudig het is om bij te werken:

### Pas de API aan
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

# Dit is veel sneller dan 'azd up', omdat de infrastructuur al bestaat
```

## Stap 7: Beheer meerdere omgevingen

Maak een staging-omgeving om wijzigingen te testen vóór productie:

```bash
# Maak een nieuwe staging-omgeving
azd env new staging

# Naar staging uitrollen
azd up

# Schakel terug naar de dev-omgeving
azd env select dev

# Geef alle omgevingen weer
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

## Stap 8: Ruim resources op

Als je klaar bent met experimenteren, ruim dan op om voortdurende kosten te voorkomen:

```bash
# Verwijder alle Azure-resources voor de huidige omgeving
azd down

# Forceer verwijderen zonder bevestiging en permanent verwijderen van soft-verwijderde resources
azd down --force --purge

# Verwijder specifieke omgeving
azd env select staging
azd down --force --purge
```

## Klassieke app versus AI-aangedreven app: dezelfde workflow

Je hebt zojuist een traditionele webapplicatie gedeployed. Maar wat als je in plaats daarvan een AI-aangedreven app wilde deployen — bijvoorbeeld een chatapplicatie ondersteund door Microsoft Foundry Models?

Het goede nieuws: **de workflow is identiek.**

| Stap | Klassieke Todo-app | AI Chat-app |
|------|--------------------|-------------|
| Initialiseren | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticatie | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitoren | `azd monitor` | `azd monitor` |
| Opruimen | `azd down --force --purge` | `azd down --force --purge` |

Het enige verschil is het **template** waarmee je begint. Een AI-template bevat extra infrastructuur (zoals een Microsoft Foundry Models-resource of een AI Search-index), maar azd regelt dat allemaal voor je. Je hoeft geen nieuwe commando's te leren, geen ander gereedschap te gebruiken, of je manier van denken over deployment te veranderen.

Dit is het kernprincipe van azd: **één workflow, elke workload.** De vaardigheden die je in deze tutorial hebt geoefend—initialiseren, deployen, monitoren, herdeployen en opruimen—zijn evenzeer van toepassing op AI-applicaties en agents.

---

## Wat je hebt geleerd

Gefeliciteerd! Je hebt succesvol:
- ✅ Een azd-project vanuit een template geïnitialiseerd
- ✅ De projectstructuur en belangrijke bestanden verkend
- ✅ Een full-stack applicatie naar Azure gedeployed
- ✅ Codewijzigingen aangebracht en herdeployed
- ✅ Meerdere omgevingen beheerd
- ✅ Resources opgeruimd

## 🎯 Vaardigheidsvalidatie-oefeningen

### Oefening 1: Deploy een ander template (15 minuten)
**Doel**: Toon beheersing van azd init en de deployment-workflow

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
- [ ] Applicatie wordt gedeployed zonder fouten
- [ ] Kan de applicatie-URL in de browser openen
- [ ] Applicatie werkt correct (todo's toevoegen/verwijderen)
- [ ] Alle resources succesvol opgeruimd

### Oefening 2: Pas de configuratie aan (20 minuten)
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
- [ ] Applicatie gedeployed met aangepaste configuratie
- [ ] Kan aangepaste instellingen in de gedeployde app verifiëren

### Oefening 3: Workflow voor meerdere omgevingen (25 minuten)
**Doel**: Beheers het beheer van omgevingen en deploymentstrategieën

```bash
# Maak ontwikkelomgeving aan
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noteer ontwikkel-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Maak staging-omgeving aan
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
- [ ] Kan schakelen tussen omgevingen met `azd env select`
- [ ] Omgevingsvariabelen verschillen tussen de omgevingen
- [ ] Beide omgevingen succesvol opgeruimd

## 📊 Je voortgang

**Tijdsbesteding**: ~60-90 minuten  
**Verworven vaardigheden**:
- ✅ Template-gebaseerde projectinitialisatie
- ✅ Azure-resourcevoorziening
- ✅ Applicatie-deployworkflows
- ✅ Omgevingsbeheer
- ✅ Configuratiebeheer
- ✅ Opruimen van resources en kostenbeheer

**Volgend niveau**: Je bent klaar voor de [Configuratiegids](configuration.md) om geavanceerde configuratiepatronen te leren!

## Problemen oplossen

### Authenticatiefouten
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

# Bekijk applicatielogboeken in Azure
azd monitor --logs

# Voor Container Apps gebruikt u de Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflicten in resource-namen
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

Nu je je eerste project hebt voltooid, verken deze geavanceerde onderwerpen:

### 1. Pas infrastructuur aan
- [Infrastructuur als Code](../chapter-04-infrastructure/provisioning.md)
- [Databases, opslag en andere services toevoegen](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Stel CI/CD in
- [Implementatiegids](../chapter-04-infrastructure/deployment-guide.md) - Volledige CI/CD-workflows
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pijplijnconfiguratie

### 3. Best practices voor productie
- [Implementatiegids](../chapter-04-infrastructure/deployment-guide.md) - Beveiliging, prestaties en monitoring

### 4. Verken meer templates
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
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architectuurcentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & ondersteuning
- [Azure Developer CLI op GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & voorbeelden
- [Officiële template-galerij](https://azure.github.io/awesome-azd/)
- [Community-templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise-patronen](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gefeliciteerd met het voltooien van je eerste azd-project!** Je bent nu klaar om fantastische applicaties op Azure te bouwen en met vertrouwen te deployen.

---

**Hoofdstuknavigatie:**
- **📚 Cursus Start**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelstart
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Bring Your Own App](bring-your-own-app.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->