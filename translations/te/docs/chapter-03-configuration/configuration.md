# కాన్ఫిగరేషన్ మార్గదర్శకము

**అధ్యాయం ప్రయాణం:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: अध्याय 3 - Configuration & Authentication
- **⬅️ మునుపటి**: [Your First Project](first-project.md)
- **➡️ తదుపరి**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 తదుపరి అధ్యాయం**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర మార్గదర్శనం Azure Developer CLI యొక్క సైద్ధాంతిక మరియు అమలులోని ఆప్ట్‌ల కోసం కాన్ఫిగరేషన్‌కు సంబంధించిన అన్ని అంశాలను కవర్ చేస్తుంది. మీరు కాన్ఫిగరేషన్ హైరార్కీ, ఎన్విరాన్మెంట్ నిర్వహణ, authentication విధానాలు మరియు సమర్థవంతమైన మరియు సురక్షిత Azure డిప్లాయ్‌మెంట్‌లకు అనుమతించే అధునాతన కాన్ఫిగరేషన్ నమూనాల గురించి నేర్చుకుంటారు.

## నేర్చుకునే లక్ష్యాలు

ఈ పాఠం ముగియగానే, మీరు:
- azd కాన్ఫిగరేషన్ హైరార్కీని అదుపు చేసుకుని సెట్టింగ్స్ ఎలా ప్రాధాన్యంగా లాగబడతాయో అర్థం చేసుకోగలరు
- గ్లోబల్ మరియు ప్రాజెక్ట్-నిర్దిష్ట సెట్టింగ్స్‌ను సమర్థవంతంగా కాన్ఫిగర్ చేయగలరు
- భిన్న కాన్ఫిగరేషన్లతో అనేక ఎన్విరాన్మెంట్లను నిర్వహించగలరు
- సురక్షిత authentication మరియు authorization నమూనాల్ని అమలు చేయగలరు
- సంక్లిష్ట సందర్భాలకు అనుకూలంగా ఉన్న అధునాతన కాన్ఫిగరేషన్ ప్యాటర్న్స్‌ను అర్థం చేసుకోగలరు

## నేర్చిన ఫలితాలు

ఈ పాఠం పూర్తి చేయగానే, మీరు చేయగలరు:
- అభివృద్ధి పనిముట్టుల కోసం azd ను ఉత్తమంగా కాన్ఫిగర్ చేయగలరు
- బహు డిప్లాయ్‌మెంట్ ఎన్విరాన్మెంట్లను సెట్ చేసి నిర్వహించగలరు
- సురక్షిత కాన్ఫిగరేషన్ నిర్వహణ ఆచరణలను ప్రవేశపెట్టగలరు
- కాన్ఫిగరేషన్ సంబంధించిన సమస్యలను ట్రబుల్‌షూట్ చేయగలరు
- నిర్దిష్ట సంస్థా అవసరాల కోసం azd ప్రవర్తనను కస్టమైజ్ చేయగలరు

ఈ సమగ్ర మార్గదర్శనం Azure Developer CLI యొక్క సైద్ధాంతిక మరియు అమలులోని ఆప్ట్‌ల కోసం కాన్ఫిగరేషన్‌కు సంబంధించిన అన్ని అంశాలను కవర్ చేస్తుంది.

## azd ప్రాజెక్టులో AI ఏజెంట్లను అర్థం చేసుకోవడం

మీకు AI ఏజెంట్లు కొత్తైతే, azd ప్రపంచంలో వాటిని ఎలా ఆలోచించాలో ఒక సరళమైన విధానం ఇది.

### ఏజెంట్ అంటే ఏమిటి?

ఏజెంట్ ఒక సాఫ్ట్‌వేర్ భాగం, ఇది అభ్యర్థన స్వీకరించగలదు, దానిని విశ్లేషించగలదు, మరియు చర్యలు తీసుకోవచ్చు—అనేక సందర్భాల్లో ఒక AI మోడల్‌ను పిలవడం, డేటాను వెతకడం, లేదా ఇతర సేవలను ఆహ్వానించడం ద్వారా. ఒక azd ప్రాజెక్టులో, ఏజెంట్ మీ వెబ్ ఫ్రంట్‌ఎండ్ లేదా API బ్యాక్‌ఎండ్ పక్కన ఉండే మరోటి **సేవ** మాత్రమే.

### ఏజెంట్లు azd ప్రాజెక్ట్ నిర్మాణంలో ఎలా సరిపోతాయి

