# Konfigurationsguide

**Navigering i kapitel:**
- **📚 Kursstart**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 3 - Konfiguration & Autentisering
- **⬅️ Föregående**: [Ditt Första Projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa**: [Deploymentsguide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Nästa kapitel**: [Kapitel 4: Infrastruktur som Kod](../chapter-04-infrastructure/deployment-guide.md)

## Introduktion

> Granskad mot `azd 1.37.2` (november 2026). Bash-kommandon antar ett initierat azd-projekt. Om inte uttryckligen beskrivet som en komplett fil, är YAML/Bicep-utdrag fragment att slå samman i matchande projektfiler, inte fristående körbara projekt.

Denna omfattande guide täcker alla aspekter av att konfigurera Azure Developer CLI för optimala utvecklings- och deployflöden. Du kommer att lära dig om konfigurationshierarkin, miljöhantering, autentiseringsmetoder och avancerade konfigurationsmönster som möjliggör effektiva och säkra Azure-deployments.

## Lärandemål

I slutet av denna lektion kommer du att:
- Bemästra azd:s konfigurationshierarki och förstå hur inställningar prioriteras
- Effektivt konfigurera globala och projektspecifika inställningar
- Hantera flera miljöer med olika konfigurationer
- Implementera säkra autentiserings- och auktoriseringsmönster
- Förstå avancerade konfigurationsmönster för komplexa scenarier

## Läroutbyten

Efter att ha slutfört denna lektion kommer du kunna:
- Konfigurera azd för optimala utvecklingsflöden
- Sätta upp och hantera flera deploymiljöer
- Implementera säkra konfigurationshanteringsrutiner
- Felsöka konfigurationsrelaterade problem
- Anpassa azd-beteende för specifika organisatoriska krav

Denna omfattande guide täcker alla aspekter av att konfigurera Azure Developer CLI för optimala utvecklings- och deployflöden.

## Förstå AI-agenter i ett azd-projekt

Om du är ny på AI-agenter, här är ett enkelt sätt att tänka på dem inom azd-världen.

### Vad är en Agent?

En agent är en mjukvarukomponent som kan ta emot en förfrågan, resonera kring den och vidta åtgärder—ofta genom att anropa en AI-modell, hämta data eller anropa andra tjänster. I ett azd-projekt är en agent bara en annan **tjänst** jämte din webbfrontend eller API-backend.

### Hur agenter passar in i azd-projektstrukturen

Ett azd-projekt består av tre lager: **infrastruktur**, **kod** och **konfiguration**. Agenter ansluter till dessa lager på samma sätt som vilken annan tjänst som helst:

| Lager | Vad det gör för en traditionell app | Vad det gör för en agent |
|-------|---------------------------------|-------------------------|
| **Infrastruktur** (`infra/`) | Provisionerar en webbapp och databas | Provisionerar en AI-modellendpoint, sökindex eller agenthost |
| **Kod** (`src/`) | Innehåller din frontend och API-källkod | Innehåller din agentlogik och promptdefinitioner |
| **Konfiguration** (`azure.yaml`) | Listar dina tjänster och deras hostingsmål | Listar din agent som en tjänst, pekande på dess kod och host |

### Rollen för `azure.yaml`

Du behöver inte memorera syntaxen just nu. Konceptuellt är `azure.yaml` filen där du säger till azd: *"Här är tjänsterna som utgör min applikation, och här hittar du deras kod."*

När ditt projekt inkluderar en AI-agent listar `azure.yaml` helt enkelt den agenten som en av tjänsterna. azd vet då att provisionera rätt infrastruktur (som en Microsoft Foundry Models-endpoint eller en Container App för att hosta agenten) och distribuera din agentkod—precis som det gör för en webbapp eller API.

Det betyder att det inte finns något fundamentalt nytt att lära sig. Om du förstår hur azd hanterar en webbtjänst, förstår du redan hur det hanterar en agent.

## Konfigurationshierarki

azd har distinkta konfigurationsytor, inte en universell överlagring:
- **Globala användarpreferenser**: `~/.azd/config.json`, hanteras av `azd config`.
- **Projektdefinition**: `azure.yaml` specificerar tjänster, infrastruktur och hooks.
- **Lokal miljöselektion**: `.azure/config.json`.
- **Värden per miljö**: `.azure/<name>/.env`, hanteras av `azd env`; ytterligare inställningar finns i den miljöns `config.json`.
- **Flaggor och processvariabler**: åsidosätter endast inställningar som stöds av ett visst kommando/provider.

Ett godtyckligt `azd env set`-värde blir inte automatiskt en infrastrukturparameter eller distribuerad applikationsinställning. Referera uttryckligen till det i parameterfilen, stöd för tjänstemiljö eller en hook.

## Global konfiguration

### Ställa in globala standarder
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

### Vanliga globala inställningar
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
Filen `azure.yaml` är hjärtat i ditt azd-projekt:

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

Detta är ett **exempel på projektdefinition**, inte en levererad startfil. Skapa de refererade källkatalogerna, hookskripten, paketningsskripten och matchande `infra/main.bicep`/`main.parameters.json` innan du kör. Databaser hör hemma i infrastrukturen; `postgres` är inte en inbyggd tjänstehost. Infrastrukturparametrar ska anges i providerparameterfilen, inte `infra.parameters`.

### Tjänstekonfigurationsalternativ

#### Hosttyper
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

#### Språkspecifika bygg-hooks

Följande tjänstfragment illustrerar hooks; slå samman dem med varje tjänsts riktiga `project` och `host`. `buildCommand` och `startCommand` är inte generiska azd-tjänsteegenskaper. Konfigurera uppstart i applikationen, Dockerfile eller hostningsinfrastrukturen.

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

## 🌟 Miljöhantering

### Skapa miljöer
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Miljökonfiguration
Kärnvärden för miljön finns i `.azure/<env-name>/.env`, inklusive `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID` och `AZURE_LOCATION`. Använd `azd env config get/set` för ytterligare JSON-inställningar för miljön. Följande JSON är **konceptuell applikationstillstånd**, inte ett azd-konfigschema; kopiera inte in det i azds filer:

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

### Miljövariabler

**Endast som rentextdemonstration.** Vanliga `azd env set`-värden skrivs till `.azure/<name>/.env` och kan skrivas ut med läskommandon. Använd inte exempel-API-nyckeln som ett verkligt autentiseringsmedel. För hemligheter, använd `azd env set-secret` och explicit körning av anslutning.

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

### Miljömallar
Skapa en **icke-hemlig, manuellt underhållen** `.env.example` i projektroten för konsekvent setup. azd laddar inte automatiskt en fil som heter `env.template`:
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

### Dela miljöer i ett team

När fler än en person arbetar i ett projekt måste ni komma överens om **vad som följer med repo och vad som stannar lokalt**. azd håller varje miljö i en `.azure/`-mapp, och inte allt där ska läggas i versionshanteringen.

**Vad som finns i `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Vad som ska gitignore’as.** azds standardfil `.gitignore` utesluter redan `.azure/`. Behåll det så—`.env`-filerna kan innehålla hemligheter, och resurs-ID:n är specifika för den som provisionerade dem. Varje teammedlem skapar sin **egna** miljö lokalt:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Byta mellan miljöer.** En utvecklare som hanterar flera miljöer väljer aktiv miljö innan kommandon körs:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Tillhandahålla icke-hemliga standardvärden till teamet.** Committa `.env.example` utanför den ignorerade `.azure/`-mappen. Nya teammedlemmar kopierar den till en lokal ignorerad fil, fyller i värden och importerar den explicit med `azd env set --file <local-file>`. Importera aldrig tomma platshållare över en fungerande miljö.

**Miljöer i CI/CD.** Pipelines läser inte din lokala `.azure/`-mapp. Istället tillhandahåller du miljövärden som pipeline-variabler/hemligheter, och azd läser dem från processmiljön:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Tumregel:** infrastrukturkod (`infra/`, `azure.yaml`) delas i Git; miljö *tillstånd och hemligheter* (`.azure/`) är per-utvecklare och per-pipeline. `azd pipeline config` sätter upp pipeline-variabler automatiskt åt dig.

## 🔐 Autentiseringskonfiguration

### Integration med Azure CLI
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Autentisering med Service Principal
För CI/CD-pipelines:
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
För Azure-hostade miljöer:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ Infrastrukturkonfiguration

### Bicep-parameter
Konfigurera infrastrukturparametrar i `infra/main.parameters.json`:
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
För Terraform-projekt ersätter azd platshållare i `infra/main.tfvars.json`. Dessa namn måste matcha deklarerade Terraform inputvariabler:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Deploykonfiguration

### Byggkonfiguration
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
Sökvägar är relativa till tjänsteprojektet. Dockerfilen måste deklarera eventuella `ARG`-värden den konsumerar. Vid multi-stage build, placera deploy-stadiet sist eller använd ett eget paketeringsarbetsflöde; `docker.target` är inte en stödd egenskap i den granskade schemat.

## 🔧 Avancerad konfiguration

### Anpassade resursnamn
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Definiera faktiska resursnamn i Bicep/Terraform och håll resursgruppsskapandet konsekvent med denna inställning. Det finns inga generiska `naming.storageAccount` eller `naming.keyVault` konfigurationsnycklar.

### Nätverkskonfiguration
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Slå samman dessa **illustrativa parameterposter** i `infra/main.parameters.json` under `parameters` och deklarera och konsumera matchande parametrar i Bicep. De gör ingenting själva.

### Övervakningskonfiguration
Provisionera Application Insights och Log Analytics i Bicep/Terraform och konfigurera applikationstelemetri i din SDK. Det finns ingen generisk toppnivå `monitoring`-block i `azure.yaml` som skapar dessa resurser. Se [övervakningsinfrastruktur](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

## 🎯 Miljöspecifika konfigurationer

### Utvecklingsmiljö
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Testmiljö
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produktionsmiljö
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validering av konfiguration

### Validera konfiguration
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Konfigurationsskript
Skapa valideringsskript i `scripts/`:

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

## 🎓 Bästa praxis

### 1. Använd miljövariabler
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

Undvik hårdkodning av känsliga värden (separerad illustrativ konfiguration, inte en andra `database`-nyckel i samma fil):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisera konfigurationsfiler
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

### 3. Versionshanteringsöverväganden
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Dokumentation av konfiguration
Dokumentera din konfiguration i `CONFIG.md`:
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

## 🎯 Praktiska övningar

### Övning 1: Multi-miljökonfiguration (15 minuter)

**Mål**: Skapa och konfigurera tre lokala miljöer med olika värden. Börja i ett initierat projekt; använd oanvända namn om dessa redan finns. Dessa applikationsspecifika värden ändrar inte telemetri/körningsinställningar förrän din mall konsumerar dem.

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

**Framgångskriterier:**
- [ ] Tre miljöer skapade framgångsrikt
- [ ] Varje miljö har unik konfiguration
- [ ] Kan växla mellan miljöer utan fel
- [ ] `azd env list` visar alla tre miljöer

### Övning 2: Key Vault-hemlighetsreferenser (10-20 minuter)

**Mål**: Spara en Key Vault-referens istället för plaintext. **Startpunkt:** en initierad miljö, Azure-inloggning, och tillgång till en Key Vault med rättigheter att skapa/läsa en dummyhemlighet. Vault-operationer kan medföra avgifter.

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

**Framgångskriterier:**
- [ ] Interaktivt kommando rapporterar valt vault och hemlighetsreferens
- [ ] Lokal `.env` innehåller en referens istället för dummyhemligheten
- [ ] Kan förklara att körningsidentitet/RBAC och konsumtion ändå måste konfigureras

**Vanliga problem:** en 403 kräver korrekt vault-data-plane-roll och spridningstid; `azd env set ... --secret` är inte ett giltigt kommando. Vanlig `get-values`/`get-value`-utdata får inte antas vara rödigerad. Ta bort träningreferensen med `azd env unset TRAINING_API_KEY`; detta tar inte bort vault-hemligheten, som du måste städa upp separat om du skapade den.

## Nästa steg

- [Ditt Första Projekt](../chapter-01-foundation/first-project.md) - Tillämpa konfiguration i praktiken
- [Deploymentsguide](../chapter-04-infrastructure/deployment-guide.md) - Använd konfiguration för deployment
- [Provisionera resurser](../chapter-04-infrastructure/provisioning.md) - Produktionsfärdiga konfigurationer

## Referenser

- [azd Konfigurationsreferens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Miljövariabler](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Navigering i kapitel:**
- **📚 Kurshemsida**: [AZD For Beginners](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 3 - Konfiguration & autentisering
- **⬅️ Föregående**: [Ditt första projekt](../chapter-01-foundation/first-project.md)
- **➡️ Nästa kapitel**: [Kapitel 4: Infrastruktur som kod](../chapter-04-infrastructure/deployment-guide.md)
- **Nästa lektion**: [Autentisering & säkerhet](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->