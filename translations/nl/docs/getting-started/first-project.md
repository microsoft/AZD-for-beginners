# Je Eerste Project - Praktische Handleiding

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelstart
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Configuratie](configuration.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../microsoft-foundry/microsoft-foundry-integration.md)

## Introductie

Welkom bij je eerste Azure Developer CLI-project! Deze uitgebreide praktische handleiding biedt een volledige walkthrough voor het maken, implementeren en beheren van een full-stack applicatie op Azure met behulp van azd. Je werkt met een echte todo-applicatie die een React-frontend, Node.js API-backend en MongoDB-database bevat.

## Leerdoelen

Door deze handleiding te voltooien, leer je:
- Het azd-projectinitiatieworkflow beheersen met behulp van sjablonen
- De structuur en configuratiebestanden van Azure Developer CLI-projecten begrijpen
- Een volledige applicatie implementeren op Azure met infrastructuurvoorziening
- Applicatie-updates en herimplementatiestrategieën uitvoeren
- Meerdere omgevingen beheren voor ontwikkeling en staging
- Praktijken toepassen voor het opruimen van resources en kostenbeheer

## Leerresultaten

Na voltooiing kun je:
- Zelfstandig azd-projecten initialiseren en configureren vanuit sjablonen
- Effectief navigeren en wijzigingen aanbrengen in azd-projectstructuren
- Full-stack applicaties implementeren op Azure met enkele commando's
- Veelvoorkomende implementatieproblemen en authenticatieproblemen oplossen
- Meerdere Azure-omgevingen beheren voor verschillende implementatiefasen
- Continue implementatieworkflows toepassen voor applicatie-updates

## Aan de Slag

### Vereisten Checklist
- ✅ Azure Developer CLI geïnstalleerd ([Installatiehandleiding](installation.md))
- ✅ Azure CLI geïnstalleerd en geauthenticeerd
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 16+ (voor deze handleiding)
- ✅ Visual Studio Code (aanbevolen)

### Controleer je Setup
```bash
# Controleer azd installatie
azd version
```
### Controleer Azure-authenticatie

```bash
az account show
```

### Controleer Node.js-versie
```bash
node --version
```

## Stap 1: Kies en Initialiseer een Sjabloon

Laten we beginnen met een populaire todo-applicatiesjabloon die een React-frontend en Node.js API-backend bevat.

```bash
# Blader door beschikbare sjablonen
azd template list

# Initialiseer de todo-app sjabloon
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Volg de aanwijzingen:
# - Voer een omgevingsnaam in: "dev"
# - Kies een abonnement (als je er meerdere hebt)
# - Kies een regio: "East US 2" (of je voorkeurregio)
```

### Wat is er net gebeurd?
- De sjablooncode is gedownload naar je lokale map
- Een `azure.yaml`-bestand is aangemaakt met servicedefinities
- Infrastructuurcode is ingesteld in de map `infra/`
- Een omgevingsconfiguratie is aangemaakt

## Stap 2: Verken de Projectstructuur

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

### Belangrijke Bestanden om te Begrijpen

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

## Stap 3: Pas je Project aan (Optioneel)

Voordat je implementeert, kun je de applicatie aanpassen:

### Wijzig de Frontend
```bash
# Open de React-appcomponent
code src/web/src/App.tsx
```

Maak een eenvoudige wijziging:
```typescript
// Zoek de titel en wijzig deze
<h1>My Awesome Todo App</h1>
```

### Configureer Omgevingsvariabelen
```bash
# Stel aangepaste omgevingsvariabelen in
azd env set WEBSITE_TITLE "My First AZD App"
azd env set API_VERSION "v1.18"
# Bekijk alle omgevingsvariabelen
azd env get-values
```

## Stap 4: Implementeer naar Azure

Nu het spannende deel - alles implementeren naar Azure!

```bash
# Implementeer infrastructuur en applicatie
azd up

# Deze opdracht zal:
# 1. Azure-resources inrichten (App Service, Cosmos DB, etc.)
# 2. Uw applicatie bouwen
# 3. Implementeren naar de ingerichte resources
# 4. De applicatie-URL weergeven
```

### Wat gebeurt er tijdens de Implementatie?

Het commando `azd up` voert de volgende stappen uit:
1. **Provision** (`azd provision`) - Maakt Azure-resources aan
2. **Package** - Bouwt je applicatiecode
3. **Deploy** (`azd deploy`) - Implementeert code naar Azure-resources