azd ప్రాజెక్టు మూడు పొరలతో ఉంటుంది: **Infrastructure**, **Code**, మరియు **Configuration**. ఏజెంట్లు ఈ పొరలలో ఇతర సేవలాగా సమానంగా ప్లగ్ ఇన్ అవుతాయి:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ఒక వెబ్ యాప్ మరియు డేటాబేస్‌ను ప్రావైజన్ చేయుతుంది | ఒక AI మోడల్ endpoint, search index, లేదా ఏజెంట్ హోస్ట్‌ను ప్రావైజన్ చేస్తుంది |
| **Code** (`src/`) | మీ ఫ్రంట్‌ఎండ్ మరియు API సోర్స్ కోడ్‌ను కలిగి ఉంటుంది | మీ ఏజెంట్ లాజిక్ మరియు prompt నిర్వచనాలను కలిగి ఉంటుంది |
| **Configuration** (`azure.yaml`) | మీ సేవలను మరియు అవి హోస్ట్ అవడానికి లక్ష్యాలను జాబితా చేస్తుంది | మీ ఏజెంట్‌ను ఒక సేవగా జాబితా చేస్తుంది, దాని కోడ్ మరియు హోస్ట్‌కి సూచిస్తుంది |

### `azure.yaml` పాత్ర

మీరు ఇప్పుడంటే సింటాక్స్‌ను గుర్తుపెట్టుకోవాల్సిన అవసరం లేదు. ఆలోచనా దృక్పథంలో, `azure.yaml` అనేది ఫైల్, అందులో మీరు azd కి చెప్పేరు: *"ఇవి నా అప్లికేషన్‌ను తయారుచేసే సేవలు, మరియు వాటి కోడ్‌ను ఎక్కడ కనుగొనాలో ఇక్కడ ఉంది."*

మీ ప్రాజెక్ట్‌లో ఒక AI ఏజెంట్ ఉంటే, `azure.yaml` కేవలం ఆ ఏజెంట్‌ను సేవలలో ఒకటి గా జాబితా చేస్తుంది. azd తప్పుడులా సరైన ఇన్ఫ్రాస్ట్రక్చర్ (ఉదాహరణకు Microsoft Foundry Models endpoint లేదా ఏజెంట్‌ను హోస్ట్ చేయడానికి Container App) ను ప్రావైజన్ చేయడానికి మరియు మీ ఏజెంట్ కోడ్‌ను డిప్లాయ్ చేయడానికి తెలుసుకుంటుంది — వెబ్ యాప్స్ లేదా APIలకు చేస్తుంది విధంగా.

దీని అర్థం ఏమిటంటే కొత్తగా నేర్చుకోవడానికి బేసిక్‌గా ఏమీ లేదు. మీరు azd ఒక వెబ్ సర్వీస్‌ను ఎలా నిర్వహిస్తుందో అర్థం చేసుకున్నట్లయితే, అది ఏజెంట్‌ను ఎలా నిర్వహిస్తుందో కూడా తెలుసుకున్నారు.

## కాన్ఫిగరేషన్ హైరార్కీ

azd ఒక స్థంభీకృత కాన్ఫిగరేషన్ వ్యవస్థను ఉపయోగిస్తుంది:
1. **కమాండ్-లైన్ ఫ్లాగ్‌లు** (అత్యధిక ప్రాధాన్యత)
2. **ఎన్విరాన్మెంట్ వేరియబుల్స్**
3. **లోకల్ ప్రాజెక్ట్ కాన్ఫిగరేషన్** (`.azd/config.json`)
4. **గ్లోబల్ యూజర్ కాన్ఫిగరేషన్** (`~/.azd/config.json`)
5. **డిఫాల్ట్ విలువలు** (నిమ్న ప్రాధాన్యత)

## గ్లోబల్ కాన్ఫిగరేషన్

### గ్లోబల్ డిఫాల్ట్స్ సెట్ చేయటం
```bash
# డిఫాల్ట్ సబ్‌స్క్రిప్షన్ సెట్ చేయండి
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# డిఫాల్ట్ స్థానాన్ని సెట్ చేయండి
azd config set defaults.location "eastus2"

# డిఫాల్ట్ రిసోర్స్ గ్రూప్ పేరు నియమావళి సెట్ చేయండి
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# అన్ని గ్లోబల్ కాన్ఫిగరేషన్లను వీక్షించండి
azd config list

# ఒక కాన్ఫిగరేషన్‌ను తొలగించండి
azd config unset defaults.location
```

### విస్తృత గ్లోబల్ సెట్టింగ్స్
```bash
# అభివృద్ధి ప్రాధాన్యాలు
azd config set alpha.enable true                    # ఆల్ఫా ఫీచర్లను సక్రియం చేయండి
azd config set telemetry.enabled false             # టెలిమెట్రీని నిలిపివేయండి
azd config set output.format json                  # ఫలిత ఫార్మాట్‌ను నిర్దేశించండి

# భద్రతా సెట్టింగులు
azd config set auth.useAzureCliCredential true     # ప్రామాణీకరణ కోసం Azure CLI ఉపయోగించండి
azd config set tls.insecure false                  # TLS నిర్ధారణను అమలు చేయండి

# ప్రదర్శన సర్దుబాటు
azd config set provision.parallelism 5             # సమాంతర వనరుల సృష్టి
azd config set deploy.timeout 30m                  # డিপ్లాయ్‌మెంట్ సమయ పరిమితి
```

