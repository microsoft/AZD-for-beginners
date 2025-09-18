<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "2268ee429553504f96f4571074bcbf84",
  "translation_date": "2025-09-18T08:57:03+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "sw"
}
-->
# Mwongozo wa Usanidi

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 3 - Usanidi na Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Inayofuata**: [Mwongozo wa Utekelezaji](../deployment/deployment-guide.md)
- **🚀 Sura Inayofuata**: [Sura ya 4: Miundombinu kama Kanuni](../deployment/deployment-guide.md)

## Utangulizi

Mwongozo huu wa kina unashughulikia vipengele vyote vya kusanidi Azure Developer CLI kwa ajili ya mchakato bora wa maendeleo na utekelezaji. Utajifunza kuhusu mpangilio wa usanidi, usimamizi wa mazingira, mbinu za uthibitishaji, na mifumo ya usanidi ya hali ya juu inayowezesha utekelezaji wa Azure kwa ufanisi na usalama.

## Malengo ya Kujifunza

Mwisho wa somo hili, utaweza:
- Kumudu mpangilio wa usanidi wa azd na kuelewa jinsi mipangilio inavyopangwa kwa kipaumbele
- Kusimamia mipangilio ya kimataifa na ya mradi maalum kwa ufanisi
- Kusimamia mazingira mengi yenye usanidi tofauti
- Kutekeleza mifumo salama ya uthibitishaji na ruhusa
- Kuelewa mifumo ya usanidi ya hali ya juu kwa hali ngumu

## Matokeo ya Kujifunza

Baada ya kukamilisha somo hili, utaweza:
- Kusimamia azd kwa mchakato bora wa maendeleo
- Kuweka na kusimamia mazingira mengi ya utekelezaji
- Kutekeleza mbinu salama za usimamizi wa usanidi
- Kutatua matatizo yanayohusiana na usanidi
- Kubinafsisha tabia ya azd kwa mahitaji maalum ya shirika

Mwongozo huu wa kina unashughulikia vipengele vyote vya kusanidi Azure Developer CLI kwa ajili ya mchakato bora wa maendeleo na utekelezaji.

## Mpangilio wa Usanidi

azd hutumia mfumo wa usanidi wa mpangilio:
1. **Bendera za amri** (kipaumbele cha juu zaidi)
2. **Vigezo vya mazingira**
3. **Usanidi wa mradi wa ndani** (`.azd/config.json`)
4. **Usanidi wa mtumiaji wa kimataifa** (`~/.azd/config.json`)
5. **Thamani za msingi** (kipaumbele cha chini zaidi)

## Usanidi wa Kimataifa

### Kuweka Chaguo-msingi za Kimataifa
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

### Mipangilio ya Kawaida ya Kimataifa
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
```

## 🏗️ Usanidi wa Mradi

### Muundo wa azure.yaml
Faili ya `azure.yaml` ni moyo wa mradi wako wa azd:

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

### Chaguo za Usanidi wa Huduma

#### Aina za Wenyeji
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

#### Mipangilio Maalum ya Lugha
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

## 🌟 Usimamizi wa Mazingira

### Kuunda Mazingira
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Usanidi wa Mazingira
Kila mazingira yana usanidi wake katika `.azure/<env-name>/config.json`:

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

### Vigezo vya Mazingira
```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### Violezo vya Mazingira
Unda `.azure/env.template` kwa usanidi thabiti wa mazingira:
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

## 🔐 Usanidi wa Uthibitishaji

### Ushirikiano wa Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### Uthibitishaji wa Service Principal
Kwa mikondo ya CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Utambulisho Uliofanywa
Kwa mazingira yanayohifadhiwa na Azure:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Usanidi wa Miundombinu

### Vigezo vya Bicep
Sanidi vigezo vya miundombinu katika `infra/main.parameters.json`:
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

### Usanidi wa Terraform
Kwa miradi ya Terraform, sanidi katika `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Usanidi wa Utekelezaji

### Usanidi wa Ujenzi
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

### Usanidi wa Docker
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
Mfano wa `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Usanidi wa Hali ya Juu

### Uwekaji Jina wa Rasilimali Maalum
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Usanidi wa Mtandao
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Usanidi wa Ufuatiliaji
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

## 🎯 Usanidi Maalum wa Mazingira

### Mazingira ya Maendeleo
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Mazingira ya Staging
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Mazingira ya Uzalishaji
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Uthibitishaji wa Usanidi

### Thibitisha Usanidi
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### Script za Usanidi
Unda script za uthibitishaji katika `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validate azure.yaml syntax
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Mbinu Bora

### 1. Tumia Vigezo vya Mazingira
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Panga Faili za Usanidi
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

### 3. Mambo ya Kuzingatia Katika Udhibiti wa Toleo
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. Nyaraka za Usanidi
Andika nyaraka za usanidi wako katika `CONFIG.md`:
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

## Hatua Zifuatazo

- [Mradi Wako wa Kwanza](first-project.md) - Tumia usanidi kwa vitendo
- [Mwongozo wa Utekelezaji](../deployment/deployment-guide.md) - Tumia usanidi kwa utekelezaji
- [Utoaji wa Rasilimali](../deployment/provisioning.md) - Usanidi wa hali ya uzalishaji

## Marejeleo

- [Marejeleo ya Usanidi wa azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema ya azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Vigezo vya Mazingira](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Urambazaji wa Sura:**
- **📚 Nyumbani kwa Kozi**: [AZD Kwa Anayeanza](../../README.md)
- **📖 Sura ya Sasa**: Sura ya 3 - Usanidi na Uthibitishaji
- **⬅️ Iliyotangulia**: [Mradi Wako wa Kwanza](first-project.md)
- **➡️ Sura Inayofuata**: [Sura ya 4: Miundombinu kama Kanuni](../deployment/deployment-guide.md)
- **Somo Linalofuata**: [Mradi Wako wa Kwanza](first-project.md)

---

**Kanusho**:  
Hati hii imetafsiriwa kwa kutumia huduma ya kutafsiri ya AI [Co-op Translator](https://github.com/Azure/co-op-translator). Ingawa tunajitahidi kuhakikisha usahihi, tafadhali fahamu kuwa tafsiri za kiotomatiki zinaweza kuwa na makosa au kutokuwa sahihi. Hati ya asili katika lugha yake ya awali inapaswa kuzingatiwa kama chanzo cha mamlaka. Kwa taarifa muhimu, tafsiri ya kitaalamu ya binadamu inapendekezwa. Hatutawajibika kwa kutoelewana au tafsiri zisizo sahihi zinazotokana na matumizi ya tafsiri hii.