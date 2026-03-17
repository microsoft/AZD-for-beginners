# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

Dis complete guide dey cover everything wey concern how to configure Azure Developer CLI make development and deployment workflow beta. You go learn about configuration hierarchy, how to manage environments, different authentication methods, and advanced configuration patterns wey go help make your Azure deployments secure and efficient.

## Learning Goals

By the end of this lesson, you go:
- Understand how azd configuration hierarchy dey work and how settings dey get priority
- Configure global and project-specific settings well
- Manage plenty environments wey get different configurations
- Implement secure authentication and authorization patterns
- Understand advanced configuration patterns for complex cases

## Learning Outcomes

After you finish this lesson, you go fit:
- Configure azd for better development workflows
- Set up and manage many deployment environments
- Implement secure configuration management practices
- Troubleshoot configuration-related wahala
- Customize azd behavior for specific organization requirements

Dis complete guide dey cover everything wey concern how to configure Azure Developer CLI make development and deployment workflow beta.

## Understanding AI Agents in an azd Project

If you never sabi AI agents, na simple way be this to think about dem inside azd world.

### What Is an Agent?

Agent na software wey fit receive request, reason about am, and take actions—most times by calling AI model, dey check data, or dey invoke other services. For azd project, agent na just another **service** beside your web frontend or API backend.

### How Agents Fit Into the azd Project Structure

An azd project get three layers: **infrastructure**, **code**, and **configuration**. Agents dey plug into these layers the same way any other service dey:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions a web app and database | Provisions an AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Contains your frontend and API source code | Contains your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | Lists your services and their hosting targets | Lists your agent as a service, pointing to its code and host |

### The Role of `azure.yaml`

You no need to memorize the syntax now. Conceptually, `azure.yaml` na the file wey you dey tell azd: *"Here are the services that make up my application, and here's where to find their code."*

When your project get AI agent, `azure.yaml` go just list that agent as one of the services. azd go then sabi to provision the correct infrastructure (like Microsoft Foundry Models endpoint or a Container App wey go host the agent) and deploy your agent code—same way e go take do for web app or API.

This one mean say nothing serious new dey to learn. If you sabi how azd dey manage web service, you don sabi how e go manage agent.

## Configuration Hierarchy

azd dey use hierarchical configuration system:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## Global Configuration

### Setting Global Defaults
```bash
# Make di subscription default
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Make di location default
azd config set defaults.location "eastus2"

# Set di default way wey we go dey name resource groups
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# See all global configuration
azd config list

# Comot one configuration
azd config unset defaults.location
```

### Common Global Settings
```bash
# Wetin we prefer for development
azd config set alpha.enable true                    # Make alpha features dey on
azd config set telemetry.enabled false             # Make telemetry off
azd config set output.format json                  # Set how output go be

# Settings wey concern security
azd config set auth.useAzureCliCredential true     # Use Azure CLI do auth
azd config set tls.insecure false                  # Make TLS verification na must

# Tweak performance make e beta
azd config set provision.parallelism 5             # Create resources at the same time
azd config set deploy.timeout 30m                  # How long deployment go wait before e timeout
```

## 🏗️ Project Configuration

### azure.yaml Structure
The `azure.yaml` file na the heart of your azd project:

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

# Make for specific location
azd env new staging --location "westus2"

# Make from template
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
# Set variables wey dey for each environment
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# See di environment variables
azd env get-values

# Wetin suppose show:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Comot di environment variable
azd env unset DEBUG

# Check say e don comot
azd env get-values | grep DEBUG
# (e no suppose return anything)
```

### Environment Templates
Create `.azure/env.template` make environment setup dey consistent:
```bash
# Variables wey dem need
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Settings wey dey for app
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Settings wey you fit use for development
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Use Azure CLI credentials (na di default)
azd config set auth.useAzureCliCredential true

# Login wit di specific tenant
az login --tenant <tenant-id>

# Set di default subscription
az account set --subscription <subscription-id>
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Set di environment variables
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

## 🏗️ Infrastructure Configuration

### Bicep Parameters
Configure infrastructure parameters for `infra/main.parameters.json`:
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
For Terraform projects, configure for `infra/terraform.tfvars`:
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
# Make rules for how we go dey name tins
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
# Make sure di configuration syntax correct
azd config validate

# Test di environment variables
azd env get-values

# Make sure di infrastructure correct
azd provision --dry-run
```

### Configuration Scripts
Create validation scripts for `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Make sure say di required environment variables dey
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
.azure/*/config.json         # Environment configs (dem get resource IDs)
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

**Goal**: Create and configure three environments with different settings

```bash
# Make di development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Make di staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Make di production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Make sure sey every environment dey okay
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Three environments created successfully
- [ ] Each environment get im own unique configuration
- [ ] Fit switch between environments without error
- [ ] `azd env list` go show all three environments

### Exercise 2: Secret Management (10 minutes)

**Goal**: Practice secure configuration with sensitive data

```bash
# Set secrets (no go show for output)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Set config wey no be secret
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# See environment (secrets suppose dey hidden)
azd env get-values

# Confirm say secrets don store
azd env get DB_PASSWORD  # E suppose show the real value
```

**Success Criteria:**
- [ ] Secrets store without showing for terminal
- [ ] `azd env get-values` go show redacted secrets
- [ ] Individual `azd env get <SECRET_NAME>` go return actual value

## Next Steps

- [Your First Project](first-project.md) - Apply configuration for practice
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
Disclaimer:
Dis document don translate wit AI translation service Co-op Translator (https://github.com/Azure/co-op-translator). Even though we dey try make am correct, abeg note say automatic translations fit get mistakes or inaccuracies. Di original document for im own language suppose dey considered as di authoritative source. If na important information, better make person wey sabi do professional human translation handle am. We no go responsible for any misunderstanding or misinterpretation wey fit come from using dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->