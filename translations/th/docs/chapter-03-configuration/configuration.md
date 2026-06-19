# คู่มือการกำหนดค่า

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 3 - การกำหนดค่า & การตรวจสอบสิทธิ์
- **⬅️ ก่อนหน้า**: [โปรเจกต์แรกของคุณ](first-project.md)
- **➡️ ถัดไป**: [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md)
- **🚀 บทถัดไป**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)

## บทนำ

คู่มือครอบคลุมทุกแง่มุมของการกำหนดค่า Azure Developer CLI สำหรับเวิร์กโฟลว์การพัฒนาและการปรับใช้อย่างเหมาะสม คุณจะได้เรียนรู้เกี่ยวกับลำดับชั้นของการกำหนดค่า การจัดการสภาพแวดล้อม วิธีการตรวจสอบสิทธิ์ และรูปแบบการกำหนดค่าขั้นสูงที่ช่วยให้การปรับใช้ Azure มีประสิทธิภาพและปลอดภัย

## เป้าหมายการเรียนรู้

เมื่อจบบทเรียนนี้คุณจะสามารถ:
- เชี่ยวชาญลำดับชั้นการกำหนดค่า azd และเข้าใจว่าการตั้งค่านั้นมีลำดับความสำคัญอย่างไร
- กำหนดค่าการตั้งค่าทั่วไปและเฉพาะโปรเจกต์ได้อย่างมีประสิทธิภาพ
- จัดการหลายสภาพแวดล้อมที่มีการกำหนดค่าต่างกัน
- นำรูปแบบการตรวจสอบสิทธิ์และอนุญาตที่ปลอดภัยมาปฏิบัติ
- เข้าใจกระบวนการกำหนดค่าขั้นสูงสำหรับสถานการณ์ที่ซับซ้อน

## ผลลัพธ์การเรียนรู้

หลังจากเรียนจบบทนี้ คุณจะสามารถ:
- กำหนดค่า azd เพื่อเวิร์กโฟลว์การพัฒนาที่เหมาะสม
- ตั้งค่าและจัดการสภาพแวดล้อมการปรับใช้หลายรายการ
- นำแนวปฏิบัติการจัดการการกำหนดค่าที่ปลอดภัยมาใช้
- แก้ไขปัญหาที่เกี่ยวข้องกับการกำหนดค่า
- ปรับแต่งพฤติกรรมของ azd เพื่อความต้องการเฉพาะขององค์กร

คู่มือครอบคลุมทุกแง่มุมของการกำหนดค่า Azure Developer CLI สำหรับเวิร์กโฟลว์การพัฒนาและการปรับใช้อย่างเหมาะสม

## ทำความเข้าใจเอเจนต์ AI ในโปรเจกต์ azd

หากคุณยังไม่รู้จักเอเจนต์ AI นี่คือวิธีง่ายๆ ในการคิดเกี่ยวกับพวกมันในโลกของ azd

### เอเจนต์คืออะไร?

เอเจนต์คือซอฟต์แวร์ที่สามารถรับคำขอ วิเคราะห์ และดำเนินการได้—มักจะโดยการเรียกใช้โมเดล AI ค้นหาข้อมูล หรือเรียกใช้บริการอื่น ในโปรเจกต์ azd เอเจนต์เป็นเพียง **บริการ** ตัวหนึ่งควบคู่ไปกับส่วนหน้าของเว็บหรือแบ็กเอนด์ API ของคุณ

### เอเจนต์อยู่ในโครงสร้างโปรเจกต์ azd อย่างไร

โปรเจกต์ azd ประกอบด้วยสามชั้น: **โครงสร้างพื้นฐาน** **โค้ด** และ **การกำหนดค่า** เอเจนต์เชื่อมต่อกับชั้นเหล่านี้เช่นเดียวกับบริการอื่นๆ:

| ชั้น | สิ่งที่ทำสำหรับแอปแบบดั้งเดิม | สิ่งที่ทำสำหรับเอเจนต์ |
|-------|-------------------------------|-------------------------|
| **โครงสร้างพื้นฐาน** (`infra/`) | จัดเตรียมเว็บแอปและฐานข้อมูล | จัดเตรียมจุดสิ้นสุดโมเดล AI, ดัชนีการค้นหา หรือโฮสต์เอเจนต์ |
| **โค้ด** (`src/`) | มีซอร์สโค้ด frontend และ API ของคุณ | มีตรรกะเอเจนต์และคำสั่ง prompt |
| **การกำหนดค่า** (`azure.yaml`) | รายการบริการและเป้าหมายโฮสต์ | ระบุเอเจนต์ในฐานะบริการโดยชี้ไปยังโค้ดและโฮสต์ |