## 🏗️ ప్రాజెక్ట్ కాన్ఫిగరేషన్

### azure.yaml నిర్మాణం
`azure.yaml` ఫైల్ మీ azd ప్రాజెక్ట్ హార్ట్:

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

#### హోస్ట్ రకాలూ
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

#### భాషా-నిర్దిష్ట సెట్టింగ్స్
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

## 🌟 ఎన్విరాన్మెంట్ నిర్వహణ

### ఎన్విరాన్మెంట్లు సృష్టించడం
```bash
# కొత్త వాతావరణాన్ని సృష్టించండి
azd env new development

# నిర్దిష్ట స్థలంతో సృష్టించండి
azd env new staging --location "westus2"

# నమూనా నుంచి సృష్టించండి
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ఎన్విరాన్మెంట్ కాన్ఫిగరేషన్
ప్రతి ఎన్విరాన్మెంటుకు ఔను `.azure/<env-name>/config.json` లో తనదైన కాన్ఫిగరేషన్ ఉంటుంది:

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

### ఎన్విరాన్మెంట్ వేరియబుల్స్
```bash
# పర్యావరణానికి నిర్దిష్టమైన వేరియబుల్స్‌ను సెట్ చేయండి
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# పర్యావరణ వేరియబుల్స్‌ను చూడండి
azd env get-values

# అనుకున్న అవుట్‌పుట్:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# పర్యావరణ వేరియబుల్‌ను తొలగించండి
azd env unset DEBUG

# తొలగింపును ధృవీకరించండి
azd env get-values | grep DEBUG
# (ఏమీ తిరిగి ఇవ్వకూడదు)
```

### ఎన్విరాన్మెంట్ టెంప్లేట్స్
సరిపోయే ఎన్విరాన్మెంట్ సెటప్ కోసం `.azure/env.template` సృష్టించండి:
```bash
# అవసరమైన వేరియబులు
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# అనువర్తన సెట్టింగులు
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ఐచ్ఛిక అభివృద్ధి సెట్టింగులు
DEBUG=false
LOG_LEVEL=info
```

## 🔐 authentication కాన్ఫిగరేషన్

### Azure CLI ఇంటిగ్రేషన్
```bash
# Azure CLI ప్రామాణీకరణ వివరాలను ఉపయోగించండి (డిఫాల్ట్)
azd config set auth.useAzureCliCredential true

# నిర్దిష్ట టెనెంట్‌తో లాగిన్ చేయండి
az login --tenant <tenant-id>

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription <subscription-id>
```

### సర్వీస్ ప్రిన్సిపల్ authentication
CI/CD పైప్లైన్స్ కోసం:
```bash
# పర్యావరణ చరాలు సెట్ చేయండి
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# లేదా నేరుగా కాన్ఫిగర్ చేయండి
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### మేనేజ్ చేయబడిన ఐడెంటిటీ
Azure-హోస్టెడ్ ఎన్విరాన్మెంట్ల కోసం:
```bash
# మేనేజ్ చేయబడిన ఐడెంటిటీ ఆధారిత ధృవీకరణను సక్రియం చేయండి
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
Example `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 అధునాతన కాన్ఫిగరేషన్

### కస్టమ్ రిసోర్స్ నేమింగ్
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

## 🎯 ఎన్విరాన్మెంట్-నిర్దిష్ట కాన్ఫిగరేషన్లు

### డెవలప్మెంట్ ఎన్విరాన్మెంట్
```bash
# .azure/డెవలప్‌మెంట్/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### స్టేజింగ్ ఎన్విరాన్మెంట్
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ప్రోడక్షన్ ఎన్విరాన్మెంట్
```bash
# .azure/ఉత్పత్తి/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 కాన్ఫిగరేషన్ వాలిడేషన్

### కాన్ఫిగరేషన్‌ను వెరిఫై చేయండి
```bash
# కాన్ఫిగరేషన్ సింటాక్స్‌ను తనిఖీ చేయండి
azd config validate

# పర్యావరణ చరాలను పరీక్షించండి
azd env get-values

# ఇన్ఫ్రాస్ట్రక్చర్‌ను ధృవీకరించండి
azd provision --dry-run
```

### కాన్ఫిగరేషన్ స్క్రిప్ట్స్
`scripts/` లో వెరిఫికేషన్ స్క్రిప్ట్స్ ను సృష్టించండి:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# అవసరమైన ఎన్విరాన్‌మెంట్ వేరియబుల్స్‌ను తనిఖీ చేయండి
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml సింటాక్స్‌ను ధృవీకరించండి
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ఉత్తమ అభ్యాసాలు

