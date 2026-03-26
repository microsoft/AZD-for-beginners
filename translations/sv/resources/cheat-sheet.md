# Kommandofusklapp - Viktiga AZD-kommandon

**Snabbreferens för alla kapitel**
- **📚 Kursöversikt**: [AZD For Beginners](../README.md)
- **📖 Snabbstart**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandon**: [Chapter 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancerat**: [Chapter 4: Infrastructure as Code](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Denna omfattande fusklapp ger snabbreferens för de mest använda Azure Developer CLI-kommandona, organiserade efter kategori med praktiska exempel. Perfekt för snabba uppslag under utveckling, felsökning och dagliga operationer med azd-projekt.

## Lärandemål

Genom att använda denna fusklapp kommer du att:
- Ha omedelbar åtkomst till viktiga Azure Developer CLI-kommandon och syntax
- Förstå kommandons organisering efter funktionella kategorier och användningsfall
- Hitta praktiska exempel för vanliga utvecklings- och distributionsscenarier
- Få åtkomst till felsökningskommandon för snabb problemlösning
- Hitta avancerade konfigurations- och anpassningsalternativ effektivt
- Lokalisera kommandon för miljöhantering och arbetsflöden med flera miljöer

## Läranderesultat

Med regelbunden referens till denna fusklapp kommer du att kunna:
- Köra azd-kommandon med självförtroende utan att behöva full dokumentation
- Snabbt lösa vanliga problem med lämpliga diagnostikkommandon
- Effektivt hantera flera miljöer och distributionsscenarier
- Tillämpa avancerade azd-funktioner och konfigurationsalternativ vid behov
- Felsöka distributionsproblem med systematiska kommando-sekvenser
- Optimera arbetsflöden genom effektiv användning av azd-genvägar och alternativ

## Kom igång-kommandon

### Autentisering
```bash
# Logga in på Azure via AZD
azd auth login

# Logga in i Azure CLI (AZD använder detta bakom kulisserna)
az login

# Kontrollera nuvarande konto
az account show

# Ställ in standardprenumeration
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logga ut från AZD
azd auth logout

# Logga ut från Azure CLI
az logout
```

### Projektinitiering
```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera från en mall
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initiera i aktuell katalog
azd init .

# Initiera med anpassat namn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kärnkommandon för distribution

### Fullständig distributionsarbetsflöde
```bash
# Driftsätt allt (provisionera + driftsätta)
azd up

# Driftsätt utan bekräftelsefrågor
azd up --confirm-with-no-prompt

# Driftsätt till en specifik miljö
azd up --environment production

# Driftsätt med anpassade parametrar
azd up --parameter location=westus2
```

### Endast infrastruktur
```bash
# Provisionera Azure-resurser
azd provision

# 🧪 Förhandsgranska infrastruktursändringar
azd provision --preview
# Visar en torrkörningsvy av vilka resurser som skulle skapas, ändras eller tas bort
# Liknande 'terraform plan' eller 'bicep what-if' - säkert att köra, inga ändringar tillämpas
```

### Endast applikation
```bash
# Distribuera applikationskod
azd deploy

# Distribuera en specifik tjänst
azd deploy --service web
azd deploy --service api

# Distribuera alla tjänster
azd deploy --all
```

### Bygg och paketera
```bash
# Bygg applikationer
azd package

# Bygg en specifik tjänst
azd package --service api
```

## 🌍 Miljöhantering

### Miljöoperationer
```bash
# Lista alla miljöer
azd env list

# Skapa ny miljö
azd env new development
azd env new staging --location westus2

# Välj miljö
azd env select production

# Visa aktuell miljö
azd env show

# Uppdatera miljöns status
azd env refresh
```

### Miljövariabler
```bash
# Ställ in miljövariabel
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hämta miljövariabel
azd env get API_KEY

# Lista alla miljövariabler
azd env get-values

# Ta bort miljövariabel
azd env unset DEBUG
```

## ⚙️ Konfigurationskommandon

### Global konfiguration
```bash
# Lista alla konfigurationer
azd config list

# Ställ in globala standardvärden
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Ta bort konfiguration
azd config unset defaults.location

# Återställ alla konfigurationer
azd config reset
```

### Projektkonfiguration
```bash
# Validera azure.yaml
azd config validate

# Visa projektinformation
azd show

# Hämta tjänstendpunkter
azd show --output json
```

## 📊 Övervakning och diagnostik

### Övervakningspanel
```bash
# Öppna övervakningspanelen i Azure-portalen
azd monitor

# Öppna live-metriker i Application Insights
azd monitor --live

# Öppna loggbladet i Application Insights
azd monitor --logs

# Öppna översikten i Application Insights
azd monitor --overview
```

### Visa containerloggar
```bash
# Visa loggar via Azure CLI (för Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Följ loggar i realtid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Visa loggar från Azure-portalen
azd monitor --logs
```

### Log Analytics-frågor
```bash
# Få åtkomst till Log Analytics via Azure-portalen
azd monitor --logs

# Sök i loggar med Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Underhållskommandon

### Rensning
```bash
# Ta bort alla Azure-resurser
azd down

# Tvinga radering utan bekräftelse
azd down --force

# Rensa mjukborttagna resurser
azd down --purge

# Fullständig rensning
azd down --force --purge
```

### Uppdateringar
```bash
# Kontrollera uppdateringar för azd
azd version

# Hämta aktuell version
azd version

# Visa aktuell konfiguration
azd config list
```

## 🔧 Avancerade kommandon

### Pipelines och CI/CD
```bash
# Konfigurera GitHub Actions
azd pipeline config

# Konfigurera Azure DevOps
azd pipeline config --provider azdo

# Visa pipelinekonfiguration
azd pipeline show
```

### Infrastrukturhantering
```bash
# Generera infrastrukturmallar
azd infra generate

# 🧪 Förhandsgranskning och planering av infrastruktur
azd provision --preview
# Simulerar uppsättning av infrastruktur utan att distribuera
# Analyserar Bicep/Terraform-mallar och visar:
# - Resurser som ska läggas till (grön +)
# - Resurser som ska ändras (gul ~)
# - Resurser som ska tas bort (röd -)
# Säkert att köra - inga faktiska ändringar görs i Azure-miljön

# Syntetisera infrastruktur från azure.yaml
azd infra synth
```

### Projektinformation
```bash
# Visa projektstatus och slutpunkter
azd show

# Visa detaljerad projektinformation som JSON
azd show --output json

# Hämta tjänstens slutpunkter
azd show --output json | jq '.services'
```

## 🤖 AI- och tilläggskommandon

### AZD-tillägg
```bash
# Lista alla tillgängliga tillägg (inklusive AI)
azd extension list

# Installera Foundry agents-tillägget
azd extension install azure.ai.agents

# Installera finjusteringstillägget
azd extension install azure.ai.finetune

# Installera tillägget för anpassade modeller
azd extension install azure.ai.models

# Uppgradera alla installerade tillägg
azd extension upgrade --all
```

### AI-agentkommandon
```bash
# Initiera ett agentprojekt från ett manifest
azd ai agent init -m <manifest-path-or-uri>

# Rikta in mot ett specifikt Foundry-projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ange agentens källkatalog
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Välj ett hostingmål
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-server (Alpha)
```bash
# Starta MCP-servern för ditt projekt
azd mcp start

# Hantera verktygssamtycke för MCP-operationer
azd mcp consent
```

### Infrastrukturgenerering
```bash
# Generera IaC-filer från din projektdefinition
azd infra generate

# Syntetisera infrastruktur från azure.yaml
azd infra synth
```

---

## 🎯 Snabba arbetsflöden

### Utvecklingsarbetsflöde
```bash
# Starta nytt projekt
azd init --template todo-nodejs-mongo
cd my-project

# Distribuera till utveckling
azd env new dev
azd up

# Gör ändringar och distribuera om
azd deploy

# Öppna övervakningspanel
azd monitor --live
```

### Arbetsflöde för flera miljöer
```bash
# Konfigurera miljöer
azd env new dev
azd env new staging  
azd env new production

# Distribuera till dev
azd env select dev
azd up

# Testa och flytta till staging
azd env select staging
azd up

# Distribuera till produktion
azd env select production
azd up
```

### Felsökningsarbetsflöde
```bash
# Aktivera felsökningsläge
export AZD_DEBUG=true

# Kontrollera distributionsstatus
azd show

# Validera konfigurationen
azd config list

# Öppna övervakningspanelen för loggar
azd monitor --logs

# Kontrollera resursstatus
azd show --output json
```

## 🔍 Felsökningskommandon

### Felsökningsinformation
```bash
# Aktivera felsökningsutskrift
export AZD_DEBUG=true
azd <command> --debug

# Inaktivera telemetri för renare utdata
export AZD_DISABLE_TELEMETRY=true

# Kontrollera aktuell konfiguration
azd config list

# Kontrollera autentiseringsstatus
az account show
```

### Felsökning av mallar
```bash
# Lista tillgängliga mallar med detaljer
azd template list --output json

# Visa mallinformation
azd template show <template-name>

# Validera mallen innan init
azd template validate <template-name>
```

## 📁 Fil- och katalogkommandon

### Projektstruktur
```bash
# Visa aktuell katalogstruktur
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigera till azd-projektets rotkatalog
cd $(azd root)

# Visa azd-konfigurationskatalog
echo $AZD_CONFIG_DIR  # Vanligtvis ~/.azd
```

## 🎨 Utdataformattering

### JSON-utdata
```bash
# Hämta JSON-utdata för skriptning
azd show --output json
azd env list --output json
azd config list --output json

# Parsa med jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabellutdata
```bash
# Formatera som tabell
azd env list --output table

# Visa driftsatta tjänster
azd show --output json | jq '.services | keys'
```

## 🔧 Vanliga kommandokombinationer

### Hälsokontrollskript
```bash
#!/bin/bash
# Snabb hälsokontroll
azd show
azd env show
azd monitor --logs
```

### Validering av distribution
```bash
#!/bin/bash
# Validering före driftsättning
azd show
azd provision --preview  # Förhandsgranska ändringar innan driftsättning
az account show
```

### Miljöjämförelse
```bash
#!/bin/bash
# Jämför miljöer
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Skript för rensning av resurser
```bash
#!/bin/bash
# Rensa upp gamla miljöer
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Miljövariabler

### Vanliga miljövariabler
```bash
# Azure-konfiguration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD-konfiguration
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Applikationskonfiguration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Nödfallskommandon

### Snabba åtgärder
```bash
# Återställ autentisering
az account clear
az login

# Tvinga uppdatering av miljön
azd env refresh

# Distribuera om alla tjänster
azd deploy

# Kontrollera distributionsstatus
azd show --output json
```

### Återställningskommandon
```bash
# Återställ efter misslyckad distribution - rensa och distribuera igen
azd down --force --purge
azd up

# Provisionera om endast infrastrukturen
azd provision

# Distribuera om endast applikationen
azd deploy
```

## 💡 Proffstips

### Alias för snabbare arbetsflöde
```bash
# Lägg till i din .bashrc eller .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionsgenvägar
```bash
# Snabb växling mellan miljöer
azd-env() {
    azd env select $1 && azd show
}

# Snabb distribution med övervakning
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Miljöstatus
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Hjälp och dokumentation

### Få hjälp
```bash
# Allmän hjälp
azd --help
azd help

# Kommandospecifik hjälp
azd up --help
azd env --help
azd config --help

# Visa versions- och bygginformation
azd version
azd version --output json
```

### Dokumentationslänkar
```bash
# Öppna dokumentationen i webbläsaren
azd docs

# Visa mallens dokumentation
azd template show <template-name> --docs
```

---

**Tips**: Bokmärk denna fusklapp och använd `Ctrl+F` för att snabbt hitta de kommandon du behöver!

---

**Navigering**
- **Föregående lektion**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Nästa lektion**: [Glossary](glossary.md)

---

> **💡 Vill du ha hjälp med Azure-kommandon i din redigerare?** Installera [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 färdigheter för AI, Foundry, distribution, diagnostik och mer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi eftersträvar noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet på sitt ursprungliga språk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->