# కాన్ఫిగరేషన్ గైడ్

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికుల కోసం](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 3 - కాన్ఫిగరేషన్ & ప్రామాణీకరణ
- **⬅️ మాజి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **➡️ తర్వాతి**: [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 తర్వాతి అధ్యాయం**: [అధ్యాయం 4: ఇన్ఫ్రాస్ట్రక్చర్ అస్ కోడ్](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర గైడ్ Azure Developer CLI ని ఉత్తమ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోల కోసం కాన్ఫిగర్ చేయడంలో सम्बन्धించే అన్ని అంశాలను కవర్ చేస్తుంది. మీరు కాన్ఫిగరేషన్ హియరార్కీ, పర్యావరణ నిర్వహణ, ఆథెంటికేషన్ విధానాలు మరియు సురక్షితమైన, సమర్థవంతమైన Azure డిప్లాయ్‌మెంట్స్ సాధ్యమయ్యే అధునాతన కాన్ఫిగరేషన్ నమూనాల గురించి నేర్చుకుంటారు.

## అభ్యాస లక్ష్యాలు

ఈ పాఠం ముగిసిన తర్వాత, మీరు:
- azd కాన్ఫిగరేషన్ హియరార్కీని పట్టు చేసుకుంటారు మరియు సెట్టింగ్స్ ఎలా ప్రాధాన్యమివ్వబడతాయో అర్థం చేసుకుంటారు
- గ్లోబల్ మరియు ప్రాజెక్ట్-స్పెసిఫిక్ సెట్టింగ్స్‌ను సమర్థవంతంగా కాన్ఫిగర్ చేయగలుగుతారు
- వివిధ కాన్ఫిగరేషన్లతో బహుళ పర్యావరణాలను నిర్వహించగలుగుతారు
- సురక్షిత ఆథెంటికేషన్ మరియు అథరైజేషన్ నమూనాలను అమలు చేయగలుగుతారు
- క్లిష్ట సందర్భాలకు అనుగుణమైన అధునాతన కాన్ఫిగరేషన్ నమూనాలను అర్థం చేసుకుంటారు

## అభ్యాస ఫలితాలు

ఈ పాఠాన్ని పూర్తి చేసిన తర్వాత, మీరు చేయగలుగుతారు:
- azd ని ఉత్తమ అభివృద్ధి వర్క్‌ఫ్లోల కోసం కాన్ఫిగర్ చేయడం
- బహుళ డిప్లాయ్‌మెంట్ పర్యావరణాలను సెటప్ చేసి నిర్వహించడం
- సురక్షిత కాన్ఫిగరేషన్ నిర్వహణ అభ్యాసాలను అమలు చేయడం
- కాన్ఫిగరేషన్ సంబంధిత సమస్యలను ట్రబుల్షూట్ చేయడం
- నిర్దిష్ట సంస్థ అవసరాల కోసం azd ప్రవర్తనను కస్టమైజ్ చేయడం

ఈ సమగ్ర గైడ్ Azure Developer CLI ని ఉత్తమ అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోల కోసం కాన్ఫిగర్ చేయడంలో సంబంధించిన అన్ని అంశాలను కవర్ చేస్తుంది.

## azd ప్రాజెక్టులో AI ఏజెంట్లను అర్థం చేసుకోవడం

మీరు AI ఏజెంట్లకు కొత్తవారు అయితే, azd పరిసరంలో వాటిని ఎలా భావించాలో ఒక సాదాసీదా వైఖరి ఇక్కడ ఉంది.

### ఏజెంట్ అంటే ఏమిటి?

ఏజెంట్ అనేది ఒక సాఫ్ట్‌వేర్ భాగం, అది ఒక రిక్వెస్ట్‌ను అందుకొని, దాని గురించి తర్కం చేసి, చర్యలు తీసుకుంటుంది—చేతనగా AI మోడల్‌ను కాల్ చేయడం, డేటా చూడటం లేదా ఇతర సేవలను ఆహ్వానించడం ద్వారా. ఒక azd ప్రాజెక్టులో, ఏజెంట్ మీ వెబ్ ఫ్రంట్‌ఎండ్ లేదా API బ్యాకెండ్ పక్కన మరో **సేవ** గా ఉంటుంది.

### ఏజెంట్లు azd ప్రాజెక్ట్ నిర్మాణంలో ఎలా సరిపోతాయి

ఒక azd ప్రాజెక్టు మూడు పొరలతో ఉంటుంది: **ఇన్ఫ్రాస్ట్రక్చర్**, **కోడ్**, మరియు **కాన్ఫిగరేషన్**. ఏజెంట్లు ఈ పొరలలో ఇతర సర్వీసుల లాగా చేర్చబడతాయి:

| పొర | సంప్రదాయ యాప్ కోసం ఇది ఏం చేస్తుంది | ఏజెంట్ కోసం ఇది ఏం చేస్తుంది |
|-------|-------------------------------------|---------------------------|
| **ఇన్ఫ్రాస్ట్రక్చర్** (`infra/`) | వెబ్ యాప్ మరియు డేటాబేస్‌ను ఏర్పాటు చేస్తుంది | AI మోడల్ ఎండ్‌పాయింట్, సెర్చ్ ఇండెక్స్ లేదా ఏజెంట్ హోస్ట్‌ని ఏర్పాటు చేస్తుంది |
| **కోడ్** (`src/`) | మీ ఫ్రంట్‌ఎండ్ మరియు API సోర్స్ కోడ్‌ను కలిగిస్తుంది | మీ ఏజెంట్ లాజిక్ మరియు ప్రాంప్ట్ నిర్వచనాలను కలిగి ఉంటుంది |
| **కాన్ఫిగరేషన్** (`azure.yaml`) | మీ సేవలు మరియు వాటి హోస్టింగ్ లక్ష్యాలను జాబితా చేస్తుంది | ఏజెంట్‌ను ఒక సేవగా జాబితా చేసి, దాని కోడ్ మరియు హోస్ట్‌ను సూచిస్తుంది |

### `azure.yaml` యొక్క పాత్ర

మీరు సిండాక్స్‌ను ఇప్పుడు గుర్తుంచుకోవాల్సిన అవసరం లేదు. సాంఘికంగా చూస్తే, `azure.yaml` ఫైల్‌లో మీరు azd కి చెబుతారు: "ఇవి నా అప్లికేషన్‌ను తయారు చేసే సేవలు, మరియు వాటి కోడ్‌ను ఎక్కడ కనుగొనాలో ఇదిగో."

మీ ప్రాజెక్ట్‌లో ఒక AI ఏజెంట్ ఉంటే, `azure.yaml` అది ఒక సేవగా మాత్రమే జాబితా చేస్తుంది. azd తగిన ఇన్ఫ్రాస్ట్రక్చర్ (ఉదాహరణకు Microsoft Foundry Models ఎండ్‌పాయింట్ లేదా ఏజెంట్ హోస్ట్ చేయడానికి Container App) ను వ్యవస్థాపించి మీ ఏజెంట్ కోడ్‌ను డిప్లాయ్ చేయటం తెలుసుకుంటుంది—అదే విధంగా అది వెబ్ యాప్ లేదా API కోసం చేస్తుంది.

అంటే నేర్చుకునేందుకు మూలంగా కొత్త విషయం ఏమీ లేదు. మీరు azd ఎలా ఒక వెబ్ సేవను నిర్వహిస్తుందో అర్థం చేసుకుంటే, అది ఏజెంట్‌ను ఎలా నిర్వహిస్తుందో మీరు ఇప్పటికే అర్థం చేసుకున్నారు.

## కాన్ఫిగరేషన్ శ్రేణి

azd ఒక హియరార్కికల్ కాన్ఫిగరేషన్ సిస్టమ్ వినియోగిస్తుంది:
1. కమాండ్-లైన్ ఫ్లాగ్లు (అత్యంత ప్రాధాన్యత)
2. పర్యావరణ వేరియబుల్స్
3. లోకల్ ప్రాజెక్ట్ కాన్ఫిగరేషన్ (`.azd/config.json`)
4. గ్లోబల్ యూజర్ కాన్ఫిగరేషన్ (`~/.azd/config.json`)
5. డిఫాల్ట్ విలువలు (అత్యల్ప ప్రాధాన్యత)

## గ్లోబల్ కాన్ఫిగరేషన్

### గ్లోబల్ డిఫాల్ట్‌లను అమర్చడం
```bash
# డిఫాల్ట్ సబ్‌స్క్రిప్షన్ సెట్ చేయండి
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# డిఫాల్ట్ ప్రాంతం సెట్ చేయండి
azd config set defaults.location "eastus2"

# డిఫాల్ట్ రిసోర్స్ గ్రూప్ పేరుల నియమాన్ని సెట్ చేయండి
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# అన్ని గ్లోబల్ కాన్ఫిగరేషన్లను వీక్షించండి
azd config show

# ఒక కాన్ఫిగరేషన్ తొలగించండి
azd config unset defaults.location
```

### సాధారణ గ్లోబల్ సెట్టింగ్స్
```bash
# అభివృద్ధి ప్రాధాన్యతలు
azd config set alpha.enable true                    # అల్ఫా లక్షణాలను సక్రియం చేయండి
azd config set telemetry.enabled false             # టెలిమెట్రీని నిలిపివేయండి
azd config set output.format json                  # అవుట్‌పుట్ ఫార్మాట్‌ను అమర్చండి

# భద్రతా సెట్టింగులు
azd config set auth.useAzureCliCredential true     # ప్రామాణీకరణ కోసం Azure CLI ను ఉపయోగించండి
azd config set tls.insecure false                  # TLS ధృవీకరణను బలపర్చండి

# పనితీరు సర్దుబాటు
azd config set provision.parallelism 5             # సమాంతర వనరుల సృష్టి
azd config set deploy.timeout 30m                  # డిప్లాయ్‌మెంట్ సమయ పరిమితి
```

## 🏗️ ప్రాజెక్ట్ కాన్ఫిగరేషన్

### azure.yaml నిర్మాణం
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

### సర్వీస్ కాన్ఫిగరేషన్ ఎంపికలు

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

#### భాష-నిర్దిష్ట సెట్టింగ్స్
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

## 🌟 పర్యావరణ నిర్వహణ

### పర్యావరణాలు సృష్టించడం
```bash
# కొత్త ఎన్విరాన్‌మెంట్ సృష్టించండి
azd env new development

# నిర్దిష్ట స్థలంతో సృష్టించండి
azd env new staging --location "westus2"

# టెంప్లేట్ నుండి సృష్టించండి
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### పర్యావరణ కాన్ఫిగరేషన్
ప్రతి పర్యావరణానికి స్వంత కాన్ఫిగరేషన్ ఉంటుంది `.azure/<env-name>/config.json` లో:

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

### పర్యావరణ వేరియబల్స్
```bash
# పర్యావరణ-నిర్దిష్ట వేరియబుల్స్‌ను సెట్ చేయండి
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# పర్యావరణ వేరియబుల్స్‌ను చూడండి
azd env get-values

# అంచనీయమైన అవుట్‌పుట్:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# పర్యావరణ వేరియబుల్‌ను తొలగించండి
azd env unset DEBUG

# తొలగింపును నిర్ధారించండి
azd env get-values | grep DEBUG
# (ఏమీ తిరిగి ఇవ్వకూడదు)
```

### పర్యావరణ టెంప్లేట్లు
అవిరలమైన పర్యావరణ సెటప్ కోసం `.azure/env.template` సృష్టించండి:
```bash
# అవసరమైన వేరియబుల్‌లు
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# అనువర్తన అమరికలు
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ఐచ్ఛిక అభివృద్ధి అమరికలు
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ఆథెంటికేషన్ కాన్ఫిగరేషన్

### Azure CLI ఇంటిగ్రేషన్
```bash
# Azure CLI క్రెడెన్షియల్స్ ఉపయోగించండి (డిఫాల్ట్)
azd config set auth.useAzureCliCredential true

# నిర్దిష్ట టెనెంట్‌తో లాగిన్ చేయండి
az login --tenant <tenant-id>

# డిఫాల్ట్ సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription <subscription-id>
```

### సర్వీస్ ప్రిన్సిపల్ ఆథెంటికేషన్
CI/CD పైప్‌లైన్ల కోసం:
```bash
# పర్యావరణ చరాలను సెట్ చేయండి
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# లేదా నేరుగా ఆకృతీకరించండి
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### మేనేజ్ చేయబడిన ఐడెంటిటీ
Azure-హోస్ట్ చేయబడ్డ పర్యావరణాల కోసం:
```bash
# నిర్వహిత ఐడెంటిటీ ధృవీకరణను సక్రియం చేయండి
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ఇన్ఫ్రాస్ట్రక్చర్ కాన్ఫిగరేషన్

### Bicep పరామితులు
ఇన్ఫ్రాస్ట్రక్చర్ పరామితులను `infra/main.parameters.json` లో కాన్ఫిగర్ చేయండి:
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
Terraform ప్రాజెక్టుల కోసం, `infra/terraform.tfvars` లో కాన్ఫిగర్ చేయండి:
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

## 🔧 అడ్వాన్స్డ్ కాన్ఫిగరేషన్

### కస్టమ్ రిసోర్స్ నామకరణం
```bash
# పేరుల నియమావళులను సెట్ చేయండి
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

## 🎯 పర్యావరణ-నిర్దిష్ట కాన్ఫిగరేషన్లు

### డెవలప్‌మెంట్ పర్యావరణం
```bash
# .azure/అభివృద్ధి/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### స్టేజింగ్ పర్యావరణం
```bash
# .అజ్యూర్/స్టేజింగ్/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ప్రొడక్షన్ పర్యావరణం
```bash
# .azure/ఉత్పత్తి/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 కాన్ఫిగరేషన్ ధృవీకరణ

### కాన్ఫిగరేషన్‌ను ధృవీకరించండి
```bash
# కాన్ఫిగరేషన్ సింటాక్స్‌ను తనిఖీ చేయండి
azd config validate

# పర్యావరణ చరాలను పరీక్షించండి
azd env get-values

# ఇన్ఫ్రాస్ట్రక్చర్‌ను ధృవీకరించండి
azd provision --dry-run
```

### కాన్ఫిగరేషన్ స్క్రిప్టులు
స్వచ్ఛత ధృవీకరణ స్క్రిప్టులను `scripts/` లో సృష్టించండి:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# అవసరమైన ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను తనిఖీ చేయండి
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml యొక్క సింటాక్స్‌ను ధృవీకరించండి
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

### 2. కాన్ఫిగరేషన్ ఫైళ్లను వ్యవస్థీకరించండి
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

### 3. వెర్షన్ కంట్రోల్ పరామర్శలు
```bash
# .gitignore
.azure/*/config.json         # పరిసర కాన్ఫిగరేషన్లు (వనరుల IDలను కలిగి ఉంటాయి)
.azure/*/.env               # పరిసర వేరియబుల్‌లు (రహస్యాలను కలిగి ఉండవచ్చు)
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

## 🎯 ప్రాక్టికల్ ప్రయోగాలు

### వ్యాయామం 1: బహుళ-పర్యావరణ కాన్ఫిగరేషన్ (15 నిమిషాలు)

**లక్ష్యం**: వేరే సెట్టింగ్స్‌తో మూడు పర్యావరణాలను సృష్టించి కాన్ఫిగర్ చేయండి

```bash
# అభివృద్ధి వాతావరణాన్ని సృష్టించండి
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# స్టేజింగ్ వాతావరణాన్ని సృష్టించండి
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ఉత్పత్తి వాతావరణాన్ని సృష్టించండి
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ప్రతి వాతావరణాన్ని ధృవీకరించండి
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**యశస్సు ప్రమాణాలు:**
- [ ] మూడు పర్యావరణాలు విజయవంతంగా సృష్టించబడ్డాయి
- [ ] ప్రతి పర్యావరణానికి ప్రత్యేక కాన్ఫిగరేషన్ ఉందాలి
- [ ] పర్యావరణాల మధ్య తప్పులేకుండా మారగలగాలి
- [ ] `azd env list` అన్ని మూడు పరిసరాలను చూపిస్తుంది

### వ్యాయామం 2: రహస్య నిర్వహణ (10 నిమిషాలు)

**లక్ష్యం**: సున్నితమైన డేటాతో సురక్షిత కాన్ఫిగరేషన్ అభ్యాసం చేయండి

```bash
# రహస్యాలను సెట్ చేయండి (ఫలితాల్లో ప్రదర్శించబడవు)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# రహస్యంలేని కాన్ఫిగరేషన్‌ను సెట్ చేయండి
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# పర్యావరణాన్ని చూడండి (రహస్యాలు దాచబడాలి)
azd env get-values

# రహస్యాలు నిల్వ చేయబడ్డాయని ధృవీకరించండి
azd env get DB_PASSWORD  # నిజమైన విలువను చూపించాలి
```

**యశస్సు ప్రమాణాలు:**
- [ ] రహస్యాలు టెర్మినల్‌లో చూపించకుండా భద్రముగా నిల్వ చేయబడ్డాయి
- [ ] `azd env get-values` రెడాక్ట్ చేసిన రహస్యాలను చూపిస్తుంది
- [ ] వ్యక్తిగతంగా `azd env get <SECRET_NAME>` వాస్తవ విలువను తిరిగి పొందుతుంది

## తదుపరి దశలు

- [మీ మొదటి ప్రాజెక్ట్](first-project.md) - ప్రాక్టిస్‌లో కాన్ఫిగరేషన్‌ను వర్తింపజేస్తుంది
- [డిప్లాయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - డిప్లాయ్‌మెంట్ కోసం కాన్ఫిగరేషన్‌ను ఉపయోగిస్తుంది
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ప్రొడక్షన్-సిద్ధ కాన్ఫిగరేషన్లు

## రిఫరెన్సులు

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [పర్యావరణ వేరియబుల్స్](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**అధ్యాయ నావిగేషన్:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికుల కోసం](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 3 - కాన్ఫిగరేషన్ & ప్రామాణీకరణ
- **⬅️ మాజి**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)
- **➡️ తర్వాతి అధ్యాయం**: [అధ్యాయం 4: ఇన్ఫ్రాస్ట్రక్చర్ అస్ కోడ్](../chapter-04-infrastructure/deployment-guide.md)
- **తరువాత పాఠం**: [మీ మొదటి ప్రాజెక్ట్](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**నిరాకరణ**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ద్వారా అనువదించారు. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, ఆటోమేటెడ్ అనువాదాలలో తప్పులు లేదా లోపాలు ఉండగలవని దయచేసి గమనించండి. మూల భాషలోని అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరులైన మానవ అనువాదం చేయించుకోవాలని సూచించబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించడంతో ఏర్పడిన ఏవైనా అపార్థాలు లేదా తప్పుడు అర్థాలపై మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->