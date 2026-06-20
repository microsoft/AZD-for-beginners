# കോൺഫിഗറേഷൻ ഗൈഡ്

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 3 - കോൺഫിഗറേഷൻ & ആuthതന്റിക്കേഷൻ
- **⬅️ മുമ്പത്തെത്**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md)
- **➡️ അടുത്തത്**: [ഡിപ്പ്ലോയ്മെന്റ് ഗൈഡ്](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ എസ് കോഡ്](../chapter-04-infrastructure/deployment-guide.md)

## പരിചയം

ഇത് ആഴത്തിൽ കവർ ചെയ്യുന്ന ഗൈഡ് Azure Developer CLI സെറ്റപ്പിനുള്ള എല്ലാ ഘടകങ്ങളും ഉൾക്കൊള്ളുന്നു, അനുയോജ്യമായ വികസനവും ഡിപ്പ്ലോയ്മെന്റും നടത്താനുള്ളതായും. കോൺഫിഗറേഷൻ തരം, പരിസ്ഥിതി മാനേജ്മെന്റ്, ആuthതന്റിക്കേഷൻ ചിട്ടികൾ, സുരക്ഷിതവും കാര്യക്ഷമവുമായ Azure ഡിപ്പ്ലോയ്മെന്റുകൾക്ക് ഉള്ള ഏറ്റവും പുതിയ കോൺഫിഗറേഷൻ പാറ്റേണുകൾ നിങ്ങള്‍ക്ക് മനസ്സിലാക്കാം.

## പഠനലക്ഷ്യങ്ങൾ

ഈ പാഠം അവസാനിക്കുമ്പോൾ നിങ്ങൾക്ക് സാധിക്കും:
- azd കോൺഫിഗറേഷൻ തരം ആധിക്യം എങ്ങനെ ഉണ്ടെന്ന് മനസ്സിലാക്കുക
- ഗ്ലോബലും പ്രോജക്റ്റ് സ്‌പെസിഫിക് സജ്ജീകരണങ്ങളും ഫലപ്രദമായ രീതിയിൽ ക്രമീകരിക്കുക
- വ്യത്യസ്ത കോൺഫിഗറേഷനുകളുള്ള ബഹുവിവര പരിസ്ഥിതികൾ നടത്തിപ്പ് ചെയ്യുക
- സുരക്ഷിതമായ ആuthതന്റിക്കേഷൻ & ഓതോറൈസേഷൻ പാറ്റേണുകൾ നടപ്പാക്കുക
- സങ്കീർണ്ണ സാഹചര്യങ്ങൾക്കുള്ള ആധികമായ കോൺഫിഗറേഷൻ മാതൃകകൾ മനസ്സിലാക്കുക

## പഠനഫലം

ഈ പാഠം പൂർത്തിയാക്കിയ ശേഷം നിങ്ങൾക്ക് സാധിക്കും:
- വികസന പ്രവാഹങ്ങൾക്കായി azd ക്കായി പ്രവർത്തനം അനുയോജ്യമായ രീതിയിൽ കോൺഫിഗർ ചെയ്യുക
- പലമായ ഡിപ്പ്ലോയ്മെന്റ് പരിസ്ഥിതികൾ സജ്ജമാക്കുകയും നിയന്ത്രിക്കണമെന്നും
- സുരക്ഷിത കോൺഫിഗറേഷൻ മാനേജ്മെന്റ് പ്രവൃത്തികൾ നടപ്പാക്കുക
- കോൺഫിഗറേഷൻ സംബന്ധമായ പ്രശ്നങ്ങൾ പരിഹരിക്കുക
- പ്രത്യേക സംഘടന ആവശ്യങ്ങൾക്കായി azd പ്രവർത്തനം അസാധാരണമാക്കുക

ഈ ആഴത്തിലുള്ള ഗൈഡ് Azure Developer CLI സെറ്റപ്പിന്റെ എല്ലാഭാഗങ്ങളും ഉൾക്കൊള്ളുന്നു.

## azd പ്രോജക്റ്റിലെ AI ഏജന്റുകൾ മനസിലാക്കുക

