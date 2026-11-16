# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](../chapter-01-foundation/first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

> Reviewed against `azd 1.37.2` (November 2026). Bash commands assume an initialized azd project. Unless explicitly described as a complete file, YAML/Bicep snippets are fragments to merge into matching project files, not standalone runnable projects.

This comprehensive guide covers all aspects of configuring Azure Developer CLI for optimal development and deployment workflows. You'll learn about the configuration hierarchy, environment management, authentication methods, and advanced configuration patterns that enable efficient and secure Azure deployments.

## Learning Goals

By the end of this lesson, you will:
- Master the azd configuration hierarchy and understand how settings are prioritized
- Configure global and project-specific settings effectively
- Manage multiple environments with different configurations
- Implement secure authentication and authorization patterns
- Understand advanced configuration patterns for complex scenarios

## Learning Outcomes

After completing this lesson, you will be able to:
- Configure azd for optimal development workflows
- Set up and manage multiple deployment environments
- Implement secure configuration management practices
- Troubleshoot configuration-related issues
- Customize azd behavior for specific organizational requirements

This comprehensive guide covers all aspects of configuring Azure Developer CLI for optimal development and deployment workflows.

## Understanding AI Agents in an azd Project

If you're new to AI agents, here's a simple way to think about them within the azd world.

### What Is an Agent?

An agent is a piece of software that can receive a request, reason about it, and take actions—often by calling an AI model, looking up data, or invoking other services. In an azd project, an agent is just another **service** alongside your web frontend or API backend.

### How Agents Fit Into the azd Project Structure

An azd project is made up of three layers: **infrastructure**, **code**, and **configuration**. Agents plug into these layers the same way any other service does:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | Provisions a web app and database | Provisions an AI model endpoint, search index, or agent host |
| **Code** (`src/`) | Contains your frontend and API source code | Contains your agent logic and prompt definitions |
| **Configuration** (`azure.yaml`) | Lists your services and their hosting targets | Lists your agent as a service, pointing to its code and host |

### The Role of `azure.yaml`

You don't need to memorize the syntax right now. Conceptually, `azure.yaml` is the file where you tell azd: *"Here are the services that make up my application, and here's where to find their code."*

When your project includes an AI agent, `azure.yaml` simply lists that agent as one of the services. azd then knows to provision the right infrastructure (like an Microsoft Foundry Models endpoint or a Container App to host the agent) and deploy your agent code—just as it would for a web app or API.

This means there's nothing fundamentally new to learn. If you understand how azd manages a web service, you already understand how it manages an agent.

## Configuration Hierarchy

azd has distinct configuration surfaces, not one universal overlay:
- **Global user preferences**: `~/.azd/config.json`, managed by `azd config`.
- **Project definition**: `azure.yaml` specifies services, infrastructure, and hooks.
- **Local environment selection**: `.azure/config.json`.
- **Per-environment values**: `.azure/<name>/.env`, managed by `azd env`; additional settings live in that environment's `config.json`.
- **Flags and process variables**: override only the settings supported by a particular command/provider.

An arbitrary `azd env set` value does not automatically become an infrastructure parameter or deployed application setting. Explicitly reference it in the parameter file, supported service configuration, or a hook.

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
The `azure.yaml` file is the heart of your azd project:

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

This is a **project-definition example**, not a supplied starter. Create the referenced source directories, hook scripts, package scripts, and matching `infra/main.bicep`/`main.parameters.json` before running it. Databases belong in infrastructure; `postgres` is not a built-in service host. Infrastructure parameters go in the provider's parameter file, not `infra.parameters`.

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

