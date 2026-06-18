# មគ្គុទេសក៍ការកំណត់

**ការរុករកជំពូក:**
- **📚 ផ្ទះវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូក​បច្ចុប្បន្ន**: ជំពូក 3 - ការកំណត់រចនា និង ការផ្ទៀងផ្ទាត់
- **⬅️ មុន**: [គម្រោងដំបូងរបស់អ្នក](first-project.md)
- **➡️ បន្ទាប់**: [មគ្គុទេសក៍ការបញ្ជូន](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 4: រចនាសម្ព័ន្ធជា​កូដ](../chapter-04-infrastructure/deployment-guide.md)

## ការណែនាំ

មគ្គុទេសក៍ទូលំទូលាយនេះគ្របដណ្តប់ទាំងអស់ចំពោះមុខវិជ្ជាក្នុងការកំណត់ Azure Developer CLI សម្រាប់ដំណើរការ ανάπτυξη និងការដាក់ឲ្យដំណើរការ។ អ្នកនឹងរៀនអំពីលំដាប់អាទិភាពនៃការកំណត់ របៀបគ្រប់គ្រងបរិយាកាស វិធីសាស្ត្រផ្ទៀងផ្ទាត់ និងរបៀបកំណត់ខ្ពស់ដែលអនុញ្ញាតឲ្យដាក់បញ្ចូលទៅ Azure បានយ៉ាងមានប្រសិទ្ធភាព និងសុវត្ថិភាព។

## គោលដៅការសិក្សា

នៅចុងបញ្ចប់មេរៀននេះ អ្នកនឹងអាច:
- ជាន់ចំណេះដឹងលំដាប់កំណត់រចនានៃ azd និងយល់ពីរបៀបដាក់ជាអាទិភាពនៃការកំណត់
- កំណត់ការកំណត់សកល និងសម្រាប់គម្រោងយ៉ាងមានប្រសិទ្ធភាព
- គ្រប់គ្រងបរិយាកាសច្រើនជាមួយការកំណត់ខុសគ្នា
- អនុវត្តវិធីសាស្ត្រផ្ទៀងផ្ទាត់ និងអនុញ្ញាតយ៉ាងសុវត្ថិភាព
- យល់ពីបែបផែនកំណត់ខ្ពស់សម្រាប់សถานการณ์ស្មុគស្មាញ

## លទ្ធផលការសិក្សា

បន្ទាប់ពីបញ្ចប់មេរៀននេះ អ្នកនឹងអាច:
- កំណត់ azd សម្រាប់លំហប្រុងប្រយ័ត្នអភិវឌ្ឍន៍
- រៀបចំ និងគ្រប់គ្រងបរិយាកាសច្រើនសម្រាប់ដាក់ឲ្យដំណើរការ
- អនុវត្តការគ្រប់គ្រងការកំណត់យ៉ាងសុវត្ថិភាព
- ដោះស្រាយបញ្ហាទាក់ទងនឹងការកំណត់
- ប្តូរទម្រង់ឲ្យ azd សមរម្យសម្រាប់តម្រូវការរបស់អង្គភាព

មគ្គុទេសក៍ទូលំទូលាយនេះគ្របដណ្តប់ទាំងអស់ចំពោះមុខវិជ្ជាក្នុងការកំណត់ Azure Developer CLI សម្រាប់ដំណើរការ ανάπτυξη និងការដាក់ឲ្យដំណើរការ។

## ការយល់ដឹងអំពីភ្នាក់ងារ AI ក្នុងគម្រោង azd

បើអ្នកថ្មីចំពោះភ្នាក់ងារ AI នេះជាវិធីសាមញ្ញក្នុងការគិតអំពីពួកវាក្នុងពិភព azd។

### ភ្នាក់ងារ (Agent) ជាអ្វី?

