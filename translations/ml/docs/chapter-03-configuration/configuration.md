# ഘടകീകരണം മാർഗ്ഗനിർദേശം

**അധ്യായത്തിൽ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലുള്ള അധ്യായം**: അധ്യായം 3 - ഘടകീകരണം & ഓത്തന്റിക്കേഷൻ
- **⬅️ മുൻപ്**: [Your First Project](first-project.md)
- **➡️ അടുത്തത്**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 അടുത്ത അധ്യായം**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

ഇത് സമഗ്രമായ മാർഗ്ഗനിർദേശമാണ്, Azure Developer CLI യെ ഏറ്റവും മികച്ച ഡവലപ്പ്മെന്റ്, ഡിപ്ലോയ്മെന്റ് പ്രവാഹങ്ങൾക്കായി ഘടകീകരിക്കുന്ന എല്ലാ ദിശ നിർദേശങ്ങളും ഉൾക്കൊള്ളിച്ചിരിക്കുന്നു. ഘടകീകരണ അതളവ്, പരിസ്ഥിതി മാനേജ്‌മെന്റ്, ഓത്തന്റിക്കേഷൻ വിദ്യകൾ, സുരക്ഷിതവും കാര്യക്ഷമവുമായ Azure ഡിപ്പ്ലോയ്മെന്റുകൾ സാധ്യമാക്കുന്ന ഉയർന്ന ഘടകീകരണ രീതികൾ എന്നിവയെക്കുറിച്ച് നിങ്ങൾ പഠിക്കും.

## പഠന ലക്ഷ്യങ്ങൾ

ഈ പാഠം പൂർത്തിയാക്കുന്നതോടെ, നിങ്ങൾക്ക് കഴിയും:
- azd ഘടകീകരണ അതളവും ക്രമക്രമീരുത്തലും അറിയുക
- ഗ്ലോബൽ, പ്രോജക്റ്റ്-പ്രത്യേക ഘടകീകരണങ്ങൾ ഫലപ്രദമായി ക്രമീകരിക്കുക
- വ്യത്യസ്ത ഘടകീകരണങ്ങളുള്ള ഒട്ടേറെ പരിസ്ഥിതികൾ കൈകാര്യം ചെയ്യുക
- സുരക്ഷിതമായ ഓത്തന്റിക്കേഷൻ, അംഗീകാരം പ്രക്രിയകൾ നടപ്പിലാക്കുക
- സങ്കീർണതയുള്ള സാഹചര്യങ്ങൾക്കായി ഉയർന്ന ഘടകീകരണ രീതികൾ മനസ്സിലാക്കുക

## പഠന ഫലം

ഈ പാഠം കഴിയുമ്പോൾ, നിങ്ങൾക്ക് കഴിയും:
- azd മികച്ച ഡവലപ്പ്മെന്റ് പ്രവാഹങ്ങൾക്ക് ക്രമീകരിക്കുക
- ഒന്നിലധികം ഡിപ്ലോയ്മെന്റ് പരിസ്ഥിതികൾ ക്രമീകരിച്ച് നിയന്ത്രിക്കുക
- സുരക്ഷിതമായ ഘടകീകരണ മാനേജ്‌മെന്റ് പ്രാക്ടീസുകൾ നടപ്പിലാക്കുക
- ഘടകീകരണ സംബന്ധമായ പ്രശ്നങ്ങൾ നിറുത്തിവയ്ക്കുക
- പ്രത്യേക സംഘടനാ ആവശ്യങ്ങൾക്കായി azd പെരുമാറ്റം ഇഷ്ടാനുസൃതമാക്കുക

ഇത് സമഗ്രമായ മാർഗ്ഗനിർദേശമാണ്, Azure Developer CLI യെ ഏറ്റവും മികച്ച ഡവലപ്പ്മെന്റ്, ഡിപ്ലോയ്മെന്റ് പ്രവാഹങ്ങൾക്കായി ഘടകീകരിക്കുന്ന എല്ലാ പാഠങ്ങളും ഉൾക്കൊള്ളിച്ചിരിക്കുന്നു.

