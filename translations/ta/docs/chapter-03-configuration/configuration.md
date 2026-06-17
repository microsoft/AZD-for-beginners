# கட்டமைப்பு வழிகாட்டி

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 3 - Configuration & Authentication
- **⬅️ முந்தையது**: [Your First Project](first-project.md)
- **➡️ அடுத்தது**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 அடுத்த அத்தியாயம்**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## அறிமுகம்

இந்த விரிவான வழிகாட்டி Azure Developer CLI-ஐ சாத்தியமானவிதமாகத் தயாரிக்கும் மற்றும் பிரயோகம் மற்றும் வழிவழி பணிகளுக்கான உள்ளமைப்புகளை பற்றி அனைத்தையும் அலசுகிறது. நீங்கள் கட்டமைப்பு வரிசை, சுற்றுச்சூழல் மேலாண்மை, அங்கீகாரம் முறைகள், மற்றும் பாதுகாப்பான மற்றும் திறமையான Azure அமைவுகளுக்கான மேம்பட்ட கட்டமைப்பு மாதிரிகள் பற்றி கற்றுக் கொள்கிறீர்கள்.

## கற்கும் குறிக்கோள்கள்

இந்த பாடத்தின் முடிவில், நீங்கள்:
- azd கட்டமைப்பு வரிசையை ஒளிப்படுத்தி அமைப்பு முன்னுரிமைகளை புரிந்துகொள்வீர்கள்
- உலகளாவிய மற்றும் திட்ட-சார்ந்த அமைப்புகளை திறம்பட கட்டமைக்க முடியும்
- வெவ்வேறு கட்டமைப்புகளுடன் பல சுற்றுச்சூழல்களை நிர்வகிக்க முடியும்
- பாதுகாப்பான அங்கீகாரம் மற்றும் அதிகாரமளிப்பு மாதிரிகளை அமல்படுத்த முடியும்
- சிக்கலான சூழ்நிலைகளுக்கான மேம்பட்ட கட்டமைப்பு மாதிரிகளை புரிந்துகொள்வீர்கள்

## கற்கை முடிவுகள்

இந்த பாடத்தை முடித்த பிறகு, நீங்கள் செய்யலாம்:
- azd ஐ சிறந்த வளர்ச்சி பணிகளுக்கு அமைக்க
- பல பதிப்பல் சுற்றுச்சூழல்களை அமைத்து நிர்வகிக்க
- பாதுகாப்பான கட்டமைப்பு மேலாண்மை நடைமுறைகளை அமல்படுத்த
- கட்டமைப்பு தொடர்பான பிரச்சினைகளை தீர்க்க
- குறிப்பிட்ட நிறுவனர் தேவைகளுக்காக azd நடத்தை தனிப்பயனாக்க

இந்த விரிவான வழிகாட்டி Azure Developer CLI-ஐ சாத்தியமானவிதமாகத் தயாரிக்கும் மற்றும் பிரயோகம் மற்றும் வழிவழி பணிகளுக்கான உள்ளமைப்புகளை பற்றி அனைத்தையும் அலசுகிறது.

## azd திட்டத்தில் AI ஏஜென்ட்களைப் புரிந்து கொள்ளுதல்

AI ஏஜென்ட்களுக்கு நீங்கள் புதியவராக இருந்தால், azd உலகில் அவற்றைப் பற்றி சிந்திப்பதற்கான ஒரு எளிய வழி இது.

### ஏஜென்ட் என்றால் என்ன?

ஏஜென்ட் என்பது ஒரு வேண்டுகோளை பெறக்கூடிய, அதைப் பற்றி நியாயப்படுத்தும், மற்றும் செயல்பாடுகளை எடுக்கும் ஒரு மென்பொருள் பகுதி—அதுவே பெரும்பாலும் ஒரு AI மாதிரியை அழைக்கவும், தரவுகளை தேடவும், அல்லது பிற சேவைகளை அழைக்கவும் இருக்கும். azd திட்டத்தில், ஒரு ஏஜென்ட் உங்கள் வலை முன்-முகப்பு அல்லது API பின்னணியின் அருகில் இருக்கும் மற்றொரு **சேவை** மாதவன் மாதிரியாகவே இருக்கும்.