The following service fragments illustrate hooks; merge them with each service's real `project` and `host`. `buildCommand` and `startCommand` are not generic azd service properties. Configure startup in the application, Dockerfile, or host infrastructure.

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
Core environment values live in `.azure/<env-name>/.env`, including `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, and `AZURE_LOCATION`. Use `azd env config get/set` for additional environment JSON settings. The following JSON is **conceptual application state**, not an azd config schema; do not copy it into azd's files:

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

**Plaintext demonstration only.** Ordinary `azd env set` values are written to `.azure/<name>/.env` and can be printed by read commands. Do not use the example API key as a real credential. For secrets, use `azd env set-secret` and explicit runtime wiring.

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
Create a **non-secret, manually maintained** `.env.example` in the project root for consistent setup. azd does not automatically load a file named `env.template`:
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

When more than one person works on a project, you need to agree on **what travels with the repo and what stays local**. azd keeps each environment under a `.azure/` folder, and not all of it should be committed.

**What's in `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**What to gitignore.** azd's default `.gitignore` already excludes `.azure/`. Keep it that way—the `.env` files can contain secrets, and resource IDs are specific to whoever provisioned them. Each teammate creates their **own** environment locally:

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**Switching between environments.** A developer who manages several environments selects the active one before running commands:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**Providing non-secret defaults to the team.** Commit `.env.example` outside the ignored `.azure/` directory. New teammates copy it to a local ignored file, fill in values, and explicitly import it with `azd env set --file <local-file>`. Never import blank placeholders over a working environment.

**Environments in CI/CD.** Pipelines don't read your local `.azure/` folder. Instead, provide the environment values as pipeline variables/secrets, and azd reads them from the process environment:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** infrastructure code (`infra/`, `azure.yaml`) is shared in Git; environment *state and secrets* (`.azure/`) are per-developer and per-pipeline. `azd pipeline config` sets the pipeline variables up for you automatically.

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
For Terraform projects, azd substitutes placeholders in `infra/main.tfvars.json`. These names must match declared Terraform input variables:
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
Paths are relative to the service project. The Dockerfile must declare any `ARG` values it consumes. For a multi-stage build, put the deployable stage last or use a custom packaging workflow; `docker.target` is not a supported property in the reviewed schema.

## 🔧 Advanced Configuration

### Custom Resource Naming
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

Define actual resource names in Bicep/Terraform and keep resource-group creation consistent with this setting. There are no generic `naming.storageAccount` or `naming.keyVault` configuration keys.

### Network Configuration
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

Merge these **illustrative parameter entries** into `infra/main.parameters.json` under `parameters`, and declare and consume the matching parameters in Bicep. They do nothing by themselves.

### Monitoring Configuration
Provision Application Insights and Log Analytics in Bicep/Terraform and configure application telemetry in your SDK. There is no generic top-level `monitoring` block in `azure.yaml` that creates these resources. See [monitoring infrastructure](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability).

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
Create validation scripts in `scripts/`:

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

Avoid hardcoding sensitive values (separate illustrative configuration, not a second `database` key in the same file):

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

**Goal**: Create and configure three local environments with different values. Start in an initialized project; use unused names if these already exist. These application-specific values do not change telemetry/runtime settings until your template consumes them.

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
- [ ] Three environments created successfully
- [ ] Each environment has unique configuration
- [ ] Can switch between environments without errors
- [ ] `azd env list` shows all three environments

### Exercise 2: Key Vault Secret References (10-20 minutes)

**Goal**: Store a Key Vault reference instead of plaintext. **Starting point:** an initialized environment, Azure sign-in, and access to a Key Vault with permissions to create/read a dummy secret. Vault operations can incur charges.

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
- [ ] Interactive command reports the selected vault and secret reference
- [ ] Local `.env` contains a reference rather than the dummy secret
- [ ] Can explain that runtime identity/RBAC and consumption must still be configured

**Common issues:** a 403 requires the correct vault data-plane role and propagation time; `azd env set ... --secret` is not a valid command. Ordinary `get-values`/`get-value` output must not be assumed redacted. Remove the training reference with `azd env unset TRAINING_API_KEY`; this does not delete the vault secret, which you must clean up separately if you created it.

## Next Steps

- [Your First Project](../chapter-01-foundation/first-project.md) - Apply configuration in practice
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - Use configuration for deployment
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - Production-ready configurations

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
This document has been translated using AI translation service [Co-op Translator](https://github.com/Azure/co-op-translator). While we strive for accuracy, please be aware that automated translations may contain errors or inaccuracies. The original document in its native language should be considered the authoritative source. For critical information, professional human translation is recommended. We are not liable for any misunderstandings or misinterpretations arising from the use of this translation.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->