## azd പ്രോജക്റ്റിലെ AI ഏജന്റ്മാർക്കുള്ള ബോധ്യം

AI ഏജന്റ്മാരെ നിങ്ങൾ പരിചയപ്പെടുത്താത്തവരാണ് എങ്കിൽ, azd ലോകത്തു അവയെപ്പറ്റി ഒരു സുലഭമായ ധാരണ ഇങ്ങനെ:

### ഏജന്റ് എന്താണ്?

ഒരു ഏജന്റ് ഒരു സോഫ്റ്റ്‌വെയർ ഭാഗമാണ്, അവയുള്ള ഒഴിവുകൾ സ്വീകരിക്കുകയും, വാദം നടത്തിയും, നടപടി സ്വീകരിക്കുകയുമാണ്—പലപ്പോഴും AI മോഡൽ കാള്‍ ചെയ്യലിലൂടെ, ഡാറ്റ തിരയലിലൂടെ, അല്ലെങ്കിൽ മറ്റ് സേവനങ്ങൾ വിളിക്കുന്നതിലൂടെ. azd പ്രോജക്റ്റിൽ, ഏജന്റ് വെബ് ഫ്രണ്ട്‌എന്റ് അല്ലെങ്കിൽ API ബാക്ക്‌എന്റ് മുറ്റംപോലെ മറ്റൊരു **സേവനമാണ്**.

### ഏജന്റുമാർ azd പ്രോജക്റ്റ് ഘടനയിൽ എങ്ങനെ ഫിറ്റ് ചെയ്യുന്നു

azd പ്രോജക്റ്റ് മൂന്നു ശ്രേണികളിൽ നിന്ന് രൂപപ്പെട്ടിരിക്കുന്നു: **ഇൻഫ്രാസ്ട്രക്ചർ**, **കോഡ്**, **ഘടകീകരണം**. ഏജന്റുമാർ ഇത്തരം എല്ലാ ലെയറുകളിലുമായി മറ്റു സേവനങ്ങളുപോലെ ചേർക്കപ്പെടുന്നു:

| ലെയർ | ഒരു പരമ്പരാഗത ആപ്പ് ചെയ്യുന്നത് | ഒരു ഏജന്റ് ചെയ്യുന്നത് |
|-------|---------------------------|-------------------------|
| **ഇൻഫ്രാസ്ട്രക്ചർ** (`infra/`) | വെബ് ആപ്പ്, ഡാറ്റാബേസ് പ്രൊവിഷൻ ചെയ്യുന്നു | AI മോഡൽ എന്റ്പോയിന്റ്, ഷേർച്ച് ഇൻഡക്സ്, അല്ലെങ്കിൽ ഏജന്റ് ഹോസ്റ്റ് പ്രൊവിഷൻ ചെയ്യുന്നു |
| **കോഡ്** (`src/`) | നിങ്ങളുടെ ഫ്രന്റ്‌എന്റ്, API സോഴ്സ് കോഡ് ഉൾക്കൊള്ളുന്നു | ഏജന്റ് ലLogic, പ്രോമ്പ്റ്റ് നിർവചനങ്ങൾ ഉൾക്കൊള്ളുന്നു |
| **ഘടകീകരണം** (`azure.yaml`) | നിങ്ങളുടെ സേവനങ്ങളും അവയുടെ ഹോസ്റ്റിംഗ് ടാർഗെറ്റുകളും ലിസ്റ്റ് ചെയ്യുന്നു | ഏജന്റ് ഒരു സേവനമായി ലിസ്റ്റ് ചെയ്ത് അതിന്റെ കോഡ്, ഹോസ്റ്റ് സൂചിപ്പിക്കുന്നു |

### `azure.yaml` ന്റെ പങ്ക്

ഇപ്പോൾ സിന്താക്സ് അടങ്ങിയിരിക്കാൻ നിങ്ങളൊരു ആവശ്യമില്ല. ധാരണയായി, `azure.yaml` എന്നത് azd-ന് പറയാനുള്ള ഫയൽ ആണ്: *"ഇവ ഇവ സംയോജിപ്പിച്ചിരിക്കുന്ന അനുഭവങ്ങളാണ്, അവയുടെ കോഡ് എവിടെ എന്ന്"*.