### ஏஜென்ட்கள் azd திட்ட அமைப்பில் எவ்வாறு பொருந்துகின்றன

azd திட்டம் மூன்று அடுக்குகளில் அமைக்கப்படுகிறது: **infrastructure**, **code**, மற்றும் **configuration**. ஏஜென்ட்கள் இந்த அடுக்குகளில் மற்ற எந்த சேவையும் போல் இணைக்கப்படுகின்றன:

| அடுக்கு | ஒரு பாரம்பரிய செயலிக்கு இது செய்யும் | ஒரு ஏஜென்டிற்கு இது செய்யும் |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ஒரு வலை செயலி மற்றும் தரவுத்தளத்தை வழங்குகிறது | AI மாதிரி எண்ட்பாயிண்ட், தேடல் குறியீடு, அல்லது ஏஜென்ட் ஹோஸ்டை வழங்குகிறது |
| **Code** (`src/`) | உங்கள் முன்-பகுதி மற்றும் API மூலக் குறியீட்டை கொண்டுள்ளது | உங்கள் ஏஜென்ட் லாஜிக் மற்றும் பிராம்ப்ட் வரையறைகளை கொண்டுள்ளது |
| **Configuration** (`azure.yaml`) | உங்கள் சேவைகள் மற்றும் அவற்றின் ஹோஸ்டிங் இலக்குகளை பட்டியலிடுகிறது | உங்கள் ஏஜென்டை ஒரு சேவையாக பட்டியலிட்டு, அதன் குறியீடு மற்றும் ஹோஸ்டை குறிக்கும் |

### `azure.yaml` இன் பங்கு

நீங்கள் உடனடி சினைப்பு கணக்கில் இலக்கை நினைவில் கொள்ள தேவையில்லை. கருத்துக்களில், `azure.yaml` என்பது azd-க்கு நீங்கள் சொல்லும் கோப்பு: *"இவை என் பயன்பாட்டை உருவாக்கும் சேவைகள் மற்றும் அவற்றின் குறியீட்டை எங்கே காணலாம் என்பதைக் கூறுகிறது."*

உங்கள் திட்டத்தில் ஒரு AI ஏஜென்ட் இருந்தால், `azure.yaml` அந்த ஏஜென்டை சேவைகளில் ஒன்றாக பட்டியலிடும். அதன் பிறகு azd சரியான அடித்தளத்தை வழங்குவது (உதாரணமாக Microsoft Foundry Models எண்ட்பாயிண்ட் அல்லது ஏஜென்டை ஹோஸ்ட் செய்ய ஒரு Container App போன்றவை) மற்றும் உங்கள் ஏஜென்ட் குறியீட்டை நிறுவுவது என அறிந்துகொள்கிறது—ஒரு வலை செயலி அல்லது API க்காக அது செய்வதுபோலவே.

இதன் அர்த்தம், அடிப்படையில் புதிதாக எதுவும் கற்றுக்கொள்ள தேவையில்லை. azd ஒரு வலை சேவையை எவ்வாறு நிர்வகிக்கின்றது என்பதை நீங்கள் புரிந்திருந்தால், அது ஒரு ஏஜென்டை எவ்வாறு நிர்வகிக்கும் என்பதையும் நீங்கள் ஏற்கனவே புரிந்துக்கொள்வீர்கள்.

## கட்டமைப்பு வரிசை

azd ஒரு வரிசைப்படுத்தப்பட்ட கட்டமைப்பு அமைப்பைக் கையகப்படுத்துகிறது:
1. **கமாண்டு-லைன் கொடிகள்** (உயர் முன்னுரிமை)
2. **சுற்றுச்சூழல் மாறிலிகள்**
3. **உள்ளூர் திட்ட கட்டமைப்பு** (`.azd/config.json`)
4. **கோப்பாளர் பயனர் கட்டமைப்பு** (`~/.azd/config.json`)
5. **இயல்புநிலை மதிப்புகள்** (கடுமையான முன்னுரிமை குறைந்தது)

