# Je Eerste Project - Hands-On Tutorial

**Chapter Navigation:**
- **📚 Course Home**: [AZD Voor Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 1 - Basis & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)

## Introductie

Welkom bij je eerste Azure Developer CLI-project! Deze uitgebreide hands-on tutorial biedt een volledige walkthrough voor het maken, implementeren en beheren van een full-stack applicatie op Azure met azd. Je werkt met een echte todo-applicatie die een React-frontend, Node.js API-backend en MongoDB-database bevat.

## Leerdoelen

Door deze tutorial te voltooien, zul je:
- Beheersen van de azd projectinitialisatiestroom met behulp van templates
- Azure Developer CLI projectstructuur en configuratiebestanden begrijpen
- Volledige applicatie-implementatie naar Azure uitvoeren met provisionering van infrastructuur
- Implementeren van applicatie-updates en herimplementatiestrategieën
- Meerdere omgevingen beheren voor ontwikkeling en staging
- Praktijken voor resource cleanup en kostenbeheer toepassen

## Leerresultaten

Na voltooiing ben je in staat om:
- azd-projecten zelfstandig te initialiseren en te configureren vanuit templates
- Azd-projectstructuren effectief te navigeren en te wijzigen
- Full-stack applicaties naar Azure te implementeren met enkele commando's
- Veelvoorkomende implementatieproblemen en authenticatieproblemen op te lossen
- Meerdere Azure-omgevingen te beheren voor verschillende implementatiestadia
- Continue deployment-workflows voor applicatie-updates te implementeren

## Aan de Slag

### Vereisten Checklist
- ✅ Azure Developer CLI geïnstalleerd ([Installation Guide](installation.md))
- ✅ Azure CLI geïnstalleerd en geverifieerd
- ✅ Git geïnstalleerd op je systeem
- ✅ Node.js 16+ (voor deze tutorial)
- ✅ Visual Studio Code (aanbevolen)

### Controleer je Setup
```bash
# Controleer de installatie van azd
azd version
```
### Verify Azure authentication

```bash
az account show
```

### Controleer Node.js-versie
```bash
node --version
```

## Stap 1: Kies en Initialiseer een Template

Laten we beginnen met een populair todo-applicatie-template dat een React-frontend en Node.js API-backend bevat.

```bash
# Blader door beschikbare sjablonen
azd template list

# Initialiseer het todo-app-sjabloon
mkdir my-first-azd-app
cd my-first-azd-app
azd init --template todo-nodejs-mongo

# Volg de aanwijzingen:
# - Voer een omgevingsnaam in: "dev"
# - Kies een abonnement (als je er meerdere hebt)
# - Kies een regio: "East US 2" (of je voorkeurregio)
```

### Wat gebeurde er zojuist?
- Het templatecode naar je lokale map gedownload
- Een `azure.yaml` bestand aangemaakt met servicedefinities
- Infrastructuurcode opgezet in de `infra/` directory
- Een omgevingconfiguratie aangemaakt

## Stap 2: Verken de Projectstructuur

Laten we bekijken wat azd voor ons heeft aangemaakt:

```bash
# Bekijk de projectstructuur
tree /f   # Windows
# of
find . -type f | head -20   # macOS/Linux
```

Je zou moeten zien:
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
// Vind de titel en verander deze
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

## Stap 4: Implementeren naar Azure

Nu het spannende gedeelte - implementeer alles naar Azure!

```bash
# Implementeer infrastructuur en applicatie
azd up

# Dit commando zal:
# 1. Azure-resources voorzien (App Service, Cosmos DB, enz.)
# 2. Bouw je applicatie
# 3. Uitrollen naar de aangemaakte resources
# 4. Toon de applicatie-URL
```

### Wat gebeurt er tijdens implementatie?

Het `azd up` commando voert deze stappen uit:
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
Klik op de URL die in de implementatie-output wordt weergegeven, of haal deze op elk gewenst moment op:
```bash
# Haal applicatie-eindpunten op
azd show

# Open de applicatie in uw browser
azd show --output json | jq -r '.services.web.endpoint'
```

### Test de Todo-app
1. **Voeg een todo-item toe** - Klik op "Add Todo" en voer een taak in
2. **Markeer als voltooid** - Vink voltooide items aan
3. **Verwijder items** - Verwijder todo's die je niet meer nodig hebt

### Bewaak je Applicatie
```bash
# Open het Azure-portal voor uw bronnen
azd monitor

# Bekijk applicatielogboeken
azd monitor --logs

# Bekijk live statistieken
azd monitor --live
```

## Stap 6: Breng Wijzigingen aan en Her-implementeer

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

### Implementeer Alleen de Codewijzigingen
```bash
# Alleen de applicatiecode implementeren (infrastructuur overslaan)
azd deploy

# Dit is veel sneller dan 'azd up' omdat de infrastructuur al bestaat
```

## Stap 7: Beheer Meerdere Omgevingen

Maak een staging-omgeving om wijzigingen te testen voordat ze naar productie gaan:

```bash
# Maak een nieuwe staging-omgeving
azd env new staging

# Uitrollen naar staging
azd up

# Schakel terug naar dev-omgeving
azd env select dev

# Toon alle omgevingen
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

Als je klaar bent met experimenteren, ruim alles op om doorlopende kosten te voorkomen:

```bash
# Verwijder alle Azure-resources voor de huidige omgeving
azd down

