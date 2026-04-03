# Command Cheat Sheet - Essentiële AZD-commando's

**Snelreferentie voor alle hoofdstukken**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../README.md)
- **📖 Snelstart**: [Hoofdstuk 1: Basis & Snelstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-commando's**: [Hoofdstuk 2: AI-first ontwikkeling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Geavanceerd**: [Hoofdstuk 4: Infrastructuur als Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Inleiding

Deze uitgebreide spiekbrief biedt een snelreferentie voor de meest gebruikte Azure Developer CLI-commando's, georganiseerd per categorie met praktische voorbeelden. Perfect voor snelle opzoekingen tijdens ontwikkeling, probleemoplossing en dagelijkse werkzaamheden met azd-projecten.

## Leerdoelen

Door deze spiekbrief te gebruiken, zul je:
- Direct toegang hebben tot essentiële Azure Developer CLI-commando's en syntaxis
- Begrijpen hoe commando's zijn georganiseerd op functiecategorieën en gebruiksscenario's
- Praktische voorbeelden raadplegen voor veelvoorkomende ontwikkel- en implementatiescenario's
- Toegang tot troubleshooting-commando's voor snelle probleemoplossing
- Geavanceerde configuratie- en aanpassingsopties efficiënt vinden
- Omgevingsbeheer en multi-omgeving workflow-commando's vinden

## Leeruitkomsten

Door regelmatig naar deze spiekbrief te verwijzen, kun je:
- azd-commando's met vertrouwen uitvoeren zonder de volledige documentatie te hoeven raadplegen
- Veelvoorkomende problemen snel oplossen met behulp van geschikte diagnostische commando's
- Meerdere omgevingen en implementatiescenario's efficiënt beheren
- Geavanceerde azd-functies en configuratieopties toepassen indien nodig
- Problemen met implementaties oplossen met behulp van systematische commandosequenties
- Workflows optimaliseren door effectief gebruik van azd-snelkoppelingen en opties

## Aan de slag-commando's

### Authenticatie
```bash
# Inloggen bij Azure via AZD
azd auth login

# Inloggen bij Azure CLI (AZD gebruikt dit onder de motorkap)
az login

# Huidig account controleren
az account show

# Stel standaardabonnement in
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Uitloggen bij AZD
azd auth logout

# Uitloggen bij Azure CLI
az logout
```

### Projectinitialisatie
```bash
# Blader door beschikbare sjablonen
azd template list

# Initialiseren vanuit sjabloon
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiseren in de huidige map
azd init .

# Initialiseren met aangepaste naam
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kernimplementatiecommando's

### Volledige implementatieworkflow
```bash
# Alles uitrollen (provision + deploy)
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
# Azure-resources implementeren
azd provision

# 🧪 Voorvertoning van infrastructuurwijzigingen
azd provision --preview
# Toont een simulatieweergave van welke resources zouden worden gemaakt/aangepast/verwijderd
# Vergelijkbaar met 'terraform plan' of 'bicep what-if' - veilig om uit te voeren, er worden geen wijzigingen toegepast
```

### Alleen applicatie
```bash
# Implementeer applicatiecode
azd deploy

# Implementeer een specifieke dienst
azd deploy --service web
azd deploy --service api

# Implementeer alle diensten
azd deploy --all
```

### Bouwen en verpakken
```bash
# Applicaties bouwen
azd package

# Specifieke dienst bouwen
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

# Beschikbare omgevingen weergeven
azd env list

# Omgevingstatus verversen
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
azd config show

# Stel globale standaardinstellingen in
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Verwijder configuratie
azd config unset defaults.location

# Stel alle configuraties opnieuw in
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

### Monitoringdashboard
```bash
# Open het monitoringdashboard van de Azure-portal
azd monitor

# Open de live-metrieken van Application Insights
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

# Bekijk logs via het Azure-portal
azd monitor --logs
```

### Log Analytics-queries
```bash
# Toegang tot Log Analytics via het Azure-portal
azd monitor --logs

# Logboeken opvragen met de Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Onderhoudscommando's

### Opschonen
```bash
# Verwijder alle Azure-resources
azd down

# Forceer verwijderen zonder bevestiging
azd down --force

# Zacht-verwijderde resources definitief verwijderen
azd down --purge

# Volledige opruiming
azd down --force --purge
```

### Updates
```bash
# Controleer op azd-updates
azd version

# Huidige versie ophalen
azd version

# Bekijk huidige configuratie
azd config show
```

## 🔧 Geavanceerde commando's

### Pipeline en CI/CD
```bash
# Configureer GitHub Actions
azd pipeline config

# Configureer Azure DevOps
azd pipeline config --provider azdo

# Toon pipelineconfiguratie
azd pipeline show
```

### Infrastructuurbeheer
```bash
# Genereer infrastructuurtemplates
azd infra generate

# 🧪 Infrastructuurvoorvertoning & Planning
azd provision --preview
# Simuleert het inrichten van infrastructuur zonder uit te rollen
# Analyseert Bicep/Terraform-sjablonen en toont:
# - Resources die worden toegevoegd (groen +)
# - Resources die worden gewijzigd (geel ~)
# - Resources die worden verwijderd (rood -)
# Veilig om uit te voeren - er worden geen echte wijzigingen in de Azure-omgeving aangebracht

# Synthetiseer infrastructuur uit azure.yaml
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
# Toon alle beschikbare extensies (inclusief AI)
azd extension list

# Installeer de Foundry Agents-extensie
azd extension install azure.ai.agents

# Installeer de fine-tuning-extensie
azd extension install azure.ai.finetune

# Installeer de extensie voor aangepaste modellen
azd extension install azure.ai.models

# Werk alle geïnstalleerde extensies bij
azd extension upgrade --all
```

### AI-agentcommando's
```bash
# Initialiseer een agentproject vanaf een manifest
azd ai agent init -m <manifest-path-or-uri>

# Richt op een specifiek Foundry-project
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
azd copilot consent list
```

### Infrastructuurgeneratie
```bash
# Genereer IaC-bestanden op basis van je projectdefinitie
azd infra generate

# Genereer infrastructuur uit azure.yaml
azd infra synth
```

---

## 🎯 Snelle workflows

### Ontwikkelworkflow
```bash
# Begin een nieuw project
azd init --template todo-nodejs-mongo
cd my-project

# Uitrollen naar de ontwikkelomgeving
azd env new dev
azd up

# Breng wijzigingen aan en rol opnieuw uit
azd deploy

# Open het monitoringdashboard
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

# Valideer de configuratie
azd config show

# Open het monitoringdashboard voor logs
azd monitor --logs

# Controleer de status van de resources
azd show --output json
```

## 🔍 Debugging-commando's

### Debuginformatie
```bash
# Schakel debug-uitvoer in
export AZD_DEBUG=true
azd <command> --debug

# Schakel telemetrie uit voor schonere uitvoer
export AZD_DISABLE_TELEMETRY=true

# Controleer huidige configuratie
azd config show

# Controleer authenticatiestatus
az account show
```

### Template-debugging
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

## 🎨 Outputopmaak

### JSON-output
```bash
# JSON-uitvoer ophalen voor scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parsen met jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeluitvoer
```bash
# Formatteer als tabel
azd env list --output table

# Bekijk geïmplementeerde services
azd show --output json | jq '.services | keys'
```

## 🔧 Veelvoorkomende combinaties van commando's

### Healthcheck-script
```bash
#!/bin/bash
# Snelle gezondheidscontrole
azd show
azd env get-values
azd monitor --logs
```

### Implementatievalidatie
```bash
#!/bin/bash
# Validatie vóór uitrol
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
# Oude omgevingen opruimen
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

### Sneloplossingen
```bash
# Authenticatie opnieuw instellen
az account clear
az login

# Forceer het verversen van de omgeving
azd env refresh

# Alle services opnieuw implementeren
azd deploy

# Controleer de implementatiestatus
azd show --output json
```

### Herstelcommando's
```bash
# Herstellen van een mislukte uitrol - opschonen en opnieuw uitrollen
azd down --force --purge
azd up

# Alleen de infrastructuur opnieuw inrichten
azd provision

# Alleen de applicatie opnieuw uitrollen
azd deploy
```

## 💡 Protips

### Aliassen voor snellere workflows
```bash
# Voeg dit toe aan je .bashrc of .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Functie-snelkoppelingen
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
    azd env get-values
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

**Tip**: Sla deze spiekbrief op als bladwijzer en gebruik `Ctrl+F` om snel de commando's te vinden die je nodig hebt!

---

**Navigatie**
- **Vorige les**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Volgende les**: [Woordenlijst](glossary.md)

---

> **💡 Wil je hulp met Azure-commando's in je editor?** Installeer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) met `npx skills add microsoft/github-copilot-for-azure` — 37 skills voor AI, Foundry, implementatie, diagnostiek en meer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, houd er rekening mee dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->