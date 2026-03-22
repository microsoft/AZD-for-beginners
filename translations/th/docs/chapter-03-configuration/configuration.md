# Configuration Guide

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: บทที่ 3 - การกำหนดค่า & การตรวจสอบสิทธิ์
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)

## Introduction

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกด้านของการกำหนดค่า Azure Developer CLI เพื่อให้ได้ประสิทธิภาพสูงสุดในกระบวนการพัฒนาและการปรับใช้ คุณจะได้เรียนรู้เกี่ยวกับลำดับชั้นของการกำหนดค่า การจัดการสภาพแวดล้อม วิธีการตรวจสอบสิทธิ์ และรูปแบบการกำหนดค่าขั้นสูงที่ช่วยให้การปรับใช้ Azure มีประสิทธิภาพและปลอดภัย

## Learning Goals

เมื่อจบบทเรียนนี้แล้ว คุณจะสามารถ:
- เชี่ยวชาญลำดับชั้นการกำหนดค่า azd และเข้าใจวิธีการจัดลำดับความสำคัญของการตั้งค่า
- กำหนดค่าการตั้งค่าระดับโลกและเฉพาะโครงการได้อย่างมีประสิทธิภาพ
- จัดการหลายสภาพแวดล้อมที่มีการกำหนดค่าต่างกัน
- นำรูปแบบการตรวจสอบสิทธิ์ที่ปลอดภัยมาใช้
- เข้าใจรูปแบบการกำหนดค่าขั้นสูงสำหรับสถานการณ์ซับซ้อน

## Learning Outcomes

หลังจากจบบทเรียนนี้แล้ว คุณจะสามารถ:
- กำหนดค่า azd เพื่อกระบวนการพัฒนาที่ดีที่สุด
- ตั้งค่าและจัดการหลายสภาพแวดล้อมสำหรับการปรับใช้
- นำแนวปฏิบัติการจัดการการกำหนดค่าที่ปลอดภัยมาใช้
- แก้ไขปัญหาที่เกี่ยวข้องกับการกำหนดค่า
- ปรับแต่งพฤติกรรม azd ให้เหมาะกับความต้องการเฉพาะขององค์กร

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกด้านของการกำหนดค่า Azure Developer CLI เพื่อให้ได้ประสิทธิภาพสูงสุดในกระบวนการพัฒนาและการปรับใช้

## Understanding AI Agents in an azd Project

ถ้าคุณยังไม่คุ้นเคยกับ AI agents นี่คือวิธีง่าย ๆ ที่จะคิดถึงพวกมันในโลกของ azd

### What Is an Agent?

เอเย่นต์คือซอฟต์แวร์ชิ้นหนึ่งที่สามารถรับคำขอ วิเคราะห์ และดำเนินการ—โดยมักจะเรียกใช้โมเดล AI ค้นหาข้อมูล หรือเรียกใช้บริการอื่น ๆ ในโปรเจกต์ azd เอเย่นต์คือ **บริการ** อีกหนึ่งชนิดที่อยู่ข้าง ๆ เว็บฟรอนต์เอนด์หรือ Backend API ของคุณ

### How Agents Fit Into the azd Project Structure

โปรเจกต์ azd ประกอบด้วยสามชั้น: **โครงสร้างพื้นฐาน**, **โค้ด**, และ **การกำหนดค่า** เอเย่นต์เชื่อมต่อกับชั้นเหล่านี้เช่นเดียวกับบริการอื่น:

| Layer | What It Does for a Traditional App | What It Does for an Agent |
|-------|-------------------------------------|---------------------------|
| **Infrastructure** (`infra/`) | สร้างเว็บแอปและฐานข้อมูล | สร้างจุดเชื่อมต่อโมเดล AI, ดัชนีค้นหา หรือโฮสต์สำหรับเอเย่นต์ |
| **Code** (`src/`) | ประกอบด้วยโค้ดฟรอนต์เอนด์และ API ของคุณ | ประกอบด้วยตรรกะของเอเย่นต์และการกำหนด prompt |
| **Configuration** (`azure.yaml`) | แสดงรายการบริการและเป้าหมายโฮสต์ | แสดงรายการเอเย่นต์เป็นบริการ ชี้ไปที่โค้ดและโฮสต์ของมัน |

### The Role of `azure.yaml`

คุณไม่จำเป็นต้องจำไวยากรณ์ในตอนนี้ โดยแนวคิดแล้ว `azure.yaml` คือไฟล์ที่คุณบอก azd ว่า: *"นี่คืบริการที่ประกอบเป็นแอปของฉัน และนี่คือที่อยู่ของโค้ดของพวกมัน"*

