# Kommando-hurtigreferanse - Essensielle AZD-kommandoer

**Rask referanse for alle kapitler**
- **📚 Kurs Hjem**: [AZD For Beginners](../README.md)
- **📖 Rask Start**: [Kapittel 1: Grunnlag & Rask Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapittel 2: AI-First Development](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansert**: [Kapittel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksjon

Dette omfattende juksearket gir rask referanse for de mest brukte Azure Developer CLI-kommandoene, organisert etter kategori med praktiske eksempler. Perfekt for raske oppslag under utvikling, feilsøking og daglige operasjoner med azd-prosjekter.

## Læringsmål

Ved å bruke dette juksearket vil du:
- Ha umiddelbar tilgang til essensielle Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisering etter funksjonelle kategorier og brukstilfeller
- Referere til praktiske eksempler for vanlige utviklings- og utrullingsscenarier
- Ha tilgang til feilsøkingskommandoer for rask problemløsning
- Finne avanserte konfigurasjons- og tilpasningsmuligheter effektivt
- Lokalisere miljøstyrings- og fler-miljø arbeidsflytkommandoer

## Læringsresultater

Med regelmessig bruk av dette juksearket, vil du kunne:
- Kjør azd-kommandoer trygt uten å måtte sjekke full dokumentasjon
- Raskt løse vanlige problemer ved bruk av passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og utrullingsscenarier
- Bruke avanserte azd-funksjoner og konfigurasjonsvalg etter behov
- Feilsøke utrullingsproblemer ved hjelp av systematiske kommando-sekvenser
- Optimalisere arbeidsflyt gjennom effektiv bruk av azd-snarveier og alternativer

## Komme i gang-kommandoer

### Autentisering
```bash
# Logg inn på Azure via AZD
azd auth login

# Logg inn på Azure CLI (AZD bruker dette i bakgrunnen)
az login

# Sjekk gjeldende konto
az account show

# Sett standard abonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logg ut fra AZD
azd auth logout

# Logg ut fra Azure CLI
az logout
```

### Prosjektinitialisering
```bash
# Bla gjennom tilgjengelige maler
azd template list

# Initialiser fra mal
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiser i gjeldende mappe
azd init .

# Initialiser med egendefinert navn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kjerneutrullingskommandoer

### Fullstendig utrullingsarbeidsflyt
```bash
# Distribuer alt (provisjon + distribusjon)
azd up

# Distribuer med bekreftelsesprompt deaktivert
azd up --confirm-with-no-prompt

# Distribuer til spesifikt miljø
azd up --environment production

# Distribuer med tilpassede parametere
azd up --parameter location=westus2
```

### Kun infrastruktur
```bash
# Opprett Azure-ressurser
azd provision

# 🧪 Forhåndsvis infrastrukturendringer
azd provision --preview
# Viser en tørrkjøringsvisning av hvilke ressurser som ville blitt opprettet/endret/slettet
# Lik 'terraform plan' eller 'bicep what-if' - trygt å kjøre, ingen endringer anvendt
```

### Kun applikasjon
```bash
# Distribuer applikasjonskode
azd deploy

# Distribuer spesifikk tjeneste
azd deploy --service web
azd deploy --service api

# Distribuer alle tjenester
azd deploy --all
```

### Bygg og pakk
```bash
# Gjenopprett (last ned) applikasjonsavhengigheter
azd restore

# Gjenopprett en spesifikk tjeneste
azd restore --service api

# Bygg et deployerbart artefakt uten å deployere
azd package

# Bygg en spesifikk tjeneste
azd package --service api
```

> **`azd restore`** laster ned appens avhengigheter (npm, pip, NuGet, Maven osv.). Den kjører automatisk under `azd package` og `azd deploy`, så du kaller sjelden denne direkte — kjør den manuelt for å forhåndshente avhengigheter (for eksempel for å varme opp en CI-cache eller jobbe offline etterpå).

> **`azd package`** bygger det utrullbare artefaktet (et containerbilde eller zip) **uten** å skyve det til Azure. Bruk den alene for å verifisere at byggingen lykkes, inspisere output, eller produsere et artefakt som en separat prosess skal rulle ut senere. `azd deploy` pakker automatisk, så du trenger bare `azd package` når du vil ha artefaktet uten å rulle ut.


## 🌍 Miljøstyring

### Miljøoperasjoner
```bash
# Liste alle miljøer
azd env list

# Opprett nytt miljø
azd env new development
azd env new staging --location westus2

# Velg miljø
azd env select production

# Vis tilgjengelige miljøer
azd env list

# Oppdater miljøstatus
azd env refresh
```

### Miljøvariabler
```bash
# Sett miljøvariabel
azd env set API_KEY "your-secret-key"
azd env set DEBUG true

# Hent miljøvariabel
azd env get API_KEY

# List opp alle miljøvariabler
azd env get-values

# Fjern miljøvariabel
azd env unset DEBUG
```

## ⚙️ Konfigurasjonskommandoer

### Global konfigurasjon
```bash
# List alle konfigurasjoner
azd config show

# Angi globale standarder
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Fjern konfigurasjon
azd config unset defaults.location

# Tilbakestill all konfigurasjon
azd config reset
```

### Prosjektkonfigurasjon
```bash
# Valider azure.yaml
azd config validate

# Vis prosjektinformasjon
azd show

# Hent tjenendepunkter
azd show --output json
```

## 📊 Overvåking og diagnostikk

### Overvåkingsdashbord
```bash
# Åpne Azure-portalen overvåkingsdashboard
azd monitor

# Åpne Application Insights live-metrikker
azd monitor --live

# Åpne Application Insights loggsblad
azd monitor --logs

# Åpne Application Insights oversikt
azd monitor --overview
```

### Vise container-logger
```bash
# Vis logger via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Følg logger i sanntid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vis logger fra Azure-portalen
azd monitor --logs
```

### Logganalyse-spørringer
```bash
# Få tilgang til Logganalyse via Azure-portalen
azd monitor --logs

# Spørr logger ved hjelp av Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Vedlikeholdskommandoer

### Rydding
```bash
# Fjern alle Azure-ressurser
azd down

# Tving sletting uten bekreftelse
azd down --force

# Rens opp i mykt slettede ressurser
azd down --purge

# Fullstendig opprydding
azd down --force --purge
```

### Oppdateringer
```bash
# Sjekk etter azd-oppdateringer
azd version

# Hent gjeldende versjon
azd version

# Vis gjeldende konfigurasjon
azd config show
```

## 🔧 Avanserte kommandoer

### Pipeline og CI/CD
```bash
# Konfigurer GitHub Actions
azd pipeline config

# Konfigurer Azure DevOps
azd pipeline config --provider azdo

# Vis pipeline-konfigurasjon
azd pipeline show
```

### Infrastrukturstyring
```bash
# Generer infrastrukturmaler
azd infra generate

# 🧪 Infrastruktur Forhåndsvisning og Planlegging
azd provision --preview
# Simulerer infrastrukturprovisjonering uten å distribuere
# Analyserer Bicep/Terraform-maler og viser:
# - Ressurser som skal legges til (grønn +)
# - Ressurser som skal endres (gul ~)
# - Ressurser som skal slettes (rød -)
# Trygt å kjøre - ingen faktiske endringer gjort i Azure-miljøet

# Syntetiser infrastruktur fra azure.yaml
azd infra synth
```

### Prosjektinformasjon
```bash
# Vis prosjektstatus og endepunkter
azd show

# Vis detaljert prosjektinfo som JSON
azd show --output json

# Hent tjenesteendepunkter
azd show --output json | jq '.services'
```

## 🤖 AI & Utvidelseskommandoer

### AZD-utvidelser
```bash
# List alle tilgjengelige utvidelser (inkludert AI)
azd extension list

# Installer Foundry agents-utvidelsen
azd extension install azure.ai.agents

# Installer agent skills-utvidelsen (forhåndsvisning)
azd extension install azure.ai.skills

# Installer Foundry connections-utvidelsen (forhåndsvisning)
azd extension install azure.ai.connections

# Installer finjusteringsutvidelsen
azd extension install azure.ai.finetune

# Installer egendefinerte modeller-utvidelsen
azd extension install azure.ai.models

# Oppgrader alle installerte utvidelser
azd extension upgrade --all
```

### AI Agent-kommandoer
```bash
# Initialiser et agentprosjekt fra en manifest
azd ai agent init -m <manifest-path-or-uri>

# Målrett et spesifikt Foundry-prosjekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Spesifiser agentens kildekatalog
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Velg en hosting-mål
azd ai agent init -m agent-manifest.yaml --host containerapp

# Test en distribuert agent (viser latenstid + tid-til-første-byte)
azd ai agent invoke

# Vis konfigurasjonen for live-endepunktet
azd ai agent endpoint show

# Generer et evalueringsdatasett, og optimaliser deretter agenten
azd ai agent eval generate
azd ai agent optimize

# Last ned den distribuerte kilden til en kodebasert hostet agent
azd ai agent code download

# Slett en hostet agent og alle dens versjoner (--force avslutter aktive økter)
azd ai agent delete --force
```

### MCP Server (Alpha)
```bash
# Start MCP-serveren for prosjektet ditt
azd mcp start

# Administrer verktøysamtykke for MCP-operasjoner
azd copilot consent list
```

### Infrastrukturgenerering
```bash
# Generer IaC-filer fra prosjektdefinisjonen din
azd infra generate

# Syntetiser infrastruktur fra azure.yaml
azd infra synth
```

---

## 🎯 Raske arbeidsflyter

### Utviklingsarbeidsflyt
```bash
# Start nytt prosjekt
azd init --template todo-nodejs-mongo
cd my-project

# Distribuer til utvikling
azd env new dev
azd up

# Gjør endringer og distribuer på nytt
azd deploy

# Åpne overvåkingsdashboard
azd monitor --live
```

### Fler-miljø arbeidsflyt
```bash
# Sett opp miljøer
azd env new dev
azd env new staging  
azd env new production

# Distribuer til utvikling
azd env select dev
azd up

# Test og fremm til staging
azd env select staging
azd up

# Distribuer til produksjon
azd env select production
azd up
```

### Feilsøkingsarbeidsflyt
```bash
# Aktiver feilsøkingsmodus
export AZD_DEBUG=true

# Sjekk distribusjonsstatus
azd show

# Valider konfigurasjon
azd config show

# Åpne overvåkingsdashboard for logger
azd monitor --logs

# Sjekk ressursstatus
azd show --output json
```

## 🔍 Debugging-kommandoer

### Debugginformasjon
```bash
# Aktiver feilsøkingsutdata
export AZD_DEBUG=true
azd <command> --debug

# Deaktiver telemetri for renere utdata
export AZD_DISABLE_TELEMETRY=true

# Sjekk gjeldende konfigurasjon
azd config show

# Sjekk autentiseringsstatus
az account show
```

### Sjablong-debugging
```bash
# List opp tilgjengelige maler med detaljer
azd template list --output json

# Vis malinformasjon
azd template show <template-name>

# Valider mal før initiering
azd template validate <template-name>
```

## 📁 Fil- og katalogkommandoer

### Prosjektstruktur
```bash
# Vis gjeldende katalogstruktur
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviger til azd-prosjektets rot
cd $(azd root)

# Vis azd-konfigurasjonskatalog
echo $AZD_CONFIG_DIR  # Vanligvis ~/.azd
```

## 🎨 Output-formattering

### JSON-output
```bash
# Hent JSON-utdata for skripting
azd show --output json
azd env list --output json
azd config show --output json

# Analyser med jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabell-output
```bash
# Formater som tabell
azd env list --output table

# Vis distribuerte tjenester
azd show --output json | jq '.services | keys'
```

## 🔧 Vanlige kommando-kombinasjoner

### Helsesjekk-script
```bash
#!/bin/bash
# Rask helsesjekk
azd show
azd env get-values
azd monitor --logs
```

### Utrullingsvalidering
```bash
#!/bin/bash
# Forhåndsvalidering før distribusjon
azd show
azd provision --preview  # Forhåndsvis endringer før distribusjon
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

### Ressursryddingsscript
```bash
#!/bin/bash
# Rens opp gamle miljøer
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Miljøvariabler

### Vanlige miljøvariabler
```bash
# Azure-konfigurasjon
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD-konfigurasjon
export AZD_DEBUG=true
export AZD_DISABLE_TELEMETRY=true
export AZD_CONFIG_DIR="~/.azd"

# Applikasjonskonfigurasjon
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Nødkommandoer

### Raske fikser
```bash
# Tilbakestill autentisering
az account clear
az login

# Tving oppdatering av miljø
azd env refresh

# Distribuer alle tjenester på nytt
azd deploy

# Sjekk distribusjonsstatus
azd show --output json
```

### Gjenopprettingskommandoer
```bash
# Gjenopprett fra mislykket distribusjon - rengjør og distribuer på nytt
azd down --force --purge
azd up

# Nyprovisjoner bare infrastruktur
azd provision

# Distribuer applikasjonen på nytt kun
azd deploy
```

## 💡 Profftips

### Alias for raskere arbeidsflyt
```bash
# Legg til i din .bashrc eller .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funksjonssnarveier
```bash
# Rask miljøbytte
azd-env() {
    azd env select $1 && azd show
}

# Rask distribusjon med overvåking
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

## 📖 Hjelp og dokumentasjon

### Få hjelp
```bash
# Generell hjelp
azd --help
azd help

# Kommando-spesifikk hjelp
azd up --help
azd env --help
azd config --help

# Vis versjon og byggeinformasjon
azd version
azd version --output json
```

### Dokumentasjonslenker
```bash
# Åpne dokumentasjon i nettleser
azd docs

# Vis maldokumentasjon
azd template show <template-name> --docs
```

---

**Tips**: Bokmerk dette juksearket og bruk `Ctrl+F` for raskt å finne kommandoene du trenger!

---

**Navigasjon**
- **Forrige leksjon**: [Preflight Checks](../docs/pre-deployment/preflight-checks.md)
- **Neste leksjon**: [Glossar](glossary.md)

---

> **💡 Vil du ha Azure-kommando-hjelp i editoren din?** Installer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 ferdigheter for AI, Foundry, utrulling, diagnostikk og mer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->