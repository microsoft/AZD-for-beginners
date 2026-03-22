# Kommando-snydeark - Væsentlige AZD-kommandoer

**Hurtig reference for alle kapitler**
- **📚 Kursusforside**: [AZD for begyndere](../README.md)
- **📖 Kom godt i gang**: [Kapitel 1: Grundlag & Kom godt i gang](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapitel 2: AI-først udvikling (anbefalet for AI-udviklere)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanceret**: [Kapitel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Dette omfattende snydeark giver en hurtig reference til de mest anvendte Azure Developer CLI-kommandoer, organiseret efter kategori med praktiske eksempler. Perfekt til hurtige opslag under udvikling, fejlfinding og daglig drift af azd-projekter.

## Læringsmål

Ved at bruge dette snydeark vil du:
- Få øjeblikkelig adgang til væsentlige Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisering efter funktionelle kategorier og anvendelsestilfælde
- Konsulter praktiske eksempler for almindelige udviklings- og udrulningsscenarier
- Få adgang til kommandoer til fejlfinding for hurtig problemløsning
- Find avancerede konfigurations- og tilpasningsmuligheder effektivt
- Find kommandoer til miljøstyring og arbejdsgange for flere miljøer

## Læringsresultater

Ved regelmæssig brug af dette snydeark vil du være i stand til at:
- Udføre azd-kommandoer med selvtillid uden at skulle konsultere den fulde dokumentation
- Hurtigt løse almindelige problemer ved hjælp af passende diagnostiske kommandoer
- Effektivt håndtere flere miljøer og udrulningsscenarier
- Anvende avancerede azd-funktioner og konfigurationsmuligheder efter behov
- Fejlsøge udrulningsproblemer ved hjælp af systematiske kommando-sekvenser
- Optimere arbejdsgange gennem effektiv brug af azd-genveje og muligheder

## Kom godt i gang-kommandoer

### Autentificering
```bash
# Log ind på Azure via AZD
azd auth login

# Log ind på Azure CLI (AZD bruger dette bag kulisserne)
az login

# Tjek den aktuelle konto
az account show

# Angiv standardabonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Log ud af AZD
azd auth logout

# Log ud af Azure CLI
az logout
```

### Projektinitialisering
```bash
# Gennemse tilgængelige skabeloner
azd template list

# Initialiser fra skabelon
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiser i den aktuelle mappe
azd init .

# Initialiser med brugerdefineret navn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kerneudrulningskommandoer

### Komplet udrulningsworkflow
```bash
# Udrul alt (opsætning + udrulning)
azd up

# Udrul med bekræftelsesforespørgsler deaktiveret
azd up --confirm-with-no-prompt

# Udrul til et specifikt miljø
azd up --environment production

# Udrul med brugerdefinerede parametre
azd up --parameter location=westus2
```

### Kun infrastruktur
```bash
# Provisionér Azure-ressourcer
azd provision

# 🧪 Forhåndsvis infrastrukturændringer
azd provision --preview
# Viser en tørkørsel af, hvilke ressourcer der ville blive oprettet/ændret/slettet
# Ligner 'terraform plan' eller 'bicep what-if' - sikkert at køre, ingen ændringer bliver anvendt
```

### Kun applikation
```bash
# Udrul applikationskode
azd deploy

# Udrul en specifik tjeneste
azd deploy --service web
azd deploy --service api

# Udrul alle tjenester
azd deploy --all
```

### Byg og pak
```bash
# Byg applikationer
azd package

# Byg en specifik tjeneste
azd package --service api
```

## 🌍 Miljøstyring

### Miljøoperationer
```bash
# Vis alle miljøer
azd env list

# Opret nyt miljø
azd env new development
azd env new staging --location westus2

# Vælg miljø
azd env select production

# Vis det aktuelle miljø
azd env show

# Opdater miljøets tilstand
azd env refresh
```

### Miljøvariabler
```bash
# Indstil miljøvariabel
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hent miljøvariabel
azd env get API_KEY

# Vis alle miljøvariabler
azd env get-values

# Fjern miljøvariabel
azd env unset DEBUG
```

## ⚙️ Konfigurationskommandoer

### Global konfiguration
```bash
# Vis alle konfigurationer
azd config list

# Indstil globale standardindstillinger
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Fjern konfiguration
azd config unset defaults.location

# Nulstil alle konfigurationer
azd config reset
```

### Projektkonfiguration
```bash
# Valider azure.yaml
azd config validate

# Vis projektinformation
azd show

# Hent tjenestens endepunkter
azd show --output json
```

## 📊 Overvågning og diagnostik

### Overvågningsdashboard
```bash
# Åbn overvågningsdashboardet i Azure-portalen
azd monitor

# Åbn live-målinger i Application Insights
azd monitor --live

# Åbn logbladet i Application Insights
azd monitor --logs

# Åbn oversigten i Application Insights
azd monitor --overview
```

### Visning af containerlogs
```bash
# Se logfiler via Azure CLI (til Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Følg logfiler i realtid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Se logfiler fra Azure-portalen
azd monitor --logs
```

### Log Analytics-forespørgsler
```bash
# Få adgang til Log Analytics via Azure-portalen
azd monitor --logs

# Forespørg logfiler ved hjælp af Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Vedligeholdelseskommandoer

### Oprydning
```bash
# Fjern alle Azure-ressourcer
azd down

# Tving sletning uden bekræftelse
azd down --force

# Slet permanent blødt slettede ressourcer
azd down --purge

# Komplet oprydning
azd down --force --purge
```

### Opdateringer
```bash
# Tjek for azd-opdateringer
azd version

# Hent den aktuelle version
azd version

# Vis den aktuelle konfiguration
azd config list
```

## 🔧 Avancerede kommandoer

### Pipelines og CI/CD
```bash
# Konfigurer GitHub Actions
azd pipeline config

# Konfigurer Azure DevOps
azd pipeline config --provider azdo

# Vis pipelinekonfiguration
azd pipeline show
```

### Infrastrukturstyring
```bash
# Generer infrastruktursskabeloner
azd infra generate

# 🧪 Forhåndsvisning og planlægning af infrastruktur
azd provision --preview
# Simulerer udrulning af infrastruktur uden at implementere
# Analyserer Bicep/Terraform-skabeloner og viser:
# - Ressourcer, der vil blive tilføjet (grøn +)
# - Ressourcer, der vil blive ændret (gul ~)
# - Ressourcer, der vil blive slettet (rød -)
# Sikkert at køre - ingen faktiske ændringer foretages i Azure-miljøet

# Syntetiser infrastruktur fra azure.yaml
azd infra synth
```

### Projektinformation
```bash
# Vis projektstatus og endepunkter
azd show

# Vis detaljeret projektinfo som JSON
azd show --output json

# Hent serviceendepunkter
azd show --output json | jq '.services'
```

## 🤖 AI- og udvidelseskommandoer

### AZD-udvidelser
```bash
# Vis alle tilgængelige udvidelser (inklusive AI)
azd extension list

# Installer Foundry Agents-udvidelsen
azd extension install azure.ai.agents

# Installer finjusteringsudvidelsen
azd extension install azure.ai.finetune

# Installer udvidelsen til brugerdefinerede modeller
azd extension install azure.ai.models

# Opgrader alle installerede udvidelser
azd extension upgrade --all
```

### AI-agentkommandoer
```bash
# Initialiser et agentprojekt fra en manifestfil
azd ai agent init -m <manifest-path-or-uri>

# Ret mod et specifikt Foundry-projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Angiv agentens kildemappe
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vælg et hostingmål
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-server (Alpha)
```bash
# Start MCP-serveren for dit projekt
azd mcp start

# Administrer værktøjstilladelser til MCP-operationer
azd mcp consent
```

### Infrastrukturgenerering
```bash
# Generer IaC-filer fra din projektdefinition
azd infra generate

# Syntetiser infrastruktur fra azure.yaml
azd infra synth
```

---

## 🎯 Hurtige workflows

### Udviklingsworkflow
```bash
# Start nyt projekt
azd init --template todo-nodejs-mongo
cd my-project

# Udrul til udvikling
azd env new dev
azd up

# Foretag ændringer og udrul igen
azd deploy

# Åbn overvågningsdashboard
azd monitor --live
```

### Workflow for flere miljøer
```bash
# Opsæt miljøer
azd env new dev
azd env new staging  
azd env new production

# Udrul til udvikling
azd env select dev
azd up

# Test og promover til staging
azd env select staging
azd up

# Udrul til produktion
azd env select production
azd up
```

### Fejlfinding-workflow
```bash
# Aktivér fejlsøgningstilstand
export AZD_DEBUG=true

# Kontroller udrulningsstatus
azd show

# Valider konfigurationen
azd config list

# Åbn overvågningsdashboardet for logfiler
azd monitor --logs

# Kontroller ressourcestatus
azd show --output json
```

## 🔍 Fejlsøgningskommandoer

### Fejlsøgningsinformation
```bash
# Aktivér debug-output
export AZD_DEBUG=true
azd <command> --debug

# Deaktiver telemetri for et renere output
export AZD_DISABLE_TELEMETRY=true

# Kontroller den aktuelle konfiguration
azd config list

# Kontroller autentificeringsstatus
az account show
```

### Fejlsøgning af skabeloner
```bash
# Vis tilgængelige skabeloner med detaljer
azd template list --output json

# Vis skabelonoplysninger
azd template show <template-name>

# Valider skabelon før init
azd template validate <template-name>
```

## 📁 Fil- og bibliotekskommandoer

### Projektstruktur
```bash
# Vis den aktuelle mappestruktur
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviger til azd-projektets rodmappe
cd $(azd root)

# Vis azd-konfigurationsmappen
echo $AZD_CONFIG_DIR  # Normalt ~/.azd
```

## 🎨 Outputformatering

### JSON-output
```bash
# Hent JSON-output til scripting
azd show --output json
azd env list --output json
azd config list --output json

# Analyser med jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabeloutput
```bash
# Formater som tabel
azd env list --output table

# Vis udrullede tjenester
azd show --output json | jq '.services | keys'
```

## 🔧 Almindelige kombinationer af kommandoer

### Sundhedstjek-script
```bash
#!/bin/bash
# Hurtigt sundhedstjek
azd show
azd env show
azd monitor --logs
```

### Udrulningsvalidering
```bash
#!/bin/bash
# Validering før udrulning
azd show
azd provision --preview  # Forhåndsvis ændringer før udrulning
az account show
```

### Sammenligning af miljøer
```bash
#!/bin/bash
# Sammenlign miljøer
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressourceoprydningsscript
```bash
#!/bin/bash
# Ryd op i gamle miljøer
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Miljøvariabler

### Almindelige miljøvariabler
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

## 🚨 Nødkommandoer

### Hurtige rettelser
```bash
# Nulstil autentificering
az account clear
az login

# Tving opdatering af miljø
azd env refresh

# Genudrul alle tjenester
azd deploy

# Kontroller udrulningsstatus
azd show --output json
```

### Gendannelseskommandoer
```bash
# Gendan efter mislykket udrulning - ryd op og udrul igen
azd down --force --purge
azd up

# Genopsæt kun infrastrukturen
azd provision

# Udrul kun applikationen igen
azd deploy
```

## 💡 Pro-tip

### Aliasser for hurtigere arbejdsgang
```bash
# Tilføj til din .bashrc eller .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Genveje til funktioner
```bash
# Hurtigt skift mellem miljøer
azd-env() {
    azd env select $1 && azd show
}

# Hurtig udrulning med overvågning
azd-deploy-watch() {
    azd deploy --service $1 && azd monitor --live
}

# Miljøstatus
azd-status() {
    echo "Current environment:"
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Hjælp og dokumentation

### Få hjælp
```bash
# Generel hjælp
azd --help
azd help

# Kommando-specifik hjælp
azd up --help
azd env --help
azd config --help

# Vis versions- og buildoplysninger
azd version
azd version --output json
```

### Dokumentationslinks
```bash
# Åbn dokumentationen i browseren
azd docs

# Vis dokumentation for skabelonen
azd template show <template-name> --docs
```

---

**Tip**: Bogmærk dette snydeark og brug `Ctrl+F` for hurtigt at finde de kommandoer, du har brug for!

---

**Navigation**
- **Forrige lektion**: [Preflight-tjek](../docs/pre-deployment/preflight-checks.md)
- **Næste lektion**: [Ordliste](glossary.md)

---

> **💡 Vil du have hjælp til Azure-kommandoer i din editor?** Installer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 færdigheder til AI, Foundry, udrulning, diagnostik og mere.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, bedes du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->