### บทบาทของ `azure.yaml`

คุณไม่จำเป็นต้องจดจำไวยากรณ์ตอนนี้ ในเชิงนามธรรม `azure.yaml` คือไฟล์ที่คุณบอก azd ว่า: *"นี่คือบริการที่เป็นโปรแกรมของฉัน และนี่คือที่อยู่ของโค้ดของพวกเขา"*

เมื่อโปรเจกต์ของคุณมีเอเจนต์ AI `azure.yaml` ก็แค่ระบุเอเจนต์เป็นหนึ่งในบริการ azd ก็จะรู้ว่าจะจัดเตรียมโครงสร้างพื้นฐานให้เหมาะสม (เช่นจุดสิ้นสุด Microsoft Foundry Models หรือ Container App สำหรับโฮสต์เอเจนต์) และปรับใช้โค้ดเอเจนต์ของคุณ—เช่นเดียวกับเว็บแอปหรือ API

นั่นหมายความว่าไม่มีอะไรใหม่ที่ต้องเรียนรู้เป็นพิเศษ หากคุณเข้าใจวิธีที่ azd จัดการบริการเว็บ คุณก็เข้าใจวิธีที่มันจัดการเอเจนต์

## ลำดับชั้นการกำหนดค่า

azd ใช้ระบบการกำหนดค่าลำดับชั้นดังนี้:
1. **แฟลกในบรรทัดคำสั่ง** (ลำดับความสำคัญสูงสุด)
2. **ตัวแปรสภาพแวดล้อม**
3. **การกำหนดค่าโปรเจกต์ภายใน** (`.azd/config.json`)
4. **การกำหนดค่าผู้ใช้ทั่วโลก** (`~/.azd/config.json`)
5. **ค่าพื้นฐาน (ดีฟอลต์)** (ลำดับความสำคัญต่ำสุด)

## การกำหนดค่าทั่วโลก

### การตั้งค่าพื้นฐานทั่วโลก
```bash
# ตั้งค่าการสมัครสมาชิกเริ่มต้น
azd config set defaults.subscription "12345678-1234-1234-1234-123456789abc"

# ตั้งค่าตำแหน่งเริ่มต้น
azd config set defaults.location "eastus2"

# ตั้งค่ากฎการตั้งชื่อกลุ่มทรัพยากรเริ่มต้น
azd config set defaults.resourceGroupName "rg-{env-name}-{location}"

# ดูการกำหนดค่าทั่วโลกทั้งหมด
azd config show

# ลบการกำหนดค่า
azd config unset defaults.location
```

### การตั้งค่าทั่วไปสำหรับทั่วโลก
```bash
# การตั้งค่าความชอบในการพัฒนา
azd config set alpha.enable true                    # เปิดใช้งานฟีเจอร์อัลฟ่า
azd config set telemetry.enabled false             # ปิดการใช้งานการเก็บข้อมูลทางเทเลเมทรี
azd config set output.format json                  # ตั้งค่ารูปแบบผลลัพธ์

# การตั้งค่าความปลอดภัย
azd config set auth.useAzureCliCredential true     # ใช้ Azure CLI สำหรับการยืนยันตัวตน
azd config set tls.insecure false                  # บังคับการตรวจสอบ TLS

# การปรับแต่งประสิทธิภาพ
azd config set provision.parallelism 5             # การสร้างทรัพยากรแบบขนาน
azd config set deploy.timeout 30m                  # เวลาหมดเวลาในการปรับใช้
```

## 🏗️ การกำหนดค่าโปรเจกต์

### โครงสร้างของ azure.yaml
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

#### การตั้งค่าตามภาษาโปรแกรม
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

# สร้างโดยกำหนดตำแหน่งเฉพาะ
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
# ตั้งค่าตัวแปรเฉพาะสำหรับสภาพแวดล้อม
azd env set DATABASE_URL "postgresql://user:pass@host:5432/db"
azd env set API_KEY "secret-api-key"
azd env set DEBUG "true"

