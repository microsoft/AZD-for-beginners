# Command Cheat Sheet - Essentiële AZD-commando's

**Snelle referentie voor alle hoofdstukken**
- **📚 Cursus Startpagina**: [AZD voor beginners](../README.md)
- **📖 Snelstart**: [Hoofdstuk 1: Basis & Snelstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-commando's**: [Hoofdstuk 2: AI-First ontwikkeling (aanbevolen voor AI-ontwikkelaars)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Geavanceerd**: [Hoofdstuk 4: Infrastructuur als code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Inleiding

Dit uitgebreide overzicht biedt een snelle referentie voor de meest gebruikte Azure Developer CLI-commando's, georganiseerd per categorie met praktische voorbeelden. Perfect voor snelle opzoekingen tijdens ontwikkeling, probleemoplossing en dagelijkse operaties met azd-projecten.

## Leerdoelen

Door dit overzicht te gebruiken, zul je:
- Direct toegang hebben tot essentiële Azure Developer CLI-commando's en syntaxis
- Begrijpen hoe commando's zijn georganiseerd op basis van functionele categorieën en use-cases
- Praktische voorbeelden raadplegen voor veelvoorkomende ontwikkel- en implementatiescenario's
- Toegang hebben tot probleemoplossingscommando's voor snelle foutoplossing
- Geavanceerde configuratie- en aanpassingsopties efficiënt vinden
- Omgevingsbeheer- en multi-omgeving workflow-commando's lokaliseren

## Leerresultaten

Met regelmatig gebruik van dit overzicht zul je in staat zijn om:
- Azd-commando's zelfverzekerd uit te voeren zonder de volledige documentatie te raadplegen
- Veelvoorkomende problemen snel op te lossen met geschikte diagnostische commando's
- Efficiënt meerdere omgevingen en implementatiescenario's te beheren
- Geavanceerde azd-functies en configuratie-opties toe te passen wanneer nodig
- Implementatieproblemen te debuggen met systematische commando-sequenties
- Workflows te optimaliseren door effectief gebruik van azd-snelkoppelingen en opties

## Begincommando's

### Authenticatie
```bash
# Inloggen bij Azure via AZD
azd auth login

# Inloggen bij Azure CLI (AZD gebruikt dit op de achtergrond)
az login

# Huidig account controleren
az account show

# Standaardabonnement instellen
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

## Kern-implementatiecommando's

### Volledige implementatieworkflow
```bash
# Alles uitrollen (inrichten + uitrollen)
azd up

# Uitrollen met bevestigingsprompts uitgeschakeld
azd up --confirm-with-no-prompt

# Uitrollen naar specifieke omgeving
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
# Toont een proefuitvoering (dry-run) van welke resources zouden worden aangemaakt, gewijzigd of verwijderd
# Vergelijkbaar met 'terraform plan' of 'bicep what-if' - veilig uit te voeren, er worden geen wijzigingen toegepast
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
# Herstel (download) applicatieafhankelijkheden
azd restore

# Herstel een specifieke service
azd restore --service api

# Bouw een inzetbaar artefact zonder te deployen
azd package

# Bouw een specifieke service
azd package --service api
```

> **`azd restore`** downloadt de afhankelijkheden van je app (npm, pip, NuGet, Maven, enz.). Het wordt automatisch uitgevoerd tijdens `azd package` en `azd deploy`, dus je roept het zelden direct aan — draai het handmatig om afhankelijkheden vooraf op te halen (bijv. om een CI-cache op te warmen of daarna offline te werken).

> **`azd package`** bouwt het inzetbare artefact (een containerimage of zip) **zonder** het naar Azure te pushen. Gebruik het op zichzelf om te verifiëren of een build slaagt, de output te inspecteren of een artefact te produceren dat een apart proces later zal uitrollen. `azd deploy` pakt automatisch in, dus je hebt `azd package` alleen nodig wanneer je het artefact wilt zonder te deployen.


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

# Toon alle omgevingsvariabelen
azd env get-values

# Verwijder omgevingsvariabele
azd env unset DEBUG
```

## ⚙️ Configuratiecommando's

### Globale configuratie
```bash
# Alle configuraties weergeven
azd config show

# Globale standaardwaarden instellen
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Configuratie verwijderen
azd config unset defaults.location

# Alle configuraties resetten
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
# Bekijk logs via Azure CLI (voor Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Volg logs in realtime
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Bekijk logs in de Azure Portal
azd monitor --logs
```

### Log Analytics-query's
```bash
# Toegang tot Log Analytics via de Azure-portal
azd monitor --logs

# Logs opvragen met de Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Onderhoudscommando's

### Opruimen
```bash
# Verwijder alle Azure-resources
azd down

# Gedwongen verwijderen zonder bevestiging
azd down --force

# Verwijder zacht-verwijderde resources permanent
azd down --purge

# Volledige opruiming
azd down --force --purge
```

### Updates
```bash
# Controleer op azd-updates
azd version

# Haal huidige versie op
azd version

# Bekijk huidige configuratie
azd config show
```

## 🔧 Geavanceerde commando's

### Pijplijn en CI/CD
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
# Genereer infrastructuursjablonen
azd infra generate

# 🧪 Voorbeeld en planning van infrastructuur
azd provision --preview
# Simuleert het inrichten van infrastructuur zonder deze te implementeren
# Analyseert Bicep/Terraform-sjablonen en toont:
# - Resources die worden toegevoegd (groen +)
# - Resources die worden aangepast (geel ~)
# - Resources die worden verwijderd (rood -)
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

# Installeer de Foundry agents-extensie
azd extension install azure.ai.agents

# Installeer de agentvaardigheden-extensie (voorvertoning)
azd extension install azure.ai.skills

# Installeer de Foundry verbindingen-extensie (voorvertoning)
azd extension install azure.ai.connections

# Installeer de fine-tuning-extensie
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

# Test een geïmplementeerde agent (geeft latentie en tijd tot de eerste byte weer)
azd ai agent invoke

# Toon de configuratie van het live-eindpunt
azd ai agent endpoint show

# Genereer een evaluatiedataset en optimaliseer vervolgens de agent
azd ai agent eval generate
azd ai agent optimize

# Download de geïmplementeerde broncode van een op code gebaseerde gehoste agent
azd ai agent code download

# Verwijder een gehoste agent en al zijn versies (--force beëindigt actieve sessies)
azd ai agent delete --force
```

### MCP-server (Alpha)
```bash
# Start de MCP-server voor je project
azd mcp start

# Beheer toestemmingen van de tool voor MCP-bewerkingen
azd copilot consent list
```

### Infrastructuurgeneratie
```bash
# Genereer IaC-bestanden vanuit je projectdefinitie
azd infra generate

# Genereer infrastructuur vanuit azure.yaml
azd infra synth
```

---

## 🎯 Snelle workflows

### Ontwikkelingsworkflow
```bash
# Nieuw project starten
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

### Workflow voor meerdere omgevingen
```bash
# Omgevingen opzetten
azd env new dev
azd env new staging  
azd env new production

# Uitrollen naar dev
azd env select dev
azd up

# Testen en doorplaatsen naar staging
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
azd config show

# Open het monitoringdashboard voor logbestanden
azd monitor --logs

# Controleer de status van de resource
azd show --output json
```

## 🔍 Debugcommando's

### Debug-informatie
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
# Lijst beschikbare sjablonen met details
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

### JSON-uitvoer
```bash
# Genereer JSON-uitvoer voor scripts
azd show --output json
azd env list --output json
azd config show --output json

# Parseer met jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeluitvoer
```bash
# Als tabel weergeven
azd env list --output table

# Gedeployde services bekijken
azd show --output json | jq '.services | keys'
```

## 🔧 Veelvoorkomende commando-combinaties

### Health-checkscript
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
# Validatie vóór implementatie
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

### Script voor het opruimen van bronnen
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

# Applicatie-configuratie
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Noodcommando's

### Snelle oplossingen
```bash
# Authenticatie opnieuw instellen
az account clear
az login

# Omgeving geforceerd verversen
azd env refresh

# Alle services opnieuw uitrollen
azd deploy

# Controleer de uitrolstatus
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

**Tip**: Voeg dit overzicht toe aan je bladwijzers en gebruik `Ctrl+F` om snel de commando's te vinden die je nodig hebt!

---

**Navigatie**
- **Vorige les**: [Preflight-controles](../docs/pre-deployment/preflight-checks.md)
- **Volgende les**: [Woordenlijst](glossary.md)

---

> **💡 Wil je Azure-commandohulp in je editor?** Installeer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) met `npx skills add microsoft/github-copilot-for-azure` — 37 skills voor AI, Foundry, deployment, diagnostiek en meer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->