# కాన్ఫిగరేషన్ గైడ్

**Chapter Navigation:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 3 - కాన్ఫిగరేషన్ & ప్రామాణీకరణ
- **⬅️ మునుపటి**: [మీ తొలి ప్రాజెక్ట్](first-project.md)
- **➡️ తర్వాత**: [డిప్లోయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 తర్వాతి అధ్యాయం**: [అధ్యాయం 4: కోడ్ ద్వారా ఇన్‌ఫ్రాస్ట్రక్చర్](../chapter-04-infrastructure/deployment-guide.md)

## పరిచయం

ఈ సమగ్ర మార్గదర్శకం Azure Developer CLI ను అనుకూల అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోల కోసం ఉత్తమంగా కాన్ఫిగర్ చేయడనికి సంబంధించిన అన్ని అంశాలను కవర్ చేస్తుంది. మీరు కాన్ఫిగరేషన్ హైరార్కీ, ఎన్విరాన్‌మెంట్ నిర్వహణ, ఆథెంటికేషన్ పద్దతులు, మరియు సమర్థవంతమైన, సురక్షిత Azure డిప్లాయ్‌మెంట్‌లు సాధించడానికి అనుమతించే అడ్వాన్స్‌డ్ కాన్ఫిగరేషన్ నమూనాలను నేర్చుకోగలవు.

## నేర్చుకోవలసిన లక్ష్యాలు

ఈ పాఠం ముగిసినప్పుడు, మీరు:
- azd కాన్ఫిగరేషన్ హైరార్కీని అర్ధం చేసుకుని సెట్టింగ్స్ ఎలా ప్రాధాన్యత పొందుతున్నాయో నేర్చుకోవడం
- గ్లోబల్ మరియు ప్రాజెక్ట్-స్పెసిఫిక్ సెట్టింగ్స్‌ను సమర్థవంతంగా కాన్ఫిగర్ చేయడం
- వివిధ కాన్ఫిగరేషన్లతో బహుళ ఎన్విరాన్‌మెంట్‌లను నిర్వహించడం
- సురక్షిత ఆథెంటికేషన్ మరియు అథారైజేషన్ నమూనాలను అమలు చేయడం
- సంక్లిష్ట పరిస్థితుల కోసం అడ్వాన్స్‌డ్ కాన్ఫిగరేషన్ నమూనాలను అర్థం చేసుకోవడం

## నేర్చుకున్న ఫలితాలు

ఈ పాఠం పూర్తి చేసిన తర్వాత, మీరు చేయగలరు:
- అభివృద్ధి వర్క్‌ఫ్లోల కోసం azd ను ఉత్తమంగా కాన్ఫిగర్ చేయడం
- బహుళ డిప్లాయ్‌మెంట్ ఎన్విరాన్‌మెంట్‌లను ఏర్పాటు చేసి నిర్వహించడం
- సురక్షిత కాన్ఫిగరేషన్ నిర్వహణ సంకేతాలను అమలు చేయడం
- కాన్ఫిగరేషన్-సంబంధిత సమస్యలను ట్రబుల్‌షూట్ చేయడం
- నిర్దిష్ట సంస్థావసరాల కోసం azd ప్రవర్తనను అనుకూలీకరించడం

ఈ సమగ్ర మార్గదర్శకం Azure Developer CLI ను అనుకూల అభివృద్ధి మరియు డిప్లాయ్‌మెంట్ వర్క్‌ఫ్లోల కోసం ఉత్తమంగా కాన్ఫిగర్ చేయడానికిగాను అన్ని అంశాలను కవర్ చేస్తుంది.

## azd ప్రాజెక్టులో AI ఏజెంట్స్‌ను అర్థం చేసుకోవడం

మీకు AI ఏజెంట్స్ కొత్తగా ఉంటే, azd ప్రపంచంలో వాటి గురించి ఒక సాదారణ దృష్టి ఇది.

### ఏజెంట్ అంటే ఏమిటి?

ఏజెంట్ అనేది ఒక సాఫ్ట్‌వేర్ భాగం, అది ఒక అభ్యర్థనను అందుకుని, దానిపై తర్కం చేసి, కార్యాచరణలు చేయగలదు—చాలా సార్లు AI మోడల్‌ను పిలవడం, డేటా చూడటం, లేదా ఇతర సర్వీసులను పిలవడం ద్వారా. ఒక azd ప్రాజెక్టులో, ఏజెంట్ మీ వెబ్ ఫ్రంటెండ్ లేదా API బ్యాక్‌ఎండ్ పక్కన ఉండే ఒక సేవగా ఉంటుంది.

### ఏజెంట్స్ azd ప్రాజెక్ట్ నిర్మాణంలో ఎలా సరిపోతాయంటే

ఒక azd ప్రాజెక్టు మూడు స్థరాలుగా ఉంటుంది: **ఇన్‌ఫ్రాస్ట్రక్చర్**, **కోడ్**, మరియు **కాన్ఫిగరేషన్**. ఏజెంట్స్ ఈ స్థరాలలో ఇతర సేవల లాగా సమ్మిళితం అవుతాయి:

| స్థరము | సంప్రదాయ యాప్‌కు ఇది ఏమి చేస్తుంది | ఏజెంట్ కి ఇది ఏమి చేస్తుంది |
|-------|-------------------------------------|---------------------------|
| **ఇన్‌ఫ్రాస్ట్రక్చర్** (`infra/`) | వెబ్ యాప్ మరియు డేటాబేస్‌ను సిద్ధం చేస్తుంది | AI మోడల్ ఎండ్పాయింట్, సెర్చ్ ఇండెక్స్, లేదా ఏజెంట్ హోస్ట్‌ను సిద్ధం చేస్తుంది |
| **కోడ్** (`src/`) | మీ ఫ్రంటెండ్ మరియు API సోర్స్ కోడ్‌ను కలిగి ఉంటుంది | మీ ఏజెంట్ లాజిక్ మరియు ప్రాంప్ట్ నిర్వచనాలను కలిగి ఉంటుంది |
| **కాన్ఫిగరేషన్** (`azure.yaml`) | మీ సేవలు మరియు అవి హోస్ట్ అవ్వాల్సిన టార్గెట్లను జాబితా చేస్తుంది | మీ ఏజెంట్‌ను ఒక సేవగా జాబితా చేస్తుంది, దాని కోడ్ మరియు హోస్ట్‌ను పాయింట్ చేస్తుంది |

### `azure.yaml` 역할

మీకు ప్రస్తుతం సింటాక్స్‌ని మెమొరైజ్ చేయాల్సిన అవసరం లేదు. భావనాత్మకంగా, `azure.yaml` అనేది మీరు azd కి చెప్తున్న ఫైలు: "ఇవి నా అప్లికేషన్ ను తయారు చేసే సేవలు, మరియు వాటి కోడ్ ఎక్కడ సాప్కుతుందో ఇక్కడ ఉంది."

మీ ప్రాజెక్ట్‌లో ఒక AI ఏజెంట్ ఉంటే, `azure.yaml` ఆ ఏజెంట్‌ను సేవలలో ఒకటిగా మాత్రమే జాబితా చేస్తుంది. అప్పుడు azd సరైన ఇన్‌ఫ్రాస్ట్రక్చర్‌ను (ఉదాహరణకు Microsoft Foundry Models ఎండ్పాయింట్ లేదా ఏజెంట్‌ను హోస్ట్ చేసే Container App వంటి) ప్రొవిజన్ చేయడానికి మరియు మీ ఏజెంట్ కోడ్‌ను డిప్లాయ్ చేయడానికి తెలుసుకుంటుంది—వెబ్ యాప్ లేదా API కోసం చేస్తుందటట్లేనేం.

దీని అర్థం ఏమిటంటే, నేర్చుకోవడానికి మౌలికంగా కొత్తదేమీ లేదు. మీరు ఎలా azd ఒక వెబ్ సేవను నిర్వహిస్తుందో అర్ధం చేసుకుంటే, అది ఏజెంట్‌ను కూడా అదే విధంగా నిర్వహిస్తుంది.

## కాన్ఫిగరేషన్ హైరార్కీ

azd ఒక హైరార్కికల్ కాన్ఫిగరేషన్ సిస్టమ్‌ను ఉపయోగిస్తుంది:
1. **క‌మాండ్-లైన్ ఫ్లాగ్స్** (అత్యధిక ప్రాధాన్యం)
2. **ఎన్విరాన్‌మెంట్ వేరియబుల్స్**
3. **లోకల్ ప్రాజెక్ట్ కాన్ఫిగరేషన్** (`.azd/config.json`)
4. **గ్లోబల్ యూజర్ కాన్ఫిగరేషన్** (`~/.azd/config.json`)
5. **డిఫాల్ట్ విలువలు** (అల్పతమ ప్రాధాన్యం)

## గ్లోబల్ కాన్ఫిగరేషన్

### Setting Global Defaults
```bash
# డిఫాల్ట్ సబ్స్క్రిప్షన్‌ను సెట్ చేయండి
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# డిఫాల్ట్ స్థానాన్ని సెట్ చేయండి
azd config set defaults.location "eastus2"

# డిఫాల్ట్ రిసోర్స్ గ్రూప్ నామకరణ నియమాన్ని సెట్ చేయండి
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# అన్ని గ్లోబల్ కాన్ఫిగరేషన్లను వీక్షించండి
azd config show

# ఒక కాన్ఫిగరేషన్‌ను తొలగించండి
azd config unset defaults.location
```

### Common Global Settings
```bash
# అభివృద్ధి ప్రాధాన్యతలు
azd config set alpha.enable true                    # ఆల్ఫా ఫీచర్లను సక్రియం చేయండి
azd config set telemetry.enabled false             # టెలిమెట్రీని నిలిపివేయండి
azd config set output.format json                  # ఆవుట్‌పుట్ ఫార్మాట్ సెట్ చేయండి

# భద్రతా సెట్టింగులు
azd config set auth.useAzureCliCredential true     # ప్రామాణీకరణ కోసం Azure CLI ఉపయోగించండి
azd config set tls.insecure false                  # TLS నిర్ధారణను అమలు చేయండి

# పనితీరు సర్దుబాటు
azd config set provision.parallelism 5             # సమాంతర వనరుల సృష్టి
azd config set deploy.timeout 30m                  # అమలు సమయ పరిమితి
```

## 🏗️ ప్రాజెక్ట్ కాన్ఫిగరేషన్

### azure.yaml నిర్మాణం
`azure.yaml` ఫైలు మీ azd ప్రాజెక్ట్‌కి గుండె లాంటిది:

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

#### భాష-స్పెసిఫిక్ సెట్టింగ్స్
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

### ఎన్విరాన్‌మెెంట్స్ సృష్టించడం
```bash
# కొత్త పర్యావరణాన్ని సృష్టించండి
azd env new development

# నిర్దిష్ట స్థలంతో సృష్టించండి
azd env new staging --location "westus2"

# మూస నుండి సృష్టించండి
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్
ప్రతి ఎన్విరాన్‌మెంట్‌కు వారి స్వంత కాన్ఫిగరేషన్ `.azure/<env-name>/config.json` లో ఉంటుంది:

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
# పర్యావరణ నిర్దిష్ట వేరియబుల్స్‌ను సెట్ చేయండి
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# పర్యావరణ వేరియబుల్స్‌ను వీక్షించండి
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

### ఎన్విరాన్‌మెంట్ టెంప్లేట్లు
ఒక సరైన ఎన్విరాన్‌మెంట్ సెటప్ కోసం `.azure/env.template` సృష్టించండి:
```bash
# అవసరమైన వేరియబుల్‌లు
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# అనువర్తనం అమరికలు
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ఐచ్ఛిక అభివృద్ధి అమరికలు
DEBUG=false
LOG_LEVEL=info
```

### టీమ్‌లో ఎన్విరాన్‌మెంట్స్‌ను షేర్ చేయడం

ఒక ప్రాజెక్టుపై ఒకరికి పైగా వ్యక్తులు పని చేస్తే, మీరు **రిపొలో ఏమి రాతో, ఏమి స్థానికంగా ఉండాలో** అంగీకరించాల్సి ఉంటుంది. azd ప్రతి ఎన్విరాన్‌మెంట్‌ను `.azure/` ఫోల్డర్‌లో ఉంచుతుంది, మరియు అందులోని అందమైన భాగం అందర్నీ కమిట్ చేయకూడదు.

**`.azure/` లో ఏమి ఉంటుంది:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**గిట్‌ఇగ్నోర్ చేయవలసినవి.** azd యొక్క డిఫాల్ట్ `.gitignore` ఇప్పటికే `.azure/` ను తప్పు చేస్తుంది. ఇదే విధంగా ఉంచండి—`.env` ఫైళ్లలో రహస్యాలు ఉండవచ్చు, మరియు రిసోర్స్ IDs వారికి అందజేసిన వారికి ప్రత్యేకంగా ఉంటాయి. ప్రతి టీమ్ మెంట్ తమ **సొంత** ఎన్విరాన్‌మెంట్‌ను లోకల్గా సృష్టిస్తారు:

```bash
# ప్రతి డెవలపర్ తమకు స్వంతమైన వేరుచేసిన పరిసరాన్ని 얻డానికి దీన్ని ఒకసారి నడిపతారు
azd env new dev-alice
azd up
```

**ఎన్విరాన్‌మెంట్స్ మధ్య మార్పిడి.** ఒక ప్రభావవంతమైన డెవలపర్ పలు ఎన్విరాన్‌మెంట్‌లను నిర్వహిస్తే కమాండ్లు అమలు చేయండి ముందు యాక్టివ్ ఎన్విరాన్‌మెంట్‌ను ఎంచుకుంటారు:

```bash
azd env list                 # అన్ని లోకల్ ఎన్విరాన్మెంట్లు మరియు వాటిలో ఏది డిఫాల్ట్‌గా ఉందో చూడండి
azd env select staging       # 'staging'ను సక్రియ ఎన్విరాన్మెంట్‌గా చేయండి
azd env get-values           # మీరు సరైనదికే సూచించబడ్డారా అని నిర్ధారించుకోండి
```

**జట్టు కోసం non-secret డిఫాల్ట్ లను అందించడం.** ఒక టెంప్లేట్ ను (పై `.azure/env.template` లాంటిది) కమిట్ చేయండి తద్వారా ప్రతి ఒక్కరూ ఎలాంటి వేరియబుల్స్ సెట్ చేయాలో అవగాహన కలిగి ఉంటారు—కానీ ఎప్పుడూ నింపిన విలువలను కమిట్ చేయకండి. కొత్త టీమ్ సభ్యులు టెంప్లేట్ ను కాపీ చేసి తమ స్వంత విలువలు నింపుకుంటారు.

**CI/CD లో ఎన్విరాన్‌మెంట్స్.** పైప్‌లైన్లు మీ లోకల్ `.azure/` ఫోల్డర్ ను చదవవు. బదులుగా, ఎన్విరాన్‌మెంట్ విలువలను పైప్‌లైన్ వేరియబుల్స్/సీక్రెట్స్ గా అందించడం మరియు azd వాటిని ప్రాసెస్ ఎన్విరాన్‌మెంట్ నుండి చదివి తీసుకుంటుంది:

```bash
# CI లో, azd ఈ విలువలను .azure/ నుండి కాకుండా వాతావరణం నుండి చదువుతుంది
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** ఇన్ఫ్రాస్ట్రక్చర్ కోడ్ (`infra/`, `azure.yaml`) Gitలో పంచబడుతుంది; ఎన్విరాన్‌మెంట్ *స్థితి మరియు రహస్యాలు* (`.azure/`) ప్రతి డెవలపర్ మరియు ప్రతి పైప్‌లైన్‌కు ప్రత్యేకంగా ఉంటాయి. `azd pipeline config` మీ కోసం పైప్‌లైన్ వేరియబుల్స్‌ను ఆటోమేటిగ్గా సెట్ చేస్తుంది.

## 🔐 ఆథెంటికేషన్ కాన్ఫిగరేషన్

### Azure CLI ఇంటిగ్రేషన్
```bash
# Azure CLI క్రెడెన్షియల్స్ ఉపయోగించండి (డిఫాల్ట్)
azd config set auth.useAzureCliCredential true

# నిర్దిష్ట టెనెంట్‌తో లాగిన్ చేయండి
az login --tenant <tenant-id>

# డిఫాల్ట్ సబ్‌స్క్రిప్షన్‌ను సెట్ చేయండి
az account set --subscription <subscription-id>
```

### సర్వీస్ ప్రిన్సిపల్ ఆథెంటికేషన్
CI/CD పైప్‌లైన్స్ కోసం:
```bash
# పర్యావరణ చరాలను సెట్ చేయండి
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# లేదా నేరుగా కాన్ఫిగర్ చేయండి
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### మేనేజ్ చేయబడే ఐడెంటిటీ
Azure-హోస్టెడ్ ఎన్విరాన్‌మెంట్స్ కోసం:
```bash
# పరిపాలিত ఐడెంటిటీ ప్రామాణీకరణను సక్రియం చేయండి
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ఇన్‌ఫ్రాస్ట్రక్చర్ కాన్ఫిగరేషన్

### Bicep పారామీటర్లు
ఇన్‌ఫ్రాస్ట్రక్చర్ పారామీటర్లను `infra/main.parameters.json` లో కాన్ఫిగరేషన్ చేయండి:
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

## 🔧 అడ్వాన్స్‌డ్ కాన్ఫిగరేషన్

### కస్టమ్ రిసోర్స్ నేమింగ్
```bash
# పేరు నియమాలను సెట్ చేయండి
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

## 🎯 ఎన్విరాన్‌మెంట్-స్పెసిఫిక్ కాన్ఫిగరేషన్లు

### డెవలప్మెంట్ ఎన్విరాన్‌మెంట్
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### స్టేజింగ్ ఎన్విరాన్‌మెంట్
```bash
# .అజ్యూర్/స్టేజింగ్/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ప్రొడక్షన్ ఎన్విరాన్‌మెంట్
```bash
# .azure/ప్రొడక్షన్/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 కాన్ఫిగరేషన్ వాలిడేషన్

### కాన్ఫిగరేషన్‌ను నిర్ధారించండి
```bash
# కాన్ఫిగరేషన్ వ్యాకరణాన్ని తనిఖీ చేయండి
azd config validate

# పరివేశ పరామితులను పరీక్షించండి
azd env get-values

# ఇన్ఫ్రాస్ట్రక్చర్‌ను ధృవీకరించండి
azd provision --dry-run
```

### కాన్ఫిగరేషన్ స్క్రిప్టులు
మన `scripts/` లో నిర్ధారణ స్క్రిప్టులను రూపొందించండి:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# అవసరమైన పర్యావరణ చరాలను తనిఖీ చేయండి
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

### 1. ఎన్విరాన్‌మెంట్ వేరియబుల్స్ ఉపయోగించండి
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

### 3. వెర్షన్ కంట్రోల్ పరిగణనలు
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

## 🎯 ప్రాక్టికల్ అభ్యాస వ్యాయామాలు

### వ్యాయామం 1: బహుళ-ఎన్విరాన్‌మెంట్ కాన్ఫిగరేషన్ (15 నిమిషాలు)

**లక్ష్యము**: భిన్న సెట్టింగ్స్‌తో మూడు ఎన్విరాన్‌మెంట్‌లను సృష్టించండి మరియు కాన్ఫిగర్ చేయండి

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

# ప్రతి వాతావరణాన్ని నిర్ధారించండి
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**జయ ప్రమాణాలు:**
- [ ] మూడు ఎన్విరాన్‌మెంట్‌లు విజయవంతంగా సృష్టించబడ్డాయి
- [ ] ప్రతి ఎన్విరాన్‌మెంట్‌కి ప్రత్యేక కాన్ఫిగరేషన్ ఉంది
- [ ] యాక్టివ్ ఎన్విరాన్‌మెంట్‌లను బదిలీ చేయగలిగేలా ఉంటుంది
- [ ] `azd env list` అన్ని మూడు ఎన్విరాన్‌మెంట్‌లను చూపిస్తుంది

### వ్యాయామం 2: రహస్య నిర్వహణ (10 నిమిషాలు)

**లక్ష్యము**: సెన్సిటివ్ డేటాతో సురక్షిత కాన్ఫిగరేషన్ ని ప్రాక్టీస్ చేయండి

```bash
# రహస్యాలకు విలువలు ఇవ్వండి (ఫలితాల్లో చూపబడవు)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# రహస్యంలేని కాన్ఫిగరేషన్‌ను సెట్ చేయండి
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ఎన్విరాన్‌మెంట్‌ను చూడండి (రహస్యాలు మస్క్ చేయబడాలి)
azd env get-values

# రహస్యాలు నిల్వ చేశాయో పరిశీలించండి
azd env get DB_PASSWORD  # నిజమైన విలువను చూపించాలి
```

**జయ ప్రమాణాలు:**
- [ ] రహస్యాలు టెర్మినల్‌లో ప్రదర్శింపబడకుండా నిల్వ చేయబడ్డాయి
- [ ] `azd env get-values` ద్వారా రహస్యాలు రెడాక్టెడ్ గా చూపబడతాయి
- [ ] వ్యక్తిగత `azd env get <SECRET_NAME>` నిజమైన విలువను తిరిగి తీసుకొస్తుంది

## తదుపరి దశలు

- [మీ తొలి ప్రాజెక్ట్](first-project.md) - ప్రాక్టీసులో కాన్ఫిగరేషన్‌ను ఉపయోగించండి
- [డిప్లోయ్‌మెంట్ గైడ్](../chapter-04-infrastructure/deployment-guide.md) - డిప్లోయ్‌మెంట్ కోసం కాన్ఫిగరేషన్‌ను ఉపయోగించండి
- [రిసోర్స్‌లు provisioning](../chapter-04-infrastructure/provisioning.md) - ప్రొడక్షన్-రెడీ కాన్ఫిగరేషన్లు

## సూచనలు

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 కోర్సు హోమ్**: [AZD ప్రారంభికులకు](../../README.md)
- **📖 ప్రస్తుత అధ్యాయం**: అధ్యాయం 3 - కాన్ఫిగరేషన్ & ప్రామాణీకరణ
- **⬅️ మునుపటి**: [మీ తొలి ప్రాజెక్ట్](first-project.md)
- **➡️ తర్వాతి అధ్యాయం**: [అధ్యాయం 4: కోడ్ ద్వారా ఇన్‌ఫ్రాస్ట్రక్చర్](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [మీ తొలి ప్రాజెక్ట్](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**అస్వీకరణ**:
ఈ పత్రం AI అనువాద సేవ [Co-op Translator](https://github.com/Azure/co-op-translator) ఉపయోగించి అనువదించబడింది. మేము ఖచ్చితత్వానికి ప్రయత్నిస్తున్నప్పటికీ, ఆటోమేటెడ్ అనువాదాలు తప్పులు లేదా అసమగ్రతలను కలిగి ఉండవచ్చు. దాని స్వదేశ భాషలో ఉన్న అసలు పత్రాన్ని అధికారం కలిగిన మూలంగా పరిగణించాలి. కీలకమైన సమాచారం కోసం, ప్రొఫెషనల్ మానవ అనువాదాన్ని సిఫారసు చేస్తాము. ఈ అనువాదం ఉపయోగం వల్ల కలిగే ఏవైనా అపార్థాలు లేదా తప్పుదారులు కోసం మేము బాధ్యత వహించము.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->