<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "8747981a94aac0f40d833cc37e9c0001",
  "translation_date": "2025-09-12T20:59:04+00:00",
  "source_file": "docs/getting-started/configuration.md",
  "language_code": "th"
}
-->
# คู่มือการตั้งค่า

**ก่อนหน้า:** [AZD Basics](azd-basics.md) | **ถัดไป:** [First Project](first-project.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกแง่มุมของการตั้งค่า Azure Developer CLI เพื่อการพัฒนาและการปรับใช้งานที่มีประสิทธิภาพ คุณจะได้เรียนรู้เกี่ยวกับลำดับชั้นของการตั้งค่า การจัดการสภาพแวดล้อม วิธีการยืนยันตัวตน และรูปแบบการตั้งค่าขั้นสูงที่ช่วยให้การปรับใช้งาน Azure มีประสิทธิภาพและปลอดภัย

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- เข้าใจลำดับชั้นของการตั้งค่า azd และวิธีการจัดลำดับความสำคัญของการตั้งค่า
- ตั้งค่าระดับโลกและระดับโปรเจกต์ได้อย่างมีประสิทธิภาพ
- จัดการหลายสภาพแวดล้อมที่มีการตั้งค่าต่างกัน
- ใช้รูปแบบการยืนยันตัวตนและการอนุญาตที่ปลอดภัย
- เข้าใจรูปแบบการตั้งค่าขั้นสูงสำหรับสถานการณ์ที่ซับซ้อน

## ผลลัพธ์การเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะสามารถ:
- ตั้งค่า azd เพื่อการพัฒนาที่มีประสิทธิภาพ
- ตั้งค่าและจัดการหลายสภาพแวดล้อมการปรับใช้งาน
- ใช้แนวทางการจัดการการตั้งค่าที่ปลอดภัย
- แก้ไขปัญหาที่เกี่ยวข้องกับการตั้งค่า
- ปรับแต่งพฤติกรรมของ azd ให้เหมาะสมกับความต้องการขององค์กร

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกแง่มุมของการตั้งค่า Azure Developer CLI เพื่อการพัฒนาและการปรับใช้งานที่มีประสิทธิภาพ

## ลำดับชั้นของการตั้งค่า

azd ใช้ระบบการตั้งค่าแบบลำดับชั้น:
1. **Command-line flags** (ลำดับความสำคัญสูงสุด)
2. **Environment variables**
3. **การตั้งค่าโปรเจกต์ในเครื่อง** (`.azd/config.json`)
4. **การตั้งค่าผู้ใช้ระดับโลก** (`~/.azd/config.json`)
5. **ค่าเริ่มต้น** (ลำดับความสำคัญต่ำสุด)

## การตั้งค่าระดับโลก

### การตั้งค่าค่าเริ่มต้นระดับโลก
```bash
# Set default subscription
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# Set default location
azd config set defaults.location "eastus2"

# Set default resource group naming convention
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# View all global configuration
azd config list

# Remove a configuration
azd config unset defaults.location
```

### การตั้งค่าระดับโลกที่พบบ่อย
```bash
# Development preferences
azd config set alpha.enable true                    # Enable alpha features
azd config set telemetry.enabled false             # Disable telemetry
azd config set output.format json                  # Set output format

# Security settings
azd config set auth.useAzureCliCredential true     # Use Azure CLI for auth
azd config set tls.insecure false                  # Enforce TLS verification

# Performance tuning
azd config set provision.parallelism 5             # Parallel resource creation
azd config set deploy.timeout 30m                  # Deployment timeout
```

## 🏗️ การตั้งค่าโปรเจกต์

### โครงสร้าง azure.yaml
ไฟล์ `azure.yaml` เป็นหัวใจสำคัญของโปรเจกต์ azd ของคุณ:

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

### ตัวเลือกการตั้งค่าบริการ

#### ประเภทโฮสต์
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

#### การตั้งค่าที่เฉพาะเจาะจงตามภาษา
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

## 🌟 การจัดการสภาพแวดล้อม

### การสร้างสภาพแวดล้อม
```bash
# Create a new environment
azd env new development

# Create with specific location
azd env new staging --location "westus2"

# Create from template
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### การตั้งค่าสภาพแวดล้อม
แต่ละสภาพแวดล้อมมีการตั้งค่าใน `.azure/<env-name>/config.json`:

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
# Set environment-specific variables
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# View environment variables
azd env get-values

# Remove environment variable
azd env unset DEBUG
```

### เทมเพลตสภาพแวดล้อม
สร้าง `.azure/env.template` เพื่อการตั้งค่าสภาพแวดล้อมที่สอดคล้องกัน:
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

## 🔐 การตั้งค่ายืนยันตัวตน

### การผสานรวม Azure CLI
```bash
# Use Azure CLI credentials (default)
azd config set auth.useAzureCliCredential true

# Login with specific tenant
az login --tenant <tenant-id>

# Set default subscription
az account set --subscription <subscription-id>
```

### การยืนยันตัวตนด้วย Service Principal
สำหรับ CI/CD pipelines:
```bash
# Set environment variables
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# Or configure directly
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
สำหรับสภาพแวดล้อมที่โฮสต์บน Azure:
```bash
# Enable managed identity authentication
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ การตั้งค่าโครงสร้างพื้นฐาน

### พารามิเตอร์ Bicep
ตั้งค่าพารามิเตอร์โครงสร้างพื้นฐานใน `infra/main.parameters.json`:
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

### การตั้งค่า Terraform
สำหรับโปรเจกต์ Terraform ให้ตั้งค่าใน `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 การตั้งค่าการปรับใช้งาน

### การตั้งค่าการสร้าง
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

### การตั้งค่า Docker
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
ตัวอย่าง `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 การตั้งค่าขั้นสูง

### การตั้งชื่อทรัพยากรแบบกำหนดเอง
```bash
# Set naming conventions
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### การตั้งค่าเครือข่าย
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### การตั้งค่าการตรวจสอบ
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

## 🎯 การตั้งค่าที่เฉพาะเจาะจงตามสภาพแวดล้อม

### สภาพแวดล้อมการพัฒนา
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### สภาพแวดล้อมการทดสอบ
```bash
# .azure/staging/.env
DEBUG=false
LOG_LEVEL=info
ENABLE_MONITORING=true
USE_PRODUCTION_APIS=true
```

### สภาพแวดล้อมการผลิต
```bash
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 การตรวจสอบการตั้งค่า

### การตรวจสอบการตั้งค่า
```bash
# Check configuration syntax
azd config validate

# Test environment variables
azd env get-values

# Validate infrastructure
azd provision --dry-run
```

### สคริปต์การตั้งค่า
สร้างสคริปต์การตรวจสอบใน `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# Check required environment variables
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# Validate azure.yaml syntax
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 แนวทางปฏิบัติที่ดีที่สุด

### 1. ใช้ Environment Variables
```yaml
# Good: Use environment variables
database:
  connectionString: ${DATABASE_CONNECTION_STRING}

# Avoid: Hardcode sensitive values
database:
  connectionString: "Server=myserver;Database=mydb;User=myuser;Password=mypassword"
```

### 2. จัดระเบียบไฟล์การตั้งค่า
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

### 3. การพิจารณาเรื่องการควบคุมเวอร์ชัน
```bash
# .gitignore
.azure/*/config.json         # Environment configs (contain resource IDs)
.azure/*/.env               # Environment variables (may contain secrets)
.env                        # Local environment file
```

### 4. เอกสารประกอบการตั้งค่า
จัดทำเอกสารการตั้งค่าใน `CONFIG.md`:
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

## ขั้นตอนถัดไป

- [Your First Project](first-project.md) - ใช้การตั้งค่าในทางปฏิบัติ
- [Deployment Guide](../deployment/deployment-guide.md) - ใช้การตั้งค่าสำหรับการปรับใช้งาน
- [Provisioning Resources](../deployment/provisioning.md) - การตั้งค่าที่พร้อมสำหรับการผลิต

## อ้างอิง

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**ก่อนหน้า:** [AZD Basics](azd-basics.md) | **ถัดไป:** [First Project](first-project.md)
- **บทเรียนถัดไป**: [Your First Project](first-project.md)

---

**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาดั้งเดิมควรถือเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ ขอแนะนำให้ใช้บริการแปลภาษามืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดที่เกิดจากการใช้การแปลนี้