AI ഏജന്റുകളെ പരിചയമില്ലാത്തവർക്ക്, azd ലോകത്ത് അവയെ ധരിപ്പിക്കാൻ ലളിതമായ ഒരു മാർഗ്ഗം ഇവിടെ.

### ഏജന്റ് എന്നതു എന്ത്?

ഒരു ഏജന്റ് എന്നാൽ ഒരു സോഫ്റ്റ്വെയർ ഘടകമാണ്, അത് ഒരു അഭ്യർത്ഥന സ്വീകരിച്ച് അതിനെക്കുറിച്ച് ചിന്തിച്ചു നടപടി എടുക്കുമെന്നാണ്—അധികം നിലയ്ക്ക് AI മോഡൽ വിളിക്കുകയോ, ഡാറ്റ പരിശോധിക്കുകയോ, മറ്റ് സേവനങ്ങൾ അനുയോജ്യപ്പെടുത്തുകയോ ചെയ്യുന്നു. ഒരു azd പ്രോജക്റ്റിൽ ഏജന്റ് നിങ്ങളുടെ വെബ് ഫ്രണ്ട്‌എൻഡ് അല്ലെങ്കിൽ API ബാക്ക്‌എൻഡിന്റെ കൂടെ മറ്റൊരു **സേവനമാണ്**.

### azd പ്രോജക്റ്റിന്റെ ഘടനയിലെ ഏജന്റുകളുടെ സ്ഥാനം

azd പ്രോജക്റ്റ് മൂന്ന് ലെയർസിൽ നിന്നാണ് നിർമ്മിച്ചിരിക്കുന്നത്: **ഇൻഫ്രാസ്ട്രക്ചർ**, **കോഡ്**, **കോൺഫിഗറേഷൻ**. ഏജന്റുകൾ ഈ ലെയറുകളിലേക്ക് മറ്റെങ്ങനെ സേവനങ്ങൾ ചെയ്യാൻ മുൻഗണന നൽകുന്നു:

| ലെയർ | സാധാരണ ആപ്പ് വഴി ചെയ്യുന്നത് | ഏജന്റിന് ചെയ്യുന്നത് |
|-------|----------------------------|--------------------|
| **ഇൻഫ്രാസ്ട്രക്ചർ** (`infra/`) | വെബ് ആപ്പ്, ഡാറ്റാബേസ് ഒരുക്കുന്നു | AI മോഡൽ എൻഡ്‌പോയിന്റ്, സർച്ച് ഇൻഡക്സ്, ഏജന്റ് ഹോസ്റ്റ് ഒരുക്കുന്നു |
| **കോഡ്** (`src/`) | ഫ്രണ്ട്‌എൻഡ്, API സോഴ്സ് കോഡ് ഉൾക്കൊള്ളുന്നു | ഏജന്റ് ലജിക്, പ്രോമ്പ്റ്റ് നിർവചനങ്ങൾ ഉൾക്കൊള്ളുന്നു |
| **കോൺഫിഗറേഷൻ** (`azure.yaml`) | സേവനങ്ങൾ, അവയുടെ ഹോസ്റ്റിംഗ് ലക്ഷ്യങ്ങൾ ചൂണ്ടുന്നു | ഏജന്റ് സേവനമായി ഉൾപ്പെടുത്തി അതിന്റെ കോഡും ഹോസ്റ്റും കാണിക്കുന്നു |

### `azure.yaml` ന്റെ പങ്ക്

ഇപ്പോൾ വാക്യക്രമം ഓർക്കേണ്ട ആവശ്യമില്ല. ആശയപരമായി, `azure.yaml` എന്നത് azd-യ്ക്ക് നിങ്ങളുടെ ആപ്ലിക്കേഷന്റെ സേവനങ്ങൾ എങ്ങിനെയാണ്, അവയുടെ കോഡ് എവിടെയാണെന്ന് പറയുന്ന ഫയൽ.

