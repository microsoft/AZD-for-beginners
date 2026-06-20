# Konfigurationsvejledning

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 3 - Konfiguration & autentificering
- **⬅️ Forrige**: [Dit første projekt](first-project.md)
- **➡️ Næste**: [Udrulningsguide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Næste kapitel**: [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)

## Introduktion

Denne omfattende vejledning dækker alle aspekter af konfiguration af Azure Developer CLI for optimale udviklings- og udrulningsarbejdsgange. Du lærer om konfigurationshierarkiet, miljøstyring, godkendelsesmetoder og avancerede konfigurationsmønstre, der muliggør effektive og sikre Azure-udrulninger.

## Læringsmål

Når du er færdig med denne lektion, vil du:
- Beherske azd-konfigurationshierarkiet og forstå, hvordan indstillinger prioriteres
- Konfigurere globale og projektspecifikke indstillinger effektivt
- Administrere flere miljøer med forskellige konfigurationer
- Implementere sikre autentificerings- og autorisationsmønstre
- Forstå avancerede konfigurationsmønstre for komplekse scenarier

## Læringsudbytte

Efter at have gennemført denne lektion vil du være i stand til at:
- Konfigurere azd til optimale udviklingsarbejdsgange
- Opsætte og administrere flere udrulningsmiljøer
- Implementere sikre praksisser for konfigurationsstyring
- Fejlsøge konfigurationsrelaterede problemer
- Tilpasse azd-adfærd til specifikke organisationskrav

Denne omfattende vejledning dækker alle aspekter af konfiguration af Azure Developer CLI for optimale udviklings- og udrulningsarbejdsgange.

## Forståelse af AI-agenter i et azd-projekt

Hvis du er ny i forhold til AI-agenter, er her en enkel måde at tænke på dem i azd-verdenen.

### Hvad er en agent?

En agent er et stykke software, der kan modtage en forespørgsel, ræsonnere omkring den og udføre handlinger—ofte ved at kalde en AI-model, slå data op eller påkalde andre tjenester. I et azd-projekt er en agent blot en anden **service** side om side med dit web-frontend eller API-backend.

### Hvordan agenter passer ind i azd-projektstrukturen

Et azd-projekt består af tre lag: **infrastructure**, **code**, og **configuration**. Agenter tilsluttes disse lag på samme måde som enhver anden service:

| Lag | Hvad det gør for en traditionel app | Hvad det gør for en agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisionerer en webapp og en database | Provisionerer et Microsoft Foundry Models-endpoint, en søgeindeks eller en agenthost |
| **Code** (`src/`) | Indeholder din frontend- og API-kildekode | Indeholder din agentlogik og promptdefinitioner |
| **Configuration** (`azure.yaml`) | Lister dine services og deres hostingmål | Lister din agent som en service, der peger på dens kode og vært |

### Rollen for `azure.yaml`

Du behøver ikke at memorere syntaksen lige nu. Konceptuelt er `azure.yaml` filen, hvor du fortæller azd: *"Her er de services, der udgør min applikation, og her er, hvor man finder deres kode."*

Når dit projekt inkluderer en AI-agent, lister `azure.yaml` blot den agent som en af servicesne. azd ved så at provisionere den rigtige infrastruktur (som et Microsoft Foundry Models-endpoint eller en Container App til at hoste agenten) og udrulle din agentkode—præcis som det ville gøre for en webapp eller API.

Det betyder, at der ikke er noget grundlæggende nyt at lære. Hvis du forstår, hvordan azd håndterer en webservice, forstår du allerede, hvordan det håndterer en agent.

## Konfigurationshierarki

azd bruger et hierarkisk konfigurationssystem:
1. **Kommandolinjeflag** (højeste prioritet)
2. **Miljøvariabler**
3. **Lokal projektkonfiguration** (`.azd/config.json`)
4. **Global brugerkonfiguration** (`~/.azd/config.json`)
5. **Standardværdier** (laveste prioritet)

## Global konfiguration

### Indstilling af globale standardværdier
```bash
# Angiv standardabonnement
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Angiv standardplacering
azd config set defaults.location "eastus2"

# Angiv standardnavngivningskonvention for ressourcegrupper
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vis alle globale konfigurationer
azd config show

# Fjern en konfiguration
azd config unset defaults.location
```

### Almindelige globale indstillinger
```bash
# Udviklingspræferencer
azd config set alpha.enable true                    # Aktivér alfa-funktioner
azd config set telemetry.enabled false             # Deaktiver telemetri
azd config set output.format json                  # Angiv outputformat

# Sikkerhedsindstillinger
azd config set auth.useAzureCliCredential true     # Brug Azure CLI til godkendelse
azd config set tls.insecure false                  # Håndhæv TLS-verifikation

# Ydelsesjustering
azd config set provision.parallelism 5             # Parallel oprettelse af ressourcer
azd config set deploy.timeout 30m                  # Timeout for udrulning
```

## 🏗️ Projektkonfiguration

### Struktur i `azure.yaml`
Filen `azure.yaml` er hjertet i dit azd-projekt:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0
  templateBranch: main

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
      context: ./src/api
      dockerfile: Dockerfile
    
  # Database service
  database:
    project: ./src/db
    host: postgres
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location
  parameters:
    environmentName: ${AZURE_ENV_NAME}
    location: ${AZURE_LOCATION}

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

### Servicekonfigurationsmuligheder

#### Værttyper
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

#### Sprog-specifikke indstillinger
```yaml
services:
  node-app:
    language: js
    buildCommand: npm run build
    startCommand: npm start
    
  python-app:
    language: python
    buildCommand: pip install -r requirements.txt
    startCommand: gunicorn app:app
    
  dotnet-app:
    language: csharp
    buildCommand: dotnet build
    startCommand: dotnet run
    
  java-app:
    language: java
    buildCommand: mvn clean package
    startCommand: java -jar target/app.jar
```

## 🌟 Miljøstyring

### Oprettelse af miljøer
```bash
# Opret et nyt miljø
azd env new development

# Opret med specifik placering
azd env new staging --location "westus2"

# Opret fra skabelon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Miljøkonfiguration
Hvert miljø har sin egen konfiguration i `.azure/<env-name>/config.json`:

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
```bash
# Indstil miljøspecifikke variabler
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Vis miljøvariabler
azd env get-values

# Forventet output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Fjern miljøvariablen
azd env unset DEBUG

# Bekræft fjernelsen
azd env get-values | grep DEBUG
# (skal ikke returnere noget)
```

### Miljøskabeloner
Opret `.azure/env.template` for ensartet miljøopsætning:
```bash
# Påkrævede variabler
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Programindstillinger
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valgfri udviklingsindstillinger
DEBUG=false
LOG_LEVEL=info
```

### Deling af miljøer i et team

Når mere end én person arbejder på et projekt, skal I blive enige om **hvad der rejser med repoet, og hvad der forbliver lokalt**. azd holder hvert miljø under en `.azure/`-mappe, og ikke alt derinde skal committes.

**Hvad der er i `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**Hvad man skal gitignore.** azd's standard `.gitignore` udelukker allerede `.azure/`. Behold det sådan—`.env`-filerne kan indeholde hemmeligheder, og ressource-id'er er specifikke for den, der provisionerede dem. Hver teammedlem opretter sit **eget** miljø lokalt:

```bash
# Hver udvikler kører dette en gang for at få sit eget isolerede miljø.
azd env new dev-alice
azd up
```

**Skift mellem miljøer.** En udvikler, der administrerer flere miljøer, vælger det aktive, før kommandoer køres:

```bash
azd env list                 # se alle lokale miljøer og hvilket der er standard
azd env select staging       # gør 'staging' til det aktive miljø
azd env get-values           # bekræft, at du peger på det rigtige
```

**Give ikke-hemmelige standarder til teamet.** Commit en skabelon (som `.azure/env.template` ovenfor), så alle ved, hvilke variabler der skal sættes—men commit aldrig de udfyldte værdier. Nye teammedlemmer kopierer skabelonen og udfylder deres egne værdier.

**Miljøer i CI/CD.** Pipelines læser ikke din lokale `.azure/`-mappe. I stedet leveres miljøværdierne som pipeline-variabler/hemmeligheder, og azd læser dem fra processens miljø:

```bash
# I CI læser azd disse fra miljøet, ikke fra .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Tommelfingerregel:** infrastrukturkode (`infra/`, `azure.yaml`) deles i Git; miljøets *tilstand og hemmeligheder* (`.azure/`) er per-udvikler og per-pipeline. `azd pipeline config` sætter pipelinevariablerne for dig automatisk.

## 🔐 Autentificeringskonfiguration

### Azure CLI-integration
```bash
# Brug Azure CLI-legitimationsoplysninger (standard)
azd config set auth.useAzureCliCredential true

# Log ind med en specifik lejer
az login --tenant <tenant-id>

# Indstil standardabonnement
az account set --subscription <subscription-id>
```

### Service Principal-autentificering
For CI/CD-pipelines:
```bash
# Indstil miljøvariabler
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Eller konfigurer direkte
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Administreret identitet
For Azure-hostede miljøer:
```bash
# Aktivér godkendelse via administreret identitet
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
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
For Terraform-projekter, konfigurer i `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Udrulningskonfiguration

### Build-konfiguration
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    language: js
    buildCommand: npm run build:prod
    buildEnvironment:
      NODE_ENV: production
      REACT_APP_API_URL: ${API_URL}
    dist: build
    
  api:
    project: ./src/api
    language: python
    buildCommand: |
      pip install -r requirements.txt
      python -m pytest tests/
    buildEnvironment:
      PYTHONPATH: src
```

### Docker-konfiguration
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: ./src/api
      dockerfile: Dockerfile
      target: production
      buildArgs:
        NODE_ENV: production
        API_VERSION: v1.0.0
```
Eksempel `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Avanceret konfiguration

### Tilpasset ressourcenavngivning
```bash
# Angiv navngivningskonventioner
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Netværkskonfiguration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Overvågningskonfiguration
```yaml
# In azure.yaml
monitoring:
  applicationInsights:
    enabled: true
    samplingPercentage: 100
  logAnalytics:
    enabled: true
    retentionDays: 30
```

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

### Valider konfigurationen
```bash
# Kontroller konfigurationssyntaks
azd config validate

# Test miljøvariabler
azd env get-values

# Valider infrastruktur
azd provision --dry-run
```

### Konfigurationsscripts
Opret valideringsscripts i `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kontroller påkrævede miljøvariabler
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valider azure.yaml-syntaks
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisér konfigurationsfiler
```
.azure/
├── config.json              # Global project config
├── env.template             # Environment template
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

### 3. Overvejelser ved versionskontrol
```bash
# .gitignore
.azure/*/config.json         # Miljøkonfigurationer (indeholder ressource-id'er)
.azure/*/.env               # Miljøvariabler (kan indeholde hemmeligheder)
.env                        # Lokal miljøfil
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

## 🎯 Praktiske øvelsesopgaver

### Øvelse 1: Multi-miljø-konfiguration (15 minutter)

**Mål**: Opret og konfigurer tre miljøer med forskellige indstillinger

```bash
# Opret udviklingsmiljø
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Opret stagingmiljø
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Opret produktionsmiljø
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Bekræft hvert miljø
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Succeskriterier:**
- [ ] Tre miljøer oprettet med succes
- [ ] Hvert miljø har en unik konfiguration
- [ ] Kan skifte mellem miljøer uden fejl
- [ ] `azd env list` viser alle tre miljøer

### Øvelse 2: Hemmelighedshåndtering (10 minutter)

**Mål**: Øv sikker konfiguration med følsomme data

```bash
# Angiv hemmeligheder (vises ikke i output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Angiv ikke-hemmelig konfiguration
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vis miljø (hemmeligheder bør skjules)
azd env get-values

# Bekræft at hemmeligheder er gemt
azd env get DB_PASSWORD  # Bør vise den faktiske værdi
```

**Succeskriterier:**
- [ ] Hemmeligheder gemt uden at blive vist i terminalen
- [ ] `azd env get-values` viser maskede hemmeligheder
- [ ] Individuelt `azd env get <SECRET_NAME>` henter den faktiske værdi

## Næste skridt

- [Dit første projekt](first-project.md) - Anvend konfigurationen i praksis
- [Udrulningsguide](../chapter-04-infrastructure/deployment-guide.md) - Brug konfigurationen til udrulning
- [Provisionering af ressourcer](../chapter-04-infrastructure/provisioning.md) - Produktionsklare konfigurationer

## Referencer

- [azd-konfigurationsreference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-skema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Kapitelnavigation:**
- **📚 Kursusforside**: [AZD for begyndere](../../README.md)
- **📖 Aktuelt kapitel**: Kapitel 3 - Konfiguration & autentificering
- **⬅️ Forrige**: [Dit første projekt](first-project.md)
- **➡️ Næste kapitel**: [Kapitel 4: Infrastruktur som kode](../chapter-04-infrastructure/deployment-guide.md)
- **Næste lektion**: [Dit første projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->