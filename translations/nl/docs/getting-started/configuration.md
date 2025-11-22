<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-21T16:50:40+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "nl"
}
-->
# Configuratiegids

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Vorige**: [Je Eerste Project](first-project.md)
- **➡️ Volgende**: [Implementatiegids](../deployment/deployment-guide.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 4: Infrastructure as Code](../deployment/deployment-guide.md)

## Introductie

Deze uitgebreide gids behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkel- en implementatieworkflows. Je leert over de configuratiehiërarchie, omgevingsbeheer, authenticatiemethoden en geavanceerde configuratiepatronen die efficiënte en veilige Azure-implementaties mogelijk maken.

## Leerdoelen

Aan het einde van deze les kun je:
- De azd-configuratiehiërarchie beheersen en begrijpen hoe instellingen worden geprioriteerd
- Globale en project-specifieke instellingen effectief configureren
- Meerdere omgevingen beheren met verschillende configuraties
- Veilige authenticatie- en autorisatiepatronen implementeren
- Geavanceerde configuratiepatronen begrijpen voor complexe scenario's

## Leerresultaten

Na het voltooien van deze les kun je:
- azd configureren voor optimale ontwikkelworkflows
- Meerdere implementatieomgevingen instellen en beheren
- Veilige configuratiebeheerpraktijken implementeren
- Problemen met configuratie oplossen
- azd aanpassen aan specifieke organisatorische vereisten

Deze uitgebreide gids behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkel- en implementatieworkflows.

## Configuratiehiërarchie

azd gebruikt een hiërarchisch configuratiesysteem:
1. **Command-line flags** (hoogste prioriteit)
2. **Omgevingsvariabelen**
3. **Lokale projectconfiguratie** (`.azd/config.json`)
4. **Globale gebruikersconfiguratie** (`~/.azd/config.json`)
5. **Standaardwaarden** (laagste prioriteit)

## Globale Configuratie

### Globale Standaarden Instellen
```bash
# Stel standaardabonnement in
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Stel standaardlocatie in
azd config set defaults.location "eastus2"

# Stel standaardnaamgevingsconventie voor resourcegroep in
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Bekijk alle globale configuratie
azd config list

# Verwijder een configuratie
azd config unset defaults.location
```

### Veelvoorkomende Globale Instellingen
```bash
# Voorkeuren voor ontwikkeling
azd config set alpha.enable true                    # Alpha-functies inschakelen
azd config set telemetry.enabled false             # Telemetrie uitschakelen
azd config set output.format json                  # Uitvoerformaat instellen

# Beveiligingsinstellingen
azd config set auth.useAzureCliCredential true     # Gebruik Azure CLI voor authenticatie
azd config set tls.insecure false                  # TLS-verificatie afdwingen

# Prestatieoptimalisatie
azd config set provision.parallelism 5             # Parallelle resourcecreatie
azd config set deploy.timeout 30m                  # Implementatietime-out
```

## 🏗️ Projectconfiguratie

### azure.yaml Structuur
Het `azure.yaml` bestand is het hart van je azd-project:

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

#### Taal-specifieke Instellingen
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

## 🌟 Omgevingsbeheer

### Omgevingen Aanmaken
```bash
# Maak een nieuwe omgeving
azd env new development

# Maak met specifieke locatie
azd env new staging --location "westus2"

# Maak vanuit sjabloon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Omgevingsconfiguratie
Elke omgeving heeft zijn eigen configuratie in `.azure/<env-name>/config.json`:

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
```bash
# Stel omgevingsspecifieke variabelen in
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Bekijk omgevingsvariabelen
azd env get-values

# Verwachte output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=geheime-api-sleutel
# DEBUG=true

# Verwijder omgevingsvariabele
azd env unset DEBUG

# Verifieer verwijdering
azd env get-values | grep DEBUG
# (zou niets moeten retourneren)
```

### Omgeving Templates
Maak `.azure/env.template` voor consistente omgeving setup:
```bash
# Vereiste variabelen
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Applicatie-instellingen
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optionele ontwikkelingsinstellingen
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authenticatieconfiguratie

