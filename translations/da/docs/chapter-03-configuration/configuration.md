# Konfigurationsvejledning

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD for begyndere](../../README.md)
- **📖 Nuværende kapitel**: Kapitel 3 - Konfiguration & Godkendelse
- **⬅️ Forrige**: [Dit første projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste**: [Deploymentsvejledning](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Næste kapitel**: [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)

## Introduktion

> Gennemgået mod `azd 1.37.2` (november 2026). Bash-kommandoer forudsætter et initialiseret azd-projekt. Medmindre det eksplicit er beskrevet som en komplet fil, er YAML/Bicep-uddrag fragmenter til sammensmeltning i matchende projektfiler, ikke selvstændige køreklare projekter.

Denne omfattende vejledning dækker alle aspekter af konfiguration af Azure Developer CLI for optimale udviklings- og deploymentsprocesser. Du vil lære om konfigurationshierarkiet, miljøstyring, autentifikationsmetoder og avancerede konfigurationsmønstre, der muliggør effektive og sikre Azure-udrulninger.

## Læringsmål

Når du er færdig med denne lektion, vil du:
- Mestre azd’s konfigurationshierarki og forstå, hvordan indstillinger prioriteres
- Effektivt konfigurere globale og projekt-specifikke indstillinger
- Styre flere miljøer med forskellige konfigurationer
- Implementere sikre autentifikations- og autorisationsmønstre
- Forstå avancerede konfigurationsmønstre for komplekse scenarier

## Læringsudbytte

Efter du har gennemført denne lektion, vil du kunne:
- Konfigurere azd for optimale udviklingsarbejdsgange
- Opsætte og styre flere deployeringsmiljøer
- Implementere sikre konfigurationsstyringsprocesser
- Fejlsøge konfigurationsrelaterede problemer
- Tilpasse azd adfærd til specifikke organisatoriske krav

Denne omfattende vejledning dækker alle aspekter af konfiguration af Azure Developer CLI for optimale udviklings- og deploymentsprocesser.

## Forståelse af AI-agenter i et azd-projekt

Hvis du er ny med AI-agenter, er her en enkel måde at tænke på dem i azd-verdenen.

### Hvad er en agent?

En agent er et softwareprogram, der kan modtage en forespørgsel, analysere den og tage handlinger – ofte ved at kalde en AI-model, slå data op eller påkalde andre tjenester. I et azd-projekt er en agent bare en anden **service** ved siden af dit webfrontend eller API-backend.

### Hvordan agenter passer ind i azd projektstrukturen

Et azd-projekt består af tre lag: **infrastruktur**, **kode** og **konfiguration**. Agenter tilsluttes disse lag på samme måde som enhver anden service:

| Lag | Hvad det gør for en traditionel app | Hvad det gør for en agent |
|-------|-------------------------------------|---------------------------|
| **Infrastruktur** (`infra/`) | Provisionerer en webapp og database | Provisionerer et AI-model-endpoint, søgeindeks eller agent-host |
| **Kode** (`src/`) | Indeholder din frontend- og API-kildekode | Indeholder din agent-logik og promptdefinitioner |
| **Konfiguration** (`azure.yaml`) | Opregner dine services og deres hostingmål | Opregner din agent som en service, der peger på dens kode og host |

### Rollen af `azure.yaml`

Du behøver ikke at huske syntaksen lige nu. Konceptuelt er `azure.yaml` filen, hvor du fortæller azd: *"Her er de services, der udgør min applikation, og her er koden at finde."*

Når dit projekt inkluderer en AI-agent, opregner `azure.yaml` blot den agent som en af services. azd ved så, at den skal provisionere den rette infrastruktur (som et Microsoft Foundry Models endpoint eller en Container App til at hoste agenten) og deployere din agent-kode – på samme måde som det ville gøre for en webapp eller API.

Det betyder, at der ikke er noget grundlæggende nyt at lære. Hvis du forstår, hvordan azd håndterer en webservice, forstår du allerede, hvordan det håndterer en agent.

## Konfigurationshierarki

azd har forskellige konfigurationsflader, ikke bare ét universelt lag:
- **Globale brugerpræferencer**: `~/.azd/config.json`, styret af `azd config`.
- **Projektdefinition**: `azure.yaml` specificerer services, infrastruktur og hooks.
- **Lokal miljøvalg**: `.azure/config.json`.
- **Værdier per miljø**: `.azure/<name>/.env`, styret af `azd env`; yderligere indstillinger findes i miljøets `config.json`.
- **Flag og procesvariabler**: overskriver kun indstillinger støttet af en bestemt kommando/udbyder.

En vilkårlig `azd env set` værdi bliver ikke automatisk en infrastrukturparameter eller deployeret applikationsindstilling. Referér den eksplicit i parameterfilen, understøttet servicekonfiguration eller en hook.

## Global konfiguration

### Indstilling af globale standarder
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

### Almindelige globale indstillinger
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

## 🏗️ Projektkonfiguration

### azure.yaml-struktur
Filen `azure.yaml` er kernen i dit azd-projekt:

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

Dette er et **projektdefinerings-eksempel**, ikke en leveret startfil. Opret de refererede kilde-mapper, hook-scripts, pakke-scripts og matchende `infra/main.bicep`/`main.parameters.json` før du kører det. Databaser hører til i infrastrukturen; `postgres` er ikke en indbygget service-host. Infrastrukturparametre skal indskrives i udbyderens parameterfil, ikke i `infra.parameters`.

### Servicekonfigurationsmuligheder

#### Host-typer
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

#### Sprog-specifikke build-hooks

Følgende servicefragmenter illustrerer hooks; smelt dem sammen med hver services rigtige `project` og `host`. `buildCommand` og `startCommand` er ikke generiske azd serviceegenskaber. Konfigurer opstart i applikationen, Dockerfile eller hostinfrastruktur.

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

## 🌟 Miljøstyring

### Oprettelse af miljøer
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Miljøkonfiguration
Kerneværdier for miljøet findes i `.azure/<env-name>/.env`, inklusiv `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` og `AZURE_LOCATION`. Brug `azd env config get/set` til yderligere miljø-JSON-indstillinger. Følgende JSON er **konceptuel applikationstilstand**, ikke et azd-konfigurationsskema; kopier det ikke ind i azd’s filer:

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

### Miljøvariabler

**Kun en demonstration med klartekst.** Almindelige `azd env set` værdier skrives til `.azure/<name>/.env` og kan udskrives af læsekommandoer. Brug ikke den eksempel-API-nøgle som en rigtig legitimationsoplysning. For hemmeligheder brug `azd env set-secret` og eksplicit runtime-forbindelse.

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

### Miljøskabeloner
Opret en **ikke-hemmelig, manuelt vedligeholdt** `.env.example` i projektroden for ensartet opsætning. azd indlæser ikke automatisk en fil kaldet `env.template`:
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

### Deling af miljøer på et team

Når mere end én person arbejder på et projekt, skal I blive enige om **hvad der følger med repoen og hvad der forbliver lokalt**. azd holder hvert miljø under en `.azure/` mappe, og ikke alt heri bør committes.

**Hvad der er i `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Hvad der skal gitignores.** azd’s standard `.gitignore` udelukker allerede `.azure/`. Behold det sådan – `.env` filer kan indeholde hemmeligheder, og resource IDs er specifikke for den, der har provisioneret dem. Hver holdmedlem opretter sit **eget** miljø lokalt:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Skift mellem miljøer.** En udvikler, der administrerer flere miljøer, vælger det aktive før kommandoer køres:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Tilvejebringe ikke-hemmelige standarder til teamet.** Commit `.env.example` uden for den ignorerede `.azure/` mappe. Nye teammedlemmer kopierer den til en lokal ignoreret fil, udfylder værdier og importerer eksplicit med `azd env set --file <local-file>`. Importér aldrig tomme pladsholdere over et fungerende miljø.

**Miljøer i CI/CD.** Pipelines læser ikke din lokale `.azure/` mappe. Lever i stedet miljøværdierne som pipeline-variabler/hemmeligheder, og azd læser dem fra procesmiljøet:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Tommelfingerregel:** infrastrukturkode (`infra/`, `azure.yaml`) deles i Git; miljø *tilstand og hemmeligheder* (`.azure/`) er pr-udvikler og pr-pipeline. `azd pipeline config` opsætter pipelinevariablerne automatisk for dig.

## 🔐 Autentifikationskonfiguration

### Azure CLI-integration
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Service Principal-autentifikation
For CI/CD-pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
For Azure-hostede miljøer:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastrukturkonfiguration

### Bicep-parametre
Konfigurer infrastrukturparametre i `infra/main.parameters.json`:
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

### Terraform-konfiguration
For Terraform-projekter erstatter azd pladsholdere i `infra/main.tfvars.json`. Disse navne skal matche erklærede Terraform inputvariabler:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Deploymentskonfiguration

### Build-konfiguration
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

### Docker-konfiguration
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
 Stier er relative til serviceprojektet. Dockerfile skal erklære alle `ARG`-værdier, den anvender. For en multi-stage build, placer det deploybare trin sidst eller brug en brugerdefineret pakkeworkflow; `docker.target` er ikke en understøttet egenskab i den gennemgåede skema.

## 🔧 Avanceret konfiguration

### Brugerdefinerede ressourcenavne
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definer faktiske ressourcenavne i Bicep/Terraform og hold ressourcegruppeoprettelse konsistent med denne indstilling. Der findes ingen generiske `naming.storageAccount` eller `naming.keyVault` konfigurationsnøgler.

### Netværkskonfiguration
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Sammensmelt disse **illustrerende parameterposter** i `infra/main.parameters.json` under `parameters`, og deklarér og forbrug de matchende parametre i Bicep. De gør intet i sig selv.

### Overvågningskonfiguration
Provisioner Application Insights og Log Analytics i Bicep/Terraform og konfigurer applikationstelemetri i dit SDK. Der findes ikke et generisk topniveau `monitoring`-blok i `azure.yaml`, der opretter disse ressourcer. Se [monitoreringsinfrastruktur](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Miljøspecifikke konfigurationer

### Udviklingsmiljø
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging-miljø
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produktionsmiljø
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigurationsvalidering

### Valider konfiguration
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurationsscripts
Opret valideringsscripts i `scripts/`:

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

## 🎓 Bedste praksis

### 1. Brug miljøvariabler
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Undgå at hardkode følsomme værdier (adskilt illustrativ konfiguration, ikke en anden `database` nøgle i samme fil):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiser konfigurationsfiler
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

### 3. Overvejelser om versionsstyring
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Konfigurationsdokumentation
Dokumentér din konfiguration i `CONFIG.md`:
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

## 🎯 Praktiske øvelser

### Øvelse 1: Multi-miljøkonfiguration (15 minutter)

**Mål**: Opret og konfigurer tre lokale miljøer med forskellige værdier. Start i et initialiseret projekt; brug ubrugt navne, hvis disse allerede findes. Disse applikationsspecifikke værdier ændrer ikke telemetri/runtime-indstillinger, før din skabelon forbruger dem.

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

**Succes-kriterier:**
- [ ] Tre miljøer oprettet succesfuldt
- [ ] Hvert miljø har unik konfiguration
- [ ] Kan skifte mellem miljøer uden fejl
- [ ] `azd env list` viser alle tre miljøer

### Øvelse 2: Key Vault hemmelighedsreferencer (10-20 minutter)

**Mål**: Gem en Key Vault-reference i stedet for klartekst. **Startpunkt:** et initialiseret miljø, Azure login og adgang til en Key Vault med tilladelser til at oprette/læse en dummy-hemmelighed. Vault-operationer kan medføre omkostninger.

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

**Succes-kriterier:**
- [ ] Interaktiv kommando rapporterer den valgte vault og hemmelighedsreference
- [ ] Lokal `.env` indeholder en reference i stedet for dummy-hemmeligheden
- [ ] Kan forklare, at runtime-identity/RBAC og forbrug stadig skal konfigureres

**Almindelige problemer:** en 403 kræver korrekt vault data-plane rolle og propagationstid; `azd env set ... --secret` er ikke en gyldig kommando. Almindelig `get-values`/`get-value` output må ikke antages at være udslettet. Fjern træningsreferencen med `azd env unset TRAINING_API_KEY`; dette sletter ikke vault-hemmeligheden, som du selv skal rydde op i, hvis du har oprettet den.

## Næste skridt

- [Dit første projekt](../chapter-01-foundation/first-project.md) - Anvend konfiguration i praksis
- [Deploymentsvejledning](../chapter-04-infrastructure/deployment-guide.md) - Brug konfiguration til deployment
- [Provisionering af ressourcer](../chapter-04-infrastructure/provisioning.md) - Produktionsklare konfigurationer

## Referencer

- [azd konfigurationsreference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml skema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Miljøvariabler](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Kapitelnavigation:**
- **📚 Kursushjem**: [AZD For Beginners](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 3 - Konfiguration & Godkendelse
- **⬅️ Forrige**: [Dit Første Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Næste Kapitel**: [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)
- **Næste Lektion**: [Godkendelse & Sikkerhed](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->