### Verwachte Output
```
Packaging services (azd package)

SUCCESS: Your up workflow to provision and deploy to Azure completed in 4 minutes 32 seconds.

You can view the resources created under the resource group rg-my-first-azd-app-dev in the Azure portal:
https://portal.azure.com/#@/resource/subscriptions/{subscription-id}/resourceGroups/rg-my-first-azd-app-dev

Navigate to the Todo app at:
https://app-web-abc123def.azurewebsites.net
```

## Stap 5: Test je Applicatie

### Toegang tot je Applicatie
Klik op de URL die wordt weergegeven in de implementatie-output, of haal deze op elk moment op:
```bash
# Haal applicatie-eindpunten op
azd show

# Open de applicatie in uw browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test de Todo-App
1. **Voeg een todo-item toe** - Klik op "Add Todo" en voer een taak in
2. **Markeer als voltooid** - Vink voltooide items aan
3. **Verwijder items** - Verwijder todo's die je niet meer nodig hebt

### Monitor je Applicatie
```bash
# Open Azure portal voor uw resources
azd monitor

# Bekijk applicatielogs
azd logs
```

## Stap 6: Wijzigingen Aanbrengen en Herimplementeren

Laten we een wijziging aanbrengen en zien hoe eenvoudig het is om bij te werken:

### Wijzig de API
```bash
# Bewerk de API-code
code src/api/src/routes/lists.js
```

Voeg een aangepaste response header toe:
```javascript
// Zoek een routehandler en voeg toe:
res.header('X-Powered-By', 'Azure Developer CLI');
```

### Implementeer Alleen de Codewijzigingen
```bash
# Alleen de applicatiecode implementeren (infrastructuur overslaan)
azd deploy

# Dit is veel sneller dan 'azd up' aangezien de infrastructuur al bestaat
```

## Stap 7: Beheer Meerdere Omgevingen

Maak een stagingomgeving om wijzigingen te testen voordat je naar productie gaat:

```bash
# Maak een nieuwe stagingomgeving
azd env new staging

# Implementeer naar staging
azd up

# Schakel terug naar de ontwikkelomgeving
azd env select dev

# Lijst alle omgevingen op
azd env list
```

### Omgevingsvergelijking
```bash
# Bekijk ontwikkelomgeving
azd env select dev
azd show

# Bekijk stagingomgeving
azd env select staging
azd show
```

## Stap 8: Ruim Resources op

Als je klaar bent met experimenteren, ruim dan op om doorlopende kosten te vermijden:

```bash
# Verwijder alle Azure-resources voor de huidige omgeving
azd down

# Forceer verwijdering zonder bevestiging en zuiver zacht-verwijderde resources
azd down --force --purge

# Verwijder specifieke omgeving
azd env select staging
azd down --force --purge
```

## Wat je hebt Geleerd

Gefeliciteerd! Je hebt met succes:
- ✅ Een azd-project vanuit een sjabloon geïnitieerd
- ✅ De projectstructuur en belangrijke bestanden verkend
- ✅ Een full-stack applicatie geïmplementeerd op Azure
- ✅ Codewijzigingen aangebracht en hergeïmplementeerd
- ✅ Meerdere omgevingen beheerd
- ✅ Resources opgeruimd

## 🎯 Vaardigheidsoefeningen

### Oefening 1: Implementeer een Ander Sjabloon (15 minuten)
**Doel**: Beheersing van azd init en implementatieworkflow aantonen

```bash
# Probeer Python + MongoDB stack
mkdir todo-python && cd todo-python
azd init --template todo-python-mongo
azd up

# Verifieer implementatie
azd show
curl $(azd show --output json | jq -r '.services.web.endpoint')

# Opruimen
azd down --force --purge
```

**Succescriteria:**
- [ ] Applicatie implementeert zonder fouten
- [ ] Toegang tot applicatie-URL in browser
- [ ] Applicatie functioneert correct (todo's toevoegen/verwijderen)
- [ ] Alle resources succesvol opgeruimd

### Oefening 2: Pas Configuratie aan (20 minuten)
**Doel**: Oefen met het configureren van omgevingsvariabelen

```bash
cd my-first-azd-app

# Maak aangepaste omgeving
azd env new custom-config

