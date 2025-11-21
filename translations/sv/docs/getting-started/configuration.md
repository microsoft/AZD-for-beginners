<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-21T08:43:32+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "sv"
}
-->
# Konfigurationsguide

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 3 - Konfiguration & Autentisering
- **⬅️ Föregående**: [Ditt Första Projekt](first-project.md)
- **➡️ Nästa**: [Distributionsguide](../deployment/deployment-guide.md)
- **🚀 Nästa Kapitel**: [Kapitel 4: Infrastruktur som Kod](../deployment/deployment-guide.md)

## Introduktion

Den här omfattande guiden täcker alla aspekter av att konfigurera Azure Developer CLI för optimala utvecklings- och distributionsarbetsflöden. Du kommer att lära dig om konfigurationshierarkin, miljöhantering, autentiseringsmetoder och avancerade konfigurationsmönster som möjliggör effektiva och säkra Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du att:
- Behärska azd-konfigurationshierarkin och förstå hur inställningar prioriteras
- Konfigurera globala och projekt-specifika inställningar effektivt
- Hantera flera miljöer med olika konfigurationer
- Implementera säkra autentiserings- och auktoriseringsmönster
- Förstå avancerade konfigurationsmönster för komplexa scenarier

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Konfigurera azd för optimala utvecklingsarbetsflöden
- Ställa in och hantera flera distributionsmiljöer
- Implementera säkra konfigurationshanteringsmetoder
- Felsöka konfigurationsrelaterade problem
- Anpassa azd:s beteende för specifika organisatoriska krav

Den här omfattande guiden täcker alla aspekter av att konfigurera Azure Developer CLI för optimala utvecklings- och distributionsarbetsflöden.

## Konfigurationshierarki

azd använder ett hierarkiskt konfigurationssystem:
1. **Kommandoradsflaggor** (högsta prioritet)
2. **Miljövariabler**
3. **Lokal projektkonfiguration** (`.azd/config.json`)
4. **Global användarkonfiguration** (`~/.azd/config.json`)
5. **Standardvärden** (lägsta prioritet)

## Global Konfiguration

### Ställa in Globala Standardvärden
```bash
# Ställ in standardabonnemang
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ställ in standardplats
azd config set defaults.location "eastus2"

# Ställ in standardnamngivningskonvention för resursgrupp
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Visa all global konfiguration
azd config list

# Ta bort en konfiguration
azd config unset defaults.location
```

### Vanliga Globala Inställningar
```bash
# Utvecklingspreferenser
azd config set alpha.enable true                    # Aktivera alfa-funktioner
azd config set telemetry.enabled false             # Inaktivera telemetri
azd config set output.format json                  # Ställ in utdataformat

# Säkerhetsinställningar
azd config set auth.useAzureCliCredential true     # Använd Azure CLI för autentisering
azd config set tls.insecure false                  # Tvinga TLS-verifiering

# Prestandaoptimering
azd config set provision.parallelism 5             # Parallell resurskapande
azd config set deploy.timeout 30m                  # Tidsgräns för distribution
```

## 🏗️ Projektkonfiguration

### azure.yaml-struktur
Filen `azure.yaml` är hjärtat i ditt azd-projekt:

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

### Tjänstekonfigurationsalternativ

#### Värdtyper
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

#### Språkspecifika Inställningar
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

## 🌟 Miljöhantering

### Skapa Miljöer
```bash
# Skapa en ny miljö
azd env new development

# Skapa med specifik plats
azd env new staging --location "westus2"

# Skapa från mall
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Miljökonfiguration
Varje miljö har sin egen konfiguration i `.azure/<env-name>/config.json`:

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
```bash
# Ställ in miljöspecifika variabler
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Visa miljövariabler
azd env get-values

# Förväntad utdata:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=hemlig-api-nyckel
# DEBUG=sant

# Ta bort miljövariabel
azd env unset DEBUG

# Verifiera borttagning
azd env get-values | grep DEBUG
# (bör returnera ingenting)
```

### Miljömallar
Skapa `.azure/env.template` för konsekvent miljöinställning:
```bash
# Krävs variabler
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Applikationsinställningar
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Valfria utvecklingsinställningar
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Autentiseringskonfiguration

