# คู่มือการกำหนดค่า

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - การกำหนดค่า & การพิสูจน์ตัวตน
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next**: [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)

## บทนำ

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกด้านของการกำหนดค่า Azure Developer CLI เพื่อเวิร์กโฟลว์การพัฒนาและการปรับใช้ที่เหมาะสม คุณจะได้เรียนรู้เกี่ยวกับลำดับชั้นการกำหนดค่า การจัดการสภาพแวดล้อม วิธีการพิสูจน์ตัวตน และรูปแบบการกำหนดค่าขั้นสูงที่ช่วยให้การปรับใช้บน Azure มีประสิทธิภาพและปลอดภัย

## เป้าหมายการเรียนรู้

เมื่อสิ้นสุดบทเรียนนี้ คุณจะ:
- เชี่ยวชาญลำดับชั้นการกำหนดค่า azd และเข้าใจวิธีการจัดลำดับความสำคัญของการตั้งค่า
- กำหนดค่าการตั้งค่าทั่วระบบและสำหรับโครงการแต่ละโครงการอย่างมีประสิทธิภาพ
- จัดการหลายสภาพแวดล้อมที่มีการกำหนดค่าต่างกัน
- นำรูปแบบการพิสูจน์ตัวตนและการอนุญาตที่ปลอดภัยไปใช้
- เข้าใจรูปแบบการกำหนดค่าขั้นสูงสำหรับสถานการณ์ที่ซับซ้อน

## ผลลัพธ์การเรียนรู้

หลังจากทำบทเรียนนี้เสร็จ คุณจะสามารถ:
- กำหนดค่า azd สำหรับเวิร์กโฟลว์การพัฒนาที่เหมาะสม
- ตั้งค่าและจัดการหลายสภาพแวดล้อมสำหรับการปรับใช้
- นำแนวปฏิบัติการจัดการการกำหนดค่าที่ปลอดภัยไปใช้
- แก้ไขปัญหาที่เกี่ยวข้องกับการกำหนดค่า
- ปรับแต่งพฤติกรรมของ azd ให้ตรงตามข้อกำหนดขององค์กร

คู่มือฉบับสมบูรณ์นี้ครอบคลุมทุกด้านของการกำหนดค่า Azure Developer CLI เพื่อเวิร์กโฟลว์การพัฒนาและการปรับใช้ที่เหมาะสม

## ลำดับชั้นการกำหนดค่า

azd ใช้ระบบการกำหนดค่าแบบลำดับชั้น:
1. **ตัวเลือกบรรทัดคำสั่ง** (ลำดับความสำคัญสูงสุด)
2. **ตัวแปรสภาพแวดล้อม**
3. **การกำหนดค่าโครงการท้องถิ่น** (`.azd/config.json`)
4. **การกำหนดค่าผู้ใช้ระดับโลก** (`~/.azd/config.json`)
5. **ค่าเริ่มต้น** (ลำดับความสำคัญต่ำสุด)

## การกำหนดค่าระดับโลก

### การตั้งค่าค่าพื้นฐานระดับโลก
```bash
# ตั้งค่าการสมัครใช้งานเริ่มต้น
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

### การตั้งค่าระดับโลกทั่วไป
```bash
# การตั้งค่าความชอบในการพัฒนา
azd config set alpha.enable true                    # เปิดใช้งานฟีเจอร์อัลฟ่า
azd config set telemetry.enabled false             # ปิดการรวบรวมข้อมูลการใช้งาน
azd config set output.format json                  # ตั้งค่ารูปแบบผลลัพธ์

# การตั้งค่าความปลอดภัย
azd config set auth.useAzureCliCredential true     # ใช้ Azure CLI สำหรับการยืนยันตัวตน
azd config set tls.insecure false                  # บังคับตรวจสอบ TLS

# การปรับแต่งประสิทธิภาพ
azd config set provision.parallelism 5             # การสร้างทรัพยากรแบบขนาน
azd config set deploy.timeout 30m                  # ระยะเวลาสูงสุดของการปรับใช้
```

## 🏗️ การกำหนดค่าโครงการ

### โครงสร้างของ `azure.yaml`
ไฟล์ `azure.yaml` เป็นหัวใจของโครงการ azd ของคุณ:

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

### ตัวเลือกการกำหนดค่าบริการ

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

#### การตั้งค่าตามภาษา
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

# สร้างพร้อมตำแหน่งที่ระบุ
azd env new staging --location "westus2"

# สร้างจากแม่แบบ
azd env new production --subscription "prod-sub-id" --location "eastus"
```

