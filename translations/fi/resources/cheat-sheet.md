# Komentojen pikalista - Oleelliset AZD-komennot

**Pikaviite kaikille luvuillesi**
- **📚 Kurssin etusivu**: [AZD aloittelijoille](../README.md)
- **📖 Nopeasti alkuun**: [Luku 1: Perustukset & Nopeasti alkuun](../README.md#-chapter-1-foundation--quick-start)
- **🤖 AI-komennot**: [Luku 2: AI-Ensimmäinen kehitys](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers)
- **🔧 Edistynyt**: [Luku 4: Infrastruktuuri koodina](../README.md#️-chapter-4-infrastructure-as-code--deployment)

## Johdanto

Tämä kattava pikalista tarjoaa nopean viitteen yleisimmin käytetyille Azure Developer CLI -komennoille, järjestettynä kategorioittain käytännön esimerkkien kera. Täydellinen nopeisiin tarkistuksiin kehityksen, virheiden selvityksen ja päivittäisten azd-projektien toimintojen aikana.

## Oppimistavoitteet

Tämän pikalistan avulla sinä:
- Saat välittömän pääsyn olennaisiin Azure Developer CLI -komentoihin ja syntaksiin
- Ymmärrät komentojen järjestelyn toiminnallisten kategorioiden ja käytön tapausten mukaan
- Löydät käytännön esimerkit yleisistä kehitys- ja käyttöönottoasetelmista
- Saat käyttöösi vianmäärityskomentoja nopeaan ongelmanratkaisuun
- Löydät tehokkaasti edistyneet määritys- ja kustomointivaihtoehdot
- Löydät ympäristönhallinta- ja moniympäristötyönkulun komennot

## Oppimistulokset

Käyttämällä tätä pikalistaa säännöllisesti pystyt:
- Suorittamaan azd-komennot itsevarmasti ilman täydellistä dokumentaatiota
- Ratkaisemaan yleisimmät ongelmat nopeasti sopivilla diagnostiikkakomennoilla
- Hallitsemaan tehokkaasti useita ympäristöjä ja käyttöönottoasetelmia
- Käyttämään tarvittaessa edistyneitä azd-ominaisuuksia ja määritysasetuksia
- Vianmääritymään käyttöönottovirheitä järjestelmällisillä komentojonoilla
- Optimoimaan työnkulkuja tehokkaiden azd-pikavalintojen ja -asetusten avulla

## Aloituskomennot

### Tunnistautuminen
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

### Projektin alustus
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

## Keskeiset käyttöönotto-komennot

### Täydellinen käyttöönottotyönkulku
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

> **`azd restore`** lataa sovelluksesi riippuvuudet (npm, pip, NuGet, Maven jne.). Se suoritetaan automaattisesti `azd package` ja `azd deploy` aikana, joten sitä harvoin kutsutaan suoraan — suorita se manuaalisesti riippuvuuksien ennakkohakuun (esimerkiksi CI-välimuistin esilämmittämiseksi tai offline-työskentelyä varten myöhemmin).

> **`azd package`** valmistelee käyttöön otettavan paketin asentamatta sovelluspalvelua. Toiminta riippuu kielestä ja isännästä: konttipakettien luonti voi hyödyntää Azuren etärakennuksia ja julkaista kuvia rekisteriin, joten se ei välttämättä ole offline tai Azure-kirjoitukseton. `azd deploy` voi pakata automaattisesti; käytä erillistä pakkausvaihetta, kun tarvitset artefaktin tai rakentamisen tarkistuksen.


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

Ympäristötiedostot ovat tekstitiedostoja. Älä käsittele `azd env set` salaisena säilytyspaikkana; käytä Key Vault -viitteitä tai hallittua tunnistautumista tarpeen mukaan.

## ⚙️ Määrityskomennot

### Globaalit määritykset
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

### Projektin määritykset
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

Application Insights on määritettävä mallin kautta. AZD:n Live Metrics -vaihtoehto ei tällä hetkellä tue Python-sovelluksia; käytä sen sijaan yleiskatsausta, lokitietoja tai esimerkin dokumentoitua jäljitystyönkulkua.

### Konttilokien katselu
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

## 🛠️ Ylläpitokomennot

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

### Putki ja CI/CD
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

### Projektitiedot
```bash
# Show project status and endpoints
azd show

# Show detailed project info as JSON
azd show --output json

# Get service endpoints
azd show --output json | jq '.services'
```

## 🤖 AI ja laajennukset

### AZD-lisäosat

Foundry GA -viite päivitetty 2026-11-09: `microsoft.foundry` paketti 1.0, julkistettu [5. marraskuuta 2026](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Käytä `azd >= 1.37.0`; komponentit on versioitu itsenäisesti ja valinnaisilla esikatseluominaisuuksilla on oma tilansa.

```bash
# List all available extensions (including AI)
azd extension list

# Check/update the core CLI before updating extensions
azd version
azd update

# Install the GA bundle (agents, connections, inspector, projects,
# routines, skills, and toolboxes)
azd ext install microsoft.foundry

# Install the separate evaluations extension
azd extension install azure.ai.evaluations

# Install the fine-tuning extension
azd extension install azure.ai.finetune

# Install the custom models extension
azd extension install azure.ai.models

# Inspect installed versions and upgrade the bundle
azd ext list --installed
azd ext upgrade microsoft.foundry
```

Paketti ei sisällä arviointeja, aineistoja, hienosäätöä tai mukautettuja malleja. Yksittäisten ydinkomponenttien asentaminen on edelleen tuettu. Noudata [GA-hosted-agentin opastusta](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) käyttökelpoisesta esimerkistä Python 3.13+:lla, nykyisellä uv:llä, käyttöoikeuksilla ja mallikiintiöllä.

### AI-agenttikomennot
```bash
# Initialize an agent project interactively
azd ai agent init

# Or adopt a current azure.yaml agent project template
azd ai agent init --template <path-to-azure.yaml>

# Target a specific Foundry project
azd ai agent init --template <path-to-azure.yaml> --project-id <foundry-project-id>

# Adopt into a specified directory, then follow the printed cd next step
azd ai agent init --template <path-to-azure.yaml> --src ./agents/my-agent

# For a code-based hosted agent, add --deploy-mode code during init
# Review azure.yaml, then provision before running locally
azd provision
azd ai agent run

# In a second terminal in the same project directory
azd ai agent invoke --local "Explain how this agent is deployed."

# Upload source for a remote Foundry build (code mode)
azd deploy

# Test a deployed agent (prints latency + time-to-first-byte)
azd ai agent invoke

# Show the live endpoint configuration
azd ai agent endpoint show

# Review hosted-agent changes, stream logs, or diagnose permissions
azd deploy --preview
azd ai agent monitor --follow
azd ai agent doctor

# Download the deployed source of a code-based hosted agent
azd ai agent code download

# Delete a hosted agent and all its versions (--force ends active sessions)
azd ai agent delete --force
```

`--template`/`-t` korvaa vanhentuneen `--manifest`/`-m` kirjoitusmuodon; vanhojen manifestien migrointi on tarpeen. Nykyään ei ole agent-init `--host containerapp` -vaihtoehtoa. Hallitut-harjanne-, puhe- ja pitkäkäyntiesikatselut vaativat itsenäisen shell/CI-ympäristön valinnan; katso [AI CLI -viite](../docs/chapter-08-production/production-ai-practices.md#optional-preview-features).

Paikallinen testaus käyttää edelleen Azure-mallien käyttöönottoja ja aiheuttaa kuluja. Siivoukseen `azd down` poistaa vasta luodun Foundry-projektin resurssiryhmän, mutta jättää uudelleen käytetyt projektin resurssit paikalleen; poista vain erikseen hallinnoimasi ei-toivotut resurssit.

### AI-arvioinnit ja optimointi
```bash
# Generate and review a draft dataset and rubric (Dataset and evaluator / Turn)
azd ai eval generate

# In the initialized agent project, select those assets and a judge model
azd ai eval init --name quality

# Register datasets/evaluators/eval groups, then run and inspect results
azd up
azd ai eval run start --eval quality --wait
azd ai eval run list
azd ai eval run show <run-id>
azd ai eval run output list <run-id>

# Reuse a compatible turn-level dataset evaluation for optimization
azd ai agent optimize --eval-config ./evals/azure.eval.yaml --eval <evaluation-name> --optimize-model <optimizer-deployment>
```

Agentit beta.22 korvasi vanhat arviointikomennot `azd ai eval` -komennolla `azure.ai.evaluations`. Uusi arviointimääritys käyttää camelCase-avaimia. Optimointi `--config` edellyttää erillistä optimointien API-pyyntöä, **ei** vanhaa `eval.yaml` tai uutta `azure.eval.yaml`; käytä `--eval`/`--eval-config` arviointien uudelleenkäyttöön. Katso [arvioinnin alustus](../docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks) ja [optimoinnin migrointi](../docs/chapter-08-production/production-ai-practices.md#optimization-configuration-migration).

### Foundry CI/CD
```bash
# After a successful local deployment, generate and review the pipeline
azd up
azd pipeline config

# Runner steps: install extensions, authenticate, then deploy
azd ext install microsoft.foundry azure.ai.evaluations
# Keep the generated OIDC sign-in and environment settings here
azd up --no-prompt
azd ai eval run start --eval quality --wait --no-prompt --fail-on "pass-rate=0.9"
```

Tämä runner-pätkä ei ole täydellinen työnkulku. Tee sitoumus tarkistettuun arviointimääritykseen ja ei-salaisiin resursseihin, myönnä aineisto/arvioija/mallin käyttöoikeudet, ja käytä yhtä ympäristöä vaihetta kohden. Katso [todennettu CI/CD-esimerkki](../docs/chapter-08-production/production-ai-practices.md#cicd-pipeline-configuration).

### MCP-palvelin (Alpha)
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

### Kehitystyönkulku
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

### Moniympäristötyönkulku
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

## 📁 Tiedosto- ja hakemistokomennot

### Projektirakenne
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

## 🔧 Tavalliset komentoyhdistelmät

### Terveystarkistus-skripti
```bash
#!/bin/bash
# Quick health check
azd show
azd env get-values
azd monitor --logs
```

### Käyttöönottovahvistus
```bash
#!/bin/bash
# Pre-deployment validation
azd show
azd provision --preview  # Preview changes before deploying
az account show
```

### Ympäristövertailu
```bash
#!/bin/bash
# Compare environments
for env in dev staging production; do
    echo "=== $env ==="
    azd show --environment "$env" --output json | jq '.services'
done
```

### Resurssien siivousscriptti
```bash
#!/bin/bash
# Review environments, then explicitly select the one to remove
azd env list
azd down --environment <environment-name>
```

## 📝 Ympäristömuuttujat

### Tavalliset ympäristömuuttujat
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

## 💡 Vinkkejä ammattilaisille

### Aliakset nopeampaan työnkulkuun
```bash
# Add to your .bashrc or .zshrc
alias azdup='azd up'
alias azdm='azd monitor --live'
alias azds='azd show --output json'
alias azde='azd env'
```

### Funktioiden pikanäppäimet
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

## 📖 Ohje ja dokumentaatio

### Avun hakeminen
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

**Vinkki**: Kirjanmerkkaa tämä pikalista ja käytä `Ctrl+F` löytääksesi nopeasti tarvitsemasi komennot!

---

**Navigaatio**
- **Edellinen oppitunti**: [Esilennotustarkastukset](../docs/chapter-06-pre-deployment/preflight-checks.md)
- **Seuraava oppitunti**: [Sanasto](glossary.md)

---

> **💡 Haluatko Azure-komennoille apua editorissasi?** Asenna [Microsoft Azure Agent Skills](https://skills.sh/microsoft/github-copilot-for-azure) käyttäen `npx skills add microsoft/github-copilot-for-azure` — 37 taitoa AI:lle, Foundryl­le, käyttöönotolle, diagnostiikalle ja muulle.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->