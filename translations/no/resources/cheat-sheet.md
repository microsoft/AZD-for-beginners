# Kommandooversikt - Essensielle AZD-kommandoer

**Rask Referanse for Alle Kapitler**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../README.md)
- **📖 Rask Start**: [Kapittel 1: Grunnlag & Rask Start](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-kommandoer**: [Kapittel 2: AI-Først Utvikling](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Avansert**: [Kapittel 4: Infrastruktur som kode](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Introduksjon

Dette omfattende juksearket gir rask referanse for de mest brukte Azure Developer CLI-kommandoene, organisert etter kategori med praktiske eksempler. Perfekt for raske oppslag under utvikling, feilsøking og daglige operasjoner med azd-prosjekter.

## Læringsmål

Ved å bruke dette juksearket vil du:
- Ha umiddelbar tilgang til essensielle Azure Developer CLI-kommandoer og syntaks
- Forstå kommandoorganisering etter funksjonelle kategorier og bruksområder
- Referere til praktiske eksempler for vanlige utviklings- og distribusjonsscenarier
- Ha tilgang til feilsøkingskommandoer for rask problemløsning
- Finne avanserte konfigurasjons- og tilpasningsmuligheter effektivt
- Lokalisere miljøstyring og multi-miljø arbeidsflyt-kommandoer

## Læringsutbytte

Med regelmessig referanse til dette juksearket vil du kunne:
- Utføre azd-kommandoer med selvtillit uten å måtte se i full dokumentasjon
- Raskt løse vanlige problemer ved bruk av passende diagnostiske kommandoer
- Effektivt administrere flere miljøer og distribusjonsscenarier
- Anvende avanserte azd-funksjoner og konfigurasjonsmuligheter etter behov
- Feilsøke distribusjonsproblemer ved hjelp av systematiske kommandosekvenser
- Optimalisere arbeidsflyter gjennom effektiv bruk av azd-snabbkommandoer og alternativer

## Komme i Gang Kommandoer

### Autentisering
```bash
# Logg inn på Azure via AZD
azd auth login

# Logg inn på Azure CLI (AZD bruker dette under panseret)
az login

# Sjekk gjeldende konto
az account show

# Sett standardabonnement
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logg ut fra AZD
azd auth logout

# Logg ut fra Azure CLI
az logout
```

### Prosjekt Initialisering
```bash
# Bla gjennom tilgjengelige maler
azd template list

# Initialiser fra mal
azd init --template todo-nodejs-mongo
azd init --template <template-name>

# Initialiser i gjeldende katalog
azd init .

# Initialiser med egendefinert navn
azd init --template todo-nodejs-mongo my-awesome-app
```

## Kjerne Distribusjonskommandoer

### Komplett Distribusjonsarbeidsflyt
```bash
# Distribuer alt (klargjøring + distribusjon)
azd up

# Distribuer med bekreftelsesmeldinger deaktivert
azd up --confirm-with-no-prompt

# Distribuer til spesifikt miljø
azd up --environment production

# Distribuer med egendefinerte parametere
azd up --parameter location=westus2
```

### Kun Infrastruktur
```bash
# Provisionere Azure-ressurser
azd provision

# 🧪 Forhåndsvis infrastrukturendringer
azd provision --preview
# Viser en tørrkjøringsvisning av hvilke ressurser som ville blitt opprettet/endret/slettet
# Ligner på 'terraform plan' eller 'bicep what-if' - trygt å kjøre, ingen endringer blir anvendt
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

### Bygg og Pakk
```bash
# Bygg applikasjoner
azd package

# Bygg spesifikk tjeneste
azd package --service api
```

## 🌍 Miljøstyring

### Miljøoperasjoner
```bash
# List opp alle miljøer
azd env list

# Opprett nytt miljø
azd env new development
azd env new staging --location westus2

# Velg miljø
azd env select production

# Vis gjeldende miljø
azd env show

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

# List alle miljøvariabler
azd env get-values

# Fjern miljøvariabel
azd env unset DEBUG
```

## ⚙️ Konfigurasjonskommandoer

### Global Konfigurasjon
```bash
# List alle konfigurasjoner
azd config list

# Sett globale standardverdier
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

# Få tjenestepunkter
azd show --output json
```

## 📊 Overvåking og Diagnostikk

### Overvåkingsdashboard
```bash
# Åpne Azure-portalen overvåkingsdashbord
azd monitor

# Åpne Application Insights live-metric
azd monitor --live

# Åpne Application Insights loggblad
azd monitor --logs

# Åpne Application Insights oversikt
azd monitor --overview
```

### Vise Container-logger
```bash
# Se logger via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Følg logger i sanntid
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# Se logger fra Azure Portal
azd monitor --logs
```

### Logganalyse Spørringer
```bash
# Få tilgang til Logganalyse via Azure-portalen
azd monitor --logs

# Spørr i logger ved hjelp av Azure CLI
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

# Rens opp mykt slettede ressurser
azd down --purge

# Komplett opprydding
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
# Simulerer infrastrukturutplassering uten å distribuere
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

# Hent tjenestens endepunkter
azd show --output json | jq '.services'
```

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

# Åpne overvåkingsdashboard
azd monitor --live
```

### Multi-Miljø Arbeidsflyt
```bash
# Sett opp miljøer
azd env new dev
azd env new staging  
azd env new production

# Distribuer til utvikling
azd env select dev
azd up

# Test og promoter til staging
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

# Validere konfigurasjon
azd config list

# Åpne overvåkingsdashboard for logger
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

# Valider mal før initiering
azd template validate <template-name>
```

## 📁 Fil- og Katalogkommandoer

### Prosjektstruktur
```bash
# Vis gjeldende katalogstruktur
tree /f  # Windows
find . -type f  # Linux/macOS

# Naviger til azd prosjektrot
cd $(azd root)

# Vis azd konfigurasjonskatalog
echo $AZD_CONFIG_DIR  # Vanligvis ~/.azd
```

## 🎨 Utdataformatering

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

## 🔧 Vanlige Kommando Kombinasjoner

### Helsekontroll Script
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
# Forhåndsgodkjenning før distribusjon
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

### Ressursryddings Script
```bash
#!/bin/bash
# Rydd opp gamle miljøer
azd env list | grep -E "(dev-|test-)" | while read env; do
    echo "Cleaning up $env"
    azd env select $env
    azd down --force --purge
done
```

## 📝 Miljøvariabler

### Vanlige Miljøvariabler
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

### Raske Fiks
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
# Gjenopprett fra mislykket distribusjon - rydd opp og distribuer på nytt
azd down --force --purge
azd up

# Reprovisjoner kun infrastrukturen
azd provision

# Distribuer applikasjonen på nytt alene
azd deploy
```

## 💡 Profesjonelle Tips

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
- **Forrige Leksjon**: [Preflight-sjekker](../docs/pre-deployment/preflight-checks.md)
- **Neste Leksjon**: [Glossar](glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi etterstreber nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Originaldokumentet på det opprinnelige språket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->