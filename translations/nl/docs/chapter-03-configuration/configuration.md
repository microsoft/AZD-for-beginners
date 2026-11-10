# Configuratiehandleiding

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Vorige**: [Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgende**: [Deploygids](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 4: Infrastructuur als Code](../chapter-04-infrastructure/deployment-guide.md)

## Introductie

> Beoordeeld op basis van `azd 1.37.2` (november 2026). Bash-commando's gaan uit van een geïnitialiseerd azd-project. Tenzij expliciet beschreven als een compleet bestand, zijn YAML/Bicep-fragmenten gedeelten om samen te voegen met overeenkomende projectbestanden, niet zelfstandig uitvoerbare projecten.

Deze uitgebreide handleiding behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkelings- en inzetwerkstromen. Je leert over de configuratiehiërarchie, omgevingsbeheer, authenticatiemethoden en geavanceerde configuratiepatronen die efficiënte en veilige Azure-implementaties mogelijk maken.

## Leerdoelen

Aan het einde van deze les zul je:
- De azd-configuratiehiërarchie beheersen en begrijpen hoe instellingen worden geprioriteerd
- Effectief globale en projectspecifieke instellingen configureren
- Meerdere omgevingen met verschillende configuraties beheren
- Veilige authenticatie- en autorisatiepatronen implementeren
- Geavanceerde configuratiepatronen begrijpen voor complexe scenario's

## Leerresultaten

Na het voltooien van deze les ben je in staat om:
- azd te configureren voor optimale ontwikkelwerkstromen
- Meerdere implementatieomgevingen op te zetten en te beheren
- Veilige configuratiebeheerpraktijken toe te passen
- Problemen gerelateerd aan configuratie op te lossen
- Het gedrag van azd aan te passen voor specifieke organisatorische behoeften

Deze uitgebreide handleiding behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkelings- en inzetwerkstromen.

## Begrip van AI-agents in een azd-project

Als je nieuw bent met AI-agents, is hier een eenvoudige manier om erover na te denken binnen de azd-wereld.

### Wat is een Agent?

Een agent is een stukje software dat een verzoek kan ontvangen, erover kan redeneren en acties kan ondernemen—vaak door een AI-model aan te roepen, data op te zoeken of andere services te gebruiken. In een azd-project is een agent gewoon een andere **service** naast je webfrontend of API-backend.

### Hoe Agents Inpassen in de azd-projectstructuur

Een azd-project bestaat uit drie lagen: **infrastructuur**, **code** en **configuratie**. Agents worden op dezelfde manier in deze lagen ingeplugd als elke andere service:

| Laag | Wat het Doet voor een Traditionele App | Wat het Doet voor een Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructuur** (`infra/`) | Zet een webapp en database op | Zet een AI-modelendpoint, zoekindex, of agenthost op |
| **Code** (`src/`) | Bevat je frontend- en API-broncode | Bevat je agentlogica en promptdefinities |
| **Configuratie** (`azure.yaml`) | Lijst van je services en hun hostingdoelen | Lijst van je agent als service, verwijzend naar de code en host |

### De Rol van `azure.yaml`

Je hoeft de syntax nu niet uit je hoofd te leren. Conceptueel is `azure.yaml` het bestand waarin je aan azd vertelt: *"Hier zijn de services die mijn applicatie vormen, en hier is hun code te vinden."*

Wanneer je project een AI-agent bevat, vermeldt `azure.yaml` die agent simpelweg als een van de services. azd weet dan de juiste infrastructuur te provisioneren (zoals Microsoft Foundry Models endpoint of een Container App om de agent te hosten) en je agentcode te implementeren—net zoals bij een webapp of API.

Dit betekent dat er niets fundamenteel nieuws te leren valt. Als je begrijpt hoe azd een webservice beheert, begrijp je ook hoe het een agent beheert.

## Configuratiehiërarchie

azd heeft verschillende configuratievlakken, niet één universele laag:
- **Globale gebruikersvoorkeuren**: `~/.azd/config.json`, beheerd door `azd config`.
- **Projectdefinitie**: `azure.yaml` specificeert services, infrastructuur en hooks.
- **Lokale omgevingsselectie**: `.azure/config.json`.
- **Per-omgevingwaarden**: `.azure/<name>/.env`, beheerd door `azd env`; aanvullende instellingen staan in die omgeving's `config.json`.
- **Vlaggen en procesvariabelen**: overschrijven alleen instellingen die door een specifiek commando/provider worden ondersteund.

Een willekeurige `azd env set` waarde wordt niet automatisch een infrastructuurparameter of gedeelde toepassinginstelling. Verwijs er expliciet naar in het parameterbestand, ondersteunde serviceconfiguratie, of een hook.

## Globale Configuratie

### Globale Standaardinstellingen
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Veelvoorkomende Globale Instellingen
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Projectconfiguratie

### Structuur van azure.yaml
Het `azure.yaml` bestand is het hart van je azd-project:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

# Service definitions
services:
  # Frontend service
  web:
    project: ./src/web              # Source code location
    language: js                    # Programming language
    host: appservice               # Azure service type
    dist: dist                     # Build output directory
    
  # Backend API service  
  api:
    project: ./src/api
    language: python
    host: containerapp
    docker:
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

# Deployment hooks
hooks:
  preprovision:                    # Before infrastructure deployment
    shell: sh
    run: |
      echo "Preparing infrastructure..."
      ./scripts/validate-config.sh
      
  postprovision:                   # After infrastructure deployment
    shell: pwsh
    run: |
      Write-Host "Infrastructure deployed successfully"
      ./scripts/setup-database.ps1
      
  predeploy:                       # Before application deployment
    shell: sh
    run: |
      echo "Building application..."
      npm run build
      
  postdeploy:                      # After application deployment
    shell: sh
    run: |
      echo "Running post-deployment tests..."
      npm run test:integration

# Pipeline configuration
pipeline:
  provider: github                 # CI/CD provider
  variables:
    - AZURE_CLIENT_ID
    - AZURE_TENANT_ID
  secrets:
    - AZURE_CLIENT_SECRET
```

Dit is een **projectdefinitievoorbeeld**, geen meegeleverd startbestand. Maak de genoemde brondirectories, hookscripts, packagescripts en bijpassende `infra/main.bicep`/`main.parameters.json` aan voordat je het draait. Databases horen in infrastructuur; `postgres` is geen ingebouwde servicehost. Infrastructuurparameters horen in het parameterbestand van de provider, niet in `infra.parameters`.

### Serviceconfiguratieopties

#### Hosttypes
```yaml
services:
  web-static:
    host: staticwebapp           # Azure Static Web Apps
    
  web-dynamic:
    host: appservice            # Azure App Service
    
  api-containers:
    host: containerapp          # Azure Container Apps
    
  api-functions:
    host: function              # Azure Functions
    
  api-spring:
    host: springapp             # Azure Spring Apps
```

#### Taal-specifieke Build-Hooks

De volgende servicefragmenten illustreren hooks; voeg ze samen met elke service's echte `project` en `host`. `buildCommand` en `startCommand` zijn geen generieke azd-service-eigenschappen. Configureer opstarten in de applicatie, Dockerfile, of hostinfrastructuur.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Omgevingsbeheer

### Omgevingen Aanmaken
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Omgevingsconfiguratie
Kernwaarden van de omgeving staan in `.azure/<env-name>/.env`, inclusief `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` en `AZURE_LOCATION`. Gebruik `azd env config get/set` voor aanvullende JSON-instellingen van de omgeving. De volgende JSON is **conceptuele applicatiestatus**, geen azd-configuratieschema; kopieer dit niet naar azd-bestanden:

```json
{
  "version": 1,
  "environmentName": "development",
  "subscriptionId": "12345678-1234-1234-1234-123456789abc",
  "location": "eastus2",
  "resourceGroupName": "rg-myapp-dev-eastus2",
  "services": {
    "web": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.Web/sites/web-abc123",
      "endpoints": ["https://web-abc123.azurewebsites.net"]
    },
    "api": {
      "resourceId": "/subscriptions/.../resourceGroups/.../providers/Microsoft.App/containerApps/api-def456",
      "endpoints": ["https://api-def456.azurecontainerapps.io"]
    }
  }
}
```

### Omgevingsvariabelen

**Alleen voorbeeld in platte tekst.** Gewone `azd env set` waarden worden in `.azure/<name>/.env` geschreven en kunnen worden weergegeven door leescommando's. Gebruik niet de voorbeeld-API-sleutel als echte referentie. Voor geheimen, gebruik `azd env set-secret` en expliciete runtime-koppeling.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Omgevingssjablonen
Maak een **niet-geheime, handmatig onderhouden** `.env.example` in de projectroot aan voor consistente opzet. azd laadt niet automatisch een bestand met de naam `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Omgevingen Delen Binnen een Team

