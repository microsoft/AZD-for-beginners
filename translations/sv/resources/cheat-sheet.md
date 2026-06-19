# Kommandofusklista - Viktiga AZD-kommandon

**Snabbreferens för alla kapitel**
- **📚 Kursöversikt**: [AZD för nybörjare](../README.md)
- **📖 Snabbstart**: [Kapitel 1: Grunderna & Snabbstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandon**: [Kapitel 2: AI-fokuserad utveckling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancerat**: [Kapitel 4: Infrastruktur som kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Denna omfattande fusklista ger en snabbreferens för de vanligast använda Azure Developer CLI-kommandona, organiserade efter kategori med praktiska exempel. Perfekt för snabba uppslag under utveckling, felsökning och dagliga operationer med azd-projekt.

## Lärandemål

Genom att använda denna fusklista kommer du att:
- Ha omedelbar åtkomst till viktiga Azure Developer CLI-kommandon och syntax
- Förstå kommandoorganisation efter funktionella kategorier och användningsfall
- Referera praktiska exempel för vanliga utvecklings- och driftsättningsscenarier
- Få åtkomst till felsökningskommandon för snabb problemlösning
- Hitta avancerade konfigurations- och anpassningsalternativ effektivt
- Lokalisera kommandon för miljöhantering och arbetsflöden med flera miljöer

## Läranderesultat

Genom regelbunden användning av denna fusklista kommer du att kunna:
- Köra azd-kommandon självsäkert utan att referera till fullständig dokumentation
- Snabbt lösa vanliga problem med lämpliga diagnostiska kommandon
- Effektivt hantera flera miljöer och distributionsscenarier
- Använda avancerade azd-funktioner och konfigurationsalternativ vid behov
- Felsöka distributionsproblem med systematiska kommando-sekvenser
- Optimera arbetsflöden genom effektiv användning av azd-genvägar och alternativ

## Kommandon för att komma igång

### Autentisering
```bash
# Logga in på Azure via AZD
azd auth login

# Logga in i Azure CLI (AZD använder detta bakom kulisserna)
az login

# Kontrollera det aktuella kontot
az account show

# Ställ in standardprenumeration
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logga ut från AZD
azd auth logout

# Logga ut från Azure CLI
az logout
```

### Initiering av projekt
```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera från mall
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initiera i aktuell katalog
azd init .

# Initiera med eget namn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kärnkommandon för distribution

### Komplett distributionsarbetsflöde
```bash
# Distribuera allt (provisionering + distribution)
azd up

# Distribuera med bekräftelsefrågor inaktiverade
azd up --confirm-with-no-prompt

# Distribuera till en specifik miljö
azd up --environment production

# Distribuera med anpassade parametrar
azd up --parameter location=westus2
```

### Endast infrastruktur
```bash
# Provisionera Azure-resurser
azd provision

# 🧪 Förhandsgranska infrastruktursändringar
azd provision --preview
# Visar en simulerad vy av vilka resurser som skulle skapas/ändras/raderas
# Liknar 'terraform plan' eller 'bicep what-if' - säkert att köra, inga ändringar genomförs
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
# Återställ (ladda ner) applikationens beroenden
azd restore

# Återställ en specifik tjänst
azd restore --service api

# Bygg ett distribuerbart paket utan att distribuera
azd package

# Bygg en specifik tjänst
azd package --service api
```

> **`azd restore`** laddar ner din apps beroenden (npm, pip, NuGet, Maven, etc.). Det körs automatiskt under `azd package` och `azd deploy`, så du anropar det sällan direkt—kör det manuellt för att förhämta beroenden (till exempel för att värma en CI-cache eller arbeta offline efteråt).

> **`azd package`** bygger det deploybara artefaktet (en containerbild eller zip) **utan** att pusha det till Azure. Använd det separat för att verifiera att en build lyckas, inspektera utdata eller producera ett artefakt som en separat process kommer att distribuera senare. `azd deploy` paketerar automatiskt, så du behöver bara `azd package` när du vill ha artefaktet utan att distribuera.


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

# Visa tillgängliga miljöer
azd env list

# Uppdatera miljöns tillstånd
azd env refresh
```

### Miljövariabler
```bash
# Sätt miljövariabel
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
azd config show

# Ange globala standardinställningar
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

# Hämta tjänendepunkter
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

# Öppna översikten för Application Insights
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

# Fråga loggar med hjälp av Azure CLI
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

# Rensa mjukt raderade resurser
azd down --purge

# Fullständig rensning
azd down --force --purge
```

### Uppdateringar
```bash
# Kontrollera efter azd-uppdateringar
azd version

# Hämta aktuell version
azd version

# Visa aktuell konfiguration
azd config show
```

## 🔧 Avancerade kommandon

### Pipeline och CI/CD
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
# Generera infrastruktursmallar
azd infra generate

# 🧪 Infrastrukturförhandsgranskning och planering
azd provision --preview
# Simulerar skapande av infrastruktur utan att distribuera
# Analyserar Bicep/Terraform-mallar och visar:
# - Resurser som kommer att läggas till (grön +)
# - Resurser som kommer att ändras (gul ~)
# - Resurser som kommer att tas bort (röd -)
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

# Installera agent skills-tillägget (förhandsgranskning)
azd extension install azure.ai.skills

# Installera Foundry connections-tillägget (förhandsgranskning)
azd extension install azure.ai.connections

# Installera fine-tuning-tillägget
azd extension install azure.ai.finetune

# Installera custom models-tillägget
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

# Välj ett mål för hosting
azd ai agent init -m agent-manifest.yaml --host containerapp

# Testa en driftsatt agent (skriver ut latens + tid till första byte)
azd ai agent invoke

# Visa konfigurationen för den aktiva slutpunkten
azd ai agent endpoint show

# Generera en utvärderingsdatamängd och optimera sedan agenten
azd ai agent eval generate
azd ai agent optimize

# Ladda ner den driftsatta källkoden för en kodbaserad hostad agent
azd ai agent code download

# Ta bort en hostad agent och alla dess versioner (--force avslutar aktiva sessioner)
azd ai agent delete --force
```

### MCP-server (Alpha)
```bash
# Starta MCP-servern för ditt projekt
azd mcp start

# Hantera verktygssamtycke för MCP-operationer
azd copilot consent list
```

### Generering av infrastruktur
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

# Distribuera till utvecklingsmiljön
azd env new dev
azd up

# Gör ändringar och distribuera om
azd deploy

# Öppna övervakningspanelen
azd monitor --live
```

### Arbetsflöde för flera miljöer
```bash
# Konfigurera miljöer
azd env new dev
azd env new staging  
azd env new production

# Driftsätt till dev
azd env select dev
azd up

# Testa och flytta till staging
azd env select staging
azd up

# Driftsätt till produktion
azd env select production
azd up
```

### Felsökningsarbetsflöde
```bash
# Aktivera felsökningsläge
export AZD_DEBUG=true

# Kontrollera distributionsstatus
azd show

# Validera konfiguration
azd config show

# Öppna övervakningspanel för loggar
azd monitor --logs

# Kontrollera resursstatus
azd show --output json
```

## 🔍 Felsökningskommandon

### Felsökningsinformation
```bash
# Aktivera felsökningsutmatning
export AZD_DEBUG=true
azd <command> --debug

# Inaktivera telemetri för renare utdata
export AZD_DISABLE_TELEMETRY=true

# Kontrollera aktuell konfiguration
azd config show

# Kontrollera autentiseringsstatus
az account show
```

### Mallfelsökning
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

## 🎨 Utdataformat

### JSON-utdata
```bash
# Hämta JSON-utdata för skript
azd show --output json
azd env list --output json
azd config show --output json

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

## 🔧 Vanliga kommando­kombinationer

### Hälsokontrollskript
```bash
#!/bin/bash
# Snabb hälsokontroll
azd show
azd env get-values
azd monitor --logs
```

### Distributionvalidering
```bash
#!/bin/bash
# Validering före distribution
azd show
azd provision --preview  # Förhandsgranska ändringar innan distribution
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

### Skript för resursrensning
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

## 🚨 Nödlägeskommandon

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
# Återställ efter misslyckad distribution - rensa och distribuera på nytt
azd down --force --purge
azd up

# Återprovisionera endast infrastrukturen
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
    azd env get-values
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

**Tips**: Bokmärk denna fusklista och använd `Ctrl+F` för att snabbt hitta de kommandon du behöver!

---

**Navigering**
- **Föregående lektion**: [Förhandskontroller](../docs/pre-deployment/preflight-checks.md)
- **Nästa lektion**: [Ordlista](glossary.md)

---

> **💡 Vill du ha hjälp med Azure-kommandon i din redigerare?** Installera [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 skills för AI, Foundry, driftsättning, diagnostik och mer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->