നിങ്ങളുടെ പ്രോജക്റ്റിൽ AI ഏജന്റ് ഉൾപെടുത്തിയാൽ, `azure.yaml` ആ ഏജെന്റിനെ സേവനങ്ങളിലൊരാൾ ആയി മാത്രമേ ലിസ്റ്റ് ചെയ്യൂ. azd തുടർന്നു അനുയോജ്യമായ ഇൻഫ്രാസ്ട്രക്ചർ (ഉദാ: Microsoft Foundry Models എൻഡ്‌പോയിന്റ് അല്ലെങ്കിൽ ഏജന്റ് ഹോസ്റ്റ് ചെയ്യാനുള്ള കോൺടൈനർ ആപ്) ഒരുക്കാനും നിങ്ങളുടെ ഏജന്റ് കോഡ് ഡിപ്പ്ലോയ്മെന്റ് ചെയ്യാനും അറിയും—ഇതാണ് വെബ് ആപ്പോ API ആപ്പോ തിരുവനന്തപുരം പോലെ പ്രവർത്തിക്കുന്നത്.

ഇത് പുതിയ ഒന്നും പഠിക്കേണ്ടതില്ല എന്നു അർത്ഥം. നിങ്ങൾ azd ഒരു വെബ് സേവനം എങ്ങനെ കൈകാര്യം ചെയ്യുന്നത് മനസ്സിലാക്കുകയാണെങ്കിൽ, അതുപോലെ ഏജന്റ് മാനേജ്മെന്റും ചെയ്യുക.

## കോൺഫിഗറേഷൻ ശൃംഖല (Hierarchy)

azd ഒരു പാളിയായ കോൺഫിഗറേഷൻ സിസ്റ്റം ഉപയോഗിക്കുന്നു:
1. **കമാൻഡ്-ലൈൻ ഫ്ലാഗുകൾ** (അത്യുദ്ധമ)
2. **പരിസ്ഥിതി വേരിയബിളുകൾ**
3. **ലോക്കൽ പ്രോജക്റ്റ് കോൺഫിഗറേഷൻ** (`.azd/config.json`)
4. **ഗ്ലോബൽ ഉപയോക്തൃ കോൺഫിഗറേഷൻ** (`~/.azd/config.json`)
5. **ഡീഫോൾട്ട് മൂല്യങ്ങൾ** (കുറഞ്ഞ പ്രാധാന്യം)

## ഗ്ലോബൽ കോൺഫിഗറേഷൻ

### ഗ്ലോബൽ ഡീഫോൾട്ടുകൾ സജ്ജീകരിക്കൽ
```bash
# ഡിഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സജ്ജമാക്കുക
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ഡിഫോൾട്ട് സ്ഥലവും സജ്ജമാക്കുക
azd config set defaults.location "eastus2"

# ഡിഫോൾട്ട് റിസോഴ്‌സ് ഗ്രൂപ്പ് നാമകരണം ചട്ടം സജ്ജമാക്കുക
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# എല്ലാ ഗ്ലോബൽ കോൺഫിഗറേഷനുകളും കാണുക
azd config show

# ഒരു കോൺഫിഗറേഷൻ നീക്കം ചെയ്യുക
azd config unset defaults.location
```

### പൊതു ഗ്ലോബൽ സജ്ജീകരണങ്ങൾ
```bash
# വികസന മുൻഗണനകൾ
azd config set alpha.enable true                    # ആൽഫ ഫീച്ചറുകൾ സജീവമാക്കുക
azd config set telemetry.enabled false             # ടെലിമെട്രി അപ്രാപ്തമാക്കുക
azd config set output.format json                  # ഔട്ട്പുട്ട് ഫോർമാറ്റ് സജ്ജമാക്കുക

# സുരക്ഷാ ക്രമീകരണങ്ങൾ
azd config set auth.useAzureCliCredential true     # പ്രാമാണീകരണത്തിനായി Azure CLI ഉപയോഗിക്കുക
azd config set tls.insecure false                  # TLS പരിശോധനം ബാധകമാക്കുക

# പ്രകടനം മെച്ചപ്പെടുത്തൽ
azd config set provision.parallelism 5             # സമാന്തര റിസോഴ്‌സ് സൃഷ്ടി
azd config set deploy.timeout 30m                  # വിന്യാസ കാലഹരണता
```