ភ្នាក់ងារ គឺជាកម្មវិធីមួយដែលអាចទទួលសំណើ កាយវិការអំពីវា និងចាត់វិធានការណ៍—ភាគច្រើនដោយហៅទៅម៉ូដែល AI មួយ ស្វែងរកទិន្នន័យ ឬអំពើសេវាពីក្រៅ។ ក្នុងគម្រោង azd ភ្នាក់ងារជាសេវាកម្មមួយទៀតគួរត្រូវដូចសេវាកម្មវេបផែនអោយឬ API ប្រាក់ក្រោយ។

### ភ្នាក់ងារភ្ជាប់យ៉ាងដូចម្តេចទៅនឹងរចនាសម្ព័ន្ធគម្រោង azd

គម្រោង azd សមាសមកពីបីស្រទាប់៖ **រចនាសម្ព័ន្ធ**, **កូដ**, និង **ការកំណត់**។ ភ្នាក់ងារចូលរួមក្នុងស្រទាប់ទាំងនេះដូចជា​សេវាកម្មផ្សេងទៀត:

| Layer | អ្វីដែលវាធ្វើសម្រាប់កម្មវិធីប្រពៃណី | អ្វីដែលវាធ្វើសម្រាប់ភ្នាក់ងារ |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | ផ្តល់សេវាវេប និងទិន្នន័យតារាង | ផ្តល់ចុងក្រឡាចុងម៉ូដែល AI ឬសន្ទស្សន៍ស្វែងរក ឬម៉ាស៊ីនផ្ទុកភ្នាក់ងារ |
| **Code** (`src/`) | រួមមានកូដផ្នែកមុខ និង API របស់អ្នក | រួមមានតុល្យភាពភ្នាក់ងារ និងកំណត់សំណួរ (prompts) |
| **Configuration** (`azure.yaml`) | បញ្ជីសេវាកម្ម និងគោលដៅបម្រើ | បញ្ជីភ្នាក់ងារជាសេវាកម្ម ស្នើឲ្យចង្អុលទៅកូដ និងម៉ាស៊ីនផ្ទុករបស់វា |

### តួនាទីរបស់ `azure.yaml`

អ្នកមិនចាំបាច់ចាំបាច់យកវា​ទុកក្នុងចិត្តឥលូវនេះទេ។ នៅលើកម្រិតយោល `azure.yaml` ជាឯកសារដែលអ្នកប្រាប់ azd ថា: "នេះជាសេវាកម្មដែលបង្កើតកម្មវិធីរបស់ខ្ញុំ ហើយនេះជាទីកន្លែងដែលអាចរកកូដបាន។"

ពេលគម្រោងរបស់អ្នកមានភ្នាក់ងារ AI `azure.yaml` នឹងបញ្ជីភ្នាក់ងារនោះជា​សេវាកម្មមួយ។ azd នឹងដឹងធ្វើការផ្តល់រចនាសម្ព័ន្ធត្រឹមត្រូវ (ឧ. ចុងម៉ូដែល Microsoft Foundry Models ឬ Container App សម្រាប់ផ្ទុកភ្នាក់ងារ) និងដាក់កូដភ្នាក់ងាររបស់អ្នក—ដូចជា​វានឹងធ្វើសម្រាប់កម្មវិធីវេប ឬ API។

នេះមានន័យថាមិនមានអ្វីចាំបាច់ថ្មីជាចម្បងក្នុងការរៀន។ ប្រសិនបើអ្នកយល់ពីរបៀប azd គ្រប់គ្រងសេវាកម្មវេប អ្នកបានយល់ពីរបៀបវាគ្រប់គ្រងភ្នាក់ងារហើយ។

## លំដាប់អាទិភាពនៃការកំណត់

azd ប្រើប្រព័ន្ធកំណត់ដែលមានលំដាប់អាទិភាព:
1. **ពាក្យបញ្ជាច្រើនបន្ទាត់** (Command-line flags) (អាទិភាពខ្ពស់បំផុត)
2. **អថេរបរិយាកាស**
3. **ការកំណត់គម្រោងក្នុងស្រុក** (`.azd/config.json`)
4. **ការកំណត់អ្នកប្រើសកល** (`~/.azd/config.json`)
5. **តម្លៃលំនាំដើម** (អាទិភាពទាបបំផុត)

