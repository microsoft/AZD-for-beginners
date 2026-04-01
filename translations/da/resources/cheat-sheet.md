# Kommandooversigt - Væsentlige AZD-kommandoer

**Hurtig reference for alle kapitler**
- **📚 Kursushjem**: [AZD for begyndere](../README.md)
- **📖 Hurtigstart**: [Kapitel 1: Grundlag & Hurtigstart](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapitel 2: AI-først udvikling (anbefalet til AI-udviklere)](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avanceret**: [Kapitel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduktion

Denne omfattende kommandooversigt giver en hurtig reference til de mest anvendte Azure Developer CLI-kommandoer, organiseret efter kategori med praktiske eksempler. Perfekt til hurtige opslag under udvikling, fejlfinding og daglige operationer med azd-projekter.

## Læringsmål

Ved at bruge denne oversigt vil du:
- Have øjeblikkelig adgang til væsentlige Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisation efter funktionelle kategorier og anvendelsestilfælde
- Referere praktiske eksempler til almindelige udviklings- og implementeringsscenarier
- Få adgang til fejlfindingkommandoer til hurtig problemløsning
- Finde avancerede konfigurations- og tilpasningsmuligheder effektivt
- Lokalisere miljøstyrings- og multi-miljø workflow-kommandoer

## Læringsudbytte

Ved regelmæssig reference til denne oversigt vil du kunne:
- Udføre azd-kommandoer selvsikkert uden at skulle slå op i fuld dokumentation
- Hurtigt løse almindelige problemer ved hjælp af passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og implementeringsscenarier
- Anvende avancerede azd-funktioner og konfigurationsmuligheder efter behov
- Fejlsøge implementeringsproblemer ved hjælp af systematiske kommando-sekvenser
- Optimere arbejdsgange gennem effektiv brug af azd-genveje og muligheder

## Kommandoer til at komme i gang

### Autentificering
```bash
# Log ind på Azure via AZD
azd auth login

# Log ind på Azure CLI (AZD bruger dette i baggrunden)
az login

# Kontroller den aktuelle konto
az account show

# Angiv standardabonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Log ud af AZD
azd auth logout

# Log ud af Azure CLI
az logout
```

### Initialisering af projekt
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

## Kerneimplementeringskommandoer

### Komplet implementeringsworkflow
```bash
# Udrul alt (provisionering + udrulning)
azd up

# Udrul med bekræftelsesprompter deaktiveret
azd up --confirm-with-no-prompt

# Udrul til et specifikt miljø
azd up --environment production

# Udrul med brugerdefinerede parametre
azd up --parameter location=westus2
```

### Kun infrastruktur
```bash
# Opret Azure-ressourcer
azd provision

# 🧪 Forhåndsvis ændringer i infrastrukturen
azd provision --preview
# Viser en dry-run-oversigt af, hvilke ressourcer der ville blive oprettet/ændret/slettet
# Ligner 'terraform plan' eller 'bicep what-if' - sikker at køre, ingen ændringer foretages
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

# Byg en specifik service
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

# Vis tilgængelige miljøer
azd env list

# Opdater miljøets status
azd env refresh
```

### Miljøvariabler
```bash
# Indstil miljøvariabel
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hent miljøvariabel
azd env get API_KEY

# List alle miljøvariabler
azd env get-values

# Fjern miljøvariabel
azd env unset DEBUG
```

## ⚙️ Konfigurationskommandoer

### Global konfiguration
```bash
# Vis alle konfigurationer
azd config show

# Angiv globale standardindstillinger
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

# Hent tjenesteendepunkter
azd show --output json
```

## 📊 Overvågning og diagnostik

### Overvågningsdashboard
```bash
# Åbn overvågningsdashboardet i Azure-portalen
azd monitor

# Åbn Application Insights live-metrikker
azd monitor --live

# Åbn logs-bladet i Application Insights
azd monitor --logs

# Åbn oversigten i Application Insights
azd monitor --overview
```

### Visning af containerlogs
```bash
# Vis logfiler via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Følg logfiler i realtid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vis logfiler fra Azure-portalen
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

# Fjern blødt slettede ressourcer permanent
azd down --purge

# Fuldstændig oprydning
azd down --force --purge
```

### Opdateringer
```bash
# Tjek for azd-opdateringer
azd version

# Hent den aktuelle version
azd version

# Vis den aktuelle konfiguration
azd config show
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
# Generer infrastrukturskabeloner
azd infra generate

# 🧪 Forhåndsvisning og planlægning af infrastruktur
azd provision --preview
# Simulerer oprettelse af infrastruktur uden at udrulle
# Analyserer Bicep/Terraform-skabeloner og viser:
# - Ressourcer, der skal tilføjes (grøn +)
# - Ressourcer, der skal ændres (gul ~)
# - Ressourcer, der skal slettes (rød -)
# Sikkert at køre - ingen faktiske ændringer foretages i Azure-miljøet

# Generer infrastruktur ud fra azure.yaml
azd infra synth
```

### Projektinformation
```bash
# Vis projektstatus og endpoints
azd show

# Vis detaljerede projektoplysninger som JSON
azd show --output json

# Hent serviceendpoints
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
# Initialiser et agentprojekt fra et manifest
azd ai agent init -m <manifest-path-or-uri>

# Målret et specifikt Foundry-projekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Angiv agentens kildekatalog
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Vælg et hostingmål
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-server (Alpha)
```bash
# Start MCP-serveren for dit projekt
azd mcp start

# Administrer værktøjssamtykke for MCP-operationer
azd copilot consent list
```

### Infrastrukturgenerering
```bash
# Generér IaC-filer ud fra din projektdefinition
azd infra generate

# Syntetisér infrastruktur ud fra azure.yaml
azd infra synth
```

---

## 🎯 Hurtige arbejdsgange

### Udviklingsworkflow
```bash
# Start et nyt projekt
azd init --template todo-nodejs-mongo
cd my-project

# Udrul til udviklingsmiljø
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

# Udrul til dev
azd env select dev
azd up

# Test og promover til staging
azd env select staging
azd up

# Udrul til produktion
azd env select production
azd up
```

### Fejlsøgningsworkflow
```bash
# Aktivér debug-tilstand
export AZD_DEBUG=true

# Kontroller udrulningsstatus
azd show

# Valider konfiguration
azd config show

# Åbn overvågningsdashboardet for logfiler
azd monitor --logs

# Kontroller ressourcestatus
azd show --output json
```

## 🔍 Fejlfindingskommandoer

### Fejlfindingsoplysninger
```bash
# Aktivér fejlsøgningsoutput
export AZD_DEBUG=true
azd <command> --debug

# Deaktiver telemetri for renere output
export AZD_DISABLE_TELEMETRY=true

# Kontroller den aktuelle konfiguration
azd config show

# Kontroller autentificeringsstatus
az account show
```

### Fejlfinding af skabelon
```bash
# Vis tilgængelige skabeloner med detaljer
azd template list --output json

# Vis skabelonoplysninger
azd template show <template-name>

# Valider skabelon før initialisering
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

# Vis azd-konfigurationsmappe
echo $AZD_CONFIG_DIR  # Normalt ~/.azd
```

## 🎨 Outputformatering

### JSON-output
```bash
# Få JSON-output til scripting
azd show --output json
azd env list --output json
azd config show --output json

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

## 🔧 Almindelige kommando-kombinationer

### Sundhedstjek-script
```bash
#!/bin/bash
# Hurtigt sundhedstjek
azd show
azd env get-values
azd monitor --logs
```

### Implementeringsvalidering
```bash
#!/bin/bash
# Validering før udrulning
azd show
azd provision --preview  # Forhåndsvis ændringer før udrulning
az account show
```

### Miljøsammenligning
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

# Tving opdatering af miljøet
azd env refresh

# Udrul alle tjenester igen
azd deploy

# Kontroller udrulningsstatus
azd show --output json
```

### Gendannelseskommandoer
```bash
# Gendan efter mislykket udrulning - ryd op og udrul igen
azd down --force --purge
azd up

# Genprovisionér kun infrastrukturen
azd provision

# Udrul kun applikationen igen
azd deploy
```

## 💡 Pro-tips

### Alias'er for hurtigere arbejdsgang
```bash
# Tilføj til din .bashrc eller .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktionsgenveje
```bash
# Hurtigt miljøskifte
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
    azd env get-values
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

**Tip**: Bogmærk denne oversigt og brug `Ctrl+F` for hurtigt at finde de kommandoer, du har brug for!

---

**Navigation**
- **Forrige lektion**: [Preflight-kontroller](../docs/pre-deployment/preflight-checks.md)
- **Næste lektion**: [Glossar](glossary.md)

---

> **💡 Vil du have hjælp til Azure-kommandoer i din editor?** Installer [Microsoft Azure Agent-færdigheder](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 færdigheder til AI, Foundry, udrulning, diagnostik og mere.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->