Wanneer meer dan één persoon aan een project werkt, moet je overeenstemming bereiken over **wat met de repo mee gaat en wat lokaal blijft**. azd houdt elke omgeving binnen een `.azure/` map, en niet alles daarvan moet worden vastgelegd.

**Inhoud van `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Wat te gitignore-en.** De standaard `.gitignore` van azd sluit `.azure/` al uit. Houd het zo—de `.env` bestanden kunnen geheimen bevatten, en resource-ID's zijn specifiek voor degene die ze heeft geprovisioneerd. Elk teamlid maakt lokaal zijn **eigen** omgeving aan:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Wisselen tussen omgevingen.** Een ontwikkelaar die meerdere omgevingen beheert kiest de actieve vóór het uitvoeren van commando's:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Niet-geheime standaardwaarden aan het team geven.** Leg `.env.example` vast buiten de genegeerde `.azure/` map. Nieuwe teamleden kopiëren dit naar een lokaal genegeerd bestand, vullen waarden in, en importeren het expliciet met `azd env set --file <local-file>`. Importeer nooit lege placeholders over een werkende omgeving.

**Omgevingen in CI/CD.** Pipelines lezen je lokale `.azure/` map niet. Lever in plaats daarvan omgevingswaarden als pipeline-variabelen/geheimen aan, en azd leest ze uit de processenvelop:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Vuistregel:** infrastructuurcode (`infra/`, `azure.yaml`) wordt gedeeld in Git; omgevings-*status en geheimen* (`.azure/`) zijn per ontwikkelaar en per pipeline. `azd pipeline config` stelt de pipeline-variabelen automatisch voor je in.

## 🔐 Authenticatieconfiguratie

### Azure CLI-integratie
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Service Principal Authenticatie
Voor CI/CD-pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Beheerde Identiteit
Voor Azure-gehoste omgevingen:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastructuurconfiguratie

### Bicep-parameters
Configureer infrastructuurparameters in `infra/main.parameters.json`:
```json
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentParameters.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {
    "environmentName": {
      "value": "${AZURE_ENV_NAME}"
    },
    "location": {
      "value": "${AZURE_LOCATION}"
    },
    "appServiceSkuName": {
      "value": "B1"
    },
    "databaseSkuName": {
      "value": "Standard_B1ms"
    }
  }
}
```

### Terraform-configuratie
Voor Terraform-projecten vervangt azd placeholders in `infra/main.tfvars.json`. Deze namen moeten overeenkomen met gedeclareerde Terraform invoervariabelen:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Deploymentconfiguratie

### Buildconfiguratie
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker-configuratie
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
Paden zijn relatief ten opzichte van het serviceproject. Het Dockerfile moet alle door `ARG` gebruikte waarden declareren. Voor een multi-stage build, zet de inzetbare fase als laatste of gebruik een aangepaste verpakkingsworkflow; `docker.target` is geen ondersteunde eigenschap in het beoordeelde schema.

## 🔧 Geavanceerde Configuratie

### Aangepaste Resourcebenaming
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definieer werkelijke resourcenamen in Bicep/Terraform en houd de resourcegroep-creatie consistent met deze instelling. Er zijn geen generieke `naming.storageAccount` of `naming.keyVault` configuratiesleutels.

### Netwerkconfiguratie
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Voeg deze **illustratieve parametervermeldingen** samen in `infra/main.parameters.json` onder `parameters`, en declareer en verbruik overeenkomstige parameters in Bicep. Ze doen op zichzelf niets.

### Monitoringconfiguratie
Provision Application Insights en Log Analytics in Bicep/Terraform en configureer applicatietelemetrie in je SDK. Er is geen generiek top-level `monitoring` blok in `azure.yaml` dat deze resources creëert. Zie [monitoringinfrastructuur](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Omgevingsspecifieke Configuraties

### Ontwikkelomgeving
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testomgeving
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Productieomgeving
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuratievalidatie

### Configuratie Valideren
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Configuratiescripts
Maak validatiescripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Beste Praktijken

### 1. Gebruik Omgevingsvariabelen
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Vermijd het hardcoden van gevoelige waarden (scheid illustratieve configuratie, geen tweede `database` sleutel in hetzelfde bestand):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiseer Configuratiebestanden
```
.azure/
├── config.json              # Global project config
├── development/
│   ├── config.json         # Dev environment config
│   └── .env                # Dev environment variables
├── staging/
│   ├── config.json         # Staging environment config
│   └── .env                # Staging environment variables
└── production/
    ├── config.json         # Production environment config
    └── .env                # Production environment variables