## ការកំណត់សកល

### ការកំណត់តម្លៃលំនាំដើមសកល
```bash
# កំណត់ការជាវលំនាំដើម
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# កំណត់ទីតាំងលំនាំដើម
azd config set defaults.location "eastus2"

# កំណត់គោលការណ៍កំណត់ឈ្មោះក្រុមធនធានលំនាំដើម
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# មើលការកំណត់សកលទាំងអស់
azd config show

# លុបការកំណត់មួយ
azd config unset defaults.location
```

### ការកំណត់សកលដែលទូទៅ
```bash
# ចំណូលចិត្តសម្រាប់ការអភិវឌ្ឍន៍
azd config set alpha.enable true                    # បើកមុខងារ អាល់ហ្វា
azd config set telemetry.enabled false             # បិទការតាមដានតេលេមេត្រី
azd config set output.format json                  # កំណត់ទ្រង់ទ្រាយលទ្ធផល

# ការកំណត់សុវត្ថិភាព
azd config set auth.useAzureCliCredential true     # ប្រើ Azure CLI សម្រាប់ការផ្ទៀងផ្ទាត់
azd config set tls.insecure false                  # អនុវត្តការផ្ទៀងផ្ទាត់ TLS

# កែលម្អសមត្ថភាព
azd config set provision.parallelism 5             # ការបង្កើតធនធានស្របពេល
azd config set deploy.timeout 30m                  # ពេលកំណត់សម្រាប់ការដាក់ឱ្យដំណើរការ
```

## 🏗️ ការកំណត់គម្រោង

### រចនាសម្ព័ន្ធ azure.yaml
ឯកសារ `azure.yaml` គឺជារឿងសំខាន់នៅក្នុងគម្រោង azd របស់អ្នក៖

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

### ជម្រើសកំណត់សេវាកម្ម

#### ប្រភេទម៉ាស៊ីនបម្រើ
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

#### ការកំណត់ពិសេសសម្រាប់ភាសា
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

## 🌟 ការគ្រប់គ្រងបរិយាកាស

### បង្កើតបរិយាកាស
```bash
# បង្កើតបរិយាកាសថ្មី
azd env new development

# បង្កើតដោយមានទីតាំងជាក់លាក់
azd env new staging --location "westus2"

# បង្កើតពីគំរូ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ការកំណត់បរិយាកាស
រាល់បរិយាកាសនីមួយៗមានការកំណត់ផ្ទាល់ខ្លួននៅក្នុង `.azure/<env-name>/config.json`:

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

### អថេរបរិយាកាស
```bash
# កំណត់អថេរសម្រាប់បរិស្ថានជាក់លាក់
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# មើលអថេរបរិស្ថាន
azd env get-values

# លទ្ធផលដែលរំពឹងទុក:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# លុបអថេរបរិស្ថាន
azd env unset DEBUG

