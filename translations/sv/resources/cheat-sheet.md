# Kommandofusklista - Viktiga AZD-kommandon

**Snabbreferens för alla kapitel**
- **📚 Kursstartsida**: [AZD för nybörjare](../README.md)
- **📖 Kom igång**: [Kapitel 1: Grund & Kom igång](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandon**: [Kapitel 2: AI-först utveckling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avancerat**: [Kapitel 4: Infrastruktur som kod](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Detta omfattande fuskblad ger snabbreferens för de mest använda Azure Developer CLI-kommandona, organiserade efter kategori med praktiska exempel. Perfekt för snabba uppslag under utveckling, felsökning och dagliga operationer med azd-projekt.

## Lärandemål

Genom att använda detta fuskblad kommer du att:
- Ha omedelbar åtkomst till viktiga Azure Developer CLI-kommandon och syntax
- Förstå hur kommandon är organiserade efter funktionella kategorier och användningsfall
- Hänvisa till praktiska exempel för vanliga utvecklings- och distributionsscenarier
- Få åtkomst till felsökningskommandon för snabb problemlösning
- Hitta avancerade konfigurations- och anpassningsalternativ effektivt
- Hitta kommandon för hantering av miljöer och arbetsflöden med flera miljöer

## Läranderesultat

Med regelbunden användning av detta fuskblad kommer du att kunna:
- Köra azd-kommandon med självförtroende utan att behöva hänvisa till fullständig dokumentation
- Snabbt lösa vanliga problem med lämpliga diagnostiska kommandon
- Effektivt hantera flera miljöer och distributionsscenarier
- Använda avancerade azd-funktioner och konfigurationsalternativ vid behov
- Felsöka distributionsproblem med hjälp av systematiska kommandosekvenser
- Optimera arbetsflöden genom effektiv användning av azd-genvägar och alternativ

## Kom igång-kommandon

### Autentisering
```bash
# Logga in på Azure via AZD
azd auth login

# Logga in i Azure CLI (AZD använder detta i bakgrunden)
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

### Projektinitiering
```bash
# Bläddra bland tillgängliga mallar
azd template list

# Initiera från mall
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initiera i aktuell katalog
azd init .

# Initiera med anpassat namn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kärnkommandon för distribution

### Komplett distributionsarbetsflöde
```bash
# Distribuera allt (provisionera + driftsätta)
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

# 🧪 Förhandsgranska ändringar i infrastrukturen
azd provision --preview
# Visar en simulerad vy av vilka resurser som skulle skapas/ändras/tas bort
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

# Skapa en ny miljö
azd env new development
azd env new staging --location westus2

# Välj miljö
azd env select production

# Visa tillgängliga miljöer
azd env list

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
azd config show

# Ställ in globala standardinställningar
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

# Hämta slutpunkter för tjänster
azd show --output json
```

## 📊 Övervakning och diagnostik

### Övervakningspanel
```bash
# Öppna övervakningspanelen i Azure-portalen
azd monitor

# Öppna Application Insights live-metriker
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

# Visa loggar i Azure-portalen
azd monitor --logs
```

### Log Analytics-frågor
```bash
# Få åtkomst till Log Analytics via Azure-portalen
azd monitor --logs

# Kör frågor mot loggar med Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Underhållskommandon

### Rensning
```bash
# Ta bort alla Azure-resurser
azd down

# Tvinga borttagning utan bekräftelse
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
azd config show
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
# Generera infrastruktursmallar
azd infra generate

# 🧪 Förhandsgranskning och planering av infrastruktur
azd provision --preview
# Simulerar uppsättning av infrastruktur utan att distribuera
# Analyserar Bicep-/Terraform-mallar och visar:
# - Resurser som ska läggas till (gröna +)
# - Resurser som ska ändras (gula ~)
# - Resurser som ska tas bort (röda -)
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

# Installera tillägget Foundry agents
azd extension install azure.ai.agents

# Installera tillägget för finjustering
azd extension install azure.ai.finetune

# Installera tillägget för anpassade modeller
azd extension install azure.ai.models

# Uppgradera alla installerade tillägg
azd extension upgrade --all
```

### AI-agentkommandon
```bash
# Initiera ett agentprojekt från en manifestfil
azd ai agent init -m <manifest-path-or-uri>

# Rikta in mot ett specifikt Foundry-projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Ange agentens källkatalog
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Välj en värdplattform
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-server (Alpha)
```bash
# Starta MCP-servern för ditt projekt
azd mcp start

# Hantera samtycke för verktyg vid MCP-operationer
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
# Starta ett nytt projekt
azd init --template todo-nodejs-mongo
cd my-project

# Distribuera till utvecklingsmiljön
azd env new dev
azd up

# Gör ändringar och distribuera igen
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

# Distribuera till utvecklingsmiljö
azd env select dev
azd up

# Testa och distribuera till stagingmiljö
azd env select staging
azd up

# Distribuera till produktionsmiljö
azd env select production
azd up
```

### Felsökningsarbetsflöde
```bash
# Aktivera felsökningsläge
export AZD_DEBUG=true

# Kontrollera distributionsstatus
azd show

# Verifiera konfigurationen
azd config show

# Öppna övervakningspanelen för loggar
azd monitor --logs

# Kontrollera resursstatus
azd show --output json
```

## 🔍 Felsökningskommandon

### Felsökningsinformation
```bash
# Aktivera felsökningsutdata
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

# Navigera till azd-projektets rotmapp
cd $(azd root)

# Visa azd-konfigurationskatalog
echo $AZD_CONFIG_DIR  # Vanligtvis ~/.azd
```

## 🎨 Utdataformat

### JSON-utdata
```bash
# Få JSON-utdata för skriptning
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

## 🔧 Vanliga kommando-kombinationer

### Hälsokontrollskript
```bash
#!/bin/bash
# Snabb hälsokontroll
azd show
azd env get-values
azd monitor --logs
```

### Distributionsvalidering
```bash
#!/bin/bash
# Validering före driftsättning
azd show
azd provision --preview  # Förhandsgranska ändringar innan driftsättning
az account show
```

### Jämförelse av miljöer
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

## 🚨 Akuta kommandon

### Snabba åtgärder
```bash
# Återställ autentisering
az account clear
az login

# Tvinga uppdatering av miljön
azd env refresh

# Driftsätt om alla tjänster
azd deploy

# Kontrollera driftsättningsstatus
azd show --output json
```

### Återställningskommandon
```bash
# Återställ från misslyckad driftsättning - rensa och driftsätt om
azd down --force --purge
azd up

# Provisionera om endast infrastrukturen
azd provision

# Driftsätt om endast applikationen
azd deploy
```

## 💡 Pro-tips

### Aliaser för snabbare arbetsflöde
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
# Öppna dokumentation i webbläsaren
azd docs

# Visa dokumentation för mallen
azd template show <template-name> --docs
```

---

**Tips**: Bokmärk detta fuskblad och använd `Ctrl+F` för att snabbt hitta de kommandon du behöver!

---

**Navigering**
- **Föregående lektion**: [Förkontroller](../docs/pre-deployment/preflight-checks.md)
- **Nästa lektion**: [Ordlista](glossary.md)

---

> **💡 Vill du ha hjälp med Azure-kommandon i din redigerare?** Installera [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 färdigheter för AI, Foundry, distribution, diagnostik och mer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig uppmärksam på att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess originals​​pråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->