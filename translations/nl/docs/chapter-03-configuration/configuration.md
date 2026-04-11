# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Deze uitgebreide gids behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkel- en deploy-workflows. Je leert over de configuratiehiërarchie, omgevingbeheer, authenticatiemethoden en geavanceerde configuratiepatronen die efficiënte en veilige Azure-deployments mogelijk maken.

## Learning Goals

Aan het einde van deze les zul je:
- De azd-configuratiehiërarchie beheersen en begrijpen hoe instellingen worden geprioriteerd
- Globale en projectspecifieke instellingen effectief configureren
- Meerdere omgevingen met verschillende configuraties beheren
- Veilige authenticatie- en autorisatiemethoden implementeren
- Geavanceerde configuratiepatronen voor complexe scenario's begrijpen

## Learning Outcomes

Na het voltooien van deze les zul je in staat zijn om:
- azd te configureren voor optimale ontwikkelworkflows
- Meerdere deploymentomgevingen op te zetten en te beheren
- Veilige configuratiemanagementpraktijken te implementeren
- Problemen gerelateerd aan configuratie op te lossen
- Het gedrag van azd aan te passen aan specifieke organisatorische vereisten

Deze uitgebreide gids behandelt alle aspecten van het configureren van Azure Developer CLI voor optimale ontwikkel- en deploy-workflows.

## Understanding AI Agents in an azd Project

Als je nieuw bent met AI-agenten, is hier een eenvoudige manier om erover na te denken binnen de azd-wereld.

### What Is an Agent?

Een agent is een stuk software dat een verzoek kan ontvangen, erover kan redeneren en acties kan ondernemen—vaak door een AI-model aan te roepen, gegevens op te zoeken of andere services aan te roepen. In een azd-project is een agent gewoon een andere **service** naast je webfrontend of API-backend.

### How Agents Fit Into the azd Project Structure

Een azd-project bestaat uit drie lagen: **infrastructure**, **code**, en **configuration**. Agenten sluiten op dezelfde manier op deze lagen aan als elke andere service:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions a web app and database | Provisions an AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Contains your frontend and API source code | Contains your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | Lists your services and their hosting targets | Lists your agent as a service, pointing to its code and host |

### The Role of `azure.yaml`

Je hoeft de syntax nu niet te onthouden. Conceptueel is `azure.yaml` het bestand waarin je azd vertelt: *"Hier zijn de services die mijn applicatie vormen, en hier kun je hun code vinden."*

Wanneer je project een AI-agent bevat, vermeldt `azure.yaml` die agent gewoon als een van de services. azd weet dan welke infrastructuur geprovisioned moet worden (zoals een Microsoft Foundry Models endpoint of een Container App om de agent te hosten) en deployed je agentcode—precies zoals het dat voor een webapp of API zou doen.

Dit betekent dat er niets fundamenteel nieuws te leren is. Als je begrijpt hoe azd een webservice beheert, begrijp je al hoe het een agent beheert.

## Configuration Hierarchy

azd gebruikt een hiërarchisch configuratiesysteem:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## Global Configuration

### Setting Global Defaults
```bash
# Stel standaardabonnement in
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Stel standaardlocatie in
azd config set defaults.location "eastus2"

# Stel standaardnaamgevingsconventie voor resourcegroepen in
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Bekijk alle globale configuraties
azd config show

# Verwijder een configuratie
azd config unset defaults.location
```

### Common Global Settings
```bash
# Ontwikkelingsvoorkeuren
azd config set alpha.enable true                    # Schakel alpha-functies in
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
The `azure.yaml` file is the heart of your azd project:

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

# Maak op een specifieke locatie
azd env new staging --location "westus2"

# Maak vanuit een sjabloon
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
Each environment has its own configuration in `.azure/<env-name>/config.json`:

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
Create `.azure/env.template` for consistent environment setup:
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

# Inloggen met specifieke tenant
az login --tenant <tenant-id>

# Stel standaardabonnement in
az account set --subscription <subscription-id>
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Stel omgevingsvariabelen in
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Of configureer rechtstreeks
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
For Azure-hosted environments:
```bash
# Schakel authenticatie met beheerde identiteit in
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
Configure infrastructure parameters in `infra/main.parameters.json`:
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
For Terraform projects, configure in `infra/terraform.tfvars`:
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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

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
# Controleer de configuratiesyntaxis
azd config validate

# Test de omgevingsvariabelen
azd env get-values

# Valideer de infrastructuur
azd provision --dry-run
```

### Configuration Scripts
Create validation scripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Controleer vereiste omgevingsvariabelen
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Valideer syntaxis van azure.yaml
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
Document your configuration in `CONFIG.md`:
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

**Goal**: Create and configure three environments with different settings

```bash
# Maak ontwikkelomgeving aan
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Maak stagingomgeving aan
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Maak productieomgeving aan
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
- [ ] Three environments created successfully
- [ ] Each environment has unique configuration
- [ ] Can switch between environments without errors
- [ ] `azd env list` shows all three environments

### Exercise 2: Secret Management (10 minutes)

**Goal**: Practice secure configuration with sensitive data

```bash
# Stel geheimen in (niet weergegeven in uitvoer)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Stel niet-geheime configuratie in
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Bekijk omgeving (geheimen moeten worden afgeschermd)
azd env get-values

# Controleer of geheimen zijn opgeslagen
azd env get DB_PASSWORD  # Moet de werkelijke waarde tonen
```

**Success Criteria:**
- [ ] Secrets stored without displaying in terminal
- [ ] `azd env get-values` shows redacted secrets
- [ ] Individual `azd env get <SECRET_NAME>` retrieves actual value

## Next Steps

- [Your First Project](first-project.md) - Apply configuration in practice
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Use configuration for deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Production-ready configurations

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat automatische vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->