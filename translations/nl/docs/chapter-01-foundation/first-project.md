# Your First Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD voor beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 1 - Basis & Snel aan de slag
- **⬅️ Previous**: [Installatie & Setup](installation.md)
- **➡️ Next**: [Configuratie](configuration.md)
- **🚀 Next Chapter**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Inleiding

Welkom bij je eerste Azure Developer CLI-project! Deze uitgebreide hands-on tutorial biedt een volledige walkthrough van het maken, implementeren en beheren van een full-stack applicatie op Azure met azd. Je werkt met een echte todo-applicatie die een React-frontend, Node.js API-backend en MongoDB-database bevat.

## Leerdoelen

Door deze tutorial te voltooien, zul je:
- De azd-projectinitialisatieworkflow met sjablonen beheersen
- De structuur van Azure Developer CLI-projecten en configuratiebestanden begrijpen
- Een volledige applicatie naar Azure implementeren met infrastructuurvoorziening
- Strategieën voor applicatie-updates en herimplementatie implementeren
- Meerdere omgevingen voor ontwikkeling en staging beheren
- Praktijken voor het opruimen van resources en kostenbeheer toepassen

## Leerresultaten

Na voltooiing kun je:
- Azd-projecten zelfstandig initialiseren en configureren vanuit sjablonen
- Azd-projectstructuren effectief navigeren en aanpassen
- Full-stack applicaties naar Azure implementeren met enkele commando's
- Veelvoorkomende implementatieproblemen en authenticatieproblemen oplossen
- Meerdere Azure-omgevingen beheren voor verschillende implementatiefases
- Continuous deployment-workflows voor applicatie-updates implementeren

## Aan de slag

### Checklist vereisten
- ✅ Azure Developer CLI geïnstalleerd ([Installatiehandleiding](installation.md))
- ✅ AZD-authenticatie voltooid met `azd auth login`
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 16+ (voor deze tutorial)
- ✅ Visual Studio Code (aanbevolen)

Voordat je verdergaat, voer de setup-validator uit vanuit de repository-root:

**Windows:** `./validate-setup.ps1`

**macOS / Linux:** `bash ./validate-setup.sh`

### Verifieer je setup
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

## Stap 1: Kies en initialiseer een sjabloon

Laten we beginnen met een populair todo-appsjabloon dat een React-frontend en een Node.js API-backend bevat.

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

### Wat is er net gebeurd?
- Het sjabloon is naar je lokale map gedownload
- Er is een `azure.yaml`-bestand gemaakt met servicedefinities
- Infrastructuurcode is opgezet in de `infra/`-map
- Een omgevingconfiguratie is aangemaakt

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

Voordat je implementeert, kun je de applicatie aanpassen:

### Pas de frontend aan
```bash
# Open het React-appcomponent
code src/web/src/App.tsx
```

Maak een eenvoudige wijziging:
```typescript
// Vind de titel en wijzig deze
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

## Stap 4: Implementeer naar Azure

Nu het spannende gedeelte - implementeer alles naar Azure!

```bash
# Implementeer infrastructuur en applicatie
azd up

# Dit commando zal:
# 1. Azure-resources inrichten (App Service, Cosmos DB, enz.)
# 2. Bouw uw applicatie
# 3. Uitrollen naar de ingerichte resources
# 4. Toon de applicatie-URL
```

### Wat gebeurt er tijdens de implementatie?

Het `azd up`-commando voert deze stappen uit:
1. **Provision** (`azd provision`) - Maakt Azure-resources aan
2. **Package** - Bouwt je applicatiecode
3. **Deploy** (`azd deploy`) - Implementeert code naar Azure-resources

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
Klik op de URL die in de implementatie-uitvoer wordt weergegeven, of haal deze op elk gewenst moment op:
```bash
# Haal applicatie-eindpunten op
azd show

# Open de applicatie in je browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test de Todo-app
1. **Voeg een todo-item toe** - Klik op "Todo toevoegen" en voer een taak in
2. **Markeer als voltooid** - Vink voltooide items af
3. **Verwijder items** - Verwijder todo's die je niet meer nodig hebt

### Monitor je applicatie
```bash
# Open het Azure-portal voor uw bronnen
azd monitor

# Bekijk applicatielogboeken
azd monitor --logs

# Bekijk realtimestatistieken
azd monitor --live
```

## Stap 6: Maak wijzigingen en herimplementeer

Laten we een wijziging aanbrengen en kijken hoe eenvoudig het is om bij te werken:

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

### Implementeer alleen de codewijzigingen
```bash
# Implementeer alleen de applicatiecode (sla infrastructuur over)
azd deploy

# Dit is veel sneller dan 'azd up' omdat de infrastructuur al bestaat
```

## Stap 7: Beheer meerdere omgevingen

Maak een staging-omgeving om wijzigingen te testen voordat je naar productie gaat:

```bash
# Maak een nieuwe staging-omgeving
azd env new staging

# Rol uit naar de staging-omgeving
azd up

# Schakel terug naar de dev-omgeving
azd env select dev

# Toon alle omgevingen
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

Wanneer je klaar bent met experimenteren, ruim je op om doorlopende kosten te voorkomen:

```bash
# Verwijder alle Azure-resources voor de huidige omgeving
azd down

# Forceer verwijderen zonder bevestiging en maak soft-verwijderde resources permanent verwijderd
azd down --force --purge

