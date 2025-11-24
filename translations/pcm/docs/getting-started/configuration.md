<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8399160e4ce8c3eb6fd5d831f6602e18",
  "translation_date": "2025-11-24T13:53:05+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "pcm"
}
-->
# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../deployment/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../deployment/deployment-guide.md)

## Introduction

Dis guide go teach you how to configure Azure Developer CLI well for better development and deployment workflows. You go sabi di configuration hierarchy, how to manage environment, authentication methods, and advanced configuration patterns wey go make Azure deployment easy and secure.

## Learning Goals

By di end of dis lesson, you go:
- Sabi di azd configuration hierarchy and how settings dey work
- Configure global and project-specific settings well
- Manage plenty environments wey get different configurations
- Use secure authentication and authorization patterns
- Understand advanced configuration patterns for complex setups

## Learning Outcomes

After you finish dis lesson, you go fit:
- Configure azd for better development workflows
- Set up and manage plenty deployment environments
- Use secure configuration management practices
- Solve configuration wahala
- Customize azd behavior for your organization needs

Dis guide go show you everything about configuring Azure Developer CLI for better development and deployment workflows.

## Configuration Hierarchy

azd dey use one hierarchical configuration system:
1. **Command-line flags** (na di highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (na di lowest priority)

## Global Configuration

### Setting Global Defaults
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### Common Global Settings
```bash
# Development choice dem
azd config set alpha.enable true                    # Make alpha feature dem work
azd config set telemetry.enabled false             # Turn off telemetry
azd config set output.format json                  # Choose output format

# Security setting dem
azd config set auth.useAzureCliCredential true     # Use Azure CLI for authentication
azd config set tls.insecure false                  # Make sure TLS dey verify

# Performance adjustment
azd config set provision.parallelism 5             # Create resource dem at once
azd config set deploy.timeout 30m                  # Deployment time limit
```

## 🏗️ Project Configuration

### azure.yaml Structure
Di `azure.yaml` file na di main file for your azd project:

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
# Make new environment
azd env new development

# Make am for specific location
azd env new staging --location "westus2"

# Make am from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
Each environment get im own configuration for `.azure/<env-name>/config.json`:

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
# Set variables wey dey for environment
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# See variables wey dey for environment
azd env get-values

# Wetin we dey expect:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Comot variable wey dey for environment
azd env unset DEBUG

# Check say e don comot
azd env get-values | grep DEBUG
# (e suppose no return anything)
```

### Environment Templates
Create `.azure/env.template` to make environment setup easy:
```bash
# Variables wey we need
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Settings for di app
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Settings wey no dey compulsory for development
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login wit specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
For Azure-hosted environments:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
Set infrastructure parameters for `infra/main.parameters.json`:
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
For Terraform projects, set am for `infra/terraform.tfvars`:
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
# Set name wey dem go dey use
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

## 🔍 Configuration Validation

### Validate Configuration
```bash
# Check how config dey correct
azd config validate

# Test environment variables dem
azd env get-values

# Make sure infrastructure dey okay
azd provision --dry-run
```

### Configuration Scripts
Create validation scripts for `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check di environment variables wey dem need
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Make sure say azure.yaml syntax correct
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
.azure/*/config.json         # Environment configs (e get resource IDs)
.azure/*/.env               # Environment variables (fit get secrets)
.env                        # Local environment file
```

### 4. Configuration Documentation
Document your configuration for `CONFIG.md`:
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

**Goal**: Create and configure three environments wey get different settings

```bash
# Make development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Make staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Make production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Check each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Three environments dey created well
- [ ] Each environment get im own configuration
- [ ] You fit switch between environments without wahala
- [ ] `azd env list` dey show all three environments

### Exercise 2: Secret Management (10 minutes)

**Goal**: Practice secure configuration with sensitive data

```bash
# Set secrets (e no go show for output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Set config wey no be secret
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Check environment (secrets suppose dey hide)
azd env get-values

# Make sure say secrets dey store
azd env get DB_PASSWORD  # E suppose show real value
```

**Success Criteria:**
- [ ] Secrets dey stored without showing for terminal
- [ ] `azd env get-values` dey show redacted secrets
- [ ] Individual `azd env get <SECRET_NAME>` dey retrieve di real value

## Next Steps

- [Your First Project](first-project.md) - Use configuration for practice
- [Deployment Guide](../deployment/deployment-guide.md) - Use configuration for deployment
- [Provisioning Resources](../deployment/provisioning.md) - Production-ready configurations

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../deployment/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dis dokyument don use AI transle-shun service [Co-op Translator](https://github.com/Azure/co-op-translator) do di transle-shun. Even as we dey try make am correct, abeg make you sabi say machine transle-shun fit get mistake or no dey accurate well. Di original dokyument wey dey for im native language na di one wey you go take as di correct source. For important mata, e good make you use professional human transle-shun. We no go fit take blame for any misunderstanding or wrong interpretation wey fit happen because you use dis transle-shun.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->