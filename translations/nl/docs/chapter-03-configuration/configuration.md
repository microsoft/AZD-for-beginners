# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD voor Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Previous**: [Je eerste project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Hoofdstuk 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Deze uitgebreide gids behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkelings- en implementatieworkflows. Je leert over de configuratie-hiërarchie, omgevingsbeheer, authenticatiemethoden en geavanceerde configuratiepatronen die efficiënte en veilige Azure-implementaties mogelijk maken.

## Learning Goals

Aan het einde van deze les zul je:
- Meesterschap over de azd-configuratie-hiërarchie en begrijpen hoe instellingen worden geprioriteerd
- Globale en projectspecifieke instellingen effectief configureren
- Meerdere omgevingen met verschillende configuraties beheren
- Veilige authenticatie- en autorisatiepatronen implementeren
- Geavanceerde configuratiepatronen voor complexe scenario's begrijpen

## Learning Outcomes

Na het voltooien van deze les kun je:
- azd configureren voor optimale ontwikkelworkflows
- Meerdere implementatieomgevingen opzetten en beheren
- Veilige configuratiemanagementpraktijken implementeren
- Problemen met configuratie oplossen
- Het gedrag van azd aanpassen voor specifieke organisatorische vereisten

Deze uitgebreide gids behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkelings- en implementatieworkflows.

## Configuration Hierarchy

azd gebruikt een hiërarchisch configuratiesysteem:
1. **Command-line flags** (hoogste prioriteit)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (laagste prioriteit)

## Global Configuration

### Setting Global Defaults
```bash
# Stel standaard abonnement in
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Stel standaard locatie in
azd config set defaults.location "eastus2"

# Stel standaard naamgevingsconventie voor resourcegroepen in
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Bekijk alle globale configuratie
azd config list

# Verwijder een configuratie
azd config unset defaults.location
```

### Common Global Settings
```bash
# Ontwikkelingsvoorkeuren
azd config set alpha.enable true                    # Schakel alfa-functies in
azd config set telemetry.enabled false             # Schakel telemetrie uit
azd config set output.format json                  # Stel uitvoerformaat in

# Beveiligingsinstellingen
azd config set auth.useAzureCliCredential true     # Gebruik Azure CLI voor authenticatie
azd config set tls.insecure false                  # Dwing TLS-verificatie af

# Prestatieoptimalisatie
azd config set provision.parallelism 5             # Parallelle resourcecreatie
azd config set deploy.timeout 30m                  # Time-out voor implementatie
```

## 🏗️ Project Configuration

### azure.yaml Structure
Het `azure.yaml`-bestand is het hart van je azd-project:

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

### Service Configuration Options

#### Host Types
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

#### Language-Specific Settings
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

## 🌟 Environment Management

### Creating Environments
```bash
# Maak een nieuwe omgeving
azd env new development

# Maak met een specifieke locatie
azd env new staging --location "westus2"

# Maak vanuit een sjabloon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
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

### Environment Variables
```bash
# Stel omgevingsspecifieke variabelen in
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Bekijk omgevingsvariabelen
azd env get-values

# Verwachte uitvoer:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Verwijder omgevingsvariabele
azd env unset DEBUG

# Controleer verwijdering
azd env get-values | grep DEBUG
# (moet niets teruggeven)
```

### Environment Templates
Maak `.azure/env.template` aan voor consistente omgevingsinstellingen:
```bash
# Vereiste variabelen
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Applicatie-instellingen
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optionele ontwikkelinstellingen
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Gebruik Azure CLI-referenties (standaard)
azd config set auth.useAzureCliCredential true

# Aanmelden bij een specifieke tenant
az login --tenant <tenant-id>

# Stel standaardabonnement in
az account set --subscription <subscription-id>
```

### Service Principal Authentication
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
Voor in Azure gehoste omgevingen:
```bash
# Schakel authenticatie met beheerde identiteit in
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

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

### Terraform Configuration
Voor Terraform-projecten, configureer in `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
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

### Docker Configuration
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

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# Stel naamgevingsconventies in
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/ontwikkeling/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/productie/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# Controleer configuratiesyntaxis
azd config validate

# Test omgevingsvariabelen
azd env get-values

# Valideer infrastructuur
azd provision --dry-run
```

### Configuration Scripts
Maak validatiescripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Controleer de vereiste omgevingsvariabelen
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valideer de syntaxis van azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Use Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
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

### 3. Version Control Considerations
```bash
# .gitignore
.azure/*/config.json         # Omgevingsconfiguraties (bevatten resource-ID's)
.azure/*/.env               # Omgevingsvariabelen (kunnen geheimen bevatten)
.env                        # Lokaal omgevingsbestand
```

### 4. Configuration Documentation
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

## 🎯 Hands-On Practice Exercises

### Exercise 1: Multi-Environment Configuration (15 minutes)

**Goal**: Maak en configureer drie omgevingen met verschillende instellingen

```bash
# Maak de ontwikkelomgeving aan
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Maak de staging-omgeving aan
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Maak de productieomgeving aan
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Controleer elke omgeving
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Drie omgevingen succesvol aangemaakt
- [ ] Elke omgeving heeft een unieke configuratie
- [ ] Kan schakelen tussen omgevingen zonder fouten
- [ ] `azd env list` toont alle drie de omgevingen

### Exercise 2: Secret Management (10 minutes)

**Goal**: Oefen met veilige configuratie van gevoelige gegevens

```bash
# Stel geheimen in (niet weergegeven in uitvoer)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Stel niet-geheime configuratie in
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Bekijk omgeving (geheimen moeten worden weggelaten)
azd env get-values

# Controleer of geheimen zijn opgeslagen
azd env get DB_PASSWORD  # Moet de werkelijke waarde tonen
```

**Success Criteria:**
- [ ] Geheimen opgeslagen zonder weergave in de terminal
- [ ] `azd env get-values` toont geredigeerde geheimen
- [ ] Individuele `azd env get <SECRET_NAME>` haalt de daadwerkelijke waarde op

## Next Steps

- [Je eerste project](first-project.md) - Pas configuratie in de praktijk toe
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Gebruik configuratie voor implementatie
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Productieklaar configuraties

## References

- [azd Configuratiereferentie](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml-schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Omgevingsvariabelen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD voor Beginners](../../README.md)
- **📖 Current Chapter**: Hoofdstuk 3 - Configuratie & Authenticatie
- **⬅️ Previous**: [Je eerste project](first-project.md)
- **➡️ Next Chapter**: [Hoofdstuk 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Je eerste project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we naar nauwkeurigheid streven, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onjuistheden kunnen bevatten. Het oorspronkelijke document in de oorspronkelijke taal dient als de gezaghebbende bron te worden beschouwd. Voor belangrijke of cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->