## உலகளாவிய கட்டமைப்பு

### உலகளாவிய இயல்புகளை அமைத்தல்
```bash
# இயல்புநிலை சப்ஸ்கிரிப்ஷனை அமைக்கவும்
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# இயல்புநிலை இடத்தை அமைக்கவும்
azd config set defaults.location "eastus2"

# இயல்புநிலை வளக் குழு பெயரிடும் நடைமுறையை அமைக்கவும்
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# எல்லா உலகளாவிய கட்டமைப்புகளையும் காண்க
azd config show

# ஒரு கட்டமைப்பை நீக்கவும்
azd config unset defaults.location
```

### பொதுவான உலகளாவிய அமைப்புகள்
```bash
# வளர்ச்சி விருப்பங்கள்
azd config set alpha.enable true                    # அல்பா அம்சங்களை செயல்படுத்தவும்
azd config set telemetry.enabled false             # டெலிமெட்ரியை முடக்கவும்
azd config set output.format json                  # வெளியீட்டு வடிவத்தை அமைக்கவும்

# பாதுகாப்பு அமைப்புகள்
azd config set auth.useAzureCliCredential true     # அங்கீகத்திற்காக Azure CLI ஐ பயன்படுத்தவும்
azd config set tls.insecure false                  # TLS சரிபார்ப்பை கட்டாயப்படுத்தவும்

# செயல்திறன் சீரமைப்பு
azd config set provision.parallelism 5             # ஒரே நேரத்தில் வளங்கள் உருவாக்குதல்
azd config set deploy.timeout 30m                  # பயன்படுத்தல் நேர வரம்பு
```

## 🏗️ திட்ட கட்டமைப்பு

### `azure.yaml` அமைப்பு
`azure.yaml` கோப்பு உங்கள் azd திட்டத்தின் நெஞ்சாகும்:

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

### சேவை கட்டமைப்பு விருப்பங்கள்

#### ஹோஸ்ட் வகைகள்
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

#### மொழி-சார்ந்த அமைப்புகள்
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

## 🌟 சுற்றுச்சூழல் மேலாண்மை

### சுற்றுச்சூழல்களை உருவாக்குதல்
```bash
# ஒரு புதிய சூழலை உருவாக்கவும்
azd env new development

# குறிப்பிட்ட இடத்துடன் உருவாக்கவும்
azd env new staging --location "westus2"

# வார்ப்புருவிலிருந்து உருவாக்கவும்
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### சுற்றுச்சூழல் கட்டமைப்பு
ஒவ்வொரு சுற்றுச்சூழலுக்கும் தனித்தனியான கட்டமைப்பு `.azure/<env-name>/config.json` இல் இருக்கும்:

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

### சுற்றுச்சூழல் மாறிலிகள்
```bash
# சூழலுக்கேற்ப மாறிலிகளை அமைக்கவும்
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# சூழல் மாறிலிகளை காண்க
azd env get-values

# எதிர்பார்க்கப்படும் வெளியீடு:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# சூழல் மாறியை நீக்கவும்
azd env unset DEBUG

