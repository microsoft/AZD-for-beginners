# คู่มือการตั้งค่า

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 3 - การตั้งค่าและการพิสูจน์ตัวตน
- **⬅️ ก่อนหน้า**: [โปรเจกต์แรกของคุณ](first-project.md)
- **➡️ ถัดไป**: [คู่มือการดีพลอย](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 บทถัดไป**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)

## บทนำ

คู่มืออย่างละเอียดนี้ครอบคลุมทุกแง่มุมของการตั้งค่า Azure Developer CLI เพื่อกระบวนการพัฒนาและการดีพลอยที่เหมาะสม คุณจะได้เรียนรู้เกี่ยวกับลำดับชั้นของการตั้งค่า การจัดการสภาพแวดล้อม วิธีการพิสูจน์ตัวตน และรูปแบบการตั้งค่าที่ซับซ้อนซึ่งช่วยให้การดีพลอยบน Azure มีประสิทธิภาพและปลอดภัย

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้ คุณจะสามารถ:
- เชี่ยวชาญในลำดับชั้นการตั้งค่า azd และเข้าใจการจัดลำดับความสำคัญของการตั้งค่า
- ตั้งค่าการตั้งค่าระดับโลกและเฉพาะโครงการได้อย่างมีประสิทธิภาพ
- จัดการหลายสภาพแวดล้อมที่มีการตั้งค่าต่างกัน
- นำรูปแบบการพิสูจน์ตัวตนและการให้สิทธิ์อย่างปลอดภัยมาใช้
- เข้าใจรูปแบบการตั้งค่าขั้นสูงสำหรับสถานการณ์ที่ซับซ้อน

## ผลลัพธ์การเรียนรู้

หลังจากจบบทเรียนนี้ คุณจะสามารถ:
- ตั้งค่า azd เพื่อการทำงานพัฒนาที่เหมาะสม
- ตั้งค่าและจัดการหลายสภาพแวดล้อมสำหรับการดีพลอย
- นำแนวทางการจัดการการตั้งค่าอย่างปลอดภัยมาใช้
- แก้ไขปัญหาที่เกี่ยวข้องกับการตั้งค่า
- ปรับแต่งพฤติกรรม azd ให้เหมาะสมกับความต้องการเฉพาะขององค์กร

คู่มืออย่างละเอียดนี้ครอบคลุมทุกแง่มุมของการตั้งค่า Azure Developer CLI เพื่อกระบวนการพัฒนาและการดีพลอยที่เหมาะสม

## ทำความเข้าใจเกี่ยวกับ AI Agents ในโปรเจกต์ azd

ถ้าคุณเป็นมือใหม่กับ AI agents นี่คือวิธีคิดง่าย ๆ เกี่ยวกับพวกมันในโลกของ azd

### เอเจนต์คืออะไร?

เอเจนต์คือซอฟต์แวร์ที่สามารถรับคำขอ วิเคราะห์เหตุผล และดำเนินการ — มักจะโดยการเรียกใช้โมเดล AI, ค้นหาข้อมูล หรือเรียกใช้บริการอื่น ๆ ในโปรเจกต์ azd เอเจนต์เป็นเพียงหนึ่งใน **บริการ** เช่นเดียวกับเว็บฟรอนเอนด์หรือ API แบ็คเอนด์ของคุณ

### เอเจนต์รวมอยู่ในโครงสร้างโปรเจกต์ azd อย่างไร

โปรเจกต์ azd ประกอบด้วยสามชั้น: **โครงสร้างพื้นฐาน**, **โค้ด**, และ **การตั้งค่า** เอเจนต์จะเชื่อมต่อกับชั้นเหล่านี้ในลักษณะเดียวกับบริการอื่น ๆ:

| ชั้น | หน้าที่สำหรับแอปแบบดั้งเดิม | หน้าที่สำหรับเอเจนต์ |
|-------|-------------------------------------|---------------------------|
| **โครงสร้างพื้นฐาน** (`infra/`) | จัดเตรียมเว็บแอปและฐานข้อมูล | จัดเตรียมเอ็นด์พอยต์โมเดล AI, ดัชนีการค้นหา หรือโฮสต์เอเจนต์ |
| **โค้ด** (`src/`) | เก็บซอร์สโค้ดฟรอนท์เอนด์และ API | เก็บตรรกะเอเจนต์และคำสั่ง prompt |
| **การตั้งค่า** (`azure.yaml`) | ระบุบริการและเป้าหมายโฮสต์ | ระบุเอเจนต์เป็นบริการ ชี้ไปที่โค้ดและโฮสต์ของมัน |

### บทบาทของ `azure.yaml`

คุณไม่จำเป็นต้องจดจำไวยากรณ์ตอนนี้ โดยในแนวคิด `azure.yaml` คือไฟล์ที่บอก azd ว่า: *"นี่คือบริการที่ประกอบเป็นแอปของฉัน และนี่คือที่ตั้งของโค้ดพวกมัน"*