### การกำหนดค่าสภาพแวดล้อม
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

### ตัวแปรสภาพแวดล้อม
```bash
# ตั้งค่าตัวแปรเฉพาะของสภาพแวดล้อม
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

# ยืนยันการลบ
azd env get-values | grep DEBUG
# (ไม่ควรคืนค่าอะไร)
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

# การตั้งค่าการพัฒนา (ไม่บังคับ)
DEBUG=false
LOG_LEVEL=info
```

## 🔐 การกำหนดค่าการพิสูจน์ตัวตน

### การรวม Azure CLI
```bash
# ใช้ข้อมูลรับรองของ Azure CLI (ค่าเริ่มต้น)
azd config set auth.useAzureCliCredential true

# เข้าสู่ระบบด้วย tenant ที่ระบุ
az login --tenant <tenant-id>

# ตั้งค่าการสมัครใช้งานเริ่มต้น
az account set --subscription <subscription-id>
```

### การพิสูจน์ตัวตนด้วย Service Principal
สำหรับโครงงาน CI/CD:
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
# เปิดใช้งานการตรวจสอบสิทธิ์ด้วยตัวตนที่มีการจัดการ
azd config set auth.useMsi true
azd config set auth.msiClientId "your-managed-identity-client-id"
```

## 🏗️ การกำหนดค่าโครงสร้างพื้นฐาน

### พารามิเตอร์ Bicep
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

### การกำหนดค่า Terraform
สำหรับโปรเจกต์ Terraform ให้กำหนดค่าใน `infra/terraform.tfvars`:
```hcl
environment_name = "${AZURE_ENV_NAME}"
location = "${AZURE_LOCATION}"
app_service_sku = "B1"
database_sku = "GP_Gen5_2"
```

## 🚀 การกำหนดค่าการปรับใช้

### การกำหนดค่าการสร้าง
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

### การกำหนดค่า Docker
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

## 🔧 การกำหนดค่าขั้นสูง

### การตั้งชื่อทรัพยากรที่กำหนดเอง
```bash
# ตั้งค่าข้อตกลงการตั้งชื่อ
azd config set naming.resourceGroup "rg-{project}-{env}-{location}"
azd config set naming.storageAccount "{project}{env}sa"
azd config set naming.keyVault "kv-{project}-{env}"
```

### การกำหนดค่าเครือข่าย
```yaml
# In azure.yaml
infra:
  provider: bicep
  parameters:
    vnetAddressPrefix: "10.0.0.0/16"
    subnetAddressPrefix: "10.0.1.0/24"
    enablePrivateEndpoints: true
```

### การกำหนดค่าการตรวจสอบ
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

## 🎯 การกำหนดค่าตามสภาพแวดล้อม

### สภาพแวดล้อมการพัฒนา
```bash
# .azure/การพัฒนา/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### สภาพแวดล้อมสเตจ
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

## 🔍 การตรวจสอบความถูกต้องของการกำหนดค่า

### ตรวจสอบการกำหนดค่า
```bash
# ตรวจสอบไวยากรณ์การกำหนดค่า
azd config validate

# ทดสอบตัวแปรสภาพแวดล้อม
azd env get-values

# ตรวจสอบความถูกต้องของโครงสร้างพื้นฐาน
azd provision --dry-run
```