# ផ្ទៀងផ្ទាត់ការលុប
azd env get-values | grep DEBUG
# (គួរតែ​មិនបង្ហាញអ្វី)
```

### គំរូបរិយាកាស
បង្កើត `.azure/env.template` សម្រាប់ការកំណត់បរិយាកាសប្រកបដោយភាពជាប់លាប់៖
```bash
# អថេរត្រូវការ
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ការកំណត់កម្មវិធី
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ការកំណត់អភិវឌ្ឍន៍ដែលជាជម្រើស
DEBUG=false
LOG_LEVEL=info
```

### ការចែករំលែកបរិយាកាសក្នុងក្រុម

ពេលមានអ្នកច្រើនធ្វើការលើគម្រោងមួយ អ្នកត្រូវយល់ព្រមគ្នាអំពី **អ្វីដែលត្រូវទព្យាយជាមួយ repo ហើយអ្វីដែលនៅក្នុងស្រុក**។ azd រក្សាបរិយាកាសនីមួយៗនៅក្រោមថត `.azure/` និងមិនគ្រប់មាតិកាទាំងអស់ត្រូវបន្ថែមទៅ commit ទេ។

**អ្វីដែលមាននៅក្នុង `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**អ្វីដែលត្រូវ gitignore.** `.gitignore` លំនាំដើមរបស់ azd បានដក `.azure/`ហើយ។ សូមរក្សាឲ្យដូច្នោះ—ឯកសារ `.env` អាចមានអាថ៌កំបាំង ហើយ ID របស់ធនធានមានលក្ខណៈពិសេសចំពោះអ្នកដែលបានផ្តល់វា។ ម៉ិត្តក្រុមនីមួយៗបង្កើតបរិយាកាស **ផ្ទាល់ខ្លួន** នៅក្នុងស្រុករបស់ខ្លួន៖

```bash
# អ្នកអភិវឌ្ឍន៍និមួយៗរត់វាម្តង ដើម្បីទទួលបានបរិយាកាសដែលផ្តាច់ខ្លួន
azd env new dev-alice
azd up
```

**ប្តូរវិញរវាងបរិយាកាស.** អ្នកអភិវឌ្ឍដែលគ្រប់គ្រងបរិយាកាសច្រើននោះជ្រើសបរិយាកាសសកម្ម មុនពេលរៀបចំបញ្ជា:

```bash
azd env list                 # មើលបរិយាកាសក្នុងស្រុកទាំងអស់ និងបង្ហាញថាមួយណាជាលំនាំដើម
azd env select staging       # ធ្វើឱ្យ 'staging' ជាបរិយាកាសសកម្ម
azd env get-values           # បញ្ជាក់ថាអ្នកកំណត់ទៅកាន់បរិយាកាសដែលត្រឹមត្រូវ
```

**ផ្តល់តម្លៃលំនាំដើមដែលមិនមែនអាថ៌កំបាំងទៅក្រុម។** ធ្វើ commit គំរូ (បែប `.azure/env.template` ខាងលើ) ដើម្បីឲ្យគ្រប់គ្នាច្បាស់ថាត្រូវដាក់អថេរណាមួយ—ប៉ុន្តែមិនធ្វើ commit តម្លៃដែលបានបំពេញ។ គូសថ្មីនឹងចម្លងគំរូនិងបញ្ចូលតម្លៃរបស់ខ្លួន។

**បរិយាកាសក្នុង CI/CD.** បណ្ដាញឧបករណ៌ (pipelines) មិនអានថត `.azure/` ក្នុងស្រុករបស់អ្នកទេ។ ជំនួសមក ជូនតម្លៃបរិយាកាសជាតម្លៃ/អាថ៌កំបាំង pipeline ហើយ azd អានពីបរិយាកាសរបស់ដំណើរការ៖

```bash
# នៅក្នុង CI, azd អានព័ត៌មានទាំងនេះពីបរិយាកាស មិនមែនពី .azure/ ទេ
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **Rule of thumb:** infrastructure code (`infra/`, `azure.yaml`) is shared in Git; environment *state and secrets* (`.azure/`) are per-developer and per-pipeline. `azd pipeline config` sets the pipeline variables up for you automatically.

## 🔐 ការកំណត់ការផ្ទៀងផ្ទាត់

### ការរួមបញ្ចូល Azure CLI
```bash
# ប្រើព័ត៌មានអត្តសញ្ញាណរបស់ Azure CLI (លំនាំដើម)
azd config set auth.useAzureCliCredential true

# ចូលជាមួយ tenant ជាក់លាក់
az login --tenant <tenant-id>