### Azure CLI-integration
```bash
# Använd Azure CLI-referenser (standard)
azd config set auth.useAzureCliCredential true

# Logga in med specifik klientorganisation
az login --tenant <tenant-id>

# Ställ in standardabonnemang
az account set --subscription <subscription-id>
```

### Service Principal-autentisering
För CI/CD-pipelines:
```bash
# Ställ in miljövariabler
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Eller konfigurera direkt
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Hanterad Identitet
För Azure-värdmiljöer:
```bash
# Aktivera autentisering med hanterad identitet
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastrukturkonfiguration

### Bicep-parametrar
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
För Terraform-projekt, konfigurera i `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Distributionskonfiguration

### Byggkonfiguration
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
Exempel `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Avancerad Konfiguration

### Anpassade Resursnamn
```bash
# Ställ in namngivningskonventioner
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Nätverkskonfiguration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Övervakningskonfiguration
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

## 🎯 Miljöspecifika Konfigurationer

### Utvecklingsmiljö
```bash
# .azure/utveckling/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Stagingmiljö
```bash
# .azure/staging/.miljö
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

## 🔍 Validering av Konfiguration

### Validera Konfiguration
```bash
# Kontrollera konfigurationssyntax
azd config validate

# Testa miljövariabler
azd env get-values

# Validera infrastruktur
azd provision --dry-run
```

### Konfigurationsskript
Skapa valideringsskript i `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Kontrollera nödvändiga miljövariabler
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validera syntaxen för azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Bästa Praxis

### 1. Använd Miljövariabler
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisera Konfigurationsfiler
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

### 3. Versionshanteringsöverväganden
```bash
# .gitignore
.azure/*/config.json         # Miljökonfigurationer (innehåller resurs-ID:n)
.azure/*/.env               # Miljövariabler (kan innehålla hemligheter)
.env                        # Lokal miljöfil
```

### 4. Dokumentation av Konfiguration
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

## 🎯 Praktiska Övningar

### Övning 1: Multi-Miljökonfiguration (15 minuter)

**Mål**: Skapa och konfigurera tre miljöer med olika inställningar

```bash
# Skapa utvecklingsmiljö
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Skapa stagingmiljö
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Skapa produktionsmiljö
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifiera varje miljö
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Framgångskriterier:**
- [ ] Tre miljöer skapade framgångsrikt
- [ ] Varje miljö har unik konfiguration
- [ ] Kan växla mellan miljöer utan fel
- [ ] `azd env list` visar alla tre miljöer

### Övning 2: Hantering av Hemligheter (10 minuter)

**Mål**: Öva på säker konfiguration med känslig data

```bash
# Ställ in hemligheter (visas inte i output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ställ in icke-hemlig konfiguration
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Visa miljö (hemligheter bör döljas)
azd env get-values

# Verifiera att hemligheter lagras
azd env get DB_PASSWORD  # Bör visa faktiskt värde
```

**Framgångskriterier:**
- [ ] Hemligheter lagrade utan att visas i terminalen
- [ ] `azd env get-values` visar maskerade hemligheter
- [ ] Individuell `azd env get <SECRET_NAME>` hämtar faktiskt värde

## Nästa Steg

- [Ditt Första Projekt](first-project.md) - Tillämpa konfiguration i praktiken
- [Distributionsguide](../deployment/deployment-guide.md) - Använd konfiguration för distribution
- [Provisionering av Resurser](../deployment/provisioning.md) - Produktionsklara konfigurationer

## Referenser

- [azd Konfigurationsreferens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Miljövariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Kapitelnavigering:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande Kapitel**: Kapitel 3 - Konfiguration & Autentisering
- **⬅️ Föregående**: [Ditt Första Projekt](first-project.md)
- **➡️ Nästa Kapitel**: [Kapitel 4: Infrastruktur som Kod](../deployment/deployment-guide.md)
- **Nästa Lektion**: [Ditt Första Projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->