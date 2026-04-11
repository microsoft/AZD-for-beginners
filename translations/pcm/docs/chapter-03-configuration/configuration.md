# Konfigureshon Gaid

**Chapta Navigation:**
- **📚 Kọs Hom**: [AZD For Beginners](../../README.md)
- **📖 Chapta wey dey now**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapta**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introdakshon

Dis full guide dey cover everytin wey concern konfigureshon for Azure Developer CLI make development and deployment waka well. You go learn about konfigureshon hierarchy, how to manage environments, authentication methods, and advanced konfigureshon patterns wey go help make Azure deployments secure and sharp.

## Wetin You Go Learn

By di end of dis lesson, you go:
- Sabi di azd konfigureshon hierarchy and how settings dey priority
- Konfigura global and project-specific settings well
- Manage many environments wey get different konfigureshons
- Implement secure authentication and authorization patterns
- Understand advanced konfigureshon patterns for complex mata

## Wetin You Go Fit Do (Learning Outcomes)

After you finish dis lesson, you go fit:
- Konfigura azd for beta development workflows
- Setup and manage many deployment environments
- Implement secure konfigureshon management practices
- Troubleshoot konfigureshon-related wahala
- Customize azd behavior for specific organizational requirements

Dis full guide dey cover everytin wey concern konfigureshon for Azure Developer CLI make development and deployment waka well.

## Understanding AI Agents in an azd Project

If you new to AI agents, dis na simple way to reason about dem for azd world.

### Wetin Agent Mean?

Agent na software wey fit receive request, reason about am, and take action—often by calling AI model, look up data, or call other services. For azd project, agent na just another **service** side-by-side with your web frontend or API backend.

### How Agents Dey Fit Inside azd Project Structure

An azd project get three layers: **infrastructure**, **code**, and **configuration**. Agents dey plug into these layers same way any other service dey:

| Layer | Wetin E Dey Do for Normal App | Wetin E Dey Do for Agent |
|-------|--------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | E go provision web app and database | E go provision AI model endpoint, search index, or agent host |
| **Code** (`src/`) | E get your frontend and API source code | E get your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | E list your services and where dem go host | E list your agent as service, point to im code and host |

### Di Role of `azure.yaml`

You no need to memorize di syntax now. Concept na say `azure.yaml` na di file wey you dey tell azd: *"Na these services dey my application, and na here you go find their code."*

When your project get AI agent, `azure.yaml` go simply list that agent as one service. azd go then sabi to provision di correct infrastructure (like Microsoft Foundry Models endpoint or a Container App to host di agent) and deploy your agent code—same way e go do for web app or API.

This one mean say no new kain tins to learn. If you sabi how azd dey manage web service, you don sabi how e go manage agent.

## Konfigureshon Hierarchy

azd dey use hierarchical konfigureshon system:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## Global Konfigureshon

### Setting Global Defaults
```bash
# Set di default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set di default location
azd config set defaults.location "eastus2"

# Set di default way we dey name resource groups
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# See all di global configuration
azd config show

# Comot wan configuration
azd config unset defaults.location
```

### Common Global Settings
```bash
# Wetin you prefer for development
azd config set alpha.enable true                    # Make alpha features dey on
azd config set telemetry.enabled false             # Make telemetry no dey
azd config set output.format json                  # Choose how output go be

# Settings wey concern security
azd config set auth.useAzureCliCredential true     # Use Azure CLI do auth
azd config set tls.insecure false                  # Make TLS verification compulsory

# Tweaks to make performance better
azd config set provision.parallelism 5             # Create resources at the same time
azd config set deploy.timeout 30m                  # How long deployment go wait
```

## 🏗️ Project Konfigureshon

### azure.yaml Structure
Di `azure.yaml` file na heart of your azd project:

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

### Service Konfigureshon Options

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
# Make one new environment
azd env new development

# Make am for one particular place
azd env new staging --location "westus2"

# Make am from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Konfigureshon
Each environment get im own konfigureshon for `.azure/<env-name>/config.json`:

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
# Set environment-specific variable dem
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# See environment variable dem
azd env get-values

# Wetin suppose show:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Comot environment variable
azd env unset DEBUG

# Make sure say e don comot
azd env get-values | grep DEBUG
# (e no suppose return anything)
```

### Environment Templates
Create `.azure/env.template` make environment setup consistent:
```bash
# Variables wey must dey
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Settings for di app
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Development settings wey optional
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Konfigureshon

### Azure CLI Integration
```bash
# Use Azure CLI login details (na default)
azd config set auth.useAzureCliCredential true

# Login with di specific tenant
az login --tenant <tenant-id>

# Set di default subscription
az account set --subscription <subscription-id>
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Set environment variable dem
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure am direct
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
For Azure-hosted environments:
```bash
# Make managed identity authentication dey on
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Konfigureshon

### Bicep Parameters
Konfigura infrastructure parameters for `infra/main.parameters.json`:
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

### Terraform Konfigureshon
For Terraform projects, konfigura for `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Konfigureshon

### Build Konfigureshon
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

### Docker Konfigureshon
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

## 🔧 Advanced Konfigureshon

### Custom Resource Naming
```bash
# Decide how we go dey name tins
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Konfigureshon
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Konfigureshon
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

## 🎯 Environment-Specific Konfigureshons

### Development Environment
```bash
# .azure/development/.env
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
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Konfigureshon Validation

### Validate Konfigureshon
```bash
# Make sure say configuration syntax dey correct
azd config validate

# Test if environment variables dey correct
azd env get-values

# Confirm say infrastructure dey correct
azd provision --dry-run
```

### Konfigureshon Scripts
Create validation scripts for `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Make sure say di required environment variables dey set
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Make sure say di azure.yaml syntax correct
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

### 2. Organize Konfigureshon Files
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

### 3. Version Control Tin Dem
```bash
# .gitignore
.azure/*/config.json         # Environment configs (dem get resource IDs)
.azure/*/.env               # Environment variables (fit get secrets)
.env                        # Local environment file
```

### 4. Konfigureshon Documentation
Document your konfigureshon for `CONFIG.md`:
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

## 🎯 Practical Exercises

### Exercise 1: Multi-Environment Konfigureshon (15 minutes)

**Goal**: Create and konfigura three environments wey get different settings

```bash
# Mek di development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Mek di staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Mek di production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Mek sure say each environment dey okay
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**How to sabi say you don succeed:**
- [ ] Three environments create finish
- [ ] Each environment get im own konfigureshon
- [ ] Fit switch between environments without error
- [ ] `azd env list` dey show all three environments

### Exercise 2: Secret Management (10 minutes)

**Goal**: Practice secure konfigureshon for sensitive data

```bash
# Put secret dem (no go show for output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Put config wey no be secret
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# See environment (secret dem suppose dey hide)
azd env get-values

# Make sure say secret dem don store
azd env get DB_PASSWORD  # E suppose show the real value
```

**How to sabi say you don succeed:**
- [ ] Secrets store without showing for terminal
- [ ] `azd env get-values` dey show redacted secrets
- [ ] Individual `azd env get <SECRET_NAME>` go bring actual value

## Next Steps

- [Your First Project](first-project.md) - Apply konfigureshon for practice
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Use konfigureshon for deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Production-ready konfigureshons

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapta Navigation:**
- **📚 Kọs Hom**: [AZD For Beginners](../../README.md)
- **📖 Chapta wey dey now**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapta**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even though we dey try make am accurate, abeg note say automatic translations fit get errors or inaccuracies. Di original document for im native language suppose be di authoritative source. For critical information, make una use professional human translation. We no dey liable for any misunderstandings or misinterpretations wey fit come from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->