# កំណត់ការជាវលំនាំដើម
az account set --subscription <subscription-id>
```

### ការផ្ទៀងផ្ទាត់ដោយ Service Principal
សម្រាប់បណ្ដាញ CI/CD:
```bash
# កំណត់អថេរបរិស្ថាន
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ឬកំណត់ដោយផ្ទាល់
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
សម្រាប់បរិយាកាសដែលបម្រើលើ Azure:
```bash
# បើកការផ្ទៀងផ្ទាត់ដោយអត្តសញ្ញាណដែលគ្រប់គ្រង
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ការកំណត់រចនាសម្ព័ន្ធ

### ប៉ារ៉ាម៉ែត្រ Bicep
កំណត់ប៉ារ៉ាម៉ែត្ររចនាសម្ព័ន្ធនៅក្នុង `infra/main.parameters.json`:
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
សម្រាប់គម្រោង Terraform កំណត់នៅក្នុង `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ការកំណត់ការដាក់ឲ្យដំណើរការ

### ការកំណត់ការបង្កើត (Build)
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

### ការកំណត់ Docker
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
ឧទាហរណ៍ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ការកំណត់កម្រិតខ្ពស់

### ការកំណត់ឈ្មោះធនធានផ្ទាល់ខ្លួន
```bash
# កំណត់ទំរង់នៃការផ្តល់ឈ្មោះ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ការកំណត់បណ្តាញ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ការកំណត់មីត្រិក
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

## 🎯 ការកំណត់លក្ខខណ្ឌដោយបរិយាកាស

### បរិយាកាសអភិវឌ្ឍន៍
```bash
# .azure/អភិវឌ្ឍន៍/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### បរិយាកាសសាកល្បង
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### បរិយាកាសផលិតផល
```bash
# .azure/ផលិតកម្ម/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ផ្ទៀងផ្ទាត់ការកំណត់

### ផ្ទៀងផ្ទាត់ការកំណត់
```bash
# ពិនិត្យវេយ្យាករណ៍នៃការកំណត់រចនាសម្ព័ន្ធ
azd config validate

# សាកល្បងអថេរបរិយាកាស
azd env get-values

# ផ្ទៀងផ្ទាត់ហេដ្ឋារចនាសម្ព័ន្ធ
azd provision --dry-run
```

### ស្គ្រីបកំណត់
បង្កើតស្គ្រីបផ្ទៀងផ្ទាត់នៅក្នុង `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ពិនិត្ដអថេរបរិស្ថានដែលត្រូវការ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# ត្រួតពិនិត្យវេយ្យាករណ៍របស់ azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 អនុវត្តល្អបំផុត

### 1. ប្រើអថេរបរិយាកាស
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. រៀបចំឯកសារការកំណត់
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

### 3. ការពិចារណាអំពីការគ្រប់គ្រងកំណែ
```bash
# .gitignore
.azure/*/config.json         # ការ​កំណត់​បរិយាកាស (មាន​អត្តសញ្ញាណ​របស់​ធនធាន)
.azure/*/.env               # អថេរ​បរិយាកាស (អាច​មាន​ព័ត៌មាន​សម្ងាត់)
.env                        # ឯកសារ​បរិយាកាស​ក្នុង​តំបន់
```

### 4. ឯកសារពីការកំណត់
សរសេរឯកសារពីការកំណត់របស់អ្នកនៅក្នុង `CONFIG.md`:
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

## 🎯 លំហាត់អនុវត្ត

### លំហាត់ 1: ការកំណត់ពហុបរិយាកាស (15 នាទី)

**គោលបំណង**: បង្កើត និងកំណត់បរិយាកាសបីមានការកំណត់ខុសគ្នា

