# Command Cheat Sheet - Essentiële AZD-commando's

**Snelle referentie voor alle hoofdstukken**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../README.md)
- **📖 Snelstart**: [Hoofdstuk 1: Basis & Snelstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-commando's**: [Hoofdstuk 2: AI-first ontwikkeling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Geavanceerd**: [Hoofdstuk 4: Infrastructuur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introductie

Dit uitgebreide spiekbriefje biedt een snelle referentie voor de meest gebruikte Azure Developer CLI-commando's, georganiseerd per categorie met praktische voorbeelden. Perfect voor snelle opzoekingen tijdens ontwikkeling, probleemoplossing en dagelijkse werkzaamheden met azd-projecten.

## Leerdoelen

Door dit spiekbriefje te gebruiken, zul je:
- Direct toegang hebben tot essentiële Azure Developer CLI-commando's en syntaxis
- Begrijpen hoe commando's zijn georganiseerd per functionele categorie en use-case
- Praktische voorbeelden kunnen raadplegen voor veelvoorkomende ontwikkel- en implementatiescenario's
- Toegang hebben tot probleemoplossingscommando's voor snelle foutopsporing
- Geavanceerde configuratie- en aanpassingsopties efficiënt vinden
- Beheer van omgevingen en multi-omgeving workflows kunnen uitvoeren

## Leerresultaten

Bij regelmatig gebruik van dit spiekbriefje zul je in staat zijn om:
- azd-commando's zelfverzekerd uit te voeren zonder steeds de volledige documentatie te raadplegen
- Veelvoorkomende problemen snel op te lossen met de juiste diagnostische commando's
- Meerdere omgevingen en implementatiescenario's efficiënt te beheren
- Geavanceerde azd-functies en configuratie-opties toe te passen indien nodig
- Implementatieproblemen systematisch op te sporen met een reeks commando's
- Workflows te optimaliseren door effectief gebruik van azd-sneltoetsen en opties

## Aan de slag-commando's

### Authenticatie
```bash
# Inloggen bij Azure via AZD
azd auth login

# Inloggen bij de Azure CLI (AZD gebruikt dit achter de schermen)
az login

# Huidig account controleren
az account show

# Stel standaardabonnement in
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Uitloggen uit AZD
azd auth logout

# Uitloggen uit de Azure CLI
az logout
```

### Projectinitialisatie
```bash
# Blader door beschikbare sjablonen
azd template list

# Initialiseer vanuit sjabloon
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiseer in de huidige map
azd init .

# Initialiseer met aangepaste naam
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kernimplementatie-commando's

### Volledige implementatieworkflow
```bash
# Alles uitrollen (provision + deploy)
azd up

# Uitrollen met bevestigingsmeldingen uitgeschakeld
azd up --confirm-with-no-prompt

# Uitrollen naar een specifieke omgeving
azd up --environment production

# Uitrollen met aangepaste parameters
azd up --parameter location=westus2
```

### Alleen infrastructuur
```bash
# Azure-resources inrichten
azd provision

# 🧪 Voorvertoning van infrastructuurwijzigingen
azd provision --preview
# Toont een simulatieweergave van welke resources zouden worden aangemaakt, gewijzigd of verwijderd
# Vergelijkbaar met 'terraform plan' of 'bicep what-if' - veilig om uit te voeren, er worden geen wijzigingen doorgevoerd
```

### Alleen applicatie
```bash
# Implementeer applicatiecode
azd deploy

# Implementeer specifieke service
azd deploy --service web
azd deploy --service api

# Implementeer alle services
azd deploy --all
```

### Bouwen en verpakken
```bash
# Applicaties bouwen
azd package

# Specifieke service bouwen
azd package --service api
```

## 🌍 Omgevingsbeheer

### Omgevingsbewerkingen
```bash
# Alle omgevingen weergeven
azd env list

# Nieuwe omgeving aanmaken
azd env new development
azd env new staging --location westus2

# Omgeving selecteren
azd env select production

# Huidige omgeving weergeven
azd env show

# Omgevingsstatus verversen
azd env refresh
```

### Omgevingsvariabelen
```bash
# Stel omgevingsvariabele in
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Haal omgevingsvariabele op
azd env get API_KEY

# Lijst alle omgevingsvariabelen
azd env get-values

# Verwijder omgevingsvariabele
azd env unset DEBUG
```

## ⚙️ Configuratiecommando's

### Globale configuratie
```bash
# Alle configuraties weergeven
azd config list

# Globale standaardwaarden instellen
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Configuratie verwijderen
azd config unset defaults.location

# Alle configuraties opnieuw instellen
azd config reset
```

### Projectconfiguratie
```bash
# Valideer azure.yaml
azd config validate

# Toon projectinformatie
azd show

# Haal service-eindpunten op
azd show --output json
```

## 📊 Monitoring en diagnostiek

### Monitoring-dashboard
```bash
# Open het monitoringdashboard in het Azure-portal
azd monitor

# Open de live-metrics van Application Insights
azd monitor --live

# Open de logs-blade van Application Insights
azd monitor --logs

# Open het overzicht van Application Insights
azd monitor --overview
```

### Containerlogs bekijken
```bash
# Bekijk logs via Azure CLI (voor Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Volg logs in realtime
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Bekijk logs via het Azure-portal
azd monitor --logs
```

### Log Analytics-queries
```bash
# Log Analytics openen via de Azure-portal
azd monitor --logs

# Logs opvragen met de Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Onderhoudscommando's

### Opschonen
```bash
# Verwijder alle Azure-resources
azd down

# Geforceerd verwijderen zonder bevestiging
azd down --force

# Zacht-verwijderde resources permanent verwijderen
azd down --purge

# Volledige opschoning
azd down --force --purge
```

### Updates
```bash
# Controleren op azd-updates
azd version

# Huidige versie ophalen
azd version

# Huidige configuratie bekijken
azd config list
```

## 🔧 Geavanceerde commando's

### Pipeline en CI/CD
```bash
# Configureer GitHub Actions
azd pipeline config

# Configureer Azure DevOps
azd pipeline config --provider azdo

# Toon pijplijnconfiguratie
azd pipeline show
```

### Infrastructuurbeheer
```bash
# Genereer infrastructuursjablonen
azd infra generate

# 🧪 Voorverkenning en planning van infrastructuur
azd provision --preview
# Simuleert het inrichten van infrastructuur zonder te implementeren
# Analyseert Bicep/Terraform-sjablonen en toont:
# - Resources die worden toegevoegd (groen +)
# - Resources die worden aangepast (geel ~)
# - Resources die worden verwijderd (rood -)
# Veilig uit te voeren - er worden geen daadwerkelijke wijzigingen aangebracht in de Azure-omgeving

# Genereer infrastructuur uit azure.yaml
azd infra synth
```

### Projectinformatie
```bash
# Toon projectstatus en eindpunten
azd show

# Toon gedetailleerde projectinformatie als JSON
azd show --output json

# Haal service-eindpunten op
azd show --output json | jq '.services'
```

## 🎯 Snelle workflows

### Ontwikkelingsworkflow
```bash
# Start een nieuw project
azd init --template todo-nodejs-mongo
cd my-project

# Uitrollen naar ontwikkelomgeving
azd env new dev
azd up

# Breng wijzigingen aan en rol opnieuw uit
azd deploy

# Open het monitoring-dashboard
azd monitor --live
```

### Workflow voor meerdere omgevingen
```bash
# Omgevingen opzetten
azd env new dev
azd env new staging  
azd env new production

# Uitrollen naar dev
azd env select dev
azd up

# Testen en doorzetten naar staging
azd env select staging
azd up

# Uitrollen naar productie
azd env select production
azd up
```

### Probleemoplossingsworkflow
```bash
# Schakel debugmodus in
export AZD_DEBUG=true

# Controleer de status van de implementatie
azd show

# Valideer configuratie
azd config list

# Open het monitoringdashboard voor logs
azd monitor --logs

# Controleer de status van de resources
azd show --output json
```

## 🔍 Debugging-commando's

### Debuginformatie
```bash
# Debug-uitvoer inschakelen
export AZD_DEBUG=true
azd <command> --debug

# Telemetrie uitschakelen voor schonere uitvoer
export AZD_DISABLE_TELEMETRY=true

# Huidige configuratie controleren
azd config list

# Authenticatiestatus controleren
az account show
```

### Sjabloon-debugging
```bash
# Toon beschikbare sjablonen met details
azd template list --output json

# Toon sjablooninformatie
azd template show <template-name>

# Valideer sjabloon vóór initialisatie
azd template validate <template-name>
```

## 📁 Bestand- en mapcommando's

### Projectstructuur
```bash
# Toon huidige directorystructuur
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigeer naar de root van het azd-project
cd $(azd root)

# Toon azd-configuratiemap
echo $AZD_CONFIG_DIR  # Meestal ~/.azd
```

## 🎨 Uitvoeropmaak

### JSON-uitvoer
```bash
# JSON-uitvoer ophalen voor scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parsen met jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeluitvoer
```bash
# Formatteer als tabel
azd env list --output table

# Bekijk uitgerolde services
azd show --output json | jq '.services | keys'
```

## 🔧 Veelvoorkomende commando-combinaties

### Healthcheck-script
```bash
#!/bin/bash
# Snelle gezondheidscontrole
azd show
azd env show
azd monitor --logs
```

### Implementatievalidatie
```bash
#!/bin/bash
# Validatie voor implementatie
azd show
azd provision --preview  # Bekijk wijzigingen voordat u gaat uitrollen
az account show
```

### Omgevingsvergelijking
```bash
#!/bin/bash
# Omgevingen vergelijken
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Resource-opruimscript
```bash
#!/bin/bash
# Ruim oude omgevingen op
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Omgevingsvariabelen

### Veelvoorkomende omgevingsvariabelen
```bash
# Azure configuratie
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuratie
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Applicatie configuratie
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Noodcommando's

### Snelle oplossingen
```bash
# Authenticatie opnieuw instellen
az account clear
az login

# Forceer verversen van de omgeving
azd env refresh

# Alle services opnieuw uitrollen
azd deploy

# Controleer implementatiestatus
azd show --output json
```

### Herstelcommando's
```bash
# Herstellen van een mislukte deployment - opschonen en opnieuw uitrollen
azd down --force --purge
azd up

# Alleen infrastructuur opnieuw inrichten
azd provision

# Alleen applicatie opnieuw uitrollen
azd deploy
```

## 💡 Pro-tips

### Aliassen voor een snellere workflow
```bash
# Voeg toe aan je .bashrc of .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Functiesnelkoppelingen
```bash
# Snel schakelen tussen omgevingen
azd-env() {
    azd env select $1 && azd show
}

# Snelle uitrol met monitoring
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Status van de omgeving
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Hulp en documentatie

### Hulp krijgen
```bash
# Algemene hulp
azd --help
azd help

# Commando-specifieke hulp
azd up --help
azd env --help
azd config --help

# Toon versie- en buildinformatie
azd version
azd version --output json
```

### Documentatielinks
```bash
# Open documentatie in de browser
azd docs

# Toon sjabloondocumentatie
azd template show <template-name> --docs
```

---

**Tip**: Sla dit spiekbriefje als bladwijzer op en gebruik `Ctrl+F` om snel de commando's te vinden die je nodig hebt!

---

**Navigatie**
- **Vorige les**: [Preflight-controles](../docs/pre-deployment/preflight-checks.md)
- **Volgende les**: [Woordenlijst](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->