# Verwijder specifieke omgeving
azd env select staging
azd down --force --purge
```

## Klassieke app vs. AI-aangedreven app: dezelfde workflow

Je hebt net een traditionele webapplicatie geïmplementeerd. Maar wat als je in plaats daarvan een AI-aangedreven app wilde implementeren — bijvoorbeeld een chatapplicatie ondersteund door Microsoft Foundry Models?

Het goede nieuws: **de workflow is identiek.**

| Stap | Klassieke Todo-app | AI Chat-app |
|------|-----------------|-------------|
| Initialize | `azd init --template todo-nodejs-mongo` | `azd init --template azure-search-openai-demo` |
| Authenticate | `azd auth login` | `azd auth login` |
| Deploy | `azd up` | `azd up` |
| Monitor | `azd monitor` | `azd monitor` |
| Clean up | `azd down --force --purge` | `azd down --force --purge` |

Het enige verschil is het **sjabloon** waarmee je begint. Een AI-sjabloon bevat extra infrastructuur (zoals een Microsoft Foundry Models-resource of een AI Search-index), maar azd regelt dat allemaal voor je. Je hoeft geen nieuwe commando's te leren, geen ander hulpmiddel te gebruiken of je denkwijze over implementatie te veranderen.

Dit is het kernprincipe van azd: **één workflow, elk soort workload.** De vaardigheden die je in deze tutorial hebt geoefend — initialiseren, implementeren, monitoren, herimplementeren en opruimen — zijn even toepasbaar op AI-toepassingen en agents.

---

## Wat je hebt geleerd

Gefeliciteerd! Je hebt succesvol:
- ✅ Een azd-project geïnitialiseerd vanuit een sjabloon
- ✅ De projectstructuur en belangrijke bestanden verkend
- ✅ Een full-stack applicatie naar Azure geïmplementeerd
- ✅ Codewijzigingen aangebracht en opnieuw geïmplementeerd
- ✅ Meerdere omgevingen beheerd
- ✅ Resources opgeruimd

## 🎯 Vaardigheidsvalidatie-oefeningen

### Oefening 1: Implementeer een ander sjabloon (15 minuten)
**Doel**: Beheersing aantonen van azd init en implementatieworkflow

```bash
# Probeer de Python + MongoDB-stack
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
- [ ] Applicatie wordt zonder fouten geïmplementeerd
- [ ] Toegang tot applicatie-URL in de browser mogelijk
- [ ] Applicatie functioneert correct (toevoegen/verwijderen van todos)
- [ ] Alle resources succesvol opgeruimd

### Oefening 2: Pas configuratie aan (20 minuten)
**Doel**: Oefen met configuratie van omgevingsvariabelen

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
- [ ] Applicatie geïmplementeerd met aangepaste configuratie
- [ ] Aangepaste instellingen kunnen worden geverifieerd in de geïmplementeerde app

### Oefening 3: Multi-omgeving-workflow (25 minuten)
**Doel**: Beheer van omgevingen en implementatiestrategieën beheersen

```bash
# Maak ontwikkelomgeving aan
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noteer URL van de ontwikkelomgeving
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Maak staging-omgeving aan
azd env new staging-$(whoami)
azd env set ENVIRONMENT_TYPE staging
azd env set LOG_LEVEL info
azd up

# Noteer URL van de staging-omgeving
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
- [ ] Beide omgevingen succesvol geïmplementeerd
- [ ] Wisselen tussen omgevingen met `azd env select` mogelijk
- [ ] Omgevingsvariabelen verschillen tussen omgevingen
- [ ] Beide omgevingen succesvol opgeruimd

## 📊 Je voortgang

**Tijd besteed**: ~60-90 minuten  
**Verworven vaardigheden**:
- ✅ Sjabloon-gebaseerde projectinitialisatie
- ✅ Azure-resourcevoorziening
- ✅ Applicatie-implementatieworkflows
- ✅ Omgevingsbeheer
- ✅ Configuratiemanagement
- ✅ Resource-opruiming en kostenbeheer

**Volgende stap**: Je bent klaar voor de [Configuratiehandleiding](configuration.md) om geavanceerde configuratiepatronen te leren!

## Problemen oplossen: veelvoorkomende issues

### Authenticatiefouten
```bash
# Opnieuw authenticeren bij Azure
az login

# Controleer toegang tot het abonnement
az account show
```

### Fouten bij implementatie
```bash
# Schakel debuglogging in
export AZD_DEBUG=true
azd up --debug

# Bekijk applicatielogs in Azure
azd monitor --logs

# Voor Container Apps, gebruik de Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflicten met resourcenamen
```bash
# Gebruik een unieke omgevingsnaam
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
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Voeg databases, opslag en andere services toe](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Stel CI/CD in
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Complete CI/CD-workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelineconfiguratie

### 3. Best practices voor productie
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Beveiliging, prestaties en monitoring

### 4. Ontdek meer sjablonen
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
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & ondersteuning
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Sjablonen & voorbeelden
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

Gefeliciteerd met het voltooien van je eerste azd-project! Je bent nu klaar om met vertrouwen geweldige applicaties op Azure te bouwen en te implementeren.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD voor beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 1 - Basis & Snel aan de slag
- **⬅️ Previous**: [Installatie & Setup](installation.md)
- **➡️ Next**: [Configuratie](configuration.md)
- **🚀 Next Chapter**: [Hoofdstuk 2: AI-first ontwikkeling](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of misinterpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->