### สคริปต์การกำหนดค่า
สร้างสคริปต์การตรวจสอบใน `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ตรวจสอบตัวแปรแวดล้อมที่จำเป็น
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# ตรวจสอบไวยากรณ์ของไฟล์ azure.yaml
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

### 2. จัดระเบียบไฟล์การกำหนดค่า
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

### 3. ข้อควรพิจารณาเกี่ยวกับการควบคุมเวอร์ชัน
```bash
# .gitignore
.azure/*/config.json         # การกำหนดค่าสภาพแวดล้อม (มีรหัสทรัพยากร)
.azure/*/.env               # ตัวแปรสภาพแวดล้อม (อาจประกอบด้วยข้อมูลลับ)
.env                        # ไฟล์สภาพแวดล้อมท้องถิ่น
```

### 4. เอกสารการกำหนดค่า
จัดทำเอกสารการกำหนดค่าของคุณใน `CONFIG.md`:
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

## 🎯 แบบฝึกหัดเชิงปฏิบัติ

### แบบฝึกหัด 1: การกำหนดค่าหลายสภาพแวดล้อม (15 นาที)

**เป้าหมาย**: สร้างและกำหนดค่าสภาพแวดล้อมสามชุดที่มีการตั้งค่าต่างกัน

```bash
# สร้างสภาพแวดล้อมสำหรับการพัฒนา
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# สร้างสภาพแวดล้อมสเตจ
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
- [ ] สร้างสภาพแวดล้อมสามชุดสำเร็จ
- [ ] แต่ละสภาพแวดล้อมมีการกำหนดค่าที่ต่างกัน
- [ ] สามารถสลับระหว่างสภาพแวดล้อมได้โดยไม่มีข้อผิดพลาด
- [ ] `azd env list` แสดงสภาพแวดล้อมทั้งสาม

### แบบฝึกหัด 2: การจัดการความลับ (10 นาที)

**เป้าหมาย**: ฝึกการจัดการความลับอย่างปลอดภัยกับข้อมูลที่ละเอียดอ่อน

```bash
# ตั้งค่าความลับ (ไม่แสดงในผลลัพธ์)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ตั้งค่าการกำหนดค่าที่ไม่ใช่ความลับ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ดูสภาพแวดล้อม (ความลับควรถูกปกปิด)
azd env get-values

# ตรวจสอบว่าความลับถูกจัดเก็บ
azd env get DB_PASSWORD  # ควรแสดงค่าจริง
```

**เกณฑ์ความสำเร็จ:**
- [ ] เก็บความลับโดยไม่แสดงในเทอร์มินัล
- [ ] `azd env get-values` แสดงความลับที่ถูกปกปิด
- [ ] คำสั่ง `azd env get <SECRET_NAME>` แต่ละคำสั่งดึงค่าจริงได้

## ขั้นตอนถัดไป

- [Your First Project](first-project.md) - ใช้การกำหนดค่าในการปฏิบัติ
- [Deployment Guide](../chapter-04-infrastructure/deployment-guide.md) - ใช้การกำหนดค่าสำหรับการปรับใช้
- [Provisioning Resources](../chapter-04-infrastructure/provisioning.md) - การกำหนดค่าพร้อมใช้งานสำหรับการผลิต

## เอกสารอ้างอิง

- [เอกสารอ้างอิงการกำหนดค่า azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [สคีมา `azure.yaml`](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ตัวแปรสภาพแวดล้อม](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**Chapter Navigation:**
- **📚 Course Home**: [AZD For Beginners](../../README.md)
- **📖 Current Chapter**: Chapter 3 - การกำหนดค่า & การพิสูจน์ตัวตน
- **⬅️ Previous**: [Your First Project](first-project.md)
- **➡️ Next Chapter**: [Chapter 4: Infrastructure as Code](../chapter-04-infrastructure/deployment-guide.md)
- **Next Lesson**: [Your First Project](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
ข้อจำกัดความรับผิดชอบ:
เอกสารฉบับนี้ได้รับการแปลโดยใช้บริการแปลภาษาโดย AI [Co-op Translator](https://github.com/Azure/co-op-translator) แม้เราจะมุ่งมั่นเพื่อความถูกต้อง โปรดทราบว่าการแปลอัตโนมัติอาจมีความผิดพลาดหรือความไม่ถูกต้องได้ เอกสารต้นฉบับในภาษาเดิมควรถูกถือเป็นแหล่งข้อมูลที่เป็นทางการ สำหรับข้อมูลที่มีความสำคัญ แนะนำให้ใช้การแปลโดยนักแปลมืออาชีพ เราจะไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดใดๆ ที่เกิดจากการใช้การแปลฉบับนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->