നിങ്ങളുടെ പ്രോജക്റ്റിൽ AI ഏജന്റ് ഉൾക്കൊള്ളുമ്പോൾ, `azure.yaml` ആ ഏജന്റിനെ ഒരു സേവനമായി ലിസ്റ്റ് ചെയ്യുന്നു. തുടർന്ന് azd Microsoft Foundry Models ഇന്റ്പോയിന്റ്, അല്ലെങ്കിൽ ഏജന്റ് ഹോസ്റ്റ് ചെയ്യാൻ ഒരു കോൺറ്റൈനർ ആപ്പ് പോലെയുള്ള ശരിയായ ഇൻഫ്രാസ്ട്രക്ചർ പതിപ്പിക്കുകയും ഏജന്റ് കോഡ് ഡിപ്പ്ലോയ് ചെയ്യുന്നുമാണ്.

ഇത് അടിസ്ഥാനപരമായി പുതിയ ഒന്നും പഠിക്കേണ്ടതില്ലെന്ന് സൂചിപ്പിക്കുന്നു. വെബ് സേവനം azd.എന്തുപോലെയാണ് ഏജന്റിനെ azd കൈകാര്യം ചെയ്യുന്നത് മനസിലാക്കുന്നതെങ്കിൽ, ഏകദേശം അവിടെയും ഇതുപോലെയാണ്.

## ഘടകീകരണ അധികാരക്രമം

azd ഒരു ശ്രേണീകൃത ഘടകീകരണ സിസ്റ്റം ഉപയോഗിക്കുന്നു:
1. **കമാൻഡ്-ലൈൻ ഫ്‌ളാഗുകൾ** (ഊന്നൽ ഉയർന്നത്)
2. **പരിസ്ഥിതി വ്യത്യാസങ്ങൾ**
3. **സ്ഥലീയ പ്രോജക്റ്റ് ഘടകീകരണം** (`.azd/config.json`)
4. **ഗ്ലോബൽ ഉപയോക്തൃ ഘടകീകരണം** (`~/.azd/config.json`)
5. **ഡീഫോൾട്ട് മൂല്യങ്ങൾ** (ഊന്നൽ കുറഞ്ഞത്)

## ഗ്ലോബൽ ഘടകീകരണം

### ഗ്ലോബൽ ഡീഫോൾട്ട്സ് സജ്ജമാക്കൽ
```bash
# മൾസെലക്ഷൻ സബ്‌സ്‌ക്രിപ്ഷൻ സജ്ജീകരിക്കുക
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# മൾസെലക്ഷൻ സ്ഥലം സജ്ജീകരിക്കുക
azd config set defaults.location "eastus2"

# മൾസെലക്ഷൻ റിസോഴ്‌സ് ഗ്രൂപ്പ് നാമകരണം നിരൂപണം സജ്ജീകരിക്കുക
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# എല്ലാ ആഗോള കോൺഫിഗറേഷൻ likewise കാണുക
azd config list

# ഒരു കോൺഫിഗറേഷൻ നീക്കം ചെയ്യുക
azd config unset defaults.location
```

### പൊതുവായ ഗ്ലോബൽ സെറ്റിംഗുകൾ
```bash
# വികസന മുൻഗണനകൾ
azd config set alpha.enable true                    # ആൽഫാ ഫീച്ചറുകൾ ആക്റ്റിവേറ്റ് ചെയ്യുക
azd config set telemetry.enabled false             # ടെലിമെട്രി അപ്രാപ്യം ആക്കുക
azd config set output.format json                  # ഔട്ട്‌പുട്ട് ഫോർമാറ്റ് സെറ്റ് ചെയ്യുക

# സുരക്ഷാ ക്രമീകരണങ്ങൾ
azd config set auth.useAzureCliCredential true     # ഓത്തന്റിക്കേഷനിന് Azure CLI ഉപയോഗിക്കുക
azd config set tls.insecure false                  # TLS പരിശോധന നിർബന്ധിതമാക്കുക

# പ്രകടന ട്യൂണിംഗ്
azd config set provision.parallelism 5             # സമകല്പിത റിസോഴ്‌സ് സൃഷ്ടി
azd config set deploy.timeout 30m                  # ഡിപ്ലോയ്മെന്റ് ടൈംഔട്ട്
```