# நீக்கப்பட்டதை சரிபார்க்கவும்
azd env get-values | grep DEBUG
# (எதுவும் திருப்பப்படாது)
```

### சுற்றுச்சூழல் வார்ப்புருக்கள்
ஒத்த சுற்றுச்சூழல் அமைப்பிற்காக `.azure/env.template` உருவாக்கவும்:
```bash
# தேவையான மாறிகள்
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# பயன்பாட்டு அமைப்புகள்
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# விருப்பமான மேம்பாட்டு அமைப்புகள்
DEBUG=false
LOG_LEVEL=info
```

### ஒரு குழுவில் சுற்றுச்சூழல்களை பகிர்தல்

ஒரு திட்டத்தில் ஒரருக்கும் மேற்பட்டோர் வேலை செய்கிறபோது, நீங்கள் **எது ரெப்போவுடன் பயணிக்கிறது மற்றும் எது உள்ளூரில் நிலவுகிறது** என்பதை ஒப்புக்கொள்ள வேண்டும். azd ஒவ்வொரு சுற்றுச்சூழலையும் `.azure/` கோப்பகத்தில் வைக்கிறது, மற்றும் அதில் எல்லாவற்றையும் commit செய்யக்கூடாது.

**`.azure/`-இல் என்ன இருக்கிறது:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**எதை gitignore செய்ய வேண்டும்.** azd இன் இயல்புநிலை `.gitignore` ஏற்கனவே `.azure/` ஐ தவிர்க்கும். அதை அப்படியே வைத்திருங்கள் — `.env` கோப்புகள் ரகசியங்களை கொண்டிருக்கலாம், மற்றும் resource IDs அவற்றை provision செய்தவருக்கே சொந்தமானவை. ஒவ்வொரு குழு உறுப்பினரும் தங்கள் **தனியார்** சுற்றுச்சூழலை உள்ளகமாக உருவாக்குவர்:

```bash
# ஒவ்வொரு டெவலப்பரும் தங்கள் தனிமைப்படுத்தப்பட்ட சூழலைப் பெற இதை ஒருமுறை இயக்குவர்
azd env new dev-alice
azd up
```

**சுற்றுச்சூழல்களை மாறுதல் செய்வது.** பல சுற்றுச்சூழல்களை நிர்வகிக்கும் ஒரு டெவலப்பர் கட்டளைகளை இயக்குவதற்கு முன் சரிபார்க்கும் செயலைத் தேர்ந்தெடுக்கிறான்:

```bash
azd env list                 # அனைத்து உள்ளூர் சூழல்களையும் மற்றும் எது இயல்புநிலையாக உள்ளது என்பதை காண்க
azd env select staging       # 'staging' ஐ செயலில் உள்ள சூழலாக மாற்றவும்
azd env get-values           # நீங்கள் சரியான ஒன்றில் உள்ளீர்கள் என்பதை உறுதிசெய்க
```

**குழுவிற்கு ரகசியமல்லாத இயல்புகளை வழங்குதல்.** ஒரு வார்ப்புருவை commit (மேலே உள்ள `.azure/env.template` போன்றது) செய்வதன் மூலம் ஒவ்வொருவரும் எந்த மாறிலிகளை அமைக்க வேண்டும் என்பதைக் தெரிந்துகொள்வார்கள்—ஆனால் நிரப்பப்பட்ட மதிப்புகளை決ுவதில் commit செய்ய வேண்டாம். புதிய குழு உறுப்பினர்கள் வார்ப்புருவை நகலெடுத்து தங்கள் சொந்த மதிப்புகளை நிரப்புகிறார்கள்.

**CI/CD இல் சுற்றுச்சூழல்கள்.** पाइப்லைன்கள் உங்கள் உள்ளூர் `.azure/` கோப்பகத்தைப் படிக்காது. பதிலாக, சுற்றுச்சூழல் மதிப்புகளை pipeline மாறிலிகள்/ரகசியங்கள் ஆக வழங்குங்கள், மற்றும் azd அவற்றை செயல்முறை சுற்றுச்சூழலிலிருந்து படிக்கிறது:

```bash
# CI-யில், azd இவற்றை சூழல் மாறில்களிலிருந்து வாசிக்கிறது, .azure/ இலிருந்து அல்ல.
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **வழக்கமான விதி:** infrastructure code (`infra/`, `azure.yaml`) Git இல் பகிரப்படுகிறது; சுற்றுச்சூழல் *நிலையும் மற்றும் ரகசியங்களும்* (`.azure/`) ஒவ்வொரு டெவலப்பருக்கும் மற்றும் ஒவ்வொரு பைப்ப்லைனுக்கும் தனித்துவமானவையாக இருக்கும். `azd pipeline config` உங்கள் க்கான pipeline மாறிலிகளை தானியங்கியே அமைக்கிறது.

## 🔐 அங்கீகாரம் கட்டமைப்பு