# Forceer verwijderen zonder bevestiging en permanent verwijderen van soft-verwijderde resources
azd down --force --purge

# Verwijder specifieke omgeving
azd env select staging
azd down --force --purge
```

## Wat Je Hebt Geleerd

Gefeliciteerd! Je hebt met succes:
- ✅ Een azd-project geïnitialiseerd vanuit een template
- ✅ De projectstructuur en belangrijke bestanden verkend
- ✅ Een full-stack applicatie naar Azure geïmplementeerd
- ✅ Codewijzigingen aangebracht en opnieuw geïmplementeerd
- ✅ Meerdere omgevingen beheerd
- ✅ Resources opgeruimd

## 🎯 Vaardigheidsvalidatie Oefeningen

### Oefening 1: Implementeer een Ander Template (15 minuten)
**Doel**: Beheersing van azd init en implementatiestroom aantonen

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
- [ ] Applicatie implementeert zonder fouten
- [ ] Kan applicatie-URL in de browser openen
- [ ] Applicatie functioneert correct (toevoegen/verwijderen van todos)
- [ ] Alle resources succesvol opgeruimd

### Oefening 2: Pas Configuratie aan (20 minuten)
**Doel**: Oefenen met het configureren van omgevingsvariabelen

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
- [ ] Omgevingsvariabelen ingesteld en oproepbaar
- [ ] Applicatie implementeert met aangepaste configuratie
- [ ] Aangepaste instellingen zijn verifieerbaar in de gedeployde app

### Oefening 3: Multi-Environment Workflow (25 minuten)
**Doel**: Beheersing van omgevingsbeheer en implementatiestrategieën

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
- [ ] Beide omgevingen succesvol geïmplementeerd
- [ ] Kan schakelen tussen omgevingen met `azd env select`
- [ ] Omgevingsvariabelen verschillen tussen de omgevingen
- [ ] Beide omgevingen succesvol opgeruimd

## 📊 Je Voortgang

**Tijdsbesteding**: ~60-90 minuten  
**Verworven Vaardigheden**:
- ✅ Template-gebaseerde projectinitialisatie
- ✅ Provisioning van Azure-resources
- ✅ Applicatie-implementatieworkflows
- ✅ Omgevingsbeheer
- ✅ Configuratiebeheer
- ✅ Resource cleanup en kostenbeheer

**Volgende Stap**: Je bent klaar voor de [Configuration Guide](configuration.md) om geavanceerde configuratiepatronen te leren!

## Problemen Oplossen - Veelvoorkomende Issues

### Authenticatiefouten
```bash
# Opnieuw authenticeren met Azure
az login

# Controleer toegang tot het abonnement
az account show
```

### Implementatie Fouten
```bash
# Debuglogregistratie inschakelen
export AZD_DEBUG=true
azd up --debug

# Bekijk applicatielogboeken in Azure
azd monitor --logs

# Voor Container Apps, gebruik de Azure CLI:
# az containerapp logs show --name <app-name> --resource-group <rg-name> --follow
```

### Conflictende Resource Namen
```bash
# Gebruik een unieke naam voor de omgeving.
azd env new dev-$(whoami)-$(date +%s)
```

### Poort-/Netwerkproblemen
```bash
# Controleer of poorten beschikbaar zijn
netstat -an | grep :3000
netstat -an | grep :3100
```

## Volgende Stappen

Nu je je eerste project hebt voltooid, verken deze gevorderde onderwerpen:

### 1. Pas Infrastructuur aan
- [Infrastructure as Code](../chapter-04-infrastructure/provisioning.md)
- [Voeg databases, storage en andere services toe](../chapter-04-infrastructure/provisioning.md#adding-services)

### 2. Stel CI/CD in
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Volledige CI/CD-workflows
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/configure-devops-pipeline) - Pipelineconfiguratie

### 3. Best Practices voor Productie
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Beveiliging, prestaties en monitoring

### 4. Verken Meer Templates
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

## Extra Bronnen

### Trainingsmateriaal
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

### Community & Ondersteuning
- [Azure Developer CLI GitHub](https://github.com/Azure/azure-dev)
- [Azure Developer Community](https://techcommunity.microsoft.com/t5/azure-developer-community/ct-p/AzureDevCommunity)
- [Stack Overflow - azure-developer-cli](https://stackoverflow.com/questions/tagged/azure-developer-cli)

### Templates & Voorbeelden
- [Official Template Gallery](https://azure.github.io/awesome-azd/)
- [Community Templates](https://github.com/Azure-Samples/azd-templates)
- [Enterprise Patterns](https://github.com/Azure/azure-dev/tree/main/templates)

---

**Gefeliciteerd met het voltooien van je eerste azd-project!** Je bent nu klaar om met vertrouwen geweldige applicaties op Azure te bouwen en te implementeren.

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD Voor Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 1 - Basis & Quick Start
- **⬅️ Previous**: [Installation & Setup](installation.md)
- **➡️ Next**: [Configuration](configuration.md)
- **🚀 Next Chapter**: [Chapter 2: AI-First Development](../chapter-02-ai-development/microsoft-foundry-integration.md)
- **Next Lesson**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor belangrijke informatie raden wij een professionele menselijke vertaling aan. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->