## 🏗️ പ്രോജക്ട് ഘടകീകരണം

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

### സേവന ഘടകീകരണ ഓപ്ഷനുകൾ

#### ഹോസ്റ്റ് ടൈപ്പുകൾ
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

#### ഭാഷ-പ്രത്യേക സെറ്റിംഗുകൾ
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

### പരിസ്ഥിതികൾ സൃഷ്ടിക്കൽ
```bash
# പുതിയ പരിസരം സൃഷ്ടിക്കുക
azd env new development

# പ്രത്യേക സ്ഥലം ഉപയോഗിച്ച് സൃഷ്ടിക്കുക
azd env new staging --location "westus2"

# ടെംപ്ലേറ്റ് ഉപയോഗിച്ച് സൃഷ്ടിക്കുക
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### പരിസ്ഥിതി ഘടകീകരണം
ഓരോ പരിസ്ഥിതിക്കും `.azure/<env-name>/config.json` എന്ന വ്യത്യസ്ത ഘടകീകരണം ഉണ്ട്:

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

### പരിസ്ഥിതി വ്യത്യാസങ്ങൾ
```bash
# പരിസരവുമായി ബന്ധപ്പെട്ട വേരിയബിളുകൾ സജ്ജീകരിക്കുക
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# പരിസര വേരിയബിളുകൾ കാണുക
azd env get-values

# പ്രതീക്ഷിക്കുന്ന ഔട്ട്‌പുട്ട്:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# പരിസര വേരിയബിള്‍ നീക്കം ചെയ്യുക
azd env unset DEBUG

# നീക്കം ശരിയായി നടന്നതായി പരിശോധിക്കുക
azd env get-values | grep DEBUG
# (ഇതിൽ ഒന്നും തിരികെ നൽകേണ്ടതില്ല)
```

### പരിസ്ഥിതി ടേംപ്ലേറ്റുകൾ
സമാനമായ പരിസ്ഥിതി ക്രമീകരണത്തിന് `.azure/env.template` സൃഷ്ടിക്കുക:
```bash
# ആവശ്യമായ മാറ്റികൾ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ആപ്ലിക്കേഷൻ ക്രമീകരണങ്ങൾ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ഐച്ഛിക വികസന ക്രമീകരണങ്ങൾ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ഓത്തന്റിക്കേഷൻ ഘടകീകരണം

### Azure CLI ഇന്റഗ്രേഷൻ
```bash
# ആസ്യൂർ CLI അംഗീകാരങ്ങൾ ഉപയോഗിക്കുക (ഡീഫോൾട്ട്)
azd config set auth.useAzureCliCredential true

# പ്രത്യേക ടെനന്റിനായി ലോഗിൻ ചെയ്യുക
az login --tenant <tenant-id>

# ഡീഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ ക്രമീകരിക്കുക
az account set --subscription <subscription-id>
```

### സർവീസ് പ്രിൻസിപ്പൽ ഓത്തന്റിക്കേഷൻ
CI/CD പൈപ്പ്ലൈനിലേക്ക്:
```bash
# പരിസ്ഥിതി വ്യത്യാസങ്ങൾ സ്ഥാപിക്കുക
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# അല്ലെങ്കിൽ നേരിട്ട് ക്രമീകരിക്കുക
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### മാനേജുചെയ്ത ഐഡന്റിറ്റി
Azure-ഹോസ്റ്റ് ചെയ്ത പരിസ്ഥിതികൾക്കായി:
```bash
# മാനേജുചെയ്യുന്ന ഐഡന്റിറ്റി പ്രാമാണീകരണം സജ്ജമാക്കുക
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ഇൻഫ്രാസ്ട്രക്ചർ ഘടകീകരണം

### Bicep പാരാമീറ്ററുകൾ
`infra/main.parameters.json`-ൽ ഇൻഫ്രാസ്ട്രക്ചർ പാരാമീറ്ററുകൾ ക്രമീകരിക്കുക:
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