## 🏗️ പ്രോജക്റ്റ് കോൺഫിഗറേഷൻ

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

### സേവന കോൺഫിഗറേഷൻ ഓപ്ഷനുകൾ

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

#### ലാംഗ്വേജ്-സ്പെസിഫിക് സജ്ജീകരണങ്ങൾ
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

## 🌟 പരിസ്ഥിതി മാനേജ്മെന്റ്

### പരിസ്ഥിതി സൃഷ്ടിക്കൽ
```bash
# പുതിയ ഒരു എൻവയോൺമെന്റ് സൃഷ്ടിക്കുക
azd env new development

# പ്രത്യേക സ്ഥലം ഉപയോഗിച്ച് സൃഷ്ടിക്കുക
azd env new staging --location "westus2"

# ടെംപ്ലേറ്റിൽ നിന്നാണ് സൃഷ്ടിക്കുക
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### പരിസ്ഥിതി കോൺഫിഗറേഷൻ
ഓരു പരിസ്ഥിതിക്ക് തന്നെ അതിന്റെ കോൺഫിഗറേഷൻ `.azure/<env-name>/config.json`ൽ ഉണ്ട്:

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
# പരിസ്ഥിതി-നിർദിഷ്ട വേരിയബിളുകൾ സജ്ജമാക്കുക
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# പരിസ്ഥിതി വേരിയബിളുകൾ കാണുക
azd env get-values

# പ്രതീക്ഷിച്ച ഔട്ട്‌പുട്ട്:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# പരിസ്ഥിതി വേരിയബിള്‍ നീക്കം ചെയ്യുക
azd env unset DEBUG

# നീക്കം ചെയ്യലിന്റെ സ്ഥിരീകരണം
azd env get-values | grep DEBUG
# (ഏതും റിട്ടേൺ ചെയ്യരുത്)
```

### പരിസ്ഥിതി ടെംപ്ലേറ്റുകൾ
സമാനപരിസ്ഥിതി ക്രമീകരണത്തിന് `.azure/env.template` സൃഷ്ടിക്കുക:
```bash
# ആവശ്യമായ വ്യത്യസ്ഥങ്ങളും
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# അപ്ലിക്കേഷൻ ക്രമീകരണങ്ങൾ
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ഇച്ഛാനുസൃത വികസന ക്രമീകരണങ്ങൾ
DEBUG=false
LOG_LEVEL=info
```

### ടീമിന്റെ ഇടയിൽ പരിസ്ഥിതികൾ പങ്കിടൽ

ഒരു പ്രോജക്റ്റിൽ ഒരിലധികർ ചേർന്ന് പ്രവർത്തിക്കുമ്പോൾ, **റിപ്പോയിൽ എന്ത് പോവുകയെന്നാണ് തിരിഞ്ഞു, എന്ത് ലോക്കലായിരിക്കും നിലനിർത്തൽ** എന്നതിൽ ഒത്തു കൂടേണ്ടി വരും. azd ഓരോ പരിസ്ഥിതിയെയും `.azure/` ഫോൾഡറിന് താഴെ സൂക്ഷിക്കുന്നു, അതിൽ മുഴുവനും കമ്മിറ്റ് ചെയ്യരുത്.

**`.azure/`-ൽ ഉള്ളതു:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**എന്ത് gitignore ചെയ്യണം.** azd ന്റെ ഡിഫോൾട്ട് `.gitignore` ഇതിനകം `.azure/` ഒഴിവാക്കുന്നു. ആ നിലനിർത്തുക—`.env` ഫയലുകൾ രഹസ്യങ്ങൾ ഉൾക്കൊള്ളാം, റിസോഴ്സ് ഐഡികൾ അവരെ ഒപ്പം നൽകുന്ന ആളിനു മാത്രമേ ബാധകമായിരിക്കൂ. ഓരോ ടീമംഗവും അവരുടെ **സ്വന്തം** പരിസ്ഥിതി ലോക്കലായി സൃഷ്ടിക്കും:

```bash
# ഓരോ ഡവലപ്പറും തങ്ങളുടെ സ്വന്തം വേർതിരിച്ച പാരിതോഷികം നേടാൻ അത് ഒരിക്കൽ പ്രവർത്തിപ്പിക്കുന്നു
azd env new dev-alice
azd up
```

**പരിസ്ഥിതികൾ തമ്മിൽ സ്വിച്ച് ചെയ്യൽ.** ഒട്ടേറെ പരിസ്ഥിതികൾ കൈകാര്യം ചെയ്യുന്ന ഡെവലപ്പർ കമാൻഡുകൾ പ്രവർത്തിക്കുന്നതിന് മുമ്പ് ആഹ്ലാദകരമായ പരിസ്ഥിതിയെ തിരഞ്ഞെടുക്കുന്നു:

```bash
azd env list                 # എല്ലാ പ്രാദേശിക പരിസ്ഥിതികളും ഏതാണ് ഡീഫോൾട്ട് എന്ന് കാണുക
azd env select staging       # 'staging' പ്രവർത്തനപരമായ പരിസ്ഥിതിയായി മാറ്റുക
azd env get-values           # നിങ്ങൾ ശരിയായ പരിസ്ഥിതിയിലേക്ക് പോയിയാണെന്ന് സ്ഥിരീകരിക്കുക
```

**ടീമിന് രഹസ്യമല്ലാത്ത ഡീഫോൾട്ട് നൽകേണ്ടത്.** ടെംപ്ലേറ്റ് (ഉദാ: `.azure/env.template`) കമ്മിറ്റ് ചെയ്യുക, എല്ലാവർക്കും ഏത് വേരിയബിളുകൾ ക്രമീകരിക്കണമെന്ന് അറിയാനായി—പൂർത്തിയാക്കിയ മൂല്യങ്ങൾ ഒരിക്കലും കമ്മിറ്റ് ചെയ്യരുത്. പുതിയ കൂട്ടാംഗങ്ങൾ ടെംപ്ലേറ്റ് കോപ്പി ചെയ്ത് സ്വന്തം മൂല്യങ്ങൾ നൽകും.

**CI/CD യിലെ പരിസ്ഥിതികൾ.** പൈപ്പ്ലൈനുകൾ നിങ്ങളുടെ ലോക്കൽ `.azure/` ഫോൾഡർ വായിക്കില്ല. പകരം, പരിസ്ഥിതി മൂല്യങ്ങൾ പൈപ്പ്ലൈൻ വേരിയബിളുകളായി / രഹസ്യങ്ങളായി നൽകുക, azd അവ പ്രോസസ് പരിസ്ഥിതിയിൽ നിന്നും വായിക്കും:

```bash
# CI ൽ, azd ഇവ ആരോഗ്യവാനിൽ നിന്ന് വായിക്കുന്നു, .azure/ ഫയലിൽ നിന്ന് അല്ല.
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **മുഖ്യനിയമം:** ഇൻഫ്രാസ്ട്രക്ചർ കോഡ് (`infra/`, `azure.yaml`) ഗിറ്റിൽ പങ്കിടപ്പെടുന്നു; പരിസ്ഥിതി *സ്റ്റേറ്റ് ആൻഡ് സീക്രെറ്റ്സ്* (`.azure/`) ഓരോ ഡെവലപ്പർക്കും പൈപ്പ്ലൈനിനും പ്രത്യേകമാണ്. `azd pipeline config` നിങ്ങളുടെ പൈപ്പ്ലൈൻ വേരിയബിള്‍ കൃത്യമായി ക്രമീകരിക്കും.

## 🔐 ആuthതന്റിക്കേഷൻ കോൺഫിഗറേഷൻ

### Azure CLI ഇന്റഗ്രേഷൻ
```bash
# അസ്യൂര് CLI ക്രെഡൻഷ്യലുകൾ ഉപയോഗിക്കുക (ഡീഫോൾട്ട്)
azd config set auth.useAzureCliCredential true

# പ്രത്യേക ടെന്നന്റിനോടുകൂടെ ലോഗിൻ ചെയ്യുക
az login --tenant <tenant-id>

