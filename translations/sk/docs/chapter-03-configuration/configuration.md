# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - Configuration & Authentication
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

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

azd uses a hierarchical configuration system:
1. **Command-line flags** (highest priority)
2. **Environment variables**
3. **Local project configuration** (`.azd/config.json`)
4. **Global user configuration** (`~/.azd/config.json`)
5. **Default values** (lowest priority)

## Global Configuration

### Setting Global Defaults
```bash
# Nastaviť predvolené predplatné
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Nastaviť predvolenú lokalitu
azd config set defaults.location "eastus2"

# Nastaviť predvolenú konvenciu pomenovania skupiny prostriedkov
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# Zobraziť všetku globálnu konfiguráciu
azd config show

# Odstrániť konfiguráciu
azd config unset defaults.location
```

### Common Global Settings
```bash
# Vývojové preferencie
azd config set alpha.enable true                    # Povoliť alfa funkcie
azd config set telemetry.enabled false             # Vypnúť telemetriu
azd config set output.format json                  # Nastaviť formát výstupu

# Nastavenia zabezpečenia
azd config set auth.useAzureCliCredential true     # Použiť Azure CLI na autentifikáciu
azd config set tls.insecure false                  # Vynútiť overenie TLS

# Ladenie výkonu
azd config set provision.parallelism 5             # Paralelné vytváranie zdrojov
azd config set deploy.timeout 30m                  # Časový limit nasadenia
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
# Vytvoriť nové prostredie
azd env new development

# Vytvoriť s konkrétnym umiestnením
azd env new staging --location "westus2"

# Vytvoriť z šablóny
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
# Nastaviť premenné špecifické pre prostredie
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# Zobraziť premenné prostredia
azd env get-values

# Očakávaný výstup:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Odstrániť premennú prostredia
azd env unset DEBUG

# Overiť odstránenie
azd env get-values | grep DEBUG
# (nemalo by vrátiť nič)
```

### Environment Templates
Create `.azure/env.template` for consistent environment setup:
```bash
# Povinné premenné
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# Nastavenia aplikácie
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# Voliteľné nastavenia vývoja
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
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**What to gitignore.** azd's default `.gitignore` already excludes `.azure/`. Keep it that way—the `.env` files can contain secrets, and resource IDs are specific to whoever provisioned them. Each teammate creates their **own** environment locally:

```bash
# Každý vývojár to spustí raz, aby získal svoje izolované prostredie
azd env new dev-alice
azd up
```

**Switching between environments.** A developer who manages several environments selects the active one before running commands:

```bash
azd env list                 # zobraziť všetky lokálne prostredia a ktoré z nich je predvolené
azd env select staging       # nastaviť 'staging' ako aktívne prostredie
azd env get-values           # overiť, že máte nasmerované správne prostredie
```

**Providing non-secret defaults to the team.** Commit a template (like the `.azure/env.template` above) so everyone knows which variables to set—but never commit the filled-in values. New teammates copy the template and fill in their own.

**Environments in CI/CD.** Pipelines don't read your local `.azure/` folder. Instead, provide the environment values as pipeline variables/secrets, and azd reads them from the process environment:

```bash
# V CI azd tieto načítava z prostredia, nie z .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** infrastructure code (`infra/`, `azure.yaml`) is shared in Git; environment *state and secrets* (`.azure/`) are per-developer and per-pipeline. `azd pipeline config` sets the pipeline variables up for you automatically.

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Použiť prihlasovacie údaje Azure CLI (predvolené)
azd config set auth.useAzureCliCredential true

# Prihlásiť sa s konkrétnym nájomcom
az login --tenant <tenant-id>

# Nastaviť predvolené predplatné
az account set --subscription <subscription-id>
```

### Service Principal Authentication
For CI/CD pipelines:
```bash
# Nastavte premenné prostredia
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Alebo nakonfigurujte priamo
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
For Azure-hosted environments:
```bash
# Povoliť autentifikáciu spravovanej identity
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
Príklad `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# Nastaviť konvencie pomenovávania
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
# .azure/vývoj/.env
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
# Skontrolovať syntax konfigurácie
azd config validate

# Otestovať premenné prostredia
azd env get-values

# Overiť infraštruktúru
azd provision --dry-run
```

### Configuration Scripts
Create validation scripts in `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Skontrolovať požadované premenné prostredia
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Overiť syntaktickú správnosť azure.yaml
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
.azure/*/config.json         # Konfigurácie prostredia (obsahujú identifikátory zdrojov)
.azure/*/.env               # Premenné prostredia (môžu obsahovať citlivé údaje)
.env                        # Lokálny súbor prostredia
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
# Vytvorte vývojové prostredie
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Vytvorte predprodukčné prostredie
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Vytvorte produkčné prostredie
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Overte každé prostredie
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
# Nastaviť tajomstvá (nebudú zobrazené vo výstupe)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# Nastaviť konfiguráciu bez tajných údajov
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Zobraziť prostredie (tajomstvá by mali byť zacenzurované)
azd env get-values

# Overiť, že tajomstvá sú uložené
azd env get DB_PASSWORD  # Malo by zobraziť skutočnú hodnotu
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
**Vyhlásenie o zodpovednosti**:
Tento dokument bol preložený pomocou AI prekladateľskej služby [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Pôvodný dokument v jeho natívnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne interpretácie vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->