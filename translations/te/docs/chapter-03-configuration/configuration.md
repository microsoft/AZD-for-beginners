# కాన్ఫిగరేషన్ గైడ్

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 3 - కాన్ఫిగరేషన్ & ప్రామాణీకరణ
- **⬅️ మునుపటి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **➡️ తదుపరి**: [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 తర్వాతి అధ్యాయం**: [అధ్యాయం 4: కోడ్ ద్వారా ఇన్ఫ్రాస్ట్రక్చర్](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI ను ఉత్తమ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోల కోసం ఎలా కాన్ఫిగర్ చేయాలో అన్ని అంశాలనూ కవర్ చేస్తుంది. మీరు కాన్ఫిగరేషన్ హైరార్కీ, ఎన్విరాన్‌మెంట్ నిర్వహణ, ఆథెంటికేషన్ పద్ధతులు మరియు సమర్థవంతమైన, భద్రమైన Azure డిప్లాయ్‌మెంట్‌లను సాధించే అభివృద్ధి కాన్ఫిగరేషన్ నమూనాలను గురించి తెలుసుకుంటారు.

## అభ్యాస లక్ష్యాలు

ఈ పాఠం ముగిసినప్పుడు, మీరు:
- azd కాన్ఫిగరేషన్ హైరార్కీని మాస్టర్ చేసి సెట్టింగ్స్ ప్రాధాన్యత ఎలా ఇవ్వబడతాయో అర్థం చేసుకోవాలి
- గ్లోబల్ మరియు ప్రాజెక్ట్-స్పెసిఫిక్ సెట్టింగ్స్‌ను సమర్థవంతంగా కాన్ఫిగర్ చేయండి
- వేరే కాన్ఫిగరేషన్లతో బహుళ ఎన్విరాన్‌మెంట్‌లను నిర్వహించండి
- భద్రతతో కూడిన ఆథెంటికేషన్ మరియు అధికార నిర్దేశ వస్తువులను అమలు చేయండి
- కాంప్లెక్స్ పరిస్థితులకు అనుగుణంగా అధునాతన కాన్ఫిగరేషన్ నమూనాలను అర్థం చేసుకోండి

## నేర్చుకునే ఫలితాలు

ఈ పాఠం పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- అభివృద్ధి వర్క్‌ఫ్లోల కోసం azd ను ఉత్తమంగా కాన్ఫిగర్ చేయండి
- బహుళ డిప్లాయ్‌మెంట్ ఎన్విరాన్‌మెంట్‌లను సెటప్ చేసి నిర్వహించండి
- భద్రతతో కూడిన కాన్ఫిగరేషన్ నిర్వహణ ఆచరణలను అమలు చేయండి
- కాన్ఫిగరేషన్ సంబంధిత సమస్యలను ట్రబుల్‌షూట్ చేయండి
- ప్రత్యేక సంస్థ అవసరాల కోసం azd ప్రవర్తనను అనుకూలీకరించండి

ఈ సమగ్ర గైడ్ Azure Developer CLI ను ఉత్తమ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోల కోసం ఎలా కాన్ఫిగర్ చేయాలో అన్ని అంశాలనూ కవర్ చేస్తుంది.

## కాన్ఫిగరేషన్ శ్రేణి

azd ఒక హైరార్కికల్ కాన్ఫిగరేషన్ సిస్టమ్ ఉపయోగిస్తుంది:
1. **కమాండ్-లైన్ ఫ్లాగ్‌లు** (అత్యంత ప్రాధాన్యం)
2. **పర్యావరణ వేరియబుల్స్**
3. **లోకల్ ప్రాజెక్ట్ కాన్ఫిగరేషన్** (`.azd/config.json`)
4. **గ్లోబల్ యూజర్ కాన్ఫిగరేషన్** (`~/.azd/config.json`)
5. **డిఫాల్ట్ విలువలు** (చూడచేసిన ప్రాధాన్యం)

## గ్లోబల్ కాన్ఫిగరేషన్

### గ్లోబల్ డిఫాల్ట్‌లు సెట్ చేయడం
```bash
# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# డిఫాల్ట్ ప్రాంతాన్ని సెట్ చేయండి
azd config set defaults.location "eastus2"

# డిఫాల్ట్ రిసోర్స్ గ్రూప్ పేరుల నియమాన్ని సెట్ చేయండి
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# అన్ని గ్లోబల్ కాన్ఫిగరేషన్లను చూడండి
azd config list

# ఒక కాన్ఫిగరేషన్‌ను తొలగించండి
azd config unset defaults.location
```

### సాధారణ గ్లోబల్ సెట్టింగ్స్
```bash
# అభివృద్ధి ప్రాధాన్యాలు
azd config set alpha.enable true                    # ఆల్ఫా ఫీచర్లను అనుమతించండి
azd config set telemetry.enabled false             # టెలిమెట్రీని నిలిపివేయండి
azd config set output.format json                  # అవుట్‌పుట్ ఫార్మాట్ సెట్ చేయండి

# భద్రతా సెట్టింగులు
azd config set auth.useAzureCliCredential true     # ధృవీకరణకు Azure CLI ఉపయోగించండి
azd config set tls.insecure false                  # TLS ధృవీకరణను అమలు చేయండి

# పనితీరు ట్యూనింగ్
azd config set provision.parallelism 5             # సమాంతర వనరుల సృష్టి
azd config set deploy.timeout 30m                  # డిప్లాయ్‌మెంట్ టైమౌట్
```

## 🏗️ ప్రాజెక్ట్ కాన్ఫిగరేషన్

### azure.yaml నిర్మాణం
ఈ `azure.yaml` ఫైల్ మీ azd ప్రాజెక్ట్ యొక్క గుండె:

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

### సేవ కాన్ఫిగరేషన్ ఎంపికలు

#### హోస్ట్ రకాలు
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

#### భాషాపరమైన సెట్టింగ్స్
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

## 🌟 ఎన్విరాన్‌మెంట్ నిర్వహణ

### ఎన్విరాన్‌మెంట్‌లు సృష్టించడం
```bash
# కొత్త పరిసరాన్ని సృష్టించండి
azd env new development

# నిర్దిష్ట స్థలంతో సృష్టించండి
azd env new staging --location "westus2"

# మూస నుండి సృష్టించండి
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్
ప్రతి ఎన్విరాన్‌మెంట్‌కు దాని స్వంత కాన్ఫిగరేషన్ ఉంటుంది `.azure/<env-name>/config.json` లో:

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

### ఎన్విరాన్‌మెంట్ వేరియబుల్స్
```bash
# పర్యావరణానికి ప్రత్యేకమైన వేరియబుల్స్‌ను సెట్ చేయండి
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# పర్యావరణ వేరియబుల్స్‌ను చూడండి
azd env get-values

# ఆశించిన ఫలితం:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# పర్యావరణ వేరియబుల్‌ను తొలగించండి
azd env unset DEBUG

# తొలగింపును నిర్ధారించండి
azd env get-values | grep DEBUG
# (ఏమీ తిరిగి ఇవ్వకూడదు)
```

### ఎన్విరాన్‌మెంట్ టెంప్లేట్స్
సమానమైన ఎన్విరాన్‌మెంట్ సెటప్ కోసం `.azure/env.template` ను సృష్టించండి:
```bash
# అవసరమైన వేరియబుల్‌లు
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# అప్లికేషన్ అమరికలు
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ఐచ్ఛిక అభివృద్ధి అమరికలు
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ఆథెంటికేషన్ కాన్ఫిగరేషన్

### Azure CLI సమీకరణ
```bash
# Azure CLI క్రెడెన్షియల్స్ ఉపయోగించండి (డిఫాల్ట్)
azd config set auth.useAzureCliCredential true

# నిర్దిష్ట టెనెంట్‌తో లాగిన్ చేయండి
az login --tenant <tenant-id>

# డిఫాల్ట్ సబ్స్క్రిప్షన్ సెట్ చేయండి
az account set --subscription <subscription-id>
```

### సర్వీస్ ప్రిన్సిపల్ ఆథెంటికేషన్
CI/CD పైప్లైన్స్ కోసం:
```bash
# పరిసర వేరియబుల్స్ సెట్ చేయండి
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# లేదా నేరుగా అమర్చండి
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### మేనేజ్ చేయబడిన ఐడెంటిటీ
Azureలో హోస్ట్ చేయబడిన ఎన్విరాన్‌మెంట్స్ కోసం:
```bash
# నిర్వహిత ఐడెంటిటీ ప్రామాణీకరణను సక్రియం చేయండి
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ఇన్‌ఫ్రాస్ట్రక్చర్ కాన్ఫిగరేషన్

### Bicep పారామీటర్లు
ఇన్‌ఫ్రా పారామీటర్లు `infra/main.parameters.json` లో కాన్ఫిగర్ చేయండి:
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

### Terraform కాన్ఫిగరేషన్
Terraform ప్రాజెక్ట్‌ల కోసం, `infra/terraform.tfvars` లో కాన్ఫిగర్ చేయండి:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 డిప్లాయ్‌మెంట్ కాన్ఫిగరేషన్

### బిల్డ్ కాన్ఫిగరేషన్
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

### Docker కాన్ఫిగరేషన్
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
ఉదాహరణ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 అధునాతన కాన్ఫిగరేషన్

### అనుకూల వనరు నామకరణం
```bash
# పేరుల నామకరణ నియమాలను స్థాపించండి
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### నెట్‌వర్క్ కాన్ఫిగరేషన్
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### మానిటరింగ్ కాన్ఫిగరేషన్
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

## 🎯 ఎన్విరాన్‌మెంట్-నిర్దిష్ట కాన్ఫిగరేషన్లు

### డెవలప్‌మెంట్ ఎన్విరాన్‌మెంట్
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### స్టేజింగ్ ఎన్విరాన్‌మెంట్
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ప్రొడక్షన్ ఎన్విరాన్‌మెంట్
```bash
# .azure/ఉత్పత్తి/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 కాన్ఫిగరేషన్ నిర్ధారణ

### కాన్ఫిగరేషన్ నిర్ధారించండి
```bash
# కాన్ఫిగరేషన్ వాక్యరచనను తనిఖీ చేయండి
azd config validate

# పర్యావరణ వేరియబుల్స్‌ను పరీక్షించండి
azd env get-values

# ఇన్‌ఫ్రాస్ట్రక్చర్‌ను ధృవీకరించండి
azd provision --dry-run
```

### కాన్ఫిగరేషన్ స్క్రిప్ట్స్
వాలిడేషన్ స్క్రిప్ట్స్‌ను `scripts/` లో సృష్టించండి:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# అవసరమైన పర్యావరణ చరాలను తనిఖీ చేయండి
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml యొక్క వ్యాకరణాన్ని ధృవీకరించండి
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ఉత్తమ పద్ధతులు

### 1. పర్యావరణ వేరియబుల్స్ ఉపయోగించండి
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. కాన్ఫిగరేషన్ ఫైళ్లను సుసంపత్తిగా ఏర్పాటు చేయండి
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

### 3. వెర్షన్ కంట్రోల్ విషయాలు
```bash
# .gitignore
.azure/*/config.json         # పరిసర కాన్ఫిగరేషన్లు (వనరు IDలను కలిగి ఉంటాయి)
.azure/*/.env               # పరిసర వేరియబుల్స్ (రహస్యాలను కలిగి ఉండవచ్చు)
.env                        # స్థానిక పరిసర ఫైల్
```

### 4. కాన్ఫిగరేషన్ డాక్యుమెంటేషన్
మీ కాన్ఫిగరేషన్‌ను `CONFIG.md` లో డాక్యుమెంట్ చేయండి:
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

## 🎯 హ్యాండ్స్-ఆన్ ప్రాక్టీస్ వ్యాయామాలు

### వ్యాయామం 1: బహుళ ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్ (15 నిమిషాలు)

**లక్ష్యం**: వేర్వేరు సెట్టింగ్స్ ఉన్న మూడు ఎన్విరాన్‌మెంట్‌లను సృష్టించి కాన్ఫిగర్ చేయండి

```bash
# అభివృద్ధి పర్యావరణాన్ని సృష్టించండి
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# స్టేజింగ్ పర్యావరణాన్ని సృష్టించండి
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ఉత్పత్తి పర్యావరణాన్ని సృష్టించండి
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ప్రతి పర్యావరణాన్ని ధృవీకరించండి
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**విజయ ప్రమాణాలు:**
- [ ] మూడు ఎన్విరాన్‌మెంట్‌లు విజయవంతంగా సృష్టించబడ్డాయి
- [ ] ప్రతి ఎన్విరాన్‌మెంట్‌కు ప్రత్యేక కాన్ఫిగరేషన్ ఉంది
- [ ] ఎర్రర్లు లేకుండా ఎన్విరాన్‌మెంట్‌ల మధ్య మారగలగాలి
- [ ] `azd env list` అన్ని మూడు ఎన్విరాన్‌మెంట్‌లు చూపిస్తుంది

### వ్యాయామం 2: సీక్రెట్ నిర్వహణ (10 నిమిషాలు)

**లక్ష్యం**: సున్నితమైన డేటాతో సురక్షిత కాన్ఫిగరేషన్ సాధన చేయండి

```bash
# రహస్యాలను సెట్ చేయండి (ఫలితాల్లో చూపబడవు)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# రహస్య కాని కాన్ఫిగ్‌ను సెట్ చేయండి
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ఎన్విరాన్‌మెంట్‌ను చూడండి (రహస్యాలు తొలగించబడ్డుండాలి)
azd env get-values

# రహస్యాలు నిల్వ చేయబడ్డాయో నిర్ధారించండి
azd env get DB_PASSWORD  # వాస్తవ విలువ చూపించాలి
```

**విజయ ప్రమాణాలు:**
- [ ] సీక్రెట్స్ టెర్మినల్‌లో చూపించకుండా నిల్వ చేయబడ్డాయి
- [ ] `azd env get-values` రెడాక్ట్ చేయబడిన సీక్రెట్లు చూపిస్తుంది
- [ ] వ్యక్తిగత `azd env get <SECRET_NAME>` అసలైన విలువను పొందుతుంది

## తదుపరి చర్యలు

- [మీ మొదటి ప్రాజెక్ట్](first-project.md) - కాన్ఫిగరేషన్‌ను ప్రయోగంలో వినియోగించండి
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - డిప్లాయ్‌మెంట్ కోసం కాన్ఫిగరేషన్ ఉపయోగించండి
- [రిసోర్సుల ప్రొవిజనింగ్](../chapter-04-infrastructure/provisioning.md) - ప్రొడక్షన్-రెడీ కాన్ఫిగరేషన్లు

## సూచనలు

- [azd కాన్ఫిగరేషన్ రిఫరెన్స్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml స్కీమా](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [పర్యావరణ వేరియబుల్స్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 3 - కాన్ఫిగరేషన్ & ప్రామాణీకరణ
- **⬅️ మునుపటి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **➡️ తర్వాతి అధ్యాయం**: [అధ్యాయం 4: కోడ్ ద్వారా ఇన్ఫ్రాస్ట్రక్చర్](../chapter-04-infrastructure/deployment-guide.md)
- **తరువాతి పాఠం**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
నిరాకరణ:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వాన్ని లక్ష్యంగా పనిచేస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా లోపాలు ఉండవచ్చు అని దయచేసి గమనించండి. మూల పత్రాన్ని దాని స్థానిక భాషలో ఉన్న వెర్షన్‌ను అధికారిక ప్రకృతి/మూలం గా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదం చేయించుకోవడం సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంతో సంబంధించి వచ్చే ఏవైనా అపార్థాలు లేదా తప్పుగా అర్థం చేసుకోవడాలపై మేము బాధ్యులం కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->