# ดูตัวแปรสภาพแวดล้อม
azd env get-values

# ผลลัพธ์ที่คาดหวัง:
# DATABASE_URL=postgresql://user:pass@host:5432/db
# API_KEY=secret-api-key
# DEBUG=true

# ลบตัวแปรสภาพแวดล้อม
azd env unset DEBUG

# ตรวจสอบการลบ
azd env get-values | grep DEBUG
# (ควรจะไม่มีอะไรคืนกลับ)
```

### เทมเพลตสภาพแวดล้อม
สร้าง `.azure/env.template` เพื่อการตั้งค่าสภาพแวดล้อมที่เป็นมาตรฐาน:
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

### การแชร์สภาพแวดล้อมระหว่างทีม

เมื่อมีมากกว่าหนึ่งคนทำงานในโปรเจกต์ คุณต้องตกลงกันว่า **อะไรบ้างที่จะถูกนำไปกับรีโพและอะไรที่จะเก็บไว้ในเครื่องท้องถิ่น** azd เก็บสภาพแวดล้อมแต่ละตัวไว้ในโฟลเดอร์ `.azure/` และไม่ควรทั้งหมดถูกคอมมิตขึ้นรีโพ

**สิ่งที่อยู่ใน `.azure/`:**

```
.azure/
├── config.json              # which env is currently selected (local)
└── <env-name>/
    ├── config.json          # subscription, location, resource IDs
    └── .env                 # environment variables (may contain secrets!)
```

**สิ่งที่ควรระบุใน gitignore.** `.gitignore` เริ่มต้นของ azd ละเว้น `.azure/` อยู่แล้ว ควรคงไว้แบบนี้—ไฟล์ `.env` อาจมีข้อมูลลับ และรหัสทรัพยากร (resource ID) เฉพาะสำหรับผู้ที่จัดเตรียมไว้ สมาชิกแต่ละคนจึงสร้าง **สภาพแวดล้อมของตัวเอง** บนเครื่องของตน:

```bash
# นักพัฒนาทุกคนจะรันสิ่งนี้ครั้งเดียวเพื่อสร้างสภาพแวดล้อมที่แยกตัวเองของตนเอง
azd env new dev-alice
azd up
```

**สลับระหว่างสภาพแวดล้อม.** นักพัฒนาที่จัดการหลายสภาพแวดล้อมจะเลือกสภาพแวดล้อมที่ใช้งานก่อนรันคำสั่ง:

```bash
azd env list                 # ดูสภาพแวดล้อมท้องถิ่นทั้งหมดและกำหนดค่าเริ่มต้นว่าเป็นอันไหน
azd env select staging       # ทำให้ 'staging' เป็นสภาพแวดล้อมที่ใช้งานอยู่
azd env get-values           # ยืนยันว่าคุณชี้ไปที่อันที่ถูกต้องแล้ว
```

**ให้ค่าพื้นฐานที่ไม่ลับกับทีม.** คอมมิตเทมเพลต (เช่น `.azure/env.template` ด้านบน) เพื่อให้ทุกคนรู้ว่าควรกำหนดตัวแปรใด—แต่ห้ามคอมมิตค่าที่ถูกกรอกแล้ว สมาชิกใหม่คัดลอกเทมเพลตนี้และเติมค่าเอง

**สภาพแวดล้อมใน CI/CD.** ไพพ์ไลน์จะไม่อ่านโฟลเดอร์ `.azure/` ในเครื่องคุณ ให้จัดเตรียมค่าตัวแปรสภาพแวดล้อมเป็นตัวแปรหรือลับในไพพ์ไลน์ และ azd จะอ่านจากโปรเซสสภาพแวดล้อมแทน:

```bash
# ใน CI, azd อ่านค่าพวกนี้จาก environment ไม่ใช่จาก .azure/
export AZURE_ENV_NAME=production
export AZURE_LOCATION=eastus2
export AZURE_SUBSCRIPTION_ID=<sub-id>
azd provision --no-prompt
azd deploy --no-prompt
```

> **กฎทอง:** โค้ดโครงสร้างพื้นฐาน (`infra/`, `azure.yaml`) ใช้ร่วมกันใน Git; *สถานะและข้อมูลลับ* สภาพแวดล้อม (`.azure/`) แยกสำหรับผู้พัฒนาแต่ละคนและแต่ละไพพ์ไลน์ `azd pipeline config` จะตั้งค่าตัวแปรในไพพ์ไลน์ให้โดยอัตโนมัติ

## 🔐 การกำหนดค่าการตรวจสอบสิทธิ์

### การบูรณาการกับ Azure CLI
```bash
# ใช้ข้อมูลประจำตัว Azure CLI (ค่าเริ่มต้น)
azd config set auth.useAzureCliCredential true

