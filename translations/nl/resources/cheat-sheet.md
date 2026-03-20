# Command Cheat Sheet - Essential AZD Commands

**Snelreferentie voor alle hoofdstukken**
- **📚 Cursus Startpagina**: [AZD For Beginners](../README.md)
- **📖 Snelstart**: [Hoofdstuk 1: Basis & Snelstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-commando's**: [Hoofdstuk 2: AI-First ontwikkeling (Aanbevolen voor AI-ontwikkelaars)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Geavanceerd**: [Hoofdstuk 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Inleiding

Dit uitgebreide spiekbriefje biedt snelle referenties voor de meest gebruikte Azure Developer CLI-commando's, georganiseerd per categorie met praktische voorbeelden. Perfect voor snel opzoeken tijdens ontwikkeling, probleemoplossing en dagelijkse werkzaamheden met azd-projecten.

## Leerdoelen

Door dit spiekbriefje te gebruiken, zul je:
- Direct toegang hebben tot essentiële Azure Developer CLI-commando's en syntaxis
- Begrijpen hoe commando's zijn georganiseerd per functionele categorie en gebruiksscenario
- Praktische voorbeelden kunnen raadplegen voor veelvoorkomende ontwikkel- en implementatiescenario's
- Toegang hebben tot probleemoplossingscommando's voor snelle foutoplossing
- Geavanceerde configuratie- en aanpassingsopties efficiënt vinden
- Omgevingsbeheer- en multi-omgeving workflow-commando's lokaliseren

## Leerresultaten

Met regelmatig gebruik van dit spiekbriefje zul je in staat zijn om:
- azd-commando's zelfverzekerd uit te voeren zonder de volledige documentatie te raadplegen
- Veelvoorkomende problemen snel op te lossen met geschikte diagnostische commando's
- Meerdere omgevingen en implementatiescenario's efficiënt te beheren
- Geavanceerde azd-functies en configuratie-opties toe te passen indien nodig
- Implementatieproblemen te troubleshooten met systematische commandoreeksen
- Workflows te optimaliseren door effectief gebruik van azd-snelkoppelingen en opties

## Aan de slag - Commando's

### Authenticatie
```bash
# Aanmelden bij Azure via AZD
azd auth login

# Aanmelden bij de Azure CLI (AZD gebruikt dit op de achtergrond)
az login

# Controleer het huidige account
az account show

# Stel het standaardabonnement in
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Uitloggen bij AZD
azd auth logout

# Uitloggen bij de Azure CLI
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

## Kernimplementatiecommando's

### Volledige implementatieworkflow
```bash
# Alles uitrollen (voorziening + uitrol)
azd up

# Uitrollen met bevestigingsprompts uitgeschakeld
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
# Toont een simulatie van welke resources zouden worden aangemaakt/aangepast/verwijderd
# Vergelijkbaar met 'terraform plan' of 'bicep what-if' - veilig uit te voeren, er worden geen wijzigingen doorgevoerd
```

### Alleen applicatie
```bash
# Implementeer applicatiecode
azd deploy

# Implementeer specifieke dienst
azd deploy --service web
azd deploy --service api

# Implementeer alle diensten
azd deploy --all
```

### Build en package
```bash
# Applicaties bouwen
azd package

# Specifieke service bouwen
azd package --service api
```

## 🌍 Omgevingsbeheer

### Omgevingsoperaties
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

# Status van de omgeving vernieuwen
azd env refresh
```

### Omgevingsvariabelen
```bash
# Stel omgevingsvariabele in
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Haal omgevingsvariabele op
azd env get API_KEY

# Toon alle omgevingsvariabelen
azd env get-values

# Verwijder omgevingsvariabele
azd env unset DEBUG
```

## ⚙️ Configuratiecommando's

### Globale configuratie
```bash
# Toon alle configuraties
azd config list

# Stel globale standaardwaarden in
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Verwijder configuratie
azd config unset defaults.location

# Reset alle configuraties
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
# Open het monitoringdashboard van het Azure-portal
azd monitor

# Open de live-statistieken van Application Insights
azd monitor --live

# Open de logs-blade van Application Insights
azd monitor --logs

# Open het overzicht van Application Insights
azd monitor --overview
```

### Containerlogs bekijken
```bash
# Bekijk logs via de Azure CLI (voor Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Volg logs in realtime
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Bekijk logs via het Azure-portaal
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

# Permanent verwijderen van zacht-verwijderde resources
azd down --purge

# Volledige opruiming
azd down --force --purge
```

### Updates
```bash
# Controleren op updates voor azd
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

# 🧪 Voorvertoning & planning van infrastructuur
azd provision --preview
# Simuleert het inrichten van infrastructuur zonder te implementeren
# Analyseert Bicep/Terraform-sjablonen en toont:
# - Hulpbronnen die worden toegevoegd (groen +)
# - Hulpbronnen die worden gewijzigd (geel ~)
# - Hulpbronnen die worden verwijderd (rood -)
# Veilig uit te voeren - er worden geen daadwerkelijke wijzigingen in de Azure-omgeving doorgevoerd

# Genereer infrastructuur vanuit azure.yaml
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

## 🤖 AI- en extensiecommando's

### AZD-extensies
```bash
# Lijst alle beschikbare extensies (inclusief AI)
azd extension list

# Installeer de Foundry Agents-extensie
azd extension install azure.ai.agents

# Installeer de fijnafstemming-extensie
azd extension install azure.ai.finetune

# Installeer de extensie voor aangepaste modellen
azd extension install azure.ai.models

# Werk alle geïnstalleerde extensies bij
azd extension upgrade --all
```

### AI-agentcommando's
```bash
# Initialiseer een agentproject vanuit een manifest
azd ai agent init -m <manifest-path-or-uri>

# Richt je op een specifiek Foundry-project
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Geef de bronmap van de agent op
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Kies een hostingdoel
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-server (Alpha)
```bash
# Start de MCP-server voor je project
azd mcp start

# Beheer toestemmingen van tools voor MCP-bewerkingen
azd mcp consent
```

### Infrastructuurgeneratie
```bash
# Genereer IaC-bestanden op basis van je projectdefinitie
azd infra generate

# Genereer infrastructuur op basis van azure.yaml
azd infra synth
```

---

## 🎯 Snelle workflows

### Ontwikkelingsworkflow
```bash
# Start nieuw project
azd init --template todo-nodejs-mongo
cd my-project

# Uitrollen naar ontwikkelomgeving
azd env new dev
azd up

# Breng wijzigingen aan en rol opnieuw uit
azd deploy

# Open monitoringdashboard
azd monitor --live
```

### Multi-omgevingworkflow
```bash
# Omgevingen opzetten
azd env new dev
azd env new staging  
azd env new production

# Uitrollen naar dev
azd env select dev
azd up

# Testen en promoveren naar staging
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

# Controleer implementatiestatus
azd show

# Valideer configuratie
azd config list

# Open het monitoringdashboard voor logs
azd monitor --logs

# Controleer resource-status
azd show --output json
```

## 🔍 Debugcommando's

### Debug-informatie
```bash
# Schakel debuguitvoer in
export AZD_DEBUG=true
azd <command> --debug

# Schakel telemetrie uit voor schonere uitvoer
export AZD_DISABLE_TELEMETRY=true

# Controleer huidige configuratie
azd config list

# Controleer authenticatiestatus
az account show
```

### Sjabloon-debugging
```bash
# Lijst van beschikbare sjablonen met details
azd template list --output json

# Toon sjablooninformatie
azd template show <template-name>

# Valideer sjabloon voordat init wordt uitgevoerd
azd template validate <template-name>
```

## 📁 Bestand- en mapcommando's

### Projectstructuur
```bash
# Toon huidige directorystructuur
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigeer naar de hoofdmap van het azd-project
cd $(azd root)

# Toon azd-configuratiemap
echo $AZD_CONFIG_DIR  # Meestal ~/.azd
```

## 🎨 Uitvoeropmaak

### JSON-uitvoer
```bash
# Haal JSON-uitvoer op voor scripting
azd show --output json
azd env list --output json
azd config list --output json

# Parsen met jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeluitvoer
```bash
# Als tabel weergeven
azd env list --output table

# Bekijk uitgerolde services
azd show --output json | jq '.services | keys'
```

## 🔧 Veelvoorkomende commandokombinaties

### Healthcheckscript
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
azd provision --preview  # Bekijk wijzigingen voordat u ze uitrolt
az account show
```

### Omgevingsvergelijking
```bash
#!/bin/bash
# Vergelijk omgevingen
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
# Azure-configuratie
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD-configuratie
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Applicatieconfiguratie
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Noodcommando's

### Snelle oplossingen
```bash
# Authenticatie resetten
az account clear
az login

# Forceer het verversen van de omgeving
azd env refresh

# Alle services opnieuw uitrollen
azd deploy

# Controleer de status van de uitrol
azd show --output json
```

### Herstelcommando's
```bash
# Herstel na mislukte implementatie - opschonen en opnieuw implementeren
azd down --force --purge
azd up

# Alleen infrastructuur opnieuw inrichten
azd provision

# Alleen applicatie opnieuw implementeren
azd deploy
```

## 💡 Protips

### Aliassen voor snellere workflow
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

## 📖 Help en documentatie

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

**Tip**: Voeg dit spiekbriefje toe aan je bladwijzers en gebruik `Ctrl+F` om snel de commando's te vinden die je nodig hebt!

---

**Navigatie**
- **Vorige les**: [Preflight-controles](../docs/pre-deployment/preflight-checks.md)
- **Volgende les**: [Woordenlijst](glossary.md)

---

> **💡 Wil je hulp bij Azure-opdrachten in je editor?** Installeer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) met `npx skills add microsoft/github-copilot-for-azure` — 37 vaardigheden voor AI, Foundry, implementatie, diagnostiek en meer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal dient als de gezaghebbende bron te worden beschouwd. Voor kritieke informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor enige misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->