เมื่อโปรเจกต์ของคุณมี AI agent `azure.yaml` ก็แค่ระบุเอเจนต์เป็นหนึ่งในบริการ azd ก็จะรู้ว่าต้องจัดเตรียมโครงสร้างพื้นฐานที่เหมาะสม (เช่น Microsoft Foundry Models endpoint หรือ Container App ที่โฮสต์เอเจนต์) และดีพลอยโค้ดเอเจนต์ของคุณ — เหมือนกับเว็บแอปหรือ API

นั่นหมายความว่าไม่มีอะไรใหม่ที่ต้องเรียนรู้พื้นฐาน ถ้าคุณเข้าใจวิธีที่ azd จัดการเว็บเซอร์วิส คุณก็เข้าใจวิธีจัดการเอเจนต์แล้ว

## ลำดับชั้นการตั้งค่า

azd ใช้ระบบการตั้งค่าแบบลำดับชั้น:
1. **แฟล็กจากบรรทัดคำสั่ง** (ลำดับความสำคัญสูงสุด)
2. **ตัวแปรสภาพแวดล้อม**
3. **การตั้งค่าโปรเจกต์ในเครื่อง** (`.azd/config.json`)
4. **การตั้งค่าผู้ใช้ระดับโลก** (`~/.azd/config.json`)
5. **ค่าตั้งต้น** (ลำดับความสำคัญต่ำสุด)

## การตั้งค่าระดับโลก

### การตั้งค่าค่าตั้งต้นระดับโลก
```bash
# ตั้งค่าการสมัครใช้งานเริ่มต้น
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ตั้งค่าตำแหน่งเริ่มต้น
azd config set defaults.location "eastus2"

# ตั้งค่านิยามการตั้งชื่อกลุ่มทรัพยากรเริ่มต้น
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ดูการกำหนดค่าทั่วโลกทั้งหมด
azd config show

# ลบการกำหนดค่า
azd config unset defaults.location
```

### การตั้งค่าทั่วไประดับโลก
```bash
# การตั้งค่าความชอบในการพัฒนา
azd config set alpha.enable true                    # เปิดใช้งานฟีเจอร์อัลฟ่า
azd config set telemetry.enabled false             # ปิดใช้งานการส่งข้อมูลสถิติ
azd config set output.format json                  # ตั้งค่ารูปแบบผลลัพธ์

# การตั้งค่าความปลอดภัย
azd config set auth.useAzureCliCredential true     # ใช้ Azure CLI สำหรับการยืนยันตัวตน
azd config set tls.insecure false                  # บังคับใช้การตรวจสอบ TLS

# การปรับแต่งประสิทธิภาพ
azd config set provision.parallelism 5             # การสร้างทรัพยากรแบบขนาน
azd config set deploy.timeout 30m                  # เวลาหมดเขตการปรับใช้
```

## 🏗️ การตั้งค่าโปรเจกต์

### โครงสร้าง azure.yaml
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

#### การตั้งค่าภาษาที่เฉพาะเจาะจง
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
# สร้างสภาพแวดล้อมใหม่
azd env new development

# สร้างด้วยตำแหน่งที่เฉพาะเจาะจง
azd env new staging --location "westus2"

# สร้างจากแม่แบบ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### การตั้งค่าสภาพแวดล้อม
แต่ละสภาพแวดล้อมมีการตั้งค่าของตัวเองใน `.azure/<env-name>/config.json`:

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

### ตัวแปรสภาพแวดล้อม
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
# (ควรคืนค่าเป็นค่าว่าง)
```

### เทมเพลตสภาพแวดล้อม
สร้าง `.azure/env.template` เพื่อการตั้งค่าสภาพแวดล้อมที่สอดคล้องกัน:
```bash
# ตัวแปรที่จำเป็น
AZURE_SUBSCRIPTION_ID=
AZURE_LOCATION=

# การตั้งค่าแอปพลิเคชัน
DATABASE_NAME=
API_BASE_URL=
STORAGE_ACCOUNT_NAME=

# การตั้งค่าการพัฒนาเพิ่มเติม
DEBUG=false
LOG_LEVEL=info
```

## 🔐 การตั้งค่าการพิสูจน์ตัวตน

### การผสานรวม Azure CLI
```bash
# ใช้ข้อมูลประจำตัว Azure CLI (ค่าเริ่มต้น)
azd config set auth.useAzureCliCredential true

# เข้าสู่ระบบด้วยผู้เช่าเฉพาะ
az login --tenant <tenant-id>

# ตั้งค่าการสมัครสมาชิกเริ่มต้น
az account set --subscription <subscription-id>
```

### การพิสูจน์ตัวตนด้วย Service Principal
สำหรับสายงาน CI/CD:
```bash
# ตั้งค่าตัวแปรสภาพแวดล้อม
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# หรือกำหนดค่าตรง ๆ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
สำหรับสภาพแวดล้อมที่โฮสต์บน Azure:
```bash
# เปิดใช้งานการยืนยันตัวตนด้วย managed identity
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
สำหรับโปรเจกต์ Terraform ตั้งค่าใน `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 การตั้งค่าการดีพลอย

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
# ตั้งค่านิยามการตั้งชื่อ
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

