# Konfigurasjonsveiledning

**Kapittelnavigasjon:**
- **📚 Kursstartside**: [AZD For Beginners](../../README.md)
- **📖 Nåværende kapittel**: Kapittel 3 - Konfigurasjon og autentisering
- **⬅️ Forrige**: [Ditt første prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste**: [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Neste kapittel**: [Kapittel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)

## Innledning

> Gjennomgått mot `azd 1.37.2` (november 2026). Bash-kommandoer forutsetter et initialisert azd-prosjekt. Med mindre det eksplisitt beskrives som en komplett fil, er YAML/Bicep-utdrag fragmenter som skal flettes inn i tilsvarende prosjektfiler, ikke frittstående kjørbare prosjekter.

Denne omfattende veiledningen dekker alle aspekter av konfigurering av Azure Developer CLI for optimale utviklings- og distribusjonsarbeidsflyter. Du vil lære om konfigurasjonshierarki, miljøhåndtering, autentiseringsmetoder og avanserte konfigurasjonsmønstre som muliggjør effektiv og sikker Azure-distribusjon.

## Læringsmål

Ved slutten av denne leksjonen vil du:
- Mestre azd-konfigurasjonshierarkiet og forstå hvordan innstillinger prioriteres
- Konfigurere globale og prosjektspesifikke innstillinger effektivt
- Håndtere flere miljøer med ulike konfigurasjoner
- Implementere sikre autentiserings- og autorisasjonsmønstre
- Forstå avanserte konfigurasjonsmønstre for komplekse scenarier

## Læringsresultater

Etter å ha fullført denne leksjonen vil du kunne:
- Konfigurere azd for optimale utviklingsarbeidsflyter
- Sette opp og administrere flere distribusjonsmiljøer
- Implementere sikre konfigurasjonsstyringsrutiner
- Feilsøke konfigurasjonsrelaterte problemer
- Tilpasse azd-oppførsel for spesifikke organisatoriske krav

Denne omfattende veiledningen dekker alle aspekter av konfigurering av Azure Developer CLI for optimale utviklings- og distribusjonsarbeidsflyter.

## Forstå AI-agenter i et azd-prosjekt

Hvis du er ny innen AI-agenter, her er en enkel måte å tenke på dem i azd-verdenen.

### Hva er en agent?

En agent er et program som kan motta en forespørsel, reflektere over den, og utføre handlinger – ofte ved å kalle en AI-modell, slå opp data eller påkalle andre tjenester. I et azd-prosjekt er en agent bare en annen **tjeneste** ved siden av ditt webfrontend eller API-backend.

### Hvordan agenter passer inn i azd-prosjektstrukturen

Et azd-prosjekt består av tre lag: **infrastruktur**, **kode** og **konfigurasjon**. Agenter kobles til disse lagene på samme måte som enhver annen tjeneste:

| Lag | Hva det gjør for en tradisjonell app | Hva det gjør for en agent |
|-------|-------------------------------------|---------------------------|
| **Infrastruktur** (`infra/`) | Provisjoner en webapp og database | Provisjoner et Microsoft Foundry Models-endepunkt, søkeindeks eller agentvert |
| **Kode** (`src/`) | Inneholder din frontend- og API-kildekode | Inneholder agentlogikk og promptdefinisjoner |
| **Konfigurasjon** (`azure.yaml`) | Lister tjenester og deres hostingmål | Lister agenten som en tjeneste, peker til dens kode og vert |

### Rollen til `azure.yaml`

Du trenger ikke å lære syntaksen utenat nå. Konseptuelt er `azure.yaml` filen der du forteller azd: *"Her er tjenestene som utgjør applikasjonen min, og her finner du koden deres."*

Når prosjektet ditt inkluderer en AI-agent, lister `azure.yaml` simpelthen den agenten som en av tjenestene. azd vet da å provisjonere riktig infrastruktur (som et Microsoft Foundry Models-endepunkt eller en Container App for å hoste agenten) og distribuere agentkoden din – akkurat som for en webapp eller API.

Det betyr at det ikke er noe fundamentalt nytt å lære. Hvis du forstår hvordan azd håndterer en webtjeneste, forstår du allerede hvordan det håndterer en agent.

## Konfigurasjonshierarki

azd har distinkte konfigurasjonsoverflater, ikke én universell overlegg:
- **Globale brukerpreferanser**: `~/.azd/config.json`, administrert av `azd config`.
- **Prosjektdefinisjon**: `azure.yaml` spesifiserer tjenester, infrastruktur og hooks.
- **Lokal miljøvalg**: `.azure/config.json`.
- **Verdier per miljø**: `.azure/<name>/.env`, administrert av `azd env`; tilleggskonfigurasjon finnes i det miljøets `config.json`.
- **Flagg og prosessvariabler**: overstyrer bare innstillingene som støttes av en gitt kommando/leverandør.

En vilkårlig `azd env set`-verdi blir ikke automatisk en infrastrukturparameter eller distribuert applikasjonsinnstilling. Referer til den eksplisitt i parameterfilen, støttet tjenestekonfigurasjon eller en hook.

## Global konfigurasjon

### Innstilling av globale standarder
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

### Vanlige globale innstillinger
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

## 🏗️ Prosjektkonfigurasjon

### azure.yaml-struktur
Filen `azure.yaml` er hjertet i ditt azd-prosjekt:

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

Dette er et **prosjektdefinisjonseksempel**, ikke en ferdig startpakke. Opprett de refererte kildemappene, hook-skript, pakkeskript og tilsvarende `infra/main.bicep`/`main.parameters.json` før du kjører det. Databaser hører hjemme i infrastruktur; `postgres` er ikke en innebygd tjenestevert. Infrastrukturparametere legges i leverandørens parameterfil, ikke i `infra.parameters`.

### Tjenestekonfigurasjonsalternativer

#### Vertstyper
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

#### Språkspesifikke build hooks

Følgende tjenesteutdrag illustrerer hooks; slå dem sammen med hver tjenestes virkelige `project` og `host`. `buildCommand` og `startCommand` er ikke generiske azd-tjenesteeiendommer. Konfigurer oppstart i applikasjonen, Dockerfile, eller verts-infrastruktur.

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

## 🌟 Miljøhåndtering

### Opprettelse av miljøer
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Miljøkonfigurasjon
Kjerneverdier for miljøet finnes i `.azure/<env-name>/.env`, inkludert `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, og `AZURE_LOCATION`. Bruk `azd env config get/set` for tilleggskonfigurasjon i JSON-format. Følgende JSON er **konseptuell applikasjonstilstand**, ikke et azd-konfigurasjonsskjema; ikke kopier det inn i azd sine filer:

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

**Kun ren tekst-demonstrasjon.** Vanlige `azd env set`-verdier skrives til `.azure/<name>/.env` og kan prints via lese-kommandoer. Ikke bruk eksempelnøkkelen som ekte referanse. For hemmeligheter, bruk `azd env set-secret` og eksplisitt kjøringstid-kobling.

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

### Miljømaler
Lag en **ikke-hemmlig, manuelt vedlikeholdt** `.env.example` i prosjektets rot for konsekvent oppsett. azd laster ikke automatisk en fil med navnet `env.template`:
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

### Dele miljøer i et team

Når flere personer jobber på et prosjekt, må dere bli enige om **hva som følger med repoet og hva som blir lokalt**. azd holder hvert miljø under en `.azure/`-mappe, og ikke alt av det skal committes.

**Hva er i `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Hva som skal gitignores.** azd sin standard `.gitignore` ekskluderer allerede `.azure/`. Behold dette slik—`.env` filene kan inneholde hemmeligheter, og ressurs-ID-er er spesifikke for den som har provisjonert dem. Hver lagkamerat lager sitt **egne** miljø lokalt:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Bytte mellom miljøer.** En utvikler som håndterer flere miljøer velger det aktive før kommandoer kjøres:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Gi ikke-hemmelige standarder til teamet.** Committ `.env.example` utenfor den ignorerte `.azure/`-mappen. Nye lagkamerater kopierer den til en lokal ignorert fil, fyller inn verdier, og importerer eksplisitt med `azd env set --file <local-file>`. Importer aldri blanke placholdere over et fungerende miljø.

**Miljøer i CI/CD.** Pipelines leser ikke din lokale `.azure/`-mappe. Gi miljøverdier som pipeline-variabler/hemmeligheter, og azd leser dem fra prosessmiljøet:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Tommelregel:** Infrastrukturskode (`infra/`, `azure.yaml`) deles i Git; miljøets *tilstand og hemmeligheter* (`.azure/`) er per-utvikler og per-pipeline. `azd pipeline config` setter opp pipelinevariablene automatisk for deg.

## 🔐 Autentiseringskonfigurasjon

### Integrasjon med Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Tjenesteprinsipp-autentisering
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

### Administrert identitet
For Azure-hostede miljøer:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastrukturkonfigurasjon

### Bicep-parametere
Konfigurer infrastrukturparametere i `infra/main.parameters.json`:
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

### Terraform-konfigurasjon
For Terraform-prosjekter erstatter azd placholdere i `infra/main.tfvars.json`. Disse navnene må matche deklarerte Terraform input-variabler:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Distribusjonskonfigurasjon

### Byggekonfigurasjon
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

### Docker-konfigurasjon
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
Stier er relative til tjenesteprosjektet. Dockerfilen må deklarere eventuelle `ARG`-verdier den bruker. For flertrinns bygg, sett utplasserbar fase sist eller bruk en egen pakkebehandling; `docker.target` er ikke en støttet egenskap i vurdert skjema.

## 🔧 Avansert konfigurasjon

### Egendefinerte ressursnavn
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definer faktiske ressursnavn i Bicep/Terraform og hold opprettelsen av ressursgruppe konsistent med denne innstillingen. Det finnes ingen generiske `naming.storageAccount` eller `naming.keyVault` konfigurasjonsnøkler.

### Nettverkskonfigurasjon
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Slå sammen disse **illustrerende parameteroppføringene** i `infra/main.parameters.json` under `parameters`, og deklarer samt bruk matchende parametere i Bicep. De gjør ingenting på egen hånd.

### Overvåkingskonfigurasjon
Provision Application Insights og Log Analytics i Bicep/Terraform og konfigurer applikasjonstelemetri i SDK-en din. Det finnes ikke et generisk toppnivå `monitoring`-blokker i `azure.yaml` som lager disse ressursene. Se [overvåkningsinfrastruktur](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Miljøspesifikke konfigurasjoner

### Utviklingsmiljø
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Preproduksjonsmiljø
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produksjonsmiljø
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigurasjonsvalidering

### Valider konfigurasjon
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurasjonsskript
Lag valideringsskript i `scripts/`:

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

## 🎓 Beste praksis

### 1. Bruk miljøvariabler
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Unngå hardkoding av sensitive verdier (adskilt illustrativ konfigurasjon, ikke en annen `database`-nøkkel i samme fil):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiser konfigurasjonsfiler
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

### 3. Versjonskontrollhensyn
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentasjon av konfigurasjon
Dokumenter konfigurasjonen i `CONFIG.md`:
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

### Øvelse 1: Multi-miljø konfigurasjon (15 minutter)

**Mål**: Opprett og konfigurer tre lokale miljøer med ulike verdier. Start i et initialisert prosjekt; bruk ubrukte navn hvis disse allerede finnes. Disse applikasjonsspesifikke verdiene endrer ikke telemetri/kjøretidsinnstillinger før malen din bruker dem.

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

**Suksesskriterier:**
- [ ] Tre miljøer opprettet vellykket
- [ ] Hvert miljø har unik konfigurasjon
- [ ] Kan bytte mellom miljøer uten feil
- [ ] `azd env list` viser alle tre miljøene

### Øvelse 2: Key Vault hemmelighetsreferanser (10-20 minutter)

**Mål**: Lagre en Key Vault-referanse i stedet for ren tekst. **Startpunkt:** et initialisert miljø, Azure-pålogging og tilgang til en Key Vault med tillatelser til å opprette/lese en dummy-hemmlighet. Vault-operasjoner kan medføre kostnader.

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

**Suksesskriterier:**
- [ ] Interaktiv kommando rapporterer valgt vault og hemmelighetsreferanse
- [ ] Lokal `.env` inneholder en referanse i stedet for dummy-hemmeligheten
- [ ] Kan forklare at kjøringsidentitet/RBAC og forbruk fortsatt må konfigureres

**Vanlige problemer:** en 403 krever riktig vault data-plane-rolle og spredningstid; `azd env set ... --secret` er ikke en gyldig kommando. Vanlig `get-values`/`get-value`-utdata må ikke antas å være skjult. Fjern treningsreferansen med `azd env unset TRAINING_API_KEY`; dette sletter ikke vault-hemmeligheten, som du må rydde separat hvis du opprettet den.

## Neste steg

- [Ditt første prosjekt](../chapter-01-foundation/first-project.md) - Bruk konfigurasjon i praksis
- [Distribusjonsveiledning](../chapter-04-infrastructure/deployment-guide.md) - Bruk konfigurasjon for distribusjon
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Konfigurasjoner klare for produksjon

## Referanser

- [azd Konfigurasjonsreferanse](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-skjema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Miljøvariabler](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Kapittelnavigasjon:**
- **📚 Kurs Hjem**: [AZD For Nybegynnere](../../README.md)
- **📖 Nåværende Kapittel**: Kapittel 3 - Konfigurasjon & Autentisering
- **⬅️ Forrige**: [Ditt Første Prosjekt](../chapter-01-foundation/first-project.md)
- **➡️ Neste Kapittel**: [Kapittel 4: Infrastruktur som Kode](../chapter-04-infrastructure/deployment-guide.md)
- **Neste Leksjon**: [Autentisering & Sikkerhet](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->