```bash
# បង្កើតបរិយាកាសអភិវឌ្ឍន៍
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# បង្កើតបរិយាកាសសម្រាប់ការសាកល្បង
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# បង្កើតបរិយាកាសផលិតកម្ម
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ផ្ទៀងផ្ទាត់បរិយាកាសនីមួយៗ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] បង្កើតបរិយាកាសបីដោយជោគជ័យ
- [ ] រាល់បរិយាកាសមានការកំណត់ផ្សេងគ្នា
- [ ] អាចប្តូរវិញរវាងបរិយាកាសដោយគ្មានកំហុស
- [ ] `azd env list` បង្ហាញបរិយាកាសទាំងបី

### លំហាត់ 2: ការ​គ្រប់គ្រងអាថ៌កំបាំង (10 នាទី)

**គោលបំណង**: អនុវត្តការកំណត់ដែលមានសុវត្ថិភាពជាមួយទិន្នន័យដែលមានភាពងាយឱ្យហេតុ

```bash
# កំណត់សម្ងាត់ (មិនបង្ហាញនៅក្នុងលទ្ធផល)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# កំណត់ការកំណត់ដែលមិនមែនជាសម្ងាត់
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# មើលបរិយាកាស (សម្ងាត់គួរត្រូវបានលាក់)
azd env get-values

# ផ្ទៀងផ្ទាត់ថាសម្ងាប់ត្រូវបានរក្សាទុក
azd env get DB_PASSWORD  # គួរតែបង្ហាញតម្លៃពិត
```

**លក្ខខណ្ឌជោគជ័យ:**
- [ ] អាថ៌កំបាំងបានរក្សាទុកដោយមិនបង្ហាញនៅក្នុងទូរសព្ទ
- [ ] `azd env get-values` បង្ហាញអាថ៌កំបាំងដែលបានលុបចេញ (redacted)
- [ ] `azd env get <SECRET_NAME>` រាល់ម្នាក់អាចទាញយកតម្លៃពិតប្រាកដ

## ជំហ៊ានបន្ទាប់

- [គម្រោងដំបូងរបស់អ្នក](first-project.md) - អនុវត្តការកំណត់ក្នុងការអនុវត្ត
- [មគ្គុទេសក៍ការបញ្ជូន](../chapter-04-infrastructure/deployment-guide.md) - ប្រើការកំណត់សម្រាប់ការដាក់
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - ការកំណត់សម្រាប់ផលិតផល

## ធនធាន

- [យោងការកំណត់ azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [រចនាសម្ព័ន្ធ azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [អថេរបរិយាកាស](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ការរុករកជំពូក:**
- **📚 ផ្ទះវគ្គ**: [AZD សម្រាប់អ្នកចាប់ផ្ដើម](../../README.md)
- **📖 ជំពូក​បច្ចុប្បន្ន**: ជំពូក 3 - ការកំណត់រចនា និង ការផ្ទៀងផ្ទាត់
- **⬅️ មុន**: [គម្រោងដំបូងរបស់អ្នក](first-project.md)
- **➡️ ជំពូកបន្ទាប់**: [ជំពូក 4: រចនាសម្ព័ន្ធជា​កូដ](../chapter-04-infrastructure/deployment-guide.md)
- **មេរៀនបន្ទាប់**: [គម្រោងដំបូងរបស់អ្នក](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការបដិសេធ**:
ឯកសារនេះត្រូវបានបម្លែងភាសា ដោយប្រើសេវាបម្លែងភាសា AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ទោះយើងខ្ញុំមានក្តីប្រាថ្នាឱ្យបានច្បាស់លាស់ តែសូមយល់ដឹងថាការបម្លែងដោយស្វ័យប្រវត្តិក៏អាចមានកំហុសឬភាពមិនត្រឹមត្រូវ។ ឯកសារដើមជាភាសាទីតាំងគួរត្រូវបានគេប្រើជាប្រភពច្បាស់លាស់។ សម្រាប់ព័ត៌មានសំខាន់ៗ សូមណែនាំឱ្យប្រើប្រាស់ការប្រែដោយមនុស្សជំនាញ។ យើងខ្ញុំមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការបកស្រាយខុសបន្ទាប់ពីការប្រើប្រាស់ការបម្លែងនេះនោះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->