### Azure CLI ஒருங்கிணைப்பு
```bash
# Azure CLI சான்றிதழ்களைப் பயன்படுத்தவும் (இயல்புநிலை)
azd config set auth.useAzureCliCredential true

# குறிப்பிட்ட டெனன்ட் மூலம் உள்நுழைக
az login --tenant <tenant-id>

# இயல்புநிலை சப்ஸ்க்ரிப்ஷனை அமைக்கவும்
az account set --subscription <subscription-id>
```

### Service Principal அங்கீகாரம்
CI/CD பைப்ப்லைன்களுக்கு:
```bash
# சுற்றுச்சூழல் மாறில்களை அமைக்கவும்
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# அல்லது நேரடியாக அமைக்கவும்
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### நிர்வகிக்கப்பட்ட அடையாளம்
Azure-இல் ஹோஸ்ட் செய்யப்பட்ட சூழ்நிலைகள் க்காக:
```bash
# நிர்வகிக்கப்படும் அடையாள அங்கீகாரத்தை செயல்படுத்தவும்
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ அடித்தளம் கட்டமைப்பு

### Bicep அளவுருக்கள்
அடித்தள அளவுருக்களை `infra/main.parameters.json` இல் அமைக்க:
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

### Terraform கட்டமைப்பு
Terraform திட்டங்களுக்கு, `infra/terraform.tfvars` இல் அமைக்க:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 பிறப்படுத்தும்/நிறுவல் கட்டமைப்பு

### Build கட்டமைப்பு
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

### Docker கட்டமைப்பு
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

## 🔧 மேம்பட்ட கட்டமைப்பு

### விருப்பவழி வள பெயரிடல்
```bash
# பெயரிடும் நெறிமுறைகளை அமைக்க
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### நெட்வொர்க் கட்டமைப்பு
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### மேற்பார்வை கட்டமைப்பு
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

## 🎯 சுற்றுச்சூழலுக்கு சிறப்பு கட்டமைப்புகள்

### வளர்ச்சி சுற்றுச்சூழல்
```bash
# .azure/வளர்ச்சி/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### மத்திய நிலை சுற்றுச்சூழல்
```bash
# .azure/ஸ்டேஜிங்/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### உற்பத்தி சுற்றுச்சூழல்
```bash
# .azure/உற்பத்தி/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 கட்டமைப்பு சோதனை

### கட்டமைப்பை சரிபார்க்கவும்
```bash
# கட்டமைப்பு இலக்கணத்தை சரிபார்க்கவும்
azd config validate

# சூழல் மாறிலிகளை சோதிக்கவும்
azd env get-values

# அடிப்படை கட்டமைப்பைச் சரிபார்க்கவும்
azd provision --dry-run
```

### கட்டமைப்பு ஸ்கிரிப்ட்கள்
சரிபார்ப்பு ஸ்கிரிப்ட்களை `scripts/` இல் உருவாக்கவும்:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# தேவையான சுற்றுச்சூழல் மாறிலிகளை சரிபார்க்கவும்
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml கோப்பின் இலக்கணம் சரிபார்க்கவும்
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 சிறந்த முறைகள்

### 1. சுற்றுச்சூழல் மாறிலிகளைப் பயன்படுத்தவும்
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. கட்டமைப்பு கோப்புகளை ஒழுங்குபடுத்து
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

### 3. பதிப்பு கட்டுப்பாடு குறித்து கவனிக்கவேண்டியது
```bash
# .gitignore
.azure/*/config.json         # சுற்றுச்சூழல் கட்டமைப்புகள் (வள அடையாளங்கள் அடங்கும்)
.azure/*/.env               # சுற்றுச்சூழல் மாறிலிகள் (ரகசியங்களை கொண்டிருக்கலாம்)
.env                        # உள்ளூர் சுற்றுச்சூழல் கோப்பு
```

### 4. கட்டமைப்பு ஆவணமிடல்
உங்கள் கட்டமைப்பை `CONFIG.md` இல் ஆவணமிடவும்:
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

## 🎯 கையாள்திறன் பயிற்சி பயிற்சிகள்

### பயிற்சி 1: பல-சுற்றுச்சூழை கட்டமைப்பு (15 நிமிடங்கள்)