```

### 3. Overwegingen voor versiebeheer
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Documentatie van Configuratie
Documenteer je configuratie in `CONFIG.md`:
```markdown
# Configuration Guide

## Required Environment Variables
- `DATABASE_CONNECTION_STRING`: Connection string for the database
- `API_KEY`: API key for external service
- `STORAGE_ACCOUNT_KEY`: Azure Storage account key

## Environment-Specific Settings
- Development: Uses local database, debug logging enabled
- Staging: Uses staging database, info logging
- Production: Uses production database, error logging only
```

## 🎯 Praktijkoefeningen

### Oefening 1: Multi-omgeving Configuratie (15 minuten)

**Doel**: Maak en configureer drie lokale omgevingen met verschillende waarden. Begin in een geïnitialiseerd project; gebruik ongebruikte namen als deze al bestaan. Deze toepassingsspecifieke waarden veranderen de telemetrie-/runtime-instellingen niet totdat je sjabloon ze gebruikt.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Succescriteria:**
- [ ] Drie omgevingen met succes aangemaakt
- [ ] Elke omgeving heeft unieke configuratie
- [ ] Kan schakelen tussen omgevingen zonder fouten
- [ ] `azd env list` toont alle drie de omgevingen

### Oefening 2: Key Vault Geheimreferenties (10-20 minuten)

**Doel**: Sla een Key Vault-referentie op in plaats van platte tekst. **Startpunt:** een geïnitialiseerde omgeving, Azure-aanmelding en toegang tot een Key Vault met rechten om een dummygeheim te maken/te lezen. Vault-operaties kunnen kosten met zich meebrengen.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Succescriteria:**
- [ ] Interactief commando meldt de geselecteerde vault en geheimreferentie
- [ ] Lokale `.env` bevat een referentie in plaats van het dummygeheim
- [ ] Kan uitleggen dat runtime-identiteit/RBAC en gebruik nog geconfigureerd moeten worden

**Veelvoorkomende problemen:** een 403 vereist de juiste data-plane rol en propagatietijd; `azd env set ... --secret` is geen geldig commando. Gewone `get-values`/`get-value` uitvoer mag niet als geredigeerd worden aangenomen. Verwijder de trainingsreferentie met `azd env unset TRAINING_API_KEY`; dit verwijdert het vault-geheim niet, dat moet je apart opruimen als je het hebt aangemaakt.

## Volgende Stappen

- [Je Eerste Project](../chapter-01-foundation/first-project.md) - Pas configuratie in de praktijk toe
- [Deploygids](../chapter-04-infrastructure/deployment-guide.md) - Gebruik configuratie voor deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Productieklaar configuraties

## Referenties

- [azd Configuratiereferentie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Omgevingsvariabelen](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Vorige**: [Je Eerste Project](../chapter-01-foundation/first-project.md)
- **➡️ Volgend Hoofdstuk**: [Hoofdstuk 4: Infrastructuur als Code](../chapter-04-infrastructure/deployment-guide.md)
- **Volgende Les**: [Authenticatie & Beveiliging](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->