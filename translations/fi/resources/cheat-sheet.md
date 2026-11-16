# Komentojen pikakuvake – olennaiset AZD-komennot

**Nopea viite kaikille luvuillesi**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Pika-aloitus**: [Luku 1: Perusta & pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-komennot**: [Luku 2: AI-ensimmäinen kehitys](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Edistynyt**: [Luku 4: Infrastruktuuri koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Johdanto

Tämä kattava pikakuvake tarjoaa nopean viitteen yleisimmin käytetyistä Azure Developer CLI -komennoista, järjestettynä kategorioittain käytännön esimerkkien kanssa. Täydellinen nopeaan tarkistukseen kehityksen, vianmäärityksen ja päivittäisen azd-projektien kanssa työskentelyn aikana.

## Oppimistavoitteet

Tämän pikakuvakkeen avulla sinä:
- Saat välittömän pääsyn olennaisiin Azure Developer CLI -komentoihin ja syntaksiin
- Ymmärrät komentojen järjestämisen toiminnallisiin kategorioihin ja käyttötapauksiin
- Löydät käytännön esimerkkejä yleisistä kehitys- ja käyttöönotto-tilanteista
- Saat vianmäärityskomennot nopeaan ongelmanratkaisuun
- Löydät tehokkaasti edistyneet määrittely- ja mukautusvaihtoehdot
- Löydät komentojen hallinnan ympäristöjen ja monien ympäristöjen työnkulkuun

## Oppimistulokset

Kun viittaat tähän pikakuvakkeeseen säännöllisesti, pystyt:
- Suorittamaan azd-komennot itsevarmasti ilman täydelliseen dokumentaatioon viittaamista
- Ratkaisemaan nopeasti yleisiä ongelmia asianmukaisilla diagnoosikomennoilla
- Hallitsemaan tehokkaasti useita ympäristöjä ja käyttöönotto-tilanteita
- Käyttämään tarpeen mukaan edistyneitä azd-ominaisuuksia ja määritysvaihtoehtoja
- Vianmäärityksessä käyttämään järjestelmällistä komentojonoa käyttöönotto-ongelmien ratkaisuun
- Optimoimaan työnkulkuja azd-pikakomentojen ja -asetusten tehokkaalla käytöllä

## Aloituskäskyt

### Todennus
```bash
# Login to Azure via AZD
azd auth login

# Optional: login separately for exercises or hooks that run Azure CLI
az login

# Check Azure CLI's current account (not AZD's login)
az account show

# Set default subscription
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"

# Logout from AZD
azd auth logout

# Logout from Azure CLI
az logout
```

### Projektin alustaminen
```bash
# Browse available templates
azd template list

# Initialize from a template in the current empty directory (alternatives)
azd init --template todo-nodejs-mongo .
azd init --template <template-name> .

# Initialize in current directory
azd init .

# Initialize with custom name
azd init --template todo-nodejs-mongo my-awesome-app
cd my-awesome-app
```

## Peruskäyttöönoton komennot

### Täydellinen käyttöönoton työnkulku
```bash
# Deploy everything (provision + deploy)
azd up

# Deploy with confirmation prompts disabled
azd up --no-prompt

# Deploy to specific environment
azd up --environment production

# Persist the region before deployment
azd env set AZURE_LOCATION westus2
azd up
```

### Pelkkä infrastruktuuri
```bash
# Provision Azure resources
azd provision

# 🧪 Preview infrastructure changes
azd provision --preview
# Uses provider-specific planning (Bicep what-if / Terraform plan)
# It can require Azure reads and can run configured lifecycle hooks
```

### Pelkkä sovellus
```bash
# Deploy application code
azd deploy

# Deploy specific service
azd deploy web
azd deploy api

# Deploy all services
azd deploy --all
```

### Kokoa ja pakkaa
```bash
# Restore (download) application dependencies
azd restore

# Restore a specific service
azd restore api

# Build a deployable artifact without deploying
azd package

# Build specific service
azd package api
```

> **`azd restore`** lataa sovelluksesi riippuvuudet (npm, pip, NuGet, Maven jne.). Se suoritetaan automaattisesti `azd package` ja `azd deploy` aikana, joten sitä ei harvoin kutsuta suoraan — suorita manuaalisesti ennakkonoutoa varten (esimerkiksi CI välimuistin lämmittämiseen tai offline-tilassa työskentelyyn myöhemmin).

> **`azd package`** valmistaa käyttöönottokelpoisen paketin ilman, että sovelluspalvelua otetaan käyttöön. Käytös riippuu kielestä ja isännästä: konttipakkaus voi käyttää Azure etärakennuksia ja julkaista kuvat rekisteriin, joten se ei välttämättä ole offline-tilassa tai Azure-kirjoituksista vapaa. `azd deploy` voi pakata automaattisesti; käytä erillistä pakkausvaihetta, kun tarvitset artefaktin tai rakennustarkistuksen.


## 🌍 Ympäristön hallinta

### Ympäristötoiminnot
```bash
# List all environments
azd env list

# Create new environment
azd env new development
azd env new staging --location westus2

# Select environment
azd env select production

# Show available environments
azd env list

# Refresh environment state
azd env refresh
```

### Ympäristömuuttujat
```bash
# Set environment variable
azd env set LOG_LEVEL info
azd env set DEBUG true

# Get environment variable
azd env get-value LOG_LEVEL

# List all environment variables
azd env get-values

# Remove environment variable (beta in AZD 1.37.0+)
azd env unset DEBUG
```

Ympäristötiedostot ovat tekstimuotoisia. Älä käsittele `azd env set`:tä salaisena tallennustilana; käytä Key Vault -viittauksia tai hallittua identiteettiä tilanteen mukaan.

## ⚙️ Määrityskomennot

### Globaali määritys
```bash
# List all configuration
azd config show

# Set global defaults
azd config set defaults.location eastus2
azd config set defaults.subscription "sub-id"

# Remove configuration
azd config unset defaults.location

# Reset all configuration
azd config reset
```

### Projektin määritys
```bash
# Inspect user configuration (this is not azure.yaml validation)
azd config show

# Show project information
azd show

# Get service endpoints
azd show --output json
```

## 📊 Valvonta ja diagnostiikka

### Valvontapaneeli
```bash
# Open Azure portal monitoring dashboard
azd monitor

# Open Application Insights live metrics
azd monitor --live

# Open Application Insights logs blade
azd monitor --logs

# Open Application Insights overview
azd monitor --overview
```

Application Insights täytyy määrittää mallilla. AZD:n Live Metrics -vaihtoehtoa ei tällä hetkellä tueta Python-sovelluksille; käytä sijasta yleiskatsausta, lokeja tai näytteen dokumentoitua jäljitystyönkulkua.

### Säiliölokien katselu
```bash
# View logs via Azure CLI (for Container Apps)
az containerapp logs show --name <app-name> --resource-group <rg-name>

# Follow logs in real-time
az containerapp logs show --name <app-name> --resource-group <rg-name> --follow

# View logs from Azure Portal
azd monitor --logs
```

### Log Analytics -kyselyt
```bash
# Access Log Analytics via Azure Portal
azd monitor --logs

# Query logs using Azure CLI
az monitor log-analytics query \
  --workspace <workspace-id> \
  --analytics-query "AppTraces | where TimeGenerated > ago(1h)"
```

## 🛠️ Huoltokomennot

### Siivous
```bash
# Remove all Azure resources
azd down

# Force delete without confirmation
azd down --force

# Purge soft-deleted resources
azd down --purge

# Complete cleanup
azd down --force --purge
```

### Päivitykset
```bash
# Check for azd updates
azd version

# Get current version
azd version

# View current configuration
azd config show
```

## 🔧 Edistyneet komennot

### Pipeline ja CI/CD
```bash
# Configure GitHub Actions
azd pipeline config

# Configure Azure DevOps
azd pipeline config --provider azdo

# Inspect supported pipeline configuration options
azd pipeline config --help
```

### Infrastruktuurin hallinta
```bash
# Generate infrastructure templates
azd infra generate

# 🧪 Infrastructure Preview & Planning
azd provision --preview
# Simulates infrastructure provisioning without deploying
# Analyzes Bicep/Terraform templates and shows:
# - Resources to be added (green +)
# - Resources to be modified (yellow ~) 
# - Resources to be deleted (red -)
# Review provider behavior and configured hooks before treating preview as read-only

# Inspect supported infrastructure operations
azd infra --help
```

### Projektin tiedot
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI & Laajennukset

### AZD-laajennukset

AI CLI -viite tarkistettu 2026-11-04: `azd 1.37.2`, agentit `1.0.0-beta.23`, arvioinnit `1.0.0-beta.2`. Käytä `azd >= 1.37.0` yhdistettyyn työnkulkuun; päivitä ydinkomennot ennen yhteensopimattomia laajennuksia.

```bash
# List all available extensions (including AI)
azd extension list

# Install the Foundry agents extension
azd extension install azure.ai.agents

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the agent skills extension (preview)
azd extension install azure.ai.skills

# Install the Foundry connections extension (preview)
azd extension install azure.ai.connections

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Upgrade all installed extensions
azd extension upgrade --all
```

### AI-agenttien komennot
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` korvaa vanhentuneen `--manifest`/`-m` kirjoitusasun; vanhat manifestit vaativat migraation. Ei ole nykyistä agent-init-`--host containerapp` -vaihtoehtoa. Hallittu-harjanne, puhe ja pitkäkestoiset ennakkoversiot tarvitsevat itsenäisen shell/CI-ympäristön hyväksynnän; katso [AI CLI -viite](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

### AI-arvioinnit ja optimointi
```bash
# In an initialized agent project, configure evaluation resources
azd ai eval init

# Optionally generate a rubric and dataset; review files and printed next steps
azd ai eval generate

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agentit beta.22 korvasi perinteiset arviointikomentot `azd ai eval` -komennolla `azure.ai.evaluations`:stä. Uusi arviointimääritys käyttää camelCase-avaimia. Optimointi `--config` ottaa erillisen optimointin API-kutsun, **ei** perinteistä `eval.yaml` tai uutta `azure.eval.yaml`; käytä `--eval`/`--eval-config` arvioinnin uudelleenkäyttöön. Katso [arvioinnin asennus](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ja [optimoinnin migraatio](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### MCP-palvelin (Alfa)
```bash
# Start the MCP server for your project
azd mcp start

# Manage tool consent for MCP operations
azd copilot consent list
```

### Infrastruktuurin generointi
```bash
# Generate IaC files from your project definition
azd infra generate

# Inspect supported infrastructure operations
azd infra --help
```

---

## 🎯 Nopeat työnkulut

### Kehitystyön työnkulku
```bash
# Start a new project in an explicit directory
azd init --template todo-nodejs-mongo my-project
cd my-project

# Deploy to development
azd env new dev
azd up

# Make changes and redeploy
azd deploy

# Open monitoring dashboard
azd monitor --live
```

### Moniympäristöinen työnkulku
```bash
# Set up environments
azd env new dev
azd env new staging  
azd env new production

# Deploy to dev
azd env select dev
azd up

# Test and promote to staging
azd env select staging
azd up

# Deploy to production
azd env select production
azd up
```

### Vianmääritystyönkulku
```bash
# Check deployment status
azd show --debug

# Validate configuration
azd config show

# Open monitoring dashboard for logs
azd monitor --logs

# Check resource status
azd show --output json
```

## 🔍 Vianetsintäkomennot

### Vianetsintätiedot
```bash
# Enable debug output for a command
azd <command> --debug

# Disable telemetry for cleaner output
export AZURE_DEV_COLLECT_TELEMETRY=no

# Check current configuration
azd config show

# Reauthenticate AZD if needed (Azure CLI has a separate login)
azd auth login
```

### Mallin vianetsintä
```bash
# List available templates with details
azd template list --output json

# Show template information
azd template show <template-name>

# Inspect supported template operations
azd template --help
```

## 📁 Tiedosto- ja hakemistokomentot

### Projektin rakenne
```bash
# Show current directory structure
tree /f  # Windows
find . -type f  # Linux/macOS

# Navigate to your project's directory
cd /path/to/your/project

# Show azd configuration directory
echo $AZD_CONFIG_DIR  # Usually ~/.azd
```

## 🎨 Tulosteen muotoilu

### JSON-tuloste
```bash
# Get JSON output for scripting
azd show --output json
azd env list --output json
azd config show --output json

# Parse with jq
azd show --output json | jq -r '.services.web.ingressUrl'
azd env get-values --output json | jq -r '.DATABASE_URL'
```

### Taulukkotuloste
```bash
# Human-readable environment table
azd env list

# View deployed services
azd show --output json | jq '.services | keys'
```

## 🔧 Yleiset komentoyhdistelmät

### Terveystarkistusskripti
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Käyttöönoton validointi
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Ympäristöjen vertailu
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Resurssien siivousskripti
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Ympäristömuuttujat

### Yleiset ympäristömuuttujat
```bash
# Azure configuration
export AZURE_SUBSCRIPTION_ID="your-subscription-id"
export AZURE_LOCATION="eastus2"
export AZURE_ENV_NAME="development"

# AZD configuration
export AZURE_DEV_COLLECT_TELEMETRY=no
export AZD_CONFIG_DIR="$HOME/.azd"

# Application configuration
export NODE_ENV="production"
export LOG_LEVEL="info"
```

## 🚨 Hätäkomennot

### Nopeat korjaukset
```bash
# Reauthenticate AZD without changing Azure CLI's account cache
azd auth login

# Force refresh environment
azd env refresh

# Redeploy all services
azd deploy

# Check deployment status
azd show --output json
```

### Palautuskomennot
```bash
# Inspect before retrying; deletion/purge is not a routine recovery step
azd show
azd provision --debug

# Reprovision infrastructure only
azd provision

# Redeploy application only
azd deploy
```

## 💡 Pro Vinkit

### Alias-komennot työnkulun nopeuttamiseksi
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktioiden pikakomennot
```bash
# Quick environment switching
azd-env() {
    azd env select "$1" && azd show
}

# Quick deployment with monitoring
azd-deploy-watch() {
    azd deploy "$1" && azd monitor --overview
}

# Environment status
azd-status() {
    echo "Current environment:"
    azd env get-values
    echo "Services:"
    azd show --output json | jq -r '.services | keys[]'
}
```

## 📖 Apua ja dokumentaatio

### Avun saaminen
```bash
# General help
azd --help
azd help

# Command-specific help
azd up --help
azd env --help
azd config --help

# Show version and build info
azd version
azd version --output json
```

### Dokumentaatio-linkit
```bash
# Open documentation in browser
azd docs

# Show template documentation
azd template show <template-name> --docs
```

---

**Vinkki**: Lisää tämä pikakuvake kirjanmerkkeihin ja käytä `Ctrl+F` löytääksesi tarvitsemasi komennot nopeasti!

---

**Navigointi**
- **Edellinen oppitunti**: [Esilennotustarkistukset](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Seuraava oppitunti**: [Sanasto](glossary.md)

---

> **💡 Haluatko Azure-käskyapua editorissasi?** Asenna [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) käyttämällä `npx skills add microsoft/github-copilot-for-azure` — 37 taitoa AI:lle, Foundrylle, käyttöönotolle, diagnostiikalle ja muulle.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->