# ഡീഫോൾട്ട് സബ്സ്ക്രിപ്ഷൻ സെറ്റ് ചെയ്യുക
az account set --subscription <subscription-id>
```

### സർവീസ് പ്രിൻസിപ്പൽ ആuthതന്റിക്കേഷൻ
CI/CD പൈപ്പ്ലിനുകൾക്കായി:
```bash
# പരിസ്ഥിതി വ്യത്യസ്തങ്ങൾ സജ്ജമാക്കുക
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# അല്ലെങ്കിൽ നേരിട്ട് ക്രമീകരിക്കുക
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### മാനേജ്ഡ് ഐഡന്റിറ്റി
Azure ഹോസ്റ്റ് ചെയ്ത പരിസ്ഥിതികൾക്കായി:
```bash
# മാനേജ് ചെയ്‌ത ഐഡന്റിറ്റി പ്രാമാണീകരണം സജ്ജമാക്കുക
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ഇൻഫ്രാസ്ട്രക്ചർ കോൺഫിഗറേഷൻ

### ബൈസിപ് പാരామീറ്ററുകൾ
`infra/main.parameters.json` ൽ ഇൻഫ്രാസ്ട്രക്ചർ പാരാമീറ്ററുകൾ ക്രമീകരിക്കുക:
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

### ടെറാഫോം കോൺഫിഗറേഷൻ
ടെറാഫോം പ്രോജക്റ്റുകൾക്കായി `infra/terraform.tfvars` ൽ ക്രമീകരിക്കുക:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ഡിപ്പ്ലോയ്മെന്റ് കോൺഫിഗറേഷൻ

### ബിൽഡ് കോൺഫിഗറേഷൻ
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

### ഡോക്കർ കോൺഫിഗറേഷൻ
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

## 🔧 ആധുനിക കോൺഫിഗറേഷൻ

### കസ്റ്റം റിസോഴ്‌സ് നാമകരണം
```bash
# നാമകരണം നിയമങ്ങൾ നിയമിക്കുക
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### നെറ്റ്‌വർക്കിംഗ് കോൺഫിഗറേഷൻ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### മോണിറ്ററിംഗ് കോൺഫിഗറേഷൻ
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

## 🎯 പരിസ്ഥിതി-സ്പെസിഫിക് കോൺഫിഗറേഷനുകൾ

### ഡെവലപ്പ്മെന്റ് പരിസ്ഥിതി
```bash
# .azure/വികസനം/.env
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

## 🔍 കോൺഫിഗറേഷൻ സ്ഥിരീകരണം

### കോൺഫിഗറേഷൻ സാധുത പരിശോധിക്കുക
```bash
# കോൺഫിഗറേഷൻ സിന്ത tax സരളമായി പരിശോധിക്കുക
azd config validate

# test പരിസ്ഥിതി വ്യത്യാസങ്ങൾ
azd env get-values