### 1. ఎన్విరాన్మెంట్ వేరియబుల్స్ వినియోగించండి
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. కాన్ఫిగరేషన్ ఫైళ్లను సంక్ర‌మబద్ధం చేయండి
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

### 3. వెర్షన్ కంట్రోల్ అంశాలు
```bash
# .gitignore
.azure/*/config.json         # పరిసర కాన్ఫిగరేషన్లు (వనరుల IDలను కలిగి ఉంటాయి)
.azure/*/.env               # పరిసర వేరియబుల్స్ (రహస్యాలను కలిగి ఉండవచ్చు)
.env                        # స్థానిక పర్యావరణ ఫైల్
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

### వ్యాయామం 1: బహుళ-ఎన్విరాన్మెంట్ కాన్ఫిగరేషన్ (15 నిమిషాలు)

**లక్ష్యము**: వేర్వేరు సెట్టింగ్స్‌తో మూడు ఎన్విరాన్మెంట్లను సృష్టించడం మరియు కాన్ఫిగర్ చేయడం

```bash
# డెవలప్‌మెంట్ పరిసరాన్ని సృష్టించండి
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# స్టేజింగ్ పరిసరాన్ని సృష్టించండి
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ఉత్పత్తి పరిసరాన్ని సృష్టించండి
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ప్రతి పరిసరాన్ని తనిఖీ చేయండి
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**విజయ ప్రమాణాలు:**
- [ ] మూడు ఎన్విరాన్మెంట్లు విజయవంతంగా సృష్టించబడ్డాయి
- [ ] ప్రతి ఎన్విరాన్మెంట్‌కు ప్రత్యేక కాన్ఫిగరేషన్ ఉంది
- [ ] ఎర్రర్లు లేకుండా ఎన్విరాన్మెంట్ల మధ్య మార్చుకోగలగడం
- [ ] `azd env list` అన్ని మూడు ఎన్విరాన్మెంట్లను చూపుతుంది

### వ్యాయామం 2: సీక్రెట్ నిర్వహణ (10 నిమిషాలు)

**లక్ష్యము**: సున్నితమైన డేటాతో సురక్షిత కాన్ఫిగరేషన్‌ను సాధన చేయండి

```bash
# రహస్యాలను సెట్ చేయండి (ఔట్పుట్‌లో ప్రదర్శించబడవు)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# రహస్యంకాని కాన్ఫిగ్‌ను సెట్ చేయండి
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# పర్యావరణాన్ని చూడండి (రహస్యాలు దాచివేయబడ్డ ఉండాలి)
azd env get-values

# రహస్యాలు నిల్వ చేయబడ్డాయో లేదో నిర్ధారించండి
azd env get DB_PASSWORD  # నిజమైన విలువను చూపించాలి
```

**విజయ ప్రమాణాలు:**
- [ ] సీక్రెట్లు టెర్మినల్‌లో ప్రదర్శించకుండా నిల్వ చేయబడ్డాయి
- [ ] `azd env get-values` రిడాక్టెడ్ సీక్రెట్లను చూపుతుంది
- [ ] వ్యక్తిగతంగా `azd env get <SECRET_NAME>` అసలు విలువను పొందుతుంది

## తదుపరి దశలు

- [Your First Project](first-project.md) - ప్రాక్టీస్‌లో కాన్ఫిగరేషన్‌ను వర్తింపజేయండి
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - డిప్లాయ్‌మెంట్ కోసం కాన్ఫిగరేషన్ వినియోగించండి
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ప్రొడక్షన్-సన్నద్ధ కాన్ఫిగరేషన్లు

## సూచనలుకి

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**అధ్యాయం ప్రయాణం:**
- **📚 కోర్సు హోమ్**: [AZD For Beginners](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: अध्याय 3 - Configuration & Authentication
- **⬅️ మునుపటి**: [Your First Project](first-project.md)
- **➡️ తదుపరి అధ్యాయం**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **తదుపరి పాఠం**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
ఈ పత్రాన్ని AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నించినప్పటికీ, స్వయంచాలక అనువాదాల్లో పొరపాట్లు లేదా లోపాలు ఉండవచ్చని దయచేసి గమనించండి. మాతృభాషలో ఉన్న అసలు పత్రాన్ని అధికారిక మూలంగా పరిగణించాలి. కీలకమైన సమాచారానికి వృత్తిపరమైన మానవ అనువాదం సిఫార్సు చేయబడుతుంది. ఈ అనువాదాన్ని ఉపయోగించినందున కలిగే ఏవైనా అవగాహనా లోపాలు లేదా తప్పుగా అర్థం చేసుకోవడాలకు మేము బాధ్యులు కాదు.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->