# เข้าสู่ระบบด้วย tenant ที่ระบุ
az login --tenant <tenant-id>

# ตั้งค่าการสมัครสมาชิกเริ่มต้น
az account set --subscription <subscription-id>
```

### การตรวจสอบสิทธิ์ด้วย Service Principal
สำหรับไพพ์ไลน์ CI/CD:
```bash
# ตั้งค่าตัวแปรสภาพแวดล้อม
export AZURE_CLIENT_ID="your-client-id"
export AZURE_CLIENT_SECRET="your-client-secret"
export AZURE_TENANT_ID="your-tenant-id"

# หรือกำหนดค่าตรงๆ
azd config set auth.clientId "your-client-id"
azd config set auth.tenantId "your-tenant-id"
```

### Managed Identity
สำหรับสภาพแวดล้อมใน Azure:
```bash
# เปิดใช้งานการตรวจสอบสิทธิ์ด้วย Managed Identity
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
สำหรับโปรเจกต์ Terraform กำหนดค่าใน `infra/terraform.tfvars`:
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

### การตั้งชื่อทรัพยากรแบบกำหนดเอง
```bash
# กำหนดระเบียบการตั้งชื่อ
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

## 🎯 การกำหนดค่าสภาพแวดล้อมเฉพาะ

### สภาพแวดล้อมการพัฒนา
```bash
# .azure/development/.env
DEBUG=true
LOG_LEVEL=debug
ENABLE_HOT_RELOAD=true
MOCK_EXTERNAL_APIS=true
```

### สภาพแวดล้อมขั้นกลาง (Staging)
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

## 🔍 การยืนยันการกำหนดค่า

### การตรวจสอบการกำหนดค่า
```bash
# ตรวจสอบไวยากรณ์การกำหนดค่า
azd config validate

# ทดสอบตัวแปรสภาพแวดล้อม
azd env get-values

# ตรวจสอบโครงสร้างพื้นฐานให้ถูกต้อง
azd provision --dry-run
```

### สคริปต์การกำหนดค่า
สร้างสคริปต์ยืนยันในโฟลเดอร์ `scripts/`:

```bash
#!/bin/bash
# scripts/validate-config.sh

echo "Validating configuration..."

# ตรวจสอบตัวแปรสภาพแวดล้อมที่จำเป็น
if [ -z "$AZURE_SUBSCRIPTION_ID" ]; then
  echo "Error: AZURE_SUBSCRIPTION_ID not set"
  exit 1
fi

# ตรวจสอบไวยากรณ์ของ azure.yaml
if ! azd config validate; then
  echo "Error: Invalid azure.yaml configuration"
  exit 1
fi

echo "Configuration validation passed!"
```

## 🎓 แนวทางปฏิบัติที่ดีที่สุด

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

### 3. พิจารณาการควบคุมเวอร์ชัน
```bash
# .gitignore
.azure/*/config.json         # การตั้งค่าสภาพแวดล้อม (มีรหัสทรัพยากร)
.azure/*/.env               # ตัวแปรสภาพแวดล้อม (อาจมีความลับ)
.env                        # ไฟล์สภาพแวดล้อมภายในเครื่อง
```

### 4. เอกสารการกำหนดค่า
บันทึกเอกสารการกำหนดค่าในไฟล์ `CONFIG.md`:
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

### แบบฝึกหัด 1: การกำหนดค่าสภาพแวดล้อมหลายตัว (15 นาที)

**เป้าหมาย**: สร้างและกำหนดค่าสภาพแวดล้อม 3 ตัวที่มีการตั้งค่าต่างกัน

```bash
# สร้างสภาพแวดล้อมการพัฒนา
azd env new dev
azd env set LOG_LEVEL debug
azd env set ENABLE_TELEMETRY false
azd env set APP_INSIGHTS_SAMPLING 100