### ടെറാഫോം ഘടകീകരണം
ടെറാഫോം പ്രോജക്റ്റുകൾക്ക് `infra/terraform.tfvars` ക്രമീകരിക്കുക:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ഡിപ്ലോയ്മെന്റ് ഘടകീകരണം

### ബിൽഡ് ഘടകീകരണം
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

### ഡോക്കർ ഘടകീകരണം
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

## 🔧 ഉയർന്ന ഘടകീകരണം

### അനുകൂല-ഉപകരണ നാമകരണം
```bash
# നാമകരണ രീതികൾ സജ്ജമാക്കുക
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### നെറ്റ്‌വർക്ക് ഘടകീകരണം
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### മേൽനോട്ട ഘടകീകരണം
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

## 🎯 പരിസ്ഥിതി-പ്രത്യേക ഘടകീകരണങ്ങൾ

### ഡവലപ്പ്മെന്റ് പരിസ്ഥിതി
```bash
# .azure/development/.env
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

### പ്രൊഡക്ഷൻ പരിസ്ഥിതി
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ഘടകീകരണ പരിശോധന

### ഘടകീകരണം സ്ഥിരീകരിക്കുക
```bash
# കോൺഫിഗറേഷൻ സിന്റാക്സു പരിശോധിക്കുക
azd config validate

# ടെസ്റ്റ് പരിസ്ഥിതി വ്യത്യാസങ്ങൾ
azd env get-values

# ഇൻഫ്രാസ്ട്രക്ചർ സാധൂകരിക്കുക
azd provision --dry-run
```

### ഘടകീകരണ സ്ക്രിപ്റ്റുകൾ
`script/` dir-ൽ പരിശോധനാ സ്ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കുക:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ആവശ്യമായ പരിസ്ഥിതി വാരിയബിളുകൾ പരിശോധിക്കുക
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml സിന്താക്സ് സാധുവാണോ എന്ന് പരിശോധിക്കുക
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 മികച്ച പ്രാക്ടീസുകൾ

### 1. പരിസ്ഥിതി വ്യത്യാസങ്ങൾ ഉപയോഗിക്കുക
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ഘടകീകരണ ഫയലുകൾ ക്രമീകരിക്കുക
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

### 3. വേർഷൻ നിയന്ത്രണ പരിഗണനകൾ
```bash
# .gitignore
.azure/*/config.json         # പരിസരക്രമങ്ങൾ (റിസോഴ്‌സ് ഐഡികൾ ഉൾക്കൊള്ളുന്നു)
.azure/*/.env               # പരിസ്ഥിതി variávelകൾ (രഹസ്യങ്ങൾ ഉൾക്കൊള്ളാവുന്നതാണ്)
.env                        # പ്രാദേശിക പരിസ്ഥിതി ഫയൽ
```

### 4. ഘടകീകരണ ഡോക്യുമെന്റേഷൻ
`CONFIG.md` -ൽ നിങ്ങളുടെ ഘടകീകരണം രേഖപ്പെടുത്തുക:
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

## 🎯 ഹാൻഡ്സ്-ഓൺ പ്രാക്ടീസ് വ്യായാമങ്ങൾ

### വ്യായാമം 1: മൾട്ടി-എൻവയോൺമെന്റ് ഘടകീകരണം (15 മിനിറ്റ്)

**ലക്ഷ്യം**: വ്യത്യസ്ത സെറ്റിങ്ങുകളുമായി മൂന്ന് പരിസ്ഥിതികൾ സൃഷ്ടിച്ച് ക്രമീകരിക്കുക