### Azure CLI Integratie
```bash
# Gebruik Azure CLI-referenties (standaard)
azd config set auth.useAzureCliCredential true

# Inloggen met specifieke tenant
az login --tenant <tenant-id>

# Standaardabonnement instellen
az account set --subscription <subscription-id>
```

### Service Principal Authenticatie
Voor CI/CD-pijplijnen:
```bash
# Stel omgevingsvariabelen in
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Of configureer direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Voor Azure-gehoste omgevingen:
```bash
# Inschakelen van beheerde identiteit authenticatie
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructuurconfiguratie

### Bicep Parameters
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

### Terraform Configuratie
Voor Terraform-projecten, configureer in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Implementatieconfiguratie

### Build Configuratie
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

### Docker Configuratie
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
Voorbeeld `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Geavanceerde Configuratie

### Aangepaste Resourcebenamingen
```bash
# Stel naamgevingsconventies in
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Netwerkconfiguratie
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuratie
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

## 🎯 Omgeving-specifieke Configuraties

### Ontwikkelomgeving
```bash
# .azure/ontwikkeling/.env
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
# .azure/productie/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuratievalidatie

### Configuratie Valideren
```bash
# Controleer configuratiesyntaxis
azd config validate

# Test omgevingsvariabelen
azd env get-values

# Valideer infrastructuur
azd provision --dry-run
```

### Configuratiescripts
Maak validatiescripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Controleer vereiste omgevingsvariabelen
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valideer azure.yaml-syntaxis
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Gebruik Omgevingsvariabelen
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organiseer Configuratiebestanden
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

### 3. Versiebeheer Overwegingen
```bash
# .gitignore
.azure/*/config.json         # Omgevingsconfiguraties (bevatten resource-ID's)
.azure/*/.env               # Omgevingsvariabelen (kunnen geheimen bevatten)
.env                        # Lokaal omgevingsbestand
```

### 4. Configuratiedocumentatie
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

### Oefening 1: Multi-Omgevingsconfiguratie (15 minuten)

**Doel**: Maak en configureer drie omgevingen met verschillende instellingen

```bash
# Maak ontwikkelomgeving
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Maak stagingomgeving
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Maak productieomgeving
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verifieer elke omgeving
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Succescriteria:**
- [ ] Drie omgevingen succesvol aangemaakt
- [ ] Elke omgeving heeft unieke configuratie
- [ ] Kan zonder fouten tussen omgevingen schakelen
- [ ] `azd env list` toont alle drie omgevingen

### Oefening 2: Geheimenbeheer (10 minuten)

**Doel**: Oefen veilige configuratie met gevoelige gegevens

```bash
# Geheimen instellen (niet weergegeven in output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Niet-geheime configuratie instellen
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Omgeving bekijken (geheimen moeten worden verborgen)
azd env get-values

# Verifiëren dat geheimen zijn opgeslagen
azd env get DB_PASSWORD  # Moet de werkelijke waarde tonen
```

**Succescriteria:**
- [ ] Geheimen opgeslagen zonder weergave in terminal
- [ ] `azd env get-values` toont afgeschermde geheimen
- [ ] Individuele `azd env get <SECRET_NAME>` haalt de werkelijke waarde op

## Volgende Stappen

- [Je Eerste Project](first-project.md) - Pas configuratie in de praktijk toe
- [Implementatiegids](../deployment/deployment-guide.md) - Gebruik configuratie voor implementatie
- [Resources Voorzien](../deployment/provisioning.md) - Productieklare configuraties

## Referenties

- [azd Configuratiereferentie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Omgevingsvariabelen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Hoofdstuk Navigatie:**
- **📚 Cursus Home**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Vorige**: [Je Eerste Project](first-project.md)
- **➡️ Volgend Hoofdstuk**: [Hoofdstuk 4: Infrastructure as Code](../deployment/deployment-guide.md)
- **Volgende Les**: [Je Eerste Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->