# สร้างสภาพแวดล้อมสเตจจิง
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
- [ ] สร้างสภาพแวดล้อมสามตัวได้สำเร็จ
- [ ] แต่ละสภาพแวดล้อมมีการกำหนดค่าที่ไม่เหมือนกัน
- [ ] สามารถสลับสภาพแวดล้อมได้โดยไม่มีข้อผิดพลาด
- [ ] `azd env list` แสดงสภาพแวดล้อมทั้งสามตัว

### แบบฝึกหัด 2: การจัดการความลับ (10 นาที)

**เป้าหมาย**: ฝึกการกำหนดค่าที่ปลอดภัยกับข้อมูลที่ละเอียดอ่อน

```bash
# ตั้งค่าความลับ (ไม่แสดงในผลลัพธ์)
azd env set DB_PASSWORD "$(openssl rand -base64 32)" --secret
azd env set API_KEY "sk-$(openssl rand -hex 16)" --secret

# ตั้งค่าคอนฟิกที่ไม่ใช่ความลับ
azd env set DB_HOST "mydb.postgres.database.azure.com"
azd env set DB_NAME "production_db"

# ดูสภาพแวดล้อม (ความลับควรถูกลบ)
azd env get-values

# ตรวจสอบว่าความลับถูกจัดเก็บแล้ว
azd env get DB_PASSWORD  # ควรแสดงค่าจริง
```

**เกณฑ์ความสำเร็จ:**
- [ ] เก็บความลับโดยไม่แสดงในเทอร์มินัล
- [ ] `azd env get-values` แสดงความลับแบบถูกปกปิด
- [ ] `azd env get <SECRET_NAME>` แต่ละคำสั่งดึงค่าจริงได้

## ขั้นตอนถัดไป

- [โปรเจกต์แรกของคุณ](first-project.md) - ปฏิบัติการกำหนดค่าในทางปฏิบัติ
- [คู่มือการปรับใช้](../chapter-04-infrastructure/deployment-guide.md) - ใช้การกำหนดค่าสำหรับการปรับใช้
- [การจัดเตรียมทรัพยากร](../chapter-04-infrastructure/provisioning.md) - การกำหนดค่าพร้อมสำหรับการผลิต

## เอกสารอ้างอิง

- [เอกสารอ้างอิงการกำหนดค่า azd](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference)
- [Schema ของ azure.yaml](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/azure-yaml-schema)
- [ตัวแปรสภาพแวดล้อม](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/reference/environment-variables)

---

**การนำทางบทเรียน:**
- **📚 หน้าแรกของหลักสูตร**: [AZD สำหรับผู้เริ่มต้น](../../README.md)
- **📖 บทปัจจุบัน**: บทที่ 3 - การกำหนดค่า & การตรวจสอบสิทธิ์
- **⬅️ ก่อนหน้า**: [โปรเจกต์แรกของคุณ](first-project.md)
- **➡️ บทถัดไป**: [บทที่ 4: โครงสร้างพื้นฐานในรูปแบบโค้ด](../chapter-04-infrastructure/deployment-guide.md)
- **บทเรียนถัดไป**: [โปรเจกต์แรกของคุณ](first-project.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**ปฏิเสธความรับผิดชอบ**:
เอกสารนี้ได้รับการแปลโดยใช้บริการแปลภาษา AI [Co-op Translator](https://github.com/Azure/co-op-translator) ขณะที่เราพยายามให้ความถูกต้อง โปรดทราบว่าการแปลโดยอัตโนมัติอาจมีข้อผิดพลาดหรือความไม่ถูกต้อง เอกสารต้นฉบับในภาษาต้นทางควรถูกพิจารณาเป็นแหล่งข้อมูลที่เชื่อถือได้ สำหรับข้อมูลที่สำคัญ แนะนำให้ใช้การแปลโดยมนุษย์มืออาชีพ เราไม่รับผิดชอบต่อความเข้าใจผิดหรือการตีความที่ผิดพลาดที่เกิดขึ้นจากการใช้การแปลนี้
<!-- CO-OP TRANSLATOR DISCLAIMER END -->