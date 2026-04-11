# មគ្គុទេសក៍កំណត់រចនាសម្ព័ន្ធ

**ការរុករកជំពូក៖**
- **📚 ផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 3 - កំណត់រចនាសម្ព័ន្ធ និងការផ្ទៀងផ្ទាត់
- **⬅️ មុននេះ**: [គម្រោងទីមួយរបស់អ្នក](first-project.md)
- **➡️ បន្ទាប់**: [មគ្គុទេសក៍ការដាក់បញ្ចូល](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ជំពូកបន្ទាប់**: [ជំពូក 4: ឧបករណ៍ជាគោល](../chapter-04-infrastructure/deployment-guide.md)

## ការណែនាំ

មគ្គុទេសក៍ពេញលេញនេះគ្របដណ្តប់ទាំងអស់លើការកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI សម្រាប់និម្មិតនិងដំណើរការដែលមានប្រសិទ្ធភាព។ អ្នកនឹងរៀនអំពីជំពូកនៃការកំណត់រចនាសម្ព័ន្ធ, ការគ្រប់គ្រងបរិយាកាស, វិធីសាស្ត្រផ្ទៀងផ្ទាត់, និងគំរូកំណត់រចនាសម្ព័ន្ធកម្រិតខ្ពស់ដែលអនុញ្ញាតឱ្យមានការដាក់បញ្ចូល Azure ដែលមានប្រសិទ្ធភាពនិងសុវត្ថិភាព។

## គោលដៅរៀន

នៅចុងបណ្ដុះនេះ អ្នកនឹងអាច៖
- ចេះលំអិតពីជំពូកកំណត់រចនាសម្ព័ន្ធ azd និងយល់ពីវិធីដែលការកំណត់ត្រូវបានអាទិភាព
- កំណត់ថាមពលសកលនិងការកំណត់លំដាប់គម្រោងដោយប្រសិទ្ធភាព
- គ្រប់គ្រងបរិយាកាសច្រើនជាមួយការកំណត់ផ្សេងៗគ្នា
- អនុវត្តវិធីសាស្ត្រផ្ទៀងផ្ទាត់និងអនុញ្ញាតដោយមានសុវត្ថិភាព
- យល់ពីគំរូកំណត់រចនាសម្ព័ន្ធកម្រិតខ្ពស់សម្រាប់ស្ថានភាពស្មុគស្មាញ

## លទ្ធផលរៀន

បន្ទាប់ពីចប់វគ្គនេះ អ្នកនឹងអាច៖
- កំណត់រចនាសម្ព័ន្ធ azd សម្រាប់វដ្តការអភិវឌ្ឍអតិបរមា
- រៀបចំ និងគ្រប់គ្រងបរិយាកាសដាក់បញ្ចូលច្រើន
- អនុវត្តវិធានការគ្រប់គ្រងកំណត់រចនាសម្ព័ន្ធដែលមានសុវត្ថិភាព
- ពិនិត្យសមាជិកបញ្ហាផ្នែកកំណត់រចនាសម្ព័ន្ធ
- ប្តូរព្រមាននៃ azd សម្រាប់តម្រូវការរបស់អង្គភាពជាក់លាក់

មគ្គុទេសក៍ពេញលេញនេះគ្របដណ្តប់ទាំងអស់លើការកំណត់រចនាសម្ព័ន្ធ Azure Developer CLI សម្រាប់និម្មិតនិងដំណើរការដែលមានប្រសិទ្ធភាព។

## ការយល់ដឹងអំពីអាជ្ញាធរជំនួយ AI ក្នុងគម្រោង azd

បើអ្នកថ្មីចំពោះទៅអាជ្ញាធរជំនួយ AI នេះជាវិធីស្រួលក្នុងការគិតអំពីពួកវាក្នុងពិភព azd។

### អ្វីទៅជាអាជ្ញាធរ?

អាជ្ញាធរជំនួយគឺជា​កម្មវិធីមួយដែលអាចទទួលសំណើ, សម្រេចចិត្តលើវា, ហើយអនុវត្តសកម្មភាពមួយ—ជាញឹកញាប់ដោយហៅម៉ូដែល AI, ស្វែងរកទិន្នន័យ, ឬហៅសេវាកម្មផ្សេងទៀត។ ក្នុងគម្រោងazd អាជ្ញាធរជំនួយគ្រាន់តែជាសេវាកម្មមួយទៀតនៃមុខម៉ាត់វែបរបស់អ្នក ឬមុខម៉ាត់ជីវ API។

### របៀបដែលអាជ្ញាធរជំនួយផ្គុំទៅក្នុងរចនាសម្ព័ន្ធគម្រោង azd

គម្រោង azd ស្ថិតលើបីបន្ទាត់៖ **ស្ថាបត្យកម្ម**, **កូដ**, និង **កំណត់រចនាសម្ព័ន្ធ**។ អាជ្ញាធរជំនួយភ្ជាប់ទៅបន្ទាត់ទាំងនេះដូចសេវាកម្មផ្សេងៗដែរ៖

| បន្ទាត់ | វាជួយអ្វីដល់កម្មវិធីធម្មតា | វាជួយអ្វីដល់អាជ្ញាធរជំនួយ |
|-------|-------------------------------------|---------------------------|
| **ស្ថាបត្យកម្ម** (`infra/`) | បំលែងកម្មវិធីវែបនិងមូលដ្ឋានទិន្នន័យ | បំលែងចំណុចចេញម៉ូដែល AI, សន្ទស្សន៍ស្វែងរក, ឬម៉ាស៊ីនបម្រើអាជ្ញាធរ |
| **កូដ** (`src/`) | រួមបញ្ចូលកូដប្រភពមុខម៉ាត់វែបនិង API | រួមបញ្ចូលតុល្យភាពអាជ្ញាធរជំនួយ និងការកំណត់ការផ្សព្វផ្សាយ |
| **កំណត់រចនាសម្ព័ន្ធ** (`azure.yaml`) | បញ្ជីសេវាកម្មនិងគោលដៅបម្រើរបស់ពួកវា | បញ្ជីអាជ្ញាធរជំនួយជាសេវាកម្ម, អះអាងទៅកូដនិងម៉ាស៊ីនបម្រើរបស់វា |

### តួនាទីរបស់ `azure.yaml`

អ្នកមិនចាំបាច់ត្រូវចងចាំសំដីវាទាំងអស់ឥឡូវនេះទេ។ ដោយគំនិត, `azure.yaml` គឺជា​ឯកសារដែលអ្នកប្រាប់ azd ថា៖ *"នេះគឺជាសេវាកម្មដែលបង្កើតកម្មវិធីរបស់ខ្ញុំ ហើយនេះគឺជាកន្លែងសម្រាប់ស្វែងរកកូដរបស់ពួកវា។"*

ពេលគម្រោងរបស់អ្នករួមបញ្ចូលអាជ្ញាធរជំនួយ AI, `azure.yaml` គ្រាន់តែបញ្ជីអាជ្ញាធរជំនួយនេះជា​សេវាកម្មមួយ។ azd នឹងដឹងត្រូវតែបំលែងស្ថាបត្យកម្មត្រឹមត្រូវ (ដូចជាចំណុចចេញម៉ូដែល Microsoft Foundry Models ឬកម្មវិធី Container App សម្រាប់បម្រើអាជ្ញាធរ) និងដាក់បញ្ចូលកូដអាជ្ញាធរជំនួយរបស់អ្នក ដូចដែលវានឹងធ្វើសម្រាប់កម្មវិធីវែប ឬ API។

នេះមានន័យថា មិនមានអ្វីថ្មីមូលដ្ឋានត្រូវរៀនឡើងឡើយ។ បើអ្នកយល់ពីរបៀបដែល azd គ្រប់គ្រងសេវាកម្មវែប, អ្នកបានយល់របៀបដែលវាគ្រប់គ្រងអាជ្ញាធរជំនួយរួចហើយ។

## ជំពូកកំណត់រចនាសម្ព័ន្ធ

azd ប្រើប្រព័ន្ធកំណត់រចនាសម្ព័ន្ធជាជំពូក៖
1. **ធ្នើបញ្ជាផ្ទាំងបញ្ជា** (អាទិភាពខ្ពស់បំផុត)
2. **អថេរបរិយាកាស**
3. **កំណត់រចនាសម្ព័ន្ធគម្រោងក្នុងតំបន់** (`.azd/config.json`)
4. **កំណត់រចនាសម្ព័ន្ធអ្នកប្រើសកល** (`~/.azd/config.json`)
5. **តម្លៃលំនាំដើម** (អាទិភាពទាបបំផុត)

## កំណត់រចនាសម្ព័ន្ធសកល

### កំណត់តម្លៃលំនាំដើមសកល
```bash
# កំណត់ការជាវលំនាំដើម
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# កំណត់ទីតាំងលំនាំដើម
azd config set defaults.location "eastus2"

# កំណត់របៀបហៅឈ្មោះក្រុមធនធានលំនាំដើម
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# មើលការកំណត់រចនាសម្ព័ន្ធសកលទាំងអស់
azd config show

# ដកចេញការកំណត់មួយ
azd config unset defaults.location
```

### ការកំណត់សកលទូទៅ
```bash
# ការជ្រើសរើសអភិវឌ្ឍន៍
azd config set alpha.enable true                    # បើកមុខងារ Alpha
azd config set telemetry.enabled false             # បិទការចាប់យកទិន្នន័យ
azd config set output.format json                  # កំណត់របៀបចេញ

# ការកំណត់សន្តិសុខ
azd config set auth.useAzureCliCredential true     # ប្រើ Azure CLI សម្រាប់ការផ្ទៀងផ្ទាត់
azd config set tls.insecure false                  # អនុវត្តការត្រួតពិនិត្យ TLS

# ការគ្រប់គ្រងប្រសិទ្ធភាព
azd config set provision.parallelism 5             # ការបង្កើតធនធានស្របគ្នា
azd config set deploy.timeout 30m                  # ពេលវេលាចេញផ្សាយ
```

## 🏗️ កំណត់រចនាសម្ព័ន្ធគម្រោង

### រចនាសម្ព័ន្ធ azure.yaml
ឯកសារ `azure.yaml` គឺជាយកដ្ឋាននៃគម្រោង azd របស់អ្នក៖

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

### ជម្រើសកំណត់រចនាសម្ព័ន្ធសេវាកម្ម

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

#### ការកំណត់តាមភាសា
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

# បង្កើតជាមួយទីតាំងជាក់លាក់
azd env new staging --location "westus2"

# បង្កើតពីទំរង់ទ្រៀម
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### កំណត់រចនាសម្ព័ន្ធបរិយាកាស
បរិយាកាសនីមួយៗមានការកំណត់តាមបែបផ្ទាល់ក្នុង `.azure/<env-name>/config.json`៖

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
# កំណត់អថេរបរិបទជាក់លាក់
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# មើលអថេរបរិបទ
azd env get-values

# លទ្ធផលដែលរំពឹក:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# លុបអថេរបរិបទ
azd env unset DEBUG

# ផ្ទៀងផ្ទាត់ការលុប
azd env get-values | grep DEBUG
# (គួរតែពុំមានអ្វីត្រឡប់មក)
```

### គំរូបរិយាកាស
បង្កើត `.azure/env.template` សម្រាប់ការរៀបចំបរិយាកាសអោយស្រដៀងគ្នា៖
```bash
# អថេរដែលត្រូវការ
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

## 🔐 កំណត់រចនាសម្ព័ន្ធការផ្ទៀងផ្ទាត់

### ការរួមបញ្ចូល Azure CLI
```bash
# ប្រើបរិយាកសាង Azure CLI (លំនាំដើម)
azd config set auth.useAzureCliCredential true

# ចូលប្រើជាមួយជួលផ្ទាល់ខ្លួន
az login --tenant <tenant-id>

# កំណត់ការជាវលំនាំដើម
az account set --subscription <subscription-id>
```

### ការផ្ទៀងផ្ទាត់អ្នកជាអ្នកគ្រប់គ្រងសេវាកម្ម
សម្រាប់បន្ទាត់ CI/CD:
```bash
# កំណត់អថេរបរិស្ថាន
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ឬកំណត់រចនាសម្ព័ន្ធដោយផ្ទាល់
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ភាពស្គាល់គ្រប់គ្រង
សម្រាប់បរិយាកាសដែលបម្រើក្នុង Azure:
```bash
# បើកការផ្ទៀងផ្ទាត់អត្តសញ្ញាណគ្រប់គ្រង
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ កំណត់រចនាសម្ព័ន្ធស្ថាបត្យកម្ម

### ប៉ារ៉ាម៉ែត្រ Bicep
កំណត់ប៉ារ៉ាម៉ែត្រ​ស្ថាបត្យកម្មក្នុង `infra/main.parameters.json`៖
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

### កំណត់រចនាសម្ព័ន្ធ Terraform
សម្រាប់គម្រោង Terraform, កំណត់ក្នុង `infra/terraform.tfvars`៖
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 កំណត់រចនាសម្ព័ន្ធដាក់បញ្ចូល

### កំណត់រចនាសម្ព័ន្ធសាងសង់
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

### កំណត់រចនាសម្ព័ន្ធ Docker
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

## 🔧 កំណត់រចនាសម្ព័ន្ធកម្រិតខ្ពស់

### ការកំណត់ឈ្មោះធនធានផ្ទាល់ខ្លួន
```bash
# កំណត់នីតិវិធីកំណត់ឈ្មោះ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### កំណត់រចនាសម្ព័ន្ធបណ្តាញ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### កំណត់រចនាសម្ព័ន្ធត្រួតពិនិត្យ
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

## 🎯 កំណត់រចនាសម្ព័ន្ធជាមួយបរិយាកាសជាក់លាក់

### បរិយាកាសអភិវឌ្ឍន៍
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### បរិយាកាសធ្វើតេស្ត
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### បរិយាកាសផលិត
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 សមាសភាពផ្ទៀងផ្ទាត់កំណត់រចនាសម្ព័ន្ធ

### ផ្ទៀងផ្ទាត់កំណត់រចនាសម្ព័ន្ធ
```bash
# ពិនិត្យរចនាសម្ព័ន្ធនៃវាក្យសម្ព័ន្ធ
azd config validate

# សាកល្បងអថេរបរិយាកាស
azd env get-values

# ផ្ទៀងផ្ទាត់គ្រឿងសំណង់
azd provision --dry-run
```

### ស្គ្រីបកំណត់រចនាសម្ព័ន្ធ
បង្កើតស្គ្រីបផ្ទៀងផ្ទាត់ក្នុង `scripts/`៖

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ពិនិត្យអថេរសីតិភាពដែលត្រូវការ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# សុពុលវាក្យសម័យ azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ជំនាញល្អបំផុត

### 1. ប្រើអថេរបរិយាកាស
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. រៀបចំឯកសារកំណត់រចនាសម្ព័ន្ធ
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

### 3. ការពិចារណាការគ្រប់គ្រងកំណែ
```bash
# .gitignore
.azure/*/config.json         # ការកំណត់រចនាសម្ព័ន្ធបរិបទបរិដ្ឋាន (មានលេខសម្គាល់ធនធាន)
.azure/*/.env               # រ៉ឺម៉ូតបរិបទបរិដ្ឋាន (អាចមានអាថ៍កំបាំង)
.env                        # ឯកសារបរិបទបរិដ្ឋានក្នុងតំបន់
```

### 4. ការបញ្ជាក់ឯកសារកំណត់រចនាសម្ព័ន្ធ
ចុះអត្ថបទកំណត់រចនាសម្ព័ន្ធរបស់អ្នកក្នុង `CONFIG.md`៖
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

## 🎯 មនុស្សប្រាកដលំហាត់

### លំហាត់ 1: កំណត់បរិយាកាសច្រើន (15 នាទី)

**គោលដៅ**: បង្កើត និងកំណត់បរិយាកាសបីដែលមានការកំណត់ផ្សេងគ្នា

```bash
# បង្កើតបរិយាកាសអភិវឌ្ឍន៍
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# បង្កើតបរិយាកាសសម្រាប់សាកល្បង
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# បង្កើតបរិយាកាសផលិតកម្ម
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# បញ្ជាក់កំណត់បរិយាកាសនីមួយៗ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**លក្ខណៈជោគជ័យ៖**
- [ ] បរិយាកាសបីត្រូវបានបង្កើតដោយជោគជ័យ
- [ ] បរិយាកាសនីមួយៗមានការកំណត់តែមួយៗ
- [ ] អាចប្ដូរវិញទៅមកបានអោយគ្មានកំហុស
- [ ] `azd env list` បង្ហាញបរិយាកាសទាំងបី

### លំហាត់ 2: ការគ្រប់គ្រងព័ត៌មានសម្ងាត់ (10 នាទី)

**គោលដៅ**: អនុវត្តការកំណត់រចនាសម្ព័ន្ធមានសុវត្ថិភាពជាមួយទិន្នន័យសរស់បន្ទាន់

```bash
# កំណត់អំពីសម្ងាត់ (មិនបង្ហាញនៅក្នុងលទ្ធផល)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# កំណត់ការកំណត់ដែលមិនមែនសម្ងាត់
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# មើលបរិ περιβάλλον (សម្ងាត់គួរតែត្រូវបានលុបចោល)
azd env get-values

# បញ្ជាក់ទំនិញសម្ងាត់ត្រូវបានរក្សាទុក
azd env get DB_PASSWORD  # គួរតែបង្ហាញតម្លៃពិតប្រាកដ
```

**លក្ខណៈជោគជ័យ៖**
- [ ] ព័ត៌មានសម្ងាត់បានរក្សាទុកដោយមិនបង្ហាញនៅក្នុងផ្ទាំងបញ្ជា
- [ ] `azd env get-values` បង្ហាញព័ត៌មានសម្ងាត់បំលែង
- [ ] បទពិសោធន៍ `azd env get <SECRET_NAME>` ទទួលបានតម្លៃពិតប្រាកដ

## ជំហានបន្ទាប់

- [គម្រោងទីមួយរបស់អ្នក](first-project.md) - អនុវត្តការកំណត់រចនាសម្ព័ន្ធក្នុងអនុវត្តន៍
- [មគ្គុទេសក៍ការដាក់បញ្ចូល](../chapter-04-infrastructure/deployment-guide.md) - ប្រើកំណត់រចនាសម្ព័ន្ធសម្រាប់ការដាក់បញ្ចូល
- [ការផ្គត់ផ្គង់ធនធាន](../chapter-04-infrastructure/provisioning.md) - កំណត់រចនាសម្ព័ន្ធសម្រាប់ផលិតកម្ម

## កន្លែងយោង

- [យោងការកំណត់រចនាសម្ព័ន្ធ azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [ស្កីមា azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [អថេរបរិយាកាស](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ការរុករកជំពូក៖**
- **📚 ផ្ទះវគ្គសិក្សា**: [AZD សម្រាប់អ្នកចាប់ផ្តើម](../../README.md)
- **📖 ជំពូកបច្ចុប្បន្ន**: ជំពូក 3 - កំណត់រចនាសម្ព័ន្ធ និងការផ្ទៀងផ្ទាត់
- **⬅️ មុននេះ**: [គម្រោងទីមួយរបស់អ្នក](first-project.md)
- **➡️ ជំពូកបន្ទាប់**: [ជំពូក 4: ឧបករណ៍ជាគោល](../chapter-04-infrastructure/deployment-guide.md)
- **មុខវិជ្ជាបន្ទាប់**: [គម្រោងទីមួយរបស់អ្នក](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ការប្រាប់ជាសាធារណៈ**៖  
ឯកសារនេះត្រូវបានបកប្រែដោយប្រើសេវាកម្មបកប្រែ AI [Co-op Translator](https://github.com/Azure/co-op-translator)។ ខណៈយើងខិតខំរក្សាសុពលភាព តែក៏សូមជម្រាបថាការបកប្រែដោយស្វ័យប្រវត្តិអាចមានកំហុស ឬខុសប្រក្រតីខ្លះ។ ឯកសារដើមនៅក្នុងភាសាមូលដ្ឋានគួរត្រូវបានគេចាត់ទុកជាអ្នកផ្ដល់ព័ត៌មានដែលមានអំណាចច្បាស់លាស់។ សម្រាប់ព័ត៌មានដ៏សំខាន់ៗ សូមផាត់ជំនួយការបកប្រែដោយអ្នកជំនាញមនុស្ស។ យើងមិនទទួលខុសត្រូវចំពោះការយល់ច្រឡំ ឬការអះអាងខុសហេតុចេញពីការប្រើប្រាស់ការបកប្រែនេះទេ។
<!-- CO-OP TRANSLATOR DISCLAIMER END -->