# അടിസ്ഥാന ഘടന സാധുവായെന്ന് ഉറപ്പുവരുത്തുക
azd provision --dry-run
```

### കോൺഫിഗറേഷൻ സ്ക്രിപ്റ്റുകൾ
`script/` ൽ സ്ഥിരീകരണ സ്ക്രിപ്റ്റുകൾ സൃഷ്ടിക്കുക:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ആവശ്യമായ പരിതസ്ഥിതി വ്യരിയബിളുകൾ പരിശോധിക്കുക
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml സിന്റ്റക്‌സ് പരിശോധിക്കുക
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 മികച്ച പ്രവർത്തനരീതി

### 1. പരിസ്ഥിതി വേരിയബിളുകൾ ഉപയോഗിക്കുക
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. കോൺഫിഗറേഷൻ ഫയലുകൾ ക്രമീകരിക്കുക
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
.azure/*/config.json         # പരിപ<|vq_clip_4427|><|vq_clip_9513|><|vq_clip_9572|><|vq_clip_13768|><|vq_clip_5783|><|vq_clip_15980|><|vq_clip_2288|><|vq_clip_6664|><|vq_clip_6212|><|vq_clip_14610|><|vq_clip_10604|><|vq_clip_5372|><|vq_clip_4313|><|vq_clip_9146|><|vq_clip_4990|><|vq_clip_10462|><|vq_clip_12684|><|vq_clip_7019|><|vq_clip_10419|><|vq_clip_9116|><|vq_clip_15393|><|vq_clip_4043|><|vq_clip_7554|><|vq_clip_10744|><|vq_clip_11052|><|vq_clip_7548|><|vq_clip_7202|><|vq_clip_10114|><|vq_clip_3192|><|vq_clip_15766|><|vq_clip_7162|><|vq_clip_14142|><|vq_clip_1055|><|vq_clip_3475|><|vq_clip_12280|><|vq_clip_818|><|vq_clip_11433|><|vq_clip_5921|><|vq_clip_14461|><|vq_clip_13514|><|vq_clip_574|><|vq_clip_5487|><|vq_clip_5885|><|vq_clip_405|><|vq_clip_1367|><|vq_clip_5476|><|vq_clip_2073|><|vq_clip_3989|><|vq_clip_12507|><|vq_clip_12107|><|vq_clip_14284|><|vq_clip_259|><|vq_clip_14400|><|vq_clip_11702|><|vq_clip_13159|><|vq_clip_426|><|vq_clip_6135|><|vq_clip_11725|><|vq_clip_10471|><|vq_clip_3741|><|vq_clip_9944|><|vq_clip_2315|><|vq_clip_56|><|vq_clip_7052|> Sovereignty
.azure/*/.env               # പരിസ്ഥിതി വേരിയബിൾസുകൾ (രഹസ്യങ്ങൾ ഉൾക്കൊള്ളാം)
.env                        # ലൊക്കൽ പരിസ്ഥിതി ഫയൽ
```

### 4. കോൺഫിഗറേഷൻ ഡോക്യുമെന്റേഷൻ
`CONFIG.md`-ൽ നിങ്ങളുടെ കോൺഫിഗറേഷൻ രേഖപ്പെടുത്തുക:
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

## 🎯 ഹാൻഡ്-ഓൺ പ്രാക്ടീസ് അഭ്യാസങ്ങൾ

### അഭ്യാസം 1: ബഹു-പാരിസ്ഥിതിക കോൺഫിഗറേഷൻ (15 മിനിറ്റ്)

**ലക്ഷ്യം**: വ്യത്യസ്ത കോൺഫിഗറേഷനുകളുള്ള മൂന്ന് പരിസ്ഥിതികൾ സൃഷ്ടിച്ച് ക്രമീകരിക്കുക

```bash
# വികസന പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# സ്റ്റേജിംഗ് പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# പ്രൊഡക്ഷൻ പരിസ്ഥിതി സൃഷ്ടിക്കുക
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ഓരോ പരിസ്ഥിതിയും സ്ഥിരീകരിക്കുക
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**വിജയോത്സവ മാനദണ്ഡങ്ങൾ:**
- [ ] മൂന്ന് പരിസ്ഥിതികൾ വിജയകരമായി സൃഷ്ടിച്ചു
- [ ] ഓരോ പരിസ്ഥിതിക്കും വ്യത്യസ്തമായ കോൺഫിഗറേഷൻ ഉണ്ട്
- [ ] പരിസ്ഥിതികൾ തമ്മിൽ പിശക് കൂടാതെ മാറാൻ കഴിയും
- [ ] `azd env list` എല്ലാം മൂന്ന് പരിസ്ഥിതികളും കാണിക്കുന്നു

### അഭ്യാസം 2: രഹസ്യങ്ങൾ മാനേജ്‌മെന്റ് (10 മിനിറ്റ്)

**ലക്ഷ്യം**: സെൻസിറ്റീവ് ഡാറ്റ ഉപയോഗിച്ചുള്ള സുരക്ഷിത കോൺഫിഗറേഷൻ അഭ്യസിക്കുക

```bash
# രഹസ്യങ്ങൾ സജ്ജമാക്കുക (ഔട്ട്‌പുട്ടിൽ പ്രദർശിപ്പിക്കില്ല)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# രഹസ്യമല്ലാത്ത കോൺഫിഗ് സജ്ജമാക്കുക
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# പരിസ്ഥിതി കാണുക (രഹസ്യങ്ങൾ മറച്ചുപറയണം)
azd env get-values