## 🎯 การตั้งค่าสภาพแวดล้อมเฉพาะ

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
# ตรวจสอบไวยากรณ์การกำหนดค่า
azd config validate

# ทดสอบตัวแปรแวดล้อม
azd env get-values

# ตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน
azd provision --dry-run
```

### สคริปต์การตั้งค่า
สร้างสคริปต์ตรวจสอบในโฟลเดอร์ `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ตรวจสอบตัวแปรสภาพแวดล้อมที่จำเป็น
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# ตรวจสอบไวยากรณ์ไฟล์ azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 แนวปฏิบัติที่ดีที่สุด

### 1. ใช้ตัวแปรสภาพแวดล้อม
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

### 3. การพิจารณาการควบคุมเวอร์ชัน
```bash
# .gitignore
.azure/*/config.json         # การตั้งค่าสภาพแวดล้อม (ประกอบด้วยรหัสทรัพยากร)
.azure/*/.env               # ตัวแปรสภาพแวดล้อม (อาจมีความลับ)
.env                        # ไฟล์สภาพแวดล้อมในเครื่อง
```

### 4. เอกสารการตั้งค่า
จดบันทึกการตั้งค่าใน `CONFIG.md`:
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

## 🎯 แบบฝึกหัดปฏิบัติ

### แบบฝึกหัด 1: การตั้งค่าหลายสภาพแวดล้อม (15 นาที)

**เป้าหมาย**: สร้างและตั้งค่าสามสภาพแวดล้อมที่มีการตั้งค่าต่างกัน

```bash
# สร้างสภาพแวดล้อมการพัฒนา
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# สร้างสภาพแวดล้อมการทดสอบ
azd env new staging
azd env set LOG_LEVEL info
azd env set ENABLE_TELEMETRY true
azd env set APP_INSIGHTS_SAMPLING 50

# สร้างสภาพแวดล้อมการผลิต
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
- [ ] สร้างสภาพแวดล้อมสามแห่งสำเร็จ
- [ ] แต่ละสภาพแวดล้อมมีการตั้งค่าที่ไม่ซ้ำกัน
- [ ] สามารถสลับระหว่างสภาพแวดล้อมโดยไม่มีข้อผิดพลาด
- [ ] คำสั่ง `azd env list` แสดงสภาพแวดล้อมทั้งสาม

### แบบฝึกหัด 2: การจัดการความลับ (10 นาที)

**เป้าหมาย**: ฝึกฝนการตั้งค่าที่ปลอดภัยด้วยข้อมูลที่ไวต่อความลับ

```bash
# ตั้งค่าสิ่งลับ (จะแสดงไม่ในผลลัพธ์)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ตั้งค่าคอนฟิกที่ไม่ใช่ความลับ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ดูสภาพแวดล้อม (ความลับควรถูกลบออก)
azd env get-values

# ตรวจสอบว่าสิ่งลับถูกเก็บไว้
azd env get DB_PASSWORD  # ควรแสดงค่าจริง
```

**เกณฑ์ความสำเร็จ:**
- [ ] เก็บความลับโดยไม่แสดงในเทอร์มินัล
- [ ] คำสั่ง `azd env get-values` แสดงความลับที่ซ่อนไว้
- [ ] คำสั่ง `azd env get <SECRET_NAME>` ดึงค่าจริงออกมาได้

## ขั้นตอนถัดไป

- [โปรเจกต์แรกของคุณ](first-project.md) - นำการตั้งค่าไปใช้งานจริง
- [คู่มือการดีพลอย](../chapter-04-infrastructure/deployment-guide.md) - ใช้การตั้งค่าสำหรับการดีพลอย
- [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md) - การตั้งค่าสำหรับสภาพแวดล้อมจริง

## เอกสารอ้างอิง

- [เอกสารอ้างอิงการตั้งค่า azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [โครงสร้าง azure.yaml Schema](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ตัวแปรสภาพแวดล้อม](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกคอร์ส**: [AZD For Beginners](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 3 - การตั้งค่าและการพิสูจน์ตัวตน
- **⬅️ ก่อนหน้า**: [โปรเจกต์แรกของคุณ](first-project.md)
- **➡️ บทถัดไป**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)
- **บทเรียนถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ข้อจำกัดความรับผิดชอบ**:  
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษาอัตโนมัติ [Co-op Translator](https://github.com/Azure/co-op-translator) แม้ว่าเราจะพยายามให้การแปลมีความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นฉบับควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์ผู้เชี่ยวชาญ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความผิดใด ๆ ที่เกิดจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->