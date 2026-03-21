# Command Cheat Sheet - Essensielle AZD-kommandoer

**Hurtigreferanse for alle kapitler**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Rask Start**: [Kapittel 1: Grunnlag & Rask Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapittel 2: AI-Først Utvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansert**: [Kapittel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksjon

Dette omfattende juksearket gir en rask referanse for de mest brukte Azure Developer CLI-kommandoene, organisert etter kategori med praktiske eksempler. Perfekt for raske oppslag under utvikling, feilsøking og daglige operasjoner med azd-prosjekter.

## Læringsmål

Ved å bruke dette juksearket vil du:
- Ha umiddelbar tilgang til essensielle Azure Developer CLI-kommandoer og syntaks
- Forstå organisering av kommandoer etter funksjonelle kategorier og bruksområder
- Referere til praktiske eksempler for vanlige utviklings- og distribusjonsscenarier
- Få tilgang til feilsøkingskommandoer for rask problemløsning
- Finne avanserte konfigurasjons- og tilpasningsmuligheter effektivt
- Lokalisere miljøhåndtering og arbeidsflyt for flere miljøer

## Læringsutbytte

Ved jevnlig bruk av dette juksearket vil du kunne:
- Utføre azd-kommandoer trygt uten å referere til full dokumentasjon
- Raskt løse vanlige problemer med passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og distribusjonsscenarier
- Anvende avanserte azd-funksjoner og konfigurasjonsmuligheter etter behov
- Feilsøke distribusjonsproblemer ved hjelp av systematiske kommando-sekvenser
- Optimalisere arbeidsflyter gjennom effektiv bruk av azd-snutter og alternativer

## Kom-i-gang-kommandoer

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

# Initialiser i nåværende mappe
azd init .

# Initialiser med egendefinert navn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kjerne Distribusjonskommandoer

### Fullstendig Distribusjonsarbeidsflyt
```bash
# Distribuer alt (provisjon + distribuer)
azd up

# Distribuer med bekreftelsesforespørsler deaktivert
azd up --confirm-with-no-prompt

# Distribuer til spesifikt miljø
azd up --environment production

# Distribuer med tilpassede parametere
azd up --parameter location=westus2
```

### Kun Infrastruktur
```bash
# Provisjonere Azure-ressurser
azd provision

# 🧪 Forhåndsvis infrastrukturendringer
azd provision --preview
# Viser en tørrkjøringsvisning av hvilke ressurser som ville blitt opprettet/endret/slettet
# Lik 'terraform plan' eller 'bicep what-if' - trygt å kjøre, ingen endringer blir brukt
```

### Kun Applikasjon
```bash
# Distribuer applikasjonskode
azd deploy

# Distribuer spesifikk tjeneste
azd deploy --service web
azd deploy --service api

# Distribuer alle tjenester
azd deploy --all
```

### Bygg og Pakker
```bash
# Bygg applikasjoner
azd package

# Bygg spesifikk tjeneste
azd package --service api
```

## 🌍 Miljøhåndtering

### Miljøoperasjoner
```bash
# Liste alle miljøer
azd env list

# Opprett nytt miljø
azd env new development
azd env new staging --location westus2

# Velg miljø
azd env select production

# Vis gjeldende miljø
azd env show

# Oppdater miljøtilstand
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

### Global Konfigurasjon
```bash
# List alle konfigurasjoner
azd config list

# Sett globale standarder
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

# Hent tjenesteendepunkter
azd show --output json
```

## 📊 Overvåking og Diagnostikk

### Overvåkingsdashbord
```bash
# Åpne Azure-portalen overvåkingsdashbord
azd monitor

# Åpne Application Insights live-metrikker
azd monitor --live

# Åpne Application Insights loggside
azd monitor --logs

# Åpne Application Insights oversikt
azd monitor --overview
```

### Vise Container-logger
```bash
# Vis logger via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Følg logger i sanntid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Vis logger fra Azure-portalen
azd monitor --logs
```

### Logganalyseforespørsler
```bash
# Få tilgang til Logganalyse via Azure-portalen
azd monitor --logs

# Spørr logger ved bruk av Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Vedlikeholdskommandorer

### Rydding
```bash
# Fjern alle Azure-ressurser
azd down

# Tving sletting uten bekreftelse
azd down --force

# Rens opp mykt slettede ressurser
azd down --purge

# Fullstendig opprydding
azd down --force --purge
```

### Oppdateringer
```bash
# Sjekk for azd-oppdateringer
azd version

# Hent gjeldende versjon
azd version

# Vis gjeldende konfigurasjon
azd config list
```

## 🔧 Avanserte Kommandoer

### Pipeline og CI/CD
```bash
# Konfigurer GitHub Actions
azd pipeline config

# Konfigurer Azure DevOps
azd pipeline config --provider azdo

# Vis pipeline-konfigurasjon
azd pipeline show
```

### Infrastrukturadministrasjon
```bash
# Generer infrastrukturmaler
azd infra generate

# 🧪 Infrastrukturforhåndsvisning og planlegging
azd provision --preview
# Simulerer infrastrukturprovisjonering uten å distribuere
# Analyserer Bicep/Terraform-maler og viser:
# - Ressurser som skal legges til (grønn +)
# - Ressurser som skal endres (gul ~)
# - Ressurser som skal slettes (rød -)
# Trygt å kjøre - ingen faktiske endringer utført i Azure-miljø

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

### AZD Utvidelser
```bash
# List opp alle tilgjengelige utvidelser (inkludert AI)
azd extension list

# Installer Foundry agents-utvidelsen
azd extension install azure.ai.agents

# Installer fine-tuning-utvidelsen
azd extension install azure.ai.finetune

# Installer custom models-utvidelsen
azd extension install azure.ai.models

# Oppgrader alle installerte utvidelser
azd extension upgrade --all
```

### AI Agent Kommandoer
```bash
# Initialiser et agentprosjekt fra en manifest
azd ai agent init -m <manifest-path-or-uri>

# Målrett et spesifikt Foundry-prosjekt
azd ai agent init -m agent-manifest.yaml --project-id <foundry-project-id>

# Spesifiser agentens kildekatalog
azd ai agent init -m agent-manifest.yaml --src ./agents/my-agent

# Velg et hostingmål
azd ai agent init -m agent-manifest.yaml --host containerapp
```

### MCP-server (Alfa)
```bash
# Start MCP-serveren for prosjektet ditt
azd mcp start

# Administrer verktøysamtykke for MCP-operasjoner
azd mcp consent
```

### Infrastrukturgenerering
```bash
# Generer IaC-filer fra din prosjektdefinisjon
azd infra generate

# Syntetiser infrastruktur fra azure.yaml
azd infra synth
```

---

## 🎯 Raske Arbeidsflyter

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

# Åpne overvåkingsdashbord
azd monitor --live
```

### Arbeidsflyt for flere miljøer
```bash
# Sett opp miljøer
azd env new dev
azd env new staging  
azd env new production

# Distribuer til dev
azd env select dev
azd up

# Test og promotér til staging
azd env select staging
azd up

# Deploy til produksjon
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
azd config list

# Åpne overvåkingsdashbord for logger
azd monitor --logs

# Sjekk ressursstatus
azd show --output json
```

## 🔍 Feilsøkingskommandoer

### Feilsøkingsinformasjon
```bash
# Aktiver feilsøkingsutdata
export AZD_DEBUG=true
azd <command> --debug

# Deaktiver telemetri for renere utdata
export AZD_DISABLE_TELEMETRY=true

# Sjekk gjeldende konfigurasjon
azd config list

# Sjekk autentiseringsstatus
az account show
```

### Malfeilsøking
```bash
# List tilgjengelige maler med detaljer
azd template list --output json

# Vis malinformasjon
azd template show <template-name>

# Validere mal før initiering
azd template validate <template-name>
```

## 📁 Fil- og Katalogkommandoer

### Prosjektstruktur
```bash
# Vis gjeldende mappestruktur
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviger til azd-prosjektets rotmappe
cd $(azd root)

# Vis azd konfigurasjonsmappe
echo $AZD_CONFIG_DIR  # Vanligvis ~/.azd
```

## 🎨 Utdatavisning

### JSON-utdata
```bash
# Hent JSON-utdata for skripting
azd show --output json
azd env list --output json
azd config list --output json

# Analyser med jq
azd show --output json | jq '.services.web.endpoint'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Tabellutdata
```bash
# Formater som tabell
azd env list --output table

# Vis distribuerte tjenester
azd show --output json | jq '.services | keys'
```

## 🔧 Vanlige Kommando-Kombinasjoner

### Helsekontrollskript
```bash
#!/bin/bash
# Rask helsesjekk
azd show
azd env show
azd monitor --logs
```

### Distribusjonsvalidering
```bash
#!/bin/bash
# Forhåndsvalidering før distribusjon
azd show
azd provision --preview  # Forhåndsvis endringer før distribusjon
az account show
```

### Miljøsammenlikning
```bash
#!/bin/bash
# Sammenlign miljøer
for env in dev staging production; do
    echo "=== $env ==="
    azd env select $env
    azd show --output json | jq '.services[].endpoint'
done
```

### Ressursoppryddingsskript
```bash
#!/bin/bash
# Rydd opp i gamle miljøer
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

### Rask Løsning
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
# Gjenopprett etter mislykket distribusjon - rengjør og distribuer på nytt
azd down --force --purge
azd up

# Gjenopprett infrastruktur alene
azd provision

# Distribuer applikasjon alene på nytt
azd deploy
```

## 💡 Proff Tips

### Alias for Raskere Arbeidsflyt
```bash
# Legg til i din .bashrc eller .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funksjonssnarveier
```bash
# Rask bytte av miljø
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
    azd env show
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Hjelp og Dokumentasjon

### Få Hjelp
```bash
# Generell hjelp
azd --help
azd help

# Kommando-spesifikk hjelp
azd up --help
azd env --help
azd config --help

# Vis versjons- og byggeinformasjon
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
- **Forrige Leksjon**: [Preflight-sjekker](../docs/pre-deployment/preflight-checks.md)
- **Neste Leksjon**: [Ordliste](glossary.md)

---

> **💡 Ønsker du Azure-kommandoassistanse i editoren?** Installer [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) med `npx skills add microsoft/github-copilot-for-azure` — 37 ferdigheter for AI, Foundry, distribusjon, diagnostikk og mer.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->