เมื่อโปรเจกต์ของคุณมี AI agent, `azure.yaml` ก็แค่แสดงรายการเอเย่นต์นั้นเป็นหนึ่งในบริการ azd ก็จะรู้ว่าต้องสร้างโครงสร้างพื้นฐานที่ถูกต้อง (เช่น Microsoft Foundry Models endpoint หรือ Container App เพื่อโฮสต์เอเย่นต์) และปรับใช้โค้ดเอเย่นต์ของคุณ—เหมือนกับแอปเว็บหรือ API

ซึ่งหมายความว่าไม่มีอะไรใหม่ที่ต้องเรียนรู้ หากคุณเข้าใจวิธีจัดการเว็บเซอร์วิสของ azd คุณก็เข้าใจวิธีจัดการเอเย่นต์แล้ว

## Configuration Hierarchy

azd ใช้ระบบการกำหนดค่าลำดับชั้น:
1. **แฟลกคำสั่ง CLI** (มีลำดับความสำคัญสูงสุด)
2. **ตัวแปรสภาพแวดล้อม**
3. **การกำหนดค่าโครงการในพื้นที่** (`.azd/config.json`)
4. **การกำหนดค่าผู้ใช้ระดับโลก** (`~/.azd/config.json`)
5. **ค่าตั้งต้น** (ลำดับความสำคัญต่ำสุด)

## Global Configuration

### Setting Global Defaults
```bash
# ตั้งค่าการสมัครสมาชิกเริ่มต้น
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ตั้งค่าตำแหน่งเริ่มต้น
azd config set defaults.location "eastus2"

# ตั้งค่ารูปแบบการตั้งชื่อกลุ่มทรัพยากรเริ่มต้น
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ดูการกำหนดค่าทั่วโลกทั้งหมด
azd config list

# ลบการกำหนดค่า
azd config unset defaults.location
```

### Common Global Settings
```bash
# ค่ากำหนดการพัฒนา
azd config set alpha.enable true                    # เปิดใช้งานฟีเจอร์เบต้า
azd config set telemetry.enabled false             # ปิดการใช้งานการส่งข้อมูลวิเคราะห์
azd config set output.format json                  # ตั้งค่ารูปแบบผลลัพธ์

# การตั้งค่าความปลอดภัย
azd config set auth.useAzureCliCredential true     # ใช้ Azure CLI สำหรับการยืนยันตัวตน
azd config set tls.insecure false                  # บังคับการตรวจสอบ TLS

# ปรับแต่งประสิทธิภาพ
azd config set provision.parallelism 5             # การสร้างทรัพยากรแบบขนาน
azd config set deploy.timeout 30m                  # เวลาหมดอายุของการปรับใช้
```

## 🏗️ Project Configuration

### azure.yaml Structure
ไฟล์ `azure.yaml` คือหัวใจของโปรเจกต์ azd ของคุณ:

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
# สร้างสภาพแวดล้อมใหม่
azd env new development

# สร้างด้วยตำแหน่งที่เจาะจง
azd env new staging --location "westus2"

# สร้างจากเทมเพลต
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### Environment Configuration
แต่ละสภาพแวดล้อมมีการกำหนดค่าของตัวเองใน `.azure/<env-name>/config.json`:

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
# ตั้งค่าตัวแปรเฉพาะสภาพแวดล้อม
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ดูตัวแปรสภาพแวดล้อม
azd env get-values

# ผลลัพธ์ที่คาดไว้:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ลบตัวแปรสภาพแวดล้อม
azd env unset DEBUG

# ตรวจสอบการลบ
azd env get-values | grep DEBUG
# (ควรไม่มีผลลัพธ์)
```

### Environment Templates
สร้าง `.azure/env.template` เพื่อการตั้งค่าสภาพแวดล้อมที่สอดคล้องกัน:
```bash
# ตัวแปรที่จำเป็น
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# การตั้งค่าแอปพลิเคชัน
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# การตั้งค่าการพัฒนาที่ไม่บังคับ
DEBUG=false
LOG_LEVEL=info
```

## 🔐 Authentication Configuration

### Azure CLI Integration
```bash
# ใช้ข้อมูลรับรอง Azure CLI (ค่าเริ่มต้น)
azd config set auth.useAzureCliCredential true

# เข้าสู่ระบบด้วย tenant ที่ระบุ
az login --tenant <tenant-id>

