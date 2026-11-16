# មគ្គុទេសក៍ការកំណត់កំណត់រចនា

**ការមានផ្លូវសម្រាប់ជំពូក:**
- **📚 ផ្ទះវគ្គ**៖ [AZD សម្រាប់អ្នកដំបូង](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**៖ ជំពូក 3 - កំណត់រចនា និងការផ្ទៀងផ្ទាត់អត្តសញ្ញាណ
- **⬅️ មុននេះ**៖ [គម្រោងទីមួយរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ បន្ទាប់**៖ [មគ្គុទេសក៍ការដាក់បញ្ចូល](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ជំពូកបន្ទាប់**៖ [ជំពូក 4៖ រចនាសម្ព័ន្ធជារចនាសម្ព័ន្ធកូដ](../chapter-04-infrastructure/deployment-guide.md)

## ការណែនាំ

> បានពិនិត្យឡើងវិញប្រឆាំងនឹង `azd 1.37.2` (វិច្ឆិកា 2026)។ ពាក្យបញ្ជារ Bash លក្ខណៈគោរពថាគម្រោង azd ត្រូវបានបង្កើតរួចហើយ។ លុះត្រាតែបានពិពណ៌នា​ពិសេសថាជាឯកសារពេញលេញ ប្លុក YAML/Bicep គឺជាផ្នែកតូចៗ សម្រាប់បញ្ចូលទៅក្នុងឯកសារគម្រោងដែលសម្របសម្រួលគ្នា មិនមែនជាគម្រោងរត់ដោយខ្លួនឯងទេ។

មគ្គុទេសក៍បូកសរុបនេះគ្របដណ្តប់គ្រប់ជ្រុងជ្រោយនៃការកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI សម្រាប់ដំណើរការអភិវឌ្ឍ និងដាក់បញ្ចូលតាមរយៈវិធីសាស្រ្តល្អឥតខ្ចោះ។ អ្នកនឹងរៀនអំពីលំដាប់កំណត់រចនា ការគ្រប់គ្រងបរិយាកាស វិធីAuthentication និងគំរូកំណត់រចនាសម្ព័ន្ធកម្រិតខ្ពស់ ដែលអនុញ្ញាតឱ្យមានការដាក់បញ្ចូល Azure ដោយមានប្រសិទ្ធភាពនិងសុវត្ថិភាព។

## គោលដៅរៀន

នៅចុងបញ្ចប់មេរៀននេះ អ្នកនឹង:
- ស្គាល់លំដាប់កំណត់រចនាសម្ព័ន្ធ azd និងយល់ពីរបៀបដែលការកំណត់ត្រូវបានអាទិភាព
- កំណត់ការកំណត់ទូទៅ និងសម្រាប់គម្រោងជាដំណើរការល្អឥតខ្ចោះ
- គ្រប់គ្រងបរិយាកាសច្រើនជាមួយនឹងកំណត់រចនាសម្ព័ន្ធខុសគ្នា
- អនុវត្តវិធីបញ្ជាក់អត្តសញ្ញាណនិងអំណាចក្រោមសុវត្ថិភាព
- យល់ដឹងពីគំរូកំណត់រចនាសម្ព័ន្ធកម្រិតខ្ពស់សម្រាប់ស្ថានភាពស្មុគស្មាញ

## លទ្ធផលរៀន

បន្ទាប់ពីបញ្ចប់មេរៀននេះ អ្នកនឹងអាច:
- កំណត់ azd សម្រាប់ដំណើរការអភិវឌ្ឍល្អបំផុត
- បង្កើត និងគ្រប់គ្រងបរិយាកាសដាក់បញ្ចូលច្រើន
- អនុវត្តន៍ការគ្រប់គ្រងកំណត់រចនាសម្ព័ន្ធយ៉ាងមានសុវត្ថិភាព
- គ្រប់គ្រងបញ្ហាដែលពាក់ព័ន្ធនឹងការកំណត់រចនា
- ប្ដូរប្រព័ន្ធបន្តការរបស់ azd សម្រាប់តម្រូវការស្ថាប័នជាក់លាក់

មគ្គុទេសក៍បូកសរុបនេះគ្របដណ្តប់គ្រប់ជ្រុងជ្រោយនៃការកំណត់រចនា Azure Developer CLI សម្រាប់ដំណើរការអភិវឌ្ឍ និងដាក់បញ្ចូលតាមរយៈវិធីសាស្រ្តល្អឥតខ្ចោះ។

## ការយល់ដឹងអំពី AI Agents ក្នុងគម្រោង azd

ប្រសិនបើអ្នកនៅថ្មីទៅនឹង AI agents នេះជាវិធីងាយស្រួលក្នុងការយល់អំពីពួកវាក្នុងលោក azd។

### តើ Agent ជាអ្វី?

Agent គឺជាកម្មវិធីមួយដែលអាចទទួលសំណើ សម្រេចចិត្តលើវា ហើយអនុវត្តចំពោះសកម្មភាព—ជាញឹកញាប់តាមរយៈការហៅម៉ូដែល AI មួយ ស្វែងរកទិន្នន័យ ឬហៅសេវាកម្មផ្សេងៗ។ ក្នុងគម្រោង azd, agent គ្រាន់តែជាសេវាកម្មមួយទៀត អ្នកថាតែ ដូចជា frontend គេហទំព័រ ឬ API backend។

### របៀបAgent ត្រូវបានបញ្ចូលក្នុងរចនាសម្ព័ន្ធគម្រោង azd

គម្រោង azd ត្រូវបានបង្កើតពីបីស្រទាប់៖ **រចនាសម្ព័ន្ធ**, **កូដ** និង **កំណត់រចនា**។ Agent ត្រូវបានភ្ជាប់ទៅកាន់ស្រទាប់ទាំងនេះ ដូចសេវាកម្មផ្សេងៗ:

| ស្រទាប់ | តើវាធ្វើអ្វីសម្រាប់កម្មវិធីបុរាណ | តើវាធ្វើអ្វីសម្រាប់Agent |
|-------|-------------------------------------|---------------------------|
| **រចនាសម្ព័ន្ធ** (`infra/`) | បង្កើតកម្មវិធីបណ្តាញ និងមូលដ្ឋានទិន្នន័យ | បង្កើតចំណុចចេញម៉ូដែល AI, សន្ទស្សន៍ស្វែងរក ឬម៉ាស៊ីនផ្ទះអ្នកភ្ជាប់Agent |
| **កូដ** (`src/`) | មានកូដមុខងារនិង API របស់អ្នក | មានលូហ្ស៊ីក Agent និងកំណត់លក្ខណៈ prompt |
| **កំណត់រចនា** (`azure.yaml`) | បញ្ជីសេវាកម្ម និងគោលដៅម៉ាស៊ីនបម្រើ | បញ្ជី Agent ជាសេវាកម្ម មើលទៅកូដ និងម៉ាស៊ីនបម្រើរបស់វា |

### តួនាទីរបស់ `azure.yaml`

អ្នកមិនចាំបាច់ចង់ចងចាំវា ពីព្រោះ `azure.yaml` គឺជា ឯកសារដែលអ្នកប្រាប់ azd ថា: *"នេះជាសេវាកម្មជាចម្បងក្នុងកម្មវិធីរបស់ខ្ញុំ ហើយនេះជាទីតាំងកូដរបស់ពួកវា។"*

នៅពេលគម្រោងរបស់អ្នកមាន AI agent, `azure.yaml` គ្រាន់តែបញ្ជីបន្ថែមAgent នោះជាសេវាកម្មមួយ។ azd នឹងដឹងថាត្រូវបង្កើតរចនាសម្ព័ន្ធត្រឹមត្រូវ (ដូចជា Microsoft Foundry Models endpoint ឬ Container App សម្រាប់ផ្ទុកAgent) និងដាក់កូដAgent ដូចការប្រើប្រាស់សម្រាប់កម្មវិធីបណ្តាញ ឬ API។

នេះមានន័យថា មិនមានអ្វីថ្មីឆ្ពោះម្ដងទេ។ ប្រសិនបើអ្នកយល់ដឹងពីរបៀបដែល azd គ្រប់គ្រងសេវាកម្មបណ្តាញ អ្នកប្រាកដជាយល់ដឹងពីរបៀបដែលវាគ្រប់គ្រង Agent ផងដែរ។

## លំដាប់កំណត់រចនា

azd មានផ្ទៃកំណត់រចនាសម្ព័ន្ធដែលចម្ងាយគ្នា មិនមែនការកំណត់រចនាសម្ព័ន្ធគ្រប់គ្រាន់មួយទេ:
- **ចំណូលចិត្តអ្នកប្រើទូទៅ**៖ `~/.azd/config.json`, គ្រប់គ្រងដោយ `azd config`។
- **សេចក្ដីកំណត់គម្រោង**៖ `azure.yaml` បញ្ជាក់ពីសេវាកម្ម រចនាសម្ព័ន្ធ និង ខ្សែស្រឡាយ។
- **ជ្រើសរើសបរិយាកាសមូលដ្ឋាន**៖ `.azure/config.json`។
- **តម្លៃសម្រាប់បរិយាកាសនីមួយៗ**៖ `.azure/<name>/.env` គ្រប់គ្រងដោយ `azd env`; ការកំណត់បន្ថែមស្ថិតក្នុង `config.json` នៃបរិយាកាសនោះ។
- **ទង់សញ្ញានិងអថេររបៀបដំណើរការ**៖ ធ្វើការបដិសេធតែការកំណត់ដែលគាំទ្រដោយពាក្យបញ្ជាឬអ្នកផ្គត់ផ្គង់ណាមួយ។

តម្លៃ `azd env set` មួយដែលចៃដន្យ មិនបានបម្លែងជាការបញ្ជាផ្ទៃខាងក្នុង ឬការកំណត់កម្មវិធីដែលបានដាក់បញ្ចូលឡើយ។ ត្រូវយោងវាយ៉ាងច្បាស់ក្នុងឯកសារពាម៉ែត្រ ការកំណត់សេវាកម្មដែលគាំទ្រ ឬខ្សែស្រឡាយ។

## កំណត់រចនាសម្ព័ន្ធទូទៅ

### កំណត់ការលំនាំដើមទូទៅ
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# View all global configuration
azd config show

# Remove a configuration
azd config unset defaults.location
```

### ការកំណត់ទូទៅទូទៅដែលត្រូវបានប្រើ
```bash
# Discover supported settings instead of inventing configuration keys
azd config options
azd config list-alpha

# Explicit opt-in only: use Azure CLI credentials rather than azd's default login
azd config set auth.useAzCliAuth true
# Restore azd's default credential behavior
azd config unset auth.useAzCliAuth

# Use per-command flags for supported behavior
azd show --output json
azd deploy --timeout 1800   # seconds; stops waiting, not the Azure-side deployment
```

## 🏗️ កំណត់រចនាសម្ព័ន្ធគម្រោង

### រចនាសម្ព័ន្ធ azure.yaml
ឯកសារ `azure.yaml` គឺជាចិត្តដួងនៃគម្រោង azd របស់អ្នក៖

```yaml
# Minimum configuration
name: my-awesome-app
metadata:
  template: my-template@1.0.0

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
      context: .
      path: Dockerfile
    
# Infrastructure configuration
infra:
  provider: bicep                   # Infrastructure provider
  path: ./infra                    # Infrastructure code location

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

នេះគឺជា **ឧទាហរណ៍កំណត់គម្រោង** មិនមែនជារូបមន្តចាប់ផ្តើម។ បង្កើតថតប្រភពដែលបានយោង ស្គ្រីបខ្សែស្រឡាយ ស្គ្រីបកញ្ចប់ និងប្រភេទ `infra/main.bicep`/`main.parameters.json` មុនពេលរត់វា។ មូលដ្ឋានទិន្នន័យស្ថិតក្នុងរចនាសម្ព័ន្ធ; `postgres` មិនមែនជាម៉ាស៊ីនផ្ទះសេវាកម្មបញ្ចូលមួយ។ ពាម៉ែត្ររចនាសម្ព័ន្ធដាក់នៅក្នុងឯកសារពាម៉ែត្រអ្នកផ្គត់ផ្គង់មិនមែននៅក្នុង `infra.parameters`។

### ជម្រើសកំណត់រចនាសម្ព័ន្ធសេវាកម្ម

#### ប្រភេទម៉ាស៊ីនផ្ទះ
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

#### ខ្សែស្រឡាយសម្រាប់ភាសារពិសេស

ផ្នែកសេវាកម្មខាងក្រោមបង្ហាញខ្សែស្រឡាយ; បញ្ចូលវាជាមួយ `project` និង `host` ពិតប្រាកដនៃសេវាកម្មនីមួយៗ។ `buildCommand` និង `startCommand` មិនមែនជាគុណលក្ខណៈសេវាកម្ម azd ជាទូទៅទេ។ កំណត់ការចាប់ផ្តើមប្រតិបត្តិការនៅក្នុងកម្មវិធី Dockerfile ឬរចនាសម្ព័ន្ធម៉ាស៊ីនផ្ទះ។

```yaml
services:
  node-app:
    project: ./src/node
    host: appservice
    language: js
    hooks:
      prepackage:
        shell: sh
        run: npm run build
    
  python-app:
    project: ./src/python
    host: appservice
    language: python
    
  dotnet-app:
    project: ./src/dotnet
    host: appservice
    language: csharp
    
  java-app:
    project: ./src/java
    host: appservice
    language: java
```

## 🌟 ការគ្រប់គ្រងបរិយាកាស

### បង្កើតបរិយាកាស
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### កំណត់រចនាសម្ព័ន្ធបរិយាកាស
តម្លៃបរិស្ថានមូលដ្ឋាននៅក្នុង `.azure/<env-name>/.env` រួមមាន `AZURE_ENV_NAME`, `AZURE_SUBSCRIPTION_ID`, និង `AZURE_LOCATION`។ ប្រើ `azd env config get/set` សម្រាប់ការកំណត់បរិស្ថាន JSON បន្ថែម។ JSON ខាងក្រោមគឺ​ជា **ស្ថានភាពកម្មវិធីគំនិត**, មិនមែនស្គីម៉ាផ្គុំ azd ទេ; កុំចម្លងវា​ទៅក្នុងគេហទំព័រ azd:

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

### ឧបករណ៍បរិស្ថាន

**ការបង្ហាញតែអក្សរធម្មតា។** តម្លៃ `azd env set` មានស្រាប់ត្រូវបានសរសេរទៅគោលដៅ `.azure/<name>/.env` ហើយអាចបង្ហាញបានដោយពាក្យបញ្ជាពិសេស។ កុំប្រើកូនសោ API ឧទាហរណ៍ជាការផ្ទៀងផ្ទាត់ពិត។ សម្រាប់សម្ងាត់ ប្រើ `azd env set-secret` និងការតភ្ជាប់រយៈពេលរត់យ៉ាងច្បាស់។

```bash
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Expected output:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# Remove environment variable
azd env unset DEBUG

# Verify removal
azd env get-values | grep DEBUG
# (should return nothing)
```

### រចនាប័ទ្មបរិស្ថាន
បង្កើត **ឯកសារមិនសម្ងាត់ ដែលគ្រប់គ្រងដោយដៃ** `.env.example` នៅធ្មេញគម្រោងសម្រាប់ការតំឡើងរសជាតិដូចគ្នា។ azd មិនទាញយកឯកសារដែលមានឈ្មោះ `env.template` ដោយស្វ័យប្រវត្តិទេ:
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

### ការចែករំលែកបរិស្ថាននៅក្នុងក្រុម

នៅពេលមានមនុស្សច្រើនធ្វើការលើគម្រោង មនុស្សទាំងអស់ត្រូវព្រមព្រៀងអំពី **អ្វីដែលត្រូវផ្ទុកជាមួយ repo និងអ្វីដែលនៅក្នុងតំបន់ជាលokal**។ azd រក្សាបរិស្ថាននីមួយៗនៅក្នុងថត `.azure/` ហើយមិនគ្រប់យ៉ាងគួរជាប់ commit ទៅ។

**អ្វីដែលនៅក្នុង `.azure/`៖**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # additional environment settings
    └── .env                 # subscription, location, outputs; may contain secrets!
```

**អ្វីដែលគួរត្រូវ gitignore។** ជូនការកំណត់លំនាំដោយស្វ័យប្រវត្តិរបស់ azd រួចហើយក្នុង `.gitignore` បានរារាំង `.azure/`។ រក្សាវា�អោយដដែល—ឯកសារ `.env` អាចមានសម្ងាត់ ហើយអត្តសញ្ញាណ resource គឺជារបស់អ្នកដែលបាន Provision ផ្ទាល់។ មិត្តប្រដាល់រៀបចំបរិស្ថាន **ផ្ទាល់ខ្លួន** របស់ពួកគេនៅក្នុងតំបន់ជាលokal៖

```bash
# Every developer runs this once to get their own isolated environment
azd env new dev-alice
azd up
```

**ការប្តូរវិញរវាងបរិស្ថាន។** អ្នកអភិវឌ្ឍដែលគ្រប់គ្រងបរិស្ថានច្រើនជ្រើសរើសប្រើបរិស្ថានសកម្មមុនបញ្ជារ:

```bash
azd env list                 # see all local environments and which is default
azd env select staging       # make 'staging' the active environment
azd env get-values           # confirm you're pointed at the right one
```

**ការផ្តល់ទិន្នន័យលំនាំមិនសម្ងាត់ដល់ក្រុម។** Commit `.env.example` ខាងក្រៅថត ignore `.azure/`។ មិត្តថ្មីចម្លងវាទៅឯកសារគំរូមិនគិតសោះ បញ្ចូលតម្លៃ ហើយនាំចូលយ៉ាងច្បាស់ជាមួយ `azd env set --file <local-file>`។ កុំដែលនាំចូលពន្លឺទំនេរក្នុងបរិស្ថានធ្វើការ។

**បរិស្ថានក្នុង CI/CD។** ប្រព័ន្ធ Pipeline មិនអានថត `.azure/` នៅក្នុងតំបន់ជាលokal របស់អ្នកទេ។ ជំនួស ប្រគល់តម្លៃបរិស្ថានជាផលិតផល/សម្ងាត់ pipeline ហើយ azd អានវាពីបរិស្ថានដំណើរការ:

```bash
# In CI, azd reads these from the environment, not from .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID="<sub-id>"
azd provision --no-prompt
azd deploy --no-prompt
```

> **ច្បាប់បំភ្លឺដៃ:** កូដហេដ្ឋារចនាសម្ព័ន្ធ (`infra/`, `azure.yaml`) ត្រូវបានចែករំលែកក្នុង Git; *ស្ថានភាពបរិស្ថាន និងសម្ងាត់* (`.azure/`) ជាបរដ្ឋបុគ្គលនិងpipeline។ `azd pipeline config` កំណត់អថេរពេលបើក pipeline ដោយស្វ័យប្រវត្តិ។

## 🔐 ការកំណត់ការផ្ទៀងផ្ទាត់

### ស៊េរី CLI Azure
```bash
# Explicit opt-in; NOT the default
azd config set auth.useAzCliAuth true

# Login with specific tenant
az login --tenant "<tenant-id>"

# Set default subscription
az account set --subscription "<subscription-id>"
```

### ការផ្ទៀងផ្ទាត់សេវារដ្ឋបាល
សម្រាប់ pipelines CI/CD:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Authenticate azd explicitly (prefer pipeline federation over a long-lived secret)
azd auth login --client-id "$AZURE_CLIENT_ID" \
  --client-secret "$AZURE_CLIENT_SECRET" --tenant-id "$AZURE_TENANT_ID"
```

### អត្តសញ្ញាណគ្រប់គ្រង
សម្រាប់បរិស្ថានដែលបម្រើនៅ Azure:
```bash
# Enable managed identity authentication
azd auth login --managed-identity
# Alternative: choose an identity assigned to the host by client ID
azd auth login --managed-identity --client-id "<managed-identity-client-id>"
```

## 🏗️ ការកំណត់បរិស្ថានហេដ្ឋារចនាសម្ព័ន្ធ

### ប៉ារ៉ាម៉ែត្រ Bicep
កំណត់ប៉ារ៉ាម៉ែត្រហេដ្ឋារចនាសម្ព័ន្ធនៅក្នុង `infra/main.parameters.json`:
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

### ការកំណត់ Terraform
សម្រាប់គម្រោង Terraform, azd ជំនួសភាសាថតបែប `infra/main.tfvars.json`។ ឈ្មោះទាំងនេះត្រូវតែសមនឹងអថេរចូលដំណើរការ Terraform ដែលបានប្រាប់:
```json
{
  "environment_name": "${AZURE_ENV_NAME}",
  "location": "${AZURE_LOCATION}",
  "app_service_sku": "B1"
}
```

## 🚀 ការកំណត់ការចេញផ្សាយ

### ការកំណត់ការសាងសង់
```yaml
# In azure.yaml
services:
  web:
    project: ./src/web
    host: appservice
    language: js
    dist: build
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          NODE_ENV=production REACT_APP_API_URL="$API_URL" npm run build:prod
    
  api:
    project: ./src/api
    host: appservice
    language: python
    hooks:
      prepackage:
        shell: sh
        run: |
          set -e
          python -m pip install -r requirements.txt
          PYTHONPATH=src python -m pytest tests/
```

### ការកំណត់ Docker
```yaml
services:
  api:
    project: ./src/api
    host: containerapp
    docker:
      context: .
      path: Dockerfile
      buildArgs:
        - NODE_ENV=production
        - API_VERSION=v1.0.0
```
 ផ្លូវគឺជាចំនួនសម្គាល់ទៅកាន់គម្រោងសេវាកម្ម។ Dockerfile ត្រូវតែប្រកាសតម្លៃ `ARG` មួយចំនួនដែលវារួមបញ្ចូល។ សម្រាប់ការសាងសង់ច្រើនជំហាន, ដាក់ជំហាន់ចុងក្រោយដែលអាចចេញផ្សាយបាន ឬប្រើវិធីសាស្ត្រវេចកបំណះផ្ទាល់ខ្លួន; `docker.target` មិនមែនជាគុណលក្ខណៈគាំទ្រនៅក្នុងស្គីម៉ា​ដែលបានពិនិត្យទេ។

## 🔧 ការកំណត់កម្រិតខ្ពស់

### ការហៅឈ្មោះធនធានផ្ទាល់ខ្លួន
```yaml
# azure.yaml fragment: override resource-group discovery where appropriate
resourceGroup: rg-${AZURE_ENV_NAME}
```

កំណត់ឈ្មោះធនធានពិតប្រាកដនៅក្នុង Bicep/Terraform ហើយរក្សាការបង្កើត resource-group ស្របតាមការកំណត់នេះ។ គ្មានគណៈកម្មការបញ្ចូល `naming.storageAccount` ឬ `naming.keyVault` ទូទៅទេ។

### ការកំណត់បណ្តាញ
```json
{
  "vnetAddressPrefix": { "value": "10.0.0.0/16" },
  "subnetAddressPrefix": { "value": "10.0.1.0/24" },
  "enablePrivateEndpoints": { "value": true }
}
```

បញ្ចូលចូលនូវ **ប៉ារ៉ាម៉ែត្របង្ហាញនេះ** ទៅក្នុង `infra/main.parameters.json` ខណៈក្រោម `parameters` ហើយប្រកាសនិងប្រើប៉ារ៉ាម៉ែត្រដែលផ្គូរផ្គងនៅក្នុង Bicep។ វាមិនធ្វើអ្វីដោយខ្លួនវាទេ។

### ការកំណត់ការត្រួតពិនិត្យ
ផ្គត់ផ្គង់ Application Insights និង Log Analytics ក្នុង Bicep/Terraform ហើយកំណត់ការត្រួតពិនិត្យកម្មវិធីនៅក្នុង SDK របស់អ្នក។ គ្មាន `monitoring` កំហែងកំពូលទូទៅនៅក្នុង `azure.yaml` ដែលបង្កើតធនធានទាំងនេះទេ។ មើល [ហេដ្ឋារចនាសម្ព័ន្ធត្រួតពិនិត្យ](../chapter-04-infrastructure/provisioning.md#-monitoring-and-observability)។

## 🎯 ការកំណត់ពិសេសបរិស្ថាន

### បរិស្ថានអភិវឌ្ឍន៍
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### បរិស្ថានស្ទើយ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### បរិស្ថានផលិត
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ការត្រួតពិនិត្យការកំណត់

### ពិនិត្យការកំណត់
```bash
# Inspect supported global settings and current project
azd config options
azd show

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --preview
```

### ស្ក្រីបកំណត់
បង្កើតស្ក្រីបត្រួតពិនិត្យនៅក្នុង `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Ask azd to load the project (not full schema or infrastructure validation)
if ! azd show --output json; then
  echo "Error: Could not load the azd project"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 អនុវត្តការអនុវត្តល្អបំផុត

### 1. ប្រើអថេរបរិស្ថាន
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

```

ជៀសវាងការបញ្ចូលតម្លៃដែលមានសម្ងាត់ដោយផ្ទាល់ (ចែកគ្នាការកំណត់ពិរុទ្ធិ, មិនមែនជាសោរ `database` ទី២ ក្នុងឯកសារដូចគ្នា):

```yaml
# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. រៀបចំឯកសារកំណត់
```
.azure/
├── config.json              # Global project config
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

### 3. ការពិចារណាលើការគ្រប់គ្រងកំណែ
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. ឯកសារកំណត់ឯកសារ
ចុះបញ្ជីកំណត់ឯកសាររបស់អ្នកនៅក្នុង `CONFIG.md`:
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

## 🎯 ការអនុវត្តដៃក្នុង

### លំហាត់៖ ការកំណត់បរិស្ថានច្រើន (១៥ នាទី)

**គោលបំណង**: បង្កើតនិងកំណត់បរិស្ថានទាំងបីក្នុងតំបន់ជាលokal ជាមួយតម្លៃផ្សេងៗគ្នា។ ចាប់ផ្តើមពីគម្រោងដែលបានចាប់ផ្តើមដោយ initialize; ប្រើឈ្មោះដែលមិនបានប្រើប្រសិនបើមានរួច។ តម្លៃទាំងនេះជារបស់កម្មវិធីពិសេស មិនផ្លាស់ប្តូរការត្រួតពិនិត្យសញ្ញា/រដ្ឋបាលរត់រួចទេ រហូតដល់រចនាប័ទ្មរបស់អ្នកប្រើវា។

```bash
# Create development environment
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# Create staging environment
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# Create production environment
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# Verify each environment
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] បរិស្ថានបីត្រូវបានបង្កើតដោយជោគជ័យ
- [ ] បរិស្ថាននីមួយៗមានការកំណត់តែមួយ
- [ ] អាចប្តូរវិញរវាងបរិស្ថានដោយគ្មានកំហុស
- [ ] `azd env list` បង្ហាញបរិស្ថានទាំងបី

### លំហាត់ ២៖ ឯកសារសម្ងាត់ Key Vault (១០-២០ នាទី)

**គោលបំណង**: រក្សាទុកយោង Key Vault ជំនួសវត្ថុអក្សរធម្មតា។ **ចំណុចចាប់ផ្តើម:** បរិស្ថានបាន initialize, បានចូលរួម Azure, និងមានការចូលដំណើរការទៅកាន់ Key Vault ជាមួយសិទ្ធិបង្កើត/អានឯកសារសម្ងាត់កំណត់មួយ។ ប្រតិបត្ដិប្រព័ន្ធ Vault អាចធ្វើឱ្យមានការចំណាយ។

```bash
# Follow the interactive prompts; use a dummy training value, not a production key
azd env set-secret TRAINING_API_KEY

# Set non-secret config
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# Inspect .azure/<environment>/.env locally: TRAINING_API_KEY should
# contain an azd Key Vault reference, not the dummy secret text.
# Do not print resolved values in CI or shared terminal logs.
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] ពាក្យបញ្ជាផ្សារពាណិជ្ជកម្មបង្ហាញឲ្យដឹងពី Vault និងឯកសារសម្ងាត់ដែលបានជ្រើស
- [ ] បរិស្ថានផ្ទាល់ខ្លួន `.env` មានយោង ខុសពីឯកសារសម្ងាត់កំណត់
- [ ] អាចពណ៌នាបានថា identité runtime / RBAC និងការប្រើប្រាស់ ត្រូវតែត្រូវបានកំណត់បន្ថែម

**បញ្ហាទូទៅ៖** កូដ ៤០៣ តម្រូវឱ្យមានតួនាទី data-plane vault ត្រឹមត្រូវ និងពេលវេលាបណ្តូលលក្ខណៈ; `azd env set ... --secret` មិនមែនជាពាក្យបញ្ជាដែលត្រឹមត្រូវទេ។ ការចេញផល Ordinary `get-values`/`get-value` មិនគួររក្សាបានថាសកម្ម។ ប្រើ `azd env unset TRAINING_API_KEY` ដើម្បីដកយោងហាត់ប្រាណនេះចេញ; នេះមិនជាលុបឯកសារសម្ងាត់ vault ទេ ដែលអ្នកត្រូវរៀបចំសម្អាតវាផ្ទាល់ខ្លួនបើអ្នកបានបង្កើតវា។

## ជំហានបន្ទាប់

- [គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md) - អនុវត្តការកំណត់ក្នុងការប្រតិបត្តិ
- [មើលមាគ៌ាចេញផ្សាយ](../chapter-04-infrastructure/deployment-guide.md) - ប្រើការកំណត់សម្រាប់ចេញផ្សាយ
- [កំណត់ធនធាន](../chapter-04-infrastructure/provisioning.md) - ការកំណត់រួចរាល់សម្រាប់ផលិតកម្ម

## ឯកសារយោង

- [យោងការកំណត់ azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [ស្គីម៉ា azure.yaml](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-schema)
- [អថេរបរិស្ថាន](https://learn.microsoft.com/azure/developer/azure-developer-cli/manage-environment-variables)

---

**ការរុករកជាផ្នែក៖**
- **📚 ទំព័រមុខវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 មុខវិជ្ជាបច្ចុប្បន្ន**: មុខវិជ្ជា 3 - ការកំណត់រចនា & ការផ្ទៀងផ្ទាត់​អត្តសញ្ញាណ
- **⬅️ មុន**: [គម្រោងដំបូងរបស់អ្នក](../chapter-01-foundation/first-project.md)
- **➡️ មុខវិជ្ជាបន្ទាប់**: [មុខវិជ្ជា 4: មូលដ្ឋានរចនាសម្ព័ន្ធជា​កូដ](../chapter-04-infrastructure/deployment-guide.md)
- **មុខវិជ្ជាបន្ទាប់**: [ការផ្ទៀងផ្ទាត់​អត្តសញ្ញាណ & សន្តិសុខ](authsecurity.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->