# രഹസ്യങ്ങൾ സൂക്ഷിച്ചിട്ടുണ്ടെന്ന് ഉറപ്പാക്കുക
azd env get DB_PASSWORD  # യഥാർത്ഥ മൂല്യം കാണിക്കണം
```

**വിജയോത്സവ മാനദണ്ഡങ്ങൾ:**
- [ ] രഹസ്യങ്ങൾ ടർമിനലിൽ കാണിക്കാതെ സൂക്ഷിച്ചത്
- [ ] `azd env get-values` റെഡാക്ടഡ് രഹസ്യങ്ങൾ കാണിക്കുന്നു
- [ ] വ്യക്തിഗത `azd env get <SECRET_NAME>` യഥാർത്ഥ മൂല്യം നൽകുന്നു

## അടുത്തഘട്ടങ്ങൾ

- [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md) - കോൺഫിഗറേഷൻ പ്രായോഗികമായി പ്രയോഗിക്കുക
- [ഡിപ്പ്ലോയ്മെന്റ് ഗൈഡ്](../chapter-04-infrastructure/deployment-guide.md) - ഡിപ്പ്ലോയ്മെന്റിനായി കോൺഫിഗർ ചെയ്യുക
- [റിസോഴ്‌സുകൾ പ്രൊവൈഷനിംഗ്](../chapter-04-infrastructure/provisioning.md) - പ്രൊഡക്ഷൻ-റെഡി കോൺഫിഗറേഷനുകൾ

## റഫറൻസുകൾ

- [azd കോൺഫിഗറേഷൻ റഫറൻസ്](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml സ്കീമ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [പരിസ്ഥിതി വേരിയബിളുകൾ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**അദ്ധ്യായ നാവിഗേഷൻ:**
- **📚 കോഴ്‌സ് ഹോം**: [AZD For Beginners](../../README.md)
- **📖 നിലവിലെ അദ്ധ്യായം**: അദ്ധ്യായം 3 - കോൺഫിഗറേഷൻ & ആuthതന്റിക്കേഷൻ
- **⬅️ മുമ്പത്തെത്**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md)
- **➡️ അടുത്ത അദ്ധ്യായം**: [അദ്ധ്യായം 4: ഇൻഫ്രാസ്ട്രക്ചർ എസ് കോഡ്](../chapter-04-infrastructure/deployment-guide.md)
- **അടുത്ത പാഠം**: [നിങ്ങളുടെ ആദ്യ പ്രോജക്റ്റ്](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**അറിയിപ്പ്**:
ഈ രേഖ AI പരിഭാഷാ സേവനം [Co-op Translator](https://github.com/Azure/co-op-translator) ഉപയോഗിച്ച് പരിഭാഷപ്പെടുത്തിയതാണ്. ഞങ്ങൾ കൃത്യതയ്ക്കായി ശ്രമിക്കുന്നുവെങ്കിലും, ഓട്ടോമേറ്റഡ് പരിഭാഷകളിൽ പിഴവുകൾ അല്ലെങ്കിൽ തെറ്റായ വിവരങ്ങൾ ഉണ്ടാകാൻ സാധ്യതയുണ്ട്. അതിന്റെ സ്വാഭാവിക ഭാഷയിലുള്ള അസൽ രേഖയാണ് പ്രാമാണികമായ ഉറവിടമായി പരിഗണിക്കേണ്ടത്. നിർണായകമായ വിവരങ്ങൾക്ക്, പ്രൊഫഷണൽ മനുഷ്യ പരിഭാഷ ശുപാർശ ചെയ്യുന്നു. ഈ പരിഭാഷ ഉപയോഗിച്ച് ഉണ്ടാകുന്ന തെറ്റിദ്ധാരണകൾ അല്ലെങ്കിൽ തെറ്റായ വ്യാഖ്യാനങ്ങൾക്കായി ഞങ്ങൾ ഉത്തരവാദികളല്ല.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->