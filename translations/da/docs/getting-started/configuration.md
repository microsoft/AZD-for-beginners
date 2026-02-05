# Konfigurationsguide

**Kapitelnavigation:**
- **📚 Kurs Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 3 - Konfiguration & Godkendelse
- **⬅️ Forrige**: [Dit Første Projekt](first-project.md)
- **➡️ Næste**: [Deploymentsguide](../deployment/deployment-guide.md)
- **🚀 Næste Kapitel**: [Kapitel 4: Infrastruktur som kode](../deployment/deployment-guide.md)

## Introduktion

Denne omfattende guide dækker alle aspekter af konfiguration af Azure Developer CLI for at opnå optimale udviklings- og deploymentsarbejdsgange. Du vil lære om konfigurationshierarkiet, miljøstyring, godkendelsesmetoder og avancerede konfigurationsmønstre, der muliggør effektive og sikre Azure-deployments.

## Læringsmål

Ved slutningen af denne lektion vil du:
- Mestre azd-konfigurationshierarkiet og forstå, hvordan indstillinger prioriteres
- Effektivt konfigurere globale og projekt-specifikke indstillinger
- Administrere flere miljøer med forskellige konfigurationer
- Implementere sikre godkendelses- og autorisationsmønstre
- Forstå avancerede konfigurationsmønstre til komplekse scenarier

## Læringsresultater

Efter at have gennemført denne lektion vil du være i stand til at:
- Konfigurere azd for optimale udviklingsarbejdsgange
- Opsætte og administrere flere deployment-miljøer
- Implementere sikre konfigurationsstyringspraksisser
- Fejlsøge konfigurationsrelaterede problemer
- Tilpasse azd-adfærd til specifikke organisatoriske krav

Denne omfattende guide dækker alle aspekter af konfiguration af Azure Developer CLI for at opnå optimale udviklings- og deploymentsarbejdsgange.

## Konfigurationshierarki

azd bruger et hierarkisk konfigurationssystem:
1. **Kommandolinjeflag** (højeste prioritet)
2. **Miljøvariabler**
3. **Lokal projektkonfiguration** (`.azd/config.json`)
4. **Global brugerkonfiguration** (`~/.azd/config.json`)
5. **Standardværdier** (laveste prioritet)

## Global Konfiguration

### Indstilling af Globale Standarder
```bash
# Indstil standardabonnement
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Indstil standardlokation
azd config set defaults.location "eastus2"

# Indstil standardnavngivningskonvention for ressourcegruppe
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Vis al global konfiguration
azd config list

# Fjern en konfiguration
azd config unset defaults.location
```

### Almindelige Globale Indstillinger
```bash
# Udviklingspræferencer
azd config set alpha.enable true                    # Aktiver alfa-funktioner
azd config set telemetry.enabled false             # Deaktiver telemetri
azd config set output.format json                  # Indstil outputformat

# Sikkerhedsindstillinger
azd config set auth.useAzureCliCredential true     # Brug Azure CLI til godkendelse
azd config set tls.insecure false                  # Gennemtving TLS-verifikation

# Ydelsestilpasning
azd config set provision.parallelism 5             # Parallel ressourceoprettelse
azd config set deploy.timeout 30m                  # Implementering timeout
```

## 🏗️ Projektkonfiguration

### azure.yaml Struktur
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

#### Sprog-specifikke Indstillinger
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

### Oprettelse af Miljøer
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
# API_KEY=hemmelig-api-nøgle
# DEBUG=true

# Fjern miljøvariabel
azd env unset DEBUG

# Bekræft fjernelse
azd env get-values | grep DEBUG
# (bør returnere ingenting)
```

### Miljøskabeloner
Opret `.azure/env.template` for en ensartet miljøopsætning:
```bash
# Påkrævede variabler
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Applikationsindstillinger
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valgfrie udviklingsindstillinger
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Godkendelseskonfiguration

### Azure CLI Integration
```bash
# Brug Azure CLI legitimationsoplysninger (standard)
azd config set auth.useAzureCliCredential true

# Log ind med specifik lejer
az login --tenant <tenant-id>

# Indstil standardabonnement
az account set --subscription <subscription-id>
```

### Service Principal Godkendelse
Til CI/CD-pipelines:
```bash
# Indstil miljøvariabler
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Eller konfigurer direkte
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Til Azure-hostede miljøer:
```bash
# Aktiver administreret identitetsautentifikation
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastrukturkonfiguration

### Bicep Parametre
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

### Terraform Konfiguration
Til Terraform-projekter, konfigurer i `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deploymentskonfiguration

### Build Konfiguration
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

### Docker Konfiguration
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

## 🔧 Avanceret Konfiguration

### Tilpasset Ressourcenavngivning
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

## 🎯 Miljøspecifikke Konfigurationer

### Udviklingsmiljø
```bash
# .azure/udvikling/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Stagingmiljø
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produktionsmiljø
```bash
# .azure/produktion/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Validering af Konfiguration

### Valider Konfiguration
```bash
# Kontroller konfigurationssyntaks
azd config validate

# Test miljøvariabler
azd env get-values

# Validér infrastruktur
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

# Valider azure.yaml syntaks
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Bedste Praksis

### 1. Brug Miljøvariabler
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiser Konfigurationsfiler
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

### 3. Overvejelser om Versionskontrol
```bash
# .gitignore
.azure/*/config.json         # Miljøkonfigurationer (indeholder ressource-ID'er)
.azure/*/.env               # Miljøvariabler (kan indeholde hemmeligheder)
.env                        # Lokal miljøfil
```

### 4. Dokumentation af Konfiguration
Dokumenter din konfiguration i `CONFIG.md`:
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

## 🎯 Praktiske Øvelser

### Øvelse 1: Multi-Miljø Konfiguration (15 minutter)

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

# Verificer hvert miljø
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Succeskriterier:**
- [ ] Tre miljøer oprettet med succes
- [ ] Hvert miljø har unik konfiguration
- [ ] Kan skifte mellem miljøer uden fejl
- [ ] `azd env list` viser alle tre miljøer

### Øvelse 2: Håndtering af Hemmeligheder (10 minutter)

**Mål**: Øv sikker konfiguration med følsomme data

```bash
# Indstil hemmeligheder (vises ikke i output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Indstil ikke-hemmelig konfiguration
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Vis miljø (hemmeligheder bør være redigeret)
azd env get-values

# Bekræft, at hemmeligheder er gemt
azd env get DB_PASSWORD  # Skal vise den faktiske værdi
```

**Succeskriterier:**
- [ ] Hemmeligheder gemt uden at blive vist i terminalen
- [ ] `azd env get-values` viser skjulte hemmeligheder
- [ ] Individuel `azd env get <SECRET_NAME>` henter den faktiske værdi

## Næste Skridt

- [Dit Første Projekt](first-project.md) - Anvend konfiguration i praksis
- [Deploymentsguide](../deployment/deployment-guide.md) - Brug konfiguration til deployment
- [Provisionering af Ressourcer](../deployment/provisioning.md) - Produktionsklare konfigurationer

## Referencer

- [azd Konfigurationsreference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Skema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Miljøvariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Kapitelnavigation:**
- **📚 Kurs Hjem**: [AZD For Begyndere](../../README.md)
- **📖 Nuværende Kapitel**: Kapitel 3 - Konfiguration & Godkendelse
- **⬅️ Forrige**: [Dit Første Projekt](first-project.md)
- **➡️ Næste Kapitel**: [Kapitel 4: Infrastruktur som kode](../deployment/deployment-guide.md)
- **Næste Lektion**: [Dit Første Projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal det bemærkes, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->