**நோக்கம்**: வெவ்வேறு அமைப்புகளுடன் மூன்று சுற்றுச்சூழல்களை உருவாக்கி மற்றும் கட்டமைக்கவும்

```bash
# வளர்ச்சி சூழலை உருவாக்கவும்
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# இடைநிலை சூழலை உருவாக்கவும்
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# உற்பத்தி சூழலை உருவாக்கவும்
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ஒவ்வொரு சூழலையும் சரிபார்க்கவும்
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**வெற்றி விதிகள்:**
- [ ] மூன்று சுற்றுச்சூழல்களும் வெற்றிகரமாக உருவாக்கப்பட்டவை
- [ ] ஒவ்வொரு சுற்றுச்சூழலுக்கும் தனித்துவமான கட்டமைப்பு இருக்கிறது
- [ ] பிழைகள் தராமே சுற்றுச்சூழல்களை மாறலாம்
- [ ] `azd env list` மூன்று சுற்றுச்சூழல்களையும் காட்டுகிறது

### பயிற்சி 2: ரகசிய மேலாண்மை (10 நிமிடங்கள்)

**நோக்கம்**: நுணுக்கமான தரவுகளுடன் பாதுகாப்பான கட்டமைப்பைப் பயிற்சி செய்தல்

```bash
# ரகசியங்களை அமைக்கவும் (வெளியீட்டில் காட்டப்படாது)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ரகசியமற்ற கட்டமைப்பை அமைக்கவும்
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# சூழலைப் பார்க்கவும் (ரகசியங்கள் மறைக்கப்பட வேண்டும்)
azd env get-values

# ரகசியங்கள் சேமிக்கப்பட்டுள்ளதா என்பதை சரிபார்க்கவும்
azd env get DB_PASSWORD  # உண்மையான மதிப்பைக் காட்ட வேண்டும்
```

**வெற்றி விதிகள்:**
- [ ] ரகசியங்கள் டெர்மினலில் காட்டப்படாமல் சேமிக்கப்பட்டன
- [ ] `azd env get-values` ரகசியங்களை மறைத்துக் காட்டுகிறது
- [ ] தனித்தனி `azd env get <SECRET_NAME>` உண்மையான மதிப்பை பெறுகிறது

## அடுத்த படிகள்

- [Your First Project](first-project.md) - நடைமுறையில் கட்டமைப்பை பயன்படுத்தவும்
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - வெளியிடுவதற்கான கட்டமைப்பைப் பயன்படுத்தவும்
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - தயார்நிலை-தக்க கட்டமைப்புகள்

## மூலக்குறிப்புகள்

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**அத்தியாய வழிசெலுத்தல்:**
- **📚 பாடநெறி முகப்பு**: [AZD For Beginners](../../README.md)
- **📖 தற்போதைய அத்தியாயம்**: Chapter 3 - Configuration & Authentication
- **⬅️ முந்தையது**: [Your First Project](first-project.md)
- **➡️ அடுத்த அத்தியாயம்**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **அடுத்த பாடம்**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**மறுப்பு**:
இந்த ஆவணம் AI மொழிபெயர்ப்பு சேவை [Co-op Translator](https://github.com/Azure/co-op-translator) பயன்படுத்தி மொழிபெயர்க்கப்பட்டுள்ளது. நாங்கள் துல்லியத்திற்காக முயற்சி செய்துள்ளோம், ஆனால் தானாக செய்யப்படும் மொழிபெயர்ப்புகளில் பிழைகள் அல்லது தவறுகள் இருக்கலாம் என்பதை கவனத்தில் கொள்ளவும். அசல் ஆவணம் அதன் தாய்மொழியில் அதிகாரப்பூர்வ ஆதாரமாக கருதப்பட வேண்டும். முக்கியமான தகவல்களுக்கு, தொழில்நுட்பமான மனித மொழிபெயர்ப்பு பரிந்துரைக்கப்படுகிறது. இந்த மொழிபெயர்ப்பைப் பயன்படுத்துவதால் ஏற்படும் எந்த தவறான புரிதல்கள் அல்லது தவறான விளக்கத்திற்கும் நாங்கள் பொறுப்பில்வில்லை.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->