# ตั้งค่าการสมัครสมาชิกเริ่มต้น
az account set --subscription <subscription-id>
```

### Service Principal Authentication
สำหรับ pipelines CI/CD:
```bash
# ตั้งค่าตัวแปรสภาพแวดล้อม
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# หรือกำหนดค่าโดยตรง
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
สำหรับสภาพแวดล้อมที่โฮสต์บน Azure:
```bash
# เปิดใช้งานการรับรองความถูกต้องด้วยตัวตนที่จัดการ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ Infrastructure Configuration

### Bicep Parameters
กำหนดค่าพารามิเตอร์โครงสร้างพื้นฐานใน `infra/main.parameters.json`:
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
สำหรับโปรเจกต์ Terraform, กำหนดค่าใน `infra/terraform.tfvars`:
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
 ตัวอย่าง `Dockerfile`: https://github.com/Azure-Samples/deepseek-go/blob/main/azure.yaml 

## 🔧 Advanced Configuration

### Custom Resource Naming
```bash
# ตั้งค่าข้อตกลงการตั้งชื่อ
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
# .azure/development/.env
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
# .azure/production/.env
DEBUG=false
LOG_LEVEL=error
ENABLE_MONITORING=true
ENABLE_SECURITY_HEADERS=true
```

## 🔍 Configuration Validation

### Validate Configuration
```bash
# ตรวจสอบไวยากรณ์การกำหนดค่า
azd config validate

# ทดสอบตัวแปรสภาพแวดล้อม
azd env get-values

# ตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน
azd provision --dry-run
```

### Configuration Scripts
สร้างสคริปต์ตรวจสอบใน `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ตรวจสอบตัวแปรแวดล้อมที่จำเป็น
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# ตรวจสอบไวยากรณ์ azure.yaml
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
.azure/*/config.json         # การตั้งค่าสภาพแวดล้อม (มีรหัสทรัพยากร)
.azure/*/.env               # ตัวแปรสภาพแวดล้อม (อาจมีความลับ)
.env                        # ไฟล์สภาพแวดล้อมในเครื่อง
```

### 4. Configuration Documentation
บันทึกเอกสารการกำหนดค่าใน `CONFIG.md`:
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

**เป้าหมาย**: สร้างและกำหนดค่าทั้งสามสภาพแวดล้อมที่มีการตั้งค่าต่างกัน

```bash
# สร้างสภาพแวดล้อมการพัฒนา
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# สร้างสภาพแวดล้อมทดสอบ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# สร้างสภาพแวดล้อมสำหรับการผลิต
azd env new production
azd env set LOG_LEVEL error
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 10

# ตรวจสอบแต่ละสภาพแวดล้อม
azd env select dev && azd env get-values
azd env select staging && azd env get-values
azd env select production && azd env get-values
```

**เกณฑ์ความสำเร็จ:**
- [ ] สร้างสภาพแวดล้อมทั้งสามสำเร็จ
- [ ] แต่ละสภาพแวดล้อมมีการกำหนดค่าที่ไม่ซ้ำกัน
- [ ] สามารถสลับสภาพแวดล้อมโดยไม่มีข้อผิดพลาด
- [ ] `azd env list` แสดงสภาพแวดล้อมทั้งสามทั้งหมด

### Exercise 2: Secret Management (10 minutes)

**เป้าหมาย**: ฝึกการกำหนดค่าที่ปลอดภัยสำหรับข้อมูลสำคัญ

```bash
# ตั้งค่าความลับ (ไม่แสดงในผลลัพธ์)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ตั้งค่าการตั้งค่าที่ไม่ใช่ความลับ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ดูสภาพแวดล้อม (ความลับควรถูกปกปิด)
azd env get-values

# ตรวจสอบว่ามีการจัดเก็บความลับ
azd env get DB_PASSWORD  # ควรแสดงค่าจริง
```

**เกณฑ์ความสำเร็จ:**
- [ ] เก็บความลับโดยไม่แสดงในเทอร์มินัล
- [ ] `azd env get-values` แสดงความลับในรูปแบบพราง
- [ ] `azd env get <SECRET_NAME>` แต่ละตัวเรียกดูค่าจริงได้

## Next Steps

- [Your First Project](first-project.md) - ประยุกต์ใช้การกำหนดค่าในทางปฏิบัติ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ใช้การกำหนดค่าสำหรับการปรับใช้
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - การกำหนดค่าสำหรับพร้อมใช้งานในสภาพแวดล้อมจริง

## References

- [azd Configuration Reference](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [Environment Variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: บทที่ 3 - การกำหนดค่า & การตรวจสอบสิทธิ์
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลด้วย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะพยายามให้การแปลถูกต้องที่สุด แต่โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้องได้ เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้บริการแปลโดยมนุษย์มืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่คลาดเคลื่อนที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->