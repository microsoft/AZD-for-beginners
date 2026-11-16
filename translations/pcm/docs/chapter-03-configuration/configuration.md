# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

> Reviewed against `azd 1.37.2` (November 2026). Bash commands assume an initialized azd project. Unless explicitly described as a complete file, YAML/Bicep snippets are fragments to merge into matching project files, not standalone runnable projects.

Dis kain full guide cover every sisi of configuring Azure Developer CLI for beta development and deployment workflow. You go learn about configuration hierarchy, environment management, authentication methods, plus advanced configuration patterns wey fit make Azure deployments beta and secure.

## Learning Goals

By di finish dis lesson, you go fit:
- Master di azd configuration hierarchy and sabi how settings dey prioritize
- Configure global plus project-specific settings well well
- Manage multiple environments wey get different configurations
- Implement secure authentication plus authorization patterns
- Understand advanced configuration patterns for complex wahala

## Learning Outcomes

After you don finish dis lesson, you go fit:
- Configure azd for beta development workflows
- Set up and manage multiple deployment environments
- Implement secure configuration management practices
- Troubleshoot configuration-related issues
- Customize azd behavior for specific org requirements

Dis kain full guide cover every sisi of configuring Azure Developer CLI for beta development and deployment workflow.

## Understanding AI Agents in an azd Project

If na your first time you hear about AI agents, dis na simple way to think about dem inside di azd world.

### Wetin be Agent?

Agent na software we fit receive request, reason am and take action—sometimes e go call AI model, find data, or call other service dem. For azd project, agent na just another **service** like your web frontend or API backend.

### How Agents Take Fit Inside azd Project Structure

azd project get three layers: **infrastructure**, **code**, and **configuration**. Agents connect for these layers just like any other service:

| Layer | Wetin E Dey Do for Traditional App | Wetin E Dey Do for Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions web app and database | Provisions AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Get your frontend and API source code | Get your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | List your services plus their hosting targets | List your agent as service, point to its code and host |

### Di Role of `azure.yaml`

You no need to memorize syntax now now. Conceptually, `azure.yaml` na file wey you talk to azd: *"Dis na di services wey make up my app, and dis na where to find their code."*

When your project get AI agent, `azure.yaml` just list dat agent as one of di services. Azd go sabi to provision correct infrastructure (like Microsoft Foundry Models endpoint or Container App wey go host agent) and deploy your agent code—just like e go do for web app or API.

This mean say no new wahala to learn. If you sabi how azd dey manage web service, you don sabi how e dey manage agent.

## Configuration Hierarchy

azd get different configuration levels, e no be one universal overlay:
- **Global user preferences**: `~/.azd/config.json`, managed by `azd config`.
- **Project definition**: `azure.yaml` specify services, infrastructure, and hooks.
- **Local environment selection**: `.azure/config.json`.
- **Per-environment values**: `.azure/<name>/.env`, managed by `azd env`; extra settings dey for dat environment's `config.json`.
- **Flags and process variables**: override only di settings wey command/provider support.

Random `azd env set` value no automatically turn to infrastructure parameter or deployed app setting. You must reference am for parameter file, supported service config, or hook.

## Global Configuration

### Setting Global Defaults
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### Common Global Settings
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ Project Configuration

### azure.yaml Structure
Di `azure.yaml` file na heart of your azd project:

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

Na **project-definition example** dis be, no be starter wey dem supply. Make sure say you create di referenced source directories, hook scripts, package scripts, plus matching `infra/main.bicep`/`main.parameters.json` before you run am. Databases dey for infrastructure; `postgres` no be built-in service host. Infrastructure parameters dey for provider parameter file, no be `infra.parameters`.

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

#### Language-Specific Build Hooks

Di following service fragments na hooks example; combine dem with each service real `project` and `host`. `buildCommand` and `startCommand` no be generic azd service properties. Configure startup for app, Dockerfile, or host infrastructure.

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 Environment Management

