# ക്രമീകരണ മാർഗ്ഗനിർദ്ദേശം

**അധ്യായ ന Bevീഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 3 - ക്രമീകരണവും പ്രാമാണീകരണവും
- **⬅️ മുമ്പത്തെ**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md)
- **➡️ അടുത്തത്**: [പ്രവർത്തന മാർഗ്ഗനിർദ്ദേശം](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 അടുത്ത അധ്യായം**: [അധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ്](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

ഈ സമഗ്രമായ മാർഗ്ഗനിർദ്ദേശം Azure Developer CLI യെ ഉത്തമ വികസനവും വിന്യാസ പ്രവർത്തനങ്ങളിൽ ഉപയോഗിക്കാൻ വേണ്ടിയുള്ള എല്ലാ ഘടകങ്ങളും ഉൾക്കൊള്ളുന്നു. ക്രമീകരണ പദവികൾ, പരിസ്ഥിതിവിവരശേഷി, പ്രാമാണീകരണ രീതികൾ, സമർത്ഥവും സുരക്ഷിതവുമായ Azure വിന്യാസങ്ങൾക്ക് സഹായകമായുതീര്‍ക്കപെട്ട കാര്യങ്ങൾ എല്ലാം നിങ്ങൾ പഠിക്കും.

## പഠന ലക്‌ഷ്യങ്ങൾ

ഈ പാഠം കഴിഞ്ഞാൽ, നിങ്ങൾക്ക് സാധിക്കും:
- azd ക്രമീകരണ പദവികൾ അടുക്കളഞ്ഞ അറിവ് നേടാനും ക്രമീകരണങ്ങളെ മുൻ‌തൂക്കം നൽകുന്നതിനുള്ള രീതികൾ മനസിലാക്കാനും
- ആഗോളവും പ്രോജക്റ്റ്-സ്പെസിഫിക് ക്രമീകരണങ്ങളും ഫലപ്രദമായി സജ്ജീകരിക്കാൻ
- വ്യത്യസ്ത ക്രമീകരണങ്ങളുള്ള നിരവധി പരിസ്ഥിതികൾ നിർവഹിക്കാൻ
- സുരക്ഷിതമായ പ്രാമാണീകരണവും അധികാര നിവര്‍ത്തന രീതികളും നടപ്പാക്കാൻ
- സമന്വിത സ്ഥാനങ്ങളിൽ സമർത്ഥമായ ക്രമീകരണ മാതൃകകൾ മനസ്സിലാക്കാൻ

## പഠന ഫലങ്ങൾ

ഈ പാഠം കഴിഞ്ഞാൽ, നിങ്ങൾക്കാകും:
- കഴിവാർന്ന വികസന പ്രവൃത്തിതന്ത്രങ്ങൾക്കായി azd ക്രമീകരിക്കാനും
- ഒന്നിലധികം വിന്യാസ പരിസ്ഥിതികൾ സജ്ജീകരിച്ച് നിയന്ത്രിക്കാനും
- സുരക്ഷിത ക്രമീകരണ നടത്തിപ്പ് പ്രാക്ടീസുകൾ നടപ്പാക്കാനും
- ക്രമീകരണ സംബന്ധമായ പ്രശ്നങ്ങൾ പരിഹരിക്കാനും
- പ്രത്യേക സംഘടനാ ആവശ്യങ്ങൾക്കായി azd പെരുമാറ്റം നിയന്ത്രിക്കാനും

ഈ സമഗ്രമായ മാർഗ്ഗനിർദ്ദേശം Azure Developer CLI യെ ഉത്തമ വികസനവും വിന്യാസ പ്രവർത്തനങ്ങളിൽ ഉപയോഗിക്കാൻ വേണ്ടിയുള്ള എല്ലാ ഘടകങ്ങളും ഉൾക്കൊള്ളുന്നു.

## azd പ്രോജക്റ്റിൽ AI ഏജന്റുകളെ കുറിച്ച് മനസിലാക്കൽ

AI ഏജന്റുകളിൽ പുതുമങ്കൽമാണ് എങ്കിൽ, azdലോകത്ത് അവയെ қалай പരിഗണിക്കാമെന്ന് ഒരു സരളമായ രീതിയിലുള്ള വിവരണം ഇതാ.

### ഏജന്റ് എന്താണ്?

ഒരു ഏജന്റ് ഒരു സോഫ്റ്റ്‌വെയർ ഭാഗമാണ്, അത് അഭ്യർത്ഥന ഒരു ക്രമീകരണം പ്രാപിച്ച് അതിനെ വിവേകിച്ച് പ്രവര്‍ത്തനങ്ങൾ കൈകൊള്ളുന്നു—അധികമായി AI മോഡൽ വിളിച്ചാൽ, ഡാറ്റ അന്വേഷിച്ചാൽ അല്ലെങ്കിൽ മറ്റ് സേവനങ്ങൾ പ്രവർത്തിപ്പിച്ചാലും. azd പ്രോജക്റ്റിൽ, ഏജന്റ് നിങ്ങളുടെ വെബ് ഫ്രണ്ട്‌എൻഡ് അല്ലെങ്കിൽ API ബാക്ക്‌എൻഡിനൊപ്പം മറ്റൊരു **സേവനം** ആണ്.

### ഏജന്റുകൾ azd പ്രോജക്റ്റ് ഘടനയിൽ എങ്ങനെ ഇടംപിടിക്കുന്നു

azd പ്രോജക്റ്റ് മൂന്ന് പാളികളിൽ നിർമ്മിച്ചിരിക്കുന്നു: **ഇൻഫ്രാസ്ട്രക്ചർ**, **കോഡ്**, **ക്രമീകരണം**. ഏജന്റുകൾ ഈ പാളികളിലേക്ക് മറ്റ് സേവനങ്ങളായി ഇടംപിടിക്കുന്നു:

| പാളി | ഒരു പരമ്പരാഗത ആപ്പ് ചെയ്യുന്നത് | ഒരു ഏജന്റ് ചെയ്യുന്നത് |
|-------|-----------------------------|---------------------|
| **ഇൻഫ്രാസ്ട്രക്ചർ** (`infra/`) | ഒരു വെബ് ആപ്പ്, ഡാറ്റാബേസ് പ്രൊവിഷൻ ചെയ്യുന്നു | AI മോഡൽ എ倒ിൻഡ് പോയിന്റ്, സെർച്ച് ഇൻഡക്സ് അല്ലെങ്കിൽ ഏജന്റ് ഹോസ്റ്റ് ലഭ്യമാക്കുന്നു |
| **കോഡ്** (`src/`) | നിങ്ങളുടെ ഫ്രണ്ട്‌എൻഡ്, API സോഴ്‌സ് കോഡ് ഉൾക്കൊള്ളുന്നു | ഏജന്റിന്റെ ലജിക്, പ്രോംപ്റ്റ് നിർവചനങ്ങൾ ഉൾക്കൊള്ളുന്നു |
| **ക്രമീകരണം** (`azure.yaml`) | നിങ്ങളുടെ സേവനങ്ങളും അവയുടെ ഹോസ്റ്റിംഗ് ലക്ഷ്യങ്ങളും ലിസ്റ്റ് ചെയ്യുന്നു | ഏജന്റ് ഒരു സേവനമായി ലിസ്റ്റ് ചെയ്യുന്നു, അതിന്റെ കോഡും ഹോസ്തും സൂചിപ്പിക്കുന്നു |

### `azure.yaml` റോളും പ്രാധാന്യവും

സെന്റാക്സ് ഇപ്പോൾ ഓർമ്മിക്കേണ്ടതില്ല. ആശയപരമായി, azd-ന് കുറിപ്പിച്ചിരിക്കുന്നത് `azure.yaml` എന്ന ഫയൽ എന്നാണ്: *"ഇവയാണ് എൻറെ ആപ്പിലെ സേവനങ്ങൾ, അവയുടെ കോഡ് എവിടെ നിന്നു കിട്ടും."*

നിങ്ങളുടെ പ്രോജക്റ്റിൽ AI ഏജന്റ് ഉണ്ടായാൽ, `azure.yaml` സേവനങ്ങളിൽ ഇത് ഉൾപ്പെടുത്തും. azd അനുസരിച്ച് Microsoft Foundry Models പോ인트് അല്ലെങ്കിൽ ഏജന്റ് ഹോസ്റ്റുചെയ്യുന്ന കോൺടെയ്നർ ആപ്പ് പോലുള്ള ശരിയായ ഇൻഫ്രാസ്ട്രക്ചർ പ്രൊവിഷൻ ചെയ്ത്, ഏജന്റ് കോഡ് വിന്യസിക്കും—വെബ് ആപ്പ് അല്ലെങ്കിൽ API പോലെ.

അതായത് പുതിയ എന്തും സ്വാഭാവികമായി പഠിക്കേണ്ടതില്ല. azd ഒരു വെബ് സേവനം എങ്ങനെയാണ് കൈകാര്യം ചെയ്യുന്നത്, ഒരു ഏജന്റിന് അതുപോലെ തന്നെ മാതൃകയാണ്.

## ക്രമീകരണ പദവി

azd ഒരു പദവിക്രമ ക്രമീകരണ സംവിധാനം ഉപയോഗിക്കുന്നു:
1. **കമാൻഡ്-ലൈൻ ഫ്ലാഗുകൾ** (ഏറ്റവും മുൻഗണന)
2. **പരിസ്ഥിതി വേരിയബിളുകൾ**
3. **പ്രാദേശിക പ്രോജക്റ്റ് ക്രമീകരണം** (`.azd/config.json`)
4. **ആഗോള ഉപയോക്തൃ ക്രമീകരണം** (`~/.azd/config.json`)
5. **പൂരക മൂല്യങ്ങൾ** (അടിയന്തരമായ ഏറ്റവും താഴ്ന്ന മുൻഗണന)

## ആഗോള ക്രമീകരണം

### ആഗോള പൂർവ്വനിർണയങ്ങൾ സജ്ജീകരിക്കൽ
```bash
# ഡീഫോൾട്ട് സബ്‌സ്‌ക്രിപ്ഷൻ സജ്ജമാക്കുക
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ഡീഫോൾട്ട് ലൊക്കേഷൻ സജ്ജമാക്കുക
azd config set defaults.location "eastus2"

# ഡീഫോൾട്ട് റിസോഴ്‌സ് ഗ്രൂപ്പ് നാമകരണമുറികളായി സജ്ജമാക്കുക
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# എല്ലാ ഗ്ലോബൽ കോൺഫിഗറേഷൻ കാണുക
azd config show

# ഒരു കോൺഫിഗറേഷൻ നീക്കംചെയ്യുക
azd config unset defaults.location
```

### പൊതുവായ ആഗോള ക്രമീകരണങ്ങൾ
```bash
# ഡിവലപ്മെന്റ് പരാമർശങ്ങൾ
azd config set alpha.enable true                    # ആൽഫ ഫീച്ചറുകൾ സജീവമാക്കുക
azd config set telemetry.enabled false             # ടെലിമെട്രി അപ്രാപ്യമാക്കുക
azd config set output.format json                  # ഔട്ട്പുട്ട് ഫോർമാറ്റ് സജ്ജമാക്കുക

# സുരക്ഷാ ക്രമീകരണങ്ങൾ
azd config set auth.useAzureCliCredential true     # ഓത്തിനായി Azure CLI ഉപയോഗിക്കുക
azd config set tls.insecure false                  # TLS പരിശോധന നഷ്ടമാക്കുക

# പ്രകടനം യോഗ്യത
azd config set provision.parallelism 5             # സമാന്തര വിഭവ നിർമ്മാണം
azd config set deploy.timeout 30m                  # വിന്യസന സമയം പരിധി
```

## 🏗️ പ്രോജക്റ്റ് ക്രമീകരണം

### azure.yaml ഘടന
`azure.yaml` ഫയൽ നിങ്ങളുടെ azd പ്രോജക്റ്റിന്റെ ഹൃദയമാണ്:

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

### സേവന ക്രമീകരണ ഓപ്ഷനുകൾ

#### ഹോസ്റ്റ് തരം
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

#### ഭാഷ-പ്രത്യേക ക്രമീകരണങ്ങൾ
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

## 🌟 പരിസ്ഥിതി മാനേജ്‌മെന്റ്

### പരിസ്ഥിതികൾ സൃഷ്‌ടിക്കൽ
```bash
# പുതിയ പരിതസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new development

# പ്രത്യേക സ്ഥിതിയിൽ സൃഷ്‌ടിക്കുക
azd env new staging --location "westus2"

# ടെംപ്ലേറ്റിൽ നിന്നും സൃഷ്‌ടിക്കുക
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### പരിസ്ഥിതി ക്രമീകരണം
ഓരോ പരിസ്ഥിതിക്കും അവയുടെ സ്വന്തം `.azure/<env-name>/config.json` ഫയൽ ഉണ്ട്:

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

### പരിസ്ഥിതി വേരിയബിളുകൾ
```bash
# പരിസ്ഥിതിയുമായി ബന്ധപ്പെട്ട വ്യത്യസ്ഥ ചോദ്യങ്ങൾ സജ്ജമാക്കുക
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# പരിസ്ഥിതി ചോദ്യങ്ങൾ കാണുക
azd env get-values

# പ്രതീക്ഷിക്കുന്ന ഔട്ട്‌പുട്ട്:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# പരിസ്ഥിതി ചോദ്യങ്ങൾ നീക്കം ചെയ്യുക
azd env unset DEBUG

# നീക്കം ചെയ്തിരിക്കുന്നത് പരിശോസ് ിക്കുക
azd env get-values | grep DEBUG
# (ഒന്നും തിരികെ നല്‍കണം)
```

### പരിസ്ഥിതി ടെംപ്ലേറ്റുകൾ
ഏകോപിച്ച് പരിസ്ഥിതി സജ്ജീകരിക്കാൻ `.azure/env.template` സൃഷ്ടിക്കുക:
```bash
# ആവശ്യമായ വ്യതിയാനങ്ങൾ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# അപ്ലിക്കേഷൻ ക്രമീകരണങ്ങൾ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ഐച്ഛിക വികസന ക്രമീകരണങ്ങൾ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 പ്രാമാണീകരണ ക്രമീകരണം

### Azure CLI സംയോജനം
```bash
# ഏഴ്ർ CLI ക്രെഡൻഷ്യലുകൾ ഉപയോഗിക്കുക (ഡിഫോൾട്ട്)
azd config set auth.useAzureCliCredential true

# പ്രത്യേക ടെന്നന്റ് ഉപയോഗിച്ച് ലോഗിൻ ചെയ്യുക
az login --tenant <tenant-id>

# ഡിഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
az account set --subscription <subscription-id>
```

### സർവീസ് പ്രിൻസിപ്പൽ പ്രാമാണീകരണം
CI/CD പൈപ്പ്ലൈനുകൾക്കായി:
```bash
# പരിസ്ഥിതിവാരിയബിളുകൾ സജ്ജമാക്കുക
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# അല്ലെങ്കിൽ നേരിട്ട് ക്രമീകരിക്കുക
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### മാനേജഡ് ഐഡന്റിറ്റി
Azure ഹോസ്തുചെയ്യുന്ന പരിസ്ഥിതികൾക്കായി:
```bash
# മാനേജ്ഡ് ഐഡന്റിറ്റി പ്രമാണീകരണം സജ്ജമാക്കുക
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ഇൻഫ്രാസ്ട്രക്ചർ ക്രമീകരണം

### ബൈസിപ് പാരാമീറ്ററുകൾ
ഇൻഫ്രാസ്ട്രക്ചർ പാരാമീറ്ററുകൾ `infra/main.parameters.json` ൽ ക്രമീകരിക്കുക:
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

### ടെറാഫോം ക്രമീകരണം
ടെറാഫോം പ്രോജക്റ്റുകൾക്കായി, `infra/terraform.tfvars` ൽ ക്രമീകരിക്കുക:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 വിന്യാസം ക്രമീകരണം

### ബിൽഡ് ക്രമീകരണം
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

### ഡോക്കർ ക്രമീകരണം
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
ഉദാഹരണ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 തുടർ ക്രമീകരണം

### കസ്റ്റം റിസോഴ്‌സ് നാമകരണം
```bash
# പേരിടൽ നിബന്ധനകൾ ക്രമീകരിക്കുക
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### നെറ്റ്‌വർക്ക് ക്രമീകരണം
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### മോണിറ്ററിംഗ് ക്രമീകരണം
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

## 🎯 പരിസ്ഥിതി-പ്രത്യേക ക്രമീകരണങ്ങൾ

### വികസന പരിസ്ഥിതി
```bash
# .അസ്യൂര്‍/ഡവലപ്പ്മെന്റ്/.എന്‍വ്
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### സ്റ്റേജിംഗ് പരിസ്ഥിതി
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ഉൽപ്പാദന പരിസ്ഥിതി
```bash
# .ആജുറെ/പ്രൊഡക്ഷൻ/.എൻവി
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ക്രമീകരണ സാധുതാപ്രമാണനം

### ക്രമീകരണം സാധുതാപ്രമാണിക്കുക
```bash
# കോൺഫിഗറേഷൻ സിന്റാക്സ് പരിശോധിക്കുക
azd config validate

# പരിസ്ഥിതി വ്യത്യാസങ്ങൾ പരീക്ഷിക്കുക
azd env get-values

# അടിസ്ഥാനസൌകര്യങ്ങൾ സാധൂകരിക്കുക
azd provision --dry-run
```

### ക്രമീകരണ സ്‌ക്രിപ്റ്റുകൾ
`scripts/` ൽ സാധുതാ സ്‌ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കുക:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ആവശ്യമായ പരിസ്ഥിതി വ്യത്യസ്ഥങ്ങൾ പരിശോധിക്കുക
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml സിന്താക്സ് പരിശോധിക്കുക
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 മികച്ച ആചാരങ്ങൾ

### 1. പരിസ്ഥിതി വേരിയബിളുകൾ ഉപയോഗിക്കുക
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ക്രമീകരണ ഫയലുകൾ ക്രമീകരിക്കുക
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

### 3. പതിപ്പ് നിയന്ത്രണ പാതി
```bash
# .gitignore
.azure/*/config.json         # പരിസ്ഥിതി കോൺഫിഗറേഷൻസ് (റിസോഴ്‌സ് ഐഡികള്‍ അടങ്ങിയിരിക്കുന്നു)
.azure/*/.env               # പരിസ്ഥിതി വ്യത്യസ്തങ്ങൾ (രഹസ്യങ്ങൾ അടങ്ങിയിരിക്കാം)
.env                        # ലോക്കൽ പരിസ്ഥിതി ഫയൽ
```

### 4. ക്രമീകരണ രേഖപ്പെടുത്തൽ
`CONFIG.md` ൽ നിങ്ങളുടെ ക്രമീകരണം രേഖപ്പെടുത്തുക:
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

## 🎯 കൈവിരൽ പരിശീലന അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: മൾട്ടി-പരിസ്ഥിതി ക്രമീകരണം (15 മിനിറ്റ്)

**ലക്ഷ്യം**: വ്യത്യസ്ത ക്രമീകരണങ്ങളോടുകൂടെ മൂന്ന് പരിസ്ഥിതികൾ സൃഷ്ടിക്കുകയും ക്രമീകരിക്കയും ചെയ്യുക

```bash
# ഡെവലപ്‌മെന്റ് പരിസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# പ്രൊഡക്ഷൻ പരിസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ഓരോ പരിസരവും സ്ഥിരീകരിക്കുക
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**വിജയകരമായ മാനദണ്ഡങ്ങൾ:**
- [ ] മൂന്ന് പരിസ്ഥിതികൾ വിജയകരമായി സൃഷ്ടിച്ചു
- [ ] ഓരോ പരിസ്ഥിതിക്കും വ്യത്യസ്ത ക്രമീകരണം ഉണ്ട്
- [ ] പരിസ്ഥിതികൾക്കിടയിൽ മാറ്റുമ്പോൾ പിഴവുകൾ ഉണ്ടാകരുത്
- [ ] `azd env list` എല്ലാ മൂന്ന് പരിസ്ഥിതികളും പ്രദർശിപ്പിക്കുന്നു

### അഭ്യാസം 2: രഹസ്യ മാനേജ്‌മെന്റ് (10 മിനിറ്റ്)

**ലക്ഷ്യം**: സെൻസിറ്റീവ് ഡാറ്റ ഉപയോഗിച്ച് സുരക്ഷിത ക്രമീകരണം നേരിട്ട് പരിശീലിക്കുക

```bash
# രഹസ്യങ്ങൾ സജ്ജമാക്കുക (ഔട്ട്പുട്ടിൽ പ്രദർശിപ്പിക്കില്ല)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# രഹസ്യമല്ലാത്ത ക്രമീകരണങ്ങൾ സജ്ജമാക്കുക
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# പരിസ്ഥിതി കാണുക (രഹസ്യങ്ങൾ മായ്ച്ചിരിക്കണം)
azd env get-values

# രഹസ്യങ്ങൾ സഞ്ചയിച്ചിട്ടുണ്ടോ എന്ന് പരിശോധിക്കുക
azd env get DB_PASSWORD  # യഥാർത്ഥമൂല്യം കാണിക്കണം
```

**വിജയകരമായ മാനദണ്ഡങ്ങൾ:**
- [ ] രഹസ്യങ്ങൾ ടെർമിനലിൽ കാണിക്കാതെ സഞ്ചയിച്ചു
- [ ] `azd env get-values` റിഡാക്ടഡ് രഹസ്യങ്ങൾ കാണിക്കുന്നു
- [ ] വ്യത്യസ്ത `azd env get <SECRET_NAME>` യഥാർത്ഥ മൂല്യങ്ങൾ കൈമാറുന്നു

## അടുത്ത പടികൾ

- [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md) - പ്രായോഗികമായി ക്രമീകരണം പ്രയോഗിക്കുക
- [പ്രവർത്തന മാർഗ്ഗനിർദ്ദേശം](../chapter-04-infrastructure/deployment-guide.md) - വിന്യാസത്തിന് ക്രമീകരണം ഉപയോഗിക്കുക
- [ക്ഷമതാ വിഭവങ്ങൾ](../chapter-04-infrastructure/provisioning.md) - ഉൽപ്പാദന-സജ്ജമായ ക്രമീകരണങ്ങൾ

## റഫറൻസുകൾ

- [azd ക്രമീകരണ റഫറൻസ്](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml സ്കീമ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [പരിസ്ഥിതി വേരിയബിളുകൾ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**അധ്യായ ന Bevീഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അധ്യായം**: അധ്യായം 3 - ക്രമീകരണവും പ്രാമാണീകരണവും
- **⬅️ മുമ്പത്തെ**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md)
- **➡️ അടുത്ത അധ്യായം**: [അധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ അസ്കോഡ്](../chapter-04-infrastructure/deployment-guide.md)
- **അടുത്ത പാഠം**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ഡിസ്ക്ലെയിമര്‍**:  
ഈ ഡോക്യുമെന്റ് AI വിവര്‍ത്തന സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് വിവര്‍ത്തനം ചെയ്തതാണ്. ഞങ്ങള്‍ കൃത്യതക്ക് ശ്രമിക്കുന്നുവെങ്കിലും, സ്വയംകരുത്തുള്ള വിവര്‍ത്തനങ്ങളില്‍ പിശകുകള്‍ അല്ലെങ്കില്‍ തത്വസമ്മതവ്യത്യാസങ്ങള്‍ ഉണ്ടാകാമെന്ന് ദയവായി മനസിലാക്കുക. മാതൃഭൂരിഭാഷയിലുള്ള ആദ്യ ഡോക്യുമെന്റ് ആധികാരിക ഉറവിടമായി കണക്കാക്കപ്പെടണം. സുപ്രധാന വിവരങ്ങള്‍ക്കായി, പ്രൊഫഷനല്‍ മാനവ വിവര്‍ത്തനം ശിപാര്‍ശ ചെയ്യപ്പെടുന്നു. ഈ വിവര്‍ത്തന ഉപയോഗത്തില്‍ നിന്നുണ്ടാകുന്ന ഏതെങ്കിലും തെറ്റിദ്ധാരണകള്‍ക്കും തെറ്റുകാര്‍ഥനകള്‍ക്കും ഞങ്ങള്‍ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->