```bash
# വികസന പരിസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# പ്രൊഡക്ഷന്‍ പരിസ്ഥിതി സൃഷ്‌ടിക്കുക
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ഓരോ പരിസ്ഥിതിയും സ്ഥിരീകരിക്കുക
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] മൂന്ന് പരിസ്ഥിതികളും വിജയകരമായി സൃഷ്ടിച്ചു
- [ ] ഓരോ പരിസ്ഥിതിക്കും വ്യത്യസ്ത ഘടകീകരണം ഉണ്ടായിരിക്കുന്നു
- [ ] പരിസ്ഥിതികൾ തമ്മിൽ പകരംവെക്കാൻ പിഴവ് സംഭവിക്കാതെ
- [ ] `azd env list` മൂന്ന് പരിസ്ഥിതികളും കാണിക്കുന്നു

### വ്യായാമം 2: രഹസ്യ മാനേജ്‌മെന്റ് (10 മിനിറ്റ്)

**ലക്ഷ്യം**: സങ്കീർണമായ ഡാറ്റ ഉപയോഗിച്ച് സുരക്ഷിത ഘടകീകരണം പ്രാക്ടീസ് ചെയ്യുക

```bash
# രഹസ്യങ്ങൾ സജ്ജമാക്കുക (ഔട്ട്‌പുട്ടിൽ കാണിക്കുന്നില്ല)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# രഹസ്യമല്ലാത്ത ക്രമീകരണങ്ങൾ സജ്ജമാക്കുക
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# പരിസ്ഥിതി കാണുക (രഹസ്യങ്ങൾ മറച്ചു കാണിക്കണം)
azd env get-values

# രഹസ്യങ്ങൾ സഞ്ചിതമാക്കിയിട്ടുണ്ടെന്ന് സ്ഥിരീകരിക്കുക
azd env get DB_PASSWORD  # യഥാർത്ഥ മൂല്യം കാണിക്കണം
```

**വിജയ മാനദണ്ഡങ്ങൾ:**
- [ ] രഹസ്യങ്ങൾ ടെർമിനലിൽ കാണാതെ സൂക്ഷിക്കപ്പെട്ടിരിക്കുന്നു
- [ ] `azd env get-values` ഇവയുടെ രഹസ്യങ്ങൾ റെഡാക്ടുചെയ്‌താക്ഷരങ്ങളിൽ കാണിക്കുന്നു
- [ ] വ്യക്തിഗതമായി `azd env get <SECRET_NAME>` യഥാർത്ഥ മൂല്യം കൊണ്ടുവരുന്നു

## അടുത്ത ചുവട്

- [Your First Project](first-project.md) - പ്രായോഗികമായി ഘടകീകരണം ഉപയോഗിക്കുക
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ഡിപ്ലോയ്മെന്റ് വേണ്ടി ഘടകീകരണം ഉപയോഗിക്കുക
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - പ്രൊഡക്ഷൻ-റെഡിയുടെ ഘടകീകരണങ്ങൾ

## റഫറൻസുകൾ

- [azd ഘടകീകരണ റഫറൻസ്](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml സ്കീമ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [പരിസ്ഥിതി വ്യത്യാസങ്ങൾ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**അധ്യായത്തിൽ നാവിഗേഷൻ:**
- **📚 കോഴ്സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലുള്ള അധ്യായം**: അധ്യായം 3 - ഘടകീകരണം & ഓത്തന്റിക്കേഷൻ
- **⬅️ മുൻപ്**: [Your First Project](first-project.md)
- **➡️ അടുത്ത അധ്യായം**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **അടുത്ത പാഠം**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ഒഴിവുവരുത്തൽ**:  
ഈ പ്രമാണം AI പരിഭാഷാ സേവനമായ [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തപ്പെട്ടതാണ്. നാം درستതയ്ക്കായി ശ്രമിച്ചിട്ടും, സ്വയം പ്രവർത്തിക്കുന്ന പരിഭാഷകളിൽ പിശകുകൾ അല്ലെങ്കിൽ തെറ്റുകൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട് എന്നും ദയവായി ശ്രദ്ധിച്ചുകൊള്ളുക. അതിന്റെ സ്വദേശീയ ഭാഷയിൽ ഉള്ള മൃല പ്രമാണം സാക്ഷ്യപ്രമാണമായി കണക്കാക്കണം. പ്രധാന വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷയുടെ ഉപയോഗത്തിൽ നിന്നുണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾക്കും വ്യാഖ്യാന പിഴവുകൾക്കും ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->