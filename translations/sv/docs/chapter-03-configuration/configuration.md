# Konfigurationsguide

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 3 - Konfiguration och autentisering
- **⬅️ Föregående**: [Ditt första projekt](first-project.md)
- **➡️ Nästa**: [Distribueringsguide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Nästa kapitel**: [Kapitel 4: Infrastruktur som kod](../chapter-04-infrastructure/deployment-guide.md)

## Introduktion

Denna omfattande guide täcker alla aspekter av att konfigurera Azure Developer CLI för optimala utvecklings- och driftsättningsarbetsflöden. Du kommer att lära dig om konfigurationshierarkin, hantering av miljöer, autentiseringsmetoder och avancerade konfigurationsmönster som möjliggör effektiva och säkra Azure-distributioner.

## Lärandemål

I slutet av denna lektion kommer du att:
- Behärska azd:s konfigurationshierarki och förstå hur inställningar prioriteras
- Konfigurera globala och projektspecifika inställningar effektivt
- Hantera flera miljöer med olika konfigurationer
- Implementera säkra autentiserings- och auktoriseringsmönster
- Förstå avancerade konfigurationsmönster för komplexa scenarier

## Läranderesultat

Efter att ha slutfört denna lektion kommer du att kunna:
- Konfigurera azd för optimala utvecklingsarbetsflöden
- Ställa in och hantera flera driftsättningsmiljöer
- Implementera säkra metoder för konfigurationshantering
- Felsöka konfigurationsrelaterade problem
- Anpassa azd:s beteende för specifika organisatoriska krav

Denna omfattande guide täcker alla aspekter av att konfigurera Azure Developer CLI för optimala utvecklings- och driftsättningsarbetsflöden.

## Konfigurationshierarki

azd använder ett hierarkiskt konfigurationssystem:
1. **Kommandoradsflaggor** (högst prioritet)
2. **Miljövariabler**
3. **Lokal projektkonfiguration** (`.azd/config.json`)
4. **Global användarkonfiguration** (`~/.azd/config.json`)
5. **Standardvärden** (lägst prioritet)

## Global konfiguration

### Ange globala standardvärden
```bash
# Ställ in standardprenumeration
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Ställ in standardplats
azd config set defaults.location "eastus2"

# Ställ in standard för namngivning av resursgrupp
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Visa all global konfiguration
azd config list

# Ta bort en konfiguration
azd config unset defaults.location
```

### Vanliga globala inställningar
```bash
# Utvecklingsinställningar
azd config set alpha.enable true                    # Aktivera alfafunktioner
azd config set telemetry.enabled false             # Inaktivera telemetri
azd config set output.format json                  # Ange utdataformat

# Säkerhetsinställningar
azd config set auth.useAzureCliCredential true     # Använd Azure CLI för autentisering
azd config set tls.insecure false                  # Kräv TLS-verifiering

# Prestandaoptimering
azd config set provision.parallelism 5             # Parallell skapande av resurser
azd config set deploy.timeout 30m                  # Tidsgräns för distribution
```

## 🏗️ Projektkonfiguration

### Struktur för azure.yaml
Filen `azure.yaml` är kärnan i ditt azd-projekt:

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

### Tjänstkonfigurationsalternativ

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

#### Språkspecifika inställningar
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

### Skapa miljöer
```bash
# Skapa en ny miljö
azd env new development

# Skapa med angiven plats
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
# API_KEY=secret-api-key
# DEBUG=true

# Ta bort miljövariabel
azd env unset DEBUG

# Verifiera borttagning
azd env get-values | grep DEBUG
# (ska inte returnera något)
```

### Miljömallar
Skapa `.azure/env.template` för en konsekvent miljöuppsättning:
```bash
# Obligatoriska variabler
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

### Integrering med Azure CLI
```bash
# Använd Azure CLI-inloggningsuppgifter (standard)
azd config set auth.useAzureCliCredential true

# Logga in med en specifik hyresgäst
az login --tenant <tenant-id>

# Ställ in standardprenumeration
az account set --subscription <subscription-id>
```

### Service Principal-autentisering
För CI/CD-pipelines:
```bash
# Sätt miljövariabler
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Eller konfigurera direkt
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Hanterad identitet
För miljöer som körs i Azure:
```bash
# Aktivera autentisering med hanterad identitet
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastrukturkonfiguration

### Bicep-parametrar
Konfigurera infrastruktursparametrar i `infra/main.parameters.json`:
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

## 🚀 Driftsättningskonfiguration

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

## 🔧 Avancerad konfiguration

### Anpassad resursnamngivning
```bash
# Ange namngivningskonventioner
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

## 🎯 Miljöspecifika konfigurationer

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
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Produktionsmiljö
```bash
# .azure/produktion/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigurationsvalidering

### Validera konfiguration
```bash
# Kontrollera konfigurationssyntaxen
azd config validate

# Testa miljövariablerna
azd env get-values

# Validera infrastrukturen
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

# Validera syntaxen i azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
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

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organisera konfigurationsfiler
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

### 3. Överväganden för versionskontroll
```bash
# .gitignore
.azure/*/config.json         # Miljökonfigurationer (innehåller resurs-ID:er)
.azure/*/.env               # Miljövariabler (kan innehålla hemligheter)
.env                        # Lokal miljöfil
```

### 4. Konfigurationsdokumentation
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

## 🎯 Praktiska övningsuppgifter

### Övning 1: Multimiljökonfiguration (15 minuter)

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
- [ ] `azd env list` visar alla tre miljöerna

### Övning 2: Hantering av hemligheter (10 minuter)

**Mål**: Öva säker konfiguration med känsliga data

```bash
# Ställ in hemligheter (visas inte i utdata)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Ställ in icke-hemlig konfiguration
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Visa miljö (hemligheter bör döljas)
azd env get-values

# Verifiera att hemligheterna är lagrade
azd env get DB_PASSWORD  # Bör visa det faktiska värdet
```

**Framgångskriterier:**
- [ ] Hemligheter lagrade utan att visas i terminalen
- [ ] `azd env get-values` visar maskerade hemligheter
- [ ] Enskild `azd env get <SECRET_NAME>` hämtar det faktiska värdet

## Nästa steg

- [Ditt första projekt](first-project.md) - Använd konfigurationen i praktiken
- [Distribueringsguide](../chapter-04-infrastructure/deployment-guide.md) - Använd konfigurationen för driftsättning
- [Provisionering av resurser](../chapter-04-infrastructure/provisioning.md) - Produktionsberedda konfigurationer

## Referenser

- [azd konfigurationsreferens](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Miljövariabler](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Kapitelnavigering:**
- **📚 Kursens startsida**: [AZD för nybörjare](../../README.md)
- **📖 Aktuellt kapitel**: Kapitel 3 - Konfiguration och autentisering
- **⬅️ Föregående**: [Ditt första projekt](first-project.md)
- **➡️ Nästa kapitel**: [Kapitel 4: Infrastruktur som kod](../chapter-04-infrastructure/deployment-guide.md)
- **Nästa lektion**: [Ditt första projekt](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter korrekthet, vänligen observera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess ursprungsspråk ska betraktas som den auktoritativa källan. För viktig information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->