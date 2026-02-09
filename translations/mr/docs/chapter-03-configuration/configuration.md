# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: प्रकरण 3 - कॉन्फिगरेशन व प्रमाणीकरण
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [प्रकरण 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [प्रकरण 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

ही सर्वांगिण मार्गदर्शिका Azure Developer CLI चे सर्व कॉन्फिगरेशन संबंधित पैलू समाविष्ट करते जेणेकरून विकास आणि तैनाती वर्कफ्लोज अधिक कार्यक्षम बनतील. तुम्हाला कॉन्फिगरेशन पदानुक्रम, वातावरण व्यवस्थापन, प्रमाणीकरण पद्धती आणि जटिल परिदृश्यांसाठी प्रगत कॉन्फिगरेशन पॅटर्नबद्दल शिकवले जाईल जे सुरक्षित आणि कार्यक्षम Azure तैनातीस सक्षम करतात.

## Learning Goals

या धड्याच्या शेवटी, तुम्ही:
- azd कॉन्फिगरेशन पदानुक्रम पारंगत कराल आणि सेटिंग्ज कशा प्राथमिकता देतात हे समजून घ्याल
- जागतिक आणि प्रकल्प-विशिष्ट सेटिंग्ज प्रभावीपणे कॉन्फिगर कराल
- विविध कॉन्फिगरेशनसह एकाधिक वातावरणे व्यवस्थापित कराल
- सुरक्षित प्रमाणीकरण आणि अधिकृतता पॅटर्न अमलात आणाल
- जटिल परिस्थितीसाठी प्रगत कॉन्फिगरेशन पॅटर्न समजून घेन

## Learning Outcomes

हा धडा पूर्ण केल्यानंतर, तुम्ही सक्षम असाल:
- विकास वर्कफ्लोजसाठी azd कॉन्फिगर करणे
- अनेक तैनाती वातावरणे सेटअप व व्यवस्थापित करणे
- सुरक्षित कॉन्फिगरेशन व्यवस्थापन पद्धती अमलात आणणे
- कॉन्फिगरेशन-संबंधित समस्यांचे निराकरण करणे
- विशिष्ट संस्थात्मक आवश्यकता पूर्ण करण्यासाठी azd वर्तन सानुकूल करणे

ही सर्वांगिण मार्गदर्शिका Azure Developer CLI चे सर्व कॉन्फिगरेशन संबंधित पैलू समाविष्ट करते जेणेकरून विकास आणि तैनाती वर्कफ्लोज अधिक कार्यक्षम बनतील.

## Configuration Hierarchy

azd एक पदानुक्रमित कॉन्फिगरेशन सिस्टम वापरते:
1. **कमांड-लाइन ध्वज** (सर्वोच्च प्राधान्य)
2. **पर्यावरण चल (Environment variables)**
3. **स्थानिक प्रकल्प कॉन्फिगरेशन** (`.azd/config.json`)
4. **ग्लोबल वापरकर्ता कॉन्फिगरेशन** (`~/.azd/config.json`)
5. **डीफॉल्ट मूल्ये** (कमी प्राधान्य)

## Global Configuration

### Setting Global Defaults
```bash
# डिफॉल्ट सदस्यता सेट करा
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# डिफॉल्ट स्थान सेट करा
azd config set defaults.location "eastus2"

# डिफॉल्ट रिसोर्स ग्रुप नामकरण पद्धत सेट करा
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# सर्व जागतिक कॉन्फिगरेशन पहा
azd config list

# एका कॉन्फिगरेशन काढा
azd config unset defaults.location
```

### Common Global Settings
```bash
# विकास प्राधान्ये
azd config set alpha.enable true                    # अल्फा वैशिष्ट्ये सक्षम करा
azd config set telemetry.enabled false             # टेलिमेट्री अक्षम करा
azd config set output.format json                  # आउटपुट स्वरूप सेट करा

# सुरक्षा सेटिंग्ज
azd config set auth.useAzureCliCredential true     # प्रमाणीकरणासाठी Azure CLI वापरा
azd config set tls.insecure false                  # TLS पडताळणी लागू करा

# कार्यक्षमता समायोजन
azd config set provision.parallelism 5             # समांतर संसाधन निर्मिती
azd config set deploy.timeout 30m                  # तैनातीची कालमर्यादा
```

## 🏗️ Project Configuration

### azure.yaml Structure
`azure.yaml` फाईल ही तुमच्या azd प्रकल्पाचे हृदय आहे:

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

### Service Configuration Options

#### Host Types
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

#### Language-Specific Settings
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

## 🌟 Environment Management

### Creating Environments
```bash
# नवीन वातावरण तयार करा
azd env new development

# विशिष्ट स्थानासह तयार करा
azd env new staging --location "westus2"

# टेम्पलेटमधून तयार करा
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
प्रत्येक वातावरणाची स्वतःची कॉन्फिगरेशन `.azure/<env-name>/config.json` मध्ये असते:

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

### Environment Variables
```bash
# पर्यावरण-विशिष्ट व्हेरिएबल सेट करा
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# पर्यावरण व्हेरिएबल पहा
azd env get-values

# अपेक्षित आउटपुट:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# पर्यावरण व्हेरिएबल हटवा
azd env unset DEBUG

# काढून टाकल्याची पुष्टी करा
azd env get-values | grep DEBUG
# (काहीही परत येऊ नये)
```

### Environment Templates
सुसंगत वातावरण सेटअपसाठी `.azure/env.template` तयार करा:
```bash
# आवश्यक चल
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# अनुप्रयोग सेटिंग्ज
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ऐच्छिक विकास सेटिंग्ज
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# Azure CLI क्रेडेन्शियल वापरा (डिफॉल्ट)
azd config set auth.useAzureCliCredential true

# विशिष्ट टेनंटसह लॉगिन करा
az login --tenant <tenant-id>

# डिफॉल्ट सदस्यता सेट करा
az account set --subscription <subscription-id>
```

### Service Principal Authentication
CI/CD पाइपलाइन्ससाठी:
```bash
# पर्यावरण चल सेट करा
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# किंवा थेट संरचीत करा
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
Azure-होस्ट केलेल्या वातावरणांसाठी:
```bash
# व्यवस्थापित ओळख प्रमाणीकरण सक्षम करा
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
इन्फ्रास्ट्रक्चर पॅरामीटर्स `infra/main.parameters.json` मध्ये कॉन्फिगर करा:
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

### Terraform Configuration
Terraform प्रकल्पांसाठी, `infra/terraform.tfvars` मध्ये कॉन्फिगर करा:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 Deployment Configuration

### Build Configuration
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

### Docker Configuration
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
उदाहरण `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# नामकरणासाठी नियम ठरवा
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### Network Configuration
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### Monitoring Configuration
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

## 🎯 Environment-Specific Configurations

### Development Environment
```bash
# .azure/विकास/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### Staging Environment
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### Production Environment
```bash
# .azure/उत्पादन/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# कॉन्फिगरेशनची वाक्यरचना तपासा
azd config validate

# पर्यावरण चलांची चाचणी करा
azd env get-values

# पायाभूत संरचनेची पडताळणी करा
azd provision --dry-run
```

### Configuration Scripts
वैधता तपासणीसाठी `scripts/` मध्ये स्क्रिप्ट तयार करा:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# आवश्यक पर्यावरण चल तपासा
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ची वाक्यरचना सत्यापित करा
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 Best Practices

### 1. Use Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. Organize Configuration Files
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

### 3. Version Control Considerations
```bash
# .gitignore
.azure/*/config.json         # पर्यावरण कॉन्फिग्स (संसाधन आयडी समाविष्ट असतात)
.azure/*/.env               # पर्यावरण व्हेरिएबल्स (गुप्त माहिती असू शकतात)
.env                        # स्थानिक पर्यावरण फाइल
```

### 4. Configuration Documentation
तुमची कॉन्फिगरेशन `CONFIG.md` मध्ये दस्तऐवजीत करा:
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

## 🎯 Hands-On Practice Exercises

### Exercise 1: Multi-Environment Configuration (15 minutes)

**Goal**: तीन वेगवेगळ्या सेटिंग्ज असलेली वातावरणे तयार व कॉन्फिगर करा

```bash
# विकास वातावरण तयार करा
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# स्टेजिंग वातावरण तयार करा
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# उत्पादन वातावरण तयार करा
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# प्रत्येक वातावरण सत्यापित करा
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**Success Criteria:**
- [ ] तीनही वातावरणे यशस्वीरित्या तयार झाली असावीत
- [ ] प्रत्येक वातावरणाची स्वतंत्र कॉन्फिगरेशन असावी
- [ ] वातावरणांमध्ये चुका न होता स्विच करता यावे
- [ ] `azd env list` सर्व तीन वातावरणे दाखवते

### Exercise 2: Secret Management (10 minutes)

**Goal**: संवेदनशील डेटासह सुरक्षित कॉन्फिगरेशनचा सराव करा

```bash
# गुप्त माहिती सेट करा (आउटपुटमध्ये दाखवली जाणार नाही)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# गैर-गुप्त कॉन्फिग सेट करा
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# पर्यावरण पहा (गुप्त माहिती लपवली पाहिजे)
azd env get-values

# गुप्त माहिती साठवलेली आहे याची पडताळणी करा
azd env get DB_PASSWORD  # वास्तविक मूल्य दाखवले पाहिजे
```

**Success Criteria:**
- [ ] सीक्रेट्स टर्मिनलमध्ये दाखवता येणार नाहीत अशा प्रकारे संग्रहित केलेले असावेत
- [ ] `azd env get-values` मध्ये रेडॅक्ट केलेले सीक्रेट्स दिसतात
- [ ] वैयक्तिक `azd env get <SECRET_NAME>` वास्तविक मूल्य परत करते

## Next Steps

- [Your First Project](first-project.md) - कॉन्फिगरेशन प्रत्यक्षात लागू करा
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - तैनातीसाठी कॉन्फिगरेशन वापरा
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - उत्पादन-तयार कॉन्फिगरेशन

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD नवशिक्यांसाठी](../../README.md)
- **📖 Current Chapter**: प्रकरण 3 - कॉन्फिगरेशन व प्रमाणीकरण
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [प्रकरण 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
अस्वीकरण:
हा दस्तऐवज एआय अनुवाद सेवा Co-op Translator (https://github.com/Azure/co-op-translator) वापरून अनुवादित केला आहे. आम्ही अचूकतेसाठी प्रयत्न करतो, परंतु कृपया ध्यानात ठेवा की स्वयंचलित अनुवादांमध्ये चुका किंवा त्रुटी असू शकतात. मूळ दस्तऐवज त्याच्या मूळ भाषेत अधिकृत स्रोत मानला जावा. महत्त्वाच्या माहितीबाबत व्यावसायिक मानवी अनुवाद सुचवला जातो. या अनुवादाच्या वापरातून उद्भवणाऱ्या कोणत्याही गैरसमज किंवा चुकीच्या अर्थलावासाठी आम्ही जबाबदार नाही.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->