### Creating Environments
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
Core environment values dey for `.azure/<env-name>/.env`, including `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, and `AZURE_LOCATION`. Use `azd env config get/set` for extra environment JSON settings. Di following JSON na **conceptual app state**, no be azd config schema; no copy am into azd files:

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

**Plaintext demonstration only.** Normal `azd env set` values dey write enter `.azure/<name>/.env` and commands fit print am. No use di example API key as real credential. For secrets, use `azd env set-secret` and explicit runtime wiring.

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### Environment Templates
Create **non-secret, manually maintained** `.env.example` for project root to keep setup consistent. azd no automatically load file wey dem name `env.template`:
```bash
# Required variables
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Application settings
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Optional development settings
DEBUG=false
LOG_LEVEL=info
```

### Sharing Environments Across a Team

When more than one person dey work for project, una need agree on **wetin to put for repo and wetin go stay local**. azd dey keep each environment for `.azure/` folder, but not all of am go gats commit.

**Wetin dey for `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**Wetin to gitignore.** azd default `.gitignore` don already exclude `.azure/`. Make e remain so—`.env` files fit get secrets and resource IDs na for whoever provision dem. Each teammate go create **im own** environment locally:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**How to switch between environments.** Developer wey dey manage many environments go select active one before e run commands:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**How to provide non-secret defaults to team.** Commit `.env.example` outside ignored `.azure/` directory. New teammate go copy am go local ignored file, fill values, and import am explicitly with `azd env set --file <local-file>`. No ever import blank placeholders on top working environment.

**Environments for CI/CD.** Pipelines no go read your local `.azure/` folder. Instead, dem go provide environment values as pipeline variables/secrets, and azd go read am from process environment:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** infrastructure code (`infra/`, `azure.yaml`) na wetin dem share for Git; environment *state and secrets* (`.azure/`) dey per-developer and per-pipeline. `azd pipeline config` go automatically set pipeline variables for you.

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### Managed Identity
For Azure-hosted environments:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
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
For Terraform projects, azd dey substitute placeholders for `infra/main.tfvars.json`. Dem names must match declared Terraform input variables:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 Deployment Configuration

### Build Configuration
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### Docker Configuration
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
 Paths dey relative to service project. Dockerfile must declare any `ARG` values e go use. For multi-stage build, put deployable stage for last or use custom packaging workflow; `docker.target` no be supported property for reviewed schema.

## 🔧 Advanced Configuration

### Custom Resource Naming
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Define real resource names for Bicep/Terraform and keep resource-group creation consistent with this settings. No generic `naming.storageAccount` or `naming.keyVault` configuration keys exist.

### Network Configuration
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Merge these **illustrative parameter entries** inside `infra/main.parameters.json` under `parameters`, declare and consume matching parameters for Bicep. Dem no do anything by themselves.

### Monitoring Configuration
Provision Application Insights and Log Analytics with Bicep/Terraform and configure app telemetry for your SDK. No generic top-level `monitoring` block dey inside `azure.yaml` wey go create these resources. See [monitoring infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

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
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### Configuration Scripts
Create validation scripts inside `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
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

```

No hardcode sensitive values (dis na separate example config, no be second `database` key for same file):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
```
.azure/
├── config.json              # Global project config
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
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
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

**Goal**: Create and configure three local environments with different values. Start with initialized project; use unused names if dem already exist. These app-specific values no change telemetry/runtime settings until your template use dem.

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] Three environments create well well
- [ ] Each environment get different configuration
- [ ] Fit switch between environments without wahala
- [ ] `azd env list` show all three environments

### Exercise 2: Key Vault Secret References (10-20 minutes)

**Goal**: Store Key Vault reference instead of plaintext. **Starting point:** initialized environment, Azure sign-in, and access to Key Vault with permission to create/read dummy secret. Vault operations fit incur charge.

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**Success Criteria:**
- [ ] Interactive command report selected vault and secret reference
- [ ] Local `.env` get reference no be dummy secret
- [ ] Fit explain say runtime identity/RBAC and consumption still need configure

**Common problems:** 403 dey require correct vault data-plane role and time for propagation; `azd env set ... --secret` no be valid command. Normal `get-values`/`get-value` output no go always be redacted. Remove training reference with `azd env unset TRAINING_API_KEY`; dis no go delete vault secret, you need clean am separately if you create am.

## Next Steps

- [Your First Project](../chapter-01-foundation/first-project.md) - Apply configuration with practice
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Use configuration for deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Configurations wey dey ready for production

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [Environment Variables](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Authentication & Security](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dis document don translate wit AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). Even tho we dey try make am correct, abeg make you know say automated translation fit get errors or mistakes. Di original document for dia own language na im be di correct source. For important info, make person wey sabi human translation do am. We no go responsible for any misunderstanding or wrong understanding wey fit happen because of dis translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->