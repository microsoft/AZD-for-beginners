# ಸಂರಚನೆ ಮಾರ್ಗದರ್ಶಿ

**ಅಧ್ಯಾಯ ದಿಕ್ಕುಸೂಚನೆ:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಸಂರಚನೆ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ
- **⬅️ ಹಿಂದಿನ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **➡️ ಮುಂದಿನ**: [ವಿತರಣಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 ಮುಂದಿನ ಅಧ್ಯಾಯ**: [ಅಧ್ಯಾಯ 4: ಕೋಡ್ ರೂಪದ ಮೂಲಸೌಕರ್ಯ](../chapter-04-infrastructure/deployment-guide.md)

## ಪರಿಚಯ

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಅನ್ನು ಉತ್ತಮ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳಿಗಾಗಿ ಸಂರಚಿಸುವ ಎಲ್ಲಾ ಅಂಶಗಳನ್ನು ಒಳಗೊಂಡಿದೆ. ನೀವು ಸಂರಚನಾ ಹಿಯರಾರ್ಕಿ, ಪರಿಸರ ನಿರ್ವಹಣೆ, ಪ್ರಾಮಾಣೀಕರಣ ವಿಧಾನಗಳು ಮತ್ತು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಮತ್ತು ಸುರಕ್ಷಿತವಾಗಿ Azure ನಿಯೋಜನೆಗಳನ್ನು ಸಾಧ್ಯಮಾಡುವ ಪ್ರಗತಿಶೀಲ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ತಿಳಿಯುತ್ತೀರಿ.

## ಅಧ್ಯಯನ ಗುರಿಗಳು

ಈ ಪಾಠದ ಅಂತ್ಯಕ್ಕೆ, ನೀವು:
- azd ಸಂರಚನಾ ಹಿಯರಾರ್ಕಿಯನ್ನು ನಿಪುಣವಾಗಿ ಬಳಸಲು ಮತ್ತು ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳಿಗೆ ಪ್ರಾಧಾನ್ಯತೆ ಹೇಗೆ ನೀಡಲಾಗುತ್ತದೆ ಎಂಬುದನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳಲು ಸಾಧ್ಯವಾಗುತ್ತದೆ
- ಗ್ಲೋಬಲ್ ಮತ್ತು ಪ್ರಾಜೆಕ್ಟ್-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳನ್ನು ಪರಿಣಾಮಕಾರಿಯಾಗಿ ಸಂರಚಿಸಲು সক্ষমರಾಗುವುದು
- ವಿಭಿನ್ನ ಸಂರಚನೆಗಳೊಂದಿಗೆ ಹಲವು ಪರಿಸರಗಳನ್ನು ನಿರ್ವಹಿಸಲು ಕಲಿಯುವುದು
- ಸುರಕ್ಷಿತ ಪ್ರಾಮಾಣೀಕರಣ ಮತ್ತು ಅನುಮತಿ ಮಾದರಿಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸುವುದು
- ಸಂಕೀರ್ಣ ಸಂದರ್ಭಗಳಿಗೆ ಪ್ರಗತಿಶೀಲ ಸಂರಚನಾ ಮಾದರಿಗಳನ್ನು ಅರ್ಥಮಾಡಿಕೊಳ್ಳುವುದು

## ಕಲಿಕೆಯ ಫಲಿತಾಂಶಗಳು

ಈ ಪಾಠವನ್ನು ಪೂರ್ಣಗೊಳಿಸಿದ ನಂತರ, ನೀವು ಸಾಧ್ಯವಾಗುವುದು:
- ಅತ್ಯುತ್ತಮ ಅಭಿವೃದ್ಧಿ ಕಾರ್ಯಪ್ರವಾಹಗಳಿಗಾಗಿ azd ಅನ್ನು ಸಂರಚಿಸಲು
- ಹಲವಾರು ನಿಯೋಜನೆ ಪರಿಸರಗಳನ್ನು ಸ್ಥಾಪಿಸಿ ಮತ್ತು ನಿರ್ವಹಿಸಲು
- ಸುರಕ್ಷಿತ ಸಂರಚನಾ ನಿರ್ವಹಣಾ ಅಭ್ಯಾಸಗಳನ್ನು ಅನುಷ್ಠಾನಗೊಳಿಸಲು
- ಸಂರಚನೆ-ಸಂಬಂಧಿ ಸಮಸ್ಯೆಗಳನ್ನು ವಿಶ್ಲೇಷಿಸಿ ಪರಿಹರಿಸಲು
- ನಿರ್ದಿಷ್ಟ ಸಂಸ್ಥಾತ್ಮಕ ಅಗತ್ಯಗಳಿಗೆ ಅನುಗುಣವಾಗಿ azd ನ ವರ್ತನೆಯನ್ನು ಕಸ್ಟಮೈಸ್ ಮಾಡಲು

ಈ ಸಮಗ್ರ ಮಾರ್ಗದರ್ಶಿ Azure Developer CLI ಅನ್ನು ಉತ್ತಮ ಅಭಿವೃದ್ಧಿ ಮತ್ತು ನಿಯೋಜನೆ ಕಾರ್ಯಪ್ರವಾಹಗಳಿಗಾಗಿ ಸಂರಚಿಸುವ ಎಲ್ಲಾ ಅಂಶಗಳನ್ನು ಒಳಗೊಂಡಿದೆ.

## ಸಂರಚನಾ ಹಿಯರಾರ್ಕಿ

azd ಹಿಯರಾರ್ಕಿಕ ಸಂರಚನಾ ವ್ಯವಸ್ಥೆಯನ್ನು ಬಳಸುತ್ತದೆ:
1. **ಕಮಾಂಡ್-ಲೈನ್ ಫ್ಲ್ಯಾಗ್‌ಗಳು** (ಅತ್ಯಂತ ಪ್ರಾಧಾನ್ಯತೆ)
2. **ಪರಿಸರ ಚರಗಳು**
3. **ಸ್ಥಳೀಯ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ** (`.azd/config.json`)
4. **ಗ್ಲೋಬಲ್ ಬಳಕೆದಾರ ಸಂರಚನೆ** (`~/.azd/config.json`)
5. **ಡಿಫಾಲ್ಟ್ ಮೌಲ್ಯಗಳು** (ಕನಿಷ್ಠ ಪ್ರಾಧಾನ್ಯತೆ)

## ಜಾಗತಿಕ ಸಂರಚನೆ

### ಜಾಗತಿಕ ಡೀಫಾಲ್ಟ್‌ಗಳನ್ನು ನಿಗಧಿಪಡಿಸುವುದು
```bash
# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ಡೀಫಾಲ್ಟ್ ಸ್ಥಳವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.location "eastus2"

# ಡೀಫಾಲ್ಟ್ ಸಂಪನ್ಮೂಲ ಗುಂಪಿನ ಹೆಸರಿಸುವ ನಿಯಮವನ್ನು ಸೆಟ್ ಮಾಡಿ
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ಎಲ್ಲಾ ಜಾಗತಿಕ ಕಾನ್ಫಿಗರೇಷನ್‌ಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd config list

# ಒಂದು ಕಾನ್ಫಿಗರೇಷನ್ ಅನ್ನು ತೆಗೆದುಹಾಕಿ
azd config unset defaults.location
```

### ಸಾಮಾನ್ಯ ಜಾಗತಿಕ ಸೆಟ್ಟಿಂಗ್ಸ್
```bash
# ಅಭಿವೃದ್ಧಿ ಆದ್ಯತೆಗಳು
azd config set alpha.enable true                    # ಅಲ್ಫಾ ವೈಶಿಷ್ಟ್ಯಗಳನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set telemetry.enabled false             # ಟೆಲಿಮೆಟ್ರಿಯನ್ನು ನಿಷ್ಕ್ರಿಯಗೊಳಿಸಿ
azd config set output.format json                  # ಔಟ್‌ಪುಟ್ ಸ್ವರೂಪವನ್ನು ನಿಗದಿಸಿ

# ಭದ್ರತಾ ಸಂಯೋಜನೆಗಳು
azd config set auth.useAzureCliCredential true     # ಪ್ರಮಾಣೀಕರಣಕ್ಕಾಗಿ Azure CLI ಅನ್ನು ಬಳಸಿ
azd config set tls.insecure false                  # TLS ಪರಿಶೀಲನೆಯನ್ನು ಜಾರಿಗೊಳಿಸಿ

# ಕಾರ್ಯಕ್ಷಮತೆ ಸುಧಾರಣೆ
azd config set provision.parallelism 5             # ಸಮಾಂತರವಾಗಿ ಸಂಪನ್ಮೂಲಗಳನ್ನು ರಚನೆ
azd config set deploy.timeout 30m                  # ವಿನಿಯೋಗದ ಸಮಯ ಮಿತಿ
```

## 🏗️ ಪ್ರಾಜೆಕ್ಟ್ ಸಂರಚನೆ

### azure.yaml ರಚನೆ
`azure.yaml` ಫೈಲ್ ನಿಮ್ಮ azd ಪ್ರಾಜೆಕ್ಟಿನ ಹೃದಯವಾಗಿದೆ:

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

### ಸೇವಾ ಸಂರಚನಾ ಆಯ್ಕೆಗಳು

#### ಹೋಸ್ಟ್ ಪ್ರಕಾರಗಳು
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

#### ಭಾಷಾ-ನಿರ್ದಿಷ್ಟ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
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

## 🌟 ಪರಿಸರ ನಿರ್ವಹಣೆ

### ಪರಿಸರಗಳನ್ನು ರಚಿಸುವುದು
```bash
# ಹೊಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new development

# ನಿರ್ದಿಷ್ಟ ಸ್ಥಳದೊಂದಿಗೆ ರಚಿಸಿ
azd env new staging --location "westus2"

# ಟೆಂಪ್ಲೇಟಿನಿಂದ ರಚಿಸಿ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### ಪರಿಸರ ಸಂರಚನೆ
ಪ್ರತಿ ಪರಿಸರದ ತನ್ನ ಸ್ವಂತ ಸಂರಚನೆ `.azure/<env-name>/config.json` ಯಲ್ಲಿ ಇರುತ್ತದೆ:

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

### ಪರಿಸರ ಚರಗಳು
```bash
# ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಚರಗಳನ್ನು ನಿಗದಿಪಡಿಸಿ
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ಪರಿಸರ ಚರಗಳನ್ನು ವೀಕ್ಷಿಸಿ
azd env get-values

# ನಿರೀಕ್ಷಿತ ಫಲಿತಾಂಶ:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ಪರಿಸರ ಚರವನ್ನು ತೆಗೆದುಹಾಕಿ
azd env unset DEBUG

# ತೆಗೆದುಹಾಕಲಾಗಿದೆ ಎಂದು ಪರಿಶೀಲಿಸಿ
azd env get-values | grep DEBUG
# (ಏನೂ ಸಿಗಬಾರದು)
```

### ಪರಿಸರ ಟೆಂಪ್ಲೇಟ್ಗಳು
ಸಮಾನವಾದ ಪರಿಸರ ಸ್ಥಾಪನೆಗಾಗಿ `.azure/env.template` ಅನ್ನು ರಚಿಸಿ:
```bash
# ಆವಶ್ಯಕ ಚರಗಳು
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# ಅಪ್ಲಿಕೇಶನ್ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# ಐಚ್ಛಿಕ ಅಭಿವೃದ್ಧಿ ಸೆಟ್ಟಿಂಗ್‌ಗಳು
DEBUG=false
LOG_LEVEL=info
```

## 🔐 ಪ್ರಾಮಾಣೀಕರಣ ಸಂರಚನೆ

### Azure CLI ಏಕೀಕರಣ
```bash
# Azure CLI ದೃಢೀಕರಣಗಳನ್ನು ಬಳಸಿ (ಡೀಫಾಲ್ಟ್)
azd config set auth.useAzureCliCredential true

# ನಿರ್ದಿಷ್ಟ ಟೆನಂಟ್‌ನೊಂದಿಗೆ ಲಾಗಿನ್ ಮಾಡಿ
az login --tenant <tenant-id>

# ಡೀಫಾಲ್ಟ್ ಸಬ್ಸ್ಕ್ರಿಪ್ಶನ್ ಅನ್ನು ಹೊಂದಿಸಿ
az account set --subscription <subscription-id>
```

### ಸರ್ವೀಸ್ ಪ್ರಿಂಸಿಪಲ್ ಪ್ರಾಮಾಣೀಕರಣ
CI/CD ಪೈಪ್ಲೈನ್ಗಳಿಗಾಗಿ:
```bash
# ವಾತಾವರಣ ಚರಗಳನ್ನು ಹೊಂದಿಸಿ
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# ಅಥವಾ ನೇರವಾಗಿ ಸಂರಚಿಸಿ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ
Azure-ಹೋಸ್ಟ್ ಮಾಡಿದ ಪರಿಸರಗಳಿಗಾಗಿ:
```bash
# ನಿರ್ವಹಿತ ಐಡೆಂಟಿಟಿ ಪ್ರಮಾಣೀಕರಣವನ್ನು ಸಕ್ರಿಯಗೊಳಿಸಿ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ ಮೂಲಸೌಕರ್ಯ ಸಂರಚನೆ

### Bicep ಪರಿಮಾಣಗಳು
ইಂಫ್ರಾಸ್ಟ್ರಕ್ತರ್ ಪರಿಮಾಣಗಳನ್ನು `infra/main.parameters.json` ನಲ್ಲಿ ಸಂರಚಿಸಿ:
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

### Terraform ಸಂರಚನೆ
Terraform ಪ್ರಾಜೆಕ್ಟ್‌ಗಳಿಗಾಗಿ, `infra/terraform.tfvars` ನಲ್ಲಿ ಸಂರಚಿಸಿ:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 ನಿಯೋಜನೆ ಸಂರಚನೆ

### ಬಿಲ್ಡ್ ಸಂರಚನೆ
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

### ಡಾಕರ್ ಸಂರಚನೆ
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
ಉದಾಹರಣೆ `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 ಉನ್ನತ ಸಂರಚನೆ

### ಕಸ್ಟಮ್ ಸಂಸಾಧನ ಹೆಸರಿಸುವಿಕೆ
```bash
# ಹೆಸರೀಕರಣ ನಿಯಮಗಳನ್ನು ನಿಗದಿಪಡಿಸಿ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### ನೆಟ್‌ವರ್ಕ್ ಸಂರಚನೆ
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### ಮಾನಿಟರಿಂಗ್ ಸಂರಚನೆ
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

## 🎯 ಪರಿಸರ-ನಿರ್ದಿಷ್ಟ ಸಂರಚನೆಗಳು

### ಅಭಿವೃದ್ಧಿ ಪರಿಸರ
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### ಉತ್ಪಾದನಾ ಪರಿಸರ
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 ಸಂರಚನಾ ಪರಿಶೀಲನೆ

### ಸಂರಚನೆಯನ್ನು ಪರಿಶೀಲಿಸಿ
```bash
# ಕಾನ್ಫಿಗರೇಶನ್ ಸಿಂಟ್ಯಾಕ್ಸ್ ಪರಿಶೀಲಿಸಿ
azd config validate

# ಪರಿಸರ ಚರಗಳನ್ನು ಪರೀಕ್ಷಿಸಿ
azd env get-values

# ಮೂಲಸೌಕರ್ಯವನ್ನು ಪರಿಶೀಲಿಸಿ
azd provision --dry-run
```

### ಸಂರಚನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳು
ಪರಿಶೀಲನಾ ಸ್ಕ್ರಿಪ್ಟ್‌ಗಳನ್ನು `scripts/` ನಲ್ಲಿ ರಚಿಸಿ:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ಆವಶ್ಯಕ ವಾತಾವರಣ ಚರಗಳನ್ನು ಪರಿಶೀಲಿಸಿ
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# azure.yaml ಫೈಲ್‌ನ ವಾಕ್ಯರಚನೆಯನ್ನು ಮಾನ್ಯಗೊಳಿಸಿ
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 ಉತ್ತಮ ಅಭ್ಯಾಸಗಳು

### 1. ಪರಿಸರ ಚರಗಳನ್ನು ಬಳಸಿರಿ
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. ಸಂರಚನಾ ಫೈಲ್‌ಗಳನ್ನು ಸಂಘಟಿಸಿ
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

### 3. ವರ್ಜನ್ ನಿಯಂತ್ರಣದ ಪರಿಗಣನೆಗಳು
```bash
# .gitignore
.azure/*/config.json         # ಪರಿಸರ ಸಂರಚನೆಗಳು (ಸಂಪನ್ಮೂಲ IDಗಳನ್ನು ಒಳಗೊಂಡಿವೆ)
.azure/*/.env               # ಪರಿಸರ ಚರಗಳು (ರಹಸ್ಯಗಳನ್ನು ಒಳಗೊಂಡಿರಬಹುದು)
.env                        # ಸ್ಥಳೀಯ ಪರಿಸರ ಕಡತ
```

### 4. ಸಂರಚನಾ ಡಾಕ್ಯುಮೆಂಟೇಷನ್
ನಿಮ್ಮ ಸಂರಚನೆಯನ್ನು `CONFIG.md` ನಲ್ಲಿ ದಾಖಲೆ ಮಾಡಿ:
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

## 🎯 ಕೈಗೊಳ್ಳುವ ಅಭ್ಯಾಸ ವ್ಯಾಯಾಮಗಳು

### ಅಭ್ಯಾಸ 1: ಬಹು-ಪರಿಸರ ಸಂರಚನೆ (15 ನಿಮಿಷಗಳು)

**ಲಕ್ಷ್ಯ**: ವಿಭಿನ್ನ ಸೆಟ್ಟಿಂಗ್ಸ್‌ಗಳೊಂದಿಗೆ ಮೂರು ಪರಿಸರಗಳನ್ನು ರಚಿಸಿ ಮತ್ತು ಸಂರಚಿಸಿ

```bash
# ವಿಕಾಸ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# ಸ್ಟೇಜಿಂಗ್ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# ಉತ್ಪಾದನಾ ಪರಿಸರವನ್ನು ರಚಿಸಿ
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ಪ್ರತಿ ಪರಿಸರವನ್ನು ಪರಿಶೀಲಿಸಿ
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**ಯಶಸ್ವಿ ಸೂಚ್ಯಂಕಗಳು:**
- [ ] ಮೂವರು ಪರಿಸರಗಳು ಯಶಸ್ವಿಯಾಗಿ ರಚಿಸಲ್ಪಟ್ಟಿವೆ
- [ ] ಪ್ರತಿಯೊಂದು ಪರಿಸರವನ್ನೂ ವಿಭಿನ್ನ ಸಂರಚನೆ ಇದೆ
- [ ] ದೋಷವಿಲ್ಲದೆ ಪರಿಸರಗಳ ನಡುವೆ ಬದಲಾಗಲು ಸಾಧ್ಯ
- [ ] `azd env list` ಎಲ್ಲಾ ಮೂರು ಪರಿಸರಗಳನ್ನೂ ತೋರಿಸುತ್ತದೆ

### ಅಭ್ಯಾಸ 2: ಗುಪ್ತ ನಿರ್ವಹಣೆ (10 ನಿಮಿಷಗಳು)

**ಲಕ್ಷ್ಯ**: ಸಂವೇದನಾಶೀಲ ಡೇಟಾದೊಂದಿಗೆ ಸುರಕ್ಷಿತ ಸಂರಚನೆ ಅಭ್ಯಾಸ ಮಾಡಿ

```bash
# ರಹಸ್ಯಗಳನ್ನು ನಿಗದಿಮಾಡಿ (ಫಲಿತಾಂಶದಲ್ಲಿ ತೋರಿಸಲಾಗುವುದಿಲ್ಲ)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ಗೌಪ್ಯವಲ್ಲದ ಸಂರಚನೆಯನ್ನು ನಿಗದಿಮಾಡಿ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ಪರಿಸರವನ್ನು ವೀಕ್ಷಿಸಿ (ರಹಸ್ಯಗಳನ್ನು ರೆಡ್ಯಾಕ್ಟ್ ಮಾಡಬೇಕು)
azd env get-values

# ರಹಸ್ಯಗಳು ಸಂಗ್ರಹಗೊಂಡಿರುವುದನ್ನು ಪರಿಶೀಲಿಸಿ
azd env get DB_PASSWORD  # ವಾಸ್ತವ ಮೌಲ್ಯವನ್ನು ತೋರಿಸಬೇಕು
```

**ಯಶಸ್ವಿ ಸೂಚ್ಯಂಕಗಳು:**
- [ ] ಗುಪ್ತಾಂಶಗಳನ್ನು ಟರ್ಮಿನಲ್‌ನಲ್ಲಿ ಪ್ರದರ್ಶಿಸದೇ ಸಂಗ್ರಹಿಸಲಾಗಿದೆ
- [ ] `azd env get-values` ರಹಸ್ಯಗಳನ್ನು ಅಡಗಿಸಿ ತೋರಿಸುತ್ತದೆ
- [ ] ಪ್ರತ್ಯೇಕ `azd env get <SECRET_NAME>` ನಿಂದ ನೈಜ ಮೌಲ್ಯವನ್ನು ಪಡೆಯಬಹುದು

## ಮುಂದಿನ ಹಂತಗಳು

- [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md) - ಪ್ರಾಯೋಗಿಕವಾಗಿ ಸಂರಚನೆಯನ್ನು ಅನ್ವಯಿಸಿ
- [ವಿತರಣಾ ಮಾರ್ಗದರ್ಶಿ](../chapter-04-infrastructure/deployment-guide.md) - ನಿಯೋಜನೆಗಾಗಿ ಸಂರಚನೆಯನ್ನು ಬಳಸಿರಿ
- [ಸಂಪನ್ಮೂಲ ಒದಗಿಕೆ](../chapter-04-infrastructure/provisioning.md) - ಉತ್ಪಾದನೆಗೆ ತಯಾರಾದ ಸಂರಚನೆಗಳು

## ಉಲ್ಲೇಖಗಳು

- [azd ಸಂರಚನಾ ಉಲ್ಲೇಖ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml ಸ್ಕೀಮಾ](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ಪರಿಸರ ಚರಗಳು](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ಅಧ್ಯಾಯ ದಿಕ್ಕುಸೂಚನೆ:**
- **📚 ಕೋರ್ಸ್ ಮನೆ**: [AZD For Beginners](../../README.md)
- **📖 ಪ್ರಸ್ತುತ ಅಧ್ಯಾಯ**: ಅಧ್ಯಾಯ 3 - ಸಂರಚನೆ ಮತ್ತು ಪ್ರಾಮಾಣೀಕರಣ
- **⬅️ ಹಿಂದಿನ**: [ನಿಮ್ಮ ಮೊದಲ ಪ್ರಾಜೆಕ್ಟ್](first-project.md)
- **➡️ ಮುಂದಿನ**: [ಅಧ್ಯಾಯ 4: ಕೋಡ್ ರೂಪದ ಮೂಲಸೌಕರ्य](../chapter-04-infrastructure/deployment-guide.md)
- **ಮುಂದಿನ ಪಾಠ**: [ನಿಮ್ಮ 첫ಪ್ರಾಜೆಕ್ಟ್](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ಜವಾಬ್ದಾರಿ ನಿರಾಕರಣೆ:

ಈ ಡಾಕ್ಯುಮೆಂಟ್ ಅನ್ನು AI ಅನುವಾದ ಸೇವೆ [Co-op Translator](https://github.com/Azure/co-op-translator) ಬಳಸಿ ಅನುವದಿಸಲಾಗಿದೆ. ನಾವು ನಿಖರತೆಗಾಗಿ ಪ್ರಯತ್ನಿಸಿದರೂ ಸಹ, ಸ್ವಯಂಚಾಲಿತ ಅನುವಾದಗಳಲ್ಲಿ ದೋಷಗಳು ಅಥವಾ ತಪ್ಪುಗಳು ಇರಬಹುದೆಂದು ದಯವಿಟ್ಟು ಗೊತ್ತಿರಲಿ. ಮೂಲ ದಸ್ತಾವೇಜನ್ನು ಅದರ ಸ್ಥಳೀಯ ಭಾಷೆಯಲ್ಲಿ ಅಧಿಕೃತ ಮೂಲವಾಗಿ ಪರಿಗಣಿಸಲು ಸೂಚಿಸಲಾಗುತ್ತದೆ. ಮಹತ್ವದ ಮಾಹಿತಿಗಾಗಿ ವೃತ್ತಿಪರ ಮಾನವ ಅನುವಾದವನ್ನು ಶಿಫಾರಸು ಮಾಡಲಾಗುತ್ತದೆ. ಈ ಅನುವಾದದ ಬಳಕೆಯಿಂದ ಉಂಟಾಗುವ ಯಾವುದೇ ಅಶುಧ್ಧಿ ಅಥವಾ తప్పಾದ ಅರ್ಥಗಾರಿಕೆಗಾಗಿ ನಾವು ಜವಾಬ್ದಾರರಾಗುವುದಿಲ್ಲ.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->