# Stel aangepaste variabelen in
azd env set APP_TITLE "My Custom Todo App"
azd env set API_VERSION "2.0.0"
azd env set ENABLE_DEBUG "true"

# Verifieer variabelen
azd env get-values | grep APP_TITLE

# Implementeer met aangepaste configuratie
azd up
```

**Succescriteria:**
- [ ] Aangepaste omgeving succesvol aangemaakt
- [ ] Omgevingsvariabelen ingesteld en opvraagbaar
- [ ] Applicatie implementeert met aangepaste configuratie
- [ ] Aangepaste instellingen verifieerbaar in geïmplementeerde app

### Oefening 3: Workflow voor Meerdere Omgevingen (25 minuten)
**Doel**: Beheersing van omgevingsbeheer en implementatiestrategieën

```bash
# Maak ontwikkelomgeving
azd env new dev-$(whoami)
azd env set ENVIRONMENT_TYPE dev
azd env set LOG_LEVEL debug
azd up

# Noteer ontwikkel-URL
DEV_URL=$(azd show --output json | jq -r '.services.web.endpoint')
echo "Dev: $DEV_URL"

# Maak stagingomgeving
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
- [ ] Beide omgevingen succesvol geïmplementeerd
- [ ] Kan schakelen tussen omgevingen met `azd env select`
- [ ] Omgevingsvariabelen verschillen tussen omgevingen
- [ ] Beide omgevingen succesvol opgeruimd

## 📊 Je Voortgang

**Tijd Geïnvesteerd**: ~60-90 minuten  
**Verworven Vaardigheden**:
- ✅ Sjabloon-gebaseerde projectinitiatie
- ✅ Azure resource provisioning
- ✅ Applicatie-implementatieworkflows
- ✅ Omgevingsbeheer
- ✅ Configuratiebeheer
- ✅ Resource-opruiming en kostenbeheer

**Volgend Niveau**: Je bent klaar voor de [Configuratiehandleiding](configuration.md) om geavanceerde configuratiepatronen te leren!

## Veelvoorkomende Problemen Oplossen

### Authenticatiefouten
```bash
# Opnieuw authenticeren met Azure
az login

# Verifieer toegang tot abonnement
az account show
```

### Implementatiefouten
```bash
# Debuglogboekregistratie inschakelen
export AZD_DEBUG=true
azd up --debug

# Gedetailleerde logboeken bekijken
azd logs --service api
azd logs --service web
```

### Resource Naamconflicten
```bash
# Gebruik een unieke omgevingsnaam
azd env new dev-$(whoami)-$(date +%s)
```

### Poort-/Netwerkproblemen
```bash
# Controleer of poorten beschikbaar zijn
netstat -an | grep :3000
netstat -an | grep :3100
```

## Volgende Stappen

Nu je je eerste project hebt voltooid, verken deze geavanceerde onderwerpen:

### 1. Pas Infrastructuur aan
- [Infrastructuur als Code](../deployment/provisioning.md)
- [Voeg databases, opslag en andere services toe](../deployment/provisioning.md#adding-services)

### 2. Stel CI/CD in
- [GitHub Actions Integratie](../deployment/cicd-integration.md)
- [Azure DevOps Pipelines](../deployment/cicd-integration.md#azure-devops)

### 3. Productie Best Practices
- [Beveiligingsconfiguraties](../deployment/best-practices.md#security)
- [Prestatieoptimalisatie](../deployment/best-practices.md#performance)
- [Monitoring en logging](../deployment/best-practices.md#monitoring)

### 4. Verken Meer Sjablonen
```bash
# Blader door sjablonen per categorie
azd template list --filter web
azd template list --filter api
azd template list --filter database

# Probeer verschillende technologie stacks
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

### Sjablonen & Voorbeelden
- [Officiële Sjabloongalerij](https://azure.github.io/awesome-azd/)
- [Community Sjablonen](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patronen](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gefeliciteerd met het voltooien van je eerste azd-project!** Je bent nu klaar om geweldige applicaties op Azure te bouwen en te implementeren met vertrouwen.

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 1 - Basis & Snelstart
- **⬅️ Vorige**: [Installatie & Setup](installation.md)
- **➡️ Volgende**: [Configuratie](configuration.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 2: AI-First Ontwikkeling](../microsoft-foundry/microsoft-foundry-integration.md)
- **Volgende Les**: [Implementatiehandleiding](../deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->